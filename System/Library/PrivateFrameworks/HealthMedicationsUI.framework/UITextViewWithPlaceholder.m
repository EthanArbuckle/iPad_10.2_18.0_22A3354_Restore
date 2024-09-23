@implementation UITextViewWithPlaceholder

- (NSString)text
{
  id v2;
  NSString *v3;
  NSString *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v2 = v7.receiver;
  v3 = -[UITextViewWithPlaceholder text](&v7, sel_text);
  if (v3)
  {
    v4 = v3;
    sub_1BC2B4460();

    v5 = (void *)sub_1BC2B4430();
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
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC19HealthMedicationsUI25UITextViewWithPlaceholder *v7;

  if (a3)
  {
    v4 = sub_1BC2B4460();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  UITextViewWithPlaceholder.text.setter(v4, v6);

}

- (_TtC19HealthMedicationsUI25UITextViewWithPlaceholder)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  id v11;
  _TtC19HealthMedicationsUI25UITextViewWithPlaceholder *v12;
  id v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI25UITextViewWithPlaceholder____lazy_storage___placeholderLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI25UITextViewWithPlaceholder_textDidChangeSubscription) = 0;
  v15.receiver = self;
  v15.super_class = ObjectType;
  v11 = a4;
  v12 = -[UITextViewWithPlaceholder initWithFrame:textContainer:](&v15, sel_initWithFrame_textContainer_, v11, x, y, width, height);
  v13 = sub_1BC256E3C();
  -[UITextViewWithPlaceholder addSubview:](v12, sel_addSubview_, v13, v15.receiver, v15.super_class);

  sub_1BC2576A8();
  return v12;
}

- (_TtC19HealthMedicationsUI25UITextViewWithPlaceholder)initWithCoder:(id)a3
{
  id v4;
  _TtC19HealthMedicationsUI25UITextViewWithPlaceholder *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI25UITextViewWithPlaceholder____lazy_storage___placeholderLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI25UITextViewWithPlaceholder_textDidChangeSubscription) = 0;
  v4 = a3;

  result = (_TtC19HealthMedicationsUI25UITextViewWithPlaceholder *)sub_1BC2B52B8();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC19HealthMedicationsUI25UITextViewWithPlaceholder *v2;

  v2 = self;
  UITextViewWithPlaceholder.layoutSubviews()();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI25UITextViewWithPlaceholder____lazy_storage___placeholderLabel));
  swift_release();
}

@end
