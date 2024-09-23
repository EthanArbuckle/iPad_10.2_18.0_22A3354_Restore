@implementation OSDError

+ (BOOL)setError:(id *)a3 withDomain:(id)a4 withCode:(int)a5
{
  return objc_msgSend(a1, "setError:withDomain:withCode:format:", a3, a4, *(_QWORD *)&a5, 0);
}

+ (BOOL)setError:(id *)a3 withDomain:(id)a4 withCode:(int)a5 format:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v33;

  v9 = a4;
  v10 = a6;
  if (v10)
    v11 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v10, &v33);
  else
    v11 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v13 = v12;
  if (v11)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, NSLocalizedDescriptionKey);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v9, a5, v13));
  v15 = v14;
  if (a3)
  {
    if (!*a3)
    {
      *a3 = objc_retainAutorelease(v14);
      v31 = 1;
      goto LABEL_14;
    }
    v16 = DiagnosticLogHandleForCategory(3);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_100005B38((uint64_t)v15, v17, v18, v19, v20, v21, v22, v23);
  }
  else
  {
    v24 = DiagnosticLogHandleForCategory(3);
    v17 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_100005AD0((uint64_t)v15, v17, v25, v26, v27, v28, v29, v30);
  }

  v31 = 0;
LABEL_14:

  return v31;
}

@end
