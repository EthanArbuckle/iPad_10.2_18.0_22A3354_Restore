@implementation InternalPeopleDetectionOptionsViewController

- (void)viewDidLoad
{
  _TtC16MagnifierSupport44InternalPeopleDetectionOptionsViewController *v2;

  v2 = self;
  sub_2273C0690();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC16MagnifierSupport44InternalPeopleDetectionOptionsViewController *v4;

  v4 = self;
  sub_2273C081C(a3);

}

- (_TtC16MagnifierSupport44InternalPeopleDetectionOptionsViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16MagnifierSupport44InternalPeopleDetectionOptionsViewController *)sub_2273C0934(v5, v7, a4);
}

- (_TtC16MagnifierSupport44InternalPeopleDetectionOptionsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2273C4C34();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport44InternalPeopleDetectionOptionsViewController_tableView));
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(_QWORD **)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport44InternalPeopleDetectionOptionsViewController_availableInternalPeopleDetectionSections))[2];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC16MagnifierSupport44InternalPeopleDetectionOptionsViewController *v7;
  int64_t v8;
  int64_t v9;

  v6 = a3;
  v7 = self;
  sub_2273C4D8C(a4);
  v9 = v8;

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
  _TtC16MagnifierSupport44InternalPeopleDetectionOptionsViewController *v15;
  void *v16;
  void *v17;
  uint64_t v19;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  sub_2273C0C90(v14);
  v17 = v16;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return v17;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v4;
  void *v5;

  v4 = *(_QWORD *)((char *)self
                 + OBJC_IVAR____TtC16MagnifierSupport44InternalPeopleDetectionOptionsViewController_availableInternalPeopleDetectionSections);
  if (*(_QWORD *)(v4 + 16) <= a4)
  {
    v5 = 0;
    return v5;
  }
  if ((a4 & 0x8000000000000000) == 0)
  {
    sub_22737F1E0(*(_BYTE *)(v4 + a4 + 32));
    v5 = (void *)sub_22758E1B4();
    swift_bridgeObjectRelease();
    return v5;
  }
  __break(1u);
  return self;
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
  _TtC16MagnifierSupport44InternalPeopleDetectionOptionsViewController *v15;
  uint64_t v16;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  sub_2273C15FC(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
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
  _TtC16MagnifierSupport44InternalPeopleDetectionOptionsViewController *v15;
  uint64_t v17;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  LOBYTE(self) = sub_2273C4E78();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return self & 1;
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

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  _TtC16MagnifierSupport44InternalPeopleDetectionOptionsViewController *v17;
  uint64_t v18;

  v8 = sub_22758CAD4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10, v11, v12, v13);
  v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v16 = a3;
  v17 = self;
  sub_2273C27F0(v16, a4, (unint64_t)v15);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v15, v8);
}

@end
