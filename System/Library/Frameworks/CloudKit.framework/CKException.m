@implementation CKException

- (CKException)initWithCode:(int)a3 format:(id)a4
{
  uint64_t v5;

  return (CKException *)objc_msgSend_initWithCode_format_args_(self, a2, *(uint64_t *)&a3, (uint64_t)a4, &v5);
}

- (CKException)initWithCode:(int)a3 format:(id)a4 args:(char *)a5
{
  uint64_t v6;
  objc_class *v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  CKException *v18;
  objc_super v20;
  const __CFString *v21;
  _QWORD v22[2];

  v6 = *(_QWORD *)&a3;
  v22[1] = *MEMORY[0x1E0C80C00];
  v8 = (objc_class *)MEMORY[0x1E0CB3940];
  v9 = a4;
  v10 = [v8 alloc];
  v12 = (void *)objc_msgSend_initWithFormat_arguments_(v10, v11, (uint64_t)v9, (uint64_t)a5);

  v21 = CFSTR("CKErrorCode");
  objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v13, v6, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v16, (uint64_t)v22, (uint64_t)&v21, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v20.receiver = self;
  v20.super_class = (Class)CKException;
  v18 = -[CKException initWithName:reason:userInfo:](&v20, sel_initWithName_reason_userInfo_, CFSTR("CKException"), v12, v17);

  return v18;
}

- (CKException)initWithName:(id)a3 format:(id)a4
{
  uint64_t v5;

  return (CKException *)objc_msgSend_initWithName_format_args_(self, a2, (uint64_t)a3, (uint64_t)a4, &v5);
}

- (CKException)initWithName:(id)a3 format:(id)a4 args:(char *)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  void *v13;
  CKException *v14;
  objc_super v16;

  v8 = (objc_class *)MEMORY[0x1E0CB3940];
  v9 = a4;
  v10 = a3;
  v11 = [v8 alloc];
  v13 = (void *)objc_msgSend_initWithFormat_arguments_(v11, v12, (uint64_t)v9, (uint64_t)a5);

  v16.receiver = self;
  v16.super_class = (Class)CKException;
  v14 = -[CKException initWithName:reason:userInfo:](&v16, sel_initWithName_reason_userInfo_, v10, v13, 0);

  return v14;
}

- (int)errorCode
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;

  objc_msgSend_userInfo(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)CFSTR("CKErrorCode"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_intValue(v7, v8, v9, v10);

  return v11;
}

- (id)error
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;

  v5 = (int)objc_msgSend_errorCode(self, a2, v2, v3);
  objc_msgSend_reason(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v10, (uint64_t)CFSTR("CKInternalErrorDomain"), v5, CFSTR("%@"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
