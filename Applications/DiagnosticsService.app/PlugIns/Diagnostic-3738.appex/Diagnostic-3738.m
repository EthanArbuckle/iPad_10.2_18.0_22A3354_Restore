void sub_1000030C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000030EC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000030FC(uint64_t a1)
{

}

id sub_100003104(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  DABackupRestoreLogLine *v5;
  DABackupRestoreEvent *v6;
  void *v7;
  void *v8;
  DABackupRestoreEvent *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((v4 & 1) == 0)
  {
    v5 = -[DABackupRestoreLogLine initWithLogLine:]([DABackupRestoreLogLine alloc], "initWithLogLine:", v3);
    if ((id)-[DABackupRestoreLogLine backupRestoreEventType](v5, "backupRestoreEventType") != (id)1000)
    {
LABEL_13:

      goto LABEL_14;
    }
    v6 = [DABackupRestoreEvent alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DABackupRestoreLogLine date](v5, "date"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DABackupRestoreLogLine eventSubType](v5, "eventSubType"));
    v9 = -[DABackupRestoreEvent initWithDate:eventSubType:successfulBackup:eventCode:](v6, "initWithDate:eventSubType:successfulBackup:eventCode:", v7, v8, -[DABackupRestoreLogLine didSucceed](v5, "didSucceed"), -[DABackupRestoreLogLine backupCode](v5, "backupCode"));

    if (-[DABackupRestoreEvent successfulBackup](v9, "successfulBackup"))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v11 = *(void **)(v10 + 40);
      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "date"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[DABackupRestoreEvent date](v9, "date"));
        objc_msgSend(v12, "timeIntervalSinceDate:", v13);
        v15 = v14;

        if (v15 >= 0.0)
          goto LABEL_8;
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      }
      objc_storeStrong((id *)(v10 + 40), v9);
    }
LABEL_8:
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v17 = *(void **)(v16 + 40);
    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "date"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[DABackupRestoreEvent date](v9, "date"));
      objc_msgSend(v18, "timeIntervalSinceDate:", v19);
      v21 = v20;

      if (v21 >= 0.0)
      {
LABEL_12:

        goto LABEL_13;
      }
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    }
    objc_storeStrong((id *)(v16 + 40), v9);
    goto LABEL_12;
  }
LABEL_14:

  return v4;
}

id stringOrNull(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = a1;
  v2 = v1;
  if (v1)
    v3 = v1;
  else
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v4 = v3;

  return v4;
}

id numberOrNull(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = a1;
  v2 = v1;
  if (v1)
    v3 = v1;
  else
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v4 = v3;

  return v4;
}

id objc_msgSend_backupCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backupCode");
}

id objc_msgSend_backupRestoreEventCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backupRestoreEventCode");
}

id objc_msgSend_backupRestoreEventType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backupRestoreEventType");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didSucceed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didSucceed");
}

id objc_msgSend_engine(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "engine");
}

id objc_msgSend_enumerateLogLinesWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateLogLinesWithBlock:");
}

id objc_msgSend_eventSubType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventSubType");
}

id objc_msgSend_fields(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fields");
}

id objc_msgSend_formatterWithType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formatterWithType:");
}

id objc_msgSend_initWithDate_eventSubType_successfulBackup_eventCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDate:eventSubType:successfulBackup:eventCode:");
}

id objc_msgSend_initWithLogIDs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLogIDs:");
}

id objc_msgSend_initWithLogLine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLogLine:");
}

id objc_msgSend_integerFromFieldAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerFromFieldAtIndex:");
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCancelled");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_parseLogsWithCollector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseLogsWithCollector:");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_sharedFormatter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedFormatter");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_successfulBackup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "successfulBackup");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}
