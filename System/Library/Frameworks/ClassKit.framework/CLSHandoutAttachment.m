@implementation CLSHandoutAttachment

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D40785C8;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB570 != -1)
    dispatch_once(&qword_1ED0FB570, block);
  return (id)qword_1ED0FB568;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSHandoutAttachment;
  return -[CLSObject _init](&v3, sel__init);
}

- (CLSHandoutAttachment)initWithType:(int)a3 title:(id)a4
{
  id v6;
  CLSHandoutAttachment *v7;
  const char *v8;
  uint64_t v9;
  CLSHandoutAttachment *v10;
  uint64_t v11;
  NSString *title;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CLSHandoutAttachment;
  v7 = -[CLSObject _init](&v14, sel__init);
  v10 = v7;
  if (v7)
  {
    v7->_type = a3;
    v11 = objc_msgSend_copy(v6, v8, v9);
    title = v10->_title;
    v10->_title = (NSString *)v11;

  }
  return v10;
}

- (BOOL)validateObject:(id *)a3
{
  _BOOL4 v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  unsigned int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  void *v21;
  const char *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CLSHandoutAttachment;
  v5 = -[CLSObject validateObject:](&v24, sel_validateObject_);
  if (v5)
  {
    if (objc_msgSend_length(self->_title, v6, v7))
    {
      v10 = self->_type - 2;
      if (v10 < 5 && ((0x1Du >> v10) & 1) != 0 || objc_msgSend_length(self->_bundleIdentifier, v8, v9))
      {
        LOBYTE(v5) = 1;
        return v5;
      }
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v17 = (void *)MEMORY[0x1E0CB34D0];
      v18 = objc_opt_class();
      objc_msgSend_bundleForClass_(v17, v19, v18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v15, v20, (uint64_t)CFSTR("ERROR_DESCRIPTION_HANDOUT_ATTACHMENT_NO_BUNDLE_ID"), &stru_1E974C8A0, CFSTR("ClassKit"));
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = (void *)MEMORY[0x1E0CB34D0];
      v13 = objc_opt_class();
      objc_msgSend_bundleForClass_(v12, v14, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v15, v16, (uint64_t)CFSTR("ERROR_DESCRIPTION_HANDOUT_ATTACHMENT_NO_TITLE"), &stru_1E974C8A0, CFSTR("ClassKit"));
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cls_assignError_code_errorObject_description_(v11, v22, (uint64_t)a3, 2, self, v21);

    LOBYTE(v5) = 0;
  }
  return v5;
}

- (CLSHandoutAttachment)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  CLSHandoutAttachment *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  NSURL *URL;
  id v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  NSArray *contextPath;
  const char *v21;
  uint64_t v22;
  NSString *contextSummary;
  const char *v24;
  uint64_t v25;
  NSString *contextCustomTypeName;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  NSString *title;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  NSString *bundleIdentifier;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  NSString *applicationName;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  NSString *storeIdentifier;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  NSString *contentStoreIdentifier;
  const char *v48;
  const char *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  NSDate *dateLastCompleted;
  const char *v56;
  const char *v57;
  uint64_t v58;
  double v59;
  int type;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  NSString *v64;
  objc_super v66;

  v4 = a3;
  v66.receiver = self;
  v66.super_class = (Class)CLSHandoutAttachment;
  v6 = -[CLSObject initWithCoder:](&v66, sel_initWithCoder_, v4);
  if (v6)
  {
    v6->_type = objc_msgSend_decodeInt32ForKey_(v4, v5, (uint64_t)CFSTR("type"));
    v6->_shareType = objc_msgSend_decodeInt32ForKey_(v4, v7, (uint64_t)CFSTR("shareType"));
    v6->_permissionType = objc_msgSend_decodeInt32ForKey_(v4, v8, (uint64_t)CFSTR("permissionType"));
    v9 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, CFSTR("URL"));
    v11 = objc_claimAutoreleasedReturnValue();
    URL = v6->_URL;
    v6->_URL = (NSURL *)v11;

    v13 = objc_alloc(MEMORY[0x1E0C99E60]);
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v17 = (void *)objc_msgSend_initWithObjects_(v13, v16, v14, v15, 0);
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v18, (uint64_t)v17, CFSTR("contextPath"));
    v19 = objc_claimAutoreleasedReturnValue();
    contextPath = v6->_contextPath;
    v6->_contextPath = (NSArray *)v19;

    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v21, (uint64_t)v17, CFSTR("contextSummary"));
    v22 = objc_claimAutoreleasedReturnValue();
    contextSummary = v6->_contextSummary;
    v6->_contextSummary = (NSString *)v22;

    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v24, (uint64_t)v17, CFSTR("contextCustomTypeName"));
    v25 = objc_claimAutoreleasedReturnValue();
    contextCustomTypeName = v6->_contextCustomTypeName;
    v6->_contextCustomTypeName = (NSString *)v25;

    v6->_contextSourceIsCatalog = objc_msgSend_decodeBoolForKey_(v4, v27, (uint64_t)CFSTR("contextSourceIsCatalog"));
    v28 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v29, v28, CFSTR("title"));
    v30 = objc_claimAutoreleasedReturnValue();
    title = v6->_title;
    v6->_title = (NSString *)v30;

    v32 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v33, v32, CFSTR("bundleIdentifier"));
    v34 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v34;

    v36 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v37, v36, CFSTR("applicationName"));
    v38 = objc_claimAutoreleasedReturnValue();
    applicationName = v6->_applicationName;
    v6->_applicationName = (NSString *)v38;

    v40 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v41, v40, CFSTR("storeIdentifier"));
    v42 = objc_claimAutoreleasedReturnValue();
    storeIdentifier = v6->_storeIdentifier;
    v6->_storeIdentifier = (NSString *)v42;

    v44 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v45, v44, CFSTR("contentStoreIdentifier"));
    v46 = objc_claimAutoreleasedReturnValue();
    contentStoreIdentifier = v6->_contentStoreIdentifier;
    v6->_contentStoreIdentifier = (NSString *)v46;

    v6->_completionStatus = objc_msgSend_decodeInt32ForKey_(v4, v48, (uint64_t)CFSTR("completionStatus"));
    v6->_displayOrder = objc_msgSend_decodeIntegerForKey_(v4, v49, (uint64_t)CFSTR("displayOrder"));
    v6->_locked = objc_msgSend_decodeBoolForKey_(v4, v50, (uint64_t)CFSTR("locked"));
    v6->_contextType = objc_msgSend_decodeIntegerForKey_(v4, v51, (uint64_t)CFSTR("contextType"));
    v52 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v53, v52, CFSTR("dateLastCompleted"));
    v54 = objc_claimAutoreleasedReturnValue();
    dateLastCompleted = v6->_dateLastCompleted;
    v6->_dateLastCompleted = (NSDate *)v54;

    objc_msgSend_decodeDoubleForKey_(v4, v56, (uint64_t)CFSTR("timeExpectation"));
    v6->_timeExpectation = v59;
    type = v6->_type;
    if (type != 2 && type != 4 && !objc_msgSend_length(v6->_bundleIdentifier, v57, v58))
    {
      objc_msgSend_firstObject(v6->_contextPath, v61, v62);
      v63 = objc_claimAutoreleasedReturnValue();
      v64 = v6->_bundleIdentifier;
      v6->_bundleIdentifier = (NSString *)v63;

    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CLSHandoutAttachment;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v24, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeInt32_forKey_(v4, v5, self->_type, CFSTR("type"), v24.receiver, v24.super_class);
  objc_msgSend_encodeInt32_forKey_(v4, v6, self->_shareType, CFSTR("shareType"));
  objc_msgSend_encodeInt32_forKey_(v4, v7, self->_permissionType, CFSTR("permissionType"));
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)self->_URL, CFSTR("URL"));
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)self->_contextPath, CFSTR("contextPath"));
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)self->_contextSummary, CFSTR("contextSummary"));
  objc_msgSend_encodeObject_forKey_(v4, v11, (uint64_t)self->_contextCustomTypeName, CFSTR("contextCustomTypeName"));
  objc_msgSend_encodeBool_forKey_(v4, v12, self->_contextSourceIsCatalog, CFSTR("contextSourceIsCatalog"));
  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)self->_title, CFSTR("title"));
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)self->_applicationName, CFSTR("applicationName"));
  objc_msgSend_encodeObject_forKey_(v4, v16, (uint64_t)self->_storeIdentifier, CFSTR("storeIdentifier"));
  objc_msgSend_encodeObject_forKey_(v4, v17, (uint64_t)self->_contentStoreIdentifier, CFSTR("contentStoreIdentifier"));
  objc_msgSend_encodeInteger_forKey_(v4, v18, self->_displayOrder, CFSTR("displayOrder"));
  objc_msgSend_encodeInt32_forKey_(v4, v19, self->_completionStatus, CFSTR("completionStatus"));
  objc_msgSend_encodeBool_forKey_(v4, v20, self->_locked, CFSTR("locked"));
  objc_msgSend_encodeInteger_forKey_(v4, v21, self->_contextType, CFSTR("contextType"));
  objc_msgSend_encodeObject_forKey_(v4, v22, (uint64_t)self->_dateLastCompleted, CFSTR("dateLastCompleted"));
  objc_msgSend_encodeDouble_forKey_(v4, v23, (uint64_t)CFSTR("timeExpectation"), self->_timeExpectation);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isComplete
{
  uint64_t v2;
  unsigned int v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = (self->_completionStatus < 5u) & (0x1Au >> self->_completionStatus);
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)mergeWithObject:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  NSURL *v15;
  NSURL *URL;
  const char *v17;
  uint64_t v18;
  NSArray *v19;
  NSArray *contextPath;
  const char *v21;
  uint64_t v22;
  NSString *v23;
  NSString *contextSummary;
  const char *v25;
  uint64_t v26;
  NSString *v27;
  NSString *contextCustomTypeName;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  NSString *v33;
  NSString *title;
  const char *v35;
  uint64_t v36;
  NSString *v37;
  NSString *bundleIdentifier;
  const char *v39;
  uint64_t v40;
  NSString *v41;
  NSString *applicationName;
  const char *v43;
  uint64_t v44;
  NSString *v45;
  NSString *storeIdentifier;
  const char *v47;
  uint64_t v48;
  NSString *v49;
  NSString *contentStoreIdentifier;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  NSDate *v61;
  NSDate *dateLastCompleted;
  const char *v63;
  uint64_t v64;
  double v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  objc_super v72;
  uint64_t v73;
  uint64_t v74;

  if (self != a3)
  {
    v73 = v3;
    v74 = v4;
    v72.receiver = self;
    v72.super_class = (Class)CLSHandoutAttachment;
    v6 = a3;
    -[CLSObject mergeWithObject:](&v72, sel_mergeWithObject_, v6);
    objc_msgSend_lock(self, v7, v8, v72.receiver, v72.super_class);
    self->_shareType = objc_msgSend_shareType(v6, v9, v10);
    self->_permissionType = objc_msgSend_permissionType(v6, v11, v12);
    objc_msgSend_URL(v6, v13, v14);
    v15 = (NSURL *)objc_claimAutoreleasedReturnValue();
    URL = self->_URL;
    self->_URL = v15;

    objc_msgSend_contextPath(v6, v17, v18);
    v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
    contextPath = self->_contextPath;
    self->_contextPath = v19;

    objc_msgSend_contextSummary(v6, v21, v22);
    v23 = (NSString *)objc_claimAutoreleasedReturnValue();
    contextSummary = self->_contextSummary;
    self->_contextSummary = v23;

    objc_msgSend_contextCustomTypeName(v6, v25, v26);
    v27 = (NSString *)objc_claimAutoreleasedReturnValue();
    contextCustomTypeName = self->_contextCustomTypeName;
    self->_contextCustomTypeName = v27;

    self->_contextSourceIsCatalog = objc_msgSend_contextSourceIsCatalog(v6, v29, v30);
    objc_msgSend_title(v6, v31, v32);
    v33 = (NSString *)objc_claimAutoreleasedReturnValue();
    title = self->_title;
    self->_title = v33;

    objc_msgSend_bundleIdentifier(v6, v35, v36);
    v37 = (NSString *)objc_claimAutoreleasedReturnValue();
    bundleIdentifier = self->_bundleIdentifier;
    self->_bundleIdentifier = v37;

    objc_msgSend_applicationName(v6, v39, v40);
    v41 = (NSString *)objc_claimAutoreleasedReturnValue();
    applicationName = self->_applicationName;
    self->_applicationName = v41;

    objc_msgSend_storeIdentifier(v6, v43, v44);
    v45 = (NSString *)objc_claimAutoreleasedReturnValue();
    storeIdentifier = self->_storeIdentifier;
    self->_storeIdentifier = v45;

    objc_msgSend_contentStoreIdentifier(v6, v47, v48);
    v49 = (NSString *)objc_claimAutoreleasedReturnValue();
    contentStoreIdentifier = self->_contentStoreIdentifier;
    self->_contentStoreIdentifier = v49;

    self->_displayOrder = objc_msgSend_displayOrder(v6, v51, v52);
    self->_completionStatus = objc_msgSend_completionStatus(v6, v53, v54);
    self->_locked = objc_msgSend_isLocked(v6, v55, v56);
    self->_contextType = objc_msgSend_contextType(v6, v57, v58);
    objc_msgSend_dateLastCompleted(v6, v59, v60);
    v61 = (NSDate *)objc_claimAutoreleasedReturnValue();
    dateLastCompleted = self->_dateLastCompleted;
    self->_dateLastCompleted = v61;

    objc_msgSend_timeExpectation(v6, v63, v64);
    self->_timeExpectation = v65;
    objc_msgSend_dateLastModified(v6, v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setDateLastModified_(self, v69, (uint64_t)v68);
    objc_msgSend_unlock(self, v70, v71);
  }
}

- (NSArray)assets
{
  uint64_t v3;
  const char *v4;

  v3 = objc_opt_class();
  return (NSArray *)objc_msgSend_childrenOfClass_(self, v4, v3);
}

- (void)addAsset:(id)a3
{
  id v4;
  const char *v5;
  int type;
  BOOL v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  id v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  type = self->_type;
  v7 = type == 2 || type == 4;
  v23 = v4;
  if (!v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    NSStringFromHandoutAttachmentType(2u, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromHandoutAttachmentType(4u, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromHandoutAttachmentType(self->_type, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_initWithFormat_(v8, v15, (uint64_t)CFSTR("You can only add assets to attachments of type {%@, %@}; %@ was provided."),
            v10,
            v12,
            v14);

    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99778];
    v24 = CFSTR("CLSErrorObjectKey");
    v25[0] = v23;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v19, (uint64_t)v25, &v24, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v17, v21, v18, v16, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(objc_retainAutorelease(v22));
  }
  objc_msgSend_becomeChildOf_(v4, v5, (uint64_t)self);

}

- (void)removeAsset:(id)a3
{
  objc_msgSend_removeChild_changedPropertyName_(self, a2, (uint64_t)a3, CFSTR("assets"));
}

- (id)assetForPerson:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  const char *v19;
  uint64_t v20;
  int isOriginal;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  id v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  const char *v40;
  int isEqualToString;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  id v48;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend_shareType(self, v5, v6) == 2)
  {
    v56 = 0uLL;
    v57 = 0uLL;
    v54 = 0uLL;
    v55 = 0uLL;
    objc_msgSend_assets(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v54, v59, 16);
    if (v11)
    {
      v14 = v11;
      v15 = 0;
      v16 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v55 != v16)
            objc_enumerationMutation(v9);
          v18 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          if (v15)
          {
            if ((objc_msgSend_isOriginal(*(void **)(*((_QWORD *)&v54 + 1) + 8 * i), v12, v13) & 1) == 0
              && objc_msgSend_isOriginal(v15, v19, v20))
            {
              goto LABEL_12;
            }
            isOriginal = objc_msgSend_isOriginal(v18, v19, v20);
            if (isOriginal == objc_msgSend_isOriginal(v15, v22, v23))
            {
              objc_msgSend_dateCreated(v18, v12, v13);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_dateCreated(v15, v25, v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend_compare_(v24, v28, (uint64_t)v27);

              if (v29 == 1)
              {
LABEL_12:
                v30 = v18;

                v15 = v30;
              }
            }
          }
          else
          {
            v15 = v18;
          }
        }
        v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v54, v59, 16);
      }
      while (v14);
      goto LABEL_31;
    }
LABEL_30:
    v15 = 0;
    goto LABEL_31;
  }
  v52 = 0uLL;
  v53 = 0uLL;
  *((_QWORD *)&v50 + 1) = 0;
  v51 = 0uLL;
  objc_msgSend_assets(self, v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v31, (uint64_t)&v50, v58, 16);
  if (!v32)
    goto LABEL_30;
  v35 = v32;
  v15 = 0;
  v36 = *(_QWORD *)v51;
  do
  {
    for (j = 0; j != v35; ++j)
    {
      if (*(_QWORD *)v51 != v36)
        objc_enumerationMutation(v9);
      v38 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
      objc_msgSend_ownerPersonID(v38, v33, v34);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v39, v40, (uint64_t)v4);

      if (isEqualToString)
      {
        if (v15)
        {
          objc_msgSend_dateCreated(v38, v33, v34);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_dateCreated(v15, v43, v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend_compare_(v42, v46, (uint64_t)v45);

          if (v47 == 1)
          {
            v48 = v38;

            v15 = v48;
          }
        }
        else
        {
          v15 = v38;
        }
      }
    }
    v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v33, (uint64_t)&v50, v58, 16);
  }
  while (v35);
LABEL_31:

  return v15;
}

- (NSArray)collaborationStates
{
  uint64_t v3;
  const char *v4;

  v3 = objc_opt_class();
  return (NSArray *)objc_msgSend_childrenOfClass_(self, v4, v3);
}

- (CLSSurvey)survey
{
  uint64_t v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;

  v3 = objc_opt_class();
  objc_msgSend_childrenOfClass_(self, v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (CLSSurvey *)v8;
}

- (void)addSurvey:(id)a3
{
  objc_msgSend_addChild_changedPropertyName_(self, a2, (uint64_t)a3, CFSTR("survey"));
}

- (void)removeSurvey:(id)a3
{
  objc_msgSend_removeChild_changedPropertyName_(self, a2, (uint64_t)a3, CFSTR("survey"));
}

- (NSString)title
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_title;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setTitle:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *title;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  title = self->_title;
  v12 = (id)v8;
  if (v8 | (unint64_t)title
    && (!v8 || !title || (objc_msgSend_isEqualToString_(title, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_title, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (NSURL)URL
{
  uint64_t v2;
  NSURL *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_URL;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setURL:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  NSURL *URL;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  id v18;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (unint64_t)v5;
  URL = self->_URL;
  v18 = (id)v8;
  if (v8 | (unint64_t)URL)
  {
    if (!v8
      || !URL
      || (objc_msgSend_absoluteString(URL, (const char *)v8, v9),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend_absoluteString(v18, v12, v13),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend_caseInsensitiveCompare_(v11, v15, (uint64_t)v14),
          v14,
          v11,
          v16))
    {
      objc_storeStrong((id *)&self->_URL, a3);
      objc_msgSend_setModified_(self, v17, 1);
    }
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (NSArray)contextPath
{
  uint64_t v2;
  NSArray *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_contextPath;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setContextPath:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *contextPath;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  contextPath = self->_contextPath;
  v12 = (id)v8;
  if (v8 | (unint64_t)contextPath
    && (!v8 || !contextPath || (objc_msgSend_isEqualToArray_(contextPath, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_contextPath, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (NSDate)dateLastCompleted
{
  uint64_t v2;
  NSDate *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_dateLastCompleted;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setDateLastCompleted:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSDate *dateLastCompleted;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  dateLastCompleted = self->_dateLastCompleted;
  v12 = (id)v8;
  if (v8 | (unint64_t)dateLastCompleted
    && (!v8 || !dateLastCompleted || (objc_msgSend_isEqualToDate_(dateLastCompleted, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_dateLastCompleted, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (int)completionStatus
{
  uint64_t v2;
  int completionStatus;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  completionStatus = self->_completionStatus;
  objc_msgSend_unlock(self, v5, v6);
  return completionStatus;
}

- (void)setCompletionStatus:(int)a3
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  id v12;

  objc_msgSend_lock(self, a2, *(uint64_t *)&a3);
  if (self->_completionStatus != a3)
  {
    self->_completionStatus = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
  if (objc_msgSend_isComplete(self, v7, v8))
  {
    objc_msgSend_date(MEMORY[0x1E0C99D68], v9, v10);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDateLastCompleted_(self, v11, (uint64_t)v12);

  }
}

- (NSString)contentStoreIdentifier
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_contentStoreIdentifier;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setContentStoreIdentifier:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *contentStoreIdentifier;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  contentStoreIdentifier = self->_contentStoreIdentifier;
  v12 = (id)v8;
  if (v8 | (unint64_t)contentStoreIdentifier
    && (!v8
     || !contentStoreIdentifier
     || (objc_msgSend_isEqualToString_(contentStoreIdentifier, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_contentStoreIdentifier, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (NSString)contextSummary
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_contextSummary;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setContextSummary:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *contextSummary;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  contextSummary = self->_contextSummary;
  v12 = (id)v8;
  if (v8 | (unint64_t)contextSummary
    && (!v8 || !contextSummary || (objc_msgSend_isEqualToString_(contextSummary, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_contextSummary, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (NSString)contextCustomTypeName
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_contextCustomTypeName;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setContextCustomTypeName:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *contextCustomTypeName;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  contextCustomTypeName = self->_contextCustomTypeName;
  v12 = (id)v8;
  if (v8 | (unint64_t)contextCustomTypeName
    && (!v8
     || !contextCustomTypeName
     || (objc_msgSend_isEqualToString_(contextCustomTypeName, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_contextCustomTypeName, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (BOOL)contextSourceIsCatalog
{
  uint64_t v2;
  BOOL contextSourceIsCatalog;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  contextSourceIsCatalog = self->_contextSourceIsCatalog;
  objc_msgSend_unlock(self, v5, v6);
  return contextSourceIsCatalog;
}

- (void)setContextSourceIsCatalog:(BOOL)a3
{
  _BOOL4 v3;
  const char *v5;
  uint64_t v6;

  v3 = a3;
  objc_msgSend_lock(self, a2, a3);
  if (self->_contextSourceIsCatalog != v3)
  {
    self->_contextSourceIsCatalog = v3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (int64_t)contextType
{
  uint64_t v2;
  int64_t contextType;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  contextType = self->_contextType;
  objc_msgSend_unlock(self, v5, v6);
  return contextType;
}

- (void)setContextType:(int64_t)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, a3);
  if (self->_contextType != a3)
  {
    self->_contextType = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (int)shareType
{
  uint64_t v2;
  int shareType;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  shareType = self->_shareType;
  objc_msgSend_unlock(self, v5, v6);
  return shareType;
}

- (void)setShareType:(int)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, *(uint64_t *)&a3);
  if (self->_shareType != a3)
  {
    self->_shareType = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (int)permissionType
{
  uint64_t v2;
  int permissionType;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  permissionType = self->_permissionType;
  objc_msgSend_unlock(self, v5, v6);
  return permissionType;
}

- (void)setPermissionType:(int)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, *(uint64_t *)&a3);
  if (self->_permissionType != a3)
  {
    self->_permissionType = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (int64_t)displayOrder
{
  uint64_t v2;
  int64_t displayOrder;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  displayOrder = self->_displayOrder;
  objc_msgSend_unlock(self, v5, v6);
  return displayOrder;
}

- (void)setDisplayOrder:(int64_t)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, a3);
  if (self->_displayOrder != a3)
  {
    self->_displayOrder = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (NSString)bundleIdentifier
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_bundleIdentifier;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setBundleIdentifier:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *bundleIdentifier;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  bundleIdentifier = self->_bundleIdentifier;
  v12 = (id)v8;
  if (v8 | (unint64_t)bundleIdentifier
    && (!v8 || !bundleIdentifier || (objc_msgSend_isEqualToString_(bundleIdentifier, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_bundleIdentifier, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (NSString)applicationName
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_applicationName;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setApplicationName:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *applicationName;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  applicationName = self->_applicationName;
  v12 = (id)v8;
  if (v8 | (unint64_t)applicationName
    && (!v8 || !applicationName || (objc_msgSend_isEqualToString_(applicationName, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_applicationName, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (double)timeExpectation
{
  uint64_t v2;
  double timeExpectation;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  timeExpectation = self->_timeExpectation;
  objc_msgSend_unlock(self, v5, v6);
  return timeExpectation;
}

- (void)setTimeExpectation:(double)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;

  objc_msgSend_lock(self, a2, v3);
  if (self->_timeExpectation != a3)
  {
    self->_timeExpectation = a3;
    objc_msgSend_setModified_(self, v6, 1);
  }
  objc_msgSend_unlock(self, v6, v7);
}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  const char *v9;
  void *v10;
  const char *v11;
  const char *v12;
  void *v13;
  const char *v14;
  NSURL *v15;
  const char *v16;
  uint64_t v17;
  NSURL *v18;
  void *v19;
  const char *v20;
  NSArray *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  NSString *contextSummary;
  NSString *contextCustomTypeName;
  void *v27;
  const char *v28;
  const char *v29;
  NSString *v30;
  const char *v31;
  NSString *v32;
  const char *v33;
  NSString *v34;
  const char *v35;
  NSString *v36;
  const char *v37;
  NSString *v38;
  void *v39;
  const char *v40;
  const char *v41;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  NSDate *v46;
  void *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t i;
  void *v65;
  const char *v66;
  const char *v67;
  void *v68;
  void *v69;
  id v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t j;
  void *v78;
  const char *v79;
  const char *v80;
  NSString *v82;
  NSString *v83;
  NSString *v84;
  NSString *v85;
  NSString *v86;
  NSArray *v87;
  NSURL *v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  objc_super v97;
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v97.receiver = self;
  v97.super_class = (Class)CLSHandoutAttachment;
  -[CLSObject dictionaryRepresentation](&v97, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(self, v4, v5);
  NSStringFromHandoutAttachmentType(self->_type, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)v7, CFSTR("type"));

  NSStringFromShareType(self->_shareType, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v11, (uint64_t)v10, CFSTR("shareType"));

  NSStringFromPermissionType(self->_permissionType, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v14, (uint64_t)v13, CFSTR("permissionType"));

  v15 = self->_URL;
  v18 = v15;
  if (v15)
  {
    objc_msgSend_absoluteString(v15, v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v20, (uint64_t)v19, CFSTR("URL"));

  }
  v21 = self->_contextPath;
  if (objc_msgSend_count(v21, v22, v23))
    objc_msgSend_setObject_forKeyedSubscript_(v3, v24, (uint64_t)v21, CFSTR("contextPath"));
  contextSummary = self->_contextSummary;
  if (contextSummary)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v24, (uint64_t)contextSummary, CFSTR("contextSummary"));
  v87 = v21;
  v88 = v18;
  contextCustomTypeName = self->_contextCustomTypeName;
  if (contextCustomTypeName)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v24, (uint64_t)contextCustomTypeName, CFSTR("contextCustomTypeName"));
  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v24, self->_contextSourceIsCatalog);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v28, (uint64_t)v27, CFSTR("contextSourceIsCatalog"));

  v30 = self->_title;
  if (v30)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v29, (uint64_t)v30, CFSTR("title"));
  v32 = self->_bundleIdentifier;
  if (v32)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v31, (uint64_t)v32, CFSTR("bundleIdentifier"));
  v34 = self->_applicationName;
  if (v34)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v33, (uint64_t)v34, CFSTR("applicationName"));
  v36 = self->_storeIdentifier;
  if (v36)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v35, (uint64_t)v36, CFSTR("storeIdentifier"));
  v83 = v36;
  v84 = v34;
  v85 = v32;
  v86 = v30;
  v38 = self->_contentStoreIdentifier;
  if (v38)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v37, (uint64_t)v38, CFSTR("contentStoreIdentifier"));
  v82 = v38;
  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v37, self->_locked);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v40, (uint64_t)v39, CFSTR("isLocked"));

  NSStringFromHandoutAttachmentCompletionStatus(self->_completionStatus, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v43, (uint64_t)v42, CFSTR("completionStatus"));

  v46 = self->_dateLastCompleted;
  if (v46)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v44, (uint64_t)v46, CFSTR("dateLastCompleted"));
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v44, v45, self->_timeExpectation);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v48, (uint64_t)v47, CFSTR("timeExpectation"));

  objc_msgSend_unlock(self, v49, v50);
  objc_msgSend_assets(self, v51, v52);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (v55)
  {
    v56 = (void *)objc_opt_new();
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v57 = v55;
    v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v58, (uint64_t)&v93, v99, 16);
    if (v59)
    {
      v62 = v59;
      v63 = *(_QWORD *)v94;
      do
      {
        for (i = 0; i != v62; ++i)
        {
          if (*(_QWORD *)v94 != v63)
            objc_enumerationMutation(v57);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v93 + 1) + 8 * i), v60, v61);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v56, v66, (uint64_t)v65);

        }
        v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v60, (uint64_t)&v93, v99, 16);
      }
      while (v62);
    }

    objc_msgSend_setObject_forKeyedSubscript_(v3, v67, (uint64_t)v56, CFSTR("assets"));
  }
  objc_msgSend_collaborationStates(self, v53, v54);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    v69 = (void *)objc_opt_new();
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v70 = v68;
    v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v70, v71, (uint64_t)&v89, v98, 16);
    if (v72)
    {
      v75 = v72;
      v76 = *(_QWORD *)v90;
      do
      {
        for (j = 0; j != v75; ++j)
        {
          if (*(_QWORD *)v90 != v76)
            objc_enumerationMutation(v70);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v89 + 1) + 8 * j), v73, v74);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v69, v79, (uint64_t)v78);

        }
        v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(v70, v73, (uint64_t)&v89, v98, 16);
      }
      while (v75);
    }

    objc_msgSend_setObject_forKeyedSubscript_(v3, v80, (uint64_t)v69, CFSTR("collaborationStates"));
  }

  return v3;
}

- (void)getNumberOfAttemptsWithCompletion:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  id v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v6 = a3;
  if (self->_type == 1)
  {
    objc_msgSend_contextPath(self, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v7, v8, v9))
    {
      objc_msgSend_objectIDForIdentifierPath_(CLSContext, v10, (uint64_t)v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_length(v11, v12, v13))
      {
        objc_msgSend_dataStore(self, v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = sub_1D40A4490;
        v22[3] = &unk_1E9749F88;
        v17 = v6;
        v23 = v17;
        objc_msgSend_dataServer_(v16, v18, (uint64_t)v22);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_remote_fetchCountOfActivitiesForContextID_completion_(v19, v20, (uint64_t)v11, v17);
      }
      else
      {
        objc_msgSend_cls_createErrorWithCode_format_(MEMORY[0x1E0CB35C8], v14, 100, CFSTR("Could not determine objectID for context path: %@"), v7);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v21);

      }
    }
    else
    {
      objc_msgSend_cls_createErrorWithCode_format_(MEMORY[0x1E0CB35C8], v10, 2, CFSTR("Handout attachment has invalid context path: %@"), v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v11);
    }

  }
  else
  {
    objc_msgSend_cls_createErrorWithCode_format_(MEMORY[0x1E0CB35C8], v4, 2, CFSTR("Handout attachment type is not CLSHandoutAttachmentTypeContext"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v7);
  }

}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (BOOL)isLocked
{
  return self->_locked;
}

- (void)setLocked:(BOOL)a3
{
  self->_locked = a3;
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_dateLastCompleted, 0);
  objc_storeStrong((id *)&self->_contextCustomTypeName, 0);
  objc_storeStrong((id *)&self->_contextSummary, 0);
  objc_storeStrong((id *)&self->_contentStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_contextPath, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
