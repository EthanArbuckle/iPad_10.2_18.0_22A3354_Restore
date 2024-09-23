@implementation _GradientPolylineRenderer

- (_GradientPolylineRenderer)initWithOverlay:(id)a3 locationReadings:(id)a4
{
  id v6;
  _GradientPolylineRenderer *v7;
  HKRouteMapGenerator *v8;
  HKRouteMapGenerator *generator;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_GradientPolylineRenderer;
  v7 = -[MKOverlayPathRenderer initWithOverlay:](&v11, sel_initWithOverlay_, a3);
  if (v7)
  {
    v8 = objc_alloc_init(HKRouteMapGenerator);
    generator = v7->_generator;
    v7->_generator = v8;

    -[HKRouteMapGenerator setLocationReadings:](v7->_generator, "setLocationReadings:", v6);
  }

  return v7;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_originMapPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[MKOverlayRenderer overlay](self, "overlay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "boundingMapRect");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5
{
  double var1;
  double var0;
  double v9;
  double v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  CGFloat v17;
  HKRouteMapGenerator *generator;
  _QWORD v19[6];

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v9 = a3.var0.var1;
  v10 = a3.var0.var0;
  -[_GradientPolylineRenderer _originMapPoint](self, "_originMapPoint");
  v13 = v12;
  v15 = v14;
  CGContextSetBlendMode(a5, kCGBlendModeNormal);
  -[MKOverlayPathRenderer applyStrokePropertiesToContext:atZoomScale:](self, "applyStrokePropertiesToContext:atZoomScale:", a5, a4);
  -[MKOverlayRenderer overlay](self, "overlay");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MKRoadWidthAtZoomScale(a4);
  generator = self->_generator;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __61___GradientPolylineRenderer_drawMapRect_zoomScale_inContext___block_invoke;
  v19[3] = &__block_descriptor_48_e24__CGPoint_dd_24__0___dd_8l;
  v19[4] = v13;
  v19[5] = v15;
  -[HKRouteMapGenerator drawLinesWithPolyline:lineWidth:mapRect:context:pointFromMapPoint:](generator, "drawLinesWithPolyline:lineWidth:mapRect:context:pointFromMapPoint:", v16, a5, v19, v17, v10, v9, var0, var1);

}

- (BOOL)canDrawMapRect:(id)a3 zoomScale:(double)a4
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generator, 0);
}

@end
