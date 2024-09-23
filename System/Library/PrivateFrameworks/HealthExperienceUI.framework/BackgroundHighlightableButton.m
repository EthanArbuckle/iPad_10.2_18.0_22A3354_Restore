@implementation BackgroundHighlightableButton

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BackgroundHighlightableButton();
  return -[BackgroundHighlightableButton isHighlighted](&v3, sel_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  unsigned int v5;
  uint64_t *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for BackgroundHighlightableButton();
  v4 = (char *)v7.receiver;
  -[BackgroundHighlightableButton setHighlighted:](&v7, sel_setHighlighted_, v3);
  v5 = objc_msgSend(v4, sel_isHighlighted, v7.receiver, v7.super_class);
  v6 = &OBJC_IVAR____TtC18HealthExperienceUI29BackgroundHighlightableButton_highlightedColor;
  if (!v5)
    v6 = &OBJC_IVAR____TtC18HealthExperienceUI29BackgroundHighlightableButton_regularColor;
  objc_msgSend(v4, sel_setBackgroundColor_, *(_QWORD *)&v4[*v6]);

}

- (_TtC18HealthExperienceUI29BackgroundHighlightableButton)initWithCoder:(id)a3
{
  _TtC18HealthExperienceUI29BackgroundHighlightableButton *result;

  result = (_TtC18HealthExperienceUI29BackgroundHighlightableButton *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI29BackgroundHighlightableButton)initWithFrame:(CGRect)a3
{
  _TtC18HealthExperienceUI29BackgroundHighlightableButton *result;

  result = (_TtC18HealthExperienceUI29BackgroundHighlightableButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29BackgroundHighlightableButton_regularColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29BackgroundHighlightableButton_highlightedColor));
}

@end
