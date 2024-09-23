@implementation _BMCancellableClientSubscriber

- (_BMCancellableClientSubscriber)initWithClient:(id)a3 identifier:(id)a4
{
  id v7;
  id v8;
  _BMCancellableClientSubscriber *v9;
  _BMCancellableClientSubscriber *v10;
  uint64_t v11;
  NSString *identifier;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_BMCancellableClientSubscriber;
  v9 = -[_BMCancellableClientSubscriber init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_client, a3);
    v11 = objc_msgSend(v8, "copy");
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

  }
  return v10;
}

- (void)cancel
{
  void *v2;
  void *v3;
  _BMCancellableClientSubscriber *v4;

  v4 = self;
  -[_BMCancellableClientSubscriber client](v4, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[_BMCancellableClientSubscriber identifier](v4, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unsubscribeWithIdentifier:", v3);

}

- (BMComputeXPCPublisherClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end
