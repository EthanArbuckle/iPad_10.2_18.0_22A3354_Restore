@implementation ActivityDoorDetectionCustomizationViewController

- (void)loadView
{
  _TtC16MagnifierSupport48ActivityDoorDetectionCustomizationViewController *v2;

  v2 = self;
  sub_2274AF278();

}

- (void)viewDidLoad
{
  _TtC16MagnifierSupport48ActivityDoorDetectionCustomizationViewController *v2;

  v2 = self;
  sub_2274AF69C();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport48ActivityDoorDetectionCustomizationViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16MagnifierSupport48ActivityDoorDetectionCustomizationViewController *)sub_2274AFA48(v5, v7, a4);
}

- (_TtC16MagnifierSupport48ActivityDoorDetectionCustomizationViewController)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport48ActivityDoorDetectionCustomizationViewController *)sub_2274AFD88(a3);
}

- (void).cxx_destruct
{
  uint64_t v3[35];

  sub_22731A0F0((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport48ActivityDoorDetectionCustomizationViewController_delegate);
  sub_22731A160((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport48ActivityDoorDetectionCustomizationViewController_activity, (uint64_t)v3, (uint64_t *)&unk_2558D7870);
  sub_22733F1C4(v3);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport48ActivityDoorDetectionCustomizationViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport48ActivityDoorDetectionCustomizationViewController_colorPickerController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport48ActivityDoorDetectionCustomizationViewController_doorAttributesController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport48ActivityDoorDetectionCustomizationViewController_magnifierModelsManger));
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC16MagnifierSupport48ActivityDoorDetectionCustomizationViewController *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_2274B317C(a4);

  return v8;
}

- (void)toggleDoorDetectionSwitchChanged:(id)a3
{
  id v5;
  _TtC16MagnifierSupport48ActivityDoorDetectionCustomizationViewController *v6;

  if (MEMORY[0x2276B3E34]((char *)self + OBJC_IVAR____TtC16MagnifierSupport48ActivityDoorDetectionCustomizationViewController_delegate, a2))
  {
    if (a3)
    {
      v5 = a3;
      v6 = self;
      sub_2273EA878((uint64_t)objc_msgSend(v5, sel_isOn));

      swift_unknownObjectRelease();
    }
    else
    {
      __break(1u);
    }
  }
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
  _TtC16MagnifierSupport48ActivityDoorDetectionCustomizationViewController *v15;
  id v16;
  uint64_t v18;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  v16 = sub_2274B0208(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return v16;
}

- (void)didToggleFeedbackSwitch:(id)a3
{
  id v4;
  _TtC16MagnifierSupport48ActivityDoorDetectionCustomizationViewController *v5;

  v4 = a3;
  v5 = self;
  sub_2274B22C8(v4);

}

- (void)didToggleBackTapSwitch:(id)a3
{
  sub_2274B2638((char *)self, (uint64_t)a2, a3, (void (*)(id))sub_2273E9314);
}

- (void)didToggleDecorationsSwitch:(id)a3
{
  sub_2274B2638((char *)self, (uint64_t)a2, a3, (void (*)(id))sub_2273E8EAC);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return sub_2274B26D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(void))sub_2274AEBD8);
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return sub_2274B26D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(void))sub_2274AEDF0);
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
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
  _TtC16MagnifierSupport48ActivityDoorDetectionCustomizationViewController *v15;
  unint64_t v16;
  uint64_t v18;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  v16 = sub_22758CAC8();
  LODWORD(a3) = sub_2274B3154(v16);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return (_DWORD)a3 != 3;
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
  _TtC16MagnifierSupport48ActivityDoorDetectionCustomizationViewController *v15;
  uint64_t v16;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  sub_2274B27EC(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

- (void)colorPickerViewControllerDidSelectColor:(id)a3
{
  id v4;
  _TtC16MagnifierSupport48ActivityDoorDetectionCustomizationViewController *v5;

  v4 = a3;
  v5 = self;
  sub_2274B2F54(v4);

}

@end
