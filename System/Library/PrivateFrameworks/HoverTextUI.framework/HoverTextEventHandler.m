@implementation HoverTextEventHandler

- (BOOL)handlePointerEvent:(id)a3
{
  id v5;
  _TtC11HoverTextUI21HoverTextEventHandler *v6;

  v5 = a3;
  v6 = self;
  sub_21A7CAEA8(a3);

  return 0;
}

- (_TtC11HoverTextUI21HoverTextEventHandler)init
{
  return (_TtC11HoverTextUI21HoverTextEventHandler *)sub_21A7CC4E8();
}

- (void).cxx_destruct
{
  sub_21A7B9364(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_elementAtPointerDidChange));
  sub_21A7B9364(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_azimuthDidChange));
  sub_21A7B9364(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_stylusMoved));
  sub_21A7B9364(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationLockSequenceOccurred));
  sub_21A7B9364(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationButtonPressed));
  sub_21A7B9364(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_activationButtonReleased));
  sub_21A7B9364(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_handleTapGesture));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler_previousHoverElement));
  swift_bridgeObjectRelease();

  sub_21A7CF1A8(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler____lazy_storage___eventProcessor));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11HoverTextUI21HoverTextEventHandler____lazy_storage___activationKeyHoldTimer));
}

@end
