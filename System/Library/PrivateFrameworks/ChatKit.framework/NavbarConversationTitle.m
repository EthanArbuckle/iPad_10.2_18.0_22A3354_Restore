@implementation NavbarConversationTitle

- (void)didMoveToWindow
{
  _TtC7ChatKit23NavbarConversationTitle *v2;

  v2 = self;
  sub_18E584AAC(type metadata accessor for NavbarConversationTitle);

}

- (_TtC7ChatKit23NavbarConversationTitle)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_18E5856D0();
}

- (void)layoutSubviews
{
  _TtC7ChatKit23NavbarConversationTitle *v2;

  v2 = self;
  sub_18E584BF0();

}

- (CGSize)intrinsicContentSize
{
  _TtC7ChatKit23NavbarConversationTitle *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = sub_18E584E70();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)preferredContentSizeCategoryDidChangeWithView:(id)a3 previousTraitCollection:(id)a4
{
  id v6;
  id v7;
  _TtC7ChatKit23NavbarConversationTitle *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_18E585778();

}

- (_TtC7ChatKit23NavbarConversationTitle)initWithFrame:(CGRect)a3
{
  sub_18E584F74();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit23NavbarConversationTitle_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit23NavbarConversationTitle_chevronImageView));
}

@end
