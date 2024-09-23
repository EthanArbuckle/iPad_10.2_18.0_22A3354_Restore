@implementation HMFBoolean

+ (HMFBoolean)allocWithZone:(_NSZone *)a3
{
  uint64_t v5;
  objc_super v7;

  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
    return (HMFBoolean *)+[HMFBoolean allocWithZone:](__HMFBoolean, "allocWithZone:", a3);
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___HMFBoolean;
  return (HMFBoolean *)objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
}

+ (HMFBoolean)BOOLeanWithBool:(BOOL)a3
{
  return (HMFBoolean *)(id)objc_opt_new();
}

+ (id)numberWithChar:(char)a3
{
  return (id)objc_msgSend(a1, "BOOLeanWithBool:", a3 != 0);
}

+ (id)numberWithUnsignedChar:(unsigned __int8)a3
{
  return (id)objc_msgSend(a1, "BOOLeanWithBool:", a3 != 0);
}

+ (id)numberWithShort:(signed __int16)a3
{
  return (id)objc_msgSend(a1, "BOOLeanWithBool:", a3 != 0);
}

+ (id)numberWithUnsignedShort:(unsigned __int16)a3
{
  return (id)objc_msgSend(a1, "BOOLeanWithBool:", a3 != 0);
}

+ (id)numberWithInt:(int)a3
{
  return (id)objc_msgSend(a1, "BOOLeanWithBool:", a3 != 0);
}

+ (id)numberWithUnsignedInt:(unsigned int)a3
{
  return (id)objc_msgSend(a1, "BOOLeanWithBool:", a3 != 0);
}

+ (id)numberWithLong:(int64_t)a3
{
  return (id)objc_msgSend(a1, "BOOLeanWithBool:", a3 != 0);
}

+ (id)numberWithUnsignedLong:(unint64_t)a3
{
  return (id)objc_msgSend(a1, "BOOLeanWithBool:", a3 != 0);
}

+ (id)numberWithLongLong:(int64_t)a3
{
  return (id)objc_msgSend(a1, "BOOLeanWithBool:", a3 != 0);
}

+ (id)numberWithUnsignedLongLong:(unint64_t)a3
{
  return (id)objc_msgSend(a1, "BOOLeanWithBool:", a3 != 0);
}

+ (id)numberWithFloat:(float)a3
{
  return (id)objc_msgSend(a1, "BOOLeanWithBool:", a3 != 0.0);
}

+ (id)numberWithDouble:(double)a3
{
  return (id)objc_msgSend(a1, "BOOLeanWithBool:", a3 != 0.0);
}

+ (id)numberWithInteger:(int64_t)a3
{
  return (id)objc_msgSend(a1, "BOOLeanWithBool:", a3 != 0);
}

+ (id)numberWithUnsignedInteger:(unint64_t)a3
{
  return (id)objc_msgSend(a1, "BOOLeanWithBool:", a3 != 0);
}

- (HMFBoolean)initWithBool:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HMFBoolean;
  return -[HMFBoolean init](&v4, sel_init, a3);
}

- (id)description
{
  if (-[HMFBoolean BOOLValue](self, "BOOLValue"))
    return CFSTR("YES");
  else
    return CFSTR("NO");
}

- (unint64_t)hash
{
  -[HMFBoolean BOOLValue](self, "BOOLValue");
  return CFHashBytes();
}

- (int64_t)compare:(id)a3
{
  HMFBoolean *v4;
  int v5;
  int v6;
  int64_t v7;
  uint64_t v8;

  v4 = (HMFBoolean *)a3;
  if (self == v4)
  {
    v7 = 0;
  }
  else
  {
    v5 = -[HMFBoolean BOOLValue](self, "BOOLValue");
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        _HMFPreconditionFailure(CFSTR("[otherNumber isKindOfClass:NSNumber.class]"));
      v6 = -[HMFBoolean BOOLValue](v4, "BOOLValue");
    }
    else
    {
      v6 = 0;
    }
    v8 = 1;
    if (!v5)
      v8 = -1;
    if (v6 == v5)
      v7 = 0;
    else
      v7 = v8;
  }

  return v7;
}

- (void)getValue:(void *)a3
{
  -[HMFBoolean getValue:size:](self, "getValue:size:", a3, 1);
}

- (void)getValue:(void *)a3 size:(unint64_t)a4
{
  if (!a3)
    _HMFPreconditionFailure(CFSTR("value"));
  if (a4 != 1)
    _HMFPreconditionFailure(CFSTR("size == 1"));
  *(_BYTE *)a3 = -[HMFBoolean BOOLValue](self, "BOOLValue");
}

- (const)objCType
{
  return "c";
}

- (char)charValue
{
  return -[HMFBoolean BOOLValue](self, "BOOLValue");
}

- (BOOL)BOOLValue
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[HMFBoolean BOOLValue](self, "BOOLValue"), CFSTR("HMF.value"));

}

@end
