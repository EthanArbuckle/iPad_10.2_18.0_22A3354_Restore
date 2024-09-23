@implementation CKTestRequestProperties

- (CKTestRequestProperties)initWithEquivalencyProperties:(id)a3
{
  id v5;
  CKTestRequestProperties *v6;
  CKTestRequestProperties *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKTestRequestProperties;
  v6 = -[CKTestRequestProperties init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_equivalencyProperties, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  CKRoughlyEquivalentProperties *equivalencyProperties;
  id v5;
  void *v6;
  const char *v7;
  NSArray *modifyRecordIDs;
  void *v9;
  const char *v10;
  NSArray *deleteRecordIDs;
  void *v12;
  const char *v13;
  NSArray *fetchRecordIDs;
  void *v15;
  const char *v16;
  NSArray *modifyRecordZoneIDs;
  void *v18;
  const char *v19;
  NSArray *deleteRecordZoneIDs;
  void *v21;
  const char *v22;
  NSArray *fetchRecordZoneIDs;
  void *v24;
  const char *v25;
  NSArray *modifyMergeableValueIDs;
  void *v27;
  const char *v28;
  NSArray *deleteMergeableValueIDs;
  void *v30;
  const char *v31;
  NSArray *fetchMergeableValueIDs;
  void *v33;
  const char *v34;
  NSArray *modifySubscriptionRecordZoneIDs;
  void *v36;
  const char *v37;
  int64_t databaseScope;
  const char *v39;
  id v40;

  equivalencyProperties = self->_equivalencyProperties;
  v5 = a3;
  NSStringFromSelector(sel_equivalencyProperties);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)equivalencyProperties, (uint64_t)v6);

  modifyRecordIDs = self->_modifyRecordIDs;
  NSStringFromSelector(sel_modifyRecordIDs);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v10, (uint64_t)modifyRecordIDs, (uint64_t)v9);

  deleteRecordIDs = self->_deleteRecordIDs;
  NSStringFromSelector(sel_deleteRecordIDs);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v13, (uint64_t)deleteRecordIDs, (uint64_t)v12);

  fetchRecordIDs = self->_fetchRecordIDs;
  NSStringFromSelector(sel_fetchRecordIDs);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v16, (uint64_t)fetchRecordIDs, (uint64_t)v15);

  modifyRecordZoneIDs = self->_modifyRecordZoneIDs;
  NSStringFromSelector(sel_modifyRecordZoneIDs);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v19, (uint64_t)modifyRecordZoneIDs, (uint64_t)v18);

  deleteRecordZoneIDs = self->_deleteRecordZoneIDs;
  NSStringFromSelector(sel_deleteRecordZoneIDs);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v22, (uint64_t)deleteRecordZoneIDs, (uint64_t)v21);

  fetchRecordZoneIDs = self->_fetchRecordZoneIDs;
  NSStringFromSelector(sel_fetchRecordZoneIDs);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v25, (uint64_t)fetchRecordZoneIDs, (uint64_t)v24);

  modifyMergeableValueIDs = self->_modifyMergeableValueIDs;
  NSStringFromSelector(sel_modifyMergeableValueIDs);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v28, (uint64_t)modifyMergeableValueIDs, (uint64_t)v27);

  deleteMergeableValueIDs = self->_deleteMergeableValueIDs;
  NSStringFromSelector(sel_deleteMergeableValueIDs);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v31, (uint64_t)deleteMergeableValueIDs, (uint64_t)v30);

  fetchMergeableValueIDs = self->_fetchMergeableValueIDs;
  NSStringFromSelector(sel_fetchMergeableValueIDs);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v34, (uint64_t)fetchMergeableValueIDs, (uint64_t)v33);

  modifySubscriptionRecordZoneIDs = self->_modifySubscriptionRecordZoneIDs;
  NSStringFromSelector(sel_modifySubscriptionRecordZoneIDs);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v37, (uint64_t)modifySubscriptionRecordZoneIDs, (uint64_t)v36);

  databaseScope = self->_databaseScope;
  NSStringFromSelector(sel_databaseScope);
  v40 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeInteger_forKey_(v5, v39, databaseScope, (uint64_t)v40);

}

- (CKTestRequestProperties)initWithCoder:(id)a3
{
  id v4;
  CKTestRequestProperties *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  CKRoughlyEquivalentProperties *equivalencyProperties;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  NSArray *modifyRecordIDs;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  NSArray *deleteRecordIDs;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  NSArray *fetchRecordIDs;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  NSArray *modifyRecordZoneIDs;
  void *v51;
  const char *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  NSArray *deleteRecordZoneIDs;
  void *v61;
  const char *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  NSArray *fetchRecordZoneIDs;
  void *v71;
  const char *v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  NSArray *modifyMergeableValueIDs;
  void *v81;
  const char *v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  NSArray *deleteMergeableValueIDs;
  void *v91;
  const char *v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  NSArray *fetchMergeableValueIDs;
  void *v101;
  const char *v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  NSArray *modifySubscriptionRecordZoneIDs;
  void *v111;
  const char *v112;
  uint64_t v113;
  objc_super v115;
  _QWORD v116[2];
  _QWORD v117[2];
  _QWORD v118[2];
  _QWORD v119[2];
  _QWORD v120[2];
  _QWORD v121[2];
  _QWORD v122[2];
  _QWORD v123[2];
  _QWORD v124[2];
  _QWORD v125[3];

  v125[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v115.receiver = self;
  v115.super_class = (Class)CKTestRequestProperties;
  v5 = -[CKTestRequestProperties init](&v115, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_equivalencyProperties);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v6, (uint64_t)v7);
    v9 = objc_claimAutoreleasedReturnValue();
    equivalencyProperties = v5->_equivalencyProperties;
    v5->_equivalencyProperties = (CKRoughlyEquivalentProperties *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v125[0] = objc_opt_class();
    v125[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v12, (uint64_t)v125, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v11, v14, (uint64_t)v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_modifyRecordIDs);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v18, (uint64_t)v16, (uint64_t)v17);
    v19 = objc_claimAutoreleasedReturnValue();
    modifyRecordIDs = v5->_modifyRecordIDs;
    v5->_modifyRecordIDs = (NSArray *)v19;

    v21 = (void *)MEMORY[0x1E0C99E60];
    v124[0] = objc_opt_class();
    v124[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v22, (uint64_t)v124, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v21, v24, (uint64_t)v23, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_deleteRecordIDs);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v28, (uint64_t)v26, (uint64_t)v27);
    v29 = objc_claimAutoreleasedReturnValue();
    deleteRecordIDs = v5->_deleteRecordIDs;
    v5->_deleteRecordIDs = (NSArray *)v29;

    v31 = (void *)MEMORY[0x1E0C99E60];
    v123[0] = objc_opt_class();
    v123[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v32, (uint64_t)v123, 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v31, v34, (uint64_t)v33, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_fetchRecordIDs);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v38, (uint64_t)v36, (uint64_t)v37);
    v39 = objc_claimAutoreleasedReturnValue();
    fetchRecordIDs = v5->_fetchRecordIDs;
    v5->_fetchRecordIDs = (NSArray *)v39;

    v41 = (void *)MEMORY[0x1E0C99E60];
    v122[0] = objc_opt_class();
    v122[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v42, (uint64_t)v122, 2);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v41, v44, (uint64_t)v43, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_modifyRecordZoneIDs);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v48, (uint64_t)v46, (uint64_t)v47);
    v49 = objc_claimAutoreleasedReturnValue();
    modifyRecordZoneIDs = v5->_modifyRecordZoneIDs;
    v5->_modifyRecordZoneIDs = (NSArray *)v49;

    v51 = (void *)MEMORY[0x1E0C99E60];
    v121[0] = objc_opt_class();
    v121[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v52, (uint64_t)v121, 2);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v51, v54, (uint64_t)v53, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_deleteRecordZoneIDs);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v58, (uint64_t)v56, (uint64_t)v57);
    v59 = objc_claimAutoreleasedReturnValue();
    deleteRecordZoneIDs = v5->_deleteRecordZoneIDs;
    v5->_deleteRecordZoneIDs = (NSArray *)v59;

    v61 = (void *)MEMORY[0x1E0C99E60];
    v120[0] = objc_opt_class();
    v120[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v62, (uint64_t)v120, 2);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v61, v64, (uint64_t)v63, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_fetchRecordZoneIDs);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v68, (uint64_t)v66, (uint64_t)v67);
    v69 = objc_claimAutoreleasedReturnValue();
    fetchRecordZoneIDs = v5->_fetchRecordZoneIDs;
    v5->_fetchRecordZoneIDs = (NSArray *)v69;

    v71 = (void *)MEMORY[0x1E0C99E60];
    v119[0] = objc_opt_class();
    v119[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v72, (uint64_t)v119, 2);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v71, v74, (uint64_t)v73, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_modifyMergeableValueIDs);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v78, (uint64_t)v76, (uint64_t)v77);
    v79 = objc_claimAutoreleasedReturnValue();
    modifyMergeableValueIDs = v5->_modifyMergeableValueIDs;
    v5->_modifyMergeableValueIDs = (NSArray *)v79;

    v81 = (void *)MEMORY[0x1E0C99E60];
    v118[0] = objc_opt_class();
    v118[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v82, (uint64_t)v118, 2);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v81, v84, (uint64_t)v83, v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_deleteMergeableValueIDs);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v88, (uint64_t)v86, (uint64_t)v87);
    v89 = objc_claimAutoreleasedReturnValue();
    deleteMergeableValueIDs = v5->_deleteMergeableValueIDs;
    v5->_deleteMergeableValueIDs = (NSArray *)v89;

    v91 = (void *)MEMORY[0x1E0C99E60];
    v117[0] = objc_opt_class();
    v117[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v92, (uint64_t)v117, 2);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v91, v94, (uint64_t)v93, v95);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_fetchMergeableValueIDs);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v98, (uint64_t)v96, (uint64_t)v97);
    v99 = objc_claimAutoreleasedReturnValue();
    fetchMergeableValueIDs = v5->_fetchMergeableValueIDs;
    v5->_fetchMergeableValueIDs = (NSArray *)v99;

    v101 = (void *)MEMORY[0x1E0C99E60];
    v116[0] = objc_opt_class();
    v116[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v102, (uint64_t)v116, 2);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v101, v104, (uint64_t)v103, v105);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_modifySubscriptionRecordZoneIDs);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v108, (uint64_t)v106, (uint64_t)v107);
    v109 = objc_claimAutoreleasedReturnValue();
    modifySubscriptionRecordZoneIDs = v5->_modifySubscriptionRecordZoneIDs;
    v5->_modifySubscriptionRecordZoneIDs = (NSArray *)v109;

    NSStringFromSelector(sel_databaseScope);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_databaseScope = objc_msgSend_decodeIntegerForKey_(v4, v112, (uint64_t)v111, v113);

  }
  return v5;
}

- (NSArray)allRecordIDs
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  void *v55;

  v3 = (void *)objc_opt_new();
  objc_msgSend_modifyRecordIDs(self, v4, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v7;
  v11 = MEMORY[0x1E0C9AA60];
  if (v7)
    objc_msgSend_addObjectsFromArray_(v3, v8, v7, v9);
  else
    objc_msgSend_addObjectsFromArray_(v3, v8, MEMORY[0x1E0C9AA60], v9);

  objc_msgSend_deleteRecordIDs(self, v12, v13, v14);
  v15 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v15;
  if (v15)
    objc_msgSend_addObjectsFromArray_(v3, v16, v15, v17);
  else
    objc_msgSend_addObjectsFromArray_(v3, v16, v11, v17);

  objc_msgSend_fetchRecordIDs(self, v19, v20, v21);
  v22 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v22;
  if (v22)
    objc_msgSend_addObjectsFromArray_(v3, v23, v22, v24);
  else
    objc_msgSend_addObjectsFromArray_(v3, v23, v11, v24);

  objc_msgSend_modifyMergeableValueIDs(self, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKCompactMap_(v29, v30, (uint64_t)&unk_1E1F587B8, v31);
  v32 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)v32;
  if (v32)
    objc_msgSend_addObjectsFromArray_(v3, v33, v32, v34);
  else
    objc_msgSend_addObjectsFromArray_(v3, v33, v11, v34);

  objc_msgSend_deleteMergeableValueIDs(self, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKCompactMap_(v39, v40, (uint64_t)&unk_1E1F64C90, v41);
  v42 = objc_claimAutoreleasedReturnValue();
  v45 = (void *)v42;
  if (v42)
    objc_msgSend_addObjectsFromArray_(v3, v43, v42, v44);
  else
    objc_msgSend_addObjectsFromArray_(v3, v43, v11, v44);

  objc_msgSend_fetchMergeableValueIDs(self, v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKCompactMap_(v49, v50, (uint64_t)&unk_1E1F59038, v51);
  v52 = objc_claimAutoreleasedReturnValue();
  v55 = (void *)v52;
  if (v52)
    objc_msgSend_addObjectsFromArray_(v3, v53, v52, v54);
  else
    objc_msgSend_addObjectsFromArray_(v3, v53, v11, v54);

  return (NSArray *)v3;
}

- (NSArray)allRecordZoneIDs
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  void *v92;

  v3 = (void *)objc_opt_new();
  objc_msgSend_modifyRecordIDs(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKCompactMap_(v7, v8, (uint64_t)&unk_1E1F590D8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v10;
  v14 = MEMORY[0x1E0C9AA60];
  if (v10)
    objc_msgSend_addObjectsFromArray_(v3, v11, v10, v12);
  else
    objc_msgSend_addObjectsFromArray_(v3, v11, MEMORY[0x1E0C9AA60], v12);

  objc_msgSend_deleteRecordIDs(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKCompactMap_(v18, v19, (uint64_t)&unk_1E1F59158, v20);
  v21 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v21;
  if (v21)
    objc_msgSend_addObjectsFromArray_(v3, v22, v21, v23);
  else
    objc_msgSend_addObjectsFromArray_(v3, v22, v14, v23);

  objc_msgSend_fetchRecordIDs(self, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKCompactMap_(v28, v29, (uint64_t)&unk_1E1F59198, v30);
  v31 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v31;
  if (v31)
    objc_msgSend_addObjectsFromArray_(v3, v32, v31, v33);
  else
    objc_msgSend_addObjectsFromArray_(v3, v32, v14, v33);

  objc_msgSend_modifyRecordZoneIDs(self, v35, v36, v37);
  v38 = objc_claimAutoreleasedReturnValue();
  v41 = (void *)v38;
  if (v38)
    objc_msgSend_addObjectsFromArray_(v3, v39, v38, v40);
  else
    objc_msgSend_addObjectsFromArray_(v3, v39, v14, v40);

  objc_msgSend_deleteRecordZoneIDs(self, v42, v43, v44);
  v45 = objc_claimAutoreleasedReturnValue();
  v48 = (void *)v45;
  if (v45)
    objc_msgSend_addObjectsFromArray_(v3, v46, v45, v47);
  else
    objc_msgSend_addObjectsFromArray_(v3, v46, v14, v47);

  objc_msgSend_fetchRecordZoneIDs(self, v49, v50, v51);
  v52 = objc_claimAutoreleasedReturnValue();
  v55 = (void *)v52;
  if (v52)
    objc_msgSend_addObjectsFromArray_(v3, v53, v52, v54);
  else
    objc_msgSend_addObjectsFromArray_(v3, v53, v14, v54);

  objc_msgSend_modifyMergeableValueIDs(self, v56, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKCompactMap_(v59, v60, (uint64_t)&unk_1E1F59238, v61);
  v62 = objc_claimAutoreleasedReturnValue();
  v65 = (void *)v62;
  if (v62)
    objc_msgSend_addObjectsFromArray_(v3, v63, v62, v64);
  else
    objc_msgSend_addObjectsFromArray_(v3, v63, v14, v64);

  objc_msgSend_deleteMergeableValueIDs(self, v66, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKCompactMap_(v69, v70, (uint64_t)&unk_1E1F592D8, v71);
  v72 = objc_claimAutoreleasedReturnValue();
  v75 = (void *)v72;
  if (v72)
    objc_msgSend_addObjectsFromArray_(v3, v73, v72, v74);
  else
    objc_msgSend_addObjectsFromArray_(v3, v73, v14, v74);

  objc_msgSend_fetchMergeableValueIDs(self, v76, v77, v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKCompactMap_(v79, v80, (uint64_t)&unk_1E1F59338, v81);
  v82 = objc_claimAutoreleasedReturnValue();
  v85 = (void *)v82;
  if (v82)
    objc_msgSend_addObjectsFromArray_(v3, v83, v82, v84);
  else
    objc_msgSend_addObjectsFromArray_(v3, v83, v14, v84);

  objc_msgSend_modifySubscriptionRecordZoneIDs(self, v86, v87, v88);
  v89 = objc_claimAutoreleasedReturnValue();
  v92 = (void *)v89;
  if (v89)
    objc_msgSend_addObjectsFromArray_(v3, v90, v89, v91);
  else
    objc_msgSend_addObjectsFromArray_(v3, v90, v14, v91);

  return (NSArray *)v3;
}

- (CKRoughlyEquivalentProperties)equivalencyProperties
{
  return self->_equivalencyProperties;
}

- (NSArray)modifyRecordIDs
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setModifyRecordIDs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSArray)deleteRecordIDs
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDeleteRecordIDs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSArray)fetchRecordIDs
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFetchRecordIDs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSArray)modifyRecordZoneIDs
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setModifyRecordZoneIDs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSArray)deleteRecordZoneIDs
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDeleteRecordZoneIDs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSArray)fetchRecordZoneIDs
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFetchRecordZoneIDs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSArray)modifyMergeableValueIDs
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setModifyMergeableValueIDs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSArray)deleteMergeableValueIDs
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDeleteMergeableValueIDs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (NSArray)fetchMergeableValueIDs
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFetchMergeableValueIDs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (NSArray)modifySubscriptionRecordZoneIDs
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setModifySubscriptionRecordZoneIDs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (int64_t)databaseScope
{
  return self->_databaseScope;
}

- (void)setDatabaseScope:(int64_t)a3
{
  self->_databaseScope = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifySubscriptionRecordZoneIDs, 0);
  objc_storeStrong((id *)&self->_fetchMergeableValueIDs, 0);
  objc_storeStrong((id *)&self->_deleteMergeableValueIDs, 0);
  objc_storeStrong((id *)&self->_modifyMergeableValueIDs, 0);
  objc_storeStrong((id *)&self->_fetchRecordZoneIDs, 0);
  objc_storeStrong((id *)&self->_deleteRecordZoneIDs, 0);
  objc_storeStrong((id *)&self->_modifyRecordZoneIDs, 0);
  objc_storeStrong((id *)&self->_fetchRecordIDs, 0);
  objc_storeStrong((id *)&self->_deleteRecordIDs, 0);
  objc_storeStrong((id *)&self->_modifyRecordIDs, 0);
  objc_storeStrong((id *)&self->_equivalencyProperties, 0);
}

@end
