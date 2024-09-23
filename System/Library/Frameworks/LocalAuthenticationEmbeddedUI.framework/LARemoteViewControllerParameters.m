@implementation LARemoteViewControllerParameters

- (NSString)serviceBundleIdentifier
{
  return self->_serviceBundleIdentifier;
}

- (void)setServiceBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_serviceBundleIdentifier, a3);
}

- (NSString)serviceViewControllerClassName
{
  return self->_serviceViewControllerClassName;
}

- (void)setServiceViewControllerClassName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceViewControllerClassName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceViewControllerClassName, 0);
  objc_storeStrong((id *)&self->_serviceBundleIdentifier, 0);
}

@end
