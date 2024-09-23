@implementation CDMQRResponseCommand

- (CDMQRResponseCommand)initWithResponse:(id)a3
{
  id v4;
  CDMQRResponseCommand *v5;
  uint64_t v6;
  SIRINLUINTERNALQUERYREWRITEQRResponse *qrResponse;
  void *v8;
  void *v9;
  uint64_t v10;
  SIRINLUEXTERNALRewriteMessage *rewriteMsg;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CDMQRResponseCommand;
  v5 = -[CDMBaseCommand init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    qrResponse = v5->_qrResponse;
    v5->_qrResponse = (SIRINLUINTERNALQUERYREWRITEQRResponse *)v6;

    -[SIRINLUINTERNALQUERYREWRITEQRResponse rewriteHypotheses](v5->_qrResponse, "rewriteHypotheses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[CDMQRResponseCommand convertRewriteHypo2RewriteMsgForInfoDomains:](CDMQRResponseCommand, "convertRewriteHypo2RewriteMsgForInfoDomains:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    rewriteMsg = v5->_rewriteMsg;
    v5->_rewriteMsg = (SIRINLUEXTERNALRewriteMessage *)v10;

  }
  return v5;
}

- (SIRINLUINTERNALQUERYREWRITEQRResponse)qrResponse
{
  return self->_qrResponse;
}

- (void)setQrResponse:(id)a3
{
  objc_storeStrong((id *)&self->_qrResponse, a3);
}

- (SIRINLUEXTERNALRewriteMessage)rewriteMsg
{
  return self->_rewriteMsg;
}

- (void)setRewriteMsg:(id)a3
{
  objc_storeStrong((id *)&self->_rewriteMsg, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewriteMsg, 0);
  objc_storeStrong((id *)&self->_qrResponse, 0);
}

+ (id)convertRewriteHypo2RewriteMsgForInfoDomains:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    if (objc_msgSend(v3, "rewriteType")
      || (objc_msgSend(v3, "utterance"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "length"),
          v7,
          !v8))
    {
      if (objc_msgSend(v3, "rewriteType") != 1)
      {
        v6 = 0;
LABEL_10:

        goto LABEL_11;
      }
      v5 = 1;
    }
    else
    {
      v5 = 2;
    }
    objc_msgSend(v4, "setRewriteType:", v5);
    objc_msgSend(v3, "utterance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRewrittenUtterance:", v9);

    v6 = v4;
    goto LABEL_10;
  }
  v6 = 0;
LABEL_11:

  return v6;
}

@end
