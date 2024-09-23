@implementation SingleSelectLoggingCardViewController

- (void)viewDidLoad
{
  _TtC24MenstrualCyclesAppPlugin37SingleSelectLoggingCardViewController *v2;

  v2 = self;
  sub_231913400();

}

- (void)viewDidLayoutSubviews
{
  _TtC24MenstrualCyclesAppPlugin37SingleSelectLoggingCardViewController *v2;

  v2 = self;
  sub_231913640();

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  char *v6;
  int64_t result;
  uint64_t v8;
  uint64_t (*v9)(void);
  id v10;
  _TtC24MenstrualCyclesAppPlugin37SingleSelectLoggingCardViewController *v11;
  int64_t v12;

  v6 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37SingleSelectLoggingCardViewController_dataSource;
  result = MEMORY[0x2348EE70C]((char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37SingleSelectLoggingCardViewController_dataSource, a2, a3, a4);
  if (result)
  {
    v8 = *((_QWORD *)v6 + 1);
    swift_getObjectType();
    v9 = *(uint64_t (**)(void))(v8 + 8);
    v10 = a3;
    v11 = self;
    v12 = v9();

    swift_unknownObjectRelease();
    return v12;
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC24MenstrualCyclesAppPlugin37SingleSelectLoggingCardViewController *v11;
  _QWORD *v12;
  uint64_t v14;

  v6 = sub_231C9D438();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v10 = a3;
  v11 = self;
  v12 = sub_231913804(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC24MenstrualCyclesAppPlugin37SingleSelectLoggingCardViewController *v11;
  uint64_t v12;

  v6 = sub_231C9D438();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v10 = a3;
  v11 = self;
  sub_231913DA4(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
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

- (void).cxx_destruct
{
  sub_23190C114((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37SingleSelectLoggingCardViewController_dataSource);
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 0;
}

@end
