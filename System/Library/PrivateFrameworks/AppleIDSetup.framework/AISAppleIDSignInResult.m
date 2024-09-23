@implementation AISAppleIDSignInResult

- (NSDictionary)authResults
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(qword_2563E9CC0);
  v2 = (void *)sub_2365AFF48();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (void)setAuthResults:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  __swift_instantiateConcreteTypeFromMangledName(qword_2563E9CC0);
  v4 = sub_2365AFF60();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___AISAppleIDSignInResult_authResults);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (AISAppleIDSignInResult)init
{
  AISAppleIDSignInResult *result;

  result = (AISAppleIDSignInResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
