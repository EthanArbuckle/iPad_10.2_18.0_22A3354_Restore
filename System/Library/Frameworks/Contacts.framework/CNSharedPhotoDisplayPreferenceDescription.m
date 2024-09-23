@implementation CNSharedPhotoDisplayPreferenceDescription

- (BOOL)abPropertyID:(int *)a3
{
  if (a3)
    *a3 = *MEMORY[0x1E0CF5F70];
  return a3 != 0;
}

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
  objc_msgSend(a3, "encodeInteger:forKey:", *((_QWORD *)a4 + 46), CFSTR("_sharedPhotoDisplayPreference"));
}

- (id)CNValueForContact:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a3, "sharedPhotoDisplayPreference"));
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  id v5;

  v5 = a4;
  objc_msgSend(v5, "setSharedPhotoDisplayPreference:", objc_msgSend(a3, "integerValue"));

}

- (CNSharedPhotoDisplayPreferenceDescription)init
{
  return -[CNPropertyDescription initWithKey:readSelector:writeSelector:](self, "initWithKey:readSelector:writeSelector:", CFSTR("sharedPhotoDisplayPreference"), sel_sharedPhotoDisplayPreference, sel_setSharedPhotoDisplayPreference_);
}

- (void)decodeUsingCoder:(id)a3 contact:(id)a4
{
  _QWORD *v5;

  v5 = a4;
  v5[46] = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_sharedPhotoDisplayPreference"));

}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  return *((_QWORD *)a3 + 46) == *((_QWORD *)a4 + 46);
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)nilValue
{
  return &unk_1E2A3FF78;
}

- (BOOL)isValidValue:(id)a3 error:(id *)a4
{
  id v6;
  int64x2_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNSharedPhotoDisplayPreferenceDescription;
  if (!-[CNPropertyDescription isValidValue:error:](&v13, sel_isValidValue_error_, v6, a4))
  {
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v7 = vdupq_n_s64(objc_msgSend(v6, "integerValue"));
  v8 = 1;
  if ((vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v7, (int64x2_t)xmmword_18FA40A00), (int32x4_t)vceqq_s64(v7, (int64x2_t)xmmword_18FA40A10)))) & 1) == 0&& v6)
  {
    if (a4)
    {
      v15 = CFSTR("CNKeyPaths");
      -[CNPropertyDescription key](self, "key");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 302, v11);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_6;
  }
LABEL_7:

  return v8;
}

- (id)CNValueFromABBytes:(char *)a3 length:(unint64_t)a4
{
  return -[CNSharedPhotoDisplayPreferenceDescription CNValueFromABValue:](self, "CNValueFromABValue:", +[CNiOSABConversions numberFromIntegerABBytes:length:](CNiOSABConversions, "numberFromIntegerABBytes:length:", a3, a4));
}

- (BOOL)setCNValue:(id)a3 onABPerson:(void *)a4 withDependentPropertiesContext:(id)a5 error:(id *)a6
{
  ABPropertyID v9;
  id v10;
  const __CFNumber *v11;
  void *v12;
  int64_t v13;
  CFNumberRef v14;
  BOOL v15;
  BOOL v16;
  CFTypeRef cf;
  int64_t v19;
  uint64_t valuePtr;

  v9 = *MEMORY[0x1E0CF5F70];
  v10 = a3;
  v11 = (const __CFNumber *)ABRecordCopyValue(a4, v9);
  valuePtr = 0;
  CFNumberGetValue(v11, kCFNumberNSIntegerType, &valuePtr);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", valuePtr);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CNSharedPhotoDisplayPreferenceDescription flagsWithFlags:displayPreference:](self, "flagsWithFlags:displayPreference:", v12, v10);

  v19 = v13;
  v14 = CFNumberCreate(0, kCFNumberNSIntegerType, &v19);
  if (v11)
    CFAutorelease(v11);
  cf = 0;
  v15 = -[CNPropertyDescription setABValue:onABPerson:error:](self, "setABValue:onABPerson:error:", v14, a4, &cf);
  v16 = v15;
  if (a6)
  {
    if (!v15)
    {
      +[CNErrorFactory errorForiOSABError:](CNErrorFactory, "errorForiOSABError:", cf);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      if (cf)
        CFRelease(cf);
    }
  }
  if (v14)
    CFAutorelease(v14);
  return v16;
}

- (id)CNValueFromABValue:(void *)a3
{
  CFTypeID v5;
  void *v6;
  void *v7;
  uint64_t valuePtr;

  if (!a3)
    return 0;
  v5 = CFGetTypeID(a3);
  if (v5 != CFNumberGetTypeID())
    return 0;
  valuePtr = 0;
  CFNumberGetValue((CFNumberRef)a3, kCFNumberNSIntegerType, &valuePtr);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", valuePtr);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSharedPhotoDisplayPreferenceDescription sharedPhotoDisplayPreferenceFromFlags:](self, "sharedPhotoDisplayPreferenceFromFlags:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)sharedPhotoDisplayPreferenceFromFlags:(id)a3
{
  unsigned __int8 v3;

  v3 = objc_msgSend(a3, "integerValue");
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3 >> 6);
}

- (int64_t)flagsWithFlags:(id)a3 displayPreference:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = a3;
  v6 = objc_msgSend(a4, "integerValue");
  v7 = objc_msgSend(v5, "integerValue");

  if ((unint64_t)(v6 - 1) >= 3)
    v8 = 0;
  else
    v8 = ((v6 - 1) << 6) + 64;
  return v8 | v7 & 0xFFFFFFFFFFFFFF3FLL;
}

@end
