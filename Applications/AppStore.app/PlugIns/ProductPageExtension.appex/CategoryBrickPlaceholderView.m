@implementation CategoryBrickPlaceholderView

- (_TtC20ProductPageExtension28CategoryBrickPlaceholderView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  uint64_t v9;
  _TtC20ProductPageExtension28CategoryBrickPlaceholderView *v10;
  id v11;
  _TtC20ProductPageExtension28CategoryBrickPlaceholderView *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = OBJC_IVAR____TtC20ProductPageExtension28CategoryBrickPlaceholderView_artworkPlaceholder;
  type metadata accessor for ArtworkView(0);
  v10 = self;
  v11 = (id)static ArtworkView.brickArtworkView.getter();
  dispatch thunk of RoundedCornerView.borderWidth.setter(v11);

  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)v11;
  v14.receiver = v10;
  v14.super_class = ObjectType;
  v12 = -[CategoryBrickPlaceholderView initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
  -[CategoryBrickPlaceholderView addSubview:](v12, "addSubview:", *(Class *)((char *)&v12->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension28CategoryBrickPlaceholderView_artworkPlaceholder));
  return v12;
}

- (_TtC20ProductPageExtension28CategoryBrickPlaceholderView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  _TtC20ProductPageExtension28CategoryBrickPlaceholderView *result;

  v5 = OBJC_IVAR____TtC20ProductPageExtension28CategoryBrickPlaceholderView_artworkPlaceholder;
  type metadata accessor for ArtworkView(0);
  v6 = (id)static ArtworkView.brickArtworkView.getter(a3);
  dispatch thunk of RoundedCornerView.borderWidth.setter(v6);

  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)v6;
  result = (_TtC20ProductPageExtension28CategoryBrickPlaceholderView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/CategoryBrickPlaceholderView.swift", 55, 2, 22, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension28CategoryBrickPlaceholderView *v2;

  v2 = self;
  sub_1004D1CC8();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28CategoryBrickPlaceholderView_artworkPlaceholder));
}

@end
