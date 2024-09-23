@implementation SKPaymentTransactionInternal

- (SKPaymentTransactionInternal)init
{
  SKPaymentTransactionInternal *v2;
  void *v3;
  uint64_t v4;
  NSString *uuid;
  NSArray *downloads;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKPaymentTransactionInternal;
  v2 = -[SKPaymentTransactionInternal init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    uuid = v2->_uuid;
    v2->_uuid = (NSString *)v4;

    downloads = v2->_downloads;
    v2->_downloads = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationResponse, 0);
  objc_storeStrong((id *)&self->_transactionReceipt, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_storeStrong((id *)&self->_transactionDate, 0);
  objc_storeStrong((id *)&self->_temporaryIdentifier, 0);
  objc_storeStrong((id *)&self->_payment, 0);
  objc_storeStrong((id *)&self->_originalTransaction, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_downloads, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
