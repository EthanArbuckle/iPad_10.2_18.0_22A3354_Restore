@implementation CNImageBackgroundColorsDataDescription

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
  objc_msgSend(a3, "encodeObject:forKey:", *((_QWORD *)a4 + 85), CFSTR("_imageBackgroundColorsData"));
}

- (id)CNValueFromABBytes:(char *)a3 length:(unint64_t)a4
{
  return +[CNiOSABConversions dataFromABBytes:length:](CNiOSABConversions, "dataFromABBytes:length:", a3, a4);
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  objc_msgSend(a4, "_setImageBackgroundColorsData:", a3);
}

- (id)CNValueForContact:(id)a3
{
  return (id)objc_msgSend(a3, "imageBackgroundColorsData");
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3)
    *a3 = *MEMORY[0x1E0CF5FF8];
  return a3 != 0;
}

- (CNImageBackgroundColorsDataDescription)init
{
  return -[CNPropertyDescription initWithKey:readSelector:writeSelector:](self, "initWithKey:readSelector:writeSelector:", CFSTR("imageBackgroundColorsData"), sel_imageBackgroundColorsData, sel_setImageBackgroundColorsData_);
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
  objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_imageBackgroundColorsData"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v9, "copy");
  v8 = (void *)v5[85];
  v5[85] = v7;

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
  objc_msgSend(v6, "imageBackgroundColorsData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "imageBackgroundColorsData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(v6, "imageBackgroundColorsData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageBackgroundColorsData");
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

@end
