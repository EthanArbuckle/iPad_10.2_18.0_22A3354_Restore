@implementation PUPickerSpatialSuggestion

- (PUPickerSpatialSuggestion)init
{
  return (PUPickerSpatialSuggestion *)PickerSpatialSuggestion.init()();
}

- (BOOL)isEqual:(id)a3
{
  return sub_20D1ECBEC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))PickerSpatialSuggestion.isEqual(_:));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUPickerSpatialSuggestion)initWithCoder:(id)a3
{
  PUPickerSpatialSuggestion *result;

  PickerSpatialSuggestion.init(coder:)(a3);
  return result;
}

- (BOOL)shouldReverseSortOrder
{
  return 0;
}

@end
