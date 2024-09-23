@implementation PushToTalkTalkButtonGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  @objc PushToTalkTalkButtonGestureRecognizer.touchesBegan(_:with:)(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id))PushToTalkTalkButtonGestureRecognizer.touchesBegan(_:with:));
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  @objc PushToTalkTalkButtonGestureRecognizer.touchesBegan(_:with:)(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id))PushToTalkTalkButtonGestureRecognizer.touchesMoved(_:with:));
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  @objc PushToTalkTalkButtonGestureRecognizer.touchesBegan(_:with:)(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id))PushToTalkTalkButtonGestureRecognizer.touchesEnded(_:with:));
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  @objc PushToTalkTalkButtonGestureRecognizer.touchesBegan(_:with:)(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id))PushToTalkTalkButtonGestureRecognizer.touchesCancelled(_:with:));
}

- (void)reset
{
  _TtC15ConversationKit37PushToTalkTalkButtonGestureRecognizer *v2;

  v2 = self;
  PushToTalkTalkButtonGestureRecognizer.reset()();

}

- (_TtC15ConversationKit37PushToTalkTalkButtonGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  PushToTalkTalkButtonGestureRecognizer.init(target:action:)();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit37PushToTalkTalkButtonGestureRecognizer_interval;
  v4 = type metadata accessor for DispatchTimeInterval();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
  outlined destroy of Conversation?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit37PushToTalkTalkButtonGestureRecognizer_previous, &demangling cache variable for type metadata for (location: CGPoint, time: Date)?);
  swift_release();
}

@end
