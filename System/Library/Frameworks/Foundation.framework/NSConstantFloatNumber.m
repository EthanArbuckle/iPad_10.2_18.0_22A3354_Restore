@implementation NSConstantFloatNumber

- (const)objCType
{
  return "f";
}

- (float)floatValue
{
  return self->_value;
}

- (double)doubleValue
{
  return self->_value;
}

- (void)getValue:(void *)a3
{
  *(float *)a3 = self->_value;
}

- (void)getValue:(void *)a3 size:(unint64_t)a4
{
  NSString *v4;

  if (a4 != 4)
  {
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Cannot get value with size %zu. The type encoded as %s is expected to be %zu bytes"), a4, "f", 4);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v4, 0));
  }
  *(float *)a3 = self->_value;
}

- ($2F068FC02377E22BA03580A8162C781E)decimalValue
{
  NSDecimalNumber *v5;
  double v6;
  NSDecimalNumber *v7;
  $2F068FC02377E22BA03580A8162C781E *result;
  NSDecimalNumber *v9;

  v5 = [NSDecimalNumber alloc];
  *(float *)&v6 = self->_value;
  v7 = -[NSNumber initWithFloat:](v5, "initWithFloat:", v6);
  *(_QWORD *)retstr = 0;
  *(_QWORD *)&retstr->var5[2] = 0;
  *(_DWORD *)&retstr->var5[6] = 0;
  if (v7)
  {
    v9 = v7;
    -[NSDecimalNumber decimalValue](v7, "decimalValue");
    v7 = v9;
  }

  return result;
}

- (BOOL)BOOLValue
{
  return self->_value != 0.0;
}

+ (id)new
{
  return (id)objc_opt_new();
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return +[NSNumber allocWithZone:](NSNumber, "allocWithZone:", a3);
}

- (char)charValue
{
  return (int)self->_value;
}

- (unsigned)unsignedCharValue
{
  return (int)self->_value;
}

- (signed)shortValue
{
  return (int)self->_value;
}

- (unsigned)unsignedShortValue
{
  return (int)self->_value;
}

- (int)intValue
{
  return (int)self->_value;
}

- (unsigned)unsignedIntValue
{
  return self->_value;
}

- (int64_t)longValue
{
  return (uint64_t)self->_value;
}

- (unint64_t)unsignedLongValue
{
  return (unint64_t)self->_value;
}

- (int64_t)longLongValue
{
  return (uint64_t)self->_value;
}

- (unint64_t)unsignedLongLongValue
{
  return (unint64_t)self->_value;
}

- (int64_t)integerValue
{
  return (uint64_t)self->_value;
}

- (unint64_t)unsignedIntegerValue
{
  return (unint64_t)self->_value;
}

- (BOOL)_tryRetain
{
  return 1;
}

- (BOOL)_isDeallocating
{
  return 0;
}

- (unint64_t)retainCount
{
  return -1;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

@end
