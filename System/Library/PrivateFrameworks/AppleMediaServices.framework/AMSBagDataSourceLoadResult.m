@implementation AMSBagDataSourceLoadResult

- (NSDictionary)data
{
  return self->_data;
}

- (AMSBagDataSourceLoadResult)initWithData:(id)a3 expirationDate:(id)a4 loadedBagIdentifier:(id)a5 loadedBagPartialIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  AMSBagDataSourceLoadResult *v14;
  uint64_t v15;
  NSDictionary *data;
  uint64_t v17;
  NSString *loadedBagIdentifier;
  uint64_t v19;
  NSString *loadedBagPartialIdentifier;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)AMSBagDataSourceLoadResult;
  v14 = -[AMSBagDataSourceLoadResult init](&v22, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    data = v14->_data;
    v14->_data = (NSDictionary *)v15;

    objc_storeStrong((id *)&v14->_expirationDate, a4);
    v17 = objc_msgSend(v12, "copy");
    loadedBagIdentifier = v14->_loadedBagIdentifier;
    v14->_loadedBagIdentifier = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    loadedBagPartialIdentifier = v14->_loadedBagPartialIdentifier;
    v14->_loadedBagPartialIdentifier = (NSString *)v19;

  }
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedBagPartialIdentifier, 0);
  objc_storeStrong((id *)&self->_loadedBagIdentifier, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (NSString)loadedBagIdentifier
{
  return self->_loadedBagIdentifier;
}

- (NSString)loadedBagPartialIdentifier
{
  return self->_loadedBagPartialIdentifier;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

@end
