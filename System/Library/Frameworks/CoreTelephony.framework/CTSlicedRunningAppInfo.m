@implementation CTSlicedRunningAppInfo

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTSlicedRunningAppInfo bundleId](self, "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CTSlicedRunningAppInfo bundleId](self, "bundleId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", bundleId=[%@]"), v5);

  }
  -[CTSlicedRunningAppInfo foreground](self, "foreground");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CTSlicedRunningAppInfo foreground](self, "foreground");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", foreground=%@"), v7);

  }
  -[CTSlicedRunningAppInfo interfaces](self, "interfaces");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CTSlicedRunningAppInfo interfaces](self, "interfaces");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", interfaces=[%@]"), v9);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTSlicedRunningAppInfo bundleId](self, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CTSlicedRunningAppInfo bundleId](self, "bundleId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v4, "setBundleId:", v7);

  }
  -[CTSlicedRunningAppInfo foreground](self, "foreground");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CTSlicedRunningAppInfo foreground](self, "foreground");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v4, "setForeground:", v10);

  }
  -[CTSlicedRunningAppInfo interfaces](self, "interfaces");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CTSlicedRunningAppInfo interfaces](self, "interfaces");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v4, "setInterfaces:", v13);

  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[CTSlicedRunningAppInfo bundleId](self, "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CTSlicedRunningAppInfo bundleId](self, "bundleId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("bundleId"));

  }
  -[CTSlicedRunningAppInfo foreground](self, "foreground");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CTSlicedRunningAppInfo foreground](self, "foreground");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("foreground"));

  }
  -[CTSlicedRunningAppInfo interfaces](self, "interfaces");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CTSlicedRunningAppInfo interfaces](self, "interfaces");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("interfaces"));

  }
}

- (CTSlicedRunningAppInfo)initWithCoder:(id)a3
{
  id v4;
  CTSlicedRunningAppInfo *v5;
  uint64_t v6;
  NSString *bundleId;
  uint64_t v8;
  NSNumber *foreground;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *interfaces;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CTSlicedRunningAppInfo;
  v5 = -[CTSlicedRunningAppInfo init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleId"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("foreground"));
    v8 = objc_claimAutoreleasedReturnValue();
    foreground = v5->_foreground;
    v5->_foreground = (NSNumber *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("interfaces"));
    v13 = objc_claimAutoreleasedReturnValue();
    interfaces = v5->_interfaces;
    v5->_interfaces = (NSArray *)v13;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (NSNumber)foreground
{
  return self->_foreground;
}

- (void)setForeground:(id)a3
{
  objc_storeStrong((id *)&self->_foreground, a3);
}

- (NSArray)interfaces
{
  return self->_interfaces;
}

- (void)setInterfaces:(id)a3
{
  objc_storeStrong((id *)&self->_interfaces, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaces, 0);
  objc_storeStrong((id *)&self->_foreground, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
