@implementation ENEntity

- (ENEntity)initWithBundleID:(id)a3 agencyColor:(id)a4 agencyHeaderStyle:(id)a5 agencyHeaderTextColor:(id)a6 localizedAgencyName:(id)a7 localizedAgencyImageURL:(id)a8 localizedAgencyTurndownMessage:(id)a9 localizedRegionName:(id)a10 region:(id)a11
{
  id v17;
  id v18;
  ENEntity *v19;
  ENEntity *v20;
  uint64_t v21;
  NSString *bundleIdentifier;
  uint64_t v23;
  ENRegion *region;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  objc_super v33;

  v32 = a3;
  v31 = a4;
  v30 = a5;
  v29 = a6;
  v28 = a7;
  v27 = a8;
  v26 = a9;
  v17 = a10;
  v18 = a11;
  v33.receiver = self;
  v33.super_class = (Class)ENEntity;
  v19 = -[ENEntity init](&v33, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_agencyColor, a4);
    objc_storeStrong((id *)&v20->_agencyHeaderStyle, a5);
    objc_storeStrong((id *)&v20->_agencyHeaderTextColor, a6);
    objc_storeStrong((id *)&v20->_localizedAgencyName, a7);
    objc_storeStrong((id *)&v20->_localizedAgencyTurndownMessage, a9);
    objc_storeStrong((id *)&v20->_localizedAgencyImageURL, a8);
    objc_storeStrong((id *)&v20->_localizedRegionName, a10);
    v21 = objc_msgSend(v32, "copy");
    bundleIdentifier = v20->_bundleIdentifier;
    v20->_bundleIdentifier = (NSString *)v21;

    v23 = objc_msgSend(v18, "copy");
    region = v20->_region;
    v20->_region = (ENRegion *)v23;

  }
  return v20;
}

- (ENEntity)initWithBundleID:(id)a3 region:(id)a4
{
  id v6;
  id v7;
  ENEntity *v8;
  uint64_t v9;
  NSString *bundleIdentifier;
  uint64_t v11;
  ENRegion *region;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ENEntity;
  v8 = -[ENEntity init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    region = v8->_region;
    v8->_region = (ENRegion *)v11;

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ENEntity)initWithCoder:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  ENEntity *v15;
  void *v17;
  void *v18;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = a3;
  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v6 = objc_claimAutoreleasedReturnValue();

  v18 = (void *)v6;
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("agc"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("agh"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("aghc"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("agn"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("atn"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("aIu"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bun"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reg"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rgn"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[ENEntity initWithBundleID:agencyColor:agencyHeaderStyle:agencyHeaderTextColor:localizedAgencyName:localizedAgencyImageURL:localizedAgencyTurndownMessage:localizedRegionName:region:](self, "initWithBundleID:agencyColor:agencyHeaderStyle:agencyHeaderTextColor:localizedAgencyName:localizedAgencyImageURL:localizedAgencyTurndownMessage:localizedRegionName:region:", v12, v17, v7, v8, v9, v11, v10, v14, v13);
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *agencyColor;
  id v5;

  agencyColor = self->_agencyColor;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", agencyColor, CFSTR("agc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_agencyHeaderStyle, CFSTR("agh"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_agencyHeaderTextColor, CFSTR("aghc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedAgencyName, CFSTR("agn"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedAgencyTurndownMessage, CFSTR("atn"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedAgencyImageURL, CFSTR("aIu"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bun"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_region, CFSTR("reg"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedRegionName, CFSTR("rgn"));

}

- (unint64_t)hash
{
  NSUInteger v3;

  if (!-[NSString length](self->_bundleIdentifier, "length"))
    return -[ENRegion hash](self->_region, "hash");
  v3 = -[NSString hash](self->_bundleIdentifier, "hash");
  return -[ENRegion hash](self->_region, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  ENRegion *region;
  void *v7;
  ENRegion *v8;
  ENRegion *v9;
  ENRegion *v10;
  int v11;
  NSString *bundleIdentifier;
  void *v13;
  NSNumber *v14;
  NSNumber *v15;
  NSNumber *v16;
  char v17;
  NSArray *agencyColor;
  void *v19;
  NSNumber *agencyHeaderStyle;
  void *v21;
  NSNumber *v22;
  int v23;
  int v24;
  int v25;
  NSUInteger v26;
  NSString *localizedAgencyImageURL;
  void *v28;
  NSString *v29;
  NSString *v30;
  NSString *v31;
  NSArray *agencyHeaderTextColor;
  void *v33;
  int v34;
  NSUInteger v35;
  NSString *localizedAgencyName;
  void *v37;
  NSString *v38;
  NSString *v39;
  NSString *v40;
  NSUInteger v41;
  char v42;
  NSString *localizedRegionName;
  void *v44;
  NSString *v45;
  NSString *v46;
  NSString *v47;
  NSString *localizedAgencyTurndownMessage;
  void *v50;
  NSString *v51;
  NSString *v52;
  NSString *v53;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v42 = 0;
    goto LABEL_57;
  }
  v5 = v4;
  region = self->_region;
  objc_msgSend(v5, "region");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = region;
  v9 = v7;
  v10 = v9;
  if (v8 == v9)
    v11 = 1;
  else
    v11 = (v8 == 0) != (v9 != 0) && -[ENRegion isEqual:](v8, "isEqual:", v9);

  if (-[NSString length](self->_bundleIdentifier, "length"))
  {
    if (!v11)
      goto LABEL_22;
    bundleIdentifier = self->_bundleIdentifier;
    objc_msgSend(v5, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = bundleIdentifier;
    v15 = v13;
    if (v14 == v15)
    {

    }
    else
    {
      v16 = v15;
      if ((v14 == 0) == (v15 != 0))
        goto LABEL_21;
      v17 = -[NSNumber isEqual:](v14, "isEqual:", v15);

      if ((v17 & 1) == 0)
        goto LABEL_22;
    }
LABEL_16:
    agencyColor = self->_agencyColor;
    objc_msgSend(v5, "agencyColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(agencyColor) = -[NSArray isEqualToArray:](agencyColor, "isEqualToArray:", v19);

    if (!(_DWORD)agencyColor)
      goto LABEL_22;
    agencyHeaderStyle = self->_agencyHeaderStyle;
    objc_msgSend(v5, "agencyHeaderStyle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = agencyHeaderStyle;
    v22 = v21;
    if (v14 == v22)
    {

      goto LABEL_35;
    }
    v16 = v22;
    if ((v14 == 0) != (v22 != 0))
    {
      v23 = -[NSNumber isEqual:](v14, "isEqual:", v22);

      if (!v23)
        goto LABEL_22;
LABEL_35:
      agencyHeaderTextColor = self->_agencyHeaderTextColor;
      objc_msgSend(v5, "agencyHeaderTextColor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = -[NSArray isEqualToArray:](agencyHeaderTextColor, "isEqualToArray:", v33);

      v35 = -[NSString length](self->_localizedAgencyName, "length");
      if (v35)
        v25 = 0;
      else
        v25 = v34;
      if (v35 && v34)
      {
        localizedAgencyName = self->_localizedAgencyName;
        objc_msgSend(v5, "localizedAgencyName");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = localizedAgencyName;
        v39 = v37;
        v40 = v39;
        if (v38 == v39)
        {
          v25 = 1;
        }
        else if ((v38 == 0) == (v39 != 0))
        {
          v25 = 0;
        }
        else
        {
          v25 = -[NSString isEqual:](v38, "isEqual:", v39);
        }

      }
      if (-[NSString length](self->_localizedAgencyTurndownMessage, "length"))
      {
        if (!v25)
          goto LABEL_23;
        localizedAgencyTurndownMessage = self->_localizedAgencyTurndownMessage;
        objc_msgSend(v5, "localizedAgencyTurndownMessage");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = localizedAgencyTurndownMessage;
        v52 = v50;
        v53 = v52;
        if (v51 == v52)
        {
          v25 = 1;
        }
        else if ((v51 == 0) == (v52 != 0))
        {
          v25 = 0;
        }
        else
        {
          v25 = -[NSString isEqual:](v51, "isEqual:", v52);
        }

      }
LABEL_25:
      v26 = -[NSString length](self->_localizedAgencyImageURL, "length");
      if (v26)
        v24 = 0;
      else
        v24 = v25;
      if (v26 && v25)
      {
        localizedAgencyImageURL = self->_localizedAgencyImageURL;
        objc_msgSend(v5, "localizedAgencyImageURL");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = localizedAgencyImageURL;
        v30 = v28;
        v31 = v30;
        if (v29 == v30)
        {
          v24 = 1;
        }
        else if ((v29 == 0) == (v30 != 0))
        {
          v24 = 0;
        }
        else
        {
          v24 = -[NSString isEqual:](v29, "isEqual:", v30);
        }

      }
      goto LABEL_45;
    }
LABEL_21:

    goto LABEL_22;
  }
  if (v11)
    goto LABEL_16;
LABEL_22:
  -[NSString length](self->_localizedAgencyName, "length");
  if (!-[NSString length](self->_localizedAgencyTurndownMessage, "length"))
  {
    v25 = 0;
    goto LABEL_25;
  }
LABEL_23:
  -[NSString length](self->_localizedAgencyImageURL, "length");
  v24 = 0;
LABEL_45:
  v41 = -[NSString length](self->_localizedRegionName, "length");
  if (v41)
    v42 = 0;
  else
    v42 = v24;
  if (v41 && v24)
  {
    localizedRegionName = self->_localizedRegionName;
    objc_msgSend(v5, "localizedRegionName");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = localizedRegionName;
    v46 = v44;
    v47 = v46;
    if (v45 == v46)
    {
      v42 = 1;
    }
    else if ((v45 == 0) == (v46 != 0))
    {
      v42 = 0;
    }
    else
    {
      v42 = -[NSString isEqual:](v45, "isEqual:", v46);
    }

  }
LABEL_57:

  return v42;
}

- (id)description
{
  const __CFString *v2;
  const __CFString *bundleIdentifier;
  NSArray *agencyColor;
  ENRegion *region;
  const __CFString *localizedRegionName;
  const __CFString *localizedAgencyImageURL;
  const __CFString *localizedAgencyTurndownMessage;
  const __CFString *localizedAgencyName;
  NSArray *agencyHeaderTextColor;
  NSNumber *agencyHeaderStyle;

  v2 = CFSTR("<>");
  bundleIdentifier = (const __CFString *)self->_bundleIdentifier;
  agencyColor = self->_agencyColor;
  if (!bundleIdentifier)
    bundleIdentifier = CFSTR("<>");
  localizedRegionName = (const __CFString *)self->_localizedRegionName;
  region = self->_region;
  if (!region)
    region = (ENRegion *)CFSTR("<>");
  localizedAgencyTurndownMessage = (const __CFString *)self->_localizedAgencyTurndownMessage;
  localizedAgencyImageURL = (const __CFString *)self->_localizedAgencyImageURL;
  if (!localizedRegionName)
    localizedRegionName = CFSTR("<>");
  localizedAgencyName = (const __CFString *)self->_localizedAgencyName;
  if (!localizedAgencyName)
    localizedAgencyName = CFSTR("<>");
  if (!localizedAgencyTurndownMessage)
    localizedAgencyTurndownMessage = CFSTR("<>");
  if (!localizedAgencyImageURL)
    localizedAgencyImageURL = CFSTR("<>");
  if (!agencyColor)
    agencyColor = (NSArray *)CFSTR("<>");
  agencyHeaderStyle = self->_agencyHeaderStyle;
  agencyHeaderTextColor = self->_agencyHeaderTextColor;
  if (!agencyHeaderStyle)
    agencyHeaderStyle = (NSNumber *)CFSTR("<>");
  if (agencyHeaderTextColor)
    v2 = (const __CFString *)agencyHeaderTextColor;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("App: %@, Region: %@ (%@),\nPHA: %@,\nMessage: %@,\n%@,\n%@,\n%@,\n%@"), bundleIdentifier, region, localizedRegionName, localizedAgencyName, localizedAgencyTurndownMessage, localizedAgencyImageURL, agencyColor, agencyHeaderStyle, v2);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSArray)agencyColor
{
  return self->_agencyColor;
}

- (NSNumber)agencyHeaderStyle
{
  return self->_agencyHeaderStyle;
}

- (NSArray)agencyHeaderTextColor
{
  return self->_agencyHeaderTextColor;
}

- (NSString)localizedAgencyName
{
  return self->_localizedAgencyName;
}

- (NSString)localizedAgencyTurndownMessage
{
  return self->_localizedAgencyTurndownMessage;
}

- (NSString)localizedAgencyImageURL
{
  return self->_localizedAgencyImageURL;
}

- (NSString)localizedRegionName
{
  return self->_localizedRegionName;
}

- (ENRegion)region
{
  return self->_region;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_localizedRegionName, 0);
  objc_storeStrong((id *)&self->_localizedAgencyImageURL, 0);
  objc_storeStrong((id *)&self->_localizedAgencyTurndownMessage, 0);
  objc_storeStrong((id *)&self->_localizedAgencyName, 0);
  objc_storeStrong((id *)&self->_agencyHeaderTextColor, 0);
  objc_storeStrong((id *)&self->_agencyHeaderStyle, 0);
  objc_storeStrong((id *)&self->_agencyColor, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
