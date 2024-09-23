@implementation _PFCachedNumber

- (_PFCachedNumber)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0;
}

+ (id)alloc
{
  return 0;
}

- (unint64_t)retainCount
{
  return 1;
}

- (BOOL)_isDeallocating
{
  return 0;
}

- (BOOL)_tryRetain
{
  return 1;
}

- (_PFCachedNumber)initWithBytes:(const void *)a3 objCType:(const char *)a4
{
  return 0;
}

+ (id)valueWithBytes:(const void *)a3 objCType:(const char *)a4
{
  return 0;
}

+ (id)value:(const void *)a3 withObjCType:(const char *)a4
{
  return 0;
}

- (void)getValue:(void *)a3
{
  *(_DWORD *)a3 = ((self >> 3) & 0x1FF) - 1;
}

- (const)objCType
{
  return "i";
}

- (char)charValue
{
  return (self >> 3) - 1;
}

- (unsigned)unsignedCharValue
{
  return (self >> 3) - 1;
}

- (signed)shortValue
{
  return ((self >> 3) & 0x1FF) - 1;
}

- (unsigned)unsignedShortValue
{
  return ((self >> 3) & 0x1FF) - 1;
}

- (int)intValue
{
  return ((self >> 3) & 0x1FF) - 1;
}

- (unsigned)unsignedIntValue
{
  return ((self >> 3) & 0x1FF) - 1;
}

- (int64_t)longValue
{
  return (((unint64_t)self >> 3) & 0x1FF) - 1;
}

- (unint64_t)unsignedLongValue
{
  return (((unint64_t)self >> 3) & 0x1FF) - 1;
}

- (int64_t)longLongValue
{
  return (((unint64_t)self >> 3) & 0x1FF) - 1;
}

- (unint64_t)unsignedLongLongValue
{
  return (((unint64_t)self >> 3) & 0x1FF) - 1;
}

- (float)floatValue
{
  return (float)(uint64_t)((((unint64_t)self >> 3) & 0x1FF) - 1);
}

- (double)doubleValue
{
  return (double)(uint64_t)((((unint64_t)self >> 3) & 0x1FF) - 1);
}

- (BOOL)BOOLValue
{
  return ((unsigned __int16)self & 0xFF8) != 8;
}

- (int64_t)integerValue
{
  return (((unint64_t)self >> 3) & 0x1FF) - 1;
}

- (unint64_t)unsignedIntegerValue
{
  return (((unint64_t)self >> 3) & 0x1FF) - 1;
}

- (id)stringValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), ((self >> 3) & 0x1FF) - 1);
}

@end
