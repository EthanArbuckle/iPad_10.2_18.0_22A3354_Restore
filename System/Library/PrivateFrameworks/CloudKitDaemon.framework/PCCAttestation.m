@implementation PCCAttestation

- (PCCAttestation)initWithCertificate:(id)a3 applicationEnclaveQuote:(id)a4 quotingEnclaveQuote:(id)a5 routingToken:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PCCAttestation *v15;
  PCCAttestation *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PCCAttestation;
  v15 = -[PCCAttestation init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_certificate, a3);
    objc_storeStrong((id *)&v16->_applicationEnclaveQuote, a4);
    objc_storeStrong((id *)&v16->_quotingEnclaveQuote, a5);
    objc_storeStrong((id *)&v16->_routingToken, a6);
  }

  return v16;
}

- (NSString)certificate
{
  return self->_certificate;
}

- (void)setCertificate:(id)a3
{
  objc_storeStrong((id *)&self->_certificate, a3);
}

- (NSData)applicationEnclaveQuote
{
  return self->_applicationEnclaveQuote;
}

- (void)setApplicationEnclaveQuote:(id)a3
{
  objc_storeStrong((id *)&self->_applicationEnclaveQuote, a3);
}

- (NSData)quotingEnclaveQuote
{
  return self->_quotingEnclaveQuote;
}

- (void)setQuotingEnclaveQuote:(id)a3
{
  objc_storeStrong((id *)&self->_quotingEnclaveQuote, a3);
}

- (NSData)routingToken
{
  return self->_routingToken;
}

- (void)setRoutingToken:(id)a3
{
  objc_storeStrong((id *)&self->_routingToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routingToken, 0);
  objc_storeStrong((id *)&self->_quotingEnclaveQuote, 0);
  objc_storeStrong((id *)&self->_applicationEnclaveQuote, 0);
  objc_storeStrong((id *)&self->_certificate, 0);
}

@end
