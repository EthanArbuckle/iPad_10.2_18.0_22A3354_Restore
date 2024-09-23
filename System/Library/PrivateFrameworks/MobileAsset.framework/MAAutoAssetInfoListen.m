@implementation MAAutoAssetInfoListen

- (MAAutoAssetInfoListen)initWithNotifications:(id)a3
{
  id v5;
  MAAutoAssetInfoListen *v6;
  MAAutoAssetInfoListen *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MAAutoAssetInfoListen;
  v6 = -[MAAutoAssetInfoListen init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_activeNotifications, a3);

  return v7;
}

- (MAAutoAssetInfoListen)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetInfoListen *v5;
  uint64_t v6;
  MAAutoAssetNotifications *activeNotifications;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MAAutoAssetInfoListen;
  v5 = -[MAAutoAssetInfoListen init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activeNotifications"));
    v6 = objc_claimAutoreleasedReturnValue();
    activeNotifications = v5->_activeNotifications;
    v5->_activeNotifications = (MAAutoAssetNotifications *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MAAutoAssetInfoListen activeNotifications](self, "activeNotifications");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("activeNotifications"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  void *v2;
  void *v3;

  -[MAAutoAssetInfoListen activeNotifications](self, "activeNotifications");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "summary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (MAAutoAssetNotifications)activeNotifications
{
  return self->_activeNotifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeNotifications, 0);
}

@end
