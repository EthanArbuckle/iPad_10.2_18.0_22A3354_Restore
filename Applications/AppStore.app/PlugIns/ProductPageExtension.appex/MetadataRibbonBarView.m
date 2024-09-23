@implementation MetadataRibbonBarView

- (_TtC20ProductPageExtension21MetadataRibbonBarView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension21MetadataRibbonBarView *)sub_10014ACA4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension21MetadataRibbonBarView)initWithCoder:(id)a3
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
  _TtC20ProductPageExtension21MetadataRibbonBarView *result;

  v4 = OBJC_IVAR____TtC20ProductPageExtension21MetadataRibbonBarView_metrics;
  v5 = qword_100804B70;
  v6 = a3;
  if (v5 != -1)
    swift_once(&qword_100804B70, sub_10014B860);
  v7 = type metadata accessor for MetadataRibbonBarViewLayout.Metrics(0);
  v8 = sub_10000EFC4(v7, (uint64_t)static MetadataRibbonBarViewLayout.Metrics.standard);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))((char *)self + v4, v8, v7);
  v9 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension21MetadataRibbonBarView_id;
  *(_OWORD *)v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  *((_QWORD *)v9 + 4) = 0;
  v10 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension21MetadataRibbonBarView_itemType;
  v11 = type metadata accessor for MetadataRibbonItemType(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v12 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension21MetadataRibbonBarView_labelMaxWidth;
  *(_QWORD *)v12 = 0;
  v12[8] = 1;

  result = (_TtC20ProductPageExtension21MetadataRibbonBarView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/MetadataRibbonBarView.swift", 48, 2, 58, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  uint64_t v2;
  _TtC20ProductPageExtension21MetadataRibbonBarView *v3;

  v3 = self;
  sub_10014B11C((uint64_t)v3, v2);

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
  _TtC20ProductPageExtension21MetadataRibbonBarView *v17;
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
  v8 = type metadata accessor for MetadataRibbonBarViewLayout.Metrics(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v31[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for MetadataRibbonBarViewLayout(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v31[-1] - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(Class *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC20ProductPageExtension21MetadataRibbonBarView_dividerLabel);
  v31[3] = type metadata accessor for DynamicTypeLabel(0);
  v31[4] = &protocol witness table for UILabel;
  v31[0] = v16;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v11, (char *)self + OBJC_IVAR____TtC20ProductPageExtension21MetadataRibbonBarView_metrics, v8);
  swift_unknownObjectRetain(a4);
  v17 = self;
  v18 = v16;
  MetadataRibbonBarViewLayout.init(descriptionLabelTextView:metrics:)(v31, v11);
  v19 = MetadataRibbonBarViewLayout.measurements(fitting:in:)(a4, width, height);
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
                                                                                        + OBJC_IVAR____TtC20ProductPageExtension21MetadataRibbonBarView_dividerLabel));
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21MetadataRibbonBarView_dividerLabel));
  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension21MetadataRibbonBarView_metrics;
  v4 = type metadata accessor for MetadataRibbonBarViewLayout.Metrics(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension21MetadataRibbonBarView_id, &qword_100809010);
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension21MetadataRibbonBarView_itemType, &qword_100809018);
}

@end
