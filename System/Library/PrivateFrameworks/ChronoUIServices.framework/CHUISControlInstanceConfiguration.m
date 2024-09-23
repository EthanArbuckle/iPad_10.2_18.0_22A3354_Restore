@implementation CHUISControlInstanceConfiguration

- (BOOL)canAppearInSecureEnvironment
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___CHUISControlInstanceConfiguration__configuration);
}

- (BOOL)supportsLowLuminance
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___CHUISControlInstanceConfiguration__configuration + 1);
}

- (unint64_t)preferredColorScheme
{
  if (self->_configuration[OBJC_IVAR___CHUISControlInstanceConfiguration__configuration + 8])
    return 0;
  else
    return *(_QWORD *)&self->_configuration[OBJC_IVAR___CHUISControlInstanceConfiguration__configuration];
}

- (CHUISControlInstanceConfiguration)init
{
  char *v2;
  objc_super v4;

  v2 = (char *)self + OBJC_IVAR___CHUISControlInstanceConfiguration__configuration;
  *(_WORD *)v2 = 0;
  *((_QWORD *)v2 + 1) = 0;
  v2[16] = 1;
  *((_QWORD *)v2 + 3) = 0;
  *((_QWORD *)v2 + 4) = 0;
  v4.receiver = self;
  v4.super_class = (Class)CHUISControlInstanceConfiguration;
  return -[CHUISControlInstanceConfiguration init](&v4, sel_init);
}

- (id)mutableCopyWithZone:(void *)a3
{
  id v4;
  CHUISControlInstanceConfiguration *v5;
  char *v6;
  char v7;
  uint64_t v8;
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;

  v4 = objc_allocWithZone((Class)CHUISMutableControlInstanceConfiguration);
  v5 = self;
  v6 = (char *)objc_msgSend(v4, sel_init);
  v7 = *((_BYTE *)&v5->super.isa + OBJC_IVAR___CHUISControlInstanceConfiguration__configuration + 1);
  v8 = *(_QWORD *)&v5->_configuration[OBJC_IVAR___CHUISControlInstanceConfiguration__configuration];
  v9 = v5->_configuration[OBJC_IVAR___CHUISControlInstanceConfiguration__configuration + 8];
  v11 = *(_QWORD *)&v5->_configuration[OBJC_IVAR___CHUISControlInstanceConfiguration__configuration + 16];
  v10 = *(_QWORD *)&v5->_configuration[OBJC_IVAR___CHUISControlInstanceConfiguration__configuration + 24];
  v12 = &v6[OBJC_IVAR___CHUISControlInstanceConfiguration__configuration];
  *v12 = *((_BYTE *)&v5->super.isa + OBJC_IVAR___CHUISControlInstanceConfiguration__configuration);
  v12[1] = v7;
  *((_QWORD *)v12 + 1) = v8;
  v12[16] = v9;
  *((_QWORD *)v12 + 3) = v11;
  *((_QWORD *)v12 + 4) = v10;
  swift_bridgeObjectRetain();

  swift_bridgeObjectRelease();
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  CHUISControlInstanceConfiguration *v4;
  CHUISControlInstanceConfiguration *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B7196914();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = CHUISControlInstanceConfiguration.isEqual(_:)((uint64_t)v8);

  sub_1B71426F0((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  CHUISControlInstanceConfiguration *v3;
  int64_t v4;

  sub_1B7196BCC();
  swift_bridgeObjectRetain();
  v3 = self;
  ControlInstanceConfiguration.hash(into:)();
  v4 = sub_1B7196BFC();

  swift_bridgeObjectRelease();
  return v4;
}

- (NSString)description
{
  CHUISControlInstanceConfiguration *v2;
  void *v3;

  v2 = self;
  CHUISControlInstanceConfiguration.description.getter();

  v3 = (void *)sub_1B71965E4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (id)launchOrigin
{
  void *v1;

  if (*(_QWORD *)(a1 + OBJC_IVAR___CHUISControlInstanceConfiguration__configuration + 32))
  {
    swift_bridgeObjectRetain();
    v1 = (void *)sub_1B71965E4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

@end
