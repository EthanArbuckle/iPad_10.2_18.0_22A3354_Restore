@implementation AVTimeRangeMarkUIProxy

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (BOOL)isMasked
{
  return self->_isMasked;
}

- (float)cornerRadius
{
  return self->_cornerRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

+ (id)maskedTimeRangeMarkUIProxyWithCornerRadius:(float)a3
{
  AVTimeRangeMarkUIProxy *v4;

  v4 = objc_alloc_init(AVTimeRangeMarkUIProxy);
  v4->_isMasked = 1;
  v4->_cornerRadius = a3;
  return v4;
}

+ (id)timeRangeMarkUIProxyWithBackgroundColor:(id)a3 cornerRadius:(float)a4
{
  UIColor *v5;
  AVTimeRangeMarkUIProxy *v6;
  UIColor *backgroundColor;

  v5 = (UIColor *)a3;
  v6 = objc_alloc_init(AVTimeRangeMarkUIProxy);
  backgroundColor = v6->_backgroundColor;
  v6->_backgroundColor = v5;

  v6->_cornerRadius = a4;
  return v6;
}

@end
