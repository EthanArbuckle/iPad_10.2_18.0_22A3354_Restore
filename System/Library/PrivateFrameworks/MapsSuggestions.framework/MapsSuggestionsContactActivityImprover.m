@implementation MapsSuggestionsContactActivityImprover

- (BOOL)improveEntry:(id)a3
{
  MapsSuggestionsEntry *v4;
  _TtC15MapsSuggestions38MapsSuggestionsContactActivityImprover *v5;

  v4 = (MapsSuggestionsEntry *)a3;
  v5 = self;
  LOBYTE(self) = MapsSuggestionsContactActivityImprover.improve(_:)(v4);

  return self & 1;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (_TtC15MapsSuggestions38MapsSuggestionsContactActivityImprover)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MapsSuggestionsContactActivityImprover();
  return -[MapsSuggestionsContactActivityImprover init](&v3, sel_init);
}

@end
