@implementation AAUIAppleIDSignInConfiguration

- (AAUIAppleIDSignInConfiguration)initWithNavController:(id)a3
{
  id v4;
  AAUIAppleIDSignInConfiguration *v5;
  AAUIServiceSignInConfiguration *v6;
  AAUIServiceSignInConfiguration *signInConfiguration;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUIAppleIDSignInConfiguration;
  v5 = -[AAUIAppleIDSignInConfiguration init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(AAUIServiceSignInConfiguration);
    signInConfiguration = v5->_signInConfiguration;
    v5->_signInConfiguration = v6;

    -[AAUIServiceSignInConfiguration setNavigationController:](v5->_signInConfiguration, "setNavigationController:", v4);
  }

  return v5;
}

- (void)setUsername:(id)a3
{
  -[AAUIServiceSignInConfiguration setUsername:](self->_signInConfiguration, "setUsername:", a3);
}

- (void)setLocalSecret:(id)a3
{
  -[AAUIServiceSignInConfiguration setLocalSecret:](self->_signInConfiguration, "setLocalSecret:", a3);
}

- (AAUIServiceSignInConfiguration)signInConfiguration
{
  return self->_signInConfiguration;
}

- (void)setSignInConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_signInConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signInConfiguration, 0);
}

@end
