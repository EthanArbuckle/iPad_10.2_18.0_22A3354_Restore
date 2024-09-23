@implementation VNRegionOfInterestTiling

- (id)_initWithPixelOriginX:(unint64_t)a3 Y:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6 regionOfInterest:(CGRect)a7
{
  double height;
  double width;
  double y;
  double x;
  id result;
  objc_super v16;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)VNRegionOfInterestTiling;
  result = -[VNRegionOfInterestTiling init](&v16, sel_init);
  if (result)
  {
    *((_QWORD *)result + 1) = a3;
    *((_QWORD *)result + 2) = a4;
    *((_QWORD *)result + 3) = a5;
    *((_QWORD *)result + 4) = a6;
    *((double *)result + 5) = x;
    *((double *)result + 6) = y;
    *((double *)result + 7) = width;
    *((double *)result + 8) = height;
    *((double *)result + 9) = x * (double)a5;
    *((double *)result + 10) = y * (double)a6;
    *((double *)result + 11) = width * (double)a5;
    *((double *)result + 12) = height * (double)a6;
  }
  return result;
}

- (void)_calculateTilesHorizontally:(BOOL)a3 vertically:(BOOL)a4 tileAspectRatio:(double)a5 overlapPercentage:(double)a6 tileOverflowCount:(unint64_t)a7 addTileBlock:(id)a8 columnCount:(unint64_t *)a9 rowCount:(unint64_t *)a10
{
  _BOOL4 v15;
  _BOOL4 v16;
  void (**v18)(__n128, __n128, __n128, __n128);
  double width;
  double height;
  unint64_t v21;
  unint64_t v22;
  double v23;
  unint64_t v24;
  unint64_t v25;
  double v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  double y;
  double x;
  uint64_t v34;
  double v35;
  unint64_t v36;
  unint64_t v38;
  double v39;
  double v40;
  uint64_t v41;
  double v42;
  unint64_t v43;
  unint64_t *v44;
  void (**v45)(__n128, __n128, __n128, __n128);
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  v15 = a4;
  v16 = a3;
  v18 = (void (**)(__n128, __n128, __n128, __n128))a8;
  *a9 = 0;
  *a10 = 0;
  width = self->_pixelRegionOfInterest.size.width;
  if (width >= 1.0)
  {
    height = self->_pixelRegionOfInterest.size.height;
    if (height >= 1.0)
    {
      v21 = (unint64_t)width;
      v22 = (unint64_t)height;
      if (v16)
      {
        v23 = (double)v22;
        v24 = v22 - (unint64_t)((double)v22 * a6);
        v25 = (v21 + v24 - 1) / v24;
        if (v25 > a7)
          goto LABEL_26;
        v44 = a10;
        width = trunc(height * a5);
        v26 = (double)v24;
        v27 = 1;
      }
      else
      {
        if (!v15)
          goto LABEL_26;
        v26 = (double)v21;
        v28 = v21 - (unint64_t)((double)v21 * a6);
        v27 = (v28 + v22 - 1) / v28;
        if (v27 > a7)
          goto LABEL_26;
        v44 = a10;
        height = trunc(width / a5);
        v23 = (double)v28;
        v25 = 1;
      }
      v45 = v18;
      v29 = 0;
      v30 = (v25 >> 1) + 1;
      v31 = v27 >> 1;
      y = self->_pixelRegionOfInterest.origin.y;
      do
      {
        x = self->_pixelRegionOfInterest.origin.x;
        v34 = (v25 >> 1) + 1;
        do
        {
          v46.origin.x = x;
          v46.origin.y = y;
          v46.size.width = width;
          v46.size.height = height;
          v47 = CGRectIntersection(v46, self->_pixelRegionOfInterest);
          v45[2]((__n128)v47.origin, *(__n128 *)&v47.origin.y, (__n128)v47.size, *(__n128 *)&v47.size.height);
          x = x + v26;
          --v34;
        }
        while (v34);
        if (v30 < v25)
        {
          v35 = self->_pixelRegionOfInterest.origin.x + self->_pixelRegionOfInterest.size.width - width;
          v36 = ~(v25 >> 1) + v25;
          do
          {
            v48.origin.x = v35;
            v48.origin.y = y;
            v48.size.width = width;
            v48.size.height = height;
            v49 = CGRectIntersection(v48, self->_pixelRegionOfInterest);
            v45[2]((__n128)v49.origin, *(__n128 *)&v49.origin.y, (__n128)v49.size, *(__n128 *)&v49.size.height);
            v35 = v35 - v26;
            --v36;
          }
          while (v36);
        }
        y = y + v23;
      }
      while (v29++ != v31);
      v38 = v31 + 1;
      if (v31 + 1 < v27)
      {
        v39 = self->_pixelRegionOfInterest.origin.y + self->_pixelRegionOfInterest.size.height;
        do
        {
          v39 = v39 - v23;
          v40 = self->_pixelRegionOfInterest.origin.x;
          v41 = (v25 >> 1) + 1;
          do
          {
            v50.origin.x = v40;
            v50.origin.y = v39;
            v50.size.width = width;
            v50.size.height = height;
            v51 = CGRectIntersection(v50, self->_pixelRegionOfInterest);
            v45[2]((__n128)v51.origin, *(__n128 *)&v51.origin.y, (__n128)v51.size, *(__n128 *)&v51.size.height);
            v40 = v40 + v26;
            --v41;
          }
          while (v41);
          if (v30 < v25)
          {
            v42 = self->_pixelRegionOfInterest.origin.x + self->_pixelRegionOfInterest.size.width - height;
            v43 = ~(v25 >> 1) + v25;
            do
            {
              v52.origin.x = v42;
              v52.origin.y = v39;
              v52.size.width = width;
              v52.size.height = height;
              v53 = CGRectIntersection(v52, self->_pixelRegionOfInterest);
              v45[2]((__n128)v53.origin, *(__n128 *)&v53.origin.y, (__n128)v53.size, *(__n128 *)&v53.size.height);
              v42 = v42 - v26;
              --v43;
            }
            while (v43);
          }
          ++v38;
        }
        while (v38 != v27);
      }
      *a9 = v25;
      v18 = v45;
      *v44 = v27;
    }
  }
LABEL_26:

}

- (void)_calculateTilesWithAspectRatio:(double)a3 options:(id)a4
{
  VNRegionOfInterestTilingOptions *v6;
  VNRegionOfInterestTilingOptions *v7;
  double v8;
  double v9;
  _BOOL8 v10;
  _BOOL8 v11;
  id v12;
  id v13;
  void *v14;
  double v15;
  NSArray *v16;
  NSArray *tiles;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  _QWORD aBlock[5];
  id v22;
  float64x2_t v23;

  v6 = (VNRegionOfInterestTilingOptions *)a4;
  v7 = v6;
  if (self->_pixelRegionOfInterest.size.width >= 1.0 && self->_pixelRegionOfInterest.size.height >= 1.0)
  {
    if (!v6)
      v7 = objc_alloc_init(VNRegionOfInterestTilingOptions);
    -[VNRegionOfInterestTilingOptions regionOfInterestAspectRatioThreshold](v7, "regionOfInterestAspectRatioThreshold");
    v9 = self->_pixelRegionOfInterest.size.width / self->_pixelRegionOfInterest.size.height;
    v10 = v9 < v8 && v9 <= 1.0 / v8;
    v11 = v9 >= v8;
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__VNRegionOfInterestTiling__calculateTilesWithAspectRatio_options___block_invoke;
    aBlock[3] = &unk_1E4546D40;
    v23 = vcvtq_f64_u64(*(uint64x2_t *)&self->_pixelOriginX);
    aBlock[4] = self;
    v22 = v12;
    v13 = v12;
    v14 = _Block_copy(aBlock);
    v19 = 0;
    v20 = 0;
    -[VNRegionOfInterestTilingOptions tileOverlapPercentage](v7, "tileOverlapPercentage");
    -[VNRegionOfInterestTiling _calculateTilesHorizontally:vertically:tileAspectRatio:overlapPercentage:tileOverflowCount:addTileBlock:columnCount:rowCount:](self, "_calculateTilesHorizontally:vertically:tileAspectRatio:overlapPercentage:tileOverflowCount:addTileBlock:columnCount:rowCount:", v11, v10, -[VNRegionOfInterestTilingOptions tileOverflowCount](v7, "tileOverflowCount"), v14, &v20, &v19, a3, v15);
    v16 = (NSArray *)objc_msgSend(v13, "copy");
    tiles = self->_tiles;
    self->_tiles = v16;

    v18 = v19;
    self->_columnCount = v20;
    self->_rowCount = v18;

  }
}

- (CGRect)pixelBounds
{
  double pixelOriginX;
  double pixelOriginY;
  double pixelWidth;
  double pixelHeight;
  CGRect result;

  pixelOriginX = (double)self->_pixelOriginX;
  pixelOriginY = (double)self->_pixelOriginY;
  pixelWidth = (double)self->_pixelWidth;
  pixelHeight = (double)self->_pixelHeight;
  result.size.height = pixelHeight;
  result.size.width = pixelWidth;
  result.origin.y = pixelOriginY;
  result.origin.x = pixelOriginX;
  return result;
}

- (unint64_t)tileCount
{
  return -[NSArray count](self->_tiles, "count");
}

- (void)enumerateTilesUsingBlock:(id)a3
{
  -[NSArray enumerateObjectsUsingBlock:](self->_tiles, "enumerateObjectsUsingBlock:", a3);
}

- (unint64_t)pixelWidth
{
  return self->_pixelWidth;
}

- (unint64_t)pixelHeight
{
  return self->_pixelHeight;
}

- (CGRect)regionOfInterest
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_regionOfInterest, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)pixelRegionOfInterest
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_pixelRegionOfInterest, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (unint64_t)tileRowsCount
{
  return self->_rowCount;
}

- (unint64_t)tileColumnsCount
{
  return self->_columnCount;
}

- (NSArray)tiles
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tiles, 0);
}

void __67__VNRegionOfInterestTiling__calculateTilesWithAspectRatio_options___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  VNRegionOfInterestTile *v6;
  CGRect v7;

  v7 = CGRectOffset(*(CGRect *)&a2, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56));
  v6 = -[VNRegionOfInterestTile initWithTiling:pixelCropRect:]([VNRegionOfInterestTile alloc], "initWithTiling:pixelCropRect:", *(_QWORD *)(a1 + 32), v7.origin.x, v7.origin.y, v7.size.width, v7.size.height);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

+ (id)tilingForRegionOfInterest:(CGRect)a3 inPixelBounds:(CGRect)a4 tileAspectRatio:(double)a5 options:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  id v15;
  void *v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3.size.height;
  v11 = a3.size.width;
  v12 = a3.origin.y;
  v13 = a3.origin.x;
  v15 = a6;
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithPixelOriginX:Y:width:height:regionOfInterest:", (unint64_t)x, (unint64_t)y, (unint64_t)width, (unint64_t)height, v13, v12, v11, v10);
  objc_msgSend(v16, "_calculateTilesWithAspectRatio:options:", v15, a5);

  return v16;
}

+ (id)tilingForRegionOfInterest:(CGRect)a3 inPixelWidth:(unint64_t)a4 height:(unint64_t)a5 tileAspectRatio:(double)a6 options:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  void *v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15 = a7;
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithPixelOriginX:Y:width:height:regionOfInterest:", 0, 0, a4, a5, x, y, width, height);
  objc_msgSend(v16, "_calculateTilesWithAspectRatio:options:", v15, a6);

  return v16;
}

@end
