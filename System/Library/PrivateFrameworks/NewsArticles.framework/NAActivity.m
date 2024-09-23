@implementation NAActivity

- (id)_systemImageName
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NAActivity;
  -[UIActivity _systemImageName](&v3, sel__systemImageName);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_bundleIdentifierForActivityImageCreation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NAActivity;
  -[UIActivity _bundleIdentifierForActivityImageCreation](&v3, sel__bundleIdentifierForActivityImageCreation);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
