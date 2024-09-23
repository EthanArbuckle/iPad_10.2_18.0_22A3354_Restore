@implementation MXHistogram

- (MXHistogram)initWithHistogramBucketData:(id)a3
{
  id v5;
  MXHistogram *v6;
  MXHistogram *v7;
  MXHistogram *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MXHistogram;
  v6 = -[MXHistogram init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    if (!v5)
    {
      v8 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v6->_histogramData, a3);
    v7->_totalBucketCount = -[NSArray count](v7->_histogramData, "count");
  }
  v8 = v7;
LABEL_6:

  return v8;
}

- (NSEnumerator)bucketEnumerator
{
  return -[NSArray objectEnumerator](self->_histogramData, "objectEnumerator");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *histogramData;
  id v5;
  id v6;

  histogramData = self->_histogramData;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", histogramData, CFSTR("histogramValue"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_totalBucketCount);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("histogramNumBuckets"));

}

- (MXHistogram)initWithCoder:(id)a3
{
  id v4;
  MXHistogram *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *histogramData;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MXHistogram;
  v5 = -[MXHistogram init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("histogramValue"));
    v9 = objc_claimAutoreleasedReturnValue();
    histogramData = v5->_histogramData;
    v5->_histogramData = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("histogramNumBuckets"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_totalBucketCount = objc_msgSend(v11, "unsignedIntegerValue");

  }
  return v5;
}

- (id)toDictionary
{
  id v3;
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_totalBucketCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v3;
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("histogramNumBuckets"));

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_histogramData;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11), "toDictionary");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v9 + v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringValue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v12, v14);

        ++v11;
      }
      while (v8 != v11);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v9 = (v9 + v11);
    }
    while (v8);
  }

  objc_msgSend(v16, "setObject:forKey:", v4, CFSTR("histogramValue"));
  return v16;
}

- (NSUInteger)totalBucketCount
{
  return self->_totalBucketCount;
}

- (NSArray)histogramData
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_histogramData, 0);
}

@end
