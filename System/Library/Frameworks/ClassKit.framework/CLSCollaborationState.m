@implementation CLSCollaborationState

+ (id)identifierForTargetObjectID:(id)a3 ownerPersonID:(id)a4 domain:(int64_t)a5
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("%@:%@:%ld"), a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sha224(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)supportedInfoDictionaryClasses
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;

  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  return (id)objc_msgSend_initWithObjects_(v2, v10, v3, v4, v5, v6, v7, v8, v9, 0);
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSCollaborationState;
  return -[CLSObject _init](&v3, sel__init);
}

- (id)initForObjectWithID:(id)a3 targetClass:(Class)a4 ownerPersonID:(id)a5 domain:(int64_t)a6 state:(int64_t)a7 flags:(unint64_t)a8
{
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;

  v14 = a3;
  v15 = a5;
  v19 = objc_msgSend__init(self, v16, v17);
  if (v19)
  {
    objc_msgSend_identifierForTargetObjectID_ownerPersonID_domain_(CLSCollaborationState, v18, (uint64_t)v14, v15, a6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObjectID_((void *)v19, v21, (uint64_t)v20);

    objc_msgSend_setParentObjectID_((void *)v19, v22, (uint64_t)v14);
    NSStringFromClass(a4);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = *(void **)(v19 + 104);
    *(_QWORD *)(v19 + 104) = v23;

    objc_storeStrong((id *)(v19 + 112), a5);
    *(_QWORD *)(v19 + 120) = a6;
    *(_QWORD *)(v19 + 128) = 1;
    *(_QWORD *)(v19 + 136) = a7;
    *(_QWORD *)(v19 + 144) = a8;
  }

  return (id)v19;
}

- (id)initForObject:(id)a3 ownerPersonID:(id)a4 domain:(int64_t)a5 state:(int64_t)a6 flags:(unint64_t)a7
{
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  void *v19;

  v12 = a4;
  v13 = a3;
  objc_msgSend_objectID(v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_class();

  v19 = (void *)objc_msgSend_initForObjectWithID_targetClass_ownerPersonID_domain_state_flags_(self, v18, (uint64_t)v16, v17, v12, a5, a6, a7);
  return v19;
}

- (BOOL)validateObject:(id *)a3
{
  _BOOL4 v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CLSCollaborationState;
  v5 = -[CLSObject validateObject:](&v19, sel_validateObject_);
  if (v5)
  {
    if ((unint64_t)objc_msgSend_length(self->_note, v6, v7) < 0x3E9)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = (void *)MEMORY[0x1E0CB34D0];
      v10 = objc_opt_class();
      objc_msgSend_bundleForClass_(v9, v11, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v12, v13, (uint64_t)CFSTR("ERROR_DESCRIPTION_COLLAB_STATE_NOTE_TOO_LONG_FORMAT"), &stru_1E974C8A0, CFSTR("ClassKit"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v8, v15, (uint64_t)v14, 1000);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_cls_assignError_code_errorObject_description_(MEMORY[0x1E0CB35C8], v17, (uint64_t)a3, 6, self, v16);
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
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
  uint64_t v19;
  const char *v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (void *)objc_msgSend__init(v7, v8, v9);
  objc_msgSend_parentObjectID(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ownerPersonID(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_domain(self, v17, v18);
  objc_msgSend_identifierForTargetObjectID_ownerPersonID_domain_(CLSCollaborationState, v20, (uint64_t)v13, v16, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObjectID_(v10, v22, (uint64_t)v21);

  objc_msgSend_dateCreated(self, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend_copy(v25, v26, v27);
  objc_msgSend_setDateCreated_(v10, v29, (uint64_t)v28);

  objc_msgSend_dateLastModified(self, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend_copy(v32, v33, v34);
  objc_msgSend_setDateLastModified_(v10, v36, (uint64_t)v35);

  objc_msgSend_parentObjectID(self, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setParentObjectID_(v10, v40, (uint64_t)v39);

  objc_msgSend_parentEntityName(self, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setParentEntityName_(v10, v44, (uint64_t)v43);

  objc_msgSend_ownerPersonID(self, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOwnerPersonID_(v10, v48, (uint64_t)v47);

  v51 = objc_msgSend_domain(self, v49, v50);
  objc_msgSend_setDomain_(v10, v52, v51);
  v55 = objc_msgSend_domainVersion(self, v53, v54);
  objc_msgSend_setDomainVersion_(v10, v56, v55);
  v59 = objc_msgSend_state(self, v57, v58);
  objc_msgSend_setState_(v10, v60, v59);
  v63 = objc_msgSend_flags(self, v61, v62);
  objc_msgSend_setFlags_(v10, v64, v63);
  objc_msgSend_classID(self, v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClassID_(v10, v68, (uint64_t)v67);

  objc_msgSend_note(self, v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNote_(v10, v72, (uint64_t)v71);

  objc_msgSend_assetURL(self, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAssetURL_(v10, v76, (uint64_t)v75);

  objc_msgSend_info(self, v77, v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInfo_(v10, v80, (uint64_t)v79);

  objc_msgSend_senderPersonID(self, v81, v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSenderPersonID_(v10, v84, (uint64_t)v83);

  objc_msgSend_recipientPersonID(self, v85, v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecipientPersonID_(v10, v88, (uint64_t)v87);

  objc_msgSend_serverETag(self, v89, v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServerETag_(v10, v92, (uint64_t)v91);

  v95 = objc_msgSend_serverStatus(self, v93, v94);
  objc_msgSend_setServerStatus_(v10, v96, v95);
  objc_msgSend_serverExecutionID(self, v97, v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setServerExecutionID_(v10, v100, (uint64_t)v99);

  objc_msgSend_assetsToAddOrUpdate(self, v101, v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = (void *)objc_msgSend_copy(v103, v104, v105);
  objc_msgSend_setAssetsToAddOrUpdate_(v10, v107, (uint64_t)v106);

  return v10;
}

- (BOOL)hasServerMetadata
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;

  objc_msgSend_serverExecutionID(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

    return 1;
  }
  objc_msgSend_serverETag(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    return 1;
  return objc_msgSend_serverStatus(self, v8, v9) != 0;
}

- (NSMutableArray)assetsToAddOrUpdate
{
  NSMutableArray *assetsToAddOrUpdate;
  NSMutableArray *v4;
  NSMutableArray *v5;

  assetsToAddOrUpdate = self->_assetsToAddOrUpdate;
  if (!assetsToAddOrUpdate)
  {
    v4 = (NSMutableArray *)objc_opt_new();
    v5 = self->_assetsToAddOrUpdate;
    self->_assetsToAddOrUpdate = v4;

    assetsToAddOrUpdate = self->_assetsToAddOrUpdate;
  }
  return assetsToAddOrUpdate;
}

- (CLSCollaborationState)initWithCoder:(id)a3
{
  id v4;
  CLSCollaborationState *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *ownerPersonID;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSString *parentEntityName;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  NSString *senderPersonID;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  NSString *recipientPersonID;
  const char *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  NSString *classID;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  NSString *note;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  NSURL *assetURL;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  NSDictionary *info;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  NSString *serverETag;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  NSString *serverExecutionID;
  const char *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  NSMutableArray *assetsToAddOrUpdate;
  objc_super v64;

  v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)CLSCollaborationState;
  v5 = -[CLSObject initWithCoder:](&v64, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("ownerPersonID"));
    v8 = objc_claimAutoreleasedReturnValue();
    ownerPersonID = v5->_ownerPersonID;
    v5->_ownerPersonID = (NSString *)v8;

    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, CFSTR("parentEntityName"));
    v12 = objc_claimAutoreleasedReturnValue();
    parentEntityName = v5->_parentEntityName;
    v5->_parentEntityName = (NSString *)v12;

    v14 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, CFSTR("senderPersonID"));
    v16 = objc_claimAutoreleasedReturnValue();
    senderPersonID = v5->_senderPersonID;
    v5->_senderPersonID = (NSString *)v16;

    v18 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, CFSTR("recipientPersonID"));
    v20 = objc_claimAutoreleasedReturnValue();
    recipientPersonID = v5->_recipientPersonID;
    v5->_recipientPersonID = (NSString *)v20;

    v5->_domain = objc_msgSend_decodeIntegerForKey_(v4, v22, (uint64_t)CFSTR("domain"));
    v5->_domainVersion = objc_msgSend_decodeIntegerForKey_(v4, v23, (uint64_t)CFSTR("domainVersion"));
    v5->_state = objc_msgSend_decodeIntegerForKey_(v4, v24, (uint64_t)CFSTR("state"));
    v25 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v26, v25, CFSTR("flags"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_flags = objc_msgSend_unsignedIntegerValue(v27, v28, v29);

    v30 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v31, v30, CFSTR("classID"));
    v32 = objc_claimAutoreleasedReturnValue();
    classID = v5->_classID;
    v5->_classID = (NSString *)v32;

    v34 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v35, v34, CFSTR("note"));
    v36 = objc_claimAutoreleasedReturnValue();
    note = v5->_note;
    v5->_note = (NSString *)v36;

    v38 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v39, v38, CFSTR("assetURL"));
    v40 = objc_claimAutoreleasedReturnValue();
    assetURL = v5->_assetURL;
    v5->_assetURL = (NSURL *)v40;

    objc_msgSend_supportedInfoDictionaryClasses(CLSCollaborationState, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v45, (uint64_t)v44, CFSTR("info"));
    v46 = objc_claimAutoreleasedReturnValue();
    info = v5->_info;
    v5->_info = (NSDictionary *)v46;

    v48 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v49, v48, CFSTR("serverETag"));
    v50 = objc_claimAutoreleasedReturnValue();
    serverETag = v5->_serverETag;
    v5->_serverETag = (NSString *)v50;

    v52 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v53, v52, CFSTR("serverExecutionID"));
    v54 = objc_claimAutoreleasedReturnValue();
    serverExecutionID = v5->_serverExecutionID;
    v5->_serverExecutionID = (NSString *)v54;

    v5->_serverStatus = objc_msgSend_decodeIntegerForKey_(v4, v56, (uint64_t)CFSTR("serverStatus"));
    objc_msgSend_supportedInfoDictionaryClasses(CLSCollaborationState, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v60, (uint64_t)v59, CFSTR("assetsToAddOrUpdate"));
    v61 = objc_claimAutoreleasedReturnValue();
    assetsToAddOrUpdate = v5->_assetsToAddOrUpdate;
    v5->_assetsToAddOrUpdate = (NSMutableArray *)v61;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  void *v10;
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
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CLSCollaborationState;
  v4 = a3;
  -[CLSObject encodeWithCoder:](&v23, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_ownerPersonID, CFSTR("ownerPersonID"), v23.receiver, v23.super_class);
  objc_msgSend_encodeInteger_forKey_(v4, v6, self->_domain, CFSTR("domain"));
  objc_msgSend_encodeInteger_forKey_(v4, v7, self->_domainVersion, CFSTR("domainVersion"));
  objc_msgSend_encodeInteger_forKey_(v4, v8, self->_state, CFSTR("state"));
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v9, self->_flags);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v11, (uint64_t)v10, CFSTR("flags"));

  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)self->_classID, CFSTR("classID"));
  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)self->_note, CFSTR("note"));
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)self->_assetURL, CFSTR("assetURL"));
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)self->_info, CFSTR("info"));
  objc_msgSend_encodeObject_forKey_(v4, v16, (uint64_t)self->_serverETag, CFSTR("serverETag"));
  objc_msgSend_encodeObject_forKey_(v4, v17, (uint64_t)self->_serverExecutionID, CFSTR("serverExecutionID"));
  objc_msgSend_encodeInteger_forKey_(v4, v18, self->_serverStatus, CFSTR("serverStatus"));
  objc_msgSend_encodeObject_forKey_(v4, v19, (uint64_t)self->_parentEntityName, CFSTR("parentEntityName"));
  objc_msgSend_encodeObject_forKey_(v4, v20, (uint64_t)self->_senderPersonID, CFSTR("senderPersonID"));
  objc_msgSend_encodeObject_forKey_(v4, v21, (uint64_t)self->_recipientPersonID, CFSTR("recipientPersonID"));
  objc_msgSend_encodeObject_forKey_(v4, v22, (uint64_t)self->_assetsToAddOrUpdate, CFSTR("assetsToAddOrUpdate"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)mergeWithObject:(id)a3
{
  id v4;
  const char *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  const char *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  _QWORD v22[17];

  v22[16] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CLSCollaborationState;
  -[CLSObject mergeWithObject:](&v20, sel_mergeWithObject_, v4);
  v22[0] = CFSTR("parentEntityName");
  v22[1] = CFSTR("senderPersonID");
  v22[2] = CFSTR("recipientPersonID");
  v22[3] = CFSTR("classID");
  v22[4] = CFSTR("ownerPersonID");
  v22[5] = CFSTR("domain");
  v22[6] = CFSTR("domainVersion");
  v22[7] = CFSTR("state");
  v22[8] = CFSTR("flags");
  v22[9] = CFSTR("note");
  v22[10] = CFSTR("assetURL");
  v22[11] = CFSTR("info");
  v22[12] = CFSTR("serverETag");
  v22[13] = CFSTR("serverExecutionID");
  v22[14] = CFSTR("serverStatus");
  v22[15] = CFSTR("assetsToAddOrUpdate");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v5, (uint64_t)v22, 16);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v16, v21, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v6);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend_valueForKey_(v4, v9, v13, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setValue_forKey_(self, v15, (uint64_t)v14, v13);

      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v16, v21, 16);
    }
    while (v10);
  }

}

- (NSString)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  objc_super v68;

  v68.receiver = self;
  v68.super_class = (Class)CLSCollaborationState;
  -[CLSObject description](&v68, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_mutableCopy(v3, v4, v5);

  objc_msgSend_ownerPersonID(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v10, (uint64_t)CFSTR(" (ownerPersonID: %@)"), v9);

  v13 = objc_msgSend_domain(self, v11, v12);
  objc_msgSend_appendFormat_(v6, v14, (uint64_t)CFSTR(" (domain: %ld)"), v13);
  v17 = objc_msgSend_domainVersion(self, v15, v16);
  objc_msgSend_appendFormat_(v6, v18, (uint64_t)CFSTR(" (domainVersion: %ld)"), v17);
  v21 = objc_msgSend_state(self, v19, v20);
  objc_msgSend_appendFormat_(v6, v22, (uint64_t)CFSTR(" (state: %ld)"), v21);
  v25 = objc_msgSend_flags(self, v23, v24);
  objc_msgSend_appendFormat_(v6, v26, (uint64_t)CFSTR(" (flags: %ld)"), v25);
  objc_msgSend_classID(self, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v30, (uint64_t)CFSTR(" (classID: %@)"), v29);

  objc_msgSend_note(self, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v34, (uint64_t)CFSTR(" (note: %@)"), v33);

  objc_msgSend_assetURL(self, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v38, (uint64_t)CFSTR(" (assetURL: %@)"), v37);

  objc_msgSend_info(self, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v42, (uint64_t)CFSTR(" (info: %@)"), v41);

  objc_msgSend_serverETag(self, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v46, (uint64_t)CFSTR(" (serverETag: %@)"), v45);

  objc_msgSend_serverExecutionID(self, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v50, (uint64_t)CFSTR(" (serverExecutionID: %@)"), v49);

  v53 = objc_msgSend_serverStatus(self, v51, v52);
  objc_msgSend_appendFormat_(v6, v54, (uint64_t)CFSTR(" (serverStatus: %ld)"), v53);
  objc_msgSend_parentEntityName(self, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v58, (uint64_t)CFSTR(" (parentEntityName: %@)"), v57);

  objc_msgSend_senderPersonID(self, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v62, (uint64_t)CFSTR(" (senderPersonID: %@)"), v61);

  objc_msgSend_recipientPersonID(self, v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v66, (uint64_t)CFSTR(" (recipientPersonID: %@)"), v65);

  return (NSString *)v6;
}

- (id)friendlyDomainRepresentation
{
  unint64_t domain;
  __CFString *v3;
  void *v4;
  void *v5;
  const char *v6;
  void *v7;

  domain = self->_domain;
  if (domain > 5)
  {
    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], a2, domain);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E974A538[domain];
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], a2, domain);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v4, v6, (uint64_t)CFSTR("%@ (%@)"), v3, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)friendlyStateRepresentation
{
  unint64_t state;
  __CFString **v3;
  __CFString *v4;
  void *v5;
  void *v6;
  const char *v7;
  void *v8;

  switch(self->_domain)
  {
    case 1:
      state = self->_state;
      if (state >= 6)
        goto LABEL_12;
      v3 = off_1E974A568;
      goto LABEL_10;
    case 2:
      state = self->_state;
      if (state >= 3)
        goto LABEL_12;
      v3 = off_1E974A598;
      goto LABEL_10;
    case 3:
      state = self->_state;
      if (state >= 3)
        goto LABEL_12;
      v3 = off_1E974A5B0;
      goto LABEL_10;
    case 5:
      state = self->_state;
      if (state >= 3)
        goto LABEL_12;
      v3 = off_1E974A5C8;
LABEL_10:
      v4 = v3[state];
      v5 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], a2, state);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v5, v7, (uint64_t)CFSTR("%@ (%@)"), v4, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      state = self->_state;
LABEL_12:
      objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], a2, state);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v8;
}

- (id)friendlyFlagsRepresentation
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  unint64_t flags;
  uint64_t v8;
  const char *v9;
  const char *v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v6 = v3;
  if ((self->_domain | 4) != 5)
    goto LABEL_16;
  flags = self->_flags;
  if ((flags & 1) != 0)
  {
    objc_msgSend_appendString_(v3, v4, (uint64_t)CFSTR("Submitted,"));
    flags = self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_4:
      if ((flags & 4) == 0)
        goto LABEL_5;
      goto LABEL_22;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend_appendString_(v6, v4, (uint64_t)CFSTR("Revision Requested,"));
  flags = self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_5:
    if ((flags & 8) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend_appendString_(v6, v4, (uint64_t)CFSTR("Locked,"));
  flags = self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_6:
    if ((flags & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend_appendString_(v6, v4, (uint64_t)CFSTR("Unlocked,"));
  flags = self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_7:
    if ((flags & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend_appendString_(v6, v4, (uint64_t)CFSTR("Submitted Late,"));
  flags = self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_8:
    if ((flags & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend_appendString_(v6, v4, (uint64_t)CFSTR("Ask to Complete,"));
  flags = self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_9:
    if ((flags & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend_appendString_(v6, v4, (uint64_t)CFSTR("Considered Locked,"));
  flags = self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_10:
    if ((flags & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend_appendString_(v6, v4, (uint64_t)CFSTR("Legacy,"));
  flags = self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_11:
    if ((flags & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend_appendString_(v6, v4, (uint64_t)CFSTR("Operation Pending,"));
  flags = self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_12:
    if ((flags & 0x400) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_29:
  objc_msgSend_appendString_(v6, v4, (uint64_t)CFSTR("Operation Failed,"));
  if ((self->_flags & 0x400) != 0)
LABEL_13:
    objc_msgSend_appendString_(v6, v4, (uint64_t)CFSTR("Started,"));
LABEL_14:
  if (objc_msgSend_hasSuffix_(v6, v4, (uint64_t)CFSTR(",")))
  {
    v8 = objc_msgSend_length(v6, v4, v5);
    objc_msgSend_deleteCharactersInRange_(v6, v9, v8 - 1, 1);
  }
LABEL_16:
  if (objc_msgSend_length(v6, v4, v5))
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v10, self->_flags);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v11, v13, (uint64_t)CFSTR("%@ (%@)"), v6, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v10, self->_flags);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  NSString *classID;
  NSString *note;
  NSURL *assetURL;
  NSDictionary *info;
  NSString *serverETag;
  NSString *serverExecutionID;
  void *v28;
  const char *v29;
  const char *v30;
  NSString *senderPersonID;
  NSString *recipientPersonID;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)CLSCollaborationState;
  -[CLSObject dictionaryRepresentation](&v34, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v4, (uint64_t)self->_parentEntityName, CFSTR("parentEntityName"));
  objc_msgSend_setObject_forKeyedSubscript_(v3, v5, (uint64_t)self->_ownerPersonID, CFSTR("ownerPersonID"));
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v6, self->_domainVersion);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)v7, CFSTR("domainVersion"));

  objc_msgSend_friendlyDomainRepresentation(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v12, (uint64_t)v11, CFSTR("domain"));

  objc_msgSend_friendlyStateRepresentation(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v16, (uint64_t)v15, CFSTR("state"));

  objc_msgSend_friendlyFlagsRepresentation(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v20, (uint64_t)v19, CFSTR("flags"));

  classID = self->_classID;
  if (classID)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v21, (uint64_t)classID, CFSTR("classID"));
  note = self->_note;
  if (note)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v21, (uint64_t)note, CFSTR("note"));
  assetURL = self->_assetURL;
  if (assetURL)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v21, (uint64_t)assetURL, CFSTR("assetURL"));
  info = self->_info;
  if (info)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v21, (uint64_t)info, CFSTR("info"));
  serverETag = self->_serverETag;
  if (serverETag)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v21, (uint64_t)serverETag, CFSTR("serverETag"));
  serverExecutionID = self->_serverExecutionID;
  if (serverExecutionID)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v21, (uint64_t)serverExecutionID, CFSTR("serverExecutionID"));
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v21, self->_serverStatus);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v29, (uint64_t)v28, CFSTR("serverStatus"));

  senderPersonID = self->_senderPersonID;
  if (senderPersonID)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v30, (uint64_t)senderPersonID, CFSTR("senderPersonID"));
  recipientPersonID = self->_recipientPersonID;
  if (recipientPersonID)
    objc_msgSend_setObject_forKeyedSubscript_(v3, v30, (uint64_t)recipientPersonID, CFSTR("recipientPersonID"));
  return v3;
}

- (NSArray)assets
{
  uint64_t v3;
  const char *v4;

  v3 = objc_opt_class();
  return (NSArray *)objc_msgSend_childrenOfClass_(self, v4, v3);
}

- (NSString)ownerPersonID
{
  return self->_ownerPersonID;
}

- (void)setOwnerPersonID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (int64_t)domain
{
  return self->_domain;
}

- (void)setDomain:(int64_t)a3
{
  self->_domain = a3;
}

- (int64_t)domainVersion
{
  return self->_domainVersion;
}

- (void)setDomainVersion:(int64_t)a3
{
  self->_domainVersion = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (NSString)classID
{
  return self->_classID;
}

- (void)setClassID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSURL)assetURL
{
  return self->_assetURL;
}

- (void)setAssetURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)parentEntityName
{
  return self->_parentEntityName;
}

- (void)setParentEntityName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)senderPersonID
{
  return self->_senderPersonID;
}

- (void)setSenderPersonID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSString)recipientPersonID
{
  return self->_recipientPersonID;
}

- (void)setRecipientPersonID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)serverETag
{
  return self->_serverETag;
}

- (void)setServerETag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)serverExecutionID
{
  return self->_serverExecutionID;
}

- (void)setServerExecutionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (int64_t)serverStatus
{
  return self->_serverStatus;
}

- (void)setServerStatus:(int64_t)a3
{
  self->_serverStatus = a3;
}

- (void)setAssetsToAddOrUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_assetsToAddOrUpdate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsToAddOrUpdate, 0);
  objc_storeStrong((id *)&self->assets, 0);
  objc_storeStrong((id *)&self->_serverExecutionID, 0);
  objc_storeStrong((id *)&self->_serverETag, 0);
  objc_storeStrong((id *)&self->_recipientPersonID, 0);
  objc_storeStrong((id *)&self->_senderPersonID, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);
  objc_storeStrong((id *)&self->_classID, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_ownerPersonID, 0);
  objc_storeStrong((id *)&self->_parentEntityName, 0);
}

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D409E044;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB7B0 != -1)
    dispatch_once(&qword_1ED0FB7B0, block);
  return (id)qword_1ED0FB7A8;
}

@end
