@implementation PUPickerAssetCollectionSuggestion

- (NSString)localIdentifier
{
  void *v2;

  PickerAssetCollectionSuggestion.localIdentifier.getter();
  v2 = (void *)sub_20D206E60();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)extendedCuratedAssetsOnly
{
  return PickerAssetCollectionSuggestion.extendedCuratedAssetsOnly.getter() & 1;
}

- (BOOL)shouldReverseSortOrder
{
  return PickerAssetCollectionSuggestion.shouldReverseSortOrder.getter() & 1;
}

- (PUPickerAssetCollectionSuggestion)initWithLocalIdentifier:(id)a3 extendedCuratedAssetsOnly:(BOOL)a4 shouldReverseSortOrder:(BOOL)a5
{
  uint64_t v7;
  uint64_t v8;

  v7 = sub_20D206E78();
  return (PUPickerAssetCollectionSuggestion *)PickerAssetCollectionSuggestion.init(localIdentifier:extendedCuratedAssetsOnly:shouldReverseSortOrder:)(v7, v8, a4, a5);
}

- (BOOL)isEqual:(id)a3
{
  return sub_20D1ECBEC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))PickerAssetCollectionSuggestion.isEqual(_:));
}

+ (BOOL)supportsSecureCoding
{
  return static PickerAssetCollectionSuggestion.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static PickerAssetCollectionSuggestion.supportsSecureCoding.setter(a3);
}

- (PUPickerAssetCollectionSuggestion)initWithCoder:(id)a3
{
  return (PUPickerAssetCollectionSuggestion *)PickerAssetCollectionSuggestion.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  PUPickerAssetCollectionSuggestion *v5;

  v4 = a3;
  v5 = self;
  PickerAssetCollectionSuggestion.encode(with:)((NSCoder)v4);

}

- (PUPickerAssetCollectionSuggestion)init
{
  PickerAssetCollectionSuggestion.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
