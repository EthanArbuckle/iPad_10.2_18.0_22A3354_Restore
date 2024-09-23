@implementation MapsSuggestionsBaseFilter

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

- (BOOL)shouldKeepEntry:(id)a3
{
  id v5;
  BOOL result;

  v5 = a3;
  result = -[MapsSuggestionsBaseFilter doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
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
