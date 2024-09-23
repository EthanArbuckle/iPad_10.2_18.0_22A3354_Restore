@implementation DeveloperLinkView

- (_TtC8AppStore17DeveloperLinkView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore17DeveloperLinkView *)sub_1001C29C4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore17DeveloperLinkView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC8AppStore17DeveloperLinkView *result;

  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore17DeveloperLinkView_tapHandler);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC8AppStore17DeveloperLinkView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/DeveloperLinkView.swift", 32, 2, 109, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore17DeveloperLinkView *v2;

  v2 = self;
  sub_1001C2FC8();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[DeveloperLinkView measurementsWithFitting:in:](self, "measurementsWithFitting:in:", self, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  CGFloat width;
  _TtC8AppStore17DeveloperLinkView *v8;
  __n128 v9;
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
  double v20;
  JUMeasurements result;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  v9.n128_f64[0] = width;
  v10 = sub_1001C32A4((uint64_t)a4, v9, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  swift_unknownObjectRelease(a4);

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.var3 = v20;
  result.var2 = v19;
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

- (void)didTapLink:(id)a3
{
  void (*v3)(uint64_t);
  uint64_t v5;
  id v6;
  uint64_t v7;
  _TtC8AppStore17DeveloperLinkView *v8;

  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore17DeveloperLinkView_tapHandler);
  if (v3)
  {
    v5 = *(_QWORD *)&self->disclosureImageView[OBJC_IVAR____TtC8AppStore17DeveloperLinkView_tapHandler];
    v6 = a3;
    v8 = self;
    v7 = sub_10003A340((uint64_t)v3, v5);
    v3(v7);
    sub_10003A350((uint64_t)v3, v5);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8AppStore17DeveloperLinkView *v6;

  v5 = a3;
  v6 = self;
  sub_1001C3B18(a3);

}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore17DeveloperLinkView_primaryLabel));
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore17DeveloperLinkView_secondaryLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore17DeveloperLinkView_disclosureImageView));

  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore17DeveloperLinkView_tapHandler), *(_QWORD *)&self->disclosureImageView[OBJC_IVAR____TtC8AppStore17DeveloperLinkView_tapHandler]);
}

@end
