@implementation MOSuggestionSheetVideoPlaybackView.ThumbnailView

- (_TtCC16MomentsUIService34MOSuggestionSheetVideoPlaybackView13ThumbnailView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtCC16MomentsUIService34MOSuggestionSheetVideoPlaybackView13ThumbnailView *result;

  v5 = OBJC_IVAR____TtCC16MomentsUIService34MOSuggestionSheetVideoPlaybackView13ThumbnailView_imageView;
  v6 = objc_allocWithZone((Class)UIImageView);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtCC16MomentsUIService34MOSuggestionSheetVideoPlaybackView13ThumbnailView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001001A6460, "MomentsUIService/MOSuggestionSheetVideoPlaybackView.swift", 57, 2, 448, 0);
  __break(1u);
  return result;
}

- (_TtCC16MomentsUIService34MOSuggestionSheetVideoPlaybackView13ThumbnailView)initWithFrame:(CGRect)a3
{
  @objc MOSuggestionCutoutView.init(frame:)((uint64_t)self, (uint64_t)a2, (uint64_t)"MomentsUIService.ThumbnailView", 30);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MomentsUIService34MOSuggestionSheetVideoPlaybackView13ThumbnailView_imageView));
}

@end
