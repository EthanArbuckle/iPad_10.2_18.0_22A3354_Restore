@implementation PreferencesModalController

- (_TtC12GameCenterUIP33_C2AB98B87AF2030AFF6D71CAC9E6FA9326PreferencesModalController)initWithRootViewController:(id)a3
{
  return (_TtC12GameCenterUIP33_C2AB98B87AF2030AFF6D71CAC9E6FA9326PreferencesModalController *)sub_1AB5241E8(a3);
}

- (_TtC12GameCenterUIP33_C2AB98B87AF2030AFF6D71CAC9E6FA9326PreferencesModalController)initWithCoder:(id)a3
{
  sub_1AB5242A4();
}

- (void)viewDidLoad
{
  _TtC12GameCenterUIP33_C2AB98B87AF2030AFF6D71CAC9E6FA9326PreferencesModalController *v2;

  v2 = self;
  sub_1AB524330();

}

- (BOOL)canBecomeFirstResponder
{
  return OUTLINED_FUNCTION_0_32() & 1;
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  _TtC12GameCenterUIP33_C2AB98B87AF2030AFF6D71CAC9E6FA9326PreferencesModalController *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_1AB524420((int)v7, v8);

}

- (void)didTapDone
{
  _TtC12GameCenterUIP33_C2AB98B87AF2030AFF6D71CAC9E6FA9326PreferencesModalController *v2;

  v2 = self;
  sub_1AB52459C();

}

- (_TtC12GameCenterUIP33_C2AB98B87AF2030AFF6D71CAC9E6FA9326PreferencesModalController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  if (a3)
  {
    swift_getObjCClassMetadata();
    if (!a4)
      goto LABEL_5;
  }
  else if (!a4)
  {
LABEL_5:
    sub_1AB5246E0();
  }
  swift_getObjCClassMetadata();
  goto LABEL_5;
}

- (_TtC12GameCenterUIP33_C2AB98B87AF2030AFF6D71CAC9E6FA9326PreferencesModalController)initWithNibName:(id)a3 bundle:(id)a4
{
  return (_TtC12GameCenterUIP33_C2AB98B87AF2030AFF6D71CAC9E6FA9326PreferencesModalController *)sub_1AB5247A4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))sub_1AB52476C);
}

@end
