@implementation GradientConfigurationController

- (_TtC11EmojiPoster31GradientConfigurationController)initWithCoder:(id)a3
{
  return (_TtC11EmojiPoster31GradientConfigurationController *)GradientConfigurationController.init(coder:)(a3);
}

- (void)viewDidLoad
{
  _TtC11EmojiPoster31GradientConfigurationController *v2;

  v2 = self;
  sub_1DD2D5850();

}

- (void)attributeSliderValueChangedWithSlider:(id)a3
{
  id v4;
  _TtC11EmojiPoster31GradientConfigurationController *v5;

  v4 = a3;
  v5 = self;
  sub_1DD2D6750(v4);

}

- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5
{
  void (*v5)(id);
  id v8;
  id v9;
  _TtC11EmojiPoster31GradientConfigurationController *v10;

  v5 = *(void (**)(id))((char *)&self->super.super.super.isa
                                 + OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_colorUpdater);
  if (v5)
  {
    v8 = a3;
    v9 = a4;
    v10 = self;
    sub_1DD2D7028((uint64_t)v5);
    v5(v9);
    sub_1DD2CFCD0((uint64_t)v5);

  }
}

- (void)colorPickerViewControllerDidFinish:(id)a3
{
  _QWORD *v3;
  uint64_t v4;

  v3 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_colorUpdater);
  v4 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_colorUpdater);
  *v3 = 0;
  v3[1] = 0;
  sub_1DD2CFCD0(v4);
}

- (_TtC11EmojiPoster31GradientConfigurationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC11EmojiPoster31GradientConfigurationController *result;

  v4 = a4;
  result = (_TtC11EmojiPoster31GradientConfigurationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1DD2BF928(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_editingLinearGradientProperties), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_editingLinearGradientProperties), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_editingLinearGradientProperties), *(uint64_t *)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_editingLinearGradientProperties), *(uint64_t *)((char *)&self->super._view+ OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_editingLinearGradientProperties));
  sub_1DD2BF928(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_editingRadialGradientProperties), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_editingRadialGradientProperties), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_editingRadialGradientProperties), *(uint64_t *)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_editingRadialGradientProperties), *(uint64_t *)((char *)&self->super._view+ OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_editingRadialGradientProperties));
  sub_1DD2CFD1C((uint64_t)self + OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_verticalStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_styleSegmentedControl));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_colorSlider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_attributeSlider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController____lazy_storage___colorPicker));
  sub_1DD2CFCD0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC11EmojiPoster31GradientConfigurationController_colorUpdater));
}

@end
