@implementation ScoreController

- (ScoreControllerDelegate)delegate
{
  return (ScoreControllerDelegate *)(id)ScoreController.delegate.getter();
}

- (void)setDelegate:(id)a3
{
  ScoreController *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  ScoreController.delegate.setter((uint64_t)a3);

}

- (ScoreController)init
{
  return (ScoreController *)ScoreController.init()();
}

- (void).cxx_destruct
{
  sub_100123A08((uint64_t)self + OBJC_IVAR___ScoreController_delegate);
}

@end
