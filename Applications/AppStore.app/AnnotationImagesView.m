@implementation AnnotationImagesView

- (_TtC8AppStore20AnnotationImagesView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _TtC8AppStore20AnnotationImagesView *v13;
  unint64_t v14;
  _TtC8AppStore20AnnotationImagesView *v15;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = sub_10007B804(&qword_100846EB0);
  __chkstk_darwin(v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore20AnnotationImagesView_imageViews) = (Class)_swiftEmptyArrayStorage;
  v12 = type metadata accessor for AnnotationImagesView.AnnotationImageView();
  v13 = self;
  ViewRecycler.init()(v12);
  v14 = sub_10046C748();
  ReusePool.init(recycler:limit:)(v11, 10, v9, v14);

  v17.receiver = v13;
  v17.super_class = ObjectType;
  v15 = -[AnnotationImagesView initWithFrame:](&v17, "initWithFrame:", x, y, width, height);
  -[AnnotationImagesView setLayoutMargins:](v15, "setLayoutMargins:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  return v15;
}

- (_TtC8AppStore20AnnotationImagesView)initWithCoder:(id)a3
{
  return (_TtC8AppStore20AnnotationImagesView *)sub_10046BDEC(a3);
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  double width;
  uint64_t *v8;
  uint64_t v9;
  _TtC8AppStore20AnnotationImagesView *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  char v26[24];
  JUMeasurements result;

  height = a3.height;
  width = a3.width;
  v8 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8AppStore20AnnotationImagesView_imageViews);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8AppStore20AnnotationImagesView_imageViews, v26, 0, 0);
  v9 = *v8;
  swift_unknownObjectRetain(a4);
  v10 = self;
  swift_bridgeObjectRetain(v9);
  v12 = sub_100276894(v11);
  swift_bridgeObjectRelease(v9);
  if (qword_100828A20 != -1)
    swift_once(&qword_100828A20, sub_10046BC50);
  v13 = type metadata accessor for AnnotationImagesLayout.Metrics(0);
  v14 = sub_10007AF70(v13, (uint64_t)qword_10088F580);
  v15 = static AnnotationImagesLayout.measurements(for:fitting:metrics:in:)(v12, v14, a4, width, height);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  swift_unknownObjectRelease(a4);

  swift_bridgeObjectRelease(v12);
  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.var3 = v25;
  result.var2 = v24;
  result.var1 = v23;
  result.var0 = v22;
  return result;
}

- (BOOL)hasContent
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  _TtC8AppStore20AnnotationImagesView *v6;
  uint64_t v7;
  _BYTE v9[24];

  v3 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8AppStore20AnnotationImagesView_imageViews);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8AppStore20AnnotationImagesView_imageViews, v9, 0, 0);
  v4 = *v3;
  v5 = type metadata accessor for AnnotationImagesView.AnnotationImageView();
  v6 = self;
  swift_bridgeObjectRetain(v4);
  LOBYTE(v5) = Array.isNotEmpty.getter(v7, v5);

  swift_bridgeObjectRelease(v4);
  return v5 & 1;
}

- (void)layoutSubviews
{
  _TtC8AppStore20AnnotationImagesView *v2;

  v2 = self;
  sub_10046C384();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC8AppStore20AnnotationImagesView_imageViews));
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore20AnnotationImagesView_imageViewReusePool;
  v4 = sub_10007B804(&qword_100846EE8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
