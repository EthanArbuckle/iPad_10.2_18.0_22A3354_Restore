@implementation DebugFormatUploadViewController

- (_TtC8NewsFeed31DebugFormatUploadViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BAFAD3A4();
}

- (void)viewDidLoad
{
  _TtC8NewsFeed31DebugFormatUploadViewController *v2;

  v2 = self;
  sub_1BAFA7BC0();

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
  -[DebugFormatUploadViewController viewWillAppear:](&v7, sel_viewWillAppear_, v3);
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
  _TtC8NewsFeed31DebugFormatUploadViewController *v2;

  v2 = self;
  sub_1BAFA92BC();

}

- (_TtC8NewsFeed31DebugFormatUploadViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8NewsFeed31DebugFormatUploadViewController *result;

  v4 = a4;
  result = (_TtC8NewsFeed31DebugFormatUploadViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatUploadViewController_diffViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatUploadViewController_tableView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatUploadViewController____lazy_storage___nextBarButtonItem));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)doDismiss
{
  -[DebugFormatUploadViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (void)doNext
{
  _TtC8NewsFeed31DebugFormatUploadViewController *v2;

  v2 = self;
  sub_1BAFA9708();

}

- (void)doTocWithSender:(id)a3
{
  id v4;
  _TtC8NewsFeed31DebugFormatUploadViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1BAFA98E4((uint64_t)v4);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(_QWORD **)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatUploadViewController_filteredSections))[2];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4;

  if (a4 < 0)
  {
    __break(1u);
  }
  else
  {
    v4 = *(_QWORD *)(self + OBJC_IVAR____TtC8NewsFeed31DebugFormatUploadViewController_filteredSections);
    if (*(_QWORD *)(v4 + 16) > (unint64_t)a4)
      return *(_QWORD *)(*(_QWORD *)(v4 + 32 * a4 + 56) + 16);
  }
  __break(1u);
  return self;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC8NewsFeed31DebugFormatUploadViewController *v11;
  void *v12;
  uint64_t v14;

  v6 = sub_1BB86CBE0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BB86CBA4();
  v10 = a3;
  v11 = self;
  v12 = (void *)sub_1BAFAA43C();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC8NewsFeed31DebugFormatUploadViewController *v7;
  char *v8;

  v6 = a3;
  v7 = self;
  v8 = sub_1BAFAB138((uint64_t)v6, a4);

  return v8;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  uint64_t v4;
  void *v5;

  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  v4 = *(_QWORD *)((char *)self + OBJC_IVAR____TtC8NewsFeed31DebugFormatUploadViewController_filteredSections);
  if (*(_QWORD *)(v4 + 16) <= (unint64_t)a4)
  {
LABEL_8:
    __break(1u);
    return self;
  }
  if (*(_QWORD *)(v4 + 32 * a4 + 48))
  {
    swift_bridgeObjectRetain();
    v5 = (void *)sub_1BB872970();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _TtC8NewsFeed31DebugFormatUploadViewController *v14;
  uint64_t v15;

  v8 = sub_1BB86CBE0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BB86CBA4();
  v12 = a3;
  v13 = a4;
  v14 = self;
  sub_1BAFADFDC(v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  _TtC8NewsFeed31DebugFormatUploadViewController *v15;
  void (*v16)(char *, uint64_t);
  void *v17;
  uint64_t v19;

  v6 = sub_1BB86CBE0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BA4B07F0(0, &qword_1ED3B0568, v10, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v19 - v12;
  sub_1BB86CBA4();
  v14 = a3;
  v15 = self;
  sub_1BAFAB73C((uint64_t)v9, (uint64_t)v13);

  v16 = *(void (**)(char *, uint64_t))(v7 + 8);
  v16(v9, v6);
  v17 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v13, 1, v6) != 1)
  {
    v17 = (void *)sub_1BB86CB8C();
    v16(v13, v6);
  }
  return v17;
}

- (uint64_t)tableView:(void *)a3 didSelectRowAtIndexPath:
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  uint64_t v12;

  v5 = sub_1BB86CBE0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BB86CBA4();
  v9 = a3;
  v10 = a1;
  sub_1BAFAB998(v9, (uint64_t)v8);

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC8NewsFeed31DebugFormatUploadViewController *v11;
  uint64_t v13;

  v6 = sub_1BB86CBE0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BB86CBA4();
  v10 = a3;
  v11 = self;
  LOBYTE(self) = sub_1BAFAE1BC();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4;
  _TtC8NewsFeed31DebugFormatUploadViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1BAFABD68(v4);

}

@end
