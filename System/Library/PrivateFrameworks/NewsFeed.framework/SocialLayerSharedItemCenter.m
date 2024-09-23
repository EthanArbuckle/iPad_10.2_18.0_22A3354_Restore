@implementation SocialLayerSharedItemCenter

- (_TtC8NewsFeed27SocialLayerSharedItemCenter)init
{
  return (_TtC8NewsFeed27SocialLayerSharedItemCenter *)SocialLayerSharedItemCenter.init()();
}

- (void)highlightCenter:(id)a3 didRemoveHighlights:(id)a4
{
  unint64_t v6;
  id v7;
  _TtC8NewsFeed27SocialLayerSharedItemCenter *v8;

  sub_1BA49A224(0, &qword_1ED3BBB88);
  v6 = sub_1BB872DB4();
  v7 = a3;
  v8 = self;
  SocialLayerSharedItemCenter.highlightCenter(_:didRemove:)(v7, v6);

  swift_bridgeObjectRelease();
}

- (void)highlightCenterDidAddHighlights:(id)a3
{
  id v4;
  _TtC8NewsFeed27SocialLayerSharedItemCenter *v5;

  v4 = a3;
  v5 = self;
  _s8NewsFeed27SocialLayerSharedItemCenterC09highlightG16DidAddHighlightsyySo011SLHighlightG0CF_0();

}

- (void).cxx_destruct
{
  swift_release();
  sub_1BA8FD860((uint64_t)self + OBJC_IVAR____TtC8NewsFeed27SocialLayerSharedItemCenter_delegate);
}

@end
