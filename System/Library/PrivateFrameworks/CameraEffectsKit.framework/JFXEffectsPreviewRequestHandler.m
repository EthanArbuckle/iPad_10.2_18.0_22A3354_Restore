@implementation JFXEffectsPreviewRequestHandler

- (JFXEffectsPreviewRequestHandler)initWithRequest:(id)a3
{
  id v5;
  JFXEffectsPreviewRequestHandler *v6;
  JFXEffectsPreviewRequestHandler *v7;
  JFXEffectsPreviewGeneratorJob *job;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)JFXEffectsPreviewRequestHandler;
  v6 = -[JFXEffectsPreviewRequestHandler init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_req, a3);
    job = v7->_job;
    v7->_job = 0;

  }
  return v7;
}

- (id)buildPVRenderRequestWithOutputColorSpace:(id)a3
{
  id v4;
  JFXInstructionGraphBuilder *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  JFXInstructionGraphBuilder *v12;
  JFXEffectsPreviewGeneratorJob *v13;
  JFXEffectsPreviewGeneratorJob *job;
  id v15;
  void *v16;
  JFXEffectsPreviewGenerationRequest *req;
  void *v18;
  _QWORD v20[3];

  v4 = a3;
  v5 = [JFXInstructionGraphBuilder alloc];
  -[JFXEffectsPreviewGenerationRequest outputSize](self->_req, "outputSize");
  v7 = v6;
  v9 = v8;
  -[JFXEffectsPreviewGenerationRequest frameSize](self->_req, "frameSize");
  v12 = -[JFXInstructionGraphBuilder initWithOutputSize:frameSize:outputColorSpace:](v5, "initWithOutputSize:frameSize:outputColorSpace:", v4, v7, v9, v10, v11);

  -[JFXEffectsPreviewGenerationRequest generatorJobWithGraphBuilder:](self->_req, "generatorJobWithGraphBuilder:", v12);
  v13 = (JFXEffectsPreviewGeneratorJob *)objc_claimAutoreleasedReturnValue();
  job = self->_job;
  self->_job = v13;

  v15 = objc_alloc(MEMORY[0x24BE790B8]);
  -[JFXEffectsPreviewGeneratorJob outputNodes](self->_job, "outputNodes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  req = self->_req;
  if (req)
  {
    -[JFXEffectsPreviewGenerationRequest renderTime](req, "renderTime");
    req = self->_req;
  }
  else
  {
    memset(v20, 0, sizeof(v20));
  }
  -[JFXEffectsPreviewGenerationRequest outputSize](req, "outputSize");
  v18 = (void *)objc_msgSend(v15, "initWithOutputs:atTime:outputSize:", v16, v20);

  objc_msgSend(v18, "setHighQuality:", -[JFXEffectsPreviewGenerationRequest highQuality](self->_req, "highQuality"));
  objc_msgSend(v18, "setPriority:", -[JFXEffectsPreviewGenerationRequest priority](self->_req, "priority"));
  if (-[JFXEffectsPreviewGenerationRequest parentCode](self->_req, "parentCode") != -1)
    objc_msgSend(v18, "setParentCode:", -[JFXEffectsPreviewGenerationRequest parentCode](self->_req, "parentCode"));
  objc_msgSend(v18, "setChildCode:", -[JFXEffectsPreviewGenerationRequest childCode](self->_req, "childCode"));

  return v18;
}

- (id)buildCallbackMap:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;

  v4 = (objc_class *)MEMORY[0x24BDD1650];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithKeyOptions:valueOptions:capacity:", 0, 0, objc_msgSend(v5, "count"));
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__JFXEffectsPreviewRequestHandler_buildCallbackMap___block_invoke;
  v11[3] = &unk_24EE5C080;
  v11[4] = self;
  v7 = v6;
  v12 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);

  v8 = v12;
  v9 = v7;

  return v9;
}

void __52__JFXEffectsPreviewRequestHandler_buildCallbackMap___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "callbackKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v6)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v7, v6);

}

- (JFXEffectsPreviewGenerationRequest)req
{
  return self->_req;
}

- (void)setReq:(id)a3
{
  objc_storeStrong((id *)&self->_req, a3);
}

- (JFXEffectsPreviewGeneratorJob)job
{
  return self->_job;
}

- (void)setJob:(id)a3
{
  objc_storeStrong((id *)&self->_job, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_job, 0);
  objc_storeStrong((id *)&self->_req, 0);
}

@end
