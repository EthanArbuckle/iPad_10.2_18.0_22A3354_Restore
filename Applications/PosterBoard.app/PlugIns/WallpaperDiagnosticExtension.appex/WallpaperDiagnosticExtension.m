void sub_100003714(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error Exporting Poster store: %@", (uint8_t *)&v1, 0xCu);
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_attachmentWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attachmentWithPath:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_exportCurrentDataStoreToURL_options_sandboxToken_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exportCurrentDataStoreToURL:options:sandboxToken:error:");
}

id objc_msgSend_exportDataStoreWithOptions_storingAt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exportDataStoreWithOptions:storingAt:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_fileURLWithPath_relativeToURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:relativeToURL:");
}

id objc_msgSend_initWithPercentComplete_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPercentComplete:");
}

id objc_msgSend_initWithPercentComplete_withEstimatedTimeRemaining_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPercentComplete:withEstimatedTimeRemaining:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_posterDiagnosticsLogsPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "posterDiagnosticsLogsPath");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_setDeleteOnAttach_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeleteOnAttach:");
}

id objc_msgSend_setDisplayName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisplayName:");
}

id objc_msgSend_setStatusString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusString:");
}

id objc_msgSend_setStripContentsOfConfigurations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStripContentsOfConfigurations:");
}

id objc_msgSend_setStripDescriptors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStripDescriptors:");
}

id objc_msgSend_setStripScreenshots_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStripScreenshots:");
}


    objc_msgSend(v21, "setDisplayName:", v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    objc_msgSend(v21, "setDeleteOnAttach:", v22);

    -[NSMutableArray addObject:](v8, "addObject:", v21);
  }
  v23 = objc_msgSend(objc_alloc((Class)DECollectionProgress), "initWithPercentComplete:", 100.0);
  v6[2](v6, v23);

  return v8;
}

@end
