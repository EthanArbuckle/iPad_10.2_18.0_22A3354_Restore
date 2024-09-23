@implementation CKUserNotificationUtilities

+ (void)showUserNotification:(__CFUserNotification *)a3 withCompletionBlock:(id)a4
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void (**v18)(_QWORD);
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  _QWORD block[4];
  id v29;
  __CFUserNotification *v30;
  _QWORD aBlock[4];
  id v32;
  __CFUserNotification *v33;

  v7 = a4;
  v11 = v7;
  if (a3)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9, v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, (uint64_t)a1, CFSTR("CKUserNotificationUtilities.m"), 52, CFSTR("Must have a notification"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9, v10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v24, v25, (uint64_t)a2, (uint64_t)a1, CFSTR("CKUserNotificationUtilities.m"), 53, CFSTR("Must have a block here"));

LABEL_3:
  sub_18A6B27B8((uint64_t)a3, v8, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14, v15);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v26, v27, (uint64_t)a2, (uint64_t)a1, CFSTR("CKUserNotificationUtilities.m"), 54, CFSTR("Already waiting on this notification %p"), a3);

  }
  v16 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_18A6B27F8;
  aBlock[3] = &unk_1E1F5F788;
  v33 = a3;
  v17 = v11;
  v32 = v17;
  v18 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend_isMainThread(MEMORY[0x1E0CB3978], v19, v20, v21))
  {
    v18[2](v18);
  }
  else
  {
    block[0] = v16;
    block[1] = 3221225472;
    block[2] = sub_18A6B2B04;
    block[3] = &unk_1E1F5F788;
    v30 = a3;
    v29 = v17;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

@end
