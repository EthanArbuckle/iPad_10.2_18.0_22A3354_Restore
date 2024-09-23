@implementation NowPlayingActivityViewController

- (BOOL)_shouldShowSystemActivityType:(id)a3
{
  return 0;
}

- (_TtC12NewsArticles32NowPlayingActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4
{
  objc_class *ObjectType;
  void *v7;
  void *v8;
  _TtC12NewsArticles32NowPlayingActivityViewController *v9;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_1BA0BEA38();
  if (a4)
  {
    sub_1B9E538B8();
    a4 = (id)sub_1BA0BEA38();
  }
  v7 = (void *)sub_1BA0BEA2C();
  swift_bridgeObjectRelease();
  if (a4)
  {
    sub_1B9E538B8();
    v8 = (void *)sub_1BA0BEA2C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  v11.receiver = self;
  v11.super_class = ObjectType;
  v9 = -[NowPlayingActivityViewController initWithActivityItems:applicationActivities:](&v11, sel_initWithActivityItems_applicationActivities_, v7, v8);

  return v9;
}

@end
