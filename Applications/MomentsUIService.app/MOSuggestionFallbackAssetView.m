@implementation MOSuggestionFallbackAssetView

- (_TtC16MomentsUIService29MOSuggestionFallbackAssetView)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService29MOSuggestionFallbackAssetView *)MOSuggestionFallbackAssetView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MomentsUIService29MOSuggestionFallbackAssetView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC16MomentsUIService29MOSuggestionFallbackAssetView *result;

  v5 = OBJC_IVAR____TtC16MomentsUIService29MOSuggestionFallbackAssetView_imageView;
  v6 = objc_allocWithZone((Class)UIImageView);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtC16MomentsUIService29MOSuggestionFallbackAssetView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001001A6460, "MomentsUIService/MOSuggestionFallbackAssetView.swift", 52, 2, 89, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService29MOSuggestionFallbackAssetView_imageView));
}

@end
