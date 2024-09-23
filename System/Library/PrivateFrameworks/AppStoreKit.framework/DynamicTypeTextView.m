@implementation DynamicTypeTextView

- (_TtC11AppStoreKit19DynamicTypeTextView)initWithFrame:(CGRect)a3
{
  return (_TtC11AppStoreKit19DynamicTypeTextView *)DynamicTypeTextView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11AppStoreKit19DynamicTypeTextView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s11AppStoreKit19DynamicTypeTextViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (UIFont)font
{
  return (UIFont *)sub_1D81F80B8(self, (uint64_t)a2, (SEL *)&selRef_font);
}

- (void)setFont:(id)a3
{
  _TtC11AppStoreKit19DynamicTypeTextView *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1D81FA2BC(a3);

}

- (UIColor)textColor
{
  return (UIColor *)sub_1D81F80B8(self, (uint64_t)a2, (SEL *)&selRef_textColor);
}

- (void)setTextColor:(id)a3
{
  id v4;
  char *v5;
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DynamicTypeTextView();
  v4 = a3;
  v5 = (char *)v8.receiver;
  -[DynamicTypeTextView setTextColor:](&v8, sel_setTextColor_, v4);
  v6 = objc_msgSend(v5, sel_textColor, v8.receiver, v8.super_class);
  v7 = *(void **)&v5[OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView__cachedTextColor];
  *(_QWORD *)&v5[OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView__cachedTextColor] = v6;

  sub_1D81F8C94();
}

- (NSAttributedString)attributedText
{
  return (NSAttributedString *)sub_1D81F80B8(self, (uint64_t)a2, (SEL *)&selRef_attributedText);
}

- (void)setAttributedText:(id)a3
{
  id v4;
  _BYTE *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DynamicTypeTextView();
  v4 = a3;
  v5 = v6.receiver;
  -[DynamicTypeTextView setAttributedText:](&v6, sel_setAttributedText_, v4);
  if ((v5[OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_isUpdatingAttributedText] & 1) == 0)
    sub_1D81F8C94();

}

- (NSString)text
{
  id v2;
  NSString *v3;
  NSString *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DynamicTypeTextView();
  v2 = v7.receiver;
  v3 = -[DynamicTypeTextView text](&v7, sel_text);
  if (v3)
  {
    v4 = v3;
    sub_1D82156D0();

    v5 = (void *)sub_1D82156AC();
    swift_bridgeObjectRelease();
    return (NSString *)v5;
  }
  else
  {

    return (NSString *)0;
  }
}

- (void)setText:(id)a3
{
  _TtC11AppStoreKit19DynamicTypeTextView *v4;
  void *v5;
  _TtC11AppStoreKit19DynamicTypeTextView *v6;
  objc_super v7;

  if (a3)
  {
    sub_1D82156D0();
    v4 = self;
    v5 = (void *)sub_1D82156AC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = self;
    v5 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DynamicTypeTextView();
  -[DynamicTypeTextView setText:](&v7, sel_setText_, v5);

  sub_1D81F8C94();
}

- (int64_t)textAlignment
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DynamicTypeTextView();
  return -[DynamicTypeTextView textAlignment](&v3, sel_textAlignment);
}

- (void)setTextAlignment:(int64_t)a3
{
  void (*v4)(char *);
  _TtC11AppStoreKit19DynamicTypeTextView *v5;
  objc_super v6;
  char v7;

  v7 = 0;
  v4 = *(void (**)(char *))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.super.super.super.isa) + 0x1D0);
  v5 = self;
  v4(&v7);
  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for DynamicTypeTextView();
  -[DynamicTypeTextView setTextAlignment:](&v6, sel_setTextAlignment_, a3);

}

- (_TtC11AppStoreKit19DynamicTypeTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  id v4;
  _TtC11AppStoreKit19DynamicTypeTextView *result;

  v4 = a4;
  result = (_TtC11AppStoreKit19DynamicTypeTextView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D81D8B6C((uint64_t)self + OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_fontUseCase, &qword_1EDA1C180);
  sub_1D81E2E70(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_contentSizeCategoryMapping));
  sub_1D81D8B6C((uint64_t)self + OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView_customTextStyle, &qword_1EDA1BC80);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView__cachedFont));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11AppStoreKit19DynamicTypeTextView__cachedTextColor));
}

@end
