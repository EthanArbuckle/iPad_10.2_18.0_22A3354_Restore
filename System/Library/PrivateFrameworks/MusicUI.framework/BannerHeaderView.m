@implementation BannerHeaderView

- (void)didMoveToWindow
{
  _TtC7MusicUIP33_250C7DB8BF276A87404B342AF809748C16BannerHeaderView *v2;

  v2 = self;
  sub_21D5576CC();

}

- (_TtC7MusicUIP33_250C7DB8BF276A87404B342AF809748C16BannerHeaderView)initWithContentView:(id)a3
{
  id v3;

  v3 = a3;
  sub_21D557E44();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7MusicUIP33_250C7DB8BF276A87404B342AF809748C16BannerHeaderView_hostingView));
  v3 = (char *)self + OBJC_IVAR____TtC7MusicUIP33_250C7DB8BF276A87404B342AF809748C16BannerHeaderView_metricsContext;
  v4 = sub_21D7C489C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
