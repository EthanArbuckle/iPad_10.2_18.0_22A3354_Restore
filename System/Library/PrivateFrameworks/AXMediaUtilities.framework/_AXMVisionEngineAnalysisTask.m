@implementation _AXMVisionEngineAnalysisTask

+ (id)itemWithSource:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  _AXMVisionEngineAnalysisTask *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_AXMVisionEngineAnalysisTask initWithSource:context:]([_AXMVisionEngineAnalysisTask alloc], "initWithSource:context:", v6, v5);

  return v7;
}

- (_AXMVisionEngineAnalysisTask)initWithSource:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  _AXMVisionEngineAnalysisTask *v8;
  _AXMVisionEngineAnalysisTask *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_AXMVisionEngineAnalysisTask;
  v8 = -[_AXMVisionEngineAnalysisTask init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[_AXMVisionEngineAnalysisTask setSource:](v8, "setSource:", v6);
    -[_AXMVisionEngineAnalysisTask setContext:](v9, "setContext:", v7);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_AXMVisionEngineAnalysisTask setIdentifier:](v9, "setIdentifier:", v10);

  }
  return v9;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (AXMVisionPipelineContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (AXMSourceNode)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
