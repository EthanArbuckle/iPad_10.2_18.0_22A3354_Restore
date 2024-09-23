@implementation CKInternalError

+ (void)initialize
{
  objc_class *v2;
  uint64_t v3;

  v2 = (objc_class *)objc_opt_class();
  v3 = objc_opt_self();
  sub_18A5CEF4C(v3, v2, 0, 0, 1);
}

+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4 format:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  uint64_t v17;

  v8 = (objc_class *)MEMORY[0x1E0CB3940];
  v9 = a5;
  v10 = a4;
  v11 = [v8 alloc];
  v13 = (void *)objc_msgSend_initWithFormat_arguments_(v11, v12, (uint64_t)v9, (uint64_t)&v17);

  objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(a1, v14, (uint64_t)CFSTR("CKInternalErrorDomain"), a3, v10, 0, 0, 0, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)errorWithCode:(int64_t)a3 format:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  uint64_t v14;

  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a4;
  v8 = [v6 alloc];
  v10 = (void *)objc_msgSend_initWithFormat_arguments_(v8, v9, (uint64_t)v7, (uint64_t)&v14);

  objc_msgSend_errorWithDomain_code_userInfo_error_path_URL_description_(a1, v11, (uint64_t)CFSTR("CKInternalErrorDomain"), a3, 0, 0, 0, 0, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
