@implementation PARSubscriptionStatus

- (PARSubscriptionStatus)initWithCoder:(id)a3
{
  id v4;
  PARSubscriptionStatus *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PARSubscriptionStatus;
  v5 = -[PARSubscriptionStatus init](&v7, sel_init);
  if (v5)
    -[PARSubscriptionStatus setIsSubscribed:](v5, "setIsSubscribed:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSubscribed")));

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setIsSubscribed:", -[PARSubscriptionStatus isSubscribed](self, "isSubscribed"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[PARSubscriptionStatus isSubscribed](self, "isSubscribed"), CFSTR("isSubscribed"));

}

- (BOOL)isSubscribed
{
  return self->isSubscribed;
}

- (void)setIsSubscribed:(BOOL)a3
{
  self->isSubscribed = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
