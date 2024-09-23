@implementation SwiftUIAnnotationView

- (void)didMoveToSuperview
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SwiftUIAnnotationView();
  v2 = v3.receiver;
  -[MKAnnotationView didMoveToSuperview](&v3, sel_didMoveToSuperview);
  sub_21C5DF1FC();

}

- (_TtC15_MapKit_SwiftUI21SwiftUIAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a4)
  {
    v4 = sub_21C5E3964();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = swift_unknownObjectRetain();
  return (_TtC15_MapKit_SwiftUI21SwiftUIAnnotationView *)sub_21C5DF38C(v7, v4, v6);
}

- (_TtC15_MapKit_SwiftUI21SwiftUIAnnotationView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC15_MapKit_SwiftUI21SwiftUIAnnotationView *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15_MapKit_SwiftUI21SwiftUIAnnotationView_wrappedView) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC15_MapKit_SwiftUI21SwiftUIAnnotationView_contentAnchorPoint);
  v5 = a3;
  v6 = self;
  sub_21C5E3880();
  *v4 = v7;
  v4[1] = v8;
  v9 = (Class *)((char *)&v6->super.super.super.super.isa
               + OBJC_IVAR____TtC15_MapKit_SwiftUI21SwiftUIAnnotationView_accessoryAnchorPoint);
  sub_21C5E3880();
  v11 = v10;
  v13 = v12;

  *v9 = v11;
  v9[1] = v13;

  swift_release();
  type metadata accessor for SwiftUIAnnotationView();
  swift_deallocPartialClassInstance();
  return 0;
}

- (void)prepareForReuse
{
  _TtC15_MapKit_SwiftUI21SwiftUIAnnotationView *v2;
  objc_super v3;

  v2 = self;
  sub_21C5DF6CC(0);
  -[MKAnnotationView setCenterOffset:](v2, sel_setCenterOffset_, 0.0, 0.0);
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for SwiftUIAnnotationView();
  -[MKAnnotationView prepareForReuse](&v3, sel_prepareForReuse);

}

+ (BOOL)_wantsViewBasedPositioning
{
  return 1;
}

- (UIEdgeInsets)safeAreaInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15_MapKit_SwiftUI21SwiftUIAnnotationView_hostView));
}

@end
