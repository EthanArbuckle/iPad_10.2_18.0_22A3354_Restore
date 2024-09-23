@implementation UpsellBreakoutView

- (_TtC8AppStore18UpsellBreakoutView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore18UpsellBreakoutView *)sub_100576B08(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore18UpsellBreakoutView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1005785D4();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC8AppStore18UpsellBreakoutView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_100577508(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore18UpsellBreakoutView *v2;

  v2 = self;
  sub_100577730();

}

- (void)didTapVideo
{
  _TtC8AppStore18UpsellBreakoutView *v2;

  v2 = self;
  sub_100577B48();

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC8AppStore18UpsellBreakoutView *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_100578A38(v7);

  return v9 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC8AppStore18UpsellBreakoutView *v11;
  void *v12;
  char *v13;
  __n128 v14;
  uint64_t v15;
  char v17[24];
  objc_super v18;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = type metadata accessor for BreakoutDetails.TextAlignment(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = &v17[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v18.receiver = self;
  v18.super_class = ObjectType;
  v10 = a3;
  v11 = self;
  -[UpsellBreakoutView traitCollectionDidChange:](&v18, "traitCollectionDidChange:", v10);
  v12 = *(Class *)((char *)&v11->super.super.super.isa + OBJC_IVAR____TtC8AppStore18UpsellBreakoutView_buttonDetailsView);
  v13 = (char *)v11 + OBJC_IVAR____TtC8AppStore18UpsellBreakoutView_buttonDetailsTextAlignment;
  v14 = swift_beginAccess((char *)v11 + OBJC_IVAR____TtC8AppStore18UpsellBreakoutView_buttonDetailsTextAlignment, v17, 0, 0);
  (*(void (**)(char *, char *, uint64_t, __n128))(v7 + 16))(v9, v13, v6, v14);
  v15 = BreakoutDetails.TextAlignment.textAlignment(in:)(v11);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  objc_msgSend(v12, "setTextAlignment:", v15);

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore18UpsellBreakoutView_tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore18UpsellBreakoutView_backgroundEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore18UpsellBreakoutView_mediaViewContainer));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore18UpsellBreakoutView_buttonDetailsView));
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore18UpsellBreakoutView_buttonDetailsTextAlignment;
  v4 = type metadata accessor for BreakoutDetails.TextAlignment(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore18UpsellBreakoutView_pageTraits));
}

@end
