@implementation NUTiledImageLayer

- (void)_updateSublayers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  NUTiledImageLayer *v26;
  __int128 v27;
  __int128 v28;
  char v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[NUTiledImageLayer _tileLayers](self, "_tileLayers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v41;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v41 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v7++), "removeFromSuperlayer");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v5);
  }

  -[NUTiledImageLayer _tileLayers](self, "_tileLayers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

  -[NUTiledImageLayer image](self, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[NUTiledImageLayer geometry](self, "geometry");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[NUTiledImageLayer position](self, "position");
      -[NUTiledImageLayer anchorPoint](self, "anchorPoint");
      -[NUTiledImageLayer bounds](self, "bounds");
      NUAbsolutePointInRect();
      -[NUTiledImageLayer geometry](self, "geometry");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "renderScale");
      NUScaleToDouble();

      -[NUTiledImageLayer bounds](self, "bounds");
      v38 = 0u;
      v39 = 0u;
      NUPixelRectFromCGRect();
      if (-[NUTiledImageLayer isGeometryFlipped](self, "isGeometryFlipped"))
      {
        v32 = 0;
        v33 = 0;
        v34 = objc_msgSend(v9, "size");
        v35 = v12;
        v30 = v38;
        v31 = v39;
        NUPixelRectFlipYOrigin();
        v38 = v36;
        v39 = v37;
      }
      v36 = v38;
      v37 = v39;
      objc_msgSend(MEMORY[0x24BE6C3F0], "regionWithRect:", &v36);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "validRegion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[NUTiledImageLayer validRegionInsets](self, "validRegionInsets");
      objc_msgSend(v14, "regionByShrinkingBy:", v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "regionByClippingToRegion:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v18, "isEmpty") & 1) == 0)
      {
        objc_msgSend(v9, "colorSpace");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v19, "isHDR") & 1) != 0)
          v20 = 1;
        else
          v20 = objc_msgSend(v19, "isExtended");
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 3221225472;
        v22[2] = __37__NUTiledImageLayer__updateSublayers__block_invoke;
        v22[3] = &unk_24C625718;
        v23 = v19;
        v24 = v18;
        v27 = v38;
        v28 = v39;
        v25 = v9;
        v26 = self;
        v29 = v20;
        v21 = v19;
        objc_msgSend(v25, "readSurfaceRegion:withBlock:", v24, v22);

      }
    }
  }

}

- (NSMutableArray)_tileLayers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (NUImageGeometry)_geometry
{
  return (NUImageGeometry *)objc_getProperty(self, a2, 48, 1);
}

- (NUPurgeableTextureImage)_image
{
  return (NUPurgeableTextureImage *)objc_getProperty(self, a2, 40, 1);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)validRegionInsets
{
  $86B46DF249C2B4242DBB096758D29184 *p_validRegionInsets;
  int64_t x;
  int64_t y;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  p_validRegionInsets = &self->_validRegionInsets;
  x = self->_validRegionInsets.x;
  y = p_validRegionInsets->y;
  result.var1 = y;
  result.var0 = x;
  return result;
}

void __37__NUTiledImageLayer__updateSublayers__block_invoke_2(uint64_t a1, __int128 *a2)
{
  NUTileLayer *v4;
  void *v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  CGRect v9;

  NUPixelRectOffset();
  v7 = *a2;
  v8 = a2[1];
  NUPixelRectOffset();
  v4 = -[NUTileLayer initWithImage:tile:]([NUTileLayer alloc], "initWithImage:tile:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v7, v8, 0, 0);
  -[NUTileLayer setAnchorPoint:](v4, "setAnchorPoint:", 0.0, 0.0);
  NUPixelPointToCGPoint();
  -[NUTileLayer setPosition:](v4, "setPosition:");
  -[NUTileLayer setBounds:](v4, "setBounds:", 0.0, 0.0, (double)0, (double)0);
  NUPixelRectToCGRect();
  CGRectInset(v9, 0.0, 0.0);
  NURectNormalize();
  -[NUTileLayer setContentsRect:](v4, "setContentsRect:", 0, 0, 0, 0);
  objc_msgSend(*(id *)(a1 + 48), "IOSurface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUTileLayer setContents:](v4, "setContents:", v5);

  -[NUTileLayer setDelegate:](v4, "setDelegate:", *(_QWORD *)(a1 + 56));
  -[NUTileLayer setAllowsEdgeAntialiasing:](v4, "setAllowsEdgeAntialiasing:", 0);
  -[NUTileLayer setWantsExtendedDynamicRangeContent:](v4, "setWantsExtendedDynamicRangeContent:", *(unsigned __int8 *)(a1 + 160));
  objc_msgSend(*(id *)(a1 + 56), "addSublayer:", v4);
  objc_msgSend(*(id *)(a1 + 56), "_tileLayers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

}

- (BOOL)nu_contentsAreFlipped
{
  return 1;
}

- (void)setImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NUTiledImageLayer _image](self, "_image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endAccess");

  -[NUTiledImageLayer set_image:](self, "set_image:", v4);
  -[NUTiledImageLayer _image](self, "_image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginAccess");

  -[NUTiledImageLayer setNeedsLayout](self, "setNeedsLayout");
}

- (void)setGeometry:(id)a3
{
  id v4;
  void *v5;
  CGFloat v6;
  CATransform3D v7;
  CATransform3D v8;

  v4 = a3;
  -[NUTiledImageLayer _geometry](self, "_geometry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUTiledImageLayer set_geometry:](self, "set_geometry:", v4);
  if (!v5 || (objc_msgSend(v4, "renderScale"), objc_msgSend(v5, "renderScale"), (NUScaleEqual() & 1) == 0))
  {
    objc_msgSend(v4, "renderScale");
    NUScaleInvert();
    NUScaleToDouble();
    CATransform3DMakeScale(&v8, v6, v6, 1.0);
    v7 = v8;
    -[NUTiledImageLayer setTransform:](self, "setTransform:", &v7);
    -[NUTiledImageLayer setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)set_image:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)set_geometry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NUTiledImageLayer)init
{
  NUTiledImageLayer *v2;
  NUTiledImageLayer *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NUTiledImageLayer;
  v2 = -[NUTiledImageLayer init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[NUTiledImageLayer setGeometryFlipped:](v2, "setGeometryFlipped:", -[NUTiledImageLayer nu_contentsAreFlipped](v2, "nu_contentsAreFlipped") ^ 1);
    -[NUTiledImageLayer setAllowsEdgeAntialiasing:](v3, "setAllowsEdgeAntialiasing:", 0);
    v4 = (void *)objc_opt_new();
    -[NUTiledImageLayer set_tileLayers:](v3, "set_tileLayers:", v4);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[NUTiledImageLayer _image](self, "_image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endAccess");

  -[NUTiledImageLayer set_image:](self, "set_image:", 0);
  -[NUTiledImageLayer _tileLayers](self, "_tileLayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  v5.receiver = self;
  v5.super_class = (Class)NUTiledImageLayer;
  -[NUTiledImageLayer dealloc](&v5, sel_dealloc);
}

- (id)snapshotImage
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  CGAffineTransform v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  -[NUTiledImageLayer bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = objc_alloc(MEMORY[0x24BDBF660]);
  objc_msgSend(MEMORY[0x24BDBF638], "redColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithColor:", v12);
  objc_msgSend(v13, "imageByCroppingToRect:", v4, v6, v8, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[NUTiledImageLayer sublayers](self, "sublayers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v33 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v20, "contents");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBF660]), "initWithIOSurface:", v21);
        objc_msgSend(v20, "position");
        v24 = v23;
        v26 = v25;
        objc_msgSend(v22, "extent");
        CGAffineTransformMakeTranslation(&v31, v24, v10 - (v26 + v27));
        objc_msgSend(v22, "imageByApplyingTransform:", &v31);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          objc_msgSend(v28, "imageByCompositingOverImage:", v14);
          v29 = objc_claimAutoreleasedReturnValue();

          v14 = (void *)v29;
        }

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v17);
  }

  return v14;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  NSPoint v22;
  NSPoint v23;
  NSRect v24;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUTiledImageLayer name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ - name:%@\n"), self, v4);

  -[NUTiledImageLayer delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tdelegate:%@\n"), v5);

  -[NUTiledImageLayer position](self, "position");
  NSStringFromPoint(v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tposition:%@\n"), v6);

  -[NUTiledImageLayer bounds](self, "bounds");
  NSStringFromRect(v24);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tbounds:%@\n"), v7);

  -[NUTiledImageLayer contentsScale](self, "contentsScale");
  objc_msgSend(v3, "appendFormat:", CFSTR("\tcontentScale:%f\n"), v8);
  -[NUTiledImageLayer anchorPoint](self, "anchorPoint");
  NSStringFromPoint(v23);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tanchorPoint:%@\n"), v9);

  -[NUTiledImageLayer transform](self, "transform");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%.15g, %.15g, %.15g, %.15g, %.15g, %.15g, %.15g, %.15g, %.15g, %.15g, %.15g, %.15g, %.15g, %.15g, %.15g, %.15g}"), v13, v14, v15, v16, v17, v18, v19, v20, v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\ttransform:%@\n"), v10);

  -[NUTiledImageLayer image](self, "image");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\timage:%@\n"), v11);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null", a3, a4);
}

- (CGColor)debugColor
{
  return (CGColor *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDebugColor:(CGColor *)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setValidRegionInsets:(id)a3
{
  self->_validRegionInsets = ($86B46DF249C2B4242DBB096758D29184)a3;
}

- (void)set_tileLayers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__tileLayers, 0);
  objc_storeStrong((id *)&self->__geometry, 0);
  objc_storeStrong((id *)&self->__image, 0);
}

void __37__NUTiledImageLayer__updateSublayers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  void *v13;
  __int128 v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  char v31;
  _BYTE v32[32];
  __int128 v33;
  __int128 v34;

  v3 = a2;
  v4 = v3;
  v33 = 0u;
  v34 = 0u;
  if (v3)
    objc_msgSend(v3, "frameRect");
  objc_msgSend(v4, "surface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "surface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "size");
  objc_msgSend(v4, "surface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "size");
  v10 = v9;

  objc_msgSend(v5, "setColorSpace:", objc_msgSend(*(id *)(a1 + 32), "CGColorSpace"));
  v11 = *(void **)(a1 + 40);
  if (v4)
    objc_msgSend(v4, "contentRect");
  else
    memset(v32, 0, sizeof(v32));
  v12 = (double)v7;
  objc_msgSend(v11, "regionByClippingToRect:", v32);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __37__NUTiledImageLayer__updateSublayers__block_invoke_2;
  v18[3] = &unk_24C6256F0;
  v23 = v33;
  v24 = v34;
  v14 = *(_OWORD *)(a1 + 80);
  v25 = *(_OWORD *)(a1 + 64);
  v26 = v14;
  v19 = *(id *)(a1 + 48);
  v20 = v4;
  v27 = 0;
  v28 = 0;
  v29 = v12;
  v30 = (double)v10;
  v15 = *(_QWORD *)(a1 + 56);
  v21 = v5;
  v22 = v15;
  v31 = *(_BYTE *)(a1 + 96);
  v16 = v5;
  v17 = v4;
  objc_msgSend(v13, "enumerateRects:", v18);

}

+ (id)defaultActionForKey:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null", a3);
}

@end
