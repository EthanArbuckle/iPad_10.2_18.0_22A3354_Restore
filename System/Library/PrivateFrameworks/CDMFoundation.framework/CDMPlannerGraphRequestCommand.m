@implementation CDMPlannerGraphRequestCommand

- (CDMPlannerGraphRequestCommand)initWithPlannerRequest:(id)a3
{
  id v5;
  CDMPlannerGraphRequestCommand *v6;
  CDMPlannerGraphRequestCommand *v7;
  SIRINLUEXTERNALRequestID *v8;
  SIRINLUEXTERNALRequestID *requestId;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CDMPlannerGraphRequestCommand;
  v6 = -[CDMBaseCommand init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_plannerRequest, a3);
    v8 = (SIRINLUEXTERNALRequestID *)objc_alloc_init(MEMORY[0x24BE9E0F0]);
    requestId = v7->_requestId;
    v7->_requestId = v8;

    objc_msgSend(v5, "cdmPlannerRequestIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "clientRequestId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v5, "cdmPlannerRequestIdentifier");
      v12 = objc_claimAutoreleasedReturnValue();
      -[NSObject clientRequestId](v12, "clientRequestId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SIRINLUEXTERNALRequestID setIdA:](v7->_requestId, "setIdA:", v13);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SIRINLUEXTERNALRequestID setIdA:](v7->_requestId, "setIdA:", v15);

      CDMOSLoggerForCategory(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        goto LABEL_6;
      -[SIRINLUEXTERNALRequestID idA](v7->_requestId, "idA");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v19 = "-[CDMPlannerGraphRequestCommand initWithPlannerRequest:]";
      v20 = 2112;
      v21 = v13;
      _os_log_debug_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_DEBUG, "%s The (orchestrator) client request Id was not provided. Generated clientRequestId with UUID string: %@", buf, 0x16u);
    }

LABEL_6:
  }

  return v7;
}

- (CDMPlannerGraphRequestCommand)initWithCoder:(id)a3
{
  id v4;
  CDMPlannerGraphRequestCommand *v5;
  uint64_t v6;
  SIRINLUEXTERNALCDM_PLANNERCdmPlannerRequest *plannerRequest;
  void *v8;
  uint64_t v9;
  SIRINLUEXTERNALRequestID *requestId;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CDMPlannerGraphRequestCommand;
  v5 = -[CDMServiceGraphProtoBackedCommand initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("plannerRequest"));
    v6 = objc_claimAutoreleasedReturnValue();
    plannerRequest = v5->_plannerRequest;
    v5->_plannerRequest = (SIRINLUEXTERNALCDM_PLANNERCdmPlannerRequest *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE9E0F0]), "initWithData:", v8);
    requestId = v5->_requestId;
    v5->_requestId = (SIRINLUEXTERNALRequestID *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CDMPlannerGraphRequestCommand;
  v4 = a3;
  -[CDMServiceGraphProtoBackedCommand encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_plannerRequest, CFSTR("plannerRequest"), v6.receiver, v6.super_class);
  -[SIRINLUEXTERNALRequestID data](self->_requestId, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("requestId"));

}

- (id)loggingRequestID
{
  return self->_requestId;
}

- (SIRINLUEXTERNALCDM_PLANNERCdmPlannerRequest)plannerRequest
{
  return self->_plannerRequest;
}

- (SIRINLUEXTERNALRequestID)requestId
{
  return self->_requestId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_plannerRequest, 0);
}

+ (id)innerProtoPropertyName
{
  return CFSTR("plannerRequest");
}

+ (Class)innerProtoType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)serviceGraphName
{
  return CFSTR("CDMPlannerServiceGraph");
}

@end
