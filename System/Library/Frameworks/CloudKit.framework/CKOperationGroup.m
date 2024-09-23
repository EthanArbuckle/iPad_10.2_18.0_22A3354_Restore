@implementation CKOperationGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authPromptReason, 0);
  objc_storeStrong((id *)&self->_quantityNumber, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_operationGroupID, 0);
  objc_storeStrong((id *)&self->_defaultConfiguration, 0);
  objc_storeStrong((id *)&self->_systemImposedInfo_locked, 0);
}

- (unint64_t)resolvedNetworkServiceTypeForConfig:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;

  v4 = a3;
  objc_msgSend_systemImposedInfo(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_networkServiceTypePerConfig(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v12, v13, (uint64_t)v4, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    v19 = objc_msgSend_unsignedIntegerValue(v15, v16, v17, v18);
  else
    v19 = 0;

  return v19;
}

- (CKOperationGroupSystemImposedInfo)systemImposedInfo
{
  CKOperationGroup *v2;
  CKOperationGroupSystemImposedInfo *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_systemImposedInfo_locked;
  objc_sync_exit(v2);

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  id v45;

  v45 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_operationGroupID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v45, v9, (uint64_t)v8, (uint64_t)CFSTR("OperationGroupID"));

  objc_msgSend_defaultConfiguration(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v45, v14, (uint64_t)v13, (uint64_t)CFSTR("DefaultConfiguration"));

  objc_msgSend_authPromptReason(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v45, v19, (uint64_t)v18, (uint64_t)CFSTR("AuthPromptReason"));

  objc_msgSend_name(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v45, v24, (uint64_t)v23, (uint64_t)CFSTR("Name"));

  objc_msgSend_quantityNumber(self, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v45, v29, (uint64_t)v28, (uint64_t)CFSTR("Quantity"));

  v33 = objc_msgSend_expectedSendSize(self, v30, v31, v32);
  objc_msgSend_encodeInt64_forKey_(v45, v34, v33, (uint64_t)CFSTR("ExpectedSendSize"));
  v38 = objc_msgSend_expectedReceiveSize(self, v35, v36, v37);
  objc_msgSend_encodeInt64_forKey_(v45, v39, v38, (uint64_t)CFSTR("ExpectedReceiveSize"));
  objc_msgSend_systemImposedInfo(self, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v45, v44, (uint64_t)v43, (uint64_t)CFSTR("SystemImposedInfo"));

  objc_autoreleasePoolPop(v4);
}

- (CKOperationGroup)initWithCoder:(NSCoder *)aDecoder
{
  NSCoder *v4;
  CKOperationGroup *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSString *operationGroupID;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  CKOperationConfiguration *defaultConfiguration;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  NSString *authPromptReason;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  NSString *name;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  NSNumber *quantityNumber;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  CKOperationGroupSystemImposedInfo *systemImposedInfo_locked;
  objc_super v36;

  v4 = aDecoder;
  v36.receiver = self;
  v36.super_class = (Class)CKOperationGroup;
  v5 = -[CKOperationGroup init](&v36, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, (uint64_t)CFSTR("OperationGroupID"));
    v9 = objc_claimAutoreleasedReturnValue();
    operationGroupID = v5->_operationGroupID;
    v5->_operationGroupID = (NSString *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("DefaultConfiguration"));
    v13 = objc_claimAutoreleasedReturnValue();
    defaultConfiguration = v5->_defaultConfiguration;
    v5->_defaultConfiguration = (CKOperationConfiguration *)v13;

    v15 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, (uint64_t)CFSTR("AuthPromptReason"));
    v17 = objc_claimAutoreleasedReturnValue();
    authPromptReason = v5->_authPromptReason;
    v5->_authPromptReason = (NSString *)v17;

    v19 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, (uint64_t)CFSTR("Name"));
    v21 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v21;

    v23 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, (uint64_t)CFSTR("Quantity"));
    v25 = objc_claimAutoreleasedReturnValue();
    quantityNumber = v5->_quantityNumber;
    v5->_quantityNumber = (NSNumber *)v25;

    v5->_expectedSendSize = objc_msgSend_decodeInt64ForKey_(v4, v27, (uint64_t)CFSTR("ExpectedSendSize"), v28);
    v5->_expectedReceiveSize = objc_msgSend_decodeInt64ForKey_(v4, v29, (uint64_t)CFSTR("ExpectedReceiveSize"), v30);
    v31 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, (uint64_t)CFSTR("SystemImposedInfo"));
    v33 = objc_claimAutoreleasedReturnValue();
    systemImposedInfo_locked = v5->_systemImposedInfo_locked;
    v5->_systemImposedInfo_locked = (CKOperationGroupSystemImposedInfo *)v33;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (CKOperationConfiguration)defaultConfiguration
{
  CKOperationGroup *v2;
  CKOperationConfiguration *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_defaultConfiguration;
  objc_sync_exit(v2);

  return v3;
}

- (CKOperationGroup)init
{
  CKOperationGroup *v2;
  uint64_t v3;
  NSString *operationGroupID;
  uint64_t v5;
  CKOperationConfiguration *defaultConfiguration;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKOperationGroup;
  v2 = -[CKOperationGroup init](&v8, sel_init);
  if (v2)
  {
    CKShortRandomID();
    v3 = objc_claimAutoreleasedReturnValue();
    operationGroupID = v2->_operationGroupID;
    v2->_operationGroupID = (NSString *)v3;

    v5 = objc_opt_new();
    defaultConfiguration = v2->_defaultConfiguration;
    v2->_defaultConfiguration = (CKOperationConfiguration *)v5;

    v2->_expectedSendSize = 0;
    v2->_expectedReceiveSize = 0;
  }
  return v2;
}

- (void)setDefaultConfiguration:(CKOperationConfiguration *)defaultConfiguration
{
  CKOperationConfiguration *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CKOperationGroup *v9;
  CKOperationConfiguration *v10;
  CKOperationConfiguration *v11;

  v4 = defaultConfiguration;
  if (!v4)
    v4 = (CKOperationConfiguration *)objc_opt_new();
  v11 = v4;
  v8 = objc_msgSend_copy(v4, v5, v6, v7);
  v9 = self;
  objc_sync_enter(v9);
  v10 = v9->_defaultConfiguration;
  v9->_defaultConfiguration = (CKOperationConfiguration *)v8;

  objc_sync_exit(v9);
}

- (void)setName:(NSString *)name
{
  objc_setProperty_atomic_copy(self, a2, name, 48);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  unint64_t v31;
  const char *v32;
  uint64_t v33;
  const __CFString *v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  const char *v70;
  void *v71;

  v5 = a4;
  v6 = a3;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_name(self, v9, v10, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend_operationGroupID(self, v12, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v17, (uint64_t)CFSTR("operationGroupID"), (uint64_t)v16);

    objc_msgSend_quantityNumber(self, v18, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v21, (uint64_t)CFSTR("quantity"), (uint64_t)v22);

    if (!v5 && v15)
    {
      if ((unint64_t)objc_msgSend_length(v15, v12, v13, v14) <= 0x80)
      {
        v25 = v15;
      }
      else
      {
        objc_msgSend_substringToIndex_(v15, v23, 128, v24);
        v25 = (id)objc_claimAutoreleasedReturnValue();
      }
      v29 = v25;
      v30 = (void *)MEMORY[0x1E0CB3940];
      v31 = objc_msgSend_length(v15, v26, v27, v28);
      v34 = &stru_1E1F66ED0;
      if (v31 > 0x80)
        v34 = CFSTR("...");
      objc_msgSend_stringWithFormat_(v30, v32, (uint64_t)CFSTR("%@%@"), v33, v29, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v36, (uint64_t)CFSTR("shortened-name"), (uint64_t)v35);

    }
  }
  if (v5)
  {
    objc_msgSend_defaultConfiguration(self, v12, v13, v14);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v38, (uint64_t)CFSTR("defaultConfiguration"), (uint64_t)v37);

    if (v15)
      objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v39, (uint64_t)CFSTR("full-name"), (uint64_t)v15);
    v42 = objc_msgSend_expectedSendSize(self, v39, v40, v41);
    if (v42)
    {
      CKStringForTransferSize(v42);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v47, (uint64_t)CFSTR("send-size"), (uint64_t)v46);

    }
    v48 = objc_msgSend_expectedReceiveSize(self, v43, v44, v45);
    if (v48)
    {
      CKStringForTransferSize(v48);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v53, (uint64_t)CFSTR("recv-size"), (uint64_t)v52);

    }
    objc_msgSend_systemImposedInfo(self, v49, v50, v51);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_networkServiceTypePerConfig(v54, v55, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKMap_(v58, v59, (uint64_t)&unk_1E1F58858, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_count(v61, v62, v63, v64))
    {
      objc_msgSend_componentsJoinedByString_(v61, v65, (uint64_t)CFSTR(";"), v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v69, (uint64_t)CFSTR("configs"), (uint64_t)v68);

    }
    objc_msgSend_authPromptReason(self, v65, v66, v67);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (v71)
      objc_msgSend_CKAddPropertySafelyForKey_value_(v8, v70, (uint64_t)CFSTR("authPromptReason"), (uint64_t)v71);

  }
  return v8;
}

- (NSString)operationGroupID
{
  return self->_operationGroupID;
}

- (NSNumber)quantityNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (CKOperationGroupTransferSize)expectedSendSize
{
  CKOperationGroup *v2;
  CKOperationGroupTransferSize expectedSendSize;

  v2 = self;
  objc_sync_enter(v2);
  expectedSendSize = v2->_expectedSendSize;
  objc_sync_exit(v2);

  return expectedSendSize;
}

- (CKOperationGroupTransferSize)expectedReceiveSize
{
  CKOperationGroup *v2;
  CKOperationGroupTransferSize expectedReceiveSize;

  v2 = self;
  objc_sync_enter(v2);
  expectedReceiveSize = v2->_expectedReceiveSize;
  objc_sync_exit(v2);

  return expectedReceiveSize;
}

- (void)setExpectedSendSize:(CKOperationGroupTransferSize)expectedSendSize
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CKOperationGroupSystemImposedInfo *systemImposedInfo_locked;
  CKOperationGroupTransferSize v8;
  CKOperationGroupSystemImposedInfo *v9;
  CKOperationGroup *obj;

  obj = self;
  objc_sync_enter(obj);
  systemImposedInfo_locked = obj->_systemImposedInfo_locked;
  if (systemImposedInfo_locked)
  {
    v8 = objc_msgSend_expectedSendSize(systemImposedInfo_locked, v4, v5, v6);
    if (expectedSendSize == CKOperationGroupTransferSizeUnknown || v8 < expectedSendSize)
    {
      v9 = obj->_systemImposedInfo_locked;
      obj->_systemImposedInfo_locked = 0;

    }
  }
  obj->_expectedSendSize = expectedSendSize;
  objc_sync_exit(obj);

}

- (void)setExpectedReceiveSize:(CKOperationGroupTransferSize)expectedReceiveSize
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CKOperationGroupSystemImposedInfo *systemImposedInfo_locked;
  CKOperationGroupTransferSize v8;
  CKOperationGroupSystemImposedInfo *v9;
  CKOperationGroup *obj;

  obj = self;
  objc_sync_enter(obj);
  systemImposedInfo_locked = obj->_systemImposedInfo_locked;
  if (systemImposedInfo_locked)
  {
    v8 = objc_msgSend_expectedReceiveSize(systemImposedInfo_locked, v4, v5, v6);
    if (expectedReceiveSize == CKOperationGroupTransferSizeUnknown || v8 < expectedReceiveSize)
    {
      v9 = obj->_systemImposedInfo_locked;
      obj->_systemImposedInfo_locked = 0;

    }
  }
  obj->_expectedReceiveSize = expectedReceiveSize;
  objc_sync_exit(obj);

}

- (NSUInteger)quantity
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;

  objc_msgSend_quantityNumber(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_unsignedIntegerValue(v4, v5, v6, v7);

  return v8;
}

- (NSString)authPromptReason
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)initialize
{
  objc_class *v2;
  uint64_t v3;

  v2 = (objc_class *)objc_opt_class();
  v3 = objc_opt_self();
  sub_18A5CEF4C(v3, v2, 0, 0, 0);
}

- (void)setSystemImposedInfo:(id)a3
{
  CKOperationGroup *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CKOperationGroupSystemImposedInfo *systemImposedInfo_locked;
  id v10;

  v10 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v8 = objc_msgSend_copy(v10, v5, v6, v7);
  systemImposedInfo_locked = v4->_systemImposedInfo_locked;
  v4->_systemImposedInfo_locked = (CKOperationGroupSystemImposedInfo *)v8;

  objc_sync_exit(v4);
}

- (void)setQuantity:(NSUInteger)quantity
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  id v7;

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], a2, quantity, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setQuantityNumber_(self, v5, (uint64_t)v7, v6);

}

- (int64_t)approximateSendBytes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v5 = objc_msgSend_expectedSendSize(self, a2, v2, v3);
  if (!self)
    return 0;
  if ((unint64_t)(v5 - 1) > 6)
    return -1;
  return qword_18A83D318[v5 - 1];
}

- (int64_t)approximateReceiveBytes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v5 = objc_msgSend_expectedReceiveSize(self, a2, v2, v3);
  if (!self)
    return 0;
  if ((unint64_t)(v5 - 1) > 6)
    return -1;
  return qword_18A83D318[v5 - 1];
}

- (id)description
{
  return (id)((uint64_t (*)(CKOperationGroup *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (void)setQuantityNumber:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void)setAuthPromptReason:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

@end
