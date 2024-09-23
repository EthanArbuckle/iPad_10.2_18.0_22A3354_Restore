@implementation MetadataRibbonTagView

- (_TtC8AppStore21MetadataRibbonTagView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore21MetadataRibbonTagView *)sub_1001E734C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore21MetadataRibbonTagView)initWithCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  _TtC8AppStore21MetadataRibbonTagView *result;

  v4 = OBJC_IVAR____TtC8AppStore21MetadataRibbonTagView_metrics;
  v5 = qword_100827240;
  v6 = a3;
  if (v5 != -1)
    swift_once(&qword_100827240, sub_1001E7EF0);
  v7 = type metadata accessor for MetadataRibbonTagViewLayout.Metrics(0);
  v8 = sub_10007AF70(v7, (uint64_t)static MetadataRibbonTagViewLayout.Metrics.standard);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))((char *)self + v4, v8, v7);
  v9 = (char *)self + OBJC_IVAR____TtC8AppStore21MetadataRibbonTagView_id;
  *(_OWORD *)v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  *((_QWORD *)v9 + 4) = 0;
  v10 = (char *)self + OBJC_IVAR____TtC8AppStore21MetadataRibbonTagView_itemType;
  v11 = type metadata accessor for MetadataRibbonItemType(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v12 = (char *)self + OBJC_IVAR____TtC8AppStore21MetadataRibbonTagView_labelMaxWidth;
  *(_QWORD *)v12 = 0;
  v12[8] = 1;

  result = (_TtC8AppStore21MetadataRibbonTagView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/MetadataRibbonTagView.swift", 36, 2, 57, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  uint64_t v2;
  _TtC8AppStore21MetadataRibbonTagView *v3;

  v3 = self;
  sub_1001E77AC((uint64_t)v3, v2);

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  double width;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  _TtC8AppStore21MetadataRibbonTagView *v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  _QWORD v31[5];
  JUMeasurements result;

  height = a3.height;
  width = a3.width;
  v8 = type metadata accessor for MetadataRibbonTagViewLayout.Metrics(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v31[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for MetadataRibbonTagViewLayout(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v31[-1] - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore21MetadataRibbonTagView_tagLabel);
  v31[3] = type metadata accessor for DynamicTypeLabel(0);
  v31[4] = &protocol witness table for UILabel;
  v31[0] = v16;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v11, (char *)self + OBJC_IVAR____TtC8AppStore21MetadataRibbonTagView_metrics, v8);
  swift_unknownObjectRetain(a4);
  v17 = self;
  v18 = v16;
  MetadataRibbonTagViewLayout.init(descriptionLabelTextView:metrics:)(v31, v11);
  v19 = MetadataRibbonTagViewLayout.measurements(fitting:in:)(a4, width, height);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  swift_unknownObjectRelease(a4);

  v26 = v19;
  v27 = v21;
  v28 = v23;
  v29 = v25;
  result.var3 = v29;
  result.var2 = v28;
  result.var1 = v27;
  result.var0 = v26;
  return result;
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityDescriptionLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore21MetadataRibbonTagView_tagLabel));
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8AppStore21MetadataRibbonTagView_metrics;
  v4 = type metadata accessor for MetadataRibbonTagViewLayout.Metrics(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore21MetadataRibbonTagView_id, &qword_100829F10);
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore21MetadataRibbonTagView_itemType, &qword_100829F18);
}

@end
