@implementation IMActionRequestLocation

- (BOOL)sendPush
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___IMActionRequestLocation_sendPush);
}

- (IMActionRequestLocation)initWithSendPush:(BOOL)a3
{
  objc_super v4;

  *((_BYTE *)&self->super.isa + OBJC_IVAR___IMActionRequestLocation_sendPush) = a3;
  v4.receiver = self;
  v4.super_class = (Class)IMActionRequestLocation;
  return -[IMActionRequestLocation init](&v4, sel_init);
}

- (IMActionRequestLocation)initWithDictionary:(id)a3
{
  uint64_t v3;

  v3 = sub_19E36F828();
  return (IMActionRequestLocation *)IMActionRequestLocation.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  uint64_t inited;
  IMActionRequestLocation *v4;
  uint64_t v5;
  void *v6;

  sub_19E247E74(&qword_1EE5019B8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_19E381BA0;
  *(_QWORD *)(inited + 32) = 0x68737550646E6573;
  *(_QWORD *)(inited + 40) = 0xE800000000000000;
  v4 = self;
  -[IMActionRequestLocation sendPush](v4, sel_sendPush);
  v5 = sub_19E36F9B4();
  *(_QWORD *)(inited + 72) = sub_19E24B854(0, (unint64_t *)&qword_1ECFC6A00);
  *(_QWORD *)(inited + 48) = v5;
  sub_19E32D864(inited);

  v6 = (void *)sub_19E36F81C();
  swift_bridgeObjectRelease();
  return v6;
}

- (IMActionRequestLocation)init
{
  IMActionRequestLocation *result;

  result = (IMActionRequestLocation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
