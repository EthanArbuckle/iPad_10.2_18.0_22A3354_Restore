@implementation AUKnobControl

- (_TtC12CoreAudioKit13AUKnobControl)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit13AUKnobControl *)sub_213194210(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit13AUKnobControl)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit13AUKnobControl *)sub_2131943D4(a3);
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BEBDEF0];
}

- (void)accessibilityIncrement
{
  _TtC12CoreAudioKit13AUKnobControl *v2;

  v2 = self;
  sub_213194570();

}

- (void)accessibilityDecrement
{
  _TtC12CoreAudioKit13AUKnobControl *v2;

  v2 = self;
  sub_2131945F0();

}

- (void)tintColorDidChange
{
  void *v2;
  _TtC12CoreAudioKit13AUKnobControl *v3;
  id v4;
  void *v5;
  id v6;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit13AUKnobControl_valueLayer);
  v3 = self;
  v4 = -[AUKnobControl tintColor](v3, sel_tintColor);
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, sel_CGColor);

    objc_msgSend(v2, sel_setStrokeColor_, v6);
  }
  else
  {
    __break(1u);
  }
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  _TtC12CoreAudioKit13AUKnobControl *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_213195818(v6);

  return v9 & 1;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  _TtC12CoreAudioKit13AUKnobControl *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_2131959CC(v6);

  return v9 & 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  _TtC12CoreAudioKit13AUKnobControl *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_213195C20();

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  objc_opt_self();
  return swift_dynamicCastObjCClass() != 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit13AUKnobControl_formatter));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit13AUKnobControl_valueLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit13AUKnobControl_lineLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit13AUKnobControl_titleLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit13AUKnobControl_valueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit13AUKnobControl_minValueLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit13AUKnobControl_maxValueLayer));
}

@end
