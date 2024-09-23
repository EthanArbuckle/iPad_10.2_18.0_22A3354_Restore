void sub_10000201C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000204C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000205C(uint64_t a1)
{

}

void sub_100002064(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  unsigned __int8 v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id obj;
  uint8_t buf[4];
  id v21;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    v4 = DiagnosticLogHandleForCategory(3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Powerlog] Adding powerlog archive file: %@", buf, 0xCu);
    }

    v6 = *(void **)(a1 + 40);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v7 + 40);
    v8 = objc_msgSend(v6, "addURL:prefix:error:", v3, CFSTR("PLArchive"), &obj);
    objc_storeStrong((id *)(v7 + 40), obj);
    if ((v8 & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      v9 = DiagnosticLogHandleForCategory(3);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_100002D74(a1 + 48, v10, v11, v12, v13, v14, v15, v16);

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[DASharedTestStatusHelper statusCodeForArchiveError:](DASharedTestStatusHelper, "statusCodeForArchiveError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "result"));
      objc_msgSend(v18, "setStatusCode:", v17);

    }
  }

}

void sub_100002C6C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100002C7C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100002C9C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002C6C((void *)&_mh_execute_header, a2, a3, "[ERROR] Archive failed with error: %@", a5, a6, a7, a8, 2u);
  sub_100002C8C();
}

void sub_100002D08(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002C6C((void *)&_mh_execute_header, a2, a3, "[ERROR] Failed to find current log with error: %@", a5, a6, a7, a8, 2u);
  sub_100002C8C();
}

void sub_100002D74(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002C6C((void *)&_mh_execute_header, a2, a3, "[ERROR] Failed to find logs with error: %@", a5, a6, a7, a8, 2u);
  sub_100002C8C();
}

void sub_100002DE4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002C7C((void *)&_mh_execute_header, a1, a3, "[ERROR] Failed to generate current powerlog. PLQueryRegistered() returned a nil path.", a5, a6, a7, a8, 0);
  sub_100002C94();
}

void sub_100002E14(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002C7C((void *)&_mh_execute_header, a1, a3, "[ERROR] Failed to create temporary directories.", a5, a6, a7, a8, 0);
  sub_100002C94();
}

void sub_100002E44(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002C7C((void *)&_mh_execute_header, a1, a3, "[ERROR] Failed to get archived logs.", a5, a6, a7, a8, 0);
  sub_100002C94();
}

void sub_100002E74(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002C6C((void *)&_mh_execute_header, a2, a3, "[ERROR] Cannot open write stream for file: %@", a5, a6, a7, a8, 2u);
  sub_100002C8C();
}

void sub_100002ED8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002C6C((void *)&_mh_execute_header, a2, a3, "[Archive] Failed to archive file: %@", a5, a6, a7, a8, 2u);
  sub_100002C8C();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend_addURL_prefix_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addURL:prefix:error:");
}

id objc_msgSend_archive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archive");
}

id objc_msgSend_archiveAsTempFileWithTemplate_directory_suffix_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archiveAsTempFileWithTemplate:directory:suffix:error:");
}

id objc_msgSend_archiveLogFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archiveLogFile:");
}

id objc_msgSend_archivesDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archivesDirectory");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_collectLogFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectLogFile");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createWorkingDirectories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createWorkingDirectories");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_enumerateArchivedPowerLogsWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateArchivedPowerLogsWithBlock:");
}

id objc_msgSend_enumeratorAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCancelled");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextObject");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_setArchivesDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setArchivesDirectory:");
}

id objc_msgSend_setFiles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFiles:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFormat:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setWorkingDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWorkingDirectory:");
}

id objc_msgSend_sleepForTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sleepForTimeInterval:");
}

id objc_msgSend_statusCodeForArchiveError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusCodeForArchiveError:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_workingDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workingDirectory");
}

id objc_msgSend_writeCurrentPowerLog(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeCurrentPowerLog");
}
