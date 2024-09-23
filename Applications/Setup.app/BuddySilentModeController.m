@implementation BuddySilentModeController

- (int64_t)preferredStatusBarStyle
{
  _TtC5Setup25BuddySilentModeController *v2;
  id v3;
  id v4;

  v2 = self;
  v3 = -[BuddySilentModeController traitCollection](v2, "traitCollection");
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4 == (id)2)
    return 1;
  else
    return 3;
}

- (_TtC5Setup25BuddySilentModeController)init
{
  return (_TtC5Setup25BuddySilentModeController *)sub_100008590();
}

- (void)viewDidLoad
{
  _TtC5Setup25BuddySilentModeController *v2;

  v2 = self;
  sub_100008788();

}

- (void)continueTapped
{
  BFFFlowItemDelegate *v2;
  BFFFlowItemDelegate *v3;
  _TtC5Setup25BuddySilentModeController *v4;

  v4 = self;
  v2 = -[BuddyWelcomeController delegate](v4, "delegate");
  if (v2)
  {
    v3 = v2;
    -[BFFFlowItemDelegate flowItemDone:](v2, "flowItemDone:", v4);

    swift_unknownObjectRelease(v3);
  }
  else
  {

  }
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

- (_TtC5Setup25BuddySilentModeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC5Setup25BuddySilentModeController *result;

  result = (_TtC5Setup25BuddySilentModeController *)_swift_stdlib_reportUnimplementedInitializer("Setup.BuddySilentModeController", 31, "init(title:detailText:symbolName:contentLayout:)", 48, 0, a6);
  __break(1u);
  return result;
}

- (_TtC5Setup25BuddySilentModeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  uint64_t v7;
  _TtC5Setup25BuddySilentModeController *result;

  v6 = a5;
  result = (_TtC5Setup25BuddySilentModeController *)_swift_stdlib_reportUnimplementedInitializer("Setup.BuddySilentModeController", 31, "init(title:detailText:icon:contentLayout:)", 42, 0, v7);
  __break(1u);
  return result;
}

@end
