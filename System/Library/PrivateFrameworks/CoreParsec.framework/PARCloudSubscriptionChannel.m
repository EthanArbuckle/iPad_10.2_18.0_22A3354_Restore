@implementation PARCloudSubscriptionChannel

- (PARCloudSubscriptionChannel)initWithChannelItem:(id)a3
{
  id v4;
  PARCloudSubscriptionChannel *v5;
  PARCloudSubscriptionChannel *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PARCloudSubscriptionChannel;
  v5 = -[PARCloudSubscriptionChannel init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[PARCloudSubscriptionChannel setChannelItem:](v5, "setChannelItem:", v4);

  return v6;
}

- (PARCloudSubscriptionChannel)initWithCoder:(id)a3
{
  id v4;
  PARCloudSubscriptionChannel *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PARCloudSubscriptionChannel;
  v5 = -[PARCloudSubscriptionChannel init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("channelItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PARCloudSubscriptionChannel setChannelItem:](v5, "setChannelItem:", v6);

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PARCloudSubscriptionChannel;
  v5 = -[PARSubscriptionChannel copyWithZone:](&v9, sel_copyWithZone_);
  -[PARCloudSubscriptionChannel channelItem](self, "channelItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setChannelItem:", v7);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PARCloudSubscriptionChannel channelItem](self, "channelItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("channelItem"));

}

- (SFCloudChannelsRequestItem)channelItem
{
  return self->channelItem;
}

- (void)setChannelItem:(id)a3
{
  objc_storeStrong((id *)&self->channelItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->channelItem, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
