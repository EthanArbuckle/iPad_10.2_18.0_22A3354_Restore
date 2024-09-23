@implementation CHSMutableControlConfigurationItem

- (void)setPushPolicy:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___CHSControlConfigurationItem__pushPolicy) = (Class)a3;
}

- (void)setCanAppearInSecureEnvironment:(BOOL)a3
{
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR___CHSControlConfigurationItem__canAppearInSecureEnvironment) = a3;
}

- (void)setSupportsLowLuminance:(BOOL)a3
{
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR___CHSControlConfigurationItem__supportsLowLuminance) = a3;
}

- (void)setSupportedColorSchemes:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___CHSControlConfigurationItem__supportedColorSchemes) = (Class)a3;
}

- (CHSMutableControlConfigurationItem)initWithUniqueIdentifier:(id)a3 controlIdentity:(id)a4 location:(int64_t)a5
{
  id v8;
  void *v9;
  CHSMutableControlConfigurationItem *v10;
  objc_super v12;

  sub_18FBCD0DC();
  v8 = a4;
  v9 = (void *)sub_18FBCD0B8();
  swift_bridgeObjectRelease();
  v12.receiver = self;
  v12.super_class = (Class)CHSMutableControlConfigurationItem;
  v10 = -[CHSControlConfigurationItem initWithUniqueIdentifier:controlIdentity:location:](&v12, sel_initWithUniqueIdentifier_controlIdentity_location_, v9, v8, a5);

  return v10;
}

- (CHSMutableControlConfigurationItem)initWithUniqueIdentifier:(id)a3 controlIdentity:(id)a4
{
  id v6;
  void *v7;
  CHSMutableControlConfigurationItem *v8;
  objc_super v10;

  sub_18FBCD0DC();
  v6 = a4;
  v7 = (void *)sub_18FBCD0B8();
  swift_bridgeObjectRelease();
  v10.receiver = self;
  v10.super_class = (Class)CHSMutableControlConfigurationItem;
  v8 = -[CHSControlConfigurationItem initWithUniqueIdentifier:controlIdentity:](&v10, sel_initWithUniqueIdentifier_controlIdentity_, v7, v6);

  return v8;
}

- (CHSMutableControlConfigurationItem)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHSMutableControlConfigurationItem;
  return -[CHSControlConfigurationItem init](&v3, sel_init);
}

@end
