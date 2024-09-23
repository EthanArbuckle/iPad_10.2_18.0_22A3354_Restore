@implementation SNFileListingResult

- (NSArray)fileItems
{
  void *v2;

  sub_1D44C837C();
  sub_1D446CD38();
  v2 = (void *)sub_1D451A908();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (SNFileListingResult)initWithFileItems:(id)a3
{
  uint64_t v3;

  sub_1D446CD38();
  v3 = sub_1D451A92C();
  return (SNFileListingResult *)sub_1D44C838C(v3);
}

- (SNFileListingResult)init
{
  SNFileListingResult.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
