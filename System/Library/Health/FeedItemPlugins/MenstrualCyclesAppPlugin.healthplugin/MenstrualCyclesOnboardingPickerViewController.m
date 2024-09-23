@implementation MenstrualCyclesOnboardingPickerViewController

- (void)viewDidLoad
{
  _TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController *v2;

  v2 = self;
  sub_231BC8048();

}

- (uint64_t)nextButtonTapped:(void *)a1
{
  id v2;
  uint64_t v4;

  swift_unknownObjectRetain();
  v2 = a1;
  sub_231CA27D8();

  swift_unknownObjectRelease();
  return _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)&v4);
}

- (void)cancelButtonTapped:(id)a3
{
  _TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;

  swift_unknownObjectRetain();
  v4 = self;
  sub_231CA27D8();
  swift_unknownObjectRelease();
  v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  v6 = sub_231911848((uint64_t)sub_231BC94FC, v5);
  swift_release_n();
  -[MenstrualCyclesOnboardingPickerViewController presentViewController:animated:completion:](v4, sel_presentViewController_animated_completion_, v6, 1, 0);

  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)&v7);
}

- (_TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController *result;

  result = (_TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController *result;

  v6 = a5;
  result = (_TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_23190C114((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController_delegate);
  swift_bridgeObjectRelease();
  sub_231BC9504(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController____lazy_storage___dayPickerRange));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController____lazy_storage___datePicker));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController____lazy_storage___dayPicker));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController____lazy_storage___dateComponentsFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController____lazy_storage___pickerDetailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController____lazy_storage___descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController____lazy_storage___nextButton));
  _s24MenstrualCyclesAppPlugin32NotificationAuthorizationManagerVwxx_0((uint64_t)self+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController_pinnedContentManager);
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  if ((*(_BYTE *)(self
                 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController_pickerType
                 + 16) & 1) != 0)
    return 0;
  v4 = *(_QWORD *)(self
                 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController_pickerType);
  v5 = *(_QWORD *)(self
                 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController_pickerType
                 + 8);
  v6 = __OFSUB__(v5, v4);
  v7 = v5 - v4;
  if (v6)
  {
    __break(1u);
    goto LABEL_7;
  }
  self = v7 + 1;
  if (__OFADD__(v7, 1))
LABEL_7:
    __break(1u);
  return self;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v7;
  _TtC24MenstrualCyclesAppPlugin45MenstrualCyclesOnboardingPickerViewController *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v7 = a3;
  v8 = self;
  sub_231BC940C(a4);
  v10 = v9;

  if (v10)
  {
    v11 = (void *)sub_231CA1BD8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

@end
