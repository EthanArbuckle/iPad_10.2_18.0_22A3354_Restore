@implementation CKChatBotActionButton

- (CKChatBotActionButton)initWithActions:(id)a3 delegate:(id)a4 backgroundStyle:(int64_t)a5 showTitle:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v10;
  CKChatBotActionButton *v11;

  v6 = a6;
  sub_18E768D20();
  v10 = sub_18E768AE0();
  swift_getObjectType();
  swift_unknownObjectRetain();
  v11 = (CKChatBotActionButton *)sub_18E693700(v10, (uint64_t)a4, (id)a5, v6, (char *)self);
  swift_unknownObjectRelease();
  return v11;
}

- (CKChatBotActionButton)initWithCoder:(id)a3
{
  id v5;
  CKChatBotActionButton *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___CKChatBotActionButton_iconView) = 0;
  swift_unknownObjectWeakInit();
  v5 = a3;

  result = (CKChatBotActionButton *)sub_18E769320();
  __break(1u);
  return result;
}

- (void)touchedButton
{
  CKChatBotActionButton *v2;

  v2 = self;
  sub_18E692D68();

}

- (void)layoutSubviews
{
  CKChatBotActionButton *v2;

  v2 = self;
  sub_18E6930BC();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  CKChatBotActionButton *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_18E6932AC(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CKChatBotActionButton)initWithFrame:(CGRect)a3
{
  CKChatBotActionButton *result;

  result = (CKChatBotActionButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  sub_18E522F74((uint64_t)self + OBJC_IVAR___CKChatBotActionButton_delegate);
}

@end
