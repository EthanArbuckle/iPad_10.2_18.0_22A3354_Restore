@implementation ContextualWidgetSuggestion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC26ContextualSuggestionClient26ContextualWidgetSuggestion)initWithCoder:(id)a3
{
  return (_TtC26ContextualSuggestionClient26ContextualWidgetSuggestion *)ContextualWidgetSuggestion.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC26ContextualSuggestionClient26ContextualWidgetSuggestion *v5;

  v4 = a3;
  v5 = self;
  sub_2384D3F4C(v4);

}

- (NSString)description
{
  _TtC26ContextualSuggestionClient26ContextualWidgetSuggestion *v2;
  void *v3;

  v2 = self;
  sub_2384D41F8();

  v3 = (void *)sub_2384DFA18();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_intent));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_scoreSpecification));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_blendingClientModelSpecification));
}

@end
