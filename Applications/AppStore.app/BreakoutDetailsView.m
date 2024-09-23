@implementation BreakoutDetailsView

- (_TtC8AppStore19BreakoutDetailsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10016AD34();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  double width;
  _TtC8AppStore19BreakoutDetailsView *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  JUMeasurements result;

  height = a3.height;
  width = a3.width;
  swift_getObjectType();
  swift_unknownObjectRetain(a4);
  v8 = self;
  v9 = sub_10016A878((uint64_t)a4, (uint64_t)v8, width, height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  swift_unknownObjectRelease(a4);

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.var3 = v19;
  result.var2 = v18;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC8AppStore19BreakoutDetailsView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_10016A878((uint64_t)v5, (uint64_t)v5, width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore19BreakoutDetailsView *v2;

  v2 = self;
  sub_1001688EC();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  char *v5;
  id v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = (char *)v8.receiver;
  -[BreakoutDetailsView traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v6 = objc_msgSend(*(id *)&v5[OBJC_IVAR____TtC8AppStore19BreakoutDetailsView_backgroundMaterialView], "contentView", v8.receiver, v8.super_class);
  v7 = sub_1001668D8();
  NSDirectionalEdgeInsets.insetsWithLayoutDirection(in:)(v5, v7);
  objc_msgSend(v6, "setLayoutMargins:");

  sub_100165E70();
  sub_10016745C();
  objc_msgSend(v5, "setNeedsLayout");

}

- (void)didTapActionButton
{
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  _TtC8AppStore19BreakoutDetailsView *v5;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore19BreakoutDetailsView_callToActionButtonHandler);
  if (v2)
  {
    v3 = *(_QWORD *)&self->badgeLabel[OBJC_IVAR____TtC8AppStore19BreakoutDetailsView_callToActionButtonHandler];
    v5 = self;
    v4 = sub_10003A340((uint64_t)v2, v3);
    v2(v4);
    sub_10003A350((uint64_t)v2, v3);

  }
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityBadgeLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore19BreakoutDetailsView_badgeLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore19BreakoutDetailsView_titleLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityDescriptionLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore19BreakoutDetailsView_descriptionLabel));
}

- (_TtC11AppStoreKit17DynamicTypeButton)accessibilityCallToActionButton
{
  return (_TtC11AppStoreKit17DynamicTypeButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                         + OBJC_IVAR____TtC8AppStore19BreakoutDetailsView_callToActionButton));
}

- (_TtC8AppStore19BreakoutDetailsView)initWithFrame:(CGRect)a3
{
  _TtC8AppStore19BreakoutDetailsView *result;

  result = (_TtC8AppStore19BreakoutDetailsView *)_swift_stdlib_reportUnimplementedInitializer("AppStore.BreakoutDetailsView", 28, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v3 = (char *)self + OBJC_IVAR____TtC8AppStore19BreakoutDetailsView_badge;
  v4 = type metadata accessor for BreakoutDetails.Badge(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore19BreakoutDetailsView_badgeWordmark));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore19BreakoutDetailsView_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore19BreakoutDetailsView_backgroundMaterialView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore19BreakoutDetailsView_callToActionButton));
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8AppStore19BreakoutDetailsView_callToActionButtonHandler), *(_QWORD *)&self->badgeLabel[OBJC_IVAR____TtC8AppStore19BreakoutDetailsView_callToActionButtonHandler]);
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore19BreakoutDetailsView_config;
  v6 = sub_10007B804((uint64_t *)&unk_10082FE40);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC8AppStore19BreakoutDetailsView_detailTextAlignment;
  v8 = type metadata accessor for BreakoutDetails.TextAlignment(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore19BreakoutDetailsView_detailBackgroundStyle, &qword_100830758);
}

@end
