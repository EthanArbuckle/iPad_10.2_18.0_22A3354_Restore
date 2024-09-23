@implementation ContextualActionSuggestion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC26ContextualSuggestionClient26ContextualActionSuggestion)initWithCoder:(id)a3
{
  return (_TtC26ContextualSuggestionClient26ContextualActionSuggestion *)ContextualActionSuggestion.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC26ContextualSuggestionClient26ContextualActionSuggestion *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  v5 = self;
  sub_2384B8D0C(v4);
  v6 = *(uint64_t *)((char *)&v5->super.super.isa
                  + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualActionSuggestion_action);
  v7 = (id)sub_2384DFA18();
  objc_msgSend(v4, sel_encodeObject_forKey_, v6, v7);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualActionSuggestion_action));
}

@end
