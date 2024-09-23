@implementation MCLSignatureVerification

+ (BOOL)verifySignatureOf:(id)a3 with:(id)a4 using:(id)a5
{
  id v5;
  id v6;
  id v7;

  swift_getObjCClassMetadata();
  v5 = a3;
  v6 = a4;
  v7 = a5;
  sub_21CAC5B2C();
  sub_21CAC5B2C();
  sub_21CAC5B2C();
  swift_getObjCClassMetadata();
  sub_21CABD9FC();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return sub_21CAC58C8() & 1;
}

- (MCLSignatureVerification)init
{
  return (MCLSignatureVerification *)sub_21CABE12C();
}

@end
