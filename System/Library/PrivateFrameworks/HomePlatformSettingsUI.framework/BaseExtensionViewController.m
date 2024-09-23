@implementation BaseExtensionViewController

- (_TtC22HomePlatformSettingsUI27BaseExtensionViewController)init
{
  return (_TtC22HomePlatformSettingsUI27BaseExtensionViewController *)sub_224D9E59C();
}

- (_TtC22HomePlatformSettingsUI27BaseExtensionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_224DA4118();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC22HomePlatformSettingsUI27BaseExtensionViewController *)sub_224D9E68C(v5, v7, a4);
}

- (_TtC22HomePlatformSettingsUI27BaseExtensionViewController)initWithCoder:(id)a3
{
  return (_TtC22HomePlatformSettingsUI27BaseExtensionViewController *)sub_224D9E808(a3);
}

- (void)viewDidLoad
{
  uint64_t v2;
  uint64_t v3;
  _TtC22HomePlatformSettingsUI27BaseExtensionViewController *v4;

  v4 = self;
  sub_224D9E910((uint64_t)v4, v2, v3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_hostVC));
  sub_224D98BB4(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_launchAnalytics), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_launchAnalytics));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_remoteVCClient));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22HomePlatformSettingsUI27BaseExtensionViewController_spinner));
}

@end
