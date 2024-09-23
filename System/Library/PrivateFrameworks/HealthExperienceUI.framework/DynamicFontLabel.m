@implementation DynamicFontLabel

- (_TtC18HealthExperienceUI16DynamicFontLabel)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI16DynamicFontLabel *)DynamicFontLabel.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI16DynamicFontLabel)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  objc_super v7;

  v4 = (void *)*MEMORY[0x1E0DC4B60];
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI16DynamicFontLabel_textStyle) = (Class)*MEMORY[0x1E0DC4B60];
  *(_DWORD *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC18HealthExperienceUI16DynamicFontLabel_symbolicTraits) = 2;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DynamicFontLabel();
  v5 = v4;
  return -[DynamicFontLabel initWithCoder:](&v7, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI16DynamicFontLabel_textStyle));
}

@end
