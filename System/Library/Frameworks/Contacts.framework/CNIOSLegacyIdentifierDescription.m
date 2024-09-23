@implementation CNIOSLegacyIdentifierDescription

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
  objc_msgSend(a3, "encodeInt32:forKey:", *((unsigned int *)a4 + 4), CFSTR("_iOSLegacyIdentifier"));
}

- (id)CNValueForContact:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a3, "iOSLegacyIdentifier"));
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  id v5;

  v5 = a4;
  objc_msgSend(v5, "setIOSLegacyIdentifier:", objc_msgSend(a3, "intValue"));

}

- (void)ABValueForABPerson:(void *)a3
{
  void *result;
  ABRecordID valuePtr;

  valuePtr = ABRecordGetRecordID(a3);
  result = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, &valuePtr);
  if (result)
    return (void *)CFAutorelease(result);
  return result;
}

- (CNIOSLegacyIdentifierDescription)init
{
  return -[CNPropertyDescription initWithKey:readSelector:writeSelector:](self, "initWithKey:readSelector:writeSelector:", CFSTR("iOSLegacyIdentifier"), sel_iOSLegacyIdentifier, sel_setIOSLegacyIdentifier_);
}

- (void)decodeUsingCoder:(id)a3 contact:(id)a4
{
  _DWORD *v5;

  v5 = a4;
  v5[4] = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("_iOSLegacyIdentifier"));

}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  return *((_DWORD *)a3 + 4) == *((_DWORD *)a4 + 4);
}

- (BOOL)isEqualIgnoringIdentifiersForContact:(id)a3 other:(id)a4
{
  return 1;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (void)resetGuardianManagedValueOnContact:(id)a3
{
  objc_msgSend(a3, "setIOSLegacyIdentifier:", 0xFFFFFFFFLL);
}

- (id)nilValue
{
  return &unk_1E2A400B0;
}

- (BOOL)setABValue:(void *)a3 onABPerson:(void *)a4 error:(__CFError *)a5
{
  return 1;
}

@end
