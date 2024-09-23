@implementation REDirectTexturePayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (const)identifier
{
  return (const unsigned __int8 (*)[16])self->_identifier;
}

- (REDirectTexturePayload)initWithDirectTexture:(id)a3
{
  id v4;
  REDirectTexturePayload *v5;
  REDirectTexturePayload *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REDirectTexturePayload;
  v5 = -[RESharedResourcePayload init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[REDirectTexturePayload setDirectTexture:](v5, "setDirectTexture:", v4);
    DRTextureAsResource();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    DRResourceGetIdentifier();

  }
  return v6;
}

- (REDirectTexturePayload)initWithCoder:(id)a3
{
  id v4;
  REDirectTexturePayload *v5;
  NSString *v6;
  void *v7;
  NSString *v8;
  void *v9;
  REDirectTexturePayload *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)REDirectTexturePayload;
  v5 = -[RESharedResourcePayload initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v11);

LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  if (!v7)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v12);

    goto LABEL_8;
  }
  objc_msgSend(v7, "getUUIDBytes:", v5->_identifier);

LABEL_5:
  v10 = v5;
LABEL_9:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t isKindOfClass;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", self->_identifier);
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("identifier"));

  }
  else
  {
    v7 = *re::assetTypesLogObjects((re *)isKindOfClass);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_fault_impl(&dword_224FE9000, v7, OS_LOG_TYPE_FAULT, "REDirectTexturePayload requires an NSXPCCoder", v8, 2u);
    }
  }

}

- (DRTexture)directTexture
{
  return self->_directTexture;
}

- (void)setDirectTexture:(id)a3
{
  objc_storeStrong((id *)&self->_directTexture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directTexture, 0);
}

@end
