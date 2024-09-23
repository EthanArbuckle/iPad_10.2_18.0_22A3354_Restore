@implementation CRContext

- (CRContext)init
{
  CRContext *result;

  result = (CRContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  sub_1BDD86E30((uint64_t)self + OBJC_IVAR___CRContext_encryptionDelegate, qword_1ED6F3DD0);
}

+ (id)newTransientContextObjC
{
  id v2;
  _OWORD v4[2];
  uint64_t v5;

  v5 = 0;
  memset(v4, 0, sizeof(v4));
  v2 = _s9Coherence9CRContextC19newTransientContext18uniqueAssetManager18encryptionDelegateACSb_AA010EncryptionJ0_pSgtFZ_0(0, (uint64_t)v4);
  sub_1BDD86E30((uint64_t)v4, qword_1ED6F3DD0);
  return v2;
}

@end
