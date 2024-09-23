@implementation Assets

+ (BOOL)assetsFinishedDownloading
{
  return sub_1A5B92DBC("Skiping asset download check because of assets bypass", MEMORY[0x1E0D500F0], "Are assets ready? %{BOOL}d") & 1;
}

+ (BOOL)userHasEnoughStorage
{
  return sub_1A5B92DBC("Skiping storage check because of assets bypass", MEMORY[0x1E0D500F8], "Does device have enough storage? %{BOOL}d") & 1;
}

- (_TtC25CloudSubscriptionFeatures6Assets)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Assets();
  return -[Assets init](&v3, sel_init);
}

@end
