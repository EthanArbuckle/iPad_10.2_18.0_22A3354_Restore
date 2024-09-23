@implementation CNDonationOrigin

- (CNDonationOrigin)initWithDonationOrigin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CNDonationOrigin *v10;

  v4 = a3;
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "donationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clusterIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "donationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expirationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[CNDonationOrigin initWithBundleIdentifier:donationIdentifier:clusterIdentifier:donationDate:expirationDate:](self, "initWithBundleIdentifier:donationIdentifier:clusterIdentifier:donationDate:expirationDate:", v5, v6, v7, v8, v9);
  return v10;
}

- (CNDonationOrigin)initWithBundleIdentifier:(id)a3 donationIdentifier:(id)a4 donationDate:(id)a5 expirationDate:(id)a6
{
  return -[CNDonationOrigin initWithBundleIdentifier:donationIdentifier:clusterIdentifier:donationDate:expirationDate:](self, "initWithBundleIdentifier:donationIdentifier:clusterIdentifier:donationDate:expirationDate:", a3, a4, &stru_24C236758, a5, a6);
}

+ (id)originWithUpdatedDonationIdentifier:(id)a3 fromOrigin:(id)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(a4, "mutableCopy");
  objc_msgSend(v6, "setDonationIdentifier:", v5);

  return v6;
}

- (CNDonationOrigin)initWithBundleIdentifier:(id)a3 donationIdentifier:(id)a4 clusterIdentifier:(id)a5 donationDate:(id)a6 expirationDate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  CNDonationOrigin *v33;
  uint64_t v34;
  NSString *bundleIdentifier;
  uint64_t v36;
  NSString *donationIdentifier;
  uint64_t v38;
  NSString *clusterIdentifier;
  uint64_t v40;
  NSDate *donationDate;
  uint64_t v42;
  NSDate *expirationDate;
  CNDonationOrigin *v44;
  objc_super v46;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v12)
    goto LABEL_5;
  if (CNGuardOSLog_cn_once_token_0 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0, &__block_literal_global);
  v17 = CNGuardOSLog_cn_once_object_0;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0, OS_LOG_TYPE_FAULT))
  {
    -[CNDonationOrigin initWithBundleIdentifier:donationIdentifier:clusterIdentifier:donationDate:expirationDate:].cold.2(v17, v18, v19, v20, v21, v22, v23, v24);
    if (v13)
      goto LABEL_10;
  }
  else
  {
LABEL_5:
    if (v13)
      goto LABEL_10;
  }
  if (CNGuardOSLog_cn_once_token_0 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0, &__block_literal_global);
  v25 = CNGuardOSLog_cn_once_object_0;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0, OS_LOG_TYPE_FAULT))
    -[CNDonationOrigin initWithBundleIdentifier:donationIdentifier:clusterIdentifier:donationDate:expirationDate:].cold.1(v25, v26, v27, v28, v29, v30, v31, v32);
LABEL_10:
  if (v15)
  {
    if (v16)
      goto LABEL_12;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v16)
      goto LABEL_12;
  }
  objc_msgSend(v15, "dateByAddingTimeInterval:", 2419200.0);
  v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
  v46.receiver = self;
  v46.super_class = (Class)CNDonationOrigin;
  v33 = -[CNDonationOrigin init](&v46, sel_init);
  if (v33)
  {
    v34 = objc_msgSend(v12, "copy");
    bundleIdentifier = v33->_bundleIdentifier;
    v33->_bundleIdentifier = (NSString *)v34;

    v36 = objc_msgSend(v13, "copy");
    donationIdentifier = v33->_donationIdentifier;
    v33->_donationIdentifier = (NSString *)v36;

    if (v14)
    {
      v38 = objc_msgSend(v14, "copy");
      clusterIdentifier = v33->_clusterIdentifier;
      v33->_clusterIdentifier = (NSString *)v38;
    }
    else
    {
      clusterIdentifier = v33->_clusterIdentifier;
      v33->_clusterIdentifier = (NSString *)&stru_24C236758;
    }

    v40 = objc_msgSend(v15, "copy");
    donationDate = v33->_donationDate;
    v33->_donationDate = (NSDate *)v40;

    v42 = objc_msgSend(v16, "copy");
    expirationDate = v33->_expirationDate;
    v33->_expirationDate = (NSDate *)v42;

    v44 = v33;
  }

  return v33;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BE19248], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNDonationOrigin bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("bundleIdentifier"), v4);

  -[CNDonationOrigin donationIdentifier](self, "donationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("donationIdentifier"), v6);

  -[CNDonationOrigin clusterIdentifier](self, "clusterIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("clusterIdentifier"), v8);

  -[CNDonationOrigin donationDate](self, "donationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("donationDate"), v10);

  -[CNDonationOrigin expirationDate](self, "expirationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("expirationDate"), v12);

  objc_msgSend(v3, "build");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[CNDonationOrigin initWithDonationOrigin:]([CNMutableDonationOrigin alloc], "initWithDonationOrigin:", self);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v6 = (void *)MEMORY[0x24BE19270];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __28__CNDonationOrigin_isEqual___block_invoke;
  v24[3] = &unk_24C235F78;
  v24[4] = self;
  v25 = v4;
  v22[0] = v5;
  v22[1] = 3221225472;
  v22[2] = __28__CNDonationOrigin_isEqual___block_invoke_2;
  v22[3] = &unk_24C235F78;
  v22[4] = self;
  v7 = v25;
  v23 = v7;
  v8 = (void *)MEMORY[0x20BD1799C](v22);
  v20[0] = v5;
  v20[1] = 3221225472;
  v20[2] = __28__CNDonationOrigin_isEqual___block_invoke_3;
  v20[3] = &unk_24C235F78;
  v20[4] = self;
  v9 = v7;
  v21 = v9;
  v10 = (void *)MEMORY[0x20BD1799C](v20);
  v18[0] = v5;
  v18[1] = 3221225472;
  v18[2] = __28__CNDonationOrigin_isEqual___block_invoke_4;
  v18[3] = &unk_24C235F78;
  v18[4] = self;
  v11 = v9;
  v19 = v11;
  v12 = (void *)MEMORY[0x20BD1799C](v18);
  v16[0] = v5;
  v16[1] = 3221225472;
  v16[2] = __28__CNDonationOrigin_isEqual___block_invoke_5;
  v16[3] = &unk_24C235F78;
  v16[4] = self;
  v17 = v11;
  v13 = v11;
  v14 = (void *)MEMORY[0x20BD1799C](v16);
  LOBYTE(self) = objc_msgSend(v6, "isObject:memberOfSameClassAndEqualTo:withBlocks:", self, v13, v24, v8, v10, v12, v14, 0);

  return (char)self;
}

uint64_t __28__CNDonationOrigin_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x24BE19270];
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __28__CNDonationOrigin_isEqual___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x24BE19270];
  objc_msgSend(*(id *)(a1 + 32), "donationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "donationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __28__CNDonationOrigin_isEqual___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x24BE19270];
  objc_msgSend(*(id *)(a1 + 32), "clusterIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "clusterIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __28__CNDonationOrigin_isEqual___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x24BE19270];
  objc_msgSend(*(id *)(a1 + 32), "donationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "donationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __28__CNDonationOrigin_isEqual___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x24BE19270];
  objc_msgSend(*(id *)(a1 + 32), "expirationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "expirationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];

  v3 = (void *)MEMORY[0x24BE19288];
  v4 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __24__CNDonationOrigin_hash__block_invoke;
  v15[3] = &unk_24C235FA0;
  v15[4] = self;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __24__CNDonationOrigin_hash__block_invoke_2;
  v14[3] = &unk_24C235FA0;
  v14[4] = self;
  v5 = (void *)MEMORY[0x20BD1799C](v14, a2);
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __24__CNDonationOrigin_hash__block_invoke_3;
  v13[3] = &unk_24C235FA0;
  v13[4] = self;
  v6 = (void *)MEMORY[0x20BD1799C](v13);
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __24__CNDonationOrigin_hash__block_invoke_4;
  v12[3] = &unk_24C235FA0;
  v12[4] = self;
  v7 = (void *)MEMORY[0x20BD1799C](v12);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __24__CNDonationOrigin_hash__block_invoke_5;
  v11[3] = &unk_24C235FA0;
  v11[4] = self;
  v8 = (void *)MEMORY[0x20BD1799C](v11);
  v9 = objc_msgSend(v3, "hashWithBlocks:", v15, v5, v6, v7, v8, 0);

  return v9;
}

uint64_t __24__CNDonationOrigin_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x24BE19288];
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __24__CNDonationOrigin_hash__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x24BE19288];
  objc_msgSend(*(id *)(a1 + 32), "donationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __24__CNDonationOrigin_hash__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x24BE19288];
  objc_msgSend(*(id *)(a1 + 32), "clusterIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __24__CNDonationOrigin_hash__block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x24BE19288];
  objc_msgSend(*(id *)(a1 + 32), "donationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __24__CNDonationOrigin_hash__block_invoke_5(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x24BE19288];
  objc_msgSend(*(id *)(a1 + 32), "expirationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

- (CNDonationOrigin)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CNDonationOrigin *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_donationIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_clusterIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_donationDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_expirationDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[CNDonationOrigin initWithBundleIdentifier:donationIdentifier:clusterIdentifier:donationDate:expirationDate:](self, "initWithBundleIdentifier:donationIdentifier:clusterIdentifier:donationDate:expirationDate:", v5, v6, v7, v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleIdentifier;
  id v5;

  bundleIdentifier = self->_bundleIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bundleIdentifier, CFSTR("_bundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_donationIdentifier, CFSTR("_donationIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clusterIdentifier, CFSTR("_clusterIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_donationDate, CFSTR("_donationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("_expirationDate"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNDonationOrigin)initWithPropertyListRepresentation:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  CNDonationOrigin *v19;
  void *v22;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "objectForKeyedSubscript:", CNDonationOriginBundleIdentifierKey);
  v4 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = (void *)v4;
  else
    v5 = 0;
  v6 = v5;
  objc_opt_class();
  objc_msgSend(v3, "objectForKeyedSubscript:", CNDonationOriginDonationIdentifierKey);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;
  objc_opt_class();
  objc_msgSend(v3, "objectForKeyedSubscript:", CNDonationOriginClusterIdentifierKey);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;
  objc_opt_class();
  objc_msgSend(v3, "objectForKeyedSubscript:", CNDonationOriginDonationDateKey);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;
  objc_opt_class();
  objc_msgSend(v3, "objectForKeyedSubscript:", CNDonationOriginExpirationDateKey);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;
  v19 = -[CNDonationOrigin initWithBundleIdentifier:donationIdentifier:clusterIdentifier:donationDate:expirationDate:](self, "initWithBundleIdentifier:donationIdentifier:clusterIdentifier:donationDate:expirationDate:", v6, v9, v12, v15, v18);

  return v19;
}

- (NSDictionary)propertyListRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_24C23B950, CNDonationOriginPlistEncodingVersionKey);
  -[CNDonationOrigin bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CNDonationOriginBundleIdentifierKey);

  -[CNDonationOrigin donationIdentifier](self, "donationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CNDonationOriginDonationIdentifierKey);

  -[CNDonationOrigin clusterIdentifier](self, "clusterIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    -[CNDonationOrigin clusterIdentifier](self, "clusterIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CNDonationOriginClusterIdentifierKey);

  }
  -[CNDonationOrigin donationDate](self, "donationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CNDonationOriginDonationDateKey);

  -[CNDonationOrigin expirationDate](self, "expirationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CNDonationOriginExpirationDateKey);

  return (NSDictionary *)v3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)donationIdentifier
{
  return self->_donationIdentifier;
}

- (NSString)clusterIdentifier
{
  return self->_clusterIdentifier;
}

- (NSDate)donationDate
{
  return self->_donationDate;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_donationDate, 0);
  objc_storeStrong((id *)&self->_clusterIdentifier, 0);
  objc_storeStrong((id *)&self->_donationIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)initWithBundleIdentifier:(uint64_t)a3 donationIdentifier:(uint64_t)a4 clusterIdentifier:(uint64_t)a5 donationDate:(uint64_t)a6 expirationDate:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_209C22000, a1, a3, "parameter ‘donationIdentifier’ must be nonnull", a5, a6, a7, a8, 0);
}

- (void)initWithBundleIdentifier:(uint64_t)a3 donationIdentifier:(uint64_t)a4 clusterIdentifier:(uint64_t)a5 donationDate:(uint64_t)a6 expirationDate:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_209C22000, a1, a3, "parameter ‘bundleIdentifier’ must be nonnull", a5, a6, a7, a8, 0);
}

@end
