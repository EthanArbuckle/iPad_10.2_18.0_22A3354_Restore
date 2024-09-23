@implementation WFFileSize

- (WFFileSize)initWithByteCount:(int64_t)a3
{
  WFFileSize *v4;
  WFFileSize *v5;
  WFFileSize *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFFileSize;
  v4 = -[WFFileSize init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_byteCount = a3;
    v6 = v4;
  }

  return v5;
}

- (NSString)formattedString
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD1490], "stringFromByteCount:countStyle:", -[WFFileSize byteCount](self, "byteCount"), 0);
}

- (BOOL)isEqual:(id)a3
{
  WFFileSize *v4;
  int64_t v5;
  BOOL v6;

  v4 = (WFFileSize *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[WFFileSize byteCount](self, "byteCount");
      v6 = v5 == -[WFFileSize byteCount](v4, "byteCount");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (int64_t)compare:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int64_t v10;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithLongLong:", -[WFFileSize byteCount](self, "byteCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = objc_msgSend(v5, "byteCount");

  objc_msgSend(v7, "numberWithLongLong:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

- (unint64_t)hash
{
  return -[WFFileSize byteCount](self, "byteCount") ^ 0xCEDC;
}

- (id)wfSerializedRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8 = CFSTR("link.contentkit.filesize");
  v6 = CFSTR("byteCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_byteCount);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (WFFileSize)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("byteCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "longLongValue");
  return -[WFFileSize initWithByteCount:](self, "initWithByteCount:", v6);
}

- (void)encodeWithCoder:(id)a3
{
  void *v3;
  int64_t byteCount;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  byteCount = self->_byteCount;
  v5 = a3;
  objc_msgSend(v3, "numberWithLongLong:", byteCount);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("byteCount"));

}

- (int64_t)byteCount
{
  return self->_byteCount;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("link.contentkit.filesize"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("byteCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longLongValue");

  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithByteCount:", v7);
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
