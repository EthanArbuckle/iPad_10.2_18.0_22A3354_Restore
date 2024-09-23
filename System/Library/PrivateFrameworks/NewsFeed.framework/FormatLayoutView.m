@implementation FormatLayoutView

- (void)layoutSubviews
{
  _TtC8NewsFeed16FormatLayoutView *v2;

  v2 = self;
  FormatLayoutView.layoutSubviews()();

}

- (_TtC8NewsFeed16FormatLayoutView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed16FormatLayoutView *)sub_1BA67A604(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  _TtC8NewsFeed16FormatLayoutView *v2;

  v2 = self;
  FormatLayoutView.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  sub_1BA49EBE0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8NewsFeed16FormatLayoutView_onSizeInvalidation));
  sub_1BA49EBE0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8NewsFeed16FormatLayoutView_onKeyboardWillShow));
  sub_1BA49EBE0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8NewsFeed16FormatLayoutView_onKeyboardWillHide));
  swift_release();
  sub_1BA5C699C((uint64_t)self + OBJC_IVAR____TtC8NewsFeed16FormatLayoutView_feedItem, &qword_1ED3B2A50, type metadata accessor for FeedItem);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

}

- (_TtC8NewsFeed16FormatLayoutView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BB6CA974();
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v4;
  double y;
  double x;
  id v8;
  _TtC8NewsFeed16FormatLayoutView *v9;
  id v10;
  unint64_t v11;
  id v12;
  _TtC8NewsFeed16FormatLayoutView *v13;

  v4 = (uint64_t)a4;
  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = -[FormatLayoutView subviews](v9, sel_subviews);
  sub_1BA49A224(0, (unint64_t *)&qword_1ED3B9950);
  v11 = sub_1BB872DB4();

  v12 = v8;
  v13 = v9;
  LOBYTE(v4) = sub_1BB6C77B0(v11, v13, v4, x, y);
  swift_bridgeObjectRelease();

  return v4 & 1;
}

- (int64_t)accessibilityContainerType
{
  _TtC8NewsFeed16FormatLayoutView *v2;
  int64_t v3;

  v2 = self;
  v3 = FormatLayoutView.accessibilityContainerType.getter();

  return v3;
}

- (BOOL)isAccessibilityElement
{
  _TtC8NewsFeed16FormatLayoutView *v2;
  uint64_t v3;
  uint64_t v4;
  __int16 v5;
  __int16 v6;

  if (!*(Class *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC8NewsFeed16FormatLayoutView_accessibilityRenderer))
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
  _TtC8NewsFeed16FormatLayoutView *v3;
  uint64_t v4;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed16FormatLayoutView_accessibilityRenderer);
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
  return (NSString *)sub_1BB6C5C48((char *)self, (uint64_t)a2, (void (*)(uint64_t))sub_1BB1F9814);
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_1BB6C5C48((char *)self, (uint64_t)a2, (void (*)(uint64_t))sub_1BB1F9AF8);
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_1BB6C5C48((char *)self, (uint64_t)a2, (void (*)(uint64_t))sub_1BB1F9B04);
}

- (NSString)ts_accessibilityElementHelp
{
  return (NSString *)sub_1BB6C5C48((char *)self, (uint64_t)a2, (void (*)(uint64_t))sub_1BB1F9B10);
}

- (NSString)accessibilityHint
{
  return (NSString *)sub_1BB6C5C48((char *)self, (uint64_t)a2, (void (*)(uint64_t))sub_1BB1F9B1C);
}

- (NSString)accessibilityLanguage
{
  return (NSString *)sub_1BB6C5C48((char *)self, (uint64_t)a2, (void (*)(uint64_t))sub_1BB1F9C88);
}

- (unint64_t)accessibilityTraits
{
  _TtC8NewsFeed16FormatLayoutView *v2;
  unint64_t v3;

  if (!*(Class *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC8NewsFeed16FormatLayoutView_accessibilityRenderer))
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
  _TtC8NewsFeed16FormatLayoutView *v3;
  uint64_t v4;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed16FormatLayoutView_accessibilityRenderer);
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

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  _TtC8NewsFeed16FormatLayoutView *v8;
  id v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = objc_msgSend(v7, sel_view);
  if (v9)
  {
    v10 = v9;
    type metadata accessor for FormatButton();
    v11 = (void *)swift_dynamicCastClass();
    if (!v11)

  }
  else
  {
    v11 = 0;
  }

  return v11 != 0;
}

@end
