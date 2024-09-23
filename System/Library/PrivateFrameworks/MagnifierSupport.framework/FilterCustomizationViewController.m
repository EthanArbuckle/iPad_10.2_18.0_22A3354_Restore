@implementation FilterCustomizationViewController

- (void)viewDidLoad
{
  _TtC16MagnifierSupport33FilterCustomizationViewController *v2;

  v2 = self;
  sub_2273DF898();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC16MagnifierSupport33FilterCustomizationViewController *v4;

  v4 = self;
  sub_2273DFA1C(a3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport33FilterCustomizationViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16MagnifierSupport33FilterCustomizationViewController *)sub_2273DFBCC(v5, v7, a4);
}

- (_TtC16MagnifierSupport33FilterCustomizationViewController)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport33FilterCustomizationViewController *)sub_2273DFD88(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport33FilterCustomizationViewController_tableView));
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v5;
  id v6;
  _TtC16MagnifierSupport33FilterCustomizationViewController *v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  id v11;
  _TtC16MagnifierSupport33FilterCustomizationViewController *v12;

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
  _TtC16MagnifierSupport33FilterCustomizationViewController *v15;
  id v16;
  uint64_t v18;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  v16 = sub_2273DFFE8(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return v16;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return sub_2273E0380((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t))sub_2273E09D8);
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return sub_2273E0380((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t))sub_2273E0AD8);
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
  _TtC16MagnifierSupport33FilterCustomizationViewController *v15;
  uint64_t v17;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  LOBYTE(self) = sub_2273E0BD8();

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
  _TtC16MagnifierSupport33FilterCustomizationViewController *v15;
  uint64_t v16;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  sub_2273E0478(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

@end
