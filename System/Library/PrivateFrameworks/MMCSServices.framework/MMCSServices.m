uint64_t sub_22D297F44()
{
  MMCSEngineCancelRequests();
  return MMCSEngineDestroy();
}

void sub_22D2982B0(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x22D298274);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_22D298780(void *a1, const char *a2, _DWORD *a3, _QWORD *a4, uint64_t a5)
{
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t result;
  NSObject *v41;
  const char *v42;
  NSObject *v43;
  NSObject *v44;
  uint32_t v45;
  int v46;
  void *v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  _DWORD *v51;
  __int16 v52;
  _QWORD *v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v10 = objc_msgSend_serialControllerQueue(MMCSController, a2, (uint64_t)a3, (uint64_t)a4, a5);
  dispatch_assert_queue_V2(v10);
  if (IMOSLoggingEnabled())
  {
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v46 = 134219008;
      v47 = a1;
      v48 = 2048;
      v49 = a2;
      v50 = 2048;
      v51 = a3;
      v52 = 2048;
      v53 = a4;
      v54 = 2048;
      v55 = a5;
      _os_log_impl(&dword_22D296000, v14, OS_LOG_TYPE_INFO, "_MMCSGetFileDescriptorAndContentTypeFromItemCallback:   context: %p   item id: %qx   fd: %p   itemTypePtr: %p   errorPtr: %p", (uint8_t *)&v46, 0x34u);
    }
  }
  if (!a1)
  {
    result = IMOSLoggingEnabled();
    if (!(_DWORD)result)
      return result;
    v41 = OSLogHandleForIMFoundationCategory();
    result = os_log_type_enabled(v41, OS_LOG_TYPE_INFO);
    if (!(_DWORD)result)
      return result;
    LOWORD(v46) = 0;
    v42 = " no controller found, failing";
    goto LABEL_38;
  }
  v15 = (void *)objc_msgSend__registeredTransferForItemID_(a1, v11, (uint64_t)a2, v12, v13);
  v20 = v15;
  if (!v15)
  {
    result = IMOSLoggingEnabled();
    if (!(_DWORD)result)
      return result;
    v41 = OSLogHandleForIMFoundationCategory();
    result = os_log_type_enabled(v41, OS_LOG_TYPE_INFO);
    if (!(_DWORD)result)
      return result;
    LOWORD(v46) = 0;
    v42 = "  Couldn't find registered transfer for get request";
    goto LABEL_38;
  }
  if (!a3)
  {
    result = IMOSLoggingEnabled();
    if (!(_DWORD)result)
      return result;
    v41 = OSLogHandleForIMFoundationCategory();
    result = os_log_type_enabled(v41, OS_LOG_TYPE_INFO);
    if (!(_DWORD)result)
      return result;
    LOWORD(v46) = 0;
    v42 = "  Empty file descriptor pointer passed in, failing";
    goto LABEL_38;
  }
  v21 = (void *)objc_msgSend_localPath(v15, v16, v17, v18, v19);
  if (IMOSLoggingEnabled())
  {
    v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v46 = 138412290;
      v47 = v20;
      _os_log_impl(&dword_22D296000, v26, OS_LOG_TYPE_INFO, "   => found transfer: %@", (uint8_t *)&v46, 0xCu);
    }
  }
  *a3 = -1;
  if (!v21)
  {
    result = IMOSLoggingEnabled();
    if (!(_DWORD)result)
      return result;
    v41 = OSLogHandleForIMFoundationCategory();
    result = os_log_type_enabled(v41, OS_LOG_TYPE_INFO);
    if (!(_DWORD)result)
      return result;
    LOWORD(v46) = 0;
    v42 = "   => No local path found!";
    goto LABEL_38;
  }
  v27 = (void *)objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v22, v23, v24, v25);
  if ((objc_msgSend_fileExistsAtPath_(v27, v28, (uint64_t)v21, v29, v30) & 1) == 0)
  {
    result = IMOSLoggingEnabled();
    if (!(_DWORD)result)
      return result;
    v43 = OSLogHandleForIMFoundationCategory();
    result = os_log_type_enabled(v43, OS_LOG_TYPE_INFO);
    if (!(_DWORD)result)
      return result;
    v46 = 138412290;
    v47 = v21;
    v42 = "   => Failing, file doesn't exist at path: %@";
    v44 = v43;
    v45 = 12;
LABEL_39:
    _os_log_impl(&dword_22D296000, v44, OS_LOG_TYPE_INFO, v42, (uint8_t *)&v46, v45);
    return 0;
  }
  v35 = (const char *)objc_msgSend_fileSystemRepresentation(v21, v31, v32, v33, v34);
  if (!v35)
  {
    result = IMOSLoggingEnabled();
    if (!(_DWORD)result)
      return result;
    v41 = OSLogHandleForIMFoundationCategory();
    result = os_log_type_enabled(v41, OS_LOG_TYPE_INFO);
    if (!(_DWORD)result)
      return result;
    LOWORD(v46) = 0;
    v42 = "   => failed finding path";
    goto LABEL_38;
  }
  v36 = open(v35, 0);
  if ((_DWORD)v36 == -1)
  {
    result = IMOSLoggingEnabled();
    if (!(_DWORD)result)
      return result;
    v41 = OSLogHandleForIMFoundationCategory();
    result = os_log_type_enabled(v41, OS_LOG_TYPE_INFO);
    if (!(_DWORD)result)
      return result;
    LOWORD(v46) = 0;
    v42 = "   => could not open file";
LABEL_38:
    v44 = v41;
    v45 = 2;
    goto LABEL_39;
  }
  *a3 = v36;
  objc_msgSend_setFd_(v20, v37, v36, v38, v39);
  if (a4)
    *a4 = CFSTR("fxd");
  return 1;
}

void sub_22D298B90(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  NSObject *v25;
  NSObject *v26;
  const char *v27;
  int v28;
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  double v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v12 = objc_msgSend_serialControllerQueue(MMCSController, a2, a3, a4, a5);
  dispatch_assert_queue_V2(v12);
  if (IMOSLoggingEnabled())
  {
    v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v28 = 134219266;
      v29 = (uint64_t)a1;
      v30 = 2048;
      v31 = a2;
      v32 = 2048;
      v33 = a3;
      v34 = 2112;
      v35 = sub_22D29E148(a4, v13, v14, v15, v16);
      v36 = 2048;
      v37 = a6;
      v38 = 2112;
      v39 = a5;
      _os_log_impl(&dword_22D296000, v17, OS_LOG_TYPE_INFO, "_MMCSGetItemProgressCallback:   context: %p   item id: %qx   sig: %p   state: %@   progress: %f  error: %@", (uint8_t *)&v28, 0x3Eu);
    }
  }
  if (a1 && (v18 = (void *)objc_msgSend_controller(a1, v13, v14, v15, v16), (v22 = v18) != 0))
  {
    v23 = objc_msgSend__registeredTransferForItemID_(v18, v19, (uint64_t)a2, v20, v21);
    if (IMOSLoggingEnabled())
    {
      v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v28 = 138412290;
        v29 = v23;
        _os_log_impl(&dword_22D296000, v25, OS_LOG_TYPE_INFO, "   => found transfer: %@", (uint8_t *)&v28, 0xCu);
      }
    }
    if (v23)
    {
      objc_msgSend__getItemUpdated_progress_state_error_(v22, v24, v23, a4, a5, a6);
      return;
    }
    if (IMOSLoggingEnabled())
    {
      v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        LOWORD(v28) = 0;
        v27 = "  couldn't find transfer for get progress update";
LABEL_17:
        _os_log_impl(&dword_22D296000, v26, OS_LOG_TYPE_INFO, v27, (uint8_t *)&v28, 2u);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      LOWORD(v28) = 0;
      v27 = " no controller found, bailing";
      goto LABEL_17;
    }
  }
}

void sub_22D298E18(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  const char *v41;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  const char *v60;
  __int16 v61;
  uint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v11 = objc_msgSend_serialControllerQueue(MMCSController, a2, a3, a4, a5);
  dispatch_assert_queue_V2(v11);
  if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = "";
      *(_DWORD *)buf = 134219010;
      if (a4)
        v13 = (const char *)a4;
      v54 = (uint64_t)a1;
      v55 = 2048;
      v56 = (uint64_t)a2;
      v57 = 2048;
      v58 = a3;
      v59 = 2080;
      v60 = v13;
      v61 = 2112;
      v62 = a5;
      _os_log_impl(&dword_22D296000, v12, OS_LOG_TYPE_INFO, "_MMCSGetItemDoneCallback:   context: %p   item id: %qx   sig: %p   path: %s  error: %@", buf, 0x34u);
    }
  }
  v47 = a1;
  v44 = a5;
  v45 = a4;
  if (a6)
  {
    CFRetain(a6);
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(a6, v14, (uint64_t)&v48, (uint64_t)v52, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v49 != v16)
            objc_enumerationMutation(a6);
          v18 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
          if (IMOSLoggingEnabled())
          {
            v20 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              v23 = objc_msgSend_objectForKey_(a6, v19, v18, v21, v22);
              *(_DWORD *)buf = 138412546;
              v54 = v18;
              v55 = 2112;
              v56 = v23;
              _os_log_impl(&dword_22D296000, v20, OS_LOG_TYPE_INFO, "_MMCSGetItemDoneCallback with key: %@,  value: %@", buf, 0x16u);
            }
          }
        }
        v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(a6, v19, (uint64_t)&v48, (uint64_t)v52, 16);
      }
      while (v15);
    }
    CFRelease(a6);
    v28 = v47;
  }
  else
  {
    v28 = a1;
    if (IMOSLoggingEnabled())
    {
      v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D296000, v29, OS_LOG_TYPE_INFO, "Got back NULL results _MMCSGetItemDoneCallback", buf, 2u);
      }
    }
  }
  if (v28 && (v30 = (void *)objc_msgSend_controller(v28, v24, v25, v26, v27), (v34 = v30) != 0))
  {
    v35 = objc_msgSend__registeredTransferForItemID_(v30, v31, (uint64_t)a2, v32, v33);
    if (IMOSLoggingEnabled())
    {
      v39 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v35;
        _os_log_impl(&dword_22D296000, v39, OS_LOG_TYPE_INFO, "   => found transfer: %@", buf, 0xCu);
      }
    }
    if (v35)
    {
      if (v45)
      {
        v40 = objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v36, v45, v37, v38);
        objc_msgSend__getItemCompleted_path_error_(v34, v41, v35, v40, v44, v44);
      }
      else
      {
        objc_msgSend__getItemCompleted_path_error_(v34, v36, v35, 0, v44, v44);
      }
      return;
    }
    if (IMOSLoggingEnabled())
    {
      v42 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v43 = "  couldn't find transfer for get completion";
        goto LABEL_32;
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v42 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v43 = " no controller found, bailing";
LABEL_32:
      _os_log_impl(&dword_22D296000, v42, OS_LOG_TYPE_INFO, v43, buf, 2u);
    }
  }
}

void sub_22D29927C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  const __CFDictionary *Value;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  NSObject *v25;
  NSObject *v26;
  const char *v27;
  int v28;
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  double v37;
  __int16 v38;
  const __CFDictionary *v39;
  uint64_t v40;

  Value = (const __CFDictionary *)a5;
  v40 = *MEMORY[0x24BDAC8D0];
  v12 = objc_msgSend_serialControllerQueue(MMCSController, a2, a3, a4, a5);
  dispatch_assert_queue_V2(v12);
  if (Value)
    Value = (const __CFDictionary *)CFDictionaryGetValue(Value, (const void *)*MEMORY[0x24BE63470]);
  if (IMOSLoggingEnabled())
  {
    v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v28 = 134219266;
      v29 = (uint64_t)a1;
      v30 = 2048;
      v31 = a2;
      v32 = 2048;
      v33 = a3;
      v34 = 2112;
      v35 = sub_22D29DF78(a4, v13, v14, v15, v16);
      v36 = 2048;
      v37 = a6;
      v38 = 2112;
      v39 = Value;
      _os_log_impl(&dword_22D296000, v17, OS_LOG_TYPE_INFO, "_MMCSPutItemProgressCallback:   context: %p   item id: %qx   sig: %p   state: %@   progress: %f  error: %@", (uint8_t *)&v28, 0x3Eu);
    }
  }
  if (a1 && (v18 = (void *)objc_msgSend_controller(a1, v13, v14, v15, v16), (v22 = v18) != 0))
  {
    v23 = objc_msgSend__registeredTransferForItemID_(v18, v19, (uint64_t)a2, v20, v21);
    if (IMOSLoggingEnabled())
    {
      v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v28 = 138412290;
        v29 = v23;
        _os_log_impl(&dword_22D296000, v25, OS_LOG_TYPE_INFO, "   => found transfer: %@", (uint8_t *)&v28, 0xCu);
      }
    }
    if (v23)
    {
      objc_msgSend__putItemUpdated_progress_state_error_(v22, v24, v23, a4, (uint64_t)Value, a6);
      return;
    }
    if (IMOSLoggingEnabled())
    {
      v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        LOWORD(v28) = 0;
        v27 = "  couldn't find transfer for put progress update";
LABEL_19:
        _os_log_impl(&dword_22D296000, v26, OS_LOG_TYPE_INFO, v27, (uint8_t *)&v28, 2u);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      LOWORD(v28) = 0;
      v27 = " no controller found, bailing";
      goto LABEL_19;
    }
  }
}

void sub_22D299520(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const __CFDictionary *Value;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  NSObject *v33;
  int v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  const __CFDictionary *v41;
  uint64_t v42;

  Value = (const __CFDictionary *)a4;
  v42 = *MEMORY[0x24BDAC8D0];
  v9 = objc_msgSend_serialControllerQueue(MMCSController, a2, a3, a4, a5);
  dispatch_assert_queue_V2(v9);
  if (Value)
    Value = (const __CFDictionary *)CFDictionaryGetValue(Value, (const void *)*MEMORY[0x24BE63470]);
  if (IMOSLoggingEnabled())
  {
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v34 = 134218754;
      v35 = (uint64_t)a1;
      v36 = 2048;
      v37 = (void *)a2;
      v38 = 2048;
      v39 = a3;
      v40 = 2112;
      v41 = Value;
      _os_log_impl(&dword_22D296000, v14, OS_LOG_TYPE_INFO, "_MMCSPutItemDoneCallback:   context: %p   item id: %qx   sig: %p   error: %@", (uint8_t *)&v34, 0x2Au);
    }
  }
  if (!a1 || (v15 = (void *)objc_msgSend_controller(a1, v10, v11, v12, v13), (v19 = v15) == 0))
  {
    if (!IMOSLoggingEnabled())
      return;
    v33 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      return;
    LOWORD(v34) = 0;
    v30 = " no controller found, bailing";
LABEL_21:
    v31 = v33;
    v32 = 2;
    goto LABEL_22;
  }
  v20 = (void *)objc_msgSend__registeredTransferForItemID_(v15, v16, (uint64_t)a2, v17, v18);
  if (IMOSLoggingEnabled())
  {
    v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v34 = 138412290;
      v35 = (uint64_t)v20;
      _os_log_impl(&dword_22D296000, v23, OS_LOG_TYPE_INFO, "   => found transfer: %@", (uint8_t *)&v34, 0xCu);
    }
  }
  if (!v20)
  {
    if (!IMOSLoggingEnabled())
      return;
    v33 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      return;
    LOWORD(v34) = 0;
    v30 = "  couldn't find transfer for put completion";
    goto LABEL_21;
  }
  objc_msgSend__putItemCompleted_error_(v19, v21, (uint64_t)v20, (uint64_t)Value, v22);
  if (IMOSLoggingEnabled())
  {
    v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v29 = objc_msgSend_localPath(v20, v25, v26, v27, v28);
      v34 = 138412546;
      v35 = v29;
      v36 = 2112;
      v37 = Value;
      v30 = "[=MMCS-Timing=] Put Item completed for path: %@  (error: %@)";
      v31 = v24;
      v32 = 22;
LABEL_22:
      _os_log_impl(&dword_22D296000, v31, OS_LOG_TYPE_INFO, v30, (uint8_t *)&v34, v32);
    }
  }
}

void sub_22D299800(void *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  NSObject *v32;
  void *v33;
  _BOOL4 v35;
  int v36;
  const char *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  NSObject *v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  _BYTE v59[24];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v7 = objc_msgSend_serialControllerQueue(MMCSController, a2, a3, a4, a5);
  dispatch_assert_queue_V2(v7);
  if (a2)
  {
    CFRetain(a2);
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v59 = 134217984;
        *(_QWORD *)&v59[4] = a1;
        _os_log_impl(&dword_22D296000, v8, OS_LOG_TYPE_INFO, "MMCSRequestCompletedCallback with requestorContext: %p", v59, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = objc_msgSend_objectForKey_(a2, v9, (uint64_t)CFSTR("metricObject"), v11, v12);
        *(_DWORD *)v59 = 138412290;
        *(_QWORD *)&v59[4] = v14;
        _os_log_impl(&dword_22D296000, v13, OS_LOG_TYPE_INFO, "MMCSRequestCompletedCallback with metric: %@", v59, 0xCu);
      }
    }
    v15 = objc_msgSend_stringByExpandingTildeInPath(CFSTR("/var/mobile/Library/SMS/prewarm.db"), v9, v10, v11, v12);
    v16 = objc_alloc(MEMORY[0x24BE4FEF0]);
    v18 = (void *)objc_msgSend_initWithPath_storeName_dataProtectionClass_(v16, v17, v15, (uint64_t)CFSTR("MMCSServices"), 0);
    v21 = (void *)objc_msgSend_dataForKey_error_(v18, v19, (uint64_t)CFSTR("MMCSContainerStateRefreshTime"), 0, v20);
    v25 = v21;
    v58 = 0.0;
    if (v21)
    {
      objc_msgSend_getBytes_length_(v21, v22, (uint64_t)&v58, 8, v24);
      objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x24BDBCE60], v26, v27, v28, v29);
      v31 = v30 - v58;
    }
    else
    {
      v31 = 0.0;
    }
    v33 = (void *)objc_msgSend_objectForKey_(a2, v22, *MEMORY[0x24BE63498], v23, v24);
    if (v33)
    {
      v35 = v31 > 86400.0 || v25 == 0;
      v36 = IMOSLoggingEnabled();
      if (v35)
      {
        if (v36)
        {
          v38 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            v42 = objc_msgSend_length(v33, v37, v39, v40, v41);
            *(_DWORD *)v59 = 134217984;
            *(_QWORD *)&v59[4] = v42;
            _os_log_impl(&dword_22D296000, v38, OS_LOG_TYPE_INFO, "Store or upate MMCSContainerState.  And MMCSContainserState length:%lu", v59, 0xCu);
          }
        }
        objc_msgSend_persistData_forKey_error_(v18, v37, (uint64_t)v33, (uint64_t)CFSTR("MMCSContainerState"), 0);
        objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x24BDBCE60], v43, v44, v45, v46);
        *(_QWORD *)v59 = v47;
        v50 = objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v48, (uint64_t)v59, 8, v49);
        objc_msgSend_persistData_forKey_error_(v18, v51, v50, (uint64_t)CFSTR("MMCSContainerStateRefreshTime"), 0);
        goto LABEL_33;
      }
      if (v36)
      {
        v52 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v59 = 0;
          v53 = "ContainerState in MMCSRequestCompeletedCallBack,  but skip this time restore to avoid frequent update";
          goto LABEL_32;
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      v52 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v59 = 0;
        v53 = "No ContainerState in MMCSRequestCompeletedCallBack";
LABEL_32:
        _os_log_impl(&dword_22D296000, v52, OS_LOG_TYPE_INFO, v53, v59, 2u);
      }
    }
LABEL_33:

    if (a1)
    {
      objc_msgSend__removeFromController(a1, v54, v55, v56, v57);

    }
    CFRelease(a2);
    return;
  }
  if (IMOSLoggingEnabled())
  {
    v32 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v59 = 0;
      _os_log_impl(&dword_22D296000, v32, OS_LOG_TYPE_INFO, "_MMCSRequestCompletedCallback got back NULL results", v59, 2u);
    }
  }
}

void sub_22D299F6C(void *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *Object;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  NSObject *v88;
  uint8_t v89[16];

  v7 = objc_msgSend_serialControllerQueue(MMCSController, a2, a3, a4, a5);
  dispatch_assert_queue_V2(v7);
  if (a2)
  {
    CFRetain(a2);
    v11 = objc_msgSend_objectForKeyedSubscript_(a2, v8, *MEMORY[0x24BE63440], v9, v10);
    v12 = *MEMORY[0x24BE63470];
    v16 = objc_msgSend_objectForKeyedSubscript_(a2, v13, *MEMORY[0x24BE63470], v14, v15);
    v20 = (void *)objc_msgSend_objectForKeyedSubscript_(a2, v17, *MEMORY[0x24BE63428], v18, v19);
    Object = (void *)objc_msgSend_firstObject(v20, v21, v22, v23, v24);
    v29 = objc_msgSend_objectForKeyedSubscript_(Object, v26, v12, v27, v28);
    if (Object)
      v33 = v29 == 0;
    else
      v33 = 0;
    if (v33)
    {
      v46 = (void *)objc_msgSend_objectForKeyedSubscript_(Object, v30, *MEMORY[0x24BE633E8], v31, v32);
      v51 = objc_msgSend_unsignedIntegerValue(v46, v47, v48, v49, v50);
      v55 = (void *)objc_msgSend_objectForKeyedSubscript_(Object, v52, *MEMORY[0x24BE63488], v53, v54);
      v60 = objc_msgSend_bytes(v55, v56, v57, v58, v59);
      v64 = (void *)v60;
      if (v60)
      {
        v65 = (void *)MEMORY[0x24BDBCE50];
        v66 = MEMORY[0x22E310560](v60);
        v69 = objc_msgSend_dataWithBytes_length_(v65, v67, (uint64_t)v64, v66, v68);
        v64 = (void *)MMCSSignatureCopyData();
      }
      else
      {
        v69 = 0;
      }
      objc_msgSend_setMMCSError_(a1, v61, v16, v62, v63);
      if (!v16)
      {
        objc_msgSend_setFileHash_(a1, v70, v69, v72, v73);
        objc_msgSend_setProtocolFileSize_(a1, v74, v51, v75, v76);
        objc_msgSend_setAuthRequestData_(a1, v77, v11, v78, v79);
        objc_msgSend_setSignature_(a1, v80, (uint64_t)v64, v81, v82);
      }
      v83 = objc_msgSend_registrationBlock(a1, v70, v71, v72, v73);
      v88 = objc_msgSend_serialControllerQueue(MMCSController, v84, v85, v86, v87);
      dispatch_assert_queue_V2(v88);
      if (v83)
        (*(void (**)(uint64_t, BOOL))(v83 + 16))(v83, v16 == 0);

    }
    else
    {
      if (v29)
        v34 = v29;
      else
        v34 = v16;
      if (!v34)
        v34 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v30, *MEMORY[0x24BE633E0], 30, 0);
      objc_msgSend_setMMCSError_(a1, v30, v34, v31, v32);
      v39 = objc_msgSend_registrationBlock(a1, v35, v36, v37, v38);
      v44 = objc_msgSend_serialControllerQueue(MMCSController, v40, v41, v42, v43);
      dispatch_assert_queue_V2(v44);
      if (v39)
        (*(void (**)(uint64_t, _QWORD))(v39 + 16))(v39, 0);
    }
    CFRelease(a2);
  }
  else if (IMOSLoggingEnabled())
  {
    v45 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v89 = 0;
      _os_log_impl(&dword_22D296000, v45, OS_LOG_TYPE_INFO, "_registerMMCSPutFileCompletedCallback got back NULL results", v89, 2u);
    }
  }
}

void sub_22D29A8E4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  NSObject *v12;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend__registerPowerAssertionIfNeeded(*(void **)(a1 + 32), a2, a3, a4, a5);
    objc_msgSend__schedulePowerAssertionTimer(*(void **)(a1 + 32), v6, v7, v8, v9);
  }
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v12 = objc_msgSend_serialControllerQueue(MMCSController, a2, a3, a4, a5);
  dispatch_assert_queue_V2(v12);
  if (v10)
    (*(void (**)(uint64_t, BOOL))(v10 + 16))(v10, v11 != 0);
}

void sub_22D29A960(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_22D29A970(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_22D29A97C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  NSObject *v7;
  id Weak;
  id v9;
  uint64_t v10;
  char v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v5 = (int)a2;
  v40 = *MEMORY[0x24BDAC8D0];
  v7 = objc_msgSend_serialControllerQueue(MMCSController, a2, a3, a4, a5);
  dispatch_assert_queue_V2(v7);
  Weak = objc_loadWeak((id *)(a1 + 56));
  v9 = objc_loadWeak((id *)(a1 + 64));
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v10 + 24))
    v11 = v5;
  else
    v11 = 0;
  *(_BYTE *)(v10 + 24) = v11;
  v12 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v12)
    {
      v13 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v34 = 138412290;
        v35 = (uint64_t)v9;
        _os_log_impl(&dword_22D296000, v13, OS_LOG_TYPE_INFO, "Registered mmcs put transfer: %@", (uint8_t *)&v34, 0xCu);
      }
    }
  }
  else
  {
    if (v12)
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v34 = 138412802;
        v35 = objc_opt_class();
        v36 = 2112;
        v37 = (uint64_t)v9;
        v38 = 2112;
        v39 = objc_msgSend_mmcsError(v9, v15, v16, v17, v18);
        _os_log_impl(&dword_22D296000, v14, OS_LOG_TYPE_INFO, "%@ - %@ Could not compute signature for asset. Ignoring.  Error: %@", (uint8_t *)&v34, 0x20u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = objc_msgSend_mmcsError(v9, v19, v20, v21, v22);
        v34 = 138412546;
        v35 = (uint64_t)v9;
        v36 = 2112;
        v37 = v24;
        _os_log_impl(&dword_22D296000, v23, OS_LOG_TYPE_INFO, "Failed to register mmcs transfer: %@ error: %@", (uint8_t *)&v34, 0x16u);
      }
    }
    v25 = (void *)objc_msgSend_transfers(Weak, v19, v20, v21, v22);
    v30 = objc_msgSend_guid(v9, v26, v27, v28, v29);
    objc_msgSend_removeObjectForKey_(v25, v31, v30, v32, v33);
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

uint64_t sub_22D29B574(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  result = objc_msgSend_countByEnumeratingWithState_objects_count_(a1, a2, (uint64_t)&v22, (uint64_t)v26, 16);
  if (result)
  {
    v12 = result;
    v13 = *(_QWORD *)v23;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(a1);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v14);
        objc_msgSend_setRequestorID_(v15, v9, (uint64_t)a2, v10, v11);
        objc_msgSend_setRequestURL_(v15, v16, a3, v17, v18);
        objc_msgSend_setAuthToken_(v15, v19, a4, v20, v21);
        ++v14;
      }
      while (v12 != v14);
      result = objc_msgSend_countByEnumeratingWithState_objects_count_(a1, v9, (uint64_t)&v22, (uint64_t)v26, 16);
      v12 = result;
    }
    while (result);
  }
  return result;
}

uint64_t sub_22D29B68C(void *a1, char *a2, _QWORD *a3, uint64_t a4, uint64_t a5)
{
  int v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  size_t v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _DWORD *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v62;
  const char *v63;
  uint8_t *v64;
  NSObject *v65;
  uint64_t i;
  void *v67;
  _QWORD *v68;
  _QWORD *v69;
  uint8_t v70[16];
  uint8_t buf[2];
  __int16 v72;
  __int16 v73;

  v10 = objc_msgSend_count(a1, a2, (uint64_t)a3, a4, a5);
  v15 = v10;
  v16 = 8 * v10;
  if (a2)
  {
    v17 = malloc_type_malloc(8 * v10, 0x100004000313F17uLL);
    if (a4)
      goto LABEL_3;
LABEL_6:
    v18 = 0;
    if (a5)
      goto LABEL_4;
LABEL_7:
    v19 = 0;
    goto LABEL_8;
  }
  v17 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  v18 = malloc_type_malloc(v16, 0x10040436913F5uLL);
  if (!a5)
    goto LABEL_7;
LABEL_4:
  v19 = malloc_type_malloc(v16, 0xC0040B8AA526DuLL);
LABEL_8:
  v68 = (_QWORD *)a4;
  v69 = (_QWORD *)a5;
  if (a3)
    v20 = malloc_type_malloc(4 * v15, 0x100004052888210uLL);
  else
    v20 = 0;
  if (v15 < 1 || !v17 || !v18 || !v19)
    goto LABEL_51;
  if (!objc_msgSend_count(a1, v11, v12, v13, v14))
  {
LABEL_24:
    if (a2)
      *(_QWORD *)a2 = v17;
    if (a3)
      *a3 = v20;
    if (v68)
      *v68 = v18;
    if (v69)
      *v69 = v19;
    return 1;
  }
  v24 = 0;
  while (1)
  {
    v25 = (void *)objc_msgSend_objectAtIndex_(a1, v21, v24, v22, v23, v68);
    if (!objc_msgSend_authToken(v25, v26, v27, v28, v29))
    {
      if (!IMOSLoggingEnabled())
        goto LABEL_51;
      v62 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        goto LABEL_51;
      v73 = 0;
      v63 = " => No auth token supplied, failing";
      v64 = (uint8_t *)&v73;
LABEL_42:
      _os_log_impl(&dword_22D296000, v62, OS_LOG_TYPE_INFO, v63, v64, 2u);
      goto LABEL_51;
    }
    if (!objc_msgSend_signature(v25, v30, v31, v32, v33))
    {
      if (!IMOSLoggingEnabled())
        goto LABEL_51;
      v62 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        goto LABEL_51;
      v72 = 0;
      v63 = " => Empty signature for transfer, failing";
      v64 = (uint8_t *)&v72;
      goto LABEL_42;
    }
    if (!objc_msgSend_itemID(v25, v34, v35, v36, v37))
    {
      if (!IMOSLoggingEnabled())
        goto LABEL_51;
      v62 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        goto LABEL_51;
      *(_WORD *)buf = 0;
      v63 = " => Item ID is 0, failing";
      v64 = buf;
      goto LABEL_42;
    }
    objc_msgSend_signature(v25, v38, v39, v40, v41);
    v42 = MMCSSignatureCreateWithData();
    if (!v42)
      break;
    v47 = v42;
    v17[v24] = objc_msgSend_itemID(v25, v43, v44, v45, v46);
    v18[v24] = v47;
    v52 = (void *)objc_msgSend_authToken(v25, v48, v49, v50, v51);
    v19[v24] = objc_msgSend_UTF8String(v52, v53, v54, v55, v56);
    if (v20)
      v20[v24] = objc_msgSend_encryptionBehavior(v25, v57, v58, v59, v60) != 1;
    if (++v24 >= (unint64_t)objc_msgSend_count(a1, v57, v58, v59, v60))
      goto LABEL_24;
  }
  if (IMOSLoggingEnabled())
  {
    v65 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v70 = 0;
      _os_log_impl(&dword_22D296000, v65, OS_LOG_TYPE_INFO, " => Could not generate signature, failing", v70, 2u);
    }
  }
  if (v24)
  {
    for (i = 0; i != v24; ++i)
    {
      v67 = (void *)v18[i];
      if (v67)
        free(v67);
    }
  }
LABEL_51:
  if (a2)
    *(_QWORD *)a2 = 0;
  if (a3)
    *a3 = 0;
  if (v68)
    *v68 = 0;
  if (v69)
    *v69 = 0;
  free(v17);
  free(v20);
  free(v18);
  free(v19);
  return 0;
}

void sub_22D29BA34(void *a1, const char *a2, void **a3, void ***a4, void **a5)
{
  uint64_t v9;
  void **v10;

  LODWORD(v9) = objc_msgSend_count(a1, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
  if (a2 && *(_QWORD *)a2)
  {
    free(*(void **)a2);
    *(_QWORD *)a2 = 0;
  }
  if (a3 && *a3)
  {
    free(*a3);
    *a3 = 0;
  }
  if (a4)
  {
    v10 = *a4;
    if (*a4)
    {
      if ((int)v9 >= 1)
      {
        if (v9 <= 1uLL)
          v9 = 1;
        else
          v9 = v9;
        do
        {
          if (*v10)
            free(*v10);
          ++v10;
          --v9;
        }
        while (v9);
        v10 = *a4;
      }
      free(v10);
      *a4 = 0;
    }
  }
  if (a5)
  {
    if (*a5)
    {
      free(*a5);
      *a5 = 0;
    }
  }
}

void sub_22D29C270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22D29C288(uint64_t a1)
{
  uint64_t result;
  BOOL v3;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  if (result)
  {
    result = MMCSEngineIsActive();
    v3 = (_DWORD)result != 0;
  }
  else
  {
    v3 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

void sub_22D29C374(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char v5;
  NSObject *v7;
  _QWORD v8[5];
  char v9;

  if (*(_QWORD *)(a1 + 40))
  {
    v5 = (char)a2;
    v7 = objc_msgSend_replyQueue(*(void **)(a1 + 32), a2, a3, a4, a5);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = sub_22D29C3EC;
    v8[3] = &unk_24F8795E0;
    v8[4] = *(_QWORD *)(a1 + 40);
    v9 = v5;
    dispatch_async(v7, v8);
  }
}

uint64_t sub_22D29C3EC(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t sub_22D29C400(_QWORD *a1)
{
  return MEMORY[0x24BEDD108](a1[4], sel__registerFiles_preauthenticate_completionBlock_, a1[5], 0, a1[6]);
}

void sub_22D29C4C0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char v5;
  NSObject *v7;
  _QWORD v8[5];
  char v9;

  if (*(_QWORD *)(a1 + 40))
  {
    v5 = (char)a2;
    v7 = objc_msgSend_replyQueue(*(void **)(a1 + 32), a2, a3, a4, a5);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = sub_22D29C538;
    v8[3] = &unk_24F8795E0;
    v8[4] = *(_QWORD *)(a1 + 40);
    v9 = v5;
    dispatch_async(v7, v8);
  }
}

uint64_t sub_22D29C538(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t sub_22D29C54C(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__registerFiles_preauthenticate_completionBlock_, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

void sub_22D29C620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D29C638(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t v10[16];

  if (objc_msgSend_count(*(void **)(a1 + 32), a2, a3, a4, a5))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend__unregisterTransfers_(*(void **)(a1 + 40), v6, *(_QWORD *)(a1 + 32), v7, v8);
  }
  else if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_22D296000, v9, OS_LOG_TYPE_INFO, "Empty files array supplied to unregister, failing", v10, 2u);
    }
  }
}

dispatch_queue_t sub_22D29C72C()
{
  NSObject *v0;
  dispatch_queue_t result;

  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  result = dispatch_queue_create("com.apple.MMCSController", v0);
  qword_25408CC98 = (uint64_t)result;
  return result;
}

void sub_22D29C784()
{
  const char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  const char *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  uint8_t buf[4];
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D296000, v4, OS_LOG_TYPE_INFO, "MMCS prewarm is called", buf, 2u);
    }
  }
  v5 = objc_msgSend_stringByExpandingTildeInPath(CFSTR("/var/mobile/Library/SMS/prewarm.db"), v0, v1, v2, v3);
  v6 = objc_alloc(MEMORY[0x24BE4FEF0]);
  v8 = (void *)objc_msgSend_initWithPath_storeName_dataProtectionClass_(v6, v7, v5, (uint64_t)CFSTR("MMCSServices"), 0);
  v11 = (void *)objc_msgSend_dataForKey_error_(v8, v9, (uint64_t)CFSTR("MMCSContainerState"), 0, v10);
  v16 = (void *)objc_msgSend_date(MEMORY[0x24BDBCE60], v12, v13, v14, v15);
  objc_msgSend_timeIntervalSinceReferenceDate(v16, v17, v18, v19, v20);
  if (!v11 || (byte_25408CC80 & 1) != 0 || v21 - *(double *)&qword_25408CC88 <= 30.0)
  {
    if (IMOSLoggingEnabled())
    {
      v39 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D296000, v39, OS_LOG_TYPE_INFO, "There is no ContainerState from prewarm database or prewarm happened just now,  and skip prewarm", buf, 2u);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v27 = objc_msgSend_length(v11, v22, v24, v25, v26);
        *(_DWORD *)buf = 134217984;
        v43 = v27;
        _os_log_impl(&dword_22D296000, v23, OS_LOG_TYPE_INFO, "Read from prewarm database about ContainerState and length is: %lu.  Preform MMCS   prewarm", buf, 0xCu);
      }
    }
    v40 = *MEMORY[0x24BE63498];
    v41 = v11;
    v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v22, (uint64_t)&v41, (uint64_t)&v40, 1);
    v33 = (void *)objc_msgSend_date(MEMORY[0x24BDBCE60], v29, v30, v31, v32);
    objc_msgSend_timeIntervalSinceReferenceDate(v33, v34, v35, v36, v37);
    qword_25408CC88 = v38;
    byte_25408CC80 = 1;
    MEMORY[0x22E310590](0, v28, sub_22D29C9FC);
  }

}

void sub_22D29C9FC(int a1, CFTypeRef cf, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSObject *v6;
  _QWORD block[5];

  if (cf)
    CFRetain(cf);
  v6 = objc_msgSend_serialControllerQueue(MMCSController, (const char *)cf, a3, a4, a5);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22D29F0B4;
  block[3] = &unk_24F879868;
  block[4] = cf;
  dispatch_async(v6, block);
}

void sub_22D29CB3C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char v6;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[7];
  char v12;

  if (*(_QWORD *)(a1 + 40))
  {
    v6 = a3;
    v9 = objc_msgSend_replyQueue(*(void **)(a1 + 32), a2, a3, a4, a5);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = sub_22D29CBC8;
    v11[3] = &unk_24F8796E8;
    v10 = *(_QWORD *)(a1 + 40);
    v11[5] = a4;
    v11[6] = v10;
    v12 = v6;
    v11[4] = a2;
    dispatch_async(v9, v11);
  }
}

uint64_t sub_22D29CBC8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

uint64_t sub_22D29CBE0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const char *v6;
  uint64_t v7;
  __int128 v8;
  NSObject *v10;
  _QWORD v11[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[16];

  if (objc_msgSend_count(*(void **)(a1 + 32), a2, a3, a4, a5))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = sub_22D29CCE8;
    v11[3] = &unk_24F879738;
    v11[4] = v7;
    v8 = *(_OWORD *)(a1 + 56);
    v12 = *(_OWORD *)(a1 + 40);
    v13 = v8;
    v14 = *(_OWORD *)(a1 + 72);
    return objc_msgSend__registerTransfers_preauthenticate_completionBlock_((void *)v12, v6, v7, 0, (uint64_t)v11);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D296000, v10, OS_LOG_TYPE_INFO, "Empty files array supplied to get, failing", buf, 2u);
      }
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
}

uint64_t sub_22D29CCE8(uint64_t a1, const char *a2)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[16];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) == 0)
    return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 80) + 16))(*(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), 0, 0);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = *(void **)(a1 + 32);
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, a2, (uint64_t)&v16, (uint64_t)v21, 16);
  if (v5)
  {
    v7 = *(_QWORD *)v17;
    *(_QWORD *)&v6 = 138412290;
    v15 = v6;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (IMOSLoggingEnabled())
        {
          v11 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v15;
            *(_QWORD *)&buf[4] = v9;
            _os_log_impl(&dword_22D296000, v11, OS_LOG_TYPE_INFO, "[=MMCS-Timing=]  Starting get file for: %@", buf, 0xCu);
          }
        }
      }
      v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v10, (uint64_t)&v16, (uint64_t)v21, 16);
    }
    while (v5);
  }
  *(_QWORD *)buf = 0;
  if ((objc_msgSend__getTransfers_requestURL_requestorID_sourceAppID_token_error_(*(void **)(a1 + 40), v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), buf, v15) & 1) != 0)return objc_msgSend__setScheduledTransfers_block_(*(void **)(a1 + 40), v12, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 80), v13);
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
}

void sub_22D29CFD8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char v6;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[7];
  char v12;

  if (*(_QWORD *)(a1 + 40))
  {
    v6 = a3;
    v9 = objc_msgSend_replyQueue(*(void **)(a1 + 32), a2, a3, a4, a5);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = sub_22D29D064;
    v11[3] = &unk_24F8796E8;
    v10 = *(_QWORD *)(a1 + 40);
    v11[5] = a4;
    v11[6] = v10;
    v12 = v6;
    v11[4] = a2;
    dispatch_async(v9, v11);
  }
}

uint64_t sub_22D29D064(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

uint64_t sub_22D29D07C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v10;
  _QWORD v11[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint8_t buf[16];

  if (objc_msgSend_count(*(void **)(a1 + 32), a2, a3, a4, a5))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(unsigned __int8 *)(a1 + 96);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = sub_22D29D190;
    v11[3] = &unk_24F879788;
    v15 = *(_QWORD *)(a1 + 88);
    v11[4] = v7;
    v12 = *(_OWORD *)(a1 + 40);
    v13 = *(_OWORD *)(a1 + 56);
    v14 = *(_OWORD *)(a1 + 72);
    return objc_msgSend__registerTransfers_preauthenticate_completionBlock_((void *)v12, v6, v7, v8, (uint64_t)v11);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D296000, v10, OS_LOG_TYPE_INFO, "Empty files array supplied to put, failing", buf, 2u);
      }
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
  }
}

uint64_t sub_22D29D190(uint64_t a1, const char *a2)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[16];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) == 0)
    return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 88) + 16))(*(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 32), 0, 0);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = *(void **)(a1 + 32);
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, a2, (uint64_t)&v14, (uint64_t)v19, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (IMOSLoggingEnabled())
        {
          v10 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v8;
            _os_log_impl(&dword_22D296000, v10, OS_LOG_TYPE_INFO, "[=MMCS-Timing=]  Starting put file for: %@", buf, 0xCu);
          }
        }
      }
      v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v9, (uint64_t)&v14, (uint64_t)v19, 16);
    }
    while (v5);
  }
  *(_QWORD *)buf = 0;
  if ((objc_msgSend__putTransfers_requestURL_requestorID_transferID_sourceAppID_token_error_(*(void **)(a1 + 40), v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), buf) & 1) != 0)return objc_msgSend__setScheduledTransfers_block_(*(void **)(a1 + 40), v11, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 88), v12);
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
}

uint64_t sub_22D29D704(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  if (IMOSLoggingEnabled())
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v35 = v7;
      _os_log_impl(&dword_22D296000, v6, OS_LOG_TYPE_INFO, "Request cancel transferID %@", buf, 0xCu);
    }
  }
  objc_msgSend_lock(*(void **)(*(_QWORD *)(a1 + 40) + 104), v2, v3, v4, v5);
  v11 = (void *)objc_msgSend_objectForKeyedSubscript_(*(void **)(*(_QWORD *)(a1 + 40) + 96), v8, *(_QWORD *)(a1 + 32), v9, v10);
  v16 = (void *)objc_msgSend_copy(v11, v12, v13, v14, v15);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v29, (uint64_t)v33, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v30;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(v16);
        objc_msgSend__cancelRequest_(*(void **)(a1 + 40), v18, *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v23++), v19, v20);
      }
      while (v21 != v23);
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v18, (uint64_t)&v29, (uint64_t)v33, 16);
    }
    while (v21);
  }

  return objc_msgSend_unlock(*(void **)(*(_QWORD *)(a1 + 40) + 104), v24, v25, v26, v27);
}

void sub_22D29DC5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D29DC74(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v6 = *(void **)(a1 + 32);
  if (qword_25408CCA0 != -1)
    dispatch_once(&qword_25408CCA0, &unk_24F879848);
  v7 = (void *)objc_msgSend__MMCSICloudRequestHeadersCopy_(v6, v2, qword_25408CCA8, v3, v4);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v27, (uint64_t)v31, 16);
  if (v9)
  {
    v14 = v9;
    v15 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v7);
        v17 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        v18 = (void *)MEMORY[0x24BDD17C8];
        v19 = objc_msgSend_objectForKey_(v7, v10, v17, v12, v13);
        v23 = objc_msgSend_stringWithFormat_(v18, v20, (uint64_t)CFSTR("%@:%@\n"), v21, v22, v17, v19);
        objc_msgSend_appendString_(v5, v24, v23, v25, v26);
      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v27, (uint64_t)v31, 16);
    }
    while (v14);
  }
  if (objc_msgSend_length(v5, v10, v11, v12, v13))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v5;
  else

}

uint64_t sub_22D29DF78(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1 >= 8)
    return objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("Unknown (%d)"), a4, a5, a1);
  else
    return (uint64_t)*(&off_24F879888 + (int)a1);
}

uint64_t sub_22D29DFC4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_setProgress_(*(void **)(a1 + 32), a2, a3, a4, a5, *(double *)(a1 + 40));
}

uint64_t sub_22D29E148(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1 >= 6)
    return objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("Unknown (%d)"), a4, a5, a1);
  else
    return (uint64_t)*(&off_24F8798C8 + (int)a1);
}

uint64_t sub_22D29E194(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_setProgress_(*(void **)(a1 + 32), a2, a3, a4, a5, *(double *)(a1 + 40));
}

void sub_22D29E57C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  int isEqualToString;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  int v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v6 = *(void **)(a1 + 32);
  if (!v6)
  {
    if ((_IMWillLog() & 1) != 0)
    {
      v7 = (void *)MEMORY[0x24BDBCE50];
      v8 = (void *)MEMORY[0x24BDBCF48];
      v9 = objc_msgSend_localPath(*(void **)(a1 + 40), a2, a3, a4, a5);
      v13 = objc_msgSend_fileURLWithPath_(v8, v10, v9, v11, v12);
      v15 = (void *)objc_msgSend_dataWithContentsOfURL_options_error_(v7, v14, v13, 1, 0);
      v20 = objc_msgSend_SHA1HexString(v15, v16, v17, v18, v19);
      if (IMOSLoggingEnabled())
      {
        v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v26 = objc_msgSend_localPath(*(void **)(a1 + 40), v21, v22, v23, v24);
          v47 = 138412546;
          v48 = v26;
          v49 = 2112;
          v50 = v20;
          _os_log_impl(&dword_22D296000, v25, OS_LOG_TYPE_INFO, "Put file at path: %@  with hash: %@", (uint8_t *)&v47, 0x16u);
        }
      }
      goto LABEL_14;
    }
    v6 = *(void **)(a1 + 32);
  }
  v27 = (void *)objc_msgSend_domain(v6, a2, a3, a4, a5);
  isEqualToString = objc_msgSend_isEqualToString_(v27, v28, *MEMORY[0x24BE633E0], v29, v30);
  v32 = *(void **)(a1 + 32);
  if (!isEqualToString)
  {
    v33 = (void *)objc_msgSend_domain(v32, v21, v22, v23, v24);
    if (!objc_msgSend_isEqualToString_(v33, v34, (uint64_t)CFSTR("apple.mme"), v35, v36))
    {
LABEL_14:
      v42 = 0;
      v43 = 0;
      goto LABEL_15;
    }
    v32 = *(void **)(a1 + 32);
  }
  objc_msgSend_code(v32, v21, v22, v23, v24);
  v41 = objc_msgSend_code(*(void **)(a1 + 32), v37, v38, v39, v40);
  if (v41 >= 0x20)
    v42 = 0;
  else
    v42 = (0x8080E000 >> v41) & 1;
  v43 = 1;
LABEL_15:
  v44 = *(_QWORD *)(a1 + 32);
  if (!v44)
    objc_msgSend_setProgress_(*(void **)(a1 + 40), v21, v22, v23, v24, 1.0);
  v45 = objc_msgSend_completionBlock(*(void **)(a1 + 40), v21, v22, v23, v24);
  if (v45)
  {
    (*(void (**)(uint64_t, _QWORD, BOOL, uint64_t, uint64_t, _QWORD))(v45 + 16))(v45, *(_QWORD *)(a1 + 40), v44 == 0, v43, v42, *(_QWORD *)(a1 + 32));
  }
  else if (IMOSLoggingEnabled())
  {
    v46 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      LOWORD(v47) = 0;
      _os_log_impl(&dword_22D296000, v46, OS_LOG_TYPE_INFO, "No callback for put completion, just passing through", (uint8_t *)&v47, 2u);
    }
  }
}

void sub_22D29EA18(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  uint64_t v17;

  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    if (!v17)
      JUMPOUT(0x22D29E9C8);
    JUMPOUT(0x22D29E980);
  }
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(exc_buf);
}

void sub_22D29EA8C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int isEqualToString;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  NSObject *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  NSObject *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  NSObject *v80;
  int v81;
  uint64_t v82;
  __int16 v83;
  uint64_t v84;
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v10 = objc_msgSend_completionBlock(*(void **)(a1 + 32), a2, a3, a4, a5);
  v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (!v11)
  {
    objc_msgSend_setProgress_(*(void **)(a1 + 32), v6, v7, v8, v9, 1.0);
    if (objc_msgSend_localPath(*(void **)(a1 + 32), v34, v35, v36, v37))
    {
      v42 = (void *)objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v38, v39, v40, v41);
      v43 = *(_QWORD *)(a1 + 40);
      v48 = objc_msgSend_localPath(*(void **)(a1 + 32), v44, v45, v46, v47);
      objc_msgSend_moveItemAtPath_toPath_error_(v42, v49, v43, v48, 0);
      v32 = 0;
      v33 = 0;
      v31 = 1;
      goto LABEL_15;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v38, *MEMORY[0x24BE507C0], 10, 0);
    if (IMOSLoggingEnabled())
    {
      v50 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        v55 = objc_msgSend_guid(*(void **)(a1 + 32), v51, v52, v53, v54);
        v81 = 138412290;
        v82 = v55;
        _os_log_impl(&dword_22D296000, v50, OS_LOG_TYPE_INFO, "MMCS: We finished the _getItemCompleted successfully, but we dont have a file transfer local path for transfer guid %@", (uint8_t *)&v81, 0xCu);
      }
    }
    goto LABEL_14;
  }
  v12 = (void *)objc_msgSend_domain(v11, v6, v7, v8, v9);
  isEqualToString = objc_msgSend_isEqualToString_(v12, v13, *MEMORY[0x24BE633E0], v14, v15);
  v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (!isEqualToString)
  {
    v22 = (void *)objc_msgSend_domain(v21, v16, v17, v18, v19);
    if (objc_msgSend_isEqualToString_(v22, v23, (uint64_t)CFSTR("apple.mme"), v24, v25))
    {
      v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      goto LABEL_5;
    }
LABEL_14:
    v31 = 0;
    v32 = 0;
    v33 = 0;
    goto LABEL_15;
  }
LABEL_5:
  objc_msgSend_code(v21, v16, v17, v18, v19);
  v30 = objc_msgSend_code(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v26, v27, v28, v29);
  v31 = 0;
  if (v30 >= 0x20)
    v32 = 0;
  else
    v32 = (0x8080E000 >> v30) & 1;
  v33 = 1;
LABEL_15:
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    if (_IMWillLog())
    {
      v60 = (void *)MEMORY[0x24BDBCE50];
      v61 = (void *)MEMORY[0x24BDBCF48];
      v62 = objc_msgSend_localPath(*(void **)(a1 + 32), v56, v57, v58, v59);
      v66 = objc_msgSend_fileURLWithPath_(v61, v63, v62, v64, v65);
      v68 = (void *)objc_msgSend_dataWithContentsOfURL_options_error_(v60, v67, v66, 1, 0);
      v73 = objc_msgSend_SHA1HexString(v68, v69, v70, v71, v72);
      if (IMOSLoggingEnabled())
      {
        v74 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
        {
          v79 = objc_msgSend_localPath(*(void **)(a1 + 32), v75, v76, v77, v78);
          v81 = 138412546;
          v82 = v79;
          v83 = 2112;
          v84 = v73;
          _os_log_impl(&dword_22D296000, v74, OS_LOG_TYPE_INFO, "Got file at path: %@  with hash: %@", (uint8_t *)&v81, 0x16u);
        }
      }
    }
  }
  if (v10)
  {
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, _QWORD))(v10 + 16))(v10, *(_QWORD *)(a1 + 32), v31, v33, v32, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  }
  else if (IMOSLoggingEnabled())
  {
    v80 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
    {
      LOWORD(v81) = 0;
      _os_log_impl(&dword_22D296000, v80, OS_LOG_TYPE_INFO, "No callback for get completion, just passing through", (uint8_t *)&v81, 2u);
    }
  }
}

void sub_22D29F0A0()
{
  qword_25408CCA8 = (uint64_t)CFSTR("com.apple.Messenger/1.0");
}

void sub_22D29F0B4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  byte_25408CC80 = 0;
  v6 = (void *)objc_msgSend_date(MEMORY[0x24BDBCE60], a2, a3, a4, a5);
  objc_msgSend_timeIntervalSinceReferenceDate(v6, v7, v8, v9, v10);
  v12 = v11;
  v13 = *(double *)&qword_25408CC88;
  if (IMOSLoggingEnabled())
  {
    v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v23 = 138412546;
      v24 = objc_msgSend_date(MEMORY[0x24BDBCE60], v14, v18, v15, v16);
      v25 = 2048;
      v26 = v12 - v13;
      _os_log_impl(&dword_22D296000, v17, OS_LOG_TYPE_INFO, "MMCS prewarm comppletecallback at %@ and preward duration: %f", (uint8_t *)&v23, 0x16u);
    }
  }
  v19 = *(void **)(a1 + 32);
  if (v19)
  {
    v20 = objc_msgSend_objectForKeyedSubscript_(v19, v14, *MEMORY[0x24BE63470], v15, v16);
    if (v20 && IMOSLoggingEnabled())
    {
      v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v23 = 138412290;
        v24 = v20;
        _os_log_impl(&dword_22D296000, v21, OS_LOG_TYPE_INFO, "MMCS prewarm comppletecallback with error: %@", (uint8_t *)&v23, 0xCu);
      }
    }
    CFRelease(*(CFTypeRef *)(a1 + 32));
  }
  else if (IMOSLoggingEnabled())
  {
    v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_22D296000, v22, OS_LOG_TYPE_INFO, "mmcsWarmCompleteCallback got back NULL results", (uint8_t *)&v23, 2u);
    }
  }
}

__CFArray *parseMMCSError(uint64_t a1)
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  __CFArray *v6;
  __CFArray *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t i;
  const void *v18;
  unint64_t v19;
  const __CFString *v20;
  NSObject *v21;
  int v23;
  __CFArray *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v6 = (__CFArray *)objc_msgSend_initWithCapacity_(v2, v3, 8, v4, v5);
  if (a1)
    v7 = (__CFArray *)MMCSFlattenError();
  else
    v7 = 0;
  if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v23 = 138412546;
      v24 = v7;
      v25 = 2112;
      v26 = a1;
      _os_log_impl(&dword_22D296000, v12, OS_LOG_TYPE_INFO, "Flattened MMCS Array from MMCS %@ using error %@", (uint8_t *)&v23, 0x16u);
    }
  }
  if (objc_msgSend_count(v7, v8, v9, v10, v11))
  {
    for (i = 0; objc_msgSend_count(v7, v13, v14, v15, v16) > i; ++i)
    {
      if ((i & 1) != 0)
      {
        if (v6)
        {
LABEL_13:
          if (objc_msgSend_objectAtIndexedSubscript_(v7, v13, i, v15, v16))
          {
            v18 = (const void *)objc_msgSend_objectAtIndexedSubscript_(v7, v13, i, v15, v16);
            CFArrayAppendValue(v6, v18);
          }
        }
      }
      else if (v6)
      {
        goto LABEL_13;
      }
    }
  }
  v19 = objc_msgSend_count(v6, v13, v14, v15, v16);
  if (v19 <= 7)
  {
    do
    {
      if (v6)
      {
        if ((v19 & 1) != 0)
          v20 = (const __CFString *)&unk_24F87ABE8;
        else
          v20 = CFSTR("NoError");
        CFArrayAppendValue(v6, v20);
      }
      ++v19;
    }
    while (v19 != 8);
  }
  if (a1)
  {
    if (IMOSLoggingEnabled())
    {
      v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v23 = 138412290;
        v24 = v6;
        _os_log_impl(&dword_22D296000, v21, OS_LOG_TYPE_INFO, "Resulting error array %@", (uint8_t *)&v23, 0xCu);
      }
    }
  }
  return v6;
}

const __CFString *failReasonStringForMMCSError(uint64_t a1)
{
  __CFArray *v1;
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;

  if (!a1)
    return &stru_24F879C58;
  v1 = parseMMCSError(a1);
  v2 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  if ((unint64_t)objc_msgSend_count(v1, v3, v4, v5, v6) >= 2)
  {
    v11 = 0;
    do
    {
      v12 = (void *)objc_msgSend_objectAtIndexedSubscript_(v1, v7, v11 + 1, v9, v10);
      v17 = objc_msgSend_intValue(v12, v13, v14, v15, v16);
      v21 = (void *)objc_msgSend_objectAtIndexedSubscript_(v1, v18, v11, v19, v20);
      v25 = v21;
      if (!v17 && (objc_msgSend_isEqualToString_(v21, v22, (uint64_t)CFSTR("NoError"), v23, v24) & 1) != 0)
        break;
      v26 = objc_alloc(MEMORY[0x24BDD17C8]);
      v30 = (void *)objc_msgSend_initWithFormat_(v26, v27, (uint64_t)CFSTR("%@:%tu;"), v28, v29, v25, v17);
      v35 = objc_msgSend_length(v30, v31, v32, v33, v34);
      if ((unint64_t)(v35 + objc_msgSend_length(v2, v36, v37, v38, v39) - 130) <= 0xFFFFFFFFFFFFFF7ELL)
      {

        break;
      }
      objc_msgSend_appendString_(v2, v40, (uint64_t)v30, v41, v42);

      v47 = objc_msgSend_count(v1, v43, v44, v45, v46);
      v48 = v11 + 3;
      v11 += 2;
    }
    while (v47 > v48);
  }
  v50 = objc_msgSend_length(v2, v7, v8, v9, v10);
  v53 = objc_msgSend_substringWithRange_(v2, v51, 0, v50 - 1, v52);

  return (const __CFString *)v53;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

uint64_t IMLogBacktrace()
{
  return MEMORY[0x24BE50760]();
}

uint64_t IMLogSimulateCrashForProcess()
{
  return MEMORY[0x24BE50778]();
}

uint64_t IMOSLoggingEnabled()
{
  return MEMORY[0x24BE50790]();
}

uint64_t MMCSEngineCancelRequests()
{
  return MEMORY[0x24BE63338]();
}

uint64_t MMCSEngineCreateWithTargetDispatchQueue()
{
  return MEMORY[0x24BE63340]();
}

uint64_t MMCSEngineDestroy()
{
  return MEMORY[0x24BE63348]();
}

uint64_t MMCSEngineIsActive()
{
  return MEMORY[0x24BE63350]();
}

uint64_t MMCSFlattenError()
{
  return MEMORY[0x24BE63358]();
}

uint64_t MMCSGetItemStateIsDeterminant()
{
  return MEMORY[0x24BE63360]();
}

uint64_t MMCSGetItems()
{
  return MEMORY[0x24BE63368]();
}

uint64_t MMCSICloudRequestHeadersCopy()
{
  return MEMORY[0x24BE63370]();
}

uint64_t MMCSPutItemStateIsDeterminant()
{
  return MEMORY[0x24BE63378]();
}

uint64_t MMCSPutItems()
{
  return MEMORY[0x24BE63380]();
}

uint64_t MMCSRegisterItems()
{
  return MEMORY[0x24BE63390]();
}

uint64_t MMCSSignatureAndSchemeSize()
{
  return MEMORY[0x24BE63398]();
}

uint64_t MMCSSignatureCopyData()
{
  return MEMORY[0x24BE633A0]();
}

uint64_t MMCSSignatureCreateWithData()
{
  return MEMORY[0x24BE633A8]();
}

uint64_t MMCSUnregisterFile()
{
  return MEMORY[0x24BE633B0]();
}

uint64_t MMCSWarm()
{
  return MEMORY[0x24BE633B8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCB8](queue);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x24BEDD0D8](location);
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x24BDAFA10]();
}

