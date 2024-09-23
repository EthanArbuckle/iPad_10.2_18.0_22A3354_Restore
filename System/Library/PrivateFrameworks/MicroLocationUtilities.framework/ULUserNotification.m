@implementation ULUserNotification

+ (void)presentWithAlertLevel:(int64_t)a3 title:(id)a4 message:(id)a5 defaultButton:(id)a6 cancelButton:(id)a7 otherButton:(id)a8 handler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  int64_t v36;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  objc_msgSend(a1, "_queue");
  v21 = objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __105__ULUserNotification_presentWithAlertLevel_title_message_defaultButton_cancelButton_otherButton_handler___block_invoke;
  v28[3] = &unk_2511EEFD0;
  v35 = a1;
  v36 = a3;
  v29 = v15;
  v30 = v16;
  v31 = v17;
  v32 = v18;
  v33 = v19;
  v34 = v20;
  v22 = v20;
  v23 = v19;
  v24 = v18;
  v25 = v17;
  v26 = v16;
  v27 = v15;
  dispatch_async(v21, v28);

}

uint64_t __105__ULUserNotification_presentWithAlertLevel_title_message_defaultButton_cancelButton_otherButton_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 80), "_presentWithAlertLevel:title:message:defaultButton:cancelButton:otherButton:handler:", *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

+ (void)_presentWithAlertLevel:(int64_t)a3 title:(id)a4 message:(id)a5 defaultButton:(id)a6 cancelButton:(id)a7 otherButton:(id)a8 handler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(id, uint64_t);
  void *v20;
  void *v21;
  id v22;

  v22 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = (void (**)(id, uint64_t))a9;
  if (+[ULPlatform isInternalInstall](ULPlatform, "isInternalInstall"))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, *MEMORY[0x24BDBD6D8]);
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BDBD6E0]);
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BDBD6F8]);
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BDBD6F0]);
    if (v18)
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BDBD718]);
    v21 = (void *)objc_msgSend(v20, "copy");
    objc_msgSend(a1, "_postNotificationWithAlertLevel:alertOptions:handler:", a3, v21, v19);

  }
  else
  {
    v19[2](v19, 1);
  }

}

+ (void)_postNotificationWithAlertLevel:(int64_t)a3 alertOptions:(id)a4 handler:(id)a5
{
  void (**v8)(id, uint64_t);
  const __CFDictionary *v9;
  __CFUserNotification *v10;
  CFOptionFlags responseFlags;

  v8 = (void (**)(id, uint64_t))a5;
  v9 = (const __CFDictionary *)a4;
  v10 = CFUserNotificationCreate(0, 0.0, objc_msgSend(a1, "_userNotificationAlertLevelFlagsFromAlertLevel:", a3), 0, v9);

  if (v10)
  {
    responseFlags = 0;
    CFUserNotificationReceiveResponse(v10, 0.0, &responseFlags);
    CFRelease(v10);
    v8[2](v8, objc_msgSend(a1, "_responseButtonFromOptionFlags:", responseFlags));
  }
  else
  {
    v8[2](v8, 1);
  }

}

+ (int64_t)_responseButtonFromOptionFlags:(unint64_t)a3
{
  int64_t v3;

  v3 = 1;
  if ((a3 & 3) == 2)
    v3 = 2;
  if ((a3 & 3) != 0)
    return v3;
  else
    return 0;
}

+ (unint64_t)_userNotificationAlertLevelFlagsFromAlertLevel:(int64_t)a3
{
  if ((unint64_t)a3 >= 3)
    return 3;
  else
    return a3;
}

+ (id)_queue
{
  if (_queue_ul_once_token_0 != -1)
    dispatch_once(&_queue_ul_once_token_0, &__block_literal_global);
  return (id)_queue_ul_once_object_0;
}

void __28__ULUserNotification__queue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.MicroLocationUtilities.ULUserNotification", v2);
  v1 = (void *)_queue_ul_once_object_0;
  _queue_ul_once_object_0 = (uint64_t)v0;

}

@end
