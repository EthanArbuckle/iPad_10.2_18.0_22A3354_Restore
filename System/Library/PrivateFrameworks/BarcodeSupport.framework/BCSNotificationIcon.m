@implementation BCSNotificationIcon

+ (UNNotificationIcon)qrCodeIcon
{
  void *v2;

  {
    v2 = (void *)+[BCSNotificationIcon qrCodeIcon]::qrCodeIcon;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF8850], "iconNamed:", CFSTR("QR_section_icon"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[BCSNotificationIcon qrCodeIcon]::qrCodeIcon = (uint64_t)v2;
  }
  return (UNNotificationIcon *)v2;
}

+ (UNNotificationIcon)nfcIcon
{
  void *v2;

  {
    v2 = (void *)+[BCSNotificationIcon nfcIcon]::nfcIcon;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF8850], "iconNamed:", CFSTR("NFC_section_icon"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[BCSNotificationIcon nfcIcon]::nfcIcon = (uint64_t)v2;
  }
  return (UNNotificationIcon *)v2;
}

+ (UNNotificationIcon)viewfinderIcon
{
  void *v2;

  {
    v2 = (void *)+[BCSNotificationIcon viewfinderIcon]::viewfinderIcon;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF8850], "iconNamed:", CFSTR("Viewfinder_section_icon"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[BCSNotificationIcon viewfinderIcon]::viewfinderIcon = (uint64_t)v2;
  }
  return (UNNotificationIcon *)v2;
}

- (BCSNotificationIcon)initWithAction:(id)a3
{
  id v4;
  BCSNotificationIcon *v5;
  BCSNotificationIcon *v6;
  BCSNotificationIcon *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BCSNotificationIcon;
  v5 = -[BCSNotificationIcon init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_action, v4);
    v7 = v6;
  }

  return v6;
}

- (NSURL)imageURL
{
  id WeakRetained;
  void *v4;
  float v5;
  float v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  uint8_t v13[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)&self->_action);
  objc_msgSend(WeakRetained, "defaultActionTargetApplicationBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MGGetFloat32Answer();
  v6 = v5;
  if (v5 == 3.0)
    v7 = CFSTR("CellularData@3x");
  else
    v7 = CFSTR("CellularData@2x");
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.Preferences.cellularData")))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLForResource:withExtension:", v7, CFSTR("png"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_21;
  }
  if (!objc_msgSend(v4, "length"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSNotificationIcon: target app identifier is nil", buf, 2u);
    }
    goto LABEL_16;
  }
  -[BCSNotificationIcon _clipIconURLForAction:scale:](self, "_clipIconURLForAction:scale:", WeakRetained, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    goto LABEL_21;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(WeakRetained, "isAMSAction")
    && ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.ios.StoreKitUIService")) & 1) != 0
     || (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.AMSEngagementViewService")) & 1) != 0))
  {
LABEL_16:
    v9 = 0;
    goto LABEL_21;
  }
  objc_msgSend(getLSApplicationProxyClass(), "applicationProxyForIdentifier:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    *(float *)&v11 = v6;
    -[BCSNotificationIcon _notificationIconDataURLForApp:scale:](self, "_notificationIconDataURLForApp:scale:", v10, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSNotificationIcon: app proxy is nil", v13, 2u);
    }
    v9 = 0;
  }

LABEL_21:
  return (NSURL *)v9;
}

- (id)_clipIconURLForAction:(id)a3 scale:(double)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  dispatch_time_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  const __CFString *v15;
  void *v16;
  _QWORD v18[4];
  NSObject *v19;
  uint64_t *v20;
  double v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "clipMetadataRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getClipMetadataSynchronously");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v22 = 0;
      v23 = &v22;
      v24 = 0x3032000000;
      v25 = __Block_byref_object_copy__0;
      v26 = __Block_byref_object_dispose__0;
      v27 = 0;
      v8 = dispatch_group_create();
      dispatch_group_enter(v8);
      objc_msgSend(v5, "clipMetadataRequest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __51__BCSNotificationIcon__clipIconURLForAction_scale___block_invoke;
      v18[3] = &unk_24D787BC0;
      v10 = v8;
      v21 = a4;
      v19 = v10;
      v20 = &v22;
      objc_msgSend(v9, "requestDownloadedIconWithMetadata:completion:", v7, v18);

      v11 = dispatch_time(0, 1000000000);
      dispatch_group_wait(v10, v11);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        v12 = v23[5];
        *(_DWORD *)buf = 138412290;
        v29 = v12;
        _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSNotificationIcon: processed icon URL after timeout = %@", buf, 0xCu);
      }
      v13 = (void *)v23[5];
      if (v13)
      {
        v14 = v13;
      }
      else
      {
        if (a4 == 3.0)
          v15 = CFSTR("AppClips@3x");
        else
          v15 = CFSTR("AppClips@2x");
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "URLForResource:withExtension:", v15, CFSTR("png"));
        v14 = (id)objc_claimAutoreleasedReturnValue();

      }
      _Block_object_dispose(&v22, 8);

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __51__BCSNotificationIcon__clipIconURLForAction_scale___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BCSConfigurationManager *v4;
  double v5;
  id v6;
  __int128 v7;
  _QWORD v8[4];
  __int128 v9;

  v3 = a2;
  if (v3)
  {
    v4 = objc_alloc_init(BCSConfigurationManager);
    v5 = *(double *)(a1 + 48);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __51__BCSNotificationIcon__clipIconURLForAction_scale___block_invoke_2;
    v8[3] = &unk_24D787B98;
    v7 = *(_OWORD *)(a1 + 32);
    v6 = (id)v7;
    v9 = v7;
    -[BCSConfigurationManager processAppClipImageWithURL:scale:completion:](v4, "processAppClipImageWithURL:scale:completion:", v3, v8, v5);

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

void __51__BCSNotificationIcon__clipIconURLForAction_scale___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (id)_notificationIconDataURLForApp:(id)a3 scale:(float)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t (*v25)(void *);
  CGImage *v26;
  CGImage *v27;
  void *v28;
  _BOOL8 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  _BOOL8 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _BOOL8 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  void *v63;
  uint8_t buf[8];
  uint64_t v65;
  void *(*v66)(_QWORD *);
  void *v67;
  uint64_t *v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _bcs_notificationIconBaseURL();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@.png"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "absoluteString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "fileExistsAtPath:isDirectory:", v12, 0);

    if (v13)
    {
      v14 = v10;
      goto LABEL_33;
    }
    if (a4 == 2.0)
    {
      v23 = 17;
    }
    else if (a4 == 3.0)
    {
      v23 = 34;
    }
    else
    {
      v23 = 64;
    }
    objc_msgSend(v5, "iconDataForVariant:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v60 = 0;
      v61 = &v60;
      v62 = 0x2020000000;
      v25 = (uint64_t (*)(void *))getLICreateIconFromCachedBitmapSymbolLoc(void)::ptr;
      v63 = getLICreateIconFromCachedBitmapSymbolLoc(void)::ptr;
      if (!getLICreateIconFromCachedBitmapSymbolLoc(void)::ptr)
      {
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        v65 = 3221225472;
        v66 = ___ZL40getLICreateIconFromCachedBitmapSymbolLocv_block_invoke;
        v67 = &unk_24D787BE8;
        v68 = &v60;
        ___ZL40getLICreateIconFromCachedBitmapSymbolLocv_block_invoke(buf);
        v25 = (uint64_t (*)(void *))v61[3];
      }
      _Block_object_dispose(&v60, 8);
      if (!v25)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGImageRef _LICreateIconFromCachedBitmap(CFDataRef)");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "handleFailureInFunction:file:lineNumber:description:", v58, CFSTR("BCSNotificationIcon.mm"), 31, CFSTR("%s"), dlerror());

        __break(1u);
      }
      v26 = (CGImage *)v25(v24);
      v27 = v26;
      if (v26)
      {
        _bcs_CGImagePNGRepresentation(v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v28)
        {
          v29 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v29)
            -[BCSNotificationIcon _notificationIconDataURLForApp:scale:].cold.5(v29, v30, v31, v32, v33, v34, v35, v36);
        }
        v59 = 0;
        objc_msgSend(v28, "writeToURL:options:error:", v10, 1, &v59);
        v37 = v59;
        if (v37 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v37, "_bcs_privacyPreservingDescription");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[BCSNotificationIcon _notificationIconDataURLForApp:scale:].cold.4(v38, buf);
        }
        CGImageRelease(v27);
        if (v28)
          v39 = v10;
        else
          v39 = 0;
        v14 = v39;

        goto LABEL_32;
      }
      v48 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v48)
        -[BCSNotificationIcon _notificationIconDataURLForApp:scale:].cold.3(v48, v49, v50, v51, v52, v53, v54, v55);
    }
    else
    {
      v40 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v40)
        -[BCSNotificationIcon _notificationIconDataURLForApp:scale:].cold.2(v40, v41, v42, v43, v44, v45, v46, v47);
    }
    v14 = 0;
LABEL_32:

    goto LABEL_33;
  }
  v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
  if (v15)
    -[BCSNotificationIcon _notificationIconDataURLForApp:scale:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
  v14 = 0;
LABEL_33:

  return v14;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_action);
}

- (void)_notificationIconDataURLForApp:(uint64_t)a3 scale:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSNotificationIcon: notification icon path is nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_notificationIconDataURLForApp:(uint64_t)a3 scale:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSNotificationIcon: icon data from LSApplicationProxy is nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_notificationIconDataURLForApp:(uint64_t)a3 scale:(uint64_t)a4 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSNotificationIcon: Failed to create icon from cached bitmap", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_notificationIconDataURLForApp:(void *)a1 scale:(uint8_t *)buf .cold.4(void *a1, uint8_t *buf)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "BCSNotificationIcon: Failed to write PNG image data to disk with error %{public}@", buf, 0xCu);

}

- (void)_notificationIconDataURLForApp:(uint64_t)a3 scale:(uint64_t)a4 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSNotificationIcon: Failed to get PNG image data", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
