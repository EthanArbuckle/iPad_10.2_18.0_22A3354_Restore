@implementation TipUIPopoverViewController.Delegate

- (UIPopoverPresentationControllerDelegate)clientDelegate
{
  return (UIPopoverPresentationControllerDelegate *)sub_23541B57C(self, (uint64_t)a2, 205, (uint64_t (*)(void))sub_23541B608);
}

- (void)setClientDelegate:(id)a3
{
  _TtCC6TipKit26TipUIPopoverViewController8Delegate *v4;

  sub_2354246CC();
  sub_2354246C0();
  sub_2354246B4();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  swift_unknownObjectRetain();
  v4 = self;
  sub_23541B744();
  swift_release();

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  id v5;
  _TtCC6TipKit26TipUIPopoverViewController8Delegate *v6;

  sub_2354246CC();
  sub_2354246C0();
  sub_2354246B4();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v5 = a3;
  v6 = self;
  sub_23541B7C8();
  swift_release();

  return -1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v7;
  id v8;
  _TtCC6TipKit26TipUIPopoverViewController8Delegate *v9;

  sub_2354246CC();
  sub_2354246C0();
  sub_2354246B4();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_23541B8D0();
  swift_release();

  return -1;
}

- (void)presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4
{
  id v7;
  id v8;

  sub_2354246CC();
  sub_2354246C0();
  sub_2354246B4();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v7 = a3;
  v8 = a4;
  self;
  sub_23541B9E8();
}

- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4
{
  id v6;
  _TtCC6TipKit26TipUIPopoverViewController8Delegate *v7;

  sub_2354246CC();
  sub_2354246C0();
  sub_2354246B4();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v6 = a3;
  v7 = self;
  sub_23541BB78();
}

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  id v7;

  sub_2354246CC();
  sub_2354246C0();
  sub_2354246B4();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v7 = a3;
  swift_unknownObjectRetain();
  self;
  sub_23541BD10();
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  id v5;
  _TtCC6TipKit26TipUIPopoverViewController8Delegate *v6;

  sub_2354246CC();
  sub_2354246C0();
  sub_2354246B4();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v5 = a3;
  v6 = self;
  sub_23541BEB0();
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  sub_23541C0AC(self, (uint64_t)a2, a3);
}

- (void)presentationControllerWillDismiss:(id)a3
{
  sub_23541C0AC(self, (uint64_t)a2, a3);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  sub_23541C0AC(self, (uint64_t)a2, a3);
}

- (void)prepareForPopoverPresentation:(id)a3
{
  sub_23541C0AC(self, (uint64_t)a2, a3);
}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  id v7;

  sub_2354246CC();
  sub_2354246C0();
  sub_2354246B4();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v7 = a3;
  self;
  sub_23541C23C();
}

- (_TtCC6TipKit26TipUIPopoverViewController8Delegate)init
{
  return (_TtCC6TipKit26TipUIPopoverViewController8Delegate *)sub_23541C3CC();
}

- (void).cxx_destruct
{
  sub_23541C70C((uint64_t)self + OBJC_IVAR____TtCC6TipKit26TipUIPopoverViewController8Delegate_clientDelegate);
}

@end
