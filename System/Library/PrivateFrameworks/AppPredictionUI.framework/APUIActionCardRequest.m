@implementation APUIActionCardRequest

- (APUIActionCardRequest)initWithCardViewConfig:(id)a3
{
  id v5;
  APUIActionCardRequest *v6;
  APUIActionCardRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APUIActionCardRequest;
  v6 = -[CRSCardRequest initWithContent:format:](&v9, sel_initWithContent_format_, 0, 1);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_cardViewConfig, a3);

  return v7;
}

- (APUIActionCardViewConfig)cardViewConfig
{
  return self->_cardViewConfig;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardViewConfig, 0);
}

@end
