@implementation ViewSandboxCollectionViewCell

- (_TtC5Heart29ViewSandboxCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  _TtC5Heart29ViewSandboxCollectionViewCell *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC5Heart29ViewSandboxCollectionViewCell_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((_QWORD *)v7 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Heart29ViewSandboxCollectionViewCell_sandboxView) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ViewSandboxCollectionViewCell();
  v8 = -[ViewSandboxCollectionViewCell initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  sub_231410DD4();

  return v8;
}

- (_TtC5Heart29ViewSandboxCollectionViewCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC5Heart29ViewSandboxCollectionViewCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC5Heart29ViewSandboxCollectionViewCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Heart29ViewSandboxCollectionViewCell_sandboxView) = 0;
  v5 = a3;

  result = (_TtC5Heart29ViewSandboxCollectionViewCell *)sub_231414EE4();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2312D1D70((uint64_t)self + OBJC_IVAR____TtC5Heart29ViewSandboxCollectionViewCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Heart29ViewSandboxCollectionViewCell_sandboxView));
}

@end
