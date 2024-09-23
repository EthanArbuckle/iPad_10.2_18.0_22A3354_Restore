@implementation APDatabaseRow

- (APDatabaseTableProtocol)table
{
  return (APDatabaseTableProtocol *)objc_loadWeakRetained((id *)&self->_table);
}

- (NSSet)readOnlyColumns
{
  uint64_t v2;

  return (NSSet *)objc_msgSend_setWithObject_(MEMORY[0x1E0C99E60], a2, (uint64_t)CFSTR("rowid"), v2);
}

- (APDatabaseRow)initWithTable:(id)a3
{
  id v4;
  APDatabaseRow *v5;
  APDatabaseRow *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)APDatabaseRow;
  v5 = -[APDatabaseRow init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_isNewObject = 0;
    objc_storeWeak((id *)&v5->_table, v4);
    objc_msgSend__createColumns(v6, v7, v8, v9);
  }

  return v6;
}

- (id)initAsNewObjectWithTable:(id)a3
{
  id v4;
  APDatabaseRow *v5;
  APDatabaseRow *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)APDatabaseRow;
  v5 = -[APDatabaseRow init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_isNewObject = 1;
    objc_storeWeak((id *)&v5->_table, v4);
    objc_msgSend__createColumns(v6, v7, v8, v9);
  }

  return v6;
}

- (BOOL)save
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  char v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  NSObject *v67;
  void *v68;
  const char *v69;
  uint64_t inserted;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  char v77;
  void *v78;
  id v79;
  NSObject *v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *j;
  void *v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  int isEqualToString;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  void *v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  const char *v126;
  void *v127;
  id v128;
  NSObject *v130;
  NSObject *v131;
  void *v132;
  void *v133;
  id v134;
  void *v135;
  void *v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  _BYTE v145[128];
  uint8_t v146[128];
  uint8_t buf[4];
  void *v148;
  uint64_t v149;

  v149 = *MEMORY[0x1E0C80C00];
  objc_msgSend_table(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_manager(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend_columns(self, v10, v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_allValues((void *)v13, v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();

    LOBYTE(v13) = objc_msgSend_isNewObject(self, v18, v19, v20);
    v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v23 = v22;
    if ((v13 & 1) != 0)
    {
      v135 = v22;
      v24 = v21;
      v132 = v9;
      v134 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v137 = 0u;
      v138 = 0u;
      v139 = 0u;
      v140 = 0u;
      v130 = v17;
      v25 = v17;
      v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v137, (uint64_t)v145, 16);
      if (v27)
      {
        v31 = v27;
        v32 = *(_QWORD *)v138;
        do
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v138 != v32)
              objc_enumerationMutation(v25);
            v34 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * i);
            objc_msgSend_readOnlyColumns(self, v28, v29, v30);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_name(v34, v36, v37, v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend_containsObject_(v35, v40, (uint64_t)v39, v41);

            if ((v42 & 1) == 0)
            {
              objc_msgSend_name(v34, v28, v29, v30);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v24, v44, (uint64_t)v43, v45);

              objc_msgSend_addObject_(v135, v46, (uint64_t)CFSTR("?"), v47);
              objc_msgSend_addObject_(v134, v48, (uint64_t)v34, v49);
            }
          }
          v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v28, (uint64_t)&v137, (uint64_t)v145, 16);
        }
        while (v31);
      }

      v50 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend_table(self, v51, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_tableName(v54, v55, v56, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v24;
      objc_msgSend_componentsJoinedByString_(v24, v59, (uint64_t)CFSTR(", "), v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_componentsJoinedByString_(v135, v62, (uint64_t)CFSTR(", "), v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v50, v65, (uint64_t)CFSTR("INSERT INTO %@ (%@) VALUES (%@)"), v66, v58, v61, v64);
      v67 = objc_claimAutoreleasedReturnValue();

      v23 = v135;
      v9 = v132;
      v68 = v134;
      inserted = objc_msgSend_executeInsertQuery_withParameters_(v132, v69, (uint64_t)v67, (uint64_t)v134);
      objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v71, inserted, v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setValue_forColumnName_(self, v74, (uint64_t)v73, (uint64_t)CFSTR("rowid"));

      objc_msgSend_setIsNewObject_(self, v75, 0, v76);
      v77 = inserted != -1;
      v17 = v130;
      goto LABEL_34;
    }
    v143 = 0u;
    v144 = 0u;
    v141 = 0u;
    v142 = 0u;
    v80 = v17;
    v68 = (void *)objc_msgSend_countByEnumeratingWithState_objects_count_(v80, v81, (uint64_t)&v141, (uint64_t)v146, 16);
    if (v68)
    {
      v136 = v21;
      v131 = v17;
      v133 = v9;
      v85 = 0;
      v86 = *(_QWORD *)v142;
      do
      {
        for (j = 0; j != v68; j = (char *)j + 1)
        {
          if (*(_QWORD *)v142 != v86)
            objc_enumerationMutation(v80);
          v88 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * (_QWORD)j);
          objc_msgSend_name(v88, v82, v83, v84);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v89, v90, (uint64_t)CFSTR("rowid"), v91);

          if (isEqualToString)
          {
            v96 = v88;

            v85 = v96;
          }
          else
          {
            v97 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend_name(v88, v93, v94, v95);
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringWithFormat_(v97, v99, (uint64_t)CFSTR("%@=?"), v100, v98);
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v136, v102, (uint64_t)v101, v103);

            objc_msgSend_addObject_(v23, v104, (uint64_t)v88, v105);
          }
        }
        v68 = (void *)objc_msgSend_countByEnumeratingWithState_objects_count_(v80, v82, (uint64_t)&v141, (uint64_t)v146, 16);
      }
      while (v68);

      v68 = v85;
      if (v85)
      {
        objc_msgSend_value(v85, v106, v107, v108);
        v109 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = v131;
        v9 = v133;
        v21 = v136;
        if (v109)
        {
          objc_msgSend_addObject_(v23, v110, (uint64_t)v85, v111);
          v112 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend_table(self, v113, v114, v115);
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_tableName(v116, v117, v118, v119);
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_componentsJoinedByString_(v136, v121, (uint64_t)CFSTR(", "), v122);
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithFormat_(v112, v124, (uint64_t)CFSTR("UPDATE %@ SET %@ WHERE rowId=?"), v125, v120, v123);
          v67 = objc_claimAutoreleasedReturnValue();

          v68 = v85;
          v77 = objc_msgSend_executeQuery_withParameters_(v133, v126, (uint64_t)v67, (uint64_t)v23);
LABEL_34:

          goto LABEL_35;
        }
      }
      else
      {
        v17 = v131;
        v9 = v133;
        v21 = v136;
      }
    }
    else
    {

    }
    APLogForCategory(0xBuLL);
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      v127 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138477827;
      v148 = v127;
      v128 = v127;
      _os_log_impl(&dword_1CF251000, v67, OS_LOG_TYPE_ERROR, "[%{private}@]: RowId is nil when trying to update row.", buf, 0xCu);

    }
    v77 = 0;
    goto LABEL_34;
  }
  APLogForCategory(0xBuLL);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v78 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138477827;
    v148 = v78;
    v79 = v78;
    _os_log_impl(&dword_1CF251000, v17, OS_LOG_TYPE_ERROR, "[%{private}@]: Database manager is nil when trying to save row.", buf, 0xCu);

  }
  v77 = 0;
LABEL_35:

  return v77;
}

- (BOOL)deleteFromDB
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  NSObject *v17;
  id v18;
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
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  NSObject *v37;
  const char *v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  id v43;
  NSObject *v45;
  uint8_t buf[4];
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend_table(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_manager(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    APLogForCategory(0xBuLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v47 = (id)objc_opt_class();
      v18 = v47;
      _os_log_impl(&dword_1CF251000, v17, OS_LOG_TYPE_ERROR, "[%{private}@]: Database manager is nil when trying to delete row.", buf, 0xCu);

    }
    v16 = 0;
    goto LABEL_13;
  }
  if ((objc_msgSend_isNewObject(self, v10, v11, v12) & 1) == 0)
  {
    objc_msgSend_columns(self, v13, v14, v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v19, v20, (uint64_t)CFSTR("rowid"), v21);
    v17 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_value(v17, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v29 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend_table(self, v26, v27, v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_tableName(v30, v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v29, v35, (uint64_t)CFSTR("DELETE FROM %@ WHERE rowid = ?"), v36, v34);
      v37 = objc_claimAutoreleasedReturnValue();

      v45 = v17;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v38, (uint64_t)&v45, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend_executeQuery_withParameters_(v9, v40, (uint64_t)v37, (uint64_t)v39);

      objc_msgSend_setIsNewObject_(self, v41, 1, v42);
    }
    else
    {
      APLogForCategory(0xBuLL);
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138477827;
        v47 = (id)objc_opt_class();
        v43 = v47;
        _os_log_impl(&dword_1CF251000, v37, OS_LOG_TYPE_ERROR, "[%{private}@]: Error - Can't delete from DB rowId is nill.", buf, 0xCu);

      }
      v16 = 0;
    }

LABEL_13:
    goto LABEL_14;
  }
  v16 = 0;
LABEL_14:

  return v16;
}

- (BOOL)isDataObjectEqual:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
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
  char isKindOfClass;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  char isEqualToNumber;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  char v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  char v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  double v102;
  double v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  char v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  char v118;
  BOOL v119;
  NSObject *v120;
  void *v121;
  id v122;
  void *v124;
  id v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  uint8_t buf[4];
  void *v131;
  _BYTE v132[128];
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
  v125 = a3;
  objc_msgSend_columns(self, v4, v5, v6);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v124, v7, v8, v9);
  v126 = 0u;
  v127 = 0u;
  v128 = 0u;
  v129 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v126, (uint64_t)v132, 16);
  if (!v12)
  {
LABEL_33:
    v119 = 1;
    goto LABEL_48;
  }
  v15 = v12;
  v16 = *(_QWORD *)v127;
LABEL_3:
  v17 = 0;
  while (1)
  {
    if (*(_QWORD *)v127 != v16)
      objc_enumerationMutation(v10);
    v18 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * v17);
    if ((objc_msgSend_isEqualToString_(v18, v13, (uint64_t)CFSTR("rowid"), v14) & 1) != 0)
      goto LABEL_31;
    objc_msgSend_objectForKey_(v124, v13, (uint64_t)v18, v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_columns(v125, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v23, v24, (uint64_t)v18, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_value(v19, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
      break;
    objc_msgSend_value(v26, v31, v32, v33);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
      goto LABEL_10;
LABEL_30:

LABEL_31:
    if (v15 == ++v17)
    {
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v126, (uint64_t)v132, 16);
      if (!v15)
        goto LABEL_33;
      goto LABEL_3;
    }
  }

LABEL_10:
  objc_msgSend_value(v19, v34, v35, v36);
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v42 = (void *)v38;
    objc_msgSend_value(v26, v39, v40, v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v43)
      goto LABEL_47;
  }
  objc_msgSend_value(v19, v39, v40, v41);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
  {

  }
  else
  {
    objc_msgSend_value(v26, v45, v46, v47);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (v51)
      goto LABEL_47;
  }
  switch(objc_msgSend_type(v19, v48, v49, v50))
  {
    case 0:
    case 1:
    case 2:
    case 5:
      objc_msgSend_value(v19, v52, v53, v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

LABEL_35:
        APLogForCategory(0xBuLL);
        v120 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
          goto LABEL_45;
        goto LABEL_46;
      }
      objc_msgSend_value(v26, v56, v57, v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        goto LABEL_35;
      objc_msgSend_value(v19, v61, v62, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_value(v26, v65, v66, v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToNumber = objc_msgSend_isEqualToNumber_(v64, v69, (uint64_t)v68, v70);
      goto LABEL_29;
    case 3:
      objc_msgSend_value(v19, v52, v53, v54);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

LABEL_38:
        APLogForCategory(0xBuLL);
        v120 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
          goto LABEL_45;
        goto LABEL_46;
      }
      objc_msgSend_value(v26, v73, v74, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v77 = objc_opt_isKindOfClass();

      if ((v77 & 1) == 0)
        goto LABEL_38;
      objc_msgSend_value(v19, v78, v79, v80);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_value(v26, v81, v82, v83);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToNumber = objc_msgSend_isEqualToString_(v64, v84, (uint64_t)v68, v85);
      goto LABEL_29;
    case 4:
      objc_msgSend_value(v19, v52, v53, v54);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

LABEL_41:
        APLogForCategory(0xBuLL);
        v120 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
          goto LABEL_45;
        goto LABEL_46;
      }
      objc_msgSend_value(v26, v87, v88, v89);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v91 = objc_opt_isKindOfClass();

      if ((v91 & 1) == 0)
        goto LABEL_41;
      objc_msgSend_value(v19, v92, v93, v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_value(v26, v96, v97, v98);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceDate_(v95, v100, (uint64_t)v99, v101);
      v103 = fabs(v102);

      if (v103 > 0.001)
        goto LABEL_47;
      goto LABEL_30;
    case 6:
      objc_msgSend_value(v19, v52, v53, v54);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_value(v26, v105, v106, v107);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v109 = objc_opt_isKindOfClass();

        if ((v109 & 1) == 0)
          goto LABEL_44;
        objc_msgSend_value(v19, v110, v111, v112);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_value(v26, v113, v114, v115);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToNumber = objc_msgSend_isEqualToData_(v64, v116, (uint64_t)v68, v117);
LABEL_29:
        v118 = isEqualToNumber;

        if ((v118 & 1) == 0)
          goto LABEL_47;
        goto LABEL_30;
      }

LABEL_44:
      APLogForCategory(0xBuLL);
      v120 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
      {
LABEL_45:
        v121 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138477827;
        v131 = v121;
        v122 = v121;
        _os_log_impl(&dword_1CF251000, v120, OS_LOG_TYPE_ERROR, "[%{private}@]: Error - Column type class type missmatch.", buf, 0xCu);

      }
LABEL_46:

LABEL_47:
      v119 = 0;
LABEL_48:

      return v119;
    default:
      goto LABEL_30;
  }
}

- (id)dictionaryFromBlobForColumnName:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_valueForColumnName_(self, v5, (uint64_t)v4, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB3710];
    objc_msgSend__allowedCodingClasses(self, v7, v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    objc_msgSend_unarchivedObjectOfClasses_fromData_error_(v11, v13, (uint64_t)v12, (uint64_t)v10, &v25);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v25;

    if (v15)
    {
      APLogForCategory(0xBuLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = (void *)objc_opt_class();
        v18 = v17;
        objc_msgSend_localizedDescription(v15, v19, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138478339;
        v27 = v17;
        v28 = 2113;
        v29 = v4;
        v30 = 2114;
        v31 = v22;
        _os_log_impl(&dword_1CF251000, v16, OS_LOG_TYPE_ERROR, "[%{private}@] Could not unarchive data for %{private}@ column, error: %{public}@", buf, 0x20u);

      }
      v23 = 0;
    }
    else
    {
      v23 = v14;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)setDictionary:(id)a3 forBlobColumnName:(id)a4
{
  const char *v6;
  id v7;
  void *v8;
  const char *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (a3)
  {
    v18 = 0;
    objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v6, (uint64_t)a3, 1, &v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v18;
    if (v10)
    {
      APLogForCategory(0xBuLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = (void *)objc_opt_class();
        v13 = v12;
        objc_msgSend_localizedDescription(v10, v14, v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138478339;
        v20 = v12;
        v21 = 2113;
        v22 = v7;
        v23 = 2114;
        v24 = v17;
        _os_log_impl(&dword_1CF251000, v11, OS_LOG_TYPE_ERROR, "[%{private}@] Could not archive data for %{private}@ column, error: %{public}@", buf, 0x20u);

      }
    }
    else
    {
      objc_msgSend_setValue_forColumnName_(self, v9, (uint64_t)v8, (uint64_t)v7);
    }

  }
  else
  {
    objc_msgSend_setValue_forColumnName_(self, v6, 0, (uint64_t)v7);
  }

}

- (NSString)description
{
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  const char *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  void *v52;
  id v53;
  void *v54;
  NSObject *v55;
  void *v56;
  id v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  __CFString *v62;
  __CFString *v63;
  id v64;
  const char *v65;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  void *v79;
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend_isAppleInternalInstall(APSystemInternal, a2, v2, v3))
  {
    v63 = &stru_1E8C4E328;
LABEL_29:
    v62 = v63;
    goto LABEL_30;
  }
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  objc_msgSend_columns(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allValues(v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v72, (uint64_t)v81, 16);
  if (v18)
  {
    v22 = v18;
    v23 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v73 != v23)
          objc_enumerationMutation(v16);
        v25 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
        objc_msgSend_name(v25, v19, v20, v21);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_value(v25, v27, v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqualToString_(v26, v31, (uint64_t)CFSTR("rowid"), v32) & 1) == 0 && v30)
          objc_msgSend_setObject_forKey_(v8, v33, (uint64_t)v30, (uint64_t)v26);

      }
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v72, (uint64_t)v81, 16);
    }
    while (v22);
  }

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  objc_msgSend_readOnlyColumns(self, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v38, (uint64_t)&v68, (uint64_t)v80, 16);
  if (v39)
  {
    v42 = v39;
    v43 = *(_QWORD *)v69;
    do
    {
      for (j = 0; j != v42; ++j)
      {
        if (*(_QWORD *)v69 != v43)
          objc_enumerationMutation(v37);
        v45 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
        if ((objc_msgSend_isEqualToString_(v45, v40, (uint64_t)CFSTR("rowid"), v41) & 1) == 0)
        {
          objc_msgSend_valueForKey_(self, v40, (uint64_t)v45, v41);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          if (v47)
            objc_msgSend_setObject_forKey_(v8, v46, (uint64_t)v47, (uint64_t)v45);

        }
      }
      v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v40, (uint64_t)&v68, (uint64_t)v80, 16);
    }
    while (v42);
  }

  objc_msgSend_JSONObjectWithObject_(APJSONArchiver, v48, (uint64_t)v8, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v67 = 0;
  objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x1E0CB36D8], v51, (uint64_t)v50, 0, &v67);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v67;
  if (!v53)
  {
    v64 = objc_alloc(MEMORY[0x1E0CB3940]);
    v63 = (__CFString *)objc_msgSend_initWithData_encoding_(v64, v65, (uint64_t)v52, 4);

    goto LABEL_29;
  }
  v54 = v53;
  APLogForCategory(0xBuLL);
  v55 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
  {
    v56 = (void *)objc_opt_class();
    v57 = v56;
    objc_msgSend_description(v54, v58, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478083;
    v77 = v56;
    v78 = 2113;
    v79 = v61;
    _os_log_impl(&dword_1CF251000, v55, OS_LOG_TYPE_ERROR, "[%{private}@]: Error generating JSON description %{private}@.", buf, 0x16u);

  }
  v62 = &stru_1E8C4E328;
LABEL_30:

  return (NSString *)v62;
}

- (void)_createColumns
{
  id v3;
  APDatabaseColumn *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  objc_class *v12;
  objc_property_t *v13;
  objc_property_t *v14;
  uint64_t v15;
  unint64_t v16;
  objc_property *v17;
  const char *Name;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  char v28;
  const char *Attributes;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  id v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  NSObject *v53;
  objc_class *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  char isEqualToString;
  uint64_t v59;
  void *v60;
  id v61;
  objc_class *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  char v66;
  objc_class *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  char v71;
  objc_class *v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  char v76;
  APDatabaseColumn *v77;
  const char *v78;
  const char *v79;
  objc_class *v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  objc_class *v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  char v88;
  NSObject *v89;
  void *v90;
  id v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  id v98;
  objc_property_t *v99;
  APDatabaseRow *v100;
  unsigned int outCount;
  uint8_t buf[4];
  void *v103;
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  outCount = 0;
  v4 = [APDatabaseColumn alloc];
  v6 = (void *)objc_msgSend_initWithName_forColumnType_withValue_(v4, v5, (uint64_t)CFSTR("rowid"), 0, 0);
  objc_msgSend_name(v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = v6;
  objc_msgSend_setObject_forKey_(v3, v11, (uint64_t)v6, (uint64_t)v10);

  v12 = (objc_class *)objc_opt_class();
  v13 = class_copyPropertyList(v12, &outCount);
  v14 = v13;
  if (outCount)
  {
    v15 = 0;
    v16 = 0x1E0CB3000uLL;
    v98 = v3;
    v99 = v13;
    v100 = self;
    while (1)
    {
      v17 = v14[v15];
      Name = property_getName(v17);
      if (Name)
        break;
LABEL_28:
      if (++v15 >= (unint64_t)outCount)
        goto LABEL_37;
    }
    objc_msgSend_stringWithUTF8String_(*(void **)(v16 + 2368), v19, (uint64_t)Name, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_readOnlyColumns(self, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend_containsObject_(v25, v26, (uint64_t)v21, v27);

    if ((v28 & 1) != 0)
    {
LABEL_27:

      goto LABEL_28;
    }
    Attributes = property_getAttributes(v17);
    objc_msgSend_stringWithUTF8String_(*(void **)(v16 + 2368), v30, (uint64_t)Attributes, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_componentsSeparatedByString_(v32, v33, (uint64_t)CFSTR(","), v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndex_(v35, v36, 0, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_substringFromIndex_(v38, v39, 1, v40);
    v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v45 = (const char *)objc_msgSend_UTF8String(v41, v42, v43, v44);
    if (!objc_msgSend_hasPrefix_(v38, v46, (uint64_t)CFSTR("T@"), v47))
    {
      if (!strcmp(v45, "q"))
      {
        v59 = 0;
      }
      else if (!strcmp(v45, "Q"))
      {
        v59 = 3;
      }
      else
      {
        if (strcmp(v45, "B"))
        {
          APLogForCategory(0xBuLL);
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            v60 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138477827;
            v103 = v60;
            v61 = v60;
            _os_log_impl(&dword_1CF251000, v53, OS_LOG_TYPE_ERROR, "[%{private}@]: Unable to match property type to DB Column type.", buf, 0xCu);

            v3 = v98;
          }
          v59 = 0;
          goto LABEL_24;
        }
        v59 = 5;
      }
LABEL_25:
      v77 = [APDatabaseColumn alloc];
      v53 = objc_msgSend_initWithName_forColumnType_withValue_(v77, v78, (uint64_t)v21, v59, 0);
      objc_msgSend_setObject_forKey_(v3, v79, (uint64_t)v53, (uint64_t)v21);
LABEL_26:

      v14 = v99;
      self = v100;
      v16 = 0x1E0CB3000;
      goto LABEL_27;
    }
    v51 = objc_msgSend_length(v38, v48, v49, v50);
    objc_msgSend_substringWithRange_(v38, v52, 3, v51 - 4);
    v53 = objc_claimAutoreleasedReturnValue();
    v54 = (objc_class *)objc_opt_class();
    NSStringFromClass(v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v53, v56, (uint64_t)v55, v57);

    if ((isEqualToString & 1) != 0)
    {
      v59 = 3;
    }
    else
    {
      v62 = (objc_class *)objc_opt_class();
      NSStringFromClass(v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend_isEqualToString_(v53, v64, (uint64_t)v63, v65);

      if ((v66 & 1) != 0)
      {
        v59 = 2;
      }
      else
      {
        v67 = (objc_class *)objc_opt_class();
        NSStringFromClass(v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = objc_msgSend_isEqualToString_(v53, v69, (uint64_t)v68, v70);

        if ((v71 & 1) != 0)
        {
          v59 = 4;
        }
        else
        {
          v72 = (objc_class *)objc_opt_class();
          NSStringFromClass(v72);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = objc_msgSend_isEqualToString_(v53, v74, (uint64_t)v73, v75);

          if ((v76 & 1) == 0)
          {
            v80 = (objc_class *)objc_opt_class();
            NSStringFromClass(v80);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_isEqualToString_(v53, v82, (uint64_t)v81, v83))
            {

            }
            else
            {
              v84 = (objc_class *)objc_opt_class();
              NSStringFromClass(v84);
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              v88 = objc_msgSend_isEqualToString_(v53, v86, (uint64_t)v85, v87);

              if ((v88 & 1) == 0)
              {
                APLogForCategory(0xBuLL);
                v89 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
                {
                  v90 = (void *)objc_opt_class();
                  *(_DWORD *)buf = 138477827;
                  v103 = v90;
                  v91 = v90;
                  _os_log_impl(&dword_1CF251000, v89, OS_LOG_TYPE_ERROR, "[%{private}@]: Unable to match property type to DB Column type.", buf, 0xCu);

                }
                v59 = 0;
                goto LABEL_23;
              }
            }
            v3 = v98;
            goto LABEL_26;
          }
          v59 = 6;
        }
      }
    }
LABEL_23:
    v3 = v98;
LABEL_24:

    goto LABEL_25;
  }
LABEL_37:
  free(v14);
  objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E0C99D80], v92, (uint64_t)v3, v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setColumns_(self, v95, (uint64_t)v94, v96);

}

- (id)_allowedCodingClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  return (id)objc_msgSend_setWithObjects_(v2, v8, v3, v9, v4, v5, v6, v7, 0);
}

- (void)setValue:(id)a3 forColumnName:(id)a4
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
  NSObject *v17;
  id v18;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend_columns(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v11, v12, (uint64_t)v7, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend_setValue_(v14, v15, (uint64_t)v6, v16);
  }
  else
  {
    APLogForCategory(0xBuLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = 138478083;
      v20 = (id)objc_opt_class();
      v21 = 2113;
      v22 = v7;
      v18 = v20;
      _os_log_impl(&dword_1CF251000, v17, OS_LOG_TYPE_ERROR, "[%{private}@]: Column not avaliable for column name %{private}@.", (uint8_t *)&v19, 0x16u);

    }
  }

}

- (id)valueForColumnName:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_columns(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v8, v9, (uint64_t)v4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend_value(v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    APLogForCategory(0xBuLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v19 = 138478083;
      v20 = (id)objc_opt_class();
      v21 = 2113;
      v22 = v4;
      v17 = v20;
      _os_log_impl(&dword_1CF251000, v16, OS_LOG_TYPE_ERROR, "[%{private}@]: Column not avaliable for column name %{private}@.", (uint8_t *)&v19, 0x16u);

    }
    v15 = 0;
  }

  return v15;
}

- (int64_t)typeForColumnName:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  NSObject *v16;
  id v17;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_columns(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v8, v9, (uint64_t)v4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v15 = objc_msgSend_type(v11, v12, v13, v14);
  }
  else
  {
    APLogForCategory(0xBuLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v19 = 138478083;
      v20 = (id)objc_opt_class();
      v21 = 2113;
      v22 = v4;
      v17 = v20;
      _os_log_impl(&dword_1CF251000, v16, OS_LOG_TYPE_ERROR, "[%{private}@]: Column not avaliable for column name %{private}@.", (uint8_t *)&v19, 0x16u);

    }
    v15 = 0;
  }

  return v15;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  id v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  id location;

  v4 = a3;
  v8 = (const char *)objc_msgSend_selector(v4, v5, v6, v7);
  NSStringFromSelector(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ap_propertyName(v9, v10, v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if (objc_msgSend_hasPrefix_(v9, v13, (uint64_t)CFSTR("set"), v14))
    {
      location = 0;
      objc_msgSend_getArgument_atIndex_(v4, v16, (uint64_t)&location, 2);
      v18 = objc_loadWeakRetained(&location);
      objc_msgSend_setValue_forColumnName_(self, v19, (uint64_t)v18, (uint64_t)v15);

      objc_destroyWeak(&location);
    }
    else
    {
      objc_msgSend_valueForColumnName_(self, v16, (uint64_t)v9, v17);
      location = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setReturnValue_(v4, v20, (uint64_t)&location, v21);

    }
  }

}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)APDatabaseRow;
  -[APDatabaseRow methodSignatureForSelector:](&v11, sel_methodSignatureForSelector_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    NSStringFromSelector(a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_hasPrefix_(v5, v6, (uint64_t)CFSTR("set"), v7))
      objc_msgSend_signatureWithObjCTypes_(MEMORY[0x1E0C99DD8], v8, (uint64_t)"v@:@", v9);
    else
      objc_msgSend_signatureWithObjCTypes_(MEMORY[0x1E0C99DD8], v8, (uint64_t)"@@:", v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (NSDictionary)columns
{
  return self->_columns;
}

- (void)setColumns:(id)a3
{
  objc_storeStrong((id *)&self->_columns, a3);
}

- (BOOL)isNewObject
{
  return self->_isNewObject;
}

- (void)setIsNewObject:(BOOL)a3
{
  self->_isNewObject = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
  objc_destroyWeak((id *)&self->_table);
}

@end
