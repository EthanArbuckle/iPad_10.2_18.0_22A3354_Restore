@implementation CLSContext

- (CLSActivity)currentActivity
{
  uint64_t v2;
  void *v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  objc_msgSend_currentActivityID(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D40BB8FC;
  v12[3] = &unk_1E974A910;
  v13 = v4;
  v5 = v4;
  objc_msgSend_childrenPassingTest_(self, v6, (uint64_t)v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (CLSActivity *)v10;
}

- (CLSActivity)createNewActivity
{
  uint64_t v2;
  const char *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  CLSActivity *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dataStore(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend_cls_createErrorWithCode_errorObject_description_(MEMORY[0x1E0CB35C8], v4, 3, self, CFSTR("Creating an activity in a context without a data store is undefined. Please add context to a parent context with a data store before calling createNewActivity."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v7 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v6;
      _os_log_error_impl(&dword_1D4054000, v7, OS_LOG_TYPE_ERROR, "Error occurred when creating a new activity: %@", buf, 0xCu);
    }

  }
  v8 = [CLSActivity alloc];
  v9 = objc_opt_class();
  v11 = (void *)objc_msgSend__initWithTargetClass_(v8, v10, v9);
  objc_msgSend_lock(v5, v12, v13);
  if (v5)
  {
    objc_msgSend_mainAppContext(v5, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAppIdentifier_(v11, v20, (uint64_t)v19);

  }
  objc_msgSend_objectID(v11, v14, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCurrentActivityID_(self, v22, (uint64_t)v21);

  v26.receiver = self;
  v26.super_class = (Class)CLSContext;
  -[CLSObject addChild:changedPropertyName:](&v26, sel_addChild_changedPropertyName_, v11, CFSTR("currentActivity"));
  objc_msgSend_unlock(v5, v23, v24);

  return (CLSActivity *)v11;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSContext;
  return -[CLSObject _init](&v3, sel__init);
}

- (void)_setType:(int64_t)a3 identifier:(id)a4 title:(id)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  NSString *v10;
  NSString *identifier;
  const char *v12;
  uint64_t v13;
  NSString *v14;
  NSString *title;

  self->_type = a3;
  v7 = a5;
  v10 = (NSString *)objc_msgSend_copy(a4, v8, v9);
  identifier = self->_identifier;
  self->_identifier = v10;

  v14 = (NSString *)objc_msgSend_copy(v7, v12, v13);
  title = self->_title;
  self->_title = v14;

  self->_assignable = 1;
  self->_suggestedAge = (_NSRange)xmmword_1D40DB8A0;
  self->_suggestedCompletionTime = (_NSRange)xmmword_1D40DB8A0;
}

- (CLSContext)initWithInternalType:(int64_t)a3 identifier:(id)a4 title:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  CLSContext *v12;
  const char *v13;

  v8 = a5;
  v9 = a4;
  v12 = (CLSContext *)objc_msgSend__init(self, v10, v11);
  objc_msgSend__setType_identifier_title_(v12, v13, a3, v9, v8);

  return v12;
}

- (CLSContext)initWithType:(CLSContextType)type identifier:(NSString *)identifier title:(NSString *)title
{
  NSString *v8;
  NSString *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  int v17;
  const char *v18;
  CLSContext *v19;
  const char *v20;
  void *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  id v26;
  objc_super v27;
  const __CFString *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v8 = identifier;
  v9 = title;
  v10 = (void *)objc_opt_class();
  objc_msgSend_reservedContextTypes(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v14, type);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_containsObject_(v13, v16, (uint64_t)v15);

  if (v17)
  {
    v22 = (void *)MEMORY[0x1E0C99DA0];
    v23 = *MEMORY[0x1E0C99778];
    v28 = CFSTR("CLSErrorObjectKey");
    v29[0] = self;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v18, (uint64_t)v29, &v28, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v22, v25, v23, CFSTR("Context cannot be initialized with reserved type."), v24);
    v26 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v26);
  }
  v27.receiver = self;
  v27.super_class = (Class)CLSContext;
  v19 = -[CLSObject _init](&v27, sel__init);
  objc_msgSend__setType_identifier_title_(v19, v20, type, v8, v9);

  return v19;
}

- (BOOL)validateObject:(id *)a3
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  BOOL v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  const char *v41;
  void *v42;
  const char *v43;
  NSString *title;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  const char *v62;
  int isEqualToString;
  void *v64;
  uint64_t v65;
  const char *v66;
  const char *v67;
  NSString *v68;
  NSString *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  const char *v73;
  const char *v74;
  void *v75;
  const char *v76;
  objc_super v77;

  v77.receiver = self;
  v77.super_class = (Class)CLSContext;
  if (!-[CLSObject validateObject:](&v77, sel_validateObject_))
    return 0;
  if ((objc_msgSend_isDeleted(self, v5, v6) & 1) == 0)
  {
    if ((unint64_t)objc_msgSend_count(self->_path, v7, v8) >= 9)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = (void *)MEMORY[0x1E0CB34D0];
      v14 = objc_opt_class();
      objc_msgSend_bundleForClass_(v13, v15, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v16, v17, (uint64_t)CFSTR("ERROR_DESCRIPTION_CONTEXT_MAX_DEPTH_EXCEEDED_FORMAT"), &stru_1E974C8A0, CFSTR("ClassKit"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v12, v19, (uint64_t)v18, 8);
LABEL_14:
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_cls_assignError_code_errorObject_description_(MEMORY[0x1E0CB35C8], v43, (uint64_t)a3, 6, self, v42);
      goto LABEL_15;
    }
    if ((unint64_t)objc_msgSend_length(self->_identifier, v10, v11) < 0x101)
    {
      if ((unint64_t)objc_msgSend_length(self->_summary, v20, v21) >= 0xFA1)
      {
        v29 = (void *)MEMORY[0x1E0CB3940];
        v30 = (void *)MEMORY[0x1E0CB34D0];
        v31 = objc_opt_class();
        objc_msgSend_bundleForClass_(v30, v32, v31);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_localizedStringForKey_value_table_(v16, v33, (uint64_t)CFSTR("ERROR_DESCRIPTION_CONTEXT_SUMMARY_TOO_LONG_FORMAT"), &stru_1E974C8A0, CFSTR("ClassKit"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v29, v34, (uint64_t)v18, 4000);
        goto LABEL_14;
      }
      if ((unint64_t)objc_msgSend_length(self->_title, v27, v28) < 0x101)
      {
        title = self->_title;
        objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x1E0CB3500], v35, v36);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByTrimmingCharactersInSet_(title, v47, (uint64_t)v46);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend_length(v48, v49, v50);

        if (v51)
          return 1;
        objc_msgSend_appIdentifier(self, v52, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appIdentifier(self, v55, v56);
        v57 = objc_claimAutoreleasedReturnValue();
        if (v57)
        {
          v60 = (void *)v57;
          objc_msgSend_appIdentifier(self, v58, v59);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v61, v62, (uint64_t)CFSTR("com.apple.iBooks"));

          if (isEqualToString)
          {
            v64 = (void *)MEMORY[0x1E0CB34D0];
            v65 = objc_opt_class();
            objc_msgSend_bundleForClass_(v64, v66, v65);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_localizedStringForKey_value_table_(v42, v67, (uint64_t)CFSTR("UNTITLED_PDF"), &stru_1E974C8A0, CFSTR("ClassKit"));
            v68 = (NSString *)objc_claimAutoreleasedReturnValue();
            v69 = self->_title;
            self->_title = v68;

            v9 = 1;
            goto LABEL_16;
          }
        }
        else
        {

        }
        v70 = (void *)MEMORY[0x1E0CB35C8];
        v71 = (void *)MEMORY[0x1E0CB34D0];
        v72 = objc_opt_class();
        objc_msgSend_bundleForClass_(v71, v73, v72);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_localizedStringForKey_value_table_(v42, v74, (uint64_t)CFSTR("ERROR_DESCRIPTION_CONTEXT_NO_TITLE"), &stru_1E974C8A0, CFSTR("ClassKit"));
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_cls_assignError_code_errorObject_description_(v70, v76, (uint64_t)a3, 2, self, v75);

LABEL_15:
        v9 = 0;
LABEL_16:

        return v9;
      }
      v22 = (void *)MEMORY[0x1E0CB3940];
      v37 = (void *)MEMORY[0x1E0CB34D0];
      v38 = objc_opt_class();
      objc_msgSend_bundleForClass_(v37, v39, v38);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v16, v40, (uint64_t)CFSTR("ERROR_DESCRIPTION_CONTEXT_TITLE_TOO_LONG_FORMAT"), &stru_1E974C8A0, CFSTR("ClassKit"));
    }
    else
    {
      v22 = (void *)MEMORY[0x1E0CB3940];
      v23 = (void *)MEMORY[0x1E0CB34D0];
      v24 = objc_opt_class();
      objc_msgSend_bundleForClass_(v23, v25, v24);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v16, v26, (uint64_t)CFSTR("ERROR_DESCRIPTION_CONTEXT_IDENTIFIER_TOO_LONG_FORMAT"), &stru_1E974C8A0, CFSTR("ClassKit"));
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v22, v41, (uint64_t)v18, 256);
    goto LABEL_14;
  }
  return 1;
}

- (CLSContext)initWithCoder:(id)a3
{
  id v4;
  CLSContext *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *stableObjectID;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  NSString *storeIdentifier;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  NSString *storeTeamID;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  NSURL *universalLinkURL;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  NSString *title;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  NSString *topic;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  NSArray *path;
  NSArray *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  NSString *currentActivityID;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  NSString *contentStoreIdentifier;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  NSString *customTypeName;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  NSString *summary;
  const char *v67;
  uint64_t v68;
  const char *v69;
  void *v70;
  uint64_t v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  void *v82;
  uint64_t v83;
  const char *v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  CLSContext *v92;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  objc_super v98;
  _BYTE v99[128];
  _QWORD v100[3];

  v100[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v98.receiver = self;
  v98.super_class = (Class)CLSContext;
  v5 = -[CLSObject initWithCoder:](&v98, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("stableObjectID"));
    v8 = objc_claimAutoreleasedReturnValue();
    stableObjectID = v5->_stableObjectID;
    v5->_stableObjectID = (NSString *)v8;

    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, CFSTR("identifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v12;

    v14 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, CFSTR("storeIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    storeIdentifier = v5->_storeIdentifier;
    v5->_storeIdentifier = (NSString *)v16;

    v18 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, CFSTR("storeTeamID"));
    v20 = objc_claimAutoreleasedReturnValue();
    storeTeamID = v5->_storeTeamID;
    v5->_storeTeamID = (NSString *)v20;

    v5->_type = objc_msgSend_decodeIntegerForKey_(v4, v22, (uint64_t)CFSTR("type"));
    v23 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, CFSTR("universalLinkURL"));
    v25 = objc_claimAutoreleasedReturnValue();
    universalLinkURL = v5->_universalLinkURL;
    v5->_universalLinkURL = (NSURL *)v25;

    v27 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v28, v27, CFSTR("title"));
    v29 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v29;

    v31 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, CFSTR("topic"));
    v33 = objc_claimAutoreleasedReturnValue();
    topic = v5->_topic;
    v5->_topic = (NSString *)v33;

    v35 = (void *)MEMORY[0x1E0C99E60];
    v100[0] = objc_opt_class();
    v100[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v36, (uint64_t)v100, 2);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v35, v38, (uint64_t)v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v40, (uint64_t)v39, CFSTR("path"));
    v41 = objc_claimAutoreleasedReturnValue();
    path = v5->_path;
    v5->_path = (NSArray *)v41;

    if (v5->_path)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_22:
        v92 = 0;
        goto LABEL_23;
      }
      v96 = 0u;
      v97 = 0u;
      v94 = 0u;
      v95 = 0u;
      v43 = v5->_path;
      v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v94, v99, 16);
      if (v45)
      {
        v46 = v45;
        v47 = *(_QWORD *)v95;
        while (2)
        {
          for (i = 0; i != v46; ++i)
          {
            if (*(_QWORD *)v95 != v47)
              objc_enumerationMutation(v43);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              goto LABEL_22;
            }
          }
          v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v49, (uint64_t)&v94, v99, 16);
          if (v46)
            continue;
          break;
        }
      }

    }
    v50 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v51, v50, CFSTR("currentActivityID"));
    v52 = objc_claimAutoreleasedReturnValue();
    currentActivityID = v5->_currentActivityID;
    v5->_currentActivityID = (NSString *)v52;

    v54 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v55, v54, CFSTR("contentStoreIdentifier"));
    v56 = objc_claimAutoreleasedReturnValue();
    contentStoreIdentifier = v5->_contentStoreIdentifier;
    v5->_contentStoreIdentifier = (NSString *)v56;

    v5->_displayOrder = objc_msgSend_decodeIntegerForKey_(v4, v58, (uint64_t)CFSTR("displayOrder"));
    v59 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v60, v59, CFSTR("customTypeName"));
    v61 = objc_claimAutoreleasedReturnValue();
    customTypeName = v5->_customTypeName;
    v5->_customTypeName = (NSString *)v61;

    v63 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v64, v63, CFSTR("summary"));
    v65 = objc_claimAutoreleasedReturnValue();
    summary = v5->_summary;
    v5->_summary = (NSString *)v65;

    v5->_assignable = objc_msgSend_decodeBoolForKey_(v4, v67, (uint64_t)CFSTR("assignable"));
    v68 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v69, v68, CFSTR("suggestedAgeLoc"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v72, v71, CFSTR("suggestedAgeLen"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = 0;
    v77 = 0x7FFFFFFFFFFFFFFFLL;
    if (v70 && v75)
    {
      v76 = objc_msgSend_unsignedIntegerValue(v70, v73, v74);
      v77 = objc_msgSend_unsignedIntegerValue(v75, v78, v79);
    }
    v5->_suggestedAge.location = v76;
    v5->_suggestedAge.length = v77;
    v80 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v81, v80, CFSTR("suggestedCompletionTimeLoc"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    v83 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v84, v83, CFSTR("suggestedCompletionTimeLen"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    v88 = 0;
    v89 = 0x7FFFFFFFFFFFFFFFLL;
    if (v82 && v85)
    {
      v88 = objc_msgSend_unsignedIntegerValue(v82, v86, v87);
      v89 = objc_msgSend_unsignedIntegerValue(v85, v90, v91);
    }
    v5->_suggestedCompletionTime.location = v88;
    v5->_suggestedCompletionTime.length = v89;

  }
  v92 = v5;
LABEL_23:

  return v92;
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
  void *v20;
  const char *v21;
  const char *v22;
  void *v23;
  const char *v24;
  _NSRange *p_suggestedCompletionTime;
  const char *v26;
  void *v27;
  const char *v28;
  const char *v29;
  void *v30;
  const char *v31;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CLSContext;
  -[CLSObject encodeWithCoder:](&v32, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_stableObjectID, CFSTR("stableObjectID"));
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_identifier, CFSTR("identifier"));
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)self->_storeIdentifier, CFSTR("storeIdentifier"));
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)self->_contentStoreIdentifier, CFSTR("contentStoreIdentifier"));
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)self->_storeTeamID, CFSTR("storeTeamID"));
  objc_msgSend_encodeInteger_forKey_(v4, v10, self->_type, CFSTR("type"));
  objc_msgSend_encodeObject_forKey_(v4, v11, (uint64_t)self->_universalLinkURL, CFSTR("universalLinkURL"));
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)self->_title, CFSTR("title"));
  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)self->_topic, CFSTR("topic"));
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)self->_path, CFSTR("path"));
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)self->_currentActivityID, CFSTR("currentActivityID"));
  objc_msgSend_encodeInteger_forKey_(v4, v16, self->_displayOrder, CFSTR("displayOrder"));
  if (self->_type == 17)
    objc_msgSend_encodeObject_forKey_(v4, v17, (uint64_t)self->_customTypeName, CFSTR("customTypeName"));
  objc_msgSend_encodeObject_forKey_(v4, v17, (uint64_t)self->_summary, CFSTR("summary"));
  objc_msgSend_encodeBool_forKey_(v4, v18, self->_assignable, CFSTR("assignable"));
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v19, self->_suggestedAge.location);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v21, (uint64_t)v20, CFSTR("suggestedAgeLoc"));

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v22, self->_suggestedAge.length);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v24, (uint64_t)v23, CFSTR("suggestedAgeLen"));

  p_suggestedCompletionTime = &self->_suggestedCompletionTime;
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v26, self->_suggestedCompletionTime.location);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v28, (uint64_t)v27, CFSTR("suggestedCompletionTimeLoc"));

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v29, p_suggestedCompletionTime->length);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v31, (uint64_t)v30, CFSTR("suggestedCompletionTimeLen"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)mergeWithObject:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  _QWORD v41[13];

  v41[12] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)CLSContext;
  -[CLSObject mergeWithObject:](&v39, sel_mergeWithObject_, v4);
  objc_msgSend_dateLastModified(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v10 = (id)v7;
    objc_msgSend_dateLastModified(v4, v8, v9);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v14 = (void *)v11;
      objc_msgSend_dateLastModified(self, v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dateLastModified(v4, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend_compare_(v15, v19, (uint64_t)v18);

      if (v20 == 1)
        goto LABEL_13;
      v41[0] = CFSTR("universalLinkURL");
      v41[1] = CFSTR("title");
      v41[2] = CFSTR("displayOrder");
      v41[3] = CFSTR("topic");
      v41[4] = CFSTR("storeIdentifier");
      v41[5] = CFSTR("storeTeamID");
      v41[6] = CFSTR("summary");
      v41[7] = CFSTR("customTypeName");
      v41[8] = CFSTR("assignable");
      v41[9] = CFSTR("suggestedAge");
      v41[10] = CFSTR("suggestedCompletionTime");
      v41[11] = CFSTR("type");
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v8, (uint64_t)v41, 12);
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v21, (uint64_t)&v35, v40, 16);
      if (v22)
      {
        v24 = v22;
        v25 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v36 != v25)
              objc_enumerationMutation(v10);
            v27 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
            objc_msgSend_valueForKey_(v4, v23, v27, (_QWORD)v35);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setValue_forKey_(self, v29, (uint64_t)v28, v27);

          }
          v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v23, (uint64_t)&v35, v40, 16);
        }
        while (v24);
      }

    }
  }
LABEL_13:
  objc_msgSend_currentActivityID(self, v8, v9, (_QWORD)v35);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
  {
    objc_msgSend_currentActivityID(v4, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCurrentActivityID_(self, v34, (uint64_t)v33);

  }
}

- (void)addChildContext:(CLSContext *)child
{
  CLSContext *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
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
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  id v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  void *v45;
  const char *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  NSObject *v56;
  objc_super v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t v62[128];
  uint8_t buf[4];
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v5 = child;
  objc_msgSend_identifier(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_length(v8, v9, v10);

  if (v11)
  {
    objc_msgSend_identifierPath(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v14, v15, v16))
    {
      objc_msgSend_thumbnailBlobs(v5, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_firstObject(v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend__progressReportingCapabilities(v5, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v5, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_arrayByAddingObject_(v14, v29, (uint64_t)v28);
      v30 = objc_claimAutoreleasedReturnValue();

      objc_msgSend_setIdentifierPathAndGenerateObjectID_(v5, v31, v30);
      if (v22)
      {
        objc_msgSend_objectID(v5, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setParentObjectID_(v22, v35, (uint64_t)v34);

      }
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v36 = v25;
      v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v58, v62, 16);
      if (v38)
      {
        v41 = v38;
        v42 = *(_QWORD *)v59;
        do
        {
          for (i = 0; i != v41; ++i)
          {
            if (*(_QWORD *)v59 != v42)
              objc_enumerationMutation(v36);
            v44 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
            objc_msgSend_objectID(v5, v39, v40);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setParentObjectID_(v44, v46, (uint64_t)v45);

          }
          v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v39, (uint64_t)&v58, v62, 16);
        }
        while (v41);
      }

      v57.receiver = self;
      v57.super_class = (Class)CLSContext;
      -[CLSObject addChild:](&v57, sel_addChild_, v5);

      v14 = (void *)v30;
    }
    else
    {
      v52 = (void *)MEMORY[0x1E0CB35C8];
      v53 = objc_opt_class();
      NSStringFromSelector(a2);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_cls_createErrorWithCode_errorObject_format_(v52, v55, 3, self, CFSTR("- [%@ %@]; Cannot add child context. Parent is missing path."),
        v53,
        v54);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v56 = CLSLogDefault;
      if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v64 = v22;
        _os_log_error_impl(&dword_1D4054000, v56, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }

  }
  else
  {
    v47 = (void *)MEMORY[0x1E0CB35C8];
    v48 = objc_opt_class();
    NSStringFromSelector(a2);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cls_createErrorWithCode_errorObject_format_(v47, v50, 3, v5, CFSTR("- [%@ %@]; Cannot add child context with blank identifier."),
      v48,
      v49);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v51 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v64 = v14;
      _os_log_error_impl(&dword_1D4054000, v51, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }

}

- (id)childContextWithIdentifier:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D40BD100;
  v12[3] = &unk_1E974A910;
  v13 = v4;
  v5 = v4;
  objc_msgSend_childrenPassingTest_(self, v6, (uint64_t)v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)removeFromParent
{
  uint64_t v2;
  const char *v4;
  id v5;

  objc_msgSend_dataStore(self, a2, v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeContext_(v5, v4, (uint64_t)self);

}

- (void)descendantMatchingIdentifierPath:(NSArray *)identifierPath completion:(void *)completion
{
  NSArray *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSArray *v12;
  const char *v13;
  _QWORD v14[4];
  NSArray *v15;
  id v16;

  v6 = identifierPath;
  v7 = completion;
  objc_msgSend_dataStore(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1D40BD2EC;
  v14[3] = &unk_1E974BEA8;
  v15 = v6;
  v16 = v7;
  v11 = v7;
  v12 = v6;
  objc_msgSend_contextsMatchingIdentifierPath_parentContext_completion_(v10, v13, (uint64_t)v12, self, v14);

}

- (CLSContextTopic)topic
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_topic;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setTopic:(CLSContextTopic)topic
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  char v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  NSString *v27;
  const char *v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = topic;
  if (objc_msgSend_length((void *)v5, v6, v7)
    && (v10 = (void *)objc_opt_class(),
        objc_msgSend_allowedTopics(v10, v11, v12),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend_containsObject_(v13, v14, v5),
        v13,
        (v15 & 1) == 0))
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = objc_opt_class();
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cls_createErrorWithCode_errorObject_format_(v19, v22, 3, self, CFSTR("Invalid topic in -[%@ %@]. Please use a predefined topic."), v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v24 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v23;
      _os_log_error_impl(&dword_1D4054000, v24, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

  }
  else
  {
    if (objc_msgSend_length((void *)v5, v8, v9))
    {
      v18 = (void *)v5;
    }
    else
    {

      v18 = 0;
    }
    objc_msgSend_lock(self, v16, v17);
    v5 = v18;
    v27 = self->_topic;
    if (v5 | (unint64_t)v27 && (!v5 || !v27 || (objc_msgSend_isEqualToString_(v27, v25, v5) & 1) == 0))
    {
      objc_storeStrong((id *)&self->_topic, v18);
      objc_msgSend_setModified_(self, v28, 1);
    }
    objc_msgSend_unlock(self, v25, v26);

  }
}

- (void)setType:(CLSContextType)type
{
  if (self->_type != type)
  {
    self->_type = type;
    objc_msgSend_setModified_(self, a2, 1);
  }
}

- (NSString)currentActivityID
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_currentActivityID;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setCurrentActivityID:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *currentActivityID;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  currentActivityID = self->_currentActivityID;
  v12 = (id)v8;
  if (v8 | (unint64_t)currentActivityID
    && (!v8 || !currentActivityID || (objc_msgSend_isEqualToString_(currentActivityID, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_currentActivityID, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

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

- (void)setTitle:(NSString *)title
{
  NSString *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *v10;
  const char *v11;
  id v12;

  v5 = title;
  objc_msgSend_lock(self, v6, v7);
  v8 = v5;
  v10 = self->_title;
  v12 = (id)v8;
  if (v8 | (unint64_t)v10
    && (!v8 || !v10 || (objc_msgSend_isEqualToString_(v10, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_title, title);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (NSURL)universalLinkURL
{
  uint64_t v2;
  NSURL *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_universalLinkURL;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setUniversalLinkURL:(NSURL *)universalLinkURL
{
  NSURL *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  NSURL *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  id v23;

  v4 = universalLinkURL;
  objc_msgSend_absoluteString(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_length(v7, v8, v9);

  if (!v10)
  {

    v4 = 0;
  }
  objc_msgSend_lock(self, v11, v12);
  v13 = v4;
  v15 = self->_universalLinkURL;
  v23 = (id)v13;
  if (v13 | (unint64_t)v15)
  {
    if (!v13
      || !v15
      || (objc_msgSend_absoluteString(v15, (const char *)v13, v14),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend_absoluteString(v23, v17, v18),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          v21 = objc_msgSend_caseInsensitiveCompare_(v16, v20, (uint64_t)v19),
          v19,
          v16,
          v21))
    {
      objc_storeStrong((id *)&self->_universalLinkURL, v4);
      objc_msgSend_setModified_(self, v22, 1);
    }
  }
  objc_msgSend_unlock(self, (const char *)v13, v14);

}

- (NSInteger)displayOrder
{
  uint64_t v2;
  NSInteger displayOrder;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  displayOrder = self->_displayOrder;
  objc_msgSend_unlock(self, v5, v6);
  return displayOrder;
}

- (void)setDisplayOrder:(NSInteger)displayOrder
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, displayOrder);
  if (self->_displayOrder != displayOrder)
  {
    self->_displayOrder = displayOrder;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
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

- (NSString)summary
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_summary;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setSummary:(NSString *)summary
{
  NSString *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *v10;
  const char *v11;
  id v12;

  v5 = summary;
  objc_msgSend_lock(self, v6, v7);
  v8 = v5;
  v10 = self->_summary;
  v12 = (id)v8;
  if (v8 | (unint64_t)v10
    && (!v8 || !v10 || (objc_msgSend_isEqualToString_(v10, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_summary, summary);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (NSString)customTypeName
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_customTypeName;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setCustomTypeName:(NSString *)customTypeName
{
  NSString *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *v10;
  const char *v11;
  id v12;

  v5 = customTypeName;
  objc_msgSend_lock(self, v6, v7);
  v8 = v5;
  v10 = self->_customTypeName;
  v12 = (id)v8;
  if (v8 | (unint64_t)v10
    && (!v8 || !v10 || (objc_msgSend_isEqualToString_(v10, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_customTypeName, customTypeName);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (CGImageRef)thumbnail
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const void *v12;
  id v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D82573E4](self, a2);
  objc_msgSend_thumbnailBlob(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v9 = v6;
    objc_msgSend_data(v6, v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v16 = 0;
      v12 = (const void *)objc_msgSend_CGImageFromJPEGData_error_(CLSImageUtils, v10, (uint64_t)v11, &v16);
      v13 = v16;
      if (!v12)
      {
        if (qword_1ED0FB9A0 != -1)
          dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
        v14 = CLSLogDefault;
        if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v18 = v13;
          _os_log_error_impl(&dword_1D4054000, v14, OS_LOG_TYPE_ERROR, "Failed to create a thumbail from thumbnail blob. Error: %{public}@", buf, 0xCu);
        }
      }

    }
    else
    {
      v12 = 0;
    }

    objc_autoreleasePoolPop(v3);
    if (v12)
      return (CGImageRef)CFAutorelease(v12);
  }
  else
  {
    objc_autoreleasePoolPop(v3);
  }
  return 0;
}

- (void)setThumbnail:(CGImageRef)thumbnail
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  id v12;
  const char *v13;
  void *v14;
  CLSBlob *v15;
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  void *v21;
  const char *v22;
  NSObject *v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dataStore(self, a2, (uint64_t)thumbnail);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1D82573E4]();
  if (thumbnail)
  {
    v24 = 0;
    objc_msgSend_JPEGDataFromCGImage_desiredMinimumDimension_desiredMaximumDimension_error_(CLSImageUtils, v6, (uint64_t)thumbnail, 80, 330, &v24);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v24;
    if (v9)
    {
      objc_msgSend_thumbnailBlob(self, v10, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        objc_msgSend_removeObject_(v5, v13, (uint64_t)v14);
      v15 = [CLSBlob alloc];
      v17 = (void *)objc_msgSend_initWithType_data_(v15, v16, 1, v9);

      objc_msgSend_addChild_(self, v18, (uint64_t)v17);
      objc_msgSend_setModified_(self, v19, 1);

    }
    else
    {
      if (qword_1ED0FB9A0 != -1)
        dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
      v23 = CLSLogDefault;
      if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v26 = v12;
        _os_log_error_impl(&dword_1D4054000, v23, OS_LOG_TYPE_ERROR, "Failed to set thumbail for context with error: %{public}@", buf, 0xCu);
      }
    }

  }
  else
  {
    objc_msgSend_thumbnailBlob(self, v6, v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend_removeObject_(v5, v20, (uint64_t)v21);
      objc_msgSend_setModified_(self, v22, 1);
    }

  }
  objc_autoreleasePoolPop(v8);

}

- (id)thumbnailBlobs
{
  void *v2;
  const char *v3;
  void *v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1D40BDFE4;
  v6[3] = &unk_1E974A910;
  v6[4] = self;
  objc_msgSend_childrenPassingTest_(self, a2, (uint64_t)v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayUsingComparator_(v2, v3, (uint64_t)&unk_1E9749C10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)thumbnailBlob
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  unint64_t v13;
  const char *v14;
  unint64_t v15;
  uint64_t i;
  void *v17;
  const char *v18;

  objc_msgSend_thumbnailBlobs(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataStore(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_count(v4, v11, v12);
  if (v13 >= 2)
  {
    v15 = v13;
    for (i = 1; i != v15; ++i)
    {
      objc_msgSend_objectAtIndexedSubscript_(v4, v14, i);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeObject_(v7, v18, (uint64_t)v17);

    }
  }

  return v10;
}

- (NSRange)suggestedAge
{
  uint64_t v2;
  NSUInteger location;
  NSUInteger length;
  const char *v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  NSRange result;

  objc_msgSend_lock(self, a2, v2);
  location = self->_suggestedAge.location;
  length = self->_suggestedAge.length;
  objc_msgSend_unlock(self, v6, v7);
  v8 = location;
  v9 = length;
  result.length = v9;
  result.location = v8;
  return result;
}

- (void)setSuggestedAge:(NSRange)suggestedAge
{
  NSUInteger length;
  NSUInteger location;
  const char *v6;
  uint64_t v7;
  NSUInteger v8;
  const char *v9;

  length = suggestedAge.length;
  location = suggestedAge.location;
  objc_msgSend_lock(self, a2, suggestedAge.location);
  v8 = 0x7FFFFFFFFFFFFFFFLL;
  if ((uint64_t)(location + length) >= 0)
    v8 = length;
  self->_suggestedAge.location = location;
  self->_suggestedAge.length = v8;
  objc_msgSend_unlock(self, v6, v7);
  objc_msgSend_setModified_(self, v9, 1);
}

- (NSRange)suggestedCompletionTime
{
  uint64_t v2;
  NSUInteger location;
  NSUInteger length;
  const char *v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  NSRange result;

  objc_msgSend_lock(self, a2, v2);
  location = self->_suggestedCompletionTime.location;
  length = self->_suggestedCompletionTime.length;
  objc_msgSend_unlock(self, v6, v7);
  v8 = location;
  v9 = length;
  result.length = v9;
  result.location = v8;
  return result;
}

- (void)setSuggestedCompletionTime:(NSRange)suggestedCompletionTime
{
  NSUInteger length;
  NSUInteger location;
  const char *v6;
  uint64_t v7;
  NSUInteger v8;
  const char *v9;

  length = suggestedCompletionTime.length;
  location = suggestedCompletionTime.location;
  objc_msgSend_lock(self, a2, suggestedCompletionTime.location);
  v8 = 0x7FFFFFFFFFFFFFFFLL;
  if ((uint64_t)(location + length) >= 0)
    v8 = length;
  self->_suggestedCompletionTime.location = location;
  self->_suggestedCompletionTime.length = v8;
  objc_msgSend_unlock(self, v6, v7);
  objc_msgSend_setModified_(self, v9, 1);
}

+ (id)defaultProgressReportingCapability
{
  if (qword_1ED0FB310 != -1)
    dispatch_once(&qword_1ED0FB310, &unk_1E974BEE8);
  return (id)qword_1ED0FB308;
}

- (id)_progressReportingCapabilities
{
  void *v2;
  const char *v3;
  void *v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1D40BE480;
  v6[3] = &unk_1E974BF10;
  v6[4] = self;
  objc_msgSend_childrenPassingTest_(self, a2, (uint64_t)v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v3, (uint64_t)v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSSet)progressReportingCapabilities
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;

  objc_msgSend__progressReportingCapabilities(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultProgressReportingCapability(CLSContext, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObject_(v3, v7, (uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v8;
}

- (void)addProgressReportingCapabilities:(NSSet *)capabilities
{
  NSSet *v4;
  void *v5;
  NSSet *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  unint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  _QWORD v35[5];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = capabilities;
  v5 = (void *)objc_opt_new();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v6 = v4;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v36, v40, 16);
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v37 != v12)
          objc_enumerationMutation(v6);
        v14 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        v15 = objc_msgSend_kind(v14, v9, v10);
        if (v15)
        {
          sub_1D4078D30(v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v5, v17, (uint64_t)v14, v16);

        }
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v36, v40, 16);
    }
    while (v11);
  }

  if (objc_msgSend_count(v5, v18, v19))
  {
    objc_msgSend_dataStore(self, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lock(v22, v23, v24);
    objc_msgSend_lock(self, v25, v26);
    objc_msgSend_resetProgressReportingCapabilities_unprotected(self, v27, v28);
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = sub_1D40BE7EC;
    v35[3] = &unk_1E974BF38;
    v35[4] = self;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v5, v29, (uint64_t)v35);
    objc_msgSend_unlock(self, v30, v31);
    objc_msgSend_unlock(v22, v32, v33);
    objc_msgSend_setModified_(self, v34, 1);

  }
}

- (void)resetProgressReportingCapabilities_unprotected
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend__progressReportingCapabilities(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v15, v19, 16);
  if (v6)
  {
    v9 = v6;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v4);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
        objc_msgSend_dataStore(self, v7, v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removeObject_(v13, v14, v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v15, v19, 16);
    }
    while (v9);
  }

}

- (void)resetProgressReportingCapabilities
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  id v15;

  objc_msgSend_dataStore(self, a2, v2);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v15, v4, v5);
  objc_msgSend_lock(self, v6, v7);
  objc_msgSend_resetProgressReportingCapabilities_unprotected(self, v8, v9);
  objc_msgSend_unlock(self, v10, v11);
  objc_msgSend_unlock(v15, v12, v13);
  objc_msgSend_setModified_(self, v14, 1);

}

- (id)_navigationNodes
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = sub_1D40BE9B8;
  v3[3] = &unk_1E974BF60;
  v3[4] = self;
  objc_msgSend_childrenPassingTest_(self, a2, (uint64_t)v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)navigationChildContexts
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  id v18;
  const char *v19;
  void *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  void *v36;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend_lock(self, v4, v5);
  objc_msgSend_dataStore(self, v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend__navigationNodes(self, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0C99DE8];
    v15 = objc_msgSend_count(v11, v13, v14);
    objc_msgSend_arrayWithCapacity_(v12, v16, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = sub_1D40BED0C;
    v43[3] = &unk_1E974BF88;
    v18 = v17;
    v44 = v18;
    v38 = v11;
    objc_msgSend_enumerateObjectsUsingBlock_(v11, v19, (uint64_t)v43);
    v20 = (void *)objc_opt_new();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v21 = v18;
    v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v39, v45, 16);
    if (v23)
    {
      v25 = v23;
      v26 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v40 != v26)
            objc_enumerationMutation(v21);
          v28 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend_objectWithObjectID_(v10, v24, v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
            objc_msgSend_addObject_(v3, v29, (uint64_t)v30);
          else
            objc_msgSend_addObject_(v20, v29, v28);

        }
        v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v39, v45, 16);
      }
      while (v25);
    }

    if (objc_msgSend_count(v20, v31, v32))
    {
      objc_msgSend_syncFetchContextsForContextIDs_(v10, v33, (uint64_t)v20);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
        objc_msgSend_addObjectsFromArray_(v3, v35, (uint64_t)v36);

    }
    objc_msgSend_unlock(self, v33, v34);

  }
  else
  {
    objc_msgSend_unlock(self, v8, v9);
  }

  return (NSArray *)v3;
}

- (void)addNavigationChildContext:(CLSContext *)child
{
  CLSContext *v5;
  const char *v6;
  uint64_t v7;
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
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  const char *v34;
  void *v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  NSObject *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  CLSContextNavigationNode *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  const char *v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  uint8_t buf[4];
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = child;
  objc_msgSend_lock(self, v6, v7);
  objc_msgSend_parentObjectID(v5, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v39 = (void *)MEMORY[0x1E0CB35C8];
    v40 = objc_opt_class();
    NSStringFromSelector(a2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cls_createErrorWithCode_errorObject_format_(v39, v42, 3, self, CFSTR("- [%@ %@]; Cannot add navigation child context. Parent is missing path."),
      v40,
      v41);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v43 = CLSLogDefault;
    if (!os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_DWORD *)buf = 138412290;
    v63 = v22;
    goto LABEL_21;
  }
  objc_msgSend_parentObjectID(v5, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectID(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 == v16)
  {
    v46 = (void *)MEMORY[0x1E0CB35C8];
    v47 = objc_opt_class();
    NSStringFromSelector(a2);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cls_createErrorWithCode_errorObject_format_(v46, v49, 3, self, CFSTR("- [%@ %@]; Cannot add a child context as a navigation child context."),
      v47,
      v48);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v43 = CLSLogDefault;
    if (!os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_DWORD *)buf = 138412290;
    v63 = v22;
LABEL_21:
    _os_log_error_impl(&dword_1D4054000, v43, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
LABEL_16:
    objc_msgSend_unlock(self, v44, v45);
    goto LABEL_19;
  }
  v19 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend_objectID(v5, v17, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predicateWithFormat_(v19, v21, (uint64_t)CFSTR("childObjectID = %@"), v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__navigationNodes(self, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filteredArrayUsingPredicate_(v25, v26, (uint64_t)v22);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_firstObject(v27, v28, v29);
  v30 = objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v31 = (void *)v30;
    v32 = (void *)MEMORY[0x1E0CB35C8];
    NSStringFromSelector(a2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cls_createErrorWithCode_errorObject_format_(v32, v34, 3, self, CFSTR("- [%@ %@]; Cannot add previously added navigation child."),
      v5,
      v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v36 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v63 = v35;
      _os_log_error_impl(&dword_1D4054000, v36, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    objc_msgSend_unlock(self, v37, v38);

  }
  else
  {
    v50 = [CLSContextNavigationNode alloc];
    objc_msgSend_objectID(self, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectID(v5, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend_initWithParentContextID_childContextID_(v50, v57, (uint64_t)v53, v56);

    objc_msgSend_addChild_(self, v58, (uint64_t)v31);
    objc_msgSend_setModified_(self, v59, 1);
    objc_msgSend_unlock(self, v60, v61);
  }

LABEL_19:
}

- (void)removeNavigationChildContext:(CLSContext *)child
{
  CLSContext *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  id v23;

  v4 = child;
  objc_msgSend_lock(self, v5, v6);
  v7 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend_objectID(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_predicateWithFormat_(v7, v11, (uint64_t)CFSTR("childObjectID = %@"), v10);
  v23 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend__navigationNodes(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filteredArrayUsingPredicate_(v14, v15, (uint64_t)v23);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_firstObject(v16, v17, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_msgSend_removeChild_(self, v19, (uint64_t)v21);
    objc_msgSend_setModified_(self, v22, 1);
  }
  objc_msgSend_unlock(self, v19, v20);

}

- (BOOL)isActive
{
  uint64_t v2;
  BOOL active;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  active = self->_active;
  objc_msgSend_unlock(self, v5, v6);
  return active;
}

- (void)becomeActive
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  CLSContext *v9;
  const char *v10;
  uint64_t v11;
  CLSContext *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  id v18;

  objc_msgSend_dataStore(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v18 = v4;
    objc_msgSend_lock(v4, v5, v6);
    objc_msgSend_activeContext(v18, v7, v8);
    v9 = (CLSContext *)objc_claimAutoreleasedReturnValue();
    v12 = v9;
    if (v9 != self)
    {
      objc_msgSend_resignActive(v9, v10, v11);
      objc_msgSend_lock(self, v13, v14);
      self->_active = 1;
      objc_msgSend_setModified_(self, v15, 1);
      objc_msgSend_unlock(self, v16, v17);
    }
    objc_msgSend_unlock(v18, v10, v11);

    v4 = v18;
  }

}

- (void)resignActive
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;

  objc_msgSend_lock(self, a2, v2);
  self->_active = 0;
  objc_msgSend_unlock(self, v4, v5);
}

- (NSArray)path
{
  uint64_t v2;
  NSArray *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_path;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (NSArray)identifierPath
{
  uint64_t v2;
  NSArray *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_path;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setIdentifierPathAndGenerateObjectID:(id)a3
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  id v17;

  v17 = a3;
  objc_msgSend_lock(self, v5, v6);
  objc_storeStrong((id *)&self->_path, a3);
  objc_msgSend_objectIDForIdentifierPath_(CLSContext, v7, (uint64_t)v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v8, v9, v10))
    objc_msgSend_setObjectID_(self, v11, (uint64_t)v8);
  objc_msgSend_stableObjectIDForIdentifierPath_(CLSContext, v11, (uint64_t)v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v12, v13, v14))
    objc_msgSend_setStableObjectID_(self, v15, (uint64_t)v12);
  objc_msgSend_unlock(self, v15, v16);

}

+ (id)validatedContextIdentifierPathFromPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1D82573E4]();
  v5 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v3;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v20, v24, 16);
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v6);
        v14 = (void *)objc_msgSend_copy(*(void **)(*((_QWORD *)&v20 + 1) + 8 * v13), v9, v10, (_QWORD)v20);
        objc_msgSend_addObject_(v5, v15, (uint64_t)v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v20, v24, 16);
    }
    while (v11);
  }

  v18 = (void *)objc_msgSend_copy(v5, v16, v17);
  objc_autoreleasePoolPop(v4);

  return v18;
}

+ (id)objectIDPathFromIdentifierPath:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v7 = objc_msgSend_count(v3, v5, v6);
  if (v7 >= 8)
    v8 = 8;
  else
    v8 = v7;
  if (v8)
  {
    v9 = 0;
    do
    {
      v10 = (void *)MEMORY[0x1D82573E4]();
      objc_msgSend_subarrayWithRange_(v3, v11, 0, ++v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dataFromPath_makeBackwardCompatible_error_(CLSUtil, v13, (uint64_t)v12, 1, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_hashData_lastHash_(CLSUtil, v15, (uint64_t)v14, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v4, v17, (uint64_t)v16);

      objc_autoreleasePoolPop(v10);
    }
    while (v8 != v9);
  }

  return v4;
}

+ (id)stableObjectIDPathFromIdentifierPath:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v7 = objc_msgSend_count(v3, v5, v6);
  if (v7 >= 8)
    v8 = 8;
  else
    v8 = v7;
  if (v8)
  {
    v9 = 0;
    do
    {
      v10 = (void *)MEMORY[0x1D82573E4]();
      objc_msgSend_subarrayWithRange_(v3, v11, 0, ++v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stableObjectIDForIdentifierPath_(CLSContext, v13, (uint64_t)v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v4, v15, (uint64_t)v14);

      objc_autoreleasePoolPop(v10);
    }
    while (v8 != v9);
  }

  return v4;
}

+ (id)objectIDForIdentifierPath:(id)a3
{
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_dataFromPath_makeBackwardCompatible_error_(CLSUtil, a2, (uint64_t)a3, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_hashData_lastHash_(CLSUtil, v4, (uint64_t)v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)stableObjectIDForIdentifierPath:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](CLSUtil, sel_hashArrayOfStrings_lastHash_, a3);
}

+ (id)arrayOfStringClasses
{
  if (qword_1ED0FB320 != -1)
    dispatch_once(&qword_1ED0FB320, &unk_1E974BFA8);
  return (id)qword_1ED0FB318;
}

+ (id)allowedTopics
{
  if (qword_1ED0FB330 != -1)
    dispatch_once(&qword_1ED0FB330, &unk_1E974BFC8);
  return (id)qword_1ED0FB328;
}

+ (id)reservedContextTypes
{
  if (qword_1ED0FB340 != -1)
    dispatch_once(&qword_1ED0FB340, &unk_1E974BFE8);
  return (id)qword_1ED0FB338;
}

- (int64_t)authorizationStatus
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  int64_t v13;

  objc_msgSend_dataStore(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (v4)
  {
    objc_msgSend_authTree(v4, v5, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend_identifierPath(self, v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend_authStatusAtIdentifierPath_(v10, v12, (uint64_t)v11);

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (int64_t)effectiveAuthorizationStatus
{
  return ((uint64_t (*)(CLSContext *, char *))MEMORY[0x1E0DE7D20])(self, sel_authorizationStatus);
}

- (NSString)description
{
  id v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  NSString *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  NSString *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  objc_super v47;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v47.receiver = self;
  v47.super_class = (Class)CLSContext;
  -[CLSObject description](&v47, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_initWithString_(v3, v5, (uint64_t)v4);

  v9 = objc_msgSend_type(self, v7, v8);
  DefaultNameFromContextType(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v10, v11, v12))
    objc_msgSend_appendFormat_(v6, v13, (uint64_t)CFSTR(" (type: %@)"), v10);
  if (objc_msgSend_type(self, v13, v14) == 17)
    objc_msgSend_appendFormat_(v6, v15, (uint64_t)CFSTR(" (customTypeName: %@)"), self->_customTypeName);
  objc_msgSend_identifier(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_length(v17, v18, v19);

  if (v20)
  {
    objc_msgSend_identifier(self, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_UTF8String(v23, v24, v25);
    objc_msgSend_appendFormat_(v6, v27, (uint64_t)CFSTR(" (identifier: %.512s)"), v26);

  }
  objc_msgSend_lock(self, v21, v22);
  if (objc_msgSend_length(self->_title, v28, v29))
  {
    v32 = self->_title;
    v35 = objc_msgSend_UTF8String(v32, v33, v34);
    objc_msgSend_appendFormat_(v6, v36, (uint64_t)CFSTR(" (title: %.512s)"), v35);

  }
  if (objc_msgSend_length(self->_topic, v30, v31))
  {
    v39 = self->_topic;
    v42 = objc_msgSend_UTF8String(v39, v40, v41);
    objc_msgSend_appendFormat_(v6, v43, (uint64_t)CFSTR(" (topic: %.512s)"), v42);

  }
  if (objc_msgSend_length(self->_currentActivityID, v37, v38))
    objc_msgSend_appendFormat_(v6, v44, (uint64_t)CFSTR(" (activityID: %@)"), self->_currentActivityID);
  objc_msgSend_unlock(self, v44, v45);

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  NSString *identifier;
  NSString *storeIdentifier;
  NSString *storeTeamID;
  const char *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  NSURL *universalLinkURL;
  void *v18;
  const char *v19;
  NSString *title;
  NSString *topic;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CLSContext;
  -[CLSObject dictionaryRepresentation](&v23, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(self, v4, v5);
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v6, (uint64_t)identifier, CFSTR("identifier"));
  storeIdentifier = self->_storeIdentifier;
  if (storeIdentifier)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v6, (uint64_t)storeIdentifier, CFSTR("storeIdentifier"));
  storeTeamID = self->_storeTeamID;
  if (storeTeamID)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v6, (uint64_t)storeTeamID, CFSTR("storeTeamID"));
  objc_msgSend_setObject_forKeyedSubscript_(v3, v6, (uint64_t)self->_path, CFSTR("path"));
  v12 = objc_msgSend_type(self, v10, v11);
  DefaultNameFromContextType(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v14, (uint64_t)v13, CFSTR("type"));

  universalLinkURL = self->_universalLinkURL;
  if (universalLinkURL)
  {
    objc_msgSend_absoluteString(universalLinkURL, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v3, v19, (uint64_t)v18, CFSTR("universalLinkURL"));

  }
  title = self->_title;
  if (title)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v15, (uint64_t)title, CFSTR("title"));
  topic = self->_topic;
  if (topic)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v15, (uint64_t)topic, CFSTR("topic"));
  objc_msgSend_unlock(self, v15, (uint64_t)topic);
  return v3;
}

+ (BOOL)conformsToProtocol:(id)a3
{
  Protocol *v4;
  Protocol *v5;
  const char *Name;
  unsigned __int8 v7;
  objc_super v9;

  v4 = (Protocol *)a3;
  v5 = v4;
  if (v4 && (Name = protocol_getName(v4), !strcmp(Name, "UIActivityItemSource")))
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___CLSContext;
    v7 = objc_msgSendSuper2(&v9, sel_conformsToProtocol_, v5);
  }

  return v7;
}

- (BOOL)conformsToProtocol:(id)a3
{
  Protocol *v4;
  Protocol *v5;
  const char *Name;
  BOOL v7;
  objc_super v9;

  v4 = (Protocol *)a3;
  v5 = v4;
  if (v4 && (Name = protocol_getName(v4), !strcmp(Name, "UIActivityItemSource")))
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CLSContext;
    v7 = -[CLSContext conformsToProtocol:](&v9, sel_conformsToProtocol_, v5);
  }

  return v7;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend_newItemProvider(self, a2, (uint64_t)a3);
  objc_setAssociatedObject(self, &off_1E974C008, v4, (void *)1);
  return v4;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  void *v5;

  if (objc_msgSend_hasPrefix_(a4, a2, (uint64_t)CFSTR("com.apple.")))
  {
    objc_getAssociatedObject(self, &off_1E974C008);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)newItemProvider
{
  id v3;
  const char *v4;
  void *v5;
  id v6;
  const char *v7;
  void *v8;
  id v9;
  const char *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v3 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  v14 = 0;
  objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v4, (uint64_t)self, 1, &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;
  v8 = v6;
  if (v6)
  {
    objc_msgSend_cls_debug_(v6, v7, CLSLogDefault);
    v9 = 0;
  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_1D40C0124;
    v12[3] = &unk_1E974C018;
    v13 = v5;
    objc_msgSend_registerDataRepresentationForTypeIdentifier_visibility_loadHandler_(v3, v10, (uint64_t)CFSTR("com.apple.ClassKit.context"), 0, v12);
    v9 = v3;

  }
  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (CLSContextType)type
{
  return self->_type;
}

- (BOOL)isAssignable
{
  return self->_assignable;
}

- (void)setAssignable:(BOOL)assignable
{
  self->_assignable = assignable;
}

- (NSString)stableObjectID
{
  return self->_stableObjectID;
}

- (void)setStableObjectID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (void)setPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)storeTeamID
{
  return self->_storeTeamID;
}

- (void)setStoreTeamID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void)setAuthorizationStatus:(int64_t)a3
{
  self->_authorizationStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_storeTeamID, 0);
  objc_storeStrong((id *)&self->_stableObjectID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_customTypeName, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_contentStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_currentActivityID, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_universalLinkURL, 0);
}

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D40C0638;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB8D0 != -1)
    dispatch_once(&qword_1ED0FB8D0, block);
  return (id)qword_1ED0FB8C8;
}

@end
