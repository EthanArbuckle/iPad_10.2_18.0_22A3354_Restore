@implementation CKRecordDecryptInfo

- (CKRecordDecryptInfo)init
{
  id v2;
  uint64_t v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  id v7;

  v2 = objc_alloc(MEMORY[0x1E0C94D90]);
  v3 = *MEMORY[0x1E0C99778];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend_initWithName_format_(v2, v6, v3, CFSTR("You must call -[%@ initWithRecord:callbackQueue:]"), v5);

  objc_exception_throw(v7);
}

- (CKRecordDecryptInfo)initWithRecord:(id)a3 callbackQueue:(id)a4
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  CKRecordDecryptInfo *v13;
  CKRecordDecryptInfo *v14;
  const char *v15;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v12 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v10, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, self, CFSTR("CKDDecryptRecordsOperation.m"), 64, CFSTR("You can't decrypt a nil record"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v10, v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, self, CFSTR("CKDDecryptRecordsOperation.m"), 65, CFSTR("You must specify a callback queue"));

LABEL_3:
  v21.receiver = self;
  v21.super_class = (Class)CKRecordDecryptInfo;
  v13 = -[CKRecordDecryptInfo init](&v21, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_record, a3);
    objc_msgSend__setupDecryptCallbackForQueue_(v14, v15, (uint64_t)v12);
  }

  return v14;
}

- (void)_setupDecryptCallbackForQueue:(id)a3
{
  NSObject *v4;
  OS_dispatch_group *v5;
  OS_dispatch_group *decryptGroup;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id location;

  v4 = a3;
  v5 = (OS_dispatch_group *)dispatch_group_create();
  decryptGroup = self->_decryptGroup;
  self->_decryptGroup = v5;

  objc_msgSend_decryptGroup(self, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v9);

  objc_initWeak(&location, self);
  objc_msgSend_decryptGroup(self, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1BEC283FC;
  v13[3] = &unk_1E782EF38;
  objc_copyWeak(&v14, &location);
  dispatch_group_notify(v12, v4, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (CKRecord)record
{
  return self->_record;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (OS_dispatch_group)decryptGroup
{
  return self->_decryptGroup;
}

- (void)setDecryptGroup:(id)a3
{
  objc_storeStrong((id *)&self->_decryptGroup, a3);
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)numUnwrapAttempts
{
  return self->_numUnwrapAttempts;
}

- (void)setNumUnwrapAttempts:(unint64_t)a3
{
  self->_numUnwrapAttempts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_decryptGroup, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

@end
