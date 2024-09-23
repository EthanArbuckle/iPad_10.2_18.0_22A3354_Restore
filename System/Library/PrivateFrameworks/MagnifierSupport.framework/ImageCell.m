@implementation ImageCell

- (_TtC16MagnifierSupport9ImageCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MagnifierSupport9ImageCell *)sub_22742AA50(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MagnifierSupport9ImageCell)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC16MagnifierSupport9ImageCell *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport9ImageCell_filter) = 12;
  v5 = OBJC_IVAR____TtC16MagnifierSupport9ImageCell_imageView;
  v6 = objc_allocWithZone(MEMORY[0x24BEBD668]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC16MagnifierSupport9ImageCell *)sub_22758ECC4();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
