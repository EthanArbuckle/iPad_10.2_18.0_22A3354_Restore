@implementation CKDApplicationID

- (void)ck_bindInStatement:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  id v10;

  v6 = a3;
  objc_msgSend_sqliteRepresentation(self, v7, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bindText_atIndex_(v6, v9, (uint64_t)v10, a4);

}

- (BOOL)isEqual:(id)a3
{
  CKDApplicationID *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  int isEqualToString;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  int v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  int v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  int v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  char v40;

  v4 = (CKDApplicationID *)a3;
  if (self == v4)
  {
    v40 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_8;
    objc_msgSend_applicationBundleIdentifier(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applicationBundleIdentifier(v4, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v7, v11, (uint64_t)v10);

    if (!isEqualToString)
      goto LABEL_8;
    objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v4, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = CKObjectsAreBothNilOrEqual();

    if (!v19)
      goto LABEL_8;
    objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(self, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v4, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = CKObjectsAreBothNilOrEqual();

    if (!v26)
      goto LABEL_8;
    objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(self, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(v4, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = CKObjectsAreBothNilOrEqual();

    if (v33)
    {
      objc_msgSend_applicationBundleIdentifierOverrideForTCC(self, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applicationBundleIdentifierOverrideForTCC(v4, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = CKObjectsAreBothNilOrEqual();

    }
    else
    {
LABEL_8:
      v40 = 0;
    }
  }

  return v40;
}

- (id)sqliteRepresentation
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const char *v35;
  void *v36;
  id v37;
  NSObject *v38;
  id v39;
  const char *v40;
  void *v41;
  id v43;
  uint8_t buf[4];
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifier(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_applicationBundleIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v4, v9, (uint64_t)v7, v8);

  objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_applicationBundleIdentifierOverrideForContainerAccess);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v4, v17, (uint64_t)v15, v16);

  }
  objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(self, v13, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(self, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_applicationBundleIdentifierOverrideForNetworkAttribution);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v4, v23, (uint64_t)v21, v22);

  }
  objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(self, v19, v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(self, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_applicationBundleIdentifierOverrideForPushTopicGeneration);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v4, v29, (uint64_t)v27, v28);

  }
  objc_msgSend_applicationBundleIdentifierOverrideForTCC(self, v25, v26);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend_applicationBundleIdentifierOverrideForTCC(self, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_applicationBundleIdentifierOverrideForTCC);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v4, v35, (uint64_t)v33, v34);

  }
  v43 = 0;
  objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x1E0CB36D8], v31, (uint64_t)v4, 0, &v43);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v43;
  if (v37)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v38 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v37;
      _os_log_error_impl(&dword_1BE990000, v38, OS_LOG_TYPE_ERROR, "Error converting CKDApplicationID to JSON: %@", buf, 0xCu);
    }
  }
  v39 = objc_alloc(MEMORY[0x1E0CB3940]);
  v41 = (void *)objc_msgSend_initWithData_encoding_(v39, v40, (uint64_t)v36, 4);

  return v41;
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifier(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v10, (uint64_t)v9, CFSTR("applicationBundleID"));

  objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v17, (uint64_t)v16, CFSTR("containerAccess"));

  }
  objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(self, v14, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(self, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v22, (uint64_t)v21, CFSTR("networkAttribution"));

  }
  objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(self, v19, v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(self, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v27, (uint64_t)v26, CFSTR("pushTopic"));

  }
  objc_msgSend_applicationBundleIdentifierOverrideForTCC(self, v24, v25);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend_applicationBundleIdentifierOverrideForTCC(self, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v6, v32, (uint64_t)v31, CFSTR("TCC"));

  }
  return v6;
}

- (NSString)applicationBundleIdentifierOverrideForTCC
{
  return self->_applicationBundleIdentifierOverrideForTCC;
}

- (NSString)applicationBundleIdentifierOverrideForContainerAccess
{
  return self->_applicationBundleIdentifierOverrideForContainerAccess;
}

- (NSString)applicationBundleIdentifierOverrideForNetworkAttribution
{
  return self->_applicationBundleIdentifierOverrideForNetworkAttribution;
}

- (NSString)applicationBundleIdentifierOverrideForPushTopicGeneration
{
  return self->_applicationBundleIdentifierOverrideForPushTopicGeneration;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (CKDApplicationID)initWithApplicationBundleIdentifier:(id)a3 applicationBundleIdentifierOverrideForContainerAccess:(id)a4 applicationBundleIdentifierOverrideForNetworkAttribution:(id)a5 applicationBundleIdentifierOverrideForPushTopicGeneration:(id)a6 applicationBundleIdentifierOverrideForTCC:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  char v17;
  id v18;
  const char *v19;
  uint64_t v20;
  CKDApplicationID *v21;
  uint64_t v22;
  NSString *applicationBundleIdentifier;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  NSString *applicationBundleIdentifierOverrideForContainerAccess;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  NSString *applicationBundleIdentifierOverrideForNetworkAttribution;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  NSString *applicationBundleIdentifierOverrideForPushTopicGeneration;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  NSString *applicationBundleIdentifierOverrideForTCC;
  void *v41;
  id v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  id v50;
  objc_super v51;
  uint64_t v52;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v52 = 0;
  v17 = _CKCheckArgument();
  v18 = 0;
  if ((v17 & 1) == 0)
  {
    v41 = v18;
    v42 = objc_alloc(MEMORY[0x1E0C94D90]);
    v45 = objc_msgSend_code(v41, v43, v44);
    objc_msgSend_localizedDescription(v41, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (id)objc_msgSend_initWithCode_format_(v42, v49, v45, CFSTR("%@"), v48);

    objc_exception_throw(v50);
  }

  v51.receiver = self;
  v51.super_class = (Class)CKDApplicationID;
  v21 = -[CKDApplicationID init](&v51, sel_init);
  if (v21)
  {
    v22 = objc_msgSend_copy(v12, v19, v20);
    applicationBundleIdentifier = v21->_applicationBundleIdentifier;
    v21->_applicationBundleIdentifier = (NSString *)v22;

    v26 = objc_msgSend_copy(v13, v24, v25);
    applicationBundleIdentifierOverrideForContainerAccess = v21->_applicationBundleIdentifierOverrideForContainerAccess;
    v21->_applicationBundleIdentifierOverrideForContainerAccess = (NSString *)v26;

    v30 = objc_msgSend_copy(v14, v28, v29);
    applicationBundleIdentifierOverrideForNetworkAttribution = v21->_applicationBundleIdentifierOverrideForNetworkAttribution;
    v21->_applicationBundleIdentifierOverrideForNetworkAttribution = (NSString *)v30;

    v34 = objc_msgSend_copy(v15, v32, v33);
    applicationBundleIdentifierOverrideForPushTopicGeneration = v21->_applicationBundleIdentifierOverrideForPushTopicGeneration;
    v21->_applicationBundleIdentifierOverrideForPushTopicGeneration = (NSString *)v34;

    v38 = objc_msgSend_copy(v16, v36, v37);
    applicationBundleIdentifierOverrideForTCC = v21->_applicationBundleIdentifierOverrideForTCC;
    v21->_applicationBundleIdentifierOverrideForTCC = (NSString *)v38;

  }
  return v21;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKDApplicationID *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (unint64_t)hash
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  unint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;

  objc_msgSend_applicationBundleIdentifier(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_hash(v4, v5, v6);

  objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7 ^= objc_msgSend_hash(v13, v14, v15);

  }
  objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(self, v11, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(self, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v7 ^= objc_msgSend_hash(v19, v20, v21);

  }
  objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(self, v17, v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(self, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v7 ^= objc_msgSend_hash(v25, v26, v27);

  }
  objc_msgSend_applicationBundleIdentifierOverrideForTCC(self, v23, v24);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend_applicationBundleIdentifierOverrideForTCC(self, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v7 ^= objc_msgSend_hash(v31, v32, v33);

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForTCC, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForPushTopicGeneration, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForNetworkAttribution, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForContainerAccess, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
}

- (CKDApplicationID)init
{
  id v2;
  uint64_t v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  id v7;

  v2 = objc_alloc(MEMORY[0x1E0C94D90]);
  v3 = *MEMORY[0x1E0C99778];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend_initWithName_format_(v2, v6, v3, CFSTR("-[%@ init] is unavailable"), v5);

  objc_exception_throw(v7);
}

- (CKDApplicationID)initWithApplicationBundleIdentifier:(id)a3
{
  return (CKDApplicationID *)objc_msgSend_initWithApplicationBundleIdentifier_applicationBundleIdentifierOverrideForContainerAccess_applicationBundleIdentifierOverrideForNetworkAttribution_applicationBundleIdentifierOverrideForPushTopicGeneration_applicationBundleIdentifierOverrideForTCC_(self, a2, (uint64_t)a3, 0, 0, 0, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKDApplicationID)initWithCoder:(id)a3
{
  id v4;
  CKDApplicationID *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  NSString *applicationBundleIdentifier;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  NSString *applicationBundleIdentifierOverrideForContainerAccess;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  NSString *applicationBundleIdentifierOverrideForNetworkAttribution;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  NSString *applicationBundleIdentifierOverrideForPushTopicGeneration;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  NSString *applicationBundleIdentifierOverrideForTCC;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CKDApplicationID;
  v5 = -[CKDApplicationID init](&v32, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_applicationBundleIdentifier);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    applicationBundleIdentifier = v5->_applicationBundleIdentifier;
    v5->_applicationBundleIdentifier = (NSString *)v9;

    v11 = objc_opt_class();
    NSStringFromSelector(sel_applicationBundleIdentifierOverrideForContainerAccess);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v11, v12);
    v14 = objc_claimAutoreleasedReturnValue();
    applicationBundleIdentifierOverrideForContainerAccess = v5->_applicationBundleIdentifierOverrideForContainerAccess;
    v5->_applicationBundleIdentifierOverrideForContainerAccess = (NSString *)v14;

    v16 = objc_opt_class();
    NSStringFromSelector(sel_applicationBundleIdentifierOverrideForNetworkAttribution);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v16, v17);
    v19 = objc_claimAutoreleasedReturnValue();
    applicationBundleIdentifierOverrideForNetworkAttribution = v5->_applicationBundleIdentifierOverrideForNetworkAttribution;
    v5->_applicationBundleIdentifierOverrideForNetworkAttribution = (NSString *)v19;

    v21 = objc_opt_class();
    NSStringFromSelector(sel_applicationBundleIdentifierOverrideForPushTopicGeneration);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v21, v22);
    v24 = objc_claimAutoreleasedReturnValue();
    applicationBundleIdentifierOverrideForPushTopicGeneration = v5->_applicationBundleIdentifierOverrideForPushTopicGeneration;
    v5->_applicationBundleIdentifierOverrideForPushTopicGeneration = (NSString *)v24;

    v26 = objc_opt_class();
    NSStringFromSelector(sel_applicationBundleIdentifierOverrideForTCC);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v28, v26, v27);
    v29 = objc_claimAutoreleasedReturnValue();
    applicationBundleIdentifierOverrideForTCC = v5->_applicationBundleIdentifierOverrideForTCC;
    v5->_applicationBundleIdentifierOverrideForTCC = (NSString *)v29;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  id v35;

  v35 = a3;
  objc_msgSend_applicationBundleIdentifier(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_applicationBundleIdentifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v35, v8, (uint64_t)v6, v7);

  objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_applicationBundleIdentifierOverrideForContainerAccess);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v35, v16, (uint64_t)v14, v15);

  }
  objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(self, v12, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(self, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_applicationBundleIdentifierOverrideForNetworkAttribution);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v35, v22, (uint64_t)v20, v21);

  }
  objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(self, v18, v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(self, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_applicationBundleIdentifierOverrideForPushTopicGeneration);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v35, v28, (uint64_t)v26, v27);

  }
  objc_msgSend_applicationBundleIdentifierOverrideForTCC(self, v24, v25);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend_applicationBundleIdentifierOverrideForTCC(self, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_applicationBundleIdentifierOverrideForTCC);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v35, v34, (uint64_t)v32, v33);

  }
}

- (CKDApplicationID)initWithSqliteRepresentation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  id v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  void *v20;
  const char *v21;
  void *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  CKDApplicationID *v27;
  NSObject *v28;
  void *v30;
  id v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend_length(v4, v5, v6))
  {
    objc_msgSend_dataUsingEncoding_(v4, v7, 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E0CB36D8], v9, (uint64_t)v8, 0, &v31);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v31;
    if (v11 || !v10)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v28 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v11;
        _os_log_error_impl(&dword_1BE990000, v28, OS_LOG_TYPE_ERROR, "Error converting JSON data to CKDApplicationID: %@", buf, 0xCu);
      }
      v27 = 0;
    }
    else
    {
      NSStringFromSelector(sel_applicationBundleIdentifier);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v10, v13, (uint64_t)v12);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      NSStringFromSelector(sel_applicationBundleIdentifierOverrideForContainerAccess);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v10, v15, (uint64_t)v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      NSStringFromSelector(sel_applicationBundleIdentifierOverrideForNetworkAttribution);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v10, v18, (uint64_t)v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      NSStringFromSelector(sel_applicationBundleIdentifierOverrideForPushTopicGeneration);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v10, v21, (uint64_t)v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      NSStringFromSelector(sel_applicationBundleIdentifierOverrideForTCC);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v10, v24, (uint64_t)v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      self = (CKDApplicationID *)(id)objc_msgSend_initWithApplicationBundleIdentifier_applicationBundleIdentifierOverrideForContainerAccess_applicationBundleIdentifierOverrideForNetworkAttribution_applicationBundleIdentifierOverrideForPushTopicGeneration_applicationBundleIdentifierOverrideForTCC_(self, v26, (uint64_t)v30, v16, v19, v22, v25);
      v27 = self;
    }

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

@end
