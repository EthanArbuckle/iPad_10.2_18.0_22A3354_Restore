@implementation SUUIRedeem

- (SUUIRedeem)init
{
  SUUIRedeem *v2;
  SUUIRedeem *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIRedeem;
  v2 = -[SUUIRedeem init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SUUIRedeem setITunesPassLearnMoreAlertInterval:](v2, "setITunesPassLearnMoreAlertInterval:", -1.0);
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUUIRedeem)initWithCoder:(id)a3
{
  id v4;
  SUUIRedeem *v5;
  uint64_t v6;
  NSArray *items;
  uint64_t v8;
  NSArray *downloads;
  uint64_t v10;
  NSString *inAppPurchase;
  uint64_t v12;
  NSString *credit;
  uint64_t v14;
  NSString *creditDisplay;
  uint64_t v16;
  NSString *balance;
  uint64_t v18;
  NSDictionary *thankYouDictionary;
  uint64_t v20;
  NSURL *redirectURL;
  uint64_t v22;
  NSURL *customizedThankyouURL;
  uint64_t v24;
  UIImage *headerImage;
  uint64_t v26;
  SUUIArtworkProviding *headerArtworkProvider;
  uint64_t v28;
  NSString *title;
  uint64_t v30;
  NSString *message;
  uint64_t v32;
  NSArray *links;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)SUUIRedeem;
  v5 = -[SUUIRedeem init](&v35, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("items"));
    v6 = objc_claimAutoreleasedReturnValue();
    items = v5->_items;
    v5->_items = (NSArray *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("downloads"));
    v8 = objc_claimAutoreleasedReturnValue();
    downloads = v5->_downloads;
    v5->_downloads = (NSArray *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inAppPurchase"));
    v10 = objc_claimAutoreleasedReturnValue();
    inAppPurchase = v5->_inAppPurchase;
    v5->_inAppPurchase = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credit"));
    v12 = objc_claimAutoreleasedReturnValue();
    credit = v5->_credit;
    v5->_credit = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creditDisplay"));
    v14 = objc_claimAutoreleasedReturnValue();
    creditDisplay = v5->_creditDisplay;
    v5->_creditDisplay = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("balance"));
    v16 = objc_claimAutoreleasedReturnValue();
    balance = v5->_balance;
    v5->_balance = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("thankYouDictionary"));
    v18 = objc_claimAutoreleasedReturnValue();
    thankYouDictionary = v5->_thankYouDictionary;
    v5->_thankYouDictionary = (NSDictionary *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("redirectURL"));
    v20 = objc_claimAutoreleasedReturnValue();
    redirectURL = v5->_redirectURL;
    v5->_redirectURL = (NSURL *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customizedThankyouURL"));
    v22 = objc_claimAutoreleasedReturnValue();
    customizedThankyouURL = v5->_customizedThankyouURL;
    v5->_customizedThankyouURL = (NSURL *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("headerImage"));
    v24 = objc_claimAutoreleasedReturnValue();
    headerImage = v5->_headerImage;
    v5->_headerImage = (UIImage *)v24;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("headerArtworkProvider"));
    v26 = objc_claimAutoreleasedReturnValue();
    headerArtworkProvider = v5->_headerArtworkProvider;
    v5->_headerArtworkProvider = (SUUIArtworkProviding *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v28 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("message"));
    v30 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSString *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("links"));
    v32 = objc_claimAutoreleasedReturnValue();
    links = v5->_links;
    v5->_links = (NSArray *)v32;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *items;
  id v5;

  items = self->_items;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", items, CFSTR("items"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_downloads, CFSTR("downloads"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_inAppPurchase, CFSTR("inAppPurchase"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_credit, CFSTR("credit"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creditDisplay, CFSTR("creditDisplay"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_balance, CFSTR("balance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_thankYouDictionary, CFSTR("thankYouDictionary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_redirectURL, CFSTR("redirectURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_customizedThankyouURL, CFSTR("customizedThankyouURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_headerImage, CFSTR("headerImage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_headerArtworkProvider, CFSTR("headerArtworkProvider"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_message, CFSTR("message"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_links, CFSTR("links"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hideItemView, CFSTR("hideItemView"));

}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (NSArray)downloads
{
  return self->_downloads;
}

- (void)setDownloads:(id)a3
{
  objc_storeStrong((id *)&self->_downloads, a3);
}

- (NSString)inAppPurchase
{
  return self->_inAppPurchase;
}

- (void)setInAppPurchase:(id)a3
{
  objc_storeStrong((id *)&self->_inAppPurchase, a3);
}

- (NSString)credit
{
  return self->_credit;
}

- (void)setCredit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)balance
{
  return self->_balance;
}

- (void)setBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)creditDisplay
{
  return self->_creditDisplay;
}

- (void)setCreditDisplay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)thankYouDictionary
{
  return self->_thankYouDictionary;
}

- (void)setThankYouDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_thankYouDictionary, a3);
}

- (NSURL)redirectURL
{
  return self->_redirectURL;
}

- (void)setRedirectURL:(id)a3
{
  objc_storeStrong((id *)&self->_redirectURL, a3);
}

- (NSURL)customizedThankyouURL
{
  return self->_customizedThankyouURL;
}

- (void)setCustomizedThankyouURL:(id)a3
{
  objc_storeStrong((id *)&self->_customizedThankyouURL, a3);
}

- (UIImage)headerImage
{
  return self->_headerImage;
}

- (void)setHeaderImage:(id)a3
{
  objc_storeStrong((id *)&self->_headerImage, a3);
}

- (SUUIArtworkProviding)headerArtworkProvider
{
  return self->_headerArtworkProvider;
}

- (void)setHeaderArtworkProvider:(id)a3
{
  objc_storeStrong((id *)&self->_headerArtworkProvider, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)links
{
  return self->_links;
}

- (void)setLinks:(id)a3
{
  objc_storeStrong((id *)&self->_links, a3);
}

- (BOOL)hideItemView
{
  return self->_hideItemView;
}

- (void)setHideItemView:(BOOL)a3
{
  self->_hideItemView = a3;
}

- (double)ITunesPassLearnMoreAlertInterval
{
  return self->_ITunesPassLearnMoreAlertInterval;
}

- (void)setITunesPassLearnMoreAlertInterval:(double)a3
{
  self->_ITunesPassLearnMoreAlertInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_headerArtworkProvider, 0);
  objc_storeStrong((id *)&self->_headerImage, 0);
  objc_storeStrong((id *)&self->_customizedThankyouURL, 0);
  objc_storeStrong((id *)&self->_redirectURL, 0);
  objc_storeStrong((id *)&self->_thankYouDictionary, 0);
  objc_storeStrong((id *)&self->_creditDisplay, 0);
  objc_storeStrong((id *)&self->_balance, 0);
  objc_storeStrong((id *)&self->_credit, 0);
  objc_storeStrong((id *)&self->_inAppPurchase, 0);
  objc_storeStrong((id *)&self->_downloads, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
