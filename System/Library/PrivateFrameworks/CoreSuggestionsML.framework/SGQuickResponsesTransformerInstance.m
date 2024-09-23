@implementation SGQuickResponsesTransformerInstance

- (SGQuickResponsesTransformerInstance)initWithConfig:(id)a3 featurizer:(id)a4 source:(id)a5 labeler:(id)a6 sampler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SGQuickResponsesTransformerInstance *v17;
  SGQuickResponsesTransformerInstance *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  objc_super v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  obj = a7;
  v16 = a7;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesModel.m"), 415, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("config"));

    if (v13)
    {
LABEL_3:
      if (v14)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesModel.m"), 416, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("featurizer"));

  if (v14)
  {
LABEL_4:
    if (v15)
      goto LABEL_7;
    goto LABEL_5;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesModel.m"), 417, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("source"));

  if (v15)
    goto LABEL_7;
LABEL_5:
  if (objc_msgSend(v12, "mode") != 1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesModel.m"), 418, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("labeler != nil || config.mode == SGModelModePrediction"));

  }
LABEL_7:
  if (!v16 && objc_msgSend(v12, "mode") != 1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesModel.m"), 419, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sampler != nil || config.mode == SGModelModePrediction"));

  }
  v28.receiver = self;
  v28.super_class = (Class)SGQuickResponsesTransformerInstance;
  v17 = -[SGQuickResponsesTransformerInstance init](&v28, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_config, a3);
    objc_storeStrong((id *)&v18->_featurizer, a4);
    objc_storeStrong((id *)&v18->_source, a5);
    objc_storeStrong((id *)&v18->_labeler, a6);
    objc_storeStrong((id *)&v18->_sampler, obj);
  }

  return v18;
}

- (SGQuickResponsesConfig)config
{
  return self->_config;
}

- (PMLTransformerProtocol)featurizer
{
  return self->_featurizer;
}

- (SGModelSource)source
{
  return self->_source;
}

- (PMLTransformerProtocol)labeler
{
  return self->_labeler;
}

- (SGModelSampler)sampler
{
  return self->_sampler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampler, 0);
  objc_storeStrong((id *)&self->_labeler, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_featurizer, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
