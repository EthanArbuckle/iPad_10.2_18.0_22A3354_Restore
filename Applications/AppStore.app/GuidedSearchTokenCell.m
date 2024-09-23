@implementation GuidedSearchTokenCell

- (_TtC8AppStore21GuidedSearchTokenCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore21GuidedSearchTokenCell *)sub_1000D9D08(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore21GuidedSearchTokenCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000DB118();
}

- (void)layoutSubviews
{
  _TtC8AppStore21GuidedSearchTokenCell *v2;

  v2 = self;
  sub_1000DA428();

}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  _TtC8AppStore21GuidedSearchTokenCell *v5;

  v4 = a3;
  v5 = self;
  sub_1000DA820(v4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21GuidedSearchTokenCell_pill));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21GuidedSearchTokenCell_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21GuidedSearchTokenCell_closeImage));
}

@end
