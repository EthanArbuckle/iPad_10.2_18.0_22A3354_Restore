@implementation IDSTapToRadar

+ (void)launchWithRequest:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  const char *v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  double v28;
  void *v29;
  const char *v30;
  double v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  double v35;
  void *v36;
  const char *v37;
  _QWORD v38[5];
  _QWORD v39[5];
  id v40;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_class();
  if (objc_msgSend__isSupported(v7, v8, v9, v10))
  {
    if (qword_1EE40B258 != -1)
      dispatch_once(&qword_1EE40B258, &unk_1E3C1B830);
    objc_msgSend_title(v5, v11, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    v16 = CFSTR("Internal IDS Error Detected");
    if (v14)
      v16 = (__CFString *)v14;
    v17 = v16;

    objc_msgSend_message(v5, v18, v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    v23 = CFSTR("An internal IDS error has been detected");
    if (v21)
      v23 = (__CFString *)v21;
    v24 = v23;

    v25 = (void *)MEMORY[0x1E0D36B00];
    objc_msgSend_stringGUID(MEMORY[0x1E0CB3940], v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_userNotificationWithIdentifier_title_message_defaultButton_alternateButton_otherButton_(v25, v30, (uint64_t)v29, v31, v17, v24, CFSTR("File Radar"), CFSTR("Dismiss"), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      v39[0] = 0;
      v39[1] = v39;
      v39[2] = 0x3032000000;
      v39[3] = sub_19BA3AE58;
      v39[4] = sub_19BA3AE68;
      v40 = (id)0xAAAAAAAAAAAAAAAALL;
      v40 = v6;
      objc_msgSend_sharedInstance(MEMORY[0x1E0D36B08], v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = sub_19BA3AE70;
      v38[3] = &unk_1E3C20AA8;
      v38[4] = v39;
      objc_msgSend_addUserNotification_listener_completionHandler_(v36, v37, (uint64_t)v32, COERCE_DOUBLE(3221225472), 0, v38);

      _Block_object_dispose(v39, 8);
    }

  }
}

@end
