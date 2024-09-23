@implementation NSSUsageDataSizeCategory

- (NSSUsageDataSizeCategory)initWithIdentifier:(id)a3 size:(id)a4 name:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSSUsageDataSizeCategory *v12;
  NSSUsageDataSizeCategory *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)NSSUsageDataSizeCategory;
  v12 = -[NSSUsageDataSizeCategory init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a5);
    objc_storeStrong((id *)&v13->_size, a4);
    objc_storeStrong((id *)&v13->_categoryIdentifier, a3);
  }

  return v13;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (NSSSizeVector)size
{
  return self->_size;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
