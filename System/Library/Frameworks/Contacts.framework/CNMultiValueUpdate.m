@implementation CNMultiValueUpdate

+ (id)addValue:(id)a3
{
  id v3;
  CNMultiValueAddUpdate *v4;

  v3 = a3;
  v4 = -[CNMultiValueSingleUpdate initWithValue:]([CNMultiValueAddUpdate alloc], "initWithValue:", v3);

  return v4;
}

+ (id)removeValue:(id)a3
{
  id v3;
  CNMultiValueRemoveUpdate *v4;

  v3 = a3;
  v4 = -[CNMultiValueSingleUpdate initWithValue:]([CNMultiValueRemoveUpdate alloc], "initWithValue:", v3);

  return v4;
}

+ (id)replaceValue:(id)a3 withValue:(id)a4
{
  id v4;
  CNMultiValueReplaceUpdate *v5;

  v4 = a4;
  v5 = -[CNMultiValueSingleUpdate initWithValue:]([CNMultiValueReplaceUpdate alloc], "initWithValue:", v4);

  return v5;
}

+ (id)reorderValues:(id)a3
{
  id v3;
  CNMultiValueReorderUpdate *v4;

  v3 = a3;
  v4 = -[CNMultiValueReorderUpdate initWithValues:]([CNMultiValueReorderUpdate alloc], "initWithValues:", v3);

  return v4;
}

- (BOOL)ignoreIdentifiers
{
  return self->_ignoreIdentifiers;
}

- (void)setIgnoreIdentifiers:(BOOL)a3
{
  self->_ignoreIdentifiers = a3;
}

- (void)applyToMutableMultiValue:(id)a3 withIdentifierMap:(id)a4
{
  id v6;
  id v7;
  CNMultiValueUpdate *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CNAbstractMethodException();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (BOOL)applyToABPerson:(void *)a3 abmultivalue:(void *)a4 propertyDescription:(id)a5 isUnified:(BOOL)a6 logger:(id)a7 error:(id *)a8
{
  id v10;
  id v11;
  CNMultiValueUpdate *v12;
  id v13;

  v10 = a5;
  v11 = a7;
  v12 = self;
  CNAbstractMethodException();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v13);
}

- (int64_t)multiValueIndexForValue:(id)a3 inMultiValue:(void *)a4 identifier:(id *)a5
{
  id v7;
  id v8;
  uint64_t IndexForGUID;
  int64_t v10;
  void *v12;
  uint64_t v13;
  void *i;
  void *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "identifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  IndexForGUID = ABMultiValueGetIndexForGUID(a4, v8);
  if (IndexForGUID == -1)
  {

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v7, "linkedIdentifiers", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v13 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v12);
          v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          v16 = ABMultiValueGetIndexForGUID(a4, v15);
          if (v16 != -1)
          {
            v10 = v16;
            v8 = v15;
            goto LABEL_15;
          }
        }
        v8 = (id)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v8)
          continue;
        break;
      }
    }
    v10 = -1;
LABEL_15:

    if (a5)
      goto LABEL_3;
  }
  else
  {
    v10 = IndexForGUID;
    if (a5)
LABEL_3:
      *a5 = objc_retainAutorelease(v8);
  }

  return v10;
}

@end
