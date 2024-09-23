@implementation UtilitySubscriptionService

- (_TtC19HomeUtilityServices20UtilityConfiguration)configuration
{
  return (_TtC19HomeUtilityServices20UtilityConfiguration *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC19HomeUtilityServices26UtilitySubscriptionService_configuration);
}

- (_TtC19HomeUtilityServices26UtilitySubscriptionService)initWithConfiguration:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t *v9;
  objc_class *v10;
  _TtC19HomeUtilityServices26UtilitySubscriptionService *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_class *v15;
  objc_class *v16;
  _TtC19HomeUtilityServices26UtilitySubscriptionService *v17;
  objc_super v19;

  v5 = sub_23EC2E3F0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices26UtilitySubscriptionService_sessionID);
  v10 = (objc_class *)a3;
  v11 = self;
  sub_23EC2E3E4();
  v12 = sub_23EC2E3D8();
  v14 = v13;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  *v9 = v12;
  v9[1] = v14;
  *(Class *)((char *)&v11->super.isa + OBJC_IVAR____TtC19HomeUtilityServices26UtilitySubscriptionService_configuration) = v10;
  v15 = v10;

  v16 = (objc_class *)type metadata accessor for UtilitySubscriptionService();
  v19.receiver = v11;
  v19.super_class = v16;
  v17 = -[UtilitySubscriptionService init](&v19, sel_init);

  return v17;
}

- (void)authorizeAccountWithTAFWithFields:(NSDictionary *)a3 :(NSURLSession *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSDictionary *v17;
  NSURLSession *v18;
  _TtC19HomeUtilityServices26UtilitySubscriptionService *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB7438);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_23EC2E9A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_256DB8610;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_256DB8618;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_23EC1F1F4((uint64_t)v11, (uint64_t)&unk_256DB8620, (uint64_t)v16);
  swift_release();
}

- (void)initiateOTPForAccountForFactor:(_TtC19HomeUtilityServices21TAFVerificationFactor *)a3 :(NSURLSession *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _TtC19HomeUtilityServices21TAFVerificationFactor *v17;
  NSURLSession *v18;
  _TtC19HomeUtilityServices26UtilitySubscriptionService *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB7438);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_23EC2E9A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_256DB85F0;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_256DB85F8;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_23EC1F1F4((uint64_t)v11, (uint64_t)&unk_256DB8600, (uint64_t)v16);
  swift_release();
}

- (void)createAccessToken:(NSString *)a3 :(NSURLSession *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSString *v17;
  NSURLSession *v18;
  _TtC19HomeUtilityServices26UtilitySubscriptionService *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB7438);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_23EC2E9A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_256DB85D0;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_256DB85D8;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_23EC1F1F4((uint64_t)v11, (uint64_t)&unk_256DB85E0, (uint64_t)v16);
  swift_release();
}

- (void)fetchServiceLocations:(NSString *)a3 :(NSURLSession *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSString *v17;
  NSURLSession *v18;
  _TtC19HomeUtilityServices26UtilitySubscriptionService *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB7438);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_23EC2E9A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_256DB85B0;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_256DB85B8;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_23EC1F1F4((uint64_t)v11, (uint64_t)&unk_256DB85C0, (uint64_t)v16);
  swift_release();
}

- (void)createUtilitySubscriptionWithServiceLocationID:(NSString *)a3 accessToken:(NSString *)a4 :(NSURLSession *)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  NSString *v19;
  NSString *v20;
  NSURLSession *v21;
  _TtC19HomeUtilityServices26UtilitySubscriptionService *v22;
  uint64_t v23;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB7438);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  v16 = sub_23EC2E9A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_256DB85A0;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_256DB7450;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = self;
  sub_23EC1F1F4((uint64_t)v13, (uint64_t)&unk_256DB7458, (uint64_t)v18);
  swift_release();
}

+ (void)renewAccessTokenWithRefreshToken:(NSString *)a3 utilityID:(NSString *)a4 :(NSURLSession *)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  NSString *v19;
  NSString *v20;
  NSURLSession *v21;
  uint64_t v22;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB7438);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = a1;
  v16 = sub_23EC2E9A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_256DB86B0;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_256DB86B8;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  sub_23EC1F1F4((uint64_t)v13, (uint64_t)&unk_256DB86C0, (uint64_t)v18);
  swift_release();
}

+ (void)fetchSubscriptionDetailsWithAccessToken:(NSString *)a3 subscriptionID:(NSString *)a4 utilityID:(NSString *)a5 :(NSURLSession *)a6 completionHandler:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  NSString *v21;
  NSString *v22;
  NSString *v23;
  NSURLSession *v24;
  uint64_t v25;

  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB7438);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = v16;
  v17[7] = a1;
  v18 = sub_23EC2E9A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_256DB8690;
  v19[5] = v17;
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_256DB8698;
  v20[5] = v19;
  v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  sub_23EC1F1F4((uint64_t)v15, (uint64_t)&unk_256DB86A0, (uint64_t)v20);
  swift_release();
}

+ (void)renewAuthorizationTokenWithUtilityID:(NSString *)a3 authorizationToken:(NSString *)a4 accessToken:(NSString *)a5 :(NSURLSession *)a6 completionHandler:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  NSString *v21;
  NSString *v22;
  NSString *v23;
  NSURLSession *v24;
  uint64_t v25;

  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB7438);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = v16;
  v17[7] = a1;
  v18 = sub_23EC2E9A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_256DB8670;
  v19[5] = v17;
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_256DB8678;
  v20[5] = v19;
  v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  sub_23EC1F1F4((uint64_t)v15, (uint64_t)&unk_256DB8680, (uint64_t)v20);
  swift_release();
}

+ (void)revokeSubscriptionWithAuthorizationToken:(NSString *)a3 subscriptionID:(NSString *)a4 utilityID:(NSString *)a5 :(NSURLSession *)a6 completionHandler:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  NSString *v21;
  NSString *v22;
  NSString *v23;
  NSURLSession *v24;
  uint64_t v25;

  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB7438);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = v16;
  v17[7] = a1;
  v18 = sub_23EC2E9A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_256DB8650;
  v19[5] = v17;
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_256DB8658;
  v20[5] = v19;
  v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  sub_23EC1F1F4((uint64_t)v15, (uint64_t)&unk_256DB8660, (uint64_t)v20);
  swift_release();
}

+ (void)resendHistoricalDataWithAuthorizationToken:(NSString *)a3 subscriptionID:(NSString *)a4 utilityID:(NSString *)a5 start:(NSDate *)a6 end:(NSDate *)a7 :(NSURLSession *)a8 completionHandler:(id)a9
{
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  NSString *v24;
  NSString *v25;
  NSString *v26;
  NSDate *v27;
  NSDate *v28;
  NSURLSession *v29;
  uint64_t v30;

  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB7438);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _Block_copy(a9);
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = a5;
  v20[5] = a6;
  v20[6] = a7;
  v20[7] = a8;
  v20[8] = v19;
  v20[9] = a1;
  v21 = sub_23EC2E9A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v18, 1, 1, v21);
  v22 = (_QWORD *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_256DB8630;
  v22[5] = v20;
  v23 = (_QWORD *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_256DB8638;
  v23[5] = v22;
  v24 = a3;
  v25 = a4;
  v26 = a5;
  v27 = a6;
  v28 = a7;
  v29 = a8;
  sub_23EC1F1F4((uint64_t)v18, (uint64_t)&unk_256DB8640, (uint64_t)v23);
  swift_release();
}

- (_TtC19HomeUtilityServices26UtilitySubscriptionService)init
{
  _TtC19HomeUtilityServices26UtilitySubscriptionService *result;

  result = (_TtC19HomeUtilityServices26UtilitySubscriptionService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HomeUtilityServices26UtilitySubscriptionService_configuration));
}

- (void)createUtilitySubscriptionWithServiceLocation:(_TtC19HomeUtilityServices22UtilityServiceLocation *)a3 accessToken:(NSString *)a4 siteID:(NSString *)a5 :(NSURLSession *)a6 completionHandler:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  _TtC19HomeUtilityServices22UtilityServiceLocation *v21;
  NSString *v22;
  NSString *v23;
  NSURLSession *v24;
  _TtC19HomeUtilityServices26UtilitySubscriptionService *v25;
  uint64_t v26;

  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB7438);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = v16;
  v17[7] = self;
  v18 = sub_23EC2E9A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_256DB9078;
  v19[5] = v17;
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_256DB9080;
  v20[5] = v19;
  v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  v25 = self;
  sub_23EC1F1F4((uint64_t)v15, (uint64_t)&unk_256DB9088, (uint64_t)v20);
  swift_release();
}

- (void)verifyOTPForAccountWithFactor:(_TtC19HomeUtilityServices21TAFVerificationFactor *)a3 oneTimePasscode:(NSString *)a4 :(NSURLSession *)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  _TtC19HomeUtilityServices21TAFVerificationFactor *v19;
  NSString *v20;
  NSURLSession *v21;
  _TtC19HomeUtilityServices26UtilitySubscriptionService *v22;
  uint64_t v23;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB7438);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  v16 = sub_23EC2E9A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_256DB9058;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_256DB9060;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = self;
  sub_23EC1F1F4((uint64_t)v13, (uint64_t)&unk_256DB9068, (uint64_t)v18);
  swift_release();
}

- (void)createUtilitySubscriptionWithServiceLocationID:(NSString *)a3 accessToken:(NSString *)a4 siteID:(NSString *)a5 :(NSURLSession *)a6 completionHandler:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  NSString *v21;
  NSString *v22;
  NSString *v23;
  NSURLSession *v24;
  _TtC19HomeUtilityServices26UtilitySubscriptionService *v25;
  uint64_t v26;

  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB7438);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = v16;
  v17[7] = self;
  v18 = sub_23EC2E9A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_256DB9038;
  v19[5] = v17;
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_256DB9040;
  v20[5] = v19;
  v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  v25 = self;
  sub_23EC1F1F4((uint64_t)v15, (uint64_t)&unk_256DB9048, (uint64_t)v20);
  swift_release();
}

- (void)createUtilitySubscriptionWithServiceLocationID:(NSString *)a3 accessToken:(NSString *)a4 zoneName:(NSString *)a5 :(NSURLSession *)a6 completionHandler:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  NSString *v21;
  NSString *v22;
  NSString *v23;
  NSURLSession *v24;
  _TtC19HomeUtilityServices26UtilitySubscriptionService *v25;
  uint64_t v26;

  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB7438);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = v16;
  v17[7] = self;
  v18 = sub_23EC2E9A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_256DB9018;
  v19[5] = v17;
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_256DB9020;
  v20[5] = v19;
  v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  v25 = self;
  sub_23EC1F1F4((uint64_t)v15, (uint64_t)&unk_256DB9028, (uint64_t)v20);
  swift_release();
}

+ (void)resendHistoricalDataWithAccessToken:(NSString *)a3 subscriptionID:(NSString *)a4 utilityID:(NSString *)a5 start:(NSDate *)a6 end:(NSDate *)a7 :(NSURLSession *)a8 completionHandler:(id)a9
{
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  NSString *v24;
  NSString *v25;
  NSString *v26;
  NSDate *v27;
  NSDate *v28;
  NSURLSession *v29;
  uint64_t v30;

  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB7438);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _Block_copy(a9);
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = a5;
  v20[5] = a6;
  v20[6] = a7;
  v20[7] = a8;
  v20[8] = v19;
  v20[9] = a1;
  v21 = sub_23EC2E9A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v18, 1, 1, v21);
  v22 = (_QWORD *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_256DB9008;
  v22[5] = v20;
  v23 = (_QWORD *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_256DB8460;
  v23[5] = v22;
  v24 = a3;
  v25 = a4;
  v26 = a5;
  v27 = a6;
  v28 = a7;
  v29 = a8;
  sub_23EC1F1F4((uint64_t)v18, (uint64_t)&unk_256DB8468, (uint64_t)v23);
  swift_release();
}

+ (void)revokeSubscriptionWithAccessToken:(NSString *)a3 subscriptionID:(NSString *)a4 utilityID:(NSString *)a5 :(NSURLSession *)a6 completionHandler:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  NSString *v21;
  NSString *v22;
  NSString *v23;
  NSURLSession *v24;
  uint64_t v25;

  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256DB7438);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = v16;
  v17[7] = a1;
  v18 = sub_23EC2E9A8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_256DB8FD8;
  v19[5] = v17;
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_256DB7450;
  v20[5] = v19;
  v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  sub_23EC1F1F4((uint64_t)v15, (uint64_t)&unk_256DB7458, (uint64_t)v20);
  swift_release();
}

@end
