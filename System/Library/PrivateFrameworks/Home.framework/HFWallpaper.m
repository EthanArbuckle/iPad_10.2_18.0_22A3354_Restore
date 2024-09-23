@implementation HFWallpaper

- (int64_t)type
{
  return self->_type;
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (id)sliceIdentifierForVariant:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  -[HFWallpaper wallpaperIdentifier](self, "wallpaperIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@_%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)wallpaperIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CGPoint v14;

  -[HFWallpaper cropInfo](self, "cropInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[HFWallpaper assetIdentifier](self, "assetIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFWallpaper cropInfo](self, "cropInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "center");
    NSStringFromCGPoint(v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[HFWallpaper cropInfo](self, "cropInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scale");
    objc_msgSend(v8, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@_%@_%@"), v5, v7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HFWallpaper assetIdentifier](self, "assetIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v12;
}

- (HFCroppedWallpaperInfo)cropInfo
{
  return self->_cropInfo;
}

- (HFWallpaper)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HFCroppedWallpaperInfo *v12;
  HFWallpaper *v13;
  void *v14;
  HFWallpaper *v15;
  HFWallpaper *lastUserSelectedWallpaper;
  CGSize v18;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    NSLog(CFSTR("Wallpaper type missing or not of type NSNumber: %@"), v5);
    goto LABEL_10;
  }
  v6 = objc_msgSend(v5, "integerValue");
  if (v6 > 6)
  {
LABEL_10:
    v13 = 0;
    goto LABEL_19;
  }
  v7 = v6;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AllCropInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      NSLog(CFSTR("Wallpaper crop information not of type NSDictionary: %@"), v9);
      v12 = 0;
    }
    else
    {
      +[HFWallpaper size](HFWallpaper, "size");
      NSStringFromCGSize(v18);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        v12 = -[HFCroppedWallpaperInfo initWithDictionary:]([HFCroppedWallpaperInfo alloc], "initWithDictionary:", v11);
      else
        v12 = 0;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LastUserSelectedWallpaper"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = -[HFWallpaper initWithDictionary:]([HFWallpaper alloc], "initWithDictionary:", v14);
      lastUserSelectedWallpaper = self->_lastUserSelectedWallpaper;
      self->_lastUserSelectedWallpaper = v15;

    }
    self = -[HFWallpaper initWithType:assetIdentifier:cropInfo:](self, "initWithType:assetIdentifier:cropInfo:", v7, v8, v12);

    v13 = self;
  }
  else
  {
    NSLog(CFSTR("Wallpaper identifier missing or not of type NSString: %@"), v8);
    v13 = 0;
  }

LABEL_19:
  return v13;
}

- (HFWallpaper)initWithType:(int64_t)a3 assetIdentifier:(id)a4 cropInfo:(id)a5
{
  id v8;
  id v9;
  HFWallpaper *v10;
  HFWallpaper *v11;
  uint64_t v12;
  HFCroppedWallpaperInfo *cropInfo;
  uint64_t v14;
  NSString *assetIdentifier;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HFWallpaper;
  v10 = -[HFWallpaper init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    v12 = objc_msgSend(v9, "copy");
    cropInfo = v11->_cropInfo;
    v11->_cropInfo = (HFCroppedWallpaperInfo *)v12;

    if (qword_1ED379A68 != -1)
      dispatch_once(&qword_1ED379A68, &__block_literal_global_182);
    objc_msgSend(v8, "stringByAddingPercentEncodingWithAllowedCharacters:", _MergedGlobals_295);
    v14 = objc_claimAutoreleasedReturnValue();
    assetIdentifier = v11->_assetIdentifier;
    v11->_assetIdentifier = (NSString *)v14;

  }
  return v11;
}

+ (CGSize)size
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

void __53__HFWallpaper_initWithType_assetIdentifier_cropInfo___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("|/\\<>*?\"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invertedSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_295;
  _MergedGlobals_295 = v0;

}

+ (CGSize)contentSizeForWallpaper
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  BOOL v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "userInterfaceIdiom") == 1)
  {
    v8 = +[HFUtilities isAMac](HFUtilities, "isAMac");

    if (v4 >= v6)
      v9 = v4;
    else
      v9 = v6;
    if (!v8)
    {
      v4 = v9;
      v6 = v9;
    }
  }
  else
  {

  }
  v10 = v4;
  v11 = v6;
  result.height = v11;
  result.width = v10;
  return result;
}

+ (id)customWallpaperWithAssetIdentifier:(id)a3
{
  id v3;
  HFWallpaper *v4;

  v3 = a3;
  v4 = -[HFWallpaper initWithType:assetIdentifier:cropInfo:]([HFWallpaper alloc], "initWithType:assetIdentifier:cropInfo:", 1, v3, 0);

  return v4;
}

- (id)description
{
  unint64_t v3;
  __CFString *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = -[HFWallpaper type](self, "type");
  if (v3 > 6)
    v4 = 0;
  else
    v4 = off_1EA73B578[v3];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFWallpaper assetIdentifier](self, "assetIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFWallpaper cropInfo](self, "cropInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p, type = %@, assetIdentifier = %@, crop info = [ %@ ]>"), v7, self, v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  HFWallpaper *v4;
  int64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (HFWallpaper *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v5 = -[HFWallpaper type](self, "type"), v5 == -[HFWallpaper type](v4, "type")))
    {
      -[HFWallpaper wallpaperIdentifier](self, "wallpaperIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFWallpaper wallpaperIdentifier](v4, "wallpaperIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HFWallpaper *v4;
  int64_t v5;
  void *v6;
  void *v7;
  HFWallpaper *v8;

  v4 = [HFWallpaper alloc];
  v5 = -[HFWallpaper type](self, "type");
  -[HFWallpaper assetIdentifier](self, "assetIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFWallpaper cropInfo](self, "cropInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HFWallpaper initWithType:assetIdentifier:cropInfo:](v4, "initWithType:assetIdentifier:cropInfo:", v5, v6, v7);

  return v8;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[3];
  CGSize v21;

  v20[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E08];
  v19[0] = CFSTR("Type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HFWallpaper type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = CFSTR("Identifier");
  v20[0] = v4;
  -[HFWallpaper assetIdentifier](self, "assetIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFWallpaper cropInfo](self, "cropInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[HFWallpaper size](HFWallpaper, "size");
    NSStringFromCGSize(v21);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v9;
    -[HFWallpaper cropInfo](self, "cropInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("AllCropInfo"));

  }
  -[HFWallpaper lastUserSelectedWallpaper](self, "lastUserSelectedWallpaper");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HFWallpaper lastUserSelectedWallpaper](self, "lastUserSelectedWallpaper");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, CFSTR("LastUserSelectedWallpaper"));

  }
  return v7;
}

- (BOOL)isCustomType
{
  int64_t v3;

  v3 = -[HFWallpaper type](self, "type");
  if (v3 != 1)
    LOBYTE(v3) = -[HFWallpaper type](self, "type") == 6;
  return v3;
}

- (void)setIsCustomType:(BOOL)a3
{
  self->_isCustomType = a3;
}

- (void)setCropInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (HFWallpaper)lastUserSelectedWallpaper
{
  return self->_lastUserSelectedWallpaper;
}

- (void)setLastUserSelectedWallpaper:(id)a3
{
  objc_storeStrong((id *)&self->_lastUserSelectedWallpaper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUserSelectedWallpaper, 0);
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
  objc_storeStrong((id *)&self->_cropInfo, 0);
}

@end
