@implementation GMOptInStatusProvider

- (BOOL)userOptInStatus
{
  _TtC24AssistantSettingsSupport21GMOptInStatusProvider *v3;
  void *v4;
  char v5;

  sub_21542A098();
  v3 = self;
  v4 = (void *)sub_21542A08C();
  v5 = sub_21542A074();

  return v5 & 1;
}

- (void)setUserOptInStatus:(BOOL)a3
{
  _TtC24AssistantSettingsSupport21GMOptInStatusProvider *v4;
  id v5;

  sub_21542A098();
  v4 = self;
  v5 = (id)sub_21542A08C();
  sub_21542A080();

}

- (_TtC24AssistantSettingsSupport21GMOptInStatusProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GMOptInStatusProvider();
  return -[GMOptInStatusProvider init](&v3, sel_init);
}

@end
