@implementation _MKMaskingPolygonOverlayRenderer

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[VKVectorOverlayMaskingPolygonGroup setStyle:](self->_vectorData, "setStyle:", a3 == 1);
  }
}

- (BOOL)_canProvideVectorGeometry
{
  return 1;
}

- (id)_vectorGeometry
{
  VKVectorOverlayMaskingPolygonGroup *vectorData;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  id v16;
  void *v17;
  VKVectorOverlayMaskingPolygonGroup *v18;
  VKVectorOverlayMaskingPolygonGroup *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  vectorData = self->_vectorData;
  if (!vectorData)
  {
    v4 = (void *)MEMORY[0x1E0C99DE8];
    -[MKOverlayRenderer overlay](self, "overlay");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "polygons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[MKOverlayRenderer overlay](self, "overlay");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "polygons");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v15 = objc_alloc(MEMORY[0x1E0DC6598]);
          v16 = objc_retainAutorelease(v14);
          v17 = (void *)objc_msgSend(v15, "initWithMapPoints:count:", objc_msgSend(v16, "points"), objc_msgSend(v16, "pointCount"));
          objc_msgSend(v7, "addObject:", v17);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v11);
    }

    v18 = (VKVectorOverlayMaskingPolygonGroup *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6590]), "initWithPolygons:", v7);
    v19 = self->_vectorData;
    self->_vectorData = v18;

    -[VKVectorOverlayMaskingPolygonGroup setStyle:](self->_vectorData, "setStyle:", -[_MKMaskingPolygonOverlayRenderer style](self, "style") == 1);
    -[VKVectorOverlayMaskingPolygonGroup setFillMode:](self->_vectorData, "setFillMode:", 1);

    vectorData = self->_vectorData;
  }
  return vectorData;
}

- (id)vectorDataForOverlay:(id)a3
{
  void *v4;

  if (-[_MKMaskingPolygonOverlayRenderer _canProvideVectorGeometry](self, "_canProvideVectorGeometry", a3))
  {
    -[_MKMaskingPolygonOverlayRenderer _vectorGeometry](self, "_vectorGeometry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)canDrawMapRect:(id)a3 zoomScale:(double)a4
{
  double var1;
  double var0;
  double v7;
  double v8;
  int64_t v10;
  objc_super v12;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v7 = a3.var0.var1;
  v8 = a3.var0.var0;
  v10 = -[_MKMaskingPolygonOverlayRenderer style](self, "style");
  if (v10 != 1)
  {
    v12.receiver = self;
    v12.super_class = (Class)_MKMaskingPolygonOverlayRenderer;
    LOBYTE(v10) = -[MKOverlayRenderer canDrawMapRect:zoomScale:](&v12, sel_canDrawMapRect_zoomScale_, v8, v7, var0, var1, a4);
  }
  return v10;
}

- (BOOL)_canPossiblyDrawMapRect:(id)a3 zoomScale:(double)a4
{
  double var1;
  double var0;
  double v7;
  double v8;
  int64_t v10;
  objc_super v12;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v7 = a3.var0.var1;
  v8 = a3.var0.var0;
  v10 = -[_MKMaskingPolygonOverlayRenderer style](self, "style");
  if (v10 != 1)
  {
    v12.receiver = self;
    v12.super_class = (Class)_MKMaskingPolygonOverlayRenderer;
    LOBYTE(v10) = -[MKOverlayRenderer _canPossiblyDrawMapRect:zoomScale:](&v12, sel__canPossiblyDrawMapRect_zoomScale_, v8, v7, var0, var1, a4);
  }
  return v10;
}

- (int64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vectorData, 0);
}

@end
