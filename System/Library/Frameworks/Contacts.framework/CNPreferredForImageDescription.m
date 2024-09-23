@implementation CNPreferredForImageDescription

- (BOOL)abPropertyID:(int *)a3
{
  if (a3)
    *a3 = *MEMORY[0x1E0CF5DD0];
  return a3 != 0;
}

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
  objc_msgSend(a3, "encodeBool:forKey:", *((unsigned __int8 *)a4 + 337), CFSTR("_preferredForImage"));
}

- (id)CNValueForContact:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a3, "isPreferredForImage"));
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  id v5;

  v5 = a4;
  objc_msgSend(v5, "setPreferredForImage:", objc_msgSend(a3, "BOOLValue"));

}

- (CNPreferredForImageDescription)init
{
  return -[CNPropertyDescription initWithKey:readSelector:writeSelector:](self, "initWithKey:readSelector:writeSelector:", CFSTR("preferredForImage"), sel_isPreferredForImage, sel_setPreferredForImage_);
}

- (id)CNValueFromABBytes:(char *)a3 length:(unint64_t)a4
{
  return +[CNiOSABConversions numberFromIntegerABBytes:length:](CNiOSABConversions, "numberFromIntegerABBytes:length:", a3, a4);
}

- (void)decodeUsingCoder:(id)a3 contact:(id)a4
{
  _BYTE *v5;

  v5 = a4;
  v5[337] = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("_preferredForImage"));

}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  return (*((_BYTE *)a3 + 337) == 0) ^ (*((_BYTE *)a4 + 337) != 0);
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)nilValue
{
  return (id)MEMORY[0x1E0C9AAA0];
}

- (BOOL)setABValue:(void *)a3 onABPerson:(void *)a4 error:(__CFError *)a5
{
  return 1;
}

- (void)ABValueForABPerson:(void *)a3
{
  void *v4;
  const __CFArray *v5;
  const void *v6;
  const void *v7;

  v4 = (void *)*MEMORY[0x1E0C9AE40];
  v5 = ABPersonCopyArrayOfAllLinkedPeople(a3);
  if (CFArrayGetCount(v5) >= 2)
  {
    CFArrayGetValueAtIndex(v5, 0);
    CFArrayGetValueAtIndex(v5, 1);
    v6 = (const void *)ABPersonCopyPreferredLinkedPersonForImage();
    v7 = (const void *)ABPersonCopyPreferredLinkedPersonForImage();
    if (CFEqual(v6, v7) && CFEqual(v6, a3))
      v4 = (void *)*MEMORY[0x1E0C9AE50];
    if (v6)
      CFRelease(v6);
    if (v7)
      CFRelease(v7);
  }
  if (v5)
    CFRelease(v5);
  return v4;
}

@end
