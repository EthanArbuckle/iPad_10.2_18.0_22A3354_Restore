@implementation CDMNLUPreprocessResponseCommand

- (CDMNLUPreprocessResponseCommand)initWithPreprocessingWrapper:(id)a3
{
  id v5;
  CDMNLUPreprocessResponseCommand *v6;
  CDMNLUPreprocessResponseCommand *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMNLUPreprocessResponseCommand;
  v6 = -[CDMBaseCommand init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_preprocessingWrapper, a3);

  return v7;
}

- (SIRINLUINTERNALPreprocessingWrapper)preprocessingWrapper
{
  return self->_preprocessingWrapper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preprocessingWrapper, 0);
}

+ (id)innerProtoPropertyName
{
  return CFSTR("preprocessingWrapper");
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
