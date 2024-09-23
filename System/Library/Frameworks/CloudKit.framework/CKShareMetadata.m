@implementation CKShareMetadata

+ (void)initialize
{
  objc_class *v2;
  uint64_t v3;

  v2 = (objc_class *)objc_opt_class();
  v3 = objc_opt_self();
  sub_18A5CEF4C(v3, v2, 0, 0, 0);
}

- (CKShareMetadata)init
{
  CKException *v2;
  const char *v3;
  id v4;

  v2 = [CKException alloc];
  v4 = (id)objc_msgSend_initWithName_format_(v2, v3, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Do not instantiate CKShare.Metadata, obtain them from CKFetchShareMetadataOperation or platform-specific scene / app delegate callbacks."));
  objc_exception_throw(v4);
}

- (id)initInternal
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKShareMetadata;
  result = -[CKShareMetadata init](&v3, sel_init);
  if (result)
  {
    *((_QWORD *)result + 4) = 0;
    *((_QWORD *)result + 5) = 0;
    *((_QWORD *)result + 6) = 0;
    *((_BYTE *)result + 8) = 1;
  }
  return result;
}

- (CKShareMetadata)initWithShare:(id)a3 containerID:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t inited;
  CKShareMetadata *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CKContainerID *containerID;

  v7 = a3;
  v8 = a4;
  inited = objc_msgSend_initInternal(self, v9, v10, v11);
  v13 = (CKShareMetadata *)inited;
  if (inited)
  {
    objc_storeStrong((id *)(inited + 16), a3);
    v17 = objc_msgSend_copy(v8, v14, v15, v16);
    containerID = v13->_containerID;
    v13->_containerID = (CKContainerID *)v17;

  }
  return v13;
}

- (CKRoughlyEquivalentProperties)equivalencyProperties
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;

  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend_participantRole(self, v5, v6, v7);
  objc_msgSend_numberWithInteger_(v4, v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v12, (uint64_t)v11, (uint64_t)CFSTR("participantRole"));

  v13 = (void *)MEMORY[0x1E0CB37E8];
  v17 = objc_msgSend_participantStatus(self, v14, v15, v16);
  objc_msgSend_numberWithInteger_(v13, v18, v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v21, (uint64_t)v20, (uint64_t)CFSTR("participantStatus"));

  v22 = (void *)MEMORY[0x1E0CB37E8];
  v26 = objc_msgSend_participantPermission(self, v23, v24, v25);
  objc_msgSend_numberWithInteger_(v22, v27, v26, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v30, (uint64_t)v29, (uint64_t)CFSTR("participantPermission"));

  objc_msgSend_share(self, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v35, (uint64_t)v34, (uint64_t)CFSTR("share"));

  objc_msgSend_rootRecord(self, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v40, (uint64_t)v39, (uint64_t)CFSTR("rootRecord"));

  objc_msgSend_sharedZone(self, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v45, (uint64_t)v44, (uint64_t)CFSTR("sharedZone"));

  objc_msgSend_properties(v3, v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKRoughlyEquivalentProperties *)v49;
}

- (NSString)baseToken
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  _BYTE v26[3];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend_publicToken(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  if (v4)
  {
    objc_msgSend_CKBase64URLSafeString(v4, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend_length(v9, v10, v11, v12);
    v26[0] = 3;
    v26[1] = HIBYTE(v13);
    v26[2] = v13;
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v14, (uint64_t)v26, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKBase64URLSafeString(v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v19;
    v27[1] = v9;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v20, (uint64_t)v27, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_componentsJoinedByString_(v21, v22, (uint64_t)&stru_1E1F66ED0, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = 0;
  }

  return (NSString *)v24;
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  _BOOL4 v6;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  const char *v46;
  void *v47;
  const char *v48;
  void *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;

  v6 = a4;
  objc_msgSend_dictionaryWithCapacity_(MEMORY[0x1E0C99E08], a2, 5, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    return v11;
  objc_msgSend_share(self, v8, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16;
  if (a5)
  {
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v16, v17, 1, 1, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v20, (uint64_t)CFSTR("shareID"), (uint64_t)v19);

  }
  else
  {
    objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v17, (uint64_t)CFSTR("shareID"), (uint64_t)v16);
  }

  objc_msgSend_uncachedURL(v12, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_absoluteString(v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v29, (uint64_t)CFSTR("shareURL"), (uint64_t)v28);

  objc_msgSend_rootRecord(self, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v33;
  if (v33)
  {
    if (a5)
    {
      objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v33, v34, 1, 1, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v39, (uint64_t)CFSTR("rootRecord"), (uint64_t)v38);

    }
    else
    {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v34, (uint64_t)CFSTR("rootRecord"), (uint64_t)v33);
    }
  }
  objc_msgSend_hierarchicalRootRecordID(self, v34, v35, v36);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v40;
  if (!v40)
  {
    if (a5)
      goto LABEL_13;
LABEL_15:
    objc_msgSend_containerID(self, v41, v42, v43);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ckShortDescription(v57, v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v63, (uint64_t)CFSTR("containerID"), (uint64_t)v62);

    goto LABEL_16;
  }
  if (!a5)
  {
    objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v41, (uint64_t)CFSTR("rootRecordID"), (uint64_t)v40);
    goto LABEL_15;
  }
  objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v40, v41, 1, 1, 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v46, (uint64_t)CFSTR("rootRecordID"), (uint64_t)v45);

LABEL_13:
  objc_msgSend_containerID(self, v41, v42, v43);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v47, v48, 1, 1, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v50, (uint64_t)CFSTR("containerID"), (uint64_t)v49);

  objc_msgSend_participants(v12, v51, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKMap_(v54, v55, (uint64_t)&unk_1E1F58A58, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v58, (uint64_t)CFSTR("participants"), (uint64_t)v57);
LABEL_16:

  v70 = objc_msgSend_participantRole(self, v64, v65, v66) - 1;
  if (v70 <= 3)
    objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v67, (uint64_t)CFSTR("participantRole"), (uint64_t)off_1E1F65958[v70]);
  v74 = objc_msgSend_participantStatus(self, v67, v68, v69) - 1;
  if (v74 <= 3)
    objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v71, (uint64_t)CFSTR("participantStatus"), (uint64_t)off_1E1F65978[v74]);
  v78 = objc_msgSend_participantPermission(self, v71, v72, v73) - 1;
  if (v78 <= 3)
    objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v75, (uint64_t)CFSTR("participantPermission"), (uint64_t)off_1E1F65998[v78]);
  if (a5)
  {
    objc_msgSend_requesters(v12, v75, v76, v77);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKMap_(v79, v80, (uint64_t)&unk_1E1F559E0, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v83, (uint64_t)CFSTR("requesters"), (uint64_t)v82);
    objc_msgSend_ownerIdentity(self, v84, v85, v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(v87, v88, 1, 1, 1);
  }
  else
  {
    objc_msgSend_ownerIdentity(self, v75, v76, v77);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_description(v87, v89, v90, v91);
  }
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKAddPropertySafelyForKey_value_(v11, v93, (uint64_t)CFSTR("Owner"), (uint64_t)v92);

  return v11;
}

- (id)description
{
  return (id)((uint64_t (*)(CKShareMetadata *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (id)ckShortDescription
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_share(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_hierarchicalRootRecordID(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerID(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ckShortDescription(v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ownerIdentity(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v27, (uint64_t)CFSTR("ShareID %@, rootRecordID %@, container %@, Owner %@"), v28, v10, v14, v22, v26);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (void)CKAssignToContainerWithID:(id)a3
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
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  NSObject *v29;
  int v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_containerID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend_share(self, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerID(self, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKAssignToContainerWithID_(v12, v17, (uint64_t)v16, v18);

    objc_msgSend_rootRecord(self, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerID(self, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKAssignToContainerWithID_(v22, v27, (uint64_t)v26, v28);

  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v29 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      v30 = 138412290;
      v31 = v4;
      _os_log_error_impl(&dword_18A5C5000, v29, OS_LOG_TYPE_ERROR, "No container identifier set on CKShareMetadata being assigned to %@", (uint8_t *)&v30, 0xCu);
    }
  }

}

- (CKShareParticipantType)participantType
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v4 = objc_msgSend_participantRole(self, a2, v2, v3);
  if ((unint64_t)(v4 - 1) > 3)
    return 0;
  else
    return qword_18A83D3D0[v4 - 1];
}

- (NSString)containerIdentifier
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_containerID(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerIdentifier(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (int64_t)environment
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int64_t v9;

  objc_msgSend_containerID(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  if (v4)
    v9 = objc_msgSend_environment(v4, v5, v6, v7);
  else
    v9 = 1;

  return v9;
}

- (void)fillAnonymousCKUserID:(id)a3
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
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_share(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_share(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend_copyWithAnonymousCKUserID_(v16, v17, (uint64_t)v4, v18);
  objc_msgSend_replaceRecordIDWith_(v8, v20, (uint64_t)v19, v21);

  objc_msgSend_sharedZone(self, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedZone(self, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend_copyWithAnonymousCKUserID_(v33, v34, (uint64_t)v4, v35);
  objc_msgSend_replaceZoneIDWith_(v25, v37, (uint64_t)v36, v38);

  objc_msgSend_hierarchicalRootRecordID(self, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend_copyWithAnonymousCKUserID_(v42, v43, (uint64_t)v4, v44);
  objc_msgSend_setHierarchicalRootRecordID_(self, v46, (uint64_t)v45, v47);

  objc_msgSend_rootRecord(self, v48, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_rootRecord(self, v52, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v55, v56, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)objc_msgSend_copyWithAnonymousCKUserID_(v59, v60, (uint64_t)v4, v61);
  objc_msgSend_replaceRecordIDWith_(v51, v63, (uint64_t)v62, v64);

  v65 = (void *)objc_opt_new();
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  objc_msgSend_sharedItemHierarchyIDs(self, v66, v67, v68, 0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v70, (uint64_t)&v82, (uint64_t)v86, 16);
  if (v71)
  {
    v74 = v71;
    v75 = *(_QWORD *)v83;
    do
    {
      v76 = 0;
      do
      {
        if (*(_QWORD *)v83 != v75)
          objc_enumerationMutation(v69);
        v77 = (void *)objc_msgSend_copyWithAnonymousCKUserID_(*(void **)(*((_QWORD *)&v82 + 1) + 8 * v76), v72, (uint64_t)v4, v73);
        objc_msgSend_addObject_(v65, v78, (uint64_t)v77, v79);

        ++v76;
      }
      while (v74 != v76);
      v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v72, (uint64_t)&v82, (uint64_t)v86, 16);
    }
    while (v74);
  }

  objc_msgSend_setSharedItemHierarchyIDs_(self, v80, (uint64_t)v65, v81);
}

- (BOOL)isCallingParticipantUsingOTL
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  char v28;

  objc_msgSend_callingParticipant(self, a2, v2, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend_share(self, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_oneTimeURLMetadatasByParticipantID(v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allKeys(v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_callingParticipant(self, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_participantID(v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend_containsObject_(v17, v26, (uint64_t)v25, v27);

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (NSURL)invitationURL
{
  uint64_t v2;
  uint64_t v3;
  int isCallingParticipantUsingOTL;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;

  isCallingParticipantUsingOTL = objc_msgSend_isCallingParticipantUsingOTL(self, a2, v2, v3);
  objc_msgSend_share(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9;
  if (isCallingParticipantUsingOTL)
  {
    objc_msgSend_callingParticipant(self, v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_participantID(v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_oneTimeURLForParticipantID_(v13, v19, (uint64_t)v18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_URL(v9, v10, v11, v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSURL *)v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *inited;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;

  v4 = objc_alloc((Class)objc_opt_class());
  inited = (_QWORD *)objc_msgSend_initInternal(v4, v5, v6, v7);
  objc_msgSend_containerID(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_copy(v12, v13, v14, v15);
  v17 = (void *)inited[9];
  inited[9] = v16;

  objc_msgSend_share(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_copy(v21, v22, v23, v24);
  v26 = (void *)inited[2];
  inited[2] = v25;

  objc_msgSend_rootRecord(self, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend_copy(v30, v31, v32, v33);
  v35 = (void *)inited[8];
  inited[8] = v34;

  objc_msgSend_hierarchicalRootRecordID(self, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend_copy(v39, v40, v41, v42);
  v44 = (void *)inited[3];
  inited[3] = v43;

  objc_msgSend_rootRecordType(self, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend_copy(v48, v49, v50, v51);
  v53 = (void *)inited[12];
  inited[12] = v52;

  objc_msgSend_sharedItemHierarchyIDs(self, v54, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKDeepCopy(v57, v58, v59, v60);
  v61 = objc_claimAutoreleasedReturnValue();
  v62 = (void *)inited[11];
  inited[11] = v61;

  objc_msgSend_callingParticipant(self, v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend_copy(v66, v67, v68, v69);
  v71 = (void *)inited[10];
  inited[10] = v70;

  inited[4] = objc_msgSend_participantRole(self, v72, v73, v74);
  inited[5] = objc_msgSend_participantStatus(self, v75, v76, v77);
  inited[6] = objc_msgSend_participantPermission(self, v78, v79, v80);
  objc_msgSend_ownerIdentity(self, v81, v82, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend_copy(v84, v85, v86, v87);
  v89 = (void *)inited[7];
  inited[7] = v88;

  objc_msgSend_protectedFullToken(self, v90, v91, v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = objc_msgSend_copy(v93, v94, v95, v96);
  v98 = (void *)inited[15];
  inited[15] = v97;

  objc_msgSend_publicToken(self, v99, v100, v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = objc_msgSend_copy(v102, v103, v104, v105);
  v107 = (void *)inited[16];
  inited[16] = v106;

  objc_msgSend_privateToken(self, v108, v109, v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = objc_msgSend_copy(v111, v112, v113, v114);
  v116 = (void *)inited[17];
  inited[17] = v115;

  objc_msgSend_outOfNetworkMatches(self, v117, v118, v119);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = objc_msgSend_copy(v120, v121, v122, v123);
  v125 = (void *)inited[19];
  inited[19] = v124;

  objc_msgSend_encryptedData(self, v126, v127, v128);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = objc_msgSend_copy(v129, v130, v131, v132);
  v134 = (void *)inited[20];
  inited[20] = v133;

  objc_msgSend_invitationToken(self, v135, v136, v137);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = objc_msgSend_copy(v138, v139, v140, v141);
  v143 = (void *)inited[13];
  inited[13] = v142;

  objc_msgSend_sharedZone(self, v144, v145, v146);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = objc_msgSend_copy(v147, v148, v149, v150);
  v152 = (void *)inited[18];
  inited[18] = v151;

  objc_msgSend_selectedAccountID(self, v153, v154, v155);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v160 = objc_msgSend_copy(v156, v157, v158, v159);
  v161 = (void *)inited[14];
  inited[14] = v160;

  return inited;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  id v95;

  v95 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_containerID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v95, v9, (uint64_t)v8, (uint64_t)CFSTR("ContainerID"));

  objc_msgSend_share(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v95, v14, (uint64_t)v13, (uint64_t)CFSTR("Share"));

  objc_msgSend_rootRecord(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v95, v19, (uint64_t)v18, (uint64_t)CFSTR("RootRecord"));

  objc_msgSend_hierarchicalRootRecordID(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v95, v24, (uint64_t)v23, (uint64_t)CFSTR("RootRecordID"));

  objc_msgSend_rootRecordType(self, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v95, v29, (uint64_t)v28, (uint64_t)CFSTR("RootRecordType"));

  objc_msgSend_sharedItemHierarchyIDs(self, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v95, v34, (uint64_t)v33, (uint64_t)CFSTR("SharedItemHierarchyIDs"));

  objc_msgSend_callingParticipant(self, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v95, v39, (uint64_t)v38, (uint64_t)CFSTR("CallingParticipant"));

  v43 = objc_msgSend_participantRole(self, v40, v41, v42);
  objc_msgSend_encodeInteger_forKey_(v95, v44, v43, (uint64_t)CFSTR("ParticipantType"));
  v48 = objc_msgSend_participantStatus(self, v45, v46, v47);
  objc_msgSend_encodeInteger_forKey_(v95, v49, v48, (uint64_t)CFSTR("ParticipantStatus"));
  v53 = objc_msgSend_participantPermission(self, v50, v51, v52);
  objc_msgSend_encodeInteger_forKey_(v95, v54, v53, (uint64_t)CFSTR("ParticipantPermission"));
  objc_msgSend_ownerIdentity(self, v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v95, v59, (uint64_t)v58, (uint64_t)CFSTR("OwnerIdentity"));

  objc_msgSend_protectedFullToken(self, v60, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v95, v64, (uint64_t)v63, (uint64_t)CFSTR("ProtectedFullToken"));

  objc_msgSend_publicToken(self, v65, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v95, v69, (uint64_t)v68, (uint64_t)CFSTR("PublicToken"));

  objc_msgSend_privateToken(self, v70, v71, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v95, v74, (uint64_t)v73, (uint64_t)CFSTR("PrivateToken"));

  objc_msgSend_outOfNetworkMatches(self, v75, v76, v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v95, v79, (uint64_t)v78, (uint64_t)CFSTR("OutOfNetworkMatches"));

  objc_msgSend_encryptedData(self, v80, v81, v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v95, v84, (uint64_t)v83, (uint64_t)CFSTR("EncryptedData"));

  objc_msgSend_invitationToken(self, v85, v86, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v95, v89, (uint64_t)v88, (uint64_t)CFSTR("InvitationToken"));

  objc_msgSend_selectedAccountID(self, v90, v91, v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v95, v94, (uint64_t)v93, (uint64_t)CFSTR("SelectedAccountID"));

  objc_autoreleasePoolPop(v4);
}

- (CKShareMetadata)initWithCoder:(id)a3
{
  id v4;
  CKShareMetadata *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  CKContainerID *containerID;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  CKShare *share;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  CKRecord *rootRecord;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  CKRecordID *hierarchicalRootRecordID;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  NSString *rootRecordType;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  NSArray *sharedItemHierarchyIDs;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  CKShareParticipant *callingParticipant;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  CKUserIdentity *ownerIdentity;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  NSData *protectedFullToken;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  NSData *publicToken;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  NSData *privateToken;
  void *v63;
  const char *v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  NSArray *outOfNetworkMatches;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  NSData *encryptedData;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  CKDeviceToDeviceShareInvitationToken *invitationToken;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  NSString *selectedAccountID;
  objc_super v85;
  _QWORD v86[4];

  v86[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v85.receiver = self;
  v85.super_class = (Class)CKShareMetadata;
  v5 = -[CKShareMetadata init](&v85, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, (uint64_t)CFSTR("ContainerID"));
    v9 = objc_claimAutoreleasedReturnValue();
    containerID = v5->_containerID;
    v5->_containerID = (CKContainerID *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("Share"));
    v13 = objc_claimAutoreleasedReturnValue();
    share = v5->_share;
    v5->_share = (CKShare *)v13;

    v15 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, (uint64_t)CFSTR("RootRecord"));
    v17 = objc_claimAutoreleasedReturnValue();
    rootRecord = v5->_rootRecord;
    v5->_rootRecord = (CKRecord *)v17;

    v19 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, (uint64_t)CFSTR("RootRecordID"));
    v21 = objc_claimAutoreleasedReturnValue();
    hierarchicalRootRecordID = v5->_hierarchicalRootRecordID;
    v5->_hierarchicalRootRecordID = (CKRecordID *)v21;

    v23 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, (uint64_t)CFSTR("RootRecordType"));
    v25 = objc_claimAutoreleasedReturnValue();
    rootRecordType = v5->_rootRecordType;
    v5->_rootRecordType = (NSString *)v25;

    v27 = (void *)MEMORY[0x1E0C99E60];
    v28 = objc_opt_class();
    v29 = objc_opt_class();
    v30 = objc_opt_class();
    objc_msgSend_setWithObjects_(v27, v31, v28, v32, v29, v30, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v34, (uint64_t)v33, (uint64_t)CFSTR("SharedItemHierarchyIDs"));
    v35 = objc_claimAutoreleasedReturnValue();
    sharedItemHierarchyIDs = v5->_sharedItemHierarchyIDs;
    v5->_sharedItemHierarchyIDs = (NSArray *)v35;

    v37 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v38, v37, (uint64_t)CFSTR("CallingParticipant"));
    v39 = objc_claimAutoreleasedReturnValue();
    callingParticipant = v5->_callingParticipant;
    v5->_callingParticipant = (CKShareParticipant *)v39;

    v5->_participantRole = objc_msgSend_decodeIntegerForKey_(v4, v41, (uint64_t)CFSTR("ParticipantType"), v42);
    v5->_participantStatus = objc_msgSend_decodeIntegerForKey_(v4, v43, (uint64_t)CFSTR("ParticipantStatus"), v44);
    v5->_participantPermission = objc_msgSend_decodeIntegerForKey_(v4, v45, (uint64_t)CFSTR("ParticipantPermission"), v46);
    v47 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v48, v47, (uint64_t)CFSTR("OwnerIdentity"));
    v49 = objc_claimAutoreleasedReturnValue();
    ownerIdentity = v5->_ownerIdentity;
    v5->_ownerIdentity = (CKUserIdentity *)v49;

    v51 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v52, v51, (uint64_t)CFSTR("ProtectedFullToken"));
    v53 = objc_claimAutoreleasedReturnValue();
    protectedFullToken = v5->_protectedFullToken;
    v5->_protectedFullToken = (NSData *)v53;

    v55 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v56, v55, (uint64_t)CFSTR("PublicToken"));
    v57 = objc_claimAutoreleasedReturnValue();
    publicToken = v5->_publicToken;
    v5->_publicToken = (NSData *)v57;

    v59 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v60, v59, (uint64_t)CFSTR("PrivateToken"));
    v61 = objc_claimAutoreleasedReturnValue();
    privateToken = v5->_privateToken;
    v5->_privateToken = (NSData *)v61;

    v63 = (void *)MEMORY[0x1E0C99E60];
    v86[0] = objc_opt_class();
    v86[1] = objc_opt_class();
    v86[2] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v64, (uint64_t)v86, 3);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v63, v66, (uint64_t)v65, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v69, (uint64_t)v68, (uint64_t)CFSTR("OutOfNetworkMatches"));
    v70 = objc_claimAutoreleasedReturnValue();
    outOfNetworkMatches = v5->_outOfNetworkMatches;
    v5->_outOfNetworkMatches = (NSArray *)v70;

    v72 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v73, v72, (uint64_t)CFSTR("EncryptedData"));
    v74 = objc_claimAutoreleasedReturnValue();
    encryptedData = v5->_encryptedData;
    v5->_encryptedData = (NSData *)v74;

    v5->_acceptedInProcess = 1;
    v76 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v77, v76, (uint64_t)CFSTR("InvitationToken"));
    v78 = objc_claimAutoreleasedReturnValue();
    invitationToken = v5->_invitationToken;
    v5->_invitationToken = (CKDeviceToDeviceShareInvitationToken *)v78;

    v80 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v81, v80, (uint64_t)CFSTR("SelectedAccountID"));
    v82 = objc_claimAutoreleasedReturnValue();
    selectedAccountID = v5->_selectedAccountID;
    v5->_selectedAccountID = (NSString *)v82;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
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
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;

  objc_msgSend_share(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  objc_msgSend_containerID(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;
  objc_msgSend_ownerIdentity(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v17 ^ objc_msgSend_hash(v21, v22, v23, v24);

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  CKShareMetadata *v4;
  CKShareMetadata *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  int v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  int v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  int v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  int v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  int v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  int v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  int v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  int v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  int v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  int v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  int v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  char v152;

  v4 = (CKShareMetadata *)a3;
  if (self == v4)
  {
    v152 = 1;
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
      v14 = CKObjectsAreBothNilOrEqual(v9, v13);

      if (!v14)
        goto LABEL_22;
      objc_msgSend_share(self, v15, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_share(v5, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CKObjectsAreBothNilOrEqual(v18, v22);

      if (!v23)
        goto LABEL_22;
      objc_msgSend_rootRecord(self, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_rootRecord(v5, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CKObjectsAreBothNilOrEqual(v27, v31);

      if (!v32)
        goto LABEL_22;
      objc_msgSend_hierarchicalRootRecordID(self, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_hierarchicalRootRecordID(v5, v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = CKObjectsAreBothNilOrEqual(v36, v40);

      if (!v41)
        goto LABEL_22;
      objc_msgSend_rootRecordType(self, v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_rootRecordType(v5, v46, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = CKObjectsAreBothNilOrEqual(v45, v49);

      if (!v50)
        goto LABEL_22;
      objc_msgSend_callingParticipant(self, v51, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_callingParticipant(v5, v55, v56, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = CKObjectsAreBothNilOrEqual(v54, v58);

      if (!v59)
        goto LABEL_22;
      v63 = objc_msgSend_participantRole(self, v60, v61, v62);
      if (v63 != objc_msgSend_participantRole(v5, v64, v65, v66))
        goto LABEL_22;
      v70 = objc_msgSend_participantStatus(self, v67, v68, v69);
      if (v70 != objc_msgSend_participantStatus(v5, v71, v72, v73))
        goto LABEL_22;
      v77 = objc_msgSend_participantPermission(self, v74, v75, v76);
      if (v77 != objc_msgSend_participantPermission(v5, v78, v79, v80))
        goto LABEL_22;
      objc_msgSend_ownerIdentity(self, v81, v82, v83);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ownerIdentity(v5, v85, v86, v87);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = CKObjectsAreBothNilOrEqual(v84, v88);

      if (!v89)
        goto LABEL_22;
      objc_msgSend_protectedFullToken(self, v90, v91, v92);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_protectedFullToken(v5, v94, v95, v96);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = CKObjectsAreBothNilOrEqual(v93, v97);

      if (!v98)
        goto LABEL_22;
      objc_msgSend_publicToken(self, v99, v100, v101);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_publicToken(v5, v103, v104, v105);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v107 = CKObjectsAreBothNilOrEqual(v102, v106);

      if (!v107)
        goto LABEL_22;
      objc_msgSend_privateToken(self, v108, v109, v110);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_privateToken(v5, v112, v113, v114);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v116 = CKObjectsAreBothNilOrEqual(v111, v115);

      if (!v116)
        goto LABEL_22;
      objc_msgSend_outOfNetworkMatches(self, v117, v118, v119);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_outOfNetworkMatches(v5, v121, v122, v123);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = CKObjectsAreBothNilOrEqual(v120, v124);

      if (!v125)
        goto LABEL_22;
      objc_msgSend_encryptedData(self, v126, v127, v128);
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encryptedData(v5, v130, v131, v132);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      v134 = CKObjectsAreBothNilOrEqual(v129, v133);

      if (!v134)
        goto LABEL_22;
      objc_msgSend_invitationToken(self, v135, v136, v137);
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_invitationToken(v5, v139, v140, v141);
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      v143 = CKObjectsAreBothNilOrEqual(v138, v142);

      if (v143)
      {
        objc_msgSend_selectedAccountID(self, v144, v145, v146);
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_selectedAccountID(v5, v148, v149, v150);
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        v152 = CKObjectsAreBothNilOrEqual(v147, v151);

      }
      else
      {
LABEL_22:
        v152 = 0;
      }

    }
    else
    {
      v152 = 0;
    }
  }

  return v152;
}

- (void)setContainerID_modelMutation:(id)a3
{
  uint64_t v3;
  CKContainerID *v5;
  CKContainerID *containerID;

  v5 = (CKContainerID *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  containerID = self->_containerID;
  self->_containerID = v5;

}

- (CKShare)share
{
  return (CKShare *)objc_getProperty(self, a2, 16, 1);
}

- (void)setShare:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (CKRecordID)hierarchicalRootRecordID
{
  return (CKRecordID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHierarchicalRootRecordID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (CKShareParticipantRole)participantRole
{
  return self->_participantRole;
}

- (void)setParticipantRole:(int64_t)a3
{
  self->_participantRole = a3;
}

- (CKShareParticipantAcceptanceStatus)participantStatus
{
  return self->_participantStatus;
}

- (void)setParticipantStatus:(int64_t)a3
{
  self->_participantStatus = a3;
}

- (CKShareParticipantPermission)participantPermission
{
  return self->_participantPermission;
}

- (void)setParticipantPermission:(int64_t)a3
{
  self->_participantPermission = a3;
}

- (CKUserIdentity)ownerIdentity
{
  return (CKUserIdentity *)objc_getProperty(self, a2, 56, 1);
}

- (void)setOwnerIdentity:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (CKRecord)rootRecord
{
  return (CKRecord *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRootRecord:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (CKContainerID)containerID
{
  return (CKContainerID *)objc_getProperty(self, a2, 72, 1);
}

- (CKShareParticipant)callingParticipant
{
  return self->_callingParticipant;
}

- (void)setCallingParticipant:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)sharedItemHierarchyIDs
{
  return self->_sharedItemHierarchyIDs;
}

- (void)setSharedItemHierarchyIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)rootRecordType
{
  return self->_rootRecordType;
}

- (void)setRootRecordType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (CKDeviceToDeviceShareInvitationToken)invitationToken
{
  return (CKDeviceToDeviceShareInvitationToken *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInvitationToken:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (NSString)selectedAccountID
{
  return self->_selectedAccountID;
}

- (void)setSelectedAccountID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSData)protectedFullToken
{
  return self->_protectedFullToken;
}

- (void)setProtectedFullToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSData)publicToken
{
  return (NSData *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPublicToken:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (NSData)privateToken
{
  return (NSData *)objc_getProperty(self, a2, 136, 1);
}

- (void)setPrivateToken:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (CKRecordZone)sharedZone
{
  return self->_sharedZone;
}

- (void)setSharedZone:(id)a3
{
  objc_storeStrong((id *)&self->_sharedZone, a3);
}

- (NSArray)outOfNetworkMatches
{
  return self->_outOfNetworkMatches;
}

- (void)setOutOfNetworkMatches:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (BOOL)acceptedInProcess
{
  return self->_acceptedInProcess;
}

- (void)setAcceptedInProcess:(BOOL)a3
{
  self->_acceptedInProcess = a3;
}

- (NSData)encryptedData
{
  return (NSData *)objc_getProperty(self, a2, 160, 1);
}

- (void)setEncryptedData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedData, 0);
  objc_storeStrong((id *)&self->_outOfNetworkMatches, 0);
  objc_storeStrong((id *)&self->_sharedZone, 0);
  objc_storeStrong((id *)&self->_privateToken, 0);
  objc_storeStrong((id *)&self->_publicToken, 0);
  objc_storeStrong((id *)&self->_protectedFullToken, 0);
  objc_storeStrong((id *)&self->_selectedAccountID, 0);
  objc_storeStrong((id *)&self->_invitationToken, 0);
  objc_storeStrong((id *)&self->_rootRecordType, 0);
  objc_storeStrong((id *)&self->_sharedItemHierarchyIDs, 0);
  objc_storeStrong((id *)&self->_callingParticipant, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_rootRecord, 0);
  objc_storeStrong((id *)&self->_ownerIdentity, 0);
  objc_storeStrong((id *)&self->_hierarchicalRootRecordID, 0);
  objc_storeStrong((id *)&self->_share, 0);
}

@end
