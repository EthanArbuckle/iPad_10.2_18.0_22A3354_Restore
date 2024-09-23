@implementation HKHRIrregularRhythmNotificationsBridgeFooter

- (HKHRIrregularRhythmNotificationsBridgeFooter)initWithText:(id)a3 linkText:(id)a4 linkURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKHRIrregularRhythmNotificationsBridgeFooter *v11;
  uint64_t v12;
  NSString *text;
  uint64_t v14;
  NSString *linkText;
  uint64_t v16;
  NSString *linkURL;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKHRIrregularRhythmNotificationsBridgeFooter;
  v11 = -[HKHRIrregularRhythmNotificationsBridgeFooter init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    text = v11->_text;
    v11->_text = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    linkText = v11->_linkText;
    v11->_linkText = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    linkURL = v11->_linkURL;
    v11->_linkURL = (NSString *)v16;

  }
  return v11;
}

+ (id)footerWhenAFibHistoryIsEnabled
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  HKHRAFibHistoryLocalizedString(CFSTR("HEART_NOTIFICATION_IRN_DISABLED_DUE_TO_AFIB_HISTORY_FOOTER"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithText:linkText:linkURL:", v3, 0, 0);

  return v4;
}

+ (id)footerWhenSeedHasExpired
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  HKHeartRateLocalizedString(CFSTR("FEATURE_SEED_EXPIRED_ANTIMONY"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKHeartSettingsUtilities seedExpiredLinkTitle](_HKHeartSettingsUtilities, "seedExpiredLinkTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKHeartSettingsUtilities seedExpiredLinkURL](_HKHeartSettingsUtilities, "seedExpiredLinkURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithText:linkText:linkURL:", v5, v4, v6);

  return v7;
}

+ (id)footerWhenRemotelyDisabled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  HKHeartRateLocalizedString(CFSTR("FEATURE_DISABLED_REMOTELY_ANTIMONY"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKHeartSettingsUtilities remoteDisabledLinkTitle](_HKHeartSettingsUtilities, "remoteDisabledLinkTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKHeartSettingsUtilities remoteDisabledLinkURL](_HKHeartSettingsUtilities, "remoteDisabledLinkURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithText:linkText:linkURL:", v5, v4, v6);

  return v7;
}

+ (id)footerWhenUnavailableInOnboardedCountry
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  HKHeartRateLocalizedString(CFSTR("IRREGULAR_RHYTHM_NOTIFICATIONS_UNAVAILABLE_ON_WATCH"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKHeartSettingsUtilities irregularHeartRhythmFooterLinkTitle](_HKHeartSettingsUtilities, "irregularHeartRhythmFooterLinkTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKHeartSettingsUtilities irregularHeartRhythmFooterLinkURL](_HKHeartSettingsUtilities, "irregularHeartRhythmFooterLinkURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithText:linkText:linkURL:", v5, v4, v6);

  return v7;
}

+ (id)standardFooter
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[_HKHeartSettingsUtilities irregularHeartRhythmFooterDescription](_HKHeartSettingsUtilities, "irregularHeartRhythmFooterDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKHeartSettingsUtilities irregularHeartRhythmFooterLinkTitle](_HKHeartSettingsUtilities, "irregularHeartRhythmFooterLinkTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKHeartSettingsUtilities irregularHeartRhythmFooterLinkURL](_HKHeartSettingsUtilities, "irregularHeartRhythmFooterLinkURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithText:linkText:linkURL:", v3, v4, v5);

  return v6;
}

- (NSString)text
{
  return self->_text;
}

- (NSString)linkText
{
  return self->_linkText;
}

- (NSString)linkURL
{
  return self->_linkURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkURL, 0);
  objc_storeStrong((id *)&self->_linkText, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
