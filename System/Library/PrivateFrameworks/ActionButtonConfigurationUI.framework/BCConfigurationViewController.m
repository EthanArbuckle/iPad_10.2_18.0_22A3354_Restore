@implementation BCConfigurationViewController

- (BCConfigurationViewController)initWithMode:(int64_t)a3 dismissHandler:(id)a4
{
  void *v5;
  uint64_t v6;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  return (BCConfigurationViewController *)ConfigurationViewController.init(mode:dismissHandler:)(a3, (uint64_t)sub_235E34E44, v6);
}

- (BCConfigurationViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_235E34464();
}

- (void)viewDidLoad
{
  BCConfigurationViewController *v2;

  v2 = self;
  sub_235E30DDC();

}

- (void)viewWillAppear:(BOOL)a3
{
  BCConfigurationViewController *v4;

  v4 = self;
  sub_235E30F64(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  BCConfigurationViewController *v4;

  v4 = self;
  sub_235E310EC(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  BCConfigurationViewController *v4;

  v4 = self;
  sub_235E31220(a3);

}

- (void)viewDidLayoutSubviews
{
  BCConfigurationViewController *v2;

  v2 = self;
  sub_235E31394();

}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)actionSelectorViewController:(id)a3 didSelectItemAtIndex:(int64_t)a4
{
  id v6;
  BCConfigurationViewController *v7;

  v6 = a3;
  v7 = self;
  sub_235E34544(a4);

}

- (BCConfigurationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  BCConfigurationViewController *result;

  v4 = a4;
  result = (BCConfigurationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___BCConfigurationViewController_selectorViewController));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___BCConfigurationViewController_actionDetailsView));
  sub_235E32F38(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR___BCConfigurationViewController_sceneParameterOverrides));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___BCConfigurationViewController_shortcutConfigurationViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___BCConfigurationViewController_originalNavigationBarTintColor));
}

@end
