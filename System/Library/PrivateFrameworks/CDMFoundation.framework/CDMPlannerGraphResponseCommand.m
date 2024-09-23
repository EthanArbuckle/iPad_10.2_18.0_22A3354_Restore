@implementation CDMPlannerGraphResponseCommand

- (CDMPlannerGraphResponseCommand)initWithPlannerResponse:(id)a3
{
  id v5;
  CDMPlannerGraphResponseCommand *v6;
  CDMPlannerGraphResponseCommand *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMPlannerGraphResponseCommand;
  v6 = -[CDMBaseCommand init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_plannerResponse, a3);

  return v7;
}

- (SIRINLUEXTERNALCDM_PLANNERCdmPlannerResponse)plannerResponse
{
  return self->_plannerResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plannerResponse, 0);
}

+ (id)innerProtoPropertyName
{
  return CFSTR("plannerResponse");
}

+ (Class)innerProtoType
{
  return (Class)objc_opt_class();
}

+ (id)serviceGraphName
{
  return CFSTR("CDMPlannerServiceGraph");
}

@end
