@implementation PointSpeakSettingsViewController

- (void)viewDidLoad
{
  _TtC16MagnifierSupport32PointSpeakSettingsViewController *v2;

  v2 = self;
  sub_227420770();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC16MagnifierSupport32PointSpeakSettingsViewController *v4;

  v4 = self;
  sub_227420F14(a3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport32PointSpeakSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16MagnifierSupport32PointSpeakSettingsViewController *)sub_2274210C4(v5, v7, a4);
}

- (_TtC16MagnifierSupport32PointSpeakSettingsViewController)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport32PointSpeakSettingsViewController *)sub_22742138C(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport32PointSpeakSettingsViewController_tableView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport32PointSpeakSettingsViewController_colorPickerController));
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result;

  result = 2;
  switch(a4)
  {
    case 0:
      result = (*(_QWORD **)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16MagnifierSupport32PointSpeakSettingsViewController_availablePointSpeakFeedbacks))[2];
      break;
    case 1:
    case 3:
      return result;
    case 2:
      result = 1;
      break;
    default:
      result = 0;
      break;
  }
  return result;
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
  _TtC16MagnifierSupport32PointSpeakSettingsViewController *v15;
  id v16;
  uint64_t v18;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  v16 = sub_2274216B8(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return v16;
}

- (void)didToggleFeedbackSwitch:(id)a3
{
  id v4;
  _TtC16MagnifierSupport32PointSpeakSettingsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_227423A98(v4);

}

- (void)didToggleFlashlightSwitch:(id)a3
{
  id v4;
  _TtC16MagnifierSupport32PointSpeakSettingsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_227423E60(v4, &OBJC_IVAR____TtCV16MagnifierSupport13MFEnvironment12UserControls__pointSpeakFlashlightEnabled);

}

- (void)didToggleOutlineSwitch:(id)a3
{
  id v4;
  _TtC16MagnifierSupport32PointSpeakSettingsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_227423E60(v4, &OBJC_IVAR____TtCV16MagnifierSupport13MFEnvironment12UserControls__outlinePointSpeak);

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return sub_2273086CC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(unint64_t, _QWORD))sub_227420428);
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return sub_2273086CC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(unint64_t, _QWORD))sub_227420570);
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
  unint64_t v12;
  unsigned int v13;
  uint64_t v15;

  v4 = sub_22758CAD4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6, v7, v8, v9);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v12 = sub_22758CAC8();
  v13 = (v12 > 3) | (0xEu >> (v12 & 0xF));
  (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
  return v13 & 1;
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
  _TtC16MagnifierSupport32PointSpeakSettingsViewController *v15;
  uint64_t v16;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  sub_227422D94(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

- (void)colorPickerViewControllerDidSelectColor:(id)a3
{
  id v4;
  _TtC16MagnifierSupport32PointSpeakSettingsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_227423340(v4);

}

@end
