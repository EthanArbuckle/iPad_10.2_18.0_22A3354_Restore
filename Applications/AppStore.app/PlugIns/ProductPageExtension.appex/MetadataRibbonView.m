@implementation MetadataRibbonView

- (_TtC20ProductPageExtension18MetadataRibbonView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _TtC20ProductPageExtension18MetadataRibbonView *v9;
  _TtC20ProductPageExtension18MetadataRibbonView *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension18MetadataRibbonView_metadataRibbonItemViews) = (Class)_swiftEmptyArrayStorage;
  v9 = self;
  _s20ProductPageExtension18MetadataRibbonViewC7metrics19AppStoreKitInternal0deF6LayoutV7MetricsVvpfi_0();
  *(Class *)((char *)&v9->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension18MetadataRibbonView_metadataRibbonItemModels) = 0;
  *((_BYTE *)&v9->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension18MetadataRibbonView_isInsideSearchAd) = 0;

  v12.receiver = v9;
  v12.super_class = ObjectType;
  v10 = -[MetadataRibbonView initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
  -[MetadataRibbonView setLayoutMargins:](v10, "setLayoutMargins:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  return v10;
}

- (_TtC20ProductPageExtension18MetadataRibbonView)initWithCoder:(id)a3
{
  id v4;
  _TtC20ProductPageExtension18MetadataRibbonView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension18MetadataRibbonView_metadataRibbonItemViews) = (Class)_swiftEmptyArrayStorage;
  v4 = a3;
  _s20ProductPageExtension18MetadataRibbonViewC7metrics19AppStoreKitInternal0deF6LayoutV7MetricsVvpfi_0();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension18MetadataRibbonView_metadataRibbonItemModels) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension18MetadataRibbonView_isInsideSearchAd) = 0;

  result = (_TtC20ProductPageExtension18MetadataRibbonView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/MetadataRibbonView.swift", 45, 2, 29, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension18MetadataRibbonView *v2;

  v2 = self;
  MetadataRibbonView.layoutSubviews()();

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  double width;
  uint64_t v8;
  uint64_t v9;
  __n128 v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  _TtC20ProductPageExtension18MetadataRibbonView *v18;
  uint64_t v19;
  double *v20;
  char *v21;
  __n128 v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  _BYTE v34[32];
  JUMeasurements result;

  height = a3.height;
  width = a3.width;
  v8 = type metadata accessor for MetadataRibbonViewLayout.Metrics(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v12 = &v34[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = type metadata accessor for MetadataRibbonViewLayout(0, v10);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = &v34[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = *(uint64_t *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC20ProductPageExtension18MetadataRibbonView_metadataRibbonItemViews);
  swift_unknownObjectRetain(a4);
  v18 = self;
  swift_bridgeObjectRetain(v17);
  v20 = sub_10044D540(v19);
  swift_bridgeObjectRelease(v17);
  v21 = (char *)v18 + OBJC_IVAR____TtC20ProductPageExtension18MetadataRibbonView_metrics;
  v22 = swift_beginAccess((char *)v18 + OBJC_IVAR____TtC20ProductPageExtension18MetadataRibbonView_metrics, v34, 0, 0);
  (*(void (**)(_BYTE *, char *, uint64_t, __n128))(v9 + 16))(v12, v21, v8, v22);
  MetadataRibbonViewLayout.init(metadataRibbonItemLayoutContexts:metrics:)(v20, v12);
  v23 = MetadataRibbonViewLayout.measurements(fitting:in:)(a4, width, height);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  (*(void (**)(_BYTE *, uint64_t))(v14 + 8))(v16, v13);
  swift_unknownObjectRelease();

  v30 = v23;
  v31 = v25;
  v32 = v27;
  v33 = v29;
  result.var3 = v33;
  result.var2 = v32;
  result.var1 = v31;
  result.var0 = v30;
  return result;
}

- (BOOL)hasContent
{
  uint64_t *v3;
  uint64_t v4;
  _TtC20ProductPageExtension18MetadataRibbonView *v5;
  char v6;
  _BYTE v8[24];

  swift_getObjectType();
  v3 = (uint64_t *)((char *)self + OBJC_IVAR____TtC20ProductPageExtension18MetadataRibbonView_metadataRibbonItemModels);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC20ProductPageExtension18MetadataRibbonView_metadataRibbonItemModels, v8, 0, 0);
  v4 = *v3;
  swift_bridgeObjectRetain(v4);
  v5 = self;
  v6 = sub_1000C50E8(0, v4);

  swift_bridgeObjectRelease(v4);
  return v6 & 1;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension18MetadataRibbonView_metadataRibbonItemViews));
  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension18MetadataRibbonView_metrics;
  v4 = type metadata accessor for MetadataRibbonViewLayout.Metrics(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC20ProductPageExtension18MetadataRibbonView_metadataRibbonItemModels));
}

@end
