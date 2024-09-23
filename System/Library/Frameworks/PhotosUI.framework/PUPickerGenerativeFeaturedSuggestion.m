@implementation PUPickerGenerativeFeaturedSuggestion

- (PUPickerGenerativeFeaturedSuggestion)init
{
  return (PUPickerGenerativeFeaturedSuggestion *)PickerGenerativeFeaturedSuggestion.init()();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUPickerGenerativeFeaturedSuggestion)initWithCoder:(id)a3
{
  PUPickerGenerativeFeaturedSuggestion *result;

  PickerGenerativeFeaturedSuggestion.init(coder:)(a3);
  return result;
}

- (BOOL)shouldReverseSortOrder
{
  return 0;
}

@end
