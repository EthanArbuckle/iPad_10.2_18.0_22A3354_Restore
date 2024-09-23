@implementation HKInfographicButtonItem

- (HKInfographicButtonItem)initWithConfiguration:(id)a3 buttonTapHandler:(id)a4
{
  id v6;
  id v7;
  HKInfographicButtonItem *v8;
  uint64_t v9;
  UIButtonConfiguration *configuration;
  uint64_t v11;
  id buttonTapHandler;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKInfographicButtonItem;
  v8 = -[HKInfographicButtonItem init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    configuration = v8->_configuration;
    v8->_configuration = (UIButtonConfiguration *)v9;

    v11 = objc_msgSend(v7, "copy");
    buttonTapHandler = v8->_buttonTapHandler;
    v8->_buttonTapHandler = (id)v11;

  }
  return v8;
}

- (UIButtonConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)buttonTapHandler
{
  return self->_buttonTapHandler;
}

- (void)setButtonTapHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)baseIdentifier
{
  return self->_baseIdentifier;
}

- (void)setBaseIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseIdentifier, 0);
  objc_storeStrong(&self->_buttonTapHandler, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
