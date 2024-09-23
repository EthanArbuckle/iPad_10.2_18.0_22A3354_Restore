@implementation SFFluidCollectionReusableView

- (_TtC12MobileSafari29SFFluidCollectionReusableView)initWithFrame:(CGRect)a3
{
  return (_TtC12MobileSafari29SFFluidCollectionReusableView *)SFFluidCollectionReusableView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12MobileSafari29SFFluidCollectionReusableView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC12MobileSafari29SFFluidCollectionReusableView *result;

  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12MobileSafari29SFFluidCollectionReusableView_reuseIdentifier);
  *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12MobileSafari29SFFluidCollectionReusableView_representedElement) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC12MobileSafari29SFFluidCollectionReusableView_isSelected) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC12MobileSafari29SFFluidCollectionReusableView_isHighlighted) = 0;
  v5 = a3;

  result = (_TtC12MobileSafari29SFFluidCollectionReusableView *)sub_18BAC18C4();
  __break(1u);
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  char *v8;
  unsigned __int8 v9;
  void *v10;
  objc_super v12;

  y = a3.y;
  x = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for SFFluidCollectionReusableView();
  v7 = a4;
  v8 = (char *)v12.receiver;
  if (-[SFFluidCollectionReusableView pointInside:withEvent:](&v12, sel_pointInside_withEvent_, v7, x, y))
  {
    v9 = 1;
  }
  else
  {
    v10 = *(void **)&v8[OBJC_IVAR____TtC12MobileSafari29SFFluidCollectionReusableView_contentView];
    objc_msgSend(v8, sel_convertPoint_toCoordinateSpace_, v10, x, y, v12.receiver, v12.super_class);
    v9 = objc_msgSend(v10, sel_pointInside_withEvent_, v7);
  }

  return v9;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari29SFFluidCollectionReusableView_contentView));
}

@end
