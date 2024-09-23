@implementation AMSBagNetworkTaskResult

- (NSDictionary)data
{
  return self->_data;
}

- (NSString)loadedBagPartialIdentifier
{
  return self->_loadedBagPartialIdentifier;
}

- (NSString)loadedBagIdentifier
{
  return self->_loadedBagIdentifier;
}

- (BOOL)expired
{
  void *v2;
  void *v3;
  BOOL v4;

  -[AMSBagNetworkTaskResult expirationDate](self, "expirationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "compare:", v2) == 1;

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (AMSBagNetworkTaskResult)initWithData:(id)a3 expirationDate:(id)a4 loadedBagIdentifier:(id)a5 loadedBagPartialIdentifier:(id)a6 storefront:(id)a7 accountIdentifier:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  AMSBagNetworkTaskResult *v21;
  uint64_t v22;
  NSDictionary *data;
  uint64_t v24;
  NSString *storefront;
  uint64_t v26;
  NSString *loadedBagIdentifier;
  uint64_t v28;
  NSString *loadedBagPartialIdentifier;
  uint64_t v30;
  NSString *accountIdentifier;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AMSBagNetworkTask.m"), 60, CFSTR("Unexpected nil reference: %s"), "expirationDate");

    if (v17)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AMSBagNetworkTask.m"), 59, CFSTR("Unexpected nil reference: %s"), "data");

  if (!v16)
    goto LABEL_8;
LABEL_3:
  if (v17)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AMSBagNetworkTask.m"), 61, CFSTR("Unexpected nil reference: %s"), "loadedBagIdentifier");

LABEL_4:
  v36.receiver = self;
  v36.super_class = (Class)AMSBagNetworkTaskResult;
  v21 = -[AMSBagNetworkTaskResult init](&v36, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v15, "copy");
    data = v21->_data;
    v21->_data = (NSDictionary *)v22;

    v24 = objc_msgSend(v19, "copy");
    storefront = v21->_storefront;
    v21->_storefront = (NSString *)v24;

    objc_storeStrong((id *)&v21->_expirationDate, a4);
    v26 = objc_msgSend(v17, "copy");
    loadedBagIdentifier = v21->_loadedBagIdentifier;
    v21->_loadedBagIdentifier = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    loadedBagPartialIdentifier = v21->_loadedBagPartialIdentifier;
    v21->_loadedBagPartialIdentifier = (NSString *)v28;

    v30 = objc_msgSend(v20, "copy");
    accountIdentifier = v21->_accountIdentifier;
    v21->_accountIdentifier = (NSString *)v30;

  }
  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefront, 0);
  objc_storeStrong((id *)&self->_loadedBagPartialIdentifier, 0);
  objc_storeStrong((id *)&self->_loadedBagIdentifier, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

- (NSString)storefront
{
  return self->_storefront;
}

@end
