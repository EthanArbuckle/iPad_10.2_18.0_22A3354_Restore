@implementation BLRestoreResponseItem

- (BLRestoreResponseItem)initWithStoreItemID:(id)a3 downloadID:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  id v11;
  BLRestoreResponseItem *v12;
  BLRestoreResponseItem *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BLRestoreResponseItem;
  v12 = -[BLRestoreResponseItem init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_storeItemID, a3);
    objc_storeStrong((id *)&v13->_downloadID, a4);
    objc_storeStrong((id *)&v13->_error, a5);
  }

  return v13;
}

- (BOOL)success
{
  void *v2;
  BOOL v3;

  -[BLRestoreResponseItem downloadID](self, "downloadID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLRestoreResponseItem)initWithCoder:(id)a3
{
  id v4;
  BLRestoreResponseItem *v5;
  uint64_t v6;
  NSNumber *storeItemID;
  uint64_t v8;
  NSString *downloadID;
  uint64_t v10;
  NSError *error;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BLRestoreResponseItem;
  v5 = -[BLRestoreResponseItem init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storeItemID"));
    v6 = objc_claimAutoreleasedReturnValue();
    storeItemID = v5->_storeItemID;
    v5->_storeItemID = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("downloadID"));
    v8 = objc_claimAutoreleasedReturnValue();
    downloadID = v5->_downloadID;
    v5->_downloadID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v10 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[BLRestoreResponseItem storeItemID](self, "storeItemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("storeItemID"));

  -[BLRestoreResponseItem downloadID](self, "downloadID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("downloadID"));

  -[BLRestoreResponseItem error](self, "error");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("error"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[BLRestoreResponseItem storeItemID](self, "storeItemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStoreItemID:", v5);

  -[BLRestoreResponseItem downloadID](self, "downloadID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDownloadID:", v6);

  -[BLRestoreResponseItem error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setError:", v7);

  return v4;
}

- (NSNumber)storeItemID
{
  return self->_storeItemID;
}

- (void)setStoreItemID:(id)a3
{
  objc_storeStrong((id *)&self->_storeItemID, a3);
}

- (NSString)downloadID
{
  return self->_downloadID;
}

- (void)setDownloadID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_downloadID, 0);
  objc_storeStrong((id *)&self->_storeItemID, 0);
}

@end
