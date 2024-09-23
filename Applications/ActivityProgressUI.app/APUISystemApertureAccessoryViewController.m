@implementation APUISystemApertureAccessoryViewController

- (_TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController)initWithCoder:(id)a3
{
  _TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController *result;

  result = (_TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100039BF0, "ActivityProgressUI/APUISystemApertureElementHostingController.swift", 67, 2, 330, 0);
  __break(1u);
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  uint64_t v2;
  void *v3;
  _TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController *v4;

  v2 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController__view);
  v3 = *(void **)(v2 + OBJC_IVAR____TtC18ActivityProgressUI31APUISystemApertureAccessoryView_hostingController);
  v4 = self;
  objc_msgSend(v3, "willMoveToParentViewController:", v4);
  -[APUISystemApertureAccessoryViewController addChildViewController:](v4, "addChildViewController:", v3);
  -[APUISystemApertureAccessoryViewController setView:](v4, "setView:", v2);
  objc_msgSend(v3, "didMoveToParentViewController:", v4);

}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  _TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController *v5;
  id v6;

  swift_unknownObjectRetain(a3);
  v5 = self;
  v6 = -[APUISystemApertureAccessoryViewController parentViewController](v5, "parentViewController");
  objc_msgSend(v6, "preferredContentSizeDidChangeForChildContentContainer:", a3);
  swift_unknownObjectRelease(a3);

}

- (_TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController *result;

  v4 = a4;
  result = (_TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController *)_swift_stdlib_reportUnimplementedInitializer("ActivityProgressUI.APUISystemApertureAccessoryViewController", 60, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityProgressUI41APUISystemApertureAccessoryViewController__view));
}

@end
