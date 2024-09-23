@implementation UtilityConfiguration

- (NSString)name
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_23EC2E774();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)shortName
{
  void *v2;

  if (*(_QWORD *)&self->config[OBJC_IVAR____TtC19HomeUtilityServices20UtilityConfiguration_config + 296])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_23EC2E774();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (NSDictionary)alternateSuppliers
{
  _TtC19HomeUtilityServices20UtilityConfiguration *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_23EBA8910();

  if (v3)
  {
    v4 = (void *)sub_23EC2E714();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSDictionary *)v4;
}

- (id)alternateSupplierNameFor:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _TtC19HomeUtilityServices20UtilityConfiguration *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v4 = sub_23EC2E780();
  v6 = v5;
  v7 = self;
  sub_23EBA8B34(v4, v6);
  v9 = v8;

  swift_bridgeObjectRelease();
  if (v9)
  {
    v10 = (void *)sub_23EC2E774();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (NSArray)tafFields
{
  return (NSArray *)sub_23EBA9194(self, (uint64_t)a2, sub_23EBA8F30, (void (*)(void))type metadata accessor for TAFField);
}

- (NSArray)tafSections
{
  return (NSArray *)sub_23EBA9194(self, (uint64_t)a2, sub_23EBA9200, (void (*)(void))type metadata accessor for TAFSection);
}

- (NSURL)OAuthURL
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _TtC19HomeUtilityServices20UtilityConfiguration *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25433F930);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_23EBA9464();

  v7 = sub_23EC2E264();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_23EC2E1F8();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSURL *)v9;
}

- (int64_t)accessTokenValidity
{
  uint64_t v2;
  int64_t result;

  v2 = *(_QWORD *)&self->config[OBJC_IVAR____TtC19HomeUtilityServices20UtilityConfiguration_config + 88];
  result = 3600 * v2;
  if ((unsigned __int128)(v2 * (__int128)3600) >> 64 != (3600 * v2) >> 63)
    __break(1u);
  return result;
}

- (int64_t)refreshTokenValidity
{
  uint64_t v2;
  int64_t result;

  v2 = *(_QWORD *)&self->config[OBJC_IVAR____TtC19HomeUtilityServices20UtilityConfiguration_config + 96];
  result = 3600 * v2;
  if ((unsigned __int128)(v2 * (__int128)3600) >> 64 != (3600 * v2) >> 63)
    __break(1u);
  return result;
}

- (NSString)termsAndAgreement
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_23EC2E774();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC19HomeUtilityServices19UtilityOrganization)organizationInformation
{
  _TtC19HomeUtilityServices20UtilityConfiguration *v2;
  id v3;

  v2 = self;
  v3 = sub_23EBA9968();

  return (_TtC19HomeUtilityServices19UtilityOrganization *)v3;
}

- (int64_t)initialPollDelayInSeconds
{
  if (self->config[OBJC_IVAR____TtC19HomeUtilityServices20UtilityConfiguration_config + 208])
    return 60;
  else
    return *(_QWORD *)&self->config[OBJC_IVAR____TtC19HomeUtilityServices20UtilityConfiguration_config + 200];
}

- (BOOL)missingDataRetryEnabled
{
  return self->config[OBJC_IVAR____TtC19HomeUtilityServices20UtilityConfiguration_config + 225] & 1;
}

- (int64_t)authorizationRefreshPeriod
{
  if (self->config[OBJC_IVAR____TtC19HomeUtilityServices20UtilityConfiguration_config + 224])
    return 0;
  else
    return *(_QWORD *)&self->config[OBJC_IVAR____TtC19HomeUtilityServices20UtilityConfiguration_config + 216];
}

- (void)trustedAccountFingerprintEnabledWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC19HomeUtilityServices20UtilityConfiguration *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB7438);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_23EC2E9A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_256DB7888;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_256DB7450;
  v12[5] = v11;
  v13 = self;
  sub_23EC1F1F4((uint64_t)v7, (uint64_t)&unk_256DB7458, (uint64_t)v12);
  swift_release();
}

- (_TtC19HomeUtilityServices20UtilityConfiguration)init
{
  _TtC19HomeUtilityServices20UtilityConfiguration *result;

  result = (_TtC19HomeUtilityServices20UtilityConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _BYTE v2[544];

  memcpy(v2, (char *)self + OBJC_IVAR____TtC19HomeUtilityServices20UtilityConfiguration_config, sizeof(v2));
  sub_23EBB1BAC((uint64_t)v2);
}

@end
