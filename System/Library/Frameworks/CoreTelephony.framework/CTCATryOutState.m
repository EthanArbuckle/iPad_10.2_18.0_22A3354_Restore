@implementation CTCATryOutState

- (id)description
{
  void *v3;
  _BOOL4 v4;
  const char *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTCATryOutState tryOutOfferPending](self, "tryOutOfferPending");
  v5 = "no";
  if (v4)
    v5 = "yes";
  objc_msgSend(v3, "appendFormat:", CFSTR(", tryOutOfferPending=%s"), v5);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setTryOutOfferPending:", -[CTCATryOutState tryOutOfferPending](self, "tryOutOfferPending"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[CTCATryOutState tryOutOfferPending](self, "tryOutOfferPending"), CFSTR("tryOutOfferPending"));

}

- (CTCATryOutState)initWithCoder:(id)a3
{
  id v4;
  CTCATryOutState *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTCATryOutState;
  v5 = -[CTCATryOutState init](&v7, sel_init);
  if (v5)
    v5->_tryOutOfferPending = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("tryOutOfferPending"));

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)tryOutOfferPending
{
  return self->_tryOutOfferPending;
}

- (void)setTryOutOfferPending:(BOOL)a3
{
  self->_tryOutOfferPending = a3;
}

@end
