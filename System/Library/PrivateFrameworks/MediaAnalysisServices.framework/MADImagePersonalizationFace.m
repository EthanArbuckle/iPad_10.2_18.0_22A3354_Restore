@implementation MADImagePersonalizationFace

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADImagePersonalizationFace)initWithNormalizedCropRect:(CGRect)a3 eligible:(BOOL)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  MADImagePersonalizationFace *result;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)MADImagePersonalizationFace;
  result = -[MADImagePersonalizationFace init](&v10, sel_init);
  if (result)
  {
    result->_normalizedCropRect.origin.x = x;
    result->_normalizedCropRect.origin.y = y;
    result->_normalizedCropRect.size.width = width;
    result->_normalizedCropRect.size.height = height;
    result->_eligible = a4;
  }
  return result;
}

- (MADImagePersonalizationFace)initWithCoder:(id)a3
{
  id v4;
  MADImagePersonalizationFace *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MADImagePersonalizationFace;
  v5 = -[MADImagePersonalizationFace init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeRectForKey:", CFSTR("NormalizedCropRect"));
    v5->_normalizedCropRect.origin.x = v6;
    v5->_normalizedCropRect.origin.y = v7;
    v5->_normalizedCropRect.size.width = v8;
    v5->_normalizedCropRect.size.height = v9;
    v5->_eligible = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Eligible"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  id v8;

  x = self->_normalizedCropRect.origin.x;
  y = self->_normalizedCropRect.origin.y;
  width = self->_normalizedCropRect.size.width;
  height = self->_normalizedCropRect.size.height;
  v8 = a3;
  objc_msgSend(v8, "encodeRect:forKey:", CFSTR("NormalizedCropRect"), x, y, width, height);
  objc_msgSend(v8, "encodeBool:forKey:", self->_eligible, CFSTR("Eligible"));

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

  objc_msgSend(v3, "appendFormat:", CFSTR("normalizedCropRect: (%0.3f, %0.3f) to (%0.3f, %0.3f), "), *(_QWORD *)&self->_normalizedCropRect.origin.x, *(_QWORD *)&self->_normalizedCropRect.origin.y, self->_normalizedCropRect.origin.x + self->_normalizedCropRect.size.width, self->_normalizedCropRect.origin.y + self->_normalizedCropRect.size.height);
  objc_msgSend(v3, "appendFormat:", CFSTR("eligible: %d>"), self->_eligible);
  return v3;
}

- (CGRect)normalizedCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedCropRect.origin.x;
  y = self->_normalizedCropRect.origin.y;
  width = self->_normalizedCropRect.size.width;
  height = self->_normalizedCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)eligible
{
  return self->_eligible;
}

@end
