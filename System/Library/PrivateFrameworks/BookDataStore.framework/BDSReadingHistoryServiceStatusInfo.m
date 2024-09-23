@implementation BDSReadingHistoryServiceStatusInfo

- (BDSReadingHistoryServiceStatusInfo)initWithIsLoaded:(BOOL)a3
{
  _BOOL8 v3;
  BDSReadingHistoryServiceStatusInfo *v4;
  BDSReadingHistoryServiceStatus *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t IsLoaded;
  BDSReadingHistoryServiceStatus *status;
  objc_super v12;

  v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BDSReadingHistoryServiceStatusInfo;
  v4 = -[BDSReadingHistoryServiceStatusInfo init](&v12, sel_init);
  if (v4)
  {
    v5 = [BDSReadingHistoryServiceStatus alloc];
    IsLoaded = objc_msgSend_initWithIsLoaded_(v5, v6, v3, v7, v8);
    status = v4->_status;
    v4->_status = (BDSReadingHistoryServiceStatus *)IsLoaded;

  }
  return v4;
}

- (BOOL)isLoaded
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char isLoaded;

  objc_msgSend_status(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isLoaded = objc_msgSend_isLoaded(v5, v6, v7, v8, v9);

  return isLoaded;
}

+ (BOOL)supportsSecureCoding
{
  return ((uint64_t (*)(__objc2_class *, char *))MEMORY[0x24BEDD108])(BDSReadingHistoryServiceStatus, sel_supportsSecureCoding);
}

- (BDSReadingHistoryServiceStatusInfo)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BDSReadingHistoryServiceStatusInfo *v9;
  BDSReadingHistoryServiceStatus *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BDSReadingHistoryServiceStatus *status;

  v4 = a3;
  v9 = (BDSReadingHistoryServiceStatusInfo *)objc_msgSend_init(self, v5, v6, v7, v8);
  if (v9)
  {
    v10 = [BDSReadingHistoryServiceStatus alloc];
    v14 = objc_msgSend_initWithCoder_(v10, v11, (uint64_t)v4, v12, v13);
    status = v9->_status;
    v9->_status = (BDSReadingHistoryServiceStatus *)v14;

  }
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  objc_msgSend_status(self, v5, v6, v7, v8);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeWithCoder_(v12, v9, (uint64_t)v4, v10, v11);

}

- (id)copyWithZone:(_NSZone *)a3
{
  BDSReadingHistoryServiceStatusInfo *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t isLoaded;
  const char *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = [BDSReadingHistoryServiceStatusInfo alloc];
  isLoaded = objc_msgSend_isLoaded(self, v5, v6, v7, v8);
  return (id)objc_msgSend_initWithIsLoaded_(v4, v10, isLoaded, v11, v12);
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend_status(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BDSReadingHistoryServiceStatus)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
}

@end
