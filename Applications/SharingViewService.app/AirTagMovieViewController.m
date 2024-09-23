@implementation AirTagMovieViewController

- (void)viewWillAppear:(BOOL)a3
{
  _TtC18SharingViewService25AirTagMovieViewController *v4;

  v4 = self;
  sub_10008B808(a3);

}

- (_TtC18SharingViewService25AirTagMovieViewController)initWithContentView:(id)a3
{
  unsigned __int8 *v5;
  objc_super v7;

  v5 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService25AirTagMovieViewController_movie];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService25AirTagMovieViewController_shouldSkipEngageMovie] = 0;
  swift_unknownObjectWeakInit(&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService25AirTagMovieViewController_mainController], 0);
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AirTagMovieViewController();
  return -[AirTagMovieViewController initWithContentView:](&v7, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  uint64_t v3;

  swift_unknownObjectWeakDestroy(&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService25AirTagMovieViewController_mainController], v3);
}

@end
