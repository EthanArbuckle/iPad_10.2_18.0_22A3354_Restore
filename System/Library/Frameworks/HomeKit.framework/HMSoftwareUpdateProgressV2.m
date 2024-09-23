@implementation HMSoftwareUpdateProgressV2

- (HMSoftwareUpdateProgressV2)initWithPercentageComplete:(float)a3 estimatedTimeRemaining:(double)a4
{
  HMSoftwareUpdateProgressV2 *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMSoftwareUpdateProgressV2;
  result = -[HMSoftwareUpdateProgressV2 init](&v7, sel_init);
  if (result)
  {
    result->_percentageComplete = a3;
    result->_estimatedTimeRemaining = a4;
  }
  return result;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[HMSoftwareUpdateProgressV2 percentageComplete](self, "percentageComplete");
  objc_msgSend(v3, "numberWithFloat:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[HMSoftwareUpdateProgressV2 estimatedTimeRemaining](self, "estimatedTimeRemaining");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") ^ v5;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  HMSoftwareUpdateProgressV2 *v4;
  HMSoftwareUpdateProgressV2 *v5;
  HMSoftwareUpdateProgressV2 *v6;
  float v7;
  float v8;
  float v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;

  v4 = (HMSoftwareUpdateProgressV2 *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6
      && (-[HMSoftwareUpdateProgressV2 percentageComplete](self, "percentageComplete"),
          v8 = v7,
          -[HMSoftwareUpdateProgressV2 percentageComplete](v6, "percentageComplete"),
          vabds_f32(v8, v9) < 0.00000011921))
    {
      -[HMSoftwareUpdateProgressV2 estimatedTimeRemaining](self, "estimatedTimeRemaining");
      v11 = v10;
      -[HMSoftwareUpdateProgressV2 estimatedTimeRemaining](v6, "estimatedTimeRemaining");
      v13 = vabdd_f64(v11, v12) < 2.22044605e-16;
    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[HMSoftwareUpdateProgressV2 percentageComplete](self, "percentageComplete");
  objc_msgSend(v4, "numberWithFloat:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("percentageComplete"), v5);
  v13[0] = v6;
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[HMSoftwareUpdateProgressV2 estimatedTimeRemaining](self, "estimatedTimeRemaining");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("estimatedTimeRemaining"), v9);
  v13[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v11;
}

- (float)percentageComplete
{
  return self->_percentageComplete;
}

- (double)estimatedTimeRemaining
{
  return self->_estimatedTimeRemaining;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
