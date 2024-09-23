@implementation MapsSuggestionsContactActivityDeduper

- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4
{
  id v6;
  id v7;
  _TtC15MapsSuggestions37MapsSuggestionsContactActivityDeduper *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = _s15MapsSuggestions0aB22ContactActivityDeduperC6dedupe16byEnrichingEntry4withSbSo0abI0C_AHtF_0(v6, v7);

  return v9 & 1;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (_TtC15MapsSuggestions37MapsSuggestionsContactActivityDeduper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MapsSuggestionsContactActivityDeduper();
  return -[MapsSuggestionsContactActivityDeduper init](&v3, sel_init);
}

@end
