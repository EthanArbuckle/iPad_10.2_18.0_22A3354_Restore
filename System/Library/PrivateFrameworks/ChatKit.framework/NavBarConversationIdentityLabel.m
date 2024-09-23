@implementation NavBarConversationIdentityLabel

- (_TtC7ChatKit31NavBarConversationIdentityLabel)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_18E5855BC();
}

- (void)didMoveToWindow
{
  _TtC7ChatKit31NavBarConversationIdentityLabel *v2;

  v2 = self;
  sub_18E584AAC(type metadata accessor for NavBarConversationIdentityLabel);

}

- (void)preferredContentSizeCategoryDidChangeWithView:(id)a3 previousTraitCollection:(id)a4
{
  id v7;
  _TtC7ChatKit31NavBarConversationIdentityLabel *v8;
  id v9;

  sub_18E00F31C(0, (unint64_t *)&qword_1EE0FB950);
  v9 = a3;
  v7 = a4;
  v8 = self;
  if ((sub_18E768F54() & 1) != 0)
  {
    sub_18E5840B8();
    -[NavBarConversationIdentityLabel setNeedsLayout](v8, sel_setNeedsLayout);
    -[NavBarConversationIdentityLabel invalidateIntrinsicContentSize](v8, sel_invalidateIntrinsicContentSize);
    -[NavBarConversationIdentityLabel layoutIfNeeded](v8, sel_layoutIfNeeded);
  }

}

- (void)layoutSubviews
{
  _TtC7ChatKit31NavBarConversationIdentityLabel *v2;

  v2 = self;
  sub_18E583D9C();

}

- (CGSize)intrinsicContentSize
{
  _TtC7ChatKit31NavBarConversationIdentityLabel *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = sub_18E584044();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC7ChatKit31NavBarConversationIdentityLabel)initWithFrame:(CGRect)a3
{
  sub_18E584F74();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit31NavBarConversationIdentityLabel_titleView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit31NavBarConversationIdentityLabel_subtitleLabel));
  swift_bridgeObjectRelease();
}

@end
