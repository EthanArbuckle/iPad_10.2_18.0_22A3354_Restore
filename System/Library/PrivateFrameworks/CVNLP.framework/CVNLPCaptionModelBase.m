@implementation CVNLPCaptionModelBase

- (CVNLPCaptionModelBase)initWithOptions:(id)a3 runTimeParams:(id)a4
{
  id v7;
  CVNLPCaptionModelBase *v8;
  CVNLPCaptionModelBase *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CVNLPCaptionModelBase;
  v8 = -[CVNLPModelBase initWithOptions:](&v11, sel_initWithOptions_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_runTimeParams, a4);

  return v9;
}

- (CVNLPCaptionRuntimeParameters)runTimeParams
{
  return self->_runTimeParams;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runTimeParams, 0);
}

@end
