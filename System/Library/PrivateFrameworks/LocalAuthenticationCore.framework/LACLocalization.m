@implementation LACLocalization

+ (id)faceID
{
  return @objc static LACLocalization.faceID()((int)a1, (int)a2, 0x44495F45434146, (void *)0xE700000000000000);
}

+ (id)touchID
{
  return @objc static LACLocalization.faceID()((int)a1, (int)a2, 0x44495F4843554F54, (void *)0xE800000000000000);
}

+ (id)opticID
{
  return @objc static LACLocalization.faceID()((int)a1, (int)a2, 0x44495F434954504FLL, (void *)0xE800000000000000);
}

+ (id)dtoSecurityDelayEndedText:(id)a3 duration:(double)a4
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = specialized static LACLocalization.dtoSecurityDelayEndedText(_:duration:)(v5, v6, a4);
  v9 = v8;
  swift_bridgeObjectRelease();
  v10 = (void *)MEMORY[0x2426863FC](v7, v9);
  swift_bridgeObjectRelease();
  return v10;
}

+ (id)dtoErrorPasscodeNotSet
{
  return @objc static LACLocalization.dtoErrorPasscodeNotSet()((int)a1, (int)a2, 0xD00000000000001ALL, (void *)0x8000000240A85C80);
}

+ (id)dtoErrorBiometryNotEnrolled
{
  return @objc static LACLocalization.dtoErrorPasscodeNotSet()((int)a1, (int)a2, 0xD00000000000001FLL, (void *)0x8000000240A85CA0);
}

+ (id)dtoErrorDeviceTypeNotSupported
{
  return @objc static LACLocalization.dtoErrorPasscodeNotSet()((int)a1, (int)a2, 0xD000000000000023, (void *)0x8000000240A85CC0);
}

@end
