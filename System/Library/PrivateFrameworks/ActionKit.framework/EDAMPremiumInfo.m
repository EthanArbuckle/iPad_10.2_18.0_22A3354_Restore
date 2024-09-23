@implementation EDAMPremiumInfo

+ (id)structName
{
  return CFSTR("PremiumInfo");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  void *v16;
  _QWORD v17[12];

  v17[11] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_672;
  if (!structFields_structFields_672)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 10, 0, CFSTR("currentTime"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v16;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 2, 0, CFSTR("premium"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v15;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 2, 0, CFSTR("premiumRecurring"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 10, 1, CFSTR("premiumExpirationDate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17[3] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 2, 0, CFSTR("premiumExtendable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17[4] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 2, 0, CFSTR("premiumPending"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[5] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 7, 2, 0, CFSTR("premiumCancellationPending"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[6] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 8, 2, 0, CFSTR("canPurchaseUploadAllowance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[7] = v8;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 9, 11, 1, CFSTR("sponsoredGroupName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[8] = v9;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 10, 8, 1, CFSTR("sponsoredGroupRole"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[9] = v10;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 11, 2, 1, CFSTR("premiumUpgradable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[10] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)structFields_structFields_672;
    structFields_structFields_672 = v12;

    v2 = (void *)structFields_structFields_672;
  }
  return v2;
}

- (NSNumber)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentTime:(id)a3
{
  objc_storeStrong((id *)&self->_currentTime, a3);
}

- (NSNumber)premium
{
  return self->_premium;
}

- (void)setPremium:(id)a3
{
  objc_storeStrong((id *)&self->_premium, a3);
}

- (NSNumber)premiumRecurring
{
  return self->_premiumRecurring;
}

- (void)setPremiumRecurring:(id)a3
{
  objc_storeStrong((id *)&self->_premiumRecurring, a3);
}

- (NSNumber)premiumExpirationDate
{
  return self->_premiumExpirationDate;
}

- (void)setPremiumExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_premiumExpirationDate, a3);
}

- (NSNumber)premiumExtendable
{
  return self->_premiumExtendable;
}

- (void)setPremiumExtendable:(id)a3
{
  objc_storeStrong((id *)&self->_premiumExtendable, a3);
}

- (NSNumber)premiumPending
{
  return self->_premiumPending;
}

- (void)setPremiumPending:(id)a3
{
  objc_storeStrong((id *)&self->_premiumPending, a3);
}

- (NSNumber)premiumCancellationPending
{
  return self->_premiumCancellationPending;
}

- (void)setPremiumCancellationPending:(id)a3
{
  objc_storeStrong((id *)&self->_premiumCancellationPending, a3);
}

- (NSNumber)canPurchaseUploadAllowance
{
  return self->_canPurchaseUploadAllowance;
}

- (void)setCanPurchaseUploadAllowance:(id)a3
{
  objc_storeStrong((id *)&self->_canPurchaseUploadAllowance, a3);
}

- (NSString)sponsoredGroupName
{
  return self->_sponsoredGroupName;
}

- (void)setSponsoredGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_sponsoredGroupName, a3);
}

- (NSNumber)sponsoredGroupRole
{
  return self->_sponsoredGroupRole;
}

- (void)setSponsoredGroupRole:(id)a3
{
  objc_storeStrong((id *)&self->_sponsoredGroupRole, a3);
}

- (NSNumber)premiumUpgradable
{
  return self->_premiumUpgradable;
}

- (void)setPremiumUpgradable:(id)a3
{
  objc_storeStrong((id *)&self->_premiumUpgradable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_premiumUpgradable, 0);
  objc_storeStrong((id *)&self->_sponsoredGroupRole, 0);
  objc_storeStrong((id *)&self->_sponsoredGroupName, 0);
  objc_storeStrong((id *)&self->_canPurchaseUploadAllowance, 0);
  objc_storeStrong((id *)&self->_premiumCancellationPending, 0);
  objc_storeStrong((id *)&self->_premiumPending, 0);
  objc_storeStrong((id *)&self->_premiumExtendable, 0);
  objc_storeStrong((id *)&self->_premiumExpirationDate, 0);
  objc_storeStrong((id *)&self->_premiumRecurring, 0);
  objc_storeStrong((id *)&self->_premium, 0);
  objc_storeStrong((id *)&self->_currentTime, 0);
}

@end
