@implementation HKUserDomainConceptPropertyCollection

- (HKUserDomainConceptPropertyCollection)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKUserDomainConceptPropertyCollection)initWithProperties:(id)a3
{
  id v5;
  HKUserDomainConceptPropertyCollection *v6;
  uint64_t v7;
  NSArray *properties;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKUserDomainConceptPropertyCollection.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("properties != nil"));

  }
  v11.receiver = self;
  v11.super_class = (Class)HKUserDomainConceptPropertyCollection;
  v6 = -[HKUserDomainConceptPropertyCollection init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    properties = v6->_properties;
    v6->_properties = (NSArray *)v7;

  }
  return v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  const __CFString *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[NSArray count](self->_properties, "count");
  v6 = -[NSArray count](self->_properties, "count");
  v7 = CFSTR("properties");
  if (v6 == 1)
    v7 = CFSTR("property");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p with %ld %@: %@>"), v4, self, v5, v7, self->_properties);
}

- (int64_t)count
{
  return -[NSArray count](self->_properties, "count");
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", self->_properties);
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HKUserDomainConceptPropertyCollection *v4;
  HKUserDomainConceptPropertyCollection *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = (HKUserDomainConceptPropertyCollection *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSArray isEqualToArray:](self->_properties, "isEqualToArray:", v5->_properties))
      {
        v6 = 1;
      }
      else
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", self->_properties);
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v5->_properties);
        v6 = objc_msgSend(v7, "isEqual:", v8);

      }
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_properties, CFSTR("properties"));
}

- (HKUserDomainConceptPropertyCollection)initWithCoder:(id)a3
{
  id v4;
  HKUserDomainConceptPropertyCollection *v5;
  void *v6;
  uint64_t v7;
  NSArray *properties;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKUserDomainConceptPropertyCollection;
  v5 = -[HKUserDomainConceptPropertyCollection init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("properties"));
    v7 = objc_claimAutoreleasedReturnValue();
    properties = v5->_properties;
    v5->_properties = (NSArray *)v7;

  }
  return v5;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSArray countByEnumeratingWithState:objects:count:](self->_properties, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (id)collectionByAddingProperties:(id)a3
{
  void *v3;
  HKUserDomainConceptPropertyCollection *v4;

  -[NSArray arrayByAddingObjectsFromArray:](self->_properties, "arrayByAddingObjectsFromArray:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HKUserDomainConceptPropertyCollection initWithProperties:]([HKUserDomainConceptPropertyCollection alloc], "initWithProperties:", v3);

  return v4;
}

- (id)firstPropertyWithType:(int64_t)a3
{
  NSArray *properties;
  void *v8;
  _QWORD v9[5];

  if (HKIsDeprecatedPropertyType(a3))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKUserDomainConceptPropertyCollection.m"), 123, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("HKIsDeprecatedPropertyType(type) == NO"));

  }
  properties = self->_properties;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__HKUserDomainConceptPropertyCollection_firstPropertyWithType___block_invoke;
  v9[3] = &__block_descriptor_40_e37_B16__0__HKUserDomainConceptProperty_8l;
  v9[4] = a3;
  -[NSArray hk_firstObjectPassingTest:](properties, "hk_firstObjectPassingTest:", v9);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __63__HKUserDomainConceptPropertyCollection_firstPropertyWithType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(v3, "type") == *(_QWORD *)(a1 + 32))
    v4 = objc_msgSend(v3, "isDeleted") ^ 1;
  else
    v4 = 0;

  return v4;
}

- (id)propertiesWithType:(int64_t)a3
{
  return -[HKUserDomainConceptPropertyCollection _propertiesWithType:includeDeleted:](self, "_propertiesWithType:includeDeleted:", a3, 0);
}

- (id)allPropertiesWithType:(int64_t)a3
{
  return -[HKUserDomainConceptPropertyCollection _propertiesWithType:includeDeleted:](self, "_propertiesWithType:includeDeleted:", a3, 1);
}

- (id)_propertiesWithType:(int64_t)a3 includeDeleted:(BOOL)a4
{
  NSArray *properties;
  void *v10;
  _QWORD v11[5];
  BOOL v12;

  if (HKIsDeprecatedPropertyType(a3))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKUserDomainConceptPropertyCollection.m"), 142, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("HKIsDeprecatedPropertyType(type) == NO"));

  }
  properties = self->_properties;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__HKUserDomainConceptPropertyCollection__propertiesWithType_includeDeleted___block_invoke;
  v11[3] = &__block_descriptor_41_e37_B16__0__HKUserDomainConceptProperty_8l;
  v11[4] = a3;
  v12 = a4;
  -[NSArray hk_filter:](properties, "hk_filter:", v11);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __76__HKUserDomainConceptPropertyCollection__propertiesWithType_includeDeleted___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(v3, "type") == *(_QWORD *)(a1 + 32))
  {
    if (*(_BYTE *)(a1 + 40))
      v4 = 1;
    else
      v4 = objc_msgSend(v3, "isDeleted") ^ 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)propertyCollectionByMergingCollection:(id)a3 otherCollection:(id)a4 options:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    if (v7)
    {
      objc_msgSend(v7, "propertyCollectionByMerging:options:", v8, a5);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = v8;
    }
  }
  else
  {
    v10 = v7;
  }
  v11 = v10;

  return v11;
}

+ (id)propertyCollectionByMergingCollection:(id)a3 otherCollection:(id)a4
{
  return (id)objc_msgSend(a1, "propertyCollectionByMergingCollection:otherCollection:options:", a3, a4, 0);
}

- (id)propertyCollectionByMerging:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  HKUserDomainConceptPropertyCollection *v29;
  HKUserDomainConceptPropertyCollection *v31;
  id v32;
  char v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    -[HKUserDomainConceptPropertyCollection _propertiesByType](self, "_propertiesByType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_propertiesByType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v7;
    v34 = (void *)objc_msgSend(v7, "mutableCopy");
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v10)
    {
      v11 = v10;
      v31 = self;
      v32 = v6;
      v33 = 0;
      v12 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v41 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v9, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "firstObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_opt_class();

          objc_msgSend(v35, "objectForKeyedSubscript:", v14);
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = (void *)v18;
          v20 = (void *)MEMORY[0x1E0C9AA60];
          if (v18)
            v20 = (void *)v18;
          v21 = v20;

          objc_msgSend(v17, "mergeListsOfPropertiesWithType:intoListOfProperties:fromListOfProperties:options:", objc_msgSend(v14, "integerValue"), v21, v15, a4);
          v22 = (id)objc_claimAutoreleasedReturnValue();

          if (v22 != v21)
          {
            objc_msgSend(v34, "setObject:forKeyedSubscript:", v22, v14);
            v33 = 1;
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v11);

      self = v31;
      v6 = v32;
      if ((v33 & 1) != 0)
      {
        v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        objc_msgSend(v34, "allValues");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v37;
          do
          {
            for (j = 0; j != v26; ++j)
            {
              if (*(_QWORD *)v37 != v27)
                objc_enumerationMutation(v24);
              objc_msgSend(v23, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j));
            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          }
          while (v26);
        }

        v29 = -[HKUserDomainConceptPropertyCollection initWithProperties:]([HKUserDomainConceptPropertyCollection alloc], "initWithProperties:", v23);
        goto LABEL_25;
      }
    }
    else
    {

    }
    v29 = self;
LABEL_25:

    goto LABEL_26;
  }
  v29 = self;
LABEL_26:

  return v29;
}

- (id)_propertiesByType
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_properties;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "type", (_QWORD)v14));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v10);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v10);
        }
        objc_msgSend(v11, "addObject:", v9);

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_msgSend(v3, "copy");
  return v12;
}

- (NSArray)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
}

- (NSArray)basicProperties
{
  return (NSArray *)-[HKUserDomainConceptPropertyCollection _basicPropertiesIncludeDeleted:](self, "_basicPropertiesIncludeDeleted:", 0);
}

- (NSArray)allBasicProperties
{
  return (NSArray *)-[HKUserDomainConceptPropertyCollection _basicPropertiesIncludeDeleted:](self, "_basicPropertiesIncludeDeleted:", 1);
}

- (id)_basicPropertiesIncludeDeleted:(BOOL)a3
{
  void *v4;
  void *v5;
  _QWORD v7[4];
  BOOL v8;

  -[HKUserDomainConceptPropertyCollection properties](self, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __106__HKUserDomainConceptPropertyCollection_HKUserDomainConceptBasicProperty___basicPropertiesIncludeDeleted___block_invoke;
  v7[3] = &__block_descriptor_33_e37_B16__0__HKUserDomainConceptProperty_8l;
  v8 = a3;
  objc_msgSend(v4, "hk_filter:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __106__HKUserDomainConceptPropertyCollection_HKUserDomainConceptBasicProperty___basicPropertiesIncludeDeleted___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (*(_BYTE *)(a1 + 32))
      v4 = 1;
    else
      v4 = objc_msgSend(v3, "isDeleted") ^ 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)firstBasicPropertyWithType:(int64_t)a3
{
  void *v5;

  if (HKIsBasicUserDomainConceptPropertyType(a3))
  {
    -[HKUserDomainConceptPropertyCollection firstPropertyWithType:](self, "firstPropertyWithType:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end
