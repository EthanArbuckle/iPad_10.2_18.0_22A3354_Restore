@implementation CTSlicedRunningAppInfoContainer

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTSlicedRunningAppInfoContainer appsInfo](self, "appsInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CTSlicedRunningAppInfoContainer appsInfo](self, "appsInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", appsInfo=[%@]"), v5);

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

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTSlicedRunningAppInfoContainer appsInfo](self, "appsInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CTSlicedRunningAppInfoContainer appsInfo](self, "appsInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v4, "setAppsInfo:", v7);

  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CTSlicedRunningAppInfoContainer appsInfo](self, "appsInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CTSlicedRunningAppInfoContainer appsInfo](self, "appsInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("appsInfo"));

  }
}

- (CTSlicedRunningAppInfoContainer)initWithCoder:(id)a3
{
  id v4;
  CTSlicedRunningAppInfoContainer *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *appsInfo;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTSlicedRunningAppInfoContainer;
  v5 = -[CTSlicedRunningAppInfoContainer init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("appsInfo"));
    v9 = objc_claimAutoreleasedReturnValue();
    appsInfo = v5->_appsInfo;
    v5->_appsInfo = (NSArray *)v9;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)appsInfo
{
  return self->_appsInfo;
}

- (void)setAppsInfo:(id)a3
{
  objc_storeStrong((id *)&self->_appsInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appsInfo, 0);
}

@end
