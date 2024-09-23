@implementation IMWallpaperMetadataColor

- (IMWallpaperMetadataColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  IMWallpaperMetadataColor *v10;
  IMWallpaperMetadataColor_Impl *v11;
  IMWallpaperMetadataColor_Impl *swiftImpl;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)IMWallpaperMetadataColor;
  v10 = -[IMWallpaperMetadataColor init](&v14, sel_init);
  if (v10)
  {
    v11 = -[IMWallpaperMetadataColor_Impl initWithRed:green:blue:alpha:]([IMWallpaperMetadataColor_Impl alloc], "initWithRed:green:blue:alpha:", a3, a4, a5, a6);
    swiftImpl = v10->swiftImpl;
    v10->swiftImpl = v11;

  }
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  MEMORY[0x1E0DE7D20](self->swiftImpl, sel_encodeWithCoder_);
}

- (IMWallpaperMetadataColor)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  IMWallpaperMetadataColor *v5;
  IMWallpaperMetadataColor_Impl *v6;
  IMWallpaperMetadataColor_Impl *swiftImpl;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMWallpaperMetadataColor;
  v5 = -[IMWallpaperMetadataColor init](&v9, sel_init);
  if (v5)
  {
    v6 = -[IMWallpaperMetadataColor_Impl initWithDictionaryRepresentation:]([IMWallpaperMetadataColor_Impl alloc], "initWithDictionaryRepresentation:", v4);
    swiftImpl = v5->swiftImpl;
    v5->swiftImpl = v6;

  }
  return v5;
}

- (IMWallpaperMetadataColor)initWithCoder:(id)a3
{
  id v4;
  IMWallpaperMetadataColor *v5;
  IMWallpaperMetadataColor_Impl *v6;
  IMWallpaperMetadataColor_Impl *swiftImpl;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMWallpaperMetadataColor;
  v5 = -[IMWallpaperMetadataColor init](&v9, sel_init);
  if (v5)
  {
    v6 = -[IMWallpaperMetadataColor_Impl initWithCoder:]([IMWallpaperMetadataColor_Impl alloc], "initWithCoder:", v4);
    swiftImpl = v5->swiftImpl;
    v5->swiftImpl = v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)dictionaryRepresentation
{
  return -[IMWallpaperMetadataColor_Impl dictionaryRepresentation](self->swiftImpl, "dictionaryRepresentation");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->swiftImpl, 0);
}

@end
