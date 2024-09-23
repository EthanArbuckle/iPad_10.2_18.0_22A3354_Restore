@implementation CDMSNLCProtoResponseCommand

- (CDMSNLCProtoResponseCommand)initWithClassLabel:(int)a3 snlcParses:(id)a4 snlcResponse:(id)a5
{
  id v9;
  id v10;
  CDMSNLCProtoResponseCommand *v11;
  CDMSNLCProtoResponseCommand *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CDMSNLCProtoResponseCommand;
  v11 = -[CDMBaseCommand init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_snlcParses, a4);
    v12->_classLabel = a3;
    objc_storeStrong((id *)&v12->_snlcResponse, a5);
  }

  return v12;
}

- (BOOL)isDelegated
{
  return self->_classLabel == 0;
}

- (int)classLabel
{
  return self->_classLabel;
}

- (void)setClassLabel:(int)a3
{
  self->_classLabel = a3;
}

- (NSArray)snlcParses
{
  return self->_snlcParses;
}

- (SIRINLUINTERNALITFMITFMParserResponse)snlcResponse
{
  return self->_snlcResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snlcResponse, 0);
  objc_storeStrong((id *)&self->_snlcParses, 0);
}

@end
