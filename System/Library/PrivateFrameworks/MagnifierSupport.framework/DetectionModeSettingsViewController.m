@implementation DetectionModeSettingsViewController

- (void)viewDidLoad
{
  _TtC16MagnifierSupport35DetectionModeSettingsViewController *v2;

  v2 = self;
  sub_2273BD53C();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC16MagnifierSupport35DetectionModeSettingsViewController *v4;

  v4 = self;
  sub_227379ACC(a3);

}

- (void)didToggleDetectionSwitch:(id)a3
{
  id v4;
  _TtC16MagnifierSupport35DetectionModeSettingsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_2273BEB4C((uint64_t)v4);

}

- (void)didToggleFeedbackSwitch:(id)a3
{
  id v4;
  _TtC16MagnifierSupport35DetectionModeSettingsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_2273BEFEC(v4);

}

- (void)didToggleDetectLanguagesSwitch:(id)a3
{
  id v4;
  _TtC16MagnifierSupport35DetectionModeSettingsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_2273BF3B4(v4);

}

- (_TtC16MagnifierSupport35DetectionModeSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_22758E1E4();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC16MagnifierSupport35DetectionModeSettingsViewController *)sub_2273BDB28(v5, v7, a4);
}

- (_TtC16MagnifierSupport35DetectionModeSettingsViewController)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport35DetectionModeSettingsViewController *)sub_2273BDD6C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport35DetectionModeSettingsViewController____lazy_storage___peopleDetectionSettingsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport35DetectionModeSettingsViewController____lazy_storage___imageCaptionSettingsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport35DetectionModeSettingsViewController____lazy_storage___doorDetectionSettingsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport35DetectionModeSettingsViewController____lazy_storage___objectUnderstandingSettingsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport35DetectionModeSettingsViewController_languageTranslator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport35DetectionModeSettingsViewController____lazy_storage___pointSpeakSettingsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport35DetectionModeSettingsViewController____lazy_storage___textDetectionSettingsViewController));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport35DetectionModeSettingsViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport35DetectionModeSettingsViewController____lazy_storage___dataSource));
  sub_22731A0F0((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport35DetectionModeSettingsViewController_delegate);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v5;
  _TtC16MagnifierSupport35DetectionModeSettingsViewController *v6;

  if (MEMORY[0x2276B3E34]((char *)self + OBJC_IVAR____TtC16MagnifierSupport35DetectionModeSettingsViewController_delegate, a2))
  {
    v5 = a3;
    v6 = self;
    sub_22743425C();

    swift_unknownObjectRelease();
  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v13;

  v4 = sub_22758CAD4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6, v7, v8, v9);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
  return 1;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v13;

  v4 = sub_22758CAD4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6, v7, v8, v9);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
  return 0;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v13;

  v4 = sub_22758CAD4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6, v7, v8, v9);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
  return 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  _TtC16MagnifierSupport35DetectionModeSettingsViewController *v15;
  uint64_t v16;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  sub_2273BE294(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end
