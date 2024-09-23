@implementation MADSceneClassification

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADSceneClassification)initWithLabel:(id)a3 confidence:(double)a4 boundingBox:(CGRect)a5 videoEntries:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v14;
  id v15;
  MADSceneClassification *v16;
  MADSceneClassification *v17;
  objc_super v19;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v14 = a3;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MADSceneClassification;
  v16 = -[MADSceneClassification init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_label, a3);
    v17->_confidence = a4;
    v17->_boundingBox.origin.x = x;
    v17->_boundingBox.origin.y = y;
    v17->_boundingBox.size.width = width;
    v17->_boundingBox.size.height = height;
    objc_storeStrong((id *)&v17->_videoEntries, a6);
  }

  return v17;
}

+ (id)entryWithLabel:(id)a3 confidence:(double)a4 boundingBox:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a3;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLabel:confidence:boundingBox:videoEntries:", v11, 0, a4, x, y, width, height);

  return v12;
}

+ (id)entryWithLabel:(id)a3 confidence:(double)a4 boundingBox:(CGRect)a5 videoEntries:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  void *v15;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a3;
  v14 = a6;
  v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLabel:confidence:boundingBox:videoEntries:", v13, v14, a4, x, y, width, height);

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_label, CFSTR("Label"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("Confidence"), self->_confidence);
  objc_msgSend(v4, "encodeRect:forKey:", CFSTR("BoundingBox"), self->_boundingBox.origin.x, self->_boundingBox.origin.y, self->_boundingBox.size.width, self->_boundingBox.size.height);
  objc_msgSend(v4, "encodeObject:forKey:", self->_videoEntries, CFSTR("VideoEntries"));

}

- (MADSceneClassification)initWithCoder:(id)a3
{
  id v4;
  MADSceneClassification *v5;
  uint64_t v6;
  NSString *label;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSArray *videoEntries;
  objc_super v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MADSceneClassification;
  v5 = -[MADSceneClassification init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Label"));
    v6 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("Confidence"));
    v5->_confidence = v8;
    objc_msgSend(v4, "decodeRectForKey:", CFSTR("BoundingBox"));
    v5->_boundingBox.origin.x = v9;
    v5->_boundingBox.origin.y = v10;
    v5->_boundingBox.size.width = v11;
    v5->_boundingBox.size.height = v12;
    v13 = (void *)MEMORY[0x1E0C99E60];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("VideoEntries"));
    v16 = objc_claimAutoreleasedReturnValue();
    videoEntries = v5->_videoEntries;
    v5->_videoEntries = (NSArray *)v16;

  }
  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSRect v12;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  -[MADSceneClassification label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %@, "), CFSTR("Label"), v6);

  -[MADSceneClassification boundingBox](self, "boundingBox");
  if (v7 != 0.0)
  {
    -[MADSceneClassification boundingBox](self, "boundingBox");
    NSStringFromRect(v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("%@: %@, "), CFSTR("BoundingBox"), v8);

  }
  -[MADSceneClassification confidence](self, "confidence");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %.2f "), CFSTR("Confidence"), v9);
  -[MADSceneClassification videoEntries](self, "videoEntries");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %lu count>"), CFSTR("VideoEntries"), objc_msgSend(v10, "count"));

  return v3;
}

- (NSString)label
{
  return self->_label;
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

- (NSArray)videoEntries
{
  return self->_videoEntries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoEntries, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
