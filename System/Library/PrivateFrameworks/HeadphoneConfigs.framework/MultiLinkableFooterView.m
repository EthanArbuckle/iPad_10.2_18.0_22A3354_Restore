@implementation MultiLinkableFooterView

+ (NSString)footerLinkStringsKey
{
  return (NSString *)(id)sub_1DB3BC31C();
}

+ (NSString)footerLinkTargetsKey
{
  return (NSString *)(id)sub_1DB3BC31C();
}

+ (NSString)footerLinkActionsKey
{
  return (NSString *)(id)sub_1DB3BC31C();
}

+ (NSString)footerLinkRangesKey
{
  return (NSString *)(id)sub_1DB3BC31C();
}

+ (NSString)footerLinkReuseIDKey
{
  return (NSString *)(id)sub_1DB3BC31C();
}

- (_TtC16HeadphoneConfigs23MultiLinkableFooterView)initWithSpecifier:(id)a3
{
  id v4;

  v4 = a3;
  return (_TtC16HeadphoneConfigs23MultiLinkableFooterView *)MultiLinkableFooterView.init(specifier:)(a3);
}

- (void)refreshContentsWithSpecifier:(id)a3
{
  id v4;
  _TtC16HeadphoneConfigs23MultiLinkableFooterView *v5;

  v4 = a3;
  v5 = self;
  -[MultiLinkableFooterView setNeedsLayout](v5, sel_setNeedsLayout);
  -[MultiLinkableFooterView layoutIfNeeded](v5, sel_layoutIfNeeded);

}

- (double)preferredHeightForWidth:(double)a3
{
  _TtC16HeadphoneConfigs23MultiLinkableFooterView *v3;
  id v4;
  double v5;
  double v6;

  v3 = self;
  v4 = sub_1DB3ADF60();
  objc_msgSend(v4, sel_intrinsicContentSize);
  v6 = v5;

  return v6;
}

- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4
{
  id v5;
  _TtC16HeadphoneConfigs23MultiLinkableFooterView *v6;
  id v7;
  double v8;
  double v9;

  v5 = a4;
  v6 = self;
  v7 = sub_1DB3ADF60();
  objc_msgSend(v7, sel_intrinsicContentSize);
  v9 = v8;

  return v9;
}

- (_TtC16HeadphoneConfigs23MultiLinkableFooterView)initWithCoder:(id)a3
{
  id v4;
  _TtC16HeadphoneConfigs23MultiLinkableFooterView *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs23MultiLinkableFooterView_heightConstraints) = (Class)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16HeadphoneConfigs23MultiLinkableFooterView____lazy_storage___container) = 0;
  v4 = a3;

  result = (_TtC16HeadphoneConfigs23MultiLinkableFooterView *)sub_1DB3BC664();
  __break(1u);
  return result;
}

- (_TtC16HeadphoneConfigs23MultiLinkableFooterView)initWithReuseIdentifier:(id)a3
{
  _TtC16HeadphoneConfigs23MultiLinkableFooterView *result;

  result = (_TtC16HeadphoneConfigs23MultiLinkableFooterView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16HeadphoneConfigs23MultiLinkableFooterView____lazy_storage___container));
}

@end
