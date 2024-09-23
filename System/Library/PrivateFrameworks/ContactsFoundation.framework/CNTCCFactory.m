@implementation CNTCCFactory

+ (id)defaultTCC
{
  return +[CNTCCFactory defaultTCCForType:](CNTCCFactory, "defaultTCCForType:", 1);
}

+ (id)defaultTCCForType:(int64_t)a3
{
  __objc2_class **v3;
  id v5;

  if (a3)
  {
    if (a3 != 1)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("unrecognized CNTCCType"), 0);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v5);
    }
    v3 = off_1E29B66B0;
  }
  else
  {
    v3 = off_1E29B66A8;
  }
  return objc_alloc_init(*v3);
}

+ (Class)defaultClass
{
  return +[CNTCCFactory defaultClassForType:](CNTCCFactory, "defaultClassForType:", 1);
}

+ (Class)defaultClassForType:(int64_t)a3
{
  id v4;

  if ((unint64_t)a3 > 1)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("unrecognized CNTCCType"), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

@end
