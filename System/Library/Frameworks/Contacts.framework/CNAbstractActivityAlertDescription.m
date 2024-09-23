@implementation CNAbstractActivityAlertDescription

- (BOOL)canUnifyValue:(id)a3 withValue:(id)a4
{
  id v5;
  id v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  const __CFString *v15;
  uint64_t v16;
  char v17;
  char v18;
  char v19;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "sound");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sound");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v9 = v7;
  else
    v9 = &stru_1E29FF900;
  if (v8)
    v10 = v8;
  else
    v10 = &stru_1E29FF900;
  v11 = -[__CFString localizedCaseInsensitiveCompare:](v9, "localizedCaseInsensitiveCompare:", v10);

  objc_msgSend(v6, "vibration");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vibration");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v14 = v12;
  else
    v14 = &stru_1E29FF900;
  if (v13)
    v15 = v13;
  else
    v15 = &stru_1E29FF900;
  v16 = -[__CFString localizedCaseInsensitiveCompare:](v14, "localizedCaseInsensitiveCompare:", v15);

  v17 = objc_msgSend(v6, "ignoreMute");
  v18 = objc_msgSend(v5, "ignoreMute");

  v19 = v17 ^ v18 ^ 1;
  if (v16)
    v19 = 0;
  if (v11)
    return 0;
  else
    return v19;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)CNMutableValueForABMultivalue
{
  return (id)objc_opt_new();
}

- (id)CNValueFromABValue:(void *)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  CNActivityAlert *v8;

  CFDictionaryGetValue((CFDictionaryRef)a3, CFSTR("tone"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CFDictionaryGetValue((CFDictionaryRef)a3, CFSTR("vibration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CFDictionaryGetValue((CFDictionaryRef)a3, CFSTR("ignoreMute"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D13848];
  if ((*(unsigned int (**)(_QWORD, void *))(*MEMORY[0x1E0D13848] + 16))(*MEMORY[0x1E0D13848], v4)
    && (*(unsigned int (**)(uint64_t, void *))(v7 + 16))(v7, v5)
    && ((*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v6) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v8 = -[CNActivityAlert initWithSound:vibration:ignoreMute:]([CNActivityAlert alloc], "initWithSound:vibration:ignoreMute:", v4, v5, objc_msgSend(v6, "isEqualToString:", CFSTR("YES")));
  }

  return v8;
}

- (void)ABValueFromCNValue:(id)a3
{
  id v3;
  __CFDictionary *Mutable;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v3 = a3;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 2, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  objc_msgSend(v3, "sound");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
    CFDictionarySetValue(Mutable, CFSTR("tone"), (const void *)objc_msgSend(v3, "sound"));
  objc_msgSend(v3, "vibration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
    CFDictionarySetValue(Mutable, CFSTR("vibration"), (const void *)objc_msgSend(v3, "vibration"));
  if (objc_msgSend(v3, "ignoreMute"))
    CFDictionarySetValue(Mutable, CFSTR("ignoreMute"), CFSTR("YES"));
  if (Mutable)
    Mutable = (__CFDictionary *)CFAutorelease(Mutable);

  return Mutable;
}

@end
