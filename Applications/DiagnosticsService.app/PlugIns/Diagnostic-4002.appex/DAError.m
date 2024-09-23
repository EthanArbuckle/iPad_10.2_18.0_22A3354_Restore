@implementation DAError

+ (BOOL)setError:(id *)a3 withCode:(int)a4 format:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v30;

  v7 = a5;
  if (v7)
    v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v7, &v30);
  else
    v8 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v10 = v9;
  if (v8)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, NSLocalizedDescriptionKey);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.FieldDiagnostics"), a4, v10));
  v12 = v11;
  if (a3)
  {
    if (!*a3)
    {
      *a3 = objc_retainAutorelease(v11);
      v28 = 1;
      goto LABEL_14;
    }
    v13 = DiagnosticLogHandleForCategory(3);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_100005898((uint64_t)v12, v14, v15, v16, v17, v18, v19, v20);
  }
  else
  {
    v21 = DiagnosticLogHandleForCategory(3);
    v14 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_100005830((uint64_t)v12, v14, v22, v23, v24, v25, v26, v27);
  }

  v28 = 0;
LABEL_14:

  return v28;
}

@end
