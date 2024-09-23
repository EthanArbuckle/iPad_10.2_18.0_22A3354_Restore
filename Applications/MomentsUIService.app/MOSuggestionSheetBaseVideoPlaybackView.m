@implementation MOSuggestionSheetBaseVideoPlaybackView

+ (Class)layerClass
{
  uint64_t v2;

  v2 = type metadata accessor for UIApplication(0, &lazy cache variable for type metadata for AVPlayerLayer, AVPlayerLayer_ptr);
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (_TtC16MomentsUIService38MOSuggestionSheetBaseVideoPlaybackView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MOSuggestionSheetBaseVideoPlaybackView();
  return -[MOSuggestionSheetBaseVideoPlaybackView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC16MomentsUIService38MOSuggestionSheetBaseVideoPlaybackView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MOSuggestionSheetBaseVideoPlaybackView();
  return -[MOSuggestionSheetBaseVideoPlaybackView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
