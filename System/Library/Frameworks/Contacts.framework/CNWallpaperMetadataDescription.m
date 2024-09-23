@implementation CNWallpaperMetadataDescription

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
  objc_msgSend(a3, "encodeObject:forKey:", *((_QWORD *)a4 + 82), CFSTR("_wallpaperMetadata"));
}

- (id)CNValueForContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isKeyAvailable:", CFSTR("wallpaper")) & 1) != 0)
  {
    objc_msgSend(v3, "wallpaper");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v4;
  }
  else
  {
    objc_msgSend(v3, "wallpaperMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3)
    *a3 = *MEMORY[0x1E0CF6290];
  return a3 != 0;
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  CNWallpaper *v9;
  void *v10;
  void *v11;
  void *v12;
  CNWallpaper *v13;
  id v14;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  v14 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v14;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v6, "_setWallpaperMetadata:", v14);
  if (v8)
  {
    v9 = [CNWallpaper alloc];
    objc_msgSend(v6, "wallpaper");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "posterArchiveData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "wallpaper");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[CNWallpaper initWithPosterArchiveData:metadata:contentIsSensitive:](v9, "initWithPosterArchiveData:metadata:contentIsSensitive:", v11, v8, objc_msgSend(v12, "contentIsSensitive"));

    objc_msgSend(v6, "_setWallpaper:", v13);
  }

}

- (CNWallpaperMetadataDescription)init
{
  return -[CNPropertyDescription initWithKey:readSelector:writeSelector:](self, "initWithKey:readSelector:writeSelector:", CFSTR("wallpaperMetadata"), sel_wallpaperMetadata, sel_setWallpaperMetadata_);
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
  objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_wallpaperMetadata"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v9, "copy");
  v8 = (void *)v5[82];
  v5[82] = v7;

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
  objc_msgSend(v6, "wallpaperMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "wallpaperMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(v6, "wallpaperMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "wallpaperMetadata");
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
  CNWallpaperMetadata *v5;

  +[CNiOSABConversions dataFromABBytes:length:](CNiOSABConversions, "dataFromABBytes:length:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNWallpaperMetadata initWithDataRepresentation:]([CNWallpaperMetadata alloc], "initWithDataRepresentation:", v4);

  return v5;
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

  objc_msgSend(v6, "dataRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)CNValueFromABValue:(void *)a3
{
  CNWallpaperMetadata *v3;
  CFTypeID v4;
  CNWallpaperMetadata *v5;

  v3 = (CNWallpaperMetadata *)a3;
  if (a3)
  {
    v4 = CFGetTypeID(a3);
    if (v4 == CFDataGetTypeID())
    {
      v5 = v3;
      v3 = -[CNWallpaperMetadata initWithDataRepresentation:]([CNWallpaperMetadata alloc], "initWithDataRepresentation:", v5);

    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

@end
