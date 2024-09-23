@implementation PasscodeViewStyle

- (PasscodeViewStyle)initWithRawValue:(int64_t)a3 backgroundStyle:(int64_t)a4
{
  PasscodeViewStyle *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PasscodeViewStyle;
  result = -[PasscodeViewStyle init](&v7, "init");
  if (result)
  {
    result->_rawValue = a3;
    result->_backgroundStyle = a4;
  }
  return result;
}

+ (id)darkStyleWithBackgroundStyle:(int64_t)a3
{
  return -[PasscodeViewStyle initWithRawValue:backgroundStyle:]([PasscodeViewStyle alloc], "initWithRawValue:backgroundStyle:", 0, a3);
}

+ (id)lightStyleWithBackgroundStyle:(int64_t)a3
{
  return -[PasscodeViewStyle initWithRawValue:backgroundStyle:]([PasscodeViewStyle alloc], "initWithRawValue:backgroundStyle:", 1, a3);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  BOOL v10;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = v4;
    v8 = -[PasscodeViewStyle rawValue](self, "rawValue");
    if (v8 == objc_msgSend(v7, "rawValue"))
    {
      v9 = -[PasscodeViewStyle backgroundStyle](self, "backgroundStyle");
      v10 = v9 == objc_msgSend(v7, "backgroundStyle");
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int64_t)rawValue
{
  return self->_rawValue;
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

@end
