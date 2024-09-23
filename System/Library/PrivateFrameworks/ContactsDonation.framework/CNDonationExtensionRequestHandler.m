@implementation CNDonationExtensionRequestHandler

- (void)beginRequestWithExtensionContext:(id)a3
{
  objc_class *v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "setRequestHandler:", self);
  }
  else
  {
    v4 = (objc_class *)objc_opt_class();

    NSStringFromClass(v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Remote context was of incorrect class. Expected _CNDRemoteExtensionContext, got %@"), v5);
  }

}

- (void)renewExpirationDateForDonatedValue:(id)a3 acknowledgementHandler:(id)a4
{
  id v6;
  id v7;
  CNDonationExtensionRequestHandler *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CNAbstractMethodException();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (void)userDidRejectDonatedValue:(id)a3
{
  id v4;
  CNDonationExtensionRequestHandler *v5;
  id v6;

  v4 = a3;
  v5 = self;
  CNAbstractMethodException();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (unint64_t)donationVersioningNumber
{
  return 1;
}

- (void)redonateAllValuesWithReason:(unint64_t)a3
{
  CNDonationExtensionRequestHandler *v3;
  id v4;

  v3 = self;
  CNAbstractMethodException();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

@end
