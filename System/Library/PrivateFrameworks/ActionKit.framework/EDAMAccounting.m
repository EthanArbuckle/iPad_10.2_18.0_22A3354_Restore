@implementation EDAMAccounting

+ (id)structName
{
  return CFSTR("Accounting");
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
  void *v12;
  uint64_t v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[27];

  v31[25] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_384;
  if (!structFields_structFields_384)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 10, 1, CFSTR("uploadLimit"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v30;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 10, 1, CFSTR("uploadLimitEnd"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v29;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 10, 1, CFSTR("uploadLimitNextMonth"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2] = v28;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 4, 8, 1, CFSTR("premiumServiceStatus"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v31[3] = v27;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 5, 11, 1, CFSTR("premiumOrderNumber"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31[4] = v26;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 6, 11, 1, CFSTR("premiumCommerceService"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v31[5] = v25;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 7, 10, 1, CFSTR("premiumServiceStart"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v31[6] = v24;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 8, 11, 1, CFSTR("premiumServiceSKU"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v31[7] = v23;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 9, 10, 1, CFSTR("lastSuccessfulCharge"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v31[8] = v22;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 10, 10, 1, CFSTR("lastFailedCharge"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v31[9] = v21;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 11, 11, 1, CFSTR("lastFailedChargeReason"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v31[10] = v20;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 12, 10, 1, CFSTR("nextPaymentDue"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v31[11] = v19;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 13, 10, 1, CFSTR("premiumLockUntil"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31[12] = v18;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 14, 10, 1, CFSTR("updated"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31[13] = v17;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 16, 11, 1, CFSTR("premiumSubscriptionNumber"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31[14] = v16;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 17, 10, 1, CFSTR("lastRequestedCharge"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v31[15] = v3;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 18, 11, 1, CFSTR("currency"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v31[16] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 19, 8, 1, CFSTR("unitPrice"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v31[17] = v5;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 20, 8, 1, CFSTR("businessId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v31[18] = v6;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 21, 11, 1, CFSTR("businessName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v31[19] = v7;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 22, 8, 1, CFSTR("businessRole"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v31[20] = v8;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 23, 8, 1, CFSTR("unitDiscount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v31[21] = v9;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 24, 10, 1, CFSTR("nextChargeDate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v31[22] = v10;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 25, 8, 1, CFSTR("availablePoints"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v31[23] = v11;
    +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 26, 12, 1, CFSTR("backupPaymentInfo"), objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v31[24] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 25);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)structFields_structFields_384;
    structFields_structFields_384 = v13;

    v2 = (void *)structFields_structFields_384;
  }
  return v2;
}

- (NSNumber)uploadLimit
{
  return self->_uploadLimit;
}

- (void)setUploadLimit:(id)a3
{
  objc_storeStrong((id *)&self->_uploadLimit, a3);
}

- (NSNumber)uploadLimitEnd
{
  return self->_uploadLimitEnd;
}

- (void)setUploadLimitEnd:(id)a3
{
  objc_storeStrong((id *)&self->_uploadLimitEnd, a3);
}

- (NSNumber)uploadLimitNextMonth
{
  return self->_uploadLimitNextMonth;
}

- (void)setUploadLimitNextMonth:(id)a3
{
  objc_storeStrong((id *)&self->_uploadLimitNextMonth, a3);
}

- (NSNumber)premiumServiceStatus
{
  return self->_premiumServiceStatus;
}

- (void)setPremiumServiceStatus:(id)a3
{
  objc_storeStrong((id *)&self->_premiumServiceStatus, a3);
}

- (NSString)premiumOrderNumber
{
  return self->_premiumOrderNumber;
}

- (void)setPremiumOrderNumber:(id)a3
{
  objc_storeStrong((id *)&self->_premiumOrderNumber, a3);
}

- (NSString)premiumCommerceService
{
  return self->_premiumCommerceService;
}

- (void)setPremiumCommerceService:(id)a3
{
  objc_storeStrong((id *)&self->_premiumCommerceService, a3);
}

- (NSNumber)premiumServiceStart
{
  return self->_premiumServiceStart;
}

- (void)setPremiumServiceStart:(id)a3
{
  objc_storeStrong((id *)&self->_premiumServiceStart, a3);
}

- (NSString)premiumServiceSKU
{
  return self->_premiumServiceSKU;
}

- (void)setPremiumServiceSKU:(id)a3
{
  objc_storeStrong((id *)&self->_premiumServiceSKU, a3);
}

- (NSNumber)lastSuccessfulCharge
{
  return self->_lastSuccessfulCharge;
}

- (void)setLastSuccessfulCharge:(id)a3
{
  objc_storeStrong((id *)&self->_lastSuccessfulCharge, a3);
}

- (NSNumber)lastFailedCharge
{
  return self->_lastFailedCharge;
}

- (void)setLastFailedCharge:(id)a3
{
  objc_storeStrong((id *)&self->_lastFailedCharge, a3);
}

- (NSString)lastFailedChargeReason
{
  return self->_lastFailedChargeReason;
}

- (void)setLastFailedChargeReason:(id)a3
{
  objc_storeStrong((id *)&self->_lastFailedChargeReason, a3);
}

- (NSNumber)nextPaymentDue
{
  return self->_nextPaymentDue;
}

- (void)setNextPaymentDue:(id)a3
{
  objc_storeStrong((id *)&self->_nextPaymentDue, a3);
}

- (NSNumber)premiumLockUntil
{
  return self->_premiumLockUntil;
}

- (void)setPremiumLockUntil:(id)a3
{
  objc_storeStrong((id *)&self->_premiumLockUntil, a3);
}

- (NSNumber)updated
{
  return self->_updated;
}

- (void)setUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_updated, a3);
}

- (NSString)premiumSubscriptionNumber
{
  return self->_premiumSubscriptionNumber;
}

- (void)setPremiumSubscriptionNumber:(id)a3
{
  objc_storeStrong((id *)&self->_premiumSubscriptionNumber, a3);
}

- (NSNumber)lastRequestedCharge
{
  return self->_lastRequestedCharge;
}

- (void)setLastRequestedCharge:(id)a3
{
  objc_storeStrong((id *)&self->_lastRequestedCharge, a3);
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
  objc_storeStrong((id *)&self->_currency, a3);
}

- (NSNumber)unitPrice
{
  return self->_unitPrice;
}

- (void)setUnitPrice:(id)a3
{
  objc_storeStrong((id *)&self->_unitPrice, a3);
}

- (NSNumber)businessId
{
  return self->_businessId;
}

- (void)setBusinessId:(id)a3
{
  objc_storeStrong((id *)&self->_businessId, a3);
}

- (NSString)businessName
{
  return self->_businessName;
}

- (void)setBusinessName:(id)a3
{
  objc_storeStrong((id *)&self->_businessName, a3);
}

- (NSNumber)businessRole
{
  return self->_businessRole;
}

- (void)setBusinessRole:(id)a3
{
  objc_storeStrong((id *)&self->_businessRole, a3);
}

- (NSNumber)unitDiscount
{
  return self->_unitDiscount;
}

- (void)setUnitDiscount:(id)a3
{
  objc_storeStrong((id *)&self->_unitDiscount, a3);
}

- (NSNumber)nextChargeDate
{
  return self->_nextChargeDate;
}

- (void)setNextChargeDate:(id)a3
{
  objc_storeStrong((id *)&self->_nextChargeDate, a3);
}

- (NSNumber)availablePoints
{
  return self->_availablePoints;
}

- (void)setAvailablePoints:(id)a3
{
  objc_storeStrong((id *)&self->_availablePoints, a3);
}

- (EDAMBackupPaymentInfo)backupPaymentInfo
{
  return self->_backupPaymentInfo;
}

- (void)setBackupPaymentInfo:(id)a3
{
  objc_storeStrong((id *)&self->_backupPaymentInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backupPaymentInfo, 0);
  objc_storeStrong((id *)&self->_availablePoints, 0);
  objc_storeStrong((id *)&self->_nextChargeDate, 0);
  objc_storeStrong((id *)&self->_unitDiscount, 0);
  objc_storeStrong((id *)&self->_businessRole, 0);
  objc_storeStrong((id *)&self->_businessName, 0);
  objc_storeStrong((id *)&self->_businessId, 0);
  objc_storeStrong((id *)&self->_unitPrice, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_lastRequestedCharge, 0);
  objc_storeStrong((id *)&self->_premiumSubscriptionNumber, 0);
  objc_storeStrong((id *)&self->_updated, 0);
  objc_storeStrong((id *)&self->_premiumLockUntil, 0);
  objc_storeStrong((id *)&self->_nextPaymentDue, 0);
  objc_storeStrong((id *)&self->_lastFailedChargeReason, 0);
  objc_storeStrong((id *)&self->_lastFailedCharge, 0);
  objc_storeStrong((id *)&self->_lastSuccessfulCharge, 0);
  objc_storeStrong((id *)&self->_premiumServiceSKU, 0);
  objc_storeStrong((id *)&self->_premiumServiceStart, 0);
  objc_storeStrong((id *)&self->_premiumCommerceService, 0);
  objc_storeStrong((id *)&self->_premiumOrderNumber, 0);
  objc_storeStrong((id *)&self->_premiumServiceStatus, 0);
  objc_storeStrong((id *)&self->_uploadLimitNextMonth, 0);
  objc_storeStrong((id *)&self->_uploadLimitEnd, 0);
  objc_storeStrong((id *)&self->_uploadLimit, 0);
}

@end
