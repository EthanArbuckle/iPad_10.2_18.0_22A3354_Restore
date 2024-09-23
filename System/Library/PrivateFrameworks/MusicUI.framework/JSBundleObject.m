@implementation JSBundleObject

- (NSDictionary)manifest
{
  void *v2;

  sub_21D4A50B4();
  v2 = (void *)sub_21D7C4FBC();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (id)loadResource:(id)a3
{
  _TtC7MusicUI14JSBundleObject *v4;
  void *v5;

  sub_21D7C50F4();
  v4 = self;
  v5 = (void *)sub_21D4A50C4();

  swift_bridgeObjectRelease();
  return v5;
}

- (_TtC7MusicUI14JSBundleObject)init
{
  sub_21D4A5B88();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
}

@end
