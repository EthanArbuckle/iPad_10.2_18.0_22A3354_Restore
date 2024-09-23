@implementation ARImageAnchor

- (ARImageAnchor)initWithReferenceImage:(double)a3 transform:(double)a4 detectionOnly:(double)a5 tracked:(uint64_t)a6
{
  id v13;
  void *v14;
  ARImageAnchor *v15;
  objc_super v21;

  v13 = a7;
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = a1;
  v21.super_class = (Class)ARImageAnchor;
  v15 = -[ARAnchor initWithIdentifier:transform:](&v21, sel_initWithIdentifier_transform_, v14, a2, a3, a4, a5);

  if (v15)
  {
    -[ARImageAnchor setIsTracked:](v15, "setIsTracked:", a9);
    objc_storeStrong((id *)&v15->_referenceImage, a7);
    v15->_detectionOnly = a8;
  }

  return v15;
}

- (id)name
{
  void *v2;
  void *v3;

  -[ARImageAnchor referenceImage](self, "referenceImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __n128 v10;
  __n128 v11;
  __n128 v12;
  __n128 v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  const __CFString *v18;
  uint64_t v19;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ARAnchor identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" identifier=\"%@\"), v7);

  -[ARImageAnchor name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ARImageAnchor name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" name=\"%@\"), v9);

  }
  -[ARAnchor transform](self, "transform");
  ARMatrix4x4Description(0, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" transform=%@"), v14);

  -[ARImageAnchor referenceImage](self, "referenceImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "description");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" referenceImage=%@"), v16);

  v17 = -[ARImageAnchor isTracked](self, "isTracked");
  v18 = CFSTR("NO");
  if (v17)
    v18 = CFSTR("YES");
  objc_msgSend(v6, "appendFormat:", CFSTR(" tracked=%@"), v18);
  -[ARImageAnchor estimatedScaleFactor](self, "estimatedScaleFactor");
  objc_msgSend(v6, "appendFormat:", CFSTR(" estimatedScale=%f"), v19);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return (NSString *)v6;
}

- (id)copyWithTrackedState:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)-[ARImageAnchor copy](self, "copy");
  v5 = v4;
  if (v4 && objc_msgSend(v4, "isTracked") != v3)
    objc_msgSend(v5, "setIsTracked:", v3);
  return v5;
}

- (ARImageAnchor)initWithAnchor:(id)a3
{
  id v4;
  ARImageAnchor *v5;
  uint64_t v6;
  ARReferenceImage *referenceImage;
  double v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ARImageAnchor;
  v5 = -[ARAnchor initWithAnchor:](&v10, sel_initWithAnchor_, v4);
  if (v5)
  {
    objc_msgSend(v4, "referenceImage");
    v6 = objc_claimAutoreleasedReturnValue();
    referenceImage = v5->_referenceImage;
    v5->_referenceImage = (ARReferenceImage *)v6;

    v5->_detectionOnly = objc_msgSend(v4, "isDetectionOnly");
    v5->_isTracked = objc_msgSend(v4, "isTracked");
    objc_msgSend(v4, "estimatedScaleFactor");
    v5->_estimatedScaleFactor = v8;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ARImageAnchor;
  v4 = a3;
  -[ARAnchor encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[ARImageAnchor referenceImage](self, "referenceImage", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("referenceImage"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_referenceImageUUID, CFSTR("referenceImageUUID"));
  objc_msgSend(v4, "encodeBool:forKey:", -[ARImageAnchor isDetectionOnly](self, "isDetectionOnly"), CFSTR("detectionOnly"));
  objc_msgSend(v4, "encodeBool:forKey:", -[ARImageAnchor isTracked](self, "isTracked"), CFSTR("tracked"));
  -[ARImageAnchor estimatedScaleFactor](self, "estimatedScaleFactor");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("estimatedScaleFactor"));

}

- (ARImageAnchor)initWithCoder:(id)a3
{
  id v4;
  ARImageAnchor *v5;
  uint64_t v6;
  ARReferenceImage *referenceImage;
  uint64_t v8;
  NSUUID *referenceImageUUID;
  double v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ARImageAnchor;
  v5 = -[ARAnchor initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referenceImage"));
    v6 = objc_claimAutoreleasedReturnValue();
    referenceImage = v5->_referenceImage;
    v5->_referenceImage = (ARReferenceImage *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referenceImageUUID"));
    v8 = objc_claimAutoreleasedReturnValue();
    referenceImageUUID = v5->_referenceImageUUID;
    v5->_referenceImageUUID = (NSUUID *)v8;

    v5->_detectionOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("detectionOnly"));
    v5->_isTracked = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("tracked"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("estimatedScaleFactor"));
    v5->_estimatedScaleFactor = v10;
  }

  return v5;
}

- (void)setEstimatedScaleFactor:(double)a3
{
  self->_estimatedScaleFactor = a3;
}

- (ARReferenceImage)referenceImage
{
  return self->_referenceImage;
}

- (CGFloat)estimatedScaleFactor
{
  return self->_estimatedScaleFactor;
}

- (BOOL)isDetectionOnly
{
  return self->_detectionOnly;
}

- (void)setDetectionOnly:(BOOL)a3
{
  self->_detectionOnly = a3;
}

- (BOOL)isTracked
{
  return self->_isTracked;
}

- (void)setIsTracked:(BOOL)a3
{
  self->_isTracked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceImage, 0);
  objc_storeStrong((id *)&self->_referenceImageUUID, 0);
}

@end
