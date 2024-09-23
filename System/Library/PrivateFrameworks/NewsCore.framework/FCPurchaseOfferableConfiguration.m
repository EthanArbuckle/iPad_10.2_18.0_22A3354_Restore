@implementation FCPurchaseOfferableConfiguration

- (FCPurchaseOfferableConfiguration)initWithPurchaseID:(id)a3 allowsPublisherPhoneApp:(BOOL)a4 allowsPublisherPadApp:(BOOL)a5 allowsPublisherWebsite:(BOOL)a6 preferredOffer:(BOOL)a7
{
  id v12;
  FCPurchaseOfferableConfiguration *v13;
  uint64_t v14;
  NSString *purchaseID;
  objc_super v17;

  v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FCPurchaseOfferableConfiguration;
  v13 = -[FCPurchaseOfferableConfiguration init](&v17, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v12, "copy");
    purchaseID = v13->_purchaseID;
    v13->_purchaseID = (NSString *)v14;

    v13->_allowsPublisherPhoneApp = a4;
    v13->_allowsPublisherPadApp = a5;
    v13->_allowsPublisherWebsite = a6;
    v13->_preferredOffer = a7;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseID, 0);
}

- (NSString)purchaseID
{
  return self->_purchaseID;
}

- (void)setPurchaseID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)allowsPublisherPhoneApp
{
  return self->_allowsPublisherPhoneApp;
}

- (void)setAllowsPublisherPhoneApp:(BOOL)a3
{
  self->_allowsPublisherPhoneApp = a3;
}

- (BOOL)allowsPublisherPadApp
{
  return self->_allowsPublisherPadApp;
}

- (void)setAllowsPublisherPadApp:(BOOL)a3
{
  self->_allowsPublisherPadApp = a3;
}

- (BOOL)allowsPublisherWebsite
{
  return self->_allowsPublisherWebsite;
}

- (void)setAllowsPublisherWebsite:(BOOL)a3
{
  self->_allowsPublisherWebsite = a3;
}

- (BOOL)preferredOffer
{
  return self->_preferredOffer;
}

- (void)setPreferredOffer:(BOOL)a3
{
  self->_preferredOffer = a3;
}

@end
