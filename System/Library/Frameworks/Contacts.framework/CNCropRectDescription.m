@implementation CNCropRectDescription

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
  objc_msgSend(a3, "encodeRect:forKey:", CFSTR("_cropRect"), *((double *)a4 + 33), *((double *)a4 + 34), *((double *)a4 + 35), *((double *)a4 + 36));
}

- (id)CNValueForContact:(id)a3
{
  void *v3;

  v3 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(a3, "cropRect");
  return (id)objc_msgSend(v3, "valueWithRect:");
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  id v5;

  v5 = a4;
  objc_msgSend(a3, "rectValue");
  objc_msgSend(v5, "setCropRect:");

}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3)
    *a3 = *MEMORY[0x1E0CF5DC0];
  return a3 != 0;
}

- (CNCropRectDescription)init
{
  return -[CNPropertyDescription initWithKey:readSelector:writeSelector:](self, "initWithKey:readSelector:writeSelector:", CFSTR("cropRect"), sel_cropRect, sel_setCropRect_);
}

- (void)decodeUsingCoder:(id)a3 contact:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v9 = a4;
  objc_msgSend(a3, "decodeRectForKey:", CFSTR("_cropRect"));
  v9[33] = v5;
  v9[34] = v6;
  v9[35] = v7;
  v9[36] = v8;

}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  return CGRectEqualToRect(*(CGRect *)((char *)a3 + 264), *(CGRect *)((char *)a4 + 264));
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)nilValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", *MEMORY[0x1E0CB3438], *(double *)(MEMORY[0x1E0CB3438] + 8), *(double *)(MEMORY[0x1E0CB3438] + 16), *(double *)(MEMORY[0x1E0CB3438] + 24));
}

- (void)ABValueForABPerson:(void *)a3
{
  const void *v3;

  v3 = (const void *)ABPersonCopyImageDataAndCropRect();
  if (v3)
    CFRelease(v3);
  return (void *)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", (double)0, (double)0, (double)0, (double)0, 0, 0);
}

- (BOOL)setCNValue:(id)a3 onABPerson:(void *)a4 withDependentPropertiesContext:(id)a5 error:(id *)a6
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "rectValue");
  objc_msgSend(v8, "setPendingCropRect:");

  return 1;
}

- (BOOL)setABValue:(void *)a3 onABPerson:(void *)a4 error:(__CFError *)a5
{
  return 1;
}

@end
