@implementation SNFileDeletionResult

- (NSString)fileName
{
  void *v2;

  sub_1D43121D0();
  v2 = (void *)sub_1D451A6C8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSError)error
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = sub_1D431224C();
  if (v2)
  {
    v3 = (void *)v2;
    v4 = (void *)sub_1D4519A98();

  }
  else
  {
    v4 = 0;
  }
  return (NSError *)v4;
}

- (SNFileDeletionResult)init
{
  SNFileDeletionResult.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
