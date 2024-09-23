@implementation CCItemInstance

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaContent, 0);
  objc_storeStrong((id *)&self->_instanceIdentifier, 0);
}

- (CCItemMetaContent)metaContent
{
  return self->_metaContent;
}

- (CCItemInstance)initWithContent:(id)a3 metaContent:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  objc_class *v10;
  CCItemInstance *v11;
  CCItemInstance *v12;
  CCItemInstance *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  if (CCValidateNonNilField((uint64_t)CFSTR("metaContent"), (uint64_t)v9, a5)
    && (v10 = (objc_class *)objc_opt_class(),
        CCValidateIsInstanceOfExpectedClass(CFSTR("metaContent"), v9, v10, a5)))
  {
    v15.receiver = self;
    v15.super_class = (Class)CCItemInstance;
    v11 = -[CCSharedItem initWithContent:error:](&v15, sel_initWithContent_error_, v8, a5);
    v12 = v11;
    if (v11)
      objc_storeStrong((id *)&v11->_metaContent, a4);
    self = v12;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSNumber)instanceIdentifier
{
  NSNumber *instanceIdentifier;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSNumber *v9;
  NSNumber *v10;

  instanceIdentifier = self->_instanceIdentifier;
  if (!instanceIdentifier)
  {
    -[CCSharedItem content](self, "content");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[CCItemInstance metaContent](self, "metaContent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", objc_msgSend(v7, "length") + objc_msgSend(v5, "length"));
    objc_msgSend(v8, "appendData:", v5);
    objc_msgSend(v8, "appendData:", v7);
    CCHash64(v8);
    v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v10 = self->_instanceIdentifier;
    self->_instanceIdentifier = v9;

    instanceIdentifier = self->_instanceIdentifier;
  }
  return instanceIdentifier;
}

- (CCItemInstance)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (CCItemInstance)initWithSharedIdentifier:(id)a3 instanceIdentifier:(id)a4 content:(id)a5 metaContent:(id)a6
{
  id v11;
  id v12;
  CCItemInstance *v13;
  CCItemInstance *v14;
  objc_super v16;

  v11 = a4;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)CCItemInstance;
  v13 = -[CCSharedItem initWithSharedIdentifier:content:](&v16, sel_initWithSharedIdentifier_content_, a3, a5);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_metaContent, a6);
    objc_storeStrong((id *)&v14->_instanceIdentifier, a4);
  }

  return v14;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v9.receiver = self;
  v9.super_class = (Class)CCItemInstance;
  -[CCSharedItem description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCItemInstance instanceIdentifier](self, "instanceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCItemInstance metaContent](self, "metaContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ instanceIdentifier: %@ metaContent: %@"), v4, v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CCItemInstance *v4;
  CCItemInstance *v5;
  BOOL v6;

  v4 = (CCItemInstance *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CCItemInstance isEqualToItemInstance:](self, "isEqualToItemInstance:", v5);

  return v6;
}

- (BOOL)isEqualToItemInstance:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CCItemInstance instanceIdentifier](self, "instanceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "instanceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CCItemInstance instanceIdentifier](self, "instanceIdentifier");
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
  id v4;
  CCItemMetaContent *metaContent;
  void *v6;
  NSNumber *instanceIdentifier;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CCItemInstance;
  -[CCSharedItem encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  metaContent = self->_metaContent;
  if (metaContent)
  {
    -[CCItemMetaContent data](metaContent, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("m"));

  }
  instanceIdentifier = self->_instanceIdentifier;
  if (instanceIdentifier)
    objc_msgSend(v4, "encodeObject:forKey:", instanceIdentifier, CFSTR("i"));

}

- (CCItemInstance)initWithCoder:(id)a3
{
  id v4;
  CCItemInstance *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  CCItemMetaContent *metaContent;
  uint64_t v13;
  NSNumber *instanceIdentifier;
  CCItemInstance *v15;
  NSObject *v16;
  void *v18;
  void *v19;
  id v20;
  objc_super v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CCItemInstance;
  v5 = -[CCSharedItem initWithCoder:](&v21, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("m"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[CCSharedItem content](v5, "content");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[CCSharedItem content](v5, "content");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend((id)objc_opt_class(), "itemType");

        v20 = 0;
        +[CCItemMessage metaContentMessageForItemType:data:error:](CCItemMessage, "metaContentMessageForItemType:data:error:", v9, v6, &v20);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = v20;
        metaContent = v5->_metaContent;
        v5->_metaContent = (CCItemMetaContent *)v10;

        if (!v5->_metaContent)
        {
          __biome_log_for_category();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            CCTypeIdentifierRegistryBridge();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "descriptionForTypeIdentifier:", v9);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v23 = v6;
            v24 = 2112;
            v25 = v19;
            v26 = 2112;
            v27 = v11;
            _os_log_error_impl(&dword_237B25000, v16, OS_LOG_TYPE_ERROR, "Failed to decode metacontent from data: %@ itemType: %@ error: %@", buf, 0x20u);

          }
          goto LABEL_15;
        }

      }
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("i"));
    v13 = objc_claimAutoreleasedReturnValue();
    instanceIdentifier = v5->_instanceIdentifier;
    v5->_instanceIdentifier = (NSNumber *)v13;

    if (v5->_metaContent || v5->_instanceIdentifier)
    {
      v15 = v5;
LABEL_16:

      goto LABEL_17;
    }
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CCItemInstance initWithCoder:].cold.1(v11);
LABEL_15:

    v15 = 0;
    goto LABEL_16;
  }
  v15 = 0;
LABEL_17:

  return v15;
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_237B25000, log, OS_LOG_TYPE_ERROR, "Neither metacontent nor instanceIdentifier were decoded", v1, 2u);
}

@end
