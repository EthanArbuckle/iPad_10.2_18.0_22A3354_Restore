@implementation ContextualSuggestion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC26ContextualSuggestionClient20ContextualSuggestion)initWithCoder:(id)a3
{
  return (_TtC26ContextualSuggestionClient20ContextualSuggestion *)ContextualSuggestion.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC26ContextualSuggestionClient20ContextualSuggestion *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_2384DFA18();
  v7 = (id)sub_2384DFA18();
  objc_msgSend(v4, sel_encodeObject_forKey_, v6, v7);

}

- (_TtC26ContextualSuggestionClient20ContextualSuggestion)init
{
  _TtC26ContextualSuggestionClient20ContextualSuggestion *result;

  result = (_TtC26ContextualSuggestionClient20ContextualSuggestion *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
