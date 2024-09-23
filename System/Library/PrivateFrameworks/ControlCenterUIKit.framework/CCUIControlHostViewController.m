@implementation CCUIControlHostViewController

- (CHSControlIdentity)identity
{
  return (CHSControlIdentity *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                       + OBJC_IVAR___CCUIControlHostViewController_identity));
}

- (unint64_t)type
{
  return *(unint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIControlHostViewController_type);
}

- (CCUIControlHostViewControllerDelegate)delegate
{
  return (CCUIControlHostViewControllerDelegate *)(id)MEMORY[0x1D17E090C]((char *)self+ OBJC_IVAR___CCUIControlHostViewController_delegate, a2);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (CCUIContentModuleContext)contentModuleContext
{
  return (CCUIContentModuleContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                             + OBJC_IVAR___CCUIControlHostViewController_contentModuleContext));
}

- (void)setContentModuleContext:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIControlHostViewController_contentModuleContext);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIControlHostViewController_contentModuleContext) = (Class)a3;
  v3 = a3;

}

- (CCUIControlHostViewController)initWithIdentity:(id)a3 type:(unint64_t)a4 contentType:(unint64_t)a5 configurationIdentifier:(id)a6
{
  sub_1D031D538();
  return (CCUIControlHostViewController *)sub_1D0318CB8(a3, a4, a5);
}

- (CCUIControlHostViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _sSo29CCUIControlHostViewControllerC18ControlCenterUIKitE5coderABSgSo7NSCoderC_tcfc_0();
}

- (void)dealloc
{
  void *v2;
  CCUIControlHostViewController *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIControlHostViewController_controlInstance);
  v3 = self;
  objc_msgSend(v2, sel_invalidate);
  v4.receiver = v3;
  v4.super_class = (Class)CCUIControlHostViewController;
  -[CCUIControlHostViewController dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{

  sub_1D0317E4C((uint64_t)self + OBJC_IVAR___CCUIControlHostViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CCUIControlHostViewController_contentModuleContext));

}

- (void)loadView
{
  CCUIControlHostViewController *v2;

  v2 = self;
  CCUIControlHostViewController.loadView()();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (double)preferredExpandedContentHeight
{
  return 0.0;
}

- (int64_t)gridSizeClass
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___CCUIControlHostViewController_gridSizeClass);
  swift_beginAccess();
  return *v2;
}

- (void)setGridSizeClass:(int64_t)a3
{
  CCUIControlHostViewController *v4;

  v4 = self;
  CCUIControlHostViewController.gridSizeClass.setter(a3);

}

- (int64_t)userVisibilityStatus
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___CCUIControlHostViewController_userVisibilityStatus);
  swift_beginAccess();
  return *v2;
}

- (void)setUserVisibilityStatus:(int64_t)a3
{
  _BOOL4 v5;
  int64_t *v6;
  uint64_t v7;

  v5 = a3 == 2;
  v6 = (int64_t *)((char *)self + OBJC_IVAR___CCUIControlHostViewController_userVisibilityStatus);
  swift_beginAccess();
  *v6 = a3;
  if (a3 == 1)
    v7 = 1;
  else
    v7 = 2 * v5;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIControlHostViewController_controlInstance), sel_setVisibility_, v7);
}

- (double)compactContinuousCornerRadius
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___CCUIControlHostViewController_compactContinuousCornerRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setCompactContinuousCornerRadius:(double)a3
{
  CCUIControlHostViewController *v4;

  v4 = self;
  CCUIControlHostViewController.compactContinuousCornerRadius.setter(a3);

}

- (CCUIModuleContentMetrics)contentMetrics
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIControlHostViewController_contentMetrics);
  swift_beginAccess();
  return (CCUIModuleContentMetrics *)*v2;
}

- (void)setContentMetrics:(id)a3
{
  CCUIControlHostViewController *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1D0319F68(a3);

}

- (BOOL)isResizing
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___CCUIControlHostViewController__isResizing);
}

- (void)setResizing:(BOOL)a3
{
  CCUIControlHostViewController *v4;

  v4 = self;
  CCUIControlHostViewController.isResizing.setter(a3);

}

- (BOOL)providesOwnPlatter
{
  return 1;
}

- (BOOL)shouldPerformClickInteraction
{
  CCUIControlHostViewController *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v2 = self;
  v3 = -[CCUIControlHostViewController viewIfLoaded](v2, sel_viewIfLoaded);
  if (v3)
  {
    v4 = v3;
    objc_opt_self();
    v5 = (void *)swift_dynamicCastObjCClass();
    if (!v5)

  }
  else
  {
    v5 = 0;
  }
  v6 = objc_msgSend(v5, sel_contextMenu);

  if (v6)
  return v6 == 0;
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  return 0;
}

- (BOOL)controlHostViewShouldPerformPrimaryAction:(id)a3
{
  id v4;
  CCUIControlHostViewController *v5;
  CCUIControlHostViewControllerDelegate *v6;
  unsigned __int8 v7;

  v4 = a3;
  v5 = self;
  v6 = -[CCUIControlHostViewController delegate](v5, sel_delegate);
  if (v6)
  {
    v7 = -[CCUIControlHostViewControllerDelegate controlHostViewControllerShouldPerformPrimaryAction:](v6, sel_controlHostViewControllerShouldPerformPrimaryAction_, v5);

    swift_unknownObjectRelease();
    return v7;
  }
  else
  {

    return 1;
  }
}

- (void)controlHostView:(id)a3 enqueue:(id)a4
{
  id v6;
  id v7;
  CCUIControlHostViewController *v8;
  CCUIContentModuleContext *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = -[CCUIControlHostViewController contentModuleContext](v8, sel_contentModuleContext);
  -[CCUIContentModuleContext enqueueStatusUpdate:](v9, sel_enqueueStatusUpdate_, v7);

}

- (BOOL)isDevicePasscodeLocked:(id)a3
{
  CCUIControlHostViewController *v4;
  CCUIControlHostViewController *v5;
  CCUIContentModuleContext *v6;
  CCUIControlHostViewController *v7;
  unsigned __int8 v8;

  v4 = (CCUIControlHostViewController *)a3;
  v5 = self;
  v6 = -[CCUIControlHostViewController contentModuleContext](v5, sel_contentModuleContext);
  if (v6)
  {
    v7 = (CCUIControlHostViewController *)v6;
    v8 = -[CCUIContentModuleContext isDevicePasscodeLocked](v6, sel_isDevicePasscodeLocked);

    v4 = v5;
    v5 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CCUIControlHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  CCUIControlHostViewController *result;

  v4 = a4;
  result = (CCUIControlHostViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
