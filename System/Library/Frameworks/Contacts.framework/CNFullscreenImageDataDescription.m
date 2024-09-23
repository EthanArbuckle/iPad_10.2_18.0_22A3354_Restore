@implementation CNFullscreenImageDataDescription

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
  objc_msgSend(a3, "encodeObject:forKey:", *((_QWORD *)a4 + 38), CFSTR("_fullscreenImageData"));
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  objc_msgSend(a4, "_setFullscreenImageData:", a3);
}

- (id)CNValueForContact:(id)a3
{
  return (id)objc_msgSend(a3, "fullscreenImageData");
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3)
    *a3 = *MEMORY[0x1E0CF5DB0];
  return a3 != 0;
}

- (CNFullscreenImageDataDescription)init
{
  return -[CNPropertyDescription initWithKey:readSelector:writeSelector:](self, "initWithKey:readSelector:writeSelector:", CFSTR("fullscreenImageData"), sel_fullscreenImageData, sel__setFullscreenImageData_);
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
  objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_fullscreenImageData"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v9, "copy");
  v8 = (void *)v5[38];
  v5[38] = v7;

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
  objc_msgSend(v6, "fullscreenImageData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "fullscreenImageData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(v6, "fullscreenImageData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fullscreenImageData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (!v8)
    goto LABEL_6;
LABEL_7:

  return v11;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (void)ABValueForABPerson:(void *)a3
{
  void *result;

  result = ABPersonCopyImageDataWithFormat(a3, (ABPersonImageFormat)4u);
  if (result)
    return (void *)CFAutorelease(result);
  return result;
}

- (BOOL)setCNValue:(id)a3 onABPerson:(void *)a4 withDependentPropertiesContext:(id)a5 error:(id *)a6
{
  objc_msgSend(a5, "setPendingFullscreenImageData:", a3, a4);
  return 1;
}

- (BOOL)setABValue:(void *)a3 onABPerson:(void *)a4 error:(__CFError *)a5
{
  return 1;
}

@end
