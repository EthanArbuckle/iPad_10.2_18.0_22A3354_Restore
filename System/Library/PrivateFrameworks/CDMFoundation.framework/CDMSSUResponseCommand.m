@implementation CDMSSUResponseCommand

- (CDMSSUResponseCommand)initWithSSUResponse:(id)a3
{
  return -[CDMSSUResponseCommand initWithSSUResponse:cmdError:](self, "initWithSSUResponse:cmdError:", a3, 0);
}

- (CDMSSUResponseCommand)initWithCmdError:(id)a3
{
  return -[CDMSSUResponseCommand initWithSSUResponse:cmdError:](self, "initWithSSUResponse:cmdError:", 0, a3);
}

- (CDMSSUResponseCommand)initWithSSUResponse:(id)a3 cmdError:(id)a4
{
  id v7;
  id v8;
  CDMSSUResponseCommand *v9;
  CDMSSUResponseCommand *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDMSSUResponseCommand;
  v9 = -[CDMBaseCommand init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ssuResponse, a3);
    -[CDMBaseCommand setCmdError:](v10, "setCmdError:", v8);
  }

  return v10;
}

- (SIRINLUINTERNALSSUSSUResponse)ssuResponse
{
  return self->_ssuResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ssuResponse, 0);
}

@end
