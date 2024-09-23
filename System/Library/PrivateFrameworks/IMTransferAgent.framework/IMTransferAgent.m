void sub_22D97E904()
{
  IMTransferAgentIDSInterface *v0;
  void *v1;

  v0 = objc_alloc_init(IMTransferAgentIDSInterface);
  v1 = (void *)qword_2540D93D0;
  qword_2540D93D0 = (uint64_t)v0;

}

uint64_t sub_22D97EF58(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = *(_QWORD *)(result + 32);
  if (*(int *)(v1 + 32) <= 0 && *(_DWORD *)(result + 40) == *(_DWORD *)(v1 + 36))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v3 = 0;
        _os_log_impl(&dword_22D97D000, v2, OS_LOG_TYPE_INFO, "Idle exiting, we're done here", v3, 2u);
      }

    }
    exit(0);
  }
  return result;
}

void sub_22D97F684(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10)
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  const __CFString *v24;
  _BYTE buf[22];
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = CFSTR("NO");
      *(_DWORD *)buf = 138413570;
      *(_QWORD *)&buf[4] = v16;
      if ((_DWORD)a2)
        v24 = CFSTR("YES");
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v24;
      v26 = 2112;
      v27 = v21;
      v28 = 2112;
      v29 = v18;
      v30 = 2112;
      v31 = v19;
      v32 = 2112;
      v33 = v20;
      _os_log_impl(&dword_22D97D000, v23, OS_LOG_TYPE_INFO, "Finished Uploading The Remote request file with SentPath: %@, Success: %@ Error: %@ OwnerID: %@ Signature: %@ RequestURLString: %@", buf, 0x3Eu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_sendUploadResponse:topic:success:error:ownerID:signature:requestURLString:transferID:", v16, *(_QWORD *)(a1 + 40), a2, v21, v18, v19, v20, *(_QWORD *)(a1 + 48), *(_OWORD *)buf);

}

void sub_22D980190(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t sub_22D981688(void *a1)
{
  id v1;
  void *v2;
  int v3;
  char v4;
  void *v5;
  int v6;
  uint64_t v7;

  v1 = a1;
  objc_msgSend(v1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BE507B0]);

  if (v3)
    v4 = objc_msgSend(v1, "code") == -1;
  else
    v4 = 0;
  objc_msgSend(v1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDD1308]);

  if (v6)
  {
    v7 = objc_msgSend(v1, "code");
    if ((unint64_t)(v7 + 1019) <= 0x12)
      v4 |= 0x56D03u >> (v7 - 5);
  }

  return v4 & 1;
}

void sub_22D981788()
{
  IMTransferAgentController *v0;
  void *v1;

  v0 = objc_alloc_init(IMTransferAgentController);
  v1 = (void *)qword_2540D93D8;
  qword_2540D93D8 = (uint64_t)v0;

}

void sub_22D981EC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    objc_end_catch();
    JUMPOUT(0x22D981B0CLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_22D981F30(uint64_t a1, void *a2, double a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  double v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 134218242;
      v9 = a3;
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_22D97D000, v6, OS_LOG_TYPE_INFO, "Sent MMCS transfer progress updated to %0.02f  (%@)", (uint8_t *)&v8, 0x16u);
    }

  }
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v5, "protocolFileSize");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void sub_22D982058(uint64_t a1, void *a2, unsigned int a3, int a4, int a5, void *a6)
{
  id v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  const __CFString *v24;
  uint64_t v25;
  const __CFString *v26;
  const __CFString *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  __CFString *v43;
  id WeakRetained;
  unsigned int v45;
  void *v46;
  __CFString *v47;
  id v48[5];
  id v49;
  uint64_t v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  const __CFString *v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  const __CFString *v66;
  __int16 v67;
  const __CFString *v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v47 = a2;
  v11 = a6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  v45 = a3;
  v46 = v11;
  if ((a3 & 1) == 0)
  {
    v12 = objc_msgSend(*(id *)(a1 + 32), "_shouldRetryUploadGivenMMCSError:retryAttemptCount:", v11, *(_QWORD *)(a1 + 104));
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 104));
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        v17 = CFSTR("NO");
        *(_DWORD *)buf = 138413058;
        v60 = v14;
        v61 = 2112;
        if (v12)
          v17 = CFSTR("YES");
        v62 = v17;
        v63 = 2112;
        v64 = v15;
        v65 = 1024;
        LODWORD(v66) = 3;
        _os_log_impl(&dword_22D97D000, v13, OS_LOG_TYPE_INFO, "File transfer upload failed! %@  Should retry: %@   Retries: %@  Max Retries: %d", buf, 0x26u);

      }
    }
    if (v12)
    {
      v48[1] = (id)MEMORY[0x24BDAC760];
      v48[2] = (id)3221225472;
      v48[3] = sub_22D9825F4;
      v48[4] = &unk_24F979FA8;
      v18 = WeakRetained;
      v19 = *(_QWORD *)(a1 + 32);
      v49 = v18;
      v50 = v19;
      v51 = *(id *)(a1 + 48);
      v52 = *(id *)(a1 + 56);
      v53 = *(id *)(a1 + 40);
      v20 = *(id *)(a1 + 64);
      v21 = *(_QWORD *)(a1 + 104);
      v54 = v20;
      v58 = v21;
      v55 = *(id *)(a1 + 72);
      v56 = *(id *)(a1 + 80);
      v57 = *(id *)(a1 + 88);
      im_dispatch_after_primary_queue();

      v22 = v49;
LABEL_33:

      goto LABEL_34;
    }
    a4 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = CFSTR("NO");
      v25 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138413570;
      if (v45)
        v26 = CFSTR("YES");
      else
        v26 = CFSTR("NO");
      v60 = v25;
      v61 = 2112;
      if (a4)
        v27 = CFSTR("YES");
      else
        v27 = CFSTR("NO");
      v62 = v47;
      if (a5)
        v24 = CFSTR("YES");
      v63 = 2112;
      v64 = (uint64_t)v26;
      v65 = 2112;
      v66 = v27;
      v67 = 2112;
      v68 = v24;
      v69 = 2112;
      v70 = v46;
      _os_log_impl(&dword_22D97D000, v23, OS_LOG_TYPE_INFO, "transfer %@ completionBlock called with putFile %@ sucess %@ shouldRetry %@ shouldReauthorize %@ error %@", buf, 0x3Eu);
    }

  }
  if (*(_QWORD *)(a1 + 88))
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *(_QWORD *)(a1 + 48);
    v48[0] = 0;
    objc_msgSend(v28, "attributesOfItemAtPath:error:", v29, v48);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (__CFString *)v48[0];

    if (v43 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v31 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138412546;
        v60 = v31;
        v61 = 2112;
        v62 = v43;
        _os_log_impl(&dword_22D97D000, v30, OS_LOG_TYPE_INFO, "Transfer: Error reading attributes of file %@ (%@)", buf, 0x16u);
      }

    }
    v32 = *(_QWORD *)(a1 + 88);
    v41 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v42, "objectForKeyedSubscript:", *MEMORY[0x24BDD0D08]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "unsignedIntegerValue");
    -[__CFString requestorID](v47, "requestorID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString signature](v47, "signature");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString requestURL](v47, "requestURL");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "absoluteString");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString mmcsError](v47, "mmcsError");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    failReasonStringForMMCSError();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t, void *, void *, void *, void *, void *))(v32 + 16))(v32, v45, v41, v34, v35, v36, v38, v46, v40);

  }
  if (v45 && IMTransferRequestIsForMessages(*(void **)(a1 + 56), *(void **)(a1 + 48)))
  {
    objc_msgSend(*(id *)(a1 + 48), "lastPathComponent");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    IMGreenTeaAttachmentTransmitLoggingFormat();
    goto LABEL_33;
  }
LABEL_34:

}

uint64_t sub_22D9825F4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint8_t buf[4];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v6 = v3;
      _os_log_impl(&dword_22D97D000, v2, OS_LOG_TYPE_INFO, "Needs to reauthorize, will retry using that: %@", buf, 0xCu);
    }

  }
  return objc_msgSend(*(id *)(a1 + 40), "_sendFilePath:topic:transferID:sourceAppID:retryAttemptCount:userInfo:progressBlock:completionBlock:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 104) + 1, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96));
}

uint64_t sub_22D9826E0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_22D9826F0(uint64_t a1)
{

}

void sub_22D9826F8(uint64_t a1, int a2)
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  int v51;
  NSObject *v52;
  void *v53;
  int v54;
  os_activity_t v55;
  void *v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  NSObject *v67;
  void *v68;
  FTiMessageRequestMMCSUploadToken *v69;
  _QWORD v70[4];
  os_activity_t v71;
  id v72;
  id v73;
  id v74;
  id v75;
  uint64_t v76;
  id v77;
  id v78;
  id v79;
  id v80;
  uint64_t v81;
  char v82;
  _QWORD v83[15];
  _QWORD v84[15];
  uint64_t v85;
  void *v86;
  uint8_t buf[4];
  void *v88;
  __int16 v89;
  FTiMessageRequestMMCSUploadToken *v90;
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "guid");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v88 = v5;
      _os_log_impl(&dword_22D97D000, v4, OS_LOG_TYPE_INFO, "Registered transfer %@", buf, 0xCu);

    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40), "stopTimingForKey:", *(_QWORD *)(a1 + 40));
  if (a2)
  {
    v69 = objc_alloc_init(FTiMessageRequestMMCSUploadToken);
    if (objc_msgSend(*(id *)(a1 + 48), "length"))
      -[IDSBaseMessage setTopic:](v69, "setTopic:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "signature");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v88 = v68;
        _os_log_impl(&dword_22D97D000, v6, OS_LOG_TYPE_INFO, "Made signature: %@", buf, 0xCu);
      }

    }
    -[FTiMessageRequestMMCSUploadToken setSignature:](v69, "setSignature:", v68);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 32), "protocolFileSize"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FTiMessageRequestMMCSUploadToken setLength:](v69, "setLength:", v7);

    if (!*(_BYTE *)(a1 + 128))
    {
      -[FTiMessageRequestMMCSUploadToken setContentVersion:](v69, "setContentVersion:", 0);
LABEL_41:
      v40 = *(void **)(a1 + 64);
      if (v40)
      {
        objc_msgSend(v40, "valueForKey:", CFSTR("sP"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[FTiMessageRequestMMCSUploadToken setSenderID:](v69, "setSenderID:", v41);

        objc_msgSend(*(id *)(a1 + 64), "valueForKey:", CFSTR("tP"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[FTiMessageRequestMMCSUploadToken setDestinationID:](v69, "setDestinationID:", v42);

        objc_msgSend(*(id *)(a1 + 64), "valueForKey:", CFSTR("sI"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[FTiMessageRequestMMCSUploadToken setAnonymousSenderID:](v69, "setAnonymousSenderID:", v43);

        objc_msgSend(*(id *)(a1 + 64), "valueForKey:", CFSTR("sT"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[FTiMessageRequestMMCSUploadToken setSessionToken:](v69, "setSessionToken:", v44);

        objc_msgSend(*(id *)(a1 + 64), "valueForKey:", CFSTR("t"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[FTiMessageRequestMMCSUploadToken setPushToken:](v69, "setPushToken:", v45);

      }
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(*(id *)(a1 + 32), "guid");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v88 = v48;
          v89 = 2112;
          v90 = v69;
          _os_log_impl(&dword_22D97D000, v47, OS_LOG_TYPE_INFO, "TransferID %@ Sending upload request: %@", buf, 0x16u);

        }
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x24BE508E8], "sharedInstance");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v50, "linkQualityValueForInterfaceType:", 3);
          *(_DWORD *)buf = 67109120;
          LODWORD(v88) = v51;
          _os_log_impl(&dword_22D97D000, v49, OS_LOG_TYPE_INFO, "  Cell Link Quality: %d", buf, 8u);

        }
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x24BE508E8], "sharedInstance");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v53, "linkQualityValueForInterfaceType:", 2);
          *(_DWORD *)buf = 67109120;
          LODWORD(v88) = v54;
          _os_log_impl(&dword_22D97D000, v52, OS_LOG_TYPE_INFO, "  WiFi Link Quality: %d", buf, 8u);

        }
      }
      v55 = _os_activity_create(&dword_22D97D000, "com.apple.messages.MMCSPreAuth", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40), "startTimingForKey:", *(_QWORD *)(a1 + 72));
      +[IMTransferAgentDeliveryController sharedInstance](IMTransferAgentDeliveryController, "sharedInstance");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v70[0] = MEMORY[0x24BDAC760];
      v70[1] = 3221225472;
      v70[2] = sub_22D9833EC;
      v70[3] = &unk_24F97A020;
      v57 = *(_QWORD *)(a1 + 120);
      v71 = v55;
      v81 = v57;
      v72 = *(id *)(a1 + 72);
      v73 = *(id *)(a1 + 32);
      v74 = *(id *)(a1 + 80);
      v58 = *(id *)(a1 + 88);
      v59 = *(_QWORD *)(a1 + 56);
      v75 = v58;
      v76 = v59;
      v77 = *(id *)(a1 + 96);
      v78 = *(id *)(a1 + 104);
      v60 = *(id *)(a1 + 112);
      v82 = *(_BYTE *)(a1 + 128);
      v79 = v60;
      v80 = v46;
      v66 = v46;
      v67 = v55;
      objc_msgSend(v56, "sendFTMessage:completionBlock:", v69, v70);

      v21 = v71;
      goto LABEL_56;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 8), "getContentHeadersAsString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "authRequestData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == 0;

    if (v10)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(*(id *)(a1 + 32), "guid");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v88 = v37;
          _os_log_impl(&dword_22D97D000, v36, OS_LOG_TYPE_INFO, "Tried to send Madrid AuthPut, but could not fetch content body for transfer: %@", buf, 0xCu);

        }
      }
    }
    else
    {
      if (v8)
      {
        -[FTiMessageRequestMMCSUploadToken setContentVersion:](v69, "setContentVersion:", 2);
        objc_msgSend(*(id *)(a1 + 32), "authRequestData");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[FTiMessageRequestMMCSUploadToken setContentBody:](v69, "setContentBody:", v11);

        -[FTiMessageRequestMMCSUploadToken setContentHeaders:](v69, "setContentHeaders:", v8);
LABEL_40:

        goto LABEL_41;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(*(id *)(a1 + 32), "guid");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v88 = v39;
          _os_log_impl(&dword_22D97D000, v38, OS_LOG_TYPE_INFO, "Tried to send Madrid AuthPut, but could not fetch content header for transfer: %@", buf, 0xCu);

        }
      }
    }
    -[FTiMessageRequestMMCSUploadToken setContentVersion:](v69, "setContentVersion:", 0);
    goto LABEL_40;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 8), "unregisterFiles:", *(_QWORD *)(a1 + 96));
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v88 = v13;
      _os_log_impl(&dword_22D97D000, v12, OS_LOG_TYPE_INFO, "Failed registering transfer: %@", buf, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "completionBlock");
  v69 = (FTiMessageRequestMMCSUploadToken *)objc_claimAutoreleasedReturnValue();
  if (v69)
    ((void (*)(FTiMessageRequestMMCSUploadToken *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v69->super.super._topic)(v69, *(_QWORD *)(a1 + 32), 0, 0, 0, 0);
  v85 = *MEMORY[0x24BE50E98];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 44);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE51238], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trackEvent:withDictionary:", *MEMORY[0x24BE50EA8], v65);

  objc_msgSend(MEMORY[0x24BE30360], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "wiFiActiveAndReachable");

  if (v17)
    v18 = 2;
  else
    v18 = 3;
  v19 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BE508E8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "numberWithInt:", objc_msgSend(v20, "linkQualityValueForInterfaceType:", v18));
  v67 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 32), "protocolFileSize"));
  v66 = (id)objc_claimAutoreleasedReturnValue();
  parseMMCSError();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = *MEMORY[0x24BE50F28];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v64;
  v83[1] = *MEMORY[0x24BE50F60];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v84[1] = v63;
  v83[2] = *MEMORY[0x24BE50F88];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
  v61 = objc_claimAutoreleasedReturnValue();
  v84[2] = v61;
  v22 = *MEMORY[0x24BE50F58];
  v83[3] = *MEMORY[0x24BE50F48];
  v83[4] = v22;
  v84[3] = &unk_24F97D3C0;
  v84[4] = v67;
  v83[5] = *MEMORY[0x24BE50E88];
  if (v17)
    v23 = 2;
  else
    v23 = 1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v23, v61);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v84[5] = v24;
  v25 = *MEMORY[0x24BE50E80];
  v84[6] = v66;
  v26 = *MEMORY[0x24BE50F10];
  v83[6] = v25;
  v83[7] = v26;
  objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v84[7] = v27;
  v83[8] = *MEMORY[0x24BE50F08];
  objc_msgSend(v21, "objectAtIndexedSubscript:", 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v84[8] = v28;
  v83[9] = *MEMORY[0x24BE50F70];
  objc_msgSend(v21, "objectAtIndexedSubscript:", 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v84[9] = v29;
  v83[10] = *MEMORY[0x24BE50F68];
  objc_msgSend(v21, "objectAtIndexedSubscript:", 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v84[10] = v30;
  v83[11] = *MEMORY[0x24BE50F80];
  objc_msgSend(v21, "objectAtIndexedSubscript:", 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v84[11] = v31;
  v83[12] = *MEMORY[0x24BE50F78];
  objc_msgSend(v21, "objectAtIndexedSubscript:", 5);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v84[12] = v32;
  v83[13] = *MEMORY[0x24BE50F20];
  objc_msgSend(v21, "objectAtIndexedSubscript:", 6);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v84[13] = v33;
  v83[14] = *MEMORY[0x24BE50F18];
  objc_msgSend(v21, "objectAtIndexedSubscript:", 7);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v84[14] = v34;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v84, v83, 15);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE51238], "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "trackEvent:withDictionary:", *MEMORY[0x24BE50EB8], v68);

LABEL_56:
}

void sub_22D983330(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x22D982EDCLL);
  }
  _Unwind_Resume(a1);
}

void sub_22D9833EC(uint64_t a1, void *a2, void *a3, int a4, unsigned int a5)
{
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  void *v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  id v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  NSObject *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  unsigned int v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  _QWORD v92[4];
  id v93;
  id v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  _BYTE *v98;
  unsigned int v99;
  os_activity_scope_state_s state;
  _QWORD v101[15];
  _QWORD v102[15];
  uint64_t v103;
  void *v104;
  _BYTE buf[24];
  void *v106;
  _BYTE v107[20];
  uint64_t v108;

  v108 = *MEMORY[0x24BDAC8D0];
  v87 = a2;
  v9 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "stopTimingForKey:", *(_QWORD *)(a1 + 40));
  v91 = v9;
  v10 = objc_msgSend(v91, "responseContentVersion");
  if (objc_msgSend(v91, "contentVersion") >= 1 && v10 >= 1)
  {
    v11 = (void *)MEMORY[0x24BE634A8];
    objc_msgSend(v91, "responseContentHeaders");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "parseContentHeaderAsDictionary:treatValuesAsArrays:", v12, v10 == 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *(void **)(a1 + 48);
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("x-apple-mmcs-proto-version"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setProtocolVersion:", v16);

    objc_msgSend(*(id *)(a1 + 48), "protocolVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = v17 == 0;

    if ((_DWORD)v15)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v91, "responseContentHeaders");
          v19 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "guid");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          *(_QWORD *)&buf[4] = v10;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v19;
          *(_WORD *)&buf[22] = 2112;
          v106 = v20;
          _os_log_impl(&dword_22D97D000, v18, OS_LOG_TYPE_INFO, "Madrid responded with 'cV': %tu, but no protocol version was found in header: %@ (transfer: %@)", buf, 0x20u);

        }
      }
      a4 = 0;
      a5 = 17;
    }
    v21 = *(void **)(a1 + 48);
    objc_msgSend(v91, "responseContentBody");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAuthResponseData:", v22);

    objc_msgSend(*(id *)(a1 + 48), "authResponseData");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v22) = v23 == 0;

    if ((_DWORD)v22)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v91, "responseContentBody");
          v25 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "guid");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          *(_QWORD *)&buf[4] = v10;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v25;
          *(_WORD *)&buf[22] = 2112;
          v106 = v26;
          _os_log_impl(&dword_22D97D000, v24, OS_LOG_TYPE_INFO, "Madrid responded with 'cV': %tu, but no auth data was found in header: %@ (transfer: %@)", buf, 0x20u);

        }
      }
      a4 = 0;
      a5 = 17;
    }

  }
  if (objc_msgSend(v91, "contentVersion") != v10 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = objc_msgSend(v91, "contentVersion");
      objc_msgSend(*(id *)(a1 + 48), "guid");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v28;
      *(_WORD *)&buf[22] = 2112;
      v106 = v29;
      _os_log_impl(&dword_22D97D000, v27, OS_LOG_TYPE_INFO, "Madrid responded with 'cV': %tu, but we requested a 'cV': %tu (transfer: %@)", buf, 0x20u);

    }
  }
  if (a4)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 48), "guid");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v31;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v91;
        _os_log_impl(&dword_22D97D000, v30, OS_LOG_TYPE_INFO, "TransferID %@ Finished sending mmcs upload request: %@", buf, 0x16u);

      }
    }
    objc_msgSend(v91, "responseAuthToken");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "responseRequestURL");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "responseRequestorID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v90;
        _os_log_impl(&dword_22D97D000, v34, OS_LOG_TYPE_INFO, "    Auth token: %@", buf, 0xCu);
      }

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v32;
        _os_log_impl(&dword_22D97D000, v35, OS_LOG_TYPE_INFO, "   Request URL: %@", buf, 0xCu);
      }

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v33;
        _os_log_impl(&dword_22D97D000, v36, OS_LOG_TYPE_INFO, "      Owner ID: %@", buf, 0xCu);
      }

    }
    if (v32)
      v37 = objc_msgSend(v32, "rangeOfString:", CFSTR("://"));
    else
      v37 = -1;
    v38 = (uint64_t)v32;
    if (v37 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("http://%@"), v32);
      v38 = objc_claimAutoreleasedReturnValue();

    }
    v89 = (void *)v38;
    if (v38)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), v38, v33);
      v39 = objc_claimAutoreleasedReturnValue();

      v40 = (id)v39;
    }
    else
    {
      v40 = v32;
    }
    v85 = a5;
    v88 = v40;
    if (v40)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v41 = 0;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 48), "guid");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 138413314;
        *(_QWORD *)&buf[4] = v43;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v44;
        *(_WORD *)&buf[22] = 2112;
        v106 = v33;
        *(_WORD *)v107 = 2112;
        *(_QWORD *)&v107[2] = v41;
        *(_WORD *)&v107[10] = 2112;
        *(_QWORD *)&v107[12] = v90;
        _os_log_impl(&dword_22D97D000, v42, OS_LOG_TYPE_INFO, "Request to send transfer: %@ %@   requestorID: %@  requestURL: %@  auth token: %@", buf, 0x34u);

      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), "startTimingForKey:", *(_QWORD *)(a1 + 64));
    v45 = _os_activity_create(&dword_22D97D000, "com.apple.messages.MMCSPutFile", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3010000000;
    *(_QWORD *)v107 = 0;
    *(_QWORD *)&v107[8] = 0;
    v106 = &unk_22D99B617;
    os_activity_scope_enter(v45, (os_activity_scope_state_t)v107);
    v46 = *(_QWORD *)(a1 + 80);
    v47 = *(void **)(*(_QWORD *)(a1 + 72) + 8);
    v48 = *(_QWORD *)(a1 + 88);
    v49 = *(_QWORD *)(a1 + 96);
    v50 = *(_BYTE *)(a1 + 120);
    v92[0] = MEMORY[0x24BDAC760];
    v92[1] = 3221225472;
    v92[2] = sub_22D984230;
    v92[3] = &unk_24F979FF8;
    v51 = *(id *)(a1 + 48);
    v52 = *(_QWORD *)(a1 + 112);
    v93 = v51;
    v97 = v52;
    v94 = *(id *)(a1 + 64);
    v53 = *(id *)(a1 + 104);
    v99 = v85;
    v98 = buf;
    v54 = *(_QWORD *)(a1 + 72);
    v95 = v53;
    v96 = v54;
    LOBYTE(v80) = v50;
    objc_msgSend(v47, "putFiles:requestURL:requestorID:transferID:sourceAppID:authToken:preauthenticate:completionBlock:", v46, v41, v33, v48, v49, v90, v80, v92);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 72) + 8), "unregisterFiles:", *(_QWORD *)(a1 + 80));
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMEventCategory();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v91;
        _os_log_impl(&dword_22D97D000, v55, OS_LOG_TYPE_INFO, "Failed sending mmcs upload request: %@", buf, 0xCu);
      }

    }
    v103 = *MEMORY[0x24BE50E98];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 45);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v56;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
    v57 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE51238], "sharedInstance");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "trackEvent:withDictionary:", *MEMORY[0x24BE50EA8], v57);

    objc_msgSend(MEMORY[0x24BE30360], "sharedInstance");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "wiFiActiveAndReachable");

    v61 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE508E8], "sharedInstance");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v62;
    if (v60)
      v64 = 2;
    else
      v64 = 3;
    objc_msgSend(v61, "numberWithInt:", objc_msgSend(v62, "linkQualityValueForInterfaceType:", v64));
    v89 = (void *)objc_claimAutoreleasedReturnValue();

    v81 = (void *)v57;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 48), "protocolFileSize"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    parseMMCSError();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v101[0] = *MEMORY[0x24BE50F28];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", a5);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v102[0] = v86;
    v101[1] = *MEMORY[0x24BE50F60];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v102[1] = v84;
    v101[2] = *MEMORY[0x24BE50F88];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 2);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = *MEMORY[0x24BE50F48];
    v102[2] = v83;
    v102[3] = &unk_24F97D3C0;
    v66 = *MEMORY[0x24BE50F58];
    v101[3] = v65;
    v101[4] = v66;
    v102[4] = v89;
    v101[5] = *MEMORY[0x24BE50E88];
    if (v60)
      v67 = 2;
    else
      v67 = 1;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v67);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = *MEMORY[0x24BE50E80];
    v102[5] = v82;
    v102[6] = v88;
    v69 = *MEMORY[0x24BE50F10];
    v101[6] = v68;
    v101[7] = v69;
    objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v102[7] = v70;
    v101[8] = *MEMORY[0x24BE50F08];
    objc_msgSend(v33, "objectAtIndexedSubscript:", 1);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v102[8] = v71;
    v101[9] = *MEMORY[0x24BE50F70];
    objc_msgSend(v33, "objectAtIndexedSubscript:", 2);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v102[9] = v72;
    v101[10] = *MEMORY[0x24BE50F68];
    objc_msgSend(v33, "objectAtIndexedSubscript:", 3);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v102[10] = v73;
    v101[11] = *MEMORY[0x24BE50F80];
    objc_msgSend(v33, "objectAtIndexedSubscript:", 4);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v102[11] = v74;
    v101[12] = *MEMORY[0x24BE50F78];
    objc_msgSend(v33, "objectAtIndexedSubscript:", 5);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v102[12] = v75;
    v101[13] = *MEMORY[0x24BE50F20];
    objc_msgSend(v33, "objectAtIndexedSubscript:", 6);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v102[13] = v76;
    v101[14] = *MEMORY[0x24BE50F18];
    objc_msgSend(v33, "objectAtIndexedSubscript:", 7);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v102[14] = v77;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v102, v101, 15);
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE51238], "sharedInstance");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "trackEvent:withDictionary:", *MEMORY[0x24BE50EB8], v90);

    objc_msgSend(*(id *)(a1 + 48), "completionBlock");
    v79 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)v79;
    if (v79)
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v79 + 16))(v79, *(_QWORD *)(a1 + 48), 0, 0, 0, 0);
  }

  os_activity_scope_leave(&state);
}

void sub_22D984230(uint64_t a1, void *a2, int a3, void *a4)
{
  NSObject *v7;
  void *v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void (**v40)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  double v78;
  id v79;
  uint64_t v80;
  _QWORD v81[16];
  _QWORD v82[16];
  uint64_t v83;
  void *v84;
  _QWORD v85[16];
  _QWORD v86[16];
  uint64_t v87;
  void *v88;
  uint8_t buf[4];
  double v90;
  __int16 v91;
  double v92;
  __int16 v93;
  double v94;
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  v78 = COERCE_DOUBLE(a2);
  v79 = a4;
  objc_msgSend(*(id *)(a1 + 32), "setMMCSError:");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "stopTimingForKey:", *(_QWORD *)(a1 + 40));
  v80 = a1;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(v80 + 32), "guid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(double *)(*(_QWORD *)(*(_QWORD *)(v80 + 64) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      v90 = *(double *)&v8;
      v91 = 2112;
      v92 = v9;
      _os_log_impl(&dword_22D97D000, v7, OS_LOG_TYPE_INFO, "Upload timing for transfer ID %@ %@", buf, 0x16u);

    }
    a1 = v80;
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceDate:", *(_QWORD *)(v80 + 48));
  v14 = v13;

  if (a3)
  {
    v15 = 0.0;
    if (v14 > 0.0)
      v15 = (double)(unint64_t)objc_msgSend(*(id *)(v80 + 32), "protocolFileSize") / v14 * 0.0009765625;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMEventCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v90 = v78;
        v91 = 2048;
        v92 = v14;
        v93 = 2048;
        v94 = v15;
        _os_log_impl(&dword_22D97D000, v16, OS_LOG_TYPE_INFO, "Finished upload request for files: %@  upload time was: %f  speed: %.0f kb/s", buf, 0x20u);
      }

    }
    v87 = *MEMORY[0x24BE50E98];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE51238], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "trackEvent:withDictionary:", *MEMORY[0x24BE50EA8], v73);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v14);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(v80 + 32), "protocolFileSize"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE30360], "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "wiFiActiveAndReachable");

    if (v20)
      v21 = 2;
    else
      v21 = 3;
    v22 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE508E8], "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "numberWithInt:", objc_msgSend(v23, "linkQualityValueForInterfaceType:", v21));
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v79, "code"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    parseMMCSError();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v85[0] = *MEMORY[0x24BE50F28];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", *(unsigned int *)(v80 + 80));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v86[0] = v71;
    v85[1] = *MEMORY[0x24BE50F60];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v86[1] = v69;
    v85[2] = *MEMORY[0x24BE50F88];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v86[2] = v67;
    v26 = *MEMORY[0x24BE50F90];
    v85[3] = *MEMORY[0x24BE50F48];
    v85[4] = v26;
    v86[3] = v24;
    v86[4] = v77;
    v27 = *MEMORY[0x24BE50F58];
    v86[5] = v75;
    v28 = *MEMORY[0x24BE50E88];
    v85[5] = v27;
    v85[6] = v28;
    if (v20)
      v29 = 2;
    else
      v29 = 1;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v29);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v86[6] = v65;
    v30 = *MEMORY[0x24BE50E80];
    v86[7] = v76;
    v31 = *MEMORY[0x24BE50F10];
    v85[7] = v30;
    v85[8] = v31;
    objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v86[8] = v63;
    v85[9] = *MEMORY[0x24BE50F08];
    objc_msgSend(v25, "objectAtIndexedSubscript:", 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v86[9] = v32;
    v85[10] = *MEMORY[0x24BE50F70];
    objc_msgSend(v25, "objectAtIndexedSubscript:", 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v86[10] = v33;
    v85[11] = *MEMORY[0x24BE50F68];
    objc_msgSend(v25, "objectAtIndexedSubscript:", 3);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v86[11] = v34;
    v85[12] = *MEMORY[0x24BE50F80];
    objc_msgSend(v25, "objectAtIndexedSubscript:", 4);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v86[12] = v35;
    v85[13] = *MEMORY[0x24BE50F78];
    objc_msgSend(v25, "objectAtIndexedSubscript:", 5);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v86[13] = v36;
    v85[14] = *MEMORY[0x24BE50F20];
    objc_msgSend(v25, "objectAtIndexedSubscript:", 6);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v86[14] = v37;
    v85[15] = *MEMORY[0x24BE50F18];
    objc_msgSend(v25, "objectAtIndexedSubscript:", 7);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v86[15] = v38;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v86, v85, 16);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE51238], "sharedInstance");
    v40 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "trackEvent:withDictionary:", *MEMORY[0x24BE50EB8], v39);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMEventCategory();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v90 = *(double *)&v79;
        v91 = 2112;
        v92 = v78;
        v93 = 2048;
        v94 = v14;
        _os_log_impl(&dword_22D97D000, v41, OS_LOG_TYPE_INFO, "Failed upload request: %@   files: %@   upload time was: %f", buf, 0x20u);
      }

    }
    v83 = *MEMORY[0x24BE50E98];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", objc_msgSend(v79, "code"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = v42;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE51238], "sharedInstance");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "trackEvent:withDictionary:", *MEMORY[0x24BE50EA8], v74);

    objc_msgSend(MEMORY[0x24BE30360], "sharedInstance");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "wiFiActiveAndReachable");

    if (v45)
      v46 = 2;
    else
      v46 = 3;
    v47 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE508E8], "sharedInstance");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "numberWithInt:", objc_msgSend(v48, "linkQualityValueForInterfaceType:", v46));
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(v80 + 32), "protocolFileSize"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v79, "code"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    parseMMCSError();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v81[0] = *MEMORY[0x24BE50F28];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", *(unsigned int *)(v80 + 80));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v82[0] = v72;
    v81[1] = *MEMORY[0x24BE50F60];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v82[1] = v70;
    v81[2] = *MEMORY[0x24BE50F88];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v82[2] = v68;
    v49 = *MEMORY[0x24BE50F90];
    v81[3] = *MEMORY[0x24BE50F48];
    v81[4] = v49;
    v82[3] = v75;
    v82[4] = v25;
    v50 = *MEMORY[0x24BE50F58];
    v82[5] = v77;
    v51 = *MEMORY[0x24BE50E88];
    v81[5] = v50;
    v81[6] = v51;
    if (v45)
      v52 = 2;
    else
      v52 = 1;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v52);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v82[6] = v66;
    v53 = *MEMORY[0x24BE50E80];
    v82[7] = v76;
    v54 = *MEMORY[0x24BE50F10];
    v81[7] = v53;
    v81[8] = v54;
    objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v82[8] = v64;
    v81[9] = *MEMORY[0x24BE50F08];
    objc_msgSend(v24, "objectAtIndexedSubscript:", 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v82[9] = v55;
    v81[10] = *MEMORY[0x24BE50F70];
    objc_msgSend(v24, "objectAtIndexedSubscript:", 2);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v82[10] = v56;
    v81[11] = *MEMORY[0x24BE50F68];
    objc_msgSend(v24, "objectAtIndexedSubscript:", 3);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v82[11] = v57;
    v81[12] = *MEMORY[0x24BE50F80];
    objc_msgSend(v24, "objectAtIndexedSubscript:", 4);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v82[12] = v58;
    v81[13] = *MEMORY[0x24BE50F78];
    objc_msgSend(v24, "objectAtIndexedSubscript:", 5);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v82[13] = v59;
    v81[14] = *MEMORY[0x24BE50F20];
    objc_msgSend(v24, "objectAtIndexedSubscript:", 6);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v82[14] = v60;
    v81[15] = *MEMORY[0x24BE50F18];
    objc_msgSend(v24, "objectAtIndexedSubscript:", 7);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v82[15] = v61;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v82, v81, 16);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE51238], "sharedInstance");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "trackEvent:withDictionary:", *MEMORY[0x24BE50EB8], v39);

    objc_msgSend(*(id *)(v80 + 32), "completionBlock");
    v40 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    os_activity_scope_leave((os_activity_scope_state_t)(*(_QWORD *)(*(_QWORD *)(v80 + 72) + 8) + 32));
    if (v40)
      v40[2](v40, *(_QWORD *)(v80 + 32), 0, 0, 0, 0);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(v80 + 56) + 8), "unregisterFiles:", *(_QWORD *)&v78);
}

void sub_22D985488(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  char v13;

  v5 = a2;
  v6 = a3;
  im_assert_primary_queue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_22D9855AC;
  v10[3] = &unk_24F97A070;
  v12 = *(id *)(a1 + 80);
  v7 = v6;
  v11 = v7;
  v13 = *(_BYTE *)(a1 + 104);
  v8 = (void *)MEMORY[0x22E31D724](v10);
  if (!*(_QWORD *)(a1 + 32) || *(_QWORD *)(a1 + 96) >> 20)
  {
    objc_msgSend(*(id *)(a1 + 64), "_sendFilePath:topic:transferID:sourceAppID:retryAttemptCount:userInfo:progressBlock:completionBlock:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 88), v8);
  }
  else
  {
    +[IMTransferAgentIDSInterface sharedInstance](IMTransferAgentIDSInterface, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "remoteUploadFileRequest:topic:transferID:sourceAppID:completionBlock:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v8);

  }
}

void sub_22D9855AC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8, void *a9)
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  NSObject *v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  im_assert_primary_queue();
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2);
  if (*(_BYTE *)(a1 + 48))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v15;
        _os_log_impl(&dword_22D97D000, v21, OS_LOG_TYPE_INFO, "Cleaning up encrypted attachment path: %@", buf, 0xCu);
      }

    }
    if (v15)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v15);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      v24 = objc_msgSend(v22, "removeItemAtURL:error:", v23, &v27);
      v25 = v27;

      if ((v24 & 1) == 0 && IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v29 = v15;
          v30 = 2112;
          v31 = v25;
          _os_log_impl(&dword_22D97D000, v26, OS_LOG_TYPE_INFO, "Error cleaning up encrypted attachment path: %@  error: %@", buf, 0x16u);
        }

      }
    }
    else
    {
      v25 = 0;
    }

  }
}

void sub_22D985818(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  v7 = a5;
  v8 = a4;
  im_assert_primary_queue();
  v9 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v8, "path");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v10, v7);
}

void sub_22D9864D4(_Unwind_Exception *a1, int a2)
{
  uint64_t v2;

  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x22D9860BCLL);
  }
  _Block_object_dispose((const void *)(v2 - 176), 8);
  objc_destroyWeak((id *)(v2 - 232));
  _Unwind_Resume(a1);
}

void sub_22D9865BC(uint64_t a1, void *a2, double a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  double v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 134218242;
      v9 = a3;
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_22D97D000, v6, OS_LOG_TYPE_INFO, "Received MMCS transfer progress updated to %0.02f  (%@)", (uint8_t *)&v8, 0x16u);
    }

  }
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v5, "protocolFileSize");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void sub_22D9866E4(uint64_t a1, void *a2, uint64_t a3, char a4, int a5, void *a6)
{
  id v11;
  id v12;
  NSObject *v13;
  __CFString *WeakRetained;
  int v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  int v19;
  int v20;
  NSObject *v21;
  const __CFString *v22;
  int v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  __CFString *v39;
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  const __CFString *v44;
  __int16 v45;
  _BYTE v46[10];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v12 = a6;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v44) = qos_class_self();
      _os_log_impl(&dword_22D97D000, v13, OS_LOG_TYPE_INFO, "Handling MMCSGetFile completion at qos (%u)", buf, 8u);
    }

  }
  WeakRetained = (__CFString *)objc_loadWeakRetained((id *)(a1 + 128));
  v15 = IMOSLoggingEnabled();
  if ((_DWORD)a3)
  {
    if (v15)
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v44 = WeakRetained;
        _os_log_impl(&dword_22D97D000, v16, OS_LOG_TYPE_INFO, "Receiving file transfer complete: %@", buf, 0xCu);
      }

    }
    -[__CFString localPath](WeakRetained, "localPath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    IMGreenTeaAttachmentReadLoggingFormat();

  }
  else if (v15)
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v44 = WeakRetained;
      v45 = 2112;
      *(_QWORD *)v46 = v12;
      _os_log_impl(&dword_22D97D000, v18, OS_LOG_TYPE_INFO, "Receiving file transfer failed: %@    error: %@", buf, 0x16u);
    }

  }
  if ((a4 & 1) != 0)
    v19 = 1;
  else
    v19 = sub_22D981688(v12);
  if (*(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) < 3)
    v20 = v19;
  else
    v20 = 0;
  if (a5 && !*(_BYTE *)(a1 + 144))
    v20 = 0;
  if ((a3 & 1) == 0 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = CFSTR("NO");
      if (v20)
        v22 = CFSTR("YES");
      v23 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24);
      *(_DWORD *)buf = 138412802;
      v44 = v22;
      v45 = 1024;
      *(_DWORD *)v46 = v23;
      *(_WORD *)&v46[4] = 1024;
      *(_DWORD *)&v46[6] = 3;
      _os_log_impl(&dword_22D97D000, v21, OS_LOG_TYPE_INFO, "File transfer downloads failed!  Should retry: %@   Retries: %d  Max Retries: %d", buf, 0x18u);
    }

  }
  if (v20)
  {
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24);
    v32 = *(id *)(a1 + 32);
    v33 = *(id *)(a1 + 48);
    v34 = *(id *)(a1 + 56);
    v35 = *(id *)(a1 + 64);
    v36 = *(id *)(a1 + 72);
    v37 = *(id *)(a1 + 80);
    v38 = *(id *)(a1 + 88);
    v41 = *(id *)(a1 + 96);
    v42 = *(id *)(a1 + 104);
    v39 = WeakRetained;
    v40 = v11;
    im_dispatch_after_primary_queue();

    v24 = v32;
LABEL_37:

    goto LABEL_38;
  }
  v25 = *(_QWORD *)(*(_QWORD *)(a1 + 120) + 8);
  v26 = *(void **)(v25 + 40);
  *(_QWORD *)(v25 + 40) = 0;

  v27 = *(_QWORD *)(a1 + 104);
  if (v27)
  {
    v28 = *(_QWORD *)(a1 + 32);
    v29 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v11, "mmcsError");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    failReasonStringForMMCSError();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, id, void *))(v27 + 16))(v27, v28, v29, a3, v12, v31);

  }
  if ((_DWORD)a3)
  {
    -[__CFString localPath](WeakRetained, "localPath");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    IMGreenTeaAttachmentReadLoggingFormat();
    goto LABEL_37;
  }
LABEL_38:

}

void sub_22D986C30(uint64_t a1)
{
  int v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = *(unsigned __int8 *)(a1 + 152);
  v3 = IMOSLoggingEnabled();
  if (v2)
  {
    if (v3)
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v5 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v22 = v5;
        _os_log_impl(&dword_22D97D000, v4, OS_LOG_TYPE_INFO, "Needs to re-authorize, will retry using that: %@", buf, 0xCu);
      }

    }
    LOBYTE(v14) = 0;
    objc_msgSend(*(id *)(a1 + 40), "_receiveFileTransfer:topic:path:requestURLString:ownerID:signature:allowReauthorize:fileSize:sourceAppID:progressBlock:completionBlock:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), v14, *(_QWORD *)(a1 + 144), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120));
  }
  else
  {
    if (v3)
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40);
        *(_DWORD *)buf = 138412290;
        v22 = v7;
        _os_log_impl(&dword_22D97D000, v6, OS_LOG_TYPE_INFO, "Re-registering files: %@", buf, 0xCu);
      }

    }
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(v8 + 8);
    v10 = *(_QWORD *)(a1 + 128);
    v11 = *(_QWORD *)(*(_QWORD *)(v10 + 8) + 40);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = sub_22D986E60;
    v15[3] = &unk_24F97A138;
    v19 = v10;
    v15[4] = v8;
    v16 = *(id *)(a1 + 96);
    v17 = *(id *)(a1 + 88);
    v12 = *(id *)(a1 + 104);
    v13 = *(_QWORD *)(a1 + 136);
    v18 = v12;
    v20 = v13;
    objc_msgSend(v9, "registerFilesForDownload:completionBlock:", v11, v15);

  }
}

void sub_22D986E60(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v18 = v3;
      _os_log_impl(&dword_22D97D000, v2, OS_LOG_TYPE_INFO, "Getting transfers: %@", buf, 0xCu);
    }

  }
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 40), "requestURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "requestorID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "authToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_22D987024;
  v13[3] = &unk_24F97A110;
  v10 = *(id *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 72);
  v12 = *(_QWORD *)(a1 + 32);
  v14 = v10;
  v15 = v12;
  v16 = v11;
  objc_msgSend(v4, "getFiles:requestURL:requestorID:sourceAppID:authToken:completionBlock:", v5, v6, v7, v8, v9, v13);

}

void sub_22D987024(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  int v9;
  NSObject *v10;
  int v11;
  int v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "setMMCSError:", v8);
  v9 = IMOSLoggingEnabled();
  if (a3)
  {
    if (v9)
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        v13 = 138412546;
        v14 = v7;
        v15 = 1024;
        LODWORD(v16) = v11;
        _os_log_impl(&dword_22D97D000, v10, OS_LOG_TYPE_INFO, "Finished download request for files: %@     retry: %d", (uint8_t *)&v13, 0x12u);
      }
LABEL_9:

    }
  }
  else if (v9)
  {
    OSLogHandleForIMEventCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      v13 = 138412802;
      v14 = v8;
      v15 = 2112;
      v16 = v7;
      v17 = 1024;
      v18 = v12;
      _os_log_impl(&dword_22D97D000, v10, OS_LOG_TYPE_INFO, "Failed download request: %@   files: %@   retry: %d", (uint8_t *)&v13, 0x1Cu);
    }
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "unregisterFiles:", v7);

}

void sub_22D9871D4(uint64_t a1, int a2)
{
  FTiMessageRequestMMCSDownloadToken *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  os_activity_t v41;
  void *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  FTiMessageRequestMMCSDownloadToken *v52;
  _QWORD v53[4];
  os_activity_t v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  _QWORD v66[15];
  _QWORD v67[15];
  uint64_t v68;
  void *v69;
  uint8_t buf[4];
  id v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  uint64_t v75;
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "stopTimingForKey:", *(_QWORD *)(a1 + 32));
  if (a2)
  {
    v4 = objc_alloc_init(FTiMessageRequestMMCSDownloadToken);
    if (objc_msgSend(*(id *)(a1 + 40), "length"))
      -[IDSBaseMessage setTopic:](v4, "setTopic:", *(_QWORD *)(a1 + 40));
    -[FTiMessageRequestMMCSDownloadToken setOwner:](v4, "setOwner:", *(_QWORD *)(a1 + 48));
    -[FTiMessageRequestMMCSDownloadToken setSignature:](v4, "setSignature:", *(_QWORD *)(a1 + 56));
    v52 = v4;
    if (IMOptOutOfOptimizedMadridAttachmentDownloadPath())
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          v6 = *(void **)(a1 + 64);
          *(_DWORD *)buf = 138412290;
          v71 = v6;
          _os_log_impl(&dword_22D97D000, v5, OS_LOG_TYPE_INFO, "Opting download with GUID %@ out of optimized AuthGet flow.", buf, 0xCu);
        }

        v4 = v52;
      }
      -[FTiMessageRequestMMCSDownloadToken setContentVersion:](v4, "setContentVersion:", 0);
      goto LABEL_29;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 72) + 8), "getContentHeadersAsString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      -[FTiMessageRequestMMCSDownloadToken setContentVersion:](v4, "setContentVersion:", 2);
      v31 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(*(id *)(a1 + 80), "scheme");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 80), "host");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringWithFormat:", CFSTR("%@://%@"), v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[FTiMessageRequestMMCSDownloadToken setAuthURLString:](v52, "setAuthURLString:", v34);

      -[FTiMessageRequestMMCSDownloadToken setContentHeaders:](v52, "setContentHeaders:", v30);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          -[FTiMessageRequestMMCSDownloadToken contentHeaders](v52, "contentHeaders");
          v36 = (id)objc_claimAutoreleasedReturnValue();
          -[FTiMessageRequestMMCSDownloadToken messageBody](v52, "messageBody");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = *(_QWORD *)(a1 + 64);
          *(_DWORD *)buf = 138412802;
          v71 = v36;
          v72 = 2112;
          v73 = v37;
          v74 = 2112;
          v75 = v38;
          _os_log_impl(&dword_22D97D000, v35, OS_LOG_TYPE_INFO, "Sending Madrid AuthGet with content headers: %@ body:%@ for transfer: %@", buf, 0x20u);

        }
LABEL_27:

      }
    }
    else
    {
      -[FTiMessageRequestMMCSDownloadToken setContentVersion:](v4, "setContentVersion:", 0);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          v39 = *(void **)(a1 + 64);
          *(_DWORD *)buf = 138412290;
          v71 = v39;
          _os_log_impl(&dword_22D97D000, v35, OS_LOG_TYPE_INFO, "Tried to send Madrid AuthGet, but could not fetch content header for transfer: %@", buf, 0xCu);
        }
        goto LABEL_27;
      }
    }

LABEL_29:
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = _os_activity_create(&dword_22D97D000, "com.apple.messages.MMCSPreAuth", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "startTimingForKey:", *(_QWORD *)(a1 + 88));
    +[IMTransferAgentDeliveryController sharedInstance](IMTransferAgentDeliveryController, "sharedInstance");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = MEMORY[0x24BDAC760];
    v53[1] = 3221225472;
    v53[2] = sub_22D987B08;
    v53[3] = &unk_24F97A1D8;
    v43 = *(_QWORD *)(a1 + 144);
    v54 = v41;
    v65 = v43;
    v55 = *(id *)(a1 + 88);
    v56 = *(id *)(a1 + 64);
    v57 = *(id *)(a1 + 96);
    v58 = *(id *)(a1 + 104);
    v59 = *(id *)(a1 + 112);
    v44 = *(id *)(a1 + 120);
    v45 = *(_QWORD *)(a1 + 72);
    v60 = v44;
    v61 = v45;
    v62 = *(id *)(a1 + 128);
    v63 = *(id *)(a1 + 136);
    v64 = v40;
    v51 = v40;
    v28 = v41;
    objc_msgSend(v42, "sendFTMessage:completionBlock:", v52, v53);

    v15 = v54;
    goto LABEL_30;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 72) + 8), "unregisterFiles:", *(_QWORD *)(a1 + 128));
  objc_msgSend(*(id *)(a1 + 104), "completionBlock");
  v7 = objc_claimAutoreleasedReturnValue();
  v52 = (FTiMessageRequestMMCSDownloadToken *)v7;
  if (v7)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v7 + 16))(v7, *(_QWORD *)(a1 + 104), 0, 0, 0, 0);
  v68 = *MEMORY[0x24BE50E98];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 44);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE51238], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trackEvent:withDictionary:", *MEMORY[0x24BE50EA0], v50);

  objc_msgSend(MEMORY[0x24BE30360], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "wiFiActiveAndReachable");

  if (v11)
    v12 = 2;
  else
    v12 = 3;
  v13 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BE508E8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithInt:", objc_msgSend(v14, "linkQualityValueForInterfaceType:", v12));
  v51 = (id)objc_claimAutoreleasedReturnValue();

  parseMMCSError();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = *MEMORY[0x24BE50F28];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v49;
  v66[1] = *MEMORY[0x24BE50F60];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v67[1] = v48;
  v66[2] = *MEMORY[0x24BE50F88];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v67[2] = v47;
  v16 = *MEMORY[0x24BE50F58];
  v66[3] = *MEMORY[0x24BE50F48];
  v66[4] = v16;
  v67[3] = &unk_24F97D3C0;
  v67[4] = v51;
  v66[5] = *MEMORY[0x24BE50E88];
  if (v11)
    v17 = 2;
  else
    v17 = 1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v17);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v67[5] = v46;
  v18 = *MEMORY[0x24BE50E80];
  v67[6] = &unk_24F97D3C0;
  v19 = *MEMORY[0x24BE50F10];
  v66[6] = v18;
  v66[7] = v19;
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v67[7] = v20;
  v66[8] = *MEMORY[0x24BE50F08];
  objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v67[8] = v21;
  v66[9] = *MEMORY[0x24BE50F70];
  objc_msgSend(v15, "objectAtIndexedSubscript:", 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v67[9] = v22;
  v66[10] = *MEMORY[0x24BE50F68];
  objc_msgSend(v15, "objectAtIndexedSubscript:", 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v67[10] = v23;
  v66[11] = *MEMORY[0x24BE50F80];
  objc_msgSend(v15, "objectAtIndexedSubscript:", 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v67[11] = v24;
  v66[12] = *MEMORY[0x24BE50F78];
  objc_msgSend(v15, "objectAtIndexedSubscript:", 5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v67[12] = v25;
  v66[13] = *MEMORY[0x24BE50F20];
  objc_msgSend(v15, "objectAtIndexedSubscript:", 6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v67[13] = v26;
  v66[14] = *MEMORY[0x24BE50F18];
  objc_msgSend(v15, "objectAtIndexedSubscript:", 7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v67[14] = v27;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v67, v66, 15);
  v28 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE51238], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "trackEvent:withDictionary:", *MEMORY[0x24BE50EB0], v28);

LABEL_30:
}

void sub_22D987AD4(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x22D9878DCLL);
  }
  _Unwind_Resume(a1);
}

void sub_22D987B08(uint64_t a1, void *a2, void *a3, int a4, unsigned int a5)
{
  id v9;
  NSObject *v10;
  qos_class_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void (**v68)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v69;
  _QWORD v70[4];
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  _BYTE *v78;
  unsigned int v79;
  os_activity_scope_state_s state;
  _QWORD v81[15];
  _QWORD v82[15];
  uint64_t v83;
  void *v84;
  _BYTE buf[24];
  void *v86;
  os_activity_scope_state_s v87;
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v64 = a2;
  v9 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = qos_class_self();
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v11;
      _os_log_impl(&dword_22D97D000, v10, OS_LOG_TYPE_INFO, "Handling download MMCS auth at qos (%u)", buf, 8u);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40), "stopTimingForKey:", *(_QWORD *)(a1 + 40));
  v12 = v9;
  v13 = objc_msgSend(v12, "responseContentVersion");
  v69 = v12;
  v14 = objc_msgSend(v12, "contentVersion");
  if (v14 != v13 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2112;
      v86 = v16;
      _os_log_impl(&dword_22D97D000, v15, OS_LOG_TYPE_INFO, "Madrid responded with 'cV': %tu, but we requested a 'cV': %tu (transfer: %@)", buf, 0x20u);
    }

  }
  if (v13 <= 0)
  {
    if ((a4 & 1) == 0)
      goto LABEL_26;
  }
  else
  {
    objc_msgSend(v69, "responseContentBody");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17 == 0;

    if (v18)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v21 = *(_QWORD *)(a1 + 48);
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = v13;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v21;
          _os_log_impl(&dword_22D97D000, v20, OS_LOG_TYPE_INFO, "Madrid responded with 'cV': %tu, but no response body (transfer: %@)", buf, 0x16u);
        }

      }
      a5 = 17;
      goto LABEL_26;
    }
    if (!a4)
    {
LABEL_26:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 88) + 8), "unregisterFiles:", *(_QWORD *)(a1 + 96));
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMEventCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v69;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = a5;
          _os_log_impl(&dword_22D97D000, v22, OS_LOG_TYPE_INFO, "Failed sending mmcs download request: %@, error %u", buf, 0x12u);
        }

      }
      objc_msgSend(*(id *)(a1 + 64), "completionBlock");
      v68 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v83 = *MEMORY[0x24BE50E98];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 46);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = v23;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
      v24 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE51238], "sharedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "trackEvent:withDictionary:", *MEMORY[0x24BE50EA0], v24);

      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IMTransferAgentErrorDomain"), a5, 0);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v66 = 0;
      }
      objc_msgSend(MEMORY[0x24BE30360], "sharedInstance");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "wiFiActiveAndReachable");

      v28 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(MEMORY[0x24BE508E8], "sharedInstance");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v27)
        v31 = 2;
      else
        v31 = 3;
      objc_msgSend(v28, "numberWithInt:", objc_msgSend(v29, "linkQualityValueForInterfaceType:", v31));
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      parseMMCSError();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v81[0] = *MEMORY[0x24BE50F28];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", a5);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v82[0] = v63;
      v81[1] = *MEMORY[0x24BE50F60];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v82[1] = v62;
      v81[2] = *MEMORY[0x24BE50F88];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 3);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = *MEMORY[0x24BE50F48];
      v82[2] = v61;
      v82[3] = &unk_24F97D3C0;
      v34 = *MEMORY[0x24BE50F58];
      v81[3] = v33;
      v81[4] = v34;
      v82[4] = v65;
      v81[5] = *MEMORY[0x24BE50E88];
      if (v27)
        v35 = 2;
      else
        v35 = 1;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v35, v24);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = *MEMORY[0x24BE50E80];
      v82[5] = v60;
      v82[6] = &unk_24F97D3C0;
      v37 = *MEMORY[0x24BE50F10];
      v81[6] = v36;
      v81[7] = v37;
      objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v82[7] = v38;
      v81[8] = *MEMORY[0x24BE50F08];
      objc_msgSend(v32, "objectAtIndexedSubscript:", 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v82[8] = v39;
      v81[9] = *MEMORY[0x24BE50F70];
      objc_msgSend(v32, "objectAtIndexedSubscript:", 2);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v82[9] = v40;
      v81[10] = *MEMORY[0x24BE50F68];
      objc_msgSend(v32, "objectAtIndexedSubscript:", 3);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v82[10] = v41;
      v81[11] = *MEMORY[0x24BE50F80];
      objc_msgSend(v32, "objectAtIndexedSubscript:", 4);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v82[11] = v42;
      v81[12] = *MEMORY[0x24BE50F78];
      objc_msgSend(v32, "objectAtIndexedSubscript:", 5);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v82[12] = v43;
      v81[13] = *MEMORY[0x24BE50F20];
      objc_msgSend(v32, "objectAtIndexedSubscript:", 6);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v82[13] = v44;
      v81[14] = *MEMORY[0x24BE50F18];
      objc_msgSend(v32, "objectAtIndexedSubscript:", 7);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v82[14] = v45;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v82, v81, 15);
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE51238], "sharedInstance");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "trackEvent:withDictionary:", *MEMORY[0x24BE50EB0], v67);

      if (v68)
        ((void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, void *))v68)[2](v68, *(_QWORD *)(a1 + 64), 0, 0, 0, v66);

      goto LABEL_48;
    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v69;
      _os_log_impl(&dword_22D97D000, v19, OS_LOG_TYPE_INFO, "Finished sending mmcs download request: %@", buf, 0xCu);
    }

  }
  objc_msgSend(v69, "responseAuthToken");
  v68 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v67 = 0;
  }
  objc_msgSend(v69, "responseRequestorID");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "setRequestorID:", v66);
  objc_msgSend(*(id *)(a1 + 64), "setAuthToken:", v68);
  v47 = *(void **)(a1 + 64);
  objc_msgSend(v69, "responseContentBody");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setAuthResponseData:", v48);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      v50 = *(_QWORD *)(a1 + 64);
      v51 = *(_QWORD *)(a1 + 72);
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v50;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v51;
      *(_WORD *)&buf[22] = 2112;
      v86 = v68;
      LOWORD(v87.opaque[0]) = 2112;
      *(uint64_t *)((char *)v87.opaque + 2) = (uint64_t)v66;
      _os_log_impl(&dword_22D97D000, v49, OS_LOG_TYPE_INFO, "Request to receive transfer: %@  path: %@  auth token: %@  requestor ID: %@", buf, 0x2Au);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40), "startTimingForKey:", *(_QWORD *)(a1 + 80));
  v52 = _os_activity_create(&dword_22D97D000, "com.apple.messages.MMCSGetFile", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3010000000;
  v87.opaque[0] = 0;
  v87.opaque[1] = 0;
  v86 = &unk_22D99B617;
  v65 = v52;
  os_activity_scope_enter(v52, &v87);
  v53 = *(_QWORD *)(a1 + 96);
  v54 = *(void **)(*(_QWORD *)(a1 + 88) + 8);
  objc_msgSend(*(id *)(a1 + 64), "requestorID");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = *(_QWORD *)(a1 + 104);
  v70[0] = MEMORY[0x24BDAC760];
  v70[1] = 3221225472;
  v70[2] = sub_22D98860C;
  v70[3] = &unk_24F97A1B0;
  v77 = *(_QWORD *)(a1 + 120);
  v71 = *(id *)(a1 + 80);
  v72 = *(id *)(a1 + 64);
  v73 = *(id *)(a1 + 48);
  v74 = *(id *)(a1 + 112);
  v57 = *(id *)(a1 + 72);
  v79 = a5;
  v78 = buf;
  v58 = *(_QWORD *)(a1 + 88);
  v75 = v57;
  v76 = v58;
  objc_msgSend(v54, "getFiles:requestURL:requestorID:sourceAppID:authToken:completionBlock:", v53, v67, v55, v56, v68, v70);

  _Block_object_dispose(buf, 8);
LABEL_48:

  os_activity_scope_leave(&state);
}

void sub_22D98860C(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  NSObject *v8;
  void *v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void (**v28)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  uint64_t v88;
  void *v89;
  id v90;
  _QWORD v91[16];
  _QWORD v92[16];
  uint64_t v93;
  void *v94;
  _QWORD v95[16];
  _QWORD v96[16];
  uint8_t buf[4];
  id v98;
  __int16 v99;
  double v100;
  __int16 v101;
  double v102;
  uint64_t v103;
  _QWORD v104[4];

  v104[1] = *MEMORY[0x24BDAC8D0];
  v86 = a2;
  v7 = a4;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "stopTimingForKey:", *(_QWORD *)(a1 + 32));
  v87 = v7;
  objc_msgSend(*(id *)(a1 + 40), "setMMCSError:", v7);
  v88 = a1;
  if (a3)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = *(void **)(a1 + 48);
        v10 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
        *(_DWORD *)buf = 138412546;
        v98 = v9;
        v99 = 2112;
        v100 = v10;
        _os_log_impl(&dword_22D97D000, v8, OS_LOG_TYPE_INFO, "Download timing for transfer ID%@ %@", buf, 0x16u);
      }

    }
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = 0;

    v103 = *MEMORY[0x24BE50E98];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v104[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v104, &v103, 1);
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE51238], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "trackEvent:withDictionary:", *MEMORY[0x24BE50EA0], v81);

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    v17 = v16;

    v18 = 0.0;
    if (v17 > 0.0)
      v18 = (double)(unint64_t)objc_msgSend(*(id *)(a1 + 40), "protocolFileSize") / v17 * 0.0009765625;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v98 = v86;
        _os_log_impl(&dword_22D97D000, v19, OS_LOG_TYPE_INFO, "Built download succeeded for files: %@", buf, 0xCu);
      }

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMEventCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v98 = v86;
        v99 = 2048;
        v100 = v17;
        v101 = 2048;
        v102 = v18;
        _os_log_impl(&dword_22D97D000, v20, OS_LOG_TYPE_INFO, "Finished download request for files: %@  download time was: %f  speed: %.0f kb/s", buf, 0x20u);
      }

    }
    objc_msgSend(MEMORY[0x24BE50898], "defaultHFSFileManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(a1 + 64);
    v90 = 0;
    objc_msgSend(v21, "attributesOfItemAtPath:error:", v22, &v90);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v90;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v17);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE30360], "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "wiFiActiveAndReachable");

    if (v24)
      v25 = 2;
    else
      v25 = 3;
    v26 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE508E8], "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "numberWithInt:", objc_msgSend(v27, "linkQualityValueForInterfaceType:", v25));
    v89 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v85, "fileSize"));
    v28 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v87, "code"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    parseMMCSError();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v95[0] = *MEMORY[0x24BE50F28];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", *(unsigned int *)(v88 + 96));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v96[0] = v79;
    v95[1] = *MEMORY[0x24BE50F60];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v96[1] = v77;
    v95[2] = *MEMORY[0x24BE50F88];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v96[2] = v75;
    v30 = *MEMORY[0x24BE50E90];
    v95[3] = *MEMORY[0x24BE50F48];
    v95[4] = v30;
    v96[3] = v71;
    v96[4] = v84;
    v31 = *MEMORY[0x24BE50F58];
    v96[5] = v89;
    v32 = *MEMORY[0x24BE50E88];
    v95[5] = v31;
    v95[6] = v32;
    if (v24)
      v33 = 2;
    else
      v33 = 1;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v33);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v96[6] = v73;
    v34 = *MEMORY[0x24BE50E80];
    v96[7] = v28;
    v35 = *MEMORY[0x24BE50F10];
    v95[7] = v34;
    v95[8] = v35;
    objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v96[8] = v72;
    v95[9] = *MEMORY[0x24BE50F08];
    objc_msgSend(v29, "objectAtIndexedSubscript:", 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v96[9] = v36;
    v95[10] = *MEMORY[0x24BE50F70];
    objc_msgSend(v29, "objectAtIndexedSubscript:", 2);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v96[10] = v37;
    v95[11] = *MEMORY[0x24BE50F68];
    objc_msgSend(v29, "objectAtIndexedSubscript:", 3);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v96[11] = v38;
    v95[12] = *MEMORY[0x24BE50F80];
    objc_msgSend(v29, "objectAtIndexedSubscript:", 4);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v96[12] = v39;
    v95[13] = *MEMORY[0x24BE50F78];
    objc_msgSend(v29, "objectAtIndexedSubscript:", 5);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v96[13] = v40;
    v95[14] = *MEMORY[0x24BE50F20];
    objc_msgSend(v29, "objectAtIndexedSubscript:", 6);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v96[14] = v41;
    v95[15] = *MEMORY[0x24BE50F18];
    objc_msgSend(v29, "objectAtIndexedSubscript:", 7);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v96[15] = v42;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v96, v95, 16);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE51238], "sharedInstance");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "trackEvent:withDictionary:", *MEMORY[0x24BE50EB0], v43);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    v47 = v46;

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMEventCategory();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v98 = v86;
        v99 = 2112;
        v100 = *(double *)&v87;
        v101 = 2048;
        v102 = v47;
        _os_log_impl(&dword_22D97D000, v48, OS_LOG_TYPE_INFO, "Failed downloading files: %@  error: %@  time was: %f", buf, 0x20u);
      }

    }
    v93 = *MEMORY[0x24BE50E98];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", objc_msgSend(v87, "code"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = v49;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE51238], "sharedInstance");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "trackEvent:withDictionary:", *MEMORY[0x24BE50EA0], v82);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v47);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE30360], "sharedInstance");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "wiFiActiveAndReachable");

    if (v52)
      v53 = 2;
    else
      v53 = 3;
    v54 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE508E8], "sharedInstance");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "numberWithInt:", objc_msgSend(v55, "linkQualityValueForInterfaceType:", v53));
    v83 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v87, "code"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    parseMMCSError();
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v91[0] = *MEMORY[0x24BE50F28];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", *(unsigned int *)(v88 + 96));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v92[0] = v80;
    v91[1] = *MEMORY[0x24BE50F60];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v92[1] = v78;
    v91[2] = *MEMORY[0x24BE50F88];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v92[2] = v76;
    v56 = *MEMORY[0x24BE50E90];
    v91[3] = *MEMORY[0x24BE50F48];
    v91[4] = v56;
    v92[3] = v84;
    v92[4] = v85;
    v57 = *MEMORY[0x24BE50F58];
    v92[5] = v83;
    v58 = *MEMORY[0x24BE50E88];
    v91[5] = v57;
    v91[6] = v58;
    if (v52)
      v59 = 2;
    else
      v59 = 1;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v59);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v92[6] = v74;
    v60 = *MEMORY[0x24BE50E80];
    v92[7] = &unk_24F97D3C0;
    v61 = *MEMORY[0x24BE50F10];
    v91[7] = v60;
    v91[8] = v61;
    objc_msgSend(v89, "objectAtIndexedSubscript:", 0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v92[8] = v62;
    v91[9] = *MEMORY[0x24BE50F08];
    objc_msgSend(v89, "objectAtIndexedSubscript:", 1);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v92[9] = v63;
    v91[10] = *MEMORY[0x24BE50F70];
    objc_msgSend(v89, "objectAtIndexedSubscript:", 2);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v92[10] = v64;
    v91[11] = *MEMORY[0x24BE50F68];
    objc_msgSend(v89, "objectAtIndexedSubscript:", 3);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v92[11] = v65;
    v91[12] = *MEMORY[0x24BE50F80];
    objc_msgSend(v89, "objectAtIndexedSubscript:", 4);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v92[12] = v66;
    v91[13] = *MEMORY[0x24BE50F78];
    objc_msgSend(v89, "objectAtIndexedSubscript:", 5);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v92[13] = v67;
    v91[14] = *MEMORY[0x24BE50F20];
    objc_msgSend(v89, "objectAtIndexedSubscript:", 6);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v92[14] = v68;
    v91[15] = *MEMORY[0x24BE50F18];
    objc_msgSend(v89, "objectAtIndexedSubscript:", 7);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v92[15] = v69;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v92, v91, 16);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE51238], "sharedInstance");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "trackEvent:withDictionary:", *MEMORY[0x24BE50EB0], v43);

    objc_msgSend(*(id *)(v88 + 40), "completionBlock");
    v28 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    os_activity_scope_leave((os_activity_scope_state_t)(*(_QWORD *)(*(_QWORD *)(v88 + 88) + 8) + 32));
    if (v28)
      v28[2](v28, *(_QWORD *)(v88 + 40), 0, 0, 0, 0);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(v88 + 72) + 8), "unregisterFiles:", v86);
}

void sub_22D9896DC(uint64_t a1, void *a2, void *a3, int a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v11 = a2;
  v12 = a5;
  v13 = a6;
  v14 = a3;
  im_assert_primary_queue();
  if (a4)
  {
    v15 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = sub_22D989818;
    v18[3] = &unk_24F97A228;
    v17 = *(_QWORD *)(a1 + 40);
    v21 = *(id *)(a1 + 48);
    v19 = v11;
    v20 = v13;
    objc_msgSend(v15, "ensureSafeAttachment:topic:withCompletionBlock:", v16, v17, v18);

    v14 = v21;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void sub_22D989818(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _DWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v13[0] = 67109120;
      v13[1] = qos_class_self();
      _os_log_impl(&dword_22D97D000, v9, OS_LOG_TYPE_INFO, "Handling ensureSafeAttachment at qos (%u)", (uint8_t *)v13, 8u);
    }

  }
  im_assert_primary_queue();
  v10 = a1[6];
  v11 = a1[4];
  objc_msgSend(v7, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *, uint64_t, id, _QWORD))(v10 + 16))(v10, v11, v12, a2, v8, a1[5]);

}

void sub_22D989964(uint64_t a1, void *a2, void *a3, int a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[4];
  qos_class_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v24 = qos_class_self();
      _os_log_impl(&dword_22D97D000, v15, OS_LOG_TYPE_INFO, "Handling download completion at qos (%u)", buf, 8u);
    }

  }
  im_assert_primary_queue();
  if (a4 && objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    +[IMTransferEncryptionController sharedInstance](IMTransferEncryptionController, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(_QWORD *)(a1 + 40);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = sub_22D989B7C;
    v20[3] = &unk_24F97A278;
    v22 = *(id *)(a1 + 56);
    v21 = *(id *)(a1 + 48);
    objc_msgSend(v16, "decryptURL:key:outputFileName:completionBlock:", v17, v18, v19, v20);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void sub_22D989B7C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v19) = qos_class_self();
      _os_log_impl(&dword_22D97D000, v9, OS_LOG_TYPE_INFO, "Handling download decryption at qos (%u)", buf, 8u);
    }

  }
  im_assert_primary_queue();
  v11 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v8, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *, uint64_t, _QWORD, _QWORD))(v10 + 16))(v10, v11, v12, a3, 0, 0);

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v14 = objc_msgSend(v13, "removeItemAtURL:error:", v7, &v17);
    v15 = v17;

    if ((v14 & 1) == 0 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v19 = v7;
        v20 = 2112;
        v21 = v15;
        _os_log_impl(&dword_22D97D000, v16, OS_LOG_TYPE_INFO, "Error cleaning up encrypted attachment path: %@  error: %@", buf, 0x16u);
      }

    }
  }
  else
  {
    v15 = 0;
  }

}

void sub_22D989F78(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  char v16;
  NSObject *v17;
  uint64_t v18;
  BOOL v19;
  NSObject *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  im_assert_primary_queue();
  if ((a2 & 1) != 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isEqual:", v7) & 1) != 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v10 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          v24 = v10;
          _os_log_impl(&dword_22D97D000, v9, OS_LOG_TYPE_INFO, "Generating safe render succeeded, but still using the original path since we cannot transcode the entire asset: %@", buf, 0xCu);
        }

      }
      v11 = 0;
      goto LABEL_17;
    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v24 = v13;
      v25 = 2112;
      v26 = v8;
      _os_log_impl(&dword_22D97D000, v12, OS_LOG_TYPE_INFO, "Error generating safe render for transfer: %@ error: %@", buf, 0x16u);
    }

  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 32);
  v22 = 0;
  v16 = objc_msgSend(v14, "removeItemAtURL:error:", v15, &v22);
  v11 = v22;

  if ((v16 & 1) == 0 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v24 = v18;
      v25 = 2112;
      v26 = v11;
      _os_log_impl(&dword_22D97D000, v17, OS_LOG_TYPE_INFO, "Error removing transfer: %@ error: %@", buf, 0x16u);
    }

  }
LABEL_17:
  if (v7)
    v19 = v8 == 0;
  else
    v19 = 0;
  if (v19)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D97D000, v20, OS_LOG_TYPE_INFO, "Decontamination succeeded", buf, 2u);
      }

    }
    v21 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE50DB0], 28, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_22D98A300()
{
  IMTransferAgentDeliveryController *v0;
  void *v1;

  v0 = objc_alloc_init(IMTransferAgentDeliveryController);
  v1 = (void *)qword_2540D93E0;
  qword_2540D93E0 = (uint64_t)v0;

}

void sub_22D98A5A0(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  const __CFString *v22;
  NSObject *v23;
  uint64_t v24;
  int v25;
  _DWORD v26[7];

  *(_QWORD *)&v26[5] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a5;
  v12 = v9;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMEventCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v25 = 138412290;
      *(_QWORD *)v26 = v12;
      _os_log_impl(&dword_22D97D000, v13, OS_LOG_TYPE_INFO, "    Delivered FTMessage: %@", (uint8_t *)&v25, 0xCu);
    }

  }
  v14 = _FZErrorTypeFromResponseCodeAndError();
  v15 = v14;
  if (v10)
    v16 = 0;
  else
    v16 = (_DWORD)v14 == 0;
  v17 = v16;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v25 = 67109376;
      v26[0] = a4;
      LOWORD(v26[1]) = 1024;
      *(_DWORD *)((char *)&v26[1] + 2) = v15;
      _os_log_impl(&dword_22D97D000, v18, OS_LOG_TYPE_INFO, "    Result code: %d, errorType = %d", (uint8_t *)&v25, 0xEu);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v25 = 138412290;
      *(_QWORD *)v26 = v11;
      _os_log_impl(&dword_22D97D000, v19, OS_LOG_TYPE_INFO, "    Result dictionary: %@", (uint8_t *)&v25, 0xCu);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v25 = 138412290;
      *(_QWORD *)v26 = v10;
      _os_log_impl(&dword_22D97D000, v20, OS_LOG_TYPE_INFO, "    Error: %@", (uint8_t *)&v25, 0xCu);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = CFSTR("NO");
      if ((_DWORD)v17)
        v22 = CFSTR("YES");
      v25 = 138412290;
      *(_QWORD *)v26 = v22;
      _os_log_impl(&dword_22D97D000, v21, OS_LOG_TYPE_INFO, "  Success: %@", (uint8_t *)&v25, 0xCu);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_22D97D000, v23, OS_LOG_TYPE_INFO, "Sending callback for FTMessage send", (uint8_t *)&v25, 2u);
    }

  }
  v24 = *(_QWORD *)(a1 + 40);
  if (v24)
    (*(void (**)(uint64_t, _QWORD, id, uint64_t, uint64_t))(v24 + 16))(v24, *(_QWORD *)(a1 + 32), v12, v17, v15);

}

void sub_22D98A9B4()
{
  IMTransferAgentNicknameController *v0;
  void *v1;

  v0 = objc_alloc_init(IMTransferAgentNicknameController);
  v1 = (void *)qword_2540D93E8;
  qword_2540D93E8 = (uint64_t)v0;

}

void sub_22D98AC08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22D98AC20(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_22D98AC30(uint64_t a1)
{

}

void sub_22D98AC38(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  int v11;
  void *v12;
  void *v13;
  id *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *, void *);
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  __int16 v39;
  uint8_t buf[4];
  _BOOL4 v41;
  __int16 v42;
  int v43;
  __int16 v44;
  int v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91E8]), "initWithRecordName:", *(_QWORD *)(a1 + 32));
  v6 = objc_alloc(MEMORY[0x24BDB91E8]);
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("-wp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithRecordName:", v7);

  objc_msgSend(v4, "addObject:", v5);
  v9 = *(_QWORD *)(a1 + 40) || *(_QWORD *)(a1 + 48) || *(_QWORD *)(a1 + 56) != 0;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = *(unsigned __int8 *)(a1 + 104);
      *(_DWORD *)buf = 67109890;
      v41 = v9;
      v42 = 1024;
      v43 = v11;
      v44 = 1024;
      v45 = 1;
      v46 = 2112;
      v47 = v8;
      _os_log_impl(&dword_22D97D000, v10, OS_LOG_TYPE_INFO, "Have some wallpaper tag: %i, knownSender: %i, shouldFetchWallpaperRecord: %i, wallpaperRecordID: %@", buf, 0x1Eu);
    }

  }
  if (v9 && *(_BYTE *)(a1 + 104))
    objc_msgSend(v4, "addObject:", v8);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB90E8]), "initWithRecordIDs:", v4);
  objc_msgSend(MEMORY[0x24BE51248], "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDesiredKeys:", v13);

  v14 = (id *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 64), "_nickNameFetchConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setConfiguration:", v15);

  v24 = MEMORY[0x24BDAC760];
  v25 = 3221225472;
  v26 = sub_22D98AFB8;
  v27 = &unk_24F97A340;
  v28 = *(id *)(a1 + 72);
  v29 = v5;
  v30 = v8;
  v31 = *(id *)(a1 + 80);
  v16 = *(id *)(a1 + 88);
  v17 = *(_QWORD *)(a1 + 64);
  v36 = v16;
  v32 = v17;
  v33 = *(id *)(a1 + 48);
  v34 = *(id *)(a1 + 56);
  v18 = *(id *)(a1 + 40);
  v39 = *(_WORD *)(a1 + 104);
  v19 = *(_QWORD *)(a1 + 96);
  v37 = v3;
  v38 = v19;
  v35 = v18;
  v20 = v3;
  v21 = v8;
  v22 = v5;
  objc_msgSend(v12, "setFetchRecordsCompletionBlock:", &v24);
  objc_msgSend(*v14, "_nickNamePublicDB", v24, v25, v26, v27);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addOperation:", v12);

}

void sub_22D98AFB8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  __int128 v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  __int128 v29;
  __int16 v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v6;
      _os_log_impl(&dword_22D97D000, v7, OS_LOG_TYPE_INFO, "Public Nickname retrieval completed with error %@", buf, 0xCu);
    }

  }
  if (v6 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v32 = v9;
      _os_log_impl(&dword_22D97D000, v8, OS_LOG_TYPE_INFO, "Public nickname retrieval errors %@", buf, 0xCu);

    }
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22D98B288;
  block[3] = &unk_24F97A318;
  v19 = v6;
  v20 = v5;
  v10 = *(NSObject **)(a1 + 32);
  v21 = *(id *)(a1 + 40);
  v22 = *(id *)(a1 + 48);
  v23 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 96);
  v12 = *(_QWORD *)(a1 + 64);
  v13 = *(void **)(a1 + 72);
  v28 = v11;
  v24 = v12;
  v25 = v13;
  v26 = *(id *)(a1 + 80);
  v27 = *(id *)(a1 + 88);
  v30 = *(_WORD *)(a1 + 120);
  v17 = *(_OWORD *)(a1 + 104);
  v14 = (id)v17;
  v29 = v17;
  v15 = v5;
  v16 = v6;
  dispatch_async(v10, block);

}

void sub_22D98B288(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40), v2);
    if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 112) + 16))() & 1) == 0)
    {
      v3 = *(_QWORD *)(a1 + 104);
      objc_msgSend(*(id *)(a1 + 72), "_errorWrappingError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40));
      v22 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", *(_QWORD *)(a1 + 56));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v4;
        _os_log_impl(&dword_22D97D000, v6, OS_LOG_TYPE_INFO, "Public Nickname record found %@", buf, 0xCu);
      }

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v5;
        _os_log_impl(&dword_22D97D000, v7, OS_LOG_TYPE_INFO, "Public Wallpaper record found %@", buf, 0xCu);
      }

    }
    v8 = *(_QWORD *)(a1 + 64);
    v24 = 0;
    objc_msgSend(MEMORY[0x24BE51268], "preKeyWithDataRepresentation:error:", v8, &v24);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v24;
    if (v9)
    {
      v11 = *(_QWORD *)(a1 + 80);
      v12 = *(_QWORD *)(a1 + 88);
      v13 = *(_QWORD *)(a1 + 96);
      v14 = *(_WORD *)(a1 + 128);
      v23 = v10;
      LOWORD(v21) = v14;
      objc_msgSend(MEMORY[0x24BE51248], "nicknameFromPublicRecord:wallpaperRecord:preKey:wallpaperDataTag:wallpaperLowResDataTag:wallpaperMetadataTag:knownSender:shouldDecodeImageFields:error:", v4, v5, v9, v11, v12, v13, v21, &v23);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v23;

      if (v15)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v26 = v15;
            _os_log_impl(&dword_22D97D000, v17, OS_LOG_TYPE_INFO, "Transfer agent sending back nickname: %@", buf, 0xCu);
          }

        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 104) + 16))();
      }
      else
      {
        v19 = *(_QWORD *)(a1 + 104);
        objc_msgSend(*(id *)(a1 + 72), "_errorWrappingError:", v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v19 + 16))(v19, 0, v20);

      }
      v10 = v16;
    }
    else
    {
      v18 = *(_QWORD *)(a1 + 104);
      objc_msgSend(*(id *)(a1 + 72), "_errorWrappingError:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v18 + 16))(v18, 0, v15);
    }

  }
}

uint64_t sub_22D98B6B8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_22D98B73C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("creatorUserRecordID == %@"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91B8]), "initWithRecordType:predicate:", CFSTR("imsgNicknamePublicv2"), v7);
  objc_msgSend(MEMORY[0x24BDB91F0], "defaultRecordZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "zoneID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v5;
      _os_log_impl(&dword_22D97D000, v11, OS_LOG_TYPE_INFO, "Querying for all record ids created by userRecordID %@", buf, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_nickNamePublicDB");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_22D98B934;
  v14[3] = &unk_24F97A3B8;
  v15 = v10;
  v16 = *(id *)(a1 + 40);
  v13 = v10;
  objc_msgSend(v12, "performQuery:inZoneWithID:completionHandler:", v8, v13, v14);

}

void sub_22D98B934(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412802;
      v10 = v8;
      v11 = 2112;
      v12 = v5;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_22D97D000, v7, OS_LOG_TYPE_INFO, "Got back records in zone %@ created by current user %@ error %@", (uint8_t *)&v9, 0x20u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_22D98C010(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9)
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;

  v25 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = v21;
  v23 = *(_QWORD *)(a1 + 40);
  if (v23)
  {
    if (v21)
    {
      objc_msgSend(*(id *)(a1 + 32), "_errorWrappingError:", v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, id, id, id, id, id, id, void *))(v23 + 16))(v23, a2, v25, v16, v17, v18, v19, v20, v24);

    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, id, id, id, id, id, id, _QWORD))(v23 + 16))(v23, a2, v25, v16, v17, v18, v19, v20, 0);
    }
  }

}

void sub_22D98C144(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "stopTimingForKey:", CFSTR("Nickname Upload"));
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "totalTimeForKey:", CFSTR("Nickname Upload"));
      *(_DWORD *)buf = 134217984;
      v25 = v7;
      _os_log_impl(&dword_22D97D000, v6, OS_LOG_TYPE_INFO, "Nickname uploaded in time: %f", buf, 0xCu);
    }

  }
  v8 = IMOSLoggingEnabled();
  if (a2)
  {
    if (v8)
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D97D000, v9, OS_LOG_TYPE_INFO, "Encrypted Nickname stored in Public Database", buf, 2u);
      }

    }
    v10 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "recordID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v12 = objc_msgSend(v10, "updateNicknameWithRecordID:error:", v11, &v23);
    v13 = v23;

    v14 = *(_QWORD *)(a1 + 88);
    if ((v12 & 1) != 0)
    {
      v15 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "recordID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "recordName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "dataRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "dataRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 72), "dataRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 80), "dataRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, uint64_t, void *, void *, void *, void *, void *, _QWORD))(v14 + 16))(v14, 1, v15, v17, v18, v19, v20, v21, 0);

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, id))(v14 + 16))(v14, 0, 0, 0, 0, 0, 0, 0, v13);
    }

  }
  else
  {
    if (v8)
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D97D000, v22, OS_LOG_TYPE_INFO, "Unable to store in Public Database, aborting fan out to other devices", buf, 2u);
      }

    }
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 88) + 16))(*(_QWORD *)(a1 + 88));
  }

}

void sub_22D98C588(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5 && objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "arrayByApplyingSelector:", sel_recordID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v6;
        _os_log_impl(&dword_22D97D000, v9, OS_LOG_TYPE_INFO, "Going to delete recordIDs %@, with error", buf, 0xCu);
      }

    }
    v10 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = sub_22D98C73C;
    v14[3] = &unk_24F97A458;
    v12 = *(id *)(a1 + 48);
    v13 = *(_QWORD *)(a1 + 32);
    v16 = v12;
    v14[4] = v13;
    v15 = v6;
    objc_msgSend(v10, "_updateEncryptedPersonalNicknameToPublicCloudKitDBSavingRecords:deletingRecordIDs:queue:withCompletionBlock:", 0, v8, v11, v14);

  }
}

void sub_22D98C73C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
  {
    v8 = v5;
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "_errorWrappingError:", *(_QWORD *)(a1 + 40));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, a2, v7);

    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v6 + 16))(v6, a2, 0);
    }
    v5 = v8;
  }

}

void sub_22D98C9C4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "stopTimingForKey:", CFSTR("Nickname Delete"));
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "totalTimeForKey:", CFSTR("Nickname Delete"));
      v9 = 134217984;
      v10 = v7;
      _os_log_impl(&dword_22D97D000, v6, OS_LOG_TYPE_INFO, "Deleted nickname record in time: %f", (uint8_t *)&v9, 0xCu);
    }

  }
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "_updateEncryptedPersonalNicknameToPublicCloudKitDBSavingRecords:deletingRecordIDs:queue:withCompletionBlock:", *(_QWORD *)(a1 + 56), 0, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 72);
    if (v8)
      (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }

}

void sub_22D98CDAC(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v26 = v5;
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_22D97D000, v4, OS_LOG_TYPE_INFO, "Going to delete nicknames from public db %@ and save nickname to public db %@", buf, 0x16u);
    }

  }
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  v10 = objc_alloc(MEMORY[0x24BDB9158]);
  if (*(_QWORD *)(a1 + 40))
    v11 = *(_QWORD *)(a1 + 40);
  else
    v11 = MEMORY[0x24BDBD1A8];
  v12 = (void *)objc_msgSend(v10, "initWithRecordsToSave:recordIDsToDelete:", v11, v9);
  v13 = (id *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 48), "_nickNameSaveConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setConfiguration:", v14);

  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = sub_22D98CFC4;
  v19[3] = &unk_24F97A548;
  v20 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 64);
  v16 = *(_QWORD *)(a1 + 72);
  v21 = *(_QWORD *)(a1 + 48);
  v22 = v15;
  v23 = v3;
  v24 = v16;
  v17 = v3;
  objc_msgSend(v12, "setModifyRecordsCompletionBlock:", v19);
  objc_msgSend(*v13, "_nickNamePublicDB");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addOperation:", v12);

}

void sub_22D98CFC4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  __int128 *p_buf;
  _QWORD block[4];
  id v21;
  __int128 buf;
  uint64_t v23;
  char v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_22D97D000, v10, OS_LOG_TYPE_INFO, "Public Nickname with recordID Publish completed with error %@", (uint8_t *)&buf, 0xCu);
    }

  }
  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a4);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v23 = 0x2020000000;
    v24 = 0;
    v12 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(a1 + 40);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = sub_22D98D224;
    v14[3] = &unk_24F97A520;
    p_buf = &buf;
    v17 = *(id *)(a1 + 56);
    v15 = *(id *)(a1 + 32);
    v18 = *(id *)(a1 + 48);
    v16 = v9;
    objc_msgSend(v11, "_handleSaveNicknameError:queue:withCompletionBlock:", v16, v12, v14);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v13 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_22D98D210;
    block[3] = &unk_24F97A4D0;
    v21 = *(id *)(a1 + 48);
    dispatch_async(v13, block);

  }
}

void sub_22D98D1F0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22D98D210(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_22D98D224(uint64_t a1, int a2)
{
  int v4;
  NSObject *v5;
  NSObject *v6;
  id *v7;
  id *v8;
  _QWORD *v9;
  NSObject *v10;
  const __CFString *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = IMOSLoggingEnabled();
  if (!a2)
  {
    if (v4)
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = *(const __CFString **)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v19 = v11;
        _os_log_impl(&dword_22D97D000, v10, OS_LOG_TYPE_INFO, "We should not retry the ck operation on this error %@", buf, 0xCu);
      }

    }
    v6 = *(NSObject **)(a1 + 32);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = sub_22D98D480;
    v12[3] = &unk_24F97A4F8;
    v7 = &v14;
    v14 = *(id *)(a1 + 56);
    v8 = &v13;
    v13 = *(id *)(a1 + 40);
    v9 = v12;
    goto LABEL_13;
  }
  if (v4)
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v19 = CFSTR("YES");
      _os_log_impl(&dword_22D97D000, v5, OS_LOG_TYPE_INFO, "We should retry the ck operation %@", buf, 0xCu);
    }

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v6 = *(NSObject **)(a1 + 32);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = sub_22D98D46C;
    v15[3] = &unk_24F97A4F8;
    v7 = &v17;
    v17 = *(id *)(a1 + 56);
    v8 = &v16;
    v16 = *(id *)(a1 + 40);
    v9 = v15;
LABEL_13:
    dispatch_async(v6, v9);

  }
}

uint64_t sub_22D98D46C(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t sub_22D98D480(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void sub_22D98D72C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22D98D75C(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

void sub_22D98D9BC(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;
  uint64_t v9;

  v5[0] = MEMORY[0x24BDAC760];
  v5[2] = sub_22D98DA74;
  v5[3] = &unk_24F97A5C0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 64);
  v5[4] = v2;
  v5[1] = 3221225472;
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v4 = (void *)MEMORY[0x22E31D724](v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

BOOL sub_22D98DA74(uint64_t a1)
{
  unint64_t v1;
  NSObject *v2;
  uint8_t v4[16];

  v1 = *(_QWORD *)(a1 + 64);
  if (v1 > 2)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_22D97D000, v2, OS_LOG_TYPE_INFO, "Failed CloudKit operation. Too many retries.", v4, 2u);
      }

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "cloudKitOperationWithRetryCount:queue:withError:operation:", v1 + 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  return v1 < 3;
}

void sub_22D98E2B4()
{
  IMTransferEncryptionController *v0;
  void *v1;

  v0 = objc_alloc_init(IMTransferEncryptionController);
  v1 = (void *)qword_2540D93F0;
  qword_2540D93F0 = (uint64_t)v0;

}

id sub_22D98E564(uint64_t a1, uint64_t a2, void *a3, void *a4, _QWORD *a5)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint8_t buf[4];
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
LABEL_15:
    v10 = 0;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "fileURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v11, 0, a5);
        v10 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_16;
      }
      if (!a5)
        goto LABEL_11;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing fileURL for CKAsset {key: %@, value: %@}"), v8, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x24BDD1540];
      v24 = *MEMORY[0x24BDD0BA0];
      v25[0] = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", *MEMORY[0x24BE50FA0], -1000, v14);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected type for {key: %@, value: %@}"), v8, v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x24BDD1540];
      v22 = *MEMORY[0x24BDD0BA0];
      v23 = v15;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", *MEMORY[0x24BE50FA0], -1000, v17);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_11:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v8;
        _os_log_impl(&dword_22D97D000, v18, OS_LOG_TYPE_INFO, "IMNickname CKRecord contains object for key '%@' but of unexpected type", buf, 0xCu);
      }

    }
    goto LABEL_15;
  }
  v10 = v9;
LABEL_16:

  return v10;
}

id sub_22D98E818(void *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, __int16 a9, uint64_t a10)
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  uint64_t v25;
  uint8_t v27[16];
  uint8_t buf[16];

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D97D000, v21, OS_LOG_TYPE_INFO, "Decrypting nickname record", buf, 2u);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_22D97D000, v22, OS_LOG_TYPE_INFO, "Handing Nickname data to BlastDoor to defuse", v27, 2u);
    }

  }
  LOWORD(v25) = a9;
  objc_msgSend(a1, "_blastdoorNicknameFromPublicRecord:wallpaperRecord:preKey:wallpaperDataTag:wallpaperLowResDataTag:wallpaperMetadataTag:knownSender:shouldDecodeImageFields:error:", v15, v16, v17, v18, v19, v20, v25, a10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

id sub_22D98E9D0(void *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, unsigned __int8 a9, char a10, _QWORD *a11)
{
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  int v26;
  __CFDictionary *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  dispatch_semaphore_t v33;
  void *v34;
  void *v35;
  void *v36;
  BOOL v37;
  id v38;
  id v39;
  id v40;
  NSObject *v41;
  __CFDictionary *v42;
  dispatch_time_t v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v54;
  void *v55;
  __CFDictionary *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  _BYTE v60[24];
  void *v61;
  uint64_t v62;
  id v63;
  id v64;
  id value;
  id v66;
  id v67;
  uint8_t v68[16];
  _QWORD v69[4];
  NSObject *v70;
  id v71;
  __CFDictionary *v72;
  __int128 *p_buf;
  uint64_t *v74;
  void *v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;
  uint64_t v82;
  const __CFString *v83;
  __int128 buf;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  id v88;
  const __CFString *v89;
  _QWORD v90[4];

  v90[1] = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v67 = a4;
  v63 = a5;
  value = a6;
  v64 = a7;
  v66 = a8;
  if (a11)
  {
    objc_msgSend(a1, "dataFromCKRecord:forKey:error:", v17, CFSTR("n"), a11);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "dataFromCKRecord:forKey:error:", v17, CFSTR("am"), a11);
    v62 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "dataFromCKRecord:forKey:error:", v17, CFSTR("ad"), a11);
    v59 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "dataFromCKRecord:forKey:error:", v67, CFSTR("wd"), a11);
    *(_QWORD *)&v60[8] = objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "dataFromCKRecord:forKey:error:", v67, CFSTR("lrwd"), a11);
    *(_QWORD *)v60 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "dataFromCKRecord:forKey:error:", v67, CFSTR("wm"), a11);
    *(_QWORD *)&v60[16] = objc_claimAutoreleasedReturnValue();
    if (!v61)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_22D97D000, v21, OS_LOG_TYPE_INFO, "CKRecord is missing required nickname data", (uint8_t *)&buf, 2u);
        }

      }
      v20 = 0;
      goto LABEL_84;
    }
    v89 = CFSTR("n");
    v90[0] = v61;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v90, &v89, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (void *)objc_msgSend(v18, "mutableCopy");

    if (v62 && v59)
    {
      objc_msgSend(v58, "setObject:forKeyedSubscript:", v59, CFSTR("ad"));
      objc_msgSend(v58, "setObject:forKeyedSubscript:", v62, CFSTR("am"));
    }
    else if (v62 | v59)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_22D97D000, v22, OS_LOG_TYPE_INFO, "CKRecord contains incomplete avatar data", (uint8_t *)&buf, 2u);
        }
        goto LABEL_81;
      }
LABEL_82:
      v20 = 0;
LABEL_83:

LABEL_84:
      goto LABEL_85;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = *(_QWORD *)&v60[8];
        _os_log_impl(&dword_22D97D000, v23, OS_LOG_TYPE_INFO, "Wallpaper | encryptedWallpaperData: %@", (uint8_t *)&buf, 0xCu);
      }

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = *(_QWORD *)&v60[16];
        _os_log_impl(&dword_22D97D000, v24, OS_LOG_TYPE_INFO, "Wallpaper | encryptedWallpaperMetadata: %@", (uint8_t *)&buf, 0xCu);
      }

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = *(_QWORD *)v60;
        _os_log_impl(&dword_22D97D000, v25, OS_LOG_TYPE_INFO, "Wallpaper | encryptedLowResWallpaperData: %@", (uint8_t *)&buf, 0xCu);
      }

    }
    v26 = (a10 & ~objc_msgSend(MEMORY[0x24BE511E8], "deviceIsLockedDown") & a9);
    if (v26 == 1 && *(_QWORD *)&v60[16] && *(_OWORD *)v60 != 0)
    {
      objc_msgSend(v58, "setObject:forKeyedSubscript:", *(_QWORD *)&v60[16], CFSTR("wm"));
      if (*(_QWORD *)v60)
        objc_msgSend(v58, "setObject:forKeyedSubscript:", *(_QWORD *)v60, CFSTR("lrwd"));
      if (*(_QWORD *)&v60[8])
        objc_msgSend(v58, "setObject:forKeyedSubscript:", *(_QWORD *)&v60[8], CFSTR("wd"));
      goto LABEL_43;
    }
    if (!v26 || *(_OWORD *)&v60[8] == 0 && !*(_QWORD *)v60)
    {
LABEL_43:
      if ((a9 & 1) != 0)
      {
        v27 = 0;
      }
      else
      {
        v27 = (__CFDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
        objc_msgSend(v17, "recordID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "recordName");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
          CFDictionarySetValue(v27, CFSTR("recordId"), v29);

        objc_msgSend(v67, "recordID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "recordName");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
          CFDictionarySetValue(v27, CFSTR("wallpaperRecordId"), v31);

        objc_msgSend(v63, "dataRepresentation");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32)
          CFDictionarySetValue(v27, CFSTR("preKey"), v32);

        if (value)
          CFDictionarySetValue(v27, CFSTR("wallpaperDataTag"), value);
        if (v66)
          CFDictionarySetValue(v27, CFSTR("wallpaperMetadataTag"), v66);
        if (v64)
          CFDictionarySetValue(v27, CFSTR("wallpaperLowResDataTag"), v64);
      }
      v56 = v27;
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v85 = 0x3032000000;
      v86 = sub_22D98F490;
      v87 = sub_22D98F4A0;
      v88 = 0;
      v76 = 0;
      v77 = &v76;
      v78 = 0x3032000000;
      v79 = sub_22D98F490;
      v80 = sub_22D98F4A0;
      v81 = 0;
      v33 = dispatch_semaphore_create(0);
      objc_msgSend(MEMORY[0x24BE51280], "contextWithKnownSender:", a9);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = (void *)MEMORY[0x24BE511A0];
      objc_msgSend(v17, "recordID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "recordName");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "dataRepresentation");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v26 == 0;
      if (v26)
        v38 = v66;
      else
        v38 = 0;
      if (v26)
        v39 = v64;
      else
        v39 = 0;
      if (v37)
        v40 = 0;
      else
        v40 = value;
      v69[0] = MEMORY[0x24BDAC760];
      v69[1] = 3221225472;
      v69[2] = sub_22D98F4A8;
      v69[3] = &unk_24F97A6A0;
      p_buf = &buf;
      v41 = v33;
      v70 = v41;
      v75 = a1;
      v71 = v17;
      v74 = &v76;
      v42 = v56;
      v72 = v42;
      LOBYTE(v54) = a10;
      objc_msgSend(v55, "generateNickname:senderContext:forRecordID:wallpaperDataTag:wallpaperLowResDataTag:wallpaperMetadataTag:withKey:processImageFields:completionBlock:", v58, v57, v35, v40, v39, v38, v36, v54, v69);

      v43 = dispatch_time(0, 10000000000);
      if (dispatch_semaphore_wait(v41, v43))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v68 = 0;
            _os_log_impl(&dword_22D97D000, v44, OS_LOG_TYPE_INFO, "Timed out while waiting for Nickname BlastDoor and/or content analysis.", v68, 2u);
          }

        }
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE50FA0], -3000, 0);
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = *(void **)(*((_QWORD *)&buf + 1) + 40);
        *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v45;

      }
      v20 = (void *)v77[5];
      if (v20)
      {
        v47 = v20;
      }
      else
      {
        v48 = *(void **)(*((_QWORD *)&buf + 1) + 40);
        if (!v48)
        {
          v49 = (void *)MEMORY[0x24BDD1540];
          v82 = *MEMORY[0x24BDD0BA0];
          v83 = CFSTR("Neither error nor result from blastdoor completion handler");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "errorWithDomain:code:userInfo:", *MEMORY[0x24BE50FA0], -1000, v50);
          v51 = objc_claimAutoreleasedReturnValue();
          v52 = *(void **)(*((_QWORD *)&buf + 1) + 40);
          *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v51;

          v48 = *(void **)(*((_QWORD *)&buf + 1) + 40);
        }
        *a11 = objc_retainAutorelease(v48);
      }

      _Block_object_dispose(&v76, 8);
      _Block_object_dispose(&buf, 8);

      goto LABEL_83;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_22D97D000, v22, OS_LOG_TYPE_INFO, "CKRecord contains incomplete wallpaper data for nickname", (uint8_t *)&buf, 2u);
      }
LABEL_81:

      goto LABEL_82;
    }
    goto LABEL_82;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_22D97D000, v19, OS_LOG_TYPE_INFO, "No error pointer provided, please fix", (uint8_t *)&buf, 2u);
    }

  }
  v20 = 0;
LABEL_85:

  return v20;
}

void sub_22D98F39C(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    objc_end_catch();
    JUMPOUT(0x22D98F2F4);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_22D98F490(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_22D98F4A0(uint64_t a1)
{

}

void sub_22D98F4A8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  char isKindOfClass;
  void *v12;
  id v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unint64_t v41;
  unint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  id v49;
  void *v50;
  char v51;
  void *v52;
  BOOL v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  double v82;
  double v83;
  void *v84;
  void *v85;
  void *v86;
  double v87;
  double v88;
  void *v89;
  void *v90;
  void *v91;
  double v92;
  void *v93;
  double v94;
  double v95;
  void *v96;
  void *v97;
  double v98;
  double v99;
  void *v100;
  void *v101;
  void *v102;
  double v103;
  double v104;
  void *v105;
  void *v106;
  void *v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  id v122;
  NSObject *v123;
  id v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  uint64_t v131;
  void *v132;
  void *v133;
  uint64_t v134;
  uint64_t v135;
  NSObject *v136;
  id v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  uint64_t v143;
  void *v144;
  id v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  id v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  id v161;
  void *v162;
  id v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  char v179;
  int v180;
  void *v181;
  void *v182;
  void *v183;
  uint64_t v184;
  NSObject *group;
  id v186;
  void *v187;
  _QWORD block[4];
  id v189;
  id v190;
  id v191;
  id v192;
  id v193;
  uint64_t v194;
  _BYTE *v195;
  uint64_t *v196;
  _QWORD v197[4];
  id v198;
  id v199;
  NSObject *v200;
  __int128 *v201;
  uint64_t v202;
  uint64_t *v203;
  uint64_t *v204;
  uint64_t v205;
  char v206;
  id v207;
  id v208;
  id v209;
  uint64_t v210;
  uint64_t *v211;
  uint64_t v212;
  uint64_t (*v213)(uint64_t, uint64_t);
  void (*v214)(uint64_t);
  id v215;
  id v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  _QWORD v221[4];
  id v222;
  NSObject *v223;
  uint64_t *v224;
  uint64_t v225;
  _BYTE *v226;
  uint64_t v227;
  char v228;
  id v229;
  id obj;
  uint64_t v231;
  uint64_t *v232;
  uint64_t v233;
  uint64_t (*v234)(uint64_t, uint64_t);
  void (*v235)(uint64_t);
  id v236;
  uint8_t v237[4];
  _BYTE v238[10];
  __int128 v239;
  uint64_t v240;
  uint64_t (*v241)(uint64_t, uint64_t);
  void (*v242)(uint64_t);
  id v243;
  uint8_t v244[128];
  _BYTE buf[24];
  uint64_t (*v246)(uint64_t, uint64_t);
  void (*v247)(uint64_t);
  id v248;
  uint64_t v249;

  v249 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v186 = a3;
  v187 = v5;
  if (v5)
  {
    group = dispatch_group_create();
    objc_msgSend(MEMORY[0x24BE511C8], "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v184 = objc_msgSend(v6, "enablementGroup");

    objc_msgSend(MEMORY[0x24BE511C8], "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v180 = objc_msgSend(v7, "checksForSensitivityOnNicknameReceive");

    objc_msgSend(MEMORY[0x24BE511F0], "sharedFeatureFlags");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isAllowU18SnapAssetsEnabled");

    v179 = (v184 == 1) & ~(_BYTE)v9;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v184;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = (v184 == 1) & ~v9;
        _os_log_impl(&dword_22D97D000, v10, OS_LOG_TYPE_INFO, "About to construct the nickname with contentSafetyEnablementGroup: %ld, deleting sensitive assets: %d", buf, 0x12u);
      }

    }
    MEMORY[0x22E31D3AC](CFSTR("BlastDoorNickname"), CFSTR("BlastDoor"));
    isKindOfClass = objc_opt_isKindOfClass();
    v12 = v187;
    if ((isKindOfClass & 1) == 0)
      v12 = 0;
    v13 = v12;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v246 = sub_22D98F490;
    v247 = sub_22D98F4A0;
    v248 = 0;
    objc_msgSend(v13, "avatar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 == 0;

    if (!v15)
    {
      objc_msgSend(v13, "avatar");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "image");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "cgImage");
      v18 = (void *)IMCreatePNGImageDataFromCGImageRef();

      v231 = 0;
      v232 = &v231;
      v233 = 0x3032000000;
      v234 = sub_22D98F490;
      v235 = sub_22D98F4A0;
      v236 = 0;
      v19 = *(void **)(a1 + 72);
      objc_msgSend(*(id *)(a1 + 40), "recordID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "recordName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      obj = *(id *)(v22 + 40);
      objc_msgSend(v19, "_assetTargetURLForRecordName:fieldName:error:", v21, CFSTR("ad"), &obj);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v22 + 40), obj);
      v236 = v23;

      v24 = v232[5];
      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v229 = *(id *)(v25 + 40);
      v26 = objc_msgSend(v18, "writeToURL:options:error:", v24, 1, &v229);
      objc_storeStrong((id *)(v25 + 40), v229);
      if ((v26 & 1) != 0)
      {
        if (v180)
        {
          dispatch_group_enter(group);
          objc_msgSend(MEMORY[0x24BE511C0], "sharedManager");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v232[5];
          v221[0] = MEMORY[0x24BDAC760];
          v221[1] = 3221225472;
          v221[2] = sub_22D990998;
          v221[3] = &unk_24F97A628;
          v228 = v179;
          v29 = *(_QWORD *)(a1 + 72);
          v30 = *(_QWORD *)(a1 + 56);
          v224 = &v231;
          v225 = v30;
          v227 = v29;
          v226 = buf;
          v222 = v13;
          v223 = group;
          objc_msgSend(v27, "isSensitiveContent:contentAttachmentType:withChatID:completionHandler:", v28, 0, 0, v221);

        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              LODWORD(v239) = 134217984;
              *(_QWORD *)((char *)&v239 + 4) = v184;
              _os_log_impl(&dword_22D97D000, v31, OS_LOG_TYPE_INFO, "Avatar image safety check was skipped, comm safety check group setting: %ld. Creating IMNicknameAvatarImage.", (uint8_t *)&v239, 0xCu);
            }

          }
          v32 = objc_alloc(MEMORY[0x24BE51250]);
          objc_msgSend(v13, "avatar");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "imageName");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v232[5], "path");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v32, "initWithImageName:imageFilePath:contentIsSensitive:", v34, v35, 0);
          v37 = *(void **)(*(_QWORD *)&buf[8] + 40);
          *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v36;

        }
      }
      else
      {
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
      }
      _Block_object_dispose(&v231, 8);

      if ((v26 & 1) == 0)
        goto LABEL_73;
    }
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_40;
    objc_msgSend(v13, "pronouns");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v38)
      goto LABEL_40;
    v39 = *(void **)(a1 + 72);
    objc_msgSend(v13, "pronouns");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v39) = objc_msgSend(v39, "_isObjectBlastDoorMorphology:", v40);

    if ((_DWORD)v39)
    {
      objc_msgSend(v13, "pronouns");
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      v183 = (void *)objc_opt_new();
      v41 = objc_msgSend(v181, "grammaticalGender");
      if (v41 <= 2)
        objc_msgSend(v183, "setGender:", v41 + 1);
      v42 = objc_msgSend(v181, "number");
      if (v42 <= 5)
        objc_msgSend(v183, "setNumber:", qword_22D9960E0[v42]);
      objc_msgSend(v181, "customPronouns");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v43, "count") && objc_msgSend(*(id *)(a1 + 72), "_NSMorphologyCustomPronounClass"))
      {
        v219 = 0u;
        v220 = 0u;
        v217 = 0u;
        v218 = 0u;
        v177 = v43;
        v44 = v43;
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v217, v244, 16);
        if (v45)
        {
          v46 = *(_QWORD *)v218;
          while (2)
          {
            for (i = 0; i != v45; ++i)
            {
              if (*(_QWORD *)v218 != v46)
                objc_enumerationMutation(v44);
              v48 = *(void **)(*((_QWORD *)&v217 + 1) + 8 * i);
              if ((objc_msgSend(*(id *)(a1 + 72), "_isObjectBlastDoorCustomPronounPair:", v48) & 1) != 0)
              {
                v49 = v48;
                objc_msgSend(*(id *)(a1 + 72), "_languageStringForEnumCase:", objc_msgSend(v49, "language"));
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v51 = objc_msgSend(v50, "isEqual:", CFSTR("en"));

                if ((v51 & 1) != 0)
                {
                  v145 = objc_alloc_init((Class)objc_msgSend(*(id *)(a1 + 72), "_NSMorphologyCustomPronounClass"));
                  objc_msgSend(v49, "pronoun");
                  v146 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v146, "subjectForm");
                  v147 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v145, "setSubjectForm:", v147);

                  objc_msgSend(v49, "pronoun");
                  v148 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v148, "objectForm");
                  v149 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v145, "setObjectForm:", v149);

                  objc_msgSend(v49, "pronoun");
                  v150 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v150, "possessiveForm");
                  v151 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v145, "setPossessiveForm:", v151);

                  objc_msgSend(v49, "pronoun");
                  v152 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v152, "possessiveAdjectiveForm");
                  v153 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v145, "setPossessiveAdjectiveForm:", v153);

                  objc_msgSend(v49, "pronoun");
                  v154 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v154, "reflexiveForm");
                  v155 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v145, "setReflexiveForm:", v155);

                  objc_msgSend(v183, "setEnglishCustomPronoun:", v145);
                  goto LABEL_76;
                }

              }
            }
            v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v217, v244, 16);
            if (v45)
              continue;
            break;
          }
        }
LABEL_76:

        v43 = v177;
      }

    }
    else
    {
LABEL_40:
      v183 = 0;
    }
    v231 = 0;
    v232 = &v231;
    v233 = 0x3032000000;
    v234 = sub_22D98F490;
    v235 = sub_22D98F4A0;
    v236 = 0;
    objc_msgSend(v13, "wallpaper");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v52 == 0;

    if (!v53)
    {
      objc_msgSend(v13, "wallpaper");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "posterArchive");
      v182 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "wallpaper");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "lowResImage");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "image");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "cgImage");
      v178 = (void *)IMCreatePNGImageDataFromCGImageRef();

      *(_QWORD *)&v239 = 0;
      *((_QWORD *)&v239 + 1) = &v239;
      v240 = 0x3032000000;
      v241 = sub_22D98F490;
      v242 = sub_22D98F4A0;
      v243 = 0;
      v58 = *(void **)(a1 + 72);
      objc_msgSend(*(id *)(a1 + 40), "recordID");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "recordName");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v216 = *(id *)(v61 + 40);
      objc_msgSend(v58, "_assetTargetURLForRecordName:fieldName:error:", v60, CFSTR("wd"), &v216);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v61 + 40), v216);
      v243 = v62;

      v210 = 0;
      v211 = &v210;
      v212 = 0x3032000000;
      v213 = sub_22D98F490;
      v214 = sub_22D98F4A0;
      v215 = 0;
      v63 = *(void **)(a1 + 72);
      objc_msgSend(*(id *)(a1 + 40), "recordID");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "recordName");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v209 = *(id *)(v66 + 40);
      objc_msgSend(v63, "_assetTargetURLForRecordName:fieldName:error:", v65, CFSTR("lrwd"), &v209);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v66 + 40), v209);
      v215 = v67;

      if (v182)
      {
        v68 = *(_QWORD *)(*((_QWORD *)&v239 + 1) + 40);
        v69 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v208 = *(id *)(v69 + 40);
        v70 = objc_msgSend(v182, "writeToURL:options:error:", v68, 1, &v208);
        objc_storeStrong((id *)(v69 + 40), v208);
        if ((v70 & 1) == 0)
          goto LABEL_52;
      }
      if (v178)
      {
        v71 = v211[5];
        v72 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v207 = *(id *)(v72 + 40);
        v73 = objc_msgSend(v178, "writeToURL:options:error:", v71, 1, &v207);
        objc_storeStrong((id *)(v72 + 40), v207);
        if (!v73)
        {
LABEL_52:
          dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
          _Block_object_dispose(&v210, 8);

          _Block_object_dispose(&v239, 8);
          v93 = v182;
LABEL_72:

          _Block_object_dispose(&v231, 8);
LABEL_73:
          _Block_object_dispose(buf, 8);

          goto LABEL_74;
        }
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v74 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v237 = 67109376;
          *(_DWORD *)v238 = v182 != 0;
          *(_WORD *)&v238[4] = 1024;
          *(_DWORD *)&v238[6] = v178 != 0;
          _os_log_impl(&dword_22D97D000, v74, OS_LOG_TYPE_INFO, "Completed wallpaper has wallpaperData: %i lowResData: %i", v237, 0xEu);
        }

      }
      objc_msgSend(v13, "wallpaper");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "metadata");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "backgroundColor");
      v77 = (void *)objc_claimAutoreleasedReturnValue();

      if (v77)
      {
        v163 = objc_alloc(MEMORY[0x24BE51330]);
        objc_msgSend(v13, "wallpaper");
        v174 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v174, "metadata");
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v171, "backgroundColor");
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v168, "red");
        v79 = v78;
        objc_msgSend(v13, "wallpaper");
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v165, "metadata");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "backgroundColor");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "green");
        v83 = v82;
        objc_msgSend(v13, "wallpaper");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "metadata");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "backgroundColor");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "blue");
        v88 = v87;
        objc_msgSend(v13, "wallpaper");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "metadata");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "backgroundColor");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "alpha");
        v164 = (void *)objc_msgSend(v163, "initWithRed:green:blue:alpha:", v79, v83, v88, v92);

      }
      else
      {
        v164 = 0;
      }
      v161 = objc_alloc(MEMORY[0x24BE51330]);
      objc_msgSend(v13, "wallpaper");
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v175, "metadata");
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v172, "fontColor");
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v169, "red");
      v95 = v94;
      objc_msgSend(v13, "wallpaper");
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v166, "metadata");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "fontColor");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "green");
      v99 = v98;
      objc_msgSend(v13, "wallpaper");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "metadata");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "fontColor");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "blue");
      v104 = v103;
      objc_msgSend(v13, "wallpaper");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "metadata");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "fontColor");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "alpha");
      v159 = (void *)objc_msgSend(v161, "initWithRed:green:blue:alpha:", v95, v99, v104, v108);

      v156 = objc_alloc(MEMORY[0x24BE51328]);
      objc_msgSend(v13, "wallpaper");
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v176, "metadata");
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v173, "fontName");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "wallpaper");
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v170, "metadata");
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v167, "fontSize");
      v110 = v109;
      objc_msgSend(v13, "wallpaper");
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v162, "metadata");
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v160, "fontWeight");
      v112 = v111;
      objc_msgSend(v159, "dictionaryRepresentation");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "wallpaper");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "metadata");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v116 = objc_msgSend(v115, "isVertical");
      v117 = (void *)MEMORY[0x24BE51328];
      objc_msgSend(v13, "wallpaper");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "metadata");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "wallpaperExtensionIdentifierFromType:", objc_msgSend(v119, "type"));
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v164, "dictionaryRepresentation");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      v157 = (void *)objc_msgSend(v156, "initWithFontName:fontSize:fontWeight:fontColor:isVertical:type:backgroundColor:", v158, v113, v116, v120, v121, v110, v112);

      if (v180)
      {
        if (*(_QWORD *)(*((_QWORD *)&v239 + 1) + 40))
        {
          objc_msgSend(*(id *)(a1 + 72), "_getImageURLForPosterDataAt:");
          v122 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v122 = (id)v211[5];
        }
        v125 = v122;
        if (v122)
        {
          dispatch_group_enter(group);
          objc_msgSend(MEMORY[0x24BE511C0], "sharedManager");
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          v197[0] = MEMORY[0x24BDAC760];
          v197[1] = 3221225472;
          v197[2] = sub_22D990B98;
          v197[3] = &unk_24F97A650;
          v206 = v179;
          v134 = *(_QWORD *)(a1 + 72);
          v135 = *(_QWORD *)(a1 + 56);
          v201 = &v239;
          v202 = v135;
          v203 = &v210;
          v204 = &v231;
          v205 = v134;
          v198 = v13;
          v199 = v157;
          v200 = group;
          objc_msgSend(v133, "isSensitiveContent:contentAttachmentType:withChatID:completionHandler:", v125, 0, 0, v197);

          v126 = v198;
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v136 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v136, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v237 = 0;
              _os_log_impl(&dword_22D97D000, v136, OS_LOG_TYPE_INFO, "Skipped wallpaper safety check because we couldn't find a wallpaper image URL.", v237, 2u);
            }

          }
          v137 = objc_alloc(MEMORY[0x24BE51320]);
          objc_msgSend(v13, "wallpaper");
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v126, "highResFileName");
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*((_QWORD *)&v239 + 1) + 40), "path");
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "wallpaper");
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v140, "lowResFileName");
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v211[5], "path");
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          v143 = objc_msgSend(v137, "initWithFileName:filePath:lowResFileName:lowResFilePath:metadata:contentIsSensitive:", v138, v139, v141, v142, v157, 0);
          v144 = (void *)v232[5];
          v232[5] = v143;

        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v123 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v237 = 134217984;
            *(_QWORD *)v238 = v184;
            _os_log_impl(&dword_22D97D000, v123, OS_LOG_TYPE_INFO, "Wallpaper safety check was skipped, comm safety check group setting: %ld. Creating IMWallpaper.", v237, 0xCu);
          }

        }
        v124 = objc_alloc(MEMORY[0x24BE51320]);
        objc_msgSend(v13, "wallpaper");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "highResFileName");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*((_QWORD *)&v239 + 1) + 40), "path");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "wallpaper");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v128, "lowResFileName");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v211[5], "path");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        v131 = objc_msgSend(v124, "initWithFileName:filePath:lowResFileName:lowResFilePath:metadata:contentIsSensitive:", v126, v127, v129, v130, v157, 0);
        v132 = (void *)v232[5];
        v232[5] = v131;

      }
      _Block_object_dispose(&v210, 8);

      _Block_object_dispose(&v239, 8);
    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_22D990E1C;
    block[3] = &unk_24F97A678;
    v194 = *(_QWORD *)(a1 + 64);
    v189 = v13;
    v195 = buf;
    v190 = v183;
    v196 = &v231;
    v191 = *(id *)(a1 + 40);
    v192 = *(id *)(a1 + 48);
    v193 = *(id *)(a1 + 32);
    dispatch_group_notify(group, MEMORY[0x24BDAC9B8], block);

    v93 = v189;
    goto LABEL_72;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
LABEL_74:

}

void sub_22D990998(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id obj;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "localizedDescription");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      v9 = CFSTR("No error");
      if (v7)
        v9 = (const __CFString *)v7;
      *(_DWORD *)buf = 67109378;
      v24 = a2;
      v25 = 2112;
      v26 = v9;
      _os_log_impl(&dword_22D97D000, v6, OS_LOG_TYPE_INFO, "Avatar image was checked for sensitive content. Is sensitive: %d, error: %@", buf, 0x12u);

    }
  }
  if ((_DWORD)a2 && *(_BYTE *)(a1 + 80))
  {
    v10 = *(void **)(a1 + 72);
    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v12 + 40);
    objc_msgSend(v10, "_removeFile:error:", v11, &obj);
    objc_storeStrong((id *)(v12 + 40), obj);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = 0;

  }
  v15 = objc_alloc(MEMORY[0x24BE51250]);
  objc_msgSend(*(id *)(a1 + 32), "avatar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "imageName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "path");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v15, "initWithImageName:imageFilePath:contentIsSensitive:", v17, v18, a2);
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v19;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_22D990B98(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  id obj;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v30 = a2;
      v31 = 2112;
      v32 = v5;
      _os_log_impl(&dword_22D97D000, v6, OS_LOG_TYPE_INFO, "Wallpaper image was checked for sensitive content. Is sensitive: %d, error: %@", buf, 0x12u);
    }

  }
  if ((_DWORD)a2 && *(_BYTE *)(a1 + 96))
  {
    v7 = *(void **)(a1 + 88);
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    obj = *(id *)(v9 + 40);
    objc_msgSend(v7, "_removeFile:error:", v8, &obj);
    objc_storeStrong((id *)(v9 + 40), obj);
    v10 = *(void **)(a1 + 88);
    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v27 = *(id *)(v12 + 40);
    objc_msgSend(v10, "_removeFile:error:", v11, &v27);
    objc_storeStrong((id *)(v12 + 40), v27);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = 0;

    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = 0;

  }
  v17 = objc_alloc(MEMORY[0x24BE51320]);
  objc_msgSend(*(id *)(a1 + 32), "wallpaper");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "highResFileName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "path");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "wallpaper");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "lowResFileName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "path");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v17, "initWithFileName:filePath:lowResFileName:lowResFilePath:metadata:contentIsSensitive:", v19, v20, v22, v23, *(_QWORD *)(a1 + 40), a2);
  v25 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v26 = *(void **)(v25 + 40);
  *(_QWORD *)(v25 + 40) = v24;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

intptr_t sub_22D990E1C(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  uint64_t v18;
  _DWORD v20[2];
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BE51248]);
  objc_msgSend(*(id *)(a1 + 32), "firstName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "lastName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "initWithFirstName:lastName:avatar:pronouns:wallpaper:", v3, v4, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 48), "recordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recordName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRecordID:", v10);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setPreBlastDoorPayloadData:", *(_QWORD *)(a1 + 56));
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "avatar");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "hasImage");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "wallpaper");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "wallpaperExists");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "wallpaper");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "lowResWallpaperExists");
      v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      v20[0] = 67109890;
      v20[1] = v13;
      v21 = 1024;
      v22 = v15;
      v23 = 1024;
      v24 = v17;
      v25 = 2112;
      v26 = v18;
      _os_log_impl(&dword_22D97D000, v11, OS_LOG_TYPE_INFO, "Completed nickname parsing (hasImage: %i, hasWallpaper: %i, hasLowResWallpaper: %i) from public record: %@", (uint8_t *)v20, 0x1Eu);

    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
}

id sub_22D991068(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  __int128 buf;
  Class (*v35)(uint64_t);
  void *v36;
  uint64_t *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x2050000000;
    v4 = (void *)qword_255DA8E38;
    v33 = qword_255DA8E38;
    if (!qword_255DA8E38)
    {
      *(_QWORD *)&buf = MEMORY[0x24BDAC760];
      *((_QWORD *)&buf + 1) = 3221225472;
      v35 = sub_22D9937E0;
      v36 = &unk_24F97A6C8;
      v37 = &v30;
      sub_22D9937E0((uint64_t)&buf);
      v4 = (void *)v31[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v30, 8);
    v29 = 0;
    objc_msgSend(v5, "unarchiveConfigurationAtURL:format:error:", v3, -1, &v29);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v29;
    objc_msgSend(v6, "providerBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.PhotosUIPrivate.PhotosPosterProvider"));

    if ((v9 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v6, "providerBundleIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v25;
          _os_log_impl(&dword_22D97D000, v24, OS_LOG_TYPE_INFO, "Poster is not a photo, stop trying to get an image URL. Config bundle ID: %@", (uint8_t *)&buf, 0xCu);

        }
      }
      v22 = 0;
      goto LABEL_30;
    }
    v30 = 0;
    v31 = &v30;
    v32 = 0x2050000000;
    v10 = (void *)qword_255DA8E48;
    v33 = qword_255DA8E48;
    if (!qword_255DA8E48)
    {
      *(_QWORD *)&buf = MEMORY[0x24BDAC760];
      *((_QWORD *)&buf + 1) = 3221225472;
      v35 = sub_22D9938D4;
      v36 = &unk_24F97A6C8;
      v37 = &v30;
      sub_22D9938D4((uint64_t)&buf);
      v10 = (void *)v31[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v30, 8);
    objc_msgSend(v6, "assetDirectory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v7;
    objc_msgSend(v11, "loadFromURL:error:", v12, &v28);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v28;

    if (v13)
    {
      objc_msgSend(v13, "media");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count") == 1;

      if (v16)
      {
        objc_msgSend(v13, "media");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "assetDirectory");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "subpath");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "URLByAppendingPathComponent:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "URLByAppendingPathComponent:", CFSTR("output.layerStack/portrait-layer_background.HEIC"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_29:
        v7 = v14;
LABEL_30:

        goto LABEL_31;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_22D97D000, v26, OS_LOG_TYPE_INFO, "Expected the poster config to have exactly one media", (uint8_t *)&buf, 2u);
        }
LABEL_27:

      }
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v14;
        _os_log_impl(&dword_22D97D000, v26, OS_LOG_TYPE_INFO, "Failed to generate a poster config. Error: %@", (uint8_t *)&buf, 0xCu);
      }
      goto LABEL_27;
    }
    v22 = 0;
    goto LABEL_29;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_22D97D000, v23, OS_LOG_TYPE_INFO, "Given nil for the poster url, bailing.", (uint8_t *)&buf, 2u);
    }

  }
  v22 = 0;
LABEL_31:

  return v22;
}

void sub_22D9914B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    objc_end_catch();
    JUMPOUT(0x22D991460);
  }
  _Unwind_Resume(exception_object);
}

id sub_22D991538(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void **a7)
{
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  int v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  int v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  id v86;
  __int16 v87;
  id v88;
  uint64_t v89;
  _QWORD v90[3];

  v90[1] = *MEMORY[0x24BDAC8D0];
  v75 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v84 = a1;
      v85 = 2112;
      v86 = v75;
      _os_log_impl(&dword_22D97D000, v10, OS_LOG_TYPE_INFO, "Creating record from nickname {nickname: %@, preKey: %@}", buf, 0x16u);
    }

  }
  objc_msgSend(a1, "publicDictionaryRepresentationWithoutAvatar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  JWEncodeDictionary();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObjectsAndKeys:", v12, CFSTR("n"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "avatar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "publicDictionaryMetadataRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    JWEncodeDictionary();
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "avatar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "imageData");
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    if (v72)
      v17 = v73 == 0;
    else
      v17 = 1;
    v18 = !v17;
    v19 = IMOSLoggingEnabled();
    if (v18)
    {
      if (v19)
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22D97D000, v20, OS_LOG_TYPE_INFO, "Nickname has avatar data", buf, 2u);
        }

      }
      objc_msgSend(v13, "setObject:forKey:", v73, CFSTR("am"));
      objc_msgSend(v13, "setObject:forKey:", v72, CFSTR("ad"));
    }
    else if (v19)
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v84 = a1;
        _os_log_impl(&dword_22D97D000, v24, OS_LOG_TYPE_INFO, "Nickname doesn't have avatar data {nickname: %@}", buf, 0xCu);
      }

    }
    v76 = 0;
    objc_msgSend(MEMORY[0x24BE51258], "encryptAndTagPlainFields:withPreKey:returningRecordTag:error:", v13, v75, &v76, a7);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v76;
    v71 = v25;
    if (v74 && v25)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "wallpaper");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "wallpaperExists");

      if (v27)
      {
        v28 = objc_alloc(MEMORY[0x24BE51260]);
        objc_msgSend(a1, "wallpaper");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "wallpaperData");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v28, "initWithFieldName:plainData:", CFSTR("wd"), v30);

        objc_msgSend(MEMORY[0x24BE51258], "encryptAndTagPlainField:withPreKey:returningFieldTag:error:", v31, v75, a4, a7);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "fieldName");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = v33;
        objc_msgSend(v32, "dataRepresentationWithError:", a7);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = v34;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "addEntriesFromDictionary:", v35);

      }
      objc_msgSend(a1, "wallpaper");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "lowResWallpaperExists");

      if (v37)
      {
        v38 = objc_alloc(MEMORY[0x24BE51260]);
        objc_msgSend(a1, "wallpaper");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "lowResWallpaperData");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)objc_msgSend(v38, "initWithFieldName:plainData:", CFSTR("lrwd"), v40);

        objc_msgSend(MEMORY[0x24BE51258], "encryptAndTagPlainField:withPreKey:returningFieldTag:error:", v41, v75, a5, a7);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "fieldName");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v43;
        objc_msgSend(v42, "dataRepresentationWithError:", a7);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = v44;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "addEntriesFromDictionary:", v45);

      }
      objc_msgSend(a1, "wallpaper");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "metadata");
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (v47)
      {
        objc_msgSend(a1, "wallpaper");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "publicDictionaryRepresentation");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        JWEncodeDictionary();
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51260]), "initWithFieldName:plainData:", CFSTR("wm"), v50);
        objc_msgSend(MEMORY[0x24BE51258], "encryptAndTagPlainField:withPreKey:returningFieldTag:error:", v51, v75, a6, a7);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "fieldName");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = v53;
        objc_msgSend(v52, "dataRepresentationWithError:", a7);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = v54;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "addEntriesFromDictionary:", v55);

      }
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("ad"), 0);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "stringRepresentation");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_CKRecordFromDictionary:recordName:assetFieldNames:error:", v74, v57, v56, a7);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      if (v58)
      {
        objc_msgSend(v58, "recordID");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "recordName");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "stringByAppendingString:", CFSTR("-wp"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1, "_wallpaperRecordFromDictionary:owningRecord:recordName:error:", v70, v58, v61, a7);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v58, CFSTR("profileRecord"));
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v62, CFSTR("wallpaperRecord"));

      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v65 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
          {
            if (a7)
              v66 = *a7;
            else
              v66 = 0;
            *(_DWORD *)buf = 138412802;
            v84 = v66;
            v85 = 2112;
            v86 = v74;
            v87 = 2112;
            v88 = a1;
            _os_log_impl(&dword_22D97D000, v65, OS_LOG_TYPE_INFO, "Failed to create record from cipherFields {error: %@, cipherFields: %@, nickname: %@}", buf, 0x20u);
          }

        }
        v23 = 0;
      }

    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
        {
          if (a7)
            v64 = *a7;
          else
            v64 = 0;
          *(_DWORD *)buf = 138412802;
          v84 = v64;
          v85 = 2112;
          v86 = a1;
          v87 = 2112;
          v88 = v75;
          _os_log_impl(&dword_22D97D000, v63, OS_LOG_TYPE_INFO, "Failed to encrypt nickname {error: %@, nickname: %@, preKey: %@}", buf, 0x20u);
        }

      }
      v23 = 0;
    }

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v84 = a1;
        _os_log_impl(&dword_22D97D000, v21, OS_LOG_TYPE_INFO, "Failed to create nicknameData -- Failed to create nickname public record {nickname: %@}", buf, 0xCu);
      }

    }
    if (!a7)
    {
      v23 = 0;
      goto LABEL_57;
    }
    v22 = (void *)MEMORY[0x24BDD1540];
    v89 = *MEMORY[0x24BDD0BA0];
    v90[0] = CFSTR("Missing nickname");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v90, &v89, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x24BE50FA0], -1000, v13);
    v23 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_57:
  return v23;
}

uint64_t sub_22D991EB0(void *a1, uint64_t a2, void *a3, void **a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
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
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v43;
  void *v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v45 = a3;
  objc_msgSend(a1, "avatar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageFilePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x24BE51248];
    objc_msgSend(v45, "recordName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_assetTargetURLForRecordName:fieldName:error:", v9, CFSTR("ad"), a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          if (a4)
            v19 = *a4;
          else
            v19 = 0;
          *(_DWORD *)buf = 138412546;
          v47 = v19;
          v48 = 2112;
          v49 = v45;
          _os_log_impl(&dword_22D97D000, v18, OS_LOG_TYPE_INFO, "Failed to get target url for avatar image while updating nickname {error: %@, recordID: %@}", buf, 0x16u);
        }

      }
      goto LABEL_45;
    }
    objc_msgSend(a1, "avatar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageFilePath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(a1, "_moveFile:newURL:error:", v14, v10, a4);
    if ((v15 & 1) != 0)
    {
      objc_msgSend(v10, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51250]), "initWithImageName:imageFilePath:contentIsSensitive:", v12, v16, objc_msgSend(v11, "contentIsSensitive"));
      objc_msgSend(a1, "setAvatar:", v17);

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v47 = v14;
        v48 = 2112;
        v49 = v10;
        v50 = 2112;
        v51 = v45;
        _os_log_impl(&dword_22D97D000, v20, OS_LOG_TYPE_INFO, "Failed to move image from %@ to %@ for recordID: %@", buf, 0x20u);
      }

    }
    if (!v15)
    {
LABEL_45:
      v41 = 0;
      goto LABEL_46;
    }
  }
  objc_msgSend(a1, "wallpaper");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = (void *)MEMORY[0x24BE51248];
    objc_msgSend(v45, "recordName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_assetTargetURLForRecordName:fieldName:error:", v23, CFSTR("wd"), a4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)MEMORY[0x24BE51248];
    objc_msgSend(v45, "recordName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_assetTargetURLForRecordName:fieldName:error:", v26, CFSTR("lrwd"), a4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24 || !v27)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          if (a4)
            v34 = *a4;
          else
            v34 = 0;
          *(_DWORD *)buf = 138412546;
          v47 = v34;
          v48 = 2112;
          v49 = v45;
          _os_log_impl(&dword_22D97D000, v33, OS_LOG_TYPE_INFO, "Failed to get target url for wallpaper while updating nickname {error: %@, recordID: %@}", buf, 0x16u);
        }

      }
      goto LABEL_45;
    }
    objc_msgSend(a1, "wallpaper");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "fileName");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "filePath");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "lowResFileName");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "lowResFilePath");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(a1, "_moveFile:newURL:error:", v31, v24, a4) & 1) == 0)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            v47 = v31;
            v48 = 2112;
            v49 = v24;
            v50 = 2112;
            v51 = v45;
            _os_log_impl(&dword_22D97D000, v32, OS_LOG_TYPE_INFO, "Failed to move wallpaper from %@ to %@ for recordID: %@", buf, 0x20u);
          }
LABEL_33:

          goto LABEL_34;
        }
        goto LABEL_34;
      }
    }
    else
    {
      v31 = v24;
      v24 = 0;
    }

    if (v30)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(a1, "_moveFile:newURL:error:", v31, v27, a4) & 1) == 0)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            v47 = v31;
            v48 = 2112;
            v49 = v27;
            v50 = 2112;
            v51 = v45;
            _os_log_impl(&dword_22D97D000, v32, OS_LOG_TYPE_INFO, "Failed to move low res wallpaper from %@ to %@ for recordID: %@", buf, 0x20u);
          }
          goto LABEL_33;
        }
LABEL_34:

        goto LABEL_45;
      }
    }
    else
    {
      v31 = v27;
      v27 = 0;
    }

    objc_msgSend(v24, "path");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "path");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_alloc(MEMORY[0x24BE51320]);
    objc_msgSend(v28, "metadata");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v37, "initWithFileName:filePath:lowResFileName:lowResFilePath:metadata:contentIsSensitive:", v43, v35, v44, v36, v38, objc_msgSend(v28, "contentIsSensitive"));
    objc_msgSend(a1, "setWallpaper:", v39);

  }
  objc_msgSend(v45, "recordName");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setRecordID:", v40);

  v41 = 1;
LABEL_46:

  return v41;
}

uint64_t sub_22D9925A0(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t *a5)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(MEMORY[0x24BDD1580]);
  objc_msgSend(v8, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "fileExistsAtPath:", v10);

  if (v11)
  {
    objc_msgSend(v8, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeItemAtPath:error:", v12, a5);

  }
  v13 = objc_msgSend(v9, "moveItemAtURL:toURL:error:", v7, v8, a5);
  if ((v13 & 1) == 0 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = *a5;
      v17 = 138412802;
      v18 = v7;
      v19 = 2112;
      v20 = v8;
      v21 = 2112;
      v22 = v15;
      _os_log_impl(&dword_22D97D000, v14, OS_LOG_TYPE_INFO, "Failed to move item %@ to %@ with error %@", (uint8_t *)&v17, 0x20u);
    }

  }
  return v13;
}

uint64_t sub_22D99272C(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  int v15;
  id v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BDD1580]);
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

  if (v8)
  {
    objc_msgSend(v5, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "removeItemAtPath:error:", v9, a4);

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = *a4;
        v15 = 138412802;
        v16 = v5;
        v17 = 1024;
        v18 = v10;
        v19 = 2112;
        v20 = v12;
        _os_log_impl(&dword_22D97D000, v11, OS_LOG_TYPE_INFO, "Attempted to remove item at path: %@, did succeed: %d, error: %@", (uint8_t *)&v15, 0x1Cu);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v15 = 138412290;
        v16 = v5;
        _os_log_impl(&dword_22D97D000, v13, OS_LOG_TYPE_INFO, "File %@ does not exist, can't remove.", (uint8_t *)&v15, 0xCu);
      }

    }
    v10 = 0;
  }

  return v10;
}

id sub_22D992910(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void **a6)
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v37;
  void *v38;
  id obj;
  id v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  uint64_t v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v40 = a5;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91D8]), "initWithRecordType:", CFSTR("imsgNicknamePublicv2"));
  v38 = v10;
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91E8]), "initWithRecordName:", v10);
  objc_msgSend(v11, "setRecordID:");
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v41 = v9;
  objc_msgSend(v9, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v43;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v43 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v41, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v40, "containsObject:", v15))
        {
          objc_msgSend((id)objc_opt_class(), "_assetTargetURLForRecordName:fieldName:error:", v38, v15, a6);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = IMOSLoggingEnabled();
          if (!v17)
          {
            if (v18)
            {
              OSLogHandleForIMFoundationCategory();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                if (a6)
                  v30 = *a6;
                else
                  v30 = 0;
                *(_DWORD *)buf = 138412802;
                v47 = v30;
                v48 = 2112;
                v49 = v38;
                v50 = 2112;
                v51 = (uint64_t)v15;
                _os_log_impl(&dword_22D97D000, v29, OS_LOG_TYPE_INFO, "Failed to create target URL for nickname asset {error: %@, recordName: %@, fieldName: %@}", buf, 0x20u);
              }

            }
            goto LABEL_44;
          }
          if (v18)
          {
            OSLogHandleForIMFoundationCategory();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v47 = v17;
              _os_log_impl(&dword_22D97D000, v19, OS_LOG_TYPE_INFO, "Writing nickname asset {targetURL: %@}", buf, 0xCu);
            }

          }
          if (objc_msgSend(v15, "isEqualToString:", CFSTR("ad")))
          {
            v20 = objc_alloc(MEMORY[0x24BE51250]);
            objc_msgSend(v17, "path");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = (void *)objc_msgSend(v20, "initWithImageName:imageData:imageFilePath:contentIsSensitive:error:", 0, v16, v21, 0, a6);

            if (!v22 || *a6)
            {
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v31 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
                {
                  if (a6)
                    v32 = *a6;
                  else
                    v32 = 0;
                  v33 = objc_msgSend(v16, "length");
                  *(_DWORD *)buf = 138412802;
                  v47 = v32;
                  v48 = 2112;
                  v49 = v17;
                  v50 = 2048;
                  v51 = v33;
                  _os_log_impl(&dword_22D97D000, v31, OS_LOG_TYPE_INFO, "Failed to write nickname asset {error: %@, targetURL: %@, data.length: %ld}", buf, 0x20u);
                }

              }
LABEL_44:

              if ((IMOSLoggingEnabled() & 1) != 0)
              {
                OSLogHandleForIMFoundationCategory();
                v34 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                {
                  if (a6)
                    v35 = *a6;
                  else
                    v35 = 0;
                  *(_DWORD *)buf = 138412546;
                  v47 = v35;
                  v48 = 2112;
                  v49 = v41;
                  _os_log_impl(&dword_22D97D000, v34, OS_LOG_TYPE_INFO, "Failed to create record from dictionary {error: %@, dictionary: %@}", buf, 0x16u);
                }

              }
              v28 = 0;
              goto LABEL_52;
            }

          }
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v47 = v17;
              _os_log_impl(&dword_22D97D000, v23, OS_LOG_TYPE_INFO, "Writing nickname asset {targetURL: %@}", buf, 0xCu);
            }

          }
          v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9010]), "initWithFileURL:", v17);
          objc_msgSend(v24, "setItemTypeHint:", CFSTR("fxd"));
          objc_msgSend(v11, "setObject:forKey:", v24, v15);

        }
        else
        {
          objc_msgSend(v11, "setObject:forKey:", v16, v15);
        }

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
      if (v12)
        continue;
      break;
    }
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v11, "allKeys");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "allKeys");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v47 = v26;
      v48 = 2112;
      v49 = v27;
      v50 = 2112;
      v51 = (uint64_t)v40;
      _os_log_impl(&dword_22D97D000, v25, OS_LOG_TYPE_INFO, "Created record from dictionary {record.allKeys: %@, dictionary.allKeys: %@, assetFieldNames: %@}", buf, 0x20u);

    }
  }
  v28 = v11;
LABEL_52:

  return v28;
}

id sub_22D992F5C(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t *a6)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint8_t buf[4];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91D8]), "initWithRecordType:", CFSTR("poster"));
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91E8]), "initWithRecordName:", v11);
  objc_msgSend(v12, "setRecordID:", v13);

  v27 = v10;
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9218]), "initWithRecord:action:", v10, 1);
  objc_msgSend(v12, "setObject:forKeyedSubscript:");
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("wd"));
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("lrwd"));
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("wm"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE51248], "_assetTargetURLForRecordName:fieldName:error:", v11, CFSTR("wm"), a6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE51248], "_assetTargetURLForRecordName:fieldName:error:", v11, CFSTR("lrwd"), a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v30, CFSTR("wm"));
  if (v15 | v14)
  {
    v17 = objc_alloc(MEMORY[0x24BE51320]);
    objc_msgSend(v29, "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "path");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v26) = 0;
    v20 = (void *)objc_msgSend(v17, "initWithFileName:filePath:data:lowResFileName:lowResFilePath:lowResData:metadata:contentIsSensitive:error:", &stru_24F97B2D8, v18, v14, &stru_24F97B2D8, v19, v15, 0, v26, a6);

    if ((!v20 || *a6) && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        if (a6)
          v22 = *a6;
        else
          v22 = 0;
        *(_DWORD *)buf = 138412290;
        v32 = v22;
        _os_log_impl(&dword_22D97D000, v21, OS_LOG_TYPE_INFO, "Failed to write low res wallpaper asset {error: %@}", buf, 0xCu);
      }

    }
    if (v15)
    {
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9010]), "initWithFileURL:", v16);
      objc_msgSend(v23, "setItemTypeHint:", CFSTR("fxd"));
      objc_msgSend(v12, "setObject:forKey:", v23, CFSTR("lrwd"));

    }
    if (v14)
    {
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB9010]), "initWithFileURL:", v29);
      objc_msgSend(v24, "setItemTypeHint:", CFSTR("fxd"));
      objc_msgSend(v12, "setObject:forKey:", v24, CFSTR("wd"));

    }
  }

  return v12;
}

id sub_22D9932C4(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t *a5)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend((id)*MEMORY[0x24BE50F98], "stringByExpandingTildeInPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fileURLWithPath:", v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "fileExistsAtPath:", v13);

  if ((v14 & 1) != 0
    || (objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v11, 1, 0, a5),
        v15,
        (v16 & 1) != 0))
  {
    objc_msgSend(v7, "stringByAppendingFormat:", CFSTR("-%@"), v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("_"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "URLByAppendingPathComponent:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v19;
    v20 = v11;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        if (a5)
          v22 = *a5;
        else
          v22 = 0;
        *(_DWORD *)buf = 138412546;
        v25 = v22;
        v26 = 2112;
        v27 = v11;
        _os_log_impl(&dword_22D97D000, v21, OS_LOG_TYPE_INFO, "Failed to create nickname assets directory {error: %@, url: %@}", buf, 0x16u);
      }

    }
    v20 = 0;
  }

  return v20;
}

uint64_t sub_22D9934F8(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  char v4;
  char v5;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_opt_respondsToSelector();
  else
    v4 = 0;
  v5 = v4 & objc_opt_respondsToSelector();

  return v5 & 1;
}

uint64_t sub_22D993560(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  int v4;
  int v5;

  v3 = a3;
  v4 = objc_opt_respondsToSelector();
  v5 = objc_opt_respondsToSelector();

  return v4 & v5 & 1;
}

id sub_22D9935BC()
{
  if (qword_255DA8E30 != -1)
    dispatch_once(&qword_255DA8E30, &unk_24F979EC0);
  return (id)qword_255DA8E28;
}

uint64_t sub_22D9935FC()
{
  uint64_t result;

  result = MEMORY[0x22E31D3AC](CFSTR("NSMorphologyCustomPronoun"), CFSTR("Foundation"));
  qword_255DA8E28 = result;
  return result;
}

const __CFString *sub_22D993628(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 == 1)
    return CFSTR("en");
  else
    return 0;
}

id sub_22D99363C()
{
  _QWORD v1[6];

  v1[5] = *MEMORY[0x24BDAC8D0];
  v1[0] = CFSTR("n");
  v1[1] = CFSTR("am");
  v1[2] = CFSTR("ad");
  v1[3] = CFSTR("wm");
  v1[4] = CFSTR("lrwd");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v1, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

id sub_22D9936CC()
{
  _QWORD v1[7];

  v1[6] = *MEMORY[0x24BDAC8D0];
  v1[0] = CFSTR("n");
  v1[1] = CFSTR("am");
  v1[2] = CFSTR("ad");
  v1[3] = CFSTR("wm");
  v1[4] = CFSTR("lrwd");
  v1[5] = CFSTR("wd");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v1, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

id sub_22D993764()
{
  _QWORD v1[4];

  v1[3] = *MEMORY[0x24BDAC8D0];
  v1[0] = CFSTR("n");
  v1[1] = CFSTR("am");
  v1[2] = CFSTR("ad");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v1, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

Class sub_22D9937E0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!qword_255DA8E40)
  {
    qword_255DA8E40 = _sl_dlopen();
    if (!qword_255DA8E40)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("PRSPosterArchiver");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)sub_22D995184();
    free(v3);
  }
  qword_255DA8E38 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_22D9938D4(uint64_t a1)
{
  Class result;
  void *v3;

  if (!qword_255DA8E50)
  {
    qword_255DA8E50 = _sl_dlopen();
    if (!qword_255DA8E50)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("PFPosterConfiguration");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)sub_22D9951A8();
    free(v3);
  }
  qword_255DA8E48 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22D9939E4(int a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  void (**v13)(id, id, uint64_t, const __CFURL *, id, uint64_t);
  id v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  const __CFURL *v22;
  __CFReadStream *v23;
  __CFWriteStream *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  _BOOL4 v32;
  int v33;
  NSObject *v34;
  __CFRunLoop *Main;
  const __CFString *v36;
  _BOOL4 v37;
  int v38;
  NSObject *v39;
  __CFRunLoop *v40;
  NSObject *v41;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  CFStreamError Error;
  CFStreamError v47;
  NSObject *v48;
  NSObject *v49;
  __CFRunLoop *v50;
  NSObject *v51;
  __CFRunLoop *v52;
  NSObject *v53;
  const __CFString *v54;
  NSObject *v55;
  const __CFString *v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  uint8_t buf[4];
  CFIndex domain;
  __int16 v66;
  id v67;
  __int16 v68;
  const __CFURL *v69;
  __int16 v70;
  uint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v12 = a3;
  v63 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v14;
  if (!v12 && (a1 & 1) == 0)
  {
    if (v14)
      (*((void (**)(id, id, _QWORD, _QWORD, uint64_t))v14 + 2))(v14, v11, 0, 0, 301);
    goto LABEL_141;
  }
  if (a1)
  {
    v62 = objc_alloc_init(MEMORY[0x24BDBCEC8]);

  }
  else
  {
    v62 = 0;
  }
  objc_msgSend(v11, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pathExtension");
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v63;
  v18 = (uint64_t)v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_randomSimilarFilePathAsPath:", v20);
    v18 = objc_claimAutoreleasedReturnValue();

  }
  v60 = (void *)v18;
  v21 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:isDirectory:", v18, 0);
  v22 = (const __CFURL *)v21;
  if (v11)
  {
    v23 = CFReadStreamCreateWithFile(0, (CFURLRef)v11);
    if (v22)
      goto LABEL_12;
LABEL_15:
    v24 = 0;
    if (!v12)
      goto LABEL_20;
    goto LABEL_16;
  }
  v23 = 0;
  if (!v21)
    goto LABEL_15;
LABEL_12:
  v24 = CFWriteStreamCreateWithFile(0, v22);
  if (!v12)
    goto LABEL_20;
LABEL_16:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      domain = (CFIndex)v12;
      _os_log_impl(&dword_22D97D000, v25, OS_LOG_TYPE_INFO, "       inputKey: %@", buf, 0xCu);
    }

  }
LABEL_20:
  if (v17 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      domain = (CFIndex)v17;
      _os_log_impl(&dword_22D97D000, v26, OS_LOG_TYPE_INFO, " outputFileName: %@", buf, 0xCu);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      domain = (CFIndex)v11;
      _os_log_impl(&dword_22D97D000, v27, OS_LOG_TYPE_INFO, "       inputURL: %@", buf, 0xCu);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      domain = (CFIndex)v61;
      _os_log_impl(&dword_22D97D000, v28, OS_LOG_TYPE_INFO, "  pathExtension: %@", buf, 0xCu);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      domain = (CFIndex)v22;
      _os_log_impl(&dword_22D97D000, v29, OS_LOG_TYPE_INFO, "      outputURL: %@", buf, 0xCu);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      domain = (CFIndex)v23;
      _os_log_impl(&dword_22D97D000, v30, OS_LOG_TYPE_INFO, "     readStream: %@", buf, 0xCu);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      domain = (CFIndex)v24;
      _os_log_impl(&dword_22D97D000, v31, OS_LOG_TYPE_INFO, "    writeStream: %@", buf, 0xCu);
    }

  }
  if (!v23)
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_70;
    OSLogHandleForIMFoundationCategory();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      domain = (CFIndex)v11;
      _os_log_impl(&dword_22D97D000, v41, OS_LOG_TYPE_INFO, "Could not create read stream for input file: %@", buf, 0xCu);
    }
    goto LABEL_69;
  }
  v32 = CFReadStreamOpen(v23) == 0;
  v33 = IMOSLoggingEnabled();
  if (v32)
  {
    if (!v33)
      goto LABEL_70;
    OSLogHandleForIMFoundationCategory();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      domain = (CFIndex)v11;
      _os_log_impl(&dword_22D97D000, v41, OS_LOG_TYPE_INFO, "Could not open read stream for input file: %@", buf, 0xCu);
    }
LABEL_69:

LABEL_70:
    if (v24)
    {
      v59 = 0;
      v42 = 0;
      v36 = (const __CFString *)*MEMORY[0x24BDBD598];
      goto LABEL_106;
    }
    goto LABEL_108;
  }
  if (v33)
  {
    OSLogHandleForIMFoundationCategory();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      domain = (CFIndex)v23;
      _os_log_impl(&dword_22D97D000, v34, OS_LOG_TYPE_INFO, "Successfully opened read stream: %@", buf, 0xCu);
    }

  }
  Main = CFRunLoopGetMain();
  v36 = (const __CFString *)*MEMORY[0x24BDBD598];
  CFReadStreamScheduleWithRunLoop(v23, Main, (CFRunLoopMode)*MEMORY[0x24BDBD598]);
  if (v24)
  {
    v37 = CFWriteStreamOpen(v24) == 0;
    v38 = IMOSLoggingEnabled();
    if (v37)
    {
      if (v38)
      {
        OSLogHandleForIMFoundationCategory();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          domain = (CFIndex)v22;
          _os_log_impl(&dword_22D97D000, v43, OS_LOG_TYPE_INFO, "Could not open write stream for output file: %@", buf, 0xCu);
        }

      }
      v59 = 0;
      goto LABEL_104;
    }
    if (v38)
    {
      OSLogHandleForIMFoundationCategory();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        domain = (CFIndex)v24;
        _os_log_impl(&dword_22D97D000, v39, OS_LOG_TYPE_INFO, "Successfully opened write stream: %@", buf, 0xCu);
      }

    }
    v40 = CFRunLoopGetMain();
    CFWriteStreamScheduleWithRunLoop(v24, v40, v36);
    if ((a1 & 1) != 0)
    {
      if (qword_2540D9390 != -1)
        dispatch_once(&qword_2540D9390, &unk_24F979EE0);
      if (off_2540D9388)
        v59 = off_2540D9388(v23, v24, v62);
      else
        v59 = 1;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          domain = v59;
          _os_log_impl(&dword_22D97D000, v44, OS_LOG_TYPE_INFO, "SecProtectStream result: %ld", buf, 0xCu);
        }

      }
      if (!IMOSLoggingEnabled())
        goto LABEL_95;
      OSLogHandleForIMFoundationCategory();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        domain = (CFIndex)v62;
        _os_log_impl(&dword_22D97D000, v45, OS_LOG_TYPE_INFO, "       outputKey: %@", buf, 0xCu);
      }
    }
    else
    {
      if (qword_2540D9398 != -1)
        dispatch_once(&qword_2540D9398, &unk_24F97A718);
      if (off_2540D93A0)
        v59 = off_2540D93A0(v23, v24, v12);
      else
        v59 = 1;
      if (!IMOSLoggingEnabled())
        goto LABEL_95;
      OSLogHandleForIMFoundationCategory();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        domain = v59;
        _os_log_impl(&dword_22D97D000, v45, OS_LOG_TYPE_INFO, "SecExposeStream result: %ld", buf, 0xCu);
      }
    }

LABEL_95:
    if (!v59)
    {
      v59 = 0;
      v42 = 1;
LABEL_106:
      CFWriteStreamSetClient(v24, 0, 0, 0);
      CFWriteStreamClose(v24);
      v50 = CFRunLoopGetMain();
      CFWriteStreamUnscheduleFromRunLoop(v24, v50, v36);
      if (!v23)
        goto LABEL_114;
      goto LABEL_113;
    }
    Error = CFReadStreamGetError(v23);
    v47 = CFWriteStreamGetError(v24);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        domain = Error.domain;
        v66 = 2048;
        v67 = (id)Error.error;
        _os_log_impl(&dword_22D97D000, v48, OS_LOG_TYPE_INFO, "  read error: [%ld:%ld]", buf, 0x16u);
      }

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        domain = v47.domain;
        v66 = 2048;
        v67 = (id)v47.error;
        _os_log_impl(&dword_22D97D000, v49, OS_LOG_TYPE_INFO, " write error: [%ld:%ld]", buf, 0x16u);
      }

    }
LABEL_104:
    v42 = 0;
    goto LABEL_106;
  }
LABEL_108:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      domain = (CFIndex)v22;
      _os_log_impl(&dword_22D97D000, v51, OS_LOG_TYPE_INFO, "Could not create write stream for output file: %@", buf, 0xCu);
    }

  }
  v59 = 0;
  v42 = 0;
  if (!v23)
    goto LABEL_114;
LABEL_113:
  CFReadStreamSetClient(v23, 0, 0, 0);
  CFReadStreamClose(v23);
  v52 = CFRunLoopGetMain();
  CFReadStreamUnscheduleFromRunLoop(v23, v52, (CFRunLoopMode)*MEMORY[0x24BDBD598]);
LABEL_114:
  im_dispatch_after();
  if ((_DWORD)v42)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        v54 = CFSTR("decrypting");
        *(_DWORD *)buf = 138412802;
        if (a1)
          v54 = CFSTR("encrypting");
        domain = (CFIndex)v54;
        v66 = 2112;
        v67 = v11;
        v68 = 2112;
        v69 = v22;
        _os_log_impl(&dword_22D97D000, v53, OS_LOG_TYPE_INFO, "Succeeded %@ input URL: %@    output URL: %@", buf, 0x20u);
      }

    }
  }
  else
  {

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMEventCategory();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        v56 = CFSTR("decrypting");
        *(_DWORD *)buf = 138413058;
        if (a1)
          v56 = CFSTR("encrypting");
        domain = (CFIndex)v56;
        v66 = 2112;
        v67 = v11;
        v68 = 2112;
        v69 = 0;
        v70 = 2048;
        v71 = v59;
        _os_log_impl(&dword_22D97D000, v55, OS_LOG_TYPE_INFO, "** Failed %@ input URL: %@    output URL: %@     result: %ld", buf, 0x2Au);
      }

    }
    v62 = 0;
    v22 = 0;
  }
  if (v13 && a1)
  {
    if ((_DWORD)v42)
      v57 = 0;
    else
      v57 = 300;
    v13[2](v13, v11, v42, v22, v62, v57);
  }
  else if (v15 && (a1 & 1) == 0)
  {
    if ((_DWORD)v42)
      v58 = 0;
    else
      v58 = 301;
    ((void (**)(_QWORD, id, uint64_t, const __CFURL *, uint64_t))v15)[2](v15, v11, v42, v22, v58);
  }

LABEL_141:
}

void *sub_22D99480C()
{
  void *result;

  result = (void *)MEMORY[0x22E31D3B8]("SecProtectStream", CFSTR("MessageProtection"));
  off_2540D9388 = result;
  return result;
}

void *sub_22D994838()
{
  void *result;

  result = (void *)MEMORY[0x22E31D3B8]("SecExposeStream", CFSTR("MessageProtection"));
  off_2540D93A0 = result;
  return result;
}

void sub_22D994864(uint64_t a1)
{
  const void *v2;
  const void *v3;

  v2 = *(const void **)(a1 + 32);
  if (v2)
    CFRelease(v2);
  v3 = *(const void **)(a1 + 40);
  if (v3)
    CFRelease(v3);
}

uint64_t IMOptOutOfOptimizedMadridAttachmentDownloadPath()
{
  uint64_t v0;
  void *v1;
  void *v2;
  char v3;
  void *v4;
  char v5;

  v0 = 1;
  objc_msgSend(MEMORY[0x24BE4FCB0], "sharedInstanceForBagType:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("should-disallow-authget"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE508A8], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isInternalInstall"))
    {
      v5 = IMGetCachedDomainBoolForKey();

      if ((v5 & 1) != 0)
        return 1;
    }
    else
    {

    }
    return 0;
  }
  return v0;
}

uint64_t IMSetOptOutOfOptimizedMadridAttachmentDownloadPath()
{
  IMSetDomainBoolForKey();
  return IMSetDomainBoolForKey();
}

uint64_t IMOptOutOfOptimizedMadridAttachmentUploadPath()
{
  uint64_t v0;
  void *v1;
  void *v2;
  char v3;
  void *v4;
  char v5;

  v0 = 1;
  objc_msgSend(MEMORY[0x24BE4FCB0], "sharedInstanceForBagType:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("should-disallow-authput"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE508A8], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isInternalInstall"))
    {
      v5 = IMGetCachedDomainBoolForKey();

      if ((v5 & 1) != 0)
        return 1;
    }
    else
    {

    }
    return 0;
  }
  return v0;
}

uint64_t IMSetOptOutOfOptimizedMadridAttachmentUploadPath()
{
  IMSetDomainBoolForKey();
  return IMSetDomainBoolForKey();
}

uint64_t IMTransferRequestIsForMessages(void *a1, void *a2)
{
  id v3;
  id v4;
  int v5;
  void *v6;
  void *v7;
  unsigned int v8;
  NSObject *v9;
  const __CFString *v10;
  const __CFString *v11;
  int v13;
  const __CFString *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v5 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.madrid"));
  IMSafeTemporaryDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "hasPrefix:", v7);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = CFSTR("NO");
      if (v5)
        v11 = CFSTR("YES");
      else
        v11 = CFSTR("NO");
      if (v8)
        v10 = CFSTR("YES");
      v13 = 138412546;
      v14 = v11;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_22D97D000, v9, OS_LOG_TYPE_INFO, "checking if transfer request is for Messages, topicIsMadrid: %@, receivePathPrefixIsMessages: %@", (uint8_t *)&v13, 0x16u);
    }

  }
  return v5 & v8;
}

void sub_22D994C00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_22D9801A0();
  sub_22D980190(&dword_22D97D000, MEMORY[0x24BDACB70], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
  sub_22D9801B4();
}

void sub_22D994C7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_22D9801A0();
  sub_22D980190(&dword_22D97D000, MEMORY[0x24BDACB70], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
  sub_22D9801B4();
}

void sub_22D994CF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_22D9801A0();
  sub_22D980190(&dword_22D97D000, MEMORY[0x24BDACB70], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
  sub_22D9801B4();
}

void sub_22D994D74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_22D9801A0();
  sub_22D980190(&dword_22D97D000, MEMORY[0x24BDACB70], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
  sub_22D9801B4();
}

void sub_22D994DF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_22D9801A0();
  sub_22D980190(&dword_22D97D000, MEMORY[0x24BDACB70], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
  sub_22D9801B4();
}

void sub_22D994E6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_22D9801A0();
  sub_22D980190(&dword_22D97D000, MEMORY[0x24BDACB70], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
  sub_22D9801B4();
}

void sub_22D994EE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_22D9801A0();
  sub_22D980190(&dword_22D97D000, MEMORY[0x24BDACB70], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
  sub_22D9801B4();
}

void sub_22D994F64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_22D9801A0();
  sub_22D980190(&dword_22D97D000, MEMORY[0x24BDACB70], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
  sub_22D9801B4();
}

void sub_22D994FE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_22D980190(&dword_22D97D000, MEMORY[0x24BDACB70], a3, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", a5, a6, a7, a8, 2u);
}

void sub_22D99506C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_22D980190(&dword_22D97D000, MEMORY[0x24BDACB70], a3, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", a5, a6, a7, a8, 2u);
}

void sub_22D9950F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_22D980190(&dword_22D97D000, MEMORY[0x24BDACB70], a3, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", a5, a6, a7, a8, 2u);
}

uint64_t sub_22D995184()
{
  uint64_t v0;

  v0 = abort_report_np();
  return sub_22D9951A8(v0);
}

uint64_t sub_22D9951A8()
{
  uint64_t v0;

  v0 = abort_report_np();
  return sub_22D9951CC(v0);
}

void sub_22D9951CC(void *a1)
{

  objc_end_catch();
}

void sub_22D9951EC(void *a1)
{

  objc_end_catch();
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
  MEMORY[0x24BDBC218](stream);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x24BDBC230](alloc, fileURL);
}

CFStreamError CFReadStreamGetError(CFReadStreamRef stream)
{
  CFIndex v1;
  uint64_t v2;
  CFStreamError result;

  v1 = MEMORY[0x24BDBC238](stream);
  result.error = v2;
  result.domain = v1;
  return result;
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x24BDBC258](stream);
}

void CFReadStreamScheduleWithRunLoop(CFReadStreamRef stream, CFRunLoopRef runLoop, CFRunLoopMode runLoopMode)
{
  MEMORY[0x24BDBC268](stream, runLoop, runLoopMode);
}

Boolean CFReadStreamSetClient(CFReadStreamRef stream, CFOptionFlags streamEvents, CFReadStreamClientCallBack clientCB, CFStreamClientContext *clientContext)
{
  return MEMORY[0x24BDBC270](stream, streamEvents, clientCB, clientContext);
}

void CFReadStreamUnscheduleFromRunLoop(CFReadStreamRef stream, CFRunLoopRef runLoop, CFRunLoopMode runLoopMode)
{
  MEMORY[0x24BDBC290](stream, runLoop, runLoopMode);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC300]();
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
  MEMORY[0x24BDBC968](stream);
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFWriteStreamRef)MEMORY[0x24BDBC988](alloc, fileURL);
}

CFStreamError CFWriteStreamGetError(CFWriteStreamRef stream)
{
  CFIndex v1;
  uint64_t v2;
  CFStreamError result;

  v1 = MEMORY[0x24BDBC990](stream);
  result.error = v2;
  result.domain = v1;
  return result;
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x24BDBC9A8](stream);
}

void CFWriteStreamScheduleWithRunLoop(CFWriteStreamRef stream, CFRunLoopRef runLoop, CFRunLoopMode runLoopMode)
{
  MEMORY[0x24BDBC9B0](stream, runLoop, runLoopMode);
}

Boolean CFWriteStreamSetClient(CFWriteStreamRef stream, CFOptionFlags streamEvents, CFWriteStreamClientCallBack clientCB, CFStreamClientContext *clientContext)
{
  return MEMORY[0x24BDBC9B8](stream, streamEvents, clientCB, clientContext);
}

void CFWriteStreamUnscheduleFromRunLoop(CFWriteStreamRef stream, CFRunLoopRef runLoop, CFRunLoopMode runLoopMode)
{
  MEMORY[0x24BDBC9D8](stream, runLoop, runLoopMode);
}

uint64_t IMCreatePNGImageDataFromCGImageRef()
{
  return MEMORY[0x24BE50CF8]();
}

uint64_t IMGetCachedDomainBoolForKey()
{
  return MEMORY[0x24BE506A8]();
}

uint64_t IMGetiMessageSettings()
{
  return MEMORY[0x24BE50710]();
}

uint64_t IMGreenTeaAttachmentReadLoggingFormat()
{
  return MEMORY[0x24BE50E18]();
}

uint64_t IMGreenTeaAttachmentTransmitLoggingFormat()
{
  return MEMORY[0x24BE50E20]();
}

uint64_t IMOSLoggingEnabled()
{
  return MEMORY[0x24BE50790]();
}

uint64_t IMSafeTemporaryDirectory()
{
  return MEMORY[0x24BE50FE8]();
}

uint64_t IMSetDomainBoolForKey()
{
  return MEMORY[0x24BE507C8]();
}

uint64_t IMSetEmbeddedTempDirectory()
{
  return MEMORY[0x24BE51020]();
}

uint64_t IMSharedHelperNickNameEnabled()
{
  return MEMORY[0x24BE51048]();
}

uint64_t IMSingleObjectArray()
{
  return MEMORY[0x24BE507F0]();
}

uint64_t IMWeakLinkClass()
{
  return MEMORY[0x24BE50840]();
}

uint64_t IMWeakLinkSymbol()
{
  return MEMORY[0x24BE50848]();
}

uint64_t JWDecodeDictionary()
{
  return MEMORY[0x24BE50870]();
}

uint64_t JWEncodeDictionary()
{
  return MEMORY[0x24BE50878]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

uint64_t OSLogHandleForIMEventCategory()
{
  return MEMORY[0x24BE50900]();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return MEMORY[0x24BE50908]();
}

uint64_t StringGUID()
{
  return MEMORY[0x24BE50918]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _FZErrorTypeFromResponseCodeAndError()
{
  return MEMORY[0x24BE30398]();
}

uint64_t _IMAlwaysLog()
{
  return MEMORY[0x24BE50920]();
}

uint64_t _IMWillLog()
{
  return MEMORY[0x24BE509C0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x24BDACB00](dso, description, activity, *(_QWORD *)&flags);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

uint64_t failReasonStringForMMCSError()
{
  return MEMORY[0x24BE634C0]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t im_assert_primary_queue()
{
  return MEMORY[0x24BE509C8]();
}

uint64_t im_dispatch_after()
{
  return MEMORY[0x24BE509D0]();
}

uint64_t im_dispatch_after_primary_queue()
{
  return MEMORY[0x24BE509D8]();
}

uint64_t im_primary_queue()
{
  return MEMORY[0x24BE509E0]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A0](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A8](state);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t parseMMCSError()
{
  return MEMORY[0x24BE634C8]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x24BDAFA10]();
}

