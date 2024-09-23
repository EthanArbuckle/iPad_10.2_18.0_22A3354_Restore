@implementation AMSCampaignAttributionResult

- (AMSCampaignAttributionResult)initWithURL:(id)a3
{
  id v5;
  AMSCampaignAttributionResult *v6;
  AMSCampaignAttributionResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSCampaignAttributionResult;
  v6 = -[AMSCampaignAttributionResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_redirectURL, a3);

  return v7;
}

- (NSURL)redirectURL
{
  return self->_redirectURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redirectURL, 0);
}

@end
