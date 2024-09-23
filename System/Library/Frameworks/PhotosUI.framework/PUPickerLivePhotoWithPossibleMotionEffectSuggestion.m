@implementation PUPickerLivePhotoWithPossibleMotionEffectSuggestion

- (PUPickerLivePhotoWithPossibleMotionEffectSuggestion)init
{
  return (PUPickerLivePhotoWithPossibleMotionEffectSuggestion *)PickerLivePhotoWithPossibleMotionEffectSuggestion.init()();
}

- (BOOL)isEqual:(id)a3
{
  return sub_20D1ECBEC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))PickerLivePhotoWithPossibleMotionEffectSuggestion.isEqual(_:));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUPickerLivePhotoWithPossibleMotionEffectSuggestion)initWithCoder:(id)a3
{
  PUPickerLivePhotoWithPossibleMotionEffectSuggestion *result;

  PickerLivePhotoWithPossibleMotionEffectSuggestion.init(coder:)(a3);
  return result;
}

- (BOOL)shouldReverseSortOrder
{
  return 0;
}

@end
