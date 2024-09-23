@implementation _HKComparisonFilter

- (id)_initWithKeyPath:(id)a3 operatorType:(unint64_t)a4 value:(id)a5 dataTypes:(id)a6 applicationSDKVersionToken:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  _HKComparisonFilter *v15;
  uint64_t v16;
  NSString *keyPath;
  id v18;
  id value;
  objc_super v21;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)_HKComparisonFilter;
  v15 = -[_HKComparisonFilter init](&v21, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    keyPath = v15->_keyPath;
    v15->_keyPath = (NSString *)v16;

    v15->_operatorType = a4;
    if (objc_msgSend(v13, "conformsToProtocol:", &unk_1EE3A4A20))
      v18 = (id)objc_msgSend(v13, "copy");
    else
      v18 = v13;
    value = v15->_value;
    v15->_value = v18;

    objc_storeStrong((id *)&v15->_dataTypes, a6);
    v15->_applicationSDKVersionToken = a7;
    atomic_store(0, (unsigned __int8 *)&v15->_hasBeenConfiguredFlag);
  }

  return v15;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  NSString *keyPath;
  void *v6;
  id value;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  keyPath = self->_keyPath;
  HKStringFromPredicateOperatorType(self->_operatorType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  value = self->_value;
  -[NSSet allObjects](self->_dataTypes, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %@ '%@' %@ for [%@], sdk_token=%llu>"), v4, keyPath, v6, value, v9, self->_applicationSDKVersionToken);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

+ (id)filterForKeyPath:(id)a3 operatorType:(unint64_t)a4 value:(id)a5 dataTypes:(id)a6 isSubpredicate:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  void *v15;

  v7 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a3;
  objc_msgSend(a1, "_filterForKeyPath:operatorType:value:dataTypes:applicationSDKVersionToken:isSubpredicate:", v14, a4, v13, v12, HKApplicationSDKVersionToken(), v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)filterForKeyPath:(id)a3 operatorType:(unint64_t)a4 value:(id)a5 dataTypes:(id)a6
{
  return (id)objc_msgSend(a1, "filterForKeyPath:operatorType:value:dataTypes:isSubpredicate:", a3, a4, a5, a6, 0);
}

+ (id)_filterForKeyPath:(id)a3 operatorType:(unint64_t)a4 value:(id)a5 dataTypes:(id)a6 applicationSDKVersionToken:(unint64_t)a7 isSubpredicate:(BOOL)a8
{
  int v8;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  char v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v34;
  id v35;

  v8 = a8;
  v14 = a3;
  v15 = a5;
  v16 = a6;
  if (!objc_msgSend(a1, "supportsKeyPath:forTypes:", v14, v16))
    goto LABEL_4;
  if (objc_msgSend(a1, "requiresSubpredicate") == v8)
  {
    v35 = 0;
    v22 = objc_msgSend(a1, "areValidTypes:forKeyPath:error:", v16, v14, &v35);
    v23 = v35;
    if ((v22 & 1) != 0)
    {
      if ((objc_msgSend(a1, "isAllowedPredicateOperatorType:forKeyPath:", a4, v14) & 1) != 0)
      {
        v34 = v23;
        v24 = objc_msgSend(a1, "isValidValue:forKeyPath:operatorType:dataTypes:error:", v15, v14, a4, v16, &v34);
        v25 = v34;

        if ((v24 & 1) != 0)
        {
          v21 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithKeyPath:operatorType:value:dataTypes:applicationSDKVersionToken:", v14, a4, v15, v16, a7);
          objc_msgSend(v21, "configureInMemoryFilter");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid value '%@' for %@.%@: %@"), v15, objc_opt_class(), v14, v25);
          v21 = 0;
        }
        v23 = v25;
        goto LABEL_14;
      }
      v30 = (void *)MEMORY[0x1E0C99DA0];
      v31 = *MEMORY[0x1E0C99778];
      HKStringFromPredicateOperatorType(a4);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "raise:format:", v31, CFSTR("Invalid operatorType '%@' for %@.%@"), v32, objc_opt_class(), v14);

    }
    else
    {
      v26 = (void *)MEMORY[0x1E0C99DA0];
      v27 = *MEMORY[0x1E0C99778];
      objc_msgSend(v16, "allObjects");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "componentsJoinedByString:", CFSTR(", "));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "raise:format:", v27, CFSTR("Invalid data types '%@' for %@.%@: %@"), v29, objc_opt_class(), v14, v23);

    }
    v21 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v17 = (void *)MEMORY[0x1E0C99DA0];
  v18 = *MEMORY[0x1E0C99778];
  objc_msgSend(v16, "allObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "componentsJoinedByString:", CFSTR(", "));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "raise:format:", v18, CFSTR("Keypath should only be used in subpredicates '%@' for %@.%@"), v20, objc_opt_class(), v14);

LABEL_4:
  v21 = 0;
LABEL_15:

  return v21;
}

+ (BOOL)requiresSubpredicate
{
  return 0;
}

+ (BOOL)areValidTypes:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  id *v23;
  id v24;
  _QWORD v25[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "allowedDataTypeClassesForKeyPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count") || (objc_msgSend(a1, "allowsEmptyDataTypesSetForKeyPath:", v9) & 1) != 0)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v12)
    {
      v13 = v12;
      v23 = a5;
      v24 = v9;
      v14 = *(_QWORD *)v27;
      v15 = MEMORY[0x1E0C809B0];
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(v11);
          v17 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          v25[0] = v15;
          v25[1] = 3221225472;
          v25[2] = __54___HKComparisonFilter_areValidTypes_forKeyPath_error___block_invoke;
          v25[3] = &unk_1E37F4710;
          v25[4] = v17;
          if ((objc_msgSend(v10, "hk_containsObjectPassingTest:", v25) & 1) == 0)
          {
            v19 = (void *)MEMORY[0x1E0CB35C8];
            objc_msgSend(v10, "allObjects");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "componentsJoinedByString:", CFSTR(", "));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "hk_assignError:code:format:", v23, 3, CFSTR("'%@' not found in allowed data types classes (%@)"), v17, v21);

            v18 = 0;
            goto LABEL_13;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v13)
          continue;
        break;
      }
      v18 = 1;
LABEL_13:
      v9 = v24;
    }
    else
    {
      v18 = 1;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 3, CFSTR("Filter requires at least one data type"));
    v18 = 0;
  }

  return v18;
}

+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  void *v12;

  v10 = a4;
  v11 = a3;
  objc_msgSend(a1, "allowedValueClassesForKeyPath:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = objc_msgSend(a1, "_isValidValue:forKeyPath:allowedClases:error:", v11, v10, v12, a7);

  return (char)a7;
}

- (void)configureInMemoryFilter
{
  atomic_flag *p_hasBeenConfiguredFlag;
  unsigned __int8 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  p_hasBeenConfiguredFlag = &self->_hasBeenConfiguredFlag;
  do
    v4 = __ldaxr((unsigned __int8 *)p_hasBeenConfiguredFlag);
  while (__stlxr(1u, (unsigned __int8 *)p_hasBeenConfiguredFlag));
  if ((v4 & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "raise:format:", v6, CFSTR("%@ has already been called for %@"), v7, self);

  }
  v8 = (void *)objc_opt_class();
  -[_HKComparisonFilter keyPath](self, "keyPath");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  self->_keyPathIntegerValue = objc_msgSend(v8, "enumRepresentationForKeyPath:", v9);

}

+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4
{
  return a3 < 6;
}

+ (BOOL)allowsEmptyDataTypesSetForKeyPath:(id)a3
{
  return 0;
}

+ (BOOL)allowsEmptyContainerValuesForKeyPath:(id)a3
{
  return 0;
}

+ (int64_t)enumRepresentationForKeyPath:(id)a3
{
  return -1;
}

+ (BOOL)_isValidValue:(id)a3 forKeyPath:(id)a4 allowedClases:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  BOOL v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  uint64_t v26;
  id v27;
  id v28;
  _QWORD v29[5];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __68___HKComparisonFilter__isValidValue_forKeyPath_allowedClases_error___block_invoke;
  v34[3] = &unk_1E37F4710;
  v14 = v10;
  v35 = v14;
  if ((objc_msgSend(v12, "hk_containsObjectPassingTest:", v34) & 1) == 0)
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v26 = objc_opt_class();
    v27 = v12;
    v23 = CFSTR("%@ is not in the set of valid clases %@");
    v24 = v22;
LABEL_16:
    objc_msgSend(v24, "hk_assignError:code:format:", a6, 3, v23, v26, v27);
    v21 = 0;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v21 = 1;
      goto LABEL_20;
    }
  }
  if (!objc_msgSend(v14, "count") && (objc_msgSend(a1, "allowsEmptyContainerValuesForKeyPath:", v11) & 1) == 0)
  {
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v23 = CFSTR("Filter does not support empty containers as values");
    goto LABEL_16;
  }
  v28 = v11;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v31 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        v29[0] = v13;
        v29[1] = 3221225472;
        v29[2] = __68___HKComparisonFilter__isValidValue_forKeyPath_allowedClases_error___block_invoke_2;
        v29[3] = &unk_1E37F4710;
        v29[4] = v20;
        if ((objc_msgSend(v12, "hk_containsObjectPassingTest:", v29) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a6, 3, CFSTR("%@ is not in the set of valid clases %@"), objc_opt_class(), v12);

          v21 = 0;
          goto LABEL_18;
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      if (v17)
        continue;
      break;
    }
  }

  v21 = 1;
LABEL_18:
  v11 = v28;
LABEL_20:

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  _HKComparisonFilter *v4;
  _HKComparisonFilter *v5;
  id value;
  id v7;
  BOOL v8;

  v4 = (_HKComparisonFilter *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v8 = -[NSString isEqualToString:](v5->_keyPath, "isEqualToString:", self->_keyPath)
        && v5->_operatorType == self->_operatorType
        && ((value = v5->_value, v7 = self->_value, value == v7) || v7 && objc_msgSend(value, "isEqual:"))
        && -[NSSet isEqual:](v5->_dataTypes, "isEqual:", self->_dataTypes)
        && v5->_applicationSDKVersionToken == self->_applicationSDKVersionToken;

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = self->_operatorType ^ -[NSString hash](self->_keyPath, "hash");
  v4 = objc_msgSend(self->_value, "hash");
  return v3 ^ v4 ^ -[NSSet hash](self->_dataTypes, "hash") ^ self->_applicationSDKVersionToken;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKComparisonFilter)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _HKComparisonFilter *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("operatorType"));
  objc_msgSend((id)objc_opt_class(), "allowedValueClassesForKeyPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("value"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForSetOf:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("dataTypes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sdkVersionToken"));
  v12 = HKBitPatternCastSignedToUnsignedInt64(v11);
  objc_msgSend((id)objc_opt_class(), "_filterForKeyPath:operatorType:value:dataTypes:applicationSDKVersionToken:isSubpredicate:", v5, v6, v8, v10, v12, 0);
  v13 = (_HKComparisonFilter *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKComparisonFilter;
  v4 = a3;
  -[_HKFilter encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_keyPath, CFSTR("keyPath"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_operatorType, CFSTR("operatorType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_value, CFSTR("value"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_dataTypes, CFSTR("dataTypes"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_applicationSDKVersionToken, CFSTR("sdkVersionToken"));

}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (unint64_t)operatorType
{
  return self->_operatorType;
}

- (id)value
{
  return self->_value;
}

- (NSSet)dataTypes
{
  return self->_dataTypes;
}

- (unint64_t)applicationSDKVersionToken
{
  return self->_applicationSDKVersionToken;
}

- (int64_t)keyPathIntegerValue
{
  return self->_keyPathIntegerValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataTypes, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

+ (BOOL)isSupportedKeyPath:(id)a3
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3();
  return 0;
}

+ (id)allowedDataTypeClassesForKeyPath:(id)a3
{
  const char *v3;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3();
  return (id)OUTLINED_FUNCTION_1_10(MEMORY[0x1E0C99E60], v3);
}

+ (id)allowedValueClassesForKeyPath:(id)a3
{
  const char *v3;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3();
  return (id)OUTLINED_FUNCTION_1_10(MEMORY[0x1E0C99E60], v3);
}

@end
