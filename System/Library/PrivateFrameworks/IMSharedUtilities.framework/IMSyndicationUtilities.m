@implementation IMSyndicationUtilities

- (OS_dispatch_queue)attributionFetchQueue
{
  if (qword_1EE5041B8 != -1)
    dispatch_once(&qword_1EE5041B8, &unk_1E3FB3AC8);
  return (OS_dispatch_queue *)(id)qword_1EE5041B0;
}

- (id)bundleIDsForCollaborationURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  +[IMSharedWithYouManager sharedManager](IMSharedWithYouManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lsAppRecordForURL:checkInstalledAppsOnly:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "applicationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.CloudKit.ShareBear"));

    if (v9)
    {
      -[IMSyndicationUtilities bundleIDsForShareBearURL:](self, "bundleIDsForShareBearURL:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v7, "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = (void *)MEMORY[0x1E0C99D20];
        objc_msgSend(v7, "bundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "arrayWithObject:", v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)bundleIDsForShareBearURL:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (v4)
  {
    v5 = -[IMSyndicationUtilities _collaborationAppForURL:](self, "_collaborationAppForURL:", v4);
    if ((v5 & 0xFFFFFFFFFFFFFFFDLL) == 5)
      -[IMSyndicationUtilities _fetchCKBundleIDsForURL:returnLocalBundlesOnly:](self, "_fetchCKBundleIDsForURL:returnLocalBundlesOnly:", v4, 0);
    else
      -[IMSyndicationUtilities _bundleIDsForCollaborationApp:](self, "_bundleIDsForCollaborationApp:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v7, "mutableCopy");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)UTITypeForURL:(id)a3
{
  unint64_t v3;

  v3 = -[IMSyndicationUtilities _collaborationAppForURL:](self, "_collaborationAppForURL:", a3);
  if (v3 - 2 > 2)
    return CFSTR("public.url");
  else
    return off_1E3FB82D0[v3 - 2];
}

- (void)fetchAttributionsForHighlight:(id)a3 highlight:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8)
  {
    -[IMSyndicationUtilities attributionFetchQueue](self, "attributionFetchQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_19E2E4914;
    block[3] = &unk_1E3FB5BC8;
    v14 = v8;
    v15 = v9;
    v16 = v11;
    dispatch_async(v12, block);

  }
  else
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

- (id)_bundleIDsForCollaborationApp:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a3)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("com.apple.Notes"), CFSTR("com.apple.mobilenotes"), 0);
      goto LABEL_8;
    case 1uLL:
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("com.apple.reminders"), 0, v7);
      goto LABEL_8;
    case 2uLL:
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("com.apple.Keynote"), CFSTR("com.apple.iWork.Keynote"), 0);
      goto LABEL_8;
    case 3uLL:
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("com.apple.Pages"), CFSTR("com.apple.iWork.Pages"), 0);
      goto LABEL_8;
    case 4uLL:
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("com.apple.Numbers"), CFSTR("com.apple.iWork.Numbers"), 0);
      goto LABEL_8;
    case 6uLL:
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("com.apple.finder"), CFSTR("com.apple.DocumentsApp"), 0);
LABEL_8:
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v5;
      break;
    default:
      return v4;
  }
  return v4;
}

- (id)_URLSchemeForCollaborationApp:(unint64_t)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 <= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", off_1E3FB82E8[a3]);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  return v4;
}

- (unint64_t)_collaborationAppForURL:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  int v9;

  v5 = 0;
  v6 = 7;
  do
  {
    objc_msgSend(a3, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMSyndicationUtilities _URLSchemeForCollaborationApp:](self, "_URLSchemeForCollaborationApp:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "containsString:", v8);

    if (v9)
      v6 = v5;
    ++v5;
  }
  while (v5 != 7);
  return v6;
}

- (CKContainer)ckContainer
{
  CKContainer *ckContainer;
  void *v4;
  void *v5;
  CKContainer *v6;
  CKContainer *v7;

  ckContainer = self->_ckContainer;
  if (!ckContainer)
  {
    v4 = (void *)objc_opt_new();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C40]), "initWithContainerIdentifier:environment:", CFSTR("com.apple.SocialLayer"), 1);
    v6 = (CKContainer *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C28]), "initWithContainerID:options:", v5, v4);
    v7 = self->_ckContainer;
    self->_ckContainer = v6;

    ckContainer = self->_ckContainer;
  }
  return ckContainer;
}

- (id)_fetchCKBundleIDsForURL:(id)a3 returnLocalBundlesOnly:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[5];
  id v21;
  __int128 buf;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "absoluteString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_19E239000, v7, OS_LOG_TYPE_INFO, "Fetching BundleIDs for CK URL:%@", (uint8_t *)&buf, 0xCu);

    }
  }
  objc_msgSend(v6, "CKShareURLSlugBasedApplicationName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lowercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("share"));

  if (v11 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_19E239000, v12, OS_LOG_TYPE_INFO, "CK is going to need to perform a n/w request", (uint8_t *)&buf, 2u);
    }

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v23 = 0x3032000000;
  v24 = sub_19E24768C;
  v25 = sub_19E24752C;
  v26 = 0;
  v13 = objc_alloc(MEMORY[0x1E0C94EB0]);
  v21 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithShareURLs:returnLocalBundlesOnly:", v14, v4);

  if (IMIsRunningInMessagesUIProcess() && objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    objc_msgSend(v15, "configuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setQualityOfService:", 33);

  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_19E2E4F78;
  v20[3] = &unk_1E3FB82B0;
  v20[4] = &buf;
  objc_msgSend(v15, "setPerShareURLBlock:", v20);
  -[IMSyndicationUtilities ckContainer](self, "ckContainer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addOperation:", v15);

  objc_msgSend(v15, "waitUntilFinished");
  v18 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v18;
}

- (void)setCkContainer:(id)a3
{
  objc_storeStrong((id *)&self->_ckContainer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckContainer, 0);
}

@end
