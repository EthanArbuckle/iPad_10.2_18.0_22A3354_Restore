@implementation FloatingCollectionView

- (void)layoutSubviews
{
  char *v2;
  void (*v3)(char *);
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FloatingCollectionView();
  v2 = (char *)v4.receiver;
  -[FloatingCollectionView layoutSubviews](&v4, sel_layoutSubviews);
  v3 = *(void (**)(char *))&v2[OBJC_IVAR____TtC13FitnessCoreUI22FloatingCollectionView_onLayoutUpdate];
  if (v3)
  {
    swift_retain();
    v3(v2);
    sub_23C038E58((uint64_t)v3);
  }

}

- (_TtC13FitnessCoreUI22FloatingCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v10;
  objc_class *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = (Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC13FitnessCoreUI22FloatingCollectionView_onLayoutUpdate);
  v11 = (objc_class *)type metadata accessor for FloatingCollectionView();
  *v10 = 0;
  v10[1] = 0;
  v13.receiver = self;
  v13.super_class = v11;
  return -[FloatingCollectionView initWithFrame:collectionViewLayout:](&v13, sel_initWithFrame_collectionViewLayout_, a4, x, y, width, height);
}

- (_TtC13FitnessCoreUI22FloatingCollectionView)initWithCoder:(id)a3
{
  _QWORD *v5;
  objc_class *v6;
  objc_super v8;

  v5 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC13FitnessCoreUI22FloatingCollectionView_onLayoutUpdate);
  v6 = (objc_class *)type metadata accessor for FloatingCollectionView();
  *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[FloatingCollectionView initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_23C038E58(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC13FitnessCoreUI22FloatingCollectionView_onLayoutUpdate));
}

@end
