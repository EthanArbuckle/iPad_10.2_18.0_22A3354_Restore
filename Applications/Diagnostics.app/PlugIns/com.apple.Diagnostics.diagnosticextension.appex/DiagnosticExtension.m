@implementation DiagnosticExtension

- (id)attachmentsForParameters:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  id v19;
  id v20;
  id v21;

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DSMutableArchive archive](DSMutableArchive, "archive"));
  v21 = v5;
  +[LogArchiveAggregator addLogTypes:archive:prefix:](LogArchiveAggregator, "addLogTypes:archive:prefix:", 238, &v21, CFSTR("FieldDiagnosticsLogs"));
  v6 = v21;

  if (v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("shouldCreateTarBall")));
    if (v7 && (v8 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v7, v8) & 1) != 0))
    {
      v9 = objc_msgSend(v7, "BOOLValue");

      if ((v9 & 1) == 0)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("FieldDiagnosticsLogs"), "stringByAppendingString:", CFSTR(".XXXXXX")));
        v19 = 0;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "archiveAsTempDirectoryWithName:error:", v10, &v19));
        v12 = v19;

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URLByAppendingPathComponent:", CFSTR("FieldDiagnosticsLogs")));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[DEAttachmentItem attachmentWithPathURL:](DEAttachmentItem, "attachmentWithPathURL:", v13));

        goto LABEL_8;
      }
    }
    else
    {

    }
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("FieldDiagnosticsLogs"), "stringByAppendingString:", CFSTR(".XXXXXX")));
  v20 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "archiveAsTempFileWithTemplate:suffix:error:", v15, CFSTR(".tgz"), &v20));
  v12 = v20;

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[DEAttachmentItem attachmentWithPathURL:](DEAttachmentItem, "attachmentWithPathURL:", v11));
LABEL_8:
  objc_msgSend(v4, "addObject:", v14);

  if (v12)
  {
    v16 = DiagnosticLogHandleForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_100003024((uint64_t)v12, v17);

  }
  return v4;
}

@end
