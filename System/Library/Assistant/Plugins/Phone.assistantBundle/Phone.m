void sub_226FFDB38(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  v2 = objc_alloc_init(MEMORY[0x24BE811A8]);
  objc_msgSend(*(id *)(a1 + 32), "incomingCall");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (objc_msgSend(*(id *)(a1 + 32), "incomingVideoCall"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    PHDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_226FFC000, v4, OS_LOG_TYPE_DEFAULT, "An incoming call exists. Answering it and returning success", v9, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "answerCall:", v3);
    v5 = objc_alloc_init(MEMORY[0x24BE811B8]);

  }
  else
  {
    PHDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_2270024F8(v8);

    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE811A8]), "initWithReason:", CFSTR("No call to answer"));
    v3 = v2;
  }

  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

}

void sub_226FFDDEC(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BE811A8]);
  objc_msgSend(*(id *)(a1 + 32), "incomingCall");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (objc_msgSend(*(id *)(a1 + 32), "incomingVideoCall"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    PHDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v3;
      _os_log_impl(&dword_226FFC000, v4, OS_LOG_TYPE_DEFAULT, "An incoming call exists. Declining it and returning success: %@", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "disconnectCall:withReason:", v3, 2);
    v5 = objc_alloc_init(MEMORY[0x24BE811B8]);
  }
  else
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "hasCurrentCalls");
    PHDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_226FFC000, v10, OS_LOG_TYPE_DEFAULT, "At least one call exists. Hanging up and returning success", (uint8_t *)&v12, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "disconnectCurrentCallAndActivateHeld");
      v11 = objc_alloc_init(MEMORY[0x24BE811B8]);
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_227002538(v10);

      v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE811A8]), "initWithReason:", CFSTR("No call to hang up"));
    }
    v5 = v11;
    v3 = 0;
  }

  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

}

void sub_226FFFD80(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  v4 = a3;
  if (v4)
  {
    PHDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_2270028EC(a1, (uint64_t)v4, v5);

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE811A8]), "initWithReason:", CFSTR("Unable to open url"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE814C8], "callStarted");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPhoneLogId:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isTelephonyProvider");

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 40), "handle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      TUGreenTeaLogOutgoingSiriCallToHandle();

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_226FFFFFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_227000018(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_227000028(uint64_t a1)
{

}

void sub_227000030(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  id v6;
  _QWORD *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "frontmostAudioOrVideoCall");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "callStatus");
    if (v4 == 3)
    {
      PHDefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226FFC000, v8, OS_LOG_TYPE_DEFAULT, "Outgoing call exists. Returning failure", buf, 2u);
      }

      v6 = objc_alloc(MEMORY[0x24BE811A8]);
      v7 = (_QWORD *)MEMORY[0x24BE823D0];
    }
    else
    {
      if (v4 != 4)
        goto LABEL_11;
      PHDefaultLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226FFC000, v5, OS_LOG_TYPE_DEFAULT, "Incoming call exists. Returning failure", buf, 2u);
      }

      v6 = objc_alloc(MEMORY[0x24BE811A8]);
      v7 = (_QWORD *)MEMORY[0x24BE823C8];
    }
    v9 = objc_msgSend(v6, "initWithErrorCode:", *v7);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
LABEL_11:
  v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (!v12)
  {
    objc_msgSend(*(id *)(a1 + 40), "peerInfoForCurrentCommand");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "idsIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "appPunchOutDialRequestWithEndpointIDSDestinationURI:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 40);
    v17 = *(void **)(a1 + 48);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = sub_227000230;
    v19[3] = &unk_24EF4A0E0;
    v20 = *(id *)(a1 + 56);
    objc_msgSend(v17, "_performAppPunchOutWithDialRequest:withServiceHelper:completion:", v16, v18, v19);

    goto LABEL_15;
  }
  v13 = *(_QWORD *)(a1 + 56);
  if (v13)
  {
    objc_msgSend(v12, "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);
LABEL_15:

  }
}

void sub_227000230(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  PHDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_226FFC000, v4, OS_LOG_TYPE_DEFAULT, "appPunchOutResult: %@", (uint8_t *)&v7, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v3, "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
}

void sub_2270003DC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_2270003EC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

id PHDefaultLog()
{
  if (qword_2558AE680 != -1)
    dispatch_once(&qword_2558AE680, &unk_24EF4A148);
  return (id)qword_2558AE678;
}

void sub_227000474()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calls.mobilephone", "Default");
  v1 = (void *)qword_2558AE678;
  qword_2558AE678 = (uint64_t)v0;

}

id PHOversizedLog()
{
  if (qword_2558AE690 != -1)
    dispatch_once(&qword_2558AE690, &unk_24EF4A168);
  return (id)qword_2558AE688;
}

void sub_2270004E4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calls.mobilephone", "Oversized");
  v1 = (void *)qword_2558AE688;
  qword_2558AE688 = (uint64_t)v0;

}

id PHOversizedLogQueue()
{
  if (qword_2558AE6A0 != -1)
    dispatch_once(&qword_2558AE6A0, &unk_24EF4A188);
  return (id)qword_2558AE698;
}

void sub_227000554()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)0xFFFFFFFE, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.calls.mobilephone.logging", v2);
  v1 = (void *)qword_2558AE698;
  qword_2558AE698 = (uint64_t)v0;

}

void sub_2270005E8()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBACF8]);
  v1 = (void *)qword_2558AE6A8;
  qword_2558AE6A8 = (uint64_t)v0;

}

uint64_t sub_2270007C0(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isDeleted") & 1) != 0 || (objc_msgSend(v2, "isTrashed") & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(v2, "isBlocked") ^ 1;

  return v3;
}

uint64_t sub_227000810(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (!objc_msgSend(v2, "isDataAvailable")
    || (objc_msgSend(v2, "isDeleted") & 1) != 0
    || (objc_msgSend(v2, "isTrashed") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v3 = objc_msgSend(v2, "isBlocked") ^ 1;
  }

  return v3;
}

uint64_t sub_227001D38(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  char v23;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "didSpecifyContacts");
  v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    objc_msgSend(v5, "start");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      objc_msgSend(*(id *)(a1 + 32), "start");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "compare:", v15);

      if (v16 == 1)
        goto LABEL_10;
    }
    objc_msgSend(*(id *)(a1 + 32), "end");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      objc_msgSend(*(id *)(a1 + 32), "end");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "date");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "compare:", v20);

      if (v21 == -1)
        goto LABEL_10;
    }
    objc_msgSend(*(id *)(a1 + 32), "isNew");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "BOOLValue"))
    {
      v23 = objc_msgSend(v3, "isRead");

      if ((v23 & 1) != 0)
      {
LABEL_10:
        v11 = 0;
        goto LABEL_15;
      }
    }
    else
    {

    }
    v11 = 1;
    goto LABEL_15;
  }
  objc_msgSend(v5, "contactsByVoicemailIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v3, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "specifiedContactIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "containsObject:", v10);

  }
  else
  {
    v11 = 0;
  }

LABEL_15:
  return v11;
}

uint64_t sub_227001F68(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;

  v3 = a2;
  if (!objc_msgSend(*(id *)(a1 + 32), "didSpecifyContacts"))
  {
    objc_msgSend(*(id *)(a1 + 32), "end");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(*(id *)(a1 + 32), "end");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "compare:", v11);

      if (v12 == -1)
        goto LABEL_8;
    }
    objc_msgSend(*(id *)(a1 + 32), "isNew");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "BOOLValue"))
    {
      v14 = objc_msgSend(v3, "read");

      if ((v14 & 1) != 0)
      {
LABEL_8:
        v7 = 0;
        goto LABEL_13;
      }
    }
    else
    {

    }
    v7 = 1;
    goto LABEL_13;
  }
  objc_msgSend(v3, "contactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "specifiedContactIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contactIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);

  }
  else
  {
    v7 = 0;
  }

LABEL_13:
  return v7;
}

void sub_2270024F8(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_226FFC000, log, OS_LOG_TYPE_ERROR, "No incoming call exists. Returning failure", v1, 2u);
}

void sub_227002538(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_226FFC000, log, OS_LOG_TYPE_ERROR, "No calls exist. Returning failure", v1, 2u);
}

void sub_227002578()
{
  uint64_t v0;
  os_log_t v1;

  sub_227000414();
  sub_2270003EC(&dword_226FFC000, v0, v1, "Could not find contact with identifier %@: %@");
  sub_22700042C();
}

void sub_2270025D8()
{
  uint64_t v0;
  os_log_t v1;

  sub_227000414();
  sub_2270003EC(&dword_226FFC000, v0, v1, "Could not read contents of %@: %@");
  sub_22700042C();
}

void sub_227002638()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_227000408();
  sub_2270003DC(&dword_226FFC000, v0, v1, "-[PHAssistantCall _validate]: No -callRecipient specified, failed validation", v2, v3, v4, v5, v6);
  sub_227000400();
}

void sub_227002664()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_227000408();
  sub_2270003DC(&dword_226FFC000, v0, v1, "-[PHAssistantCall _validate]: No -destinationID found, failed validation", v2, v3, v4, v5, v6);
  sub_227000400();
}

void sub_227002690()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_227000408();
  sub_2270003DC(&dword_226FFC000, v0, v1, "-[PHAssistantCall _validate]: FaceTime video not supported in CarPlay", v2, v3, v4, v5, v6);
  sub_227000400();
}

void sub_2270026BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_227000408();
  sub_2270003DC(&dword_226FFC000, v0, v1, "-[PHAssistantCall _validate]: device has no country code, failing validation", v2, v3, v4, v5, v6);
  sub_227000400();
}

void sub_2270026E8()
{
  uint64_t v0;
  os_log_t v1;

  sub_227000414();
  sub_2270003EC(&dword_226FFC000, v0, v1, "-[PHAssistantCall _validate]: Destination ID %@ is NOT VALID for country %@ according to PNIsValidPhoneNumberForCountry, failing validation");
  sub_22700042C();
}

void sub_227002748()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_227000408();
  sub_2270003DC(&dword_226FFC000, v0, v1, "-[PHAssistantCall _validate]: Call was FaceTime Video, but FaceTime Video is not available, failed validation", v2, v3, v4, v5, v6);
  sub_227000400();
}

void sub_227002774()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_227000408();
  sub_2270003DC(&dword_226FFC000, v0, v1, "-[PHAssistantCall _validate]: Call was FaceTime Video, but FaceTime Video is blocked, failed validation", v2, v3, v4, v5, v6);
  sub_227000400();
}

void sub_2270027A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_227000408();
  sub_2270003DC(&dword_226FFC000, v0, v1, "-[PHAssistantCall _validate]: Call was FaceTime Audio, but FaceTime Audio is not available, failed validation", v2, v3, v4, v5, v6);
  sub_227000400();
}

void sub_2270027CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_227000408();
  sub_2270003DC(&dword_226FFC000, v0, v1, "-[PHAssistantCall _validate]: Call was FaceTime Audio, but FaceTime Audio is blocked or unsupported, failed validation", v2, v3, v4, v5, v6);
  sub_227000400();
}

void sub_2270027F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_227000408();
  sub_2270003DC(&dword_226FFC000, v0, v1, "Airplane mode is on, failed validation", v2, v3, v4, v5, v6);
  sub_227000400();
}

void sub_227002824()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_227000408();
  sub_2270003DC(&dword_226FFC000, v0, v1, "-[PHAssistantCall _validate]: No cellular service, failed validation", v2, v3, v4, v5, v6);
  sub_227000400();
}

void sub_227002850(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_226FFC000, a2, OS_LOG_TYPE_ERROR, "Retrieving subscription info failed with error %@.", (uint8_t *)&v2, 0xCu);
  sub_22700042C();
}

void sub_2270028C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_227000408();
  sub_2270003DC(&dword_226FFC000, v0, v1, "-[PHAssistantCall _validate]: Call was telephony, but device doesn't support telephony calls, failed validation", v2, v3, v4, v5, v6);
  sub_227000400();
}

void sub_2270028EC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  sub_2270003EC(&dword_226FFC000, a2, a3, "Failed to perform app punch-out with URL %@: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  sub_22700042C();
}

uint64_t CPPhoneNumberCopyHomeCountryCode()
{
  return MEMORY[0x24BE04700]();
}

uint64_t CPPhoneNumberCopyNetworkCountryCode()
{
  return MEMORY[0x24BE04710]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t PNIsValidPhoneNumberForCountry()
{
  return MEMORY[0x24BE047A8]();
}

uint64_t TUGreenTeaLogOutgoingSiriCallToHandle()
{
  return MEMORY[0x24BEB4B40]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

