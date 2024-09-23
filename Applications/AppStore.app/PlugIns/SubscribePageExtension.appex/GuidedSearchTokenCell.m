@implementation GuidedSearchTokenCell

- (_TtC22SubscribePageExtension21GuidedSearchTokenCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension21GuidedSearchTokenCell *)sub_1005A03B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension21GuidedSearchTokenCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1005A17C8();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension21GuidedSearchTokenCell *v2;

  v2 = self;
  sub_1005A0AD4();

}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension21GuidedSearchTokenCell *v5;

  v4 = a3;
  v5 = self;
  sub_1005A0ECC(v4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21GuidedSearchTokenCell_pill));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21GuidedSearchTokenCell_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21GuidedSearchTokenCell_closeImage));
}

@end
