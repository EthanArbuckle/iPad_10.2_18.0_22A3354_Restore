@implementation SOAuthorizationPoolItem

- (SOAuthorizationPoolItem)initWithAuthorization:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  SOAuthorizationPoolItem *v9;
  SOAuthorizationPoolItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SOAuthorizationPoolItem;
  v9 = -[SOAuthorizationPoolItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_authorization, a3);
    objc_storeStrong((id *)&v10->_delegate, a4);
  }

  return v10;
}

- (SOAuthorizationCore)authorization
{
  return self->_authorization;
}

- (SOAuthorizationCoreDelegate)delegate
{
  return self->_delegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_authorization, 0);
}

@end
