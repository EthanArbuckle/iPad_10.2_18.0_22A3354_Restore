@implementation SiriUISpokenSuggestionsProvider

+ (void)fetchTopSpokenSuggestionFrom:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;

  v5 = _Block_copy(a4);
  _Block_copy(v5);
  v6 = a3;
  sub_100089888(v6, (void (**)(_QWORD, _QWORD))v5);
  _Block_release(v5);
  _Block_release(v5);

}

- (_TtC4Siri31SiriUISpokenSuggestionsProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SiriUISpokenSuggestionsProvider();
  return -[SiriUISpokenSuggestionsProvider init](&v3, "init");
}

@end
