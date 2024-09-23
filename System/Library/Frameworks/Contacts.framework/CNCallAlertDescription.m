@implementation CNCallAlertDescription

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
  objc_msgSend(a3, "encodeObject:forKey:", *((_QWORD *)a4 + 63), CFSTR("_callAlert"));
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  objc_msgSend(a4, "_setCallAlert:", a3);
}

- (id)CNValueForContact:(id)a3
{
  return (id)objc_msgSend(a3, "callAlert");
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3)
    *a3 = *MEMORY[0x1E0CF6270];
  return a3 != 0;
}

- (CNCallAlertDescription)init
{
  return -[CNPropertyDescription initWithKey:readSelector:writeSelector:](self, "initWithKey:readSelector:writeSelector:", CFSTR("callAlert"), sel_callAlert, sel_setCallAlert_);
}

- (void)decodeUsingCoder:(id)a3 contact:(id)a4
{
  _QWORD *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_callAlert"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v9, "copy");
  v8 = (void *)v5[63];
  v5[63] = v7;

}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  void *v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "callAlert");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "callAlert");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(v6, "callAlert");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "callAlert");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (!v8)
    goto LABEL_6;
LABEL_7:

  return v11;
}

- (BOOL)applyABMultivalueValueBytes:(char *)a3 length:(unint64_t)a4 identifier:(id)a5 legacyIdentifier:(int)a6 label:(id)a7 toCNMultivalueRepresentation:(id)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  BOOL v17;

  v13 = a5;
  v14 = a7;
  v15 = a8;
  switch(a6)
  {
    case -1:
      +[CNiOSABConversions stringFromABBytes:length:](CNiOSABConversions, "stringFromABBytes:length:", a3, a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setSound:", v16);
      break;
    case -4:
      +[CNiOSABConversions stringFromABBytes:length:](CNiOSABConversions, "stringFromABBytes:length:", a3, a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setIgnoreMute:", objc_msgSend(v16, "isEqualToString:", CFSTR("YES")));
      break;
    case -101:
      +[CNiOSABConversions stringFromABBytes:length:](CNiOSABConversions, "stringFromABBytes:length:", a3, a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setVibration:", v16);
      break;
    default:
      v17 = 0;
      goto LABEL_9;
  }

  v17 = 1;
LABEL_9:

  return v17;
}

- (BOOL)setABValue:(void *)a3 onABPerson:(void *)a4 error:(__CFError *)a5
{
  CFDictionaryGetValue((CFDictionaryRef)a3, CFSTR("tone"));
  CFDictionaryGetValue((CFDictionaryRef)a3, CFSTR("vibration"));
  CFDictionaryGetValue((CFDictionaryRef)a3, CFSTR("ignoreMute"));
  ABPersonSetSoundIdentifierForMultiValueIdentifier();
  ABPersonSetSoundIdentifierForMultiValueIdentifier();
  ABPersonSetSoundIdentifierForMultiValueIdentifier();
  return 1;
}

- (void)ABValueForABPerson:(void *)a3
{
  const void *v4;
  const __CFString *v5;
  const void *v6;
  const __CFString *v7;
  const void *v8;
  const __CFString *v9;
  __CFDictionary *Mutable;

  v4 = (const void *)MEMORY[0x194005BF8](a3, 0xFFFFFFFFLL);
  if (v4)
    v5 = (const __CFString *)CFAutorelease(v4);
  else
    v5 = 0;
  v6 = (const void *)MEMORY[0x194005BF8](a3, 4294967195);
  if (v6)
    v7 = (const __CFString *)CFAutorelease(v6);
  else
    v7 = 0;
  v8 = (const void *)MEMORY[0x194005BF8](a3, 4294967292);
  if (v8)
    v9 = (const __CFString *)CFAutorelease(v8);
  else
    v9 = 0;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 2, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (v5 && CFStringGetLength(v5) >= 1)
    CFDictionarySetValue(Mutable, CFSTR("tone"), v5);
  if (v7 && CFStringGetLength(v7) >= 1)
    CFDictionarySetValue(Mutable, CFSTR("vibration"), v7);
  if (v9 && CFStringGetLength(v9) >= 1)
    CFDictionarySetValue(Mutable, CFSTR("ignoreMute"), v9);
  if (Mutable)
    return (void *)CFAutorelease(Mutable);
  else
    return 0;
}

@end
