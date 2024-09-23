@implementation FKBankMerchantInformationInsight

- (FKBankMerchantInformationInsight)initWithCategoryDescription:(id)a3 merchantAddress:(id)a4 merchantCategoryCode:(id)a5 merchantName:(id)a6 merchantNumber:(id)a7 standardIndustrialClassificationCode:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  FKBankMerchantInformationInsight *v20;
  uint64_t v21;
  NSString *categoryDescription;
  uint64_t v23;
  CNPostalAddress *merchantAddress;
  uint64_t v25;
  NSNumber *merchantCategoryCode;
  uint64_t v27;
  NSString *merchantName;
  uint64_t v29;
  NSString *merchantNumber;
  uint64_t v31;
  NSString *standardIndustrialClassificationCode;
  objc_super v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)FKBankMerchantInformationInsight;
  v20 = -[FKBankMerchantInformationInsight init](&v34, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v14, "copy");
    categoryDescription = v20->_categoryDescription;
    v20->_categoryDescription = (NSString *)v21;

    v23 = objc_msgSend(v15, "copy");
    merchantAddress = v20->_merchantAddress;
    v20->_merchantAddress = (CNPostalAddress *)v23;

    v25 = objc_msgSend(v16, "copy");
    merchantCategoryCode = v20->_merchantCategoryCode;
    v20->_merchantCategoryCode = (NSNumber *)v25;

    v27 = objc_msgSend(v17, "copy");
    merchantName = v20->_merchantName;
    v20->_merchantName = (NSString *)v27;

    v29 = objc_msgSend(v18, "copy");
    merchantNumber = v20->_merchantNumber;
    v20->_merchantNumber = (NSString *)v29;

    v31 = objc_msgSend(v19, "copy");
    standardIndustrialClassificationCode = v20->_standardIndustrialClassificationCode;
    v20->_standardIndustrialClassificationCode = (NSString *)v31;

  }
  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSString copyWithZone:](self->_categoryDescription, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[CNPostalAddress copyWithZone:](self->_merchantAddress, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSNumber copyWithZone:](self->_merchantCategoryCode, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSString copyWithZone:](self->_merchantName, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  v14 = -[NSString copyWithZone:](self->_merchantNumber, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  v16 = -[NSString copyWithZone:](self->_standardIndustrialClassificationCode, "copyWithZone:", a3);
  v17 = (void *)v5[6];
  v5[6] = v16;

  return v5;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "safelyAddObject:", self->_categoryDescription);
  objc_msgSend(v3, "safelyAddObject:", self->_merchantAddress);
  objc_msgSend(v3, "safelyAddObject:", self->_merchantCategoryCode);
  objc_msgSend(v3, "safelyAddObject:", self->_merchantName);
  objc_msgSend(v3, "safelyAddObject:", self->_merchantNumber);
  objc_msgSend(v3, "safelyAddObject:", self->_standardIndustrialClassificationCode);
  v4 = FKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  FKBankMerchantInformationInsight *v4;
  FKBankMerchantInformationInsight *v5;
  void **v6;
  char v7;

  v4 = (FKBankMerchantInformationInsight *)a3;
  v5 = v4;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (FKEqualObjects(self->_categoryDescription, v6[1])
      && FKEqualObjects(self->_merchantAddress, v6[2])
      && FKEqualObjects(self->_merchantCategoryCode, v6[3])
      && FKEqualObjects(self->_merchantName, v6[4])
      && FKEqualObjects(self->_merchantNumber, v6[5]))
    {
      v7 = FKEqualObjects(self->_standardIndustrialClassificationCode, v6[6]);
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)categoryDescription
{
  return self->_categoryDescription;
}

- (void)setCategoryDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CNPostalAddress)merchantAddress
{
  return self->_merchantAddress;
}

- (void)setMerchantAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)merchantCategoryCode
{
  return self->_merchantCategoryCode;
}

- (void)setMerchantCategoryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)merchantName
{
  return self->_merchantName;
}

- (void)setMerchantName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)merchantNumber
{
  return self->_merchantNumber;
}

- (void)setMerchantNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)standardIndustrialClassificationCode
{
  return self->_standardIndustrialClassificationCode;
}

- (void)setStandardIndustrialClassificationCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_standardIndustrialClassificationCode, 0);
  objc_storeStrong((id *)&self->_merchantNumber, 0);
  objc_storeStrong((id *)&self->_merchantName, 0);
  objc_storeStrong((id *)&self->_merchantCategoryCode, 0);
  objc_storeStrong((id *)&self->_merchantAddress, 0);
  objc_storeStrong((id *)&self->_categoryDescription, 0);
}

@end
