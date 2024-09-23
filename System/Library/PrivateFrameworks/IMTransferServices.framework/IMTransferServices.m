IMTransferServicesCompressionController *sub_2084AD340()
{
  IMTransferServicesCompressionController *result;

  result = objc_alloc_init(IMTransferServicesCompressionController);
  qword_253EA4488 = (uint64_t)result;
  return result;
}

void sub_2084ADBA4(_Unwind_Exception *a1, int a2)
{
  uint64_t v2;

  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    if (!v2)
      JUMPOUT(0x2084ADB64);
    JUMPOUT(0x2084ADB20);
  }
  _Unwind_Resume(a1);
}

IMTransferServicesController *sub_2084ADC4C()
{
  IMTransferServicesController *result;

  result = objc_alloc_init(IMTransferServicesController);
  qword_253EA4490 = (uint64_t)result;
  return result;
}

void sub_2084AE2D0(_Unwind_Exception *exc_buf, int a2)
{
  uint64_t v2;

  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x2084AE208);
  }
  _Block_object_dispose((const void *)(v2 - 176), 8);
  _Unwind_Resume(exc_buf);
}

void sub_2084AE3B4(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_2084AE3C4(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_2084AE3D0(uint64_t a1)
{
  NSObject *v2;
  _xpc_connection_s *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_2084AC000, v2, OS_LOG_TYPE_INFO, "Transfer service disconnected", v4, 2u);
    }
  }
  v3 = *(_xpc_connection_s **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v3)
  {
    xpc_connection_cancel(v3);
    xpc_release(*(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = 0;
  }
}

int64_t sub_2084AE488(uint64_t a1, void *a2)
{
  int64_t result;
  void *v5;
  NSObject *v6;
  pid_t pid;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD v12[2];
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  result = MEMORY[0x20BD0A300](a2);
  if (result == MEMORY[0x24BDACFA0])
  {
    if (_IMWillLog())
    {
      v5 = (void *)MEMORY[0x20BD0A2C4](a2);
      if (IMOSLoggingEnabled())
      {
        v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          pid = xpc_connection_get_pid(*(xpc_connection_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
          v12[0] = 67109378;
          v12[1] = pid;
          v13 = 2080;
          v14 = v5;
          _os_log_impl(&dword_2084AC000, v6, OS_LOG_TYPE_INFO, "received message from peer(%d): %s", (uint8_t *)v12, 0x12u);
        }
      }
      free(v5);
    }
    result = xpc_dictionary_get_int64(a2, "__message_type__");
    if (result == 1)
    {
      v8 = *(_QWORD *)(a1 + 32);
      if (v8)
      {
        v9 = IMGetXPCIntFromDictionary();
        v10 = IMGetXPCIntFromDictionary();
        v11 = IMGetXPCIntFromDictionary();
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, v9, v10, v11);
      }
    }
  }
  return result;
}

void sub_2084AE624(uint64_t a1, void *a2)
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *string;
  int v17;
  char *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
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
  uint64_t v35;
  NSObject *v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  const char *v45;
  _xpc_connection_s *v46;
  int v47;
  uint64_t v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v4 = MEMORY[0x20BD0A300](a2);
  if (v4 == MEMORY[0x24BDACFB8])
  {
    if (IMOSLoggingEnabled())
    {
      v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
        *(_DWORD *)buf = 136315138;
        v50 = string;
        _os_log_impl(&dword_2084AC000, v15, OS_LOG_TYPE_INFO, "Error received in message reply handler: %s", buf, 0xCu);
      }
    }
    v17 = *(_DWORD *)(a1 + 112);
    if (v17 > 2)
    {
      if (*(_QWORD *)(a1 + 96))
      {
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v11, (uint64_t)CFSTR("IMTransferServicesErrorDomain"), -4, 0, v12, v13, v14);
        (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 96) + 16))(*(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 40));
      }
    }
    else
    {
      v47 = v17 + 1;
      objc_msgSend__sendFilePath_topic_userInfo_transferID_sourceAppID_encryptFile_retries_progressBlock_completionBlock_(*(void **)(a1 + 32), v11, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(unsigned __int8 *)(a1 + 116), v47, *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96));
    }
  }
  else if (v4 == MEMORY[0x24BDACFA0])
  {
    v18 = (char *)MEMORY[0x20BD0A2C4](a2);
    if (IMOSLoggingEnabled())
    {
      v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v50 = v18;
        _os_log_impl(&dword_2084AC000, v19, OS_LOG_TYPE_INFO, "received reply: %s", buf, 0xCu);
      }
    }
    free(v18);
    v20 = IMGetXPCBoolFromDictionary();
    v21 = IMGetXPCIntFromDictionary();
    v22 = IMGetXPCStringFromDictionary();
    v23 = IMGetXPCStringFromDictionary();
    v24 = IMGetXPCDataFromDictionary();
    v25 = IMGetXPCDataFromDictionary();
    v26 = IMGetXPCCodableFromDictionaryWithStandardAllowlist();
    v27 = IMGetXPCStringFromDictionary();
    v28 = *(_QWORD *)(a1 + 96);
    if (v28)
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 16))(v28, *(_QWORD *)(a1 + 40), v20, v26, v27, v22, v24, v23, v25, v21);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
        *(_DWORD *)buf = 136315138;
        v50 = v10;
        _os_log_impl(&dword_2084AC000, v9, OS_LOG_TYPE_INFO, "Error reply type in message reply handler: %s", buf, 0xCu);
      }
    }
    if (*(_QWORD *)(a1 + 96))
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v5, (uint64_t)CFSTR("IMTransferServicesErrorDomain"), -1, 0, v6, v7, v8);
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 96) + 16))(*(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 40));
    }
  }
  if (*(_QWORD *)(a1 + 80))
  {
    v48 = 0;
    if (IMOSLoggingEnabled())
    {
      v36 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        v37 = *(const char **)(a1 + 80);
        *(_DWORD *)buf = 138412290;
        v50 = v37;
        _os_log_impl(&dword_2084AC000, v36, OS_LOG_TYPE_INFO, "Removing the clone we created before: %@", buf, 0xCu);
      }
    }
    v38 = (void *)objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v29, v30, v31, v32, v33, v34, v35);
    if ((objc_msgSend_removeItemAtURL_error_(v38, v39, *(_QWORD *)(a1 + 80), (uint64_t)&v48, v40, v41, v42, v43) & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        v44 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          v45 = *(const char **)(a1 + 80);
          *(_DWORD *)buf = 138412546;
          v50 = v45;
          v51 = 2112;
          v52 = v48;
          _os_log_impl(&dword_2084AC000, v44, OS_LOG_TYPE_INFO, "Deletion of clone of %@ failed! error: %@", buf, 0x16u);
        }
      }
    }
  }
  v46 = *(_xpc_connection_s **)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
  if (v46)
  {
    xpc_connection_cancel(v46);
    xpc_release(*(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40) = 0;
  }
}

void sub_2084AEAD4(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x2084AE7B4);
  }
  _Unwind_Resume(a1);
}

void sub_2084AF1C4(_Unwind_Exception *exc_buf, int a2)
{
  uint64_t v2;

  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x2084AF0F0);
  }
  _Block_object_dispose((const void *)(v2 - 176), 8);
  _Unwind_Resume(exc_buf);
}

void sub_2084AF28C(uint64_t a1)
{
  NSObject *v2;
  _xpc_connection_s *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_2084AC000, v2, OS_LOG_TYPE_INFO, "Transfer service disconnected", v4, 2u);
    }
  }
  v3 = *(_xpc_connection_s **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v3)
  {
    xpc_connection_cancel(v3);
    xpc_release(*(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = 0;
  }
}

int64_t sub_2084AF344(uint64_t a1, void *a2)
{
  int64_t result;
  void *v5;
  NSObject *v6;
  pid_t pid;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD v12[2];
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  result = MEMORY[0x20BD0A300](a2);
  if (result == MEMORY[0x24BDACFA0])
  {
    if (_IMWillLog())
    {
      v5 = (void *)MEMORY[0x20BD0A2C4](a2);
      if (IMOSLoggingEnabled())
      {
        v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          pid = xpc_connection_get_pid(*(xpc_connection_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
          v12[0] = 67109378;
          v12[1] = pid;
          v13 = 2080;
          v14 = v5;
          _os_log_impl(&dword_2084AC000, v6, OS_LOG_TYPE_INFO, "received message from peer(%d): %s", (uint8_t *)v12, 0x12u);
        }
      }
      free(v5);
    }
    result = xpc_dictionary_get_int64(a2, "__message_type__");
    if (result == 1)
    {
      v8 = *(_QWORD *)(a1 + 32);
      if (v8)
      {
        v9 = IMGetXPCIntFromDictionary();
        v10 = IMGetXPCIntFromDictionary();
        v11 = IMGetXPCIntFromDictionary();
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, v9, v10, v11);
      }
    }
  }
  return result;
}

void sub_2084AF4E0(uint64_t a1, void *a2)
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *string;
  int v17;
  char *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _xpc_connection_s *v25;
  int v26;
  uint8_t buf[4];
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = MEMORY[0x20BD0A300](a2);
  if (v4 == MEMORY[0x24BDACFB8])
  {
    if (IMOSLoggingEnabled())
    {
      v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
        *(_DWORD *)buf = 136315138;
        v28 = string;
        _os_log_impl(&dword_2084AC000, v15, OS_LOG_TYPE_INFO, "Error received in message reply handler: %s", buf, 0xCu);
      }
    }
    v17 = *(_DWORD *)(a1 + 136);
    if (v17 > 2)
    {
      if (*(_QWORD *)(a1 + 112))
      {
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v11, (uint64_t)CFSTR("IMTransferServicesErrorDomain"), -4, 0, v12, v13, v14);
        (*(void (**)(void))(*(_QWORD *)(a1 + 112) + 16))();
      }
    }
    else
    {
      v26 = v17 + 1;
      objc_msgSend__receiveFileTransfer_topic_path_requestURLString_ownerID_sourceAppID_signature_decryptionKey_retries_fileSize_progressBlock_completionBlock_(*(void **)(a1 + 32), v11, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), v26, *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112));
    }
  }
  else if (v4 == MEMORY[0x24BDACFA0])
  {
    v18 = (char *)MEMORY[0x20BD0A2C4](a2);
    if (IMOSLoggingEnabled())
    {
      v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v28 = v18;
        _os_log_impl(&dword_2084AC000, v19, OS_LOG_TYPE_INFO, "received reply: %s", buf, 0xCu);
      }
    }
    free(v18);
    v20 = IMGetXPCBoolFromDictionary();
    v21 = IMGetXPCCodableFromDictionaryWithStandardAllowlist();
    v22 = IMGetXPCStringFromDictionary();
    v23 = IMGetXPCStringFromDictionary();
    v24 = *(_QWORD *)(a1 + 112);
    if (v24)
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 16))(v24, *(_QWORD *)(a1 + 40), v22, v20, v21, v23);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
        *(_DWORD *)buf = 136315138;
        v28 = v10;
        _os_log_impl(&dword_2084AC000, v9, OS_LOG_TYPE_INFO, "Error reply type in message reply handler: %s", buf, 0xCu);
      }
    }
    if (*(_QWORD *)(a1 + 112))
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v5, (uint64_t)CFSTR("IMTransferServicesErrorDomain"), -1, 0, v6, v7, v8);
      (*(void (**)(void))(*(_QWORD *)(a1 + 112) + 16))();
    }
  }
  v25 = *(_xpc_connection_s **)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40);
  if (v25)
  {
    xpc_connection_cancel(v25);
    xpc_release(*(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40) = 0;
  }
}

void sub_2084AF82C(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x2084AF65CLL);
  }
  _Unwind_Resume(a1);
}

void sub_2084AFB78(uint64_t a1)
{
  _xpc_connection_s *v2;

  v2 = *(_xpc_connection_s **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    xpc_connection_cancel(v2);
    xpc_release(*(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = 0;
  }
}

void sub_2084AFE8C(uint64_t a1)
{
  _xpc_connection_s *v2;

  v2 = *(_xpc_connection_s **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    xpc_connection_cancel(v2);
    xpc_release(*(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = 0;
  }
}

void sub_2084AFED8(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  pid_t pid;
  _DWORD v7[2];
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (MEMORY[0x20BD0A300](a2) == MEMORY[0x24BDACFA0] && _IMWillLog())
  {
    v4 = (void *)MEMORY[0x20BD0A2C4](a2);
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        pid = xpc_connection_get_pid(*(xpc_connection_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
        v7[0] = 67109378;
        v7[1] = pid;
        v8 = 2080;
        v9 = v4;
        _os_log_impl(&dword_2084AC000, v5, OS_LOG_TYPE_INFO, "received message from peer(%d): %s", (uint8_t *)v7, 0x12u);
      }
    }
    free(v4);
  }
}

void sub_2084B0480(uint64_t a1)
{
  _xpc_connection_s *v2;

  v2 = *(_xpc_connection_s **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    xpc_connection_cancel(v2);
    xpc_release(*(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = 0;
  }
}

void sub_2084B04CC(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  pid_t pid;
  _DWORD v7[2];
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (MEMORY[0x20BD0A300](a2) == MEMORY[0x24BDACFA0] && _IMWillLog())
  {
    v4 = (void *)MEMORY[0x20BD0A2C4](a2);
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        pid = xpc_connection_get_pid(*(xpc_connection_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
        v7[0] = 67109378;
        v7[1] = pid;
        v8 = 2080;
        v9 = v4;
        _os_log_impl(&dword_2084AC000, v5, OS_LOG_TYPE_INFO, "received message from peer(%d): %s", (uint8_t *)v7, 0x12u);
      }
    }
    free(v4);
  }
}

void sub_2084B05F4(uint64_t a1, void *a2)
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *string;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _xpc_connection_s *v24;
  int v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = MEMORY[0x20BD0A300](a2);
  if (v4 == MEMORY[0x24BDACFB8])
  {
    if (IMOSLoggingEnabled())
    {
      v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
        v25 = 136315138;
        v26 = string;
        _os_log_impl(&dword_2084AC000, v15, OS_LOG_TYPE_INFO, "Transfer_Nickname - Error received in message reply handler: %s", (uint8_t *)&v25, 0xCu);
      }
    }
    v17 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v11, (uint64_t)CFSTR("IMTransferServicesErrorDomain"), -4, 0, v12, v13, v14);
    v18 = *(_QWORD *)(a1 + 32);
    if (v18)
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v18 + 16))(v18, 0, v17);
  }
  else if (v4 == MEMORY[0x24BDACFA0])
  {
    v19 = (char *)MEMORY[0x20BD0A2C4](a2);
    if (IMOSLoggingEnabled())
    {
      v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v25 = 136315138;
        v26 = v19;
        _os_log_impl(&dword_2084AC000, v20, OS_LOG_TYPE_INFO, "received reply: %s", (uint8_t *)&v25, 0xCu);
      }
    }
    free(v19);
    MEMORY[0x20BD0A174](CFSTR("IMNickname"), CFSTR("IMSharedUtilities"));
    objc_opt_class();
    v21 = IMGetXPCKeyedCodableFromDictionaryWithSecureCoding();
    v22 = IMGetXPCCodableFromDictionaryWithStandardAllowlist();
    v23 = *(_QWORD *)(a1 + 32);
    if (v23)
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v23, v21, v22);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
        v25 = 136315138;
        v26 = v10;
        _os_log_impl(&dword_2084AC000, v9, OS_LOG_TYPE_INFO, "Transfer_Nickname - Error reply type in message reply handler: %s", (uint8_t *)&v25, 0xCu);
      }
    }
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v5, (uint64_t)CFSTR("IMTransferServicesErrorDomain"), -1, 0, v6, v7, v8);
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
  }
  v24 = *(_xpc_connection_s **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v24)
  {
    xpc_connection_cancel(v24);
    xpc_release(*(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = 0;
  }
}

void sub_2084B08C0(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x2084B0760);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_2084B0958(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_2084B0D1C(uint64_t a1)
{
  _xpc_connection_s *v2;

  v2 = *(_xpc_connection_s **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    xpc_connection_cancel(v2);
    xpc_release(*(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = 0;
  }
}

void sub_2084B0D68(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  pid_t pid;
  _DWORD v7[2];
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (MEMORY[0x20BD0A300](a2) == MEMORY[0x24BDACFA0] && _IMWillLog())
  {
    v4 = (void *)MEMORY[0x20BD0A2C4](a2);
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        pid = xpc_connection_get_pid(*(xpc_connection_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
        v7[0] = 67109378;
        v7[1] = pid;
        v8 = 2080;
        v9 = v4;
        _os_log_impl(&dword_2084AC000, v5, OS_LOG_TYPE_INFO, "received message from peer(%d): %s", (uint8_t *)v7, 0x12u);
      }
    }
    free(v4);
  }
}

void sub_2084B0E90(uint64_t a1, void *a2)
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  const char *string;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _xpc_connection_s *v31;
  uint8_t buf[4];
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = MEMORY[0x20BD0A300](a2);
  if (v4 == MEMORY[0x24BDACFB8])
  {
    if (IMOSLoggingEnabled())
    {
      v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
        *(_DWORD *)buf = 136315138;
        v33 = string;
        _os_log_impl(&dword_2084AC000, v16, OS_LOG_TYPE_INFO, "Transfer_Nickname - Error received in message reply handler: %s", buf, 0xCu);
      }
    }
    v18 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v12, (uint64_t)CFSTR("IMTransferServicesErrorDomain"), -4, 0, v13, v14, v15);
    v19 = *(_QWORD *)(a1 + 32);
    if (v19)
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))(v19 + 16))(v19, 0, 0, 0, 0, 0, 0, 0, v18);
  }
  else if (v4 == MEMORY[0x24BDACFA0])
  {
    v20 = (char *)MEMORY[0x20BD0A2C4](a2);
    if (IMOSLoggingEnabled())
    {
      v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v33 = v20;
        _os_log_impl(&dword_2084AC000, v21, OS_LOG_TYPE_INFO, "received reply: %s", buf, 0xCu);
      }
    }
    free(v20);
    v22 = IMGetXPCBoolFromDictionary();
    v23 = IMGetXPCStringFromDictionary();
    v24 = IMGetXPCDataFromDictionary();
    v25 = IMGetXPCDataFromDictionary();
    v26 = IMGetXPCDataFromDictionary();
    v27 = IMGetXPCDataFromDictionary();
    v28 = IMGetXPCCodableFromDictionaryWithStandardAllowlist();
    MEMORY[0x20BD0A174](CFSTR("IMNickname"), CFSTR("IMSharedUtilities"));
    v29 = IMGetXPCKeyedCodableFromDictionaryWithSecureCoding();
    v30 = *(_QWORD *)(a1 + 32);
    if (v30)
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 16))(v30, v22, v29, v23, v24, v25, v26, v27, v28);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
        *(_DWORD *)buf = 136315138;
        v33 = v10;
        _os_log_impl(&dword_2084AC000, v9, OS_LOG_TYPE_INFO, "IMTransfer_Nickname - Error reply type in message reply handler: %s", buf, 0xCu);
      }
    }
    if (*(_QWORD *)(a1 + 32))
    {
      v11 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v5, (uint64_t)CFSTR("IMTransferServicesErrorDomain"), -1, 0, v6, v7, v8);
      (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, 0, 0, 0, 0, 0, 0, v11);
    }
  }
  v31 = *(_xpc_connection_s **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v31)
  {
    xpc_connection_cancel(v31);
    xpc_release(*(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = 0;
  }
}

void sub_2084B1238(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x2084B1024);
  }
  _Unwind_Resume(a1);
}

void sub_2084B158C(uint64_t a1)
{
  _xpc_connection_s *v2;

  v2 = *(_xpc_connection_s **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    xpc_connection_cancel(v2);
    xpc_release(*(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = 0;
  }
}

void sub_2084B15D8(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  pid_t pid;
  _DWORD v7[2];
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (MEMORY[0x20BD0A300](a2) == MEMORY[0x24BDACFA0] && _IMWillLog())
  {
    v4 = (void *)MEMORY[0x20BD0A2C4](a2);
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        pid = xpc_connection_get_pid(*(xpc_connection_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
        v7[0] = 67109378;
        v7[1] = pid;
        v8 = 2080;
        v9 = v4;
        _os_log_impl(&dword_2084AC000, v5, OS_LOG_TYPE_INFO, "received message from peer(%d): %s", (uint8_t *)v7, 0x12u);
      }
    }
    free(v4);
  }
}

void sub_2084B1700(uint64_t a1, void *a2)
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *string;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _xpc_connection_s *v24;
  int v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = MEMORY[0x20BD0A300](a2);
  if (v4 == MEMORY[0x24BDACFB8])
  {
    if (IMOSLoggingEnabled())
    {
      v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
        v25 = 136315138;
        v26 = string;
        _os_log_impl(&dword_2084AC000, v15, OS_LOG_TYPE_INFO, "Transfer_Nickname - Error received in message reply handler: %s", (uint8_t *)&v25, 0xCu);
      }
    }
    v17 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v11, (uint64_t)CFSTR("IMTransferServicesErrorDomain"), -4, 0, v12, v13, v14);
    v18 = *(_QWORD *)(a1 + 32);
    if (v18)
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v18 + 16))(v18, 0, v17);
  }
  else if (v4 == MEMORY[0x24BDACFA0])
  {
    v19 = (char *)MEMORY[0x20BD0A2C4](a2);
    if (IMOSLoggingEnabled())
    {
      v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v25 = 136315138;
        v26 = v19;
        _os_log_impl(&dword_2084AC000, v20, OS_LOG_TYPE_INFO, "received reply: %s", (uint8_t *)&v25, 0xCu);
      }
    }
    free(v19);
    v21 = IMGetXPCBoolFromDictionary();
    v22 = IMGetXPCCodableFromDictionaryWithStandardAllowlist();
    v23 = *(_QWORD *)(a1 + 32);
    if (v23)
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v23, v21, v22);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
        v25 = 136315138;
        v26 = v10;
        _os_log_impl(&dword_2084AC000, v9, OS_LOG_TYPE_INFO, "Transfer_Nickname - Error reply type in message reply handler: %s", (uint8_t *)&v25, 0xCu);
      }
    }
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v5, (uint64_t)CFSTR("IMTransferServicesErrorDomain"), -1, 0, v6, v7, v8);
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
  }
  v24 = *(_xpc_connection_s **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v24)
  {
    xpc_connection_cancel(v24);
    xpc_release(*(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = 0;
  }
}

void sub_2084B19B0(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x2084B186CLL);
  }
  _Unwind_Resume(a1);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
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

uint64_t IMGetXPCIntFromDictionary()
{
  return MEMORY[0x24BE506F8]();
}

uint64_t IMGetXPCKeyedCodableFromDictionaryWithSecureCoding()
{
  return MEMORY[0x24BE50700]();
}

uint64_t IMGetXPCStringFromDictionary()
{
  return MEMORY[0x24BE50708]();
}

uint64_t IMInsertBoolsToXPCDictionary()
{
  return MEMORY[0x24BE50720]();
}

uint64_t IMInsertDatasToXPCDictionary()
{
  return MEMORY[0x24BE50730]();
}

uint64_t IMInsertDictionariesToXPCDictionary()
{
  return MEMORY[0x24BE50738]();
}

uint64_t IMInsertKeyedCodableObjectsToXPCDictionary()
{
  return MEMORY[0x24BE50748]();
}

uint64_t IMInsertNSStringsToXPCDictionary()
{
  return MEMORY[0x24BE50750]();
}

uint64_t IMInsertStringsToXPCDictionary()
{
  return MEMORY[0x24BE50758]();
}

uint64_t IMOSLoggingEnabled()
{
  return MEMORY[0x24BE50790]();
}

uint64_t IMReportAutoBugCapture()
{
  return MEMORY[0x24BE507B8]();
}

uint64_t IMWeakLinkClass()
{
  return MEMORY[0x24BE50840]();
}

uint64_t IMXPCConfigureConnection()
{
  return MEMORY[0x24BE50850]();
}

uint64_t IMXPCCreateConnectionForServiceWithQueue()
{
  return MEMORY[0x24BE50858]();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return MEMORY[0x24BE50908]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _IMWillLog()
{
  return MEMORY[0x24BE509C0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
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

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x24BDB0788](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x24BDB07B0](connection, message, replyq, handler);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x24BDB0820](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0938](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

