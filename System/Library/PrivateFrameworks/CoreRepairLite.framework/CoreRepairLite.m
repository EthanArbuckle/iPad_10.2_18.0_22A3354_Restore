void sub_22AE1D82C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_22AE1D88C(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  NSObject *v8;

  v7 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_writeDataToEAN:withKey:", a3, v7) & 1) == 0)
  {
    sub_22AE246E8(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_22AE24B7C();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }

}

void sub_22AE21644(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_22AE21668(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_22AE21678(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_22AE216A8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_22AE216CC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xEu);
}

void sub_22AE24674(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_22AE246DC(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

id sub_22AE246E8(unint64_t a1)
{
  id v2;
  id v3;

  if (qword_255B51E60 != -1)
    dispatch_once(&qword_255B51E60, &unk_24F5351E8);
  v2 = (id)MEMORY[0x24BDACB78];
  v3 = MEMORY[0x24BDACB78];
  if (a1 <= 1)
  {
    v2 = (id)qword_255B51E50[a1];

  }
  return v2;
}

void sub_22AE24764()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;

  v0 = os_log_create("com.apple.corerepair", "device");
  v1 = (void *)qword_255B51E50[0];
  qword_255B51E50[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.corerepair", "device-error");
  v3 = (void *)qword_255B51E58;
  qword_255B51E58 = (uint64_t)v2;

}

uint64_t sub_22AE247C0(uint64_t result, unint64_t *a2, unint64_t *a3)
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

unint64_t *sub_22AE249B0(unint64_t *result, unint64_t *a2)
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

uint64_t sub_22AE249DC(unint64_t *a1, unint64_t *a2)
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
  result = sub_22AE247C0((uint64_t)v10, a2, 0);
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

void sub_22AE24A98()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Unable to find /defaults node", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE24AC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Failed to retrieve data classes to write to EAN", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE24AF0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "EAN Verify failed", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE24B1C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2169C();
  sub_22AE21668(&dword_22AE1C000, v0, v1, "Failed to delete FDR data instance for: %@", v2, v3, v4, v5, v6);
  sub_22AE21688();
}

void sub_22AE24B7C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2169C();
  sub_22AE21668(&dword_22AE1C000, v0, v1, "Failed to write FDR data instance for: %@", v2, v3, v4, v5, v6);
  sub_22AE21688();
}

void sub_22AE24BDC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Cannot allocate buffer for data padding", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE24C08()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Could not get queryKey", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE24C34(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_22AE21668(&dword_22AE1C000, a1, a3, "Failed to open service %s", a5, a6, a7, a8, 2u);
  sub_22AE21688();
}

void sub_22AE24CA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE21690();
  sub_22AE21678(&dword_22AE1C000, v0, v1, "Failed to write to EAN with kernResult = 0x%x", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE24D04()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_22AE216B8();
  sub_22AE216A8(&dword_22AE1C000, v0, v1, "IOServiceOpen on %s failed, kernResult = 0x%x", v2, v3, v4, v5, 2u);
  sub_22AE21688();
}

void sub_22AE24D70(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_22AE21678(&dword_22AE1C000, a1, a3, "imageSize isn't %d-aligned.", a5, a6, a7, a8, 0);
  sub_22AE21654();
}

void sub_22AE24DDC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Final size of padded data isn't inputSize+paddingSize", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE24E08()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Failed to get chosen info", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE24E34()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Failed to get syscfg-erly-kbgs-data-class", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE24E60()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Unable to allocate memory for byte reversal", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE24E8C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Invalid args", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE24EB8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Unexpected der length", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE24EE4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Failed to get true size of der object", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE24F10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE21690();
  sub_22AE21678(&dword_22AE1C000, v0, v1, "Failed to read EAN with kernResult = 0x%x", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE24F70()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE21690();
  sub_22AE21678(&dword_22AE1C000, v0, v1, "Could not get size of data context IOConnectCallScalarMethod kAppleNVMeEANGetSize:%d", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE24FD0(void *a1, NSObject *a2)
{
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "length");
  sub_22AE2169C();
  _os_log_error_impl(&dword_22AE1C000, a2, OS_LOG_TYPE_ERROR, "key is not 4 bytes (%lu)", v3, 0xCu);
}

void sub_22AE25054()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE21690();
  sub_22AE21678(&dword_22AE1C000, v0, v1, "Failed to delete EAN with kernResult = 0x%x", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE250B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Verify FDR data from EAN using cache, but missing cached data.", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE250E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2169C();
  sub_22AE21668(&dword_22AE1C000, v0, v1, "Data class (%@) mismatch from previous data.", v2, v3, v4, v5, v6);
  sub_22AE21688();
}

void sub_22AE25140()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Failed to read data class from EAN", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE2516C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Failed to get EAN data classes to verify", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE25198()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2169C();
  sub_22AE21668(&dword_22AE1C000, v0, v1, "Data class (%@) mismatch from FDR local data.", v2, v3, v4, v5, v6);
  sub_22AE21688();
}

void sub_22AE251F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE21690();
  sub_22AE21678(&dword_22AE1C000, v0, v1, "syscfg_fdr: could not determine actual size of DER encoded object (derstat = %d)", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE25258(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_22AE21668(&dword_22AE1C000, a1, a3, "%s: no ticket", a5, a6, a7, a8, 2u);
  sub_22AE21688();
}

void sub_22AE252C8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_22AE21668(&dword_22AE1C000, a1, a3, "%s: failed to allocated digest data", a5, a6, a7, a8, 2u);
  sub_22AE21688();
}

void sub_22AE25338(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_22AE21668(&dword_22AE1C000, a1, a3, "%s: failed to get data property from Img4 manifest", a5, a6, a7, a8, 2u);
  sub_22AE21688();
}

void sub_22AE253A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Failed to get ap_ticket.", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE253D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "fdrOptions failed allocation", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE25400(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_22AE21668(&dword_22AE1C000, a1, a3, "failed to create data directory URL from %@", a5, a6, a7, a8, 2u);
  sub_22AE21688();
}

void sub_22AE25468()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "failed to create FDR local store", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE25494()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Failed to read trust object digest from apticket.", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE254C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Failed to load seal instance array.", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE254EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Failed to load seal data.", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE25518()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Unable to read FDR Trust object.", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE25544()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "key is NULL.", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE25570()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "payloadType is invalid.", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE2559C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "IOServiceGetMatchingService failed to find kNVMeEANServiceMatchName.", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE255C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "IOServiceOpen returned IO_OBJECT_NULL.", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE255F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE21690();
  sub_22AE21678(&dword_22AE1C000, v0, v1, "getSize failed, kernResult = 0x%x.", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE25654()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE21690();
  sub_22AE21678(&dword_22AE1C000, v0, v1, "IOServiceOpen returned result=0x%04x.", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE256B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Hash is inside header.", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE256E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Hash size is zero.", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE2570C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "FDR info payload is empty.", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE25738()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Hash is extends outside payload.", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE25764()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Generation count is invalid.", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE25790()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_22AE216DC();
  sub_22AE216CC(&dword_22AE1C000, v0, v1, "Bad fdr info header version.\tExpect: %d\tFound: %d", v2, v3, v4, v5, 0);
  sub_22AE21688();
}

void sub_22AE257FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_22AE216DC();
  sub_22AE216CC(&dword_22AE1C000, v0, v1, "Bad fdr info header magic.\tExpect: %d\tFound: %d", v2, v3, v4, v5, 0);
  sub_22AE21688();
}

void sub_22AE2586C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "FDR parts array is NULL.", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE25898()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "FDR parts array is empty.", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE258C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Failed to load APTK key.", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE258F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "ean_dictionary is NULL", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE2591C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "IOServiceGetMatchingService failed to find kNVMeEANServiceMatchName", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE25948()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "IOServiceOpen returned IO_OBJECT_NULL", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE25974()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE21690();
  sub_22AE21678(&dword_22AE1C000, v0, v1, "IOServiceOpen returned result=0x%04x", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE259D4()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  sub_22AE2169C();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_22AE1C000, v1, OS_LOG_TYPE_ERROR, "Failed to copy staged FDR EAN data:%@:%@", v2, 0x16u);
  sub_22AE21688();
}

void sub_22AE25A50(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_22AE21668(&dword_22AE1C000, a1, a3, "Failed to write FDR data instance for: %@", a5, a6, a7, a8, 2u);
  sub_22AE21688();
}

void sub_22AE25AC0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "key1 is NULL.", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE25AEC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "key2 is NULL.", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE25B18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "payloadType1 is invalid.", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE25B44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "payloadType2 is invalid.", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE25B70()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "IOServiceOpen returned IO_OBJECT_NULL.", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE25B9C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE21690();
  sub_22AE21678(&dword_22AE1C000, v0, v1, "swapImage failed, kernResult = 0x%x.", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE25BFC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Versioned FDR corrupted", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE25C28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Failed to commit fdr2->fdr1", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE25C54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "unable to find chosen node", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE25C80()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "unable to create NSData of ticket hash", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE25CAC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2169C();
  sub_22AE21668(&dword_22AE1C000, v0, v1, "img4CryptoHashMethodData not recognized:%@", v2, v3, v4, v5, v6);
  sub_22AE21688();
}

void sub_22AE25D0C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "no ticket available", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE25D38()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Unable to read ap ticket.", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE25D64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Failed to read ap ticket hash.", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE25D90()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Failed to swap Versioned FDR", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE25DBC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Failed to setupVersioned FDR", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE25DE8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "apTicket type mismatch", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE25E14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE246DC(*MEMORY[0x24BDAC8D0]);
  sub_22AE246D0();
  sub_22AE21668(&dword_22AE1C000, v0, v1, "Local sealing manifest populate failed, error = %@", v2, v3, v4, v5, v6);
  sub_22AE21688();
}

void sub_22AE25E74()
{
  uint64_t v0;
  os_log_t v1;

  sub_22AE246AC();
  sub_22AE24674(&dword_22AE1C000, v0, v1, "Failed to verify local %@ data; error: %@");
  sub_22AE21688();
}

void sub_22AE25ED8()
{
  uint64_t v0;
  os_log_t v1;

  sub_22AE246AC();
  sub_22AE24674(&dword_22AE1C000, v0, v1, "Failed to read local %@ data; error: %@");
  sub_22AE21688();
}

void sub_22AE25F3C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2169C();
  sub_22AE21668(&dword_22AE1C000, v0, v1, "Cannot copy %@ data from device", v2, v3, v4, v5, v6);
  sub_22AE21688();
}

void sub_22AE25F9C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_22AE21678(&dword_22AE1C000, a2, a3, "Failed to get payload; stat: %d", a5, a6, a7, a8, 0);
  sub_22AE21654();
}

void sub_22AE26000(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_22AE21678(&dword_22AE1C000, a2, a3, "Failed to parse cert as img4; stat: %d", a5, a6, a7, a8, 0);
  sub_22AE21654();
}

void sub_22AE26064()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Data class is nil", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE26090()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE246DC(*MEMORY[0x24BDAC8D0]);
  sub_22AE246D0();
  sub_22AE21668(&dword_22AE1C000, v0, v1, "Failed to get DataInstance:%@", v2, v3, v4, v5, v6);
  sub_22AE21688();
}

void sub_22AE260F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE246DC(*MEMORY[0x24BDAC8D0]);
  sub_22AE246D0();
  sub_22AE21668(&dword_22AE1C000, v0, v1, "Copy manifest data failed, error = %@", v2, v3, v4, v5, v6);
  sub_22AE21688();
}

void sub_22AE26150()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2169C();
  sub_22AE21668(&dword_22AE1C000, v0, v1, "%@", v2, v3, v4, v5, v6);
  sub_22AE21688();
}

void sub_22AE261B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Local Sealing manifest fetch failed", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE261DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "DataInstances and Classes count mismatch", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE26208()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Failed to read EAN", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE26234(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_22AE2169C();
  _os_log_error_impl(&dword_22AE1C000, a2, OS_LOG_TYPE_ERROR, "%@", v4, 0xCu);

  sub_22AE246A0();
}

void sub_22AE262BC()
{
  void *v0;
  uint64_t v1;
  os_log_t v2;

  sub_22AE246C4();
  sub_22AE24688();
  sub_22AE24674(&dword_22AE1C000, v1, v2, "Failed to read sealed property of %@: %@");

  sub_22AE246A0();
}

void sub_22AE26324()
{
  void *v0;
  uint64_t v1;
  os_log_t v2;

  sub_22AE246C4();
  sub_22AE24688();
  sub_22AE24674(&dword_22AE1C000, v1, v2, "Failed to read live property of %@: %@");

  sub_22AE246A0();
}

void sub_22AE2638C()
{
  void *v0;
  uint64_t v1;
  os_log_t v2;

  sub_22AE246C4();
  sub_22AE24688();
  sub_22AE24674(&dword_22AE1C000, v1, v2, "Failed to read sealed instances of %@: %@");

  sub_22AE246A0();
}

void sub_22AE263F4()
{
  void *v0;
  uint64_t v1;
  os_log_t v2;

  sub_22AE246C4();
  sub_22AE24688();
  sub_22AE24674(&dword_22AE1C000, v1, v2, "Failed to read live instances of %@: %@");

  sub_22AE246A0();
}

void sub_22AE2645C(void **a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v8;

  v8 = *a1;
  sub_22AE21668(&dword_22AE1C000, a2, a3, "Failed to read live sensor number, error: %@", a5, a6, a7, a8, 2u);

  sub_22AE246A0();
}

void sub_22AE264CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Failed to create amfdr", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE264F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Failed to create property value string", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE26524()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Failed to get 'SrvT' property", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE26550()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Failed to read seal data", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE2657C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "No EAN support.", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE265A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE2165C();
  sub_22AE21644(&dword_22AE1C000, v0, v1, "Failed to create fdrLocal", v2, v3, v4, v5, v6);
  sub_22AE21654();
}

void sub_22AE265D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AE246DC(*MEMORY[0x24BDAC8D0]);
  sub_22AE246D0();
  sub_22AE21668(&dword_22AE1C000, v0, v1, "Failed to get local manifest properties, error: %@", v2, v3, v4, v5, v6);
  sub_22AE21688();
}

uint64_t AMFDRCreateTypeWithOptions()
{
  return MEMORY[0x24BED4150]();
}

uint64_t AMFDRCreateWithOptions()
{
  return MEMORY[0x24BED4158]();
}

uint64_t AMFDRDataCopyManifest()
{
  return MEMORY[0x24BED4180]();
}

uint64_t AMFDRDataCopySealingManifestProperty()
{
  return MEMORY[0x24BED4188]();
}

uint64_t AMFDRDataCopyTrustObject()
{
  return MEMORY[0x24BED4198]();
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

uint64_t AMFDRSealingManifestCopyMultiInstanceForClass()
{
  return MEMORY[0x24BED42F0]();
}

uint64_t AMFDRSealingMapCopyLocalData()
{
  return MEMORY[0x24BED4320]();
}

uint64_t AMFDRSealingMapCopyLocalDataForClass()
{
  return MEMORY[0x24BED4328]();
}

uint64_t AMFDRSealingMapCopyManifestProperties()
{
  return MEMORY[0x24BED4340]();
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

uint64_t AMFDRSealingMapPopulateSealingManifest()
{
  return MEMORY[0x24BED4390]();
}

uint64_t AMFDRSetOption()
{
  return MEMORY[0x24BED43A8]();
}

uint64_t AMSupportSafeFree()
{
  return MEMORY[0x24BEDA0D8]();
}

uint64_t AMSupportSafeRelease()
{
  return MEMORY[0x24BEDA0E0]();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC320](data, *(_QWORD *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA384(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC378](data, *(_QWORD *)&len, md);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
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

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

void CFDataIncreaseLength(CFMutableDataRef theData, CFIndex extraLength)
{
  MEMORY[0x24BDBBD10](theData, extraLength);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
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

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC858](allocator, filePath, pathStyle, isDirectory);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7F00](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x24BDD88C0](*(_QWORD *)&mainPort, path);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t Img4DecodeGetObjectPropertyData()
{
  return MEMORY[0x24BEDA1C8]();
}

uint64_t Img4DecodeGetPayload()
{
  return MEMORY[0x24BEDA1D8]();
}

uint64_t Img4DecodeInit()
{
  return MEMORY[0x24BEDA200]();
}

uint64_t Img4DecodeInitManifest()
{
  return MEMORY[0x24BEDA208]();
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
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

