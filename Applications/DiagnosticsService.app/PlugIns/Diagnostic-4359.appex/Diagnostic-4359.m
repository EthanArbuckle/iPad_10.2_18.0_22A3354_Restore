id archiveFiles(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unsigned __int8 v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[DSMutableArchive archive](DSMutableArchive, "archive"));
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v9 = v5;
  v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v41;
    while (2)
    {
      v13 = 0;
      v14 = v7;
      do
      {
        if (*(_QWORD *)v41 != v12)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v13);
        v39 = v14;
        v16 = objc_msgSend(v8, "addURL:error:", v15, &v39);
        v7 = v39;

        if ((v16 & 1) == 0)
        {
          v29 = DiagnosticLogHandleForCategory(0);
          v30 = objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            sub_10000331C((uint64_t)v7, v30, v31, v32, v33, v34, v35, v36);

          v22 = v9;
          goto LABEL_15;
        }
        v13 = (char *)v13 + 1;
        v14 = v7;
      }
      while (v11 != v13);
      v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (v11)
        continue;
      break;
    }
  }
  v17 = v7;

  v18 = DKTemporaryDirectoryURL();
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v38 = v7;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "archiveAsTempFileWithTemplate:directory:suffix:error:", v6, v19, CFSTR(".tar.gz"), &v38));
  v7 = v38;

  if (!v20)
  {
    v21 = DiagnosticLogHandleForCategory(0);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_1000032B4((uint64_t)v7, v22, v23, v24, v25, v26, v27, v28);
LABEL_15:

    v20 = 0;
  }

  return v20;
}

void sub_1000029A8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100002B44(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  unsigned int v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  unsigned __int8 v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  id v52;
  uint64_t v53;
  uint8_t buf[4];
  id v55;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    if (v6)
    {
      v7 = DiagnosticLogHandleForCategory(3);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v55 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "WIS result: %@", buf, 0xCu);
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_extractFilePaths:", v6));
      v10 = v9;
      if (!v9)
      {
        v13 = 0;
LABEL_24:

        goto LABEL_25;
      }
      v11 = archiveFiles(v9, CFSTR("com.apple.Diagnostics.4359.XXXXXXXX"), 0);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)v12;
      if (!v12)
        goto LABEL_24;
      v53 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v53, 1));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "result"));
      objc_msgSend(v15, "setFiles:", v14);

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "result"));
      objc_msgSend(v16, "setStatusCode:", &off_100004270);

      if (!objc_msgSend(*(id *)(a1 + 32), "copyForSyncing"))
        goto LABEL_24;
      v17 = DiagnosticLogHandleForCategory(3);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Copying archive for syncing.", buf, 2u);
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v52 = 0;
      v20 = objc_msgSend(v19, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs"), 1, 0, &v52);
      v21 = v52;

      if (v20)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs"), "stringByAppendingPathComponent:", v22));
        v24 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v23));

        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v51 = v21;
        v26 = objc_msgSend(v25, "copyItemAtURL:toURL:error:", v13, v24, &v51);
        v27 = v51;

        if ((v26 & 1) == 0)
        {
          v28 = DiagnosticLogHandleForCategory(3);
          v29 = objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            sub_1000033E8((uint64_t)v27, v29, v30, v31, v32, v33, v34, v35);

        }
      }
      else
      {
        v44 = DiagnosticLogHandleForCategory(3);
        v24 = objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          sub_10000344C((uint64_t)v21, v24, v45, v46, v47, v48, v49, v50);
        v27 = v21;
      }

    }
    else
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "result"));
      objc_msgSend(v36, "setStatusCode:", &off_100004258);

      v37 = DiagnosticLogHandleForCategory(3);
      v27 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_100003384((uint64_t)v5, v27, v38, v39, v40, v41, v42, v43);
      v13 = 0;
      v10 = 0;
    }

    goto LABEL_24;
  }
LABEL_25:
  objc_msgSend(*(id *)(a1 + 32), "setFinished:", 1);

}

void sub_100003234(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000032B4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000029A8((void *)&_mh_execute_header, a2, a3, "ERROR archiving logs: %@", a5, a6, a7, a8, 2u);
}

void sub_10000331C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000029A8((void *)&_mh_execute_header, a2, a3, "ERROR finding log(s): %@", a5, a6, a7, a8, 2u);
}

void sub_100003384(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000029A8((void *)&_mh_execute_header, a2, a3, "ERROR retrieving logs: %@", a5, a6, a7, a8, 2u);
  sub_10000324C();
}

void sub_1000033E8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000029A8((void *)&_mh_execute_header, a2, a3, "Could not copy file: %@", a5, a6, a7, a8, 2u);
  sub_10000324C();
}

void sub_10000344C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000029A8((void *)&_mh_execute_header, a2, a3, "Could not create directory: %@", a5, a6, a7, a8, 2u);
  sub_10000324C();
}

void sub_1000034B0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003234((void *)&_mh_execute_header, a1, a3, "ERROR WIS DiagnosticsFileArray not found in data!", a5, a6, a7, a8, 0);
  sub_100003244();
}

void sub_1000034E0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003234((void *)&_mh_execute_header, a1, a3, "ERROR WIS DiagnosticsFileArray is empty!", a5, a6, a7, a8, 0);
  sub_100003244();
}

void sub_100003510(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003234((void *)&_mh_execute_header, a1, a3, "ERROR WIS DiagnosticsFileArray is not an array!", a5, a6, a7, a8, 0);
  sub_100003244();
}

id objc_msgSend__extractFilePaths_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_extractFilePaths:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addURL:error:");
}

id objc_msgSend_archive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archive");
}

id objc_msgSend_archiveAsTempFileWithTemplate_directory_suffix_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archiveAsTempFileWithTemplate:directory:suffix:error:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_copyForSyncing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyForSyncing");
}

id objc_msgSend_copyItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyItemAtURL:toURL:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCancelled");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_setCopyForSyncing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCopyForSyncing:");
}

id objc_msgSend_setFiles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFiles:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}
