@implementation CTDataUsagePolicies

- (id)init:(id)a3 withCellularPolicy:(int64_t)a4 andWifiPolicy:(int64_t)a5
{
  return -[CTDataUsagePolicies init:withCellularPolicy:wifiPolicy:isManaged:andIsRestricted:](self, "init:withCellularPolicy:wifiPolicy:isManaged:andIsRestricted:", a3, a4, a5, 0, 0);
}

- (id)init:(id)a3 withCellularPolicy:(int64_t)a4 wifiPolicy:(int64_t)a5 isManaged:(BOOL)a6 andIsRestricted:(BOOL)a7
{
  id v13;
  CTDataUsagePolicies *v14;
  CTDataUsagePolicies *v15;
  objc_super v17;

  v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CTDataUsagePolicies;
  v14 = -[CTDataUsagePolicies init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_bundleId, a3);
    v15->_cellular = a4;
    v15->_wifi = a5;
    v15->_isManaged = a6;
    v15->_isRestricted = a7;
  }

  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t v5;
  __CFString *v6;
  __CFString *v7;
  int64_t v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  const __CFString *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CTDataUsagePolicies bundleId](self, "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CTDataUsagePolicies cellular](self, "cellular");
  if (v5 == 1)
    v6 = CFSTR("Allowed");
  else
    v6 = CFSTR("???");
  if (!v5)
    v6 = CFSTR("Denied");
  v7 = v6;
  v8 = -[CTDataUsagePolicies wifi](self, "wifi");
  if (v8 == 1)
    v9 = CFSTR("Allowed");
  else
    v9 = CFSTR("???");
  if (!v8)
    v9 = CFSTR("Denied");
  v10 = v9;
  if (-[CTDataUsagePolicies isManaged](self, "isManaged"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  v12 = v11;
  if (-[CTDataUsagePolicies isRestricted](self, "isRestricted"))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Data Usage Policy: %@ cellular(%@) wifi(%@) isManaged(%@) isRestricted(%@)"), v4, v7, v10, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int64_t v7;
  int64_t v8;
  int v9;
  int v10;
  char v11;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    v7 = -[CTDataUsagePolicies cellular](self, "cellular");
    if (v7 == objc_msgSend(v6, "cellular")
      && (v8 = -[CTDataUsagePolicies wifi](self, "wifi"), v8 == objc_msgSend(v6, "wifi"))
      && (v9 = -[CTDataUsagePolicies isManaged](self, "isManaged"), v9 == objc_msgSend(v6, "isManaged"))
      && (v10 = -[CTDataUsagePolicies isRestricted](self, "isRestricted"),
          v10 == objc_msgSend(v6, "isRestricted")))
    {
      -[CTDataUsagePolicies bundleId](self, "bundleId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bundleId");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v13, "isEqualToString:", v14);

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

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CTDataUsagePolicies bundleId](self, "bundleId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[CTDataUsagePolicies bundleId](self, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "init:withCellularPolicy:wifiPolicy:isManaged:andIsRestricted:", v5, -[CTDataUsagePolicies cellular](self, "cellular"), -[CTDataUsagePolicies wifi](self, "wifi"), -[CTDataUsagePolicies isManaged](self, "isManaged"), -[CTDataUsagePolicies isRestricted](self, "isRestricted"));

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[CTDataUsagePolicies bundleId](self, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleId"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CTDataUsagePolicies cellular](self, "cellular"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("cellularKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CTDataUsagePolicies wifi](self, "wifi"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("wifiKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CTDataUsagePolicies isManaged](self, "isManaged"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("isManagedKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CTDataUsagePolicies isRestricted](self, "isRestricted"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("isRestrictedKey"));

}

- (CTDataUsagePolicies)initWithCoder:(id)a3
{
  id v4;
  CTDataUsagePolicies *v5;
  uint64_t v6;
  NSString *bundleId;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTDataUsagePolicies;
  v5 = -[CTDataUsagePolicies init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleId"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cellularKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_cellular = objc_msgSend(v8, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wifiKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_wifi = objc_msgSend(v9, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isManagedKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isManaged = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isRestrictedKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isRestricted = objc_msgSend(v11, "BOOLValue");

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

- (int64_t)cellular
{
  return self->_cellular;
}

- (void)setCellular:(int64_t)a3
{
  self->_cellular = a3;
}

- (int64_t)wifi
{
  return self->_wifi;
}

- (void)setWifi:(int64_t)a3
{
  self->_wifi = a3;
}

- (BOOL)isManaged
{
  return self->_isManaged;
}

- (void)setIsManaged:(BOOL)a3
{
  self->_isManaged = a3;
}

- (BOOL)isRestricted
{
  return self->_isRestricted;
}

- (void)setIsRestricted:(BOOL)a3
{
  self->_isRestricted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
