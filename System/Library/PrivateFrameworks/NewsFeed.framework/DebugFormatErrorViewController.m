@implementation DebugFormatErrorViewController

- (_TtC8NewsFeed30DebugFormatErrorViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  objc_class *v9;
  _TtC8NewsFeed30DebugFormatErrorViewController *result;

  v5 = OBJC_IVAR____TtC8NewsFeed30DebugFormatErrorViewController_tableView;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3D48]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_style_, 1, 0.0, 0.0, 0.0, 0.0);
  v8 = OBJC_IVAR____TtC8NewsFeed30DebugFormatErrorViewController_styler;
  type metadata accessor for DebugFormatStyler();
  v9 = (objc_class *)swift_allocObject();
  *((_QWORD *)v9 + 2) = 0;
  *(Class *)((char *)&self->super.super.super.isa + v8) = v9;

  result = (_TtC8NewsFeed30DebugFormatErrorViewController *)sub_1BB873EAC();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC8NewsFeed30DebugFormatErrorViewController *v2;

  v2 = self;
  sub_1BB5E3E74();

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
  -[DebugFormatErrorViewController viewWillLayoutSubviews](&v14, sel_viewWillLayoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed30DebugFormatErrorViewController_tableView];
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
  }
  else
  {
    __break(1u);
  }
}

- (_TtC8NewsFeed30DebugFormatErrorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8NewsFeed30DebugFormatErrorViewController *result;

  v4 = a4;
  result = (_TtC8NewsFeed30DebugFormatErrorViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugFormatErrorViewController_errorModel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugFormatErrorViewController_tableView));
  swift_release();
  swift_release();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return *(_QWORD *)(*(_QWORD *)((char *)&self->super.super._responderFlags
                               + OBJC_IVAR____TtC8NewsFeed30DebugFormatErrorViewController_errorModel)
                   + 16);
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
    v4 = *(_QWORD *)(self + OBJC_IVAR____TtC8NewsFeed30DebugFormatErrorViewController_errorModel + 8);
    if (*(_QWORD *)(v4 + 16) > (unint64_t)a4)
      return *(_QWORD *)(*(_QWORD *)(v4 + 24 * a4 + 48) + 16);
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
  _TtC8NewsFeed30DebugFormatErrorViewController *v11;
  void *v12;
  uint64_t v14;

  v6 = sub_1BB86CBE0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BB86CBA4();
  v10 = a3;
  v11 = self;
  v12 = (void *)sub_1BB5E4254();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;

  if (a4 < 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)(*(_QWORD *)((char *)self
                                  + OBJC_IVAR____TtC8NewsFeed30DebugFormatErrorViewController_errorModel
                                  + 8)
                      + 16) > (unint64_t)a4)
  {
    swift_bridgeObjectRetain();
    v4 = (void *)sub_1BB872970();
    swift_bridgeObjectRelease();
    return v4;
  }
  __break(1u);
  return self;
}

@end
