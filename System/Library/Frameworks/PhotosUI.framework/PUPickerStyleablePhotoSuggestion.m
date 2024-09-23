@implementation PUPickerStyleablePhotoSuggestion

- (PUPickerStyleablePhotoSuggestion)init
{
  return (PUPickerStyleablePhotoSuggestion *)PickerStyleablePhotoSuggestion.init()();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUPickerStyleablePhotoSuggestion)initWithCoder:(id)a3
{
  PUPickerStyleablePhotoSuggestion *result;

  PickerStyleablePhotoSuggestion.init(coder:)(a3);
  return result;
}

- (BOOL)shouldReverseSortOrder
{
  return 0;
}

@end
