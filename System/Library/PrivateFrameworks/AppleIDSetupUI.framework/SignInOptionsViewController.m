@implementation SignInOptionsViewController

- (void)viewDidLoad
{
  _TtC14AppleIDSetupUI27SignInOptionsViewController *v2;

  v2 = self;
  sub_2366EAFE0();

}

- (_TtC14AppleIDSetupUI27SignInOptionsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  _TtC14AppleIDSetupUI27SignInOptionsViewController *result;

  result = (_TtC14AppleIDSetupUI27SignInOptionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC14AppleIDSetupUI27SignInOptionsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v5;
  _TtC14AppleIDSetupUI27SignInOptionsViewController *result;

  v5 = a5;
  result = (_TtC14AppleIDSetupUI27SignInOptionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC14AppleIDSetupUI27SignInOptionsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  _TtC14AppleIDSetupUI27SignInOptionsViewController *result;

  result = (_TtC14AppleIDSetupUI27SignInOptionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC14AppleIDSetupUI27SignInOptionsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  id v6;
  _TtC14AppleIDSetupUI27SignInOptionsViewController *result;

  v6 = a5;
  result = (_TtC14AppleIDSetupUI27SignInOptionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC14AppleIDSetupUI27SignInOptionsViewController_appleIDLogoMicaView));
  sub_2366BDBF0((uint64_t)self + OBJC_IVAR____TtC14AppleIDSetupUI27SignInOptionsViewController_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)createAccountAction
{
  _TtC14AppleIDSetupUI27SignInOptionsViewController *v2;

  v2 = self;
  sub_2366EB778();

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(_QWORD **)((char *)&self->super.super.super.super._tab
                     + OBJC_IVAR____TtC14AppleIDSetupUI27SignInOptionsViewController_viewModel))[2];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC14AppleIDSetupUI27SignInOptionsViewController *v11;
  void *v12;
  uint64_t v14;

  v6 = sub_236735D94();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_236735D7C();
  v10 = a3;
  v11 = self;
  v12 = (void *)sub_2366EB904(v10);

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
  _TtC14AppleIDSetupUI27SignInOptionsViewController *v11;
  uint64_t v12;

  v6 = sub_236735D94();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_236735D7C();
  v10 = a3;
  v11 = self;
  sub_2366EBB28(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (double)tableView:heightForRowAtIndexPath:
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  double v4;
  uint64_t v6;

  v0 = sub_236735D94();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_236735D7C();
  v4 = *MEMORY[0x24BEBE770];
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

@end
