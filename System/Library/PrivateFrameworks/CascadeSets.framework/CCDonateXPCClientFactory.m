@implementation CCDonateXPCClientFactory

- (id)makeConnection:(id)a3
{
  id v3;
  CCDonateXPCClient *v4;

  v3 = a3;
  v4 = -[CCDonateXPCClient initWithClientId:]([CCDonateXPCClient alloc], "initWithClientId:", v3);

  return v4;
}

- (void)terminateConnection:(id)a3
{
  id v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "invalidate");

}

@end
