@implementation OnboardingViewControllerWithNextButton

- (void)nextButtonTapped:(id)a3
{
  _TtC18HealthExperienceUI38OnboardingViewControllerWithNextButton *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (void)cancelButtonTapped:(id)a3
{
  _TtC18HealthExperienceUI38OnboardingViewControllerWithNextButton *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();
  swift_unknownObjectRelease();
  -[OnboardingViewControllerWithNextButton dismissViewControllerAnimated:completion:](v4, sel_dismissViewControllerAnimated_completion_, 1, 0);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (_TtC18HealthExperienceUI38OnboardingViewControllerWithNextButton)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC18HealthExperienceUI38OnboardingViewControllerWithNextButton *result;

  result = (_TtC18HealthExperienceUI38OnboardingViewControllerWithNextButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI38OnboardingViewControllerWithNextButton)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC18HealthExperienceUI38OnboardingViewControllerWithNextButton *result;

  v6 = a5;
  result = (_TtC18HealthExperienceUI38OnboardingViewControllerWithNextButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI38OnboardingViewControllerWithNextButton____lazy_storage___nextButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI38OnboardingViewControllerWithNextButton____lazy_storage___doneButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI38OnboardingViewControllerWithNextButton____lazy_storage___cancelButton));
}

@end
