@implementation _MKLocalSearchMerchantParameters

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

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_merchantCode, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSString copy](self->_rawMerchantCode, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  v9 = -[NSString copy](self->_paymentNetwork, "copy");
  v10 = (void *)v4[3];
  v4[3] = v9;

  v11 = -[NSString copy](self->_industryCategory, "copy");
  v12 = (void *)v4[4];
  v4[4] = v11;

  v13 = -[NSNumber copy](self->_industryCode, "copy");
  v14 = (void *)v4[5];
  v4[5] = v13;

  v15 = -[NSDate copy](self->_transactionDate, "copy");
  v16 = (void *)v4[6];
  v4[6] = v15;

  v17 = -[CLLocation copy](self->_transactionLocation, "copy");
  v18 = (void *)v4[7];
  v4[7] = v17;

  return v4;
}

- (NSString)merchantCode
{
  return self->_merchantCode;
}

- (void)setMerchantCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)rawMerchantCode
{
  return self->_rawMerchantCode;
}

- (void)setRawMerchantCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)paymentNetwork
{
  return self->_paymentNetwork;
}

- (void)setPaymentNetwork:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)industryCategory
{
  return self->_industryCategory;
}

- (void)setIndustryCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)industryCode
{
  return self->_industryCode;
}

- (void)setIndustryCode:(id)a3
{
  objc_storeStrong((id *)&self->_industryCode, a3);
}

- (NSDate)transactionDate
{
  return self->_transactionDate;
}

- (void)setTransactionDate:(id)a3
{
  objc_storeStrong((id *)&self->_transactionDate, a3);
}

- (CLLocation)transactionLocation
{
  return self->_transactionLocation;
}

- (void)setTransactionLocation:(id)a3
{
  objc_storeStrong((id *)&self->_transactionLocation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionLocation, 0);
  objc_storeStrong((id *)&self->_transactionDate, 0);
  objc_storeStrong((id *)&self->_industryCode, 0);
  objc_storeStrong((id *)&self->_industryCategory, 0);
  objc_storeStrong((id *)&self->_paymentNetwork, 0);
  objc_storeStrong((id *)&self->_rawMerchantCode, 0);
  objc_storeStrong((id *)&self->_merchantCode, 0);
}

@end
