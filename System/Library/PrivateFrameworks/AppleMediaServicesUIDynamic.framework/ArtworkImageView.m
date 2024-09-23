@implementation ArtworkImageView

- (BOOL)amsuid_wantsArtworkStyle
{
  return 1;
}

- (_TtC27AppleMediaServicesUIDynamic16ArtworkImageView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B9D53700();
}

- (BOOL)hasContent
{
  return ArtworkImageView.hasContent.getter();
}

- (void)layoutSubviews
{
  _TtC27AppleMediaServicesUIDynamic16ArtworkImageView *v2;

  v2 = self;
  ArtworkImageView.layoutSubviews()();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC27AppleMediaServicesUIDynamic16ArtworkImageView *v6;
  _TtC27AppleMediaServicesUIDynamic16ArtworkImageView *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  ArtworkImageView.traitCollectionDidChange(_:)(v8);

}

- (_TtC27AppleMediaServicesUIDynamic16ArtworkImageView)init
{
  ArtworkImageView.init()();
}

- (_TtC27AppleMediaServicesUIDynamic16ArtworkImageView)initWithFrame:(CGRect)a3
{
  ArtworkImageView.init(frame:)();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_29_0(OBJC_IVAR____TtC27AppleMediaServicesUIDynamic16ArtworkImageView_backgroundView);
  OUTLINED_FUNCTION_29_0(OBJC_IVAR____TtC27AppleMediaServicesUIDynamic16ArtworkImageView_underlyingImageView);
  OUTLINED_FUNCTION_29_0(OBJC_IVAR____TtC27AppleMediaServicesUIDynamic16ArtworkImageView_iapArtowrkBorderView);
  swift_bridgeObjectRelease();
}

@end
