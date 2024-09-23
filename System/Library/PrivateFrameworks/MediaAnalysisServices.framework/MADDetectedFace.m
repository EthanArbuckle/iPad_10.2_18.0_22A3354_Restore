@implementation MADDetectedFace

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADDetectedFace)initWithFaceID:(int)a3 confidence:(double)a4 boundingBox:(CGRect)a5 videoEntries:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v14;
  MADDetectedFace *v15;
  MADDetectedFace *v16;
  objc_super v18;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MADDetectedFace;
  v15 = -[MADDetectedFace init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_faceID = a3;
    v15->_confidence = a4;
    v15->_boundingBox.origin.x = x;
    v15->_boundingBox.origin.y = y;
    v15->_boundingBox.size.width = width;
    v15->_boundingBox.size.height = height;
    objc_storeStrong((id *)&v15->_videoEntries, a6);
  }

  return v16;
}

+ (id)entryWithFaceID:(int)a3 confidence:(double)a4 boundingBox:(CGRect)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithFaceID:confidence:boundingBox:videoEntries:", *(_QWORD *)&a3, 0, a4, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

+ (id)entryWithFaceID:(int)a3 confidence:(double)a4 boundingBox:(CGRect)a5 videoEntries:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v11;
  id v13;
  void *v14;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = *(_QWORD *)&a3;
  v13 = a6;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFaceID:confidence:boundingBox:videoEntries:", v11, v13, a4, x, y, width, height);

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("Confidence"), self->_confidence);
  objc_msgSend(v4, "encodeRect:forKey:", CFSTR("BoundingBox"), self->_boundingBox.origin.x, self->_boundingBox.origin.y, self->_boundingBox.size.width, self->_boundingBox.size.height);
  objc_msgSend(v4, "encodeObject:forKey:", self->_videoEntries, CFSTR("VideoEntries"));

}

- (MADDetectedFace)initWithCoder:(id)a3
{
  id v4;
  MADDetectedFace *v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *videoEntries;
  objc_super v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MADDetectedFace;
  v5 = -[MADDetectedFace init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("Confidence"));
    v5->_confidence = v6;
    objc_msgSend(v4, "decodeRectForKey:", CFSTR("BoundingBox"));
    v5->_boundingBox.origin.x = v7;
    v5->_boundingBox.origin.y = v8;
    v5->_boundingBox.size.width = v9;
    v5->_boundingBox.size.height = v10;
    v11 = (void *)MEMORY[0x1E0C99E60];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("VideoEntries"));
    v14 = objc_claimAutoreleasedReturnValue();
    videoEntries = v5->_videoEntries;
    v5->_videoEntries = (NSArray *)v14;

  }
  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSRect v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  -[MADDetectedFace boundingBox](self, "boundingBox");
  NSStringFromRect(v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %@, "), CFSTR("BoundingBox"), v6);

  -[MADDetectedFace confidence](self, "confidence");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %.2f "), CFSTR("Confidence"), v7);
  -[MADDetectedFace videoEntries](self, "videoEntries");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %lu count>"), CFSTR("VideoEntries"), objc_msgSend(v8, "count"));

  return v3;
}

- (double)confidence
{
  return self->_confidence;
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

- (int)faceID
{
  return self->_faceID;
}

- (NSArray)videoEntries
{
  return self->_videoEntries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoEntries, 0);
}

@end
