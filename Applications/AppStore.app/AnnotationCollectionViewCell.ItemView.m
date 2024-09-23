@implementation AnnotationCollectionViewCell.ItemView

- (_TtCC8AppStore28AnnotationCollectionViewCell8ItemView)initWithFrame:(CGRect)a3
{
  return (_TtCC8AppStore28AnnotationCollectionViewCell8ItemView *)sub_100175CA4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC8AppStore28AnnotationCollectionViewCell8ItemView)initWithCoder:(id)a3
{
  id v4;
  _TtCC8AppStore28AnnotationCollectionViewCell8ItemView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC8AppStore28AnnotationCollectionViewCell8ItemView_leadingPairLabels) = (Class)&_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC8AppStore28AnnotationCollectionViewCell8ItemView_trailingPairLabels) = (Class)&_swiftEmptyArrayStorage;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtCC8AppStore28AnnotationCollectionViewCell8ItemView_isLastItem) = 0;
  v4 = a3;

  result = (_TtCC8AppStore28AnnotationCollectionViewCell8ItemView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/AnnotationCollectionViewCell+ItemView.swift", 52, 2, 91, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  __n128 v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _TtCC8AppStore28AnnotationCollectionViewCell8ItemView *v13;
  __n128 v14;
  objc_super v15;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = type metadata accessor for LayoutRect(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for ProductAnnotationLayout.ItemLayout(0, v6);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15.receiver = self;
  v15.super_class = ObjectType;
  v13 = self;
  -[AnnotationCollectionViewCell.ItemView layoutSubviews](&v15, "layoutSubviews");
  sub_10017603C();
  v14 = LayoutMarginsAware<>.layoutFrame.getter(ObjectType);
  ProductAnnotationLayout.ItemLayout.placeChildren(relativeTo:in:)(v13, v14);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  double width;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _TtCC8AppStore28AnnotationCollectionViewCell8ItemView *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  JUMeasurements result;

  height = a3.height;
  width = a3.width;
  v8 = type metadata accessor for ProductAnnotationLayout.ItemLayout(0, (__n128)a3);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectRetain(a4);
  v12 = self;
  sub_10017603C();
  v13 = ProductAnnotationLayout.ItemLayout.measurements(fitting:in:)(a4, width, height);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  swift_unknownObjectRelease(a4);

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.var3 = v23;
  result.var2 = v22;
  result.var1 = v21;
  result.var0 = v20;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC8AppStore28AnnotationCollectionViewCell8ItemView_headingArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC8AppStore28AnnotationCollectionViewCell8ItemView_headingTextLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC8AppStore28AnnotationCollectionViewCell8ItemView_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC8AppStore28AnnotationCollectionViewCell8ItemView_listTextLabel));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtCC8AppStore28AnnotationCollectionViewCell8ItemView_leadingPairLabels));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtCC8AppStore28AnnotationCollectionViewCell8ItemView_trailingPairLabels));
}

@end
