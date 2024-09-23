@implementation IMLogging

+ (BOOL)loggingEnabledForLevel:(int)a3
{
  return 1;
}

+ (id)stringForDate
{
  return IMCreateStringFromDate(0);
}

+ (void)logAtLevel:(int)a3 type:(id)a4 category:(id)a5 format:(id)a6
{
  uint64_t v6;

  objc_msgSend_logAtLevel_type_category_insertProcessInfo_format_arguments_(a1, a2, *(uint64_t *)&a3, (uint64_t)a4, a5, 1, a6, &v6);
}

+ (void)logAtLevel:(int)a3 type:(id)a4 category:(id)a5 insertProcessInfo:(BOOL)a6 format:(id)a7
{
  uint64_t v7;

  objc_msgSend_logAtLevel_type_category_insertProcessInfo_format_arguments_(a1, a2, *(uint64_t *)&a3, (uint64_t)a4, a5, a6, a7, &v7);
}

+ (void)logAtLevel:(int)a3 type:(id)a4 category:(id)a5 format:(id)a6 arguments:(char *)a7
{
  objc_msgSend_logAtLevel_type_category_insertProcessInfo_format_arguments_(a1, a2, *(uint64_t *)&a3, (uint64_t)a4, a5, 1, a6, a7);
}

+ (void)logAtLevel:(int)a3 type:(id)a4 category:(id)a5 insertProcessInfo:(BOOL)a6 simpleLogString:(id)a7 format:(id)a8 arguments:(char *)a9 time:(unint64_t)a10
{
  _BOOL4 v12;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  __CFString *FormatString;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __CFString *v31;
  id v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  id v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  id v52;

  v12 = a6;
  v52 = a5;
  v15 = a7;
  v16 = a8;
  v17 = a4;
  IMCreateStringFromDate(a10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v22 = (void *)objc_msgSend_initWithString_(v19, v20, (uint64_t)v18, v21);
  if (v15)
    FormatString = (__CFString *)v15;
  else
    FormatString = _IMFastCreateFormatString(v16, a9);
  v31 = FormatString;
  if (dword_1EE1DCEA8 >= a3)
    _IMLog(CFSTR("%@"), v24, v25, v26, v27, v28, v29, v30, (char)FormatString);
  if (qword_1EE1DDD30 != -1)
    dispatch_once(&qword_1EE1DDD30, &unk_1E2C433E8);
  v32 = (id)qword_1EE1DDD28;
  if (objc_msgSend_length(v52, v33, v34, v35))
  {
    v38 = v52;

    v32 = v38;
  }
  objc_msgSend_stringByAppendingString_(v32, v36, (uint64_t)CFSTR(".log"), v37);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendString_(v22, v40, (uint64_t)CFSTR(" "), v41);
  if (v12)
  {
    v44 = qword_1EE1DDD28;
    v45 = getpid();
    objc_msgSend_appendFormat_(v22, v46, (uint64_t)CFSTR("%@[%i]: %@"), v47, v44, v45, v31);
  }
  else
  {
    objc_msgSend_appendString_(v22, v42, (uint64_t)v31, v43);
  }
  objc_msgSend_appendString_(v22, v48, (uint64_t)CFSTR("\n"), v49);
  objc_msgSend_logString_toFolder_toFileNamed_(a1, v50, (uint64_t)v22, (uint64_t)v17, v39);

}

+ (void)logAtLevel:(int)a3 type:(id)a4 category:(id)a5 insertProcessInfo:(BOOL)a6 format:(id)a7 arguments:(char *)a8
{
  objc_msgSend_logAtLevel_type_category_insertProcessInfo_simpleLogString_format_arguments_time_(a1, a2, *(uint64_t *)&a3, (uint64_t)a4, a5, a6, 0, a7, a8, 0);
}

+ (void)logAtLevel:(int)a3 type:(id)a4 category:(id)a5 insertProcessInfo:(BOOL)a6 simpleLogString:(id)a7 time:(unint64_t)a8
{
  objc_msgSend_logAtLevel_type_category_insertProcessInfo_simpleLogString_format_arguments_time_(a1, a2, *(uint64_t *)&a3, (uint64_t)a4, a5, a6, a7, 0, 0, a8);
}

+ (void)logAtLevel:(int)a3 type:(id)a4 category:(id)a5 insertProcessInfo:(BOOL)a6 simpleLogString:(id)a7
{
  objc_msgSend_logAtLevel_type_category_insertProcessInfo_simpleLogString_format_arguments_time_(a1, a2, *(uint64_t *)&a3, (uint64_t)a4, a5, a6, a7, 0, 0, 0);
}

+ (id)logFileDirectory
{
  if (qword_1EE1DDD38 != -1)
    dispatch_once(&qword_1EE1DDD38, &unk_1E2C45CA0);
  return (id)qword_1EE1DDD40;
}

+ (id)dateFormatter
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;

  objc_msgSend_currentThread(MEMORY[0x1E0CB3978], a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_threadDictionary(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKey_(v8, v9, (uint64_t)CFSTR("_IMLoggingDateFormatter"), v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend_setDateFormat_(v11, v12, (uint64_t)CFSTR("MM/dd/YY HH:mm:ss"), v13);
    v14 = objc_alloc(MEMORY[0x1E0C99DC8]);
    v17 = (void *)objc_msgSend_initWithLocaleIdentifier_(v14, v15, (uint64_t)CFSTR("en_US"), v16);
    objc_msgSend_setLocale_(v11, v18, (uint64_t)v17, v19);
    objc_msgSend_setObject_forKey_(v8, v20, (uint64_t)v11, (uint64_t)CFSTR("_IMLoggingDateFormatter"));

  }
  return v11;
}

+ (id)timeFormatter
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;

  objc_msgSend_currentThread(MEMORY[0x1E0CB3978], a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_threadDictionary(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKey_(v8, v9, (uint64_t)CFSTR("_IMLoggingTimeFormatter"), v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend_setDateFormat_(v11, v12, (uint64_t)CFSTR("HH:mm:ss"), v13);
    v14 = objc_alloc(MEMORY[0x1E0C99DC8]);
    v17 = (void *)objc_msgSend_initWithLocaleIdentifier_(v14, v15, (uint64_t)CFSTR("en_US"), v16);
    objc_msgSend_setLocale_(v11, v18, (uint64_t)v17, v19);
    objc_msgSend_setObject_forKey_(v8, v20, (uint64_t)v11, (uint64_t)CFSTR("_IMLoggingTimeFormatter"));

  }
  return v11;
}

+ (void)logString:(id)a3 toFolder:(id)a4 toFileNamed:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (qword_1EE1DDD60 != -1)
    dispatch_once(&qword_1EE1DDD60, &unk_1E2C45CE8);
  v11 = qword_1EE1DDD58;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1906A2510;
  v15[3] = &unk_1E2C45CC8;
  v16 = v9;
  v17 = v10;
  v18 = v8;
  v19 = a1;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async(v11, v15);

}

+ (void)enableConsoleLoggingForLevel:(int)a3
{
  dword_1EE1DCEA8 = a3;
}

@end
