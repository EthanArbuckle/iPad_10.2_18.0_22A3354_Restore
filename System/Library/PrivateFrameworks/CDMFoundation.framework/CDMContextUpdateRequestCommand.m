@implementation CDMContextUpdateRequestCommand

- (CDMContextUpdateRequestCommand)initWithCtxUpdateRequest:(id)a3
{
  id v5;
  CDMContextUpdateRequestCommand *v6;
  CDMContextUpdateRequestCommand *v7;

  v5 = a3;
  v6 = -[CDMBaseCommand init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_ctxUpdateRequest, a3);

  return v7;
}

- (SIRINLUINTERNALCONTEXTUPDATEContextUpdateRequest)ctxUpdateRequest
{
  return self->_ctxUpdateRequest;
}

- (void)setCtxUpdateRequest:(id)a3
{
  objc_storeStrong((id *)&self->_ctxUpdateRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ctxUpdateRequest, 0);
}

@end
