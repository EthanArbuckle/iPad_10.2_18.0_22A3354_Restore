@implementation TextAnimator

- (int64_t)state
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D412TextAnimator_state);
}

- (void)setState:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D412TextAnimator_state) = (Class)a3;
}

- (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D412TextAnimator)init
{
  _TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D412TextAnimator *result;

  result = (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D412TextAnimator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_weakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D412TextAnimator_textAnimation));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)start
{
  _TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D412TextAnimator *v2;

  v2 = self;
  TextAnimator.start()();

}

- (void)startWithDuration:(double)a3
{
  _TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D412TextAnimator *v4;

  v4 = self;
  TextAnimator.start(duration:)(a3);

}

- (void)pause
{
  _TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D412TextAnimator *v2;

  v2 = self;
  TextAnimator.pause()();

}

- (void)resume
{
  _TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D412TextAnimator *v2;

  v2 = self;
  TextAnimator.resume()();

}

- (void)invalidate
{
  _TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D412TextAnimator *v2;

  v2 = self;
  TextAnimator.invalidate()();

}

- (_NSTextAnimation)animation
{
  return (_NSTextAnimation *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D412TextAnimator_textAnimation));
}

- (double)duration
{
  _TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D412TextAnimator *v2;
  double v3;

  v2 = self;
  v3 = TextAnimator.duration.getter();

  return v3;
}

- (NSString)toPhase
{
  _TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D412TextAnimator *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = TextAnimator.toPhase.getter();
  v5 = v4;

  if (v5)
  {
    v6 = (void *)MEMORY[0x23B7C5DAC](v3, v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (void)setToPhase:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D412TextAnimator__phase);
  *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease();
}

- (NSString)fromPhase
{
  void *Strong;
  Swift::UInt64 v4;
  _TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D412TextAnimator *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  Strong = (void *)swift_weakLoadStrong();
  if (Strong)
  {
    v4 = *(_QWORD *)(*(char **)((char *)&self->super.isa
                              + OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D412TextAnimator_textAnimation)
                   + OBJC_IVAR____TtC7SwiftUI16AnyTextAnimation_id);
    v5 = self;
    v6 = TextEffectsAnimationController.animatorFromPhase(with:)(v4);
    v8 = v7;

    swift_release();
    if (v8)
    {
      Strong = (void *)MEMORY[0x23B7C5DAC](v6, v8);
      swift_bridgeObjectRelease();
    }
    else
    {
      Strong = 0;
    }
  }
  return (NSString *)Strong;
}

- (NSDictionary)configuration
{
  NSDictionary v2;

  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D412TextAnimator__configuration))
  {
    swift_bridgeObjectRetain();
    v2.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    if (swift_weakLoadStrong())
      swift_release();
    v2.super.isa = 0;
  }
  return (NSDictionary *)v2.super.isa;
}

- (void)setConfiguration:(id)a3
{
  objc_class *v4;

  if (a3)
    v4 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  else
    v4 = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D412TextAnimator__configuration) = v4;
  swift_bridgeObjectRelease();
}

- (_NSTextAnimatorStateSnapshot)stateSnapshot
{
  _TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D412TextAnimator *v2;
  void *v3;

  v2 = self;
  v3 = (void *)TextAnimator.stateSnapshot.getter();

  return (_NSTextAnimatorStateSnapshot *)v3;
}

- (void)setStateSnapshot:(id)a3
{
  _TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D412TextAnimator *v5;

  swift_unknownObjectRetain();
  v5 = self;
  TextAnimator.stateSnapshot.setter((uint64_t)a3);

}

- (double)nextAnimationTriggerDelay
{
  _TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D412TextAnimator *v2;
  double v3;

  v2 = self;
  v3 = TextAnimator.nextAnimationTriggerDelay.getter();

  return v3;
}

- (void)cancel
{
  _TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D412TextAnimator *v2;

  v2 = self;
  TextAnimator.cancel()();

}

@end
