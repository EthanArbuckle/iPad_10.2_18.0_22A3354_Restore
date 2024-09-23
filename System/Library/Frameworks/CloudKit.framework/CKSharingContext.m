@implementation CKSharingContext

- (CKSharingContext)initWithShare:(id)a3 containerSetupInfo:(id)a4 allowedOptions:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  CKSharingContext *v14;
  uint64_t v15;
  CKShare *share;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CKContainerSetupInfo *containerSetupInfo;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  CKAllowedSharingOptions *allowedOptions;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)CKSharingContext;
  v14 = -[CKSharingContext init](&v28, sel_init);
  if (v14)
  {
    v15 = objc_msgSend_copy(v8, v11, v12, v13);
    share = v14->_share;
    v14->_share = (CKShare *)v15;

    v20 = objc_msgSend_copy(v9, v17, v18, v19);
    containerSetupInfo = v14->_containerSetupInfo;
    v14->_containerSetupInfo = (CKContainerSetupInfo *)v20;

    v25 = objc_msgSend_copy(v10, v22, v23, v24);
    allowedOptions = v14->_allowedOptions;
    v14->_allowedOptions = (CKAllowedSharingOptions *)v25;

  }
  return v14;
}

- (CKSharingContext)initWithCoder:(id)a3
{
  id v4;
  CKSharingContext *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  CKShare *share;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  CKContainerSetupInfo *containerSetupInfo;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  CKAllowedSharingOptions *allowedOptions;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CKSharingContext;
  v5 = -[CKSharingContext init](&v25, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("CKSharingContextShareKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    share = v5->_share;
    v5->_share = (CKShare *)v8;

    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, (uint64_t)CFSTR("CKSharingContextContainerSetupInfoKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    containerSetupInfo = v5->_containerSetupInfo;
    v5->_containerSetupInfo = (CKContainerSetupInfo *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    objc_msgSend_setWithObjects_(v14, v18, v15, v19, v16, v17, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v21, (uint64_t)v20, (uint64_t)CFSTR("CKSharingContextAllowedOptionsKey"));
    v22 = objc_claimAutoreleasedReturnValue();
    allowedOptions = v5->_allowedOptions;
    v5->_allowedOptions = (CKAllowedSharingOptions *)v22;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  CKShare *share;
  const char *v5;
  const char *v6;
  const char *v7;
  id v8;

  share = self->_share;
  v8 = a3;
  objc_msgSend_encodeObject_forKey_(v8, v5, (uint64_t)share, (uint64_t)CFSTR("CKSharingContextShareKey"));
  objc_msgSend_encodeObject_forKey_(v8, v6, (uint64_t)self->_containerSetupInfo, (uint64_t)CFSTR("CKSharingContextContainerSetupInfoKey"));
  objc_msgSend_encodeObject_forKey_(v8, v7, (uint64_t)self->_allowedOptions, (uint64_t)CFSTR("CKSharingContextAllowedOptionsKey"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CKSharingContext *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CKShare *share;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CKContainerSetupInfo *containerSetupInfo;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CKAllowedSharingOptions *allowedOptions;

  v4 = objc_alloc_init(CKSharingContext);
  objc_msgSend_share(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_copy(v8, v9, v10, v11);
  share = v4->_share;
  v4->_share = (CKShare *)v12;

  objc_msgSend_containerSetupInfo(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_copy(v17, v18, v19, v20);
  containerSetupInfo = v4->_containerSetupInfo;
  v4->_containerSetupInfo = (CKContainerSetupInfo *)v21;

  objc_msgSend_allowedOptions(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_copy(v26, v27, v28, v29);
  allowedOptions = v4->_allowedOptions;
  v4->_allowedOptions = (CKAllowedSharingOptions *)v30;

  return v4;
}

- (CKShare)share
{
  return self->_share;
}

- (void)setShare:(id)a3
{
  objc_storeStrong((id *)&self->_share, a3);
}

- (CKContainerSetupInfo)containerSetupInfo
{
  return self->_containerSetupInfo;
}

- (void)setContainerSetupInfo:(id)a3
{
  objc_storeStrong((id *)&self->_containerSetupInfo, a3);
}

- (CKAllowedSharingOptions)allowedOptions
{
  return self->_allowedOptions;
}

- (void)setAllowedOptions:(id)a3
{
  objc_storeStrong((id *)&self->_allowedOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedOptions, 0);
  objc_storeStrong((id *)&self->_containerSetupInfo, 0);
  objc_storeStrong((id *)&self->_share, 0);
}

@end
