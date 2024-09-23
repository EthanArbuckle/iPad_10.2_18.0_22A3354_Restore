@implementation ActivitiesCustomizationViewController

- (void)_commitAndDismiss
{
  _TtC16MagnifierSupport37ActivitiesCustomizationViewController *v2;

  v2 = self;
  sub_22737B4EC();

}

- (void)viewDidLoad
{
  _TtC16MagnifierSupport37ActivitiesCustomizationViewController *v2;

  v2 = self;
  sub_22737B5F4();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC16MagnifierSupport37ActivitiesCustomizationViewController *v4;

  v4 = self;
  sub_22737B9CC(a3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport37ActivitiesCustomizationViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16MagnifierSupport37ActivitiesCustomizationViewController *)sub_22737BB94(v5, v7, a4);
}

- (_TtC16MagnifierSupport37ActivitiesCustomizationViewController)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport37ActivitiesCustomizationViewController *)sub_22737BFA8(a3);
}

- (void).cxx_destruct
{
  uint64_t v3[35];

  sub_22731A0F0((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport37ActivitiesCustomizationViewController_delegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport37ActivitiesCustomizationViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport37ActivitiesCustomizationViewController_commitActivityButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport37ActivitiesCustomizationViewController_activityNameOnBoardingController));
  sub_227338344((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport37ActivitiesCustomizationViewController_activityToBeDuped, (uint64_t)v3);
  sub_22733F1C4(v3);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4 == 1)
    return (*(_QWORD **)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MagnifierSupport37ActivitiesCustomizationViewController_activities))[2];
  else
    return a4 == 0;
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
  _TtC16MagnifierSupport37ActivitiesCustomizationViewController *v15;
  id v16;
  uint64_t v18;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  v16 = sub_22737D898();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return v16;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  uint64_t v4;
  void *v5;

  sub_22737E060(a4);
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

- (void)didToggleActivitySwitch:(id)a3
{
  id v4;
  _TtC16MagnifierSupport37ActivitiesCustomizationViewController *v5;

  v4 = a3;
  v5 = self;
  sub_22737E160((uint64_t)v4);

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
  _TtC16MagnifierSupport37ActivitiesCustomizationViewController *v15;
  uint64_t v16;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  sub_22737CA98(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
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
  _TtC16MagnifierSupport37ActivitiesCustomizationViewController *v15;
  id v16;
  uint64_t v18;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  v16 = sub_22737E5F4((uint64_t)v13);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return v16;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v5;
  _TtC16MagnifierSupport37ActivitiesCustomizationViewController *v6;
  id v7;

  if (MEMORY[0x2276B3E34]((char *)self + OBJC_IVAR____TtC16MagnifierSupport37ActivitiesCustomizationViewController_delegate, a2))
  {
    v5 = a3;
    v6 = self;
    v7 = sub_2274E445C();
    sub_22738BCA0();

    sub_2274F0D0C(1);
    swift_unknownObjectRelease();
  }
}

@end
