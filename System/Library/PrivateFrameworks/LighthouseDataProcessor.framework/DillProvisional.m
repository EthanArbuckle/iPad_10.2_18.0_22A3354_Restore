@implementation DillProvisional

- (_TtC23LighthouseDataProcessor15DillProvisional)init
{
  _TtC23LighthouseDataProcessor15DillProvisional *result;

  result = (_TtC23LighthouseDataProcessor15DillProvisional *)sub_2408E602C();
  __break(1u);
  return result;
}

- (_TtC23LighthouseDataProcessor15DillProvisional)initWithCoder:(id)a3
{
  _TtC23LighthouseDataProcessor15DillProvisional *result;

  result = (_TtC23LighthouseDataProcessor15DillProvisional *)sub_2408E602C();
  __break(1u);
  return result;
}

- (_TtC23LighthouseDataProcessor15DillProvisional)initWithData:(id)a3
{
  uint64_t v3;
  id v4;
  unint64_t v5;
  unint64_t v6;

  v3 = (uint64_t)a3;
  if (a3)
  {
    v4 = a3;
    v3 = sub_2408E5564();
    v6 = v5;

  }
  else
  {
    v6 = 0xF000000000000000;
  }
  return (_TtC23LighthouseDataProcessor15DillProvisional *)sub_2408C4E9C(v3, v6);
}

- (NSData)data
{
  return (NSData *)sub_2408C4FD0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC23LighthouseDataProcessor15DillProvisional_dillData);
}

- (BOOL)isProvisional
{
  return 1;
}

- (id)qualifiedMessageName
{
  void *v0;

  swift_bridgeObjectRetain();
  v0 = (void *)sub_2408E5CE4();
  swift_bridgeObjectRelease();
  return v0;
}

- (int)getAnyEventType
{
  return 7;
}

- (id)getVersion
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, *(Class *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC23LighthouseDataProcessor15DillProvisional_version));
}

- (void).cxx_destruct
{
  sub_240363D58(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC23LighthouseDataProcessor15DillProvisional_dillData), *(_QWORD *)&self->dillData[OBJC_IVAR____TtC23LighthouseDataProcessor15DillProvisional_dillData]);
  swift_bridgeObjectRelease();
}

@end
