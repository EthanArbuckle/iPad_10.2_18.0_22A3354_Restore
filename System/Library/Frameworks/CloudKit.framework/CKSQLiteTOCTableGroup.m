@implementation CKSQLiteTOCTableGroup

+ (id)bootstrapNewDatabase:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
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
  id v31;
  const char *v32;
  uint64_t v33;
  CKSQLiteTOCTableEntry *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  CKSQLiteTOCTableEntry *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v121;
  uint64_t v122;
  uint64_t (*v123)(uint64_t, const char *, uint64_t, uint64_t);
  void *v124;
  id v125;
  id v126;
  _QWORD v127[4];
  id v128;
  id v129;

  v3 = a3;
  objc_msgSend_TOCTableGroupInDatabase_(CKSQLiteTOCTableGroup, v4, (uint64_t)v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tocTableGroupTable(v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_createTableSQL(v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v127[0] = MEMORY[0x1E0C809B0];
  v127[1] = 3221225472;
  v127[2] = sub_18A6D3880;
  v127[3] = &unk_1E1F605B0;
  v16 = v3;
  v128 = v16;
  v17 = v14;
  v129 = v17;
  objc_msgSend_performDatabaseTransaction_(v16, v18, (uint64_t)v127, v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    objc_msgSend_insertObject_(v10, v20, (uint64_t)v6, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      objc_msgSend_tocTable(v6, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_createTableSQL(v26, v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = v15;
      v122 = 3221225472;
      v123 = sub_18A6D388C;
      v124 = &unk_1E1F605B0;
      v125 = v16;
      v31 = v30;
      v126 = v31;
      objc_msgSend_performDatabaseTransaction_(v125, v32, (uint64_t)&v121, v33);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        v34 = objc_alloc_init(CKSQLiteTOCTableEntry);
        objc_msgSend_logicalTableName(v26, v35, v36, v37, v121, v122, v123, v124, v125);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setLogicalTableName_(v34, v39, (uint64_t)v38, v40);

        objc_msgSend_dbTableName(v26, v41, v42, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setDbTableName_(v34, v45, (uint64_t)v44, v46);

        objc_msgSend_groupID(v6, v47, v48, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setGroupID_(v34, v51, (uint64_t)v50, v52);

        objc_msgSend_setSchema_(v34, v53, (uint64_t)v31, v54);
        v55 = (void *)objc_opt_class();
        v56 = (void *)MEMORY[0x1E0CB37E8];
        v60 = objc_msgSend_dbVersion(v55, v57, v58, v59);
        objc_msgSend_numberWithUnsignedInteger_(v56, v61, v60, v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setDbVersion_(v34, v64, (uint64_t)v63, v65);

        NSStringFromClass((Class)v55);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setCreatingClass_(v34, v67, (uint64_t)v66, v68);

        objc_msgSend_flattenedDBProperties(v55, v69, v70, v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setPropertyData_(v34, v73, (uint64_t)v72, v74);

        objc_msgSend_insertObject_(v26, v75, (uint64_t)v34, v76);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
          v77 = objc_alloc_init(CKSQLiteTOCTableEntry);
          objc_msgSend_logicalTableName(v10, v78, v79, v80);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setLogicalTableName_(v77, v82, (uint64_t)v81, v83);

          objc_msgSend_dbTableName(v10, v84, v85, v86);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setDbTableName_(v77, v88, (uint64_t)v87, v89);

          objc_msgSend_groupID(v6, v90, v91, v92);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setGroupID_(v77, v94, (uint64_t)v93, v95);

          objc_msgSend_setSchema_(v77, v96, (uint64_t)v17, v97);
          v98 = (void *)objc_opt_class();
          v99 = (void *)MEMORY[0x1E0CB37E8];
          v103 = objc_msgSend_dbVersion(v98, v100, v101, v102);
          objc_msgSend_numberWithUnsignedInteger_(v99, v104, v103, v105);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setDbVersion_(v77, v107, (uint64_t)v106, v108);

          NSStringFromClass((Class)v98);
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setCreatingClass_(v77, v110, (uint64_t)v109, v111);

          objc_msgSend_flattenedDBProperties(v98, v112, v113, v114);
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setPropertyData_(v77, v116, (uint64_t)v115, v117);

          objc_msgSend_insertObject_(v26, v118, (uint64_t)v77, v119);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }

    }
  }

  return v22;
}

+ (double)expirationTime
{
  return 0.0;
}

+ (id)TOCTableGroupInDatabase:(id)a3
{
  id v3;
  CKSQLiteTOCTableGroup *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  objc_class *v19;
  void *v20;
  const char *v21;
  uint64_t v22;

  v3 = a3;
  v4 = [CKSQLiteTOCTableGroup alloc];
  objc_msgSend_dbTableName(CKSQLiteTOCTableGroupTable, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_initWithName_options_database_(v4, v9, (uint64_t)v8, 393216, v3);

  objc_msgSend_date(MEMORY[0x1E0C99D68], v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLastUsed_(v10, v15, (uint64_t)v14, v16);

  objc_msgSend_setGroupID_(v10, v17, (uint64_t)&unk_1E1FC44C0, v18);
  v19 = (objc_class *)objc_opt_class();
  NSStringFromClass(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCreatingClass_(v10, v21, (uint64_t)v20, v22);

  return v10;
}

- (id)_tablesByNameInitializer
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  CKSQLiteTOCTable *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  CKSQLiteTOCTableGroupTable *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend_dbTableName(CKSQLiteTOCTable, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [CKSQLiteTOCTable alloc];
  v8 = (void *)objc_msgSend_initWithLogicalTableName_(v5, v6, (uint64_t)v4, v7);
  objc_msgSend_setDbTableName_(v8, v9, (uint64_t)v4, v10);
  objc_msgSend_dbTableName(CKSQLiteTOCTableGroupTable, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [CKSQLiteTOCTableGroupTable alloc];
  v18 = (void *)objc_msgSend_initWithLogicalTableName_(v15, v16, (uint64_t)v14, v17);
  objc_msgSend_setDbTableName_(v18, v19, (uint64_t)v14, v20);
  v24[0] = v4;
  v24[1] = v14;
  v25[0] = v8;
  v25[1] = v18;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v21, (uint64_t)v25, (uint64_t)v24, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (CKSQLiteTOCTableGroup)initWithName:(id)a3 options:(unint64_t)a4 database:(id)a5
{
  CKSQLiteTOCTableGroup *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CKSQLiteTOCTable *tocTable;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  CKSQLiteTOCTableGroupTable *tocTableGroup;
  const char *v24;
  uint64_t v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)CKSQLiteTOCTableGroup;
  v5 = -[CKSQLiteTableGroup initWithName:options:database:](&v27, sel_initWithName_options_database_, a3, a4, a5);
  objc_msgSend_dbTableName(CKSQLiteTOCTable, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tableWithName_(v5, v10, (uint64_t)v9, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  tocTable = v5->_tocTable;
  v5->_tocTable = (CKSQLiteTOCTable *)v12;

  objc_msgSend_setTableGroup_(v5->_tocTable, v14, (uint64_t)v5, v15);
  objc_msgSend_dbTableName(CKSQLiteTOCTableGroupTable, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tableWithName_(v5, v20, (uint64_t)v19, v21);
  v22 = objc_claimAutoreleasedReturnValue();
  tocTableGroup = v5->_tocTableGroup;
  v5->_tocTableGroup = (CKSQLiteTOCTableGroupTable *)v22;

  objc_msgSend_setTableGroup_(v5->_tocTableGroup, v24, (uint64_t)v5, v25);
  return v5;
}

- (id)tocTableGroupInitValue
{
  return 0;
}

- (id)tocTableGroupTable
{
  return self->_tocTableGroup;
}

- (id)tocTable
{
  return self->_tocTable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tocTable, 0);
  objc_storeStrong((id *)&self->_tocTableGroup, 0);
}

@end
