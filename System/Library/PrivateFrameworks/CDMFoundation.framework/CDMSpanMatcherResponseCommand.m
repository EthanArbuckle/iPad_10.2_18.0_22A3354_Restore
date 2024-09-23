@implementation CDMSpanMatcherResponseCommand

- (CDMSpanMatcherResponseCommand)initWithResponse:(id)a3
{
  id v5;
  CDMSpanMatcherResponseCommand *v6;
  CDMSpanMatcherResponseCommand *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMSpanMatcherResponseCommand;
  v6 = -[CDMBaseCommand init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_spanMatchResponse, a3);

  return v7;
}

- (id)description
{
  __CFString *v2;

  if (self->_spanMatchResponse)
  {
    objc_msgSend(MEMORY[0x24BE9E358], "printableSpanMatchResponse:");
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = CFSTR("nil");
  }
  return v2;
}

- (SIRINLUINTERNALSPANMATCHSpanMatchResponse)spanMatchResponse
{
  return self->_spanMatchResponse;
}

- (void)setSpanMatchResponse:(id)a3
{
  objc_storeStrong((id *)&self->_spanMatchResponse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spanMatchResponse, 0);
}

@end
