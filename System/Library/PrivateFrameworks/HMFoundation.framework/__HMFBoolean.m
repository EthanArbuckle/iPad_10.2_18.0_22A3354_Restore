@implementation __HMFBoolean

- (__HMFBoolean)initWithChar:(char)a3
{
  int v3;
  __HMFBoolean *result;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)__HMFBoolean;
  result = -[HMFBoolean initWithBool:](&v5, sel_initWithBool_, a3 != 0);
  if (result)
    result->_value = v3 != 0;
  return result;
}

- (__HMFBoolean)initWithUnsignedChar:(unsigned __int8)a3
{
  int v3;
  __HMFBoolean *result;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)__HMFBoolean;
  result = -[HMFBoolean initWithBool:](&v5, sel_initWithBool_, a3 != 0);
  if (result)
    result->_value = v3 != 0;
  return result;
}

- (__HMFBoolean)initWithShort:(signed __int16)a3
{
  int v3;
  __HMFBoolean *result;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)__HMFBoolean;
  result = -[HMFBoolean initWithBool:](&v5, sel_initWithBool_, a3 != 0);
  if (result)
    result->_value = v3 != 0;
  return result;
}

- (__HMFBoolean)initWithUnsignedShort:(unsigned __int16)a3
{
  int v3;
  __HMFBoolean *result;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)__HMFBoolean;
  result = -[HMFBoolean initWithBool:](&v5, sel_initWithBool_, a3 != 0);
  if (result)
    result->_value = v3 != 0;
  return result;
}

- (__HMFBoolean)initWithInt:(int)a3
{
  __HMFBoolean *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)__HMFBoolean;
  result = -[HMFBoolean initWithBool:](&v5, sel_initWithBool_, a3 != 0);
  if (result)
    result->_value = a3 != 0;
  return result;
}

- (__HMFBoolean)initWithUnsignedInt:(unsigned int)a3
{
  __HMFBoolean *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)__HMFBoolean;
  result = -[HMFBoolean initWithBool:](&v5, sel_initWithBool_, a3 != 0);
  if (result)
    result->_value = a3 != 0;
  return result;
}

- (__HMFBoolean)initWithLong:(int64_t)a3
{
  __HMFBoolean *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)__HMFBoolean;
  result = -[HMFBoolean initWithBool:](&v5, sel_initWithBool_, a3 != 0);
  if (result)
    result->_value = a3 != 0;
  return result;
}

- (__HMFBoolean)initWithUnsignedLong:(unint64_t)a3
{
  __HMFBoolean *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)__HMFBoolean;
  result = -[HMFBoolean initWithBool:](&v5, sel_initWithBool_, a3 != 0);
  if (result)
    result->_value = a3 != 0;
  return result;
}

- (__HMFBoolean)initWithLongLong:(int64_t)a3
{
  __HMFBoolean *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)__HMFBoolean;
  result = -[HMFBoolean initWithBool:](&v5, sel_initWithBool_, a3 != 0);
  if (result)
    result->_value = a3 != 0;
  return result;
}

- (__HMFBoolean)initWithUnsignedLongLong:(unint64_t)a3
{
  __HMFBoolean *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)__HMFBoolean;
  result = -[HMFBoolean initWithBool:](&v5, sel_initWithBool_, a3 != 0);
  if (result)
    result->_value = a3 != 0;
  return result;
}

- (__HMFBoolean)initWithFloat:(float)a3
{
  __HMFBoolean *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)__HMFBoolean;
  result = -[HMFBoolean initWithBool:](&v5, sel_initWithBool_, a3 != 0.0);
  if (result)
    result->_value = a3 != 0.0;
  return result;
}

- (__HMFBoolean)initWithDouble:(double)a3
{
  __HMFBoolean *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)__HMFBoolean;
  result = -[HMFBoolean initWithBool:](&v5, sel_initWithBool_, a3 != 0.0);
  if (result)
    result->_value = a3 != 0.0;
  return result;
}

- (__HMFBoolean)initWithBool:(BOOL)a3
{
  __HMFBoolean *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)__HMFBoolean;
  result = -[HMFBoolean initWithBool:](&v5, sel_initWithBool_);
  if (result)
    result->_value = a3;
  return result;
}

- (__HMFBoolean)initWithInteger:(int64_t)a3
{
  __HMFBoolean *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)__HMFBoolean;
  result = -[HMFBoolean initWithBool:](&v5, sel_initWithBool_, a3 != 0);
  if (result)
    result->_value = a3 != 0;
  return result;
}

- (__HMFBoolean)initWithUnsignedInteger:(unint64_t)a3
{
  __HMFBoolean *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)__HMFBoolean;
  result = -[HMFBoolean initWithBool:](&v5, sel_initWithBool_, a3 != 0);
  if (result)
    result->_value = a3 != 0;
  return result;
}

- (BOOL)BOOLValue
{
  return self->_value;
}

- (__HMFBoolean)initWithCoder:(id)a3
{
  uint64_t v4;
  __HMFBoolean *result;
  objc_super v6;

  v4 = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("HMF.value"));
  v6.receiver = self;
  v6.super_class = (Class)__HMFBoolean;
  result = -[HMFBoolean initWithBool:](&v6, sel_initWithBool_, v4);
  if (result)
    result->_value = v4;
  return result;
}

@end
