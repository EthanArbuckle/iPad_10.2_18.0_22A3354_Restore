@implementation _MLSNVGGishFeatureEmbedding

- (_MLSNVGGishFeatureEmbedding)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)p_isa
{
  id v9;
  id v10;
  void *v11;
  MLCustomModel *v12;
  MLCustomModel *featureEmbeddingModel;
  MLCustomModel *v14;
  MLCustomModel *v15;
  void *v16;
  void *v17;
  const __CFString **v18;
  uint64_t *v19;
  void *v20;
  objc_super v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  +[_MLSNFrameworkHandle sharedHandle](_MLSNFrameworkHandle, "sharedHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    if (!p_isa)
      goto LABEL_15;
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2D50];
    v30[0] = CFSTR("Framework not available on this version");
    v17 = (void *)MEMORY[0x1E0C99D80];
    v18 = (const __CFString **)v30;
    v19 = &v29;
    goto LABEL_14;
  }
  if (!NSClassFromString(CFSTR("_SNVGGishFeatureEmbeddingCustomModel")))
  {
    if (!p_isa)
      goto LABEL_15;
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0CB2D50];
    v28 = CFSTR("Feature embedding not available on this version");
    v17 = (void *)MEMORY[0x1E0C99D80];
    v18 = &v28;
    v19 = &v27;
    goto LABEL_14;
  }
  if ((-[objc_class conformsToProtocol:](NSClassFromString(CFSTR("_SNVGGishFeatureEmbeddingCustomModel")), "conformsToProtocol:", &unk_1EE435650) & 1) == 0)
  {
    if (!p_isa)
      goto LABEL_15;
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0CB2D50];
    v26 = CFSTR("Frontend processing does not conform to custom model protocol");
    v17 = (void *)MEMORY[0x1E0C99D80];
    v18 = &v26;
    v19 = &v25;
    goto LABEL_14;
  }
  v22.receiver = self;
  v22.super_class = (Class)_MLSNVGGishFeatureEmbedding;
  self = -[_MLSNVGGishFeatureEmbedding init](&v22, sel_init);
  if (self)
  {
    v12 = (MLCustomModel *)objc_alloc(NSClassFromString(CFSTR("_SNVGGishFeatureEmbeddingCustomModel")));
    featureEmbeddingModel = self->_featureEmbeddingModel;
    self->_featureEmbeddingModel = v12;

    v14 = -[MLCustomModel initWithModelDescription:parameterDictionary:error:](self->_featureEmbeddingModel, "initWithModelDescription:parameterDictionary:error:", v9, v10, p_isa);
    v15 = self->_featureEmbeddingModel;
    self->_featureEmbeddingModel = v14;

    if (self->_featureEmbeddingModel)
    {
      objc_storeStrong((id *)&self->_modelDescription, a3);
      goto LABEL_7;
    }
    if (!p_isa)
      goto LABEL_15;
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    v24 = CFSTR("Feature embedding failed to init");
    v17 = (void *)MEMORY[0x1E0C99D80];
    v18 = &v24;
    v19 = &v23;
LABEL_14:
    objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple"), 0, v20);
    *p_isa = (id)objc_claimAutoreleasedReturnValue();

    p_isa = 0;
    goto LABEL_15;
  }
LABEL_7:
  self = self;
  p_isa = (id *)&self->super.isa;
LABEL_15:

  return (_MLSNVGGishFeatureEmbedding *)p_isa;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  return (id)-[MLCustomModel predictionFromFeatures:options:error:](self->_featureEmbeddingModel, "predictionFromFeatures:options:error:", a3, a4, a5);
}

- (MLModelDescription)modelDescription
{
  return self->_modelDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelDescription, 0);
  objc_storeStrong((id *)&self->_featureEmbeddingModel, 0);
}

@end
