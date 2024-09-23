void sub_21417AC7C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void DAXPCEncodeNSArrayOfCBUUID(void *a1, const char *a2, void *a3)
{
  id v5;
  id v6;
  xpc_object_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  xpc_object_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a3;
  if (v6)
  {
    v7 = xpc_array_create(0, 0);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "data", (_QWORD)v15);
          v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v14 = xpc_data_create((const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));
          xpc_array_append_value(v7, v14);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    xpc_dictionary_set_value(v5, a2, v7);
  }

}

uint64_t DAXPCDecodeNSArrayOfCBUUID(void *a1, const char *a2, id *a3, _QWORD *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD applier[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v7 = a1;
  xpc_dictionary_get_value(v7, a2);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (!v8)
    goto LABEL_9;
  if (MEMORY[0x2199CAB58](v8) == MEMORY[0x24BDACF78])
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy_;
    v19 = __Block_byref_object_dispose_;
    v20 = 0;
    v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    applier[0] = MEMORY[0x24BDAC760];
    applier[1] = 3221225472;
    applier[2] = __DAXPCDecodeNSArrayOfCBUUID_block_invoke;
    applier[3] = &unk_24D169018;
    applier[5] = &v15;
    applier[6] = a2;
    applier[4] = v11;
    xpc_array_apply(v9, applier);
    v12 = (void *)v16[5];
    if (v12)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v12);
    }
    else
    {
      objc_storeStrong(a3, v11);
    }

    _Block_object_dispose(&v15, 8);
    if (v12)
      goto LABEL_8;
LABEL_9:
    v10 = 1;
    goto LABEL_10;
  }
  if (!a4)
  {
LABEL_8:
    v10 = 0;
    goto LABEL_10;
  }
  NSErrorF_safe();
  v10 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v10;
}

void sub_21417BD50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

__CFString *DADeviceFlagsToString(__int16 a1)
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;

  if ((a1 & 2) != 0)
  {
    CUAppendF();
    v2 = (__CFString *)0;
    if ((a1 & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v2 = 0;
  if ((a1 & 4) != 0)
  {
LABEL_5:
    CUAppendF();
    v3 = v2;

    v2 = v3;
  }
LABEL_6:
  if ((a1 & 8) != 0)
  {
    CUAppendF();
    v8 = v2;

    v2 = v8;
    if ((a1 & 0x10) == 0)
    {
LABEL_8:
      if ((a1 & 0x20) == 0)
        goto LABEL_9;
      goto LABEL_18;
    }
  }
  else if ((a1 & 0x10) == 0)
  {
    goto LABEL_8;
  }
  CUAppendF();
  v9 = v2;

  v2 = v9;
  if ((a1 & 0x20) == 0)
  {
LABEL_9:
    if ((a1 & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_19;
  }
LABEL_18:
  CUAppendF();
  v10 = v2;

  v2 = v10;
  if ((a1 & 0x40) == 0)
  {
LABEL_10:
    if ((a1 & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_20;
  }
LABEL_19:
  CUAppendF();
  v11 = v2;

  v2 = v11;
  if ((a1 & 0x80) == 0)
  {
LABEL_11:
    if ((a1 & 0x100) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_20:
  CUAppendF();
  v12 = v2;

  v2 = v12;
  if ((a1 & 0x100) != 0)
  {
LABEL_12:
    CUAppendF();
    v4 = v2;

    v2 = v4;
  }
LABEL_13:
  v5 = &stru_24D169BB8;
  if (v2)
    v5 = v2;
  v6 = v5;

  return v6;
}

__CFString *DADeviceAccessorySetupOptionsToString(char a1)
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  if ((a1 & 1) != 0)
  {
    CUAppendF();
    v2 = (__CFString *)0;
    if ((a1 & 2) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v2 = 0;
  if ((a1 & 2) != 0)
  {
LABEL_5:
    CUAppendF();
    v3 = v2;

    v2 = v3;
  }
LABEL_6:
  v4 = CFSTR("None");
  if (v2)
    v4 = v2;
  v5 = v4;

  return v5;
}

const __CFString *DADeviceProtocolTypeToString(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("?");
  if (a1 == 1)
    v1 = CFSTR("DIAL");
  if (a1)
    return v1;
  else
    return CFSTR("Invalid");
}

const __CFString *DADeviceTypeToString(unint64_t a1)
{
  if (a1 > 6)
    return CFSTR("?");
  else
    return off_24D1690B0[a1];
}

const __CFString *DADeviceStateToString(uint64_t a1)
{
  if (a1 > 19)
  {
    if (a1 > 27)
    {
      if (a1 == 28)
        return CFSTR("Unauthorized");
      if (a1 == 30)
        return CFSTR("Invalidating");
    }
    else
    {
      if (a1 == 20)
        return CFSTR("Activated");
      if (a1 == 25)
        return CFSTR("Authorized");
    }
    return CFSTR("?");
  }
  if (!a1)
    return CFSTR("Invalid");
  if (a1 != 5)
  {
    if (a1 == 10)
      return CFSTR("Activating");
    return CFSTR("?");
  }
  return CFSTR("Found");
}

const __CFString *DADeviceMediaPlaybackStateToString(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("?");
  else
    return off_24D169098[a1];
}

void sub_21417F2BC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose((const void *)(v1 - 144), 8);
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

void sub_21417F9C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
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

void sub_214180FCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21418118C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214182A10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a53, 8);
  _Block_object_dispose(&a59, 8);
  _Block_object_dispose(&STACK[0x230], 8);
  _Unwind_Resume(a1);
}

void _resolveSRVCallack(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8, uint64_t a9, uint64_t a10, void *a11)
{
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  unsigned __int8 *v27;
  unsigned int v28;
  unsigned int v29;
  char *v30;
  unsigned int v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  char v39;
  _QWORD v40[135];

  v40[134] = *MEMORY[0x24BDAC8D0];
  v16 = a11;
  objc_msgSend(v16, "endpoint");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_DADeviceResolver <= 30
    && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
  {
    CUPrintErrorCode();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v37 = v18;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = a3;
    v36 = a2;
    v34 = a5;
    LogPrintF();

  }
  if ((a2 & 2) != 0)
  {
    objc_msgSend(v16, "resolver");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "resolveOperations");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeObject:", v16);

    objc_msgSend(v16, "invalidate");
    if (!a4 && a8 >= 7)
    {
      v21 = a9 + 6;
      v22 = *(unsigned __int8 *)(a9 + 6);
      if (!*(_BYTE *)(a9 + 6))
      {
        v24 = (char *)v40;
        v39 = 46;
        goto LABEL_24;
      }
      v23 = 0;
      v24 = &v39;
      v25 = a9 + 6;
      while (1)
      {
        if (v23 + 1 + (unint64_t)v22 > 0xFE || v22 > 0x3F)
        {
LABEL_25:
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", &v39, v34, v35, v36, v37, v38);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setBonjourHostname:", v32);

          objc_msgSend(v19, "_startResolvingHostname:interfaceIndex:endpoint:", &v39, a3, v17);
          objc_msgSend(v19, "coalescer");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "trigger");

          break;
        }
        v26 = v22 + v25 + 1;
        v27 = (unsigned __int8 *)(v25 + 1);
        do
        {
          v29 = *v27++;
          v28 = v29;
          if (v29 == 92 || v28 == 46)
          {
            *v24++ = 92;
LABEL_16:
            v30 = v24;
            goto LABEL_17;
          }
          if (v28 > 0x20)
            goto LABEL_16;
          *(_WORD *)v24 = 12380;
          v31 = (205 * v28) >> 11;
          v30 = v24 + 3;
          v24[2] = v31 | 0x30;
          LOBYTE(v28) = (v28 - 10 * v31) | 0x30;
LABEL_17:
          *v30 = v28;
          v24 = v30 + 1;
        }
        while ((unint64_t)v27 < v26);
        v30[1] = 0;
        v23 += 1 + *(unsigned __int8 *)(v21 + v23);
        v24 = v30 + 2;
        v30[1] = 46;
        v25 = v21 + v23;
        v22 = *(unsigned __int8 *)(v21 + v23);
        if (!*(_BYTE *)(v21 + v23))
        {
LABEL_24:
          *v24 = 0;
          goto LABEL_25;
        }
      }
    }

  }
}

void _resolveHostnameCallback(uint64_t a1, char a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v11 = a8;
  objc_msgSend(v11, "endpoint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_DADeviceResolver <= 30
    && (gLogCategory_DADeviceResolver != -1 || _LogCategory_Initialize()))
  {
    NSPrintF();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    CUPrintErrorCode();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier", a6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  if ((a2 & 2) != 0)
  {
    objc_msgSend(v11, "resolver");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "resolveOperations");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObject:", v11);

    objc_msgSend(v11, "invalidate");
    if (!a4 && a6)
    {
      v20[0] = 0;
      SockAddrToString();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v20);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setIpv4String:", v17);

      objc_msgSend(v15, "coalescer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "trigger");

    }
  }

}

void sub_214184380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
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

void _responseCallback(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  pthread_mutex_lock(&gDAUserAlertMutex);
  v4 = (void *)gDAUserAlertMap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  pthread_mutex_unlock(&gDAUserAlertMutex);
  objc_msgSend(v6, "_responseCallback:responseFlags:", a1, a2);

}

void sub_21418823C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  (*(void (**)(uint64_t))(v35 + 16))(v35);
  _Block_object_dispose(&a35, 8);
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

void sub_214189240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21418BE80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFString *DAErrorCodeToString(uint64_t a1)
{
  const __CFString *result;

  switch(a1)
  {
    case 350000:
      result = CFSTR("DAErrorCodeUnknown");
      break;
    case 350001:
      result = CFSTR("DAErrorCodeBadParameter");
      break;
    case 350002:
      result = CFSTR("DAErrorCodeUnsupported");
      break;
    case 350003:
      result = CFSTR("DAErrorCodeTimeout");
      break;
    case 350004:
      result = CFSTR("DAErrorCodeInternal");
      break;
    case 350005:
      result = CFSTR("DAErrorCodeMissingEntitlement");
      break;
    case 350006:
      result = CFSTR("DAErrorCodePermission");
      break;
    case 350007:
      result = CFSTR("DAErrorCodeFileError");
      break;
    case 350008:
      result = CFSTR("DAErrorCodeBluetoothError");
      break;
    case 350009:
      result = CFSTR("DAErrorCodeInvalidBluetoothDevice");
      break;
    case 350010:
      result = CFSTR("DAErrorCodeBluetoothPairingFailed");
      break;
    case 350011:
      result = CFSTR("DAErrorCodePersistBTDeviceInvalidAction");
      break;
    case 350012:
      result = CFSTR("DAErrorCodeBTDisconnected");
      break;
    case 350013:
      result = CFSTR("DAErrorCodeBTConnectError");
      break;
    case 350014:
      result = CFSTR("DAErrorCodeBTTaskCancelled");
      break;
    case 350015:
      result = CFSTR("DAErrorCodeBTScanLost");
      break;
    case 350016:
      result = CFSTR("DAErrorCodeBTReset");
      break;
    default:
      if (a1)
        result = CFSTR("?");
      else
        result = CFSTR("DAErrorCodeSuccess");
      break;
  }
  return result;
}

id DAErrorF(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", v10, &a9);
  v12 = objc_alloc(MEMORY[0x24BDD1540]);
  v16 = CFSTR("cuErrorMsg");
  v17[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), a1, v13);

  return v14;
}

id DANestedErrorF(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void **v18;
  const __CFString **v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const __CFString *v24;
  void *v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v11 = a1;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", v12, &a9);
  v14 = v11;
  v15 = objc_alloc(MEMORY[0x24BDD1540]);
  if (v14)
  {
    v16 = *MEMORY[0x24BDD1398];
    v26[0] = CFSTR("cuErrorMsg");
    v26[1] = v16;
    v27[0] = v13;
    v27[1] = v14;
    v17 = (void *)MEMORY[0x24BDBCE70];
    v18 = (void **)v27;
    v19 = (const __CFString **)v26;
    v20 = 2;
  }
  else
  {
    v24 = CFSTR("cuErrorMsg");
    v25 = v13;
    v17 = (void *)MEMORY[0x24BDBCE70];
    v18 = &v25;
    v19 = &v24;
    v20 = 1;
  }
  objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", CFSTR("DAErrorDomain"), a2, v21);

  return v22;
}

const __CFString *DAEventTypeToString(uint64_t a1)
{
  const __CFString *result;

  if (a1 <= 29)
  {
    if (a1 > 14)
    {
      if (a1 == 15)
        return CFSTR("AccessorySetupMigrated");
      if (a1 == 20)
        return CFSTR("Invalidated");
    }
    else
    {
      if (!a1)
        return CFSTR("Unknown");
      if (a1 == 10)
        return CFSTR("Activated");
    }
    return CFSTR("?");
  }
  if (a1 > 49)
  {
    switch(a1)
    {
      case '2':
        return CFSTR("DevicesPresentChanged");
      case '7':
        return CFSTR("DAEventTypeBluetoothPairingRequest");
      case '<':
        return CFSTR("XPCInterrupted");
    }
    return CFSTR("?");
  }
  switch(a1)
  {
    case 30:
      result = CFSTR("SessionStarted");
      break;
    case 31:
      result = CFSTR("SessionEnded");
      break;
    case 32:
      result = CFSTR("SessionError");
      break;
    case 40:
      result = CFSTR("DeviceFound");
      break;
    case 41:
      result = CFSTR("DeviceLost");
      break;
    case 42:
      result = CFSTR("DeviceChanged");
      break;
    default:
      return CFSTR("?");
  }
  return result;
}

void sub_214191864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  (*(void (**)(uint64_t))(v9 + 16))(v9);
  _Block_object_dispose((const void *)(v10 - 144), 8);
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

void sub_214192034(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2141928EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214192D38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2141931B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_214193FDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class initCBDiscovery()
{
  Class result;

  if (CoreBluetoothLibrary_sOnce != -1)
    dispatch_once(&CoreBluetoothLibrary_sOnce, &__block_literal_global_2);
  result = objc_getClass("CBDiscovery");
  classCBDiscovery = (uint64_t)result;
  getCBDiscoveryClass = (uint64_t (*)())CBDiscoveryFunction;
  return result;
}

id CBDiscoveryFunction()
{
  return (id)classCBDiscovery;
}

uint64_t DADevice.networkEndpoint.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  uint64_t v4;

  if (objc_msgSend(v1, sel_networkEndpoint))
    return sub_21419A0E4();
  v4 = sub_21419A0D8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, 1, 1, v4);
}

uint64_t sub_214198130@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  if (objc_msgSend(*a1, sel_networkEndpoint))
    return sub_21419A0E4();
  v4 = sub_21419A0D8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a2, 1, 1, v4);
}

uint64_t sub_214198194(uint64_t a1, void **a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254D67EA0);
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v14 - v7;
  sub_214198998(a1, (uint64_t)&v14 - v7, &qword_254D67EA0);
  v9 = *a2;
  sub_214198998((uint64_t)v8, (uint64_t)v6, &qword_254D67EA0);
  v10 = sub_21419A0D8();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v6, 1, v10) == 1)
  {
    sub_2141989DC((uint64_t)v6, &qword_254D67EA0);
    v12 = 0;
  }
  else
  {
    v12 = sub_21419A0CC();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v6, v10);
  }
  objc_msgSend(v9, sel_setNetworkEndpoint_, v12);
  swift_unknownObjectRelease();
  return sub_2141989DC((uint64_t)v8, &qword_254D67EA0);
}

uint64_t DADevice.networkEndpoint.setter(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D67EA0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_214198998(a1, (uint64_t)v6, &qword_254D67EA0);
  v7 = sub_21419A0D8();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_2141989DC((uint64_t)v6, &qword_254D67EA0);
    v9 = 0;
  }
  else
  {
    v9 = sub_21419A0CC();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  }
  objc_msgSend(v2, sel_setNetworkEndpoint_, v9);
  swift_unknownObjectRelease();
  return sub_2141989DC(a1, &qword_254D67EA0);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199CA96C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void (*DADevice.networkEndpoint.modify(_QWORD *a1))(uint64_t *a1, char a2)
{
  void *v1;
  _QWORD *v3;
  size_t v4;
  void *v5;
  uint64_t v6;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254D67EA0) - 8) + 64);
  v3[1] = malloc(v4);
  v3[2] = malloc(v4);
  v3[3] = malloc(v4);
  v5 = malloc(v4);
  v3[4] = v5;
  if (objc_msgSend(v1, sel_networkEndpoint))
  {
    sub_21419A0E4();
  }
  else
  {
    v6 = sub_21419A0D8();
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  }
  return sub_2141984E8;
}

void sub_2141984E8(uint64_t *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v2 = *a1;
  v3 = *(_QWORD *)(*a1 + 32);
  if ((a2 & 1) != 0)
  {
    v5 = *(_QWORD *)(v2 + 8);
    v4 = *(_QWORD *)(v2 + 16);
    sub_214198998(v3, v4, &qword_254D67EA0);
    sub_214198998(v4, v5, &qword_254D67EA0);
    v6 = sub_21419A0D8();
    v7 = *(_QWORD *)(v6 - 8);
    v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
    v9 = *(_QWORD *)(v2 + 8);
    if (v8 == 1)
    {
      sub_2141989DC(*(_QWORD *)(v2 + 8), &qword_254D67EA0);
      v10 = 0;
    }
    else
    {
      v10 = sub_21419A0CC();
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v9, v6);
    }
    v18 = *(void **)(v2 + 24);
    v17 = *(void **)(v2 + 32);
    v20 = *(void **)(v2 + 8);
    v19 = *(void **)(v2 + 16);
    objc_msgSend(*(id *)v2, sel_setNetworkEndpoint_, v10);
    swift_unknownObjectRelease();
    sub_2141989DC((uint64_t)v19, &qword_254D67EA0);
  }
  else
  {
    v11 = *(_QWORD *)(v2 + 24);
    sub_214198998(v3, v11, &qword_254D67EA0);
    v12 = sub_21419A0D8();
    v13 = *(_QWORD *)(v12 - 8);
    v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12);
    v15 = *(_QWORD *)(v2 + 24);
    if (v14 == 1)
    {
      sub_2141989DC(*(_QWORD *)(v2 + 24), &qword_254D67EA0);
      v16 = 0;
    }
    else
    {
      v16 = sub_21419A0CC();
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v15, v12);
    }
    v18 = *(void **)(v2 + 24);
    v17 = *(void **)(v2 + 32);
    v20 = *(void **)(v2 + 8);
    v19 = *(void **)(v2 + 16);
    objc_msgSend(*(id *)v2, sel_setNetworkEndpoint_, v16);
    swift_unknownObjectRelease();
  }
  sub_2141989DC((uint64_t)v17, &qword_254D67EA0);
  free(v17);
  free(v18);
  free(v19);
  free(v20);
  free((void *)v2);
}

uint64_t DADevice.txtRecord.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  v3 = objc_msgSend(v1, sel_txtRecordData);
  if (v3)
  {
    v4 = v3;
    sub_21419A09C();

    sub_21419A108();
    v5 = sub_21419A0FC();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a1;
    v8 = 0;
  }
  else
  {
    v5 = sub_21419A0FC();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a1;
    v8 = 1;
  }
  return v6(v7, v8, 1, v5);
}

uint64_t sub_214198748@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  v3 = objc_msgSend(*a1, sel_txtRecordData);
  if (v3)
  {
    v4 = v3;
    sub_21419A09C();

    sub_21419A108();
    v5 = sub_21419A0FC();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a2;
    v8 = 0;
  }
  else
  {
    v5 = sub_21419A0FC();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a2;
    v8 = 1;
  }
  return v6(v7, v8, 1, v5);
}

uint64_t sub_2141987E8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D67EA8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_214198998(a1, (uint64_t)v4, &qword_254D67EA8);
  return DADevice.txtRecord.setter((uint64_t)v4);
}

uint64_t DADevice.txtRecord.setter(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v14;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D67EA8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_214198998(a1, (uint64_t)v6, &qword_254D67EA8);
  v7 = sub_21419A0FC();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_2141989DC((uint64_t)v6, &qword_254D67EA8);
    v9 = 0;
  }
  else
  {
    v10 = sub_21419A0F0();
    v12 = v11;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
    v9 = (void *)sub_21419A090();
    sub_214198A18(v10, v12);
  }
  objc_msgSend(v2, sel_setTxtRecordData_, v9);

  return sub_2141989DC(a1, &qword_254D67EA8);
}

uint64_t sub_214198998(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2141989DC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_214198A18(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

void (*DADevice.txtRecord.modify(_QWORD *a1))(uint64_t *a1, char a2)
{
  void *v1;
  _QWORD *v3;
  size_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254D67EA8) - 8) + 64);
  v3[1] = malloc(v4);
  v3[2] = malloc(v4);
  v3[3] = malloc(v4);
  v5 = malloc(v4);
  v3[4] = v5;
  v6 = objc_msgSend(v1, sel_txtRecordData);
  if (v6)
  {
    v7 = v6;
    sub_21419A09C();

    sub_21419A108();
    v8 = sub_21419A0FC();
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 0, 1, v8);
  }
  else
  {
    v9 = sub_21419A0FC();
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v5, 1, 1, v9);
  }
  return sub_214198B68;
}

void sub_214198B68(uint64_t *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;

  v2 = *a1;
  v3 = *(_QWORD *)(*a1 + 32);
  if ((a2 & 1) != 0)
  {
    v5 = *(_QWORD *)(v2 + 8);
    v4 = *(_QWORD *)(v2 + 16);
    sub_214198998(v3, v4, &qword_254D67EA8);
    sub_214198998(v4, v5, &qword_254D67EA8);
    v6 = sub_21419A0FC();
    v7 = *(_QWORD *)(v6 - 8);
    v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
    v9 = *(_QWORD *)(v2 + 8);
    if (v8 == 1)
    {
      sub_2141989DC(*(_QWORD *)(v2 + 8), &qword_254D67EA8);
      v10 = 0;
    }
    else
    {
      v17 = sub_21419A0F0();
      v19 = v18;
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v9, v6);
      v10 = (void *)sub_21419A090();
      sub_214198A18(v17, v19);
    }
    v21 = *(void **)(v2 + 24);
    v20 = *(void **)(v2 + 32);
    v23 = *(void **)(v2 + 8);
    v22 = *(void **)(v2 + 16);
    objc_msgSend(*(id *)v2, sel_setTxtRecordData_, v10);

    sub_2141989DC((uint64_t)v22, &qword_254D67EA8);
  }
  else
  {
    v11 = *(_QWORD *)(v2 + 24);
    sub_214198998(v3, v11, &qword_254D67EA8);
    v12 = sub_21419A0FC();
    v13 = *(_QWORD *)(v12 - 8);
    v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12);
    v15 = *(_QWORD *)(v2 + 24);
    if (v14 == 1)
    {
      sub_2141989DC(*(_QWORD *)(v2 + 24), &qword_254D67EA8);
      v16 = 0;
    }
    else
    {
      v24 = sub_21419A0F0();
      v26 = v25;
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v15, v12);
      v16 = (void *)sub_21419A090();
      sub_214198A18(v24, v26);
    }
    v21 = *(void **)(v2 + 24);
    v20 = *(void **)(v2 + 32);
    v23 = *(void **)(v2 + 8);
    v22 = *(void **)(v2 + 16);
    objc_msgSend(*(id *)v2, sel_setTxtRecordData_, v16);

  }
  sub_2141989DC((uint64_t)v20, &qword_254D67EA8);
  free(v20);
  free(v21);
  free(v22);
  free(v23);
  free((void *)v2);
}

uint64_t sub_214198D60()
{
  uint64_t v0;

  v0 = sub_21419A0C0();
  __swift_allocate_value_buffer(v0, qword_254D67EB0);
  __swift_project_value_buffer(v0, (uint64_t)qword_254D67EB0);
  return sub_21419A0B4();
}

id sub_214198DDC(uint64_t a1)
{
  objc_class *v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = objc_allocWithZone(v1);
  return sub_214198E0C(a1, v4, v5, v6);
}

id sub_214198E0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  objc_class *v6;
  objc_super v8;

  v5 = *MEMORY[0x24BEE4EA0] & *v4;
  *(_QWORD *)((char *)v4 + qword_254D67FA8) = a1;
  v6 = (objc_class *)type metadata accessor for DADiscoveryExtensionConfiguration.ExportedObject(0, *(_QWORD *)(v5 + 80), *(_QWORD *)(v5 + 88), a4);
  v8.receiver = v4;
  v8.super_class = v6;
  return objc_msgSendSuper2(&v8, sel_init);
}

void sub_214198E64()
{
  sub_214199914();
}

void sub_214198E8C(void *a1)
{
  id v1;

  v1 = a1;
  sub_214198E64();

}

void sub_214198EC0()
{
  sub_21419976C();
}

void sub_214198EE8(void *a1)
{
  id v1;

  v1 = a1;
  sub_214198EC0();

}

id sub_214198F28(uint64_t a1)
{
  return sub_214199D20(a1);
}

void sub_214198F50(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  sub_214198F28((uint64_t)v4);

}

void sub_214198FA4()
{
  sub_214199E7C();
}

id sub_214198FC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for DADiscoveryExtensionConfiguration.ExportedObject(0, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x50), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x58), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t sub_21419900C()
{
  return swift_release();
}

uint64_t sub_21419901C()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t sub_214199024(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

void sub_21419902C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + 32);
  *(_QWORD *)(v1 + 32) = a1;

}

void sub_214199038(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = a1;

}

uint64_t DADiscoveryExtensionConfiguration.__allocating_init(discoveryExtension:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  DADiscoveryExtensionConfiguration.init(discoveryExtension:)(a1);
  return v2;
}

uint64_t DADiscoveryExtensionConfiguration.init(discoveryExtension:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v2 = v1;
  *(_QWORD *)(v1 + 32) = 0;
  *(_QWORD *)(v1 + 40) = 0;
  if (qword_254D67E98 != -1)
    swift_once();
  v4 = sub_21419A0C0();
  __swift_project_value_buffer(v4, (uint64_t)qword_254D67EB0);
  v5 = sub_21419A0A8();
  v6 = sub_21419A114();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_214178000, v5, v6, "DA config init", v7, 2u);
    MEMORY[0x2199CA9CC](v7, -1, -1);
  }

  *(_QWORD *)(v2 + 16) = -1;
  *(_QWORD *)(v2 + 24) = a1;
  return v2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_214199184(void *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  void *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  objc_class *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  _QWORD v33[6];

  v2 = (uint64_t)v1;
  v4 = *v1;
  if (qword_254D67E98 != -1)
    swift_once();
  v5 = sub_21419A0C0();
  __swift_project_value_buffer(v5, (uint64_t)qword_254D67EB0);
  v6 = a1;
  v7 = sub_21419A0A8();
  v8 = sub_21419A12C();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v9 = 67109120;
    LODWORD(v33[0]) = objc_msgSend(v6, sel_processIdentifier);
    sub_21419A138();

    _os_log_impl(&dword_214178000, v7, v8, "XPC connection started: PID %d", v9, 8u);
    MEMORY[0x2199CA9CC](v9, -1, -1);

    v10 = (void *)v1[5];
    if (!v10)
      goto LABEL_11;
  }
  else
  {

    v10 = (void *)v1[5];
    if (!v10)
      goto LABEL_11;
  }
  v11 = v6;
  v12 = v10;
  v13 = sub_21419A0A8();
  v14 = sub_21419A12C();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = swift_slowAlloc();
    *(_DWORD *)v15 = 67109376;
    LODWORD(v33[0]) = objc_msgSend(v12, sel_processIdentifier);
    sub_21419A138();
    *(_WORD *)(v15 + 8) = 1024;
    LODWORD(v33[0]) = -[NSObject processIdentifier](v11, sel_processIdentifier, v33[0]);
    sub_21419A138();

    _os_log_impl(&dword_214178000, v13, v14, "XPC connection replacing: PID %d -> PID %d", (uint8_t *)v15, 0xEu);
    MEMORY[0x2199CA9CC](v15, -1, -1);
  }
  else
  {

    v13 = v11;
  }

  objc_msgSend(v12, sel_invalidate);
  v16 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

LABEL_11:
  v17 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v6;
  v18 = v6;

  v19 = (void *)objc_opt_self();
  v20 = objc_msgSend(v19, sel_interfaceWithProtocol_, &unk_254D6D6E0);
  objc_msgSend(v18, sel_setExportedInterface_, v20);

  v22 = (objc_class *)type metadata accessor for DADiscoveryExtensionConfiguration.ExportedObject(0, *(_QWORD *)(v4 + 80), *(_QWORD *)(v4 + 80), v21);
  swift_retain();
  v23 = objc_allocWithZone(v22);
  v27 = sub_214198E0C(v2, v24, v25, v26);
  objc_msgSend(v18, sel_setExportedObject_, v27);

  v28 = swift_allocObject();
  *(_QWORD *)(v28 + 16) = v2;
  *(_QWORD *)(v28 + 24) = v18;
  v33[4] = sub_214199EE0;
  v33[5] = v28;
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 1107296256;
  v33[2] = sub_21419958C;
  v33[3] = &block_descriptor;
  v29 = _Block_copy(v33);
  v30 = v18;
  swift_retain();
  swift_release();
  objc_msgSend(v30, sel_setInvalidationHandler_, v29);
  _Block_release(v29);
  v31 = objc_msgSend(v19, sel_interfaceWithProtocol_, &unk_254D6B8B8);
  objc_msgSend(v30, sel_setRemoteObjectInterface_, v31);

  objc_msgSend(v30, sel_resume);
  return 1;
}

uint64_t sub_21419958C(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_2141995B8(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t result;

  v2 = v1;
  if (qword_254D67E98 != -1)
    swift_once();
  v4 = sub_21419A0C0();
  __swift_project_value_buffer(v4, (uint64_t)qword_254D67EB0);
  v5 = a1;
  v6 = sub_21419A0A8();
  v7 = sub_21419A12C();
  if (!os_log_type_enabled(v6, v7))
  {

    v9 = (void *)v2[4];
    if (!v9)
      goto LABEL_8;
    goto LABEL_7;
  }
  v8 = (uint8_t *)swift_slowAlloc();
  *(_DWORD *)v8 = 67109120;
  objc_msgSend(v5, sel_processIdentifier);
  sub_21419A138();

  _os_log_impl(&dword_214178000, v6, v7, "XPC connection ended: PID %d", v8, 8u);
  MEMORY[0x2199CA9CC](v8, -1, -1);

  v9 = (void *)v2[4];
  if (v9)
  {
LABEL_7:
    v10 = (void *)v2[3];
    v11 = v9;
    objc_msgSend(v10, sel_stopDiscoveryWithSession_, v11);
    objc_msgSend(v11, sel_invalidate);

    v9 = (void *)v2[4];
  }
LABEL_8:
  v2[4] = 0;

  v12 = (void *)v2[5];
  v2[5] = 0;

  result = v2[2];
  if (result != -1)
    return sandbox_extension_release();
  return result;
}

void sub_21419976C()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  os_log_type_t v6;
  uint8_t *v7;
  const char *v8;
  NSObject *oslog;

  if (qword_254D67E98 != -1)
    swift_once();
  v1 = sub_21419A0C0();
  __swift_project_value_buffer(v1, (uint64_t)qword_254D67EB0);
  v2 = sub_21419A0A8();
  v3 = sub_21419A12C();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_214178000, v2, v3, "XPC consume sandbox extension token", v4, 2u);
    MEMORY[0x2199CA9CC](v4, -1, -1);
  }

  v5 = sandbox_extension_consume();
  *(_QWORD *)(v0 + 16) = v5;
  oslog = sub_21419A0A8();
  if (v5 == -1)
  {
    v6 = sub_21419A120();
    if (os_log_type_enabled(oslog, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      v8 = "XPC consume sandbox token failed";
      goto LABEL_10;
    }
  }
  else
  {
    v6 = sub_21419A12C();
    if (os_log_type_enabled(oslog, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      v8 = "XPC consume sandbox token success";
LABEL_10:
      _os_log_impl(&dword_214178000, oslog, v6, v8, v7, 2u);
      MEMORY[0x2199CA9CC](v7, -1, -1);
    }
  }

}

void sub_214199914()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[6];

  v1 = v0;
  if (qword_254D67E98 != -1)
    swift_once();
  v2 = sub_21419A0C0();
  __swift_project_value_buffer(v2, (uint64_t)qword_254D67EB0);
  v3 = sub_21419A0A8();
  v4 = sub_21419A12C();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_214178000, v3, v4, "XPC start discovery", v5, 2u);
    MEMORY[0x2199CA9CC](v5, -1, -1);
  }

  objc_msgSend(*(id *)(v1 + 32), sel_invalidate);
  v6 = objc_msgSend(objc_allocWithZone((Class)DADiscoveryExtensionSession), sel_init);
  v7 = *(void **)(v1 + 32);
  *(_QWORD *)(v1 + 32) = v6;
  v8 = v6;

  v10[4] = sub_21419A014;
  v10[5] = v1;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_214199CD0;
  v10[3] = &block_descriptor_4;
  v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  objc_msgSend(v8, sel_setEventHandler_, v9);
  _Block_release(v9);
  objc_msgSend(*(id *)(v1 + 24), sel_startDiscoveryWithSession_, v8);

}

uint64_t sub_214199AB4(void *a1, uint64_t a2)
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  uint64_t result;
  id v12;
  id v13;

  if (qword_254D67E98 != -1)
    swift_once();
  v4 = sub_21419A0C0();
  __swift_project_value_buffer(v4, (uint64_t)qword_254D67EB0);
  v5 = a1;
  v6 = sub_21419A0A8();
  v7 = sub_21419A12C();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    v10 = v5;
    sub_21419A138();
    *v9 = v5;

    _os_log_impl(&dword_214178000, v6, v7, "XPC report event: %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D68038);
    swift_arrayDestroy();
    MEMORY[0x2199CA9CC](v9, -1, -1);
    MEMORY[0x2199CA9CC](v8, -1, -1);

    result = *(_QWORD *)(a2 + 40);
    if (!result)
      return result;
  }
  else
  {

    result = *(_QWORD *)(a2 + 40);
    if (!result)
      return result;
  }
  v12 = objc_msgSend((id)result, sel_remoteObjectProxy);
  sub_21419A144();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D68030);
  result = swift_dynamicCast();
  if ((result & 1) != 0)
  {
    objc_msgSend(v13, sel_reportEvent_, v5);
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_214199CD0(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

id sub_214199D20(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v2 = v1;
  if (qword_254D67E98 != -1)
    swift_once();
  v4 = sub_21419A0C0();
  __swift_project_value_buffer(v4, (uint64_t)qword_254D67EB0);
  v5 = sub_21419A0A8();
  v6 = sub_21419A12C();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_214178000, v5, v6, "XPC didReceiveDeviceChangedEvent", v7, 2u);
    MEMORY[0x2199CA9CC](v7, -1, -1);
  }

  return objc_msgSend(*(id *)(v2 + 24), sel_didReceiveDeviceChangedEvent_, a1);
}

uint64_t DADiscoveryExtensionConfiguration.deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return v0;
}

uint64_t DADiscoveryExtensionConfiguration.__deallocating_deinit()
{
  DADiscoveryExtensionConfiguration.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_214199E58(void *a1)
{
  sub_214199184(a1);
  return 1;
}

void sub_214199E7C()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t type metadata accessor for DADiscoveryExtensionConfiguration.ExportedObject(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for DADiscoveryExtensionConfiguration.ExportedObject);
}

uint64_t sub_214199EB4()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_214199EE0()
{
  uint64_t v0;

  return sub_2141995B8(*(void **)(v0 + 24));
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_214199F1C(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x2199CA978](&protocol conformance descriptor for DADiscoveryExtensionConfiguration<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_214199F4C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for DADiscoveryExtensionConfiguration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for DADiscoveryExtensionConfiguration);
}

uint64_t method lookup function for DADiscoveryExtensionConfiguration()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DADiscoveryExtensionConfiguration.__allocating_init(discoveryExtension:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of DADiscoveryExtensionConfiguration.accept(connection:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t sub_214199FD0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_21419A014(void *a1)
{
  uint64_t v1;

  return sub_214199AB4(a1, v1);
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2199CA960](a1, v6, a5);
}

uint64_t sub_21419A090()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_21419A09C()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_21419A0A8()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_21419A0B4()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_21419A0C0()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_21419A0CC()
{
  return MEMORY[0x24BDDFEB8]();
}

uint64_t sub_21419A0D8()
{
  return MEMORY[0x24BDDFF68]();
}

uint64_t sub_21419A0E4()
{
  return MEMORY[0x24BDDFF80]();
}

uint64_t sub_21419A0F0()
{
  return MEMORY[0x24BDE0128]();
}

uint64_t sub_21419A0FC()
{
  return MEMORY[0x24BDE0130]();
}

uint64_t sub_21419A108()
{
  return MEMORY[0x24BDE0140]();
}

uint64_t sub_21419A114()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_21419A120()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_21419A12C()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_21419A138()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_21419A144()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

uint64_t CFDictionaryGetDouble()
{
  return MEMORY[0x24BE28F70]();
}

uint64_t CFDictionaryGetInt64()
{
  return MEMORY[0x24BE28F88]();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

uint64_t CFDictionaryGetTypedValue()
{
  return MEMORY[0x24BE28F98]();
}

uint64_t CFPrefs_CopyTypedValue()
{
  return MEMORY[0x24BE29088]();
}

uint64_t CFPrefs_GetInt64()
{
  return MEMORY[0x24BE29098]();
}

uint64_t CFPrefs_RemoveValue()
{
  return MEMORY[0x24BE290A0]();
}

uint64_t CFPrefs_SetValue()
{
  return MEMORY[0x24BE290B8]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC300]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC348](rl, source, mode);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x24BDBC918](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x24BDBC920](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBC928](allocator, userNotification, callout, order);
}

uint64_t CUAppendF()
{
  return MEMORY[0x24BE29110]();
}

uint64_t CUDescriptionWithLevel()
{
  return MEMORY[0x24BE29120]();
}

uint64_t CUGestaltDeviceClassToString()
{
  return MEMORY[0x24BE29140]();
}

uint64_t CULocalizedStringEx()
{
  return MEMORY[0x24BE29158]();
}

uint64_t CUPrintDateCF()
{
  return MEMORY[0x24BE29190]();
}

uint64_t CUPrintErrorCode()
{
  return MEMORY[0x24BE291A0]();
}

uint64_t CUPrintFlags64()
{
  return MEMORY[0x24BE291B8]();
}

uint64_t CUPrintNSDataAddress()
{
  return MEMORY[0x24BE291C8]();
}

uint64_t CUPrintNSError()
{
  return MEMORY[0x24BE291D8]();
}

uint64_t CUPrintNSObject()
{
  return MEMORY[0x24BE291E0]();
}

uint64_t CUPrintNSObjectOneLine()
{
  return MEMORY[0x24BE291F0]();
}

uint64_t CUPrintXPC()
{
  return MEMORY[0x24BE29200]();
}

uint64_t CUXPCDecodeBool()
{
  return MEMORY[0x24BE29210]();
}

uint64_t CUXPCDecodeDouble()
{
  return MEMORY[0x24BE29218]();
}

uint64_t CUXPCDecodeNSArrayOfClass()
{
  return MEMORY[0x24BE29220]();
}

uint64_t CUXPCDecodeNSArrayOfInteger()
{
  return MEMORY[0x24BE29228]();
}

uint64_t CUXPCDecodeNSArrayOfNSString()
{
  return MEMORY[0x24BE29230]();
}

uint64_t CUXPCDecodeNSData()
{
  return MEMORY[0x24BE29238]();
}

uint64_t CUXPCDecodeNSError()
{
  return MEMORY[0x24BE29248]();
}

uint64_t CUXPCDecodeNSErrorIfNeeded()
{
  return MEMORY[0x24BE29250]();
}

uint64_t CUXPCDecodeNSString()
{
  return MEMORY[0x24BE29258]();
}

uint64_t CUXPCDecodeNSUUID()
{
  return MEMORY[0x24BE29260]();
}

uint64_t CUXPCDecodeObject()
{
  return MEMORY[0x24BE29268]();
}

uint64_t CUXPCDecodeSInt64RangedEx()
{
  return MEMORY[0x24BE29270]();
}

uint64_t CUXPCDecodeUInt64RangedEx()
{
  return MEMORY[0x24BE29278]();
}

uint64_t CUXPCEncodeNSArrayOfNSNumber()
{
  return MEMORY[0x24BE29280]();
}

uint64_t CUXPCEncodeNSArrayOfNSString()
{
  return MEMORY[0x24BE29288]();
}

uint64_t CUXPCEncodeNSArrayOfObjects()
{
  return MEMORY[0x24BE29290]();
}

uint64_t CUXPCEncodeNSError()
{
  return MEMORY[0x24BE29298]();
}

uint64_t CUXPCEncodeObject()
{
  return MEMORY[0x24BE292A0]();
}

uint64_t CUXPCGetNextClientID()
{
  return MEMORY[0x24BE292A8]();
}

DNSServiceErrorType DNSServiceConstructFullName(char *const fullName, const char *const service, const char *const regtype, const char *const domain)
{
  return MEMORY[0x24BDAC3F0](fullName, service, regtype, domain);
}

DNSServiceErrorType DNSServiceCreateConnection(DNSServiceRef *sdRef)
{
  return MEMORY[0x24BDAC3F8](sdRef);
}

DNSServiceErrorType DNSServiceGetAddrInfo(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, DNSServiceProtocol protocol, const char *hostname, DNSServiceGetAddrInfoReply callBack, void *context)
{
  return MEMORY[0x24BDAC408](sdRef, *(_QWORD *)&flags, *(_QWORD *)&interfaceIndex, *(_QWORD *)&protocol, hostname, callBack, context);
}

DNSServiceErrorType DNSServiceQueryRecord(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *fullname, uint16_t rrtype, uint16_t rrclass, DNSServiceQueryRecordReply callBack, void *context)
{
  return MEMORY[0x24BDAC418](sdRef, *(_QWORD *)&flags, *(_QWORD *)&interfaceIndex, fullname, rrtype, rrclass, callBack, context);
}

void DNSServiceRefDeallocate(DNSServiceRef sdRef)
{
  MEMORY[0x24BDAC428](sdRef);
}

DNSServiceErrorType DNSServiceSetDispatchQueue(DNSServiceRef service, dispatch_queue_t queue)
{
  return MEMORY[0x24BDAC450](service, queue);
}

uint64_t FatalErrorF()
{
  return MEMORY[0x24BE29380]();
}

uint64_t GestaltGetDeviceClass()
{
  return MEMORY[0x24BE293A0]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x24BE295F0]();
}

uint64_t NEHelperCacheCopyAppUUIDMapping()
{
  return MEMORY[0x24BDAC480]();
}

uint64_t NSAppendPrintF()
{
  return MEMORY[0x24BE29648]();
}

uint64_t NSDecodeNSArrayOfClassIfPresent()
{
  return MEMORY[0x24BE29658]();
}

uint64_t NSDecodeObjectIfPresent()
{
  return MEMORY[0x24BE29660]();
}

uint64_t NSDictionaryGetNSNumber()
{
  return MEMORY[0x24BE29680]();
}

uint64_t NSErrorF_safe()
{
  return MEMORY[0x24BE29690]();
}

uint64_t NSPrintF()
{
  return MEMORY[0x24BE296C0]();
}

uint64_t NSRandomData()
{
  return MEMORY[0x24BE296E0]();
}

uint64_t SecondsToUpTicksF()
{
  return MEMORY[0x24BE29970]();
}

uint64_t SockAddrToString()
{
  return MEMORY[0x24BE299C8]();
}

uint64_t UpTicksToMicroseconds()
{
  return MEMORY[0x24BE29AE8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x24BDBD138]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x24BDBD148]();
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x24BE29B48]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
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

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

uint64_t nw_endpoint_copy_dictionary()
{
  return MEMORY[0x24BDE0E38]();
}

nw_endpoint_t nw_endpoint_create_bonjour_service(const char *name, const char *type, const char *domain)
{
  return (nw_endpoint_t)MEMORY[0x24BDE0E78](name, type, domain);
}

uint64_t nw_endpoint_create_from_dictionary()
{
  return MEMORY[0x24BDE0E80]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x24BDAFC00]();
}

uint64_t sandbox_extension_issue_mach()
{
  return MEMORY[0x24BDAFC18]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x24BDAFC20]();
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x24BDB0630](xarray, value);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x24BDB0638](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB0640](objects, count);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x24BDB0710](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x24BDB0730](name, targetq);
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x24BDB0738](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x24BDB0758]();
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

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x24BDB07E8](connection, targetq);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x24BDB0868](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x24BDB0880](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x24BDB0888](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB08F8](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0928](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x24BDB0998](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
  MEMORY[0x24BDB09D8](xdict, key, uuid);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x24BDB09F8](connection);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x24BDB0C00](xuuid);
}

