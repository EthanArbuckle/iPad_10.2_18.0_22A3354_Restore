@implementation VNSaliencyImageObservation

- (VNSaliencyImageObservation)initWithOriginatingRequestSpecifier:(id)a3 rawSaliencyImage:(__CVBuffer *)a4 originalImageSize:(CGSize)a5 salientObjectBoundingBoxes:(id)a6
{
  CGFloat height;
  CGFloat width;
  id v11;
  id v12;
  VNSaliencyImageObservation *v13;
  VNSaliencyImageObservation *v14;
  CGPoint *v15;
  CGSize v16;
  CGSize v17;
  uint64_t v18;
  NSArray *mSalientObjects;
  objc_super v21;

  height = a5.height;
  width = a5.width;
  v11 = a3;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)VNSaliencyImageObservation;
  v13 = -[VNPixelBufferObservation initWithOriginatingRequestSpecifier:featureName:CVPixelBuffer:](&v21, sel_initWithOriginatingRequestSpecifier_featureName_CVPixelBuffer_, v11, 0, a4);
  v14 = v13;
  if (v13)
  {
    v13->_mOriginalImageSize.width = width;
    v13->_mOriginalImageSize.height = height;
    v15 = (CGPoint *)MEMORY[0x1E0C9D628];
    v16 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v13->_mSalientRegion.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v13->_mSalientRegion.size = v16;
    v17 = (CGSize)v15[1];
    v13->_mHighlySalientRegion.origin = *v15;
    v13->_mHighlySalientRegion.size = v17;
    v18 = objc_msgSend(v12, "copy");
    mSalientObjects = v14->_mSalientObjects;
    v14->_mSalientObjects = (NSArray *)v18;

  }
  return v14;
}

- (VNSaliencyImageObservation)initWithCoder:(id)a3
{
  id v4;
  VNSaliencyImageObservation *v5;
  void *v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *mSalientObjects;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  VNSaliencyImageObservation *v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)VNSaliencyImageObservation;
  v5 = -[VNPixelBufferObservation initWithCoder:](&v25, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("VNSaliencyImageObservation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "intValue") != 1)
    {

      v23 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("OISW"));
    v8 = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("OISH"));
    v5->_mOriginalImageSize.width = v8;
    v5->_mOriginalImageSize.height = v9;
    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("SOBJ"));
    v13 = objc_claimAutoreleasedReturnValue();
    mSalientObjects = v5->_mSalientObjects;
    v5->_mSalientObjects = (NSArray *)v13;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("BBOX"));
    v5->_mSalientRegion.origin.x = v15;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("BBOY"));
    v5->_mSalientRegion.origin.y = v16;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("BBSW"));
    v5->_mSalientRegion.size.width = v17;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("BBSH"));
    v5->_mSalientRegion.size.height = v18;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("NBBOX"));
    v5->_mHighlySalientRegion.origin.x = v19;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("NBBOY"));
    v5->_mHighlySalientRegion.origin.y = v20;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("NBBSW"));
    v5->_mHighlySalientRegion.size.width = v21;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("NBBSH"));
    v5->_mHighlySalientRegion.size.height = v22;

  }
  v23 = v5;
LABEL_6:

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A1B0B060]();
  v6.receiver = self;
  v6.super_class = (Class)VNSaliencyImageObservation;
  -[VNPixelBufferObservation encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", &unk_1E459C7F0, CFSTR("VNSaliencyImageObservation"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("OISW"), self->_mOriginalImageSize.width);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("OISH"), self->_mOriginalImageSize.height);
  objc_msgSend(v4, "encodeObject:forKey:", self->_mSalientObjects, CFSTR("SOBJ"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("BBOX"), self->_mSalientRegion.origin.x);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("BBOY"), self->_mSalientRegion.origin.y);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("BBSW"), self->_mSalientRegion.size.width);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("BBSH"), self->_mSalientRegion.size.height);
  self = (VNSaliencyImageObservation *)((char *)self + 192);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("NBBOX"), *(double *)&self->super.super.super.isa);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("NBBOY"), *(double *)&self->super.super._originatingRequestSpecifier);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("NBBSW"), *(double *)&self->super.super._confidence);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("NBBSH"), *(double *)&self->super.super._uuid);
  objc_autoreleasePoolPop(v5);

}

- (id)vn_cloneObject
{
  uint64_t v3;
  _QWORD *v4;
  CGSize size;
  CGSize v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VNSaliencyImageObservation;
  -[VNPixelBufferObservation vn_cloneObject](&v10, sel_vn_cloneObject);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (_QWORD *)v3;
  if (v3)
  {
    size = self->_mSalientRegion.size;
    *(CGPoint *)(v3 + 160) = self->_mSalientRegion.origin;
    *(CGSize *)(v3 + 176) = size;
    v6 = self->_mHighlySalientRegion.size;
    *(CGPoint *)(v3 + 192) = self->_mHighlySalientRegion.origin;
    *(CGSize *)(v3 + 208) = v6;
    *(CGSize *)(v3 + 144) = self->_mOriginalImageSize;
    v7 = -[NSArray copy](self->_mSalientObjects, "copy");
    v8 = (void *)v4[29];
    v4[29] = v7;

  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  double *v4;
  BOOL v5;
  objc_super v7;

  v4 = (double *)a3;
  v7.receiver = self;
  v7.super_class = (Class)VNSaliencyImageObservation;
  v5 = -[VNPixelBufferObservation isEqual:](&v7, sel_isEqual_, v4)
    && self->_mOriginalImageSize.height == v4[19]
    && self->_mOriginalImageSize.width == v4[18];

  return v5;
}

- (unint64_t)hash
{
  id v3;
  double width;
  double height;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNSaliencyImageObservation;
  v3 = -[VNPixelBufferObservation hash](&v7, sel_hash);
  width = self->_mOriginalImageSize.width;
  if (width == 0.0)
    width = 0.0;
  height = self->_mOriginalImageSize.height;
  if (height == 0.0)
    height = 0.0;
  return *(_QWORD *)&height ^ __ROR8__(*(_QWORD *)&width, 51) ^ __ROR8__(v3, 51);
}

- (__CVBuffer)createSaliencyImageAndReturnError:(id *)a3
{
  return CVPixelBufferRetain(-[VNPixelBufferObservation pixelBuffer](self, "pixelBuffer", a3));
}

- (id)salientObjectsAndReturnError:(id *)a3
{
  return self->_mSalientObjects;
}

- (void)_computeBoundingBoxes
{
  __CVBuffer *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  CGSize v10;
  CGSize v11;
  id v12;

  v3 = -[VNPixelBufferObservation pixelBuffer](self, "pixelBuffer");
  LODWORD(v4) = 1022739087;
  LODWORD(v5) = 4.0;
  LODWORD(v6) = 1022739087;
  +[VNHeatMapUtilities boundingBoxesFromFloat32PixelBuffer:thresholds:relativeToMaximum:applySmoothing:originalImageSize:sigmaX:sigmaY:nStd:error:](VNHeatMapUtilities, "boundingBoxesFromFloat32PixelBuffer:thresholds:relativeToMaximum:applySmoothing:originalImageSize:sigmaX:sigmaY:nStd:error:", v3, &unk_1E459DFE8, 1, 1, 0, self->_mOriginalImageSize.width, self->_mOriginalImageSize.height, v4, v6, v5);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count") == 2)
  {
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getValue:size:", &self->_mSalientRegion, 32);

    objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getValue:size:", &self->_mHighlySalientRegion, 32);

  }
  else
  {
    v9 = MEMORY[0x1E0C9D628];
    v10 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    self->_mSalientRegion.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    self->_mSalientRegion.size = v10;
    v11 = *(CGSize *)(v9 + 16);
    self->_mHighlySalientRegion.origin = *(CGPoint *)v9;
    self->_mHighlySalientRegion.size = v11;
  }

}

- (NSArray)salientObjects
{
  return self->_mSalientObjects;
}

- (CGRect)boundingBox
{
  os_unfair_lock_s *p_mComputeBoundingBoxesLock;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  p_mComputeBoundingBoxesLock = &self->_mComputeBoundingBoxesLock;
  os_unfair_lock_lock(&self->_mComputeBoundingBoxesLock);
  if (CGRectIsNull(self->_mSalientRegion))
    -[VNSaliencyImageObservation _computeBoundingBoxes](self, "_computeBoundingBoxes");
  os_unfair_lock_unlock(p_mComputeBoundingBoxesLock);
  x = self->_mSalientRegion.origin.x;
  y = self->_mSalientRegion.origin.y;
  width = self->_mSalientRegion.size.width;
  height = self->_mSalientRegion.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)narrowedBoundingBox
{
  os_unfair_lock_s *p_mComputeBoundingBoxesLock;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  p_mComputeBoundingBoxesLock = &self->_mComputeBoundingBoxesLock;
  os_unfair_lock_lock(&self->_mComputeBoundingBoxesLock);
  if (CGRectIsNull(self->_mHighlySalientRegion))
    -[VNSaliencyImageObservation _computeBoundingBoxes](self, "_computeBoundingBoxes");
  os_unfair_lock_unlock(p_mComputeBoundingBoxesLock);
  x = self->_mHighlySalientRegion.origin.x;
  y = self->_mHighlySalientRegion.origin.y;
  width = self->_mHighlySalientRegion.size.width;
  height = self->_mHighlySalientRegion.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mSalientObjects, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
