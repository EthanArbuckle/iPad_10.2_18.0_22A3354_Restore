@implementation CDMContextualSpanMatcherRequestCommand

- (CDMContextualSpanMatcherRequestCommand)initWithContextualSpanMatcherRequest:(id)a3
{
  id v5;
  CDMContextualSpanMatcherRequestCommand *v6;
  CDMContextualSpanMatcherRequestCommand *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMContextualSpanMatcherRequestCommand;
  v6 = -[CDMBaseCommand init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contextualSpanMatcherRequest, a3);

  return v7;
}

- (SIRINLUINTERNALCONTEXTUAL_SPAN_MATCHERContextualSpanMatcherRequest)contextualSpanMatcherRequest
{
  return self->_contextualSpanMatcherRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextualSpanMatcherRequest, 0);
}

@end
