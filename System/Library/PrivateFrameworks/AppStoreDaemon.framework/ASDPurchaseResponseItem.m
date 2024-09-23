@implementation ASDPurchaseResponseItem

- (ASDPurchaseResponseItem)init
{
  return -[ASDPurchaseResponseItem initWithResults:](self, "initWithResults:", MEMORY[0x1E0C9AA60]);
}

- (ASDPurchaseResponseItem)initWithResults:(id)a3
{
  id v5;
  ASDPurchaseResponseItem *v6;
  ASDPurchaseResponseItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDPurchaseResponseItem;
  v6 = -[ASDPurchaseResponseItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_results, a3);

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@]: cancelsPurchasesBatch: %d error: %@ purchase: %@ result: %d]"), objc_opt_class(), self->_cancelsPurchaseBatch, self->_error, self->_purchase, self->_success);
}

- (id)transactionIdentifierForItemIdentifier:(int64_t)a3
{
  void *v3;
  NSDictionary *transationIDs;
  void *v5;

  v3 = 0;
  if (a3 >= 1)
  {
    transationIDs = self->_transationIDs;
    if (transationIDs)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKey:](transationIDs, "objectForKey:", v5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDPurchaseResponseItem)initWithCoder:(id)a3
{
  id v4;
  ASDPurchaseResponseItem *v5;
  uint64_t v6;
  NSString *bundleID;
  uint64_t v8;
  NSError *error;
  uint64_t v10;
  NSNumber *itemID;
  uint64_t v12;
  ASDPurchase *purchase;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *results;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSDictionary *responseMetrics;
  double v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSDictionary *transationIDs;

  v4 = a3;
  v5 = -[ASDPurchaseResponseItem init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    v5->_cancelsPurchaseBatch = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cancelsPurchaseBatch"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v8 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemID"));
    v10 = objc_claimAutoreleasedReturnValue();
    itemID = v5->_itemID;
    v5->_itemID = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("purchase"));
    v12 = objc_claimAutoreleasedReturnValue();
    purchase = v5->_purchase;
    v5->_purchase = (ASDPurchase *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("results"));
    v17 = objc_claimAutoreleasedReturnValue();
    results = v5->_results;
    v5->_results = (NSArray *)v17;

    v19 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, v21, v22, v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("responseMetrics"));
    v25 = objc_claimAutoreleasedReturnValue();
    responseMetrics = v5->_responseMetrics;
    v5->_responseMetrics = (NSDictionary *)v25;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("requestStartTime"));
    v5->_requestStartTime = v27;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("responseEndTime"));
    v5->_responseEndTime = v28;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("responseStartTime"));
    v5->_responseStartTime = v29;
    v5->_success = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("success"));
    v30 = (void *)MEMORY[0x1E0C99E60];
    v31 = objc_opt_class();
    objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v32, CFSTR("transactionIdentifiers"));
    v33 = objc_claimAutoreleasedReturnValue();
    transationIDs = v5->_transationIDs;
    v5->_transationIDs = (NSDictionary *)v33;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSError *error;
  void *v5;
  NSNumber *itemID;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", self->_bundleID, CFSTR("bundleID"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_cancelsPurchaseBatch, CFSTR("cancelsPurchaseBatch"));
  error = self->_error;
  if (error)
  {
    ASDErrorWithSafeUserInfo(error);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("error"));

  }
  itemID = self->_itemID;
  if (itemID)
    objc_msgSend(v7, "encodeObject:forKey:", itemID, CFSTR("itemID"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_purchase, CFSTR("purchase"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_results, CFSTR("results"));
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("requestStartTime"), self->_requestStartTime);
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("responseEndTime"), self->_responseEndTime);
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("responseStartTime"), self->_responseStartTime);
  objc_msgSend(v7, "encodeObject:forKey:", self->_responseMetrics, CFSTR("responseMetrics"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_success, CFSTR("success"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_transationIDs, CFSTR("transactionIdentifiers"));

}

- (void)_setBundleID:(id)a3
{
  NSString *v4;
  NSString *bundleID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  bundleID = self->_bundleID;
  self->_bundleID = v4;

}

- (void)_setItemID:(id)a3
{
  objc_storeStrong((id *)&self->_itemID, a3);
}

- (void)_setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void)_setPurchase:(id)a3
{
  objc_storeStrong((id *)&self->_purchase, a3);
}

- (void)_setResponseMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_responseMetrics, a3);
}

- (void)_setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (void)_setTransactionIDs:(id)a3
{
  objc_storeStrong((id *)&self->_transationIDs, a3);
}

- (NSError)error
{
  return self->_error;
}

- (ASDPurchase)purchase
{
  return self->_purchase;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (NSArray)results
{
  return self->_results;
}

- (BOOL)success
{
  return self->_success;
}

- (BOOL)cancelsPurchaseBatch
{
  return self->_cancelsPurchaseBatch;
}

- (double)requestStartTime
{
  return self->_requestStartTime;
}

- (void)setRequestStartTime:(double)a3
{
  self->_requestStartTime = a3;
}

- (double)responseEndTime
{
  return self->_responseEndTime;
}

- (void)setResponseEndTime:(double)a3
{
  self->_responseEndTime = a3;
}

- (double)responseStartTime
{
  return self->_responseStartTime;
}

- (void)setResponseStartTime:(double)a3
{
  self->_responseStartTime = a3;
}

- (NSDictionary)responseMetrics
{
  return self->_responseMetrics;
}

- (NSDictionary)transationIDs
{
  return self->_transationIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transationIDs, 0);
  objc_storeStrong((id *)&self->_responseMetrics, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_purchase, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
