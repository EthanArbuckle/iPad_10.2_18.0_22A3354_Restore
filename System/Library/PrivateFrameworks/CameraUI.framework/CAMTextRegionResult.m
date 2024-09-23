@implementation CAMTextRegionResult

- (CAMTextRegionResult)initWithTextRegionObject:(id)a3
{
  id v5;
  CAMTextRegionResult *v6;
  CAMTextRegionResult *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  float v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *uniqueIdentifier;
  CAMTextRegionResult *v17;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CAMTextRegionResult;
  v6 = -[CAMTextRegionResult init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__metadataTextRegionObject, a3);
    objc_msgSend(v5, "angularOffsetBounds");
    v7->_bounds.origin.x = v8;
    v7->_bounds.origin.y = v9;
    v7->_bounds.size.width = v10;
    v7->_bounds.size.height = v11;
    objc_msgSend(v5, "angularOffset");
    v7->_baselineAngle = v12 * 3.14159265 / 180.0;
    v13 = (void *)MEMORY[0x1E0CB3940];
    -[CAMTextRegionResult metadataType](v7, "metadataType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ %ld"), v14, objc_msgSend(v5, "regionID"));
    v15 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v7->_uniqueIdentifier;
    v7->_uniqueIdentifier = (NSString *)v15;

    v17 = v7;
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTextRegionResult _metadataTextRegionObject](self, "_metadataTextRegionObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p identifier: %ld>"), v5, self, objc_msgSend(v6, "regionID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (float)confidence
{
  void *v2;
  float v3;
  float v4;

  -[CAMTextRegionResult _metadataTextRegionObject](self, "_metadataTextRegionObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "confidence");
  v4 = v3;

  return v4;
}

- (NSString)metadataType
{
  return (NSString *)CFSTR("TextRegion");
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)baselineAngle
{
  return self->_baselineAngle;
}

- (AVMetadataTextRegionObject)_metadataTextRegionObject
{
  return self->__metadataTextRegionObject;
}

- (void)set_metadataTextRegionObject:(id)a3
{
  objc_storeStrong((id *)&self->__metadataTextRegionObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__metadataTextRegionObject, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
