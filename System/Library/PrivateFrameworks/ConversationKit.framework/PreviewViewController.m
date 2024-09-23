@implementation PreviewViewController

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  _TtC15ConversationKitP33_5F44B43E167BB5459C625FF70B7F8E5621PreviewViewController *v4;

  v3 = a3;
  v4 = self;
  PreviewViewController.viewDidAppear(_:)(v3);

}

- (void)viewDidLoad
{
  _TtC15ConversationKitP33_5F44B43E167BB5459C625FF70B7F8E5621PreviewViewController *v2;

  v2 = self;
  PreviewViewController.viewDidLoad()();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC15ConversationKitP33_5F44B43E167BB5459C625FF70B7F8E5621PreviewViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  PreviewViewController.viewWillTransition(to:with:)((uint64_t)a4, width, height);
  swift_unknownObjectRelease();

}

- (_TtC15ConversationKitP33_5F44B43E167BB5459C625FF70B7F8E5621PreviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC15ConversationKitP33_5F44B43E167BB5459C625FF70B7F8E5621PreviewViewController *)PreviewViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC15ConversationKitP33_5F44B43E167BB5459C625FF70B7F8E5621PreviewViewController)initWithCoder:(id)a3
{
  return (_TtC15ConversationKitP33_5F44B43E167BB5459C625FF70B7F8E5621PreviewViewController *)PreviewViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKitP33_5F44B43E167BB5459C625FF70B7F8E5621PreviewViewController_previewView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKitP33_5F44B43E167BB5459C625FF70B7F8E5621PreviewViewController_captureSession));
}

@end
