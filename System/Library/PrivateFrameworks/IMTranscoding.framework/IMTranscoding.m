void sub_20D4BDC9C()
{
  IMTranscodeController *v0;
  void *v1;

  v0 = objc_alloc_init(IMTranscodeController);
  v1 = (void *)qword_253E79A60;
  qword_253E79A60 = (uint64_t)v0;

}

void sub_20D4BDF40(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  int v5;
  NSObject *v6;
  const char *string;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (MEMORY[0x212BA1EEC]() != MEMORY[0x24BDACFB8])
    goto LABEL_2;
  if (v3 == (id)MEMORY[0x24BDACF30])
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_2;
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D4BC000, v6, OS_LOG_TYPE_INFO, "Transcoder service interrupted", buf, 2u);
    }
    goto LABEL_8;
  }
  v4 = (id)MEMORY[0x24BDACF38];
  v5 = IMOSLoggingEnabled();
  if (v3 != v4)
  {
    if (!v5)
      goto LABEL_2;
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x24BDACF40]);
      *(_DWORD *)buf = 136315138;
      v11 = string;
      _os_log_impl(&dword_20D4BC000, v6, OS_LOG_TYPE_INFO, "Unexpected error for transcoder service: %s", buf, 0xCu);
    }
LABEL_8:

    goto LABEL_2;
  }
  if (v5)
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D4BC000, v8, OS_LOG_TYPE_INFO, "Transcoder service invalid", buf, 2u);
    }

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_20D4BE174;
  block[3] = &unk_24C719B68;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
LABEL_2:

}

uint64_t sub_20D4BE174(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__disconnected);
}

void sub_20D4BE788(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  const char *string;
  uint64_t v8;
  int v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  id v15;
  void *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  int8x16_t v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = MEMORY[0x212BA1EEC]();
  if (v4 != MEMORY[0x24BDACFB8])
  {
    if (v4 == MEMORY[0x24BDACFA0])
    {
      v18 = IMGetXPCBoolFromDictionary();
      IMGetXPCCodableFromDictionaryWithStandardAllowlist();
      v17 = (char *)objc_claimAutoreleasedReturnValue();
      IMGetXPCCodableFromDictionaryWithStandardAllowlist();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (char *)MEMORY[0x212BA1EC8](v3);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v21 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138413058;
          v29 = v21;
          v30 = 2112;
          v31 = v17;
          v32 = 2080;
          v33 = v19;
          v34 = 2112;
          v35 = v16;
          _os_log_impl(&dword_20D4BC000, v20, OS_LOG_TYPE_INFO, "received reply for GenerateSafeRender for %@, previewURL: %@ reply: %s error: %@", buf, 0x2Au);
        }

      }
      free(v19);
      goto LABEL_25;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = *(_QWORD *)(a1 + 32);
        string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x24BDACF40]);
        *(_DWORD *)buf = 138412546;
        v29 = v6;
        v30 = 2080;
        v31 = string;
        _os_log_impl(&dword_20D4BC000, v5, OS_LOG_TYPE_INFO, "received unknown error for GenerateSafeRender for %@: %s", buf, 0x16u);
      }

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("__kIMTranscodeErrorDomain"), -1, 0);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_24:
    v16 = (void *)v8;
    v17 = 0;
    v18 = 0;
LABEL_25:
    v25 = *(_QWORD *)(a1 + 48);
    if (v25)
      (*(void (**)(uint64_t, uint64_t, char *, void *))(v25 + 16))(v25, v18, v17, v16);
    goto LABEL_27;
  }
  v9 = *(_DWORD *)(a1 + 96);
  v10 = IMOSLoggingEnabled();
  if (v9 > 4)
  {
    if (v10)
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = *(_QWORD *)(a1 + 32);
        v24 = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x24BDACF40]);
        *(_DWORD *)buf = 138412546;
        v29 = v23;
        v30 = 2080;
        v31 = v24;
        _os_log_impl(&dword_20D4BC000, v22, OS_LOG_TYPE_INFO, "received error (final) for GenerateSafeRender for %@: %s", buf, 0x16u);
      }

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("__kIMTranscodeErrorDomain"), -8, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  if (v10)
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = *(int *)(a1 + 96);
      v13 = *(const char **)(a1 + 32);
      v14 = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x24BDACF40]);
      *(_DWORD *)buf = 134218498;
      v29 = v12;
      v30 = 2112;
      v31 = v13;
      v32 = 2080;
      v33 = v14;
      _os_log_impl(&dword_20D4BC000, v11, OS_LOG_TYPE_INFO, "received error (retry %lu) for GenerateSafeRender for %@: %s, retrying", buf, 0x20u);
    }

  }
  v26 = *(int8x16_t *)(a1 + 32);
  v15 = (id)v26.i64[0];
  v27 = *(id *)(a1 + 48);
  im_dispatch_after();

  v16 = 0;
  v17 = 0;
LABEL_27:

}

void sub_20D4BEBC4(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x20D4BEB34);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_20D4BEC24(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  _OWORD v7[2];
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = (*(_DWORD *)(a1 + 96) + 1);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_OWORD *)(a1 + 72);
  v7[0] = *(_OWORD *)(a1 + 56);
  v7[1] = v5;
  v8 = *(_QWORD *)(a1 + 88);
  return objc_msgSend(v2, "_generateSafeRender:constraints:retries:completionBlock:", v1, v7, v3, v4);
}

void sub_20D4BF4C4(uint64_t a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, void *a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;

  v20 = a2;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a8;
  os_activity_scope_leave((os_activity_scope_state_t)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32));
  v19 = *(_QWORD *)(a1 + 32);
  if (v19)
    (*(void (**)(uint64_t, id, id, id, id, uint64_t, uint64_t, id))(v19 + 16))(v19, v20, v15, v16, v17, a6, a7, v18);

}

void sub_20D4BF590(uint64_t a1, void *a2)
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  const char *string;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  const char *v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  char *v22;
  NSObject *v23;
  void *v24;
  const __CFString *v25;
  id v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  char v50;
  id v51;
  NSObject *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  xpc_object_t xdict;
  int8x16_t v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t);
  void *v71;
  int8x16_t v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  char v83;
  __int16 v84;
  uint8_t v85[128];
  uint8_t buf[4];
  void *v87;
  __int16 v88;
  id v89;
  __int16 v90;
  const char *v91;
  __int16 v92;
  void *v93;
  uint64_t v94;

  v94 = *MEMORY[0x24BDAC8D0];
  xdict = a2;
  v3 = MEMORY[0x212BA1EEC]();
  v60 = a1;
  if (v3 != MEMORY[0x24BDACFB8])
  {
    if (v3 != MEMORY[0x24BDACFA0])
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          v5 = *(void **)(a1 + 32);
          string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x24BDACF40]);
          *(_DWORD *)buf = 138412546;
          v87 = v5;
          v88 = 2080;
          v89 = (id)string;
          _os_log_impl(&dword_20D4BC000, v4, OS_LOG_TYPE_INFO, "received unknown error for TranscodeFile for %@: %s", buf, 0x16u);
        }

      }
      IMSingleObjectArray();
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 96);
      v8 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("__kIMTranscodeErrorDomain"), -1, 0);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *, _QWORD, void *, _QWORD, _QWORD, _QWORD))(v7 + 16))(v7, v8, v59, 0, v58, 0, 0, 0);
      goto LABEL_43;
    }
    HIDWORD(v54) = IMGetXPCBoolFromDictionary();
    IMGetXPCCodableFromDictionaryWithStandardAllowlist();
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (char *)MEMORY[0x212BA1EC8](xdict);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = *(void **)(a1 + 32);
        v25 = CFSTR("NO");
        *(_DWORD *)buf = 138413058;
        if (HIDWORD(v54))
          v25 = CFSTR("YES");
        v87 = v24;
        v88 = 2112;
        v89 = (id)v25;
        v90 = 2080;
        v91 = v22;
        v92 = 2112;
        v93 = v59;
        _os_log_impl(&dword_20D4BC000, v23, OS_LOG_TYPE_INFO, "received reply for TranscodeFile for %@, success: %@ reply: %s error: %@", buf, 0x2Au);
      }

    }
    free(v22);
    LODWORD(v54) = IMGetXPCBoolFromDictionary();
    IMGetXPCStringFromDictionary();
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    IMGetXPCCodableFromDictionaryWithStandardAllowlist();
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    IMGetXPCCodableFromDictionaryWithStandardAllowlist();
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    IMGetXPCCodableFromDictionaryWithStandardAllowlist();
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE508A8], "sharedInstance");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "isInternalInstall"))
    {
      v27 = IMGetCachedDomainBoolForKey();

      if (!v27)
      {
LABEL_34:
        v39 = *(_QWORD *)(v60 + 96);
        if (v58)
        {
          objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *, void *, void *, void *, _QWORD, _QWORD, void *))(v39 + 16))(v39, v40, v57, v56, v59, HIDWORD(v54), v54, v55);

        }
        else
        {
          (*(void (**)(uint64_t, _QWORD, void *, void *, void *, _QWORD, _QWORD, void *))(v39 + 16))(v39, 0, v57, v56, v59, HIDWORD(v54), v54, v55);
        }

LABEL_43:
        if (*(_QWORD *)(v60 + 88))
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
            {
              v47 = *(void **)(v60 + 88);
              *(_DWORD *)buf = 138412290;
              v87 = v47;
              _os_log_impl(&dword_20D4BC000, v46, OS_LOG_TYPE_INFO, "Removing the link we created before: %@", buf, 0xCu);
            }

          }
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager", v54);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = *(_QWORD *)(v60 + 88);
          v63 = 0;
          v50 = objc_msgSend(v48, "removeItemAtURL:error:", v49, &v63);
          v51 = v63;

          if ((v50 & 1) == 0 && IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
            {
              v53 = *(void **)(v60 + 88);
              *(_DWORD *)buf = 138412546;
              v87 = v53;
              v88 = 2112;
              v89 = v51;
              _os_log_impl(&dword_20D4BC000, v52, OS_LOG_TYPE_INFO, "Unlink of %@ failed! error: %@", buf, 0x16u);
            }

          }
        }
        goto LABEL_54;
      }
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v26 = v57;
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v64, v85, 16);
      if (v28)
      {
        v29 = *(_QWORD *)v65;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v65 != v29)
              objc_enumerationMutation(v26);
            v31 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager", v54);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "path");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "lastPathComponent");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "_randomTemporaryPathWithFileName:", v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v87 = v31;
                v88 = 2112;
                v89 = v35;
                _os_log_impl(&dword_20D4BC000, v36, OS_LOG_TYPE_INFO, "Stashing aside transcoded URL: %@ to %@", buf, 0x16u);
              }

            }
            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "path");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "copyItemAtPath:toPath:error:", v38, v35, 0);

          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v64, v85, 16);
        }
        while (v28);
      }
    }

    goto LABEL_34;
  }
  v9 = *(_DWORD *)(a1 + 128);
  v10 = IMOSLoggingEnabled();
  if (v9 > 4)
  {
    if (v10)
    {
      OSLogHandleForIMFoundationCategory();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        v42 = *(void **)(a1 + 32);
        v43 = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x24BDACF40]);
        *(_DWORD *)buf = 138412546;
        v87 = v42;
        v88 = 2080;
        v89 = (id)v43;
        _os_log_impl(&dword_20D4BC000, v41, OS_LOG_TYPE_INFO, "received error (final) for TranscodeFile for %@: %s", buf, 0x16u);
      }

    }
    IMSingleObjectArray();
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = *(_QWORD *)(a1 + 96);
    v45 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("__kIMTranscodeErrorDomain"), -8, 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *, _QWORD, void *, _QWORD, _QWORD, _QWORD))(v44 + 16))(v44, v45, v59, 0, v58, 0, 0, 0);
    goto LABEL_43;
  }
  if (v10)
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)*(int *)(a1 + 128);
      v13 = *(void **)(a1 + 32);
      v14 = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x24BDACF40]);
      *(_DWORD *)buf = 134218498;
      v87 = v12;
      v88 = 2112;
      v89 = v13;
      v90 = 2080;
      v91 = v14;
      _os_log_impl(&dword_20D4BC000, v11, OS_LOG_TYPE_INFO, "received error (retry %lu) for TranscodeFile for %@: %s, retrying", buf, 0x20u);
    }

  }
  v68 = MEMORY[0x24BDAC760];
  v69 = 3221225472;
  v70 = sub_20D4BFF98;
  v71 = &unk_24C719C30;
  v62 = *(int8x16_t *)(a1 + 32);
  v15 = (id)v62.i64[0];
  v72 = vextq_s8(v62, v62, 8uLL);
  v73 = *(id *)(a1 + 48);
  v83 = *(_BYTE *)(a1 + 132);
  v16 = *(id *)(a1 + 56);
  v17 = *(_QWORD *)(a1 + 104);
  v74 = v16;
  v79 = v17;
  v75 = *(id *)(a1 + 64);
  v18 = *(id *)(a1 + 72);
  v19 = *(_QWORD *)(a1 + 112);
  v76 = v18;
  v80 = v19;
  v20 = *(id *)(a1 + 80);
  v21 = *(_QWORD *)(a1 + 120);
  v77 = v20;
  v81 = v21;
  v84 = *(_WORD *)(a1 + 133);
  v82 = *(_DWORD *)(a1 + 128);
  v78 = *(id *)(a1 + 96);
  im_dispatch_after();

LABEL_54:
}

void sub_20D4BFF10(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x20D4BFCDCLL);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_20D4BFF98(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  LOBYTE(v3) = *(_BYTE *)(a1 + 126);
  HIDWORD(v2) = *(_DWORD *)(a1 + 120) + 1;
  LOBYTE(v2) = *(_BYTE *)(a1 + 125);
  return objc_msgSend(*(id *)(a1 + 32), "_transcodeFileTransferContents:utiType:isSticker:allowUnfilteredUTIs:target:sizes:commonCapabilities:maxDimension:transcoderUserInfo:representations:fallBack:retries:isLQMEnabled:completionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 124), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 112), v2, v3, *(_QWORD *)(a1 + 88));
}

void sub_20D4C0478(uint64_t a1, void *a2)
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  const char *string;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  char *v19;
  NSObject *v20;
  void *v21;
  const __CFString *v22;
  id v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  unsigned int v42;
  unsigned int v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  xpc_object_t xdict;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t);
  void *v56;
  uint64_t v57;
  id v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  char v63;
  uint8_t v64[128];
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  const char *v70;
  __int16 v71;
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  xdict = a2;
  v3 = MEMORY[0x212BA1EEC]();
  if (v3 != MEMORY[0x24BDACFB8])
  {
    if (v3 != MEMORY[0x24BDACFA0])
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          v5 = *(void **)(a1 + 32);
          string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x24BDACF40]);
          *(_DWORD *)buf = 138412546;
          v66 = v5;
          v67 = 2080;
          v68 = (void *)string;
          _os_log_impl(&dword_20D4BC000, v4, OS_LOG_TYPE_INFO, "received unknown error for TranscodePayloadData for %@: %s", buf, 0x16u);
        }

      }
      v7 = *(_QWORD *)(a1 + 64);
      if (v7)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("__kIMTranscodeErrorDomain"), -1, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, _QWORD, void *, _QWORD, _QWORD))(v7 + 16))(v7, 0, 0, v8, 0, 0);

      }
      goto LABEL_44;
    }
    v44 = a1;
    v43 = IMGetXPCBoolFromDictionary();
    IMGetXPCCodableFromDictionaryWithStandardAllowlist();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (char *)MEMORY[0x212BA1EC8](xdict);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = *(void **)(v44 + 32);
        v22 = CFSTR("NO");
        *(_DWORD *)buf = 138413058;
        if (v43)
          v22 = CFSTR("YES");
        v66 = v21;
        v67 = 2112;
        v68 = (void *)v22;
        v69 = 2080;
        v70 = v19;
        v71 = 2112;
        v72 = v47;
        _os_log_impl(&dword_20D4BC000, v20, OS_LOG_TYPE_INFO, "received reply for TranscodePayloadData for %@, success: %@ reply: %s error: %@", buf, 0x2Au);
      }

    }
    free(v19);
    IMGetXPCCodableFromDictionaryWithStandardAllowlist();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    IMGetXPCCodableFromDictionaryWithStandardAllowlist();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = IMGetXPCBoolFromDictionary();
    objc_msgSend(MEMORY[0x24BE508A8], "sharedInstance");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "isInternalInstall"))
    {
      v24 = IMGetCachedDomainBoolForKey();

      if (!v24)
      {
LABEL_35:
        v36 = *(_QWORD *)(v44 + 64);
        if (v36)
          (*(void (**)(uint64_t, void *, void *, void *, _QWORD, _QWORD))(v36 + 16))(v36, v46, v45, v47, v43, v42);

        goto LABEL_44;
      }
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v23 = v46;
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v49, v64, 16);
      if (v25)
      {
        v26 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v50 != v26)
              objc_enumerationMutation(v23);
            v28 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "path");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "lastPathComponent");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "_randomTemporaryPathWithFileName:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v33 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v66 = v28;
                v67 = 2112;
                v68 = v32;
                _os_log_impl(&dword_20D4BC000, v33, OS_LOG_TYPE_INFO, "Stashing aside transcoded URL: %@ to %@", buf, 0x16u);
              }

            }
            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "path");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "copyItemAtPath:toPath:error:", v35, v32, 0);

          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v49, v64, 16);
        }
        while (v25);
      }
    }

    goto LABEL_35;
  }
  v9 = *(_QWORD *)(a1 + 72);
  v10 = IMOSLoggingEnabled();
  if (v9 > 4)
  {
    if (v10)
    {
      OSLogHandleForIMFoundationCategory();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        v38 = *(void **)(a1 + 32);
        v39 = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x24BDACF40]);
        *(_DWORD *)buf = 138412546;
        v66 = v38;
        v67 = 2080;
        v68 = (void *)v39;
        _os_log_impl(&dword_20D4BC000, v37, OS_LOG_TYPE_INFO, "received error (final) for TranscodePayloadData for %@: %s", buf, 0x16u);
      }

    }
    v40 = *(_QWORD *)(a1 + 64);
    if (v40)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("__kIMTranscodeErrorDomain"), -8, 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *, _QWORD, _QWORD))(v40 + 16))(v40, 0, 0, v41, 0, 0);

    }
  }
  else
  {
    if (v10)
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = *(void **)(a1 + 72);
        v13 = *(void **)(a1 + 32);
        v14 = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x24BDACF40]);
        *(_DWORD *)buf = 134218498;
        v66 = v12;
        v67 = 2112;
        v68 = v13;
        v69 = 2080;
        v70 = v14;
        _os_log_impl(&dword_20D4BC000, v11, OS_LOG_TYPE_INFO, "received error (retry %lu) for TranscodePayloadData for %@: %s, retrying", buf, 0x20u);
      }

    }
    v53 = MEMORY[0x24BDAC760];
    v54 = 3221225472;
    v55 = sub_20D4C0BE8;
    v56 = &unk_24C719C80;
    v15 = *(void **)(a1 + 48);
    v57 = *(_QWORD *)(a1 + 40);
    v58 = v15;
    v59 = *(id *)(a1 + 32);
    v16 = *(id *)(a1 + 56);
    v18 = *(void **)(a1 + 64);
    v17 = *(_QWORD *)(a1 + 72);
    v60 = v16;
    v62 = v17;
    v63 = *(_BYTE *)(a1 + 80);
    v61 = v18;
    im_dispatch_after();

  }
LABEL_44:

}

void sub_20D4C0B88(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x20D4C0AECLL);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_20D4C0BE8(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__transcodeFileTransferPayloadData_balloonBundleID_attachments_retries_fallBack_completionBlock_);
}

void sub_20D4C0FF0(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  const char *string;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = MEMORY[0x212BA1EEC]();
  if (v4 == MEMORY[0x24BDACFB8])
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = *(_QWORD *)(a1 + 32);
        string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x24BDACF40]);
        v20 = 138412546;
        v21 = v11;
        v22 = 2080;
        v23 = (void *)string;
        _os_log_impl(&dword_20D4BC000, v10, OS_LOG_TYPE_INFO, "received error for GenerateSnapshot for %@: %s", (uint8_t *)&v20, 0x16u);
      }

    }
    v13 = *(_QWORD *)(a1 + 40);
    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("__kIMTranscodeErrorDomain"), -8, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v9);
      goto LABEL_23;
    }
  }
  else
  {
    if (v4 == MEMORY[0x24BDACFA0])
    {
      v14 = IMGetXPCBoolFromDictionary();
      IMGetXPCCodableFromDictionaryWithStandardAllowlist();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x212BA1EC8](v3);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = *(_QWORD *)(a1 + 32);
          v18 = CFSTR("NO");
          v20 = 138413058;
          if ((_DWORD)v14)
            v18 = CFSTR("YES");
          v21 = v17;
          v22 = 2112;
          v23 = (void *)v18;
          v24 = 2080;
          v25 = v15;
          v26 = 2112;
          v27 = v9;
          _os_log_impl(&dword_20D4BC000, v16, OS_LOG_TYPE_INFO, "received reply for GenerateSnapshot for %@, success: %@ reply: %s error: %@", (uint8_t *)&v20, 0x2Au);
        }

      }
      free(v15);
      v19 = *(_QWORD *)(a1 + 40);
      if (v19)
        (*(void (**)(uint64_t, uint64_t, void *))(v19 + 16))(v19, v14, v9);
      goto LABEL_23;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = *(_QWORD *)(a1 + 32);
        v7 = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x24BDACF40]);
        v20 = 138412546;
        v21 = v6;
        v22 = 2080;
        v23 = (void *)v7;
        _os_log_impl(&dword_20D4BC000, v5, OS_LOG_TYPE_INFO, "received unknown error for GenerateSnapshot for %@: %s", (uint8_t *)&v20, 0x16u);
      }

    }
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("__kIMTranscodeErrorDomain"), -1, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);
LABEL_23:

    }
  }

}

void sub_20D4C1318(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x20D4C119CLL);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_20D4C14B4(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v8;
  _OWORD v9[2];
  uint64_t v10;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(_OWORD *)(a1 + 88);
  v9[0] = *(_OWORD *)(a1 + 72);
  v9[1] = v6;
  v10 = *(_QWORD *)(a1 + 104);
  LOBYTE(v8) = 0;
  return objc_msgSend(v2, "_generatePreview:previewURL:senderContext:constraints:retries:balloonBundleID:completionBlock:blockUntilReply:", v1, v3, v4, v9, 0, 0, v5, v8);
}

void sub_20D4C1A8C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  const char *string;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  const __CFString *v24;
  void *v25;
  __n128 v26;
  __n128 v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  _BYTE buf[32];
  _QWORD v45[4];

  v45[3] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = MEMORY[0x212BA1EEC]();
  if (v4 == MEMORY[0x24BDACFB8])
  {
    if (*(_QWORD *)(a1 + 80))
    {
      objc_msgSend(MEMORY[0x24BE51238], "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IMPreviewGeneratorDomain"), 2, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "forceAutoBugCaptureWithSubType:errorPayload:", CFSTR("Transcoder Preview Generation Failure"), v13);

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = *(_QWORD *)(a1 + 32);
          string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x24BDACF40]);
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v15;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = string;
          _os_log_impl(&dword_20D4BC000, v14, OS_LOG_TYPE_INFO, "received error (final) for GeneratePreview for %@: %s", buf, 0x16u);
        }

      }
      v17 = *(_QWORD *)(a1 + 72);
      if (v17)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("__kIMTranscodeErrorDomain"), -8, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *, double, double))(v17 + 16))(v17, 0, v18, 0.0, 0.0);

      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          v30 = *(_QWORD *)(a1 + 80);
          v31 = *(_QWORD *)(a1 + 32);
          v32 = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x24BDACF40]);
          *(_DWORD *)buf = 134218498;
          *(_QWORD *)&buf[4] = v30;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v31;
          *(_WORD *)&buf[22] = 2080;
          *(_QWORD *)&buf[24] = v32;
          _os_log_impl(&dword_20D4BC000, v29, OS_LOG_TYPE_INFO, "received error (retry %lu) for GeneratePreview for %@: %s, retrying", buf, 0x20u);
        }

      }
      v34 = *(_QWORD *)(a1 + 32);
      v33 = *(void **)(a1 + 40);
      v35 = *(_QWORD *)(a1 + 48);
      v36 = *(_QWORD *)(a1 + 56);
      v37 = *(_QWORD *)(a1 + 80) + 1;
      v38 = *(_QWORD *)(a1 + 64);
      v39 = *(_QWORD *)(a1 + 72);
      v40 = *(_BYTE *)(a1 + 128);
      v41 = *(_OWORD *)(a1 + 104);
      *(_OWORD *)buf = *(_OWORD *)(a1 + 88);
      *(_OWORD *)&buf[16] = v41;
      v45[0] = *(_QWORD *)(a1 + 120);
      LOBYTE(v43) = v40;
      objc_msgSend(v33, "_generatePreview:previewURL:senderContext:constraints:retries:balloonBundleID:completionBlock:blockUntilReply:", v34, v35, v36, buf, v37, v38, v39, v43);
    }
  }
  else if (v4 == MEMORY[0x24BDACFA0])
  {
    v19 = IMGetXPCBoolFromDictionary();
    IMGetXPCCodableFromDictionaryWithStandardAllowlist();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x212BA1EC8](v3);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = *(_QWORD *)(a1 + 32);
        v24 = CFSTR("NO");
        *(_DWORD *)buf = 138413058;
        if ((_DWORD)v19)
          v24 = CFSTR("YES");
        *(_QWORD *)&buf[4] = v23;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v24;
        *(_WORD *)&buf[22] = 2080;
        *(_QWORD *)&buf[24] = v21;
        LOWORD(v45[0]) = 2112;
        *(_QWORD *)((char *)v45 + 2) = v20;
        _os_log_impl(&dword_20D4BC000, v22, OS_LOG_TYPE_INFO, "received reply for GeneratePreview for %@, success: %@ reply: %s error: %@", buf, 0x2Au);
      }

    }
    free(v21);
    objc_opt_class();
    IMGetXPCKeyedCodableFromDictionaryWithSecureCoding();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v25;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    if (v25)
    {
      objc_msgSend(v25, "getValue:size:", buf, 16);
      v26.n128_u64[0] = *(_QWORD *)buf;
      v27.n128_u64[0] = *(_QWORD *)&buf[8];
    }
    else
    {
      v27.n128_u64[0] = 0;
      v26.n128_u64[0] = 0;
    }
    v42 = *(_QWORD *)(a1 + 72);
    if (v42)
      (*(void (**)(uint64_t, uint64_t, void *, __n128, __n128))(v42 + 16))(v42, v19, v20, v26, v27);

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = *(_QWORD *)(a1 + 32);
        v7 = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x24BDACF40]);
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v6;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = v7;
        _os_log_impl(&dword_20D4BC000, v5, OS_LOG_TYPE_INFO, "received unknown error for GeneratePreview for %@: %s", buf, 0x16u);
      }

    }
    objc_msgSend(MEMORY[0x24BE51238], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IMPreviewGeneratorDomain"), 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "forceAutoBugCaptureWithSubType:errorPayload:", CFSTR("Transcoder Preview Generation Failure"), v9);

    v10 = *(_QWORD *)(a1 + 72);
    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("__kIMTranscodeErrorDomain"), -1, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *, double, double))(v10 + 16))(v10, 0, v11, 0.0, 0.0);

    }
  }

}

void sub_20D4C1F9C(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x20D4C1EFCLL);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_20D4C214C(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v8;
  _OWORD v9[2];
  uint64_t v10;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(_OWORD *)(a1 + 88);
  v9[0] = *(_OWORD *)(a1 + 72);
  v9[1] = v6;
  v10 = *(_QWORD *)(a1 + 104);
  LOBYTE(v8) = 0;
  return objc_msgSend(v2, "_generateMetadata:metadataURL:senderContext:constraints:retries:completionBlock:blockUntilReply:", v1, v3, v4, v9, 0, v5, v8);
}

void sub_20D4C2680(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  id v16;
  uint64_t v17;
  void *v18;
  char *v19;
  NSObject *v20;
  uint64_t v21;
  const __CFString *v22;
  void *v23;
  __n128 v24;
  __n128 v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  const char *string;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  int8x16_t v35;
  id v36;
  id v37;
  id v38;
  _BYTE buf[22];
  __int16 v40;
  const char *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = MEMORY[0x212BA1EEC]();
  if (v4 == MEMORY[0x24BDACFB8])
  {
    if (*(_QWORD *)(a1 + 72) > 4uLL)
    {
      objc_msgSend(MEMORY[0x24BE51238], "sharedInstance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IMPreviewGeneratorDomain"), 2, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "forceAutoBugCaptureWithSubType:errorPayload:", CFSTR("Transcoder Preview Generation Failure"), v28);

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          v30 = *(_QWORD *)(a1 + 32);
          string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x24BDACF40]);
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v30;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = string;
          _os_log_impl(&dword_20D4BC000, v29, OS_LOG_TYPE_INFO, "received error (final) for GenerateMetadata for %@: %s", buf, 0x16u);
        }

      }
      v32 = *(_QWORD *)(a1 + 64);
      if (v32)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("__kIMTranscodeErrorDomain"), -8, 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *, double, double))(v32 + 16))(v32, 0, v33, 0.0, 0.0);

      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = *(_QWORD *)(a1 + 72);
          v14 = *(_QWORD *)(a1 + 32);
          v15 = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x24BDACF40]);
          *(_DWORD *)buf = 134218498;
          *(_QWORD *)&buf[4] = v13;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v14;
          v40 = 2080;
          v41 = v15;
          _os_log_impl(&dword_20D4BC000, v12, OS_LOG_TYPE_INFO, "received error (retry %lu) for GenerateMetadata for %@: %s, retrying", buf, 0x20u);
        }

      }
      v35 = *(int8x16_t *)(a1 + 32);
      v16 = (id)v35.i64[0];
      v36 = *(id *)(a1 + 48);
      v37 = *(id *)(a1 + 56);
      v38 = *(id *)(a1 + 64);
      im_dispatch_after();

    }
  }
  else if (v4 == MEMORY[0x24BDACFA0])
  {
    v17 = IMGetXPCBoolFromDictionary();
    IMGetXPCCodableFromDictionaryWithStandardAllowlist();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (char *)MEMORY[0x212BA1EC8](v3);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = *(_QWORD *)(a1 + 32);
        v22 = CFSTR("NO");
        *(_DWORD *)buf = 138413058;
        if ((_DWORD)v17)
          v22 = CFSTR("YES");
        *(_QWORD *)&buf[4] = v21;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v22;
        v40 = 2080;
        v41 = v19;
        v42 = 2112;
        v43 = v18;
        _os_log_impl(&dword_20D4BC000, v20, OS_LOG_TYPE_INFO, "received reply for GenerateMetadata for %@, success: %@ reply: %s error: %@", buf, 0x2Au);
      }

    }
    free(v19);
    objc_opt_class();
    IMGetXPCKeyedCodableFromDictionaryWithSecureCoding();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v23;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    if (v23)
    {
      objc_msgSend(v23, "getValue:size:", buf, 16);
      v24.n128_u64[0] = *(_QWORD *)buf;
      v25.n128_u64[0] = *(_QWORD *)&buf[8];
    }
    else
    {
      v25.n128_u64[0] = 0;
      v24.n128_u64[0] = 0;
    }
    v34 = *(_QWORD *)(a1 + 64);
    if (v34)
      (*(void (**)(uint64_t, uint64_t, void *, __n128, __n128))(v34 + 16))(v34, v17, v18, v24, v25);

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = *(_QWORD *)(a1 + 32);
        v7 = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x24BDACF40]);
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v6;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = v7;
        _os_log_impl(&dword_20D4BC000, v5, OS_LOG_TYPE_INFO, "received unknown error for GenerateMetadata for %@: %s", buf, 0x16u);
      }

    }
    objc_msgSend(MEMORY[0x24BE51238], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IMPreviewGeneratorDomain"), 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "forceAutoBugCaptureWithSubType:errorPayload:", CFSTR("Transcoder Preview Generation Failure"), v9);

    v10 = *(_QWORD *)(a1 + 64);
    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("__kIMTranscodeErrorDomain"), -1, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *, double, double))(v10 + 16))(v10, 0, v11, 0.0, 0.0);

    }
  }

}

void sub_20D4C2C2C(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x20D4C2B74);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_20D4C2C8C(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  char v9;
  uint64_t v11;
  _OWORD v12[2];
  uint64_t v13;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 104);
  v6 = *(_QWORD *)(a1 + 112) + 1;
  v7 = *(_QWORD *)(a1 + 64);
  v8 = *(_OWORD *)(a1 + 88);
  v9 = *(_BYTE *)(a1 + 120);
  v12[0] = *(_OWORD *)(a1 + 72);
  v12[1] = v8;
  v13 = v5;
  LOBYTE(v11) = v9;
  return objc_msgSend(v2, "_generateMetadata:metadataURL:senderContext:constraints:retries:completionBlock:blockUntilReply:", v1, v3, v4, v12, v6, v7, v11);
}

void sub_20D4C3120(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  char *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  const char *string;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = MEMORY[0x212BA1EEC]();
  if (v4 == MEMORY[0x24BDACFB8])
  {
    if (*(_QWORD *)(a1 + 72) > 4uLL)
    {
      objc_msgSend(MEMORY[0x24BE51238], "sharedInstance");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IMiMessageAppDecodeDomain"), 2, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "forceAutoBugCaptureWithSubType:errorPayload:", CFSTR("Transcoder Preview Generation Failure"), v30);

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          v33 = *(_QWORD *)(a1 + 32);
          v32 = *(_QWORD *)(a1 + 40);
          string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x24BDACF40]);
          *(_DWORD *)buf = 138412802;
          v42 = v33;
          v43 = 2112;
          v44 = v32;
          v45 = 2080;
          v46 = (void *)string;
          _os_log_impl(&dword_20D4BC000, v31, OS_LOG_TYPE_INFO, "received error (final) for DecodeiMessageAppPayload for %@ bundleID %@: %s", buf, 0x20u);
        }

      }
      v35 = *(_QWORD *)(a1 + 64);
      if (v35)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("__kIMTranscodeErrorDomain"), -8, 0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v35 + 16))(v35, 0, 0, 0, v36);

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
          v14 = *(_QWORD *)(a1 + 72);
          v16 = *(_QWORD *)(a1 + 32);
          v15 = *(void **)(a1 + 40);
          v17 = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x24BDACF40]);
          *(_DWORD *)buf = 134218754;
          v42 = v14;
          v43 = 2112;
          v44 = v16;
          v45 = 2112;
          v46 = v15;
          v47 = 2080;
          v48 = v17;
          _os_log_impl(&dword_20D4BC000, v13, OS_LOG_TYPE_INFO, "received error (retry %lu) for DecodeiMessageAppPayload for %@ bundleID %@: %s, retrying", buf, 0x2Au);
        }

      }
      v37 = *(id *)(a1 + 32);
      v38 = *(id *)(a1 + 56);
      v39 = *(id *)(a1 + 40);
      v40 = *(id *)(a1 + 64);
      im_dispatch_after();

    }
  }
  else if (v4 == MEMORY[0x24BDACFA0])
  {
    v18 = IMGetXPCBoolFromDictionary();
    v19 = (char *)MEMORY[0x212BA1EC8](v3);
    IMGetXPCCodableFromDictionaryWithStandardAllowlist();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = *(_QWORD *)(a1 + 32);
        v23 = *(_QWORD *)(a1 + 40);
        v24 = CFSTR("NO");
        if ((_DWORD)v18)
          v24 = CFSTR("YES");
        *(_DWORD *)buf = 138413314;
        v42 = v22;
        v43 = 2112;
        v44 = v23;
        v45 = 2112;
        v46 = (void *)v24;
        v47 = 2080;
        v48 = v19;
        v49 = 2112;
        v50 = v20;
        _os_log_impl(&dword_20D4BC000, v21, OS_LOG_TYPE_INFO, "received reply for DecodeiMessageAppPayload for %@ bundleID %@, success: %@ reply: %s error: %@", buf, 0x34u);
      }

    }
    free(v19);
    IMGetXPCDataFromDictionary();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    IMGetXPCArrayFromDictionary();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "__imArrayByApplyingBlock:", &unk_24C719DB0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *(_QWORD *)(a1 + 64);
    if (v28)
      (*(void (**)(uint64_t, uint64_t, void *, void *, void *))(v28 + 16))(v28, v18, v25, v27, v20);

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v7 = *(_QWORD *)(a1 + 32);
        v6 = *(_QWORD *)(a1 + 40);
        v8 = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x24BDACF40]);
        *(_DWORD *)buf = 138412802;
        v42 = v7;
        v43 = 2112;
        v44 = v6;
        v45 = 2080;
        v46 = (void *)v8;
        _os_log_impl(&dword_20D4BC000, v5, OS_LOG_TYPE_INFO, "received unknown error for DecodeiMessageAppPayload for %@ bundleID %@: %s", buf, 0x20u);
      }

    }
    objc_msgSend(MEMORY[0x24BE51238], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IMiMessageAppDecodeDomain"), 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "forceAutoBugCaptureWithSubType:errorPayload:", CFSTR("Transcoder Preview Generation Failure"), v10);

    v11 = *(_QWORD *)(a1 + 64);
    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("__kIMTranscodeErrorDomain"), -1, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v11 + 16))(v11, 0, 0, 0, v12);

    }
  }

}

void sub_20D4C36DC(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x20D4C3650);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_20D4C373C(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__decodeiMessageAppPayload_senderContext_bundleID_retries_completionBlock_blockUntilReply_);
}

uint64_t sub_20D4C3758()
{
  return MEMORY[0x24BEDD108](MEMORY[0x24BDBCF48], sel_URLWithString_);
}

void sub_20D4C38C0(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  NSObject *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = MEMORY[0x212BA1EEC]();
  if (v4 == MEMORY[0x24BDACFB8])
  {
    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_20D4C3AD0(a1, v3, v5);
    goto LABEL_7;
  }
  if (v4 != MEMORY[0x24BDACFA0])
  {
    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_20D4C3B74(v3, v5);
LABEL_7:
    v6 = 0;
    goto LABEL_13;
  }
  IMGetXPCCodableFromDictionaryWithStandardAllowlist();
  v5 = objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412546;
      v10 = v8;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_20D4BC000, v7, OS_LOG_TYPE_INFO, "received reply for AudioTranscription for transferURL %@, error: %@", (uint8_t *)&v9, 0x16u);
    }

  }
  IMGetXPCStringFromDictionary();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_20D4C3AD0(uint64_t a1, xpc_object_t xdict, NSObject *a3)
{
  uint64_t v4;
  const char *string;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x24BDACF40]);
  v6 = 138412546;
  v7 = v4;
  v8 = 2080;
  v9 = string;
  _os_log_error_impl(&dword_20D4BC000, a3, OS_LOG_TYPE_ERROR, "received error for AudioTranscription for transferURL: %@, %s", (uint8_t *)&v6, 0x16u);
  sub_20D4C3AC4();
}

void sub_20D4C3B74(void *a1, NSObject *a2)
{
  const char *string;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  string = xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x24BDACF40]);
  v4 = 136315138;
  v5 = string;
  _os_log_error_impl(&dword_20D4BC000, a2, OS_LOG_TYPE_ERROR, "received unknown error for AudioTranscription %s", (uint8_t *)&v4, 0xCu);
  sub_20D4C3AC4();
}

uint64_t IMCachesDirectoryURL()
{
  return MEMORY[0x24BE50BA0]();
}

uint64_t IMClientPreviewConstraints()
{
  return MEMORY[0x24BE50BC0]();
}

uint64_t IMGetCachedDomainBoolForKey()
{
  return MEMORY[0x24BE506A8]();
}

uint64_t IMGetXPCArrayFromDictionary()
{
  return MEMORY[0x24BE506D0]();
}

uint64_t IMGetXPCBoolFromDictionary()
{
  return MEMORY[0x24BE506D8]();
}

uint64_t IMGetXPCCodableFromDictionaryWithStandardAllowlist()
{
  return MEMORY[0x24BE506E0]();
}

uint64_t IMGetXPCDataFromDictionary()
{
  return MEMORY[0x24BE506E8]();
}

uint64_t IMGetXPCKeyedCodableFromDictionaryWithSecureCoding()
{
  return MEMORY[0x24BE50700]();
}

uint64_t IMGetXPCStringFromDictionary()
{
  return MEMORY[0x24BE50708]();
}

uint64_t IMInsertArraysToXPCDictionary()
{
  return MEMORY[0x24BE50718]();
}

uint64_t IMInsertBoolsToXPCDictionary()
{
  return MEMORY[0x24BE50720]();
}

uint64_t IMInsertCodableObjectsToXPCDictionary()
{
  return MEMORY[0x24BE50728]();
}

uint64_t IMInsertDatasToXPCDictionary()
{
  return MEMORY[0x24BE50730]();
}

uint64_t IMInsertDictionariesToXPCDictionary()
{
  return MEMORY[0x24BE50738]();
}

uint64_t IMInsertIntsToXPCDictionary()
{
  return MEMORY[0x24BE50740]();
}

uint64_t IMInsertKeyedCodableObjectsToXPCDictionary()
{
  return MEMORY[0x24BE50748]();
}

uint64_t IMInsertStringsToXPCDictionary()
{
  return MEMORY[0x24BE50758]();
}

uint64_t IMLogHandleForCategory()
{
  return MEMORY[0x24BE50E50]();
}

uint64_t IMOSLoggingEnabled()
{
  return MEMORY[0x24BE50790]();
}

uint64_t IMPreviewConstraintsDictionaryFromConstraint()
{
  return MEMORY[0x24BE50FC0]();
}

uint64_t IMSingleObjectArray()
{
  return MEMORY[0x24BE507F0]();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return MEMORY[0x24BE50908]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t im_dispatch_after()
{
  return MEMORY[0x24BE509D0]();
}

uint64_t im_primary_queue()
{
  return MEMORY[0x24BE509E0]();
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
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

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x24BDAFC08]();
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x24BDB0730](name, targetq);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x24BDB07B0](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x24BDB07B8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x24BDB0820](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

