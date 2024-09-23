@implementation MAGSettingsLoader

+ (Class)internalSettingsViewControllerClass
{
  type metadata accessor for MAGInternalSettingsViewController();
  return (Class)swift_getObjCClassFromMetadata();
}

- (MAGSettingsLoader)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MAGSettingsLoader;
  return -[MAGSettingsLoader init](&v3, sel_init);
}

@end
