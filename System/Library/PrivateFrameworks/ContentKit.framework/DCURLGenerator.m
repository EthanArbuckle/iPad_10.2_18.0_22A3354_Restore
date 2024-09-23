@implementation DCURLGenerator

- (id)URL
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  void *v16;

  -[DCURLGenerator query](self, "query");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDBCF48];
  v5 = (void *)MEMORY[0x24BDD17C8];
  -[DCURLGenerator scheme](self, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCURLGenerator host](self, "host");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = &stru_24C4E3948;
  -[DCURLGenerator path](self, "path");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = &stru_24C4E3948;
  v13 = CFSTR("?");
  if (v3)
  {
    v14 = v3;
  }
  else
  {
    v13 = &stru_24C4E3948;
    v14 = &stru_24C4E3948;
  }
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@://%@%@%@%@"), v6, v9, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLWithString:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NSString)scheme
{
  return 0;
}

- (NSString)host
{
  return 0;
}

- (NSString)path
{
  return 0;
}

- (NSString)query
{
  return 0;
}

@end
