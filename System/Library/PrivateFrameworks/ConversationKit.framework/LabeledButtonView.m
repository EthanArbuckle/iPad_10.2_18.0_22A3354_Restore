@implementation LabeledButtonView

- (NSArray)preferredFocusEnvironments
{
  _TtC15ConversationKit17LabeledButtonView *v2;
  Class isa;

  v2 = self;
  LabeledButtonView.preferredFocusEnvironments.getter();

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UIFocusEnvironment);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (_TtC15ConversationKit17LabeledButtonView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  LabeledButtonView.init(coder:)();
}

- (_TtC15ConversationKit17LabeledButtonView)initWithFrame:(CGRect)a3
{
  LabeledButtonView.init(frame:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit17LabeledButtonView_control));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit17LabeledButtonView____lazy_storage___label));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit17LabeledButtonView_labelTopConstraint));
}

@end
