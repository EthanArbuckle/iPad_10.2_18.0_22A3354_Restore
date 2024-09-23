@implementation CTCarrierSpaceAppsInfo

- (CTCarrierSpaceAppsInfo)init
{
  CTCarrierSpaceAppsInfo *v2;
  CTCarrierSpaceAppsInfo *v3;
  NSArray *appsList;
  NSString *appsURL;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CTCarrierSpaceAppsInfo;
  v2 = -[CTCarrierSpaceAppsInfo init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    appsList = v2->_appsList;
    v2->_appsList = 0;

    appsURL = v3->_appsURL;
    v3->_appsURL = 0;

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCarrierSpaceAppsInfo appsList](self, "appsList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" appIdList=%@"), v4);

  -[CTCarrierSpaceAppsInfo appsURL](self, "appsURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" appsURL=%@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  CTCarrierSpaceAppsInfo *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = (CTCarrierSpaceAppsInfo *)a3;
  if (v6 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CTCarrierSpaceAppsInfo appsList](self, "appsList");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTCarrierSpaceAppsInfo appsList](v6, "appsList");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == v8
        || (-[CTCarrierSpaceAppsInfo appsList](self, "appsList"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[CTCarrierSpaceAppsInfo appsList](v6, "appsList"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqualToArray:", v4)))
      {
        -[CTCarrierSpaceAppsInfo appsURL](self, "appsURL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTCarrierSpaceAppsInfo appsURL](v6, "appsURL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 == v11)
        {
          v9 = 1;
        }
        else
        {
          -[CTCarrierSpaceAppsInfo appsURL](self, "appsURL");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[CTCarrierSpaceAppsInfo appsURL](v6, "appsURL");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v12, "isEqualToString:", v13);

        }
        if (v7 == v8)
          goto LABEL_13;
      }
      else
      {
        v9 = 0;
      }

LABEL_13:
      goto LABEL_14;
    }
    v9 = 0;
  }
LABEL_14:

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *appsList;
  id v5;

  appsList = self->_appsList;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", appsList, CFSTR("appsList"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appsURL, CFSTR("appsURL"));

}

- (CTCarrierSpaceAppsInfo)initWithCoder:(id)a3
{
  id v4;
  CTCarrierSpaceAppsInfo *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *appsList;
  uint64_t v11;
  NSString *appsURL;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTCarrierSpaceAppsInfo;
  v5 = -[CTCarrierSpaceAppsInfo init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("appsList"));
    v9 = objc_claimAutoreleasedReturnValue();
    appsList = v5->_appsList;
    v5->_appsList = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appsURL"));
    v11 = objc_claimAutoreleasedReturnValue();
    appsURL = v5->_appsURL;
    v5->_appsURL = (NSString *)v11;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)appsList
{
  return self->_appsList;
}

- (void)setAppsList:(id)a3
{
  objc_storeStrong((id *)&self->_appsList, a3);
}

- (NSString)appsURL
{
  return self->_appsURL;
}

- (void)setAppsURL:(id)a3
{
  objc_storeStrong((id *)&self->_appsURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appsURL, 0);
  objc_storeStrong((id *)&self->_appsList, 0);
}

@end
