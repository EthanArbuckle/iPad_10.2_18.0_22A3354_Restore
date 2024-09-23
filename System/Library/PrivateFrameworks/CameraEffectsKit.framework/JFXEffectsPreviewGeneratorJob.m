@implementation JFXEffectsPreviewGeneratorJob

- (JFXEffectsPreviewGeneratorJob)init
{
  return -[JFXEffectsPreviewGeneratorJob initWithRenderOutputs:callbackKeys:](self, "initWithRenderOutputs:callbackKeys:", 0, 0);
}

- (JFXEffectsPreviewGeneratorJob)initWithRenderOutputs:(id)a3 callbackKeys:(id)a4
{
  id v7;
  id v8;
  JFXEffectsPreviewGeneratorJob *v9;
  JFXEffectsPreviewGeneratorJob *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)JFXEffectsPreviewGeneratorJob;
  v9 = -[JFXEffectsPreviewGeneratorJob init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_outputNodes, a3);
    objc_storeStrong((id *)&v10->_callbackKeys, a4);
  }

  return v10;
}

- (NSArray)outputNodes
{
  return self->_outputNodes;
}

- (NSArray)callbackKeys
{
  return self->_callbackKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackKeys, 0);
  objc_storeStrong((id *)&self->_outputNodes, 0);
}

@end
