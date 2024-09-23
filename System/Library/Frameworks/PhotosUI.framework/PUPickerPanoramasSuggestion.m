@implementation PUPickerPanoramasSuggestion

- (PUPickerPanoramasSuggestion)init
{
  return (PUPickerPanoramasSuggestion *)PickerPanoramasSuggestion.init()();
}

- (BOOL)isEqual:(id)a3
{
  return sub_20D1ECBEC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))PickerPanoramasSuggestion.isEqual(_:));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUPickerPanoramasSuggestion)initWithCoder:(id)a3
{
  PUPickerPanoramasSuggestion *result;

  PickerPanoramasSuggestion.init(coder:)(a3);
  return result;
}

- (BOOL)shouldReverseSortOrder
{
  return 0;
}

@end
