@implementation AVTArchiverBasedStoreRoot

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AVTArchiverBasedStoreRoot)initWithDomains:(id)a3 records:(id)a4
{
  id v6;
  id v7;
  AVTArchiverBasedStoreRoot *v8;
  uint64_t v9;
  NSArray *domains;
  uint64_t v11;
  NSArray *records;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AVTArchiverBasedStoreRoot;
  v8 = -[AVTArchiverBasedStoreRoot init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    domains = v8->_domains;
    v8->_domains = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    records = v8->_records;
    v8->_records = (NSArray *)v11;

  }
  return v8;
}

- (AVTArchiverBasedStoreRoot)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  AVTArchiverBasedStoreRoot *v13;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("domains"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDBCF20];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("records"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[AVTArchiverBasedStoreRoot initWithDomains:records:](self, "initWithDomains:records:", v8, v12);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AVTArchiverBasedStoreRoot domains](self, "domains");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("domains"));

  -[AVTArchiverBasedStoreRoot records](self, "records");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("records"));

}

- (NSArray)domains
{
  return self->_domains;
}

- (NSArray)records
{
  return self->_records;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_domains, 0);
}

@end
