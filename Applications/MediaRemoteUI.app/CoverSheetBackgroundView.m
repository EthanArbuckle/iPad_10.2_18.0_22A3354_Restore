@implementation CoverSheetBackgroundView

- (_TtC13MediaRemoteUI24CoverSheetBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC13MediaRemoteUI24CoverSheetBackgroundView *)sub_10000897C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC13MediaRemoteUI24CoverSheetBackgroundView)initWithCoder:(id)a3
{
  return -[CoverSheetBackgroundView initWithFrame:](self, "initWithFrame:", a3, 0.0, 0.0, 0.0, 0.0);
}

- (void)layoutSubviews
{
  char *v2;
  uint64_t v3;
  uint64_t Strong;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CoverSheetBackgroundView();
  v2 = (char *)v6.receiver;
  -[CoverSheetBackgroundView layoutSubviews](&v6, "layoutSubviews");
  Strong = swift_unknownObjectWeakLoadStrong(&v2[OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_visualizerView], v3);
  if (Strong)
  {
    v5 = (void *)Strong;
    objc_msgSend(v2, "bounds", v6.receiver, v6.super_class);
    objc_msgSend(v5, "setFrame:");

  }
  sub_100008C30();

}

- (void)artworkView:(id)a3 didChangeArtworkImage:(id)a4
{
  id v7;
  _TtC13MediaRemoteUI24CoverSheetBackgroundView *v8;

  swift_unknownObjectRetain(a3);
  v7 = a4;
  v8 = self;
  sub_100008C30();
  swift_unknownObjectRelease(a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_artworkView));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC13MediaRemoteUI24CoverSheetBackgroundView_visualizerView);
}

@end
