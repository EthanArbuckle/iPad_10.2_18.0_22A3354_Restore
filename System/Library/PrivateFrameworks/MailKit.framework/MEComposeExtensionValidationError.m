@implementation MEComposeExtensionValidationError

- (MEComposeExtensionValidationError)initWithExtensionName:(id)a3 icon:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  id v11;
  MEComposeExtensionValidationError *v12;
  MEComposeExtensionValidationError *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MEComposeExtensionValidationError;
  v12 = -[MEComposeExtensionValidationError init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_extensionDisplayName, a3);
    objc_storeStrong((id *)&v13->_icon, a4);
    objc_storeStrong((id *)&v13->_error, a5);
  }

  return v13;
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (NSString)extensionDisplayName
{
  return self->_extensionDisplayName;
}

- (void)setExtensionDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_extensionDisplayName, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_extensionDisplayName, 0);
  objc_storeStrong((id *)&self->_icon, 0);
}

@end
