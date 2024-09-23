@implementation IMWallpaperMetadata

- (IMWallpaperMetadata)initWithFontName:(id)a3 fontSize:(double)a4 fontWeight:(double)a5 fontColor:(id)a6 isVertical:(BOOL)a7 type:(id)a8 backgroundColor:(id)a9
{
  _BOOL8 v11;
  id v16;
  id v17;
  id v18;
  id v19;
  IMWallpaperMetadata *v20;
  IMWallpaperMetadata_Impl *v21;
  IMWallpaperMetadata_Impl *swiftImpl;
  objc_super v24;

  v11 = a7;
  v16 = a3;
  v17 = a6;
  v18 = a8;
  v19 = a9;
  v24.receiver = self;
  v24.super_class = (Class)IMWallpaperMetadata;
  v20 = -[IMWallpaperMetadata init](&v24, sel_init);
  if (v20)
  {
    v21 = -[IMWallpaperMetadata_Impl initWithFontName:fontSize:fontWeight:fontColor:isVertical:type:backgroundColor:]([IMWallpaperMetadata_Impl alloc], "initWithFontName:fontSize:fontWeight:fontColor:isVertical:type:backgroundColor:", v16, v17, v11, v18, v19, a4, a5);
    swiftImpl = v20->swiftImpl;
    v20->swiftImpl = v21;

  }
  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  MEMORY[0x1E0DE7D20](self->swiftImpl, sel_encodeWithCoder_);
}

- (IMWallpaperMetadata)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  IMWallpaperMetadata *v5;
  IMWallpaperMetadata_Impl *v6;
  IMWallpaperMetadata_Impl *swiftImpl;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMWallpaperMetadata;
  v5 = -[IMWallpaperMetadata init](&v9, sel_init);
  if (v5)
  {
    v6 = -[IMWallpaperMetadata_Impl initWithDictionaryRepresentation:]([IMWallpaperMetadata_Impl alloc], "initWithDictionaryRepresentation:", v4);
    swiftImpl = v5->swiftImpl;
    v5->swiftImpl = v6;

  }
  return v5;
}

- (IMWallpaperMetadata)initWithCoder:(id)a3
{
  id v4;
  IMWallpaperMetadata *v5;
  IMWallpaperMetadata_Impl *v6;
  IMWallpaperMetadata_Impl *swiftImpl;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMWallpaperMetadata;
  v5 = -[IMWallpaperMetadata init](&v9, sel_init);
  if (v5)
  {
    v6 = -[IMWallpaperMetadata_Impl initWithCoder:]([IMWallpaperMetadata_Impl alloc], "initWithCoder:", v4);
    swiftImpl = v5->swiftImpl;
    v5->swiftImpl = v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)fontName
{
  return -[IMWallpaperMetadata_Impl fontName](self->swiftImpl, "fontName");
}

- (double)fontSize
{
  double result;

  -[IMWallpaperMetadata_Impl fontSize](self->swiftImpl, "fontSize");
  return result;
}

- (double)fontWeight
{
  double result;

  -[IMWallpaperMetadata_Impl fontWeight](self->swiftImpl, "fontWeight");
  return result;
}

- (NSDictionary)fontColor
{
  void *v2;
  void *v3;

  -[IMWallpaperMetadata_Impl fontColor](self->swiftImpl, "fontColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (BOOL)isVertical
{
  return -[IMWallpaperMetadata_Impl isVertical](self->swiftImpl, "isVertical");
}

- (NSString)type
{
  return -[IMWallpaperMetadata_Impl type](self->swiftImpl, "type");
}

- (NSDictionary)backgroundColor
{
  void *v2;
  void *v3;

  -[IMWallpaperMetadata_Impl backgroundColor](self->swiftImpl, "backgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (id)dictionaryRepresentation
{
  return -[IMWallpaperMetadata_Impl dictionaryRepresentation](self->swiftImpl, "dictionaryRepresentation");
}

+ (id)wallpaperExtensionIdentifierFromType:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return &stru_1E3FBBA48;
  else
    return off_1E3FB59D0[a3];
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  BOOL v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[IMWallpaperMetadata fontName](self, "fontName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fontName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);
    if ((v9 & 1) == 0)
    {
      -[IMWallpaperMetadata fontName](self, "fontName");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "fontName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3 != v10)
      {
        v11 = 0;
        goto LABEL_16;
      }
    }
    -[IMWallpaperMetadata fontSize](self, "fontSize");
    v13 = v12;
    objc_msgSend(v6, "fontSize");
    if (v13 == v14)
    {
      -[IMWallpaperMetadata fontWeight](self, "fontWeight");
      v16 = v15;
      objc_msgSend(v6, "fontWeight");
      if (v16 == v17)
      {
        v18 = -[IMWallpaperMetadata isVertical](self, "isVertical");
        if (v18 == objc_msgSend(v6, "isVertical"))
        {
          -[IMWallpaperMetadata type](self, "type");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "type");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "isEqualToString:", v20))
          {
            -[IMWallpaperMetadata backgroundColor](self, "backgroundColor");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "backgroundColor");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = v21;
            v33 = objc_msgSend(v21, "isEqualToDictionary:");
            if ((v33 & 1) == 0)
            {
              -[IMWallpaperMetadata backgroundColor](self, "backgroundColor");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "backgroundColor");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (v22 != v23)
              {
                v11 = 0;
LABEL_24:

LABEL_25:
LABEL_15:
                v10 = v3;
                if ((v9 & 1) != 0)
                {
LABEL_17:

                  goto LABEL_18;
                }
LABEL_16:

                goto LABEL_17;
              }
              v29 = v22;
            }
            v31 = v19;
            -[IMWallpaperMetadata fontColor](self, "fontColor", v29);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "fontColor");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v25;
            if ((objc_msgSend(v25, "isEqualToDictionary:", v26) & 1) != 0)
            {

              v11 = 1;
            }
            else
            {
              -[IMWallpaperMetadata fontColor](self, "fontColor");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "fontColor");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = v27 == v28;

            }
            v23 = v30;
            v19 = v31;
            v22 = v30;
            if ((v33 & 1) != 0)
              goto LABEL_25;
            goto LABEL_24;
          }

        }
      }
    }
    v11 = 0;
    goto LABEL_15;
  }
  v11 = 0;
LABEL_18:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->swiftImpl, 0);
}

@end
