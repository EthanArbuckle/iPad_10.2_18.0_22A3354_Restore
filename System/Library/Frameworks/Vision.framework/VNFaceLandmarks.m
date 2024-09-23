@implementation VNFaceLandmarks

- (unint64_t)requestRevision
{
  void *v2;
  unint64_t v3;

  -[VNFaceLandmarks originatingRequestSpecifier](self, "originatingRequestSpecifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "requestRevision");

  return v3;
}

- (VNFaceLandmarks)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  VNFaceLandmarks *v33;
  void *v34;
  uint64_t v36;
  id v37;
  void *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  double v44;
  id v45;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("VNFaceLandmarks"));
  if ((_DWORD)v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to unarchive VNFaceLandmarks object due to coding version mismatch: Currently supported: %u; encoded: %u"),
                   0,
                   v5);
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v7);
LABEL_8:

LABEL_9:
    v33 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("FLMs_Conf"));
  v9 = v8;
  v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FLMs_PtsCnt"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FLMs_PtsData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_class();
  v12 = objc_msgSend(v6, "length");
  if (v12 != objc_msgSend(v11, "landmarkPointSizeInBytes") * v10)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Data integrity check failed when unarchiving an object of type: %@"), v11);
    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v7);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v34);
    goto LABEL_7;
  }
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("FLMs_AlgnBBoxX"));
  v44 = v13;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("FLMs_AlgnBBoxY"));
  v15 = v14;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("FLMs_AlgnBBoxW"));
  v17 = v16;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("FLMs_AlgnBBoxH"));
  v19 = v18;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("FLMs_UsrFacingBBoxX"));
  v21 = v20;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("FLMs_UsrFacingBBoxY"));
  v23 = v22;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("FLMs_UsrFacingBBoxW"));
  v25 = v24;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("FLMs_UsrFacingBBoxH"));
  v27 = v26;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FLMs_OReq"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v28)
  {
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("FLMs_Rev")) & 1) == 0)
    {
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 6, CFSTR("could not decode originating request"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v7);
      goto LABEL_8;
    }
    v36 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FLMs_Rev"));
    objc_msgSend((id)objc_opt_class(), "defaultOriginatingRequestClassNameForRequestRevision:", v36);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v38 = (void *)MEMORY[0x1E0CB3940];
      v39 = (objc_class *)objc_opt_class();
      NSStringFromClass(v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "stringWithFormat:", CFSTR("%@ does not provide a default originating request class"), v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v42);

      goto LABEL_9;
    }
    v45 = 0;
    +[VNRequestSpecifier specifierForRequestClassName:revision:error:](VNRequestSpecifier, "specifierForRequestClassName:revision:error:", v7, v36, &v45);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v45;
    v34 = v37;
    if (v28)
    {

      goto LABEL_5;
    }
    objc_msgSend(v4, "failWithError:", v37);
LABEL_7:

    goto LABEL_8;
  }
LABEL_5:
  *(float *)&v29 = v44;
  *(float *)&v30 = v15;
  *(float *)&v32 = v17;
  *(float *)&v31 = v19;
  LODWORD(v43) = v9;
  self = -[VNFaceLandmarks initWithOriginatingRequestSpecifier:pointsData:pointCount:userFacingBBox:alignedBBox:landmarkScore:](self, "initWithOriginatingRequestSpecifier:pointsData:pointCount:userFacingBBox:alignedBBox:landmarkScore:", v28, v6, v10, v21, v23, v25, v27, v29, v30, v31, v32, v43);

  v33 = self;
LABEL_10:

  return v33;
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", 0, CFSTR("VNFaceLandmarks"));
  *(float *)&v4 = self->_confidence;
  objc_msgSend(v5, "encodeFloat:forKey:", CFSTR("FLMs_Conf"), v4);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_pointCount, CFSTR("FLMs_PtsCnt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pointsData, CFSTR("FLMs_PtsData"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("FLMs_AlgnBBoxX"), self->_alignedBBox.origin.x);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("FLMs_AlgnBBoxY"), self->_alignedBBox.origin.y);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("FLMs_AlgnBBoxW"), self->_alignedBBox.size.width);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("FLMs_AlgnBBoxH"), self->_alignedBBox.size.height);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("FLMs_UsrFacingBBoxX"), self->_userFacingBBox.origin.x);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("FLMs_UsrFacingBBoxY"), self->_userFacingBBox.origin.y);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("FLMs_UsrFacingBBoxW"), self->_userFacingBBox.size.width);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("FLMs_UsrFacingBBoxH"), self->_userFacingBBox.size.height);
  objc_msgSend(v5, "encodeObject:forKey:", self->_originatingRequestSpecifier, CFSTR("FLMs_OReq"));

}

- (void)_createPointArray:(const int *)a3 count:(unint64_t)a4
{
  +[VNError VNAssertClass:needsToOverrideMethod:](VNError, "VNAssertClass:needsToOverrideMethod:", objc_opt_class(), a2);
  return 0;
}

- (BOOL)isUserFacingBBoxEquivalentToAlignedBBox
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  float v11;
  float v12;
  float v13;
  float v14;

  -[VNFaceLandmarks userFacingBBox](self, "userFacingBBox");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[VNFaceLandmarks alignedBBox](self, "alignedBBox");
  return vabdd_f64(v14, v4) < 0.0000999999975
      && vabdd_f64(v11, v6) < 0.0000999999975
      && vabdd_f64(v13, v8) < 0.0000999999975
      && vabdd_f64(v12, v10) < 0.0000999999975;
}

- (VNFaceLandmarks)initWithOriginatingRequestSpecifier:(id)a3 pointsData:(id)a4 pointCount:(unint64_t)a5 userFacingBBox:(CGRect)a6 alignedBBox:(_Geometry2D_rect2D_)a7 landmarkScore:(float)a8
{
  float width;
  float height;
  float y;
  float x;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  id v20;
  id v21;
  uint64_t v22;
  NSData *v23;
  NSData *pointsData;
  VNFaceLandmarks *v25;
  objc_super v27;

  width = a7.size.width;
  height = a7.size.height;
  y = a7.origin.y;
  x = a7.origin.x;
  v12 = a6.size.height;
  v13 = a6.size.width;
  v14 = a6.origin.y;
  v15 = a6.origin.x;
  v20 = a3;
  v21 = a4;
  if (v21
    && (v27.receiver = self,
        v27.super_class = (Class)VNFaceLandmarks,
        (self = -[VNFaceLandmarks init](&v27, sel_init)) != 0)
    && (v22 = objc_msgSend(v21, "length"), v22 == objc_msgSend((id)objc_opt_class(), "landmarkPointSizeInBytes") * a5))
  {
    self->_pointCount = a5;
    v23 = (NSData *)objc_msgSend(v21, "copy");
    pointsData = self->_pointsData;
    self->_pointsData = v23;

    self->_userFacingBBox.origin.x = v15;
    self->_userFacingBBox.origin.y = v14;
    self->_userFacingBBox.size.width = v13;
    self->_userFacingBBox.size.height = v12;
    self->_alignedBBox.origin.x = x;
    self->_alignedBBox.origin.y = y;
    self->_alignedBBox.size.height = height;
    self->_alignedBBox.size.width = width;
    self->_confidence = a8;
    objc_storeStrong((id *)&self->_originatingRequestSpecifier, a3);
    self = self;
    v25 = self;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (unint64_t)hash
{
  uint64_t v3;
  float confidence;
  uint64_t v5;
  uint64_t v6;
  double x;
  double y;
  uint64_t v9;
  double width;
  uint64_t v11;
  double height;
  uint64_t v13;
  float v14;
  float v15;
  float v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;

  v3 = -[NSData hash](self->_pointsData, "hash") ^ __ROR8__(self->_pointCount, 51);
  confidence = self->_confidence;
  v5 = LODWORD(confidence);
  if (confidence == 0.0)
    v5 = 0;
  v6 = v5 ^ __ROR8__(v3, 51);
  x = self->_userFacingBBox.origin.x;
  if (x == 0.0)
    x = 0.0;
  y = self->_userFacingBBox.origin.y;
  if (y == 0.0)
    y = 0.0;
  v9 = *(_QWORD *)&y ^ __ROR8__(*(_QWORD *)&x, 51);
  width = self->_userFacingBBox.size.width;
  if (width == 0.0)
    width = 0.0;
  v11 = *(_QWORD *)&width ^ __ROR8__(v9, 51);
  height = self->_userFacingBBox.size.height;
  if (height == 0.0)
    height = 0.0;
  v13 = *(_QWORD *)&height ^ __ROR8__(v11, 51) ^ __ROR8__(v6, 51);
  v14 = self->_alignedBBox.origin.y;
  v15 = self->_alignedBBox.size.height;
  v16 = self->_alignedBBox.size.width;
  v17 = (unint64_t)LODWORD(self->_alignedBBox.origin.x) << 13;
  if (self->_alignedBBox.origin.x == 0.0)
    v17 = 0;
  v18 = LODWORD(v14);
  if (v14 == 0.0)
    v18 = 0;
  v19 = v17 ^ v18;
  v20 = LODWORD(v16);
  if (v16 == 0.0)
    v20 = 0;
  v21 = v20 ^ (v19 << 13);
  v22 = LODWORD(v15);
  if (v15 == 0.0)
    v22 = 0;
  return -[VNRequestSpecifier hash](self->_originatingRequestSpecifier, "hash") ^ __ROR8__(v22 ^ __ROR8__(v21, 51) ^ __ROR8__(v13, 51), 51);
}

- (BOOL)isEqual:(id)a3
{
  VNFaceLandmarks *v4;
  VNFaceLandmarks *v5;
  float v6;
  float v7;
  float v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  char v33;
  unint64_t v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  CGRect v41;
  CGRect v42;

  v4 = (VNFaceLandmarks *)a3;
  if (self == v4)
  {
    v33 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VNFaceLandmarks confidence](self, "confidence");
      v7 = v6;
      -[VNFaceLandmarks confidence](v5, "confidence");
      if (v7 != v8)
        goto LABEL_16;
      -[VNFaceLandmarks userFacingBBox](self, "userFacingBBox");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;
      -[VNFaceLandmarks userFacingBBox](v5, "userFacingBBox");
      v42.origin.x = v17;
      v42.origin.y = v18;
      v42.size.width = v19;
      v42.size.height = v20;
      v41.origin.x = v10;
      v41.origin.y = v12;
      v41.size.width = v14;
      v41.size.height = v16;
      if (!CGRectEqualToRect(v41, v42))
        goto LABEL_16;
      -[VNFaceLandmarks alignedBBox](self, "alignedBBox");
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;
      -[VNFaceLandmarks alignedBBox](v5, "alignedBBox");
      v33 = 0;
      if (v22 != v29)
        goto LABEL_17;
      if (v24 != v30)
        goto LABEL_17;
      v33 = 0;
      if (v28 != v32 || v26 != v31)
        goto LABEL_17;
      v34 = -[VNFaceLandmarks pointCount](self, "pointCount");
      if (v34 != -[VNFaceLandmarks pointCount](v5, "pointCount"))
        goto LABEL_16;
      -[VNFaceLandmarks pointsData](self, "pointsData");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNFaceLandmarks pointsData](v5, "pointsData");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = VisionCoreEqualOrNilObjects();

      if ((v37 & 1) != 0)
      {
        -[VNFaceLandmarks originatingRequestSpecifier](self, "originatingRequestSpecifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[VNFaceLandmarks originatingRequestSpecifier](v5, "originatingRequestSpecifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v38, "isEqual:", v39);

      }
      else
      {
LABEL_16:
        v33 = 0;
      }
LABEL_17:

      goto LABEL_18;
    }
    v33 = 0;
  }
LABEL_18:

  return v33;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v7.receiver = self;
  v7.super_class = (Class)VNFaceLandmarks;
  -[VNFaceLandmarks description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ pointCount=%lu requestRevision=%lu"), v4, -[VNFaceLandmarks pointCount](self, "pointCount"), -[VNFaceLandmarks requestRevision](self, "requestRevision"));

  return v5;
}

- (VNConfidence)confidence
{
  return self->_confidence;
}

- (unint64_t)pointCount
{
  return self->_pointCount;
}

- (NSData)pointsData
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (_Geometry2D_rect2D_)alignedBBox
{
  float v2;
  float v3;
  float v4;
  float v5;
  _DWORD v6[4];
  _Geometry2D_rect2D_ result;

  objc_copyStruct(v6, &self->_alignedBBox, 16, 1, 0);
  v2 = *(float *)v6;
  v3 = *(float *)&v6[1];
  v4 = *(float *)&v6[2];
  v5 = *(float *)&v6[3];
  result.size.width = v5;
  result.size.height = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)userFacingBBox
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_userFacingBBox, 32, 1, 0);
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

- (VNRequestSpecifier)originatingRequestSpecifier
{
  return (VNRequestSpecifier *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingRequestSpecifier, 0);
  objc_storeStrong((id *)&self->_pointsData, 0);
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
