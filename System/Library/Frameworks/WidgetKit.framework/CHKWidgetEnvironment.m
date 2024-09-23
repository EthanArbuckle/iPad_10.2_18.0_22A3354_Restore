@implementation CHKWidgetEnvironment

- (CHKWidgetEnvironment)init
{
  objc_class *ObjectType;
  uint64_t v4;
  CHKWidgetEnvironment *v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = OBJC_IVAR___CHKWidgetEnvironment_tuples;
  v5 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)sub_1908DFFF4(MEMORY[0x1E0DEE9D8]);

  if (qword_1ECF6C8B0 != -1)
    swift_once();
  v7.receiver = v5;
  v7.super_class = ObjectType;
  return -[CHKWidgetEnvironment init](&v7, sel_init);
}

- (NSString)debugDescription
{
  CHKWidgetEnvironment *v2;
  void *v3;

  v2 = self;
  WidgetEnvironment.Storage.debugDescription.getter();

  v3 = (void *)sub_190A47AC4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CHKWidgetEnvironment)initWithCoder:(id)a3
{
  return (CHKWidgetEnvironment *)WidgetEnvironment.Storage.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CHKWidgetEnvironment *v5;

  v4 = a3;
  v5 = self;
  WidgetEnvironment.Storage.encode(with:)((NSCoder)v4);

}

- (int64_t)hash
{
  CHKWidgetEnvironment *v2;
  int64_t v3;

  v2 = self;
  v3 = WidgetEnvironment.Storage.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CHKWidgetEnvironment *v4;
  CHKWidgetEnvironment *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_190A481B4();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = WidgetEnvironment.Storage.isEqual(_:)((uint64_t)v8);

  sub_1908AA544((uint64_t)v8, (uint64_t *)&unk_1ECF6C8A0);
  return v6 & 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
