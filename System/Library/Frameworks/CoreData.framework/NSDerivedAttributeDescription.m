@implementation NSDerivedAttributeDescription

- (unint64_t)_propertyType
{
  return 6;
}

- (void)setRenamingIdentifier:(id)a3
{
  uint64_t v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if ((-[NSString isEqual:](-[NSPropertyDescription renamingIdentifier](self, "renamingIdentifier"), "isEqual:", a3) & 1) == 0)
  {
    v4 = *MEMORY[0x1E0C99778];
    v5 = CFSTR("derived attribute");
    v6[0] = self;
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v4, CFSTR("Can't set renaming identifiers for derived attributes"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1)));
  }
}

- (BOOL)isTransient
{
  return 0;
}

- (BOOL)isReadOnly
{
  return 1;
}

- (void)_versionHash:(char *)a3 inStyle:(unint64_t)a4
{
  NSExpression *derivationExpression;
  __CFString *v8;
  const char *CStringPtr;
  CC_LONG v10;
  NSPredicate *filteringPredicate;
  __CFString *v12;
  const char *v13;
  CC_LONG v14;
  objc_super v15;
  CC_SHA256_CTX c;
  _BYTE v17[32];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  v15.receiver = self;
  v15.super_class = (Class)NSDerivedAttributeDescription;
  -[NSAttributeDescription _versionHash:inStyle:](&v15, sel__versionHash_inStyle_, v17, a4);
  derivationExpression = self->_derivationExpression;
  if (derivationExpression)
  {
    v8 = (__CFString *)-[NSExpression predicateFormat](derivationExpression, "predicateFormat");
    CStringPtr = CFStringGetCStringPtr(v8, 0x8000100u);
    if (!CStringPtr)
      CStringPtr = (const char *)-[__CFString UTF8String](v8, "UTF8String");
    v10 = strlen(CStringPtr);
    CC_SHA256_Update(&c, CStringPtr, v10);
  }
  filteringPredicate = self->_filteringPredicate;
  if (filteringPredicate)
  {
    v12 = -[NSPredicate predicateFormat](filteringPredicate, "predicateFormat");
    v13 = CFStringGetCStringPtr(v12, 0x8000100u);
    if (!v13)
      v13 = (const char *)-[__CFString UTF8String](v12, "UTF8String");
    v14 = strlen(v13);
    CC_SHA256_Update(&c, v13, v14);
  }
  CC_SHA256_Final((unsigned __int8 *)a3, &c);
}

- (void)dealloc
{
  objc_super v3;

  self->_derivationExpression = 0;
  self->_filteringPredicate = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSDerivedAttributeDescription;
  -[NSAttributeDescription dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSDerivedAttributeDescription;
  v4 = -[NSAttributeDescription copyWithZone:](&v6, sel_copyWithZone_, a3);
  if (v4)
  {
    v4[15] = self->_derivationExpression;
    v4[16] = self->_filteringPredicate;
  }
  return v4;
}

- (NSExpression)derivationExpression
{
  return self->_derivationExpression;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDerivedAttributeDescription)initWithCoder:(id)a3
{
  NSDerivedAttributeDescription *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NSDerivedAttributeDescription;
  v4 = -[NSAttributeDescription initWithCoder:](&v10, sel_initWithCoder_);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v4->_derivationExpression = (NSExpression *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), CFSTR("NSDerivationExpression"));
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v4->_filteringPredicate = (NSPredicate *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0), CFSTR("NSFilteringPredicate"));
  }
  return v4;
}

- (void)_createCachesAndOptimizeState
{
  id v3;
  id v4;
  NSPredicate *filteringPredicate;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v17;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v17.receiver = self;
  v17.super_class = (Class)NSDerivedAttributeDescription;
  -[NSAttributeDescription _createCachesAndOptimizeState](&v17, sel__createCachesAndOptimizeState);
  v16 = 0;
  v4 = -[NSExpression _keypathsForDerivedPropertyValidation:](self->_derivationExpression, "_keypathsForDerivedPropertyValidation:", &v16);
  if (!v4)
  {
    v8 = v16;
    if (!v16)
    {
      v8 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134097, &unk_1E1F4B088);
      v16 = v8;
    }
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0CB3388];
    v20[0] = CFSTR("offending property");
    v20[1] = v10;
    v21[0] = self;
    v21[1] = v8;
    v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2, v16);
    objc_exception_throw((id)objc_msgSend(v9, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Can't get keypaths for derived attribute validation"), v11));
  }
  -[NSDerivedAttributeDescription _validateKeypaths:]((uint64_t)self, v4);
  filteringPredicate = self->_filteringPredicate;
  if (filteringPredicate)
  {
    v6 = -[NSPredicate _keypathsForDerivedPropertyValidation:](filteringPredicate, "_keypathsForDerivedPropertyValidation:", &v16);
    if (!v6)
    {
      v12 = v16;
      if (!v16)
      {
        v12 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134097, &unk_1E1F4B0B0);
        v16 = v12;
      }
      v13 = (void *)MEMORY[0x1E0C99DA0];
      v14 = *MEMORY[0x1E0CB3388];
      v18[0] = CFSTR("offending property");
      v18[1] = v14;
      v19[0] = self;
      v19[1] = v12;
      v15 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2, v16);
      objc_exception_throw((id)objc_msgSend(v13, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Can't get keypaths for derived attribute validation"), v15));
    }
    -[NSDerivedAttributeDescription _validateKeypaths:]((uint64_t)self, v6);
  }
  -[NSExpression allowEvaluation](self->_derivationExpression, "allowEvaluation");
  -[NSPredicate allowEvaluation](self->_filteringPredicate, "allowEvaluation");
  objc_msgSend(v3, "drain");
  v7 = 0;
}

- (uint64_t)_validateKeypaths:(uint64_t)result
{
  uint64_t v2;
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[3];
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v19 = (void *)result;
  if (result)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v21, v37, 16);
    v20 = result;
    if (result)
    {
      v18 = *(_QWORD *)v22;
      do
      {
        v2 = 0;
        do
        {
          if (*(_QWORD *)v22 != v18)
            objc_enumerationMutation(a2);
          v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v2);
          v3 = (void *)objc_msgSend(v17, "componentsSeparatedByString:", CFSTR("."));
          v4 = (void *)objc_msgSend(v19, "entity");
          if (objc_msgSend(v3, "count"))
          {
            v5 = 1;
            do
            {
              v6 = v5 - 1;
              v7 = (void *)objc_msgSend(v3, "objectAtIndexedSubscript:", v5 - 1);
              if (objc_msgSend(v7, "rangeOfString:", CFSTR("$")) != 0x7FFFFFFFFFFFFFFFLL)
              {
                v12 = (void *)MEMORY[0x1E0C99DA0];
                v13 = *MEMORY[0x1E0C99778];
                v35[0] = CFSTR("offending property");
                v35[1] = CFSTR("keypath");
                v36[0] = v19;
                v36[1] = v17;
                v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
                v15 = CFSTR("Bad keypath for derived property (unresolved variable)");
                goto LABEL_32;
              }
              if (objc_msgSend(v7, "rangeOfString:", CFSTR("@")) == 0x7FFFFFFFFFFFFFFFLL)
              {
                if (!v4
                  || (v8 = (void *)objc_msgSend((id)objc_msgSend(v4, "propertiesByName"), "objectForKey:", v7)) == 0)
                {
                  v12 = (void *)MEMORY[0x1E0C99DA0];
                  v13 = *MEMORY[0x1E0C99778];
                  v31[0] = CFSTR("offending property");
                  v31[1] = CFSTR("keypath");
                  v32[0] = v19;
                  v32[1] = v17;
                  v31[2] = CFSTR("component");
                  v32[2] = v7;
                  v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
                  v15 = CFSTR("Bad keypath for derived property (missing keypath component)");
                  goto LABEL_32;
                }
                v9 = v8;
                v10 = objc_msgSend(v8, "_propertyType");
                if (v10 == 2)
                {
                  if (v6 != objc_msgSend(v3, "count") - 1)
                  {
                    if (v6 != objc_msgSend(v3, "count") - 2)
                    {
                      v12 = (void *)MEMORY[0x1E0C99DA0];
                      v13 = *MEMORY[0x1E0C99778];
                      v27[0] = CFSTR("offending property");
                      v27[1] = CFSTR("keypath");
                      v28[0] = v19;
                      v28[1] = v17;
                      v27[2] = CFSTR("component");
                      v28[2] = v7;
                      v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
                      v15 = CFSTR("Bad keypath for derived property (attribute has multiple keys following)");
LABEL_32:
                      objc_exception_throw((id)objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, v15, v14));
                    }
                    if (objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", v5), "rangeOfString:", CFSTR("@")) == 0x7FFFFFFFFFFFFFFFLL)
                    {
                      v12 = (void *)MEMORY[0x1E0C99DA0];
                      v13 = *MEMORY[0x1E0C99778];
                      v29[0] = CFSTR("offending property");
                      v29[1] = CFSTR("keypath");
                      v30[0] = v19;
                      v30[1] = v17;
                      v29[2] = CFSTR("component");
                      v30[2] = v7;
                      v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
                      v15 = CFSTR("Bad keypath for derived property (attribute in non-terminal location not followed by operator)");
                      goto LABEL_32;
                    }
                  }
                }
                else
                {
                  if (v10 != 4)
                  {
                    v12 = (void *)MEMORY[0x1E0C99DA0];
                    v13 = *MEMORY[0x1E0C99778];
                    v25[0] = CFSTR("offending property");
                    v25[1] = CFSTR("keypath");
                    v26[0] = v19;
                    v26[1] = v17;
                    v25[2] = CFSTR("component");
                    v26[2] = v7;
                    v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
                    v15 = CFSTR("Bad keypath for derived property (unsupported property type in keypath)");
                    goto LABEL_32;
                  }
                  v4 = (void *)objc_msgSend(v9, "destinationEntity");
                }
              }
              else if (v6 != objc_msgSend(v3, "count") - 1)
              {
                v12 = (void *)MEMORY[0x1E0C99DA0];
                v13 = *MEMORY[0x1E0C99778];
                v33[0] = CFSTR("offending property");
                v33[1] = CFSTR("keypath");
                v34[0] = v19;
                v34[1] = v17;
                v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
                v15 = CFSTR("Bad keypath for derived property (misplaced operator)");
                goto LABEL_32;
              }
            }
            while (v5++ < objc_msgSend(v3, "count"));
          }
          ++v2;
        }
        while (v2 != v20);
        result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v21, v37, 16);
        v20 = result;
      }
      while (result);
    }
  }
  return result;
}

- (id)description
{
  void *v3;
  id v4;
  NSAttributeType v5;
  NSString *v6;
  NSExpression *derivationExpression;
  NSPredicate *filteringPredicate;
  _BOOL4 v9;
  const __CFString *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)NSDerivedAttributeDescription;
  v4 = -[NSAttributeDescription description](&v12, sel_description);
  v5 = -[NSAttributeDescription attributeType](self, "attributeType");
  v6 = -[NSAttributeDescription attributeValueClassName](self, "attributeValueClassName");
  derivationExpression = self->_derivationExpression;
  filteringPredicate = self->_filteringPredicate;
  v9 = -[NSAttributeDescription preservesValueInHistoryOnDeletion](self, "preservesValueInHistoryOnDeletion");
  v10 = CFSTR("NO");
  if (v9)
    v10 = CFSTR("YES");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, attributeType %lu , attributeValueClassName %@, derivationExpression %@, filteringPredicate %@, preservesValueInHistoryOnDeletion %@"), v4, v5, v6, derivationExpression, filteringPredicate, v10);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSDerivedAttributeDescription;
  -[NSAttributeDescription encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", self->_derivationExpression, CFSTR("NSDerivationExpression"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_filteringPredicate, CFSTR("NSFilteringPredicate"));
}

- (void)setDerivationExpression:(NSExpression *)derivationExpression
{
  NSString *v5;
  void *v6;
  void *v7;
  uint64_t *v8;
  uint64_t v9;
  const __CFString *v10;
  NSExpression *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[NSPropertyDescription _throwIfNotEditable](self, "_throwIfNotEditable");
  if (self->_derivationExpression != derivationExpression)
  {
    if (-[NSExpression expressionType](derivationExpression, "expressionType") != NSKeyPathExpressionType)
    {
LABEL_9:
      v11 = derivationExpression;

      self->_derivationExpression = derivationExpression;
      return;
    }
    v5 = -[NSExpression keyPath](derivationExpression, "keyPath");
    if (-[NSString hasSuffix:](v5, "hasSuffix:", CFSTR(".@sum")))
    {
      v6 = (void *)MEMORY[0x1E0CB35D0];
      v14[0] = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", -[NSString substringToIndex:](v5, "substringToIndex:", -[NSString length](v5, "length") - 5));
      v7 = (void *)MEMORY[0x1E0C99D20];
      v8 = v14;
    }
    else
    {
      if (!-[NSString hasSuffix:](v5, "hasSuffix:", CFSTR(".@total")))
      {
        if (!-[NSString hasSuffix:](v5, "hasSuffix:", CFSTR(".@count")))
          goto LABEL_9;
        v6 = (void *)MEMORY[0x1E0CB35D0];
        v12 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", -[NSString substringToIndex:](v5, "substringToIndex:", -[NSString length](v5, "length") - 7));
        v9 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
        v10 = CFSTR("count:");
        goto LABEL_8;
      }
      v6 = (void *)MEMORY[0x1E0CB35D0];
      v13 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", -[NSString substringToIndex:](v5, "substringToIndex:", -[NSString length](v5, "length") - 7));
      v7 = (void *)MEMORY[0x1E0C99D20];
      v8 = &v13;
    }
    v9 = objc_msgSend(v7, "arrayWithObjects:count:", v8, 1);
    v10 = CFSTR("sum:");
LABEL_8:
    derivationExpression = (NSExpression *)objc_msgSend(v6, "expressionForFunction:arguments:", v10, v9);
    goto LABEL_9;
  }
}

- (BOOL)_isSchemaEqual:(id)a3
{
  unsigned int v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSDerivedAttributeDescription;
  v5 = -[NSAttributeDescription _isSchemaEqual:](&v8, sel__isSchemaEqual_);
  if (v5)
  {
    v5 = -[NSExpression isEqual:](self->_derivationExpression, "isEqual:", objc_msgSend(a3, "derivationExpression"));
    if (v5)
    {
      if (a3)
        v6 = *((_QWORD *)a3 + 16);
      else
        v6 = 0;
      LOBYTE(v5) = -[NSPredicate isEqual:](self->_filteringPredicate, "isEqual:", v6) ^ 1;
    }
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  unsigned int v7;
  NSExpression *derivationExpression;
  uint64_t v9;
  BOOL v10;
  NSPredicate *filteringPredicate;
  NSPredicate *v12;
  BOOL v13;
  objc_super v15;
  uint64_t v16;
  uint64_t v17;

  if (a3 == self)
  {
    LOBYTE(v7) = 1;
    return v7;
  }
  v16 = v3;
  v17 = v4;
  v15.receiver = self;
  v15.super_class = (Class)NSDerivedAttributeDescription;
  v7 = -[NSAttributeDescription isEqual:](&v15, sel_isEqual_);
  if (!v7)
    return v7;
  derivationExpression = self->_derivationExpression;
  v9 = objc_msgSend(a3, "derivationExpression");
  if (derivationExpression != (NSExpression *)v9)
  {
    if (derivationExpression)
      v10 = v9 == 0;
    else
      v10 = 1;
    if (v10)
    {
LABEL_17:
      LOBYTE(v7) = 0;
      return v7;
    }
    v7 = -[NSExpression isEqual:](derivationExpression, "isEqual:", v9);
    if (!v7)
      return v7;
  }
  filteringPredicate = self->_filteringPredicate;
  if (a3)
    v12 = (NSPredicate *)*((_QWORD *)a3 + 16);
  else
    v12 = 0;
  if (filteringPredicate == v12)
  {
    LOBYTE(v7) = 1;
    return v7;
  }
  if (filteringPredicate)
    v13 = v12 == 0;
  else
    v13 = 1;
  if (v13)
    goto LABEL_17;
  LOBYTE(v7) = -[NSPredicate isEqual:](filteringPredicate, "isEqual:");
  return v7;
}

- (void)setDefaultValue:(id)a3
{
  uint64_t v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0C99778];
  v4 = CFSTR("offending property");
  v5[0] = self;
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v3, CFSTR("Can't set a default value for a derived attribute"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1)));
}

- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 entitiesSlots:(id)a8 fetchRequests:(id)a9
{
  int v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  objc_super v21;

  v16 = objc_msgSend(a3, "length");
  v17 = objc_msgSend(a3, "length");
  v21.receiver = self;
  v21.super_class = (Class)NSDerivedAttributeDescription;
  -[NSAttributeDescription _writeIntoData:propertiesDict:uniquedPropertyNames:uniquedStrings:uniquedData:entitiesSlots:fetchRequests:](&v21, sel__writeIntoData_propertiesDict_uniquedPropertyNames_uniquedStrings_uniquedData_entitiesSlots_fetchRequests_, a3, a4, a5, a6, a7, a8, a9);
  if (self->_derivationExpression)
    v18 = objc_msgSend((id)objc_msgSend(a7, "objectForKey:"), "unsignedIntegerValue");
  else
    v18 = 0;
  _writeInt32IntoData(a3, v18);
  if (self->_filteringPredicate)
    v19 = objc_msgSend((id)objc_msgSend(a7, "objectForKey:"), "unsignedIntegerValue");
  else
    v19 = 0;
  _writeInt32IntoData(a3, v19);
  v20 = bswap32(objc_msgSend(a3, "length") - v16);
  objc_msgSend(a3, "replaceBytesInRange:withBytes:", v17, 4, &v20);
}

@end
