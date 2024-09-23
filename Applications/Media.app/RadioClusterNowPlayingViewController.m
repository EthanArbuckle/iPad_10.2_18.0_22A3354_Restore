@implementation RadioClusterNowPlayingViewController

- (_TtC5Media36RadioClusterNowPlayingViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100017BA4();
}

- (void)viewDidLoad
{
  _TtC5Media36RadioClusterNowPlayingViewController *v2;

  v2 = self;
  sub_1000150F8();

}

- (void)invalidate
{
  uint64_t *v2;
  uint64_t v3;
  _BYTE v4[24];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController_cancelSet);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController_cancelSet, v4, 1, 0);
  v3 = *v2;
  *v2 = (uint64_t)&_swiftEmptySetSingleton;
  swift_bridgeObjectRelease(v3);
}

- (_TtC5Media36RadioClusterNowPlayingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  __n128 v5;
  __n128 v6;
  __n128 v7;
  __n128 v8;
  _TtC5Media36RadioClusterNowPlayingViewController *result;

  v4 = a4;
  result = (_TtC5Media36RadioClusterNowPlayingViewController *)_swift_stdlib_reportUnimplementedInitializer("Media.RadioClusterNowPlayingViewController", 42, "init(nibName:bundle:)", 21, 0, v5, v6, v7, v8);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController_nowPlaying);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController_carSession));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController_cancelSet));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController_lastSnapshot));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController_song));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController_lastCatalog));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController_tertiaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController_stackView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController_constraints));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController____lazy_storage___backgroundArtwork));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController____lazy_storage___visualEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController____lazy_storage___progressView));
}

- (void)nowPlayingManager:(id)a3 didUpdateSnapshot:(id)a4
{
  void *v6;
  id v7;
  _TtC5Media36RadioClusterNowPlayingViewController *v8;
  id v9;

  v6 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController_lastSnapshot);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController_lastSnapshot) = (Class)a4;
  v7 = a4;
  v9 = a3;
  v8 = self;

  if (*((_BYTE *)&v8->super.super.super.isa
       + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController_iOSOwnsMainAudio) == 1)
    sub_1000159B8();

}

@end
