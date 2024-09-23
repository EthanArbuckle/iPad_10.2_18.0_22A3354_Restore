@implementation ASDPurchaseHistoryQuerySortOption

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

- (ASDPurchaseHistoryQuerySortOption)initWithName:(id)a3 ascending:(BOOL)a4
{
  id v6;
  ASDPurchaseHistoryQuerySortOption *v7;
  const char *v8;
  ASDPurchaseHistoryQuerySortOption *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASDPurchaseHistoryQuerySortOption;
  v7 = -[ASDPurchaseHistoryQuerySortOption init](&v11, sel_init);
  v9 = v7;
  if (v7)
  {
    objc_setProperty_atomic_copy(v7, v8, v6, 16);
    v9->_ascending = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("A"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_ascending, CFSTR("B"));

}

- (ASDPurchaseHistoryQuerySortOption)initWithCoder:(id)a3
{
  id v4;
  ASDPurchaseHistoryQuerySortOption *v5;
  uint64_t v6;
  NSString *name;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDPurchaseHistoryQuerySortOption;
  v5 = -[ASDPurchaseHistoryQuerySortOption init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("A"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_ascending = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("B"));
  }

  return v5;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)ascending
{
  return self->_ascending;
}

@end
