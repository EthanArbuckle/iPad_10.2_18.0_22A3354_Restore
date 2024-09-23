@implementation FCCKTestContentDatabaseFeedCursor

- (id)copyWithZone:(_NSZone *)a3
{
  FCCKTestContentDatabaseFeedCursor *v4;
  void *v5;
  void *v6;

  v4 = -[FCCKTestContentDatabaseFeedCursor init](+[FCCKTestContentDatabaseFeedCursor allocWithZone:](FCCKTestContentDatabaseFeedCursor, "allocWithZone:", a3), "init");
  -[FCCKTestContentDatabaseFeedCursor order](self, "order");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKTestContentDatabaseFeedCursor setOrder:](v4, "setOrder:", v5);

  -[FCCKTestContentDatabaseFeedCursor subOrder](self, "subOrder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKTestContentDatabaseFeedCursor setSubOrder:](v4, "setSubOrder:", v6);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FCCKTestContentDatabaseFeedCursor order](self, "order");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("order"));

  -[FCCKTestContentDatabaseFeedCursor subOrder](self, "subOrder");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("subOrder"));

}

- (FCCKTestContentDatabaseFeedCursor)initWithCoder:(id)a3
{
  id v4;
  FCCKTestContentDatabaseFeedCursor *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCCKTestContentDatabaseFeedCursor;
  v5 = -[FCCKTestContentDatabaseFeedCursor init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("order"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKTestContentDatabaseFeedCursor setOrder:](v5, "setOrder:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subOrder"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKTestContentDatabaseFeedCursor setSubOrder:](v5, "setSubOrder:", v7);

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)order
{
  return self->_order;
}

- (void)setOrder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)subOrder
{
  return self->_subOrder;
}

- (void)setSubOrder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subOrder, 0);
  objc_storeStrong((id *)&self->_order, 0);
}

@end
