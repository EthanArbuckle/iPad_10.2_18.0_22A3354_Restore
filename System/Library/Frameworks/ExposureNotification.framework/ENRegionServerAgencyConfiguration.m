@implementation ENRegionServerAgencyConfiguration

- (ENRegionServerAgencyConfiguration)initWithRegion:(id)a3
{
  id v5;
  ENRegionServerAgencyConfiguration *v6;
  ENRegionServerAgencyConfiguration *v7;
  NSArray *agencyColor;
  NSArray *agencyHeaderTextColor;
  NSString *agencyImageURL;
  uint64_t v11;
  NSURL *agencyWebsiteURL;
  uint64_t v13;
  NSURL *agencyFAQWebsiteURL;
  ENRegionServerAgencyLocalizedConfiguration *v15;
  ENRegionServerAgencyLocalizedConfiguration *localizedConfiguration;
  ENRegionServerAgencyConfiguration *v17;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ENRegionServerAgencyConfiguration;
  v6 = -[ENRegionServerAgencyConfiguration init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_region, a3);
    agencyColor = v7->_agencyColor;
    v7->_agencyColor = (NSArray *)&unk_24C397130;

    agencyHeaderTextColor = v7->_agencyHeaderTextColor;
    v7->_agencyHeaderTextColor = (NSArray *)&unk_24C397148;

    agencyImageURL = v7->_agencyImageURL;
    v7->_agencyImageURL = (NSString *)&stru_24C38BCC8;

    v11 = objc_opt_new();
    agencyWebsiteURL = v7->_agencyWebsiteURL;
    v7->_agencyWebsiteURL = (NSURL *)v11;

    v13 = objc_opt_new();
    agencyFAQWebsiteURL = v7->_agencyFAQWebsiteURL;
    v7->_agencyFAQWebsiteURL = (NSURL *)v13;

    v15 = -[ENRegionServerAgencyLocalizedConfiguration initWithRegion:]([ENRegionServerAgencyLocalizedConfiguration alloc], "initWithRegion:", v5);
    localizedConfiguration = v7->_localizedConfiguration;
    v7->_localizedConfiguration = v15;

    v17 = v7;
  }

  return v7;
}

- (id)description
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
  void *v14;
  void *v15;

  v15 = (void *)MEMORY[0x24BDD17C8];
  -[ENRegionServerAgencyConfiguration region](self, "region");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENRegionServerAgencyConfiguration agencyDisplayName](self, "agencyDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENRegionServerAgencyConfiguration agencyColor](self, "agencyColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENRegionServerAgencyConfiguration agencyImageURL](self, "agencyImageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[ENRegionServerAgencyConfiguration agencyHeaderStyle](self, "agencyHeaderStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENRegionServerAgencyConfiguration agencyHeaderTextColor](self, "agencyHeaderTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENRegionServerAgencyConfiguration agencyWebsiteURL](self, "agencyWebsiteURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENRegionServerAgencyConfiguration verificationCodeLearnMoreURL](self, "verificationCodeLearnMoreURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENRegionServerAgencyConfiguration webReportURL](self, "webReportURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENRegionServerAgencyConfiguration localizedConfiguration](self, "localizedConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("Agency - %@, [Display Name]: %@, [Color]: %@, [Image]: %@, [Style]: %@, [HeaderTextColor]: %@, [Website]: %@, [VerificationCodeLearnMoreURL]: %@, [WebReportURL]: %@, [Localized Configuration]: %@"), v14, v3, v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  ENRegion *region;
  void *v5;
  id v6;

  region = self->_region;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", region, CFSTR("region"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_agencyColor, CFSTR("agencyColor"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_agencyHeaderTextColor, CFSTR("agencyHeaderTextColor"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_agencyImageURL, CFSTR("agencyImage"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_agencyHeaderStyle);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("agencyHeaderStyle"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_agencyWebsiteURL, CFSTR("agencyWebsiteURL"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_agencyFAQWebsiteURL, CFSTR("agencyFAQWebsiteURL"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_localizedConfiguration, CFSTR("agencyLocalizations"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_revokedClassificationURL, CFSTR("revokedURL"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_verificationCodeLearnMoreURL, CFSTR("verificationCodeLearnMoreURL"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_webReportURL, CFSTR("webReportURL"));

}

- (ENRegionServerAgencyConfiguration)initWithServerResponseDictionary:(id)a3 locale:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  ENRegion *v10;
  ENRegion *region;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *v16;
  NSString *agencyImageURL;
  uint64_t Int64Ranged;
  unint64_t v19;
  id v20;
  NSURL *v21;
  NSURL *agencyWebsiteURL;
  NSURL *v23;
  NSURL *agencyFAQWebsiteURL;
  NSURL *v25;
  NSURL *revokedClassificationURL;
  NSURL *v27;
  NSURL *verificationCodeLearnMoreURL;
  NSURL *v29;
  NSURL *webReportURL;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  ENRegionServerAgencyConfiguration *v37;
  id v39;
  void *v40;
  id v41;
  int v42;
  objc_super v43;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  v40 = v7;
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v43.receiver = self,
        v43.super_class = (Class)ENRegionServerAgencyConfiguration,
        (self = -[ENRegionServerAgencyConfiguration init](&v43, sel_init)) == 0))
  {
    v37 = 0;
    goto LABEL_29;
  }
  +[ENRegion regionFromServerResponseDictionary:](ENRegion, "regionFromServerResponseDictionary:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    v37 = 0;
    goto LABEL_28;
  }
  v10 = (ENRegion *)objc_msgSend(v8, "copy");
  region = self->_region;
  self->_region = v10;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("config"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v37 = 0;
    goto LABEL_27;
  }
  v42 = 0;
  objc_opt_class();
  NSDictionaryGetNSArrayOfClass();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_agencyColor, v13);
  objc_opt_class();
  NSDictionaryGetNSArrayOfClass();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_agencyHeaderTextColor, v14);
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  agencyImageURL = self->_agencyImageURL;
  self->_agencyImageURL = v16;

  Int64Ranged = CFDictionaryGetInt64Ranged();
  if (v42)
    v19 = 0;
  else
    v19 = Int64Ranged;
  self->_agencyHeaderStyle = v19;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v20);
    v21 = (NSURL *)objc_claimAutoreleasedReturnValue();
    if (!v21)
      goto LABEL_30;
    agencyWebsiteURL = self->_agencyWebsiteURL;
    self->_agencyWebsiteURL = v21;

  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v20);
    v23 = (NSURL *)objc_claimAutoreleasedReturnValue();
    if (!v23)
      goto LABEL_30;
    agencyFAQWebsiteURL = self->_agencyFAQWebsiteURL;
    self->_agencyFAQWebsiteURL = v23;

  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v20);
    v25 = (NSURL *)objc_claimAutoreleasedReturnValue();
    if (!v25)
      goto LABEL_30;
    revokedClassificationURL = self->_revokedClassificationURL;
    self->_revokedClassificationURL = v25;

  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v20);
    v27 = (NSURL *)objc_claimAutoreleasedReturnValue();
    if (!v27)
      goto LABEL_30;
    verificationCodeLearnMoreURL = self->_verificationCodeLearnMoreURL;
    self->_verificationCodeLearnMoreURL = v27;

  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
LABEL_23:
    v39 = v6;
    v31 = v9;
    v32 = v14;
    v33 = v13;

    v34 = (void *)MEMORY[0x20BD2F320]();
    v41 = 0;
    -[ENRegionServerAgencyConfiguration region](self, "region");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[ENRegionServerAgencyLocalizedConfiguration getLocalizedAgencyConfiguration:region:fromDictionary:locale:](ENRegionServerAgencyLocalizedConfiguration, "getLocalizedAgencyConfiguration:region:fromDictionary:locale:", &v41, v35, v12, v7);
    v36 = v41;
    v20 = v41;

    objc_autoreleasePoolPop(v34);
    if (v20)
    {
      objc_storeStrong((id *)&self->_localizedConfiguration, v36);
      v37 = self;
    }
    else
    {
      v37 = 0;
    }
    v13 = v33;
    v14 = v32;
    v9 = v31;
    v6 = v39;
    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v20);
  v29 = (NSURL *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    webReportURL = self->_webReportURL;
    self->_webReportURL = v29;

    goto LABEL_23;
  }
LABEL_30:
  v37 = 0;
LABEL_26:

LABEL_27:
LABEL_28:

LABEL_29:
  return v37;
}

- (ENRegionServerAgencyConfiguration)initWithCoder:(id)a3
{
  id v4;
  ENRegionServerAgencyConfiguration *v5;
  ENRegionServerAgencyConfiguration *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ENRegionServerAgencyConfiguration;
  v5 = -[ENRegionServerAgencyConfiguration init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("region"));
    v6 = (ENRegionServerAgencyConfiguration *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_storeStrong((id *)&v5->_region, v6);
      objc_opt_class();
      NSDecodeNSArrayOfClassIfPresent();

      v6 = 0;
    }
  }
  else
  {
    v6 = v5;
  }

  return v6;
}

- (NSString)agencyDisplayName
{
  void *v2;
  void *v3;

  -[ENRegionServerAgencyConfiguration localizedConfiguration](self, "localizedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ENRegion)region
{
  return self->_region;
}

- (NSArray)agencyColor
{
  return self->_agencyColor;
}

- (void)setAgencyColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)agencyHeaderTextColor
{
  return self->_agencyHeaderTextColor;
}

- (void)setAgencyHeaderTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)agencyImageURL
{
  return self->_agencyImageURL;
}

- (void)setAgencyImageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)agencyHeaderStyle
{
  return self->_agencyHeaderStyle;
}

- (void)setAgencyHeaderStyle:(unint64_t)a3
{
  self->_agencyHeaderStyle = a3;
}

- (NSURL)agencyWebsiteURL
{
  return self->_agencyWebsiteURL;
}

- (NSURL)agencyFAQWebsiteURL
{
  return self->_agencyFAQWebsiteURL;
}

- (ENRegionServerAgencyLocalizedConfiguration)localizedConfiguration
{
  return self->_localizedConfiguration;
}

- (void)setLocalizedConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSURL)revokedClassificationURL
{
  return self->_revokedClassificationURL;
}

- (NSURL)verificationCodeLearnMoreURL
{
  return self->_verificationCodeLearnMoreURL;
}

- (NSURL)webReportURL
{
  return self->_webReportURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webReportURL, 0);
  objc_storeStrong((id *)&self->_verificationCodeLearnMoreURL, 0);
  objc_storeStrong((id *)&self->_revokedClassificationURL, 0);
  objc_storeStrong((id *)&self->_localizedConfiguration, 0);
  objc_storeStrong((id *)&self->_agencyFAQWebsiteURL, 0);
  objc_storeStrong((id *)&self->_agencyWebsiteURL, 0);
  objc_storeStrong((id *)&self->_agencyImageURL, 0);
  objc_storeStrong((id *)&self->_agencyHeaderTextColor, 0);
  objc_storeStrong((id *)&self->_agencyColor, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

@end
