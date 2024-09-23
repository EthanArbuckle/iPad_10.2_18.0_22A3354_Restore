@implementation IMDAbstractDatabaseDowngrader

- (id)createDowngradeHelper
{
  return 0;
}

- (BOOL)copyDatabase:(id)a3
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  NSObject *v18;
  BOOL v19;
  NSObject *v21;
  NSObject *v22;
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  uint8_t v26[16];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  uint64_t v40;
  _OWORD buf[11];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = -[IMDAbstractDatabaseDowngrader createDowngradeHelper](self, "createDowngradeHelper");
  v35 = 0;
  v36 = &v35;
  v37 = 0x3052000000;
  v38 = sub_1ABBEC3EC;
  v39 = sub_1ABBEC3FC;
  v6 = MEMORY[0x1E0C809B0];
  v40 = 0;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = sub_1ABBEC408;
  v34[3] = &unk_1E5AAF548;
  v34[4] = &v35;
  objc_msgSend(v5, "open:", v34);
  v7 = IMLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, "Downgrade: Opening new coral database", (uint8_t *)buf, 2u);
  }
  if (!v36[5])
  {
    v33[0] = v6;
    v33[1] = 3221225472;
    v33[2] = sub_1ABBEC418;
    v33[3] = &unk_1E5AAF548;
    v33[4] = &v35;
    objc_msgSend(v5, "beginTransaction:", v33);
    if (!v36[5])
    {
      v8 = IMLogHandleForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "Downgrade: Creating Tables", (uint8_t *)buf, 2u);
      }
      v32[0] = v6;
      v32[1] = 3221225472;
      v32[2] = sub_1ABBEC428;
      v32[3] = &unk_1E5AAF548;
      v32[4] = &v35;
      objc_msgSend(v5, "createTables:", v32);
      if (v36[5])
        goto LABEL_11;
      v9 = IMLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1ABB60000, v9, OS_LOG_TYPE_INFO, "Downgrade: Creating Indexes", (uint8_t *)buf, 2u);
      }
      v31[0] = v6;
      v31[1] = 3221225472;
      v31[2] = sub_1ABBEC438;
      v31[3] = &unk_1E5AAF548;
      v31[4] = &v35;
      objc_msgSend(v5, "createIndexes:", v31);
      if (v36[5])
      {
LABEL_11:
        v30[0] = v6;
        v30[1] = 3221225472;
        v30[2] = sub_1ABBEC448;
        v30[3] = &unk_1E5AAF548;
        v30[4] = &v35;
        objc_msgSend(v5, "revertTransaction:", v30);
      }
      else
      {
        v21 = IMLogHandleForCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_1ABB60000, v21, OS_LOG_TYPE_INFO, "Downgrade: Committing phase 1", (uint8_t *)buf, 2u);
        }
        v29[0] = v6;
        v29[1] = 3221225472;
        v29[2] = sub_1ABBEC458;
        v29[3] = &unk_1E5AAF548;
        v29[4] = &v35;
        objc_msgSend(v5, "commitTransaction:", v29);
      }
      if (!v36[5])
      {
        v10 = IMLogHandleForCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_1ABB60000, v10, OS_LOG_TYPE_INFO, "Downgrade: Beginning to copy tables", (uint8_t *)buf, 2u);
        }
        memset(buf, 0, sizeof(buf));
        IMDSqlOperationInitAndCreateIfNeededWithPath((uint64_t)-[IMAbstractDatabaseArchiver sourcePath](self, "sourcePath"), buf);
        v28[0] = v6;
        v28[1] = 3221225472;
        v28[2] = sub_1ABBEC468;
        v28[3] = &unk_1E5AAF548;
        v28[4] = &v35;
        objc_msgSend(v5, "importDataFromWhitetailDatabaseWithSqlOperation:resultBlock:", buf, v28);
        IMDSqlOperationRelease((uint64_t)buf, v36 + 5);
        if (v36[5])
          goto LABEL_23;
        v27[0] = v6;
        v27[1] = 3221225472;
        v27[2] = sub_1ABBEC478;
        v27[3] = &unk_1E5AAF548;
        v27[4] = &v35;
        objc_msgSend(v5, "beginTransaction:", v27);
        if (v36[5])
          goto LABEL_23;
        v11 = IMLogHandleForCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v26 = 0;
          _os_log_impl(&dword_1ABB60000, v11, OS_LOG_TYPE_INFO, "Downgrade: Creating triggers", v26, 2u);
        }
        v25[0] = v6;
        v25[1] = 3221225472;
        v25[2] = sub_1ABBEC488;
        v25[3] = &unk_1E5AAF548;
        v25[4] = &v35;
        objc_msgSend(v5, "createTriggers:", v25);
        if (v36[5])
          goto LABEL_23;
        v12 = IMLogHandleForCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v26 = 0;
          _os_log_impl(&dword_1ABB60000, v12, OS_LOG_TYPE_INFO, "Downgrade: Updating Version", v26, 2u);
        }
        v24[0] = v6;
        v24[1] = 3221225472;
        v24[2] = sub_1ABBEC498;
        v24[3] = &unk_1E5AAF548;
        v24[4] = &v35;
        objc_msgSend(v5, "writeDatabaseVersion:resultBlock:", objc_msgSend(v5, "downgradesToVersion"), v24);
        if (v36[5])
        {
LABEL_23:
          objc_msgSend(v5, "revertTransaction:", &unk_1E5AAF288);
        }
        else
        {
          v23[0] = v6;
          v23[1] = 3221225472;
          v23[2] = sub_1ABBEC4AC;
          v23[3] = &unk_1E5AAF548;
          v23[4] = &v35;
          objc_msgSend(v5, "commitTransaction:", v23);
          v22 = IMLogHandleForCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v26 = 0;
            _os_log_impl(&dword_1ABB60000, v22, OS_LOG_TYPE_INFO, "Downgrade: Committing phase 2", v26, 2u);
          }
        }
      }
    }
  }
  if (objc_msgSend(v5, "isOpen"))
    objc_msgSend(v5, "close:", &unk_1E5AB9778);

  if (!v36[5])
  {
    v18 = IMLogHandleForCategory();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      goto LABEL_33;
    LOWORD(buf[0]) = 0;
    v15 = "Downgrade completed ok! :-D";
    v16 = v18;
    v17 = 2;
    goto LABEL_32;
  }
  if (IMOSLoggingEnabled())
  {
    v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = objc_msgSend((id)v36[5], "localizedDescription");
      LODWORD(buf[0]) = 138412290;
      *(_QWORD *)((char *)buf + 4) = v14;
      v15 = "Database downgrade failed with error: %@";
      v16 = v13;
      v17 = 12;
LABEL_32:
      _os_log_impl(&dword_1ABB60000, v16, OS_LOG_TYPE_INFO, v15, (uint8_t *)buf, v17);
    }
  }
LABEL_33:
  if (a3)
    (*((void (**)(id, BOOL))a3 + 2))(a3, v36[5] == 0);
  v19 = v36[5] == 0;
  _Block_object_dispose(&v35, 8);
  return v19;
}

@end
