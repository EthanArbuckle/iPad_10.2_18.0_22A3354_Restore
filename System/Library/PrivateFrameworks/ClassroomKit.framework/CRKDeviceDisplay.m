@implementation CRKDeviceDisplay

- (CRKDeviceDisplay)initWithScaleFactor:(double)a3 frame:(CGRect)a4 orientation:(unint64_t)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CRKDeviceDisplay *result;
  objc_super v12;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)CRKDeviceDisplay;
  result = -[CRKDeviceDisplay init](&v12, sel_init);
  if (result)
  {
    result->_scaleFactor = a3;
    result->_frame.origin.x = x;
    result->_frame.origin.y = y;
    result->_frame.size.width = width;
    result->_frame.size.height = height;
    result->_orientation = a5;
  }
  return result;
}

- (CRKDeviceDisplay)initWithScaleFactor:(double)a3 width:(double)a4 height:(double)a5 orientation:(unint64_t)a6
{
  return -[CRKDeviceDisplay initWithScaleFactor:frame:orientation:](self, "initWithScaleFactor:frame:orientation:", a6, a3, 0.0, 0.0, a4, a5);
}

- (CRKDeviceDisplay)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  float v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scaleFactor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  v8 = CRKRectFromDictionary(v4);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("orientation"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "unsignedIntegerValue");
  return -[CRKDeviceDisplay initWithScaleFactor:frame:orientation:](self, "initWithScaleFactor:frame:orientation:", v16, v7, v8, v10, v12, v14);
}

- (NSDictionary)dictionaryValue
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_opt_new();
  -[CRKDeviceDisplay frame](self, "frame");
  CRKDictionaryFromRect(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v8);

  v9 = (void *)MEMORY[0x24BDD16E0];
  -[CRKDeviceDisplay scaleFactor](self, "scaleFactor");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("scaleFactor"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRKDeviceDisplay orientation](self, "orientation"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("orientation"));

  v12 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRKDeviceDisplay dictionaryValue](self, "dictionaryValue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dictionaryValue"));

}

- (CRKDeviceDisplay)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CRKDeviceDisplay *v7;

  v4 = a3;
  CRKFoundationClasses();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("dictionaryValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CRKDeviceDisplay initWithDictionary:](self, "initWithDictionary:", v6);
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CRKDeviceDisplay *v4;
  CRKDeviceDisplay *v5;
  CRKDeviceDisplay *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  BOOL v22;
  unint64_t v23;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  CGRect v31;
  CGRect v32;

  v4 = (CRKDeviceDisplay *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v22 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CRKDeviceDisplay isEqual:]");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("CRKDeviceDisplay.m"), 98, CFSTR("expected %@, got %@"), v28, v30);

    }
    -[CRKDeviceDisplay frame](self, "frame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[CRKDeviceDisplay frame](v6, "frame");
    v32.origin.x = v15;
    v32.origin.y = v16;
    v32.size.width = v17;
    v32.size.height = v18;
    v31.origin.x = v8;
    v31.origin.y = v10;
    v31.size.width = v12;
    v31.size.height = v14;
    if (CGRectEqualToRect(v31, v32)
      && (-[CRKDeviceDisplay scaleFactor](self, "scaleFactor"),
          v20 = v19,
          -[CRKDeviceDisplay scaleFactor](v6, "scaleFactor"),
          vabdd_f64(v20, v21) <= 2.22044605e-16))
    {
      v23 = -[CRKDeviceDisplay orientation](self, "orientation");
      v22 = v23 == -[CRKDeviceDisplay orientation](v6, "orientation");
    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (unint64_t)hash
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  -[CRKDeviceDisplay frame](self, "frame");
  v7 = CRKRectHash(v3, v4, v5, v6);
  v8 = (void *)MEMORY[0x24BDD16E0];
  -[CRKDeviceDisplay scaleFactor](self, "scaleFactor");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash") ^ v7;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRKDeviceDisplay orientation](self, "orientation"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");

  return v12;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)orientation
{
  return self->_orientation;
}

@end
