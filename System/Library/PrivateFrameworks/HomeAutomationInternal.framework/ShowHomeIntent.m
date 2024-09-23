@implementation ShowHomeIntent

- (ShowHomeIntent)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ShowHomeIntent();
  return -[ShowHomeIntent init](&v3, sel_init);
}

- (ShowHomeIntent)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ShowHomeIntent();
  return -[ShowHomeIntent initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (ShowHomeIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  id v6;
  void *v7;
  id v8;
  ShowHomeIntent *v9;
  objc_super v11;

  if (a3)
  {
    sub_220C98A84();
    v6 = a4;
    v7 = (void *)sub_220C98A60();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ShowHomeIntent();
  v9 = -[ShowHomeIntent initWithIdentifier:backingStore:](&v11, sel_initWithIdentifier_backingStore_, v7, a4);

  return v9;
}

- (ShowHomeIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  ShowHomeIntent *v10;
  objc_super v12;

  sub_220C98A84();
  sub_220C98A84();
  if (a5)
    a5 = (id)sub_220C989D0();
  v7 = (void *)sub_220C98A60();
  swift_bridgeObjectRelease();
  v8 = (void *)sub_220C98A60();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9 = (void *)sub_220C989B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for ShowHomeIntent();
  v10 = -[ShowHomeIntent initWithDomain:verb:parametersByName:](&v12, sel_initWithDomain_verb_parametersByName_, v7, v8, v9);

  return v10;
}

@end
