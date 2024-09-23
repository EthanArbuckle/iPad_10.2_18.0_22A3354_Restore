@implementation SpringAnimation

- (double)value
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState);
}

- (double)target
{
  double result;

  if ((self->animationState[OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState + 16] & 1) != 0)
    return *(double *)&self->animationState[OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState + 8];
  sub_212E071A0();
  __break(1u);
  return result;
}

- (_TtC15ActivityRingsUI15SpringAnimation)initWithInitialValue:(double)a3 delay:(double)a4
{
  char *v4;
  objc_super v6;

  v4 = (char *)self + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState;
  *(double *)v4 = a3;
  *(_OWORD *)(v4 + 8) = 0u;
  *(_OWORD *)(v4 + 24) = 0u;
  v4[40] = 0;
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_delay) = a4;
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_remainingDelay) = a4;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SpringAnimation();
  return -[SpringAnimation init](&v6, sel_init);
}

- (void)configureWithTension:(double)a3 friction:(double)a4 target:(double)a5
{
  double *v5;

  v5 = (double *)((char *)self + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState);
  v5[2] = a3;
  v5[3] = a4;
  v5[4] = a5;
  *((_BYTE *)v5 + 40) = 1;
}

- (void)updateTarget:(double)a3
{
  double *v3;

  v3 = (double *)((char *)self + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState);
  if ((self->animationState[OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState + 16] & 1) != 0)
  {
    v3[4] = a3;
    *((_BYTE *)v3 + 40) = 1;
  }
  else
  {
    sub_212E071A0();
    __break(1u);
  }
}

- (BOOL)advanceWithDeltaTime:(double)a3
{
  _TtC15ActivityRingsUI15SpringAnimation *v4;
  char v5;

  v4 = self;
  v5 = sub_212E0268C(a3);

  return v5 & 1;
}

- (void)completeWithSnap
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState;
  if (self->animationState[OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState + 16] == 1)
  {
    *(_QWORD *)v2 = *((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 1) = 0;
    v2[40] = 1;
  }
}

- (_TtC15ActivityRingsUI15SpringAnimation)init
{
  _TtC15ActivityRingsUI15SpringAnimation *result;

  result = (_TtC15ActivityRingsUI15SpringAnimation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
