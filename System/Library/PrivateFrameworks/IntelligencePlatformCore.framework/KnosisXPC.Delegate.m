@implementation KnosisXPC.Delegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtCC24IntelligencePlatformCore9KnosisXPC8Delegate *v8;
  char v9;
  char v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1C0BC1220((uint64_t)v8, v7);
  v10 = v9;

  return v10 & 1;
}

- (_TtCC24IntelligencePlatformCore9KnosisXPC8Delegate)init
{
  return (_TtCC24IntelligencePlatformCore9KnosisXPC8Delegate *)_s24IntelligencePlatformCore19EntityResolutionXPCC6ServerCAEycfc_0();
}

@end
