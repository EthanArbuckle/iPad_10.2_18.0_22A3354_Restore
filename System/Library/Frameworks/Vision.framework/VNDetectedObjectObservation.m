@implementation VNDetectedObjectObservation

- (id)vn_cloneObject
{
  uint64_t v3;
  _QWORD *v4;
  CGSize size;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VNDetectedObjectObservation;
  -[VNObservation vn_cloneObject](&v9, sel_vn_cloneObject);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (_QWORD *)v3;
  if (v3)
  {
    size = self->_boundingBox.size;
    *(CGPoint *)(v3 + 96) = self->_boundingBox.origin;
    *(CGSize *)(v3 + 112) = size;
    v6 = -[NSUUID copy](self->_groupId, "copy");
    v7 = (void *)v4[16];
    v4[16] = v6;

  }
  return v4;
}

- (VNDetectedObjectObservation)initWithRequestRevision:(unint64_t)a3 boundingBox:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  VNDetectedObjectObservation *v8;
  VNDetectedObjectObservation *v9;
  NSUUID *groupId;
  VNDetectedObjectObservation *v11;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = -[VNObservation initWithRequestRevision:](self, "initWithRequestRevision:", a3);
  v9 = v8;
  if (v8)
  {
    v8->_boundingBox.origin.x = x;
    v8->_boundingBox.origin.y = y;
    v8->_boundingBox.size.width = width;
    v8->_boundingBox.size.height = height;
    groupId = v8->_groupId;
    v8->_groupId = 0;

    v11 = v9;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceSegmentationMask, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_globalSegmentationMask, 0);
  objc_storeStrong((id *)&self->_groupId, 0);
}

- (VNDetectedObjectObservation)initWithOriginatingRequestSpecifier:(id)a3 boundingBox:(CGRect)a4
{
  return -[VNDetectedObjectObservation initWithOriginatingRequestSpecifier:boundingBox:groupId:](self, "initWithOriginatingRequestSpecifier:boundingBox:groupId:", a3, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (VNDetectedObjectObservation)initWithOriginatingRequestSpecifier:(id)a3 boundingBox:(CGRect)a4 groupId:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  VNDetectedObjectObservation *v13;
  VNDetectedObjectObservation *v14;
  VNDetectedObjectObservation *v15;
  objc_super v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VNDetectedObjectObservation;
  v13 = -[VNObservation initWithOriginatingRequestSpecifier:](&v17, sel_initWithOriginatingRequestSpecifier_, a3);
  v14 = v13;
  if (v13)
  {
    v13->_boundingBox.origin.x = x;
    v13->_boundingBox.origin.y = y;
    v13->_boundingBox.size.width = width;
    v13->_boundingBox.size.height = height;
    objc_storeStrong((id *)&v13->_groupId, a5);
    v15 = v14;
  }

  return v14;
}

- (VNDetectedObjectObservation)initWithCoder:(id)a3
{
  id v4;
  VNDetectedObjectObservation *v5;
  VNDetectedObjectObservation *v6;
  CGSize v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  uint64_t v12;
  NSUUID *groupId;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VNDetectedObjectObservation;
  v5 = -[VNObservation initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5 && !objc_msgSend(v4, "vn_decodeCodingVersionForKey:", CFSTR("VNDetectedObjectObservation")))
  {
    if (objc_msgSend((id)objc_opt_class(), "boundingBoxIsCalculatedProperty"))
    {
      v7 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
      v5->_boundingBox.origin = (CGPoint)*MEMORY[0x1E0C9D628];
      v5->_boundingBox.size = v7;
    }
    else
    {
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("BBX"));
      v5->_boundingBox.origin.x = v8;
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("BBY"));
      v5->_boundingBox.origin.y = v9;
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("BBW"));
      v5->_boundingBox.size.width = v10;
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("BBH"));
      v5->_boundingBox.size.height = v11;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupId"));
    v12 = objc_claimAutoreleasedReturnValue();
    groupId = v5->_groupId;
    v5->_groupId = (NSUUID *)v12;

    v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNDetectedObjectObservation;
  -[VNObservation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "vn_encodeCodingVersion:forKey:", 0, CFSTR("VNDetectedObjectObservation"));
  if ((objc_msgSend((id)objc_opt_class(), "boundingBoxIsCalculatedProperty") & 1) == 0)
  {
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("BBX"), self->_boundingBox.origin.x);
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("BBY"), self->_boundingBox.origin.y);
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("BBW"), self->_boundingBox.size.width);
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("BBH"), self->_boundingBox.size.height);
  }
  objc_msgSend(v4, "encodeObject:forKey:", self->_groupId, CFSTR("groupId"));

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
  v12.super_class = (Class)VNDetectedObjectObservation;
  -[VNObservation description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNDetectedObjectObservation boundingBox](self, "boundingBox");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%g, %g, %g, %g]"), v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ boundingBox=%@"), v4, v9);

  return v10;
}

- (unint64_t)hash
{
  id v3;
  double y;
  double x;
  double height;
  double width;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  double v15;
  unint64_t v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)VNDetectedObjectObservation;
  v3 = -[VNObservation hash](&v18, sel_hash);
  x = self->_boundingBox.origin.x;
  y = self->_boundingBox.origin.y;
  width = self->_boundingBox.size.width;
  height = self->_boundingBox.size.height;
  -[VNDetectedObjectObservation groupId](self, "groupId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  v10 = x;
  if (x == 0.0)
    v10 = 0.0;
  v11 = y;
  if (y == 0.0)
    v11 = 0.0;
  v12 = *(_QWORD *)&v11 ^ __ROR8__(*(_QWORD *)&v10, 51);
  v13 = width;
  if (width == 0.0)
    v13 = 0.0;
  v14 = *(_QWORD *)&v13 ^ __ROR8__(v12, 51);
  v15 = height;
  if (height == 0.0)
    v15 = 0.0;
  v16 = v9 ^ __ROR8__(*(_QWORD *)&v15 ^ __ROR8__(v14, 51) ^ __ROR8__(v3, 51), 51);

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  VNDetectedObjectObservation *v4;
  CGRect *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v10;

  v4 = (VNDetectedObjectObservation *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VNDetectedObjectObservation;
    if (-[VNObservation isEqual:](&v10, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      if ((objc_msgSend((id)objc_opt_class(), "boundingBoxIsCalculatedProperty") & 1) != 0
        || CGRectEqualToRect(self->_boundingBox, v5[3]))
      {
        -[VNDetectedObjectObservation groupId](self, "groupId");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[CGRect groupId](v5, "groupId");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = VisionCoreEqualOrNilObjects();

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)debugQuickLookObject
{
  CGPathRef v3;
  const CGPath *v4;
  void *v5;
  CGColor *v6;
  void *v8;
  objc_super v9;
  _OWORD v10[2];
  uint64_t v11;
  CGRect v12;

  v11 = *MEMORY[0x1E0C80C00];
  -[VNDetectedObjectObservation boundingBox](self, "boundingBox");
  v3 = CGPathCreateWithRect(v12, MEMORY[0x1E0C9BAA8]);
  if (!v3)
    return 0;
  v4 = v3;
  v9.receiver = self;
  v9.super_class = (Class)VNDetectedObjectObservation;
  -[VNObservation debugQuickLookObject](&v9, sel_debugQuickLookObject);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v10[0] = xmmword_1A15FAF80;
    v10[1] = unk_1A15FAF90;
    v6 = (CGColor *)VNDebugColorFromValues((const CGFloat *)v10);
    VNDebugImageRenderNormalizedCGPathOnImage((uint64_t)v4, v5, v6);
  }
  else
  {
    VNDebugPathFromNormalizedCGPath((uint64_t)v4, 512.0, 512.0);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  CGPathRelease(v4);
  return v8;
}

- (BOOL)providesBoundsNormalizedToROI
{
  void *v2;
  char v3;

  -[VNObservation originatingRequestSpecifier](self, "originatingRequestSpecifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "observationProvidesBoundsNormalizedToROI");

  return v3;
}

- (CGRect)boundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundingBox.origin.x;
  y = self->_boundingBox.origin.y;
  width = self->_boundingBox.size.width;
  height = self->_boundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSUUID)groupId
{
  return self->_groupId;
}

- (VNPixelBufferObservation)globalSegmentationMask
{
  return self->_globalSegmentationMask;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 144, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (VNPixelBufferObservation)instanceSegmentationMask
{
  return self->_instanceSegmentationMask;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return CFSTR("VNDetectRectanglesRequest");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)boundingBoxIsCalculatedProperty
{
  return 0;
}

+ (VNDetectedObjectObservation)observationWithBoundingBox:(CGRect)boundingBox
{
  return (VNDetectedObjectObservation *)objc_msgSend(a1, "observationWithRequestRevision:boundingBox:", 0, boundingBox.origin.x, boundingBox.origin.y, boundingBox.size.width, boundingBox.size.height);
}

+ (VNDetectedObjectObservation)observationWithRequestRevision:(NSUInteger)requestRevision boundingBox:(CGRect)boundingBox
{
  return (VNDetectedObjectObservation *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithRequestRevision:boundingBox:", requestRevision, boundingBox.origin.x, boundingBox.origin.y, boundingBox.size.width, boundingBox.size.height);
}

- (void)setInstanceSegmentationMask:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
    objc_storeStrong((id *)(a1 + 152), a2);

}

- (void)setGroupId:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
    objc_storeStrong((id *)(a1 + 128), a2);

}

- (CGRect)boundingBoxInTopLeftOrigin:(BOOL)a3 orientation:(unsigned int)a4
{
  _BOOL4 v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGRect v16;

  v5 = a3;
  -[VNDetectedObjectObservation boundingBox](self, "boundingBox");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  memset(&v15, 0, sizeof(v15));
  VNAffineTransformForVisionToTopLeftOriginOrientation(v5, a4, (uint64_t)&v15);
  v14 = v15;
  v16.origin.x = v7;
  v16.origin.y = v9;
  v16.size.width = v11;
  v16.size.height = v13;
  return CGRectApplyAffineTransform(v16, &v14);
}

@end
