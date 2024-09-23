@implementation MapsSuggestionsBaseDeduper

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4
{
  id v7;
  id v8;
  BOOL result;

  v7 = a3;
  v8 = a4;
  result = -[MapsSuggestionsBaseDeduper doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __break(1u);
  return result;
}

+ (BOOL)isEnabled
{
  BOOL result;

  result = objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  __break(1u);
  return result;
}

@end
