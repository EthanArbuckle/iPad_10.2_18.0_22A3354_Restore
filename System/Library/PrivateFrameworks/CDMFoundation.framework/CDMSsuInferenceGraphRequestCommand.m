@implementation CDMSsuInferenceGraphRequestCommand

- (CDMSsuInferenceGraphRequestCommand)initWithSsuRequest:(id)a3
{
  id v5;
  CDMSsuInferenceGraphRequestCommand *v6;
  CDMSsuInferenceGraphRequestCommand *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMSsuInferenceGraphRequestCommand;
  v6 = -[CDMBaseCommand init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_ssuRequest, a3);

  return v7;
}

- (SIRINLUEXTERNALSSU_INFERENCESsuInferenceRequest)ssuRequest
{
  return self->_ssuRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ssuRequest, 0);
}

+ (id)innerProtoPropertyName
{
  return CFSTR("ssuRequest");
}

+ (Class)innerProtoType
{
  return (Class)objc_opt_class();
}

+ (id)serviceGraphName
{
  return CFSTR("CDMSsuInferenceServiceGraph");
}

@end
