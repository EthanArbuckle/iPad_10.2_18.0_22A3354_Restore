@implementation CNWallpaperSyncFailedTimeDescription

- (CNWallpaperSyncFailedTimeDescription)init
{
  return -[CNPropertyDescription initWithKey:readSelector:writeSelector:](self, "initWithKey:readSelector:writeSelector:", CFSTR("wallpaperSyncFailedTime"), sel_wallpaperSyncFailedTime, sel_setWallpaperSyncFailedTime_);
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  return 1;
}

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
  objc_msgSend(a3, "encodeObject:forKey:", *((_QWORD *)a4 + 88), CFSTR("_wallpaperSyncFailedTime"));
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
  objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_wallpaperSyncFailedTime"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v9, "copy");
  v8 = (void *)v5[88];
  v5[88] = v7;

}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)CNValueForContact:(id)a3
{
  return (id)objc_msgSend(a3, "wallpaperSyncFailedTime");
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  objc_msgSend(a4, "_setWallpaperSyncFailedTime:", a3);
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3)
    *a3 = *MEMORY[0x1E0CF62A0];
  return a3 != 0;
}

@end
