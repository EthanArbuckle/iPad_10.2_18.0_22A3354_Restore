@implementation FormatButton

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[FormatButton layoutSubviews](&v3, sel_layoutSubviews);
  objc_msgSend(v2, sel_bounds, v3.receiver, v3.super_class);
  sub_1BB8736F0();

}

- (_TtC8NewsFeed12FormatButton)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed12FormatButton *)FormatButton.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed12FormatButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s8NewsFeed12FormatButtonC5coderACSgSo7NSCoderC_tcfc_0();
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  _TtC8NewsFeed12FormatButton *v8;
  double v9;
  BOOL v10;
  CGPoint v12;
  CGRect v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  -[FormatButton bounds](v8, sel_bounds);
  v13.origin.x = UIEdgeInsetsInsetRect_0(v9);
  v12.x = x;
  v12.y = y;
  v10 = CGRectContainsPoint(v13, v12);

  return v10;
}

- (BOOL)isSelected
{
  return sub_1BB72C058(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  sub_1BB72C0E8(self, (uint64_t)a2, a3, (const char **)&selRef_setSelected_);
}

- (BOOL)isHighlighted
{
  return sub_1BB72C058(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  sub_1BB72C0E8(self, (uint64_t)a2, a3, (const char **)&selRef_setHighlighted_);
}

- (BOOL)isEnabled
{
  return sub_1BB72C058(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  sub_1BB72C0E8(self, (uint64_t)a2, a3, (const char **)&selRef_setEnabled_);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed12FormatButton_formatLayoutView));
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed12FormatButton_longPressGesture));
  sub_1BA49EBE0(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8NewsFeed12FormatButton_createMenuElementsBlock));
}

- (int64_t)accessibilityContainerType
{
  _TtC8NewsFeed12FormatButton *v2;
  int64_t v3;

  v2 = self;
  v3 = FormatButton.accessibilityContainerType.getter();

  return v3;
}

- (BOOL)isAccessibilityElement
{
  _TtC8NewsFeed12FormatButton *v2;
  uint64_t v3;
  uint64_t v4;
  __int16 v5;
  __int16 v6;

  if (!*(Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC8NewsFeed12FormatButton_accessibilityRenderer))
    return 0;
  v2 = self;
  swift_retain();
  sub_1BB1F8DCC();
  v4 = v3;
  v6 = v5;
  swift_release();

  if ((v6 & 0x100) != 0)
    return 0;
  else
    return v6 & (v4 != 0);
}

- (NSArray)accessibilityElements
{
  void *v2;
  _TtC8NewsFeed12FormatButton *v3;
  uint64_t v4;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed12FormatButton_accessibilityRenderer);
  if (v2)
  {
    v3 = self;
    swift_retain();
    v4 = sub_1BB1F8FF8();

    swift_release();
    if (v4)
    {
      v2 = (void *)sub_1BB872D9C();
      swift_bridgeObjectRelease();
    }
    else
    {
      v2 = 0;
    }
  }
  return (NSArray *)v2;
}

- (NSString)accessibilityIdentifier
{
  return (NSString *)sub_1BB72D720((char *)self, (uint64_t)a2, (void (*)(uint64_t))sub_1BB1F9814);
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_1BB72D720((char *)self, (uint64_t)a2, (void (*)(uint64_t))sub_1BB1F9AF8);
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_1BB72D720((char *)self, (uint64_t)a2, (void (*)(uint64_t))sub_1BB1F9B04);
}

- (NSString)ts_accessibilityElementHelp
{
  return (NSString *)sub_1BB72D720((char *)self, (uint64_t)a2, (void (*)(uint64_t))sub_1BB1F9B10);
}

- (NSString)accessibilityHint
{
  return (NSString *)sub_1BB72D720((char *)self, (uint64_t)a2, (void (*)(uint64_t))sub_1BB1F9B1C);
}

- (NSString)accessibilityLanguage
{
  return (NSString *)sub_1BB72D720((char *)self, (uint64_t)a2, (void (*)(uint64_t))sub_1BB1F9C88);
}

- (unint64_t)accessibilityTraits
{
  _TtC8NewsFeed12FormatButton *v2;
  unint64_t v3;

  if (!*(Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC8NewsFeed12FormatButton_accessibilityRenderer))
    return 0;
  v2 = self;
  swift_retain();
  v3 = sub_1BB1F9D34();

  swift_release();
  return v3;
}

- (NSArray)accessibilityCustomActions
{
  void *v2;
  _TtC8NewsFeed12FormatButton *v3;
  uint64_t v4;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed12FormatButton_accessibilityRenderer);
  if (v2)
  {
    v3 = self;
    swift_retain();
    v4 = sub_1BB1FA050();

    swift_release();
    if (v4)
    {
      sub_1BA49A224(0, &qword_1ED39DAC0);
      v2 = (void *)sub_1BB872D9C();
      swift_bridgeObjectRelease();
    }
    else
    {
      v2 = 0;
    }
  }
  return (NSArray *)v2;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  _TtC8NewsFeed12FormatButton *v6;
  void *v7;

  v5 = a3;
  v6 = self;
  v7 = (void *)_s8NewsFeed12FormatButtonC22contextMenuInteraction_016configurationForF10AtLocationSo09UIContextF13ConfigurationCSgSo0lfG0C_So7CGPointVtF_0();

  return v7;
}

@end
