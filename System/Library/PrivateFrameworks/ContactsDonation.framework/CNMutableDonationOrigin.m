@implementation CNMutableDonationOrigin

- (CNMutableDonationOrigin)init
{
  return -[CNDonationOrigin initWithBundleIdentifier:donationIdentifier:donationDate:expirationDate:](self, "initWithBundleIdentifier:donationIdentifier:donationDate:expirationDate:", &stru_24C236758, &stru_24C236758, 0, 0);
}

- (void)setBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *bundleIdentifier;

  if (self->super._bundleIdentifier != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    bundleIdentifier = self->super._bundleIdentifier;
    self->super._bundleIdentifier = v4;

  }
}

- (void)setDonationIdentifier:(id)a3
{
  NSString *v4;
  NSString *donationIdentifier;

  if (self->super._donationIdentifier != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    donationIdentifier = self->super._donationIdentifier;
    self->super._donationIdentifier = v4;

  }
}

- (void)setClusterIdentifier:(id)a3
{
  NSString *v4;
  NSString *clusterIdentifier;

  if (self->super._clusterIdentifier != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    clusterIdentifier = self->super._clusterIdentifier;
    self->super._clusterIdentifier = v4;

  }
}

- (void)setDonationDate:(id)a3
{
  NSDate *v4;
  NSDate *donationDate;

  if (self->super._donationDate != a3)
  {
    v4 = (NSDate *)objc_msgSend(a3, "copy");
    donationDate = self->super._donationDate;
    self->super._donationDate = v4;

  }
}

- (void)setExpirationDate:(id)a3
{
  NSDate *v4;
  NSDate *expirationDate;

  if (self->super._expirationDate != a3)
  {
    v4 = (NSDate *)objc_msgSend(a3, "copy");
    expirationDate = self->super._expirationDate;
    self->super._expirationDate = v4;

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CNDonationOrigin initWithDonationOrigin:]([CNDonationOrigin alloc], "initWithDonationOrigin:", self);
}

@end
