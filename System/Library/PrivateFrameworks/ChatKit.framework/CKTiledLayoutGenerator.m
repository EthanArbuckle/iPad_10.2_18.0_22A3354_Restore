@implementation CKTiledLayoutGenerator

- (CKTiledLayoutGenerator)init
{
  CKTiledLayoutGenerator *v2;
  void *v3;
  double v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKTiledLayoutGenerator;
  v2 = -[CKTiledLayoutGenerator init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scale");
    v5 = v4;

    -[CKTiledLayoutGenerator setRoundingScale:](v2, "setRoundingScale:", v5);
  }
  return v2;
}

- (void)enumerateFramesWithBlock:(id)a3
{
  -[CKTiledLayoutGenerator setParsedFrameBlock:](self, "setParsedFrameBlock:", a3);
  -[CKTiledLayoutGenerator willParseTiles](self, "willParseTiles");
  -[CKTiledLayoutGenerator parseTiles](self, "parseTiles");
  -[CKTiledLayoutGenerator didParseTiles](self, "didParseTiles");
  -[CKTiledLayoutGenerator setParsedFrameBlock:](self, "setParsedFrameBlock:", 0);
}

- (void)parseTiles
{
  while (!-[CKTiledLayoutGenerator isAtEnd](self, "isAtEnd")
       && -[CKTiledLayoutGenerator parseNextTiles](self, "parseNextTiles")
       && !-[CKTiledLayoutGenerator shouldStop](self, "shouldStop"))
    ;
}

- (void)willParseTiles
{
  self->_cacheTailLocation = 0;
  self->_cacheHeadLocation = 0;
  -[CKTiledLayoutGenerator setScanLocation:](self, "setScanLocation:", 0);
  -[CKTiledLayoutGenerator setScannedBatchID:](self, "setScannedBatchID:", 0);
  -[CKTiledLayoutGenerator setScannedBatchHasCaption:](self, "setScannedBatchHasCaption:", 0);
}

- (BOOL)parseNextTiles
{
  -[CKTiledLayoutGenerator doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (CKTiledLayoutGeneratorScanState)scanState
{
  CKTiledLayoutGeneratorScanState *v3;
  void *v4;

  v3 = objc_alloc_init(CKTiledLayoutGeneratorScanState);
  -[CKTiledLayoutGeneratorScanState setScanLocation:](v3, "setScanLocation:", -[CKTiledLayoutGenerator scanLocation](self, "scanLocation"));
  -[CKTiledLayoutGenerator scannedBatchID](self, "scannedBatchID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTiledLayoutGeneratorScanState setScannedBatchID:](v3, "setScannedBatchID:", v4);

  -[CKTiledLayoutGeneratorScanState setScannedBatchHasCaption:](v3, "setScannedBatchHasCaption:", -[CKTiledLayoutGenerator scannedBatchHasCaption](self, "scannedBatchHasCaption"));
  -[CKTiledLayoutGeneratorScanState setScanSpecialSequenceCount:](v3, "setScanSpecialSequenceCount:", -[CKTiledLayoutGenerator scanSpecialSequenceCount](self, "scanSpecialSequenceCount"));
  return v3;
}

- (void)setScanState:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  -[CKTiledLayoutGenerator setScanLocation:](self, "setScanLocation:", objc_msgSend(v4, "scanLocation"));
  objc_msgSend(v4, "scannedBatchID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTiledLayoutGenerator setScannedBatchID:](self, "setScannedBatchID:", v5);

  -[CKTiledLayoutGenerator setScannedBatchHasCaption:](self, "setScannedBatchHasCaption:", objc_msgSend(v4, "scannedBatchHasCaption"));
  v6 = objc_msgSend(v4, "scanSpecialSequenceCount");

  -[CKTiledLayoutGenerator setScanSpecialSequenceCount:](self, "setScanSpecialSequenceCount:", v6);
}

- (BOOL)isAtEnd
{
  int64_t v3;

  v3 = -[CKTiledLayoutGenerator scanLocation](self, "scanLocation");
  return v3 >= -[CKTiledLayoutGenerator tileCount](self, "tileCount");
}

- (BOOL)scanTile:(id *)a3 passingTest:(id)a4
{
  _QWORD *v6;
  int v7;
  int64_t v8;
  id v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  int v17;
  int v18;
  id v19;
  double (**v20)(_QWORD, _QWORD);
  double v21;
  void *v22;
  double (**v23)(_QWORD, _QWORD);
  double v24;
  void *v25;
  uint64_t (**v26)(_QWORD, _QWORD);
  void *v27;
  void (**v28)(_QWORD, _QWORD);
  char *v29;
  int64_t cacheTailLocation;
  uint64_t (*v31)(_QWORD *, _QWORD *);
  void *v33;
  _QWORD v34[5];
  char v35;
  char v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;

  v6 = a4;
  if (-[CKTiledLayoutGenerator isAtEnd](self, "isAtEnd"))
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    v8 = -[CKTiledLayoutGenerator scanLocation](self, "scanLocation");
    -[CKTiledLayoutGenerator scannedBatchID](self, "scannedBatchID");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    v39 = 0;
    v10 = v8 % 20;
    v33 = v9;
    if (v8 < self->_cacheTailLocation || v8 >= self->_cacheHeadLocation)
    {
      -[CKTiledLayoutGenerator tileImageSizeBlock](self, "tileImageSizeBlock", v9);
      v20 = (double (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v13 = v20[2](v20, v8);
      v14 = v21;

      -[CKTiledLayoutGenerator tileMinimumSizeBlock](self, "tileMinimumSizeBlock");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        -[CKTiledLayoutGenerator tileMinimumSizeBlock](self, "tileMinimumSizeBlock");
        v23 = (double (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v15 = v23[2](v23, v8);
        v16 = v24;

      }
      else
      {
        v15 = *MEMORY[0x1E0C9D820];
        v16 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      }

      -[CKTiledLayoutGenerator tileHasCaptionBlock](self, "tileHasCaptionBlock");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        -[CKTiledLayoutGenerator tileHasCaptionBlock](self, "tileHasCaptionBlock");
        v26 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v17 = v26[2](v26, v8);

      }
      else
      {
        v17 = 0;
      }

      -[CKTiledLayoutGenerator tileBatchIDBlock](self, "tileBatchIDBlock");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        -[CKTiledLayoutGenerator tileBatchIDBlock](self, "tileBatchIDBlock");
        v28 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v28[2](v28, v8);
        v19 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v19 = 0;
      }

      if (v8)
      {
        if (v9 == v19)
          v18 = 0;
        else
          v18 = objc_msgSend(v9, "isEqual:", v19) ^ 1;
      }
      else
      {
        v18 = 1;
      }
      v29 = (char *)self + 48 * v10;
      *((_QWORD *)v29 + 3) = v8;
      *((CGFloat *)v29 + 4) = v13;
      *((CGFloat *)v29 + 5) = v14;
      *((CGFloat *)v29 + 6) = v15;
      *((CGFloat *)v29 + 7) = v16;
      v29[64] = v17;
      v29[65] = v18;
      *(_DWORD *)(v29 + 66) = 0;
      *((_WORD *)v29 + 35) = 0;
      objc_storeStrong(&self->_cachedBatchID[v10], v19);
      self->_cacheHeadLocation = v8 + 1;
      cacheTailLocation = self->_cacheTailLocation;
      if (v8 >= cacheTailLocation)
      {
        if (cacheTailLocation <= v8 - 19)
          cacheTailLocation = v8 - 19;
        self->_cacheTailLocation = cacheTailLocation;
      }
      else
      {
        self->_cacheTailLocation = v8;
      }
      v12 = v8;
    }
    else
    {
      v11 = (char *)self + 48 * v10;
      v12 = *((_QWORD *)v11 + 3);
      v13 = *((double *)v11 + 4);
      v14 = *((double *)v11 + 5);
      v15 = *((double *)v11 + 6);
      v16 = *((double *)v11 + 7);
      v17 = v11[64];
      v18 = v11[65];
      v39 = *(_DWORD *)(v11 + 66);
      v40 = *((_WORD *)v11 + 35);
      v19 = self->_cachedBatchID[v10];
    }
    v31 = (uint64_t (*)(_QWORD *, _QWORD *))v6[2];
    v34[0] = v12;
    *(CGFloat *)&v34[1] = v13;
    *(CGFloat *)&v34[2] = v14;
    *(CGFloat *)&v34[3] = v15;
    *(CGFloat *)&v34[4] = v16;
    v35 = v17;
    v36 = v18;
    v37 = v39;
    v38 = v40;
    v7 = v31(v6, v34);
    if (v7)
    {
      if (a3)
      {
        a3->var0 = v12;
        a3->var1.width = v13;
        a3->var1.height = v14;
        a3->var2.width = v15;
        a3->var2.height = v16;
        a3->var3 = v17;
        a3->var4 = v18;
        *(_DWORD *)(&a3->var4 + 1) = v39;
        *(_WORD *)(&a3->var4 + 5) = v40;
      }
      -[CKTiledLayoutGenerator setScanLocation:](self, "setScanLocation:", v8 + 1, v33);
      -[CKTiledLayoutGenerator setScannedBatchID:](self, "setScannedBatchID:", v19);
      if (((v17 | v18) & 1) != 0)
        -[CKTiledLayoutGenerator setScannedBatchHasCaption:](self, "setScannedBatchHasCaption:", v17 & 1);
    }

  }
  return v7;
}

- (BOOL)scanAnyTile:(id *)a3
{
  return -[CKTiledLayoutGenerator scanTile:passingTest:](self, "scanTile:passingTest:", a3, &__block_literal_global_234);
}

uint64_t __38__CKTiledLayoutGenerator_scanAnyTile___block_invoke()
{
  return 1;
}

- (BOOL)scanTileWithPortraitImage:(id *)a3
{
  return -[CKTiledLayoutGenerator scanTile:ofType:](self, "scanTile:ofType:", a3, 2);
}

- (BOOL)scanTileWithLandscapeImage:(id *)a3
{
  return -[CKTiledLayoutGenerator scanTile:ofType:](self, "scanTile:ofType:", a3, 1);
}

- (BOOL)scanTileWithHorizontalPanorama:(id *)a3
{
  return -[CKTiledLayoutGenerator scanTile:ofType:](self, "scanTile:ofType:", a3, 3);
}

- (BOOL)scanTileWithSquareImage:(id *)a3
{
  return -[CKTiledLayoutGenerator scanTile:ofType:](self, "scanTile:ofType:", a3, 0);
}

- (BOOL)scanTile:(id *)a3 type:(int64_t *)a4
{
  BOOL v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__CKTiledLayoutGenerator_scanTile_type___block_invoke;
  v7[3] = &unk_1E2759800;
  v7[4] = &v8;
  v5 = -[CKTiledLayoutGenerator scanTile:passingTest:](self, "scanTile:passingTest:", a3, v7);
  if (a4)
    *a4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __40__CKTiledLayoutGenerator_scanTile_type___block_invoke(uint64_t a1, uint64_t a2)
{
  double v2;
  uint64_t v3;

  v2 = *(double *)(a2 + 8) / *(double *)(a2 + 16);
  if (v2 >= 2.5)
  {
    v3 = 3;
  }
  else if (v2 <= 1.04999995)
  {
    if (v2 >= 0.952380996)
    {
      v3 = 0;
    }
    else
    {
      v3 = 4;
      if (v2 > 0.4)
        v3 = 2;
    }
  }
  else
  {
    v3 = 1;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
  return 1;
}

- (BOOL)scanTile:(id *)a3 ofType:(int64_t)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__CKTiledLayoutGenerator_scanTile_ofType___block_invoke;
  v5[3] = &__block_descriptor_40_e36_B56__0___q_CGSize_dd__CGSize_dd_BB_8l;
  v5[4] = a4;
  return -[CKTiledLayoutGenerator scanTile:passingTest:](self, "scanTile:passingTest:", a3, v5);
}

BOOL __42__CKTiledLayoutGenerator_scanTile_ofType___block_invoke(uint64_t a1, uint64_t a2)
{
  double v2;
  uint64_t v3;

  v2 = *(double *)(a2 + 8) / *(double *)(a2 + 16);
  if (v2 >= 2.5)
  {
    v3 = 3;
  }
  else if (v2 <= 1.04999995)
  {
    if (v2 >= 0.952380996)
    {
      v3 = 0;
    }
    else
    {
      v3 = 4;
      if (v2 > 0.4)
        v3 = 2;
    }
  }
  else
  {
    v3 = 1;
  }
  return v3 == *(_QWORD *)(a1 + 32);
}

- (CGSize)captionSizeForTileAtIndex:(int64_t)a3 proposedSize:(CGSize)a4
{
  double height;
  double width;
  void *v8;
  double (**v9)(_QWORD, _QWORD, double, double);
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a4.height;
  width = a4.width;
  -[CKTiledLayoutGenerator tileCaptionSizeBlock](self, "tileCaptionSizeBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CKTiledLayoutGenerator tileCaptionSizeBlock](self, "tileCaptionSizeBlock");
    v9 = (double (**)(_QWORD, _QWORD, double, double))objc_claimAutoreleasedReturnValue();
    width = v9[2](v9, a3, width, height);
    height = v10;

  }
  v11 = width;
  v12 = height;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)parsedFrame:(CGRect)a3 type:(int64_t)a4 forTileAtIndex:(int64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD, double, double, double, double);
  char v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CKTiledLayoutGenerator parsedFrameBlock](self, "parsedFrameBlock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v14 = 0;
    -[CKTiledLayoutGenerator parsedFrameBlock](self, "parsedFrameBlock");
    v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, double, double, double, double))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, int64_t, int64_t, char *, double, double, double, double))v13)[2](v13, a5, a4, &v14, x, y, width, height);

    if (v14)
      -[CKTiledLayoutGenerator setShouldStop:](self, "setShouldStop:", 1);
  }
}

- (double)valueByRounding:(double)a3 usingMagneticGuidelines:(BOOL)a4
{
  double v6;
  double v7;
  int64_t v8;
  double v9;

  if (a4 && -[CKTiledLayoutGenerator numberOfMagneticGuidelines](self, "numberOfMagneticGuidelines") >= 1)
  {
    -[CKTiledLayoutGenerator referenceDistanceForMagneticGuidelines](self, "referenceDistanceForMagneticGuidelines");
    v7 = v6;
    v8 = -[CKTiledLayoutGenerator numberOfMagneticGuidelines](self, "numberOfMagneticGuidelines") + 1;
    a3 = v7 / (double)v8 * round(a3 / (v7 / (double)v8));
  }
  -[CKTiledLayoutGenerator roundingScale](self, "roundingScale");
  return round(a3 * v9) / v9;
}

- (int64_t)tileCount
{
  return self->_tileCount;
}

- (void)setTileCount:(int64_t)a3
{
  self->_tileCount = a3;
}

- (CGSize)interTileSpacing
{
  double width;
  double height;
  CGSize result;

  width = self->_interTileSpacing.width;
  height = self->_interTileSpacing.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setInterTileSpacing:(CGSize)a3
{
  self->_interTileSpacing = a3;
}

- (id)tileImageSizeBlock
{
  return self->_tileImageSizeBlock;
}

- (void)setTileImageSizeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1160);
}

- (id)tileMinimumSizeBlock
{
  return self->_tileMinimumSizeBlock;
}

- (void)setTileMinimumSizeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1168);
}

- (UIEdgeInsets)captionPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_captionPadding.top;
  left = self->_captionPadding.left;
  bottom = self->_captionPadding.bottom;
  right = self->_captionPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setCaptionPadding:(UIEdgeInsets)a3
{
  self->_captionPadding = a3;
}

- (CGSize)noCaptionSpacing
{
  double width;
  double height;
  CGSize result;

  width = self->_noCaptionSpacing.width;
  height = self->_noCaptionSpacing.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setNoCaptionSpacing:(CGSize)a3
{
  self->_noCaptionSpacing = a3;
}

- (id)tileHasCaptionBlock
{
  return self->_tileHasCaptionBlock;
}

- (void)setTileHasCaptionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1176);
}

- (id)tileCaptionSizeBlock
{
  return self->_tileCaptionSizeBlock;
}

- (void)setTileCaptionSizeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1184);
}

- (id)tileBatchIDBlock
{
  return self->_tileBatchIDBlock;
}

- (void)setTileBatchIDBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1192);
}

- (int64_t)numberOfMagneticGuidelines
{
  return self->_numberOfMagneticGuidelines;
}

- (void)setNumberOfMagneticGuidelines:(int64_t)a3
{
  self->_numberOfMagneticGuidelines = a3;
}

- (double)roundingScale
{
  return self->_roundingScale;
}

- (void)setRoundingScale:(double)a3
{
  self->_roundingScale = a3;
}

- (id)parsedFrameBlock
{
  return self->_parsedFrameBlock;
}

- (void)setParsedFrameBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1216);
}

- (int64_t)scanLocation
{
  return self->_scanLocation;
}

- (void)setScanLocation:(int64_t)a3
{
  self->_scanLocation = a3;
}

- (id)scannedBatchID
{
  return self->_scannedBatchID;
}

- (void)setScannedBatchID:(id)a3
{
  objc_storeStrong(&self->_scannedBatchID, a3);
}

- (BOOL)scannedBatchHasCaption
{
  return self->_scannedBatchHasCaption;
}

- (void)setScannedBatchHasCaption:(BOOL)a3
{
  self->_scannedBatchHasCaption = a3;
}

- (int64_t)scanSpecialSequenceCount
{
  return self->_scanSpecialSequenceCount;
}

- (void)setScanSpecialSequenceCount:(int64_t)a3
{
  self->_scanSpecialSequenceCount = a3;
}

- (BOOL)shouldStop
{
  return self->_shouldStop;
}

- (void)setShouldStop:(BOOL)a3
{
  self->_shouldStop = a3;
}

- (void).cxx_destruct
{
  uint64_t v3;
  id *v4;

  objc_storeStrong(&self->_scannedBatchID, 0);
  objc_storeStrong(&self->_parsedFrameBlock, 0);
  objc_storeStrong(&self->_tileBatchIDBlock, 0);
  objc_storeStrong(&self->_tileCaptionSizeBlock, 0);
  objc_storeStrong(&self->_tileHasCaptionBlock, 0);
  objc_storeStrong(&self->_tileMinimumSizeBlock, 0);
  objc_storeStrong(&self->_tileImageSizeBlock, 0);
  v3 = 0;
  v4 = &self->_cachedBatchID[19];
  do
    objc_storeStrong(&v4[v3--], 0);
  while (v3 != -20);
}

@end
