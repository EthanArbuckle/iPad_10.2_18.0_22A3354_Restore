@implementation D2DSetupFinishViewController

- (void)viewDidLoad
{
  _TtC18SharingViewService28D2DSetupFinishViewController *v2;

  v2 = self;
  sub_1000A6D98();

}

- (void)viewWillAppear:(BOOL)a3
{
  sub_1000A70EC(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillAppear_, sub_10009F1FC);
}

- (void)viewDidDisappear:(BOOL)a3
{
  sub_1000A70EC(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidDisappear_, sub_10009F30C);
}

- (_TtC18SharingViewService28D2DSetupFinishViewController)initWithContentView:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for D2DSetupFinishViewController();
  return -[D2DSetupBaseViewController initWithContentView:](&v5, "initWithContentView:", a3);
}

@end
