@implementation VSCompoundValueTransformer

- (VSCompoundValueTransformer)init
{
  VSCompoundValueTransformer *v2;
  VSCompoundValueTransformer *v3;
  NSArray *valueTransformers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSCompoundValueTransformer;
  v2 = -[VSCompoundValueTransformer init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    valueTransformers = v2->_valueTransformers;
    v2->_valueTransformers = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v3;
}

- (id)transformedValue:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)VSCompoundValueTransformer;
  -[VSCompoundValueTransformer transformedValue:](&v16, sel_transformedValue_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[VSCompoundValueTransformer valueTransformers](self, "valueTransformers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      v10 = v4;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "transformedValue:", v10);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        ++v9;
        v10 = v4;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)reverseTransformedValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
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
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[VSCompoundValueTransformer valueTransformers](self, "valueTransformers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reverseObjectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  v8 = v4;
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v15;
    v8 = v4;
    do
    {
      v11 = 0;
      v12 = v8;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "reverseTransformedValue:", v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        ++v11;
        v12 = v8;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v8;
}

- (NSArray)valueTransformers
{
  return self->_valueTransformers;
}

- (void)setValueTransformers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueTransformers, 0);
}

@end
