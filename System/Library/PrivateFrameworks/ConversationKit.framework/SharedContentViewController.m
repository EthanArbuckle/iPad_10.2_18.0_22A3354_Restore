@implementation SharedContentViewController

- (BOOL)isPipped
{
  char v2;

  SharedContentViewController.isPipped.getter();
  return v2 & 1;
}

- (void)setIsPipped:(BOOL)a3
{
  _TtC15ConversationKit27SharedContentViewController *v4;

  v4 = self;
  SharedContentViewController.isPipped.setter(a3);

}

- (_TtC15ConversationKit27SharedContentViewController)init
{
  return (_TtC15ConversationKit27SharedContentViewController *)SharedContentViewController.init()();
}

- (_TtC15ConversationKit27SharedContentViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  SharedContentViewController.init(coder:)();
}

- (void)viewDidLoad
{
  _TtC15ConversationKit27SharedContentViewController *v2;

  v2 = self;
  SharedContentViewController.viewDidLoad()();

}

- (void)viewDidLayoutSubviews
{
  _TtC15ConversationKit27SharedContentViewController *v2;

  v2 = self;
  SharedContentViewController.viewDidLayoutSubviews()();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC15ConversationKit27SharedContentViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  SharedContentViewController.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease();

}

- (_TtC15ConversationKit27SharedContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a4;
  SharedContentViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit27SharedContentViewController_delegate);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit27SharedContentViewController_participant, &demangling cache variable for type metadata for Participant?);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit27SharedContentViewController_scrollView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit27SharedContentViewController_sharedContentView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit27SharedContentViewController_screenSharingInteraction);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit27SharedContentViewController_previousViewModel, &demangling cache variable for type metadata for SharedContentViewModel?);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit27SharedContentViewController_previousScreenSnapshot);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit27SharedContentViewController_avatarImageQueue));
}

- (id)viewForZoomingInScrollView:(id)a3
{
  UIView_optional *v3;
  id v4;

  SharedContentViewController.viewForZooming(in:)(v3, (UIScrollView *)self);
  return v4;
}

- (void)scrollViewDidZoom:(id)a3
{
  UIScrollView *v4;
  _TtC15ConversationKit27SharedContentViewController *v5;

  v4 = (UIScrollView *)a3;
  v5 = self;
  SharedContentViewController.scrollViewDidZoom(_:)(v4);

}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  id v7;
  id v8;
  _TtC15ConversationKit27SharedContentViewController *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  SharedContentViewController.scrollViewDidEndZooming(_:with:atScale:)(v7);

}

- (CGSize)preferredPiPContentAspectRatio
{
  _TtC15ConversationKit27SharedContentViewController *v2;
  CGSize v3;
  double width;
  double height;
  CGSize result;

  v2 = self;
  v3 = SharedContentViewController.preferredPiPContentAspectRatio()();

  width = v3.width;
  height = v3.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGRect)frameForRestoreAnimation
{
  _TtC15ConversationKit27SharedContentViewController *v2;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  double v10;
  __C::CGRect v11;
  CGRect result;

  v2 = self;
  v11 = SharedContentViewController.frameForRestoreAnimation()();
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;

  v7 = x;
  v8 = y;
  v9 = width;
  v10 = height;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (id)viewControllerForPiP
{
  UIViewController_optional *v2;
  id v3;

  SharedContentViewController.viewControllerForPiP()(v2);
  return v3;
}

- (BOOL)restoreViewControllerHierarchyWhenExitingPiP
{
  return 1;
}

- (id)sharedContentSourceName
{
  _TtC15ConversationKit27SharedContentViewController *v2;
  Swift::String_optional v3;
  void *v4;

  v2 = self;
  v3 = SharedContentViewController.sharedContentSourceName()();

  if (v3.value._object)
  {
    v4 = (void *)MEMORY[0x1C3B72E00](v3.value._countAndFlagsBits, v3.value._object);
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)getSharedContentSourceAvatarWithImageHandler:(id)a3
{
  void *v4;
  _TtC15ConversationKit27SharedContentViewController *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  specialized SharedContentViewController.getSharedContentSourceAvatarWithImageHandler(_:)((uint64_t)v5, (void (**)(_QWORD, _QWORD))v4);
  _Block_release(v4);

}

- (void)screenSharingStateMonitorDidUpdateScreenInfoForParticipant:(id)a3
{
  _TtC15ConversationKit27SharedContentViewController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  SharedContentViewController.screenSharingStateMonitorDidUpdateScreenInfoForParticipant(_:)();
  swift_unknownObjectRelease();

}

@end
