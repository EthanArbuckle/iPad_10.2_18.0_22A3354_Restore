@implementation MKWalletMerchantStylingInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MKWalletMerchantStylingInfo)initWithStyleAttributes:(id)a3
{
  id v4;
  MKWalletMerchantStylingInfo *v5;
  uint64_t v6;
  NSData *styleAttributesData;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKWalletMerchantStylingInfo;
  v5 = -[MKWalletMerchantStylingInfo init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "data");
    v6 = objc_claimAutoreleasedReturnValue();
    styleAttributesData = v5->_styleAttributesData;
    v5->_styleAttributesData = (NSData *)v6;

  }
  return v5;
}

- (MKWalletMerchantStylingInfo)initWithCoder:(id)a3
{
  id v4;
  MKWalletMerchantStylingInfo *v5;
  uint64_t v6;
  NSData *styleAttributesData;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKWalletMerchantStylingInfo;
  v5 = -[MKWalletMerchantStylingInfo init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("d"));
    v6 = objc_claimAutoreleasedReturnValue();
    styleAttributesData = v5->_styleAttributesData;
    v5->_styleAttributesData = (NSData *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_styleAttributesData, CFSTR("d"));
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  char v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4[1];
    if (v5 | (unint64_t)self->_styleAttributesData)
      v6 = objc_msgSend((id)v5, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_featureStyleAttributes
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D275B0]), "initWithData:", self->_styleAttributesData);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D270A8]), "initWithPlaceStyleAttributes:", v2);

  return v3;
}

- (id)imageForSize:(unint64_t)a3 scale:(double)a4
{
  return -[MKWalletMerchantStylingInfo imageForSize:scale:transparent:](self, "imageForSize:scale:transparent:", a3, 0, a4);
}

- (id)imageForSize:(unint64_t)a3 scale:(double)a4 transparent:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  void *v9;

  v5 = a5;
  -[MKWalletMerchantStylingInfo _featureStyleAttributes](self, "_featureStyleAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKIconManager imageForStyle:size:forScale:format:transparent:](MKIconManager, "imageForStyle:size:forScale:format:transparent:", v8, a3, 0, v5, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)tintColorForScale:(double)a3
{
  void *v4;
  CGColor *v5;
  void *v6;

  -[MKWalletMerchantStylingInfo _featureStyleAttributes](self, "_featureStyleAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[MKIconManager newFillColorForStyleAttributes:forScale:](MKIconManager, "newFillColorForStyleAttributes:forScale:", v4, a3);

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithCGColor:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)description
{
  void *v2;
  __CFString *v3;
  uint64_t v4;
  unint64_t v5;

  -[MKWalletMerchantStylingInfo _featureStyleAttributes](self, "_featureStyleAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "countAttrs"))
    {
      v4 = 0;
      v5 = 0;
      do
      {
        -[__CFString appendFormat:](v3, "appendFormat:", CFSTR("%u,%d; "),
          *(unsigned int *)(objc_msgSend(v2, "v") + v4),
          *(unsigned int *)(objc_msgSend(v2, "v") + v4 + 4));
        ++v5;
        v4 += 8;
      }
      while (v5 < objc_msgSend(v2, "countAttrs"));
    }
  }
  else
  {
    v3 = CFSTR("(null)");
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributesData, 0);
}

@end
