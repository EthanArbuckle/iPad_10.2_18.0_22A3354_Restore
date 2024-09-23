@implementation LunarDateComplicationConfigurationIntent

- (LunarDateComplicationConfigurationIntent)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LunarDateComplicationConfigurationIntent();
  return -[LunarDateComplicationConfigurationIntent init](&v3, sel_init);
}

- (LunarDateComplicationConfigurationIntent)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LunarDateComplicationConfigurationIntent();
  return -[LunarDateComplicationConfigurationIntent initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (LunarDateComplicationConfigurationIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  id v6;
  void *v7;
  id v8;
  LunarDateComplicationConfigurationIntent *v9;
  objc_super v11;

  if (a3)
  {
    sub_1D2BCFB8C();
    v6 = a4;
    v7 = (void *)sub_1D2BCFB5C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for LunarDateComplicationConfigurationIntent();
  v9 = -[LunarDateComplicationConfigurationIntent initWithIdentifier:backingStore:](&v11, sel_initWithIdentifier_backingStore_, v7, a4);

  return v9;
}

- (LunarDateComplicationConfigurationIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  LunarDateComplicationConfigurationIntent *v10;
  objc_super v12;

  sub_1D2BCFB8C();
  sub_1D2BCFB8C();
  if (a5)
    a5 = (id)sub_1D2BCFA90();
  v7 = (void *)sub_1D2BCFB5C();
  swift_bridgeObjectRelease();
  v8 = (void *)sub_1D2BCFB5C();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9 = (void *)sub_1D2BCFA84();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for LunarDateComplicationConfigurationIntent();
  v10 = -[LunarDateComplicationConfigurationIntent initWithDomain:verb:parametersByName:](&v12, sel_initWithDomain_verb_parametersByName_, v7, v8, v9);

  return v10;
}

@end
