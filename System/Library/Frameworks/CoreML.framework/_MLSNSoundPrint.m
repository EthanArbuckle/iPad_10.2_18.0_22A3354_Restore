@implementation _MLSNSoundPrint

- (_MLSNSoundPrint)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  MLCustomModel *v12;
  MLCustomModel *featureEmbeddingModel;
  MLCustomModel *v14;
  MLCustomModel *v15;
  _MLSNSoundPrint *v16;
  const __CFString *v17;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  +[_MLSNFrameworkHandle sharedHandle](_MLSNFrameworkHandle, "sharedHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    if (!a5)
      goto LABEL_17;
    v17 = CFSTR("Framework not available on this version.");
LABEL_16:
    +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 5, v17);
    v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (!NSClassFromString(CFSTR("_SNSoundPrintAFeatureEmbeddingCustomModel")))
  {
    if (!a5)
      goto LABEL_17;
    v17 = CFSTR("Sound Print not available on this version.");
    goto LABEL_16;
  }
  if ((-[objc_class conformsToProtocol:](NSClassFromString(CFSTR("_SNSoundPrintAFeatureEmbeddingCustomModel")), "conformsToProtocol:", &unk_1EE435650) & 1) == 0)
  {
    if (!a5)
      goto LABEL_17;
    v17 = CFSTR("Sound print model does not conform to custom model protocol.");
    goto LABEL_16;
  }
  v19.receiver = self;
  v19.super_class = (Class)_MLSNSoundPrint;
  self = -[_MLSNSoundPrint init](&v19, sel_init);
  if (self)
  {
    v12 = (MLCustomModel *)objc_alloc(NSClassFromString(CFSTR("_SNSoundPrintAFeatureEmbeddingCustomModel")));
    featureEmbeddingModel = self->_featureEmbeddingModel;
    self->_featureEmbeddingModel = v12;

    v14 = -[MLCustomModel initWithModelDescription:parameterDictionary:error:](self->_featureEmbeddingModel, "initWithModelDescription:parameterDictionary:error:", v9, v10, a5);
    v15 = self->_featureEmbeddingModel;
    self->_featureEmbeddingModel = v14;

    if (self->_featureEmbeddingModel)
    {
      objc_storeStrong((id *)&self->_modelDescription, a3);
      goto LABEL_7;
    }
    if (a5)
    {
      v17 = CFSTR("Sound print failed to init.");
      goto LABEL_16;
    }
LABEL_17:
    v16 = 0;
    goto LABEL_18;
  }
LABEL_7:
  self = self;
  v16 = self;
LABEL_18:

  return v16;
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
