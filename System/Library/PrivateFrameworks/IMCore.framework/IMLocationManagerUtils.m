@implementation IMLocationManagerUtils

+ (id)sharedInstance
{
  if (qword_1ECF125A0 != -1)
    dispatch_once(&qword_1ECF125A0, &unk_1E471D738);
  return (id)qword_1ECF12600;
}

- (void)sendCurrentLocationMessageWithChat:(id)a3 withLocationManager:(id)a4 withSourceApplicationIdentifier:(id)a5 foregroundAssertionForBundleIdentifier:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMEventCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v11;
      _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "Client request to send current location for chat %@", buf, 0xCu);
    }

  }
  objc_msgSend(v11, "currentLocationGUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17 == 0;

  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = sub_1A20A7EDC;
    v28[3] = &unk_1E471F438;
    v29 = v11;
    v30 = v21;
    v31 = v13;
    v32 = v15;
    v24[0] = v22;
    v24[1] = 3221225472;
    v24[2] = sub_1A20A8154;
    v24[3] = &unk_1E4720978;
    v25 = v29;
    v26 = v30;
    v27 = v31;
    v23 = v30;
    objc_msgSend(v12, "startUpdatingCurrentLocationWithForegroundAssertionForBundleIdentifier:withAuthorizedHandler:updateHandler:", v14, v28, v24);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v11, "currentLocationGUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v20;
      _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_INFO, " => we are already sending a current location for this chat, ignoring (%@)", buf, 0xCu);

    }
  }

}

@end
