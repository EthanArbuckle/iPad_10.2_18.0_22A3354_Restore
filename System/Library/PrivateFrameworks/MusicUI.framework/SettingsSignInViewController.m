@implementation SettingsSignInViewController

- (void)viewWillAppear:(BOOL)a3
{
  _TtC7MusicUI28SettingsSignInViewController *v4;

  v4 = self;
  sub_21D43D0EC(a3);

}

- (void)signInController:(id)a3 didCompleteWithOperationsResults:(id)a4
{
  id v6;
  _TtC7MusicUI28SettingsSignInViewController *v7;

  sub_21D43DB9C();
  sub_21D7C4FC8();
  v6 = a3;
  v7 = self;
  sub_21D43D2C8();

  swift_bridgeObjectRelease();
}

- (void)signInControllerDidCancel:(id)a3
{
  id v4;
  _TtC7MusicUI28SettingsSignInViewController *v5;

  v4 = a3;
  v5 = self;
  sub_21D43D440();

}

- (_TtC7MusicUI28SettingsSignInViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_21D7C50F4();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC7MusicUI28SettingsSignInViewController *)sub_21D43DA00(v5, v7, a4);
}

- (_TtC7MusicUI28SettingsSignInViewController)initWithCoder:(id)a3
{
  return (_TtC7MusicUI28SettingsSignInViewController *)sub_21D43DAFC(a3);
}

@end
