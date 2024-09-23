@implementation VSFailableValueTransformer

- (NSValueTransformer)objectValueTransformer
{
  NSValueTransformer *v2;

  v2 = self->_objectValueTransformer;
  if (!v2)
    v2 = (NSValueTransformer *)objc_alloc_init(MEMORY[0x1E0CB3B20]);
  return v2;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 0;
}

- (id)transformedValue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v5 = v4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__2;
  v23 = __Block_byref_object_dispose__2;
  v24 = 0;
  if (v4)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v7 = (void *)MEMORY[0x1E0C99DA0];
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unexpectedly, value was %@, instead of VSFailable."), v9);

      }
      v10 = v6;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __47__VSFailableValueTransformer_transformedValue___block_invoke;
      v18[3] = &unk_1E939FD00;
      v18[4] = self;
      v18[5] = &v19;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __47__VSFailableValueTransformer_transformedValue___block_invoke_2;
      v15[3] = &unk_1E939FD28;
      v17 = &v19;
      v11 = v10;
      v16 = v11;
      objc_msgSend(v11, "unwrapObject:error:", v18, v15);

    }
    v12 = (void *)v20[5];
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;
  _Block_object_dispose(&v19, 8);

  return v13;
}

void __47__VSFailableValueTransformer_transformedValue___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectValueTransformer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transformedValue:", v4);
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __47__VSFailableValueTransformer_transformedValue___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(a1 + 32));
}

- (void)setObjectValueTransformer:(id)a3
{
  objc_storeStrong((id *)&self->_objectValueTransformer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectValueTransformer, 0);
}

@end
