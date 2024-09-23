@implementation DynamicTypeLabel

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_fontUseCaseContentSizeCategory));
  sub_1D81E2E70(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_contentSizeCategoryMapping));
  sub_1D81D8B6C((uint64_t)self + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_fontUseCase, &qword_1EDA1C180);
  sub_1D81D8B6C((uint64_t)self + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_customTextStyle, &qword_1EDA1BC80);
}

- (void)setLineSpacing:(int64_t)a3
{
  _TtC11AppStoreKit16DynamicTypeLabel *v4;

  v4 = self;
  sub_1D81D7C18(a3);

}

- (_TtC11AppStoreKit16DynamicTypeLabel)initWithFrame:(CGRect)a3
{
  uint64_t v3;
  char *v4;
  uint64_t ObjectType;
  uint64_t v6;
  _TtC11AppStoreKit16DynamicTypeLabel *v7;
  uint64_t v9;
  char v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA1C180);
  MEMORY[0x1E0C80A78]();
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  ObjectType = swift_getObjectType();
  v6 = sub_1D8215454();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v4, 1, 1, v6);
  v10 = 0;
  v7 = (_TtC11AppStoreKit16DynamicTypeLabel *)(*(uint64_t (**)(char *, uint64_t, _QWORD, uint64_t, _QWORD, char *, _QWORD, _QWORD))(ObjectType + 136))(v4, 2, 0, 1, 0, &v10, 0, 0);
  swift_deallocPartialClassInstance();
  return v7;
}

- (void)setAttributedText:(id)a3
{
  id v4;
  _TtC11AppStoreKit16DynamicTypeLabel *v5;
  id v6;
  objc_super v7;

  v4 = a3;
  v5 = self;
  sub_1D81DFD48(0);
  v6 = -[DynamicTypeLabel lineBreakMode](v5, sel_lineBreakMode);
  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for DynamicTypeLabel();
  -[DynamicTypeLabel setAttributedText:](&v7, sel_setAttributedText_, v4);
  -[DynamicTypeLabel setLineBreakMode:](v5, sel_setLineBreakMode_, v6);

}

- (void)setTextAlignment:(int64_t)a3
{
  unsigned __int8 *v5;
  unsigned __int8 v6;
  _TtC11AppStoreKit16DynamicTypeLabel *v7;
  objc_super v8;
  unsigned __int8 v9;

  v5 = (unsigned __int8 *)self + OBJC_IVAR____TtC11AppStoreKit16DynamicTypeLabel_directionalTextAlignment;
  swift_beginAccess();
  v6 = *v5;
  *v5 = 0;
  v9 = v6;
  v7 = self;
  sub_1D81DA838(&v9);
  v8.receiver = v7;
  v8.super_class = (Class)type metadata accessor for DynamicTypeLabel();
  -[DynamicTypeLabel setTextAlignment:](&v8, sel_setTextAlignment_, a3);

}

- (void)setFont:(id)a3
{
  _TtC11AppStoreKit16DynamicTypeLabel *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1D81E0A20(a3);

}

- (void)setText:(id)a3
{
  _TtC11AppStoreKit16DynamicTypeLabel *v4;
  void *v5;
  _TtC11AppStoreKit16DynamicTypeLabel *v6;
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
  v7.super_class = (Class)type metadata accessor for DynamicTypeLabel();
  -[DynamicTypeLabel setText:](&v7, sel_setText_, v5);

  sub_1D81DFD48(1);
}

- (UIFont)font
{
  return (UIFont *)sub_1D81DFE14(self, (uint64_t)a2, (SEL *)&selRef_font);
}

- (NSString)text
{
  id v2;
  NSString *v3;
  NSString *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DynamicTypeLabel();
  v2 = v7.receiver;
  v3 = -[DynamicTypeLabel text](&v7, sel_text);
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

- (int64_t)lineSpacing
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DynamicTypeLabel();
  return -[DynamicTypeLabel lineSpacing](&v3, sel_lineSpacing);
}

- (_TtC11AppStoreKit16DynamicTypeLabel)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s11AppStoreKit16DynamicTypeLabelC5coderACSgSo7NSCoderC_tcfc_0();
}

- (int64_t)textAlignment
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DynamicTypeLabel();
  return -[DynamicTypeLabel textAlignment](&v3, sel_textAlignment);
}

- (NSAttributedString)attributedText
{
  return (NSAttributedString *)sub_1D81DFE14(self, (uint64_t)a2, (SEL *)&selRef_attributedText);
}

@end
