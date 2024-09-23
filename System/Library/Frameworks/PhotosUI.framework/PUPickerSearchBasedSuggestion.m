@implementation PUPickerSearchBasedSuggestion

- (int64_t)mode
{
  return PickerSearchBasedSuggestion.mode.getter();
}

- (PUPickerSearchBasedSuggestion)initWithMode:(int64_t)a3
{
  PUPickerSearchBasedSuggestion *result;

  PickerSearchBasedSuggestion.init(mode:)(a3);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  return sub_20D1ECBEC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))PickerSearchBasedSuggestion.isEqual(_:));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUPickerSearchBasedSuggestion)initWithCoder:(id)a3
{
  return (PUPickerSearchBasedSuggestion *)PickerSearchBasedSuggestion.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  PUPickerSearchBasedSuggestion *v5;

  v4 = a3;
  v5 = self;
  PickerSearchBasedSuggestion.encode(with:)((NSCoder)v4);

}

- (BOOL)shouldReverseSortOrder
{
  return 0;
}

- (PUPickerSearchBasedSuggestion)init
{
  PickerSearchBasedSuggestion.init()();
}

@end
