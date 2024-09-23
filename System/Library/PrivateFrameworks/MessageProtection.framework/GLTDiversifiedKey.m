@implementation GLTDiversifiedKey

- (__SecKey)diversifiedKey
{
  return (__SecKey *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC17MessageProtection17GLTDiversifiedKey_diversifiedKey));
}

- (NSData)trackingPreventionSalt
{
  return (NSData *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC17MessageProtection17GLTDiversifiedKey_trackingPreventionSalt));
}

- (_TtC17MessageProtection17GLTDiversifiedKey)init
{
  _TtC17MessageProtection17GLTDiversifiedKey *result;

  result = (_TtC17MessageProtection17GLTDiversifiedKey *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17MessageProtection17GLTDiversifiedKey_trackingPreventionSalt));
}

@end
