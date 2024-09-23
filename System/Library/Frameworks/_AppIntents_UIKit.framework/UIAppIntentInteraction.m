@implementation UIAppIntentInteraction

- (UIView)view
{
  return (UIView *)(id)sub_2217B587C();
}

- (void)willMoveToView:(id)a3
{
  id v4;
  _TtC17_AppIntents_UIKit22UIAppIntentInteraction *v5;

  v4 = a3;
  v5 = self;
  sub_2217B5908();

}

- (void)didMoveToView:(id)a3
{
  id v4;
  _TtC17_AppIntents_UIKit22UIAppIntentInteraction *v5;

  v4 = a3;
  v5 = self;
  sub_2217B6EA0();

}

- (void)setView:(id)a3
{
  id v5;
  _TtC17_AppIntents_UIKit22UIAppIntentInteraction *v6;

  v5 = a3;
  v6 = self;
  sub_2217B62D8(a3);

}

- (void)dealloc
{
  _TtC17_AppIntents_UIKit22UIAppIntentInteraction *v2;

  v2 = self;
  UIAppIntentInteraction.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_viewActionNode;
  v4 = OUTLINED_FUNCTION_12_3();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_2217BF400((uint64_t)self + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_suggestedIntent, (uint64_t *)&unk_255707E40);
  sub_2217BF400((uint64_t)self + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_donateIdentifier, &qword_255707F10);
  swift_unknownObjectWeakDestroy();
}

- (_TtC17_AppIntents_UIKit22UIAppIntentInteraction)init
{
  UIAppIntentInteraction.init()();
}

@end
