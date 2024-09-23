@implementation SGPipelineTransformer

- (SGPipelineTransformer)initWithTransformers:(id)a3
{
  id v4;
  SGPipelineTransformer *v5;
  SGPipelineTransformer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SGPipelineTransformer;
  v5 = -[SGPipelineTransformer init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[SGPipelineTransformer setTransformers:](v5, "setTransformers:", v4);

  return v6;
}

- (id)transform:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__230;
  v13 = __Block_byref_object_dispose__231;
  v4 = a3;
  v14 = v4;
  -[SGPipelineTransformer transformers](self, "transformers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __35__SGPipelineTransformer_transform___block_invoke;
  v8[3] = &unk_24DDC4278;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)transform:(id)a3 stopAfterTransformerWithIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__230;
  v15 = __Block_byref_object_dispose__231;
  v6 = a3;
  v16 = v6;
  -[SGPipelineTransformer transformers](self, "transformers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65__SGPipelineTransformer_transform_stopAfterTransformerWithIndex___block_invoke;
  v10[3] = &unk_24DDC42A0;
  v10[4] = &v11;
  v10[5] = a4;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (id)toPlistWithChunks:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BE79AE0]);
  v6 = (void *)objc_msgSend(v5, "initWithClassNameKey:", *MEMORY[0x24BE79B08]);
  -[SGPipelineTransformer transformers](self, "transformers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v6;
  v14 = v4;
  v8 = v4;
  v9 = v6;
  sgMap();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = CFSTR("TRANSFORMERS");
  v16[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (SGPipelineTransformer)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  SGPipelineTransformer *v19;
  void *v21;
  void *v22;
  void *v23;

  v8 = a4;
  v9 = a5;
  v10 = (objc_class *)MEMORY[0x24BE79AE0];
  v11 = a3;
  v12 = [v10 alloc];
  v13 = (void *)objc_msgSend(v12, "initWithClassNameKey:", *MEMORY[0x24BE79B08]);
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("TRANSFORMERS"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = v13;
  v22 = v8;
  v23 = v9;
  v15 = v9;
  v16 = v8;
  v17 = v13;
  sgMap();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SGPipelineTransformer initWithTransformers:](self, "initWithTransformers:", v18);

  return v19;
}

- (BOOL)isEqualToPipelineTransformer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  if (v4)
  {
    -[SGPipelineTransformer transformers](self, "transformers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transformers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
    {
      v9 = 1;
    }
    else
    {
      -[SGPipelineTransformer transformers](self, "transformers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "transformers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  SGPipelineTransformer *v4;
  SGPipelineTransformer *v5;
  BOOL v6;

  v4 = (SGPipelineTransformer *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGPipelineTransformer isEqualToPipelineTransformer:](self, "isEqualToPipelineTransformer:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SGPipelineTransformer transformers](self, "transformers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSArray)transformers
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTransformers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformers, 0);
}

uint64_t __54__SGPipelineTransformer_initWithPlist_chunks_context___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "readObjectWithPlist:chunks:context:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __43__SGPipelineTransformer_toPlistWithChunks___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeToPlistWithObject:andChunks:", a2, *(_QWORD *)(a1 + 40));
}

void __65__SGPipelineTransformer_transform_stopAfterTransformerWithIndex___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (*(_QWORD *)(a1 + 40) >= a3)
  {
    objc_msgSend(a2, "transform:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  else if (a4)
  {
    *a4 = 1;
  }
}

void __35__SGPipelineTransformer_transform___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "transform:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

+ (id)withTransformers:(id)a3
{
  id v3;
  SGPipelineTransformer *v4;

  v3 = a3;
  v4 = -[SGPipelineTransformer initWithTransformers:]([SGPipelineTransformer alloc], "initWithTransformers:", v3);

  return v4;
}

@end
