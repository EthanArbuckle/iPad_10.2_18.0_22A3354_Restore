@implementation ActivityPointSpeakCustomizationViewController

- (void)loadView
{
  _TtC16MagnifierSupport45ActivityPointSpeakCustomizationViewController *v2;

  v2 = self;
  sub_2274D673C();

}

- (void)viewDidLoad
{
  _TtC16MagnifierSupport45ActivityPointSpeakCustomizationViewController *v2;

  v2 = self;
  sub_2274D6B48();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport45ActivityPointSpeakCustomizationViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16MagnifierSupport45ActivityPointSpeakCustomizationViewController *)sub_2274D6DFC(v5, v7, a4);
}

- (_TtC16MagnifierSupport45ActivityPointSpeakCustomizationViewController)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport45ActivityPointSpeakCustomizationViewController *)sub_2274D70F0(a3);
}

- (void).cxx_destruct
{
  uint64_t v3[35];

  sub_22731A0F0((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport45ActivityPointSpeakCustomizationViewController_delegate);
  sub_227338344((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport45ActivityPointSpeakCustomizationViewController_activity, (uint64_t)v3);
  sub_22733F1C4(v3);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport45ActivityPointSpeakCustomizationViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport45ActivityPointSpeakCustomizationViewController_colorPickerController));
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result;

  result = 1;
  switch(a4)
  {
    case 0:
    case 3:
      return result;
    case 1:
      result = (*(_QWORD **)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16MagnifierSupport45ActivityPointSpeakCustomizationViewController_availablePointSpeakFeedbacks))[2];
      break;
    case 2:
    case 4:
      result = 2;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (void)togglePointSpeakSwitchChanged:(id)a3
{
  id v5;
  _TtC16MagnifierSupport45ActivityPointSpeakCustomizationViewController *v6;

  if (MEMORY[0x2276B3E34]((char *)self + OBJC_IVAR____TtC16MagnifierSupport45ActivityPointSpeakCustomizationViewController_delegate, a2))
  {
    if (a3)
    {
      v5 = a3;
      v6 = self;
      sub_2273ECE10((uint64_t)objc_msgSend(v5, sel_isOn));

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
  _TtC16MagnifierSupport45ActivityPointSpeakCustomizationViewController *v15;
  id v16;
  uint64_t v18;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  v16 = sub_2274D74F4(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return v16;
}

- (void)didToggleFeedbackSwitch:(id)a3
{
  id v4;
  _TtC16MagnifierSupport45ActivityPointSpeakCustomizationViewController *v5;

  v4 = a3;
  v5 = self;
  sub_2274D8800(v4);

}

- (void)didToggleFlashlightSwitch:(id)a3
{
  sub_2274D8B3C((char *)self, (uint64_t)a2, a3, (void (*)(id))sub_2273ED1C0);
}

- (void)didToggleOutlineSwitch:(id)a3
{
  sub_2274D8B3C((char *)self, (uint64_t)a2, a3, (void (*)(id))sub_2273ED630);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return sub_22733E87C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(unint64_t, _QWORD))sub_2274D63D0);
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return sub_22733E87C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(unint64_t, _QWORD))sub_2274D6534);
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
  v12 = sub_22758CAC8() != 1;
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
  _TtC16MagnifierSupport45ActivityPointSpeakCustomizationViewController *v15;
  uint64_t v16;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  sub_2274D8C64(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

- (void)colorPickerViewControllerDidSelectColor:(id)a3
{
  id v4;
  _TtC16MagnifierSupport45ActivityPointSpeakCustomizationViewController *v5;

  v4 = a3;
  v5 = self;
  sub_2274D90BC(v4);

}

@end
