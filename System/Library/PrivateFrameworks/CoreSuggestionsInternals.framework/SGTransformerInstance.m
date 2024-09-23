@implementation SGTransformerInstance

- (SGTransformerInstance)initWithTransformer:(id)a3 sessionDescriptor:(id)a4 modelClass:(Class)a5
{
  id v10;
  id v11;
  void *v12;
  SGTransformerInstance *v13;
  SGTransformerInstance *v14;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGModels.m"), 292, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sessionDescriptor"));

    if (a5)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGModels.m"), 291, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transformer"));

  if (!v12)
    goto LABEL_8;
LABEL_3:
  if (a5)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGModels.m"), 293, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("modelClass"));

LABEL_4:
  v19.receiver = self;
  v19.super_class = (Class)SGTransformerInstance;
  v13 = -[SGTransformerInstance init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_transformer, a3);
    objc_storeStrong((id *)&v14->_sessionDescriptor, a4);
    objc_storeStrong((id *)&v14->_modelClass, a5);
  }

  return v14;
}

- (id)trainingFeaturesOf:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a3;
  -[SGTransformerInstance sessionDescriptor](self, "sessionDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGTransformerInstance transformer](self, "transformer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v6)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGModels.m"), 305, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.transformer"));

    if (v6)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGModels.m"), 306, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sessionDescriptor"));

LABEL_3:
  if (!-[SGTransformerInstance modelClass](self, "modelClass"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGModels.m"), 307, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.modelClass"));

  }
  v8 = (void *)MEMORY[0x1C3BD4F6C]();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D19ED8]), "initWithSessionDescriptor:modelClass:", v6, -[SGTransformerInstance modelClass](self, "modelClass"));
  -[SGTransformerInstance transformer](self, "transformer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transform:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGModels.m"), 311, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[vector isKindOfClass:PMLSparseVector.class]"));

  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D19ED0]), "initWithSource:vector:", v9, v11);

  objc_autoreleasePoolPop(v8);
  return v12;
}

- (PMLSessionDescriptor)sessionDescriptor
{
  return self->_sessionDescriptor;
}

- (void)setSessionDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_sessionDescriptor, a3);
}

- (PMLTransformerProtocol)transformer
{
  return self->_transformer;
}

- (void)setTransformer:(id)a3
{
  objc_storeStrong((id *)&self->_transformer, a3);
}

- (Class)modelClass
{
  return self->_modelClass;
}

- (void)setModelClass:(Class)a3
{
  objc_storeStrong((id *)&self->_modelClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelClass, 0);
  objc_storeStrong((id *)&self->_transformer, 0);
  objc_storeStrong((id *)&self->_sessionDescriptor, 0);
}

+ (id)defaultWindowAndNgrams
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0D19EC8], "rules");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("TOKEN_WINDOW"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");
  if (v4)
    v5 = v4;
  else
    v5 = 12;

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NGRAMS"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  if (v7)
    v8 = v7;
  else
    v8 = 3;

  v9 = (void *)MEMORY[0x1E0D81638];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tupleWithFirst:second:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)defaultSessionDescriptorForModelId:(id)a3 featureVersion:(id)a4 language:(id)a5 windowAndNgrams:(id)a6
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v9 = (objc_class *)MEMORY[0x1E0CB3940];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [v9 alloc];
  objc_msgSend(v10, "first");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "second");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("TW=%@&NG=%@&FV=%@"), v15, v16, v12);
  objc_msgSend(MEMORY[0x1E0D81060], "descriptorForName:version:locale:", v13, v17, v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

@end
