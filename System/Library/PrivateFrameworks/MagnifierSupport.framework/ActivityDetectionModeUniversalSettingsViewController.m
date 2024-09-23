@implementation ActivityDetectionModeUniversalSettingsViewController

- (void)viewDidLoad
{
  _TtC16MagnifierSupport52ActivityDetectionModeUniversalSettingsViewController *v2;

  v2 = self;
  sub_227379940();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC16MagnifierSupport52ActivityDetectionModeUniversalSettingsViewController *v4;

  v4 = self;
  sub_227379ACC(a3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport52ActivityDetectionModeUniversalSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16MagnifierSupport52ActivityDetectionModeUniversalSettingsViewController *)sub_227379C7C(v5, v7, a4);
}

- (_TtC16MagnifierSupport52ActivityDetectionModeUniversalSettingsViewController)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport52ActivityDetectionModeUniversalSettingsViewController *)sub_227379E90(a3);
}

- (void).cxx_destruct
{
  uint64_t v3[35];

  sub_22731A0F0((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport52ActivityDetectionModeUniversalSettingsViewController_delegate);
  sub_227338344((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport52ActivityDetectionModeUniversalSettingsViewController_activity, (uint64_t)v3);
  sub_22733F1C4(v3);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport52ActivityDetectionModeUniversalSettingsViewController_tableView));
  swift_release();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4 == 1)
    return a4;
  if (!a4)
    return (*(_QWORD **)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MagnifierSupport52ActivityDetectionModeUniversalSettingsViewController_availablePauseDetectionModeFeedbacks))[2];
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
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
  _TtC16MagnifierSupport52ActivityDetectionModeUniversalSettingsViewController *v15;
  id v16;
  uint64_t v18;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  v16 = sub_22737A104(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return v16;
}

- (void)didToggleFeedbackSwitch:(id)a3
{
  id v4;
  _TtC16MagnifierSupport52ActivityDetectionModeUniversalSettingsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_22737A848(v4);

}

- (void)didToggleDetectLanguagesSwitch:(id)a3
{
  id v5;
  _TtC16MagnifierSupport52ActivityDetectionModeUniversalSettingsViewController *v6;

  if (MEMORY[0x2276B3E34]((char *)self+ OBJC_IVAR____TtC16MagnifierSupport52ActivityDetectionModeUniversalSettingsViewController_delegate, a2))
  {
    v5 = a3;
    v6 = self;
    sub_2273E9784((int)objc_msgSend(v5, sel_isOn));

    swift_unknownObjectRelease();
  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v4;
  void *v5;

  sub_22737ADEC(a4);
  if (v4)
  {
    v5 = (void *)sub_22758E1B4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  if (a4 != 1)
  {
    if (!a4)
    {
      sub_2273795B8();
      if (v4)
        goto LABEL_4;
    }
LABEL_6:
    v5 = 0;
    return v5;
  }
  sub_2273795B8();
  if (!v6)
    goto LABEL_6;
LABEL_4:
  v5 = (void *)sub_22758E1B4();
  swift_bridgeObjectRelease();
  return v5;
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
  BOOL v12;
  uint64_t v14;

  v4 = sub_22758CAD4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6, v7, v8, v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v12 = sub_22758CAC8() != 0;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
  return v12;
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
  _TtC16MagnifierSupport52ActivityDetectionModeUniversalSettingsViewController *v15;
  void *v16;
  uint64_t v17;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  v16 = (void *)sub_22758CA74();
  objc_msgSend(v14, sel_deselectRowAtIndexPath_animated_, v16, 1);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

@end
