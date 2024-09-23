@implementation CKEncryptedReference

- (CKEncryptedReference)initWithReference:(id)a3
{
  id v4;
  char v5;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  CKEncryptedReference *v17;
  void *v19;
  CKException *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  id v30;
  objc_super v31;
  id v32;

  v4 = a3;
  v32 = 0;
  v5 = _CKCheckArgument((uint64_t)"reference", v4, 0, 0, 0, &v32);
  v6 = v32;
  if ((v5 & 1) == 0)
  {
    v19 = v6;
    v20 = [CKException alloc];
    v24 = objc_msgSend_code(v19, v21, v22, v23);
    objc_msgSend_localizedDescription(v19, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (id)objc_msgSend_initWithCode_format_(v20, v29, v24, (uint64_t)CFSTR("%@"), v28);

    objc_exception_throw(v30);
  }

  v7 = (void *)objc_opt_new();
  objc_msgSend__pReferenceFromReference_(self, v8, (uint64_t)v4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setReferenceValue_(v7, v11, (uint64_t)v10, v12);

  objc_msgSend_data(v7, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31.receiver = self;
  v31.super_class = (Class)CKEncryptedReference;
  v17 = -[CKEncryptedData initWithData:](&v31, sel_initWithData_, v16);

  return v17;
}

- (CKReference)reference
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  CKDPRecordFieldValueEncryptedValue *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;

  objc_msgSend_data(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = [CKDPRecordFieldValueEncryptedValue alloc];
    v9 = (void *)objc_msgSend_initWithData_(v6, v7, (uint64_t)v5, v8);
    objc_msgSend_referenceValue(v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__referenceFromPReference_(self, v14, (uint64_t)v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return (CKReference *)v16;
}

- (id)value
{
  return (id)((uint64_t (*)(CKEncryptedReference *, char *))MEMORY[0x1E0DE7D20])(self, sel_reference);
}

- (id)_pReferenceFromReference:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
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
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend_recordID(v3, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_opt_new();
  objc_msgSend_zoneName(v12, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKDPIdentifier_Zone(v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_(v13, v22, (uint64_t)v21, v23);

  objc_msgSend_ownerName(v12, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKDPIdentifier_User(v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOwnerIdentifier_(v13, v32, (uint64_t)v31, v33);

  v34 = (void *)objc_opt_new();
  objc_msgSend_recordID(v3, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordName(v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKDPIdentifier_Record(v42, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_(v34, v47, (uint64_t)v46, v48);

  objc_msgSend_setZoneIdentifier_(v34, v49, (uint64_t)v13, v50);
  objc_msgSend_setRecordIdentifier_(v4, v51, (uint64_t)v34, v52);
  v56 = objc_msgSend_referenceAction(v3, v53, v54, v55);

  v59 = objc_msgSend_ckdpReferenceTypeForCKReferenceAction_(CKReference, v57, v56, v58);
  objc_msgSend_setType_(v4, v60, v59, v61);

  return v4;
}

- (id)_referenceFromPReference:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  CKReference *v24;
  const char *v25;
  int v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_recordIdentifier(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__recordIDFromPRecordIdentifier_(self, v9, (uint64_t)v8, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (objc_msgSend_hasType(v4, v11, v12, v13))
    {
      v18 = objc_msgSend_type(v4, v15, v16, v17);
      v21 = objc_msgSend_ckReferenceActionForCKDPRecordReferenceType_(CKReference, v19, v18, v20);
    }
    else
    {
      v21 = 0;
    }
    v24 = [CKReference alloc];
    v23 = (void *)objc_msgSend_initWithRecordID_action_(v24, v25, (uint64_t)v14, v21);
  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v22 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      v27 = 138412290;
      v28 = v4;
      _os_log_error_impl(&dword_18A5C5000, v22, OS_LOG_TYPE_ERROR, "Invalid record identifier from server %@", (uint8_t *)&v27, 0xCu);
    }
    v23 = 0;
  }

  return v23;
}

- (id)_recordIDFromPRecordIdentifier:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  CKRecordZoneID *v8;
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
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  CKRecordID *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v37;

  v3 = a3;
  objc_msgSend_zoneIdentifier(v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [CKRecordZoneID alloc];
  objc_msgSend_value(v7, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ownerIdentifier(v7, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend_initWithZoneName_ownerName_(v8, v25, (uint64_t)v16, (uint64_t)v24);

  v27 = [CKRecordID alloc];
  objc_msgSend_value(v3, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_name(v31, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend_initWithRecordName_zoneID_(v27, v36, (uint64_t)v35, (uint64_t)v26);

  return v37;
}

@end
