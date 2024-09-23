@implementation CDMAssistantNLUResponse

- (CDMAssistantNLUResponse)initWithNLUResponse:(id)a3 requestId:(id)a4
{
  return -[CDMAssistantNLUResponse initWithNLUResponse:preprocessingWrapper:requestId:](self, "initWithNLUResponse:preprocessingWrapper:requestId:", a3, 0, a4);
}

- (CDMAssistantNLUResponse)initWithNLUResponse:(id)a3 preprocessingWrapper:(id)a4 requestId:(id)a5
{
  id v9;
  id v10;
  id v11;
  CDMAssistantNLUResponse *v12;
  CDMAssistantNLUResponse *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CDMAssistantNLUResponse;
  v12 = -[CDMBaseCommand init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_requestId, a5);
    objc_storeStrong((id *)&v13->_siriNLUTypeObj, a3);
    objc_storeStrong((id *)&v13->_preprocessingWrapper, a4);
  }

  return v13;
}

- (CDMAssistantNLUResponse)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CDMAssistantNLUResponse;
  return -[CDMBaseCommand init](&v4, sel_init, a3);
}

- (NSString)requestId
{
  return self->_requestId;
}

- (SIRINLUEXTERNALCDMNluResponse)siriNLUTypeObj
{
  return self->_siriNLUTypeObj;
}

- (SIRINLUINTERNALPreprocessingWrapper)preprocessingWrapper
{
  return self->_preprocessingWrapper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preprocessingWrapper, 0);
  objc_storeStrong((id *)&self->_siriNLUTypeObj, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
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
