@implementation HUEmbeddedSceneActionGridViewController

- (HUEmbeddedSceneActionGridViewControllerDelegate)sceneActionGridDelegate
{
  swift_beginAccess();
  return (HUEmbeddedSceneActionGridViewControllerDelegate *)(id)swift_unknownObjectRetain();
}

- (void)setSceneActionGridDelegate:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.super.super.super.super.super.super.super.super.isa
            + OBJC_IVAR___HUEmbeddedSceneActionGridViewController_sceneActionGridDelegate);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (HUEmbeddedSceneActionGridViewController)initWithActionSetBuilder:(id)a3
{
  return (HUEmbeddedSceneActionGridViewController *)EmbeddedSceneActionGridViewController.init(actionSetBuilder:)(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
