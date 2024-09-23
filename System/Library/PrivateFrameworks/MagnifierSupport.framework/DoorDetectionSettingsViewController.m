@implementation DoorDetectionSettingsViewController

- (void)viewDidLoad
{
  _TtC16MagnifierSupport35DoorDetectionSettingsViewController *v2;

  v2 = self;
  sub_227328F2C();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC16MagnifierSupport35DoorDetectionSettingsViewController *v4;

  v4 = self;
  sub_2273297A8(a3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport35DoorDetectionSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16MagnifierSupport35DoorDetectionSettingsViewController *)sub_227329958(v5, v7, a4);
}

- (_TtC16MagnifierSupport35DoorDetectionSettingsViewController)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport35DoorDetectionSettingsViewController *)sub_227329C44(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport35DoorDetectionSettingsViewController_tableView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport35DoorDetectionSettingsViewController_colorPickerController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport35DoorDetectionSettingsViewController_doorAttributesController));
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC16MagnifierSupport35DoorDetectionSettingsViewController *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_22732D7A8(a4);

  return v8;
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
  _TtC16MagnifierSupport35DoorDetectionSettingsViewController *v15;
  id v16;
  uint64_t v18;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  v16 = sub_227329FA8(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return v16;
}

- (void)didToggleFeedbackSwitch:(id)a3
{
  id v4;
  _TtC16MagnifierSupport35DoorDetectionSettingsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_22732E1E8(v4);

}

- (void)didToggleBackTapSwitch:(id)a3
{
  id v4;
  _TtC16MagnifierSupport35DoorDetectionSettingsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_22732E5B0(v4);

}

- (void)didToggleDecorationsSwitch:(id)a3
{
  id v4;
  _TtC16MagnifierSupport35DoorDetectionSettingsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_22732E728(v4);

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return sub_22732C0FC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(unint64_t, _QWORD))sub_227328898);
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return sub_22732C0FC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(unint64_t, _QWORD))sub_227328AAC);
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
  v12 = sub_22732EC70();
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
  _TtC16MagnifierSupport35DoorDetectionSettingsViewController *v15;
  uint64_t v16;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  sub_22732C1D0(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

- (void)colorPickerViewControllerDidSelectColor:(id)a3
{
  id v4;
  _TtC16MagnifierSupport35DoorDetectionSettingsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_22732CBBC(v4);

}

@end
