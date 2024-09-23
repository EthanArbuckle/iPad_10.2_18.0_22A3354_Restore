@implementation MetadataRibbonBarView

- (_TtC22SubscribePageExtension21MetadataRibbonBarView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension21MetadataRibbonBarView *)sub_1003F9458(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension21MetadataRibbonBarView)initWithCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  __n128 v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  _TtC22SubscribePageExtension21MetadataRibbonBarView *result;

  v4 = OBJC_IVAR____TtC22SubscribePageExtension21MetadataRibbonBarView_metrics;
  v5 = qword_1007F2018;
  v6 = a3;
  if (v5 != -1)
    swift_once(&qword_1007F2018, sub_1003FA014);
  v8 = type metadata accessor for MetadataRibbonBarViewLayout.Metrics(0, v7);
  v9 = sub_1000117A8(v8, (uint64_t)static MetadataRibbonBarViewLayout.Metrics.standard);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))((char *)self + v4, v9, v8);
  v10 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension21MetadataRibbonBarView_id;
  *(_OWORD *)v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  *((_QWORD *)v10 + 4) = 0;
  v11 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension21MetadataRibbonBarView_itemType;
  v12 = type metadata accessor for MetadataRibbonItemType(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  v13 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension21MetadataRibbonBarView_labelMaxWidth;
  *(_QWORD *)v13 = 0;
  v13[8] = 1;

  result = (_TtC22SubscribePageExtension21MetadataRibbonBarView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/MetadataRibbonBarView.swift", 50, 2, 58, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension21MetadataRibbonBarView *v2;

  v2 = self;
  sub_1003F98D0();

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  double width;
  uint64_t v8;
  uint64_t v9;
  __n128 v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  _TtC22SubscribePageExtension21MetadataRibbonBarView *v18;
  id v19;
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
  double v30;
  _QWORD v32[5];
  JUMeasurements result;

  height = a3.height;
  width = a3.width;
  v8 = type metadata accessor for MetadataRibbonBarViewLayout.Metrics(0, (__n128)a3);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v32[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for MetadataRibbonBarViewLayout(0, v10);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v32[-1] - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *(Class *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC22SubscribePageExtension21MetadataRibbonBarView_dividerLabel);
  v32[3] = type metadata accessor for DynamicTypeLabel(0);
  v32[4] = &protocol witness table for UILabel;
  v32[0] = v17;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, (char *)self + OBJC_IVAR____TtC22SubscribePageExtension21MetadataRibbonBarView_metrics, v8);
  swift_unknownObjectRetain(a4);
  v18 = self;
  v19 = v17;
  MetadataRibbonBarViewLayout.init(descriptionLabelTextView:metrics:)(v32, v12);
  v20 = MetadataRibbonBarViewLayout.measurements(fitting:in:)(a4, width, height);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  swift_unknownObjectRelease(a4);

  v27 = v20;
  v28 = v22;
  v29 = v24;
  v30 = v26;
  result.var3 = v30;
  result.var2 = v29;
  result.var1 = v28;
  result.var0 = v27;
  return result;
}

- (_TtC11AppStoreKit16DynamicTypeLabel)accessibilityDescriptionLabel
{
  return (_TtC11AppStoreKit16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC22SubscribePageExtension21MetadataRibbonBarView_dividerLabel));
}

- (void).cxx_destruct
{
  char *v3;
  __n128 v4;
  uint64_t v5;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21MetadataRibbonBarView_dividerLabel));
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension21MetadataRibbonBarView_metrics;
  v5 = type metadata accessor for MetadataRibbonBarViewLayout.Metrics(0, v4);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v3, v5);
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension21MetadataRibbonBarView_id, (uint64_t *)&unk_1007F9850);
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension21MetadataRibbonBarView_itemType, &qword_1007F6CD0);
}

@end
