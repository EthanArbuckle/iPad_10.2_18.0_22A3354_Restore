@implementation VNRegionOfInterestTile

- (VNRegionOfInterestTile)initWithTiling:(id)a3 pixelCropRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  VNRegionOfInterestTile *v10;
  VNRegionOfInterestTile *v11;
  objc_super v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VNRegionOfInterestTile;
  v10 = -[VNRegionOfInterestTile init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_tiling, v9);
    v11->_pixelCropRect.origin.x = x;
    v11->_pixelCropRect.origin.y = y;
    v11->_pixelCropRect.size.width = width;
    v11->_pixelCropRect.size.height = height;
  }

  return v11;
}

- (id)description
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v12.receiver = self;
  v12.super_class = (Class)VNRegionOfInterestTile;
  -[VNRegionOfInterestTile description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNRegionOfInterestTile pixelCropRect](self, "pixelCropRect");
  VNHumanReadableCGRect(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ %@"), v4, v9);

  return v10;
}

- (CGRect)pixelCropRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_pixelCropRect, 32, 1, 0);
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tiling);
}

@end
