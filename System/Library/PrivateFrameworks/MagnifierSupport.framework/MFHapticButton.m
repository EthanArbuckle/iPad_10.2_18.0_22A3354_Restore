@implementation MFHapticButton

- (_TtC16MagnifierSupport14MFHapticButton)init
{
  return (_TtC16MagnifierSupport14MFHapticButton *)sub_2273FEBB4();
}

- (_TtC16MagnifierSupport14MFHapticButton)initWithCoder:(id)a3
{
  _TtC16MagnifierSupport14MFHapticButton *result;

  result = (_TtC16MagnifierSupport14MFHapticButton *)sub_22758ECC4();
  __break(1u);
  return result;
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_class *ObjectType;
  id v7;
  _TtC16MagnifierSupport14MFHapticButton *v8;
  void *v9;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_22730BA80(0, &qword_2558D92E8);
  sub_2273FF2F0();
  sub_22758E5B0();
  v7 = a4;
  v8 = self;
  v9 = (void *)sub_22758E5A4();
  v10.receiver = v8;
  v10.super_class = ObjectType;
  -[MFHapticButton touchesCancelled:withEvent:](&v10, sel_touchesCancelled_withEvent_, v9, v7);

  objc_msgSend(*(id *)((char *)&v8->super.super.super.super.super.isa+ OBJC_IVAR____TtC16MagnifierSupport14MFHapticButton_buttonFeedbackGenerator), sel_userInteractionCancelled);
  swift_bridgeObjectRelease();
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC16MagnifierSupport14MFHapticButton *v8;

  sub_22730BA80(0, &qword_2558D92E8);
  sub_2273FF2F0();
  v6 = sub_22758E5B0();
  v7 = a4;
  v8 = self;
  sub_2273FF0A0(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void)shutterButtonDown:(id)a3
{
  _TtC16MagnifierSupport14MFHapticButton *v4;
  _TtC16MagnifierSupport14MFHapticButton *v5;
  __int128 v6;
  __int128 v7;

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_22758EAB4();
    swift_unknownObjectRelease();
  }
  else
  {
    v6 = 0u;
    v7 = 0u;
    v5 = self;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC16MagnifierSupport14MFHapticButton_buttonFeedbackGenerator), sel_userInteractionStarted, v6, v7);

  sub_227365B54((uint64_t)&v6);
}

- (_TtC16MagnifierSupport14MFHapticButton)initWithFrame:(CGRect)a3
{
  _TtC16MagnifierSupport14MFHapticButton *result;

  result = (_TtC16MagnifierSupport14MFHapticButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport14MFHapticButton_buttonFeedbackGenerator));
}

@end
