@implementation TapInteraction

- (UIView)view
{
  return (UIView *)(id)TapInteraction.view.getter();
}

- (void)setView:(id)a3
{
  id v5;
  _TtC15ConversationKit14TapInteraction *v6;

  v5 = a3;
  v6 = self;
  TapInteraction.view.setter(a3);

}

- (int64_t)numberOfTapsRequired
{
  _TtC15ConversationKit14TapInteraction *v2;
  id v3;

  v2 = self;
  v3 = TapInteraction.numberOfTapsRequired.getter();

  return (int64_t)v3;
}

- (void)setNumberOfTapsRequired:(int64_t)a3
{
  _TtC15ConversationKit14TapInteraction *v4;

  v4 = self;
  TapInteraction.numberOfTapsRequired.setter(a3);

}

- (_TtC15ConversationKit14TapInteraction)init
{
  return (_TtC15ConversationKit14TapInteraction *)TapInteraction.init()();
}

- (void)willMoveToView:(id)a3
{
  id v5;
  _TtC15ConversationKit14TapInteraction *v6;

  v5 = a3;
  v6 = self;
  TapInteraction.willMove(to:)((UIView_optional *)a3);

}

- (void)didMoveToView:(id)a3
{
  id v5;
  _TtC15ConversationKit14TapInteraction *v6;

  v5 = a3;
  v6 = self;
  TapInteraction.didMove(to:)((UIView_optional *)a3);

}

- (void)handleRecognizer:(id)a3
{
  id v4;
  _TtC15ConversationKit14TapInteraction *v5;

  v4 = a3;
  v5 = self;
  TapInteraction.handleRecognizer(_:)(v4);

}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  UIGestureRecognizer *v6;
  UIGestureRecognizer *v7;
  _TtC15ConversationKit14TapInteraction *v8;
  Swift::Bool v9;

  v6 = (UIGestureRecognizer *)a3;
  v7 = (UIGestureRecognizer *)a4;
  v8 = self;
  v9 = TapInteraction.gestureRecognizer(_:shouldRequireFailureOf:)(v6, v7);

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC15ConversationKit14TapInteraction *v8;
  Swift::Bool v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = TapInteraction.gestureRecognizer(_:shouldReceive:)((UIGestureRecognizer *)v8, (UITouch)v7);

  return v9;
}

@end
