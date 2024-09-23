void sub_2391B536C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  uint64_t v14;

  MEMORY[0x23B838838](v14, MEMORY[0x24BEDB6B8]);
  _Unwind_Resume(a1);
}

void sub_2391B53AC(uint64_t a1, int a2)
{
  uint64_t v2;
  int v3;
  BOOL v4;
  int v5;
  int v6;

  if (a2 == 6)
  {
    if (*(_DWORD *)(a1 + 424) != 1)
      return;
    v2 = a1 + 392;
    v3 = *(_DWORD *)(sub_2391B7D4C() + 32);
    v4 = v3 == 0;
    v5 = 10;
    goto LABEL_7;
  }
  if (a2 != 4)
  {
    sub_2391B3D64(a1 + 392);
    return;
  }
  if (*(_DWORD *)(a1 + 424) == 1)
  {
    v2 = a1 + 392;
    v3 = *(_DWORD *)(sub_2391B7D4C() + 28);
    v4 = v3 == 0;
    v5 = 11;
LABEL_7:
    if (v4)
      v6 = v5;
    else
      v6 = v3;
    sub_2391B3E7C(v2, v6);
    sub_2391B39D4(v2);
  }
}

void sub_2391B5444(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  unsigned int v5;
  _QWORD *v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unsigned int v11[2];
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = sub_2391BDC54();
  v5 = *(_DWORD *)(a1 + 376);
  v12 = 0;
  v14 = 0;
  v11[0] = v5;
  v15 = -1;
  v13 = a2;
  sub_2391BE930(v4, v11);
  if (a2 == 6)
  {
    v6 = sub_2391B5594(a1);
    (*(void (**)(_QWORD *))(*v6 + 16))(v6);
  }
  else
  {
    v7 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      v11[0] = 67109120;
      v11[1] = 514;
      _os_log_error_impl(&dword_2390FD000, v7, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", (uint8_t *)v11, 8u);
    }
    v8 = sub_2391B1EF8();
    *(_QWORD *)(v8 + 40) = *(_QWORD *)(v8 + 32);
    v9 = (_QWORD *)sub_2391AE584();
    sub_23918EDCC((uint64_t)off_25691E330, *(_DWORD *)(a1 + 376));
    sub_2391AEFF8(v9);
    v10 = sub_2391B1EF8();
    sub_2391B3078(v10, *(_DWORD *)(a1 + 376));
  }
}

_QWORD *sub_2391B5594(uint64_t a1)
{
  _QWORD *v1;
  NSObject *v3;
  _QWORD *v4;
  NSObject *v5;
  int v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD **)(a1 + 432);
  if (!v1)
  {
    v3 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      v7 = 67109120;
      v8 = 513;
      _os_log_error_impl(&dword_2390FD000, v3, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", (uint8_t *)&v7, 8u);
    }
    v4 = operator new(0x168uLL, MEMORY[0x24BEDB6B8]);
    v1 = v4;
    if (v4)
    {
      sub_2391B7394((uint64_t)v4);
      *v1 = &off_250A73BD8;
      *(_QWORD *)(a1 + 432) = v1;
    }
    else
    {
      *(_QWORD *)(a1 + 432) = 0;
      v5 = qword_2542CF618;
      if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
      {
        v7 = 67109120;
        v8 = 1537;
        _os_log_error_impl(&dword_2390FD000, v5, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", (uint8_t *)&v7, 8u);
        return *(_QWORD **)(a1 + 432);
      }
    }
  }
  return v1;
}

void sub_2391B56D8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x23B838838](v1, MEMORY[0x24BEDB6B8]);
  _Unwind_Resume(a1);
}

void sub_2391B56F4(uint64_t a1, unsigned int a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  v4 = *(_DWORD *)(a1 + 376);
  v5 = *(_QWORD *)(a1 + 432);
  if (v5 && *(_BYTE *)(v5 + 16) != 7)
  {
    sub_2391B74F4(v5, 7, a1);
    sub_239199C58(*(_QWORD *)(a1 + 432));
  }
  v6 = sub_2391BDC54();
  v7 = *(_DWORD *)(a1 + 376);
  v10 = 0;
  v12 = 0;
  v9 = v7;
  v13 = -1;
  v11 = a2;
  sub_2391BE930(v6, &v9);
  v8 = sub_2391B1EF8();
  sub_2391B3078(v8, v4);
}

uint64_t sub_2391B5788(uint64_t result, _QWORD *a2)
{
  uint64_t v3;
  _QWORD *v4;

  if (*a2 != a2[1])
  {
    v3 = result;
    sub_2391B3D64(result + 392);
    *(_DWORD *)(sub_2391B7D4C() + 280) = *(_DWORD *)(v3 + 596);
    v4 = sub_2391B5594(v3);
    return (*(uint64_t (**)(_QWORD *, _QWORD *))(*v4 + 40))(v4, a2);
  }
  return result;
}

void sub_2391B57E8(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD v4[2];
  char v5;
  void *__p[4];

  __p[3] = *(void **)MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 432))
  {
    if (*(_DWORD *)(a1 + 396) != 1)
    {
      v2 = qword_2542CF618;
      if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
      {
        __p[0] = (void *)0x40404000100;
        _os_log_error_impl(&dword_2390FD000, v2, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", (uint8_t *)__p, 8u);
      }
    }
    *(_DWORD *)(a1 + 396) = 0;
    sub_2391015AC(__p, 0xBB8uLL);
    v4[0] = __p;
    v4[1] = 0;
    v5 = 0;
    sub_2391B74F4(*(_QWORD *)(a1 + 432), 7, a1);
    (*(void (**)(_QWORD, _QWORD *))(**(_QWORD **)(a1 + 432) + 32))(*(_QWORD *)(a1 + 432), v4);
    sub_239199C58(*(_QWORD *)(a1 + 432));
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
  }
  else
  {
    v3 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      __p[0] = (void *)0x20104000100;
      _os_log_error_impl(&dword_2390FD000, v3, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", (uint8_t *)__p, 8u);
    }
  }
}

void sub_2391B5958(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  _Unwind_Resume(exception_object);
}

void sub_2391B597C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v4 = *(_QWORD *)(a1 + 440);
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    v5 = *(_QWORD *)(a1 + 432);
    *(_QWORD *)(a1 + 432) = a2;
    *(_QWORD *)(a1 + 440) = v5;
  }
  else
  {
    v6 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      v7[0] = 67109120;
      v7[1] = 515;
      _os_log_error_impl(&dword_2390FD000, v6, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", (uint8_t *)v7, 8u);
    }
  }
}

uint64_t sub_2391B5A48(uint64_t a1, uint64_t a2)
{
  *(_WORD *)(a1 + 520) = *(_WORD *)a2;
  *(_QWORD *)(a1 + 528) = *(_QWORD *)(a2 + 8);
  if (a1 + 520 != a2)
  {
    sub_239107FF0((_QWORD *)(a1 + 536), *(char **)(a2 + 16), *(char **)(a2 + 24), *(_QWORD *)(a2 + 24) - *(_QWORD *)(a2 + 16));
    sub_239107FF0((_QWORD *)(a1 + 560), *(char **)(a2 + 40), *(char **)(a2 + 48), *(_QWORD *)(a2 + 48) - *(_QWORD *)(a2 + 40));
  }
  *(_BYTE *)(a1 + 584) = *(_BYTE *)(a2 + 64);
  return sub_23918BCB0((_DWORD *)(a1 + 24));
}

void sub_2391B5AB0(uint64_t a1, int a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  NSObject *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD v11[2];
  char v12;
  void *__p[4];

  __p[3] = *(void **)MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 432);
  if (v4)
    goto LABEL_5;
  v5 = operator new(0x168uLL, MEMORY[0x24BEDB6B8]);
  v6 = v5;
  if (v5)
  {
    sub_2391B7394((uint64_t)v5);
    *v6 = &off_250A73BD8;
  }
  sub_2391B597C(a1, (uint64_t)v6);
  v4 = *(_QWORD *)(a1 + 432);
  if (v4)
  {
LABEL_5:
    sub_2391B74F4(v4, 7, a1);
    v7 = *(_QWORD **)(a1 + 432);
    if (!a2)
    {
      *(_BYTE *)(v7[5] + 456) = 18;
      *(_DWORD *)(v7[5] + 4) = 1;
      sub_2391015AC(__p, 0xBB8uLL);
      v11[0] = __p;
      v11[1] = 0;
      v12 = 0;
      sub_239199EAC((uint64_t)v7);
      (*(void (**)(_QWORD *, _QWORD *))(*v7 + 32))(v7, v11);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }
    sub_239199C58((uint64_t)v7);
  }
  else
  {
    v8 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      __p[0] = (void *)0x60104000100;
      _os_log_error_impl(&dword_2390FD000, v8, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", (uint8_t *)__p, 8u);
    }
    v9 = (_QWORD *)sub_2391AE584();
    sub_23918EDCC((uint64_t)off_25691E330, *(_DWORD *)(a1 + 376));
    sub_2391AEFF8(v9);
    v10 = sub_2391B1EF8();
    sub_2391B3078(v10, *(_DWORD *)(a1 + 376));
  }
}

void sub_2391B5C5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  uint64_t v14;

  MEMORY[0x23B838838](v14, MEMORY[0x24BEDB6B8]);
  _Unwind_Resume(a1);
}

uint64_t sub_2391B5C98(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  int v9;
  NSObject *v10;
  int v11;
  int v12;
  char *v13;
  unsigned int v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = sub_23918C42C(a1, 0, 1, *a2 - 1);
  if ((_DWORD)v4)
  {
    v5 = v4;
    v6 = *(_DWORD *)(a1 + 8);
    v7 = *(_DWORD *)(a1 + 12);
LABEL_3:
    sub_23918C1A0(v4, v6, v7, "asn1PE_IPAddress");
    return v5;
  }
  v9 = *a2;
  if (v9 == 2)
  {
    v5 = sub_23918CC8C(a1, 0, 0, 16, (_QWORD *)a2 + 4, 1, 0);
    if (!(_DWORD)v5)
      return v5;
    v15 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEBUG))
    {
      v18 = 67109120;
      v19 = v5;
      _os_log_debug_impl(&dword_2390FD000, v15, OS_LOG_TYPE_DEBUG, "#gpsd,#supl asn1PE_IPAddress_ipv6Address, encoding error %d", (uint8_t *)&v18, 8u);
    }
    v11 = *(_DWORD *)(a1 + 8);
    v12 = *(_DWORD *)(a1 + 12);
    v13 = "asn1PE_IPAddress_ipv6Address";
    v14 = v5;
LABEL_15:
    sub_23918C1A0(v14, v11, v12, v13);
    v16 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      v18 = 67109120;
      v19 = v5;
      _os_log_error_impl(&dword_2390FD000, v16, OS_LOG_TYPE_ERROR, "#gpsd,#supl asn1PE_IPAddress, encoding error %d", (uint8_t *)&v18, 8u);
    }
    v6 = *(_DWORD *)(a1 + 8);
    v7 = *(_DWORD *)(a1 + 12);
    LODWORD(v4) = v5;
    goto LABEL_3;
  }
  if (v9 == 1)
  {
    v5 = sub_23918CC8C(a1, 0, 0, 4, (_QWORD *)a2 + 1, 1, 0);
    if (!(_DWORD)v5)
      return v5;
    v10 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      v18 = 67109120;
      v19 = v5;
      _os_log_error_impl(&dword_2390FD000, v10, OS_LOG_TYPE_ERROR, "#gpsd,#supl asn1PE_IPAddress_ipv4Address, encoding error %d", (uint8_t *)&v18, 8u);
    }
    v11 = *(_DWORD *)(a1 + 8);
    v12 = *(_DWORD *)(a1 + 12);
    v13 = "asn1PE_IPAddress_ipv4Address";
    v14 = v5;
    goto LABEL_15;
  }
  v17 = qword_2542CF618;
  if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v18) = 0;
    _os_log_error_impl(&dword_2390FD000, v17, OS_LOG_TYPE_ERROR, "#gpsd,#supl asn1PE_IPAddress, invalid IP addr type", (uint8_t *)&v18, 2u);
  }
  sub_23918C1A0(0, *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12), "asn1PE_IPAddress");
  return 0;
}

uint64_t sub_2391B5F28(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  int v8;
  unsigned int v9;
  int v11;
  NSObject *v12;
  int v13;
  int v14;
  char *v15;
  unsigned int v16;
  NSObject *v17;
  NSObject *v18;
  unsigned __int8 v19;
  uint8_t buf[4];
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v19 = 0;
  v4 = sub_23918C4D0(a1, 0, 1u, &v19);
  if ((_DWORD)v4)
  {
    v5 = v4;
    v6 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v21 = v5;
      _os_log_error_impl(&dword_2390FD000, v6, OS_LOG_TYPE_ERROR, "#gpsd,#supl asn1PD_IPAddress, encoding error %d", buf, 8u);
    }
    v7 = *(_DWORD *)(a1 + 8);
    v8 = *(_DWORD *)(a1 + 12);
    v9 = v5;
    goto LABEL_5;
  }
  v11 = v19;
  *(_BYTE *)a2 = v19 + 1;
  if (v11 == 1)
  {
    sub_23918C9B4(a1, 0x80u, (unint64_t *)(a2 + 32), 0);
    v5 = *(unsigned __int8 *)(a1 + 16);
    if (!*(_BYTE *)(a1 + 16))
      return v5;
    v17 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      v21 = v5;
      _os_log_debug_impl(&dword_2390FD000, v17, OS_LOG_TYPE_DEBUG, "#gpsd,#supl asn1PD_IPAddress_ipv6Address, decoing error %d", buf, 8u);
    }
    v13 = *(_DWORD *)(a1 + 8);
    v14 = *(_DWORD *)(a1 + 12);
    v15 = "asn1PD_IPAddress_ipv6Address";
    v16 = v5;
LABEL_17:
    sub_23918C1A0(v16, v13, v14, v15);
    v18 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v21 = v5;
      _os_log_error_impl(&dword_2390FD000, v18, OS_LOG_TYPE_ERROR, "#gpsd,#supl asn1PD_IPAddress, encoding error %d", buf, 8u);
    }
    v7 = *(_DWORD *)(a1 + 8);
    v8 = *(_DWORD *)(a1 + 12);
    v9 = v5;
    goto LABEL_5;
  }
  if (!v11)
  {
    sub_23918C9B4(a1, 0x20u, (unint64_t *)(a2 + 8), 0);
    v5 = *(unsigned __int8 *)(a1 + 16);
    if (!*(_BYTE *)(a1 + 16))
      return v5;
    v12 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v21 = v5;
      _os_log_error_impl(&dword_2390FD000, v12, OS_LOG_TYPE_ERROR, "#gpsd,#supl asn1PD_IPAddress_ipv4Address, decoding error %d", buf, 8u);
    }
    v13 = *(_DWORD *)(a1 + 8);
    v14 = *(_DWORD *)(a1 + 12);
    v15 = "asn1PD_IPAddress_ipv4Address";
    v16 = v5;
    goto LABEL_17;
  }
  v7 = *(_DWORD *)(a1 + 8);
  v8 = *(_DWORD *)(a1 + 12);
  v5 = 4;
  v9 = 4;
LABEL_5:
  sub_23918C1A0(v9, v7, v8, "asn1PD_IPAddress");
  return v5;
}

uint64_t sub_2391B61B0(uint64_t a1, unint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  int v6;

  v6 = 0;
  v3 = sub_23918D01C(a1, 1, 0xFFu, &v6, a2, 0x40u, (uint64_t)"-.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz", 0);
  v4 = v3;
  if ((_DWORD)v3)
    sub_23918C1A0(v3, *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12), "asn1PD_FQDN");
  return v4;
}

uint64_t sub_2391B6220(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  int v9;
  uint64_t v10;

  sub_23918C32C((uint64_t **)a1, 0);
  v4 = *(unsigned __int8 *)(a1 + 16);
  if (*(_BYTE *)(a1 + 16))
  {
    v5 = *(_DWORD *)(a1 + 8);
    v6 = *(_DWORD *)(a1 + 12);
    LODWORD(v7) = *(unsigned __int8 *)(a1 + 16);
  }
  else
  {
    v7 = sub_23918C42C(a1, 0, 1, *a2 - 1);
    if ((_DWORD)v7)
    {
      v4 = v7;
      v5 = *(_DWORD *)(a1 + 8);
      v6 = *(_DWORD *)(a1 + 12);
    }
    else
    {
      v9 = *a2;
      switch(v9)
      {
        case 1:
          v4 = sub_2391B5C98(a1, a2 + 8);
          if (!(_DWORD)v4)
            return v4;
          break;
        case 255:
          v5 = *(_DWORD *)(a1 + 8);
          v6 = *(_DWORD *)(a1 + 12);
          v4 = 1;
          LODWORD(v7) = 1;
          goto LABEL_5;
        case 2:
          v10 = sub_23918CD14(a1, 1, 0xFFu, *((_DWORD *)a2 + 18) - *((_DWORD *)a2 + 16), (_QWORD *)a2 + 8, 64, (uint64_t)"-.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz", 0);
          v4 = v10;
          if (!(_DWORD)v10)
            return v4;
          sub_23918C1A0(v10, *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12), "asn1PE_FQDN");
          break;
        default:
          v5 = *(_DWORD *)(a1 + 8);
          v6 = *(_DWORD *)(a1 + 12);
          v4 = 4;
          LODWORD(v7) = 4;
          goto LABEL_5;
      }
      v5 = *(_DWORD *)(a1 + 8);
      v6 = *(_DWORD *)(a1 + 12);
      LODWORD(v7) = v4;
    }
  }
LABEL_5:
  sub_23918C1A0(v7, v5, v6, "asn1PE_SLPAddress");
  return v4;
}

uint64_t sub_2391B637C(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  int v10;
  unsigned __int8 v11;

  v4 = sub_23918C3B4((uint64_t **)a1);
  v5 = *(unsigned __int8 *)(a1 + 16);
  if (*(_BYTE *)(a1 + 16))
  {
    v6 = *(_DWORD *)(a1 + 8);
    v7 = *(_DWORD *)(a1 + 12);
    LODWORD(v8) = *(unsigned __int8 *)(a1 + 16);
  }
  else if (v4)
  {
    sub_23918D714(a1);
    v5 = v8;
    if (!(_DWORD)v8)
      return v5;
    v6 = *(_DWORD *)(a1 + 8);
    v7 = *(_DWORD *)(a1 + 12);
  }
  else
  {
    v11 = 0;
    v8 = sub_23918C4D0(a1, 0, 1u, &v11);
    if ((_DWORD)v8)
    {
      v5 = v8;
      v6 = *(_DWORD *)(a1 + 8);
      v7 = *(_DWORD *)(a1 + 12);
    }
    else
    {
      v10 = v11;
      *(_BYTE *)a2 = v11 + 1;
      if (v10 != 254)
      {
        if (v10 == 1)
        {
          v8 = sub_2391B61B0(a1, (unint64_t *)(a2 + 64));
        }
        else
        {
          if (v10)
          {
            v6 = *(_DWORD *)(a1 + 8);
            v7 = *(_DWORD *)(a1 + 12);
            v5 = 4;
            LODWORD(v8) = 4;
            goto LABEL_3;
          }
          v8 = sub_2391B5F28(a1, a2 + 8);
        }
        v5 = v8;
        if (!(_DWORD)v8)
          return v5;
        v6 = *(_DWORD *)(a1 + 8);
        v7 = *(_DWORD *)(a1 + 12);
        goto LABEL_3;
      }
      v6 = *(_DWORD *)(a1 + 8);
      v7 = *(_DWORD *)(a1 + 12);
      v5 = 1;
      LODWORD(v8) = 1;
    }
  }
LABEL_3:
  sub_23918C1A0(v8, v6, v7, "asn1PD_SLPAddress");
  return v5;
}

uint64_t sub_2391B64C8(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_23918CC8C(a1, 0, 0, 8, a2, 1, 1);
  v4 = v3;
  if ((_DWORD)v3)
    sub_23918C1A0(v3, *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12), "asn1PE_SETId_msisdn");
  return v4;
}

uint64_t sub_2391B6524(uint64_t a1, unint64_t *a2)
{
  uint64_t v3;

  sub_23918C9B4(a1, 0x40u, a2, 1);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (*(_BYTE *)(a1 + 16))
    sub_23918C1A0(*(unsigned __int8 *)(a1 + 16), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12), "asn1PD_SETId_msisdn");
  return v3;
}

uint64_t sub_2391B6574(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_23918CC8C(a1, 0, 0, 8, a2, 1, 0);
  v4 = v3;
  if ((_DWORD)v3)
    sub_23918C1A0(v3, *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12), "asn1PE_SETId_mdn");
  return v4;
}

uint64_t sub_2391B65D0(uint64_t a1, unint64_t *a2)
{
  uint64_t v3;

  sub_23918C9B4(a1, 0x40u, a2, 0);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (*(_BYTE *)(a1 + 16))
    sub_23918C1A0(*(unsigned __int8 *)(a1 + 16), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12), "asn1PD_SETId_mdn");
  return v3;
}

uint64_t sub_2391B6620(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_23918C814(a1, 0, 0, 0x22u, a2, 1);
  v4 = v3;
  if ((_DWORD)v3)
    sub_23918C1A0(v3, *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12), "asn1PE_SETId_min");
  return v4;
}

uint64_t sub_2391B6678(uint64_t a1, unint64_t *a2)
{
  uint64_t v3;

  sub_23918C9B4(a1, 0x22u, a2, 0);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (*(_BYTE *)(a1 + 16))
    sub_23918C1A0(*(unsigned __int8 *)(a1 + 16), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12), "asn1PD_SETId_min");
  return v3;
}

uint64_t sub_2391B66C8(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_23918CC8C(a1, 0, 0, 8, a2, 1, 1);
  v4 = v3;
  if ((_DWORD)v3)
    sub_23918C1A0(v3, *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12), "asn1PE_SETId_imsi");
  return v4;
}

uint64_t sub_2391B6724(uint64_t a1, unint64_t *a2)
{
  uint64_t v3;

  sub_23918C9B4(a1, 0x40u, a2, 1);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (*(_BYTE *)(a1 + 16))
    sub_23918C1A0(*(unsigned __int8 *)(a1 + 16), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12), "asn1PD_SETId_imsi");
  return v3;
}

uint64_t sub_2391B6774(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;

  sub_23918C32C((uint64_t **)a1, 0);
  v4 = *(unsigned __int8 *)(a1 + 16);
  if (*(_BYTE *)(a1 + 16))
  {
    v5 = *(_DWORD *)(a1 + 8);
    v6 = *(_DWORD *)(a1 + 12);
    LODWORD(v7) = *(unsigned __int8 *)(a1 + 16);
LABEL_17:
    sub_23918C1A0(v7, v5, v6, "asn1PE_SETId");
    return v4;
  }
  v7 = sub_23918C42C(a1, 0, 5, *a2 - 1);
  if ((_DWORD)v7)
  {
    v4 = v7;
    v5 = *(_DWORD *)(a1 + 8);
    v6 = *(_DWORD *)(a1 + 12);
    goto LABEL_17;
  }
  switch(*a2)
  {
    case 1u:
      v7 = sub_2391B64C8(a1, (_QWORD *)a2 + 1);
      break;
    case 2u:
      v7 = sub_2391B6574(a1, (_QWORD *)a2 + 4);
      break;
    case 3u:
      v7 = sub_2391B6620(a1, (_QWORD *)a2 + 7);
      break;
    case 4u:
      v7 = sub_2391B66C8(a1, (_QWORD *)a2 + 10);
      break;
    case 5u:
      v7 = sub_23918D3D8(a1, 1, 1000, *((_DWORD *)a2 + 28) - *((_DWORD *)a2 + 26), (_QWORD *)a2 + 13, 0);
      break;
    case 6u:
      v7 = sub_2391B5C98(a1, a2 + 128);
      break;
    default:
      v5 = *(_DWORD *)(a1 + 8);
      v6 = *(_DWORD *)(a1 + 12);
      if (*a2 == 255)
      {
        v4 = 1;
        LODWORD(v7) = 1;
      }
      else
      {
        v4 = 4;
        LODWORD(v7) = 4;
      }
      goto LABEL_17;
  }
  v4 = v7;
  if ((_DWORD)v7)
  {
    v5 = *(_DWORD *)(a1 + 8);
    v6 = *(_DWORD *)(a1 + 12);
    goto LABEL_17;
  }
  return v4;
}

uint64_t sub_2391B68F8(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  int v10;
  int v11;
  __int16 v12;

  v4 = sub_23918C3B4((uint64_t **)a1);
  v5 = *(unsigned __int8 *)(a1 + 16);
  if (*(_BYTE *)(a1 + 16))
  {
    v6 = *(_DWORD *)(a1 + 8);
    v7 = *(_DWORD *)(a1 + 12);
    LODWORD(v8) = *(unsigned __int8 *)(a1 + 16);
LABEL_3:
    sub_23918C1A0(v8, v6, v7, "asn1PD_SETId");
    return v5;
  }
  if (v4)
  {
    sub_23918D714(a1);
    v5 = v8;
    if (!(_DWORD)v8)
      return v5;
    v6 = *(_DWORD *)(a1 + 8);
    v7 = *(_DWORD *)(a1 + 12);
    goto LABEL_3;
  }
  v12 = 0;
  v8 = sub_23918C5A0(a1, 0, 5u, &v12);
  if ((_DWORD)v8)
  {
    v5 = v8;
    v6 = *(_DWORD *)(a1 + 8);
    v7 = *(_DWORD *)(a1 + 12);
    goto LABEL_3;
  }
  v10 = v12;
  *(_BYTE *)a2 = v12 + 1;
  switch(v10)
  {
    case 0:
      v8 = sub_2391B6524(a1, (unint64_t *)(a2 + 8));
      break;
    case 1:
      v8 = sub_2391B65D0(a1, (unint64_t *)(a2 + 32));
      break;
    case 2:
      v8 = sub_2391B6678(a1, (unint64_t *)(a2 + 56));
      break;
    case 3:
      v8 = sub_2391B6724(a1, (unint64_t *)(a2 + 80));
      break;
    case 4:
      v11 = 0;
      v8 = sub_23918D460(a1, 1, 0x3E8u, &v11, (unint64_t *)(a2 + 104), 0);
      break;
    case 5:
      v8 = sub_2391B5F28(a1, a2 + 128);
      break;
    default:
      v6 = *(_DWORD *)(a1 + 8);
      v7 = *(_DWORD *)(a1 + 12);
      if (v10 == 254)
      {
        v5 = 1;
        LODWORD(v8) = 1;
      }
      else
      {
        v5 = 4;
        LODWORD(v8) = 4;
      }
      goto LABEL_3;
  }
  v5 = v8;
  if ((_DWORD)v8)
  {
    v6 = *(_DWORD *)(a1 + 8);
    v7 = *(_DWORD *)(a1 + 12);
    goto LABEL_3;
  }
  return v5;
}

uint64_t sub_2391B6AAC(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_23918CC8C(a1, 0, 0, 4, a2, 1, 0);
  v4 = v3;
  if ((_DWORD)v3)
    sub_23918C1A0(v3, *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12), "asn1PE_SlpSessionID_sessionID");
  return v4;
}

uint64_t sub_2391B6B08(uint64_t a1, unint64_t *a2)
{
  uint64_t v3;

  sub_23918C9B4(a1, 0x20u, a2, 0);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (*(_BYTE *)(a1 + 16))
    sub_23918C1A0(*(unsigned __int8 *)(a1 + 16), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12), "asn1PD_SlpSessionID_sessionID");
  return v3;
}

uint64_t sub_2391B6B58(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;

  v4 = sub_2391B6AAC(a1, (_QWORD *)a2);
  if ((_DWORD)v4)
  {
    v5 = v4;
    v6 = *(_DWORD *)(a1 + 8);
    v7 = *(_DWORD *)(a1 + 12);
LABEL_5:
    sub_23918C1A0(v4, v6, v7, "asn1PE_SlpSessionID");
    return v5;
  }
  v4 = sub_2391B6220(a1, (unsigned __int8 *)(a2 + 24));
  v5 = v4;
  if ((_DWORD)v4)
  {
    v6 = *(_DWORD *)(a1 + 8);
    v7 = *(_DWORD *)(a1 + 12);
    goto LABEL_5;
  }
  return v5;
}

uint64_t sub_2391B6BD0(uint64_t a1, unint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;

  v4 = sub_2391B6B08(a1, a2);
  if ((_DWORD)v4)
  {
    v5 = v4;
    v6 = *(_DWORD *)(a1 + 8);
    v7 = *(_DWORD *)(a1 + 12);
LABEL_5:
    sub_23918C1A0(v4, v6, v7, "asn1PD_SlpSessionID");
    return v5;
  }
  v4 = sub_2391B637C(a1, (uint64_t)(a2 + 3));
  v5 = v4;
  if ((_DWORD)v4)
  {
    v6 = *(_DWORD *)(a1 + 8);
    v7 = *(_DWORD *)(a1 + 12);
    goto LABEL_5;
  }
  return v5;
}

uint64_t sub_2391B6C48(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;

  v4 = sub_23918C42C(a1, 0, 0xFFFF, *(unsigned __int16 *)a2);
  if ((_DWORD)v4)
  {
    v5 = v4;
    v6 = *(_DWORD *)(a1 + 8);
    v7 = *(_DWORD *)(a1 + 12);
LABEL_5:
    sub_23918C1A0(v4, v6, v7, "asn1PE_SetSessionID");
    return v5;
  }
  v4 = sub_2391B6774(a1, a2 + 8);
  v5 = v4;
  if ((_DWORD)v4)
  {
    v6 = *(_DWORD *)(a1 + 8);
    v7 = *(_DWORD *)(a1 + 12);
    goto LABEL_5;
  }
  return v5;
}

uint64_t sub_2391B6CCC(uint64_t a1, _WORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;

  v4 = sub_23918C5A0(a1, 0, 0xFFFFu, a2);
  if ((_DWORD)v4)
  {
    v5 = v4;
    v6 = *(_DWORD *)(a1 + 8);
    v7 = *(_DWORD *)(a1 + 12);
LABEL_5:
    sub_23918C1A0(v4, v6, v7, "asn1PD_SetSessionID");
    return v5;
  }
  v4 = sub_2391B68F8(a1, (uint64_t)(a2 + 4));
  v5 = v4;
  if ((_DWORD)v4)
  {
    v6 = *(_DWORD *)(a1 + 8);
    v7 = *(_DWORD *)(a1 + 12);
    goto LABEL_5;
  }
  return v5;
}

uint64_t sub_2391B6D50(uint64_t a1)
{
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_BYTE *)(a1 + 16) = -1;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 168) = 0u;
  *(_OWORD *)(a1 + 184) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_QWORD *)(a1 + 136) = 0;
  *(_QWORD *)(a1 + 144) = 0;
  *(_WORD *)(a1 + 8) = 0;
  sub_2391015AC((_QWORD *)(a1 + 200), 4uLL);
  *(_QWORD *)(a1 + 224) = 0;
  *(_QWORD *)(a1 + 232) = 0;
  *(_BYTE *)(a1 + 224) = -1;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_QWORD *)(a1 + 304) = 0;
  *(_QWORD *)a1 = 0;
  return a1;
}

void sub_2391B6DEC(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_2391A61F4(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_2391B6E00(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;

  sub_23918C32C((uint64_t **)a1, *(_DWORD *)a2);
  v4 = *(unsigned __int8 *)(a1 + 16);
  if (*(_BYTE *)(a1 + 16))
  {
    v5 = *(_DWORD *)(a1 + 8);
    v6 = *(_DWORD *)(a1 + 12);
    LODWORD(v7) = *(unsigned __int8 *)(a1 + 16);
LABEL_5:
    sub_23918C1A0(v7, v5, v6, "asn1PE_SessionID");
    return v4;
  }
  sub_23918C32C((uint64_t **)a1, *(_DWORD *)(a2 + 4));
  v4 = *(unsigned __int8 *)(a1 + 16);
  if (*(_BYTE *)(a1 + 16))
  {
    v5 = *(_DWORD *)(a1 + 8);
    v6 = *(_DWORD *)(a1 + 12);
    LODWORD(v7) = *(unsigned __int8 *)(a1 + 16);
    goto LABEL_5;
  }
  if (*(_DWORD *)a2)
  {
    v7 = sub_2391B6C48(a1, (unsigned __int8 *)(a2 + 8));
    if ((_DWORD)v7)
    {
      v4 = v7;
      v5 = *(_DWORD *)(a1 + 8);
      v6 = *(_DWORD *)(a1 + 12);
      goto LABEL_5;
    }
  }
  if (!*(_DWORD *)(a2 + 4))
    return 0;
  return sub_2391B6B58(a1, a2 + 200);
}

uint64_t sub_2391B6ED8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  int v8;

  *(_DWORD *)a2 = sub_23918C3B4((uint64_t **)a1);
  v4 = *(unsigned __int8 *)(a1 + 16);
  if (*(_BYTE *)(a1 + 16))
  {
    v5 = *(_DWORD *)(a1 + 8);
    v6 = *(_DWORD *)(a1 + 12);
    LODWORD(v7) = *(unsigned __int8 *)(a1 + 16);
LABEL_5:
    sub_23918C1A0(v7, v5, v6, "asn1PD_SessionID");
    return v4;
  }
  v8 = sub_23918C3B4((uint64_t **)a1);
  *(_DWORD *)(a2 + 4) = v8;
  v4 = *(unsigned __int8 *)(a1 + 16);
  if (*(_BYTE *)(a1 + 16))
  {
    v5 = *(_DWORD *)(a1 + 8);
    v6 = *(_DWORD *)(a1 + 12);
    LODWORD(v7) = *(unsigned __int8 *)(a1 + 16);
    goto LABEL_5;
  }
  if (*(_DWORD *)a2)
  {
    v7 = sub_2391B6CCC(a1, (_WORD *)(a2 + 8));
    if ((_DWORD)v7)
    {
      v4 = v7;
      v5 = *(_DWORD *)(a1 + 8);
      v6 = *(_DWORD *)(a1 + 12);
      goto LABEL_5;
    }
    v8 = *(_DWORD *)(a2 + 4);
  }
  if (!v8)
    return 0;
  return sub_2391B6BD0(a1, (unint64_t *)(a2 + 200));
}

uint64_t sub_2391B6FB0(uint64_t a1, int *a2)
{
  uint64_t v4;
  int v5;
  int v6;
  unsigned int v7;

  sub_23918C32C((uint64_t **)a1, 0);
  v4 = *(unsigned __int8 *)(a1 + 16);
  if (*(_BYTE *)(a1 + 16))
  {
    v5 = *(_DWORD *)(a1 + 8);
    v6 = *(_DWORD *)(a1 + 12);
    v7 = *(unsigned __int8 *)(a1 + 16);
  }
  else
  {
    sub_23918C32C((uint64_t **)a1, *a2);
    v4 = *(unsigned __int8 *)(a1 + 16);
    if (*(_BYTE *)(a1 + 16))
    {
      v5 = *(_DWORD *)(a1 + 8);
      v6 = *(_DWORD *)(a1 + 12);
      v7 = *(unsigned __int8 *)(a1 + 16);
    }
    else
    {
      sub_23918C32C((uint64_t **)a1, a2[1]);
      v4 = *(unsigned __int8 *)(a1 + 16);
      if (*(_BYTE *)(a1 + 16))
      {
        v5 = *(_DWORD *)(a1 + 8);
        v6 = *(_DWORD *)(a1 + 12);
        v7 = *(unsigned __int8 *)(a1 + 16);
      }
      else
      {
        sub_23918C32C((uint64_t **)a1, a2[2]);
        v4 = *(unsigned __int8 *)(a1 + 16);
        if (*(_BYTE *)(a1 + 16))
        {
          v5 = *(_DWORD *)(a1 + 8);
          v6 = *(_DWORD *)(a1 + 12);
          v7 = *(unsigned __int8 *)(a1 + 16);
        }
        else
        {
          sub_23918C32C((uint64_t **)a1, a2[3]);
          v4 = *(unsigned __int8 *)(a1 + 16);
          if (*(_BYTE *)(a1 + 16))
          {
            v5 = *(_DWORD *)(a1 + 8);
            v6 = *(_DWORD *)(a1 + 12);
            v7 = *(unsigned __int8 *)(a1 + 16);
          }
          else
          {
            sub_23918C32C((uint64_t **)a1, a2[4]);
            v4 = *(unsigned __int8 *)(a1 + 16);
            if (*(_BYTE *)(a1 + 16))
            {
              v5 = *(_DWORD *)(a1 + 8);
              v6 = *(_DWORD *)(a1 + 12);
              v7 = *(unsigned __int8 *)(a1 + 16);
            }
            else
            {
              sub_23918C32C((uint64_t **)a1, a2[5]);
              v4 = *(unsigned __int8 *)(a1 + 16);
              if (!*(_BYTE *)(a1 + 16))
              {
                sub_23918C32C((uint64_t **)a1, a2[6]);
                return *(unsigned __int8 *)(a1 + 16);
              }
              v5 = *(_DWORD *)(a1 + 8);
              v6 = *(_DWORD *)(a1 + 12);
              v7 = *(unsigned __int8 *)(a1 + 16);
            }
          }
        }
      }
    }
  }
  sub_23918C1A0(v7, v5, v6, "asn1PE_PosTechnology");
  return v4;
}

uint64_t sub_2391B7120(uint64_t a1, unsigned __int8 *a2)
{
  unsigned int v3;
  uint64_t v4;

  v3 = *a2;
  if (v3 >= 3)
  {
    v4 = 4;
    *(_BYTE *)(a1 + 16) = 4;
    sub_23918C1A0(4u, *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12), "asn1PE_PrefMethod");
  }
  else
  {
    v4 = sub_23918C42C(a1, 0, 2, v3);
    if (!(_DWORD)v4)
      return v4;
  }
  sub_23918C1A0(v4, *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12), "asn1PE_PrefMethod");
  return v4;
}

uint64_t sub_2391B71A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;

  sub_23918C32C((uint64_t **)a1, vmaxv_u16((uint16x4_t)vmovn_s32(vtstq_s32(*(int32x4_t *)(a2 + 12), *(int32x4_t *)(a2 + 12)))) & 1);
  v4 = *(unsigned __int8 *)(a1 + 16);
  if (*(_BYTE *)(a1 + 16))
  {
    v5 = *(_DWORD *)(a1 + 8);
    v6 = *(_DWORD *)(a1 + 12);
    LODWORD(v7) = *(unsigned __int8 *)(a1 + 16);
LABEL_9:
    sub_23918C1A0(v7, v5, v6, "asn1PE_PosProtocol");
    return v4;
  }
  sub_23918C32C((uint64_t **)a1, *(_DWORD *)a2);
  v4 = *(unsigned __int8 *)(a1 + 16);
  if (*(_BYTE *)(a1 + 16))
  {
    v5 = *(_DWORD *)(a1 + 8);
    v6 = *(_DWORD *)(a1 + 12);
    LODWORD(v7) = *(unsigned __int8 *)(a1 + 16);
    goto LABEL_9;
  }
  sub_23918C32C((uint64_t **)a1, *(_DWORD *)(a2 + 4));
  v4 = *(unsigned __int8 *)(a1 + 16);
  if (*(_BYTE *)(a1 + 16))
  {
    v5 = *(_DWORD *)(a1 + 8);
    v6 = *(_DWORD *)(a1 + 12);
    LODWORD(v7) = *(unsigned __int8 *)(a1 + 16);
    goto LABEL_9;
  }
  sub_23918C32C((uint64_t **)a1, *(_DWORD *)(a2 + 8));
  v4 = *(unsigned __int8 *)(a1 + 16);
  if (*(_BYTE *)(a1 + 16))
  {
    v5 = *(_DWORD *)(a1 + 8);
    v6 = *(_DWORD *)(a1 + 12);
    LODWORD(v7) = *(unsigned __int8 *)(a1 + 16);
    goto LABEL_9;
  }
  if ((vmaxv_u16((uint16x4_t)vmovn_s32(vtstq_s32(*(int32x4_t *)(a2 + 12), *(int32x4_t *)(a2 + 12)))) & 1) == 0)
    return 0;
  v7 = sub_23918A388(a1, a2);
  v4 = v7;
  if ((_DWORD)v7)
  {
    v5 = *(_DWORD *)(a1 + 8);
    v6 = *(_DWORD *)(a1 + 12);
    goto LABEL_9;
  }
  return v4;
}

uint64_t sub_2391B72D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;

  sub_23918C32C((uint64_t **)a1, 0);
  v4 = *(unsigned __int8 *)(a1 + 16);
  if (*(_BYTE *)(a1 + 16))
  {
    v5 = *(_DWORD *)(a1 + 8);
    v6 = *(_DWORD *)(a1 + 12);
    LODWORD(v7) = *(unsigned __int8 *)(a1 + 16);
LABEL_7:
    sub_23918C1A0(v7, v5, v6, "asn1PE_SETCapabilities");
    return v4;
  }
  v7 = sub_2391B6FB0(a1, (int *)a2);
  if ((_DWORD)v7)
  {
    v4 = v7;
    v5 = *(_DWORD *)(a1 + 8);
    v6 = *(_DWORD *)(a1 + 12);
    goto LABEL_7;
  }
  v7 = sub_2391B7120(a1, (unsigned __int8 *)(a2 + 28));
  if ((_DWORD)v7)
  {
    v4 = v7;
    v5 = *(_DWORD *)(a1 + 8);
    v6 = *(_DWORD *)(a1 + 12);
    goto LABEL_7;
  }
  return sub_2391B71A0(a1, a2 + 32);
}

uint64_t sub_2391B7394(uint64_t a1)
{
  uint64_t v2;
  int v3;
  BOOL v4;
  uint64_t v5;
  unsigned __int8 v6;

  *(_QWORD *)a1 = off_250A73E70;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = -1;
  *(_OWORD *)(a1 + 36) = 0u;
  *(_OWORD *)(a1 + 52) = 0u;
  *(_OWORD *)(a1 + 68) = 0u;
  *(_OWORD *)(a1 + 84) = 0u;
  *(_OWORD *)(a1 + 100) = 0u;
  *(_OWORD *)(a1 + 116) = 0u;
  *(_OWORD *)(a1 + 132) = 0u;
  *(_OWORD *)(a1 + 148) = 0u;
  *(_OWORD *)(a1 + 164) = 0u;
  *(_OWORD *)(a1 + 180) = 0u;
  *(_OWORD *)(a1 + 196) = 0u;
  *(_OWORD *)(a1 + 212) = 0u;
  *(_OWORD *)(a1 + 228) = 0u;
  *(_OWORD *)(a1 + 244) = 0u;
  *(_DWORD *)(a1 + 356) = 0;
  *(_OWORD *)(a1 + 20) = 0u;
  *(_OWORD *)(a1 + 260) = 0u;
  *(_OWORD *)(a1 + 276) = 0u;
  *(_OWORD *)(a1 + 292) = 0u;
  *(_OWORD *)(a1 + 308) = 0u;
  *(_OWORD *)(a1 + 324) = 0u;
  *(_OWORD *)(a1 + 340) = 0u;
  v2 = sub_23918BED4();
  v3 = atomic_load((unsigned __int8 *)(v2 + 1));
  v4 = v3 == 255;
  v5 = 1;
  if (v4)
    v5 = 2;
  v6 = atomic_load((unsigned __int8 *)(v2 + v5));
  *(_WORD *)(a1 + 32) = -1;
  *(_BYTE *)(a1 + 26) = v6;
  *(_WORD *)(a1 + 27) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  sub_2391B6D50(a1 + 48);
  return a1;
}

void sub_2391B745C(_Unwind_Exception *a1)
{
  unsigned __int16 *v1;

  sub_2391AA1C8(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_2391B7470(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  *(_QWORD *)a1 = off_250A73E70;
  *(_QWORD *)(a1 + 8) = 0;
  v2 = *(void **)(a1 + 336);
  if (v2)
  {
    *(_QWORD *)(a1 + 344) = v2;
    operator delete(v2);
  }
  v3 = *(void **)(a1 + 312);
  if (v3)
  {
    *(_QWORD *)(a1 + 320) = v3;
    operator delete(v3);
  }
  v4 = *(void **)(a1 + 288);
  if (v4)
  {
    *(_QWORD *)(a1 + 296) = v4;
    operator delete(v4);
  }
  v5 = *(void **)(a1 + 248);
  if (v5)
  {
    *(_QWORD *)(a1 + 256) = v5;
    operator delete(v5);
  }
  sub_2391A61F4(a1 + 72);
  sub_2391AA1C8((unsigned __int16 *)(a1 + 32));
  return a1;
}

void sub_2391B74F4(uint64_t a1, int a2, uint64_t a3)
{
  NSObject *v3;
  int v7;
  NSObject *v8;
  const char *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD *v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  void *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  int v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = qword_2542CF618;
  if (a3)
  {
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(unsigned __int8 *)(a1 + 16);
      v24 = 67109376;
      v25 = v7;
      v26 = 1024;
      v27 = a2;
      _os_log_impl(&dword_2390FD000, v3, OS_LOG_TYPE_DEFAULT, "#gpsd,#supl Current State,%u -> New State,%u", (uint8_t *)&v24, 0xEu);
    }
    if (*(unsigned __int8 *)(a1 + 16) == a2)
    {
      v8 = qword_2542CF618;
      if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v24) = 0;
        v9 = "#gpsd,#supl Leaving SuplState::UpdateState, current state and new state same";
LABEL_7:
        _os_log_debug_impl(&dword_2390FD000, v8, OS_LOG_TYPE_DEBUG, v9, (uint8_t *)&v24, 2u);
      }
    }
    else
    {
      switch(a2)
      {
        case 0:
          v10 = operator new(0x168uLL, MEMORY[0x24BEDB6B8]);
          if (v10)
          {
            v11 = v10;
            sub_2391B7394((uint64_t)v10);
            *v11 = &off_250A73BD8;
            sub_2391B597C(a3, (uint64_t)v11);
            v11[1] = a3;
            (*(void (**)(_QWORD *))(*v11 + 24))(v11);
          }
          else
          {
            v8 = qword_2542CF618;
            if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
            {
              v24 = 67109120;
              v25 = 1537;
              _os_log_error_impl(&dword_2390FD000, v8, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", (uint8_t *)&v24, 8u);
              v8 = qword_2542CF618;
            }
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(v24) = 0;
              v9 = "#gpsd,#supl Leaving SuplState::UpdateState, mem alloc failure";
              goto LABEL_7;
            }
          }
          break;
        case 2:
          v14 = operator new(0x178uLL, MEMORY[0x24BEDB6B8]);
          if (v14)
          {
            v15 = v14;
            sub_2391B406C((uint64_t)v14);
            sub_2391B3D64(a3 + 392);
            sub_2391B597C(a3, (uint64_t)v15);
            v15[1] = a3;
            (*(void (**)(_QWORD *))(*v15 + 24))(v15);
          }
          else
          {
            v8 = qword_2542CF618;
            if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
            {
              v24 = 67109120;
              v25 = 1537;
              _os_log_error_impl(&dword_2390FD000, v8, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", (uint8_t *)&v24, 8u);
              v8 = qword_2542CF618;
            }
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(v24) = 0;
              v9 = "#gpsd,#supl Leaving SuplState::UpdateState, mem alloc failure";
              goto LABEL_7;
            }
          }
          break;
        case 4:
          v16 = operator new(0x170uLL, MEMORY[0x24BEDB6B8]);
          if (v16)
          {
            v17 = (uint64_t)v16;
            sub_2391B7394((uint64_t)v16);
            *(_QWORD *)v17 = &off_250A73C18;
            *(_BYTE *)(v17 + 16) = 4;
            *(_DWORD *)(v17 + 360) = 0;
            sub_2391B53AC(a3, 4);
            sub_2391B597C(a3, v17);
            *(_QWORD *)(v17 + 8) = a3;
            (*(void (**)(uint64_t))(*(_QWORD *)v17 + 24))(v17);
          }
          else
          {
            v8 = qword_2542CF618;
            if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
            {
              v24 = 67109120;
              v25 = 1537;
              _os_log_error_impl(&dword_2390FD000, v8, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", (uint8_t *)&v24, 8u);
              v8 = qword_2542CF618;
            }
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(v24) = 0;
              v9 = "#gpsd,#supl Leaving SuplState::UpdateState, mem alloc failure";
              goto LABEL_7;
            }
          }
          break;
        case 5:
          v18 = operator new(0x170uLL, MEMORY[0x24BEDB6B8]);
          if (v18)
          {
            v19 = v18;
            sub_2391B128C((uint64_t)v18);
            sub_2391B3D64(a3 + 392);
            sub_2391B597C(a3, (uint64_t)v19);
            v19[1] = a3;
            (*(void (**)(_QWORD *))(*v19 + 24))(v19);
          }
          else
          {
            v8 = qword_2542CF618;
            if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
            {
              v24 = 67109120;
              v25 = 1537;
              _os_log_error_impl(&dword_2390FD000, v8, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", (uint8_t *)&v24, 8u);
              v8 = qword_2542CF618;
            }
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(v24) = 0;
              v9 = "#gpsd,#supl Leaving SuplState::UpdateState, memalloc failure";
              goto LABEL_7;
            }
          }
          break;
        case 6:
          v20 = operator new(0x170uLL, MEMORY[0x24BEDB6B8]);
          if (v20)
          {
            v21 = (uint64_t)v20;
            sub_2391B7394((uint64_t)v20);
            *(_QWORD *)v21 = &off_250A73C18;
            *(_BYTE *)(v21 + 16) = 4;
            *(_DWORD *)(v21 + 360) = 0;
            sub_2391B53AC(a3, 6);
            sub_2391B597C(a3, v21);
            *(_QWORD *)(v21 + 8) = a3;
            (*(void (**)(uint64_t))(*(_QWORD *)v21 + 24))(v21);
          }
          else
          {
            v8 = qword_2542CF618;
            if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
            {
              v24 = 67109120;
              v25 = 1537;
              _os_log_error_impl(&dword_2390FD000, v8, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", (uint8_t *)&v24, 8u);
              v8 = qword_2542CF618;
            }
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(v24) = 0;
              v9 = "#gpsd,#supl Leaving SuplState::UpdateState, memalloc failure";
              goto LABEL_7;
            }
          }
          break;
        case 7:
          v22 = operator new(0x190uLL, MEMORY[0x24BEDB6B8]);
          if (v22)
          {
            v23 = v22;
            sub_2391995FC((uint64_t)v22);
            sub_2391B3D64(a3 + 392);
            sub_2391B597C(a3, (uint64_t)v23);
            v23[1] = a3;
            (*(void (**)(_QWORD *))(*v23 + 24))(v23);
          }
          else
          {
            v8 = qword_2542CF618;
            if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
            {
              v24 = 67109120;
              v25 = 1537;
              _os_log_error_impl(&dword_2390FD000, v8, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", (uint8_t *)&v24, 8u);
              v8 = qword_2542CF618;
            }
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(v24) = 0;
              v9 = "#gpsd,#supl Leaving SuplState::UpdateState, mem alloc failure";
              goto LABEL_7;
            }
          }
          break;
        default:
          v12 = qword_2542CF618;
          if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
          {
            v24 = 67109120;
            v25 = 515;
            v13 = v12;
            goto LABEL_26;
          }
          break;
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
  {
    v24 = 67109120;
    v25 = 515;
    v13 = v3;
LABEL_26:
    _os_log_error_impl(&dword_2390FD000, v13, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", (uint8_t *)&v24, 8u);
  }
}

void sub_2391B7B90(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x23B838838](v1, MEMORY[0x24BEDB6B8]);
  _Unwind_Resume(a1);
}

uint64_t sub_2391B7BC8(uint64_t a1, uint64_t a2)
{
  int v3;
  _QWORD v5[2];
  _QWORD v6[2];
  char v7;
  void *__p;
  void *v9;
  uint64_t v10;

  __p = 0;
  v9 = 0;
  v10 = 0;
  sub_239189290(&__p, *(const void **)a2, *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 8) - *(_QWORD *)a2);
  v6[0] = &__p;
  v6[1] = 0;
  v7 = 0;
  v5[0] = v6;
  v5[1] = a1 + 24;
  v3 = sub_2391AA818((uint64_t)v5);
  if (__p)
  {
    v9 = __p;
    operator delete(__p);
  }
  if (v3)
    return 0xFFFFFFFFLL;
  else
    return 0;
}

void sub_2391B7C44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL sub_2391B7C60(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 8))
  {
    v4 = sub_2391B1EF8();
    return sub_2391B3190(v4, *(unsigned int *)(*(_QWORD *)(a1 + 8) + 376), *a2);
  }
  else
  {
    v6 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      v7[0] = 67109120;
      v7[1] = 513;
      _os_log_error_impl(&dword_2390FD000, v6, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", (uint8_t *)v7, 8u);
    }
    return 0;
  }
}

uint64_t sub_2391B7D4C()
{
  uint64_t result;
  NSObject *v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  if (qword_2542CF5A8 != -1)
    dispatch_once(&qword_2542CF5A8, &unk_250A73ED0);
  result = qword_2542CF5A0;
  if (!qword_2542CF5A0)
  {
    v1 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      v2 = 136315138;
      v3 = "GetInstance";
      _os_log_error_impl(&dword_2390FD000, v1, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v2, 0xCu);
    }
    __assert_rtn("GetInstance", "SuplUtils.cpp", 66, "false && \"Memory allocation failure\"");
  }
  return result;
}

void sub_2391B7E40()
{
  char *v0;

  v0 = (char *)operator new(0x130uLL, MEMORY[0x24BEDB6B8]);
  if (v0)
  {
    *((_OWORD *)v0 + 17) = 0u;
    *((_OWORD *)v0 + 18) = 0u;
    *((_OWORD *)v0 + 15) = 0u;
    *((_OWORD *)v0 + 16) = 0u;
    *((_OWORD *)v0 + 13) = 0u;
    *((_OWORD *)v0 + 14) = 0u;
    *((_OWORD *)v0 + 11) = 0u;
    *((_OWORD *)v0 + 12) = 0u;
    *((_OWORD *)v0 + 9) = 0u;
    *((_OWORD *)v0 + 10) = 0u;
    *((_OWORD *)v0 + 7) = 0u;
    *((_OWORD *)v0 + 8) = 0u;
    *((_OWORD *)v0 + 5) = 0u;
    *((_OWORD *)v0 + 6) = 0u;
    *((_OWORD *)v0 + 4) = 0u;
    *((_OWORD *)v0 + 1) = 0u;
    *((_OWORD *)v0 + 2) = 0u;
    *(_OWORD *)v0 = 0u;
    *((_OWORD *)v0 + 3) = 0u;
    *((_DWORD *)v0 + 9) = 1;
    *((_WORD *)v0 + 24) = -254;
    *((_WORD *)v0 + 34) = 0;
    *((_WORD *)v0 + 42) = 0;
    *((_WORD *)v0 + 50) = 0;
    v0[113] = 0;
    *((_WORD *)v0 + 64) = 0;
    *((_WORD *)v0 + 72) = 0;
    *((_WORD *)v0 + 80) = 0;
    *((_WORD *)v0 + 86) = 0;
    *((_WORD *)v0 + 94) = 0;
    *((_DWORD *)v0 + 48) = 0;
    *(_DWORD *)(v0 + 195) = 0;
    *((_WORD *)v0 + 106) = 0;
    *((_WORD *)v0 + 114) = 0;
    *((_DWORD *)v0 + 69) = 0;
    *((_QWORD *)v0 + 31) = 0;
    *((_QWORD *)v0 + 32) = 0;
    *((_QWORD *)v0 + 30) = 0;
    *(_QWORD *)(v0 + 263) = 0;
    *((_QWORD *)v0 + 36) = 0x100000001;
    *((_DWORD *)v0 + 74) = 1;
  }
  qword_2542CF5A0 = (uint64_t)v0;
  sub_2391BD78C();
}

uint64_t sub_2391B7F00(uint64_t a1, int a2, uint64_t a3)
{
  char *v5;
  char *v6;
  NSObject *v7;
  char *v9;
  _BYTE *v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  __int16 v15;
  void *__p;
  _BYTE *v17;
  uint64_t v18;
  uint8_t buf[4];
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v15 = -1;
  v17 = 0;
  v18 = 0;
  __p = 0;
  if (*(_WORD *)a3 != 1)
  {
    v7 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2390FD000, v7, OS_LOG_TYPE_ERROR, "#gpsd,#supl SuplUtils::SetSETInfo, invalid SET ID type", buf, 2u);
      v7 = qword_2542CF618;
    }
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      return -4;
    *(_DWORD *)buf = 67109120;
    v20 = 514;
    goto LABEL_27;
  }
  v5 = *(char **)(a3 + 16);
  v6 = *(char **)(a3 + 8);
  if ((unint64_t)(v5 - v6) >= 9)
  {
    v7 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2390FD000, v7, OS_LOG_TYPE_ERROR, "#gpsd,#supl SuplUtils::SetSETInfo, SET ID IMSI length > max limit", buf, 2u);
      v7 = qword_2542CF618;
    }
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      return -4;
    *(_DWORD *)buf = 67109120;
    v20 = 514;
LABEL_27:
    _os_log_error_impl(&dword_2390FD000, v7, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", buf, 8u);
    return -4;
  }
  if (&v15 == (__int16 *)a3)
  {
    v9 = 0;
    v10 = 0;
  }
  else
  {
    sub_239107FF0(&__p, v6, v5, v5 - v6);
    v9 = (char *)__p;
    v10 = v17;
  }
  buf[0] = -1;
  v11 = v10 - v9;
  if ((unint64_t)(v10 - v9) > 7)
  {
    if (v11 != 8)
    {
      v17 = v9 + 8;
LABEL_20:
      v12 = 0;
      do
      {
        v9[v12] = (v9[v12] >> 4) | (16 * v9[v12]);
        ++v12;
        v9 = (char *)__p;
      }
      while (v12 < v17 - (_BYTE *)__p);
      goto LABEL_22;
    }
  }
  else
  {
    sub_2391BA62C(&__p, 8 - v11, buf);
    v9 = (char *)__p;
    v10 = v17;
  }
  if (v10 != v9)
    goto LABEL_20;
LABEL_22:
  v15 = *(_WORD *)a3;
  v13 = (char *)sub_2391BC46C();
  sub_2391BCAEC(v13, a2, (uint64_t)&v15);
  if (__p)
  {
    v17 = __p;
    operator delete(__p);
  }
  return 0;
}

void sub_2391B8178(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_2391B8198(uint64_t a1, uint64_t a2, int a3)
{
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  NSObject *v8;
  __int16 v9;
  void *__p;
  char *v11;
  uint64_t v12;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v9 = -1;
  v11 = 0;
  v12 = 0;
  __p = 0;
  v5 = (_QWORD *)sub_2391BC46C();
  sub_2391BCB74(v5, a3, (uint64_t)&v9);
  if (v9 == 1)
  {
    *(_BYTE *)a2 = 4;
    if ((void **)(a2 + 80) != &__p)
      sub_239107FF0((_QWORD *)(a2 + 80), (char *)__p, v11, v11 - (_BYTE *)__p);
    buf[0] = -1;
    v6 = *(_QWORD *)(a2 + 80);
    v7 = *(_QWORD *)(a2 + 88) - v6;
    if (v7 > 7)
    {
      if (v7 != 8)
        *(_QWORD *)(a2 + 88) = v6 + 8;
    }
    else
    {
      sub_2391BA62C((_QWORD *)(a2 + 80), 8 - v7, buf);
    }
  }
  else
  {
    v8 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v14 = 514;
      _os_log_error_impl(&dword_2390FD000, v8, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", buf, 8u);
    }
  }
  if (__p)
  {
    v11 = (char *)__p;
    operator delete(__p);
  }
}

void sub_2391B82E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_2391B8308(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result;
  uint64_t v6;

  result = sub_2391BC46C();
  v6 = *(_QWORD *)(result + 16);
  if (v6)
  {
    while (*(_DWORD *)v6 != a3)
    {
      v6 = *(_QWORD *)(v6 + 8);
      if (!v6)
        return result;
    }
    return sub_2391A8EE0(a2, v6 + 56);
  }
  return result;
}

uint64_t sub_2391B835C(uint64_t a1, uint64_t a2, const void **a3, unsigned int a4)
{
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  int v40;
  char v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v8 = operator new(0x218uLL, MEMORY[0x24BEDB6B8]);
  if (v8)
  {
    v9 = (uint64_t)v8;
    sub_2391A5738((uint64_t)v8);
    if (sub_2391A5C54(v9, a2, a3))
    {
      v10 = qword_2542CF618;
      if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
      {
        v35 = 67109120;
        v36 = 770;
        _os_log_error_impl(&dword_2390FD000, v10, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", (uint8_t *)&v35, 8u);
      }
      v11 = sub_2391BDC54();
      v12 = sub_2391B8778(*(unsigned __int8 *)(*(_QWORD *)(v9 + 48) + 20));
      v37 = 0;
      v38 = 0x200000000;
      v35 = a4;
      v41 = -1;
      v39 = v12;
      v40 = 0;
      sub_2391BE930(v11, &v35);
      v13 = sub_2391A59B8(v9);
      MEMORY[0x23B838844](v13, 0x1030C40AE74B18ELL);
      return -1;
    }
    else
    {
      v16 = *(uint64_t **)(v9 + 8);
      if (v16)
      {
        v17 = *v16;
        if (v17)
        {
          if (*(_DWORD *)(*(_QWORD *)(v17 + 16) + 108))
          {
            v18 = sub_2391B1EF8();
            sub_2391B35A8(v18);
          }
        }
      }
      *(_DWORD *)v9 = a4;
      *(_DWORD *)(v9 + 4) = a2;
      *(_DWORD *)(v9 + 16) = 1;
      v19 = operator new(0x18uLL, MEMORY[0x24BEDB6B8]);
      if (v19)
      {
        v19[1] = 0;
        v19[2] = v9;
        *(_DWORD *)v19 = a4;
        v20 = *(_QWORD *)(a1 + 16);
        while (v20)
        {
          v21 = v20;
          v20 = *(_QWORD *)(v20 + 8);
          if (!v20)
          {
            *(_QWORD *)(v21 + 8) = v19;
            v19[1] = 0;
            goto LABEL_24;
          }
        }
        v19[1] = *(_QWORD *)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v19;
LABEL_24:
        v26 = sub_2391BBB24();
        v27 = sub_2391BBC40(v26, *(_DWORD *)v9);
        v28 = sub_2391B7D4C();
        if (*(_WORD *)(v28 + 44))
          v29 = *(unsigned __int16 *)(v28 + 44);
        else
          v29 = 260;
        sub_2391B3878((_DWORD *)(v9 + 504), v27, 0, v29, 1);
        sub_2391B39D4(v9 + 504);
        v30 = sub_2391BDC54();
        v31 = sub_2391B8778(*(unsigned __int8 *)(*(_QWORD *)(v9 + 48) + 20));
        v37 = 0;
        v38 = 0x100000000;
        v35 = a4;
        v41 = -1;
        v39 = v31;
        v40 = 0;
        sub_2391BE930(v30, &v35);
        v32 = *(_QWORD *)(sub_2391BC46C() + 16);
        if (!v32)
          goto LABEL_33;
        while (*(_DWORD *)v32 != (_DWORD)a2)
        {
          v32 = *(_QWORD *)(v32 + 8);
          if (!v32)
            goto LABEL_33;
        }
        if (sub_2391BC9C4(v32))
        {
          sub_2391B88BC(a1);
        }
        else
        {
LABEL_33:
          v33 = sub_2391BDC54();
          sub_2391BDB6C(v33);
        }
        return 0;
      }
      else
      {
        v22 = qword_2542CF618;
        if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
        {
          v35 = 67109120;
          v36 = 1537;
          _os_log_error_impl(&dword_2390FD000, v22, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", (uint8_t *)&v35, 8u);
          v22 = qword_2542CF618;
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v35 = 67109120;
          v36 = 1537;
          _os_log_error_impl(&dword_2390FD000, v22, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", (uint8_t *)&v35, 8u);
        }
        v23 = sub_2391BDC54();
        v24 = sub_2391B8778(*(unsigned __int8 *)(*(_QWORD *)(v9 + 48) + 20));
        v37 = 0;
        v38 = 0x200000000;
        v35 = a4;
        v41 = -1;
        v39 = v24;
        v40 = 0;
        sub_2391BE930(v23, &v35);
        v25 = sub_2391A59B8(v9);
        MEMORY[0x23B838844](v25, 0x1030C40AE74B18ELL);
        return -2;
      }
    }
  }
  else
  {
    v15 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      v35 = 67109120;
      v36 = 513;
      _os_log_error_impl(&dword_2390FD000, v15, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", (uint8_t *)&v35, 8u);
    }
    return -3;
  }
}

void sub_2391B8754(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x23B838838](v1, MEMORY[0x24BEDB6B8]);
  _Unwind_Resume(a1);
}

uint64_t sub_2391B8778(unsigned int a1)
{
  uint64_t v1;
  NSObject *v2;
  NSObject *v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (a1 >= 0x11)
  {
    v2 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v5[0]) = 0;
      _os_log_error_impl(&dword_2390FD000, v2, OS_LOG_TYPE_ERROR, "Position Method", (uint8_t *)v5, 2u);
    }
    v1 = 0;
  }
  else
  {
    v1 = dword_2391CC014[(char)a1];
  }
  v3 = qword_2542CF618;
  if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = v1;
    _os_log_impl(&dword_2390FD000, v3, OS_LOG_TYPE_INFO, "Position Method,%u", (uint8_t *)v5, 8u);
    v3 = qword_2542CF618;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v5[0]) = 0;
    _os_log_debug_impl(&dword_2390FD000, v3, OS_LOG_TYPE_DEBUG, "#gpsd,#supl Leaving SuplUtils::ConvertPosMethod", (uint8_t *)v5, 2u);
  }
  return v1;
}

void sub_2391B88BC(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  NSObject *v9;
  __int16 v10;
  __int128 v11;
  __int128 v12;
  void *__p[5];
  uint64_t v14;
  int v15;

  for (i = *(_QWORD *)(a1 + 16); i; i = *(_QWORD *)(i + 8))
  {
    v3 = *(_QWORD *)(i + 16);
    if (v3)
    {
      if (*(_DWORD *)(v3 + 16) == 1)
      {
        *(_DWORD *)(v3 + 16) = 0;
        v4 = sub_2391B1EF8();
        if (v4)
        {
          v5 = v4;
          BYTE4(v14) = -1;
          v15 = 0;
          LOBYTE(v14) = 3;
          v6 = *(_QWORD *)(i + 16);
          v7 = *(uint64_t **)(v6 + 8);
          if (v7)
          {
            v8 = *v7;
            if (v8)
            {
              if (*(_DWORD *)(*(_QWORD *)(v8 + 16) + 108))
                LOBYTE(v14) = 2;
            }
          }
          v9 = qword_2542CF618;
          if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEBUG))
          {
            v10 = 0;
            _os_log_debug_impl(&dword_2390FD000, v9, OS_LOG_TYPE_DEBUG, "#gpsd,#supl SuplUtils::ProcessWaitingSuplInits, calling InitSessionNode", (uint8_t *)&v10, 2u);
            v6 = *(_QWORD *)(i + 16);
          }
          sub_2391B2148(v5, *(_DWORD *)(v6 + 4), *(_DWORD *)v6, &v14, 0);
          v12 = 0u;
          memset(__p, 0, 25);
          v11 = 0u;
          v10 = 1;
          LODWORD(v11) = 56;
          (*(void (**)(uint64_t, _QWORD, __int16 *))(*(_QWORD *)v5 + 8))(v5, **(unsigned int **)(i + 16), &v10);
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
          if (*((_QWORD *)&v11 + 1))
          {
            *(_QWORD *)&v12 = *((_QWORD *)&v11 + 1);
            operator delete(*((void **)&v11 + 1));
          }
        }
      }
    }
    if (!*(_QWORD *)(a1 + 16))
      break;
  }
}

void sub_2391B8A3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_2391AF4D0(&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_2391B8A50(uint64_t a1, int a2)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    while (*(_DWORD *)v2 != a2)
    {
      v2 = *(_QWORD *)(v2 + 8);
      if (!v2)
        goto LABEL_4;
    }
    return *(_QWORD *)(v2 + 16);
  }
  else
  {
LABEL_4:
    v3 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_debug_impl(&dword_2390FD000, v3, OS_LOG_TYPE_DEBUG, "#gpsd,#supl Leaving SuplUtils::GetSuplInitRecd, nullptr", v5, 2u);
    }
    return 0;
  }
}

void sub_2391B8ADC(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8[16];

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 16);
    do
    {
      if (*(_DWORD *)v4 == a2)
      {
        while (*(_DWORD *)v3 != a2)
        {
          v3 = *(_QWORD *)(v3 + 8);
          if (!v3)
            goto LABEL_11;
        }
        sub_2391BCCE4(a1, v3);
LABEL_11:
        v6 = *(_QWORD *)(v4 + 16);
        if (v6)
        {
          v7 = sub_2391A59B8(v6);
          MEMORY[0x23B838844](v7, 0x1030C40AE74B18ELL);
        }
        *(_QWORD *)(v4 + 8) = 0;
        *(_QWORD *)(v4 + 16) = 0;
        JUMPOUT(0x23B838844);
      }
      v4 = *(_QWORD *)(v4 + 8);
    }
    while (v4);
  }
  v5 = qword_2542CF618;
  if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_debug_impl(&dword_2390FD000, v5, OS_LOG_TYPE_DEBUG, "#gpsd,#supl Leaving SuplUtils::DeleteSuplInitRecd, nullptr", v8, 2u);
  }
}

uint64_t sub_2391B8BC4(uint64_t a1, unsigned __int8 *a2, _QWORD *a3)
{
  int v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  const void *v9;
  size_t v10;
  const void *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  const void *v15;
  size_t v16;
  const void *v17;
  const void *v18;
  size_t v19;
  const void *v20;
  NSObject *v22;
  int v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = *(unsigned __int8 *)a3;
  if (v5 == *a2)
  {
    v6 = 1;
  }
  else
  {
    v7 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      v23 = 67109120;
      v24 = 515;
      _os_log_error_impl(&dword_2390FD000, v7, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", (uint8_t *)&v23, 8u);
      v7 = qword_2542CF618;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v23) = 0;
      _os_log_debug_impl(&dword_2390FD000, v7, OS_LOG_TYPE_DEBUG, "#gpsd,#supl Leaving SuplUtils::ValidateSlpId, SLP id type not matching", (uint8_t *)&v23, 2u);
    }
    v6 = 0;
    v5 = *a2;
  }
  if (v5 == 255)
  {
    v14 = qword_2542CF618;
    if (!os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
      return v6;
    v23 = 67109120;
    v24 = 515;
    goto LABEL_29;
  }
  if (v5 != 2)
  {
    if (v5 == 1)
    {
      v8 = a2[8];
      if (v8 == 2)
      {
        v18 = (const void *)a3[5];
        v19 = a3[6] - (_QWORD)v18;
        v20 = (const void *)*((_QWORD *)a2 + 5);
        if (v19 != *((_QWORD *)a2 + 6) - (_QWORD)v20 || memcmp(v18, v20, v19))
        {
          v12 = qword_2542CF618;
          if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
          {
            v23 = 67109120;
            v24 = 515;
            _os_log_error_impl(&dword_2390FD000, v12, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", (uint8_t *)&v23, 8u);
            v12 = qword_2542CF618;
          }
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            return 0;
          LOWORD(v23) = 0;
          v13 = "#gpsd,#supl Leaving SuplUtils::ValidateSlpId, SLP id IPv6 not matching";
          goto LABEL_36;
        }
      }
      else if (v8 == 1)
      {
        v9 = (const void *)a3[2];
        v10 = a3[3] - (_QWORD)v9;
        v11 = (const void *)*((_QWORD *)a2 + 2);
        if (v10 != *((_QWORD *)a2 + 3) - (_QWORD)v11 || memcmp(v9, v11, v10))
        {
          v12 = qword_2542CF618;
          if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
          {
            v23 = 67109120;
            v24 = 515;
            _os_log_error_impl(&dword_2390FD000, v12, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", (uint8_t *)&v23, 8u);
            v12 = qword_2542CF618;
          }
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            return 0;
          LOWORD(v23) = 0;
          v13 = "#gpsd,#supl Leaving SuplUtils::ValidateSlpId, SLP id IPv4 not matching";
LABEL_36:
          _os_log_debug_impl(&dword_2390FD000, v12, OS_LOG_TYPE_DEBUG, v13, (uint8_t *)&v23, 2u);
          return 0;
        }
      }
      else
      {
        v22 = qword_2542CF618;
        if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
        {
          v23 = 67109120;
          v24 = 514;
          _os_log_error_impl(&dword_2390FD000, v22, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", (uint8_t *)&v23, 8u);
          v22 = qword_2542CF618;
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v23) = 0;
          _os_log_debug_impl(&dword_2390FD000, v22, OS_LOG_TYPE_DEBUG, "#gpsd,#supl SuplUtils::ValidateSlpId, SLP id IpAddr type out of range", (uint8_t *)&v23, 2u);
        }
      }
      return v6;
    }
    v14 = qword_2542CF618;
    if (!os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
      return v6;
    v23 = 67109120;
    v24 = 514;
LABEL_29:
    _os_log_error_impl(&dword_2390FD000, v14, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", (uint8_t *)&v23, 8u);
    return v6;
  }
  v15 = (const void *)a3[8];
  v16 = a3[9] - (_QWORD)v15;
  v17 = (const void *)*((_QWORD *)a2 + 8);
  if (v16 != *((_QWORD *)a2 + 9) - (_QWORD)v17 || memcmp(v15, v17, v16))
  {
    v12 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      v23 = 67109120;
      v24 = 515;
      _os_log_error_impl(&dword_2390FD000, v12, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", (uint8_t *)&v23, 8u);
      v12 = qword_2542CF618;
    }
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      return 0;
    LOWORD(v23) = 0;
    v13 = "#gpsd,#supl SuplUtils::ValidateSlpId, SLP id FQDN data not matching";
    goto LABEL_36;
  }
  return v6;
}

BOOL sub_2391B9020(uint64_t a1, uint64_t a2, uint64_t a3)
{
  size_t v4;
  NSObject *v5;
  _BOOL8 result;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a2 + 8) - *(_QWORD *)a2;
  if (v4 == *(_QWORD *)(a3 + 8) - *(_QWORD *)a3 && !memcmp(*(const void **)a2, *(const void **)a3, v4))
    return 1;
  v5 = qword_2542CF618;
  result = os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR);
  if (result)
  {
    v7[0] = 67109120;
    v7[1] = 515;
    _os_log_error_impl(&dword_2390FD000, v5, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", (uint8_t *)v7, 8u);
    return 0;
  }
  return result;
}

BOOL sub_2391B90F0(uint64_t a1, int a2, int a3)
{
  _BOOL8 result;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (a2 == a3)
    return 1;
  v4 = qword_2542CF618;
  result = os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR);
  if (result)
  {
    v5[0] = 67109120;
    v5[1] = 515;
    _os_log_error_impl(&dword_2390FD000, v4, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", (uint8_t *)v5, 8u);
    return 0;
  }
  return result;
}

BOOL sub_2391B91A4(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  int v3;
  const void *v4;
  size_t v5;
  const void *v6;
  NSObject *v7;
  _BOOL8 result;
  NSObject *v9;
  const void *v10;
  size_t v11;
  const void *v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  if (v3 == *a3)
  {
    switch(*a2)
    {
      case 1u:
        v4 = (const void *)*((_QWORD *)a2 + 1);
        v5 = *((_QWORD *)a2 + 2) - (_QWORD)v4;
        v6 = (const void *)*((_QWORD *)a3 + 1);
        if (v5 == *((_QWORD *)a3 + 2) - (_QWORD)v6 && !memcmp(v4, v6, v5))
          return 1;
        v7 = qword_2542CF618;
        result = os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR);
        if (result)
        {
          v14 = 67109120;
          v15 = 515;
          goto LABEL_9;
        }
        return result;
      case 2u:
      case 3u:
      case 5u:
        goto LABEL_11;
      case 4u:
        v10 = (const void *)*((_QWORD *)a2 + 10);
        v11 = *((_QWORD *)a2 + 11) - (_QWORD)v10;
        v12 = (const void *)*((_QWORD *)a3 + 10);
        if (v11 == *((_QWORD *)a3 + 11) - (_QWORD)v12 && !memcmp(v10, v12, v11))
          return 1;
        v7 = qword_2542CF618;
        result = os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR);
        if (!result)
          return result;
        v14 = 67109120;
        v15 = 515;
        goto LABEL_9;
      case 6u:
        v13 = a2[128];
        if (v13 == a3[128])
        {
          if ((v13 - 1) < 2)
            return 1;
          v7 = qword_2542CF618;
          result = os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR);
          if (result)
          {
            v14 = 67109120;
            v15 = 515;
            goto LABEL_9;
          }
          return result;
        }
        v7 = qword_2542CF618;
        result = os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR);
        if (!result)
          return result;
        v14 = 67109120;
        v15 = 515;
        goto LABEL_9;
      default:
        if (v3 == 255)
        {
LABEL_11:
          v9 = qword_2542CF618;
          if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
          {
            v14 = 67109120;
            v15 = 770;
            _os_log_error_impl(&dword_2390FD000, v9, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", (uint8_t *)&v14, 8u);
          }
          return 1;
        }
        v7 = qword_2542CF618;
        result = os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR);
        if (!result)
          return result;
        v14 = 67109120;
        v15 = 515;
        break;
    }
    goto LABEL_9;
  }
  v7 = qword_2542CF618;
  result = os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR);
  if (result)
  {
    v14 = 67109120;
    v15 = 515;
LABEL_9:
    _os_log_error_impl(&dword_2390FD000, v7, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", (uint8_t *)&v14, 8u);
    return 0;
  }
  return result;
}

double sub_2391B9480(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6;
  _BOOL4 v7;
  _BOOL4 v8;
  double result;

  v6 = sub_2391BC46C();
  v7 = sub_2391BC974(v6, a3);
  v8 = 0;
  *(_DWORD *)(a2 + 36) = 0;
  if (!*(_DWORD *)(a1 + 296))
    v8 = *(_DWORD *)(a1 + 284) == 1;
  if (!v7)
    v8 = 0;
  *(_DWORD *)a2 = v8;
  result = *(double *)(a1 + 288);
  *(double *)(a2 + 4) = result;
  *(_DWORD *)(a2 + 40) = 0;
  *(_DWORD *)(a2 + 32) = 0;
  return result;
}

void sub_2391B94F0(_DWORD *a1, uint64_t a2, int a3, int a4)
{
  sub_2391B9480((uint64_t)a1, a2, a4);
  if (a1[72] == 1)
    *(_BYTE *)(a2 + 28) = 1;
  if ((a3 & 0xFFFFFFFD) == 0 && !a1[74] && a1[71] == 1)
    *(_BYTE *)(a2 + 28) = 0;
}

void sub_2391B9554(int a1, uint64_t a2, uint64_t a3)
{
  int v5;
  int v6;
  char *v7;
  char *v8;
  _QWORD *v9;
  unint64_t v10;
  NSObject *v11;
  int v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a3 + 224 != a2)
    sub_239107FF0((_QWORD *)a2, *(char **)(a3 + 224), *(char **)(a3 + 232), *(_QWORD *)(a3 + 232) - *(_QWORD *)(a3 + 224));
  v5 = *(unsigned __int8 *)(a3 + 248);
  *(_BYTE *)(a2 + 24) = v5;
  if (v5 == 255)
  {
    v11 = qword_2542CF618;
    if (!os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
      return;
    v12 = 67109120;
    v13 = 515;
    goto LABEL_22;
  }
  if (v5 == 2)
  {
    if (a2 == a3 + 224)
      return;
    v7 = *(char **)(a3 + 312);
    v8 = *(char **)(a3 + 320);
    v9 = (_QWORD *)(a2 + 88);
    v10 = v8 - v7;
    goto LABEL_12;
  }
  if (v5 != 1)
  {
    v11 = qword_2542CF618;
    if (!os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
      return;
    v12 = 67109120;
    v13 = 514;
    goto LABEL_22;
  }
  *(_BYTE *)(a2 + 32) = *(_BYTE *)(a3 + 256);
  v6 = *(unsigned __int8 *)(a3 + 256);
  if (v6 == 2)
  {
    if (a2 != a3 + 224)
    {
      v7 = *(char **)(a3 + 288);
      v8 = *(char **)(a3 + 296);
      v9 = (_QWORD *)(a2 + 64);
LABEL_19:
      v10 = v8 - v7;
LABEL_12:
      sub_239107FF0(v9, v7, v8, v10);
    }
  }
  else
  {
    if (v6 == 1)
    {
      if (a2 == a3 + 224)
        return;
      v7 = *(char **)(a3 + 264);
      v8 = *(char **)(a3 + 272);
      v9 = (_QWORD *)(a2 + 40);
      goto LABEL_19;
    }
    v11 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      v12 = 67109120;
      v13 = 514;
LABEL_22:
      _os_log_error_impl(&dword_2390FD000, v11, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", (uint8_t *)&v12, 8u);
    }
  }
}

void sub_2391B9780(int a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  unsigned int v8;
  int v9;
  int v10;
  int v11;
  _BYTE *v12;
  int v13;
  _BYTE *v14;
  unint64_t *v15;
  unint64_t v16;
  int v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (!a2)
  {
    v7 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      v17 = 67109120;
      v18 = 515;
      _os_log_error_impl(&dword_2390FD000, v7, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", (uint8_t *)&v17, 8u);
    }
    return;
  }
  *(_DWORD *)a2 = 0;
  v4 = *(unsigned __int8 *)(a3 + 1);
  if (v4 <= 0xA)
  {
    if (((1 << v4) & 0x523) != 0)
      goto LABEL_4;
    if (v4 == 3)
    {
      v13 = *(_DWORD *)(a3 + 32);
      *(_DWORD *)(a2 + 48) = v13;
      *(_DWORD *)(a2 + 52) = *(_DWORD *)(a3 + 40);
      *(_BYTE *)(a2 + 44) = (v13 & 0x800000) != 0;
      *(_DWORD *)(a2 + 40) = 0;
      *(_BYTE *)(a2 + 58) = *(_BYTE *)(a3 + 64);
      *(_BYTE *)(a2 + 56) = *(_DWORD *)(a3 + 48);
      *(_BYTE *)(a2 + 57) = *(_DWORD *)(a3 + 56);
      *(_QWORD *)(a2 + 32) = 0x100000001;
      v12 = (_BYTE *)(a3 + 65);
LABEL_27:
      v15 = (unint64_t *)(a2 + 8);
      v14 = *(_BYTE **)(a2 + 8);
      *(_BYTE *)(a2 + 59) = *v12;
      v16 = *(_QWORD *)(a2 + 16) - (_QWORD)v14;
      if (v16 > 0xC)
      {
        if (v16 != 13)
          *(_QWORD *)(a2 + 16) = v14 + 13;
      }
      else
      {
        sub_239101670(v15, 13 - v16);
        v14 = (_BYTE *)*v15;
      }
      *v14 = (*(_WORD *)(a3 + 216) / 0xAu - 10 * ((6554 * (*(unsigned __int16 *)(a3 + 216) / 0xAu)) >> 16)) | 0x30;
      *(_BYTE *)(*v15 + 1) = (*(_WORD *)(a3 + 216) % 0xAu) | 0x30;
      *(_BYTE *)(*v15 + 2) = (*(_BYTE *)(a3 + 218) / 0xAu
                            - 10 * ((unsigned __int16)(26 * (*(unsigned __int8 *)(a3 + 218) / 0xAu)) >> 8)) | 0x30;
      *(_BYTE *)(*v15 + 3) = (*(_BYTE *)(a3 + 218) % 0xAu) | 0x30;
      *(_BYTE *)(*v15 + 4) = (*(_BYTE *)(a3 + 219) / 0xAu
                            - 10 * ((unsigned __int16)(26 * (*(unsigned __int8 *)(a3 + 219) / 0xAu)) >> 8)) | 0x30;
      *(_BYTE *)(*v15 + 5) = (*(_BYTE *)(a3 + 219) % 0xAu) | 0x30;
      *(_BYTE *)(*v15 + 6) = (*(_BYTE *)(a3 + 220) / 0xAu
                            - 10 * ((unsigned __int16)(26 * (*(unsigned __int8 *)(a3 + 220) / 0xAu)) >> 8)) | 0x30;
      *(_BYTE *)(*v15 + 7) = (*(_BYTE *)(a3 + 220) % 0xAu) | 0x30;
      *(_BYTE *)(*v15 + 8) = (*(_BYTE *)(a3 + 221) / 0xAu
                            - 10 * ((unsigned __int16)(26 * (*(unsigned __int8 *)(a3 + 221) / 0xAu)) >> 8)) | 0x30;
      *(_BYTE *)(*v15 + 9) = (*(_BYTE *)(a3 + 221) % 0xAu) | 0x30;
      *(_BYTE *)(*v15 + 10) = (*(_BYTE *)(a3 + 222) / 0xAu
                             - 10 * ((unsigned __int16)(26 * (*(unsigned __int8 *)(a3 + 222) / 0xAu)) >> 8)) | 0x30;
      *(_BYTE *)(*v15 + 11) = (*(_BYTE *)(a3 + 222) % 0xAu) | 0x30;
      *(_BYTE *)(*v15 + 12) = 90;
      return;
    }
    if (v4 == 9)
    {
      *(_BYTE *)(a2 + 44) = (*(_DWORD *)(a2 + 48) & 0x800000) != 0;
      *(_DWORD *)(a2 + 48) = *(_DWORD *)(a3 + 68) & 0x7FFFFF;
      *(_DWORD *)(a2 + 52) = *(_DWORD *)(a3 + 76);
      v8 = *(unsigned __int16 *)(a3 + 84);
      v9 = *(_DWORD *)(a3 + 108);
      if (v8 != 0xFFFF && v9 != 255)
        *(_DWORD *)(a2 + 40) = 1;
      *(_BYTE *)(a2 + 64) = v9;
      *(_BYTE *)(a2 + 60) = v8 >> 15;
      *(_WORD *)(a2 + 62) = v8 & 0x7FFF;
      v10 = *(_DWORD *)(a3 + 92);
      v11 = *(_DWORD *)(a3 + 100);
      if (v10 != 255 && v11 != 255 && *(unsigned __int8 *)(a3 + 116) != 255)
        *(_DWORD *)(a2 + 32) = 1;
      *(_BYTE *)(a2 + 58) = *(_BYTE *)(a3 + 116);
      *(_BYTE *)(a2 + 56) = v10;
      *(_BYTE *)(a2 + 57) = v11;
      *(_DWORD *)(a2 + 36) = 1;
      v12 = (_BYTE *)(a3 + 117);
      goto LABEL_27;
    }
  }
  if (v4 == 255)
  {
LABEL_4:
    v5 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      v17 = 67109120;
      v18 = 770;
      _os_log_error_impl(&dword_2390FD000, v5, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", (uint8_t *)&v17, 8u);
      v5 = qword_2542CF618;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v17) = 0;
      v6 = "#gpsd,#supl Leaving SuplUtils::ConvertLocEstimatetoAsn1Position, invalid/unsupported shape type";
LABEL_8:
      _os_log_debug_impl(&dword_2390FD000, v5, OS_LOG_TYPE_DEBUG, v6, (uint8_t *)&v17, 2u);
      return;
    }
    return;
  }
  v5 = qword_2542CF618;
  if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
  {
    v17 = 67109120;
    v18 = 515;
    _os_log_error_impl(&dword_2390FD000, v5, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", (uint8_t *)&v17, 8u);
    v5 = qword_2542CF618;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v17) = 0;
    v6 = "#gpsd,#supl Leaving SuplUtils::ConvertLocEstimatetoAsn1Position, invalid shape type";
    goto LABEL_8;
  }
}

BOOL sub_2391B9C40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v3;
  _BOOL8 result;
  const char *v5;
  uint8_t *v6;
  unint64_t v9;
  unint64_t v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  uint8_t buf[2];
  __int16 v15;

  if (*(_BYTE *)a3 == 2)
  {
    v3 = qword_2542CF618;
    result = os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_INFO);
    if (!result)
      return result;
    v15 = 0;
    v5 = "Last know position fix is not valid";
    v6 = (uint8_t *)&v15;
    goto LABEL_10;
  }
  if (*(_BYTE *)(a3 + 1) != 9)
  {
    v3 = qword_2542CF618;
    result = os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_INFO);
    if (!result)
      return result;
    *(_WORD *)buf = 0;
    v5 = "Last know position shape type is not valid";
    v6 = buf;
    goto LABEL_10;
  }
  if (*(_DWORD *)(a3 + 92) > *(unsigned __int8 *)(a2 + 12))
  {
    v3 = qword_2542CF618;
    result = os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_INFO);
    if (!result)
      return result;
    v13 = 0;
    v5 = "stored semiminor axis is not valid";
    v6 = (uint8_t *)&v13;
    goto LABEL_10;
  }
  if (*(_DWORD *)a2 == 1 && *(_DWORD *)(a3 + 108) > *(unsigned __int8 *)(a2 + 13))
  {
    v3 = qword_2542CF618;
    result = os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_INFO);
    if (result)
    {
      v12 = 0;
      v5 = "vertical accuracy is not valid";
      v6 = (uint8_t *)&v12;
LABEL_10:
      _os_log_impl(&dword_2390FD000, v3, OS_LOG_TYPE_INFO, v5, v6, 2u);
      return 0;
    }
  }
  else
  {
    if (*(_DWORD *)(a2 + 4) != 1)
      return 1;
    v9 = sub_239184EE8();
    HIDWORD(v10) = 1041313291;
    LODWORD(v10) = *(_DWORD *)(a3 + 228);
    if (1000 * *(_DWORD *)(a2 + 16) >= -((double)v10 - (double)v9 * 0.000000001 * 1000.0))
      return 1;
    v3 = qword_2542CF618;
    result = os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_INFO);
    if (result)
    {
      v11 = 0;
      v5 = "maxlocation age is not valid";
      v6 = (uint8_t *)&v11;
      goto LABEL_10;
    }
  }
  return result;
}

uint64_t sub_2391B9E14(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  *(_WORD *)a2 = *(_WORD *)(a1 + 48);
  v4 = *(_OWORD *)(a1 + 56);
  v5 = *(_OWORD *)(a1 + 72);
  v6 = *(_OWORD *)(a1 + 88);
  *(_OWORD *)(a2 + 56) = *(_OWORD *)(a1 + 104);
  *(_OWORD *)(a2 + 40) = v6;
  *(_OWORD *)(a2 + 24) = v5;
  *(_OWORD *)(a2 + 8) = v4;
  v7 = *(_OWORD *)(a1 + 120);
  v8 = *(_OWORD *)(a1 + 136);
  v9 = *(_OWORD *)(a1 + 152);
  *(_OWORD *)(a2 + 120) = *(_OWORD *)(a1 + 168);
  *(_OWORD *)(a2 + 104) = v9;
  *(_OWORD *)(a2 + 88) = v8;
  *(_OWORD *)(a2 + 72) = v7;
  v10 = *(_OWORD *)(a1 + 184);
  v11 = *(_OWORD *)(a1 + 200);
  v12 = *(_OWORD *)(a1 + 216);
  *(_QWORD *)(a2 + 184) = *(_QWORD *)(a1 + 232);
  *(_OWORD *)(a2 + 168) = v12;
  *(_OWORD *)(a2 + 152) = v11;
  *(_OWORD *)(a2 + 136) = v10;
  if (a1 + 48 != a2)
    sub_2391BA4F0((_QWORD *)(a2 + 192), *(char **)(a1 + 240), *(char **)(a1 + 248), (uint64_t)(*(_QWORD *)(a1 + 248) - *(_QWORD *)(a1 + 240)) >> 4);
  *(_OWORD *)(a2 + 216) = *(_OWORD *)(a1 + 264);
  return 0;
}

unsigned __int8 *sub_2391B9ECC(unsigned __int8 *result, char *__str)
{
  int v2;
  _BYTE *v3;
  _BYTE *v4;
  int v5;
  unsigned __int8 *v6;

  v2 = *result;
  if (v2 == 1)
  {
    v5 = result[8];
    if (v5 == 2)
    {
      *((_DWORD *)__str + 64) = 2;
      v6 = (unsigned __int8 *)*((_QWORD *)result + 5);
      return (unsigned __int8 *)snprintf(__str, 0x100uLL, "%d.%d.%d.%d.%d.%d.%d.%d.%d.%d.%d.%d.%d.%d.%d.%d", *v6, v6[1], v6[2], v6[3], v6[4], v6[5]);
    }
    else if (v5 == 1)
    {
      *((_DWORD *)__str + 64) = 1;
      return (unsigned __int8 *)snprintf(__str, 0x100uLL, "%d.%d.%d.%d");
    }
  }
  else if (v2 == 2)
  {
    *((_DWORD *)__str + 64) = 3;
    v3 = (_BYTE *)*((_QWORD *)result + 8);
    v4 = (_BYTE *)*((_QWORD *)result + 9);
    if (v4 != v3)
      return (unsigned __int8 *)memmove(__str, v3, v4 - v3);
  }
  else
  {
    *((_DWORD *)__str + 64) = 0;
  }
  return result;
}

uint64_t sub_2391B9FE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  int v7;
  BOOL v8;
  uint64_t v9;
  unsigned __int8 v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  NSObject *v14;
  __int16 v15;
  NSObject *v16;
  int v17;
  _QWORD v19[2];
  _QWORD v20[2];
  char v21;
  void *__p;
  void *v23;
  uint64_t v24;
  uint8_t v25[4];
  int v26;
  uint64_t buf;
  unsigned __int16 v28;
  uint64_t v29;
  _DWORD v30[6];
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
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
  void *v46;
  unsigned __int8 v47[16];
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)a3 != *(_QWORD *)(a3 + 8))
  {
    LOWORD(buf) = 0;
    v6 = sub_23918BED4();
    v7 = atomic_load((unsigned __int8 *)(v6 + 1));
    v8 = v7 == 255;
    v9 = 1;
    if (v8)
      v9 = 2;
    v10 = atomic_load((unsigned __int8 *)(v6 + v9));
    BYTE2(buf) = v10;
    *(_WORD *)((char *)&buf + 3) = 0;
    v28 = -1;
    v29 = 0;
    sub_2391B6D50((uint64_t)v30);
    __p = 0;
    v23 = 0;
    v24 = 0;
    sub_239189290(&__p, *(const void **)a3, *(_QWORD *)(a3 + 8), *(_QWORD *)(a3 + 8) - *(_QWORD *)a3);
    v20[0] = &__p;
    v20[1] = 0;
    v21 = 0;
    v19[0] = v20;
    v19[1] = &buf;
    if (sub_2391AA818((uint64_t)v19) || v28 != 1)
    {
      v16 = qword_2542CF618;
      if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v25 = 67109120;
        v26 = 515;
        _os_log_error_impl(&dword_2390FD000, v16, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", v25, 8u);
      }
      v15 = -5;
      goto LABEL_43;
    }
    v11 = v29;
    *(_BYTE *)(a4 + 5) = *(_BYTE *)(v29 + 224) == 0;
    *(_BYTE *)(a4 + 6) = BYTE2(buf);
    *(_WORD *)(a4 + 7) = *(_WORD *)((char *)&buf + 3);
    *(_DWORD *)(a4 + 12) = sub_2391B8778(*(unsigned __int8 *)(v11 + 20));
    *(_DWORD *)(a4 + 272) = 0;
    if (v30[1] == 1)
      sub_2391B9ECC(v47, (char *)(a4 + 16));
    *(_DWORD *)(a4 + 536) = 0;
    if (*(_DWORD *)(v11 + 292) == 1)
      sub_2391B9ECC((unsigned __int8 *)(v11 + 592), (char *)(a4 + 280));
    *(_DWORD *)(a4 + 800) = 0;
    if (*(_DWORD *)(v11 + 4) == 1)
      sub_2391B9ECC((unsigned __int8 *)(v11 + 112), (char *)(a4 + 544));
    *(_BYTE *)(a4 + 808) = *(_DWORD *)(v11 + 108) != 0;
    *(_DWORD *)(a4 + 812) = 0;
    if (*(_DWORD *)v11 == 1)
    {
      v12 = *(unsigned __int8 *)(v11 + 44);
      if (v12 <= 4)
        *(_DWORD *)(a4 + 812) = v12 + 1;
    }
    *(_BYTE *)(a4 + 816) = 0;
    if (*(_DWORD *)(v11 + 304))
    {
      v13 = *(_DWORD *)(v11 + 792);
      if (v13 == 1)
        *(_BYTE *)(a4 + 816) = 1;
      else
        LOBYTE(v13) = 0;
      if (*(_DWORD *)(v11 + 796) == 1)
      {
        LOBYTE(v13) = v13 | 2;
        *(_BYTE *)(a4 + 816) = v13;
      }
      if (*(_DWORD *)(v11 + 800) == 1)
      {
        LOBYTE(v13) = v13 | 4;
        *(_BYTE *)(a4 + 816) = v13;
      }
      if (*(_DWORD *)(v11 + 804) == 1)
      {
        LOBYTE(v13) = v13 | 8;
        *(_BYTE *)(a4 + 816) = v13;
      }
      if (*(_DWORD *)(v11 + 808) == 1)
      {
        LOBYTE(v13) = v13 | 0x10;
        *(_BYTE *)(a4 + 816) = v13;
      }
      if (*(_DWORD *)(v11 + 812) == 1)
        *(_BYTE *)(a4 + 816) = v13 | 0x20;
    }
    *(_BYTE *)(a4 + 817) = 0;
    if (*(_DWORD *)(v11 + 8) == 1)
    {
      *(_BYTE *)(a4 + 817) = 1;
      *(_WORD *)(a4 + 820) = *(_WORD *)(v11 + 212);
      *(_DWORD *)(a4 + 824) = *(_DWORD *)(v11 + 216);
      *(_BYTE *)(a4 + 828) = *(_BYTE *)(v11 + 220);
    }
    *(_DWORD *)(a4 + 832) = 0;
    if (*(_DWORD *)(v11 + 288) == 1)
    {
      v17 = *(unsigned __int8 *)(v11 + 584);
      if (v17 == 1)
      {
LABEL_41:
        *(_DWORD *)(a4 + 832) = v17;
        goto LABEL_42;
      }
      if (!*(_BYTE *)(v11 + 584))
      {
        v17 = 2;
        goto LABEL_41;
      }
    }
LABEL_42:
    v15 = 0;
    *(_BYTE *)(a4 + 4) = 1;
LABEL_43:
    if (__p)
    {
      v23 = __p;
      operator delete(__p);
    }
    if (v52)
    {
      v53 = v52;
      operator delete(v52);
    }
    if (v50)
    {
      v51 = v50;
      operator delete(v50);
    }
    if (v48)
    {
      v49 = v48;
      operator delete(v48);
    }
    if (v45)
    {
      v46 = v45;
      operator delete(v45);
    }
    if (v43)
    {
      v44 = v43;
      operator delete(v43);
    }
    if (v41)
    {
      v42 = v41;
      operator delete(v41);
    }
    if (v39)
    {
      v40 = v39;
      operator delete(v39);
    }
    if (v37)
    {
      v38 = v37;
      operator delete(v37);
    }
    if (v35)
    {
      v36 = v35;
      operator delete(v35);
    }
    if (v33)
    {
      v34 = v33;
      operator delete(v33);
    }
    if (v31)
    {
      v32 = v31;
      operator delete(v31);
    }
    sub_2391AA1C8(&v28);
    return v15;
  }
  v14 = qword_2542CF618;
  if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
  {
    buf = 0x20304000100;
    _os_log_error_impl(&dword_2390FD000, v14, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", (uint8_t *)&buf, 8u);
  }
  return -5;
}

void sub_2391BA404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  if (__p)
    operator delete(__p);
  sub_2391A5948((uint64_t)&a19);
  _Unwind_Resume(a1);
}

void sub_2391BA440(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  int v3;

  if (a2 > 0x17)
    v3 = 0;
  else
    v3 = dword_2391CC058[(char)a2];
  *a3 = v3;
}

void sub_2391BA468(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    do
    {
      v3 = *(_QWORD *)(v1 + 8);
      if (*(_QWORD *)(v1 + 16))
      {
        v4 = sub_2391B1EF8();
        sub_2391B3078(v4, **(_DWORD **)(v1 + 16));
        v5 = (_QWORD *)sub_2391AE584();
        sub_23918EDCC((uint64_t)off_25691E330, **(_DWORD **)(v1 + 16));
        sub_2391AEFF8(v5);
        sub_2391B8ADC(a1, **(_DWORD **)(v1 + 16));
      }
      v1 = v3;
    }
    while (v3);
  }
}

_QWORD *sub_2391BA4F0(_QWORD *result, char *__src, char *a3, unint64_t a4)
{
  char *v6;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  size_t v12;
  void **v13;
  _BYTE *v14;
  unint64_t v15;
  char *v16;
  void *v17;

  v6 = __src;
  v7 = result;
  v8 = result[2];
  v9 = (char *)*result;
  if (a4 > (v8 - *result) >> 4)
  {
    if (v9)
    {
      result[1] = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 60)
      goto LABEL_23;
    v10 = v8 >> 3;
    if (v8 >> 3 <= a4)
      v10 = a4;
    v11 = (unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v10;
    if (v11 >> 60)
LABEL_23:
      sub_23910165C();
    result = operator new(16 * v11);
    v9 = (char *)result;
    *v7 = result;
    v7[1] = result;
    v7[2] = &result[2 * v11];
    v12 = a3 - v6;
    if (v12)
      result = memcpy(result, v6, v12);
    v13 = (void **)(v7 + 1);
    goto LABEL_22;
  }
  v13 = (void **)(result + 1);
  v14 = (_BYTE *)result[1];
  v15 = (v14 - v9) >> 4;
  if (v15 >= a4)
  {
    v12 = a3 - __src;
    if (a3 == __src)
      goto LABEL_22;
    v17 = (void *)*result;
LABEL_21:
    result = memmove(v17, __src, v12);
    goto LABEL_22;
  }
  v16 = &__src[16 * v15];
  if (v14 != v9)
  {
    result = memmove((void *)*result, __src, v14 - v9);
    v9 = (char *)*v13;
  }
  v12 = a3 - v16;
  if (v12)
  {
    v17 = v9;
    __src = v16;
    goto LABEL_21;
  }
LABEL_22:
  *v13 = &v9[v12];
  return result;
}

void sub_2391BA62C(_QWORD *a1, unint64_t a2, _BYTE *a3)
{
  unint64_t v4;
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  unint64_t v9;
  unint64_t v10;
  size_t v11;
  void *v12;
  _BYTE *v13;
  char *v14;
  char *v15;
  _BYTE *v16;
  _BYTE *v17;
  char v18;

  v4 = a2;
  v7 = (_BYTE *)a1[1];
  v6 = a1[2];
  if (v6 - (uint64_t)v7 >= a2)
  {
    if (a2)
    {
      v13 = &v7[a2];
      do
      {
        *v7++ = *a3;
        --v4;
      }
      while (v4);
      v7 = v13;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = &v7[-*a1];
    v9 = (unint64_t)&v8[a2];
    if ((uint64_t)&v8[a2] < 0)
      sub_23910165C();
    v10 = v6 - *a1;
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x3FFFFFFFFFFFFFFFLL)
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v11 = v9;
    if (v11)
      v12 = operator new(v11);
    else
      v12 = 0;
    v14 = &v8[(_QWORD)v12];
    v15 = &v8[(_QWORD)v12 + v4];
    v16 = &v8[(_QWORD)v12];
    do
    {
      *v16++ = *a3;
      --v4;
    }
    while (v4);
    v17 = (_BYTE *)*a1;
    if (v7 != (_BYTE *)*a1)
    {
      do
      {
        v18 = *--v7;
        *--v14 = v18;
      }
      while (v7 != v17);
      v7 = (_BYTE *)*a1;
    }
    *a1 = v14;
    a1[1] = v15;
    a1[2] = (char *)v12 + v11;
    if (v7)
      operator delete(v7);
  }
}

void sub_2391BA744(char **a1, unsigned int *a2, unint64_t *a3)
{
  char *v6;
  char *v7;
  unint64_t v8;
  unsigned int v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unsigned int v14;
  unsigned int v15;

  v6 = *a1;
  v7 = a1[1];
  v8 = v7 - *a1;
  if ((((_DWORD)v8 + 9) & 0x3F) != 0)
    v9 = ((v8 + 9) >> 6) + 1;
  else
    v9 = (v8 + 9) >> 6;
  *a2 = v9;
  if (a3 != (unint64_t *)a1)
  {
    sub_239107FF0(a3, v6, v7, v8);
    v9 = *a2;
  }
  v10 = v9 << 6;
  v11 = *a3;
  v12 = a3[1] - *a3;
  if (v10 <= v12)
  {
    if (v10 < v12)
      a3[1] = v11 + v10;
  }
  else
  {
    sub_239101670(a3, v10 - v12);
    v11 = *a3;
  }
  *(_BYTE *)(v11 + (*((_DWORD *)a1 + 2) - *(_DWORD *)a1)) = 0x80;
  v13 = 8 * (a1[1] - *a1);
  if (v13)
  {
    v14 = *a2 << 6;
    if (v14)
    {
      v15 = v14 - 1;
      do
      {
        *(_BYTE *)(*a3 + v15) = v13;
        if (v13 < 0x100)
          break;
        v13 >>= 8;
      }
      while ((unint64_t)v15--);
    }
  }
}

uint64_t *sub_2391BA824(uint64_t *result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  unsigned int v6;
  uint64_t v7;
  BOOL v9;

  v3 = *result;
  v2 = result[1];
  if (v2 != *result)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = *(_DWORD *)(v3 + 4 * v4);
      if (v6)
      {
        v7 = (4 * v5) | 3;
        do
        {
          *(_BYTE *)(*a2 + v7) = v6;
          v9 = v7-- != 0;
          if (v6 < 0x100)
            break;
          v6 >>= 8;
        }
        while (v9);
        v3 = *result;
        v2 = result[1];
      }
      v4 = ++v5;
    }
    while (v5 < (unint64_t)((v2 - v3) >> 2));
  }
  return result;
}

void sub_2391BA888(uint64_t a1, char **a2, _QWORD *a3)
{
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;
  _OWORD *v11;
  uint64_t v12;
  unsigned __int8 *v13;
  uint64_t v14;
  int v15;
  uint64_t i;
  unint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  unint64_t v31;
  int v32;
  uint64_t v33;
  int v34;
  int v35;
  int v36;
  unint64_t v37;
  int v38;
  uint64_t v39;
  int v40;
  int v41;
  unint64_t v42;
  int v43;
  int v44;
  uint64_t v45;
  int v46;
  int v47;
  int v48;
  unint64_t v49;
  int v50;
  _QWORD *v51;
  void *__p;
  void *v53;
  uint64_t v54;
  unsigned int v55;
  uint64_t v56[3];
  unsigned __int8 *v57;
  uint64_t v58;
  uint64_t v59;

  v6 = operator new(0x14uLL);
  v56[1] = (uint64_t)(v6 + 5);
  v56[2] = (uint64_t)(v6 + 5);
  v6[4] = -1009589776;
  *(_OWORD *)v6 = xmmword_2391CC0B8;
  v56[0] = (uint64_t)v6;
  v55 = 0;
  __p = 0;
  v53 = 0;
  v54 = 0;
  sub_2391BA744(a2, &v55, (unint64_t *)&__p);
  v51 = a3;
  v7 = v55;
  if (v55)
  {
    v8 = 0;
    do
    {
      v57 = 0;
      v58 = 0;
      v59 = 0;
      sub_2391BB720(&v57, (char *)__p + 64 * v8, (uint64_t)__p + 64 * v8 + 64);
      v10 = v57;
      v9 = v58;
      v11 = operator new(0x140uLL);
      v12 = 0;
      v11[18] = 0u;
      v11[19] = 0u;
      v11[16] = 0u;
      v11[17] = 0u;
      v11[14] = 0u;
      v11[15] = 0u;
      v11[12] = 0u;
      v11[13] = 0u;
      v11[10] = 0u;
      v11[11] = 0u;
      v11[8] = 0u;
      v11[9] = 0u;
      v11[6] = 0u;
      v11[7] = 0u;
      v11[4] = 0u;
      v11[5] = 0u;
      v11[2] = 0u;
      v11[3] = 0u;
      v13 = v10;
      *v11 = 0u;
      v11[1] = 0u;
      while (4 * v12 + 4 <= (unint64_t)(v9 - (_QWORD)v10))
      {
        v14 = 0;
        v15 = 0;
        do
          v15 = v13[v14++] | (v15 << 8);
        while (v14 != 4);
        *((_DWORD *)v11 + v12++) = v15;
        v13 += 4;
        if (v12 == 16)
        {
          for (i = 0; i != 256; i += 4)
          {
            HIDWORD(v17) = *(_DWORD *)((char *)v11 + i + 32) ^ *(_DWORD *)((char *)v11 + i + 52) ^ *(_DWORD *)((char *)v11 + i + 8) ^ *(_DWORD *)((char *)v11 + i);
            LODWORD(v17) = HIDWORD(v17);
            *(_DWORD *)((char *)v11 + i + 64) = v17 >> 31;
          }
          v18 = 0;
          v19 = v6[1];
          v21 = v6[3];
          v20 = v6[4];
          v22 = v20;
          v23 = v6[2];
          v24 = v21;
          v25 = v23;
          v26 = v19;
          v27 = *v6;
          do
          {
            v28 = v27;
            v29 = v25;
            v30 = v24;
            HIDWORD(v31) = v27;
            LODWORD(v31) = v27;
            v32 = v22 + (v26 & v25) + (v24 & ~v26) + (v31 >> 27) + 1518500249;
            HIDWORD(v31) = v26;
            LODWORD(v31) = v26;
            v25 = v31 >> 2;
            v27 = v32 + *(_DWORD *)((char *)v11 + v18);
            v18 += 4;
            v22 = v24;
            v24 = v29;
            v26 = v28;
          }
          while (v18 != 80);
          v33 = 0;
          do
          {
            v34 = v27;
            v35 = v25;
            v36 = v29;
            HIDWORD(v37) = v27;
            LODWORD(v37) = v27;
            v38 = v30 + (v25 ^ v29 ^ v28) + (v37 >> 27) + 1859775393;
            HIDWORD(v37) = v28;
            LODWORD(v37) = v28;
            v25 = v37 >> 2;
            v27 = v38 + *(_DWORD *)((char *)v11 + v33 + 80);
            v33 += 4;
            v30 = v29;
            v29 = v35;
            v28 = v34;
          }
          while (v33 != 80);
          v39 = 0;
          do
          {
            v40 = v27;
            v41 = v25;
            HIDWORD(v42) = v27;
            LODWORD(v42) = v27;
            v43 = v35;
            v44 = v36 + (v42 >> 27) + ((v41 | v35) & v34 | v41 & v35) - 1894007588;
            HIDWORD(v42) = v34;
            LODWORD(v42) = v34;
            v25 = v42 >> 2;
            v27 = v44 + *(_DWORD *)((char *)v11 + v39 + 160);
            v39 += 4;
            v36 = v35;
            v35 = v41;
            v34 = v40;
          }
          while (v39 != 80);
          v45 = 0;
          do
          {
            v46 = v27;
            v47 = v25;
            v48 = v41;
            HIDWORD(v49) = v27;
            LODWORD(v49) = v27;
            v50 = v43 + (v25 ^ v41 ^ v40) + (v49 >> 27) - 899497514;
            HIDWORD(v49) = v40;
            LODWORD(v49) = v40;
            v25 = v49 >> 2;
            v27 = v50 + *(_DWORD *)((char *)v11 + v45 + 240);
            v45 += 4;
            v43 = v41;
            v41 = v47;
            v40 = v46;
          }
          while (v45 != 80);
          *v6 += v27;
          v6[1] = v46 + v19;
          v6[2] = v25 + v23;
          v6[3] = v47 + v21;
          v6[4] = v48 + v20;
          break;
        }
      }
      operator delete(v11);
      if (v10)
        operator delete(v10);
      ++v8;
    }
    while (v8 != v7);
  }
  sub_2391BA824(v56, (_QWORD *)a1);
  if (v51 != (_QWORD *)a1)
    sub_239107FF0(v51, *(char **)a1, *(char **)(a1 + 8), *(_QWORD *)(a1 + 8) - *(_QWORD *)a1);
  if (__p)
  {
    v53 = __p;
    operator delete(__p);
  }
  operator delete(v6);
}

void sub_2391BAC0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12)
{
  void *v12;

  if (__p)
    operator delete(__p);
  operator delete(v12);
  _Unwind_Resume(a1);
}

void sub_2391BAC48(uint64_t a1, char **a2, _QWORD *a3)
{
  _OWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  _OWORD *v11;
  _OWORD *v12;
  uint64_t v13;
  unsigned __int8 *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  char *v18;
  int v19;
  unint64_t v20;
  int v21;
  uint64_t v22;
  unsigned int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  int v41;
  int v42;
  int v43;
  unint64_t v44;
  int v45;
  unint64_t v46;
  int v47;
  int v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  void *__p;
  void *v53;
  uint64_t v54;
  unsigned int v55;
  uint64_t v56[3];
  unsigned __int8 *v57;
  uint64_t v58;
  uint64_t v59;

  v6 = operator new(0x20uLL);
  v56[1] = (uint64_t)(v6 + 2);
  v56[2] = (uint64_t)(v6 + 2);
  *v6 = xmmword_2391CC1CC;
  v6[1] = unk_2391CC1DC;
  v56[0] = (uint64_t)v6;
  v55 = 0;
  __p = 0;
  v53 = 0;
  v54 = 0;
  sub_2391BA744(a2, &v55, (unint64_t *)&__p);
  v49 = a1;
  v50 = a3;
  v7 = v55;
  if (v55)
  {
    v8 = 0;
    v51 = v55;
    do
    {
      v57 = 0;
      v58 = 0;
      v59 = 0;
      sub_2391BB720(&v57, (char *)__p + 64 * v8, (uint64_t)__p + 64 * v8 + 64);
      v9 = v57;
      v10 = v58;
      v11 = operator new(0x100uLL);
      v11[12] = xmmword_2391CC18C;
      v11[13] = unk_2391CC19C;
      v11[14] = xmmword_2391CC1AC;
      v11[15] = unk_2391CC1BC;
      v11[8] = xmmword_2391CC14C;
      v11[9] = unk_2391CC15C;
      v11[10] = xmmword_2391CC16C;
      v11[11] = unk_2391CC17C;
      v11[4] = xmmword_2391CC10C;
      v11[5] = unk_2391CC11C;
      v11[6] = xmmword_2391CC12C;
      v11[7] = unk_2391CC13C;
      *v11 = xmmword_2391CC0CC;
      v11[1] = unk_2391CC0DC;
      v11[2] = xmmword_2391CC0EC;
      v11[3] = unk_2391CC0FC;
      v12 = operator new(0x140uLL);
      v13 = 0;
      v12[18] = 0u;
      v12[19] = 0u;
      v12[16] = 0u;
      v12[17] = 0u;
      v12[14] = 0u;
      v12[15] = 0u;
      v12[12] = 0u;
      v12[13] = 0u;
      v12[10] = 0u;
      v12[11] = 0u;
      v12[8] = 0u;
      v12[9] = 0u;
      v12[6] = 0u;
      v12[7] = 0u;
      v12[4] = 0u;
      v12[5] = 0u;
      v12[2] = 0u;
      v12[3] = 0u;
      v14 = v9;
      *v12 = 0u;
      v12[1] = 0u;
      while (4 * v13 + 4 <= (unint64_t)(v10 - (_QWORD)v9))
      {
        v15 = 0;
        v16 = 0;
        do
          v16 = v14[v15++] | (v16 << 8);
        while (v15 != 4);
        *((_DWORD *)v12 + v13++) = v16;
        v14 += 4;
        if (v13 == 16)
        {
          v17 = 0;
          v18 = (char *)v12 + 36;
          v19 = *(_DWORD *)v12;
          do
          {
            HIDWORD(v20) = *(_DWORD *)&v18[v17 + 20];
            LODWORD(v20) = HIDWORD(v20);
            v21 = (v20 >> 17) ^ __ROR4__(HIDWORD(v20), 19) ^ (HIDWORD(v20) >> 10);
            HIDWORD(v20) = *(_DWORD *)&v18[v17 - 32];
            LODWORD(v20) = HIDWORD(v20);
            *(_DWORD *)&v18[v17 + 28] = *(_DWORD *)&v18[v17]
                                      + v19
                                      + v21
                                      + ((v20 >> 7) ^ __ROR4__(HIDWORD(v20), 18) ^ (HIDWORD(v20) >> 3));
            v17 += 4;
            v19 = HIDWORD(v20);
          }
          while (v17 != 192);
          v22 = 0;
          v23 = *((_DWORD *)v6 + 1);
          v24 = *((_DWORD *)v6 + 4);
          v25 = *((_DWORD *)v6 + 5);
          v26 = *((_DWORD *)v6 + 6);
          v27 = *((_DWORD *)v6 + 7);
          v28 = v27;
          v29 = v26;
          v30 = v25;
          v31 = v24;
          v33 = *((_DWORD *)v6 + 2);
          v32 = *((_DWORD *)v6 + 3);
          v34 = v32;
          v35 = v33;
          v36 = v23;
          v37 = *(_DWORD *)v6;
          do
          {
            v38 = v37;
            v39 = v36;
            v40 = v35;
            v41 = v31;
            v42 = v30;
            v43 = v29;
            HIDWORD(v44) = v31;
            LODWORD(v44) = v31;
            v45 = (v44 >> 6) ^ __ROR4__(v31, 11);
            v46 = __PAIR64__(v37, __ROR4__(v31, 25));
            v47 = (v31 & v30) + v28 + (v29 & ~v31) + *(_DWORD *)((char *)v11 + v22) + (v45 ^ v46);
            LODWORD(v46) = v37;
            v48 = v47 + *(_DWORD *)((char *)v12 + v22);
            v31 = v48 + v34;
            v37 = ((v46 >> 2) ^ __ROR4__(v37, 13) ^ __ROR4__(v37, 22)) + ((v39 ^ v40) & v37 ^ v39 & v40) + v48;
            v22 += 4;
            v28 = v29;
            v29 = v30;
            v30 = v41;
            v34 = v40;
            v35 = v36;
            v36 = v38;
          }
          while (v22 != 256);
          *(_DWORD *)v6 += v37;
          *((_DWORD *)v6 + 1) = v38 + v23;
          *((_DWORD *)v6 + 2) = v39 + v33;
          *((_DWORD *)v6 + 3) = v40 + v32;
          *((_DWORD *)v6 + 4) = v31 + v24;
          *((_DWORD *)v6 + 5) = v41 + v25;
          *((_DWORD *)v6 + 6) = v42 + v26;
          *((_DWORD *)v6 + 7) = v43 + v27;
          v7 = v51;
          break;
        }
      }
      operator delete(v12);
      operator delete(v11);
      if (v9)
        operator delete(v9);
      ++v8;
    }
    while (v8 != v7);
  }
  sub_2391BA824(v56, (_QWORD *)v49);
  if (v50 != (_QWORD *)v49)
    sub_239107FF0(v50, *(char **)v49, *(char **)(v49 + 8), *(_QWORD *)(v49 + 8) - *(_QWORD *)v49);
  if (__p)
  {
    v53 = __p;
    operator delete(__p);
  }
  operator delete(v6);
}

void sub_2391BAF94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  void *v14;

  if (__p)
    operator delete(__p);
  operator delete(v14);
  _Unwind_Resume(a1);
}

uint64_t sub_2391BAFE0(void **__src, char **a2, void **a3)
{
  char *v5;
  unint64_t v6;
  int v7;
  char *v8;
  size_t v9;
  uint64_t v11;
  uint64_t i;
  uint64_t j;
  void *v15;
  char *v16;
  void *v17;
  void *v18;
  void *__p;
  void *v20;
  uint64_t v21;
  unsigned __int8 v22;
  void *v23;
  char *v24;
  void *v25;
  void *__dst;
  void *v27;
  void *v28;
  char v29;
  char *v30;
  char *v31;
  uint64_t v32;

  v5 = (char *)__src;
  v30 = 0;
  v31 = 0;
  v32 = 0;
  v6 = *((unsigned __int8 *)__src + 23);
  if ((v6 & 0x80) != 0)
  {
    v6 = (unint64_t)__src[1];
    if (v6 - 1 < 0x100)
    {
      if (v6 <= 0x40)
      {
        v5 = (char *)*__src;
        goto LABEL_19;
      }
LABEL_7:
      sub_2391015AC(&v27, 0x14uLL);
      v29 = 20;
      v7 = v5[23];
      if (v7 >= 0)
        v8 = v5;
      else
        v8 = *(char **)v5;
      if (v7 >= 0)
        v9 = v5[23];
      else
        v9 = *((_QWORD *)v5 + 1);
      v20 = 0;
      v21 = 0;
      __p = 0;
      sub_2391BB7A0((char *)&__p, v8, &v8[v9], v9);
      sub_2391BA888((uint64_t)&v27, (char **)&__p, &v30);
      if (__p)
      {
        v20 = __p;
        operator delete(__p);
      }
      if (v27)
      {
        v28 = v27;
        operator delete(v27);
      }
      goto LABEL_23;
    }
    return -1;
  }
  if (!*((_BYTE *)__src + 23))
    return -1;
  if (v6 >= 0x41)
    goto LABEL_7;
LABEL_19:
  sub_2391BB810(&v30, v5, &v5[v6], v6);
  v11 = v31 - v30;
  if ((unint64_t)(v31 - v30) > 0x3F)
  {
    if (v11 != 64)
      v31 = v30 + 64;
  }
  else
  {
    sub_239101670((unint64_t *)&v30, 64 - v11);
  }
LABEL_23:
  sub_2391015AC(&v25, 0x40uLL);
  for (i = 0; i != 64; ++i)
    *((_BYTE *)v25 + i) = v30[i] ^ 0x36;
  sub_2391B3610((uint64_t)&v25, (char *)__dst, *a2, a2[1], a2[1] - *a2);
  sub_2391015AC(&v27, 0x14uLL);
  v29 = 20;
  sub_2391015AC(&v23, 0x14uLL);
  sub_2391BA888((uint64_t)&v27, (char **)&v25, &v23);
  sub_2391015AC(&__p, 0x14uLL);
  v22 = 20;
  sub_2391015AC(&v17, 0x40uLL);
  for (j = 0; j != 64; ++j)
    *((_BYTE *)v17 + j) = v30[j] ^ 0x5C;
  sub_2391BB938((uint64_t)&v17, (char *)v18, (char *)v23, v24, v24 - (_BYTE *)v23);
  sub_2391015AC(&v15, v22);
  sub_2391BA888((uint64_t)&__p, (char **)&v17, &v15);
  if (&v15 != a3)
    sub_239107FF0(a3, (char *)v15, v16, v16 - (_BYTE *)v15);
  if (v15)
  {
    v16 = (char *)v15;
    operator delete(v15);
  }
  if (v17)
  {
    v18 = v17;
    operator delete(v17);
  }
  if (__p)
  {
    v20 = __p;
    operator delete(__p);
  }
  if (v23)
  {
    v24 = (char *)v23;
    operator delete(v23);
  }
  if (v27)
  {
    v28 = v27;
    operator delete(v27);
  }
  if (v25)
  {
    __dst = v25;
    operator delete(v25);
  }
  if (v30)
  {
    v31 = v30;
    operator delete(v30);
  }
  return 0;
}

void sub_2391BB294(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t v24;
  void *v26;
  void *v27;

  if (__p)
    operator delete(__p);
  v26 = *(void **)(v24 - 88);
  if (v26)
  {
    *(_QWORD *)(v24 - 80) = v26;
    operator delete(v26);
  }
  v27 = *(void **)(v24 - 56);
  if (v27)
  {
    *(_QWORD *)(v24 - 48) = v27;
    operator delete(v27);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_2391BB380(void **__src, char **a2, void **a3)
{
  char *v5;
  unint64_t v6;
  int v7;
  char *v8;
  size_t v9;
  uint64_t v11;
  uint64_t i;
  uint64_t j;
  void *v15;
  char *v16;
  void *v17;
  void *v18;
  void *__p;
  void *v20;
  uint64_t v21;
  unsigned __int8 v22;
  void *v23;
  char *v24;
  void *v25;
  void *__dst;
  void *v27;
  void *v28;
  char v29;
  char *v30;
  char *v31;
  uint64_t v32;

  v5 = (char *)__src;
  v30 = 0;
  v31 = 0;
  v32 = 0;
  v6 = *((unsigned __int8 *)__src + 23);
  if ((v6 & 0x80) != 0)
  {
    v6 = (unint64_t)__src[1];
    if (v6 - 1 < 0x100)
    {
      if (v6 <= 0x40)
      {
        v5 = (char *)*__src;
        goto LABEL_19;
      }
LABEL_7:
      sub_2391015AC(&v27, 0x20uLL);
      v29 = 32;
      v7 = v5[23];
      if (v7 >= 0)
        v8 = v5;
      else
        v8 = *(char **)v5;
      if (v7 >= 0)
        v9 = v5[23];
      else
        v9 = *((_QWORD *)v5 + 1);
      v20 = 0;
      v21 = 0;
      __p = 0;
      sub_2391BB7A0((char *)&__p, v8, &v8[v9], v9);
      sub_2391BAC48((uint64_t)&v27, (char **)&__p, &v30);
      if (__p)
      {
        v20 = __p;
        operator delete(__p);
      }
      if (v27)
      {
        v28 = v27;
        operator delete(v27);
      }
      goto LABEL_23;
    }
    return -1;
  }
  if (!*((_BYTE *)__src + 23))
    return -1;
  if (v6 >= 0x41)
    goto LABEL_7;
LABEL_19:
  sub_2391BB810(&v30, v5, &v5[v6], v6);
  v11 = v31 - v30;
  if ((unint64_t)(v31 - v30) > 0x3F)
  {
    if (v11 != 64)
      v31 = v30 + 64;
  }
  else
  {
    sub_239101670((unint64_t *)&v30, 64 - v11);
  }
LABEL_23:
  sub_2391015AC(&v25, 0x40uLL);
  for (i = 0; i != 64; ++i)
    *((_BYTE *)v25 + i) = v30[i] ^ 0x36;
  sub_2391B3610((uint64_t)&v25, (char *)__dst, *a2, a2[1], a2[1] - *a2);
  sub_2391015AC(&v27, 0x20uLL);
  v29 = 32;
  sub_2391015AC(&v23, 0x20uLL);
  sub_2391BAC48((uint64_t)&v27, (char **)&v25, &v23);
  sub_2391015AC(&__p, 0x20uLL);
  v22 = 32;
  sub_2391015AC(&v17, 0x40uLL);
  for (j = 0; j != 64; ++j)
    *((_BYTE *)v17 + j) = v30[j] ^ 0x5C;
  sub_2391BB938((uint64_t)&v17, (char *)v18, (char *)v23, v24, v24 - (_BYTE *)v23);
  sub_2391015AC(&v15, v22);
  sub_2391BAC48((uint64_t)&__p, (char **)&v17, &v15);
  if (&v15 != a3)
    sub_239107FF0(a3, (char *)v15, v16, v16 - (_BYTE *)v15);
  if (v15)
  {
    v16 = (char *)v15;
    operator delete(v15);
  }
  if (v17)
  {
    v18 = v17;
    operator delete(v17);
  }
  if (__p)
  {
    v20 = __p;
    operator delete(__p);
  }
  if (v23)
  {
    v24 = (char *)v23;
    operator delete(v23);
  }
  if (v27)
  {
    v28 = v27;
    operator delete(v27);
  }
  if (v25)
  {
    __dst = v25;
    operator delete(v25);
  }
  if (v30)
  {
    v31 = v30;
    operator delete(v30);
  }
  return 0;
}

void sub_2391BB634(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t v24;
  void *v26;
  void *v27;

  if (__p)
    operator delete(__p);
  v26 = *(void **)(v24 - 88);
  if (v26)
  {
    *(_QWORD *)(v24 - 80) = v26;
    operator delete(v26);
  }
  v27 = *(void **)(v24 - 56);
  if (v27)
  {
    *(_QWORD *)(v24 - 48) = v27;
    operator delete(v27);
  }
  _Unwind_Resume(exception_object);
}

char *sub_2391BB720(_QWORD *a1, const void *a2, uint64_t a3)
{
  char *result;
  char *v7;
  size_t v8;

  result = (char *)operator new(0x40uLL);
  v7 = result;
  *a1 = result;
  a1[1] = result;
  a1[2] = result + 64;
  v8 = a3 - (_QWORD)a2;
  if (v8)
    result = (char *)memmove(result, a2, v8);
  a1[1] = &v7[v8];
  return result;
}

void sub_2391BB784(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_2391BB7A0(char *result, char *a2, char *a3, size_t __sz)
{
  char *v6;
  _BYTE *v7;
  char v8;

  if (__sz)
  {
    v6 = result;
    result = sub_23910161C(result, __sz);
    v7 = (_BYTE *)*((_QWORD *)v6 + 1);
    while (a2 != a3)
    {
      v8 = *a2++;
      *v7++ = v8;
    }
    *((_QWORD *)v6 + 1) = v7;
  }
  return result;
}

void sub_2391BB7F4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *sub_2391BB810(_QWORD *result, char *__src, char *a3, unint64_t a4)
{
  char *v6;
  _QWORD *v7;
  unint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  size_t v11;
  _BYTE *v12;
  char v13;
  _BYTE *v14;
  char *v15;
  _BYTE *v16;
  char v17;
  size_t v18;

  v6 = __src;
  v7 = result;
  v8 = result[2];
  v9 = (_BYTE *)*result;
  if (v8 - *result >= a4)
  {
    v14 = (_BYTE *)result[1];
    if (v14 - v9 >= a4)
    {
      v18 = a3 - __src;
      if (a3 != __src)
        result = memmove((void *)*result, __src, v18);
      v12 = &v9[v18];
    }
    else
    {
      v15 = &__src[v14 - v9];
      if (v14 != v9)
      {
        result = memmove((void *)*result, __src, v14 - v9);
        v9 = (_BYTE *)v7[1];
      }
      v12 = v9;
      if (v15 != a3)
      {
        v12 = v9;
        v16 = v9;
        do
        {
          v17 = *v15++;
          *v16++ = v17;
          ++v12;
        }
        while (v15 != a3);
      }
    }
  }
  else
  {
    if (v9)
    {
      result[1] = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    v10 = 2 * v8;
    if (2 * v8 <= a4)
      v10 = a4;
    if (v8 >= 0x3FFFFFFFFFFFFFFFLL)
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = sub_23910161C(v7, v11);
    v12 = (_BYTE *)v7[1];
    while (v6 != a3)
    {
      v13 = *v6++;
      *v12++ = v13;
    }
  }
  v7[1] = v12;
  return result;
}

void sub_2391BB938(uint64_t a1, char *__dst, char *__src, char *a4, uint64_t a5)
{
  uint64_t v5;
  char *v6;
  uint64_t v9;
  _BYTE *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  size_t v15;
  void *v16;
  uint64_t v17;
  char *v18;
  int64_t v19;
  _BYTE *v20;
  char *v21;
  char *v22;
  _BYTE *v23;
  char *v24;
  char v25;
  char *v26;
  char *v27;
  char *v28;
  char v29;
  char *v30;
  char *v31;
  char v32;
  char *v33;
  char *v34;

  if (a5 < 1)
    return;
  v5 = a5;
  v6 = __src;
  v10 = *(_BYTE **)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  if (v9 - (uint64_t)v10 < a5)
  {
    v11 = *(char **)a1;
    v12 = (uint64_t)&v10[a5 - *(_QWORD *)a1];
    if (v12 < 0)
      sub_23910165C();
    v13 = (char *)(__dst - v11);
    v14 = v9 - (_QWORD)v11;
    if (2 * v14 > v12)
      v12 = 2 * v14;
    if (v14 >= 0x3FFFFFFFFFFFFFFFLL)
      v15 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v15 = v12;
    if (v15)
      v16 = operator new(v15);
    else
      v16 = 0;
    v26 = &v13[(_QWORD)v16];
    v27 = &v13[(_QWORD)v16 + v5];
    v28 = v26;
    do
    {
      v29 = *v6++;
      *v28++ = v29;
      --v5;
    }
    while (v5);
    v30 = *(char **)a1;
    if (*(char **)a1 != __dst)
    {
      v31 = __dst;
      do
      {
        v32 = *--v31;
        *--v26 = v32;
      }
      while (v31 != v30);
      v10 = *(_BYTE **)(a1 + 8);
    }
    v33 = (char *)v16 + v15;
    if (v10 != __dst)
      memmove(v27, __dst, v10 - __dst);
    v34 = *(char **)a1;
    *(_QWORD *)a1 = v26;
    *(_QWORD *)(a1 + 8) = &v27[v10 - __dst];
    *(_QWORD *)(a1 + 16) = v33;
    if (v34)
      operator delete(v34);
    return;
  }
  v17 = v10 - __dst;
  if (v10 - __dst >= a5)
  {
    v18 = &__src[a5];
    v20 = *(_BYTE **)(a1 + 8);
LABEL_17:
    v21 = &__dst[v5];
    v22 = &v20[-v5];
    v23 = v20;
    if (&v20[-v5] < v10)
    {
      v24 = (char *)(&v10[v5] - v20);
      v23 = v20;
      do
      {
        v25 = *v22++;
        *v23++ = v25;
        --v24;
      }
      while (v24);
    }
    *(_QWORD *)(a1 + 8) = v23;
    if (v20 != v21)
      memmove(&__dst[v5], __dst, v20 - v21);
    if (v18 != v6)
      memmove(__dst, v6, v18 - v6);
    return;
  }
  v18 = &__src[v17];
  v19 = a4 - &__src[v17];
  if (a4 != &__src[v17])
    memmove(*(void **)(a1 + 8), &__src[v17], a4 - &__src[v17]);
  v20 = &v10[v19];
  *(_QWORD *)(a1 + 8) = &v10[v19];
  if (v17 >= 1)
    goto LABEL_17;
}

uint64_t sub_2391BBB24()
{
  uint64_t result;
  NSObject *v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  if (qword_2542CF5B8 != -1)
    dispatch_once(&qword_2542CF5B8, &unk_250A73F10);
  result = qword_2542CF5B0;
  if (!qword_2542CF5B0)
  {
    v1 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      v2 = 136315138;
      v3 = "GetInstance";
      _os_log_error_impl(&dword_2390FD000, v1, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v2, 0xCu);
    }
    __assert_rtn("GetInstance", "LcsUtils.cpp", 63, "false && \"Memory allocation failure\"");
  }
  return result;
}

void *sub_2391BBC18()
{
  void *result;

  result = operator new(1uLL, MEMORY[0x24BEDB6B8]);
  qword_2542CF5B0 = (uint64_t)result;
  return result;
}

uint64_t sub_2391BBC40(uint64_t a1, int a2)
{
  uint64_t v2;
  NSObject *v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = (a2 + 0xFFFF);
  v3 = qword_2542CF618;
  if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_impl(&dword_2390FD000, v3, OS_LOG_TYPE_INFO, "GenerateReqIdForSessionTimer  New sessionTimerrquestID[%d] is generated", (uint8_t *)v5, 8u);
  }
  return v2;
}

uint64_t sub_2391BBCE4(uint64_t *a1)
{
  uint64_t v2;

  v2 = *a1;
  if (*(_BYTE *)(v2 + 752))
    sub_2391AE50C(v2, 9);
  if (!*(_BYTE *)(v2 + 803))
  {
    free(*(void **)(v2 + 760));
    v2 = *a1;
  }
  free((void *)v2);
  *a1 = 0;
  return 0;
}

uint64_t sub_2391BBD34(uint64_t *a1, uint64_t *a2)
{
  _WORD *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (!a2)
    return 6;
  v4 = malloc_type_calloc(1uLL, 0x3C0uLL, 0x10F0040998F192CuLL);
  bzero(v4 + 2, 0x3BCuLL);
  result = 0;
  *a1 = (uint64_t)v4;
  *(_DWORD *)v4 = 0;
  v4[361] = -1;
  *((_QWORD *)v4 + 91) = 0;
  *(_QWORD *)(*a1 + 736) = 0;
  *(_QWORD *)(*a1 + 744) = 0;
  v6 = *a1;
  *(_BYTE *)(v6 + 752) = 0;
  *(_QWORD *)(v6 + 824) = 2080;
  *(_QWORD *)(v6 + 832) = 0;
  *(_QWORD *)(v6 + 880) = 0;
  *(_QWORD *)(*a1 + 944) = 0;
  v7 = *a1;
  *(_BYTE *)(v7 + 888) = 0;
  *(_QWORD *)(v7 + 896) = 0;
  v8 = *a1;
  *(_WORD *)(v8 + 906) = 0;
  *(_BYTE *)(v8 + 904) = 0;
  *(_BYTE *)(v8 + 928) = 0;
  *(_QWORD *)(v8 + 936) = 0;
  *(_QWORD *)(*a1 + 936) = 0;
  v9 = *a1;
  v10 = *a1 + 736;
  *(_OWORD *)(v10 + 56) = xmmword_2391CC210;
  *(_OWORD *)(v10 + 40) = unk_2391CC200;
  *(_OWORD *)(v10 + 24) = xmmword_2391CC1F0;
  v11 = *a2;
  *(_QWORD *)(v9 + 768) = *a2 + a2[1];
  *(_QWORD *)(v10 + 24) = v11;
  *(_QWORD *)(v10 + 56) = v11;
  *(_QWORD *)(v10 + 40) = v11;
  *(_QWORD *)(v9 + 784) = v11 + a2[2];
  *(_BYTE *)(v9 + 803) = 1;
  return result;
}

char *sub_2391BBE54(uint64_t a1, uint64_t a2)
{
  size_t v3;
  char *v4;
  void *v5;

  if (*(_BYTE *)(a1 + 803))
    sub_2391AE50C(a1, 7);
  v3 = *(_QWORD *)(a1 + 768) - *(_QWORD *)(a1 + 760) + a2;
  v4 = (char *)malloc_type_calloc(1uLL, v3, 0x30938752uLL);
  bzero(v4, v3);
  if (!v4)
    sub_2391AE50C(a1, 1);
  memcpy(v4, *(const void **)(a1 + 760), *(_QWORD *)(a1 + 768) - *(_QWORD *)(a1 + 760));
  v5 = *(void **)(a1 + 760);
  *(_QWORD *)(a1 + 776) = &v4[*(_QWORD *)(a1 + 776) - (_QWORD)v5];
  *(_QWORD *)(a1 + 784) = &v4[*(_QWORD *)(a1 + 784) - (_QWORD)v5];
  *(_QWORD *)(a1 + 792) = &v4[*(_QWORD *)(a1 + 792) - (_QWORD)v5];
  free(v5);
  *(_QWORD *)(a1 + 760) = v4;
  *(_QWORD *)(a1 + 768) = &v4[v3];
  return v4;
}

uint64_t sub_2391BBF28(uint64_t a1)
{
  uint64_t v1;

  if (*(_BYTE *)(a1 + 752))
    sub_2391AE50C(a1, 8);
  v1 = *(_QWORD *)(a1 + 760);
  *(_QWORD *)(a1 + 776) = v1;
  *(_QWORD *)(a1 + 784) = v1;
  *(_QWORD *)(a1 + 792) = v1;
  *(_WORD *)(a1 + 800) = 1799;
  *(_BYTE *)(a1 + 802) = 7;
  *(_DWORD *)a1 = 0;
  *(_BYTE *)(a1 + 752) = 2;
  return 0;
}

uint64_t sub_2391BBF78(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 752))
    sub_2391AE50C(a1, 8);
  *(_QWORD *)(a1 + 792) = *(_QWORD *)(a1 + 776);
  *(_BYTE *)(a1 + 802) = *(_BYTE *)(a1 + 800);
  *(_DWORD *)a1 = 0;
  *(_BYTE *)(a1 + 752) = 1;
  return 0;
}

uint64_t sub_2391BBFB8(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD);

  if (*(_BYTE *)(a1 + 752) != 1)
    sub_2391AE50C(a1, 11);
  if (!a2)
    return 0;
  if (*(_BYTE *)(a1 + 802) != 7)
    sub_2391AE50C(a1, 15);
  result = *(_QWORD *)(a1 + 792);
  v5 = *(_QWORD *)(a1 + 784) - result;
  if (a2 > v5)
  {
    v6 = *(void (**)(uint64_t, _QWORD))(a1 + 736);
    if (v6)
    {
      v6(a1, (a2 - v5));
      result = *(_QWORD *)(a1 + 792);
      v5 = *(_QWORD *)(a1 + 784) - result;
    }
    if (*(_BYTE *)(a1 + 801) != 7)
      ++v5;
    if (v5 < a2)
      sub_2391AE50C(a1, 12);
  }
  *(_QWORD *)(a1 + 792) = result + a2;
  return result;
}

uint64_t sub_2391BC088(unsigned int *a1, void *a2)
{
  bzero(a2, 0xA28uLL);
  return sub_23919C8E0(a1, byte_250ABD0C8, (uint64_t)a2);
}

uint64_t sub_2391BC0C4(unsigned int *a1, _DWORD *a2)
{
  *a2 = 0;
  return sub_23919C8E0(a1, byte_250AB55A8, (uint64_t)a2);
}

uint64_t sub_2391BC0D8(unsigned int *a1, _QWORD *a2)
{
  *a2 = 0;
  a2[1] = 0;
  return sub_23919C8E0(a1, byte_250AB4EF8, (uint64_t)a2);
}

uint64_t sub_2391BC0EC(unsigned int *a1, __int16 *a2)
{
  return sub_23919A824(a1, byte_250ABD0C8, a2);
}

uint64_t sub_2391BC0FC(unsigned int a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, int *a6, uint64_t a7, _QWORD **a8, uint64_t a9)
{
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  char *v19;
  int v20;
  int v21;
  uint64_t (*v22)(uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24[3];

  if (a8)
  {
    v14 = *a8;
    if (*a8)
    {
      if (!*v14 || !v14[1] || !v14[2])
        return 15;
    }
  }
  v23 = 0;
  v24[0] = a3;
  v24[1] = a4;
  v24[2] = a4;
  sub_2391BBD34(&v23, v24);
  v15 = v23;
  *(_QWORD *)(v23 + 944) = a8;
  v24[0] = v15;
  sub_2391BBF78(v15);
  if (a1 == 13)
    goto LABEL_9;
  *(_QWORD *)(v15 + 824) = 2064;
  if (a1 > 0x1D)
    goto LABEL_21;
  if (((1 << a1) & 0x24000023) == 0)
  {
    if (a1 == 4)
    {
      if (a2 > 7)
        goto LABEL_9;
      if (byte_25691E328)
      {
        v18 = 0;
        v19 = byte_250A73F30;
        v16 = 15;
        while (1)
        {
          v20 = *v19;
          v19 += 16;
          if (v20 == a2)
            break;
          if (byte_25691E328 == ++v18)
            goto LABEL_10;
        }
      }
      else
      {
        LODWORD(v18) = 0;
      }
      if ((_DWORD)v18 == byte_25691E328)
        goto LABEL_9;
      v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))&byte_250A73F30[16 * v18 + 8];
      if (!v22)
        goto LABEL_9;
      v16 = v22(v15, a5, a9);
      if (!a6)
        goto LABEL_10;
      v21 = *(unsigned __int8 *)(v15 + 800)
          - *(unsigned __int8 *)(v15 + 802)
          + 8 * (*(_DWORD *)(v15 + 792) - *(_DWORD *)(v15 + 776));
LABEL_23:
      *a6 = v21;
      goto LABEL_10;
    }
LABEL_21:
    v16 = 15;
    if (!a6)
      goto LABEL_10;
    v21 = 0;
    goto LABEL_23;
  }
LABEL_9:
  v16 = 15;
LABEL_10:
  if (*(_BYTE *)(v15 + 752) != 1)
    sub_2391AE50C(v15, 10);
  *(_BYTE *)(v15 + 752) = 0;
  sub_2391BBCE4(v24);
  return v16;
}

uint64_t sub_2391BC2A8(int a1, unsigned int a2, uint64_t *a3, _DWORD *a4, _DWORD *a5, __int16 *a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v22;
  void *v23;
  int64x2_t v24;

  if (!a6)
    return 15;
  *a3 = 0;
  if (a5)
    *a5 = 0;
  if (a4)
    *a4 = 0;
  if (a1 != 4)
    return 15;
  v22 = 0;
  v23 = &unk_25691E430;
  v24 = vdupq_n_s64(0x1000uLL);
  sub_2391BBD34(&v22, (uint64_t *)&v23);
  v11 = v22;
  *(_QWORD *)(v22 + 944) = 0;
  v23 = (void *)v11;
  sub_2391BBF28(v11);
  if (a2 >= 8)
  {
    if (*(_BYTE *)(v11 + 752) == 2)
    {
      v14 = (_BYTE *)(v11 + 752);
      v13 = 15;
      goto LABEL_31;
    }
    goto LABEL_34;
  }
  v12 = byte_25691E329;
  if (!byte_25691E329)
  {
    v13 = 15;
    goto LABEL_18;
  }
  do
  {
    if (a2 == 7)
    {
      v13 = sub_2391BC0EC((unsigned int *)v11, a6);
      if (v11)
        goto LABEL_18;
      return v13;
    }
    --v12;
  }
  while (v12);
  v13 = 15;
  if (!v11)
    return v13;
LABEL_18:
  if (*(_BYTE *)(v11 + 752) != 2)
    goto LABEL_34;
  v14 = (_BYTE *)(v11 + 752);
  *(_BYTE *)(v11 + 752) = 0;
  if (!a5 || (_DWORD)v13)
    goto LABEL_32;
  sub_2391BBF78(v11);
  v15 = *(_QWORD *)(v11 + 784);
  v16 = *(_QWORD *)(v11 + 776);
  if (a4)
  {
    v17 = v15 - v16;
    v18 = *(unsigned __int8 *)(v11 + 800);
    v19 = *(unsigned __int8 *)(v11 + 801);
    *a4 = v18 - v19 + 8 * v17;
  }
  else
  {
    v18 = *(unsigned __int8 *)(v11 + 800);
    v19 = *(unsigned __int8 *)(v11 + 801);
    v17 = v15 - v16;
  }
  if (v18 > v19)
    ++v17;
  *a5 = v17;
  v20 = sub_2391BBFB8(v11, v17);
  if (*a5 && v20)
    *a3 = v20;
  if (*v14 != 1)
LABEL_34:
    sub_2391AE50C(v11, 10);
  v13 = 0;
LABEL_31:
  *v14 = 0;
LABEL_32:
  sub_2391BBCE4((uint64_t *)&v23);
  return v13;
}

uint64_t sub_2391BC46C()
{
  uint64_t result;
  NSObject *v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  if (qword_2542CF5C8 != -1)
    dispatch_once(&qword_2542CF5C8, &unk_250A73F80);
  result = qword_2542CF5C0;
  if (!qword_2542CF5C0)
  {
    v1 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      v2 = 136315138;
      v3 = "GetInstance";
      _os_log_error_impl(&dword_2390FD000, v1, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v2, 0xCu);
    }
    __assert_rtn("GetInstance", "SimUtils.cpp", 50, "false && \"Memory allocation failure\"");
  }
  return result;
}

_QWORD *sub_2391BC560()
{
  _QWORD *result;

  result = operator new(0x18uLL, MEMORY[0x24BEDB6B8]);
  if (result)
  {
    *(_DWORD *)result = 0;
    result[1] = 0;
    result[2] = 0;
  }
  qword_2542CF5C0 = (uint64_t)result;
  return result;
}

char *sub_2391BC594(uint64_t a1, int a2)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  char *result;
  uint64_t v11;
  uint64_t v12;
  __int16 v13;
  __int16 v14;

  v4 = *(_QWORD *)(a1 + 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)(a1 + 16);
    do
    {
      ++v5;
      v6 = *(_QWORD *)(v6 + 8);
    }
    while (v6);
    if (v5 >= 3)
    {
      v7 = qword_2542CF618;
      if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
      {
        v14 = 0;
        v8 = "No slots available for storing SimId";
        v9 = (uint8_t *)&v14;
LABEL_17:
        _os_log_error_impl(&dword_2390FD000, v7, OS_LOG_TYPE_ERROR, v8, v9, 2u);
        return 0;
      }
      return 0;
    }
  }
  result = (char *)operator new(0x100uLL, MEMORY[0x24BEDB6B8]);
  if (!result)
  {
    v7 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      v13 = 0;
      v8 = "NULL Data";
      v9 = (uint8_t *)&v13;
      goto LABEL_17;
    }
    return 0;
  }
  *((_OWORD *)result + 4) = 0u;
  *((_OWORD *)result + 5) = 0u;
  *((_OWORD *)result + 12) = 0u;
  *((_OWORD *)result + 13) = 0u;
  *((_OWORD *)result + 10) = 0u;
  *((_OWORD *)result + 11) = 0u;
  *((_OWORD *)result + 8) = 0u;
  *((_OWORD *)result + 9) = 0u;
  *((_OWORD *)result + 6) = 0u;
  *((_OWORD *)result + 7) = 0u;
  *((_OWORD *)result + 2) = 0u;
  *((_OWORD *)result + 3) = 0u;
  *(_OWORD *)result = 0u;
  *((_OWORD *)result + 1) = 0u;
  *((_WORD *)result + 24) = 7275;
  *((_DWORD *)result + 16) = 0;
  *((_DWORD *)result + 18) = -1;
  *(_QWORD *)(result + 97) = 0;
  *(_QWORD *)(result + 92) = 0;
  *(_QWORD *)(result + 84) = 0;
  *(_QWORD *)(result + 76) = 0;
  *((_DWORD *)result + 29) = 0;
  *(_QWORD *)(result + 124) = -1;
  *((_WORD *)result + 72) = 0;
  *((_WORD *)result + 74) = -1;
  *((_QWORD *)result + 20) = 0;
  *((_QWORD *)result + 21) = 0;
  *(_QWORD *)(result + 174) = 0;
  *((_QWORD *)result + 19) = 0;
  *((_QWORD *)result + 23) = 0;
  *((_QWORD *)result + 24) = 0;
  *((_QWORD *)result + 25) = 0;
  result[208] = 1;
  *((_QWORD *)result + 28) = 0;
  *((_QWORD *)result + 29) = 0;
  *((_WORD *)result + 112) = -1;
  *((_QWORD *)result + 30) = 0;
  *((_QWORD *)result + 31) = 0;
  v11 = v4;
  *(_DWORD *)result = a2;
  while (v11)
  {
    v12 = v11;
    v11 = *(_QWORD *)(v11 + 8);
    if (!v11)
    {
      *(_QWORD *)(v12 + 8) = result;
      *((_QWORD *)result + 1) = 0;
      return result;
    }
  }
  *((_QWORD *)result + 1) = v4;
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_2391BC72C(uint64_t a1, int a2, uint64_t a3)
{
  char *v4;
  __int16 v5;

  v4 = *(char **)(a1 + 16);
  if (v4)
  {
    while (*(_DWORD *)v4 != a2)
    {
      v4 = (char *)*((_QWORD *)v4 + 1);
      if (!v4)
        goto LABEL_4;
    }
  }
  else
  {
LABEL_4:
    v4 = sub_2391BC594(a1, a2);
    if (!v4)
      return -1;
  }
  v4[16] = *(_BYTE *)a3;
  std::string::operator=((std::string *)v4 + 1, (const std::string *)(a3 + 8));
  v5 = 0;
  *((_WORD *)v4 + 24) = *(_WORD *)(a3 + 32);
  return v5;
}

uint64_t sub_2391BC79C(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  std::string::size_type size;
  NSObject *v8;
  _DWORD v10[2];
  std::string __p;
  __int16 v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_15:
    v8 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      v10[0] = 67109120;
      v10[1] = 515;
      _os_log_error_impl(&dword_2390FD000, v8, OS_LOG_TYPE_ERROR, "#gpsd #supl Error code %d", (uint8_t *)v10, 8u);
    }
    return -1;
  }
  while (*(_DWORD *)v4 != a4)
  {
    v4 = *(_QWORD *)(v4 + 8);
    if (!v4)
      goto LABEL_15;
  }
  memset(&__p, 0, sizeof(__p));
  v12 = 7275;
  LOBYTE(v10[0]) = *(_BYTE *)(v4 + 16);
  std::string::operator=(&__p, (const std::string *)(v4 + 24));
  v12 = *(_WORD *)(v4 + 48);
  if (!LOBYTE(v10[0])
    || ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
      ? (size = HIBYTE(__p.__r_.__value_.__r.__words[2]))
      : (size = __p.__r_.__value_.__l.__size_),
        !size))
  {
    if ((*((_BYTE *)&__p.__r_.__value_.__s + 23) & 0x80) != 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    goto LABEL_15;
  }
  *(_BYTE *)a2 = v10[0];
  std::string::operator=((std::string *)(a2 + 8), &__p);
  *(_WORD *)(a2 + 32) = v12;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return 0;
}

void sub_2391BC900(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_2391BC91C(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 16);
  if (v4)
  {
    while (*(_DWORD *)v4 != a2)
    {
      v4 = *(_QWORD *)(v4 + 8);
      if (!v4)
        goto LABEL_4;
    }
  }
  else
  {
LABEL_4:
    result = (uint64_t)sub_2391BC594(a1, a2);
    v4 = result;
    if (!result)
      return result;
  }
  sub_2391A8EE0(v4 + 56, a3);
  result = mach_continuous_time();
  *(_DWORD *)(v4 + 216) = 0;
  return result;
}

BOOL sub_2391BC974(uint64_t a1, int a2)
{
  uint64_t v2;
  _WORD *v3;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return 0;
  while (*(_DWORD *)v2 != a2)
  {
    v2 = *(_QWORD *)(v2 + 8);
    if (!v2)
      return 0;
  }
  return *(_BYTE *)(v2 + 56) == 4 && (v3 = *(_WORD **)(v2 + 200)) != 0 && *v3 == 3;
}

uint64_t sub_2391BC9C4(uint64_t a1)
{
  CFAbsoluteTime Current;
  unint64_t v3;
  unsigned int v4;
  uint64_t v5;
  _BOOL4 v6;
  uint64_t result;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  _BOOL4 v12;
  _DWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(a1 + 56))
  {
    v11 = qword_2542CF628;
    v12 = os_log_type_enabled((os_log_t)qword_2542CF628, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v12)
      return result;
    LOWORD(v13[0]) = 0;
    v8 = "CellInfo";
    v9 = v11;
    v10 = 2;
    goto LABEL_7;
  }
  Current = CFAbsoluteTimeGetCurrent();
  LODWORD(v3) = *(_DWORD *)(a1 + 216);
  v4 = -((double)v3 - Current * 1000.0);
  if (v4 >= 0x1389)
  {
    v5 = qword_2542CF628;
    v6 = os_log_type_enabled((os_log_t)qword_2542CF628, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v6)
      return result;
    v13[0] = 67109120;
    v13[1] = v4;
    v8 = "time diff is greater than 5000 millisecs value,%d";
    v9 = v5;
    v10 = 8;
LABEL_7:
    _os_log_impl(&dword_2390FD000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)v13, v10);
    return 0;
  }
  return 1;
}

char *sub_2391BCAEC(char *result, int a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD *v5;

  v4 = *((_QWORD *)result + 2);
  if (v4)
  {
    while (*(_DWORD *)v4 != a2)
    {
      v4 = *(_QWORD *)(v4 + 8);
      if (!v4)
        goto LABEL_4;
    }
    *(_WORD *)(v4 + 224) = *(_WORD *)a3;
    if (v4 + 224 != a3)
    {
      v5 = (_QWORD *)(v4 + 232);
      return (char *)sub_239107FF0(v5, *(char **)(a3 + 8), *(char **)(a3 + 16), *(_QWORD *)(a3 + 16) - *(_QWORD *)(a3 + 8));
    }
  }
  else
  {
LABEL_4:
    result = sub_2391BC594((uint64_t)result, a2);
    if (result)
    {
      *((_WORD *)result + 112) = *(_WORD *)a3;
      if (result + 224 != (char *)a3)
      {
        v5 = result + 232;
        return (char *)sub_239107FF0(v5, *(char **)(a3 + 8), *(char **)(a3 + 16), *(_QWORD *)(a3 + 16) - *(_QWORD *)(a3 + 8));
      }
    }
  }
  return result;
}

_QWORD *sub_2391BCB74(_QWORD *result, int a2, uint64_t a3)
{
  uint64_t v3;

  v3 = result[2];
  if (v3)
  {
    while (*(_DWORD *)v3 != a2)
    {
      v3 = *(_QWORD *)(v3 + 8);
      if (!v3)
        return result;
    }
    *(_WORD *)a3 = *(_WORD *)(v3 + 224);
    if (v3 + 224 != a3)
      return sub_239107FF0((_QWORD *)(a3 + 8), *(char **)(v3 + 232), *(char **)(v3 + 240), *(_QWORD *)(v3 + 240) - *(_QWORD *)(v3 + 232));
  }
  return result;
}

void sub_2391BCBBC(uint64_t a1, char *a2)
{
  std::string *p_str;
  std::string::size_type size;
  char *v5;
  int v6;
  std::string v7;
  std::string __str;
  std::string __p;
  char v10;

  sub_2391011A4(&__p, "NULLFileName");
  if (a2)
  {
    sub_2391011A4(&__str, a2);
    p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_str = &__str;
    size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      size = __str.__r_.__value_.__l.__size_;
    v5 = (char *)&p_str[-1].__r_.__value_.__r.__words[2] + 7;
    do
    {
      if (!size)
        goto LABEL_14;
      v6 = v5[size--];
    }
    while (v6 != 92 && v6 != 47);
    if (size == -1)
    {
LABEL_14:
      std::string::operator=(&__p, &__str);
      goto LABEL_15;
    }
    std::string::basic_string(&v7, &__str, size + 1, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v10);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    __p = v7;
LABEL_15:
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__str.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_2391BCCAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0)
    operator delete(__p);
  if (a23 < 0)
    operator delete(a18);
  _Unwind_Resume(exception_object);
}

uint64_t sub_2391BCCE4(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  BOOL v5;

  v2 = *(_QWORD *)(result + 16);
  if (v2)
    v3 = v2 == a2;
  else
    v3 = 1;
  if (v3)
  {
    if (v2)
    {
      *(_QWORD *)(result + 16) = *(_QWORD *)(v2 + 8);
      *(_QWORD *)(v2 + 8) = 0;
    }
  }
  else
  {
    do
    {
      v4 = v2;
      v2 = *(_QWORD *)(v2 + 8);
      if (v2)
        v5 = v2 == a2;
      else
        v5 = 1;
    }
    while (!v5);
    if (v2)
      *(_QWORD *)(v4 + 8) = *(_QWORD *)(v2 + 8);
  }
  if (a2)
    *(_QWORD *)(a2 + 8) = 0;
  return result;
}

void sub_2391BCD34(uint64_t a1)
{
  int v2;
  void *v3;
  unsigned int v4;
  NSObject *v5;
  uint8_t v6[16];

  v2 = *(_DWORD *)(a1 + 8) - *(_DWORD *)a1;
  v3 = sub_2391AC318("SuplLppExecutePosReq", 28, 1, v2);
  v4 = *(_DWORD *)(a1 + 8) - *(_QWORD *)a1;
  sub_2391AC49C((uint64_t)"SuplLppExecutePosReq", 30, v3, v4, *(void **)a1, v4);
  v5 = qword_2542CF618;
  if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_debug_impl(&dword_2390FD000, v5, OS_LOG_TYPE_DEBUG, "#posp,#lpp, Calling lpp_t_supl_pos_trigger", v6, 2u);
  }
  sub_23918B630((uint64_t)v3, v2);
  sub_23918E784((uint64_t)off_25691E330, *(_DWORD *)(a1 + 28), *(_BYTE *)(a1 + 32), v2, v3);
  if (v3)
    MEMORY[0x23B838844](v3, 0x1000C4077774924);
}

void sub_2391BCE40(int a1, uint64_t a2, void *a3)
{
  NSObject *v5;
  _OWORD v6[3];
  __int128 v7[2];
  __int128 v8[2];
  _OWORD v9[2];
  uint8_t buf[16];
  _BYTE v11[44];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = qword_2542CF618;
  if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2390FD000, v5, OS_LOG_TYPE_DEFAULT, "#gpsd,#supl,#posp AID_RQD_MSG  ", buf, 2u);
  }
  *(_QWORD *)buf = 0x8000000080000000;
  *(_QWORD *)&buf[8] = 0xFFFF00007FFFFFFFLL;
  *(_WORD *)v11 = 255;
  *(_WORD *)&v11[8] = -1;
  v11[10] = -1;
  *(_DWORD *)&v11[2] = -1;
  v11[6] = -1;
  memset(&v11[11], 0, 32);
  sub_2391AC49C((uint64_t)"SuplLppExecuteAidRequest", 68, buf, 0x3Cu, a3, 0x3CuLL);
  v8[0] = *(_OWORD *)buf;
  v8[1] = *(_OWORD *)v11;
  v9[0] = *(_OWORD *)&v11[16];
  *(_OWORD *)((char *)v9 + 12) = *(_OWORD *)&v11[28];
  memset(v7, 0, sizeof(v7));
  memset(v6, 0, sizeof(v6));
  sub_23918EE08((uint64_t)off_25691E330, v8, v7, 1, 0x100000002, a1, (uint64_t)v6);
}

void sub_2391BCF94(int a1, int a2, uint64_t a3)
{
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BOOL4 v12;
  char v13;
  NSObject *v14;
  _BYTE *v15;
  _BYTE *v16;
  int v17;
  _BYTE *v18;
  _BYTE __p[20];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[36];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  sub_2391011A4(__p, "SuplLppExecutePosRsp");
  v6 = qword_2542CF618;
  if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEBUG))
  {
    v15 = __p;
    if (SBYTE3(v20) < 0)
      v15 = *(_BYTE **)__p;
    v17 = 136315138;
    v18 = v15;
    _os_log_debug_impl(&dword_2390FD000, v6, OS_LOG_TYPE_DEBUG, "#gpsd,#supl,#posp Entered %s", (uint8_t *)&v17, 0xCu);
  }
  if (SBYTE3(v20) < 0)
    operator delete(*(void **)__p);
  v7 = qword_2542CF618;
  if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__p = 67109120;
    *(_DWORD *)&__p[4] = a2;
    _os_log_impl(&dword_2390FD000, v7, OS_LOG_TYPE_DEFAULT, "LPP Sub Msg Type,%u", __p, 8u);
  }
  if ((a2 & 0xFFFFFFFD) != 0)
  {
    v8 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__p = 0;
      _os_log_error_impl(&dword_2390FD000, v8, OS_LOG_TYPE_ERROR, "LPP message", __p, 2u);
    }
  }
  else
  {
    v35 = 0u;
    v36 = 0u;
    v34 = 0u;
    *(_OWORD *)&v25[20] = 0u;
    v33 = 0u;
    v32 = 0u;
    v31 = 0u;
    v30 = 0u;
    v29 = 0u;
    v28 = 0u;
    v27 = 0u;
    v26 = 0u;
    v9 = *(_OWORD *)(a3 + 80);
    v23 = *(_OWORD *)(a3 + 64);
    v24 = v9;
    *(_OWORD *)v25 = *(_OWORD *)(a3 + 96);
    v10 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)&__p[4] = *(_OWORD *)a3;
    v20 = v10;
    v11 = *(_OWORD *)(a3 + 48);
    v21 = *(_OWORD *)(a3 + 32);
    v12 = *(_WORD *)a3 != 0;
    v13 = *(_BYTE *)(a3 + 117);
    *(_DWORD *)__p = 1;
    *(_QWORD *)&v25[13] = *(_QWORD *)(a3 + 109);
    v22 = v11;
    v25[21] = v13;
    LOBYTE(v34) = v13;
    DWORD1(v34) = 2 * v12;
    *(_QWORD *)&v35 = -1;
    *((_QWORD *)&v35 + 1) = 0xFFFF7FFFFFFFFFFFLL;
    *(_QWORD *)&v36 = -1;
    sub_23918EF40((uint64_t)off_25691E330, (int *)__p, 0x100000002, a1);
  }
  sub_2391011A4(__p, "SuplLppExecutePosRsp");
  v14 = qword_2542CF618;
  if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEBUG))
  {
    v16 = __p;
    if (SBYTE3(v20) < 0)
      v16 = *(_BYTE **)__p;
    v17 = 136315138;
    v18 = v16;
    _os_log_debug_impl(&dword_2390FD000, v14, OS_LOG_TYPE_DEBUG, "#gpsd,#supl,#posp Leaving %s", (uint8_t *)&v17, 0xCu);
  }
  if (SBYTE3(v20) < 0)
    operator delete(*(void **)__p);
}

void sub_2391BD258(int a1, char a2, unsigned __int16 *a3)
{
  NSObject *v6;
  char *v7;
  int v8;
  uint64_t v9;
  char *v10;
  _BYTE *v11;
  char *v12;
  char v13;
  char v14;
  NSObject *v15;
  void **v16;
  NSObject *v17;
  void **v18;
  void **v19;
  void *__p[2];
  char v21;
  uint8_t buf[4];
  void **v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  sub_2391011A4(__p, "SuplLppExecuteAdReq");
  v6 = qword_2542CF618;
  if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEBUG))
  {
    v18 = __p;
    if (v21 < 0)
      v18 = (void **)__p[0];
    *(_DWORD *)buf = 136315138;
    v23 = v18;
    _os_log_debug_impl(&dword_2390FD000, v6, OS_LOG_TYPE_DEBUG, "#gpsd,#supl,#posp Entered %s", buf, 0xCu);
  }
  if (v21 < 0)
    operator delete(__p[0]);
  v7 = (char *)operator new(0x68uLL, MEMORY[0x24BEDB6B8]);
  if (v7)
  {
    *(_QWORD *)v7 = 0x8000000080000000;
    *((_QWORD *)v7 + 1) = 0xFFFF00007FFFFFFFLL;
    *((_WORD *)v7 + 8) = 255;
    *((_WORD *)v7 + 12) = -1;
    v7[26] = -1;
    *(_DWORD *)(v7 + 18) = -1;
    v7[22] = -1;
    *(_OWORD *)(v7 + 27) = 0u;
    *(_OWORD *)(v7 + 43) = 0u;
    v8 = *a3;
    v7[96] = v8;
    if (v8 == 1)
    {
      *(_OWORD *)v7 = 0uLL;
      *((_OWORD *)v7 + 1) = 0uLL;
      *(_OWORD *)(v7 + 44) = 0uLL;
      *((_OWORD *)v7 + 2) = 0uLL;
      *((_WORD *)v7 + 6) = *((_DWORD *)a3 + 2);
      *((_WORD *)v7 + 7) = a3[6];
      v7[16] = *((_BYTE *)a3 + 14);
      v9 = *((unsigned __int8 *)a3 + 15);
      v7[17] = v9;
      v7[18] = *((_BYTE *)a3 + 64);
      if (v9)
      {
        v10 = (char *)*((_QWORD *)a3 + 5);
        v11 = v7 + 43;
        v12 = (char *)*((_QWORD *)a3 + 2);
        do
        {
          v13 = *v10++;
          *v11 = v13;
          v14 = *v12++;
          *(v11 - 16) = v14;
          ++v11;
          --v9;
        }
        while (v9);
      }
    }
    sub_23918E974((uint64_t)off_25691E330, a1, a2, 1, (uint64_t)v7, 0, 0);
    sub_2391011A4(__p, "SuplLppExecuteAdReq");
    v15 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEBUG))
    {
      v16 = __p;
      if (v21 < 0)
        v16 = (void **)__p[0];
      *(_DWORD *)buf = 136315138;
      v23 = v16;
LABEL_25:
      _os_log_debug_impl(&dword_2390FD000, v15, OS_LOG_TYPE_DEBUG, "#gpsd,#supl,#posp Leaving %s", buf, 0xCu);
    }
  }
  else
  {
    v17 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__p[0]) = 0;
      _os_log_error_impl(&dword_2390FD000, v17, OS_LOG_TYPE_ERROR, "GNSS Aid Req", (uint8_t *)__p, 2u);
    }
    sub_2391011A4(__p, "SuplLppExecuteAdReq");
    v15 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEBUG))
    {
      v19 = __p;
      if (v21 < 0)
        v19 = (void **)__p[0];
      *(_DWORD *)buf = 136315138;
      v23 = v19;
      goto LABEL_25;
    }
  }
  if (v21 < 0)
    operator delete(__p[0]);
}

void sub_2391BD548(int a1, char a2)
{
  NSObject *v4;
  NSObject *v5;
  void **v6;
  void **v7;
  void *__p[2];
  char v9;
  uint8_t buf[4];
  void **v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  sub_2391011A4(__p, "SuplLppExecuteCapReq");
  v4 = qword_2542CF618;
  if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEBUG))
  {
    v6 = __p;
    if (v9 < 0)
      v6 = (void **)__p[0];
    *(_DWORD *)buf = 136315138;
    v11 = v6;
    _os_log_debug_impl(&dword_2390FD000, v4, OS_LOG_TYPE_DEBUG, "#gpsd,#supl,#posp Entered %s", buf, 0xCu);
  }
  if (v9 < 0)
    operator delete(__p[0]);
  sub_23918EBE4((uint64_t)off_25691E330, a1, a2);
  sub_2391011A4(__p, "SuplLppExecuteCapReq");
  v5 = qword_2542CF618;
  if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEBUG))
  {
    v7 = __p;
    if (v9 < 0)
      v7 = (void **)__p[0];
    *(_DWORD *)buf = 136315138;
    v11 = v7;
    _os_log_debug_impl(&dword_2390FD000, v5, OS_LOG_TYPE_DEBUG, "#gpsd,#supl,#posp Leaving %s", buf, 0xCu);
  }
  if (v9 < 0)
    operator delete(__p[0]);
}

void sub_2391BD6C0(int a1, int a2, uint64_t a3, int a4)
{
  NSObject *v7;
  __int128 *v8;
  _DWORD v9[2];
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = qword_2542CF618;
  if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109376;
    v9[1] = a1;
    v10 = 1024;
    v11 = a2;
    _os_log_impl(&dword_2390FD000, v7, OS_LOG_TYPE_DEFAULT, "#gpsd,#supl,#posp updating PLMN info,%d,%d", (uint8_t *)v9, 0xEu);
  }
  v8 = off_25691E330;
  *((_WORD *)off_25691E330 + 40) = a1;
  *((_WORD *)v8 + 41) = a2;
  *((_DWORD *)v8 + 21) = a4;
}

void sub_2391BD78C()
{
  NSObject *v0;
  __int128 *v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 *v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  v0 = qword_2542CF618;
  if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2390FD000, v0, OS_LOG_TYPE_DEFAULT, "#gpsd,#supl,#posp LPP Initialization Fn", buf, 2u);
  }
  v1 = off_25691E330;
  sub_23918E6D8((uint64_t)off_25691E330);
  v2 = *v1;
  v3 = v1[1];
  v4 = v1[3];
  xmmword_25691E360 = v1[2];
  unk_25691E370 = v4;
  xmmword_25691E340 = v2;
  *(_OWORD *)algn_25691E350 = v3;
  v5 = v1[4];
  v6 = v1[5];
  v7 = v1[6];
  qword_25691E3B0 = *((_QWORD *)v1 + 14);
  xmmword_25691E390 = v6;
  unk_25691E3A0 = v7;
  xmmword_25691E380 = v5;
  v8 = *(__int128 *)((char *)v1 + 152);
  v9 = *(__int128 *)((char *)v1 + 136);
  unk_25691E3B8 = *(__int128 *)((char *)v1 + 120);
  unk_25691E3C8 = v9;
  unk_25691E3D8 = v8;
  v10 = *(__int128 *)((char *)v1 + 184);
  v11 = *(__int128 *)((char *)v1 + 200);
  v12 = *(__int128 *)((char *)v1 + 216);
  unk_25691E3E8 = *(__int128 *)((char *)v1 + 168);
  unk_25691E418 = v12;
  unk_25691E408 = v11;
  unk_25691E3F8 = v10;
  v13 = off_25691E330;
  *((_WORD *)off_25691E330 + 4) = 1537;
  *((_DWORD *)v13 + 1) = 2;
  *((_BYTE *)v13 + 105) = 1;
  *((_DWORD *)v13 + 22) = -1;
  *(_BYTE *)v13 = 1;
  *((_WORD *)v13 + 26) = 1;
  *((_BYTE *)v13 + 50) = 3;
  *((_WORD *)v13 + 22) = 257;
  *((_BYTE *)v13 + 61) = 1;
  *((_WORD *)v13 + 32) = 257;
  *((_BYTE *)v13 + 66) = 0;
  *(_WORD *)((char *)v13 + 59) = 32;
  v14 = qword_2542CF618;
  if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_2390FD000, v14, OS_LOG_TYPE_DEFAULT, "#gpsd,#supl,#posp LPP Initialization complete", v15, 2u);
    v13 = off_25691E330;
  }
  *((_DWORD *)v13 + 27) = 3;
  *((_DWORD *)v13 + 22) = 0xFFFF;
  *((_QWORD *)v13 + 10) = 10815105;
}

void sub_2391BD91C(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t v11[24];
  uint8_t *v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a2 + 24))
  {
    v4 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_2390FD000, v4, OS_LOG_TYPE_DEFAULT, "#gpsd,#supl,Null parameter Leaving setSuplProtoLocationIdNeededReport", v11, 2u);
    }
  }
  sub_239101254((uint64_t)v11, a2);
  v5 = a1 + 32;
  if (v11 != (uint8_t *)(a1 + 32))
  {
    v6 = v12;
    v7 = *(_QWORD *)(a1 + 56);
    if (v12 == v11)
    {
      if (v7 == v5)
      {
        (*(void (**)(uint8_t *, _QWORD *))(*(_QWORD *)v11 + 24))(v11, v13);
        (*(void (**)(uint8_t *))(*(_QWORD *)v12 + 32))(v12);
        v12 = 0;
        (*(void (**)(_QWORD, uint8_t *))(**(_QWORD **)(a1 + 56) + 24))(*(_QWORD *)(a1 + 56), v11);
        (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 56) + 32))(*(_QWORD *)(a1 + 56));
        *(_QWORD *)(a1 + 56) = 0;
        v12 = v11;
        (*(void (**)(_QWORD *, uint64_t))(v13[0] + 24))(v13, a1 + 32);
        (*(void (**)(_QWORD *))(v13[0] + 32))(v13);
      }
      else
      {
        (*(void (**)(uint8_t *, uint64_t))(*(_QWORD *)v11 + 24))(v11, a1 + 32);
        (*(void (**)(uint8_t *))(*(_QWORD *)v12 + 32))(v12);
        v12 = *(uint8_t **)(a1 + 56);
      }
      *(_QWORD *)(a1 + 56) = v5;
    }
    else if (v7 == v5)
    {
      (*(void (**)(uint64_t, uint8_t *))(*(_QWORD *)v5 + 24))(a1 + 32, v11);
      (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 56) + 32))(*(_QWORD *)(a1 + 56));
      *(_QWORD *)(a1 + 56) = v12;
      v12 = v11;
    }
    else
    {
      v12 = *(uint8_t **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v6;
    }
  }
  v8 = v12;
  if (v12 == v11)
  {
    v9 = 4;
    v8 = v11;
  }
  else
  {
    if (!v12)
      goto LABEL_18;
    v9 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v8 + 8 * v9))();
LABEL_18:
  v10 = qword_2542CF618;
  if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_2390FD000, v10, OS_LOG_TYPE_DEFAULT, "#gpsd,#supl,Leaving setSuplProtoLocationIdNeededReport", v11, 2u);
  }
}

void sub_2391BDB60(_Unwind_Exception *a1, int a2)
{
  if (a2)
    sub_2390FEEE8(a1);
  _Unwind_Resume(a1);
}

_QWORD *sub_2391BDB6C(uint64_t a1)
{
  _QWORD *result;
  uint64_t v2;
  _BYTE v3[24];
  _BYTE *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  sub_239101254((uint64_t)v3, a1 + 32);
  if (!v4)
    sub_2391012B8();
  (*(void (**)(_BYTE *))(*(_QWORD *)v4 + 48))(v4);
  result = v4;
  if (v4 == v3)
  {
    v2 = 4;
    result = v3;
  }
  else
  {
    if (!v4)
      return result;
    v2 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v2))();
}

void sub_2391BDC10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  _Unwind_Resume(exception_object);
}

uint64_t sub_2391BDC54()
{
  uint64_t result;
  NSObject *v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  if (qword_2542CF5D8 != -1)
    dispatch_once(&qword_2542CF5D8, &unk_250ABD140);
  result = qword_2542CF5D0;
  if (!qword_2542CF5D0)
  {
    v1 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      v2 = 136315138;
      v3 = "GetInstance";
      _os_log_error_impl(&dword_2390FD000, v1, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v2, 0xCu);
    }
    __assert_rtn("GetInstance", "SuplBridge.mm", 92, "false && \"Memory allocation failure\"");
  }
  return result;
}

char *sub_2391BDD48()
{
  char *result;
  uint64_t v1;
  char *v2;
  NSObject *v3;

  result = (char *)operator new(0x1A8uLL, MEMORY[0x24BEDB6B8]);
  v1 = (uint64_t)result;
  if (result)
  {
    *(_OWORD *)(result + 152) = 0u;
    v2 = result + 152;
    *((_QWORD *)result + 3) = 0;
    *((_QWORD *)result + 7) = 0;
    *((_QWORD *)result + 8) = 0;
    *((_DWORD *)result + 18) = 0;
    *((_OWORD *)result + 5) = 0u;
    *((_OWORD *)result + 6) = 0u;
    *((_QWORD *)result + 14) = -1;
    *((_QWORD *)result + 15) = 0xFFFFFFFF7FFFFFFFLL;
    *((_WORD *)result + 64) = -1;
    *(_QWORD *)(result + 132) = -1;
    *(_QWORD *)(result + 140) = -1;
    *((_DWORD *)result + 37) = -1;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 248) = 0u;
    do
    {
      *(_WORD *)v2 = -1;
      v2[2] = -1;
      *(_QWORD *)(v2 + 4) = -1;
      v2[12] = -1;
      v2 += 16;
    }
    while (v2 != result + 408);
    result[408] = -1;
    *((_DWORD *)result + 103) = -1;
    *((_QWORD *)result + 52) = -1;
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    result = (char *)dispatch_queue_create("com.gnss.suplq", v3);
    *(_QWORD *)(v1 + 88) = result;
  }
  qword_2542CF5D0 = v1;
  return result;
}

void sub_2391BDE58(uint64_t a1)
{
  uint64_t v1;
  uintptr_t data;
  uintptr_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *__p;
  void *v15;
  uint64_t v16;
  uint8_t buf[4];
  uintptr_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 40);
  data = dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32));
  if (!data)
    return;
  v3 = data;
  if ((*(unsigned int (**)(_QWORD))(**(_QWORD **)(v1 + 64) + 32))(*(_QWORD *)(v1 + 64)) == -3)
  {
    v4 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__p) = 0;
      _os_log_error_impl(&dword_2390FD000, v4, OS_LOG_TYPE_ERROR, "#gpsd,#supl,readSocketData,Invalid Session while Reading", (uint8_t *)&__p, 2u);
    }
    v5 = sub_2391B1EF8();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)v5 + 32))(v5, *(unsigned int *)(v1 + 72), 14);
    return;
  }
  __p = 0;
  v15 = 0;
  v16 = 0;
  v6 = qword_2542CF618;
  if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v18 = v3;
    _os_log_impl(&dword_2390FD000, v6, OS_LOG_TYPE_DEFAULT, "#gpsd,#supl,readSocketData,Bytes on Sock,%llu", buf, 0xCu);
  }
  v7 = (*(uint64_t (**)(_QWORD, void **))(**(_QWORD **)(v1 + 64) + 8))(*(_QWORD *)(v1 + 64), &__p);
  v8 = v7;
  if (v7 == -4)
  {
    v9 = 11;
  }
  else
  {
    if (v7 != -3)
    {
      v12 = qword_2542CF618;
      if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v18) = v8;
        _os_log_error_impl(&dword_2390FD000, v12, OS_LOG_TYPE_ERROR, "#gpsd,#supl,readSocketData,Byte written,%d", buf, 8u);
        v12 = qword_2542CF618;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v18) = (_DWORD)v15 - (_DWORD)__p;
        _os_log_impl(&dword_2390FD000, v12, OS_LOG_TYPE_DEFAULT, "#gpsd,#supl,#in,readSocketData,Socket read buf size,%u,continue to process supl", buf, 8u);
      }
      v13 = sub_2391B1EF8();
      (*(void (**)(uint64_t, _QWORD, void **))(*(_QWORD *)v13 + 40))(v13, *(unsigned int *)(v1 + 72), &__p);
      goto LABEL_20;
    }
    v9 = 10;
  }
  v10 = qword_2542CF618;
  if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v18) = v9;
    _os_log_error_impl(&dword_2390FD000, v10, OS_LOG_TYPE_ERROR, "#gpsd,#supl,readSocketData,Socket read fail , disconnecting,%u", buf, 8u);
  }
  v11 = sub_2391B1EF8();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)v11 + 32))(v11, *(unsigned int *)(v1 + 72), v9);
LABEL_20:
  if (__p)
  {
    v15 = __p;
    operator delete(__p);
  }
}

void sub_2391BE0EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_2391BE114(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[16];

  v2 = *(_QWORD *)(a1 + 40);
  v3 = qword_2542CF618;
  if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2390FD000, v3, OS_LOG_TYPE_DEFAULT, "#gpsd,#supl,readSocketData,cancel called,disconnecting supl", v7, 2u);
  }
  *(_DWORD *)(v2 + 72) = 0;
  v4 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(v2 + 64) + 24))(*(_QWORD *)(v2 + 64));
  if (v4 < 0xFFFFFFFB)
    v5 = 1;
  else
    v5 = dword_2391D287C[v4 + 5];
  v6 = sub_2391B1EF8();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)v6 + 32))(v6, *(unsigned int *)(v2 + 72), v5);
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

void sub_2391BE1D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  int v6;
  int v7;
  int v8;
  NSObject *v9;
  void (*v10)(void);
  NSObject *v11;
  int v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if ((*(unsigned int (**)(_QWORD))(**(_QWORD **)(a1 + 64) + 32))(*(_QWORD *)(a1 + 64)) == -3)
  {
    v5 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_2390FD000, v5, OS_LOG_TYPE_DEFAULT, "#gpsd,#supl,writeDataToSocket,Invalid Socket during Write", (uint8_t *)&v12, 2u);
    }
LABEL_11:
    v10 = *(void (**)(void))(*(_QWORD *)sub_2391B1EF8() + 32);
    v10();
    return;
  }
  v6 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), a3);
  if (v6 == -3)
  {
    v8 = 12;
LABEL_9:
    v9 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 67109120;
      v13 = v8;
      _os_log_impl(&dword_2390FD000, v9, OS_LOG_TYPE_DEFAULT, "#gpsd,#supl,writeDataToSocket,Socket write,%u", (uint8_t *)&v12, 8u);
    }
    goto LABEL_11;
  }
  v7 = v6;
  if (v6 == -4)
  {
    v8 = 13;
    goto LABEL_9;
  }
  v11 = qword_2542CF618;
  if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 67109120;
    v13 = v7;
    _os_log_impl(&dword_2390FD000, v11, OS_LOG_TYPE_DEFAULT, "#gpsd,#supl,writeDataToSocket,Byte written,%d", (uint8_t *)&v12, 8u);
  }
}

uint64_t sub_2391BE38C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t **v6;
  uint64_t (***v8)(_QWORD, void **, uint64_t);
  int v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *__p[2];
  uint64_t v21;
  _QWORD handler[6];
  _BYTE buf[40];
  uint64_t v24;
  uint64_t v25;

  v6 = (uint64_t **)a2;
  v25 = *MEMORY[0x24BDAC8D0];
  v8 = *(uint64_t (****)(_QWORD, void **, uint64_t))(a1 + 64);
  if (*((char *)a2 + 23) < 0)
  {
    sub_2391B37EC(__p, (void *)*a2, a2[1]);
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a2;
    v21 = a2[2];
  }
  v9 = (**v8)(v8, __p, a3);
  if (SHIBYTE(v21) < 0)
    operator delete(__p[0]);
  v10 = qword_2542CF618;
  if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
  {
    if (*((char *)v6 + 23) < 0)
      v6 = (uint64_t **)*v6;
    v11 = "FAILURE";
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 1024;
    if (v9 == -2)
      v11 = "SUCCESS";
    *(_DWORD *)&buf[14] = a3;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = v11;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = v9;
    _os_log_impl(&dword_2390FD000, v10, OS_LOG_TYPE_DEFAULT, "#gpsd,#supl,#input,ConnectToServer,Connection fqdn,%s,%u,status,%s,%d", buf, 0x22u);
  }
  switch(v9)
  {
    case -5:
      v12 = 7;
      break;
    case -4:
      v12 = 9;
      break;
    case -3:
      v12 = 8;
      break;
    case -2:
      *(_DWORD *)(a1 + 72) = a4;
      v13 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 64) + 32))(*(_QWORD *)(a1 + 64));
      v14 = dispatch_source_create(MEMORY[0x24BDACA00], v13, 0, *(dispatch_queue_t *)(a1 + 88));
      if (v14)
      {
        v15 = v14;
        *(_QWORD *)(a1 + 80) = v14;
        v16 = MEMORY[0x24BDAC760];
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = sub_2391BDE58;
        *(_QWORD *)&buf[24] = &unk_250ABD168;
        *(_QWORD *)&buf[32] = v14;
        v24 = a1;
        dispatch_source_set_event_handler(v14, buf);
        handler[0] = v16;
        handler[1] = 3221225472;
        handler[2] = sub_2391BE114;
        handler[3] = &unk_250ABD168;
        handler[4] = v15;
        handler[5] = a1;
        dispatch_source_set_cancel_handler(v15, handler);
        dispatch_resume(v15);
      }
      else
      {
        v17 = qword_2542CF618;
        if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_2390FD000, v17, OS_LOG_TYPE_ERROR, "#gpsd,#supl,readSocketData,SUPL Socket read failed", buf, 2u);
        }
      }
      v12 = 6;
      break;
    case -1:
      v12 = 5;
      break;
    default:
      v12 = 0;
      break;
  }
  v18 = sub_2391B1EF8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v18 + 24))(v18, a4, v12);
}

void sub_2391BE638(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_2391BE65C(uint64_t a1)
{
  uint64_t v1;
  uint64_t (***v2)(_QWORD, _QWORD, char *, uint64_t);
  char v4[4];
  int v5;

  v1 = *(_QWORD *)(a1 + 32);
  v4[0] = 1;
  v5 = *(_DWORD *)(v1 + 72);
  v2 = (uint64_t (***)(_QWORD, _QWORD, char *, uint64_t))sub_2391B1EF8();
  return (**v2)(v2, 0, v4, 1);
}

void sub_2391BE6A4(uint8_t *a1, uint64_t a2)
{
  uint8_t *v3;
  uint8_t *v4;
  NSObject *v5;
  uint8_t *v6;
  uint64_t v7;
  uint8_t v8[24];
  uint8_t *v9;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a2 + 24))
  {
    sub_239101254((uint64_t)v8, a2);
    if (v8 != a1)
    {
      v3 = v9;
      v4 = (uint8_t *)*((_QWORD *)a1 + 3);
      if (v9 == v8)
      {
        if (v4 == a1)
        {
          (*(void (**)(uint8_t *, _QWORD *))(*(_QWORD *)v8 + 24))(v8, v10);
          (*(void (**)(uint8_t *))(*(_QWORD *)v9 + 32))(v9);
          v9 = 0;
          (*(void (**)(_QWORD, uint8_t *))(**((_QWORD **)a1 + 3) + 24))(*((_QWORD *)a1 + 3), v8);
          (*(void (**)(_QWORD))(**((_QWORD **)a1 + 3) + 32))(*((_QWORD *)a1 + 3));
          *((_QWORD *)a1 + 3) = 0;
          v9 = v8;
          (*(void (**)(_QWORD *, uint8_t *))(v10[0] + 24))(v10, a1);
          (*(void (**)(_QWORD *))(v10[0] + 32))(v10);
        }
        else
        {
          (*(void (**)(uint8_t *, uint8_t *))(*(_QWORD *)v8 + 24))(v8, a1);
          (*(void (**)(uint8_t *))(*(_QWORD *)v9 + 32))(v9);
          v9 = (uint8_t *)*((_QWORD *)a1 + 3);
        }
        *((_QWORD *)a1 + 3) = a1;
      }
      else if (v4 == a1)
      {
        (*(void (**)(uint8_t *, uint8_t *))(*(_QWORD *)a1 + 24))(a1, v8);
        (*(void (**)(_QWORD))(**((_QWORD **)a1 + 3) + 32))(*((_QWORD *)a1 + 3));
        *((_QWORD *)a1 + 3) = v9;
        v9 = v8;
      }
      else
      {
        v9 = (uint8_t *)*((_QWORD *)a1 + 3);
        *((_QWORD *)a1 + 3) = v3;
      }
    }
    v6 = v9;
    if (v9 == v8)
    {
      v7 = 4;
      v6 = v8;
    }
    else
    {
      if (!v9)
        return;
      v7 = 5;
    }
    (*(void (**)(void))(*(_QWORD *)v6 + 8 * v7))();
  }
  else
  {
    v5 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2390FD000, v5, OS_LOG_TYPE_DEFAULT, "StatusReport callback NULL", v8, 2u);
    }
  }
}

void sub_2391BE89C(_Unwind_Exception *a1, int a2)
{
  if (a2)
    sub_2390FEEE8(a1);
  _Unwind_Resume(a1);
}

uint64_t sub_2391BE8A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  _OWORD v9[3];
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  unint64_t v13;
  uint64_t v14;
  __int16 v15;
  _BYTE v16[22];
  int v17;
  _WORD v18[11];

  v1 = *(_QWORD *)(a1 + 32);
  v10 = 0;
  v11 = 0;
  v15 = 0;
  *(_QWORD *)&v18[7] = 0;
  *(_QWORD *)&v18[3] = 0;
  v2 = *(_QWORD *)(v1 + 104);
  v9[0] = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  v9[1] = xmmword_2391D28E0;
  __asm { FMOV            V0.2D, #-1.0 }
  v9[2] = _Q0;
  v12 = _Q0;
  v13 = 0xBFF0000000000000;
  v14 = 0;
  *(_QWORD *)&v16[14] = 0;
  *(_OWORD *)v16 = *(unint64_t *)v18;
  v17 = -1;
  result = *(_QWORD *)(v2 + 496);
  if (result)
    return (*(uint64_t (**)(uint64_t, _OWORD *))(*(_QWORD *)result + 48))(result, v9);
  return result;
}

void sub_2391BE930(uint64_t a1, unsigned int *a2)
{
  NSObject *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  NSObject *v14;
  unsigned int v15;
  double v16;
  uint64_t v17;
  unsigned int v18;
  double v19;
  int v20;
  double v21;
  double v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  double v27;
  int v28;
  int v29;
  double v30;
  double v31;
  double v32;
  unsigned int v33;
  double v34;
  double v35;
  unsigned int v36;
  int v37;
  NSObject *v38;
  unsigned int v39;
  int v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  _QWORD *v44;
  NSObject *v45;
  uint64_t v46;
  double v47;
  uint64_t v48;
  __int16 v49[8];
  __int128 v50;
  __int128 v51;
  int64x2_t v52;
  __int128 v53;
  __int128 v54;
  int64x2_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD block[4];
  _BYTE v60[24];
  _BYTE *v61;
  __int128 v62;
  __int128 v63;
  int64x2_t v64;
  __int128 v65;
  __int128 v66;
  int64x2_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE buf[24];
  double v72;
  _BYTE v73[10];
  __int16 v74;
  double v75;
  __int16 v76;
  int v77;
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  *((_QWORD *)&v50 + 1) = 0;
  v51 = xmmword_2391D28F0;
  v52 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  __asm { FMOV            V0.2D, #-1.0 }
  v53 = _Q0;
  *(_QWORD *)&v54 = 0xBFF0000000000000;
  WORD4(v54) = 0;
  BYTE10(v54) = 0;
  HIDWORD(v54) = 0;
  v55 = v52;
  v56 = xmmword_2391D28E0;
  *(_QWORD *)&v57 = 0xBFF0000000000000;
  WORD4(v57) = -1;
  LODWORD(v58) = -1;
  WORD2(v58) = -1;
  *((_QWORD *)&v58 + 1) = 0xBFF0000000000000;
  *(_QWORD *)&v50 = *a2;
  sub_2391BF370(a2[6], (_DWORD *)&v50 + 1);
  v9 = qword_2542CF618;
  if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
  {
    v11 = a2[4];
    v10 = a2[5];
    v12 = a2[7];
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)&buf[4] = v10;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v11;
    *(_WORD *)&buf[14] = 1024;
    *(_DWORD *)&buf[16] = v12;
    _os_log_impl(&dword_2390FD000, v9, OS_LOG_TYPE_DEFAULT, "#gpsd,#supl,#out,sendSuplStatusReport,SUPL Event,%u,SessionStatus,%u,SuplEndCause,%u", buf, 0x14u);
  }
  switch(a2[5])
  {
    case 1u:
      v13 = 1;
      goto LABEL_12;
    case 2u:
      v14 = *(NSObject **)(a1 + 96);
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = sub_2391BE8A8;
      v72 = COERCE_DOUBLE(&unk_250A6BEF8);
      *(_QWORD *)v73 = a1;
      dispatch_async(v14, buf);
      goto LABEL_6;
    case 3u:
      v13 = 13;
      goto LABEL_12;
    case 6u:
      v13 = 30;
      goto LABEL_12;
    case 7u:
      v13 = 29;
LABEL_12:
      DWORD2(v50) = v13;
      break;
    default:
LABEL_6:
      if (!DWORD2(v50))
      {
        switch(a2[4])
        {
          case 5u:
          case 8u:
            v13 = 3;
            goto LABEL_12;
          case 6u:
            v13 = 2;
            goto LABEL_12;
          case 7u:
            v13 = 5;
            goto LABEL_12;
          case 9u:
            v13 = 4;
            goto LABEL_12;
          case 0xAu:
            v13 = 6;
            goto LABEL_12;
          case 0xBu:
            v13 = 7;
            goto LABEL_12;
          case 0xCu:
            v13 = 8;
            goto LABEL_12;
          case 0xDu:
            v13 = 9;
            goto LABEL_12;
          case 0xEu:
            v13 = 12;
            goto LABEL_12;
          case 0xFu:
            v13 = 11;
            goto LABEL_12;
          case 0x10u:
            v13 = 10;
            goto LABEL_12;
          case 0x12u:
          case 0x19u:
            v13 = 26;
            goto LABEL_12;
          case 0x13u:
          case 0x1Au:
            v13 = 20;
            goto LABEL_12;
          case 0x14u:
          case 0x1Bu:
            v13 = 27;
            goto LABEL_12;
          case 0x15u:
          case 0x1Cu:
            v13 = 21;
            goto LABEL_12;
          case 0x16u:
            v13 = 28;
            goto LABEL_12;
          case 0x17u:
            v13 = 22;
            goto LABEL_12;
          case 0x1Du:
            v13 = 17;
            goto LABEL_12;
          case 0x1Eu:
            v13 = 18;
            goto LABEL_12;
          case 0x1Fu:
            v13 = 19;
            goto LABEL_12;
          case 0x20u:
            v13 = 23;
            goto LABEL_12;
          case 0x21u:
            v13 = 24;
            goto LABEL_12;
          case 0x22u:
            v13 = 25;
            goto LABEL_12;
          case 0x23u:
            DWORD2(v50) = 14;
            BYTE9(v54) = 1;
            break;
          case 0x24u:
            DWORD2(v50) = 15;
            BYTE10(v54) = 1;
            break;
          case 0x25u:
            DWORD2(v50) = 16;
            BYTE8(v54) = 1;
            break;
          default:
            goto LABEL_13;
        }
      }
      break;
  }
LABEL_13:
  if (a2[7] <= 0x16)
    HIDWORD(v50) = a2[7];
  v15 = *((unsigned __int8 *)a2 + 32);
  if (v15 == 255)
    v16 = -1.0;
  else
    v16 = (pow(1.1, (double)v15) + -1.0) * 10.0;
  *(double *)&v51 = v16;
  v17 = *((_QWORD *)a2 + 1);
  if (v17 && *(_DWORD *)(v17 + 20) == 1)
  {
    v18 = *(_DWORD *)(v17 + 36);
    if (v18 >> 23)
    {
      v19 = 1.79769313e308;
    }
    else
    {
      v19 = -((double)v18 * 90.0 * 0.00000011920929);
      if (*(_DWORD *)(v17 + 32) != 2)
        v19 = (double)v18 * 90.0 * 0.00000011920929;
    }
    *((double *)&v51 + 1) = v19;
    v20 = *(_DWORD *)(v17 + 40);
    if ((v20 + 0x800000) >> 24)
    {
      v21 = 1.79769313e308;
    }
    else
    {
      if ((v20 & 0x800000) != 0)
        v20 |= 0xFF000000;
      v21 = (double)v20 * 360.0 * 0.0000000596046448;
    }
    v22 = (double)*(unsigned __int16 *)(v17 + 44);
    if (*(_DWORD *)(v17 + 52) == 2)
      v22 = -v22;
    if (*(__int16 *)(v17 + 44) < 0)
      v22 = 1.79769313e308;
    *(double *)v52.i64 = v21;
    *(double *)&v52.i64[1] = v22;
    v23 = *(unsigned __int8 *)(v17 + 46);
    if (v23 != 255)
      *(double *)&v53 = (double)v23;
    v24 = *(unsigned __int8 *)(v17 + 47);
    if (v24 != 255)
      *((double *)&v53 + 1) = (double)v24;
    v25 = *(unsigned __int8 *)(v17 + 56);
    if (v25 != 255)
      *(double *)&v54 = (double)v25;
  }
  if (BYTE10(v54))
  {
    v26 = *(_DWORD *)(a1 + 116);
    if (v26 >> 23)
    {
      v27 = 1.79769313e308;
    }
    else if (*(_BYTE *)(a1 + 113))
    {
      v27 = -((double)v26 * 90.0 * 0.00000011920929);
    }
    else
    {
      v27 = (double)v26 * 90.0 * 0.00000011920929;
    }
    v28 = *(unsigned __int8 *)(a1 + 124);
    *(double *)v55.i64 = v27;
    v29 = *(_DWORD *)(a1 + 120);
    if ((v29 + 0x800000) >> 24)
    {
      v30 = 1.79769313e308;
    }
    else
    {
      if ((v29 & 0x800000) != 0)
        v29 |= 0xFF000000;
      v30 = (double)v29 * 360.0 * 0.0000000596046448;
    }
    v31 = (double)*(unsigned __int16 *)(a1 + 114);
    if (v28)
      v31 = -v31;
    if (*(__int16 *)(a1 + 114) < 0)
      v32 = 1.79769313e308;
    else
      v32 = v31;
    *(double *)&v55.i64[1] = v30;
    *(double *)&v56 = v32;
    v33 = *(unsigned __int8 *)(a1 + 125);
    v34 = -1.0;
    v35 = -1.0;
    if (v33 != 255)
      v35 = (pow(1.1, (double)v33) + -1.0) * 10.0;
    *(double *)&v57 = v35;
    v36 = *(unsigned __int8 *)(a1 + 126);
    if (v36 != 255)
      v34 = (pow(1.025, (double)v36) + -1.0) * 45.0;
    *((double *)&v56 + 1) = v34;
    v37 = *(unsigned __int8 *)(a1 + 129);
    if (v37 != 255)
    {
      BYTE8(v57) = *(_BYTE *)(a1 + 129);
      BYTE9(v57) = v37;
    }
    v38 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134284801;
      *(double *)&buf[4] = v27;
      *(_WORD *)&buf[12] = 2049;
      *(double *)&buf[14] = v30;
      *(_WORD *)&buf[22] = 2049;
      v72 = v32;
      *(_WORD *)v73 = 2049;
      *(double *)&v73[2] = v35;
      v74 = 2049;
      v75 = v34;
      v76 = 1025;
      v77 = BYTE8(v57);
      _os_log_debug_impl(&dword_2390FD000, v38, OS_LOG_TYPE_DEBUG, "#gpsd,#supl,#process,sendSuplStatusReport, RefLocLat,%{private}.7lf,Long,%{private}.7lf,Alt,%{private}.2lf,HorUnc,%{private}.f,VerUnc,%{private}.f,conf,%{private}.d", buf, 0x3Au);
    }
  }
  if (BYTE9(v54))
  {
    if (*(unsigned __int16 *)(a1 + 148) <= 0x3FFu)
      WORD2(v58) = *(_WORD *)(a1 + 148);
    v39 = *(_DWORD *)(a1 + 144);
    if (v39 <= 0x240C83FF)
      LODWORD(v58) = v39 / 0x3E8;
    v40 = WORD2(v58);
    if (v39 != -1 && WORD2(v58) != 0xFFFF && *(unsigned __int8 *)(a1 + 150) != 255)
      *((_QWORD *)&v58 + 1) = 0;
    v41 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)&buf[4] = v40;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v58;
      *(_WORD *)&buf[14] = 2048;
      *(_QWORD *)&buf[16] = *((_QWORD *)&v58 + 1);
      _os_log_impl(&dword_2390FD000, v41, OS_LOG_TYPE_DEFAULT, "#gpsd,#supl,#process,sendSuplStatusReport,Week,%u,TowSec,%u,TowUnc,%.3lf", buf, 0x18u);
    }
  }
  if (!*(_QWORD *)((char *)&v50 + 4)
    && !HIDWORD(v50)
    && fabs(*(double *)&v51 + 1.0) < 2.22044605e-16
    && fabs(*((double *)&v51 + 1) + -1.79769313e308) < 2.22044605e-16
    && fabs(*(double *)v52.i64 + -1.79769313e308) < 2.22044605e-16
    && fabs(*(double *)&v52.i64[1] + -1.79769313e308) < 2.22044605e-16
    && fabs(*(double *)&v53 + 1.0) < 2.22044605e-16
    && fabs(*((double *)&v53 + 1) + 1.0) < 2.22044605e-16
    && fabs(*(double *)&v54 + 1.0) < 2.22044605e-16)
  {
    v42 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2390FD000, v42, OS_LOG_TYPE_DEFAULT, "#gpsd,#supl,#out,sendSuplStatusReport,No Status report, returning", buf, 2u);
    }
    return;
  }
  sub_239101254((uint64_t)buf, a1);
  if (v72 == 0.0)
  {
    v45 = qword_2542CF618;
    if (!os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
      return;
    v49[0] = 0;
    _os_log_impl(&dword_2390FD000, v45, OS_LOG_TYPE_DEFAULT, "#gpsd,#supl,sendSuplStatusReport,SuplStatusReportCB is NULL", (uint8_t *)v49, 2u);
    goto LABEL_97;
  }
  v43 = *(NSObject **)(a1 + 96);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3321888768;
  block[2] = sub_2391BF390;
  block[3] = &unk_250ABD188;
  v44 = v60;
  if (*(_BYTE **)&v72 == buf)
  {
    v61 = v60;
    (*(void (**)(_BYTE *, _BYTE *))(*(_QWORD *)buf + 24))(buf, v60);
  }
  else
  {
    v61 = (_BYTE *)(*(uint64_t (**)(void))(**(_QWORD **)&v72 + 16))();
  }
  v68 = v56;
  v69 = v57;
  v70 = v58;
  v64 = v52;
  v65 = v53;
  v66 = v54;
  v67 = v55;
  v62 = v50;
  v63 = v51;
  dispatch_async(v43, block);
  if (v61 == v60)
  {
    v46 = 4;
    goto LABEL_96;
  }
  if (v61)
  {
    v46 = 5;
    v44 = v61;
LABEL_96:
    (*(void (**)(_QWORD *))(*v44 + 8 * v46))(v44);
  }
LABEL_97:
  v47 = v72;
  if (*(_BYTE **)&v72 == buf)
  {
    v48 = 4;
    v47 = COERCE_DOUBLE(buf);
  }
  else
  {
    if (v72 == 0.0)
      return;
    v48 = 5;
  }
  (*(void (**)(void))(**(_QWORD **)&v47 + 8 * v48))();
}

void sub_2391BF2A4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = *(_QWORD **)(v1 - 152);
  if (v3 == (_QWORD *)(v1 - 176))
  {
    v4 = 4;
    v3 = (_QWORD *)(v1 - 176);
  }
  else
  {
    if (!v3)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*v3 + 8 * v4))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void sub_2391BF2E8(uint64_t a1, unsigned int a2, int a3, int a4, int a5, __int128 *a6)
{
  _DWORD *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  unsigned int v12;
  _DWORD *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  char v18;

  v13 = 0;
  v14 = 0;
  v12 = a2;
  v18 = -1;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  if (a6)
  {
    v8 = sub_2391AC318("SendSuplMsgStatus", 416, 1, 0x78uLL);
    v13 = v8;
    if (!v8)
      return;
    v9 = *a6;
    v10 = a6[1];
    v11 = a6[2];
    v8[16] = *((_DWORD *)a6 + 12);
    *((_OWORD *)v8 + 2) = v10;
    *((_OWORD *)v8 + 3) = v11;
    *((_OWORD *)v8 + 1) = v9;
  }
  sub_2391BE930(a1, &v12);
}

uint64_t sub_2391BF370(uint64_t result, _DWORD *a2)
{
  if ((result - 1) <= 0x10)
    *a2 = dword_2391D2890[(int)result - 1];
  return result;
}

void sub_2391BF390(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  __int16 v44;
  int v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 56);
  if (!v2)
    sub_2391012B8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v2 + 48))(v2, a1 + 64);
  v3 = qword_2542CF618;
  if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 96);
    v5 = *(_QWORD *)(a1 + 104);
    v6 = *(_QWORD *)(a1 + 112);
    v7 = *(_QWORD *)(a1 + 120);
    v8 = *(_QWORD *)(a1 + 128);
    v10 = *(_DWORD *)(a1 + 64);
    v9 = *(_DWORD *)(a1 + 68);
    v11 = *(_DWORD *)(a1 + 72);
    v12 = *(_DWORD *)(a1 + 76);
    v13 = *(_QWORD *)(a1 + 80);
    v14 = *(_QWORD *)(a1 + 88);
    if (*(_BYTE *)(a1 + 136))
      v15 = 84;
    else
      v15 = 70;
    if (*(_BYTE *)(a1 + 137))
      v16 = 84;
    else
      v16 = 70;
    if (*(_BYTE *)(a1 + 138))
      v17 = 84;
    else
      v17 = 70;
    v18 = 134286849;
    v19 = v14;
    v20 = 2049;
    v21 = v4;
    v22 = 2049;
    v23 = v5;
    v24 = 2049;
    v25 = v6;
    v26 = 2049;
    v27 = v7;
    v28 = 2049;
    v29 = v8;
    v30 = 1024;
    v31 = v9;
    v32 = 1024;
    v33 = v11;
    v34 = 1024;
    v35 = v10;
    v36 = 1024;
    v37 = v12;
    v38 = 2048;
    v39 = v13;
    v40 = 1024;
    v41 = v15;
    v42 = 1024;
    v43 = v16;
    v44 = 1024;
    v45 = v17;
    _os_log_debug_impl(&dword_2390FD000, v3, OS_LOG_TYPE_DEBUG, "#gpsd,#supl,#process,sendSuplStatusReport,Lat,%{private}.7f,Long,%{private}.7f,Alt,%{private}.2f,SemMaj,%{private}.f,SemMin,%{private}.f,UncAlt,%{private}.f,PosMethod,%u,Status,%u,SessionId,%u,endCause,%u,HACC,%f,ephProvided,%c,refTimeProvided,%c,refLocProvided,%c", (uint8_t *)&v18, 0x72u);
  }
}

uint64_t sub_2391BF504(uint64_t a1, uint64_t a2)
{
  return sub_239101254(a1 + 32, a2 + 32);
}

_QWORD *sub_2391BF510(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 56);
  if (result == v1)
  {
    v3 = 4;
    result = v1;
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

BOOL sub_2391BF544(char **a1)
{
  int64_t v2;
  NSObject *v3;
  uint64_t v4;
  _BOOL8 result;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int64_t v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = a1[1] - *a1;
  v3 = qword_2542CF618;
  if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134217984;
    v12 = v2;
    _os_log_impl(&dword_2390FD000, v3, OS_LOG_TYPE_DEFAULT, "#gpsd,#process,validateSuplInit,SUPL INIT len,%zd", (uint8_t *)&v11, 0xCu);
  }
  if ((unint64_t)(v2 - 0x10000) > 0xFFFFFFFFFFFF0004)
  {
    v9 = __rev16(*(unsigned __int16 *)*a1);
    if (v2 == v9)
      return 1;
    v10 = qword_2542CF618;
    result = os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR);
    if (result)
    {
      v11 = 134218240;
      v12 = v2;
      v13 = 1024;
      v14 = v9;
      v6 = "#gpsd,#supl,#in,validateSuplInit,SuplInit Len,%zd mismatches SuplInitHadrLen,%u";
      v7 = v10;
      v8 = 18;
      goto LABEL_11;
    }
  }
  else
  {
    v4 = qword_2542CF618;
    result = os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR);
    if (result)
    {
      v11 = 134217984;
      v12 = v2;
      v6 = "#gpsd,#supl,#in,validateSuplInit,Invalid SUPL INIT message length,%zd";
      v7 = v4;
      v8 = 12;
LABEL_11:
      _os_log_error_impl(&dword_2390FD000, v7, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v11, v8);
      return 0;
    }
  }
  return result;
}

void sub_2391BF6C0(char *__s1, unint64_t *a2)
{
  char *v3;
  int v4;
  _BYTE *v5;
  unint64_t v6;
  unint64_t v7;
  _BYTE *v8;
  unint64_t v9;
  unint64_t v10;
  size_t v11;
  char *v12;
  char *v13;
  _BYTE *v14;
  _BYTE *v15;
  _BYTE *v16;
  char v17;
  NSObject *v19;
  int v20;
  NSObject *v21;
  int v22;
  int v23;
  uint64_t v24;

  v3 = __s1;
  v24 = *MEMORY[0x24BDAC8D0];
  if (__s1 && (v4 = strnlen(__s1, 0x100uLL), (v4 & 0xFFFFFEFF) == 0))
  {
    v21 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      v22 = 67109120;
      v23 = v4;
      _os_log_error_impl(&dword_2390FD000, v21, OS_LOG_TYPE_ERROR, "#gpsd,#supl,convertStringIPtoVect,Wrong IP address len,%u", (uint8_t *)&v22, 8u);
    }
  }
  else
  {
    v5 = (_BYTE *)a2[1];
    do
    {
      v6 = a2[2];
      if ((unint64_t)v5 >= v6)
      {
        v7 = *a2;
        v8 = &v5[-*a2];
        v9 = (unint64_t)(v8 + 1);
        if ((uint64_t)(v8 + 1) < 0)
          sub_23910165C();
        v10 = v6 - v7;
        if (2 * v10 > v9)
          v9 = 2 * v10;
        if (v10 >= 0x3FFFFFFFFFFFFFFFLL)
          v11 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v11 = v9;
        if (v11)
          v12 = (char *)operator new(v11);
        else
          v12 = 0;
        v13 = &v8[(_QWORD)v12];
        v14 = &v8[(_QWORD)v12];
        *v14 = 0;
        v15 = v14 + 1;
        if (v5 != (_BYTE *)v7)
        {
          v16 = &v5[~v7];
          do
          {
            v17 = *--v5;
            (v16--)[(_QWORD)v12] = v17;
          }
          while (v5 != (_BYTE *)v7);
          v5 = (_BYTE *)*a2;
          v13 = v12;
        }
        *a2 = (unint64_t)v13;
        a2[1] = (unint64_t)v15;
        a2[2] = (unint64_t)&v12[v11];
        if (v5)
          operator delete(v5);
        v5 = v15;
      }
      else
      {
        *v5++ = 0;
      }
      a2[1] = (unint64_t)v5;
    }
    while (*v3++);
    v19 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (_DWORD)v5 - *(_DWORD *)a2;
      v22 = 67109120;
      v23 = v20;
      _os_log_impl(&dword_2390FD000, v19, OS_LOG_TYPE_DEFAULT, "#gpsd,#supl,convertStringIPtoVect,IPVectorSize,%u", (uint8_t *)&v22, 8u);
    }
  }
}

void sub_2391BF8B4(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;
  void **v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    goto LABEL_13;
  v4 = strnlen((const char *)a1, 0x100uLL);
  if ((v4 & 0xFFFFFEFF) == 0)
  {
    v7 = qword_2542CF618;
    if (!os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
      return;
    LODWORD(v12) = 67109120;
    DWORD1(v12) = v4;
    v8 = "#gpsd,#supl,length of SLP address ,%u";
    v9 = v7;
    goto LABEL_15;
  }
  v5 = *(_DWORD *)(a1 + 256);
  if (v5 == 1 || v5 == 2)
  {
    *(_DWORD *)(a2 + 4) = v5;
    sub_2391BF6C0((char *)a1, (unint64_t *)(a2 + 32));
LABEL_12:
    *(_BYTE *)a2 = 1;
    goto LABEL_13;
  }
  if (v5 == 3)
  {
    *(_DWORD *)(a2 + 4) = 3;
    sub_2391011A4(&v12, (char *)a1);
    v6 = (void **)(a2 + 8);
    if (*(char *)(a2 + 31) < 0)
      operator delete(*v6);
    *(_OWORD *)v6 = v12;
    *(_QWORD *)(a2 + 24) = v13;
    goto LABEL_12;
  }
LABEL_13:
  v10 = qword_2542CF618;
  if (!os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
    return;
  v11 = *(_DWORD *)(a2 + 4);
  LODWORD(v12) = 67109120;
  DWORD1(v12) = v11;
  v8 = "#gpsd,#supl,SLPType,%u";
  v9 = v10;
LABEL_15:
  _os_log_impl(&dword_2390FD000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, 8u);
}

uint64_t sub_2391BFA2C(uint64_t a1, char **a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  BOOL v7;
  uint64_t v8;
  int v9;
  int v10;
  unsigned __int16 v11;
  int v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  void *__p;
  void *v24;
  uint64_t v25;
  uint8_t v26[4];
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  uint8_t buf[8];
  char v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[25];
  _DWORD v52[66];
  _DWORD v53[66];
  char v54;
  int v55;
  __int16 v56;
  __int16 v57;
  int v58;
  unsigned __int8 v59;
  int v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  if (sub_2391BF544(a2))
  {
    v54 = 0;
    v55 = 0;
    v56 = 0;
    *(_QWORD *)buf = 0;
    v35 = 0;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    memset(v51, 0, sizeof(v51));
    memset(v52, 0, 261);
    memset(v53, 0, 261);
    v57 = -1;
    v58 = -1;
    v59 = -1;
    v60 = 0;
    __p = 0;
    v24 = 0;
    v25 = 0;
    if (&__p != (void **)a2)
      sub_239107FF0(&__p, *a2, a2[1], a2[1] - *a2);
    v5 = sub_2391B7D4C();
    v6 = sub_2391B9FE4(v5, 0, (uint64_t)&__p, (uint64_t)buf);
    if (v6)
      v7 = 1;
    else
      v7 = buf[4] == 0;
    v8 = !v7;
    if (v7)
    {
      v18 = qword_2542CF618;
      if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v26 = 67109120;
        v27 = v6;
        _os_log_error_impl(&dword_2390FD000, v18, OS_LOG_TYPE_ERROR, "#gpsd,#supl,SUPL INIT Decode failed %u", v26, 8u);
      }
      goto LABEL_36;
    }
    sub_2391BF370(v36, (_DWORD *)a3);
    if (HIBYTE(v56))
    {
      *(_BYTE *)(a3 + 4) = 1;
      v9 = v57;
      *(_BYTE *)(a3 + 5) = v57;
      v10 = HIBYTE(v57);
      *(_BYTE *)(a3 + 6) = HIBYTE(v57);
      v11 = v58;
      *(_WORD *)(a3 + 8) = v58;
      v12 = v59;
      *(_BYTE *)(a3 + 10) = v59;
      v13 = qword_2542CF618;
      if (!os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
      *(_DWORD *)v26 = 67109888;
      v27 = v9;
      v28 = 1024;
      v29 = v10;
      v30 = 1024;
      v31 = v11;
      v32 = 1024;
      v33 = v12;
      v14 = "#gpsd,#supl,coming from supl,HAcc,%u,VAcc,%u,LocAge,%u,Delay,%u";
      v15 = v13;
      v16 = 26;
    }
    else
    {
      v19 = qword_2542CF618;
      if (!os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
      *(_WORD *)v26 = 0;
      v14 = "#gpsd,#supl,No Qop vals";
      v15 = v19;
      v16 = 2;
    }
    _os_log_impl(&dword_2390FD000, v15, OS_LOG_TYPE_DEFAULT, v14, v26, v16);
LABEL_21:
    if (v53[64])
      sub_2391BF8B4((uint64_t)v53, a3 + 16);
    if (v54)
    {
      *(_WORD *)(a3 + 72) = 257;
    }
    else
    {
      v20 = qword_2542CF618;
      if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_2390FD000, v20, OS_LOG_TYPE_DEFAULT, "#gpsd,#supl,Not an emergency session", v26, 2u);
      }
    }
    if (v52[64])
      sub_2391BF8B4((uint64_t)v52, a3 + 80);
    if (v60)
    {
      if (v60 == 1)
      {
        v21 = 2;
        goto LABEL_35;
      }
      if (v60 == 2)
      {
        v21 = 1;
LABEL_35:
        *(_DWORD *)(a3 + 136) = v21;
LABEL_36:
        if (__p)
        {
          v24 = __p;
          operator delete(__p);
        }
        return v8;
      }
    }
    *(_DWORD *)(a3 + 136) = 0;
    goto LABEL_36;
  }
  v17 = qword_2542CF618;
  v8 = 0;
  if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2390FD000, v17, OS_LOG_TYPE_DEFAULT, "#gpsd,#supl,#input,validate SUPL INIT failed", buf, 2u);
    return 0;
  }
  return v8;
}

void sub_2391BFE0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_2391BFE2C(uint64_t a1, uint64_t a2, __int16 *a3, _DWORD *a4)
{
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  uint32_t v14;
  NSObject *v15;
  _QWORD v16[5];
  void *v17;
  void *v18;
  uint64_t v19;
  __int16 v20;
  __int128 v21;
  uint64_t v22;
  char v23;
  __int128 __p;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  _DWORD *v28;
  __int16 v29;
  __int128 v30;
  uint64_t v31;
  char v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint8_t buf[4];
  unint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  *a4 = 1;
  v37 = 0;
  v38 = 0;
  v39 = 0;
  sub_239189290(&v37, *(const void **)a2, *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 8) - *(_QWORD *)a2);
  v29 = *a3;
  if (*((char *)a3 + 31) < 0)
  {
    sub_2391B37EC(&v30, *((void **)a3 + 1), *((_QWORD *)a3 + 2));
  }
  else
  {
    v30 = *(_OWORD *)(a3 + 4);
    v31 = *((_QWORD *)a3 + 3);
  }
  v32 = *((_BYTE *)a3 + 32);
  if (*((char *)a3 + 63) < 0)
  {
    sub_2391B37EC(&v33, *((void **)a3 + 5), *((_QWORD *)a3 + 6));
  }
  else
  {
    v33 = *(_OWORD *)(a3 + 20);
    v34 = *((_QWORD *)a3 + 7);
  }
  v35 = *((_OWORD *)a3 + 4);
  v36 = *((_QWORD *)a3 + 10);
  v7 = HIBYTE(v31);
  v8 = *((_QWORD *)&v30 + 1);
  if (v31 < 0)
    v7 = *((_QWORD *)&v30 + 1);
  if (!v7)
  {
    *a4 = 4;
    v12 = qword_2542CF618;
    if (!os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_WORD *)buf = 0;
    v11 = "#gpsd,#supl,#input,SLP Address not provisioned";
    goto LABEL_22;
  }
  if (v34 >= 0)
    v9 = HIBYTE(v34);
  else
    v9 = *((_QWORD *)&v33 + 1);
  if (!v9)
  {
    *a4 = 4;
    v12 = qword_2542CF618;
    if (!os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_WORD *)buf = 0;
    v11 = "#gpsd,#supl,#input,IMSI not provisioned";
    goto LABEL_22;
  }
  if (SHIBYTE(v31) < 0 && *((_QWORD *)&v30 + 1) >= 0x100uLL)
  {
    *a4 = 4;
    v10 = qword_2542CF618;
    if (!os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_DWORD *)buf = 134217984;
    v41 = v8;
    v11 = "#gpsd,#supl,#input,Invalid SLP Address length,%lu";
LABEL_26:
    v13 = v10;
    v14 = 12;
    goto LABEL_27;
  }
  if (v9 >= 0x10)
  {
    *a4 = 4;
    v10 = qword_2542CF618;
    if (!os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_DWORD *)buf = 134217984;
    v41 = v9;
    v11 = "#gpsd,#supl,#input,Invalid IMSI Len,%lu";
    goto LABEL_26;
  }
  if (!sub_2391BF544(&v37))
  {
    *a4 = 4;
    v12 = qword_2542CF618;
    if (!os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_WORD *)buf = 0;
    v11 = "#gpsd,#supl,#input,Invalide SUPL INIT";
LABEL_22:
    v13 = v12;
    v14 = 2;
LABEL_27:
    _os_log_error_impl(&dword_2390FD000, v13, OS_LOG_TYPE_ERROR, v11, buf, v14);
    goto LABEL_43;
  }
  v15 = *(NSObject **)(a1 + 88);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3321888768;
  v16[2] = sub_2391C029C;
  v16[3] = &unk_250ABD1B8;
  v16[4] = a1;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  sub_239189290(&v17, v37, (uint64_t)v38, v38 - v37);
  v20 = v29;
  if (SHIBYTE(v31) < 0)
  {
    sub_2391B37EC(&v21, (void *)v30, *((unint64_t *)&v30 + 1));
  }
  else
  {
    v21 = v30;
    v22 = v31;
  }
  v23 = v32;
  if (SHIBYTE(v34) < 0)
  {
    sub_2391B37EC(&__p, (void *)v33, *((unint64_t *)&v33 + 1));
  }
  else
  {
    __p = v33;
    v25 = v34;
  }
  v26 = v35;
  v27 = v36;
  v28 = a4;
  dispatch_async(v15, v16);
  if (SHIBYTE(v25) < 0)
    operator delete((void *)__p);
  if (SHIBYTE(v22) < 0)
    operator delete((void *)v21);
  if (v17)
  {
    v18 = v17;
    operator delete(v17);
  }
LABEL_43:
  if (SHIBYTE(v34) < 0)
    operator delete((void *)v33);
  if (SHIBYTE(v31) < 0)
    operator delete((void *)v30);
  if (v37)
  {
    v38 = v37;
    operator delete(v37);
  }
}

void sub_2391C0220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,void *a33,uint64_t a34,int a35,__int16 a36,char a37,char a38)
{
  uint64_t v38;
  void *v40;

  if (a23 < 0)
    operator delete(__p);
  if (a14)
    operator delete(a14);
  sub_239105438((uint64_t)&a32);
  v40 = *(void **)(v38 - 120);
  if (v40)
  {
    *(_QWORD *)(v38 - 112) = v40;
    operator delete(v40);
  }
  _Unwind_Resume(a1);
}

void sub_2391C029C(uint64_t a1)
{
  NSObject *v2;
  int v3;
  _QWORD *v4;
  int v5;
  int v6;
  _QWORD *v7;
  int v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  char *v13;
  _BYTE *v14;
  char *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  void **v20;
  unsigned int v21;
  uint64_t v22;
  char v23;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  int v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *__p[2];
  uint64_t v35;
  uint8_t v36[4];
  int v37;
  uint8_t v38[4];
  int v39;
  void *v40;
  _BYTE *v41;
  uint64_t v42;
  uint8_t buf[4];
  _BYTE v44[20];
  _BYTE v45[10];
  __int16 v46;
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v2 = qword_2542CF618;
  if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_DWORD *)(a1 + 48) - *(_DWORD *)(a1 + 40);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v44 = v3;
    _os_log_impl(&dword_2390FD000, v2, OS_LOG_TYPE_DEFAULT, "#gpsd,#supl,#input,SUPL INIT Len,%u", buf, 8u);
    v2 = qword_2542CF618;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (_QWORD *)(a1 + 72);
    if (*(char *)(a1 + 95) < 0)
      v4 = (_QWORD *)*v4;
    v5 = *(unsigned __int16 *)(a1 + 64);
    if (*(_BYTE *)(a1 + 96))
      v6 = 84;
    else
      v6 = 70;
    v7 = (_QWORD *)(a1 + 104);
    if (*(char *)(a1 + 127) < 0)
      v7 = (_QWORD *)*v7;
    if (*(_BYTE *)(a1 + 136))
      v8 = 84;
    else
      v8 = 70;
    *(_DWORD *)buf = 136381699;
    *(_QWORD *)v44 = v4;
    *(_WORD *)&v44[8] = 1025;
    *(_DWORD *)&v44[10] = v5;
    *(_WORD *)&v44[14] = 1025;
    *(_DWORD *)&v44[16] = v6;
    *(_WORD *)v45 = 2081;
    *(_QWORD *)&v45[2] = v7;
    v46 = 1025;
    v47 = v8;
    _os_log_impl(&dword_2390FD000, v2, OS_LOG_TYPE_DEFAULT, "#gpsd,#supl,#input,SLP,%{private}.s,%{private}.u,MSA,%{private}.c,IMSI,%{private}.s,HeloEnabled,%{private}.c", buf, 0x28u);
  }
  buf[0] = 0;
  *(_QWORD *)v45 = 0;
  *(_OWORD *)&v44[4] = 0uLL;
  *(_WORD *)&v45[8] = *(_WORD *)(a1 + 64);
  std::string::operator=((std::string *)&v44[4], (const std::string *)(a1 + 72));
  std::string::operator=((std::string *)&v44[4], (const std::string *)(a1 + 72));
  v9 = *(unsigned __int16 *)&v45[8];
  if (*(unsigned __int16 *)&v45[8] - 7277 <= 0xFFFFFFFD)
  {
    v10 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v38 = 67109120;
      v39 = v9;
      _os_log_impl(&dword_2390FD000, v10, OS_LOG_TYPE_DEFAULT, "#gpsd,#supl,#input,Non Standard Port, %u", v38, 8u);
    }
  }
  buf[0] = 2;
  v11 = sub_2391BC46C();
  sub_2391BC72C(v11, 0, (uint64_t)buf);
  v12 = qword_2542CF618;
  if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v38 = 0;
    _os_log_impl(&dword_2390FD000, v12, OS_LOG_TYPE_DEFAULT, "#gpsd,#supl,#input,SetSlpInfo done", v38, 2u);
  }
  v40 = 0;
  v41 = 0;
  v42 = 0;
  *(_WORD *)v38 = 1;
  if (*(char *)(a1 + 127) < 0)
  {
    sub_2391B37EC(__p, *(void **)(a1 + 104), *(_QWORD *)(a1 + 112));
    v13 = (char *)v40;
    v14 = v41;
  }
  else
  {
    v13 = 0;
    v14 = 0;
    *(_OWORD *)__p = *(_OWORD *)(a1 + 104);
    v35 = *(_QWORD *)(a1 + 120);
  }
  if (v35 >= 0)
    v15 = (char *)HIBYTE(v35);
  else
    v15 = (char *)__p[1];
  LOBYTE(v31) = -1;
  v16 = v14 - v13;
  if (v16 > 7)
  {
    if (v16 != 8)
      v41 = v13 + 8;
  }
  else
  {
    sub_2391BA62C(&v40, 8 - v16, &v31);
  }
  if (v15)
  {
    v17 = 0;
    v18 = 0;
    v19 = v15 - 1;
    while (1)
    {
      if (SHIBYTE(v35) < 0)
      {
        v20 = (void **)__p[0];
        v21 = *((unsigned __int8 *)__p[0] + v18) - 48;
        if (v21 >= 0xA)
          LOBYTE(v21) = -1;
        if (v19 != (char *)v18)
        {
          v22 = v18 + 1;
LABEL_42:
          v23 = *((_BYTE *)v20 + v22) - 48;
          if ((v23 & 0xFEu) >= 0xA)
            v23 = -1;
          goto LABEL_44;
        }
      }
      else
      {
        v20 = __p;
        v21 = *((unsigned __int8 *)__p + v18) - 48;
        if (v21 >= 0xA)
          LOBYTE(v21) = -1;
        if (v19 != (char *)v18)
        {
          v22 = v18 | 1;
          goto LABEL_42;
        }
      }
      v23 = -1;
LABEL_44:
      *((_BYTE *)v40 + v17) = v21 | (16 * v23);
      v18 += 2;
      if (v18 < (unint64_t)v15 && v17++ < 7)
        continue;
      break;
    }
  }
  if (SHIBYTE(v35) < 0)
    operator delete(__p[0]);
  v25 = sub_2391B7D4C();
  sub_2391B7F00(v25, 0, (uint64_t)v38);
  v26 = qword_2542CF618;
  if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v31) = 0;
    _os_log_impl(&dword_2390FD000, v26, OS_LOG_TYPE_DEFAULT, "#gpsd,#supl,#in,SetSETInfo done", (uint8_t *)&v31, 2u);
  }
  v31 = 0;
  v32 = 0;
  v33 = 0;
  if (&v31 != (void **)(a1 + 40))
    sub_239107FF0(&v31, *(char **)(a1 + 40), *(char **)(a1 + 48), *(_QWORD *)(a1 + 48) - *(_QWORD *)(a1 + 40));
  v27 = sub_2391B7D4C();
  v28 = sub_2391B835C(v27, 0, (const void **)&v31, 1u);
  if (v28)
  {
    **(_DWORD **)(a1 + 152) = 7;
    v29 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v36 = 67109120;
      v37 = v28;
      _os_log_error_impl(&dword_2390FD000, v29, OS_LOG_TYPE_ERROR, "#gpsd,#supl,ProcessSuplMtlrMessage returned error %u", v36, 8u);
    }
  }
  else
  {
    v30 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v36 = 0;
      _os_log_impl(&dword_2390FD000, v30, OS_LOG_TYPE_DEFAULT, "#gpsd,#supl,ProcessSuplMtlrMessage success", v36, 2u);
    }
  }
  if (v31)
  {
    v32 = v31;
    operator delete(v31);
  }
  if (v40)
  {
    v41 = v40;
    operator delete(v40);
  }
  if ((v45[7] & 0x80000000) != 0)
    operator delete(*(void **)&v44[4]);
}

void sub_2391C078C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24)
{
  uint64_t v24;

  if (a18 < 0)
    operator delete(__p);
  if (a23)
    operator delete(a23);
  if (*(char *)(v24 - 49) < 0)
    operator delete(*(void **)(v24 - 72));
  _Unwind_Resume(exception_object);
}

__n128 sub_2391C07F0(__n128 *a1, uint64_t a2)
{
  __int8 *v4;
  __int128 v5;
  unsigned __int8 *v6;
  __int128 v7;
  __n128 result;

  a1[2].n128_u64[1] = 0;
  a1[3].n128_u64[0] = 0;
  v4 = &a1[2].n128_i8[8];
  a1[3].n128_u64[1] = 0;
  sub_239189290(&a1[2].n128_u64[1], *(const void **)(a2 + 40), *(_QWORD *)(a2 + 48), *(_QWORD *)(a2 + 48) - *(_QWORD *)(a2 + 40));
  *((_WORD *)v4 + 12) = *(_WORD *)(a2 + 64);
  if (*(char *)(a2 + 95) < 0)
  {
    sub_2391B37EC(v4 + 32, *(void **)(a2 + 72), *(_QWORD *)(a2 + 80));
  }
  else
  {
    v5 = *(_OWORD *)(a2 + 72);
    *((_QWORD *)v4 + 6) = *(_QWORD *)(a2 + 88);
    *((_OWORD *)v4 + 2) = v5;
  }
  a1[6].n128_u8[0] = *(_BYTE *)(a2 + 96);
  v6 = &a1[6].n128_u8[8];
  if (*(char *)(a2 + 127) < 0)
  {
    sub_2391B37EC(v6, *(void **)(a2 + 104), *(_QWORD *)(a2 + 112));
  }
  else
  {
    v7 = *(_OWORD *)(a2 + 104);
    a1[7].n128_u64[1] = *(_QWORD *)(a2 + 120);
    *(_OWORD *)v6 = v7;
  }
  result = *(__n128 *)(a2 + 128);
  a1[9].n128_u64[0] = *(_QWORD *)(a2 + 144);
  a1[8] = result;
  return result;
}

void sub_2391C08B4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void **v3;
  void *v5;

  if (*(char *)(v1 + 95) < 0)
    operator delete(*v3);
  v5 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 48) = v5;
    operator delete(v5);
  }
  _Unwind_Resume(exception_object);
}

void sub_2391C08E8(uint64_t a1)
{
  void *v2;

  if (*(char *)(a1 + 127) < 0)
    operator delete(*(void **)(a1 + 104));
  if (*(char *)(a1 + 95) < 0)
    operator delete(*(void **)(a1 + 72));
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    *(_QWORD *)(a1 + 48) = v2;
    operator delete(v2);
  }
}

uint64_t sub_2391C093C(uint64_t a1, unint64_t *a2, unsigned int a3, unsigned int a4, unsigned int a5, int a6)
{
  unsigned int v8;
  unsigned int v9;
  BOOL v11;
  uint64_t v12;
  _BYTE *v15;
  _BYTE **v16;
  unint64_t v17;
  NSObject *v18;
  unsigned int v20;
  unsigned int v21;
  char v22;
  unsigned int v23;
  int v24;
  char v25;
  int v26;
  unsigned int v27;
  _BYTE *v28;
  unint64_t v29;
  unsigned int v31;
  uint8_t buf[4];
  unsigned int v33;
  __int16 v34;
  unsigned int v35;
  __int16 v36;
  unsigned int v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v8 = a4;
  v9 = a3;
  v40 = *MEMORY[0x24BDAC8D0];
  v11 = a3 < 0x3E8 && a4 < 0x3E8 && a5 >> 28 == 0;
  v12 = v11;
  if (v11)
  {
    v15 = *(_BYTE **)(a1 + 56);
    v16 = (_BYTE **)(a1 + 56);
    v17 = *(_QWORD *)(a1 + 64) - (_QWORD)v15;
    v31 = v12;
    if (v17 > 3)
    {
      if (v17 != 4)
        *(_QWORD *)(a1 + 64) = v15 + 4;
    }
    else
    {
      sub_239101670((unint64_t *)(a1 + 56), 4 - v17);
      v15 = *v16;
    }
    v20 = 0;
    *v15 = a5 >> 20;
    *(_BYTE *)(*(_QWORD *)(a1 + 56) + 1) = a5 >> 12;
    *(_BYTE *)(*(_QWORD *)(a1 + 56) + 2) = a5 >> 4;
    *(_BYTE *)(*(_QWORD *)(a1 + 56) + 3) = 16 * a5;
    *(_BYTE *)(*(_QWORD *)(a1 + 56) + 3) >>= 4;
    do
    {
      do
      {
        v21 = v20;
        v22 = v9;
        v23 = (unsigned __int16)v9;
        LOWORD(v9) = (unsigned __int16)v9 / 0xAu;
        buf[0] = v22 - 10 * v9;
        sub_2391C298C(a1 + 8, *(char **)(a1 + 8), (char *)buf);
        v20 = v21 + 1;
      }
      while (v23 > 9);
    }
    while (v21 < 2);
    v24 = 0;
    do
    {
      do
      {
        v25 = v8;
        v26 = v24;
        v27 = (unsigned __int16)v8;
        LOWORD(v8) = (unsigned __int16)v8 / 0xAu;
        buf[0] = v25 - 10 * v8;
        sub_2391C298C(a1 + 32, *(char **)(a1 + 32), (char *)buf);
        v24 = v26 - 1;
      }
      while (v27 > 9);
    }
    while (!v26);
    *(_DWORD *)a1 = 1;
    v28 = (_BYTE *)*a2;
    v29 = a2[1] - *a2;
    if (v29 > 1)
    {
      v12 = v31;
      if (v29 != 2)
        a2[1] = (unint64_t)(v28 + 2);
    }
    else
    {
      sub_239101670(a2, 2 - v29);
      v28 = (_BYTE *)*a2;
      v12 = v31;
    }
    *v28 = BYTE1(a6);
    *(_BYTE *)(*a2 + 1) = a6;
  }
  else
  {
    v18 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109888;
      v33 = v9;
      v34 = 1024;
      v35 = v8;
      v36 = 1024;
      v37 = a5;
      v38 = 1024;
      v39 = a6;
      _os_log_error_impl(&dword_2390FD000, v18, OS_LOG_TYPE_ERROR, "#gpsd,#supl,Either MCC %d, MNC %d, CID %d, TAC %d is not in range", buf, 0x1Au);
    }
  }
  return v12;
}

_QWORD *sub_2391C0BBC(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)a1[11];
  if (v2)
  {
    a1[12] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[8];
  if (v3)
  {
    a1[9] = v3;
    operator delete(v3);
  }
  v4 = (void *)a1[5];
  if (v4)
  {
    a1[6] = v4;
    operator delete(v4);
  }
  v5 = (void *)a1[2];
  if (v5)
  {
    a1[3] = v5;
    operator delete(v5);
  }
  return a1;
}

void sub_2391C0C1C(uint64_t a1, int *a2)
{
  NSObject *v3;
  _QWORD v4[4];
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *__p;
  void *v13;
  uint64_t v14;

  v3 = *(NSObject **)(a1 + 88);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3321888768;
  v4[2] = sub_2391C0D60;
  v4[3] = &unk_250ABD1E8;
  v5 = *a2;
  v7 = 0;
  v8 = 0;
  v6 = 0;
  sub_239105CA8(&v6, *((const void **)a2 + 1), *((_QWORD *)a2 + 2), 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((_QWORD *)a2 + 2) - *((_QWORD *)a2 + 1)) >> 2));
  v9 = 0;
  v10 = 0;
  v11 = 0;
  sub_239105DE4(&v9, *((const void **)a2 + 4), *((_QWORD *)a2 + 5), (uint64_t)(*((_QWORD *)a2 + 5) - *((_QWORD *)a2 + 4)) >> 4);
  __p = 0;
  v13 = 0;
  v14 = 0;
  sub_239105ED0(&__p, *((const void **)a2 + 7), *((_QWORD *)a2 + 8), (uint64_t)(*((_QWORD *)a2 + 8) - *((_QWORD *)a2 + 7)) >> 5);
  dispatch_async(v3, v4);
  if (__p)
  {
    v13 = __p;
    operator delete(__p);
  }
  if (v9)
  {
    v10 = v9;
    operator delete(v9);
  }
  if (v6)
  {
    v7 = v6;
    operator delete(v6);
  }
}

void sub_2391C0D2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  if (__p)
    operator delete(__p);
  if (a14)
    operator delete(a14);
  _Unwind_Resume(exception_object);
}

uint64_t sub_2391C0D60(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _DWORD *v6;
  int v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  NSObject *v17;
  uint64_t v18;
  const char *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  unint64_t v29;
  unint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  const char *v36;
  NSObject *v37;
  unsigned int v38;
  NSObject *v39;
  int v40;
  NSObject *v41;
  NSObject *v42;
  uint64_t v43;
  int v44;
  int v45;
  int v46;
  uint64_t v47;
  unsigned int v48;
  NSObject *v49;
  NSObject *v50;
  int v51;
  unsigned int v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char *v60;
  char *v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  int64x2_t v72;
  uint64_t v73;
  NSObject *v74;
  uint64_t v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  unsigned int v83;
  int v84;
  NSObject *v85;
  NSObject *v86;
  uint32_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  NSObject *v92;
  uint64_t v93;
  int64x2_t *v94;
  _QWORD *v95;
  _QWORD *v96;
  _QWORD *v97;
  _QWORD *v98;
  char v99[8];
  uint64_t v100;
  _QWORD v101[6];
  int v102;
  uint64_t v103;
  uint64_t v104;
  __int16 v105;
  __int16 v106;
  uint64_t v107;
  uint64_t v108;
  _QWORD v109[4];
  char *v110;
  char v111;
  void *__p;
  char *v113;
  uint64_t v114;
  _BYTE v115[32];
  _BYTE v116[10];
  __int16 v117;
  int v118;
  __int16 v119;
  int v120;
  __int16 v121;
  int v122;
  uint8_t buf[4];
  unsigned int v124;
  _BYTE v125[116];
  uint64_t v126;

  v126 = *MEMORY[0x24BDAC8D0];
  v99[0] = 0;
  v100 = 0;
  LODWORD(v101[0]) = -1;
  *(_QWORD *)((char *)v101 + 4) = 0;
  memset((char *)&v101[2] + 4, 0, 13);
  *(_QWORD *)((char *)&v101[1] + 4) = 0;
  v101[5] = 0;
  v102 = 0;
  v103 = -1;
  v104 = 0;
  v105 = 0;
  v106 = -1;
  v107 = 0;
  v108 = 0;
  v109[0] = 0;
  *(_QWORD *)((char *)v109 + 6) = 0;
  v109[2] = 0;
  v109[3] = 0;
  v110 = 0;
  v111 = 1;
  v2 = *(_DWORD *)(a1 + 32);
  if (v2 != 5)
  {
    if (v2 == 2)
    {
      v99[0] = 2;
      v11 = *(_QWORD *)(a1 + 88);
      v12 = *(_QWORD *)(a1 + 96) - v11;
      if (v12)
      {
        v13 = v12 >> 5;
        if (v13 <= 1)
          v13 = 1;
        while (!*(_BYTE *)v11)
        {
          v11 += 32;
          if (!--v13)
            goto LABEL_16;
        }
        v16 = *(unsigned __int16 *)(v11 + 2);
        LOWORD(v103) = *(_WORD *)(v11 + 2);
        v14 = *(unsigned __int16 *)(v11 + 4);
        WORD1(v103) = *(_WORD *)(v11 + 4);
        v15 = *(_DWORD *)(v11 + 12);
        HIDWORD(v103) = v15;
        v83 = *(unsigned __int16 *)(v11 + 16);
        if (v83 > 0x1FF)
        {
          v92 = qword_2542CF618;
          if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            v124 = v83;
            _os_log_error_impl(&dword_2390FD000, v92, OS_LOG_TYPE_ERROR, "#gpsd,#supl,,Invalid PSC,%u", buf, 8u);
            v16 = (unsigned __int16)v103;
            v14 = WORD1(v103);
            v15 = HIDWORD(v103);
          }
        }
        else
        {
          v106 = *(_WORD *)(v11 + 16);
        }
      }
      else
      {
LABEL_16:
        v14 = 0xFFFF;
        v15 = -1;
        v16 = 0xFFFF;
      }
      v17 = qword_2542CF618;
      if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109632;
        v124 = v16;
        *(_WORD *)v125 = 1024;
        *(_DWORD *)&v125[2] = v14;
        *(_WORD *)&v125[6] = 1024;
        *(_DWORD *)&v125[8] = v15;
        _os_log_impl(&dword_2390FD000, v17, OS_LOG_TYPE_DEFAULT, "#gpsd,#supl,WCDMA Serving,%u,%u,%u", buf, 0x14u);
        v16 = (unsigned __int16)v103;
        v14 = WORD1(v103);
        v15 = HIDWORD(v103);
      }
      if (v16 <= 0x3E7 && v14 <= 0x3E7 && !(v15 >> 28))
        goto LABEL_119;
      v18 = qword_2542CF618;
      if (!os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
        goto LABEL_119;
      *(_WORD *)buf = 0;
      v19 = "#gpsd,#supl,Error in WCDMA Serving Cell Info";
    }
    else
    {
      if (v2 != 1)
        goto LABEL_119;
      v99[0] = 1;
      v101[0] = -1;
      v3 = *(_QWORD *)(a1 + 64);
      v4 = *(_QWORD *)(a1 + 72) - v3;
      if (v4)
      {
        v5 = v4 >> 4;
        if (v5 <= 1)
          v5 = 1;
        v6 = (_DWORD *)(v3 + 8);
        while (!*((_BYTE *)v6 - 8))
        {
          v6 += 4;
          if (!--v5)
            goto LABEL_10;
        }
        LOBYTE(v101[4]) = -1;
        v10 = *((unsigned __int16 *)v6 - 3);
        LOWORD(v101[0]) = *((_WORD *)v6 - 3);
        v9 = *((unsigned __int16 *)v6 - 2);
        WORD1(v101[0]) = *((_WORD *)v6 - 2);
        v8 = (unsigned __int16)*v6;
        WORD2(v101[0]) = *v6;
        v84 = v6[1];
        v7 = (unsigned __int16)v84;
        HIWORD(v101[0]) = v84;
      }
      else
      {
LABEL_10:
        v7 = 0xFFFF;
        v8 = 0xFFFF;
        v9 = 0xFFFF;
        v10 = 0xFFFF;
      }
      v85 = qword_2542CF618;
      if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67175425;
        v124 = v10;
        *(_WORD *)v125 = 1025;
        *(_DWORD *)&v125[2] = v9;
        *(_WORD *)&v125[6] = 1025;
        *(_DWORD *)&v125[8] = v8;
        *(_WORD *)&v125[12] = 1025;
        *(_DWORD *)&v125[14] = v7;
        _os_log_impl(&dword_2390FD000, v85, OS_LOG_TYPE_DEFAULT, "#gpsd,#supl,GSM Serving,%{private}.u,%{private}.u,%{private}.u,%{private}.u", buf, 0x1Au);
        v10 = LOWORD(v101[0]);
        v9 = WORD1(v101[0]);
      }
      if (v10 <= 0x3E7 && v9 < 0x3E8)
        goto LABEL_119;
      v18 = qword_2542CF618;
      if (!os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
        goto LABEL_119;
      *(_WORD *)buf = 0;
      v19 = "#gpsd,#supl,Invalid GSM Serving Cell Info";
    }
    v86 = v18;
    v87 = 2;
    goto LABEL_115;
  }
  v99[0] = 4;
  v20 = (char *)operator new(0xA8uLL, MEMORY[0x24BEDB6B8]);
  v21 = v20;
  if (v20)
  {
    *((_QWORD *)v20 + 18) = 0;
    *((_QWORD *)v20 + 19) = 0;
    *((_QWORD *)v20 + 20) = 0;
    *((_QWORD *)v20 + 1) = 0;
    *((_QWORD *)v20 + 2) = 0;
    *((_DWORD *)v20 + 6) = 0;
    *((_OWORD *)v20 + 2) = 0u;
    *((_OWORD *)v20 + 3) = 0u;
    *((_OWORD *)v20 + 4) = 0u;
    *((_OWORD *)v20 + 5) = 0u;
    *(_OWORD *)(v20 + 90) = 0u;
    *((_QWORD *)v20 + 15) = 0;
    *((_QWORD *)v20 + 16) = 0;
    *((_QWORD *)v20 + 14) = 0;
    *((_DWORD *)v20 + 34) = 0;
    *(_WORD *)v20 = -1;
  }
  v110 = v20;
  *(_WORD *)v20 = 3;
  v22 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 48) == v22)
    goto LABEL_119;
  v23 = 0;
  v24 = 0;
  v97 = v20 + 56;
  v98 = v20 + 32;
  v95 = v20 + 112;
  v96 = v20 + 80;
  v93 = (uint64_t)(v20 + 160);
  v94 = (int64x2_t *)(v20 + 144);
  while (!*(_BYTE *)(v22 + 28 * v24))
  {
    if (v23 <= 7)
    {
      *(_DWORD *)buf = 0;
      LOWORD(v124) = 0;
      *(_DWORD *)v125 = 0;
      memset(&v125[8], 0, 106);
      if (*(unsigned __int16 *)(v22 + 28 * v24 + 16) <= 0x1F7u)
      {
        LOWORD(v124) = *(_WORD *)(v22 + 28 * v24 + 16);
        if (*(unsigned __int8 *)(v22 + 28 * v24 + 18) <= 0x61u)
        {
          v125[112] = *(_BYTE *)(v22 + 28 * v24 + 18);
          *(_DWORD *)&v125[104] = 1;
        }
        if (*(unsigned __int8 *)(v22 + 28 * v24 + 19) <= 0x22u)
        {
          v125[113] = *(_BYTE *)(v22 + 28 * v24 + 19);
          *(_DWORD *)&v125[108] = 1;
        }
        *(_DWORD *)buf = sub_2391C093C((uint64_t)v125, (unint64_t *)&v125[80], *(unsigned __int16 *)(v22 + 28 * v24 + 2), *(unsigned __int16 *)(v22 + 28 * v24 + 4), *(_DWORD *)(v22 + 28 * v24 + 12), *(unsigned __int16 *)(v22 + 28 * v24 + 8));
        v30 = *((_QWORD *)v21 + 19);
        v29 = *((_QWORD *)v21 + 20);
        if (v30 >= v29)
        {
          v56 = (uint64_t)(v30 - v94->i64[0]) >> 7;
          if ((unint64_t)(v56 + 1) >> 57)
            sub_23910165C();
          v57 = v29 - v94->i64[0];
          v58 = v57 >> 6;
          if (v57 >> 6 <= (unint64_t)(v56 + 1))
            v58 = v56 + 1;
          if ((unint64_t)v57 >= 0x7FFFFFFFFFFFFF80)
            v59 = 0x1FFFFFFFFFFFFFFLL;
          else
            v59 = v58;
          *(_QWORD *)v116 = v93;
          if (v59)
            v60 = (char *)sub_2391A9C04(v93, v59);
          else
            v60 = 0;
          v61 = &v60[128 * v56];
          *(_QWORD *)v115 = v60;
          *(_QWORD *)&v115[8] = v61;
          *(_QWORD *)&v115[16] = v61;
          *(_QWORD *)&v115[24] = &v60[128 * v59];
          v62 = *(_DWORD *)buf;
          *((_WORD *)v61 + 2) = v124;
          *(_DWORD *)v61 = v62;
          sub_2391A996C((uint64_t)(v61 + 8), (int *)v125);
          v63 = *(_QWORD *)&v125[104];
          *((_DWORD *)v61 + 30) = *(_DWORD *)&v125[112];
          *((_QWORD *)v61 + 14) = v63;
          v64 = *(_QWORD *)&v115[8];
          v33 = *(_QWORD *)&v115[16] + 128;
          *(_QWORD *)&v115[16] += 128;
          v66 = *((_QWORD *)v21 + 18);
          v65 = *((_QWORD *)v21 + 19);
          if (v65 == v66)
          {
            v72 = vdupq_n_s64(v65);
          }
          else
          {
            v67 = 0;
            do
            {
              v68 = v64 + v67;
              v69 = v65 + v67;
              v70 = *(_DWORD *)(v65 + v67 - 128);
              *(_WORD *)(v68 - 124) = *(_WORD *)(v65 + v67 - 124);
              *(_DWORD *)(v68 - 128) = v70;
              *(_DWORD *)(v68 - 120) = *(_DWORD *)(v65 + v67 - 120);
              *(_QWORD *)(v68 - 104) = 0;
              *(_QWORD *)(v68 - 96) = 0;
              *(_QWORD *)(v68 - 112) = 0;
              *(_OWORD *)(v68 - 112) = *(_OWORD *)(v65 + v67 - 112);
              *(_QWORD *)(v68 - 96) = *(_QWORD *)(v65 + v67 - 96);
              *(_QWORD *)(v69 - 112) = 0;
              *(_QWORD *)(v69 - 104) = 0;
              *(_QWORD *)(v69 - 96) = 0;
              *(_QWORD *)(v68 - 88) = 0;
              *(_QWORD *)(v68 - 80) = 0;
              *(_QWORD *)(v68 - 72) = 0;
              *(_OWORD *)(v68 - 88) = *(_OWORD *)(v65 + v67 - 88);
              *(_QWORD *)(v68 - 72) = *(_QWORD *)(v65 + v67 - 72);
              *(_QWORD *)(v69 - 88) = 0;
              *(_QWORD *)(v69 - 80) = 0;
              *(_QWORD *)(v69 - 72) = 0;
              *(_QWORD *)(v68 - 64) = 0;
              *(_QWORD *)(v68 - 56) = 0;
              *(_QWORD *)(v68 - 48) = 0;
              *(_OWORD *)(v68 - 64) = *(_OWORD *)(v65 + v67 - 64);
              *(_QWORD *)(v68 - 48) = *(_QWORD *)(v65 + v67 - 48);
              *(_QWORD *)(v69 - 64) = 0;
              *(_QWORD *)(v69 - 56) = 0;
              *(_QWORD *)(v69 - 48) = 0;
              *(_QWORD *)(v68 - 40) = 0;
              *(_QWORD *)(v68 - 32) = 0;
              *(_QWORD *)(v68 - 24) = 0;
              *(_OWORD *)(v68 - 40) = *(_OWORD *)(v65 + v67 - 40);
              *(_QWORD *)(v68 - 24) = *(_QWORD *)(v65 + v67 - 24);
              *(_QWORD *)(v69 - 40) = 0;
              *(_QWORD *)(v69 - 32) = 0;
              *(_QWORD *)(v69 - 24) = 0;
              v71 = *(_QWORD *)(v65 + v67 - 16);
              *(_DWORD *)(v68 - 8) = *(_DWORD *)(v65 + v67 - 8);
              *(_QWORD *)(v68 - 16) = v71;
              v67 -= 128;
            }
            while (v65 + v67 != v66);
            v72 = *v94;
            v33 = *(_QWORD *)&v115[16];
            v64 += v67;
          }
          *((_QWORD *)v21 + 18) = v64;
          *((_QWORD *)v21 + 19) = v33;
          *(int64x2_t *)&v115[8] = v72;
          v73 = *((_QWORD *)v21 + 20);
          *((_QWORD *)v21 + 20) = *(_QWORD *)&v115[24];
          *(_QWORD *)&v115[24] = v73;
          *(_QWORD *)v115 = v72.i64[0];
          sub_2391C2B90((uint64_t)v115);
        }
        else
        {
          v31 = *(_DWORD *)buf;
          *(_WORD *)(v30 + 4) = v124;
          *(_DWORD *)v30 = v31;
          sub_2391A996C(v30 + 8, (int *)v125);
          v32 = *(_QWORD *)&v125[104];
          *(_DWORD *)(v30 + 120) = *(_DWORD *)&v125[112];
          *(_QWORD *)(v30 + 112) = v32;
          v33 = v30 + 128;
          *((_QWORD *)v21 + 19) = v33;
        }
        *((_QWORD *)v21 + 19) = v33;
        v74 = qword_2542CF618;
        if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
        {
          v75 = *(_QWORD *)(a1 + 40) + 28 * v24;
          v76 = *(unsigned __int16 *)(v75 + 2);
          v77 = *(unsigned __int16 *)(v75 + 4);
          v78 = *(unsigned __int16 *)(v75 + 16);
          v79 = *(unsigned __int8 *)(v75 + 18);
          v80 = *(unsigned __int8 *)(v75 + 19);
          v82 = *(_DWORD *)(v75 + 8);
          v81 = *(_DWORD *)(v75 + 12);
          LODWORD(v75) = *(_DWORD *)(v75 + 24);
          *(_DWORD *)v115 = 134285569;
          *(_QWORD *)&v115[4] = v24;
          *(_WORD *)&v115[12] = 1025;
          *(_DWORD *)&v115[14] = v76;
          *(_WORD *)&v115[18] = 1025;
          *(_DWORD *)&v115[20] = v77;
          *(_WORD *)&v115[24] = 1025;
          *(_DWORD *)&v115[26] = v81;
          *(_WORD *)&v115[30] = 1025;
          *(_DWORD *)v116 = v78;
          *(_WORD *)&v116[4] = 1025;
          *(_DWORD *)&v116[6] = v79;
          v117 = 1025;
          v118 = v80;
          v119 = 1025;
          v120 = v82;
          v121 = 1025;
          v122 = v75;
          _os_log_impl(&dword_2390FD000, v74, OS_LOG_TYPE_DEFAULT, "#gpsd,#supl,LTE neighbor,%{private}.zd,MCC %{private}.u,MNC %{private}.u,CI %{private}.u,PCI %{private}.u,RSRP %{private}.u,RSRQ %{private}.u,TAC %{private}.u,DLFREQ %{private}.u", v115, 0x3Cu);
        }
        v23 = (v23 + 1);
        if (*(_QWORD *)&v125[80])
        {
          *(_QWORD *)&v125[88] = *(_QWORD *)&v125[80];
          operator delete(*(void **)&v125[80]);
        }
      }
      if (*(_QWORD *)&v125[56])
      {
        *(_QWORD *)&v125[64] = *(_QWORD *)&v125[56];
        operator delete(*(void **)&v125[56]);
      }
      if (*(_QWORD *)&v125[32])
      {
        *(_QWORD *)&v125[40] = *(_QWORD *)&v125[32];
        operator delete(*(void **)&v125[32]);
      }
      if (*(_QWORD *)&v125[8])
      {
        *(_QWORD *)&v125[16] = *(_QWORD *)&v125[8];
        operator delete(*(void **)&v125[8]);
      }
    }
LABEL_75:
    ++v24;
    v22 = *(_QWORD *)(a1 + 40);
    if (v24 >= 0x6DB6DB6DB6DB6DB7 * ((*(_QWORD *)(a1 + 48) - v22) >> 2))
    {
      if (*((_QWORD *)v21 + 18) != *((_QWORD *)v21 + 19))
        *((_DWORD *)v21 + 5) = 1;
      goto LABEL_119;
    }
  }
  v25 = *(unsigned __int16 *)(v22 + 28 * v24 + 16);
  if (v25 < 0x1F8)
  {
    *(_DWORD *)buf = 0;
    memset(v125, 0, 72);
    __p = 0;
    v113 = 0;
    v114 = 0;
    if ((sub_2391C093C((uint64_t)buf, (unint64_t *)&__p, *(unsigned __int16 *)(v22 + 28 * v24 + 2), *(unsigned __int16 *)(v22 + 28 * v24 + 4), *(_DWORD *)(v22 + 28 * v24 + 12), *(unsigned __int16 *)(v22 + 28 * v24 + 8)) & 1) != 0)
    {
      *((_WORD *)v21 + 52) = *(_WORD *)(*(_QWORD *)(a1 + 40) + 28 * v24 + 16);
      *((_DWORD *)v21 + 6) = *(_DWORD *)buf;
      sub_239107FF0(v98, *(char **)v125, *(char **)&v125[8], *(_QWORD *)&v125[8] - *(_QWORD *)v125);
      sub_239107FF0(v97, *(char **)&v125[24], *(char **)&v125[32], *(_QWORD *)&v125[32] - *(_QWORD *)&v125[24]);
      sub_239107FF0(v96, *(char **)&v125[48], *(char **)&v125[56], *(_QWORD *)&v125[56] - *(_QWORD *)&v125[48]);
      sub_239107FF0(v95, (char *)__p, v113, v113 - (_BYTE *)__p);
      v26 = v23;
      v21[136] = -1;
      v27 = *(_QWORD *)(a1 + 40);
      v28 = *(unsigned __int8 *)(v27 + 28 * v24 + 18);
      if (v28 > 0x61)
      {
        v37 = qword_2542CF618;
        if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v115 = 67174657;
          *(_DWORD *)&v115[4] = v28;
          _os_log_error_impl(&dword_2390FD000, v37, OS_LOG_TYPE_ERROR, "#gpsd,#supl,Invalid Rsrp,%{private}.u", v115, 8u);
          v27 = *(_QWORD *)(a1 + 40);
        }
      }
      else
      {
        v21[136] = v28;
        *((_DWORD *)v21 + 2) = 1;
      }
      v21[137] = -1;
      v38 = *(unsigned __int8 *)(v27 + 28 * v24 + 19);
      if (v38 > 0x22)
      {
        v39 = qword_2542CF618;
        if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v115 = 67174657;
          *(_DWORD *)&v115[4] = v38;
          _os_log_error_impl(&dword_2390FD000, v39, OS_LOG_TYPE_ERROR, "#gpsd,#supl,Invalid Rsrq,%{private}.u", v115, 8u);
          v27 = *(_QWORD *)(a1 + 40);
        }
      }
      else
      {
        v21[137] = v38;
        *((_DWORD *)v21 + 3) = 1;
      }
      *((_WORD *)v21 + 69) = -1;
      v40 = *(_DWORD *)(v27 + 28 * v24 + 20);
      if (v40 > 1282)
      {
        v41 = qword_2542CF618;
        if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v115 = 67174657;
          *(_DWORD *)&v115[4] = v40;
          _os_log_impl(&dword_2390FD000, v41, OS_LOG_TYPE_DEFAULT, "#gpsd,#supl,Invalid TA,%{private}.d", v115, 8u);
          v27 = *(_QWORD *)(a1 + 40);
        }
      }
      else
      {
        *((_WORD *)v21 + 69) = v40;
        *((_DWORD *)v21 + 4) = 1;
      }
      v42 = qword_2542CF618;
      if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
      {
        v43 = v27 + 28 * v24;
        v44 = *(unsigned __int16 *)(v43 + 2);
        v45 = *(unsigned __int16 *)(v43 + 16);
        v47 = v43 + 8;
        LODWORD(v43) = *(_DWORD *)(v43 + 8);
        v46 = *(_DWORD *)(v47 + 4);
        *(_DWORD *)v115 = 67175425;
        *(_DWORD *)&v115[4] = v44;
        *(_WORD *)&v115[8] = 1025;
        *(_DWORD *)&v115[10] = v46;
        *(_WORD *)&v115[14] = 1025;
        *(_DWORD *)&v115[16] = v45;
        *(_WORD *)&v115[20] = 1025;
        *(_DWORD *)&v115[22] = v43;
        _os_log_impl(&dword_2390FD000, v42, OS_LOG_TYPE_DEFAULT, "#gpsd,#supl,#input,LTE Serving,%{private}u,%{private}u,%{private}u,%{private}u", v115, 0x1Au);
        v27 = *(_QWORD *)(a1 + 40);
      }
      v48 = *(unsigned __int16 *)(v27 + 28 * v24 + 2);
      if (v48 >= 0x3E8)
      {
        v49 = qword_2542CF628;
        if (os_log_type_enabled((os_log_t)qword_2542CF628, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v115 = 67174657;
          *(_DWORD *)&v115[4] = v48;
          _os_log_impl(&dword_2390FD000, v49, OS_LOG_TYPE_DEFAULT, "#gpsd,#supl,LTE MCC, %{private}u", v115, 8u);
          v27 = *(_QWORD *)(a1 + 40);
        }
      }
      v50 = qword_2542CF618;
      if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
      {
        v51 = *(unsigned __int16 *)(v27 + 28 * v24 + 4);
        *(_DWORD *)v115 = 67174657;
        *(_DWORD *)&v115[4] = v51;
        _os_log_impl(&dword_2390FD000, v50, OS_LOG_TYPE_DEFAULT, "#gpsd,#supl,LTE Serving,MNC %{private}u", v115, 8u);
        v27 = *(_QWORD *)(a1 + 40);
      }
      v23 = v26;
      v52 = *(unsigned __int16 *)(v27 + 28 * v24 + 4);
      if (v52 <= 0x3E7)
      {
        v53 = *(unsigned int *)(v27 + 28 * v24 + 12);
        if (!(v53 >> 28)
          && *(unsigned __int16 *)(v27 + 28 * v24 + 16) <= 0x1F7u
          && *(_DWORD *)(v27 + 28 * v24 + 8) < 0x10000u)
        {
          sub_2391BD6C0(*(unsigned __int16 *)(v27 + 28 * v24 + 2), v52, v53, v52 > 0x63);
          v55 = 1;
LABEL_66:
          if (__p)
          {
            v113 = (char *)__p;
            operator delete(__p);
          }
          if (*(_QWORD *)&v125[48])
          {
            *(_QWORD *)&v125[56] = *(_QWORD *)&v125[48];
            operator delete(*(void **)&v125[48]);
          }
          if (*(_QWORD *)&v125[24])
          {
            *(_QWORD *)&v125[32] = *(_QWORD *)&v125[24];
            operator delete(*(void **)&v125[24]);
          }
          if (*(_QWORD *)v125)
          {
            *(_QWORD *)&v125[8] = *(_QWORD *)v125;
            operator delete(*(void **)v125);
          }
          if ((v55 & 1) == 0)
            goto LABEL_119;
          goto LABEL_75;
        }
      }
      v54 = qword_2542CF618;
      if (!os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
      {
LABEL_65:
        v55 = 0;
        goto LABEL_66;
      }
      *(_WORD *)v115 = 0;
      v35 = v54;
      v36 = "#gpsd,#supl,invalid LTE Serving Cell Info";
    }
    else
    {
      v34 = qword_2542CF618;
      if (!os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
        goto LABEL_65;
      *(_WORD *)v115 = 0;
      v35 = v34;
      v36 = "#gpsd,#supl,ConvertIntValsToASN1T_CellGlobalIdEUTRA function returned error";
    }
    _os_log_error_impl(&dword_2390FD000, v35, OS_LOG_TYPE_ERROR, v36, v115, 2u);
    goto LABEL_65;
  }
  v88 = qword_2542CF618;
  if (!os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    goto LABEL_119;
  *(_DWORD *)buf = 67109120;
  v124 = v25;
  v19 = "#gpsd,#supl,Physical Cell Id Out of Range %d";
  v86 = v88;
  v87 = 8;
LABEL_115:
  _os_log_error_impl(&dword_2390FD000, v86, OS_LOG_TYPE_ERROR, v19, buf, v87);
LABEL_119:
  v89 = sub_2391BC46C();
  sub_2391BC91C(v89, 0, (uint64_t)v99);
  v90 = sub_2391B7D4C();
  sub_2391B88BC(v90);
  return sub_2391A8BC0((uint64_t)v99);
}

void sub_2391C1AB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,void *__p,uint64_t a45,uint64_t a46,char a47)
{
  uint64_t v47;

  if (__p)
  {
    a45 = (uint64_t)__p;
    operator delete(__p);
  }
  sub_239104B64((_QWORD *)(v47 - 240));
  sub_2391A8BC0((uint64_t)&a24);
  _Unwind_Resume(a1);
}

_QWORD *sub_2391C1B1C(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  sub_239105CA8((_QWORD *)(a1 + 40), *(const void **)(a2 + 40), *(_QWORD *)(a2 + 48), 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(_QWORD *)(a2 + 48) - *(_QWORD *)(a2 + 40)) >> 2));
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  sub_239105DE4((_QWORD *)(a1 + 64), *(const void **)(a2 + 64), *(_QWORD *)(a2 + 72), (uint64_t)(*(_QWORD *)(a2 + 72) - *(_QWORD *)(a2 + 64)) >> 4);
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 96) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  return sub_239105ED0((_QWORD *)(a1 + 88), *(const void **)(a2 + 88), *(_QWORD *)(a2 + 96), (uint64_t)(*(_QWORD *)(a2 + 96) - *(_QWORD *)(a2 + 88)) >> 5);
}

void sub_2391C1BC0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void **v3;
  void *v5;
  void *v6;

  v5 = *v3;
  if (*v3)
  {
    *(_QWORD *)(v1 + 72) = v5;
    operator delete(v5);
  }
  v6 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 48) = v6;
    operator delete(v6);
  }
  _Unwind_Resume(exception_object);
}

void sub_2391C1BF4(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)a1[11];
  if (v2)
  {
    a1[12] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[8];
  if (v3)
  {
    a1[9] = v3;
    operator delete(v3);
  }
  v4 = (void *)a1[5];
  if (v4)
  {
    a1[6] = v4;
    operator delete(v4);
  }
}

double sub_2391C1C48(uint64_t a1)
{
  uint64_t v1;
  double result;
  int v3[388];

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
  memcpy(v3, (const void *)(a1 + 40), sizeof(v3));
  *(_QWORD *)&result = sub_2391C62C0(v1, v3).n128_u64[0];
  return result;
}

double sub_2391C1C8C(uint64_t a1)
{
  uint64_t v1;
  double result;
  int __dst[70];

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
  memcpy(__dst, (const void *)(a1 + 40), sizeof(__dst));
  *(_QWORD *)&result = sub_2391C64C4(v1, __dst).n128_u64[0];
  return result;
}

double sub_2391C1CD0(uint64_t a1)
{
  uint64_t v1;
  __int128 v2;
  double result;
  _OWORD v4[2];

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
  v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  *(_QWORD *)&result = sub_2391C65A0(v1, (int *)v4).n128_u64[0];
  return result;
}

BOOL sub_2391C1D08(uint64_t a1)
{
  uint64_t v1;
  __int128 v2;
  __int128 v4;
  _OWORD v5[2];

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
  v2 = *(_OWORD *)(a1 + 56);
  v4 = *(_OWORD *)(a1 + 40);
  v5[0] = v2;
  *(_OWORD *)((char *)v5 + 12) = *(_OWORD *)(a1 + 68);
  return sub_2391C3A48(v1, (uint64_t)&v4, 2);
}

uint8_t *sub_2391C1D4C(uint64_t a1, _DWORD *a2)
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  const char *v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  __int16 v18;
  unsigned int v19;
  unsigned int v20;
  __int16 v21;
  int v22;
  unsigned int v23;
  unsigned int v24;
  int v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  unsigned int v32;
  double v33;
  double v34;
  signed int v35;
  uint64_t v36;
  char v37;
  int v38;
  NSObject *v39;
  _QWORD *v40;
  __int16 v41;
  NSObject *v42;
  uint8_t *result;
  int v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  __int16 v61;
  int v62;
  int v63;
  int v64;
  int v65;
  uint64_t v66;
  int v67;
  char v68;
  int v69;
  char v70;
  int v71;
  int v72;
  char v73;
  int v74;
  char v75;
  int v76;
  char v77;
  int v78;
  int v79;
  int v80;
  unsigned int v81;
  int v82;
  BOOL v83;
  int v84;
  unsigned int v85;
  _QWORD v87[4];
  _BYTE v88[312];
  __int16 v89;
  unsigned int v90;
  char v91;
  BOOL v92;
  __int16 v93;
  BOOL v94;
  unsigned int v95;
  int v96;
  char v97;
  char v98;
  char v99;
  char v100;
  unsigned int v101;
  char v102;
  char v103;
  uint64_t v104;
  char v105;
  uint64_t v106;
  char v107;
  int v108;
  char v109;
  int v110;
  __int16 v111;
  char v112;
  char v113;
  int v114;
  __int16 v115;
  uint8_t v116[16];
  _QWORD block[4];
  _BYTE v118[24];
  _BYTE *v119;
  uint64_t v120;
  int v121;
  int v122;
  unint64_t v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  __int16 v130;
  char v131;
  int v132;
  int64x2_t v133;
  __int128 v134;
  unint64_t v135;
  __int16 v136;
  int v137;
  __int16 v138;
  unint64_t v139;
  uint8_t buf[8];
  __int16 v141;
  int v142;
  __int16 v143;
  int v144;
  __int16 v145;
  _BYTE v146[10];
  __int16 v147;
  int v148;
  __int16 v149;
  int v150;
  __int16 v151;
  int v152;
  __int16 v153;
  int v154;
  __int16 v155;
  int v156;
  __int16 v157;
  int v158;
  __int16 v159;
  int v160;
  __int16 v161;
  int v162;
  __int16 v163;
  int v164;
  __int16 v165;
  int v166;
  __int16 v167;
  int v168;
  __int16 v169;
  int v170;
  __int16 v171;
  int v172;
  __int16 v173;
  int v174;
  uint64_t v175;

  v175 = *MEMORY[0x24BDAC8D0];
  v3 = a2[2];
  v4 = a2[3];
  v5 = a2[4];
  v6 = a2[5];
  v7 = *((unsigned __int16 *)a2 + 12);
  v8 = *((unsigned __int8 *)a2 + 26);
  v62 = a2[8];
  v64 = a2[9];
  v65 = *((unsigned __int16 *)a2 + 20);
  v67 = *((unsigned __int8 *)a2 + 42);
  v69 = a2[16];
  v71 = a2[23];
  v72 = *((unsigned __int8 *)a2 + 102);
  v74 = a2[24];
  v76 = *((unsigned __int8 *)a2 + 103);
  v82 = *((unsigned __int16 *)a2 + 50);
  v84 = *((unsigned __int8 *)a2 + 104);
  v78 = *((unsigned __int8 *)a2 + 105);
  v80 = *((unsigned __int8 *)a2 + 106);
  v9 = a2[68];
  v57 = *((unsigned __int16 *)a2 + 141);
  v58 = *((unsigned __int16 *)a2 + 138);
  v59 = *((unsigned __int8 *)a2 + 284);
  v60 = *((unsigned __int16 *)a2 + 139);
  v55 = *((unsigned __int8 *)a2 + 290);
  v56 = *((unsigned __int16 *)a2 + 140);
  v48 = *((unsigned __int16 *)a2 + 146);
  v49 = *((unsigned __int16 *)a2 + 147);
  v50 = *((unsigned __int16 *)a2 + 143);
  v51 = *((unsigned __int8 *)a2 + 296);
  v52 = *((unsigned __int8 *)a2 + 298);
  v53 = *((unsigned __int16 *)a2 + 144);
  v54 = *((unsigned __int8 *)a2 + 299);
  v10 = a2[75];
  v11 = qword_2542CF618;
  v12 = os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (!v12)
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v13 = "#gpsd,#supl,#out,posReport, sessionProtocol = SUPL";
  }
  else
  {
    if (!v12)
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v13 = "#gpsd,#supl,#out,posReport, sessionProtocol = CPlane";
  }
  _os_log_impl(&dword_2390FD000, v11, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
LABEL_7:
  v14 = qword_2542CF618;
  if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67113729;
    *(_DWORD *)&buf[4] = v5;
    v141 = 1024;
    v142 = v4;
    v143 = 1024;
    v144 = v7;
    v145 = 1024;
    *(_DWORD *)v146 = v6;
    *(_WORD *)&v146[4] = 1024;
    *(_DWORD *)&v146[6] = v8;
    v147 = 1024;
    v148 = v62;
    v149 = 1024;
    v150 = v64;
    v151 = 1024;
    v152 = v65;
    v153 = 1024;
    v154 = v67;
    v155 = 1025;
    v156 = v69;
    v157 = 1025;
    v158 = v71;
    v159 = 1025;
    v160 = v74;
    v161 = 1025;
    v162 = v72;
    v163 = 1025;
    v164 = v76;
    v165 = 1025;
    v166 = v82;
    v167 = 1025;
    v168 = v78;
    v169 = 1024;
    v170 = v80;
    v171 = 1025;
    v172 = v84;
    v173 = 1024;
    v174 = v10;
    _os_log_debug_impl(&dword_2390FD000, v14, OS_LOG_TYPE_DEBUG, "#gpsd,#supl,#out,posReport,sessionId,%u,posProtocol,%u,gpsWeek,%u,gpsTow,%u,gpsTimeUncertainty,%u,gpsTODPresent,%d,gpsTODMsec,%u,gpsTODFrac,%u,gpsTODUnc,%u,shapeType,%{private}u,latitude,%{private}u,longitude,%{private}u,Majoraxis,%{private}u,Minoraxis,%{private}u,altitude,%{private}u,uncertainAltitude,%{private}u,confidence,%u,orientationAngle,%{private}u,technologySource,%u", buf, 0x74u);
  }
  switch(v9)
  {
    case 0:
      v14 = qword_2542CF618;
      if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67174913;
        *(_DWORD *)&buf[4] = v58;
        v141 = 1025;
        v142 = v60;
        v15 = "#gpsd,#supl,#out,HorizontalWithVerticalVelocity,posReport,bearing,%{private}u,horizontalSpeed,%{private}u";
        v16 = v14;
        v17 = 14;
        goto LABEL_62;
      }
      break;
    case 1:
      v14 = qword_2542CF618;
      if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67175169;
        *(_DWORD *)&buf[4] = v56;
        v141 = 1025;
        v142 = v57;
        v143 = 1025;
        v144 = v59;
        v15 = "#gpsd,#supl,#out,HorizontalWithVerticalVelocity,posReport,bearing,%{private}u,horizontalSpeed,%{private}u,"
              "verticalSpeed,%{private}u";
        goto LABEL_16;
      }
      break;
    case 2:
      v14 = qword_2542CF618;
      if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67175169;
        *(_DWORD *)&buf[4] = v50;
        v141 = 1025;
        v142 = v53;
        v143 = 1025;
        v144 = v55;
        v15 = "#gpsd,#supl,#out,HorizontalVelocityWithUncertainty,posReport,bearing,%{private}u,horizontalSpeed,%{private"
              "}u,horizUncertaintySpeed,%{private}u";
LABEL_16:
        v16 = v14;
        v17 = 20;
        goto LABEL_62;
      }
      break;
    case 3:
      v14 = qword_2542CF618;
      if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67175681;
        *(_DWORD *)&buf[4] = v48;
        v141 = 1025;
        v142 = v49;
        v143 = 1024;
        v144 = v51;
        v145 = 1025;
        *(_DWORD *)v146 = v52;
        *(_WORD *)&v146[4] = 1025;
        *(_DWORD *)&v146[6] = v54;
        v15 = "#gpsd,#supl,#out,HorizontalWithVerticalVelocityAndUncertainty,posReport,bearing,%{private}u,horizontalSpee"
              "d,%{private}u,verticalSpeed,%u,horizUncertaintySpeed,%{private}u,vertUncertaintySpeed,%{private}u";
        v16 = v14;
        v17 = 32;
LABEL_62:
        _os_log_debug_impl(&dword_2390FD000, v16, OS_LOG_TYPE_DEBUG, v15, buf, v17);
      }
      break;
    default:
      break;
  }
  if (*a2)
    v18 = 5;
  else
    v18 = 0;
  if (a2[3])
    v19 = a2[5];
  else
    v19 = a2[5] % 0xDBBA00u;
  v85 = v19;
  v83 = a2[7] == 1;
  v20 = a2[23];
  v21 = *((_WORD *)a2 + 50);
  if (a2[8])
  {
    LODWORD(v14) = a2[9];
    LOWORD(v9) = *((_WORD *)a2 + 20);
    LOBYTE(v64) = *((_BYTE *)a2 + 42);
  }
  v22 = a2[24];
  v23 = v21 & 0x7FFF;
  v24 = v21;
  v79 = v22;
  v81 = v23;
  v75 = *((_BYTE *)a2 + 105);
  v77 = *((_BYTE *)a2 + 102);
  v73 = *((_BYTE *)a2 + 103);
  if (*a2)
  {
    v66 = 0xFFFFFFFFLL;
    v25 = 20;
    v26 = -1.0;
    v27 = 1.79769313e308;
    v28 = -1.0;
    v29 = -1.0;
    v30 = 1.79769313e308;
    v31 = 1.79769313e308;
    goto LABEL_44;
  }
  v32 = v20 >> 23;
  if (((v20 >> 23) & 1) != 0)
  {
    if (!v32)
    {
      v33 = (double)v20 * 90.0;
      v34 = -0.00000011920929;
      goto LABEL_33;
    }
LABEL_34:
    v31 = 1.79769313e308;
    goto LABEL_35;
  }
  if (v32)
    goto LABEL_34;
  v33 = (double)v20 * 90.0;
  v34 = 0.00000011920929;
LABEL_33:
  v31 = v33 * v34;
LABEL_35:
  if ((v22 + 0x800000) >> 24)
  {
    v30 = 1.79769313e308;
  }
  else
  {
    v35 = v22 | 0xFF000000;
    if ((v22 & 0x800000) == 0)
      v35 = a2[24];
    v30 = (double)v35 * 360.0 * 0.0000000596046448;
  }
  if (v21 >= 0)
    v27 = (double)v23;
  else
    v27 = -(double)v23;
  v29 = (double)*((unsigned __int8 *)a2 + 102);
  v28 = (double)*((unsigned __int8 *)a2 + 103);
  v26 = (double)*((unsigned __int8 *)a2 + 105);
  HIDWORD(v36) = 2;
  LODWORD(v36) = a2[4];
  v66 = v36;
  v25 = 18;
LABEL_44:
  v37 = *((_BYTE *)a2 + 26);
  v38 = a2[16];
  v68 = *((_BYTE *)a2 + 104);
  v70 = *((_BYTE *)a2 + 106);
  sub_239101254((uint64_t)buf, a1);
  if (*(_QWORD *)&v146[2])
  {
    v61 = v9;
    v63 = (int)v14;
    v39 = *(NSObject **)(a1 + 96);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3321888768;
    block[2] = sub_2391C266C;
    block[3] = &unk_250ABD188;
    v40 = v118;
    v41 = v18;
    if (*(uint8_t **)&v146[2] == buf)
    {
      v119 = v118;
      (*(void (**)(uint8_t *, _BYTE *))(*(_QWORD *)buf + 24))(buf, v118);
    }
    else
    {
      v119 = (_BYTE *)(*(uint64_t (**)(void))(**(_QWORD **)&v146[2] + 16))();
    }
    v120 = v66;
    v44 = (v24 >> 15) & 1;
    v121 = v25;
    v122 = 0;
    v123 = 0xBFF0000000000000;
    v124 = v31;
    v125 = v30;
    v126 = v27;
    v127 = v29;
    v128 = v28;
    v129 = v26;
    v130 = 0;
    v131 = 0;
    v132 = 0;
    v133 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    v134 = xmmword_2391D28E0;
    v135 = 0xBFF0000000000000;
    v136 = -1;
    v137 = -1;
    v138 = -1;
    v139 = 0xBFF0000000000000;
    dispatch_async(v39, block);
    v45 = *(NSObject **)(a1 + 88);
    v87[0] = MEMORY[0x24BDAC760];
    v87[1] = 3221225472;
    v87[2] = sub_2391C27DC;
    v87[3] = &unk_250ABD298;
    memcpy(v88, a2, sizeof(v88));
    v89 = v41;
    v90 = v85;
    v91 = v37;
    v92 = v83;
    v93 = v38;
    v94 = (v20 & 0x800000) != 0;
    v95 = v20;
    v96 = v79;
    v97 = v77;
    v98 = v73;
    v99 = v68;
    v100 = v44;
    v101 = v81;
    v102 = v75;
    v103 = v70;
    v104 = 0xFFFFFFFFLL;
    v105 = -1;
    v106 = 0xFF00000000;
    v107 = -1;
    v108 = 0;
    v109 = -1;
    v110 = v63;
    v111 = v61;
    v112 = v64;
    v113 = 1;
    v114 = 1;
    v115 = 1;
    dispatch_async(v45, v87);
    if (v119 == v118)
    {
      v46 = 4;
    }
    else
    {
      if (!v119)
        goto LABEL_55;
      v46 = 5;
      v40 = v119;
    }
    (*(void (**)(_QWORD *))(*v40 + 8 * v46))(v40);
  }
  else
  {
    v42 = qword_2542CF618;
    result = (uint8_t *)os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT);
    if (!(_DWORD)result)
      return result;
    *(_WORD *)v116 = 0;
    _os_log_impl(&dword_2390FD000, v42, OS_LOG_TYPE_DEFAULT, "#gpsd,#supl,SuplStatusReportCB is NULL", v116, 2u);
  }
LABEL_55:
  result = *(uint8_t **)&v146[2];
  if (*(uint8_t **)&v146[2] == buf)
  {
    v47 = 4;
    result = buf;
  }
  else
  {
    if (!*(_QWORD *)&v146[2])
      return result;
    v47 = 5;
  }
  return (uint8_t *)(*(uint64_t (**)(void))(*(_QWORD *)result + 8 * v47))();
}

void sub_2391C2628(_Unwind_Exception *a1)
{
  unint64_t *v2;
  uint64_t v3;

  v2 = (unint64_t *)STACK[0x348];
  if ((unint64_t *)STACK[0x348] == &STACK[0x330])
  {
    v3 = 4;
    v2 = &STACK[0x330];
  }
  else
  {
    if (!v2)
      goto LABEL_6;
    v3 = 5;
  }
  (*(void (**)(void))(*v2 + 8 * v3))();
LABEL_6:
  _Unwind_Resume(a1);
}

void sub_2391C266C(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  __int16 v44;
  int v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 56);
  if (!v2)
    sub_2391012B8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v2 + 48))(v2, a1 + 64);
  v3 = qword_2542CF618;
  if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 96);
    v5 = *(_QWORD *)(a1 + 104);
    v6 = *(_QWORD *)(a1 + 112);
    v7 = *(_QWORD *)(a1 + 120);
    v8 = *(_QWORD *)(a1 + 128);
    v10 = *(_DWORD *)(a1 + 64);
    v9 = *(_DWORD *)(a1 + 68);
    v11 = *(_DWORD *)(a1 + 72);
    v12 = *(_DWORD *)(a1 + 76);
    v13 = *(_QWORD *)(a1 + 80);
    v14 = *(_QWORD *)(a1 + 88);
    if (*(_BYTE *)(a1 + 136))
      v15 = 84;
    else
      v15 = 70;
    if (*(_BYTE *)(a1 + 137))
      v16 = 84;
    else
      v16 = 70;
    if (*(_BYTE *)(a1 + 138))
      v17 = 84;
    else
      v17 = 70;
    v18 = 134286849;
    v19 = v14;
    v20 = 2049;
    v21 = v4;
    v22 = 2049;
    v23 = v5;
    v24 = 2049;
    v25 = v6;
    v26 = 2049;
    v27 = v7;
    v28 = 2049;
    v29 = v8;
    v30 = 1024;
    v31 = v9;
    v32 = 1024;
    v33 = v11;
    v34 = 1024;
    v35 = v10;
    v36 = 1024;
    v37 = v12;
    v38 = 2048;
    v39 = v13;
    v40 = 1024;
    v41 = v15;
    v42 = 1024;
    v43 = v16;
    v44 = 1024;
    v45 = v17;
    _os_log_impl(&dword_2390FD000, v3, OS_LOG_TYPE_DEFAULT, "#gpsd,#supl,#out, Lat,%{private}.6f,Long,%{private}.6f,Alt,%{private}.2f,SemMaj,%{private}.f,SemMin,%{private}.f,UncAlt,%{private}.f,PosMethod,%u,Status,%u,SessionId,%u,endCause,%u,HACC,%f,ephProvided,%c,refTimeProvided,%c,refLocProvided,%c", (uint8_t *)&v18, 0x72u);
  }
}

void sub_2391C27DC(uint64_t a1)
{
  int v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  NSObject *v5;
  uint8_t v6[16];
  _OWORD v7[7];
  uint64_t v8;

  if (*(_DWORD *)(a1 + 44) == 2)
  {
    v1 = *(_DWORD *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 456);
    v2 = *(_OWORD *)(a1 + 424);
    v7[4] = *(_OWORD *)(a1 + 408);
    v7[5] = v2;
    v7[6] = *(_OWORD *)(a1 + 440);
    v3 = *(_OWORD *)(a1 + 360);
    v7[0] = *(_OWORD *)(a1 + 344);
    v7[1] = v3;
    v4 = *(_OWORD *)(a1 + 392);
    v7[2] = *(_OWORD *)(a1 + 376);
    v7[3] = v4;
    sub_2391BCF94(v1, 0, (uint64_t)v7);
  }
  else
  {
    v5 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_2390FD000, v5, OS_LOG_TYPE_ERROR, "#gpsd,#supl,#out,Invalid posProtocol in Pos Response", v6, 2u);
    }
  }
}

void sub_2391C2890(uint64_t a1)
{
  uint64_t v1;
  char v2;
  char v3;
  int v4;
  int v5;
  NSObject *v6;
  uint8_t v7[8];
  unint64_t v8;
  int v9;
  int v10;
  char v11;
  char v12;
  char v13;
  int v14;
  __int16 v15;
  char v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v1 + 12) == 2)
  {
    v2 = *(_BYTE *)(v1 + 56);
    v3 = *(_BYTE *)(v1 + 24);
    v4 = *(_DWORD *)(v1 + 16);
    v5 = *(_DWORD *)(v1 + 20);
    v8 = 0x8000000080000000;
    v9 = 0x7FFFFFFF;
    v10 = v5;
    v11 = v3;
    v12 = 0;
    v13 = v2;
    v14 = -1;
    v15 = -1;
    v16 = -1;
    v17 = 0u;
    v18 = 0u;
    sub_2391BCE40(v4, 1, &v8);
  }
  else
  {
    v6 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_2390FD000, v6, OS_LOG_TYPE_ERROR, "#gpsd,#supl,#out,Invalid posProtocol in Aid request", v7, 2u);
    }
  }
}

void sub_2391C298C(uint64_t a1, char *__src, char *a3)
{
  char *v3;
  char *v6;
  unint64_t v7;
  char *v8;
  _BYTE *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  size_t v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  size_t v19;
  char *v20;
  char *v21;
  char *v22;
  char v23;
  _BYTE *v24;
  uint64_t v25;
  char *v26;

  v3 = a3;
  v6 = *(char **)(a1 + 8);
  v7 = *(_QWORD *)(a1 + 16);
  if ((unint64_t)v6 >= v7)
  {
    v10 = *(char **)a1;
    v11 = (uint64_t)&v6[-*(_QWORD *)a1 + 1];
    if (v11 < 0)
      sub_23910165C();
    v12 = __src - v10;
    v13 = v7 - (_QWORD)v10;
    if (2 * v13 > v11)
      v11 = 2 * v13;
    if (v13 >= 0x3FFFFFFFFFFFFFFFLL)
      v14 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v14 = v11;
    if (v14)
      v15 = (char *)operator new(v14);
    else
      v15 = 0;
    v16 = &v15[v12];
    v17 = &v15[v14];
    if (v12 == v14)
    {
      if (v12 < 1)
      {
        if ((unint64_t)(2 * v12) <= 1)
          v19 = 1;
        else
          v19 = 2 * v12;
        v20 = (char *)operator new(v19);
        v16 = &v20[v19 >> 2];
        v17 = &v20[v19];
        if (v15)
        {
          operator delete(v15);
          v10 = *(char **)a1;
        }
      }
      else
      {
        if (v12 + 1 >= 0)
          v18 = v12 + 1;
        else
          v18 = v12 + 2;
        v16 -= v18 >> 1;
      }
    }
    *v16 = *v3;
    v21 = v16 + 1;
    if (v10 != __src)
    {
      v22 = __src;
      do
      {
        v23 = *--v22;
        *--v16 = v23;
      }
      while (v22 != v10);
    }
    v24 = *(_BYTE **)(a1 + 8);
    v25 = v24 - __src;
    if (v24 != __src)
      memmove(v21, __src, v24 - __src);
    v26 = *(char **)a1;
    *(_QWORD *)a1 = v16;
    *(_QWORD *)(a1 + 8) = &v21[v25];
    *(_QWORD *)(a1 + 16) = v17;
    if (v26)
      operator delete(v26);
  }
  else if (__src == v6)
  {
    *__src = *a3;
    *(_QWORD *)(a1 + 8) = __src + 1;
  }
  else
  {
    v8 = __src + 1;
    if (v6)
    {
      *v6 = *(v6 - 1);
      v9 = v6 + 1;
    }
    else
    {
      v9 = 0;
    }
    *(_QWORD *)(a1 + 8) = v9;
    if (v6 != v8)
      memmove(__src + 1, __src, v6 - v8);
    if (__src <= v3 && *(_QWORD *)(a1 + 8) > (unint64_t)v3)
      ++v3;
    *__src = *v3;
  }
}

void sub_2391C2B78(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

uint64_t sub_2391C2B90(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(a1 + 16) = i - 128;
    sub_2391A974C(v4, (_QWORD *)(i - 128));
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t sub_2391C2BE0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;

  *(_QWORD *)a1 = 0xFFFFFFFF00000000;
  *(_WORD *)(a1 + 8) = -1;
  *(_QWORD *)(a1 + 16) = 0;
  *(_WORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_BYTE *)(a1 + 40) = 0;
  *(_DWORD *)(a1 + 44) = 0;
  *(_WORD *)(a1 + 48) = 0;
  *(_BYTE *)(a1 + 50) = -1;
  *(_DWORD *)(a1 + 52) = -1;
  *(_DWORD *)(a1 + 68) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(_BYTE *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = -1;
  *(_DWORD *)(a1 + 80) = 0x7FFFFFFF;
  *(_QWORD *)(a1 + 92) = -1;
  *(_DWORD *)(a1 + 100) = -1;
  *(_DWORD *)(a1 + 160) = 0;
  v2 = a1 + 160;
  v3 = a1 + 284;
  *(_WORD *)(a1 + 88) = -1;
  *(_DWORD *)(a1 + 84) = -1;
  *(_QWORD *)(a1 + 112) = 0;
  *(_QWORD *)(a1 + 120) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  *(_WORD *)(a1 + 128) = 0;
  *(_QWORD *)(a1 + 136) = 0x401C000000000000;
  *(_QWORD *)(a1 + 144) = 0;
  *(_BYTE *)(a1 + 152) = 0;
  *(_DWORD *)(a1 + 164) = 0;
  *(_QWORD *)(a1 + 168) = -1;
  *(_QWORD *)(a1 + 176) = -1;
  *(_WORD *)(a1 + 184) = 0;
  *(_BYTE *)(a1 + 186) = -1;
  *(_QWORD *)(a1 + 188) = -1;
  *(_QWORD *)(a1 + 195) = -1;
  *(_QWORD *)(a1 + 204) = 0xFFFFFFFF00000004;
  *(_WORD *)(a1 + 212) = -1;
  *(_BYTE *)(a1 + 214) = -1;
  *(_DWORD *)(a1 + 216) = -1;
  *(_WORD *)(a1 + 220) = 0;
  *(_QWORD *)(a1 + 224) = 0x7FFFFFFF000000FFLL;
  *(_DWORD *)(a1 + 232) = 0x7FFFFFFF;
  *(_BYTE *)(a1 + 236) = -1;
  *(_OWORD *)(a1 + 240) = xmmword_2391C7E30;
  *(_DWORD *)(a1 + 263) = -1;
  *(_DWORD *)(a1 + 256) = 0x7FFFFFFF;
  *(_DWORD *)(a1 + 260) = -1;
  *(_QWORD *)(a1 + 268) = 0x7FFFFFFF7FFFFFFFLL;
  *(_WORD *)(a1 + 280) = -1;
  *(_DWORD *)(a1 + 276) = -1;
  *(_QWORD *)&v4 = 0x8000000080000000;
  *((_QWORD *)&v4 + 1) = 0x8000000080000000;
  *(_OWORD *)(a1 + 284) = v4;
  *(_WORD *)(a1 + 300) = -1;
  *(_BYTE *)(a1 + 304) = -1;
  memset_pattern16((void *)(a1 + 308), &unk_2391C7E50, 0x78uLL);
  *(_BYTE *)(v2 + 268) = -1;
  *(_DWORD *)(v2 + 272) = 255;
  *(_QWORD *)(v3 + 168) = -1;
  *(_QWORD *)(v2 + 276) = -1;
  *(_QWORD *)(v2 + 283) = -1;
  *(_DWORD *)(v2 + 300) = 0;
  *(_QWORD *)(v2 + 304) = 0;
  *(_QWORD *)(v2 + 336) = 0;
  *(_QWORD *)(v2 + 368) = 0;
  *(_QWORD *)(v2 + 400) = 0;
  *(_QWORD *)(v2 + 432) = 0;
  *(_QWORD *)(v2 + 464) = 0;
  *(_QWORD *)(v2 + 496) = 0;
  *(_QWORD *)(v2 + 528) = 0;
  *(_QWORD *)(v2 + 560) = 0;
  *(_QWORD *)(sub_2391BDC54() + 104) = a1;
  return a1;
}

void sub_2391C2DA0(_Unwind_Exception *exception_object)
{
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;

  v10 = (_QWORD *)v1[90];
  if (v10 == v1 + 87)
  {
    v11 = 4;
    v10 = v1 + 87;
  }
  else
  {
    if (!v10)
      goto LABEL_6;
    v11 = 5;
  }
  (*(void (**)(void))(*v10 + 8 * v11))();
LABEL_6:
  v12 = (_QWORD *)v1[86];
  if (v12 == v8)
  {
    v13 = 4;
  }
  else
  {
    if (!v12)
      goto LABEL_11;
    v13 = 5;
    v8 = (_QWORD *)v1[86];
  }
  (*(void (**)(_QWORD *))(*v8 + 8 * v13))(v8);
LABEL_11:
  v14 = (_QWORD *)v1[82];
  if (v14 == v7)
  {
    v15 = 4;
  }
  else
  {
    if (!v14)
      goto LABEL_16;
    v15 = 5;
    v7 = (_QWORD *)v1[82];
  }
  (*(void (**)(_QWORD *))(*v7 + 8 * v15))(v7);
LABEL_16:
  v16 = (_QWORD *)v1[78];
  if (v16 == v6)
  {
    v17 = 4;
  }
  else
  {
    if (!v16)
      goto LABEL_21;
    v17 = 5;
    v6 = (_QWORD *)v1[78];
  }
  (*(void (**)(_QWORD *))(*v6 + 8 * v17))(v6);
LABEL_21:
  v18 = (_QWORD *)v1[74];
  if (v18 == v5)
  {
    v19 = 4;
  }
  else
  {
    if (!v18)
      goto LABEL_26;
    v19 = 5;
    v5 = (_QWORD *)v1[74];
  }
  (*(void (**)(_QWORD *))(*v5 + 8 * v19))(v5);
LABEL_26:
  v20 = (_QWORD *)v1[70];
  if (v20 == v4)
  {
    v21 = 4;
  }
  else
  {
    if (!v20)
      goto LABEL_31;
    v21 = 5;
    v4 = (_QWORD *)v1[70];
  }
  (*(void (**)(_QWORD *))(*v4 + 8 * v21))(v4);
LABEL_31:
  v22 = (_QWORD *)v1[66];
  if (v22 == v3)
  {
    v23 = 4;
  }
  else
  {
    if (!v22)
      goto LABEL_36;
    v23 = 5;
    v3 = (_QWORD *)v1[66];
  }
  (*(void (**)(_QWORD *))(*v3 + 8 * v23))(v3);
LABEL_36:
  v24 = (_QWORD *)v1[62];
  if (v24 == v2)
  {
    v25 = 4;
  }
  else
  {
    if (!v24)
      goto LABEL_41;
    v25 = 5;
    v2 = (_QWORD *)v1[62];
  }
  (*(void (**)(_QWORD *))(*v2 + 8 * v25))(v2);
LABEL_41:
  _Unwind_Resume(exception_object);
}

_QWORD *sub_2391C2F2C(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;

  v2 = a1 + 87;
  v3 = (_QWORD *)a1[90];
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
  }
  else
  {
    if (!v3)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*v3 + 8 * v4))();
LABEL_6:
  v5 = (_QWORD *)a1[86];
  if (v5 == a1 + 83)
  {
    v6 = 4;
    v5 = a1 + 83;
  }
  else
  {
    if (!v5)
      goto LABEL_11;
    v6 = 5;
  }
  (*(void (**)(void))(*v5 + 8 * v6))();
LABEL_11:
  v7 = (_QWORD *)a1[82];
  if (v7 == a1 + 79)
  {
    v8 = 4;
    v7 = a1 + 79;
  }
  else
  {
    if (!v7)
      goto LABEL_16;
    v8 = 5;
  }
  (*(void (**)(void))(*v7 + 8 * v8))();
LABEL_16:
  v9 = (_QWORD *)a1[78];
  if (v9 == a1 + 75)
  {
    v10 = 4;
    v9 = a1 + 75;
  }
  else
  {
    if (!v9)
      goto LABEL_21;
    v10 = 5;
  }
  (*(void (**)(void))(*v9 + 8 * v10))();
LABEL_21:
  v11 = (_QWORD *)a1[74];
  if (v11 == a1 + 71)
  {
    v12 = 4;
    v11 = a1 + 71;
  }
  else
  {
    if (!v11)
      goto LABEL_26;
    v12 = 5;
  }
  (*(void (**)(void))(*v11 + 8 * v12))();
LABEL_26:
  v13 = (_QWORD *)a1[70];
  if (v13 == a1 + 67)
  {
    v14 = 4;
    v13 = a1 + 67;
  }
  else
  {
    if (!v13)
      goto LABEL_31;
    v14 = 5;
  }
  (*(void (**)(void))(*v13 + 8 * v14))();
LABEL_31:
  v15 = (_QWORD *)a1[66];
  if (v15 == a1 + 63)
  {
    v16 = 4;
    v15 = a1 + 63;
  }
  else
  {
    if (!v15)
      goto LABEL_36;
    v16 = 5;
  }
  (*(void (**)(void))(*v15 + 8 * v16))();
LABEL_36:
  v17 = (_QWORD *)a1[62];
  if (v17 == a1 + 59)
  {
    v18 = 4;
    v17 = a1 + 59;
    goto LABEL_40;
  }
  if (v17)
  {
    v18 = 5;
LABEL_40:
    (*(void (**)(void))(*v17 + 8 * v18))();
  }
  return a1;
}

void sub_2391C30CC(uint64_t a1, int a2, int a3, double a4)
{
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  int v10;
  __int16 v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(a1 + 128) = a2;
  *(_BYTE *)(a1 + 129) = a3;
  *(double *)(a1 + 136) = a4;
  v7 = qword_2542CF610;
  if (os_log_type_enabled((os_log_t)qword_2542CF610, OS_LOG_TYPE_DEBUG))
  {
    v8[0] = 67175169;
    v8[1] = a2;
    v9 = 1025;
    v10 = a3;
    v11 = 2049;
    v12 = a4;
    _os_log_debug_impl(&dword_2390FD000, v7, OS_LOG_TYPE_DEBUG, "SessionHandler,helo,%{private}d,earlyreturn,%{private}d,targetvunc,%{private}f.02", (uint8_t *)v8, 0x18u);
  }
}

void sub_2391C31A8(uint64_t a1)
{
  int v2;
  int v3;
  int v4;
  int v5;
  _BOOL4 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  NSObject *v11;
  uint64_t v12;
  double v13;
  double v14;
  _OWORD v15[6];
  uint64_t v16;
  _DWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  int v23;
  char v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[31];
  uint8_t buf[4];
  double v38;
  __int16 v39;
  double v40;
  __int16 v41;
  double v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  *(double *)(a1 + 120) = (double)sub_239184EE8() * 0.000000001;
  v2 = *(_DWORD *)(a1 + 164);
  if (v2)
  {
    v3 = *(_DWORD *)(a1 + 52);
    v4 = *(unsigned __int8 *)(a1 + 264) >> (v3 == 1);
    v5 = *(_DWORD *)a1;
    v6 = *(_DWORD *)(a1 + 56) == 2;
    v17[0] = *(_DWORD *)(a1 + 160);
    v17[1] = v2;
    v17[2] = v6;
    v17[3] = v3;
    v17[4] = v5;
    v20 = *(_OWORD *)(a1 + 212);
    v21 = *(_OWORD *)(a1 + 228);
    v22 = *(_OWORD *)(a1 + 244);
    v23 = *(_DWORD *)(a1 + 260);
    v18 = *(_OWORD *)(a1 + 180);
    v19 = *(_OWORD *)(a1 + 196);
    v24 = v4;
    *(_OWORD *)&v36[15] = *(_OWORD *)(a1 + 456);
    v7 = *(_OWORD *)(a1 + 441);
    v35 = *(_OWORD *)(a1 + 425);
    *(_OWORD *)v36 = v7;
    v29 = *(_OWORD *)(a1 + 329);
    v28 = *(_OWORD *)(a1 + 313);
    v27 = *(_OWORD *)(a1 + 297);
    v26 = *(_OWORD *)(a1 + 281);
    v33 = *(_OWORD *)(a1 + 393);
    v32 = *(_OWORD *)(a1 + 377);
    v31 = *(_OWORD *)(a1 + 361);
    v30 = *(_OWORD *)(a1 + 345);
    v34 = *(_OWORD *)(a1 + 409);
    v25 = *(_OWORD *)(a1 + 265);
    v8 = *(_OWORD *)(a1 + 80);
    v15[4] = *(_OWORD *)(a1 + 64);
    v15[5] = v8;
    v16 = *(_QWORD *)(a1 + 96);
    v9 = *(_OWORD *)(a1 + 16);
    v15[0] = *(_OWORD *)a1;
    v15[1] = v9;
    v10 = *(_OWORD *)(a1 + 48);
    v15[2] = *(_OWORD *)(a1 + 32);
    v15[3] = v10;
    sub_2391C33CC((int *)a1, (uint64_t)v17, (uint64_t)v15);
  }
  else
  {
    sub_2391C36B0((int *)a1);
  }
  v11 = qword_2542CF610;
  if (os_log_type_enabled((os_log_t)qword_2542CF610, OS_LOG_TYPE_DEBUG))
  {
    v14 = *(double *)(a1 + 112);
    v13 = *(double *)(a1 + 120);
    *(_DWORD *)buf = 134218496;
    v38 = v13 - v14;
    v39 = 2048;
    v40 = v14;
    v41 = 2048;
    v42 = v13;
    _os_log_debug_impl(&dword_2390FD000, v11, OS_LOG_TYPE_DEBUG, "SessionHandler,#out,TTFF,%f,starttime,%.2f,endtime,%.2f", buf, 0x20u);
  }
  buf[0] = 0;
  v12 = *(_QWORD *)(a1 + 688);
  if (!v12)
    sub_2391012B8();
  (*(void (**)(uint64_t, uint8_t *))(*(_QWORD *)v12 + 48))(v12, buf);
  sub_2391C3928((_QWORD *)a1);
}

uint64_t sub_2391C33CC(int *a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  NSObject *v20;
  __n128 v21;
  __n128 v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  int v28;
  int v29;
  int v30;
  char v31;
  char v32;
  int v33;
  uint64_t result;
  int v35;
  int v36;
  uint64_t v37;
  _DWORD v38[78];
  int __dst[78];
  uint8_t buf[8];
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  int v46;
  int v47;
  int v48;
  int v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  int v54;
  char v55;
  char v56;
  unint64_t v57;
  uint64_t v58;
  int v59;

  v6 = memcpy(__dst, (const void *)a2, sizeof(__dst));
  sub_2391C5E44((uint64_t)v6, __dst);
  v7 = qword_2542CF610;
  if (os_log_type_enabled((os_log_t)qword_2542CF610, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_2390FD000, v7, OS_LOG_TYPE_DEBUG, "SessionHandler,#out,setPositionReportAndSendSummaryReport", buf, 2u);
  }
  if (*(_DWORD *)(a2 + 8))
  {
    v8 = sub_2391BDC54();
    memcpy(v38, (const void *)a2, sizeof(v38));
    sub_2391C1D4C(v8, v38);
  }
  else
  {
    v9 = *((_QWORD *)a1 + 78);
    if (v9)
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v9 + 48))(v9, a2);
  }
  v10 = *(_DWORD *)(a2 + 92);
  v11 = *(_DWORD *)(a2 + 96);
  v12 = *(__int16 *)(a2 + 100);
  v13 = *(unsigned __int8 *)(a2 + 102);
  v14 = *(unsigned __int8 *)(a2 + 105);
  v35 = *(_DWORD *)(a2 + 8);
  v36 = *(_DWORD *)(a2 + 300);
  v37 = *(_QWORD *)(a2 + 304);
  v15 = *(unsigned __int16 *)(a3 + 8);
  v16 = *(_QWORD *)(a3 + 16);
  v17 = *(_QWORD *)(a3 + 32);
  v18 = *(int *)(a3 + 52);
  v19 = *(_BYTE *)(a3 + 64);
  v20 = qword_2542CF610;
  if (os_log_type_enabled((os_log_t)qword_2542CF610, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_2390FD000, v20, OS_LOG_TYPE_DEBUG, "SessionHandler,#out,setSummaryReport", buf, 2u);
  }
  if (v12 >= 0)
    v23 = (double)(v12 & 0x7FFF);
  else
    v23 = -(double)(v12 & 0x7FFF);
  v24 = -1.0;
  v25 = -1.0;
  if (v13 != 255)
    v25 = (pow(1.1, (double)v13) + -1.0) * 10.0;
  v26 = (double)v11 * 0.0000107288373;
  if (v14 != 255)
    v24 = (pow(1.025, (double)v14) + -1.0) * 45.0;
  v27 = *((double *)a1 + 15) - *((double *)a1 + 14);
  if (v35)
    v28 = 2;
  else
    v28 = 1;
  if (v35)
    v29 = 3;
  else
    v29 = 1;
  if (v18 > 4)
    v30 = 0;
  else
    v30 = dword_2391D2FA4[v18];
  v31 = *((_BYTE *)a1 + 128);
  v32 = *((_BYTE *)a1 + 63);
  v33 = *a1;
  *(double *)buf = (double)v10 * 0.0000107288373;
  v41 = v26 + v26;
  v42 = v23;
  v43 = v25;
  v44 = v24;
  v45 = v27;
  v46 = v36;
  v47 = 2;
  v48 = v28;
  v49 = v30;
  v50 = (double)v15;
  v51 = v16;
  v52 = v17;
  v53 = v29;
  v54 = 1;
  v55 = v31;
  v56 = v32;
  v57 = ((unint64_t)(v19 & 4) << 17) | (4 * (v19 & 3));
  v58 = v37;
  v59 = v33;
  result = *((_QWORD *)a1 + 62);
  if (result)
  {
    v21.n128_f64[0] = (double)v10 * 0.0000107288373;
    v22.n128_f64[0] = v26 + v26;
    return (*(uint64_t (**)(uint64_t, uint8_t *, __n128, __n128))(*(_QWORD *)result + 48))(result, buf, v21, v22);
  }
  return result;
}

void sub_2391C36B0(int *a1)
{
  __int128 v2;
  int v3;
  int v4;
  unint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  unint64_t v17;
  int v18;
  uint64_t v24;
  _OWORD v25[3];
  uint64_t v26;
  int v27;
  int v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  int v33;
  char v34;
  char v35;
  unint64_t v36;
  uint64_t v37;
  int v38;
  uint8_t __dst[312];
  uint8_t buf[8];
  _BYTE __src[312];

  *(_QWORD *)__src = 0;
  *(_QWORD *)&__src[8] = -1;
  *(_QWORD *)&__src[16] = -1;
  *(_WORD *)&__src[24] = 0;
  __src[26] = -1;
  *(_QWORD *)&__src[28] = -1;
  *(_QWORD *)&__src[35] = -1;
  *(_QWORD *)&__src[44] = 0xFFFFFFFF00000004;
  *(_WORD *)&__src[52] = -1;
  __src[54] = -1;
  *(_DWORD *)&__src[56] = -1;
  *(_WORD *)&__src[60] = 0;
  *(_QWORD *)&__src[64] = 0x7FFFFFFF000000FFLL;
  *(_DWORD *)&__src[72] = 0x7FFFFFFF;
  __src[76] = -1;
  *(_OWORD *)&__src[80] = xmmword_2391C7E30;
  *(_QWORD *)&__src[96] = 0xFFFFFFFF7FFFFFFFLL;
  *(_DWORD *)&__src[103] = -1;
  *(_QWORD *)&__src[108] = 0x8000000080000000;
  *(_DWORD *)&__src[116] = -1;
  *(_WORD *)&__src[120] = -1;
  *(_QWORD *)&v2 = 0x8000000080000000;
  *((_QWORD *)&v2 + 1) = 0x8000000080000000;
  *(_OWORD *)&__src[124] = v2;
  *(_WORD *)&__src[140] = -1;
  __src[144] = -1;
  memset_pattern16(&__src[148], &unk_2391C7E50, 0x78uLL);
  __src[268] = -1;
  *(_DWORD *)&__src[272] = 255;
  *(_QWORD *)&__src[292] = -1;
  *(_QWORD *)&__src[276] = -1;
  *(_QWORD *)&__src[283] = -1;
  *(_DWORD *)&__src[300] = 0;
  *(_QWORD *)&__src[304] = 0;
  if (*a1)
  {
    v4 = a1[13];
    v3 = a1[14];
    *(_DWORD *)&__src[16] = *a1;
    v5 = 0x8FFFFFFFCLL;
    *(_QWORD *)__src = 0x8FFFFFFFCLL;
    *(_DWORD *)&__src[8] = v3 != 1;
    *(_DWORD *)&__src[12] = v4;
    if (v3 == 1)
    {
      v8 = *((_QWORD *)a1 + 78);
      if (!v8 || ((*(void (**)(uint64_t, _BYTE *))(*(_QWORD *)v8 + 48))(v8, __src), !*(_DWORD *)&__src[8]))
      {
        v10 = 1;
        v9 = 1;
        goto LABEL_10;
      }
    }
    else
    {
      v6 = sub_2391BDC54();
      memcpy(__dst, __src, sizeof(__dst));
      sub_2391C1D4C(v6, __dst);
    }
    v9 = 2;
    v10 = 3;
LABEL_10:
    v11 = a1[13];
    if (v11 > 4)
      v12 = 0;
    else
      v12 = dword_2391D2FA4[v11];
    LOWORD(v5) = *((_WORD *)a1 + 4);
    v13 = *((_QWORD *)a1 + 2);
    v14 = *((_QWORD *)a1 + 4);
    v15 = *((_BYTE *)a1 + 128);
    v16 = *((_BYTE *)a1 + 63);
    v17 = ((unint64_t)(a1[16] & 4) << 17) | (4 * (a1[16] & 3));
    v18 = *a1;
    v25[0] = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    v25[1] = xmmword_2391D28E0;
    __asm { FMOV            V3.2D, #-1.0 }
    v25[2] = _Q3;
    v26 = 0;
    v27 = v9;
    v28 = v12;
    v29 = (double)v5;
    v30 = v13;
    v31 = v14;
    v32 = v10;
    v33 = 11;
    v34 = v15;
    v35 = v16;
    v36 = v17;
    v37 = 0;
    v38 = v18;
    v24 = *((_QWORD *)a1 + 62);
    if (v24)
      (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)v24 + 48))(v24, v25);
    return;
  }
  v7 = qword_2542CF618;
  if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_2390FD000, v7, OS_LOG_TYPE_ERROR, "SessionHandler,#out,sendPosMethodFailure,no active session", buf, 2u);
  }
}

void sub_2391C3928(_QWORD *a1)
{
  __int128 v2;
  _BYTE __src[312];

  a1[14] = 0;
  a1[15] = 0;
  *(_QWORD *)__src = 0;
  *(_QWORD *)&__src[8] = -1;
  *(_QWORD *)&__src[16] = -1;
  *(_WORD *)&__src[24] = 0;
  __src[26] = -1;
  *(_QWORD *)&__src[28] = -1;
  *(_QWORD *)&__src[35] = -1;
  *(_QWORD *)&__src[44] = 0xFFFFFFFF00000004;
  *(_WORD *)&__src[52] = -1;
  __src[54] = -1;
  *(_DWORD *)&__src[56] = -1;
  *(_WORD *)&__src[60] = 0;
  *(_QWORD *)&__src[64] = 0x7FFFFFFF000000FFLL;
  *(_DWORD *)&__src[72] = 0x7FFFFFFF;
  __src[76] = -1;
  *(_OWORD *)&__src[80] = xmmword_2391C7E30;
  *(_QWORD *)&__src[96] = 0xFFFFFFFF7FFFFFFFLL;
  *(_DWORD *)&__src[103] = -1;
  *(_QWORD *)&__src[108] = 0x8000000080000000;
  *(_DWORD *)&__src[116] = -1;
  *(_WORD *)&__src[120] = -1;
  *(_QWORD *)&v2 = 0x8000000080000000;
  *((_QWORD *)&v2 + 1) = 0x8000000080000000;
  *(_OWORD *)&__src[124] = v2;
  *(_WORD *)&__src[140] = -1;
  *(_QWORD *)&__src[144] = 255;
  memset_pattern16(&__src[148], &unk_2391C7E50, 0x78uLL);
  __src[268] = -1;
  *(_DWORD *)&__src[272] = 255;
  *(_QWORD *)&__src[276] = -1;
  *(_QWORD *)&__src[283] = -1;
  *(_QWORD *)&__src[292] = -1;
  *(_DWORD *)&__src[300] = 0;
  *(_QWORD *)&__src[304] = 0;
  memcpy(a1 + 20, __src, 0x138uLL);
  sub_2391C5D78((uint64_t)a1);
  sub_2391C5A10((uint64_t)a1);
}

BOOL sub_2391C3A48(uint64_t a1, uint64_t a2, int a3)
{
  NSObject *v6;
  int v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  _BOOL8 result;
  const char *v12;
  int v13;
  int v14;
  int v15;
  unsigned int v16;
  NSObject *v17;
  uint32_t v18;
  int v19;
  uint64_t v20;
  int v21;
  long double v22;
  double v23;
  unsigned int v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  NSObject *v28;
  _BOOL4 v29;
  int v30;
  __int16 v31;
  double v32;
  unsigned int v33;
  double v34;
  unsigned int v35;
  NSObject *v36;
  double v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  _OWORD v45[6];
  uint64_t v46;
  uint8_t buf[4];
  int v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  double v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  if (*(_WORD *)a2)
  {
    v6 = qword_2542CF628;
    if (os_log_type_enabled((os_log_t)qword_2542CF628, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2390FD000, v6, OS_LOG_TYPE_DEFAULT, "SessionHandler,#input,nilrPositionRequest,Periodic Sessions", buf, 2u);
    }
  }
  v7 = *(_DWORD *)(a2 + 4);
  if (v7 != -1)
  {
    v8 = *(unsigned __int16 *)(a2 + 8);
    if ((v8 - 1) >= 0x80)
    {
      v10 = qword_2542CF618;
      result = os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR);
      if (result)
      {
        *(_WORD *)buf = 0;
        v12 = "SessionHandler,#input,nilrPositionRequest,Invalid responseTime";
        goto LABEL_28;
      }
      return result;
    }
    v9 = *(_WORD *)(a2 + 28);
    if ((v9 & 1) == 0)
    {
      v10 = qword_2542CF618;
      result = os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR);
      if (result)
      {
        *(_WORD *)buf = 0;
        v12 = "SessionHandler,#input,nilrPositionRequest,Invalid requestedGnss,should be GPS only";
LABEL_28:
        v17 = v10;
        v18 = 2;
LABEL_29:
        _os_log_error_impl(&dword_2390FD000, v17, OS_LOG_TYPE_ERROR, v12, buf, v18);
        return 0;
      }
      return result;
    }
    v13 = *(_DWORD *)(a2 + 36);
    if (v13 == -1)
    {
      v10 = qword_2542CF618;
      result = os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR);
      if (result)
      {
        *(_WORD *)buf = 0;
        v12 = "SessionHandler,#input,nilrPositionRequest,Invalid pos protocol";
        goto LABEL_28;
      }
      return result;
    }
    v14 = *(char *)(a2 + 10);
    if (v14 < 0)
    {
      v10 = qword_2542CF618;
      result = os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR);
      if (result)
      {
        *(_WORD *)buf = 0;
        v12 = "SessionHandler,#input,nilrPositionRequest,Invalid HAcc";
        goto LABEL_28;
      }
      return result;
    }
    v15 = *(_DWORD *)(a2 + 20);
    if (v15)
    {
      if (*(char *)(a2 + 17) < 0)
      {
        v10 = qword_2542CF618;
        result = os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR);
        if (result)
        {
          *(_WORD *)buf = 0;
          v12 = "SessionHandler,#input,#nilr,nilrPositionRequest,Invalid VAcc";
          goto LABEL_28;
        }
        return result;
      }
      if (*(unsigned __int8 *)(a2 + 18) >= 0x65u)
      {
        v10 = qword_2542CF618;
        result = os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR);
        if (result)
        {
          *(_WORD *)buf = 0;
          v12 = "SessionHandler,#input,#nilr,nilrPositionRequest,Invalid VConf";
          goto LABEL_28;
        }
        return result;
      }
    }
    v16 = *(unsigned __int8 *)(a2 + 16);
    if (v16 >= 0x65)
    {
      v10 = qword_2542CF618;
      result = os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR);
      if (result)
      {
        *(_WORD *)buf = 0;
        v12 = "SessionHandler,#input,#nilr,nilrPositionRequest,Invalid HConf";
        goto LABEL_28;
      }
      return result;
    }
    v19 = *(unsigned __int8 *)(a2 + 30);
    if (*(_BYTE *)(a2 + 30) && (v19 & 0xB7) == 0)
    {
      v20 = qword_2542CF618;
      result = os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR);
      if (result)
      {
        *(_DWORD *)buf = 67109120;
        v48 = v19;
        v12 = "SessionHandler,#input,#nilr,nilrPositionRequest,ShapeType Not Supported, %u";
        v17 = v20;
        v18 = 8;
        goto LABEL_29;
      }
      return result;
    }
    v21 = *(_DWORD *)(a2 + 40);
    if (*(_DWORD *)a1 == v21)
    {
      *(_DWORD *)(a1 + 4) = v7;
      *(_WORD *)(a1 + 8) = v8;
      v22 = pow(1.1, (double)v14);
      v23 = -1.0;
      *(long double *)(a1 + 16) = (v22 + -1.0) * 10.0;
      *(_BYTE *)(a1 + 24) = *(_DWORD *)(a2 + 12) != 0;
      *(_BYTE *)(a1 + 25) = v16;
      v24 = *(unsigned __int8 *)(a2 + 17);
      if (v24 != 255)
        v23 = (pow(1.025, (double)v24) + -1.0) * 45.0;
      *(double *)(a1 + 32) = v23;
      *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 18);
      *(_DWORD *)(a1 + 44) = v15;
      *(_WORD *)(a1 + 48) = v9;
      *(_BYTE *)(a1 + 50) = *(_BYTE *)(a2 + 31);
      *(_DWORD *)(a1 + 52) = v13;
      *(_DWORD *)(a1 + 56) = a3;
      v25 = *(_OWORD *)(a1 + 80);
      v45[4] = *(_OWORD *)(a1 + 64);
      v45[5] = v25;
      v46 = *(_QWORD *)(a1 + 96);
      v26 = *(_OWORD *)(a1 + 16);
      v45[0] = *(_OWORD *)a1;
      v45[1] = v26;
      v27 = *(_OWORD *)(a1 + 48);
      v45[2] = *(_OWORD *)(a1 + 32);
      v45[3] = v27;
      sub_2391C41BC((int *)v45);
      goto LABEL_55;
    }
    if (*(_DWORD *)a1)
    {
      v28 = qword_2542CF610;
      v29 = os_log_type_enabled((os_log_t)qword_2542CF610, OS_LOG_TYPE_DEBUG);
      if (!v13)
      {
        if (v29)
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_2390FD000, v28, OS_LOG_TYPE_DEBUG, "SessionHandler,#input,#nilr,nilrPositionRequest,RRLP session. Updating only session ID", buf, 2u);
          v21 = *(_DWORD *)(a2 + 40);
        }
        *(_DWORD *)a1 = v21;
        goto LABEL_55;
      }
      if (v29)
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_2390FD000, v28, OS_LOG_TYPE_DEBUG, "SessionHandler,#input,#nilr,nilrPositionRequest,delete the existing active session", buf, 2u);
      }
      *(_QWORD *)a1 = 0xFFFFFFFF00000000;
      *(_WORD *)(a1 + 8) = -1;
      *(_QWORD *)(a1 + 16) = 0;
      *(_WORD *)(a1 + 24) = 0;
      *(_QWORD *)(a1 + 32) = 0;
      *(_BYTE *)(a1 + 40) = 0;
      *(_DWORD *)(a1 + 44) = 0;
      *(_WORD *)(a1 + 48) = 0;
      *(_BYTE *)(a1 + 50) = -1;
      *(_DWORD *)(a1 + 52) = -1;
      *(_QWORD *)(a1 + 56) = 0;
      *(_BYTE *)(a1 + 64) = 0;
      *(_DWORD *)(a1 + 68) = 0;
      *(_QWORD *)(a1 + 72) = -1;
      *(_QWORD *)(a1 + 92) = -1;
      *(_DWORD *)(a1 + 100) = -1;
      *(_WORD *)(a1 + 88) = -1;
      *(_DWORD *)(a1 + 80) = 0x7FFFFFFF;
      *(_DWORD *)(a1 + 84) = -1;
      v30 = *(_DWORD *)(a2 + 4);
      v31 = *(_WORD *)(a2 + 8);
      v14 = *(unsigned __int8 *)(a2 + 10);
      *(_DWORD *)a1 = *(_DWORD *)(a2 + 40);
      *(_DWORD *)(a1 + 4) = v30;
      *(_WORD *)(a1 + 8) = v31;
      if (v14 == 255)
      {
        v32 = -1.0;
LABEL_48:
        *(double *)(a1 + 16) = v32;
        *(_BYTE *)(a1 + 24) = *(_DWORD *)(a2 + 12) != 0;
        *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 16);
        v33 = *(unsigned __int8 *)(a2 + 17);
        if (v33 == 255)
          v34 = -1.0;
        else
          v34 = (pow(1.025, (double)v33) + -1.0) * 45.0;
        *(double *)(a1 + 32) = v34;
        *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 18);
        *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 20);
        *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 28);
        *(_BYTE *)(a1 + 50) = *(_BYTE *)(a2 + 31);
        *(_DWORD *)(a1 + 52) = *(_DWORD *)(a2 + 36);
        *(_DWORD *)(a1 + 56) = a3;
LABEL_55:
        if (*(_DWORD *)(a2 + 20))
        {
          v35 = *(unsigned __int8 *)(a2 + 17);
          if (*(_BYTE *)(a2 + 17))
          {
            v36 = qword_2542CF610;
            if (os_log_type_enabled((os_log_t)qword_2542CF610, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_2390FD000, v36, OS_LOG_TYPE_DEBUG, "SessionHandler,#nilr,nilrPositionRequest,update target vertical uncertainty to minimum", buf, 2u);
              v35 = *(unsigned __int8 *)(a2 + 17);
            }
            if (v35 == 255)
              v37 = -1.0;
            else
              v37 = (pow(1.025, (double)v35) + -1.0) * 45.0;
            if (v37 >= *(double *)(a1 + 136))
              v37 = *(double *)(a1 + 136);
            *(double *)(a1 + 136) = v37;
          }
        }
        if (*(_BYTE *)(a1 + 64) != 7 && *(_DWORD *)(a2 + 24))
        {
          v38 = qword_2542CF610;
          if (os_log_type_enabled((os_log_t)qword_2542CF610, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_2390FD000, v38, OS_LOG_TYPE_DEBUG, "SessionHandler,#nilr,nilrPositionRequest,requesting additional assistance", buf, 2u);
          }
          sub_2391C42C4(a1);
          if (!*(_DWORD *)(a2 + 36))
            *(_BYTE *)(a1 + 62) = 1;
        }
        buf[0] = 1;
        v39 = *(_QWORD *)(a1 + 688);
        if (!v39)
          sub_2391012B8();
        (*(void (**)(uint64_t, uint8_t *))(*(_QWORD *)v39 + 48))(v39, buf);
        sub_2391C45F0(a1, *(unsigned __int8 *)(a2 + 8));
        v40 = qword_2542CF610;
        if (os_log_type_enabled((os_log_t)qword_2542CF610, OS_LOG_TYPE_DEBUG))
        {
          v41 = *(unsigned __int8 *)(a1 + 129);
          v42 = *(_QWORD *)(a1 + 16);
          v43 = *(_QWORD *)(a1 + 32);
          v44 = sub_239184EE8();
          *(_DWORD *)buf = 67109889;
          v48 = v41;
          v49 = 2049;
          v50 = v42;
          v51 = 2049;
          v52 = v43;
          v53 = 2048;
          v54 = (double)v44 * 0.000000001;
          _os_log_debug_impl(&dword_2390FD000, v40, OS_LOG_TYPE_DEBUG, "SessionHandler,#nilr,nilrPositionRequest,config,early_return=%d,hacc=%{private}.6f,vacc=%{private}.6f,startTime=%.6f", buf, 0x26u);
        }
        return 1;
      }
    }
    else
    {
      *(_DWORD *)a1 = v21;
      *(_DWORD *)(a1 + 4) = v7;
      *(_WORD *)(a1 + 8) = v8;
    }
    v32 = (pow(1.1, (double)v14) + -1.0) * 10.0;
    goto LABEL_48;
  }
  v10 = qword_2542CF618;
  result = os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR);
  if (result)
  {
    *(_WORD *)buf = 0;
    v12 = "SessionHandler,#input,nilrPositionRequest,Invalid Methodtype";
    goto LABEL_28;
  }
  return result;
}

void sub_2391C41BC(int *a1)
{
  NSObject *v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  _DWORD v12[2];
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v2 = qword_2542CF610;
  if (os_log_type_enabled((os_log_t)qword_2542CF610, OS_LOG_TYPE_DEBUG))
  {
    v3 = *a1;
    v4 = a1[1];
    v5 = *((unsigned __int16 *)a1 + 4);
    v6 = *((_QWORD *)a1 + 2);
    v7 = *((_QWORD *)a1 + 4);
    v8 = a1[13];
    v9 = a1[14];
    v10 = a1[11];
    v11 = *((unsigned __int8 *)a1 + 24);
    v12[0] = 67176705;
    v12[1] = v3;
    v13 = 1025;
    v14 = v4;
    v15 = 1025;
    v16 = v5;
    v17 = 2049;
    v18 = v6;
    v19 = 2049;
    v20 = v7;
    v21 = 1024;
    v22 = v8;
    v23 = 1024;
    v24 = v9;
    v25 = 1025;
    v26 = v10;
    v27 = 1025;
    v28 = v11;
    _os_log_debug_impl(&dword_2390FD000, v2, OS_LOG_TYPE_DEBUG, "SessionHandler,#logFix,session info id=%{private}u,method=%{private}u,respTime=%{private}d,hacc=%{private}.6f,vacc=%{private}.6f,posProto=%d,sesnType=%d,vertRequested=%{private}d,velRequested=%{private}d", (uint8_t *)v12, 0x40u);
  }
}

void sub_2391C42C4(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  int v9;
  unsigned int v10;
  _BOOL4 v11;
  int v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  int *v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  int v31;
  unsigned __int8 v32;
  unint64_t v33;
  int v34;
  unsigned __int16 v35;
  int v36;
  char v37;
  _BYTE v38[29];
  char v39;
  char v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v31 = 0;
  v32 = 0;
  v33 = -1;
  v34 = -1;
  v35 = 0;
  v36 = -1;
  v37 = -1;
  memset(v38, 0, 14);
  v38[14] = -1;
  memset(&v38[15], 0, 14);
  v2 = &v41;
  v3 = 112;
  v39 = -1;
  v4 = 262;
  v40 = 0;
  do
  {
    *(_DWORD *)v2 = 5;
    *((_WORD *)v2 + 2) = 0;
    v5 = v3;
    *((_BYTE *)v2 + 6) = -1;
    do
    {
      v6 = (char *)&v31 + v5;
      *v6 = -1;
      *((_DWORD *)v6 + 1) = -1;
      v5 += 8;
    }
    while (v6 + 8 != (char *)(v2 + 16));
    *((_DWORD *)v2 + 32) = -1;
    *((_WORD *)v2 + 66) = -1;
    *(_DWORD *)((char *)v2 + 134) = -256;
    *(uint64_t *)((char *)v2 + 138) = 0;
    v2[18] = 0;
    *((_DWORD *)v2 + 38) = -1;
    v7 = v4;
    *((_BYTE *)v2 + 156) = -1;
    do
    {
      v8 = (char *)&v31 + v7;
      *v8 = -1;
      *((_WORD *)v8 + 1) = -1;
      v7 += 4;
    }
    while (v8 + 4 != (char *)v2 + 218);
    *(_DWORD *)((char *)v2 + 218) = -1;
    v2 += 28;
    v3 += 224;
    v4 += 224;
  }
  while (v2 != &v42);
  v9 = *(_DWORD *)a1;
  if (!*(_DWORD *)a1)
  {
    v16 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      _os_log_error_impl(&dword_2390FD000, v16, OS_LOG_TYPE_ERROR, "SessionHandler,#process,requestAdditionalAssistance,no active session", (uint8_t *)&v18, 2u);
    }
    return;
  }
  v10 = *(_DWORD *)(a1 + 52);
  v11 = *(_DWORD *)(a1 + 56) != 1;
  v33 = __PAIR64__(v10, v11);
  v34 = v9;
  v31 = -8;
  v12 = v32 | 1;
  v32 |= 1u;
  v13 = *(_BYTE *)(a1 + 64);
  if ((v13 & 1) != 0)
  {
    if ((*(_BYTE *)(a1 + 64) & 2) != 0)
      goto LABEL_10;
LABEL_18:
    v35 |= 0x20u;
    if ((v13 & 4) != 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  v35 |= 0x40u;
  if ((v13 & 2) == 0)
    goto LABEL_18;
LABEL_10:
  if ((v13 & 4) == 0)
LABEL_11:
    v35 |= 8u;
LABEL_12:
  v39 = 3;
  v36 = 0;
  v14 = qword_2542CF610;
  if (os_log_type_enabled((os_log_t)qword_2542CF610, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v18) = 67177217;
    HIDWORD(v18) = v35;
    v19 = 0x401FFFFFFF80401;
    LODWORD(v20) = v12;
    WORD2(v20) = 1025;
    *(_DWORD *)((char *)&v20 + 6) = v9;
    WORD5(v20) = 1025;
    HIDWORD(v20) = v10;
    LOWORD(v21) = 1025;
    *(_DWORD *)((char *)&v21 + 2) = v11;
    HIWORD(v21) = 1024;
    v22 = 0;
    v23 = 1024;
    v24 = 0;
    v25 = 1024;
    v26 = v35;
    v27 = 1024;
    v28 = 0;
    v29 = 1024;
    v30 = 3;
    _os_log_debug_impl(&dword_2390FD000, v14, OS_LOG_TYPE_DEBUG, "SessionHandler,#out,requestAdditionalAssistance,%{private}d,result,%{private}d,responseType,%{private}d,sessionId,%{private}u,posProtocol,%{private}d,sessionProtocol,%{private}d.gToe,%d,gWeek,%d,aidMask,%d,numOfSats,%d,toeLimit,%d", (uint8_t *)&v18, 0x44u);
    if ((_DWORD)v33)
      goto LABEL_14;
  }
  else if (v11)
  {
LABEL_14:
    v15 = *(NSObject **)(sub_2391BDC54() + 88);
    v18 = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    *(_QWORD *)&v20 = sub_2391C2890;
    *((_QWORD *)&v20 + 1) = &unk_250A6BEF8;
    v21 = &v31;
    dispatch_async(v15, &v18);
    return;
  }
  v17 = *(_QWORD *)(a1 + 656);
  if (v17)
    (*(void (**)(uint64_t, int *))(*(_QWORD *)v17 + 48))(v17, &v31);
}

void sub_2391C45F0(uint64_t a1, unsigned int a2)
{
  unsigned __int8 v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD handler[5];
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  sub_2391C5A10(a1);
  if (a2 <= 2)
    v4 = a2;
  else
    v4 = a2 - 2;
  if (!*(_QWORD *)(a1 + 104))
  {
    v5 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *(dispatch_queue_t *)(a1 + 144));
    *(_QWORD *)(a1 + 104) = v5;
    v6 = qword_2542CF610;
    v7 = os_log_type_enabled((os_log_t)qword_2542CF610, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      if (v7)
      {
        *(_DWORD *)buf = 67109120;
        v12 = v4;
        _os_log_debug_impl(&dword_2390FD000, v6, OS_LOG_TYPE_DEBUG, "SessionHandler,#input,created timer,starting timer for,%d,seconds", buf, 8u);
        v5 = *(NSObject **)(a1 + 104);
      }
      v8 = dispatch_time(0, 1000000000 * v4);
      dispatch_source_set_timer(v5, v8, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
      *(double *)(a1 + 112) = (double)sub_239184EE8() * 0.000000001;
      v9 = *(NSObject **)(a1 + 104);
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = sub_2391C5AA0;
      handler[3] = &unk_250A6BEF8;
      handler[4] = a1;
      dispatch_source_set_event_handler(v9, handler);
      dispatch_resume(*(dispatch_object_t *)(a1 + 104));
    }
    else if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_2390FD000, v6, OS_LOG_TYPE_DEBUG, "SessionHandler,fTimer NULL", buf, 2u);
    }
  }
}

void sub_2391C479C(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint8_t *v4;
  uint8_t *v5;
  NSObject *v6;
  uint8_t *v7;
  uint8_t *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD v12[3];
  _QWORD *v13;
  uint8_t buf[24];
  uint8_t *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a2 + 24))
  {
    v6 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2390FD000, v6, OS_LOG_TYPE_ERROR, "SessionHandler EmergencySessionSummaryReportCb NULL callback pointer ", buf, 2u);
    }
    return;
  }
  sub_239101254((uint64_t)v12, a2);
  v15 = 0;
  v3 = v13;
  if (v13)
  {
    v4 = (uint8_t *)operator new(0x28uLL);
    v5 = v4;
    *(_QWORD *)v4 = &off_250ABD2C8;
    if (v3 == v12)
    {
      *((_QWORD *)v4 + 4) = v4 + 8;
      (*(void (**)(_QWORD *))(v12[0] + 24))(v12);
    }
    else
    {
      *((_QWORD *)v4 + 4) = v3;
      v13 = 0;
    }
    v15 = v5;
  }
  else
  {
    v5 = 0;
  }
  v7 = (uint8_t *)(a1 + 472);
  if (buf != (uint8_t *)(a1 + 472))
  {
    v8 = *(uint8_t **)(a1 + 496);
    if (v8 == v7)
    {
      v5 = buf;
      (*(void (**)(uint8_t *, uint8_t *))(*(_QWORD *)v7 + 24))(v7, buf);
      (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 496) + 32))(*(_QWORD *)(a1 + 496));
      *(_QWORD *)(a1 + 496) = v15;
      v15 = buf;
      v9 = 4;
      goto LABEL_17;
    }
    v15 = *(uint8_t **)(a1 + 496);
    *(_QWORD *)(a1 + 496) = v5;
    v5 = v8;
    if (v8 == buf)
    {
      v9 = 4;
      v5 = buf;
      goto LABEL_17;
    }
  }
  if (v5)
  {
    v9 = 5;
LABEL_17:
    (*(void (**)(uint8_t *))(*(_QWORD *)v5 + 8 * v9))(v5);
  }
  v10 = v13;
  if (v13 == v12)
  {
    v11 = 4;
    v10 = v12;
  }
  else
  {
    if (!v13)
      return;
    v11 = 5;
  }
  (*(void (**)(void))(*v10 + 8 * v11))();
}

void sub_2391C4968(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
    sub_2390FEEE8(exception_object);
  _Unwind_Resume(exception_object);
}

void sub_2391C49B4(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint8_t *v4;
  uint8_t *v5;
  NSObject *v6;
  uint8_t *v7;
  uint8_t *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD v12[3];
  _QWORD *v13;
  uint8_t buf[24];
  uint8_t *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a2 + 24))
  {
    v6 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2390FD000, v6, OS_LOG_TYPE_ERROR, "SessionHandler NavModelCb NULL callback pointer", buf, 2u);
    }
    return;
  }
  sub_239101254((uint64_t)v12, a2);
  v15 = 0;
  v3 = v13;
  if (v13)
  {
    v4 = (uint8_t *)operator new(0x28uLL);
    v5 = v4;
    *(_QWORD *)v4 = &off_250ABD3B8;
    if (v3 == v12)
    {
      *((_QWORD *)v4 + 4) = v4 + 8;
      (*(void (**)(_QWORD *))(v12[0] + 24))(v12);
    }
    else
    {
      *((_QWORD *)v4 + 4) = v3;
      v13 = 0;
    }
    v15 = v5;
  }
  else
  {
    v5 = 0;
  }
  v7 = (uint8_t *)(a1 + 504);
  if (buf != (uint8_t *)(a1 + 504))
  {
    v8 = *(uint8_t **)(a1 + 528);
    if (v8 == v7)
    {
      v5 = buf;
      (*(void (**)(uint8_t *, uint8_t *))(*(_QWORD *)v7 + 24))(v7, buf);
      (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 528) + 32))(*(_QWORD *)(a1 + 528));
      *(_QWORD *)(a1 + 528) = v15;
      v15 = buf;
      v9 = 4;
      goto LABEL_17;
    }
    v15 = *(uint8_t **)(a1 + 528);
    *(_QWORD *)(a1 + 528) = v5;
    v5 = v8;
    if (v8 == buf)
    {
      v9 = 4;
      v5 = buf;
      goto LABEL_17;
    }
  }
  if (v5)
  {
    v9 = 5;
LABEL_17:
    (*(void (**)(uint8_t *))(*(_QWORD *)v5 + 8 * v9))(v5);
  }
  v10 = v13;
  if (v13 == v12)
  {
    v11 = 4;
    v10 = v12;
  }
  else
  {
    if (!v13)
      return;
    v11 = 5;
  }
  (*(void (**)(void))(*v10 + 8 * v11))();
}

void sub_2391C4B80(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
    sub_2390FEEE8(exception_object);
  _Unwind_Resume(exception_object);
}

void sub_2391C4BCC(uint64_t a1, _QWORD *a2)
{
  _QWORD *v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint8_t v10[24];
  uint8_t *v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v3 = (_QWORD *)a2[3];
  if (v3)
  {
    if (v3 == a2)
    {
      v11 = v10;
      (*(void (**)(_QWORD *, uint8_t *))(*a2 + 24))(a2, v10);
    }
    else
    {
      v11 = (uint8_t *)(*(uint64_t (**)(_QWORD *))(*v3 + 16))(v3);
    }
    v5 = a1 + 536;
    if (v10 != (uint8_t *)(a1 + 536))
    {
      v6 = v11;
      v7 = *(_QWORD *)(a1 + 560);
      if (v11 == v10)
      {
        if (v7 == v5)
        {
          (*(void (**)(uint8_t *, _QWORD *))(*(_QWORD *)v10 + 24))(v10, v12);
          (*(void (**)(uint8_t *))(*(_QWORD *)v11 + 32))(v11);
          v11 = 0;
          (*(void (**)(_QWORD, uint8_t *))(**(_QWORD **)(a1 + 560) + 24))(*(_QWORD *)(a1 + 560), v10);
          (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 560) + 32))(*(_QWORD *)(a1 + 560));
          *(_QWORD *)(a1 + 560) = 0;
          v11 = v10;
          (*(void (**)(_QWORD *, uint64_t))(v12[0] + 24))(v12, a1 + 536);
          (*(void (**)(_QWORD *))(v12[0] + 32))(v12);
        }
        else
        {
          (*(void (**)(uint8_t *, uint64_t))(*(_QWORD *)v10 + 24))(v10, a1 + 536);
          (*(void (**)(uint8_t *))(*(_QWORD *)v11 + 32))(v11);
          v11 = *(uint8_t **)(a1 + 560);
        }
        *(_QWORD *)(a1 + 560) = v5;
      }
      else if (v7 == v5)
      {
        (*(void (**)(uint64_t, uint8_t *))(*(_QWORD *)v5 + 24))(a1 + 536, v10);
        (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 560) + 32))(*(_QWORD *)(a1 + 560));
        *(_QWORD *)(a1 + 560) = v11;
        v11 = v10;
      }
      else
      {
        v11 = *(uint8_t **)(a1 + 560);
        *(_QWORD *)(a1 + 560) = v6;
      }
    }
    v8 = v11;
    if (v11 == v10)
    {
      v9 = 4;
      v8 = v10;
    }
    else
    {
      if (!v11)
        return;
      v9 = 5;
    }
    (*(void (**)(void))(*(_QWORD *)v8 + 8 * v9))();
  }
  else
  {
    v4 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_2390FD000, v4, OS_LOG_TYPE_ERROR, "SessionHandler RefTimeCb NULL callback pointer", v10, 2u);
    }
  }
}

void sub_2391C4E00(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  sub_2390FEEE8(a1);
}

void sub_2391C4E0C(uint64_t a1, _QWORD *a2)
{
  _QWORD *v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint8_t v10[24];
  uint8_t *v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v3 = (_QWORD *)a2[3];
  if (v3)
  {
    if (v3 == a2)
    {
      v11 = v10;
      (*(void (**)(_QWORD *, uint8_t *))(*a2 + 24))(a2, v10);
    }
    else
    {
      v11 = (uint8_t *)(*(uint64_t (**)(_QWORD *))(*v3 + 16))(v3);
    }
    v5 = a1 + 568;
    if (v10 != (uint8_t *)(a1 + 568))
    {
      v6 = v11;
      v7 = *(_QWORD *)(a1 + 592);
      if (v11 == v10)
      {
        if (v7 == v5)
        {
          (*(void (**)(uint8_t *, _QWORD *))(*(_QWORD *)v10 + 24))(v10, v12);
          (*(void (**)(uint8_t *))(*(_QWORD *)v11 + 32))(v11);
          v11 = 0;
          (*(void (**)(_QWORD, uint8_t *))(**(_QWORD **)(a1 + 592) + 24))(*(_QWORD *)(a1 + 592), v10);
          (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 592) + 32))(*(_QWORD *)(a1 + 592));
          *(_QWORD *)(a1 + 592) = 0;
          v11 = v10;
          (*(void (**)(_QWORD *, uint64_t))(v12[0] + 24))(v12, a1 + 568);
          (*(void (**)(_QWORD *))(v12[0] + 32))(v12);
        }
        else
        {
          (*(void (**)(uint8_t *, uint64_t))(*(_QWORD *)v10 + 24))(v10, a1 + 568);
          (*(void (**)(uint8_t *))(*(_QWORD *)v11 + 32))(v11);
          v11 = *(uint8_t **)(a1 + 592);
        }
        *(_QWORD *)(a1 + 592) = v5;
      }
      else if (v7 == v5)
      {
        (*(void (**)(uint64_t, uint8_t *))(*(_QWORD *)v5 + 24))(a1 + 568, v10);
        (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 592) + 32))(*(_QWORD *)(a1 + 592));
        *(_QWORD *)(a1 + 592) = v11;
        v11 = v10;
      }
      else
      {
        v11 = *(uint8_t **)(a1 + 592);
        *(_QWORD *)(a1 + 592) = v6;
      }
    }
    v8 = v11;
    if (v11 == v10)
    {
      v9 = 4;
      v8 = v10;
    }
    else
    {
      if (!v11)
        return;
      v9 = 5;
    }
    (*(void (**)(void))(*(_QWORD *)v8 + 8 * v9))();
  }
  else
  {
    v4 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_2390FD000, v4, OS_LOG_TYPE_ERROR, "SessionHandler RefLocationCb NULL callback pointer", v10, 2u);
    }
  }
}

void sub_2391C5040(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  sub_2390FEEE8(a1);
}

void sub_2391C504C(uint64_t a1, _QWORD *a2)
{
  _QWORD *v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint8_t v10[24];
  uint8_t *v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v3 = (_QWORD *)a2[3];
  if (v3)
  {
    if (v3 == a2)
    {
      v11 = v10;
      (*(void (**)(_QWORD *, uint8_t *))(*a2 + 24))(a2, v10);
    }
    else
    {
      v11 = (uint8_t *)(*(uint64_t (**)(_QWORD *))(*v3 + 16))(v3);
    }
    v5 = a1 + 600;
    if (v10 != (uint8_t *)(a1 + 600))
    {
      v6 = v11;
      v7 = *(_QWORD *)(a1 + 624);
      if (v11 == v10)
      {
        if (v7 == v5)
        {
          (*(void (**)(uint8_t *, _QWORD *))(*(_QWORD *)v10 + 24))(v10, v12);
          (*(void (**)(uint8_t *))(*(_QWORD *)v11 + 32))(v11);
          v11 = 0;
          (*(void (**)(_QWORD, uint8_t *))(**(_QWORD **)(a1 + 624) + 24))(*(_QWORD *)(a1 + 624), v10);
          (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 624) + 32))(*(_QWORD *)(a1 + 624));
          *(_QWORD *)(a1 + 624) = 0;
          v11 = v10;
          (*(void (**)(_QWORD *, uint64_t))(v12[0] + 24))(v12, a1 + 600);
          (*(void (**)(_QWORD *))(v12[0] + 32))(v12);
        }
        else
        {
          (*(void (**)(uint8_t *, uint64_t))(*(_QWORD *)v10 + 24))(v10, a1 + 600);
          (*(void (**)(uint8_t *))(*(_QWORD *)v11 + 32))(v11);
          v11 = *(uint8_t **)(a1 + 624);
        }
        *(_QWORD *)(a1 + 624) = v5;
      }
      else if (v7 == v5)
      {
        (*(void (**)(uint64_t, uint8_t *))(*(_QWORD *)v5 + 24))(a1 + 600, v10);
        (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 624) + 32))(*(_QWORD *)(a1 + 624));
        *(_QWORD *)(a1 + 624) = v11;
        v11 = v10;
      }
      else
      {
        v11 = *(uint8_t **)(a1 + 624);
        *(_QWORD *)(a1 + 624) = v6;
      }
    }
    v8 = v11;
    if (v11 == v10)
    {
      v9 = 4;
      v8 = v10;
    }
    else
    {
      if (!v11)
        return;
      v9 = 5;
    }
    (*(void (**)(void))(*(_QWORD *)v8 + 8 * v9))();
  }
  else
  {
    v4 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_2390FD000, v4, OS_LOG_TYPE_ERROR, "SessionHandler PosResponseCb NULL callback pointer", v10, 2u);
    }
  }
}

void sub_2391C5280(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  sub_2390FEEE8(a1);
}

void sub_2391C528C(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint8_t *v4;
  uint8_t *v5;
  NSObject *v6;
  uint8_t *v7;
  uint8_t *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD v12[3];
  _QWORD *v13;
  uint8_t buf[24];
  uint8_t *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a2 + 24))
  {
    v6 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2390FD000, v6, OS_LOG_TYPE_ERROR, "SessionHandler AssistanceNeededReportCb NULL callback pointer", buf, 2u);
    }
    return;
  }
  sub_239101254((uint64_t)v12, a2);
  v15 = 0;
  v3 = v13;
  if (v13)
  {
    v4 = (uint8_t *)operator new(0x28uLL);
    v5 = v4;
    *(_QWORD *)v4 = &off_250ABD4A8;
    if (v3 == v12)
    {
      *((_QWORD *)v4 + 4) = v4 + 8;
      (*(void (**)(_QWORD *))(v12[0] + 24))(v12);
    }
    else
    {
      *((_QWORD *)v4 + 4) = v3;
      v13 = 0;
    }
    v15 = v5;
  }
  else
  {
    v5 = 0;
  }
  v7 = (uint8_t *)(a1 + 632);
  if (buf != (uint8_t *)(a1 + 632))
  {
    v8 = *(uint8_t **)(a1 + 656);
    if (v8 == v7)
    {
      v5 = buf;
      (*(void (**)(uint8_t *, uint8_t *))(*(_QWORD *)v7 + 24))(v7, buf);
      (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 656) + 32))(*(_QWORD *)(a1 + 656));
      *(_QWORD *)(a1 + 656) = v15;
      v15 = buf;
      v9 = 4;
      goto LABEL_17;
    }
    v15 = *(uint8_t **)(a1 + 656);
    *(_QWORD *)(a1 + 656) = v5;
    v5 = v8;
    if (v8 == buf)
    {
      v9 = 4;
      v5 = buf;
      goto LABEL_17;
    }
  }
  if (v5)
  {
    v9 = 5;
LABEL_17:
    (*(void (**)(uint8_t *))(*(_QWORD *)v5 + 8 * v9))(v5);
  }
  v10 = v13;
  if (v13 == v12)
  {
    v11 = 4;
    v10 = v12;
  }
  else
  {
    if (!v13)
      return;
    v11 = 5;
  }
  (*(void (**)(void))(*v10 + 8 * v11))();
}

void sub_2391C5458(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
    sub_2390FEEE8(exception_object);
  _Unwind_Resume(exception_object);
}

void sub_2391C54A4(uint64_t a1, _QWORD *a2)
{
  _QWORD *v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint8_t v10[24];
  uint8_t *v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v3 = (_QWORD *)a2[3];
  if (v3)
  {
    if (v3 == a2)
    {
      v11 = v10;
      (*(void (**)(_QWORD *, uint8_t *))(*a2 + 24))(a2, v10);
    }
    else
    {
      v11 = (uint8_t *)(*(uint64_t (**)(_QWORD *))(*v3 + 16))(v3);
    }
    v5 = a1 + 664;
    if (v10 != (uint8_t *)(a1 + 664))
    {
      v6 = v11;
      v7 = *(_QWORD *)(a1 + 688);
      if (v11 == v10)
      {
        if (v7 == v5)
        {
          (*(void (**)(uint8_t *, _QWORD *))(*(_QWORD *)v10 + 24))(v10, v12);
          (*(void (**)(uint8_t *))(*(_QWORD *)v11 + 32))(v11);
          v11 = 0;
          (*(void (**)(_QWORD, uint8_t *))(**(_QWORD **)(a1 + 688) + 24))(*(_QWORD *)(a1 + 688), v10);
          (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 688) + 32))(*(_QWORD *)(a1 + 688));
          *(_QWORD *)(a1 + 688) = 0;
          v11 = v10;
          (*(void (**)(_QWORD *, uint64_t))(v12[0] + 24))(v12, a1 + 664);
          (*(void (**)(_QWORD *))(v12[0] + 32))(v12);
        }
        else
        {
          (*(void (**)(uint8_t *, uint64_t))(*(_QWORD *)v10 + 24))(v10, a1 + 664);
          (*(void (**)(uint8_t *))(*(_QWORD *)v11 + 32))(v11);
          v11 = *(uint8_t **)(a1 + 688);
        }
        *(_QWORD *)(a1 + 688) = v5;
      }
      else if (v7 == v5)
      {
        (*(void (**)(uint64_t, uint8_t *))(*(_QWORD *)v5 + 24))(a1 + 664, v10);
        (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 688) + 32))(*(_QWORD *)(a1 + 688));
        *(_QWORD *)(a1 + 688) = v11;
        v11 = v10;
      }
      else
      {
        v11 = *(uint8_t **)(a1 + 688);
        *(_QWORD *)(a1 + 688) = v6;
      }
    }
    v8 = v11;
    if (v11 == v10)
    {
      v9 = 4;
      v8 = v10;
    }
    else
    {
      if (!v11)
        return;
      v9 = 5;
    }
    (*(void (**)(void))(*(_QWORD *)v8 + 8 * v9))();
  }
  else
  {
    v4 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_2390FD000, v4, OS_LOG_TYPE_ERROR, "SessionHandler setNilrSessionIndicationCb NULL callback pointer", v10, 2u);
    }
  }
}

void sub_2391C56D8(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  sub_2390FEEE8(a1);
}

void sub_2391C56E4(uint64_t a1, _QWORD *a2)
{
  _QWORD *v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint8_t v10[24];
  uint8_t *v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v3 = (_QWORD *)a2[3];
  if (v3)
  {
    if (v3 == a2)
    {
      v11 = v10;
      (*(void (**)(_QWORD *, uint8_t *))(*a2 + 24))(a2, v10);
    }
    else
    {
      v11 = (uint8_t *)(*(uint64_t (**)(_QWORD *))(*v3 + 16))(v3);
    }
    v5 = a1 + 696;
    if (v10 != (uint8_t *)(a1 + 696))
    {
      v6 = v11;
      v7 = *(_QWORD *)(a1 + 720);
      if (v11 == v10)
      {
        if (v7 == v5)
        {
          (*(void (**)(uint8_t *, _QWORD *))(*(_QWORD *)v10 + 24))(v10, v12);
          (*(void (**)(uint8_t *))(*(_QWORD *)v11 + 32))(v11);
          v11 = 0;
          (*(void (**)(_QWORD, uint8_t *))(**(_QWORD **)(a1 + 720) + 24))(*(_QWORD *)(a1 + 720), v10);
          (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 720) + 32))(*(_QWORD *)(a1 + 720));
          *(_QWORD *)(a1 + 720) = 0;
          v11 = v10;
          (*(void (**)(_QWORD *, uint64_t))(v12[0] + 24))(v12, a1 + 696);
          (*(void (**)(_QWORD *))(v12[0] + 32))(v12);
        }
        else
        {
          (*(void (**)(uint8_t *, uint64_t))(*(_QWORD *)v10 + 24))(v10, a1 + 696);
          (*(void (**)(uint8_t *))(*(_QWORD *)v11 + 32))(v11);
          v11 = *(uint8_t **)(a1 + 720);
        }
        *(_QWORD *)(a1 + 720) = v5;
      }
      else if (v7 == v5)
      {
        (*(void (**)(uint64_t, uint8_t *))(*(_QWORD *)v5 + 24))(a1 + 696, v10);
        (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 720) + 32))(*(_QWORD *)(a1 + 720));
        *(_QWORD *)(a1 + 720) = v11;
        v11 = v10;
      }
      else
      {
        v11 = *(uint8_t **)(a1 + 720);
        *(_QWORD *)(a1 + 720) = v6;
      }
    }
    v8 = v11;
    if (v11 == v10)
    {
      v9 = 4;
      v8 = v10;
    }
    else
    {
      if (!v11)
        return;
      v9 = 5;
    }
    (*(void (**)(void))(*(_QWORD *)v8 + 8 * v9))();
  }
  else
  {
    v4 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_2390FD000, v4, OS_LOG_TYPE_ERROR, "SessionHandler setBestFixHandlerCb NULL callback pointer", v10, 2u);
    }
  }
}

void sub_2391C5918(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  sub_2390FEEE8(a1);
}

void sub_2391C5924(int *a1, double a2)
{
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  unint64_t v12;
  uint64_t v18;
  _OWORD v19[3];
  uint64_t v20;
  int v21;
  int v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  char v28;
  char v29;
  unint64_t v30;
  uint64_t v31;
  int v32;

  v3 = *a1;
  if (*a1)
  {
    v4 = a1[13];
    if (a1[14] == 1)
      v5 = 1;
    else
      v5 = 3;
    if (a1[14] == 1)
      v6 = 1;
    else
      v6 = 2;
    if (v4 > 4)
      v7 = 0;
    else
      v7 = dword_2391D2FA4[v4];
    LOWORD(a2) = *((_WORD *)a1 + 4);
    v8 = *((_QWORD *)a1 + 2);
    v9 = *((_QWORD *)a1 + 4);
    v10 = *((_BYTE *)a1 + 128);
    v11 = *((_BYTE *)a1 + 63);
    v12 = ((unint64_t)(a1[16] & 4) << 17) | (4 * (a1[16] & 3));
    v19[0] = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    v19[1] = xmmword_2391D28E0;
    __asm { FMOV            V3.2D, #-1.0 }
    v19[2] = _Q3;
    v20 = 0;
    v21 = v6;
    v22 = v7;
    v23 = (double)*(unint64_t *)&a2;
    v24 = v8;
    v25 = v9;
    v26 = v5;
    v27 = 3;
    v28 = v10;
    v29 = v11;
    v30 = v12;
    v31 = 0;
    v32 = v3;
    v18 = *((_QWORD *)a1 + 62);
    if (v18)
      (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)v18 + 48))(v18, v19);
  }
  sub_2391C3928(a1);
}

void sub_2391C5A10(uint64_t a1)
{
  NSObject *v1;
  NSObject *v3;
  uint8_t v4[16];

  v1 = *(NSObject **)(a1 + 104);
  if (v1)
  {
    v3 = qword_2542CF610;
    if (os_log_type_enabled((os_log_t)qword_2542CF610, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v4 = 0;
      _os_log_debug_impl(&dword_2390FD000, v3, OS_LOG_TYPE_DEBUG, "SessionHandler,#input,cancel the ongoing timer", v4, 2u);
      v1 = *(NSObject **)(a1 + 104);
    }
    dispatch_source_cancel(v1);

    *(_QWORD *)(a1 + 104) = 0;
  }
}

void sub_2391C5AA0(uint64_t a1)
{
  int *v1;
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  _BOOL4 v7;
  int v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  NSObject *v13;
  uint64_t v14;
  double v15;
  double v16;
  const char *v17;
  uint8_t *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  uint64_t v22;
  _OWORD v23[6];
  uint64_t v24;
  uint8_t buf[4];
  int v26;
  _BOOL4 v27;
  int v28;
  int v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  int v35;
  char v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _OWORD v48[2];
  int v49;
  double v50;
  __int16 v51;
  double v52;
  __int16 v53;
  double v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v1 = *(int **)(a1 + 32);
  v2 = *((_QWORD *)v1 + 90);
  if (v2)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 48))(v2);
    *((double *)v1 + 15) = (double)sub_239184EE8() * 0.000000001;
    if (*((_BYTE *)v1 + 62) && !v1[13])
    {
      v21 = qword_2542CF610;
      if (!os_log_type_enabled((os_log_t)qword_2542CF610, OS_LOG_TYPE_DEBUG))
      {
LABEL_15:
        LOBYTE(v49) = 0;
        v22 = *((_QWORD *)v1 + 86);
        if (!v22)
          sub_2391012B8();
        (*(void (**)(uint64_t, int *))(*(_QWORD *)v22 + 48))(v22, &v49);
        sub_2391C3928(v1);
        return;
      }
      *(_WORD *)buf = 0;
      v17 = "SessionHandler,#out,no response for RRLP additional AD.Not sending POS response";
      v18 = buf;
      v19 = v21;
      v20 = 2;
    }
    else
    {
      v3 = v1[41];
      if (v3)
      {
        v4 = v1[13];
        v5 = *((unsigned __int8 *)v1 + 264) >> (v4 == 1);
        v6 = *v1;
        v7 = v1[14] == 2;
        *(_DWORD *)buf = v1[40];
        v26 = v3;
        v27 = v7;
        v28 = v4;
        v32 = *(_OWORD *)(v1 + 53);
        v33 = *(_OWORD *)(v1 + 57);
        v34 = *(_OWORD *)(v1 + 61);
        v8 = v1[65];
        v29 = v6;
        v35 = v8;
        v30 = *(_OWORD *)(v1 + 45);
        v31 = *(_OWORD *)(v1 + 49);
        v36 = v5;
        *(_OWORD *)((char *)v48 + 15) = *(_OWORD *)(v1 + 114);
        v9 = *(_OWORD *)((char *)v1 + 441);
        v47 = *(_OWORD *)((char *)v1 + 425);
        v48[0] = v9;
        v42 = *(_OWORD *)((char *)v1 + 345);
        v43 = *(_OWORD *)((char *)v1 + 361);
        v44 = *(_OWORD *)((char *)v1 + 377);
        v45 = *(_OWORD *)((char *)v1 + 393);
        v38 = *(_OWORD *)((char *)v1 + 281);
        v39 = *(_OWORD *)((char *)v1 + 297);
        v40 = *(_OWORD *)((char *)v1 + 313);
        v41 = *(_OWORD *)((char *)v1 + 329);
        v37 = *(_OWORD *)((char *)v1 + 265);
        v46 = *(_OWORD *)((char *)v1 + 409);
        v10 = *((_OWORD *)v1 + 5);
        v23[4] = *((_OWORD *)v1 + 4);
        v23[5] = v10;
        v24 = *((_QWORD *)v1 + 12);
        v11 = *((_OWORD *)v1 + 1);
        v23[0] = *(_OWORD *)v1;
        v23[1] = v11;
        v12 = *((_OWORD *)v1 + 3);
        v23[2] = *((_OWORD *)v1 + 2);
        v23[3] = v12;
        sub_2391C33CC(v1, buf, v23);
      }
      else
      {
        sub_2391C36B0(v1);
      }
      v14 = qword_2542CF610;
      if (!os_log_type_enabled((os_log_t)qword_2542CF610, OS_LOG_TYPE_DEBUG))
        goto LABEL_15;
      v16 = *((double *)v1 + 14);
      v15 = *((double *)v1 + 15);
      v49 = 134218496;
      v50 = v15 - v16;
      v51 = 2048;
      v52 = v16;
      v53 = 2048;
      v54 = v15;
      v17 = "SessionHandler,#out,TTFF,%f,starttime,%.2f,endtime,%.2f";
      v18 = (uint8_t *)&v49;
      v19 = v14;
      v20 = 32;
    }
    _os_log_debug_impl(&dword_2390FD000, v19, OS_LOG_TYPE_DEBUG, v17, v18, v20);
    goto LABEL_15;
  }
  v13 = qword_2542CF610;
  if (os_log_type_enabled((os_log_t)qword_2542CF610, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_2390FD000, v13, OS_LOG_TYPE_DEBUG, "SessionHandler,callback NULL. Sending POS method failure", buf, 2u);
  }
  sub_2391C36B0(v1);
}

double sub_2391C5D78(uint64_t a1)
{
  NSObject *v2;
  double result;
  uint8_t v4[16];

  v2 = qword_2542CF610;
  if (os_log_type_enabled((os_log_t)qword_2542CF610, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_2390FD000, v2, OS_LOG_TYPE_DEBUG, "SessionHandler,#process,clearSessionAssistanceRecvd", v4, 2u);
  }
  *(_QWORD *)a1 = 0xFFFFFFFF00000000;
  *(_WORD *)(a1 + 8) = -1;
  *(_QWORD *)(a1 + 16) = 0;
  *(_WORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_BYTE *)(a1 + 40) = 0;
  *(_DWORD *)(a1 + 44) = 0;
  *(_WORD *)(a1 + 48) = 0;
  *(_BYTE *)(a1 + 50) = -1;
  *(_DWORD *)(a1 + 52) = -1;
  *(_QWORD *)(a1 + 56) = 0;
  *(_BYTE *)(a1 + 64) = 0;
  *(_DWORD *)(a1 + 68) = 0;
  *(_QWORD *)(a1 + 72) = -1;
  result = NAN;
  *(_QWORD *)(a1 + 92) = -1;
  *(_DWORD *)(a1 + 100) = -1;
  *(_WORD *)(a1 + 88) = -1;
  *(_DWORD *)(a1 + 80) = 0x7FFFFFFF;
  *(_DWORD *)(a1 + 84) = -1;
  return result;
}

void sub_2391C5E44(uint64_t a1, int *a2)
{
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  int v7;
  NSObject *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  __int16 v46;
  int v47;
  __int16 v48;
  int v49;
  __int16 v50;
  int v51;
  __int16 v52;
  int v53;
  __int16 v54;
  int v55;
  __int16 v56;
  int v57;
  __int16 v58;
  int v59;
  __int16 v60;
  int v61;
  __int16 v62;
  int v63;
  __int16 v64;
  int v65;
  __int16 v66;
  int v67;
  __int16 v68;
  int v69;
  __int16 v70;
  int v71;
  __int16 v72;
  int v73;
  __int16 v74;
  int v75;
  __int16 v76;
  int v77;
  __int16 v78;
  int v79;
  __int16 v80;
  int v81;
  __int16 v82;
  int v83;
  __int16 v84;
  int v85;
  __int16 v86;
  int v87;
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v3 = a2[2];
  v4 = qword_2542CF610;
  v5 = os_log_type_enabled((os_log_t)qword_2542CF610, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (!v5)
      goto LABEL_5;
    LOWORD(v44) = 0;
    v6 = "SessionHandler,#out,posReport,sessionProtocol = SUPL";
  }
  else
  {
    if (!v5)
      goto LABEL_5;
    LOWORD(v44) = 0;
    v6 = "SessionHandler,#out,posReport,sessionProtocol = CPlane";
  }
  _os_log_debug_impl(&dword_2390FD000, v4, OS_LOG_TYPE_DEBUG, v6, (uint8_t *)&v44, 2u);
LABEL_5:
  v7 = a2[68];
  v8 = qword_2542CF610;
  if (v7 == 3)
  {
    if (!os_log_type_enabled((os_log_t)qword_2542CF610, OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    v9 = *((unsigned __int16 *)a2 + 146);
    v10 = *((unsigned __int16 *)a2 + 147);
    v11 = *((unsigned __int8 *)a2 + 296);
    v12 = *((unsigned __int8 *)a2 + 298);
    v13 = *((unsigned __int8 *)a2 + 299);
    v44 = 67175681;
    v45 = v9;
    v46 = 1025;
    v47 = v10;
    v48 = 1025;
    v49 = v11;
    v50 = 1025;
    v51 = v12;
    v52 = 1025;
    v53 = v13;
    _os_log_debug_impl(&dword_2390FD000, v8, OS_LOG_TYPE_DEBUG, "SessionHandler,#out,posReport,kVelocityTypeHorizontalWithVerticalVelocityAndUncertainty,bearing  ,%{private}u,horizontalSpeed,%{private}u,verticalSpeed,%{private}u,horizUncertaintySpeed,%{private}u,vertUncertaintySpeed,%{private}u", (uint8_t *)&v44, 0x20u);
    v7 = a2[68];
    v8 = qword_2542CF610;
  }
  if (v7 == 2)
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    v14 = *((unsigned __int16 *)a2 + 143);
    v15 = *((unsigned __int16 *)a2 + 144);
    v16 = *((unsigned __int8 *)a2 + 290);
    v44 = 67175169;
    v45 = v14;
    v46 = 1025;
    v47 = v15;
    v48 = 1025;
    v49 = v16;
    _os_log_debug_impl(&dword_2390FD000, v8, OS_LOG_TYPE_DEBUG, "SessionHandler,#out,posReport,kVelocityTypeHorizontalVelocityWithUncertainty,bearing ,%{private}u,horizontalSpeed,%{private}u,horizUncertaintySpeed,%{private}u", (uint8_t *)&v44, 0x14u);
    v7 = a2[68];
    v8 = qword_2542CF610;
  }
  if (v7 == 1)
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      goto LABEL_17;
    v17 = *((unsigned __int16 *)a2 + 140);
    v18 = *((unsigned __int16 *)a2 + 141);
    v19 = *((unsigned __int8 *)a2 + 284);
    v44 = 67175169;
    v45 = v17;
    v46 = 1025;
    v47 = v18;
    v48 = 1025;
    v49 = v19;
    _os_log_debug_impl(&dword_2390FD000, v8, OS_LOG_TYPE_DEBUG, "SessionHandler,#out,posReport,kVelocityTypeHorizontalWithVerticalVelocity,bearing,%{private}u,horizontalSpeed,%{private}u,verticalSpeed,%{private}u", (uint8_t *)&v44, 0x14u);
    v7 = a2[68];
    v8 = qword_2542CF610;
  }
  if (!v7 && os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v42 = *((unsigned __int16 *)a2 + 138);
    v43 = *((unsigned __int16 *)a2 + 139);
    v44 = 67174913;
    v45 = v42;
    v46 = 1025;
    v47 = v43;
    _os_log_debug_impl(&dword_2390FD000, v8, OS_LOG_TYPE_DEBUG, "SessionHandler,,#out,posReport,kVelocityTypeHorizontalWithVerticalVelocity,bearing,%{private}u,horizontalSpeed,%{private}u", (uint8_t *)&v44, 0xEu);
    v8 = qword_2542CF610;
  }
LABEL_17:
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v20 = *a2;
    v22 = a2[3];
    v21 = a2[4];
    v23 = *((unsigned __int16 *)a2 + 12);
    v24 = a2[5];
    v25 = *((unsigned __int8 *)a2 + 26);
    v27 = a2[8];
    v26 = a2[9];
    v28 = *((unsigned __int16 *)a2 + 20);
    v29 = *((unsigned __int8 *)a2 + 42);
    v30 = a2[16];
    v31 = a2[23];
    v32 = a2[24];
    v33 = *((unsigned __int8 *)a2 + 102);
    v34 = *((unsigned __int8 *)a2 + 103);
    v35 = *((unsigned __int16 *)a2 + 50);
    v36 = *((unsigned __int8 *)a2 + 105);
    v37 = *((unsigned __int8 *)a2 + 106);
    v38 = *((unsigned __int8 *)a2 + 104);
    v39 = a2[68];
    v40 = a2[75];
    v41 = a2[7];
    v44 = 67114497;
    v45 = v20;
    v46 = 1024;
    v47 = v21;
    v48 = 1024;
    v49 = v22;
    v50 = 1024;
    v51 = v23;
    v52 = 1024;
    v53 = v24;
    v54 = 1024;
    v55 = v25;
    v56 = 1024;
    v57 = v27;
    v58 = 1024;
    v59 = v26;
    v60 = 1024;
    v61 = v28;
    v62 = 1024;
    v63 = v29;
    v64 = 1024;
    v65 = v30;
    v66 = 1025;
    v67 = v31;
    v68 = 1025;
    v69 = v32;
    v70 = 1025;
    v71 = v33;
    v72 = 1025;
    v73 = v34;
    v74 = 1025;
    v75 = v35;
    v76 = 1025;
    v77 = v36;
    v78 = 1025;
    v79 = v37;
    v80 = 1024;
    v81 = v38;
    v82 = 1024;
    v83 = v39;
    v84 = 1024;
    v85 = v40;
    v86 = 1024;
    v87 = v41;
    _os_log_debug_impl(&dword_2390FD000, v8, OS_LOG_TYPE_DEBUG, "SessionHandler,#out,posReport,result,%u,sessionId,%u,posProtocol,%u,gpsWeek,%u,gpsTow,%u,gpsTimeUncertainty,%u,gpsTODPresent,%d,gpsTODMsec,%u,gpsTODFrac,%u,gpsTODUnc,%u,shapeType,%u,latitude,%{private}u,longitude,%{private}u,Major axis,%{private}u,Minor axis,%{private}u,altitude,%{private}u,uncertainAltitude,%{private}u,confidence,%{private}u,orientationAngle,%u,velocityType,%u,technologySource,%u,fixType,%u", (uint8_t *)&v44, 0x86u);
  }
}

void sub_2391C6230(uint64_t a1, int a2)
{
  int v2;
  NSObject *v3;
  uint8_t v4[16];

  if (*(_DWORD *)a1)
  {
    v2 = *(unsigned __int8 *)(a1 + 64) | a2;
    *(_BYTE *)(a1 + 64) |= a2;
    if (v2 != 7 && !*(_DWORD *)(a1 + 52))
      *(_BYTE *)(a1 + 62) = 0;
  }
  else
  {
    v3 = qword_2542CF618;
    if (os_log_type_enabled((os_log_t)qword_2542CF618, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_2390FD000, v3, OS_LOG_TYPE_ERROR, "SessionHandler,#process,#nilrPosRequest no active session", v4, 2u);
    }
  }
}

__n128 sub_2391C62C0(uint64_t a1, int *a2)
{
  NSObject *v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __n128 result;
  _OWORD v10[6];
  uint64_t v11;
  uint8_t buf[16];

  sub_2391C639C(a1, a2[387], a2[386], a2[385]);
  if (*(_QWORD *)(a1 + 528))
  {
    sub_2391C6230(a1, 4);
    v4 = qword_2542CF610;
    if (os_log_type_enabled((os_log_t)qword_2542CF610, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_2390FD000, v4, OS_LOG_TYPE_DEBUG, "SessionHandler,#input,inject nav model", buf, 2u);
    }
    v5 = *(_QWORD *)(a1 + 528);
    if (!v5)
      sub_2391012B8();
    (*(void (**)(uint64_t, int *))(*(_QWORD *)v5 + 48))(v5, a2);
  }
  v6 = *(_OWORD *)(a1 + 80);
  v10[4] = *(_OWORD *)(a1 + 64);
  v10[5] = v6;
  v11 = *(_QWORD *)(a1 + 96);
  v7 = *(_OWORD *)(a1 + 16);
  v10[0] = *(_OWORD *)a1;
  v10[1] = v7;
  v8 = *(_OWORD *)(a1 + 48);
  v10[2] = *(_OWORD *)(a1 + 32);
  v10[3] = v8;
  sub_2391C41BC((int *)v10);
  return result;
}

void sub_2391C639C(uint64_t a1, int a2, int a3, int a4)
{
  NSObject *v4;
  int v5;
  int v6[2];
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  char v11;
  int v12;
  __int16 v13;
  char v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  int v24;

  if (*(_DWORD *)a1)
  {
    v4 = qword_2542CF610;
    if (os_log_type_enabled((os_log_t)qword_2542CF610, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v6[0]) = 0;
      _os_log_debug_impl(&dword_2390FD000, v4, OS_LOG_TYPE_DEBUG, "SessionHandler,addSessionInfo,session already exists", (uint8_t *)v6, 2u);
    }
  }
  else
  {
    v22 = -1;
    v5 = 2 * (a4 == 1);
    *(_DWORD *)a1 = a2;
    *(_DWORD *)(a1 + 4) = -1;
    if (!a4)
      v5 = 1;
    *(_WORD *)(a1 + 8) = -1;
    *(_QWORD *)(a1 + 16) = 0;
    *(_WORD *)(a1 + 24) = 0;
    *(_QWORD *)(a1 + 32) = 0;
    *(_BYTE *)(a1 + 40) = 0;
    *(_DWORD *)(a1 + 44) = 0;
    *(_WORD *)(a1 + 48) = 0;
    *(_BYTE *)(a1 + 50) = -1;
    *(_DWORD *)(a1 + 52) = a3;
    *(_DWORD *)(a1 + 56) = v5;
    *(_QWORD *)(a1 + 60) = 0;
    *(_DWORD *)(a1 + 68) = 0;
    *(_QWORD *)(a1 + 72) = -1;
    *(_WORD *)(a1 + 88) = -1;
    *(_DWORD *)(a1 + 80) = 0x7FFFFFFF;
    *(_DWORD *)(a1 + 84) = -1;
    *(_QWORD *)(a1 + 92) = -1;
    *(_DWORD *)(a1 + 100) = -1;
    v6[0] = a2;
    v6[1] = -1;
    v7 = -1;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = -1;
    v15 = a3;
    v16 = v5;
    v17 = 0;
    v18 = 0;
    v19 = -1;
    v20 = 0x7FFFFFFF;
    v21 = -1;
    v23 = -1;
    v24 = -1;
    sub_2391C41BC(v6);
  }
}

__n128 sub_2391C64C4(uint64_t a1, int *a2)
{
  NSObject *v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __n128 result;
  _OWORD v10[6];
  uint64_t v11;
  uint8_t buf[16];

  sub_2391C639C(a1, a2[69], a2[68], a2[67]);
  if (*(_QWORD *)(a1 + 560))
  {
    sub_2391C6230(a1, 1);
    v4 = qword_2542CF610;
    if (os_log_type_enabled((os_log_t)qword_2542CF610, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_2390FD000, v4, OS_LOG_TYPE_DEBUG, "SessionHandler,#input,inject ref time", buf, 2u);
    }
    v5 = *(_QWORD *)(a1 + 560);
    if (!v5)
      sub_2391012B8();
    (*(void (**)(uint64_t, int *))(*(_QWORD *)v5 + 48))(v5, a2);
  }
  v6 = *(_OWORD *)(a1 + 80);
  v10[4] = *(_OWORD *)(a1 + 64);
  v10[5] = v6;
  v11 = *(_QWORD *)(a1 + 96);
  v7 = *(_OWORD *)(a1 + 16);
  v10[0] = *(_OWORD *)a1;
  v10[1] = v7;
  v8 = *(_OWORD *)(a1 + 48);
  v10[2] = *(_OWORD *)(a1 + 32);
  v10[3] = v8;
  sub_2391C41BC((int *)v10);
  return result;
}

__n128 sub_2391C65A0(uint64_t a1, int *a2)
{
  NSObject *v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __n128 result;
  _OWORD v10[6];
  uint64_t v11;
  uint8_t buf[16];

  sub_2391C639C(a1, a2[7], a2[6], a2[5]);
  if (*(_QWORD *)(a1 + 592))
  {
    sub_2391C6230(a1, 2);
    v4 = qword_2542CF610;
    if (os_log_type_enabled((os_log_t)qword_2542CF610, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_2390FD000, v4, OS_LOG_TYPE_DEBUG, "SessionHandler,#input,inject ref location", buf, 2u);
    }
    v5 = *(_QWORD *)(a1 + 592);
    if (!v5)
      sub_2391012B8();
    (*(void (**)(uint64_t, int *))(*(_QWORD *)v5 + 48))(v5, a2);
  }
  v6 = *(_OWORD *)(a1 + 80);
  v10[4] = *(_OWORD *)(a1 + 64);
  v10[5] = v6;
  v11 = *(_QWORD *)(a1 + 96);
  v7 = *(_OWORD *)(a1 + 16);
  v10[0] = *(_OWORD *)a1;
  v10[1] = v7;
  v8 = *(_OWORD *)(a1 + 48);
  v10[2] = *(_OWORD *)(a1 + 32);
  v10[3] = v8;
  sub_2391C41BC((int *)v10);
  return result;
}

_QWORD *sub_2391C6678(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _QWORD *result;
  uint64_t v5;
  _BYTE v6[24];
  _BYTE *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = sub_2391BDC54();
  sub_239101254((uint64_t)v6, a2);
  sub_2391BD91C(v3, (uint64_t)v6);
  result = v7;
  if (v7 == v6)
  {
    v5 = 4;
    result = v6;
  }
  else
  {
    if (!v7)
      return result;
    v5 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v5))();
}

void sub_2391C6718(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v13;
  char *v15;
  uint64_t v16;

  v15 = a13;
  if (a13 == v13)
  {
    v16 = 4;
    v15 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v16 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v15 + 8 * v16))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void sub_2391C6758(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *__p;
  void *v12;
  uint64_t v13;

  v3 = sub_2391BDC54();
  v4 = *(_DWORD *)a2;
  v6 = 0;
  v7 = 0;
  v5 = 0;
  sub_239105CA8(&v5, *(const void **)(a2 + 8), *(_QWORD *)(a2 + 16), 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(_QWORD *)(a2 + 16) - *(_QWORD *)(a2 + 8)) >> 2));
  v8 = 0;
  v9 = 0;
  v10 = 0;
  sub_239105DE4(&v8, *(const void **)(a2 + 32), *(_QWORD *)(a2 + 40), (uint64_t)(*(_QWORD *)(a2 + 40) - *(_QWORD *)(a2 + 32)) >> 4);
  __p = 0;
  v12 = 0;
  v13 = 0;
  sub_239105ED0(&__p, *(const void **)(a2 + 56), *(_QWORD *)(a2 + 64), (uint64_t)(*(_QWORD *)(a2 + 64) - *(_QWORD *)(a2 + 56)) >> 5);
  sub_2391C0C1C(v3, &v4);
  if (__p)
  {
    v12 = __p;
    operator delete(__p);
  }
  if (v8)
  {
    v9 = v8;
    operator delete(v8);
  }
  if (v5)
  {
    v6 = v5;
    operator delete(v5);
  }
}

void sub_2391C683C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  sub_239104B64(&a9);
  _Unwind_Resume(a1);
}

void sub_2391C6880(int *a1)
{
  uint64_t v2;
  NSObject *v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  unint64_t v14;
  uint64_t v20;
  _OWORD v21[3];
  uint64_t v22;
  int v23;
  int v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  int v29;
  char v30;
  char v31;
  unint64_t v32;
  uint64_t v33;
  int v34;
  _QWORD block[5];

  v2 = sub_2391BDC54();
  v3 = *(NSObject **)(v2 + 88);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2391BE65C;
  block[3] = &unk_250A6BEF8;
  block[4] = v2;
  dispatch_async(v3, block);
  v5 = *a1;
  if (*a1)
  {
    v6 = a1[13];
    if (a1[14] == 1)
      v7 = 1;
    else
      v7 = 3;
    if (a1[14] == 1)
      v8 = 1;
    else
      v8 = 2;
    if (v6 > 4)
      v9 = 0;
    else
      v9 = dword_2391D2FA4[v6];
    LOWORD(v4) = *((_WORD *)a1 + 4);
    v10 = *((_QWORD *)a1 + 2);
    v11 = *((_QWORD *)a1 + 4);
    v12 = *((_BYTE *)a1 + 128);
    v13 = *((_BYTE *)a1 + 63);
    v14 = ((unint64_t)(a1[16] & 4) << 17) | (4 * (a1[16] & 3));
    v21[0] = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    v21[1] = xmmword_2391D28E0;
    __asm { FMOV            V3.2D, #-1.0 }
    v21[2] = _Q3;
    v22 = 0;
    v23 = v8;
    v24 = v9;
    v25 = (double)v4;
    v26 = v10;
    v27 = v11;
    v28 = v7;
    v29 = 2;
    v30 = v12;
    v31 = v13;
    v32 = v14;
    v33 = 0;
    v34 = v5;
    v20 = *((_QWORD *)a1 + 62);
    if (v20)
      (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)v20 + 48))(v20, v21);
  }
  sub_2391C3928(a1);
}

_QWORD *sub_2391C69B4(uint64_t a1, uint64_t a2)
{
  uint8_t *v3;
  _QWORD *result;
  uint64_t v5;
  _BYTE v6[24];
  _BYTE *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = (uint8_t *)sub_2391BDC54();
  sub_239101254((uint64_t)v6, a2);
  sub_2391BE6A4(v3, (uint64_t)v6);
  result = v7;
  if (v7 == v6)
  {
    v5 = 4;
    result = v6;
  }
  else
  {
    if (!v7)
      return result;
    v5 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v5))();
}

void sub_2391C6A54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v13;
  char *v15;
  uint64_t v16;

  v15 = a13;
  if (a13 == v13)
  {
    v16 = 4;
    v15 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v16 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v15 + 8 * v16))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

double sub_2391C6A94(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = qword_2542CF610;
  if (os_log_type_enabled((os_log_t)qword_2542CF610, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_2390FD000, v2, OS_LOG_TYPE_DEBUG, "SessionHandler,#process,deleteGnssData", v4, 2u);
  }
  return sub_2391C5D78(a1);
}

_QWORD *sub_2391C6B04(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  *a1 = &off_250ABD2C8;
  v2 = a1 + 1;
  v3 = (_QWORD *)a1[4];
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  return a1;
}

void sub_2391C6B60(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  *a1 = &off_250ABD2C8;
  v1 = a1 + 1;
  v2 = (_QWORD *)a1[4];
  if (v2 == v1)
  {
    v3 = 4;
    v2 = v1;
  }
  else
  {
    if (!v2)
      goto LABEL_6;
    v3 = 5;
  }
  (*(void (**)(void))(*v2 + 8 * v3))();
LABEL_6:
  JUMPOUT(0x23B838844);
}

_QWORD *sub_2391C6BCC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v1 = a1 + 8;
  v2 = operator new(0x28uLL);
  *v2 = &off_250ABD2C8;
  sub_239101254((uint64_t)(v2 + 1), v1);
  return v2;
}

void sub_2391C6C0C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_2391C6C20(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_250ABD2C8;
  return sub_239101254((uint64_t)(a2 + 1), a1 + 8);
}

_QWORD *sub_2391C6C3C(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 8);
  result = *(_QWORD **)(a1 + 32);
  if (result == v1)
  {
    v3 = 4;
    result = v1;
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

void sub_2391C6C70(char *__p)
{
  char *v2;
  char *v3;
  uint64_t v4;

  v2 = __p + 8;
  v3 = (char *)*((_QWORD *)__p + 4);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*(_QWORD *)v3 + 8 * v4))();
  }
  operator delete(__p);
}

uint64_t sub_2391C6CC0(uint64_t a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  _OWORD v8[8];

  v2 = a2[5];
  v8[4] = a2[4];
  v8[5] = v2;
  v3 = a2[7];
  v8[6] = a2[6];
  v8[7] = v3;
  v4 = a2[1];
  v8[0] = *a2;
  v8[1] = v4;
  v5 = a2[3];
  v8[2] = a2[2];
  v8[3] = v5;
  v6 = *(_QWORD *)(a1 + 32);
  if (!v6)
    sub_2391012B8();
  return (*(uint64_t (**)(uint64_t, _OWORD *))(*(_QWORD *)v6 + 48))(v6, v8);
}

uint64_t sub_2391C6D14(uint64_t a1, uint64_t a2)
{
  if (sub_23910622C(a2, (uint64_t)&unk_250ABD370))
    return a1 + 8;
  else
    return 0;
}

void *sub_2391C6D50()
{
  return &unk_250ABD370;
}

_QWORD *sub_2391C6D5C(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  *a1 = &off_250ABD3B8;
  v2 = a1 + 1;
  v3 = (_QWORD *)a1[4];
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  return a1;
}

void sub_2391C6DB8(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  *a1 = &off_250ABD3B8;
  v1 = a1 + 1;
  v2 = (_QWORD *)a1[4];
  if (v2 == v1)
  {
    v3 = 4;
    v2 = v1;
  }
  else
  {
    if (!v2)
      goto LABEL_6;
    v3 = 5;
  }
  (*(void (**)(void))(*v2 + 8 * v3))();
LABEL_6:
  JUMPOUT(0x23B838844);
}

_QWORD *sub_2391C6E24(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v1 = a1 + 8;
  v2 = operator new(0x28uLL);
  *v2 = &off_250ABD3B8;
  sub_239101254((uint64_t)(v2 + 1), v1);
  return v2;
}

void sub_2391C6E64(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_2391C6E78(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_250ABD3B8;
  return sub_239101254((uint64_t)(a2 + 1), a1 + 8);
}

_QWORD *sub_2391C6E94(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 8);
  result = *(_QWORD **)(a1 + 32);
  if (result == v1)
  {
    v3 = 4;
    result = v1;
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

void sub_2391C6EC8(char *__p)
{
  char *v2;
  char *v3;
  uint64_t v4;

  v2 = __p + 8;
  v3 = (char *)*((_QWORD *)__p + 4);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*(_QWORD *)v3 + 8 * v4))();
  }
  operator delete(__p);
}

uint64_t sub_2391C6F18(uint64_t a1, const void *a2)
{
  uint64_t v3;
  _BYTE v5[1552];

  memcpy(v5, a2, sizeof(v5));
  v3 = *(_QWORD *)(a1 + 32);
  if (!v3)
    sub_2391012B8();
  return (*(uint64_t (**)(uint64_t, _BYTE *))(*(_QWORD *)v3 + 48))(v3, v5);
}

uint64_t sub_2391C6F64(uint64_t a1, uint64_t a2)
{
  if (sub_23910622C(a2, (uint64_t)&unk_250ABD460))
    return a1 + 8;
  else
    return 0;
}

void *sub_2391C6FA0()
{
  return &unk_250ABD460;
}

_QWORD *sub_2391C6FAC(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  *a1 = &off_250ABD4A8;
  v2 = a1 + 1;
  v3 = (_QWORD *)a1[4];
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  return a1;
}

void sub_2391C7008(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  *a1 = &off_250ABD4A8;
  v1 = a1 + 1;
  v2 = (_QWORD *)a1[4];
  if (v2 == v1)
  {
    v3 = 4;
    v2 = v1;
  }
  else
  {
    if (!v2)
      goto LABEL_6;
    v3 = 5;
  }
  (*(void (**)(void))(*v2 + 8 * v3))();
LABEL_6:
  JUMPOUT(0x23B838844);
}

_QWORD *sub_2391C7074(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v1 = a1 + 8;
  v2 = operator new(0x28uLL);
  *v2 = &off_250ABD4A8;
  sub_239101254((uint64_t)(v2 + 1), v1);
  return v2;
}

void sub_2391C70B4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_2391C70C8(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_250ABD4A8;
  return sub_239101254((uint64_t)(a2 + 1), a1 + 8);
}

_QWORD *sub_2391C70E4(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 8);
  result = *(_QWORD **)(a1 + 32);
  if (result == v1)
  {
    v3 = 4;
    result = v1;
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

void sub_2391C7118(char *__p)
{
  char *v2;
  char *v3;
  uint64_t v4;

  v2 = __p + 8;
  v3 = (char *)*((_QWORD *)__p + 4);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*(_QWORD *)v3 + 8 * v4))();
  }
  operator delete(__p);
}

uint64_t sub_2391C7168(uint64_t a1, const void *a2)
{
  uint64_t v3;
  _BYTE v5[1896];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  memcpy(v5, a2, sizeof(v5));
  v3 = *(_QWORD *)(a1 + 32);
  if (!v3)
    sub_2391012B8();
  return (*(uint64_t (**)(uint64_t, _BYTE *))(*(_QWORD *)v3 + 48))(v3, v5);
}

uint64_t sub_2391C71E0(uint64_t a1, uint64_t a2)
{
  if (sub_23910622C(a2, (uint64_t)&unk_250ABD550))
    return a1 + 8;
  else
    return 0;
}

void *sub_2391C721C()
{
  return &unk_250ABD550;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x24BDBBCE8](theData, range.location, range.length, buffer);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x24BDBBE70](err);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x24BDBBE98](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x24BDBBEA0](err);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
  MEMORY[0x24BDBC218](stream);
}

CFErrorRef CFReadStreamCopyError(CFReadStreamRef stream)
{
  return (CFErrorRef)MEMORY[0x24BDBC220](stream);
}

CFTypeRef CFReadStreamCopyProperty(CFReadStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x24BDBC228](stream, propertyName);
}

CFStreamStatus CFReadStreamGetStatus(CFReadStreamRef stream)
{
  return MEMORY[0x24BDBC240](stream);
}

Boolean CFReadStreamHasBytesAvailable(CFReadStreamRef stream)
{
  return MEMORY[0x24BDBC250](stream);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x24BDBC258](stream);
}

CFIndex CFReadStreamRead(CFReadStreamRef stream, UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x24BDBC260](stream, buffer, bufferLength);
}

Boolean CFReadStreamSetClient(CFReadStreamRef stream, CFOptionFlags streamEvents, CFReadStreamClientCallBack clientCB, CFStreamClientContext *clientContext)
{
  return MEMORY[0x24BDBC270](stream, streamEvents, clientCB, clientContext);
}

void CFReadStreamSetDispatchQueue(CFReadStreamRef stream, dispatch_queue_t q)
{
  MEMORY[0x24BDBC278](stream, q);
}

Boolean CFReadStreamSetProperty(CFReadStreamRef stream, CFStreamPropertyKey propertyName, CFTypeRef propertyValue)
{
  return MEMORY[0x24BDBC280](stream, propertyName, propertyValue);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CFStreamCreatePairWithSocketToHost(CFAllocatorRef alloc, CFStringRef host, UInt32 port, CFReadStreamRef *readStream, CFWriteStreamRef *writeStream)
{
  MEMORY[0x24BDBC4A0](alloc, host, *(_QWORD *)&port, readStream, writeStream);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
  MEMORY[0x24BDBC968](stream);
}

CFErrorRef CFWriteStreamCopyError(CFWriteStreamRef stream)
{
  return (CFErrorRef)MEMORY[0x24BDBC970](stream);
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x24BDBC978](stream, propertyName);
}

CFStreamStatus CFWriteStreamGetStatus(CFWriteStreamRef stream)
{
  return MEMORY[0x24BDBC998](stream);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x24BDBC9A8](stream);
}

Boolean CFWriteStreamSetClient(CFWriteStreamRef stream, CFOptionFlags streamEvents, CFWriteStreamClientCallBack clientCB, CFStreamClientContext *clientContext)
{
  return MEMORY[0x24BDBC9B8](stream, streamEvents, clientCB, clientContext);
}

void CFWriteStreamSetDispatchQueue(CFWriteStreamRef stream, dispatch_queue_t q)
{
  MEMORY[0x24BDBC9C0](stream, q);
}

Boolean CFWriteStreamSetProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName, CFTypeRef propertyValue)
{
  return MEMORY[0x24BDBC9C8](stream, propertyName, propertyValue);
}

CFIndex CFWriteStreamWrite(CFWriteStreamRef stream, const UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x24BDBC9E0](stream, buffer, bufferLength);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x24BDE8918](allocator, data);
}

SecPolicyRef SecPolicyCreateBasicX509(void)
{
  return (SecPolicyRef)MEMORY[0x24BDE8C28]();
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x24BDE8DF0](trust, error);
}

OSStatus SecTrustSetAnchorCertificates(SecTrustRef trust, CFArrayRef anchorCertificates)
{
  return MEMORY[0x24BDE8E28](trust, anchorCertificates);
}

OSStatus SecTrustSetPolicies(SecTrustRef trust, CFTypeRef policies)
{
  return MEMORY[0x24BDE8E50](trust, policies);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::ParseFromArray(wireless_diagnostics::google::protobuf::MessageLite *this, const void *a2)
{
  return MEMORY[0x24BEDD670](this, a2);
}

void wireless_diagnostics::google::protobuf::MessageLite::~MessageLite(wireless_diagnostics::google::protobuf::MessageLite *this)
{
  MEMORY[0x24BEDD698](this);
}

uint64_t wireless_diagnostics::google::protobuf::GoogleOnceInitImpl()
{
  return MEMORY[0x24BEDD6A8]();
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x24BEDD6D8](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int *a2)
{
  return MEMORY[0x24BEDD6E0](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unint64_t *a2)
{
  return MEMORY[0x24BEDD6E8](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int *a2)
{
  return MEMORY[0x24BEDD6F8](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unint64_t *a2)
{
  return MEMORY[0x24BEDD700](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::Skip(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x24BEDD708](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x24BEDD720](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x24BEDD728](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this)
{
  return MEMORY[0x24BEDD748](this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this)
{
  return MEMORY[0x24BEDD778](this);
}

uint64_t wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage()
{
  return MEMORY[0x24BEDD7E0]();
}

void wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage(wireless_diagnostics::google::protobuf::internal::LogMessage *this)
{
  MEMORY[0x24BEDD7E8](this);
}

uint64_t wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<()
{
  return MEMORY[0x24BEDD7F0]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::OnShutdown(wireless_diagnostics::google::protobuf::internal *this, void (*a2)(void))
{
  return MEMORY[0x24BEDD808](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=()
{
  return MEMORY[0x24BEDD810]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::VerifyVersion(wireless_diagnostics::google::protobuf::internal *this, uint64_t a2, uint64_t a3, const char *a4)
{
  return MEMORY[0x24BEDD960](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadString()
{
  return MEMORY[0x24BEDD968]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBytes()
{
  return MEMORY[0x24BEDD970]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFloat(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, float a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x24BEDD978](this, a2, a4, a3);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt32(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x24BEDD988](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt64(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x24BEDD990](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteDouble(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, double a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x24BEDD998](this, a2, a4, a3);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteSInt32(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x24BEDD9A0](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteString()
{
  return MEMORY[0x24BEDD9B0]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x24BEDD9B8](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt64(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x24BEDD9C0](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessage(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, const wireless_diagnostics::google::protobuf::MessageLite *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x24BEDD9D8](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadPackedEnumNoInline()
{
  return MEMORY[0x24BEDD9F8]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadBytes()
{
  return MEMORY[0x24BEDDA10]();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::SkipField(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2)
{
  return MEMORY[0x24BEDDA18](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBool(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x24BEDDA20](this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteEnum(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, uint64_t a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return MEMORY[0x24BEDDA28](this, a2, a3, a4);
}

void wireless_diagnostics::google::protobuf::internal::FunctionClosure0::~FunctionClosure0(wireless_diagnostics::google::protobuf::internal::FunctionClosure0 *this)
{
  MEMORY[0x24BEDDA38](this);
}

uint64_t wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *this)
{
  return MEMORY[0x24BEDDA48](this);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializeToArray(wireless_diagnostics::google::protobuf::MessageLite *this, void *a2)
{
  return MEMORY[0x24BEDDA90](this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return MEMORY[0x24BEDDAB8](this);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x24BEDA9E0]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC38](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC58](this, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC80](this, __pos, __s);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x24BEDACE8](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF48]();
}

{
  return MEMORY[0x24BEDAF58]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x24BEDB010]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

void std::condition_variable::notify_one(std::condition_variable *this)
{
  MEMORY[0x24BEDB100](this);
}

void std::condition_variable::__do_timed_wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk, std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> a3)
{
  MEMORY[0x24BEDB108](this, __lk, a3.__d_.__rep_);
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
  MEMORY[0x24BEDB118](this);
}

void std::__throw_system_error(int __ev, const char *__what_arg)
{
  MEMORY[0x24BEDB1B0](*(_QWORD *)&__ev, __what_arg);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x24BEDB368](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x24BEDB370](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x24BEDB380](this);
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x24BEDB3E0]();
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x24BEDB3F0]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x24BEDB500](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x24BEDB518](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x24BEDB5E8]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x24BEDB608](retstr, *(_QWORD *)&__val);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_250A6BC30();
}

void operator delete(void *__p)
{
  off_250A6BC38(__p);
}

void operator delete(void *__p, const std::nothrow_t *a2)
{
  off_250A6BC40(__p, a2);
}

uint64_t operator delete()
{
  return off_250A6BC48();
}

uint64_t operator new[]()
{
  return off_250A6BC50();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_250A6BC58(__sz);
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_250A6BC60(__sz, a2);
}

uint64_t operator new()
{
  return off_250A6BC68();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x24BEDB940](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x24BEDB968](lpsrc, lpstype, lpdtype, s2d);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
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

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x24BDADF78](source);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFA0](source, handler);
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

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

void longjmp(jmp_buf a1, int a2)
{
  MEMORY[0x24BDAEB00](a1, *(_QWORD *)&a2);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

int setjmp(jmp_buf a1)
{
  return MEMORY[0x24BDAFD30](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x24BDAFF00](__dst, __src);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x24BDAFF80](__s1, __n);
}

