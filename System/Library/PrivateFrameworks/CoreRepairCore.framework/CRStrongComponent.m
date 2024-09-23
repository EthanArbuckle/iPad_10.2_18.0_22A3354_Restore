@implementation CRStrongComponent

- (CRStrongComponent)initWithComponentType:(id)a3 identifier:(id)a4 fwVersion:(id)a5
{
  id v9;
  id v10;
  id v11;
  CRStrongComponent *v12;
  CRStrongComponent *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CRStrongComponent;
  v12 = -[CRStrongComponent init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->componentType, a3);
    objc_storeStrong((id *)&v13->identifier, a4);
    objc_storeStrong((id *)&v13->fwVersion, a5);
  }

  return v13;
}

- (CRStrongComponent)init
{
  objc_msgSend_raise_format_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], (uint64_t)CFSTR("Please use initWithComponentType"));

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *componentType;
  const char *v5;
  const char *v6;
  const char *v7;
  id v8;

  componentType = self->componentType;
  v8 = a3;
  objc_msgSend_encodeObject_forKey_(v8, v5, (uint64_t)componentType, (uint64_t)CFSTR("componentType"));
  objc_msgSend_encodeObject_forKey_(v8, v6, (uint64_t)self->identifier, (uint64_t)CFSTR("identifier"));
  objc_msgSend_encodeObject_forKey_(v8, v7, (uint64_t)self->fwVersion, (uint64_t)CFSTR("fwVersion"));

}

- (CRStrongComponent)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  CRStrongComponent *v21;
  const char *v22;
  CRStrongComponent *v23;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend_setWithObjects_(v4, v12, v6, v13, v7, v8, v9, v10, v11, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v5, v15, (uint64_t)v14, (uint64_t)CFSTR("componentType"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v5, v17, (uint64_t)v14, (uint64_t)CFSTR("identifier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v5, v19, (uint64_t)v14, (uint64_t)CFSTR("fwVersion"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = [CRStrongComponent alloc];
  v23 = (CRStrongComponent *)objc_msgSend_initWithComponentType_identifier_fwVersion_(v21, v22, (uint64_t)v16, (uint64_t)v18, v20);

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;

  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_componentType(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fwVersion(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v15, (uint64_t)CFSTR("[CRStrongComponent: Type:%@: ID:%@: FW:%@:]"), v16, v6, v10, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSString)componentType
{
  return self->componentType;
}

- (void)setComponentType:(id)a3
{
  objc_storeStrong((id *)&self->componentType, a3);
}

- (NSString)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->identifier, a3);
}

- (NSString)fwVersion
{
  return self->fwVersion;
}

- (void)setFwVersion:(id)a3
{
  objc_storeStrong((id *)&self->fwVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->fwVersion, 0);
  objc_storeStrong((id *)&self->identifier, 0);
  objc_storeStrong((id *)&self->componentType, 0);
}

@end
