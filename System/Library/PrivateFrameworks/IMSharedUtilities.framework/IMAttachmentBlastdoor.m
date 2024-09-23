@implementation IMAttachmentBlastdoor

+ (id)logger
{
  if (qword_1ECFC7240 != -1)
    dispatch_once(&qword_1ECFC7240, &unk_1E3FB34A8);
  return (id)qword_1ECFC7230;
}

+ (BOOL)supportsFeature:(id)a3
{
  int v4;
  NSObject *v5;
  const __CFString *v6;
  NSObject *v7;
  int v9;
  id v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (qword_1EE503DE0 != -1)
    dispatch_once(&qword_1EE503DE0, &unk_1E3FB27F8);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend((id)qword_1EE503DE8, "supportsFeature:", a3);
    v5 = +[IMAttachmentBlastdoor logger](IMAttachmentBlastdoor, "logger");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("NO");
      if (v4)
        v6 = CFSTR("YES");
      v9 = 138412546;
      v10 = a3;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_DEFAULT, "Installed BlastDoor supports feature %@ (%@)", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    v7 = +[IMAttachmentBlastdoor logger](IMAttachmentBlastdoor, "logger");
    LOBYTE(v4) = 0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = a3;
      _os_log_impl(&dword_19E239000, v7, OS_LOG_TYPE_DEFAULT, "Outdated BlastDoor: Cannot check feature (%@) support", (uint8_t *)&v9, 0xCu);
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

+ (id)blastdoorInterfaceForSenderContext:(id)a3
{
  int v4;
  uint64_t *v5;

  if (-[IMFeatureFlags isUnknownSenderBlastDoorEnabled](+[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags"), "isUnknownSenderBlastDoorEnabled"))
  {
    if (qword_1ECFC6D50 != -1)
      dispatch_once(&qword_1ECFC6D50, &unk_1E3FB2838);
    if (qword_1ECFC6D68 != -1)
      dispatch_once(&qword_1ECFC6D68, &unk_1E3FB17E8);
    v4 = objc_msgSend(a3, "isTrustedSender");
    v5 = &qword_1ECFC6D58;
    if (!v4)
      v5 = &qword_1ECFC6D60;
    return (id)*v5;
  }
  else
  {
    if (qword_1EE503E48 != -1)
      dispatch_once(&qword_1EE503E48, &unk_1E3FB4468);
    return (id)qword_1EE503E50;
  }
}

+ (void)generatePreview:(id)a3 senderContext:(id)a4 maxPxWidth:(double)a5 scale:(double)a6 withCompletionBlock:(id)a7
{
  NSObject *v13;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  id v18;
  const __CFString *v19;
  uint64_t v20;
  _QWORD v21[5];
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a3 && a7)
  {
    v13 = +[IMAttachmentBlastdoor logger](IMAttachmentBlastdoor, "logger");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = a3;
      _os_log_impl(&dword_19E239000, v13, OS_LOG_TYPE_DEFAULT, "Sending request to generate preview to BlastDoor for %@", buf, 0xCu);
    }
    v14 = (void *)objc_msgSend(a1, "blastdoorInterfaceForSenderContext:", a4);
    *(float *)&v15 = a5;
    *(float *)&v16 = a6;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = sub_19E2810C4;
    v21[3] = &unk_1E3FB5AD8;
    v21[4] = a7;
    objc_msgSend(v14, "generatePreviewforAttachmentWithfileURL:maxPixelDimension:scale:resultHandler:", a3, v21, v15, v16);
  }
  else
  {
    v17 = +[IMAttachmentBlastdoor logger](IMAttachmentBlastdoor, "logger", a5, a6);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v23 = a7;
      v24 = 2112;
      v25 = a3;
      _os_log_impl(&dword_19E239000, v17, OS_LOG_TYPE_DEFAULT, "Invalid image preview input. Completion? %@, sourceURL? %@", buf, 0x16u);
    }
    if (a7)
    {
      v18 = objc_alloc(MEMORY[0x1E0C99D80]);
      if (a3)
        v19 = (const __CFString *)objc_msgSend(a3, "absoluteString");
      else
        v19 = CFSTR("NO");
      v20 = objc_msgSend(v18, "initWithObjectsAndKeys:", v19, CFSTR("sourceURL"), 0);
      (*((void (**)(id, _QWORD, uint64_t))a7 + 2))(a7, 0, objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("__kIMCoreAttachmentBlastdoorErrorDomain"), 13301, v20));
    }
  }
}

+ (void)generateWorkoutPreview:(id)a3 senderContext:(id)a4 maxPxWidth:(double)a5 scale:(double)a6 withCompletionBlock:(id)a7
{
  NSObject *v13;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  id v18;
  const __CFString *v19;
  uint64_t v20;
  _QWORD v21[5];
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  double v27;
  __int16 v28;
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (a3 && a7)
  {
    v13 = +[IMAttachmentBlastdoor logger](IMAttachmentBlastdoor, "logger");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = a3;
      _os_log_impl(&dword_19E239000, v13, OS_LOG_TYPE_DEFAULT, "Sending request to generate workout preview to BlastDoor for %@", buf, 0xCu);
    }
    v14 = (void *)objc_msgSend(a1, "blastdoorInterfaceForSenderContext:", a4);
    *(float *)&v15 = a5;
    *(float *)&v16 = a6;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = sub_19E281478;
    v21[3] = &unk_1E3FB5AD8;
    v21[4] = a7;
    objc_msgSend(v14, "generateWorkoutPreviewForAttachmentWithFileURL:maxPixelDimension:scale:resultHandler:", a3, v21, v15, v16);
  }
  else
  {
    v17 = +[IMAttachmentBlastdoor logger](IMAttachmentBlastdoor, "logger");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v23 = a7;
      v24 = 2112;
      v25 = a3;
      v26 = 2048;
      v27 = a5;
      v28 = 2048;
      v29 = a6;
      _os_log_impl(&dword_19E239000, v17, OS_LOG_TYPE_DEFAULT, "Invalid workout preview input. Completion? %@, sourceURL? %@, maxPxWidth: %f, scale: %f", buf, 0x2Au);
    }
    if (a7)
    {
      v18 = objc_alloc(MEMORY[0x1E0C99D80]);
      if (a3)
        v19 = (const __CFString *)objc_msgSend(a3, "absoluteString");
      else
        v19 = CFSTR("NO");
      v20 = objc_msgSend(v18, "initWithObjectsAndKeys:", v19, CFSTR("sourceURL"), 0);
      (*((void (**)(id, _QWORD, uint64_t))a7 + 2))(a7, 0, objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("__kIMCoreAttachmentBlastdoorErrorDomain"), 13301, v20));
    }
  }
}

+ (void)sendData:(id)a3 senderContext:(id)a4 forPreviewType:(unsigned __int8)a5 withCompletionBlock:(id)a6
{
  uint64_t v8;
  NSObject *v11;
  void *v12;
  id v13;
  const __CFString *v14;
  uint64_t v15;
  _QWORD v16[5];
  char v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a3 && a6)
  {
    v8 = a5;
    v11 = +[IMAttachmentBlastdoor logger](IMAttachmentBlastdoor, "logger");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v19 = v8;
      _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_DEFAULT, "Piping data through BlastDoor for preview type: %u", buf, 8u);
    }
    v12 = (void *)objc_msgSend(a1, "blastdoorInterfaceForSenderContext:", a4);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_19E281704;
    v16[3] = &unk_1E3FB5B00;
    v17 = v8;
    v16[4] = a6;
    objc_msgSend(v12, "defuseData:forPreviewType:resultHandler:", a3, v8, v16);
  }
  else if (a6)
  {
    v13 = objc_alloc(MEMORY[0x1E0C99D80]);
    if (a3)
      v14 = (const __CFString *)objc_msgSend(a3, "description");
    else
      v14 = CFSTR("NO");
    v15 = objc_msgSend(v13, "initWithObjectsAndKeys:", v14, CFSTR("data"), 0);
    (*((void (**)(id, _QWORD, uint64_t))a6 + 2))(a6, 0, objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("__kIMCoreAttachmentBlastdoorErrorDomain"), 13301, v15));
  }
}

+ (void)generateMoviePreview:(id)a3 senderContext:(id)a4 maxPxWidth:(double)a5 minThumbnailPxSize:(CGSize)a6 scale:(double)a7 withCompletionBlock:(id)a8
{
  double height;
  double width;
  NSObject *v16;
  void *v17;
  double v18;
  double v19;
  NSObject *v20;
  id v21;
  const __CFString *v22;
  uint64_t v23;
  _QWORD v24[5];
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (a3 && a8)
  {
    height = a6.height;
    width = a6.width;
    v16 = +[IMAttachmentBlastdoor logger](IMAttachmentBlastdoor, "logger");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = a3;
      _os_log_impl(&dword_19E239000, v16, OS_LOG_TYPE_DEFAULT, "Sending request to generate movie preview to BlastDoor for %@", buf, 0xCu);
    }
    v17 = (void *)objc_msgSend(a1, "blastdoorInterfaceForSenderContext:", a4);
    *(float *)&v18 = a5;
    *(float *)&v19 = a7;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = sub_19E281AD4;
    v24[3] = &unk_1E3FB5AD8;
    v24[4] = a8;
    objc_msgSend(v17, "generateMoviePreviewForAttachmentWithFileURL:maxPixelDimension:minThumbnailPxSize:scale:resultHandler:", a3, v24, v18, width, height, v19);
  }
  else
  {
    v20 = +[IMAttachmentBlastdoor logger](IMAttachmentBlastdoor, "logger", a5, a6.width, a6.height);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v26 = a8;
      v27 = 2112;
      v28 = a3;
      v29 = 2048;
      v30 = a5;
      v31 = 2048;
      v32 = a7;
      _os_log_impl(&dword_19E239000, v20, OS_LOG_TYPE_DEFAULT, "Invalid movie preview input. Completion? %@, sourceURL? %@, maxPxWidth: %f, scale: %f", buf, 0x2Au);
    }
    if (a8)
    {
      v21 = objc_alloc(MEMORY[0x1E0C99D80]);
      if (a3)
        v22 = (const __CFString *)objc_msgSend(a3, "absoluteString");
      else
        v22 = CFSTR("NO");
      v23 = objc_msgSend(v21, "initWithObjectsAndKeys:", v22, CFSTR("sourceURL"), 0);
      (*((void (**)(id, _QWORD, uint64_t))a8 + 2))(a8, 0, objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("__kIMCoreAttachmentBlastdoorErrorDomain"), 13301, v23));
    }
  }
}

+ (void)defuseBalloonPluginPayloadData:(id)a3 senderContext:(id)a4 withBundleIdentifier:(id)a5 completionBlock:(id)a6
{
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  NSObject *v25;
  uint64_t v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (a6)
  {
    if (a3)
    {
      v26 = 0;
      v8 = (void *)objc_msgSend((id)objc_msgSend(a1, "blastdoorInterfaceForSenderContext:", a4), "defuseBalloonPluginPayload:withIdentifier:error:", a3, a5, &v26);
      v9 = +[IMAttachmentBlastdoor logger](IMAttachmentBlastdoor, "logger");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v28 = (uint64_t)v8;
        v29 = 2112;
        v30 = a5;
        _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_DEFAULT, "Blastdoor response %p received (identifier: %@)", buf, 0x16u);
      }
      if (v8)
      {
        switch(objc_msgSend((id)objc_msgSend(v8, "payload"), "type"))
        {
          case 0:
            v10 = objc_msgSend((id)objc_msgSend(v8, "payload"), "messagesAppBalloon");
            goto LABEL_21;
          case 1:
            v10 = objc_msgSend((id)objc_msgSend(v8, "payload"), "handwriting");
            goto LABEL_21;
          case 2:
            v10 = objc_msgSend((id)objc_msgSend(v8, "payload"), "linkPresentation");
            goto LABEL_21;
          case 3:
            v25 = +[IMAttachmentBlastdoor logger](IMAttachmentBlastdoor, "logger");
            if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              goto LABEL_19;
            *(_WORD *)buf = 0;
            v22 = "[WARN] Should not have received BlastDoorBalloonPluginPayloadCombinedPluginAttachmentInfo back as payload type.";
            v23 = v25;
            v24 = 2;
            goto LABEL_18;
          case 4:
            v10 = objc_msgSend((id)objc_msgSend(v8, "payload"), "digitalTouchBalloon");
LABEL_21:
            v18 = v10;
            goto LABEL_22;
          default:
            v20 = +[IMAttachmentBlastdoor logger](IMAttachmentBlastdoor, "logger");
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              goto LABEL_19;
            v21 = objc_msgSend((id)objc_msgSend(v8, "payload"), "type");
            *(_DWORD *)buf = 134217984;
            v28 = v21;
            v22 = "[WARN] Unable to handle unknown payload type (type: %tu).";
            v23 = v20;
            v24 = 12;
LABEL_18:
            _os_log_impl(&dword_19E239000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
LABEL_19:
            v18 = 0;
LABEL_22:
            v19 = objc_msgSend(v8, "attachments");
            break;
        }
      }
      else
      {
        v11 = +[IMAttachmentBlastdoor logger](IMAttachmentBlastdoor, "logger");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          sub_19E36C1CC((uint64_t)&v26, v11, v12, v13, v14, v15, v16, v17);
        v18 = 0;
        v19 = 0;
      }
      (*((void (**)(id, uint64_t, uint64_t, uint64_t))a6 + 2))(a6, v18, v19, v26);
    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD, uint64_t))a6 + 2))(a6, 0, 0, objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("__kIMCoreAttachmentBlastdoorErrorDomain"), 13400, 0));
    }
  }
}

+ (void)sendBalloonPluginPayloadData:(id)a3 senderContext:(id)a4 withBundleIdentifier:(id)a5 completionBlock:(id)a6
{
  void *v6;
  uint64_t v7;
  _QWORD v8[6];

  if (a6)
  {
    if (a3)
    {
      v7 = 0;
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = sub_19E281E70;
      v8[3] = &unk_1E3FB5B28;
      v8[4] = a5;
      v8[5] = a6;
      v6 = (void *)objc_msgSend((id)objc_msgSend(a1, "blastdoorInterfaceForSenderContext:", a4), "defuseBalloonPluginPayload:withIdentifier:error:", a3, a5, &v7);
      sub_19E281E70((uint64_t)v8, v6, v7);
    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD, uint64_t))a6 + 2))(a6, 0, 0, objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("__kIMCoreAttachmentBlastdoorErrorDomain"), 13400, 0));
    }
  }
}

+ (void)generateAudioPreview:(id)a3 senderContext:(id)a4 withCompletionBlock:(id)a5
{
  void *v7;
  NSObject *v8;
  id v9;
  const __CFString *v10;
  uint64_t v11;
  _QWORD v12[6];
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3 && a5)
  {
    v7 = (void *)objc_msgSend(a1, "blastdoorInterfaceForSenderContext:", a4);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_19E2822EC;
    v12[3] = &unk_1E3FB5B50;
    v12[4] = a3;
    v12[5] = a5;
    objc_msgSend(v7, "generatePreviewforAudioMessageWithfileURL:resultHandler:", a3, v12);
  }
  else
  {
    v8 = +[IMAttachmentBlastdoor logger](IMAttachmentBlastdoor, "logger");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v14 = a5;
      v15 = 2112;
      v16 = a3;
      _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_DEFAULT, "Invalid audio preview input. Completion? %@, sourceURL? %@", buf, 0x16u);
    }
    if (a5)
    {
      v9 = objc_alloc(MEMORY[0x1E0C99D80]);
      if (a3)
        v10 = (const __CFString *)objc_msgSend(a3, "absoluteString");
      else
        v10 = CFSTR("NO");
      v11 = objc_msgSend(v9, "initWithObjectsAndKeys:", v10, CFSTR("sourceURL"), 0);
      (*((void (**)(id, _QWORD, uint64_t))a5 + 2))(a5, 0, objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("__kIMCoreAttachmentBlastdoorErrorDomain"), 13301, v11));
    }
  }
}

+ (void)generateNickname:(id)a3 senderContext:(id)a4 forRecordID:(id)a5 wallpaperDataTag:(id)a6 wallpaperLowResDataTag:(id)a7 wallpaperMetadataTag:(id)a8 withKey:(id)a9 processImageFields:(BOOL)a10 completionBlock:(id)a11
{
  uint64_t v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[6];
  _QWORD v28[8];

  v28[6] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance"), "isInternalInstall")
    && IMGetCachedDomainBoolForKeyWithDefaultValue())
  {
    v27[0] = CFSTR("nicknameData");
    v27[1] = CFSTR("recordID");
    v28[0] = a3;
    v28[1] = a5;
    v27[2] = CFSTR("wallpaperDataTag");
    v27[3] = CFSTR("wallpaperLowResDataTag");
    v28[2] = a6;
    v28[3] = a7;
    v27[4] = CFSTR("wallpaperMetadataTag");
    v27[5] = CFSTR("key");
    v28[4] = a8;
    v28[5] = a9;
    v18 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 6);
    +[IMInternalPayloadUtilities writeMessagePayloadToDisk:fileName:](IMInternalPayloadUtilities, "writeMessagePayloadToDisk:fileName:", v18, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.nicknamedata"), objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID")));
  }
  objc_msgSend(a1, "blastdoorInterfaceForSenderContext:", a4);
  v19 = objc_opt_respondsToSelector();
  v20 = (void *)objc_msgSend(a1, "blastdoorInterfaceForSenderContext:", a4);
  if ((v19 & 1) != 0)
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_19E282690;
    v26[3] = &unk_1E3FB5AD8;
    v26[4] = a11;
    LOBYTE(v23) = a10;
    objc_msgSend(v20, "defuseNicknameDictionary:withKey:recordTag:wallpaperDataTag:wallpaperLowResDataTag:wallpaperMetadataTag:processImageFields:resultHandler:", a3, a9, a5, a6, a7, a8, v23, v26);
  }
  else
  {
    v21 = objc_opt_respondsToSelector();
    v22 = (void *)objc_msgSend(a1, "blastdoorInterfaceForSenderContext:", a4);
    if ((v21 & 1) != 0)
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = sub_19E28269C;
      v25[3] = &unk_1E3FB5AD8;
      v25[4] = a11;
      objc_msgSend(v22, "defuseNicknameDictionary:withKey:recordTag:wallpaperDataTag:wallpaperLowResDataTag:wallpaperMetadataTag:resultHandler:", a3, a9, a5, a6, a7, a8, v25);
    }
    else
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = sub_19E2826A8;
      v24[3] = &unk_1E3FB5AD8;
      v24[4] = a11;
      objc_msgSend(v22, "defuseNicknameDictionary:withKey:recordTag:resultHandler:", a3, a9, a5, v24);
    }
  }
}

+ (void)generatePassPreview:(id)a3 senderContext:(id)a4 withCompletionBlock:(id)a5
{
  void *v7;
  double v8;
  id v9;
  const __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  _QWORD v13[5];

  if (a3 && a5)
  {
    v7 = (void *)objc_msgSend(a1, "blastdoorInterfaceForSenderContext:", a4);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_19E282848;
    v13[3] = &unk_1E3FB5AD8;
    v13[4] = a5;
    LODWORD(v8) = 0;
    objc_msgSend(v7, "generatePreviewforAttachmentWithfileURL:maxPixelDimension:scale:resultHandler:", a3, v13, 0.0, v8);
  }
  else
  {
    v9 = objc_alloc(MEMORY[0x1E0C99D80]);
    v10 = CFSTR("NO");
    if (a5)
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    if (a3)
      v10 = (const __CFString *)objc_msgSend(a3, "absoluteString");
    v12 = objc_msgSend(v9, "initWithObjectsAndKeys:", v11, CFSTR("completion"), v10, CFSTR("sourceURL"), 0);
    (*((void (**)(id, _QWORD, uint64_t))a5 + 2))(a5, 0, objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("__kIMCoreAttachmentBlastdoorErrorDomain"), 13301, v12));
  }
}

+ (void)generateAnimatedImagePreview:(id)a3 senderContext:(id)a4 destinationFileURL:(id)a5 maxPixelDimension:(double)a6 scale:(double)a7 maxFrameCount:(int64_t)a8 isSticker:(BOOL)a9 withCompletionBlock:(id)a10
{
  _BOOL8 v11;
  NSObject *v19;
  void *v20;
  double v21;
  double v22;
  NSObject *v23;
  id v24;
  const __CFString *v25;
  NSObject *v26;
  id v27;
  const __CFString *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[6];
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v11 = a9;
  v38 = *MEMORY[0x1E0C80C00];
  if (-[IMFeatureFlags isSessionAnimatedImageUnpackerEnabled](+[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags"), "isSessionAnimatedImageUnpackerEnabled"))
  {
    if (a3 && a10)
    {
      v19 = +[IMAttachmentBlastdoor logger](IMAttachmentBlastdoor, "logger");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = a3;
        _os_log_impl(&dword_19E239000, v19, OS_LOG_TYPE_DEFAULT, "Sending request to generate animated image preview to BlastDoor for %@", buf, 0xCu);
      }
      v20 = (void *)objc_msgSend(a1, "blastdoorInterfaceForSenderContext:", a4);
      *(float *)&v21 = a6;
      *(float *)&v22 = a7;
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = sub_19E282CF4;
      v33[3] = &unk_1E3FB5B78;
      v33[4] = a4;
      v33[5] = a10;
      objc_msgSend(v20, "generatePreviewForMultiFrameImageWithFileURL:destinationFileURL:maxPixelDimension:scale:maxFrameCount:isSticker:resultHandler:", a3, a5, a8, v11, v33, v21, v22);
    }
    else
    {
      v26 = +[IMAttachmentBlastdoor logger](IMAttachmentBlastdoor, "logger");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v35 = a10;
        v36 = 2112;
        v37 = a3;
        _os_log_impl(&dword_19E239000, v26, OS_LOG_TYPE_DEFAULT, "Invalid animated image preview input. Completion? %@, sourceURL? %@", buf, 0x16u);
      }
      if (a10)
      {
        v27 = objc_alloc(MEMORY[0x1E0C99D80]);
        if (a3)
          v28 = (const __CFString *)objc_msgSend(a3, "absoluteString");
        else
          v28 = CFSTR("NO");
        v31 = objc_msgSend(v27, "initWithObjectsAndKeys:", v28, CFSTR("sourceURL"), 0);
        v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("__kIMCoreAttachmentBlastdoorErrorDomain"), 13301, v31);
        (*((void (**)(id, _QWORD, uint64_t, double, double))a10 + 2))(a10, 0, v32, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      }
    }
  }
  else
  {
    v23 = +[IMAttachmentBlastdoor logger](IMAttachmentBlastdoor, "logger");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = a3;
      _os_log_impl(&dword_19E239000, v23, OS_LOG_TYPE_DEFAULT, "Calling wrong animated image preview - isSessionAnimatedImageUnpackerEnabled is not true, sourceURL? %@", buf, 0xCu);
    }
    if (a10)
    {
      v24 = objc_alloc(MEMORY[0x1E0C99D80]);
      if (a3)
        v25 = (const __CFString *)objc_msgSend(a3, "absoluteString");
      else
        v25 = CFSTR("NO");
      v29 = (void *)objc_msgSend(v24, "initWithObjectsAndKeys:", v25, CFSTR("sourceURL"), 0);
      v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("__kIMCoreAttachmentBlastdoorErrorDomain"), 13301, v29);
      (*((void (**)(id, _QWORD, uint64_t, double, double))a10 + 2))(a10, 0, v30, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));

    }
  }
}

+ (void)getMetadataForAnimatedImage:(id)a3 senderContext:(id)a4 maxCount:(int64_t)a5 withCompletionBlock:(id)a6
{
  NSObject *v11;
  id v12;
  const __CFString *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[5];
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (-[IMFeatureFlags isSessionAnimatedImageUnpackerEnabled](+[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags"), "isSessionAnimatedImageUnpackerEnabled"))
  {
    v11 = +[IMAttachmentBlastdoor logger](IMAttachmentBlastdoor, "logger");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = a3;
      _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_DEFAULT, "Calling wrong animated image preview getMetadataForAnimatedImage - isSessionAnimatedImageUnpackerEnabled is true, sourceURL? %@", buf, 0xCu);
    }
    if (a6)
    {
      v12 = objc_alloc(MEMORY[0x1E0C99D80]);
      if (a3)
        v13 = (const __CFString *)objc_msgSend(a3, "absoluteString");
      else
        v13 = CFSTR("NO");
      v19 = (void *)objc_msgSend(v12, "initWithObjectsAndKeys:", v13, CFSTR("sourceURL"), 0);
      (*((void (**)(id, _QWORD, uint64_t))a6 + 2))(a6, 0, objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("__kIMCoreAttachmentBlastdoorErrorDomain"), 13301, v19));

    }
  }
  else if (a3 && a6)
  {
    v14 = +[IMAttachmentBlastdoor logger](IMAttachmentBlastdoor, "logger");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = a3;
      _os_log_impl(&dword_19E239000, v14, OS_LOG_TYPE_DEFAULT, "Sending request to get metadata for animated image to BlastDoor for %@", buf, 0xCu);
    }
    v15 = (void *)objc_msgSend(a1, "blastdoorInterfaceForSenderContext:", a4);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = sub_19E283298;
    v21[3] = &unk_1E3FB5AD8;
    v21[4] = a6;
    objc_msgSend(v15, "getMetadataforAnimatedImageWithfileURL:maxCount:resultHandler:", a3, a5, v21);
  }
  else
  {
    v16 = +[IMAttachmentBlastdoor logger](IMAttachmentBlastdoor, "logger");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v23 = a6;
      v24 = 2112;
      v25 = a3;
      _os_log_impl(&dword_19E239000, v16, OS_LOG_TYPE_DEFAULT, "Invalid input for getting animated image metadata. Completion? %@, sourceURL? %@", buf, 0x16u);
    }
    if (a6)
    {
      v17 = objc_alloc(MEMORY[0x1E0C99D80]);
      if (a3)
        v18 = (const __CFString *)objc_msgSend(a3, "absoluteString");
      else
        v18 = CFSTR("NO");
      v20 = objc_msgSend(v17, "initWithObjectsAndKeys:", v18, CFSTR("sourceURL"), 0);
      (*((void (**)(id, _QWORD, uint64_t))a6 + 2))(a6, 0, objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("__kIMCoreAttachmentBlastdoorErrorDomain"), 13301, v20));
    }
  }
}

+ (void)generateAnimatedImagePreview:(id)a3 senderContext:(id)a4 maxPixelDimension:(double)a5 index:(int64_t)a6 maxCount:(int64_t)a7 withCompletionBlock:(id)a8
{
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v18;
  double v19;
  NSObject *v20;
  const __CFString *v21;
  void *v22;
  _QWORD v23[5];
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (-[IMFeatureFlags isSessionAnimatedImageUnpackerEnabled](+[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags"), "isSessionAnimatedImageUnpackerEnabled"))
  {
    v15 = +[IMAttachmentBlastdoor logger](IMAttachmentBlastdoor, "logger");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = a3;
      _os_log_impl(&dword_19E239000, v15, OS_LOG_TYPE_DEFAULT, "Calling wrong animated image preview - isSessionAnimatedImageUnpackerEnabled is true, sourceURL? %@", buf, 0xCu);
    }
    if (a8)
    {
      v16 = objc_alloc(MEMORY[0x1E0C99D80]);
      if (!a3)
      {
        v21 = CFSTR("NO");
        goto LABEL_19;
      }
LABEL_16:
      v21 = (const __CFString *)objc_msgSend(a3, "absoluteString");
LABEL_19:
      v22 = (void *)objc_msgSend(v16, "initWithObjectsAndKeys:", v21, CFSTR("sourceURL"), 0);
      (*((void (**)(id, _QWORD, uint64_t))a8 + 2))(a8, 0, objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("__kIMCoreAttachmentBlastdoorErrorDomain"), 13301, v22));

    }
  }
  else if (a3 && a8)
  {
    v17 = +[IMAttachmentBlastdoor logger](IMAttachmentBlastdoor, "logger");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = a3;
      _os_log_impl(&dword_19E239000, v17, OS_LOG_TYPE_DEFAULT, "Sending request to generate animated image preview to BlastDoor for %@", buf, 0xCu);
    }
    v18 = (void *)objc_msgSend(a1, "blastdoorInterfaceForSenderContext:", a4);
    *(float *)&v19 = a5;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = sub_19E283718;
    v23[3] = &unk_1E3FB5AD8;
    v23[4] = a8;
    objc_msgSend(v18, "generatePreviewforAnimatedImageWithfileURL:maxPixelDimension:index:maxCount:resultHandler:", a3, a6, a7, v23, v19);
  }
  else
  {
    v20 = +[IMAttachmentBlastdoor logger](IMAttachmentBlastdoor, "logger");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v25 = a8;
      v26 = 2112;
      v27 = a3;
      _os_log_impl(&dword_19E239000, v20, OS_LOG_TYPE_DEFAULT, "Invalid animated image preview input. Completion? %@, sourceURL? %@", buf, 0x16u);
    }
    if (a8)
    {
      v16 = objc_alloc(MEMORY[0x1E0C99D80]);
      if (!a3)
      {
        v21 = CFSTR("NO");
        goto LABEL_19;
      }
      goto LABEL_16;
    }
  }
}

+ (id)generateImagePreviewForFileURL:(id)a3 senderContext:(id)a4 maxPixelDimension:(float)a5 scale:(float)a6 error:(id *)a7
{
  NSObject *v13;
  void *v14;
  double v15;
  double v16;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = +[IMAttachmentBlastdoor logger](IMAttachmentBlastdoor, "logger");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412290;
    v19 = a3;
    _os_log_impl(&dword_19E239000, v13, OS_LOG_TYPE_DEFAULT, "Sending request to generate synchronous image preview to BlastDoor for %@", (uint8_t *)&v18, 0xCu);
  }
  v14 = (void *)objc_msgSend(a1, "blastdoorInterfaceForSenderContext:", a4);
  *(float *)&v15 = a5;
  *(float *)&v16 = a6;
  return (id)objc_msgSend(v14, "generateImagePreviewForFileURL:maxPixelDimension:scale:error:", a3, a7, v15, v16);
}

+ (void)getMetadataForEmojiImageWithFileURL:(id)a3 senderContext:(id)a4 maxStrikeCount:(int64_t)a5 withCompletionBlock:(id)a6
{
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id v14;
  const __CFString *v15;
  uint64_t v16;
  _QWORD v17[5];
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a3 && a6)
  {
    v11 = +[IMAttachmentBlastdoor logger](IMAttachmentBlastdoor, "logger");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = a3;
      _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_DEFAULT, "Sending request to get metadata for emoji image to BlastDoor for %@", buf, 0xCu);
    }
    v12 = (void *)objc_msgSend(a1, "blastdoorInterfaceForSenderContext:", a4);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_19E283B7C;
    v17[3] = &unk_1E3FB5AD8;
    v17[4] = a6;
    objc_msgSend(v12, "getMetadataForEmojiImageWithFileURL:maxStrikeCount:resultHandler:", a3, a5, v17);
  }
  else
  {
    v13 = +[IMAttachmentBlastdoor logger](IMAttachmentBlastdoor, "logger");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v19 = a6;
      v20 = 2112;
      v21 = a3;
      _os_log_impl(&dword_19E239000, v13, OS_LOG_TYPE_DEFAULT, "Invalid input for getting emoji image metadata. Completion? %@, sourceURL? %@", buf, 0x16u);
    }
    if (a6)
    {
      v14 = objc_alloc(MEMORY[0x1E0C99D80]);
      if (a3)
        v15 = (const __CFString *)objc_msgSend(a3, "absoluteString");
      else
        v15 = CFSTR("NO");
      v16 = objc_msgSend(v14, "initWithObjectsAndKeys:", v15, CFSTR("sourceURL"), 0);
      (*((void (**)(id, _QWORD, uint64_t))a6 + 2))(a6, 0, objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("__kIMCoreAttachmentBlastdoorErrorDomain"), 13301, v16));
    }
  }
}

+ (void)generateEmojiImagePreview:(id)a3 senderContext:(id)a4 frameIndex:(int64_t)a5 maxPixelDimension:(double)a6 withCompletionBlock:(id)a7
{
  NSObject *v13;
  void *v14;
  NSObject *v15;
  id v16;
  const __CFString *v17;
  uint64_t v18;
  _QWORD v19[5];
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a3 && a7)
  {
    v13 = +[IMAttachmentBlastdoor logger](IMAttachmentBlastdoor, "logger");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = a3;
      _os_log_impl(&dword_19E239000, v13, OS_LOG_TYPE_DEFAULT, "Sending request to generate emoji image to BlastDoor for %@", buf, 0xCu);
    }
    v14 = (void *)objc_msgSend(a1, "blastdoorInterfaceForSenderContext:", a4);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_19E283F04;
    v19[3] = &unk_1E3FB5AD8;
    v19[4] = a7;
    objc_msgSend(v14, "generatePreviewForEmojiImageWithFileURL:frameIndex:maxPixelDimension:resultHandler:", a3, a5, v19, a6);
  }
  else
  {
    v15 = +[IMAttachmentBlastdoor logger](IMAttachmentBlastdoor, "logger", a6);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v21 = a7;
      v22 = 2112;
      v23 = a3;
      _os_log_impl(&dword_19E239000, v15, OS_LOG_TYPE_DEFAULT, "Invalid emoji image preview input. Completion? %@, sourceURL? %@", buf, 0x16u);
    }
    if (a7)
    {
      v16 = objc_alloc(MEMORY[0x1E0C99D80]);
      if (a3)
        v17 = (const __CFString *)objc_msgSend(a3, "absoluteString");
      else
        v17 = CFSTR("NO");
      v18 = objc_msgSend(v16, "initWithObjectsAndKeys:", v17, CFSTR("sourceURL"), 0);
      (*((void (**)(id, _QWORD, uint64_t))a7 + 2))(a7, 0, objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("__kIMCoreAttachmentBlastdoorErrorDomain"), 13301, v18));
    }
  }
}

@end
