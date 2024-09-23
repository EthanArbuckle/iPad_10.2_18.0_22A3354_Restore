@implementation CRKOpenURLRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKOpenURLRequest)initWithCoder:(id)a3
{
  id v4;
  CRKOpenURLRequest *v5;
  void *v6;
  uint64_t v7;
  NSURL *URL;
  void *v9;
  uint64_t v10;
  NSString *URLDisplayName;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSArray *handlingBundleIdentifiers;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CRKOpenURLRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("URL"));
    v7 = objc_claimAutoreleasedReturnValue();
    URL = v5->_URL;
    v5->_URL = (NSURL *)v7;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("URLDisplayName"));
    v10 = objc_claimAutoreleasedReturnValue();
    URLDisplayName = v5->_URLDisplayName;
    v5->_URLDisplayName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lockInApp"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_lockInApp = objc_msgSend(v12, "BOOLValue");

    v13 = (void *)MEMORY[0x24BDBCF20];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("handlingBundleIdentifiers"));
    v16 = objc_claimAutoreleasedReturnValue();
    handlingBundleIdentifiers = v5->_handlingBundleIdentifiers;
    v5->_handlingBundleIdentifiers = (NSArray *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRKOpenURLRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[CRKOpenURLRequest URL](self, "URL", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("URL"));

  -[CRKOpenURLRequest URLDisplayName](self, "URLDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("URLDisplayName"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKOpenURLRequest lockInApp](self, "lockInApp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("lockInApp"));

  -[CRKOpenURLRequest handlingBundleIdentifiers](self, "handlingBundleIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("handlingBundleIdentifiers"));

}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)URLDisplayName
{
  return self->_URLDisplayName;
}

- (void)setURLDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)lockInApp
{
  return self->_lockInApp;
}

- (void)setLockInApp:(BOOL)a3
{
  self->_lockInApp = a3;
}

- (NSArray)handlingBundleIdentifiers
{
  return self->_handlingBundleIdentifiers;
}

- (void)setHandlingBundleIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlingBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_URLDisplayName, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
