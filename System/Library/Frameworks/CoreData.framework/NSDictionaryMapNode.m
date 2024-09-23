@implementation NSDictionaryMapNode

+ (void)initialize
{
  objc_opt_self();
}

- (NSDictionaryMapNode)initWithValues:(id *)a3 objectID:(id)a4
{
  NSDictionaryMapNode *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSDictionaryMapNode;
  result = -[NSStoreMapNode initWithObjectID:](&v6, sel_initWithObjectID_, a4);
  if (result)
    result->_attributes = a3;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionaryMapNode)initWithCoder:(id)a3
{
  NSDictionaryMapNode *v4;
  void *v5;
  id v6;
  objc_super v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)NSDictionaryMapNode;
  v4 = -[NSStoreMapNode initWithCoder:](&v8, sel_initWithCoder_);
  v5 = (void *)objc_msgSend(a3, "allowedClasses");
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  v6 = (id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setByAddingObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2)), CFSTR("NSAttributeValues"));
  v4->_attributesAsEncoded = v6;
  if (!v6)
    v4->_attributesAsEncoded = (id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(a3, "allowedClasses"), CFSTR("NSAttributes"));
  return v4;
}

- (void)_doAttributeDecoding
{
  void *v2;
  uint64_t v3;
  id *v4;
  uint64_t v5;
  int v6;
  void *v7;
  id *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a1 && *(_QWORD *)(a1 + 56))
  {
    v2 = (void *)objc_msgSend((id)objc_msgSend((id)a1, "entity"), "_propertySearchMapping");
    v3 = objc_msgSend(v2, "length");
    v4 = (id *)PF_CALLOC_OBJECT_ARRAY(v3);
    v5 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = objc_msgSend(*(id *)(a1 + 56), "isNSArray");
    v7 = *(void **)(a1 + 56);
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 56), "getObjects:", v4);
      if (v3)
      {
        v8 = v4;
        do
        {
          if (*v8 == (id)v5)
            *v8 = 0;
          else
            v9 = *v8;
          ++v8;
          --v3;
        }
        while (v3);
      }
    }
    else
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v19 != v12)
              objc_enumerationMutation(v7);
            v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
            v15 = objc_msgSend(v2, "fastIndexForKnownKey:", v14);
            v16 = (void *)objc_msgSend(v7, "objectForKey:", v14);
            if (v16 == (void *)v5)
              v17 = 0;
            else
              v17 = v16;
            v4[v15] = v17;
          }
          v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v11);
      }
    }

    *(_QWORD *)(a1 + 56) = 0;
    *(_QWORD *)(a1 + 48) = v4;
  }
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5;
  malloc_zone_t *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  void *v11;
  malloc_zone_t *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NSDictionaryMapNode;
  -[NSStoreMapNode encodeWithCoder:](&v13, sel_encodeWithCoder_);
  if (self->_attributesAsEncoded)
    -[NSDictionaryMapNode _doAttributeDecoding]((uint64_t)self);
  v5 = objc_msgSend((id)objc_msgSend(-[NSStoreMapNode entity](self, "entity"), "_propertySearchMapping"), "length");
  v6 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
  if (!_PF_Private_Malloc_Zone)
    v6 = malloc_default_zone();
  v7 = malloc_type_zone_malloc(v6, 8 * v5, 0x80040B8603338uLL);
  v8 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  if (v5)
  {
    for (i = 0; i != v5; ++i)
    {
      v10 = self->_attributes[i];
      if (!v10)
        v10 = (id)v8;
      v7[i] = v10;
    }
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v7, v5);
  v12 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
  if (!_PF_Private_Malloc_Zone)
    v12 = malloc_default_zone();
  malloc_zone_free(v12, v7);
  objc_msgSend(a3, "encodeObject:forKey:", v11, CFSTR("NSAttributeValues"));

}

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  objc_super v6;

  if (self->_attributes)
  {
    v3 = objc_msgSend((id)objc_msgSend(-[NSStoreMapNode entity](self, "entity"), "_propertySearchMapping"), "length");
    if (v3)
    {
      v4 = v3;
      for (i = 0; i != v4; ++i)

    }
    PF_FREE_OBJECT_ARRAY(self->_attributes);
    self->_attributes = 0;
  }

  self->_attributesAsEncoded = 0;
  v6.receiver = self;
  v6.super_class = (Class)NSDictionaryMapNode;
  -[NSStoreMapNode dealloc](&v6, sel_dealloc);
}

- (id)valueForKey:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  objc_super v19;

  if (self->_attributesAsEncoded)
    -[NSDictionaryMapNode _doAttributeDecoding]((uint64_t)self);
  v5 = -[NSStoreMapNode entity](self, "entity");
  v6 = (void *)objc_msgSend(v5, "_propertySearchMapping");
  v7 = objc_msgSend((id)objc_msgSend(v5, "propertiesByName"), "values");
  v8 = objc_msgSend(v6, "indexForKey:", a3);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3 == CFSTR("objectID") || objc_msgSend(CFSTR("objectID"), "isEqualToString:", a3))
    {
      v9 = -[NSStoreMapNode objectID](self, "objectID");
    }
    else
    {
      v19.receiver = self;
      v19.super_class = (Class)NSDictionaryMapNode;
      v9 = -[NSDictionaryMapNode valueForKey:](&v19, sel_valueForKey_, a3);
    }
    goto LABEL_21;
  }
  v10 = v8;
  if ((objc_msgSend(*(id *)(v7 + 8 * v8), "isTransient") & 1) != 0)
  {
LABEL_8:
    v11 = 0;
    goto LABEL_22;
  }
  if (objc_msgSend(*(id *)(v7 + 8 * v10), "_propertyType") == 2)
  {
    v11 = self->_attributes[v10];
    goto LABEL_22;
  }
  v12 = *(void **)(v7 + 8 * v10);
  v13 = (void *)-[NSMutableDictionary valueForKey:](self->super._relatedNodes, "valueForKey:", a3);
  if (!objc_msgSend(v12, "isToMany"))
  {
    if (objc_msgSend(v13, "count"))
    {
      v9 = -[NSPersistentStoreMap dataForKey:](self->super._map, "dataForKey:", objc_msgSend(v13, "objectAtIndex:", 0));
LABEL_21:
      v11 = v9;
      goto LABEL_22;
    }
    goto LABEL_8;
  }
  v11 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = objc_msgSend(v13, "count");
  if (v14)
  {
    v15 = v14;
    for (i = 0; i != v15; ++i)
    {
      v17 = -[NSPersistentStoreMap dataForKey:](self->super._map, "dataForKey:", objc_msgSend(v13, "objectAtIndex:", i));
      if (v17)
        objc_msgSend(v11, "addObject:", v17);
    }
  }
LABEL_22:
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E38], "null"), "isEqual:", v11))
    return 0;
  else
    return v11;
}

@end
