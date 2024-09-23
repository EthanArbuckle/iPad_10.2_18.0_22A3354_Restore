@implementation TitleHeaderView

- (_TtC8AppStore15TitleHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore15TitleHeaderView *)sub_10002D954(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  _TtC8AppStore15TitleHeaderView *v2;

  v2 = self;
  sub_100044FF4();

}

- (_TtC8AppStore15TitleHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10035DBEC();
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (void)didTapWithAccessoryView:(id)a3
{
  void (*v3)(_QWORD *);
  uint64_t v6;
  id v7;
  _TtC8AppStore15TitleHeaderView *v8;
  _QWORD v9[4];

  v3 = *(void (**)(_QWORD *))((char *)&self->super.super.super.super.isa
                                       + OBJC_IVAR____TtC8AppStore15TitleHeaderView_accessoryAction);
  if (v3)
  {
    v6 = *(_QWORD *)&self->eyebrowText[OBJC_IVAR____TtC8AppStore15TitleHeaderView_accessoryAction];
    v9[3] = sub_100008FE4(0, &qword_100839400, UIControl_ptr);
    v9[0] = a3;
    v7 = a3;
    v8 = self;
    sub_10003A340((uint64_t)v3, v6);
    v3(v9);
    sub_10003A350((uint64_t)v3, v6);
    sub_1000057AC((uint64_t)v9, (uint64_t *)&unk_10082B490);

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC8AppStore15TitleHeaderView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_1003594EC(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  uint64_t v7;
  uint64_t (*v8)(char *, __n128);
  __n128 v9;
  uint64_t v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for TitleHeaderView(0);
  v4 = a3;
  v5 = (char *)v12.receiver;
  -[TitleHeaderView traitCollectionDidChange:](&v12, "traitCollectionDidChange:", v4);
  v6 = *(void **)&v5[OBJC_IVAR____TtC8AppStore15TitleHeaderView_titleLabel];
  v8 = *(uint64_t (**)(char *, __n128))&v5[OBJC_IVAR____TtC8AppStore15TitleHeaderView_titleLabelNumberOfLines];
  v7 = *(_QWORD *)&v5[OBJC_IVAR____TtC8AppStore15TitleHeaderView_titleLabelNumberOfLines + 8];
  v9 = swift_retain(v7);
  v10 = v8(v5, v9);
  *(_QWORD *)&v11 = swift_release(v7).n128_u64[0];
  objc_msgSend(v6, "setNumberOfLines:", v10, v11, v12.receiver, v12.super_class);
  objc_msgSend(v5, "setNeedsLayout");

}

- (void)prepareForReuse
{
  _TtC8AppStore15TitleHeaderView *v2;

  v2 = self;
  sub_100359918();

}

- (NSString)accessibilityLabel
{
  _TtC8AppStore15TitleHeaderView *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_100359C38();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setAccessibilityLabel:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _TtC8AppStore15TitleHeaderView *v6;
  NSString v7;
  _TtC8AppStore15TitleHeaderView *v8;
  objc_super v9;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v5 = v4;
    v6 = self;
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v8 = self;
    v7 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TitleHeaderView(0);
  -[TitleHeaderView setAccessibilityLabel:](&v9, "setAccessibilityLabel:", v7);

}

- (BOOL)isAccessibilityElement
{
  void *v2;
  _TtC8AppStore15TitleHeaderView *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  objc_super v12;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore15TitleHeaderView_titleLabel);
  v3 = self;
  v4 = objc_msgSend(v2, "text");
  if (v4)
  {
    v5 = v4;
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
    v8 = v7;

    v9 = String.count.getter(v6, v8);
    swift_bridgeObjectRelease(v8);
    return v9 > 0;
  }
  else
  {
    v12.receiver = v3;
    v12.super_class = (Class)type metadata accessor for TitleHeaderView(0);
    v10 = -[TitleHeaderView isAccessibilityElement](&v12, "isAccessibilityElement");

  }
  return v10;
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TitleHeaderView(0);
  -[TitleHeaderView setIsAccessibilityElement:](&v4, "setIsAccessibilityElement:", v3);
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitHeader;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TitleHeaderView(0);
  -[TitleHeaderView setAccessibilityTraits:](&v4, "setAccessibilityTraits:", a3);
}

- (id)_accessibilitySupplementaryFooterViews
{
  _TtC8AppStore15TitleHeaderView *v2;
  uint64_t v3;
  NSArray v4;

  v2 = self;
  v3 = sub_10035A130();

  if (v3)
  {
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return v4.super.isa;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->eyebrowText[OBJC_IVAR____TtC8AppStore15TitleHeaderView_eyebrowText]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore15TitleHeaderView_eyebrowLabel));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore15TitleHeaderView_eyebrowArtwork));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore15TitleHeaderView_eyebrowArtworkView));

  swift_release(*(_QWORD *)&self->eyebrowText[OBJC_IVAR____TtC8AppStore15TitleHeaderView_titleLabelNumberOfLines]);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore15TitleHeaderView_titleArtwork));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore15TitleHeaderView_titleArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore15TitleHeaderView_detailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore15TitleHeaderView_shortDetailLabel));
  sub_10005C8DC((uint64_t)self + OBJC_IVAR____TtC8AppStore15TitleHeaderView_style, type metadata accessor for TitleHeaderView.Style);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore15TitleHeaderView_accessoryView));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore15TitleHeaderView_accessory, &qword_1008346F0);
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore15TitleHeaderView_accessoryAction), *(_QWORD *)&self->eyebrowText[OBJC_IVAR____TtC8AppStore15TitleHeaderView_accessoryAction]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore15TitleHeaderView_separatorLineView));
}

@end
