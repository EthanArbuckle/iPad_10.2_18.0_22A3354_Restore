@implementation IDSEndpointURIProperties

- (IDSEndpointURIProperties)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IDSEndpointURIProperties;
  return -[IDSEndpointURIProperties init](&v3, sel_init);
}

- (NSString)senderCorrelationIdentifier
{
  return self->_senderCorrelationIdentifier;
}

- (void)setSenderCorrelationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_senderCorrelationIdentifier, a3);
}

- (NSString)shortHandle
{
  return self->_shortHandle;
}

- (void)setShortHandle:(id)a3
{
  objc_storeStrong((id *)&self->_shortHandle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortHandle, 0);
  objc_storeStrong((id *)&self->_senderCorrelationIdentifier, 0);
}

@end
