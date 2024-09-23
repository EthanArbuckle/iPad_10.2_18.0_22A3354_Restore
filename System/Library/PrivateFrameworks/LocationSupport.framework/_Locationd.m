@implementation _Locationd

+ (BOOL)isSupported
{
  return 0;
}

+ (id)getSilo
{
  return 0;
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  int v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!byte_1ECE24D00)
    _Exit(0);
  v7 = a4 + 1;
  if (v7 < objc_msgSend(v5, "count"))
  {
    if (qword_1ECE24CB0 != -1)
      dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
    v8 = qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1A19F4000, v8, OS_LOG_TYPE_FAULT, "_Locationd should come last?!", (uint8_t *)&v12, 2u);
    }
    objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "becameFatallyBlocked:index:", v6, v7);

  }
  if (qword_1ECE24CB0 != -1)
    dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
  v10 = qword_1ECE24CA8;
  if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_FAULT))
  {
    v12 = 68289282;
    v13 = 0;
    v14 = 2082;
    v15 = &unk_1A1A18FAF;
    v16 = 2114;
    v17 = v6;
    _os_log_impl(&dword_1A19F4000, v10, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"locationd became blocked, non-fatally because internal install\", \"ImplicatedServicesSoFar\":%{public, location:escape_only}@}", (uint8_t *)&v12, 0x1Cu);
    if (qword_1ECE24CB0 != -1)
      dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
  }
  v11 = qword_1ECE24CA8;
  if (os_signpost_enabled((os_log_t)qword_1ECE24CA8))
  {
    v12 = 68289282;
    v13 = 0;
    v14 = 2082;
    v15 = &unk_1A1A18FAF;
    v16 = 2114;
    v17 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A19F4000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "locationd became blocked, non-fatally because internal install", "{\"msg%{public}.0s\":\"locationd became blocked, non-fatally because internal install\", \"ImplicatedServicesSoFar\":%{public, location:escape_only}@}", (uint8_t *)&v12, 0x1Cu);
  }

}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (qword_1ECE24CB0 != -1)
    goto LABEL_11;
  while (1)
  {
    v7 = qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v11 = 0;
      v12 = 2082;
      v13 = &unk_1A1A18FAF;
      v14 = 2082;
      v15 = "assert";
      v16 = 2081;
      v17 = "__objc_no";
      _os_log_impl(&dword_1A19F4000, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Don't message _Locationd\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECE24CB0 != -1)
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
    }
    v8 = qword_1ECE24CA8;
    if (os_signpost_enabled((os_log_t)qword_1ECE24CA8))
    {
      *(_DWORD *)buf = 68289539;
      v11 = 0;
      v12 = 2082;
      v13 = &unk_1A1A18FAF;
      v14 = 2082;
      v15 = "assert";
      v16 = 2081;
      v17 = "__objc_no";
      _os_signpost_emit_with_name_impl(&dword_1A19F4000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Don't message _Locationd", "{\"msg%{public}.0s\":\"Don't message _Locationd\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_1ECE24CB0 != -1)
        dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
    }
    v9 = qword_1ECE24CA8;
    if (os_log_type_enabled((os_log_t)qword_1ECE24CA8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v11 = 0;
      v12 = 2082;
      v13 = &unk_1A1A18FAF;
      v14 = 2082;
      v15 = "assert";
      v16 = 2081;
      v17 = "__objc_no";
      _os_log_impl(&dword_1A19F4000, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Don't message _Locationd\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
    __break(1u);
LABEL_11:
    dispatch_once(&qword_1ECE24CB0, &unk_1E45FBE90);
  }
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end
