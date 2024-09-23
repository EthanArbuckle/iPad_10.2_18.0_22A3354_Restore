@implementation APBaseShieldViewConfig

- (APBaseShieldViewConfig)initWithApplication:(id)a3
{
  id v4;
  APBaseShieldViewConfig *v5;
  APBaseShieldViewConfig *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)APBaseShieldViewConfig;
  v5 = -[APBaseShieldViewConfig init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[APBaseShieldViewConfig setApplication:](v5, "setApplication:", v4);

  return v6;
}

- (APApplication)application
{
  return self->_application;
}

- (void)setApplication:(id)a3
{
  objc_storeStrong((id *)&self->_application, a3);
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (APSystemAppOutlet)outlet
{
  return self->_outlet;
}

- (void)setOutlet:(id)a3
{
  objc_storeStrong((id *)&self->_outlet, a3);
}

- (APBaseShieldViewDelegate)delegate
{
  return (APBaseShieldViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_outlet, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

@end
