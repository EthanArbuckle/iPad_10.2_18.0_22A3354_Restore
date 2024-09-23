@implementation CWFAWDLPeerContext

+ (id)AWDLPeerContextWithMACAddress:(id)a3 interfaceName:(id)a4
{
  id v5;
  id v6;
  CWFAWDLPeerContext *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(CWFAWDLPeerContext);
  objc_msgSend_setMACAddress_(v7, v8, (uint64_t)v6, v9, v10);

  objc_msgSend_setInterfaceName_(v7, v11, (uint64_t)v5, v12, v13);
  return v7;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("MACAddress=%@, interfaceName=%@"), v2, v3, self->_MACAddress, self->_interfaceName);
}

- (BOOL)isEqualToAWDLPeerContext:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  NSString *MACAddress;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSString *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSString *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  char isEqual;
  NSString *interfaceName;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSString *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  NSString *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;

  v6 = a3;
  MACAddress = self->_MACAddress;
  objc_msgSend_MACAddress(v6, v8, v9, v10, v11);
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (MACAddress != v16)
  {
    if (!self->_MACAddress
      || (objc_msgSend_MACAddress(v6, v12, v13, v14, v15), (v17 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      isEqual = 0;
      goto LABEL_14;
    }
    v3 = (void *)v17;
    v22 = self->_MACAddress;
    objc_msgSend_MACAddress(v6, v18, v19, v20, v21);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v22, v23, (uint64_t)v4, v24, v25))
    {
      isEqual = 0;
LABEL_12:

      goto LABEL_14;
    }
  }
  interfaceName = self->_interfaceName;
  objc_msgSend_interfaceName(v6, v12, v13, v14, v15);
  v32 = (NSString *)objc_claimAutoreleasedReturnValue();
  isEqual = interfaceName == v32;
  if (isEqual || !self->_interfaceName)
    goto LABEL_10;
  objc_msgSend_interfaceName(v6, v28, v29, v30, v31);
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v38 = (void *)v33;
    v39 = self->_interfaceName;
    objc_msgSend_interfaceName(v6, v34, v35, v36, v37);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v39, v41, (uint64_t)v40, v42, v43);

LABEL_10:
    goto LABEL_11;
  }

  isEqual = 0;
LABEL_11:
  if (MACAddress != v16)
    goto LABEL_12;
LABEL_14:

  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  CWFAWDLPeerContext *v4;
  CWFAWDLPeerContext *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToAWDLPeerContext;

  v4 = (CWFAWDLPeerContext *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToAWDLPeerContext = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToAWDLPeerContext = objc_msgSend_isEqualToAWDLPeerContext_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    isEqualToAWDLPeerContext = 0;
  }

  return isEqualToAWDLPeerContext;
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

  v6 = objc_msgSend_hash(self->_MACAddress, a2, v2, v3, v4);
  return objc_msgSend_hash(self->_interfaceName, v7, v8, v9, v10) ^ v6;
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

  v6 = (void *)objc_msgSend_allocWithZone_(CWFAWDLPeerContext, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setMACAddress_(v11, v12, (uint64_t)self->_MACAddress, v13, v14);
  objc_msgSend_setInterfaceName_(v11, v15, (uint64_t)self->_interfaceName, v16, v17);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *MACAddress;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;

  MACAddress = self->_MACAddress;
  v9 = a3;
  objc_msgSend_encodeObject_forKey_(v9, v5, (uint64_t)MACAddress, (uint64_t)CFSTR("_MACAddress"), v6);
  objc_msgSend_encodeObject_forKey_(v9, v7, (uint64_t)self->_interfaceName, (uint64_t)CFSTR("_interfaceName"), v8);

}

- (CWFAWDLPeerContext)initWithCoder:(id)a3
{
  id v4;
  CWFAWDLPeerContext *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *MACAddress;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSString *interfaceName;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CWFAWDLPeerContext;
  v5 = -[CWFAWDLPeerContext init](&v17, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("_MACAddress"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    MACAddress = v5->_MACAddress;
    v5->_MACAddress = (NSString *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("_interfaceName"), v13);
    v14 = objc_claimAutoreleasedReturnValue();
    interfaceName = v5->_interfaceName;
    v5->_interfaceName = (NSString *)v14;

  }
  return v5;
}

- (NSString)MACAddress
{
  return self->_MACAddress;
}

- (void)setMACAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_MACAddress, 0);
}

@end
