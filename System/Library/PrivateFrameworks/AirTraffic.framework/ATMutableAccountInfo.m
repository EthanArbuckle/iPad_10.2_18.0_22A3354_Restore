@implementation ATMutableAccountInfo

- (void)setDSID:(id)a3
{
  NSNumber *v4;
  NSNumber *DSID;

  if (self->super._DSID != a3)
  {
    v4 = (NSNumber *)objc_msgSend(a3, "copy");
    DSID = self->super._DSID;
    self->super._DSID = v4;

  }
}

- (void)setAltDSID:(id)a3
{
  NSString *v4;
  NSString *altDSID;

  if (self->super._altDSID != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    altDSID = self->super._altDSID;
    self->super._altDSID = v4;

  }
}

- (void)setAppleID:(id)a3
{
  NSString *v4;
  NSString *appleID;

  if (self->super._appleID != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    appleID = self->super._appleID;
    self->super._appleID = v4;

  }
}

@end
