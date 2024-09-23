@implementation CRInvocationPayloadCommand

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRInvocationPayloadCommand;
  v5 = -[CRBasicPayloadCommand copyWithZone:](&v9, sel_copyWithZone_);
  -[CRInvocationPayloadCommand invocationIdentifier](self, "invocationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setInvocationIdentifier:", v7);

  return v5;
}

- (NSString)invocationIdentifier
{
  return self->_invocationIdentifier;
}

- (void)setInvocationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_invocationIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invocationIdentifier, 0);
}

@end
