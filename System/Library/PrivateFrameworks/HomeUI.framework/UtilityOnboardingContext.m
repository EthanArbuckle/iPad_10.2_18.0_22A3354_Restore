@implementation UtilityOnboardingContext

- (HMHome)home
{
  return (HMHome *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC6HomeUI24UtilityOnboardingContext_home));
}

- (_TtC6HomeUI24UtilityOnboardingContext)initWithHome:(id)a3
{
  id v3;
  _TtC6HomeUI24UtilityOnboardingContext *v4;

  v3 = a3;
  v4 = (_TtC6HomeUI24UtilityOnboardingContext *)sub_1B8E93A1C(v3);

  return v4;
}

- (NSString)utilityID
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR____TtC6HomeUI24UtilityOnboardingContext_utilityID;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  sub_1B93ECF74();
  v3 = (void *)sub_1B93EDD84();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setUtilityID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  _TtC6HomeUI24UtilityOnboardingContext *v8;

  if (a3)
  {
    v4 = sub_1B93EDDB4();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC6HomeUI24UtilityOnboardingContext_utilityID);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  v8 = self;
  swift_bridgeObjectRelease();
  sub_1B8E8160C(MEMORY[0x1E0DF2290], &OBJC_IVAR____TtC6HomeUI24UtilityOnboardingContext_utilityID, "Setting utility id %s");

}

- (HUUtilityConfigurationHelper)config
{
  return (HUUtilityConfigurationHelper *)sub_1B8E34318((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC6HomeUI24UtilityOnboardingContext_config);
}

- (void)setConfig:(id)a3
{
  sub_1B8E7EC54((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC6HomeUI24UtilityOnboardingContext_config, sub_1B8E7E8F8);
}

- (UIImage)utilityLogo
{
  return (UIImage *)sub_1B8E34318((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC6HomeUI24UtilityOnboardingContext_utilityLogo);
}

- (void)setUtilityLogo:(id)a3
{
  sub_1B8E7EC54((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC6HomeUI24UtilityOnboardingContext_utilityLogo, sub_1B8E7EDD4);
}

- (NSArray)allUtilities
{
  return (NSArray *)sub_1B8E810B8();
}

- (void)setAllUtilities:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF20D4E0);
  v4 = sub_1B93EDF4C();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC6HomeUI24UtilityOnboardingContext_allUtilities);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSDictionary)tafResponses
{
  return (NSDictionary *)sub_1B8E81E24();
}

- (void)setTafResponses:(id)a3
{
  sub_1B8E81EBC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, MEMORY[0x1E0DEA968], &OBJC_IVAR____TtC6HomeUI24UtilityOnboardingContext_tafResponses);
}

- (void)setResponseFor:(id)a3 value:(id)a4
{
  sub_1B8E89924(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, uint64_t, uint64_t))sub_1B8E80394);
}

- (void)populateFieldsFromMeContact
{
  _TtC6HomeUI24UtilityOnboardingContext *v2;

  v2 = self;
  sub_1B8E805B4();

}

- (BOOL)allRequiredFieldsComplete
{
  _TtC6HomeUI24UtilityOnboardingContext *v2;
  char v3;

  v2 = self;
  v3 = sub_1B8E80D34();

  return v3 & 1;
}

- (BOOL)quickLookupHasAllFields
{
  _TtC6HomeUI24UtilityOnboardingContext *v2;
  char v3;

  v2 = self;
  v3 = sub_1B8E80E30();

  return v3 & 1;
}

- (NSArray)otpFactors
{
  return (NSArray *)sub_1B8E810B8();
}

- (void)setOtpFactors:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  _TtC6HomeUI24UtilityOnboardingContext *v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF20D4E0);
  v4 = sub_1B93EDF4C();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC6HomeUI24UtilityOnboardingContext_otpFactors);
  swift_beginAccess();
  *v5 = v4;
  v6 = self;
  swift_bridgeObjectRelease();
  sub_1B8E820C8(MEMORY[0x1E0DF2290], &OBJC_IVAR____TtC6HomeUI24UtilityOnboardingContext_otpFactors, "Setting factors %s");

}

- (NSDictionary)tokens
{
  return (NSDictionary *)sub_1B8E81E24();
}

- (void)setTokens:(id)a3
{
  sub_1B8E81EBC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, MEMORY[0x1E0DEE9B8] + 8, &OBJC_IVAR____TtC6HomeUI24UtilityOnboardingContext_tokens);
}

- (void)setSelectedOTPMethodWithFactor:(id)a3
{
  id v4;
  _TtC6HomeUI24UtilityOnboardingContext *v5;

  v4 = a3;
  v5 = self;
  sub_1B8E82828(v4);

}

- (void)verifyAddressAndSubmitTAFWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC6HomeUI24UtilityOnboardingContext *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57F900);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1B93EE090();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EF2093A8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EF2093B0;
  v12[5] = v11;
  v13 = self;
  sub_1B901BAB4((uint64_t)v7, (uint64_t)&unk_1EF2093B8, (uint64_t)v12);
  swift_release();
}

- (void)requestOTPWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC6HomeUI24UtilityOnboardingContext *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57F900);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1B93EE090();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EF209388;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EF209390;
  v12[5] = v11;
  v13 = self;
  sub_1B901BAB4((uint64_t)v7, (uint64_t)&unk_1EF209398, (uint64_t)v12);
  swift_release();
}

- (void)createAccessTokenWithAuthCode:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _TtC6HomeUI24UtilityOnboardingContext *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57F900);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_1B93EE090();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EF209368;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EF209370;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1B901BAB4((uint64_t)v9, (uint64_t)&unk_1EF20E5B0, (uint64_t)v14);
  swift_release();
}

- (void)updateIconWithHeaderView:(id)a3 axID:(id)a4
{
  sub_1B8E89924(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, uint64_t, uint64_t))sub_1B8E89600);
}

- (_TtC6HomeUI24UtilityOnboardingContext)init
{
  _TtC6HomeUI24UtilityOnboardingContext *result;

  result = (_TtC6HomeUI24UtilityOnboardingContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B8E26870((uint64_t)self + OBJC_IVAR____TtC6HomeUI24UtilityOnboardingContext_expirationDate, (uint64_t *)&unk_1EF209130);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
