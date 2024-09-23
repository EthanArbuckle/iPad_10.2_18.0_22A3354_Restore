@implementation BMAccessDescriptor

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_mode);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_domain);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[BMResourceSpecifier hash](self->_resource, "hash");

  return v7;
}

- (BMAccessDescriptor)initWithDomain:(unint64_t)a3 accessMode:(unint64_t)a4 resource:(id)a5
{
  id v9;
  void *v10;
  char IsPathSafe;
  BMAccessDescriptor *v12;
  BMAccessDescriptor *v13;
  BMAccessDescriptor *v14;
  NSObject *v15;
  objc_super v17;

  v9 = a5;
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  IsPathSafe = BMIdentifierIsPathSafe(v10);

  if ((IsPathSafe & 1) != 0)
  {
    v17.receiver = self;
    v17.super_class = (Class)BMAccessDescriptor;
    v12 = -[BMAccessDescriptor init](&v17, sel_init);
    v13 = v12;
    if (v12)
    {
      v12->_domain = a3;
      v12->_mode = a4;
      objc_storeStrong((id *)&v12->_resource, a5);
    }
    self = v13;
    v14 = self;
  }
  else
  {
    __biome_log_for_category(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[BMAccessDescriptor initWithDomain:accessMode:resource:].cold.1(v15);

    v14 = 0;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resource, 0);
}

- (BMResourceSpecifier)resource
{
  return self->_resource;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (BMAccessDescriptor)accessDescriptorWithAccessMode:(unint64_t)a3
{
  BMAccessDescriptor *v3;

  if (self->_mode == a3)
    v3 = self;
  else
    v3 = (BMAccessDescriptor *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDomain:accessMode:resource:", self->_domain, a3, self->_resource);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && self->_domain == v4[1]
    && self->_mode == v4[2]
    && -[BMResourceSpecifier isEqual:](self->_resource, "isEqual:", v4[3]);

  return v5;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  BMAccessModePrintableDescription(self->_mode);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<BMAccessDescriptor: %@ access to %@ in domain %lu>"), v4, self->_resource, -[BMAccessDescriptor domain](self, "domain"));

  return v5;
}

- (unint64_t)domain
{
  return self->_domain;
}

- (void)initWithDomain:(os_log_t)log accessMode:resource:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AEB31000, log, OS_LOG_TYPE_ERROR, "BMAccessDescriptor passed invalid identifier", v1, 2u);
}

@end
