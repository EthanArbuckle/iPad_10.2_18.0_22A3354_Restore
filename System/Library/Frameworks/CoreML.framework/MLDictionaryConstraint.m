@implementation MLDictionaryConstraint

- (MLDictionaryConstraint)initWithKeyType:(int64_t)a3
{
  MLDictionaryConstraint *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MLDictionaryConstraint;
  result = -[MLDictionaryConstraint init](&v5, sel_init);
  if (result)
    result->_keyType = a3;
  return result;
}

- (BOOL)isAllowedValue:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  const __CFString *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((objc_msgSend(v6, "isUndefined") & 1) != 0
    || (objc_msgSend(v6, "dictionaryValue"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, !v7))
  {
    if (a4)
    {
      v16 = CFSTR("MLDictionaryConstraint cannot check undefined values");
LABEL_17:
      +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", v16);
      v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
LABEL_20:
    v14 = 0;
    goto LABEL_26;
  }
  if (objc_msgSend(v6, "type") != 6)
  {
    if (a4)
    {
      v16 = CFSTR("MLDictionaryConstraint only allows Dictionary values");
      goto LABEL_17;
    }
    goto LABEL_20;
  }
  objc_msgSend(v6, "dictionaryValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (self->_keyType == 3)
    objc_opt_class();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
LABEL_8:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v12)
        objc_enumerationMutation(v9);
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v11)
          goto LABEL_8;
        goto LABEL_14;
      }
    }

    if (a4)
    {
      +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", self->_keyType);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("Dicitonary keys are not all expected type %@"), v15);
      v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
    v14 = 0;
  }
  else
  {
LABEL_14:
    v14 = 1;
    v15 = v9;
LABEL_23:

  }
LABEL_26:

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MLDictionaryConstraint initWithKeyType:](+[MLDictionaryConstraint allocWithZone:](MLDictionaryConstraint, "allocWithZone:", a3), "initWithKeyType:", self->_keyType);
}

- (id)description
{
  const __CFString *v2;

  if (self->_keyType == 3)
    v2 = CFSTR("String");
  else
    v2 = CFSTR("Int64");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ → Double"), v2);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[MLDictionaryConstraint keyType](self, "keyType"), CFSTR("keyType"));

}

- (MLDictionaryConstraint)initWithCoder:(id)a3
{
  return -[MLDictionaryConstraint initWithKeyType:](self, "initWithKeyType:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("keyType")));
}

- (MLFeatureType)keyType
{
  return self->_keyType;
}

+ (MLDictionaryConstraint)constraintWithStringKeys
{
  return (MLDictionaryConstraint *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithKeyType:", 3);
}

+ (MLDictionaryConstraint)constraintWithInt64Keys
{
  return (MLDictionaryConstraint *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithKeyType:", 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
