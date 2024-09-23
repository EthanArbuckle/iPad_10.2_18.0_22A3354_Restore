@implementation ControlHomeIntent

- (BOOL)isEqual:(id)a3
{
  ControlHomeIntent *v4;
  ControlHomeIntent *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_220C990E4();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = ControlHomeIntent.isEqual(_:)((uint64_t)v8);

  sub_2208A7858((uint64_t)v8);
  return v6 & 1;
}

- (ControlHomeIntent)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ControlHomeIntent();
  return -[ControlHomeIntent init](&v3, sel_init);
}

- (ControlHomeIntent)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ControlHomeIntent();
  return -[ControlHomeIntent initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (ControlHomeIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  id v6;
  void *v7;
  id v8;
  ControlHomeIntent *v9;
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
  v11.super_class = (Class)type metadata accessor for ControlHomeIntent();
  v9 = -[ControlHomeIntent initWithIdentifier:backingStore:](&v11, sel_initWithIdentifier_backingStore_, v7, a4);

  return v9;
}

- (ControlHomeIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  ControlHomeIntent *v10;
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
  v12.super_class = (Class)type metadata accessor for ControlHomeIntent();
  v10 = -[ControlHomeIntent initWithDomain:verb:parametersByName:](&v12, sel_initWithDomain_verb_parametersByName_, v7, v8, v9);

  return v10;
}

@end
