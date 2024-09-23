@implementation MediaPlayerView

- (AVPlayer)player
{
  _TtC18SharingViewService15MediaPlayerView *v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = self;
  v3 = -[MediaPlayerView layer](v2, "layer");
  v4 = objc_opt_self(AVPlayerLayer);
  v5 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(v3, v4, 0, 0, 0), "player");

  return (AVPlayer *)v5;
}

- (void)setPlayer:(id)a3
{
  _TtC18SharingViewService15MediaPlayerView *v4;
  id v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v4 = self;
  v5 = -[MediaPlayerView layer](v4, "layer");
  v6 = objc_opt_self(AVPlayerLayer);
  objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(v5, v6, 0, 0, 0), "setPlayer:", v7);

}

+ (Class)layerClass
{
  uint64_t v2;

  v2 = sub_100013194(0, &qword_1001A45A8, AVPlayerLayer_ptr);
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (_TtC18SharingViewService15MediaPlayerView)initWithFrame:(CGRect)a3
{
  return (_TtC18SharingViewService15MediaPlayerView *)sub_100025058(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, type metadata accessor for MediaPlayerView);
}

- (_TtC18SharingViewService15MediaPlayerView)initWithCoder:(id)a3
{
  return (_TtC18SharingViewService15MediaPlayerView *)sub_1000250D0(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for MediaPlayerView);
}

@end
