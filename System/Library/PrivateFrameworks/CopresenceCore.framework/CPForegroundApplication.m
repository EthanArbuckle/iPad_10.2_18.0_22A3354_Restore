@implementation CPForegroundApplication

- (NSString)bundleIdentifier
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CPForegroundApplication_bundleIdentifier);
  v3 = *(_QWORD *)&self->bundleIdentifier[OBJC_IVAR___CPForegroundApplication_bundleIdentifier];
  swift_bridgeObjectRetain();
  v4 = (void *)MEMORY[0x1AF4480F4](v2, v3);
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (int64_t)applicationType
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___CPForegroundApplication_applicationType);
}

- (NSString)localizedApplicationName
{
  CPForegroundApplication *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = CPForegroundApplication.localizedApplicationName.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x1AF4480F4](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (BOOL)isGameCenterApplication
{
  void **v3;
  void *v4;
  CPForegroundApplication *v5;
  id v6;
  void *v7;
  CPForegroundApplication *v8;

  v3 = (void **)((char *)&self->super.isa + OBJC_IVAR___CPForegroundApplication_featureFlags);
  swift_beginAccess();
  v4 = *v3;
  v5 = self;
  if (objc_msgSend(v4, sel_gameCenterSharePlayIntegration))
  {
    v6 = CPForegroundApplication.applicationRecord.getter();
    v7 = v6;
    if (v6)
    {
      v8 = (CPForegroundApplication *)objc_msgSend(v6, sel_entitlements);

      LOBYTE(v7) = LSPropertyList.containsAnyGameCenterEntitlements()();
      v5 = v8;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7 & 1;
}

- (CPForegroundApplication)init
{
  CPForegroundApplication *result;

  result = (CPForegroundApplication *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

@end
