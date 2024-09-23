@implementation COMessageChannelRequest

- (COMessageChannelRequest)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)COMessageChannelRequest;
  return -[COMessageChannelRequest init](&v3, sel_init);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (OS_nw_activity)networkActivity
{
  return self->_networkActivity;
}

- (void)setNetworkActivity:(id)a3
{
  objc_storeStrong((id *)&self->_networkActivity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkActivity, 0);
}

@end
