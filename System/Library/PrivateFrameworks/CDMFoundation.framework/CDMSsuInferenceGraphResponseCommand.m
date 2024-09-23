@implementation CDMSsuInferenceGraphResponseCommand

- (CDMSsuInferenceGraphResponseCommand)initWithSsuResponse:(id)a3
{
  id v5;
  CDMSsuInferenceGraphResponseCommand *v6;
  CDMSsuInferenceGraphResponseCommand *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMSsuInferenceGraphResponseCommand;
  v6 = -[CDMBaseCommand init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_ssuResponse, a3);

  return v7;
}

- (SIRINLUEXTERNALSSU_INFERENCESsuInferenceResponse)ssuResponse
{
  return self->_ssuResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ssuResponse, 0);
}

+ (id)innerProtoPropertyName
{
  return CFSTR("ssuResponse");
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
