@implementation ACCiAP2ShimServerDelegateInfo

- (ACCiAP2ShimServerDelegateInfo)initWithDelegate:(id)a3
{
  id v5;
  ACCiAP2ShimServerDelegateInfo *v6;
  ACCiAP2ShimServerDelegateInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACCiAP2ShimServerDelegateInfo;
  v6 = -[ACCiAP2ShimServerDelegateInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_delegate, a3);

  return v7;
}

- (void)dealloc
{
  ACCiAP2ShimServerDelegate *delegate;
  objc_super v4;

  delegate = self->_delegate;
  self->_delegate = 0;

  v4.receiver = self;
  v4.super_class = (Class)ACCiAP2ShimServerDelegateInfo;
  -[ACCiAP2ShimServerDelegateInfo dealloc](&v4, sel_dealloc);
}

- (ACCiAP2ShimServerDelegate)delegate
{
  return (ACCiAP2ShimServerDelegate *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
