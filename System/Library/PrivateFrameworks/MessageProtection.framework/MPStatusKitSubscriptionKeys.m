@implementation MPStatusKitSubscriptionKeys

- (MPStatusKitSubscriptionKeys)initWithIndex:(unsigned __int16)a3 chainKey:(id)a4 signingKey:(id)a5
{
  id v9;
  id v10;
  MPStatusKitSubscriptionKeys *v11;
  MPStatusKitSubscriptionKeys *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MPStatusKitSubscriptionKeys;
  v11 = -[MPStatusKitSubscriptionKeys init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_chainKey, a4);
    v12->_index = a3;
    objc_storeStrong((id *)&v12->_signingKey, a5);
  }

  return v12;
}

- (unsigned)index
{
  return self->_index;
}

- (NSData)chainKey
{
  return self->_chainKey;
}

- (NSData)signingKey
{
  return self->_signingKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingKey, 0);
  objc_storeStrong((id *)&self->_chainKey, 0);
}

@end
