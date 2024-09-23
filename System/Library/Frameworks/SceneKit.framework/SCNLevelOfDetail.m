@implementation SCNLevelOfDetail

- (void)dealloc
{
  __C3DLOD *lod;
  objc_super v4;

  lod = self->_lod;
  if (lod)
  {
    CFRelease(lod);
    self->_lod = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)SCNLevelOfDetail;
  -[SCNLevelOfDetail dealloc](&v4, sel_dealloc);
}

- (void)_setupWithGeometry:(id)a3 thresholdMode:(int64_t)a4 value:(double)a5
{
  SCNGeometry *geometry;
  const void *v10;
  float v11;

  geometry = self->_geometry;
  if (geometry != a3)
  {

    self->_geometry = (SCNGeometry *)a3;
  }
  self->_mode = a4;
  v10 = (const void *)objc_msgSend(a3, "__CFObject");
  v11 = a5;
  self->_lod = (__C3DLOD *)C3DLODCreate(v10, a4, v11);
}

- (SCNLevelOfDetail)initWithGeometry:(id)a3 thresholdMode:(int64_t)a4 lod:(__C3DLOD *)a5
{
  SCNLevelOfDetail *v7;
  SCNLevelOfDetail *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SCNLevelOfDetail;
  v7 = -[SCNLevelOfDetail init](&v10, sel_init, a3);
  v8 = v7;
  if (v7)
  {
    v7->_mode = a4;
    if (a5)
      v7->_lod = (__C3DLOD *)CFRetain(a5);
    v8->_mode = a4;
  }
  return v8;
}

- (SCNLevelOfDetail)initWithGeometry:(id)a3 thresholdMode:(int64_t)a4 thresholdValue:(id)a5
{
  SCNLevelOfDetail *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SCNLevelOfDetail;
  v8 = -[SCNLevelOfDetail init](&v10, sel_init);
  if (v8)
  {
    objc_msgSend(a5, "doubleValue");
    -[SCNLevelOfDetail _setupWithGeometry:thresholdMode:value:](v8, "_setupWithGeometry:thresholdMode:value:", a3, a4);
  }
  return v8;
}

+ (SCNLevelOfDetail)levelOfDetailWithGeometry:(SCNGeometry *)geometry screenSpaceRadius:(CGFloat)radius
{
  SCNLevelOfDetail *v6;

  v6 = objc_alloc_init(SCNLevelOfDetail);
  -[SCNLevelOfDetail _setupWithGeometry:thresholdMode:value:](v6, "_setupWithGeometry:thresholdMode:value:", geometry, 1, radius);
  return v6;
}

+ (SCNLevelOfDetail)levelOfDetailWithGeometry:(SCNGeometry *)geometry worldSpaceDistance:(CGFloat)distance
{
  SCNLevelOfDetail *v6;

  v6 = objc_alloc_init(SCNLevelOfDetail);
  -[SCNLevelOfDetail _setupWithGeometry:thresholdMode:value:](v6, "_setupWithGeometry:thresholdMode:value:", geometry, 0, distance);
  return v6;
}

- (void)__CFObject
{
  return self->_lod;
}

- (SCNGeometry)geometry
{
  return self->_geometry;
}

- (int64_t)thresholdMode
{
  return self->_mode;
}

- (id)thresholdValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", C3DLODGetThreshold((uint64_t)self->_lod));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGeometry:thresholdMode:lod:", self->_geometry, self->_mode, self->_lod);
}

- (id)copy
{
  return -[SCNLevelOfDetail copyWithZone:](self, "copyWithZone:", 0);
}

- (CGFloat)screenSpaceRadius
{
  CGFloat result;

  result = 0.0;
  if (self->_mode == 1)
    return C3DLODGetThreshold((uint64_t)self->_lod);
  return result;
}

- (CGFloat)worldSpaceDistance
{
  CGFloat result;

  result = 0.0;
  if (!self->_mode)
    return C3DLODGetThreshold((uint64_t)self->_lod);
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("levelOfDetail <%p>: geometry:%@ threshold:%f useDistance:%d"), self, -[SCNLevelOfDetail geometry](self, "geometry"), C3DLODGetThreshold((uint64_t)self->_lod), self->_mode == 0);
}

- (void)_customEncodingOfSCNLevelOfDetail:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", C3DLODGetThreshold((uint64_t)self->_lod)), CFSTR("threshold"));
}

- (void)_didDecodeSCNLevelOfDetail:(id)a3
{
  objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("threshold")), "doubleValue");
  -[SCNLevelOfDetail _setupWithGeometry:thresholdMode:value:](self, "_setupWithGeometry:thresholdMode:value:", self->_geometry, self->_mode);
}

- (void)encodeWithCoder:(id)a3
{
  SCNGeometry *geometry;

  -[SCNLevelOfDetail _customEncodingOfSCNLevelOfDetail:](self, "_customEncodingOfSCNLevelOfDetail:");
  objc_msgSend(a3, "encodeInteger:forKey:", self->_mode, CFSTR("mode"));
  geometry = self->_geometry;
  if (geometry)
    objc_msgSend(a3, "encodeObject:forKey:", geometry, CFSTR("geometry"));
}

- (SCNLevelOfDetail)initWithCoder:(id)a3
{
  SCNLevelOfDetail *v4;
  _BOOL8 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNLevelOfDetail;
  v4 = -[SCNLevelOfDetail init](&v7, sel_init);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    v4->_mode = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("mode"));
    v4->_geometry = (SCNGeometry *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("geometry"));
    -[SCNLevelOfDetail _didDecodeSCNLevelOfDetail:](v4, "_didDecodeSCNLevelOfDetail:", a3);
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
