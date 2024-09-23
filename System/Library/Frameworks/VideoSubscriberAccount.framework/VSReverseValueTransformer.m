@implementation VSReverseValueTransformer

+ (id)reverseValueTransformerWithValueTransformer:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  VSReverseValueTransformer *v8;
  VSCompoundValueTransformer *v9;
  id v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = (void *)MEMORY[0x1E0C99DA0];
      v5 = *MEMORY[0x1E0C99778];
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "raise:format:", v5, CFSTR("Unexpectedly, valueTransformer was %@, instead of VSReverseValueTransformer."), v7);

    }
    objc_msgSend(v3, "valueTransformer");
    v8 = (VSReverseValueTransformer *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = objc_alloc_init(VSCompoundValueTransformer);
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v11 = (void *)MEMORY[0x1E0C99DA0];
        v12 = *MEMORY[0x1E0C99778];
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "raise:format:", v12, CFSTR("Unexpectedly, valueTransformer was %@, instead of VSCompoundValueTransformer."), v14);

      }
      objc_msgSend(v3, "valueTransformers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "reverseObjectEnumerator");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v24;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v24 != v19)
              objc_enumerationMutation(v16);
            +[VSReverseValueTransformer reverseValueTransformerWithValueTransformer:](VSReverseValueTransformer, "reverseValueTransformerWithValueTransformer:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v20));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v21);

            ++v20;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v18);
      }

      -[VSCompoundValueTransformer setValueTransformers:](v9, "setValueTransformers:", v10);
      if (!v9)
        goto LABEL_19;
      goto LABEL_20;
    }
    v8 = -[VSReverseValueTransformer initWithValueTransformer:]([VSReverseValueTransformer alloc], "initWithValueTransformer:", v3);
  }
  v9 = (VSCompoundValueTransformer *)v8;
  if (!v8)
LABEL_19:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The result parameter must not be nil."));
LABEL_20:

  return v9;
}

- (VSReverseValueTransformer)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (VSReverseValueTransformer)initWithValueTransformer:(id)a3
{
  id v5;
  VSReverseValueTransformer *v6;
  VSReverseValueTransformer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VSReverseValueTransformer;
  v6 = -[VSReverseValueTransformer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_valueTransformer, a3);

  return v7;
}

- (id)transformedValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[VSReverseValueTransformer valueTransformer](self, "valueTransformer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reverseTransformedValue:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)reverseTransformedValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[VSReverseValueTransformer valueTransformer](self, "valueTransformer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transformedValue:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSValueTransformer)valueTransformer
{
  return self->_valueTransformer;
}

- (void)setValueTransformer:(id)a3
{
  objc_storeStrong((id *)&self->_valueTransformer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueTransformer, 0);
}

@end
