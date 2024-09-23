void sub_214504FF8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412290;
    v22 = v3;
    _os_log_impl(&dword_214503000, v4, OS_LOG_TYPE_DEFAULT, "Results %@", (uint8_t *)&v21, 0xCu);
  }

  objc_msgSend_objectForKeyedSubscript_(v3, v5, (uint64_t)CFSTR("statusCode"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend_objectForKeyedSubscript_(v3, v8, (uint64_t)CFSTR("statusCode"), v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_objectForKeyedSubscript_(v3, v8, (uint64_t)CFSTR("data"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v15 = 0;
    goto LABEL_9;
  }
  objc_msgSend_objectForKeyedSubscript_(v3, v11, (uint64_t)CFSTR("data"), v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v10, v13, (uint64_t)CFSTR("fdrErrorDescription"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
LABEL_9:
    objc_msgSend_replyWithMessage_status_results_reply_(*(void **)(a1 + 32), v11, (uint64_t)v15, (uint64_t)v7, v10, *(_QWORD *)(a1 + 48));
    goto LABEL_10;
  }
  objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)CFSTR("fdrErrorDescription"), v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_replyWithMessage_status_results_reply_(*(void **)(a1 + 32), v17, (uint64_t)v15, (uint64_t)v7, v10, *(_QWORD *)(a1 + 48));
LABEL_10:
  objc_msgSend_invalidate(*(void **)(a1 + 40), v18, v19, v20);

}

void sub_21450603C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_21450604C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_21450645C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21450704C(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = a1;
    v7 = 2080;
    v8 = a2;
    _os_log_impl(&dword_214503000, v4, OS_LOG_TYPE_DEFAULT, "%s: %s", (uint8_t *)&v5, 0x16u);
  }

}

CFTypeRef sub_214507108(const __CFString *a1)
{
  const __CFDictionary *v2;
  io_service_t MatchingService;
  io_object_t v4;
  CFTypeRef CFProperty;
  NSObject *v6;
  NSObject *v7;
  int v9;
  const __CFString *v10;
  __int16 v11;
  CFTypeRef v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = IOServiceNameMatching("AppleH16CamIn");
  if (!v2)
  {
    handleForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_214566CA4();
    goto LABEL_10;
  }
  MatchingService = IOServiceGetMatchingService(*MEMORY[0x24BDD8B18], v2);
  if (!MatchingService)
  {
    handleForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_214566CD0();
LABEL_10:

    goto LABEL_11;
  }
  v4 = MatchingService;
  CFProperty = IORegistryEntryCreateCFProperty(MatchingService, a1, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  IOObjectRelease(v4);
  if (CFProperty)
  {
    handleForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412546;
      v10 = a1;
      v11 = 2112;
      v12 = CFProperty;
      _os_log_impl(&dword_214503000, v6, OS_LOG_TYPE_DEFAULT, "property %@ found: %@", (uint8_t *)&v9, 0x16u);
    }
    goto LABEL_14;
  }
LABEL_11:
  handleForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = a1;
    _os_log_impl(&dword_214503000, v6, OS_LOG_TYPE_DEFAULT, "No %@ property found", (uint8_t *)&v9, 0xCu);
  }
  CFProperty = 0;
LABEL_14:

  return CFProperty;
}

uint64_t sub_2145072C0(char *a1, unsigned int a2, _QWORD *a3, _DWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  _BYTE *v15;
  char v16;
  uint64_t v17;
  _BYTE *v18;
  char *v19;
  char v20;
  BOOL v21;
  void *v22;
  uint64_t v23;
  char *v24;
  _BYTE *v25;
  char v26;
  uint64_t v27;
  char *v28;
  _BYTE *v29;
  char v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v8 = DEREncoderCreate();
  if (!v8)
  {
    handleForCategory(0);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      sub_214566D6C();
    goto LABEL_52;
  }
  v9 = DEREncoderCreate();
  if (!v9)
  {
    handleForCategory(0);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      sub_214566D98();
LABEL_52:
    v32 = 0;
    v22 = 0;
    v31 = 0;
    goto LABEL_61;
  }
  v44 = v9;
  v10 = (unint64_t)a2 >> 1;
  v11 = (char *)malloc_type_malloc((v10 + 1), 0x100004077774924uLL);
  v12 = (char *)malloc_type_malloc((v10 + 1), 0x100004077774924uLL);
  bzero(v12, (v10 + 1));
  bzero(v11, (v10 + 1));
  if (*a1 < 0)
  {
    if (a2 >= 2)
    {
      if (v10 <= 1)
        v17 = 1;
      else
        v17 = v10;
      v18 = v11 + 1;
      v19 = a1;
      do
      {
        v20 = *v19++;
        *v18++ = v20;
        --v17;
      }
      while (v17);
    }
  }
  else if (a2 >= 2)
  {
    if (v10 <= 1)
      v13 = 1;
    else
      v13 = v10;
    v14 = a1;
    v15 = v11;
    do
    {
      v16 = *v14++;
      *v15++ = v16;
      --v13;
    }
    while (v13);
  }
  if (a1[v10] < 0)
  {
    v21 = a2 >= 2;
    v22 = v12;
    if (v21)
    {
      if (v10 <= 1)
        v27 = 1;
      else
        v27 = v10;
      v28 = &a1[v10];
      v29 = v12 + 1;
      do
      {
        v30 = *v28++;
        *v29++ = v30;
        --v27;
      }
      while (v27);
    }
  }
  else
  {
    v21 = a2 >= 2;
    v22 = v12;
    if (v21)
    {
      if (v10 <= 1)
        v23 = 1;
      else
        v23 = v10;
      v24 = &a1[v10];
      v25 = v12;
      do
      {
        v26 = *v24++;
        *v25++ = v26;
        --v23;
      }
      while (v23);
    }
  }
  v31 = v11;
  if (DEREncoderAddData())
  {
    handleForCategory(0);
    v35 = objc_claimAutoreleasedReturnValue();
    v32 = v44;
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      goto LABEL_61;
    goto LABEL_54;
  }
  v32 = v44;
  if (DEREncoderAddData())
  {
    handleForCategory(0);
    v35 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
LABEL_61:

      handleForCategory(0);
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        sub_214566CFC(v36, v37, v38, v39, v40, v41, v42, v43);
      goto LABEL_63;
    }
LABEL_54:
    sub_214566E74();
    goto LABEL_61;
  }
  if (DEREncoderAddSequenceFromEncoder())
  {
    handleForCategory(0);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      sub_214566E48();
    goto LABEL_61;
  }
  if (DEREncoderCreateEncodedBuffer())
  {
    handleForCategory(0);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      sub_214566E1C();
    goto LABEL_61;
  }
  if (*a3)
  {
    if (*a4)
    {
      v33 = 0;
LABEL_40:
      DEREncoderDestroy();
      goto LABEL_41;
    }
    handleForCategory(0);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      sub_214566DF0();
  }
  else
  {
    handleForCategory(0);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      sub_214566DC4();
  }
LABEL_63:

  v33 = 3;
  if (v8)
    goto LABEL_40;
LABEL_41:
  if (v32)
    DEREncoderDestroy();
  if (v31)
    free(v31);
  if (v22)
    free(v22);
  return v33;
}

void sub_214507690(void *a1, CFDataRef *a2, _QWORD *a3, _DWORD *a4, uint64_t a5)
{
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  unsigned int (*v15)(uint64_t, uint64_t, void *);
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  CC_LONG v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  NSObject *v38;
  dispatch_time_t v39;
  uint64_t *v40;
  const __CFData *v41;
  char *BytePtr;
  unsigned int v43;
  CFDataRef v44;
  id v45;
  const void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD v54[7];
  _QWORD v55[7];
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  dispatch_semaphore_t v61;
  _DWORD length[3];
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  unsigned __int8 md[32];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v67 = 0;
  v68 = &v67;
  v69 = 0x2020000000;
  v70 = 0;
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = -1;
  memset(length, 0, sizeof(length));
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = sub_214507C24;
  v60 = sub_214507C34;
  v61 = dispatch_semaphore_create(0);
  if (!a2)
  {
    handleForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_2145666B8();
    v14 = 0;
    v21 = 0;
    v13 = 0;
    goto LABEL_13;
  }
  v13 = (id)objc_msgSend_mutableCopy(a1, v10, v11, v12);
  if (a3)
  {
    v14 = malloc_type_malloc(0x20uLL, 0x94608AD0uLL);
    if (!v14)
    {
      handleForCategory(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_214566F3C();
      goto LABEL_10;
    }
    v15 = *(unsigned int (**)(uint64_t, uint64_t, void *))ccrng();
    v16 = ccrng();
    if (v15(v16, 32, v14))
    {
      handleForCategory(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_214566F68();
LABEL_10:

      handleForCategory(0);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_214566F10();
      v21 = 0;
LABEL_13:
      v19 = 0;
LABEL_14:

      goto LABEL_32;
    }
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v17, (uint64_t)v14, 32);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendData_(v13, v22, (uint64_t)v19, v23);
  }
  else
  {
    v14 = 0;
    v19 = 0;
  }
  v13 = objc_retainAutorelease(v13);
  v27 = (const void *)objc_msgSend_bytes(v13, v24, v25, v26);
  v31 = objc_msgSend_length(v13, v28, v29, v30);

  if (CC_SHA256(v27, v31, md))
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v32, (uint64_t)md, 32);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
  objc_msgSend_sharedManager(MEMORY[0x24BE1A0C8], v32, v33, v34);
  if (a5)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = MEMORY[0x24BDAC760];
    v54[1] = 3221225472;
    v54[2] = sub_214507C9C;
    v54[3] = &unk_24D1A9EC0;
    v54[4] = &v63;
    v54[5] = &v67;
    v54[6] = &v56;
    objc_msgSend_authenticateTouchControllerWithChallenge_completionHandler_(v35, v36, (uint64_t)v21, (uint64_t)v54);
  }
  else
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = MEMORY[0x24BDAC760];
    v55[1] = 3221225472;
    v55[2] = sub_214507C3C;
    v55[3] = &unk_24D1A9EC0;
    v55[4] = &v63;
    v55[5] = &v67;
    v55[6] = &v56;
    objc_msgSend_authenticateBatteryWithChallenge_completionHandler_(v35, v37, (uint64_t)v21, (uint64_t)v55);
  }

  v38 = v57[5];
  v39 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v38, v39))
  {
    handleForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_214566830();
    goto LABEL_14;
  }
  v40 = v64;
  if (a4)
    *a4 = *((_DWORD *)v64 + 6);
  if (*((_DWORD *)v40 + 6))
  {
    handleForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_214566804();
    goto LABEL_14;
  }
  v41 = (const __CFData *)v68[3];
  if (!v41)
  {
    handleForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_2145666B8();
    goto LABEL_14;
  }
  BytePtr = (char *)CFDataGetBytePtr(v41);
  v43 = CFDataGetLength((CFDataRef)v68[3]);
  if (sub_2145072C0(BytePtr, v43, &length[1], length))
  {
    handleForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_214566EA0(v20, v47, v48, v49, v50, v51, v52, v53);
    goto LABEL_14;
  }
  v44 = CFDataCreateWithBytesNoCopy(0, *(const UInt8 **)&length[1], length[0], (CFAllocatorRef)*MEMORY[0x24BDBD248]);
  *a2 = v44;
  if (!v44)
  {
    handleForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_21456673C();
    goto LABEL_14;
  }
  *(_QWORD *)&length[1] = 0;
  if (a3)
  {
    v45 = v19;
    *a3 = v45;
    if (!v45)
    {
      handleForCategory(0);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_214566768();
      goto LABEL_13;
    }
    v19 = v45;
  }
LABEL_32:
  v46 = (const void *)v68[3];
  if (v46)
    CFRelease(v46);
  if (v14)
    free(v14);
  _Block_object_dispose(&v56, 8);

  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v67, 8);
}

void sub_214507BCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  uint64_t v32;

  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_214507C24(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_214507C34(uint64_t a1)
{

}

void sub_214507C3C(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, int a6)
{
  id v8;
  id v9;

  v8 = a4;
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a6;
  v9 = v8;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v9;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1[6] + 8) + 40));

}

void sub_214507C9C(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, int a6)
{
  id v8;
  id v9;

  v8 = a4;
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a6;
  v9 = v8;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v9;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1[6] + 8) + 40));

}

void sub_214507CFC(_QWORD *a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  CFIndex Length;
  _DWORD v12[2];
  __int16 v13;
  CFIndex v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = v8;
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a4;
  if (v7)
  {
    if (v8)
    {
      *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v7;
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v9;
      handleForCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        Length = CFDataGetLength(*(CFDataRef *)(*(_QWORD *)(a1[6] + 8) + 24));
        v12[0] = 67109376;
        v12[1] = a4;
        v13 = 2048;
        v14 = Length;
        _os_log_impl(&dword_214503000, v10, OS_LOG_TYPE_DEFAULT, "C API: Received response from ACCHWComponentAuth, authError is %x:Size:%ld", (uint8_t *)v12, 0x12u);
      }
    }
    else
    {
      handleForCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_214566FC0();
    }
  }
  else
  {
    handleForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_214566F94();
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1[7] + 8) + 40));
}

void sub_214507E94(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_214507EB0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_21450B8AC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_21450D188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21450D1C8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_21450D1D8(uint64_t a1)
{

}

void sub_21450D1E0(uint64_t a1, const void *a2, void *a3, void *a4)
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  uint64_t BytePtr;
  uint64_t Length;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  __int128 v39;
  unint64_t v40;
  void *v41;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  __int128 v49;
  uint8_t buf[4];
  int v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v11 = a4;
  if (v11)
  {
    handleForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_214567A84((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);
LABEL_17:

    goto LABEL_18;
  }
  if (!v7 || !objc_msgSend_count(v7, v8, v9, v10))
  {
    handleForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_214567A58();
    goto LABEL_17;
  }
  if (objc_msgSend_count(v7, v19, v20, v21))
  {
    v25 = 0;
    do
    {
      objc_msgSend_objectAtIndexedSubscript_(v7, v22, v25, v24);

      v26 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v27 = (void *)MEMORY[0x24BDBCE50];
      BytePtr = SecCertificateGetBytePtr();
      Length = SecCertificateGetLength();
      objc_msgSend_dataWithBytes_length_(v27, v30, BytePtr, Length);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v26, v32, (uint64_t)v31, v33);

      ++v25;
    }
    while (objc_msgSend_count(v7, v34, v35, v36) > v25);
  }
  if (objc_msgSend_count(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v22, v23, v24))
  {
    v40 = 0;
    *(_QWORD *)&v39 = 67109378;
    v49 = v39;
    do
    {
      objc_msgSend_objectAtIndexedSubscript_(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v37, v40, v38, v49);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      handleForCategory(0);
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend_base64EncodedStringWithOptions_(v41, v43, 0, v44);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v49;
        v51 = v40;
        v52 = 2112;
        v53 = v48;
        _os_log_debug_impl(&dword_214503000, v42, OS_LOG_TYPE_DEBUG, "cert_%d: %@", buf, 0x12u);

      }
      ++v40;
    }
    while (objc_msgSend_count(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v45, v46, v47) > v40);
  }
LABEL_18:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  if (a2)
    CFRelease(a2);

}

void sub_21450EF9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21450EFCC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_21450EFDC(uint64_t a1)
{

}

void sub_21450EFE4(_QWORD *a1, char a2, void *a3, void *a4)
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v7 = a4;
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  v11 = objc_msgSend_mutableCopy(a3, v8, v9, v10);
  v12 = *(_QWORD *)(a1[5] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  v14 = *(_QWORD *)(a1[6] + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v7;

}

void sub_21450F050(_QWORD *a1, char a2, void *a3, void *a4)
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v7 = a4;
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  v11 = objc_msgSend_mutableCopy(a3, v8, v9, v10);
  v12 = *(_QWORD *)(a1[5] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  v14 = *(_QWORD *)(a1[6] + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v7;

}

void sub_21450F214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21450F22C(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  handleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_214567D04();

}

void sub_21450F280(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v3;
    _os_log_impl(&dword_214503000, v4, OS_LOG_TYPE_DEFAULT, "result: %@", (uint8_t *)&v11, 0xCu);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  objc_msgSend_invalidate(*(void **)(*(_QWORD *)(a1 + 32) + 16), v8, v9, v10);
}

void sub_21450F4B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21450F4C8(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  handleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_214567D64();

}

uint64_t sub_21450F51C(uint64_t a1, int a2)
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = a2;
    _os_log_impl(&dword_214503000, v4, OS_LOG_TYPE_DEFAULT, "success: %d", (uint8_t *)v9, 8u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return objc_msgSend_invalidate(*(void **)(*(_QWORD *)(a1 + 32) + 16), v5, v6, v7);
}

void sub_2145102FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_214510330(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_214567F78();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void sub_2145103A0(_QWORD *a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  handleForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 67109120;
    LODWORD(v21) = a2;
    _os_log_impl(&dword_214503000, v9, OS_LOG_TYPE_DEFAULT, "queryRepairDelta success: %d", (uint8_t *)&v20, 8u);
  }

  handleForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412290;
    v21 = v7;
    _os_log_impl(&dword_214503000, v10, OS_LOG_TYPE_DEFAULT, "queryRepairDelta results: %@", (uint8_t *)&v20, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  v11 = *(_QWORD *)(a1[6] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v7;
  v13 = v7;

  v14 = *(_QWORD *)(a1[7] + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v8;
  v16 = v8;

  objc_msgSend_invalidate(*(void **)(a1[4] + 16), v17, v18, v19);
}

void sub_21451080C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_214510848(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_214567F78();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void sub_2145108B8(_QWORD *a1, char a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  handleForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 138412290;
    v27 = v9;
    _os_log_impl(&dword_214503000, v12, OS_LOG_TYPE_DEFAULT, "issueRepairCert key: %@", (uint8_t *)&v26, 0xCu);
  }

  handleForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 138412290;
    v27 = v10;
    _os_log_impl(&dword_214503000, v13, OS_LOG_TYPE_DEFAULT, "issueRepairCert certs: %@", (uint8_t *)&v26, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  v14 = *(_QWORD *)(a1[6] + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v9;
  v16 = v9;

  v17 = *(_QWORD *)(a1[7] + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v10;
  v19 = v10;

  v20 = *(_QWORD *)(a1[8] + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v11;
  v22 = v11;

  objc_msgSend_invalidate(*(void **)(a1[4] + 16), v23, v24, v25);
}

void sub_214510D3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  uint64_t v32;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_214510D70(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_214567F78();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void sub_214510DE0(_QWORD *a1, char a2, void *a3, void *a4)
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a4);
  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a3);
  handleForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
    v15 = 138412290;
    v16 = v11;
    _os_log_impl(&dword_214503000, v10, OS_LOG_TYPE_DEFAULT, "Challenge components response: %@", (uint8_t *)&v15, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(a1[4] + 16), v12, v13, v14);
}

void sub_214511984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a55, 8);
  _Unwind_Resume(a1);
}

void sub_214511A2C(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  NSObject *v31;
  NSObject *v32;
  id v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a4);
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  if (v10)
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_214568300();

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  }
  if (v8)
  {
    if (v9)
    {
LABEL_7:
      v33 = v10;
      v34 = v9;
      v35 = v8;
      objc_msgSend_allHeaderFields(v9, v11, v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      objc_msgSend_allKeys(v15, v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v36, (uint64_t)v42, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v37 != v23)
              objc_enumerationMutation(v19);
            v25 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
            handleForCategory(0);
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend_valueForKey_(v15, v27, v25, v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v41 = v29;
              _os_log_impl(&dword_214503000, v26, OS_LOG_TYPE_DEFAULT, "Server Header: %@", buf, 0xCu);

            }
          }
          v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v30, (uint64_t)&v36, (uint64_t)v42, 16);
        }
        while (v22);
      }

      v9 = v34;
      v8 = v35;
      v10 = v33;
      goto LABEL_23;
    }
  }
  else
  {
    handleForCategory(0);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      sub_2145682D4();

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
    if (v9)
      goto LABEL_7;
  }
  handleForCategory(0);
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    sub_2145682A8();

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
LABEL_23:
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1[7] + 8) + 40));

}

uint64_t sub_214511CEC(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;

  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return objc_msgSend_resume(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2, v3, v4);
}

void sub_214512214(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t sub_214512220(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  return result;
}

void sub_214512238(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x16u);
}

void sub_214512248(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_214512280(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_2145122B8(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  NSObject *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  handleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 136315138;
    v24 = a2;
    _os_log_impl(&dword_214503000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v23, 0xCu);
  }

  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v4, a2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x24BDD1798]);
  v9 = (void *)objc_msgSend_initWithPattern_options_error_(v7, v8, (uint64_t)CFSTR("x-fdr-jmet-keys:.*?(seal:sik-[a-zA-Z0-9-]*)"), 0, 0);
  v13 = objc_msgSend_length(v6, v10, v11, v12);
  objc_msgSend_firstMatchInString_options_range_(v9, v14, (uint64_t)v6, 0, 0, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v15;
  if (v15)
  {
    v19 = objc_msgSend_rangeAtIndex_(v15, v16, 1, v17);
    objc_msgSend_substringWithRange_(v6, v20, v19, (uint64_t)v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      handleForCategory(0);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 138412290;
        v24 = (uint64_t)v21;
        _os_log_impl(&dword_214503000, v22, OS_LOG_TYPE_DEFAULT, "FOUND SealHeader [%@]", (uint8_t *)&v23, 0xCu);
      }

      objc_storeStrong((id *)&qword_254D7B078, v21);
    }

  }
}

id sub_214512470(void *a1, void *a2, void *a3)
{
  uint64_t v5;
  unint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  NSObject *v13;
  const char *v14;

  v5 = a2;
  v6 = a3;
  v10 = (void *)v6;
  if (a1)
  {
    if (v5 | v6)
    {
      objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v7, v8, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        handleForCategory(0);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          sub_214568430(v5, v13);

        objc_msgSend_setObject_forKeyedSubscript_(v12, v14, v5, *MEMORY[0x24BDD0FC8]);
      }
      if (v10)
        objc_msgSend_setObject_forKeyedSubscript_(v12, v11, (uint64_t)v10, *MEMORY[0x24BDD1398]);
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v11, (uint64_t)CFSTR("com.apple.corerepair"), (uint64_t)a1, v12);
      a1 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v7, (uint64_t)CFSTR("com.apple.corerepair"), (uint64_t)a1, 0);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return a1;
}

void sub_214512774()
{
  CRSysConfig *v0;
  void *v1;

  v0 = objc_alloc_init(CRSysConfig);
  v1 = (void *)qword_254D7B090;
  qword_254D7B090 = (uint64_t)v0;

}

void sub_214513124(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_2145149E0(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  mach_port_t v5;
  uint64_t i;
  void *v7;
  NSObject *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const __CFDictionary *v14;
  uint64_t MatchingService;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v2 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_24D1B8518, a2, (uint64_t)&v20, (uint64_t)v26, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v21;
    v5 = *MEMORY[0x24BDD8B18];
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v21 != v4)
          objc_enumerationMutation(&unk_24D1B8518);
        v7 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        handleForCategory(0);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v7;
          _os_log_impl(&dword_214503000, v8, OS_LOG_TYPE_DEFAULT, "Matching service %@", buf, 0xCu);
        }

        v9 = objc_retainAutorelease(v7);
        v13 = (const char *)objc_msgSend_UTF8String(v9, v10, v11, v12);
        v14 = IOServiceMatching(v13);
        MatchingService = IOServiceGetMatchingService(v5, v14);
        if ((_DWORD)MatchingService)
        {
          v17 = MatchingService;
          handleForCategory(0);
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v25 = v9;
            _os_log_impl(&dword_214503000, v18, OS_LOG_TYPE_DEFAULT, "Found service %@", buf, 0xCu);
          }

          return v17;
        }
      }
      v3 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_24D1B8518, v16, (uint64_t)&v20, (uint64_t)v26, 16);
      if (v3)
        continue;
      break;
    }
  }
  return 0;
}

void sub_214514F78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_21451510C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21451512C(uint64_t result)
{
  uint64_t v1;
  unsigned int v2;
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint8_t buf[4];
  unsigned int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v1 = result;
    v2 = 0;
    do
    {
      handleForCategory(0);
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v9 = v2;
        _os_log_impl(&dword_214503000, v3, OS_LOG_TYPE_DEFAULT, "Retry Count:%d", buf, 8u);
      }

      sleep(0xAu);
      result = objc_msgSend_copyComponentStatus(*(void **)(v1 + 32), v4, v5, v6);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = result;
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24))
        v7 = 1;
      else
        v7 = v2 >= 9;
      ++v2;
    }
    while (!v7);
  }
  return result;
}

void sub_214515638()
{
  dispatch_semaphore_t v0;
  id v1;
  const char *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  dispatch_time_t v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  NSObject *v25;
  _QWORD v26[4];
  NSObject *v27;

  v0 = dispatch_semaphore_create(0);
  v1 = objc_alloc(MEMORY[0x24BDD1988]);
  v3 = (void *)objc_msgSend_initWithMachServiceName_options_(v1, v2, (uint64_t)CFSTR("com.apple.corerepair.preflightControl"), 0);
  objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], v4, (uint64_t)&unk_254D80218, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRemoteObjectInterface_(v3, v7, (uint64_t)v6, v8);

  objc_msgSend_resume(v3, v9, v10, v11);
  v12 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = sub_2145157C8;
  v26[3] = &unk_24D1AA160;
  v13 = v0;
  v27 = v13;
  objc_msgSend_remoteObjectProxyWithErrorHandler_(v3, v14, (uint64_t)v26, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v12;
  v23[1] = 3221225472;
  v23[2] = sub_214515830;
  v23[3] = &unk_24D1AA188;
  v24 = v3;
  v17 = v13;
  v25 = v17;
  v18 = v3;
  objc_msgSend_queryRepairDeltaWithReply_(v16, v19, (uint64_t)v23, v20);

  v21 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v17, v21))
  {
    handleForCategory(0);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_214568998();

  }
}

void sub_2145157C8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_2145689C4((uint64_t)v3, v4);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_214515830(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  BOOL v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  id v36;
  id v37;
  const char *v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  NSObject *v47;
  NSObject *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  id obj;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v12 = v8;
  if (v7 && !v8 && (a2 & 1) != 0)
  {
    v52 = a1;
    objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v53 = v7;
    obj = v7;
    v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v55, (uint64_t)v61, 16);
    if (v15)
    {
      v18 = v15;
      v19 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v56 != v19)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          objc_msgSend_objectForKeyedSubscript_(v21, v16, (uint64_t)CFSTR("key"), v17);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v21, v23, (uint64_t)CFSTR("identifier"), v24);
          v25 = objc_claimAutoreleasedReturnValue();
          v28 = (void *)v25;
          if (v22)
            v29 = v25 == 0;
          else
            v29 = 1;
          if (!v29)
          {
            objc_msgSend_objectForKeyedSubscript_(v13, v26, (uint64_t)v22, v27);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v30)
            {
              objc_msgSend_array(MEMORY[0x24BDBCEB8], v31, v32, v33);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v13, v35, (uint64_t)v34, (uint64_t)v22);

            }
            v36 = objc_alloc(MEMORY[0x24BDD17C8]);
            v37 = objc_alloc(MEMORY[0x24BDBCE50]);
            v39 = (void *)objc_msgSend_initWithBase64EncodedString_options_(v37, v38, (uint64_t)v28, 0);
            v41 = (void *)objc_msgSend_initWithData_encoding_(v36, v40, (uint64_t)v39, 4);

            objc_msgSend_objectForKeyedSubscript_(v13, v42, (uint64_t)v22, v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v44, v45, (uint64_t)v41, v46);

          }
        }
        v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v55, (uint64_t)v61, 16);
      }
      while (v18);
    }

    handleForCategory(0);
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v60 = v13;
      _os_log_impl(&dword_214503000, v47, OS_LOG_TYPE_DEFAULT, "delta components: %@", buf, 0xCu);
    }

    v48 = qword_254D7B0A0;
    qword_254D7B0A0 = (uint64_t)v13;
    a1 = v52;
    v7 = v53;
    v12 = 0;
  }
  else
  {
    handleForCategory(0);
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      sub_214568A38(a2, (uint64_t)v12, v48);
  }

  objc_msgSend_invalidate(*(void **)(a1 + 32), v49, v50, v51);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void sub_214515F18(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2145162E0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_214518EEC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_21451A9B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose(&STACK[0x250], 8);
  _Block_object_dispose(&STACK[0x280], 8);
  _Block_object_dispose(&STACK[0x2A0], 8);
  _Block_object_dispose(&STACK[0x2D0], 8);
  _Block_object_dispose(&STACK[0x2F0], 8);
  _Block_object_dispose(&STACK[0x310], 8);
  _Block_object_dispose(&STACK[0x340], 8);
  _Block_object_dispose(&STACK[0x370], 8);
  _Block_object_dispose(&STACK[0x3A0], 8);
  _Block_object_dispose(&STACK[0x3C0], 8);
  _Block_object_dispose(&STACK[0x3F0], 8);
  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21451AA90(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_21451AAA0(uint64_t a1)
{

}

void sub_21451AAA8(_QWORD *a1)
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  char v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1[4] + 8) + 40));
  v2 = *MEMORY[0x24BE2C448];
  objc_msgSend_objectForKeyedSubscript_(*(void **)(*(_QWORD *)(a1[5] + 8) + 40), v3, *MEMORY[0x24BE2C448], v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_containsObject_(v5, v6, *MEMORY[0x24BE2C400], v7) & 1) != 0)
  {
    objc_msgSend_objectForKeyedSubscript_(*(void **)(*(_QWORD *)(a1[5] + 8) + 40), v8, v2, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend_containsObject_(v10, v11, *MEMORY[0x24BE2C410], v12);

    if ((v13 & 1) != 0)
    {
      DeviceIdentityIssueClientCertificateWithCompletion();
      return;
    }
  }
  else
  {

  }
  handleForCategory(0);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    sub_2145690C0();

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  v15 = (void *)MEMORY[0x24BDD1540];
  v22 = *MEMORY[0x24BDD0FC8];
  v23[0] = CFSTR("Missing mandatory OIDS in kMAOptionsBAAOIDSToInclude");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v16, (uint64_t)v23, (uint64_t)&v22, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(v15, v18, (uint64_t)CFSTR("com.apple.corerepair"), -2, v17);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = *(_QWORD *)(a1[7] + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v19;

}

void sub_21451ACA0(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  const __CFString *v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  handleForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_214569118();

    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a4);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v28 = a2;
      v29 = 2112;
      v30 = v8;
      _os_log_impl(&dword_214503000, v11, OS_LOG_TYPE_DEFAULT, "BIK:%@::Certs:%@", buf, 0x16u);
    }

    if (v8 && (v15 = objc_msgSend_count(v8, v12, v13, v14), a2) && v15 == 2)
    {
      handleForCategory(0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_214503000, v16, OS_LOG_TYPE_DEFAULT, "BIK and BAA issues success", buf, 2u);
      }

      objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
      *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = a2;
    }
    else
    {
      handleForCategory(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_2145690EC();

      *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
      v18 = (void *)MEMORY[0x24BDD1540];
      v25 = *MEMORY[0x24BDD0FC8];
      v26 = CFSTR("Invalid Certs or BIK");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v19, (uint64_t)&v26, (uint64_t)&v25, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v18, v21, (uint64_t)CFSTR("com.apple.corerepair"), -1, v20);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(a1[5] + 8);
      v24 = *(void **)(v23 + 40);
      *(_QWORD *)(v23 + 40) = v22;

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1[8] + 8) + 40));

}

void sub_21451AF1C(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  char StrongComponentsWithError_resultobtained;
  id v8;
  id obj;

  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1[5] + 8) + 40));
  v2 = *(_QWORD *)(a1[7] + 8);
  v3 = *(void **)(v2 + 40);
  v4 = (void *)a1[4];
  v5 = *(_QWORD *)(a1[8] + 8);
  v8 = *(id *)(v5 + 40);
  obj = v3;
  StrongComponentsWithError_resultobtained = objc_msgSend_getStrongComponentsWithError_resultobtained_(v4, v6, (uint64_t)&obj, (uint64_t)&v8);
  objc_storeStrong((id *)(v2 + 40), obj);
  objc_storeStrong((id *)(v5 + 40), v8);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = StrongComponentsWithError_resultobtained;
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1[5] + 8) + 40));
}

uint64_t sub_21451AFB8(_QWORD *a1)
{
  uint64_t result;

  result = a1[5];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24), a1[4], *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
  return result;
}

id sub_21451AFE8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v43;
  void *v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  void *v48;
  _QWORD v49[7];
  _QWORD v50[9];

  v50[7] = *MEMORY[0x24BDAC8D0];
  v49[0] = CFSTR("EventType");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = v5;
  if (!v5)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], a2, a3, a4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v50[0] = v6;
  v49[1] = CFSTR("Client");
  objc_msgSend_processInfo(MEMORY[0x24BDD1760], a2, a3, a4, v6);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_processName(v44, v7, v8, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v50[1] = v14;
  v49[2] = CFSTR("BAAIssueTime");
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v10, v11, v12, *(double *)(a1 + 48));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v50[2] = v15;
  v49[3] = CFSTR("ComponentChallengeTime");
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v16, v17, v18, *(double *)(a1 + 56));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v50[3] = v19;
  v49[4] = CFSTR("CAACertIssueTime");
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v20, v21, v22, *(double *)(a1 + 64));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v50[4] = v23;
  v49[5] = CFSTR("FailureCode");
  v24 = (void *)MEMORY[0x24BDD16E0];
  v28 = objc_msgSend_code(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v25, v26, v27);
  objc_msgSend_numberWithInteger_(v24, v29, v28, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v50[5] = v31;
  v49[6] = CFSTR("FailureDomain");
  objc_msgSend_domain(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v32, v33, v34);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (!v38)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v35, v36, v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v50[6] = v39;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v35, (uint64_t)v50, (uint64_t)v49, 7);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v38)

  if (!v13)
  if (!v5)

  handleForCategory(0);
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v46 = "-[CRCAttestationManager issueClientCertificateWithCompletionOnQueue:withOptions:completion:]_block_invoke_2";
    v47 = 2112;
    v48 = v40;
    _os_log_impl(&dword_214503000, v41, OS_LOG_TYPE_DEFAULT, "[%s] send event: %@", buf, 0x16u);
  }

  return v40;
}

void sub_21451B568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 192), 8);
  _Block_object_dispose((const void *)(v35 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_21451B5A8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_214567D64();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void sub_21451B618(_QWORD *a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  handleForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 67109120;
    LODWORD(v22) = a2;
    _os_log_impl(&dword_214503000, v9, OS_LOG_TYPE_DEFAULT, "success %d", (uint8_t *)&v21, 8u);
  }

  handleForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412290;
    v22 = v7;
    _os_log_impl(&dword_214503000, v10, OS_LOG_TYPE_DEFAULT, "components %@", (uint8_t *)&v21, 0xCu);
  }

  handleForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412290;
    v22 = v8;
    _os_log_impl(&dword_214503000, v11, OS_LOG_TYPE_DEFAULT, "error %@", (uint8_t *)&v21, 0xCu);
  }

  v12 = *(_QWORD *)(a1[4] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v8;
  v14 = v8;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  v15 = *(_QWORD *)(a1[6] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v7;
  v17 = v7;

  objc_msgSend_invalidate(*(void **)(*(_QWORD *)(a1[7] + 8) + 40), v18, v19, v20);
}

void sub_21451BD60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose(&a61, 8);
  _Unwind_Resume(a1);
}

void sub_21451BDBC(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_214569178();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void sub_21451BE2C(_QWORD *a1, char a2, void *a3, void *a4)
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a4);
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
  handleForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    v15 = 138412290;
    v16 = v11;
    _os_log_impl(&dword_214503000, v10, OS_LOG_TYPE_DEFAULT, "CAA request2 components %@", (uint8_t *)&v15, 0xCu);
  }

  objc_msgSend_invalidate(*(void **)(*(_QWORD *)(a1[7] + 8) + 40), v12, v13, v14);
}

void sub_21451C480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 224), 8);
  _Block_object_dispose((const void *)(v35 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_21451C4DC(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  NSObject *v35;
  void *v36;
  id v37;
  id v38;
  _QWORD *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a4);
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  if (v10)
  {
    handleForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_214569230();

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  }
  if (!v8)
  {
    handleForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_214569204();

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  }
  handleForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v47 = v8;
    _os_log_impl(&dword_214503000, v13, OS_LOG_TYPE_DEFAULT, "Data:%@", buf, 0xCu);
  }

  if (v9)
  {
    v37 = v10;
    v38 = v9;
    v39 = a1;
    v40 = v8;
    v14 = v9;
    handleForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v47 = v14;
      _os_log_impl(&dword_214503000, v15, OS_LOG_TYPE_DEFAULT, "Body:%@", buf, 0xCu);
    }

    v36 = v14;
    objc_msgSend_allHeaderFields(v14, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend_allKeys(v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v41, (uint64_t)v45, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v42 != v27)
            objc_enumerationMutation(v23);
          v29 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
          handleForCategory(0);
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend_valueForKey_(v19, v31, v29, v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v47 = v33;
            _os_log_impl(&dword_214503000, v30, OS_LOG_TYPE_DEFAULT, "value:%@", buf, 0xCu);

          }
        }
        v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v34, (uint64_t)&v41, (uint64_t)v45, 16);
      }
      while (v26);
    }

    a1 = v39;
    v8 = v40;
    v10 = v37;
    v9 = v38;
  }
  else
  {
    handleForCategory(0);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      sub_2145691D8();

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1[7] + 8) + 40));

}

uint64_t sub_21451C850(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;

  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return objc_msgSend_resume(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2, v3, v4);
}

void sub_21451D158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 224), 8);
  _Block_object_dispose((const void *)(v35 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_21451D1B4(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  NSObject *v35;
  void *v36;
  id v37;
  id v38;
  _QWORD *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a4);
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  if (v10)
  {
    handleForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_214569230();

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  }
  if (!v8)
  {
    handleForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_214569204();

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  }
  handleForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v47 = v8;
    _os_log_impl(&dword_214503000, v13, OS_LOG_TYPE_DEFAULT, "Data:%@", buf, 0xCu);
  }

  if (v9)
  {
    v37 = v10;
    v38 = v9;
    v39 = a1;
    v40 = v8;
    v14 = v9;
    handleForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v47 = v14;
      _os_log_impl(&dword_214503000, v15, OS_LOG_TYPE_DEFAULT, "Body:%@", buf, 0xCu);
    }

    v36 = v14;
    objc_msgSend_allHeaderFields(v14, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend_allKeys(v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v41, (uint64_t)v45, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v42 != v27)
            objc_enumerationMutation(v23);
          v29 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
          handleForCategory(0);
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend_valueForKey_(v19, v31, v29, v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v47 = v33;
            _os_log_impl(&dword_214503000, v30, OS_LOG_TYPE_DEFAULT, "value:%@", buf, 0xCu);

          }
        }
        v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v34, (uint64_t)&v41, (uint64_t)v45, 16);
      }
      while (v26);
    }

    a1 = v39;
    v8 = v40;
    v10 = v37;
    v9 = v38;
  }
  else
  {
    handleForCategory(0);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      sub_2145691D8();

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1[7] + 8) + 40));

}

uint64_t sub_21451D528(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;

  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return objc_msgSend_resume(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2, v3, v4);
}

void sub_21451F7BC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_21451FFA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_214520008(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  const char *v8;
  NSObject *v9;

  v7 = a2;
  if ((objc_msgSend__writeDataToEAN_withKey_(*(void **)(a1 + 32), v8, a3, (uint64_t)v7) & 1) == 0)
  {
    handleForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_2145698E0();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }

}

void sub_214523DC0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_214523DE4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xEu);
}

void sub_214523E90(uint64_t a1, void *a2, _BYTE *a3)
{
  NSObject *v6;
  id v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  handleForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = (id)objc_opt_class();
    v7 = v18;
    _os_log_impl(&dword_214503000, v6, OS_LOG_TYPE_DEFAULT, "Inspecting Class: %@", (uint8_t *)&v17, 0xCu);

  }
  v8 = MGGetProductType();
  objc_msgSend_getDeviceHandlerForProductType_(a2, v9, v8, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 8);
  *(_QWORD *)(v12 + 8) = v11;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_opt_class();
      v17 = 138412290;
      v18 = v15;
      v16 = v15;
      _os_log_impl(&dword_214503000, v14, OS_LOG_TYPE_DEFAULT, "Chosen Class: %@", (uint8_t *)&v17, 0xCu);

    }
    *a3 = 1;
  }
}

void sub_214524178(uint64_t a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  v5 = objc_msgSend__init(v1, v2, v3, v4);
  v6 = (void *)qword_253E79828;
  qword_253E79828 = v5;

}

void sub_214524480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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
  _Block_object_dispose((const void *)(v9 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2145244C0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_2145244D0(uint64_t a1)
{

}

id sub_2145244D8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_214568430((uint64_t)v3, v4);

  v5 = (void *)MEMORY[0x24BDD1540];
  v11 = *MEMORY[0x24BDD0FC8];
  v12[0] = v3;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v6, (uint64_t)v12, (uint64_t)&v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(v5, v8, (uint64_t)CFSTR("com.apple.corerepair"), a1, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

intptr_t sub_2145245DC(_QWORD *a1, int a2, id obj)
{
  NSObject *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), obj);
  handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_214503000, v4, OS_LOG_TYPE_DEFAULT, "The read out DOFU is %@", (uint8_t *)&v7, 0xCu);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1[6] + 8) + 40));
}

id sub_2145286CC(int a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v10;
  id v11;
  id v12;
  const char *v13;
  void *v14;
  id v15;
  const char *v16;
  void *v17;
  void *v18;

  v10 = (objc_class *)MEMORY[0x24BDD16A8];
  v11 = a3;
  v12 = [v10 alloc];
  v14 = (void *)objc_msgSend_initWithFormat_arguments_(v12, v13, (uint64_t)v11, (uint64_t)&a9);

  v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v17 = v15;
  if (v14)
    objc_msgSend_setObject_forKeyedSubscript_(v15, v16, (uint64_t)v14, *MEMORY[0x24BDD0FC8]);
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v16, (uint64_t)CFSTR("com.apple.corerepair"), a1, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

id sub_21452878C(void *a1, int a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  __CFString *v21;
  void *v22;
  id v23;
  double v24;
  void *v25;
  uint64_t v27;

  v11 = a1;
  if (!v11)
  {
    sub_2145286CC(-39, v5, CFSTR("Invalid input."), v6, v7, v8, v9, v10, v27);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    goto LABEL_14;
  }
  v12 = (const void *)SecCertificateCreateWithPEM();
  if (a2)
  {
    SecCertificateNotValidAfter();
    if (v20 == 0.0)
    {
      v21 = CFSTR("Failed to obtain 'not valid after' date.");
      goto LABEL_12;
    }
LABEL_8:
    objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x24BDBCE60], v13, v14, v15);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v23 = v25;
      v22 = 0;
      if (!v12)
        goto LABEL_14;
      goto LABEL_13;
    }
    v21 = CFSTR("Failed to convert validity date.");
    goto LABEL_12;
  }
  SecCertificateNotValidBefore();
  if (v24 != 0.0)
    goto LABEL_8;
  v21 = CFSTR("Failed to obtain 'not valid before' date.");
LABEL_12:
  sub_2145286CC(-42, (uint64_t)v13, v21, v15, v16, v17, v18, v19, v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  if (v12)
LABEL_13:
    CFRelease(v12);
LABEL_14:
  if (a3 && !v23)
    *a3 = objc_retainAutorelease(v22);

  return v23;
}

void sub_214529DEC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void _logHandler(unsigned int a1, uint64_t a2)
{
  NSObject *v3;
  NSObject *v4;
  os_log_type_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (a1 < 4)
  {
    handleForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_21456B238(a2, v3);
  }
  else
  {
    if (a1 - 4 >= 3)
    {
      if (a1 == 7)
      {
        handleForCategory(0);
        v3 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
        v6 = 136315138;
        v7 = a2;
      }
      else
      {
        handleForCategory(0);
        v3 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
        v6 = 136315138;
        v7 = a2;
      }
      v4 = v3;
      v5 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_13;
    }
    handleForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v6 = 136315138;
      v7 = a2;
      v4 = v3;
      v5 = OS_LOG_TYPE_INFO;
LABEL_13:
      _os_log_impl(&dword_214503000, v4, v5, "%s\n", (uint8_t *)&v6, 0xCu);
    }
  }
LABEL_14:

}

id handleForCategory(unint64_t a1)
{
  id v2;
  id v3;

  if (qword_253E79860 != -1)
    dispatch_once(&qword_253E79860, &unk_24D1AA338);
  v2 = (id)MEMORY[0x24BDACB78];
  v3 = MEMORY[0x24BDACB78];
  if (a1 <= 1)
  {
    v2 = (id)qword_253E79868[a1];

  }
  return v2;
}

void sub_214529FE8()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;

  v0 = os_log_create("com.apple.corerepair", "device");
  v1 = (void *)qword_253E79868[0];
  qword_253E79868[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.corerepair", "device-error");
  v3 = (void *)qword_253E79870;
  qword_253E79870 = (uint64_t)v2;

}

id sub_21452A044()
{
  id v0;
  const char *v1;
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;

  v0 = objc_alloc(MEMORY[0x24BDD1988]);
  v3 = (void *)objc_msgSend_initWithServiceName_(v0, v1, (uint64_t)CFSTR("com.apple.CoreRepairCoreXPCService"), v2);
  objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], v4, (uint64_t)&unk_254D84E48, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRemoteObjectInterface_(v3, v7, (uint64_t)v6, v8);

  return v3;
}

id sub_21452A0A8(void *a1, _QWORD *a2)
{
  id v3;
  dispatch_semaphore_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  const char *v16;
  dispatch_time_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  NSObject *v23;
  id v24;
  uint64_t *v25;
  _QWORD v26[4];
  NSObject *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v3 = a1;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = sub_21452A2D8;
  v39 = sub_21452A2E8;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_21452A2D8;
  v33 = sub_21452A2E8;
  v34 = 0;
  v4 = dispatch_semaphore_create(0);
  sub_21452A044();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resume(v5, v6, v7, v8);
  v9 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = sub_21452A2F0;
  v26[3] = &unk_24D1AA360;
  v28 = &v29;
  v10 = v4;
  v27 = v10;
  objc_msgSend_remoteObjectProxyWithErrorHandler_(v5, v11, (uint64_t)v26, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v9;
  v22[1] = 3221225472;
  v22[2] = sub_21452A33C;
  v22[3] = &unk_24D1AA388;
  v25 = &v35;
  v14 = v10;
  v23 = v14;
  v15 = v5;
  v24 = v15;
  objc_msgSend_generateRepairReport_withReply_(v13, v16, (uint64_t)v3, (uint64_t)v22);

  v17 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v14, v17))
  {
    sub_214512470((void *)0xFFFFFFFFFFFFFFD6, CFSTR("XPC call timeout"), 0);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v30[5];
    v30[5] = v18;

  }
  if (a2)
    *a2 = objc_retainAutorelease((id)v30[5]);
  v20 = (id)v36[5];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v20;
}

void sub_21452A2B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21452A2D8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_21452A2E8(uint64_t a1)
{

}

intptr_t sub_21452A2F0(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  sub_214512470((void *)0xFFFFFFFFFFFFFFD6, CFSTR("XPC call failed"), a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_21452A33C(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11[16];

  v3 = a2;
  handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_214503000, v4, OS_LOG_TYPE_DEFAULT, "Got report", v11, 2u);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  objc_msgSend_invalidate(*(void **)(a1 + 40), v8, v9, v10);

}

BOOL CRGenerateRepairReport(void *a1, uint64_t *a2, _QWORD *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  _BOOL8 v8;
  id v10;

  if (!a2)
    return 0;
  v10 = 0;
  sub_21452A0A8(a1, &v10);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v10;
  v7 = v6;
  *a2 = v5;
  if (a3)
    *a3 = v6;
  v8 = v7 == 0;

  return v8;
}

uint64_t sub_21452A464(uint64_t a1, _QWORD *a2)
{
  NSObject *v4;
  dispatch_semaphore_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  const char *v17;
  dispatch_time_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _QWORD v23[4];
  NSObject *v24;
  id v25;
  uint64_t *v26;
  uint8_t *v27;
  _QWORD v28[4];
  NSObject *v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  int v34;
  uint8_t buf[8];
  uint8_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = a1;
    _os_log_impl(&dword_214503000, v4, OS_LOG_TYPE_DEFAULT, "Get state of component %d", buf, 8u);
  }

  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  *(_QWORD *)buf = 0;
  v36 = buf;
  v37 = 0x3032000000;
  v38 = sub_21452A2D8;
  v39 = sub_21452A2E8;
  v40 = 0;
  v5 = dispatch_semaphore_create(0);
  sub_21452A044();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resume(v6, v7, v8, v9);
  v10 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = sub_21452A708;
  v28[3] = &unk_24D1AA360;
  v30 = buf;
  v11 = v5;
  v29 = v11;
  objc_msgSend_remoteObjectProxyWithErrorHandler_(v6, v12, (uint64_t)v28, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v10;
  v23[1] = 3221225472;
  v23[2] = sub_21452A754;
  v23[3] = &unk_24D1AA3B0;
  v26 = &v31;
  v27 = buf;
  v15 = v11;
  v24 = v15;
  v16 = v6;
  v25 = v16;
  objc_msgSend_getComponentState_withReply_(v14, v17, a1, (uint64_t)v23);

  v18 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v15, v18))
  {
    sub_214512470((void *)0xFFFFFFFFFFFFFFD6, CFSTR("XPC call timeout"), 0);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)*((_QWORD *)v36 + 5);
    *((_QWORD *)v36 + 5) = v19;

  }
  if (a2)
    *a2 = objc_retainAutorelease(*((id *)v36 + 5));
  v21 = *((unsigned int *)v32 + 6);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v31, 8);
  return v21;
}

void sub_21452A6DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_21452A708(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  sub_214512470((void *)0xFFFFFFFFFFFFFFD6, CFSTR("XPC call failed"), a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_21452A754(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  handleForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109120;
    v13[1] = a2;
    _os_log_impl(&dword_214503000, v6, OS_LOG_TYPE_DEFAULT, "Got state: %d", (uint8_t *)v13, 8u);
  }

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  objc_msgSend_invalidate(*(void **)(a1 + 40), v10, v11, v12);

}

uint64_t CRGetComponentState(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  id v7;

  v7 = 0;
  v3 = sub_21452A464(a1, &v7);
  v4 = v7;
  v5 = v4;
  if (a2)
    *a2 = v4;

  return v3;
}

uint64_t CRCopySupportedComponents(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_getSupportedComponents(CRRepairReport, a2, a3, a4);
  return objc_claimAutoreleasedReturnValue();
}

uint64_t CRIsSelfRepairedComponent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x24BEDD108](CRRepairReport, sel_isSelfRepairedComponent_, a1, a4);
}

void sub_21452A97C(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_253E79830;
  qword_253E79830 = (uint64_t)v1;

}

id sub_21452AEF8(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  id i;
  unsigned int v13;
  void *v14;

  v1 = objc_retainAutorelease(a1);
  v5 = (unsigned __int8 *)objc_msgSend_bytes(v1, v2, v3, v4);
  v9 = objc_msgSend_length(v1, v6, v7, v8);
  for (i = objc_alloc_init(MEMORY[0x24BDD16A8]); v9; --v9)
  {
    v13 = *v5++;
    objc_msgSend_appendFormat_(i, v10, (uint64_t)CFSTR("%02X"), v11, v13);
  }
  objc_msgSend_stringWithString_(MEMORY[0x24BDD17C8], v10, (uint64_t)i, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id sub_21452AF94(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const char *v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  unsigned __int8 v18;
  const char *v19;
  char __str[2];
  __int16 v22;

  v3 = a3;
  v7 = v3;
  v22 = 0;
  if (v3)
  {
    objc_msgSend_lowercaseString(v3, v4, v5, v6);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_opt_new();
    v12 = objc_msgSend_length(v8, v9, v10, v11);
    if (v12 >= 2)
    {
      v15 = 0;
      v16 = v12 - 1;
      do
      {
        v17 = v15 + 1;
        v18 = objc_msgSend_characterAtIndex_(v8, v13, v15, v14);
        if ((char)v18 >= 48 && v18 <= 0x66u && v18 - 58 >= 0x27)
        {
          __str[0] = v18;
          __str[1] = objc_msgSend_characterAtIndex_(v8, v13, v17, v14);
          HIBYTE(v22) = strtol(__str, 0, 16);
          objc_msgSend_appendBytes_length_(v7, v19, (uint64_t)&v22 + 1, 1);
          v17 = v15 + 2;
        }
        v15 = v17;
      }
      while (v17 < v16);
    }
  }
  else
  {
    handleForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      sub_21456B434(v8);
      v7 = 0;
    }
  }

  return v7;
}

void sub_21452B388(uint64_t a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  v5 = objc_msgSend__init(v1, v2, v3, v4);
  v6 = (void *)qword_253E79838;
  qword_253E79838 = v5;

}

void sub_21452B758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21452B788(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_21452B798(uint64_t a1)
{

}

void sub_21452B7A0(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void sub_21452BAB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21452BAFC(_QWORD *a1, int a2, int a3, id obj, uint64_t a5, int a6)
{
  id v8;

  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a6;
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), obj);
  v8 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1[6] + 8) + 40));

}

id sub_21452BB98(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  CC_LONG v10;
  const char *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  unsigned __int8 md[16];
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    *(_OWORD *)md = 0u;
    v17 = 0u;
    v4 = objc_retainAutorelease(a1);
    v7 = (void *)objc_msgSend_cStringUsingEncoding_(v4, v5, 4, v6);
    v10 = objc_msgSend_lengthOfBytesUsingEncoding_(v4, v8, 4, v9);
    if (v7)
    {
      CC_SHA256(v7, v10, md);
      objc_msgSend_stringWithCapacity_(MEMORY[0x24BDD16A8], v11, 64, v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      for (i = 0; i != 32; ++i)
        objc_msgSend_appendFormat_(v7, a2, (uint64_t)CFSTR("%02X"), a4, md[i]);
    }
  }
  else
  {
    v7 = 0;
  }
  v14 = (void *)objc_msgSend_copy(v7, a2, a3, a4);

  return v14;
}

void sub_21452C01C(uint64_t a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  v5 = objc_msgSend__init(v1, v2, v3, v4);
  v6 = (void *)qword_253E79840;
  qword_253E79840 = v5;

}

void sub_21452EA00(uint64_t a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  v5 = objc_msgSend__init(v1, v2, v3, v4);
  v6 = (void *)qword_253E79848;
  qword_253E79848 = v5;

}

void sub_214530584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a53, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2145305EC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_2145305FC(uint64_t a1)
{

}

void sub_214530604(uint64_t a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  if ((objc_msgSend_containsString_(v7, v3, (uint64_t)CFSTR("trustobject-"), v4) & 1) == 0)
    objc_msgSend_addObject_(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v5, (uint64_t)v7, v6);

}

void sub_214530658(uint64_t a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  if ((objc_msgSend_containsString_(v7, v3, (uint64_t)CFSTR("trustobject-"), v4) & 1) == 0)
    objc_msgSend_addObject_(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v5, (uint64_t)v7, v6);

}

void sub_2145328A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  const char *v8;
  id v9;

  v9 = (id)objc_opt_new();
  objc_msgSend_vcrtSign_outSignature_outDeviceNonce_outError_(v9, v8, a1, a2, a3, a4);

}

void sub_214532900(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  const char *v8;
  id v9;

  v9 = (id)objc_opt_new();
  objc_msgSend_bcrtSign_outSignature_outDeviceNonce_outError_(v9, v8, a1, a2, a3, a4);

}

void sub_214532960(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  const char *v8;
  id v9;

  v9 = (id)objc_opt_new();
  objc_msgSend_tcrtSign_outSignature_outDeviceNonce_outError_(v9, v8, a1, a2, a3, a4);

}

void sub_2145329C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  const char *v8;
  id v9;

  v9 = (id)objc_opt_new();
  objc_msgSend_prpcSign_outSignature_outDeviceNonce_outError_(v9, v8, a1, a2, a3, a4);

}

void sub_214532A9C()
{
  CoreRepairHelper *v0;
  void *v1;

  v0 = objc_alloc_init(CoreRepairHelper);
  v1 = (void *)qword_254D7B0B0;
  qword_254D7B0B0 = (uint64_t)v0;

}

void sub_21453353C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_214534168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_214534190(uint64_t a1, int a2, xpc_object_t xint)
{
  int64_t value;
  NSObject *v5;
  NSObject *v6;

  value = xpc_int64_get_value(xint);
  if (value == 37 || value == 17)
  {
    handleForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_21456C3E8();

  }
  else if (value)
  {
    handleForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_21456C37C();

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  return 1;
}

void *sub_21453430C()
{
  void *result;

  result = dlopen("/usr/lib/system/libxpc.dylib", 2);
  qword_254D7B0C8 = (uint64_t)result;
  return result;
}

void sub_214537640(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_214538B54(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_214538FD0()
{
  CRDeviceComponent *v0;
  const char *v1;
  CRDeviceComponent *v2;
  const char *v3;
  CRDeviceComponent *v4;
  const char *v5;
  CRDeviceComponent *v6;
  const char *v7;
  CRDeviceComponent *v8;
  const char *v9;
  CRDeviceComponent *v10;
  const char *v11;
  void *v12;
  CRDeviceComponent *v13;
  const char *v14;
  void *v15;
  CRDeviceComponent *v16;
  const char *v17;
  CRDeviceComponent *v18;
  const char *v19;
  void *v20;
  CRDeviceComponent *v21;
  const char *v22;
  void *v23;
  CRDeviceComponent *v24;
  const char *v25;
  void *v26;
  CRDeviceComponent *v27;
  const char *v28;
  void *v29;
  CRDeviceComponent *v30;
  const char *v31;
  void *v32;
  CRDeviceComponent *v33;
  const char *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  CRDevice *v40;
  const char *v41;
  const char *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _QWORD v57[3];
  void *v58;
  _QWORD v59[8];
  _QWORD v60[6];
  _QWORD v61[7];

  v61[5] = *MEMORY[0x24BDAC8D0];
  v0 = [CRDeviceComponent alloc];
  v56 = (void *)objc_msgSend_initWithType_name_spc_fdrKeys_(v0, v1, 1024, (uint64_t)CFSTR("Battery"), CFSTR("IPHONE COMP BATTERY"), &unk_24D1B8848);
  v2 = [CRDeviceComponent alloc];
  v55 = (void *)objc_msgSend_initWithType_name_spc_fdrKeys_(v2, v3, 1025, (uint64_t)CFSTR("Display"), CFSTR("IPHONE COMP DISPLAY"), &unk_24D1B8860);
  v4 = [CRDeviceComponent alloc];
  v54 = (void *)objc_msgSend_initWithType_name_spc_fdrKeys_(v4, v5, 1026, (uint64_t)CFSTR("Camera"), CFSTR("IPHONE COMP CAMERA"), &unk_24D1B8878);
  v6 = [CRDeviceComponent alloc];
  v51 = (void *)objc_msgSend_initWithType_name_spc_fdrKeys_(v6, v7, 1029, (uint64_t)CFSTR("RearSystem"), CFSTR("IPHONE REAR ASSEMBLY"), &unk_24D1B8890);
  v8 = [CRDeviceComponent alloc];
  v53 = (void *)objc_msgSend_initWithType_name_spc_fdrKeys_(v8, v9, 1029, (uint64_t)CFSTR("RearSystem"), CFSTR("IPHONE MID ASSEMBLY"), &unk_24D1B88A8);
  v10 = [CRDeviceComponent alloc];
  v12 = (void *)objc_msgSend_initWithType_name_spc_fdrKeys_(v10, v11, 1030, (uint64_t)CFSTR("BackGlass"), CFSTR("IPHONE BACK GLASS"), &unk_24D1B88C0);
  v13 = [CRDeviceComponent alloc];
  v15 = (void *)objc_msgSend_initWithType_name_spc_fdrKeys_(v13, v14, 1027, (uint64_t)CFSTR("FaceID"), CFSTR("IPHONE COMP FACEID"), &unk_24D1B88D8);
  v16 = [CRDeviceComponent alloc];
  v52 = (void *)objc_msgSend_initWithType_name_spc_fdrKeys_(v16, v17, 1032, (uint64_t)CFSTR("MidEnclosure"), CFSTR("IPHONE COMP ENCL"), &unk_24D1B88F0);
  v18 = [CRDeviceComponent alloc];
  v20 = (void *)objc_msgSend_initWithType_name_spc_fdrKeys_(v18, v19, 1026, (uint64_t)CFSTR("Camera"), CFSTR("IPHONE COMP RCAM"), &unk_24D1B8908);
  v21 = [CRDeviceComponent alloc];
  v23 = (void *)objc_msgSend_initWithType_name_spc_fdrKeys_(v21, v22, 1029, (uint64_t)CFSTR("RearSystem"), CFSTR("IPHONE MCTUB"), &unk_24D1B8920);
  v24 = [CRDeviceComponent alloc];
  v26 = (void *)objc_msgSend_initWithType_name_(v24, v25, 1031, (uint64_t)CFSTR("MainMicrophone"));
  v27 = [CRDeviceComponent alloc];
  v29 = (void *)objc_msgSend_initWithType_name_spc_fdrKeys_(v27, v28, 1025, (uint64_t)CFSTR("Display"), CFSTR("IPAD COMP DISPLAY"), &unk_24D1B8938);
  v30 = [CRDeviceComponent alloc];
  v32 = (void *)objc_msgSend_initWithType_name_spc_fdrKeys_(v30, v31, 1027, (uint64_t)CFSTR("FaceID"), CFSTR("IPAD FRONT CAMERA"), &unk_24D1B8950);
  v33 = [CRDeviceComponent alloc];
  v35 = (void *)objc_msgSend_initWithType_name_spc_fdrKeys_(v33, v34, 1026, (uint64_t)CFSTR("Camera"), CFSTR("IPAD REAR CAMERA"), &unk_24D1B8968);
  v36 = MGGetProductType();
  if (v36 <= 2622433983)
  {
    if (v36 <= 851437780)
    {
      if (v36 > 555503453)
      {
        if (v36 != 555503454)
        {
          if (v36 != 574536383)
          {
            v37 = 810906663;
            goto LABEL_28;
          }
LABEL_32:
          v40 = [CRDevice alloc];
          v59[0] = v56;
          v59[1] = v55;
          v59[2] = v12;
          v59[3] = v15;
          v59[4] = v52;
          v59[5] = v20;
          v59[6] = v23;
          v59[7] = v26;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v43, (uint64_t)v59, 8);
          goto LABEL_38;
        }
LABEL_21:
        v40 = [CRDevice alloc];
        v57[0] = v29;
        v57[1] = v32;
        v57[2] = v35;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v41, (uint64_t)v57, 3);
LABEL_38:
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend_initWithComponents_(v40, v47, (uint64_t)v46, v48);
        v50 = (void *)qword_253E79810;
        qword_253E79810 = v49;

        goto LABEL_39;
      }
      if (v36 != 133314240)
      {
        v38 = 330877086;
LABEL_24:
        if (v36 != v38)
          goto LABEL_39;
        goto LABEL_32;
      }
      goto LABEL_36;
    }
    if (v36 > 2021146988)
    {
      if (v36 != 2021146989)
      {
        if (v36 != 2487868872 && v36 != 2619317134)
          goto LABEL_39;
        goto LABEL_21;
      }
      goto LABEL_36;
    }
    if (v36 == 851437781)
      goto LABEL_32;
    v39 = 1434404433;
LABEL_35:
    if (v36 != v39)
      goto LABEL_39;
    goto LABEL_36;
  }
  if (v36 > 2940697644)
  {
    if (v36 <= 3241053351)
    {
      if (v36 != 2940697645)
      {
        v39 = 2941181571;
        goto LABEL_35;
      }
LABEL_37:
      v40 = [CRDevice alloc];
      v61[0] = v56;
      v61[1] = v55;
      v61[2] = v54;
      v61[3] = v51;
      v61[4] = v15;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v45, (uint64_t)v61, 5);
      goto LABEL_38;
    }
    if (v36 == 3241053352)
      goto LABEL_21;
    if (v36 != 3677894691)
    {
      v39 = 3825599860;
      goto LABEL_35;
    }
LABEL_29:
    v40 = [CRDevice alloc];
    v58 = v29;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v42, (uint64_t)&v58, 1);
    goto LABEL_38;
  }
  if (v36 > 2688879998)
  {
    if (v36 != 2688879999)
    {
      if (v36 != 2793418701)
      {
        v38 = 2795618603;
        goto LABEL_24;
      }
LABEL_36:
      v40 = [CRDevice alloc];
      v60[0] = v56;
      v60[1] = v55;
      v60[2] = v54;
      v60[3] = v53;
      v60[4] = v12;
      v60[5] = v15;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v44, (uint64_t)v60, 6);
      goto LABEL_38;
    }
    goto LABEL_37;
  }
  if (v36 == 2622433984)
    goto LABEL_29;
  v37 = 2634105757;
LABEL_28:
  if (v36 == v37)
    goto LABEL_29;
LABEL_39:

}

void sub_21453963C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_array(MEMORY[0x24BDBCEB8], a2, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_currentDevice(*(void **)(a1 + 32), v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9;
  if (v9)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend_components(v9, v10, v11, v12, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v30, (uint64_t)v34, 16);
    if (v16)
    {
      v20 = v16;
      v21 = *(_QWORD *)v31;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v31 != v21)
            objc_enumerationMutation(v14);
          v23 = (void *)MEMORY[0x24BDD16E0];
          v24 = objc_msgSend_type(*(void **)(*((_QWORD *)&v30 + 1) + 8 * v22), v17, v18, v19);
          objc_msgSend_numberWithUnsignedInt_(v23, v25, v24, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v5, v28, (uint64_t)v27, v29);

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v30, (uint64_t)v34, 16);
      }
      while (v20);
    }

    objc_storeStrong((id *)&qword_253E79820, v5);
  }

}

void sub_21453A7D4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_21453AA18(uint64_t a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  v5 = objc_msgSend__init(v1, v2, v3, v4);
  v6 = (void *)qword_253E79850;
  qword_253E79850 = v5;

}

void sub_21453AE50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v10;
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v10 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21453AE90(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_21453AEA0(uint64_t a1)
{

}

void sub_21453AEA8(_QWORD *a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v7 = a3;
  v8 = a4;
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  v9 = *(_QWORD *)(a1[5] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;
  v13 = v7;

  v11 = *(_QWORD *)(a1[6] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v8;

}

void sub_21453B250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21453B2A8(_QWORD *a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;

  v7 = a2;
  v8 = a3;
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a4;
  v9 = *(_QWORD *)(a1[5] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;
  v14 = v7;

  v11 = *(_QWORD *)(a1[6] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v8;
  v13 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1[7] + 8) + 40));
}

void sub_21453F1B0(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = a1;
    v7 = 2080;
    v8 = a2;
    _os_log_impl(&dword_214503000, v4, OS_LOG_TYPE_DEFAULT, "%s: %s", (uint8_t *)&v5, 0x16u);
  }

}

id sub_214540690(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend_SHA256DigestData(a1, a2, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  if (v4)
  {
    objc_msgSend_convertToHexString(v4, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id sub_2145406D8(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  CC_LONG v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  const char *v27;
  void *v28;
  NSObject *v29;
  CC_SHA256_CTX v31;
  unsigned __int8 md[16];
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  memset(&v31, 0, sizeof(v31));
  *(_OWORD *)md = 0u;
  v33 = 0u;
  if (!a1)
  {
    handleForCategory(0);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_21456DC48();
    goto LABEL_10;
  }
  v4 = (void *)MEMORY[0x24BDD1578];
  objc_msgSend_path(a1, a2, a3, a4, *(_OWORD *)v31.count, *(_OWORD *)&v31.hash[2], *(_OWORD *)&v31.hash[6], *(_OWORD *)&v31.wbuf[2], *(_OWORD *)&v31.wbuf[6], *(_OWORD *)&v31.wbuf[10], *(_QWORD *)&v31.wbuf[14]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileHandleForReadingAtPath_(v4, v6, (uint64_t)v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    handleForCategory(0);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_21456DC74();
LABEL_10:

    v8 = 0;
    v28 = 0;
    goto LABEL_11;
  }
  v9 = CC_SHA256_Init(&v31);
  do
  {
    v10 = (void *)MEMORY[0x2199D19CC](v9);
    objc_msgSend_readDataOfLength_(v8, v11, 1024, v12);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = (const void *)objc_msgSend_bytes(v13, v14, v15, v16);
    v21 = objc_msgSend_length(v13, v18, v19, v20);
    CC_SHA256_Update(&v31, v17, v21);
    v25 = objc_msgSend_length(v13, v22, v23, v24);

    objc_autoreleasePoolPop(v10);
  }
  while (v25);
  CC_SHA256_Final(md, &v31);
  v26 = objc_alloc(MEMORY[0x24BDBCE50]);
  v28 = (void *)objc_msgSend_initWithBytes_length_(v26, v27, (uint64_t)md, 32);
LABEL_11:

  return v28;
}

id sub_214540868(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  CC_LONG v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  const char *v27;
  void *v28;
  NSObject *v29;
  CC_SHA512_CTX v31;
  unsigned __int8 md[16];
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  memset(&v31, 0, sizeof(v31));
  v33 = 0u;
  v34 = 0u;
  *(_OWORD *)md = 0u;
  if (!a1)
  {
    handleForCategory(0);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_21456DC48();
    goto LABEL_10;
  }
  v4 = (void *)MEMORY[0x24BDD1578];
  objc_msgSend_path(a1, a2, a3, a4, *(_OWORD *)v31.count, *(_OWORD *)v31.hash, *(_OWORD *)&v31.hash[2], *(_OWORD *)&v31.hash[4], *(_OWORD *)&v31.hash[6], *(_OWORD *)v31.wbuf, *(_OWORD *)&v31.wbuf[2], *(_OWORD *)&v31.wbuf[4], *(_OWORD *)&v31.wbuf[6], *(_OWORD *)&v31.wbuf[8], *(_OWORD *)&v31.wbuf[10], *(_OWORD *)&v31.wbuf[12], *(_OWORD *)&v31.wbuf[14], *(_QWORD *)md, *(_QWORD *)&md[8],
    v33,
    v34);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileHandleForReadingAtPath_(v4, v6, (uint64_t)v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    handleForCategory(0);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_21456DC74();
LABEL_10:

    v8 = 0;
    v28 = 0;
    goto LABEL_11;
  }
  v9 = CC_SHA384_Init(&v31);
  do
  {
    v10 = (void *)MEMORY[0x2199D19CC](v9);
    objc_msgSend_readDataOfLength_(v8, v11, 1024, v12);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = (const void *)objc_msgSend_bytes(v13, v14, v15, v16);
    v21 = objc_msgSend_length(v13, v18, v19, v20);
    CC_SHA384_Update(&v31, v17, v21);
    v25 = objc_msgSend_length(v13, v22, v23, v24);

    objc_autoreleasePoolPop(v10);
  }
  while (v25);
  CC_SHA384_Final(md, &v31);
  v26 = objc_alloc(MEMORY[0x24BDBCE50]);
  v28 = (void *)objc_msgSend_initWithBytes_length_(v26, v27, (uint64_t)md, 48);
LABEL_11:

  return v28;
}

id sub_214542B18(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend_SHA256DigestData(a1, a2, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  if (v4)
  {
    objc_msgSend_convertToHexString(v4, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id sub_214542B60(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  CC_LONG v9;
  id v10;
  const char *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v22 = 0u;
  v23 = 0u;
  if (a1)
  {
    v1 = objc_retainAutorelease(a1);
    v5 = (const void *)objc_msgSend_bytes(v1, v2, v3, v4, v22, v23);
    v9 = objc_msgSend_length(v1, v6, v7, v8);
    CC_SHA256(v5, v9, (unsigned __int8 *)&v22);
    v10 = objc_alloc(MEMORY[0x24BDBCE50]);
    v12 = (void *)objc_msgSend_initWithBytes_length_(v10, v11, (uint64_t)&v22, 32);
  }
  else
  {
    handleForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_21456DE50(v13, v14, v15, v16, v17, v18, v19, v20);

    v12 = 0;
  }
  return v12;
}

id sub_214542C28(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  CC_LONG v9;
  id v10;
  const char *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v23 = 0u;
  v24 = 0u;
  v22 = 0u;
  if (a1)
  {
    v1 = objc_retainAutorelease(a1);
    v5 = (const void *)objc_msgSend_bytes(v1, v2, v3, v4, v22, v23, v24);
    v9 = objc_msgSend_length(v1, v6, v7, v8);
    CC_SHA384(v5, v9, (unsigned __int8 *)&v22);
    v10 = objc_alloc(MEMORY[0x24BDBCE50]);
    v12 = (void *)objc_msgSend_initWithBytes_length_(v10, v11, (uint64_t)&v22, 48);
  }
  else
  {
    handleForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_21456DE50(v13, v14, v15, v16, v17, v18, v19, v20);

    v12 = 0;
  }
  return v12;
}

id sub_214542CF4(void *a1, uint64_t a2, uint64_t a3, void *a4, _BYTE *a5)
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v8 = a4;
  objc_msgSend_objectForKey_(a1, v9, a3, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v12;
    }
    else
    {
      v13 = v8;

      if (a5)
        *a5 = 1;
    }
  }
  else
  {
    v13 = v8;
  }

  return v13;
}

id sub_214542D90(void *a1, uint64_t a2, uint64_t a3, void *a4, _BYTE *a5)
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v8 = a4;
  objc_msgSend_objectForKey_(a1, v9, a3, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v12;
    }
    else
    {
      v13 = v8;

      if (a5)
        *a5 = 1;
    }
  }
  else
  {
    v13 = v8;
  }

  return v13;
}

id sub_214542E2C(void *a1, uint64_t a2, uint64_t a3, void *a4, _BYTE *a5)
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v8 = a4;
  objc_msgSend_objectForKey_(a1, v9, a3, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v12;
    }
    else
    {
      v13 = v8;

      if (a5)
        *a5 = 1;
    }
  }
  else
  {
    v13 = v8;
  }

  return v13;
}

id sub_214542EC8(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, _BYTE *a6)
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v10 = a4;
  v11 = a5;
  objc_msgSend_NSStringFromKey_defaultValue_failed_(a1, v12, a3, (uint64_t)v11, a6);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v16 = (void *)v13;
    if ((objc_msgSend_containsObject_(v10, v14, v13, v15) & 1) != 0)
    {
      v17 = v16;
    }
    else
    {
      v17 = v11;

      if (a6)
        *a6 = 1;
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

id sub_214542F74(void *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, _BYTE *a7)
{
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  id v24;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a3;
  NSLog(CFSTR(" utility called"));
  objc_msgSend_objectForKey_(a1, v16, (uint64_t)v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v21 = objc_msgSend_compare_(v18, v19, (uint64_t)v13, v20),
          (unint64_t)objc_msgSend_compare_(v18, v22, (uint64_t)v12, v23) <= 1)
      && (unint64_t)(v21 + 1) < 2)
    {
      v24 = v18;
    }
    else
    {
      v24 = v14;

      if (a7)
        *a7 = 1;
    }
  }
  else
  {
    v24 = v14;
  }

  return v24;
}

uint64_t sub_214543088(void *a1, const char *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  v6 = a4;
  objc_msgSend_objectForKey_(a1, a2, a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v6 = objc_msgSend_BOOLValue(v7, v8, v9, v10);
    }
    else if (a5)
    {
      *a5 = 1;
    }
  }

  return v6;
}

id sub_2145430F8(void *a1, uint64_t a2, uint64_t a3, void *a4, _BYTE *a5)
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v8 = a4;
  objc_msgSend_objectForKey_(a1, v9, a3, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v12;
    }
    else
    {
      v13 = v8;

      if (a5)
        *a5 = 1;
    }
  }
  else
  {
    v13 = v8;
  }

  return v13;
}

id sub_214543194(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;

  v10 = a4;
  objc_msgSend_NSDictionaryFromKey_defaultValue_failed_(a1, v11, a3, a5, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v12;
  if (v12)
  {
    v17 = (void *)MEMORY[0x24BDBCEF0];
    objc_msgSend_allKeys(v12, v13, v14, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v17, v19, (uint64_t)v18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_intersectSet_(v21, v22, (uint64_t)v10, v23);
    objc_msgSend_allObjects(v21, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionaryWithValuesForKeys_(v16, v28, (uint64_t)v27, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v30 = 0;
  }

  return v30;
}

uint64_t sub_214543270(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return objc_msgSend_NSArrayFromKey_types_maxLength_defaultValue_failed_validator_(a1, a2, a3, a4, a5, a6, a7, &unk_24D1AA4F0);
}

uint64_t sub_21454327C()
{
  return 1;
}

id sub_214543284(void *a1, uint64_t a2, uint64_t a3, void *a4, unint64_t a5, void *a6, _BYTE *a7, void *a8)
{
  id v14;
  id v15;
  unsigned int (**v16)(id, _QWORD);
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  objc_class *Superclass;
  const char *v35;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v14 = a4;
  v15 = a6;
  v16 = a8;
  objc_msgSend_objectForKey_(a1, v17, a3, v18);
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_count(v20, v21, v22, v23) <= a5)
    {
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v24 = v20;
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v38, (uint64_t)v42, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v39;
        v37 = *(_QWORD *)v39;
        while (2)
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v39 != v28)
              objc_enumerationMutation(v24);
            v30 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
            v31 = objc_opt_class();
            if (!v31)
              goto LABEL_19;
            Superclass = (objc_class *)v31;
            while ((objc_msgSend_containsObject_(v14, v32, (uint64_t)Superclass, v33) & 1) == 0)
            {
              Superclass = class_getSuperclass(Superclass);
              if (!Superclass)
                goto LABEL_19;
            }
            if (!v16[2](v16, v30))
            {
LABEL_19:

              goto LABEL_20;
            }
            v28 = v37;
          }
          v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v35, (uint64_t)&v38, (uint64_t)v42, 16);
          if (v27)
            continue;
          break;
        }
      }

    }
    else
    {
LABEL_20:
      v24 = v15;

      if (a7)
        *a7 = 1;
    }
  }
  else
  {
    v24 = v15;
  }

  return v24;
}

id sub_214543474(void *a1, uint64_t a2, uint64_t a3, void *a4, unint64_t a5, void *a6, _BYTE *a7)
{
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a6;
  objc_msgSend_objectForKey_(a1, v14, a3, v15);
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_count(v17, v18, v19, v20) <= a5)
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v21 = v17;
      v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v30, (uint64_t)v34, 16);
      if (v23)
      {
        v26 = v23;
        v27 = *(_QWORD *)v31;
        while (2)
        {
          v28 = 0;
          do
          {
            if (*(_QWORD *)v31 != v27)
              objc_enumerationMutation(v21);
            if (!objc_msgSend_containsObject_(v12, v24, *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v28), v25, (_QWORD)v30))
            {

              goto LABEL_15;
            }
            ++v28;
          }
          while (v26 != v28);
          v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v30, (uint64_t)v34, 16);
          if (v26)
            continue;
          break;
        }
      }

    }
    else
    {
LABEL_15:
      v21 = v13;

      if (a7)
        *a7 = 1;
    }
  }
  else
  {
    v21 = v13;
  }

  return v21;
}

__CFString *sub_214543610(void *a1, const char *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  __CFString *v6;

  objc_msgSend_NSStringFromKey_defaultValue_failed_(a1, a2, a3, 0);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (a5)
      *a5 = 1;
    v6 = &stru_24D1AB488;
  }
  return v6;
}

id sub_214543650(void *a1, uint64_t a2, uint64_t a3, void *a4, _BYTE *a5)
{
  id v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v8 = a4;
  objc_msgSend_NSStringFromKey_inSet_defaultValue_failed_(a1, v9, a3, (uint64_t)v8, 0, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend_anyObject(v8, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (a5)
      *a5 = 1;
  }

  return v13;
}

id sub_2145436CC(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, _BYTE *a6)
{
  id v10;
  const char *v11;
  id v12;

  v10 = a4;
  objc_msgSend_NSNumberFromKey_lowerBound_upperBound_defaultValue_failed_(a1, v11, a3, (uint64_t)v10, a5, 0, a6);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v12 = v10;
    if (a6)
      *a6 = 1;
  }

  return v12;
}

uint64_t sub_214543750(void *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  uint64_t v11;

  v6 = a3;
  objc_msgSend_objectForKey_(a1, v7, (uint64_t)v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = objc_msgSend_BOOLFromKey_defaultValue_failed_(a1, v9, (uint64_t)v6, 0, a4);
  }
  else
  {
    v11 = 0;
    if (a4)
      *a4 = 1;
  }

  return v11;
}

id sub_2145437D0(void *a1, const char *a2, uint64_t a3, _BYTE *a4)
{
  void *v5;

  objc_msgSend_NSDictionaryFromKey_defaultValue_failed_(a1, a2, a3, 0, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (a4)
      *a4 = 1;
    v5 = (void *)MEMORY[0x24BDBD1B8];
  }
  return v5;
}

id sub_214543814(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;

  v8 = a4;
  objc_msgSend_NSDictionaryFromRequiredKey_failed_(a1, v9, a3, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10;
  if (v10)
  {
    v15 = (void *)MEMORY[0x24BDBCEF0];
    objc_msgSend_allKeys(v10, v11, v12, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v15, v17, (uint64_t)v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_intersectSet_(v19, v20, (uint64_t)v8, v21);
    objc_msgSend_allObjects(v19, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionaryWithValuesForKeys_(v14, v26, (uint64_t)v25, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v28 = (void *)MEMORY[0x24BDBD1B8];
  }

  return v28;
}

id sub_2145438EC(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  void *v7;

  objc_msgSend_NSArrayFromKey_types_maxLength_defaultValue_failed_(a1, a2, a3, a4, a5, 0, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (a6)
      *a6 = 1;
    v7 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v7;
}

id sub_214543930(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, _BYTE *a6, uint64_t a7)
{
  void *v8;

  objc_msgSend_NSArrayFromKey_types_maxLength_defaultValue_failed_validator_(a1, a2, a3, a4, a5, 0, a6, a7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (a6)
      *a6 = 1;
    v8 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v8;
}

id sub_214543978(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  void *v7;

  objc_msgSend_NSArrayFromKey_inSet_maxLength_defaultValue_failed_(a1, a2, a3, a4, a5, 0, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (a6)
      *a6 = 1;
    v7 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v7;
}

CFDataRef sub_2145459D4(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  CFDataRef v17;
  CFDataRef v18;
  NSObject *v20;
  CFIndex v21;
  const UInt8 *v22;
  _OWORD v23[28];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v5 = v2;
  v24 = 0;
  memset(v23, 0, sizeof(v23));
  v21 = 0;
  v22 = 0;
  if (!v2)
  {
    handleForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_21456E5F4();
    goto LABEL_12;
  }
  objc_msgSend_objectForKeyedSubscript_(v2, v3, *MEMORY[0x24BEDA7E0], v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    handleForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_21456E620();
LABEL_12:
    v7 = 0;
LABEL_19:

    v18 = 0;
    goto LABEL_7;
  }
  v7 = objc_retainAutorelease(v6);
  v11 = objc_msgSend_bytes(v7, v8, v9, v10);
  v15 = objc_msgSend_length(v7, v12, v13, v14);
  if (sub_21455E170(v11, v15, (uint64_t)v23))
  {
    handleForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_21456E6A4();
    goto LABEL_19;
  }
  sub_21455DF44((uint64_t)v23, 1718903152, 1145525076, &v22, &v21);
  if (v16)
  {
    handleForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_21456E678();
    goto LABEL_19;
  }
  v17 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v22, v21);
  if (!v17)
  {
    handleForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_21456E64C();
    goto LABEL_19;
  }
  v18 = v17;
LABEL_7:

  return v18;
}

id sub_214545BDC(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  _QWORD v23[2];
  _QWORD v24[4];
  _QWORD v25[4];
  _QWORD v26[2];
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = (void *)MGCopyAnswer();
  v7 = (void *)MGCopyAnswer();
  v26[0] = 0;
  v26[1] = 0;
  v27 = 0;
  v24[0] = *MEMORY[0x24BEDA890];
  v8 = v2;
  if (!v2)
    v8 = (void *)objc_opt_new();
  v9 = *MEMORY[0x24BEDA8B8];
  v25[0] = v8;
  v25[1] = MEMORY[0x24BDBD1C8];
  v10 = *MEMORY[0x24BEDA898];
  v24[1] = v9;
  v24[2] = v10;
  v11 = v7;
  if (!v7)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v4, v5, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[2] = v11;
  v24[3] = *MEMORY[0x24BEDA8A0];
  v12 = v3;
  if (!v3)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v4, v5, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[3] = v12;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v4, (uint64_t)v25, (uint64_t)v24, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (v7)
      goto LABEL_9;
  }
  else
  {

    if (v7)
    {
LABEL_9:
      if (v2)
        goto LABEL_10;
LABEL_18:

      if (v14)
        goto LABEL_11;
      goto LABEL_19;
    }
  }

  if (!v2)
    goto LABEL_18;
LABEL_10:
  if (v14)
  {
LABEL_11:
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v13, (uint64_t)v26, 20, *MEMORY[0x24BEDA7A0], *MEMORY[0x24BEDA818], v14);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (!v18)
    {
      objc_msgSend_null(MEMORY[0x24BDBCEF8], v15, v16, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v23[1] = v19;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v15, (uint64_t)v23, (uint64_t)&v22, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)

    goto LABEL_15;
  }
LABEL_19:
  handleForCategory(0);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    sub_21456E6D0();
  v20 = 0;
LABEL_15:

  return v20;
}

id sub_214545E2C(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v8;

  v2 = a2;
  v5 = v2;
  if (!v2)
  {
    handleForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_21456E5F4();
    goto LABEL_8;
  }
  objc_msgSend_objectForKeyedSubscript_(v2, v3, *MEMORY[0x24BEDA7E0], v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    handleForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_21456E620();
LABEL_8:

    v6 = 0;
  }

  return v6;
}

id sub_214545ECC()
{
  void *v0;
  void *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  id v24;
  const char *v26;
  int v27;
  NSObject *v28;
  uint64_t v29;
  id v30;
  const char *v31;
  void *v32;
  NSObject *v33;
  const char *v34;
  int v35;
  NSObject *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD v63[4];
  _QWORD v64[4];
  _QWORD v65[4];
  _QWORD v66[4];
  uint8_t buf[4];
  void *v68;
  _BYTE v69[448];
  uint64_t v70;
  _QWORD v71[2];
  int v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MGCopyAnswer();
  v1 = (void *)MGCopyAnswer();
  v71[0] = 0;
  v71[1] = 0;
  v72 = 0;
  v61 = 0;
  v62 = 0;
  v59 = 0;
  v60 = 0;
  v70 = 0;
  memset(v69, 0, sizeof(v69));
  v2 = (void *)objc_opt_new();
  v58 = 0;
  objc_msgSend_getPathForApTicketWithError_(v2, v3, (uint64_t)&v58, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v58;

  if (!v5 || v6)
  {
    handleForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_21456E6FC();
    goto LABEL_13;
  }
  objc_msgSend_dataWithContentsOfFile_(MEMORY[0x24BDBCE50], v7, (uint64_t)v5, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v13 = v9;
  if (!v9 || !objc_msgSend_length(v9, v10, v11, v12))
  {
    handleForCategory(0);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_21456E728();
    goto LABEL_12;
  }
  v13 = objc_retainAutorelease(v13);
  v17 = objc_msgSend_bytes(v13, v14, v15, v16);
  v21 = objc_msgSend_length(v13, v18, v19, v20);
  if (sub_21455E170(v17, v21, (uint64_t)v69))
  {
    handleForCategory(0);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_21456E86C();
    goto LABEL_12;
  }
  sub_21455DF44((uint64_t)v69, 1296125520, 1819244133, &v62, &v61);
  if (v27)
  {
    handleForCategory(0);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_21456E80C();

    goto LABEL_13;
  }
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v26, v62, v61);
  v29 = objc_claimAutoreleasedReturnValue();
  if (!v29)
  {
    handleForCategory(0);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_21456E754();
    goto LABEL_12;
  }
  v22 = v29;
  v30 = objc_alloc(MEMORY[0x24BDD17C8]);
  v32 = (void *)objc_msgSend_initWithData_encoding_(v30, v31, (uint64_t)v22, 4);
  handleForCategory(0);
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v68 = v32;
    _os_log_impl(&dword_214503000, v33, OS_LOG_TYPE_DEFAULT, "OS version String:%@", buf, 0xCu);
  }

  sub_21455DF44((uint64_t)v69, 1936027753, 1145525076, &v60, &v59);
  if (v35)
  {
    handleForCategory(0);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      sub_21456E7AC();

LABEL_26:
LABEL_12:

LABEL_13:
    v23 = 0;
    v24 = 0;
    goto LABEL_14;
  }
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v34, v60, v59);
  v37 = objc_claimAutoreleasedReturnValue();
  if (!v37)
  {
    handleForCategory(0);
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      sub_21456E780();

    goto LABEL_26;
  }
  v41 = *MEMORY[0x24BEDA8B8];
  v65[0] = *MEMORY[0x24BEDA890];
  v65[1] = v41;
  v56 = (void *)v37;
  v66[0] = v37;
  v66[1] = MEMORY[0x24BDBD1C8];
  v65[2] = *MEMORY[0x24BEDA898];
  v42 = v1;
  if (!v1)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v38, v39, v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v57 = v32;
  v66[2] = v42;
  v65[3] = *MEMORY[0x24BEDA8A0];
  v43 = v0;
  if (!v0)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v38, v39, v40);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v66[3] = v43;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v38, (uint64_t)v66, (uint64_t)v65, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v0)

  if (!v1)
  v45 = *MEMORY[0x24BEDA7B0];
  v64[0] = v23;
  v46 = *MEMORY[0x24BEDA818];
  v63[0] = v45;
  v63[1] = v46;
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v44, (uint64_t)v71, 20);
  v47 = objc_claimAutoreleasedReturnValue();
  v51 = (void *)v47;
  if (!v47)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v48, v49, v50);
    v47 = objc_claimAutoreleasedReturnValue();
  }
  v54 = (void *)v47;
  v64[1] = v47;
  v63[2] = *MEMORY[0x24BEDA7F0];
  v52 = v57;
  if (!v57)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v48, v49, v50);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v63[3] = CFSTR("Ap,Timestamp");
  v64[2] = v52;
  v64[3] = &unk_24D1B7CE0;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v48, (uint64_t)v64, (uint64_t)v63, 4);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v57)

  if (!v51)
  v24 = v55;

LABEL_14:
  return v24;
}

id sub_21454644C(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  id v27;
  NSObject *v28;
  _QWORD v30[5];
  _QWORD v31[6];

  v31[5] = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = (void *)objc_opt_new();
  v4 = (void *)MGCopyAnswer();
  v5 = (void *)MGCopyAnswer();
  v6 = MGCopyAnswer();
  v9 = (void *)v6;
  if (!v2)
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_21456E898();
    goto LABEL_16;
  }
  if (!v6)
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_21456E8C4();
    goto LABEL_16;
  }
  objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], v7, (uint64_t)v2, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_SHA384DigestData(v10, v11, v12, v13);
  v14 = objc_claimAutoreleasedReturnValue();

  if (!v14 || !objc_msgSend_length(v14, v15, v16, v17))
  {
    handleForCategory(0);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_21456E8F0();
    goto LABEL_15;
  }
  v21 = *MEMORY[0x24BEDA8B8];
  v30[0] = *MEMORY[0x24BEDA890];
  v30[1] = v21;
  v31[0] = v14;
  v31[1] = MEMORY[0x24BDBD1C8];
  v30[2] = *MEMORY[0x24BEDA898];
  v22 = v5;
  if (!v5)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v18, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31[2] = v22;
  v30[3] = *MEMORY[0x24BEDA8A0];
  v23 = v4;
  if (!v4)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v18, v19, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[4] = CFSTR("Name");
  v31[3] = v23;
  v31[4] = CFSTR("FactoryDiskImage");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v18, (uint64_t)v31, (uint64_t)v30, 5);
  v25 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (v5)
      goto LABEL_11;
  }
  else
  {

    if (v5)
      goto LABEL_11;
  }

LABEL_11:
  objc_msgSend_setObject_forKeyedSubscript_(v3, v24, (uint64_t)v9, *MEMORY[0x24BEDA818]);
  if (!v25)
  {
    handleForCategory(0);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_21456E91C();
LABEL_15:

LABEL_16:
    v27 = 0;
    goto LABEL_17;
  }
  objc_msgSend_setObject_forKeyedSubscript_(v3, v26, v25, (uint64_t)CFSTR("PersonalizedDMG"));
  v27 = v3;

  v14 = v25;
LABEL_17:

  return v27;
}

id sub_214546728(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v8;

  v2 = a2;
  v5 = v2;
  if (!v2)
  {
    handleForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_21456E5F4();
    goto LABEL_8;
  }
  objc_msgSend_objectForKeyedSubscript_(v2, v3, *MEMORY[0x24BEDA7E0], v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    handleForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_21456E620();
LABEL_8:

    v6 = 0;
  }

  return v6;
}

NSObject *sub_2145467C8(uint64_t a1, void *a2)
{
  const char *v2;
  NSObject *v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  NSObject *v14;
  NSObject *RequestWithLogging;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  uint8_t buf[4];
  NSObject *v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!v3)
  {
    handleForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_21456E948();
    goto LABEL_18;
  }
  v27 = qword_254D7AE28;
  v23 = qword_254D7AE38;
  v24 = CFSTR("FirmwareMap.plist");
  v25 = qword_254D7AE30;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v2, (uint64_t)&v24, (uint64_t)&v23, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v4;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v5, (uint64_t)&v26, (uint64_t)&v25, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v6;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v7, (uint64_t)v28, (uint64_t)&v27, 1);
  v8 = objc_claimAutoreleasedReturnValue();

  handleForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v8;
    _os_log_impl(&dword_214503000, v9, OS_LOG_TYPE_DEFAULT, "buildIdentityDict is %@", buf, 0xCu);
  }

  if (!v8)
  {
    handleForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_21456E974();
    goto LABEL_18;
  }
  objc_msgSend_setObject_forKeyedSubscript_(v3, v10, (uint64_t)v8, (uint64_t)CFSTR("BuildIdentity"));
  handleForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v11, OS_LOG_TYPE_DEFAULT, "Creating Firmware Digest", buf, 2u);
  }

  if (!MEMORY[0x24BEE7C48])
  {
    v13 = 0;
    goto LABEL_15;
  }
  v13 = (void *)T200UpdaterCopyFirmwareWithLogging();
  if (!v13)
  {
LABEL_15:
    handleForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_21456E9A0();

LABEL_18:
    v17 = 0;
    goto LABEL_23;
  }
  objc_msgSend_setObject_forKeyedSubscript_(v3, v12, (uint64_t)v13, (uint64_t)CFSTR("FirmwareData"));
  handleForCategory(0);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v3;
    _os_log_impl(&dword_214503000, v14, OS_LOG_TYPE_DEFAULT, "Input Dictionary: %@", buf, 0xCu);
  }

  if (MEMORY[0x24BEE7C50])
  {
    RequestWithLogging = T200UpdaterCreateRequestWithLogging();
    v16 = RequestWithLogging;
    if (RequestWithLogging)
    {
      v17 = RequestWithLogging;

      v8 = v17;
      goto LABEL_23;
    }
  }
  else
  {
    v16 = 0;
  }
  handleForCategory(0);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    sub_21456EA08();

  v17 = 0;
  v8 = v16;
LABEL_23:

  return v17;
}

void sub_214546B48(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = a1;
    v7 = 2080;
    v8 = a2;
    _os_log_impl(&dword_214503000, v4, OS_LOG_TYPE_DEFAULT, "%s : %s", (uint8_t *)&v5, 0x16u);
  }

}

id sub_214546C04(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  id v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  const char *v27;
  int v28;
  NSObject *v29;
  uint64_t v30;
  const char *v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  void *v42;
  const char *v43;
  NSObject *v44;
  const char *v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *RequestWithLogging;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  const char *v53;
  void *v54;
  const char *v55;
  NSObject *v56;
  NSObject *v57;
  NSObject *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint8_t buf[4];
  id v67;
  uint64_t v68;
  const __CFString *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  const __CFString *v73;
  uint64_t v74;
  void *v75;
  _QWORD v76[4];
  _QWORD v77[4];
  _OWORD v78[28];
  uint64_t v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v63 = 0;
  v79 = 0;
  memset(v78, 0, sizeof(v78));
  v61 = 0;
  v62 = 0;
  v3 = (void *)objc_opt_new();
  v6 = v3;
  if (!v2)
  {
    handleForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_21456E948();
    goto LABEL_15;
  }
  v60 = 0;
  objc_msgSend_getPathForApTicketWithError_(v3, v4, (uint64_t)&v60, v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v60;
  v11 = v8;
  if (!v7 || v8)
  {
    handleForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_21456E6FC();
    goto LABEL_13;
  }
  objc_msgSend_dataWithContentsOfFile_(MEMORY[0x24BDBCE50], v9, (uint64_t)v7, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v12;
  if (!v12 || !objc_msgSend_length(v12, v13, v14, v15))
  {
    handleForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_21456E728();
    goto LABEL_13;
  }
  v11 = objc_retainAutorelease(v11);
  v19 = objc_msgSend_bytes(v11, v16, v17, v18);
  v23 = objc_msgSend_length(v11, v20, v21, v22);
  if (sub_21455E170(v19, v23, (uint64_t)v78))
  {
    handleForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_21456E86C();
LABEL_13:

LABEL_14:
LABEL_15:
    v25 = 0;
    goto LABEL_16;
  }
  sub_21455DF44((uint64_t)v78, 1936027753, 1145525076, &v62, &v61);
  if (v28)
  {
    handleForCategory(0);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_21456E7AC();

    goto LABEL_14;
  }
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v27, v62, v61);
  v30 = objc_claimAutoreleasedReturnValue();
  if (!v30)
  {
    handleForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_21456EA70();
    goto LABEL_13;
  }
  v59 = (void *)v30;
  v76[0] = CFSTR("Savage,BA-Prod-Patch");
  v72 = qword_254D7AE38;
  v73 = CFSTR("Savage.fw");
  v74 = qword_254D7AE30;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v31, (uint64_t)&v73, (uint64_t)&v72, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v32;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v33, (uint64_t)&v75, (uint64_t)&v74, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = v34;
  v76[1] = CFSTR("Savage,BE-Prod-Patch");
  v69 = CFSTR("Savage.fw");
  v70 = qword_254D7AE30;
  v68 = qword_254D7AE38;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v35, (uint64_t)&v69, (uint64_t)&v68, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v36;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v37, (uint64_t)&v71, (uint64_t)&v70, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = *MEMORY[0x24BEE7AB0];
  v77[1] = v38;
  v77[2] = CFSTR("0x01");
  v40 = *MEMORY[0x24BEE7B30];
  v76[2] = v39;
  v76[3] = v40;
  v77[3] = CFSTR("0x00");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v41, (uint64_t)v77, (uint64_t)v76, 4);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v42)
  {
    handleForCategory(0);
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      sub_21456E974();

    goto LABEL_14;
  }
  objc_msgSend_setObject_forKeyedSubscript_(v2, v43, (uint64_t)v42, (uint64_t)CFSTR("BuildIdentity"));
  handleForCategory(0);
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v44, OS_LOG_TYPE_DEFAULT, "Creating Firmware Digest", buf, 2u);
  }

  v46 = SavageUpdaterCopyFirmwareWithLogging();
  if (!v46 || v63)
  {
    handleForCategory(0);
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      sub_21456E9A0();

    v25 = 0;
    v7 = v46;
  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v2, v45, (uint64_t)v46, (uint64_t)CFSTR("FirmwareData"));
    handleForCategory(0);
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v67 = v2;
      _os_log_impl(&dword_214503000, v47, OS_LOG_TYPE_DEFAULT, "Input Dictionary: %@", buf, 0xCu);
    }

    RequestWithLogging = SavageUpdaterCreateRequestWithLogging();
    v52 = RequestWithLogging;
    if (!RequestWithLogging || v63)
    {
      handleForCategory(0);
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        sub_21456EA08();

      v25 = 0;
    }
    else
    {
      v25 = (void *)objc_msgSend_mutableCopy(RequestWithLogging, v49, v50, v51);
      v64 = qword_254D7AE48;
      v65 = v59;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v53, (uint64_t)&v65, (uint64_t)&v64, 1);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v25, v55, (uint64_t)v54, qword_254D7AE40);

    }
    v7 = v52;
  }
LABEL_16:

  return v25;
}

id sub_21454723C(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  int v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  void *Tags;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t i;
  void *v58;
  id v59;
  NSObject *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  const char *v68;
  NSObject *v69;
  void *v70;
  const char *v71;
  NSObject *v72;
  id RequestWithLogging;
  uint64_t v74;
  NSObject *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  NSObject *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  NSObject *v88;
  NSObject *v89;
  NSObject *v90;
  NSObject *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  NSObject *v100;
  void *v101;
  id obj;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  id v107;
  id v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint8_t v112[128];
  uint8_t buf[4];
  id v114;
  _QWORD v115[2];
  _QWORD v116[2];
  const __CFString *v117;
  uint64_t v118;
  const __CFString *v119;
  void *v120;
  _OWORD v121[28];
  uint64_t v122;
  uint64_t v123;

  v123 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v110 = 0;
  v111 = 0;
  v109 = 0;
  v101 = (void *)objc_opt_new();
  v122 = 0;
  memset(v121, 0, sizeof(v121));
  v3 = (void *)objc_opt_new();
  v6 = v3;
  v99 = v2;
  if (!v2)
  {
    handleForCategory(0);
    v100 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
      sub_21456E948();
    v63 = 0;
    v11 = 0;
    v98 = 0;
    v78 = 0;
    v16 = 0;
    v7 = 0;
    goto LABEL_50;
  }
  v108 = 0;
  objc_msgSend_getPathForApTicketWithError_(v3, v4, (uint64_t)&v108, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v108;
  v11 = v8;
  if (!v7 || v8)
  {
    handleForCategory(0);
    v100 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
    {
      v63 = 0;
      v98 = 0;
      v78 = 0;
      v16 = 0;
LABEL_50:
      v96 = 0;
      v97 = 0;
      v59 = 0;
      v70 = 0;
      RequestWithLogging = 0;
      v77 = 0;
      goto LABEL_41;
    }
    sub_21456E6FC();
LABEL_54:
    v63 = 0;
    v98 = 0;
    v78 = 0;
    v16 = 0;
    goto LABEL_50;
  }
  v107 = 0;
  objc_msgSend_getPathForSavageFirmwareWithError_(v6, v9, (uint64_t)&v107, v10);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v107;
  v11 = v13;
  v100 = v12;
  if (!v12 || v13)
  {
    handleForCategory(0);
    v87 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      sub_21456EA9C();

    goto LABEL_54;
  }
  objc_msgSend_dataWithContentsOfFile_(MEMORY[0x24BDBCE50], v14, (uint64_t)v7, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_length(v16, v17, v18, v19))
  {
    handleForCategory(0);
    v88 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
      sub_21456E728();

    goto LABEL_63;
  }
  v20 = objc_retainAutorelease(v16);
  v24 = objc_msgSend_bytes(v20, v21, v22, v23);
  v95 = v20;
  v28 = objc_msgSend_length(v20, v25, v26, v27);
  if (sub_21455E170(v24, v28, (uint64_t)v121))
  {
    handleForCategory(0);
    v89 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
      sub_21456ECF0();
    goto LABEL_66;
  }
  sub_21455DF44((uint64_t)v121, 1936027753, 1145525076, &v111, &v109);
  if (v30)
  {
    handleForCategory(0);
    v90 = objc_claimAutoreleasedReturnValue();
    v16 = v20;
    if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
      sub_21456EC90();

LABEL_63:
    v63 = 0;
    v11 = 0;
    v98 = 0;
    v78 = 0;
    goto LABEL_50;
  }
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v29, v111, v109);
  v31 = objc_claimAutoreleasedReturnValue();
  if (!v31)
  {
    handleForCategory(0);
    v89 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
      sub_21456EAC8();
LABEL_66:

    v63 = 0;
    v11 = 0;
    v97 = 0;
    v98 = 0;
    v78 = 0;
    v59 = 0;
    v96 = 0;
    v70 = 0;
    RequestWithLogging = 0;
    v77 = 0;
    v16 = v95;
    goto LABEL_41;
  }
  v33 = (void *)v31;
  v94 = v7;
  v118 = v31;
  v119 = CFSTR("SEP");
  v117 = CFSTR("Digest");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v32, (uint64_t)&v118, (uint64_t)&v117, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = v34;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v35, (uint64_t)&v120, (uint64_t)&v119, 1);
  v36 = objc_claimAutoreleasedReturnValue();

  v93 = (void *)v36;
  objc_msgSend_setObject_forKeyedSubscript_(v2, v37, v36, (uint64_t)CFSTR("ReceiptManifest"));
  v38 = *MEMORY[0x24BEE7B30];
  v115[0] = *MEMORY[0x24BEE7AB0];
  v115[1] = v38;
  v116[0] = CFSTR("0x01");
  v116[1] = CFSTR("0x00");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v39, (uint64_t)v116, (uint64_t)v115, 2);
  v40 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v2, v41, v40, (uint64_t)CFSTR("BuildIdentity"));
  Tags = (void *)SavageUpdaterGetTags();
  v43 = v110;
  handleForCategory(0);
  v44 = objc_claimAutoreleasedReturnValue();
  v45 = v44;
  v97 = (void *)v40;
  v98 = v33;
  v96 = Tags;
  if (!Tags || v43)
  {
    v7 = v94;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      sub_21456EAF4();

    v63 = 0;
    v11 = 0;
    v59 = 0;
    v70 = 0;
    RequestWithLogging = 0;
    v77 = 0;
    goto LABEL_40;
  }
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v114 = Tags;
    _os_log_impl(&dword_214503000, v45, OS_LOG_TYPE_DEFAULT, "Savage updater tags: %@", buf, 0xCu);
  }
  v92 = v6;

  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  objc_msgSend_objectForKeyedSubscript_(Tags, v46, (uint64_t)CFSTR("BuildIdentityTags"), v47);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v48, (uint64_t)&v103, (uint64_t)v112, 16);
  if (v49)
  {
    v52 = v49;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = *(_QWORD *)v104;
    while (2)
    {
      for (i = 0; i != v52; ++i)
      {
        if (*(_QWORD *)v104 != v56)
          objc_enumerationMutation(obj);
        v58 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * i);
        if (objc_msgSend_containsString_(v58, v50, (uint64_t)CFSTR("-Patch"), v51, v92))
        {
          v59 = v58;

          handleForCategory(0);
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v114 = v59;
            _os_log_impl(&dword_214503000, v60, OS_LOG_TYPE_DEFAULT, "patch tag name: %@", buf, 0xCu);
          }

          objc_msgSend_stringByAppendingString_(v100, v61, (uint64_t)v59, v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_dataWithContentsOfFile_(MEMORY[0x24BDBCE50], v64, (uint64_t)v63, v65);
          v66 = objc_claimAutoreleasedReturnValue();

          if (!v66)
          {
            handleForCategory(0);
            v80 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
              sub_21456EC2C((uint64_t)v63, v80, v81, v82, v83, v84, v85, v86);

            v11 = 0;
            v70 = 0;
            RequestWithLogging = 0;
            v77 = 0;
            v6 = v92;
            goto LABEL_39;
          }
          objc_msgSend_setObject_forKeyedSubscript_(v101, v67, v66, (uint64_t)v59);
          v53 = v63;
          v54 = v59;
          v55 = (void *)v66;
        }
      }
      v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v50, (uint64_t)&v103, (uint64_t)v112, 16);
      if (v52)
        continue;
      break;
    }
  }
  else
  {
    v53 = 0;
    v54 = 0;
    v55 = 0;
  }

  objc_msgSend_setObject_forKeyedSubscript_(v99, v68, (uint64_t)v101, (uint64_t)CFSTR("BundleDataDict"));
  handleForCategory(0);
  v69 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v69, OS_LOG_TYPE_DEFAULT, "Copying Savage Firmware ...", buf, 2u);
  }

  v70 = (void *)SavageUpdaterCopyFirmwareWithLogging();
  if (!v70 || v110)
  {
    handleForCategory(0);
    v91 = objc_claimAutoreleasedReturnValue();
    v6 = v92;
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
      sub_21456EB5C();

    v11 = 0;
    RequestWithLogging = 0;
  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v99, v71, (uint64_t)v70, (uint64_t)CFSTR("FirmwareData"));
    handleForCategory(0);
    v72 = objc_claimAutoreleasedReturnValue();
    v6 = v92;
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v114 = v99;
      _os_log_impl(&dword_214503000, v72, OS_LOG_TYPE_DEFAULT, "Final Savage options: %@", buf, 0xCu);
    }

    RequestWithLogging = (id)SavageUpdaterCreateRequestWithLogging();
    v74 = v110;
    handleForCategory(0);
    v75 = objc_claimAutoreleasedReturnValue();
    v76 = v75;
    if (RequestWithLogging && !v74)
    {
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v114 = RequestWithLogging;
        _os_log_impl(&dword_214503000, v76, OS_LOG_TYPE_DEFAULT, "TSS request: %@", buf, 0xCu);
      }

      RequestWithLogging = RequestWithLogging;
      v11 = 0;
      v63 = v53;
      v59 = v54;
      v77 = RequestWithLogging;
      goto LABEL_39;
    }
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
      sub_21456EBC4();

    v11 = 0;
  }
  v77 = 0;
  v63 = v53;
  v59 = v54;
LABEL_39:
  v7 = v94;
LABEL_40:
  v16 = v95;
  v78 = v93;
LABEL_41:

  return v77;
}

id sub_214547C00(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v8;

  v2 = a2;
  v5 = v2;
  if (!v2)
  {
    handleForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_21456E5F4();
    goto LABEL_8;
  }
  objc_msgSend_objectForKeyedSubscript_(v2, v3, qword_254D7AE08, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    handleForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_21456E620();
LABEL_8:

    v6 = 0;
  }

  return v6;
}

id sub_214547C9C(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v8;

  v2 = a2;
  v5 = v2;
  if (!v2)
  {
    handleForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_21456E5F4();
    goto LABEL_8;
  }
  objc_msgSend_objectForKeyedSubscript_(v2, v3, qword_254D7AE10, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    handleForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_21456ED1C();
LABEL_8:

    v6 = 0;
  }

  return v6;
}

id sub_214547D38(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  NSObject *v63;
  NSObject *v65;
  const char *v66;
  int v67;
  NSObject *v68;
  uint64_t v69;
  void *Tags;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t i;
  void *v80;
  id v81;
  NSObject *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  const char *v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  NSObject *v103;
  const char *v104;
  NSObject *v105;
  void *RequestWithLogging;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  void *v112;
  const char *v113;
  NSObject *v114;
  NSObject *v115;
  NSObject *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  NSObject *v121;
  NSObject *v122;
  NSObject *obj;
  id obja;
  NSObject *objb;
  void *v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  id v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  _QWORD v137[7];
  _QWORD v138[7];
  _QWORD v139[3];
  _QWORD v140[3];
  _QWORD v141[3];
  _QWORD v142[3];
  uint8_t buf[4];
  id v144;
  _BYTE v145[128];
  _OWORD v146[28];
  uint64_t v147;
  uint64_t v148;

  v148 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v134 = 0;
  v147 = 0;
  memset(v146, 0, sizeof(v146));
  v132 = 0;
  v133 = 0;
  v5 = (void *)objc_opt_new();
  if (!v2)
  {
    handleForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_21456E948();
    goto LABEL_18;
  }
  objc_msgSend_objectForKeyedSubscript_(v2, v3, *MEMORY[0x24BEDA8C8], v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v9 = v6;
  if (!v6)
    goto LABEL_15;
  objc_msgSend_objectForKeyedSubscript_(v6, v7, (uint64_t)CFSTR("YonkersDeviceInfo"), v8);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_15;
  v13 = (void *)v10;
  v126 = v5;
  objc_msgSend_objectForKeyedSubscript_(v9, v11, (uint64_t)CFSTR("YonkersDeviceInfo"), v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v14, v15, qword_254D7AE50, v16);
  v17 = objc_claimAutoreleasedReturnValue();
  if (!v17)
  {

    goto LABEL_15;
  }
  v20 = (void *)v17;
  objc_msgSend_objectForKeyedSubscript_(v9, v18, (uint64_t)CFSTR("YonkersDeviceInfo"), v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v21, v22, qword_254D7AE58, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v126;
  if (!v24)
  {
LABEL_15:
    handleForCategory(0);
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      sub_21456ED48();

LABEL_18:
    v58 = 0;
    v59 = 0;
    v60 = 0;
    v61 = 0;
    v62 = 0;
    goto LABEL_19;
  }
  objc_msgSend_objectForKeyedSubscript_(v9, v25, (uint64_t)CFSTR("YonkersDeviceInfo"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v27, v28, qword_254D7AE50, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKeyedSubscript_(v9, v31, (uint64_t)CFSTR("YonkersDeviceInfo"), v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v33, v34, qword_254D7AE58, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v131 = 0;
  objc_msgSend_getPathForApTicketWithError_(v126, v37, (uint64_t)&v131, v38);
  v39 = objc_claimAutoreleasedReturnValue();
  v40 = v131;
  v43 = v40;
  if (!v39 || v40)
  {
    v121 = v39;
    handleForCategory(0);
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      sub_21456E6FC();
    goto LABEL_24;
  }
  objc_msgSend_dataWithContentsOfFile_(MEMORY[0x24BDBCE50], v41, v39, v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v44;
  if (!v44 || !objc_msgSend_length(v44, v45, v46, v47))
  {
    v121 = v39;
    handleForCategory(0);
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      sub_21456E728();
LABEL_24:

LABEL_25:
    v58 = 0;
    v59 = 0;
    v60 = 0;
    v61 = 0;
    v62 = 0;
    v9 = v121;
    goto LABEL_19;
  }
  v48 = objc_retainAutorelease(v43);
  v52 = objc_msgSend_bytes(v48, v49, v50, v51);
  v56 = objc_msgSend_length(v48, v53, v54, v55);
  if (sub_21455E170(v52, v56, (uint64_t)v146))
  {
    handleForCategory(0);
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      sub_21456E86C();
LABEL_13:

    v58 = 0;
    v59 = 0;
    v60 = 0;
    v61 = 0;
    v62 = 0;
    v9 = v39;
    goto LABEL_19;
  }
  sub_21455DF44((uint64_t)v146, 1936027753, 1145525076, &v133, &v132);
  if (v67)
  {
    v121 = v39;
    handleForCategory(0);
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      sub_21456E7AC();

    goto LABEL_25;
  }
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v66, v133, v132);
  v69 = objc_claimAutoreleasedReturnValue();
  if (!v69)
  {
    handleForCategory(0);
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      sub_21456EA70();
    goto LABEL_13;
  }
  v120 = (void *)v69;
  Tags = (void *)SavageUpdaterGetTags();
  v59 = Tags;
  v118 = v48;
  v119 = v30;
  v122 = v39;
  if (!Tags || v134)
  {
    handleForCategory(0);
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      sub_21456ED74((uint64_t)&v134, obj, v83, v84, v85, v86, v87, v88);
  }
  else
  {
    v129 = 0u;
    v130 = 0u;
    v127 = 0u;
    v128 = 0u;
    objc_msgSend_objectForKeyedSubscript_(Tags, v71, (uint64_t)CFSTR("BuildIdentityTags"), v72);
    obj = objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v73, (uint64_t)&v127, (uint64_t)v145, 16);
    if (v74)
    {
      v77 = v74;
      v117 = v36;
      v58 = 0;
      v78 = *(_QWORD *)v128;
      do
      {
        for (i = 0; i != v77; ++i)
        {
          if (*(_QWORD *)v128 != v78)
            objc_enumerationMutation(obj);
          v80 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * i);
          if (objc_msgSend_containsString_(v80, v75, (uint64_t)CFSTR("SysTopPatch"), v76, v117, v118))
          {
            v81 = v80;

            handleForCategory(0);
            v82 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v144 = v81;
              _os_log_impl(&dword_214503000, v82, OS_LOG_TYPE_DEFAULT, "patch tag name:%@", buf, 0xCu);
            }

            v58 = v81;
          }
        }
        v77 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v75, (uint64_t)&v127, (uint64_t)v145, 16);
      }
      while (v77);
      v36 = v117;
      goto LABEL_50;
    }
  }
  v58 = 0;
LABEL_50:

  v141[0] = v58;
  v139[0] = qword_254D7AE30;
  v137[0] = qword_254D7AE38;
  v137[1] = CFSTR("Personalize");
  v138[0] = CFSTR("Yonkers.fw");
  v138[1] = &unk_24D1B7CF8;
  v137[2] = CFSTR("IsiBootNonEssentialFirmware");
  v137[3] = CFSTR("IsiBootEANFirmware");
  v138[2] = &unk_24D1B7CE0;
  v138[3] = &unk_24D1B7CE0;
  v137[4] = CFSTR("IsLoadedByiBootStage1");
  v137[5] = CFSTR("IsLoadedByiBoot");
  v138[4] = &unk_24D1B7CE0;
  v138[5] = &unk_24D1B7CE0;
  v137[6] = CFSTR("IsFTAB");
  v138[6] = &unk_24D1B7CE0;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v89, (uint64_t)v138, (uint64_t)v137, 7);
  obja = (id)objc_claimAutoreleasedReturnValue();
  v140[0] = obja;
  v139[1] = CFSTR("EPRO");
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v90, v36 != 0, v91);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v140[1] = v95;
  v139[2] = CFSTR("FabRevision");
  v96 = v30;
  if (!v30)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v92, v93, v94);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v140[2] = v96;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v92, (uint64_t)v140, (uint64_t)v139, 3);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = *MEMORY[0x24BEE7BC0];
  v142[0] = v97;
  v142[1] = &unk_24D1B7CE0;
  v99 = *MEMORY[0x24BEE7BF0];
  v141[1] = v98;
  v141[2] = v99;
  v142[2] = &unk_24D1B7CE0;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v100, (uint64_t)v142, (uint64_t)v141, 3);
  v101 = objc_claimAutoreleasedReturnValue();

  if (!v30)
  if (v101)
  {
    objb = v101;
    objc_msgSend_setObject_forKeyedSubscript_(v2, v102, v101, (uint64_t)CFSTR("BuildIdentity"));
    handleForCategory(0);
    v103 = objc_claimAutoreleasedReturnValue();
    v5 = v126;
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v103, OS_LOG_TYPE_DEFAULT, "Creating Firmware Digest", buf, 2u);
    }

    v60 = (void *)SavageUpdaterCopyFirmwareWithLogging();
    if (!v60 || v134)
    {
      handleForCategory(0);
      v115 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
        sub_21456E9A0();

      v61 = 0;
    }
    else
    {
      objc_msgSend_setObject_forKeyedSubscript_(v2, v104, (uint64_t)v60, (uint64_t)CFSTR("FirmwareData"));
      handleForCategory(0);
      v105 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v144 = v2;
        _os_log_impl(&dword_214503000, v105, OS_LOG_TYPE_DEFAULT, "Input Dictionary: %@", buf, 0xCu);
      }

      RequestWithLogging = (void *)SavageUpdaterCreateRequestWithLogging();
      v61 = RequestWithLogging;
      if (RequestWithLogging && !v134)
      {
        v110 = (void *)objc_msgSend_mutableCopy(RequestWithLogging, v107, v108, v109);
        v135 = qword_254D7AE48;
        v136 = v120;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v111, (uint64_t)&v136, (uint64_t)&v135, 1);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v110, v113, (uint64_t)v112, qword_254D7AE40);

        v62 = v110;
        v9 = objb;
        goto LABEL_19;
      }
      handleForCategory(0);
      v116 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
        sub_21456EA08();

    }
    v62 = 0;
    v9 = objb;
    v5 = v126;
    goto LABEL_19;
  }
  handleForCategory(0);
  v114 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
    sub_21456E974();

  v60 = 0;
  v61 = 0;
  v62 = 0;
  v9 = v122;
  v5 = v126;
LABEL_19:

  return v62;
}

id sub_214548788(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  int v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  const char *v39;
  void *Tags;
  uint64_t v41;
  NSObject *v42;
  NSObject *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t i;
  void *v56;
  id v57;
  NSObject *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  const char *v66;
  NSObject *v67;
  void *v68;
  const char *v69;
  NSObject *v70;
  id RequestWithLogging;
  uint64_t v72;
  NSObject *v73;
  NSObject *v74;
  void *v75;
  NSObject *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  NSObject *v84;
  NSObject *v85;
  NSObject *v86;
  NSObject *v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  NSObject *v96;
  void *v97;
  id obj;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  id v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint8_t v108[128];
  uint8_t buf[4];
  id v110;
  _QWORD v111[2];
  _QWORD v112[2];
  const __CFString *v113;
  uint64_t v114;
  const __CFString *v115;
  void *v116;
  _OWORD v117[28];
  uint64_t v118;
  uint64_t v119;

  v119 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v106 = 0;
  v107 = 0;
  v105 = 0;
  v97 = (void *)objc_opt_new();
  v118 = 0;
  memset(v117, 0, sizeof(v117));
  v3 = (void *)objc_opt_new();
  v6 = v3;
  v95 = v2;
  if (!v3)
  {
    handleForCategory(0);
    v96 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      sub_21456EDDC();
    goto LABEL_53;
  }
  if (!v2)
  {
    handleForCategory(0);
    v96 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      sub_21456E948();
LABEL_53:
    v61 = 0;
    v11 = 0;
    v93 = 0;
    v94 = 0;
    v20 = 0;
    v7 = 0;
    goto LABEL_56;
  }
  v104 = 0;
  objc_msgSend_getPathForApTicketWithError_(v3, v4, (uint64_t)&v104, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v104;
  v11 = v8;
  if (!v7 || v8)
  {
    handleForCategory(0);
    v96 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
    {
      sub_21456E6FC();
LABEL_60:
      v61 = 0;
      v93 = 0;
      v94 = 0;
      v20 = 0;
      goto LABEL_56;
    }
    v61 = 0;
    v93 = 0;
    v94 = 0;
    v20 = 0;
LABEL_56:
    v91 = 0;
    v92 = 0;
    v57 = 0;
    v68 = 0;
    RequestWithLogging = 0;
    v75 = 0;
    goto LABEL_43;
  }
  v103 = 0;
  objc_msgSend_getPathForYonkersFirmwareWithError_(v6, v9, (uint64_t)&v103, v10);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v103;
  v11 = v13;
  v96 = v12;
  if (!v12 || v13)
  {
    handleForCategory(0);
    v85 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
      sub_21456EA9C();

    goto LABEL_60;
  }
  objc_msgSend_dataWithContentsOfFile_(MEMORY[0x24BDBCE50], v14, (uint64_t)v7, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v16;
  if (!v16 || !objc_msgSend_length(v16, v17, v18, v19))
  {
    handleForCategory(0);
    v84 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
      sub_21456E728();
    goto LABEL_68;
  }
  v20 = objc_retainAutorelease(v20);
  v24 = objc_msgSend_bytes(v20, v21, v22, v23);
  v28 = objc_msgSend_length(v20, v25, v26, v27);
  if (sub_21455E170(v24, v28, (uint64_t)v117))
  {
    handleForCategory(0);
    v84 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
      sub_21456ECF0();
    goto LABEL_68;
  }
  sub_21455DF44((uint64_t)v117, 1936027753, 1145525076, &v107, &v105);
  if (v30)
  {
    handleForCategory(0);
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      sub_21456EC90();

    goto LABEL_69;
  }
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v29, v107, v105);
  v31 = objc_claimAutoreleasedReturnValue();
  if (!v31)
  {
    handleForCategory(0);
    v84 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
      sub_21456EAC8();
LABEL_68:

LABEL_69:
    v61 = 0;
    v11 = 0;
    v93 = 0;
    v94 = 0;
    goto LABEL_56;
  }
  v90 = v20;
  v114 = v31;
  v115 = CFSTR("SEP");
  v113 = CFSTR("Digest");
  v94 = (void *)v31;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v32, (uint64_t)&v114, (uint64_t)&v113, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = v33;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v34, (uint64_t)&v116, (uint64_t)&v115, 1);
  v35 = objc_claimAutoreleasedReturnValue();

  v93 = (void *)v35;
  objc_msgSend_setObject_forKeyedSubscript_(v2, v36, v35, (uint64_t)CFSTR("ReceiptManifest"));
  v37 = *MEMORY[0x24BEE7BF0];
  v111[0] = *MEMORY[0x24BEE7BC0];
  v111[1] = v37;
  v112[0] = &unk_24D1B7CE0;
  v112[1] = &unk_24D1B7CE0;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v38, (uint64_t)v112, (uint64_t)v111, 2);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v2, v39, (uint64_t)v92, (uint64_t)CFSTR("BuildIdentity"));
  Tags = (void *)SavageUpdaterGetTags();
  v41 = v106;
  handleForCategory(0);
  v42 = objc_claimAutoreleasedReturnValue();
  v43 = v42;
  v91 = Tags;
  if (!Tags || v41)
  {
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      sub_21456EAF4();

    v61 = 0;
    v11 = 0;
    v57 = 0;
    v68 = 0;
    RequestWithLogging = 0;
    v75 = 0;
    goto LABEL_42;
  }
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v110 = Tags;
    _os_log_impl(&dword_214503000, v43, OS_LOG_TYPE_DEFAULT, "Yonkers updater tags: %@", buf, 0xCu);
  }
  v88 = v7;
  v89 = v6;

  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  objc_msgSend_objectForKeyedSubscript_(Tags, v44, (uint64_t)CFSTR("BuildIdentityTags"), v45);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v46, (uint64_t)&v99, (uint64_t)v108, 16);
  if (v47)
  {
    v50 = v47;
    v51 = 0;
    v52 = 0;
    v53 = 0;
    v54 = *(_QWORD *)v100;
    while (2)
    {
      for (i = 0; i != v50; ++i)
      {
        if (*(_QWORD *)v100 != v54)
          objc_enumerationMutation(obj);
        v56 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * i);
        if (objc_msgSend_containsString_(v56, v48, (uint64_t)CFSTR("SysTopPatch"), v49, v88))
        {
          v57 = v56;

          handleForCategory(0);
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v110 = v57;
            _os_log_impl(&dword_214503000, v58, OS_LOG_TYPE_DEFAULT, "patch tag name: %@", buf, 0xCu);
          }

          objc_msgSend_stringByAppendingString_(v96, v59, (uint64_t)v57, v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_dataWithContentsOfFile_(MEMORY[0x24BDBCE50], v62, (uint64_t)v61, v63);
          v64 = objc_claimAutoreleasedReturnValue();

          if (!v64)
          {
            handleForCategory(0);
            v77 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
              sub_21456EC2C((uint64_t)v61, v77, v78, v79, v80, v81, v82, v83);

            v11 = 0;
            v68 = 0;
            RequestWithLogging = 0;
            v75 = 0;
            v7 = v88;
            v6 = v89;
            goto LABEL_42;
          }
          objc_msgSend_setObject_forKeyedSubscript_(v97, v65, v64, (uint64_t)v57);
          v51 = v61;
          v52 = v57;
          v53 = (void *)v64;
        }
      }
      v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v48, (uint64_t)&v99, (uint64_t)v108, 16);
      if (v50)
        continue;
      break;
    }
  }
  else
  {
    v51 = 0;
    v52 = 0;
    v53 = 0;
  }

  objc_msgSend_setObject_forKeyedSubscript_(v95, v66, (uint64_t)v97, (uint64_t)CFSTR("BundleDataDict"));
  handleForCategory(0);
  v67 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v67, OS_LOG_TYPE_DEFAULT, "Copying Yonkers Firmware ...", buf, 2u);
  }

  v68 = (void *)SavageUpdaterCopyFirmwareWithLogging();
  if (!v68 || v106)
  {
    handleForCategory(0);
    v87 = objc_claimAutoreleasedReturnValue();
    v7 = v88;
    if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      sub_21456EB5C();

    v11 = 0;
    RequestWithLogging = 0;
  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v95, v69, (uint64_t)v68, (uint64_t)CFSTR("FirmwareData"));
    handleForCategory(0);
    v70 = objc_claimAutoreleasedReturnValue();
    v7 = v88;
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v110 = v95;
      _os_log_impl(&dword_214503000, v70, OS_LOG_TYPE_DEFAULT, "Final Yonkers options: %@", buf, 0xCu);
    }

    RequestWithLogging = (id)SavageUpdaterCreateRequestWithLogging();
    v72 = v106;
    handleForCategory(0);
    v73 = objc_claimAutoreleasedReturnValue();
    v74 = v73;
    if (RequestWithLogging && !v72)
    {
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v110 = RequestWithLogging;
        _os_log_impl(&dword_214503000, v74, OS_LOG_TYPE_DEFAULT, "TSS request: %@", buf, 0xCu);
      }

      RequestWithLogging = RequestWithLogging;
      v11 = 0;
      v61 = v51;
      v57 = v52;
      v75 = RequestWithLogging;
      goto LABEL_41;
    }
    if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      sub_21456EBC4();

    v11 = 0;
  }
  v75 = 0;
  v61 = v51;
  v57 = v52;
LABEL_41:
  v6 = v89;
LABEL_42:
  v20 = v90;
LABEL_43:

  return v75;
}

id sub_214549120(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v8;

  v2 = a2;
  v5 = v2;
  if (!v2)
  {
    handleForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_21456E5F4();
    goto LABEL_8;
  }
  objc_msgSend_objectForKeyedSubscript_(v2, v3, qword_254D7AE18, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    handleForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_21456EE08();
LABEL_8:

    v6 = 0;
  }

  return v6;
}

id sub_2145491BC(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const char *v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  unsigned __int8 v16;
  const char *v17;
  char __str[2];
  __int16 v20;

  v1 = a1;
  v5 = v1;
  v20 = 0;
  if (v1)
  {
    objc_msgSend_lowercaseString(v1, v2, v3, v4);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)objc_opt_new();
    v10 = objc_msgSend_length(v6, v7, v8, v9);
    if (v10 >= 2)
    {
      v13 = 0;
      v14 = v10 - 1;
      do
      {
        v15 = v13 + 1;
        v16 = objc_msgSend_characterAtIndex_(v6, v11, v13, v12);
        if ((char)v16 >= 48 && v16 <= 0x66u && v16 - 58 >= 0x27)
        {
          __str[0] = v16;
          __str[1] = objc_msgSend_characterAtIndex_(v6, v11, v15, v12);
          HIBYTE(v20) = strtol(__str, 0, 16);
          objc_msgSend_appendBytes_length_(v5, v17, (uint64_t)&v20 + 1, 1);
          v15 = v13 + 2;
        }
        v13 = v15;
      }
      while (v15 < v14);
    }
  }
  else
  {
    handleForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      sub_21456E5F4();
      v5 = 0;
    }
  }

  return v5;
}

id sub_2145492E8(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[5];
  _QWORD v35[6];

  v35[5] = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = (void *)objc_opt_new();
  sub_2145491BC(CFSTR("a41f5c0c eac3d607 f58c5a33 2a0958e0 b94f0313 990e456f ee23e279 80954e89"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MGCopyAnswer();
  v6 = (void *)MGCopyAnswer();
  v7 = MGCopyAnswer();
  v10 = (void *)v7;
  if (v4)
  {
    if (v7)
    {
      v11 = *MEMORY[0x24BEDA890];
      v32 = v4;
      if (v2
        && (objc_msgSend_objectForKeyedSubscript_(v2, v8, v11, v9),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v12,
            v12))
      {
        objc_msgSend_objectForKeyedSubscript_(v2, v8, v11, v9);
        v16 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend_dataWithLength_(MEMORY[0x24BDBCEC8], v8, 20, v9, v4);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend_copy(v17, v18, v19, v20);

      }
      v21 = v2;
      v34[0] = v11;
      v22 = v16;
      if (!v16)
      {
        objc_msgSend_null(MEMORY[0x24BDBCEF8], v13, v14, v15);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v35[0] = v22;
      v34[1] = *MEMORY[0x24BEDA898];
      v23 = v5;
      if (!v5)
      {
        objc_msgSend_null(MEMORY[0x24BDBCEF8], v13, v14, v15);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v35[1] = v23;
      v34[2] = *MEMORY[0x24BEDA8A0];
      v24 = v6;
      if (!v6)
      {
        objc_msgSend_null(MEMORY[0x24BDBCEF8], v13, v14, v15);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v35[2] = v24;
      v35[3] = MEMORY[0x24BDBD1C8];
      v25 = *MEMORY[0x24BEDA8B8];
      v34[3] = CFSTR("SCAllowPairing");
      v34[4] = v25;
      v35[4] = MEMORY[0x24BDBD1C8];
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v13, (uint64_t)v35, (uint64_t)v34, 5, v32);
      v27 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        if (v5)
          goto LABEL_15;
      }
      else
      {

        if (v5)
        {
LABEL_15:
          if (v16)
            goto LABEL_16;
LABEL_21:

LABEL_16:
          v2 = v21;
          if (v27)
          {
            objc_msgSend_setObject_forKeyedSubscript_(v3, v26, v27, *MEMORY[0x24BEDA7B8]);
            v4 = (void *)v33;
            objc_msgSend_setObject_forKeyedSubscript_(v3, v28, v33, (uint64_t)CFSTR("SEPSeaCookieKeyIdentifier"));
            objc_msgSend_setObject_forKeyedSubscript_(v3, v29, (uint64_t)v10, *MEMORY[0x24BEDA818]);

            v16 = v27;
          }
          else
          {
            handleForCategory(0);
            v31 = objc_claimAutoreleasedReturnValue();
            v4 = (void *)v33;
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              sub_21456EE60();

          }
          goto LABEL_18;
        }
      }

      if (v16)
        goto LABEL_16;
      goto LABEL_21;
    }
    handleForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_21456E8C4();
  }
  else
  {
    handleForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_21456EE34();
  }
LABEL_18:

  return v3;
}

id sub_214549618(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v8;

  v2 = a2;
  v5 = v2;
  if (!v2)
  {
    handleForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_21456E5F4();
    goto LABEL_8;
  }
  objc_msgSend_objectForKeyedSubscript_(v2, v3, *MEMORY[0x24BEDA7E0], v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    handleForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_21456E620();
LABEL_8:

    v6 = 0;
  }

  return v6;
}

id sub_2145496B8(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  _QWORD v31[4];
  _QWORD v32[5];

  v32[4] = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = (void *)objc_opt_new();
  v4 = (void *)MGCopyAnswer();
  v7 = (void *)MGCopyAnswer();
  if (v2)
  {
    v8 = *MEMORY[0x24BEDA890];
    objc_msgSend_objectForKeyedSubscript_(v2, v5, *MEMORY[0x24BEDA890], v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v12 = *MEMORY[0x24BEDA818];
      objc_msgSend_objectForKeyedSubscript_(v2, v10, *MEMORY[0x24BEDA818], v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v31[0] = v8;
        objc_msgSend_objectForKeyedSubscript_(v2, v14, v8, v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (!v19)
        {
          objc_msgSend_null(MEMORY[0x24BDBCEF8], v16, v17, v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v32[0] = v20;
        v31[1] = *MEMORY[0x24BEDA898];
        v21 = v4;
        if (!v4)
        {
          objc_msgSend_null(MEMORY[0x24BDBCEF8], v16, v17, v18);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v32[1] = v21;
        v31[2] = *MEMORY[0x24BEDA8A0];
        v22 = v7;
        if (!v7)
        {
          objc_msgSend_null(MEMORY[0x24BDBCEF8], v16, v17, v18);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v31[3] = *MEMORY[0x24BEDA8B8];
        v32[2] = v22;
        v32[3] = MEMORY[0x24BDBD1C8];
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v16, (uint64_t)v32, (uint64_t)v31, 4);
        v23 = objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          if (v4)
            goto LABEL_12;
        }
        else
        {

          if (v4)
          {
LABEL_12:
            if (v19)
              goto LABEL_13;
LABEL_18:

LABEL_13:
            if (v23)
            {
              objc_msgSend_setObject_forKeyedSubscript_(v3, v24, (uint64_t)v23, *MEMORY[0x24BEDA7B8]);
              objc_msgSend_objectForKeyedSubscript_(v2, v25, v12, v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v3, v28, (uint64_t)v27, v12);

              objc_msgSend_setObject_forKeyedSubscript_(v3, v29, MEMORY[0x24BDBD1C8], (uint64_t)CFSTR("LTHTransferAllowed"));
            }
            else
            {
              handleForCategory(0);
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                sub_21456EE60();
            }
            goto LABEL_15;
          }
        }

        if (v19)
          goto LABEL_13;
        goto LABEL_18;
      }
      handleForCategory(0);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_21456EEE4();
    }
    else
    {
      handleForCategory(0);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_21456EEB8();
    }
  }
  else
  {
    handleForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_21456EE8C();
  }
LABEL_15:

  return v3;
}

id sub_2145499C0(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v8;

  v2 = a2;
  v5 = v2;
  if (!v2)
  {
    handleForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_21456E5F4();
    goto LABEL_8;
  }
  objc_msgSend_objectForKeyedSubscript_(v2, v3, *MEMORY[0x24BEDA7E0], v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    handleForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_21456E620();
LABEL_8:

    v6 = 0;
  }

  return v6;
}

id sub_214549A60(uint64_t a1, void *a2)
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v8;

  v2 = a2;
  v5 = v2;
  if (!v2)
  {
    handleForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_21456E5F4();
    goto LABEL_8;
  }
  objc_msgSend_objectForKeyedSubscript_(v2, v3, qword_254D7AE20, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    handleForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_21456EF10();
LABEL_8:

    v6 = 0;
  }

  return v6;
}

id sub_214549AFC(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *TagsWithLogging;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  id v32;
  NSObject *v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  void *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  uint64_t v59;
  const char *v60;
  NSObject *v61;
  id RequestWithLogging;
  uint64_t v63;
  NSObject *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  NSObject *v85;
  NSObject *v86;
  NSObject *v87;
  NSObject *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  int v96;
  NSObject *v97;
  uint64_t v99;
  const char *v100;
  void *v101;
  const char *v102;
  const char *v103;
  NSObject *v104;
  NSObject *v105;
  NSObject *v106;
  NSObject *v107;
  id v108;
  id v109;
  id v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  id v116;
  id v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  id v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  const __CFString *v131;
  uint64_t v132;
  const __CFString *v133;
  void *v134;
  _QWORD v135[2];
  _QWORD v136[2];
  uint8_t v137[128];
  uint8_t buf[4];
  id v139;
  _BYTE v140[448];
  uint64_t v141;
  uint64_t v142;

  v142 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v129 = 0;
  v130 = 0;
  v128 = 0;
  v119 = (void *)objc_opt_new();
  v141 = 0;
  memset(v140, 0, sizeof(v140));
  v3 = (void *)objc_opt_new();
  v6 = v3;
  if (!v3)
  {
    handleForCategory(0);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      sub_21456EDDC();
      goto LABEL_78;
    }
LABEL_84:
    v37 = 0;
    v32 = 0;
    v121 = 0;
    v11 = 0;
    v111 = 0;
    v112 = 0;
    v67 = 0;
    v117 = 0;
    v118 = 0;
    v66 = 0;
    v68 = 0;
    RequestWithLogging = 0;
    goto LABEL_66;
  }
  if (!v2)
  {
    handleForCategory(0);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      sub_21456EF3C();
      goto LABEL_78;
    }
    goto LABEL_84;
  }
  v127 = 0;
  objc_msgSend_getPathForSavageFirmwareWithError_(v3, v4, (uint64_t)&v127, v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v127;
  v11 = v8;
  if (!v7 || v8)
  {
    v34 = v7;
    handleForCategory(0);
    v106 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
      sub_21456EA9C();

    v37 = 0;
    v32 = 0;
    v121 = 0;
    goto LABEL_79;
  }
  objc_msgSend_objectForKeyedSubscript_(v2, v9, (uint64_t)CFSTR("updaterOptions"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v34 = v7;
    handleForCategory(0);
    v104 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
      sub_21456EF68();

    goto LABEL_77;
  }
  objc_msgSend_objectForKeyedSubscript_(v2, v13, (uint64_t)CFSTR("auth"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v34 = v7;
    handleForCategory(0);
    v105 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
      sub_21456EF94();

LABEL_77:
LABEL_78:
    v37 = 0;
    v32 = 0;
    v121 = 0;
    v11 = 0;
LABEL_79:
    v111 = 0;
    v112 = 0;
LABEL_80:
    v67 = 0;
    v118 = 0;
    v66 = 0;
    v68 = 0;
    RequestWithLogging = 0;
    v117 = 0;
    goto LABEL_66;
  }
  TagsWithLogging = (void *)SavageUpdaterGetTagsWithLogging();
  v17 = v130;
  handleForCategory(0);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  v112 = TagsWithLogging;
  if (!TagsWithLogging || v17)
  {
    v34 = v7;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_21456EFC0();

    v37 = 0;
    v32 = 0;
    v121 = 0;
    v11 = 0;
    v111 = 0;
    goto LABEL_80;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v139 = TagsWithLogging;
    _os_log_impl(&dword_214503000, v19, OS_LOG_TYPE_DEFAULT, "Savage updater tags: %@", buf, 0xCu);
  }
  v114 = v15;
  v116 = v12;
  v113 = v6;
  v110 = v2;

  v125 = 0u;
  v126 = 0u;
  v123 = 0u;
  v124 = 0u;
  objc_msgSend_objectForKeyedSubscript_(TagsWithLogging, v20, (uint64_t)CFSTR("BuildIdentityTags"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v123, (uint64_t)v137, 16);
  if (v24)
  {
    v27 = v24;
    v120 = 0;
    v121 = 0;
    v28 = 0;
    v29 = *(_QWORD *)v124;
    while (2)
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v124 != v29)
          objc_enumerationMutation(v22);
        v31 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * i);
        if (objc_msgSend_containsString_(v31, v25, (uint64_t)CFSTR("-Patch"), v26))
        {
          v32 = v31;

          handleForCategory(0);
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v139 = v32;
            _os_log_impl(&dword_214503000, v33, OS_LOG_TYPE_DEFAULT, "patch tag name: %@", buf, 0xCu);
          }

          v34 = v7;
          objc_msgSend_stringByAppendingString_(v7, v35, (uint64_t)v32, v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_dataWithContentsOfFile_(MEMORY[0x24BDBCE50], v38, (uint64_t)v37, v39);
          v40 = objc_claimAutoreleasedReturnValue();

          if (!v40)
          {
            handleForCategory(0);
            v88 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
              sub_21456EC2C((uint64_t)v37, v88, v89, v90, v91, v92, v93, v94);

            v121 = 0;
            v11 = 0;
            v111 = 0;
            v67 = 0;
            v117 = 0;
            v118 = 0;
            v66 = 0;
            v68 = 0;
            RequestWithLogging = 0;
            goto LABEL_58;
          }
          objc_msgSend_setObject_forKeyedSubscript_(v119, v41, v40, (uint64_t)v32);
          v120 = v37;
          v121 = (void *)v40;
          v28 = v32;
          v7 = v34;
        }
      }
      v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v123, (uint64_t)v137, 16);
      if (v27)
        continue;
      break;
    }
  }
  else
  {
    v120 = 0;
    v121 = 0;
    v28 = 0;
  }
  v42 = v28;

  v43 = v12;
  objc_msgSend_setObject_forKeyedSubscript_(v12, v44, (uint64_t)v119, (uint64_t)CFSTR("BundleDataDict"));
  v45 = *MEMORY[0x24BEE7B30];
  v135[0] = *MEMORY[0x24BEE7AB0];
  v135[1] = v45;
  v136[0] = CFSTR("0x5065");
  v136[1] = CFSTR("0x00");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v46, (uint64_t)v136, (uint64_t)v135, 2);
  v47 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v12, v48, v47, (uint64_t)CFSTR("BuildIdentity"));
  v49 = v114;
  if (objc_msgSend_BOOLValue(v114, v50, v51, v52))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v12, v53, MEMORY[0x24BDBD1B8], (uint64_t)CFSTR("ReceiptManifest"));
    v111 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    goto LABEL_29;
  }
  v122 = 0;
  objc_msgSend_getPathForApTicketWithError_(v113, v53, (uint64_t)&v122, v54);
  v56 = objc_claimAutoreleasedReturnValue();
  v69 = v122;
  v11 = v69;
  v118 = (void *)v56;
  if (!v56 || v69)
  {
    handleForCategory(0);
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      sub_21456E6FC();

    v111 = 0;
    v67 = 0;
    v66 = 0;
    v68 = 0;
    RequestWithLogging = 0;
    v117 = 0;
    v34 = v47;
    v37 = v120;
    v32 = v42;
LABEL_58:
    v2 = v110;
    goto LABEL_65;
  }
  objc_msgSend_dataWithContentsOfFile_(MEMORY[0x24BDBCE50], v70, v56, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v72;
  if (!v72 || !objc_msgSend_length(v72, v73, v74, v75))
  {
    v109 = v76;
    handleForCategory(0);
    v87 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      sub_21456E728();

    goto LABEL_64;
  }
  v55 = objc_retainAutorelease(v76);
  v80 = objc_msgSend_bytes(v55, v77, v78, v79);
  v84 = objc_msgSend_length(v55, v81, v82, v83);
  v49 = v114;
  v43 = v116;
  v109 = v55;
  if (sub_21455E170(v80, v84, (uint64_t)v140))
  {
    handleForCategory(0);
    v85 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
      sub_21456E86C();
LABEL_48:

LABEL_63:
LABEL_64:

    v11 = 0;
    v111 = 0;
    v66 = 0;
    v68 = 0;
    RequestWithLogging = 0;
    v117 = 0;
    v34 = v47;
    v37 = v120;
    v32 = v42;
    v67 = v109;
    v2 = v110;
LABEL_65:
    v6 = v113;
    goto LABEL_66;
  }
  sub_21455DF44((uint64_t)v140, 1936027753, 1145525076, &v129, &v128);
  if (v96)
  {
    handleForCategory(0);
    v97 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
      sub_21456E7AC();

    goto LABEL_63;
  }
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v95, v129, v128);
  v99 = objc_claimAutoreleasedReturnValue();
  if (!v99)
  {
    handleForCategory(0);
    v85 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
      sub_21456EA70();
    goto LABEL_48;
  }
  v132 = v99;
  v133 = CFSTR("SEP");
  v131 = CFSTR("Digest");
  v111 = (void *)v99;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v100, (uint64_t)&v132, (uint64_t)&v131, 1);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = v101;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v102, (uint64_t)&v134, (uint64_t)&v133, 1);
  v57 = objc_claimAutoreleasedReturnValue();

  objc_msgSend_setObject_forKeyedSubscript_(v116, v103, v57, (uint64_t)CFSTR("ReceiptManifest"));
LABEL_29:
  v108 = v55;
  handleForCategory(0);
  v58 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v58, OS_LOG_TYPE_DEFAULT, "Copying Firmware ...", buf, 2u);
  }

  v59 = SavageUpdaterCopyFirmwareWithLogging();
  v118 = (void *)v56;
  v115 = (void *)v59;
  if (!v59 || v130)
  {
    v66 = (void *)v57;
    handleForCategory(0);
    v107 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
      sub_21456E9A0();

    v11 = 0;
    RequestWithLogging = 0;
  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(v43, v60, v59, (uint64_t)CFSTR("FirmwareData"));
    handleForCategory(0);
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v139 = v43;
      _os_log_impl(&dword_214503000, v61, OS_LOG_TYPE_DEFAULT, "Final options: %@", buf, 0xCu);
    }

    RequestWithLogging = (id)SavageUpdaterCreateRequestWithLogging();
    v63 = v130;
    handleForCategory(0);
    v64 = objc_claimAutoreleasedReturnValue();
    v65 = v64;
    if (RequestWithLogging && !v63)
    {
      v66 = (void *)v57;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v139 = RequestWithLogging;
        _os_log_impl(&dword_214503000, v65, OS_LOG_TYPE_DEFAULT, "TSS request: %@", buf, 0xCu);
      }

      RequestWithLogging = RequestWithLogging;
      v11 = 0;
      v34 = v47;
      v37 = v120;
      v32 = v42;
      v117 = RequestWithLogging;
      goto LABEL_40;
    }
    v66 = (void *)v57;
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      sub_21456EA08();

    v11 = 0;
  }
  v117 = 0;
  v34 = v47;
  v37 = v120;
  v32 = v42;
LABEL_40:
  v67 = v108;
  v2 = v110;
  v6 = v113;
  v68 = v115;
LABEL_66:

  return v117;
}

void sub_21454A760(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_21454C640(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  id v26;

  v26 = a2;
  v5 = a3;
  objc_msgSend_objectForKey_(*(void **)(a1 + 32), v6, (uint64_t)v26, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v11 = (void *)MEMORY[0x24BDBCEF0];
    objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), v9, (uint64_t)v26, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v11, v13, (uint64_t)v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setWithArray_(MEMORY[0x24BDBCF20], v16, (uint64_t)v5, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unionSet_(v15, v19, (uint64_t)v18, v20);
    objc_msgSend_allObjects(v15, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), v25, (uint64_t)v24, (uint64_t)v26);

  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), v9, (uint64_t)v5, (uint64_t)v26);
  }

}

void sub_21454E290()
{
  CRAttestationHandler *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v0 = [CRAttestationHandler alloc];
  v4 = objc_msgSend__init(v0, v1, v2, v3);
  v5 = (void *)qword_254D7B0D0;
  qword_254D7B0D0 = v4;

}

void sub_21454E3BC(uint64_t a1, void *a2, _BYTE *a3)
{
  NSObject *v6;
  id v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  handleForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = (id)objc_opt_class();
    v7 = v18;
    _os_log_impl(&dword_214503000, v6, OS_LOG_TYPE_DEFAULT, "Inspecting Class: %@", (uint8_t *)&v17, 0xCu);

  }
  v8 = MGGetProductType();
  objc_msgSend_getDeviceHandlerForProductType_(a2, v9, v8, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 8);
  *(_QWORD *)(v12 + 8) = v11;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_opt_class();
      v17 = 138412290;
      v18 = v15;
      v16 = v15;
      _os_log_impl(&dword_214503000, v14, OS_LOG_TYPE_DEFAULT, "Chosen Class: %@", (uint8_t *)&v17, 0xCu);

    }
    *a3 = 1;
  }
}

void sub_214555470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2145554AC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_2145554BC(uint64_t a1)
{

}

void sub_2145554C4(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  int v12;
  _BOOL4 v13;
  const char *v14;
  uint64_t v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v6 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v4, (uint64_t)CFSTR("%@-"), v5, *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend_containsString_(v6, v8, (uint64_t)v7, v9);

    if (v10)
    {
      handleForCategory(0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v6;
LABEL_11:
        _os_log_impl(&dword_214503000, v11, OS_LOG_TYPE_DEFAULT, "deleting file:%@", buf, 0xCu);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
  else
  {
    v12 = objc_msgSend_containsString_(v3, v4, (uint64_t)CFSTR("trustobject-"), v5);
    handleForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (!v12)
    {
      if (v13)
      {
        *(_DWORD *)buf = 138412290;
        v17 = v6;
        goto LABEL_11;
      }
LABEL_12:

      objc_msgSend_addObject_(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v14, (uint64_t)v6, v15);
      goto LABEL_13;
    }
    if (v13)
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_impl(&dword_214503000, v11, OS_LOG_TYPE_DEFAULT, "skipping file:%@", buf, 0xCu);
    }

  }
LABEL_13:

}

void sub_21455826C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  id v25;

  v25 = a2;
  v5 = a3;
  v9 = objc_msgSend_length(v5, v6, v7, v8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = (void *)MEMORY[0x24BDD17C8];
    if (v9 < 0x401)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v10, (uint64_t)CFSTR("string : %@"), v12, v5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
LABEL_12:
        objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), v17, (uint64_t)v20, (uint64_t)v25);
        goto LABEL_13;
      }
LABEL_8:
      objc_msgSend_null(MEMORY[0x24BDBCEF8], v17, v18, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), v22, (uint64_t)v21, (uint64_t)v25);

LABEL_13:
      goto LABEL_14;
    }
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = (void *)MEMORY[0x24BDD17C8];
    if (v9 < 0x401)
    {
      objc_msgSend_convertToHexString(v5, v10, v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v13, v23, (uint64_t)CFSTR("data : %@"), v24, v14);
LABEL_11:
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
        goto LABEL_12;
      goto LABEL_8;
    }
LABEL_6:
    objc_msgSend_SHA256DigestString(v5, v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v13, v15, (uint64_t)CFSTR("digest : %@"), v16, v14);
    goto LABEL_11;
  }
  objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 32), v10, (uint64_t)CFSTR("error : Invalid Data Type"), (uint64_t)v25);
LABEL_14:

}

_BYTE *sub_214558854(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void sub_214558880(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void sub_21455891C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void *v5;

  objc_msgSend_bundleWithPath_(MEMORY[0x24BDD1488], a2, (uint64_t)CFSTR("/System/Library/PrivateFrameworks/CoreRepairCore.framework"), a4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_254D7B0E0;
  qword_254D7B0E0 = v4;

}

void sub_21455A3FC(uint64_t a1)
{
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  _QWORD v12[4];
  uint64_t v13;
  id v14;
  id v15;
  id v16;

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  objc_msgSend_componentType(*(void **)(a1 + 48), v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v2, v7, (uint64_t)v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_21455A4DC;
  v12[3] = &unk_24D1AA8F0;
  v10 = *(void **)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 48);
  v14 = v10;
  v15 = *(id *)(a1 + 64);
  v16 = *(id *)(a1 + 32);
  objc_msgSend_challengeComponentWith_withReply_(v9, v11, v13, (uint64_t)v12);

}

void sub_21455A4DC(uint64_t a1, char a2, void *a3, void *a4)
{
  char *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  if (v7 || (a2 & 1) == 0)
  {
    handleForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_2145715B8(a1, v7, v10, v11);

  }
  else
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = sub_21455A5CC;
    v12[3] = &unk_24D1AA8C8;
    v9 = *(NSObject **)(a1 + 40);
    v13 = *(id *)(a1 + 48);
    v14 = v8;
    dispatch_sync(v9, v12);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

uint64_t sub_21455A5CC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_addObject_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40), a4);
}

id sub_21455C30C()
{
  CFMutableDictionaryRef v0;
  const __CFDictionary *v1;
  io_service_t MatchingService;
  io_object_t v3;
  kern_return_t v4;
  io_connect_t v5;
  _OWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  kern_return_t v10;
  kern_return_t v11;
  NSObject *v12;
  uint64_t v14;
  const char *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  kern_return_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  io_connect_t connect[2];
  uint8_t buf[4];
  kern_return_t v31;
  _QWORD outputStruct[2];
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  int v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  connect[0] = 0;
  v0 = IOServiceMatching("IOAESAccelerator");
  if (!v0)
  {
    handleForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(outputStruct[0]) = 0;
      _os_log_impl(&dword_214503000, v17, OS_LOG_TYPE_DEFAULT, "Could not allocate matching dict for kIOAESAcceleratorClass", (uint8_t *)outputStruct, 2u);
    }

    return 0;
  }
  v1 = v0;
  CFRetain(v0);
  MatchingService = IOServiceGetMatchingService(*MEMORY[0x24BDD8B18], v1);
  if (!MatchingService)
  {
    handleForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(outputStruct[0]) = 0;
      _os_log_impl(&dword_214503000, v18, OS_LOG_TYPE_DEFAULT, "Could not find kIOAESAcceleratorClass", (uint8_t *)outputStruct, 2u);
    }

    CFRelease(v1);
    return 0;
  }
  v3 = MatchingService;
  v4 = IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], 0, connect);
  if (v4)
  {
    v19 = v4;
    handleForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(outputStruct[0]) = 67109120;
      HIDWORD(outputStruct[0]) = v19;
      _os_log_impl(&dword_214503000, v20, OS_LOG_TYPE_DEFAULT, "Return %d trying to open kIOAESAcceleratorClass", (uint8_t *)outputStruct, 8u);
    }

  }
  CFRelease(v1);
  IOObjectRelease(v3);
  v5 = connect[0];
  if (!connect[0])
    return 0;
  v6 = sub_21455C92C();
  if (!v6)
  {
    IOServiceClose(v5);
    return 0;
  }
  v7 = v6;
  *v6 = xmmword_214576078;
  v6[1] = unk_214576088;
  v8 = sub_21455C92C();
  v9 = v8;
  if (!v8)
  {
LABEL_17:
    v16 = 0;
    goto LABEL_18;
  }
  v40 = 0;
  v35 = 0;
  v34 = 0;
  v37 = 0u;
  v38 = 0u;
  *(_QWORD *)connect = 88;
  outputStruct[0] = v7;
  outputStruct[1] = v8;
  v33 = 32;
  v36 = 0x8000000000;
  v39 = 2108;
  v10 = IOConnectCallStructMethod(v5, 1u, outputStruct, 0x58uLL, outputStruct, (size_t *)connect);
  if (v10)
  {
    v11 = v10;
    handleForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v31 = v11;
      _os_log_impl(&dword_214503000, v12, OS_LOG_TYPE_DEFAULT, "perform aes => %d", buf, 8u);
    }
LABEL_16:

    goto LABEL_17;
  }
  ccsha256_di();
  v14 = cchkdf();
  if ((_DWORD)v14)
  {
    v21 = v14;
    handleForCategory(0);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_214571C74(v21, v22, v23, v24, v25, v26, v27, v28);

    goto LABEL_17;
  }
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCEC8], v15, (uint64_t)outputStruct, 32, outputStruct);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  memset_s(outputStruct, 0x20uLL, 0, 0x20uLL);
  if (!v16)
  {
    handleForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_214571C48();
    goto LABEL_16;
  }
LABEL_18:
  IOServiceClose(v5);
  free(v7);
  if (v9)
    free(v9);
  return v16;
}

void *sub_21455C92C()
{
  NSObject *v0;
  _OWORD *v1;
  void *memptr;

  memptr = 0;
  if (malloc_type_posix_memalign(&memptr, 0x10uLL, 0x20uLL, 0x432CC5B8uLL))
  {
    handleForCategory(0);
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
      sub_214571D68();

  }
  else
  {
    v1 = memptr;
    *(_OWORD *)memptr = 0u;
    v1[1] = 0u;
  }
  return memptr;
}

void sub_21455CBE0(uint64_t a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  v5 = objc_msgSend__init(v1, v2, v3, v4);
  v6 = (void *)qword_253E79858;
  qword_253E79858 = v5;

}

void sub_21455CFB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_21455CFE0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_21455CFF0(uint64_t a1)
{

}

void sub_21455CFF8(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void sub_21455D308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21455D354(_QWORD *a1, int a2, int a3, id obj, uint64_t a5, int a6)
{
  id v8;

  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a6;
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), obj);
  v8 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1[6] + 8) + 40));

}

double sub_21455D3F0(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  double result;
  unint64_t v7;
  __int128 v8;

  v7 = 0;
  v8 = 0uLL;
  while (!sub_21455E608(a1, &v7))
  {
    if (v7 == a2)
    {
      result = *(double *)&v8;
      *a3 = v8;
      return result;
    }
  }
  return result;
}

uint64_t sub_21455D450(uint64_t a1, unsigned int a2)
{
  unint64_t v2;
  unsigned int v5;

  v2 = *(_QWORD *)(a1 + 8);
  if (v2 < 4)
    return 0xFFFFFFFFLL;
  if (v2 != 4)
    return 1;
  v5 = 0;
  if (sub_21455E4F4((char **)a1, &v5))
    return 4294967294;
  if (v5 < a2)
    return 0xFFFFFFFFLL;
  return v5 > a2;
}

uint64_t sub_21455D4C4(_QWORD *a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  result = 6;
  if (a1)
  {
    if (a2)
    {
      v6 = 0;
      v7 = 0;
      v8 = 0;
      result = sub_21455E2C0((uint64_t)a1, &v6);
      if (!(_DWORD)result)
      {
        if (v6 == 0x2000000000000010)
        {
          v5 = a1[1];
          if (__CFADD__(*a1, v5) || __CFADD__(v7, v8))
          {
            __break(0x5513u);
          }
          else if (*a1 + v5 == v7 + v8)
          {
            result = sub_21455E78C(&v7, 4u, (uint64_t)&unk_214576098, a2, 0x40uLL, 0);
            if (!(_DWORD)result)
              return 2 * (sub_21455D450(a2, 0x494D4734u) != 0);
          }
          else
          {
            return 7;
          }
        }
        else
        {
          return 2;
        }
      }
    }
  }
  return result;
}

uint64_t sub_21455D5A4(unint64_t *a1, char **a2)
{
  uint64_t result;
  unsigned int v5;

  v5 = 2;
  result = 6;
  if (a1)
  {
    if (a2)
    {
      result = sub_21455E78C(a1, 2u, (uint64_t)&unk_2145763B0, (unint64_t)a2, 0x20uLL, 0);
      if (!(_DWORD)result)
      {
        result = sub_21455E4F4(a2, &v5);
        if (!(_DWORD)result)
        {
          if (v5 <= 1)
            return 0;
          else
            return 6;
        }
      }
    }
  }
  return result;
}

uint64_t sub_21455D624(uint64_t a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;

  result = 6;
  if (a1)
  {
    if (a2)
    {
      result = sub_21455E6C4(a1, 7u, (uint64_t)&unk_214576188, a2, 0xA0uLL, 0);
      if (!(_DWORD)result)
      {
        if (sub_21455D450(a2, 0x494D3450u))
        {
          return 2;
        }
        else if (!*(_QWORD *)(a2 + 80)
               || (v7 = 0u, v8 = 0u,
                            result = sub_21455D5A4((unint64_t *)(a2 + 80), (char **)&v7),
                            !(_DWORD)result))
        {
          v6 = *(_QWORD *)(a2 + 96);
          v5 = a2 + 96;
          if (!v6)
            return 0;
          v7 = 0u;
          v8 = 0u;
          result = sub_21455D6DC(v5, (unint64_t)&v7);
          if (!(_DWORD)result)
            return 0;
        }
      }
    }
  }
  return result;
}

uint64_t sub_21455D6DC(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2)
      return 6;
    if (*(_QWORD *)result && *(_QWORD *)(result + 8))
    {
      result = sub_21455E6C4(result, 2u, (uint64_t)&unk_214576380, a2, 0x20uLL, 0);
      if ((_DWORD)result)
        return result;
      if (sub_21455D450(a2, 0x50415950u))
        return 2;
    }
    return 0;
  }
  return result;
}

uint64_t sub_21455D758(uint64_t a1, unint64_t a2)
{
  uint64_t result;
  unint64_t *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[2];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  result = 6;
  if (a1 && a2)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    result = sub_21455D624(a1, (unint64_t)&v11);
    if ((_DWORD)result)
    {
      result = sub_21455E6C4(a1, 6u, (uint64_t)&unk_2145760F8, a2, 0x90uLL, 0);
      if (!(_DWORD)result)
      {
        if (sub_21455D450(a2, 0x494D3450u))
        {
          return 2;
        }
        else
        {
          v6 = *(_QWORD *)(a2 + 80);
          v5 = (unint64_t *)(a2 + 80);
          if (!v6)
            return 0;
          memset(v10, 0, sizeof(v10));
          result = sub_21455D5A4(v5, (char **)v10);
          if (!(_DWORD)result)
            return 0;
        }
      }
    }
    else
    {
      v7 = v12;
      *(_OWORD *)a2 = v11;
      *(_OWORD *)(a2 + 16) = v7;
      v8 = v14;
      *(_OWORD *)(a2 + 32) = v13;
      *(_OWORD *)(a2 + 48) = v8;
      v9 = v16;
      *(_OWORD *)(a2 + 64) = v15;
      *(_OWORD *)(a2 + 80) = v9;
    }
  }
  return result;
}

uint64_t sub_21455D860(_QWORD *a1, unint64_t a2)
{
  return sub_21455D87C(a1, 5uLL, (uint64_t)&unk_214576230, a2, 0x494D344Du);
}

uint64_t sub_21455D87C(_QWORD *a1, unint64_t a2, uint64_t a3, unint64_t a4, unsigned int a5)
{
  uint64_t result;
  unsigned int v9;

  result = 6;
  if (a1 && a4)
  {
    if (!*a1 || !a1[1])
      return 0;
    if (a2 >= 0x10000)
    {
      __break(0x5507u);
      return result;
    }
    result = sub_21455E6C4((uint64_t)a1, (unsigned __int16)a2, a3, a4, 0xC0uLL, 0);
    if (!(_DWORD)result)
    {
      if (sub_21455D450(a4, a5))
        return 2;
      v9 = 0;
      result = sub_21455E4F4((char **)(a4 + 16), &v9);
      if ((_DWORD)result)
        return result;
      if (v9 > 2)
        return 2;
      return 0;
    }
  }
  return result;
}

uint64_t sub_21455D928(_QWORD *a1, unint64_t a2)
{
  return sub_21455D87C(a1, 3uLL, (uint64_t)&unk_214576308, a2, 0x494D344Du);
}

uint64_t sub_21455D944(_QWORD *a1, unint64_t a2)
{
  return sub_21455D87C(a1, 4uLL, (uint64_t)&unk_2145762A8, a2, 0x494D3443u);
}

uint64_t sub_21455D960(_QWORD *a1, unint64_t a2)
{
  return sub_21455D87C(a1, 3uLL, (uint64_t)&unk_214576308, a2, 0x494D3443u);
}

uint64_t sub_21455D97C(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2)
      return 6;
    if (*(_QWORD *)result && *(_QWORD *)(result + 8))
    {
      result = sub_21455E6C4(result, 2u, (uint64_t)&unk_214576350, a2, 0x20uLL, 0);
      if ((_DWORD)result)
        return result;
      if (sub_21455D450(a2, 0x494D3452u))
        return 2;
    }
    return 0;
  }
  return result;
}

uint64_t sub_21455D9F8(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t result;
  unsigned int v8;
  _QWORD v9[4];
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  v9[0] = 0;
  v9[2] = 0;
  v9[1] = 22;
  v9[3] = 24;
  v10 = a3;
  result = sub_21455E6C4(a1, 2u, (uint64_t)v9, a4, 0x30uLL, 0);
  if (!(_DWORD)result)
  {
    result = sub_21455E4F4((char **)a4, &v8);
    if (!(_DWORD)result)
    {
      if ((v8 | 0xE000000000000000) == a2)
      {
        result = 0;
        *(_QWORD *)(a4 + 16) = a2 | 0xE000000000000000;
        *(_QWORD *)(a4 + 40) = a3;
      }
      else
      {
        return 2;
      }
    }
  }
  return result;
}

void sub_21455DAC8(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  int v7;
  __int128 v8;

  v8 = 0uLL;
  sub_21455D3F0(a1, a2, &v8);
  if (!v7)
    sub_21455D9F8((uint64_t)&v8, a2, a3, a4);
}

void sub_21455DB20(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7[2];

  v7[0] = 0;
  v7[1] = 0;
  if (!sub_21455E5DC(a1, v7))
    sub_21455DAC8(v7, a2, a3, a4);
}

void sub_21455DB78(uint64_t a1, unint64_t a2, unint64_t a3)
{
  sub_21455DB84(a1, a2, a3, 0x4D414E42u);
}

void sub_21455DB84(uint64_t a1, unint64_t a2, unint64_t a3, unsigned int a4)
{
  unint64_t v8;
  int v9;
  int v10;
  int v11;
  _OWORD v12[3];
  _OWORD v13[3];
  unint64_t v14;
  unint64_t v15[2];

  v11 = 0;
  if (a1)
  {
    if (a2 | a3)
    {
      v14 = 0;
      v15[0] = 0;
      v15[1] = 0;
      memset(v13, 0, sizeof(v13));
      memset(v12, 0, sizeof(v12));
      if (!sub_21455E2C0(a1 + 264, &v14)
        && v14 == 0x2000000000000011
        && !sub_21455E4F4((char **)(a1 + 248), &v11))
      {
        v8 = v11 == 2 ? 0x2000000000000010 : 0x2000000000000011;
        sub_21455DB20(v15, a4 | 0xE000000000000000, v8, (unint64_t)v13);
        if (!v9)
        {
          if (a2)
            *(_OWORD *)a2 = *(_OWORD *)((char *)&v13[1] + 8);
          sub_21455DB20((unint64_t *)&v13[1] + 1, 0xE00000004D414E50, 0x2000000000000011uLL, (unint64_t)v12);
          if (a3)
          {
            if (!v10)
              *(_OWORD *)a3 = *(_OWORD *)((char *)&v12[1] + 8);
          }
        }
      }
    }
  }
}

uint64_t sub_21455DCB0(uint64_t a1, BOOL *a2)
{
  uint64_t result;
  BOOL v4;

  result = 6;
  if (a1 && a2)
  {
    if (*(_QWORD *)(a1 + 136))
      v4 = *(_QWORD *)(a1 + 144) != 0;
    else
      v4 = 0;
    result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t sub_21455DCE8(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  BOOL v5;

  if (a1 && a2)
  {
    v5 = 0;
    result = sub_21455DCB0(a1, &v5);
    if (!(_DWORD)result)
    {
      if (v5)
      {
        result = 0;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 136);
        return result;
      }
      result = 1;
    }
    goto LABEL_9;
  }
  result = 6;
  if (a2)
  {
LABEL_9:
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
  }
  return result;
}

uint64_t sub_21455DD54(_QWORD *a1, unsigned int a2, char *a3)
{
  uint64_t v3;
  char v4;

  v3 = 6;
  if (a2 <= 1 && a1 && a3)
  {
    if (a2 == 1)
    {
      if (!a1[55] || !a1[56])
        goto LABEL_11;
    }
    else if (!a1[33] || !a1[34])
    {
LABEL_11:
      v4 = 0;
      goto LABEL_12;
    }
    v4 = 1;
LABEL_12:
    v3 = 0;
    *a3 = v4;
  }
  return v3;
}

uint64_t sub_21455DDB4(uint64_t a1, unsigned int a2, uint64_t a3, BOOL *a4)
{
  uint64_t v4;
  uint64_t v6;
  _OWORD v8[3];

  memset(v8, 0, sizeof(v8));
  v4 = 6;
  if (a1)
  {
    if (a4)
    {
      sub_21455DFBC(a1, a2, a3 | 0xE000000000000000, 1uLL, v8);
      v4 = v6;
      if (!(_DWORD)v6)
        return sub_21455E4B8((unsigned __int8 **)&v8[1] + 1, a4);
    }
  }
  return v4;
}

void sub_21455DE20(uint64_t a1, unsigned int a2, uint64_t a3, _DWORD *a4)
{
  int v5;
  _OWORD v6[3];

  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      sub_21455DFBC(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (!v5)
      {
        if (sub_21455E4F4((char **)&v6[1] + 1, a4))
          *a4 = 0;
      }
    }
  }
}

double sub_21455DE94(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _OWORD *a5)
{
  double result;
  int v10;
  int v11;
  int v12;
  _OWORD v13[3];
  unint64_t v14[2];

  v14[0] = 0;
  v14[1] = 0;
  result = 0.0;
  memset(v13, 0, sizeof(v13));
  if (a1)
  {
    if (a5)
    {
      sub_21455DB78(a1, (unint64_t)v14, 0);
      if (v10
        || (sub_21455DB20(v14, a2 | 0xE000000000000000, 0x2000000000000011uLL, (unint64_t)v13), v11)
        || (sub_21455DB20((unint64_t *)&v13[1] + 1, a3, a4, (unint64_t)a5), v12))
      {
        result = 0.0;
        a5[1] = 0u;
        a5[2] = 0u;
        *a5 = 0u;
      }
    }
  }
  return result;
}

void sub_21455DF44(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  int v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  if (a1 && a4 && a5)
  {
    sub_21455DE94(a1, a2, a3 | 0xE000000000000000, 4uLL, &v9);
    if (v7)
    {
      v8 = 0;
      *a4 = 0;
    }
    else
    {
      v8 = v11;
      *a4 = *((_QWORD *)&v10 + 1);
    }
    *a5 = v8;
  }
}

double sub_21455DFBC(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, _OWORD *a5)
{
  int v10;
  double result;
  int v12;
  unint64_t v13[3];
  char v14;

  *(_OWORD *)v13 = 0uLL;
  if (a2 <= 1 && a1 && a5)
  {
    v14 = 0;
    if (!sub_21455DD54((_QWORD *)a1, a2, &v14) && v14)
    {
      if (a2)
      {
        *(_OWORD *)v13 = *(_OWORD *)(a1 + 440);
        goto LABEL_9;
      }
      sub_21455DB78(a1, 0, (unint64_t)v13);
      if (!v10)
      {
LABEL_9:
        sub_21455DB20(v13, a3, a4, (unint64_t)a5);
        if (!v12)
          return result;
      }
    }
    result = 0.0;
    a5[1] = 0u;
    a5[2] = 0u;
    *a5 = 0u;
  }
  return result;
}

double sub_21455E088(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _QWORD v9[2];

  if (a1)
  {
    if (a3)
    {
      v9[0] = a1;
      v9[1] = a2;
      v7 = 0u;
      v8 = 0u;
      v5 = 0u;
      v6 = 0u;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      *(_OWORD *)(a3 + 32) = 0u;
      *(_OWORD *)(a3 + 48) = 0u;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)(a3 + 80) = 0u;
      *(_OWORD *)(a3 + 96) = 0u;
      *(_OWORD *)(a3 + 112) = 0u;
      *(_OWORD *)(a3 + 128) = 0u;
      *(_OWORD *)(a3 + 144) = 0u;
      *(_OWORD *)(a3 + 160) = 0u;
      *(_OWORD *)(a3 + 176) = 0u;
      *(_OWORD *)(a3 + 192) = 0u;
      *(_OWORD *)(a3 + 208) = 0u;
      *(_OWORD *)(a3 + 224) = 0u;
      *(_OWORD *)(a3 + 240) = 0u;
      *(_OWORD *)(a3 + 256) = 0u;
      *(_OWORD *)(a3 + 272) = 0u;
      *(_OWORD *)(a3 + 288) = 0u;
      *(_OWORD *)(a3 + 304) = 0u;
      *(_OWORD *)(a3 + 320) = 0u;
      *(_OWORD *)(a3 + 336) = 0u;
      *(_OWORD *)(a3 + 352) = 0u;
      *(_OWORD *)(a3 + 368) = 0u;
      *(_OWORD *)(a3 + 384) = 0u;
      *(_OWORD *)(a3 + 400) = 0u;
      *(_OWORD *)(a3 + 416) = 0u;
      *(_OWORD *)(a3 + 432) = 0u;
      *(_QWORD *)(a3 + 448) = 0;
      if (!sub_21455D4C4(v9, (unint64_t)&v5)
        && !sub_21455D758((uint64_t)&v6, a3 + 88)
        && !sub_21455D860(&v7, a3 + 232)
        && !sub_21455D97C((uint64_t)&v8, a3 + 424))
      {
        *(_OWORD *)(a3 + 8) = v6;
        result = *(double *)&v7;
        *(_OWORD *)(a3 + 24) = v7;
      }
    }
  }
  return result;
}

uint64_t sub_21455E170(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21455E184(a1, a2, 1, a3, 1229796429);
}

uint64_t sub_21455E184(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t result;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  result = 6;
  if (a1 && a4)
  {
    v15 = a1;
    v16 = a2;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_OWORD *)(a4 + 32) = 0u;
    *(_OWORD *)(a4 + 48) = 0u;
    *(_OWORD *)(a4 + 64) = 0u;
    *(_OWORD *)(a4 + 80) = 0u;
    *(_OWORD *)(a4 + 96) = 0u;
    *(_OWORD *)(a4 + 112) = 0u;
    *(_OWORD *)(a4 + 128) = 0u;
    *(_OWORD *)(a4 + 144) = 0u;
    *(_OWORD *)(a4 + 160) = 0u;
    *(_OWORD *)(a4 + 176) = 0u;
    *(_OWORD *)(a4 + 192) = 0u;
    *(_OWORD *)(a4 + 208) = 0u;
    *(_OWORD *)(a4 + 224) = 0u;
    *(_OWORD *)(a4 + 240) = 0u;
    *(_OWORD *)(a4 + 256) = 0u;
    *(_OWORD *)(a4 + 272) = 0u;
    *(_OWORD *)(a4 + 288) = 0u;
    *(_OWORD *)(a4 + 304) = 0u;
    *(_OWORD *)(a4 + 320) = 0u;
    *(_OWORD *)(a4 + 336) = 0u;
    *(_OWORD *)(a4 + 352) = 0u;
    *(_OWORD *)(a4 + 368) = 0u;
    *(_OWORD *)(a4 + 384) = 0u;
    *(_OWORD *)(a4 + 400) = 0u;
    *(_OWORD *)(a4 + 416) = 0u;
    *(_OWORD *)(a4 + 432) = 0u;
    *(_QWORD *)(a4 + 448) = 0;
    if (a5 == 1229796419)
    {
      v10 = a4 + 232;
      if (a3)
        result = sub_21455D944(&v15, v10);
      else
        result = sub_21455D960(&v15, v10);
    }
    else
    {
      if (a5 != 1229796429)
        return 2;
      v9 = a4 + 232;
      if (a3)
        result = sub_21455D860(&v15, v9);
      else
        result = sub_21455D928(&v15, v9);
    }
    if (!(_DWORD)result)
    {
      if (*(_QWORD *)(a4 + 264))
      {
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = a1;
        v16 = a2;
        result = sub_21455E2C8((uint64_t)&v15, &v12, 0);
        if (!(_DWORD)result)
        {
          *(_QWORD *)(a4 + 24) = a1;
          v11 = v14 + v13 - a1;
          if (__CFADD__(v14, v13 - a1))
          {
            __break(0x5500u);
          }
          else
          {
            *(_QWORD *)(a4 + 32) = v11;
            if (v11 == a2)
              return 0;
            else
              return 7;
          }
        }
      }
      else
      {
        return 3;
      }
    }
  }
  return result;
}

uint64_t sub_21455E2C0(uint64_t a1, unint64_t *a2)
{
  return sub_21455E2C8(a1, a2, 0);
}

uint64_t sub_21455E2C8(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  unsigned __int8 *v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  BOOL v10;
  unint64_t v11;
  char *v12;
  unsigned __int8 v13;
  _BYTE *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unsigned int v24;
  BOOL v25;
  char v26;
  unint64_t v27;
  _BYTE *v28;

  v3 = *(_QWORD *)(result + 8);
  if (v3 < 2)
    return 3;
  v4 = *(_BYTE **)result;
  if (*(_QWORD *)result == -1)
    goto LABEL_68;
  v5 = &v4[v3];
  v6 = v4 + 1;
  v7 = v3 - 1;
  v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4)
        goto LABEL_69;
      v14 = v12 + 1;
      v15 = *v12;
      v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15)
            v17 = *v12;
          else
            v17 = v7 - 1;
          v10 = v5 >= v14;
          v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3)
              return 0;
LABEL_34:
            result = 0;
            *a3 = v15;
            return result;
          }
LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }
        return 3;
      }
      v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8)
        return 3;
      if ((v15 & 0x7F) == 0 || v16 < v19)
        return 3;
      if (v14 >= v5 || v14 < v4)
        goto LABEL_69;
      if (!*v14)
        return 3;
      v15 = 0;
      v21 = (v19 - 1);
      v22 = v7 - v21 - 2;
      v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (_BYTE *)-1)
      {
        if (v14 >= v5)
          goto LABEL_69;
        v10 = v16-- != 0;
        if (!v10)
          goto LABEL_70;
        v24 = *v14++;
        v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!(_DWORD)v19)
        {
          if (a3)
            v25 = 0;
          else
            v25 = v15 > v22;
          v26 = v25;
          result = 3;
          if (v15 < 0x80 || (v26 & 1) != 0)
            return result;
          if (v15 >= v22)
            v27 = v22;
          else
            v27 = v15;
          v10 = (unint64_t)v5 >= v23;
          v28 = &v5[-v23];
          if (!v10 || (unint64_t)v4 > v23 || v27 > (unint64_t)v28)
            goto LABEL_69;
          a2[1] = v23;
          a2[2] = v27;
          if (a3)
            goto LABEL_34;
          return 0;
        }
      }
    }
LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }
  v9 = *v6;
  v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10)
    return 3;
  v8 = 0;
  result = 3;
  while (v7 >= 2)
  {
    v11 = v8;
    if (v8 >> 57)
      break;
    if (v6 == (unsigned __int8 *)-1)
      goto LABEL_68;
    if (v6 >= v5 || v6 < v4)
      goto LABEL_69;
    v12 = (char *)(v6 + 1);
    --v7;
    v13 = *v6;
    v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54)
        return 3;
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t sub_21455E4B8(unsigned __int8 **a1, BOOL *a2)
{
  int v2;
  uint64_t result;

  if (a1[1] != (unsigned __int8 *)1)
    return 3;
  v2 = **a1;
  if (v2 != 255 && v2 != 0)
    return 3;
  result = 0;
  *a2 = v2 != 0;
  return result;
}

uint64_t sub_21455E4F4(char **a1, _DWORD *a2)
{
  uint64_t result;
  unint64_t v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  result = sub_21455E574(a1, v4);
  if (!(_DWORD)result)
  {
    if (HIDWORD(v4[0]))
    {
      return 7;
    }
    else
    {
      result = 0;
      *a2 = v4[0];
    }
  }
  return result;
}

uint64_t sub_21455E574(char **a1, unint64_t *a2)
{
  unint64_t v2;
  unsigned __int8 *v3;
  uint64_t result;
  unint64_t v5;
  unsigned int v6;

  v2 = (unint64_t)a1[1];
  if (!v2)
    return 3;
  v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0)
    return 3;
  if (**a1)
  {
    if (v2 > 8)
      return 7;
    goto LABEL_10;
  }
  if (v2 >= 2)
  {
    if (((char)v3[1] & 0x80000000) == 0)
      return 3;
    if (v2 > 9)
      return 7;
  }
LABEL_10:
  v5 = 0;
  do
  {
    v6 = *v3++;
    v5 = v6 | (v5 << 8);
    --v2;
  }
  while (v2);
  result = 0;
  *a2 = v5;
  return result;
}

unint64_t *sub_21455E5DC(unint64_t *result, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = *result;
  v3 = result[1];
  if (__CFADD__(*result, v3))
  {
    __break(0x5513u);
  }
  else
  {
    v4 = v2 + v3;
    if (v2 <= v4)
    {
      *a2 = v2;
      a2[1] = v4;
      return 0;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t sub_21455E608(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v10[0] = 0;
  v2 = *a1;
  v3 = a1[1];
  if (*a1 >= v3)
    return 1;
  v10[0] = *a1;
  v10[1] = v3 - v2;
  result = sub_21455E2C8((uint64_t)v10, a2, 0);
  if (!(_DWORD)result)
  {
    v8 = a2[1];
    v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        result = 0;
        *a1 = v9;
        return result;
      }
      __break(0x5519u);
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t sub_21455E6C4(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  uint64_t result;
  unint64_t v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  memset(v12, 170, 24);
  result = sub_21455E2C8(a1, v12, 0);
  if (!(_DWORD)result)
  {
    if (v12[0] == 0x2000000000000010)
      return sub_21455E78C(&v12[1], a2, a3, a4, a5, a6);
    else
      return 2;
  }
  return result;
}

uint64_t sub_21455E78C(unint64_t *a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int16 v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;
  unsigned __int16 v17;
  __int16 v18;
  unint64_t v19;
  char *v21;
  uint64_t v23;
  unint64_t v24;
  __int16 *v25;
  unint64_t v26;
  __int16 v27;
  unint64_t v28;
  char *v29;
  unint64_t v31[3];
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v32 = 0;
  if (a6)
  {
    if (a6 > a5)
      goto LABEL_59;
    bzero((void *)a4, a6);
  }
  v10 = *a1;
  v11 = a1[1];
  if (__CFADD__(*a1, v11))
    goto LABEL_58;
  v12 = v10 + v11;
  if (v10 > v12)
LABEL_59:
    __break(0x5519u);
  v32 = *a1;
  v33 = v12;
  if (a2)
  {
    v13 = 0;
    v29 = (char *)(a4 + a5);
    while (1)
    {
      memset(v31, 170, sizeof(v31));
      v15 = v32;
      v14 = v33;
      result = sub_21455E608(&v32, v31);
      if ((_DWORD)result)
        break;
      if (a2 <= v13)
        return 2;
      while (1)
      {
        if (24 * (__int16)v13 > (unint64_t)~a3)
          goto LABEL_58;
        v17 = v13;
        v18 = *(_WORD *)(a3 + 24 * v13 + 16);
        if ((v18 & 2) != 0 || v31[0] == *(_QWORD *)(a3 + 24 * v13 + 8))
          break;
        result = 2;
        if ((v18 & 1) != 0)
        {
          ++v13;
          if (a2 > (unsigned __int16)(v17 + 1))
            continue;
        }
        return result;
      }
      if ((v18 & 4) == 0)
      {
        v19 = *(_QWORD *)(a3 + 24 * v13);
        if (v19 > 0xFFFFFFFFFFFFFFEFLL || v19 + 16 > a5)
          return 7;
        if (v19 > ~a4)
          goto LABEL_58;
        v21 = (char *)(a4 + v19);
        if (v21 >= v29 || (unint64_t)v21 < a4)
          goto LABEL_59;
        *(_OWORD *)v21 = *(_OWORD *)&v31[1];
        if ((v18 & 8) != 0)
        {
          if (v15 >= v31[1])
          {
            if (v21 + 16 <= v29 && v14 >= v15 && *((_QWORD *)v21 + 1) <= v14 - v15)
            {
              *(_QWORD *)v21 = v15;
              return 3;
            }
            goto LABEL_59;
          }
          if (v21 + 16 > v29)
            goto LABEL_59;
          v23 = *((_QWORD *)v21 + 1);
          v24 = v23 + v31[1] - v15;
          if (__CFADD__(v23, v31[1] - v15))
          {
            __break(0x5500u);
            return result;
          }
          if (v14 < v15 || v24 > v14 - v15)
            goto LABEL_59;
          *(_QWORD *)v21 = v15;
          *((_QWORD *)v21 + 1) = v24;
        }
      }
      ++v13;
      if (a2 == (unsigned __int16)(v17 + 1))
      {
        if (!__CFADD__(v31[1], v31[2]))
        {
          v28 = a1[1];
          if (!__CFADD__(*a1, v28))
          {
            v10 = v31[1] + v31[2];
            v12 = *a1 + v28;
            goto LABEL_47;
          }
        }
LABEL_58:
        __break(0x5513u);
        goto LABEL_59;
      }
      if (a2 <= (unsigned __int16)(v17 + 1))
      {
        v10 = v32;
        v12 = v33;
        goto LABEL_47;
      }
    }
    if ((_DWORD)result == 1)
    {
      if (a2 <= v13)
      {
        return 0;
      }
      else
      {
        v25 = (__int16 *)(a3 + 24 * v13 + 16);
        v26 = a2 - (unint64_t)v13;
        result = 0;
        while (1)
        {
          v27 = *v25;
          v25 += 12;
          if ((v27 & 1) == 0)
            break;
          if (!--v26)
            return result;
        }
        return 5;
      }
    }
  }
  else
  {
LABEL_47:
    if (v10 == v12)
      return 0;
    else
      return 3;
  }
  return result;
}

void *sub_21455EA5C(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  v2 = calloc(8uLL, 1uLL);
  v3 = v2;
  if (v2)
  {
    *v2 = 0;
    if (a1)
    {
      if (sub_214560354((uint64_t)v2))
      {
        memset_s(v3, 8uLL, 0, 8uLL);
        free(v3);
        return 0;
      }
    }
  }
  return v3;
}

void *sub_21455EADC(int a1, int a2)
{
  void **v2;
  void *result;
  void **v4;
  void *v5;
  BOOL v6;

  switch(a1)
  {
    case 1:
      v2 = (void **)&off_254D7AF90;
      goto LABEL_28;
    case 2:
      v2 = (void **)&off_254D7AF80;
      goto LABEL_28;
    case 3:
      v2 = (void **)&off_254D7AF88;
      goto LABEL_28;
    case 4:
      v2 = (void **)&off_254D7AF98;
      goto LABEL_28;
    case 5:
      v2 = (void **)&off_254D7AF70;
      goto LABEL_28;
    case 6:
      v2 = (void **)&off_254D7B018;
      goto LABEL_28;
    case 7:
      v2 = (void **)&off_254D7B010;
      goto LABEL_28;
    case 8:
      v4 = (void **)&off_254D7B028;
      goto LABEL_30;
    case 9:
      v4 = (void **)&off_254D7B030;
      goto LABEL_30;
    case 10:
      v2 = (void **)&off_254D7B040;
      goto LABEL_28;
    case 11:
      v2 = (void **)&off_254D7B048;
      goto LABEL_28;
    case 12:
      v2 = (void **)&off_254D7B050;
      goto LABEL_28;
    case 13:
      v2 = (void **)&off_254D7B058;
      goto LABEL_28;
    case 14:
      v2 = (void **)&off_254D7B060;
      goto LABEL_28;
    case 15:
      v2 = (void **)&off_254D7B020;
      goto LABEL_28;
    case 16:
      v4 = (void **)&off_254D7AFD0;
      goto LABEL_30;
    case 17:
      v2 = (void **)&off_254D7AFE0;
      goto LABEL_28;
    case 18:
      v4 = (void **)&off_254D7AFE8;
      goto LABEL_30;
    case 19:
      v5 = off_254D7AFF8;
      v6 = a2 == 3;
      goto LABEL_31;
    case 20:
      v4 = (void **)&off_254D7B000;
      goto LABEL_30;
    case 21:
      v2 = (void **)&off_254D7B008;
      goto LABEL_28;
    case 22:
      v4 = (void **)&off_254D7AFF0;
      goto LABEL_30;
    case 23:
      v4 = (void **)&off_254D7AFD8;
      goto LABEL_30;
    case 24:
      v2 = (void **)&off_254D7B068;
      goto LABEL_28;
    case 25:
      v2 = (void **)&off_254D7B070;
LABEL_28:
      v5 = *v2;
      v6 = a2 == 2;
      goto LABEL_31;
    case 26:
      v4 = (void **)&off_254D7B038;
LABEL_30:
      v5 = *v4;
      v6 = a2 == 1;
LABEL_31:
      if (v6)
        result = v5;
      else
        result = 0;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t sub_21455EC5C(_QWORD *a1, int a2, uint64_t *a3)
{
  uint64_t v5;
  unsigned __int8 *v6;
  uint64_t v7;

  v5 = 3758097090;
  v6 = (unsigned __int8 *)sub_21455EADC(a2, 1);
  if (v6)
  {
    v7 = (uint64_t)v6;
    if (!sub_214560144(a1, v6) && (!a3 || !sub_214560908(a1, v7, *a3)))
      return 0;
  }
  return v5;
}

uint64_t sub_21455ECD4(void ***a1)
{
  uint64_t result;
  void **v3;

  result = 3758097090;
  if (a1)
  {
    v3 = *a1;
    if (*a1)
    {
      *a1 = 0;
      sub_2145600CC(v3);
      memset_s(v3, 8uLL, 0, 8uLL);
      free(v3);
      return 0;
    }
  }
  return result;
}

uint64_t sub_21455ED30(int a1, int a2, unsigned int a3, uint64_t a4, uint64_t a5, void ***a6)
{
  uint64_t v11;
  void *v12;
  void **v13;
  void *v14;
  void **v15;
  uint64_t v16;
  char *v17;
  rsize_t v18;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  rsize_t v24;
  void *v25;
  size_t v26;

  v11 = 3758097090;
  v12 = off_254D7AFB8;
  v13 = (void **)calloc(8uLL, 1uLL);
  *v13 = 0;
  sub_21456078C(v13, (uint64_t)off_254D7AF60, (uint64_t)v12);
  v25 = 0;
  v26 = 0;
  v23 = 0;
  v24 = 0;
  if (!a6)
    goto LABEL_14;
  v14 = calloc(0x50uLL, 1uLL);
  v22 = v14;
  if (!v14)
  {
    v11 = 3758604298;
    goto LABEL_14;
  }
  v15 = (void **)v14;
  memset_s(v14, 0x50uLL, 0, 0x50uLL);
  if (a4 && sub_214560354((uint64_t)v13)
    || sub_214560908(v13, (uint64_t)off_254D7AF68, a2)
    || sub_214560908(v13, (uint64_t)off_254D7AFA8, a3)
    || sub_21456045C(v13, &v25, &v26))
  {
LABEL_17:
    sub_21455EF5C((uint64_t *)&v22);
    goto LABEL_14;
  }
  v16 = sub_21455F0D0();
  if ((_DWORD)v16)
  {
    v11 = v16;
    goto LABEL_17;
  }
  v17 = (char *)v23;
  v18 = v24;
  *v15 = v23;
  v15[1] = (void *)v18;
  *((_DWORD *)v15 + 10) = a1;
  v15[2] = &v17[v18];
  v20 = 0;
  v21 = 0;
  if (sub_21455FF2C((uint64_t)off_254D7AFB0, &v20, &v21))
    v15[4] = v20;
  if (sub_21455FF2C((uint64_t)off_254D7AF80, &v20, &v21))
    v15[3] = v20;
  v11 = 0;
  *a6 = v15;
  v23 = 0;
  v24 = 0;
LABEL_14:
  sub_2145600CC(v13);
  memset_s(v13, 8uLL, 0, 8uLL);
  free(v13);
  memset_s(v25, v26, 0, v26);
  free(v25);
  memset_s(v23, v24, 0, v24);
  free(v23);
  return v11;
}

uint64_t sub_21455EF5C(uint64_t *a1)
{
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = *a1;
  if (!*a1)
    return 3758097090;
  *a1 = 0;
  if (*(_QWORD *)v1)
  {
    memset_s(*(void **)v1, *(_QWORD *)(v1 + 8), 0, *(_QWORD *)(v1 + 8));
    free(*(void **)v1);
  }
  v2 = *(void **)(v1 + 48);
  if (v2)
  {
    memset_s(v2, *(_QWORD *)(v1 + 56), 0, *(_QWORD *)(v1 + 56));
    free(*(void **)(v1 + 48));
  }
  v3 = *(void **)(v1 + 64);
  if (v3)
  {
    memset_s(v3, *(_QWORD *)(v1 + 72), 0, *(_QWORD *)(v1 + 72));
    free(*(void **)(v1 + 64));
  }
  memset_s((void *)v1, 0x50uLL, 0, 0x50uLL);
  free((void *)v1);
  return 0;
}

uint64_t sub_21455F00C(int a1, const void *a2, size_t a3, uint64_t *a4)
{
  uint64_t v4;
  void *v9;
  uint64_t v10;
  void *v12;

  v4 = 3758097090;
  if (a2)
  {
    if (a3)
    {
      if (sub_21455FDF4((uint64_t)a2) == a3)
      {
        v4 = 3758604298;
        v9 = calloc(0x50uLL, 1uLL);
        v12 = v9;
        if (v9)
        {
          v10 = (uint64_t)v9;
          memset_s(v9, 0x50uLL, 0, 0x50uLL);
          *(_DWORD *)(v10 + 40) = a1;
          if (sub_21455F2A8(v10, a2, a3))
          {
            sub_21455EF5C((uint64_t *)&v12);
          }
          else
          {
            v4 = 0;
            *a4 = v10;
          }
        }
      }
    }
  }
  return v4;
}

uint64_t sub_21455F0D0()
{
  int v0;
  size_t *v1;
  size_t *v2;
  _QWORD *v3;
  _QWORD *v4;
  size_t v5;
  size_t v6;
  const void *v7;
  const void *v8;
  int v9;
  mach_port_t v10;
  mach_port_t v11;
  uint64_t v12;
  void *v13;
  size_t __count;
  uint64_t input;
  _BYTE __src[32768];
  uint64_t v18;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = v0;
  v18 = *MEMORY[0x24BDAC8D0];
  v10 = sub_21455FB8C();
  if (v10)
  {
    if (v8)
    {
      v11 = v10;
      v12 = 3758097090;
      if (sub_21455FDF4((uint64_t)v8) == v6)
      {
        bzero(__src, 0x8000uLL);
        __count = 0x8000;
        input = v9;
        v12 = IOConnectCallMethod(v11, 0x2Bu, &input, 1u, v8, v6, 0, 0, __src, &__count);
        if (!(_DWORD)v12 && v4 && v2)
        {
          v13 = calloc(__count, 1uLL);
          *v4 = v13;
          if (v13)
          {
            memcpy(v13, __src, __count);
            v12 = 0;
            *v2 = __count;
          }
          else
          {
            v12 = 3758097085;
          }
        }
      }
    }
    else
    {
      v12 = 3758097090;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_aks_operation", ":", 457, "", 0, "", "");
    v12 = 3758097084;
  }
  memset_s(__src, 0x8000uLL, 0, 0x8000uLL);
  return v12;
}

uint64_t sub_21455F2A8(uint64_t a1, const void *a2, size_t a3)
{
  void *v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  if (!sub_21455FF2C((uint64_t)off_254D7AFB0, &v8, &v9))
    return 3758097090;
  if (*(_QWORD *)a1)
  {
    memset_s(*(void **)a1, *(_QWORD *)(a1 + 8), 0, *(_QWORD *)(a1 + 8));
    free(*(void **)a1);
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
  }
  v6 = calloc(a3, 1uLL);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = a3;
  if (!v6)
    return 3758604298;
  memcpy(v6, a2, a3);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)a1 + *(_QWORD *)(a1 + 8);
  if (sub_21455FF2C((uint64_t)off_254D7AFB0, &v8, &v9))
    *(_QWORD *)(a1 + 32) = v8;
  if ((sub_21455FF2C((uint64_t)off_254D7AF80, &v8, &v9) & 1) != 0
    || (result = sub_21455FF2C((uint64_t)off_254D7AF78, &v8, &v9), (_DWORD)result))
  {
    result = 0;
    *(_QWORD *)(a1 + 24) = v8;
  }
  return result;
}

uint64_t sub_21455F3DC(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v3;

  v3 = 3758604298;
  if (a1
    && (!*(_QWORD *)(a1 + 48) || !sub_214560354((uint64_t)a2))
    && (!a3 || !sub_214560354((uint64_t)a2)))
  {
    sub_214560144(a2, (unsigned __int8 *)off_254D7AF80);
    return 0;
  }
  return v3;
}

uint64_t sub_21455F464(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  void *v8;
  void **v9;
  void *__s;
  rsize_t __n;

  v7 = 3758097090;
  v8 = off_254D7AFC0;
  v9 = (void **)calloc(8uLL, 1uLL);
  *v9 = 0;
  sub_21456078C(v9, (uint64_t)off_254D7AF60, (uint64_t)v8);
  __s = 0;
  __n = 0;
  if (!sub_21455F3DC((uint64_t)a1, v9, a2))
  {
    sub_214560144(v9, (unsigned __int8 *)off_254D7AF70);
    sub_214560144(v9, (unsigned __int8 *)off_254D7AFB0);
    if (!sub_21456079C(v9, (uint64_t)off_254D7AF70, a4)
      && !sub_214560620(v9, (uint64_t)off_254D7AFB0, *a1, a1[2])
      && !sub_21456045C(v9, &__s, &__n))
    {
      v7 = sub_21455F0D0();
    }
  }
  sub_2145600CC(v9);
  memset_s(v9, 8uLL, 0, 8uLL);
  free(v9);
  if (__s)
  {
    memset_s(__s, __n, 0, __n);
    free(__s);
  }
  return v7;
}

uint64_t sub_21455F5E4(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int v7;
  char v10;
  uint64_t v11;
  int v12;
  size_t v13;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  __int128 v20;
  uint64_t v21;

  v7 = a7;
  v21 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v20 = a6;
  *((_QWORD *)&v20 + 1) = a6 + a7;
  v19 = 0;
  v18 = 0;
  sub_214560060(&v20, 4, &v19, &v18);
  if ((v10 & 1) == 0)
  {
    v18 = a6;
    v19 = v7;
  }
  v11 = 3758097090;
  v12 = sub_21455F7EC((uint64_t)a1);
  if ((v12 - 4) < 2)
  {
    v16 = 0;
    goto LABEL_8;
  }
  if ((v12 - 7) < 2)
  {
    v16 = 0;
    if (MEMORY[0x2199D178C]())
    {
LABEL_9:
      MEMORY[0x24BDAC7A8]();
      bzero((char *)&v15 - v13, v13);
      v17 = 0;
      if (sub_21455F848(a1, &v17) && !ccec_import_pub() && !ccec_verify())
      {
        if (!v16)
          return 3758604294;
        return 0;
      }
      return v11;
    }
LABEL_8:
    MEMORY[0x2199D1780]();
    goto LABEL_9;
  }
  if (v12 == 3)
  {
    v17 = 0;
    if (sub_21455F848(a1, &v17))
    {
      if (v17 == 32 && v18 && v19 == 64)
      {
        ccsha512_di();
        if (cced25519_verify())
          return 3758604294;
        return 0;
      }
    }
  }
  return v11;
}

uint64_t sub_21455F7EC(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;
  uint64_t v3;

  if (!*(_QWORD *)(a1 + 32))
    return 0;
  v2 = 0;
  v3 = 0;
  result = sub_21455FF2C((uint64_t)off_254D7AFA8, &v2, &v3);
  if ((_DWORD)result)
    return sub_21455FFF8();
  return result;
}

uint64_t sub_21455F848(_QWORD *a1, _QWORD *a2)
{
  int v4;
  uint64_t v5;
  size_t v7;
  size_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v16 = 0;
  v15 = 0;
  if (!a1[4])
    return 0;
  v13 = 0;
  v14 = 0;
  if (sub_21455FF2C((uint64_t)off_254D7AFA0, &v13, &v14))
  {
    *(_QWORD *)&v12 = v13;
    *((_QWORD *)&v12 + 1) = v13 + v14;
    sub_214560060(&v12, 4, &v16, &v15);
  }
  v4 = sub_21455F7EC((uint64_t)a1);
  if ((v4 - 7) < 2)
  {
    v5 = MEMORY[0x2199D178C]();
    goto LABEL_9;
  }
  if ((v4 - 4) <= 1)
  {
    v5 = MEMORY[0x2199D1780]();
LABEL_9:
    if (v5 && v16 == (unint64_t)(j__cczp_bitlen() + 7) >> 3)
    {
      if (v15 && !a1[8])
      {
        MEMORY[0x24BDAC7A8]();
        bzero((char *)&v11 - v7, v7);
        ccec_compact_import_pub();
        v8 = (2 * sub_21455FD6C()) | 1;
        v9 = calloc(v8, 1uLL);
        a1[8] = v9;
        a1[9] = v8;
        if (v9)
          ccec_export_pub();
        cc_clear();
      }
      v10 = a1[9];
      v15 = a1[8];
      v16 = v10;
    }
  }
  *a2 = v16;
  return v15;
}

uint64_t sub_21455FA18(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;

  result = *a1;
  *a2 = a1[1];
  return result;
}

uint64_t sub_21455FA24(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_21455FA44(a1, (uint64_t)off_254D7AFC8, a2, a3, a4, a5);
}

uint64_t sub_21455FA44(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  void **v12;
  void *__s;
  rsize_t __n;

  v11 = 3758097090;
  v12 = (void **)calloc(8uLL, 1uLL);
  *v12 = 0;
  sub_21456078C(v12, (uint64_t)off_254D7AF60, a2);
  __s = 0;
  __n = 0;
  if (a1)
  {
    if (a5)
    {
      if (a6)
      {
        if (!sub_21455F3DC((uint64_t)a1, v12, a3))
        {
          sub_214560144(v12, (unsigned __int8 *)off_254D7AFB0);
          if (!sub_214560620(v12, (uint64_t)off_254D7AFB0, *a1, a1[2])
            && !sub_21456045C(v12, &__s, &__n))
          {
            v11 = sub_21455F0D0();
          }
        }
      }
    }
  }
  sub_2145600CC(v12);
  memset_s(v12, 8uLL, 0, 8uLL);
  free(v12);
  if (__s)
  {
    memset_s(__s, __n, 0, __n);
    free(__s);
  }
  return v11;
}

uint64_t sub_21455FB8C()
{
  uint64_t result;

  if (qword_254D7B0F8 != -1)
    dispatch_once(&qword_254D7B0F8, &unk_24D1AA998);
  dispatch_sync((dispatch_queue_t)qword_254D7B100, &unk_24D1AA958);
  result = dword_254D7B0F0;
  if (!dword_254D7B0F0)
  {
    syslog(3, "failed to open connection to %s\n", "AppleKeyStore");
    return dword_254D7B0F0;
  }
  return result;
}

void sub_21455FC14()
{
  if (!dword_254D7B0F0)
    dword_254D7B0F0 = sub_21455FC78("IOService:/IOResources/AppleKeyStore", "AppleKeyStore");
}

dispatch_queue_t sub_21455FC50()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("aks-client-queue", 0);
  qword_254D7B100 = (uint64_t)result;
  return result;
}

uint64_t sub_21455FC78(char *path, const char *a2)
{
  mach_port_t v3;
  io_service_t v4;
  task_port_t *v5;
  io_object_t v6;
  kern_return_t v7;
  const __CFDictionary *v8;
  io_service_t MatchingService;
  io_object_t v10;
  uint64_t result;
  kern_return_t v12;
  io_connect_t connect;

  connect = 0;
  v3 = *MEMORY[0x24BDD8B20];
  v4 = IORegistryEntryFromPath(*MEMORY[0x24BDD8B20], path);
  v5 = (task_port_t *)MEMORY[0x24BDAEC58];
  if (!v4 || (v6 = v4, v7 = IOServiceOpen(v4, *MEMORY[0x24BDAEC58], 0, &connect), IOObjectRelease(v6), v7))
  {
    v8 = IOServiceMatching(a2);
    MatchingService = IOServiceGetMatchingService(v3, v8);
    if (MatchingService)
    {
      v10 = MatchingService;
      IOServiceOpen(MatchingService, *v5, 0, &connect);
      IOObjectRelease(v10);
    }
  }
  result = connect;
  if (connect)
  {
    v12 = IOConnectCallMethod(connect, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    result = connect;
    if (v12)
    {
      IOServiceClose(connect);
      return 0;
    }
  }
  return result;
}

unint64_t sub_21455FD6C()
{
  return (unint64_t)(cczp_bitlen() + 7) >> 3;
}

BOOL sub_21455FD8C(const void *a1, uint64_t a2, const void *a3)
{
  size_t v5;

  v5 = sub_21455FDF4((uint64_t)a1);
  return v5 == sub_21455FDF4((uint64_t)a3) && memcmp(a1, a3, v5) == 0;
}

uint64_t sub_21455FDF4(uint64_t a1)
{
  if (ccder_blob_decode_tag() && ccder_blob_decode_len())
    return a1 - a1;
  else
    return 0;
}

uint64_t sub_21455FE58()
{
  uint64_t result;

  result = ccder_blob_decode_range();
  if ((_DWORD)result)
  {
    if (ccder_blob_decode_sequence_tl())
    {
      result = ccder_blob_decode_tl();
      if ((_DWORD)result)
        return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t sub_21455FF2C(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  if (a1)
  {
    sub_21455FE58();
    if (a2)
    {
      if (a3)
      {
        *a2 = 0;
        *a3 = 0;
      }
    }
  }
  return 0;
}

BOOL sub_21455FF98(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v8;

  v8 = sub_21455FD8C(*(const void **)a5, *(_QWORD *)a5 + *(unsigned __int8 *)(*(_QWORD *)a5 + 1) + 2, a1);
  if (v8)
  {
    *(_BYTE *)(a5 + 24) = 1;
    *(_QWORD *)(a5 + 8) = a3;
    *(_QWORD *)(a5 + 16) = a3 + a4;
  }
  return !v8;
}

uint64_t sub_21455FFF8()
{
  ccder_blob_decode_tl();
  return 0;
}

double sub_214560060(__int128 *a1, uint64_t a2, _DWORD *a3, _QWORD *a4)
{
  double result;
  __int128 v8;

  v8 = *a1;
  if (ccder_blob_decode_range())
  {
    *a4 = 0;
    *a3 = 0;
    result = *(double *)&v8;
    *a1 = v8;
  }
  return result;
}

uint64_t sub_2145600CC(void **a1)
{
  void *v2;
  void *v3;

  if (!a1)
    return 0xFFFFFFFFLL;
  while (1)
  {
    v2 = *a1;
    if (!*a1)
      break;
    v3 = (void *)*((_QWORD *)v2 + 1);
    *a1 = *(void **)v2;
    if (v3)
    {
      memset_s(v3, *((_QWORD *)v2 + 2), 0, *((_QWORD *)v2 + 2));
      free(*((void **)v2 + 1));
    }
    memset_s(v2, 0x18uLL, 0, 0x18uLL);
    free(v2);
  }
  return 0;
}

uint64_t sub_214560144(_QWORD *a1, unsigned __int8 *a2)
{
  _QWORD **v2;
  uint64_t result;
  uint64_t v4;
  _QWORD *i;
  void *v6;

  if (!a1)
    return 0xFFFFFFFFLL;
  v2 = (_QWORD **)a1;
  result = (uint64_t)sub_2145601D8(a1, a2);
  if (result)
  {
    v4 = result;
    for (i = *v2; i != (_QWORD *)result; i = (_QWORD *)*i)
      v2 = (_QWORD **)i;
    *v2 = *(_QWORD **)result;
    v6 = *(void **)(result + 8);
    if (v6)
    {
      memset_s(v6, *(_QWORD *)(v4 + 16), 0, *(_QWORD *)(v4 + 16));
      free(*(void **)(v4 + 8));
    }
    memset_s((void *)v4, 0x18uLL, 0, 0x18uLL);
    free((void *)v4);
    return 0;
  }
  return result;
}

_QWORD *sub_2145601D8(_QWORD *a1, unsigned __int8 *a2)
{
  _QWORD *v2;
  const void *v5;

  if (!a1)
    return 0;
  v2 = (_QWORD *)*a1;
  if (*a1)
  {
    do
    {
      v5 = (const void *)v2[1];
      if (ccder_blob_decode_sequence_tl() && sub_21455FD8C(a2, (uint64_t)&a2[a2[1] + 2], v5))
        break;
      v2 = (_QWORD *)*v2;
    }
    while (v2);
  }
  return v2;
}

uint64_t sub_214560258(uint64_t a1)
{
  if ((ccder_blob_decode_tl() & 1) == 0)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s bad 1%s\n", "aks", "", "", "", "der_key_validate");
    return 0;
  }
  return a1;
}

uint64_t sub_214560354(uint64_t a1)
{
  if (a1)
    return sub_21455FE58() - 1;
  else
    return 4294967285;
}

uint64_t sub_214560390(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  unsigned __int8 *v8;
  uint64_t v9;

  v8 = (unsigned __int8 *)sub_214560258(a1);
  if (v8)
  {
    v9 = (uint64_t)v8;
    if (!sub_214560144(a5, v8) && !sub_214560620(a5, v9, a3, a3 + a4))
      return 1;
  }
  fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s fail%s\n", "aks", "", "", "", "_merge_dict_cb", ":", 647, "", 0, "", "");
  return 0;
}

uint64_t sub_21456045C(_QWORD *a1, _QWORD *a2, size_t *a3)
{
  uint64_t v3;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  rsize_t v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  _OWORD *v15;
  size_t v16;
  char *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v22;
  char v23;
  char *v25;
  char *v26;

  v3 = 0xFFFFFFFFLL;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        v7 = (_QWORD *)*a1;
        if (*a1)
        {
          v8 = 0;
          v9 = 0;
          v10 = 0;
          do
          {
            v10 += v7[2];
            v7 = (_QWORD *)*v7;
            v9 -= 16;
            --v8;
          }
          while (v7);
          if (v8 >= 0xF000000000000001 && (v11 = -v9, (v12 = calloc(-v9, 1uLL)) != 0))
          {
            v13 = v12;
            v14 = (_QWORD *)*a1;
            if (*a1)
            {
              v15 = v12;
              do
              {
                *v15++ = *(_OWORD *)(v14 + 1);
                v14 = (_QWORD *)*v14;
              }
              while (v14);
            }
            qsort(v12, -(uint64_t)v8, 0x10uLL, (int (__cdecl *)(const void *, const void *))sub_214560B1C);
            v16 = ccder_sizeof();
            v17 = (char *)calloc(v16, 1uLL);
            v18 = v17;
            if (v17)
            {
              v25 = v17;
              v26 = &v17[v16];
              v19 = v8 - 1;
              v20 = (uint64_t)v13 - v9 - 8;
              while (!__CFADD__(v19++, 1))
              {
                v22 = v20 - 16;
                v23 = ccder_blob_encode_body();
                v20 = v22;
                if ((v23 & 1) == 0)
                  goto LABEL_16;
              }
              if (!ccder_blob_encode_tl() || v25 != v26)
              {
LABEL_16:
                v3 = 0xFFFFFFFFLL;
                goto LABEL_20;
              }
              v3 = 0;
              *a2 = v18;
              *a3 = v16;
              v18 = 0;
            }
            else
            {
              v3 = 4294967279;
            }
LABEL_20:
            memset_s(v13, v11, 0, v11);
            free(v13);
            if (v18)
            {
              memset_s(v18, v16, 0, v16);
              free(v18);
            }
          }
          else
          {
            return 0xFFFFFFFFLL;
          }
        }
      }
    }
  }
  return v3;
}

uint64_t sub_214560620(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  size_t v6;
  char *v7;
  char *v8;
  int v9;
  char *v10;
  int v11;
  char *v12;
  _QWORD *v14;
  _QWORD *v15;
  char *v16;
  char *v17;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3 && a4)
  {
    if (sub_21455FDF4(a3) <= (unint64_t)(a4 - a3))
    {
      v6 = ccder_sizeof();
      v7 = (char *)calloc(v6, 1uLL);
      if (!v7)
        return 4294967279;
      v8 = v7;
      v16 = &v7[v6];
      if (ccder_blob_encode_body())
      {
        v9 = ccder_blob_encode_body();
        v10 = v16;
        if (!v9)
          v10 = 0;
        v17 = v10;
        v11 = ccder_blob_encode_tl();
        v12 = v17;
        if (!v11)
          v12 = 0;
        if (v12 && v12 == v8)
        {
          v14 = calloc(0x18uLL, 1uLL);
          if (v14)
          {
            v15 = v14;
            result = 0;
            v15[1] = v8;
            v15[2] = v6;
            *v15 = *a1;
            *a1 = v15;
            return result;
          }
        }
      }
      memset_s(v8, v6, 0, v6);
      free(v8);
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_21456078C(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_214560620(a1, a2, a3, a3 + *(unsigned __int8 *)(a3 + 1) + 2);
}

uint64_t sub_21456079C(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  size_t v5;
  char *v6;
  char *v7;
  int v8;
  char *v9;
  int v10;
  char *v11;
  BOOL v12;
  _QWORD *v13;
  _QWORD *v14;
  char *v15;
  char *v16;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3)
  {
    ccder_sizeof();
    v5 = ccder_sizeof();
    v6 = (char *)calloc(v5, 1uLL);
    if (v6)
    {
      v7 = v6;
      v15 = &v6[v5];
      if (!ccder_blob_encode_body() || !ccder_blob_encode_tl())
        goto LABEL_19;
      v8 = ccder_blob_encode_body();
      v9 = v15;
      if (!v8)
        v9 = 0;
      v16 = v9;
      v10 = ccder_blob_encode_tl();
      v11 = v16;
      if (!v10)
        v11 = 0;
      v12 = v11 && v11 == v7;
      if (v12 && (v13 = calloc(0x18uLL, 1uLL)) != 0)
      {
        v14 = v13;
        result = 0;
        v14[1] = v7;
        v14[2] = v5;
        *v14 = *a1;
        *a1 = v14;
      }
      else
      {
LABEL_19:
        memset_s(v7, v5, 0, v5);
        free(v7);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t sub_214560908(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  size_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  int v16;
  char *v17;
  int v18;
  char *v19;
  BOOL v20;
  _QWORD *v21;
  _QWORD *v22;
  char *v23;
  char *v24;
  _QWORD v25[2];

  v3 = a3;
  v25[1] = *MEMORY[0x24BDAC8D0];
  v5 = HIBYTE(a3);
  if ((HIBYTE(a3) + 1) > 1u)
  {
    v10 = 8;
  }
  else
  {
    v6 = 9;
    v7 = 48;
    v8 = 1;
    while ((unint64_t)(v6 - 2) >= 2)
    {
      v9 = a3 >> v7;
      --v6;
      v7 -= 8;
      if ((_DWORD)v5 != v9)
      {
        v8 = v6 - 1;
        goto LABEL_8;
      }
    }
    v6 = 2;
LABEL_8:
    if ((((a3 >> (8 * v8 - 8)) ^ v5) & 0x80) != 0)
      v10 = v6;
    else
      v10 = v8;
  }
  v25[0] = 0;
  result = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    ccder_sizeof();
    v12 = ccder_sizeof();
    v13 = (char *)calloc(v12, 1uLL);
    if (v13)
    {
      v14 = v13;
      v15 = v10;
      do
      {
        *((_BYTE *)v25 + v15 - 1) = v3;
        v3 >>= 8;
        --v15;
      }
      while (v15);
      v23 = &v13[v12];
      if ((ccder_blob_encode_body() & 1) == 0 || !ccder_blob_encode_tl())
        goto LABEL_30;
      v16 = ccder_blob_encode_body();
      v17 = v23;
      if (!v16)
        v17 = 0;
      v24 = v17;
      v18 = ccder_blob_encode_tl();
      v19 = v24;
      if (!v18)
        v19 = 0;
      v20 = v19 && v19 == v14;
      if (v20 && (v21 = calloc(0x18uLL, 1uLL)) != 0)
      {
        v22 = v21;
        result = 0;
        v22[1] = v14;
        v22[2] = v12;
        *v22 = *a1;
        *a1 = v22;
      }
      else
      {
LABEL_30:
        memset_s(v14, v12, 0, v12);
        free(v14);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t sub_214560B1C(const void **a1, void **a2)
{
  int v2;
  void *__s2;
  const void *v5;

  v5 = *a1;
  __s2 = *a2;
  if (!ccder_blob_decode_sequence_tl()
    || !ccder_blob_decode_sequence_tl()
    || !ccder_blob_decode_tag()
    || !ccder_blob_decode_len()
    || !v5
    || !ccder_blob_decode_tag()
    || !ccder_blob_decode_len()
    || !__s2)
  {
    return 4294967293;
  }
  v2 = memcmp(v5, __s2, 0);
  if (v2 > 0)
    return 1;
  else
    return ((v2 < 0) << 31 >> 31);
}

uint64_t sub_214560C44(__CFArray **a1)
{
  uint64_t v1;
  __CFDictionary *v3;
  uint64_t MatchingServices;
  const __CFAllocator *v5;
  io_object_t v6;
  io_registry_entry_t v7;
  const __CFBoolean *CFProperty;
  const __CFBoolean *v9;
  __CFDictionary *Mutable;
  kern_return_t RegistryEntryID;
  CFNumberRef v12;
  CFNumberRef v13;
  CFTypeRef v14;
  int v15;
  int v16;
  const __CFString *v17;
  CFTypeRef v18;
  CFTypeRef v19;
  CFTypeRef v20;
  const void *v21;
  CFTypeRef v22;
  __CFDictionary *v23;
  __CFArray **v25;
  __CFArray *theArray;
  const __CFAllocator *v27;
  const __CFBoolean *cf;
  io_iterator_t existing;
  uint64_t entryID;
  int valuePtr;

  v1 = 3758097090;
  if (a1)
  {
    existing = 0;
    v3 = IOServiceMatching("AppleAuthCP");
    CFDictionarySetValue(v3, CFSTR("InternalComponent"), (const void *)*MEMORY[0x24BDBD270]);
    MatchingServices = IOServiceGetMatchingServices(*MEMORY[0x24BDD8B20], v3, &existing);
    if ((_DWORD)MatchingServices)
    {
      return MatchingServices;
    }
    else
    {
      v25 = a1;
      v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      theArray = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
      v6 = IOIteratorNext(existing);
      if (v6)
      {
        v7 = v6;
        v27 = v5;
        do
        {
          CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v7, CFSTR("InternalComponent"), v5, 0);
          if (!CFProperty)
          {
            v23 = 0;
LABEL_38:
            v16 = -536870206;
            goto LABEL_40;
          }
          v9 = CFProperty;
          valuePtr = 0;
          entryID = 0;
          if (!CFBooleanGetValue(CFProperty))
          {
            v23 = 0;
            Mutable = 0;
            v22 = v9;
            v16 = -536870206;
            goto LABEL_34;
          }
          Mutable = CFDictionaryCreateMutable(v5, 5, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
          if (!Mutable)
            goto LABEL_45;
          RegistryEntryID = IORegistryEntryGetRegistryEntryID(v7, &entryID);
          if (RegistryEntryID)
          {
            v16 = RegistryEntryID;
            v23 = 0;
LABEL_49:
            v22 = v9;
LABEL_34:
            CFRelease(v22);
            goto LABEL_35;
          }
          v12 = CFNumberCreate(v5, kCFNumberSInt64Type, &entryID);
          if (!v12)
          {
LABEL_45:
            v23 = 0;
            v16 = -536870181;
            goto LABEL_49;
          }
          v13 = v12;
          CFDictionaryAddValue(Mutable, CFSTR("IORegistryEntryID"), v12);
          v14 = IORegistryEntryCreateCFProperty(v7, CFSTR("flags"), v5, 0);
          if (v14)
            CFDictionaryAddValue(Mutable, CFSTR("flags"), v14);
          CFNumberGetValue((CFNumberRef)v14, kCFNumberSInt32Type, &valuePtr);
          v15 = BYTE2(valuePtr) << 16;
          v16 = -536870201;
          cf = v9;
          if (v15 == 0x10000)
          {
            v17 = CFSTR("Battery");
          }
          else
          {
            if (v15 != 196608)
            {
              v23 = 0;
              v19 = 0;
              v21 = 0;
              v22 = 0;
              v18 = 0;
              goto LABEL_25;
            }
            v17 = CFSTR("TouchController");
          }
          CFDictionaryAddValue(Mutable, CFSTR("ComponentName"), v17);
          v18 = IORegistryEntryCreateCFProperty(v7, CFSTR("authErrorDescription"), v5, 0);
          if (v18)
          {
            CFDictionaryAddValue(Mutable, CFSTR("authErrorDescription"), v18);
            v19 = IORegistryEntryCreateCFProperty(v7, CFSTR("AuthPassed"), v5, 0);
            if (v19)
              CFDictionaryAddValue(Mutable, CFSTR("AuthPassed"), v19);
            v20 = IORegistryEntryCreateCFProperty(v7, CFSTR("isTrusted"), v5, 0);
            v21 = v20;
            if (v20)
              CFDictionaryAddValue(Mutable, CFSTR("isTrusted"), v20);
            v22 = IORegistryEntryCreateCFProperty(v7, CFSTR("isTrustedForUI"), v5, 0);
            if (v22)
              CFDictionaryAddValue(Mutable, CFSTR("isTrustedForUI"), v22);
            v16 = 0;
            v23 = Mutable;
          }
          else
          {
            v23 = 0;
            v19 = 0;
            v21 = 0;
            v22 = 0;
          }
LABEL_25:
          CFRelease(cf);
          CFRelease(v13);
          if (v14)
            CFRelease(v14);
          if (v18)
            CFRelease(v18);
          if (v19)
            CFRelease(v19);
          if (v21)
            CFRelease(v21);
          if (v22)
            goto LABEL_34;
LABEL_35:
          if (Mutable)
          {
            v5 = v27;
            if (!v16)
              goto LABEL_40;
            CFRelease(Mutable);
            goto LABEL_38;
          }
          v5 = v27;
LABEL_40:
          IOObjectRelease(v7);
          if (v23 && !v16)
          {
            CFArrayAppendValue(theArray, v23);
            CFRelease(v23);
          }
          v7 = IOIteratorNext(existing);
        }
        while (v7);
      }
      IOObjectRelease(existing);
      v1 = 0;
      *v25 = theArray;
    }
  }
  return v1;
}

uint64_t sub_214561048(uint64_t a1)
{
  uint64_t result;

  result = sub_214561084(a1 + 88, (uint64_t)&off_24D1AA9B8);
  if (!(_DWORD)result)
    *(_QWORD *)(a1 + 240) &= 0xFFFFFFFFFFF3FFFFLL;
  return result;
}

uint64_t sub_214561084(uint64_t a1, uint64_t a2)
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

uint64_t sub_2145610AC(uint64_t a1, const void *a2, size_t a3)
{
  size_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  if (v3 == a3)
    return memcmp(*(const void **)a1, a2, a3);
  if (v3 > a3)
    return 0xFFFFFFFFLL;
  return 1;
}

uint64_t sub_2145610CC(unint64_t *a1, unint64_t *a2)
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

uint64_t sub_21456125C()
{
  return ccder_blob_decode_tl();
}

uint64_t sub_2145612BC(unint64_t a1, unint64_t a2, _OWORD *a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  unint64_t v11;
  __int128 v12;
  uint64_t result;
  unint64_t v15;
  unint64_t v16;
  _OWORD v17[19];
  uint64_t v18;

  v6 = 0;
  v18 = *MEMORY[0x24BDAC8D0];
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
      result = sub_214562F5C((unint64_t *)v17, &v15);
      if ((_DWORD)result)
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
    result = 0;
    if (a5)
      *a5 = v6;
  }
  return result;
}

uint64_t sub_2145613D8(uint64_t a1, unint64_t *a2, const void *a3, size_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
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
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  BOOL v39;
  int v40;
  int v41;
  unint64_t v43;
  unint64_t v51;
  unint64_t v52;
  unsigned __int8 v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  char v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69;
  _OWORD v70[10];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v68 = 0;
  v69 = 0;
  v66 = 0xAAAAAAAAAAAAAAAALL;
  v67 = 0xAAAAAAAAAAAAAAAALL;
  v4 = *a2;
  v5 = a2[1];
  if (*a2 > v5)
    goto LABEL_186;
  v10 = 720915;
  v66 = *a2;
  v67 = v5;
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
  result = ccder_blob_decode_tl();
  if (!(_DWORD)result)
    return v10;
  v12 = v69;
  v13 = v66;
  v14 = v69 + v66 - v4;
  if (__CFADD__(v69, v66 - v4))
    goto LABEL_188;
  if (v14 > v5 - v4)
    goto LABEL_186;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v14;
  v64 = 0xAAAAAAAAAAAAAAAALL;
  v65 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v13, v12))
    goto LABEL_187;
  v15 = v13 + v12;
  if (v13 > v15 || v15 > v67)
    goto LABEL_186;
  v64 = v13;
  v65 = v15;
  v62 = v13;
  v63 = v15;
  if (ccder_blob_decode_tl())
  {
    if (__CFADD__(v62, v68))
      goto LABEL_187;
    v16 = 720916;
    if (ccder_blob_decode_uint64() && v62 == v62 + v68)
    {
      if (v62 + v68 > v63)
        goto LABEL_186;
      v64 = v62 + v68;
      v65 = v63;
      goto LABEL_14;
    }
    return v16;
  }
LABEL_14:
  if (!ccder_blob_decode_tl())
    return 720917;
  v18 = v64;
  v17 = v65;
  if (v65 < v64)
    goto LABEL_186;
  v19 = v68;
  if (v68 > v65 - v64)
    goto LABEL_186;
  *(_QWORD *)(a1 + 136) = v64;
  *(_QWORD *)(a1 + 144) = v19;
  if (__CFADD__(v18, v19))
    goto LABEL_187;
  v20 = v18 + v19;
  if (v18 > v20 || v20 > v17)
    goto LABEL_186;
  v64 = v20;
  if (!sub_2145610CC(&v64, (unint64_t *)(a1 + 152)))
    return 720918;
  if (!ccder_blob_decode_tl())
    return 720919;
  v22 = v64;
  v21 = v65;
  if (v65 < v64)
    goto LABEL_186;
  v23 = v68;
  if (v68 > v65 - v64)
    goto LABEL_186;
  *(_QWORD *)(a1 + 120) = v64;
  *(_QWORD *)(a1 + 128) = v23;
  if (__CFADD__(v22, v23))
    goto LABEL_187;
  v24 = v22 + v23;
  if (v22 > v24 || v24 > v21)
    goto LABEL_186;
  v64 = v24;
  if (!ccder_blob_decode_tl())
    return 720920;
  v26 = v64;
  v25 = v65;
  if (v65 < v64)
    goto LABEL_186;
  v27 = v68;
  if (v68 > v65 - v64)
    goto LABEL_186;
  *(_QWORD *)(a1 + 72) = v64;
  *(_QWORD *)(a1 + 80) = v27;
  if (__CFADD__(v26, v27))
    goto LABEL_187;
  v28 = v26 + v27;
  if (v26 > v28 || v28 > v25)
    goto LABEL_186;
  v64 = v28;
  if (!ccder_blob_decode_tl())
    return 720921;
  v29 = v64;
  v30 = v65;
  if (v65 < v64)
    goto LABEL_186;
  v31 = v68;
  if (v68 > v65 - v64)
    goto LABEL_186;
  *(_QWORD *)(a1 + 104) = v64;
  *(_QWORD *)(a1 + 112) = v31;
  if (__CFADD__(v29, v31))
    goto LABEL_187;
  v32 = v29 + v31;
  if (v29 > v29 + v31 || v32 > v30)
    goto LABEL_186;
  v64 = v29 + v31;
  result = ccder_blob_decode_tl();
  if (!(_DWORD)result)
    return 720922;
  v33 = v64;
  v34 = v68;
  v35 = v64 - v32 + v68;
  if (!__CFADD__(v64 - v32, v68))
  {
    if (v35 > v30 - v32)
      goto LABEL_186;
    *(_QWORD *)(a1 + 88) = v32;
    *(_QWORD *)(a1 + 96) = v35;
    if (__CFADD__(v33, v34))
      goto LABEL_187;
    v36 = v33 + v34;
    if (v33 > v36 || v36 > v65)
      goto LABEL_186;
    v63 = v65;
    v64 = v36;
    v62 = v36;
    if ((ccder_blob_decode_tl() & 1) != 0)
      return 720923;
    if (v64 > v65)
      goto LABEL_186;
    v62 = v64;
    v63 = v65;
    if ((ccder_blob_decode_tl() & 1) != 0)
      return 720924;
    if (v64 > v65)
      goto LABEL_186;
    v62 = v64;
    v63 = v65;
    if (ccder_blob_decode_tl())
    {
      v60 = 0xAAAAAAAAAAAAAAAALL;
      v61 = 0xAAAAAAAAAAAAAAAALL;
      if (__CFADD__(v62, v68))
        goto LABEL_187;
      if (v62 > v62 + v68 || v62 + v68 > v63)
        goto LABEL_186;
      v60 = v62;
      v61 = v62 + v68;
      if (!ccder_blob_decode_tl() || !v68)
        return 720925;
      v37 = v60;
      if (__CFADD__(v60, v68))
LABEL_187:
        __break(0x5513u);
      v38 = v60 + v68;
      if (v60 > v60 + v68 || v38 > v61)
        goto LABEL_186;
      v61 = v60 + v68;
      *(_BYTE *)(a1 + 266) = 0;
      memset(&v70[2], 0, 128);
      if (a3)
        v39 = a4 == 0;
      else
        v39 = 1;
      v40 = !v39;
      memset(v70, 0, 32);
      if (v37 < v38)
      {
        v53 = 0;
        v41 = 0;
        do
        {
          v58 = 0xAAAAAAAAAAAAAAAALL;
          v59 = 0xAAAAAAAAAAAAAAAALL;
          v57 = 0;
          v56 = 0;
          if ((ccder_blob_decode_tl() & 1) == 0)
            return 720926;
          v54 = 0xAAAAAAAAAAAAAAAALL;
          v55 = 0xAAAAAAAAAAAAAAAALL;
          if (__CFADD__(v60, v56))
            goto LABEL_187;
          if (v60 > v60 + v56 || v60 + v56 > v61)
            goto LABEL_186;
          v54 = v60;
          v55 = v60 + v56;
          if (!ccder_blob_decode_tl())
            return 720927;
          if (v55 < v54 || v68 > v55 - v54)
            goto LABEL_186;
          v58 = v54;
          v59 = v68;
          if (__CFADD__(v54, v68))
            goto LABEL_187;
          if (v54 > v54 + v68 || v54 + v68 > v55)
            goto LABEL_186;
          v54 += v68;
          if (!sub_214561D90(&v54, 1, &v57))
            return 720928;
          if (!ccder_blob_decode_tl())
            return 720929;
          if (__CFADD__(v54, v68))
            goto LABEL_187;
          if (v55 != v54 + v68)
            return 720929;
          if (v40 && !sub_2145610AC((uint64_t)&v58, a3, a4))
          {
            if (v55 < v54)
              goto LABEL_186;
            v43 = v68;
            if (v68 > v55 - v54)
              goto LABEL_186;
            *(_QWORD *)(a1 + 248) = v54;
            *(_QWORD *)(a1 + 256) = v43;
          }
          if (v59 == 3)
          {
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 15)
            {
              v16 = 720930;
              if ((v41 & 1) != 0 || (sub_214561EA4() & 1) == 0)
                return v16;
              v41 |= 1u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 19)
            {
              v16 = 720931;
              if ((v41 & 2) != 0 || (sub_214561F70(&v54, (_QWORD *)(a1 + 200), (_BYTE *)(a1 + 265)) & 1) == 0)
                return v16;
              v41 |= 2u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 35)
            {
              v16 = 720932;
              if ((v41 & 4) != 0
                || (sub_21456203C(&v54, (unint64_t *)(a1 + 168), (_QWORD *)(a1 + 176)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 4u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 14)
            {
              v16 = 720933;
              if ((v41 & 8) != 0
                || (sub_214562160(&v54, (unint64_t *)(a1 + 184), (_QWORD *)(a1 + 192)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 8u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 37)
            {
              v16 = 720934;
              if ((v41 & 0x10) != 0
                || (sub_214562220(&v54, (unint64_t *)(a1 + 208), (_QWORD *)(a1 + 216)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 0x10u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 17)
            {
              v16 = 720935;
              if ((v41 & 0x20) != 0
                || (sub_21456232C(&v54, (unint64_t *)(a1 + 224), (_QWORD *)(a1 + 232)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 0x20u;
              goto LABEL_155;
            }
          }
          else if (v59 >= 8 && *(_DWORD *)v58 == -2042067414 && *(_DWORD *)(v58 + 3) == 1684273030)
          {
            v16 = 720936;
            if (!sub_2145623FC((uint64_t)&v58, (uint64_t)v70, v53))
              return v16;
            result = sub_214562484((uint64_t)&v54, v58, v59, (uint64_t *)(a1 + 240), (unint64_t *)(a1 + 248), v40);
            if (!(_DWORD)result)
              return v16;
            if (v53 == 0xFF)
              goto LABEL_189;
            ++v53;
            goto LABEL_155;
          }
          if (__CFADD__(v54, v68))
            goto LABEL_187;
          if (v54 > v54 + v68 || v54 + v68 > v55)
            goto LABEL_186;
          v54 += v68;
          if (v57)
            *(_BYTE *)(a1 + 266) = 1;
LABEL_155:
          if (v54 != v55)
            return 720926;
          if (__CFADD__(v60, v56))
            goto LABEL_187;
          v37 = v60 + v56;
          if (v60 > v60 + v56)
            goto LABEL_186;
          v38 = v61;
          if (v37 > v61)
            goto LABEL_186;
          v60 += v56;
        }
        while (v37 < v61);
      }
      if (v37 != v38)
        return 720925;
      if (v37 > v65 || v64 > v37)
        goto LABEL_186;
      v64 = v37;
    }
    if (*(_QWORD *)(a1 + 32) < 3uLL)
    {
      v16 = 720915;
      if (v64 != v65)
        return v16;
LABEL_170:
      if (__CFADD__(v66, v69))
        goto LABEL_187;
      if (v66 > v66 + v69 || v66 + v69 > v67)
        goto LABEL_186;
      v66 += v69;
      if (!sub_2145610CC(&v66, (unint64_t *)(a1 + 40)))
        return 720937;
      *(_QWORD *)&v70[0] = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v70[0] + 1) = 0xAAAAAAAAAAAAAAAALL;
      v60 = 0;
      result = ccder_blob_decode_bitstring();
      if (!(_DWORD)result)
        return 720938;
      if (v60 < 0xFFFFFFFFFFFFFFF9)
      {
        if (*((_QWORD *)&v70[0] + 1) >= *(_QWORD *)&v70[0])
        {
          v51 = (v60 + 7) >> 3;
          if (v51 <= *((_QWORD *)&v70[0] + 1) - *(_QWORD *)&v70[0])
          {
            *(_QWORD *)(a1 + 56) = *(_QWORD *)&v70[0];
            *(_QWORD *)(a1 + 64) = v51;
            v52 = v67;
            if (v66 <= v67)
            {
              v16 = 0;
              *a2 = v66;
              a2[1] = v52;
              return v16;
            }
          }
        }
        goto LABEL_186;
      }
      goto LABEL_188;
    }
    if (v65 <= a2[1] && *a2 <= v65)
    {
      *a2 = v65;
      goto LABEL_170;
    }
LABEL_186:
    __break(0x5519u);
    goto LABEL_187;
  }
LABEL_188:
  __break(0x5500u);
LABEL_189:
  __break(0x5507u);
  return result;
}

uint64_t sub_214561D90(_QWORD *a1, int a2, _BYTE *a3)
{
  if (*a1 > a1[1])
    __break(0x5519u);
  if ((ccder_blob_decode_tl() & 1) != 0 || !a2)
    return 0;
  if (a3)
    *a3 = 0;
  return 1;
}

uint64_t sub_214561EA4()
{
  uint64_t result;

  result = ccder_blob_decode_bitstring();
  if ((_DWORD)result)
    return 0;
  return result;
}

uint64_t sub_214561F70(_QWORD *a1, _QWORD *a2, _BYTE *a3)
{
  uint64_t result;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    result = sub_214561D90(a1, 1, a3);
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

uint64_t sub_21456203C(unint64_t *a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_214562160(unint64_t *a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_214562220(unint64_t *a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_21456232C(unint64_t *a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_2145623FC(uint64_t result, uint64_t a2, unsigned int a3)
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
    result = sub_214561084((uint64_t)v5, a2 + 16 * v6);
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

uint64_t sub_214562484(uint64_t result, unint64_t a2, unint64_t a3, uint64_t *a4, unint64_t *a5, int a6)
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

  v57 = *MEMORY[0x24BDAC8D0];
  if (a6)
    a5 = 0;
  if (a3 == 11)
  {
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x10901066463F786)
    {
      result = sub_21456125C();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x400000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x10301066463F786)
    {
      result = sub_21456125C();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x200;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x10601066463F786)
    {
      result = sub_21456125C();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x800;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x11801066463F786)
    {
      result = sub_21456125C();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x2000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x12401066463F786)
    {
      result = sub_21456125C();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x100000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x11901066463F786)
    {
      result = sub_21456125C();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x4000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x21901066463F786)
    {
      result = sub_21456125C();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x8000;
      goto LABEL_261;
    }
LABEL_157:
    v44 = 0;
LABEL_158:
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 27)
      return sub_214563584(result, a2, a3, a4, a5);
    if (!v44)
      goto LABEL_232;
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 832)
    {
      result = sub_21456125C();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x400000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3586)
    {
      result = sub_21456125C();
      if (!(_DWORD)result)
        return result;
      v54 = *a4;
      v55 = 37748736;
    }
    else
    {
      if (*(_QWORD *)a2 != 0x66463F78648862ALL || *(_WORD *)(a2 + 8) != 4354)
      {
        if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 327)
          return (uint64_t)sub_2145637A0((unint64_t *)result, a4, a5);
        if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3841)
        {
          v52 = *(_QWORD *)result;
          v51 = *(_QWORD *)(result + 8);
          if (a5)
          {
            if (v52 > v51)
              goto LABEL_265;
            *a5 = v52;
            a5[1] = v51 - v52;
          }
          *a4 |= 0x80000000uLL;
LABEL_233:
          if (v52 <= v51)
          {
            *(_QWORD *)result = v51;
            return 1;
          }
LABEL_265:
          __break(0x5519u);
          return result;
        }
        goto LABEL_232;
      }
      result = sub_21456125C();
      if (!(_DWORD)result)
        return result;
      v54 = *a4;
      v55 = 0x8004000000;
    }
LABEL_201:
    v24 = v54 | v55;
    goto LABEL_261;
  }
  if (a3 == 10)
  {
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 5122)
    {
      result = sub_21456125C();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x100000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 258)
    {
      result = sub_21456125C();
      if (!(_DWORD)result)
        return result;
      v54 = *a4;
      v55 = 0x58600003F0D0;
      goto LABEL_201;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1538)
      goto LABEL_203;
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 4610)
    {
      result = sub_21456125C();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0xF00;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3073)
    {
      result = sub_21456125C();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x10;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1793)
    {
      result = sub_21456125C();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x20000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3329)
    {
LABEL_203:
      result = sub_21456125C();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x20;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 2305)
    {
      result = sub_21456125C();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x40;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 513)
    {
      result = sub_21456125C();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x80;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1025)
    {
      result = sub_21456125C();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x10000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 769)
    {
      result = sub_21456125C();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x100;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1537)
    {
      result = sub_21456125C();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x400;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 6145)
    {
      result = sub_21456125C();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x1000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 9217)
    {
      result = sub_21456125C();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x80000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8193)
    {
      result = sub_21456125C();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x2000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8705)
    {
      result = sub_21456125C();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x4000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 315)
      return sub_21456331C((unint64_t *)result, a4, a5);
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3074)
    {
      result = sub_21456125C();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x300000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 304)
      return sub_2145633FC();
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
    return sub_214562F68((unint64_t *)result, a4, a5);
  if (*(_QWORD *)a2 != 0x66463F78648862ALL || *(_BYTE *)(a2 + 8) != 49)
  {
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 44)
      return sub_2145630A0((unint64_t *)result, a4, a5);
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 36)
      return sub_214563234((unint64_t *)result);
    if (*(_QWORD *)a2 != 0x66463F78648862ALL || *(_BYTE *)(a2 + 8) != 22)
    {
      if (*(_QWORD *)a2 == 0xC6463F78648862ALL && *(_BYTE *)(a2 + 8) == 19)
      {
        result = sub_21456125C();
        if (!(_DWORD)result)
          return result;
        v24 = *a4 | 0x8000000000;
        goto LABEL_261;
      }
      if (*(_QWORD *)a2 != 0xA6463F78648862ALL || *(_BYTE *)(a2 + 8) != 1)
      {
        if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 29)
        {
          result = sub_21456125C();
          if (!(_DWORD)result)
            return result;
          v24 = *a4 | 0x2000000;
        }
        else
        {
          if (*(_QWORD *)a2 != 0xC6463F78648862ALL || *(_BYTE *)(a2 + 8) != 14)
          {
            if (*(_QWORD *)a2 == 0x86463F78648862ALL && *(_BYTE *)(a2 + 8) == 3)
              return sub_214563650((unint64_t *)result, a4, a5);
            goto LABEL_232;
          }
          result = sub_21456125C();
          if (!(_DWORD)result)
            return result;
          v24 = *a4 | 0x4000000;
        }
LABEL_261:
        *a4 = v24;
        return 1;
      }
      *a4 |= 0x1000000uLL;
LABEL_232:
      v52 = *(_QWORD *)result;
      v51 = *(_QWORD *)(result + 8);
      goto LABEL_233;
    }
    result = sub_21456125C();
    if (!(_DWORD)result)
      return result;
    v54 = *a4;
    v55 = 1048584;
    goto LABEL_201;
  }
  v56 = 0;
  result = sub_214561D90((_QWORD *)result, 0, &v56);
  if ((_DWORD)result)
  {
    v53 = 0x10000080002;
    if (!v56)
      v53 = 0x20000040001;
    *a4 |= v53;
  }
  return result;
}

uint64_t sub_214562E3C(unint64_t *a1, unint64_t *a2, const void *a3, size_t a4)
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t result;
  unint64_t v13;

  v8 = 720939;
  v9 = *a2;
  v10 = a2[1];
  if (!ccder_blob_decode_tl())
    return v8;
  v11 = *a2;
  result = sub_2145613D8((uint64_t)a1, a2, a3, a4);
  v8 = result;
  if ((_DWORD)result)
    return v8;
  if (v11 >= 0x5555555555555556)
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5500u);
    goto LABEL_12;
  }
  v8 = 720939;
  if (*a2 != v11 - 0x5555555555555556)
    return v8;
  v13 = v11 - v9 - 0x5555555555555556;
  if (v11 - v9 >= 0x5555555555555556)
    goto LABEL_11;
  if (v10 >= v9 && v13 <= v10 - v9)
  {
    *a1 = v9;
    a1[1] = v13;
    sub_214561048((uint64_t)a1);
    return 0;
  }
LABEL_12:
  __break(0x5519u);
  return result;
}

uint64_t sub_214562F5C(unint64_t *a1, unint64_t *a2)
{
  return sub_214562E3C(a1, a2, 0, 0);
}

BOOL sub_214562F68(unint64_t *a1, _QWORD *a2, unint64_t *a3)
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

uint64_t sub_2145630A0(unint64_t *a1, _QWORD *a2, unint64_t *a3)
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

uint64_t sub_214563234(unint64_t *a1)
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

uint64_t sub_21456331C(unint64_t *a1, _QWORD *a2, unint64_t *a3)
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

uint64_t sub_2145633FC()
{
  ccder_blob_decode_tl();
  return 0;
}

uint64_t sub_214563584(uint64_t a1, unint64_t a2, uint64_t a3, _QWORD *a4, unint64_t *a5)
{
  uint64_t result;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  BOOL v13;
  _BOOL4 v14;
  int v15;

  result = sub_21456125C();
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

uint64_t sub_214563650(unint64_t *a1, _QWORD *a2, unint64_t *a3)
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

unint64_t *sub_2145637A0(unint64_t *result, _QWORD *a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v4 = *result;
  v3 = result[1];
  v5 = v3 - *result;
  if (v5 != 32)
    return (unint64_t *)(v5 == 32);
  if (a3)
  {
    if (v4 > v3)
    {
LABEL_12:
      __break(0x5519u);
      goto LABEL_13;
    }
    *a3 = v4;
    a3[1] = 32;
  }
  *a2 |= 0xC00000000uLL;
  if (v4 < 0xFFFFFFFFFFFFFFE0)
  {
    v6 = v4 + 32;
    if (v4 + 32 <= v3 && v4 <= v6)
    {
      *result = v6;
      return (unint64_t *)(v5 == 32);
    }
    goto LABEL_12;
  }
LABEL_13:
  __break(0x5513u);
  return result;
}

uint64_t sub_214563800(const char *a1, size_t a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_log_type_t v10;
  NSObject *v11;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  size_t v16;
  NSObject *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  size_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (qword_254D7B110 != -1)
    dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
  v4 = MEMORY[0x24BDACB70];
  if (qword_254D7B080)
    v5 = qword_254D7B080;
  else
    v5 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v19 = a1;
    v20 = 2048;
    v21 = a2;
    _os_log_impl(&dword_214503000, v5, OS_LOG_TYPE_DEFAULT, "verifyFDRData %p %zu\n", buf, 0x16u);
  }
  if (!a1)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "data", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 179);
    if (qword_254D7B110 != -1)
      dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
    if (qword_254D7B088)
      v13 = qword_254D7B088;
    else
      v13 = v4;
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_46;
    *(_DWORD *)buf = 136316162;
    v19 = "data";
    v20 = 2048;
    v21 = 0;
    v22 = 2080;
    v23 = "";
    v24 = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v26 = 1024;
    v27 = 179;
    goto LABEL_45;
  }
  if (!a2)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dataLength > 0", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 180);
    if (qword_254D7B110 != -1)
      dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
    if (qword_254D7B088)
      v13 = qword_254D7B088;
    else
      v13 = v4;
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_46;
    *(_DWORD *)buf = 136316162;
    v19 = "dataLength > 0";
    v20 = 2048;
    v21 = 0;
    v22 = 2080;
    v23 = "";
    v24 = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v26 = 1024;
    v27 = 180;
LABEL_45:
    _os_log_impl(&dword_214503000, v13, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_46:
    v6 = 258;
    goto LABEL_12;
  }
  v6 = sub_214563DE4();
  if ((_DWORD)v6)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v6, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 183);
    if (qword_254D7B110 != -1)
      dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
    if (qword_254D7B088)
      v14 = qword_254D7B088;
    else
      v14 = v4;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v19 = "err == 0 ";
      v20 = 2048;
      v21 = (int)v6;
      v22 = 2080;
      v23 = "";
      v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v26 = 1024;
      v27 = 183;
      _os_log_impl(&dword_214503000, v14, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    v7 = sub_2145640A0(dword_254D7B108, 10, 0, a1, a2, 0, 0);
    if ((_DWORD)v7)
    {
      v15 = v7;
      v16 = (int)v7;
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v7, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 186);
      if (qword_254D7B110 != -1)
        dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
      if (qword_254D7B088)
        v17 = qword_254D7B088;
      else
        v17 = v4;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v19 = "err == 0 ";
        v20 = 2048;
        v21 = v16;
        v22 = 2080;
        v23 = "";
        v24 = 2080;
        v25 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        v26 = 1024;
        v27 = 186;
        _os_log_impl(&dword_214503000, v17, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v6 = v15;
    }
  }
LABEL_12:
  if (dword_254D7B108)
  {
    IOServiceClose(dword_254D7B108);
    dword_254D7B108 = 0;
  }
  if ((_DWORD)v6)
  {
    if (qword_254D7B110 != -1)
      dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
    if (qword_254D7B080)
      v8 = qword_254D7B080;
    else
      v8 = v4;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v19) = v6;
      v9 = v8;
      v10 = OS_LOG_TYPE_ERROR;
LABEL_29:
      _os_log_impl(&dword_214503000, v9, v10, "verifyFDRData -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (qword_254D7B110 != -1)
      dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
    if (qword_254D7B080)
      v11 = qword_254D7B080;
    else
      v11 = v4;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v19) = 0;
      v9 = v11;
      v10 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_29;
    }
  }
  return v6;
}

uint64_t sub_214563DE4()
{
  mach_port_t v0;
  const __CFDictionary *v1;
  io_service_t MatchingService;
  io_object_t v3;
  uint64_t v4;
  NSObject *v6;
  NSObject *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDD8B20];
  v1 = IOServiceMatching("ApplePearlSEPDriver");
  MatchingService = IOServiceGetMatchingService(v0, v1);
  if (MatchingService)
  {
    v3 = MatchingService;
    v4 = IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], 0, (io_connect_t *)&dword_254D7B108);
    if ((_DWORD)v4)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 129);
      if (qword_254D7B110 != -1)
        dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
      if (qword_254D7B088)
        v7 = qword_254D7B088;
      else
        v7 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v9 = "err == 0 ";
        v10 = 2048;
        v11 = (int)v4;
        v12 = 2080;
        v13 = "";
        v14 = 2080;
        v15 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        v16 = 1024;
        v17 = 129;
        _os_log_impl(&dword_214503000, v7, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    IOObjectRelease(v3);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "service", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 126);
    if (qword_254D7B110 != -1)
      dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
    v4 = 3758097084;
    if (qword_254D7B088)
      v6 = qword_254D7B088;
    else
      v6 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v9 = "service";
      v10 = 2048;
      v11 = 0;
      v12 = 2080;
      v13 = "";
      v14 = 2080;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v16 = 1024;
      v17 = 126;
      _os_log_impl(&dword_214503000, v6, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  return v4;
}

uint64_t sub_2145640A0(mach_port_t a1, __int16 a2, __int16 a3, const void *a4, size_t a5, void *a6, _QWORD *a7)
{
  size_t v14;
  _WORD *v15;
  void *v16;
  uint64_t v17;
  NSObject *v19;
  _BYTE outputStructCnt[12];
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v14 = a5 + 8;
  v15 = calloc(a5 + 8, 1uLL);
  if (v15)
  {
    v16 = v15;
    *v15 = 21072;
    v15[1] = a2;
    v15[2] = 1;
    v15[3] = a3;
    if (a5)
      memmove(v15 + 4, a4, a5);
    if (a7)
    {
      *(_QWORD *)outputStructCnt = *a7;
      v17 = IOConnectCallStructMethod(a1, 0, v16, v14, a6, (size_t *)outputStructCnt);
      *a7 = *(_QWORD *)outputStructCnt;
    }
    else
    {
      *(_QWORD *)outputStructCnt = 0;
      v17 = IOConnectCallStructMethod(a1, 0, v16, v14, a6, (size_t *)outputStructCnt);
    }
    free(v16);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "cmd", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 99);
    if (qword_254D7B110 != -1)
      dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
    if (qword_254D7B088)
      v19 = qword_254D7B088;
    else
      v19 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)outputStructCnt = 136316162;
      *(_QWORD *)&outputStructCnt[4] = "cmd";
      v21 = 2048;
      v22 = 0;
      v23 = 2080;
      v24 = "";
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v27 = 1024;
      v28 = 99;
      _os_log_impl(&dword_214503000, v19, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", outputStructCnt, 0x30u);
    }
    return 260;
  }
  return v17;
}

uint64_t sub_2145642D0(const void *a1, size_t a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  _DWORD *v10;
  _DWORD *v11;
  uint64_t v12;
  FILE *v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  int v17;
  id v18;
  FILE *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  const char *v36;
  uint64_t v37;
  int v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  const char *v43;
  int v44;
  NSObject *v45;
  id v46;
  const char *v47;
  uint64_t v48;
  char v49;
  const char *v50;
  id v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  id v59;
  void *v60;
  _UNKNOWN **v61;
  int *v62;
  int v63;
  NSObject *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  unsigned int v69;
  int v70;
  uint64_t v71;
  id v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  id v76;
  const char *v77;
  unsigned int v78;
  unsigned int *v79;
  unsigned int *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  id v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  id v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  id v92;
  const char *v93;
  id v94;
  const char *v95;
  id v96;
  const char *v97;
  void *v98;
  char v99;
  FILE *v100;
  double v101;
  unsigned int v102;
  int v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  NSObject *v108;
  unsigned int v109;
  int v110;
  double v111;
  id v112;
  NSObject *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char v118;
  FILE *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  NSObject *v124;
  id v125;
  NSObject *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  void *v132;
  id v133;
  void *v134;
  void *v135;
  NSObject *v136;
  void *v137;
  uint64_t v138;
  NSObject *v139;
  NSObject *v140;
  void *v141;
  NSObject *v142;
  NSObject *v143;
  io_connect_t v144;
  NSObject *v146;
  NSObject *v147;
  NSObject *v148;
  void *v149;
  NSObject *v150;
  void *v151;
  NSObject *v152;
  void *v153;
  NSObject *v154;
  NSObject *v155;
  uint64_t v156;
  NSObject *v157;
  NSObject *v158;
  uint64_t v159;
  NSObject *v160;
  NSObject *v161;
  NSObject *v162;
  NSObject *v163;
  NSObject *v164;
  NSObject *v165;
  unsigned int *v166;
  uint64_t v167;
  id v168;
  unsigned int *v169;
  uint64_t v170;
  unsigned int *v171;
  id v172;
  int *v173;
  id v174;
  id v175;
  id v176;
  int v177;
  _DWORD v178[2];
  size_t v179;
  uint64_t v180;
  void *v181;
  uint8_t buf[4];
  _BYTE v183[10];
  uint64_t v184;
  _BYTE v185[26];
  char __str[16];
  __int128 v187;
  uint64_t v188;

  v188 = *MEMORY[0x24BDAC8D0];
  v179 = 0;
  *(_OWORD *)__str = 0u;
  v187 = 0u;
  if (!a1 || !a2)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "prf1Class && (prf1ClassSize > 0)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 309);
    if (qword_254D7B110 != -1)
      dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
    if (qword_254D7B088)
      v155 = qword_254D7B088;
    else
      v155 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT))
      goto LABEL_191;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v183 = "prf1Class && (prf1ClassSize > 0)";
    *(_WORD *)&v183[8] = 2048;
    v184 = 0;
    *(_WORD *)v185 = 2080;
    *(_QWORD *)&v185[2] = "";
    *(_WORD *)&v185[10] = 2080;
    *(_QWORD *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v185[20] = 1024;
    *(_DWORD *)&v185[22] = 309;
    goto LABEL_190;
  }
  if (!a3)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "systemRootPath", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 310);
    if (qword_254D7B110 != -1)
      dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
    if (qword_254D7B088)
      v155 = qword_254D7B088;
    else
      v155 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT))
      goto LABEL_191;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v183 = "systemRootPath";
    *(_WORD *)&v183[8] = 2048;
    v184 = 0;
    *(_WORD *)v185 = 2080;
    *(_QWORD *)&v185[2] = "";
    *(_WORD *)&v185[10] = 2080;
    *(_QWORD *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v185[20] = 1024;
    *(_DWORD *)&v185[22] = 310;
LABEL_190:
    _os_log_impl(&dword_214503000, v155, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_191:
    v12 = 258;
LABEL_263:
    v61 = &off_254D7B000;
    goto LABEL_124;
  }
  v6 = sub_214563DE4();
  if ((_DWORD)v6)
  {
    v12 = v6;
    v156 = (int)v6;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v6, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 313);
    if (qword_254D7B110 != -1)
      dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
    if (qword_254D7B088)
      v157 = qword_254D7B088;
    else
      v157 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v157, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v183 = "err == 0 ";
      *(_WORD *)&v183[8] = 2048;
      v184 = v156;
      *(_WORD *)v185 = 2080;
      *(_QWORD *)&v185[2] = "";
      *(_WORD *)&v185[10] = 2080;
      *(_QWORD *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v185[20] = 1024;
      *(_DWORD *)&v185[22] = 313;
      _os_log_impl(&dword_214503000, v157, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_263;
  }
  v7 = (char *)calloc(a2 + 9, 1uLL);
  if (!v7)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "fdrInput", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 317);
    if (qword_254D7B110 != -1)
      dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
    if (qword_254D7B088)
      v158 = qword_254D7B088;
    else
      v158 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
      goto LABEL_222;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v183 = "fdrInput";
    *(_WORD *)&v183[8] = 2048;
    v184 = 0;
    *(_WORD *)v185 = 2080;
    *(_QWORD *)&v185[2] = "";
    *(_WORD *)&v185[10] = 2080;
    *(_QWORD *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v185[20] = 1024;
    *(_DWORD *)&v185[22] = 317;
    goto LABEL_221;
  }
  v8 = v7;
  *(_DWORD *)v7 = 589827;
  v7[4] = 0;
  *(_DWORD *)(v7 + 5) = a2;
  memcpy(v7 + 9, a1, a2);
  v9 = sub_2145640A0(dword_254D7B108, 36, 0, v8, a2 + 9, 0, 0);
  if ((_DWORD)v9)
  {
    v12 = v9;
    v159 = (int)v9;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v9, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 327);
    if (qword_254D7B110 != -1)
      dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
    if (qword_254D7B088)
      v160 = qword_254D7B088;
    else
      v160 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v160, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v183 = "err == 0 ";
      *(_WORD *)&v183[8] = 2048;
      v184 = v159;
      *(_WORD *)v185 = 2080;
      *(_QWORD *)&v185[2] = "";
      *(_WORD *)&v185[10] = 2080;
      *(_QWORD *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v185[20] = 1024;
      *(_DWORD *)&v185[22] = 327;
      _os_log_impl(&dword_214503000, v160, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    free(v8);
    goto LABEL_263;
  }
  free(v8);
  v179 = 52;
  v10 = calloc(0x34uLL, 1uLL);
  if (!v10)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dataInfo", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 334);
    if (qword_254D7B110 != -1)
      dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
    if (qword_254D7B088)
      v158 = qword_254D7B088;
    else
      v158 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
      goto LABEL_222;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v183 = "dataInfo";
    *(_WORD *)&v183[8] = 2048;
    v184 = 0;
    *(_WORD *)v185 = 2080;
    *(_QWORD *)&v185[2] = "";
    *(_WORD *)&v185[10] = 2080;
    *(_QWORD *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v185[20] = 1024;
    *(_DWORD *)&v185[22] = 334;
LABEL_221:
    _os_log_impl(&dword_214503000, v158, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_222:
    v12 = 260;
    goto LABEL_263;
  }
  v11 = v10;
  v12 = sub_2145640A0(dword_254D7B108, 45, 0, 0, 0, v10, &v179);
  v13 = (FILE *)*MEMORY[0x24BDAC8D8];
  if ((_DWORD)v12)
  {
    fprintf(v13, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v12, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 338);
    if (qword_254D7B110 != -1)
      dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
    if (qword_254D7B088)
      v161 = qword_254D7B088;
    else
      v161 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v161, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v183 = "err == 0 ";
      *(_WORD *)&v183[8] = 2048;
      v184 = (int)v12;
      *(_WORD *)v185 = 2080;
      *(_QWORD *)&v185[2] = "";
      *(_WORD *)&v185[10] = 2080;
      *(_QWORD *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v185[20] = 1024;
      *(_DWORD *)&v185[22] = 338;
      _os_log_impl(&dword_214503000, v161, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_262;
  }
  fprintf(v13, "ReferenceFramesInfo setCount: %d\n", *v11);
  if (qword_254D7B110 != -1)
    dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
  if (qword_254D7B088)
    v14 = qword_254D7B088;
  else
    v14 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *v11;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v183 = v17;
    _os_log_impl(&dword_214503000, v14, OS_LOG_TYPE_DEFAULT, "ReferenceFramesInfo setCount: %d\n", buf, 8u);
  }
  if (!*v11)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dataInfo->setCount > 0", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 342);
    if (qword_254D7B110 != -1)
      dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
    if (qword_254D7B088)
      v162 = qword_254D7B088;
    else
      v162 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v162, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v183 = "dataInfo->setCount > 0";
      *(_WORD *)&v183[8] = 2048;
      v184 = 0;
      *(_WORD *)v185 = 2080;
      *(_QWORD *)&v185[2] = "";
      *(_WORD *)&v185[10] = 2080;
      *(_QWORD *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v185[20] = 1024;
      *(_DWORD *)&v185[22] = 342;
      _os_log_impl(&dword_214503000, v162, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v12 = 259;
    goto LABEL_262;
  }
  v18 = (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v15, (uint64_t)CFSTR("%s%s"), v16, a3, "/System/Library/Pearl/ReferenceFrames");
  v19 = (FILE *)*MEMORY[0x24BDAC8D8];
  if (!v18)
  {
    fprintf(v19, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "path", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 345);
    if (qword_254D7B110 != -1)
      dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
    if (qword_254D7B088)
      v163 = qword_254D7B088;
    else
      v163 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v163, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v183 = "path";
      *(_WORD *)&v183[8] = 2048;
      v184 = 0;
      *(_WORD *)v185 = 2080;
      *(_QWORD *)&v185[2] = "";
      *(_WORD *)&v185[10] = 2080;
      *(_QWORD *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v185[20] = 1024;
      *(_DWORD *)&v185[22] = 345;
      _os_log_impl(&dword_214503000, v163, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v12 = 261;
    goto LABEL_262;
  }
  v20 = objc_retainAutorelease(v18);
  v24 = (const char *)objc_msgSend_UTF8String(v20, v21, v22, v23);
  fprintf(v19, "ReferenceFramesPath: %s\n", v24);
  if (qword_254D7B110 != -1)
    dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
  if (qword_254D7B088)
    v25 = qword_254D7B088;
  else
    v25 = MEMORY[0x24BDACB70];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v29 = objc_retainAutorelease(v20);
    v30 = v25;
    v34 = objc_msgSend_UTF8String(v29, v31, v32, v33);
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v183 = v34;
    _os_log_impl(&dword_214503000, v30, OS_LOG_TYPE_DEFAULT, "ReferenceFramesPath: %s\n", buf, 0xCu);

  }
  v35 = (id)objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v26, v27, v28);
  v38 = objc_msgSend_fileExistsAtPath_(v35, v36, (uint64_t)v20, v37);

  if (v38)
  {
    v42 = (id)objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v39, v40, v41);
    v44 = objc_msgSend_removeItemAtPath_error_(v42, v43, (uint64_t)v20, 0);

    if ((v44 & 1) == 0)
    {
      v12 = v44 ^ 1u;
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", v12, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 353);
      if (qword_254D7B110 != -1)
        dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
      if (qword_254D7B088)
        v164 = qword_254D7B088;
      else
        v164 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v164, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v183 = "err == 0 ";
        *(_WORD *)&v183[8] = 2048;
        v184 = v12;
        *(_WORD *)v185 = 2080;
        *(_QWORD *)&v185[2] = "";
        *(_WORD *)&v185[10] = 2080;
        *(_QWORD *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        *(_WORD *)&v185[20] = 1024;
        *(_DWORD *)&v185[22] = 353;
        _os_log_impl(&dword_214503000, v164, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      goto LABEL_261;
    }
    if (qword_254D7B110 != -1)
      dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
    if (qword_254D7B088)
      v45 = qword_254D7B088;
    else
      v45 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v183 = v20;
      _os_log_impl(&dword_214503000, v45, OS_LOG_TYPE_DEFAULT, "Removed %@\n", buf, 0xCu);
    }
  }
  v46 = (id)objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v39, v40, v41);
  v49 = objc_msgSend_fileExistsAtPath_(v46, v47, (uint64_t)v20, v48);

  if ((v49 & 1) != 0)
    goto LABEL_37;
  v180 = *MEMORY[0x24BDD0CC8];
  v181 = &unk_24D1B7D58;
  v51 = (id)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v50, (uint64_t)&v181, (uint64_t)&v180, 1);
  v55 = (id)objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v52, v53, v54);
  v12 = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v55, v56, (uint64_t)v20, 1, v51, 0) ^ 1;

  if ((v12 & 1) != 0)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", v12, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 362);
    if (qword_254D7B110 != -1)
      dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
    if (qword_254D7B088)
      v165 = qword_254D7B088;
    else
      v165 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v165, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v183 = "err == 0 ";
      *(_WORD *)&v183[8] = 2048;
      v184 = v12;
      *(_WORD *)v185 = 2080;
      *(_QWORD *)&v185[2] = "";
      *(_WORD *)&v185[10] = 2080;
      *(_QWORD *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v185[20] = 1024;
      *(_DWORD *)&v185[22] = 362;
      _os_log_impl(&dword_214503000, v165, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }

LABEL_261:
LABEL_262:
    free(v11);
    goto LABEL_263;
  }

LABEL_37:
  if (*v11)
  {
    v57 = 0;
    v175 = 0;
    v176 = 0;
    v170 = 0;
    v58 = 0;
    v59 = 0;
    v172 = 0;
    v60 = 0;
    v61 = &off_254D7B000;
    v166 = v11;
    while (1)
    {
      v62 = &v11[3 * v57];
      v63 = v62[1];
      v171 = (unsigned int *)(++v62 + 1);
      v173 = v62;
      v169 = (unsigned int *)(v62 + 2);
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "ReferenceFramesSetInfo, index: %d, type: %d, count: %d, size: %d\n", v57, v63, v62[1], v62[2]);
      if (qword_254D7B110 != -1)
        dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
      v177 = v57;
      if (qword_254D7B088)
        v64 = qword_254D7B088;
      else
        v64 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        v68 = *v173;
        v69 = *v171;
        v70 = *v169;
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)v183 = v57;
        *(_WORD *)&v183[4] = 1024;
        *(_DWORD *)&v183[6] = v68;
        LOWORD(v184) = 1024;
        *(_DWORD *)((char *)&v184 + 2) = v69;
        HIWORD(v184) = 1024;
        *(_DWORD *)v185 = v70;
        _os_log_impl(&dword_214503000, v64, OS_LOG_TYPE_DEFAULT, "ReferenceFramesSetInfo, index: %d, type: %d, count: %d, size: %d\n", buf, 0x1Au);
      }
      v71 = *v173;
      if (v71 <= 3)
        v170 = (uint64_t)*(&off_24D1AA9E8 + v71);
      v72 = (id)objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v65, v66, v67);

      if (!v72)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "setDictionary", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 383);
        v149 = v58;
        if (qword_254D7B110 != -1)
          dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
        if (qword_254D7B088)
          v150 = qword_254D7B088;
        else
          v150 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v183 = "setDictionary";
          *(_WORD *)&v183[8] = 2048;
          v184 = 0;
          *(_WORD *)v185 = 2080;
          *(_QWORD *)&v185[2] = "";
          *(_WORD *)&v185[10] = 2080;
          *(_QWORD *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v185[20] = 1024;
          *(_DWORD *)&v185[22] = 383;
          _os_log_impl(&dword_214503000, v150, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v12 = 261;
        v11 = v166;
        v133 = v175;
        v58 = v149;
        v132 = v59;
        goto LABEL_79;
      }
      v167 = v57;
      v172 = v72;
      objc_msgSend_setObject_forKeyedSubscript_(v72, v73, (uint64_t)&unk_24D1B7D70, (uint64_t)CFSTR("FormatDR"));
      v76 = (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v74, (uint64_t)CFSTR("%@/reference-%@.plist"), v75, v20, v170);

      if (!v76)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dictFileName", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 388);
        v133 = v175;
        v151 = v58;
        if (qword_254D7B110 != -1)
          dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
        if (qword_254D7B088)
          v152 = qword_254D7B088;
        else
          v152 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v183 = "dictFileName";
          *(_WORD *)&v183[8] = 2048;
          v184 = 0;
          *(_WORD *)v185 = 2080;
          *(_QWORD *)&v185[2] = "";
          *(_WORD *)&v185[10] = 2080;
          *(_QWORD *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v185[20] = 1024;
          *(_DWORD *)&v185[22] = 388;
          _os_log_impl(&dword_214503000, v152, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v12 = 261;
        v132 = v72;
        v11 = v166;
        v58 = v151;
        goto LABEL_79;
      }
      v168 = v76;
      if (*v171)
        break;
LABEL_68:
      v118 = objc_msgSend_writeToFile_atomically_(v172, v77, (uint64_t)v168, 0);
      v119 = (FILE *)*MEMORY[0x24BDAC8D8];
      if ((v118 & 1) == 0)
      {
        fprintf(v119, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", 1, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 438);
        v153 = v58;
        if (qword_254D7B110 != -1)
          dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
        v133 = v175;
        if (qword_254D7B088)
          v154 = qword_254D7B088;
        else
          v154 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v183 = "err == 0 ";
          *(_WORD *)&v183[8] = 2048;
          v184 = 1;
          *(_WORD *)v185 = 2080;
          *(_QWORD *)&v185[2] = "";
          *(_WORD *)&v185[10] = 2080;
          *(_QWORD *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v185[20] = 1024;
          *(_DWORD *)&v185[22] = 438;
          _os_log_impl(&dword_214503000, v154, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }

        v12 = 1;
        v11 = v166;
        v58 = v153;
        v132 = v168;
        goto LABEL_79;
      }
      v59 = objc_retainAutorelease(v168);
      v123 = (const char *)objc_msgSend_UTF8String(v59, v120, v121, v122);
      fprintf(v119, "Reference set dictionary written to %s\n", v123);
      if (qword_254D7B110 != -1)
        dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
      v11 = v166;
      if (qword_254D7B088)
        v124 = qword_254D7B088;
      else
        v124 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
      {
        v125 = objc_retainAutorelease(v59);
        v126 = v124;
        v130 = objc_msgSend_UTF8String(v125, v127, v128, v129);
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v183 = v130;
        _os_log_impl(&dword_214503000, v126, OS_LOG_TYPE_DEFAULT, "Reference set dictionary written to %s\n", buf, 0xCu);

      }
      v57 = v167 + 1;
      if (v167 + 1 >= (unint64_t)*v166)
      {

        v12 = 0;
        v132 = v59;
        v133 = v175;
LABEL_79:

        v131 = v176;
        goto LABEL_80;
      }
    }
    v78 = 0;
    while (1)
    {
      v178[0] = v177;
      v178[1] = v78;
      v179 = *v169 + 524;
      v79 = (unsigned int *)calloc(v179, 1uLL);
      if (!v79)
        break;
      v80 = v79;
      v81 = sub_2145640A0(*((_DWORD *)v61 + 66), 46, 0, v178, 8uLL, v79, &v179);
      if ((_DWORD)v81)
      {
        v12 = v81;
        v137 = v60;
        v138 = (int)v81;
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v81, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 403);
        v174 = v58;
        if (qword_254D7B110 != -1)
          dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
        if (qword_254D7B088)
          v139 = qword_254D7B088;
        else
          v139 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v183 = "err == 0 ";
          *(_WORD *)&v183[8] = 2048;
          v184 = v138;
          *(_WORD *)v185 = 2080;
          *(_QWORD *)&v185[2] = "";
          *(_WORD *)&v185[10] = 2080;
          *(_QWORD *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v185[20] = 1024;
          *(_DWORD *)&v185[22] = 403;
          _os_log_impl(&dword_214503000, v139, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        goto LABEL_104;
      }
      if ((snprintf(__str, 0x20uLL, "%.6f", *(double *)v80) - 32) <= 0xFFFFFFE0)
      {
        v137 = v60;
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "ret > 0 && ret < sizeof(tempChar)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 406);
        v174 = v58;
        if (qword_254D7B110 != -1)
          dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
        if (qword_254D7B088)
          v140 = qword_254D7B088;
        else
          v140 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v183 = "ret > 0 && ret < sizeof(tempChar)";
          *(_WORD *)&v183[8] = 2048;
          v184 = 0;
          *(_WORD *)v185 = 2080;
          *(_QWORD *)&v185[2] = "";
          *(_WORD *)&v185[10] = 2080;
          *(_QWORD *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v185[20] = 1024;
          *(_DWORD *)&v185[22] = 406;
          _os_log_impl(&dword_214503000, v140, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v12 = 261;
LABEL_104:
        v141 = v166;
        v87 = v137;
LABEL_121:
        v92 = v176;
LABEL_122:
        free(v141);
        free(v80);

        v134 = v175;
        goto LABEL_123;
      }
      v84 = (id)objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v82, (uint64_t)__str, v83);

      if (!v84)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "tempString", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 409);
        v174 = v58;
        if (qword_254D7B110 != -1)
          dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
        v141 = v166;
        if (qword_254D7B088)
          v142 = qword_254D7B088;
        else
          v142 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v142, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v183 = "tempString";
          *(_WORD *)&v183[8] = 2048;
          v184 = 0;
          *(_WORD *)v185 = 2080;
          *(_QWORD *)&v185[2] = "";
          *(_WORD *)&v185[10] = 2080;
          *(_QWORD *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v185[20] = 1024;
          *(_DWORD *)&v185[22] = 409;
          _os_log_impl(&dword_214503000, v142, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v87 = 0;
        v12 = 261;
        v61 = &off_254D7B000;
        goto LABEL_121;
      }
      v87 = v84;
      v88 = (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v85, (uint64_t)CFSTR("reference-%@__T_%@.bin"), v86, v170, v84);

      if (!v88)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "refFileName", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 412);
        if (qword_254D7B110 != -1)
          dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
        v141 = v166;
        if (qword_254D7B088)
          v143 = qword_254D7B088;
        else
          v143 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v183 = "refFileName";
          *(_WORD *)&v183[8] = 2048;
          v184 = 0;
          *(_WORD *)v185 = 2080;
          *(_QWORD *)&v185[2] = "";
          *(_WORD *)&v185[10] = 2080;
          *(_QWORD *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v185[20] = 1024;
          *(_DWORD *)&v185[22] = 412;
          _os_log_impl(&dword_214503000, v143, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v174 = 0;
        v12 = 261;
        goto LABEL_121;
      }
      v91 = (uint64_t)v88;
      v92 = (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v89, (uint64_t)CFSTR("%@/%@"), v90, v20, v88);

      v174 = (id)v91;
      if (!v92)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "refPath", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 415);
        if (qword_254D7B110 != -1)
          dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
        if (qword_254D7B088)
          v146 = qword_254D7B088;
        else
          v146 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v183 = "refPath";
          *(_WORD *)&v183[8] = 2048;
          v184 = 0;
          *(_WORD *)v185 = 2080;
          *(_QWORD *)&v185[2] = "";
          *(_WORD *)&v185[10] = 2080;
          *(_QWORD *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v185[20] = 1024;
          *(_DWORD *)&v185[22] = 415;
          _os_log_impl(&dword_214503000, v146, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v92 = 0;
        v12 = 261;
        v141 = v166;
        goto LABEL_122;
      }
      v94 = v20;
      objc_msgSend_setObject_forKeyedSubscript_(v172, v93, v91, (uint64_t)v87);
      v96 = (id)objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x24BDBCE50], v95, (uint64_t)(v80 + 3), v80[2], 0);

      if (!v96)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "refFrameData", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 423);
        if (qword_254D7B110 != -1)
          dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
        v20 = v94;
        if (qword_254D7B088)
          v147 = qword_254D7B088;
        else
          v147 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v183 = "refFrameData";
          *(_WORD *)&v183[8] = 2048;
          v184 = 0;
          *(_WORD *)v185 = 2080;
          *(_QWORD *)&v185[2] = "";
          *(_WORD *)&v185[10] = 2080;
          *(_QWORD *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v185[20] = 1024;
          *(_DWORD *)&v185[22] = 423;
          _os_log_impl(&dword_214503000, v147, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v175 = 0;
        v12 = 261;
        v141 = v166;
        goto LABEL_122;
      }
      v98 = v87;
      v175 = v96;
      v99 = objc_msgSend_writeToFile_atomically_(v96, v97, (uint64_t)v92, 0);
      v100 = (FILE *)*MEMORY[0x24BDAC8D8];
      if ((v99 & 1) == 0)
      {
        fprintf(v100, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", 1, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 426);
        if (qword_254D7B110 != -1)
          dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
        v20 = v94;
        if (qword_254D7B088)
          v148 = qword_254D7B088;
        else
          v148 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(v148, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v183 = "err == 0 ";
          *(_WORD *)&v183[8] = 2048;
          v12 = 1;
          v184 = 1;
          *(_WORD *)v185 = 2080;
          *(_QWORD *)&v185[2] = "";
          *(_WORD *)&v185[10] = 2080;
          *(_QWORD *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v185[20] = 1024;
          *(_DWORD *)&v185[22] = 426;
          _os_log_impl(&dword_214503000, v148, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        else
        {
          v12 = 1;
        }
        v141 = v166;
        goto LABEL_122;
      }
      v101 = *(double *)v80;
      v102 = v80[2];
      v103 = *v173;
      v176 = objc_retainAutorelease(v92);
      v107 = (const char *)objc_msgSend_UTF8String(v176, v104, v105, v106);
      fprintf(v100, "Reference frame (set=%d, frame=%d, size=%d, type=%d, temp=%f) written to %s\n", v177, v78, v102, v103, v101, v107);
      if (qword_254D7B110 != -1)
        dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
      if (qword_254D7B088)
        v108 = qword_254D7B088;
      else
        v108 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
      {
        v109 = v80[2];
        v110 = *v173;
        v111 = *(double *)v80;
        v112 = objc_retainAutorelease(v176);
        v113 = v108;
        v117 = objc_msgSend_UTF8String(v112, v114, v115, v116);
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)v183 = v177;
        *(_WORD *)&v183[4] = 1024;
        *(_DWORD *)&v183[6] = v78;
        LOWORD(v184) = 1024;
        *(_DWORD *)((char *)&v184 + 2) = v109;
        HIWORD(v184) = 1024;
        *(_DWORD *)v185 = v110;
        *(_WORD *)&v185[4] = 2048;
        *(double *)&v185[6] = v111;
        v61 = &off_254D7B000;
        *(_WORD *)&v185[14] = 2080;
        *(_QWORD *)&v185[16] = v117;
        _os_log_impl(&dword_214503000, v113, OS_LOG_TYPE_DEFAULT, "Reference frame (set=%d, frame=%d, size=%d, type=%d, temp=%f) written to %s\n", buf, 0x2Eu);

      }
      free(v80);
      ++v78;
      v20 = v94;
      v60 = v98;
      v58 = v174;
      if (v78 >= *v171)
        goto LABEL_68;
    }
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "refFrame", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 400);
    v135 = v58;
    if (qword_254D7B110 != -1)
      dispatch_once(&qword_254D7B110, &unk_24D1AA9C8);
    if (qword_254D7B088)
      v136 = qword_254D7B088;
    else
      v136 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v183 = "refFrame";
      *(_WORD *)&v183[8] = 2048;
      v184 = 0;
      *(_WORD *)v185 = 2080;
      *(_QWORD *)&v185[2] = "";
      *(_WORD *)&v185[10] = 2080;
      *(_QWORD *)&v185[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v185[20] = 1024;
      *(_DWORD *)&v185[22] = 400;
      _os_log_impl(&dword_214503000, v136, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    free(v166);

    v12 = 260;
  }
  else
  {
    v131 = 0;
    v58 = 0;
    v60 = 0;
    v133 = 0;
    v12 = 0;
    v61 = &off_254D7B000;
LABEL_80:
    free(v11);

    v134 = v133;
LABEL_123:

  }
LABEL_124:
  v144 = *((_DWORD *)v61 + 66);
  if (v144)
  {
    IOServiceClose(v144);
    *((_DWORD *)v61 + 66) = 0;
  }
  return v12;
}

void sub_2145664A0()
{
  os_log_t v0;
  void *v1;
  void *v2;

  v0 = os_log_create("com.apple.BiometricKit", "Library-PearlFactory");
  v1 = (void *)qword_254D7B088;
  qword_254D7B088 = (uint64_t)v0;

  v2 = (void *)qword_254D7B088;
  if (!qword_254D7B088)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      sub_214566510();
    v2 = (void *)qword_254D7B088;
  }
  objc_storeStrong((id *)&qword_254D7B080, v2);
}

void sub_214566510()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_214503000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Couldn't create OS Log for 'com.apple.BiometricKit.Library-PearlFactory'!\n", v0, 2u);
}

void sub_214566554(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, "Failed to parse override dict: %@", a5, a6, a7, a8, 2u);
}

void sub_2145665BC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450603C(&dword_214503000, a1, a3, "Failed to get FDR blob", a5, a6, a7, a8, 0);
  sub_21450605C();
}

void sub_2145665EC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450603C(&dword_214503000, a1, a3, "Failed to get instance from sealing map", a5, a6, a7, a8, 0);
  sub_21450605C();
}

void sub_21456661C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450603C(&dword_214503000, a1, a3, "Failed to get instance from sealing manifest", a5, a6, a7, a8, 0);
  sub_21450605C();
}

void sub_21456664C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, "AMFDRDataDictCopy failed, error: %@", a5, a6, a7, a8, 2u);
}

void sub_2145666B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "outSignature is NULL", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_2145666E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "outDeviceNonce is NULL", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214566710()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "deviceNonce is NULL", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456673C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "*outSignature is NULL", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214566768()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "*outDeviceNonce is NULL", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214566794(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a1, a3, "%s failed", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_214566804()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "errorCode detected", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214566830()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "signing timed out", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456685C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "challenge is NULL", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214566888()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Get osBootHash failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_2145668B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Get prebootPath failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_2145668E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Get customAMAuthInstallRef failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456690C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Create optionsDict failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214566938()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Create optionsYonkersDict failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214566964()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Create updaterOptions failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214566990()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507EB0(*MEMORY[0x24BDAC8D0]);
  sub_214507EA4();
  sub_21450604C(&dword_214503000, v0, v1, "Failed to create SavageUpdater: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_2145669F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507EB0(*MEMORY[0x24BDAC8D0]);
  sub_214507EA4();
  sub_21450604C(&dword_214503000, v0, v1, "SavageUpdaterExecCommand failed: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214566A50()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Create customObj failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214566A7C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Get ticket failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214566AA8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "signature is NULL", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214566AD4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a1, a3, "%s failed", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_214566B44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507EB0(*MEMORY[0x24BDAC8D0]);
  sub_214507EA4();
  sub_21450604C(&dword_214503000, v0, v1, "SavageUpdater failed with error: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214566BA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to enable SSO", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214566BD0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_214507E94(&dword_214503000, a2, a3, "challenge: %@", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_214566C34(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_214507E94(&dword_214503000, a1, a3, "entering %s ...", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_214566CA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "matchingDict is NULL", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214566CD0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "service is NULL", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214566CFC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a1, a3, "%s failed to create DER file", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_214566D6C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "failed to allocate encoder", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214566D98()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "failed to allocate dstEncoder", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214566DC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "*outDerData is NULL", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214566DF0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "*outDerDataLength is 0", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214566E1C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "DEREncoderCreateEncodedBuffer failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214566E48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "DEREncoderAddSequenceFromEncoder failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214566E74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "DEREncoderAddData failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214566EA0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a1, a3, "%s failed", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_214566F10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "ccrngNonce is NULL", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214566F3C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to allocate memmory for nonce", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214566F68()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to generate random nonce\n", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214566F94()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "signatureData is NULL", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214566FC0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "deviceNonceData is NULL", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214566FEC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_214507E94(&dword_214503000, v0, v1, "denied spc: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456704C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_214507E94(&dword_214503000, v0, v1, "lost spc: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_2145670AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_214507E94(&dword_214503000, v0, v1, "unauth spc: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456710C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_214507E94(&dword_214503000, v0, v1, "lock spc: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456716C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_214507E94(&dword_214503000, v0, v1, "fail spc: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_2145671CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_214507E94(&dword_214503000, v0, v1, "sealed spc: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456722C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_214507E94(&dword_214503000, v0, v1, "pass spc: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456728C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "No preflight1 response", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_2145672B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "No challenges in preflight1 response", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_2145672E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "No device handler", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214567310(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_214503000, log, OS_LOG_TYPE_ERROR, "Failed to parse challenge object", buf, 2u);
}

void sub_21456734C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Missing type in challenge object", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214567378()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Missing status in challenge object", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_2145673A4()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  sub_2145096A8();
  _os_log_error_impl(&dword_214503000, v0, OS_LOG_TYPE_ERROR, "Failed to get SPC for component: %@", v1, 0xCu);
  sub_214507E8C();
}

void sub_214567410(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_214503000, a2, OS_LOG_TYPE_ERROR, "Create payload failed with error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_214567484(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_214503000, a2, OS_LOG_TYPE_ERROR, "Failed to read defaults: %@", (uint8_t *)&v2, 0xCu);
}

void sub_2145674F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_21450B8BC();
  sub_21450B8AC(&dword_214503000, v0, v1, "aks_sik_attest failed: %d", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214567558()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_21450B8BC();
  sub_21450B8AC(&dword_214503000, v0, v1, "aks_ref_key_sign failed: %d", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_2145675B8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450603C(&dword_214503000, a1, a3, "ccder_decode_tl failed", a5, a6, a7, a8, 0);
  sub_21450605C();
}

void sub_2145675E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_21450B8BC();
  sub_21450B8AC(&dword_214503000, v0, v1, "aks_ref_key_verify_sig failed: %d", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214567648(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450603C(&dword_214503000, a1, a3, "Failed to retrieve PKA state.", a5, a6, a7, a8, 0);
  sub_21450605C();
}

void sub_214567678(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450603C(&dword_214503000, a1, a3, "aks_params_create failed", a5, a6, a7, a8, 0);
  sub_21450605C();
}

void sub_2145676A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_21450B8BC();
  sub_21450B8AC(&dword_214503000, v0, v1, "aks_ref_key_create failed: %d", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214567708()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_21450B8BC();
  sub_21450B8AC(&dword_214503000, v0, v1, "aks_params_get_der failed: %d", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214567768()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_21450B8BC();
  sub_21450B8AC(&dword_214503000, v0, v1, "aks_params_set_number failed: %d", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_2145677C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_21450B8BC();
  sub_21450B8AC(&dword_214503000, v0, v1, "aks_ref_key_create_with_blob failed: %d", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214567828(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, "Failed to get delta components: %@", a5, a6, a7, a8, 2u);
}

void sub_214567890(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_214503000, log, OS_LOG_TYPE_ERROR, "Unsupported strong component", buf, 2u);
}

void sub_2145678CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Missing key blob", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_2145678F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Empty payload", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214567924()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Create RIK failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214567950()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Get digest failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456797C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Missing RIK", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_2145679A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to get attestation", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_2145679D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to get pub key", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214567A00()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "No baa certs found", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214567A2C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "DeviceIdentityIssueClientCertificateWithCompletion timeout", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214567A58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "DeviceIdentityIssueClientCertificateWithCompletion failed with no certificates", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214567A84(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, "DeviceIdentityIssueClientCertificateWithCompletion failed: %@", a5, a6, a7, a8, 2u);
}

void sub_214567AEC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to get delta components", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214567B18(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_phase(a1, a2, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2145096A8();
  sub_214512214(&dword_214503000, a2, v6, "%@: Error response", v7);

  sub_2145122AC();
}

void sub_214567B98(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend_phase(a1, a2, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_214512294();
  sub_214512248(&dword_214503000, v5, v6, "%@: Send request failed: %@", v7, v8, v9, v10, v11);

  sub_214512270();
}

void sub_214567C18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Failed to get repair BAA cert: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214567C78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Missing required parameters", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214567CA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "challengeComponents failed: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214567D04()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Error: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214567D64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Error:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214567DC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "details item in response has unknown type: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214567E24()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "details in response malformed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214567E50()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  sub_2145096A8();
  sub_214512280(&dword_214503000, v0, v1, "components: %@", v2);
  sub_214507E8C();
}

void sub_214567EB4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  sub_2145096A8();
  sub_214512280(&dword_214503000, v0, v1, "returnStrongComponents: %@", v2);
  sub_214507E8C();
}

void sub_214567F18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "queryRepairDelta failed: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214567F78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Connection error: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214567FD8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "No request", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214568004()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "No server URL", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214568030()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "No request payload", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456805C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Failed to create return response: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_2145680BC()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  sub_21451225C();
  sub_214512220(v2, v3, v4, 5.778e-34);
  sub_214512238(&dword_214503000, "CRPreflightResponse_%@: %@", v5, v6);

  sub_21451228C();
}

void sub_2145680FC()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  sub_21451225C();
  sub_214512220(v2, v3, v4, 5.778e-34);
  sub_214512238(&dword_214503000, "response_%@: %@", v5, v6);

  sub_21451228C();
}

void sub_21456813C()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  sub_21451225C();
  sub_214512220(v2, v3, v4, 5.778e-34);
  sub_214512238(&dword_214503000, "request_%@: %@", v5, v6);

  sub_21451228C();
}

void sub_21456817C()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  sub_21451225C();
  sub_214512220(v2, v3, v4, 5.778e-34);
  sub_214512238(&dword_214503000, "CRPreflightRequest_%@: %@", v5, v6);

  sub_21451228C();
}

void sub_2145681BC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  sub_214512280(&dword_214503000, a3, (uint64_t)a3, "Content-Length: %ld", (uint8_t *)a1);
}

void sub_2145681F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to sign request", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214568224()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to encode request signature", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214568250()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to sign server nonce", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456827C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to encode server nonce signature", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_2145682A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Empty Server Response", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_2145682D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Empty Server Response Data", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214568300()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "dataTaskWithRequest error: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214568360()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "No Response", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456838C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  objc_msgSend_errorCode(a1, a2, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorMessage(a1, v6, v7, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_214512248(&dword_214503000, v9, v10, "Server response with error: %@, %@", v11, v12, v13, v14, 2u);

  sub_214512270();
}

void sub_214568430(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_214503000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

void sub_2145684A4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450B8AC(&dword_214503000, a2, a3, "writeSystemConfig: IORegistryEntrySetCFProperties failed with: %x", a5, a6, a7, a8, 0);
  sub_21450605C();
}

void sub_214568508()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "writeSystemConfig: readSystemConfigArea failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214568534()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "writeSystemConfig: Syscfg update failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214568560()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "writeSystemConfig: findSyscfgAccess failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456858C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Invalid input", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_2145685B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "readSystemConfigAll: readSystemConfigArea failed.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_2145685E4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 134218240;
  v3 = a1;
  v4 = 2048;
  v5 = 24;
  _os_log_error_impl(&dword_214503000, a2, OS_LOG_TYPE_ERROR, "readSystemConfigAll: syscfg length %lu is too small, header size %lu\n", (uint8_t *)&v2, 0x16u);
}

void sub_214568668()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "readSystemConfigAll: syscfg is not initialized!", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214568694()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "No sysconfig access found.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_2145686C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Length incorrect", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_2145686EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Key not found", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214568718()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Sysconfig entry doesn't exist", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214568744()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Sysconfig data not valid", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214568770()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Cannot get any syscfg data", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456879C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Syscfg data is not CFData", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_2145687C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Cannot find syscfg access", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_2145687F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to get instance from sealing map", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214568820()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to get FDR blob", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456884C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Unable to fetch live instance", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214568878()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Unable to get chmf blob", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_2145688A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Unable to challenge response", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_2145688D0(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_214503000, a2, OS_LOG_TYPE_ERROR, "Unable to fetch Internal Component Auth Status:%d", (uint8_t *)v2, 8u);
  sub_21450605C();
}

void sub_214568940()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "IOREG Auth Component Timeout", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456896C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "IOREG Auth Component Not Populated", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214568998()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "queryRepairDelta timeout", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_2145689C4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_214503000, a2, OS_LOG_TYPE_ERROR, "Connection error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_214568A38(char a1, uint64_t a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109378;
  v3[1] = a1 & 1;
  v4 = 2112;
  v5 = a2;
  _os_log_error_impl(&dword_214503000, log, OS_LOG_TYPE_ERROR, "queryRepairDelta failed: %d. %@", (uint8_t *)v3, 0x12u);
}

void sub_214568AC0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Cannot find camera service", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214568AEC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Audio failed with Speaker issue.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214568B18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Audio failed with Codec issue.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214568B44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Cannot find matched camera service", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214568B70(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, "Failed to obatin FW path:%@", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_214568BD4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  sub_214518EEC(&dword_214503000, a3, (uint64_t)a3, "Faild to read OS Boot Hash from %@; error: %@", (uint8_t *)&v3);
  sub_214507E8C();
}

void sub_214568C4C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a1, a3, "Failed to obatin FW path:%@", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_214568CB4(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = CFSTR("diagnostic-boot-intent");
  v5 = 2112;
  v6 = a1;
  sub_214518EEC(&dword_214503000, a2, a3, "readNVRAMValueForKey %@ failed: %@", (uint8_t *)&v3);
  sub_214507E8C();
}

void sub_214568D30(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, "Failed to deserialize data for boot intent dictionary, error %@", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_214568D94()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to get boot intent purpose", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214568DC0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "SSR boot intent not found", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214568DEC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Unexpected SSR boot intent purpose format", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214568E18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Unexpected SSR boot intent format", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214568E44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Invalid ChallengeResponse:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214568EA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "challengeRequest creation failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214568ED0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Create Request Failed:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214568F30()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Server response missing Challenge", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214568F5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Attestation request creation failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214568F88(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, "Server response missing CAA OID:%@", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_214568FF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Request to parse Server response:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214569054(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, "Request Failed:%@", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_2145690C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Missing mandatory OIDS in kMAOptionsBAAOIDSToInclude", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_2145690EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Invalid Certs or BIK", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214569118()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Error getting BAA certs:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214569178()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Connection error:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_2145691D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Empty Server Response", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214569204()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Empty Server Response Data", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214569230()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "dataTaskWithRequest error:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214569290()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "CAA attestation failed:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_2145692F0()
{
  uint64_t v0;
  os_log_t v1;

  sub_21451F7D0();
  sub_21451F7BC(&dword_214503000, v0, v1, "Unable to copy current identifier for  data classes:%@ error:%@");
  sub_214507E8C();
}

void sub_214569350()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "MLB repair pre-check failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456937C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "KBB isServicePart", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_2145693A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Fail to get KBB manifest, abort and error out", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_2145693D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "KGB isServicePart wihtout MLB SPC", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214569400()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Claim not available for this device", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456942C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, "Can't parse serial number %@", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_214569490()
{
  uint64_t v0;
  os_log_t v1;

  sub_21451F7D0();
  sub_21451F7BC(&dword_214503000, v0, v1, "KGB MLB serial number %@ and device %@ dont match");
  sub_214507E8C();
}

void sub_2145694F0()
{
  uint64_t v0;
  os_log_t v1;

  sub_21451F7D0();
  sub_21451F7BC(&dword_214503000, v0, v1, "FGSN %@ doesn't match what's on device %@");
  sub_214507E8C();
}

void sub_214569550(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a1, a3, "Failed to sync sysconfig %@.", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_2145695C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a1, a3, "Failed to sync sysconfig %@.", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_214569630(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a1, a3, "Failed to sync sysconfig %@.", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_2145696A0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, "Sysconfig %@ missing after write.", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_214569704(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, "Write Sysconfig %@ failed.", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_214569768()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to alloc resources", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214569794(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, "getMakeDataClassesAndInstancesWithPartSPC failed with error: %@", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_2145697FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Unable to find /defaults node", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214569828()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to retrieve data classes to write to EAN", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214569854()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "EAN Verify failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214569880()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Failed to delete FDR data instance for: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_2145698E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Failed to write FDR data instance for: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214569940()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Cannot allocate buffer for data padding", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456996C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Could not get queryKey", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214569998(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a1, a3, "Failed to open service %s", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_214569A08()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_21450B8BC();
  sub_21450B8AC(&dword_214503000, v0, v1, "Failed to write to EAN with kernResult = 0x%x", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214569A68()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_214523DD0();
  sub_214523DC0(&dword_214503000, v0, v1, "IOServiceOpen on %s failed, kernResult = 0x%x", v2, v3, v4, v5, 2u);
  sub_214507E8C();
}

void sub_214569AD4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450B8AC(&dword_214503000, a1, a3, "imageSize isn't %d-aligned.", a5, a6, a7, a8, 0);
  sub_21450605C();
}

void sub_214569B40()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Final size of padded data isn't inputSize+paddingSize", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214569B6C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to get chosen info", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214569B98()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to get syscfg-erly-kbgs-data-class", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214569BC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Unable to allocate memory for byte reversal", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214569BF0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Invalid args", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214569C1C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Unexpected der length", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214569C48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to get true size of der object", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214569C74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_21450B8BC();
  sub_21450B8AC(&dword_214503000, v0, v1, "Failed to read EAN with kernResult = 0x%x", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214569CD4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_21450B8BC();
  sub_21450B8AC(&dword_214503000, v0, v1, "Could not get size of data context IOConnectCallScalarMethod kAppleNVMeEANGetSize:%d", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214569D34(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_length(a1, a2, a3, a4);
  sub_2145096A8();
  _os_log_error_impl(&dword_214503000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "key is not 4 bytes (%lu)", v5, 0xCu);
}

void sub_214569DB8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_21450B8BC();
  sub_21450B8AC(&dword_214503000, v0, v1, "Failed to delete EAN with kernResult = 0x%x", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214569E18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Verify FDR data from EAN using cache, but missing cached data.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214569E44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Data class (%@) mismatch from previous data.", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214569EA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to read data class from EAN", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214569ED0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to get EAN data classes to verify", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214569EFC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Data class (%@) mismatch from FDR local data.", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214569F5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_21450B8BC();
  sub_21450B8AC(&dword_214503000, v0, v1, "syscfg_fdr: could not determine actual size of DER encoded object (derstat = %d)", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214569FBC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a1, a3, "%s: no ticket", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_21456A02C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a1, a3, "%s: failed to allocated digest data", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_21456A09C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a1, a3, "%s: failed to get data property from Img4 manifest", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_21456A10C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to get ap_ticket.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456A138()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "fdrOptions failed allocation", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456A164(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a1, a3, "failed to create data directory URL from %@", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_21456A1CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "failed to create FDR local store", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456A1F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to read trust object digest from apticket.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456A224()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to load seal instance array.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456A250()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to load seal data.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456A27C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Unable to read FDR Trust object.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456A2A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "key is NULL.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456A2D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "payloadType is invalid.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456A300()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "IOServiceGetMatchingService failed to find kNVMeEANServiceMatchName.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456A32C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "IOServiceOpen returned IO_OBJECT_NULL.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456A358()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_21450B8BC();
  sub_21450B8AC(&dword_214503000, v0, v1, "getSize failed, kernResult = 0x%x.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456A3B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_21450B8BC();
  sub_21450B8AC(&dword_214503000, v0, v1, "IOServiceOpen returned result=0x%04x.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456A418()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Hash is inside header.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456A444()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Hash size is zero.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456A470()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "FDR info payload is empty.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456A49C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Hash is extends outside payload.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456A4C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Generation count is invalid.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456A4F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_214523DF4();
  sub_214523DE4(&dword_214503000, v0, v1, "Bad fdr info header version.\tExpect: %d\tFound: %d", v2, v3, v4, v5, 0);
  sub_214507E8C();
}

void sub_21456A560()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_214523DF4();
  sub_214523DE4(&dword_214503000, v0, v1, "Bad fdr info header magic.\tExpect: %d\tFound: %d", v2, v3, v4, v5, 0);
  sub_214507E8C();
}

void sub_21456A5D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "FDR parts array is NULL.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456A5FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "FDR parts array is empty.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456A628()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to load APTK key.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456A654()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "ean_dictionary is NULL", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456A680()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "IOServiceGetMatchingService failed to find kNVMeEANServiceMatchName", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456A6AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "IOServiceOpen returned IO_OBJECT_NULL", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456A6D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_21450B8BC();
  sub_21450B8AC(&dword_214503000, v0, v1, "IOServiceOpen returned result=0x%04x", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456A738()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  sub_2145096A8();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_214503000, v1, OS_LOG_TYPE_ERROR, "Failed to copy staged FDR EAN data:%@:%@", v2, 0x16u);
  sub_214507E8C();
}

void sub_21456A7B4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a1, a3, "Failed to write FDR data instance for: %@", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_21456A824()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "key1 is NULL.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456A850()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "key2 is NULL.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456A87C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "payloadType1 is invalid.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456A8A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "payloadType2 is invalid.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456A8D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_21450B8BC();
  sub_21450B8AC(&dword_214503000, v0, v1, "swapImage failed, kernResult = 0x%x.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456A934()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Versioned FDR corrupted", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456A960()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to commit fdr2->fdr1", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456A98C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "unable to find chosen node", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456A9B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "unable to create NSData of ticket hash", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456A9E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "img4CryptoHashMethodData not recognized:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456AA44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "no ticket available", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456AA70()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Unable to read ap ticket.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456AA9C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to read ap ticket hash.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456AAC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to swap Versioned FDR", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456AAF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to setupVersioned FDR", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456AB20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "apTicket type mismatch", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456AB4C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, "Unable to copy the APTicket path. %@", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_21456ABB0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, "Unable to read APTicket:%@", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_21456AC14(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450B8AC(&dword_214503000, a2, a3, "the result of Img4 decode is %i", a5, a6, a7, a8, 0);
  sub_21450605C();
}

void sub_21456AC78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "failed to parse AP ticket as Img4 manifest", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456ACA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "AP Ticket is not passed in, try to fetch it from device", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456ACD0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Unexpected NULL value returned from SecTaskCreateFromSelf()", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456ACFC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  sub_214518EEC(&dword_214503000, a3, (uint64_t)a3, "Unexpected value %@ for %@ entitlement", (uint8_t *)&v3);
  sub_214507E8C();
}

void sub_21456AD74(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, "Unable to get entitlements for client task:%@", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_21456ADDC()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 138412546;
  sub_214525A3C();
  sub_214518EEC(&dword_214503000, v0, v1, "Faild to read OS Boot Hash from %@; error: %@", (uint8_t *)v2);
  sub_214507E8C();
}

void sub_21456AE4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "AP Ticket is not passed in.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456AE78(int a1, uint64_t a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 2048;
  v5 = a2;
  _os_log_error_impl(&dword_214503000, log, OS_LOG_TYPE_ERROR, "Unsupported Class:%d::Product:%ld", (uint8_t *)v3, 0x12u);
}

void sub_21456AEFC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450603C(&dword_214503000, a1, a3, "Device RCHL is invalid", a5, a6, a7, a8, 0);
}

void sub_21456AF30(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450603C(&dword_214503000, a1, a3, "Failed to create FDR type", a5, a6, a7, a8, 0);
}

void sub_21456AF64(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, "Unable to getUpdateDataClasses:%@", a5, a6, a7, a8, 2u);
}

void sub_21456AFCC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450603C(&dword_214503000, a1, a3, "Claim not available for this device", a5, a6, a7, a8, 0);
}

void sub_21456B000(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450603C(&dword_214503000, a1, a3, "Failed to alloc resources", a5, a6, a7, a8, 0);
}

void sub_21456B034(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, "getMakeDataClassesAndInstancesWithPartSPC failed with error: %@", a5, a6, a7, a8, 2u);
}

void sub_21456B0A0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, "Unable to getUpdateDataClasses:%@", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_21456B104(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, "Unable to getMakeDataClasses:%@", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_21456B168(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_214529DEC(&dword_214503000, a3, (uint64_t)a3, "Display Repair Not Available for the device", a1);
}

void sub_21456B19C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, "Unable to get claim data Classes:%@", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_21456B200(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_214529DEC(&dword_214503000, a1, a3, "Failed to alloc resources", v3);
}

void sub_21456B238(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 136315138;
  v3 = a1;
  _os_log_error_impl(&dword_214503000, a2, OS_LOG_TYPE_ERROR, "%s\n", (uint8_t *)&v2, 0xCu);
}

void sub_21456B2AC(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[CRComponentBase CRCreateECDSADerData:responseDer:]";
  _os_log_error_impl(&dword_214503000, log, OS_LOG_TYPE_ERROR, "%s failed to create DER file", (uint8_t *)&v1, 0xCu);
}

void sub_21456B32C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "failed to allocate encoder", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456B358()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "failed to allocate dstEncoder", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456B384()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "derData is NULL", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456B3B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "derDataLength is 0", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456B3DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "DEREncoderCreateEncodedBuffer failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456B408()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "DEREncoderAddSequenceFromEncoder failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456B434(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_214503000, log, OS_LOG_TYPE_ERROR, "Response Dictionary Empty", v1, 2u);
}

void sub_21456B474(void **a1, NSObject *a2)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_214503000, a2, OS_LOG_TYPE_ERROR, "Unable to read Roswell identifier:%@", (uint8_t *)&v3, 0xCu);

}

void sub_21456B4F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Invalid Params and Nonce", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456B524()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Unable to create sha256hash of nonce", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456B550(void **a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v8;

  v8 = *a1;
  sub_21450604C(&dword_214503000, a2, a3, "Unable to read tsid:%@", a5, a6, a7, a8, 2u);

  sub_2145122AC();
}

void sub_21456B5C0(void **a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v8;

  v8 = *a1;
  sub_21450604C(&dword_214503000, a2, a3, "properties fetch failed:%@", a5, a6, a7, a8, 2u);

  sub_2145122AC();
}

void sub_21456B630(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450603C(&dword_214503000, a1, a3, "failed to create FDR object", a5, a6, a7, a8, 0);
  sub_21450605C();
}

void sub_21456B660(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450603C(&dword_214503000, a1, a3, "Invalid Params and Nonce", a5, a6, a7, a8, 0);
  sub_21450605C();
}

void sub_21456B690(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, "Failed challenge:%@", a5, a6, a7, a8, 2u);
}

void sub_21456B6F8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, " Failed to connect:%@", a5, a6, a7, a8, 2u);
}

void sub_21456B760(os_log_t log)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = 1;
  _os_log_error_impl(&dword_214503000, log, OS_LOG_TYPE_ERROR, "could not find IOAccessoryManager service for port %d\n", (uint8_t *)v1, 8u);
  sub_21450605C();
}

void sub_21456B7D8(mach_error_t a1, NSObject *a2)
{
  int v3;
  char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = mach_error_string(a1);
  _os_log_error_impl(&dword_214503000, a2, OS_LOG_TYPE_ERROR, "could not open IOAccessoryManager service: %s\n", (uint8_t *)&v3, 0xCu);
  sub_2145122AC();
}

void sub_21456B858(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, "Unable to get Claim dataClasses:%@", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_21456B8BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Unable to getUpdateDataClasses:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456B91C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Unable to getClaimDataClasses:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456B97C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "KBB sealing manifest not found", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456B9A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to set minimal sealing meta", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456B9D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "AMFDRSealingMapCopyMinimalManifestClassesAndInstances failed: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456BA34()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "AMFDRSealingManifestCopyMinimalManifestClassesAndInstances failed: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456BA94()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Decode KBB sealing manifest failed: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456BAF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Unable to create multiSealingMetadata", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456BB20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Unable to create metaDataDict", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456BB4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "sikStr is NULL", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456BB78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "fullStr is NULL", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456BBA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "innerHeaderKey failed to create", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456BBD0()
{
  uint64_t v0;
  os_log_t v1;

  sub_214507EB0(*MEMORY[0x24BDAC8D0]);
  sub_214530700();
  sub_21451F7BC(&dword_214503000, v0, v1, "Failed to delete %@, error: %@");
  sub_214507E8C();
}

void sub_21456BC30()
{
  uint64_t v0;
  os_log_t v1;

  sub_214530718();
  sub_21451F7BC(&dword_214503000, v0, v1, "Failed to sync %@ to %@");
  sub_214507E8C();
}

void sub_21456BC98()
{
  uint64_t v0;
  os_log_t v1;

  sub_21451F7D0();
  sub_21451F7BC(&dword_214503000, v0, v1, "Failed to create directory at %@, error: %@");
  sub_214507E8C();
}

void sub_21456BCF8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450603C(&dword_214503000, a1, a3, "Failed to setup FileSystem for repair", a5, a6, a7, a8, 0);
}

void sub_21456BD2C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_214503000, a2, OS_LOG_TYPE_ERROR, "Can't read fdr factory data path; error: %@",
    (uint8_t *)&v2,
    0xCu);
  sub_214507E8C();
}

void sub_21456BD9C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450603C(&dword_214503000, a1, a3, "Missing FDR data path", a5, a6, a7, a8, 0);
}

void sub_21456BDD0()
{
  uint64_t v0;
  os_log_t v1;

  sub_21451F7D0();
  sub_21451F7BC(&dword_214503000, v0, v1, "Failed to delete %@, error: %@");
  sub_214507E8C();
}

void sub_21456BE30(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a1, a3, "The device doesn't support property %@, ignored", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_21456BEA0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Unable to _addDataClassAndInstanceToMutableDictionary:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456BF00()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Could not get assembly identifier:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456BF60()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Unable to fetch drp#:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456BFC0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450603C(&dword_214503000, a1, a3, "Fail to get KBB seal manifest", a5, a6, a7, a8, 0);
}

void sub_21456BFF4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450603C(&dword_214503000, a1, a3, "Unable to setup FS for repair", a5, a6, a7, a8, 0);
}

void sub_21456C028(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, "Unable to create CRFDRSeal with parameters: %@", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_21456C08C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, "FDR Seal failed: %@", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_21456C0F0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, "FDR Seal failed: %ld", a5, a6, a7, a8, 0);
  sub_214507E8C();
}

void sub_21456C154(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450603C(&dword_214503000, a1, a3, "Failed to setup alternative FDR path", a5, a6, a7, a8, 0);
}

void sub_21456C188()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Invalid action", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456C1B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Invalid daemon label", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456C1E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Missing entitlement for controlling daemon %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456C240()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Invalid domain name", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456C26C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Invalid preference key", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456C298()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Invalid preference value", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456C2C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Missing entitlement for accessing defaults of domain %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456C324()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to find libxpc API", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456C350()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Unsupported action", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456C37C()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  uint64_t v3;

  sub_2145096A8();
  WORD2(v3) = 2048;
  HIWORD(v3) = v0;
  sub_21451F7BC(&dword_214503000, v0, v1, "%s: error %lld", v2, v3);
  sub_214507E8C();
}

void sub_21456C3E8()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  const char *v3;
  const char *v4;

  sub_2145096A8();
  WORD2(v4) = 2080;
  HIWORD(v4) = v0;
  sub_21451F7BC(&dword_214503000, v1, v2, "%s service already %s", v3, v4);
  sub_214507E8C();
}

void sub_21456C470()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "dlopen failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456C49C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "dlsym(%s) failed", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456C4FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Invalid parameters", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456C528(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_214503000, a2, OS_LOG_TYPE_ERROR, "Failed to parse cert chain; stat: %d", (uint8_t *)v2, 8u);
  sub_21450605C();
}

void sub_21456C598()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "CTParseCertificateSet parse failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456C5C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to create certificatePEM", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456C5F0(uint64_t a1, NSObject *a2)
{
  int v2;
  const __CFString *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = CFSTR("RCSn");
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_214503000, a2, OS_LOG_TYPE_ERROR, "Unable to get property %@: %@", (uint8_t *)&v2, 0x16u);
  sub_214507E8C();
}

void sub_21456C674()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Unable to _addDataClassAndInstanceToMutableArray:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456C6D4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_214503000, log, OS_LOG_TYPE_ERROR, "Failed to alloc resources", v1, 2u);
}

void sub_21456C714()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Failed to copy sealed dataclasses and instances: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456C774()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Invalid AMAI object", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456C7A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to allocate Personalization IDs", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456C7CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Invalid CRPersonalizationElementIds", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456C7F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Empty measurementDict", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456C824()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to create response dict", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456C850()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to create request dict", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456C87C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Invalid inputs", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456C8A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Can't allocate CFURL", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456C8D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "unable to fetch PDI domain nonce", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456C900()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "bad AP img4 parameters", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456C92C(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_214503000, a2, OS_LOG_TYPE_ERROR, "failed to copy nonce: error %d", (uint8_t *)v2, 8u);
  sub_21450605C();
}

void sub_21456C99C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_214503000, a2, OS_LOG_TYPE_ERROR, "failed to set signing server URL to \"%@\"", (uint8_t *)&v2, 0xCu);
}

void sub_21456CA10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Parameters Invalid", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456CA3C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Process is not entitled to perform addCustomPersonalizationElementWithId", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456CA68()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to set SSO token", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456CA94()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to enable single sign on", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456CAC0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed load SSOClient.framework", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456CAEC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "SSO not available", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456CB18(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_214503000, log, OS_LOG_TYPE_ERROR, "Invalid time parameters", v1, 2u);
}

void sub_21456CB58(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450603C(&dword_214503000, a1, a3, "Cannot serialize boot intent dictionary, abort", a5, a6, a7, a8, 0);
  sub_21450605C();
}

void sub_21456CB88(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_214503000, a2, OS_LOG_TYPE_ERROR, "JSON serialization got an error: %@", (uint8_t *)&v2, 0xCu);
  sub_214507E8C();
}

void sub_21456CBF8(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_214503000, a2, OS_LOG_TYPE_ERROR, "Reboot failed with error:%d", (uint8_t *)v2, 8u);
  sub_21450605C();
}

void sub_21456CC68()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_214525A3C();
  sub_21453A7D4(&dword_214503000, v0, v1, "Set %@ failed with error %@", v2, v3, v4, v5, 2u);
  sub_214507E8C();
}

void sub_21456CCD4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_214525A3C();
  sub_21453A7D4(&dword_214503000, v0, v1, "Set %@ failed with error %@", v2, v3, v4, v5, 2u);
  sub_214507E8C();
}

void sub_21456CD40(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450603C(&dword_214503000, a1, a3, "Failed to enable SSO", a5, a6, a7, a8, 0);
  sub_21450605C();
}

void sub_21456CD70()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_214525A3C();
  sub_21453A7D4(&dword_214503000, v0, v1, "Clear %@ failed:%@", v2, v3, v4, v5, 2u);
  sub_214507E8C();
}

void sub_21456CDDC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_214525A3C();
  sub_21453A7D4(&dword_214503000, v0, v1, "Clear %@ failed:%@", v2, v3, v4, v5, 2u);
  sub_214507E8C();
}

void sub_21456CE48(void **a1, NSObject *a2)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_214503000, a2, OS_LOG_TYPE_ERROR, "Unable to read Roswel identifier:%@", (uint8_t *)&v3, 0xCu);

}

void sub_21456CECC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Invalid Params and Nonce", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456CEF8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Unable to create sha256hash of nonce", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456CF24()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507EB0(*MEMORY[0x24BDAC8D0]);
  sub_214507EA4();
  sub_21450604C(&dword_214503000, v0, v1, "Local sealing manifest populate failed, error = %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456CF84()
{
  uint64_t v0;
  os_log_t v1;

  sub_21453E31C();
  sub_21451F7BC(&dword_214503000, v0, v1, "Failed to verify local %@ data; error: %@");
  sub_214507E8C();
}

void sub_21456CFE8()
{
  uint64_t v0;
  os_log_t v1;

  sub_21453E31C();
  sub_21451F7BC(&dword_214503000, v0, v1, "Failed to read local %@ data; error: %@");
  sub_214507E8C();
}

void sub_21456D04C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Cannot copy %@ data from device", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456D0AC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450B8AC(&dword_214503000, a2, a3, "Failed to get payload; stat: %d", a5, a6, a7, a8, 0);
  sub_21450605C();
}

void sub_21456D110(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450B8AC(&dword_214503000, a2, a3, "Failed to parse cert as img4; stat: %d", a5, a6, a7, a8, 0);
  sub_21450605C();
}

void sub_21456D174()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Data class is nil", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456D1A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507EB0(*MEMORY[0x24BDAC8D0]);
  sub_214507EA4();
  sub_21450604C(&dword_214503000, v0, v1, "Failed to get DataInstance:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456D200()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507EB0(*MEMORY[0x24BDAC8D0]);
  sub_214507EA4();
  sub_21450604C(&dword_214503000, v0, v1, "Copy manifest data failed, error = %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456D260()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456D2C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Local Sealing manifest fetch failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456D2EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "DataInstances and Classes count mismatch", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456D318()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to read EAN", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456D344(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_localizedDescription(a1, a2, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2145096A8();
  _os_log_error_impl(&dword_214503000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "%@", v6, 0xCu);

  sub_2145122AC();
}

void sub_21456D3CC()
{
  void *v0;
  uint64_t v1;
  os_log_t v2;

  sub_21453E334();
  sub_21453E304();
  sub_21451F7BC(&dword_214503000, v1, v2, "Failed to read sealed property of %@: %@");

  sub_2145122AC();
}

void sub_21456D434()
{
  void *v0;
  uint64_t v1;
  os_log_t v2;

  sub_21453E334();
  sub_21453E304();
  sub_21451F7BC(&dword_214503000, v1, v2, "Failed to read live property of %@: %@");

  sub_2145122AC();
}

void sub_21456D49C()
{
  void *v0;
  uint64_t v1;
  os_log_t v2;

  sub_21453E334();
  sub_21453E304();
  sub_21451F7BC(&dword_214503000, v1, v2, "Failed to read sealed instances of %@: %@");

  sub_2145122AC();
}

void sub_21456D504()
{
  void *v0;
  uint64_t v1;
  os_log_t v2;

  sub_21453E334();
  sub_21453E304();
  sub_21451F7BC(&dword_214503000, v1, v2, "Failed to read live instances of %@: %@");

  sub_2145122AC();
}

void sub_21456D56C(void **a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v8;

  v8 = *a1;
  sub_21450604C(&dword_214503000, a2, a3, "Failed to read live sensor number, error: %@", a5, a6, a7, a8, 2u);

  sub_2145122AC();
}

void sub_21456D5DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to create amfdr", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456D608()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to create property value string", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456D634()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to get 'SrvT' property", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456D660()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to read seal data", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456D68C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "No EAN support.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456D6B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to create fdrLocal", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456D6E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507EB0(*MEMORY[0x24BDAC8D0]);
  sub_214507EA4();
  sub_21450604C(&dword_214503000, v0, v1, "Failed to get local manifest properties, error: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456D744(uint64_t a1, NSObject *a2)
{
  int v2;
  const __CFString *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = CFSTR("/var/hardware/Pearl");
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_214503000, a2, OS_LOG_TYPE_ERROR, "Failed to delete directory %@, error: %@", (uint8_t *)&v2, 0x16u);
  sub_214507E8C();
}

void sub_21456D7C8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, "Failed to delete Yonkers.fw, error: %@", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_21456D82C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, "Failed to delete Savage.fw, error: %@", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_21456D890()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Get osBootHash failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456D8BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Get prebootPath failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456D8E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Get customAMAuthInstallRef failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456D914()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Create optionsDict failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456D940()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Create updaterOptions failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456D96C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Get Brunor ticket failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456D998(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, "powerCycleSensor failed with error: %@", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_21456D9FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Get Yonkers ticket failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456DA28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to enable SSO", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456DA54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507EB0(*MEMORY[0x24BDAC8D0]);
  sub_214507EA4();
  sub_21450604C(&dword_214503000, v0, v1, "Failed to get local psd3, error: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456DAB4(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_214503000, a2, OS_LOG_TYPE_ERROR, "Failed to verify psd3, pearlStatus: %d", (uint8_t *)v2, 8u);
  sub_21450605C();
}

void sub_21456DB24()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Can not archive the data", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456DB50()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to encrypt data", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456DB7C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Invalid input encrypted credentials string", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456DBA8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to decrypt data", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456DBD4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_214503000, a2, OS_LOG_TYPE_DEBUG, "The WiFi info decoded from encrypted credentials: %@", (uint8_t *)&v2, 0xCu);
}

void sub_21456DC48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Invalid Inputs", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456DC74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to get file handle", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456DCA0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, "Unable to getClaimDataClasses:%@", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_21456DD04(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, "Unable to fetch drp#:%@", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_21456DD68(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_214503000, a2, OS_LOG_TYPE_ERROR, "Failed to get component state: %@", (uint8_t *)&v2, 0xCu);
}

void sub_21456DDDC(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_214503000, a2, OS_LOG_TYPE_ERROR, "Failed to get component for %d", (uint8_t *)v2, 8u);
}

void sub_21456DE50(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450603C(&dword_214503000, a1, a3, "Invalid Inputs", a5, a6, a7, a8, 0);
}

void sub_21456DE84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "prefetchPermissions failed:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456DEE4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Staged Claim failed:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456DF44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Local patch failed, error: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456DFA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Sealing failed, error: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456E004()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Post Sealing Stage Failed.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456E030()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Get all local patch data failed, error: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456E090()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Remote Recover failed:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456E0F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Staged Make failed:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456E150()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Additional UPDATE properties is not allowed when transit between real and staged sealing", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456E17C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Additional PATCH is not allowed when transit between real and staged sealing", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456E1A8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_214507E94(&dword_214503000, a1, a3, "entering %s ...", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_21456E218()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Local FDR data not verified, staged data might be corrupted", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456E244(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_214507E94(&dword_214503000, a1, a3, "entering %s ...", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_21456E2B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "amfdr options is NULL", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456E2E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "AMFDR Get 1.0 Failed: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456E340()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Stage data commit failed: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456E3A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Unable to create LocalAndRemotePermission for Sealing", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456E3CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "AMFDRMigrateCredentials for Sealing error: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456E42C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "AMFDRPermisisonRequest for Sealing error: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456E48C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "AMFDRDataAppendPermissionsString Patch failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456E4B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "AMFDRDataAppendPermissionsString GET 1.0 failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456E4E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Perform staged CLAIM failed.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456E510()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Perform staged MAKE failed.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456E53C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "make classes and instances count mismatched", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456E568()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Partial Sealing Failed:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456E5C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Staged seal failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456E5F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Response Dictionary Empty", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456E620()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Ap ticket not found in response", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456E64C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "failed to create CFDataRef of the digest", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456E678()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Fail to get property in AP ticket", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456E6A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Fail parsing AP ticket", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456E6D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "ImageProperties creation failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456E6FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to read apTicketPath", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456E728()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to read apTicketdata", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456E754()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "failed to parse OS version Data\n", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456E780()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "failed to parse sepi digest\n", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456E7AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_21454A69C();
  sub_214523DE4(&dword_214503000, v0, v1, "Img4DecodeGetObjectPropertyData failed get sepi digest with code %d (0x%X)", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456E80C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_21454A69C();
  sub_214523DE4(&dword_214503000, v0, v1, "Img4DecodeInitManifest failed get LOVE with code %d (0x%X)", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456E86C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "failed to parse AP ticket as Img4 manifest\n", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456E898()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Input PDI path nil", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456E8C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Fail to generate SEP Nonce", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456E8F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "failed to generate digest", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456E91C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to create Image Properties", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456E948()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "UpdaterOptions Empty", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456E974()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Error creating build identity dictionary:", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456E9A0()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_21454A6C0();
  sub_21454A6B4();
  sub_21450604C(&dword_214503000, v1, v2, "Error copying firmware: %@", v3, v4, v5, v6, v7);

  sub_2145122AC();
}

void sub_21456EA08()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_21454A6C0();
  sub_21454A6B4();
  sub_21450604C(&dword_214503000, v1, v2, "Error creating measurement Dictionary: %@", v3, v4, v5, v6, v7);

  sub_2145122AC();
}

void sub_21456EA70()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "failed to parse sepi DGST\n", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456EA9C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to read firmware path", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456EAC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to parse sepi DGST", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456EAF4()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_21454A6C0();
  sub_21454A6B4();
  sub_21450604C(&dword_214503000, v1, v2, "Failed to get tags, error: %@", v3, v4, v5, v6, v7);

  sub_2145122AC();
}

void sub_21456EB5C()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_21454A6C0();
  sub_21454A6B4();
  sub_21450604C(&dword_214503000, v1, v2, "Failed to copy firmware: %@", v3, v4, v5, v6, v7);

  sub_2145122AC();
}

void sub_21456EBC4()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_21454A6C0();
  sub_21454A6B4();
  sub_21450604C(&dword_214503000, v1, v2, "Failed to create measurement dictionary: %@", v3, v4, v5, v6, v7);

  sub_2145122AC();
}

void sub_21456EC2C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, "Failed to get patch data at: %@", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_21456EC90()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_21454A69C();
  sub_214523DE4(&dword_214503000, v0, v1, "Img4DecodeInitManifest failed get trust object digest with code %d (0x%X)", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456ECF0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to parse AP ticket as Img4 manifest", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456ED1C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Savage ticket not found in response", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456ED48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to read deviceInfo, fabRevision and productionMode", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456ED74(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, "get tags failed:%@", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_21456EDDC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Create CRUtils failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456EE08()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Yonkers ticket not found in response", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456EE34()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to generate SeaCookieKeyIdentifier", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456EE60()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to populate restoreSEPProperties", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456EE8C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "override options was not found", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456EEB8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "SEP digest not found from override options", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456EEE4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "SEP nonce not found from override options", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456EF10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Brunor ticket not found in response", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456EF3C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "options Empty", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456EF68()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "updaterOptions missing", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456EF94()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "auth missing", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456EFC0()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_21454A6C0();
  sub_21454A6B4();
  sub_21450604C(&dword_214503000, v1, v2, "Error get updater tags: %@", v3, v4, v5, v6, v7);

  sub_2145122AC();
}

void sub_21456F028()
{
  uint64_t v0;
  os_log_t v1;

  sub_2145096A8();
  sub_21451F7BC(&dword_214503000, v0, v1, "Failed to fetch dataInstance:%@:%@");
  sub_214507E8C();
}

void sub_21456F098()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "AMFDRSealingMapCopyMultiInstanceForClass failed, error: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456F0F8(uint64_t a1, void **a2, NSObject *a3)
{
  void *v3;
  _BYTE v4[24];

  v3 = *a2;
  *(_DWORD *)v4 = 138412546;
  *(_QWORD *)&v4[4] = a1;
  *(_WORD *)&v4[12] = 2112;
  *(_QWORD *)&v4[14] = *a2;
  sub_21451F7BC(&dword_214503000, (uint64_t)a2, a3, "Failed to fetch dataInstance:%@:%@", *(_QWORD *)v4, *(_QWORD *)&v4[8], *(_QWORD *)&v4[16]);

}

void sub_21456F17C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "can't get DataClass using componentName:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456F1DC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, "Failed to get DataInstance:%@", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_21456F244()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "sealingMap is invalid", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456F270()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to get product type", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456F29C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a1, a3, "Remote sealing manifest populate failed: %@", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_21456F304()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Could not get Sealed Data Instance:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456F364()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Sealing manifest parse failed: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456F3C4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, "Remote sealing manifest populate failed: %@", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_21456F42C()
{
  uint64_t v0;
  os_log_t v1;

  sub_21451F7D0();
  sub_21451F7BC(&dword_214503000, v0, v1, "Invalid patch data %@-%@ for this device");
  sub_214507E8C();
}

void sub_21456F48C()
{
  uint64_t v0;
  os_log_t v1;

  sub_21451F7D0();
  sub_21451F7BC(&dword_214503000, v0, v1, "Invalid patch 4cc %@ for patch class %@");
  sub_214507E8C();
}

void sub_21456F4EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Invalid patch data class %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456F54C()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  sub_2145096A8();
  _os_log_debug_impl(&dword_214503000, v0, OS_LOG_TYPE_DEBUG, "Expected Patch Info: %@", v1, 0xCu);
  sub_214507E8C();
}

void sub_21456F5B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Invalid patch values count", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456F5E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Invalid patch data instances count", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456F610()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Missing required patch info", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456F63C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Patch not supported.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456F668()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Missing valid data/instance", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456F694(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_214503000, log, OS_LOG_TYPE_ERROR, "Failed to alloc resources", buf, 2u);
}

void sub_21456F6D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to alloc resources", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456F6FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "SN are same and last sealing date is %ld days ago.", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456F75C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "decode time tag error", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456F788()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "time data in sealing manifest corrupted", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456F7B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "no time tag found", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456F7E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "failed to decode sealing manifest data", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456F80C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "failed to decode sealing manifest", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456F838()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Could not create URL for FDR recovery data storage", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456F864()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Unable to get handler for device", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456F890()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Unable to copy the APTicket path. %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456F8F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Unable to read APTicket:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456F950()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "updateProperties validation failed.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456F97C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "patchValues validation failed.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456F9A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "patchDataInstances validation failed.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456F9D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "patchDataClasses validation failed.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456FA00()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "allowSelfService validation failed.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456FA2C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "allowUsedPart validation failed.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456FA58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "skipStageEAN validation failed.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456FA84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "ignoreStagedData validation failed.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456FAB0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "enableStagedSeal validation failed.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456FADC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "enableProxy validation failed.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456FB08()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "KeyBlob validation failed.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456FB34()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Failed to map %@ to FDR data class", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456FB94()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Unable to get ClaimDataClasses:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456FBF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Could not create AMFDR options local", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456FC20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Could not create AMFDR options remote", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456FC4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Could not create AMFDR local", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456FC78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Could not create AMFDR remote", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456FCA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Set local and remote trust object failed: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456FD04()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "getCurrentManifestDataClassesAndInstancesWithPartSPC failed: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456FD64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Verification failed: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456FDC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "queryDeviceStagedSealedFromEAN failed: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456FE24()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Patch validation failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456FE50()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to get final merged data", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456FE7C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "getMinimalManifestsClassesAndInstancesWithPartSPC failed: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456FEDC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "getMakeDataClassesAndInstancesWithPartSPC failed: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456FF3C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "getUpdateDataClassesAndInstancesWithPartSPC failed: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21456FF9C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Serial number validation failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456FFC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "can't allocation options dictionary", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21456FFF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "can't get ecid", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214570020()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Unexpected NULL value returned from SecTaskCreateFromSelf()", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21457004C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "AMFDRDataCreatePermissionsString failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214570078()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "AMFDRPermisisonRequest error: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_2145700D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Could not query MobileGestalt for data class: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214570138()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "ClaimedData PUT Failed:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214570198()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "HTTP Challenge Claim Failed:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_2145701F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Failed to get date from cert with %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214570258(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  double v6;
  int v7;
  void *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_timeIntervalSinceReferenceDate(a1, a2, a3, a4);
  v7 = 138412546;
  v8 = a1;
  v9 = 1024;
  v10 = (int)v6;
  _os_log_debug_impl(&dword_214503000, (os_log_t)a2, OS_LOG_TYPE_DEBUG, "dateToWrite is %@ (%d) ", (uint8_t *)&v7, 0x12u);
  sub_214558890();
}

void sub_2145702F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to personalize with empty trust object digest", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21457031C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Remote trust object not found", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214570348()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to get digest of remote trust object", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214570374()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "apTrustObjectDigest from apTicket is NULL", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_2145703A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to fetch remote trust object", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_2145703CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "No SSL Root found in trust object :%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_21457042C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "permisisons is NULL", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214570458()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_214507EB0(*MEMORY[0x24BDAC8D0]);
  sub_214558864();
  sub_214558880(&dword_214503000, v0, v1, "Failed to append permissions string with data class '%@', data instance '%@', action '%d'", v2, v3, v4, v5, 2u);
  sub_214558890();
}

void sub_2145704CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_214507EB0(*MEMORY[0x24BDAC8D0]);
  sub_214558864();
  sub_214558880(&dword_214503000, v0, v1, "Failed to append permissions string with data class '%@', data instance '%@', action '%d'", v2, v3, v4, v5, 2u);
  sub_214558890();
}

void sub_21457053C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "No patch info, skipping.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214570568()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Missing patch options", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214570594()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Failed to copy local data, error: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_2145705F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "AMFDRDataMultiPatch failed, error: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214570654()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "AMFDRDataMultiCommitPatch failed, error: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_2145706B4(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_214558854(a1, a2);
  sub_214529DEC(&dword_214503000, v2, (uint64_t)v2, "Failed to get data from patched data", v3);
}

void sub_2145706E0(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_214558854(a1, a2);
  sub_214529DEC(&dword_214503000, v2, (uint64_t)v2, "Failed to commit patched data to local", v3);
}

void sub_21457070C(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_214558854(a1, a2);
  sub_214529DEC(&dword_214503000, v2, (uint64_t)v2, "Failed to delete old data", v3);
}

void sub_214570738()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Failed to migrate credentials to remote patch amfdr, error: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214570798(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  sub_214558854(a1, a2);
  sub_214529DEC(&dword_214503000, v2, (uint64_t)v2, "Failed to get data from copied data", v3);
}

void sub_2145707C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Invalid patch data count", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_2145707F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Failed to migrate credentials to local patch amfdr, error: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214570850()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507EB0(*MEMORY[0x24BDAC8D0]);
  sub_214507EA4();
  sub_21450604C(&dword_214503000, v0, v1, "Unable to get SealingManifest:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_2145708B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Can't read fdr factory data path; error: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214570910(uint64_t a1, NSObject *a2)
{
  int v2;
  const __CFString *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = CFSTR("40A0DDD2-77F8-4392-B4A3-1E7304206516:IsServicePart");
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_214503000, a2, OS_LOG_TYPE_ERROR, "Fail to delete key: %@. Error: %@", (uint8_t *)&v2, 0x16u);
  sub_214507E8C();
}

void sub_214570994()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to sync alternative FDR path", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_2145709C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to commit data to FS", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_2145709EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "stageFDREANWithApTicket failed:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214570A4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "setupVersionedFDRWithApTicket failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214570A78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "AMFDRSealedDataRestoreOptions failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214570AA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507EB0(*MEMORY[0x24BDAC8D0]);
  sub_214507EA4();
  sub_21450604C(&dword_214503000, v0, v1, "AMFDRSealedDataCommit with amfdrLocal failed. Data Recovery failed:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214570B04()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507EB0(*MEMORY[0x24BDAC8D0]);
  sub_214507EA4();
  sub_21450604C(&dword_214503000, v0, v1, "Local sealingManifestData is NULL:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214570B64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Local data verification failed:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214570BC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507EB0(*MEMORY[0x24BDAC8D0]);
  sub_214507EA4();
  sub_21450604C(&dword_214503000, v0, v1, "Post SealingManifest parse failed:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214570C24()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507EB0(*MEMORY[0x24BDAC8D0]);
  sub_214507EA4();
  sub_21450604C(&dword_214503000, v0, v1, "Local SealingManifest populate failed:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214570C84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "FDR Data Populated failed: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214570CE4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "sealedData->sealingRequest is NULL. Sealing failed.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214570D10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507EB0(*MEMORY[0x24BDAC8D0]);
  sub_214507EA4();
  sub_21450604C(&dword_214503000, v0, v1, "Signing failed:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214570D70()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "sealedData->sealingManifest is NULL. Sealing failed.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214570D9C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Commit Sealeddata Failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214570DC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "SealedDataClearSealingManifests failed", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214570DF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507EB0(*MEMORY[0x24BDAC8D0]);
  sub_214507EA4();
  sub_21450604C(&dword_214503000, v0, v1, "AMFDRSealedDataCreateSealingRequest failed. Sealing failed:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214570E54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507EB0(*MEMORY[0x24BDAC8D0]);
  sub_214507EA4();
  sub_21450604C(&dword_214503000, v0, v1, "Unable to put data locally: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214570EB4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Unable to create dataClassesforPut & dataInstancesforPut", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214570EE0(uint8_t *a1, void *a2, uint64_t *a3, NSObject *a4)
{
  uint64_t v7;

  v7 = objc_msgSend_numberOfRanges(a2, (const char *)a2, (uint64_t)a3, (uint64_t)a4);
  *(_DWORD *)a1 = 134217984;
  *a3 = v7;
  _os_log_debug_impl(&dword_214503000, a4, OS_LOG_TYPE_DEBUG, "number of ranges:%ld", a1, 0xCu);
}

void sub_214570F48()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  sub_2145096A8();
  _os_log_debug_impl(&dword_214503000, v0, OS_LOG_TYPE_DEBUG, "Commit data: %@", v1, 0xCu);
  sub_214507E8C();
}

void sub_214570FB4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to create sealedData. Data Recovery failed.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214570FE0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Local property verification failed:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214571040()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to versioned FDRData commit", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21457106C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to write to EAN", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214571098()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507EB0(*MEMORY[0x24BDAC8D0]);
  sub_214507EA4();
  sub_21450604C(&dword_214503000, v0, v1, "AMFDRSealedDataPopulate failed with fatal error: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_2145710F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507EB0(*MEMORY[0x24BDAC8D0]);
  sub_214507EA4();
  sub_21450604C(&dword_214503000, v0, v1, "AMFDRSealedDataPopulate with local failed:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214571158()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507EB0(*MEMORY[0x24BDAC8D0]);
  sub_214507EA4();
  sub_21450604C(&dword_214503000, v0, v1, "AMFDRSealedDataSetMinimalManifestClassInstance failed with error: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_2145711B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507EB0(*MEMORY[0x24BDAC8D0]);
  sub_214507EA4();
  sub_21450604C(&dword_214503000, v0, v1, "AMFDRSealedDataSetDataClassInstance failed with error: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214571218()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507EB0(*MEMORY[0x24BDAC8D0]);
  sub_214507EA4();
  sub_21450604C(&dword_214503000, v0, v1, "AMFDRSealedDataConfigureOptionsForRecover failed:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214571278()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507EB0(*MEMORY[0x24BDAC8D0]);
  sub_214507EA4();
  sub_21450604C(&dword_214503000, v0, v1, "AMFDRSealingMapConfigSealedData failed:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_2145712D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "AMFDRSealedDataConfigureOptionsForRecover failed.", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214571304()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507EB0(*MEMORY[0x24BDAC8D0]);
  sub_214507EA4();
  sub_21450604C(&dword_214503000, v0, v1, "AMFDRSealedDataCommit with amfdrLocal failed. Data Recovery failed: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214571364()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507EB0(*MEMORY[0x24BDAC8D0]);
  sub_214507EA4();
  sub_21450604C(&dword_214503000, v0, v1, "AMFDRSealedDataPopulateWithExistingData failed:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_2145713C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Could not get options entry from the device tree", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_2145713F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Could not read value", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_21457141C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Could not get main port", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214571448(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450B8AC(&dword_214503000, a2, a3, "Could not save value:%08x\n", a5, a6, a7, a8, 0);
  sub_21450605C();
}

void sub_2145714AC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450B8AC(&dword_214503000, a2, a3, "Could not delete value:%08x\n", a5, a6, a7, a8, 0);
  sub_21450605C();
}

void sub_214571510(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_214503000, log, OS_LOG_TYPE_ERROR, "Failed to create FDR object", v1, 2u);
}

void sub_214571550(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, "Properties fetch failed:%@", a5, a6, a7, a8, 2u);
}

void sub_2145715B8(uint64_t a1, const char *a2, NSObject *a3, uint64_t a4)
{
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_componentType(*(void **)(a1 + 32), a2, (uint64_t)a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_214503000, a3, OS_LOG_TYPE_ERROR, "Challenge Failed:%@:%@", (uint8_t *)&v7, 0x16u);

}

void sub_214571668(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450604C(&dword_214503000, a2, a3, "Unable to get Identifier:%@", a5, a6, a7, a8, 2u);
}

void sub_2145716D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "HTTP Challenge Claim failed:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214571730()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Remote patch failed, error: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214571790()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Remote Recover failed:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_2145717F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Remote Make failed:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214571850(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_214507E94(&dword_214503000, a1, a3, "entering %s ...", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_2145718C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Local FDR data not verified, staged data might be corrupted", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_2145718EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Local data not verified anymore after make and remote patch", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214571918()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Get all local patch data failed, error: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214571978()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Additional UPDATE properties is not allowed when transit between real and staged sealing", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_2145719A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Additional PATCH is not allowed when transit between real and staged sealing", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_2145719D0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_214507E94(&dword_214503000, a1, a3, "entering %s ...", a5, a6, a7, a8, 2u);
  sub_214507E8C();
}

void sub_214571A40()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "AMFDR make Failed: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214571AA0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Make data commit failed: %@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214571B00()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "make classes and instances count mismatched", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214571B2C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2145096A8();
  sub_21450604C(&dword_214503000, v0, v1, "Partial Sealing Failed:%@", v2, v3, v4, v5, v6);
  sub_214507E8C();
}

void sub_214571B8C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Generated initialization vector is nil", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214571BB8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Generated encryption key is nil", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214571BE4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450B8AC(&dword_214503000, a2, a3, "Encryption failed: %d", a5, a6, a7, a8, 0);
  sub_21450605C();
}

void sub_214571C48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Unable to allocate return crypto CFData", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214571C74(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450B8AC(&dword_214503000, a2, a3, "cchkdf error: %d", a5, a6, a7, a8, 0);
  sub_21450605C();
}

void sub_214571CD8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "The length of encrypted data is too short", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214571D04(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_21450B8AC(&dword_214503000, a2, a3, "Decryption failed: %d", a5, a6, a7, a8, 0);
  sub_21450605C();
}

void sub_214571D68()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Failed to allocate aligned crypto buffer\n", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214571D94()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Invalid Params and Nonce", v2, v3, v4, v5, v6);
  sub_21450605C();
}

void sub_214571DC0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_214507E80();
  sub_21450603C(&dword_214503000, v0, v1, "Unable to create sha256hash of nonce", v2, v3, v4, v5, v6);
  sub_21450605C();
}

uint64_t AMAuthInstallApCreatePersonalizedResponse()
{
  return MEMORY[0x24BEDA688]();
}

uint64_t AMAuthInstallApImg4ForceServerSigning()
{
  return MEMORY[0x24BEDA698]();
}

uint64_t AMAuthInstallApImg4ServerRequestAddRequiredTags()
{
  return MEMORY[0x24BEDA6B0]();
}

uint64_t AMAuthInstallApSetParameters()
{
  return MEMORY[0x24BEDA6B8]();
}

uint64_t AMAuthInstallCreate()
{
  return MEMORY[0x24BEDA6C8]();
}

uint64_t AMAuthInstallLogSetHandler()
{
  return MEMORY[0x24BEDA6D0]();
}

uint64_t AMAuthInstallSetSOCKSProxyInformation()
{
  return MEMORY[0x24BEDA6E8]();
}

uint64_t AMAuthInstallSetSigningServerURL()
{
  return MEMORY[0x24BEDA6F0]();
}

uint64_t AMAuthInstallSsoEnable()
{
  return MEMORY[0x24BEDA6F8]();
}

uint64_t AMAuthInstallSsoInitialize()
{
  return MEMORY[0x24BEDA700]();
}

uint64_t AMAuthInstallSsoSetToken()
{
  return MEMORY[0x24BEDA708]();
}

uint64_t AMAuthInstallSupportGetLibraryVersionString()
{
  return MEMORY[0x24BEDA720]();
}

uint64_t AMFDRAppendPermissionsString()
{
  return MEMORY[0x24BED4130]();
}

uint64_t AMFDRCreatePermissionsString()
{
  return MEMORY[0x24BED4148]();
}

uint64_t AMFDRCreateTypeWithOptions()
{
  return MEMORY[0x24BED4150]();
}

uint64_t AMFDRCreateWithOptions()
{
  return MEMORY[0x24BED4158]();
}

uint64_t AMFDRDataApTicketCopyObjectProperty()
{
  return MEMORY[0x24BED4160]();
}

uint64_t AMFDRDataAppendPermissionsString()
{
  return MEMORY[0x24BED4170]();
}

uint64_t AMFDRDataCopy()
{
  return MEMORY[0x24BED4178]();
}

uint64_t AMFDRDataCopyManifest()
{
  return MEMORY[0x24BED4180]();
}

uint64_t AMFDRDataCopySealingManifestProperty()
{
  return MEMORY[0x24BED4188]();
}

uint64_t AMFDRDataCopySslRoots()
{
  return MEMORY[0x24BED4190]();
}

uint64_t AMFDRDataCopyTrustObject()
{
  return MEMORY[0x24BED4198]();
}

uint64_t AMFDRDataCreatePermissionsString()
{
  return MEMORY[0x24BED41A0]();
}

uint64_t AMFDRDataCreateSikInstanceString()
{
  return MEMORY[0x24BED41A8]();
}

uint64_t AMFDRDataDecodeAndSetSealingManifest()
{
  return MEMORY[0x24BED41B0]();
}

uint64_t AMFDRDataDelete()
{
  return MEMORY[0x24BED41B8]();
}

uint64_t AMFDRDataDictCopy()
{
  return MEMORY[0x24BED41C0]();
}

uint64_t AMFDRDataHTTPChallengeClaim()
{
  return MEMORY[0x24BED41C8]();
}

uint64_t AMFDRDataLocalCreateFullKey()
{
  return MEMORY[0x24BED41D0]();
}

uint64_t AMFDRDataMultiCommitPatch()
{
  return MEMORY[0x24BED41D8]();
}

uint64_t AMFDRDataMultiCopy()
{
  return MEMORY[0x24BED41E0]();
}

uint64_t AMFDRDataMultiMake()
{
  return MEMORY[0x24BED41E8]();
}

uint64_t AMFDRDataMultiPatch()
{
  return MEMORY[0x24BED41F0]();
}

uint64_t AMFDRDataMultiPut()
{
  return MEMORY[0x24BED41F8]();
}

uint64_t AMFDRDataPut()
{
  return MEMORY[0x24BED4200]();
}

uint64_t AMFDRDataPutWithOptions()
{
  return MEMORY[0x24BED4210]();
}

uint64_t AMFDRGetCert()
{
  return MEMORY[0x24BED4218]();
}

uint64_t AMFDRGetOptions()
{
  return MEMORY[0x24BED4220]();
}

uint64_t AMFDRGetSealingMap()
{
  return MEMORY[0x24BED4228]();
}

uint64_t AMFDRLogSetHandler()
{
  return MEMORY[0x24BED4238]();
}

uint64_t AMFDRMigrateCredentials()
{
  return MEMORY[0x24BED4240]();
}

uint64_t AMFDRPermissionsRequest()
{
  return MEMORY[0x24BED4250]();
}

uint64_t AMFDRRegisterModuleChallengeCallback()
{
  return MEMORY[0x24BED4258]();
}

uint64_t AMFDRSealedDataClearSealingManifest()
{
  return MEMORY[0x24BED4260]();
}

uint64_t AMFDRSealedDataCommit()
{
  return MEMORY[0x24BED4268]();
}

uint64_t AMFDRSealedDataConfigureOptionsForRecover()
{
  return MEMORY[0x24BED4270]();
}

uint64_t AMFDRSealedDataCreateSealingRequest()
{
  return MEMORY[0x24BED4278]();
}

uint64_t AMFDRSealedDataGetSealingManifest()
{
  return MEMORY[0x24BED4280]();
}

uint64_t AMFDRSealedDataGetSealingRequest()
{
  return MEMORY[0x24BED4288]();
}

uint64_t AMFDRSealedDataHTTPSign()
{
  return MEMORY[0x24BED4290]();
}

uint64_t AMFDRSealedDataPopulate()
{
  return MEMORY[0x24BED4298]();
}

uint64_t AMFDRSealedDataPopulateWithExistingData()
{
  return MEMORY[0x24BED42A0]();
}

uint64_t AMFDRSealedDataRestoreOptions()
{
  return MEMORY[0x24BED42A8]();
}

uint64_t AMFDRSealedDataSetDataClassInstance()
{
  return MEMORY[0x24BED42B0]();
}

uint64_t AMFDRSealedDataSetMinimalManifestClassInstance()
{
  return MEMORY[0x24BED42B8]();
}

uint64_t AMFDRSealedDataVerificationErrorIsBenign()
{
  return MEMORY[0x24BED42C0]();
}

uint64_t AMFDRSealedDataVerify()
{
  return MEMORY[0x24BED42C8]();
}

uint64_t AMFDRSealingManifestCopyDataClassesInstancesAndProperties()
{
  return MEMORY[0x24BED42D0]();
}

uint64_t AMFDRSealingManifestCopyInstanceForClass()
{
  return MEMORY[0x24BED42D8]();
}

uint64_t AMFDRSealingManifestCopyLocalDataForClass()
{
  return MEMORY[0x24BED42E0]();
}

uint64_t AMFDRSealingManifestCopyMinimalManifestClassesAndInstances()
{
  return MEMORY[0x24BED42E8]();
}

uint64_t AMFDRSealingManifestCopyMultiInstanceForClass()
{
  return MEMORY[0x24BED42F0]();
}

uint64_t AMFDRSealingManifestCreateSealedData()
{
  return MEMORY[0x24BED42F8]();
}

uint64_t AMFDRSealingMapCallMGCopyAnswer()
{
  return MEMORY[0x24BED4300]();
}

uint64_t AMFDRSealingMapConfigSealedData()
{
  return MEMORY[0x24BED4308]();
}

uint64_t AMFDRSealingMapCopyAssemblyIdentifierForClass()
{
  return MEMORY[0x24BED4310]();
}

uint64_t AMFDRSealingMapCopyInstanceForClass()
{
  return MEMORY[0x24BED4318]();
}

uint64_t AMFDRSealingMapCopyLocalData()
{
  return MEMORY[0x24BED4320]();
}

uint64_t AMFDRSealingMapCopyLocalDataForClass()
{
  return MEMORY[0x24BED4328]();
}

uint64_t AMFDRSealingMapCopyLocalDict()
{
  return MEMORY[0x24BED4330]();
}

uint64_t AMFDRSealingMapCopyManifestProperties()
{
  return MEMORY[0x24BED4340]();
}

uint64_t AMFDRSealingMapCopyManifestPropertiesForDevice()
{
  return MEMORY[0x24BED4348]();
}

uint64_t AMFDRSealingMapCopyMinimalManifestClassesAndInstances()
{
  return MEMORY[0x24BED4350]();
}

uint64_t AMFDRSealingMapCopyMultiInstanceForClass()
{
  return MEMORY[0x24BED4358]();
}

uint64_t AMFDRSealingMapCopyPropertyWithTag()
{
  return MEMORY[0x24BED4360]();
}

uint64_t AMFDRSealingMapCreateLocalMultiDataBlobForClass()
{
  return MEMORY[0x24BED4368]();
}

uint64_t AMFDRSealingMapEntryHasAttribute()
{
  return MEMORY[0x24BED4370]();
}

uint64_t AMFDRSealingMapGetEntriesForDevice()
{
  return MEMORY[0x24BED4378]();
}

uint64_t AMFDRSealingMapGetFDRDataVersionForDevice()
{
  return MEMORY[0x24BED4388]();
}

uint64_t AMFDRSealingMapPopulateSealingManifest()
{
  return MEMORY[0x24BED4390]();
}

uint64_t AMFDRSetAssemblyIdentifierToVerify()
{
  return MEMORY[0x24BED43A0]();
}

uint64_t AMFDRSetOption()
{
  return MEMORY[0x24BED43A8]();
}

uint64_t AMSupportBase64Encode()
{
  return MEMORY[0x24BED9F40]();
}

uint64_t AMSupportLogSetHandler()
{
  return MEMORY[0x24BEDA068]();
}

uint64_t AMSupportSafeFree()
{
  return MEMORY[0x24BEDA0D8]();
}

uint64_t AMSupportSafeRelease()
{
  return MEMORY[0x24BEDA0E0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C0]();
}

uint64_t CCCryptorGCMOneshotDecrypt()
{
  return MEMORY[0x24BDAC158]();
}

uint64_t CCCryptorGCMOneshotEncrypt()
{
  return MEMORY[0x24BDAC160]();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC320](data, *(_QWORD *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC360](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC368](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC370](c, data, *(_QWORD *)&len);
}

unsigned __int8 *__cdecl CC_SHA384(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC378](data, *(_QWORD *)&len, md);
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x24BDAC380](md, c);
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x24BDAC388](c);
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC390](c, data, *(_QWORD *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x24BDBBC88](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x24BDBBCC0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

void CFDataIncreaseLength(CFMutableDataRef theData, CFIndex extraLength)
{
  MEMORY[0x24BDBBD10](theData, extraLength);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x24BDBBE10](theDict, keys, values);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBE80](err);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x24BDBBEE0](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC858](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x24BDBC868](allocator, URLString, baseURL);
}

uint64_t DEREncoderAddData()
{
  return MEMORY[0x24BEDA110]();
}

uint64_t DEREncoderAddSequenceFromEncoder()
{
  return MEMORY[0x24BEDA138]();
}

uint64_t DEREncoderCreate()
{
  return MEMORY[0x24BEDA158]();
}

uint64_t DEREncoderCreateEncodedBuffer()
{
  return MEMORY[0x24BEDA160]();
}

uint64_t DEREncoderDestroy()
{
  return MEMORY[0x24BEDA168]();
}

uint64_t DeviceIdentityIssueClientCertificateWithCompletion()
{
  return MEMORY[0x24BE2C378]();
}

uint64_t DeviceIdentityValidateIdentity()
{
  return MEMORY[0x24BE2C388]();
}

uint64_t IOAccessoryManagerChallengeCryptoDock()
{
  return MEMORY[0x24BED48F8]();
}

uint64_t IOAccessoryManagerGetServiceWithPrimaryPort()
{
  return MEMORY[0x24BED4950]();
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7F00](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7F08](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x24BDD8680](*(_QWORD *)&bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

uint64_t IOPSSetBatteryDateOfFirstUse()
{
  return MEMORY[0x24BDD8878]();
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x24BDD88C0](*(_QWORD *)&mainPort, path);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x24BDD8910](*(_QWORD *)&entry, entryID);
}

kern_return_t IORegistryEntrySetCFProperties(io_registry_entry_t entry, CFTypeRef properties)
{
  return MEMORY[0x24BDD8930](*(_QWORD *)&entry, properties);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x24BDD8938](*(_QWORD *)&entry, propertyName, property);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x24BDD8990](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89B0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x24BED8488]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x24BED84B0]();
}

uint64_t MGIsDeviceOfType()
{
  return MEMORY[0x24BED84B8]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return (SCNetworkReachabilityRef)MEMORY[0x24BDF5778](allocator, nodename);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x24BDF5788](target, flags);
}

uint64_t SavageCamInterfaceClose()
{
  return MEMORY[0x24BE84168]();
}

uint64_t SavageCamInterfaceColdBootPowerCycle()
{
  return MEMORY[0x24BE84170]();
}

uint64_t SavageCamInterfaceOpen()
{
  return MEMORY[0x24BE84180]();
}

uint64_t SavageUpdaterCopyFirmwareWithLogging()
{
  return MEMORY[0x24BEE79C0]();
}

uint64_t SavageUpdaterCreate()
{
  return MEMORY[0x24BEE7C30]();
}

uint64_t SavageUpdaterCreateRequestWithLogging()
{
  return MEMORY[0x24BEE79C8]();
}

uint64_t SavageUpdaterExecCommand()
{
  return MEMORY[0x24BEE7C38]();
}

uint64_t SavageUpdaterGetTags()
{
  return MEMORY[0x24BEE79D0]();
}

uint64_t SavageUpdaterGetTagsWithLogging()
{
  return MEMORY[0x24BEE79D8]();
}

uint64_t SavageUpdaterIsDone()
{
  return MEMORY[0x24BEE7C40]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x24BDE8850](certificate);
}

uint64_t SecCertificateCopyExtensionValue()
{
  return MEMORY[0x24BDE8868]();
}

uint64_t SecCertificateCreateWithPEM()
{
  return MEMORY[0x24BDE8920]();
}

uint64_t SecCertificateGetBytePtr()
{
  return MEMORY[0x24BDE8928]();
}

uint64_t SecCertificateGetLength()
{
  return MEMORY[0x24BDE8930]();
}

uint64_t SecCertificateNotValidAfter()
{
  return MEMORY[0x24BDE8970]();
}

uint64_t SecCertificateNotValidBefore()
{
  return MEMORY[0x24BDE8978]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x24BDE8D70](allocator);
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return (CFArrayRef)MEMORY[0x24BDE8D90](trust);
}

uint64_t T200UpdaterCopyFirmwareWithLogging()
{
  return MEMORY[0x24BEE7C48]();
}

uint64_t T200UpdaterCreateRequestWithLogging()
{
  return MEMORY[0x24BEE7C50]();
}

uint64_t WiFiDeviceClientCopyCurrentNetwork()
{
  return MEMORY[0x24BE678E0]();
}

uint64_t WiFiManagerClientCopyInterfaces()
{
  return MEMORY[0x24BE679A0]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x24BE679D8]();
}

uint64_t WiFiNetworkCopyPassword()
{
  return MEMORY[0x24BE67B90]();
}

uint64_t WiFiNetworkGetSSID()
{
  return MEMORY[0x24BE67C50]();
}

uint64_t ZhuGeCopyValue()
{
  return MEMORY[0x24BE06030]();
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

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x24BDAD160](__buf, __nbytes);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x24BDAD328](__count, __size);
}

uint64_t cc_clear()
{
  return MEMORY[0x24BDAD348]();
}

uint64_t ccder_blob_decode_bitstring()
{
  return MEMORY[0x24BDAD400]();
}

uint64_t ccder_blob_decode_len()
{
  return MEMORY[0x24BDAD408]();
}

uint64_t ccder_blob_decode_range()
{
  return MEMORY[0x24BDAD418]();
}

uint64_t ccder_blob_decode_sequence_tl()
{
  return MEMORY[0x24BDAD420]();
}

uint64_t ccder_blob_decode_tag()
{
  return MEMORY[0x24BDAD428]();
}

uint64_t ccder_blob_decode_tl()
{
  return MEMORY[0x24BDAD430]();
}

uint64_t ccder_blob_decode_uint64()
{
  return MEMORY[0x24BDAD438]();
}

uint64_t ccder_blob_encode_body()
{
  return MEMORY[0x24BDAD440]();
}

uint64_t ccder_blob_encode_tl()
{
  return MEMORY[0x24BDAD460]();
}

uint64_t ccder_decode_tl()
{
  return MEMORY[0x24BDAD490]();
}

uint64_t ccder_sizeof()
{
  return MEMORY[0x24BDAD4E0]();
}

uint64_t ccec_compact_import_pub()
{
  return MEMORY[0x24BDAD560]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x24BDAD590]();
}

uint64_t ccec_cp_384()
{
  return MEMORY[0x24BDAD598]();
}

uint64_t ccec_export_pub()
{
  return MEMORY[0x24BDAD5B0]();
}

uint64_t ccec_import_pub()
{
  return MEMORY[0x24BDAD5D0]();
}

uint64_t ccec_verify()
{
  return MEMORY[0x24BDAD5F0]();
}

uint64_t cced25519_verify()
{
  return MEMORY[0x24BDAD638]();
}

uint64_t cchkdf()
{
  return MEMORY[0x24BDAD690]();
}

uint64_t ccrng()
{
  return MEMORY[0x24BDAD758]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x24BDAD828]();
}

uint64_t ccsha512_di()
{
  return MEMORY[0x24BDAD840]();
}

uint64_t cczp_bitlen()
{
  return MEMORY[0x24BDAD928]();
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x24BEDCED0](cls);
}

uint64_t copyChallengeResponse()
{
  return MEMORY[0x24BE15958]();
}

uint64_t copyFdrBlob()
{
  return MEMORY[0x24BE15960]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

fstab *__cdecl getfsfile(const char *a1)
{
  return (fstab *)MEMORY[0x24BDAE600](a1);
}

uid_t getuid(void)
{
  return MEMORY[0x24BDAE788]();
}

uint64_t img4_nonce_domain_copy_nonce()
{
  return MEMORY[0x24BEDC480]();
}

uint64_t isVeridianUpdateRequired()
{
  return MEMORY[0x24BEE7C58]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x24BDAEB58](*(_QWORD *)&error_value);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x24BDAED80](memptr, alignment, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x24BDAEEC8](__s, __smax, *(_QWORD *)&__c, __n);
}

int mount(const char *a1, const char *a2, int a3, void *a4)
{
  return MEMORY[0x24BDAEFC0](a1, a2, *(_QWORD *)&a3, a4);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerateClasses(const void *image, const char *namePrefix, Protocol *conformingTo, Class subclassing, void *block)
{
  MEMORY[0x24BEDD058](image, namePrefix, conformingTo, subclassing, block);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x24BDAF4D0]();
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x24BDAFA18](__base, __nel, __width, __compar);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x24BDAFA98](a1, a2, a3);
}

uint64_t reboot3()
{
  return MEMORY[0x24BDAFAD0]();
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x24BDAFE38](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x24BDAFF80](__s1, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x24BDB0128](*(_QWORD *)&a1, a2);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB0640](objects, count);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
  MEMORY[0x24BDB06C0](xarray, index, string);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x24BDB08B0](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x24BDB0910](xdict);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0928](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x24BDB0A88](xint);
}

