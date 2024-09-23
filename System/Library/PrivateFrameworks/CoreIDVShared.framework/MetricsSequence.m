@implementation MetricsSequence

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC13CoreIDVShared15MetricsSequence)init
{
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = OBJC_IVAR____TtC13CoreIDVShared15MetricsSequence__sequence;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBBE268);
  v5 = swift_allocObject();
  *(_DWORD *)(v5 + 24) = 0;
  *(_QWORD *)(v5 + 16) = MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.isa + v4) = (Class)v5;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[MetricsSequence init](&v7, sel_init);
}

- (_TtC13CoreIDVShared15MetricsSequence)initWithCoder:(id)a3
{
  return (_TtC13CoreIDVShared15MetricsSequence *)MetricsSequence.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC13CoreIDVShared15MetricsSequence *v5;

  v4 = a3;
  v5 = self;
  MetricsSequence.encode(with:)((NSCoder)v4);

}

- (void).cxx_destruct
{
  swift_release();
}

@end
