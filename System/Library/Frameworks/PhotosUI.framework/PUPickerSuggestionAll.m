@implementation PUPickerSuggestionAll

- (PUPickerSuggestionAll)init
{
  return (PUPickerSuggestionAll *)PickerSuggestionAll.init()();
}

- (BOOL)isEqual:(id)a3
{
  return sub_20D1ECBEC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))PickerSuggestionAll.isEqual(_:));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUPickerSuggestionAll)initWithCoder:(id)a3
{
  PUPickerSuggestionAll *result;

  PickerSuggestionAll.init(coder:)(a3);
  return result;
}

- (BOOL)shouldReverseSortOrder
{
  return 0;
}

@end
