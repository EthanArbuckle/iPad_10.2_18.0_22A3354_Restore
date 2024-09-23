@implementation CSUError

+ (id)errorWithCode:(int64_t)a3 message:(id)a4
{
  objc_msgSend_errorWithCode_message_underlyingError_(a1, a2, a3, (uint64_t)a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)errorWithCode:(int64_t)a3 message:(id)a4 underlyingError:(id)a5
{
  void *v6;
  const char *v7;
  void *v8;

  objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x24BDBCE70], a2, (uint64_t)a4, (uint64_t)a4, (uint64_t)a5, *MEMORY[0x24BDD0FC8], a5, *MEMORY[0x24BDD1398], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v7, (uint64_t)CFSTR("com.apple.coresceneunderstanding"), a3, (uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)errorForMemoryAllocationFailure
{
  return (id)((uint64_t (*)(id, char *, _QWORD))MEMORY[0x24BEDD108])(a1, sel_errorForMemoryAllocationFailureWithLocalizedDescription_, 0);
}

+ (id)errorForMemoryAllocationFailureWithLocalizedDescription:(id)a3
{
  id v3;
  const char *v4;
  void *v5;
  void *v6;
  const char *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v5 = v3;
  if (v3)
  {
    v10 = *MEMORY[0x24BDD0FC8];
    v11[0] = v3;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v4, (uint64_t)v11, (uint64_t)&v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v7, (uint64_t)CFSTR("com.apple.coresceneunderstanding"), 4, (uint64_t)v6);
  }
  else
  {
    v6 = 0;
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v4, (uint64_t)CFSTR("com.apple.coresceneunderstanding"), 4, 0);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)errorForInternalErrorWithLocalizedDescription:(id)a3
{
  uint64_t v3;

  objc_msgSend_errorForInternalErrorWithLocalizedDescription_underlyingError_(a1, a2, (uint64_t)a3, 0, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)errorForInternalErrorWithLocalizedDescription:(id)a3 underlyingError:(id)a4
{
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;

  objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x24BDBCE70], a2, (uint64_t)a3, (uint64_t)a4, v4, *MEMORY[0x24BDD0FC8], a4, *MEMORY[0x24BDD1398], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v6, (uint64_t)CFSTR("com.apple.coresceneunderstanding"), 2, (uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)errorForInvalidArgumentWithLocalizedDescription:(id)a3
{
  uint64_t v3;

  objc_msgSend_errorWithCode_message_(a1, a2, 8, (uint64_t)a3, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)errorForInvalidArgument:(id)a3 named:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = v6;
  objc_opt_class();
  v13 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v10, (uint64_t)CFSTR("\"%@\"), v11, v12, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend_stringWithFormat_(v8, v10, (uint64_t)CFSTR("argument %@ has an invalid value of %@"), v11, v12, v7, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_errorForInvalidArgumentWithLocalizedDescription_(a1, v15, (uint64_t)v14, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)errorForInvalidModelWithLocalizedDescription:(id)a3
{
  uint64_t v3;

  objc_msgSend_errorForInvalidModelWithLocalizedDescription_underlyingError_(a1, a2, (uint64_t)a3, 0, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)errorForInvalidModelWithLocalizedDescription:(id)a3 underlyingError:(id)a4
{
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = *MEMORY[0x24BDD0FC8];
  v11[0] = v4;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v5, (uint64_t)v11, (uint64_t)&v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v7, (uint64_t)CFSTR("com.apple.coresceneunderstanding"), 9, (uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)errorForUnknownErrorWithLocalizedDescription:(id)a3
{
  id v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v9 = *MEMORY[0x24BDD0FC8];
  v10[0] = v3;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v4, (uint64_t)v10, (uint64_t)&v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v6, (uint64_t)CFSTR("com.apple.coresceneunderstanding"), 5, (uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)errorForDataUnavailableWithLocalizedDescription:(id)a3
{
  uint64_t v3;

  objc_msgSend_errorForDataUnavailableWithLocalizedDescription_underlyingError_(a1, a2, (uint64_t)a3, 0, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)errorForDataUnavailableWithLocalizedDescription:(id)a3 underlyingError:(id)a4
{
  objc_msgSend_errorWithCode_message_underlyingError_(a1, a2, 10, (uint64_t)a3, (uint64_t)a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)errorForEspressoReturnStatus:(int)a3 localizedDescription:(id)a4
{
  uint64_t v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t status_string;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  objc_msgSend_string(MEMORY[0x24BDD16A8], v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v11, v12, (uint64_t)CFSTR("%d"), v13, v14, v4);
  status_string = espresso_get_status_string();
  if (status_string)
    objc_msgSend_appendFormat_(v11, v16, (uint64_t)CFSTR(": %s"), v18, v19, status_string);
  if (objc_msgSend_length(v6, v16, v17, v18, v19))
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v20, (uint64_t)CFSTR("%@ (%@)"), v21, v22, v6, v11);
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = v11;
  }
  v24 = v23;

  objc_msgSend_errorForInternalErrorWithLocalizedDescription_(a1, v25, (uint64_t)v24, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

+ (id)errorForEspressoErrorInfo:(id)a3 localizedDescription:(id)a4
{
  char *var2;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  __CFString *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  var2 = a3.var2;
  v5 = *(_QWORD *)&a3.var0;
  v10 = a4;
  v11 = (void *)MEMORY[0x24BDD17C8];
  if (v5 >= 3)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v7, (uint64_t)CFSTR("espresso plan phase %ul"), v8, v9, v5);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = off_250B0E1D8[(int)v5];
  }
  objc_msgSend_stringWithFormat_(v11, v7, (uint64_t)CFSTR("%s (%@)"), v8, v9, var2, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v14, (uint64_t)CFSTR("%@ - %@"), v15, v16, v10, v13);
    v17 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v17;
  }
  objc_msgSend_errorForInternalErrorWithLocalizedDescription_(a1, v14, (uint64_t)v13, v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)errorForFailedEspressoPlan:(void *)a3 localizedDescription:(id)a4
{
  id v5;
  uint64_t error_info;
  const char *v7;
  void *v8;

  v5 = a4;
  error_info = espresso_plan_get_error_info();
  objc_msgSend_errorForEspressoErrorInfo_localizedDescription_(a1, v7, error_info, (uint64_t)v7, (uint64_t)v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)errorForOSStatus:(int)a3 localizedDescription:(id)a4
{
  uint64_t v4;
  void *v6;
  const char *v7;
  void *v8;

  objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x24BDBCE70], a2, (uint64_t)a4, (uint64_t)a4, v4, *MEMORY[0x24BDD0FC8], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v7, *MEMORY[0x24BDD1100], a3, (uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)errorForUnsupportedRevision:(id)a3
{
  uint64_t v3;

  objc_msgSend_errorWithCode_message_(a1, a2, 13, (uint64_t)a3, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)errorForDatabase:(id)a3
{
  uint64_t v3;

  objc_msgSend_errorWithCode_message_(a1, a2, 14, (uint64_t)a3, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)errorForDictionaryDeserialization:(id)a3
{
  uint64_t v3;

  objc_msgSend_errorWithCode_message_(a1, a2, 16, (uint64_t)a3, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)logInternalError:(id)a3
{
  id v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  _DWORD v27[2];
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    sub_23A016E78();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_msgSend_code(v3, v5, v6, v7, v8);
      objc_msgSend_localizedDescription(v3, v10, v11, v12, v13);
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v18 = objc_msgSend_cStringUsingEncoding_(v14, v15, 1, v16, v17);
      objc_msgSend_localizedFailureReason(v3, v19, v20, v21, v22);
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v27[0] = 67109634;
      v27[1] = v9;
      v28 = 2080;
      v29 = v18;
      v30 = 2080;
      v31 = objc_msgSend_cStringUsingEncoding_(v23, v24, 1, v25, v26);
      _os_log_error_impl(&dword_239FE9000, v4, OS_LOG_TYPE_ERROR, "Internal Error Occurred. Code: %d; description: %s; reason: %s",
        (uint8_t *)v27,
        0x1Cu);

    }
  }

}

+ (id)CSUAssert:(BOOL)a3 log:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (a3)
  {
    v6 = 0;
  }
  else
  {
    sub_23A016E78();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_retainAutorelease(v5);
      v13 = objc_msgSend_UTF8String(v8, v9, v10, v11, v12);
      sub_23A09D960(v13, (uint64_t)v18, v7);
    }

    objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v14, (uint64_t)v5, v15, v16);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (BOOL)CSUAssert:(BOOL)a3 logError:(id *)a4 withMessage:(id)a5
{
  void *v6;
  void *v7;

  objc_msgSend_CSUAssert_log_(CSUError, a2, a3, (uint64_t)a5, (uint64_t)a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a4)
    *a4 = objc_retainAutorelease(v6);

  return v7 == 0;
}

+ (id)errorFromErrors:(id)a3 And:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;

  v5 = a3;
  v6 = a4;
  v11 = v6;
  if (!v5)
  {
    if (!v6)
    {
      v26 = 0;
      goto LABEL_9;
    }
    v27 = v6;
    goto LABEL_7;
  }
  if (!v6)
  {
    v27 = v5;
LABEL_7:
    v26 = v27;
    goto LABEL_9;
  }
  v12 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_localizedDescription(v5, v7, v8, v9, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedDescription(v11, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v12, v19, (uint64_t)CFSTR("%@ | %@"), v20, v21, v13, v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorForInternalErrorWithLocalizedDescription_(CSUError, v23, (uint64_t)v22, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v26;
}

@end
