@implementation SFContextualNamedEntity

- (SFContextualNamedEntity)initWithPersonalizationPortraitName:(id)a3 score:(double)a4 category:(unint64_t)a5 language:(id)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v8 = sub_1B25CCA18();
  v10 = v9;
  v11 = sub_1B25CCA18();
  return (SFContextualNamedEntity *)sub_1B2594C10(v8, v10, a5, v11, v12, a4);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (SFContextualNamedEntity)initWithPeopleSuggesterRecipientDisplayName:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_1B25CCA18();
  return (SFContextualNamedEntity *)sub_1B2594DF0(v3, v4);
}

- (SFContextualNamedEntity)init
{
  SFContextualNamedEntity.init()();
}

@end
