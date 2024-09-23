@implementation NSMutableHTTPCookie2

- (NSMutableHTTPCookie2)initWithName:(id)a3 value:(id)a4 domain:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSMutableHTTPCookie2;
  return -[NSHTTPCookie2 initWithName:value:domain:](&v6, sel_initWithName_value_domain_, a3, a4, a5);
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->super._name, a3);
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->super._value, a3);
}

- (void)setDomain:(id)a3
{
  NSString *v4;
  void *domain;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *etldPlusOne;
  id v10;

  v10 = a3;
  if ((objc_msgSend(v10, "hasPrefix:", CFSTR(".")) & 1) != 0)
  {
    objc_msgSend(v10, "lowercaseString");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    domain = self->super._domain;
    self->super._domain = v4;
  }
  else
  {
    objc_msgSend(CFSTR("."), "stringByAppendingString:", v10);
    domain = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(domain, "lowercaseString");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = self->super._domain;
    self->super._domain = v6;

  }
  +[NSHTTPCookieStorageUtils getEffectiveTLDPlusOne:]((uint64_t)NSHTTPCookieStorageUtils, self->super._domain);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  etldPlusOne = self->super._etldPlusOne;
  self->super._etldPlusOne = v8;

}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->super._path, a3);
}

- (void)setSameSite:(int64_t)a3
{
  self->super._sameSite = a3;
}

- (void)setSecure:(BOOL)a3
{
  self->super._secure = a3;
}

- (void)setHostOnly:(BOOL)a3
{
  self->super._hostOnly = a3;
}

- (void)setHttpOnly:(BOOL)a3
{
  self->super._httpOnly = a3;
}

- (void)setPartition:(id)a3
{
  objc_storeStrong((id *)&self->super._partition, a3);
}

- (void)setExpirationDate:(id)a3
{
  id v4;
  BOOL v5;
  double v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    objc_msgSend(v4, "timeIntervalSince1970");
    v5 = 0;
    self->super._sExpirationDate = vcvtad_u64_f64(v6);
    v4 = v7;
  }
  else
  {
    v5 = 1;
  }
  self->super._session = v5;

}

- (void)setSource:(int64_t)a3
{
  self->super._source = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  void *v6;
  NSString *path;
  void *v8;
  NSString *domain;
  void *v10;
  NSString *partition;
  NSString *v12;
  NSString *v13;
  void *v14;
  int hostOnly;
  int secure;
  int64_t sameSite;
  int httpOnly;
  BOOL v19;

  v4 = a3;
  name = self->super._name;
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(name) = -[NSString isEqualToString:](name, "isEqualToString:", v6);

  if ((name & 1) == 0)
    goto LABEL_12;
  path = self->super._path;
  objc_msgSend(v4, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(path) = -[NSString isEqualToString:](path, "isEqualToString:", v8);

  if ((path & 1) == 0)
    goto LABEL_12;
  domain = self->super._domain;
  objc_msgSend(v4, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(domain) = -[NSString isEqualToString:](domain, "isEqualToString:", v10);

  if ((domain & 1) == 0)
    goto LABEL_12;
  partition = self->super._partition;
  objc_msgSend(v4, "partition");
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (partition == v12)
  {

  }
  else
  {
    v13 = self->super._partition;
    objc_msgSend(v4, "partition");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v13) = -[NSString isEqualToString:](v13, "isEqualToString:", v14);

    if ((v13 & 1) == 0)
    {
LABEL_12:
      v19 = 0;
      goto LABEL_13;
    }
  }
  hostOnly = self->super._hostOnly;
  if (hostOnly != objc_msgSend(v4, "hostOnly"))
    goto LABEL_12;
  secure = self->super._secure;
  if (secure != objc_msgSend(v4, "secure"))
    goto LABEL_12;
  sameSite = self->super._sameSite;
  if (sameSite != objc_msgSend(v4, "sameSite"))
    goto LABEL_12;
  httpOnly = self->super._httpOnly;
  v19 = httpOnly == objc_msgSend(v4, "httpOnly");
LABEL_13:

  return v19;
}

@end
