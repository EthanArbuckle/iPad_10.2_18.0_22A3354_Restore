@implementation CCSharedItem

- (CCItemContent)content
{
  return self->_content;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_sharedIdentifier, 0);
}

- (CCSharedItem)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (CCSharedItem)initWithContent:(id)a3 error:(id *)a4
{
  id v7;
  objc_class *v8;
  CCSharedItem *v9;
  CCSharedItem *v10;
  CCSharedItem *v11;
  objc_super v13;

  v7 = a3;
  if (CCValidateNonNilField((uint64_t)CFSTR("content"), (uint64_t)v7, a4)
    && (v8 = (objc_class *)objc_opt_class(),
        CCValidateIsInstanceOfExpectedClass(CFSTR("content"), v7, v8, a4)))
  {
    v13.receiver = self;
    v13.super_class = (Class)CCSharedItem;
    v9 = -[CCSharedItem init](&v13, sel_init);
    v10 = v9;
    if (v9)
      objc_storeStrong((id *)&v9->_content, a3);
    self = v10;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (CCSharedItem)initWithSharedIdentifier:(id)a3 content:(id)a4
{
  id v7;
  id v8;
  CCSharedItem *v9;
  CCSharedItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CCSharedItem;
  v9 = -[CCSharedItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_content, a4);
    objc_storeStrong((id *)&v10->_sharedIdentifier, a3);
  }

  return v10;
}

- (NSNumber)sharedIdentifier
{
  NSNumber *sharedIdentifier;
  void *v4;
  NSNumber *v5;
  NSNumber *v6;

  sharedIdentifier = self->_sharedIdentifier;
  if (!sharedIdentifier)
  {
    -[CCItemContent data](self->_content, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    CCHash64(v4);
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v6 = self->_sharedIdentifier;
    self->_sharedIdentifier = v5;

    sharedIdentifier = self->_sharedIdentifier;
  }
  return sharedIdentifier;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCSharedItem sharedIdentifier](self, "sharedIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCSharedItem content](self, "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@> sharedIdentifier: %@ content: %@"), v5, v6, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  CCSharedItem *v4;
  CCSharedItem *v5;
  BOOL v6;

  v4 = (CCSharedItem *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CCSharedItem isEqualToSharedItem:](self, "isEqualToSharedItem:", v5);

  return v6;
}

- (BOOL)isEqualToSharedItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CCSharedItem sharedIdentifier](self, "sharedIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CCSharedItem sharedIdentifier](self, "sharedIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongLongValue");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  NSNumber *sharedIdentifier;
  id v6;

  v6 = a3;
  if (self->_content)
  {
    objc_msgSend(v6, "encodeInt32:forKey:", objc_msgSend((id)objc_opt_class(), "itemType"), CFSTR("t"));
    -[CCItemContent data](self->_content, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("c"));

  }
  sharedIdentifier = self->_sharedIdentifier;
  if (sharedIdentifier)
    objc_msgSend(v6, "encodeObject:forKey:", sharedIdentifier, CFSTR("s"));

}

- (CCSharedItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  unsigned __int16 v6;
  NSObject *v7;
  id v8;
  CCSharedItem *v9;
  void *v10;
  CCSharedItem *v11;
  id v12;
  CCSharedItem *v13;
  CCSharedItem *v14;
  NSObject *v15;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("c"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("t"));
    v20 = 0;
    +[CCItemMessage contentMessageForItemType:data:error:](CCItemMessage, "contentMessageForItemType:data:error:", v6, v5, &v20);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v20;
    if (!v7)
    {
      __biome_log_for_category();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        CCTypeIdentifierRegistryBridge();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "descriptionForTypeIdentifier:", v6);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v22 = v5;
        v23 = 2112;
        v24 = v18;
        v25 = 2112;
        v26 = v8;
        _os_log_error_impl(&dword_237B25000, v7, OS_LOG_TYPE_ERROR, "Failed to decode content from data: %@ itemType: %@ error: %@", buf, 0x20u);

      }
      v9 = 0;
      goto LABEL_16;
    }
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("s"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    self = -[CCSharedItem initWithSharedIdentifier:content:](self, "initWithSharedIdentifier:content:", v10, v7);
  }
  else
  {
    v19 = v8;
    v11 = -[CCSharedItem initWithContent:error:](self, "initWithContent:error:", v7, &v19);
    v12 = v19;

    v13 = v11;
    self = v13;
    if (v13)
    {
      v14 = v13;
    }
    else
    {
      __biome_log_for_category();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[CCSharedItem initWithCoder:].cold.1((uint64_t)v12, v15);

    }
    v8 = v12;
  }

  v9 = self;
LABEL_16:

  return v9;
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_237B25000, a2, OS_LOG_TYPE_ERROR, "Failed to initialize sharedItem: %@", (uint8_t *)&v2, 0xCu);
}

@end
