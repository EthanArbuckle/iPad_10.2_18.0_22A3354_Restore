@implementation _PHPickerAspectRatio

- (id)_initWithAspectRatio:(double)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PHPickerAspectRatio;
  result = -[_PHPickerAspectRatio init](&v5, sel_init);
  if (result)
    *((double *)result + 1) = a3;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[_PHPickerAspectRatio _initWithAspectRatio:]([_PHPickerAspectRatio alloc], "_initWithAspectRatio:", self->__aspectRatio);
}

- (_PHPickerAspectRatio)initWithCoder:(id)a3
{
  id v4;
  _PHPickerAspectRatio *v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_PHPickerAspectRatio;
  v5 = -[_PHPickerAspectRatio init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("PHPickerAspectRatioAspectRatioKey"));
    v5->__aspectRatio = v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("PHPickerAspectRatioAspectRatioKey"), self->__aspectRatio);
}

- (double)_aspectRatio
{
  return self->__aspectRatio;
}

+ (_PHPickerAspectRatio)deviceAspectRatio
{
  return (_PHPickerAspectRatio *)-[_PHPickerAspectRatio _initWithAspectRatio:]([_PHPickerAspectRatio alloc], "_initWithAspectRatio:", 0.0);
}

+ (id)aspectRatio:(double)a3
{
  void *v4;
  SEL v5;

  if (a3 > 0.0)
    return -[_PHPickerAspectRatio _initWithAspectRatio:]([_PHPickerAspectRatio alloc], "_initWithAspectRatio:", a3);
  v4 = (void *)_PFAssertFailHandler();
  return (id)+[_PHPickerAspectRatio supportsSecureCoding](v4, v5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
