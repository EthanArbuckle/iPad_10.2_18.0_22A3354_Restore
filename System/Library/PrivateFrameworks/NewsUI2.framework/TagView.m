@implementation TagView

- (NSString)tsaxAccessibilityLabelForReordering
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR____TtC7NewsUI27TagView_tsaxAccessibilityLabelForReordering;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_1D6E26948();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setTsaxAccessibilityLabelForReordering:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  if (a3)
  {
    v4 = sub_1D6E26978();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC7NewsUI27TagView_tsaxAccessibilityLabelForReordering);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (_TtC7NewsUI27TagView)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI27TagView *)sub_1D623D81C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI27TagView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D6245B44();
}

- (NSString)title
{
  void *v2;
  _TtC7NewsUI27TagView *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI27TagView_titleLabel);
  v3 = self;
  v4 = objc_msgSend(v2, sel_text);
  if (v4)
  {
    v5 = v4;
    sub_1D6E26978();

    v6 = (void *)sub_1D6E26948();
    swift_bridgeObjectRelease();
  }
  else
  {

    v6 = 0;
  }
  return (NSString *)v6;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI27TagView_contentAccessibilityElement));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (unint64_t)accessibilityTraits
{
  _TtC7NewsUI27TagView *v2;
  unint64_t v3;

  v2 = self;
  v3 = TagView.accessibilityTraits.getter();

  return v3;
}

- (NSArray)accessibilityElements
{
  return (NSArray *)sub_1D623F434(self, (uint64_t)a2, TagView.accessibilityElements.getter);
}

- (CGRect)accessibilityFrame
{
  _TtC7NewsUI27TagView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  v2 = self;
  v3 = TagView.accessibilityFrame.getter();
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = v3;
  v11 = v5;
  v12 = v7;
  v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (NSString)accessibilityValue
{
  _TtC7NewsUI27TagView *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  TagView.accessibilityValue.getter();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1D6E26948();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setAccessibilityValue:(id)a3
{
  objc_class *ObjectType;
  _TtC7NewsUI27TagView *v6;
  _TtC7NewsUI27TagView *v7;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_1D6E26978();
    v6 = self;
    a3 = (id)sub_1D6E26948();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  -[TagView setAccessibilityValue:](&v8, sel_setAccessibilityValue_, a3);

}

- (NSArray)accessibilityUserInputLabels
{
  return (NSArray *)sub_1D623F434(self, (uint64_t)a2, (uint64_t (*)(void))TagView.accessibilityUserInputLabels.getter);
}

- (BOOL)accessibilityActivate
{
  _TtC7NewsUI27TagView *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = TagView.accessibilityActivate()();

  return v3;
}

- (NSArray)accessibilityCustomActions
{
  _TtC7NewsUI27TagView *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = TagView.accessibilityCustomActions.getter();

  if (v3)
  {
    sub_1D5E6F04C(0, (unint64_t *)&qword_1ED5F4680);
    v4 = (void *)sub_1D6E26D68();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

@end
