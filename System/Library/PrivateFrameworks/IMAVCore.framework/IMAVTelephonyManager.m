@implementation IMAVTelephonyManager

+ (IMAVTelephonyManager)sharedInstance
{
  if (qword_253DE94B0 != -1)
    dispatch_once(&qword_253DE94B0, &unk_24DA574C8);
  return (IMAVTelephonyManager *)(id)qword_253DE94E0;
}

- (IMAVTelephonyManager)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  IMAVTelephonyManager *v6;
  void *v7;
  const char *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IMAVTelephonyManager;
  v6 = -[IMAVTelephonyManager init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v2, v3, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObserver_selector_name_object_(v7, v8, (uint64_t)v6, (uint64_t)sel__chatStateChanged_, (uint64_t)CFSTR("__kIMAVChatStateChangedNotification"), 0);

  }
  return v6;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;

  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_name_object_(v6, v7, (uint64_t)self, 0, 0);

  objc_msgSend_sharedInstance(MEMORY[0x24BE50328], v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeFastDormancyDisableToken_(v12, v13, (uint64_t)CFSTR("kIMAVTelephonyManagerDormancyClient"), v14, v15);

  v16.receiver = self;
  v16.super_class = (Class)IMAVTelephonyManager;
  -[IMAVTelephonyManager dealloc](&v16, sel_dealloc);
}

- (void)_chatStateChanged:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int shouldRunACConferences;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int v36;
  NSObject *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend_sharedInstance(IMAVController, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend__shouldRunConferences(v8, v9, v10, v11, v12))
  {

  }
  else
  {
    objc_msgSend_sharedInstance(IMAVController, v13, v14, v15, v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    shouldRunACConferences = objc_msgSend__shouldRunACConferences(v21, v22, v23, v24, v25);

    if (!shouldRunACConferences)
      goto LABEL_13;
  }
  objc_msgSend_object(v3, v17, v18, v19, v20);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend__isProxy(v27, v28, v29, v30, v31) & 1) == 0)
  {
    v36 = objc_msgSend_state(v27, v32, v33, v34, v35);
    sub_2190076D0();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      _NSStringDescriptionForIMAVChatState(v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = 138412546;
      v51 = v38;
      v52 = 2112;
      v53 = v27;
      _os_log_impl(&dword_218FEA000, v37, OS_LOG_TYPE_DEFAULT, "Observed chat state change to: %@ for: %@", (uint8_t *)&v50, 0x16u);

    }
    switch(v36)
    {
      case 1u:
      case 3u:
        goto LABEL_10;
      case 2u:
        if (!objc_msgSend_isCaller(v27, v39, v40, v41, v42))
          break;
LABEL_10:
        objc_msgSend_sharedInstance(MEMORY[0x24BE50328], v39, v40, v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addFastDormancyDisableToken_(v43, v47, (uint64_t)CFSTR("kIMAVTelephonyManagerDormancyClient"), v48, v49);
LABEL_11:

        break;
      default:
        objc_msgSend_sharedInstance(MEMORY[0x24BE50328], v39, v40, v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removeFastDormancyDisableToken_(v43, v44, (uint64_t)CFSTR("kIMAVTelephonyManagerDormancyClient"), v45, v46);
        goto LABEL_11;
    }
  }

LABEL_13:
}

@end
