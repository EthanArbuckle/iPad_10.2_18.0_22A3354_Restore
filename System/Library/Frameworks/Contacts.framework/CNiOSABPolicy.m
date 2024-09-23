@implementation CNiOSABPolicy

- (unint64_t)maximumCountOfValuesForContactProperty:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  unint64_t v7;
  int v8;
  int v10;

  v3 = a3;
  +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (v10 = 0, objc_msgSend(v5, "abPropertyID:", &v10)))
  {
    v6 = ABPolicyMaximumNumberOfValuesForProperty();
    if (v6 >= 2 && objc_msgSend(v5, "isSingleValue"))
    {
      v7 = 1;
    }
    else
    {
      if (v6 == 0x7FFFFFFF)
        v8 = -1;
      else
        v8 = v6;
      v7 = v8;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (CNiOSABPolicy)initWithAddressBookPolicy:(void *)a3 readOnly:(BOOL)a4
{
  CNiOSABPolicy *v6;
  CNiOSABPolicy *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNiOSABPolicy;
  v6 = -[CNiOSABPolicy init](&v9, sel_init);
  v7 = v6;
  if (a3 && v6)
  {
    v6->_iOSABPolicy = a3;
    CFRetain(a3);
    v7->_abSourceIsContentReadonly = a4;
    v7->_fakePerson = (void *)ABPersonCreate();
  }
  return v7;
}

- (BOOL)isReadonly
{
  return self->_abSourceIsContentReadonly;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_fakePerson);
  CFRelease(self->_iOSABPolicy);
  v3.receiver = self;
  v3.super_class = (Class)CNiOSABPolicy;
  -[CNiOSABPolicy dealloc](&v3, sel_dealloc);
}

- (id)supportedLabelsForContactProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  int v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (v24 = 0, objc_msgSend(v6, "abPropertyID:", &v24)))
  {
    v7 = (void *)ABPolicyCopySupportedLabelsForProperty();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNiOSABConstantsMapping ABToCNLabelConstantsMapping](CNiOSABConstantsMapping, "ABToCNLabelConstantsMapping");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = ABPolicyCopyPreferredLabelsForProperty();
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      objc_msgSend(v7, "allKeys");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)v10;
      -[CNiOSABPolicy _orderedLabels:withOrder:](self, "_orderedLabels:withOrder:", v11, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v21 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(v9, "mappedConstant:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v17);

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        }
        while (v14);
      }

    }
    else if (objc_msgSend(v6, "isSingleValue"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_orderedLabels:(id)a3 withOrder:(id)a4
{
  id v5;
  void *v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = v5;
  if (a4)
  {
    v7 = (objc_class *)MEMORY[0x1E0C99E10];
    v8 = a4;
    v9 = (void *)objc_msgSend([v7 alloc], "initWithArray:", v8);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "intersectSet:", v10);
    objc_msgSend(v9, "addObjectsFromArray:", v6);
    objc_msgSend(v9, "array");
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = v5;
  }

  return v11;
}

- (unint64_t)maximumCountOfValuesForContactProperty:(id)a3 label:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFDictionary *v11;
  const __CFDictionary *v12;
  unint64_t Value;
  int v15;

  v5 = a4;
  v6 = a3;
  +[CNiOSABConstantsMapping CNToABLabelConstantsMapping](CNiOSABConstantsMapping, "CNToABLabelConstantsMapping");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mappedConstant:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10
    && (v15 = 0, objc_msgSend(v10, "abPropertyID:", &v15))
    && (v11 = (const __CFDictionary *)ABPolicyCopySupportedLabelsForProperty()) != 0)
  {
    v12 = v11;
    if (CFDictionaryContainsKey(v11, v8))
      Value = (unint64_t)CFDictionaryGetValue(v12, v8);
    else
      Value = 0;
    CFRelease(v12);
  }
  else
  {
    Value = -1;
  }

  return Value;
}

- (BOOL)shouldSetValue:(id)a3 property:(id)a4 contact:(id)a5 replacementValue:(id *)a6
{
  id v8;
  char ShouldSetValue;
  id v10;
  void *v11;
  void *v12;
  int v14;

  v8 = a3;
  if (self->_abSourceIsContentReadonly)
  {
    ShouldSetValue = 0;
  }
  else
  {
    v10 = a4;
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v14 = 0;
      ShouldSetValue = 0;
      if (objc_msgSend(v12, "abPropertyID:", &v14))
      {
        objc_msgSend(v12, "ABValueFromCNValue:", v8);
        ShouldSetValue = ABPolicyShouldSetValue();
      }
    }
    else
    {
      ShouldSetValue = 0;
    }

  }
  return ShouldSetValue;
}

- (BOOL)shouldAddContact:(id)a3
{
  if (self->_abSourceIsContentReadonly)
    return 0;
  else
    return ABPolicyShouldAddRecord();
}

- (BOOL)shouldRemoveContact:(id)a3
{
  if (self->_abSourceIsContentReadonly)
    return 0;
  else
    return ABPolicyShouldRemoveRecord();
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[CNiOSABPolicy isEqualToPolicy:](self, "isEqualToPolicy:", v4);

  return v5;
}

- (BOOL)isEqualToPolicy:(id)a3
{
  if (!self->_abSourceIsContentReadonly == (*((_BYTE *)a3 + 24) != 0))
    return 0;
  else
    return ABPolicyIsEqualToPolicy();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABPolicy)initWithCoder:(id)a3
{
  id v4;
  const void *v5;
  uint64_t v6;
  CNiOSABPolicy *v7;

  v4 = a3;
  v5 = (const void *)ABPolicyCreateWithCoder();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("read-only"));

  v7 = -[CNiOSABPolicy initWithAddressBookPolicy:readOnly:](self, "initWithAddressBookPolicy:readOnly:", v5, v6);
  CFRelease(v5);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  ABPolicyEncodeWithCoder();
  objc_msgSend(v4, "encodeBool:forKey:", self->_abSourceIsContentReadonly, CFSTR("read-only"));

}

@end
