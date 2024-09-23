@implementation ActivityPreviewHostingViewController

- (_TtC9ChronoKit36ActivityPreviewHostingViewController)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC9ChronoKit36ActivityPreviewHostingViewController *result;

  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC9ChronoKit36ActivityPreviewHostingViewController_islandSize);
  *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9ChronoKit36ActivityPreviewHostingViewController_apertureTopEdgeMetric) = 0;
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC9ChronoKit36ActivityPreviewHostingViewController_isLuminanceReduced) = 0;
  v5 = a3;

  result = (_TtC9ChronoKit36ActivityPreviewHostingViewController *)sub_1D26CE1D8();
  __break(1u);
  return result;
}

- (void)viewWillLayoutSubviews
{
  _TtC9ChronoKit36ActivityPreviewHostingViewController *v2;

  v2 = self;
  sub_1D267A030();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  sub_1D25340E4((uint64_t)self + OBJC_IVAR____TtC9ChronoKit36ActivityPreviewHostingViewController_autoupdatingPreviewView, type metadata accessor for ActivityPreviewHostingViewController._ActivityAutoupdatingPreviewView);
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC9ChronoKit36ActivityPreviewHostingViewController_environment;
  v4 = sub_1D26CC7A4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC9ChronoKit36ActivityPreviewHostingViewController_viewKind;
  v6 = sub_1D26CD5E4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_release();
}

@end
