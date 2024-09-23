@implementation TipUIPopoverViewController

- (UIPopoverPresentationController)popoverPresentationController
{
  return (UIPopoverPresentationController *)sub_23541B57C(self, (uint64_t)a2, 93, (uint64_t (*)(void))TipUIPopoverViewController.popoverPresentationController.getter);
}

- (void)viewDidLoad
{
  sub_23541A908(self, (uint64_t)a2, 133, TipUIPopoverViewController.viewDidLoad());
}

- (void)viewDidLayoutSubviews
{
  sub_23541A908(self, (uint64_t)a2, 140, TipUIPopoverViewController.viewDidLayoutSubviews());
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC6TipKit26TipUIPopoverViewController *v5;

  sub_2354246CC();
  sub_2354246C0();
  sub_2354246B4();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v5 = self;
  TipUIPopoverViewController.viewWillAppear(_:)(a3);
  swift_release();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC6TipKit26TipUIPopoverViewController *v6;
  _TtC6TipKit26TipUIPopoverViewController *v7;
  UITraitCollection_optional v8;

  sub_2354246CC();
  sub_2354246C0();
  sub_2354246B4();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  TipUIPopoverViewController.traitCollectionDidChange(_:)(v8);
  swift_release();

}

- (BOOL)_canShowWhileLocked
{
  _TtC6TipKit26TipUIPopoverViewController *v3;
  Swift::Bool canShowWhile;

  sub_2354246CC();
  sub_2354246C0();
  sub_2354246B4();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v3 = self;
  canShowWhile = TipUIPopoverViewController._canShowWhileLocked()();
  swift_release();

  return canShowWhile;
}

- (_TtC6TipKit26TipUIPopoverViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  void *v7;
  id v8;
  _TtC6TipKit26TipUIPopoverViewController *v9;

  sub_2354246CC();
  sub_2354246C0();
  sub_2354246B4();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  if (a3)
  {
    v6 = sub_2354245A0();
    a3 = v7;
  }
  else
  {
    v6 = 0;
  }
  v8 = a4;
  v9 = (_TtC6TipKit26TipUIPopoverViewController *)TipUIPopoverViewController.init(nibName:bundle:)(v6, (uint64_t)a3, a4);
  swift_release();
  return v9;
}

- (_TtC6TipKit26TipUIPopoverViewController)initWithCoder:(id)a3
{
  _TtC6TipKit26TipUIPopoverViewController *v4;

  sub_2354246CC();
  sub_2354246C0();
  sub_2354246B4();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v4 = (_TtC6TipKit26TipUIPopoverViewController *)TipUIPopoverViewController.init(coder:)(a3);
  swift_release();
  return v4;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6TipKit26TipUIPopoverViewController_delegate));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6TipKit26TipUIPopoverViewController_hostingView));
}

@end
