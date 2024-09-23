@implementation CNCompoundMultiValuePropertyDescription

- (id)dictionaryTransform
{
  CNCompoundMultiValuePropertyDescription *v2;
  id v3;

  v2 = self;
  CNAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)fromDictionaryTransform
{
  CNCompoundMultiValuePropertyDescription *v2;
  id v3;

  v2 = self;
  CNAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (NSArray)summarizationKeys
{
  return 0;
}

- (id)stringForIndexingForContact:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  void *v13;
  id obj;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[CNPropertyDescription CNValueForContact:](self, "CNValueForContact:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    obj = v4;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          -[CNCompoundMultiValuePropertyDescription dictionaryTransform](self, "dictionaryTransform");
          v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "value");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v11)[2](v11, v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __71__CNCompoundMultiValuePropertyDescription_stringForIndexingForContact___block_invoke;
          v16[3] = &unk_1E29FBFE0;
          v17 = v5;
          objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v16);

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __71__CNCompoundMultiValuePropertyDescription_stringForIndexingForContact___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "appendString:", v4);
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(" "));
  }

}

@end
