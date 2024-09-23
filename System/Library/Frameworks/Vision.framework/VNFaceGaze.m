@implementation VNFaceGaze

- (VNFaceGaze)initWithFaceObservationUUID:(id)a3 direction:(int64_t)a4 location:(CGPoint)a5 bounds:(CGRect)a6 horizontalAngle:(float)a7 lookedAtFaceObservationUUID:(id)a8 gazeMask:(id)a9 originatingRequestSpecifier:(id)a10
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v18;
  CGFloat v19;
  id v23;
  id v24;
  id v25;
  id v26;
  VNFaceGaze *v27;
  VNFaceGaze *v28;
  uint64_t v29;
  VNPixelBufferObservation *gazeMask;
  objc_super v32;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v18 = a5.y;
  v19 = a5.x;
  v23 = a3;
  v24 = a8;
  v25 = a9;
  v26 = a10;
  v32.receiver = self;
  v32.super_class = (Class)VNFaceGaze;
  v27 = -[VNFaceGaze init](&v32, sel_init);
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_faceObservationUUID, a3);
    v28->_direction = a4;
    v28->_location.x = v19;
    v28->_location.y = v18;
    v28->_locationBounds.origin.x = x;
    v28->_locationBounds.origin.y = y;
    v28->_locationBounds.size.width = width;
    v28->_locationBounds.size.height = height;
    v28->_horizontalAngle = a7;
    objc_storeStrong((id *)&v28->_lookedAtFaceObservationUUID, a8);
    v29 = objc_msgSend(v25, "copy");
    gazeMask = v28->_gazeMask;
    v28->_gazeMask = (VNPixelBufferObservation *)v29;

    objc_storeStrong((id *)&v28->_originatingRequestSpecifier, a10);
  }

  return v28;
}

- (BOOL)hasLocation
{
  CGRect v3;

  v3.origin.x = 0.0;
  v3.origin.y = 0.0;
  v3.size.width = 1.0;
  v3.size.height = 1.0;
  return CGRectContainsPoint(v3, self->_location);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v17.receiver = self;
  v17.super_class = (Class)VNFaceGaze;
  -[VNFaceGaze description](&v17, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNFaceGaze originatingRequestSpecifier](self, "originatingRequestSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNFaceGaze faceObservationUUID](self, "faceObservationUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[VNFaceGaze direction](self, "direction");
  v9 = v8;
  if (v8 >= 6)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (__CFString *)objc_msgSend(v11, "initWithFormat:", CFSTR("VNFaceGazeDirection%@"), v12);

  }
  else
  {
    v10 = off_1E4547E28[v8];
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ %@ face %@ %@"), v4, v5, v7, v10);

  -[VNFaceGaze lookedAtFaceObservationUUID](self, "lookedAtFaceObservationUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", looking at %@"), v15);

  }
  return v3;
}

- (unint64_t)hash
{
  return -[VNPixelBufferObservation hash](self->_gazeMask, "hash") ^ __ROR8__(-[NSUUID hash](self->_lookedAtFaceObservationUUID, "hash") ^ __ROR8__(-[VNRequestSpecifier hash](self->_originatingRequestSpecifier, "hash") ^ __ROR8__(-[NSUUID hash](self->_faceObservationUUID, "hash") ^ __ROR8__(self->_direction, 51), 51), 51), 51);
}

- (BOOL)isEqual:(id)a3
{
  VNFaceGaze *v4;
  VNFaceGaze *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  int64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  _BOOL4 v19;
  BOOL v20;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  float v40;
  float v41;
  float v42;
  objc_super v43;
  CGRect v44;
  CGRect v45;

  v4 = (VNFaceGaze *)a3;
  if (self == v4)
  {
    v20 = 1;
    goto LABEL_14;
  }
  v43.receiver = self;
  v43.super_class = (Class)VNFaceGaze;
  if (!-[VNFaceGaze isEqual:](&v43, sel_isEqual_, v4) || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v20 = 0;
    goto LABEL_14;
  }
  v5 = v4;
  -[VNFaceGaze faceObservationUUID](self, "faceObservationUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNFaceGaze faceObservationUUID](v5, "faceObservationUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (!v8)
    goto LABEL_10;
  -[VNFaceGaze originatingRequestSpecifier](self, "originatingRequestSpecifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNFaceGaze originatingRequestSpecifier](v5, "originatingRequestSpecifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (!v11)
    goto LABEL_10;
  v12 = -[VNFaceGaze direction](self, "direction");
  if (v12 != -[VNFaceGaze direction](v5, "direction"))
    goto LABEL_10;
  -[VNFaceGaze lookedAtFaceObservationUUID](self, "lookedAtFaceObservationUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNFaceGaze lookedAtFaceObservationUUID](v5, "lookedAtFaceObservationUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = VisionCoreEqualOrNilObjects();

  if (!v15)
    goto LABEL_10;
  -[VNFaceGaze gazeMask](self, "gazeMask");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNFaceGaze gazeMask](v5, "gazeMask");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = VisionCoreEqualOrNilObjects();

  if (!v18)
    goto LABEL_10;
  v19 = -[VNFaceGaze hasLocation](self, "hasLocation");
  if (v19 != -[VNFaceGaze hasLocation](v5, "hasLocation"))
    goto LABEL_10;
  if (!v19)
    goto LABEL_20;
  -[VNFaceGaze location](self, "location");
  v23 = v22;
  v25 = v24;
  -[VNFaceGaze location](v5, "location");
  v20 = 0;
  if (v23 != v27 || v25 != v26)
    goto LABEL_11;
  -[VNFaceGaze locationBounds](self, "locationBounds");
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  -[VNFaceGaze locationBounds](v5, "locationBounds");
  v45.origin.x = v36;
  v45.origin.y = v37;
  v45.size.width = v38;
  v45.size.height = v39;
  v44.origin.x = v29;
  v44.origin.y = v31;
  v44.size.width = v33;
  v44.size.height = v35;
  if (!CGRectEqualToRect(v44, v45))
    goto LABEL_10;
  -[VNFaceGaze horizontalAngle](self, "horizontalAngle");
  v41 = v40;
  -[VNFaceGaze horizontalAngle](v5, "horizontalAngle");
  if (v41 == v42)
LABEL_20:
    v20 = 1;
  else
LABEL_10:
    v20 = 0;
LABEL_11:

LABEL_14:
  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *faceObservationUUID;
  double v5;
  id v6;

  faceObservationUUID = self->_faceObservationUUID;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", faceObservationUUID, CFSTR("face"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_direction, CFSTR("direction"));
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("locX"), self->_location.x);
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("locY"), self->_location.y);
  objc_msgSend(v6, "encodeObject:forKey:", self->_lookedAtFaceObservationUUID, CFSTR("lookFace"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_gazeMask, CFSTR("gazeMask"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_originatingRequestSpecifier, CFSTR("oreq"));
  objc_msgSend(v6, "vn_encodeRect:forKey:", CFSTR("locBounds"), self->_locationBounds.origin.x, self->_locationBounds.origin.y, self->_locationBounds.size.width, self->_locationBounds.size.height);
  *(float *)&v5 = self->_horizontalAngle;
  objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("horizAngle"), v5);

}

- (VNFaceGaze)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  VNFaceGaze *v22;
  double v23;
  int v24;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("face"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("direction"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("locX"));
  v8 = v7;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("locY"));
  v10 = v9;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lookFace"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gazeMask"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("oreq"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("locBounds")))
    {
      objc_msgSend(v4, "vn_decodeRectForKey:", CFSTR("locBounds"));
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
    }
    else
    {
      v15 = *MEMORY[0x1E0C9D628];
      v17 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v19 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v21 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("horizAngle")))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("horizAngle"));
      LODWORD(v23) = v24;
    }
    else
    {
      LODWORD(v23) = 2143289344;
    }
    self = -[VNFaceGaze initWithFaceObservationUUID:direction:location:bounds:horizontalAngle:lookedAtFaceObservationUUID:gazeMask:originatingRequestSpecifier:](self, "initWithFaceObservationUUID:direction:location:bounds:horizontalAngle:lookedAtFaceObservationUUID:gazeMask:originatingRequestSpecifier:", v5, v6, v11, v12, v13, v8, v10, v15, v17, v19, v21, v23);
    v22 = self;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (VNRequestSpecifier)originatingRequestSpecifier
{
  return self->_originatingRequestSpecifier;
}

- (NSUUID)faceObservationUUID
{
  return self->_faceObservationUUID;
}

- (int64_t)direction
{
  return self->_direction;
}

- (CGPoint)location
{
  double x;
  double y;
  CGPoint result;

  x = self->_location.x;
  y = self->_location.y;
  result.y = y;
  result.x = x;
  return result;
}

- (float)horizontalAngle
{
  return self->_horizontalAngle;
}

- (NSUUID)lookedAtFaceObservationUUID
{
  return self->_lookedAtFaceObservationUUID;
}

- (VNPixelBufferObservation)gazeMask
{
  return self->_gazeMask;
}

- (CGRect)locationBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_locationBounds.origin.x;
  y = self->_locationBounds.origin.y;
  width = self->_locationBounds.size.width;
  height = self->_locationBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingRequestSpecifier, 0);
  objc_storeStrong((id *)&self->_gazeMask, 0);
  objc_storeStrong((id *)&self->_lookedAtFaceObservationUUID, 0);
  objc_storeStrong((id *)&self->_faceObservationUUID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CGPoint)locationInTopLeftOrigin:(BOOL)a3 orientation:(unsigned int)a4
{
  double v4;
  double v5;
  float64x2_t v6;
  double v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  CGPoint result;

  v9 = 0u;
  v10 = 0u;
  v8 = 0u;
  -[VNFaceGaze location](self, "location", VNAffineTransformForVisionToTopLeftOriginOrientation(a3, a4, (uint64_t)&v8));
  v6 = vaddq_f64(v10, vmlaq_n_f64(vmulq_n_f64(v9, v4), v8, v5));
  v7 = v6.f64[1];
  result.x = v6.f64[0];
  result.y = v7;
  return result;
}

@end
