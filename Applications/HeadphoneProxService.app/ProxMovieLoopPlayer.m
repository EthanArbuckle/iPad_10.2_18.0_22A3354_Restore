@implementation ProxMovieLoopPlayer

+ (Class)layerClass
{
  unint64_t v2;

  v2 = sub_10001FEE4();
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (void)layoutSubviews
{
  _TtC20HeadphoneProxService19ProxMovieLoopPlayer *v2;

  v2 = self;
  sub_10001F9DC();

}

- (_TtC20HeadphoneProxService19ProxMovieLoopPlayer)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10001FDC8();
}

- (_TtC20HeadphoneProxService19ProxMovieLoopPlayer)initWithFrame:(CGRect)a3
{
  _TtC20HeadphoneProxService19ProxMovieLoopPlayer *result;

  result = (_TtC20HeadphoneProxService19ProxMovieLoopPlayer *)_swift_stdlib_reportUnimplementedInitializer("HeadphoneProxService.ProxMovieLoopPlayer", 40, "init(frame:)", 12, 0, (__n128)a3.origin, *(__n128 *)&a3.origin.y, (__n128)a3.size, *(__n128 *)&a3.size.height);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20HeadphoneProxService19ProxMovieLoopPlayer_player));
  v3 = (char *)self + OBJC_IVAR____TtC20HeadphoneProxService19ProxMovieLoopPlayer_url;
  v4 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20HeadphoneProxService19ProxMovieLoopPlayer_playerLooper));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20HeadphoneProxService19ProxMovieLoopPlayer_playerLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20HeadphoneProxService19ProxMovieLoopPlayer_videoPlayer));
}

@end
