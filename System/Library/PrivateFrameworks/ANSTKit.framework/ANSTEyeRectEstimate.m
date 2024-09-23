@implementation ANSTEyeRectEstimate

+ (id)new
{
  id result;

  result = (id)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTEyeRectEstimate)init
{
  ANSTEyeRectEstimate *result;

  result = (ANSTEyeRectEstimate *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTEyeRectEstimate)initWithEyeRectLeft:(CGRect)a3 eyeRectRight:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  ANSTEyeRectEstimate *result;
  objc_super v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)ANSTEyeRectEstimate;
  result = -[ANSTEyeRectEstimate init](&v13, sel_init);
  result->_eyeRectLeft.origin.x = v11;
  result->_eyeRectLeft.origin.y = v10;
  result->_eyeRectLeft.size.width = v9;
  result->_eyeRectLeft.size.height = v8;
  result->_eyeRectRight.origin.x = x;
  result->_eyeRectRight.origin.y = y;
  result->_eyeRectRight.size.width = width;
  result->_eyeRectRight.size.height = height;
  return result;
}

- (ANSTEyeRectEstimate)initWithCoder:(id)a3
{
  id v4;
  ANSTEyeRectEstimate *v5;
  ANSTEyeRectEstimate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ANSTEyeRectEstimate;
  v5 = -[ANSTEyeRectEstimate init](&v8, sel_init);
  if (sub_2358E08B0(v4, (uint64_t)&v5->_eyeRectLeft, sel_eyeRectLeft)
    && sub_2358E08B0(v4, (uint64_t)&v5->_eyeRectRight, sel_eyeRectRight))
  {
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  id v8;

  x = self->_eyeRectLeft.origin.x;
  y = self->_eyeRectLeft.origin.y;
  width = self->_eyeRectLeft.size.width;
  height = self->_eyeRectLeft.size.height;
  v8 = a3;
  sub_2358E0AC8(v8, sel_eyeRectLeft, x, y, width, height);
  sub_2358E0AC8(v8, sel_eyeRectRight, self->_eyeRectRight.origin.x, self->_eyeRectRight.origin.y, self->_eyeRectRight.size.width, self->_eyeRectRight.size.height);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend_appendFormat_(v3, v4, (uint64_t)CFSTR("<ANSTEyeRectEstimate %p> {\n"), self);
  sub_2358E0C58(self->_eyeRectLeft.origin.x, self->_eyeRectLeft.origin.y, self->_eyeRectLeft.size.width, self->_eyeRectLeft.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v3, v6, (uint64_t)CFSTR("    eyeRectLeft  %@\n"), v5);

  sub_2358E0C58(self->_eyeRectRight.origin.x, self->_eyeRectRight.origin.y, self->_eyeRectRight.size.width, self->_eyeRectRight.size.height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v3, v8, (uint64_t)CFSTR("    eyeRectRight %@\n"), v7);

  objc_msgSend_appendString_(v3, v9, (uint64_t)CFSTR("}"));
  v12 = (void *)objc_msgSend_copy(v3, v10, v11);

  return v12;
}

- (CGRect)eyeRectLeft
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_eyeRectLeft.origin.x;
  y = self->_eyeRectLeft.origin.y;
  width = self->_eyeRectLeft.size.width;
  height = self->_eyeRectLeft.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)eyeRectRight
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_eyeRectRight.origin.x;
  y = self->_eyeRectRight.origin.y;
  width = self->_eyeRectRight.size.width;
  height = self->_eyeRectRight.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
