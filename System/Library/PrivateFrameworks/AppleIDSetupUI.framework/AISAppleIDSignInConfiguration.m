@implementation AISAppleIDSignInConfiguration

- (NSString)username
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___AISAppleIDSignInConfiguration_username;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_2367372B8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setUsername:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  if (a3)
  {
    v4 = sub_2367372DC();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___AISAppleIDSignInConfiguration_username);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (BOOL)canEditUsername
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___AISAppleIDSignInConfiguration_canEditUsername;
  swift_beginAccess();
  return *v2;
}

- (void)setCanEditUsername:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___AISAppleIDSignInConfiguration_canEditUsername;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)allowSkip
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___AISAppleIDSignInConfiguration_allowSkip;
  swift_beginAccess();
  return *v2;
}

- (void)setAllowSkip:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___AISAppleIDSignInConfiguration_allowSkip;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)shouldShowSystemBackButton
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___AISAppleIDSignInConfiguration_shouldShowSystemBackButton;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldShowSystemBackButton:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___AISAppleIDSignInConfiguration_shouldShowSystemBackButton;
  swift_beginAccess();
  *v4 = a3;
}

- (NSArray)serviceTypes
{
  void *v2;

  swift_beginAccess();
  type metadata accessor for AIDAServiceType(0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_2367373B4();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setServiceTypes:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  type metadata accessor for AIDAServiceType(0);
  v4 = sub_2367373C0();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___AISAppleIDSignInConfiguration_serviceTypes);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (BOOL)isProximitySetupEnabled
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___AISAppleIDSignInConfiguration_isProximitySetupEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setIsProximitySetupEnabled:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___AISAppleIDSignInConfiguration_isProximitySetupEnabled;
  swift_beginAccess();
  *v4 = a3;
}

- (NSArray)privacyLinkIdentifiers
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_2367373B4();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setPrivacyLinkIdentifiers:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  v4 = sub_2367373C0();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___AISAppleIDSignInConfiguration_privacyLinkIdentifiers);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (AIDAServiceContext)aidaServiceContext
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___AISAppleIDSignInConfiguration_aidaServiceContext);
  swift_beginAccess();
  return (AIDAServiceContext *)*v2;
}

- (void)setAidaServiceContext:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___AISAppleIDSignInConfiguration_aidaServiceContext);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (int64_t)signInFlowType
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___AISAppleIDSignInConfiguration_signInFlowType);
  swift_beginAccess();
  return *v2;
}

- (void)setSignInFlowType:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___AISAppleIDSignInConfiguration_signInFlowType);
  swift_beginAccess();
  *v4 = a3;
}

- (AISAppleIDSignInConfiguration)init
{
  return (AISAppleIDSignInConfiguration *)AISAppleIDSignInConfiguration.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

+ (NSArray)defaultServiceTypes
{
  void *v2;

  if (qword_256425DD0 != -1)
    swift_once();
  type metadata accessor for AIDAServiceType(0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_2367373B4();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

+ (NSString)defaultPrivacyIdentifier
{
  return (NSString *)(id)sub_2367372B8();
}

@end
