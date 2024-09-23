@implementation MADSharpnessResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADSharpnessResult)initWithSharpnessScore:(double)a3
{
  MADSharpnessResult *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MADSharpnessResult;
  result = -[MADResult init](&v5, sel_init);
  if (result)
    result->_sharpnessScore = a3;
  return result;
}

+ (id)resultWithSharpnessScore:(double)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithSharpnessScore:", a3);
}

- (MADSharpnessResult)initWithCoder:(id)a3
{
  id v4;
  MADSharpnessResult *v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MADSharpnessResult;
  v5 = -[MADResult initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("SharpnessScore"));
    v5->_sharpnessScore = v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MADSharpnessResult;
  -[MADResult encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("SharpnessScore"), self->_sharpnessScore);

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %.3f>"), CFSTR("SharpnessScore"), *(_QWORD *)&self->_sharpnessScore);
  return v3;
}

- (double)sharpnessScore
{
  return self->_sharpnessScore;
}

@end
