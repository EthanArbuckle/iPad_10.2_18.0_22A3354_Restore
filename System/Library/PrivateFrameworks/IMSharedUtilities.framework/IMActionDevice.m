@implementation IMActionDevice

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IMActionDevice_type);
}

- (IMActionDevice)initWithType:(int64_t)a3
{
  objc_super v4;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMActionDevice_type) = (Class)a3;
  v4.receiver = self;
  v4.super_class = (Class)IMActionDevice;
  return -[IMActionDevice init](&v4, sel_init);
}

- (IMActionDevice)initWithDictionary:(id)a3
{
  uint64_t v3;

  v3 = sub_19E36F828();
  return (IMActionDevice *)IMActionDevice.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  uint64_t inited;
  IMActionDevice *v4;
  int64_t v5;
  void *v6;

  sub_19E247E74(&qword_1EE5019B8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19E381BA0;
  *(_QWORD *)(inited + 32) = 1701869940;
  *(_QWORD *)(inited + 40) = 0xE400000000000000;
  v4 = self;
  v5 = -[IMActionDevice type](v4, sel_type);
  *(_QWORD *)(inited + 72) = MEMORY[0x1E0DEB418];
  *(_QWORD *)(inited + 48) = v5;
  sub_19E32D864(inited);

  v6 = (void *)sub_19E36F81C();
  swift_bridgeObjectRelease();
  return v6;
}

- (IMActionDevice)init
{
  IMActionDevice *result;

  result = (IMActionDevice *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
