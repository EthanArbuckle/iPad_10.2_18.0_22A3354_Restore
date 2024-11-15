@implementation BBDismissalItem

- (BBDismissalItem)initWithFeeds:(unint64_t)a3
{
  BBDismissalItem *v3;
  uint64_t v4;
  NSDate *expiration;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BBDismissalItem;
  v3 = -[BBDismissalItem init](&v7, sel_init, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 120.0);
    v4 = objc_claimAutoreleasedReturnValue();
    expiration = v3->_expiration;
    v3->_expiration = (NSDate *)v4;

  }
  return v3;
}

- (void)addFeeds:(unint64_t)a3
{
  self->_feeds |= a3;
}

- (BOOL)hasExpired
{
  void *v3;
  void *v4;
  double v5;
  BOOL v6;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBDismissalItem expiration](self, "expiration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5 >= 0.0;

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p; feeds:%lu; expiration:%@>"),
               objc_opt_class(),
               self,
               self->_feeds,
               self->_expiration);
}

- (unint64_t)feeds
{
  return self->_feeds;
}

- (NSDate)expiration
{
  return self->_expiration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiration, 0);
}

@end
