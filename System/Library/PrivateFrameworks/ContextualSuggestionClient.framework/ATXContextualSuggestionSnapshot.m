@implementation ATXContextualSuggestionSnapshot

- (ATXContextualSuggestionSnapshot)initWithCoder:(id)a3
{
  return (ATXContextualSuggestionSnapshot *)ContextualSuggestionSnapshot.init(coder:)(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  ATXContextualSuggestionSnapshot *v6;
  void *v7;
  id v8;

  type metadata accessor for ContextualSuggestionContext();
  v5 = a3;
  v6 = self;
  v7 = (void *)sub_2384DFA84();
  v8 = (id)sub_2384DFA18();
  objc_msgSend(v5, sel_encodeObject_forKey_, v7, v8);

}

- (ATXContextualSuggestionSnapshot)init
{
  ATXContextualSuggestionSnapshot *result;

  result = (ATXContextualSuggestionSnapshot *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
