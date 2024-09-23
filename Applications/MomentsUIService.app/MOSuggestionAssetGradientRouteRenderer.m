@implementation MOSuggestionAssetGradientRouteRenderer

- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5
{
  CGContext *v7;
  _TtC16MomentsUIService38MOSuggestionAssetGradientRouteRenderer *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CGFloat v14;
  _QWORD v15[6];

  v7 = a5;
  v8 = self;
  v9 = -[MOSuggestionAssetGradientRouteRenderer overlay](v8, "overlay");
  objc_msgSend(v9, "boundingMapRect");
  v11 = v10;
  v13 = v12;
  swift_unknownObjectRelease(v9);
  v14 = MKRoadWidthAtZoomScale(a4) * 0.666666667;
  -[MOSuggestionAssetGradientRouteRenderer applyStrokePropertiesToContext:atZoomScale:](v8, "applyStrokePropertiesToContext:atZoomScale:", v7, a4);
  v15[2] = v8;
  v15[3] = v11;
  v15[4] = v13;
  (*(void (**)(CGContext *, uint64_t (*)(), _QWORD *, CGFloat))((swift_isaMask & (uint64_t)v8->super.super.super.isa)
                                                                                   + 0x78))(v7, partial apply for closure #1 in MOSuggestionAssetGradientRouteRenderer.draw(_:zoomScale:in:), v15, v14);

}

- (_TtC16MomentsUIService38MOSuggestionAssetGradientRouteRenderer)initWithOverlay:(id)a3
{
  _TtC16MomentsUIService38MOSuggestionAssetGradientRouteRenderer *result;

  swift_unknownObjectRetain();
  result = (_TtC16MomentsUIService38MOSuggestionAssetGradientRouteRenderer *)_swift_stdlib_reportUnimplementedInitializer("MomentsUIService.MOSuggestionAssetGradientRouteRenderer", 55, "init(overlay:)", 14, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MomentsUIService38MOSuggestionAssetGradientRouteRenderer_routeLocations));
}

@end
