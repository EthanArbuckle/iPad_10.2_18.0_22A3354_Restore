@implementation MKPolygonView

- (MKPolygonView)initWithPolygon:(MKPolygon *)polygon
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MKPolygonView;
  return -[MKOverlayPathView initWithOverlay:](&v4, sel_initWithOverlay_, polygon);
}

- (void)createPath
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  CGPath *PathForPolygon;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CGPath *v16;
  const CGPath *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[MKOverlayView _originMapPoint](self, "_originMapPoint");
  v4 = v3;
  v6 = v5;
  -[MKOverlayView overlay](self, "overlay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PathForPolygon = CreatePathForPolygon(v7, v4, v6);

  -[MKOverlayView overlay](self, "overlay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "interiorPolygons");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = CreatePathForPolygon(*(void **)(*((_QWORD *)&v18 + 1) + 8 * v15), v4, v6);
        if (v16)
        {
          v17 = v16;
          CGPathAddPath(PathForPolygon, 0, v16);
          CGPathRelease(v17);
        }
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  -[MKOverlayPathView setPath:](self, "setPath:", PathForPolygon, (_QWORD)v18);
  CGPathRelease(PathForPolygon);

}

- (void)fillPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  void *v6;

  -[MKOverlayPathView fillColor](self, "fillColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    if (v6)
    {
      CGContextBeginPath(a4);
      CGContextAddPath(a4, a3);
      CGContextDrawPath(a4, kCGPathEOFill);
    }
  }
}

- (void)strokePath:(CGPath *)a3 inContext:(CGContext *)a4
{
  void *v6;

  -[MKOverlayPathView strokeColor](self, "strokeColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    if (v6)
    {
      CGContextBeginPath(a4);
      CGContextAddPath(a4, a3);
      CGContextStrokePath(a4);
    }
  }
}

@end
