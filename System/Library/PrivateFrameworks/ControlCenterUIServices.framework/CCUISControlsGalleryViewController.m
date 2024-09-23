@implementation CCUISControlsGalleryViewController

- (CCUISControlsGalleryViewController)initWithConfiguration:(id)a3
{
  id v4;

  v4 = a3;
  return (CCUISControlsGalleryViewController *)sub_2384F66A4(a3);
}

- (CCUISControlsGalleryViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _sSo34CCUISControlsGalleryViewControllerC23ControlCenterUIServicesE5coderABSgSo7NSCoderC_tcfc_0();
}

- (CCUISControlsGalleryViewControllerDelegate)delegate
{
  return (CCUISControlsGalleryViewControllerDelegate *)(id)MEMORY[0x23B837864]((char *)self+ OBJC_IVAR___CCUISControlsGalleryViewController_delegate, a2);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (CCUISConfiguredControl)selectedControl
{
  return (CCUISConfiguredControl *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                           + OBJC_IVAR___CCUISControlsGalleryViewController_selectedControl));
}

- (void)setSelectedControl:(id)a3
{
  void *v4;
  CCUISControlsGalleryViewController *v5;
  id v6;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUISControlsGalleryViewController_selectedControl);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUISControlsGalleryViewController_selectedControl) = (Class)a3;
  v6 = a3;
  v5 = self;

  -[CCUISControlsGalleryViewController isViewLoaded](v5, sel_isViewLoaded);
}

- (void)viewDidLoad
{
  CCUISControlsGalleryViewController *v2;

  v2 = self;
  CCUISControlsGalleryViewController.viewDidLoad()();

}

- (void)viewWillAppear:(BOOL)a3
{
  sub_2384F728C(self, (uint64_t)a2, a3, (SEL *)&selRef_controlsGalleryViewControllerWillPresent_, (SEL *)&selRef_viewWillAppear_);
}

- (void)viewIsAppearing:(BOOL)a3
{
  _BOOL8 v3;
  CCUISControlsGalleryViewController *v4;
  id v5;
  id v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CCUISControlsGalleryViewController;
  v4 = self;
  -[CCUISControlsGalleryViewController viewIsAppearing:](&v8, sel_viewIsAppearing_, v3);
  v5 = objc_allocWithZone(MEMORY[0x24BE169D0]);
  v6 = objc_msgSend(v5, sel_init, v8.receiver, v8.super_class);
  v7 = (void *)sub_238506B48();
  objc_msgSend(v6, sel_userEnteredAddGalleryForHost_, v7);

}

- (void)viewDidAppear:(BOOL)a3
{
  sub_2384F728C(self, (uint64_t)a2, a3, (SEL *)&selRef_controlsGalleryViewControllerDidPresent_, (SEL *)&selRef_viewDidAppear_);
}

- (void)viewWillDisappear:(BOOL)a3
{
  sub_2384F728C(self, (uint64_t)a2, a3, (SEL *)&selRef_controlsGalleryViewControllerWillDismiss_, (SEL *)&selRef_viewWillDisappear_);
}

- (void)viewDidDisappear:(BOOL)a3
{
  sub_2384F728C(self, (uint64_t)a2, a3, (SEL *)&selRef_controlsGalleryViewControllerDidDismiss_, (SEL *)&selRef_viewDidDisappear_);
}

- (void)viewWillLayoutSubviews
{
  CCUISControlsGalleryViewController *v2;

  v2 = self;
  CCUISControlsGalleryViewController.viewWillLayoutSubviews()();

}

- (CCUISControlsGalleryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  CCUISControlsGalleryViewController *result;

  v4 = a4;
  result = (CCUISControlsGalleryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2384F7830((uint64_t)self + OBJC_IVAR___CCUISControlsGalleryViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CCUISControlsGalleryViewController_selectedControl));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CCUISControlsGalleryViewController_configuration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CCUISControlsGalleryViewController_addWidgetSheetViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CCUISControlsGalleryViewController_galleryManager));
  sub_2384F7830((uint64_t)self + OBJC_IVAR___CCUISControlsGalleryViewController__customItemsDelegate);
}

- (CCUISControlsGalleryViewControllerCustomItemsDelegate)customItemsDelegate
{
  return (CCUISControlsGalleryViewControllerCustomItemsDelegate *)(id)MEMORY[0x23B837864]((char *)self + OBJC_IVAR___CCUISControlsGalleryViewController__customItemsDelegate, a2);
}

- (void)setCustomItemsDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

@end
