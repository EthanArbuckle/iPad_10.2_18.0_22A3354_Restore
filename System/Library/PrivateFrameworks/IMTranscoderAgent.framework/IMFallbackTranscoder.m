@implementation IMFallbackTranscoder

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMFallbackTranscoder;
  -[IMFallbackTranscoder dealloc](&v3, sel_dealloc);
}

- (id)_findPluginFallbackEncoder:(id)a3 withBalloonBundleID:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSString *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  objc_class *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  NSObject *v69;
  NSObject *v71;
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint8_t buf[4];
  id v79;
  __int16 v80;
  id v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v73 = *MEMORY[0x24BE50B60];
  v9 = objc_msgSend_rangeOfString_(a4, a2, *MEMORY[0x24BE50B60], (uint64_t)a4, v4, v5, v6);
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v10, (uint64_t)&v74, (uint64_t)v82, 16, v11, v12);
  if (v18)
  {
    v19 = *(_QWORD *)v75;
    while (2)
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v75 != v19)
          objc_enumerationMutation(a3);
        v21 = objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], v13, *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * v20), v14, v15, v16, v17);
        v22 = objc_alloc(MEMORY[0x24BDD1488]);
        v28 = (id)objc_msgSend_initWithURL_(v22, v23, v21, v24, v25, v26, v27);
        v35 = (void *)objc_msgSend_bundleIdentifier(v28, v29, v30, v31, v32, v33, v34);
        if ((objc_msgSend_isEqualToString_(v35, v36, (uint64_t)a4, v37, v38, v39, v40) & 1) != 0
          || !v9 && objc_msgSend_isEqualToString_(v35, v13, v73, v14, v15, v16, v17))
        {
          v42 = (void *)objc_msgSend_infoDictionary(v28, v13, v41, v14, v15, v16, v17);
          v48 = (NSString *)objc_msgSend_objectForKey_(v42, v43, (uint64_t)CFSTR("CKFallbackClass"), v44, v45, v46, v47);
          if (objc_msgSend_length(v48, v49, v50, v51, v52, v53, v54))
          {
            objc_msgSend_load(v28, v13, v55, v14, v15, v16, v17);
            v56 = NSClassFromString(v48);
            v57 = IMBalloonExtensionIDWithSuffix();
            if (objc_msgSend_isEqualToString_(a4, v58, v57, v59, v60, v61, v62))
              v56 = NSClassFromString(CFSTR("MSPhotosExtensionFallbackTranscoder"));
            v63 = objc_alloc_init(v56);
            if (objc_msgSend_conformsToProtocol_(v63, v64, (uint64_t)&unk_2553B92E0, v65, v66, v67, v68))
            {
              if (IMOSLoggingEnabled())
              {
                v71 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v79 = a4;
                  v80 = 2112;
                  v81 = v63;
                  _os_log_impl(&dword_21DFB1000, v71, OS_LOG_TYPE_INFO, "Found encoder to get bundle for identifier %@, encoder %@", buf, 0x16u);
                }
              }
              return v63;
            }
          }
        }
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v13, (uint64_t)&v74, (uint64_t)v82, 16, v16, v17);
      if (v18)
        continue;
      break;
    }
  }
  if (IMOSLoggingEnabled())
  {
    v69 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v79 = a4;
      _os_log_impl(&dword_21DFB1000, v69, OS_LOG_TYPE_INFO, "Failed to get bundle for identifier %@", buf, 0xCu);
    }
  }
  return 0;
}

- (void)transcodeFileTransferData:(id)a3 balloonBundleID:(id)a4 attachments:(id)a5 inFileURL:(id)a6 fallBack:(BOOL)a7 completionBlock:(id)a8
{
  _BOOL4 v9;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *PluginFallbackEncoder_withBalloonBundleID;
  void *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  char v36;
  int v37;
  const char *v38;
  uint64_t v39;
  NSObject *v40;
  NSObject *v41;
  _QWORD v42[6];
  _QWORD v43[6];
  _QWORD v44[9];
  _QWORD v45[9];
  uint8_t buf[4];
  id v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  const char *v51;
  uint64_t v52;

  v9 = a7;
  v52 = *MEMORY[0x24BDAC8D0];
  v15 = IMBalloonProviderBundlePaths();
  PluginFallbackEncoder_withBalloonBundleID = (void *)objc_msgSend__findPluginFallbackEncoder_withBalloonBundleID_(self, v16, v15, (uint64_t)a4, v17, v18, v19);
  if (PluginFallbackEncoder_withBalloonBundleID)
  {
    v21 = PluginFallbackEncoder_withBalloonBundleID;
    v22 = PluginFallbackEncoder_withBalloonBundleID;
    if (v9)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v28 = objc_msgSend___imArrayByApplyingBlock_(a5, v23, (uint64_t)&unk_24E1FF678, v24, v25, v26, v27);
        v45[0] = MEMORY[0x24BDAC760];
        v45[1] = 3221225472;
        v45[2] = sub_21DFC93C4;
        v45[3] = &unk_24E1FF8B8;
        v45[4] = a3;
        v45[5] = a6;
        v45[7] = v21;
        v45[8] = a8;
        v45[6] = a5;
        objc_msgSend_fallbackForData_attachments_inFileURL_completionBlockWithText_(v21, v29, (uint64_t)a3, v28, (uint64_t)a6, (uint64_t)v45, v30);
      }
      else
      {
        v44[0] = MEMORY[0x24BDAC760];
        v44[1] = 3221225472;
        v44[2] = sub_21DFC9578;
        v44[3] = &unk_24E1FF8E0;
        v44[4] = a3;
        v44[5] = a6;
        v44[7] = v21;
        v44[8] = a8;
        v44[6] = a5;
        objc_msgSend_fallbackForData_inFileURL_completionBlock_(v21, v23, (uint64_t)a3, (uint64_t)a6, (uint64_t)v44, v26, v27);
      }
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (IMOSLoggingEnabled())
      {
        v35 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          v47 = v21;
          v48 = 2080;
          v49 = "Aug 14 2024";
          v50 = 2080;
          v51 = "21:52:58";
          _os_log_impl(&dword_21DFB1000, v35, OS_LOG_TYPE_INFO, "******** found encoder ******** %@ that responds to fullQualityForData %s %s", buf, 0x20u);
        }
      }
      v43[0] = MEMORY[0x24BDAC760];
      v43[1] = 3221225472;
      v43[2] = sub_21DFC9720;
      v43[3] = &unk_24E1FF908;
      v43[4] = v21;
      v43[5] = a8;
      objc_msgSend_fullQualityForData_inFileURL_completionBlock_(v21, v32, (uint64_t)a3, (uint64_t)a6, (uint64_t)v43, v33, v34);
    }
    else
    {
      v36 = objc_opt_respondsToSelector();
      v37 = IMOSLoggingEnabled();
      if ((v36 & 1) != 0)
      {
        if (v37)
        {
          v40 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            v47 = v21;
            v48 = 2080;
            v49 = "Aug 14 2024";
            v50 = 2080;
            v51 = "21:52:58";
            _os_log_impl(&dword_21DFB1000, v40, OS_LOG_TYPE_INFO, "******** found encoder ******** %@ that responds to fullQualityForData:attachments:inFileURL:completionBlock: %s %s", buf, 0x20u);
          }
        }
        v42[0] = MEMORY[0x24BDAC760];
        v42[1] = 3221225472;
        v42[2] = sub_21DFC9884;
        v42[3] = &unk_24E1FF930;
        v42[4] = v21;
        v42[5] = a8;
        objc_msgSend_fullQualityForData_attachments_inFileURL_completionBlock_(v21, v38, (uint64_t)a3, 0, (uint64_t)a6, (uint64_t)v42, v39);
      }
      else
      {
        if (v37)
        {
          v41 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v47 = v21;
            _os_log_impl(&dword_21DFB1000, v41, OS_LOG_TYPE_INFO, "******* did NOT ****** find encoder %@ that responds to fullQualityForData", buf, 0xCu);
          }
        }
        (*((void (**)(id, _QWORD, _QWORD, _QWORD, uint64_t, _QWORD))a8 + 2))(a8, 0, 0, 0, 1, 0);

      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v47 = a4;
        _os_log_impl(&dword_21DFB1000, v31, OS_LOG_TYPE_INFO, "IMTranscoding. No encoder found for balloon id %@", buf, 0xCu);
      }
    }
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, uint64_t, _QWORD))a8 + 2))(a8, 0, 0, 0, 1, 0);
  }
}

- (void)transcodeFileTransferContents:(id)a3 utiType:(id)a4 transcoderUserInfo:(id)a5 completionBlock:(id)a6
{
  uint64_t v6;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v11 = (void *)objc_msgSend_objectForKey_(a5, a2, *MEMORY[0x24BE50D80], (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, v6);
  if (objc_msgSend_BOOLValue(v11, v12, v13, v14, v15, v16, v17))
    MEMORY[0x24BEDD108](self, sel__transcodeAudioMessageContents_utiType_completionBlock_, a3, a4, a6, v18, v19);
  else
    MEMORY[0x24BEDD108](self, sel__transcodeAutoloopContents_utiType_completionBlock_, a3, a4, a6, v18, v19);
}

- (void)_transcodeAutoloopContents:(id)a3 utiType:(id)a4 completionBlock:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *PathComponent;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  NSObject *v36;
  _QWORD v37[7];
  _QWORD v38[6];
  uint8_t buf[4];
  id v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v9 = (void *)objc_msgSend_defaultManager(MEMORY[0x24BDD1580], a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v5, v6);
  PathComponent = (void *)objc_msgSend_lastPathComponent(a3, v10, v11, v12, v13, v14, v15);
  v23 = objc_msgSend_stringByDeletingPathExtension(PathComponent, v17, v18, v19, v20, v21, v22);
  v28 = objc_msgSend__randomTemporaryPathWithSuffix_fileName_(v9, v24, (uint64_t)CFSTR("gif"), v23, v25, v26, v27);
  v34 = objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], v29, v28, v30, v31, v32, v33);
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3052000000;
  v38[3] = sub_21DFC9CDC;
  v38[4] = sub_21DFC9CEC;
  v38[5] = 0;
  if (qword_2553B4030 != -1)
    dispatch_once(&qword_2553B4030, &unk_24E1FF950);
  if (off_2553B4028)
  {
    if (IMOSLoggingEnabled())
    {
      v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v40 = a3;
        v41 = 2112;
        v42 = v34;
        _os_log_impl(&dword_21DFB1000, v35, OS_LOG_TYPE_INFO, "Transcoding GIF {source: %@, target: %@}", buf, 0x16u);
      }
    }
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = sub_21DFC9E10;
    v37[3] = &unk_24E1FF9B8;
    v37[4] = v34;
    v37[5] = a5;
    v37[6] = v38;
    off_2553B4028(a3, v34, &unk_24E1FF990, v37);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v36 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DFB1000, v36, OS_LOG_TYPE_INFO, "IMTranscoding. PFCreateGIFFromVideoURL function not available", buf, 2u);
      }
    }
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))a5 + 2))(a5, 0, 0, 0, 0, 0);
  }
  _Block_object_dispose(v38, 8);
}

- (void)_transcodeAudioMessageContents:(id)a3 utiType:(id)a4 completionBlock:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v9 = objc_msgSend_audioTranscoder(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v5, v6);
  MEMORY[0x24BEDD108](v9, sel_transcodeOpusFile_completionBlock_, a3, a5, v10, v11, v12);
}

- (IMFallbackTranscoder_AudioMessage)audioTranscoder
{
  IMFallbackTranscoder_AudioMessage *result;

  result = self->_audioTranscoder;
  if (!result)
  {
    result = objc_alloc_init(IMFallbackTranscoder_AudioMessage);
    self->_audioTranscoder = result;
  }
  return result;
}

- (void)setAudioTranscoder:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
