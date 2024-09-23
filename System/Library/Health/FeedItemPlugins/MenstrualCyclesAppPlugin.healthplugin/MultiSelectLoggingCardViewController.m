@implementation MultiSelectLoggingCardViewController

- (void)viewDidLoad
{
  _TtC24MenstrualCyclesAppPlugin36MultiSelectLoggingCardViewController *v2;

  v2 = self;
  sub_23197E7C8();

}

- (void)viewLayoutMarginsDidChange
{
  char *v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  -[MultiSelectLoggingCardViewController viewLayoutMarginsDidChange](&v4, sel_viewLayoutMarginsDidChange);
  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25LoggingCardViewController_tableView], sel_tableHeaderView, v4.receiver, v4.super_class);

  if (v3)
    sub_23197EAF0();

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC24MenstrualCyclesAppPlugin36MultiSelectLoggingCardViewController *v11;
  _QWORD *v12;
  uint64_t v14;

  v6 = sub_231C9D438();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v10 = a3;
  v11 = self;
  v12 = sub_23197ED18(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  char *v7;
  int64_t result;
  uint64_t v9;
  uint64_t ObjectType;
  uint64_t (*v11)(int64_t, _TtC24MenstrualCyclesAppPlugin36MultiSelectLoggingCardViewController *, uint64_t, uint64_t);
  id v12;
  _TtC24MenstrualCyclesAppPlugin36MultiSelectLoggingCardViewController *v13;
  int64_t v14;

  v7 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36MultiSelectLoggingCardViewController_dataSource;
  result = MEMORY[0x2348EE70C]((char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36MultiSelectLoggingCardViewController_dataSource, a2);
  if (result)
  {
    v9 = *((_QWORD *)v7 + 1);
    ObjectType = swift_getObjectType();
    v11 = *(uint64_t (**)(int64_t, _TtC24MenstrualCyclesAppPlugin36MultiSelectLoggingCardViewController *, uint64_t, uint64_t))(v9 + 16);
    v12 = a3;
    v13 = self;
    v14 = v11(a4, v13, ObjectType, v9);

    swift_unknownObjectRelease();
    return v14;
  }
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  char *v4;
  uint64_t v5;
  uint64_t ObjectType;
  int64_t v7;

  v4 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36MultiSelectLoggingCardViewController_dataSource;
  if (!MEMORY[0x2348EE70C]((char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36MultiSelectLoggingCardViewController_dataSource, a2, a3))return 1;
  v5 = *((_QWORD *)v4 + 1);
  ObjectType = swift_getObjectType();
  v7 = (*(uint64_t (**)(_TtC24MenstrualCyclesAppPlugin36MultiSelectLoggingCardViewController *, uint64_t, uint64_t))(v5 + 24))(self, ObjectType, v5);
  swift_unknownObjectRelease();
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC24MenstrualCyclesAppPlugin36MultiSelectLoggingCardViewController *v11;
  uint64_t v12;

  v6 = sub_231C9D438();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v10 = a3;
  v11 = self;
  sub_23197F410(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC24MenstrualCyclesAppPlugin36MultiSelectLoggingCardViewController *v7;
  void *v8;

  v6 = a3;
  v7 = self;
  v8 = (void *)sub_23197FC5C(v6, a4);

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  char *v6;
  double result;
  uint64_t v8;
  uint64_t ObjectType;
  double v10;

  v6 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36MultiSelectLoggingCardViewController_dataSource;
  if (MEMORY[0x2348EE70C]((char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36MultiSelectLoggingCardViewController_dataSource, a2, a3))
  {
    v8 = *((_QWORD *)v6 + 1);
    ObjectType = swift_getObjectType();
    v10 = (*(double (**)(_TtC24MenstrualCyclesAppPlugin36MultiSelectLoggingCardViewController *, int64_t, uint64_t, uint64_t))(v8 + 56))(self, a4, ObjectType, v8);
    swift_unknownObjectRelease();
    return v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;

  v6 = sub_231C9D438();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  objc_msgSend(a4, sel__setShouldHaveFullLengthBottomSeparator_, 1);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)respondToSizeCategoryChanges
{
  _TtC24MenstrualCyclesAppPlugin36MultiSelectLoggingCardViewController *v2;

  v2 = self;
  sub_231980360();

}

- (void).cxx_destruct
{
  sub_23190C114((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36MultiSelectLoggingCardViewController_dataSource);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36MultiSelectLoggingCardViewController_tableHeader));
  swift_bridgeObjectRelease();
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t ObjectType;
  char v10;

  v6 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36MultiSelectLoggingCardViewController_dataSource;
  v7 = MEMORY[0x2348EE70C]((char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin36MultiSelectLoggingCardViewController_dataSource, a2, a3);
  if (v7)
  {
    v8 = *((_QWORD *)v6 + 1);
    ObjectType = swift_getObjectType();
    v10 = (*(uint64_t (**)(_TtC24MenstrualCyclesAppPlugin36MultiSelectLoggingCardViewController *, int64_t, uint64_t, uint64_t))(v8 + 64))(self, a4, ObjectType, v8);
    swift_unknownObjectRelease();
    LOBYTE(v7) = v10 & 1;
  }
  else
  {
    __break(1u);
  }
  return v7;
}

@end
