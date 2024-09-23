@implementation DRPDropletContextView

- (BOOL)disableDropletEffectFilters
{
  DRPDropletContextView *v2;
  char *v3;
  char v4;

  v2 = self;
  v3 = (char *)sub_23A83E688();
  v4 = *(_BYTE *)(*(_QWORD *)&v3[OBJC_IVAR____TtC9DropletUI16DropletShapeView_dropletGroupView]
                + OBJC_IVAR____TtC9DropletUI16DropletGroupView_disableDropletEffectFilters);

  return v4;
}

- (void)setDisableDropletEffectFilters:(BOOL)a3
{
  int v3;
  DRPDropletContextView *v4;
  uint64_t v5;
  int v6;
  char *v7;

  v3 = a3;
  v4 = self;
  v7 = (char *)sub_23A83E688();
  v5 = *(_QWORD *)&v7[OBJC_IVAR____TtC9DropletUI16DropletShapeView_dropletGroupView];
  v6 = *(unsigned __int8 *)(v5 + OBJC_IVAR____TtC9DropletUI16DropletGroupView_disableDropletEffectFilters);
  *(_BYTE *)(v5 + OBJC_IVAR____TtC9DropletUI16DropletGroupView_disableDropletEffectFilters) = v3;
  if (v6 != v3)
    sub_23A82D22C();

}

- (unint64_t)boundaryEdges
{
  DRPDropletContextView *v2;
  unint64_t v3;

  v2 = self;
  v3 = DRPDropletContextView.boundaryEdges.getter();

  return v3;
}

- (void)setBoundaryEdges:(unint64_t)a3
{
  DRPDropletContextView *v4;

  v4 = self;
  DRPDropletContextView.boundaryEdges.setter(a3);

}

- (double)dropletRadius
{
  DRPDropletContextView *v2;
  char *v3;
  double v4;

  v2 = self;
  v3 = (char *)sub_23A83E688();
  v4 = *(double *)(*(_QWORD *)&v3[OBJC_IVAR____TtC9DropletUI16DropletShapeView_dropletGroupView]
                 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_dropletParticipantRadiusOfInfluence);

  return v4;
}

- (void)setDropletRadius:(double)a3
{
  DRPDropletContextView *v4;

  v4 = self;
  DRPDropletContextView.dropletRadius.setter(a3);

}

- (UIColor)dropletColor
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___DRPDropletContextView_dropletColor);
  swift_beginAccess();
  return (UIColor *)*v2;
}

- (void)setDropletColor:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  DRPDropletContextView *v8;

  v5 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___DRPDropletContextView_dropletColor);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;
  sub_23A83F1AC(v6);

}

- (DRPDropletContextKeylineStyle)keylineStyle
{
  swift_beginAccess();
  return (DRPDropletContextKeylineStyle *)(id)swift_unknownObjectRetain();
}

- (void)setKeylineStyle:(id)a3
{
  id *v5;
  DRPDropletContextView *v6;

  v5 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___DRPDropletContextView_keylineStyle);
  swift_beginAccess();
  *v5 = a3;
  swift_unknownObjectRetain_n();
  v6 = self;
  swift_unknownObjectRelease();
  -[DRPDropletContextView applyKeylineStyle:forContainerView:](v6, sel_applyKeylineStyle_forContainerView_, *v5, 0);

  swift_unknownObjectRelease();
}

- (void)applyKeylineStyle:(id)a3 forContainerView:(id)a4
{
  id v7;
  DRPDropletContextView *v8;

  swift_unknownObjectRetain();
  v7 = a4;
  v8 = self;
  DRPDropletContextView.applyKeylineStyle(_:for:)((char *)a3, a4);
  swift_unknownObjectRelease();

}

- (id)addContainerWithContentView:(id)a3
{
  id v5;
  DRPDropletContextView *v6;
  DRPDropletContainerView *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = self;
  DRPDropletContextView.addContainer(contentView:)(v7, (UIView_optional *)a3);
  v9 = v8;

  return v9;
}

- (void)removeContainer:(id)a3
{
  DRPDropletContainerView *v4;
  DRPDropletContextView *v5;

  v4 = (DRPDropletContainerView *)a3;
  v5 = self;
  DRPDropletContextView.removeContainer(_:)(v4);

}

- (id)acquireGeometricChangeAssertionForReason:(id)a3
{
  DRPDropletContextView *v4;
  id result;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  sub_23A84C21C();
  v4 = self;
  result = sub_23A83E688();
  v6 = *(void **)((char *)result + OBJC_IVAR____TtC9DropletUI16DropletShapeView_geometryChangingAssertions);
  if (v6)
  {
    v7 = result;
    v8 = v6;
    v9 = (void *)sub_23A84C210();
    v10 = objc_msgSend(v8, sel_acquireForReason_, v9);

    swift_bridgeObjectRelease();
    return v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)invalidate
{
  DRPDropletContextView *v2;
  char *v3;
  id v4;

  v2 = self;
  v3 = (char *)sub_23A83E688();
  v4 = *(id *)&v3[OBJC_IVAR____TtC9DropletUI16DropletShapeView_geometryChangingAssertions];

  objc_msgSend(v4, sel_invalidate);
}

- (DRPDropletContextView)initWithFrame:(CGRect)a3
{
  return (DRPDropletContextView *)DRPDropletContextView.init(frame:)();
}

- (DRPDropletContextView)initWithCoder:(id)a3
{
  id v4;
  DRPDropletContextView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___DRPDropletContextView_dropletColor) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___DRPDropletContextView_keylineStyle) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___DRPDropletContextView____lazy_storage___containerViewsParentView) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___DRPDropletContextView____lazy_storage___dropletShapeView) = 0;
  v4 = a3;

  result = (DRPDropletContextView *)sub_23A84C39C();
  __break(1u);
  return result;
}

- (void)dealloc
{
  DRPDropletContextView *v2;

  v2 = self;
  sub_23A841EB4();
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___DRPDropletContextView____lazy_storage___containerViewsParentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___DRPDropletContextView____lazy_storage___dropletShapeView));
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v8;
  DRPDropletContextView *v9;
  UIView_optional *v10;
  void *v11;
  void *v12;
  UIEvent_optional v14;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v14.value.super.isa = (Class)a4;
  DRPDropletContextView.hitTest(_:with:)(v10, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v14);
  v12 = v11;

  return v12;
}

- (void)layoutSubviews
{
  DRPDropletContextView *v2;

  v2 = self;
  DRPDropletContextView.layoutSubviews()();

}

@end
