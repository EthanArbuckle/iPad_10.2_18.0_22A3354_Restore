@implementation MODiagnosticsExtensionForFeedbackAssistant

- (id)attachmentsForParameters:(id)a3
{
  id v3;
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  id os_log;
  NSObject *v9;
  NSMutableArray *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v24;
  id v25;
  _QWORD v26[4];
  NSObject *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v3 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  v34 = 0;
  if (attachmentsForParameters__onceToken != -1)
    dispatch_once(&attachmentsForParameters__onceToken, &__block_literal_global);
  v4 = dispatch_semaphore_create(0);
  v5 = (void *)attachmentsForParameters__client;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = __71__MODiagnosticsExtensionForFeedbackAssistant_attachmentsForParameters___block_invoke_2;
  v26[3] = &unk_1000041C8;
  v28 = &v29;
  v6 = v4;
  v27 = v6;
  objc_msgSend(v5, "getSnapshotDictionaryForAnalyticsWithHandler:", v26);
  v7 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v6, v7))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MODiagnosticsExtensionForFeedbackAssistant attachmentsForParameters:].cold.1(v9);

  }
  v10 = objc_opt_new(NSMutableArray);
  v11 = v30[5];
  if (v11)
  {
    v25 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v11, 1, &v25));
    v13 = v25;
    v14 = v13;
    if (v12)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("config-%@.json"), v16));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/var/mobile/Library/com.apple.MomentsDiagnosticExtension/Temp/JournalingSuggestionConfiguration"), "stringByAppendingPathComponent:", v17));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v18, 0));

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v24 = v14;
      objc_msgSend(v20, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/mobile/Library/com.apple.MomentsDiagnosticExtension/Temp/JournalingSuggestionConfiguration"), 1, 0, &v24);
      v21 = v24;

      if (v21)
      {
        NSLog(CFSTR("Got an error: %@"), v21);
      }
      else
      {
        objc_msgSend(v12, "writeToURL:atomically:", v19, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[DEAttachmentItem attachmentWithPathURL:](DEAttachmentItem, "attachmentWithPathURL:", v19));
        objc_msgSend(v22, "setDeleteOnAttach:", &__kCFBooleanTrue);
        -[NSMutableArray addObject:](v10, "addObject:", v22);

      }
      v14 = v21;
    }
    else
    {
      NSLog(CFSTR("Got an error: %@"), v13);
    }

  }
  _Block_object_dispose(&v29, 8);

  return v10;
}

void __71__MODiagnosticsExtensionForFeedbackAssistant_attachmentsForParameters___block_invoke(id a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)MOPromptManager);
  v2 = (void *)attachmentsForParameters__client;
  attachmentsForParameters__client = (uint64_t)v1;

}

void __71__MODiagnosticsExtensionForFeedbackAssistant_attachmentsForParameters___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;

  v6 = a2;
  if (!a3)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)attachmentsForParameters:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Timed out when calling getSnapshotDictionaryForAnalyticsWithHandler", v1, 2u);
}

@end
