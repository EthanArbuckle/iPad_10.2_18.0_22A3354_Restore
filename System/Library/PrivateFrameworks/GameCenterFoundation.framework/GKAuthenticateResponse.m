@implementation GKAuthenticateResponse

- (GKAuthenticateResponse)init
{
  GKAuthenticateResponse *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKAuthenticateResponse;
  v2 = -[GKAuthenticateResponse init](&v7, sel_init);
  if (v2)
  {
    +[GKPreferences shared](GKPreferences, "shared");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKAuthenticateResponse setAccessPointIsOnAutomatically:](v2, "setAccessPointIsOnAutomatically:", objc_msgSend(v3, "accessPointIsOnAutomatically"));

    +[GKPreferences shared](GKPreferences, "shared");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKAuthenticateResponse setAccessPointShowHighlights:](v2, "setAccessPointShowHighlights:", objc_msgSend(v4, "accessPointShowHighlights"));

    +[GKPreferences shared](GKPreferences, "shared");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKAuthenticateResponse setAccessPointLocation:](v2, "setAccessPointLocation:", objc_msgSend(v5, "accessPointLocation"));

  }
  return v2;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_7 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_7, &__block_literal_global_36);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_7;
}

void __49__GKAuthenticateResponse_secureCodedPropertyKeys__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v0, "setObject:forKey:", objc_opt_class(), CFSTR("playerID"));
  objc_msgSend(v0, "setObject:forKey:", objc_opt_class(), CFSTR("loginDisabled"));
  objc_msgSend(v0, "setObject:forKey:", objc_opt_class(), CFSTR("suppressLoginSheet"));
  objc_msgSend(v0, "setObject:forKey:", objc_opt_class(), CFSTR("loginBannerDisabled"));
  objc_msgSend(v0, "setObject:forKey:", objc_opt_class(), CFSTR("passwordChangeRequired"));
  objc_msgSend(v0, "setObject:forKey:", objc_opt_class(), CFSTR("passwordChangeURL"));
  objc_msgSend(v0, "setObject:forKey:", objc_opt_class(), CFSTR("alertTitle"));
  objc_msgSend(v0, "setObject:forKey:", objc_opt_class(), CFSTR("alertMessage"));
  objc_msgSend(v0, "setObject:forKey:", objc_opt_class(), CFSTR("lastPersonalizationVersionDisplayed"));
  objc_msgSend(v0, "setObject:forKey:", objc_opt_class(), CFSTR("lastPrivacyNoticeVersionDisplayed"));
  objc_msgSend(v0, "setObject:forKey:", objc_opt_class(), CFSTR("accessPointIsOnAutomatically"));
  objc_msgSend(v0, "setObject:forKey:", objc_opt_class(), CFSTR("accessPointShowHighlights"));
  objc_msgSend(v0, "setObject:forKey:", objc_opt_class(), CFSTR("accessPointLocation"));
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_7;
  secureCodedPropertyKeys_sSecureCodedKeys_7 = (uint64_t)v0;

}

- (NSString)playerID
{
  return self->_playerID;
}

- (void)setPlayerID:(id)a3
{
  objc_storeStrong((id *)&self->_playerID, a3);
}

- (BOOL)loginDisabled
{
  return self->_loginDisabled;
}

- (void)setLoginDisabled:(BOOL)a3
{
  self->_loginDisabled = a3;
}

- (BOOL)suppressLoginSheet
{
  return self->_suppressLoginSheet;
}

- (void)setSuppressLoginSheet:(BOOL)a3
{
  self->_suppressLoginSheet = a3;
}

- (BOOL)loginBannerDisabled
{
  return self->_loginBannerDisabled;
}

- (void)setLoginBannerDisabled:(BOOL)a3
{
  self->_loginBannerDisabled = a3;
}

- (BOOL)passwordChangeRequired
{
  return self->_passwordChangeRequired;
}

- (void)setPasswordChangeRequired:(BOOL)a3
{
  self->_passwordChangeRequired = a3;
}

- (NSURL)passwordChangeURL
{
  return self->_passwordChangeURL;
}

- (void)setPasswordChangeURL:(id)a3
{
  objc_storeStrong((id *)&self->_passwordChangeURL, a3);
}

- (BOOL)shouldShowLinkAccountsUI
{
  return self->_shouldShowLinkAccountsUI;
}

- (void)setShouldShowLinkAccountsUI:(BOOL)a3
{
  self->_shouldShowLinkAccountsUI = a3;
}

- (NSString)alertTitle
{
  return self->_alertTitle;
}

- (void)setAlertTitle:(id)a3
{
  objc_storeStrong((id *)&self->_alertTitle, a3);
}

- (NSString)alertMessage
{
  return self->_alertMessage;
}

- (void)setAlertMessage:(id)a3
{
  objc_storeStrong((id *)&self->_alertMessage, a3);
}

- (unint64_t)lastWelcomeWhatsNewCopyVersionDisplayed
{
  return self->_lastWelcomeWhatsNewCopyVersionDisplayed;
}

- (void)setLastWelcomeWhatsNewCopyVersionDisplayed:(unint64_t)a3
{
  self->_lastWelcomeWhatsNewCopyVersionDisplayed = a3;
}

- (unint64_t)lastPrivacyNoticeVersionDisplayed
{
  return self->_lastPrivacyNoticeVersionDisplayed;
}

- (void)setLastPrivacyNoticeVersionDisplayed:(unint64_t)a3
{
  self->_lastPrivacyNoticeVersionDisplayed = a3;
}

- (NSString)lastPersonalizationVersionDisplayed
{
  return self->_lastPersonalizationVersionDisplayed;
}

- (void)setLastPersonalizationVersionDisplayed:(id)a3
{
  objc_storeStrong((id *)&self->_lastPersonalizationVersionDisplayed, a3);
}

- (NSString)lastProfilePrivacyVersionDisplayed
{
  return self->_lastProfilePrivacyVersionDisplayed;
}

- (void)setLastProfilePrivacyVersionDisplayed:(id)a3
{
  objc_storeStrong((id *)&self->_lastProfilePrivacyVersionDisplayed, a3);
}

- (NSString)lastContactsIntegrationConsentVersionDisplayed
{
  return self->_lastContactsIntegrationConsentVersionDisplayed;
}

- (void)setLastContactsIntegrationConsentVersionDisplayed:(id)a3
{
  objc_storeStrong((id *)&self->_lastContactsIntegrationConsentVersionDisplayed, a3);
}

- (NSString)lastFriendSuggestionsVersionDisplayed
{
  return self->_lastFriendSuggestionsVersionDisplayed;
}

- (void)setLastFriendSuggestionsVersionDisplayed:(id)a3
{
  objc_storeStrong((id *)&self->_lastFriendSuggestionsVersionDisplayed, a3);
}

- (BOOL)accessPointIsOnAutomatically
{
  return self->_accessPointIsOnAutomatically;
}

- (void)setAccessPointIsOnAutomatically:(BOOL)a3
{
  self->_accessPointIsOnAutomatically = a3;
}

- (BOOL)accessPointShowHighlights
{
  return self->_accessPointShowHighlights;
}

- (void)setAccessPointShowHighlights:(BOOL)a3
{
  self->_accessPointShowHighlights = a3;
}

- (int64_t)accessPointLocation
{
  return self->_accessPointLocation;
}

- (void)setAccessPointLocation:(int64_t)a3
{
  self->_accessPointLocation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFriendSuggestionsVersionDisplayed, 0);
  objc_storeStrong((id *)&self->_lastContactsIntegrationConsentVersionDisplayed, 0);
  objc_storeStrong((id *)&self->_lastProfilePrivacyVersionDisplayed, 0);
  objc_storeStrong((id *)&self->_lastPersonalizationVersionDisplayed, 0);
  objc_storeStrong((id *)&self->_alertMessage, 0);
  objc_storeStrong((id *)&self->_alertTitle, 0);
  objc_storeStrong((id *)&self->_passwordChangeURL, 0);
  objc_storeStrong((id *)&self->_playerID, 0);
}

@end
