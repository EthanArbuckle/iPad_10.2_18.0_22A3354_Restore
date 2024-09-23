@implementation GKMultiplayerStepperController

- (_TtC12GameCenterUI30GKMultiplayerStepperController)initWithMinimumValue:(int64_t)a3 maximumValue:(int64_t)a4 initialValue:(int64_t)a5 valueChangedHandler:(id)a6
{
  void *v9;
  uint64_t (*v10)(uint64_t);

  v9 = _Block_copy(a6);
  if (v9)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v9;
    v10 = sub_1AB4F15E4;
  }
  else
  {
    v10 = 0;
  }
  return (_TtC12GameCenterUI30GKMultiplayerStepperController *)sub_1AB4F1354(a3, a4, a5, (uint64_t)v10);
}

- (_TtC12GameCenterUI30GKMultiplayerStepperController)init
{
  GKMultiplayerStepperController.init()();
}

- (void).cxx_destruct
{
  sub_1AB46A9C4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC12GameCenterUI30GKMultiplayerStepperController_valueChangedHandler));
}

@end
