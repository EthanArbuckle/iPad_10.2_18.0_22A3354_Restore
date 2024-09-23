@implementation ActivityFilterCustomizationViewController

- (void)loadView
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[ActivityFilterCustomizationViewController loadView](&v3, sel_loadView);
  sub_2273FAEB0();

}

- (void)viewDidLoad
{
  _TtC16MagnifierSupport41ActivityFilterCustomizationViewController *v2;

  v2 = self;
  sub_2273FB17C();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC16MagnifierSupport41ActivityFilterCustomizationViewController *v4;

  v4 = self;
  sub_2273FB300(a3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport41ActivityFilterCustomizationViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16MagnifierSupport41ActivityFilterCustomizationViewController *)sub_2273FB4CC(v5, v7, a4);
}

- (_TtC16MagnifierSupport41ActivityFilterCustomizationViewController)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport41ActivityFilterCustomizationViewController *)sub_2273FB6C0(a3);
}

- (void).cxx_destruct
{
  uint64_t v3[35];

  sub_227338344((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport41ActivityFilterCustomizationViewController_activity, (uint64_t)v3);
  sub_22733F1C4(v3);
  sub_22731A0F0((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport41ActivityFilterCustomizationViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport41ActivityFilterCustomizationViewController_tableView));
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v5;
  id v6;
  _TtC16MagnifierSupport41ActivityFilterCustomizationViewController *v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  id v11;
  _TtC16MagnifierSupport41ActivityFilterCustomizationViewController *v12;

  if (a4 == 1)
  {
    v10 = qword_2558D4B88;
    v11 = a3;
    v12 = self;
    if (v10 != -1)
      swift_once();
    v9 = *(_QWORD *)(qword_2558F3CE0 + 16);

  }
  else if (a4)
  {
    return 0;
  }
  else
  {
    v5 = qword_2558D4B88;
    v6 = a3;
    v7 = self;
    if (v5 != -1)
      swift_once();
    v8 = *(_QWORD *)(qword_2558F3CE0 + 16);

    return 12 - v8;
  }
  return v9;
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
  _TtC16MagnifierSupport41ActivityFilterCustomizationViewController *v15;
  id v16;
  uint64_t v18;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  v16 = sub_2273FB9A8(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return v16;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  if (a4 != 1)
  {
    if (!a4)
    {
      sub_2273FADB4();
      if (v4)
        goto LABEL_4;
    }
LABEL_6:
    v5 = 0;
    return v5;
  }
  sub_2273FADB4();
  if (!v6)
    goto LABEL_6;
LABEL_4:
  v5 = (void *)sub_22758E1B4();
  swift_bridgeObjectRelease();
  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  uint64_t v4;
  void *v5;

  sub_2273FC39C(a4);
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
  _TtC16MagnifierSupport41ActivityFilterCustomizationViewController *v15;
  uint64_t v17;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  LOBYTE(self) = sub_2273FC49C();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return self & 1;
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
  _TtC16MagnifierSupport41ActivityFilterCustomizationViewController *v15;
  uint64_t v16;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  sub_2273FBE34(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

@end
