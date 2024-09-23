@implementation CKMergeableValueID

- (CKMergeableValueID)initWithName:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  CKMergeableValueID *v7;

  objc_msgSend_dataUsingEncoding_(a3, a2, 4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (CKMergeableValueID *)objc_msgSend_initWithData_zoneName_zoneOwner_(self, v6, (uint64_t)v5, 0, 0);

  return v7;
}

- (CKMergeableValueID)initWithData:(id)a3 zoneName:(id)a4 zoneOwner:(id)a5 recordName:(id)a6 recordFieldName:(id)a7 encrypted:(BOOL)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  CKMergeableValueID *v26;
  uint64_t v27;
  NSData *identifier;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSString *zoneName;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSString *zoneOwner;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSString *recordName;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSString *recordFieldName;
  void *v50;
  const char *v51;
  objc_super v52;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v22 = a7;
  if ((v18 != 0) != (v22 != 0))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v19, v20, v21);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v50, v51, (uint64_t)a2, (uint64_t)self, CFSTR("CKMergeableValueID.m"), 36, CFSTR("Record name and record field name must either both be nil, or both be present"));

  }
  v52.receiver = self;
  v52.super_class = (Class)CKMergeableValueID;
  v26 = -[CKMergeableValueID init](&v52, sel_init);
  if (v26)
  {
    v27 = objc_msgSend_copy(v15, v23, v24, v25);
    identifier = v26->_identifier;
    v26->_identifier = (NSData *)v27;

    v32 = objc_msgSend_copy(v16, v29, v30, v31);
    zoneName = v26->_zoneName;
    v26->_zoneName = (NSString *)v32;

    v37 = objc_msgSend_copy(v17, v34, v35, v36);
    zoneOwner = v26->_zoneOwner;
    v26->_zoneOwner = (NSString *)v37;

    v42 = objc_msgSend_copy(v18, v39, v40, v41);
    recordName = v26->_recordName;
    v26->_recordName = (NSString *)v42;

    v47 = objc_msgSend_copy(v22, v44, v45, v46);
    recordFieldName = v26->_recordFieldName;
    v26->_recordFieldName = (NSString *)v47;

    v26->_encrypted = a8;
  }

  return v26;
}

- (CKMergeableValueID)initWithData:(id)a3 zoneName:(id)a4 zoneOwner:(id)a5
{
  return (CKMergeableValueID *)objc_msgSend_initWithData_zoneName_zoneOwner_recordName_recordFieldName_encrypted_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, 0, 0, 0);
}

- (CKMergeableValueID)initWithName:(id)a3 zoneID:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
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
  CKMergeableValueID *v24;

  v6 = a3;
  v7 = a4;
  objc_msgSend_anonymousCKUserID(v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v12, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Anonymous user ID not currently supported"));
  objc_msgSend_dataUsingEncoding_(v6, v12, 4, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneName(v7, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ownerName(v7, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (CKMergeableValueID *)objc_msgSend_initWithData_zoneName_zoneOwner_(self, v23, (uint64_t)v14, (uint64_t)v18, v22);
  return v24;
}

- (CKMergeableValueID)initWithName:(id)a3 recordID:(id)a4 key:(id)a5 encrypted:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
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
  CKMergeableValueID *v44;
  _BOOL4 v46;

  v46 = a6;
  v9 = a3;
  v10 = a5;
  v11 = a4;
  objc_msgSend_zoneID(v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_anonymousCKUserID(v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v20, *MEMORY[0x1E0C99778], (uint64_t)CFSTR("Anonymous user ID not currently supported"));
  objc_msgSend_dataUsingEncoding_(v9, v20, 4, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v11, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneName(v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v11, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ownerName(v34, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordName(v11, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = (CKMergeableValueID *)objc_msgSend_initWithData_zoneName_zoneOwner_recordName_recordFieldName_encrypted_(self, v43, (uint64_t)v22, (uint64_t)v30, v38, v42, v10, v46);
  return v44;
}

- (id)name
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend_identifier(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend_initWithData_encoding_(v3, v8, (uint64_t)v7, 4);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  CKMergeableValueID *v7;
  CKMergeableValueID *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  int v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  int isEncrypted;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  BOOL v90;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;

  v7 = (CKMergeableValueID *)a3;
  if (v7 == self)
  {
    LOBYTE(v25) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      objc_msgSend_identifier(self, v9, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(v8, v13, v14, v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 != v19)
      {
        objc_msgSend_identifier(self, v16, v17, v18);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(v8, v20, v21, v22);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend_isEqual_(v3, v23, (uint64_t)v5, v24))
        {
          LOBYTE(v25) = 0;
          goto LABEL_38;
        }
      }
      objc_msgSend_zoneName(self, v16, v17, v18);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneName(v8, v27, v28, v29);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26 == v33)
      {
        v102 = v26;
      }
      else
      {
        objc_msgSend_zoneName(self, v30, v31, v32);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_zoneName(v8, v34, v35, v36);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend_isEqual_(v4, v37, (uint64_t)v106, v38))
        {
          LOBYTE(v25) = 0;
LABEL_36:

LABEL_37:
          if (v12 == v19)
          {
LABEL_39:

            goto LABEL_40;
          }
LABEL_38:

          goto LABEL_39;
        }
        v102 = v26;
      }
      objc_msgSend_zoneOwner(self, v30, v31, v32);
      v39 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneOwner(v8, v40, v41, v42);
      v104 = objc_claimAutoreleasedReturnValue();
      v105 = (void *)v39;
      v103 = v12;
      if (v39 == v104)
      {
        v99 = v4;
      }
      else
      {
        objc_msgSend_zoneOwner(self, v43, v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_zoneOwner(v8, v47, v48, v49);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = v46;
        if (!objc_msgSend_isEqual_(v46, v50, (uint64_t)v100, v51))
        {
          v68 = v3;
          v69 = v33;
          LOBYTE(v25) = 0;
          v70 = (void *)v104;
          v71 = v105;
LABEL_34:

LABEL_35:
          v26 = v102;
          v33 = v69;
          v90 = v102 == v69;
          v3 = v68;
          v12 = v103;
          if (v90)
            goto LABEL_37;
          goto LABEL_36;
        }
        v99 = v4;
      }
      objc_msgSend_recordName(self, v43, v44, v45);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordName(v8, v53, v54, v55);
      v56 = objc_claimAutoreleasedReturnValue();
      v60 = (void *)v56;
      if (v52 == (void *)v56)
      {
        v97 = v5;
        v98 = v3;
      }
      else
      {
        v94 = (void *)v56;
        v61 = v52;
        objc_msgSend_recordName(self, v57, v58, v59);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordName(v8, v63, v64, v65);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = v62;
        if (!objc_msgSend_isEqual_(v62, v66, (uint64_t)v95, v67))
        {
          LOBYTE(v25) = 0;
          v52 = v61;
          v60 = v94;
          goto LABEL_31;
        }
        v97 = v5;
        v98 = v3;
        v52 = v61;
        v60 = v94;
      }
      objc_msgSend_recordFieldName(self, v57, v58, v59);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordFieldName(v8, v73, v74, v75);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      if (v72 != v79)
      {
        v92 = v72;
        objc_msgSend_recordFieldName(self, v76, v77, v78);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordFieldName(v8, v81, v82, v83);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = v80;
        if (!objc_msgSend_isEqual_(v80, v84, (uint64_t)v93, v85))
        {
          LOBYTE(v25) = 0;
          v72 = v92;
          goto LABEL_29;
        }
        v72 = v92;
      }
      isEncrypted = objc_msgSend_isEncrypted(self, v76, v77, v78);
      v25 = isEncrypted ^ objc_msgSend_isEncrypted(v8, v87, v88, v89) ^ 1;
      if (v72 == v79)
      {

        goto LABEL_30;
      }
LABEL_29:

LABEL_30:
      v5 = v97;
      v3 = v98;
      if (v52 == v60)
      {
        v68 = v98;
        v69 = v33;
LABEL_33:

        v71 = v105;
        v70 = (void *)v104;
        v4 = v99;
        if (v105 == (void *)v104)
          goto LABEL_35;
        goto LABEL_34;
      }
LABEL_31:
      v68 = v3;
      v69 = v33;

      goto LABEL_33;
    }
    LOBYTE(v25) = 0;
  }
LABEL_40:

  return v25;
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
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;

  objc_msgSend_identifier(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  objc_msgSend_zoneName(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;
  objc_msgSend_zoneOwner(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_hash(v21, v22, v23, v24);
  objc_msgSend_recordName(self, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v17 ^ v25 ^ objc_msgSend_hash(v29, v30, v31, v32);
  objc_msgSend_recordFieldName(self, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v33 ^ objc_msgSend_hash(v37, v38, v39, v40);

  return v41;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;

  v3 = (void *)objc_opt_new();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v3, v6, (uint64_t)CFSTR("<%@ %p;"), v7, v5, self);

  objc_msgSend_name(self, v8, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v11;
  if (v11)
    objc_msgSend_appendFormat_(v3, v12, (uint64_t)CFSTR(" name=%@,"), v14, v11);
  objc_msgSend_zoneName(self, v12, v13, v14);
  v16 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v16;
  if (v16)
    objc_msgSend_appendFormat_(v3, v17, (uint64_t)CFSTR(" zoneName=%@,"), v19, v16);
  objc_msgSend_zoneOwner(self, v17, v18, v19);
  v21 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v21;
  if (v21)
    objc_msgSend_appendFormat_(v3, v22, (uint64_t)CFSTR(" zoneOwner=%@,"), v24, v21);
  objc_msgSend_recordName(self, v22, v23, v24);
  v26 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v26;
  if (v26)
    objc_msgSend_appendFormat_(v3, v27, (uint64_t)CFSTR(" recordName=%@,"), v29, v26);
  objc_msgSend_recordFieldName(self, v27, v28, v29);
  v31 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)v31;
  if (v31)
    objc_msgSend_appendFormat_(v3, v32, (uint64_t)CFSTR(" fieldName=%@,"), v34, v31);
  if (objc_msgSend_isEncrypted(self, v32, v33, v34))
    objc_msgSend_appendFormat_(v3, v36, (uint64_t)CFSTR(" encrypted=%@"), v37, CFSTR("Yes"));
  else
    objc_msgSend_appendFormat_(v3, v36, (uint64_t)CFSTR(" encrypted=%@"), v37, CFSTR("NO"));
  objc_msgSend_appendFormat_(v3, v38, (uint64_t)CFSTR(">"), v39);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKMergeableValueID)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  CKMergeableValueID *v24;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, (uint64_t)CFSTR("i"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v9, v8, (uint64_t)CFSTR("z"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("o"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, (uint64_t)CFSTR("r"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, (uint64_t)CFSTR("f"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_decodeBoolForKey_(v4, v20, (uint64_t)CFSTR("e"), v21);

  v24 = (CKMergeableValueID *)objc_msgSend_initWithData_zoneName_zoneOwner_recordName_recordFieldName_encrypted_(self, v23, (uint64_t)v7, (uint64_t)v10, v13, v16, v19, v22);
  return v24;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t isEncrypted;
  const char *v33;
  id v34;

  v34 = a3;
  objc_msgSend_identifier(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v34, v8, (uint64_t)v7, (uint64_t)CFSTR("i"));

  objc_msgSend_zoneName(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v34, v13, (uint64_t)v12, (uint64_t)CFSTR("z"));

  objc_msgSend_zoneOwner(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v34, v18, (uint64_t)v17, (uint64_t)CFSTR("o"));

  objc_msgSend_recordName(self, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v34, v23, (uint64_t)v22, (uint64_t)CFSTR("r"));

  objc_msgSend_recordFieldName(self, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v34, v28, (uint64_t)v27, (uint64_t)CFSTR("f"));

  isEncrypted = objc_msgSend_isEncrypted(self, v29, v30, v31);
  objc_msgSend_encodeBool_forKey_(v34, v33, isEncrypted, (uint64_t)CFSTR("e"));

}

- (id)zoneID
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  CKRecordZoneID *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  NSObject *v17;
  int v19;
  CKMergeableValueID *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend_zoneName(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = [CKRecordZoneID alloc];
    objc_msgSend_zoneName(self, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneOwner(self, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend_initWithZoneName_ownerName_(v6, v15, (uint64_t)v10, (uint64_t)v14);

  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v17 = ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_FAULT))
    {
      v19 = 138412290;
      v20 = self;
      _os_log_fault_impl(&dword_18A5C5000, v17, OS_LOG_TYPE_FAULT, "Trying to access nil zone ID on mergeable value ID: %@", (uint8_t *)&v19, 0xCu);
    }
    v16 = 0;
  }
  return v16;
}

- (id)recordID
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  CKRecordID *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  NSObject *v17;
  int v19;
  CKMergeableValueID *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend_zoneID(self, a2, v2, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    && (objc_msgSend_recordName(self, v5, v6, v7), v9 = (void *)objc_claimAutoreleasedReturnValue(),
                                                   v9,
                                                   v9))
  {
    v10 = [CKRecordID alloc];
    objc_msgSend_recordName(self, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend_initWithRecordName_zoneID_(v10, v15, (uint64_t)v14, (uint64_t)v8);

  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v17 = ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_FAULT))
    {
      v19 = 138412290;
      v20 = self;
      _os_log_fault_impl(&dword_18A5C5000, v17, OS_LOG_TYPE_FAULT, "Trying to access nil record ID on mergeable value ID: %@", (uint8_t *)&v19, 0xCu);
    }
    v16 = 0;
  }

  return v16;
}

- (CKRoughlyEquivalentProperties)equivalencyProperties
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)objc_opt_new();
  objc_msgSend_identifier(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)v7, (uint64_t)CFSTR("identifier"));

  objc_msgSend_properties(v3, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKRoughlyEquivalentProperties *)v12;
}

- (NSData)identifier
{
  return self->_identifier;
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (NSString)zoneOwner
{
  return self->_zoneOwner;
}

- (NSString)recordName
{
  return self->_recordName;
}

- (NSString)recordFieldName
{
  return self->_recordFieldName;
}

- (BOOL)isEncrypted
{
  return self->_encrypted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordFieldName, 0);
  objc_storeStrong((id *)&self->_recordName, 0);
  objc_storeStrong((id *)&self->_zoneOwner, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
