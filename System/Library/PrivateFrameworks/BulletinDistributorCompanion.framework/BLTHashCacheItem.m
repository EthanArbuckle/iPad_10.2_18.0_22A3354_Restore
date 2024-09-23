@implementation BLTHashCacheItem

- (BLTHashCacheItem)initWithURL:(id)a3 data:(id)a4 identifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  BLTHashCacheItem *v12;
  BLTHashCacheItem *v13;
  uint64_t v14;
  NSString *identifier;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BLTHashCacheItem;
  v12 = -[BLTHashCacheItem init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_data, a4);
    objc_storeStrong((id *)&v13->_url, a3);
    v14 = objc_msgSend(v11, "copy");
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

  }
  return v13;
}

+ (id)hashCacheItemWithData:(id)a3 URL:(id)a4 identifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:data:identifier:", v9, v10, v8);

  return v11;
}

- (BOOL)isEqualToItem:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  char v16;
  char v17;

  v5 = a3;
  -[BLTHashCacheItem data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v5, "data");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v9 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  -[BLTHashCacheItem data](self, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToData:", v8);

  if (!v6)
    goto LABEL_6;
LABEL_7:

  -[BLTHashCacheItem url](self, "url");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 || (objc_msgSend(v5, "url"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[BLTHashCacheItem url](self, "url");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "absoluteString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "url");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "absoluteString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "isEqualToString:", v14);

    if (v10)
      goto LABEL_13;
  }
  else
  {
    v15 = 1;
  }

LABEL_13:
  if (v5)
    v16 = v9;
  else
    v16 = 0;
  v17 = v16 & v15;

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  BLTHashCacheItem *v4;
  os_unfair_lock_s *p_lock;
  BOOL v6;

  v4 = (BLTHashCacheItem *)a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = -[BLTHashCacheItem isEqualToItem:](self, "isEqualToItem:", v4);
      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)MD5
{
  NSData *MD5;
  void *v4;
  void *v5;
  NSData *v6;
  NSObject *p_super;
  void *v9;
  void *v10;
  char v11;
  _BYTE v12[16];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  MD5 = self->_MD5;
  if (!MD5)
  {
    -[BLTHashCacheItem data](self, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[BLTHashCacheItem data](self, "data");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "MD5:", v12);

    }
    else
    {
      -[BLTHashCacheItem url](self, "url");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        goto LABEL_6;
      -[BLTHashCacheItem url](self, "url");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "MD5:", v12);

      if ((v11 & 1) == 0)
      {
        blt_general_log();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
          -[BLTHashCacheItem MD5].cold.1(self, p_super);
        goto LABEL_5;
      }
    }
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v12, 16);
    v6 = (NSData *)objc_claimAutoreleasedReturnValue();
    p_super = &self->_MD5->super;
    self->_MD5 = v6;
LABEL_5:

LABEL_6:
    MD5 = self->_MD5;
  }
  return MD5;
}

- (unint64_t)hash
{
  os_unfair_lock_s *p_lock;
  void *v4;
  unint64_t v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = 0;
  -[BLTHashCacheItem MD5](self, "MD5");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getBytes:length:", &v6, 8);

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_MD5, 0);
}

- (void)MD5
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_2173D9000, a2, OS_LOG_TYPE_ERROR, "Unable to MD5 item: %@", (uint8_t *)&v4, 0xCu);

}

@end
