@implementation AXBrailleMap

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AXBrailleMap *v4;
  uint64_t v5;
  NSMutableDictionary *values;
  uint64_t v7;
  CIImage *presentedImage;

  v4 = -[AXBrailleMap init](+[AXBrailleMap allocWithZone:](AXBrailleMap, "allocWithZone:", a3), "init");
  v5 = -[NSMutableDictionary copy](self->_values, "copy");
  values = v4->_values;
  v4->_values = (NSMutableDictionary *)v5;

  v7 = -[CIImage copy](self->_presentedImage, "copy");
  presentedImage = v4->_presentedImage;
  v4->_presentedImage = (CIImage *)v7;

  return v4;
}

+ (id)connectedBrailleMap
{
  NSString *v2;
  void *v3;
  NSSize v4;

  objc_msgSend((id)_AXSVoiceOverTouchActive2DBrailleDisplays(), "lastObject");
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    v4 = NSSizeFromString(v2);
    objc_msgSend(v3, "setDimensions:", v4.width, v4.height);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setHeight:(float)status atPoint:(CGPoint)point
{
  double y;
  double x;
  NSMutableDictionary *values;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  id v15;

  y = point.y;
  x = point.x;
  values = self->_values;
  if (!values)
  {
    v9 = (NSMutableDictionary *)objc_opt_new();
    v10 = self->_values;
    self->_values = v9;

    values = self->_values;
  }
  *(float *)&v11 = status;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v11);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD16E0];
  -[AXBrailleMap dimensions](self, "dimensions");
  objc_msgSend(v12, "numberWithDouble:", x + y * v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](values, "setObject:forKey:", v15, v14);

}

- (void)presentImage:(CGImageRef)image
{
  CIImage *v4;
  CIImage *presentedImage;
  NSObject *v6;

  if (image)
  {
    v4 = (CIImage *)objc_msgSend(objc_alloc((Class)getCIImageClass()), "initWithCGImage:", image);
    presentedImage = self->_presentedImage;
    self->_presentedImage = v4;

  }
  else
  {
    AXLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AXBrailleMap presentImage:].cold.1(v6);

  }
}

- (id)presentedImage
{
  return self->_presentedImage;
}

- (float)heightAtPoint:(CGPoint)point
{
  CGFloat y;
  double x;
  NSMutableDictionary *values;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  int v10;

  y = point.y;
  x = point.x;
  values = self->_values;
  v6 = (void *)MEMORY[0x24BDD16E0];
  -[AXBrailleMap dimensions](self, "dimensions");
  objc_msgSend(v6, "numberWithDouble:", x + y * v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](values, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  LODWORD(y) = v10;

  return *(float *)&y;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *values;
  id v5;
  id v6;

  values = self->_values;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", values, CFSTR("values"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_presentedImage, CFSTR("presentedImage"));
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithSize:", self->_dimensions.width, self->_dimensions.height);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("dimensions"));

}

- (AXBrailleMap)initWithCoder:(id)a3
{
  id v4;
  AXBrailleMap *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSMutableDictionary *values;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  CIImage *presentedImage;
  id CIImageClass;
  _QWORD v22[2];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (AXBrailleMap *)objc_opt_new();
  v6 = (void *)MEMORY[0x24BDBCF20];
  v23[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("dimensions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sizeValue");
  -[AXBrailleMap setDimensions:](v5, "setDimensions:");

  v10 = (void *)MEMORY[0x24BDBCF20];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("values"));
  v13 = objc_claimAutoreleasedReturnValue();
  values = v5->_values;
  v5->_values = (NSMutableDictionary *)v13;

  v15 = (void *)MEMORY[0x24BDBCF20];
  CIImageClass = getCIImageClass();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &CIImageClass, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("presentedImage"));
  v18 = objc_claimAutoreleasedReturnValue();

  presentedImage = v5->_presentedImage;
  v5->_presentedImage = (CIImage *)v18;

  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSSize v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[AXBrailleMap dimensions](self, "dimensions");
  NSStringFromSize(v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@[%p]: Dimensions: %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGSize)dimensions
{
  double width;
  double height;
  CGSize result;

  width = self->_dimensions.width;
  height = self->_dimensions.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDimensions:(CGSize)a3
{
  self->_dimensions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedImage, 0);
  objc_storeStrong((id *)&self->_values, 0);
}

- (void)presentImage:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_209557000, log, OS_LOG_TYPE_ERROR, "Nil image passed into presentImage:", v1, 2u);
}

@end
