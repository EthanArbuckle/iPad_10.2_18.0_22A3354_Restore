@implementation CNPropertyDescription

- (id)CNValueFromABBytes:(char *)a3 length:(unint64_t)a4
{
  return +[CNiOSABConversions stringFromABBytes:length:](CNiOSABConversions, "stringFromABBytes:length:", a3, a4);
}

- (CNPropertyDescription)initWithKey:(id)a3 readSelector:(SEL)a4 writeSelector:(SEL)a5
{
  id v8;
  CNPropertyDescription *v9;
  uint64_t v10;
  NSString *key;
  void *v12;
  uint64_t v13;
  id valueForKeyTransform;
  CNPropertyDescription *v15;
  _QWORD aBlock[4];
  id v18;
  objc_super v19;

  v8 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CNPropertyDescription;
  v9 = -[CNPropertyDescription init](&v19, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    key = v9->_key;
    v9->_key = (NSString *)v10;

    v9->_readSelector = a4;
    v9->_writeSelector = a5;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__CNPropertyDescription_initWithKey_readSelector_writeSelector___block_invoke;
    aBlock[3] = &unk_1E29FCE08;
    v18 = v8;
    v12 = _Block_copy(aBlock);
    v13 = objc_msgSend(v12, "copy");
    valueForKeyTransform = v9->_valueForKeyTransform;
    v9->_valueForKeyTransform = (id)v13;

    v15 = v9;
  }

  return v9;
}

- (NSString)key
{
  return self->_key;
}

- (BOOL)abPropertyID:(int *)a3
{
  return 0;
}

- (BOOL)isMultiValue
{
  return 0;
}

- (void)assertValueType:(id)a3
{
  void *v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  if (v8)
  {
    -[CNPropertyDescription valueClass](self, "valueClass");
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = (void *)MEMORY[0x1E0C99DA0];
      v5 = CNPropertyInvalidTypeExceptionName;
      v6 = objc_opt_class();
      -[CNPropertyDescription key](self, "key");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "raise:format:", v5, CFSTR("Value %@ has incorrect type %@ for key %@. It should be %@."), v8, v6, v7, -[CNPropertyDescription valueClass](self, "valueClass"));

    }
  }

}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)unifiableLabelsForLabel:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[CNPropertyDescription equivalentLabelSets](self, "equivalentLabelSets");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v10, "containsObject:", v4))
        {
          v21 = 0u;
          v22 = 0u;
          v19 = 0u;
          v20 = 0u;
          v11 = v10;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v20;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v20 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
                if ((objc_msgSend(v16, "isEqualToString:", v4) & 1) == 0)
                  objc_msgSend(v5, "addObject:", v16);
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            }
            while (v13);
          }

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

  return v5;
}

- (id)nilValue
{
  return 0;
}

- (BOOL)isWritable
{
  return self->_writeSelector != 0;
}

- (id)CNValueFromABValue:(void *)a3
{
  return a3;
}

- (void)ABValueForABPerson:(void *)a3
{
  void *result;
  ABPropertyID property;

  property = 0;
  -[CNPropertyDescription abPropertyID:](self, "abPropertyID:", &property);
  result = (void *)ABRecordCopyValue(a3, property);
  if (result)
    return (void *)CFAutorelease(result);
  return result;
}

- (BOOL)isSingleValue
{
  return 1;
}

void __44__CNPropertyDescription_equivalentLabelSets__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  v1 = (void *)equivalentLabelSets_cn_once_object_1;
  equivalentLabelSets_cn_once_object_1 = (uint64_t)v0;

}

- (BOOL)isValue:(id)a3 preferredToUnifiedValue:(id)a4
{
  return 0;
}

- (NSArray)equivalentLabelSets
{
  if (equivalentLabelSets_cn_once_token_1 != -1)
    dispatch_once(&equivalentLabelSets_cn_once_token_1, &__block_literal_global_8_4);
  return (NSArray *)(id)equivalentLabelSets_cn_once_object_1;
}

- (id)CNMutableValueForABMultivalue
{
  return 0;
}

- (BOOL)applyABMultivalueValueBytes:(char *)a3 length:(unint64_t)a4 identifier:(id)a5 legacyIdentifier:(int)a6 label:(id)a7 toCNMultivalueRepresentation:(id)a8
{
  return 0;
}

- (BOOL)applyDictionary:(id)a3 identifier:(id)a4 legacyIdentifier:(int)a5 label:(id)a6 toCNMultivalueRepresentation:(id)a7
{
  return 0;
}

- (void)ABValueFromCNValue:(id)a3
{
  return a3;
}

- (BOOL)supportsABLazyLoading
{
  int v3;

  v3 = -1;
  if (-[CNPropertyDescription abPropertyID:](self, "abPropertyID:", &v3))
    return ABCPersonPropertySupportsLazyLoading();
  else
    return 1;
}

- (BOOL)setABValue:(void *)a3 onABPerson:(void *)a4 error:(__CFError *)a5
{
  ABPropertyID property;

  property = 0;
  -[CNPropertyDescription abPropertyID:](self, "abPropertyID:", &property);
  if (ABPersonGetTypeOfProperty(property) == 1 && !objc_msgSend(a3, "length"))
    a3 = 0;
  return ABRecordSetValue(a4, property, a3, a5);
}

- (BOOL)setCNValue:(id)a3 onABPerson:(void *)a4 withDependentPropertiesContext:(id)a5 error:(id *)a6
{
  BOOL v7;
  BOOL v8;
  CFTypeRef cf;

  cf = 0;
  v7 = -[CNPropertyDescription setABValue:onABPerson:error:](self, "setABValue:onABPerson:error:", -[CNPropertyDescription ABValueFromCNValue:](self, "ABValueFromCNValue:", a3, a4, a5), a4, &cf);
  v8 = v7;
  if (a6)
  {
    if (!v7)
    {
      +[CNErrorFactory errorForiOSABError:](CNErrorFactory, "errorForiOSABError:", cf);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      if (cf)
        CFRelease(cf);
    }
  }
  return v8;
}

- (void)copyFromABPerson:(void *)a3 toContact:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[CNPropertyDescription CNValueFromABValue:](self, "CNValueFromABValue:", -[CNPropertyDescription ABValueForABPerson:](self, "ABValueForABPerson:", a3));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CNPropertyDescription setCNValue:onContact:](self, "setCNValue:onContact:", v7, v6);

}

+ (id)os_log
{
  if (os_log_cn_once_token_0_17 != -1)
    dispatch_once(&os_log_cn_once_token_0_17, &__block_literal_global_107);
  return (id)os_log_cn_once_object_0_17;
}

void __31__CNPropertyDescription_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "CNPropertyDescription");
  v1 = (void *)os_log_cn_once_object_0_17;
  os_log_cn_once_object_0_17 = (uint64_t)v0;

}

uint64_t __64__CNPropertyDescription_initWithKey_readSelector_writeSelector___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "valueForKey:", *(_QWORD *)(a1 + 32));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNPropertyDescription)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  CNPropertyDescription *v6;
  CNPropertyDescription *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v6 = (CNPropertyDescription *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyDescription objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v5);
    v7 = (CNPropertyDescription *)objc_claimAutoreleasedReturnValue();

    self = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_key, CFSTR("key"));
}

- (id)valueWithResetIdentifiers:(id)a3
{
  return a3;
}

- (BOOL)isValue:(id)a3 equalToEmptyEquivalentOrValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    -[CNPropertyDescription nilValue](self, "nilValue");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v8)
      goto LABEL_3;
LABEL_5:
    -[CNPropertyDescription nilValue](self, "nilValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  v9 = objc_msgSend(MEMORY[0x1E0D13A40], "isObject:equalToOther:", v6, v8);

  return v9;
}

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
  id v6;
  id v7;
  CNPropertyDescription *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CNAbstractMethodException();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (void)decodeUsingCoder:(id)a3 contact:(id)a4
{
  id v6;
  id v7;
  CNPropertyDescription *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CNAbstractMethodException();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (BOOL)isValidValue:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  id v12;

  v6 = a3;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "conformsToProtocol:", &unk_1EE18E578))
  {
    v12 = 0;
    v8 = objc_msgSend(v7, "isValid:", &v12);
    v9 = v12;
    if ((v8 & 1) == 0 && a4)
    {
      -[CNPropertyDescription key](self, "key");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNErrorFactory errorByPrependingKeyPath:toKeyPathsInError:](CNErrorFactory, "errorByPrependingKeyPath:toKeyPathsInError:", v10, v9);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CNPropertyDescription key](self, "key");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v7, v8);

}

- (id)CNValueForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNPropertyDescription key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)stringForIndexingForContact:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (-[CNPropertyDescription isSingleValue](self, "isSingleValue"))
  {
    -[CNPropertyDescription CNValueForContact:](self, "CNValueForContact:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (SEL)readSelector
{
  return self->_readSelector;
}

- (SEL)writeSelector
{
  return self->_writeSelector;
}

- (id)valueForKeyTransform
{
  return self->_valueForKeyTransform;
}

- (BOOL)isNonnull
{
  return self->_isNonnull;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_valueForKeyTransform, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
