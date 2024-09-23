@implementation HDFHIRExtensionProcessor

- (HDFHIRExtensionProcessor)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDFHIRExtensionProcessor)initWithResource:(id)a3
{
  id v4;
  HDFHIRExtensionProcessor *v5;
  uint64_t v6;
  HDFHIRResourceObject *resource;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDFHIRExtensionProcessor;
  v5 = -[HDFHIRExtensionProcessor init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    resource = v5->_resource;
    v5->_resource = (HDFHIRResourceObject *)v6;

  }
  return v5;
}

+ (id)extensionsForURL:(id)a3 inJSONDictionary:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v9 = a3;
  v10 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDFHIRExtensionProcessor.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[JSONDictionary isKindOfClass:[NSDictionary class]]"));

  }
  v20 = 0;
  objc_msgSend(v10, "hk_safeArrayIfExistsForKeyPath:error:", CFSTR("extension"), &v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v20;
  v13 = v12;
  if (v11)
  {
    +[HDFHIRExtensionElement FHIRExtensionElementsFromJSONExtensionObject:error:](HDFHIRExtensionElement, "FHIRExtensionElementsFromJSONExtensionObject:error:", v11, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __68__HDFHIRExtensionProcessor_extensionsForURL_inJSONDictionary_error___block_invoke;
      v18[3] = &unk_24ECF57C8;
      v19 = v9;
      objc_msgSend(v14, "hk_filter:", v18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }

  }
  else if (v12)
  {
    if (a5)
    {
      v15 = 0;
      *a5 = objc_retainAutorelease(v12);
    }
    else
    {
      _HKLogDroppedError();
      v15 = 0;
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v15;
}

uint64_t __68__HDFHIRExtensionProcessor_extensionsForURL_inJSONDictionary_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "URI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)findUnsupportedModifierExtensions:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BDD3C90];
  -[HDFHIRResourceObject JSONObject](self->_resource, "JSONObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visitorWithJSONObject:delegate:error:", v6, self, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[HDFHIRExtensionProcessor setCollectingUnsupportedModifierExtensions:](self, "setCollectingUnsupportedModifierExtensions:", v8);

    objc_msgSend(v7, "traverseJSONObject");
    v9 = (void *)-[NSMutableArray copy](self->_collectingUnsupportedModifierExtensions, "copy");
    -[HDFHIRExtensionProcessor setCollectingUnsupportedModifierExtensions:](self, "setCollectingUnsupportedModifierExtensions:", 0);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)visitor:(id)a3 willVisitArray:(id)a4
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  HDFHIRExtensionElementResult *v24;
  void *v25;
  HDFHIRExtensionElementResult *v26;
  int64_t v27;
  void *v28;
  void *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!self->_collectingUnsupportedModifierExtensions)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDFHIRExtensionProcessor.m"), 88, CFSTR("not properly set up to use a JSON visitor"));

  }
  objc_msgSend(v7, "lastKeyPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("modifierExtension"));

  if (v10)
  {
    v40 = 0;
    +[HDFHIRExtensionElement FHIRExtensionElementsFromJSONExtensionObject:error:](HDFHIRExtensionElement, "FHIRExtensionElementsFromJSONExtensionObject:error:", v8, &v40);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v40;
    v13 = v12;
    if (v11)
    {
      v31 = v12;
      v33 = v8;
      v34 = v7;
      objc_msgSend(v7, "allKeyPathComponents");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v32 = v11;
      v14 = v11;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (v15)
      {
        v16 = v15;
        v17 = 0;
        v18 = *(_QWORD *)v37;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v37 != v18)
              objc_enumerationMutation(v14);
            v20 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v19);
            if ((objc_msgSend((id)objc_opt_class(), "isSupportedModifierExtension:", v20) & 1) == 0)
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v17 + v19);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "description");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "arrayByAddingObject:", v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              v24 = [HDFHIRExtensionElementResult alloc];
              objc_msgSend(v23, "componentsJoinedByString:", CFSTR("."));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = -[HDFHIRExtensionElementResult initWithExtensionElement:keyPath:isModifierExtension:](v24, "initWithExtensionElement:keyPath:isModifierExtension:", v20, v25, 1);

              -[NSMutableArray addObject:](self->_collectingUnsupportedModifierExtensions, "addObject:", v26);
            }
            ++v19;
          }
          while (v16 != v19);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
          v17 += v19;
        }
        while (v16);
      }

      v8 = v33;
      v7 = v34;
      v13 = v31;
      v11 = v32;
    }
    else
    {
      _HKInitializeLogging();
      v28 = (void *)*MEMORY[0x24BDD2FF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
        -[HDFHIRExtensionProcessor visitor:willVisitArray:].cold.1(v28);
    }

    v27 = 2;
  }
  else
  {
    v27 = 1;
  }

  return v27;
}

+ (BOOL)isSupportedModifierExtension:(id)a3
{
  return 0;
}

- (HDFHIRResourceObject)resource
{
  return self->_resource;
}

- (NSArray)collectedUnsupportedModifierExtensions
{
  return self->_collectedUnsupportedModifierExtensions;
}

- (void)setCollectedUnsupportedModifierExtensions:(id)a3
{
  objc_storeStrong((id *)&self->_collectedUnsupportedModifierExtensions, a3);
}

- (NSMutableArray)collectingUnsupportedModifierExtensions
{
  return self->_collectingUnsupportedModifierExtensions;
}

- (void)setCollectingUnsupportedModifierExtensions:(id)a3
{
  objc_storeStrong((id *)&self->_collectingUnsupportedModifierExtensions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectingUnsupportedModifierExtensions, 0);
  objc_storeStrong((id *)&self->_collectedUnsupportedModifierExtensions, 0);
  objc_storeStrong((id *)&self->_resource, 0);
}

- (void)visitor:(void *)a1 willVisitArray:.cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  HKSensitiveLogItem();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_224DAC000, v1, OS_LOG_TYPE_ERROR, "Unable to instantiate extensions: %@", (uint8_t *)&v3, 0xCu);

}

@end
