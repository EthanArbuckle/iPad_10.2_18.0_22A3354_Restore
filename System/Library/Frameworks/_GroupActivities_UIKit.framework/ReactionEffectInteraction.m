@implementation ReactionEffectInteraction

- (UIView)view
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC22_GroupActivities_UIKit25ReactionEffectInteraction_view;
  swift_beginAccess();
  return (UIView *)(id)MEMORY[0x2207D4A98](v2);
}

- (void)setView:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (_TtC22_GroupActivities_UIKit25ReactionEffectInteraction)init
{
  return (_TtC22_GroupActivities_UIKit25ReactionEffectInteraction *)ReactionEffectInteraction.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC22_GroupActivities_UIKit25ReactionEffectInteraction__reaction;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<Reaction?>);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  outlined consume of ReactionEffectInteraction.PresentationContext?(*(void **)((char *)&self->super.isa+ OBJC_IVAR____TtC22_GroupActivities_UIKit25ReactionEffectInteraction__presentationContext), *(void **)&self->_anon_0[OBJC_IVAR____TtC22_GroupActivities_UIKit25ReactionEffectInteraction__presentationContext]);
}

- (void)willMoveToView:(id)a3
{
  id v4;
  _TtC22_GroupActivities_UIKit25ReactionEffectInteraction *v5;

  v4 = a3;
  v5 = self;
  specialized ReactionEffectInteraction.willMove(to:)();

}

- (void)didMoveToView:(id)a3
{
  id v5;
  _TtC22_GroupActivities_UIKit25ReactionEffectInteraction *v6;

  v5 = a3;
  v6 = self;
  ReactionEffectInteraction.didMove(to:)((UIView_optional *)a3);

}

@end
