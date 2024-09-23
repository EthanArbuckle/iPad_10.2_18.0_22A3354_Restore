@implementation PeopleDetectionSettingsViewController

- (void)viewDidLoad
{
  _TtC16MagnifierSupport37PeopleDetectionSettingsViewController *v2;

  v2 = self;
  sub_2273F0A5C();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC16MagnifierSupport37PeopleDetectionSettingsViewController *v4;

  v4 = self;
  sub_2273F10CC(a3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport37PeopleDetectionSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16MagnifierSupport37PeopleDetectionSettingsViewController *)sub_2273F127C(v5, v7, a4);
}

- (_TtC16MagnifierSupport37PeopleDetectionSettingsViewController)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport37PeopleDetectionSettingsViewController *)sub_2273F1520(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport37PeopleDetectionSettingsViewController_tableView));
  swift_release();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v4;

  if (a4 == 2)
    return (*(_QWORD **)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MagnifierSupport37PeopleDetectionSettingsViewController_availableDetectionFeedbacks))[2];
  v4 = 2;
  if (a4)
    v4 = 0;
  if (a4 == 1)
    return 1;
  else
    return v4;
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
  _TtC16MagnifierSupport37PeopleDetectionSettingsViewController *v15;
  id v16;
  uint64_t v18;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  v16 = sub_2273F1800(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return v16;
}

- (void)didToggleFeedbackSwitch:(id)a3
{
  id v4;
  _TtC16MagnifierSupport37PeopleDetectionSettingsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_2273F239C(v4);

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return sub_2273F2214((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(unint64_t))sub_2273F070C);
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return sub_2273F2214((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(unint64_t))sub_2273F08A0);
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
  v12 = sub_22758CAC8() != 2;
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
  _TtC16MagnifierSupport37PeopleDetectionSettingsViewController *v15;
  uint64_t v16;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  sub_2273F2764(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

@end
