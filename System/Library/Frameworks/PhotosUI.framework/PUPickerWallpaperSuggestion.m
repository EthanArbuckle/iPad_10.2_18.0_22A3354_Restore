@implementation PUPickerWallpaperSuggestion

- (int64_t)mode
{
  return PickerWallpaperSuggestion.mode.getter();
}

- (PUPickerWallpaperSuggestion)initWithMode:(int64_t)a3
{
  PUPickerWallpaperSuggestion *result;

  PickerWallpaperSuggestion.init(mode:)(a3);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  return sub_20D1ECBEC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))PickerWallpaperSuggestion.isEqual(_:));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUPickerWallpaperSuggestion)initWithCoder:(id)a3
{
  return (PUPickerWallpaperSuggestion *)PickerWallpaperSuggestion.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  PUPickerWallpaperSuggestion *v5;

  v4 = a3;
  v5 = self;
  PickerWallpaperSuggestion.encode(with:)((NSCoder)v4);

}

- (BOOL)shouldReverseSortOrder
{
  return 0;
}

- (PUPickerWallpaperSuggestion)init
{
  PickerWallpaperSuggestion.init()();
}

@end
