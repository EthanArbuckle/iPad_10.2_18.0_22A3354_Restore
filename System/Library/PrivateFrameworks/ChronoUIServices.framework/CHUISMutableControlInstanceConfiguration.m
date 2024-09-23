@implementation CHUISMutableControlInstanceConfiguration

- (CHUISMutableControlInstanceConfiguration)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHUISMutableControlInstanceConfiguration;
  return -[CHUISControlInstanceConfiguration init](&v3, sel_init);
}

- (id)copyWithZone:(void *)a3
{
  char v4;
  char v5;
  uint64_t v6;
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  CHUISMutableControlInstanceConfiguration *v11;
  char *v12;
  char *v13;

  v4 = *((_BYTE *)&self->super.super.isa + OBJC_IVAR___CHUISControlInstanceConfiguration__configuration);
  v5 = *((_BYTE *)&self->super.super.isa + OBJC_IVAR___CHUISControlInstanceConfiguration__configuration + 1);
  v6 = *(_QWORD *)&self->super._configuration[OBJC_IVAR___CHUISControlInstanceConfiguration__configuration];
  v7 = self->super._configuration[OBJC_IVAR___CHUISControlInstanceConfiguration__configuration + 8];
  v9 = *(_QWORD *)&self->super._configuration[OBJC_IVAR___CHUISControlInstanceConfiguration__configuration + 16];
  v8 = *(_QWORD *)&self->super._configuration[OBJC_IVAR___CHUISControlInstanceConfiguration__configuration + 24];
  v10 = objc_allocWithZone((Class)CHUISControlInstanceConfiguration);
  swift_bridgeObjectRetain();
  v11 = self;
  v12 = (char *)objc_msgSend(v10, sel_init);
  v13 = &v12[OBJC_IVAR___CHUISControlInstanceConfiguration__configuration];
  *v13 = v4;
  v13[1] = v5;
  *((_QWORD *)v13 + 1) = v6;
  v13[16] = v7;
  *((_QWORD *)v13 + 3) = v9;
  *((_QWORD *)v13 + 4) = v8;

  swift_bridgeObjectRelease();
  return v12;
}

- (void)setCanAppearInSecureEnvironment:(BOOL)a3
{
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR___CHUISControlInstanceConfiguration__configuration) = a3;
}

- (void)setSupportsLowLuminance:(BOOL)a3
{
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR___CHUISControlInstanceConfiguration__configuration + 1) = a3;
}

- (void)setPreferredColorScheme:(unint64_t)a3
{
  char *v3;

  v3 = (char *)self + OBJC_IVAR___CHUISControlInstanceConfiguration__configuration;
  *((_QWORD *)v3 + 1) = a3;
  v3[16] = a3 == 0;
}

- (void)setLaunchOrigin:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;

  if (a3)
  {
    v4 = sub_1B71965F0();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (char *)self + OBJC_IVAR___CHUISControlInstanceConfiguration__configuration;
  *((_QWORD *)v6 + 3) = v4;
  *((_QWORD *)v6 + 4) = v5;
  swift_bridgeObjectRelease();
}

@end
