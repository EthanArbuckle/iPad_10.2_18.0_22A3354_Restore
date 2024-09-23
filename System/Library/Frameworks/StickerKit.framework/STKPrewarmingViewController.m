@implementation STKPrewarmingViewController

- (void)viewDidLoad
{
  STKPrewarmingViewController *v2;

  v2 = self;
  PrewarmingViewController.viewDidLoad()();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dealloc
{
  STKPrewarmingViewController *v2;

  v2 = self;
  PrewarmingViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{

}

- (STKPrewarmingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_class *ObjectType;
  id v8;
  id v9;
  STKPrewarmingViewController *v10;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_234717754();
    *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___STKPrewarmingViewController_assertion) = 0;
    *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___STKPrewarmingViewController_processHandle) = 0;
    v8 = a4;
    a3 = (id)sub_234717730();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___STKPrewarmingViewController_assertion) = 0;
    *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___STKPrewarmingViewController_processHandle) = 0;
    v9 = a4;
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = -[STKPrewarmingViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, a3, a4);

  return v10;
}

- (STKPrewarmingViewController)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___STKPrewarmingViewController_assertion) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___STKPrewarmingViewController_processHandle) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[STKPrewarmingViewController initWithCoder:](&v7, sel_initWithCoder_, a3);
}

@end
