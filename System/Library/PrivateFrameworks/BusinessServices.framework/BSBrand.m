@implementation BSBrand

- (NSString)brandURI
{
  void *v2;
  void *v3;

  -[BSBrand shim](self, "shim");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "brandURI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isRCSChatBot
{
  void *v2;
  char v3;

  -[BSBrand shim](self, "shim");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRCSChatBot");

  return v3;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[BSBrand shim](self, "shim");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)categories
{
  void *v2;
  void *v3;

  -[BSBrand shim](self, "shim");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "categories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)primaryPhoneNumber
{
  void *v2;
  void *v3;

  -[BSBrand shim](self, "shim");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryPhoneNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isVerified
{
  void *v2;
  char v3;

  -[BSBrand shim](self, "shim");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isVerified");

  return v3;
}

- (BSBrandMessagingDetails)messagingDetails
{
  return self->_messagingDetails;
}

- (id)verifiedBy
{
  void *v2;
  void *v3;

  -[BSBrand shim](self, "shim");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "verifiedBy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)website
{
  void *v2;
  void *v3;

  -[BSBrand shim](self, "shim");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "website");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)messageNumber
{
  void *v2;
  void *v3;

  -[BSBrand shim](self, "shim");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)emailAddress
{
  void *v2;
  void *v3;

  -[BSBrand shim](self, "shim");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "emailAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)address
{
  void *v2;
  void *v3;

  -[BSBrand shim](self, "shim");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)termsAndConditionsURL
{
  void *v2;
  void *v3;

  -[BSBrand shim](self, "shim");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "termsAndConditionsURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)genericCSSTemplateURL
{
  void *v2;
  void *v3;

  -[BSBrand shim](self, "shim");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "genericCSSTemplateURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)localizedDescription
{
  void *v2;
  void *v3;

  -[BSBrand shim](self, "shim");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)localizedResponseTime
{
  void *v2;
  void *v3;

  -[BSBrand shim](self, "shim");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedResponseTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)logoFingerprint
{
  void *v2;
  void *v3;

  -[BSBrand shim](self, "shim");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logoFingerprint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)logoDataOfType:(int64_t)a3 desiredSize:(CGSize)a4 fingerprint:(id)a5 completion:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  id v13;

  height = a4.height;
  width = a4.width;
  v11 = a6;
  v12 = a5;
  -[BSBrand shim](self, "shim");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "logoDataOfType:desiredSize:fingerprint:completion:", a3, v12, v11, width, height);

}

- (void)squareLogoDataForDesiredSize:(CGSize)a3 completion:(id)a4
{
  double height;
  double width;
  id v7;
  id v8;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[BSBrand shim](self, "shim");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "squareLogoDataForDesiredSize:completion:", v7, width, height);

}

- (void)wideLogoDataForDesiredSize:(CGSize)a3 completion:(id)a4
{
  double height;
  double width;
  id v7;
  id v8;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[BSBrand shim](self, "shim");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "wideLogoDataForDesiredSize:completion:", v7, width, height);

}

- (void)logoFileURLForType:(int64_t)a3 desiredSize:(CGSize)a4 completion:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;

  height = a4.height;
  width = a4.width;
  v9 = a5;
  -[BSBrand shim](self, "shim");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logoFileURLOfType:desiredSize:completionHandler:", a3, v9, width, height);

}

- (void)assetDataForType:(int64_t)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[BSBrand shim](self, "shim");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetDataOfType:completion:", a3, v6);

}

- (void)clearCachedAssets:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BSBrand shim](self, "shim");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearCachedAssets:", v4);

}

- (NSString)_primaryBrandColorHexString
{
  void *v2;
  void *v3;

  -[BSBrand shim](self, "shim");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryBrandColorHexString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)_secondaryBrandColorHexString
{
  void *v2;
  void *v3;

  -[BSBrand shim](self, "shim");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "secondaryBrandColorHexString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)_initWithShim:(id)a3
{
  id v5;
  BSBrand *v6;
  BSBrand *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BSBrand;
  v6 = -[BSBrand init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_shim, a3);

  return v7;
}

+ (id)mockBrand
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  +[BSBrandObjcShim mockBrand](BSBrandObjcShim, "mockBrand");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "_initWithShim:", v3);

  return v4;
}

- (BSBrandObjcShim)shim
{
  return self->_shim;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shim, 0);
  objc_storeStrong((id *)&self->_messagingDetails, 0);
}

- (BOOL)isAppleMainBrand
{
  void *v2;
  char v3;

  -[BSBrand brandURI](self, "brandURI");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = BSBrandURIIsAppleMain(v2);

  return v3;
}

- (BOOL)isAppleMakoBrand
{
  void *v2;
  char v3;

  -[BSBrand brandURI](self, "brandURI");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = BSBrandURIIsAppleMako(v2);

  return v3;
}

+ (id)placeholderName
{
  return +[BSBrandObjcShim placeholderName](BSBrandObjcShim, "placeholderName");
}

@end
