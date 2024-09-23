@implementation MKWalletMerchantLookupBankMerchantInfo

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_bankMerchantId, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSString copy](self->_bankMerchantDoingBizAsName, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  v9 = -[NSString copy](self->_bankMerchantEnhancedName, "copy");
  v10 = (void *)v4[3];
  v4[3] = v9;

  v11 = -[NSString copy](self->_bankMerchantCity, "copy");
  v12 = (void *)v4[4];
  v4[4] = v11;

  v13 = -[NSString copy](self->_bankMerchantRawCity, "copy");
  v14 = (void *)v4[5];
  v4[5] = v13;

  v15 = -[NSString copy](self->_bankMerchantState, "copy");
  v16 = (void *)v4[6];
  v4[6] = v15;

  v17 = -[NSString copy](self->_bankMerchantRawState, "copy");
  v18 = (void *)v4[7];
  v4[7] = v17;

  v19 = -[NSString copy](self->_bankMerchantZip, "copy");
  v20 = (void *)v4[8];
  v4[8] = v19;

  v21 = -[NSString copy](self->_bankMerchantAddress, "copy");
  v22 = (void *)v4[9];
  v4[9] = v21;

  v23 = -[NSString copy](self->_bankMerchantRawAddress, "copy");
  v24 = (void *)v4[10];
  v4[10] = v23;

  v25 = -[NSString copy](self->_bankMerchantCountryCode, "copy");
  v26 = (void *)v4[11];
  v4[11] = v25;

  v27 = -[NSString copy](self->_bankMerchantType, "copy");
  v28 = (void *)v4[12];
  v4[12] = v27;

  v29 = -[NSNumber copy](self->_bankMerchantCleanConfidenceLevel, "copy");
  v30 = (void *)v4[13];
  v4[13] = v29;

  v31 = -[NSString copy](self->_bankMerchantAdditionalData, "copy");
  v32 = (void *)v4[14];
  v4[14] = v31;

  v33 = -[NSString copy](self->_bankMerchantCanl, "copy");
  v34 = (void *)v4[15];
  v4[15] = v33;

  return v4;
}

- (NSString)bankMerchantId
{
  return self->_bankMerchantId;
}

- (void)setBankMerchantId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)bankMerchantDoingBizAsName
{
  return self->_bankMerchantDoingBizAsName;
}

- (void)setBankMerchantDoingBizAsName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)bankMerchantEnhancedName
{
  return self->_bankMerchantEnhancedName;
}

- (void)setBankMerchantEnhancedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)bankMerchantCity
{
  return self->_bankMerchantCity;
}

- (void)setBankMerchantCity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)bankMerchantRawCity
{
  return self->_bankMerchantRawCity;
}

- (void)setBankMerchantRawCity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)bankMerchantState
{
  return self->_bankMerchantState;
}

- (void)setBankMerchantState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)bankMerchantRawState
{
  return self->_bankMerchantRawState;
}

- (void)setBankMerchantRawState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)bankMerchantZip
{
  return self->_bankMerchantZip;
}

- (void)setBankMerchantZip:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)bankMerchantAddress
{
  return self->_bankMerchantAddress;
}

- (void)setBankMerchantAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)bankMerchantRawAddress
{
  return self->_bankMerchantRawAddress;
}

- (void)setBankMerchantRawAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)bankMerchantCountryCode
{
  return self->_bankMerchantCountryCode;
}

- (void)setBankMerchantCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)bankMerchantType
{
  return self->_bankMerchantType;
}

- (void)setBankMerchantType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)bankMerchantCleanConfidenceLevel
{
  return self->_bankMerchantCleanConfidenceLevel;
}

- (void)setBankMerchantCleanConfidenceLevel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)bankMerchantAdditionalData
{
  return self->_bankMerchantAdditionalData;
}

- (void)setBankMerchantAdditionalData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)bankMerchantCanl
{
  return self->_bankMerchantCanl;
}

- (void)setBankMerchantCanl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bankMerchantCanl, 0);
  objc_storeStrong((id *)&self->_bankMerchantAdditionalData, 0);
  objc_storeStrong((id *)&self->_bankMerchantCleanConfidenceLevel, 0);
  objc_storeStrong((id *)&self->_bankMerchantType, 0);
  objc_storeStrong((id *)&self->_bankMerchantCountryCode, 0);
  objc_storeStrong((id *)&self->_bankMerchantRawAddress, 0);
  objc_storeStrong((id *)&self->_bankMerchantAddress, 0);
  objc_storeStrong((id *)&self->_bankMerchantZip, 0);
  objc_storeStrong((id *)&self->_bankMerchantRawState, 0);
  objc_storeStrong((id *)&self->_bankMerchantState, 0);
  objc_storeStrong((id *)&self->_bankMerchantRawCity, 0);
  objc_storeStrong((id *)&self->_bankMerchantCity, 0);
  objc_storeStrong((id *)&self->_bankMerchantEnhancedName, 0);
  objc_storeStrong((id *)&self->_bankMerchantDoingBizAsName, 0);
  objc_storeStrong((id *)&self->_bankMerchantId, 0);
}

@end
