@implementation CDMNLUPreprocessRequestCommand

- (CDMNLUPreprocessRequestCommand)initWithNLURequest:(id)a3
{
  id v5;
  CDMNLUPreprocessRequestCommand *v6;
  CDMNLUPreprocessRequestCommand *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMNLUPreprocessRequestCommand;
  v6 = -[CDMBaseCommand init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_siriNLUTypeObj, a3);

  return v7;
}

- (SIRINLUEXTERNALCDMNluRequest)siriNLUTypeObj
{
  return self->_siriNLUTypeObj;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriNLUTypeObj, 0);
}

+ (id)innerProtoPropertyName
{
  return CFSTR("siriNLUTypeObj");
}

+ (Class)innerProtoType
{
  return (Class)objc_opt_class();
}

+ (id)serviceGraphName
{
  return CFSTR("CDMNLUPreprocessGraph");
}

@end
