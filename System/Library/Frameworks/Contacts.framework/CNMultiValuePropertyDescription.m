@implementation CNMultiValuePropertyDescription

- (BOOL)applyABMultivalueValueBytes:(char *)a3 length:(unint64_t)a4 identifier:(id)a5 legacyIdentifier:(int)a6 label:(id)a7 toCNMultivalueRepresentation:(id)a8
{
  uint64_t v9;
  id v14;
  id v15;
  id v16;
  void *v17;

  v9 = *(_QWORD *)&a6;
  v14 = a8;
  v15 = a7;
  v16 = a5;
  -[CNMultiValuePropertyDescription CNLabeledValueValueFromABMultiValueValueBytes:length:](self, "CNLabeledValueValueFromABMultiValueValueBytes:length:", a3, a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNMultiValuePropertyDescription applyCNValue:toArray:identifier:legacyIdentifier:label:](self, "applyCNValue:toArray:identifier:legacyIdentifier:label:", v17, v14, v16, v9, v15);

  return 1;
}

- (BOOL)applyCNValue:(id)a3 toArray:(id)a4 identifier:(id)a5 legacyIdentifier:(int)a6 label:(id)a7
{
  uint64_t v7;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v7 = *(_QWORD *)&a6;
  v11 = a7;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = -[CNLabeledValue primitiveInitWithIdentifier:label:value:]([CNLabeledValue alloc], "primitiveInitWithIdentifier:label:value:", v12, v11, v14);

  objc_msgSend(v15, "setIOSLegacyIdentifier:", v7);
  objc_msgSend(v13, "addObject:", v15);

  return 1;
}

- (id)CNMutableValueForABMultivalue
{
  return (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
}

- (id)CNLabeledValueValueFromABMultiValueValueBytes:(char *)a3 length:(unint64_t)a4
{
  if (a3)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a3, a4, 4);
  else
    return 0;
}

- (BOOL)isMultiValue
{
  return 1;
}

- (void)assertValueType:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  id obj;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CNMultiValuePropertyDescription;
  -[CNPropertyDescription assertValueType:](&v24, sel_assertValueType_, v4);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = v5;
    v19 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v19)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v9 = (void *)MEMORY[0x1E0C99DA0];
          v10 = CNPropertyInvalidTypeExceptionName;
          v11 = objc_opt_class();
          -[CNPropertyDescription key](self, "key");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "raise:format:", v10, CFSTR("Labeled value %@ has incorrect type %@ for key %@. It should be %@."), v8, v11, v12, objc_opt_class());

        }
        objc_msgSend(v8, "label");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v14 = (void *)MEMORY[0x1E0C99DA0];
            v15 = CNPropertyInvalidTypeExceptionName;
            v16 = objc_opt_class();
            objc_msgSend(v14, "raise:format:", v15, CFSTR("Labeled value %@ label %@ has incorrect type %@. It should be %@."), v8, v13, v16, objc_opt_class());
          }
        }
        objc_msgSend(v8, "value");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNMultiValuePropertyDescription labeledValueClass](self, "labeledValueClass");
        if ((objc_opt_isKindOfClass() & 1) == 0)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CNPropertyInvalidTypeExceptionName, CFSTR("Labeled value %@ value %@ has incorrect type %@. It should be %@."), v8, v17, objc_opt_class(), -[CNMultiValuePropertyDescription labeledValueClass](self, "labeledValueClass"));

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v6);
  }

}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (Class)labeledValueClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isSingleValue
{
  return 0;
}

- (NSArray)managedLabels
{
  return 0;
}

void __116__CNMultiValuePropertyDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue_destinationClass_settersByABKeys___block_invoke(uint64_t a1, const void *a2, void *a3)
{
  const void *Value;
  void (**v6)(id, _QWORD, const void *);

  v6 = a3;
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), a2);
  if (Value)
    v6[2](v6, *(_QWORD *)(a1 + 32), Value);

}

- (BOOL)applyDictionary:(id)a3 identifier:(id)a4 legacyIdentifier:(int)a5 label:(id)a6 toCNMultivalueRepresentation:(id)a7
{
  uint64_t v9;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;

  v9 = *(_QWORD *)&a5;
  v12 = a3;
  v13 = *MEMORY[0x1E0CF5F80];
  v14 = a7;
  v15 = a6;
  v16 = a4;
  objc_msgSend(v12, "objectForKey:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "componentsSeparatedByString:", CFSTR(","));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v12, "mutableCopy");
    objc_msgSend(v20, "setObject:forKey:", v19, v13);

    v12 = v20;
  }
  -[CNMultiValuePropertyDescription CNLabeledValueValueFromABMultiValueValue:](self, "CNLabeledValueValueFromABMultiValueValue:", v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = -[CNMultiValuePropertyDescription applyCNValue:toArray:identifier:legacyIdentifier:label:](self, "applyCNValue:toArray:identifier:legacyIdentifier:label:", v21, v14, v16, v9, v15);
  return v22;
}

- (id)CNLabeledValueValueFromABMultiValueValue:(void *)a3 destinationClass:(Class)a4 settersByABKeys:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  void *v13;

  v7 = a5;
  v8 = objc_alloc_init(a4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __116__CNMultiValuePropertyDescription_iOSAB__CNLabeledValueValueFromABMultiValueValue_destinationClass_settersByABKeys___block_invoke;
  v11[3] = &unk_1E29FB988;
  v13 = a3;
  v9 = v8;
  v12 = v9;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v11);

  return v9;
}

- (unsigned)abPropertyType
{
  return 1;
}

- (void)ABValueFromCNValue:(id)a3
{
  id v4;
  ABMutableMultiValueRef Mutable;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *IdentifierAtIndex;
  CFTypeRef v17;
  id obj;
  uint64_t v20;
  CNMultiValuePropertyDescription *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[CNiOSABConstantsMapping CNToABLabelConstantsMapping](CNiOSABConstantsMapping, "CNToABLabelConstantsMapping");
  v21 = self;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  Mutable = ABMultiValueCreateMutable(-[CNMultiValuePropertyDescription abPropertyType](self, "abPropertyType"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v20 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      v10 = v8;
      do
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v9);
        objc_msgSend(v11, "value");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNMultiValuePropertyDescription ABMultiValueValueFromCNLabeledValueValue:](v21, "ABMultiValueValueFromCNLabeledValueValue:", v12);
        objc_msgSend(v11, "label");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "mappedConstant:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        ABMultiValueInsertValueAndLabelAndUUIDAtIndex();

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      v8 = v10 + v9;
    }
    while (v7);
  }
  IdentifierAtIndex = (const __CFString *)ABMultiValueGetIdentifierAtIndex(Mutable, 0);
  ABMultiValueSetPrimaryIdentifier(Mutable, IdentifierAtIndex);
  if (Mutable)
    v17 = CFAutorelease(Mutable);
  else
    v17 = 0;

  return (void *)v17;
}

- (id)CNValueFromABValue:(void *)a3
{
  CFIndex v5;
  CFTypeRef v6;
  CFStringRef v7;
  uint64_t IdentifierAtIndex;
  const void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v16;
  CFIndex Count;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  Count = ABMultiValueGetCount(a3);
  if (Count >= 1)
  {
    v5 = 0;
    do
    {
      v6 = ABMultiValueCopyValueAtIndex(a3, v5);
      v7 = ABMultiValueCopyLabelAtIndex(a3, v5);
      IdentifierAtIndex = ABMultiValueGetIdentifierAtIndex(a3, v5);
      v9 = (const void *)ABMultiValueCopyUUIDAtIndex();
      -[CNMultiValuePropertyDescription CNLabeledValueValueFromABMultiValueValue:](self, "CNLabeledValueValueFromABMultiValueValue:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNMultiValuePropertyDescription CNLabeledValueLabelFromABMultiValueLabel:](self, "CNLabeledValueLabelFromABMultiValueLabel:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v12 = -[CNLabeledValue primitiveInitWithIdentifier:label:value:]([CNLabeledValue alloc], "primitiveInitWithIdentifier:label:value:", v9, v11, v10);
        objc_msgSend(v12, "setIOSLegacyIdentifier:", IdentifierAtIndex);
        objc_msgSend(v16, "addObject:", v12);

      }
      if (v6)
        CFRelease(v6);
      if (v7)
        CFRelease(v7);
      if (v9)
        CFRelease(v9);

      ++v5;
    }
    while (Count != v5);
  }
  v13 = v16;
  v14 = (void *)objc_msgSend(v16, "copy", v16);

  return v14;
}

- (id)CNLabeledValueValueFromABMultiValueValue:(void *)a3
{
  return a3;
}

- (id)CNLabeledValueLabelFromABMultiValueLabel:(__CFString *)a3
{
  void *v4;
  void *v5;

  +[CNiOSABConstantsMapping ABToCNLabelConstantsMapping](CNiOSABConstantsMapping, "ABToCNLabelConstantsMapping");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mappedConstant:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)ABMultiValueValueFromCNLabeledValueValue:(id)a3
{
  return a3;
}

- (__CFString)ABMultiValueLabelFromCNLabeledValueLabel:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;

  v3 = a3;
  +[CNiOSABConstantsMapping CNToABLabelConstantsMapping](CNiOSABConstantsMapping, "CNToABLabelConstantsMapping");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (__CFString *)objc_msgSend(v4, "mappedConstant:", v3);

  return v5;
}

- (void)ABMultiValueValueFromCNLabeledValueValue:(id)a3 gettersByABKeys:(id)a4
{
  id v5;
  const __CFAllocator *v6;
  id v7;
  const void *Mutable;
  id v9;
  _QWORD v11[4];
  id v12;
  const void *v13;

  v5 = a3;
  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v7 = a4;
  Mutable = CFDictionaryCreateMutable(v6, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __99__CNMultiValuePropertyDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue_gettersByABKeys___block_invoke;
  v11[3] = &unk_1E29FB988;
  v9 = v5;
  v12 = v9;
  v13 = Mutable;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v11);

  if (Mutable)
    Mutable = CFAutorelease(Mutable);

  return (void *)Mutable;
}

void __99__CNMultiValuePropertyDescription_iOSAB__ABMultiValueValueFromCNLabeledValueValue_gettersByABKeys___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  const __CFString *v5;
  const __CFString *v6;
  CFTypeID v7;
  id key;

  key = a2;
  v5 = (const __CFString *)(*(uint64_t (**)(uint64_t, _QWORD))(a3 + 16))(a3, *(_QWORD *)(a1 + 32));
  if (v5)
  {
    v6 = v5;
    v7 = CFGetTypeID(v5);
    if (v7 != CFStringGetTypeID() || CFStringGetLength(v6) >= 1)
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), key, v6);
  }

}

- (void)ABMutableMultiValueForABPerson:(void *)a3
{
  void *v4;
  void *result;

  v4 = -[CNPropertyDescription ABValueForABPerson:](self, "ABValueForABPerson:", a3);
  if (v4)
  {
    result = (void *)ABMultiValueCreateMutableCopy(v4);
    if (!result)
      return result;
    return (void *)CFAutorelease(result);
  }
  result = (void *)ABMultiValueCreateMutable(-[CNMultiValuePropertyDescription abPropertyType](self, "abPropertyType"));
  if (result)
    return (void *)CFAutorelease(result);
  return result;
}

- (BOOL)isEqualIgnoringIdentifiersForContact:(id)a3 other:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[CNPropertyDescription CNValueForContact:](self, "CNValueForContact:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyDescription CNValueForContact:](self, "CNValueForContact:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = +[CNLabeledValue isArrayOfEntries:equalToArrayOfEntriesIgnoringIdentifiers:](CNLabeledValue, "isArrayOfEntries:equalToArrayOfEntriesIgnoringIdentifiers:", v7, v8);
  return (char)v6;
}

- (BOOL)isValidValue:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  BOOL v14;
  id v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[2];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "value");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 0;
          v14 = -[CNMultiValuePropertyDescription isValidMultiValueValue:error:](self, "isValidMultiValueValue:error:", v13, &v22);
          v15 = v22;
          v16 = v15;
          if (!v14)
          {
            if (a4)
            {
              -[CNPropertyDescription key](self, "key");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v27[0] = v18;
              v27[1] = CFSTR("value");
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "componentsJoinedByString:", CFSTR("."));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              +[CNErrorFactory errorByPrependingKeyPath:toKeyPathsInError:](CNErrorFactory, "errorByPrependingKeyPath:toKeyPathsInError:", v20, v16);
              *a4 = (id)objc_claimAutoreleasedReturnValue();

            }
            v17 = 0;
            goto LABEL_14;
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        if (v10)
          continue;
        break;
      }
    }
    v17 = 1;
LABEL_14:

  }
  else
  {
    v17 = 1;
  }

  return v17;
}

- (BOOL)isValidMultiValueValue:(id)a3 error:(id *)a4
{
  id v5;
  char v6;

  v5 = a3;
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EE18E578))
    v6 = objc_msgSend(v5, "isValid:", a4);
  else
    v6 = 1;

  return v6;
}

- (id)stringForIndexingForContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[objc_class isSubclassOfClass:](-[CNMultiValuePropertyDescription labeledValueClass](self, "labeledValueClass"), "isSubclassOfClass:", objc_opt_class()))
  {
    -[CNPropertyDescription CNValueForContact:](self, "CNValueForContact:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v7 = v5;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v15;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v15 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "value", (_QWORD)v14);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "appendString:", v12);

            objc_msgSend(v6, "appendString:", CFSTR(" "));
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v9);
      }

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)valueWithResetIdentifiers:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "label", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "value");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[CNLabeledValue labeledValueWithLabel:value:](CNLabeledValue, "labeledValueWithLabel:value:", v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "addObject:", v13);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)plistTransform
{
  return +[CN nullTransform](CN, "nullTransform");
}

- (id)fromPlistTransform
{
  return +[CN nullTransform](CN, "nullTransform");
}

- (id)standardLabelsWithOptions:(unint64_t)a3
{
  if ((a3 & 2) != 0)
    return MEMORY[0x1E0C9AA60];
  -[CNMultiValuePropertyDescription standardLabels](self, "standardLabels");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)standardLabels
{
  if (standardLabels_cn_once_token_0 != -1)
    dispatch_once(&standardLabels_cn_once_token_0, &__block_literal_global_92);
  return (NSArray *)(id)standardLabels_cn_once_object_0;
}

void __49__CNMultiValuePropertyDescription_standardLabels__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("_$!<Home>!$_"), CFSTR("_$!<Work>!$_"), CFSTR("_$!<School>!$_"), CFSTR("_$!<Other>!$_"), 0);
  v1 = (void *)standardLabels_cn_once_object_0;
  standardLabels_cn_once_object_0 = v0;

}

- (id)localizedStringForLabel:(id)a3
{
  return +[CNLabeledValue localizedStringForLabel:](CNLabeledValue, "localizedStringForLabel:", a3);
}

@end
