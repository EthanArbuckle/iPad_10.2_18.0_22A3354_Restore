@implementation MRMutableApplicationActivity

- (void)setPrimaryApplicationDisplayID:(id)a3
{
  NSString *v4;
  NSString *primaryApplicationDisplayID;

  if (self->super._primaryApplicationDisplayID != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    primaryApplicationDisplayID = self->super._primaryApplicationDisplayID;
    self->super._primaryApplicationDisplayID = v4;

  }
}

- (void)setSecondaryApplicationDisplayID:(id)a3
{
  NSString *v4;
  NSString *secondaryApplicationDisplayID;

  if (self->super._secondaryApplicationDisplayID != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    secondaryApplicationDisplayID = self->super._secondaryApplicationDisplayID;
    self->super._secondaryApplicationDisplayID = v4;

  }
}

- (void)setStatus:(int)a3
{
  self->super._status = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
