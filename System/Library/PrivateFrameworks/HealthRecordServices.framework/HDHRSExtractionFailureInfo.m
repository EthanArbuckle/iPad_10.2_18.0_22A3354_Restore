@implementation HDHRSExtractionFailureInfo

- (HDHRSExtractionFailureInfo)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HDHRSExtractionFailureInfo;
  return -[HDHRSExtractionFailureInfo init](&v3, sel_init);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDHRSExtractionFailureInfo)initWithCoder:(id)a3
{
  id v4;
  HDHRSExtractionFailureInfo *v5;
  void *v6;
  uint64_t v7;
  NSMutableArray *failureRecords;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDHRSExtractionFailureInfo;
  v5 = -[HDHRSExtractionFailureInfo init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "hk_typesForArrayOf:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("FailureRecords"));
    v7 = objc_claimAutoreleasedReturnValue();
    failureRecords = v5->_failureRecords;
    v5->_failureRecords = (NSMutableArray *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_failureRecords, CFSTR("FailureRecords"));
}

- (void)addFailureRecord:(id)a3
{
  id v4;
  NSMutableArray *failureRecords;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  failureRecords = self->_failureRecords;
  v8 = v4;
  if (!failureRecords)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_failureRecords;
    self->_failureRecords = v6;

    v4 = v8;
    failureRecords = self->_failureRecords;
  }
  -[NSMutableArray addObject:](failureRecords, "addObject:", v4);

}

- (NSArray)failureRecords
{
  NSMutableArray *failureRecords;

  failureRecords = self->_failureRecords;
  if (failureRecords)
    return (NSArray *)(id)-[NSMutableArray copy](failureRecords, "copy");
  else
    return (NSArray *)MEMORY[0x24BDBD1A8];
}

- (id)description
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = -[NSMutableArray count](self->_failureRecords, "count");
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_opt_class();
  v6 = v5;
  if (v3)
  {
    -[NSMutableArray hk_map:](self->_failureRecords, "hk_map:", &__block_literal_global_6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR("\n\t"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p>\n\t%@"), v6, self, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p> (no failure records)"), v5, self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

uint64_t __41__HDHRSExtractionFailureInfo_description__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "description");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureRecords, 0);
}

@end
