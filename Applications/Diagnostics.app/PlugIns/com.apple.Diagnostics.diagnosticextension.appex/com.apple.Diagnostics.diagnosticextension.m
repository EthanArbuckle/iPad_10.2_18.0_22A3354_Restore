void sub_100002C70(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100002EB4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002C70((void *)&_mh_execute_header, a2, a3, "could not find powerlog container (%llu)...", a5, a6, a7, a8, 0);
  sub_100002C80();
}

void sub_100002F1C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not get JSON object for ELS.", v1, 2u);
}

void sub_100002F5C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002C70((void *)&_mh_execute_header, a2, a3, "Unable to write ELS file = %@", a5, a6, a7, a8, 2u);
  sub_100002C80();
}

void sub_100002FC0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002C70((void *)&_mh_execute_header, a2, a3, "Unable to delete stale ELS file = %@", a5, a6, a7, a8, 2u);
  sub_100002C80();
}

void sub_100003024(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Field Diagnostics Logs did not collect properly: [%@]", (uint8_t *)&v2, 0xCu);
}

id objc_msgSend_JSONObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "JSONObject");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend__addAWDLogFilesToArchive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addAWDLogFilesToArchive:");
}

id objc_msgSend__addCrashLogFilesToArchive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addCrashLogFilesToArchive:");
}

id objc_msgSend__addEnhancedLoggingStateFilesToArchive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addEnhancedLoggingStateFilesToArchive:");
}

id objc_msgSend__addFiles_archive_lastPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addFiles:archive:lastPathComponent:");
}

id objc_msgSend__addLaunchdLogFilesToArchive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addLaunchdLogFilesToArchive:");
}

id objc_msgSend__addMobileGeneralLogFilesToArchive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addMobileGeneralLogFilesToArchive:");
}

id objc_msgSend__addPowerLogFilesToArchive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addPowerLogFilesToArchive:");
}

id objc_msgSend__addRootGeneralLogFilesToArchive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addRootGeneralLogFilesToArchive:");
}

id objc_msgSend_addLogTypes_archive_prefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addLogTypes:archive:prefix:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addURL_prefix_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addURL:prefix:error:");
}

id objc_msgSend_archive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archive");
}

id objc_msgSend_archiveAsTempDirectoryWithName_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archiveAsTempDirectoryWithName:error:");
}

id objc_msgSend_archiveAsTempFileWithTemplate_suffix_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archiveAsTempFileWithTemplate:suffix:error:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attachmentWithPathURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attachmentWithPathURL:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_snapshot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "snapshot");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}
