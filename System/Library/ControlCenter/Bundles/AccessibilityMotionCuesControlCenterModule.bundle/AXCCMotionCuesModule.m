@implementation AXCCMotionCuesModule

- (AXCCMotionCuesModule)init
{
  AXCCMotionCuesModule *v2;
  AXCCMotionCuesModuleViewController *v3;
  AXCCMotionCuesModuleViewController *contentViewController;
  AXCCMotionCuesModule *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXCCMotionCuesModule;
  v2 = -[AXCCMotionCuesModule init](&v7, sel_init);
  if (v2)
  {
    v3 = -[CCUIMenuModuleViewController initWithNibName:bundle:]([AXCCMotionCuesModuleViewController alloc], "initWithNibName:bundle:", 0, 0);
    contentViewController = v2->_contentViewController;
    v2->_contentViewController = v3;

    -[AXCCMotionCuesModuleViewController setModule:](v2->_contentViewController, "setModule:", v2);
    v5 = v2;
  }

  return v2;
}

- (AXCCMotionCuesModuleViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end
