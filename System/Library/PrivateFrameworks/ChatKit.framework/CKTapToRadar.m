@implementation CKTapToRadar

+ (void)launchTapToRadarWithTitle:(id)a3 description:(id)a4 bundleID:(id)a5 componentID:(id)a6 componentName:(id)a7 componentVersion:(id)a8 autodiagnostics:(id)a9
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  int v30;
  NSObject *v31;
  const __CFString *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE buf[24];
  void *v43;
  uint64_t *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v34 = a4;
  v35 = a5;
  v36 = a6;
  v37 = a7;
  v14 = a8;
  v15 = a9;
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a7) = objc_msgSend(v16, "isInternalInstall");

  if ((_DWORD)a7)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "URLHostAllowedCharacterSet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v33, "stringByAddingPercentEncodingWithAllowedCharacters:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stringByAddingPercentEncodingWithAllowedCharacters:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stringByAddingPercentEncodingWithAllowedCharacters:", v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "stringByAddingPercentEncodingWithAllowedCharacters:", v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "stringByAddingPercentEncodingWithAllowedCharacters:", v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAddingPercentEncodingWithAllowedCharacters:", v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("tap-to-radar://new?Title=%@&Description=%@&BundleID=%@&ComponentID=%@&ComponentName=%@&ComponentVersion=%@&AutoDiagnostics=%@"), v19, v20, v21, v22, v23, v24, v15);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    v39 = &v38;
    v40 = 0x2050000000;
    v27 = (void *)getLSApplicationWorkspaceClass_softClass;
    v41 = getLSApplicationWorkspaceClass_softClass;
    if (!getLSApplicationWorkspaceClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getLSApplicationWorkspaceClass_block_invoke;
      v43 = &unk_1E274A178;
      v44 = &v38;
      __getLSApplicationWorkspaceClass_block_invoke((uint64_t)buf);
      v27 = (void *)v39[3];
    }
    v28 = objc_retainAutorelease(v27);
    _Block_object_dispose(&v38, 8);
    objc_msgSend(v28, "defaultWorkspace");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "openURL:withOptions:", v26, 0);

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        v32 = CFSTR("Failed to open");
        if (v30)
          v32 = CFSTR("Successfully opened");
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v32;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v26;
        _os_log_impl(&dword_18DFCD000, v31, OS_LOG_TYPE_INFO, "%@ Tap to Radar url, URL: %@", buf, 0x16u);
      }

    }
  }

}

+ (id)_systemBuildNumber
{
  void *v2;
  void *v3;

  v2 = (void *)_CFCopySystemVersionDictionary();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AB90]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_hardwareName
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)MGCopyAnswer();
  if ((objc_msgSend(v2, "hasSuffix:", CFSTR("AP")) & 1) != 0)
  {
    v3 = -2;
LABEL_5:
    objc_msgSend(v2, "substringToIndex:", objc_msgSend(v2, "length") + v3);
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v4;
    return v2;
  }
  if (objc_msgSend(v2, "hasSuffix:", CFSTR("dev")))
  {
    v3 = -3;
    goto LABEL_5;
  }
  return v2;
}

+ (id)_titleForFailedMessageRadar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "_hardwareName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_systemBuildNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@: Failed sending message"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_marketingHardwareName
{
  return (id)MGCopyAnswer();
}

+ (void)launchTapToRadarForFailedMessageGUID:(id)a3 chatIdentifier:(id)a4 error:(int64_t)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a4;
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = a3;
  objc_msgSend(a1, "_marketingHardwareName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_systemBuildNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("A message failed to send on %@ running %@.\n\nMessage GUID: %@"), v10, v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v12, "stringByAppendingFormat:", CFSTR("\nChat Identifier: %@"), v17);
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
  }
  if (a5)
  {
    _NSStringFromIMMessageError();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingFormat:", CFSTR("\nError: %@ (%llu)"), v14, a5);
    v15 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v15;
  }
  objc_msgSend(a1, "_titleForFailedMessageRadar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "launchTapToRadarWithTitle:description:bundleID:componentID:componentName:componentVersion:autodiagnostics:", v16, v12, CFSTR("com.apple.MobileSMS"), CFSTR("137610"), CFSTR("Messages"), CFSTR("(New Bugs)"), CFSTR("phone"));

}

+ (void)launchTapToRadarForFailedMessage:(id)a3 inChat:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "guid");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chatIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "launchTapToRadarForFailedMessageGUID:chatIdentifier:error:", v10, v8, objc_msgSend(v9, "code"));
}

@end
