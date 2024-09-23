void __Block_byref_object_dispose_(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __destroy_helper_block_e8_32r(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 32), 8);
}

void __copy_helper_block_e8_32r(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 8);
}

id MAEGetActivationStateWithError()
{
  return (id)getActivationStateThroughMAD();
}

id getActivationState(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_opt_new();
  v3 = (id)objc_msgSend(v2, "getActivationState:", a1);

  return v3;
}

void sub_1D4F3F3A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void __destroy_helper_block_e8_32r40r(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 8);
  _Block_object_dispose(*(const void **)(a1 + 32), 8);
}

id isNSString(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

void __copy_helper_block_e8_32r40r(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 8);
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 8);
}

uint64_t createTunnel1SessionRequestFromMAD(_QWORD *a1, id a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  int v16;
  char v17;
  id v18;
  id MobileActivationError;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  int v27;
  id v28;
  id v30;
  id v31;
  id v32;
  id v33;

  v5 = a2;
  v6 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BasebandWaitCount"));
  if (v6)
  {
    v7 = v6;
    v8 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BasebandWaitCount"));
    v9 = isNSNumber(v8);

    if (!v9)
    {
      v18 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BasebandWaitCount"));
      MobileActivationError = createMobileActivationError((uint64_t)"createTunnel1SessionRequestFromMAD", 192, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid value for option (%@): %@"), CFSTR("BasebandWaitCount"), v18);
      goto LABEL_11;
    }
  }
  v10 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WaitForBasebandReady"));
  if (v10)
  {
    v11 = v10;
    v12 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WaitForBasebandReady"));
    v13 = isNSNumber(v12);

    if (!v13)
    {
      v22 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WaitForBasebandReady"));
      v20 = createMobileActivationError((uint64_t)"createTunnel1SessionRequestFromMAD", 197, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid value for option (%@): %@"), CFSTR("WaitForBasebandReady"), v22);
      v21 = v22;
      goto LABEL_13;
    }
  }
  v14 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WaitForBasebandReady"));
  if (objc_msgSend(v14, "BOOLValue"))
  {

  }
  else
  {
    v15 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BasebandWaitCount"));
    v16 = objc_msgSend(v15, "BOOLValue");

    if (!v16)
    {
      v18 = 0;
      goto LABEL_17;
    }
  }
  v33 = 0;
  v17 = waitForBaseband(&v33);
  v18 = v33;
  if ((v17 & 1) == 0)
  {
    MobileActivationError = createMobileActivationError((uint64_t)"createTunnel1SessionRequestFromMAD", 204, CFSTR("com.apple.MobileActivation.ErrorDomain"), -12, v18, CFSTR("Waiting for baseband failed."));
LABEL_11:
    v20 = MobileActivationError;
    v21 = v18;
LABEL_13:

    v23 = 0;
    goto LABEL_14;
  }
LABEL_17:
  v32 = v18;
  v23 = createTunnel1SessionInfo((uint64_t)&v32);
  v20 = v32;

  if (!v23)
  {
LABEL_14:
    v24 = 0;
    if (a3)
    {
LABEL_15:
      v25 = objc_retainAutorelease(v20);
      v26 = 0;
      *a3 = v25;
      goto LABEL_24;
    }
LABEL_23:
    v26 = 0;
    v25 = v20;
    goto LABEL_24;
  }
  v30 = v20;
  v31 = 0;
  v27 = createXMLRequest(v23, &v31, &v30);
  v24 = v31;
  v25 = v30;

  if (!v27)
  {
    v20 = v25;
    if (a3)
      goto LABEL_15;
    goto LABEL_23;
  }
  objc_msgSend(v24, "setValue:forHTTPHeaderField:", CFSTR("iOS Device Activator (MobileActivation-1006)"), CFSTR("User-Agent"));
  objc_msgSend(v24, "setValue:forHTTPHeaderField:", CFSTR("application/xml"), CFSTR("Accept"));
  v28 = (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://albert.apple.com/deviceservices/drmHandshake"));
  objc_msgSend(v24, "setURL:", v28);

  if (a1)
  {
    v24 = objc_retainAutorelease(v24);
    *a1 = v24;
  }
  v26 = 1;
LABEL_24:

  return v26;
}

uint64_t waitForBaseband(_QWORD *a1)
{
  id v2;
  void *v3;
  id v4;
  int v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id MobileActivationError;

  v2 = +[GestaltHlprMobileActivation getSharedInstance](GestaltHlprMobileActivation, "getSharedInstance");
  v3 = (void *)objc_msgSend(v2, "copyAnswer:", CFSTR("HasBaseband"));

  v4 = isNSNumber(v3);
  if (!v4)
  {
    MobileActivationError = createMobileActivationError((uint64_t)"waitForBaseband", 145, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to retrieve HasBaseband."));
LABEL_12:
    v9 = MobileActivationError;
    if (a1)
    {
LABEL_13:
      v9 = objc_retainAutorelease(v9);
      v10 = 0;
      *a1 = v9;
      goto LABEL_16;
    }
    goto LABEL_8;
  }
  if (objc_msgSend(v3, "BOOLValue"))
  {
    v4 = 0;
    v5 = 30;
    do
    {
      v6 = v4;
      v7 = +[GestaltHlprMobileActivation getSharedInstance](GestaltHlprMobileActivation, "getSharedInstance");
      v4 = (id)objc_msgSend(v7, "copyAnswer:", CFSTR("BasebandStatus"));

      v8 = isNSString(v4);
      if (!v8)
      {
        MobileActivationError = createMobileActivationError((uint64_t)"waitForBaseband", 157, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to retrieve BasebandStatus."));
        goto LABEL_12;
      }
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("BBNotReady")))
      {
        v9 = 0;
        goto LABEL_15;
      }
      sleep(2u);
      --v5;
    }
    while (v5);
    v9 = 0;
    if (a1)
      goto LABEL_13;
LABEL_8:
    v10 = 0;
    goto LABEL_16;
  }
  v9 = 0;
  v4 = 0;
LABEL_15:
  v10 = 1;
LABEL_16:

  return v10;
}

uint64_t createTunnel1ActivationRequestFromMAD(_QWORD *a1, id a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  int v19;
  char v20;
  id v21;
  id MobileActivationError;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  int v30;
  id v32;
  id v33;
  id v34;
  id v35;

  v7 = a2;
  v8 = a3;
  v9 = (id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BasebandWaitCount"));
  if (v9)
  {
    v10 = v9;
    v11 = (id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BasebandWaitCount"));
    v12 = isNSNumber(v11);

    if (!v12)
    {
      v21 = (id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BasebandWaitCount"));
      MobileActivationError = createMobileActivationError((uint64_t)"createTunnel1ActivationRequestFromMAD", 246, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid value for option (%@): %@"), CFSTR("BasebandWaitCount"), v21);
      goto LABEL_11;
    }
  }
  v13 = (id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("WaitForBasebandReady"));
  if (v13)
  {
    v14 = v13;
    v15 = (id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("WaitForBasebandReady"));
    v16 = isNSNumber(v15);

    if (!v16)
    {
      v25 = (id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("WaitForBasebandReady"));
      v23 = createMobileActivationError((uint64_t)"createTunnel1ActivationRequestFromMAD", 251, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid value for option (%@): %@"), CFSTR("WaitForBasebandReady"), v25);
      v24 = v25;
      goto LABEL_13;
    }
  }
  v17 = (id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("WaitForBasebandReady"));
  if (objc_msgSend(v17, "BOOLValue"))
  {

  }
  else
  {
    v18 = (id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BasebandWaitCount"));
    v19 = objc_msgSend(v18, "BOOLValue");

    if (!v19)
    {
      v21 = 0;
      goto LABEL_17;
    }
  }
  v35 = 0;
  v20 = waitForBaseband(&v35);
  v21 = v35;
  if ((v20 & 1) == 0)
  {
    MobileActivationError = createMobileActivationError((uint64_t)"createTunnel1ActivationRequestFromMAD", 258, CFSTR("com.apple.MobileActivation.ErrorDomain"), -12, v21, CFSTR("Waiting for baseband failed."));
LABEL_11:
    v23 = MobileActivationError;
    v24 = v21;
LABEL_13:

    v26 = 0;
    goto LABEL_14;
  }
LABEL_17:
  v34 = v21;
  v26 = createTunnel1ActivationInfo(v7, v8, (uint64_t)&v34);
  v23 = v34;

  if (!v26)
  {
LABEL_14:
    v27 = 0;
    if (a4)
    {
LABEL_15:
      v28 = objc_retainAutorelease(v23);
      v29 = 0;
      *a4 = v28;
      goto LABEL_24;
    }
LABEL_23:
    v29 = 0;
    v28 = v23;
    goto LABEL_24;
  }
  v32 = v23;
  v33 = 0;
  v30 = createActivationRequest(v26, &v33, 0, &v32);
  v27 = v33;
  v28 = v32;

  if (!v30)
  {
    v23 = v28;
    if (a4)
      goto LABEL_15;
    goto LABEL_23;
  }
  if (a1)
  {
    v27 = objc_retainAutorelease(v27);
    *a1 = v27;
  }
  v29 = 1;
LABEL_24:

  return v29;
}

uint64_t createFactoryActivationRequestFromMAD(_QWORD *a1, id a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  int v16;
  char v17;
  id v18;
  id MobileActivationError;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  int v27;
  id v28;
  id v30;
  id v31;
  id v32;
  id v33;

  v5 = a2;
  v6 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BasebandWaitCount"));
  if (v6)
  {
    v7 = v6;
    v8 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BasebandWaitCount"));
    v9 = isNSNumber(v8);

    if (!v9)
    {
      v18 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BasebandWaitCount"));
      MobileActivationError = createMobileActivationError((uint64_t)"createFactoryActivationRequestFromMAD", 296, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid value for option (%@): %@"), CFSTR("BasebandWaitCount"), v18);
      goto LABEL_11;
    }
  }
  v10 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WaitForBasebandReady"));
  if (v10)
  {
    v11 = v10;
    v12 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WaitForBasebandReady"));
    v13 = isNSNumber(v12);

    if (!v13)
    {
      v22 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WaitForBasebandReady"));
      v20 = createMobileActivationError((uint64_t)"createFactoryActivationRequestFromMAD", 301, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid value for option (%@): %@"), CFSTR("WaitForBasebandReady"), v22);
      v21 = v22;
      goto LABEL_13;
    }
  }
  v14 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WaitForBasebandReady"));
  if (objc_msgSend(v14, "BOOLValue"))
  {

  }
  else
  {
    v15 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BasebandWaitCount"));
    v16 = objc_msgSend(v15, "BOOLValue");

    if (!v16)
    {
      v18 = 0;
      goto LABEL_17;
    }
  }
  v33 = 0;
  v17 = waitForBaseband(&v33);
  v18 = v33;
  if ((v17 & 1) == 0)
  {
    MobileActivationError = createMobileActivationError((uint64_t)"createFactoryActivationRequestFromMAD", 308, CFSTR("com.apple.MobileActivation.ErrorDomain"), -12, v18, CFSTR("Waiting for baseband failed."));
LABEL_11:
    v20 = MobileActivationError;
    v21 = v18;
LABEL_13:

    v23 = 0;
    goto LABEL_14;
  }
LABEL_17:
  v32 = v18;
  v23 = createActivationInfo((uint64_t)&v32);
  v20 = v32;

  if (!v23)
  {
LABEL_14:
    v24 = 0;
    if (a3)
    {
LABEL_15:
      v25 = objc_retainAutorelease(v20);
      v26 = 0;
      *a3 = v25;
      goto LABEL_24;
    }
LABEL_23:
    v26 = 0;
    v25 = v20;
    goto LABEL_24;
  }
  v30 = v20;
  v31 = 0;
  v27 = createXMLRequest(v23, &v31, &v30);
  v24 = v31;
  v25 = v30;

  if (!v27)
  {
    v20 = v25;
    if (a3)
      goto LABEL_15;
    goto LABEL_23;
  }
  objc_msgSend(v24, "setValue:forHTTPHeaderField:", CFSTR("iOS Device Activator (MobileActivation-1006)"), CFSTR("User-Agent"));
  v28 = (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("http://raptor-dr.apple.com:8080/raptor/processor"));
  objc_msgSend(v24, "setURL:", v28);

  if (a1)
  {
    v24 = objc_retainAutorelease(v24);
    *a1 = v24;
  }
  v26 = 1;
LABEL_24:

  return v26;
}

uint64_t deactivateThroughMAD(_QWORD *a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v6;

  v6 = 0;
  v2 = deactivateDevice((uint64_t)&v6);
  v3 = v6;
  v4 = v3;
  if (a1 && (v2 & 1) == 0)
    *a1 = objc_retainAutorelease(v3);

  return v2;
}

uint64_t activateThroughMAD(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id MobileActivationError;
  uint64_t v22;
  char v23;
  uint64_t v24;
  id v25;
  void *v27;
  _QWORD *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  const __CFString *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = v6;
  v28 = a3;
  if (!v5)
  {
    v15 = createMobileActivationError((uint64_t)"activateThroughMAD", 373, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid input."));
    v16 = 0;
    v14 = 0;
    v9 = 0;
LABEL_18:
    v20 = 0;
    v19 = 0;
    goto LABEL_26;
  }
  v8 = (id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ActivationResponseHeaders"));
  v9 = v8;
  if (v8)
  {
    v10 = isNSDictionary(v8);

    if (!v10)
    {
      v15 = createMobileActivationError((uint64_t)"activateThroughMAD", 379, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid input."));
      v16 = 0;
      v14 = 0;
      goto LABEL_18;
    }
  }
  v27 = v7;
  v32 = 0;
  v11 = getActivationRecordFromData((uint64_t)v5, &v32);
  v12 = v32;
  v13 = v12;
  if (v11)
  {
    v14 = v11;
  }
  else
  {
    v31 = v12;
    v14 = getSessionActivationRecordFromData(v5, &v31);
    v17 = v31;

    if (!v14)
    {
      v15 = createMobileActivationError((uint64_t)"activateThroughMAD", 387, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v17, CFSTR("Failed to extract activation record."));

      v16 = 0;
      v20 = 0;
      v19 = 0;
      goto LABEL_25;
    }
    v13 = v17;
  }
  v18 = (id)objc_msgSend(v9, "objectForCaseInsensitiveKey:", CFSTR("ARS"));
  v19 = v18;
  if (!v18)
  {
    v20 = 0;
    goto LABEL_14;
  }
  v20 = isNSString(v18);

  if (!v20)
  {
    MobileActivationError = createMobileActivationError((uint64_t)"activateThroughMAD", 400, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid activation signature"));
    goto LABEL_20;
  }
  v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v19, 1);
  if (v20)
  {
LABEL_14:
    if (v11)
    {
      v33 = CFSTR("ActivationRecord");
      v34[0] = v14;
      v22 = 1;
      v16 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
      v29 = v13;
      v23 = handleActivationInfo(v16, (uint64_t)&v29);
      v15 = v29;

      v7 = v27;
      if ((v23 & 1) != 0)
        goto LABEL_29;
      goto LABEL_26;
    }
    v30 = v13;
    v24 = handleActivationInfoWithSession(v5, v20, (uint64_t)&v30);
    v15 = v30;

    if ((v24 & 1) != 0)
    {
      v16 = 0;
      v22 = 1;
      v7 = v27;
      goto LABEL_29;
    }
    v25 = createMobileActivationError((uint64_t)"activateThroughMAD", 415, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v15, CFSTR("Failed to activate device."));

    v16 = 0;
    v15 = v25;
    goto LABEL_25;
  }
  MobileActivationError = createMobileActivationError((uint64_t)"activateThroughMAD", 406, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Invalid activation signature"));
LABEL_20:
  v15 = MobileActivationError;

  v16 = 0;
LABEL_25:
  v7 = v27;
LABEL_26:
  if (v28)
  {
    v15 = objc_retainAutorelease(v15);
    v22 = 0;
    *v28 = v15;
  }
  else
  {
    v22 = 0;
  }
LABEL_29:

  return v22;
}

uint64_t mobileactivationErrorHasDomainAndErrorCode(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;

  v5 = a1;
  v6 = a2;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    v9 = *MEMORY[0x1E0CB3388];
    do
    {
      v10 = (id)objc_msgSend(v5, "domain");
      if (objc_msgSend(v10, "isEqualToString:", v7))
      {
        v11 = objc_msgSend(v5, "code");

        if (v11 == a3)
        {
          v8 = 1;
          goto LABEL_10;
        }
      }
      else
      {

      }
      v12 = (id)objc_msgSend(v5, "userInfo");
      v13 = (id)objc_msgSend(v12, "objectForKeyedSubscript:", v9);

      v5 = v13;
    }
    while (v13);
    v8 = 0;
  }
LABEL_10:

  return v8;
}

BOOL is_virtual_machine()
{
  size_t v2;
  int v3;

  v3 = 0;
  v2 = 4;
  return !sysctlbyname("kern.hv_vmm_present", &v3, &v2, 0, 0) && v3 == 1;
}

uint64_t createActivationRequest(void *a1, _QWORD *a2, int a3, _QWORD *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  id MobileActivationError;
  id v27;

  v7 = a1;
  if (!v7)
  {
    v9 = createMobileActivationError((uint64_t)"createActivationRequest", 36, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid input."));
    v8 = 0;
    v10 = 0;
    v16 = 0;
    v17 = 0;
    v11 = 0;
    if (a4)
    {
LABEL_18:
      v9 = objc_retainAutorelease(v9);
      v23 = 0;
      v19 = 0;
      *a4 = v9;
      goto LABEL_19;
    }
LABEL_13:
    v23 = 0;
    v19 = 0;
    goto LABEL_19;
  }
  v27 = 0;
  v8 = (id)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v7, 100, 0, &v27);
  v9 = v27;
  if (!v8)
  {
    v24 = createMobileActivationError((uint64_t)"createActivationRequest", 45, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v9, CFSTR("Failed to convert dictionary to data."));

    v10 = 0;
LABEL_16:
    v16 = 0;
    v17 = 0;
    v11 = 0;
    goto LABEL_17;
  }
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 4);
  if (!v10)
  {
    v24 = createMobileActivationError((uint64_t)"createActivationRequest", 51, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v9, CFSTR("Failed to convert data to string."));

    goto LABEL_16;
  }
  v11 = (id)objc_msgSend(MEMORY[0x1E0CB3780], "alphanumericCharacterSet");
  objc_msgSend(v11, "addCharactersInString:", CFSTR("*-._"));
  objc_msgSend(v11, "addCharactersInString:", CFSTR(" "));
  v12 = (id)objc_msgSend(v10, "stringByAddingPercentEncodingWithAllowedCharacters:", v11);

  v10 = (id)objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("+"));
  v13 = objc_alloc(MEMORY[0x1E0CB3940]);
  v14 = CFSTR("activation-info");
  if (a3)
    v14 = CFSTR("certify-me-info");
  v15 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("%@=%@"), v14, v10);
  v16 = v15;
  if (!v15)
  {
    v24 = createMobileActivationError((uint64_t)"createActivationRequest", 64, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v9, CFSTR("Failed to convert dictionary to URL encoding."));

    v17 = 0;
    goto LABEL_17;
  }
  v17 = (id)objc_msgSend(v15, "dataUsingEncoding:allowLossyConversion:", 4, 0);
  if (!v17)
  {
    MobileActivationError = createMobileActivationError((uint64_t)"createActivationRequest", 70, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v9, CFSTR("Failed to convert string to data."));
LABEL_23:
    v24 = MobileActivationError;

LABEL_17:
    v9 = v24;
    if (a4)
      goto LABEL_18;
    goto LABEL_13;
  }
  v18 = objc_alloc_init(MEMORY[0x1E0CB37A8]);
  if (!v18)
  {
    MobileActivationError = createMobileActivationError((uint64_t)"createActivationRequest", 76, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to allocate request."));
    goto LABEL_23;
  }
  v19 = v18;
  objc_msgSend(v18, "setCachePolicy:", 0);
  objc_msgSend(v19, "setTimeoutInterval:", 60.0);
  objc_msgSend(v19, "setHTTPMethod:", CFSTR("POST"));
  v20 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("application/x-www-form-urlencoded"));
  objc_msgSend(v19, "setValue:forHTTPHeaderField:", v20, CFSTR("Content-Type"));

  v21 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v17, "length"));
  objc_msgSend(v19, "setValue:forHTTPHeaderField:", v21, CFSTR("Content-Length"));

  objc_msgSend(v19, "setHTTPBody:", v17);
  objc_msgSend(v19, "setValue:forHTTPHeaderField:", CFSTR("iOS Device Activator (MobileActivation-1006)"), CFSTR("User-Agent"));
  v22 = (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://albert.apple.com/deviceservices/deviceActivation"));
  objc_msgSend(v19, "setURL:", v22);

  if (a2)
  {
    v19 = objc_retainAutorelease(v19);
    *a2 = v19;
  }
  v23 = 1;
LABEL_19:

  return v23;
}

id getSessionActivationRecordFromData(void *a1, _QWORD *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v11;

  v3 = a1;
  if (v3)
  {
    v11 = 0;
    v4 = (id)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v3, 0, 0, &v11);
    v5 = v11;
    v6 = isNSDictionary(v4);

    if (v6)
    {
      v6 = (id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ActivationRecord"));
      v7 = isNSDictionary(v6);

      if (v7)
      {
        v7 = v6;
        v6 = v7;
        if (!a2)
          goto LABEL_13;
      }
      else
      {
        v8 = createMobileActivationError((uint64_t)"getSessionActivationRecordFromData", 124, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Input data is missing activation record."));

        v5 = v8;
        if (!a2)
          goto LABEL_13;
      }
    }
    else
    {
      v7 = 0;
      if (!a2)
        goto LABEL_13;
    }
  }
  else
  {
    v5 = createMobileActivationError((uint64_t)"getSessionActivationRecordFromData", 113, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid input."));
    v7 = 0;
    v4 = 0;
    v6 = 0;
    if (!a2)
      goto LABEL_13;
  }
  if (!v7)
    *a2 = objc_retainAutorelease(v5);
LABEL_13:
  v9 = v7;

  return v9;
}

id getActivationRecordFromData(uint64_t a1, _QWORD *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  const __CFString *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v22;

  v22 = 0;
  v3 = (id)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a1, 0, 0, &v22);
  v4 = v22;
  v5 = isNSDictionary(v3);

  if (v5)
  {
    v6 = (id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AccountToken"));
    if (v6)
    {
      v7 = v6;
      v8 = (id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AccountTokenSignature"));
      if (v8)
      {
        v9 = v8;
        v10 = (id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DeviceCertificate"));

        if (v10)
        {
          v11 = v3;
          v5 = 0;
          if (!a2)
            goto LABEL_22;
          goto LABEL_20;
        }
      }
      else
      {

      }
    }
    v12 = CFSTR("device-activation");
    v13 = (id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("device-activation"));

    if (v13
      || (v12 = CFSTR("iphone-activation"),
          v14 = (id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("iphone-activation")), v14, v14))
    {
      v5 = (id)objc_msgSend(v3, "objectForKeyedSubscript:", v12);
    }
    else
    {
      v5 = 0;
    }
    v15 = isNSDictionary(v5);

    if (v15)
    {
      v16 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("activation-record"));

      v17 = isNSDictionary(v16);
      if (v17)
      {
        v11 = v16;
        v5 = v11;
        if (!a2)
          goto LABEL_22;
      }
      else
      {
        v19 = createMobileActivationError((uint64_t)"getActivationRecordFromData", 173, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Input data is missing activation record."));

        v11 = 0;
        v4 = v19;
        v5 = v16;
        if (!a2)
          goto LABEL_22;
      }
    }
    else
    {
      v18 = createMobileActivationError((uint64_t)"getActivationRecordFromData", 167, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Input data is missing activation ticket."));

      v11 = 0;
      v4 = v18;
      if (!a2)
        goto LABEL_22;
    }
  }
  else
  {
    v11 = 0;
    if (!a2)
      goto LABEL_22;
  }
LABEL_20:
  if (!v11)
    *a2 = objc_retainAutorelease(v4);
LABEL_22:
  v20 = v11;

  return v20;
}

id createMobileActivationError(uint64_t a1, uint64_t a2, id a3, uint64_t a4, void *a5, void *a6, ...)
{
  id v11;
  id v12;
  objc_class *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  va_list va;

  va_start(va, a6);
  v11 = a3;
  v12 = a5;
  v13 = (objc_class *)MEMORY[0x1E0CB37A0];
  v14 = a6;
  v15 = (void *)objc_msgSend([v13 alloc], "initWithFormat:arguments:", v14, va);

  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v17 = v16;
  if (v15)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0CB2D50]);
  if (v12)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CB3388]);
  if (os_variant_allows_internal_security_policies())
  {
    if (a1)
    {
      v18 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1);
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("FunctionName"));

    }
    if ((_DWORD)a2)
    {
      v19 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("SourceLine"));

    }
  }
  v20 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v11, a4, v17);

  return v20;
}

id isNSNumber(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

id isNSDictionary(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

id isNSData(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

void sub_1D4F42128(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1D4F42490(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1D4F427B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1D4F42B1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1D4F42E7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1D4F431B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1D4F434A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1D4F43770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4F43A08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4F43C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4F43EA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4F44134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1D4F443DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4F44628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4F448E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1D4F44BFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1D4F45188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_32b40r(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 7);
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 8);
}

void __destroy_helper_block_e8_32s40r(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 8);

}

void __copy_helper_block_e8_32s40b48r(uint64_t a1, uint64_t a2)
{
  id v4;

  v4 = *(id *)(a2 + 32);
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 7);
  _Block_object_assign((void *)(a1 + 48), *(const void **)(a2 + 48), 8);
}

void __destroy_helper_block_e8_32s40s48r(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 48), 8);

}

void sub_1D4F456EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1D4F45A70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1D4F45D8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_32s40b48r56r(uint64_t a1, uint64_t a2)
{
  id v4;

  v4 = *(id *)(a2 + 32);
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 7);
  _Block_object_assign((void *)(a1 + 48), *(const void **)(a2 + 48), 8);
  _Block_object_assign((void *)(a1 + 56), *(const void **)(a2 + 56), 8);
}

void __destroy_helper_block_e8_32s40s48r56r(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 56), 8);
  _Block_object_dispose(*(const void **)(a1 + 48), 8);

}

void sub_1D4F46300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4F464F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4F46778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1D4F46D10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 192), 8);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_32r40r48r(uint64_t a1, const void **a2)
{
  _Block_object_assign((void *)(a1 + 32), a2[4], 8);
  _Block_object_assign((void *)(a1 + 40), a2[5], 8);
  _Block_object_assign((void *)(a1 + 48), a2[6], 8);
}

void __destroy_helper_block_e8_32r40r48r(const void **a1)
{
  _Block_object_dispose(a1[6], 8);
  _Block_object_dispose(a1[5], 8);
  _Block_object_dispose(a1[4], 8);
}

void sub_1D4F47148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4F473DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t isInFieldCollected(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_opt_new();
  v3 = objc_msgSend(v2, "isInFieldCollected:", a1);

  return v3;
}

uint64_t isUCRTAvailable(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_opt_new();
  v3 = objc_msgSend(v2, "isUCRTAvailable:", a1);

  return v3;
}

id copyPCRTToken(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_msgSend(v2, "copyPCRTToken:", a1);

  return v3;
}

uint64_t isDeviceABrick(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_opt_new();
  v3 = objc_msgSend(v2, "isDeviceABrick:", a1);

  return v3;
}

id getUCRTActivationLockState(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_opt_new();
  v3 = (id)objc_msgSend(v2, "getUCRTActivationLockState:", a1);

  return v3;
}

id getActivationBuild(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_opt_new();
  v3 = (id)objc_msgSend(v2, "getActivationBuild:", a1);

  return v3;
}

id createTunnel1SessionInfo(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_opt_new();
  v3 = (id)objc_msgSend(v2, "createTunnel1SessionInfo:", a1);

  return v3;
}

id createTunnel1ActivationInfo(void *a1, id a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a2;
  v6 = a1;
  v7 = (void *)objc_opt_new();
  v8 = (id)objc_msgSend(v7, "createTunnel1ActivationInfo:options:error:", v6, v5, a3);

  return v8;
}

id createActivationInfo(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_opt_new();
  v3 = (id)objc_msgSend(v2, "createActivationInfo:", a1);

  return v3;
}

uint64_t handleActivationInfo(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a1;
  v4 = (void *)objc_opt_new();
  v5 = objc_msgSend(v4, "handleActivationInfo:withError:", v3, a2);

  return v5;
}

uint64_t handleActivationInfoWithSession(void *a1, id a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = a2;
  v6 = a1;
  v7 = (void *)objc_opt_new();
  v8 = objc_msgSend(v7, "handleActivationInfoWithSession:activationSignature:error:", v6, v5, a3);

  return v8;
}

uint64_t deactivateDevice(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_opt_new();
  v3 = objc_msgSend(v2, "deactivateDevice:", a1);

  return v3;
}

uint64_t reactivateDevice(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_opt_new();
  v3 = objc_msgSend(v2, "reactivateDevice:", a1);

  return v3;
}

uint64_t unbrickDevice(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_opt_new();
  v3 = objc_msgSend(v2, "unbrickDevice:", a1);

  return v3;
}

uint64_t recertifyDevice(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_opt_new();
  v3 = objc_msgSend(v2, "recertifyDeviceWithError:", a1);

  return v3;
}

id copyActivationRecord(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_msgSend(v2, "copyActivationRecord:", a1);

  return v3;
}

id issueClientCertificateLegacy(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a1;
  v4 = (void *)objc_opt_new();
  v5 = (id)objc_msgSend(v4, "issueClientCertificateLegacy:error:", v3, a2);

  return v5;
}

void updateBasebandTicket(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v11 = a1;
  v12 = a6;
  v13 = a5;
  v14 = (void *)objc_opt_new();
  if (!v11)
    v11 = dispatch_get_global_queue(0, 0);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3254779904;
  v17[2] = __updateBasebandTicket_block_invoke;
  v17[3] = &__block_descriptor_48_e8_32s40bs_e34_v24__0__NSDictionary_8__NSError_16l;
  v18 = v11;
  v19 = v12;
  v15 = v12;
  v16 = v11;
  objc_msgSend(v14, "updateBasebandTicket:baaCert:baaIntermediateCert:options:withCompletion:", a2, a3, a4, v13, v17);

}

void __updateBasebandTicket_block_invoke(uint64_t a1, int a2, id a3)
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3254779904;
  v8[2] = __updateBasebandTicket_block_invoke_2;
  v8[3] = &__block_descriptor_48_e8_32s40bs_e5_v8__0l;
  v5 = *(NSObject **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v9 = v4;
  v10 = v6;
  v7 = v4;
  dispatch_async(v5, v8);

}

uint64_t __updateBasebandTicket_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __copy_helper_block_e8_32s40b(uint64_t a1, uint64_t a2)
{
  id v4;

  v4 = *(id *)(a2 + 32);
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 7);
}

void __destroy_helper_block_e8_32s40s(uint64_t a1)
{

}

id getDCRTState(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a1;
  v4 = (void *)objc_opt_new();
  v5 = (id)objc_msgSend(v4, "getDCRTState:withError:", v3, a2);

  return v5;
}

id copyDCRT(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a1;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_msgSend(v4, "copyDCRT:withError:", v3, a2);

  return v5;
}

void issueDCRT(void *a1, void *a2, void *a3)
{
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a1;
  v6 = a3;
  v7 = a2;
  v8 = (void *)objc_opt_new();
  if (!v5)
    v5 = dispatch_get_global_queue(0, 0);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3254779904;
  v11[2] = __issueDCRT_block_invoke;
  v11[3] = &__block_descriptor_48_e8_32s40bs_e28_v24__0__NSData_8__NSError_16l;
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v8, "issueDCRT:withCompletion:", v7, v11);

}

void __issueDCRT_block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3254779904;
  block[2] = __issueDCRT_block_invoke_2;
  block[3] = &__block_descriptor_56_e8_32s40s48bs_e5_v8__0l;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __issueDCRT_block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

void __copy_helper_block_e8_32s40s48b(uint64_t a1, uint64_t a2)
{
  id v4;
  id v5;

  v4 = *(id *)(a2 + 32);
  v5 = *(id *)(a2 + 40);
  _Block_object_assign((void *)(a1 + 48), *(const void **)(a2 + 48), 7);
}

void __destroy_helper_block_e8_32s40s48s(id *a1)
{

}

uint64_t issueUCRT(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a1;
  v4 = (void *)objc_opt_new();
  v5 = objc_msgSend(v4, "issueUCRT:withError:", v3, a2);

  return v5;
}

void issueCollection(void *a1, void *a2, void *a3)
{
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a1;
  v6 = a3;
  v7 = a2;
  v8 = (void *)objc_opt_new();
  if (!v5)
    v5 = dispatch_get_global_queue(0, 0);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3254779904;
  v11[2] = __issueCollection_block_invoke;
  v11[3] = &__block_descriptor_48_e8_32s40bs_e17_v16__0__NSError_8l;
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v8, "issueCollection:withCompletion:", v7, v11);

}

void __issueCollection_block_invoke(uint64_t a1, id a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3254779904;
  v7[2] = __issueCollection_block_invoke_2;
  v7[3] = &__block_descriptor_48_e8_32s40bs_e5_v8__0l;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __issueCollection_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t ucrtUpgradeRequired(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_opt_new();
  v3 = objc_msgSend(v2, "ucrtUpgradeRequired:", a1);

  return v3;
}

uint64_t copyLegacyDeviceIdentity(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_opt_new();
  v3 = objc_msgSend(v2, "copyLegacyDeviceIdentity:", a1);

  return v3;
}

uint64_t deleteLegacyDeviceIdentity(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_opt_new();
  v3 = objc_msgSend(v2, "deleteLegacyDeviceIdentity:", a1);

  return v3;
}

id copyUCRTVersionInfo(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_msgSend(v2, "copyUCRTVersionInfo:", a1);

  return v3;
}

uint64_t MAGetActivationState()
{
  id v0;
  uint64_t v1;

  v0 = getActivationState(0);
  if ((objc_msgSend(v0, "isEqual:", CFSTR("Activated")) & 1) != 0)
    v1 = 1;
  else
    v1 = objc_msgSend(v0, "isEqual:", CFSTR("FactoryActivated"));

  return v1;
}

uint64_t MARequestReactivation()
{
  return reactivateDevice(0);
}

uint64_t MAUnbrickDevice()
{
  return unbrickDevice(0);
}

uint64_t MAUCRTActivationLocked()
{
  id v0;
  uint64_t v1;

  v0 = getUCRTActivationLockState(0);
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("UCRTActivationLocked"));

  return v1;
}

id parseDERCertificatesFromChain(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  int v10;
  void *v11;
  id v12;
  id MobileActivationError;
  unint64_t v15;
  _OWORD v16[3];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = v3;
  memset(v16, 0, sizeof(v16));
  v15 = 0;
  if (!v3)
  {
    MobileActivationError = createMobileActivationError((uint64_t)"parseDERCertificatesFromChain", 106, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid input."));
    goto LABEL_13;
  }
  v5 = objc_retainAutorelease(v3);
  v6 = objc_msgSend(v5, "bytes");
  CTParseCertificateSet(v6, v6 + objc_msgSend(v5, "length"), v16, 3, &v15);
  if ((_DWORD)v7 || !v15)
  {
    MobileActivationError = createMobileActivationError((uint64_t)"parseDERCertificatesFromChain", 115, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to parse certificate set: 0x%08x"), v7);
LABEL_13:
    v12 = MobileActivationError;
    v8 = 0;
    if (!a2)
      goto LABEL_16;
    goto LABEL_14;
  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v8)
  {
    if (v15)
    {
      v9 = 0;
      v10 = 0;
      do
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", *(_QWORD *)&v16[v9], *((_QWORD *)&v16[v9] + 1));
        objc_msgSend(v8, "setObject:atIndexedSubscript:", v11, v9);

        v9 = ++v10;
      }
      while (v15 > v10);
    }
    v8 = v8;
  }
  v12 = 0;
  if (a2)
  {
LABEL_14:
    if (!v8)
      *a2 = objc_retainAutorelease(v12);
  }
LABEL_16:

  return v8;
}

uint64_t MAECreateStorebagRequest(_QWORD *a1)
{
  id v2;
  id v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;

  v2 = objc_alloc(MEMORY[0x1E0CB37A8]);
  v3 = (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://init.itunes.apple.com/bag.xml?ix=5"));
  LODWORD(v4) = NETWORK_TIMEOUT_SECONDS;
  v5 = (void *)objc_msgSend(v2, "initWithURL:cachePolicy:timeoutInterval:", v3, 0, (double)v4);

  if (v5)
  {
    objc_msgSend(v5, "setValue:forHTTPHeaderField:", CFSTR("iOS Device Activator (MobileActivation-1006)"), CFSTR("User-Agent"));
    v6 = 0;
    if (a1)
      *a1 = objc_retainAutorelease(v5);
  }
  else
  {
    v6 = 0xFFFFFFFFLL;
  }

  return v6;
}

id MAEGetActivationURLFromStorebag(void *a1, void *a2)
{
  return MAEGetActivationURLFromStorebagWithError(a1, a2, 0);
}

id MAEGetActivationURLFromStorebagWithError(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v16;
  id v17;
  id v18;

  v5 = a1;
  v6 = a2;
  if (!v5)
  {
    v11 = createMobileActivationError((uint64_t)"MAEGetActivationURLFromStorebagWithError", 83, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid input."));
    v13 = 0;
    v7 = 0;
    v9 = 0;
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  v18 = 0;
  v7 = (id)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, 0, 0, &v18);
  v8 = v18;
  v9 = isNSDictionary(v7);

  if (!v9)
  {
    v11 = createMobileActivationError((uint64_t)"MAEGetActivationURLFromStorebagWithError", 92, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v8, CFSTR("Failed to create dictionary from data."));

    v13 = 0;
    goto LABEL_10;
  }
  v9 = (id)objc_msgSend(v7, "objectForKey:", CFSTR("bag"));
  v10 = isNSData(v9);

  if (!v10)
  {
    v11 = createMobileActivationError((uint64_t)"MAEGetActivationURLFromStorebagWithError", 98, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Storebag data is missing bag key."));

    v13 = 0;
LABEL_11:
    v12 = 0;
    if (!a3)
      goto LABEL_14;
    goto LABEL_12;
  }
  v17 = 0;
  v10 = (id)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v9, 0, 0, &v17);
  v11 = v17;

  v12 = isNSDictionary(v10);
  if (v12)
  {
    v12 = (id)objc_msgSend(v10, "objectForKey:", CFSTR("device-activation"));
    v13 = isNSString(v12);

    if (v13)
    {
      v13 = (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
      if (!a3)
        goto LABEL_14;
      goto LABEL_12;
    }
    v16 = createMobileActivationError((uint64_t)"MAEGetActivationURLFromStorebagWithError", 113, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Storebag data is missing device-activation key."));

  }
  else
  {
    v16 = createMobileActivationError((uint64_t)"MAEGetActivationURLFromStorebagWithError", 107, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v11, CFSTR("Failed to create dictionary from data"));

    v13 = 0;
  }
  v11 = v16;
  if (!a3)
    goto LABEL_14;
LABEL_12:
  if (!v13)
    *a3 = objc_retainAutorelease(v11);
LABEL_14:
  v14 = v13;

  return v14;
}

const __CFString *MAECopyUCRTToken()
{
  return &stru_1E98C4EE0;
}

uint64_t MAEActivateDeviceWithError(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v10;

  v5 = a1;
  v6 = a2;
  if (v5)
  {
    v10 = 0;
    v7 = activateThroughMAD(v5, v6, &v10);
    v8 = v10;
    if (!a3)
      goto LABEL_7;
  }
  else
  {
    v8 = createMobileActivationError((uint64_t)"MAEActivateDeviceWithError", 169, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid input."));
    v7 = 0;
    if (!a3)
      goto LABEL_7;
  }
  if ((v7 & 1) == 0)
    *a3 = objc_retainAutorelease(v8);
LABEL_7:

  return v7;
}

uint64_t MAETryActivate(void *a1, _BYTE *a2, void *a3)
{
  int v4;

  v4 = MAEActivateDeviceWithError(a1, a3, 0);
  if (a2)
    *a2 = v4;
  return (v4 - 1);
}

uint64_t MAECreateActivationRequestWithError(void *a1, _QWORD *a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  int v13;
  char v14;
  id v15;
  id v16;
  id MobileActivationError;
  char v18;
  id v19;
  uint64_t v20;
  id v22;
  id v23;
  id v24;
  id v25;

  v7 = a1;
  v8 = a3;
  v9 = v8;
  if (v8
    && (v10 = (id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("FactoryActivation")), v11 = isNSNumber(v10), v11, v10, v11)&& (v12 = (id)objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("FactoryActivation")), v13 = objc_msgSend(v12, "BOOLValue"), v12, v13))
  {
    v24 = 0;
    v25 = 0;
    v14 = createFactoryActivationRequestFromMAD(&v25, v9, &v24);
    v15 = v25;
    v16 = v24;
    if ((v14 & 1) == 0)
    {
      MobileActivationError = createMobileActivationError((uint64_t)"MAECreateActivationRequestWithError", 222, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v16, CFSTR("Failed to create activation request."));
      goto LABEL_11;
    }
  }
  else
  {
    v22 = 0;
    v23 = 0;
    v18 = createTunnel1ActivationRequestFromMAD(&v23, v7, v9, &v22);
    v15 = v23;
    v16 = v22;
    if ((v18 & 1) == 0)
    {
      MobileActivationError = createMobileActivationError((uint64_t)"MAECreateActivationRequestWithError", 227, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v16, CFSTR("Failed to create activation request."));
LABEL_11:
      v19 = MobileActivationError;

      if (a4)
      {
        v19 = objc_retainAutorelease(v19);
        v20 = 0;
        *a4 = v19;
      }
      else
      {
        v20 = 0;
      }
      goto LABEL_14;
    }
  }
  v19 = v16;
  if (a2)
  {
    v15 = objc_retainAutorelease(v15);
    *a2 = v15;
  }
  v20 = 1;
LABEL_14:

  return v20;
}

uint64_t MAECreateSessionRequestWithError(_QWORD *a1, void *a2, _QWORD *a3)
{
  uint64_t v5;
  id v6;
  id v7;
  char v8;
  id v10;
  id v11;

  v10 = 0;
  v11 = 0;
  LODWORD(v5) = createTunnel1SessionRequestFromMAD(&v11, a2, &v10);
  v6 = v11;
  v7 = v10;
  if (v6)
    v5 = v5;
  else
    v5 = 0;
  if (a1 && (_DWORD)v5)
    *a1 = objc_retainAutorelease(v6);
  if (a3)
    v8 = v5;
  else
    v8 = 1;
  if ((v8 & 1) == 0)
    *a3 = objc_retainAutorelease(v7);

  return v5;
}

uint64_t MAECreateActivationRequest(void *a1, id *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = a1;
  if (MAECreateActivationRequestWithError(0, a2, a3, 0))
  {
    if (v5)
    {
      v6 = MAEGetActivationURLFromStorebagWithError(v5, 0, 0);
      v7 = v6;
      v8 = 0;
      if (a2 && v6)
      {
        objc_msgSend(*a2, "setURL:", v6);
        v8 = 0;
      }
    }
    else
    {
      v8 = 0;
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
    v8 = 0xFFFFFFFFLL;
  }

  return v8;
}

uint64_t MAERecertifyDevice()
{
  return recertifyDevice(0);
}

uint64_t MAECreateActivationInfo()
{
  return 0;
}

uint64_t MAEGetBrickState()
{
  return isDeviceABrick(0);
}

BOOL MAEGetActivationBuild()
{
  id v0;
  _BOOL8 v1;

  v0 = getActivationBuild(0);
  v1 = objc_msgSend(v0, "compare:options:", CFSTR("12A"), 64) > 0;

  return v1;
}

id MAEGetActivationState()
{
  return (id)getActivationStateThroughMAD(0);
}

id MAEHandleActivationInfo(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  char v4;

  v1 = (objc_class *)MEMORY[0x1E0C99E08];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  v4 = handleActivationInfo(v2, 0);

  if ((v4 & 1) == 0)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("InvalidActivationRecord"), CFSTR("Error"));
  return v3;
}

uint64_t MAEDeactivateDevice()
{
  return deactivateThroughMAD(0);
}

id MAEGetDCRTStateWithError(uint64_t a1)
{
  return getDCRTState(0, a1);
}

id MAECopyDCRTWithError(uint64_t a1)
{
  return copyDCRT(0, a1);
}

void MAEIssueDCRTWithCallback(void *a1, void *a2, id a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3254779904;
  v7[2] = __MAEIssueDCRTWithCallback_block_invoke;
  v7[3] = &__block_descriptor_40_e8_32bs_e28_v24__0__NSData_8__NSError_16l;
  v8 = v5;
  v6 = v5;
  issueDCRT(a1, a2, v7);

}

void __copy_helper_block_e8_32b(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 7);
}

void __destroy_helper_block_e8_32s(uint64_t a1)
{

}

void MAEIssueDCRTWithCompletion(void *a1, void *a2, id a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3254779904;
  v7[2] = __MAEIssueDCRTWithCompletion_block_invoke;
  v7[3] = &__block_descriptor_40_e8_32bs_e28_v24__0__NSData_8__NSError_16l;
  v8 = v5;
  v6 = v5;
  issueDCRT(a1, a2, v7);

}

void MAEPerformCollectionWithCompletion(void *a1, void *a2, id a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3254779904;
  v7[2] = __MAEPerformCollectionWithCompletion_block_invoke;
  v7[3] = &__block_descriptor_40_e8_32bs_e17_v16__0__NSError_8l;
  v8 = v5;
  v6 = v5;
  issueCollection(a1, a2, v7);

}

BOOL MAEGetUCRTOSVersionInfoWithError(_QWORD *a1, _QWORD *a2, _QWORD *a3)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v14;

  v14 = 0;
  v6 = copyUCRTVersionInfo((uint64_t)&v14);
  v7 = v14;
  v8 = v7;
  if (v6)
  {
    v9 = (id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ProductVersion"));
    v10 = isNSString(v9);

    v11 = (id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BuildVersion"));
    v12 = isNSString(v11);

    if (a1 && objc_msgSend(v10, "length"))
      *a1 = objc_retainAutorelease(v10);
    if (a2 && objc_msgSend(v12, "length"))
    {
      v12 = objc_retainAutorelease(v12);
      *a2 = v12;
    }
  }
  else
  {
    v12 = 0;
    v10 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v7);
  }

  return v6 != 0;
}

uint64_t createXMLRequest(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  id MobileActivationError;
  id v15;
  id v17;

  v5 = a1;
  if (!v5)
  {
    v7 = createMobileActivationError((uint64_t)"createXMLRequest", 57, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid input."));
    v6 = 0;
    if (!a3)
    {
LABEL_12:
      v13 = 0;
      v9 = 0;
      goto LABEL_13;
    }
LABEL_8:
    v7 = objc_retainAutorelease(v7);
    v13 = 0;
    v9 = 0;
    *a3 = v7;
    goto LABEL_13;
  }
  v17 = 0;
  v6 = (id)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v5, 100, 0, &v17);
  v7 = v17;
  if (!v6)
  {
    MobileActivationError = createMobileActivationError((uint64_t)"createXMLRequest", 67, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v7, CFSTR("Failed to convert dictionary to data"));
    goto LABEL_11;
  }
  v8 = objc_alloc_init(MEMORY[0x1E0CB37A8]);
  if (!v8)
  {
    MobileActivationError = createMobileActivationError((uint64_t)"createXMLRequest", 74, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to allocate request."));
LABEL_11:
    v15 = MobileActivationError;

    v7 = v15;
    if (!a3)
      goto LABEL_12;
    goto LABEL_8;
  }
  v9 = v8;
  objc_msgSend(v8, "setCachePolicy:", 0);
  LODWORD(v10) = NETWORK_TIMEOUT_SECONDS;
  objc_msgSend(v9, "setTimeoutInterval:", (double)v10);
  objc_msgSend(v9, "setHTTPMethod:", CFSTR("POST"));
  v11 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("application/xml"));
  objc_msgSend(v9, "setValue:forHTTPHeaderField:", v11, CFSTR("Content-Type"));

  v12 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v6, "length"));
  objc_msgSend(v9, "setValue:forHTTPHeaderField:", v12, CFSTR("Content-Length"));

  objc_msgSend(v9, "setHTTPBody:", v6);
  if (a2)
  {
    v9 = objc_retainAutorelease(v9);
    *a2 = v9;
  }
  v13 = 1;
LABEL_13:

  return v13;
}

id security_create_external_representation(__SecKey *a1, _QWORD *a2, _QWORD *a3)
{
  CFDictionaryRef v5;
  CFDictionaryRef v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id MobileActivationError;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    a2 = createMobileActivationError((uint64_t)"security_create_external_representation", 328, CFSTR("com.apple.MobileActivation.ErrorDomain"), -2, 0, CFSTR("Invalid input."));
    v6 = 0;
    if (a3)
    {
LABEL_11:
      a2 = objc_retainAutorelease(a2);
      v11 = 0;
      *a3 = a2;
      goto LABEL_12;
    }
LABEL_7:
    v11 = 0;
    goto LABEL_12;
  }
  v5 = SecKeyCopyAttributes(a1);
  v6 = v5;
  if (!v5)
  {
    MobileActivationError = createMobileActivationError((uint64_t)"security_create_external_representation", 334, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to copy RK attributes."));
    goto LABEL_10;
  }
  v7 = (id)-[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6BB8]);
  if (!v7)
  {
    MobileActivationError = createMobileActivationError((uint64_t)"security_create_external_representation", 340, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, 0, CFSTR("Failed to encode RK as data."));
LABEL_10:
    a2 = MobileActivationError;
    if (a3)
      goto LABEL_11;
    goto LABEL_7;
  }
  v8 = v7;
  v9 = *MEMORY[0x1E0CD70C0];
  v10 = (id)-[__CFDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD70C0]);

  v11 = v8;
  if (a2)
  {
    v15 = v9;
    v12 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10 != 0);
    v16[0] = v12;
    *a2 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);

    a2 = 0;
  }
LABEL_12:

  return v11;
}

uint64_t X509PolicyCheckForBlockedKeys(uint64_t a1)
{
  uint64_t result;

  result = compare_octet_string(a1 + 88, (uint64_t)&BlockedYonkersSPKI);
  if (!(_DWORD)result)
    *(_QWORD *)(a1 + 240) &= 0xFFFFFFFFFFF3FFFFLL;
  return result;
}

uint64_t compare_octet_string(uint64_t a1, uint64_t a2)
{
  size_t v2;
  size_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 == v3)
    return memcmp(*(const void **)a1, *(const void **)a2, v2);
  if (v2 > v3)
    return 0xFFFFFFFFLL;
  return 1;
}

uint64_t compare_octet_string_raw(uint64_t a1, const void *a2, size_t a3)
{
  size_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  if (v3 == a3)
    return memcmp(*(const void **)a1, a2, a3);
  if (v3 > a3)
    return 0xFFFFFFFFLL;
  return 1;
}

uint64_t ccder_blob_decode_AlgorithmIdentifierNULL(unint64_t *a1, unint64_t *a2)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    if (*a1 > a1[1])
      goto LABEL_20;
    v5 = *a1;
    v6 = *a1;
    result = ccder_blob_decode_tl();
    if (!(_DWORD)result)
      return result;
    if (a2)
    {
      if (v6 < v5)
        goto LABEL_20;
      *a2 = v5;
      a2[1] = 0;
    }
    if (v5 == v6)
    {
      if (v5 <= a1[1] && *a1 <= v5)
      {
        *a1 = v5;
        return 1;
      }
    }
    else if (v5 <= v6)
    {
      result = ccder_blob_decode_tl();
      if (!(_DWORD)result)
        return result;
      if (v5 != v6)
        return 0;
      if (v5 <= a1[1] && *a1 <= v5)
      {
        *a1 = v5;
        return 1;
      }
    }
LABEL_20:
    __break(0x5519u);
  }
  return result;
}

uint64_t ccder_blob_check_null()
{
  return ccder_blob_decode_tl();
}

void CTParseCertificateSet(unint64_t a1, unint64_t a2, _OWORD *a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  unint64_t v11;
  __int128 v12;
  int v13;
  unint64_t v15;
  unint64_t v16;
  _OWORD v17[19];
  uint64_t v18;

  v6 = 0;
  v18 = *MEMORY[0x1E0C80C00];
  if (a1 < a2 && a4)
  {
    v8 = 0;
    v9 = a4 - 1;
    v10 = a3;
    v11 = (unint64_t)&a3[a4];
    while (1)
    {
      *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v17[17] = v12;
      v17[18] = v12;
      v17[15] = v12;
      v17[16] = v12;
      v17[13] = v12;
      v17[14] = v12;
      v17[11] = v12;
      v17[12] = v12;
      v17[9] = v12;
      v17[10] = v12;
      v17[7] = v12;
      v17[8] = v12;
      v17[5] = v12;
      v17[6] = v12;
      v17[3] = v12;
      v17[4] = v12;
      v17[1] = v12;
      v17[2] = v12;
      v17[0] = v12;
      v15 = a1;
      v16 = a2;
      X509CertificateParse((unint64_t *)v17, &v15);
      if (v13)
        break;
      a1 = v15;
      a2 = v16;
      if (v15 > v16 || (unint64_t)v10 >= v11 || v10 < a3)
        __break(0x5519u);
      *v10 = v17[0];
      v6 = v8 + 1;
      if (a1 < a2)
      {
        ++v10;
        if (v9 != v8++)
          continue;
      }
      goto LABEL_11;
    }
  }
  else
  {
LABEL_11:
    if (a5)
      *a5 = v6;
  }
}

void X509CertificateParseImplicit(uint64_t a1, unint64_t *a2, const void *a3, size_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  BOOL v36;
  int v37;
  int v38;
  unint64_t v40;
  int v48;
  unint64_t v49;
  unint64_t v50;
  unsigned __int8 v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  char v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  _OWORD v68[10];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v66 = 0;
  v67 = 0;
  v64 = 0xAAAAAAAAAAAAAAAALL;
  v65 = 0xAAAAAAAAAAAAAAAALL;
  v4 = *a2;
  v5 = a2[1];
  if (*a2 > v5)
    goto LABEL_183;
  v64 = *a2;
  v65 = v5;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  if (!ccder_blob_decode_tl())
    return;
  v10 = v67;
  v11 = v64;
  v12 = v67 + v64 - v4;
  if (__CFADD__(v67, v64 - v4))
    goto LABEL_185;
  if (v12 > v5 - v4)
    goto LABEL_183;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v12;
  v62 = 0xAAAAAAAAAAAAAAAALL;
  v63 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v11, v10))
    goto LABEL_184;
  v13 = v11 + v10;
  if (v11 > v13 || v13 > v65)
    goto LABEL_183;
  v62 = v11;
  v63 = v13;
  v60 = v11;
  v61 = v13;
  if (ccder_blob_decode_tl())
  {
    if (__CFADD__(v60, v66))
      goto LABEL_184;
    if (!ccder_blob_decode_uint64() || v60 != v60 + v66)
      return;
    if (v60 + v66 > v61)
      goto LABEL_183;
    v62 = v60 + v66;
    v63 = v61;
  }
  if (!ccder_blob_decode_tl())
    return;
  v15 = v62;
  v14 = v63;
  if (v63 < v62)
    goto LABEL_183;
  v16 = v66;
  if (v66 > v63 - v62)
    goto LABEL_183;
  *(_QWORD *)(a1 + 136) = v62;
  *(_QWORD *)(a1 + 144) = v16;
  if (__CFADD__(v15, v16))
    goto LABEL_184;
  v17 = v15 + v16;
  if (v15 > v17 || v17 > v14)
    goto LABEL_183;
  v62 = v17;
  if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v62, (unint64_t *)(a1 + 152))
    || !ccder_blob_decode_tl())
  {
    return;
  }
  v19 = v62;
  v18 = v63;
  if (v63 < v62)
    goto LABEL_183;
  v20 = v66;
  if (v66 > v63 - v62)
    goto LABEL_183;
  *(_QWORD *)(a1 + 120) = v62;
  *(_QWORD *)(a1 + 128) = v20;
  if (__CFADD__(v19, v20))
    goto LABEL_184;
  v21 = v19 + v20;
  if (v19 > v21 || v21 > v18)
    goto LABEL_183;
  v62 = v21;
  if (!ccder_blob_decode_tl())
    return;
  v23 = v62;
  v22 = v63;
  if (v63 < v62)
    goto LABEL_183;
  v24 = v66;
  if (v66 > v63 - v62)
    goto LABEL_183;
  *(_QWORD *)(a1 + 72) = v62;
  *(_QWORD *)(a1 + 80) = v24;
  if (__CFADD__(v23, v24))
    goto LABEL_184;
  v25 = v23 + v24;
  if (v23 > v25 || v25 > v22)
    goto LABEL_183;
  v62 = v25;
  if (!ccder_blob_decode_tl())
    return;
  v26 = v62;
  v27 = v63;
  if (v63 < v62)
    goto LABEL_183;
  v28 = v66;
  if (v66 > v63 - v62)
    goto LABEL_183;
  *(_QWORD *)(a1 + 104) = v62;
  *(_QWORD *)(a1 + 112) = v28;
  if (__CFADD__(v26, v28))
    goto LABEL_184;
  v29 = v26 + v28;
  if (v26 > v26 + v28 || v29 > v27)
    goto LABEL_183;
  v62 = v26 + v28;
  if (!ccder_blob_decode_tl())
    return;
  v30 = v62;
  v31 = v66;
  v32 = v62 - v29 + v66;
  if (__CFADD__(v62 - v29, v66))
    goto LABEL_185;
  if (v32 > v27 - v29)
    goto LABEL_183;
  *(_QWORD *)(a1 + 88) = v29;
  *(_QWORD *)(a1 + 96) = v32;
  if (__CFADD__(v30, v31))
    goto LABEL_184;
  v33 = v30 + v31;
  if (v30 > v33 || v33 > v63)
    goto LABEL_183;
  v61 = v63;
  v62 = v33;
  v60 = v33;
  if ((ccder_blob_decode_tl() & 1) != 0)
    return;
  if (v62 > v63)
    goto LABEL_183;
  v60 = v62;
  v61 = v63;
  if ((ccder_blob_decode_tl() & 1) != 0)
    return;
  if (v62 > v63)
    goto LABEL_183;
  v60 = v62;
  v61 = v63;
  if (!ccder_blob_decode_tl())
  {
LABEL_162:
    if (*(_QWORD *)(a1 + 32) < 3uLL)
    {
      if (v62 != v63)
        return;
LABEL_167:
      if (__CFADD__(v64, v67))
        goto LABEL_184;
      if (v64 > v64 + v67 || v64 + v67 > v65)
        goto LABEL_183;
      v64 += v67;
      if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v64, (unint64_t *)(a1 + 40)))
        return;
      *(_QWORD *)&v68[0] = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v68[0] + 1) = 0xAAAAAAAAAAAAAAAALL;
      v58 = 0;
      if (!ccder_blob_decode_bitstring())
        return;
      if (v58 < 0xFFFFFFFFFFFFFFF9)
      {
        if (*((_QWORD *)&v68[0] + 1) >= *(_QWORD *)&v68[0])
        {
          v49 = (v58 + 7) >> 3;
          if (v49 <= *((_QWORD *)&v68[0] + 1) - *(_QWORD *)&v68[0])
          {
            *(_QWORD *)(a1 + 56) = *(_QWORD *)&v68[0];
            *(_QWORD *)(a1 + 64) = v49;
            v50 = v65;
            if (v64 <= v65)
            {
              *a2 = v64;
              a2[1] = v50;
              return;
            }
          }
        }
        goto LABEL_183;
      }
LABEL_185:
      __break(0x5500u);
LABEL_186:
      __break(0x5507u);
      return;
    }
    if (v63 <= a2[1] && *a2 <= v63)
    {
      *a2 = v63;
      goto LABEL_167;
    }
LABEL_183:
    __break(0x5519u);
    goto LABEL_184;
  }
  v58 = 0xAAAAAAAAAAAAAAAALL;
  v59 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v60, v66))
    goto LABEL_184;
  if (v60 > v60 + v66 || v60 + v66 > v61)
    goto LABEL_183;
  v58 = v60;
  v59 = v60 + v66;
  if (!ccder_blob_decode_tl() || !v66)
    return;
  v34 = v58;
  if (__CFADD__(v58, v66))
LABEL_184:
    __break(0x5513u);
  v35 = v58 + v66;
  if (v58 > v58 + v66 || v35 > v59)
    goto LABEL_183;
  v59 = v58 + v66;
  *(_BYTE *)(a1 + 266) = 0;
  memset(&v68[2], 0, 128);
  if (a3)
    v36 = a4 == 0;
  else
    v36 = 1;
  v37 = !v36;
  memset(v68, 0, 32);
  if (v34 < v35)
  {
    v51 = 0;
    v38 = 0;
    do
    {
      v56 = 0xAAAAAAAAAAAAAAAALL;
      v57 = 0xAAAAAAAAAAAAAAAALL;
      v55 = 0;
      v54 = 0;
      if ((ccder_blob_decode_tl() & 1) == 0)
        return;
      v52 = 0xAAAAAAAAAAAAAAAALL;
      v53 = 0xAAAAAAAAAAAAAAAALL;
      if (__CFADD__(v58, v54))
        goto LABEL_184;
      if (v58 > v58 + v54 || v58 + v54 > v59)
        goto LABEL_183;
      v52 = v58;
      v53 = v58 + v54;
      if (!ccder_blob_decode_tl())
        return;
      if (v53 < v52 || v66 > v53 - v52)
        goto LABEL_183;
      v56 = v52;
      v57 = v66;
      if (__CFADD__(v52, v66))
        goto LABEL_184;
      if (v52 > v52 + v66 || v52 + v66 > v53)
        goto LABEL_183;
      v52 += v66;
      if (!der_get_BOOLean(&v52, 1, &v55) || !ccder_blob_decode_tl())
        return;
      if (__CFADD__(v52, v66))
        goto LABEL_184;
      if (v53 != v52 + v66)
        return;
      if (v37 && !compare_octet_string_raw((uint64_t)&v56, a3, a4))
      {
        if (v53 < v52)
          goto LABEL_183;
        v40 = v66;
        if (v66 > v53 - v52)
          goto LABEL_183;
        *(_QWORD *)(a1 + 248) = v52;
        *(_QWORD *)(a1 + 256) = v40;
      }
      if (v57 == 3)
      {
        if (*(_WORD *)v56 == 7509 && *(_BYTE *)(v56 + 2) == 15)
        {
          if ((v38 & 1) != 0 || (X509ExtensionParseKeyUsage() & 1) == 0)
            return;
          v38 |= 1u;
          goto LABEL_152;
        }
        if (*(_WORD *)v56 == 7509 && *(_BYTE *)(v56 + 2) == 19)
        {
          if ((v38 & 2) != 0
            || (X509ExtensionParseBasicConstraints(&v52, (_QWORD *)(a1 + 200), (_BYTE *)(a1 + 265)) & 1) == 0)
          {
            return;
          }
          v38 |= 2u;
          goto LABEL_152;
        }
        if (*(_WORD *)v56 == 7509 && *(_BYTE *)(v56 + 2) == 35)
        {
          if ((v38 & 4) != 0
            || (X509ExtensionParseAuthorityKeyIdentifier(&v52, (unint64_t *)(a1 + 168), (_QWORD *)(a1 + 176)) & 1) == 0)
          {
            return;
          }
          v38 |= 4u;
          goto LABEL_152;
        }
        if (*(_WORD *)v56 == 7509 && *(_BYTE *)(v56 + 2) == 14)
        {
          if ((v38 & 8) != 0
            || (X509ExtensionParseSubjectKeyIdentifier(&v52, (unint64_t *)(a1 + 184), (_QWORD *)(a1 + 192)) & 1) == 0)
          {
            return;
          }
          v38 |= 8u;
          goto LABEL_152;
        }
        if (*(_WORD *)v56 == 7509 && *(_BYTE *)(v56 + 2) == 37)
        {
          if ((v38 & 0x10) != 0
            || (X509ExtensionParseExtendedKeyUsage(&v52, (unint64_t *)(a1 + 208), (_QWORD *)(a1 + 216)) & 1) == 0)
          {
            return;
          }
          v38 |= 0x10u;
          goto LABEL_152;
        }
        if (*(_WORD *)v56 == 7509 && *(_BYTE *)(v56 + 2) == 17)
        {
          if ((v38 & 0x20) != 0
            || (X509ExtensionParseSubjectAltName(&v52, (unint64_t *)(a1 + 224), (_QWORD *)(a1 + 232)) & 1) == 0)
          {
            return;
          }
          v38 |= 0x20u;
          goto LABEL_152;
        }
      }
      else if (v57 >= 8 && *(_DWORD *)v56 == -2042067414 && *(_DWORD *)(v56 + 3) == 1684273030)
      {
        if (!X509CertificateVerifyOnlyOneAppleExtension((uint64_t)&v56, (uint64_t)v68, v51))
          return;
        X509ExtensionParseAppleExtension(&v52, v56, v57, (uint64_t *)(a1 + 240), (unint64_t *)(a1 + 248), v37);
        if (!v48)
          return;
        if (v51 == 0xFF)
          goto LABEL_186;
        ++v51;
        goto LABEL_152;
      }
      if (__CFADD__(v52, v66))
        goto LABEL_184;
      if (v52 > v52 + v66 || v52 + v66 > v53)
        goto LABEL_183;
      v52 += v66;
      if (v55)
        *(_BYTE *)(a1 + 266) = 1;
LABEL_152:
      if (v52 != v53)
        return;
      if (__CFADD__(v58, v54))
        goto LABEL_184;
      v34 = v58 + v54;
      if (v58 > v58 + v54)
        goto LABEL_183;
      v35 = v59;
      if (v34 > v59)
        goto LABEL_183;
      v58 += v54;
    }
    while (v34 < v59);
  }
  if (v34 == v35)
  {
    if (v34 > v63 || v62 > v34)
      goto LABEL_183;
    v62 = v34;
    goto LABEL_162;
  }
}

uint64_t der_get_BOOLean(_QWORD *a1, int a2, _BYTE *a3)
{
  if (*a1 > a1[1])
    __break(0x5519u);
  if ((ccder_blob_decode_tl() & 1) != 0 || !a2)
    return 0;
  if (a3)
    *a3 = 0;
  return 1;
}

uint64_t X509ExtensionParseKeyUsage()
{
  uint64_t result;

  result = ccder_blob_decode_bitstring();
  if ((_DWORD)result)
    return 0;
  return result;
}

uint64_t X509ExtensionParseBasicConstraints(_QWORD *a1, _QWORD *a2, _BYTE *a3)
{
  uint64_t result;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    result = der_get_BOOLean(a1, 1, a3);
    if ((_DWORD)result)
    {
      if (ccder_blob_decode_uint64())
      {
        if (!*a3)
          return 0;
        *a2 = 0xAAAAAAAAAAAAAAAALL;
        *a2 = 0xAAAAAAAAAAAAAAABLL;
      }
      return 1;
    }
  }
  return result;
}

uint64_t X509ExtensionParseAuthorityKeyIdentifier(unint64_t *a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    v7 = *a1;
    if (*a1 >= 0x5555555555555556)
      goto LABEL_15;
    if (v7 - 0x5555555555555556 != a1[1])
      return 0;
    if (v7 > v7 - 0x5555555555555556)
      goto LABEL_16;
    v10 = *a1;
    v11 = v7 - 0x5555555555555556;
    result = ccder_blob_decode_tl();
    if ((_DWORD)result)
    {
      if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL)
        goto LABEL_16;
      *a2 = v10;
      *a3 = 0xAAAAAAAAAAAAAAAALL;
    }
    v8 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
LABEL_15:
      __break(0x5513u);
    }
    else
    {
      v9 = v8 - 0x5555555555555556;
      if (v8 <= v8 - 0x5555555555555556 && v9 <= a1[1])
      {
        *a1 = v9;
        return 1;
      }
    }
LABEL_16:
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseSubjectKeyIdentifier(unint64_t *a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;
  unint64_t v11;
  unint64_t v12;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    v7 = a1[1];
    v8 = v7 >= *a1;
    v9 = v7 - *a1;
    if (!v8 || v9 < 0xAAAAAAAAAAAAAAAALL)
      goto LABEL_13;
    *a2 = *a1;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    v11 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    v12 = v11 - 0x5555555555555556;
    if (v11 > v11 - 0x5555555555555556 || v12 > a1[1])
LABEL_13:
      __break(0x5519u);
    *a1 = v12;
  }
  return result;
}

uint64_t X509ExtensionParseExtendedKeyUsage(unint64_t *a1, unint64_t *a2, _QWORD *a3)
{
  int v6;
  uint64_t result;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v6 = ccder_blob_decode_tl();
  result = 0;
  if (v6)
  {
    if (*a1 > a1[1])
      goto LABEL_11;
    v10 = *a1;
    v11 = a1[1];
    result = ccder_blob_decode_tl();
    if (!(_DWORD)result)
      return result;
    if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL)
      goto LABEL_11;
    *a2 = v10;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    v8 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    v9 = v8 - 0x5555555555555556;
    if (v8 > v8 - 0x5555555555555556 || v9 > a1[1])
LABEL_11:
      __break(0x5519u);
    *a1 = v9;
  }
  return result;
}

uint64_t X509ExtensionParseSubjectAltName(unint64_t *a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;
  unint64_t v11;
  unint64_t v12;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result == 1)
  {
    v7 = a1[1];
    v8 = v7 >= *a1;
    v9 = v7 - *a1;
    if (!v8 || v9 < 0xAAAAAAAAAAAAAAAALL)
      goto LABEL_13;
    *a2 = *a1;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    v11 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    v12 = v11 - 0x5555555555555556;
    if (v11 > v11 - 0x5555555555555556 || v12 > a1[1])
LABEL_13:
      __break(0x5519u);
    *a1 = v12;
  }
  return result;
}

uint64_t X509CertificateVerifyOnlyOneAppleExtension(uint64_t result, uint64_t a2, unsigned int a3)
{
  _QWORD *v5;
  unsigned __int8 v6;
  unint64_t v7;
  uint64_t v9;
  _QWORD *v10;

  if (a3 > 9)
    return 0;
  v5 = (_QWORD *)result;
  v6 = 0;
  v7 = ~a2;
  while (v7 >= 16 * (char)v6)
  {
    result = compare_octet_string((uint64_t)v5, a2 + 16 * v6);
    if (!(_DWORD)result)
      return result;
    if (a3 <= v6++)
    {
      v9 = v5[1];
      v10 = (_QWORD *)(a2 + 16 * a3);
      *v10 = *v5;
      v10[1] = v9;
      return 1;
    }
  }
  __break(0x5513u);
  return result;
}

void X509ExtensionParseAppleExtension(unint64_t *a1, unint64_t a2, unint64_t a3, uint64_t *a4, unint64_t *a5, int a6)
{
  uint64_t v24;
  int v44;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (a6)
    a5 = 0;
  if (a3 == 11)
  {
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x10901066463F786)
    {
      if (!ccder_blob_check_null())
        return;
      v24 = *a4 | 0x400000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x10301066463F786)
    {
      if (!ccder_blob_check_null())
        return;
      v24 = *a4 | 0x200;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x10601066463F786)
    {
      if (!ccder_blob_check_null())
        return;
      v24 = *a4 | 0x800;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x11801066463F786)
    {
      if (!ccder_blob_check_null())
        return;
      v24 = *a4 | 0x2000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x12401066463F786)
    {
      if (!ccder_blob_check_null())
        return;
      v24 = *a4 | 0x100000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x11901066463F786)
    {
      if (!ccder_blob_check_null())
        return;
      v24 = *a4 | 0x4000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x21901066463F786)
    {
      if (!ccder_blob_check_null())
        return;
      v24 = *a4 | 0x8000;
      goto LABEL_261;
    }
LABEL_157:
    v44 = 0;
LABEL_158:
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 27)
    {
      X509ExtensionParseServerAuthMarker((uint64_t)a1, a2, a3, a4, a5);
      return;
    }
    if (!v44)
      goto LABEL_232;
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 832)
    {
      if (!ccder_blob_check_null())
        return;
      v24 = *a4 | 0x400000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3586)
    {
      if (!ccder_blob_check_null())
        return;
      v54 = *a4;
      v55 = 37748736;
      goto LABEL_201;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 4354)
    {
      if (!ccder_blob_check_null())
        return;
      v54 = *a4;
      v55 = 0x8004000000;
      goto LABEL_201;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 327)
    {
      X509ExtensionParseMFI4Properties(a1, a4, a5);
      return;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3841)
    {
      v52 = *a1;
      v51 = a1[1];
      if (a5)
      {
        if (v52 > v51)
        {
LABEL_264:
          __break(0x5519u);
          return;
        }
        *a5 = v52;
        a5[1] = v51 - v52;
      }
      *a4 |= 0x80000000uLL;
LABEL_233:
      if (v52 <= v51)
      {
        *a1 = v51;
        return;
      }
      goto LABEL_264;
    }
LABEL_232:
    v52 = *a1;
    v51 = a1[1];
    goto LABEL_233;
  }
  if (a3 == 10)
  {
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 5122)
    {
      if (!ccder_blob_check_null())
        return;
      v24 = *a4 | 0x100000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 258)
    {
      if (!ccder_blob_check_null())
        return;
      v54 = *a4;
      v55 = 0x58600003F0D0;
LABEL_201:
      v24 = v54 | v55;
LABEL_261:
      *a4 = v24;
      return;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1538)
      goto LABEL_203;
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 4610)
    {
      if (!ccder_blob_check_null())
        return;
      v24 = *a4 | 0xF00;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3073)
    {
      if (!ccder_blob_check_null())
        return;
      v24 = *a4 | 0x10;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1793)
    {
      if (!ccder_blob_check_null())
        return;
      v24 = *a4 | 0x20000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3329)
    {
LABEL_203:
      if (!ccder_blob_check_null())
        return;
      v24 = *a4 | 0x20;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 2305)
    {
      if (!ccder_blob_check_null())
        return;
      v24 = *a4 | 0x40;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 513)
    {
      if (!ccder_blob_check_null())
        return;
      v24 = *a4 | 0x80;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1025)
    {
      if (!ccder_blob_check_null())
        return;
      v24 = *a4 | 0x10000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 769)
    {
      if (!ccder_blob_check_null())
        return;
      v24 = *a4 | 0x100;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1537)
    {
      if (!ccder_blob_check_null())
        return;
      v24 = *a4 | 0x400;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 6145)
    {
      if (!ccder_blob_check_null())
        return;
      v24 = *a4 | 0x1000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 9217)
    {
      if (!ccder_blob_check_null())
        return;
      v24 = *a4 | 0x80000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8193)
    {
      if (!ccder_blob_check_null())
        return;
      v24 = *a4 | 0x2000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8705)
    {
      if (!ccder_blob_check_null())
        return;
      v24 = *a4 | 0x4000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 315)
    {
      X509ExtensionParseMFISWAuth(a1, a4, a5);
      return;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3074)
    {
      if (!ccder_blob_check_null())
        return;
      v24 = *a4 | 0x300000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 304)
    {
      X509ExtensionParseGenericSSLMarker();
      return;
    }
    v44 = 1;
    goto LABEL_158;
  }
  if (a3 != 9)
  {
    if (a3 < 0xA)
      goto LABEL_232;
    goto LABEL_157;
  }
  if (*(_QWORD *)a2 == 0xB6463F78648862ALL && *(_BYTE *)(a2 + 8) == 1)
  {
    X509ExtensionParseComponentAuth(a1, a4, a5);
    return;
  }
  if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 49)
  {
    v56 = 0;
    if (der_get_BOOLean(a1, 0, &v56))
    {
      v53 = 0x10000080002;
      if (!v56)
        v53 = 0x20000040001;
      *a4 |= v53;
    }
    return;
  }
  if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 44)
  {
    X509ExtensionParseCertifiedChipIntermediate(a1, a4, a5);
    return;
  }
  if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 36)
  {
    X509ExtensionParseMFIAuthv3Leaf(a1);
    return;
  }
  if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 22)
  {
    if (!ccder_blob_check_null())
      return;
    v54 = *a4;
    v55 = 1048584;
    goto LABEL_201;
  }
  if (*(_QWORD *)a2 == 0xC6463F78648862ALL && *(_BYTE *)(a2 + 8) == 19)
  {
    if (!ccder_blob_check_null())
      return;
    v24 = *a4 | 0x8000000000;
    goto LABEL_261;
  }
  if (*(_QWORD *)a2 == 0xA6463F78648862ALL && *(_BYTE *)(a2 + 8) == 1)
  {
    *a4 |= 0x1000000uLL;
    goto LABEL_232;
  }
  if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 29)
  {
    if (!ccder_blob_check_null())
      return;
    v24 = *a4 | 0x2000000;
    goto LABEL_261;
  }
  if (*(_QWORD *)a2 != 0xC6463F78648862ALL || *(_BYTE *)(a2 + 8) != 14)
  {
    if (*(_QWORD *)a2 == 0x86463F78648862ALL && *(_BYTE *)(a2 + 8) == 3)
    {
      X509ExtensionParseDeviceAttestationIdentity(a1, a4, a5);
      return;
    }
    goto LABEL_232;
  }
  if (ccder_blob_check_null())
  {
    v24 = *a4 | 0x4000000;
    goto LABEL_261;
  }
}

void X509CertificateParseWithExtension(unint64_t *a1, unint64_t *a2, const void *a3, size_t a4)
{
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int v11;
  unint64_t v12;

  v8 = *a2;
  v9 = a2[1];
  if (ccder_blob_decode_tl())
  {
    v10 = *a2;
    X509CertificateParseImplicit((uint64_t)a1, a2, a3, a4);
    if (!v11)
    {
      if (v10 >= 0x5555555555555556)
      {
        __break(0x5513u);
      }
      else
      {
        if (*a2 != v10 - 0x5555555555555556)
          return;
        v12 = v10 - v8 - 0x5555555555555556;
        if (v10 - v8 < 0x5555555555555556)
        {
          if (v9 >= v8 && v12 <= v9 - v8)
          {
            *a1 = v8;
            a1[1] = v12;
            X509PolicyCheckForBlockedKeys((uint64_t)a1);
            return;
          }
LABEL_12:
          __break(0x5519u);
          return;
        }
      }
      __break(0x5500u);
      goto LABEL_12;
    }
  }
}

void X509CertificateParse(unint64_t *a1, unint64_t *a2)
{
  X509CertificateParseWithExtension(a1, a2, 0, 0);
}

BOOL X509ExtensionParseComponentAuth(unint64_t *a1, _QWORD *a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1[1];
  if (*a1 > v3)
    goto LABEL_19;
  v12 = *a1;
  v13 = a1[1];
  v11 = v3 - *a1;
  if ((ccder_blob_decode_tl() & 1) != 0)
    goto LABEL_5;
  if (*a1 > a1[1])
    goto LABEL_19;
  v12 = *a1;
  v13 = a1[1];
  if (ccder_blob_decode_tl())
  {
LABEL_5:
    v8 = v12;
    v7 = v13;
    if (v12 > v13)
      goto LABEL_19;
    *a1 = v12;
    a1[1] = v13;
    v9 = v11;
  }
  else
  {
    v8 = *a1;
    v7 = a1[1];
    v9 = v7 - *a1;
  }
  if (__CFADD__(v8, v9))
    goto LABEL_20;
  if (v7 == v8 + v9)
  {
    if (!v9)
      goto LABEL_16;
    if (!a3)
    {
LABEL_15:
      *a2 |= 0x40000000uLL;
LABEL_16:
      if (v8 <= v7)
      {
        *a1 = v7;
        return v7 == v8 + v9;
      }
      goto LABEL_19;
    }
    if (v8 <= v7 && v9 <= v7 - v8)
    {
      *a3 = v8;
      a3[1] = v9;
      goto LABEL_15;
    }
LABEL_19:
    __break(0x5519u);
LABEL_20:
    __break(0x5513u);
  }
  return v7 == v8 + v9;
}

uint64_t X509ExtensionParseCertifiedChipIntermediate(unint64_t *a1, _QWORD *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    v7 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      goto LABEL_12;
    }
    v8 = v7 - 0x5555555555555556;
    if (a1[1] != v7 - 0x5555555555555556)
      return 0;
    *a2 |= 0x30000000000uLL;
    if (a3)
    {
      if (v7 > v8)
        goto LABEL_12;
      *a3 = v7;
      a3[1] = 0xAAAAAAAAAAAAAAAALL;
    }
    if (v7 <= v8)
    {
      *a1 = v8;
      return 1;
    }
LABEL_12:
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseMFIAuthv3Leaf(unint64_t *a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    v3 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      v4 = a1[1];
      if (v4 != v3 - 0x5555555555555556)
        return 0;
      if (v3 <= v4)
      {
        *a1 = v4;
        return 1;
      }
    }
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseMFISWAuth(unint64_t *a1, _QWORD *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    v7 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      v8 = a1[1];
      if (v8 != v7 - 0x5555555555555556)
        return 0;
      if (a3)
      {
        if (v8 < v7 || v8 - v7 < 0xAAAAAAAAAAAAAAAALL)
          goto LABEL_13;
        *a3 = v7;
        a3[1] = 0xAAAAAAAAAAAAAAAALL;
      }
      *a2 |= 0x30000000uLL;
      if (v7 <= v8)
      {
        *a1 = v8;
        return 1;
      }
    }
LABEL_13:
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseGenericSSLMarker()
{
  ccder_blob_decode_tl();
  return 0;
}

uint64_t X509ExtensionParseServerAuthMarker(uint64_t a1, unint64_t a2, uint64_t a3, _QWORD *a4, unint64_t *a5)
{
  uint64_t result;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  BOOL v13;
  _BOOL4 v14;
  int v15;

  result = ccder_blob_check_null();
  if ((_DWORD)result)
  {
    if (a2 > 0xFFFFFFFFFFFFFFF6)
      goto LABEL_26;
    if (__CFADD__(a2, a3))
      goto LABEL_26;
    v10 = a2 + a3;
    if (a2 + a3 == -1)
      goto LABEL_26;
    v11 = a2 + 9;
    v12 = (char *)(a2 + 9);
    while (1)
    {
      v13 = (unint64_t)v12 < v10 && (unint64_t)v12 >= a2;
      v14 = v13;
      if ((unint64_t)v12 >= v10 - 1)
        break;
      if (!v14)
        goto LABEL_25;
      v15 = *v12++;
      if ((v15 & 0x80000000) == 0)
        return 0;
    }
    if (!v14)
    {
LABEL_25:
      __break(0x5519u);
LABEL_26:
      __break(0x5513u);
      return result;
    }
    if ((*v12 & 0x80000000) == 0)
    {
      if (!a5)
      {
LABEL_22:
        *a4 |= 0x100000000uLL;
        return 1;
      }
      if (v11 >= a2 && v11 <= v10)
      {
        *a5 = v11;
        a5[1] = a3 - 9;
        goto LABEL_22;
      }
      goto LABEL_25;
    }
    return 0;
  }
  return result;
}

uint64_t X509ExtensionParseDeviceAttestationIdentity(unint64_t *a1, _QWORD *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    v7 = *a1;
    if (*a1 >= 0x5555555555555556)
      goto LABEL_17;
    if (a1[1] != v7 - 0x5555555555555556)
      return 0;
    if (v7 > v7 - 0x5555555555555556)
      goto LABEL_18;
    v10 = *a1;
    v11 = v7 - 0x5555555555555556;
    result = ccder_blob_decode_tl();
    if ((_DWORD)result)
    {
      result = ccder_blob_decode_tl();
      if ((_DWORD)result)
      {
        if (a3)
        {
          if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL)
            goto LABEL_18;
          *a3 = v10;
          a3[1] = 0xAAAAAAAAAAAAAAAALL;
        }
        *a2 |= 0x240000800000uLL;
        v8 = *a1;
        if (*a1 < 0x5555555555555556)
        {
          v9 = v8 - 0x5555555555555556;
          if (v8 <= v8 - 0x5555555555555556 && v9 <= a1[1])
          {
            *a1 = v9;
            return 1;
          }
LABEL_18:
          __break(0x5519u);
          return result;
        }
LABEL_17:
        __break(0x5513u);
        goto LABEL_18;
      }
    }
  }
  return result;
}

void X509ExtensionParseMFI4Properties(unint64_t *a1, _QWORD *a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v4 = *a1;
  v3 = a1[1];
  if (v3 - *a1 == 32)
  {
    if (a3)
    {
      if (v4 > v3)
        goto LABEL_12;
      *a3 = v4;
      a3[1] = 32;
    }
    *a2 |= 0xC00000000uLL;
    if (v4 >= 0xFFFFFFFFFFFFFFE0)
    {
LABEL_13:
      __break(0x5513u);
      CFRelease(a1);
      return;
    }
    v5 = v4 + 32;
    if (v4 + 32 <= v3 && v4 <= v5)
    {
      *a1 = v5;
      return;
    }
LABEL_12:
    __break(0x5519u);
    goto LABEL_13;
  }
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x1E0CD5F60](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x1E0CD6010](allocator, data);
}

uint64_t SecIdentityCreate()
{
  return MEMORY[0x1E0CD6280]();
}

CFDictionaryRef SecKeyCopyAttributes(SecKeyRef key)
{
  return (CFDictionaryRef)MEMORY[0x1E0CD62F0](key);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1E0CD63A0](keyData, attributes, error);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x1E0C80940](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t ccder_blob_decode_bitstring()
{
  return MEMORY[0x1E0C819E8]();
}

uint64_t ccder_blob_decode_tl()
{
  return MEMORY[0x1E0C81A10]();
}

uint64_t ccder_blob_decode_uint64()
{
  return MEMORY[0x1E0C81A18]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1E0C849D8]();
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

