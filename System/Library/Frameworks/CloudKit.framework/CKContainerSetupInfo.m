@implementation CKContainerSetupInfo

- (CKAccountOverrideInfo)accountOverrideInfo
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_containerOptions(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountOverrideInfo(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKAccountOverrideInfo *)v8;
}

- (CKContainerSetupInfo)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  CKContainerSetupInfo *v14;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_containerID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, (uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_opt_class();
  NSStringFromSelector(sel_containerOptions);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v9, (uint64_t)v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (CKContainerSetupInfo *)objc_msgSend_initWithContainerID_options_(self, v13, (uint64_t)v8, (uint64_t)v12);
  return v14;
}

- (CKContainerSetupInfo)initWithContainerID:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CKContainerSetupInfo *v11;
  uint64_t v12;
  CKContainerID *containerID;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CKContainerOptions *containerOptions;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CKContainerSetupInfo;
  v11 = -[CKContainerSetupInfo init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend_copy(v6, v8, v9, v10);
    containerID = v11->_containerID;
    v11->_containerID = (CKContainerID *)v12;

    v17 = objc_msgSend_copy(v7, v14, v15, v16);
    containerOptions = v11->_containerOptions;
    v11->_containerOptions = (CKContainerOptions *)v17;

  }
  return v11;
}

- (id)hashString
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  uint64_t v13;

  v13 = 0;
  objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], a2, (uint64_t)self, 0, &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  if (v13 || (objc_msgSend_CKSHA256(v4, v5, v6, v7), (v11 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, CFSTR("CKContainerSetupInfo.m"), 55, CFSTR("Couldn't encode %@"), self);

    v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  id v17;

  v17 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_containerID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_containerID);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v17, v10, (uint64_t)v8, (uint64_t)v9);

  objc_msgSend_containerOptions(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_containerOptions);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v17, v16, (uint64_t)v14, (uint64_t)v15);

  objc_autoreleasePoolPop(v4);
}

- (CKContainerOptions)containerOptions
{
  return self->_containerOptions;
}

- (CKContainerID)containerID
{
  return self->_containerID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_containerOptions, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;

  objc_msgSend_containerID(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  objc_msgSend_containerOptions(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  CKContainerSetupInfo *v4;
  CKContainerSetupInfo *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  char isEqual;

  v4 = (CKContainerSetupInfo *)a3;
  if (self == v4)
  {
    isEqual = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend_containerID(self, v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_containerID(v5, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqual_(v9, v14, (uint64_t)v13, v15))
      {
        objc_msgSend_containerOptions(self, v16, v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_containerOptions(v5, v20, v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v19, v24, (uint64_t)v23, v25);

      }
      else
      {
        isEqual = 0;
      }

    }
    else
    {
      isEqual = 0;
    }
  }

  return isEqual;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4;
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
  const char *v18;
  id v19;

  v4 = a3;
  objc_msgSend_containerID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v9, (uint64_t)CFSTR("containerID"), (uint64_t)v8, 0);

  objc_msgSend_containerOptions(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v14, (uint64_t)CFSTR("containerOptions"), (uint64_t)v13, 0);

  objc_msgSend_accountOverrideInfo(self, v15, v16, v17);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v18, (uint64_t)CFSTR("accountOverrideInfo"), (uint64_t)v19, 1);

}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKContainerSetupInfo *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKContainerSetupInfo *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
}

- (id)copyWithoutAccountInfo
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend_copy(self, a2, v2, v3);
  objc_msgSend__stripAccountInfo(v4, v5, v6, v7);
  return v4;
}

- (void)_stripAccountInfo
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  id v13;

  objc_msgSend_containerOptions(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAccountOverrideInfo_(v5, v6, 0, v7);

  objc_msgSend_containerOptions(self, v8, v9, v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPersonaIdentifier_(v13, v11, 0, v12);

}

- (id)copyWithZone:(_NSZone *)a3
{
  CKContainerSetupInfo *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;

  v4 = [CKContainerSetupInfo alloc];
  objc_msgSend_containerID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerOptions(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend_initWithContainerID_options_(v4, v13, (uint64_t)v8, (uint64_t)v12);

  return v14;
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.cloudkit.sharingsupport.container");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], a2, (uint64_t)v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  void *v6;
  id v7;
  uint64_t v8;
  const char *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB3710];
  v7 = a3;
  v8 = objc_opt_class();
  objc_msgSend_unarchivedObjectOfClass_fromData_error_(v6, v9, v8, (uint64_t)v7, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.cloudkit.sharingsupport.container");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], a2, (uint64_t)v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:(id)a3
{
  return 0;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  void (**v5)(id, void *, id);
  const char *v6;
  void *v7;
  id v8;
  id v10;

  v5 = (void (**)(id, void *, id))a4;
  v10 = 0;
  objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v6, (uint64_t)self, 1, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v10;
  if (v5)
    v5[2](v5, v7, v8);

  return 0;
}

@end
