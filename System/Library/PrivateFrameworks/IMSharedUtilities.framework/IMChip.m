@implementation IMChip

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IMChip_type);
}

- (IMAttributableContent)chip
{
  return (IMAttributableContent *)(id)swift_unknownObjectRetain();
}

- (IMChip)initWithType:(int64_t)a3 chip:(id)a4
{
  objc_super v5;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMChip_type) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMChip_chip) = (Class)a4;
  v5.receiver = self;
  v5.super_class = (Class)IMChip;
  swift_unknownObjectRetain();
  return -[IMChip init](&v5, sel_init);
}

- (IMChip)initWithDictionary:(id)a3
{
  uint64_t v3;

  v3 = sub_19E36F828();
  return (IMChip *)IMChip.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  IMChip *v2;
  void *v3;

  v2 = self;
  sub_19E34F818();

  v3 = (void *)sub_19E36F81C();
  swift_bridgeObjectRelease();
  return v3;
}

+ (id)chipWithType:(int64_t)a3 dictionary:(id)a4
{
  void *v5;
  id v6;

  if (a4)
    v5 = (void *)sub_19E36F828();
  else
    v5 = 0;
  v6 = sub_19E34FC00(a3, v5);
  swift_bridgeObjectRelease();
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  IMChip *v4;
  IMChip *v5;
  BOOL v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_19E36FC0C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = IMChip.isEqual(_:)((uint64_t)v8);

  sub_19E322284((uint64_t)v8);
  return v6;
}

- (IMChip)init
{
  IMChip *result;

  result = (IMChip *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
