@implementation SUUIDonationStepViewController

- (SUUIDonationStepViewController)initWithCharity:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  SUUIDonationStepViewController *v9;
  SUUIDonationStepViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUUIDonationStepViewController;
  v9 = -[SUUIDonationStepViewController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_charity, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
  }

  return v10;
}

- (SUUIDonationViewController)donationViewController
{
  void *v2;
  id v3;

  -[SUUIDonationStepViewController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return (SUUIDonationViewController *)v3;
}

- (SUUIGiftCharity)charity
{
  return self->_charity;
}

- (SUUIDonationConfiguration)donationConfiguration
{
  return self->_configuration;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_charity, 0);
}

@end
