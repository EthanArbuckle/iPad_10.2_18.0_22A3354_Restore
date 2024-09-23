@implementation CNWallpaperDescription

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
  objc_msgSend(a3, "encodeObject:forKey:", *((_QWORD *)a4 + 81), CFSTR("_wallpaper"));
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  objc_msgSend(a4, "_setWallpaper:", a3);
}

- (id)CNValueForContact:(id)a3
{
  return (id)objc_msgSend(a3, "wallpaper");
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3)
    *a3 = *MEMORY[0x1E0CF6298];
  return a3 != 0;
}

- (CNWallpaperDescription)init
{
  return -[CNPropertyDescription initWithKey:readSelector:writeSelector:](self, "initWithKey:readSelector:writeSelector:", CFSTR("wallpaper"), sel_wallpaper, sel_setWallpaper_);
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
  objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_wallpaper"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v9, "copy");
  v8 = (void *)v5[81];
  v5[81] = v7;

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
  objc_msgSend(v6, "wallpaper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "wallpaper");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(v6, "wallpaper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "wallpaper");
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

- (id)CNValueFromABBytes:(char *)a3 length:(unint64_t)a4
{
  void *v4;
  CNWallpaper *v5;

  +[CNiOSABConversions dataFromABBytes:length:](CNiOSABConversions, "dataFromABBytes:length:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNWallpaper initWithDataRepresentationForPersistence:]([CNWallpaper alloc], "initWithDataRepresentationForPersistence:", v4);

  return v5;
}

+ (id)os_log
{
  if (os_log_cn_once_token_6 != -1)
    dispatch_once(&os_log_cn_once_token_6, &__block_literal_global_111_0);
  return (id)os_log_cn_once_object_6;
}

void __39__CNWallpaperDescription_iOSAB__os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "CNContactPropertyDescriptions+iOSAB");
  v1 = (void *)os_log_cn_once_object_6;
  os_log_cn_once_object_6 = (uint64_t)v0;

}

- (void)ABValueFromCNValue:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "dataRepresentationForPersistence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)CNValueFromABValue:(void *)a3
{
  CNWallpaper *v3;
  CFTypeID v4;
  CNWallpaper *v5;

  v3 = (CNWallpaper *)a3;
  if (a3)
  {
    v4 = CFGetTypeID(a3);
    if (v4 == CFDataGetTypeID())
    {
      v5 = v3;
      v3 = -[CNWallpaper initWithDataRepresentationForPersistence:]([CNWallpaper alloc], "initWithDataRepresentationForPersistence:", v5);

    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

@end
