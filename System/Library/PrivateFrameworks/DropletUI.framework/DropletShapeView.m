@implementation DropletShapeView

- (_TtC9DropletUI16DropletShapeView)initWithFrame:(CGRect)a3
{
  return (_TtC9DropletUI16DropletShapeView *)sub_23A83D188(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9DropletUI16DropletShapeView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_23A83D83C();
}

- (void)dealloc
{
  void *v2;
  _TtC9DropletUI16DropletShapeView *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9DropletUI16DropletShapeView_geometryChangingAssertions);
  if (v2)
  {
    v3 = self;
    objc_msgSend(v2, sel_invalidate);
    v4.receiver = v3;
    v4.super_class = (Class)type metadata accessor for DropletShapeView();
    -[DropletShapeView dealloc](&v4, sel_dealloc);
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  char *v3;

  v3 = (char *)self + OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference;
  sub_23A82E714(*(void **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineTypePreference), *((_QWORD *)v3 + 1), *((_QWORD *)v3 + 2), *((_QWORD *)v3 + 3), *((_QWORD *)v3 + 4), *((_QWORD *)v3 + 5), *((_QWORD *)v3 + 6), *((_QWORD *)v3 + 7), *((_QWORD *)v3 + 8), *((_QWORD *)v3 + 9), v3[80]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9DropletUI16DropletShapeView_keylineFillParentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9DropletUI16DropletShapeView_dropletGroupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9DropletUI16DropletShapeView_geometryChangingAssertions));
}

- (void)layoutSubviews
{
  _TtC9DropletUI16DropletShapeView *v2;

  v2 = self;
  sub_23A83D728();

}

@end
