@implementation HDReferenceExtractionProcessingContext

- (HDReferenceExtractionProcessingContext)init
{
  HDReferenceExtractionProcessingContext *v2;
  NSMutableSet *v3;
  NSMutableSet *processedResources;
  NSMutableSet *v5;
  NSMutableSet *containedResourceIdentifiers;
  uint64_t v7;
  NSMapTable *unresolvedReferences;
  uint64_t v9;
  NSMapTable *resourcesWithUnresolvableReferences;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HDReferenceExtractionProcessingContext;
  v2 = -[HDReferenceExtractionProcessingContext init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    processedResources = v2->_processedResources;
    v2->_processedResources = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    containedResourceIdentifiers = v2->_containedResourceIdentifiers;
    v2->_containedResourceIdentifiers = v5;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    unresolvedReferences = v2->_unresolvedReferences;
    v2->_unresolvedReferences = (NSMapTable *)v7;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v9 = objc_claimAutoreleasedReturnValue();
    resourcesWithUnresolvableReferences = v2->_resourcesWithUnresolvableReferences;
    v2->_resourcesWithUnresolvableReferences = (NSMapTable *)v9;

  }
  return v2;
}

- (NSArray)privateCompleteResources
{
  NSArray *privateCompleteResources;

  privateCompleteResources = self->_privateCompleteResources;
  if (!privateCompleteResources)
  {
    -[HDReferenceExtractionProcessingContext _processResources](self, "_processResources");
    privateCompleteResources = self->_privateCompleteResources;
  }
  return privateCompleteResources;
}

- (NSArray)privateIncompleteResources
{
  NSArray *privateIncompleteResources;

  privateIncompleteResources = self->_privateIncompleteResources;
  if (!privateIncompleteResources)
  {
    -[HDReferenceExtractionProcessingContext _processResources](self, "_processResources");
    privateIncompleteResources = self->_privateIncompleteResources;
  }
  return privateIncompleteResources;
}

- (NSArray)privateUnresolvableReferences
{
  NSArray *privateUnresolvableReferences;

  privateUnresolvableReferences = self->_privateUnresolvableReferences;
  if (!privateUnresolvableReferences)
  {
    -[HDReferenceExtractionProcessingContext _processResources](self, "_processResources");
    privateUnresolvableReferences = self->_privateUnresolvableReferences;
  }
  return privateUnresolvableReferences;
}

- (void)_processResources
{
  uint64_t v3;
  void *v4;
  NSMapTable *resourcesWithUnresolvableReferences;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSMapTable *unresolvedReferences;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSMutableSet *containedResourceIdentifiers;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  NSMutableSet *obj;
  HDReferenceExtractionProcessingContext *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v30 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v31 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v34 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = self->_processedResources;
  v36 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v36)
  {
    v35 = *(_QWORD *)v42;
    v33 = self;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v42 != v35)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v3);
        resourcesWithUnresolvableReferences = self->_resourcesWithUnresolvableReferences;
        objc_msgSend(v4, "identifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable objectForKey:](resourcesWithUnresolvableReferences, "objectForKey:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v7, "count"))
        {
          v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", objc_msgSend(v7, "count"));
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          v9 = v7;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          if (v10)
          {
            v11 = v10;
            v12 = 0;
            v13 = *(_QWORD *)v38;
            do
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v38 != v13)
                  objc_enumerationMutation(v9);
                v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
                v12 |= objc_msgSend(v15, "hint");
                objc_msgSend(v15, "reference");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "addObject:", v16);

              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
            }
            while (v11);
          }
          else
          {
            v12 = 0;
          }

          v20 = (void *)MEMORY[0x24BE48978];
          objc_msgSend(v4, "JSONObject");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "sourceURL");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "FHIRVersion");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "receivedDate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "resourceObjectWithJSONObject:sourceURL:FHIRVersion:receivedDate:extractionHints:error:", v21, v22, v23, v24, v12, 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE489C8]), "initWithReferences:resource:", v8, v25);
          objc_msgSend(v34, "addObject:", v26);

          self = v33;
        }
        else
        {
          unresolvedReferences = self->_unresolvedReferences;
          objc_msgSend(v4, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMapTable objectForKey:](unresolvedReferences, "objectForKey:", v18);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v8, "count"))
          {
            v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE489C8]), "initWithReferences:resource:", v8, v4);
            objc_msgSend(v31, "addObject:", v19);

          }
          else
          {
            containedResourceIdentifiers = self->_containedResourceIdentifiers;
            objc_msgSend(v4, "identifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(containedResourceIdentifiers) = -[NSMutableSet containsObject:](containedResourceIdentifiers, "containsObject:", v28);

            if ((containedResourceIdentifiers & 1) == 0)
              objc_msgSend(v30, "addObject:", v4);
          }
        }

        ++v3;
      }
      while (v3 != v36);
      v29 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      v36 = v29;
    }
    while (v29);
  }

  -[HDReferenceExtractionProcessingContext setPrivateCompleteResources:](self, "setPrivateCompleteResources:", v30);
  -[HDReferenceExtractionProcessingContext setPrivateIncompleteResources:](self, "setPrivateIncompleteResources:", v31);
  -[HDReferenceExtractionProcessingContext setPrivateUnresolvableReferences:](self, "setPrivateUnresolvableReferences:", v34);

}

- (void)_reset
{
  -[HDReferenceExtractionProcessingContext setPrivateCompleteResources:](self, "setPrivateCompleteResources:", 0);
  -[HDReferenceExtractionProcessingContext setPrivateIncompleteResources:](self, "setPrivateIncompleteResources:", 0);
  -[HDReferenceExtractionProcessingContext setPrivateUnresolvableReferences:](self, "setPrivateUnresolvableReferences:", 0);
}

- (void)recordUnresolvedReference:(id)a3 forResource:(id)a4
{
  id v6;
  NSMapTable *unresolvedReferences;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSMapTable *v14;
  void *v15;
  id v16;

  v16 = a4;
  v6 = a3;
  -[HDReferenceExtractionProcessingContext _reset](self, "_reset");
  unresolvedReferences = self->_unresolvedReferences;
  objc_msgSend(v16, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](unresolvedReferences, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  v11 = v10;
  if (v10)
    v12 = v10;
  else
    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 1);
  v13 = v12;

  objc_msgSend(v13, "addObject:", v6);
  v14 = self->_unresolvedReferences;
  objc_msgSend(v16, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](v14, "setObject:forKey:", v13, v15);

}

- (void)recordUnresolvableReference:(id)a3 forResource:(id)a4 hint:(unint64_t)a5
{
  id v8;
  NSMapTable *resourcesWithUnresolvableReferences;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _HDUnresolvableReferenceHint *v16;
  NSMapTable *v17;
  void *v18;
  id v19;

  v19 = a4;
  v8 = a3;
  -[HDReferenceExtractionProcessingContext _reset](self, "_reset");
  resourcesWithUnresolvableReferences = self->_resourcesWithUnresolvableReferences;
  objc_msgSend(v19, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](resourcesWithUnresolvableReferences, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");
  v13 = v12;
  if (v12)
    v14 = v12;
  else
    v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 1);
  v15 = v14;

  v16 = -[_HDUnresolvableReferenceHint initWithReference:hint:]([_HDUnresolvableReferenceHint alloc], "initWithReference:hint:", v8, a5);
  objc_msgSend(v15, "addObject:", v16);
  v17 = self->_resourcesWithUnresolvableReferences;
  objc_msgSend(v19, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](v17, "setObject:forKey:", v15, v18);

}

- (void)recordProcessedResource:(id)a3
{
  id v4;

  v4 = a3;
  -[HDReferenceExtractionProcessingContext _reset](self, "_reset");
  -[NSMutableSet addObject:](self->_processedResources, "addObject:", v4);

}

- (void)recordContainedResource:(id)a3
{
  id v4;
  NSMutableSet *containedResourceIdentifiers;
  id v6;

  v4 = a3;
  -[HDReferenceExtractionProcessingContext _reset](self, "_reset");
  containedResourceIdentifiers = self->_containedResourceIdentifiers;
  objc_msgSend(v4, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableSet addObject:](containedResourceIdentifiers, "addObject:", v6);
}

- (void)setPrivateCompleteResources:(id)a3
{
  objc_storeStrong((id *)&self->_privateCompleteResources, a3);
}

- (void)setPrivateIncompleteResources:(id)a3
{
  objc_storeStrong((id *)&self->_privateIncompleteResources, a3);
}

- (void)setPrivateUnresolvableReferences:(id)a3
{
  objc_storeStrong((id *)&self->_privateUnresolvableReferences, a3);
}

- (NSMutableSet)processedResources
{
  return self->_processedResources;
}

- (void)setProcessedResources:(id)a3
{
  objc_storeStrong((id *)&self->_processedResources, a3);
}

- (NSMutableSet)containedResourceIdentifiers
{
  return self->_containedResourceIdentifiers;
}

- (void)setContainedResourceIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_containedResourceIdentifiers, a3);
}

- (NSMapTable)unresolvedReferences
{
  return self->_unresolvedReferences;
}

- (void)setUnresolvedReferences:(id)a3
{
  objc_storeStrong((id *)&self->_unresolvedReferences, a3);
}

- (NSMapTable)resourcesWithUnresolvableReferences
{
  return self->_resourcesWithUnresolvableReferences;
}

- (void)setResourcesWithUnresolvableReferences:(id)a3
{
  objc_storeStrong((id *)&self->_resourcesWithUnresolvableReferences, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourcesWithUnresolvableReferences, 0);
  objc_storeStrong((id *)&self->_unresolvedReferences, 0);
  objc_storeStrong((id *)&self->_containedResourceIdentifiers, 0);
  objc_storeStrong((id *)&self->_processedResources, 0);
  objc_storeStrong((id *)&self->_privateUnresolvableReferences, 0);
  objc_storeStrong((id *)&self->_privateIncompleteResources, 0);
  objc_storeStrong((id *)&self->_privateCompleteResources, 0);
}

@end
