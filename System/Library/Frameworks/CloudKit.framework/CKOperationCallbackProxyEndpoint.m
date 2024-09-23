@implementation CKOperationCallbackProxyEndpoint

- (CKOperationCallbackProxyEndpoint)initWithClass:(Class)a3 protocol:(id)a4 endpoint:(id)a5
{
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  CKOperationCallbackProxyEndpoint *v15;
  CKOperationCallbackProxyEndpoint *v16;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  objc_super v24;

  v10 = a4;
  v14 = a5;
  if (a3)
  {
    if (v10)
      goto LABEL_3;
LABEL_8:
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v11, v12, v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v21, (uint64_t)a2, (uint64_t)self, CFSTR("CKOperationCallbackProxy.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("protocol"));

    if (v14)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v11, v12, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, (uint64_t)self, CFSTR("CKOperationCallbackProxy.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cls"));

  if (!v10)
    goto LABEL_8;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_9:
  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v11, v12, v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, (uint64_t)self, CFSTR("CKOperationCallbackProxy.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endpoint"));

LABEL_4:
  v24.receiver = self;
  v24.super_class = (Class)CKOperationCallbackProxyEndpoint;
  v15 = -[CKOperationCallbackProxyEndpoint init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_cls, a3);
    objc_storeStrong((id *)&v16->_protocol, a4);
    objc_storeStrong((id *)&v16->_endpoint, a5);
  }

  return v16;
}

- (NSXPCInterface)interface
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;

  if (qword_1ECD96A48 != -1)
    dispatch_once(&qword_1ECD96A48, &unk_1E1F583D8);
  v3 = (id)qword_1ECD96A40;
  objc_sync_enter(v3);
  v4 = (void *)MEMORY[0x1E0CB3940];
  v8 = objc_msgSend_cls(self, v5, v6, v7);
  objc_msgSend_protocol(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v13, (uint64_t)CFSTR("%@:%@"), v14, v8, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKey_((void *)qword_1ECD96A40, v16, (uint64_t)v15, v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    v22 = (void *)MEMORY[0x1E0CB3B50];
    objc_msgSend_protocol(self, v18, v19, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_interfaceWithProtocol_(v22, v24, (uint64_t)v23, v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = (void *)objc_msgSend_cls(self, v26, v27, v28);
    objc_msgSend_applyDaemonCallbackInterfaceTweaks_(v29, v30, (uint64_t)v21, v31);
    objc_msgSend_setObject_forKey_((void *)qword_1ECD96A40, v32, (uint64_t)v21, (uint64_t)v15);
  }

  objc_sync_exit(v3);
  return (NSXPCInterface *)v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  Protocol *v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  CKException *v28;
  const char *v29;
  id v30;
  id v31;

  v31 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v28 = [CKException alloc];
    v30 = (id)objc_msgSend_initWithName_format_(v28, v29, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("This class must only be encoded by NSXPCCoder"));
    objc_exception_throw(v30);
  }
  v7 = (void *)objc_msgSend_cls(self, v4, v5, v6);
  objc_msgSend_protocol(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18A6E5638(v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKMap_(v12, v13, (uint64_t)&unk_1E1F58E98, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_encodeObject_forKey_(v31, v16, (uint64_t)v15, (uint64_t)CFSTR("CK.classNames"));
  objc_msgSend_protocol(self, v17, v18, v19);
  v20 = (Protocol *)objc_claimAutoreleasedReturnValue();
  NSStringFromProtocol(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v31, v22, (uint64_t)v21, (uint64_t)CFSTR("CK.protocolName"));

  objc_msgSend_endpoint(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v31, v27, (uint64_t)v26, (uint64_t)CFSTR("CK.endpoint"));

}

- (CKOperationCallbackProxyEndpoint)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t Object;
  void *v20;
  uint64_t v21;
  const char *v22;
  NSString *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  void *v29;
  uint64_t v30;
  CKOperationCallbackProxyEndpoint *v31;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  NSString *v37;
  int v38;
  NSString *v39;
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v40[0] = objc_opt_class();
  v40[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v6, (uint64_t)v40, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v5, v8, (uint64_t)v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v11, (uint64_t)v10, (uint64_t)CFSTR("CK.classNames"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_CKCompactMap_(v12, v13, (uint64_t)&unk_1E1F59018, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  Object = objc_msgSend_lastObject(v15, v16, v17, v18);
  if (!Object)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v20 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      v33 = v20;
      objc_msgSend_lastObject(v12, v34, v35, v36);
      v37 = (NSString *)objc_claimAutoreleasedReturnValue();
      v38 = 138412290;
      v39 = v37;

    }
  }
  v21 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, (uint64_t)CFSTR("CK.protocolName"));
  v23 = (NSString *)objc_claimAutoreleasedReturnValue();
  NSProtocolFromString(v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v25 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
    {
      v38 = 138412290;
      v39 = v23;
    }
  }
  v26 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, (uint64_t)CFSTR("CK.endpoint"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!Object)
    Object = objc_opt_class();
  if (v24)
    v30 = objc_msgSend_initWithClass_protocol_endpoint_(self, v28, Object, (uint64_t)v24, v29);
  else
    v30 = objc_msgSend_initWithClass_protocol_endpoint_(self, v28, Object, (uint64_t)&unk_1EDF79510, v29);
  v31 = (CKOperationCallbackProxyEndpoint *)v30;

  return v31;
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (Class)cls
{
  return self->_cls;
}

- (Protocol)protocol
{
  return self->_protocol;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_cls, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end
