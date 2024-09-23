@implementation UIAppEntityInteraction

- (UIView)view
{
  return (UIView *)(id)sub_2217B5698();
}

- (void)willMoveToView:(id)a3
{
  id v4;
  _TtC17_AppIntents_UIKit22UIAppEntityInteraction *v5;

  v4 = a3;
  v5 = self;
  sub_2217B5F24();

}

- (void)didMoveToView:(id)a3
{
  id v5;
  _TtC17_AppIntents_UIKit22UIAppEntityInteraction *v6;

  v5 = a3;
  v6 = self;
  sub_2217B61BC(a3);

}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  v3 = OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_1_0(v3);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppEntityInteraction_entity);
  v4 = OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(v4);
  swift_unknownObjectWeakDestroy();
}

- (void)setView:(id)a3
{
  id v5;
  _TtC17_AppIntents_UIKit22UIAppEntityInteraction *v6;

  v5 = a3;
  v6 = self;
  sub_2217B614C(a3);

}

- (void)dealloc
{
  _TtC17_AppIntents_UIKit22UIAppEntityInteraction *v2;

  v2 = self;
  UIAppEntityInteraction.__deallocating_deinit();
}

- (_TtC17_AppIntents_UIKit22UIAppEntityInteraction)init
{
  UIAppEntityInteraction.init()();
}

@end
