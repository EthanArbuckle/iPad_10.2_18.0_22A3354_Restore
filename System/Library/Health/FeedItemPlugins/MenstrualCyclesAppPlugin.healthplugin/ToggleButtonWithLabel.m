@implementation ToggleButtonWithLabel

- (_TtC24MenstrualCyclesAppPluginP33_61BF7A68BF04E2E624D5FFBA5D55F26621ToggleButtonWithLabel)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC24MenstrualCyclesAppPluginP33_61BF7A68BF04E2E624D5FFBA5D55F26621ToggleButtonWithLabel *result;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC24MenstrualCyclesAppPluginP33_61BF7A68BF04E2E624D5FFBA5D55F26621ToggleButtonWithLabel_isChecked) = 0;
  v4 = OBJC_IVAR____TtC24MenstrualCyclesAppPluginP33_61BF7A68BF04E2E624D5FFBA5D55F26621ToggleButtonWithLabel_toggleButton;
  v5 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)sub_2319C3A84();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPluginP33_61BF7A68BF04E2E624D5FFBA5D55F26621ToggleButtonWithLabel____lazy_storage___label) = 0;

  result = (_TtC24MenstrualCyclesAppPluginP33_61BF7A68BF04E2E624D5FFBA5D55F26621ToggleButtonWithLabel *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPluginP33_61BF7A68BF04E2E624D5FFBA5D55F26621ToggleButtonWithLabel)initWithFrame:(CGRect)a3
{
  sub_2319C529C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPluginP33_61BF7A68BF04E2E624D5FFBA5D55F26621ToggleButtonWithLabel_toggleButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPluginP33_61BF7A68BF04E2E624D5FFBA5D55F26621ToggleButtonWithLabel____lazy_storage___label));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPluginP33_61BF7A68BF04E2E624D5FFBA5D55F26621ToggleButtonWithLabel_tintColorWhenChecked));
  swift_bridgeObjectRelease();
}

@end
