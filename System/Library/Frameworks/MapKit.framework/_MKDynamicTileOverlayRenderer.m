@implementation _MKDynamicTileOverlayRenderer

- ($4479F518DFD59EF68F6FA14DAF968345)_keyToTilePath:(SEL)a3
{
  __int128 v5;
  $4479F518DFD59EF68F6FA14DAF968345 *result;
  double v7;

  *(_QWORD *)&v5 = *(_QWORD *)&a4->var0;
  *((_QWORD *)&v5 + 1) = HIDWORD(*(_QWORD *)&a4->var0);
  *(_OWORD *)&retstr->var0 = v5;
  retstr->var2 = a4->var2;
  retstr->var3 = 0.0;
  result = ($4479F518DFD59EF68F6FA14DAF968345 *)-[MKOverlayRenderer contentScaleFactor](self, "contentScaleFactor");
  retstr->var3 = v7;
  return result;
}

- (_MKDynamicTileOverlayRenderer)initWithOverlay:(id)a3
{
  id v4;
  _MKDynamicTileOverlayRenderer *v5;
  _MKDynamicTileOverlayRenderer *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)_MKDynamicTileOverlayRenderer;
    v5 = -[MKOverlayRenderer initWithOverlay:](&v12, sel_initWithOverlay_, v4);

    self = v5;
    v6 = self;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Expected a _MKDynamicTileOverlay but got %@"), v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

    v6 = 0;
  }

  return v6;
}

- (BOOL)_mayExtendOutsideBounds
{
  return 0;
}

- (void)setAlpha:(double)a3
{
  VKCustomTileOverlayProviderData *customDataProvider;
  uint64_t v6;
  _QWORD v7[7];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_MKDynamicTileOverlayRenderer;
  -[MKOverlayRenderer setAlpha:](&v8, sel_setAlpha_);
  customDataProvider = self->_customDataProvider;
  if (customDataProvider)
  {
    -[VKCustomTileOverlayProviderData alpha](customDataProvider, "alpha");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42___MKDynamicTileOverlayRenderer_setAlpha___block_invoke;
    v7[3] = &unk_1E20DB2B0;
    v7[4] = self;
    v7[5] = v6;
    *(double *)&v7[6] = a3;
    -[MKOverlayRenderer _animateIfNecessaryForKey:withStepHandler:](self, "_animateIfNecessaryForKey:withStepHandler:", CFSTR("alpha"), v7);
  }
}

- (void)setDesiredDisplayRate:(unint64_t)a3
{
  VKCustomTileOverlayProviderData *customDataProvider;

  self->_desiredDisplayRate = a3;
  customDataProvider = self->_customDataProvider;
  if (customDataProvider)
    -[VKCustomTileOverlayProviderData setDesiredDisplayRate:](customDataProvider, "setDesiredDisplayRate:");
}

- (void)setUseNativeDisplayRate:(BOOL)a3
{
  VKCustomTileOverlayProviderData *customDataProvider;

  self->_useNativeDisplayRate = a3;
  customDataProvider = self->_customDataProvider;
  if (customDataProvider)
    -[VKCustomTileOverlayProviderData setForceNativeDisplayRate:](customDataProvider, "setForceNativeDisplayRate:");
}

- (void)setForceContinuousLayout:(BOOL)a3
{
  VKCustomTileOverlayProviderData *customDataProvider;

  self->_forceContinuousLayout = a3;
  customDataProvider = self->_customDataProvider;
  if (customDataProvider)
    -[VKCustomTileOverlayProviderData setForceContinuousLayout:](customDataProvider, "setForceContinuousLayout:");
}

- (BOOL)canDrawKey:(id *)a3 withTile:(id)a4
{
  return 1;
}

- (unint64_t)estimatedCostForTile:(id)a3
{
  return 0x100000;
}

- (void)overlay:(id)a3 drawKey:(id *)a4 withData:(id)a5 inIOSurface:(__IOSurface *)a6 withTimestamp:(double)a7
{
  id v11;
  _OWORD v12[2];
  __int128 v13;
  __int128 v14;

  v13 = 0u;
  v14 = 0u;
  v11 = a5;
  -[_MKDynamicTileOverlayRenderer _keyToTilePath:](self, "_keyToTilePath:", a4);
  v12[0] = v13;
  v12[1] = v14;
  -[_MKDynamicTileOverlayRenderer drawTileAtPath:withTile:inIOSurface:withTimestamp:](self, "drawTileAtPath:withTile:inIOSurface:withTimestamp:", v12, v11, a6, a7);

}

- (void)overlay:(id)a3 drawKey:(id *)a4 withData:(id)a5 inTexture:(id)a6 withTimestamp:(double)a7 withTileScale:(float)a8
{
  id v13;
  id v14;
  _OWORD v15[2];
  __int128 v16;
  __int128 v17;

  v16 = 0u;
  v17 = 0u;
  v13 = a6;
  v14 = a5;
  -[_MKDynamicTileOverlayRenderer _keyToTilePath:](self, "_keyToTilePath:", a4);
  v15[0] = v16;
  v15[1] = v17;
  -[_MKDynamicTileOverlayRenderer drawTileAtPath:withTile:inTexture:withTimestamp:withTileScale:](self, "drawTileAtPath:withTile:inTexture:withTimestamp:withTileScale:", v15, v14, v13, a7, COERCE_DOUBLE(__PAIR64__(DWORD1(v17), LODWORD(a8))));

}

- (BOOL)overlay:(id)a3 canDrawKey:(id *)a4 withData:(id)a5
{
  id v7;
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  v7 = a5;
  -[_MKDynamicTileOverlayRenderer _keyToTilePath:](self, "_keyToTilePath:", a4);
  v9[0] = v10;
  v9[1] = v11;
  LOBYTE(a4) = -[_MKDynamicTileOverlayRenderer canDrawKey:withTile:](self, "canDrawKey:withTile:", v9, v7);

  return (char)a4;
}

- (void)overlay:(id)a3 didExitKey:(id *)a4
{
  _OWORD v5[2];
  __int128 v6;
  __int128 v7;

  v6 = 0u;
  v7 = 0u;
  -[_MKDynamicTileOverlayRenderer _keyToTilePath:](self, "_keyToTilePath:", a4);
  v5[0] = v6;
  v5[1] = v7;
  -[_MKDynamicTileOverlayRenderer didExitTile:](self, "didExitTile:", v5);
}

- (void)overlay:(id)a3 didEnterKey:(id *)a4 withFallback:(BOOL)a5
{
  _BOOL8 v5;
  _OWORD v7[2];
  __int128 v8;
  __int128 v9;

  v5 = a5;
  v8 = 0u;
  v9 = 0u;
  -[_MKDynamicTileOverlayRenderer _keyToTilePath:](self, "_keyToTilePath:", a4);
  v7[0] = v8;
  v7[1] = v9;
  -[_MKDynamicTileOverlayRenderer didEnterTile:withFallback:](self, "didEnterTile:withFallback:", v7, v5);
}

- (void)overlay:(id)a3 onVisibleTiles:(id)a4
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _OWORD *v12;
  __int128 v13;
  __int128 v14;

  v5 = objc_retainAutorelease(a4);
  v6 = objc_msgSend(v5, "bytes");
  v7 = objc_msgSend(v5, "length");
  v8 = v7 >> 4;
  v9 = malloc_type_malloc(32 * (v7 >> 4), 0x1000040E0EAB150uLL);
  v10 = v9;
  if (v7 >= 0x10)
  {
    if (v8 <= 1)
      v11 = 1;
    else
      v11 = v7 >> 4;
    v12 = v9;
    do
    {
      -[_MKDynamicTileOverlayRenderer _keyToTilePath:](self, "_keyToTilePath:", v6);
      *v12 = v13;
      v12[1] = v14;
      v12 += 2;
      v6 += 16;
      --v11;
    }
    while (v11);
  }
  -[_MKDynamicTileOverlayRenderer onVisibleTiles:count:](self, "onVisibleTiles:count:", v10, v8);
  free(v10);

}

- (BOOL)overlayCanProvideCustomTileData:(id)a3
{
  return 1;
}

- (unint64_t)overlay:(id)a3 estimatedCostForCustomTileData:(id)a4
{
  return -[_MKDynamicTileOverlayRenderer estimatedCostForTile:](self, "estimatedCostForTile:", a4);
}

- (BOOL)isFallbackEnabled
{
  return 0;
}

- (BOOL)useMetalTexture
{
  return 0;
}

- (unsigned)anisotropy
{
  return 1;
}

- (id)customTileProviderForOverlay:(id)a3
{
  VKCustomTileOverlayProviderData *customDataProvider;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  VKCustomTileOverlayProviderData *v15;
  VKCustomTileOverlayProviderData *v16;

  customDataProvider = self->_customDataProvider;
  if (!customDataProvider)
  {
    -[MKOverlayRenderer overlay](self, "overlay", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "minimumZ");

    -[MKOverlayRenderer overlay](self, "overlay");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "maximumZ");

    v9 = 0xFFFFFFFFLL;
    if (v6 >= 0xFFFFFFFFLL)
      v10 = 0xFFFFFFFFLL;
    else
      v10 = v6;
    v11 = v10 & ~(v10 >> 63);
    if (v8 < 0xFFFFFFFFLL)
      v9 = v8;
    v12 = v9 & ~(v9 >> 63);
    v13 = objc_alloc(MEMORY[0x1E0DC64E0]);
    -[MKOverlayRenderer overlay](self, "overlay");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (VKCustomTileOverlayProviderData *)objc_msgSend(v13, "initWithProviderID:tileSize:minimumZ:maximumZ:", objc_msgSend(v14, "_providerID"), 512, v11, v12);
    v16 = self->_customDataProvider;
    self->_customDataProvider = v15;

    -[MKOverlayRenderer alpha](self, "alpha");
    -[VKCustomTileOverlayProviderData setAlpha:](self->_customDataProvider, "setAlpha:");
    -[VKCustomTileOverlayProviderData setDesiredDisplayRate:](self->_customDataProvider, "setDesiredDisplayRate:", -[_MKDynamicTileOverlayRenderer desiredDisplayRate](self, "desiredDisplayRate"));
    customDataProvider = self->_customDataProvider;
  }
  return customDataProvider;
}

- (unint64_t)desiredDisplayRate
{
  return self->_desiredDisplayRate;
}

- (BOOL)useNativeDisplayRate
{
  return self->_useNativeDisplayRate;
}

- (BOOL)forceContinuousLayout
{
  return self->_forceContinuousLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customDataProvider, 0);
}

@end
