@implementation IDSServerMessagingOutgoingContext

- (IDSServerMessagingOutgoingContext)initWithIdentifier:(id)a3
{
  id v5;
  IDSServerMessagingOutgoingContext *v6;
  IDSServerMessagingOutgoingContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSServerMessagingOutgoingContext;
  v6 = -[IDSServerMessagingOutgoingContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_identifier, a3);

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
