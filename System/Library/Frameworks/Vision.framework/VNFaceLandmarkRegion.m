@implementation VNFaceLandmarkRegion

- (unint64_t)requestRevision
{
  void *v2;
  unint64_t v3;

  -[VNFaceLandmarkRegion originatingRequestSpecifier](self, "originatingRequestSpecifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "requestRevision");

  return v3;
}

- (VNFaceLandmarkRegion)initWithOriginatingRequestSpecifier:(id)a3 faceBoundingBox:(CGRect)a4 pointCount:(unint64_t)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  VNFaceLandmarkRegion *v13;
  VNFaceLandmarkRegion *v14;
  VNFaceLandmarkRegion *v15;
  objc_super v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VNFaceLandmarkRegion;
  v13 = -[VNFaceLandmarkRegion init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_faceBoundingBox.origin.x = x;
    v13->_faceBoundingBox.origin.y = y;
    v13->_faceBoundingBox.size.width = width;
    v13->_faceBoundingBox.size.height = height;
    v13->_pointCount = a5;
    objc_storeStrong((id *)&v13->_originatingRequestSpecifier, a3);
    v15 = v14;
  }

  return v14;
}

- (VNFaceLandmarkRegion)initWithCoder:(id)a3
{
  id v4;
  VNFaceLandmarkRegion *v5;
  uint64_t v6;
  void *v7;
  id v8;
  VNFaceLandmarkRegion *v9;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  uint64_t v15;
  VNRequestSpecifier *originatingRequestSpecifier;
  uint64_t v17;
  uint64_t v18;
  VNRequestSpecifier *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)VNFaceLandmarkRegion;
  v5 = -[VNFaceLandmarkRegion init](&v26, sel_init);
  if (!v5)
    goto LABEL_6;
  v6 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("VNFaceLandmarkRegion"));
  if (!(_DWORD)v6)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("FLMReg_BBX"));
    v5->_faceBoundingBox.origin.x = v11;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("FLMReg_BBY"));
    v5->_faceBoundingBox.origin.y = v12;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("FLMReg_BBW"));
    v5->_faceBoundingBox.size.width = v13;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("FLMReg_BBH"));
    v5->_faceBoundingBox.size.height = v14;
    v5->_pointCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FLMReg_PtCnt"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FLMReg_OReq"));
    v15 = objc_claimAutoreleasedReturnValue();
    originatingRequestSpecifier = v5->_originatingRequestSpecifier;
    v5->_originatingRequestSpecifier = (VNRequestSpecifier *)v15;

    if (!v5->_originatingRequestSpecifier)
    {
      if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("FLMReg_Rev")) & 1) == 0)
      {
        +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 6, CFSTR("could not decode originating request"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "failWithError:", v7);
        goto LABEL_5;
      }
      v17 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FLMReg_Rev"));
      objc_msgSend((id)objc_opt_class(), "defaultOriginatingRequestClassNameForRequestRevision:", v17);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        v20 = (void *)MEMORY[0x1E0CB3940];
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", CFSTR("%@ does not provide a default originating request class"), v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "failWithError:", v24);

        goto LABEL_6;
      }
      v25 = 0;
      +[VNRequestSpecifier specifierForRequestClassName:revision:error:](VNRequestSpecifier, "specifierForRequestClassName:revision:error:", v7, v17, &v25);
      v18 = objc_claimAutoreleasedReturnValue();
      v8 = v25;
      v19 = v5->_originatingRequestSpecifier;
      v5->_originatingRequestSpecifier = (VNRequestSpecifier *)v18;

      if (!v5->_originatingRequestSpecifier)
      {
        objc_msgSend(v4, "failWithError:", v8);
        goto LABEL_4;
      }

    }
    v9 = v5;
    goto LABEL_7;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to unarchive VNFaceLandmarkRegion object due to coding version mismatch: Currently supported: %u; encoded: %u"),
                 0,
                 v6);
  +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failWithError:", v8);
LABEL_4:

LABEL_5:
LABEL_6:
  v9 = 0;
LABEL_7:

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", 0, CFSTR("VNFaceLandmarkRegion"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("FLMReg_BBX"), self->_faceBoundingBox.origin.x);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("FLMReg_BBY"), self->_faceBoundingBox.origin.y);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("FLMReg_BBW"), self->_faceBoundingBox.size.width);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("FLMReg_BBH"), self->_faceBoundingBox.size.height);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_pointCount, CFSTR("FLMReg_PtCnt"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_originatingRequestSpecifier, CFSTR("FLMReg_OReq"));

}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v12.receiver = self;
  v12.super_class = (Class)VNFaceLandmarkRegion;
  -[VNFaceLandmarkRegion description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNFaceLandmarkRegion faceBoundingBox](self, "faceBoundingBox");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%g, %g, %g, %g]"), v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ faceBoundingBox=%@ pointCount=%lu requestRevision=%lu"), v4, v9, -[VNFaceLandmarkRegion pointCount](self, "pointCount"), -[VNFaceLandmarkRegion requestRevision](self, "requestRevision"));

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  double x;
  double y;
  uint64_t v6;
  double width;
  uint64_t v8;
  double height;
  uint64_t v10;

  v3 = -[VNFaceLandmarkRegion pointCount](self, "pointCount");
  x = self->_faceBoundingBox.origin.x;
  if (x == 0.0)
    x = 0.0;
  y = self->_faceBoundingBox.origin.y;
  if (y == 0.0)
    y = 0.0;
  v6 = *(_QWORD *)&y ^ __ROR8__(*(_QWORD *)&x, 51);
  width = self->_faceBoundingBox.size.width;
  if (width == 0.0)
    width = 0.0;
  v8 = *(_QWORD *)&width ^ __ROR8__(v6, 51);
  height = self->_faceBoundingBox.size.height;
  if (height == 0.0)
    height = 0.0;
  v10 = *(_QWORD *)&height ^ __ROR8__(v8, 51) ^ __ROR8__(v3, 51);
  return -[VNRequestSpecifier hash](self->_originatingRequestSpecifier, "hash") ^ __ROR8__(self->_pointCount ^ __ROR8__(v10, 51), 51);
}

- (BOOL)isEqual:(id)a3
{
  VNFaceLandmarkRegion *v4;
  VNFaceLandmarkRegion *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  NSUInteger v18;
  void *v19;
  void *v20;
  char v21;
  CGRect v23;
  CGRect v24;

  v4 = (VNFaceLandmarkRegion *)a3;
  if (self == v4)
  {
    v21 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VNFaceLandmarkRegion faceBoundingBox](self, "faceBoundingBox");
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;
      -[VNFaceLandmarkRegion faceBoundingBox](v5, "faceBoundingBox");
      v24.origin.x = v14;
      v24.origin.y = v15;
      v24.size.width = v16;
      v24.size.height = v17;
      v23.origin.x = v7;
      v23.origin.y = v9;
      v23.size.width = v11;
      v23.size.height = v13;
      if (CGRectEqualToRect(v23, v24)
        && (v18 = -[VNFaceLandmarkRegion pointCount](self, "pointCount"),
            v18 == -[VNFaceLandmarkRegion pointCount](v5, "pointCount")))
      {
        -[VNFaceLandmarkRegion originatingRequestSpecifier](self, "originatingRequestSpecifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[VNFaceLandmarkRegion originatingRequestSpecifier](v5, "originatingRequestSpecifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "isEqual:", v20);

      }
      else
      {
        v21 = 0;
      }

    }
    else
    {
      v21 = 0;
    }
  }

  return v21;
}

- (CGRect)faceBoundingBox
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_faceBoundingBox, 32, 1, 0);
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

- (NSUInteger)pointCount
{
  return self->_pointCount;
}

- (VNRequestSpecifier)originatingRequestSpecifier
{
  return (VNRequestSpecifier *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingRequestSpecifier, 0);
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
