@implementation NSObject(_CAObjectInternal)

+ (BOOL)CA_encodesPropertyConditionally:()_CAObjectInternal type:
{
  return a4 == 1 || a4 == 4;
}

- (uint64_t)CA_validateValue:()_CAObjectInternal forKey:
{
  objc_class *v6;
  uint64_t *v7;
  unsigned int *v8;
  unsigned int *v9;
  const char *v10;
  __CFString *v11;
  CFTypeID v12;
  CFTypeID TypeID;
  char isKindOfClass;

  if (a3)
  {
    if (!CAInternAtom(a4, 0))
      goto LABEL_18;
    v6 = (objc_class *)objc_opt_class();
    v7 = (uint64_t *)classDescription(v6);
    v8 = propertyInfoForKey(v7, a4, 0);
    if (!v8)
      goto LABEL_18;
    v9 = v8;
    if (*((unsigned __int16 *)v8 + 2) - 1 <= 4)
    {
      v10 = (const char *)*((_QWORD *)v8 + 3);
      if (!v10)
      {
LABEL_18:
        isKindOfClass = 1;
        return isKindOfClass & 1;
      }
      v11 = (__CFString *)*((_QWORD *)v8 + 4);
      if (!v11)
      {
        v11 = (__CFString *)CFStringCreateWithCString(0, v10, 0x8000100u);
        *((_QWORD *)v9 + 4) = v11;
      }
      if (NSClassFromString(&v11->isa))
      {
LABEL_21:
        isKindOfClass = objc_opt_isKindOfClass();
        return isKindOfClass & 1;
      }
      if (objc_msgSend(*((id *)v9 + 4), "isEqualToString:", CFSTR("CGColor")))
      {
        v12 = CFGetTypeID(a3);
        TypeID = CGColorGetTypeID();
LABEL_16:
        isKindOfClass = v12 == TypeID;
        return isKindOfClass & 1;
      }
      if (objc_msgSend(*((id *)v9 + 4), "isEqualToString:", CFSTR("CGPath")))
      {
        v12 = CFGetTypeID(a3);
        TypeID = CGPathGetTypeID();
        goto LABEL_16;
      }
      if (objc_msgSend(*((id *)v9 + 4), "isEqualToString:", CFSTR("CGColorSpace")))
      {
        v12 = CFGetTypeID(a3);
        TypeID = CGColorSpaceGetTypeID();
        goto LABEL_16;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_18;
    objc_opt_class();
    goto LABEL_21;
  }
  isKindOfClass = 1;
  return isKindOfClass & 1;
}

+ (uint64_t)CA_setterForProperty:()_CAObjectInternal
{
  return 0;
}

+ (uint64_t)CA_getterForProperty:()_CAObjectInternal
{
  return 0;
}

+ (uint64_t)CA_automaticallyNotifiesObservers:()_CAObjectInternal
{
  return 1;
}

+ (uint64_t)CA_CAMLPropertyForKey:()_CAObjectInternal
{
  return a3;
}

@end
