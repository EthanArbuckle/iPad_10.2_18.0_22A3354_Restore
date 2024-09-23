@implementation CWFRequestParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;

  v6 = (void *)objc_msgSend_allocWithZone_(CWFRequestParameters, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setUUID_(v11, v12, (uint64_t)self->_UUID, v13, v14);
  objc_msgSend_setInterfaceName_(v11, v15, (uint64_t)self->_interfaceName, v16, v17);
  objc_msgSend_setQualityOfService_(v11, v18, self->_qualityOfService, v19, v20);
  objc_msgSend_setQueuePriority_(v11, v21, self->_queuePriority, v22, v23);
  objc_msgSend_setVirtualInterfaceRole_(v11, v24, self->_virtualInterfaceRole, v25, v26);
  objc_msgSend_setTimeout_(v11, v27, self->_timeout, v28, v29);
  return v11;
}

- (void)setVirtualInterfaceRole:(int)a3
{
  self->_virtualInterfaceRole = a3;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (void)setTimeout:(unint64_t)a3
{
  self->_timeout = a3;
}

- (void)setInterfaceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CWFRequestParameters)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CWFRequestParameters *v6;
  uint64_t v7;
  NSUUID *UUID;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CWFRequestParameters;
  v6 = -[CWFRequestParameters init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v2, v3, v4, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    UUID = v6->_UUID;
    v6->_UUID = (NSUUID *)v7;

  }
  return v6;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setQueuePriority:(int64_t)a3
{
  self->_queuePriority = a3;
}

- (unint64_t)timeout
{
  return self->_timeout;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (int)virtualInterfaceRole
{
  return self->_virtualInterfaceRole;
}

- (int64_t)queuePriority
{
  return self->_queuePriority;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *UUID;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  id v21;

  UUID = self->_UUID;
  v21 = a3;
  objc_msgSend_encodeObject_forKey_(v21, v5, (uint64_t)UUID, (uint64_t)CFSTR("_UUID"), v6);
  objc_msgSend_encodeObject_forKey_(v21, v7, (uint64_t)self->_interfaceName, (uint64_t)CFSTR("_interfaceName"), v8);
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v9, self->_timeout, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v21, v13, (uint64_t)v12, (uint64_t)CFSTR("_timeout"), v14);

  objc_msgSend_encodeInteger_forKey_(v21, v15, self->_qualityOfService, (uint64_t)CFSTR("_qualityOfService"), v16);
  objc_msgSend_encodeInteger_forKey_(v21, v17, self->_queuePriority, (uint64_t)CFSTR("_queuePriority"), v18);
  objc_msgSend_encodeInteger_forKey_(v21, v19, self->_virtualInterfaceRole, (uint64_t)CFSTR("_virtualInterfaceRole"), v20);

}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (CWFRequestParameters)initWithCoder:(id)a3
{
  id v4;
  CWFRequestParameters *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSUUID *UUID;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSString *interfaceName;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CWFRequestParameters;
  v5 = -[CWFRequestParameters init](&v34, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("_UUID"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("_interfaceName"), v13);
    v14 = objc_claimAutoreleasedReturnValue();
    interfaceName = v5->_interfaceName;
    v5->_interfaceName = (NSString *)v14;

    v16 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, (uint64_t)CFSTR("_timeout"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_timeout = objc_msgSend_unsignedLongLongValue(v19, v20, v21, v22, v23);

    v5->_qualityOfService = objc_msgSend_decodeIntegerForKey_(v4, v24, (uint64_t)CFSTR("_qualityOfService"), v25, v26);
    v5->_queuePriority = objc_msgSend_decodeIntegerForKey_(v4, v27, (uint64_t)CFSTR("_queuePriority"), v28, v29);
    v5->_virtualInterfaceRole = objc_msgSend_decodeIntegerForKey_(v4, v30, (uint64_t)CFSTR("_virtualInterfaceRole"), v31, v32);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  unint64_t timeout;
  NSString *interfaceName;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v6 = (void *)MEMORY[0x1E0CB3940];
  interfaceName = self->_interfaceName;
  timeout = self->_timeout;
  objc_msgSend_UUIDString(self->_UUID, a2, v2, v3, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_substringToIndex_(v9, v10, 5, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v14, (uint64_t)CFSTR("intf=%@ timeout=%lluns uuid=%@ priority=%ld qos=%ld"), v15, v16, interfaceName, timeout, v13, self->_queuePriority, self->_qualityOfService);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)isEqualToRequestParameters:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSUUID *UUID;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSString *interfaceName;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSString *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSString *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  BOOL v41;
  BOOL v42;
  int virtualInterfaceRole;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t timeout;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int64_t qualityOfService;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int64_t queuePriority;

  v6 = a3;
  v11 = v6;
  if (self->_UUID)
  {
    objc_msgSend_UUID(v6, v7, v8, v9, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v42 = 0;
LABEL_22:

      goto LABEL_23;
    }
    UUID = self->_UUID;
    objc_msgSend_UUID(v11, v12, v13, v14, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(UUID, v19, (uint64_t)v18, v20, v21))
    {
      v42 = 0;
LABEL_21:

      goto LABEL_22;
    }
    interfaceName = self->_interfaceName;
    objc_msgSend_interfaceName(v11, v22, v23, v24, v25);
    v31 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (interfaceName == v31)
      goto LABEL_13;
    if (!self->_interfaceName
      || (objc_msgSend_interfaceName(v11, v27, v28, v29, v30), (v32 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v42 = 0;
LABEL_20:

      goto LABEL_21;
    }
    v3 = (void *)v32;
    v37 = self->_interfaceName;
    objc_msgSend_interfaceName(v11, v33, v34, v35, v36);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqual_(v37, v38, (uint64_t)v4, v39, v40))
    {
LABEL_13:
      virtualInterfaceRole = self->_virtualInterfaceRole;
      if (virtualInterfaceRole == objc_msgSend_virtualInterfaceRole(v11, v27, v28, v29, v30)
        && (timeout = self->_timeout, timeout == objc_msgSend_timeout(v11, v44, v45, v46, v47))
        && (qualityOfService = self->_qualityOfService,
            qualityOfService == objc_msgSend_qualityOfService(v11, v49, v50, v51, v52)))
      {
        queuePriority = self->_queuePriority;
        v41 = queuePriority == objc_msgSend_queuePriority(v11, v54, v55, v56, v57);
        v42 = v41;
      }
      else
      {
        v41 = 0;
        v42 = 0;
      }
      if (interfaceName == v31)
        goto LABEL_20;
    }
    else
    {
      v41 = 0;
    }

    v42 = v41;
    goto LABEL_20;
  }
  v42 = 0;
LABEL_23:

  return v42;
}

- (BOOL)isEqual:(id)a3
{
  CWFRequestParameters *v4;
  CWFRequestParameters *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToRequestParameters;

  v4 = (CWFRequestParameters *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToRequestParameters = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToRequestParameters = objc_msgSend_isEqualToRequestParameters_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    isEqualToRequestParameters = 0;
  }

  return isEqualToRequestParameters;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = objc_msgSend_hash(self->_UUID, a2, v2, v3, v4);
  return objc_msgSend_hash(self->_interfaceName, v7, v8, v9, v10) ^ v6 ^ self->_virtualInterfaceRole ^ self->_timeout ^ self->_qualityOfService ^ self->_queuePriority;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

@end
