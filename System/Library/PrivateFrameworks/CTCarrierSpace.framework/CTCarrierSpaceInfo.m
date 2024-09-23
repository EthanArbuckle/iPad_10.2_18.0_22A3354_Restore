@implementation CTCarrierSpaceInfo

- (CTCarrierSpaceInfo)init
{
  CTCarrierSpaceInfo *v2;
  CTCarrierSpaceInfo *v3;
  CTCarrierSpaceUsageInfo *usageInfo;
  CTCarrierSpacePlansInfo *plansInfo;
  CTCarrierSpaceAppsInfo *appsInfo;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CTCarrierSpaceInfo;
  v2 = -[CTCarrierSpaceInfo init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    usageInfo = v2->_usageInfo;
    v2->_usageInfo = 0;

    plansInfo = v3->_plansInfo;
    v3->_plansInfo = 0;

    appsInfo = v3->_appsInfo;
    v3->_appsInfo = 0;

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCarrierSpaceInfo usageInfo](self, "usageInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" usageInfo=%@"), v4);

  -[CTCarrierSpaceInfo plansInfo](self, "plansInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" plansInfo=%@"), v5);

  -[CTCarrierSpaceInfo appsInfo](self, "appsInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" appsInfo=%@"), v6);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CTCarrierSpaceInfo *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (CTCarrierSpaceInfo *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CTCarrierSpaceInfo usageInfo](self, "usageInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTCarrierSpaceInfo usageInfo](v4, "usageInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqual:", v6))
      {
        -[CTCarrierSpaceInfo plansInfo](self, "plansInfo");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTCarrierSpaceInfo plansInfo](v4, "plansInfo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "isEqual:", v8))
        {
          -[CTCarrierSpaceInfo appsInfo](self, "appsInfo");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[CTCarrierSpaceInfo appsInfo](v4, "appsInfo");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "isEqual:", v10);

        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  CTCarrierSpaceUsageInfo *usageInfo;
  id v5;

  usageInfo = self->_usageInfo;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", usageInfo, CFSTR("usageInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_plansInfo, CFSTR("plansInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appsInfo, CFSTR("appsInfo"));

}

- (CTCarrierSpaceInfo)initWithCoder:(id)a3
{
  id v4;
  CTCarrierSpaceInfo *v5;
  uint64_t v6;
  CTCarrierSpaceUsageInfo *usageInfo;
  uint64_t v8;
  CTCarrierSpacePlansInfo *plansInfo;
  uint64_t v10;
  CTCarrierSpaceAppsInfo *appsInfo;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTCarrierSpaceInfo;
  v5 = -[CTCarrierSpaceInfo init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("usageInfo"));
    v6 = objc_claimAutoreleasedReturnValue();
    usageInfo = v5->_usageInfo;
    v5->_usageInfo = (CTCarrierSpaceUsageInfo *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("plansInfo"));
    v8 = objc_claimAutoreleasedReturnValue();
    plansInfo = v5->_plansInfo;
    v5->_plansInfo = (CTCarrierSpacePlansInfo *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appsInfo"));
    v10 = objc_claimAutoreleasedReturnValue();
    appsInfo = v5->_appsInfo;
    v5->_appsInfo = (CTCarrierSpaceAppsInfo *)v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTCarrierSpaceUsageInfo)usageInfo
{
  return self->_usageInfo;
}

- (void)setUsageInfo:(id)a3
{
  objc_storeStrong((id *)&self->_usageInfo, a3);
}

- (CTCarrierSpacePlansInfo)plansInfo
{
  return self->_plansInfo;
}

- (void)setPlansInfo:(id)a3
{
  objc_storeStrong((id *)&self->_plansInfo, a3);
}

- (CTCarrierSpaceAppsInfo)appsInfo
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
  objc_storeStrong((id *)&self->_plansInfo, 0);
  objc_storeStrong((id *)&self->_usageInfo, 0);
}

@end
