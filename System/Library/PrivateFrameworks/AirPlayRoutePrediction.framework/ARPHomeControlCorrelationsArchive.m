@implementation ARPHomeControlCorrelationsArchive

- (ARPHomeControlCorrelationsArchive)initWithMicrolocationsCorrelationsDictionary:(id)a3 nextActionCorrelationsDictionary:(id)a4 archiveDate:(id)a5
{
  id v9;
  id v10;
  id v11;
  ARPHomeControlCorrelationsArchive *v12;
  ARPHomeControlCorrelationsArchive *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ARPHomeControlCorrelationsArchive;
  v12 = -[ARPHomeControlCorrelationsArchive init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_microlocationCorrelationsDictionary, a3);
    objc_storeStrong((id *)&v13->_nextActionCorrelationsDictionary, a4);
    objc_storeStrong((id *)&v13->_archiveDate, a5);
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[ARPHomeControlCorrelationsArchive microlocationCorrelationsDictionary](self, "microlocationCorrelationsDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPHomeControlCorrelationsArchive nextActionCorrelationsDictionary](self, "nextActionCorrelationsDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARPHomeControlCorrelationsArchive archiveDate](self, "archiveDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithMicrolocationsCorrelationsDictionary:nextActionCorrelationsDictionary:archiveDate:", v5, v6, v7);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[ARPHomeControlCorrelationsArchive microlocationCorrelationsDictionary](self, "microlocationCorrelationsDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_microlocationCorrelationsDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[ARPHomeControlCorrelationsArchive nextActionCorrelationsDictionary](self, "nextActionCorrelationsDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_nextActionCorrelationsDictionary);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[ARPHomeControlCorrelationsArchive archiveDate](self, "archiveDate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_archiveDate);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, v9);

}

- (ARPHomeControlCorrelationsArchive)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  ARPHomeControlCorrelationsArchive *v17;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_microlocationCorrelationsDictionary);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_nextActionCorrelationsDictionary);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_archiveDate);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v10, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[ARPHomeControlCorrelationsArchive initWithMicrolocationsCorrelationsDictionary:nextActionCorrelationsDictionary:archiveDate:](self, "initWithMicrolocationsCorrelationsDictionary:nextActionCorrelationsDictionary:archiveDate:", v12, v14, v16);
  return v17;
}

- (NSDate)archiveDate
{
  return self->_archiveDate;
}

- (NSDictionary)microlocationCorrelationsDictionary
{
  return self->_microlocationCorrelationsDictionary;
}

- (NSDictionary)nextActionCorrelationsDictionary
{
  return self->_nextActionCorrelationsDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextActionCorrelationsDictionary, 0);
  objc_storeStrong((id *)&self->_microlocationCorrelationsDictionary, 0);
  objc_storeStrong((id *)&self->_archiveDate, 0);
}

@end
