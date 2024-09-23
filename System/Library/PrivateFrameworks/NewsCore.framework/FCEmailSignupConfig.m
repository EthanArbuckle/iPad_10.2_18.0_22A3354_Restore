@implementation FCEmailSignupConfig

- (FCEmailSignupConfig)initWithConfigDictionary:(id)a3
{
  id v4;
  FCEmailSignupConfig *v5;
  void *v6;
  uint64_t v7;
  NSString *landingPageArticleID;
  uint64_t v9;
  NSString *alertTitle;
  uint64_t v11;
  NSString *alertEmailAvailableMessage;
  uint64_t v13;
  NSString *alertEmailUnavailableMessage;
  uint64_t v15;
  NSString *alertAcceptActionTitle;
  uint64_t v17;
  NSString *alertDeclineActionTitle;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)FCEmailSignupConfig;
  v5 = -[FCEmailSignupConfig init](&v20, sel_init);
  if (v5)
  {
    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("emailSignupStyle"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_emailSignupStyle = FCEmailSignupStyleForValue(v6);

    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("landingPageArticleID"), &stru_1E464BC40);
    v7 = objc_claimAutoreleasedReturnValue();
    landingPageArticleID = v5->_landingPageArticleID;
    v5->_landingPageArticleID = (NSString *)v7;

    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("alertTitle"), &stru_1E464BC40);
    v9 = objc_claimAutoreleasedReturnValue();
    alertTitle = v5->_alertTitle;
    v5->_alertTitle = (NSString *)v9;

    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("alertEmailAvailableMessage"), &stru_1E464BC40);
    v11 = objc_claimAutoreleasedReturnValue();
    alertEmailAvailableMessage = v5->_alertEmailAvailableMessage;
    v5->_alertEmailAvailableMessage = (NSString *)v11;

    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("alertEmailUnavailableMessage"), &stru_1E464BC40);
    v13 = objc_claimAutoreleasedReturnValue();
    alertEmailUnavailableMessage = v5->_alertEmailUnavailableMessage;
    v5->_alertEmailUnavailableMessage = (NSString *)v13;

    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("alertAcceptActionTitle"), &stru_1E464BC40);
    v15 = objc_claimAutoreleasedReturnValue();
    alertAcceptActionTitle = v5->_alertAcceptActionTitle;
    v5->_alertAcceptActionTitle = (NSString *)v15;

    FCAppConfigurationStringValue(v4, (uint64_t)CFSTR("alertDeclineActionTitle"), &stru_1E464BC40);
    v17 = objc_claimAutoreleasedReturnValue();
    alertDeclineActionTitle = v5->_alertDeclineActionTitle;
    v5->_alertDeclineActionTitle = (NSString *)v17;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertDeclineActionTitle, 0);
  objc_storeStrong((id *)&self->_alertAcceptActionTitle, 0);
  objc_storeStrong((id *)&self->_alertEmailUnavailableMessage, 0);
  objc_storeStrong((id *)&self->_alertEmailAvailableMessage, 0);
  objc_storeStrong((id *)&self->_alertTitle, 0);
  objc_storeStrong((id *)&self->_landingPageArticleID, 0);
}

- (unint64_t)emailSignupStyle
{
  return self->_emailSignupStyle;
}

- (void)setEmailSignupStyle:(unint64_t)a3
{
  self->_emailSignupStyle = a3;
}

- (NSString)landingPageArticleID
{
  return self->_landingPageArticleID;
}

- (void)setLandingPageArticleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)alertTitle
{
  return self->_alertTitle;
}

- (void)setAlertTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)alertEmailAvailableMessage
{
  return self->_alertEmailAvailableMessage;
}

- (void)setAlertEmailAvailableMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)alertEmailUnavailableMessage
{
  return self->_alertEmailUnavailableMessage;
}

- (void)setAlertEmailUnavailableMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)alertAcceptActionTitle
{
  return self->_alertAcceptActionTitle;
}

- (void)setAlertAcceptActionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)alertDeclineActionTitle
{
  return self->_alertDeclineActionTitle;
}

- (void)setAlertDeclineActionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

@end
