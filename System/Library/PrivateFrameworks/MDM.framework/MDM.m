void sub_222CBBD18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_222CBC338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void MDMAnalyticsSendCommandEvent(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = a1;
  v4 = a2;
  v5 = v3;
  v6 = v4;
  AnalyticsSendEventLazy();

}

uint64_t MDMAnalyticsSendPushEvent()
{
  return AnalyticsSendEventLazy();
}

void sub_222CBDCA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222CBE0E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222CBE4E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_222CBE728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_222CBF558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_222CBF818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_222CBFC84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_222CC1620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222CC2570(_Unwind_Exception *exception_object, int a2)
{
  id v2;
  void *v3;
  void *v4;

  if (a2 == 1)
  {
    v2 = objc_begin_catch(exception_object);
    objc_msgSend(v2, "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("error"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v4);
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x222CC2530);
  }
  _Unwind_Resume(exception_object);
}

BOOL MDMKeybagCreateMDMEscrowWithPasscode(void *a1, _QWORD *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  _QWORD *v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a1;
  objc_msgSend(v3, "DMCMakeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v6 = MDMKeybagCopyEscrowWithAuth(v5, v4, &v34);

  v7 = v34;
  if (v6)
  {
    v33 = a2;
    v32 = v6;
    v8 = (void *)MEMORY[0x24BE2A810];
    objc_msgSend(MEMORY[0x24BE2A810], "dataFromString:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x24BE613F0];
    v11 = *MEMORY[0x24BE60F38];
    v12 = *MEMORY[0x24BDE8F88];
    objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "personaID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    BYTE2(v29) = v14 != 0;
    LOWORD(v29) = 256;
    objc_msgSend(v8, "setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:enforcePersonalPersona:outError:", v9, v10, v11, 0, 0, v12, 0, v29, &v36);
    v15 = v36;

    if (v15)
    {
      v16 = v32;
      v17 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v15;
        _os_log_impl(&dword_222CB9000, v17, OS_LOG_TYPE_ERROR, "Failed to store MDM escrow secret into keychain. Error: %@", buf, 0xCu);
      }
      a2 = v33;
    }
    else
    {
      v18 = (void *)MEMORY[0x24BE2A810];
      v19 = *MEMORY[0x24BE60F30];
      v20 = *MEMORY[0x24BDE8F70];
      objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "personaID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      BYTE2(v30) = v22 != 0;
      LOWORD(v30) = 256;
      v23 = v18;
      v16 = v32;
      v31 = v10;
      objc_msgSend(v23, "setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:enforcePersonalPersona:outError:", v32, v10, v19, 0, 0, v20, 0, v30, &v35);
      v15 = v35;

      a2 = v33;
      if (!v15)
      {
LABEL_11:

        goto LABEL_12;
      }
      v24 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v15;
        _os_log_impl(&dword_222CB9000, v24, OS_LOG_TYPE_ERROR, "Failed to store MDM escrow data into keychain. Error: %@", buf, 0xCu);
      }
      v25 = (void *)MEMORY[0x24BE2A810];
      objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "personaID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "removeItemForService:account:label:description:useSystemKeychain:enforcePersonalPersona:group:", v31, v11, 0, 0, 0, v27 != 0, 0);

      v16 = v32;
    }

    goto LABEL_11;
  }
LABEL_12:
  if (a2 && v7)
    *a2 = objc_retainAutorelease(v7);

  return v7 == 0;
}

id MDMKeybagCopyEscrowWithAuth(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t EscrowWithAuth;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;

  v5 = a1;
  v6 = a2;
  if (+[MDMMCInterface isPasscodeSet](MDMMCInterface, "isPasscodeSet") && !objc_msgSend(v6, "length"))
  {
    v20 = (void *)MEMORY[0x24BDD1540];
    v21 = *MEMORY[0x24BE2A648];
    DMCErrorArray();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "DMCErrorWithDomain:code:descriptionArray:errorType:", v21, 37002, v22, *MEMORY[0x24BE2A588], 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "dataUsingEncoding:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v5, "dataUsingEncoding:", 4);
    else
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    EscrowWithAuth = MKBKeyBagCreateEscrowWithAuth();
    if ((_DWORD)EscrowWithAuth)
    {
      v10 = (void *)MEMORY[0x24BDD1540];
      v11 = *MEMORY[0x24BE2A648];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", EscrowWithAuth);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      DMCErrorArray();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "DMCErrorWithDomain:code:descriptionArray:errorType:", v11, 37003, v13, *MEMORY[0x24BE2A588], v12, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = MKBKeyBagCopyData();
      if ((_DWORD)v15)
      {
        v16 = (void *)MEMORY[0x24BDD1540];
        v17 = *MEMORY[0x24BE2A648];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        DMCErrorArray();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "DMCErrorWithDomain:code:descriptionArray:errorType:", v17, 37004, v19, *MEMORY[0x24BE2A588], v18, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v14 = 0;
      }
    }

  }
  if (v14)
  {
    v23 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v14);
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

id MDMKeybagRetrieveMDMEscrowDataIfPresent(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BE2A810];
  v3 = *MEMORY[0x24BE613F0];
  v4 = *MEMORY[0x24BE60F30];
  objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personaID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  LOBYTE(v15) = v6 != 0;
  objc_msgSend(v2, "dataFromService:account:label:description:group:useSystemKeychain:enforcePersonalPersona:outError:", v3, v4, 0, 0, 0, 0, v15, &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v16;

  if (!v7)
  {
    if (a1)
      *a1 = objc_retainAutorelease(v8);
    v9 = *(NSObject **)DMCLogObjects();
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v8;
        v10 = "Unable to retrieve escrow keybag from the keychain. Error: %@";
        v11 = v9;
        v12 = OS_LOG_TYPE_INFO;
        v13 = 12;
LABEL_9:
        _os_log_impl(&dword_222CB9000, v11, v12, v10, buf, v13);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v10 = "No escrow keybag found in the keychain.";
      v11 = v9;
      v12 = OS_LOG_TYPE_DEBUG;
      v13 = 2;
      goto LABEL_9;
    }
  }

  return v7;
}

void MDMKeybagDeleteMDMEscrowData()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x24BE2A810];
  v1 = *MEMORY[0x24BE613F0];
  v2 = *MEMORY[0x24BE60F30];
  objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personaID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "removeItemForService:account:label:description:useSystemKeychain:enforcePersonalPersona:group:", v1, v2, 0, 0, 0, v3 != 0, 0);

}

void MDMKeybagDeleteMDMEscrowSecret()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x24BE2A810];
  v1 = *MEMORY[0x24BE613F0];
  v2 = *MEMORY[0x24BE60F38];
  objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personaID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "removeItemForService:account:label:description:useSystemKeychain:enforcePersonalPersona:group:", v1, v2, 0, 0, 0, v3 != 0, 0);

}

id MDMKeybagCreateSupervisionEscrowWithPasscode(void *a1, _QWORD *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v8;

  v8 = 0;
  v3 = MDMKeybagCopyEscrowWithAuth(CFSTR("com.apple.Chaperone"), a1, &v8);
  v4 = v8;
  v5 = v4;
  if (v4)
  {
    v6 = 0;
    if (a2)
      *a2 = objc_retainAutorelease(v4);
  }
  else
  {
    v6 = v3;
  }

  return v6;
}

uint64_t MDMKeybagRetrieveSupervisionEscrowSecret()
{
  return objc_msgSend(CFSTR("com.apple.Chaperone"), "dataUsingEncoding:", 4);
}

void sub_222CC3FDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222CC4550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_222CC4B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_222CC6CDC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222CC85E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_222CC8C20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

Class __getPRSettingsProviderClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!ProximityReaderLibraryCore_frameworkLibrary)
  {
    ProximityReaderLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!ProximityReaderLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getPRSettingsProviderClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("PRSettingsProvider");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getPRSettingsProviderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_222CD3190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void sub_222CDD5C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222CE3814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_222CE57D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void sub_222CE6168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void sub_222CE65C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void sub_222CE78B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222CE8828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222CE8A84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222CE99A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  char a67;
  uint64_t v67;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a53, 8);
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a67, 8);
  _Block_object_dispose(&STACK[0x200], 8);
  _Block_object_dispose(&STACK[0x230], 8);
  _Block_object_dispose((const void *)(v67 - 240), 8);
  _Block_object_dispose((const void *)(v67 - 208), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void sub_222CEA11C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose((const void *)(v35 - 144), 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_222CEAD90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  uint64_t v32;

  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 168), 8);
  _Block_object_dispose((const void *)(v32 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_222CEB4BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_222CEC29C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_222CECF60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222CED580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222CEDDC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_222CEF758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222CEF9A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222CEFCF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222CEFF44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222CF025C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_222CF039C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_222CF04AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222CF0ED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222CF1328(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_222CF1CCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  uint64_t v39;

  _Block_object_dispose((const void *)(v39 - 224), 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_222CF26DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_222CF2E48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  id *v28;

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_222CF41EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222CF46EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222CF4BBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222CF4D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222CF5538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222CF56E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222CF6178(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void _performBlockOnMainThread(void *a1)
{
  void *v1;
  void *v2;
  void (**v3)(void);
  _QWORD block[4];
  void (**v5)(void);

  v3 = a1;
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17F0], "mainThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1 == v2)
  {
    v3[2]();
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ___performBlockOnMainThread_block_invoke;
    block[3] = &unk_24EB693E0;
    v5 = v3;
    dispatch_sync(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t ___performBlockOnMainThread_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_222CF9638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222CF979C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222CF9AD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222CF9D84(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_222CFA5A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __getPRSettingsProviderClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  -[MDMParser _availableOSUpdates:assertion:completionBlock:].cold.1(v0);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

uint64_t AppAttest_DeviceAttestation_AttestKey()
{
  return MEMORY[0x24BE03D60]();
}

uint64_t AppAttest_DeviceAttestation_IsSupported()
{
  return MEMORY[0x24BE03D68]();
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

uint64_t DEPLogObjects()
{
  return MEMORY[0x24BE2A460]();
}

uint64_t DMCBYSetupAssistantFinishedDarwinNotification()
{
  return MEMORY[0x24BE2A560]();
}

uint64_t DMCCTSupportsVoiceRoaming()
{
  return MEMORY[0x24BE2A568]();
}

uint64_t DMCDeviceIsNetworkTethered()
{
  return MEMORY[0x24BE2A570]();
}

uint64_t DMCErrorArray()
{
  return MEMORY[0x24BE2A580]();
}

uint64_t DMCFixPermissionsOfSystemGroupContainerDirectoryAndContents()
{
  return MEMORY[0x24BE2A5C0]();
}

uint64_t DMCHasMDMMigrated()
{
  return MEMORY[0x24BE2A610]();
}

uint64_t DMCIOBluetoothMAC()
{
  return MEMORY[0x24BE2A618]();
}

uint64_t DMCIOModelString()
{
  return MEMORY[0x24BE2A620]();
}

uint64_t DMCIsDeviceLocked()
{
  return MEMORY[0x24BE2A638]();
}

uint64_t DMCIsSetupBuddyDone()
{
  return MEMORY[0x24BE2A640]();
}

uint64_t DMCLKLogoutSupportClass()
{
  return MEMORY[0x24BE2A650]();
}

uint64_t DMCLocalizedFormat()
{
  return MEMORY[0x24BE2A658]();
}

uint64_t DMCLocalizedString()
{
  return MEMORY[0x24BE2A660]();
}

uint64_t DMCLockdownSetDeviceName()
{
  return MEMORY[0x24BE2A678]();
}

uint64_t DMCLogObjects()
{
  return MEMORY[0x24BE2A680]();
}

uint64_t DMCSafelyCopyItemAtPathToDestinationPath()
{
  return MEMORY[0x24BE2A6A0]();
}

uint64_t DMCSendSettingsChangedNotification()
{
  return MEMORY[0x24BE2A6A8]();
}

uint64_t DMCSetSkipBackupAttributeToItemAtPath()
{
  return MEMORY[0x24BE2A6B0]();
}

uint64_t DMCStringForBool()
{
  return MEMORY[0x24BE2A6C8]();
}

uint64_t DMCSystemLostModeRequestPath()
{
  return MEMORY[0x24BE2A6D8]();
}

uint64_t DMCUMUserManagerClass()
{
  return MEMORY[0x24BE2A6E8]();
}

uint64_t DMCUMUserManagerErrorDomain()
{
  return MEMORY[0x24BE2A6F0]();
}

uint64_t DMCUSEnglishString()
{
  return MEMORY[0x24BE2A6F8]();
}

uint64_t DMCUnformattedErrorArray()
{
  return MEMORY[0x24BE2A700]();
}

uint64_t IXCreateUserPresentableError()
{
  return MEMORY[0x24BE51F50]();
}

uint64_t MDMAppManagementFilePath()
{
  return MEMORY[0x24BE2A710]();
}

uint64_t MDMDEPTokenSyncActivitiesFilePath()
{
  return MEMORY[0x24BE2A718]();
}

uint64_t MDMDirtyEnrollmentStateFilePath()
{
  return MEMORY[0x24BE2A720]();
}

uint64_t MDMEventsFilePath()
{
  return MEMORY[0x24BE2A730]();
}

uint64_t MDMFilePath()
{
  return MEMORY[0x24BE2A738]();
}

uint64_t MDMLegacyManagedNonStoreBooksDirectory()
{
  return MEMORY[0x24BE2A740]();
}

uint64_t MDMManagedNonStoreBooksDirectory()
{
  return MEMORY[0x24BE2A748]();
}

uint64_t MDMManagedNonStoreBooksManifestPath()
{
  return MEMORY[0x24BE2A750]();
}

uint64_t MDMManagedNonStoreBooksSystemGroupContainer()
{
  return MEMORY[0x24BE2A758]();
}

uint64_t MDMOutstandingActivitiesFilePath()
{
  return MEMORY[0x24BE2A760]();
}

uint64_t MDMPropertiesFilePath()
{
  return MEMORY[0x24BE2A768]();
}

uint64_t MDMPropertiesUserFilePath()
{
  return MEMORY[0x24BE2A770]();
}

uint64_t MDMSendManagedBooksChangedNotification()
{
  return MEMORY[0x24BE60D20]();
}

uint64_t MDMSendManagingOrgInfoChangedNotification()
{
  return MEMORY[0x24BE60D28]();
}

uint64_t MDMSystemRestartLogPath()
{
  return MEMORY[0x24BE2A778]();
}

uint64_t MDMSystemShutDownLogPath()
{
  return MEMORY[0x24BE2A780]();
}

uint64_t MDMUserFilePath()
{
  return MEMORY[0x24BE2A788]();
}

uint64_t MDMUserOutstandingActivitiesFilePath()
{
  return MEMORY[0x24BE2A790]();
}

uint64_t MDMUserXPCProtocolInitialize()
{
  return MEMORY[0x24BE60D30]();
}

uint64_t MDMXPCProtocolInitialize()
{
  return MEMORY[0x24BE60D38]();
}

uint64_t MISCopyProvisioningProfile()
{
  return MEMORY[0x24BEDC840]();
}

uint64_t MISProvisioningProfileGetExpirationDate()
{
  return MEMORY[0x24BEDC848]();
}

uint64_t MISProvisioningProfileGetName()
{
  return MEMORY[0x24BEDC850]();
}

uint64_t MISProvisioningProfileGetUUID()
{
  return MEMORY[0x24BEDC858]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x24BE67140]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x24BE67168]();
}

uint64_t MKBKeyBagCopyData()
{
  return MEMORY[0x24BE67178]();
}

uint64_t MKBKeyBagCreateEscrowWithAuth()
{
  return MEMORY[0x24BE67180]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

uint64_t SBLockDevice()
{
  return MEMORY[0x24BEB0B88]();
}

uint64_t SBSSpringBoardServerPort()
{
  return MEMORY[0x24BEB0D48]();
}

CFArrayRef SCNetworkInterfaceCopyAll(void)
{
  return (CFArrayRef)MEMORY[0x24BDF5708]();
}

CFStringRef SCNetworkInterfaceGetHardwareAddressString(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x24BDF5720](interface);
}

CFStringRef SCNetworkInterfaceGetInterfaceType(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x24BDF5730](interface);
}

uint64_t SecCertificateCopyCommonNames()
{
  return MEMORY[0x24BDE8830]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x24BDE8850](certificate);
}

uint64_t SecCertificateCopyProperties()
{
  return MEMORY[0x24BDE88B8]();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x24BDE8A48](identityRef, certificateRef);
}

CFTypeID SecIdentityGetTypeID(void)
{
  return MEMORY[0x24BDE8A60]();
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x24BDE8B30](parameters, error);
}

uint64_t TMGetKernelMonotonicClock()
{
  return MEMORY[0x24BE28988]();
}

uint64_t TMGetRTCResetCount()
{
  return MEMORY[0x24BE28990]();
}

uint64_t TMSetAutomaticTimeZoneEnabled()
{
  return MEMORY[0x24BE289C8]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BDF7928](image);
}

uint64_t _AXDarkenSystemColors()
{
  return MEMORY[0x24BED1FF8]();
}

uint64_t _AXSCopyPreferredContentSizeCategoryName()
{
  return MEMORY[0x24BED2190]();
}

uint64_t _AXSEnhanceBackgroundContrastEnabled()
{
  return MEMORY[0x24BED21D0]();
}

uint64_t _AXSEnhanceTextLegibilityEnabled()
{
  return MEMORY[0x24BED21D8]();
}

uint64_t _AXSReduceMotionEnabled()
{
  return MEMORY[0x24BED23E8]();
}

uint64_t _AXSSetDarkenSystemColors()
{
  return MEMORY[0x24BED2448]();
}

uint64_t _AXSSetEnhanceBackgroundContrastEnabled()
{
  return MEMORY[0x24BED2458]();
}

uint64_t _AXSSetEnhanceTextLegibilityEnabled()
{
  return MEMORY[0x24BED2460]();
}

uint64_t _AXSSetPreferredContentSizeCategoryName()
{
  return MEMORY[0x24BED2498]();
}

uint64_t _AXSSetReduceMotionEnabled()
{
  return MEMORY[0x24BED24A8]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x24BED25B0]();
}

uint64_t _AXSVoiceOverTouchSetEnabled()
{
  return MEMORY[0x24BED25B8]();
}

uint64_t _AXSZoomTouchEnabled()
{
  return MEMORY[0x24BED2650]();
}

uint64_t _AXSZoomTouchSetEnabled()
{
  return MEMORY[0x24BED2658]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
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

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC8](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCE0](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD18](flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADD40](block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
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

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x24BDAF150](*(_QWORD *)&val);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
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

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

uint64_t os_eligibility_get_domain_answer()
{
  return MEMORY[0x24BDAF2F8]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x24BDAF4E0]();
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x24BDAFE38](*(_QWORD *)&a1);
}

uint64_t tzlink()
{
  return MEMORY[0x24BEDE518]();
}

uint64_t xpc_transaction_exit_clean()
{
  return MEMORY[0x24BDB0BC0]();
}

