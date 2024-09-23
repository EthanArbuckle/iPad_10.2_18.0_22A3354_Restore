@implementation MKAPIServer

- (MKAPIServer)init
{
  MKAPIServer *v2;
  MKCertificate *v3;
  MKCertificate *certificate;
  MKProgress *v5;
  MKProgress *progress;
  MKContext *v7;
  MKContext *context;
  uint64_t v9;
  NSHashTable *migrators;
  MKAccountMigrator *v11;
  MKAccountMigrator *accountMigrator;
  MKMessageMigrator *v13;
  MKMessageMigrator *messageMigrator;
  MKBookmarkMigrator *v15;
  MKBookmarkMigrator *bookmarkMigrator;
  MKApplicationMigrator *v17;
  MKApplicationMigrator *applicationMigrator;
  MKAccessibilitySettingMigrator *v19;
  MKAccessibilitySettingMigrator *accessibilitySettingMigrator;
  MKDisplaySettingMigrator *v21;
  MKDisplaySettingMigrator *displaySettingMigrator;
  MKContactMigrator *v23;
  MKContactMigrator *contactMigrator;
  MKCallHistoryMigrator *v25;
  MKCallHistoryMigrator *callHistoryMigrator;
  MKCalendarMigrator *v27;
  MKCalendarMigrator *calendarMigrator;
  MKPhotoLibraryAlbumMigrator *v29;
  MKPhotoLibraryAlbumMigrator *photoLibraryAlbumMigrator;
  MKPhotoLibraryMigrator *v31;
  MKPhotoLibraryMigrator *photoLibraryImageMigrator;
  MKPhotoLibraryMigrator *v33;
  MKPhotoLibraryMigrator *photoLibraryVideoMigrator;
  MKVoiceMemoMigrator *v35;
  MKVoiceMemoMigrator *voiceMemoMigrator;
  MKFileMigrator *v37;
  MKFileMigrator *fileMigrator;
  MKPlaceholderMigrator *v39;
  MKPlaceholderMigrator *placeholderMigrator;
  MKContainerMigrator *v41;
  MKContainerMigrator *containerMigrator;
  MKDiagnosticsMigrator *v43;
  MKDiagnosticsMigrator *diagnosticsMigrator;
  MKSIMMigrator *v45;
  MKSIMMigrator *simMigrator;
  MKApplicationMigrator *v47;
  void *v48;
  NSHashTable *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  objc_super v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v59.receiver = self;
  v59.super_class = (Class)MKAPIServer;
  v2 = -[MKAPIServer init](&v59, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MKCertificate);
    certificate = v2->_certificate;
    v2->_certificate = v3;

    v5 = objc_alloc_init(MKProgress);
    progress = v2->_progress;
    v2->_progress = v5;

    v7 = objc_alloc_init(MKContext);
    context = v2->_context;
    v2->_context = v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 5, 0);
    migrators = v2->_migrators;
    v2->_migrators = (NSHashTable *)v9;

    v11 = objc_alloc_init(MKAccountMigrator);
    accountMigrator = v2->_accountMigrator;
    v2->_accountMigrator = v11;

    v13 = objc_alloc_init(MKMessageMigrator);
    messageMigrator = v2->_messageMigrator;
    v2->_messageMigrator = v13;

    v15 = objc_alloc_init(MKBookmarkMigrator);
    bookmarkMigrator = v2->_bookmarkMigrator;
    v2->_bookmarkMigrator = v15;

    v17 = objc_alloc_init(MKApplicationMigrator);
    applicationMigrator = v2->_applicationMigrator;
    v2->_applicationMigrator = v17;

    v19 = objc_alloc_init(MKAccessibilitySettingMigrator);
    accessibilitySettingMigrator = v2->_accessibilitySettingMigrator;
    v2->_accessibilitySettingMigrator = v19;

    v21 = objc_alloc_init(MKDisplaySettingMigrator);
    displaySettingMigrator = v2->_displaySettingMigrator;
    v2->_displaySettingMigrator = v21;

    v23 = objc_alloc_init(MKContactMigrator);
    contactMigrator = v2->_contactMigrator;
    v2->_contactMigrator = v23;

    v25 = objc_alloc_init(MKCallHistoryMigrator);
    callHistoryMigrator = v2->_callHistoryMigrator;
    v2->_callHistoryMigrator = v25;

    v27 = objc_alloc_init(MKCalendarMigrator);
    calendarMigrator = v2->_calendarMigrator;
    v2->_calendarMigrator = v27;

    v29 = objc_alloc_init(MKPhotoLibraryAlbumMigrator);
    photoLibraryAlbumMigrator = v2->_photoLibraryAlbumMigrator;
    v2->_photoLibraryAlbumMigrator = v29;

    v31 = -[MKPhotoLibraryMigrator initWithType:]([MKPhotoLibraryMigrator alloc], "initWithType:", 0);
    photoLibraryImageMigrator = v2->_photoLibraryImageMigrator;
    v2->_photoLibraryImageMigrator = v31;

    v33 = -[MKPhotoLibraryMigrator initWithType:]([MKPhotoLibraryMigrator alloc], "initWithType:", 1);
    photoLibraryVideoMigrator = v2->_photoLibraryVideoMigrator;
    v2->_photoLibraryVideoMigrator = v33;

    -[MKPhotoLibraryMigrator setAlbumMigrator:](v2->_photoLibraryImageMigrator, "setAlbumMigrator:", v2->_photoLibraryAlbumMigrator);
    -[MKPhotoLibraryMigrator setAlbumMigrator:](v2->_photoLibraryVideoMigrator, "setAlbumMigrator:", v2->_photoLibraryAlbumMigrator);
    v35 = objc_alloc_init(MKVoiceMemoMigrator);
    voiceMemoMigrator = v2->_voiceMemoMigrator;
    v2->_voiceMemoMigrator = v35;

    v37 = objc_alloc_init(MKFileMigrator);
    fileMigrator = v2->_fileMigrator;
    v2->_fileMigrator = v37;

    v39 = objc_alloc_init(MKPlaceholderMigrator);
    placeholderMigrator = v2->_placeholderMigrator;
    v2->_placeholderMigrator = v39;

    v41 = objc_alloc_init(MKContainerMigrator);
    containerMigrator = v2->_containerMigrator;
    v2->_containerMigrator = v41;

    v43 = objc_alloc_init(MKDiagnosticsMigrator);
    diagnosticsMigrator = v2->_diagnosticsMigrator;
    v2->_diagnosticsMigrator = v43;

    v45 = objc_alloc_init(MKSIMMigrator);
    simMigrator = v2->_simMigrator;
    v2->_simMigrator = v45;

    -[MKCallHistoryMigrator setLabel:](v2->_callHistoryMigrator, "setLabel:", v2->_simMigrator);
    v47 = v2->_applicationMigrator;
    -[MKContainerMigrator signatures](v2->_containerMigrator, "signatures");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKApplicationMigrator setSignatures:](v47, "setSignatures:", v48);

    -[NSHashTable addObject:](v2->_migrators, "addObject:", v2->_accountMigrator);
    -[NSHashTable addObject:](v2->_migrators, "addObject:", v2->_messageMigrator);
    -[NSHashTable addObject:](v2->_migrators, "addObject:", v2->_bookmarkMigrator);
    -[NSHashTable addObject:](v2->_migrators, "addObject:", v2->_applicationMigrator);
    -[NSHashTable addObject:](v2->_migrators, "addObject:", v2->_accessibilitySettingMigrator);
    -[NSHashTable addObject:](v2->_migrators, "addObject:", v2->_displaySettingMigrator);
    -[NSHashTable addObject:](v2->_migrators, "addObject:", v2->_contactMigrator);
    -[NSHashTable addObject:](v2->_migrators, "addObject:", v2->_callHistoryMigrator);
    -[NSHashTable addObject:](v2->_migrators, "addObject:", v2->_calendarMigrator);
    -[NSHashTable addObject:](v2->_migrators, "addObject:", v2->_photoLibraryImageMigrator);
    -[NSHashTable addObject:](v2->_migrators, "addObject:", v2->_photoLibraryVideoMigrator);
    -[NSHashTable addObject:](v2->_migrators, "addObject:", v2->_photoLibraryAlbumMigrator);
    -[NSHashTable addObject:](v2->_migrators, "addObject:", v2->_voiceMemoMigrator);
    -[NSHashTable addObject:](v2->_migrators, "addObject:", v2->_fileMigrator);
    -[NSHashTable addObject:](v2->_migrators, "addObject:", v2->_containerMigrator);
    -[NSHashTable addObject:](v2->_migrators, "addObject:", v2->_simMigrator);
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v49 = v2->_migrators;
    v50 = -[NSHashTable countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v56;
      do
      {
        v53 = 0;
        do
        {
          if (*(_QWORD *)v56 != v52)
            objc_enumerationMutation(v49);
          objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * v53++), "setDelegate:", v2, (_QWORD)v55);
        }
        while (v51 != v53);
        v51 = -[NSHashTable countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
      }
      while (v51);
    }

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[MKAPIServer cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)MKAPIServer;
  -[MKAPIServer dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  MKAPIServer *v3;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  NSHashTable *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[MKHTTPServer cancel](self->_http, "cancel");
  -[MKHTTPServer cancel](self->_https, "cancel");
  -[MKUSBHTTPServer cancel](self->_usb, "cancel");
  if (self->_https)
  {
    v3 = self;
    objc_sync_enter(v3);
    if (!v3->_success)
    {
      -[MKAPIServer setImportContexts](v3, "setImportContexts");
      WeakRetained = objc_loadWeakRetained((id *)&v3->_delegate);
      objc_msgSend(WeakRetained, "server:didChangeState:withContext:", v3, 2, v3->_context);

      -[MKAPIServer setDelegate:](v3, "setDelegate:", 0);
      -[MKSIMMigrator remove](v3->_simMigrator, "remove");
      -[MKPlaceholderMigrator remove](v3->_placeholderMigrator, "remove");
      +[MKAnalytics sharedInstance](MKAnalytics, "sharedInstance");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_sync_enter(v5);
      objc_msgSend(v5, "payload");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setState:", CFSTR("com.apple.migrationkit.canceled"));

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceDate:", v3->_startDate);
      v9 = v8;
      objc_msgSend(v5, "payload");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setElapsedTime:", (unint64_t)v9);

      objc_msgSend(v5, "send");
      objc_msgSend(v5, "reset");
      objc_sync_exit(v5);

    }
    objc_sync_exit(v3);

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v11 = self->_migrators;
  v12 = -[NSHashTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "cancel", (_QWORD)v15);
      }
      v12 = -[NSHashTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (void)import
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSHashTable allObjects](self->_migrators, "allObjects", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "import");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)runHTTP
{
  MKSRPServer *v3;
  MKSRPPrecheck *v4;
  void *v5;
  uint64_t v6;
  MKGETStatusRouter *v7;
  MKGETStatusRouter *getStatusRouter;
  MKHTTPServer *v9;
  MKHTTPServer *http;
  MKUSBHTTPServer *v11;
  MKUSBHTTPServer *usb;
  MKUSBHTTPServer *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id WeakRetained;
  void *v21;
  void *v22;
  MKPOSTCertificateRouter *v23;
  MKGETCertificateRouter *v24;
  MKPOSTSRPPrecheckRouter *v25;
  MKGETSRPPrecheckRouter *v26;
  MKPOSTSRPRouter *v27;
  MKGETSRPRouter *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[2];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  -[MKHTTPServer cancel](self->_http, "cancel");
  -[MKUSBHTTPServer cancel](self->_usb, "cancel");
  v3 = objc_alloc_init(MKSRPServer);
  v28 = -[MKGETSRPRouter initWithSRP:]([MKGETSRPRouter alloc], "initWithSRP:", v3);
  -[MKGETSRPRouter setDelegate:](v28, "setDelegate:", self);
  v27 = -[MKPOSTSRPRouter initWithSRP:]([MKPOSTSRPRouter alloc], "initWithSRP:", v3);
  -[MKPOSTSRPRouter setDelegate:](v27, "setDelegate:", self);
  v4 = [MKSRPPrecheck alloc];
  -[MKSRPServer password](v3, "password");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MKSRPPrecheck initWithPassword:](v4, "initWithPassword:", v5);

  v26 = -[MKGETSRPPrecheckRouter initWithPrecheck:]([MKGETSRPPrecheckRouter alloc], "initWithPrecheck:", v6);
  v22 = (void *)v6;
  v25 = -[MKPOSTSRPPrecheckRouter initWithPrecheck:]([MKPOSTSRPPrecheckRouter alloc], "initWithPrecheck:", v6);
  v24 = -[MKGETCertificateRouter initWithSRP:certificate:]([MKGETCertificateRouter alloc], "initWithSRP:certificate:", v3, self->_certificate);
  -[MKGETCertificateRouter setDelegate:](v24, "setDelegate:", self);
  v23 = -[MKPOSTCertificateRouter initWithSRP:]([MKPOSTCertificateRouter alloc], "initWithSRP:", v3);
  -[MKPOSTCertificateRouter setDelegate:](v23, "setDelegate:", self);
  v7 = objc_alloc_init(MKGETStatusRouter);
  getStatusRouter = self->_getStatusRouter;
  self->_getStatusRouter = v7;

  v9 = objc_alloc_init(MKHTTPServer);
  http = self->_http;
  self->_http = v9;

  -[MKHTTPServer setDelegate:](self->_http, "setDelegate:", self);
  v11 = objc_alloc_init(MKUSBHTTPServer);
  usb = self->_usb;
  self->_usb = v11;

  -[MKUSBHTTPServer setDelegate:](self->_usb, "setDelegate:", self);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v13 = self->_usb;
  v33[0] = self->_http;
  v33[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v19, "addRouter:method:path:", v28, 1, CFSTR("/srp"));
        objc_msgSend(v19, "addRouter:method:path:", v27, 3, CFSTR("/srp"));
        objc_msgSend(v19, "addRouter:method:path:", v26, 1, CFSTR("/srp/precheck"));
        objc_msgSend(v19, "addRouter:method:path:", v25, 3, CFSTR("/srp/precheck"));
        objc_msgSend(v19, "addRouter:method:path:", v24, 1, CFSTR("/certificate"));
        objc_msgSend(v19, "addRouter:method:path:", v23, 3, CFSTR("/certificate"));
        objc_msgSend(v19, "addRouter:method:path:", self->_getStatusRouter, 1, CFSTR("/status"));
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v16);
  }

  -[MKHTTPServer setService:](self->_http, "setService:", CFSTR("com.apple.migrationkit.http"));
  -[MKHTTPServer run](self->_http, "run");
  -[MKUSBHTTPServer run](self->_usb, "run");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[MKSRPServer password](v3, "password");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "server:didCreateCode:", self, v21);

}

- (void)setPreferredChannel:(int64_t)a3
{
  self->_preferredChannel = a3;
  -[MKGETStatusRouter setPreferredChannel:](self->_getStatusRouter, "setPreferredChannel:");
}

- (void)runHTTPS:(id)a3
{
  id v4;
  MKPUTRouter *v5;
  MKGETSecuredStatusRouter *v6;
  void *v7;
  void *v8;
  void *v9;
  MKHTTPServer *v10;
  MKHTTPServer *https;
  MKUSBHTTPServer *usb;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  NSDate *startDate;
  MKAPIServer *v20;
  MKAPIServer *v21;
  void *v22;
  id obj;
  MKDELETESIMRouter *v24;
  MKGETMigratorRouter *v25;
  MKDELETEPlaceholderRouter *v26;
  MKGETPlaceholderRouter *v27;
  MKPOSTProgressRouter *v28;
  MKPOSTClientRouter *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[2];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MKHTTPServer cancel](self->_https, "cancel");
  v29 = objc_alloc_init(MKPOSTClientRouter);
  -[MKPOSTClientRouter setDelegate:](v29, "setDelegate:", self);
  v5 = objc_alloc_init(MKPUTRouter);
  -[MKPUTRouter setDelegate:](v5, "setDelegate:", self);
  v28 = objc_alloc_init(MKPOSTProgressRouter);
  -[MKPOSTProgressRouter setDelegate:](v28, "setDelegate:", self);
  v6 = objc_alloc_init(MKGETSecuredStatusRouter);
  -[MKGETSecuredStatusRouter setGetStatusRouter:](v6, "setGetStatusRouter:", self->_getStatusRouter);
  -[MKPUTRouter supportedContentTypes](v5, "supportedContentTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKGETSecuredStatusRouter setSupportedContentTypes:](v6, "setSupportedContentTypes:", v7);

  -[MKPUTRouter supportedTransferEncodings](v5, "supportedTransferEncodings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKGETSecuredStatusRouter setSupportedTransferEncodings:](v6, "setSupportedTransferEncodings:", v8);

  -[MKContainerMigrator signatures](self->_containerMigrator, "signatures");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKGETSecuredStatusRouter setSignatures:](v6, "setSignatures:", v9);

  v27 = objc_alloc_init(MKGETPlaceholderRouter);
  v26 = objc_alloc_init(MKDELETEPlaceholderRouter);
  v25 = objc_alloc_init(MKGETMigratorRouter);
  -[MKGETMigratorRouter setMigrators:](v25, "setMigrators:", self->_migrators);
  v24 = objc_alloc_init(MKDELETESIMRouter);
  -[MKDELETESIMRouter setDelegate:](v24, "setDelegate:", self);
  v10 = objc_alloc_init(MKHTTPServer);
  https = self->_https;
  self->_https = v10;

  -[MKHTTPServer setDelegate:](self->_https, "setDelegate:", self);
  -[MKHTTPServer setCertificate:](self->_https, "setCertificate:", self->_certificate);
  v22 = v4;
  -[MKHTTPServer setClientCertificate:](self->_https, "setClientCertificate:", v4);
  -[MKHTTPServer setUseHTTPS:](self->_https, "setUseHTTPS:", 1);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  usb = self->_usb;
  v21 = self;
  v34[0] = self->_https;
  v34[1] = usb;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 2);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v31 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v17, "addRouter:method:path:", v29, 3, CFSTR("/client"));
        objc_msgSend(v17, "addRouter:method:path:", v5, 4, CFSTR("/"));
        objc_msgSend(v17, "addRouter:method:path:", v28, 3, CFSTR("/progress"));
        objc_msgSend(v17, "addRouter:method:path:", v6, 1, CFSTR("/status"));
        objc_msgSend(v17, "addRouter:method:path:", v27, 1, CFSTR("/placeholder"));
        objc_msgSend(v17, "addRouter:method:path:", v26, 5, CFSTR("/placeholder"));
        objc_msgSend(v17, "addRouter:method:path:", v25, 1, CFSTR("/migrator"));
        objc_msgSend(v17, "addRouter:method:path:", v24, 5, CFSTR("/sim"));
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v14);
  }

  -[MKHTTPServer setService:](v21->_https, "setService:", CFSTR("com.apple.migrationkit.https"));
  -[MKHTTPServer run](v21->_https, "run");
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v18 = objc_claimAutoreleasedReturnValue();
  startDate = v21->_startDate;
  v21->_startDate = (NSDate *)v18;

  v20 = v21;
  objc_sync_enter(v20);
  v20->_isImporting = 0;
  objc_sync_exit(v20);

}

- (void)server:(id)a3 didOpen:(int64_t)a4
{
  MKHTTPServer *v6;
  NSObject *v7;
  MKAPIServer *v8;
  uint64_t v9;
  int v10;
  MKHTTPServer *v11;
  __int16 v12;
  int64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = (MKHTTPServer *)a3;
  +[MKLog log](MKLog, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v10 = 138412546;
    v11 = v6;
    v12 = 2048;
    v13 = a4;
    _os_log_impl(&dword_21EC08000, v7, OS_LOG_TYPE_INFO, "%@ open %ld port.", (uint8_t *)&v10, 0x16u);
  }

  v8 = self;
  objc_sync_enter(v8);
  if (v8->_http == v6)
  {
    v9 = 1;
    goto LABEL_7;
  }
  if (v8->_https == v6)
  {
    v9 = 2;
LABEL_7:
    -[MKGETStatusRouter setState:](v8->_getStatusRouter, "setState:", v9);
  }
  objc_sync_exit(v8);

}

- (void)serverDidCancel:(id)a3
{
  MKAPIServer *v4;
  MKHTTPServer *v5;

  v5 = (MKHTTPServer *)a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_https == v5)
    -[MKGETStatusRouter setState:](v4->_getStatusRouter, "setState:", 3);
  objc_sync_exit(v4);

}

- (void)usbHTTPServerDidClose:(id)a3
{
  if (!self->_isImporting)
    -[MKAPIServer cancel](self, "cancel", a3);
}

- (void)routerDidRevokeEncryptionKey:(id)a3
{
  -[MKHTTPServer cancel](self->_https, "cancel", a3);
}

- (void)routerDidAuthenticateClient:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "serverDidAuthenticateClient:", self);

}

- (void)routerDidRejectClient:(id)a3
{
  id WeakRetained;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "serverDidRejectClient:", self);

  +[MKAnalytics sharedInstance](MKAnalytics, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  objc_msgSend(v5, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setState:", CFSTR("com.apple.migrationkit.rejected"));

  objc_msgSend(v5, "send");
  objc_msgSend(v5, "reset");
  objc_sync_exit(v5);

}

- (void)router:(id)a3 didReceiveCertifciate:(id)a4
{
  -[MKAPIServer runHTTPS:](self, "runHTTPS:", a4);
}

- (void)router:(id)a3 didReceiveClient:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  MKAPIServer *v16;
  MKDiscoverabilitySignals *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint8_t buf[4];
  MKAPIServer *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v31 = a3;
  v6 = a4;
  +[MKLog log](MKLog, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "hostname");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "brand");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "model");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "os");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "version");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inputMethodLanguages");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138414594;
    v33 = self;
    v34 = 2112;
    v35 = v30;
    v36 = 2112;
    v37 = v8;
    v38 = 2112;
    v39 = v9;
    v40 = 2112;
    v41 = v10;
    v42 = 2112;
    v43 = v11;
    v44 = 2112;
    v45 = v12;
    v46 = 2112;
    v47 = v13;
    v48 = 2112;
    v49 = v14;
    v50 = 2048;
    v51 = objc_msgSend(v6, "activatedCellularPlans");
    _os_log_impl(&dword_21EC08000, v7, OS_LOG_TYPE_INFO, "%@ did receive a client. hostname=%@, brand=%@, model=%@, name=%@, os=%@, version=%@, locale=%@, inputMethodLanguages=%@ activatedCellularPlans=%lu", buf, 0x66u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "server:didReceiveClient:", self, v6);

  v16 = self;
  objc_sync_enter(v16);
  -[MKAPIServer setClient:](v16, "setClient:", v6);
  -[MKSIMMigrator setActivatedCellularPlansCount:](v16->_simMigrator, "setActivatedCellularPlansCount:", objc_msgSend(v6, "activatedCellularPlans"));
  v17 = objc_alloc_init(MKDiscoverabilitySignals);
  -[MKAPIServer setDiscoverabilitySignals:](v16, "setDiscoverabilitySignals:", v17);

  -[MKAPIServer discoverabilitySignals](v16, "discoverabilitySignals");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSignalsForClient:", v6);

  objc_sync_exit(v16);
  +[MKAnalytics sharedInstance](MKAnalytics, "sharedInstance");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v19);
  objc_msgSend(v6, "os");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "payload");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAndroidAPILevel:", v20);

  objc_msgSend(v6, "brand");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "payload");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAndroidBrand:", v22);

  objc_msgSend(v6, "locale");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "payload");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setAndroidLocale:", v24);

  objc_msgSend(v6, "model");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "payload");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setAndroidModel:", v26);

  objc_msgSend(v6, "version");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "payload");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setAndroidVersion:", v28);

  objc_sync_exit(v19);
}

- (void)router:(id)a3 didUpdateProgress:(float)a4 remainingTime:(unint64_t)a5 state:(int)a6
{
  id v10;
  float v11;
  MKAPIServer *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  char v17;
  id v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  id *p_delegate;
  id WeakRetained;
  void *v28;
  MKContext *context;
  MKAPIServer *v30;
  uint64_t v31;
  float v32;
  id v33;
  double v34;
  void *v35;
  unint64_t v36;

  v10 = a3;
  v36 = a5;
  if (a4 <= 0.99)
    v11 = a4;
  else
    v11 = 0.99;
  v12 = self;
  objc_sync_enter(v12);
  v13 = -[MKProgress completedOperationCount](v12->_progress, "completedOperationCount");
  v14 = -[MKProgress totalOperationCount](v12->_progress, "totalOperationCount");
  v15 = v14;
  v16 = a4 < 1.0 || v14 == 0;
  v17 = v16;
  if (v16)
  {
    if (a4 >= 1.0)
    {
LABEL_22:
      -[MKAPIServer import](v12, "import");
      objc_sync_exit(v12);

      goto LABEL_29;
    }
  }
  else
  {
    v12->_isImporting = 1;
    -[MKProgress progress:](v12->_progress, "progress:", &v36);
    v11 = (float)(v32 * 0.01) + 0.99;
    v36 = 0;
    if (v11 >= 1.0)
      goto LABEL_22;
  }
  if (a4 < 0.0)
  {
    -[MKAPIServer setImportContexts](v12, "setImportContexts");
    v12->_success = 0;
    +[MKAnalytics sharedInstance](MKAnalytics, "sharedInstance");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v18);
    objc_msgSend(v18, "payload");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (a6 == 2)
      v21 = CFSTR("com.apple.migrationkit.android.canceled");
    else
      v21 = CFSTR("com.apple.migrationkit.failed");
    objc_msgSend(v19, "setState:", v21);

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "timeIntervalSinceDate:", v12->_startDate);
    v24 = v23;
    objc_msgSend(v18, "payload");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setElapsedTime:", (unint64_t)v24);

    objc_msgSend(v18, "send");
    objc_msgSend(v18, "reset");
    objc_sync_exit(v18);

  }
  objc_sync_exit(v12);

  p_delegate = (id *)&v12->_delegate;
  if (a6 == 3)
  {
    WeakRetained = objc_loadWeakRetained(p_delegate);
    v28 = WeakRetained;
    context = v12->_context;
    v30 = v12;
    v31 = 3;
    goto LABEL_24;
  }
  if (a6 == 2)
  {
    WeakRetained = objc_loadWeakRetained(p_delegate);
    v28 = WeakRetained;
    context = v12->_context;
    v30 = v12;
    v31 = 2;
LABEL_24:
    objc_msgSend(WeakRetained, "server:didChangeState:withContext:", v30, v31, context);

    -[MKAPIServer setDelegate:](v12, "setDelegate:", 0);
    goto LABEL_29;
  }
  v33 = objc_loadWeakRetained(p_delegate);
  v35 = v33;
  if ((v17 & 1) != 0)
  {
    *(float *)&v34 = v11;
    objc_msgSend(v33, "server:didUpdateProgress:remainingTime:completedOperationCount:totalOperationCount:", v12, v36, v13, v15, v34);
  }
  else
  {
    objc_msgSend(v33, "serverWillImport:", v12);
  }

LABEL_29:
}

- (void)migratorWillExecuteOperation:(id)a3
{
  MKAPIServer *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[MKProgress addTotalOperationCount:](v4->_progress, "addTotalOperationCount:", 1);
  objc_sync_exit(v4);

}

- (void)migratorDidExecuteOperation:(id)a3
{
  id v4;
  MKAPIServer *v5;
  uint64_t v6;
  uint64_t v7;
  float v8;
  float v9;
  MKAPIServer *WeakRetained;
  double v11;
  uint64_t v12;

  v4 = a3;
  v12 = 0;
  v5 = self;
  objc_sync_enter(v5);
  -[MKProgress addCompletedOerationCount:](v5->_progress, "addCompletedOerationCount:", 1);
  v6 = -[MKProgress completedOperationCount](v5->_progress, "completedOperationCount");
  v7 = -[MKProgress totalOperationCount](v5->_progress, "totalOperationCount");
  if (!v7 || !v5->_isImporting)
    goto LABEL_6;
  -[MKProgress progress:](v5->_progress, "progress:", &v12);
  v9 = (float)(v8 * 0.01) + 0.99;
  v12 = 0;
  if (v9 >= 1.0)
  {
    -[MKAPIServer import](v5, "import");
LABEL_6:
    objc_sync_exit(v5);
    goto LABEL_7;
  }
  objc_sync_exit(v5);

  WeakRetained = (MKAPIServer *)objc_loadWeakRetained((id *)&v5->_delegate);
  *(float *)&v11 = v9;
  -[MKAPIServer server:didUpdateProgress:remainingTime:completedOperationCount:totalOperationCount:](WeakRetained, "server:didUpdateProgress:remainingTime:completedOperationCount:totalOperationCount:", v5, v12, v6, v7, v11);
  v5 = WeakRetained;
LABEL_7:

}

- (void)migratorDidComplete:(id)a3
{
  MKAPIServer *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  id WeakRetained;
  id v15;

  v15 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[MKAPIServer setImportContext:](v4, "setImportContext:", v15);
  -[NSHashTable removeObject:](v4->_migrators, "removeObject:", v15);
  v5 = -[NSHashTable count](v4->_migrators, "count");
  -[MKAPIServer discoverabilitySignals](v4, "discoverabilitySignals");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSignalsForMigrator:", v15);

  if (!v5)
  {
    v4->_success = 1;
    -[MKAPIServer discoverabilitySignals](v4, "discoverabilitySignals");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "donateSignals");

    +[MKAnalytics sharedInstance](MKAnalytics, "sharedInstance");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v8);
    objc_msgSend(v8, "payload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setState:", CFSTR("com.apple.migrationkit.completed"));

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceDate:", v4->_startDate);
    v12 = v11;
    objc_msgSend(v8, "payload");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setElapsedTime:", (unint64_t)v12);

    -[MKAPIServer processPerformanceMetrics](v4, "processPerformanceMetrics");
    objc_msgSend(v8, "send");
    objc_msgSend(v8, "reset");
    objc_sync_exit(v8);

    WeakRetained = objc_loadWeakRetained((id *)&v4->_delegate);
    objc_msgSend(WeakRetained, "server:didImportWithContext:", v4, v4->_context);

    -[MKAPIServer setDelegate:](v4, "setDelegate:", 0);
    -[MKAPIServer setSwitcherFlags](v4, "setSwitcherFlags");

  }
  objc_sync_exit(v4);

}

- (void)setImportContexts
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_migrators;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[MKAPIServer setImportContext:](self, "setImportContext:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)setImportContext:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  switch(objc_msgSend(v4, "type"))
  {
    case 0:
      -[MKContext accessibilitySetting](self->_context, "accessibilitySetting");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 1:
      -[MKContext account](self->_context, "account");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 2:
      -[MKContext application](self->_context, "application");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 3:
      -[MKContext bookmark](self->_context, "bookmark");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 4:
      -[MKContext calendar](self->_context, "calendar");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 5:
      -[MKContext contact](self->_context, "contact");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 6:
      -[MKContext callHistory](self->_context, "callHistory");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 7:
      -[MKContext container](self->_context, "container");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 8:
      -[MKContext displaySetting](self->_context, "displaySetting");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 9:
      -[MKContext file](self->_context, "file");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 10:
      -[MKContext message](self->_context, "message");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 11:
      -[MKContext image](self->_context, "image");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 12:
      -[MKContext video](self->_context, "video");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 13:
      -[MKContext album](self->_context, "album");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 14:
      -[MKContext voiceMemo](self->_context, "voiceMemo");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 15:
      -[MKContext placeholder](self->_context, "placeholder");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 16:
      -[MKContext sim](self->_context, "sim");
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_20:
      v7 = (id)v5;
      break;
    default:
      v7 = 0;
      break;
  }
  objc_msgSend(v7, "setImportCount:", objc_msgSend(v4, "importCount"));
  objc_msgSend(v7, "setImportErrorCount:", objc_msgSend(v4, "importErrorCount"));
  v6 = objc_msgSend(v4, "size");

  objc_msgSend(v7, "setSize:", v6);
}

- (void)router:(id)a3 didReceiveAccountEncodedInJSON:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[MKAccountMigrator importDataEncodedInJSON:](self->_accountMigrator, "importDataEncodedInJSON:", v6);
  +[MKAnalytics sharedInstance](MKAnalytics, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  objc_msgSend(v7, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accounts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", 1);

  objc_msgSend(v7, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accounts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCount:", objc_msgSend(v11, "count") + 1);

  objc_msgSend(v7, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accounts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSize:", objc_msgSend(v13, "size") + objc_msgSend(v6, "length"));

  objc_sync_exit(v7);
}

- (void)router:(id)a3 didReceiveMessageEncodedInJSON:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[MKMessageMigrator importDataEncodedInJSON:](self->_messageMigrator, "importDataEncodedInJSON:", v6);
  +[MKAnalytics sharedInstance](MKAnalytics, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  objc_msgSend(v7, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", 1);

  objc_msgSend(v7, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "messages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCount:", objc_msgSend(v11, "count") + 1);

  objc_msgSend(v7, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "messages");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSize:", objc_msgSend(v13, "size") + objc_msgSend(v6, "length"));

  objc_sync_exit(v7);
}

- (void)router:(id)a3 didReceiveBookmarkEncodedInJSON:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[MKBookmarkMigrator importDataEncodedInJSON:](self->_bookmarkMigrator, "importDataEncodedInJSON:", v6);
  +[MKAnalytics sharedInstance](MKAnalytics, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  objc_msgSend(v7, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bookmarks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", 1);

  objc_msgSend(v7, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bookmarks");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCount:", objc_msgSend(v11, "count") + 1);

  objc_msgSend(v7, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bookmarks");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSize:", objc_msgSend(v13, "size") + objc_msgSend(v6, "length"));

  objc_sync_exit(v7);
}

- (void)router:(id)a3 didReceiveApplicationEncodedInJSON:(id)a4
{
  -[MKApplicationMigrator importDataEncodedInJSON:](self->_applicationMigrator, "importDataEncodedInJSON:", a4);
}

- (void)router:(id)a3 didReceivePlaceholderEncodedInJSON:(id)a4
{
  -[MKPlaceholderMigrator importDataEncodedInJSON:](self->_placeholderMigrator, "importDataEncodedInJSON:", a4);
}

- (void)router:(id)a3 didReceiveAccessibilitySettingEncodedInJSON:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[MKAccessibilitySettingMigrator importDataEncodedInJSON:](self->_accessibilitySettingMigrator, "importDataEncodedInJSON:", v6);
  +[MKAnalytics sharedInstance](MKAnalytics, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  objc_msgSend(v7, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessibilitySettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", 1);

  objc_msgSend(v7, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessibilitySettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCount:", objc_msgSend(v11, "count") + 1);

  objc_msgSend(v7, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accessibilitySettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSize:", objc_msgSend(v13, "size") + objc_msgSend(v6, "length"));

  objc_sync_exit(v7);
}

- (void)router:(id)a3 didReceiveDisplaySettingEncodedInJSON:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[MKDisplaySettingMigrator importDataEncodedInJSON:](self->_displaySettingMigrator, "importDataEncodedInJSON:", v6);
  +[MKAnalytics sharedInstance](MKAnalytics, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  objc_msgSend(v7, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displaySettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", 1);

  objc_msgSend(v7, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displaySettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCount:", objc_msgSend(v11, "count") + 1);

  objc_msgSend(v7, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displaySettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSize:", objc_msgSend(v13, "size") + objc_msgSend(v6, "length"));

  objc_sync_exit(v7);
}

- (void)router:(id)a3 didReceiveSIMEncodedInJSON:(id)a4
{
  -[MKSIMMigrator importDataEncodedInJSON:](self->_simMigrator, "importDataEncodedInJSON:", a4);
}

- (void)router:(id)a3 didReceiveCallHistoryEncodedInJSON:(id)a4
{
  -[MKCallHistoryMigrator importDataEncodedInJSON:](self->_callHistoryMigrator, "importDataEncodedInJSON:", a4);
}

- (void)router:(id)a3 didReceiveVCard:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[MKContactMigrator importVCard:](self->_contactMigrator, "importVCard:", v6);
  +[MKAnalytics sharedInstance](MKAnalytics, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  objc_msgSend(v7, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contacts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", 1);

  objc_msgSend(v7, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contacts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCount:", objc_msgSend(v11, "count") + 1);

  objc_msgSend(v7, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contacts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSize:", objc_msgSend(v13, "size") + objc_msgSend(v6, "length"));

  objc_sync_exit(v7);
}

- (void)router:(id)a3 didReceiveICal:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[MKCalendarMigrator importiCal:](self->_calendarMigrator, "importiCal:", v6);
  +[MKAnalytics sharedInstance](MKAnalytics, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  objc_msgSend(v7, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "calendars");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", 1);

  objc_msgSend(v7, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "calendars");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCount:", objc_msgSend(v11, "count") + 1);

  objc_msgSend(v7, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "calendars");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSize:", objc_msgSend(v13, "size") + objc_msgSend(v6, "length"));

  objc_sync_exit(v7);
}

- (void)router:(id)a3 didReceiveImageChunk:(id)a4 identifier:(id)a5 offset:(unint64_t)a6 length:(unint64_t)a7 total:(unint64_t)a8 filename:(id)a9 collection:(id)a10 originalFilename:(id)a11 complete:(BOOL)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;

  v31 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  LOBYTE(v30) = a12;
  -[MKPhotoLibraryMigrator importChunk:identifier:offset:length:total:filename:collection:originalFilename:complete:](self->_photoLibraryImageMigrator, "importChunk:identifier:offset:length:total:filename:collection:originalFilename:complete:", v18, v19, a6, a7, a8, v20, v21, v22, v30);
  if (!a6)
  {
    +[MKAnalytics sharedInstance](MKAnalytics, "sharedInstance");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v23);
    objc_msgSend(v23, "payload");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "photos");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setEnabled:", 1);

    objc_msgSend(v23, "payload");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "photos");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setCount:", objc_msgSend(v27, "count") + 1);

    objc_msgSend(v23, "payload");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "photos");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setSize:", objc_msgSend(v29, "size") + a8);

    objc_sync_exit(v23);
  }

}

- (void)router:(id)a3 didReceiveVideoChunk:(id)a4 identifier:(id)a5 offset:(unint64_t)a6 length:(unint64_t)a7 total:(unint64_t)a8 filename:(id)a9 collection:(id)a10 originalFilename:(id)a11 complete:(BOOL)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;

  v31 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  LOBYTE(v30) = a12;
  -[MKPhotoLibraryMigrator importChunk:identifier:offset:length:total:filename:collection:originalFilename:complete:](self->_photoLibraryVideoMigrator, "importChunk:identifier:offset:length:total:filename:collection:originalFilename:complete:", v18, v19, a6, a7, a8, v20, v21, v22, v30);
  if (!a6)
  {
    +[MKAnalytics sharedInstance](MKAnalytics, "sharedInstance");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v23);
    objc_msgSend(v23, "payload");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "videos");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setEnabled:", 1);

    objc_msgSend(v23, "payload");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "videos");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setCount:", objc_msgSend(v27, "count") + 1);

    objc_msgSend(v23, "payload");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "videos");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setSize:", objc_msgSend(v29, "size") + a8);

    objc_sync_exit(v23);
  }

}

- (void)router:(id)a3 didReceiveAudioChunk:(id)a4 identifier:(id)a5 offset:(unint64_t)a6 length:(unint64_t)a7 total:(unint64_t)a8 filename:(id)a9 originalFilename:(id)a10 dateAdded:(id)a11 complete:(BOOL)a12
{
  -[MKVoiceMemoMigrator importChunk:identifier:offset:length:total:filename:originalFilename:dateAdded:complete:](self->_voiceMemoMigrator, "importChunk:identifier:offset:length:total:filename:originalFilename:dateAdded:complete:", a4, a5, a6, a7, a8, a9);
}

- (void)router:(id)a3 didReceiveFileChunk:(id)a4 filename:(id)a5 offset:(unint64_t)a6 length:(unint64_t)a7 total:(unint64_t)a8 complete:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v15 = a4;
  v16 = a5;
  -[MKFileMigrator importChunk:filename:offset:length:total:complete:](self->_fileMigrator, "importChunk:filename:offset:length:total:complete:", v15, v16, a6, a7, a8, a9);
  if (!a6)
  {
    +[MKAnalytics sharedInstance](MKAnalytics, "sharedInstance");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v17);
    objc_msgSend(v17, "payload");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "files");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setEnabled:", 1);

    objc_msgSend(v17, "payload");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "files");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setCount:", objc_msgSend(v21, "count") + 1);

    objc_msgSend(v17, "payload");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "files");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setSize:", objc_msgSend(v23, "size") + a8);

    objc_sync_exit(v17);
  }

}

- (void)routerDidDeleteSIM:(id)a3
{
  -[MKSIMMigrator remove](self->_simMigrator, "remove", a3);
}

- (void)router:(id)a3 didReceiveContainer:(id)a4 signature:(id)a5 chunk:(id)a6 filename:(id)a7 offset:(unint64_t)a8 length:(unint64_t)a9 total:(unint64_t)a10 required:(BOOL)a11 excludedFromBackup:(BOOL)a12 complete:(BOOL)a13
{
  -[MKContainerMigrator importContainer:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:](self->_containerMigrator, "importContainer:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:", a4, a5, a6, a7, a8, a9);
}

- (void)router:(id)a3 didReceiveDiagnosticsFile:(id)a4 filename:(id)a5
{
  -[MKDiagnosticsMigrator saveData:fileName:](self->_diagnosticsMigrator, "saveData:fileName:", a4, a5);
}

- (void)router:(id)a3 didReceivePerformanceMetrics:(id)a4
{
  -[MKDiagnosticsMigrator savePerformanceMetrics:](self->_diagnosticsMigrator, "savePerformanceMetrics:", a4);
}

- (void)processPerformanceMetrics
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_21EC08000, v0, v1, "%@: Failed to delete performance metrics file; error=%@");
  OUTLINED_FUNCTION_3();
}

- (void)setSwitcherFlags
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  uint64_t i;
  const __CFString *v24;
  void *v25;
  const void *v26;
  NSObject *v27;
  int v28;
  NSObject *v29;
  const char *v30;
  uint32_t v31;
  void *v32;
  const void *v33;
  const void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  const __CFString *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  _QWORD v44[4];
  _QWORD v45[6];

  v45[4] = *MEMORY[0x24BDAC8D0];
  +[MKLog log](MKLog, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EC08000, v3, OS_LOG_TYPE_INFO, "will set switcher flags.", buf, 2u);
  }

  v4 = (void *)MEMORY[0x24BDD17C8];
  -[MKAPIServer client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "brand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKAPIServer client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKAPIServer client](self, "client");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "brand");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@/%@/Android/%@/Android"), v6, v8, v10);
  v11 = objc_claimAutoreleasedReturnValue();

  v45[0] = MEMORY[0x24BDBD1C8];
  v44[0] = CFSTR("MigratedFromAndroid");
  v44[1] = CFSTR("MigratedFromAndroidToiOSVersion");
  +[MKSystem version](MKSystem, "version");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v12;
  v45[2] = v11;
  v32 = (void *)v11;
  v44[2] = CFSTR("MigratedFromAndroidDeviceType");
  v44[3] = CFSTR("MigratedFromAndroidOSVersion");
  -[MKAPIServer client](self, "client");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "os");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v45[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v16 = v15;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v36;
    v20 = (const __CFString *)*MEMORY[0x24BDBD568];
    v21 = (const __CFString *)*MEMORY[0x24BDBD590];
    v22 = (const __CFString *)*MEMORY[0x24BDBD570];
    v34 = (const void *)*MEMORY[0x24BDBD270];
    v33 = (const void *)*MEMORY[0x24BDBD268];
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v36 != v19)
          objc_enumerationMutation(v16);
        v24 = *(const __CFString **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v16, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v25, "BOOLValue"))
            v26 = v34;
          else
            v26 = v33;
          CFPreferencesSetValue(v24, v26, v20, v21, v22);
          +[MKLog log](MKLog, "log");
          v27 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            goto LABEL_18;
          v28 = objc_msgSend(v25, "BOOLValue");
          *(_DWORD *)buf = 138412546;
          v40 = v24;
          v41 = 1024;
          LODWORD(v42) = v28;
          v29 = v27;
          v30 = "%@ is set to %d.";
          v31 = 18;
          goto LABEL_17;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_19;
        CFPreferencesSetValue(v24, v25, v20, v21, v22);
        +[MKLog log](MKLog, "log");
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v40 = v24;
          v41 = 2112;
          v42 = v25;
          v29 = v27;
          v30 = "%@ is set to %@.";
          v31 = 22;
LABEL_17:
          _os_log_impl(&dword_21EC08000, v29, OS_LOG_TYPE_INFO, v30, buf, v31);
        }
LABEL_18:

LABEL_19:
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v18);
  }

}

+ (void)clean
{
  OUTLINED_FUNCTION_0_0(&dword_21EC08000, a2, a3, "could not delete the workspace. error=%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

intptr_t __20__MKAPIServer_clean__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "importAndWait");
  objc_msgSend(*(id *)(a1 + 32), "import");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (void)benchmark:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  const __CFDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  dispatch_semaphore_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD block[4];
  dispatch_semaphore_t v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD v22[3];
  char v23;
  _QWORD v24[3];
  CFUserNotificationRef v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[3];
  _QWORD v31[3];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v4, "appendString:", CFSTR("(Internal Only)"));
  v28 = 0u;
  v29 = 0u;
  v27 = 0u;
  v26 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  v7 = (const __CFDictionary *)v5;
  if (!v6)
    goto LABEL_10;
  v8 = v6;
  v9 = 0;
  v10 = *(_QWORD *)v27;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v27 != v10)
        objc_enumerationMutation(v5);
      v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
      objc_msgSend(v4, "appendString:", CFSTR("\n"));
      objc_msgSend(v12, "benchmark");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendString:", v13);

      v9 += objc_msgSend(v12, "count");
    }
    v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  }
  while (v8);

  if (v9)
  {
    v14 = dispatch_semaphore_create(0);
    v15 = *MEMORY[0x24BDBD6E0];
    v30[0] = *MEMORY[0x24BDBD6D8];
    v30[1] = v15;
    v31[0] = CFSTR("Import Complete");
    v31[1] = v4;
    v30[2] = *MEMORY[0x24BDBD6F8];
    v31[2] = CFSTR("OK");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
    v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    v25 = 0;
    v25 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0.0, 0, 0, v7);
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    v23 = 0;
    dispatch_get_global_queue(25, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __25__MKAPIServer_benchmark___block_invoke;
    block[3] = &unk_24E359438;
    v20 = v24;
    v21 = v22;
    v19 = v14;
    v17 = v14;
    dispatch_async(v16, block);

    dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
    _Block_object_dispose(v22, 8);
    _Block_object_dispose(v24, 8);
LABEL_10:

  }
}

intptr_t __25__MKAPIServer_benchmark___block_invoke(uint64_t a1)
{
  CFOptionFlags responseFlags;

  responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), 0.0, &responseFlags);
  CFRelease(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = responseFlags == 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)isPhotosBenchmarkEnabled
{
  return +[MKPreferences BOOLForKey:](MKPreferences, "BOOLForKey:", CFSTR("enable_photos_benchmark")) == 1;
}

- (MKAPIServerDelegate)delegate
{
  return (MKAPIServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)preferredChannel
{
  return self->_preferredChannel;
}

- (MKClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (MKDiscoverabilitySignals)discoverabilitySignals
{
  return self->_discoverabilitySignals;
}

- (void)setDiscoverabilitySignals:(id)a3
{
  objc_storeStrong((id *)&self->_discoverabilitySignals, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoverabilitySignals, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_migrators, 0);
  objc_storeStrong((id *)&self->_simMigrator, 0);
  objc_storeStrong((id *)&self->_diagnosticsMigrator, 0);
  objc_storeStrong((id *)&self->_containerMigrator, 0);
  objc_storeStrong((id *)&self->_placeholderMigrator, 0);
  objc_storeStrong((id *)&self->_fileMigrator, 0);
  objc_storeStrong((id *)&self->_voiceMemoMigrator, 0);
  objc_storeStrong((id *)&self->_photoLibraryAlbumMigrator, 0);
  objc_storeStrong((id *)&self->_photoLibraryVideoMigrator, 0);
  objc_storeStrong((id *)&self->_photoLibraryImageMigrator, 0);
  objc_storeStrong((id *)&self->_calendarMigrator, 0);
  objc_storeStrong((id *)&self->_callHistoryMigrator, 0);
  objc_storeStrong((id *)&self->_contactMigrator, 0);
  objc_storeStrong((id *)&self->_displaySettingMigrator, 0);
  objc_storeStrong((id *)&self->_accessibilitySettingMigrator, 0);
  objc_storeStrong((id *)&self->_applicationMigrator, 0);
  objc_storeStrong((id *)&self->_bookmarkMigrator, 0);
  objc_storeStrong((id *)&self->_messageMigrator, 0);
  objc_storeStrong((id *)&self->_accountMigrator, 0);
  objc_storeStrong((id *)&self->_getStatusRouter, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_usb, 0);
  objc_storeStrong((id *)&self->_https, 0);
  objc_storeStrong((id *)&self->_http, 0);
  objc_storeStrong((id *)&self->_certificate, 0);
}

@end
