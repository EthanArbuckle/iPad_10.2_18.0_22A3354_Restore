@implementation ACDUserNotification

+ (void)showUserNotificationWithTitle:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 otherButtonTitle:(id)a6 withCompletionBlock:(id)a7
{
  objc_msgSend(a1, "showUserNotificationWithTitle:message:cancelButtonTitle:otherButtonTitle:level:withCompletionBlock:", a3, a4, a5, a6, 0, a7);
}

+ (void)showUserNotificationWithTitle:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 otherButtonTitle:(id)a6 level:(unint64_t)a7 withCompletionBlock:(id)a8
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const __CFDictionary *v23;
  void (**v24)(_QWORD, _QWORD, _QWORD);
  __CFUserNotification *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  CFOptionFlags responseFlags[2];

  v30 = (void *)MEMORY[0x24BDBCED8];
  v29 = *MEMORY[0x24BDBD6D8];
  v28 = *MEMORY[0x24BDBD6E0];
  v27 = *MEMORY[0x24BDBD6F0];
  v26 = *MEMORY[0x24BDBD6F8];
  v12 = (void *)MEMORY[0x24BDD16E0];
  v13 = a8;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  objc_msgSend(v12, "numberWithBool:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x24BDBD6E8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *MEMORY[0x24BEB0E40];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "dictionaryWithObjectsAndKeys:", v17, v29, v16, v28, v15, v27, v14, v26, v18, v19, v20, v21, v22, *MEMORY[0x24BEB0E58], 0);
  v23 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v24 = (void (**)(_QWORD, _QWORD, _QWORD))objc_msgSend(v13, "copy");
  v25 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0.0, a7, 0, v23);
  responseFlags[0] = 0;
  CFUserNotificationReceiveResponse(v25, 0.0, responseFlags);
  ((void (**)(_QWORD, __CFUserNotification *, CFOptionFlags))v24)[2](v24, v25, responseFlags[0]);
  if (v25)
    CFRelease(v25);

}

@end
