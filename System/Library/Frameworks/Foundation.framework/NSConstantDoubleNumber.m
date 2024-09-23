@implementation NSConstantDoubleNumber

- (double)doubleValue
{
  return self->_value;
}

- (const)objCType
{
  return "d";
}

- (void)getValue:(void *)a3
{
  *(double *)a3 = self->_value;
}

- (float)floatValue
{
  return self->_value;
}

- (int64_t)integerValue
{
  return (uint64_t)self->_value;
}

- (unsigned)unsignedShortValue
{
  return (int)self->_value;
}

- (unsigned)unsignedIntValue
{
  return self->_value;
}

- (void)getValue:(void *)a3 size:(unint64_t)a4
{
  NSString *v4;

  if (a4 != 8)
  {
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Cannot get value with size %zu. The type encoded as %s is expected to be %zu bytes"), a4, "d", 8);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v4, 0));
  }
  *(double *)a3 = self->_value;
}

- ($2F068FC02377E22BA03580A8162C781E)decimalValue
{
  NSDecimalNumber *v4;
  $2F068FC02377E22BA03580A8162C781E *result;
  NSDecimalNumber *v6;

  v4 = -[NSNumber initWithDouble:]([NSDecimalNumber alloc], "initWithDouble:", self->_value);
  *(_QWORD *)retstr = 0;
  *(_QWORD *)&retstr->var5[2] = 0;
  *(_DWORD *)&retstr->var5[6] = 0;
  if (v4)
  {
    v6 = v4;
    -[NSDecimalNumber decimalValue](v4, "decimalValue");
    v4 = v6;
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

- (int)intValue
{
  return (int)self->_value;
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
