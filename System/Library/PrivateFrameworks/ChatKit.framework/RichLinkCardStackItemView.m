@implementation RichLinkCardStackItemView

- (CGRect)clippingRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *(double *)((char *)&self->super.super.super.super.super.super.super.isa
                 + OBJC_IVAR____TtC7ChatKit25RichLinkCardStackItemView_clippingRect);
  v3 = *(double *)((char *)&self->super.super.super.super.super.super._responderFlags
                 + OBJC_IVAR____TtC7ChatKit25RichLinkCardStackItemView_clippingRect);
  v4 = *(double *)((char *)&self->super.super.super.super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC7ChatKit25RichLinkCardStackItemView_clippingRect);
  v5 = *(double *)((char *)&self->super.super.super.super.super._constraintsExceptingSubviewAutoresizingConstraints
                 + OBJC_IVAR____TtC7ChatKit25RichLinkCardStackItemView_clippingRect);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  *(CGRect *)((char *)&self->super.super.super.super.super.super.super.isa
            + OBJC_IVAR____TtC7ChatKit25RichLinkCardStackItemView_clippingRect) = a3;
}

- (_TtC7ChatKit25RichLinkCardStackItemView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_18E57E580();
}

- (_TtC7ChatKit25RichLinkCardStackItemView)initWithFrame:(CGRect)a3
{
  return (_TtC7ChatKit25RichLinkCardStackItemView *)sub_18E57C960(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NSCopying)userData
{
  return (NSCopying *)(id)swift_unknownObjectRetain();
}

- (void)setUserData:(id)a3
{
  _TtC7ChatKit25RichLinkCardStackItemView *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_18E57F370((uint64_t)a3);

  swift_unknownObjectRelease();
}

- (void)becomeReusable
{
  void *v2;
  void *v3;
  _TtC7ChatKit25RichLinkCardStackItemView *v4;

  v2 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit25RichLinkCardStackItemView_linkView);
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit25RichLinkCardStackItemView_linkView) = 0;
  v4 = self;

  v3 = *(Class *)((char *)&v4->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit25RichLinkCardStackItemView_chipListMenuView);
  *(Class *)((char *)&v4->super.super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit25RichLinkCardStackItemView_chipListMenuView) = 0;

  *((_BYTE *)&v4->super.super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC7ChatKit25RichLinkCardStackItemView_isStandaloneBalloon) = 0;

}

- (void)configureForMessagePart:(id)a3
{
  id v5;
  _TtC7ChatKit25RichLinkCardStackItemView *v6;

  v5 = a3;
  v6 = self;
  sub_18E57DB88(a3);

}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height;
  double width;
  _TtC7ChatKit25RichLinkCardStackItemView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = self;
  sub_18E57F4C4(width, height);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  _TtC7ChatKit25RichLinkCardStackItemView *v2;

  v2 = self;
  sub_18E57DE7C();

}

- (void)prepareForReuse
{
  char *v2;
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RichLinkCardStackItemView();
  v2 = (char *)v5.receiver;
  -[CKImageBalloonView prepareForReuse](&v5, sel_prepareForReuse);
  v3 = *(void **)&v2[OBJC_IVAR____TtC7ChatKit25RichLinkCardStackItemView_linkView];
  *(_QWORD *)&v2[OBJC_IVAR____TtC7ChatKit25RichLinkCardStackItemView_linkView] = 0;

  v4 = *(void **)&v2[OBJC_IVAR____TtC7ChatKit25RichLinkCardStackItemView_chipListMenuView];
  *(_QWORD *)&v2[OBJC_IVAR____TtC7ChatKit25RichLinkCardStackItemView_chipListMenuView] = 0;

  objc_msgSend(v2, sel_setNeedsLayout, v5.receiver, v5.super_class);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit25RichLinkCardStackItemView_linkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit25RichLinkCardStackItemView_chipListMenuView));
  sub_18E522F74((uint64_t)self + OBJC_IVAR____TtC7ChatKit25RichLinkCardStackItemView_actionDelegate);
  swift_unknownObjectRelease();
}

- (void)openAppFromNotificationExtensionWith:(id)a3
{
  id v4;
  _TtC7ChatKit25RichLinkCardStackItemView *v5;

  v4 = a3;
  v5 = self;
  sub_18E57E36C((uint64_t)v4);

}

- (void)chatBotActionButton:(id)a3 didSelectChipAction:(id)a4
{
  id v6;
  id v7;
  _TtC7ChatKit25RichLinkCardStackItemView *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_18E57E468((uint64_t)v6, (uint64_t)v7);

}

@end
