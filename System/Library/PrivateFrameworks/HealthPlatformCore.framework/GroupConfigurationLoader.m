@implementation GroupConfigurationLoader

- (id)elementGroupWithIdentifier:(id)a3
{
  void *v4;
  _TtC18HealthPlatformCore24GroupConfigurationLoader *v5;
  void *v6;
  id v7;

  sub_1BC08A3C0();
  v4 = (void *)objc_opt_self();
  v5 = self;
  v6 = (void *)sub_1BC08A3B4();
  v7 = objc_msgSend(v4, sel_topElementGroupWithIdentifier_, v6);

  swift_bridgeObjectRelease();
  return v7;
}

- (_TtC18HealthPlatformCore24GroupConfigurationLoader)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GroupConfigurationLoader();
  return -[GroupConfigurationLoader init](&v3, sel_init);
}

@end
