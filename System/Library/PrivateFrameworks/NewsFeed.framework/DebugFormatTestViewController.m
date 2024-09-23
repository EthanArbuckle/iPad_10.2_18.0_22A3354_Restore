@implementation DebugFormatTestViewController

- (_TtC8NewsFeed29DebugFormatTestViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BB65FF64();
}

- (void)viewDidLoad
{
  _TtC8NewsFeed29DebugFormatTestViewController *v2;

  v2 = self;
  sub_1BB65BD58();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = v7.receiver;
  -[DebugFormatTestViewController viewWillAppear:](&v7, sel_viewWillAppear_, v3);
  v5 = objc_msgSend(v4, sel_navigationController, v7.receiver, v7.super_class);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_setToolbarHidden_animated_, 0, 0);

    v4 = v6;
  }

}

- (void)viewWillLayoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType();
  v2 = (char *)v14.receiver;
  -[DebugFormatTestViewController viewWillLayoutSubviews](&v14, sel_viewWillLayoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed29DebugFormatTestViewController_tableView];
  v4 = objc_msgSend(v2, sel_view, v14.receiver, v14.super_class);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, sel_bounds);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    objc_msgSend(v3, sel_setFrame_, v7, v9, v11, v13);
    objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC8NewsFeed29DebugFormatTestViewController_toolbarLabel], sel_sizeToFit);

  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[DebugFormatTestViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  sub_1BB86FDA8();

}

- (_TtC8NewsFeed29DebugFormatTestViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8NewsFeed29DebugFormatTestViewController *result;

  v4 = a4;
  result = (_TtC8NewsFeed29DebugFormatTestViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _BYTE v3[336];

  memcpy(v3, (char *)self + OBJC_IVAR____TtC8NewsFeed29DebugFormatTestViewController_packages, sizeof(v3));
  sub_1BAF8FB4C((uint64_t)v3);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatTestViewController_tableView));
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatTestViewController_toolbarLabel));
}

- (void)stopTests
{
  _TtC8NewsFeed29DebugFormatTestViewController *v2;

  v2 = self;
  sub_1BB65CFB4();

}

- (void)runTests
{
  _TtC8NewsFeed29DebugFormatTestViewController *v2;

  v2 = self;
  sub_1BB65CA68();

}

- (void)showTOCWithSender:(id)a3
{
  id v4;
  _TtC8NewsFeed29DebugFormatTestViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1BB65D2A4((uint64_t)v4);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(_QWORD **)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatTestViewController_sections))[2];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;

  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  v4 = *(_QWORD *)(self + OBJC_IVAR____TtC8NewsFeed29DebugFormatTestViewController_sections);
  if (*(_QWORD *)(v4 + 16) <= (unint64_t)a4)
  {
LABEL_9:
    __break(1u);
    return self;
  }
  v5 = v4 + 40 * a4;
  v6 = v5 + 32;
  v7 = *(unsigned __int8 *)(v5 + 64) >> 6;
  if (!v7)
    return *(_QWORD *)(*(_QWORD *)v6 + 16);
  if (v7 == 1)
  {
    v6 += 16;
    return *(_QWORD *)(*(_QWORD *)v6 + 16);
  }
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC8NewsFeed29DebugFormatTestViewController *v11;
  void *v12;
  uint64_t v14;

  v6 = sub_1BB86CBE0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BB86CBA4();
  v10 = a3;
  v11 = self;
  v12 = (void *)sub_1BB65DE74();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v4;
  int v5;
  void *v6;

  if (a4 < 0)
  {
    __break(1u);
  }
  else
  {
    v4 = *(_QWORD *)((char *)self + OBJC_IVAR____TtC8NewsFeed29DebugFormatTestViewController_sections);
    if (*(_QWORD *)(v4 + 16) > (unint64_t)a4)
    {
      v5 = *(unsigned __int8 *)(v4 + 40 * a4 + 64) >> 6;
      if (v5)
      {
        if (v5 != 1)
        {
          v6 = 0;
          return v6;
        }
        sub_1BB24290C();
      }
      v6 = (void *)sub_1BB872970();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  __break(1u);
  return self;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  v4 = self;
  v5 = *(_QWORD *)((char *)self + OBJC_IVAR____TtC8NewsFeed29DebugFormatTestViewController_sections);
  if (*(_QWORD *)(v5 + 16) <= (unint64_t)a4)
  {
LABEL_9:
    __break(1u);
    return self;
  }
  v6 = v5 + 40 * a4;
  v7 = *(_BYTE *)(v6 + 64);
  if ((v7 & 0xC0) != 0x40)
    goto LABEL_6;
  v8 = (uint64_t *)(v6 + 32);
  v10 = v8[2];
  v9 = v8[3];
  v12 = *v8;
  v11 = v8[1];
  v13 = a3;
  v14 = v4;
  sub_1BB65FE10(v12, v11, v10, v9, v7);
  sub_1BB64DB2C();
  v16 = v15;
  sub_1BB65FDA0(v12, v11, v10, v9, v7);

  if (v16)
  {
    v17 = (void *)sub_1BB872970();
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_6:
    v17 = 0;
  }
  return v17;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC8NewsFeed29DebugFormatTestViewController *v11;
  uint64_t v12;

  v6 = sub_1BB86CBE0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BB86CBA4();
  v10 = a3;
  v11 = self;
  sub_1BB65ED90(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end
