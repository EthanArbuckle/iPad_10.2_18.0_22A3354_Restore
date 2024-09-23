@implementation POPodcastModelObject

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_title(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_indexPath(self, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uuid(self, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v21, (uint64_t)CFSTR("%@ (%p) title: %@, index path: %@, uuid, %@"), v22, v23, v5, self, v10, v15, v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (SAMPCollection)SAMPCollection
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  uint8_t buf[4];
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_class();
  v8 = objc_alloc_init((Class)objc_msgSend_SAMPClass(v3, v4, v5, v6, v7));
  v9 = (void *)MEMORY[0x24BDD17C8];
  v10 = (void *)objc_opt_class();
  objc_msgSend_uriScheme(v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uuid(self, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v9, v21, (uint64_t)CFSTR("%@://device/%@"), v22, v23, v15, v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], v25, (uint64_t)v24, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIdentifier_(v8, v29, (uint64_t)v28, v30, v31);

  objc_msgSend_title(self, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTitle_(v8, v37, (uint64_t)v36, v38, v39);

  POLogInitIfNeeded();
  if (POLogContextCommand)
    v40 = POLogContextCommand;
  else
    v40 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v43 = v8;
    _os_log_impl(&dword_217352000, v40, OS_LOG_TYPE_INFO, "Returning SAMPCollection %@", buf, 0xCu);
  }

  return (SAMPCollection *)v8;
}

+ (Class)SAMPClass
{
  return 0;
}

+ (id)uriScheme
{
  return 0;
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)feedUrl
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFeedUrl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSIndexPath)indexPath
{
  return (NSIndexPath *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIndexPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)storeId
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStoreId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeId, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_feedUrl, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
