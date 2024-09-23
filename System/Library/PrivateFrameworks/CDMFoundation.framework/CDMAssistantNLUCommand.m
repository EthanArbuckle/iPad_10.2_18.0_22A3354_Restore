@implementation CDMAssistantNLUCommand

- (CDMAssistantNLUCommand)initWithNLURequest:(id)a3 clientId:(id)a4
{
  return -[CDMAssistantNLUCommand initWithNLURequest:clientId:dataDispatcherContext:](self, "initWithNLURequest:clientId:dataDispatcherContext:", a3, a4, 0);
}

- (CDMAssistantNLUCommand)initWithNLURequest:(id)a3 clientId:(id)a4 dataDispatcherContext:(id)a5
{
  id v9;
  id v10;
  id v11;
  CDMAssistantNLUCommand *v12;
  CDMAssistantNLUCommand *v13;
  NLXSchemaNLXClientEventMetadata *v14;
  NLXSchemaNLXClientEventMetadata *selfMetadata;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CDMAssistantNLUCommand;
  v12 = -[CDMBaseCommand init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clientId, a4);
    objc_storeStrong((id *)&v13->_siriNLUTypeObj, a3);
    v14 = (NLXSchemaNLXClientEventMetadata *)objc_alloc_init(MEMORY[0x24BE95450]);
    selfMetadata = v13->_selfMetadata;
    v13->_selfMetadata = v14;

    -[CDMServiceGraphCommand setDataDispatcherContext:](v13, "setDataDispatcherContext:", v11);
  }

  return v13;
}

- (id)loggingRequestID
{
  return (id)-[SIRINLUEXTERNALCDMNluRequest requestId](self->_siriNLUTypeObj, "requestId");
}

- (CDMAssistantNLUCommand)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CDMAssistantNLUCommand;
  return -[CDMBaseCommand init](&v4, sel_init, a3);
}

- (NSString)clientId
{
  return self->_clientId;
}

- (SIRINLUEXTERNALCDMNluRequest)siriNLUTypeObj
{
  return self->_siriNLUTypeObj;
}

- (NLXSchemaNLXClientEventMetadata)selfMetadata
{
  return self->_selfMetadata;
}

- (void)setSelfMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_selfMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfMetadata, 0);
  objc_storeStrong((id *)&self->_siriNLUTypeObj, 0);
  objc_storeStrong((id *)&self->_clientId, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)serviceGraphName
{
  return CFSTR("CDMNLUServiceGraph");
}

@end
