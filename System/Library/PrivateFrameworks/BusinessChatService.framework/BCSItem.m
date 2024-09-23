@implementation BCSItem

- (BCSItem)init
{
  BCSItem *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BCSItem;
  v2 = -[BCSItem init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSItem setExpirationDate:](v2, "setExpirationDate:", v3);

  }
  return v2;
}

- (BOOL)isExpired
{
  void *v2;
  void *v3;
  BOOL v4;

  -[BCSItem expirationDate](self, "expirationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "compare:", v3) == -1;

  return v4;
}

- (NSObject)itemIdentifier
{
  return 0;
}

- (int64_t)truncatedHash
{
  return 0;
}

- (int64_t)type
{
  return 1;
}

- (BOOL)matchesItemIdentifying:(id)a3
{
  return 0;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
}

@end
