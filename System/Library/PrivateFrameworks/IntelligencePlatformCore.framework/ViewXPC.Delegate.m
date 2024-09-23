@implementation ViewXPC.Delegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtCC24IntelligencePlatformCore7ViewXPC8Delegate *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1C0F0CDFC((uint64_t)v8, v7);

  return v9 & 1;
}

- (_TtCC24IntelligencePlatformCore7ViewXPC8Delegate)init
{
  return (_TtCC24IntelligencePlatformCore7ViewXPC8Delegate *)_s24IntelligencePlatformCore19EntityResolutionXPCC6ServerCAEycfc_0();
}

@end
