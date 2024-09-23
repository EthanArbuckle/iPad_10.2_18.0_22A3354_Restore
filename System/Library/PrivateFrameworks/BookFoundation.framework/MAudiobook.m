@implementation MAudiobook

- (NSString)seriesName
{
  _TtC14BookFoundation10MAudiobook *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  MAudiobook.seriesName.getter();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_21C458E40();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

@end
