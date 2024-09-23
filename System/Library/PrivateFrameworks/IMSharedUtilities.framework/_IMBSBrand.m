@implementation _IMBSBrand

- (id)_initWithBSBrand:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_IMBSBrand;
  v4 = -[IMBrand _init](&v8, sel__init);
  v5 = v4;
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)_IMBSBrand;
    -[IMBrand _setBrand:](&v7, sel__setBrand_, a3);
  }
  return v5;
}

- (id)_init
{
  return -[_IMBSBrand _initWithBSBrand:](self, "_initWithBSBrand:", 0);
}

- (id)brandURI
{
  BSBrand *v2;

  v2 = -[IMBrand brand](self, "brand");
  return (id)MEMORY[0x1E0DE7D20](v2, sel_brandURI);
}

- (id)name
{
  if (-[_IMBSBrand isVerified](self, "isVerified"))
    return (id)-[BSBrand name](-[IMBrand brand](self, "brand"), "name");
  else
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", objc_msgSend((id)IMSharedUtilitiesFrameworkBundle(), "localizedStringForKey:value:table:", CFSTR("MAYBE"), &stru_1E3FBBA48, CFSTR("IMSharedUtilities")), -[BSBrand name](-[IMBrand brand](self, "brand"), "name"));
}

- (id)primaryPhoneNumber
{
  BSBrand *v2;

  v2 = -[IMBrand brand](self, "brand");
  return (id)MEMORY[0x1E0DE7D20](v2, sel_primaryPhoneNumber);
}

- (BOOL)isVerified
{
  return -[BSBrand isVerified](-[IMBrand brand](self, "brand"), "isVerified");
}

- (id)localizedResponseTime
{
  BSBrand *v2;

  v2 = -[IMBrand brand](self, "brand");
  return (id)MEMORY[0x1E0DE7D20](v2, sel_localizedResponseTime);
}

- (id)logoFingerprint
{
  BSBrand *v2;

  v2 = -[IMBrand brand](self, "brand");
  return (id)MEMORY[0x1E0DE7D20](v2, sel_logoFingerprint);
}

- (void)squareLogoDataForDesiredSize:(CGSize)a3 completion:(id)a4
{
  BSBrand *v4;

  v4 = -[IMBrand brand](self, "brand");
  MEMORY[0x1E0DE7D20](v4, sel_squareLogoDataForDesiredSize_completion_);
}

- (void)wideLogoDataForDesiredSize:(CGSize)a3 completion:(id)a4
{
  BSBrand *v4;

  v4 = -[IMBrand brand](self, "brand");
  MEMORY[0x1E0DE7D20](v4, sel_wideLogoDataForDesiredSize_completion_);
}

- (void)logoDataOfType:(int64_t)a3 desiredSize:(CGSize)a4 fingerprint:(id)a5 completion:(id)a6
{
  BSBrand *v6;

  v6 = -[IMBrand brand](self, "brand");
  MEMORY[0x1E0DE7D20](v6, sel_logoDataOfType_desiredSize_fingerprint_completion_);
}

- (void)clearCachedAssets:(id)a3
{
  BSBrand *v3;

  v3 = -[IMBrand brand](self, "brand");
  MEMORY[0x1E0DE7D20](v3, sel_clearCachedAssets_);
}

@end
