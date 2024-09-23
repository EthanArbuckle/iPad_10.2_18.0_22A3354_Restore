id HSGetKeychainValueForAccountWithService()
{
  __CFDictionary *v0;
  const __CFDictionary *v1;
  void *v2;
  id v3;
  CFTypeRef result;

  v0 = _HSCreateKeychainQueryForAccountWithService();
  if (!v0)
    return 0;
  v1 = v0;
  CFDictionarySetValue(v0, (const void *)*MEMORY[0x24BDE94C8], (const void *)*MEMORY[0x24BDBD270]);
  result = 0;
  v2 = 0;
  if (!SecItemCopyMatching(v1, &result))
  {
    if (objc_msgSend((id)result, "length"))
    {
      v3 = objc_alloc(MEMORY[0x24BDD17C8]);
      v2 = (void *)objc_msgSend(v3, "initWithData:encoding:", result, 4);
      CFRelease(result);
    }
    else
    {
      v2 = 0;
    }
  }
  CFRelease(v1);
  return v2;
}

__CFDictionary *_HSCreateKeychainQueryForAccountWithService()
{
  __CFString *v0;
  __CFString *v1;
  __CFDictionary *Mutable;

  v0 = CFSTR("default");
  v1 = CFSTR("com.apple.mobileipod.homeSharingPassword");
  if (objc_msgSend(CFSTR("default"), "length")
    && objc_msgSend(CFSTR("com.apple.mobileipod.homeSharingPassword"), "length"))
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 3, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDE9220], (const void *)*MEMORY[0x24BDE9230]);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDE8FA8], CFSTR("default"));
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDE9128], CFSTR("com.apple.mobileipod.homeSharingPassword"));
  }
  else
  {
    Mutable = 0;
  }

  return Mutable;
}

void sub_20AAA03B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_20AAA03CC(mach_port_t a1, int a2, int *a3, uint64_t a4, int a5, _OWORD *a6, _QWORD *a7, _DWORD *a8, _DWORD *a9, _DWORD *a10, _DWORD *a11, _DWORD *a12)
{
  int v17;
  mach_port_t reply_port;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  int v27;
  mach_msg_header_t msg;
  int v30;
  uint64_t v31;
  int v32;
  int v33;
  uint64_t v34;
  int v35;
  int v36;
  int v37;
  int v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  int v47;
  int v48;
  int v49;
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v30 = 1;
  v31 = a4;
  v32 = 16777472;
  v33 = a5;
  v34 = *MEMORY[0x24BDAC470];
  v17 = *a3;
  v35 = a2;
  v36 = v17;
  v37 = a5;
  reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(_QWORD *)&msg.msgh_voucher_port = 0x4B000000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v19 = mach_msg(&msg, 3, 0x40u, 0xDCu, reply_port, 0, 0);
  v20 = v19;
  if ((v19 - 268435458) <= 0xE && ((1 << (v19 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }
  else
  {
    if (!(_DWORD)v19)
    {
      if (msg.msgh_id == 71)
      {
        v20 = 4294966988;
      }
      else if (msg.msgh_id == 1300)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          v20 = 4294966996;
          if (v30 == 2
            && msg.msgh_size == 212
            && !msg.msgh_remote_port
            && HIBYTE(v32) == 1
            && HIWORD(v35) << 16 == 1114112)
          {
            v21 = v33;
            if (v33 == v47)
            {
              v20 = 0;
              v22 = v34;
              *a3 = v38;
              v23 = v46;
              a6[6] = v45;
              a6[7] = v23;
              v24 = v44;
              a6[4] = v43;
              a6[5] = v24;
              v25 = v40;
              *a6 = v39;
              a6[1] = v25;
              v26 = v42;
              a6[2] = v41;
              a6[3] = v26;
              *a7 = v31;
              *a8 = v21;
              v27 = v49;
              *a9 = v48;
              *a10 = v27;
              *a11 = v50;
              *a12 = v22;
              return v20;
            }
          }
        }
        else if (msg.msgh_size == 36)
        {
          v20 = 4294966996;
          if (HIDWORD(v31))
          {
            if (msg.msgh_remote_port)
              v20 = 4294966996;
            else
              v20 = HIDWORD(v31);
          }
        }
        else
        {
          v20 = 4294966996;
        }
      }
      else
      {
        v20 = 4294966995;
      }
      mach_msg_destroy(&msg);
      return v20;
    }
    mig_dealloc_reply_port(msg.msgh_local_port);
  }
  return v20;
}

uint64_t sub_20AAA0624(mach_port_t a1, unsigned int a2, __int128 *a3)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  mach_port_t reply_port;
  uint64_t v9;
  uint64_t v10;
  mach_msg_header_t msg;
  uint64_t v13;
  unsigned int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3[5];
  v19 = a3[4];
  v20 = v4;
  v5 = a3[7];
  v21 = a3[6];
  v22 = v5;
  v6 = a3[1];
  v15 = *a3;
  v16 = v6;
  v7 = a3[3];
  v17 = a3[2];
  v13 = *MEMORY[0x24BDAC470];
  v14 = a2;
  v18 = v7;
  reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(_QWORD *)&msg.msgh_voucher_port = 0x4B100000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v9 = mach_msg(&msg, 3, 0xA4u, 0x2Cu, reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v10;
  }
  if ((_DWORD)v9)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v10;
  }
  if (msg.msgh_id == 71)
  {
    v10 = 4294966988;
LABEL_17:
    mach_msg_destroy(&msg);
    return v10;
  }
  if (msg.msgh_id != 1301)
  {
    v10 = 4294966995;
    goto LABEL_17;
  }
  v10 = 4294966996;
  if ((msg.msgh_bits & 0x80000000) != 0)
    goto LABEL_17;
  if (msg.msgh_size != 36)
    goto LABEL_17;
  if (msg.msgh_remote_port)
    goto LABEL_17;
  v10 = v14;
  if (v14)
    goto LABEL_17;
  return v10;
}

uint64_t sub_20AAA07B0(mach_port_t a1, int a2, int a3, int a4, _OWORD *a5, uint64_t a6, int a7, _OWORD *a8, _QWORD *a9, _DWORD *a10)
{
  mach_port_t reply_port;
  uint64_t v13;
  uint64_t v14;
  int v15;
  mach_msg_header_t msg;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  _BYTE v23[28];
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v18 = 1;
  v19 = a6;
  v20 = 16777472;
  v21 = a7;
  v22 = *MEMORY[0x24BDAC470];
  *(_DWORD *)v23 = a2;
  *(_DWORD *)&v23[4] = a3;
  *(_DWORD *)&v23[8] = a4;
  *(_OWORD *)&v23[12] = *a5;
  v24 = a7;
  reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(_QWORD *)&msg.msgh_voucher_port = 0x4B200000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v13 = mach_msg(&msg, 3, 0x54u, 0x50u, reply_port, 0, 0);
  v14 = v13;
  if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }
  else
  {
    if (!(_DWORD)v13)
    {
      if (msg.msgh_id == 71)
      {
        v14 = 4294966988;
      }
      else if (msg.msgh_id == 1302)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          v14 = 4294966996;
          if (v18 == 1 && msg.msgh_size == 72 && !msg.msgh_remote_port && HIBYTE(v20) == 1)
          {
            v15 = v21;
            if (v21 == *(_DWORD *)&v23[16])
            {
              v14 = 0;
              *a8 = *(_OWORD *)v23;
              *a9 = v19;
              *a10 = v15;
              return v14;
            }
          }
        }
        else if (msg.msgh_size == 36)
        {
          v14 = 4294966996;
          if (HIDWORD(v19))
          {
            if (msg.msgh_remote_port)
              v14 = 4294966996;
            else
              v14 = HIDWORD(v19);
          }
        }
        else
        {
          v14 = 4294966996;
        }
      }
      else
      {
        v14 = 4294966995;
      }
      mach_msg_destroy(&msg);
      return v14;
    }
    mig_dealloc_reply_port(msg.msgh_local_port);
  }
  return v14;
}

uint64_t sub_20AAA099C(mach_port_t a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5)
{
  mach_port_t reply_port;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  int v15;
  int v16;
  mach_msg_header_t msg;
  unsigned int v18;
  int v19;
  int v20;
  int v21;
  int v22;

  reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(_QWORD *)&msg.msgh_voucher_port = 0x4B300000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }
  v11 = mach_msg(&msg, 3, 0x18u, 0x3Cu, reply_port, 0, 0);
  v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v11)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v12;
    }
    if (msg.msgh_id == 71)
    {
      v12 = 4294966988;
    }
    else if (msg.msgh_id == 1303)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 52)
        {
          if (!msg.msgh_remote_port)
          {
            v12 = v18;
            if (!v18)
            {
              v15 = v20;
              *a2 = v19;
              *a3 = v15;
              v16 = v22;
              *a4 = v21;
              *a5 = v16;
              return v12;
            }
            goto LABEL_23;
          }
        }
        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port)
            v13 = 1;
          else
            v13 = v18 == 0;
          if (v13)
            v12 = 4294966996;
          else
            v12 = v18;
          goto LABEL_23;
        }
      }
      v12 = 4294966996;
    }
    else
    {
      v12 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&msg);
    return v12;
  }
  mig_put_reply_port(msg.msgh_local_port);
  return v12;
}

void sub_20AAA0B14(uint64_t a1)
{
  int v1;
  unint64_t *v2;
  uint64_t v3;
  unint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t *v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v1 = *(_DWORD *)(a1 + 16) - 1374699841 * ((a1 + 2125213654 - 2 * (a1 & 0x7EAC2FD6)) ^ 0x135837DF);
  v2 = *(unint64_t **)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(unint64_t **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v12 = *(_QWORD *)(v3 - 0x11158D12BF1580A5);
  v11 = v1
      + 1224239923
      * (((&v7 | 0xCB79D4D5) - &v7 + (&v7 & 0x34862B28)) ^ 0x39CA2902)
      - 333;
  v9 = &STACK[0x4FF3ADA337C70035];
  v10 = v5;
  v7 = v3;
  v8 = v4;
  ((void (*)(uint64_t *))((char *)*(&off_24C363D30 + (v1 ^ 0x4BA)) - 8))(&v7);
  v6 = *(_QWORD *)(v3 - 0x11158D12BF1580ADLL);
  LODWORD(v9) = v1
              + 1374699841
              * ((-312451093 - (&v7 | 0xED605FEB) + (&v7 | 0x129FA014)) ^ 0x7F6BB81D)
              + 304;
  v7 = v6;
  v8 = &STACK[0x4FF3ADA337C70025];
  sub_20AAA176C((uint64_t)&v7);
  v8 = v2;
  LODWORD(v7) = v1
              + 235795823 * ((&v7 + 157930170 - 2 * (&v7 & 0x969D2BA)) ^ 0x9DC49BE3)
              - 272;
  sub_20AACB004((uint64_t)&v7);
  __asm { BR              X8 }
}

uint64_t sub_20AAA0D3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t (*a11)(uint64_t), uint64_t a12)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;

  *(_QWORD *)(v19 - 104) = v13;
  *(_DWORD *)(v19 - 112) = v16
                         + 1224239923
                         * ((((v19 - 144) ^ 0x248421A6 | 0x9A73DC49) + ((v19 - 144) ^ 0x12404049 | 0x658C23B6)) ^ 0xC4779C39)
                         - 588;
  *(_QWORD *)(v19 - 144) = v14;
  *(_QWORD *)(v19 - 136) = a12;
  *(_QWORD *)(v19 - 128) = v13;
  *(_QWORD *)(v19 - 120) = v15;
  v20 = a11(v19 - 144);
  v21 = v17 + v18 - 1 < (((v16 ^ 0x107) + 255) ^ 0x7FFFFA5Cu);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v12 + 8 * ((v21 | (v21 << 6)) ^ v16 ^ 0x107)) - 12))(v20);
}

uint64_t sub_20AAA0DF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  *(_DWORD *)(v7 - 144) = (v5 + 224) ^ (1225351577 * ((v7 - 144) ^ 0x239AD816));
  *(_QWORD *)(v7 - 136) = v4;
  *(_QWORD *)(v7 - 128) = v2;
  *(_QWORD *)(v7 - 120) = v2;
  *(_QWORD *)(v7 - 112) = v3;
  ((void (*)(uint64_t))*(&off_24C363D30 + v5 - 1254))(v7 - 144);
  v8 = 1374699841 * ((2 * (((v7 - 144) ^ 0xEDDC615D) & 0x8E89AB8) - ((v7 - 144) ^ 0xEDDC615D) - 149461691) ^ 0x773F1C11);
  *(_QWORD *)(v7 - 136) = v1;
  *(_DWORD *)(v7 - 128) = -562413466 - v8 + v6;
  *(_DWORD *)(v7 - 144) = (v5 + 90) ^ v8;
  v9 = sub_20AACDC3C(v7 - 144);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v0 + 8 * ((595 * (*(_DWORD *)(v7 - 140) != -728871353)) ^ v5))
                                          - 4))(v9);
}

uint64_t sub_20AAA0EF0()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;
  int v4;

  v4 = v2 + v3 - 1 < ((v1 + 255) ^ 0x7FFFFA5Cu);
  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((v4 | (v4 << 6)) ^ v1)) - 12))();
}

uint64_t sub_20AAA0F28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v8;
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = *(_QWORD *)(v8 + 24);
  v6 = 1224239923 * ((((v4 - 144) ^ 0x8B011F64 | 0xC105866F) - (((v4 - 144) ^ 0x8B011F64) & 0xC105866F)) ^ 0xB8B764DC);
  *(_DWORD *)(v4 - 144) = v6 ^ 0x1967566D;
  *(_QWORD *)(v4 - 136) = v10;
  *(_DWORD *)(v4 - 128) = v6 + v3 - 473;
  sub_20AACD898((_DWORD *)(v4 - 144));
  *(_DWORD *)(v4 - 112) = v3
                        + 1224239923 * ((2 * ((v4 - 144) & 0x24DF8498) - (v4 - 144) + 1528855397) ^ 0xA99386B2)
                        - 333;
  *(_QWORD *)(v4 - 144) = v1;
  *(_QWORD *)(v4 - 136) = v10;
  *(_QWORD *)(v4 - 104) = v0;
  *(_QWORD *)(v4 - 128) = v0;
  *(_QWORD *)(v4 - 120) = v2;
  v9(v4 - 144);
  *(_QWORD *)(v4 - 144) = v0;
  *(_QWORD *)(v4 - 136) = v5;
  *(_DWORD *)(v4 - 128) = v3
                        + 1374699841
                        * ((-1488207762 - ((v4 - 144) | 0xA74BC06E) + ((v4 - 144) | 0x58B43F91)) ^ 0x35402798)
                        + 304;
  return sub_20AAA176C(v4 - 144);
}

uint64_t sub_20AAA1080(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 16) ^ (1755732067 * ((a1 - 2 * (a1 & 0x7A08EF3) + 127962867) ^ 0xD9663328));
  return (*((uint64_t (**)(void))*(&off_24C363D30 + (v1 ^ 0x4F))
          + ((1397 * (*(_QWORD *)(a1 + 8) != 0x140B289DC8FEE254)) ^ v1)))();
}

uint64_t sub_20AAA1108@<X0>(uint64_t a1@<X8>)
{
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(a1
                              + 8
                              * ((1841 * (*(_DWORD *)(v2 - 0x140B289DC8FEE23CLL) == ((v1 + 1417) ^ 0x1244BC4E))) ^ v1)))();
}

uint64_t sub_20AAA1150@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  unsigned int v3;
  unsigned int v4;
  _BOOL4 v5;
  _BOOL4 v6;

  v3 = *(_DWORD *)(v1 - 0x140B289DC8FEE244) + 135446768;
  v4 = *(_DWORD *)(v1 - 0x140B289DC8FEE248) - 986139738;
  v5 = v3 < 0x3FF27F83;
  v6 = v3 > v4;
  if (v5 != v4 < 0x3FF27F83)
    v6 = v5;
  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((v6 * (((v2 ^ 0x679) + 352) ^ 0x241)) ^ v2)) - 12))();
}

uint64_t sub_20AAA11E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int v2;
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;

  v7 = *(_QWORD *)(v4 - 0x140B289DC8FEE254);
  v8 = *(unsigned __int8 *)(v7 + (v3 - 937410200)) ^ 0xFB;
  v9 = (((v6 + 898031009) & 0xCA7927B6 ^ *(unsigned __int8 *)(v7 + (v3 - 937410203)) ^ 0x4F) << 24) | ((*(unsigned __int8 *)(v7 + (((v6 - 592) | 0xF0) ^ 0xC820419A) + v3) ^ 0xFB) << 16) | ((*(unsigned __int8 *)(v7 + (v3 - 937410201)) ^ 0xFB) << 8) | v8;
  return ((uint64_t (*)(void))(*(_QWORD *)(a2
                                        + 8
                                        * ((42
                                          * (((v9 + v2 - 2 * (v9 & (v2 + 4) ^ v8 & 4)) & 0xFFFFFF ^ 0x44BACB)
                                           - (*(_DWORD *)(a1 + 32) ^ v5) == -813481238)) ^ v6))
                            - 12))();
}

uint64_t sub_20AAA12D4@<X0>(int a1@<W1>, int a2@<W3>, uint64_t a3@<X8>)
{
  return ((uint64_t (*)(void))(*(_QWORD *)(a3
                                        + 8
                                        * ((77 * ((a2 & 0x40000000) == (((10 * (a1 ^ 0x73D) - 1041) | 0x200) ^ 0x349))) ^ a1))
                            - 12))();
}

uint64_t sub_20AAA1394@<X0>(int a1@<W2>, uint64_t a2@<X8>)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  _BOOL4 v11;

  v7 = v6 + v4 + (((((a1 - 1170) | 0x34) ^ (v2 - 845)) + a1 - 529) ^ v5) + 8;
  v8 = ((2 * v7) & 0x6FBF7D36) + (v7 ^ 0x37DFBE9B) - 1808676002;
  v9 = v3 + 1364704796;
  v10 = (v9 < 0xCC1189F9) ^ (v8 < 0xCC1189F9);
  v11 = v8 > v9;
  if (v10)
    v11 = v8 < 0xCC1189F9;
  return ((uint64_t (*)(void))(*(_QWORD *)(a2 + 8 * (v11 ^ a1)) - 8))();
}

void sub_20AAA1430()
{
  _DWORD *v0;

  *v0 = -306454018;
}

uint64_t sub_20AAA1468@<X0>(_QWORD *a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  _DWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = (a2 - 589);
  *(_QWORD *)(*a1 - 0x164C0FDDF1987668) = v5 + v6 + (v7 ^ 0xF4);
  return (*(uint64_t (**)(void))(a3 + 8 * (int)((1978 * (*v3 == v4)) ^ v7)))();
}

uint64_t sub_20AAA14B4@<X0>(_QWORD *a1@<X0>, int a2@<W4>, uint64_t a3@<X8>)
{
  _DWORD *v3;
  int v4;

  *(_QWORD *)(*a1 - 0x164C0FDDF1987668) = 0;
  return (*(uint64_t (**)(void))(a3 + 8 * ((1978 * (*v3 == v4)) ^ (a2 - 589))))();
}

void sub_20AAA14F4(uint64_t a1)
{
  _DWORD *v1;
  int v2;
  int v3;

  *(_DWORD *)(*(_QWORD *)(a1 + 24) - 0x7B9E9BA5BB9673EELL) = v3;
  *v1 = v2;
  JUMPOUT(0x20AAA1464);
}

void sub_20AAA1514(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 16) ^ (1178560073 * ((2 * (a1 & 0x878F6F35) - a1 + 2020643018) ^ 0xC2E4E8A8));
  __asm { BR              X10 }
}

uint64_t sub_20AAA15E8@<X0>(uint64_t a1@<X8>, uint64_t a2, unsigned int a3, int a4, unint64_t *a5, uint64_t a6, unsigned int a7)
{
  int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;

  v10 = 3804331 * (&a3 ^ 0x7ED525F6);
  a3 = v10 + 585125465;
  a4 = v10 + v7 + 36;
  a5 = &STACK[0x25E912EA7879E49C];
  a6 = v8;
  a7 = v10 - 986389580;
  v11 = ((uint64_t (*)(unsigned int *))(*(_QWORD *)(a1 + 8 * (v7 ^ 0x65)) - 12))(&a3);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v9
                                                      + 8
                                                      * ((1937 * (*(_DWORD *)(v8 - 0x140B289DC8FEE23CLL) == 306494155)) ^ v7))
                                          - 8))(v11);
}

void sub_20AAA16A0(_DWORD *a1@<X8>)
{
  _DWORD *v1;
  int v2;
  unsigned int v3;
  _BYTE *v4;

  v3 = v1[1] - v2 - ((2 * (v1[1] - v2) - 779664154) & 0xD5499EF8) - 748129809;
  *v4 = (HIBYTE(v3) ^ 0xEA) - ((2 * (HIBYTE(v3) ^ 0xEA)) & 0xF7) - 5;
  v4[1] = (BYTE2(v3) ^ 0xA4) + (~(2 * (BYTE2(v3) ^ 0xA4)) | 9) - 4;
  v4[2] = (BYTE1(v3) ^ 0xCF) - ((2 * (BYTE1(v3) ^ 0xCF)) & 0xF7) - 5;
  v4[3] = v3 ^ 0x87;
  *v1 = *a1;
}

uint64_t sub_20AAA176C(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 16) - 1374699841 * ((((2 * a1) | 0x340440B2) - a1 + 1711136679) ^ 0xF7F63850);
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_24C363D30 + v1 - 1313)
                              + ((39 * (*(_QWORD *)a1 == *(_QWORD *)(a1 + 8))) ^ v1))
                            - 2 * (v1 ^ 0x7F7u)
                            + 1090))();
}

uint64_t sub_20AAA17E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  int v5;

  v4 = *(_DWORD *)(v2 - 0x4FF3ADA337C70001);
  v5 = v4 - 311742309;
  if (v4 - 311742309 < 0)
    v5 = 311742309 - v4;
  *(_DWORD *)(v1 - 0x4FF3ADA337C70001) = v4;
  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * ((14
                                          * ((v5 ^ 0xD7FA76DF)
                                           + (((v3 - 774) | 0x494) ^ 0x3EC7EAEC)
                                           + ((v5 << (((v3 + 106) | 0x40) + 17)) & 0xAFF4EDBE) == 381838871)) ^ v3))
                            - 8))();
}

uint64_t sub_20AAA1890@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;

  *(_DWORD *)(*(_QWORD *)(v3 - 0x4FF3ADA337C6FFFDLL) + 4 * (v5 - 381838872)) = *(_DWORD *)(*(_QWORD *)(v4 - 0x4FF3ADA337C6FFFDLL)
                                                                                           + 4 * (v5 - 381838872));
  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((1720 * (v5 - 1 == v1)) ^ v2)) - (((v2 - 752) | 0x5D4u) ^ 0x5DCLL)))();
}

void sub_20AAA1900()
{
  JUMPOUT(0x20AAA18C8);
}

void sub_20AAA1908(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  BOOL v5;
  int v6;
  int v7;

  v1 = 535753261 * (((a1 | 0xB4CC401E) - a1 + (a1 & 0x4B33BFE1)) ^ 0xBE384E31);
  v2 = *(_DWORD *)(a1 + 8) ^ v1;
  v3 = *(_DWORD *)(a1 + 24) - v1;
  v4 = *(_DWORD *)(*(_QWORD *)(a1 + 16) - 0x4FF3ADA337C70001);
  v6 = v4 - 311742309;
  v5 = v4 - 311742309 < 0;
  v7 = 311742309 - v4;
  if (!v5)
    v7 = v6;
  __asm { BR              X12 }
}

uint64_t sub_20AAA19EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  unsigned int v5;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3
                                                                                 + 8
                                                                                 * ((202 * (v4 == v5 + 572614103)) ^ v5))
                                                                     - ((v5 - 1073839545) & 0x40017BEE)
                                                                     + 676))(a1, a2, a3, 1432421903);
}

uint64_t sub_20AAA1A3C(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  *(_DWORD *)(result + 28) = a4;
  return result;
}

uint64_t sub_20AAA1A48(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;

  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v1
                                                                                                 + 8
                                                                                                 * ((7 * (v3 ^ 0x23B)) ^ 0x269))
                                                                                     - ((7 * (v3 ^ 0x23B) + 297927324) & 0xEE3DFBEE ^ 0x2A4)))(a1, 713101540, 7 * (v3 ^ 0x23Bu), (7 * (v3 ^ 0x23B) + 297927324) & 0xEE3DFBEE, 2216545830, v2);
}

uint64_t sub_20AAA1AE4@<X0>(_QWORD *a1@<X0>, int a2@<W3>, int a3@<W4>, int a4@<W5>, int a5@<W8>)
{
  uint64_t v5;
  int v6;
  unsigned int v7;
  char v8;

  *(_BYTE *)(*a1 + (a4 + a5)) = ((a3 ^ v7) >> v8)
                                            - ((((a2 + 100) | 0xAC) + 58) & (2 * ((a3 ^ v7) >> v8)))
                                            - 5;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((1552 * (((a2 + 373) ^ 0xFFFFFBDE) + a4 == v6 + 1142)) ^ a2)) - 8))();
}

uint64_t sub_20AAA1B50(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  int v4;

  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v3 + 8 * ((617 * (v4 == 24)) ^ a3))
                                                   - ((a3 + 297927324) & 0xEE3DFBEE ^ 0x2A4)))(a1, a2);
}

uint64_t sub_20AAA1B98(uint64_t a1, int a2, int a3)
{
  unsigned int v3;
  uint64_t v4;
  int v5;
  unsigned int v6;
  _BOOL4 v7;
  int v8;
  int v9;
  _BOOL4 v10;

  v7 = v3 > v6;
  v8 = (((a3 - 537) | 0xA4) ^ 0x24FDD4C8) + a2;
  v9 = v7 ^ (v8 < -813766840);
  v10 = v8 < v5;
  if (!v9)
    v7 = v10;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((655 * v7) ^ a3)) - 8))();
}

uint64_t sub_20AAA1C08@<X0>(_QWORD *a1@<X0>, int a2@<W1>, int a3@<W2>, int a4@<W8>)
{
  int v4;
  _QWORD *v5;

  return sub_20AAA1AE4(a1, (a3 - 885) | 0x200u, *(_DWORD *)(*v5 + 4 * (a2 - 713102224 + ((a3 - 885) | 0x200))), v4, a4);
}

void sub_20AAA1C38(uint64_t a1)
{
  int v1;
  int v2;
  BOOL v3;
  int v4;

  v1 = 1178560073 * ((-2 - ((a1 | 0x5A50E64C) + (~(_DWORD)a1 | 0xA5AF19B3))) ^ 0x1F3B61D1);
  v2 = *(_DWORD *)(a1 + 40) ^ v1;
  if (*(_QWORD *)(a1 + 48) | *(_QWORD *)(a1 + 64))
    v3 = *(_DWORD *)(a1 + 24) + v1 == 1843745065;
  else
    v3 = 1;
  v4 = v3;
  __asm { BR              X8 }
}

uint64_t sub_20AAA1DA4()
{
  unsigned int v0;
  _QWORD *v1;
  uint64_t v2;
  BOOL v4;

  v4 = v1[1] == 0x843828D0CDF342DLL || (v1[7] | v1[4]) == 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((1802 * (((v0 + 1) ^ v4) & 1)) ^ v0))
                            - (v0
                             - 354)
                            + 542))();
}

uint64_t sub_20AAA1E04@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *(_QWORD *)(v3 + 72);
  *(_DWORD *)(v2 - 0x843828D0CDF342DLL) = 0;
  return (*(uint64_t (**)(uint64_t, _QWORD))(v4 + 8 * (((v5 == 0x4FF3ADA337C70005) * (a2 + 877)) ^ a2)))(a1, ((a2 - 1258652323) & 0x4B0583F1u) - 879);
}

uint64_t sub_20AAA1EC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  int v29;

  v29 = 1224239923 * ((-1189047003 - ((v28 - 144) | 0xB9209525) + ((v28 - 144) | 0x46DF6ADA)) ^ 0xB46C970D);
  *(_QWORD *)(v28 - 136) = &a24 + v24;
  *(_DWORD *)(v28 - 144) = v29 ^ 0x1968566D;
  *(_DWORD *)(v28 - 128) = v29 + v26 - 166;
  sub_20AACD898((_DWORD *)(v28 - 144));
  return (*(uint64_t (**)(uint64_t, uint64_t))(v27
                                                     + 8
                                                     * ((474
                                                       * (((v25 == 0) ^ ((v26 ^ 0x75) + v26 - 109 + 1)) & 1)) ^ (v26 - 167))))(a1, a2);
}

uint64_t sub_20AAA1FAC@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;

  v20 = a1 ^ 0x351;
  v21 = ((((v19 - 144) | 0xA750946B) + (~(v19 - 144) | 0x58AF6B94)) ^ 0x1DC4EC08) * v11;
  *(_QWORD *)(v19 - 128) = v15;
  *(_QWORD *)(v19 - 120) = v18;
  *(_DWORD *)(v19 - 140) = a1 - v21 - 887;
  *(_DWORD *)(v19 - 136) = v21 + v12 + (a1 ^ 0xD6937C18);
  (*(void (**)(uint64_t))(v13 + 8 * (a1 - 1219)))(v19 - 144);
  *(_DWORD *)(v19 - 128) = (v20 - 361) ^ (628203409
                                        * ((2 * ((v19 - 144) & 0x258BFE8) - (v19 - 144) + 2108112919) ^ 0xFF2F4C24));
  *(_QWORD *)(v19 - 144) = v16;
  *(_QWORD *)(v19 - 136) = a10;
  ((void (*)(uint64_t))(*(_QWORD *)(v13 + 8 * (v20 ^ 0x657)) - 4))(v19 - 144);
  *(_DWORD *)(v19 - 128) = v20
                         + 1374699841
                         * ((-1987833309 - ((v19 - 144) | 0x89841223) + ((v19 - 144) | 0x767BEDDC)) ^ 0x1B8FF5D5)
                         - 433;
  *(_QWORD *)(v19 - 112) = v18;
  *(_QWORD *)(v19 - 104) = v16;
  *(_QWORD *)(v19 - 120) = a11;
  *(_QWORD *)(v19 - 144) = a9;
  *(_QWORD *)(v19 - 136) = a10;
  v22 = ((uint64_t (*)(uint64_t))(*(_QWORD *)(v13 + 8 * (v20 ^ 0x65E)) - 12))(v19 - 144);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v17
                                                      + 8
                                                      * (int)(((((v20 + 218382756) & 0xF2FBB9DE) - 412) * (v14 != 0)) ^ v20))
                                          - 12))(v22);
}

uint64_t sub_20AAA2208()
{
  _DWORD *v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t result;
  uint64_t v8;
  int v9;
  _DWORD *v10;

  v6 = 535753261 * ((((2 * (v5 - 144)) | 0x8A12C0B8) - (v5 - 144) - 1158242396) ^ 0x4FFD6E73);
  *(_DWORD *)(v5 - 136) = (v2 + 740) ^ v6;
  *(_DWORD *)(v5 - 120) = v6 + v1 + (((v2 + 172) | 0x100) ^ 0xB43C1AA0);
  *(_QWORD *)(v5 - 144) = v8;
  *(_QWORD *)(v5 - 128) = v4;
  result = ((uint64_t (*)(uint64_t))(*(_QWORD *)(v3 + 8 * (v2 - 340)) - 8))(v5 - 144);
  *v10 = v9;
  *v0 = 306494155;
  return result;
}

void gLg1CWr7p()
{
  int v0[10];
  uint64_t v1;

  v1 = *MEMORY[0x24BDAC8D0];
  v0[1] = 108757529
        * (((v0 | 0x51085D1D) - v0 + (v0 & 0xAEF7A2E0)) ^ 0xB1943F36)
        - 504207030;
  sub_20AAE5C84(v0);
  __asm { BR              X8 }
}

uint64_t sub_20AAA243C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, unint64_t *a19, unsigned int a20,unsigned int a21,int a22)
{
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v25 = 1759421093 * (((&a19 | 0x4A2520BD) + (~&a19 | 0xB5DADF42)) ^ 0xF95890E8);
  a20 = v25 + 1609;
  a22 = v25 ^ 0x445509ED;
  LODWORD(a19) = v25 ^ 0x1F2726AC;
  HIDWORD(a19) = v25 ^ 0x24D21C9;
  (*(void (**)(unint64_t **))(v24 + 1456))(&a19);
  if (a21 < 0x48EDB6D0)
    v26 = 1;
  else
    v26 = 2;
  LODWORD(a11) = v26;
  a21 = 178
      - 460628867
      * ((2 * ((&a19 ^ 0x9B42E749) & 0x570861) - (&a19 ^ 0x9B42E749) - 5703778) ^ 0x287C92AA);
  a19 = &STACK[0x7EF87141C217A9E9];
  sub_20AAE2E14((uint64_t)&a19);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 + 8 * ((1219 * (a20 == 306494155)) ^ v22)) - 12))(v27, v28, v29, v30, v31, v32, v33, v34, a9, a10, a11, a12);
}

uint64_t sub_20AAA2568(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,unsigned int a21,uint64_t a22,unsigned int a23,uint64_t a24)
{
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  unsigned int v30;
  void (*v31)(int *);
  unsigned int v32;
  uint64_t v33;

  v29 = 1178560073 * ((2 * (&a20 & 0x1E626340) - &a20 + 1637719231) ^ 0xDB09E4DD);
  a21 = ((2 * v26) & 0xAE7FFF5E) + (v26 ^ 0xD73FFFAF) + 1073503710 + v29;
  a23 = v29 ^ 0xEE;
  a22 = a15;
  sub_20AAA1514((uint64_t)&a20);
  v30 = 1178560073 * ((&a20 & 0x19CBBAA7 | ~(&a20 | 0x19CBBAA7)) ^ 0x5CA03D3A);
  a23 = v30 ^ ((v25 ^ 0xABFFFBF7) + 1608404526 + ((2 * v25) & 0x57FFF7EE));
  a24 = v24;
  a22 = a15;
  a21 = v30 + 405;
  v31 = (void (*)(int *))(*(_QWORD *)(v28 + 1376) - 12);
  v31(&a20);
  v32 = 1178560073 * ((&a20 & 0x71FB31F6 | ~(&a20 | 0x71FB31F6)) ^ 0x3490B66B);
  a22 = a15;
  a23 = v32 ^ ((a13 ^ 0xABFFDF3D) + 1608411880 + ((2 * a13) & 0x57FFBE7A));
  a24 = a14;
  a21 = v32 + 405;
  v33 = ((uint64_t (*)(int *))v31)(&a20);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v27
                                                      + 8
                                                      * (((2 * (a20 != 306494155)) | (4 * (a20 != 306494155))) ^ 0x5E9u))
                                          - 4))(v33);
}

uint64_t sub_20AAA2754(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, unint64_t *a19, uint64_t a20,unsigned int a21,unsigned int a22,unsigned int a23,int a24)
{
  unsigned int v24;
  int v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;

  v27 = 460628867
      * ((((&a19 | 0x64BC5B96) ^ 0xFFFFFFFE) - (~&a19 | 0x9B43A469)) ^ 0xD7D52614);
  a21 = v27 + 2020931527;
  a22 = v27 + v24 - 2024874602;
  a23 = (a11 ^ 0xCFE6FFBE) + 2143022916 + ((2 * a11) & 4) - v27;
  a19 = &STACK[0x61B876722A6C087];
  a20 = a14;
  v28 = sub_20AAE5D1C((uint64_t)&a19);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v26
                                                      + 8 * ((3563 * (a24 == v25 + (v24 ^ 0x7BA) - 45 - 552)) ^ v24))
                                          - 4))(v28);
}

uint64_t sub_20AAA2840(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  uint64_t v4;
  unsigned int v5;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4
                                                              + 8 * ((((v3 ^ 0x2E5) + 1000) * (v5 < 0x48EDB6D0)) ^ v3)))(a1, a2, a3);
}

uint64_t sub_20AAA28D0@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, _BYTE *a10, int a11, char a12, unsigned int a13, char *a14, _BYTE *a15, uint64_t a16, unsigned int a17)
{
  int v17;
  unsigned int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(unsigned int *);
  _BYTE *v23;
  uint64_t v24;
  uint64_t v25;

  a14 = &a12 + a1;
  a15 = a10;
  a13 = (v19 - 300) ^ (((((&a13 | 0xD30FDF98) ^ 0xFFFFFFFE) - (~&a13 | 0x2CF02067)) ^ 0x4104386E)
                     * v17);
  v22(&a13);
  a17 = (v18 + 93) ^ (1225351577 * (&a13 ^ 0x239AD816));
  a15 = v23;
  a16 = v20;
  a14 = a10;
  ((void (*)(unsigned int *))(*(_QWORD *)(v24 + 8 * (v18 + 46)) - 8))(&a13);
  a13 = (v18 + 121) ^ (1374699841
                     * (((&a13 | 0x185B9FF5) - (&a13 & 0x185B9FF5)) ^ 0x75AF87FC));
  a15 = a10;
  a14 = a4;
  v22(&a13);
  a13 = (v18 + 866) ^ (1755732067 * ((&a13 & 0xB08BCCF8 | ~(&a13 | 0xB08BCCF8)) ^ 0x91B28EDC));
  a14 = a10;
  v25 = sub_20AABD7C8((uint64_t)&a13);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v21 + 8 * ((412 * ((_DWORD)a15 == v18 + 306493979)) ^ v18))
                                          - ((v18 + 1343) ^ 0x5E3)))(v25);
}

uint64_t sub_20AAA2A70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, int a16)
{
  unsigned int v16;
  int v17;
  uint64_t v18;

  return (*(uint64_t (**)(void))(v18 + 8
                                    * ((((16 * (v16 ^ 0x283) + 588849375) & 0x6DDEF ^ 0x2C6) * (a16 == v17)) ^ v16)))();
}

uint64_t sub_20AAA2AB8@<X0>(unsigned int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, int a5, unsigned int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12)
{
  unsigned int v12;
  uint64_t v13;

  return ((uint64_t (*)(void))(*(_QWORD *)(v13 + 8 * (((a1 + 83) ^ ((a12 ^ v12) > a6)) & 1 ^ a1))
                            - ((7 * (a1 ^ 0x7F9)) ^ 0x5E7)))();
}

uint64_t sub_20AAA2B08()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (v0 ^ (195
                                               * ((((v1 - ((2 * v1) & 0x971E4AE) + 79229527) << (((v0 - 70) | 0xC2) + 18)) & 0x7F5EFFFE ^ 0x950E4AE)
                                                + ((v1 - ((2 * v1) & 0x971E4AE) + 79229527) ^ 0xBB178DA8)
                                                + 2130687971 == 1051670498))))
                            - 12))();
}

uint64_t sub_20AAA2BA0(int a1)
{
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * (((((v1 + 306) ^ 0x383) + 349) * ((a1 + v2 + 1079017473) < 8)) ^ (v1 + 306)))
                            - ((v1 - 35651958) & 0xF7EFBDFF)
                            + 4124032245))();
}

uint64_t sub_20AAA2C24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;

  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v12
                                                               + 8
                                                               * (v11 ^ (1987 * ((unint64_t)(v8 - a8) > 0x1F))))
                                                   - ((157 * ((v11 - 137380905) & 0xFDFFFEFF ^ (v9 + 1515))) ^ 0x27CLL)))(a1, v10);
}

uint64_t sub_20AAA2C84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, int a7)
{
  int v7;
  unsigned int v8;
  uint64_t v9;

  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * (((v7 + ((a6 + a7 + 436) & a5) + 959) * (v8 < 0x20)) ^ a7))
                            - (((a7 - 113) | 0x158u) ^ 0x357)))();
}

uint64_t sub_20AAA2CCC(int a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  char v9;
  int v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;

  v15 = a1 + v12 + a3;
  v16 = v8 + v15;
  v17 = *(_OWORD *)(v16 - 31);
  v18 = a8 + v15;
  *(_OWORD *)(v18 - 15) = *(_OWORD *)(v16 - 15);
  *(_OWORD *)(v18 - 31) = v17;
  return (*(uint64_t (**)(void))(v14
                              + 8
                              * ((106 * (((v13 - v9 - 30) ^ ((v11 & 0xFFFFFFE0) == 32)) & 1)) ^ (v10 + v13 + 2428))))();
}

void sub_20AAA2D2C()
{
  JUMPOUT(0x20AAA2CE8);
}

uint64_t sub_20AAA2D38()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3 + 8 * ((((217 * (v2 ^ 0x2D6)) ^ ((v2 ^ 0x59) + 839)) * (v0 == v1)) | v2)))();
}

uint64_t sub_20AAA2D70(int a1)
{
  int v1;
  int v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((468 * ((((a1 ^ 0x1D3 ^ v2) + v1 + a1 + 871) & v3) == 0)) ^ a1))
                            - 12))();
}

uint64_t sub_20AAA2DAC(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;

  v14 = (a4 - 19) | 3;
  v15 = v10 - v12 + (v14 ^ 0x3FB ^ (v9 + 144));
  *(_QWORD *)(a8 - 7 + v15) = *(_QWORD *)(v8 - 7 + v15);
  return ((uint64_t (*)(void))(*(_QWORD *)(v13 + 8 * (v14 ^ (16 * (((v14 - 851) & v11) - v12 != 8)))) - 4))();
}

uint64_t sub_20AAA2E0C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  int v5;
  int v6;
  int v7;
  uint64_t v8;

  *(_QWORD *)(a3 + (v5 + a5 + a4)) = *(_QWORD *)(a1 + (v5 + a5 + a4));
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * (v7 ^ (16 * (v6 + a5 != 8)))) - 4))();
}

uint64_t sub_20AAA2E3C()
{
  char v0;
  int v1;
  int v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * (((((v1 == v3) ^ (v2 + 63 + v0)) & 1) * ((v2 + 1343) ^ 0x603)) ^ v2))
                            - 12))();
}

uint64_t sub_20AAA2E70@<X0>(int a1@<W1>, uint64_t a2@<X7>, int a3@<W8>)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;

  *(_BYTE *)(a2 + (a1 + v5)) = *(_BYTE *)(v3 + (a1 + v5));
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((347 * (a1 - 1 != ((v7 - v4) ^ a3))) ^ (v6 + v7 + 883))) - 12))();
}

uint64_t sub_20AAA2EB0()
{
  void (*v0)(_BYTE *);
  int v1;
  unsigned int v2;
  int v3;
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[4];
  unsigned int v8;
  uint64_t v9;

  v8 = v1 + 535753261 * (v7 ^ 0xAF40E2F) - 1031;
  v9 = v6;
  v0(v7);
  v8 = v1 - 967 + 535753261 * ((2 * (v7 & 0x54327D8) - v7 - 88287200) ^ 0xF048D60F) - 64;
  v9 = v5;
  v0(v7);
  return v3 ^ v2;
}

void sub_20AAA2F7C(_DWORD *a1)
{
  unsigned int v1;

  v1 = *a1 ^ (1225351577
            * ((-1431559688 - (a1 ^ 0x637B64C4 | 0xAAAC21F8) + (a1 ^ 0x637B64C4 | 0x5553DE07)) ^ 0x15B262D5));
  __asm { BR              X15 }
}

void sub_20AAA30A8(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;

  *(_DWORD *)(a2 + v3) = v2;
}

void sub_20AAA3EA8(_DWORD *a1)
{
  unsigned int v1;

  v1 = *a1 + 1755732067 * (((a1 | 0xFD508F6) - (_DWORD)a1 + (a1 & 0xF02AF709)) ^ 0xD113B52D);
  __asm { BR              X14 }
}

uint64_t sub_20AAA3FA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  _BOOL4 v12;

  v9 = v7 - 94;
  v10 = v6 + (v7 ^ 0x88BB890A);
  v12 = v10 > 458250236 || v10 < a6 - 1689233411;
  return (*(uint64_t (**)(uint64_t))(v8 + 8 * ((172 * v12) ^ v9)))(0x75A9E8BA5836BEB4);
}

uint64_t sub_20AAA40A8@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W3>, _QWORD *a4@<X6>, unsigned int a5@<W7>, int a6@<W8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _BOOL4 v20;

  v18 = a1
      - 0x75A9E8BA5836BEB4
      + (*(_DWORD *)(v6 + 4 * v8) ^ v9)
      + a5 * (unint64_t)(*(_DWORD *)(*a4 + 4 * a2) ^ (v9 + (v10 ^ v12) * v13 - 1055));
  *(_DWORD *)(v6 + 4 * v8) = v18 + v9 - (((_DWORD)v18 << (((v10 + v14) & v15) - 51)) & 0x83B9C4C);
  v20 = a2 - 1466275841 < a6 && a2 - 1466275841 >= a3;
  return ((uint64_t (*)(unint64_t))(*(_QWORD *)(v7 + 8 * (v10 ^ (v20 | (8 * v20)))) - 12))((v16 ^ HIDWORD(v18)) + (v17 & (v18 >> 31)) + v11);
}

uint64_t sub_20AAA4160(uint64_t a1)
{
  uint64_t v1;
  int v2;

  return (*(uint64_t (**)(void))(v1
                              + 8
                              * ((184 * (a1 != (v2 ^ 0x4E4u) + 307 + 0x75A9E8BA5836BEB4 + 7 * (v2 ^ 0x4E4u) - 2315)) ^ v2)))();
}

uint64_t sub_20AAA41C0@<X0>(uint64_t a1@<X0>, int a2@<W8>)
{
  int v2;
  uint64_t v3;
  int v4;
  _BOOL4 v6;

  v6 = v2 - 1139720178 > 1319505778 || v2 - 1139720178 < (int)(((a2 - 230) ^ 0xCEA60A84) + v4);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3
                                                                        + 8
                                                                        * ((((((a2 - 221) ^ v6) & 1) == 0) * (a2 - 742)) ^ (a2 - 230)))
                                                            - 8))(a1, 3155247118, 1319505778);
}

uint64_t sub_20AAA427C@<X0>(uint64_t a1@<X0>, int a2@<W6>, int a3@<W7>, int a4@<W8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  unint64_t v13;

  v13 = a1 - 0x75A9E8BA5836BEB4 + (v7 ^ 0x841DCE26);
  *(_DWORD *)(v6 + 4 * v4) = v13 + ((3 * ((v11 + 230) ^ a2)) ^ a3) + ~((2 * v13) & 0x83B9C4C);
  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((((v8 ^ HIDWORD(v13)) + (v9 & (v13 >> 31)) + v10 == v12) * a4) ^ (v11 + 230)))
                            - 8))();
}

uint64_t sub_20AAA4314(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v5;
  uint64_t v6;
  _DWORD *v7;
  int v8;
  int v9;
  BOOL v10;

  v8 = a5 + *v7 + 595160735;
  v9 = (v5 + 595161293 < -1240580046) ^ (v8 < -1240580046);
  v10 = v5 + 595161293 > v8;
  if (v9)
    v10 = v5 + 595161293 < -1240580046;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((27 * (((a5 + 1) ^ v10) & 1)) ^ a5)) - 4))();
}

void sub_20AAA4380()
{
  int v0;
  _DWORD *v1;

  *v1 = v0;
}

void sub_20AAA43A4(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 36) ^ (235795823
                             * ((-2 - ((a1 ^ 0x29040430 | 0x96E8ABCB) + (a1 ^ 0x10C0A082 | 0x69175434))) ^ 0x52961214));
  __asm { BR              X13 }
}

uint64_t sub_20AAA4508(int a1)
{
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t))(v2 + 8 * (((a1 ^ 0x55C) * (v1 == 0xB0C4CFB)) ^ a1)))(1237837967);
}

uint64_t sub_20AAA4568@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  int v14;
  _BOOL4 v15;

  *(_BYTE *)(a2 + (a1 - 1237837967)) = *(_BYTE *)(v2 + (a1 - 1237837967)) ^ *(_BYTE *)(v5 + ((a1 - 1237837967) & 0xFLL)) ^ *(_BYTE *)(v4 + ((a1 - 1237837967) & 0xFLL)) ^ *(_BYTE *)(v3 + ((a1 - 1237837967) & 0xFLL)) ^ (97 * ((a1 + 113) & 0xF)) ^ 0xFB;
  v12 = a1 - 1876329211;
  v13 = (a1 + 1);
  v14 = (v8 > v10) ^ (v12 < v7 - 141 + v6);
  v15 = v12 < v9;
  if (v14)
    v15 = v8 > v10;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v11 + 8 * ((911 * v15) ^ v7)) - 12))(v13);
}

uint64_t sub_20AAA45FC()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * (v2 ^ ((((8 * (v2 ^ 0x5AC) - 8914674) & (2 * v1) ^ v0)
                                                                 + (v1 ^ 0xF4B7B004)
                                                                 + 1070968736 != v2 + 1066510061) << 6)))
                            - 12))();
}

uint64_t sub_20AAA465C(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v7;

  return (*(uint64_t (**)(void))(v7 + 8 * ((1064 * (a2 + a1 + ((933 * (a7 ^ 0xF2)) ^ 0x44044Bu) >= (a7 ^ 0xF8u))) ^ a7)))();
}

uint64_t sub_20AAA46B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, int a8)
{
  uint64_t v8;
  uint64_t v9;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9
                                                                                 + 8
                                                                                 * ((((a8 & 0xFFFFFFF0) == (((a7 ^ 0x90) + 1328487571) & 0xB0D0E3FC) - 4457456)
                                                                                   * ((((a7 ^ 0x90) + 488) | 0x502) ^ 0x79C)) ^ a7 ^ 0x90))
                                                                     - 8))(a1, a2, a3, v8);
}

uint64_t sub_20AAA4714@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W2>, int a4@<W4>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _BOOL4 v21;

  v10 = (a2 + a1 + a3);
  v11 = v10 + v5;
  v12 = v10 + a5;
  v13 = v11 - v12;
  v14 = (a2 + a1) & 0xF;
  v15 = v14 + v8 - v12;
  v16 = (v14 | v7) - v12;
  v17 = (v14 | v6) - v12;
  v21 = v13 > 0xF && v15 > 0xF && v16 >= ((a4 - 1888692981) & 0x70932BDF ^ 0x1CBuLL) && v17 > 0xF;
  return (*(uint64_t (**)(void))(v9 + 8 * ((501 * v21) ^ a4)))();
}

uint64_t sub_20AAA4794(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7)
{
  uint64_t v7;
  unsigned int v8;

  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v7
                                                                       + 8
                                                                       * ((990 * (v8 < (((a7 + 347) | 8) ^ 0x32E))) ^ a7))
                                                           - 12))(a1, a2, 0);
}

uint64_t sub_20AAA47CC@<X0>(int a1@<W3>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  int8x16_t v10;
  int8x16_t v11;
  uint64_t v12;
  int8x16_t v13;
  int8x16_t v14;
  int8x16_t v15;
  int8x16x4_t v17;
  int8x16x4_t v18;

  v17.val[1].i64[0] = ((_BYTE)v7 + 14) & 0xF;
  v17.val[1].i64[1] = ((_BYTE)v7 + 13) & 0xF;
  v17.val[2].i64[0] = ((_BYTE)v7 + 12) & 0xF;
  v17.val[2].i64[1] = ((_BYTE)v7 + 11) & 0xF;
  v17.val[3].i64[0] = ((_BYTE)v7 + 10) & 0xF;
  v17.val[3].i64[1] = ((_BYTE)v7 + 9) & 0xF;
  v18.val[0].i64[0] = ((_BYTE)v7 + 8) & 0xF;
  v18.val[0].i64[1] = ((_BYTE)v7 + 7) & 0xF;
  v18.val[1].i64[0] = (v7 + 6) & 0xF;
  v18.val[1].i64[1] = (v7 + 5) & 0xF;
  v18.val[2].i64[0] = (v7 + 4) & 0xF;
  v18.val[2].i64[1] = ((_BYTE)v7 + 3) & 0xF;
  v18.val[3].i64[0] = ((_BYTE)v7 + 2) & 0xF;
  v18.val[3].i64[1] = ((_BYTE)v7 + 1) & 0xF;
  v10.i64[0] = 0x6161616161616161;
  v10.i64[1] = 0x6161616161616161;
  v11.i64[0] = 0xFBFBFBFBFBFBFBFBLL;
  v11.i64[1] = 0xFBFBFBFBFBFBFBFBLL;
  v12 = v7 + ((a1 + 1158) ^ (v6 + 527));
  v17.val[0].i64[0] = ((_BYTE)v7 + ((a1 - 122) ^ (v6 + 15))) & 0xF;
  v17.val[0].i64[1] = ((_BYTE)v7 - 1) & 0xF;
  v13.i64[0] = vqtbl4q_s8(v17, (int8x16_t)xmmword_20AB03690).u64[0];
  v13.i64[1] = vqtbl4q_s8(v18, (int8x16_t)xmmword_20AB03690).u64[0];
  v14 = vrev64q_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v2 - 15 + v12), *(int8x16_t *)(v5 + (v12 & 0xF) - 15)), veorq_s8(*(int8x16_t *)(v4 + (v12 & 0xF) - 15), *(int8x16_t *)(v3 + (v12 & 0xF) - 15))));
  v15 = vrev64q_s8(veorq_s8(veorq_s8(vextq_s8(v14, v14, 8uLL), v11), vmulq_s8(v13, v10)));
  *(int8x16_t *)(a2 - 15 + v12) = vextq_s8(v15, v15, 8uLL);
  return (*(uint64_t (**)(void))(v8 + 8 * ((1270 * ((v9 & 0xFFFFFFF0) == 16)) ^ a1)))();
}

void sub_20AAA4930()
{
  JUMPOUT(0x20AAA48A8);
}

uint64_t sub_20AAA493C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v7;
  int v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * (a7 | (19 * (v8 == a3)))) - ((439 * (a7 ^ 0x7C7u)) ^ 0x521)))();
}

uint64_t sub_20AAA4978(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  uint64_t v8;
  int v9;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(v8
                                                                                                 + 8
                                                                                                 * ((1008 * ((((a7 ^ 0x404) - 952) & v9) != 0)) ^ a7 ^ 0x631))
                                                                                     - 12))(a1, a2, a3, (v7 - a3), a5, (a7 ^ 0x404u) + 906);
}

uint64_t sub_20AAA49B4@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W2>, uint64_t a4@<X8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40)
{
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unsigned int v44;
  uint64_t v45;
  int v46;
  int v47;
  int v48;
  uint64_t v49;
  int v50;
  int v51;
  uint64_t v52;
  int8x16x4_t v54;

  *(_DWORD *)(v49 - 152) = v48;
  *(_QWORD *)(v49 - 128) = a4 - 7;
  *(_QWORD *)(v49 - 120) = v40 - 7;
  *(_DWORD *)(v49 - 160) = v48 & 0xFFFFFFF8;
  *(_DWORD *)(v49 - 136) = -(v48 & 0xFFFFFFF8);
  v50 = -8 - a3;
  v51 = v47 + a2 + a1;
  *(_DWORD *)(v49 - 144) = v51 + 9;
  v52 = (_DWORD)v45 + v50 + ((v46 - 459) ^ v44) + 8;
  v54.val[0].i64[0] = ((_BYTE)v45 + (_BYTE)v50 + ((v46 + 53) ^ v44) + 8) & 0xF;
  v54.val[0].i64[1] = ((_BYTE)v51 + 15 + (_BYTE)v50 + 8) & 0xF;
  v54.val[1].i64[0] = ((_BYTE)v51 + 14 + (_BYTE)v50 + 8) & 0xF;
  v54.val[1].i64[1] = ((_BYTE)v51 + 13 + (_BYTE)v50 + 8) & 0xF;
  v54.val[2].i64[0] = ((_BYTE)v51 + 12 + (_BYTE)v50 + 8) & 0xF;
  v54.val[2].i64[1] = ((_BYTE)v51 + 11 + (_BYTE)v50 + 8) & 0xF;
  v54.val[3].i64[0] = ((_BYTE)v51 + 10 + (_BYTE)v50 + 8) & 0xF;
  v54.val[3].i64[1] = (*(_DWORD *)(v49 - 144) + (_BYTE)v50 + 8) & 0xF;
  *(int8x8_t *)(*(_QWORD *)(v49 - 128) + v52) = vrev64_s8(veor_s8(veor_s8(vrev64_s8(veor_s8(veor_s8(*(int8x8_t *)(*(_QWORD *)(v49 - 120) + v52), *(int8x8_t *)(v43 + (v52 & 0xF) - 7)), veor_s8(*(int8x8_t *)(v42 + (v52 & 0xF) - 7), *(int8x8_t *)(v41 + (v52 & 0xF) - 7)))), (int8x8_t)0xFBFBFBFBFBFBFBFBLL), vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v54, (int8x16_t)xmmword_20AB036A0), (int8x8_t)0x6161616161616161)));
  return ((uint64_t (*)(uint64_t, __n128))(*(_QWORD *)(a40 + 8 * ((*(_DWORD *)(v49 - 136) == v50) | v46))
                                                  - 8))(v45, (__n128)xmmword_20AB036A0);
}

void sub_20AAA4B2C()
{
  JUMPOUT(0x20AAA4A20);
}

uint64_t sub_20AAA4B38()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * (((439 * (v0 ^ 0x1F6) - 222) * (*(_DWORD *)(v2 - 152) == *(_DWORD *)(v2 - 160))) ^ v0))
                            - 6 * (v0 ^ 0xC2u)
                            + 1854))();
}

uint64_t sub_20AAA4B88@<X0>(int a1@<W3>, int a2@<W5>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = (v8 + a1 + 203);
  *(_BYTE *)(a3 + v10) = *(_BYTE *)(v3 + v10) ^ (3 * (a2 ^ 0xFD)) ^ *(_BYTE *)(v6 + (v10 & 0xF)) ^ *(_BYTE *)(v5 + (v10 & 0xF)) ^ *(_BYTE *)(v4 + (v10 & 0xF)) ^ (97 * (v10 & 0xF)) ^ 0xDE;
  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * ((1754 * (a1 - 1 == v7 + 1317)) ^ (a2 - 1702))) - 8))();
}

uint64_t sub_20AAA4C04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  BOOL v40;
  int v41;

  v39 = *(_QWORD *)(v36 + 24);
  *(int8x16_t *)(v38 - 112) = veorq_s8(*(int8x16_t *)(*(_QWORD *)(v36 + 40) - 0x2152BE6AABE95669), (int8x16_t)xmmword_20AB036B0);
  if (a9)
    v40 = v39 == 0x502D1C54229AA677;
  else
    v40 = 1;
  v41 = !v40;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v37 + 8 * (int)((156 * v41) ^ a5)) - 12))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36);
}

uint64_t sub_20AAA4C84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  int v35;
  uint64_t v36;
  int v37;
  _BOOL4 v39;

  v37 = a11 - ((2 * a11 + 1653982596) & 0x7FB42ECE) + 824506921;
  v39 = (((((v35 - 102) & (2 * v37)) ^ 0x46) + (v37 ^ 0xD4) + 13) & 0xF) != (((v35 - 1448) | 0x242) ^ 0x266)
     || ((v35 - 496024166) & (2 * v37) ^ 0x62240A46) + (v37 ^ 0x4EEDB2D4) == 1899472307;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 + 8 * ((v39 * (((v35 - 1133727185) & 0x43934B87) - 860)) ^ v35)) - 4))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35);
}

uint64_t sub_20AAA4D48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, uint64_t a11, int a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,int a44,int a45)
{
  uint64_t v45;

  return ((uint64_t (*)(void))(*(_QWORD *)(v45
                                        + 8
                                        * (a45 ^ (2046
                                                * (((2 * (a12 - ((2 * a10) & 0xCDC5DB64) + 1479397492)) & 0xBCFBB24 ^ 0x9C59B24)
                                                 + ((a12 - ((2 * a10) & 0xCDC5DB64) + 1479397492) ^ 0x63053020)
                                                 - 75646589 != 23435029))))
                            - 12))();
}

uint64_t sub_20AAA4E10(int a1)
{
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8 * ((30 * (a1 + v2 - 99081618 >= 7 * (v1 ^ 0x2CAu) - 1196)) ^ v1 ^ 0x3AB))
                            - ((2 * (v1 ^ 0x3AB)) ^ 0x4D0u)
                            + 1858))();
}

uint64_t sub_20AAA4EA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7)
{
  int v7;
  uint64_t v8;

  return (*(uint64_t (**)(void))(v8
                              + 8
                              * ((468 * (a7 + ((52 * (a6 ^ 0x4BE)) ^ (v7 - 536)) >= (a6 ^ 0x3FEu) - 1882)) ^ a6)))();
}

uint64_t sub_20AAA4EE8@<X0>(int a1@<W0>, int a2@<W2>, unint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _BOOL4 v20;
  int v22;
  int v24;

  v9 = (a1 + v7 + v6);
  v10 = v9 + a3 + 1;
  v11 = ((_BYTE)a1 + (_BYTE)v7 + (_BYTE)v6) & 0xF;
  v12 = v5 + v11 - v9;
  v13 = v11 + v5 + 1;
  v14 = v4 + v11 - v9 + ((a2 + 1356797943) & 0xAF20E7FF ^ 0x1FDLL);
  v15 = v11 + v4 + 3;
  v16 = v11 + v3;
  v17 = v16 - v9 + 4;
  v18 = v16 + 5;
  v20 = v13 > a3 && v12 < v10;
  v22 = v15 > a3 && v14 < v10 || v20;
  if (v18 <= a3 || v17 >= v10)
    v24 = v22;
  else
    v24 = 1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((1150 * (v24 ^ 1)) ^ a2)) - 12))();
}

uint64_t sub_20AAA4F94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  unsigned int v6;
  uint64_t v7;

  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v7
                                                                       + 8
                                                                       * (int)(((v6 > 0xF)
                                                                              * ((a6 + 171067832) & 0xF5CDB5FC ^ 0x3F5)) ^ a6))
                                                           - 12))(a1, a2, 0);
}

uint64_t sub_20AAA4FE0@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W3>, uint64_t a4@<X8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40)
{
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  int v44;
  int v45;
  unsigned int v46;
  int8x16_t v47;
  int8x16_t v48;
  int8x16_t v49;
  int8x16x4_t v51;
  int8x16x4_t v52;

  v51.val[1].i64[0] = ((_BYTE)a2 + 13) & 0xF;
  v51.val[1].i64[1] = ((_BYTE)a2 + 12) & 0xF;
  v51.val[2].i64[0] = ((_BYTE)a2 + 11) & 0xF;
  v51.val[2].i64[1] = ((_BYTE)a2 + 10) & 0xF;
  v51.val[3].i64[0] = ((_BYTE)a2 + 9) & 0xF;
  v51.val[3].i64[1] = ((_BYTE)a2 + 8) & 0xF;
  v46 = a1 + v45 + v44;
  v47.i64[0] = 0x7777777777777777;
  v47.i64[1] = 0x7777777777777777;
  v51.val[0].i64[0] = v46 & 0xF;
  v51.val[0].i64[1] = ((_BYTE)a2 + 14) & 0xF;
  v48.i64[0] = vqtbl4q_s8(v51, (int8x16_t)xmmword_20AB03690).u64[0];
  v52.val[0].i64[1] = ((_BYTE)a2 + 6) & 0xF;
  v52.val[1].i64[1] = ((_BYTE)a2 + 4) & 0xF;
  v52.val[2].i64[1] = (a2 + 2) & 0xF;
  v52.val[3].i64[1] = a2 & 0xF;
  v52.val[0].i64[0] = ((_BYTE)a2 + 7) & 0xF;
  v52.val[1].i64[0] = ((_BYTE)a2 + 5) & 0xF;
  v52.val[2].i64[0] = ((_BYTE)a2 + 3) & 0xF;
  v52.val[3].i64[0] = (a2 + 1) & 0xF;
  v48.i64[1] = vqtbl4q_s8(v52, (int8x16_t)xmmword_20AB03690).u64[0];
  v49 = vrev64q_s8(vmulq_s8(v48, v47));
  *(int8x16_t *)(a4 - 15 + v46) = veorq_s8(veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v42 + v51.val[0].i64[0] - 15), *(int8x16_t *)(a4 - 15 + v46)), *(int8x16_t *)(v51.val[0].i64[0] + v40 - 11)), *(int8x16_t *)(((a3 + 642829131) & 0xD9AF337E) + v51.val[0].i64[0] + v41 - 139)), vextq_s8(v49, v49, 8uLL));
  return ((uint64_t (*)(void))(*(_QWORD *)(a40 + 8 * ((2005 * ((v43 & 0xFFFFFFF0) == 16)) ^ a3)) - 12))();
}

void sub_20AAA5148()
{
  JUMPOUT(0x20AAA50D0);
}

uint64_t sub_20AAA5154@<X0>(unsigned __int8 *a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  int v37;
  unsigned __int8 *v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  int v43;
  unint64_t v44;
  uint64_t v45;
  int v46;
  char *v47;
  unsigned __int8 v48;
  uint64_t v49;
  char *v50;
  char v51;
  unint64_t v52;
  int v53;
  int v54;
  uint64_t v55;
  int v56;
  unsigned int v57;
  int v58;
  int v59;
  uint64_t v60;
  unint64_t v61;
  char *v62;
  unsigned int v63;
  char *v64;
  int v65;
  char *v66;
  char *v67;
  unsigned int v68;
  int v69;
  int v70;
  unsigned int v71;
  unsigned int v72;
  int v73;
  unsigned int v74;
  int v75;
  int v76;
  unsigned int v77;
  unsigned int v78;
  int v79;
  unsigned int v80;
  unsigned int v81;
  int v82;
  int v83;
  int v84;
  int v85;
  int v86;
  unsigned int v87;
  int v88;
  int v89;
  int v90;
  int v91;
  int v92;
  unsigned int v93;
  int v94;
  int v95;
  int v96;
  unsigned int v97;
  int v98;
  unsigned int v99;
  unsigned int v100;
  int v101;
  unsigned int v102;
  int v103;
  int v104;
  unsigned int v105;
  int v106;
  unsigned int v107;
  int v108;
  int v109;
  unsigned int v110;
  unsigned int v111;
  char *v112;
  uint64_t v113;
  int v114;
  char *v115;
  uint64_t v116;
  unsigned int v117;
  unsigned int v118;
  int v119;
  int v120;
  uint64_t v121;
  int v122;
  uint64_t v123;
  int v124;
  uint64_t v125;
  int v126;
  unsigned int v127;
  unsigned int v128;
  int v129;
  unsigned int v130;
  unsigned int v131;
  unsigned int v132;
  unsigned int v133;
  char *v134;
  uint64_t v135;
  int v136;
  uint64_t v137;
  unsigned int v138;
  int v139;
  unsigned int v140;
  char *v141;
  int v142;
  unsigned int v143;
  int v144;
  unsigned int v145;
  unsigned int v146;
  unsigned int v147;
  unsigned int v148;
  int v149;
  unsigned int v150;
  int v151;
  unsigned int v152;
  unsigned int v153;
  unsigned int v154;
  int v155;
  int v156;
  int v157;
  unsigned int v158;
  int v159;
  unsigned int v160;
  int v161;
  unsigned int v162;
  unsigned int v163;
  int v164;
  int v165;
  int v166;
  unsigned int v167;
  int v168;
  int v169;
  int v170;
  unsigned int v171;
  int v172;
  int v173;
  unsigned int v174;
  int v175;
  int v176;
  unsigned int v177;
  unsigned int v178;
  int v179;
  unsigned int v180;
  unsigned int v181;
  int v182;
  int v183;
  int v184;
  unsigned int v185;
  unsigned int v186;
  unsigned int v187;
  int v188;
  int v189;
  unsigned int v190;
  unsigned int v191;
  int v192;
  int v193;
  unsigned int v194;
  unsigned int v195;
  int v196;
  int v197;
  int v198;
  unsigned int v199;
  int v200;
  unsigned int v201;
  unsigned int v202;
  unsigned int v203;
  unsigned int v204;
  int v205;
  unsigned int v206;
  char *v207;
  char *v208;
  int v209;
  char *v210;
  int v211;
  uint64_t v212;
  char *v213;
  uint64_t v214;
  int v215;
  char *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  int v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  char *v232;
  uint64_t v233;
  unint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  __int128 v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  unint64_t v243;
  uint64_t v244;
  int v245;
  unsigned int v246;
  int v247;
  int v248;
  unsigned int v249;
  int v250;
  int v251;
  int v252;
  unsigned int v253;
  unsigned int v254;
  int v255;
  unsigned int v256;
  unsigned int v257;

  v42 = (char *)*(&off_24C363D30 + (v37 ^ 0x3A1u)) - 12;
  v43 = v42[*(unsigned __int8 *)(v40 - 0x502D1C54229AA676) ^ 0x85];
  HIDWORD(v44) = v43 ^ (v37 + 945);
  LODWORD(v44) = ~v43 << 24;
  v45 = *(unsigned __int8 *)(v40 - 0x502D1C54229AA66CLL);
  *(_DWORD *)(v41 - 120) = v39;
  v46 = ((v44 >> 30) ^ 0x9F) << 16;
  v47 = (char *)*(&off_24C363D30 + (v37 ^ 0x343u)) - 4;
  LODWORD(v45) = v47[v45 ^ 0xBF];
  HIDWORD(v44) = v45 ^ 8;
  LODWORD(v44) = (v45 ^ 0x20) << 24;
  v48 = v44 >> 28;
  LODWORD(v45) = v42[*(unsigned __int8 *)(v40 - 0x502D1C54229AA672) ^ 0x6FLL];
  HIDWORD(v44) = v45 ^ 0x34;
  LODWORD(v44) = ~(_DWORD)v45 << 24;
  v49 = (uint64_t)*(&off_24C363D30 + v37 - 846);
  v50 = (char *)*(&off_24C363D30 + (v37 ^ 0x324u)) - 4;
  v51 = v50[*(unsigned __int8 *)(v40 - 0x502D1C54229AA66BLL) ^ 0xD8];
  v52 = ((*(unsigned __int8 *)(v49 + (*(unsigned __int8 *)(v40 - 0x502D1C54229AA669) ^ 0xC7)) ^ 0x15) << 8) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)(v51 ^ 3u) << 24);
  v53 = (((v44 >> 30) ^ 0x68) << 16) | ((*(unsigned __int8 *)(v49
                                                                             + (*(unsigned __int8 *)(v40 - 0x502D1C54229AA671) ^ 0xDFLL)) ^ 0xD4) << 8);
  v54 = v47[*(unsigned __int8 *)(v40 - 0x502D1C54229AA668) ^ 0xBCLL];
  HIDWORD(v44) = v54 ^ 8;
  LODWORD(v44) = (v54 ^ 0x20) << 24;
  LOBYTE(v54) = v44 >> 28;
  v55 = v54 ^ 0x68;
  v56 = v47[*(unsigned __int8 *)(v40 - 0x502D1C54229AA670) ^ 0x98];
  HIDWORD(v44) = v56 ^ 8;
  LODWORD(v44) = (v56 ^ 0x20) << 24;
  v57 = v53 & 0xFFFFFF00 | ((v50[*(unsigned __int8 *)(v40 - 0x502D1C54229AA673) ^ 0xAFLL] ^ 0xD3) << 24) | (v44 >> 28);
  LODWORD(v47) = v47[*(unsigned __int8 *)(v40 - 0x502D1C54229AA674) ^ 0xD0];
  HIDWORD(v44) = v47 ^ 8;
  LODWORD(v44) = (v47 ^ 0x20) << 24;
  v58 = v46 | ((*(unsigned __int8 *)(v49 + (*(unsigned __int8 *)(v40 - 0x502D1C54229AA675) ^ 0x49)) ^ 0x5E) << 8) | ((v50[*v38 ^ 0xFELL] ^ 0xA) << 24);
  v59 = v42[*(unsigned __int8 *)(v40 - 0x502D1C54229AA66ALL) ^ 0xB6];
  LOBYTE(v47) = (v44 >> 28) ^ 0x3C;
  HIDWORD(v44) = v59 ^ 0x34;
  LODWORD(v44) = ~v59 << 24;
  v60 = (v44 >> 30) ^ 0x21;
  LODWORD(v42) = v42[*(unsigned __int8 *)(v40 - 0x502D1C54229AA66ELL) ^ 0xC8];
  HIDWORD(v44) = v42 ^ 0x34;
  LODWORD(v44) = ~(_DWORD)v42 << 24;
  v61 = (v52 | (v60 << 16) | v55) ^ 0x75F49EF4;
  v62 = (char *)*(&off_24C363D30 + (v37 ^ 0x3C6u)) - 12;
  v63 = v48 | ((*(unsigned __int8 *)(v49 + (*(unsigned __int8 *)(v40 - 0x502D1C54229AA66DLL) ^ 0xB7)) ^ 0xF5) << 8) & 0xFF00FFFF | (((v44 >> 30) ^ 0x37) << 16) | ((v50[*(unsigned __int8 *)(v40 - 0x502D1C54229AA66FLL) ^ 0x18] ^ 0x4C) << 24);
  LODWORD(v42) = (((unsigned __int16)((v52 | v55) ^ 0x9EF4) >> 8)
                - ((2 * (v61 >> 8)) & 0x15A)
                - 1367836243) ^ *(_DWORD *)&v62[4
                                              * (((unsigned __int16)((v52 | v55) ^ 0x9EF4) >> 8) ^ 0xF5)];
  v64 = (char *)*(&off_24C363D30 + v37 - 797) - 12;
  v65 = *(_DWORD *)&v64[4 * (v51 ^ 0x1C)];
  HIDWORD(v44) = v65 ^ 1;
  LODWORD(v44) = v65 ^ 0x5C6DAC3C;
  v66 = (char *)*(&off_24C363D30 + v37 - 671) - 12;
  LODWORD(v42) = (v44 >> 2) ^ *(_DWORD *)&v66[4 * (v60 ^ 0xDD)] ^ ((_DWORD)v42
                                                                               - ((2 * (_DWORD)v42) & 0xF1E9C762)
                                                                               + 2029314993);
  v67 = (char *)*(&off_24C363D30 + (v37 ^ 0x340u)) - 4;
  v256 = v58 & 0xFFFFFF00 | v47;
  v68 = *(_DWORD *)&v67[4 * (v54 ^ 0xD9)] ^ v256 ^ ((_DWORD)v42
                                                                   - ((2 * (_DWORD)v42) & 0xBEF70586)
                                                                   - 545553725);
  v257 = v57;
  v254 = v63;
  v252 = v68 ^ v57 ^ 0x2789BBD4;
  v69 = v63 ^ 0xE6 ^ v252;
  LODWORD(v47) = *(_DWORD *)&v64[4 * (((v69 ^ v61) >> 24) ^ 0x21)];
  HIDWORD(v44) = v47 ^ 1;
  LODWORD(v44) = v47 ^ 0x5C6DAC3C;
  LODWORD(v47) = ((v44 >> 2) - ((2 * (v44 >> 2)) & 0xBEF70586) - 545553725) ^ *(_DWORD *)&v67[4
                                                                                            * ((v69 ^ v61) ^ 0xDE)];
  v250 = v69 ^ v61;
  v253 = v68;
  v249 = *(_DWORD *)&v62[4 * (((unsigned __int16)(v69 ^ v61) >> 8) ^ 0x1E)] ^ *(_DWORD *)&v66[4 * (((v69 ^ v61) >> 16) ^ 0x8F)] ^ v68 ^ ((((unsigned __int16)(v69 ^ v61) >> 8) ^ 0xEB) - ((2 * (((v69 ^ v61) >> 8) ^ 0x4BA6EB)) & 0x15A) - 1367836243) ^ ((_DWORD)v47 - ((2 * (_DWORD)v47) & 0xF1E9C762) + 2029314993);
  v70 = v249 ^ 0x76E748E2 ^ v68 ^ v57;
  v255 = v61;
  LODWORD(v42) = *(_DWORD *)&v64[4 * (((v70 ^ v61) >> 24) ^ 0xA2)];
  HIDWORD(v44) = v42 ^ 1;
  LODWORD(v44) = v42 ^ 0x5C6DAC3C;
  v71 = v70 ^ v61 ^ 0xC84590C6;
  LODWORD(v42) = *(_DWORD *)&v62[4 * (BYTE1(v71) ^ 0xF5)] ^ *(_DWORD *)&v66[4
                                                                          * (((v70 ^ v61) >> 16) ^ 0x6C)] ^ (BYTE1(v71) - ((v71 >> 7) & 0x15A) - 1367836243) ^ ((v44 >> 2) + 2029314993 + (~(2 * (v44 >> 2)) | 0xE16389D) + 1);
  v246 = v249 ^ 0x76E748E2 ^ *(_DWORD *)&v67[4 * ((v70 ^ v61) ^ 0x83)] ^ ((_DWORD)v42
                                                                                         - ((2 * (_DWORD)v42) & 0xBEF70586)
                                                                                         - 545553725);
  v247 = v70 ^ v61;
  v72 = v246 ^ 0x2789BBD4 ^ v70 ^ 0x8EDEEA78;
  v251 = v69;
  v248 = v70;
  HIDWORD(v244) = v70 ^ v69;
  v245 = v246 ^ 0x2789BBD4 ^ v70;
  v73 = v72 ^ v70 ^ v69;
  v74 = v73 ^ v71;
  v75 = *(_DWORD *)&v64[4 * (((v73 ^ v71) >> 24) ^ 0x67)];
  HIDWORD(v44) = v75 ^ 1;
  LODWORD(v44) = v75 ^ 0x5C6DAC3C;
  v76 = (v44 >> 2) ^ *(_DWORD *)&v62[4 * (BYTE1(v74) ^ 0x97)] ^ ((BYTE1(v74) ^ 0x62)
                                                               - ((2 * ((v74 >> 8) ^ 0xD8B62)) & 0x15A)
                                                               - 1367836243);
  v77 = (v76 - ((2 * v76) & 0xBEF70586) - 545553725) ^ *(_DWORD *)&v67[4 * (v74 ^ 0xE1)];
  v78 = v246 ^ 0x2789BBD4 ^ *(_DWORD *)&v66[4 * (((v74 ^ 0x2142BA5) >> 16) ^ 0xB6)] ^ (v77 - ((2 * v77) & 0xF1E9C762) + 2029314993);
  LODWORD(v244) = v73;
  v79 = v78 ^ v72 ^ 0x307C325C;
  LODWORD(v242) = v79 ^ v73 ^ 0x5EF1BA37;
  LODWORD(v47) = *(_DWORD *)&v64[4 * (((v242 ^ v74) >> 24) ^ 0xA4)];
  HIDWORD(v44) = v47 ^ 1;
  LODWORD(v44) = v47 ^ 0x5C6DAC3C;
  LODWORD(v47) = ((v44 >> 2) - ((2 * (v44 >> 2)) & 0xBEF70586) - 545553725) ^ *(_DWORD *)&v67[4
                                                                                            * ((v242 ^ v74) ^ 0x18)];
  v80 = v242 ^ v74 ^ 0xCEE37B5D;
  HIDWORD(v241) = v242 ^ v74;
  HIDWORD(v242) = v78 ^ v72;
  v243 = __PAIR64__(v74, v78);
  v81 = *(_DWORD *)&v66[4 * (((v242 ^ v74) >> 16) ^ 0xCA)] ^ *(_DWORD *)&v62[4 * (BYTE1(v80) ^ 0xF5)] ^ v78 ^ (BYTE1(v80) - ((v80 >> 7) & 0x15A) - 1367836243) ^ 0x241DE93A ^ ((_DWORD)v47 - ((2 * (_DWORD)v47) & 0xF1E9C762) + 2029314993);
  v82 = v79 & 0x241DE93B ^ (v78 ^ v72) & 1;
  v83 = v81 ^ ((v73 ^ 0x5EF1BA37) - ((2 * (v73 ^ 0x5EF1BA37)) & 0x483BD274) + 605940026);
  v84 = *(_DWORD *)&v64[4 * (((v83 ^ v80) >> 24) ^ 0x70)];
  v85 = v79 - 2 * v82;
  HIDWORD(v44) = v84 ^ 1;
  LODWORD(v44) = v84 ^ 0x5C6DAC3C;
  v86 = ((v44 >> 2) - ((2 * (v44 >> 2)) & 0xF1E9C762) + 2029314993) ^ *(_DWORD *)&v66[4
                                                                                    * (((v83 ^ v80 ^ 0xF3443494) >> 16) ^ 0xE4)];
  v87 = (v86 - ((2 * v86) & 0xBEF70586) - 545553725) ^ *(_DWORD *)&v67[4
                                                                     * ((v81 ^ ((v73 ^ 0x37)
                                                                                               - ((2 * (v73 ^ 0x37)) & 0x74)
                                                                                               + 58) ^ v80) ^ 0x91)];
  LODWORD(v240) = v83 ^ v80;
  v88 = v83 ^ v80 ^ 0x1A89BBD4;
  v89 = (v87 - ((2 * v87) & 0x5CF0F35A) - 1367836243) ^ *(_DWORD *)&v62[4 * (BYTE1(v88) ^ 0xF5)];
  v90 = v81 ^ BYTE1(v88) ^ (v89 - ((2 * v89) & 0x483BD274) + 605940026);
  HIDWORD(v240) = v83;
  LODWORD(v241) = v81;
  LODWORD(v239) = v81 ^ (v85 + 605940026);
  HIDWORD(v238) = v90 ^ v239;
  v91 = v90 ^ v239 ^ 0xE6F58988;
  v92 = v91 ^ v83;
  v93 = v91 ^ v83 ^ v88;
  v94 = *(_DWORD *)&v64[4 * (HIBYTE(v93) ^ 0x43)];
  HIDWORD(v44) = v94 ^ 1;
  LODWORD(v44) = v94 ^ 0x5C6DAC3C;
  *(_QWORD *)((char *)&v238 + 4) = __PAIR64__(v91 ^ v83, v93);
  v95 = v93 ^ 0x299B7ABE;
  v96 = *(_DWORD *)&v62[4 * (((unsigned __int16)(v93 ^ 0x7ABE) >> 8) ^ 0xF5)] ^ *(_DWORD *)&v66[4 * (((v93 ^ 0x4D501F31) >> 16) ^ 0xE2)] ^ (((unsigned __int16)(v93 ^ 0x7ABE) >> 8) - (((v93 ^ 0x299B7ABE) >> 7) & 0x15A) - 1367836243) ^ ((v44 >> 2) - ((2 * (v44 >> 2)) & 0xF1E9C762) + 2029314993);
  HIDWORD(v239) = v90;
  v97 = v90 ^ *(_DWORD *)&v67[4 * (v93 ^ 0xFB)] ^ (v96 - ((2 * v96) & 0xBEF70586) - 545553725);
  HIDWORD(v237) = v97 ^ v91;
  v98 = v97 ^ v91 ^ 0x5BF36347;
  LODWORD(v237) = v98 ^ v92;
  LODWORD(v47) = v98 ^ v92 ^ 0x2745D0FF;
  v99 = v47 ^ v95 ^ 0x516EF336;
  v100 = v47 ^ v95 ^ 0x3DCC6B2B;
  v101 = (((unsigned __int16)((unsigned __int16)v47 ^ v95 ^ 0x6B2B) >> 8)
        - ((v100 >> 7) & 0x15A)
        - 1367836243) ^ *(_DWORD *)&v62[4
                                      * (((unsigned __int16)((unsigned __int16)v47 ^ v95 ^ 0x6B2B) >> 8) ^ 0xF5)];
  v102 = (v101 - ((2 * v101) & 0xBEF70586) - 545553725) ^ *(_DWORD *)&v67[4
                                                                        * ((~(v98 ^ v92) ^ v95) ^ 0x6E)];
  HIDWORD(v236) = v47 ^ v95;
  v103 = *(_DWORD *)&v64[4 * (((v47 ^ v95) >> 24) ^ 0x57)];
  HIDWORD(v44) = v103 ^ 1;
  LODWORD(v44) = v103 ^ 0x5C6DAC3C;
  LODWORD(v238) = v97;
  LODWORD(v236) = (v44 >> 2) ^ *(_DWORD *)&v66[4 * (BYTE2(v99) ^ 0x8B)] ^ v97 ^ (v102
                                                                               - ((2 * v102) & 0xF1E9C762)
                                                                               + 2029314993);
  v104 = v236 ^ 0x930000ED ^ v98;
  LODWORD(v235) = v104 ^ 0x8D06EA22 ^ v47;
  v105 = v235 ^ v100;
  v106 = v235 ^ v100 ^ 0x9289BB39;
  v107 = (v235 ^ v100) ^ 4;
  v108 = *(_DWORD *)&v64[4 * (((v235 ^ v100) >> 24) ^ 0x39)];
  HIDWORD(v44) = v108 ^ 1;
  LODWORD(v44) = v108 ^ 0x5C6DAC3C;
  LODWORD(v61) = v105 ^ 0x53DEAA41;
  v109 = *(_DWORD *)&v67[4 * v107] ^ *(_DWORD *)&v62[4
                                                   * (((unsigned __int16)(v105 ^ 0xAA41) >> 8) ^ 0xF5)] ^ 0x7103FB6E ^ (v44 >> 2);
  v110 = *(_DWORD *)&v66[4 * (BYTE2(v106) ^ 0x7E)] ^ v236 ^ 0x930000ED ^ ((unsigned __int16)(v105 ^ 0xAA41) >> 8) ^ 0x26469CC0 ^ (v109 - ((2 * v109) & 0xF1E9C762) + 2029314993);
  HIDWORD(v235) = v104;
  v111 = (v104 ^ 0x8D06EA22) - 2 * ((v104 ^ 0x8D06EA22) & 0x26469CD5 ^ v104 & 0x15);
  LODWORD(v47) = v110 ^ ((_DWORD)v47 - ((2 * (_DWORD)v47) & 0x4C8D3980) + 642161856);
  LODWORD(v64) = *(_DWORD *)&v64[4 * (((v47 ^ v105 ^ 0x53DEAA41) >> 24) ^ 0x44)];
  HIDWORD(v44) = v64 ^ 1;
  LODWORD(v44) = v64 ^ 0x5C6DAC3C;
  LODWORD(v45) = *(_DWORD *)&v62[4 * (((unsigned __int16)((unsigned __int16)v47 ^ v61) >> 8) ^ 0xFD)] ^ *(_DWORD *)&v67[4 * ((v47 ^ v61) ^ 0xC4)] ^ ((((unsigned __int16)((unsigned __int16)v47 ^ v61) >> 8) ^ 8) - 1367836243 + (~(2 * (((v47 ^ v61) >> 8) ^ 0x2E3F08)) | 0xFFFFFEA5) + 1) ^ ((v44 >> 2) - ((2 * (v44 >> 2)) & 0xBEF70586) - 545553725);
  HIDWORD(v233) = v47 ^ v105 ^ 0x53DEAA41 ^ 0x94E22525;
  LODWORD(v45) = (v45 - ((2 * v45) & 0xF1E9C762) + 2029314993) ^ *(_DWORD *)&v66[4
                                                                               * (((v47 ^ v105 ^ 0x53DEAA41) >> 16) ^ 0x16)];
  LODWORD(v62) = v45 - ((2 * v45) & 0x4C8D3980);
  v112 = (char *)*(&off_24C363D30 + (v37 ^ 0x3E3u)) - 8;
  v113 = (uint64_t)*(&off_24C363D30 + (v37 ^ 0x3FCu));
  v114 = *(unsigned __int8 *)(v113 + (*(unsigned __int8 *)(v41 - 109) ^ 0xA5));
  HIDWORD(v44) = v114 ^ 7;
  LODWORD(v44) = (v114 ^ 0x40) << 24;
  v115 = (char *)*(&off_24C363D30 + v37 - 784) - 12;
  v116 = (uint64_t)*(&off_24C363D30 + (v37 ^ 0x345u));
  v231 = v113;
  LODWORD(v45) = (*(unsigned __int8 *)(v113 + (*(unsigned __int8 *)(v41 - 97) ^ 0x7BLL)) ^ 0x38) & 0xFFFF00FF | ((((*(_BYTE *)(v41 - 98) ^ 0xD0) + v112[*(unsigned __int8 *)(v41 - 98) ^ 0xDFLL] + 106) ^ 0xE4) << 8) | ((v115[*(unsigned __int8 *)(v41 - 99) ^ 0xAALL] ^ 0xD5) << 16);
  v232 = v112;
  v117 = (*(unsigned __int8 *)(v113 + (*(unsigned __int8 *)(v41 - 105) ^ 0x28)) ^ 0x4D) & 0xFFFF00FF | ((((*(_BYTE *)(v41 - 106) ^ 0xAC) + v112[*(unsigned __int8 *)(v41 - 106) ^ 0xA3] + 106) ^ 0xF6) << 8) | ((*(unsigned __int8 *)(v116 + (*(unsigned __int8 *)(v41 - 108) ^ 0xB2)) ^ 0xF6) << 24);
  v230 = v116;
  LODWORD(v67) = (((((v44 >> 30) ^ 0xDB) >> 2) | (((v44 >> 30) ^ 0xDB) << 6)) | ((v115[*(unsigned __int8 *)(v41 - 111) ^ 0x7ALL] ^ 0xB6) << 16) | ((*(unsigned __int8 *)(v116 + (*(unsigned __int8 *)(v41 - 112) ^ 0x78)) ^ 0xF4) << 24) | (((v112[*(unsigned __int8 *)(v41 - 110) ^ 0x5DLL] + (*(_BYTE *)(v41 - 110) ^ 0x52) + 106) ^ 0x5D) << 8)) ^ 0x70B159E2;
  LODWORD(v112) = ((*(unsigned __int8 *)(v113 + (*(unsigned __int8 *)(v41 - 101) ^ 0x60)) ^ 0x8C) & 0xFFFF00FF | ((v115[*(unsigned __int8 *)(v41 - 103) ^ 5] ^ 0xE7) << 16) | (((v112[*(unsigned __int8 *)(v41 - 102) ^ 4] + (*(_BYTE *)(v41 - 102) ^ 0xB) + 106) ^ 0x33) << 8) | ((*(unsigned __int8 *)(v116 + (*(unsigned __int8 *)(v41 - 104) ^ 0x1CLL)) ^ 1) << 24)) ^ 0x4E079906;
  v118 = (v117 | ((v115[*(unsigned __int8 *)(v41 - 107) ^ 0x27] ^ 0x83) << 16)) ^ 0xC2F4FA2E;
  v119 = (v45 | ((*(unsigned __int8 *)(v116 + (*(unsigned __int8 *)(v41 - 100) ^ 0x45)) ^ 0xCE) << 24)) ^ 0xE7AA490E;
  HIDWORD(v229) = *(_DWORD *)(v41 - 120) - 1899472307;
  HIDWORD(v228) = (v37 + 967) ^ 0x779;
  LODWORD(v228) = (v37 + 967) ^ 0x7FD;
  LODWORD(v227) = v110 ^ (v111 + 642161856);
  HIDWORD(v227) = (v37 + 967) ^ 0x7CF;
  HIDWORD(v226) = (v37 + 967) ^ 0x78E;
  LODWORD(v226) = (v37 + 967) ^ 0x73B;
  v234 = __PAIR64__(v105, v110);
  HIDWORD(v225) = ((_DWORD)v62 + 642161856) ^ v110;
  LODWORD(v225) = (v37 + 967) ^ 0x732;
  *(_DWORD *)(v41 - 120) = v37 + 967;
  HIDWORD(a6) = (v37 + 967) ^ 0x751;
  LODWORD(v233) = v47 ^ 0x626A2240;
  LODWORD(v229) = (v111 + 642161856) ^ 0x3DC8BA5D ^ ((_DWORD)v62 + 642161856);
  HIDWORD(a4) = v229 ^ v47 ^ 0x626A2240;
  v120 = *(_DWORD *)(v41 - 120);
  *(_QWORD *)(v41 - 200) = 7;
  v121 = a1[7];
  *(_QWORD *)(v41 - 168) = 12;
  v122 = *(unsigned __int8 *)(v113 + (v121 ^ 0x41));
  LOBYTE(v121) = a1[12] ^ (((v120 - 8) | 0x24) - 6);
  *(_QWORD *)(v41 - 160) = 8;
  LODWORD(v121) = *(unsigned __int8 *)(v116 + v121);
  v123 = a1[8];
  *(_QWORD *)(v41 - 128) = 1;
  LODWORD(v62) = v121 ^ 0x75;
  LODWORD(v116) = *(unsigned __int8 *)(v116 + (v123 ^ 0xC1)) ^ 0xFFFFFFC1;
  LODWORD(v121) = v115[a1[1] ^ 0x66] ^ 0x5A;
  *(_QWORD *)(v41 - 136) = 15;
  v124 = (_DWORD)v121 << 16;
  v125 = a1[15] ^ 0xE9;
  *(_QWORD *)(v41 - 152) = 11;
  LODWORD(v125) = *(unsigned __int8 *)(v113 + v125) ^ 0x9A;
  LODWORD(v123) = v125 | ((_DWORD)v62 << 24);
  LODWORD(v62) = *(unsigned __int8 *)(v113 + (a1[11] ^ 0xC3));
  *(_QWORD *)(v41 - 176) = 0;
  v126 = v124 | ((*(unsigned __int8 *)(v230 + (*a1 ^ 0x30)) ^ 0x45) << 24);
  *(_QWORD *)(v41 - 144) = 2;
  LOBYTE(v124) = (v232[a1[2] ^ 0xC0] + (a1[2] ^ 0xCF) + 106) ^ 0xF9;
  *(_QWORD *)(v41 - 216) = 4;
  v127 = v126 & 0xFFFF00FF | (v124 << 8);
  v128 = v122 ^ 0x4A | ((*(unsigned __int8 *)(v230 + (a1[4] ^ 0xFCLL)) ^ 0xFFFFFFFB) << 24);
  *(_QWORD *)(v41 - 208) = 5;
  v129 = v128 | ((v115[a1[5] ^ 0xA9] ^ 0x67) << 16);
  *(_QWORD *)(v41 - 224) = 9;
  v130 = v62 ^ 0x50 | ((_DWORD)v116 << 24) | ((v115[a1[9] ^ 0x5DLL] ^ 0x89) << 16);
  *(_QWORD *)(v41 - 192) = 10;
  v131 = v130 & 0xFFFF00FF | (((v232[a1[10] ^ 0xD5] + (a1[10] ^ 0xDA) + 106) ^ 0xCF) << 8);
  *(_QWORD *)(v41 - 184) = 14;
  LODWORD(v62) = (v232[a1[14] ^ 0xE4] + (a1[14] ^ 0xEB) - 22) << 8;
  *(_QWORD *)(v41 - 232) = 3;
  LODWORD(v116) = *(unsigned __int8 *)(v113 + (a1[3] ^ 0xDCLL)) ^ 0x8E;
  *(_QWORD *)(v41 - 240) = 13;
  LODWORD(v123) = v62 | ((v115[a1[13] ^ 0x92] ^ 0xB4) << 16) | v123;
  *(_QWORD *)(v41 - 248) = 6;
  v132 = v129 & 0xFFFF00FF | (((v232[a1[6] ^ 0x4FLL] + (a1[6] ^ 0x40) + 106) ^ 0xB7) << 8);
  LODWORD(v66) = v67 ^ v256 ^ ((v116 | v127) - 2 * ((v116 | v127) & 0x4908E0DF ^ v116 & 4) - 922165029);
  LODWORD(v45) = v118 ^ v257 ^ (v132 - ((2 * v132) & 0xF69A872E) + 2068661143);
  v133 = v119 ^ v255 ^ (v123 + 1578365111 - 2 * (v123 & 0x5E13F0BF ^ v125 & 8));
  LODWORD(v125) = v112 ^ v254 ^ (v131 - ((2 * v131) & 0xEF7C417E) - 138534721);
  v134 = (char *)*(&off_24C363D30 + SHIDWORD(v227)) - 8;
  HIDWORD(v44) = *(_DWORD *)&v134[4 * (BYTE3(v125) ^ 0x3F)];
  LODWORD(v44) = HIDWORD(v44) ^ 0xEC0C7F2A;
  v135 = (uint64_t)*(&off_24C363D30 + SHIDWORD(v228));
  v136 = (v44 >> 1) ^ *(_DWORD *)(v135 + 4 * (BYTE2(v133) ^ 0x34u)) ^ ((BYTE2(v133) ^ 0x68)
                                                                       + 1737260655
                                                                       - 2
                                                                       * ((BYTE2(v133) ^ 0x68) & 0x7F ^ HIWORD(v133) & 0x10));
  v137 = (uint64_t)*(&off_24C363D30 + (int)v228);
  LODWORD(v123) = *(_DWORD *)(v137 + 4 * (v125 ^ 0xC6u)) ^ ((v125 ^ 0xAB)
                                                                             - 1334599831
                                                                             - ((2 * (v125 ^ 0xAB)
                                                                               + 842892542) & 0x222981D4)) ^ ((BYTE2(v66) ^ 0xD5) + 1737260655 - ((2 * ((v66 >> 16) ^ 0x6CD5)) & 0xDE)) ^ *(_DWORD *)(v135 + 4 * (BYTE2(v66) ^ 0x89u));
  LODWORD(v62) = *(_DWORD *)(v135 + 4 * (BYTE2(v45) ^ 0x8Cu)) ^ *(_DWORD *)(v137
                                                                            + 4 * (v133 ^ 0xB6u)) ^ ((BYTE2(v45) ^ 0xD0) + 1737260655 - ((2 * (WORD1(v45) ^ 0xC8D0)) & 0xDE)) ^ ((v133 ^ 0xDB) - 1334599830 + ((2 * (v133 ^ 0xDB) + 254) & 0x1D4 ^ 0xDDD67FFF));
  HIDWORD(v44) = *(_DWORD *)&v134[4 * (BYTE3(v45) ^ 0xC8)];
  LODWORD(v44) = HIDWORD(v44) ^ 0xEC0C7F2A;
  LODWORD(v116) = (_DWORD)v62 - 928800576 - ((2 * (_DWORD)v62) & 0x91474180);
  v138 = v136 - 928800576 - ((2 * v136) & 0x91474180);
  v139 = ((BYTE2(v125) ^ 0xAD) + 1737260655 - 2 * ((BYTE2(v125) ^ 0xAD) & 0x7F ^ WORD1(v125) & 0x10)) ^ *(_DWORD *)(v137 + 4 * (v66 ^ 0x1Cu)) ^ ((v66 ^ 0x71) - 1334599830 + ((2 * (v66 ^ 0x71) + 254) & 0x1D4 ^ 0xDDD67FFF)) ^ (v44 >> 1) ^ *(_DWORD *)(v135 + 4 * (BYTE2(v125) ^ 0xF1u));
  HIDWORD(v44) = *(_DWORD *)&v134[4 * ((v66 >> 24) ^ 0x6C)];
  LODWORD(v44) = HIDWORD(v44) ^ 0xEC0C7F2A;
  LODWORD(v62) = v44 >> 1;
  v140 = v139 - 928800576 - ((2 * v139) & 0x91474180);
  HIDWORD(v44) = *(_DWORD *)&v134[4 * (HIBYTE(v133) ^ 0xB7)];
  LODWORD(v44) = HIDWORD(v44) ^ 0xEC0C7F2A;
  v141 = (char *)*(&off_24C363D30 + v120 - 1711) - 8;
  LODWORD(v66) = *(_DWORD *)&v141[4 * (BYTE1(v66) ^ 0xDE)] ^ v251 ^ ((v45 ^ 0x10)
                                                                   - 1334599830
                                                                   + ((2 * (v45 ^ 0x10) + 254) & 0x1D4 ^ 0xDDD67FFF)) ^ *(_DWORD *)(v137 + 4 * (v45 ^ 0x7Du));
  LODWORD(v45) = (v123 - 928800576 - ((2 * v123) & 0x91474180)) ^ *(_DWORD *)&v141[4 * (BYTE1(v45) ^ 0x2F)] ^ (v44 >> 1);
  v142 = v45 - ((2 * v45) & 0x9696D698);
  v143 = v66 ^ v138;
  LODWORD(v125) = *(_DWORD *)&v141[4 * (BYTE1(v125) ^ 0x29)] ^ v253 ^ v62 ^ v116;
  LODWORD(v45) = *(_DWORD *)&v141[4 * (BYTE1(v133) ^ 0x66)] ^ v252 ^ v140;
  HIDWORD(v44) = *(_DWORD *)&v134[4 * ((v66 ^ ~v138) >> 24)];
  LODWORD(v44) = HIDWORD(v44) ^ 0xEC0C7F2A;
  LODWORD(v66) = v44 >> 1;
  LODWORD(v62) = (v141[4 * (BYTE1(v133) ^ 0x66)] ^ v252 ^ v140);
  HIDWORD(v44) = *(_DWORD *)&v134[4 * (BYTE3(v125) ^ 0x91)];
  LODWORD(v44) = HIDWORD(v44) ^ 0xEC0C7F2A;
  v144 = v44 >> 1;
  HIDWORD(v44) = *(_DWORD *)&v134[4 * (BYTE3(v45) ^ 0xA3)];
  LODWORD(v44) = HIDWORD(v44) ^ 0xEC0C7F2A;
  v145 = v144 ^ *(_DWORD *)(v135 + 4 * (BYTE2(v45) ^ 0xF0u)) ^ ((BYTE2(v45) ^ 0xAC)
                                                                + 1737260655
                                                                - ((2 * (WORD1(v45) ^ 0xA3AC)) & 0xDE));
  *(_DWORD *)(v41 - 252) = -1334599831;
  LODWORD(v116) = *(_DWORD *)(v137 + 4 * (v125 ^ 0x7Bu)) ^ *(_DWORD *)(v135
                                                                                        + 4 * (BYTE2(v143) ^ 0x15u)) ^ (v44 >> 1) ^ ((BYTE2(v143) ^ 0x49) + 1737260655 - 2 * ((BYTE2(v143) ^ 0x49) & 0x7F ^ HIWORD(v143) & 0x10)) ^ ((v125 ^ 0x16) - 1334599831 - ((2 * (v125 ^ 0x16) + 842892542) & 0x222981D4));
  LODWORD(v123) = (v142 - 884249780) ^ v250;
  v146 = (v145 - 928800576 - ((2 * v145) & 0x91474180)) ^ *(_DWORD *)&v141[4 * (BYTE1(v143) ^ 0x2C)];
  v147 = v66 ^ *(_DWORD *)(v137 + 4 * (v62 ^ 3)) ^ ((v62 ^ 0x6E)
                                                                                - 1334599831
                                                                                - ((2 * (v62 ^ 0x6E)
                                                                                  + 842892542) & 0x222981D4)) ^ ((BYTE2(v123) ^ 0x72) + 1737260655 - ((2 * (WORD1(v123) ^ 0xA572)) & 0xDE)) ^ *(_DWORD *)(v135 + 4 * (BYTE2(v123) ^ 0x2Eu));
  LODWORD(v62) = *(_DWORD *)(v135 + 4 * (BYTE2(v125) ^ 0x2Eu)) ^ ((BYTE2(v125) ^ 0x72)
                                                                  + 1737260655
                                                                  - ((2 * (WORD1(v125) ^ 0x9172)) & 0xDE));
  HIDWORD(v44) = *(_DWORD *)&v134[4 * (BYTE3(v123) ^ 0xA5)];
  LODWORD(v44) = HIDWORD(v44) ^ 0xEC0C7F2A;
  LODWORD(v45) = ((v143 ^ 0xFC)
                - 1334599831
                - ((2 * (v143 ^ 0xFC) + 842892542) & 0x222981D4)) ^ *(_DWORD *)&v141[4 * (BYTE1(v45) ^ 0xBD)] ^ *(_DWORD *)(v137 + 4 * (v143 ^ 0x91u)) ^ ((_DWORD)v62 - 928800576 - ((2 * (_DWORD)v62) & 0x91474180));
  LODWORD(v62) = *(_DWORD *)&v141[4 * (BYTE1(v125) ^ 0x57)];
  LODWORD(v123) = v45 ^ (v44 >> 1);
  LODWORD(v125) = ((((v142 + 76) ^ v250) ^ 1) - 1726037377) ^ v249 ^ *(_DWORD *)(v137
                                                                                                + 4
                                                                                                * (((v142 + 76) ^ v250) ^ 0x6Cu)) ^ (v146 + 391437546 - ((2 * v146) & 0x2EA9B9D4));
  LODWORD(v45) = v62 ^ HIDWORD(v244) ^ (v147 - 928800576 - ((2 * v147) & 0x91474180));
  LODWORD(v66) = (v123 - ((2 * v123) & 0xF7B5747C) - 69551554) ^ v247;
  v148 = *(_DWORD *)&v141[4 * (((unsigned __int16)((v142 + 27468) ^ v250) >> 8) ^ 0xF0)] ^ v248 ^ (v116 - 928800576 - ((2 * v116) & 0x91474180));
  HIDWORD(v44) = *(_DWORD *)&v134[4 * ((v66 >> 24) ^ 0x16)];
  LODWORD(v44) = HIDWORD(v44) ^ 0xEC0C7F2A;
  LODWORD(v123) = ((v148 ^ 0xA1)
                 - 1334599830
                 + ((2 * (v148 ^ 0xA1) + 254) & 0x1D4 ^ 0xDDD67FFF)) ^ *(_DWORD *)(v137
                                                                                                  + 4 * (v148 ^ 0xCCu));
  v149 = *(_DWORD *)(v135 + 4 * (BYTE2(v125) ^ 0xDBu)) ^ ((BYTE2(v125) ^ 0x87)
                                                          + 1737260655
                                                          - ((2 * (WORD1(v125) ^ 0x3A87)) & 0xDE)) ^ (v44 >> 1);
  LODWORD(v62) = (v123 - 928800576 - ((2 * v123) & 0x91474180)) ^ *(_DWORD *)&v141[4
                                                                                 * (((unsigned __int16)(((((v142 + 76) ^ v250) ^ 1) - 15745) ^ v249 ^ *(_WORD *)(v137 + 4 * (((v142 + 76) ^ v250) ^ 0x6Cu)) ^ (v146 - 8982 - ((2 * v146) & 0xB9D4))) >> 8) ^ 0xDE)];
  LODWORD(v123) = ((v125 ^ 0x9E)
                 - 1334599830
                 + ((2 * (v125 ^ 0x9E) + 254) & 0x1D4 ^ 0xDDD67FFF)) ^ *(_DWORD *)(v137
                                                                                                  + 4 * (v125 ^ 0xF3u));
  HIDWORD(v44) = *(_DWORD *)&v134[4 * (BYTE3(v45) ^ 0x37)];
  LODWORD(v44) = HIDWORD(v44) ^ 0xEC0C7F2A;
  LODWORD(v116) = v44 >> 1;
  v150 = (v149 - 928800576 - ((2 * v149) & 0x91474180)) ^ *(_DWORD *)&v141[4 * (BYTE1(v148) ^ 0x57)];
  HIDWORD(v44) = *(_DWORD *)&v134[4 * (BYTE3(v125) ^ 0x3A)];
  LODWORD(v44) = HIDWORD(v44) ^ 0xEC0C7F2A;
  v151 = ((v45 ^ 0x740CBC3A) >> 16);
  v152 = v151 + 1737260655 - (((v45 ^ 0x740CBC3A) >> 15) & 0xDE);
  LODWORD(v125) = BYTE2(v148) ^ *(_DWORD *)(v135 + 4 * (BYTE2(v148) ^ 0xF6u)) ^ *(_DWORD *)&v141[4
                                                                                                 * ((unsigned __int16)(v45 ^ 0xBC3A) >> 8)] ^ 0xAF2FDE05 ^ (v44 >> 1);
  LODWORD(v125) = ((v66 ^ 0x2E) - 1726037377) ^ v246 ^ *(_DWORD *)(v137
                                                                                  + 4 * (v66 ^ 0x43u)) ^ (v125 + 391437546 - ((2 * v125) & 0x2EA9B9D4));
  LODWORD(v45) = ((v45 ^ 0x3A) - 1726037377) ^ HIDWORD(v243) ^ *(_DWORD *)(v137
                                                                                          + 4
                                                                                          * (v45 ^ 0x57u)) ^ (v150 + 391437546 - ((2 * v150) & 0x2EA9B9D4));
  HIDWORD(v44) = *(_DWORD *)&v134[4 * (HIBYTE(v148) ^ 0x7C)];
  LODWORD(v44) = HIDWORD(v44) ^ 0xEC0C7F2A;
  LODWORD(v62) = *(_DWORD *)(v135 + 4 * (BYTE2(v66) ^ 0x5Cu)) ^ v244 ^ BYTE2(v66) ^ v116 ^ ((_DWORD)v62
                                                                                            + 1737260655
                                                                                            - ((2 * (_DWORD)v62) & 0xCF18FCDE));
  LODWORD(v116) = *(_DWORD *)&v141[4 * (BYTE1(v66) ^ 0x5A)] ^ v245 ^ v152 ^ *(_DWORD *)(v135 + 4 * (v151 ^ 0x5Cu)) ^ (v44 >> 1) ^ (v123 - 928800576 - ((2 * v123) & 0x91474180));
  v153 = ((v62 ^ 0xC3)
        - 1334599830
        + ((2 * (v62 ^ 0xFA64A5C3) + 254) & 0x1D4 ^ 0xDDD67FFF)) ^ *(_DWORD *)(v137
                                                                                           + 4
                                                                                           * (v62 ^ 0xAEu));
  HIDWORD(v44) = *(_DWORD *)&v134[4 * (BYTE3(v125) ^ 0x5B)];
  LODWORD(v44) = HIDWORD(v44) ^ 0xEC0C7F2A;
  v154 = v153 - 928800576 - ((2 * v153) & 0x91474180);
  v155 = (v44 >> 1) ^ *(_DWORD *)(v137 + 4 * (v45 ^ 0x1Fu)) ^ ((v45 ^ 0x72)
                                                                                - 1334599830
                                                                                + ((2 * (v45 ^ 0x72)
                                                                                  + 254) & 0x1D4 ^ 0xDDD67FFF));
  HIDWORD(v44) = *(_DWORD *)&v134[4 * (BYTE3(v45) ^ 0x28)];
  LODWORD(v44) = HIDWORD(v44) ^ 0xEC0C7F2A;
  v156 = v44 >> 1;
  LODWORD(v123) = v155 - 928800576 - ((2 * v155) & 0x91474180);
  HIDWORD(v44) = *(_DWORD *)&v134[4 * ((v62 >> 24) ^ 0xB9)];
  LODWORD(v44) = HIDWORD(v44) ^ 0xEC0C7F2A;
  v157 = v44 >> 1;
  HIDWORD(v44) = *(_DWORD *)&v134[4 * (BYTE3(v116) ^ 0xB4)];
  LODWORD(v44) = HIDWORD(v44) ^ 0xEC0C7F2A;
  v158 = v157 ^ *(_DWORD *)(v137 + 4 * (v116 ^ 0x8Bu)) ^ ((v116 ^ 0xE6)
                                                                           - 1334599830
                                                                           + ((2 * (v116 ^ 0xE6) + 254) & 0x1D4 ^ 0xDDD67FFF));
  v159 = BYTE2(v125) ^ 0x95;
  v160 = v159 + 1737260655 - ((2 * (WORD1(v125) ^ 0x5B95)) & 0xDE);
  v161 = v125;
  v162 = (v125 ^ 0xF4) - 1334599830 + ((2 * (v125 ^ 0xF4) + 254) & 0x1D4 ^ 0xDDD67FFF);
  LODWORD(v66) = ((BYTE2(v45) ^ 0x14) + 1737260655 - ((2 * (WORD1(v45) ^ 0x2814)) & 0xDE)) ^ v242 ^ *(_DWORD *)&v141[4 * (BYTE1(v125) ^ 0x1F)] ^ (v158 - 928800576 - ((2 * v158) & 0x91474180)) ^ *(_DWORD *)(v135 + 4 * (BYTE2(v45) ^ 0x48u));
  LODWORD(v125) = *(_DWORD *)&v141[4 * ((unsigned __int16)((unsigned __int16)v62 ^ 0xA5C3) >> 8)] ^ v78 ^ ((BYTE2(v116) ^ 0x59) + 1737260655 - ((2 * (WORD1(v116) ^ 0xB459)) & 0xDE)) ^ *(_DWORD *)(v135 + 4 * (BYTE2(v116) ^ 5u)) ^ v123;
  v163 = (((v62 ^ 0xFA64A5C3) >> 16)
        + 1737260655
        - (((v62 ^ 0xFA64A5C3) >> 15) & 0xDE)) ^ HIDWORD(v242) ^ *(_DWORD *)(v137 + 4 * (v161 ^ 0x99u)) ^ v162 ^ ((v44 >> 1) - 928800576 - ((2 * (v44 >> 1)) & 0x91474180)) ^ *(_DWORD *)(v135 + 4 * (((v62 ^ 0xFA64A5C3) >> 16) ^ 0x5Cu)) ^ *(_DWORD *)&v141[4 * (BYTE1(v45) ^ 0x12)];
  LODWORD(v45) = *(_DWORD *)&v141[4 * (BYTE1(v116) ^ 0x34)] ^ HIDWORD(v241) ^ v160 ^ *(_DWORD *)(v135
                                                                                               + 4 * (v159 ^ 0x5Cu)) ^ v154 ^ v156;
  HIDWORD(v44) = *(_DWORD *)&v134[4 * (BYTE3(v45) ^ 0xEB)];
  LODWORD(v44) = HIDWORD(v44) ^ 0xEC0C7F2A;
  v164 = (v44 >> 1) - 928800576 - ((2 * (v44 >> 1)) & 0x91474180);
  v165 = ((BYTE2(v163) ^ 0x81) + 1737260655 - 2 * ((BYTE2(v163) ^ 0x81) & 0x7F ^ HIWORD(v163) & 0x10)) ^ *(_DWORD *)(v135 + 4 * (BYTE2(v163) ^ 0xDDu));
  LODWORD(v62) = ((v163 ^ 0x51)
                - 1334599830
                + ((2 * (v163 ^ 0x51) + 254) & 0x1D4 ^ 0xDDD67FFF)) ^ *(_DWORD *)(v137
                                                                                                 + 4
                                                                                                 * (v163 ^ 0x3Cu));
  LODWORD(v113) = *(_DWORD *)(v135 + 4 * (BYTE2(v66) ^ 0xDBu)) ^ ((BYTE2(v66) ^ 0x87)
                                                                  + 1737260655
                                                                  - 2
                                                                  * ((BYTE2(v66) ^ 0x87) & 0x7F ^ (v66 >> 16) & 0x10));
  HIDWORD(v44) = *(_DWORD *)&v134[4 * (HIBYTE(v163) ^ 0x14)];
  LODWORD(v44) = HIDWORD(v44) ^ 0xEC0C7F2A;
  v166 = v44 >> 1;
  v167 = *(_DWORD *)(v135 + 4 * (((v45 ^ 0xA87CE98B) >> 16) ^ 0x5Cu)) ^ ((v45 ^ 0xA87CE98B) >> 16) ^ ((_DWORD)v62 + 1737260655 - ((2 * (_DWORD)v62) & 0xCF18FCDE));
  HIDWORD(v44) = *(_DWORD *)&v134[4 * (BYTE3(v125) ^ 0x9A)];
  LODWORD(v44) = HIDWORD(v44) ^ 0xEC0C7F2A;
  v168 = ((v45 ^ 0x8B) - 1334599830 + ((2 * (v45 ^ 0xA87CE98B) + 254) & 0x1D4 ^ 0xDDD67FFF)) ^ *(_DWORD *)&v141[4 * (BYTE1(v66) ^ 0xDE)] ^ *(_DWORD *)(v137 + 4 * (v45 ^ 0xE6u)) ^ (v165 - 928800576 - ((2 * v165) & 0x91474180)) ^ (v44 >> 1);
  HIDWORD(v44) = *(_DWORD *)&v134[4 * ((v66 >> 24) ^ 0x77)];
  LODWORD(v44) = HIDWORD(v44) ^ 0xEC0C7F2A;
  LODWORD(v116) = *(_DWORD *)&v141[4 * (BYTE1(v45) ^ 0xB)];
  LODWORD(v45) = *(_DWORD *)&v141[4 * (BYTE1(v163) ^ 0x34)] ^ v240 ^ ((BYTE2(v125) ^ 0xE9)
                                                                    + 1737260655
                                                                    - ((2 * (WORD1(v125) ^ 0x9AE9)) & 0xDE)) ^ *(_DWORD *)(v135 + 4 * (BYTE2(v125) ^ 0xB5u)) ^ ((v66 ^ 0x9E) - 1334599830 + ((2 * (v66 ^ 0x9E) + 254) & 0x1D4 ^ 0xDDD67FFF)) ^ v164 ^ *(_DWORD *)(v137 + 4 * (v66 ^ 0xF3u));
  LODWORD(v123) = v116 ^ v239 ^ ((v125 ^ 0xA8)
                               - 1334599830
                               + ((2 * (v125 ^ 0xA8) + 254) & 0x1D4 ^ 0xDDD67FFF)) ^ *(_DWORD *)(v137 + 4 * (v125 ^ 0xC5u)) ^ v166 ^ (v113 - 928800576 - ((2 * v113) & 0x91474180));
  LODWORD(v125) = *(_DWORD *)&v141[4 * (BYTE1(v125) ^ 0x2D)] ^ HIDWORD(v240) ^ (v44 >> 1) ^ (v167
                                                                                           - 928800576
                                                                                           - ((2 * v167) & 0x91474180));
  BYTE1(v164) = BYTE1(v123) ^ 0x65;
  v169 = ((v123 ^ 0x2E0E654A) >> 16);
  HIDWORD(v44) = *(_DWORD *)&v134[4 * (BYTE3(v123) ^ 0x6D)];
  LODWORD(v44) = HIDWORD(v44) ^ 0xEC0C7F2A;
  LODWORD(v62) = v44 >> 1;
  LODWORD(v113) = *(_DWORD *)(v135 + 4 * (v169 ^ 0x5Cu));
  LODWORD(v66) = (v168 + 605940026 - ((2 * v168) & 0x483BD274)) ^ v241;
  v170 = v169 + 1737260655;
  v171 = *(_DWORD *)&v134[4 * ((v66 >> 24) ^ 0xFD)];
  v172 = v113 ^ (v171 << 31) ^ (v171 >> 1) ^ (v170 - (((v123 ^ 0x2E0E654A) >> 15) & 0xDE)) ^ 0x76063F95;
  v173 = ((v123 ^ 0x4A) - 1334599830 + ((2 * (v123 ^ 0x2E0E654A) + 254) & 0x1D4 ^ 0xDDD67FFF)) ^ *(_DWORD *)(v137 + 4 * (v123 ^ 0x27u));
  v174 = v172 - 928800576 - ((2 * v172) & 0x91474180);
  HIDWORD(v44) = *(_DWORD *)&v134[4 * (BYTE3(v125) ^ 0xAE)];
  LODWORD(v44) = HIDWORD(v44) ^ 0xEC0C7F2A;
  v175 = (v44 >> 1) ^ *(_DWORD *)&v141[4 * (BYTE1(v66) ^ 0xA4)] ^ (v173 - 928800576 - ((2 * v173) & 0x91474180));
  LODWORD(v123) = v175 + 1737260655 - ((2 * v175) & 0xCF18FCDE);
  v176 = *(_DWORD *)(v41 - 252);
  v177 = *(_DWORD *)(v135 + 4 * (BYTE2(v125) ^ 0x3Au)) ^ v62 ^ *(_DWORD *)(v137
                                                                                         + 4
                                                                                         * (v66 ^ 0x4Du)) ^ ((v66 ^ 0x20) + v176 - ((2 * (v66 ^ 0x20) + 842892542) & 0x222981D4)) ^ ((BYTE2(v125) ^ 0x66) + 1737260655 - 2 * ((BYTE2(v125) ^ 0x66) & 0x7F ^ WORD1(v125) & 0x10));
  v178 = ((v125 ^ 0xB3) + 1640129344 + ((2 * (v125 ^ 0xB3) + 254) & 0x180 ^ 0xEFFAFFFF)) ^ *(_DWORD *)&v141[4 * BYTE1(v164)];
  v179 = (v178 + 391437546 - ((2 * v178) & 0x2EA9B9D4)) ^ *(_DWORD *)(v137 + 4 * (v125 ^ 0xDEu));
  LODWORD(v66) = *(_DWORD *)(v135 + 4 * (BYTE2(v66) ^ 0x40u)) ^ ((BYTE2(v66) ^ 0x1C)
                                                                 + 1737260655
                                                                 - ((2 * ((v66 >> 16) ^ 0xFD1C)) & 0xDE));
  HIDWORD(v44) = *(_DWORD *)&v134[4 * ((v45 ^ 0x3F162902) >> 24)];
  LODWORD(v44) = HIDWORD(v44) ^ 0xEC0C7F2A;
  v180 = (v66 ^ 0xD9E215AF ^ -(v66 ^ 0xD9E215AF) ^ ((v66 ^ v179 ^ 0x431D28D3)
                                                                              + (v179 ^ 0x6500C283)
                                                                              + 1))
       + (v179 ^ 0x6500C283);
  LODWORD(v66) = ((v45 ^ 0x3F162902) >> 16) ^ DWORD2(v238) ^ *(_DWORD *)(v135 + 4 * (((v45 ^ 0x3F162902) >> 16) ^ 0x5Cu)) ^ v123;
  LODWORD(v116) = (v44 >> 1) ^ DWORD1(v238) ^ v180;
  v181 = *(_DWORD *)&v141[4 * (BYTE1(v45) ^ 0xCB)] ^ HIDWORD(v238) ^ (v177 - 928800576 - ((2 * v177) & 0x91474180));
  LODWORD(v45) = *(_DWORD *)&v141[4 * (BYTE1(v125) ^ 0x7C)] ^ HIDWORD(v239) ^ ((v45 ^ 2)
                                                                             - 1334599830
                                                                             + ((2 * (v45 ^ 0x3F162902) + 254) & 0x1D4 ^ 0xDDD67FFF)) ^ *(_DWORD *)(v137 + 4 * (v45 ^ 0x6Fu)) ^ v174;
  LODWORD(v125) = ((BYTE2(v45) ^ 0xE9) + 1737260655 - 2 * ((BYTE2(v45) ^ 0xE9) & 0x7F ^ WORD1(v45) & 0x10)) ^ *(_DWORD *)(v135 + 4 * (BYTE2(v45) ^ 0xB5u));
  v182 = v125 - 928800576 - ((2 * v125) & 0x91474180);
  HIDWORD(v44) = *(_DWORD *)&v134[4 * ((v66 >> 24) ^ 0x9D)];
  LODWORD(v44) = HIDWORD(v44) ^ 0xEC0C7F2A;
  LODWORD(v113) = v44 >> 1;
  HIDWORD(v44) = *(_DWORD *)&v134[4 * (HIBYTE(v181) ^ 0x61)];
  LODWORD(v44) = HIDWORD(v44) ^ 0xEC0C7F2A;
  v183 = *(_DWORD *)(v137 + 4 * (v45 ^ 0xC5u)) ^ *(_DWORD *)(v135 + 4 * (BYTE2(v66) ^ 0x28u)) ^ ((v45 ^ 0xA8) + v176 - ((2 * (v45 ^ 0xA8) + 842892542) & 0x222981D4)) ^ ((BYTE2(v66) ^ 0x74) + 1737260655 - ((2 * ((v66 >> 16) ^ 0x9D74)) & 0xDE)) ^ (v44 >> 1);
  v184 = v113 ^ ((BYTE2(v116) ^ 0xE6) + 1737260655 - ((2 * (WORD1(v116) ^ 0xB0E6)) & 0xDE)) ^ *(_DWORD *)(v135 + 4 * (BYTE2(v116) ^ 0xBAu));
  LODWORD(v123) = v66;
  LODWORD(v62) = (v66 ^ 0xD9)
               - 1334599830
               + ((2 * (v66 ^ 0xD9) + 254) & 0x1D4 ^ 0xDDD67FFF);
  HIDWORD(v44) = *(_DWORD *)&v134[4 * (BYTE3(v45) ^ 0xB8)];
  LODWORD(v44) = HIDWORD(v44) ^ 0xEC0C7F2A;
  v185 = (v181 ^ 0x85) - 1334599830 + ((2 * (v181 ^ 0x85) + 254) & 0x1D4 ^ 0xDDD67FFF);
  LODWORD(v113) = ((BYTE2(v181) ^ 8) + 1737260655 - 2 * ((BYTE2(v181) ^ 8) & 0x7F ^ HIWORD(v181) & 0x10)) ^ *(_DWORD *)(v135 + 4 * (BYTE2(v181) ^ 0x54u)) ^ *(_DWORD *)(v137 + 4 * (v116 ^ 0x29u)) ^ ((v116 ^ 0x44) - 1334599830 + ((2 * (v116 ^ 0x44) + 254) & 0x1D4 ^ 0xDDD67FFF)) ^ (v44 >> 1);
  LODWORD(v125) = *(_DWORD *)&v141[4 * (BYTE1(v116) ^ 0xDD)] ^ HIDWORD(v237) ^ (v183
                                                                              - 928800576
                                                                              - ((2 * v183) & 0x91474180));
  HIDWORD(v44) = *(_DWORD *)&v134[4 * (BYTE3(v116) ^ 0xB0)];
  LODWORD(v44) = HIDWORD(v44) ^ 0xEC0C7F2A;
  LODWORD(v66) = *(_DWORD *)&v141[4 * (BYTE1(v66) ^ 0xBD)] ^ v238 ^ (v113 - 928800575 + ~((2 * v113) & 0x91474180));
  LODWORD(v123) = *(_DWORD *)&v141[4 * (BYTE1(v181) ^ 0x8F)] ^ HIDWORD(v236) ^ *(_DWORD *)(v137
                                                                                         + 4
                                                                                         * (v123 ^ 0xB4)) ^ v62;
  LODWORD(v62) = *(_DWORD *)(v137 + 4 * (v181 ^ 0xE8u));
  v186 = v123 ^ (v44 >> 1) ^ v182;
  v187 = v185 ^ v237 ^ v62 ^ *(_DWORD *)&v141[4 * (BYTE1(v45) ^ 0x2D)] ^ (v184
                                                                                      - 928800576
                                                                                      - ((2 * v184) & 0x91474180));
  v188 = ((BYTE2(v187) ^ 0x66) + 1737260655 - ((2 * (HIWORD(v187) ^ 0xAE66)) & 0xDE)) ^ *(_DWORD *)(v135
                                                                                                  + 4 * (BYTE2(v187) ^ 0x3Au));
  HIDWORD(v44) = *(_DWORD *)&v134[4 * (HIBYTE(v186) ^ 0x18)];
  LODWORD(v44) = HIDWORD(v44) ^ 0xEC0C7F2A;
  LODWORD(v45) = ((v44 >> 1) + 1737260655 - ((2 * (v44 >> 1)) & 0xCF18FCDE)) ^ *(_DWORD *)(v135
                                                                                         + 4 * (BYTE2(v66) ^ 0x40u));
  HIDWORD(v44) = *(_DWORD *)&v134[4 * ((v66 >> 24) ^ 0xEF)];
  LODWORD(v44) = HIDWORD(v44) ^ 0xEC0C7F2A;
  v189 = (v44 >> 1) ^ *(_DWORD *)(v137 + 4 * (v186 ^ 0x90u)) ^ ((v186 ^ 0xFD)
                                                                                 - 1334599830
                                                                                 + ((2 * (v186 ^ 0xFD)
                                                                                   + 254) & 0x1D4 ^ 0xDDD67FFF));
  LODWORD(v123) = v188 - 928800576 - ((2 * v188) & 0x91474180);
  v190 = v189 - 928800576 - ((2 * v189) & 0x91474180);
  v191 = *(_DWORD *)(v137 + 4 * (v125 ^ 0x27u)) ^ ((v125 ^ 0x4A)
                                                                    - 1334599830
                                                                    + ((2 * (v125 ^ 0x4A) + 254) & 0x1D4 ^ 0xDDD67FFF));
  HIDWORD(v44) = *(_DWORD *)&v134[4 * (HIBYTE(v187) ^ 0xAE)];
  LODWORD(v44) = HIDWORD(v44) ^ 0xEC0C7F2A;
  v192 = (v44 >> 1) ^ *(_DWORD *)(v135 + 4 * (BYTE2(v186) ^ 0xFu)) ^ (v191 + 1737260655 - ((2 * v191) & 0xCF18FCDE));
  HIDWORD(v44) = *(_DWORD *)&v134[4 * (BYTE3(v125) ^ 0xDC)];
  LODWORD(v44) = HIDWORD(v44) ^ 0xEC0C7F2A;
  v193 = v45 - 928800576 - ((2 * v45) & 0x91474180);
  LODWORD(v45) = ((BYTE2(v125) ^ 0xE) + 1737260655 - 2 * ((BYTE2(v125) ^ 0xE) & 0x7F ^ WORD1(v125) & 0x10)) ^ v236 ^ *(_DWORD *)&v141[4 * (BYTE1(v187) ^ 0x7C)] ^ *(_DWORD *)(v135 + 4 * (BYTE2(v125) ^ 0x52u)) ^ v190;
  LODWORD(v116) = *(_DWORD *)&v141[4 * (BYTE1(v186) ^ 0x1B)] ^ HIDWORD(v235) ^ *(_DWORD *)(v137
                                                                                         + 4
                                                                                         * (v66 ^ 0x4Du)) ^ ((v66 ^ 0x20) - 1334599830 + ((2 * (v66 ^ 0x20) + 254) & 0x1D4 ^ 0xDDD67FFF)) ^ (v44 >> 1) ^ v123;
  LODWORD(v125) = ((v187 ^ 0xB3)
                 - 1334599830
                 + ((2 * (v187 ^ 0xB3) + 254) & 0x1D4 ^ 0xDDD67FFF)) ^ HIDWORD(v234) ^ *(_DWORD *)&v141[4 * (BYTE1(v125) ^ 0x65)] ^ *(_DWORD *)(v137 + 4 * (v187 ^ 0xDEu));
  v194 = BYTE1(v66) ^ 0xA4;
  LODWORD(v125) = v125 ^ v193;
  LODWORD(v66) = v125 ^ BYTE2(v66);
  v195 = *(_DWORD *)&v141[4 * v194] ^ v235 ^ (v192 - 928800575 + ~((2 * v192) & 0x91474180));
  v196 = (v195 ^ BYTE2(v186));
  HIDWORD(v44) = *(_DWORD *)&v134[4 * ((v66 ^ 0x7641388B) >> 24)];
  LODWORD(v44) = HIDWORD(v44) ^ 0xEC0C7F2A;
  v197 = v44 >> 1;
  HIDWORD(v44) = *(_DWORD *)&v134[4 * ((v45 ^ 0xF7E9CFA8) >> 24)];
  LODWORD(v44) = HIDWORD(v44) ^ 0xEC0C7F2A;
  v198 = v44 >> 1;
  v199 = (((v66 ^ 0x7641388B) >> 16)
        + 1737260655
        - (((v66 ^ 0x7641388B) >> 15) & 0xDE)) ^ *(_DWORD *)(v135
                                                                         + 4
                                                                         * (((v66 ^ 0x7641388B) >> 16) ^ 0x5Cu));
  HIDWORD(v44) = *(_DWORD *)&v134[4 * (HIBYTE(v195) ^ 0xE7)];
  LODWORD(v44) = HIDWORD(v44) ^ 0xEC0C7F2A;
  v200 = v44 >> 1;
  v201 = v197 ^ *(_DWORD *)(v137 + 4 * (v196 ^ 0x18u)) ^ (((v45 ^ 0xF7E9CFA8) >> 16)
                                                          + 1737260655
                                                          - (((v45 ^ 0xF7E9CFA8) >> 15) & 0xDE)) ^ *(_DWORD *)(v135 + 4 * (((v45 ^ 0xF7E9CFA8) >> 16) ^ 0x5Cu)) ^ ((v196 ^ 0x75) - 1334599830 + ((2 * (v196 ^ 0x75) + 254) & 0x1D4 ^ 0xDDD67FFF));
  v202 = (v201 - 928800575 + ~((2 * v201) & 0x91474180)) ^ *(_DWORD *)&v141[4 * (BYTE1(v116) ^ 0xEC)];
  HIDWORD(v44) = *(_DWORD *)&v134[4 * (BYTE3(v116) ^ 0x57)];
  LODWORD(v44) = HIDWORD(v44) ^ 0xEC0C7F2A;
  v203 = v198 ^ *(_DWORD *)(v135 + 4 * (BYTE2(v116) ^ 0xA7u)) ^ ((BYTE2(v116) ^ 0xFB)
                                                                 + 1737260655
                                                                 - ((2 * (WORD1(v116) ^ 0x57FB)) & 0xDE)) ^ ((v66 ^ 0x8B) - 1334599830 + ((2 * (v66 ^ 0x7641388B) + 254) & 0x1D4 ^ 0xDDD67FFF)) ^ *(_DWORD *)(v137 + 4 * (v66 ^ 0xE6u));
  v204 = (v203 - 928800576 - ((2 * v203) & 0x91474180)) ^ *(_DWORD *)&v141[4 * (BYTE1(v195) ^ 0x6D)];
  v205 = HIWORD(v195) ^ 0xE731;
  LODWORD(v113) = *(_DWORD *)(v135 + 4 * (v205 ^ 0x5Cu));
  LODWORD(v123) = *(_DWORD *)&v141[4 * (BYTE1(v45) ^ 0x2D)];
  LODWORD(v45) = ((v45 ^ 0xA8) - 1334599830 + ((2 * (v45 ^ 0xF7E9CFA8) + 254) & 0x1D4 ^ 0xDDD67FFF)) ^ (v205 + 1737260655 + (~(2 * v205) | 0xFFFFFF21) + 1) ^ *(_DWORD *)(v137 + 4 * (v45 ^ 0xC5u));
  LODWORD(v45) = v227 ^ *(_DWORD *)&v141[4 * (BYTE1(v125) ^ 0xDA)] ^ ((v45 ^ (v44 >> 1) ^ v113)
                                                                    - 928800576
                                                                    - ((2 * (v45 ^ (v44 >> 1) ^ v113)) & 0x91474180));
  LODWORD(v125) = (v204 + 642161856 - ((2 * v204) & 0x4C8D3980)) ^ v234;
  LODWORD(v134) = (v202 - 1159909980 - ((2 * v202) & 0x75BA5B48)) ^ HIDWORD(v233);
  LODWORD(v66) = v123 ^ v233 ^ ((v116 ^ 0x2F)
                              - 1334599830
                              + ((2 * (v116 ^ 0x2F) + 254) & 0x1D4 ^ 0xDDD67FFF)) ^ v200 ^ *(_DWORD *)(v137 + 4 * (v116 ^ 0x42u)) ^ (v199 - 928800575 + ~((2 * v199) & 0x91474180));
  BYTE2(v205) = BYTE2(v45) ^ 0x8C;
  LODWORD(v141) = v134 ^ 0x351D74B9;
  v206 = *(_DWORD *)(v41 - 120);
  v207 = (char *)*(&off_24C363D30 + (int)(v206 - 1850)) - 4;
  v208 = (char *)*(&off_24C363D30 + (int)v226) - 12;
  v209 = (*(_DWORD *)&v208[4 * (BYTE2(v125) ^ 0x9E)] - 1407433883) ^ (*(_DWORD *)&v207[4 * (v66 ^ 0xC9)]
                                                                    - 1851218756);
  LODWORD(v62) = *(_DWORD *)&v207[4 * (v45 ^ 0xC8)];
  v210 = (char *)*(&off_24C363D30 + SHIDWORD(v226)) - 4;
  LODWORD(v123) = (*(_DWORD *)&v208[4 * (BYTE2(v66) ^ 0x38)] - 1407433883) ^ (*(_DWORD *)&v210[4
                                                                                             * ((v45 ^ 0x898C5DC8) >> 24)]
                                                                            - 1500815404);
  v211 = *(_DWORD *)&v207[4 * (v125 ^ 0xA2)];
  LODWORD(v116) = *(_DWORD *)&v207[4 * (v134 ^ 0xB9)];
  v212 = *(unsigned int *)&v210[4 * (BYTE3(v125) ^ 0xE7)];
  LODWORD(v207) = *(_DWORD *)&v210[4 * ((v66 >> 24) ^ 0xB8)];
  LODWORD(v134) = *(_DWORD *)&v210[4 * ((v134 >> 24) ^ 0x65)];
  v213 = (char *)*(&off_24C363D30 + (int)(v206 - 1819)) - 12;
  LODWORD(v45) = *(_DWORD *)&v213[4 * (BYTE1(v45) ^ 0x61)] ^ ((_DWORD)v134 - 1500815404);
  v214 = *(unsigned int *)&v213[4 * (BYTE1(v66) ^ 0xE9)];
  LODWORD(v45) = (v209 - 1022598436 - ((2 * v209) & 0x8618C5B8)) ^ v45;
  LODWORD(v66) = (v123 ^ (v211 - 1851218756)) - 1022598436 - ((2 * (v123 ^ (v211 - 1851218756))) & 0x8618C5B8);
  LODWORD(v123) = *(_DWORD *)&v208[4 * BYTE2(v205)];
  LODWORD(v135) = *(_DWORD *)&v213[4 * BYTE1(v141)] ^ v229 ^ v66;
  LODWORD(v45) = HIDWORD(a4) ^ HIDWORD(v233) ^ (v45 - 1159909980 - ((2 * v45) & 0x75BA5B48));
  v215 = (_DWORD)v62 - 2 * (((_DWORD)v62 + 296264892) & 0x430C62DD ^ v62 & 1) + 1421150104;
  LODWORD(v62) = *(_DWORD *)&v208[4 * BYTE2(v141)] - 1407433883;
  LODWORD(v125) = *(_DWORD *)&v213[4 * (BYTE1(v125) ^ 0xA0)] ^ HIDWORD(a4) ^ v215 ^ ((_DWORD)v207 - 1500815404);
  v216 = (char *)*(&off_24C363D30 + (int)(v206 - 1842)) - 12;
  a1[*(_QWORD *)(v41 - 248)] = v216[BYTE1(v135) ^ 0x99] ^ 0xEA;
  v217 = (uint64_t)*(&off_24C363D30 + (int)v225);
  LODWORD(v125) = v125 ^ v62;
  a1[*(_QWORD *)(v41 - 240)] = (*(_BYTE *)(v217 + (BYTE2(v45) ^ 0xADLL)) - 39) ^ 0xC5;
  v218 = (uint64_t)*(&off_24C363D30 + SHIDWORD(a6));
  a1[*(_QWORD *)(v41 - 200)] = *(_BYTE *)(v218 + (v135 ^ 0xFCLL)) ^ 0x6E;
  a1[*(_QWORD *)(v41 - 224)] = (*(_BYTE *)(v217 + (BYTE2(v125) ^ 0x8CLL)) - 39) ^ 0x47;
  v219 = (uint64_t)*(&off_24C363D30 + (int)(v206 - 1863));
  a1[*(_QWORD *)(v41 - 216)] = (*(_BYTE *)(v219 + (BYTE3(v135) ^ 0xDELL)) - 10) ^ 0x1B;
  v220 = *(unsigned __int8 *)(v217 + (BYTE2(v135) ^ 0x15));
  a1[*(_QWORD *)(v41 - 208)] = ((v220 + ((v220 - 39) ^ 0xDA) - 38) ^ 0xFE) + v220 - 39;
  v221 = HIDWORD(v225) ^ v214 ^ ((_DWORD)v123 - 1407433883) ^ ((_DWORD)v116 - 1851218756) ^ ((_DWORD)v212 - ((2 * (_DWORD)v212 + 1293336488) & 0x8618C5B8) + 1771553456);
  a1[*(_QWORD *)(v41 - 232)] = *(_BYTE *)(v218 + (v221 ^ 5)) ^ 0x9C;
  a1[*(_QWORD *)(v41 - 168)] = (*(_BYTE *)(v219 + (BYTE3(v45) ^ 0x4ELL)) - 10) ^ 0xE6;
  a1[*(_QWORD *)(v41 - 160)] = (*(_BYTE *)(v219 + (BYTE3(v125) ^ 0x9CLL)) - 10) ^ 0xB8;
  v222 = *(_QWORD *)(v41 - 176);
  a1[v222] = (*(_BYTE *)(v219 + (BYTE3(v221) ^ 0x67)) - 10) ^ 0x91;
  a1[*(_QWORD *)(v41 - 152)] = *(_BYTE *)(v218 + (v125 ^ 0xF2)) ^ 0x96;
  a1[*(_QWORD *)(v41 - 192)] = v216[BYTE1(v125) ^ 0x1ELL] ^ 0x49;
  a1[*(_QWORD *)(v41 - 144)] = v216[BYTE1(v221) ^ 0x33] ^ 0x50;
  a1[*(_QWORD *)(v41 - 184)] = v216[BYTE1(v45) ^ 0xBCLL] ^ 0x9E;
  a1[*(_QWORD *)(v41 - 136)] = *(_BYTE *)(v218 + (v45 ^ 0x9FLL)) ^ 0x6E;
  a1[*(_QWORD *)(v41 - 128)] = (*(_BYTE *)(v217 + (BYTE2(v221) ^ 0xDLL)) - 39) ^ 0x8E;
  v223 = (_DWORD)v222 - 1133223513 - ((2 * (_DWORD)v222 + 32) & 0x78E8C34Eu) + 16;
  return ((uint64_t (*)(char *, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unsigned __int8 *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *, uint64_t, char *, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t))(*(_QWORD *)(a37 + 8 * (int)((52 * ((v223 ^ 0xBC7461A7) >= HIDWORD(v229))) ^ (v206 - 569))) - 12))(v216, v223, (v220 - 39) ^ 0xDAu, v206, v221, 110, v212, v214, a2, a3, a4, a1, a6, v225, v226, v227, v228, v229, v230,
           v115,
           v231,
           v232,
           v233,
           v234,
           v235,
           v236,
           v237,
           v238,
           *((_QWORD *)&v238 + 1),
           v239,
           v240,
           v241,
           v242,
           v243,
           v244);
}

void sub_20AAA812C()
{
  JUMPOUT(0x20AAA5FA8);
}

uint64_t sub_20AAA8160(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7)
{
  int v7;
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * (int)((147 * (((a7 ^ (v7 == a3)) & 1) == 0)) ^ a7)) - (a7 ^ 0x76)))();
}

uint64_t sub_20AAA81A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  char v6;
  uint64_t v7;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v7
                                                                                + 8
                                                                                * (((((a6 ^ 0x654) - 97) ^ 0x4BD)
                                                                                  * ((v6 & 8) == 0)) ^ a6))
                                                                    - 12))(a1, a2, a3, (a2 - a3));
}

uint64_t sub_20AAA81D4@<X0>(int a1@<W0>, int a2@<W2>, int a3@<W6>, uint64_t a4@<X8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40)
{
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  int v44;
  char v45;
  int v46;
  int v47;
  uint64_t v48;
  int v49;
  int v50;
  char v51;
  uint64_t v52;
  int8x16x4_t v54;

  *(_DWORD *)(v48 - 128) = v47;
  *(_DWORD *)(v48 - 136) = v43;
  v49 = (a3 - 1971) & v43;
  v50 = -a2;
  *(_DWORD *)(v48 - 144) = v49;
  v51 = a1 + v46 + v45;
  *(_DWORD *)(v48 - 120) = (a3 - 30) ^ 0x785;
  v52 = (v50 + a1 + v46 + v44);
  v54.val[0].i64[0] = ((_BYTE)v50 + (_BYTE)a1 + (_BYTE)v46 + (_BYTE)v44) & 0xF;
  v54.val[0].i64[1] = ((_BYTE)v50 + v51 + 9) & 0xF;
  v54.val[1].i64[0] = ((_BYTE)v50 + v51 + 65 * *(_BYTE *)(v48 - 120)) & 0xF;
  v54.val[1].i64[1] = ((_BYTE)v50 + v51 + 7) & 0xF;
  v54.val[2].i64[0] = ((_BYTE)v50 + v51 + 6) & 0xF;
  v54.val[2].i64[1] = ((_BYTE)v50 + v51 + 5) & 0xF;
  v54.val[3].i64[0] = ((_BYTE)v50 + v51 + 4) & 0xF;
  v54.val[3].i64[1] = ((_BYTE)v50 + v51 + 3) & 0xF;
  *(int8x8_t *)(a4 - 7 + v52) = veor_s8(veor_s8(veor_s8(*(int8x8_t *)(v42 + (v52 & 0xF) - 7), *(int8x8_t *)(a4 - 7 + v52)), veor_s8(*(int8x8_t *)((v52 & 0xF) + v41 - 5), *(int8x8_t *)((v52 & 0xF) + v40 - 3))), vrev64_s8(vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v54, (int8x16_t)xmmword_20AB036A0), (int8x8_t)0x7777777777777777)));
  return ((uint64_t (*)(__n128))(*(_QWORD *)(a40 + 8 * ((38 * (v50 != 8 - v49)) ^ (a3 - 30))) - 12))((__n128)xmmword_20AB036A0);
}

void sub_20AAA8318()
{
  JUMPOUT(0x20AAA8240);
}

uint64_t sub_20AAA8340()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((((622 * (v0 ^ 0x20B)) ^ 0x724)
                                          * (*(_DWORD *)(v2 - 136) == *(_DWORD *)(v2 - 144))) ^ v0))
                            - ((v0 - 448) | 0x702u)
                            + 1854))();
}

uint64_t sub_20AAA8390@<X0>(int a1@<W3>, int a2@<W4>, uint64_t a3@<X8>)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = (a1 - 23435537);
  *(_BYTE *)(a3 + v8) ^= *(_BYTE *)(v6 + (v8 & 0xF)) ^ *(_BYTE *)((v8 & 0xF) + v5 + 2) ^ *(_BYTE *)((v8 & 0xF) + v4 + 4) ^ (119 * (v8 & 0xF));
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((252 * (a1 - 1 != v3)) ^ (a2 - 1740))) - 8))();
}

void sub_20AAA83FC()
{
  int v0;
  int v1;
  uint64_t v2;

  if (v0 == 746553896)
    v1 = 306494155;
  else
    v1 = -306454253;
  *(_DWORD *)(v2 + 32) = v1;
}

void sub_20AAA8460(uint64_t a1)
{
  int v1;
  _BOOL4 v3;

  v3 = *(_DWORD *)(*(_QWORD *)(a1 + 8) - 0x4FF3ADA337C70001) == 311742309
    || *(_DWORD *)(*(_QWORD *)(a1 + 16) - 0x4FF3ADA337C70001) == 311742309;
  v1 = *(_DWORD *)a1 - 1225351577 * ((-1557536513 - (a1 | 0xA329E0FF) + (a1 | 0x5CD61F00)) ^ 0x7F4CC716);
  __asm { BR              X12 }
}

void sub_20AAA8564()
{
  _DWORD *v0;
  int v1;

  *v0 = v1;
}

void IPaI1oem5iL(uint64_t a1)
{
  __asm { BR              X8 }
}

uint64_t sub_20AAA8C60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, unsigned int a13)
{
  int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;

  a13 = 108757529 * ((-1250741474 - (&a12 | 0xB573331E) + (&a12 | 0x4A8CCCE1)) ^ 0xAA10AECA)
      - 504207030;
  v16 = sub_20AAE5C84(&a12);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v15 + 8 * ((330 * (a12 == v13)) ^ v14)) - 8))(v16);
}

uint64_t sub_20AAA8CE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unint64_t *a12, int a13, int a14)
{
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  a14 = 178 - 460628867 * ((&a12 - 449108668 - 2 * ((unint64_t)&a12 & 0xE53B2544)) ^ 0xA9ADA739);
  a12 = &STACK[0x7EF87141C217A9D1];
  sub_20AAE2E14((uint64_t)&a12);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15
                                                                                          + 8
                                                                                          * ((19
                                                                                            * (((a13 == v14) ^ 0x19) & 1)) ^ 0x2AFu))
                                                                              - 8))(v16, v17, v18, v19, v20);
}

uint64_t sub_20AAA8D80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, unsigned int a13, uint64_t a14, int a15)
{
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v19 = 1178560073 * ((2 * (&a12 & 0x20735718) - &a12 + 1603053795) ^ 0xE518D081);
  a13 = (v15 ^ 0xD77FFF9F) + (((((v18 + 247) | 0xAC) - 379) ^ 0xAEFFFE7E) & (2 * v15)) + 1069309422 + v19;
  a14 = a11;
  a15 = (v18 - 43) ^ v19;
  sub_20AAA1514((uint64_t)&a12);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17
                                                                                          + 8
                                                                                          * ((88 * (a12 != v16)) ^ v18))
                                                                              - 12))(v20, v21, v22, v23, v24);
}

uint64_t sub_20AAA8E54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unint64_t *a12, uint64_t a13, unsigned int a14, unsigned int a15, unsigned int a16, int a17)
{
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  unsigned int v21;
  uint64_t v22;

  v21 = ((2 * (&a12 & 0xFE286C0) - &a12 + 1880979771) ^ 0x3C8BFB46) * v20;
  a16 = 1336078083 - v21;
  a14 = v21 + 1421205473;
  a15 = v21 + v19 - 2024873404;
  a12 = &STACK[0x61B876722A6C047];
  a13 = a11;
  v22 = sub_20AAE5D1C((uint64_t)&a12);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v18
                                                      + 8
                                                      * (int)(((a17 == v17) * ((v19 + 850444734) & 0xCD4F3FBC ^ 0x503)) ^ v19))
                                          - 12))(v22);
}

uint64_t sub_20AAA8F20()
{
  void (*v0)(unsigned int *);
  unsigned int v1;
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  unint64_t *v7;
  int v8;
  unint64_t *v9;
  unsigned int v10;
  unsigned int v11;
  unint64_t *v12;
  unint64_t *v13;

  v12 = &STACK[0x33AA5AD25433002F];
  v13 = v7;
  v10 = (v4 - 24) ^ (1374699841
                   * ((-1876819192 - (&v10 | 0x90220308) + (&v10 | 0x6FDDFCF7)) ^ 0x229E4FE));
  (*(void (**)(unsigned int *))(v2 + 8 * (v4 ^ 0x129)))(&v10);
  v10 = (v4 + 721) ^ (1755732067 * (&v10 ^ 0xDEC6BDDB));
  v12 = v7;
  sub_20AABD7C8((uint64_t)&v10);
  if ((_DWORD)v13 == v1 + v4 + 379 - 700)
    v5 = v8;
  else
    v5 = (int)v13;
  v12 = v7;
  v11 = v4
      + ((174149367 - (&v10 | 0xA614EF7) + (&v10 | 0xF59EB108)) ^ 0xFF6ABF27) * v3
      + 167;
  v0(&v10);
  v12 = v9;
  v11 = v4 + 379 + ((2 * (&v10 & 0x57823680) - &v10 - 1468151430) ^ 0xA289C755) * v3 - 212;
  v0(&v10);
  return v5 ^ v1;
}

uint64_t sub_20AAA90D0(_DWORD *a1)
{
  unsigned int v1;

  v1 = 1178560073 * ((-2 - ((a1 | 0xAE85A791) + (~(_DWORD)a1 | 0x517A586E))) ^ 0xEBEE200C);
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_24C363D30 + (int)((*a1 - v1) ^ 0xB))
                              + (int)((1356 * ((((*a1 - v1 + 714) ^ (a1[7] - v1 - 1143727453 < 0xFFFFFEFF)) & 1) == 0)) ^ (*a1 - v1)))
                            - 8))();
}

uint64_t sub_20AAA916C@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8 * ((1068 * (((v2 == 1143727196) ^ (v1 - 5)) & 1)) | v1))
                            - ((v1 + 1027371341) & 0xC2C38FFB)
                            + 1219))();
}

uint64_t sub_20AAA91E4@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(a3
                                                               + 8
                                                               * (int)((224
                                                                      * ((((a2 & 0xC2FCA7FB) + 146286335) & 0xF747D5EF ^ 0x511) == 1169)) ^ ((a2 & 0xC2FCA7FB) + 146286335) & 0xF747D5EF))
                                                   - 4))(a1, 138124364);
}

uint64_t sub_20AAA92EC@<X0>(int a1@<W3>, unint64_t a2@<X4>, int a3@<W5>, uint64_t a4@<X8>)
{
  int v4;
  unsigned int v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(a4 + 8 * (a3 ^ ((v4 == 0) * a1))) - (((a3 ^ v5) + 485) ^ a2)))();
}

uint64_t sub_20AAA931C@<X0>(int a1@<W5>, uint64_t a2@<X8>)
{
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(a2 + 8 * ((207 * (v2 == ((2 * a1) ^ 0x69A))) ^ a1))
                            - (((a1 - 708) | 0x442u) ^ 0x4C3)))();
}

uint64_t sub_20AAA935C@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;

  v6 = 409 * (v5 ^ 0x699);
  v7 = v2 + v1;
  v8 = (v6 ^ 0x4CA) + v2;
  *(_DWORD *)(*(_QWORD *)(v3 - 0x4FF3ADA337C6FFFDLL) + 4 * v7) = v4;
  v9 = (v6 - 1211) | 0x4A6;
  *(_DWORD *)(v3 - 0x4FF3ADA337C70001) = v8;
  v10 = v8 + v1;
  if (v8 + v1 < 0)
    v10 = -v10;
  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * ((((int)((v10 ^ 0xFFF5DF75) + ((2 * v10) & 0xFFEBBEEA) + v9 + 662484) >= 0)
                                          * (v9 ^ 0x750)) ^ v9))
                            - 12))();
}

uint64_t sub_20AAA943C@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  _QWORD *v3;
  unsigned int v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * ((125 * (*(_DWORD *)(*v3 + 4 * v4) == (v2 ^ (v1 + 120) ^ 0x40E))) ^ v2))
                            - 12))();
}

uint64_t sub_20AAA9474@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * (((v2 - 1 >= 0) * (v1 ^ 0x750)) ^ v1)) - 12))();
}

uint64_t sub_20AAA94A4(uint64_t result)
{
  int v1;
  int v2;
  int v3;
  int *v4;
  int v5;
  int v6;

  if ((v1 + v2 - 1) >= 0x7FFFFFFF)
    v6 = -v3;
  else
    v6 = v5;
  *v4 = v6;
  *(_DWORD *)(result + 24) = 1723469489;
  return result;
}

uint64_t sub_20AAA94CC(uint64_t result)
{
  *(_DWORD *)(result + 24) = -1004092141;
  return result;
}

uint64_t sub_20AAA94DC(uint64_t a1)
{
  int v1;
  int v2;
  unsigned int v3;
  unsigned int v4;
  _BOOL4 v5;

  v1 = 1759421093 * ((~(_DWORD)a1 & 0xA201450D | a1 & 0x5DFEBAF2) ^ 0x117CF559);
  v2 = *(_DWORD *)(a1 + 8) - v1;
  v3 = *((_DWORD *)*(&off_24C363D30 + v2 - 1602) + 86);
  v4 = (*(_DWORD *)(a1 + 16) ^ v1) + 695708422;
  if (v4 < 0x6DCCB4BD != v3 > 0x92334B42)
    v5 = v3 > 0x92334B42;
  else
    v5 = v3 + 1842132157 > v4;
  return (*((uint64_t (**)(void))*(&off_24C363D30 + (v2 ^ 0x6FA)) + ((53 * ((((v2 + 109) ^ v5) & 1) == 0)) ^ v2)))();
}

uint64_t sub_20AAA95C0()
{
  uint64_t v0;
  unsigned int v1;
  int v2;
  int v3;
  unsigned int v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;

  v4 = v2 + 1320393728;
  v5 = v4 < (v3 ^ 0x555u) - 1828150828;
  v6 = v1 - 1828149833 < v4;
  if (v1 > 0x6CF75A48 != v5)
    v7 = v5;
  else
    v7 = v6;
  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((121 * v7) ^ v3)) - (v3 - 109) + 1605))();
}

uint64_t sub_20AAA963C(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  _BOOL4 v7;

  v5 = *(_DWORD *)(v2 + 348);
  v6 = (*(_DWORD *)(a1 + 4) ^ v1) - 2036262883;
  v7 = v5 > ((v4 + 542) ^ 0x48) + ((v4 + 542) | 0x48u) + 1997650383;
  if (v6 < 0x88EE399E == v7)
    v7 = v5 - 1997653602 > v6;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (v4 ^ (8 * !v7))) - 8))();
}

uint64_t sub_20AAA96BC()
{
  uint64_t v0;
  int v1;
  int v2;
  unsigned int v3;
  unsigned int v4;
  _BOOL4 v5;
  _BOOL4 v6;

  v4 = v2 + 1374219112;
  v5 = v4 < ((v1 + 1765707190) & 0x96C16FE3 ^ 0x54360F0A);
  v6 = v3 + 1412828393 < v4;
  if (v3 > 0xABC9F316 != v5)
    v6 = v5;
  return (*(uint64_t (**)(void))(v0 + 8 * ((54 * !v6) | v1)))();
}

uint64_t sub_20AAA9740(_DWORD *a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  unsigned int v6;
  _BOOL4 v7;

  v5 = *a1 ^ v1;
  v6 = *(_DWORD *)(v2 + 352);
  if (v6 > 0x7D80020F != v5 + 1666766660 < (v4 ^ 0x827FFE13))
    v7 = v6 > 0x7D80020F;
  else
    v7 = v6 - 2105541136 > v5 + 1666766660;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((1678 * !v7) ^ v4)) - 8))();
}

uint64_t sub_20AAA97B8@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  unsigned int v2;
  int v3;
  int v4;
  unsigned int v5;
  _BOOL4 v6;
  int v7;

  v5 = v4 + 924603929;
  if (v5 < 0x56437CC5 != v2 > ((v3 - 986) | 0x640u) - 1447265039)
    v6 = v5 < 0x56437CC5;
  else
    v6 = v2 + 1447263429 < v5;
  if (v6)
    v7 = a2;
  else
    v7 = a2 + 1;
  *(_DWORD *)(result + 12) = v7;
  return result;
}

void sub_20AAA981C(uint64_t a1)
{
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v1 = *(_DWORD *)(a1 + 16) - 3804331 * ((a1 - 2 * (a1 & 0xF3A65B02) - 207201534) ^ 0x8D737EF4);
  v2 = (*(_BYTE *)a1 ^ (-85 * ((a1 - 2 * (a1 & 2) + 2) ^ 0xF4)));
  ((void (*)(_QWORD, void (*)()))*(&off_24C363D30 + v1 - 253))(*(&off_24C363D30 + (v1 ^ 0x18F)), sub_20AAE6194);
  v3 = *(_QWORD *)*(&off_24C363D30 + v1 - 377);
  v5 = v1
     + 1755732067
     * ((2 * ((&v4 ^ 0x47B5E1A7) & 0x1494228) - (&v4 ^ 0x47B5E1A7) - 21578281) ^ 0x67C5E1AB)
     + 634;
  v4 = v3;
  sub_20AACAD80((uint64_t)&v4);
  __asm { BR              X9 }
}

uint64_t sub_20AAA9974()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((1261 * (**(_DWORD **)(v2 + 8 * (v0 - 488)) == ((v0 - 6) ^ 0x383) - 477)) ^ v0))
                            - 8))();
}

uint64_t sub_20AAA9A28@<X0>(int a1@<W8>)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v3;
  int v4;
  uint64_t v6;
  uint64_t v7;
  unsigned int *v8;
  _QWORD *v9;
  uint64_t v10;
  _BYTE *v11;
  _BYTE *v12;
  uint64_t (*v13)(uint64_t, _BYTE *, _DWORD *);
  int v14;
  unsigned int v15;
  uint64_t v16;
  _BYTE *v17;
  int v18;
  unsigned int v19;
  uint64_t result;
  uint64_t v21;
  _BYTE v22[30];
  _BYTE v23[140];

  v8 = *(unsigned int **)(v6 + 8 * (a1 - 420));
  v9 = *(_QWORD **)(v6 + 8 * (a1 - 457));
  v10 = *v8;
  v11 = (_BYTE *)*v9;
  v22[0] = *(_BYTE *)*v9 - 37;
  v22[1] = v11[1] - 37;
  v22[2] = v11[2] - 37;
  v22[3] = v11[3] - 37;
  v22[4] = v11[4] - 37;
  v22[5] = v11[5] - 37;
  v22[6] = v11[6] - 37;
  v22[7] = v11[7] - 37;
  v22[8] = v11[8] - 37;
  v22[9] = v11[9] - 37;
  v22[10] = v11[10] - 37;
  v22[11] = v11[11] - 37;
  v22[12] = v11[12] - 37;
  v22[13] = v11[13] - 37;
  v22[14] = v11[14] - 37;
  v22[15] = v11[15] - 37;
  v22[16] = v11[16] - 37;
  v22[17] = v11[17] - 37;
  v22[18] = v11[18] - 37;
  v22[19] = v11[19] - 37;
  v22[20] = v11[20] - 37;
  v22[21] = v11[21] - 37;
  v12 = (_BYTE *)*v9;
  v22[22] = v12[22] - 37;
  v22[23] = v12[23] - 37;
  v22[24] = v12[24] - 37;
  v22[25] = v12[25] - 37;
  v22[26] = v12[26] - 37;
  v22[27] = v12[27] - 37;
  v22[28] = v12[28] - 37;
  v22[29] = v12[29] - 37;
  v13 = *(uint64_t (**)(uint64_t, _BYTE *, _DWORD *))(v6 + 8 * (a1 - 273));
  v14 = v13(v10, v22, v2);
  v15 = ((2 * v14) & 0x2DDBBBB6) + (v14 ^ 0x96EDDDDB);
  if (v15 != -1762796069)
  {
    if (v15 == -1762794967)
    {
      v16 = *v8;
      v17 = *(_BYTE **)(*(_QWORD *)(v6 + 8 * (v4 ^ 0x1B1)) - 4);
      v23[0] = *v17 - 94;
      v23[1] = v17[1] - 94;
      v23[2] = v17[2] - 94;
      v23[3] = v17[3] - 94;
      v23[4] = v17[4] - 94;
      v23[5] = v17[5] - 94;
      v23[6] = v17[6] - 94;
      v23[7] = v17[7] - 94;
      v23[8] = v17[8] - 94;
      v23[9] = v17[9] - 94;
      v23[10] = v17[10] - 94;
      v23[11] = v17[11] - 94;
      v23[12] = v17[12] - 94;
      v23[13] = v17[13] - 94;
      v23[14] = v17[14] - 94;
      v23[15] = v17[15] - 94;
      v23[16] = v17[16] - 94;
      v23[17] = v17[17] - 94;
      v23[18] = v17[18] - 94;
      v23[19] = v17[19] - 94;
      v18 = v13(v16, v23, v2);
      v19 = (2 * v18) & 0xACFFAAB6;
      v15 = (v18 ^ 0x567FD55B) - 1343913992;
    }
    else
    {
      v19 = 1870100344;
    }
    __asm { BR              X8 }
  }
  *(_DWORD *)(v7 + 356) |= v4 - 467;
  *(_DWORD *)(v7 + 56) = 143612842;
  result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, _DWORD *))(v6 + 8 * (v4 ^ 0x1B6)))(*v2, v7 + 344, v7 + 348, v7 + 352, v3);
  v21 = *(_QWORD *)(v1 + 8);
  *(_DWORD *)(*(_QWORD *)(v1 + 24) - 0x64B4A486D173DE30) = *v2;
  *(_DWORD *)(v21 - 0x79008787D20F56D3) = *v3;
  *(_DWORD *)(v1 + 20) = 306494155;
  return result;
}

void sub_20AAA9E48(uint64_t a1)
{
  int v1;

  v1 = 1225351577 * (((a1 | 0xD0007703) - a1 + (a1 & 0x2FFF88FC)) ^ 0xF39AAF15);
  __asm { BR              X11 }
}

uint64_t sub_20AAA9F00@<X0>(int a1@<W8>)
{
  _DWORD *v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (((*v1 != 0) * (((a1 - 43) | 0x2A1) ^ 0x7CB)) ^ a1)) - 4))();
}

uint64_t sub_20AAA9F48@<X0>(int a1@<W8>)
{
  _DWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(_QWORD);
  unsigned int *v4;
  int v5;
  uint64_t v6;

  v5 = (a1 - 420) | 0x41A;
  v6 = v3(*v4);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v2 + 8 * (((*v1 == ((v5 - 1157) ^ 0x23A)) * (v5 - 1654)) ^ v5))
                                          - 12))(v6);
}

uint64_t sub_20AAA9F8C()
{
  uint64_t v0;
  _DWORD *v1;
  uint64_t (*v2)(_QWORD);
  unsigned int *v3;
  uint64_t result;

  result = v2(*v3);
  *v1 = 0;
  *(_DWORD *)v0 = 0;
  *(_QWORD *)(v0 + 344) = 0;
  *(_QWORD *)(v0 + 352) = 0;
  *(_DWORD *)(v0 + 360) = 704864277;
  *(_DWORD *)(v0 + 56) = 143612842;
  return result;
}

uint64_t sub_20AAA9FCC()
{
  int v0;
  _DWORD *v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (((*v1 == ((v0 - 1157) ^ 0x23A)) * (v0 - 1654)) ^ v0)) - 12))();
}

void sub_20AAA9FFC(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 32) + 108757529 * (((a1 | 0xFA9FB8B3) - (a1 & 0xFA9FB8B3)) ^ 0x1A03DA98);
  __asm { BR              X9 }
}

uint64_t sub_20AAAA0C8@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5, int a6, unint64_t *a7, int a8)
{
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  uint64_t v13;

  v12 = 1755732067
      * ((((&a4 | 0xEDF9146A) ^ 0xFFFFFFFE) - (~&a4 | 0x1206EB95)) ^ 0xCCC0564E);
  a6 = (v11 - 1130) ^ v12;
  a8 = v12 ^ 0x3105B45A;
  a7 = &STACK[0x7B9E9BA5BB9673F2];
  a4 = &STACK[0x164C0FDDF1987670];
  a5 = v10;
  v13 = (*(uint64_t (**)(unint64_t **))(a1 + 8 * (v11 - 1330)))(&a4);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v9
                                                      + 8
                                                      * (((*(_DWORD *)(v10 - 0x140B289DC8FEE23CLL) == v8)
                                                        * (((v11 - 612) | 0x89) ^ 0x18B)) | v11))
                                          - ((v11 + 1565151829) & 0xA2B5AF7E)
                                          + 1842))(v13);
}

uint64_t sub_20AAAA1D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10)
{
  unsigned int v10;
  uint64_t v11;
  int v12;

  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * ((((a10 ^ v10) > 0x14) * (((v12 - 954) | 0xB) ^ 0x329)) ^ v12))
                            - 8))();
}

void sub_20AAAA208(_DWORD *a1@<X8>)
{
  _DWORD *v1;
  int v2;

  *a1 = v2 + 236;
  *v1 = *a1;
}

void sub_20AAAA664()
{
  uint64_t v0;
  int v1;
  _BOOL4 v2;

  v0 = MEMORY[0x24BDAC7A8]();
  v1 = *(_DWORD *)(v0 + 24) - 1225351577 * ((-2 - ((v0 | 0x64CFEAB8) + (~(_DWORD)v0 | 0x9B301547))) ^ 0xB8AACD51);
  v2 = *(_DWORD *)(*(_QWORD *)(v0 + 16) - 0x4FF3ADA337C70001) == 311742309;
  __asm { BR              X13 }
}

uint64_t sub_20AAAA7CC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,char a28,uint64_t a29,char a30,uint64_t a31,char a32,uint64_t a33,char a34,uint64_t a35,char a36)
{
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(uint64_t);
  uint64_t v48;
  uint64_t v49;
  char *v51;
  char *v52;
  char *v53;
  char *v54;
  char *v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;

  v42 = &a36 + v36;
  v56 = &a32 + v36;
  v55 = &a30 + v36;
  v54 = &a34 + v36;
  v53 = &a22 + v36;
  v52 = &a26 + v36;
  v51 = &a28 + v36;
  v43 = &a20 + v36;
  v44 = *a1;
  v45 = *(_QWORD *)(*a1 - 0x11158D12BF1580A5);
  v58 = v37;
  v46 = a1[5];
  v59 = a1[4];
  *(_DWORD *)(v41 - 112) = v39
                         + 577
                         + 1224239923 * ((((v41 - 144) | 0xDBC0EE55) - ((v41 - 144) & 0xDBC0EE55)) ^ 0x29731382);
  *(_QWORD *)(v41 - 104) = v45;
  *(_QWORD *)(v41 - 144) = v44;
  *(_QWORD *)(v41 - 136) = a2;
  *(_QWORD *)(v41 - 128) = &a36 + v36;
  *(_QWORD *)(v41 - 120) = v46;
  v57 = &a36 + v36;
  v47 = (void (*)(uint64_t))(*(_QWORD *)(v38 + 8 * (v39 ^ 0x108)) - 8);
  v47(v41 - 144);
  *(_DWORD *)(v41 - 144) = (v39 + 1389) ^ (1225351577
                                         * ((((v41 - 144) | 0xFC7EA077) - ((v41 - 144) & 0xFC7EA077)) ^ 0xDFE47861));
  *(_QWORD *)(v41 - 136) = v46;
  *(_QWORD *)(v41 - 128) = v43;
  *(_QWORD *)(v41 - 120) = v42;
  *(_QWORD *)(v41 - 112) = v44;
  ((void (*)(uint64_t))*(&off_24C363D30 + (v39 ^ 0x1AB)))(v41 - 144);
  *(_QWORD *)(v41 - 144) = v44;
  *(_QWORD *)(v41 - 136) = v43;
  *(_QWORD *)(v41 - 120) = v46;
  *(_QWORD *)(v41 - 128) = v56;
  *(_QWORD *)(v41 - 104) = v57;
  *(_DWORD *)(v41 - 112) = v39
                         + 577
                         + 1224239923 * (((v41 - 144) & 0x93E41075 | ~((v41 - 144) | 0x93E41075)) ^ 0x9EA8125D);
  v47(v41 - 144);
  *(_DWORD *)(v41 - 112) = v39
                         + 577
                         + 1224239923 * ((((2 * (v41 - 144)) | 0xBD6B769A) - (v41 - 144) - 1588968269) ^ 0xAC06469A);
  *(_QWORD *)(v41 - 120) = v46;
  *(_QWORD *)(v41 - 136) = v43;
  *(_QWORD *)(v41 - 128) = v55;
  *(_QWORD *)(v41 - 104) = v56;
  *(_QWORD *)(v41 - 144) = v44;
  v47(v41 - 144);
  *(_QWORD *)(v41 - 104) = v55;
  *(_DWORD *)(v41 - 112) = v39
                         + 577
                         + 1224239923 * ((((v41 - 144) | 0x18430CB9) - ((v41 - 144) & 0x18430CB9)) ^ 0xEAF0F16E);
  *(_QWORD *)(v41 - 128) = v54;
  *(_QWORD *)(v41 - 120) = v46;
  *(_QWORD *)(v41 - 144) = v44;
  *(_QWORD *)(v41 - 136) = v43;
  v47(v41 - 144);
  *(_DWORD *)(v41 - 112) = v39
                         + 577
                         + 1224239923
                         * ((((2 * ((v41 - 144) ^ 0xF61E1965)) | 0xEAE14D38) - ((v41 - 144) ^ 0xF61E1965) - 1970316956) ^ 0x71DD422E);
  *(_QWORD *)(v41 - 144) = v44;
  *(_QWORD *)(v41 - 136) = v43;
  *(_QWORD *)(v41 - 104) = v54;
  *(_QWORD *)(v41 - 128) = v53;
  *(_QWORD *)(v41 - 120) = v46;
  v47(v41 - 144);
  *(_QWORD *)(v41 - 104) = v53;
  *(_DWORD *)(v41 - 112) = v39
                         + 577
                         + 1224239923
                         * ((((v41 - 144) | 0x8F8286D7) - (v41 - 144) + ((v41 - 144) & 0x707D7928)) ^ 0x7D317B00);
  *(_QWORD *)(v41 - 128) = v52;
  *(_QWORD *)(v41 - 120) = v46;
  *(_QWORD *)(v41 - 144) = v44;
  *(_QWORD *)(v41 - 136) = v43;
  v47(v41 - 144);
  *(_DWORD *)(v41 - 112) = v39
                         + 577
                         + 1224239923
                         * ((((v41 - 144) | 0xD759B5EF) - (v41 - 144) + ((v41 - 144) & 0x28A64A10)) ^ 0x25EA4838);
  *(_QWORD *)(v41 - 128) = v51;
  *(_QWORD *)(v41 - 120) = v46;
  *(_QWORD *)(v41 - 104) = v52;
  *(_QWORD *)(v41 - 144) = v44;
  *(_QWORD *)(v41 - 136) = v43;
  v47(v41 - 144);
  *(_QWORD *)(v41 - 144) = v44;
  *(_QWORD *)(v41 - 136) = v43;
  *(_QWORD *)(v41 - 104) = v51;
  *(_DWORD *)(v41 - 112) = v39
                         + 577
                         + 1224239923 * ((((v41 - 144) | 0xD98DFEF5) + (~(v41 - 144) | 0x2672010A)) ^ 0x2B3E0323);
  *(_QWORD *)(v41 - 128) = v43;
  *(_QWORD *)(v41 - 120) = v46;
  v47(v41 - 144);
  v48 = *(_QWORD *)(v44 - 0x11158D12BF1580ADLL);
  *(_DWORD *)(v41 - 128) = v39 + 1374699841 * ((v41 - 144) ^ 0x6DF41809) + 1214;
  *(_QWORD *)(v41 - 144) = v48;
  *(_QWORD *)(v41 - 136) = v40;
  sub_20AAA176C(v41 - 144);
  *(_QWORD *)(v41 - 136) = v59;
  *(_DWORD *)(v41 - 144) = v39
                         + 235795823 * ((2 * ((v41 - 144) & 0x60997A98) - (v41 - 144) + 526812513) ^ 0x8BCBCC38)
                         + 638;
  v49 = sub_20AACB004(v41 - 144);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v58
                                                      + 8
                                                      * (((((v39 + 362) | 0x13u) + *(_DWORD *)(v41 - 140) - 562414125 > 0x7FFFFFFE)
                                                        * (((v39 - 1535339801) & 0x5B836CDA) - 202)) ^ v39))
                                          - 12))(v49);
}

uint64_t sub_20AAAACA8()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  uint64_t v9;

  v4 = 1224239923 * ((v3 - 481229671 - 2 * ((v3 - 144) & 0xE3510529)) ^ 0x11E2F8FE);
  *(_DWORD *)(v3 - 128) = v4 + v1 + 499;
  *(_QWORD *)(v3 - 136) = v7;
  *(_DWORD *)(v3 - 144) = v4 ^ 0x1967566D;
  sub_20AACD898((_DWORD *)(v3 - 144));
  *(_QWORD *)(v3 - 104) = v2;
  *(_DWORD *)(v3 - 112) = v1 + 1224239923 * ((v3 - 910429459 - 2 * ((v3 - 144) & 0xC9BBF37D)) ^ 0x3B080EAA) + 639;
  *(_QWORD *)(v3 - 144) = v9;
  *(_QWORD *)(v3 - 136) = v7;
  *(_QWORD *)(v3 - 128) = v2;
  *(_QWORD *)(v3 - 120) = v0;
  v8(v3 - 144);
  *(_DWORD *)(v3 - 128) = ((v1 - 23) | 0x608)
                        + 1374699841 * ((2 * ((v3 - 144) & 0xB04ADC0) - (v3 - 144) + 1962627641) ^ 0x190F4A30)
                        - 245;
  *(_QWORD *)(v3 - 144) = v2;
  *(_QWORD *)(v3 - 136) = v6;
  return sub_20AAA176C(v3 - 144);
}

void sub_20AAABD00(uint64_t a1)
{
  __asm { BR              X8 }
}

uint64_t sub_20AAABD40(uint64_t a1)
{
  uint64_t v1;
  int v3;
  unsigned int v4;
  uint64_t v5;

  v3 = (*(uint64_t (**)(void))(v1 + 1352))();
  if (v3 == 16)
    v4 = -42029;
  else
    v4 = -42030;
  if (v3)
    v5 = v4;
  else
    v5 = 0;
  (*(void (**)(uint64_t))(v1 + 208))(a1);
  return v5;
}

uint64_t sub_20AAABD88(_DWORD *a1)
{
  unsigned int v2;
  unsigned int v3;
  int v4;
  uint64_t result;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = 1755732067
     * ((2 * ((a1 ^ 0xFDCA5AD1) & 0x4699B354) - (a1 ^ 0xFDCA5AD1) - 1184478037) ^ 0x9A6AABA1);
  v3 = a1[8] - v2;
  v4 = a1[2] ^ v2;
  v8 = v3 + 628203409 * ((&v8 & 0xC434EA97 | ~(&v8 | 0xC434EA97)) ^ 0xB943195B) - 1404134225;
  result = nullsub_1(&v8);
  if (v4 > 1448812566)
  {
    if (v4 == 1734025238)
    {
      v6 = 3;
    }
    else
    {
      if (v4 != 1448812567)
        goto LABEL_11;
      v6 = 1;
    }
LABEL_10:
    v7 = *((_QWORD *)*(&off_24C363D30 + (int)(v3 - 1172345256))
         + (int)((1548
                * (((v3 + 108) ^ (((uint64_t (*)(_QWORD, uint64_t))*(&off_24C363D30
                                                                                             + (int)(v3 - 1172345209)))((*((_DWORD *)*(&off_24C363D30 + (int)(v3 - 1172345241))+ 6 * v6+ 3)- 274119351), 3511634213) == 0)) & 1)) ^ (v3 - 1172345186)))- 8;
    __asm { BR              X9 }
  }
  if (v4 == 1448812563)
  {
    v6 = 0;
    goto LABEL_10;
  }
  if (v4 == 1448812566)
  {
    v6 = 2;
    goto LABEL_10;
  }
LABEL_11:
  a1[13] = -306454153;
  return result;
}

void sub_20AAAC3CC(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  unsigned int v5;
  unint64_t *v6;
  unsigned int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  **(_DWORD **)(a1 + 96) = *(_DWORD *)(a2 + 16);
  v3 = 1178560073
     * (((&v5 | 0x4EE9FB13) - &v5 + (&v5 & 0xB11604E8)) ^ 0xF47D8371);
  v7 = -1882357464 - v3;
  v6 = &STACK[0xB7BFC0B778596A6];
  v5 = 1063949783 - v3;
  sub_20AABEAE0((uint64_t)&v5);
  __asm { BR              X9 }
}

uint64_t sub_20AAAC570(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  unsigned int v8;

  v8 = v5 + 134219778;
  if (v8 <= 0x40)
    v8 = 64;
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((23 * (-v6 - v4 + ((a4 - 1030) ^ 0x406) + v8 > 0xE)) ^ 0x7E6u))
                            - 12))();
}

uint64_t sub_20AAAC5E4(int a1, int a2, uint64_t a3, int a4)
{
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;

  v9 = v6 + v5;
  v10 = v9 + v7;
  if ((v9 + v7) <= 0x40)
    v10 = a2;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((292 * (a4 - v9 >= (v4 + a4 + a1 + v10))) | 0x219u))
                            - 4))();
}

uint64_t sub_20AAAC634(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,char a23)
{
  int v23;
  int v24;
  unsigned int v25;
  uint64_t v26;
  _BOOL4 v27;

  v27 = (unint64_t)(&a23 + a13 + (v24 + v23 - 1)) >= ((v25 + 446) ^ 0x3C7uLL);
  return ((uint64_t (*)(void))(*(_QWORD *)(v26 + 8 * ((v27 | (4 * v27)) ^ v25)) - 4))();
}

uint64_t sub_20AAAC67C@<X0>(int a1@<W8>)
{
  int v1;
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int8x16_t *v6;
  int8x16_t v7;
  int8x16_t v8;

  v7.i64[0] = 0xF6F6F6F6F6F6F6F6;
  v7.i64[1] = 0xF6F6F6F6F6F6F6F6;
  v8.i64[0] = 0xFCFCFCFCFCFCFCFCLL;
  v8.i64[1] = 0xFCFCFCFCFCFCFCFCLL;
  *(int8x16_t *)(v3 + (a1 + v1)) = vaddq_s8(vaddq_s8(*v6, v8), vmvnq_s8(vandq_s8(vaddq_s8(*v6, *v6), v7)));
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((1659 * (((v4 + 1) & 0x1FFFFFFF0) == 16)) ^ v2))
                            - ((179 * (v2 ^ 0x3D4)) ^ 0x211)))();
}

void sub_20AAAC6F4()
{
  JUMPOUT(0x20AAAC6BCLL);
}

uint64_t sub_20AAAC700@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (a1 ^ (1864 * (v1 == v2))))
                            - ((((a1 + 813544158) & 0x824F0Eu) - 1020) ^ 0xELL)))();
}

uint64_t sub_20AAAC748@<X0>(int a1@<W4>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, char a17)
{
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  *(&a17 + (a2 + v17)) = *(_BYTE *)(v18 + v21 - 1699020516)
                                     + ~(((v19 ^ 0xC) - 20) & (2 * *(_BYTE *)(v18 + v21 - 1699020516)))
                                     - 4;
  return ((uint64_t (*)(void))(*(_QWORD *)(v20 + 8 * ((343 * ((a1 + a2 + 49) > 0x3F)) ^ v19)) - 4))();
}

uint64_t sub_20AAAC7B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,int32x4_t a41,int32x4_t a42,int32x4_t a43,int32x4_t a44)
{
  int v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  int v48;
  int v49;
  int v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t (*v54)(__n128, __n128, __n128, __n128, __n128);
  __n128 v55;
  __n128 v56;
  __n128 v57;
  __n128 v58;
  __n128 v59;
  uint64_t v60;
  int v61;
  uint8x16_t v62;
  uint16x8_t v63;
  int8x16_t v64;
  int8x16_t v65;
  uint16x8_t v66;
  int8x16_t v67;
  int8x16_t v68;
  uint8x16_t v69;
  uint16x8_t v70;
  uint16x8_t v71;
  uint8x16_t v72;
  int8x16_t v75;
  int8x16_t v80;
  int32x4_t v81;
  int32x4_t v82;
  int32x4_t v83;
  int32x4_t v84;
  int v85;
  int v86;
  char *v87;
  unsigned int v88;
  uint64_t v89;
  int v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t (*v93)(_QWORD, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, unint64_t, uint64_t (*)(__n128, __n128, __n128, __n128, __n128), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint8x16_t v95;
  uint16x8_t v96;
  uint16x8_t v97;
  uint8x16_t v98;
  uint8x16_t v103;
  uint16x8_t v104;
  uint16x8_t v105;
  int32x4_t v106;
  int32x4_t v107;
  int32x4_t v108;
  int32x4_t v109;
  _DWORD *v110;
  int v111;
  int v112;
  unint64_t v113;
  uint64_t v114;
  uint64_t v115;
  int8x16x4_t v116;
  int8x16x4_t v117;

  v54 = (uint64_t (*)(__n128, __n128, __n128, __n128, __n128))(*(_QWORD *)(v47 + 8 * v44) - 4);
  v55.n128_u64[0] = 0xFBFBFBFBFBFBFBFBLL;
  v55.n128_u64[1] = 0xFBFBFBFBFBFBFBFBLL;
  v56 = (__n128)vdupq_n_s32(0x1244BACFu);
  v57 = (__n128)vdupq_n_s32(0x1244BACBu);
  v115 = v53 - 16;
  v58 = (__n128)vdupq_n_s32(0x1244BADFu);
  v59.n128_u64[0] = 0xF6F6F6F6F6F6F6F6;
  v59.n128_u64[1] = 0xF6F6F6F6F6F6F6F6;
  v60 = a33;
  v61 = BYTE4(a34) ^ 0xE;
  if (v61 == 2)
  {
    v117 = vld4q_s8((const char *)&a22 + 4);
    v95 = (uint8x16_t)veorq_s8(v117.val[0], (int8x16_t)v55);
    v96 = vmovl_u8(*(uint8x8_t *)v95.i8);
    v97 = vmovl_high_u8(v95);
    v98 = (uint8x16_t)veorq_s8(v117.val[1], (int8x16_t)v55);
    _Q22 = vmovl_u8(*(uint8x8_t *)v98.i8);
    _Q21 = vmovl_high_u8(v98);
    __asm
    {
      SHLL2           V23.4S, V21.8H, #0x10
      SHLL2           V24.4S, V22.8H, #0x10
    }
    v103 = (uint8x16_t)veorq_s8(v117.val[2], (int8x16_t)v55);
    v104 = vmovl_high_u8(v103);
    v105 = vmovl_u8(*(uint8x8_t *)v103.i8);
    v117.val[0] = veorq_s8(v117.val[3], (int8x16_t)v55);
    v117.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v117.val[0]);
    v117.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v117.val[1]);
    v117.val[1] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v117.val[1].i8);
    v117.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v117.val[0].i8);
    v117.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v117.val[0]);
    v117.val[0] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v117.val[0].i8);
    v106 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q22.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v105.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v96.i8), 0x18uLL)), v117.val[0]);
    v107 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(_Q24, (int8x16_t)vshll_high_n_u16(v105, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v96), 0x18uLL)), v117.val[3]);
    v108 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q21.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v104.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v97.i8), 0x18uLL)), v117.val[1]);
    v109 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(_Q23, (int8x16_t)vshll_high_n_u16(v104, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v97), 0x18uLL)), v117.val[2]);
    v117.val[0] = veorq_s8(vandq_s8((int8x16_t)v106, (int8x16_t)v56), (int8x16_t)(*(_OWORD *)v117.val & __PAIR128__(0xFFFFFF04FFFFFF04, 0xFFFFFF04FFFFFF04)));
    v117.val[3] = veorq_s8(vandq_s8((int8x16_t)v107, (int8x16_t)v56), (int8x16_t)(*(_OWORD *)&v117.val[3] & __PAIR128__(0xFFFFFF04FFFFFF04, 0xFFFFFF04FFFFFF04)));
    v117.val[1] = veorq_s8(vandq_s8((int8x16_t)v108, (int8x16_t)v56), (int8x16_t)(*(_OWORD *)&v117.val[1] & __PAIR128__(0xFFFFFF04FFFFFF04, 0xFFFFFF04FFFFFF04)));
    v117.val[2] = veorq_s8(vandq_s8((int8x16_t)v109, (int8x16_t)v56), (int8x16_t)(*(_OWORD *)&v117.val[2] & __PAIR128__(0xFFFFFF04FFFFFF04, 0xFFFFFF04FFFFFF04)));
    a43 = vaddq_s32(vsubq_s32(v108, vaddq_s32((int32x4_t)v117.val[1], (int32x4_t)v117.val[1])), (int32x4_t)v57);
    a44 = vaddq_s32(vsubq_s32(v109, vaddq_s32((int32x4_t)v117.val[2], (int32x4_t)v117.val[2])), (int32x4_t)v57);
    a41 = vaddq_s32(vsubq_s32(v106, vaddq_s32((int32x4_t)v117.val[0], (int32x4_t)v117.val[0])), (int32x4_t)v57);
    a42 = vaddq_s32(vsubq_s32(v107, vaddq_s32((int32x4_t)v117.val[3], (int32x4_t)v117.val[3])), (int32x4_t)v57);
    v110 = (_DWORD *)&a41 + v51 + 703100222;
    v111 = *((_DWORD *)&a41 + ((v50 + a7 - 1740165784) & 0x67B8D1BF ^ (unint64_t)(v51 + 298)) + 703100222) ^ *(v110 - 3);
    v112 = *(v110 - 16) ^ *(v110 - 14) ^ (v111 + v49 - ((2 * v111) & 0x24897596));
    HIDWORD(v113) = v112 ^ v49;
    LODWORD(v113) = v112;
    *v110 = v49 + (v113 >> 31) - ((2 * (v113 >> 31)) & 0x24897596);
    return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v47
                                                                 + 8 * ((41 * (v53 == 703100159)) ^ (v50 + a7 - 239)))
                                                     - 4))(v60, v115);
  }
  else if (v61 == 1)
  {
    v116 = vld4q_s8((const char *)&a22 + 4);
    v62 = (uint8x16_t)veorq_s8(v116.val[0], (int8x16_t)v55);
    v63 = vmovl_u8(*(uint8x8_t *)v62.i8);
    v64 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v63.i8);
    v65 = (int8x16_t)vmovl_high_u16(v63);
    v66 = vmovl_high_u8(v62);
    v67 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v66.i8);
    v68 = (int8x16_t)vmovl_high_u16(v66);
    v69 = (uint8x16_t)veorq_s8(v116.val[1], (int8x16_t)v55);
    v70 = vmovl_high_u8(v69);
    v71 = vmovl_u8(*(uint8x8_t *)v69.i8);
    v72 = (uint8x16_t)veorq_s8(v116.val[2], (int8x16_t)v55);
    _Q26 = (int8x16_t)vmovl_high_u8(v72);
    _Q25 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v72.i8);
    v75 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q25.i8, 0x10uLL);
    __asm { SHLL2           V25.4S, V25.8H, #0x10 }
    v80 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q26.i8, 0x10uLL);
    __asm { SHLL2           V26.4S, V26.8H, #0x10 }
    v116.val[0] = veorq_s8(v116.val[3], (int8x16_t)v55);
    v116.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v116.val[0]);
    v116.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v116.val[1]);
    v116.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v116.val[0].i8);
    v116.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v116.val[0]);
    v116.val[0] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v116.val[0].i8), 0x18uLL), v75), vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v71.i8, 8uLL), v64));
    v116.val[3] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v116.val[3], 0x18uLL), _Q25), vorrq_s8((int8x16_t)vshll_high_n_u16(v71, 8uLL), v65));
    v116.val[1] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v116.val[1].i8), 0x18uLL), v80), vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v70.i8, 8uLL), v67));
    v116.val[2] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v116.val[2], 0x18uLL), _Q26), vorrq_s8((int8x16_t)vshll_high_n_u16(v70, 8uLL), v68));
    v81 = (int32x4_t)veorq_s8(vandq_s8(v116.val[0], (int8x16_t)v58), (int8x16_t)(*(_OWORD *)&v64 & __PAIR128__(0xFFFFFF14FFFFFF14, 0xFFFFFF14FFFFFF14)));
    v82 = (int32x4_t)veorq_s8(vandq_s8(v116.val[3], (int8x16_t)v58), (int8x16_t)(*(_OWORD *)&v65 & __PAIR128__(0xFFFFFF14FFFFFF14, 0xFFFFFF14FFFFFF14)));
    v83 = (int32x4_t)veorq_s8(vandq_s8(v116.val[1], (int8x16_t)v58), (int8x16_t)(*(_OWORD *)&v67 & __PAIR128__(0xFFFFFF14FFFFFF14, 0xFFFFFF14FFFFFF14)));
    v84 = (int32x4_t)veorq_s8(vandq_s8(v116.val[2], (int8x16_t)v58), (int8x16_t)(*(_OWORD *)&v68 & __PAIR128__(0xFFFFFF14FFFFFF14, 0xFFFFFF14FFFFFF14)));
    a43 = vaddq_s32(vsubq_s32((int32x4_t)v116.val[1], vaddq_s32(v83, v83)), (int32x4_t)v57);
    a44 = vaddq_s32(vsubq_s32((int32x4_t)v116.val[2], vaddq_s32(v84, v84)), (int32x4_t)v57);
    a41 = vaddq_s32(vsubq_s32((int32x4_t)v116.val[0], vaddq_s32(v81, v81)), (int32x4_t)v57);
    a42 = vaddq_s32(vsubq_s32((int32x4_t)v116.val[3], vaddq_s32(v82, v82)), (int32x4_t)v57);
    v85 = (HIDWORD(a31) ^ (v48 + v50 + a7 - 183 - 343))
        + v46
        + ((HIDWORD(a32) ^ v48) & (a32 ^ v48) | (a32 ^ 0xEEF5EDB6) & (a33 ^ v48))
        + *((_DWORD *)*(&off_24C363D30 + v50 + a7 - 376) + v115 + v51 - 3)
        + (a41.i32[(*((_BYTE *)*(&off_24C363D30 + (int)((v50 + a7 + 763) & 0xC15F602A)) + v115 + v51 - 4)
                                   - 30)] ^ v49);
    v86 = v85 + v48 - (v52 & (2 * v85));
    v87 = (char *)*(&off_24C363D30 + v50 + a7 - 448) - 12;
    v88 = v86 ^ v48;
    v89 = v88 << (v87[v115 + v51] - 117);
    v90 = (v89 | (v88 >> (117 - v87[v115 + v51]))) + (a32 ^ v48);
    v91 = v52 & (2 * v90);
    v92 = (v90 + v48 - v91);
    v93 = (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, unint64_t, uint64_t (*)(__n128, __n128, __n128, __n128, __n128), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v47 + 8 * (v50 + a7 + 763)) - 8);
    LODWORD(v114) = BYTE4(a34) ^ 0xE;
    HIDWORD(v114) = HIDWORD(a12) + 483930687;
    return v93(v93, v91, v89, HIDWORD(a32), a32, v92, 703100222, a33, a9, a10, a11, a12, a13, v45, a15, v114, __PAIR64__(a32, HIDWORD(a31)), __PAIR64__(a33, HIDWORD(a32)), v54,
             v115,
             a21,
             a22,
             a23,
             a24,
             a25,
             a26,
             a27,
             a28,
             a29,
             a30,
             a31,
             a32,
             a33,
             a34,
             a35,
             a36,
             a37,
             a38,
             a39,
             a40);
  }
  else
  {
    HIDWORD(a31) = v48 + 2 * (HIDWORD(a31) ^ v48) - (v52 & (4 * (HIDWORD(a31) ^ v48)));
    LODWORD(a32) = 2 * (a32 ^ v48) + v48 - (v52 & (4 * (a32 ^ v48)));
    HIDWORD(a32) = 2 * (HIDWORD(a32) ^ v48) + v48 - (v52 & (4 * (HIDWORD(a32) ^ v48)));
    LODWORD(a33) = 2 * (a33 ^ v48) + v48 - (v52 & (4 * (a33 ^ v48)));
    return v54(v55, v56, v57, v58, v59);
  }
}

uint64_t sub_20AAAD328(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, uint64_t a15, int a16, unsigned int a17)
{
  uint64_t v17;
  int v18;
  _BOOL4 v19;

  if (a17 < 0x32C9BE94 != a14 - 846938128 < ((v18 + a7 + 798) ^ 0x32C9BBB8u))
    v19 = a14 - 846938128 < ((v18 + a7 + 798) ^ 0x32C9BBB8u);
  else
    v19 = a14 - 846938128 > a17;
  return ((uint64_t (*)(BOOL))(*(_QWORD *)(v17 + 8 * ((955 * !v19) ^ (v18 + a7 + 990))) - 12))(a14 - 846938128 > a17);
}

uint64_t sub_20AAAD3CC(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  int v4;
  uint64_t v5;
  char v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((23
                                          * (((v3 + a3 + 63 < (v3 + a3)) ^ (v4 - v6 - 117)) & 1)) ^ v4))
                            - 12))();
}

uint64_t sub_20AAAD418(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;

  return ((uint64_t (*)(void))(*(_QWORD *)(v16
                                        + 8
                                        * ((1730
                                          * (((a7 + v15 + 125) ^ (a13
                                                                                 + v14
                                                                                 - (unint64_t)(v13 - 1053271795 + ((v15 - 4986964) & 0xD9CEBEDF)) < 0x10)) & 1)) ^ v15))
                            - 12))();
}

uint64_t sub_20AAAD488(int8x16_t a1, double a2, double a3, double a4, int8x16_t a5, uint64_t a6, uint64_t a7, int a8, int a9)
{
  int v9;
  int8x16_t *v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;

  *v10 = vaddq_s8(vsubq_s8(*(int8x16_t *)(v14 + (v9 + a8)), vandq_s8(vaddq_s8(*(int8x16_t *)(v14 + (v9 + a8)), *(int8x16_t *)(v14 + (v9 + a8))), a5)), a1);
  return ((uint64_t (*)(void))(*(_QWORD *)(v12 + 8 * (((((v13 + v11 - 494) | v15) == 105) * a9) ^ (v13 + v11 - 110)))
                            - 12))();
}

uint64_t sub_20AAAD4E8@<X0>(int a1@<W2>, char a2@<W4>, char a3@<W6>, uint64_t a4@<X8>)
{
  int v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  *(_BYTE *)(v5 + a4) = ((3 * (v6 ^ (a3 + 13))) ^ a2)
                      + *(_BYTE *)(v10 + (v4 + a1))
                      - ((2 * *(_BYTE *)(v10 + (v4 + a1))) & 0xF7);
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * (((a4 != 63) * v7) ^ (v9 + v6 - 75))) - 12))();
}

uint64_t sub_20AAAD544(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  int v13;
  int v14;
  uint64_t v15;
  _BOOL4 v16;

  if (a13 + 1007217821 < (v14 ^ 0x51FA7DDEu) != (v13 - 323651058) < 0x51FA78F2)
    v16 = a13 + 1007217821 < (v14 ^ 0x51FA7DDEu);
  else
    v16 = v13 - 323651058 < (a13 + 1007217821);
  return ((uint64_t (*)(void))(*(_QWORD *)(v15 + 8 * ((105 * v16) ^ v14)) - 12))();
}

uint64_t sub_20AAAD5B4(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,int a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  int v39;

  v39 = a4 + 1246;
  v35 = 628203409 * ((((v34 - 120) | 0x2BC9FE79) - (v34 - 120) + ((v34 - 120) & 0xD4360180)) ^ 0xA941F24A);
  *(_QWORD *)(v34 - 120) = a10;
  *(_DWORD *)(v34 - 112) = v35 + a4 + 1631;
  *(_DWORD *)(v34 - 108) = a13 - v35 + 464356821;
  v36 = sub_20AABE384(v34 - 120);
  v37 = a33 & 0x3F;
  *(&a24 + (v37 ^ 0x2C)) = 123;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v33
                                                      + 8
                                                      * ((((v37 ^ 0x2C) > 0x37) * (v39 ^ 0x5AF)) ^ a4))
                                          - 12))(v36);
}

uint64_t sub_20AAAD6C4()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;

  return (*(uint64_t (**)(uint64_t))(v2
                                            + 8
                                            * (int)(((v3 + (v1 ^ 0x450) + ((v1 + 1099037435) | 0x9800A806) - 846)
                                                   * (v0 == 63)) ^ v1)))(-913941310);
}

uint64_t sub_20AAAD718(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  int v8;
  uint64_t v9;

  return (*(uint64_t (**)(void))(v9
                              + 8
                              * ((218
                                * ((v7 ^ 0xDC ^ (v8 - 177813887) & 0xA9938EFu) >= ((a7 + v8 - 350) ^ (a7 - 8)))) ^ v8)))();
}

uint64_t sub_20AAAD770@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, char a17)
{
  char v17;
  unsigned int v18;
  uint64_t v19;

  *(_QWORD *)(&a17 + a2 + a1) = 0xFBFBFBFBFBFBFBFBLL;
  return ((uint64_t (*)(void))(*(_QWORD *)(v19 + 8 * ((1202 * ((v18 ^ 0x191) - 342 == (v17 & 0x38))) ^ v18)) - 8))();
}

uint64_t sub_20AAAD7C4@<X0>(int a1@<W0>, unsigned int a2@<W1>, int a3@<W2>, int a4@<W8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, char a19)
{
  unsigned int v19;
  int v20;
  unsigned int v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL4 v26;
  unsigned int v27;
  int v28;
  _BOOL4 v29;

  v26 = v19 < v21;
  *(&a19 + 3 * (v22 ^ 0x53Cu) + a4 - 1950020655) = *(_BYTE *)(v25 + (v20 + a3))
                                                 - ((2 * *(_BYTE *)(v25 + (v20 + a3))) & 0xF7)
                                                 - 5;
  v27 = v20 + 1 + a1;
  v28 = v26 ^ (v27 < a2);
  v29 = v27 < v19;
  if (!v28)
    v26 = v29;
  return ((uint64_t (*)(void))(*(_QWORD *)(v24 + 8 * ((v26 * v23) ^ v22)) - 12))();
}

uint64_t sub_20AAAD844@<X0>(uint64_t a1@<X0>, int a2@<W6>, int a3@<W8>)
{
  int v3;
  uint64_t v4;
  int v5;

  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v4
                                                               + 8
                                                               * ((110 * ((a3 - 913941310) > 0x37)) ^ (v5 + v3 - 353)))
                                                   - (v3 - a2 + 148)
                                                   + 136))(a1, -913941310);
}

uint64_t sub_20AAAD894@<X0>(uint64_t a1@<X1>, unsigned int a2@<W8>)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a2;
  v5 = a1 + a2;
  if ((unint64_t)(v5 + 1) > 0x38)
    v6 = v5 + 1;
  else
    v6 = 56;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((((v2 + 1307) ^ 0x5F5) * ((unint64_t)(v6 - v4 + 913941310) > 7)) ^ v2))
                            - (v2 + 1661)
                            + 1797))();
}

uint64_t sub_20AAAD8F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,char a23)
{
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;

  *(_QWORD *)(&a23 + v24 + a2) = 0xFBFBFBFBFBFBFBFBLL;
  return ((uint64_t (*)(void))(*(_QWORD *)(v26
                                        + 8
                                        * ((27 * ((((v25 - 7) ^ 0xFFFFFFFFFFFFF8F2) & v23) != 8)) ^ (v25 - 7)))
                            - ((v25 - 7) ^ 0x702)))();
}

uint64_t sub_20AAAD954(double a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  *(double *)(v3 + v6) = a1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * (((v4 != v6) * v5) ^ v1)) - (v2 ^ 0x9C)))();
}

uint64_t sub_20AAAD980()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  int v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((((v4 + ((v2 - 2139062415) | 0x5902280A) + 1002) ^ (v2 - 2554069) & 0x26FDEF)
                                          * (v0 == v1)) ^ v2))
                            - 12))();
}

void sub_20AAAD9DC()
{
  JUMPOUT(0x20AAAC7CCLL);
}

uint64_t sub_20AAADE38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;

  return (*(uint64_t (**)(void))(v10 + 8 * (((a7 + v9 - 350 + v9 - v11 + 176 + 1291498544) * (v8 == v7)) ^ v9)))();
}

void sub_20AAADE84()
{
  JUMPOUT(0x20AAAC7CCLL);
}

uint64_t sub_20AAADE94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, char a17)
{
  int v17;
  uint64_t v18;
  int v19;

  *(&a17 + a2 + a1) = -5;
  return (*(uint64_t (**)(void))(v18 + 8 * ((665 * ((unint64_t)(a2 + 1 + a1) < 0x40)) ^ (v19 + v17 + 770))))();
}

uint64_t sub_20AAADF40@<X0>(uint64_t a1@<X2>, char a2@<W6>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,int a30)
{
  unsigned int v30;
  char v31;
  int v32;
  int v33;
  uint64_t v34;
  int v35;
  _BOOL4 v36;

  v35 = *((_DWORD *)&a18 + ((v33 + a3) >> (v32 ^ (a2 - 14) ^ v31)) + 18);
  *(_BYTE *)(a1 + (v33 + a3 + 1)) = (BYTE2(v35) ^ 0xA) + (~(2 * (BYTE2(v35) ^ 0xA)) | 9) - 4;
  *(_BYTE *)(a1 + (v33 + a3)) = (HIBYTE(v35) ^ 0x11) - ((2 * (HIBYTE(v35) ^ 0x11)) & 0xF7) - 5;
  *(_BYTE *)(a1 + (v33 + a3 + 2)) = (BYTE1(v35) ^ 0x12) - ((2 * (BYTE1(v35) ^ 0x12)) & 0xF7) - 5;
  *(_BYTE *)(a1 + (v33 + a3 + 3)) = v35 ^ 0xB2;
  v36 = v33 + 541007880 < (a30 - 821356910);
  if (v33 + 541007880 < v30 != a30 - 821356910 < v30)
    v36 = a30 - 821356910 < v30;
  return ((uint64_t (*)(void))(*(_QWORD *)(v34 + 8 * (v36 | (16 * v36) | v32)) - 12))();
}

void sub_20AAAE0D8()
{
  JUMPOUT(0x20AAAE0A8);
}

uint64_t sub_20AAAE0E4()
{
  return 0;
}

void sub_20AAAE124(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  char v6;
  char v7;

  v2 = (unint64_t)&v7 ^ qword_2546140D0 ^ qword_254614AD8;
  v3 = 1801249171 * v2 + 0x4AADAB03756D799ELL;
  v4 = 1801249171 * (v2 ^ 0x8915C65683065AAALL);
  qword_2546140D0 = v3;
  v5 = (-109 * ((v4 - v3) ^ 0xAA));
  v6 = byte_20AB077E0[byte_20AB12A20[v5] ^ 0xBF];
  qword_254614AD8 = v4;
  ((void (*)(char *, void (*)()))*(&off_24C363D30
                                            + ((-109 * ((v4 - v3) ^ 0xAA)) ^ v6)
                                            + 100))((char *)*(&off_24C363D30+ ((-109 * ((v4 - v3) ^ 0xAA)) ^ byte_20AB0AF60[byte_20AB078E0[v5] ^ 0x3A])- 78)- 12, sub_20AAE6074);
  __asm { BR              X9 }
}

uint64_t sub_20AAAE234@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((655 * (**(_QWORD **)(v1 + 1440) != 0)) ^ 0x490u)) - 4))();
}

uint64_t sub_20AAAE260()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(v1 + 1176))(v0);
}

void sub_20AAAE288(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 32) - 1224239923 * ((-2 - ((a1 | 0xAACC30C4) + (~(_DWORD)a1 | 0x5533CF3B))) ^ 0xA78032EC);
  __asm { BR              X15 }
}

void sub_20AAAE3B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_DWORD *)(a3 + v3) = 311742309;
}

void sub_20AAAF2F4(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 4) - 535753261 * (a1 ^ 0xAF40E2F);
  __asm { BR              X9 }
}

uint64_t sub_20AAAF380@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((698
                                          * (((((a1 ^ 0x649) + 95) ^ 0x3E4) & *(_DWORD *)(v2 - 0x140B289DC8FEE240)) == 0)) ^ a1))
                            - 12))();
}

uint64_t sub_20AAAF3C8(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v2
                                                    + 8
                                                    * ((1937
                                                      * ((v1 ^ 0x372)
                                                       + 495
                                                       + *(_DWORD *)(v3 - 0x140B289DC8FEE248)
                                                       - 2058997440 == 2 * (v1 ^ 0x372) - 488)) ^ v1)))(a1, *(_QWORD *)(v3 - 0x140B289DC8FEE254));
}

void sub_20AAAF438(uint64_t a1@<X1>, int a2@<W8>)
{
  int v2;
  uint64_t v3;
  uint64_t v5;
  int v6;
  unint64_t v7;
  _BYTE v8[80];

  v6 = v2 + 509;
  (*(void (**)(_QWORD, uint64_t, _QWORD))(v3 + 8 * (v2 - 302)))(**(unsigned int **)(v3 + 8 * (v2 - 261)), a1, *(_DWORD *)(v5 - 0x140B289DC8FEE24CLL) + ((v2 + 509) ^ (a2 + 1670)));
  v7 = ((unint64_t)v8 ^ 0x5FFFAFCEEF3FEBB7)
     - 0x441C248044211FB7
     + ((2 * (_QWORD)v8) & 0xBFFF5F9DDE7FD760);
  *(_BYTE *)(v5 - 0x140B289DC8FEE254 + ((v6 - 837) | 0x148u) - 457) = (v7 ^ 0xBA) * (v7 + 17);
  __asm { BR              X13 }
}

void sub_20AAAF5C4()
{
  JUMPOUT(0x20AAAF598);
}

void sub_20AAAF5CC()
{
  int v0;
  uint64_t v1;

  (*(void (**)(void))(v1 + 8 * (v0 - 462)))();
  JUMPOUT(0x20AAAF5E4);
}

void Fc3vhtJDvr(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  BOOL v5;
  int v6;

  if (a4)
    v5 = a5 == 0;
  else
    v5 = 1;
  v6 = !v5;
  __asm { BR              X8 }
}

uint64_t sub_20AAAF678(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, _DWORD *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, unsigned int a20)
{
  uint64_t v20;
  unsigned int v21;
  int v22;
  uint64_t v23;

  *a4 = 0;
  *a5 = 0;
  a20 = 108757529 * ((&a19 & 0xA7DA3C6 | ~(&a19 | 0xA7DA3C6)) ^ 0x151E3E12) - 504207030;
  v23 = sub_20AAE5C84(&a19);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v20 + 8 * ((998 * (a19 == v22)) ^ v21)) - 4))(v23);
}

uint64_t sub_20AAAF704(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, unint64_t *a19, unsigned int a20,unsigned int a21,int a22)
{
  uint64_t v22;
  int v23;
  uint64_t v24;
  unsigned int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v25 = 1759421093 * ((&a19 + 1468359642 - 2 * (&a19 & 0x578563DA)) ^ 0xE4F8D38E);
  LODWORD(a19) = v25 ^ 0x1F2726AC;
  HIDWORD(a19) = v25 ^ 0x24D21C9;
  a20 = v25 + 1609;
  a22 = v25 ^ 0x445509ED;
  (*(void (**)(unint64_t **))(v24 + 1456))(&a19);
  if (a21 < 0x48EDB6D0)
    v26 = 1;
  else
    v26 = 2;
  HIDWORD(a11) = a21;
  LODWORD(a12) = v26;
  a19 = &STACK[0x7EF87141C217A9F9];
  a21 = 178 - 460628867 * ((2 * (&a19 & 0x7833EB38) - &a19 - 2016668474) ^ 0xCB5A96BB);
  sub_20AAE2E14((uint64_t)&a19);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 + 8 * ((933 * (a20 == v23)) ^ 0x1E7u)) - 4))(v27, v28, v29, v30, v31, v32, v33, v34, a9, a10, a11, a12);
}

uint64_t sub_20AAAF824(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, unsigned int a20,uint64_t a21,unsigned int a22,uint64_t a23)
{
  uint64_t v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  unsigned int v29;
  uint64_t v30;

  v28 = 1178560073 * (&a19 ^ 0xBA947862);
  a21 = a16;
  a22 = v28 ^ 0xEE;
  a20 = (v25 ^ 0x77BE7FCD) + ((2 * v25) & 0xEF7CFF9A) - 1619141184 + v28;
  sub_20AAA1514((uint64_t)&a19);
  v29 = 1178560073 * ((2 * (&a19 & 0x3EDA6648) - &a19 + 1092983221) ^ 0xFBB1E1D7);
  a22 = ((v24 ^ 0xDFDF6A75) + 738123696 + ((2 * v24) & 0xBFBED4EA)) ^ v29;
  a21 = a16;
  a20 = v29 + 405;
  a23 = v23;
  v30 = ((uint64_t (*)(int *))(*(_QWORD *)(v27 + 1376) - 12))(&a19);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v26 + 8 * ((1345 * (a19 == 306494155)) ^ 0xCCu)) - 8))(v30);
}

uint64_t sub_20AAAF970(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, unint64_t *a19, uint64_t a20,unsigned int a21,unsigned int a22,unsigned int a23,int a24)
{
  int v24;
  uint64_t v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t v28;

  v27 = 460628867 * (((&a19 | 0x8BAEE036) - (&a19 & 0x8BAEE036)) ^ 0xC738624B);
  a21 = v27 + 1067116223;
  a22 = v27 + v26 - 2024873287;
  a23 = (a12 << ((v26 + 43) & 0x4F ^ 0x46)) - v27 + (a12 ^ ((v26 + 181) | 0x66) ^ 0xEFAFEEE0) + 1609760763;
  a19 = &STACK[0x61B876722A6C08F];
  a20 = a16;
  v28 = sub_20AAE5D1C((uint64_t)&a19);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v25 + 8 * ((984 * (a24 == v24)) ^ v26)) - 8))(v28);
}

uint64_t sub_20AAAFA70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, unsigned int a12)
{
  int v12;
  uint64_t v13;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13
                                                                                 + 8
                                                                                 * (v12 ^ (1589
                                                                                         * (a12 < 0x48EDB6D0))))
                                                                     - ((v12 + 697) | 0x11Du)
                                                                     + 1297))(a1, a2, a3, a4);
}

uint64_t sub_20AAAFB0C@<X0>(uint64_t a1@<X8>, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, int a6, char a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, _BYTE *a12, unsigned int a13, char *a14, _BYTE *a15, uint64_t a16, unsigned int a17)
{
  int v17;
  _BYTE *v18;
  uint64_t v19;
  int v20;
  void (*v21)(unsigned int *);
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;

  a13 = (v20 - 30) ^ (((2 * (&a13 & 0x2924B9A8) - &a13 - 690272685) ^ 0xBB2F5E5A) * v17);
  a14 = &a7 + a1;
  a15 = a12;
  v24 = v18;
  v21(&a13);
  a17 = ((v20 ^ 0x45A) - 1040) ^ (1225351577
                                * ((1086188513 - (&a13 | 0x40BDEBE1) + (&a13 | 0xBF42141E)) ^ 0x9CD8CC08));
  a15 = v24;
  a16 = v19;
  a14 = a12;
  ((void (*)(unsigned int *))(*(_QWORD *)(v23 + 8 * ((v20 ^ 0x45A) - 1087)) - 8))(&a13);
  a13 = ((v20 ^ 0x45A) - 1012) ^ (1374699841
                                * ((&a13 & 0xE2FB435A | ~(&a13 | 0xE2FB435A)) ^ 0x70F0A4AC));
  a14 = a3;
  a15 = a12;
  v21(&a13);
  a13 = ((v20 ^ 0x45A) - 267) ^ (1755732067
                               * ((-1423174657 - (&a13 | 0xAB2C13FF) + (&a13 | 0x54D3EC00)) ^ 0x8A1551DB));
  a14 = a12;
  v25 = sub_20AABD7C8((uint64_t)&a13);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v22
                                                      + 8
                                                      * ((((_DWORD)a15 == 68 * (v20 ^ 0x144) + 306493951)
                                                        * ((((v20 ^ 0x45A) - 1281) | 0x1C0) ^ 0x223)) ^ v20 ^ 0x45A))
                                          - 4))(v25);
}

uint64_t sub_20AAAFCF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, int a16)
{
  int v16;
  uint64_t v17;
  int v18;

  return (*(uint64_t (**)(void))(v17
                              + 8
                              * ((((((v18 - 16) ^ (a16 == v16)) & 1) == 0) * (2 * (v18 ^ 0x124) - 452)) ^ v18)))();
}

uint64_t sub_20AAAFD2C@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11)
{
  int v11;
  int v12;
  uint64_t v13;

  return (*(uint64_t (**)(void))(v13 + 8 * (((v11 & ~((a1 + 770) ^ (a11 == v12))) * (a1 + 72)) ^ a1)))();
}

uint64_t sub_20AAAFD64()
{
  int v0;
  unsigned int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  _BOOL4 v5;

  v5 = (*(uint64_t (**)(_QWORD, uint64_t))(v4 + 8 * (v2 ^ 0x410)))(v0 ^ v1, 1523128792) == 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((v5 * (((v2 + 185) ^ 0x488) + v2 - 1062)) ^ v2)) - 4))();
}

uint64_t sub_20AAAFDBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18)
{
  int v18;
  uint64_t v19;
  int v20;
  unsigned int v21;

  v21 = ((v20 + 896798803) & 0xCA8BEBF1) + (a18 ^ v18) - ((2 * (a18 ^ v18)) & 0x7176B88) - 2087996460;
  return ((uint64_t (*)(void))(*(_QWORD *)(v19
                                        + 8
                                        * ((120
                                          * (((2 * v21) & 0xDFFFDFFF ^ 0x7174B88)
                                           + (((v20 - 367) | 0x300) ^ 0x6C745D07 ^ v21)
                                           + 2125960711 != 1857521158)) ^ v20))
                            - 8))();
}

uint64_t sub_20AAAFE64(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;

  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v6
                                                               + 8
                                                               * (int)(((a3 + v5 + 268439553 < ((v4 - 1747018046) & 0x68215E99u)
                                                                                             - 1168)
                                                                      * (((v4 + 41941823) | 0xA8052D80) + 1434112101)) ^ v4))
                                                   - 4))(a1, v3);
}

uint64_t sub_20AAAFEF0(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v6
                                                               + 8
                                                               * ((((unint64_t)(v4 - a1) < 0x20) ^ (a4 + 103)) & 1 | a4))
                                                   - (a4
                                                    - 361)
                                                   + 807))(a1, v5);
}

uint64_t sub_20AAAFF38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int v6;
  unsigned int v7;
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8
                                        + 8
                                        * (int)(((((a6 - 1413649200) ^ 0xABBD6C80)
                                                + v6
                                                + ((a6 - 1413649200) & 0xFEC7BFFB))
                                               * (v7 < 0x20)) ^ a6))
                            - 12))();
}

uint64_t sub_20AAAFF80(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;

  v11 = v9 + a3 + a5;
  v12 = v6 + v11;
  v13 = *(_OWORD *)(v12 - 31);
  v14 = a1 + v11;
  *(_OWORD *)(v14 - 15) = *(_OWORD *)(v12 - 15);
  *(_OWORD *)(v14 - 31) = v13;
  return (*(uint64_t (**)(void))(v10
                              + 8
                              * (int)((((v7 & 0xFFFFFFE0) != 32) * (((v8 - 1187907592) & 0x9C48DD8F) - 393)) ^ (v5 + v8 + 2248))))();
}

void sub_20AAAFFE8()
{
  JUMPOUT(0x20AAAFFACLL);
}

uint64_t sub_20AAAFFF4(uint64_t a1)
{
  int v1;
  int v2;
  _QWORD *v3;
  int v4;
  _DWORD *v6;
  void (*v7)(_BYTE *);
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[4];
  unsigned int v11;
  uint64_t v12;

  *v3 = a1;
  *v6 = v2;
  v4 = (v1 - 1588155889) & 0x5EA955E7;
  v11 = v1 - 292 + 535753261 * (v10 ^ 0xAF40E2F) + 284;
  v12 = v9;
  v7(v10);
  v12 = v8;
  v11 = v4
      + 535753261
      * ((-1638172144 - (v10 ^ 0x8162DB63 | 0x9E5B7A10) + (v10 ^ 0x8162DB63 | 0x61A485EF)) ^ 0xEA3250A3)
      + 1;
  v7(v10);
  return 0;
}

void sub_20AAB0294(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = *(_DWORD *)(a1 + 8) ^ (3804331 * ((2 * (a1 & 0x520CC9FF) - a1 - 1376569856) ^ 0xD32613F6));
  v2 = *(_QWORD *)a1;
  ((void (*)(char *, void (*)()))*(&off_24C363D30 + (v1 ^ 0x453)))((char *)*(&off_24C363D30 + v1 - 1120) - 12, sub_20AAE6074);
  __asm { BR              X12 }
}

uint64_t sub_20AAB0364@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (((((a1 + 1) ^ (**(_QWORD **)(v3 + 8 * (a1 ^ 0x1B6)) == 0)) & 1)
                                          * v1) ^ a1))
                            - 12))();
}

uint64_t sub_20AAB03A0()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t))(v2 + 8 * (v0 ^ 0x191)))(v1);
}

void sub_20AAB03D0(uint64_t a1)
{
  int v1;
  _BOOL4 v4;

  v4 = *(_QWORD *)(a1 + 40) != 0x140B289DC8FEE254
    && *(_QWORD *)(a1 + 16) != 0x35FF68D50C8F4093
    && *(_QWORD *)a1 != 0x25B2EEE794ECC2EBLL;
  v1 = *(_DWORD *)(a1 + 8) + 535753261 * ((((2 * a1) | 0xD63BF148) - a1 - 1797126308) ^ 0x61E9F68B);
  __asm { BR              X10 }
}

uint64_t sub_20AAB04DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t v19;
  int v20;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v19
                                                                                         + 8
                                                                                         * (((*(_DWORD *)(a19 - 0x140B289DC8FEE23CLL) == 306494155)
                                                                                           * (v20 - 246)) ^ v20)))(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_20AAB0520(__n128 a1, __n128 a2, __n128 a3, __n128 a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  uint64_t v23;
  int v24;
  __n128 v25;
  __n128 v26;
  unsigned int v27;
  _BOOL4 v28;

  v25.n128_u64[0] = 0xF6F6F6F6F6F6F6F6;
  v25.n128_u64[1] = 0xF6F6F6F6F6F6F6F6;
  v26.n128_u64[0] = 0xFCFCFCFCFCFCFCFCLL;
  v26.n128_u64[1] = 0xFCFCFCFCFCFCFCFCLL;
  v27 = *(_DWORD *)(a23 - 0x140B289DC8FEE244) + ((v24 - 319) ^ 0x7C64ED39);
  v28 = v27 < 0xB444AC99;
  if (v27 >= 0xB444AC99)
    v28 = v27 > 0xB444AC99;
  return ((uint64_t (*)(__n128, __n128, __n128, __n128, __n128, __n128))(*(_QWORD *)(v23
                                                                                             + 8
                                                                                             * ((!v28
                                                                                               * (74
                                                                                                * ((v24 - 319) ^ 0xC0)
                                                                                                - 482)) | (v24 - 319) ^ 0x4C6))
                                                                                 - ((((v24 - 319) ^ 0xC0u) + 511) ^ 0x20ALL)))(a1, a2, a3, a4, v25, v26);
}

uint64_t sub_20AAB075C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14, _DWORD *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  int v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;

  v23 = 1759421093 * ((v22 - 1791438490 - 2 * ((v22 - 136) & 0x9538D1EE)) ^ 0x264561BA);
  *(_DWORD *)(v22 - 120) = v20 - v23 + 738;
  *(_QWORD *)(v22 - 128) = a20;
  *(_DWORD *)(v22 - 136) = (((v20 - 1753827471) & 0x688946E9 ^ 0xFFFFFF91) & (a2 - 321612184)) - v23 + 854218192;
  *(_DWORD *)(v22 - 132) = v23 + a2 - a14 + 1627931695;
  v24 = ((uint64_t (*)(uint64_t))*(&off_24C363D30 + v20 - 340))(v22 - 136);
  return (*(uint64_t (**)(uint64_t))(v21 + 8 * ((293 * (*a15 == 306494155)) ^ v20)))(v24);
}

uint64_t sub_20AAB0850(__n128 a1, __n128 a2, __n128 a3, __n128 a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, unsigned int a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21,int a22,uint64_t a23,uint64_t a24,uint64_t a25,unsigned int a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,int a31,unsigned int a32)
{
  int v32;
  uint64_t v33;
  __n128 v34;
  __n128 v35;

  HIDWORD(a16) = v32 + 931881372;
  v34.n128_u64[0] = 0xF6F6F6F6F6F6F6F6;
  v34.n128_u64[1] = 0xF6F6F6F6F6F6F6F6;
  v35.n128_u64[0] = 0xFCFCFCFCFCFCFCFCLL;
  v35.n128_u64[1] = 0xFCFCFCFCFCFCFCFCLL;
  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, __n128, __n128, __n128, __n128, __n128, __n128, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 + 8 * (int)((((a22 + 2084412542) & 0x83C2637D ^ 0x77E) * (a17 < 0xFFFFFFFE)) ^ a22)) - ((a22 + 2126788053) & 0x813BCBCF ^ 0x20ELL)))(1746491854, 881395401, a26, a25, 3533983417, a10, 2162665185, a32, a1, a2, a3, a4, v34, v35, a13, a14, a15, a16);
}

uint64_t sub_20AAB0924(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v16;
  int v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  char v22;
  uint64_t (*v23)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v24;
  unsigned int v25;

  v23 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 + 8 * v16) + (v16 + 1862) - 1967);
  v24 = *v21;
  v25 = v17 + 1746491854;
  *(_BYTE *)(*v21 + v25) = (v19 ^ 0xEA) - ((2 * (v19 ^ 0xEA)) & 0xF7) - 5;
  *(_BYTE *)(v24 + v25 + 1) = (v22 ^ 0x5F) + (v18 | ~(2 * (v22 ^ 0x5F))) - 4;
  *(_BYTE *)(v24 + (v17 + 1746491856)) = -30;
  *(_BYTE *)(v24 + v25 + 3) = -93;
  return v23(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16);
}

void sub_20AAB0D28()
{
  JUMPOUT(0x20AAB0CB4);
}

void sub_20AAB0D3C()
{
  JUMPOUT(0x20AAB0CB4);
}

uint64_t sub_20AAB0D58(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,int a25)
{
  uint64_t v25;
  int v26;
  int v27;
  int v28;
  int v29;

  v28 = a25 ^ (v27 + 597) ^ ((v26 + 613) | 0x380);
  v29 = v28 - ((v28 << (((v26 + 90) | 1) ^ 0x60)) & 0x74AD2548) - 1168731484;
  return ((uint64_t (*)(void))(*(_QWORD *)(v25
                                        + 8
                                        * ((1734
                                          * (((2 * v29) & 0xEFDB3F9A ^ 0x64892508) + (v29 ^ 0x4DBB0D69) + 1016817404 != a2)) ^ (v26 + 328)))
                            - 8))();
}

uint64_t sub_20AAB0E20()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(uint64_t, _QWORD))(*(_QWORD *)(v4
                                                              + 8
                                                              * (((((v3 - 1859) | 0x456) ^ 0xB1A)
                                                                * ((v1 + v0 + 135422003) < 8)) ^ v3))
                                                  - 4))(v2, (v3 - 1509));
}

uint64_t sub_20AAB0E94(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  return ((uint64_t (*)(uint64_t, _QWORD))(*(_QWORD *)(v25
                                                              + 8
                                                              * (a3 ^ (504
                                                                     * ((unint64_t)(a23
                                                                                         - v23
                                                                                         - a4
                                                                                         - 0x3213C18841E3F835) < 0x20))))
                                                  - 12))(v24, a3 ^ 0x6F8u);
}

uint64_t sub_20AAB0EE0(uint64_t a1, uint64_t a2, int a3)
{
  unsigned int v3;
  uint64_t v4;

  return (*(uint64_t (**)(void))(v4
                              + 8
                              * (((((((210 * (a3 ^ 0x4EF)) ^ 0xFF4) + 769) | 0x20) ^ 0x525) * (v3 < 0x20)) ^ (105 * (a3 ^ 0x4EF)))))();
}

uint64_t sub_20AAB0F2C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  int8x8_t v11;
  int8x8_t v12;
  unsigned int v13;
  unsigned int v14;
  int8x8_t v15;

  v13 = (a3 + 1306518128) & 0xB2201D7D;
  v14 = v7 + 135420701 + v6 + v13 - v9;
  v15 = vrev64_s8(*(int8x8_t *)(v4 - 7 + v14));
  *(int8x8_t *)(v3 - 7 + v14) = vrev64_s8(vadd_s8(vadd_s8(v15, v12), vmvn_s8(vand_s8(vadd_s8(v15, v15), v11))));
  return (*(uint64_t (**)(_QWORD))(v10 + 8 * (int)((50 * (((v13 ^ 0xFFFFFAED) & v5) != v9 + 8)) ^ v13)))(v8 - ((v13 ^ 0xFFFFFAED) & v5));
}

void sub_20AAB0FBC()
{
  JUMPOUT(0x20AAB0F7CLL);
}

uint64_t sub_20AAB0FC8()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v2
                                                      + 8
                                                      * ((470 * (v0 - v3 - 1435964354 != ((v1 - 649) ^ 0x69C3E7D))) ^ v1))
                                          - 12))(615);
}

uint64_t sub_20AAB103C()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((350 * (((v0 == 1226987) ^ (v1 - 90)) & 1)) ^ v1))
                            - 8))();
}

uint64_t sub_20AAB107C@<X0>(int a1@<W6>, int a2@<W8>)
{
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  int v7;
  _QWORD *v8;

  *(_BYTE *)(*v8 + (v7 + a1)) = *(_BYTE *)(*v8 + (v4 + a2));
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * (((v2 != 1226988) * v5) ^ v3)) - 8))();
}

uint64_t sub_20AAB10D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,int a27)
{
  int v27;
  int v28;
  int v29;
  uint64_t v30;
  int v31;
  unsigned int v32;
  int v33;
  unsigned int v34;
  _BOOL4 v35;

  v31 = v29 + 421;
  v32 = v28 + v27 + ((v29 + 421) ^ 0xFFED4513);
  v33 = v29 + 1218;
  v34 = a27 + 654905312 + ((v31 - 310) | 2);
  v35 = v32 + 1592315725 < v34;
  if (v34 < 0x3A347A4A != v32 + 1592315725 < 0x3A347A4A)
    v35 = v34 < 0x3A347A4A;
  return (*(uint64_t (**)(void))(v30 + 8 * ((74 * !v35) ^ v33)))();
}

void sub_20AAB13B8()
{
  JUMPOUT(0x20AAB13D0);
}

uint64_t sub_20AAB14B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  int v13;
  int v14;
  uint64_t v15;
  _QWORD *v16;
  _BOOL4 v17;

  *(_BYTE *)(*v16 + (v13 + a7)) = 123;
  if ((v13 + 1710898055) < 0xE51294A5 != a13 - 1383648487 < ((v14 + 308) ^ 0xE51296A3))
    v17 = a13 - 1383648487 < ((v14 + 308) ^ 0xE51296A3);
  else
    v17 = v13 + 1710898055 < (a13 - 1383648487);
  return ((uint64_t (*)(void))(*(_QWORD *)(v15 + 8 * ((59 * v17) ^ v14)) - 12))();
}

uint64_t sub_20AAB1534(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  unsigned int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  uint64_t v15;
  _QWORD *v16;
  _BOOL4 v17;
  unsigned int v18;
  int v19;
  _BOOL8 v20;

  v17 = v12 < v13;
  v18 = (v11 ^ v9) + v8;
  *(_BYTE *)(*v16 + (v8 + 1 + a7)) = -5;
  v19 = v17 ^ (v18 < v7);
  v20 = v18 < v12;
  if (!v19)
    v17 = v20;
  return ((uint64_t (*)(_BOOL8))(*(_QWORD *)(v15 + 8 * ((v17 * v14) ^ v10)) - 12))(v20);
}

void sub_20AAB1588(int a1@<W8>)
{
  _QWORD *v1;
  unsigned int v2;
  _DWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v4 - 0x35FF68D50C8F4093) = *v1;
  *(_DWORD *)(v5 - 0x25B2EEE794ECC2EBLL) = a1;
  *v1 = 0;
  *(_QWORD *)(v8 - 0x140B289DC8FEE24CLL) = 0x7AB9CBDD7AB9CBDDLL;
  *v3 = 937410203;
  v2 = ((*(_DWORD *)(v8 - 0x140B289DC8FEE240) & 0xFFFFFFFE ^ 0xB62D300)
      - ((2 * (*(_DWORD *)(v8 - 0x140B289DC8FEE240) & 0xFFFFFFFE ^ 0xB62D300)) & 0xCAC6D7DC)
      + 1701014510) ^ 0x64634BED;
  *(_DWORD *)(v8 - 0x140B289DC8FEE240) = ((v2 | 0x1C2BE6E3) - (v2 | 0xE3D4191C) - 472639204) ^ 0x164915E1;
  *(_DWORD *)(v7 + 28) = *v6;
}

void cp2g1b9ro(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  int v3;

  if (a1)
    v2 = a2 == 0;
  else
    v2 = 1;
  v3 = !v2;
  __asm { BR              X8 }
}

uint64_t sub_20AAB173C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, unsigned int a15)
{
  int v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;

  a15 = 108757529 * ((&a14 & 0x2A42C21B | ~(&a14 | 0x2A42C21B)) ^ 0x35215FCF) - 504207030;
  v18 = sub_20AAE5C84(&a14);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v16 + 8 * ((923 * (a14 == v15)) ^ v17)) - 4))(v18);
}

uint64_t sub_20AAB17B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unint64_t *a14, int a15, unsigned int a16)
{
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  a14 = &STACK[0x7EF87141C217A9D9];
  a16 = 178 - 460628867 * (&a14 ^ 0x4C96827D);
  sub_20AAE2E14((uint64_t)&a14);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 + 8 * ((26 * (a15 == v16)) ^ 0x4CEu))
                                                                                                - 4))(v18, v19, v20, v21, v22, v23, v24);
}

uint64_t sub_20AAB1824(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, uint64_t a15, unsigned int a16, uint64_t a17)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  a17 = v17;
  a15 = a12;
  a16 = 1224239923 * (((&a14 | 0xF44D2E8E) - (&a14 & 0xF44D2E8E)) ^ 0x6FED359) + 415;
  v20 = ((uint64_t (*)(int *))(*(_QWORD *)(v19 + 32) - 12))(&a14);
  return (*(uint64_t (**)(uint64_t))(v18 + 8 * ((1641 * (a14 == 306494155)) ^ 0xAAu)))(v20);
}

uint64_t sub_20AAB18CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unint64_t *a14, uint64_t a15, unsigned int a16, unsigned int a17, unsigned int a18, int a19)
{
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  unsigned int v23;
  uint64_t v24;

  v23 = ((&a14 + 20623017 - 2 * (&a14 & 0x13AAEA9)) ^ 0x4DAC2CD4) * v21;
  a16 = v23 + 1864388342;
  a17 = v23 + v22 - 2024873253;
  a14 = &STACK[0x61B876722A6C057];
  a15 = a12;
  a18 = 1336078083 - v23;
  v24 = sub_20AAE5D1C((uint64_t)&a14);
  return (*(uint64_t (**)(uint64_t))(v20 + 8 * (((a19 == ((v22 + 521) ^ (v19 - 595))) * (v22 ^ 0x62B)) ^ v22)))(v24);
}

uint64_t sub_20AAB199C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unint64_t *a11, uint64_t a12, uint64_t a13, unsigned int a14, unint64_t *a15, unint64_t *a16)
{
  int v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  void (*v20)(unsigned int *);
  uint64_t v21;

  a14 = (v19 - 394) ^ (1374699841
                     * (((&a14 | 0xFF3CBB1A) - &a14 + (&a14 & 0xC344E0)) ^ 0x92C8A313));
  a15 = &STACK[0x33AA5AD2543300E3];
  a16 = a11;
  v20 = *(void (**)(unsigned int *))(v18 + 8 * (v19 ^ 0x2DB));
  v20(&a14);
  a15 = &STACK[0x33AA5AD2543300E7];
  a16 = a11;
  a14 = (v19 - 394) ^ (1374699841
                     * ((2 * (&a14 & 0x401B28F8) - &a14 - 1075521788) ^ 0xD210CF0D));
  v20(&a14);
  a15 = a11;
  a14 = (v19 + 351) ^ (1755732067
                     * (((&a14 | 0x99152A71) + (~&a14 | 0x66EAD58E)) ^ 0x47D397AB));
  v21 = sub_20AABD7C8((uint64_t)&a14);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v17 + 8 * ((108 * ((_DWORD)a16 == v16)) ^ v19))
                                          - ((v19 - 3326692) & 0xEF89723B)
                                          + 4018745859))(v21);
}

uint64_t sub_20AAB1B00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14)
{
  unint64_t v14;
  int v15;
  uint64_t v16;
  unsigned int v17;

  return ((uint64_t (*)(void))(*(_QWORD *)(v16 + 8 * ((1432 * (a14 == v15)) ^ v17)) - ((v17 - 276222120) ^ v14)))();
}

uint64_t sub_20AAB1B38()
{
  _QWORD *v0;
  void (*v1)(_BYTE *);
  int v2;
  int v3;
  unsigned int v4;
  uint64_t v6;
  uint64_t v7;
  int v8;
  _BYTE v9[4];
  unsigned int v10;
  uint64_t v11;

  v4 = (v3 - 150408) & 0xEF893ADF;
  *v0 = v8 ^ v4 ^ 0xFDCD88C0;
  v11 = v6;
  v10 = 535753261 * ((((2 * v9) | 0x952C103E) - v9 + 896137185) ^ 0xC0620630)
      + 276221917
      + v4;
  v1(v9);
  v11 = v7;
  v10 = 535753261 * ((v9 + 2115814188 - 2 * ((unint64_t)v9 & 0x7E1CC32C)) ^ 0x74E8CD03)
      + 276221917
      + v4;
  v1(v9);
  return v2 ^ 0x1244BACBu;
}

void sub_20AAB1C5C(uint64_t a1)
{
  int v1;
  int v2;
  _BYTE v3[4];
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v1 = *(_DWORD *)a1 - 108757529 * ((-2 - ((a1 | 0x1E625E8E) + (~(_DWORD)a1 | 0xE19DA171))) ^ 0x101C35A);
  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 8) - 0x4FF3ADA337C70001);
  v5 = *(_QWORD *)(a1 + 8);
  v4 = (460628867 * ((1910704469 - (v3 | 0x71E30955) + (v3 | 0x8E1CF6AA)) ^ 0xC28A74D7)) ^ (v1 + 618);
  sub_20AABC954((uint64_t)v3);
  __asm { BR              X9 }
}

uint64_t sub_20AAB1D9C@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;

  return (*(uint64_t (**)(void))(a1 + 8 * (((v1 + 575 + (v1 ^ 0x323) - 1770) * (((v3 ^ v2) & 0x1F) == 0x19)) ^ v1)))();
}

uint64_t sub_20AAB1E04@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * (v2 ^ (82
                                               * ((v3 ^ 0xFE47FD8F) + 1740208884 + (v1 & 0xFC8FFB1E) - 1711372420 < 0x7FFFFFFF))))
                            - ((v2 + 121) ^ (116 * (v2 ^ 0x41Bu)) ^ 0x6DBLL)))();
}

uint64_t sub_20AAB1E7C@<X0>(uint64_t a1@<X8>)
{
  int v1;
  unsigned int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  *(_DWORD *)(*(_QWORD *)(v6 - 0x4FF3ADA337C6FFFDLL) + 4 * ((v5 ^ 0x19FF131A) + v1 + v4)) = *(_DWORD *)(*(_QWORD *)(v6 - 0x4FF3ADA337C6FFFDLL) + 4 * (v4 + v3));
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(a1
                                                      + 8
                                                      * (((v4 - 1 + v3 < v2) * ((4 * (v5 ^ 0x89)) ^ 0x10F1)) ^ v5 ^ 0x89))
                                          - 8))(4668);
}

void sub_20AAB1EF4()
{
  JUMPOUT(0x20AAB1EB8);
}

uint64_t sub_20AAB1EFC@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;

  return (*(uint64_t (**)(void))(a1
                              + 8
                              * (int)((440
                                     * (((v3 ^ 0x36FEE77E)
                                       - 36176456
                                       + (v1 & 0x6DFDCEFC)
                                       + ((v2 - 298) ^ 0x2FCu)
                                       - 886499429) >> 31)) ^ v2)))();
}

uint64_t sub_20AAB1F88@<X0>(int a1@<W6>, uint64_t a2@<X8>)
{
  int v2;
  int v3;
  int v4;
  uint64_t v5;

  *(_DWORD *)(*(_QWORD *)(v5 - 0x4FF3ADA337C6FFFDLL) + 4 * (v4 + v2)) = a1;
  return ((uint64_t (*)(void))(*(_QWORD *)(a2 + 8
                                             * (int)((38 * ((v2 + v4 + v3 + 847 - 1314) >> 31)) ^ v3))
                            - 8))();
}

uint64_t sub_20AAB1FD4@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;
  int v4;
  _QWORD *v5;
  int v6;

  *(_DWORD *)(*v5 + 4 * (v1 + v4 - 1)) = v2;
  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * (int)((((v1 + v4 - 2) >> 31) * v6) ^ v3))
                            - ((101 * (v3 ^ 0x1DFu)) ^ 0x529)))();
}

void sub_20AAB201C()
{
  int v0;
  int v1;
  int v2;
  int v3;
  int v4;
  _QWORD *v5;
  _DWORD *v6;
  _BOOL4 v7;

  v7 = *(_DWORD *)(*v5 + 4 * (v0 + v2)) == v3 + v4 - 1313;
  *v6 = v1 + v1 * (v2 + v0 - v7) - 916476699 * (v0 - v7) + 1318371398;
}

void sub_20AAB224C(uint64_t a1)
{
  int v1;

  v1 = 1374699841 * ((a1 - 1542394297 - 2 * (a1 & 0xA410EE47)) ^ 0xC9E4F64E);
  __asm { BR              X14 }
}

uint64_t sub_20AAB2320@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  _DWORD v8[2];
  uint64_t v9;

  v5 = v3 - ((v4 + 1464170100) & 0x8D5205A4) + ((v2 - 814315314) & 0x308976FF) + 1917564910;
  v6 = 1755732067 * (((v8 | 0x81C11D84) - (v8 & 0x81C11D84)) ^ 0x5F07A05F);
  v9 = v1;
  v8[0] = v5 ^ v6;
  v8[1] = (v2 - 85) ^ v6;
  return ((uint64_t (*)(_DWORD *))(*(_QWORD *)(a1 + 8 * (v2 ^ 0x659)) - 4))(v8);
}

void jEHf8Xzsv8K(uint64_t a1)
{
  __asm { BR              X9 }
}

uint64_t sub_20AAB24D0()
{
  return 4294925273;
}

uint64_t sub_20AAB24DC@<X0>(uint64_t a1@<X8>)
{
  (*(void (**)(void))(a1 + 208))();
  return 0;
}

void OowSGu(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  BOOL v5;
  int v8;

  if (a1)
    v5 = a2 == 0;
  else
    v5 = 1;
  v8 = !v5 && a4 != 0 && a5 != 0;
  __asm { BR              X8 }
}

uint64_t sub_20AAB2584(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, _DWORD *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, unsigned int a18)
{
  unsigned int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;

  *a4 = 0;
  *a5 = 0;
  a18 = 108757529 * (((&a17 | 0x956C4C34) - (&a17 & 0x956C4C34)) ^ 0x75F02E1F) - 504207030;
  v22 = sub_20AAE5C84(&a17);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v19 + 8 * ((1090 * (a17 == v20)) ^ v18))
                                          - ((v21 + 8) ^ 0xCE5A0EB1)))(v22);
}

uint64_t sub_20AAB2620(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, unint64_t *a17, unsigned int a18, unsigned int a19, int a20)
{
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v21 = 1759421093 * ((&a17 + 1076331522 - 2 * (&a17 & 0x40278402)) ^ 0xF35A3456);
  LODWORD(a17) = v21 ^ 0x1F2726AC;
  HIDWORD(a17) = v21 ^ 0x24D21C9;
  a20 = v21 ^ 0x445509ED;
  a18 = v21 + 1609;
  sub_20AAA94DC((uint64_t)&a17);
  HIDWORD(a10) = a19;
  a17 = &STACK[0x7EF87141C217A9F9];
  a19 = 178 - 460628867 * ((&a17 - 1333366922 - 2 * (&a17 & 0xB0866F76)) ^ 0xFC10ED0B);
  sub_20AAE2E14((uint64_t)&a17);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 + 8 * ((244 * (((a18 == 306494155) ^ 0x1B) & 1)) ^ 0x27Au)) - 4))(v22, v23, v24, v25, v26, v27, v28, v29, a9, a10);
}

uint64_t sub_20AAB2784(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18, uint64_t a19, unsigned int a20,uint64_t a21)
{
  uint64_t v21;
  int v22;
  int v23;
  int v24;
  uint64_t v25;
  int v26;
  int v27;
  unsigned int v28;
  unsigned int v29;
  uint64_t v30;

  v27 = (v24 - 679585164) ^ v23;
  v28 = (2 * v23) & 0xAEFCBB1E;
  a19 = a16;
  v29 = 1178560073 * (&a17 ^ 0xBA947862);
  a18 = v28 + v29 + v27 + 1069416446;
  a20 = (v24 - 557) ^ v29;
  sub_20AAA1514((uint64_t)&a17);
  a20 = ((v22 ^ 0x6BDECFBF) - 1610646938 + ((v22 << ((v24 - 8) ^ 0x12)) & 0xD7BD9F7E)) ^ v29;
  a21 = v21;
  a19 = a16;
  a18 = v29 + v24 - 390;
  v30 = ((uint64_t (*)(int *))((char *)*(&off_24C363D30 + v24 - 623) - 12))(&a17);
  return (*(uint64_t (**)(uint64_t))(v25 + 8 * ((1929 * (a17 == v26)) ^ v24)))(v30);
}

uint64_t sub_20AAB2898(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, unint64_t *a17, uint64_t a18, unsigned int a19, unsigned int a20,int a21,int a22)
{
  uint64_t v22;
  int v23;
  int v24;
  unsigned int v25;
  uint64_t v26;

  v25 = 460628867 * (((&a17 | 0x75AAD406) - (&a17 & 0x75AAD406)) ^ 0x393C567B);
  a17 = &STACK[0x61B876722A6C067];
  a18 = a16;
  a19 = v25 - 1624809610;
  a20 = v25 + v24 - 2024873870;
  a21 = (a11 ^ 0x4FF2EF7E) - v25 - 5243004 + ((a11 << ((v24 ^ 0x9D) + v24 - 44 - 116)) & 4);
  v26 = sub_20AAE5D1C((uint64_t)&a17);
  return (*(uint64_t (**)(uint64_t))(v22 + 8 * (v24 | (8 * (a22 != v23)))))(v26);
}

uint64_t sub_20AAB2970(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, unsigned int a11)
{
  int v11;
  uint64_t v12;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 + 8 * (v11 ^ (551 * (a11 < 0x48EDB6D0))))
                                                            - (v11 ^ 0xFEu)
                                                            + 1293))(a1, a2, a3);
}

uint64_t sub_20AAB2A0C@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _BYTE *a6, int a7, char a8, uint64_t a9, uint64_t a10, unsigned int a11, char *a12, _BYTE *a13, uint64_t a14, unsigned int a15)
{
  int v15;
  char *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  _BYTE *v20;
  void (*v21)(unsigned int *);
  int v22;
  uint64_t v23;

  a11 = (v18 - 1214) ^ ((((&a11 | 0xB23EA5EF) + (~&a11 | 0x4DC15A10)) ^ 0xDFCABDE7) * v15);
  v22 = 87 * (v18 ^ 0x5E8);
  a12 = &a8 + a1;
  a13 = a6;
  v21(&a11);
  a12 = a6;
  a13 = v20;
  a14 = v17;
  a15 = (v22 - 1036) ^ (1225351577
                      * ((&a11 + 1901799802 - 2 * (&a11 & 0x715B297A)) ^ 0x52C1F16C));
  ((void (*)(unsigned int *))((char *)*(&off_24C363D30 + (v22 ^ 0x5C7)) - 8))(&a11);
  a11 = (v22 - 1008) ^ (1374699841
                      * ((((2 * &a11) | 0xCE85256C) - &a11 + 415067466) ^ 0x8AB68ABF));
  a12 = v16;
  a13 = a6;
  v21(&a11);
  a12 = a6;
  a11 = (v22 - 263) ^ (1755732067
                     * ((&a11 + 810596765 - 2 * (&a11 & 0x3050B99D)) ^ 0xEE960446));
  v23 = sub_20AABD7C8((uint64_t)&a11);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v19
                                                      + 8
                                                      * (int)((((_DWORD)a13 == 306494155)
                                                             * ((v22 + 436028034) & 0xE602BB7F ^ 0x326)) ^ v22))
                                          - 4))(v23);
}

uint64_t sub_20AAB2BD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14)
{
  int v14;
  uint64_t v15;
  int v16;

  return ((uint64_t (*)(void))(*(_QWORD *)(v15 + 8 * ((57 * (a14 == v16)) ^ v14))
                            - ((v14 - 510) ^ 0x31FLL)))();
}

uint64_t sub_20AAB2C0C@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  uint64_t v6;
  int v7;

  return (*(uint64_t (**)(void))(v6 + 8 * (((a6 != v7 + 159 * (a1 ^ 0x7CB) - 795) * (a1 - 1944)) ^ a1)))();
}

uint64_t sub_20AAB2C4C@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;
  _BOOL4 v6;

  v4 = a1 - 693;
  v5 = (a1 - 384618547) & 0x16ECCB7F;
  v6 = ((uint64_t (*)(_QWORD, uint64_t))*(&off_24C363D30 + (v4 ^ 0x5FB)))(v1 ^ (v3 - 641) ^ v4 ^ 0x798u, 74971987) != 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((734 * v6) ^ v4)) - v5 + 791))();
}

uint64_t sub_20AAB2CCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  int v13;
  uint64_t v14;
  int v15;
  int v16;

  v16 = (a13 ^ v15) - ((2 * (a13 ^ v15)) & 0x7176B88) - 2087995964;
  return ((uint64_t (*)(void))(*(_QWORD *)(v14
                                        + 8
                                        * (v13 ^ (4
                                                * (((v13 ^ 0xDFFFDD7F) & (2 * v16) ^ 0x7174B88)
                                                 + (v16 ^ (v13 + 1819563962))
                                                 + 2125960711 != 1857521158))))
                            - 4))();
}

uint64_t sub_20AAB2D48()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((125
                                * (v1 + v0 + 268437847 + 853 * (v2 ^ 0x283u) < (((v2 ^ 0x5AB) - 1907884666) | 0x40120A01u)
                                                                             + 832958807)) ^ v2 ^ 0x5AB)))();
}

uint64_t sub_20AAB2DC8(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * (a2 ^ ((8 * ((unint64_t)(v2 - a1) < 0x20)) | (16
                                                                                             * ((unint64_t)(v2 - a1) < 0x20)))))
                            - ((a2 - 1648) ^ 0x36)))();
}

uint64_t sub_20AAB2E0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  unsigned int v5;
  uint64_t v6;

  return ((uint64_t (*)(uint64_t, _QWORD))(*(_QWORD *)(v6 + 8 * (a5 ^ (208 * (v5 < 0x20))))
                                                  - (((a5 - 838334345) | 0x520600u) ^ 0xCE5A0EB9)))(a1, 0);
}

uint64_t sub_20AAB2E5C(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v9 = (v5 + v2);
  v10 = *(_OWORD *)(v1 + v9 - 15);
  v11 = *(_OWORD *)(v1 + v9 - 31);
  v12 = a1 + v9;
  *(_OWORD *)(v12 - 15) = v10;
  *(_OWORD *)(v12 - 31) = v11;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((55 * ((v6 ^ v4 ^ 0x6A0) == (v3 & 0xFFFFFFE0))) ^ (v7 + v6 + 405)))
                            - 4))();
}

uint64_t sub_20AAB2EC0(uint64_t a1)
{
  int v1;
  _QWORD *v2;
  int v3;
  int v4;
  _DWORD *v6;
  void (*v7)(_BYTE *);
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[4];
  unsigned int v11;
  uint64_t v12;

  *v2 = a1;
  *v6 = v1;
  v11 = v3
      + 154
      + 535753261 * ((-934584631 - (v10 | 0xC84B5EC9) + (v10 | 0x37B4A136)) ^ 0x3D40AF19)
      - 307;
  v12 = v8;
  v7(v10);
  v12 = v9;
  v11 = v3
      + 13
      + 535753261
      * (((v10 | 0x65632D70) - v10 + (v10 & 0x9A9CD288)) ^ 0x6F97235F)
      - 166;
  v7(v10);
  return v4 ^ 0x1244BACBu;
}

uint64_t sub_20AAB3184(uint64_t a1, uint64_t a2)
{
  return off_24C35F5D0[(1057 * (*(_DWORD *)(a2 + 4) == 274119364)) | 0x302u](4294925278);
}

uint64_t sub_20AAB31C4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_BYTE *)(*(_QWORD *)(a2 + 96) + 468) = *(_BYTE *)(*(_QWORD *)(a1 + 8) + 12);
  return (*(uint64_t (**)(_QWORD))(v2 + 6104))(0);
}

uint64_t sub_20AAB321C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  int v7;

  *(_BYTE *)(a1 + (v7 + v3)) = *(_BYTE *)(v2 + (v7 + v3));
  return (*(uint64_t (**)(_QWORD))(v1 + 8 * (((v7 - 1 == v4) * v5) ^ v6)))(0);
}

void sub_20AAB324C(uint64_t a1)
{
  int v1;
  unsigned int v2;
  unsigned int v3;
  _BOOL4 v4;
  _BOOL4 v5;

  v1 = 628203409 * (((a1 | 0x89B748DF) - a1 + (a1 & 0x7648B720)) ^ 0xB3F44EC);
  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 24) - 0x796809FFD09D13A7) + 58609910;
  v3 = *(_DWORD *)(a1 + 20) + v1 + 929450286;
  v4 = v2 < 0x49CF7ACE;
  v5 = v2 > v3;
  if (v3 < 0x49CF7ACE != v4)
    v5 = v4;
  __asm { BR              X9 }
}

uint64_t sub_20AAB332C(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((971
                                          * (((*(unsigned __int8 *)(*(_QWORD *)(a1 + 40)
                                                                  + (v2 - 1179724249))
                                             - ((2
                                               * *(unsigned __int8 *)(*(_QWORD *)(a1 + 40)
                                                                    + (v2 - 1179724249))) & 0x5A)
                                             + 1840987181) & 0x1F) != 18)) ^ v3))
                            - 12))();
}

uint64_t sub_20AAB337C()
{
  int v0;
  uint64_t v1;
  int v2;
  int v3;
  _BOOL4 v4;

  v4 = v2 + 1052040133 > (v0 + 1922880508);
  if ((v2 + 1052040133) < 0x8506059C != v0 + 1922880508 < (v3 ^ 0x850600A8))
    v4 = (v2 + 1052040133) < 0x8506059C;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * (v3 | (8 * !v4))) - 12))();
}

uint64_t sub_20AAB33EC()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8 * ((227 * (*(unsigned __int8 *)(v0 + (v3 + 1)) >> 7)) ^ v2))
                            - 8))();
}

uint64_t sub_20AAB3460(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v6;

  return (*(uint64_t (**)(void))(v6
                              + 8
                              * ((2017
                                * (a6
                                 + 8404903
                                 + ((((a6 + 1944601793) & 0x8C17BAF7) - 8405141) ^ (a2 + 73) & 0x7F)
                                 + ((2 * (a2 + 73)) & 0x7C) < 4)) ^ a6)))();
}

uint64_t sub_20AAB34C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  unsigned int v9;
  _BOOL4 v10;
  _BOOL4 v11;

  v9 = a5 + v7 + ((v8 + 1249) ^ 0x88922C12);
  v10 = v9 < 0xCE6312BB;
  v11 = v9 > v5 - 1141251813;
  if ((v5 - 1141251813) < 0xCE6312BB != v10)
    v11 = v10;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 8 * ((v11 * ((v8 + 287) ^ 0x1BB)) ^ v8)))(a1, a2, 3988513045);
}

uint64_t sub_20AAB353C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  uint64_t v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(v6
                                        + 8
                                        * ((1082
                                          * (((((a6 + 599979524) & 0xDC3D0DBD) - 218) ^ 0x1EDBE2AD) + a5 != 509322934)) ^ a6))
                            - 8))();
}

uint64_t sub_20AAB35C8(uint64_t a1, int a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v7;
  int v8;
  _BOOL4 v9;

  v9 = v8 + a4 + a2 - 509322935 != 0;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v7 + 8 * ((v9 | (8 * v9)) ^ (9 * (a7 ^ 0x421)))) - 8))(a1);
}

void sub_20AAB3654()
{
  JUMPOUT(0x20AAB3614);
}

uint64_t sub_20AAB3664(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  _BOOL4 v13;

  v8 = v5 + a2 + v6 - 113874639;
  v9 = a3 - 1178;
  v10 = ((a3 - 1196) | 0x12) - 2115994693 + v7 + v8;
  v11 = v3 - 1093314510;
  v12 = (v11 < 0xD13E89D2) ^ (v10 < 0xD13E89D2);
  v13 = v10 > v11;
  if (v12)
    v13 = v10 < 0xD13E89D2;
  return (*(uint64_t (**)(void))(v4 + 8 * ((783 * !v13) ^ v9)))();
}

uint64_t *sub_20AAB36F4@<X0>(uint64_t *result@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = result[6];
  v10 = *result;
  v9 = result[1];
  *a2 = v4 + (v6 ^ 0x5AE) - 151840984;
  *(_DWORD *)(v10 - 0x313E78BA42B926EALL) = v3;
  *(_DWORD *)(v8 - 0x5248BA885C210B04) = v7;
  *(_QWORD *)(v9 - 0x58A7AA08624568E6) = v2 + (v5 - 1057444550);
  *((_DWORD *)result + 8) = 306494155;
  return result;
}

void sub_20AAB377C(uint64_t a1)
{
  __asm { BR              X8 }
}

void sub_20AAB38A0(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  uint64_t v8;
  char v10;
  uint64_t v11;
  int v12;
  _BOOL4 v14;

  v12 = **(unsigned __int8 **)(a7 + 80) - (**(unsigned __int8 **)(v8 + 8 * (a8 ^ (a8 + 102))) ^ 0xFB);
  v14 = (v12 ^ 0x3FA5A7AF)
      + ((v12 << (v10 + ((((71 * ((a8 + 74) ^ 0x7E) + 28) & 0xFC) + 127) & 0x35) + 80)) & 0x7F4B4F5E)
      - 268763528 != a3
     || v11 == 1329396975;
  __asm { BR              X15 }
}

uint64_t sub_20AAB4A28@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;

  *(_BYTE *)(v2 + (v4 - 1857521159)) = *(_BYTE *)(a2 + (v4 - 1857521159));
  return (*(uint64_t (**)(void))(v5 + 8 * (((v4 - 1 == v3) * ((a1 ^ 0x5E4) - 786)) ^ a1)))();
}

uint64_t sub_20AAB4A68(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(uint64_t))((char *)off_24C35F5D0[(507 * (*(_DWORD *)(a2 + 4) == 274119364)) ^ 0x49Fu]
                                          - 4))(4294925278);
}

uint64_t sub_20AAB4AAC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_BYTE *)(*(_QWORD *)(a2 + 96) + 448) = *(_BYTE *)(*(_QWORD *)(a1 + 8) + 12);
  return ((uint64_t (*)(_QWORD))(*(_QWORD *)(v2 + 9512) - 4))(0);
}

void sub_20AAB4B24()
{
  JUMPOUT(0x20AAB4AF4);
}

void sub_20AAB4B30(uint64_t a1)
{
  int v1;
  BOOL v2;
  int v3;

  v1 = 1759421093 * (a1 ^ 0xB37DB054);
  if (*(_QWORD *)(a1 + 24))
    v2 = *(_DWORD *)(a1 + 20) - v1 == 2058996701;
  else
    v2 = 1;
  v3 = v2;
  __asm { BR              X8 }
}

uint64_t sub_20AAB4BD4()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  _BOOL4 v3;

  v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8 * (v2 ^ 0x8B)))(32, 0x101004023FF3BD5) != 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((657 * v3) ^ v2))
                            - ((((v2 - 610905518) & 0x2469AF5Fu) + 866) ^ 0x579)))();
}

uint64_t sub_20AAB4C50()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((((v3 ^ 0x766) - 1293) * (v1 == v0)) ^ v3)) - 8))();
}

uint64_t sub_20AAB4C90@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  int v2;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  unsigned int v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;

  v11 = v2 - 2058996702;
  v12 = v2 - 1;
  v13 = *(unsigned __int8 *)(v6 + v11);
  if (v13 == 251)
    __asm { BR              X11 }
  if (v13 == 123)
  {
    v14 = 306494155;
    v15 = *(_QWORD *)(v4 + 8);
    v16 = *(unsigned __int8 *)(v4 + 16) ^ v5;
    *(_QWORD *)result = v6;
    *(_DWORD *)(result + 8) = v7;
    *(_DWORD *)(result + 12) = v12;
    if (v16 == 121)
      v17 = 643217243;
    else
      v17 = 643217242;
    *(_DWORD *)(result + 16) = 937410203;
    *(_DWORD *)(result + 20) = v17;
    *(_DWORD *)(result + 24) = 306494155;
    *(_QWORD *)(v15 - 0x5C6940C6B1BC703ALL) = a2;
  }
  else
  {
    result = (*(uint64_t (**)(void))(v8 + 8 * (v9 ^ 0x567)))();
    v14 = -306454254;
  }
  *(_DWORD *)v4 = v14;
  return result;
}

void sub_20AAB4D74(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 8) + 1759421093 * ((a1 - 1364022623 - 2 * (a1 & 0xAEB2AAA1)) ^ 0x1DCF1AF5);
  __asm { BR              X10 }
}

uint64_t sub_20AAB4E28@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  _BOOL4 v4;

  v3 = a1 | 0x608;
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8 * ((a1 | 0x608) - 1450)))(200, 2354554103) == 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (((8 * v4) | (16 * v4)) ^ v3))
                            - ((v3 - 1092) ^ (2 * (v3 ^ 0x7A8u)) ^ 8)))();
}

uint64_t sub_20AAB4E8C(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  _QWORD *v5;
  uint64_t v6;
  int v7;
  uint64_t result;
  int v10;

  result = (*(uint64_t (**)(uint64_t, _QWORD))(v6 + 8 * (v7 ^ 0x235)))(a1, 0);
  if ((_DWORD)result == 16)
  {
    ++v3;
    goto LABEL_7;
  }
  if ((_DWORD)result == 12)
  {
LABEL_7:
    result = (*(uint64_t (**)(uint64_t))(v6 + 8 * (v4 ^ 0x252)))(a1);
    v10 = v3;
    goto LABEL_8;
  }
  if ((_DWORD)result)
  {
    v3 += 2;
    goto LABEL_7;
  }
  *v5 = a1;
  v10 = -937654337;
LABEL_8:
  *(_DWORD *)(v1 + 12) = v10 ^ v2;
  return result;
}

void sub_20AAB4F10()
{
  unint64_t v0;
  uint64_t v1;
  _BYTE v2[1208];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = (unint64_t)&v2[qword_254614AD8 - qword_254614B28];
  qword_254614B28 = 1801249171 * (v0 + 0x76EA39A97CF9A556);
  qword_254614AD8 = 1801249171 * (v0 ^ 0x8915C65683065AAALL);
  *(_DWORD *)*(&off_24C363D30
             + ((-109 * ((qword_254614AD8 - qword_254614B28) ^ 0xAA)) ^ byte_20AB0AF60[byte_20AB078E0[(-109 * ((qword_254614AD8 - qword_254614B28) ^ 0xAA))] ^ 0x5C])
             + 131) = 306494155;
  v1 = ((uint64_t (*)(uint64_t, uint64_t))*(&off_24C363D30
                                                  + ((-109
                                                                                   * ((qword_254614AD8 + qword_254614B28) ^ 0xAA)) ^ byte_20AB0AC60[byte_20AB075E0[(-109 * ((qword_254614AD8 + qword_254614B28) ^ 0xAA))] ^ 0xB0])
                                                  + 76))(512, 1509315540);
  *(_QWORD *)*(&off_24C363D30
             + ((-109 * ((qword_254614AD8 + qword_254614B28) ^ 0xAA)) ^ byte_20AB0AC60[byte_20AB075E0[(-109 * ((qword_254614AD8 + qword_254614B28) ^ 0xAA))] ^ 0xF9])
             + 4) = v1;
  __asm { BR              X8 }
}

void sub_20AAB50AC()
{
  int v0;
  _DWORD *v1;

  *v1 = v0;
}

void sub_20AABC6F4(_DWORD *a1)
{
  unsigned int v1;

  v1 = *a1 ^ (235795823 * ((-127693918 - (a1 | 0xF8638BA2) + (a1 | 0x79C745D)) ^ 0x93313D04));
  __asm { BR              X15 }
}

uint64_t sub_20AABC7B0(uint64_t a1)
{
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8
                                             * ((239 * (*(_DWORD *)(*(_QWORD *)(a1 + 8) + v4) == v2)) ^ (v1 + 774)))
                            - ((v1 + 940105165) & 0xC7F7259B ^ 0x597)))();
}

uint64_t sub_20AABC7FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;

  v6 = v2 - 774 + 1374699841 * (&v4 ^ 0x6DF41809) + 930;
  v4 = a1;
  v5 = v1;
  return sub_20AAA176C((uint64_t)&v4);
}

void sub_20AABC954(uint64_t a1)
{
  int v1;
  uint64_t v2;
  _DWORD v3[2];
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = *(_DWORD *)(a1 + 4) ^ (460628867 * (((a1 | 0x4A5B5FFB) - (a1 & 0x4A5B5FFB)) ^ 0x6CDDD86));
  v2 = *(_QWORD *)(a1 + 8);
  v3[0] = v1 + 628203409 * ((v3 & 0x938332E4 | ~(v3 | 0x938332E4)) ^ 0xEEF4C128) + 419;
  v4 = v2;
  sub_20AABE998((uint64_t)v3);
  __asm { BR              X8 }
}

void sub_20AABCA5C()
{
  int *v0;
  int v1;

  *v0 = v1 | 1;
}

void sub_20AABCACC(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 4) - 3804331 * (((a1 | 0x51A664) - (a1 & 0x51A664)) ^ 0x7E848392);
  __asm { BR              X9 }
}

uint64_t sub_20AABCB94@<X0>(_DWORD *a1@<X0>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, unsigned int a5, unsigned int a6, uint64_t a7, int a8)
{
  uint64_t v8;
  _DWORD *v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  unsigned int v14;
  uint64_t v15;

  v14 = 1759421093 * ((2 * (&a5 & 0x21B9C4D0) - &a5 - 565822675) ^ 0x6D3B8B79);
  a5 = *a1 - v12 + *(_DWORD *)(v8 - 0x140B289DC8FEE244) + ((v13 + 1495) ^ 0xDD1FB75A) - v14 - 83192027;
  a6 = v14 + 1012133676;
  a7 = v8;
  a8 = v13 - v14 + 982;
  v15 = (*(uint64_t (**)(unsigned int *))(a2 + 8 * (v13 ^ 0x1A0)))(&a5);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v11 + 8 * ((1160 * (*v9 == v10)) ^ v13)) - 12))(v15);
}

uint64_t sub_20AABCC78()
{
  uint64_t v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((418 * (*(_QWORD *)(v0 + 8) == 0x25E912EA7879E49CLL)) ^ v1))
                            - ((v1 - 701)
                             + ((v1 - 1495) ^ 0xFFFFFFFFFFFFFACALL))))();
}

uint64_t sub_20AABCCC8()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((177 * (v1 != (v0 ^ 0x517) + 585124872 + ((v0 - 1221813489) & 0x48D361D6))) ^ v0))
                            - 4))();
}

void sub_20AABCD18()
{
  _DWORD *v0;

  *v0 = -306454254;
}

void sub_20AABCF74(_DWORD *a1)
{
  unsigned int v1;
  unsigned int v2;
  int v3;
  _BOOL4 v5;

  v1 = 235795823 * (((_DWORD)a1 - 1876425126 - 2 * (a1 & 0x9028065A)) ^ 0x4854F03);
  v2 = a1[9] + v1;
  v3 = *a1 ^ v1;
  v5 = (v3 & 0x30000000) == 0x20000000 || (v3 & 0x3F000000) == 0x8000000;
  __asm { BR              X11 }
}

uint64_t sub_20AABD044@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t *a6, unsigned int a7, uint64_t a8, unint64_t *a9, int a10, unint64_t *a11, char a12, int a13)
{
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;

  v17 = *(_QWORD *)(v14 + 8);
  v18 = 1755732067
      * (((&a6 | 0x39BC7E0E) - &a6 + (&a6 & 0xC64381F0)) ^ 0xE77AC3D5);
  a12 = (99 * (((&a6 | 0xE) - &a6 + (&a6 & 0xF0)) ^ 0xD5)) ^ 0x2F;
  a8 = v17;
  a9 = &STACK[0x617AE0CD3EA9132E];
  a6 = &STACK[0x31AF47F149EB7E7A];
  a10 = v18 + 1172345322 + v16;
  a7 = ((v13 ^ 0xF6CE320A) - 715148271 + ((v13 << (((v16 + 16) | 0x40) ^ 0xC0)) & 0xFFF6D7FE ^ 0x126293EA)) ^ v18;
  a11 = &STACK[0x6270735DB71EF9BF];
  v19 = (*(uint64_t (**)(unint64_t **))(a1 + 8 * (v16 ^ 0xB4)))(&a6);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v15 + 8 * ((172 * (a13 == 306494155)) ^ v16)) - 4))(v19);
}

uint64_t sub_20AABD184()
{
  uint64_t v0;
  int v1;
  int v2;

  return (*(uint64_t (**)(void))(v0 + 8
                                   * (((((v2 + 96) | 0x40A) + ((4 * v2) ^ 0x414) - 2728) * (v1 == 0x8000000)) ^ v2)))();
}

uint64_t sub_20AABD1BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unint64_t a11)
{
  int v11;
  uint64_t v12;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 8 * (v11 ^ (4 * (a11 + 4 < a11)))))(a1, a2, a3, a4);
}

uint64_t sub_20AABD214()
{
  int v0;
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((2023
                                * (((2 * v1) & 0xC3AFBAFA ^ 0x42A280B0) + (v1 ^ 0xC8AEBDA5) - 25231428 != ((v0 + 1615) ^ 0x9B) + 1616303534)) ^ v0)))();
}

uint64_t sub_20AABD27C(uint64_t a1, int a2)
{
  int v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((71
                                          * (a2
                                           + v3
                                           + ((491 * (v2 ^ 0x78F) - 1641538746) ^ (v2 + 934161902) & 0xC851CAF7) < 0xC)) ^ v2))
                            - 12))();
}

uint64_t sub_20AABD2E8(int a1, int a2)
{
  char v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * (a1 ^ (120 * (((v3 + a2 - (v2 & 3) + 1849) & 0xFFFFFFFC) > v3 + a2 + 1852))))
                            - (a1 - 1737)
                            + 223))();
}

uint64_t sub_20AABD350@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  *(_DWORD *)(a1 - 3 + (v3 + v2)) = *(_DWORD *)(v1 - 3 + (v3 + v2));
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((2047 * (v4 == 4)) ^ (v5 + 762)))
                            - ((v5 + 755) ^ 0x360)))();
}

uint64_t sub_20AABD3A4()
{
  int v0;
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2 + 8 * (v0 ^ (16 * (v1 != 0xA97960D8)))))();
}

uint64_t sub_20AABD3E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  unsigned int v2;
  int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  uint64_t v8;
  _BOOL4 v9;
  uint64_t v10;

  v9 = v4 > v6;
  v10 = v7 - 951020594 + ((v3 - 1944500613) & 0x73E6BFD3u);
  *(_BYTE *)(a1 + v10) = *(_BYTE *)(v1 + v10);
  if (v9 == v7 + 219723226 < v2)
    v9 = v7 + 219723226 < v5;
  return (*(uint64_t (**)(BOOL))(v8 + 8 * (v3 | (16 * v9))))(v7 + 219723226 < v5);
}

uint64_t sub_20AABD458@<X0>(unsigned int a1@<W1>, uint64_t a2@<X8>, uint8x8_t a3@<D0>)
{
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;

  a3.i32[0] = *(_DWORD *)(a2 + a1 + 1);
  *(_DWORD *)(a2 - 3 + (v4 + v3)) = vmovn_s16((int16x8_t)vmovl_u8(a3)).u32[0];
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * (int)(((v6 == 4) * (((v5 + 1773763354) & 0x96468766) + 275)) ^ v5))
                            - 4))();
}

uint64_t sub_20AABD4BC(int a1)
{
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((((a1 ^ 0x315) + 1695) ^ 0x7C9) * (v1 != v2)) ^ a1)) - 8))();
}

uint64_t sub_20AABD4EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  *(_BYTE *)(a1 + (v4 + v3)) = *(_BYTE *)(v1 + (v4 + v3));
  return (*(uint64_t (**)(void))(v6 + 8 * (((v4 - 1 != v2 + 1931) * ((226 * (v5 ^ 0x79)) ^ 0x6A2)) ^ (v5 + 80))))();
}

uint64_t sub_20AABD534()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (((*(_QWORD *)(v1 + 16) != 0x58C2F3F47EC954F5) * ((v0 ^ 0x761) + 43)) ^ v0))
                            - 4))();
}

uint64_t sub_20AABD570@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  int v6;
  uint64_t v7;
  uint64_t v8;

  *(_DWORD *)(a1 - 0x58C2F3F47EC954F5) = a6;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8
                                        + 8
                                        * ((1075 * (*(_QWORD *)(v7 + 24) != 0x269A20090686D7EELL)) ^ ((v6 - 1743) | 0x30)))
                            - 4))();
}

void sub_20AABD5CC(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(a1 - 0x269A20090686D7EELL) = v2;
  *(_DWORD *)(v1 + 32) = 306494155;
}

uint64_t sub_20AABD660(_DWORD *a1, uint64_t a2)
{
  return ((uint64_t (*)(void))((char *)off_24C35F5D0[(529
                                                   * ((*a1 + *(_DWORD *)(a2 + 4) - 1515413495) < 0xC9)) ^ 0x424u]
                            - 4))();
}

uint64_t sub_20AABD6A8@<X0>(uint64_t a1@<X8>)
{
  int v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((124 * (v1 != 274119351)) ^ 0x50Du)) - 12))();
}

uint64_t sub_20AABD6E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int v3;
  unsigned int v4;
  _BOOL4 v5;
  _BOOL4 v6;

  *(_BYTE *)(a1 + (v3 - 1241294145) + 4) = (**(_BYTE **)(a2 + 8) ^ 0x3E)
                                                       + 36
                                                       + ((2 * **(_BYTE **)(a2 + 8)) & 0x7C)
                                                       - 78;
  v4 = *(_DWORD *)(a2 + 4) + 1900636663;
  v5 = v4 < 0x81A024AE;
  v6 = v4 > 0x81A024AF;
  if (v5)
    v6 = v5;
  return ((uint64_t (*)(void))(*(_QWORD *)(a3 + 8 * ((1565 * !v6) ^ 0x31Au)) - 4))();
}

void sub_20AABD78C()
{
  JUMPOUT(0x20AABD70CLL);
}

uint64_t sub_20AABD794()
{
  return 4294925278;
}

uint64_t sub_20AABD79C(_DWORD *a1)
{
  int v1;
  int v2;
  int v3;

  *((_BYTE *)a1 + ((v3 + v2) ^ 0xAA56C611) + v1 + 4) = 20;
  *a1 = v1;
  return 0;
}

uint64_t sub_20AABD7C8(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)a1 ^ (1755732067 * ((a1 & 0xECFD530 | ~(a1 | 0xECFD530)) ^ 0x2FF69714));
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_24C363D30 + (v1 ^ 0x4A1))
                              + ((964 * (*(_QWORD *)(a1 + 8) != 0x140B289DC8FEE254)) | v1))
                            - 12))();
}

uint64_t sub_20AABD858()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * (v0 ^ (4 * (*(_DWORD *)(v2 - 0x140B289DC8FEE23CLL) == 306494155))))
                            - 12))();
}

uint64_t sub_20AABD890()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  _BOOL4 v5;
  _BOOL4 v6;

  v3 = *(_DWORD *)(v2 - 0x140B289DC8FEE244) + 560425946;
  v4 = *(_DWORD *)(v2 - 0x140B289DC8FEE248) - 561160552;
  v5 = v4 < 0x59472A75;
  v6 = v3 < v4;
  if (v3 < 0x59472A75 != v5)
    v6 = v5;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((345 * v6) ^ v0)) - 12))();
}

uint64_t sub_20AABD91C@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  _DWORD *v2;

  *v2 = a2;
  *(_DWORD *)(result + 16) = -306454018;
  return result;
}

uint64_t sub_20AABD930(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  _BOOL4 v5;

  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 24) - 0x4FF3ADA337C70001) + 153745807;
  v3 = *(_DWORD *)(*(_QWORD *)(a1 + 8) - 0x4FF3ADA337C70001) + 153745807;
  v4 = (v2 < -1681995532) ^ (v3 < -1681995532);
  v5 = v2 > v3;
  if (v4)
    v5 = v2 < -1681995532;
  v1 = *(_DWORD *)(a1 + 16) - 1178560073 * ((-2 - ((a1 | 0x5930FF1B) + (~(_DWORD)a1 | 0xA6CF00E4))) ^ 0x1C5B7886);
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_24C363D30 + v1 - 1265) + (((4 * v5) | (8 * v5)) ^ v1))
                            - (v1 - 1264)
                            + 172))();
}

uint64_t sub_20AABDA04()
{
  uint64_t v0;
  int v1;
  unsigned int v2;
  int v3;
  int v4;
  _BOOL4 v5;
  _BOOL4 v6;

  v4 = (v2 ^ 0xE01E647B) + v1;
  v5 = v4 < 1924346932;
  v6 = v3 - 534879025 < v4;
  if (v3 - 534879025 < 1924346932 != v5)
    v6 = v5;
  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * (int)((88 * v6) ^ v2)) - (v2 ^ 0xB0)))();
}

uint64_t sub_20AABDA80()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;

  v3 = 623484618 - v2;
  if (((v1 - 1018) ^ 0x6D6B3077) + v2 < 0)
    v3 = v2;
  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((1837 * (v3 - 311742310 >= 0)) ^ (v1 - 1018))) - 4))();
}

uint64_t sub_20AABDB20()
{
  uint64_t v0;
  unsigned int v1;
  int v2;
  _QWORD *v3;
  _QWORD *v4;
  unsigned int v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * ((1417
                                          * (((v2 - 1) ^ ((*(_DWORD *)(*v3 + 4 * v5) ^ v1) > (*(_DWORD *)(*v4 + 4 * v5) ^ v1))) & 1)) ^ v2))
                            - 4))();
}

uint64_t sub_20AABDB6C(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  int v3;
  unsigned int v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((v3 - 1606796270) & 0x5FC5C7E7 ^ (485 * (v4 < a2))))
                            - ((((v3 - 1606796270) & 0x5FC5C7E7) - 1018) ^ (2 * ((v3 - 1606796270) & 0x5FC5C7E7 ^ 0x490u)) ^ 4)))();
}

uint64_t sub_20AABDBBC()
{
  uint64_t v0;
  int v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((1837 * (v2 - 311742310 >= 0)) ^ v1)) - 4))();
}

_DWORD *sub_20AABDC0C(_DWORD *result)
{
  int v1;
  int v2;

  *result = v2 - v1 - 1374929536;
  return result;
}

uint64_t sub_20AABDC24(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  int v3;
  uint64_t v4;
  int v5;
  _BYTE v7[8];

  v2 = (unint64_t)&v7[qword_254614AD8 ^ qword_254614AE8];
  qword_254614AE8 = (1801249171 * v2) ^ 0x8915C65683065AAALL;
  qword_254614AD8 = 1801249171 * (v2 ^ 0x8915C65683065AAALL);
  v3 = *(_DWORD *)(a2 + 4);
  v4 = (uint64_t)*(&off_24C363D30
                + ((-109 * ((qword_254614AD8 + ((-109 * v2) ^ 0xAA)) ^ 0xAA)) ^ byte_20AB0AF60[byte_20AB078E0[(-109 * ((qword_254614AD8 + ((-109 * v2) ^ 0xAA)) ^ 0xAA))] ^ 0xC7])
                + 107);
  if (v3 == 274119354)
    __asm { BR              X17 }
  if (v3 == 274119361)
  {
    v5 = **(unsigned __int8 **)(a2 + 8) - 9;
    __asm { BR              X17 }
  }
  return 4294925278;
}

uint64_t sub_20AABE300(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(void))off_24C35F5D0[(229 * (*(_DWORD *)(a2 + 4) != 274119352)) ^ 0x77Eu])();
}

uint64_t sub_20AABE338()
{
  return 4294925278;
}

uint64_t sub_20AABE340(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 16) = (**(unsigned __int8 **)(a2 + 8) ^ 0xF6D77F7F) + 1269627816 + 2 * (**(_BYTE **)(a2 + 8) & 0x7F);
  return 0;
}

uint64_t sub_20AABE384(uint64_t a1)
{
  int v1;
  int v2;
  unsigned int v3;
  int v4;
  int v5;

  v1 = 628203409 * (((a1 | 0xC21FEC2B) - (a1 & 0xC21FEC2B)) ^ 0x4097E018);
  v2 = *(_DWORD *)(a1 + 8) - v1;
  v3 = v1 + *(_DWORD *)(a1 + 12) - 832508458;
  v4 = (*(_DWORD *)(*(_QWORD *)a1 - 0xB7BFC0B778595F6) ^ 0x984FAF2C) + v3;
  v5 = v4 - ((2 * v4) & 0x309F5E58) - 1739608276;
  *(_DWORD *)(*(_QWORD *)a1 - 0xB7BFC0B778595F6) = v5;
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_24C363D30 + v2 - 1500) + ((281 * ((v5 ^ 0x984FAF2C) < v3)) ^ v2)) - 12))();
}

void sub_20AABE444(uint64_t a1@<X8>)
{
  *(_DWORD *)(a1 - 0xB7BFC0B778595FALL) = (*(_DWORD *)(a1 - 0xB7BFC0B778595FALL) ^ 0x876A57DB)
                                        - 2023073829
                                        - ((2 * (*(_DWORD *)(a1 - 0xB7BFC0B778595FALL) ^ 0x876A57DB) + 2) & 0xED4AFB6)
                                        + 1;
}

uint64_t sub_20AABE48C(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  BOOL v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;

  v1 = 535753261 * ((a1 - 1922189914 - 2 * (a1 & 0x8D6DB5A6)) ^ 0x8799BB89);
  v2 = *(_DWORD *)(a1 + 16) + v1;
  v3 = *(_DWORD *)a1 ^ v1;
  v4 = *(_DWORD *)(*(_QWORD *)(a1 + 24) - 0x4FF3ADA337C70001);
  v6 = v4 - 311742309;
  v5 = v4 - 311742309 < 0;
  v7 = 311742309 - v4;
  if (v5)
    v8 = v7;
  else
    v8 = v6;
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_24C363D30 + v2 - 842)
                              + ((1569 * ((v3 - 93088579) >= 4 * (unint64_t)v8)) ^ v2))
                            - 8))();
}

uint64_t sub_20AABE548(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  int v4;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3
                                                                        + 8
                                                                        * ((1984
                                                                          * (v2 != ((v4 + 829271938) & 0xCE924DBC ^ 0x58C6A7F))) ^ v4))
                                                            - 8))(a1, a2, 1135927250);
}

uint64_t sub_20AABE598(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;

  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(v2
                                                                              + 8
                                                                              * (((v3 ^ 0x572) - 786) ^ 0x3EE ^ v3 ^ 0x572)))(a1, (v3 ^ 0x572u) - 786, v3 ^ 0x572u, 2216545830, v1);
}

uint64_t sub_20AABE608@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W3>, int a4@<W4>, int a5@<W8>)
{
  uint64_t v5;
  int v6;
  unsigned int v7;
  char v8;

  *(_BYTE *)(*(_QWORD *)(a1 + 8) + (a4 + a5)) = (a3 ^ v7) >> v8;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((705 * (a4 - 1 == a2 + v6)) ^ a2)) - 8))();
}

uint64_t sub_20AABE64C(uint64_t a1, int a2)
{
  uint64_t v2;
  int v3;

  return (*(uint64_t (**)(uint64_t))(v2
                                            + 8 * (((v3 + ((a2 + 786) ^ 0x446) == 32) * (a2 ^ 0x3EE)) ^ (a2 + 786))))(a1);
}

uint64_t sub_20AABE684(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  _BOOL4 v9;

  v7 = v6 - 1684403670 + (a3 ^ v4);
  v9 = v7 > 1449224132 || v7 < v5;
  return (*(uint64_t (**)(void))(v3 + 8 * (((2 * v9) | (32 * v9)) ^ a3)))();
}

uint64_t sub_20AABE6D0@<X0>(uint64_t a1@<X0>, int a2@<W2>, int a3@<W8>)
{
  int v3;
  _QWORD *v4;
  int v5;

  return sub_20AABE608(a1, a2 - 786, *(_DWORD *)(*v4 + 4 * (v5 - 986144155 + a2 - 786)), v3, a3);
}

uint64_t sub_20AABE6FC(uint64_t result, uint64_t a2, int a3)
{
  *(_DWORD *)(result + 32) = a3;
  return result;
}

void sub_20AABE704(uint64_t a1)
{
  int v1;

  v1 = 1759421093 * (((a1 | 0x9EBEB665) - a1 + (a1 & 0x6141499A)) ^ 0x2DC30631);
  __asm { BR              X14 }
}

uint64_t sub_20AABE7D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  unsigned int v5;
  int v7;
  uint64_t v8;
  int v9;

  v5 = 108757529 * (&v7 ^ 0xE09C622B);
  v8 = v1;
  v7 = v5 + v3 - 585;
  v9 = (v2 - ((v4 + 7976598) & 0x10ACEB2) + 29507533 + ((v3 - 899983167) & 0x35A4A6F7)) ^ v5;
  return ((uint64_t (*)(int *))(*(_QWORD *)(a1 + 8 * (v3 - 610)) - 8))(&v7);
}

uint64_t sub_20AABE920(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(void))((char *)off_24C35F5D0[(11 * (*(_DWORD *)(a2 + 4) != 274119352)) ^ 0x161u] - 12))();
}

uint64_t sub_20AABE95C()
{
  return 4294925278;
}

uint64_t sub_20AABE964(uint64_t a1, uint64_t a2)
{
  int v2;
  BOOL v3;
  char v4;
  char v5;

  v2 = **(unsigned __int8 **)(a2 + 8);
  v3 = v2 == 0;
  v4 = (v2 != 0) ^ 0x7F;
  if (v3)
    v5 = -108;
  else
    v5 = -106;
  *(_BYTE *)(a1 + 88) = v4 + v5;
  return 0;
}

uint64_t sub_20AABE998(uint64_t a1)
{
  int v1;
  int v2;
  BOOL v3;
  int v4;
  int v5;

  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 8) - 0x4FF3ADA337C70001);
  v4 = v2 - 311742309;
  v3 = v2 - 311742309 < 0;
  v5 = 311742309 - v2;
  if (!v3)
    v5 = v4;
  v1 = (*(_DWORD *)a1 - 628203409 * (a1 ^ 0x82880C33) + 1335259643) & 0xB0698D2B;
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_24C363D30 + v1 - 854)
                              + ((((v1 ^ 0x5FFE3BF6 ^ v5) - 128320019 + ((2 * v5) & 0xBFFC7FFE) - 1482178029 < 0x7FFFFFFF)
                                * (2 * (v1 ^ 0x678) - 1246)) ^ v1))
                            - 4))();
}

uint64_t sub_20AABEAA0(uint64_t a1, int a2, unsigned int a3, uint64_t a4)
{
  int v4;
  _QWORD *v5;
  int v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(a4 + 8 * (((*(_DWORD *)(*v5 + 4 * a3) == v6) * a2) ^ v4)) - 4))();
}

void sub_20AABEACC()
{
  JUMPOUT(0x20AABEA78);
}

uint64_t sub_20AABEAD8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  *(_DWORD *)(result + 4) = a5;
  return result;
}

uint64_t sub_20AABEAE0(uint64_t result)
{
  uint64_t v1;
  __int16 v2;
  __int16 v3;
  int v4;
  int v5;

  v1 = *(_QWORD *)(result + 8);
  v2 = *(_DWORD *)result + 26185 * ((2 * (result & 0x1A68) - result - 6761) ^ 0x9DF5);
  v3 = (v2 & 0x1FF ^ 0xEB) + (v2 & 0xFC ^ 0xB214) - ((v2 & 0x1FF ^ 0xEB) & 0xFC);
  *(_DWORD *)(v1 - 0xB7BFC0B778595DALL) = ((v3 & 0x127B ^ 0x13980021) + (v3 & 0xD84 ^ 0x20485) - 1) ^ 0xF6612C69;
  *(_QWORD *)(v1 - 0xB7BFC0B778595FALL) = 0x984FAF2C876A57DBLL;
  *(_DWORD *)(v1 - 0xB7BFC0B778595DELL) = 1741097738;
  v4 = v2 ^ 0xD5;
  if (v4 == 1)
  {
    v5 = 1741097754;
    goto LABEL_5;
  }
  if (v4 == 2)
  {
    *(_DWORD *)(v1 - 0xB7BFC0B778595E2) = -757533767;
    v5 = 1741097758;
LABEL_5:
    *(_QWORD *)(v1 - 0xB7BFC0B778595F2) = 0xFEC7B9C0764F3148;
    *(_QWORD *)(v1 - 0xB7BFC0B778595EALL) = 0x138463F89B0CEB7;
    *(_DWORD *)(v1 - 0xB7BFC0B778595DELL) = v5;
  }
  *(_DWORD *)(result + 4) = 1306380791;
  return result;
}

void gDmCYFQnze(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __asm { BR              X8 }
}

uint64_t sub_20AABECF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, unsigned int a18)
{
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v22;

  v22 = v18;
  a18 = 108757529 * ((&a17 + 70320331 - 2 * (&a17 & 0x43100CB)) ^ 0xE4AD62E0) - 504207030;
  v20 = sub_20AAE5C84(&a17);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v22 + 8 * ((271 * (a17 == 306494155)) ^ v19)) - 12))(v20);
}

uint64_t sub_20AABED9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, unint64_t *a17, int a18, unsigned int a19)
{
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  a19 = 178
      - 460628867
      * (((&a17 | 0x69B4B9F6) - &a17 + (&a17 & 0x964B4608)) ^ 0x25223B8B);
  a17 = &STACK[0x7EF87141C217A9F9];
  sub_20AAE2E14((uint64_t)&a17);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a12 + 8 * (((a18 == 306494155) * (((v20 + 1491) ^ v19) - 227341827)) | v19)) - 12))(v21, v22, v23, v24, v25, v26, v27, v28, a9, a10);
}

uint64_t sub_20AABEE48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18, uint64_t a19, int a20,uint64_t a21)
{
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  _DWORD *v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v27 = 1178560073 * ((&a17 & 0xF177A641 | ~(&a17 | 0xF177A641)) ^ 0xB41C21DC);
  a19 = a16;
  a20 = v27 ^ 0xEE;
  a18 = (v25 ^ 0x1F3F5F9D) + v27 - 134414864 + ((2 * v25) & 0x3E7EBF3A);
  sub_20AAA1514((uint64_t)&a17);
  v28 = 1178560073 * ((&a17 - 30129850 - 2 * (&a17 & 0xFE344146)) ^ 0x44A03924);
  a20 = v28 ^ 0xEE;
  a19 = a16;
  a18 = (v24 ^ 0x77FFFD9D) + ((2 * v24) & 0xEFFFFB3A) - 1623433232 + v28;
  sub_20AAA1514((uint64_t)&a17);
  v29 = 1178560073
      * ((-1106986106 - (&a17 | 0xBE04BB86) + (&a17 | 0x41FB4479)) ^ 0xFB6F3C1B);
  a20 = v29 ^ ((v23 ^ 0xBDFCB7F) - 98650 + ((2 * v23) & 0x17BF96FE));
  a18 = v29 + 405;
  a19 = a16;
  a21 = v22;
  sub_20AAC7260((uint64_t)&a17);
  v30 = 1178560073 * ((&a17 & 0x1B4B3B94 | ~(&a17 | 0x1B4B3B94)) ^ 0x5E20BC09);
  a18 = v30 + 405;
  a20 = v30 ^ ((v21 ^ 0xBFEFE67) - 2143298 + ((2 * v21) & 0x17FDFCCE));
  a19 = a16;
  a21 = a11;
  sub_20AAC7260((uint64_t)&a17);
  v31 = 1178560073 * ((&a17 & 0xF7FDE8F6 | ~(&a17 | 0xF7FDE8F6)) ^ 0xB2966F6B);
  a18 = v31 + (*v26 ^ 0xB73D7FFF) + ((2 * *v26) & 0x6E7AFFFE) + 1610538382;
  a19 = a16;
  a20 = v31 ^ 0xEE;
  sub_20AAA1514((uint64_t)&a17);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a12 + 8 * ((7 * (a17 != 306494155)) ^ 0x2C0u)) - 8))(v32, v33, v34, v35, v36, v37, v38, v39, 0x21A000002C7, a10, a11, a12);
}

uint64_t sub_20AABF150(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, unint64_t *a17, uint64_t a18, int a19, int a20,int a21,int a22)
{
  int v22;
  uint64_t v23;
  int v24;
  uint64_t v25;

  v24 = 460628867 * ((&a17 + 737810641 - 2 * ((unint64_t)&a17 & 0x2BFA18D1)) ^ 0x676C9AAC);
  a21 = 1336078083 - v24;
  a17 = &STACK[0x61B876722A6C06F];
  a18 = a16;
  a19 = v24 - 467931597;
  a20 = v24 + a9 - 2024873794;
  v25 = sub_20AAE5D1C((uint64_t)&a17);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v23
                                                      + 8
                                                      * (((a22 == ((2 * (a9 ^ 0x288)) ^ (v22 - 118))) * (a9 ^ 0x736)) ^ a9))
                                          - 8))(v25);
}

uint64_t sub_20AABF228(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unint64_t *a14, uint64_t a15, uint64_t a16, unsigned int a17, unint64_t *a18, unint64_t *a19, unint64_t *a20,unsigned int a21)
{
  int v21;
  uint64_t v22;

  a18 = a14;
  a19 = &STACK[0x204BE262838743FE];
  a21 = (v21 + 111) ^ (1225351577
                     * ((2 * (&a17 & 0x7324AAD8) - &a17 + 215700775) ^ 0x2F418D31));
  a20 = &STACK[0x765012DCA7D407AE];
  ((void (*)(unsigned int *))((char *)*(&off_24C363D30 + (v21 | 0x40)) - 8))(&a17);
  a18 = &STACK[0x33AA5AD2543300E3];
  a19 = a14;
  a17 = (v21 + 139) ^ (1374699841
                     * ((-1576750611 - (&a17 | 0xA204B1ED) + (&a17 | 0x5DFB4E12)) ^ 0x300F561B));
  ((void (*)(unsigned int *))*(&off_24C363D30 + v21 - 54))(&a17);
  a18 = a14;
  a17 = (v21 + 884) ^ (1755732067
                     * (((&a17 | 0x82E8E40E) - (&a17 & 0x82E8E40E)) ^ 0x5C2E59D5));
  v22 = sub_20AABD7C8((uint64_t)&a17);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(a12 + 8 * ((1070 * ((_DWORD)a19 == (v21 ^ 0x1244BA55))) ^ v21))
                                          - 8))(v22);
}

uint64_t sub_20AABF3D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13)
{
  int v13;
  uint64_t v14;
  int v15;

  return ((uint64_t (*)(void))(*(_QWORD *)(v14 + 8 * (((((v15 - 1184115107) & 0x46942FBC) + 197) * (a13 == v13)) ^ v15))
                            - 8))();
}

uint64_t sub_20AABF414(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14)
{
  unsigned int v14;
  int v15;
  uint64_t v16;
  int v17;

  v17 = (a14 ^ v15) - ((2 * (a14 ^ v15)) & 0x7176B88) - 2087995964;
  return (*(uint64_t (**)(uint64_t, _QWORD))(v16
                                                    + 8
                                                    * ((432
                                                      * (((v17 << ((2 * (v14 ^ 0x76)) ^ 0x9D)) & 0xDFFFDFFF ^ 0x7174B88)
                                                       + (v17 ^ 0x6C745A3B)
                                                       + 2125960711 != 1857521158)) ^ v14)))(a1, (2 * (v14 ^ 0x476)) ^ 0x502);
}

uint64_t sub_20AABF4B8()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  char v4;

  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (v2 ^ (2
                                     * ((((v2 - 91) ^ (v4 + 124)) ^ (v1 + v0 + 268439553 < (((v2 - 347) | 0x308) ^ 0x741u))) & 1)))))();
}

uint64_t sub_20AABF508(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(_QWORD))(*(_QWORD *)(v4 + 8 * (a2 ^ (201 * ((unint64_t)(v2 - v3) < 0x20))))
                                         - 4))((a2 + 151010551) | 0x48CB203u);
}

uint64_t sub_20AABF548(uint64_t a1, int a2)
{
  unsigned int v2;
  uint64_t v3;
  int v4;

  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((31 * (v2 < v4 + ((((a2 - 1257) | 3) + 8650143) | 0xD08F641u) + 672)) ^ ((a2 - 1257) | 3))))();
}

uint64_t sub_20AABF590()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  v8 = v3 + v2 + v4;
  v9 = v0 + v8;
  v10 = *(_OWORD *)(v9 - 31);
  v11 = v6 + v8;
  *(_OWORD *)(v11 - 15) = *(_OWORD *)(v9 - 15);
  *(_OWORD *)(v11 - 31) = v10;
  return (*(uint64_t (**)(void))(v7 + 8 * ((((v1 & 0xFFFFFFE0) == 32) * (((v5 + 1824) | 0x150) ^ 0x4D6)) ^ (v5 + 1826))))();
}

void sub_20AABF5EC()
{
  JUMPOUT(0x20AABF5A8);
}

uint64_t sub_20AABF5F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v5;
  int v6;
  uint64_t v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * (((((a5 - 884) ^ 0x123) + a5 - 1362) * (v5 == v6)) ^ a5)) - 4))();
}

uint64_t sub_20AABF628(uint64_t a1, uint64_t a2, int a3)
{
  char v3;
  uint64_t v4;
  int v5;

  return (*(uint64_t (**)(void))(v4 + 8 * ((2016 * ((v3 & 0x18) == (((a3 ^ 0x5C1) + v5) ^ (v5 + 1981)))) ^ a3)))();
}

uint64_t sub_20AABF660(uint64_t a1, int a2)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;

  v10 = -v7;
  *(_QWORD *)(v8 - 7 + (v5 + v4 + v6 + v10)) = *(_QWORD *)(v2 - 7 + (v5 + v4 + v6 + v10));
  return (*(uint64_t (**)(void))(v9 + 8 * ((35 * ((((a2 - 31) ^ 0xFFFFF866) & v3) + v10 != 8)) ^ (a2 - 31))))();
}

uint64_t sub_20AABF6C8(int a1, uint64_t a2, int a3)
{
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;

  *(_QWORD *)(a2 + (v3 + v6)) = *(_QWORD *)(v4 + (v3 + v6));
  return (*(uint64_t (**)(void))(v7 + 8 * (((a3 + v6 != 8) * v5) ^ a1)))();
}

uint64_t sub_20AABF6F4(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  int v4;
  uint64_t v5;
  int v6;

  return (*(uint64_t (**)(void))(v5
                              + 8
                              * (int)(((((v4 + 1610545371) & 0xAD8DF7CB ^ (v6 + 1599)) + v4 - 1278) * (v3 == a3)) ^ v4)))();
}

uint64_t sub_20AABF734@<X0>(int a1@<W0>, int a2@<W8>)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;

  *(_BYTE *)(v4 + ((2 * (a1 ^ (v6 + 1926))) ^ 0x91487967) + v3) = *(_BYTE *)(v2
                                                                           + ((2 * (a1 ^ (v6 + 1926))) ^ 0x91487967)
                                                                           + v3);
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((25 * (v3 - 1 != a2)) ^ (v7 + a1 + 2121))) - 8))();
}

uint64_t sub_20AABF784(uint64_t a1, int a2)
{
  int v2;
  void (*v3)(_BYTE *);
  _DWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[4];
  unsigned int v10;
  uint64_t v11;

  *v4 = v2;
  v5 = a2 + 380;
  v11 = v7;
  v10 = a2
      + 553
      + 535753261
      * (((v9 | 0x4A8F50E8) - v9 + (v9 & 0xB570AF10)) ^ 0x407B5EC7)
      - 223;
  v3(v9);
  v11 = v8;
  v10 = v5
      + 535753261 * ((-1690329252 - (v9 | 0x9B3F9F5C) + (v9 | 0x64C060A3)) ^ 0x6E346E8C)
      - 50;
  v3(v9);
  return 0;
}

void sub_20AABF890(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v1 = 235795823 * (((a1 | 0x1A7DF74B) - (a1 | 0xE58208B4) - 444462924) ^ 0x8ED0BE12);
  v2 = *(_DWORD *)(a1 + 40) ^ v1;
  v3 = *(_DWORD *)a1 ^ v1;
  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = 1374699841 * ((-1415111526 - (&v8 | 0xABA71C9A) + (&v8 | 0x5458E365)) ^ 0x39ACFB6C);
  v15 = *(_DWORD *)(a1 + 64) - v1 - v7 - 109194714;
  v8 = v6;
  v14 = v4;
  v13 = v7 ^ (v3 - 323075631);
  v9 = v7 ^ (v2 + 1695027335);
  v12 = v5;
  v10 = v6;
  sub_20AAE59C8((uint64_t)&v8);
  __asm { BR              X8 }
}

uint64_t sub_20AABFA10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, unint64_t *a11, char a12, int a13, uint64_t a14, int a15)
{
  uint64_t v15;
  char v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  int v22;
  char v23;
  unsigned int v24;
  uint64_t v25;

  v23 = *(_BYTE *)(v15 + 24) - v16;
  v24 = 1759421093 * (&a10 ^ 0xB37DB054);
  a13 = v24 + 1217067515 + v22;
  a14 = v21;
  a11 = &STACK[0x5C6940C6B1BC703A];
  a15 = v20 - v24 + 1288;
  a12 = (((((v20 + 63) ^ 0xED) - 5 * v23) ^ 0xFD) + ((2 * (((v20 + 63) ^ 0xED) - 5 * v23)) & 0xFB) + 124) ^ (-91 * (&a10 ^ 0x54));
  v25 = (*(uint64_t (**)(int *))(v17 + 8 * (v20 + 4)))(&a10);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v19 + 8 * ((478 * (a10 == v18)) ^ v20)) - 4))(v25);
}

uint64_t sub_20AABFAD8()
{
  int v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8
                                             * ((112 * (((3 * (v0 ^ 0x56D)) ^ 0xC8CB46B8) + v2 > 0xFFFFFFFD)) ^ v0))
                            - 12))();
}

void sub_20AABFB18(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;

  *(_DWORD *)(a1 - 0x33AA5AD2543300C3) = v2 - 1;
  *(_DWORD *)(v1 + 68) = 306494155;
}

void sub_20AABFC98(uint64_t a1, uint64_t a2)
{
  __asm { BR              X9 }
}

uint64_t sub_20AABFD20@<X0>(uint64_t a1@<X1>, unsigned int a2@<W8>)
{
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((366 * (**(_BYTE **)(a1 + 8) == 0)) ^ a2)) - 12))();
}

uint64_t sub_20AABFD70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint64_t v45;

  *(_QWORD *)(*(_QWORD *)(a16 + 96) + 504) = v41 + 1;
  *(_DWORD *)(*(_QWORD *)(a16 + 96) + 496) = a17 - 1;
  v44 = 1178560073 * ((((v43 - 160) | 0x54D7D675) - ((v43 - 160) & 0x54D7D675)) ^ 0xEE43AE17);
  *(_DWORD *)(v43 - 160) = 1063949783 - v44;
  *(_QWORD *)(v43 - 152) = &STACK[0xB7BFC0B778596F6];
  *(_DWORD *)(v43 - 144) = -1882357464 - v44;
  v45 = sub_20AABEAE0(v43 - 160);
  return (*(uint64_t (**)(uint64_t))(v42
                                            + 8
                                            * ((97
                                              * (a17
                                               + 2074751881
                                               + ((2 * (a41 & 0x3F)) ^ 0x58)
                                               + (a41 & 0x3F ^ 0x73FF1153u) < 0xFFFFFFC0)) ^ 0xBFu)))(v45);
}

uint64_t sub_20AABFF70(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  unsigned int v16;
  _BOOL4 v17;

  v16 = v13 - 1946095998;
  if (v16 <= 0x40)
    v16 = 64;
  v17 = (_DWORD)a4 - v12 - v14 + ((a3 + 472) | 0xC2) + v16 > 0xE;
  return ((uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 + 8 * ((v17 | (4 * v17)) ^ a3)) - 8))(-v14, 64, 2885742494, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

uint64_t sub_20AABFFF0(int a1, int a2, uint64_t a3, int a4)
{
  int v4;
  int v5;
  int v6;
  int v7;
  unsigned int v8;
  uint64_t v9;
  int v10;
  int v11;

  v10 = v6 + v4;
  v11 = v10 + v5;
  if ((v10 + v5) <= 0x40)
    v11 = a2;
  return ((uint64_t (*)(void))(*(_QWORD *)(v9
                                        + 8
                                        * ((50
                                          * (a4 - v10 + 2011 >= a1
                                                              + v7
                                                              + ((v8 - 1336) ^ (a4 + 2234))
                                                              + ((v8 ^ 0x7D9) << 6)
                                                              + v11)) ^ v8))
                            - 12))();
}

uint64_t sub_20AAC0050(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,int a32,char a33)
{
  int v33;
  int v34;
  unsigned int v35;
  uint64_t v36;

  return ((uint64_t (*)(void))(*(_QWORD *)(v36
                                        + 8
                                        * ((44
                                          * ((unint64_t)(&a33 + ~a18 + (v33 + v34 - 1)) >= ((v35 + 1234092595) & 0x113FEF ^ 0x2B3uLL))) ^ v35))
                            - ((v35 + 1376598245) & 0x12C7FF)
                            + 353))();
}

uint64_t sub_20AAC00C8@<X0>(unsigned int a1@<W8>)
{
  int v1;
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  int8x16_t *v5;
  uint64_t v6;
  int8x16_t v7;
  int8x16_t v8;

  v7.i64[0] = 0xF6F6F6F6F6F6F6F6;
  v7.i64[1] = 0xF6F6F6F6F6F6F6F6;
  v8.i64[0] = 0xFBFBFBFBFBFBFBFBLL;
  v8.i64[1] = 0xFBFBFBFBFBFBFBFBLL;
  *(int8x16_t *)(v4 + v1 + ((v2 - 229) ^ a1)) = vaddq_s8(vsubq_s8(*v5, vandq_s8(vaddq_s8(*v5, *v5), v7)), v8);
  return (*(uint64_t (**)(int8x16_t *))(v6 + 8 * ((598 * (((v3 + 1) & 0x1FFFFFFF0) == 16)) ^ v2)))(v5 + 1);
}

void sub_20AAC0134()
{
  JUMPOUT(0x20AAC00FCLL);
}

uint64_t sub_20AAC0140()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((((v2 ^ 0x223) - 626) ^ 0x3A) * (v0 == v1)) | v2)) - 4))();
}

uint64_t sub_20AAC0174(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,int32x4_t a45,int32x4_t a46,int32x4_t a47,int32x4_t a48)
{
  int v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  int v54;
  uint64_t (*v55)(__n128, __n128, __n128, __n128, __n128);
  __n128 v56;
  __n128 v57;
  __n128 v58;
  __n128 v59;
  __n128 v60;
  uint64_t v61;
  unsigned int v62;
  unsigned int v63;
  uint64_t v64;
  int v65;
  uint8x16_t v66;
  uint16x8_t v67;
  int8x16_t v68;
  int8x16_t v69;
  uint16x8_t v70;
  int8x16_t v71;
  int8x16_t v72;
  uint8x16_t v73;
  uint16x8_t v74;
  uint16x8_t v75;
  uint8x16_t v76;
  int8x16_t v79;
  int8x16_t v84;
  int32x4_t v85;
  int32x4_t v86;
  int32x4_t v87;
  int32x4_t v88;
  uint64_t v90;
  uint8x16_t v91;
  uint16x8_t v92;
  uint16x8_t v93;
  uint8x16_t v94;
  uint8x16_t v99;
  uint16x8_t v100;
  uint16x8_t v101;
  int32x4_t v102;
  int32x4_t v103;
  int32x4_t v104;
  int32x4_t v105;
  _DWORD *v106;
  int v107;
  uint64_t v108;
  int v109;
  int v110;
  unint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  unint64_t v116;
  int8x16x4_t v117;
  int8x16x4_t v118;

  v55 = (uint64_t (*)(__n128, __n128, __n128, __n128, __n128))(*(_QWORD *)(v53 + 8 * v48) - 12);
  HIDWORD(v113) = -2002322449;
  v56 = (__n128)vdupq_n_s32(0x1244BACFu);
  v57 = (__n128)vdupq_n_s32(0x1244BACBu);
  v58.n128_u64[0] = 0xFBFBFBFBFBFBFBFBLL;
  v58.n128_u64[1] = 0xFBFBFBFBFBFBFBFBLL;
  LODWORD(a26) = (a5 - 535848951) & 0xBDBE773F;
  v116 = (4 * (_DWORD)a26) ^ 0x154u ^ (unint64_t)(v51 - 1080);
  v59 = (__n128)vdupq_n_s32(0x1244BADFu);
  v60.n128_u64[0] = 0xF6F6F6F6F6F6F6F6;
  v60.n128_u64[1] = 0xF6F6F6F6F6F6F6F6;
  v61 = HIDWORD(a41);
  v115 = __PAIR64__(a42, HIDWORD(a41));
  v62 = HIDWORD(a42);
  v63 = a43;
  v64 = a43;
  v65 = BYTE4(a44) ^ 0xE;
  LODWORD(v113) = BYTE4(a44) ^ 0xE;
  if (v65 == 2)
  {
    v114 = *(_QWORD *)(v53 + 8 * v48) - 12;
    v118 = vld4q_s8((const char *)&a32 + 4);
    v90 = HIDWORD(a43);
    HIDWORD(a19) = HIDWORD(a43);
    v91 = (uint8x16_t)veorq_s8(v118.val[0], (int8x16_t)v58);
    v92 = vmovl_u8(*(uint8x8_t *)v91.i8);
    v93 = vmovl_high_u8(v91);
    v94 = (uint8x16_t)veorq_s8(v118.val[1], (int8x16_t)v58);
    _Q22 = vmovl_u8(*(uint8x8_t *)v94.i8);
    _Q21 = vmovl_high_u8(v94);
    __asm
    {
      SHLL2           V23.4S, V21.8H, #0x10
      SHLL2           V24.4S, V22.8H, #0x10
    }
    v99 = (uint8x16_t)veorq_s8(v118.val[2], (int8x16_t)v58);
    v100 = vmovl_high_u8(v99);
    v101 = vmovl_u8(*(uint8x8_t *)v99.i8);
    v118.val[0] = veorq_s8(v118.val[3], (int8x16_t)v58);
    v118.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v118.val[0]);
    v118.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v118.val[1]);
    v118.val[1] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v118.val[1].i8);
    v118.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v118.val[0].i8);
    v118.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v118.val[0]);
    v118.val[0] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v118.val[0].i8);
    v102 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q22.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v101.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v92.i8), 0x18uLL)), v118.val[0]);
    v103 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(_Q24, (int8x16_t)vshll_high_n_u16(v101, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v92), 0x18uLL)), v118.val[3]);
    v104 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q21.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v100.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v93.i8), 0x18uLL)), v118.val[1]);
    v105 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(_Q23, (int8x16_t)vshll_high_n_u16(v100, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v93), 0x18uLL)), v118.val[2]);
    v118.val[0] = veorq_s8(vandq_s8((int8x16_t)v102, (int8x16_t)v56), (int8x16_t)(*(_OWORD *)v118.val & __PAIR128__(0xFFFFFF04FFFFFF04, 0xFFFFFF04FFFFFF04)));
    v118.val[3] = veorq_s8(vandq_s8((int8x16_t)v103, (int8x16_t)v56), (int8x16_t)(*(_OWORD *)&v118.val[3] & __PAIR128__(0xFFFFFF04FFFFFF04, 0xFFFFFF04FFFFFF04)));
    v118.val[1] = veorq_s8(vandq_s8((int8x16_t)v104, (int8x16_t)v56), (int8x16_t)(*(_OWORD *)&v118.val[1] & __PAIR128__(0xFFFFFF04FFFFFF04, 0xFFFFFF04FFFFFF04)));
    v118.val[2] = veorq_s8(vandq_s8((int8x16_t)v105, (int8x16_t)v56), (int8x16_t)(*(_OWORD *)&v118.val[2] & __PAIR128__(0xFFFFFF04FFFFFF04, 0xFFFFFF04FFFFFF04)));
    a47 = vaddq_s32(vsubq_s32(v104, vaddq_s32((int32x4_t)v118.val[1], (int32x4_t)v118.val[1])), (int32x4_t)v57);
    a48 = vaddq_s32(vsubq_s32(v105, vaddq_s32((int32x4_t)v118.val[2], (int32x4_t)v118.val[2])), (int32x4_t)v57);
    a45 = vaddq_s32(vsubq_s32(v102, vaddq_s32((int32x4_t)v118.val[0], (int32x4_t)v118.val[0])), (int32x4_t)v57);
    a46 = vaddq_s32(vsubq_s32(v103, vaddq_s32((int32x4_t)v118.val[3], (int32x4_t)v118.val[3])), (int32x4_t)v57);
    v106 = (_DWORD *)&a45 + v51 + 1172714229;
    v107 = *(v106 - 8) ^ *(v106 - 3);
    v108 = *((unsigned int *)&a45 + v116 + 1172714229);
    v109 = v108 ^ *(v106 - 14) ^ (v107 + v50 - ((2 * v107) & 0x24897596));
    HIDWORD(v111) = v109 ^ v50;
    LODWORD(v111) = v109;
    v110 = v111 >> 31;
    v112 = (2 * v110) & 0x24897596;
    *v106 = v110 + v50 - v112;
    HIDWORD(a17) = a17 + 2018525495;
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, unint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v53 + 8 * (int)((1223 * (v49 == 1172714166)) ^ a26)) - 12))(v112, v61, 17437257, v64, v90, v108, 612988310, 409, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             v113,
             __PAIR64__(v63, v62),
             v114,
             v115,
             v116,
             a26,
             v49 - 16,
             a28,
             a29,
             a30,
             a31,
             a32,
             a33,
             a34,
             a35,
             a36,
             a37,
             a38,
             a39,
             a40,
             a41,
             a42,
             a43,
             a44);
  }
  else if (v65 == 1)
  {
    v117 = vld4q_s8((const char *)&a32 + 4);
    v66 = (uint8x16_t)veorq_s8(v117.val[0], (int8x16_t)v58);
    v67 = vmovl_u8(*(uint8x8_t *)v66.i8);
    v68 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v67.i8);
    v69 = (int8x16_t)vmovl_high_u16(v67);
    v70 = vmovl_high_u8(v66);
    v71 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v70.i8);
    v72 = (int8x16_t)vmovl_high_u16(v70);
    v73 = (uint8x16_t)veorq_s8(v117.val[1], (int8x16_t)v58);
    v74 = vmovl_high_u8(v73);
    v75 = vmovl_u8(*(uint8x8_t *)v73.i8);
    v76 = (uint8x16_t)veorq_s8(v117.val[2], (int8x16_t)v58);
    _Q26 = (int8x16_t)vmovl_high_u8(v76);
    _Q25 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v76.i8);
    v79 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q25.i8, 0x10uLL);
    __asm { SHLL2           V25.4S, V25.8H, #0x10 }
    v84 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q26.i8, 0x10uLL);
    __asm { SHLL2           V26.4S, V26.8H, #0x10 }
    v117.val[0] = veorq_s8(v117.val[3], (int8x16_t)v58);
    v117.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v117.val[0]);
    v117.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v117.val[1]);
    v117.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v117.val[0].i8);
    v117.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v117.val[0]);
    v117.val[0] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v117.val[0].i8), 0x18uLL), v79), vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v75.i8, 8uLL), v68));
    v117.val[3] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v117.val[3], 0x18uLL), _Q25), vorrq_s8((int8x16_t)vshll_high_n_u16(v75, 8uLL), v69));
    v117.val[1] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v117.val[1].i8), 0x18uLL), v84), vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v74.i8, 8uLL), v71));
    v117.val[2] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v117.val[2], 0x18uLL), _Q26), vorrq_s8((int8x16_t)vshll_high_n_u16(v74, 8uLL), v72));
    v85 = (int32x4_t)veorq_s8(vandq_s8(v117.val[0], (int8x16_t)v59), (int8x16_t)(*(_OWORD *)&v68 & __PAIR128__(0xFFFFFF14FFFFFF14, 0xFFFFFF14FFFFFF14)));
    v86 = (int32x4_t)veorq_s8(vandq_s8(v117.val[3], (int8x16_t)v59), (int8x16_t)(*(_OWORD *)&v69 & __PAIR128__(0xFFFFFF14FFFFFF14, 0xFFFFFF14FFFFFF14)));
    v87 = (int32x4_t)veorq_s8(vandq_s8(v117.val[1], (int8x16_t)v59), (int8x16_t)(*(_OWORD *)&v71 & __PAIR128__(0xFFFFFF14FFFFFF14, 0xFFFFFF14FFFFFF14)));
    v88 = (int32x4_t)veorq_s8(vandq_s8(v117.val[2], (int8x16_t)v59), (int8x16_t)(*(_OWORD *)&v72 & __PAIR128__(0xFFFFFF14FFFFFF14, 0xFFFFFF14FFFFFF14)));
    a47 = vaddq_s32(vsubq_s32((int32x4_t)v117.val[1], vaddq_s32(v87, v87)), (int32x4_t)v57);
    a48 = vaddq_s32(vsubq_s32((int32x4_t)v117.val[2], vaddq_s32(v88, v88)), (int32x4_t)v57);
    a45 = vaddq_s32(vsubq_s32((int32x4_t)v117.val[0], vaddq_s32(v85, v85)), (int32x4_t)v57);
    a46 = vaddq_s32(vsubq_s32((int32x4_t)v117.val[3], vaddq_s32(v86, v86)), (int32x4_t)v57);
    return ((uint64_t (*)(__n128))(*(_QWORD *)(v53 + 8 * ((a5 - 1647440094) ^ 0x31F)) - 4))(v56);
  }
  else
  {
    HIDWORD(a41) = 2 * (HIDWORD(a41) ^ v54) + v54 - (v52 & (4 * (HIDWORD(a41) ^ v54)));
    LODWORD(a42) = 2 * (a42 ^ v54) + v54 - (v52 & (4 * (a42 ^ v54)));
    HIDWORD(a42) = 2 * (HIDWORD(a42) ^ v54) + v54 - (v52 & (4 * (HIDWORD(a42) ^ v54)));
    LODWORD(a43) = 2 * (a43 ^ v54) + v54 - (v52 & (4 * (a43 ^ v54)));
    return v55(v56, v57, v58, v59, v60);
  }
}

uint64_t sub_20AAC0E1C(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,int a21,int a22,unsigned int a23)
{
  int v23;
  uint64_t v24;
  _BOOL4 v25;

  if (a3 < a23 != a20 + 717383244 < (v23 + a5 - 2002323191))
    v25 = a20 + 717383244 < (v23 + a5 - 2002323191);
  else
    v25 = a20 + 717383244 > a3;
  return (*(uint64_t (**)(BOOL))(v24 + 8
                                               * ((1901 * (((a5 ^ (a5 + 306) ^ v25) & 1) == 0)) ^ (v23 + a5 - 551))))(a20 + 717383244 > a3);
}

uint64_t sub_20AAC0EB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;

  return ((uint64_t (*)(void))(*(_QWORD *)(v9
                                        + 8
                                        * (((v5 ^ v6 ^ (a5 - 408)) * (v7 + v8 + 63 >= (v7 + v8))) ^ v5))
                            - 12))();
}

uint64_t sub_20AAC0EE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;

  return ((uint64_t (*)(void))(*(_QWORD *)(v22
                                        + 8
                                        * (((~a18 + v19 - (unint64_t)(((v18 - v20 - 24) ^ 0xC02A9BFB) + v21) > 0xF)
                                          * (v20 + ((v18 - 138677504) & 0x6A75FBE7) - 390)) ^ v18))
                            - 12))();
}

uint64_t sub_20AAC0F4C(double a1, double a2, int8x16_t a3, double a4, int8x16_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, unint64_t a11, int a12)
{
  int v12;
  int8x16_t *v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  *v13 = vaddq_s8(vsubq_s8(*(int8x16_t *)(v17 + (v15 + v16)), vandq_s8(vaddq_s8(*(int8x16_t *)(v17 + (v15 + v16)), *(int8x16_t *)(v17 + (v15 + v16))), a5)), a3);
  return ((uint64_t (*)(void))(*(_QWORD *)(v18
                                        + 8
                                        * (((((v12 - a10 + 88) ^ a11) == 64) * a12) ^ (v14 + v12 - 467)))
                            - 12))();
}

uint64_t sub_20AAC0FAC@<X0>(int a1@<W7>, uint64_t a2@<X8>)
{
  int v2;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)(v3 + a2) = *(_BYTE *)(v7 + (v5 + v6))
                      - ((2 * *(_BYTE *)(v7 + (v5 + v6))) & 0xF7)
                      - 5;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * (((a2 == 63) * a1) ^ (v4 + v2 - 552))) - 12))();
}

uint64_t sub_20AAC1000(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17)
{
  int v17;
  int v18;
  uint64_t v19;
  _BOOL4 v20;

  v20 = v17 + 1992159650 < (a17 - 1001665331);
  if ((a17 - 1001665331) < 0xD4A28785 != (v17 + 1992159650) < 0xD4A28785)
    v20 = (a17 - 1001665331) < 0xD4A28785;
  return ((uint64_t (*)(void))(*(_QWORD *)(v19 + 8 * ((v20 * ((v18 ^ 0x3CC) + 1972)) ^ v18)) - 4))();
}

uint64_t sub_20AAC1070(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,int a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,unsigned int a42)
{
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v48;

  v48 = a2;
  v44 = 628203409 * ((v43 - 160) ^ 0x82880C33);
  *(_DWORD *)(v43 - 152) = v44 + a2 + 1618;
  *(_DWORD *)(v43 - 148) = a17 - v44 + 558389106;
  *(_QWORD *)(v43 - 160) = a14;
  v45 = sub_20AABE384(v43 - 160);
  v46 = a42 & (v48 ^ 2);
  *(&a33 + (v46 ^ 0x2C)) = 123;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v42
                                                      + 8 * (int)((1650 * ((v46 ^ 0x2C) > 0x37)) ^ a2))
                                          - 12))(v45);
}

uint64_t sub_20AAC1150()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((97 * (v0 == (v1 ^ 2))) ^ v1 ^ 0x705))
                            + 1647440141
                            - (((v1 ^ 0x705) + 1610684970) | 0x230D084u)
                            + 213))();
}

uint64_t sub_20AAC11A8@<X0>(int a1@<W8>)
{
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((250
                                          * ((a1 ^ 0x13u) < (((v1 ^ 0x77B) + 1506571890) & 0xA6338F4B ^ (v2 - 2269))
                                                          + (((v1 ^ 0x77B) + 1652553635) & 0xFFB1F9FF))) ^ v1 ^ 0x77B))
                            - 8))();
}

uint64_t sub_20AAC1218(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,int a32,char a33)
{
  uint64_t v33;
  int v34;
  char v35;
  uint64_t v36;

  *(_QWORD *)(&a33 + v33 - 50497077) = 0xFBFBFBFBFBFBFBFBLL;
  return ((uint64_t (*)(void))(*(_QWORD *)(v36 + 8 * ((168 * ((v35 & 0x38) == 8)) ^ v34)) - 5 * (v34 ^ 0x624u) + 177))();
}

uint64_t sub_20AAC1270(double a1)
{
  uint64_t v1;
  double *v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  *v2 = a1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * (((v5 == 0) * v4) ^ v3)) - v1 + 177))();
}

uint64_t sub_20AAC1298(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((((v5 ^ (a5 - 135)) - 1647438999) * (v7 == v6)) ^ v5)) - 8))();
}

void sub_20AAC12CC()
{
  JUMPOUT(0x20AAC0210);
}

uint64_t sub_20AAC12DC@<X0>(int a1@<W0>, unsigned int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,int a26,char a27)
{
  int v27;
  unsigned int v28;
  int v29;
  int v30;
  int v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  unsigned int v35;
  int v36;
  _BOOL4 v37;

  *(&a27 + (v27 + v29)) = *(_BYTE *)(v32 + (v30 + v31))
                                      - ((2 * *(_BYTE *)(v32 + (v30 + v31))) & 0xF7)
                                      - 5;
  v35 = v30 + 1 + a1;
  v36 = (a2 < v28) ^ (v35 < v28);
  v37 = v35 < a2;
  if (v36)
    v37 = a2 < v28;
  return ((uint64_t (*)(void))(*(_QWORD *)(v34 + 8 * ((2033 * v37) ^ v33)) - 4))();
}

uint64_t sub_20AAC135C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v5;
  int v6;
  int v7;
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8
                                        + 8
                                        * ((491 * (v5 - 50497077 < 7 * (v7 ^ (a5 - 119)) - 903)) ^ (v6 + v7 + 356)))
                            - 4))();
}

uint64_t sub_20AAC13A4()
{
  unsigned int v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  v3 = v0;
  v4 = v0 - 50497077;
  v5 = (unint64_t)v0 - 50497076 > 0x38;
  v6 = 56;
  if (v5)
    v6 = v4 + 1;
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((123
                                * (v6 - v3 + ((v1 + 159) ^ 0x302826BuLL) < (((v1 + 1645284743) | 0x20E0A0u) ^ 0x6231F1EEuLL))) ^ v1)))();
}

uint64_t sub_20AAC1428(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,int a32,char a33)
{
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  *(_QWORD *)(&a33 + v35 + (v34 ^ 0x79A) - 964) = 0xFBFBFBFBFBFBFBFBLL;
  return ((uint64_t (*)(void))(*(_QWORD *)(v36 + 8 * (int)((220 * ((v33 & 0xFFFFFFFFFFFFFFF8) == 8)) ^ v34)) - 8))();
}

uint64_t sub_20AAC1478(double a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(double *)(v4 + (v1 ^ 0x79A)) = a1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * (int)(((v3 == 0) * v2) ^ v1)) - 8))();
}

uint64_t sub_20AAC14A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;

  return (*(uint64_t (**)(void))(v8 + 8 * (int)(((((a5 + v7 - 964) ^ 0xFFFFE57F) + a5 + v7 - 964) * (v5 == v6)) ^ v7)))();
}

void sub_20AAC14E4()
{
  JUMPOUT(0x20AAC0210);
}

uint64_t sub_20AAC19DC@<X0>(uint64_t a1@<X1>, unsigned int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,int a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,int a39)
{
  int v39;
  int v40;
  int v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int v45;
  _BOOL4 v46;

  v44 = (v42 + v39);
  v45 = *(_DWORD *)(&a27 + v44 + 72);
  *(_BYTE *)(a1 + v44) = (HIBYTE(v45) ^ 0x11) - ((2 * (HIBYTE(v45) ^ 0x11)) & 0xF7) - 5;
  *(_BYTE *)(a1 + (v44 + 1)) = ((v45 >> (v40 + 42)) ^ 0xA) + (~(2 * ((v45 >> (v40 + 42)) ^ 0xA)) | 9) - 4;
  *(_BYTE *)(a1 + (v44 + 2)) = (BYTE1(v45) ^ 0x12) - ((2 * (BYTE1(v45) ^ 0x12)) & 0xF7) - 5;
  *(_BYTE *)(a1 + (v44 + 3)) = v45 ^ 0xB2;
  v46 = v42 + 2079235944 < (a39 + 1889973554);
  if (v42 + 2079235944 < a2 != a39 + 1889973554 < a2)
    v46 = a39 + 1889973554 < a2;
  return ((uint64_t (*)(void))(*(_QWORD *)(v43 + 8 * ((v46 * v41) ^ v40)) - 12))();
}

void sub_20AAC1B58()
{
  JUMPOUT(0x20AAC1B2CLL);
}

uint64_t sub_20AAC1B64@<X0>(uint64_t a1@<X3>, uint64_t a2@<X4>, uint64_t a3@<X5>, uint64_t a4@<X6>, uint64_t a5@<X7>, int a6@<W8>, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  uint64_t v43;

  *(_DWORD *)(&a43 + a27) = 204666586;
  return ((uint64_t (*)(uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 + 8 * ((398 * (((122 * (a6 ^ 0x30A) + 748684915) & 0xD35FFBBF ^ (122 * (a6 ^ 0x30A) + 1777359527)) != 1777359037)) ^ (122 * (a6 ^ 0x30A)))) - 12))(1777359036, 204666586, &a43 + a27, a1, a2, a3, a4, a5, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17,
           a18,
           a19,
           a20,
           a21);
}

uint64_t sub_20AAC1C28(int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v5;
  int v6;
  uint64_t v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * (v5 ^ (78 * (v6 != a1))))
                            - (((v5 + 1790440640) & 0xF779F9FE)
                             - a5
                             + 1429)
                            + 1417))();
}

uint64_t sub_20AAC1C80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,int a31)
{
  int v31;
  int v32;
  uint64_t v33;
  int v34;
  int v35;
  uint64_t v36;
  int v37;
  _BOOL4 v38;

  v35 = 963 * (v31 ^ (a5 - 2));
  v36 = 4 * (v31 ^ (a5 - 11));
  v37 = v32 + v31 + 558;
  v38 = a31 - 2054930630 < (v34 - 1149325732);
  if (a31 - 2054930630 < (v35 - 875208307) != (v34 - 1149325732) < 0xCBD56913)
    v38 = (v34 - 1149325732) < 0xCBD56913;
  return ((uint64_t (*)(void))(*(_QWORD *)(v33 + 8 * ((42 * !v38) ^ v37)) - (v36 ^ 0xFC)))();
}

uint64_t sub_20AAC1ED0()
{
  int v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  _BOOL4 v4;

  v4 = *(_DWORD *)(v1 + 48 * (v2 - 1777359716 + ((v0 - 1640238999) & 0x61C40AB7)) + 36) == v2;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((4 * v4) | (32 * v4)) ^ v0))
                            - ((v0 - 1682) ^ 0xF0)))();
}

uint64_t sub_20AAC1F34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;

  v18 = 628203409 * ((((2 * (v17 - 160)) | 0x4C22FA34) - (v17 - 160) - 638680346) ^ 0xA4997129);
  *(_DWORD *)(v17 - 144) = v14 - v18 + 1088;
  *(_DWORD *)(v17 - 140) = v16 - v18 + ((((v14 + 1109405550) | 0x2011C184) - 1612676662) ^ (v14 + 1125));
  *(_QWORD *)(v17 - 120) = v12;
  *(_QWORD *)(v17 - 112) = a10;
  *(_QWORD *)(v17 - 160) = a11;
  *(_QWORD *)(v17 - 152) = a9;
  *(_QWORD *)(v17 - 136) = a12;
  v19 = ((uint64_t (*)(uint64_t))((char *)*(&off_24C363D30 + v14 - 90) - 8))(v17 - 160);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v15 + 8 * ((649 * (*(_DWORD *)(v17 - 128) == v13)) ^ v14))
                                          - 12))(v19);
}

uint64_t sub_20AAC2024(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6
                                                                                 + 8
                                                                                 * ((233
                                                                                   * (((*(_DWORD *)(v3
                                                                                                  + 48 * (v5 - 1777359037)) == (v4 ^ 0x7FE) + 1828712174) ^ v4) & 1)) ^ v4))
                                                                     - 12))(a1, a2, a3, v3);
}

uint64_t sub_20AAC2084@<X0>(int a1@<W4>, int a2@<W8>)
{
  int v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((((a1 + v2 - 1933312151) & 0x733BFDEF ^ (a1 + 799))
                                          * ((a2 ^ 0x6DBB3C2D) == v3 - 1845490069)) ^ v2))
                            - 4))();
}

void sub_20AAC20EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  __asm { BR              X10 }
}

uint64_t sub_20AAC2174@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,int a26,int a27,int a28)
{
  int v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  int v32;
  int v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  *(_DWORD *)(a1 + 392) = a3;
  *(_DWORD *)(a1 + 396) = a28;
  *(_QWORD *)(a1 + 400) = a25;
  *(_DWORD *)(a1 + 408) = a26 - v28 + 368151637;
  *(_QWORD *)(a1 + 416) = v29 + ((v33 + 1223) ^ 0xB9AED149) + v28;
  v35 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 48 * v32 + 8))(a11, a20);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 + 8 * ((1403 * ((_DWORD)v35 + v30 - (v34 & (2 * (_DWORD)v35)) == ((v33 - 357437616) & 0x777FFFEE) - 1340946203)) ^ v33)) - 4))(v35, v36, a22, v37, 1647440358, v38, v39, v40, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

uint64_t sub_20AAC2240(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  unint64_t v5;
  uint64_t v6;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6
                                                                                 + 8
                                                                                 * (int)(((v5 < (unint64_t)(122 * (v4 ^ 0x76Cu))
                                                                                              - 241)
                                                                                        * ((v4 + 578431121) & 0xDD85D0F4 ^ 0x23)) ^ v4))
                                                                     - 8))(a1, a2, a3, v3);
}

uint64_t sub_20AAC2294@<X0>(uint64_t a1@<X3>, int a2@<W8>)
{
  uint64_t v2;
  int v3;

  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v2
                                                               + 8
                                                               * (((*(_DWORD *)(a1 + 48 * v3 + 36)
                                                                  + ((a2 + 35680492) | 0x60118006u)
                                                                  - 1277315747 < 0x80000003)
                                                                 * (((a2 - 77) | 0x200) - 180)) ^ a2))
                                                   - 12))(1777359036, 204666586);
}

uint64_t sub_20AAC2318(uint64_t a1, uint64_t a2, _DWORD *a3, uint64_t a4, int a5)
{
  int v5;
  uint64_t v6;

  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v6
                                                               + 8
                                                               * ((((*a3 - 204666586) < 0x10)
                                                                 * (((v5 + 572555250) | 0x40117100) ^ (a5 + 349))) ^ v5))
                                                   - 12))(1777359036, 204666586);
}

uint64_t sub_20AAC2384(uint64_t a1, uint64_t a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,int a31)
{
  int v31;
  int v32;
  int v33;
  int v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  int v38;
  _DWORD *v39;

  v39 = &a3[6 * v33];
  v39[2] = v36;
  v39[3] = v34;
  *((_QWORD *)v39 + 2) = v35;
  v39[6] = a31;
  *a3 = v32 + 1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v37
                                        + 8
                                        * ((1633
                                          * (*(_DWORD *)(a4 + 48 * v38 + 32)
                                           + ((v31 - 407637245) & 0x7A7DFDEE ^ 0x743E56A5u) < 0x80000003)) ^ v31))
                            - ((v31 + 1557330107) & 0xA32D0757 ^ 0x10BLL)))();
}

uint64_t sub_20AAC2424@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  int v23;
  uint64_t v24;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 + 8 * (int)((431 * (((2 * ((a9 + 2025356768) & 0x874783BF)) ^ 0x5BA ^ (v23 + ((a9 + 2025356768) & 0x874783BF ^ ((_DWORD)a5 + 347)) - 140)) == 306494155)) ^ (a9 + 2025356768) & 0x874783BF)) - 4))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23);
}

uint64_t sub_20AAC2498(int a1, int a2, _DWORD *a3)
{
  int v3;
  int v4;
  uint64_t v5;
  _BOOL4 v7;

  v7 = v4 != ((v3 + 748684915) & 0xD35FFBBF ^ (a1 + v3 + 491)) || *a3 != a2;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((398 * v7) ^ v3)) - 12))();
}

void sub_20AAC24EC()
{
  JUMPOUT(0x20AAC2508);
}

void sub_20AAC2554(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_20AAC25B8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;
  unsigned int v3;
  int v4;
  int v5;

  *(_DWORD *)(*(_QWORD *)(a2 + 96) + 24) = v4;
  v5 = *(_DWORD *)(a1 + 4) - ((2 * *(_DWORD *)(a1 + 4) + 122849938) & 0x7176B88) + 1932851981;
  return ((uint64_t (*)(_QWORD))(*(_QWORD *)(v2
                                                     + 8
                                                     * ((45
                                                       * (((2 * v5) & 0xDFFFDFFF ^ 0x7174B88)
                                                        + (v5 ^ 0x6C745A3B)
                                                        + 2125960711 != 1857521158)) ^ v3))
                                         - 4))(0);
}

uint64_t sub_20AAC2648()
{
  uint64_t v0;
  int v1;
  int v2;

  return (*(uint64_t (**)(void))(v0
                              + 8
                              * ((1244 * (((((v2 + v1 + 268439553) < 8) ^ 0x14B2E7B2) & 1) == 0)) ^ 0x3DDu)))();
}

uint64_t sub_20AAC26A8(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(void))(v3 + 8 * (a1 ^ (37 * ((unint64_t)(v4 - a3 - 4) > 0x1F)))))();
}

uint64_t sub_20AAC26E0(int a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int v3;

  return ((uint64_t (*)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v2
                                                                      + 8
                                                                      * ((208
                                                                        * (((v3 < 0x20) ^ ((a1 ^ 0xBE) + 108)) & 1)) ^ a1 ^ 0x5BEu))
                                                          - 12))(4 * (a1 ^ 0x379u), a2, 0);
}

uint64_t sub_20AAC272C@<X0>(int a1@<W1>, int a2@<W3>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  unsigned int v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  v8 = v7 + v6 + a1;
  v9 = v4 + v8;
  v10 = *(_OWORD *)(v9 - 31);
  v11 = a3 + v8;
  *(_OWORD *)(v11 - 15) = *(_OWORD *)(v9 - 15);
  *(_OWORD *)(v11 - 31) = v10;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8 * ((878 * ((v5 & 0xFFFFFFE0) == 32)) ^ ((a2 & 0x69AA2FFF) - 1772758103)))
                            - (((a2 & 0x69AA2FFF) + 140102384) & 0x8DFC0F4E)
                            + 1026))();
}

void sub_20AAC27B0()
{
  JUMPOUT(0x20AAC276CLL);
}

uint64_t sub_20AAC27BC(uint64_t a1, uint64_t a2, int a3, int a4, int a5)
{
  uint64_t v5;
  int v6;
  uint64_t v7;

  return ((uint64_t (*)(_QWORD))(*(_QWORD *)(v5
                                                     + 8
                                                     * ((152 * ((((743 * (a5 ^ 0x40C)) ^ (v6 == a3)) & 1) == 0)) ^ a5))
                                         + v7
                                         - (a5 - a4)))(0);
}

uint64_t sub_20AAC2804(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v6;
  char v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(v6
                                        + 8
                                        * (int)((((a6 + 2135557581) & 0x80B5F6F4 ^ 0x2A6) * ((v7 & 0x18) == 0)) ^ a6))
                            - ((a6 - 373968420) & 0x164A49F7 ^ 0x1AALL)))();
}

uint64_t sub_20AAC2864@<X0>(unsigned int a1@<W0>, int a2@<W1>, int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;

  *(_QWORD *)(a4 - 7 + (v8 + v7 + a2 - a3)) = *(_QWORD *)(v5 - 7 + (v8 + v7 + a2 - a3));
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * (int)((1333 * (a3 - (v6 & 0xFFFFFFF8) == -8)) ^ a1))
                            - (a1 ^ 0x298)))();
}

void sub_20AAC28C4()
{
  JUMPOUT(0x20AAC289CLL);
}

uint64_t sub_20AAC28D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  int v5;
  int v6;
  int v7;

  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, _QWORD))(v4
                                                                              + 8 * (((v5 != v7) * (v6 ^ 0x3DD)) ^ v6)))(0, a2, a3, a4, (v6 + 367280235) & 0xEA1BBFAA);
}

uint64_t sub_20AAC290C@<X0>(int a1@<W3>, int a2@<W4>, uint64_t a3@<X8>)
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;

  *(_BYTE *)(a3 + (a1 - 1857521159)) = *(_BYTE *)(v6 + (a1 - 1857521159));
  return (*(uint64_t (**)(_QWORD))(v3
                                           + 8
                                           * (int)(((a1 - 1 != v5) * ((a2 + 2074787389) & 0xEDFF69EF ^ (v4 + 18))) ^ (a2 - 22))))(0);
}

void sub_20AAC2964()
{
  JUMPOUT(0x20AAC2938);
}

void sub_20AAC2978(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 16) ^ (1178560073 * ((((2 * a1) | 0xD7F3130A) - a1 + 335967867) ^ 0x516DF1E7));
  __asm { BR              X14 }
}

uint64_t sub_20AAC2AA0@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int v7;
  int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;

  v12 = v9 > 0x7321D640;
  *(_DWORD *)(a7 + 4 * (a1 + v7 + 311)) = *(_DWORD *)(*(_QWORD *)(v10 - 0x4FF3ADA337C6FFFDLL) + 4 * (a1 + v7 + 311));
  if (v12 == v7 - 114932779 < (int)(v8 ^ 0x8CDE2A19))
    v12 = v7 - 114932779 < (int)(v9 + 215886271);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v11 + 8 * ((1383 * v12) ^ v8)) - 8))(4180034517);
}

uint64_t sub_20AAC2B48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8)
{
  int v8;
  int v9;
  uint64_t v10;
  BOOL v11;

  v11 = v8 + 1384671293 < (int)(a8 + 1715490344);
  if (a8 > 0x19BFB1D7 != v8 + 1384671293 < -431993304)
    v11 = a8 > 0x19BFB1D7;
  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * ((506 * (((v9 - 124) ^ v11) & 1)) ^ v9)) - 4))();
}

uint64_t sub_20AAC2BE8@<X0>(int a1@<W0>, int a2@<W4>, unsigned int a3@<W7>, int a4@<W8>, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  unsigned int v15;
  uint64_t v16;
  _BOOL4 v17;
  int v18;
  int v19;
  _BOOL4 v20;

  v17 = a3 > v15;
  *(_DWORD *)(a10 + 4 * ((v11 ^ 0x1C4) + a4 + v10)) = a2;
  v18 = v10 + 1 + v13;
  v19 = v17 ^ (v18 < v12);
  v20 = v18 < v14;
  if (!v19)
    v17 = v20;
  return ((uint64_t (*)(void))(*(_QWORD *)(v16 + 8 * ((!v17 * a1) ^ v11)) - 4))();
}

uint64_t sub_20AAC2C44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5
                                                                        + 8
                                                                        * (((((v4 - 1270669688) & 0x4BBCE34A) - 653)
                                                                          * (v3 != 0)) ^ v4))
                                                            - 8))(a1, a2, a3);
}

uint64_t sub_20AAC2C84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8, uint64_t a9, _QWORD *a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  int v20;
  _BOOL4 v21;
  unsigned int v22;
  int v23;
  uint64_t v24;
  _BOOL4 v25;

  v17 = 466 * (v14 ^ 0x135);
  v18 = a8 + 236994452 + v17;
  v19 = v17 ^ 0x293;
  v20 = v17 ^ 0x395;
  v21 = a8 > 0x71DFBCC7;
  v22 = (*(_DWORD *)(*a10 - 0x11158D12BF15809DLL) - 640237772) * (*a14 ^ 0x841DCE26);
  v23 = 1755732067 * ((~((v16 - 128) | 0xFD1E16F5) + ((v16 - 128) & 0xFD1E16F5)) ^ 0xDC2754D1);
  *(_DWORD *)(v16 - 112) = v23 ^ 0x1294CF65;
  *(_DWORD *)(v16 - 108) = (v19 ^ 0x23D) - v23 + (v22 ^ 0x3EBD63D2) + ((2 * v22) & 0x7D7AC7A4) - 404054794;
  *(_QWORD *)(v16 - 104) = a12;
  *(_DWORD *)(v16 - 128) = v19 - v23 + 744;
  *(_QWORD *)(v16 - 120) = a11;
  v24 = ((uint64_t (*)(uint64_t))*(&off_24C363D30 + v20))(v16 - 128);
  v25 = v18 > 236995385;
  if (v21)
    v25 = v21;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v15 + 8 * ((659 * v25) ^ v19)) - 8))(v24);
}

void sub_20AAC2E24()
{
  JUMPOUT(0x20AAC2CDCLL);
}

uint64_t sub_20AAC2E2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, _DWORD *a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;

  v14 = 1374699841 * ((((2 * (v13 - 128)) | 0x9AA5B9E0) - (v13 - 128) - 1297276144) ^ 0x20A6C4F9);
  *(_QWORD *)(v13 - 120) = a11;
  *(_DWORD *)(v13 - 128) = v12 - v14 + 788;
  *(_DWORD *)(v13 - 124) = v14
                         + ((a8 << 6) & 0xBFFAB980)
                         + ((a8 << ((31 * (v12 ^ 6)) ^ 0x71)) ^ 0xDFFD5CCF)
                         + 1952442359;
  sub_20AAB224C(v13 - 128);
  return (*(uint64_t (**)(void))(v11 + 8 * ((27 * ((*a9 - 311742310) < 0x7FFFFFFF)) ^ v12)))();
}

uint64_t sub_20AAC2F08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  *(_DWORD *)(v15 - 112) = v13
                         + 1374699841 * ((((v15 - 128) | 0x312B6D0F) - ((v15 - 128) & 0x312B6D0F)) ^ 0x5CDF7506)
                         + 714;
  *(_QWORD *)(v15 - 128) = a12;
  *(_QWORD *)(v15 - 120) = &STACK[0x4FF3ADA337C70035];
  sub_20AAA176C(v15 - 128);
  *(_QWORD *)(v15 - 120) = a12;
  *(_QWORD *)(v15 - 104) = a11;
  *(_DWORD *)(v15 - 112) = v13 + ((2 * ((v15 - 128) & 0x571A4B78) - (v15 - 128) - 1461341051) ^ 0x1271CCE7) * v14 + 666;
  v16 = ((uint64_t (*)(uint64_t))*(&off_24C363D30 + (v13 ^ 0x332)))(v15 - 128);
  return (*(uint64_t (**)(uint64_t))(v12
                                            + 8
                                            * ((2017
                                              * (*(_DWORD *)(v15 - 128) > (v13 ^ 0x57061F9D ^ ((v13 - 104) | 0x100u)))) ^ v13)))(v16);
}

uint64_t sub_20AAC301C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14)
{
  uint64_t v14;
  int v15;
  int v16;

  v16 = a14 - 311742309;
  if (a14 - 311742309 < 0)
    v16 = 311742309 - a14;
  return (*(uint64_t (**)(void))(v14
                              + 8
                              * ((719
                                * ((int)((v15 ^ 0x16) + (v16 ^ 0xF79EFFEF)
                                                      + ((v15 ^ 0xEF3DFEAA) & (2 * v16))
                                                      + 140574382) >= 0)) ^ v15 ^ 0x16)))();
}

uint64_t sub_20AAC30AC(uint64_t a1, int a2)
{
  int v2;
  int v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;

  return (*(uint64_t (**)(void))(v6 + 8 * (((*(_DWORD *)(v4 + 4 * v5) == a2 + 467 * (v3 ^ 0x160) - 934) * v2) ^ v3)))();
}

uint64_t sub_20AAC30E0()
{
  int v0;
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2 + 8 * ((719 * (v0 + v1 - 1 >= 0)) ^ v0)))();
}

uint64_t sub_20AAC3110()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v3 = *(_QWORD *)(v5 + 32);
  *(_QWORD *)(v2 - 128) = v1;
  *(_QWORD *)(v2 - 120) = v3;
  *(_DWORD *)(v2 - 112) = v0 + 1374699841 * ((v2 - 128) ^ 0x6DF41809) + 558;
  return sub_20AAA176C(v2 - 128);
}

void sub_20AAC344C(uint64_t a1)
{
  int v1;
  unsigned int v2;
  unsigned int v3;
  int v4;
  _BOOL4 v5;

  v1 = 1759421093 * (a1 ^ 0xB37DB054);
  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 8) - 0x140B289DC8FEE248) + 380110480;
  v3 = *(_DWORD *)a1 + v1 + 1584889005;
  v4 = (v3 < 0x9161D26D) ^ (v2 < 0x9161D26D);
  v5 = v2 < v3;
  if (v4)
    v5 = v3 < 0x9161D26D;
  __asm { BR              X11 }
}

uint64_t sub_20AAC3534()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((60
                                          * (((((v0 ^ 0x7AF) + 1491) ^ 0x7C8) & *(_DWORD *)(v1 - 0x140B289DC8FEE240)) == 0)) ^ v0))
                            - 12))();
}

uint64_t sub_20AAC357C(uint64_t a1, ...)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  _BOOL4 v5;
  va_list va;

  va_start(va, a1);
  v5 = (*(uint64_t (**)(_QWORD, char *, _QWORD, uint64_t))(v3 + 8 * (v4 ^ 0x704)))(**(unsigned int **)(v3 + 8 * (v4 ^ 0x72A)), va, (((v4 ^ 0x63F) - 4598) & (v1 - 854214081) ^ 0xFFF9EFDF) + ((2 * (v1 - 854214081)) & 0xFFF3C000) + 397345, 1) == ((8 * v4) ^ 0x3FC8) - 384;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((v5 | (16 * v5)) ^ v4)) - 12))();
}

uint64_t sub_20AAC3610()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  return (*(uint64_t (**)(void))(v1
                              + 8
                              * (((*(_QWORD *)(v0 - 0x140B289DC8FEE254) != 0)
                                * ((((v2 - 80) | 0x80) + 808) ^ v2 ^ 0x76)) ^ v2)))();
}

uint64_t sub_20AAC3668()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  unsigned int v3;
  _BOOL4 v4;

  v3 = *(_DWORD *)(v1 - 0x140B289DC8FEE244)
     - ((((v0 + 813975081) & 0xCF7BBCFF ^ 0x10408613) + 2 * *(_DWORD *)(v1 - 0x140B289DC8FEE244)) & 0x5EFB1B5E)
     + 2006830868;
  v4 = ((2 * v3) & 0xDF7AFD92 ^ 0x5E7A1912) + (v3 ^ 0xC0C0F366) - 12065865 != 1862623872;
  return (*(uint64_t (**)(void))(v2 + 8 * (v4 | (8 * v4) | v0)))();
}

uint64_t sub_20AAC3710()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  _BOOL4 v4;

  v4 = v1 + v0 - 1874689737 >= ((v2 + 15) ^ 0x4E0u);
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((2 * v4) | (4 * v4)) ^ v2)) - 8))();
}

uint64_t sub_20AAC376C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((((((a3 ^ 0x3DF) - 1815) | 0x4C8) - 1134)
                                          * ((unint64_t)(a2 - v4 - a1) < 0x20)) ^ a3 ^ 0x3DF))
                            - 12))();
}

uint64_t sub_20AAC37AC(uint64_t a1, uint64_t a2, int a3)
{
  unsigned int v3;
  uint64_t v4;
  _BOOL4 v5;

  v5 = v3 < ((a3 - 1652444521) & 0x627E4FF7 ^ (a3 + 1674119701) & 0x9C36F5EA ^ 0x3BF);
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((v5 | (8 * v5)) ^ (a3 + 782))) - 8))();
}

uint64_t sub_20AAC380C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v8 = (v6 + v4);
  v9 = *(_OWORD *)(a2 + v8 - 15);
  v10 = *(_OWORD *)(a2 + v8 - 31);
  v11 = v3 + v8;
  *(_OWORD *)(v11 - 15) = v9;
  *(_OWORD *)(v11 - 31) = v10;
  return ((uint64_t (*)(void))(*(_QWORD *)(v7
                                        + 8
                                        * ((1303 * ((((a3 - 1256) | 0x22C) ^ 0x20C) == (v5 & 0xFFFFFFE0))) ^ (a3 - 293)))
                            - 4))();
}

uint64_t sub_20AAC3874@<X0>(int a1@<W8>)
{
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((988 * (((v2 == 1012133676) ^ ((a1 ^ 0x1E) + 1)) & 1)) ^ a1 ^ 0x51E))
                            - 4))();
}

uint64_t sub_20AAC38B0@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((*(_DWORD *)(v1 - 0x140B289DC8FEE244) == ((22 * (a1 ^ 0x1AF)) ^ 0x37DFB93D))
                                * (((22 * (a1 ^ 0x1AF)) ^ 0x3DA) - 1134)) ^ (22 * (a1 ^ 0x1AF)))))();
}

uint64_t sub_20AAC3904@<X0>(int a1@<W8>)
{
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;

  v6 = a1 - 646;
  *(_BYTE *)(*(_QWORD *)(v3 - 0x140B289DC8FEE254) + (v6 ^ 0x8BCC53CE) + v5 + v1) = *(_BYTE *)(*(_QWORD *)(v3 - 0x140B289DC8FEE254)
                                                                                              + (v1 - 937410204));
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((1418 * (v1 - 1 != v2 + 1374)) ^ v6))
                            - ((v6 + 754) ^ 0x4ECLL)))();
}

void sub_20AAC397C()
{
  JUMPOUT(0x20AAC3940);
}

void sub_20AAC3984()
{
  uint64_t v0;

  *(_DWORD *)(v0 - 0x140B289DC8FEE23CLL) = -306454241;
}

void sub_20AAC3BCC(uint64_t a1)
{
  int v2;
  int v3;
  unsigned int v4;
  int v5;
  int v6;
  int v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  char *v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  int v20;
  int v21;
  unint64_t v22;
  int v23;
  int v24;
  uint64_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int32x4_t v28;
  unint64_t *v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  int v33;
  int v34;
  char v35;
  char v36;
  char v37;
  char v38;
  int v39;
  unsigned int v40;
  unint64_t *v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v2 = 3804331 * (((a1 | 0xD29CC998) - (a1 | 0x2D633667) + 761476711) ^ 0xAC49EC6E);
  v3 = *(_DWORD *)(a1 + 4);
  v31 = *(_DWORD *)a1 ^ v2;
  v4 = 1178560073 * ((&v40 & 0xCF970918 | ~(&v40 | 0xCF970918)) ^ 0x8AFC8E85);
  v5 = *(_DWORD *)(a1 + 8) ^ v2;
  v22 = 3804331
      * (((a1 | 0xF8BBF308D29CC998) - (a1 | 0x7440CF72D633667) + 0x7440CF72D633667) ^ 0x3712930CAC49EC6ELL);
  v6 = v3 + v2;
  v42 = v31 - v4 - 1882357516;
  v40 = 1063949783 - v4;
  v29 = &STACK[0xB7BFC0B77859712];
  v41 = &STACK[0xB7BFC0B77859712];
  sub_20AABEAE0((uint64_t)&v40);
  v7 = v5;
  v21 = v6 + 604578592;
  v20 = v6 + 273627528;
  v16 = v6 + 1307941176;
  v15 = v6 + 262883163;
  v13 = (char *)&v13 - 843402502;
  v8 = 2 * ((v31 + 117) & 0xD7 ^ 0x91);
  v23 = (v31 - 595583115) & 0x237FE1D7;
  v24 = v31 ^ 0x87;
  v18 = v31 + 991643336;
  v33 = (8 * (v31 ^ 0x1A)) ^ 0x17F;
  v34 = 8 * (v31 ^ 0x1A);
  v14 = v31 ^ 0x139;
  v17 = v31 ^ 0x139u;
  v32 = v17;
  v27 = vdupq_n_s32(0x1244BACBu);
  v28 = vdupq_n_s32(0x1244BACFu);
  v26 = vdupq_n_s32(0x1244BADFu);
  v25 = a1;
  v19 = 2 * (v23 ^ 0x391);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = (uint64_t)*(&off_24C363D30 + (v31 ^ 0x87));
  v11 = v7 - (((v7 + 1660218808) & 0x6AA4CF7F ^ v7 & 3) << (v8 - 31)) - 845562572;
  v35 = (HIBYTE(v11) ^ 0xEA) - ((2 * (HIBYTE(v11) ^ 0xEA)) & 0xF7) - 5;
  v36 = (BYTE2(v11) ^ 0xA4) + (~(2 * (BYTE2(v11) ^ 0xA4)) | 9) - 4;
  v37 = (BYTE1(v11) ^ 0xCF) - ((2 * (BYTE1(v11) ^ 0xCF)) & 0xF7) - 5;
  v38 = (v7 - ((((_BYTE)v7 - 72) & 0x7F ^ v7 & 3) << (v8 - 31)) + 52) ^ 0x87;
  v12 = *(_QWORD *)(v10
                  + 8
                  * ((505 * (((2 * (v39 & 0x3F)) ^ 0x58) + (v39 & 0x3F ^ 0x75DFF7D3u) - 1977612347 > 0xFFFFFFBF)) ^ (v31 + 1724)))
      - 4;
  v30 = v9;
  __asm { BR              X10 }
}

uint64_t sub_20AAC3F94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  char v20;
  int v21;
  uint64_t v22;

  *(_BYTE *)(a6 + (v21 + a1 + 336 - 1393)) = v20;
  *(_BYTE *)(a6 + (a9 - 823850538)) = *(_BYTE *)(a7 + 1);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 8 * ((240 * ((((_DWORD)a1 - 807595939) & 0x3022EBB6u) - 48 > 2)) ^ ((int)a1 + 336))))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20);
}

uint64_t sub_20AAC52F0@<X0>(uint64_t a1@<X5>, uint64_t a2@<X6>, int a3@<W8>)
{
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;

  *(_BYTE *)(a1 + (v6 + a3 + 1)) = *(_BYTE *)(a2 + (v5 - 826072621));
  return (*(uint64_t (**)(void))(v7 + 8 * ((577 * (((((v4 - 1372) | 0x20) - 56) & v3) == 826072620)) ^ v4)))();
}

uint64_t sub_20AAC5344@<X0>(uint64_t a1@<X5>, uint64_t a2@<X6>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,unint64_t a21,uint64_t (*a22)(uint64_t))
{
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;

  v25 = (v22 - 1340);
  *(_BYTE *)(a1 + (a3 + 2)) = *(_BYTE *)(a2 + ((v25 + 4294967243) & (v23 + 3468894676)));
  v26 = 628203409 * ((((v24 - 168) | 0x434F6F97) - ((v24 - 168) & 0x434F6F97)) ^ 0xC1C763A4);
  STACK[0x2D8] = a21;
  *(_DWORD *)(v24 - 160) = v26 + v25 + 1627;
  *(_DWORD *)(v24 - 156) = 832508462 - v26;
  v27 = sub_20AABE384(v24 - 168);
  return a22(v27);
}

uint64_t sub_20AAC53DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  int v23;
  int v24;
  uint64_t v25;
  _BOOL4 v26;

  v26 = HIDWORD(a11) < 0x6FE96407;
  if (v26 == v23 + 1229632309 < (v24 + 1877564859))
    v26 = (v23 + 1229632309) < HIDWORD(a11);
  return ((uint64_t (*)(uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 + 8 * (v26 | v24)) - 4))(1229632309, HIDWORD(a11), (v24 - 274), a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23);
}

uint64_t sub_20AAC5448@<X0>(int a1@<W0>, unsigned int a2@<W1>, int a3@<W2>, uint64_t a4@<X5>, uint64_t a5@<X7>, int a6@<W8>)
{
  int v6;
  int v7;
  int v8;
  int v9;
  unsigned int v10;
  uint64_t v11;
  _BOOL4 v12;
  char v13;
  unsigned int v14;
  int v15;
  _BOOL4 v16;

  v12 = a2 < v10;
  v13 = *(_BYTE *)(a5 + (v9 + v6 + a3 - 1338));
  *(_BYTE *)(a4 + (a6 + v8)) = v13 - ((2 * v13) & 0xF7) - 5;
  v14 = v6 + 1 + a1;
  v15 = v12 ^ (v14 < v10);
  v16 = v14 < a2;
  if (!v15)
    v12 = v16;
  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * (v12 ^ v7)) - 4))();
}

uint64_t sub_20AAC54B0(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,unint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,int a44,int a45)
{
  uint64_t v45;
  uint64_t v46;
  unsigned int v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  int v53;

  v53 = 3 * (a3 ^ 0x555);
  v47 = (a3 + 282989757) & 0xEF21E63C;
  v48 = 628203409 * ((2 * ((v46 - 168) & 0x25866240) - (v46 - 168) - 629563969) ^ 0x58F1918C);
  STACK[0x2D8] = a26;
  *(_DWORD *)(v46 - 160) = v48 + a3 + 341;
  *(_DWORD *)(v46 - 156) = a11 - v48;
  v49 = sub_20AABE384(v46 - 168);
  v50 = a45 & (v53 - 270);
  *(&a36 + (v50 ^ 0x2C)) = 123;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v45
                                                      + 8 * ((108 * ((v50 ^ 0x2C) > (v47 | 3))) ^ a3))
                                          - 12))(v49);
}

uint64_t sub_20AAC55C8()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (((((v1 ^ 4) - 307) ^ 0x6A7) * (v0 != 63)) ^ v1)) - 4))();
}

uint64_t sub_20AAC5600@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((1707 * ((a1 ^ 0x13u) >= (((v1 - 69) | 0x11) ^ 0x11Du))) ^ v1))
                            - 4))();
}

uint64_t sub_20AAC5648(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  char v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)(a9 + v10) = v13;
  return ((uint64_t (*)(void))(*(_QWORD *)(v12 + 8 * ((((v9 & 0x38) == 8) * (v11 ^ 0x730)) ^ v11)) - 8))();
}

uint64_t sub_20AAC568C()
{
  int v0;
  _QWORD *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *v1 = v5;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * (((v3 == 0) * v2) ^ v0)) - 8))();
}

uint64_t sub_20AAC56B0()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((((v1 - 309) | 0x20) ^ 0x30) * (v2 == v0)) ^ v1))
                            - ((v1 - 307) ^ 0x12)))();
}

uint64_t sub_20AAC56F8@<X0>(uint64_t a1@<X5>, uint64_t a2@<X8>)
{
  int v2;
  uint64_t v3;
  char v4;
  int v5;
  uint64_t v6;
  unint64_t v7;

  v7 = a2 + v3;
  *(_BYTE *)(v7 + a1 - 1) = v4;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * (((v7 < 0x40) * v5) ^ (v2 + 281))) - 4))();
}

void sub_20AAC5738()
{
  JUMPOUT(0x20AAC44E8);
}

uint64_t sub_20AAC5748()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((((v0 - 843402718) < 0x38) * (((v1 - 34) | 0x108) + 629)) ^ (v1 + 304)))
                            - 12))();
}

uint64_t sub_20AAC5790()
{
  unsigned int v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v4 = v0;
  v5 = v0 + v2;
  if (v5 <= 0x38)
    v5 = 56;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((60
                                          * (v5 - v4 + 843402718 < (unint64_t)(((v1 + 658) | 0x10u) - 904) - 44)) ^ v1))
                            - 12))();
}

uint64_t sub_20AAC57E8@<X0>(uint64_t a1@<X5>, int a2@<W8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(a1 + v3 + ((42 * (a2 ^ 0x3BBu)) ^ (unint64_t)(v4 + 225))) = v6;
  return (*(uint64_t (**)(void))(v5 + 8 * ((1762 * ((v2 & 0xFFFFFFFFFFFFFFF8) == 8)) ^ a2)))();
}

void sub_20AAC5830()
{
  JUMPOUT(0x20AAC57F8);
}

uint64_t sub_20AAC583C()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((v2 - 228) * (v0 == v1)) ^ v2)) - 12))();
}

uint64_t sub_20AAC586C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v6;
  uint64_t v7;
  int v8;
  char v9;
  uint64_t v10;
  uint64_t v11;

  *(_BYTE *)(v7 + v10 + a6 - 1) = v9;
  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * ((((unint64_t)(v7 + v10) < 0x38) * v8) ^ (v6 + 304))) - 12))();
}

void sub_20AAC589C()
{
  JUMPOUT(0x20AAC44E8);
}

uint64_t sub_20AAC5AEC(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,__int16 a47,char a48,char a49,int a50)
{
  uint64_t v50;
  unint64_t v52;

  if (a32 == 2)
    return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v50 + 8 * ((403 * (a50 != 1741097738)) ^ (a3 + 688)))
                                            - (a3 + 688)
                                            + 736))(a12);
  if (a32 == 1)
    return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v50
                                                        + 8
                                                        * (((a50 == 1741097738) * (((2 * a3) ^ 0x2A6) - 676)) ^ (a3 + 666)))
                                            - 4))(a12);
  v52 = ((unint64_t)&a35 ^ 0x7DE2FDDF5BFFF6FDLL)
      - 0x15007110002C5220
      + (((_QWORD)&a35 << ((a3 ^ 0x9Eu) + 87)) & 0xFBC5FBBEB7FFEDF0);
  a49 = (v52 + 26 * (a3 ^ 0x36)) * ((v52 + 35) ^ 0xBA);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v50 + 8 * (a3 ^ 0x29E)) - 12))(a12);
}

void sub_20AAC5E38()
{
  JUMPOUT(0x20AAC5E04);
}

uint64_t sub_20AAC5E40@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t result;
  uint64_t v6;
  _BYTE v7[28];
  unint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  unint64_t *v12;

  v2 = *(_QWORD *)(v6 + 16);
  v3 = *(_QWORD *)(v6 + 40);
  *(_QWORD *)&v7[20] = 0xFBFBFBFBFBFBFBFBLL;
  v8 = 0xFBFBFBFBFBFBFBFBLL;
  v4 = 235795823 * (((v1 - 168) & 0xFE372F84 | ~((v1 - 168) | 0xFE372F84)) ^ 0x95659922);
  v9 = v2;
  v12 = &STACK[0x2152BE6AABE95429];
  *(_DWORD *)(v1 - 160) = v4 + 246750542;
  *(_DWORD *)(v1 - 132) = (a1 + 1814) ^ v4;
  v10 = v7;
  v11 = v3;
  result = ((uint64_t (*)(uint64_t))((char *)*(&off_24C363D30 + a1 + 105) - 8))(v1 - 168);
  *(_DWORD *)(v6 + 12) = *(_DWORD *)(v1 - 136);
  return result;
}

void sub_20AAC5F3C(uint64_t a1)
{
  __asm { BR              X8 }
}

uint64_t sub_20AAC5FC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  uint64_t a67;
  uint64_t v67;

  HIDWORD(a11) = 1840987222;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v67 + 1032) - 4))(a1, a2, a3, a4, a5, a6, 1322464860, 2972502555, a9, &a67, a11, a12);
}

uint64_t sub_20AAC612C()
{
  int v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * (v0 ^ (8
                                               * (v2 == ((v0 - 1181221721) ^ 0xF744C997 ^ (v0 - 1181221721) & 0x4668014C ^ 0x271FE677)))))
                            - 12))();
}

uint64_t sub_20AAC6184(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18)
{
  unsigned int v18;
  uint64_t v19;
  int v20;

  return ((uint64_t (*)(void))(*(_QWORD *)(v19
                                        + 8
                                        * ((27 * ((((v20 & 0xFFFFFFFC) - a18 == -3) ^ (v18 + 55)) & 1)) | v18))
                            - 8))();
}

uint64_t sub_20AAC61BC@<X0>(uint64_t a1@<X6>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  _BOOL4 v18;

  v18 = a2 == 570578859 || a13 - v15 != 905604898;
  return ((uint64_t (*)(void))(a1
                            - (v16 + v13 - 123)
                            + *(_QWORD *)(v14 + 8 * ((760 * ((((v13 + 839) ^ v18) & 1) == 0)) ^ v13))))();
}

uint64_t sub_20AAC621C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, int a19)
{
  int v19;
  uint64_t v20;
  int v21;
  _BOOL4 v22;

  v22 = a19 - 493961644 < (v21 + 411643254);
  if (a19 - 493961644 < (((v19 + a8 + 405) | 0x144) ^ 0x28DFEB79u) != (v21 + 411643254) < 0x28DFE82D)
    v22 = (v21 + 411643254) < 0x28DFE82D;
  return ((uint64_t (*)(void))(*(_QWORD *)(v20 + 8 * ((!v22 * ((v19 + a8) ^ 0x65)) ^ (v19 + a8 + 212))) - 12))();
}

uint64_t sub_20AAC63AC()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  int v5;

  v5 = *(_DWORD *)(v1 + 48 * (((v0 - 729) ^ (v4 + 43)) + v3) + 36) == v3;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (((2 * (((v0 ^ v5) & 1) == 0)) & 0xDF | (32 * ((v0 ^ ~v5) & 1))) ^ v0))
                            - 12))();
}

uint64_t sub_20AAC6400(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;

  v21 = 628203409 * ((((v20 - 152) | 0x72FC23B2) - (v20 - 152) + ((v20 - 152) & 0x8D03DC48)) ^ 0xF0742F81);
  *(_DWORD *)(v20 - 136) = v17 - v21 + 1209;
  *(_DWORD *)(v20 - 132) = v19 - v21 + (((v17 + 100664741) | 0x48D33040) ^ 0x4CC14089);
  *(_QWORD *)(v20 - 112) = v16;
  *(_QWORD *)(v20 - 104) = a14;
  *(_QWORD *)(v20 - 128) = a16;
  *(_QWORD *)(v20 - 152) = a15;
  *(_QWORD *)(v20 - 144) = a13;
  v22 = ((uint64_t (*)(uint64_t))(*(_QWORD *)(a5 + 8 * (v17 ^ 0xE1)) - 8))(v20 - 152);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v18
                                                      + 8 * ((1612 * (*(_DWORD *)(v20 - 120) == 306494155)) ^ v17))
                                          - 4))(v22);
}

uint64_t sub_20AAC64F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7
                                                                                          + 8
                                                                                          * (((*(_DWORD *)(v4 + 48 * (v9 + v10)) != 597383160)
                                                                                            * (((v6 + 1308754405) | 0xD13400) ^ (v8 + 19))) ^ (v6 + 1072)))
                                                                              - ((v6 + 1072) ^ 0x4A3)))(a1, a2, a3, a4, v5);
}

uint64_t sub_20AAC6560(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12)
{
  int v12;
  int v13;
  int v14;
  uint64_t v15;

  return ((uint64_t (*)(void))(*(_QWORD *)(v15
                                        + 8
                                        * ((476
                                          * ((v12 ^ a12 ^ v13) == ((v13 + 1322516215) & 0xFFFF36ED ^ 0x95B79E68) + v14)) ^ v13))
                            - 4))();
}

uint64_t sub_20AAC65B8@<X0>(int a1@<W5>, int a2@<W7>, int a3@<W8>)
{
  int v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  _BOOL4 v11;
  int v13;

  if ((v3 - 1840987169) <= 0x1D && ((1 << (v3 - 33)) & 0x21050001) != 0)
  {
    v7 = a3;
    v8 = a3 & 0xFFFFFFFFFFFFFFFLL;
    if ((v7 & 0xFFFFFFFFFFFFFFFLL) != 0)
    {
      if (v8 == 3)
      {
        v9 = v6 + a2;
        v10 = (*(uint64_t (**)())(v4 + 48 * (int)v7 + 8))();
        __asm { BR              X8 }
      }
      v11 = 41 * (v6 ^ (v6 + 3))
          + ((v13 - 274119351) ^ 0x56FFBFDFEFF8DF5DLL)
          + ((2 * (v13 - 274119351)) & 0x1DFF1BEBALL) != 0x56FFBFDFEFF8DFD8;
      __asm { BR              X17 }
    }
    __asm { BR              X11 }
  }
  return a1 ^ 0xEDBBE115;
}

void sub_20AAC6B4C(_DWORD *a1)
{
  unsigned int v1;

  v1 = *a1 + 108757529 * ((2 * (a1 & 0x5EAB9BD4) - (_DWORD)a1 - 1588304853) ^ 0x41C80600);
  __asm { BR              X9 }
}

uint64_t sub_20AAC6BFC(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8 * (((*(_DWORD *)(*(_QWORD *)(a1 + 8) + v4) != v1) * (v3 ^ 0x21E)) ^ v3))
                            - 8))();
}

uint64_t sub_20AAC6C2C()
{
  int v0;
  uint64_t v1;
  int v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((14 * ((v3 - 311742309) * (v0 - 311742309) < ((14 * (v2 ^ 0x219)) ^ 0x10A))) ^ v2 ^ 0x438))
                            - 12))();
}

uint64_t sub_20AAC6C80@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;

  v7 = a1;
  v8 = v1;
  v5 = v1;
  v6 = v3
     - 535753261 * ((-478809243 - (&v5 | 0xE375F365) + (&v5 | 0x1C8A0C9A)) ^ 0x167E02B5)
     + 1509;
  return (*(uint64_t (**)(uint64_t *))(v2 + 8 * (v3 - 85)))(&v5);
}

void sub_20AAC6DDC(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_20AAC6E24(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((127 * (**(_BYTE **)(a2 + 8) != 0)) ^ 0x1AFu)) - 12))();
}

uint64_t sub_20AAC6E54()
{
  uint64_t v0;
  int v1;
  int v2;

  v2 = v1 - 194889825 - ((2 * v1 + 257067664) & 0x971E4AE);
  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * ((263
                                          * (((2 * v2) & 0x7F5EFFFE ^ 0x950E4AE) + (v2 ^ 0xBB178DA8) + 2130687971 != 1051670498)) ^ 0x656u))
                            - 4))();
}

uint64_t sub_20AAC6F18(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v3
                                                                      + 8
                                                                      * ((497
                                                                        * (v5
                                                                         + v4
                                                                         + ((a3 + 1459570979) & 0x100B72D ^ 0x40508728) < a3 - 1744)) ^ a3)))(a1, a2, v6, a3 - 996);
}

uint64_t sub_20AAC6F7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v6
                                                                      + 8
                                                                      * (a6 ^ ((2
                                                                              * ((unint64_t)(v8 - a5 - 1167) > 0x1F)) | (((unint64_t)(v8 - a5 - 1167) > 0x1F) << 6)))))(a1, a2, v7, (a6 - 906332973) & 0x20586F7);
}

uint64_t sub_20AAC6FBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v6;
  unsigned int v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(v6
                                        + 8 * (((((a6 - 1184124778) & 0x46944EF5) + 198) * (v7 > 0x1F)) ^ (a6 - 1574)))
                            - 8))();
}

uint64_t sub_20AAC7008(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;

  v11 = v9 + v8 + v10;
  v12 = v6 + v11;
  v13 = *(_OWORD *)(v12 - 31);
  v14 = v5 + v11;
  *(_OWORD *)(v14 - 15) = *(_OWORD *)(v12 - 15);
  *(_OWORD *)(v14 - 31) = v13;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((((v7 & 0xFFFFFFE0) != 32) * ((a4 - 1467045237) ^ 0x87C)) ^ (a3 + a4 + 1069)))
                            - 4))();
}

void sub_20AAC706C()
{
  JUMPOUT(0x20AAC702CLL);
}

uint64_t sub_20AAC7078(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  int v6;

  *(_DWORD *)(a5 + 1424) = (((v6 + 55656264) | 0x54201C60) ^ 0x57CA9E82) + v5;
  *(_QWORD *)(*(_QWORD *)(a1 + 96) + 520) = *(_QWORD *)(a2 + 8) + 1;
  return 0;
}

void sub_20AAC7260(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 4) - 1178560073 * (a1 ^ 0xBA947862);
  __asm { BR              X9 }
}

void sub_20AAC7314()
{
  _DWORD *v0;

  *v0 = -306454254;
}

void U4HBs(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  BOOL v5;
  int v8;

  if (a1)
    v5 = a2 == 0;
  else
    v5 = 1;
  v8 = !v5 && a4 != 0 && a5 != 0;
  __asm { BR              X8 }
}

uint64_t sub_20AAC7C5C(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, _DWORD *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, unsigned int a20)
{
  int v20;
  uint64_t v21;
  uint64_t v22;

  *a4 = 0;
  *a5 = 0;
  a20 = 108757529
      * ((((&a19 | 0xC8548EC6) ^ 0xFFFFFFFE) - (~&a19 | 0x37AB7139)) ^ 0xD7371312)
      - 504207030;
  v22 = sub_20AAE5C84(&a19);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v21 + 8 * ((50 * (a19 != v20)) ^ 0x297u)) - 8))(v22);
}

uint64_t sub_20AAC7CF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, unint64_t *a19, unsigned int a20,unsigned int a21,int a22)
{
  uint64_t v22;
  unsigned int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v23 = 1759421093
      * ((((&a19 | 0x621AA570) ^ 0xFFFFFFFE) - (~&a19 | 0x9DE55A8F)) ^ 0x2E98EADB);
  a22 = v23 ^ 0x445509ED;
  HIDWORD(a19) = v23 ^ 0x24D21C9;
  a20 = v23 + 1609;
  LODWORD(a19) = v23 ^ 0x1F2726AC;
  sub_20AAA94DC((uint64_t)&a19);
  if (a21 < 0x48EDB6D0)
    v24 = 1;
  else
    v24 = 2;
  HIDWORD(a11) = a21;
  LODWORD(a12) = v24;
  a19 = &STACK[0x7EF87141C217A9F1];
  a21 = 178
      - 460628867 * ((-39222205 - (&a19 | 0xFDA98443) + (&a19 | 0x2567BBC)) ^ 0x4EC0F9C1);
  sub_20AAE2E14((uint64_t)&a19);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 + 8 * ((1089 * (a20 == 306494155)) ^ 0x2A5)) - 8))(v25, v26, v27, v28, v29, v30, v31, v32, a9, a10, a11, a12);
}

uint64_t sub_20AAC7E78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20,uint64_t a21,unsigned int a22,uint64_t a23)
{
  uint64_t v23;
  int v24;
  int v25;
  uint64_t v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  uint64_t v30;

  v28 = 1178560073 * ((&a19 - 256234305 - 2 * (&a19 & 0xF0BA2CBF)) ^ 0x4A2E54DD);
  a22 = (v27 - 824) ^ v28;
  a21 = a15;
  a20 = (v25 ^ 0xBF3EFF8F) + (((v27 - 1487269999) & 0xEED ^ 0x7E7DFDBA) & (2 * v25)) + 1476222462 + v28;
  sub_20AAA1514((uint64_t)&a19);
  v29 = 1178560073 * ((&a19 + 840327245 - 2 * (&a19 & 0x3216604D)) ^ 0x8882182F);
  a21 = a15;
  a22 = v29 ^ ((v24 ^ 0xDFFF4A6F) + 736034742 + ((2 * v24) & 0xBFFE94DE));
  a20 = v29 + v27 - 657;
  a23 = v23;
  v30 = ((uint64_t (*)(int *))((char *)*(&off_24C363D30 + (v27 ^ 0x48A)) - 12))(&a19);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v26 + 8 * ((114 * (a19 == 306494155)) ^ v27)) - 4))(v30);
}

uint64_t sub_20AAC7FE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, unint64_t *a19, uint64_t a20,unsigned int a21,unsigned int a22,unsigned int a23,int a24)
{
  int v24;
  uint64_t v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t v28;

  v27 = 460628867
      * ((((&a19 | 0x82277BB2) ^ 0xFFFFFFFE) - (~&a19 | 0x7DD8844D)) ^ 0x314E0630);
  a23 = (a12 ^ 0xEFABFFFB) - v27 + 2 * a12 + 1610018567;
  a21 = v27 + 2069755732;
  a22 = v27 + v26 - 2024874145;
  a19 = &STACK[0x61B876722A6C06F];
  a20 = a15;
  v28 = sub_20AAE5D1C((uint64_t)&a19);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v25
                                                      + 8
                                                      * ((337 * (a24 == v24 + ((v26 + 834903943) & 0x1EF7) - 677)) ^ v26))
                                          - 4))(v28);
}

uint64_t sub_20AAC80CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, unsigned int a12)
{
  uint64_t v12;
  int v13;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12
                                                                       + 8
                                                                       * (((((v13 - 677533864) & 0x286255BF) + 13)
                                                                         * (a12 < 0x48EDB6D0)) ^ (v13 - 473))))(a1, a2, a3, a4);
}

uint64_t sub_20AAC8178@<X0>(uint64_t a1@<X8>, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, char a12, unsigned int a13, char *a14, _BYTE *a15, uint64_t a16, unsigned int a17)
{
  int v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  void (*v22)(unsigned int *);
  int v23;
  uint64_t v24;

  a13 = (v17 - 292) ^ (((2 * (&a13 & 0x3D68C7B0) - &a13 + 1117206606) ^ 0x2F632047) * v21);
  v23 = v17 - 271;
  a14 = &a12 + a1;
  a15 = a7;
  v22(&a13);
  a17 = (v23 - 49) ^ (1225351577 * (&a13 ^ 0x239AD816));
  a14 = a7;
  a15 = v18;
  a16 = v19;
  ((void (*)(unsigned int *))((char *)*(&off_24C363D30 + (v23 ^ 0x1E0)) - 8))(&a13);
  a13 = (v23 - 21) ^ (((&a13 + 2091475848 - 2 * (&a13 & 0x7CA96388)) ^ 0x115D7B81) * v21);
  a14 = a3;
  a15 = a7;
  v22(&a13);
  a14 = a7;
  a13 = (v23 + 724) ^ (1755732067 * ((&a13 & 0x891AB990 | ~(&a13 | 0x891AB990)) ^ 0xA823FBB4));
  v24 = sub_20AABD7C8((uint64_t)&a13);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v20 + 8 * ((2027 * ((_DWORD)a15 == 306494155)) ^ v23))
                                          - ((v23 + 744) ^ 0x42ELL)))(v24);
}

uint64_t sub_20AAC82FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17)
{
  int v17;
  int v18;
  int v19;
  uint64_t v20;

  return ((uint64_t (*)(void))(*(_QWORD *)(v20 + 8 * (((a17 == v17) * (v18 ^ 0x246)) ^ v19)) - 8))();
}

uint64_t sub_20AAC8324(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16)
{
  int v16;
  int v17;
  uint64_t v18;

  return ((uint64_t (*)(void))(*(_QWORD *)(v18
                                        + 8
                                        * ((110 * (a16 != ((v17 - 1751757575) & 0x6869B5EE ^ (v16 + 1058)))) ^ v17))
                            - 8))();
}

uint64_t sub_20AAC8370@<X0>(int a1@<W8>)
{
  unsigned int v1;
  int v2;
  uint64_t v3;
  BOOL v4;

  v4 = ((uint64_t (*)(_QWORD, uint64_t))*(&off_24C363D30 + v2 - 92))(a1 ^ v1, 1812636846) == 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((1366 * ((v4 ^ (v2 - 1)) & 1)) ^ v2))
                            - ((v2 + 1945721920) & 0x8C06A7D3)
                            + 1354))();
}

uint64_t sub_20AAC83FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16)
{
  int v16;
  int v17;
  uint64_t v18;
  int v19;

  v19 = (a16 ^ v16) - ((2 * (a16 ^ v16)) & 0x7176B88) - 2087995964;
  return ((uint64_t (*)(void))(*(_QWORD *)(v18
                                        + 8
                                        * ((7
                                          * (((v19 << (v17 - 81)) & 0xDFFFDFFE ^ 0x7174B88)
                                           + ((v17 - 553) ^ 0x6C745912 ^ v19)
                                           + 2125960711 != 1857521158)) ^ v17))
                            - 12))();
}

uint64_t sub_20AAC8488()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((112
                                          * (((v1 + v0 + 27 * (v2 ^ 0x33Bu) + 268439067 < 8) ^ ((v2 ^ 0x3B) + 49)) & 1)) ^ v2))
                            - 12))();
}

uint64_t sub_20AAC84F4(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  return (*(uint64_t (**)(void))(v5
                              + 8
                              * (int)((((a3 + 1960704792) & 0xABB77343 ^ (v3 + 2339))
                                     * ((unint64_t)(v4 - a1) > 0x1F)) ^ a3)))();
}

uint64_t sub_20AAC8534(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  unsigned int v4;
  int v5;
  uint64_t v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(v6
                                        + 8
                                        * ((102 * (v4 >= v5 + v3 + 12 * (a3 ^ 0x1C5u) + 257 + 14)) ^ (12 * (a3 ^ 0x1C5))))
                            - 12))();
}

uint64_t sub_20AAC857C(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v8 = v5 + v3 + v4 + 2 + ((v6 + 241) | 0xE0u);
  v9 = *(_OWORD *)(v1 + v8 - 15);
  v10 = *(_OWORD *)(v1 + v8 - 31);
  v11 = a1 + v8;
  *(_OWORD *)(v11 - 15) = v9;
  *(_OWORD *)(v11 - 31) = v10;
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((37 * ((v2 & 0xFFFFFFE0) != 32)) | (v6 + 894))) - 4))();
}

void sub_20AAC85D8()
{
  JUMPOUT(0x20AAC8594);
}

uint64_t sub_20AAC85E4(uint64_t a1)
{
  int v1;
  int v2;
  _QWORD *v3;
  int v4;
  _DWORD *v5;
  void (*v7)(_BYTE *);
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[4];
  unsigned int v11;
  uint64_t v12;

  *v3 = a1;
  *v5 = v1;
  v11 = v4
      - 300
      + 535753261 * ((v10 - 448162783 - 2 * ((unint64_t)v10 & 0xE5499421)) ^ 0xEFBD9A0E)
      - 574;
  v12 = v8;
  v7(v10);
  v11 = ((v4 + 280278691) & 0xEF4B46AF)
      + 535753261 * (((v10 | 0x12A14F4B) + (~v10 | 0xED5EB0B4)) ^ 0x18554165)
      - 189;
  v12 = v9;
  v7(v10);
  return v2 ^ 0x1244BACBu;
}

void sub_20AAC8898(uint64_t a1)
{
  int v1;

  v1 = (*(_DWORD *)(a1 + 16) ^ (628203409 * ((1303688841 - (a1 | 0x4DB4B689) + (a1 | 0xB24B4976)) ^ 0x30C34545))) - 113;
  __asm { BR              X11 }
}

uint64_t sub_20AAC8A7C(uint64_t a1, int a2, uint64_t a3, int a4, int a5)
{
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * (((a5 - 611 + ((a5 - 1209) | a2) - 777) * (a4 == 31)) ^ a5)) - 8))();
}

uint64_t sub_20AAC8AB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  uint64_t v24;

  *(_DWORD *)(a11 - 0x11158D12BF15809DLL) = 1086528590 - v16;
  v22 = 1224239923 * ((((v21 - 136) ^ 0x18B8A080 | 0x67434C63) + ((v21 - 136) ^ 0x46434423 | 0x98BCB39C)) ^ 0xAC481975);
  *(_DWORD *)(v21 - 120) = v22 + v19 + 66;
  *(_DWORD *)(v21 - 136) = v22 ^ 0x1967566D;
  *(_QWORD *)(v21 - 128) = a12;
  sub_20AACD898((_DWORD *)(v21 - 136));
  v23 = 1759421093 * (((((v21 - 136) | 0x71D1BB0A) ^ 0xFFFFFFFE) - (~(v21 - 136) | 0x8E2E44F5)) ^ 0x3D53F4A1);
  *(_QWORD *)(v21 - 128) = a12;
  *(_DWORD *)(v21 - 120) = v19 - v23 + 78;
  *(_DWORD *)(v21 - 136) = ((v17 << ((v19 - 3) ^ 0x80)) & 0xFD8FCF40)
                         - v23
                         + ((32 * v17) ^ 0x7EC7E5D1 ^ (5 * (v19 ^ 0x2F5)))
                         - 312072;
  sub_20AABE704(v21 - 136);
  *(_DWORD *)(v21 - 120) = v19 + 1374699841 * ((v21 - 136) ^ 0x6DF41809) + 843;
  *(_QWORD *)(v21 - 128) = &STACK[0x4FF3ADA337C70045];
  *(_QWORD *)(v21 - 136) = a16;
  sub_20AAA176C(v21 - 136);
  *(_DWORD *)(v21 - 120) = v19
                         + 1178560073 * ((((v21 - 136) | 0xC9275412) - ((v21 - 136) & 0xC9275412)) ^ 0x73B32C70)
                         + 795;
  *(_QWORD *)(v21 - 112) = a12;
  *(_QWORD *)(v21 - 128) = a16;
  v24 = (*(uint64_t (**)(uint64_t))(v20 + 8 * (v19 - 593)))(v21 - 136);
  return (*(uint64_t (**)(uint64_t))(v18
                                            + 8
                                            * (((*(_DWORD *)(v21 - 136) > 0x57061F35u) | (16
                                                                                        * (*(_DWORD *)(v21 - 136) > 0x57061F35u))) ^ v19)))(v24);
}

uint64_t sub_20AAC8CE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  *(_QWORD *)(v17 - 136) = v16;
  *(_QWORD *)(v17 - 128) = a14;
  *(_DWORD *)(v17 - 120) = v14
                         + 1374699841 * ((2 * ((v17 - 136) & 0x66A5C608) - (v17 - 136) + 425343479) ^ 0x74AE21FE)
                         + 334;
  v18 = sub_20AAA176C(v17 - 136);
  return (*(uint64_t (**)(uint64_t))(v15 + 8 * ((750 * (a11 < (v14 ^ 0xF2 ^ v14 ^ 0x6A ^ 0x99))) ^ v14)))(v18);
}

uint64_t sub_20AAC8D90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  uint64_t v18;
  unsigned int v19;
  int v20;
  uint64_t v21;
  int v22;
  uint64_t v23;

  *(_DWORD *)(v21 - 120) = v20 + 1374699841 * ((v21 - 136) ^ 0x6DF41809) + 232;
  *(_QWORD *)(v21 - 136) = a16;
  *(_QWORD *)(v21 - 128) = a15;
  sub_20AAA176C(v21 - 136);
  v22 = 1759421093 * ((((v21 - 136) ^ 0x204C4844 | 0xDDB086BB) + ((v21 - 136) ^ 0x198000B1 | 0x224F7944)) ^ 0x8AB1F8A0);
  *(_DWORD *)(v21 - 136) = 2126718134 - v22;
  *(_DWORD *)(v21 - 120) = v20 - v22 - 533;
  *(_QWORD *)(v21 - 128) = v16;
  sub_20AABE704(v21 - 136);
  *(_QWORD *)(v21 - 128) = a16;
  *(_QWORD *)(v21 - 112) = v16;
  *(_DWORD *)(v21 - 120) = v20
                         + 1178560073
                         * ((((v21 - 136) | 0x64467E2E) - (v21 - 136) + ((v21 - 136) & 0x9BB981D0)) ^ 0xDED2064C)
                         + 184;
  v23 = v17(v21 - 136);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v18
                                                      + 8
                                                      * ((((((v20 - 1132) ^ (*(_DWORD *)(v21 - 136) > v19)) & 1) == 0)
                                                        * (((v20 - 1092) | 0x142) ^ 0x1E8)) | (v20 - 976)))
                                          - 4))(v23);
}

uint64_t sub_20AAC8F4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12)
{
  uint64_t v12;
  int v13;

  return ((uint64_t (*)(void))(*(_QWORD *)(v12
                                        + 8
                                        * ((61
                                          * (((2 * a12) & 0x39FF37DE)
                                           + (a12 ^ (v13 - 1684335809) & 0x6464EBF5 ^ 0x9CFF9B1A)
                                           + 1810855708
                                           + (((v13 - 344) | 0x484) ^ 0xF710E81F) > 0x7FFFFFFD)) ^ v13))
                            - 8))();
}

void sub_20AAC9BB8(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 32) ^ (1225351577 * ((-2 - ((a1 | 0x21ABC784) + (~(_DWORD)a1 | 0xDE54387B))) ^ 0xFDCEE06D));
  __asm { BR              X10 }
}

uint64_t sub_20AAC9C84@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5, int a6, unint64_t *a7, int a8)
{
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;

  v12 = 1755732067
      * ((2 * ((&a4 ^ 0xA0334575) & 0x44CCC51) - (&a4 ^ 0xA0334575) + 2075341740) ^ 0x546CB02);
  a7 = &STACK[0x7B9E9BA5BB9673F2];
  a8 = v12 ^ 0x30DC7D9E;
  a6 = (v10 - 17) ^ v12;
  a4 = &STACK[0x164C0FDDF1987670];
  a5 = v11;
  v13 = (*(uint64_t (**)(unint64_t **))(a1 + 8 * (v10 - 217)))(&a4);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v9
                                                      + 8
                                                      * ((1287 * (*(_DWORD *)(v11 - 0x140B289DC8FEE23CLL) == v8)) ^ v10))
                                          - ((v10 + 1284) ^ 0x61DLL)))(v13);
}

uint64_t sub_20AAC9D74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10)
{
  int v10;
  uint64_t v11;
  int v12;

  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * ((84 * (a10 != v10)) ^ v12))
                            - ((v12 - 659680788) & 0x2751E90F ^ 0x101)))();
}

uint64_t sub_20AAC9DD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, uint64_t a11)
{
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  unsigned int v15;
  uint64_t v16;
  int v17;

  *(_BYTE *)(v12 + v14 + v11 + ((v17 + 623448860) & 0xDAD6E7DF)) = *(_BYTE *)(a11
                                                                            + v14
                                                                            + v11
                                                                            + ((v17 + 623448860) & 0xDAD6E7DF)) ^ 0xFB;
  return ((uint64_t (*)(void))(*(_QWORD *)(v16 + 8 * (((v14 + v11 + 270 < (a10 ^ v15)) * v13) ^ v17)) - 12))();
}

void sub_20AAC9E30(_DWORD *a1@<X8>)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *(_QWORD *)(v3 + 16);
  *(_QWORD *)(*(_QWORD *)(v3 + 24) - 0x765012DCA7D4077ELL) = v1;
  *(_DWORD *)(v4 - 0x204BE262838743DALL) = v2;
  *(_DWORD *)v3 = *a1;
}

void sub_20AAC9E98(uint64_t a1, uint64_t a2)
{
  __asm { BR              X9 }
}

uint64_t sub_20AAC9EF4()
{
  int v0;
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((995 * (v0 != 274119351)) ^ 0x532u)) - 12))();
}

uint64_t sub_20AAC9F20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unsigned int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  unsigned int v13;

  v4 = (__PAIR64__(v3, **(unsigned __int8 **)(a2 + 8)) - 1) >> 32;
  *(_DWORD *)(*(_QWORD *)(a1 + 96) + 800) = 1306493845;
  *(_DWORD *)(*(_QWORD *)(a1 + 96) + 804) = 311742309;
  *(_QWORD *)(*(_QWORD *)(a1 + 96) + 808) = *(_QWORD *)(a1 + 96) + 816;
  v5 = *(_QWORD *)(a1 + 96) + 0x4FF3ADA337C70325;
  v6 = *(_QWORD *)(a2 + 8) + (*(_DWORD *)(a2 + 4) - v4);
  v7 = 1178560073 * (((~&v9 & 0xFECA4FC4) - (~&v9 | 0xFECA4FC5)) ^ 0x445E37A7);
  v13 = v7 + v4 + 869607845;
  v9 = v7 + 184;
  v10 = v6;
  v11 = v5;
  ((void (*)(unsigned int *))(*(_QWORD *)(a3 + 760) - 12))(&v9);
  return (1010505105 - 335146209 * v12);
}

void sub_20AACA054(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_20AACA0B4()
{
  uint64_t v0;
  int v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((155 * (v1 != 274119351)) ^ 0x66Au)) - 4))();
}

uint64_t sub_20AACA0E8@<X0>(uint64_t a1@<X8>)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  int v8;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  unsigned int v14;

  v4 = v1 - (**(_BYTE **)(v3 + 8) == 0);
  *(_DWORD *)(*(_QWORD *)(v2 + 96) + 528) = 1306493845;
  *(_DWORD *)(*(_QWORD *)(v2 + 96) + 532) = 311742309;
  *(_QWORD *)(*(_QWORD *)(v2 + 96) + 536) = *(_QWORD *)(v2 + 96) + 544;
  v5 = *(_QWORD *)(v2 + 96) + 0x4FF3ADA337C70215;
  v6 = *(_QWORD *)(v3 + 8) + (*(_DWORD *)(v3 + 4) - v4);
  v7 = 1178560073 * (&v10 ^ 0xBA947862);
  v14 = v7 + v4 + 869607845;
  v10 = v7 + 184;
  v11 = v6;
  v12 = v5;
  ((void (*)(unsigned int *))(*(_QWORD *)(a1 + 760) - 12))(&v10);
  v8 = v13;
  *(_QWORD *)(*(_QWORD *)(v2 + 96) + 512) = *(_QWORD *)(v3 + 8) + (*(_DWORD *)(v3 + 4) - v4);
  return (1010505105 - 335146209 * v8);
}

void zxcm2Qme0x(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __asm { BR              X8 }
}

uint64_t sub_20AACA2AC(uint64_t a1, int a2)
{
  uint64_t v2;
  BOOL v3;
  int v4;

  if (a1)
    v3 = a2 == 0;
  else
    v3 = 0;
  v4 = v3;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((229 * v4) ^ 0x278u)) - 8))();
}

uint64_t sub_20AACA2F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, unsigned int a14)
{
  uint64_t v14;
  uint64_t v15;

  a14 = 108757529
      * (((&a13 | 0xE62E6BFB) - &a13 + (&a13 & 0x19D19400)) ^ 0x6B209D0)
      - 504207030;
  v15 = sub_20AAE5C84(&a13);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v14 + 8 * ((1701 * (a13 == 306494155)) ^ 0x29Du)) - 8))(v15);
}

uint64_t sub_20AACA394(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unint64_t *a13, int a14, unsigned int a15)
{
  int v15;
  uint64_t v16;
  unsigned int v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  a13 = &STACK[0x7EF87141C217A9D9];
  a15 = v17 - 460628867 * (&a13 ^ 0x4C96827D) - 491;
  sub_20AAE2E14((uint64_t)&a13);
  v18 = a14 == v15 + v17 + 734 - 1403;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 + 8 * (((4 * v18) | (32 * v18)) ^ v17))
                                                                                       - (v17
                                                                                        - 1017210468)
                                                                                       + 3277757489))(v19, v20, v21, v22, v23, v24);
}

uint64_t sub_20AACA424(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14, uint64_t a15, unsigned int a16, uint64_t a17)
{
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;

  v23 = 1178560073 * ((&a13 & 0x443E359C | ~(&a13 | 0x443E359C)) ^ 0x155B201);
  a15 = a12;
  a14 = v23 + v22 - 998;
  a17 = v17;
  a16 = v23 ^ ((v18 ^ 0x8FFF7AE7) + 2078199614 + ((2 * v18) & 0x1FFEF5CE));
  v24 = ((uint64_t (*)(int *))(*(_QWORD *)(v20 + 8 * (v22 ^ 0x5D7)) - 12))(&a13);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v21
                                                      + 8
                                                      * (((a13 != v19)
                                                        * (((((_WORD)v22 - 25310) & 0x1FFF) + 835) ^ 0x57B)) ^ v22))
                                          - 8))(v24);
}

uint64_t sub_20AACA50C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unint64_t *a13, uint64_t a14, unsigned int a15, unsigned int a16, unsigned int a17, int a18)
{
  int v18;
  uint64_t v19;
  int v20;
  unsigned int v21;
  uint64_t v22;

  v21 = 460628867 * (((~&a13 & 0xB9EE0346) - (~&a13 | 0xB9EE0347)) ^ 0xF578813A);
  a13 = &STACK[0x61B876722A6C04F];
  a14 = a12;
  a15 = v21 + 196597528;
  a16 = v21 + v20 - 2024874587;
  a17 = 1336078083 - v21;
  v22 = sub_20AAE5D1C((uint64_t)&a13);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v19
                                                      + 8
                                                      * (((a18 == ((v20 + 845365693) & 0xBAFF ^ (v18 - 629)))
                                                        * (((v20 - 408) | 0x185) - 828)) ^ v20))
                                          - 8))(v22);
}

uint64_t sub_20AACA5F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12, uint64_t a13, unsigned int a14, unint64_t *a15, uint64_t a16)
{
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  a14 = (v16 - 1188) ^ (1374699841
                      * (((&a14 | 0xAABED1A1) + (~&a14 | 0x55412E5E)) ^ 0xC74AC9A9));
  a15 = &STACK[0x33AA5AD2543300D7];
  a16 = a10;
  v20 = (*(uint64_t (**)(unsigned int *))(v18 + 8 * (v16 ^ 0x5A5)))(&a14);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v19 + 8 * (((a12 == v17) * (v16 - 1469)) | v16)) - 4))(v20);
}

uint64_t sub_20AACA698()
{
  uint64_t v0;
  void (*v1)(unsigned int *);
  unsigned int v2;
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v8;
  int v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;

  v14 = v8;
  v15 = 0x358CD15B4FC77D39;
  v13 = v0;
  v16 = v3
      - 108757529 * ((((2 * &v11) | 0x4488FC2) - &v11 + 2111551519) ^ 0x62B825CA)
      + v5
      + 907;
  ((void (*)(unsigned int *))(*(_QWORD *)(v4 + 8 * (v3 + v5 + 75)) - 12))(&v11);
  v11 = (v3 + v5 + 1042) ^ (1755732067
                          * ((&v11 & 0x7E1935 | ~(&v11 | 0x7E1935)) ^ 0x21475B11));
  v13 = v8;
  sub_20AABD7C8((uint64_t)&v11);
  v12 = v3 + v5 + ((((2 * &v11) | 0xAD83A968) - &v11 + 691940172) ^ 0xDC35DA9B) * v6 + 488;
  v13 = v8;
  v1(&v11);
  v12 = 3 * (v5 ^ 0xC35E9CE6)
      + (((&v11 | 0xF9E1E3D5) - &v11 + (&v11 & 0x61E1C28)) ^ 0xF315EDFA) * v6
      - 181;
  v13 = v10;
  v1(&v11);
  return v9 ^ v2;
}

void sub_20AACA85C(uint64_t a1)
{
  int v1;
  uint64_t v2;
  _DWORD v3[2];
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = *(_DWORD *)(a1 + 4) ^ (1755732067 * (((a1 | 0x83D72B3C) - (a1 & 0x83D72B3C)) ^ 0x5D1196E7));
  v2 = *(_QWORD *)(a1 + 8);
  v3[0] = v1 + 628203409 * ((((2 * v3) | 0xA6599920) - v3 - 1395444880) ^ 0xD1A4C0A3) - 281;
  v4 = v2;
  sub_20AABE998((uint64_t)v3);
  __asm { BR              X9 }
}

uint64_t sub_20AACA98C@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  unsigned int v3;
  int v4;
  unsigned int v5;
  _BOOL4 v7;

  v5 = (((v4 ^ v3) >> 4) & 0xCFD6F48 ^ 0xC680008) + (((v4 ^ v3) >> 5) ^ 0x384BFFB2);
  v7 = v5 > 0x3E7EB7A3 && v5 + 699605774 + 397 * (((v1 - 148) | 0xF2) ^ 0x5FF) < v2 + 1748099302;
  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((828 * v7) ^ v1)) - 12))();
}

uint64_t sub_20AACAA1C@<X0>(uint64_t a1@<X8>)
{
  char v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * (v2 ^ (126 * ((v1 & 0x1F) == 0x12)))) - 8))();
}

uint64_t sub_20AACAA54@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;
  _DWORD *v4;
  uint64_t v5;
  int v6;

  v6 = v1 - 408985600;
  if (*v4 + 1835741339 < 0)
    v6 = ((v3 - 7) ^ 0x649CCAB3) - v1;
  *v4 = *v4 - 639506340 + v6;
  **(_DWORD **)(v5 - 0x4FF3ADA337C6FFFDLL) = *(_DWORD *)(*(_QWORD *)(v5 - 0x4FF3ADA337C6FFFDLL) + 4
                                                                                                * (v1 - 1048491940));
  return (*(uint64_t (**)(void))(a1 + 8 * ((1017 * (v2 + 391014101 > -657477838)) ^ (v3 - 7))))();
}

uint64_t sub_20AACAB28@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;
  _QWORD *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  _BOOL4 v11;

  *(_DWORD *)(*v4 + 4 * (v8 + v5)) = *(_DWORD *)(*v4 + 4 * (v1 + v8));
  v11 = v8 + v6 > v7 || v8 + v6 < v2;
  return (*(uint64_t (**)(void))(a1 + 8 * ((v11 * v9) ^ v3)))();
}

void sub_20AACAB60()
{
  _DWORD *v0;

  *v0 = 311742309;
}

void sub_20AACAD80(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = *(_DWORD *)(a1 + 8) - 1755732067 * ((a1 & 0xB853BF30 | ~(a1 | 0xB853BF30)) ^ 0x996AFD14);
  v2 = *(_QWORD *)a1;
  ((void (*)(char *, void (*)()))*(&off_24C363D30 + v1 - 887))((char *)*(&off_24C363D30 + (v1 ^ 0x404)) - 12, sub_20AAE6074);
  __asm { BR              X10 }
}

uint64_t sub_20AACAE30()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * (((**(_QWORD **)(v1 + 8 * (v2 - 931)) == 0) * ((v2 + 540) ^ 0x457)) ^ v2))
                            - 8))();
}

uint64_t sub_20AACAE74@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t))(v2 + 8 * (a1 - 1510)))(v1);
}

void sub_20AACAE90(uint64_t a1)
{
  uint64_t v2;
  char v3;

  v2 = qword_254614AD8 - qword_254614AE0 - (_QWORD)&v3;
  qword_254614AE0 = 1801249171 * v2 + 0x76EA39A97CF9A556;
  qword_254614AD8 = 1801249171 * (v2 ^ 0x8915C65683065AAALL);
  ((void (*)(char *, void (*)()))*(&off_24C363D30
                                            + ((-109
                                                                             * ((qword_254614AD8 + qword_254614AE0) ^ 0xAA)) ^ byte_20AB0AD60[byte_20AB076E0[(-109 * ((qword_254614AD8 + qword_254614AE0) ^ 0xAA))] ^ 0x36])
                                            + 215))((char *)*(&off_24C363D30+ ((-109 * (qword_254614AE0 ^ 0xAA ^ qword_254614AD8)) ^ byte_20AB0EAC0[byte_20AB0AE60[(-109 * (qword_254614AE0 ^ 0xAA ^ qword_254614AD8))] ^ 0x1A])+ 63)- 12, sub_20AAE6074);
  __asm { BR              X11 }
}

uint64_t sub_20AACAFB0()
{
  unsigned int v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v1 + 8 * ((719 * (**(_QWORD **)(v2 + 1440) == 0)) ^ v0)))();
}

uint64_t sub_20AACAFE4@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t))(v2 + 8 * (a1 ^ 0x666u)))(v1);
}

uint64_t sub_20AACB004(uint64_t a1)
{
  int v1;
  int v2;
  BOOL v3;
  int v4;
  int v5;

  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 8) - 0x4FF3ADA337C70001);
  v4 = v2 - 311742309;
  v3 = v2 - 311742309 < 0;
  v5 = 311742309 - v2;
  if (!v3)
    v5 = v4;
  v1 = (*(_DWORD *)a1 - 235795823 * ((a1 + 1658036232 - 2 * (a1 & 0x62D3A008)) ^ 0x367EE951) - 759494629) & 0x2D44F5D9;
  return (*((uint64_t (**)(void))*(&off_24C363D30 + (v1 ^ 0x13A))
          + (v1 | (32
                 * ((((v1 ^ 0x200) + 11) ^ 0xC4E44ECD)
                  + (v5 ^ 0xBFBFFEAE)
                  + 2069607416
                  + ((v5 << (v1 ^ 0x88)) & 0x7F7FFD5C) > 0x7FFFFFFE)))))();
}

uint64_t sub_20AACB118()
{
  int v0;
  uint64_t v1;
  _QWORD *v2;
  int v3;
  unsigned int v4;

  return (*(uint64_t (**)(void))(v1
                              + 8 * (((*(_DWORD *)(*v2 + 4 * v4) == v0 + 872) * (((v3 - 135) | 0x8D) ^ 0x392)) ^ v3)))();
}

uint64_t sub_20AACB150@<X0>(int a1@<W8>)
{
  uint64_t v1;
  int v2;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 8 * (v2 ^ 0x3B1))
                              + 8
                              * (v2 ^ 0x28B | (32
                                             * ((((v2 ^ 0x8B) + 11) ^ 0xC4E44ECD) + (v2 ^ 0xFFFFFCFD) + a1 > 0x7FFFFFFE)))))();
}

uint64_t sub_20AACB1A0(uint64_t result)
{
  *(_DWORD *)(result + 4) = 562413465;
  return result;
}

uint64_t sub_20AACB1B0()
{
  int v0;
  uint64_t v1;
  int v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((231 * ((((v3 ^ 0xE7) + v0) ^ v2) >= 0)) ^ v3 ^ 0xE7))
                            - 17 * (v3 ^ 0x396u)
                            + 413))();
}

uint64_t sub_20AACB1F8()
{
  unsigned int v0;
  uint64_t v1;
  int v2;
  int v3;
  uint64_t v4;
  char v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * (((((v0 >> v5) & 1) == 0) * v2) ^ v3)) - v4 + 413))();
}

uint64_t sub_20AACB220@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  int v2;
  int v3;

  *(_DWORD *)(result + 4) = v2 + 32 * a2 + v3 - 1106286318;
  return result;
}

void sub_20AACB23C(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 16)
     - 460628867 * (((a1 ^ 0x68759CF4 | 0x87CE5E15) - ((a1 ^ 0x68759CF4) & 0x87CE5E15)) ^ 0xA32D409C);
  __asm { BR              X11 }
}

uint64_t sub_20AACB364()
{
  int v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  _BOOL4 v5;

  v5 = *(_DWORD *)(v2 + 48) - v0 != 1364770032 && (*(_QWORD *)(v2 + 32) | *(_QWORD *)(v2 + 56)) != 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((116 * v5) ^ (v1 - 770))) - ((v1 - 770) ^ 0x404)))();
}

uint64_t sub_20AACB3C0()
{
  int v0;
  _QWORD *v1;
  uint64_t v2;
  _BOOL4 v4;

  v4 = v1[5] == 0x18E0A6AD4C458BC0 || (*v1 | v1[3]) == 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((((((v0 - 426) ^ v4) & 1) == 0) * (3 * (v0 ^ 0x656) - 1773)) ^ v0))
                            - 8))();
}

uint64_t sub_20AACB428@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X6>, uint64_t a6@<X7>, uint64_t a7@<X8>, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  uint64_t v17;
  int v18;
  uint64_t v19;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, unint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 + 8 * (((((v18 - 62) | 0x80) ^ 0x252) * (v17 != 0)) ^ v18)) - (v18 + 66) + 664))(a1, a2, a7 + 0x5EBAD5D4B7EDB72, &STACK[0x4FF3ADA337C700E5], a3, a4, a5, a6, a8, a2, a10, a11, a12, a13, a14, &STACK[0x4FF3ADA337C700E5], a7 + 0x5EBAD5D4B7EDEA2, a17, a7 + 0x5EBAD5D4B7EDD92);
}

uint64_t sub_20AACB534@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  int v30;
  void (*v31)(uint64_t);
  void (*v32)(uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  void (*v43)(uint64_t);
  void (*v44)(uint64_t);
  uint64_t v45;

  v29 = 3 * (v22 ^ 0x2D7);
  v30 = 1178560073 * ((((v28 - 144) | 0x5EECA21B) - (v28 - 144) + ((v28 - 144) & 0xA1135DE0)) ^ 0xE478DA79);
  *(_DWORD *)(v28 - 140) = v22 - v30 - 279;
  *(_DWORD *)(v28 - 136) = v30 + v23 - 216003588 + v29;
  *(_QWORD *)(v28 - 128) = v20;
  *(_QWORD *)(v28 - 120) = v25;
  v45 = a1 + v21;
  (*(void (**)(uint64_t))(v24 + 8 * (v22 - 611)))(v28 - 144);
  HIDWORD(a11) = v29 + 1461;
  HIDWORD(a8) = v29 + 915;
  *(_DWORD *)(v28 - 128) = (v29 + 915) ^ (628203409
                                        * ((2 * ((v28 - 144) & 0x480AFF78) - (v28 - 144) - 1208680319) ^ 0x357D0CB2));
  *(_QWORD *)(v28 - 144) = a18;
  *(_QWORD *)(v28 - 136) = a19;
  v44 = (void (*)(uint64_t))(*(_QWORD *)(v24 + 8 * (v29 - 343)) - 4);
  v44(v28 - 144);
  HIDWORD(a6) = v29 + 589;
  *(_QWORD *)(v28 - 144) = a19;
  *(_QWORD *)(v28 - 136) = v25;
  *(_QWORD *)(v28 - 120) = a18;
  *(_QWORD *)(v28 - 112) = a20;
  *(_DWORD *)(v28 - 128) = (v29 + 589) ^ (1178560073
                                        * (((v28 - 144) & 0x44E21A76 | ~((v28 - 144) | 0x44E21A76)) ^ 0x1899DEB));
  v43 = (void (*)(uint64_t))(*(_QWORD *)(v24 + 8 * (v29 - 200)) - 8);
  v43(v28 - 144);
  HIDWORD(v42) = v29 + 510;
  *(_QWORD *)(v28 - 128) = a20;
  *(_QWORD *)(v28 - 120) = a18;
  *(_DWORD *)(v28 - 112) = v29 + 510 + 1224239923 * ((v28 + 2137481314 - 2 * ((v28 - 144) & 0x7F6760F2)) ^ 0x8DD49D25);
  *(_QWORD *)(v28 - 144) = a19;
  *(_QWORD *)(v28 - 136) = a20;
  *(_QWORD *)(v28 - 104) = v27;
  v31 = (void (*)(uint64_t))(*(_QWORD *)(v24 + 8 * (v29 ^ 0x147)) - 8);
  v31(v28 - 144);
  LODWORD(v42) = v29 + 1392;
  *(_DWORD *)(v28 - 120) = v29
                         + 1392
                         + 1225351577 * ((((2 * (v28 - 144)) | 0x70B67694) - (v28 - 144) + 1201980598) ^ 0x9BC1E35C);
  *(_QWORD *)(v28 - 112) = a10;
  *(_QWORD *)(v28 - 104) = a18;
  *(_QWORD *)(v28 - 136) = a20;
  *(_QWORD *)(v28 - 128) = a20;
  *(_QWORD *)(v28 - 144) = a19;
  v32 = (void (*)(uint64_t))((char *)*(&off_24C363D30 + v29 - 273) - 8);
  v32(v28 - 144);
  *(_QWORD *)(v28 - 144) = a14;
  *(_QWORD *)(v28 - 136) = a19;
  *(_DWORD *)(v28 - 128) = (v29 + 915) ^ (628203409
                                        * ((-1765163133 - ((v28 - 144) | 0x96C9BF83) + ((v28 - 144) | 0x6936407C)) ^ 0xEBBE4C4F));
  v44(v28 - 144);
  *(_QWORD *)(v28 - 144) = a19;
  *(_QWORD *)(v28 - 136) = v25;
  *(_DWORD *)(v28 - 128) = (v29 + 589) ^ (1178560073
                                        * ((((v28 - 144) | 0xC85A2C71) + (~(v28 - 144) | 0x37A5D38E)) ^ 0x72CE5412));
  *(_QWORD *)(v28 - 120) = a14;
  *(_QWORD *)(v28 - 112) = a9;
  v43(v28 - 144);
  *(_QWORD *)(v28 - 144) = a19;
  *(_QWORD *)(v28 - 136) = a9;
  *(_QWORD *)(v28 - 104) = v27;
  *(_DWORD *)(v28 - 112) = v29 + 510 + 1224239923 * ((v28 - 144) ^ 0xF2B3FDD7);
  *(_QWORD *)(v28 - 128) = a9;
  *(_QWORD *)(v28 - 120) = a14;
  v31(v28 - 144);
  *(_QWORD *)(v28 - 128) = a9;
  *(_QWORD *)(v28 - 112) = a12;
  *(_QWORD *)(v28 - 104) = a14;
  *(_DWORD *)(v28 - 120) = v29
                         + 1392
                         + 1225351577 * ((((v28 - 144) | 0xC64712E7) - ((v28 - 144) & 0xC64712E7)) ^ 0xE5DDCAF1);
  *(_QWORD *)(v28 - 144) = a19;
  *(_QWORD *)(v28 - 136) = a9;
  v32(v28 - 144);
  *(_DWORD *)(v28 - 144) = v29
                         - 108757529
                         * ((((v28 - 144) ^ 0x541663F) & 0x2F4F9D48 | ~((v28 - 144) ^ 0x541663F | 0x2F4F9D48)) ^ 0x356D66A3)
                         - 79;
  *(_QWORD *)(v28 - 136) = a9;
  *(_QWORD *)(v28 - 128) = a20;
  ((void (*)(uint64_t))((char *)*(&off_24C363D30 + (v29 ^ 0x1D0)) - 4))(v28 - 144);
  *(_QWORD *)(v28 - 136) = a9;
  *(_DWORD *)(v28 - 140) = (v29 + 486) ^ (460628867 * ((v28 - 1760279005 - 2 * ((v28 - 144) & 0x971446B3)) ^ 0xDB82C4CE));
  sub_20AABC954(v28 - 144);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void (*)(uint64_t), uint64_t, char *, uint64_t, uint64_t, void (*)(uint64_t), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 + 8 * (((*(_DWORD *)(v28 - 144) >= (v29 + 916476354)) * (v29 - 123)) ^ v29)) - 4))(v33, v34, v35, v36, v37, v38, v39, v40, a2, a3, v42, v43, a6, (char *)*(&off_24C363D30 + (v29 ^ 0x1DB)) - 4, a8, a9, v31, a11, a12,
           v45,
           a14,
           a15,
           a16,
           a17,
           a18);
}

uint64_t sub_20AACBA3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void (*a14)(uint64_t), uint64_t a15, uint64_t a16, void (*a17)(uint64_t), int a18, int a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34)
{
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  *(_QWORD *)(v37 - 104) = a34;
  *(_QWORD *)(v37 - 144) = a27;
  *(_QWORD *)(v37 - 136) = v36;
  *(_QWORD *)(v37 - 128) = v36;
  *(_QWORD *)(v37 - 120) = v34;
  *(_DWORD *)(v37 - 112) = a19
                         - 951
                         + 1224239923 * ((((v37 - 144) | 0xB1BADDB3) - ((v37 - 144) & 0xB1BADDB3)) ^ 0x43092064);
  a17(v37 - 144);
  *(_DWORD *)(v37 - 112) = a19
                         - 951
                         + 1224239923
                         * ((741470135 - ((v37 - 144) | 0x2C31EFB7) + ((v37 - 144) | 0xD3CE1048)) ^ 0x217DED9F);
  *(_QWORD *)(v37 - 144) = a27;
  *(_QWORD *)(v37 - 136) = a21;
  *(_QWORD *)(v37 - 104) = v36;
  *(_QWORD *)(v37 - 128) = v36;
  *(_QWORD *)(v37 - 120) = v34;
  a17(v37 - 144);
  *(_DWORD *)(v37 - 144) = (a19 + 426521211) ^ (235795823
                                              * ((2 * ((v37 - 144) & 0x403C64F0) - (v37 - 144) - 1077699825) ^ 0x2B6ED256));
  *(_QWORD *)(v37 - 136) = v36;
  *(_QWORD *)(v37 - 128) = a26;
  sub_20AAE6434(v37 - 144);
  *(_DWORD *)(v37 - 144) = (a19 - 1244) ^ (235795823 * ((v37 - 144) ^ 0x94AD4959));
  *(_QWORD *)(v37 - 136) = v36;
  *(_QWORD *)(v37 - 128) = a28;
  a14(v37 - 144);
  *(_DWORD *)(v37 - 128) = a19
                         + 1374699841 * ((((v37 - 144) | 0xC69197A2) - ((v37 - 144) & 0xC69197A2)) ^ 0xAB658FAB)
                         - 314;
  *(_QWORD *)(v37 - 144) = v36;
  *(_QWORD *)(v37 - 136) = a28;
  v38 = sub_20AAA176C(v37 - 144);
  return (*(uint64_t (**)(uint64_t))(v35 + 8 * ((((a19 - 1455) ^ (a19 - 1514)) * (a25 == 0)) ^ (a19 - 1361))))(v38);
}

uint64_t sub_20AACBC74()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  int v8;

  v4 = 535753261 * ((v3 + 142155382 - 2 * ((v3 - 144) & 0x8791F06)) ^ 0x28D1129);
  *(_QWORD *)(v3 - 136) = v6;
  *(_QWORD *)(v3 - 120) = v2;
  *(_DWORD *)(v3 - 144) = (((v0 + 744) ^ 0xB433AA5F) + v8) ^ v4;
  *(_DWORD *)(v3 - 128) = v0 - v4 + 729;
  result = ((uint64_t (*)(uint64_t))((char *)*(&off_24C363D30 + (v0 ^ 0x13B)) - 8))(v3 - 144);
  *(_DWORD *)(v7 - 0x18E0A6AD4C458BC0) = v8;
  *(_DWORD *)(v1 + 64) = 306494155;
  return result;
}

void sub_20AACBDDC(uint64_t a1)
{
  int v1;
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  _DWORD v6[2];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v1 = *(_DWORD *)(a1 + 24) - 1225351577 * ((2 * (a1 & 0x2B9C6F1D) - a1 + 1415811298) ^ 0x77F948F4);
  if (*(_DWORD *)(*(_QWORD *)(a1 + 8) - 0x4FF3ADA337C70001) - 311742309 >= 0)
    v3 = *(_DWORD *)(*(_QWORD *)(a1 + 8) - 0x4FF3ADA337C70001) - 311742309;
  else
    v3 = 311742309 - *(_DWORD *)(*(_QWORD *)(a1 + 8) - 0x4FF3ADA337C70001);
  v2 = *(_QWORD *)(a1 + 16);
  if (*(_DWORD *)(v2 - 0x4FF3ADA337C70001) - 311742309 >= 0)
    v4 = *(_DWORD *)(v2 - 0x4FF3ADA337C70001) - 311742309;
  else
    v4 = 311742309 - *(_DWORD *)(v2 - 0x4FF3ADA337C70001);
  v7 = *(_QWORD *)(a1 + 8);
  v6[1] = (460628867 * (((v6 | 0x78392D14) - (v6 & 0x78392D14)) ^ 0x34AFAF69)) ^ (v1 - 992);
  sub_20AABC954((uint64_t)v6);
  if (v3 >= v4)
    v5 = v4;
  else
    v5 = v3;
  __asm { BR              X14 }
}

uint64_t sub_20AACBF60()
{
  uint64_t v0;
  int v1;
  int v2;
  unsigned int v3;
  _BOOL4 v4;

  v4 = v2 - 1879399745 < (int)(v3 + 138191451);
  if (v3 > 0x77C35DA4 != v2 - 1879399745 < (int)((v1 + 1020090213) & 0xC332A6AE ^ 0x883CA675))
    v4 = v3 > 0x77C35DA4;
  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((v4 * (((v1 - 1014) | 0x401) ^ 0x64D)) ^ v1)) - 8))();
}

uint64_t sub_20AACBFF8@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  unsigned int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  unsigned int v14;
  int v15;
  _QWORD *v16;
  _BOOL4 v17;
  uint64_t v18;
  int v19;
  int v20;
  _BOOL4 v21;

  v15 = a1 - 11;
  v16 = (_QWORD *)(v12 - 0x4FF3ADA337C6FFFDLL);
  v17 = v14 > v7;
  v18 = 4 * (v10 + v8);
  v19 = v3 + v13 + (*(_DWORD *)(*v16 + v18) ^ (v9 + ((v15 - 1556) | 0x428) - 1070));
  *(_DWORD *)(*(_QWORD *)(a2 - 0x4FF3ADA337C6FFFDLL) + v18) = v19 + v9 - (v11 & (2 * v19));
  v20 = v10 + 1 + v4;
  LODWORD(v18) = v17 ^ (v20 < v5);
  v21 = v20 < v6;
  if (!(_DWORD)v18)
    v17 = v21;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((63 * v17) ^ v15)) - 8))();
}

uint64_t sub_20AACC0DC()
{
  uint64_t v0;
  int v1;
  int v2;
  unsigned int v3;
  _BOOL4 v4;

  v4 = v2 - 534008698 < (int)(v3 + 1483582498);
  if (v3 > 0x279253DD != v2 - 534008698 < -663901150)
    v4 = v3 > 0x279253DD;
  return (*(uint64_t (**)(void))(v0 + 8 * ((v4 * (((21 * (v1 ^ 0x41D) - 1520266488) & 0x5A9D6DFF) - 1134)) ^ v1)))();
}

uint64_t sub_20AACC164@<X0>(int a1@<W0>, uint64_t a2@<X8>, uint64_t a3)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  unsigned int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  unsigned int v13;
  int v14;
  _BOOL4 v15;
  uint64_t v16;
  int v17;
  int v18;
  _BOOL4 v19;

  v14 = (a1 - 43) | 0x2A;
  v15 = v13 > v8;
  v16 = 4 * (v11 + v9);
  v17 = ((3 * (v14 ^ 0x593)) ^ 0x3E2CA16)
      + v4
      + (*(_DWORD *)(*(_QWORD *)(a3 - 0x4FF3ADA337C6FFFDLL) + v16) ^ 0x7BE231D9);
  *(_DWORD *)(*(_QWORD *)(a2 - 0x4FF3ADA337C6FFFDLL) + v16) = v17 + v10 - (v12 & (2 * v17));
  v18 = v11 + 1 + v5;
  LODWORD(v16) = v15 ^ (v18 < v6);
  v19 = v18 < v7;
  if (!(_DWORD)v16)
    v15 = v19;
  return (*(uint64_t (**)(void))(v3 + 8 * (v15 ^ v14)))();
}

uint64_t sub_20AACC25C()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * ((78
                                          * (((v2 + 106) ^ (v1 == ((v2 + 488) ^ 0x450399DBFC1D37C0))) & 1)) ^ v2))
                            - 12))();
}

uint64_t sub_20AACC2A4()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((487 * (v2 + v3 - 1 < ((v1 - 456) ^ 0x7FFFFAA8u))) ^ (v1 - 1162)))
                            - 12))();
}

uint64_t sub_20AACC530@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * (int)((51
                                               * (*(_DWORD *)(*(_QWORD *)(a1 - 0x4FF3ADA337C6FFFDLL)
                                                            + 4 * (((v2 + 424333990) & 0xE6B52A97 ^ (v3 + 658)) + v5)) == v4)) ^ (v2 + 424333990) & 0xE6B52A97))
                            - 12))();
}

uint64_t sub_20AACC590()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * (((((v1 - 401) | 0x61B) ^ 0xDD) * ((v3 + v2 - 2) < 0x7FFFFFFF)) ^ v1))
                            - 12))();
}

uint64_t sub_20AACC5D0()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  int v3;
  int v4;
  int v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * ((51 * (*(_DWORD *)(v2 + 4 * ((v1 ^ (v3 + 658)) + v5)) == v4)) ^ v1))
                            - 12))();
}

void sub_20AACC604(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;

  *(_DWORD *)(a1 - 0x4FF3ADA337C70001) = (((v3 + v2) * (v1 - 916476699)) ^ 0x1A96CF7F)
                                         - 134348826
                                         + ((2 * (v3 + v2) * (v1 - 916476699)) & 0x352D9EFE);
}

void sub_20AACC68C(uint64_t a1)
{
  int v1;

  v1 = 1178560073 * ((-2 - ((a1 | 0x20C3A6CC) + (~(_DWORD)a1 | 0xDF3C5933))) ^ 0x65A82151);
  __asm { BR              X9 }
}

uint64_t sub_20AACC724@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * (((v2 == ((v1 + 1405855760) & 0xAC34577D ^ 0x4478C974))
                                          * (((2 * v1) ^ 0x5D8) - 564)) ^ v1))
                            - 8))();
}

uint64_t sub_20AACC78C@<X0>(uint64_t a1@<X8>)
{
  int v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * (int)((v1 + 1175069344) & 0xB9F5DEBF)) - 8))();
}

uint64_t sub_20AACC8B0@<X0>(int a1@<W5>, int a2@<W7>, uint64_t a3@<X8>)
{
  int v3;
  int v4;
  int v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(a3 + 8 * (((v4 == (v5 ^ 0xF8 ^ (v3 + 937) ^ (7 * (v5 ^ a1)))) * a2) ^ v5))
                            - 12))();
}

uint64_t sub_20AACC8E8@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * (v2 ^ (1059 * (v1 != 0)))) - ((v2 - 299) ^ 0x296)))();
}

uint64_t sub_20AACC914@<X0>(int a1@<W6>, uint64_t a2@<X8>)
{
  int v2;
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;

  *(_DWORD *)(*(_QWORD *)(v4 - 0x4FF3ADA337C6FFFDLL) + 4 * (v3 + v2)) = a1;
  v6 = v3 + v5 - 669;
  *(_DWORD *)(v4 - 0x4FF3ADA337C70001) = v6;
  v7 = v6 + v2;
  if (v6 + v2 < 0)
    v7 = -v7;
  return ((uint64_t (*)(void))(*(_QWORD *)(a2
                                        + 8
                                        * ((1418
                                          * ((int)(((v5 + 436491520) & 0xE5FBAAFF ^ (v2 + 361))
                                                 + (v7 ^ 0x1BBECFE7)
                                                 - 153747586
                                                 + (((v5 + 277) ^ 0x377D9C7D) & (2 * v7))) > (int)((v5 - 273) ^ 0xFFFFFE72))) ^ (v5 + 277)))
                            - 8))();
}

uint64_t sub_20AACC9EC@<X0>(uint64_t a1@<X8>)
{
  int v1;
  _QWORD *v2;
  int v3;
  unsigned int v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((301 * (*(_DWORD *)(*v2 + 4 * v4) != v1)) ^ v3)) - 8))();
}

uint64_t sub_20AACCA14@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1
                                        + 8
                                        * ((1418
                                          * ((int)(((((v3 - 667) | 0x3B0) + 436491243) & 0xE5FBAAFF ^ (v1 + 361))
                                                 + ((v3 - 667) | 0x3B0)
                                                 + v2
                                                 + (((v3 - 278) | 5) ^ 0xFFFFFDC1)) > (int)((((v3 - 667) | 0x3B0) - 550) ^ 0xFFFFFE72))) ^ ((v3 - 667) | 0x3B0)))
                            - 8))();
}

_DWORD *sub_20AACCA8C(_DWORD *result)
{
  int v1;
  int v2;
  _DWORD *v3;
  int v4;
  int v5;

  if ((v1 + v2 - 1) >= 0x7FFFFFFF)
    v5 = 623484618 - v4;
  else
    v5 = v4;
  *v3 = v5;
  *result = 746457987;
  return result;
}

void Mib5yocT(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BOOL v8;
  int v12;

  if (a2)
    v8 = a3 == 0;
  else
    v8 = 1;
  v12 = !v8 && a6 != 0 && a7 != 0 && a8 != 0;
  __asm { BR              X8 }
}

uint64_t sub_20AACCB64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, _DWORD *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21,unsigned int a22)
{
  uint64_t v22;
  unsigned int v23;
  int v24;
  uint64_t v25;
  uint64_t v27;

  *a6 = 0;
  *a7 = 0;
  a22 = 108757529
      * (((&a21 | 0x7488BE6A) - &a21 + (&a21 & 0x8B774190)) ^ 0x9414DC41)
      - 504207030;
  v27 = v22;
  v25 = sub_20AAE5C84(&a21);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v27 + 8 * ((1812 * (a21 == v24)) ^ v23)) - 4))(v25);
}

uint64_t sub_20AACCC00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,unint64_t *a21,unsigned int a22,unsigned int a23,int a24)
{
  uint64_t v24;
  unsigned int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v36;

  v25 = 1759421093 * (((&a21 | 0x689FFDE2) - (&a21 & 0x689FFDE2)) ^ 0xDBE24DB6);
  a24 = v25 ^ 0x445509ED;
  HIDWORD(a21) = v25 ^ 0x24D21C9;
  a22 = v25 + 1609;
  LODWORD(a21) = v25 ^ 0x1F2726AC;
  sub_20AAA94DC((uint64_t)&a21);
  if (a23 < 0x48EDB6D0)
    v26 = 1;
  else
    v26 = 2;
  v36 = __PAIR64__(v26, a23);
  a23 = 178 - 460628867 * (&a21 ^ 0x4C96827D);
  a21 = &STACK[0x7EF87141C217A9F9];
  sub_20AAE2E14((uint64_t)&a21);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a14 + 8 * ((37 * (a22 != 306494155)) ^ 0x145)) - 4))(v27, v28, v29, v30, v31, v32, v33, v34, a9, v24, v36, a12, a13, a14);
}

uint64_t sub_20AACCD58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21,int a22,uint64_t a23,unsigned int a24,uint64_t a25)
{
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  uint64_t v34;

  v31 = 1178560073 * ((&a21 & 0x1CC87DC7 | ~(&a21 | 0x1CC87DC7)) ^ 0x59A3FA5A);
  a23 = a16;
  a24 = (v30 - 806) ^ v31;
  a22 = ((2 * v29) & 0xBFFFFBDA) + ((((v30 - 724) | 0x20) + 1610611853) ^ v29) - 1220780128 + v31;
  sub_20AAA1514((uint64_t)&a21);
  a24 = v30
      + 1224239923 * ((2 * (&a21 & 0x4FC90A80) - &a21 - 1338575493) ^ 0x428508AC)
      - 629;
  a25 = v28;
  a23 = a16;
  ((void (*)(int *))((char *)*(&off_24C363D30 + (int)(v30 - 1040)) - 12))(&a21);
  v32 = 1178560073 * (&a21 ^ 0xBA947862);
  a22 = (v27 ^ 0x777CFD9D) + ((2 * v27) & 0xEEF9FB3A) - 1614848016 + v32;
  a23 = a16;
  a24 = (v30 - 806) ^ v32;
  sub_20AAA1514((uint64_t)&a21);
  v33 = 1178560073 * ((((2 * &a21) | 0xC9B77478) - &a21 + 455361988) ^ 0x5E4FC25E);
  a22 = v33 + v30 - 639;
  a24 = v33 ^ ((v26 ^ 0x5BFE6E7F) - 1344283738 + ((2 * v26) & 0xB7FCDCFE));
  a23 = a16;
  a25 = a13;
  v34 = ((uint64_t (*)(int *))((char *)*(&off_24C363D30 + (int)(v30 - 872)) - 12))(&a21);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(a14 + 8 * ((a21 == v25) ^ v30)) - 8))(v34);
}

uint64_t sub_20AACCF68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,unint64_t *a22,uint64_t a23,unsigned int a24,unsigned int a25,unsigned int a26,int a27)
{
  int v27;
  int v28;
  unsigned int v29;
  uint64_t v30;

  v29 = 460628867 * ((2 * (&a22 & 0x63101D50) - &a22 - 1662000468) ^ 0xD07960D1);
  a26 = (a12 ^ 0xCFEAFFCE) + 2142760756 + ((2 * a12) & 4) - v29;
  a24 = v29 + 1653835586;
  a25 = v29 + v28 - 2024874127;
  a22 = &STACK[0x61B876722A6C08F];
  a23 = a17;
  v30 = sub_20AAE5D1C((uint64_t)&a22);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(a15
                                                      + 8
                                                      * (((a27 == v27) * ((((v28 - 1012) | 0x49B) - 859) ^ 0x24D)) ^ v28))
                                          - 8))(v30);
}

uint64_t sub_20AACD058(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unsigned int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,unint64_t *a23,unint64_t *a24,unsigned int a25)
{
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;

  a25 = (v26 - 942) ^ (1225351577
                     * ((((2 * &a21) | 0x5E0F99F6) - &a21 - 789040379) ^ 0xC9D14ED));
  a23 = &STACK[0x204BE2628387442E];
  a24 = &STACK[0x765012DCA7D407BE];
  a22 = a18;
  v27 = v25;
  v28 = ((uint64_t (*)(char *))((char *)*(&off_24C363D30 + (v26 ^ 0x465)) - 8))(&a21);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v27 + 8 * (((v26 - 544) * (a11 < 0x48EDB6D0)) ^ v26)) - 4))(v28);
}

uint64_t sub_20AACD164(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _BYTE *a18, uint64_t a19, int a20,char a21,unsigned int a22,char *a23,_BYTE *a24)
{
  char *v24;
  uint64_t v25;
  int v26;
  int v27;
  int v28;
  char *v29;
  void (*v30)(unsigned int *);
  uint64_t v31;

  a22 = (v27 - 914) ^ (((&a22 + 58069395 - 2 * (&a22 & 0x3761193)) ^ 0x6E82099A) * v28);
  a23 = &a21 + v25;
  a24 = a18;
  v30(&a22);
  a22 = (v26 + 71) ^ (((-711969797 - (&a22 | 0xD59033FB) + (&a22 | 0x2A6FCC04)) ^ 0x479BD40D)
                    * v28);
  a23 = v29;
  a24 = a18;
  v30(&a22);
  a23 = v24;
  a24 = a18;
  a22 = (v26 + 71) ^ (((-710370317 - (&a22 | 0xD5A89BF3) + (&a22 | 0x2A57640C)) ^ 0x47A37C05)
                    * v28);
  v30(&a22);
  a23 = a18;
  a22 = (v26 + 816) ^ (1755732067
                     * ((&a22 - 1264980960 - 2 * (&a22 & 0xB499EC20)) ^ 0x6A5F51FB));
  v31 = sub_20AABD7C8((uint64_t)&a22);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(a14
                                                      + 8
                                                      * (v26 ^ (((_DWORD)a24 == (((v26 - 226) | 0x414) ^ 0x1244BEDF)) << 9)))
                                          - 4))(v31);
}

uint64_t sub_20AACD2F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20)
{
  uint64_t v20;
  int v21;
  int v22;

  return ((uint64_t (*)(void))(*(_QWORD *)(v20 + 8 * (((a20 == v21) * (((v22 + 814) | 4) ^ (v22 + 102))) ^ v22)) - 4))();
}

uint64_t sub_20AACD320(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, _BYTE *a12, uint64_t a13, uint64_t a14, int a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,int a21)
{
  uint64_t v21;
  int v22;
  int v23;

  *a12 = (2 * ((v23 - 70) ^ 0xED) - 23) ^ a16;
  return ((uint64_t (*)(void))(*(_QWORD *)(v21
                                        + 8 * ((126 * (a21 == v22 + ((v23 - 70) ^ 0xED) + 931 - 1044)) ^ (v23 - 70)))
                            - 4))();
}

uint64_t sub_20AACD37C@<X0>(unsigned int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int v7;
  int v8;
  _BOOL4 v9;

  v9 = ((uint64_t (*)(_QWORD, uint64_t))*(&off_24C363D30 + v7))((v8 + v7 + 1570 - 1796) ^ a1, 1644418179) == 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(a7 + 8 * ((307 * ((((v7 + 818) ^ v9) & 1) == 0)) ^ v7)) - 4))();
}

uint64_t sub_20AACD3E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20)
{
  int v20;
  int v21;
  uint64_t v22;
  int v23;

  v23 = (a20 ^ v21) - ((2 * (a20 ^ v21)) & 0x7176B88) - 2087995964;
  return ((uint64_t (*)(void))(*(_QWORD *)(v22
                                        + 8
                                        * ((38
                                          * (((v20 + 1603130351) & 0xA07225EE ^ 0x7174B6A ^ (v23 << (v20 ^ 5)) & 0xDFFFDFFE)
                                           + (v23 ^ 0x6C745A3B)
                                           + 2125960711 != 1857521158)) ^ v20))
                            - 8))();
}

uint64_t sub_20AACD48C(uint64_t a1)
{
  int v1;
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v5
                                                               + 8
                                                               * (v4 ^ 0x76B ^ ((4
                                                                               * ((v2 + v1 + 268439553) > 7)) | (((v2 + v1 + 268439553) > 7) << 8))))
                                                   - (((v4 ^ 0x76B) + 1850283543) ^ 0x6E491409u)
                                                   + 643))(a1, v3);
}

uint64_t sub_20AACD4FC(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(void))(v4
                              + 8
                              * ((29
                                * ((a3 ^ (v3 - a1 < ((a3 + 2128426255) & 0xEF6BDEE7 ^ 0x6E4916A6uLL))) & 1)) ^ a3)))();
}

uint64_t sub_20AACD54C(uint64_t a1, uint64_t a2, int a3)
{
  unsigned int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((22 * (((((a3 ^ 0x666) + 608763673) ^ (v3 < 0x20)) & 1) == 0)) ^ a3 ^ 0x666))
                            - 12))();
}

uint64_t sub_20AACD594(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  v9 = v4 + v3 + v5;
  v10 = v1 + v9;
  v11 = *(_OWORD *)(v10 - 31);
  v12 = a1 + v9;
  *(_OWORD *)(v12 - 15) = *(_OWORD *)(v10 - 15);
  *(_OWORD *)(v12 - 31) = v11;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8
                                        + 8 * ((1043 * ((v2 & 0xFFFFFFE0) == 32)) ^ (v7 + (v6 | 0x4A001284) + 422)))
                            - (v7
                             + (v6 | 0x4A001284u)
                             + 1069)
                            + 1257))();
}

void sub_20AACD5FC()
{
  JUMPOUT(0x20AACD5B8);
}

uint64_t sub_20AACD608(uint64_t a1)
{
  int v1;
  int v2;
  unsigned int v3;
  _DWORD *v5;
  _QWORD *v6;
  void (*v7)(_BYTE *);
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[4];
  unsigned int v11;
  uint64_t v12;

  *v6 = a1;
  *v5 = v2;
  v3 = (v1 + 1157193874) & 0xBB069FEB;
  v12 = v9;
  v11 = v1 + 818 + 535753261 * (v10 ^ 0xAF40E2F) - 556;
  v7(v10);
  v11 = v3 + 535753261 * (((v10 | 0x7A3BC9FC) - (v10 & 0x7A3BC9FC)) ^ 0x70CFC7D3) + 136;
  v12 = v8;
  v7(v10);
  return 0;
}

uint64_t sub_20AACD898(_DWORD *a1)
{
  unsigned int v1;
  unsigned int v2;
  int v3;
  BOOL v4;
  unsigned int v5;
  uint64_t v6;

  v1 = 1224239923 * (((a1 | 0x8C9528F6) - (_DWORD)a1 + (a1 & 0x736AD709)) ^ 0x7E26D521);
  v2 = a1[4] - v1;
  v3 = *a1 ^ v1;
  v5 = v3 - 426202732;
  v4 = v3 - 426202732 < 0;
  LODWORD(v6) = 426202732 - v3;
  if (v4)
    v6 = v6;
  else
    v6 = v5;
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_24C363D30 + (int)(v2 - 536))
                              + (int)((1701 * (v6 != ((2 * (_DWORD)v6) & 0x143B3A6E))) ^ v2))
                            - 12))();
}

void sub_20AACD948(int a1@<W8>)
{
  uint64_t v1;
  int v2;

  **(_DWORD **)(v1 - 0x4FF3ADA337C6FFFDLL) = (v2 - 1977770697) ^ 0xE005311;
  *(_DWORD *)(v1 - 0x4FF3ADA337C70001) = a1 + 1;
}

void sub_20AACD99C(_DWORD *a1)
{
  unsigned int v1;

  v1 = *a1 ^ (1374699841 * ((((2 * (_DWORD)a1) | 0x97E9331C) - (_DWORD)a1 + 873162354) ^ 0xA6008187));
  __asm { BR              X10 }
}

uint64_t sub_20AACDA68@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5, int a6, unint64_t *a7, int a8)
{
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;

  v12 = 1755732067 * ((&a4 & 0xC02B3FE | ~(&a4 | 0xC02B3FE)) ^ 0x2D3BF1DA);
  a6 = (v10 - 45) ^ v12;
  a7 = &STACK[0x7B9E9BA5BB9673F2];
  a8 = v12 ^ 0x3177D66E;
  a4 = &STACK[0x164C0FDDF1987670];
  a5 = v11;
  v13 = (*(uint64_t (**)(unint64_t **))(a1 + 8 * (v10 - 245)))(&a4);
  return (*(uint64_t (**)(uint64_t))(v9
                                            + 8
                                            * ((788
                                              * (*(_DWORD *)(v11 - 0x140B289DC8FEE23CLL) == v8
                                                                                          + 45 * (v10 ^ 0x130)
                                                                                          - 1125)) ^ v10)))(v13);
}

uint64_t sub_20AACDB50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10)
{
  int v10;
  uint64_t v11;
  int v12;

  return ((uint64_t (*)(void))(*(_QWORD *)(v11
                                        + 8
                                        * (((((a10 == v10 + 4) ^ v12) & 1) * ((v12 - 828) ^ 0x123)) ^ v12))
                            - 4))();
}

void sub_20AACDB88(_DWORD *a1@<X8>)
{
  uint64_t v1;
  int v2;

  *a1 = v2;
  *(_DWORD *)(v1 + 4) = -306454018;
}

uint64_t sub_20AACDC3C(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  BOOL v5;
  unsigned int v6;
  unsigned int v7;

  v1 = 1374699841 * ((((2 * a1) | 0x4FD35BAC) - a1 + 1477857834) ^ 0xCA1DB5DF);
  v2 = *(_DWORD *)a1 ^ v1;
  v3 = *(_DWORD *)(a1 + 16) + v1;
  if (v3 < 0)
    v3 = -v3;
  v4 = *(_DWORD *)(*(_QWORD *)(a1 + 8) - 0x4FF3ADA337C70001);
  v6 = v4 - 311742309;
  v5 = v4 - 311742309 < 0;
  v7 = 311742309 - v4;
  if (!v5)
    v7 = v6;
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_24C363D30 + (v2 ^ 0x54E))
                              + (((v3 >> 5 >= v7) * ((v2 ^ 2) - 1533)) ^ v2))
                            - 12))();
}

uint64_t sub_20AACDCF0(uint64_t result)
{
  *(_DWORD *)(result + 4) = -728871353;
  return result;
}

uint64_t sub_20AACDD00@<X0>(uint64_t result@<X0>, char a2@<W8>)
{
  uint64_t v2;
  unsigned int v3;
  int v4;
  unsigned int v5;

  v5 = ((*(_DWORD *)(*(_QWORD *)(v2 - 0x4FF3ADA337C6FFFDLL) + 4 * v3) ^ 0x841DCE26) >> a2) ^ 0xD290EB88;
  *(_DWORD *)(result + 4) = v5 & 0xFE22FFF9 ^ 0xD250557F ^ ((v5 & ((v4 - 1636550144) & 0x618BC5FD ^ 0xFE22FA05))
                                                          - ((2 * v5) & 0xC043670)
                                                          + 115219256);
  return result;
}

void sub_20AACDD98(uint64_t a1)
{
  int v1;

  v1 = 1224239923 * (((a1 | 0x1FD8AEE4) - a1 + (a1 & 0xE027511B)) ^ 0xED6B5333);
  __asm { BR              X12 }
}

uint64_t sub_20AACDE8C()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((1985 * ((v1 ^ 0x86375356) != ((v0 + 48) ^ 0x1E1))) ^ v0)) - 4))();
}

uint64_t sub_20AACDED8()
{
  uint64_t v0;
  int v1;
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;

  v9 = v3 > 0x1AD268DA;
  *(_BYTE *)(*(_QWORD *)(v8 - 120) + (v5 - 1516337960)) = *(_BYTE *)(*(_QWORD *)(v6 + 8 * (v1 ^ 0x1C1))
                                                                                 + (((_BYTE)v5 - 40) & 0xF)
                                                                                 - 8) ^ *(_BYTE *)(v0 + (v5 - 1516337960)) ^ (23 * ((v5 - 40) & 0xF)) ^ *(_BYTE *)(*(_QWORD *)(v6 + 8 * (v1 - 342)) + (((_BYTE)v5 - 40) & 0xF) - 8) ^ *(_BYTE *)(*(_QWORD *)(v6 + 8 * (v1 - 316)) + (((_BYTE)v5 - 40) & 0xF) - 11);
  if (v9 == v5 - 1966334978 < v2)
    v9 = v5 - 1966334978 < v4;
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((v9 * (v1 ^ 0x670)) ^ v1)) - 4))();
}

uint64_t sub_20AACDFA0()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((168
                                          * (((2 * v1) & 0xC383AFBE ^ 0x2A6AC) + (v1 ^ 0xE7F68489) - 1090551825 != ((v0 + 1232) ^ 0x760) + 549541357)) ^ (v0 + 1157)))
                            - 12))();
}

uint64_t sub_20AACE010(uint64_t a1)
{
  int v1;
  int v2;
  int v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v4
                                                     + 8
                                                     * (((v1 + v3 - 1640093663 < ((429 * (v2 ^ 0x683)) ^ 0x352u))
                                                       * ((v2 ^ 0x553) - 963)) ^ v2)))(a1, 2654873632);
}

uint64_t sub_20AACE088(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((1930 * (((((a4 - 1005465480) & 0x3BEE2FFF) - 994) & a5) == 1640093664)) ^ a4))
                            - 4))();
}

uint64_t sub_20AACE0D4(uint64_t a1, int a2, uint64_t a3, int a4)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  BOOL v20;
  unint64_t v21;
  int v23;

  v12 = (v4 + v9 + a2);
  v13 = v12 + v5;
  v14 = v12 + *(_QWORD *)(v11 - 120);
  v15 = (v4 + v9) & 0xF;
  v16 = v15 - v14;
  v17 = (v8 | v15) - v14 + ((4 * a4) ^ 0xB74u) - 1562;
  v18 = (v7 | v15) - v14;
  v20 = (unint64_t)(v13 - v14) > 0xF && v16 + v6 >= ((a4 + 1971212416) & 0x8A81AFF7 ^ 0x3C2uLL) && v17 > 0xF;
  v21 = v18 + 1;
  v23 = v20 && v21 > 0xF;
  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * ((7 * v23) ^ a4)) - 4))();
}

uint64_t sub_20AACE16C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, _QWORD);

  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v10
                                                                              + 8
                                                                              * ((198 * (v9 >= ((a8 - 1158) ^ 0x186u))) ^ a8))
                                                                  - ((461 * (a8 ^ 0x61Eu)) ^ 0x396));
  *(_DWORD *)(v11 - 124) = v8;
  return v12(a1, a2, a3, 0);
}

uint64_t sub_20AACE1B8(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55)
{
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  int v61;
  uint64_t v62;
  int8x16_t v63;
  int8x16_t v64;
  int8x16_t v65;
  int8x16x4_t v67;
  int8x16x4_t v68;

  v67.val[1].i64[0] = ((_BYTE)a3 - 1) & 0xF;
  v67.val[1].i64[1] = ((_BYTE)a3 + (_BYTE)a6 - 7 + 123) & 0xF;
  v67.val[2].i64[0] = ((_BYTE)a3 + 13) & 0xF;
  v67.val[2].i64[1] = ((_BYTE)a3 + 12) & 0xF;
  v67.val[3].i64[0] = ((_BYTE)a3 + 11) & 0xF;
  v67.val[3].i64[1] = ((_BYTE)a3 + 10) & 0xF;
  v63.i64[0] = 0xF9F9F9F9F9F9F9F9;
  v63.i64[1] = 0xF9F9F9F9F9F9F9F9;
  v67.val[0].i64[0] = ((_BYTE)v55 + (_BYTE)v60 + (_BYTE)a2) & 0xF;
  v67.val[0].i64[1] = a3 & 0xF;
  v64.i64[0] = vqtbl4q_s8(v67, (int8x16_t)xmmword_20AB03690).u64[0];
  v68.val[0].i64[1] = ((_BYTE)a3 + 8) & 0xF;
  v68.val[1].i64[1] = ((_BYTE)a3 + 6) & 0xF;
  v68.val[2].i64[1] = (a3 + 4) & 0xF;
  v68.val[3].i64[1] = ((_BYTE)a3 + 2) & 0xF;
  v68.val[0].i64[0] = ((_BYTE)a3 + 9) & 0xF;
  v68.val[1].i64[0] = ((_BYTE)a3 + 7) & 0xF;
  v68.val[2].i64[0] = ((_BYTE)a3 + 5) & 0xF;
  v68.val[3].i64[0] = (a3 + 3) & 0xF;
  v64.i64[1] = vqtbl4q_s8(v68, (int8x16_t)xmmword_20AB03690).u64[0];
  v65 = vrev64q_s8(vmulq_s8(v64, v63));
  *(int8x16_t *)(*(_QWORD *)(v62 - 120) - 15 + (v55 + v60 + a2)) = veorq_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v57 + v67.val[0].i64[0] - 15), *(int8x16_t *)(v56 - 15 + (v55 + v60 + a2))), veorq_s8(*(int8x16_t *)(v67.val[0].i64[0] + v59 - 13), *(int8x16_t *)(v67.val[0].i64[0] + v58 - 14))), vextq_s8(v65, v65, 8uLL));
  return ((uint64_t (*)(void))(*(_QWORD *)(a55
                                        + 8
                                        * ((((a6 - 7) ^ ((v61 & 0xFFFFFFF0) == 16)) & 1 | (8 * (((a6 - 7) ^ ((v61 & 0xFFFFFFF0) == 16)) & 1))) ^ (a6 - 7)))
                            - 4))();
}

void sub_20AACE320()
{
  JUMPOUT(0x20AACE2A4);
}

uint64_t sub_20AACE32C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * (((v7 != a4) * ((a7 ^ 0x50) - 479)) | a7)) - 4))();
}

uint64_t sub_20AACE360(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  char v7;
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((26 * (a7 ^ 0x18D)) | ((v7 & 8) >> 1)))
                            - ((((26 * (a7 ^ 0x18D)) ^ 0x78Eu) + 572) ^ 0x3DELL)))();
}

uint64_t sub_20AACE3A4@<X0>(int a1@<W1>, int a2@<W3>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50)
{
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  int v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  unsigned int v60;
  int v61;
  char v62;
  char v63;
  char v64;
  unsigned int v65;
  int8x16x4_t v67;

  v59 = *(_QWORD *)(v58 - 120) - 7;
  *(_DWORD *)(v58 - 132) = v57 & 0xFFFFFFF8;
  *(_DWORD *)(v58 - 128) = v57;
  v60 = a2 - (v57 & 0xFFFFFFF8) + 8;
  v61 = v50 + v56;
  v62 = v50 + v56 + v55;
  v63 = v62 - a2;
  v64 = v62 + a3 - a2 + 116;
  v65 = v61 + a1 - a2;
  v67.val[0].i64[0] = v65 & 0xF;
  v67.val[0].i64[1] = v63 & 0xF;
  v67.val[1].i64[0] = (v63 + 15) & 0xF;
  v67.val[1].i64[1] = (v63 + 14) & 0xF;
  v67.val[2].i64[0] = (v63 + 13) & 0xF;
  v67.val[2].i64[1] = (v63 + 12) & 0xF;
  v67.val[3].i64[0] = (v63 + 11) & 0xF;
  v67.val[3].i64[1] = v64 & 0xF;
  *(int8x8_t *)(v59 + v65) = veor_s8(veor_s8(veor_s8(*(int8x8_t *)(v52 + v67.val[0].i64[0] - 7), *(int8x8_t *)(v51 - 7 + v65)), veor_s8(*(int8x8_t *)(v67.val[0].i64[0] + v54 - 5), *(int8x8_t *)(v67.val[0].i64[0] + v53 - 6))), vrev64_s8(vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v67, (int8x16_t)xmmword_20AB036A0), (int8x8_t)0xF9F9F9F9F9F9F9F9)));
  return (*(uint64_t (**)(__n128))(a50 + 8 * ((1483 * (v60 == 0)) ^ a3)))((__n128)xmmword_20AB036A0);
}

void sub_20AACE4D8()
{
  JUMPOUT(0x20AACE410);
}

uint64_t sub_20AACE4E0@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  uint64_t v15;
  uint64_t v16;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v15
                                                      + 8
                                                      * (((a1 + 572 + ((a1 - 117) | 0xC0) - 712)
                                                        * (*(_DWORD *)(v16 - 128) != *(_DWORD *)(v16 - 132))) ^ (a1 + 27)))
                                          - 4))(a15);
}

uint64_t sub_20AACE528(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7)
{
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = (a6 - 549541839);
  *(_BYTE *)(*(_QWORD *)(v13 - 120) + v14) = *(_BYTE *)(v9 + (v14 & 0xF)) ^ *(_BYTE *)(v7 + v14) ^ *(_BYTE *)((v14 & 0xF) + v11 + 2) ^ *(_BYTE *)((v14 & 0xF) + v10 + 1) ^ (-7 * (v14 & 0xF));
  return ((uint64_t (*)(void))(*(_QWORD *)(v12
                                        + 8
                                        * ((112 * (((a7 + 15) ^ (a6 - 1 == v8 + 481)) & 1)) ^ (a7 + 612)))
                            - 12))();
}

uint64_t sub_20AACE5A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47)
{
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  BOOL v51;
  int v52;

  v50 = *(_QWORD *)(a1 + 24);
  *(int8x16_t *)(v49 - 112) = veorq_s8(*(int8x16_t *)(*(_QWORD *)(a1 + 16) - 0x1171F84DB0CF5C20), (int8x16_t)xmmword_20AB036C0);
  if (*(_QWORD *)(v49 - 120))
    v51 = v50 == 0x502D1C54229AA677;
  else
    v51 = 1;
  v52 = v51;
  HIDWORD(a23) = 2 * v47;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v48 + 8 * (int)((1199 * (((((_DWORD)a5 + 544) ^ 0x58B ^ v52) & 1) == 0)) ^ a5)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47);
}

uint64_t sub_20AACE634(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,int a56)
{
  int v56;
  int v57;
  uint64_t v58;
  _BOOL4 v60;

  v60 = ((a56 - 34670724) ^ v57) + (HIDWORD(a23) & 0xFBDDF9FA) == -34669315
     || ((((a56 + 124) ^ v57) + (BYTE4(a23) & 0xFA) + 3) & 0xF) != (v56 ^ 0x40B) - 1409;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v58 + 8 * ((v60 * (((v56 - 574344851) & 0x223BCDBF) - 76)) ^ v56)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47);
}

uint64_t sub_20AACE6B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21,int a22,uint64_t a23,int a24,int a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,int a58)
{
  uint64_t v58;

  return ((uint64_t (*)(void))(*(_QWORD *)(v58
                                        + 8
                                        * (a58 | (16
                                                * (((2 * (a22 - (a25 & 0xD1615B78) + (a58 ^ 0xCF8D92C4))) & 0xEFDFD7EE ^ 0xC1415368)
                                                 + ((a22 - (a25 & 0xD1615B78) + (a58 ^ 0xCF8D92C4)) ^ 0x9F5F464B)
                                                 - 67119584 == 1945092631))))
                            - 12))();
}

uint64_t sub_20AACE77C()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v3
                                                      + 8
                                                      * ((169 * (v2 + v1 + (v0 ^ 0x2FBu) - 2012215082 + 953 > 7)) ^ v0 ^ 0x2FB))
                                          - (v0 ^ 0x7B0u)
                                          + 549))(2282753150);
}

uint64_t sub_20AACE7FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7)
{
  uint64_t v7;

  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(v7
                                                                                        + 8
                                                                                        * ((1421
                                                                                          * ((((a6 + a1 + a7 + 1353) < 0xFFFFFFF0) ^ (a7 + 32)) & 1)) ^ a7))
                                                                            - 8))(a1, a2, (a7 + 1353), a2, (a7 + 287) | 0x82u);
}

uint64_t sub_20AACE844(int a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  _BOOL4 v22;
  int v25;

  v10 = v7 + v6 + ((a3 - 626) ^ (a1 + 1154));
  v11 = *(_QWORD *)(v9 - 120);
  v12 = v10 + v11 + 1;
  v13 = ((_BYTE)v7 + (_BYTE)v6 + ((a3 - 114) ^ (a1 - 126))) & 0xF;
  v14 = v13 - v10;
  v15 = v3 + v14;
  ++v13;
  v16 = v3 + v13;
  v17 = v5 + v14;
  v18 = v5 + v13;
  v19 = v4 + v14;
  v20 = v4 + v13;
  v22 = v16 > v11 && v15 < v12;
  if (v18 > v11 && v17 < v12)
    v22 = 1;
  v25 = v20 > v11 && v19 < v12 || v22;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((230 * ((((a3 - 1722) ^ v25) & 1) == 0)) ^ a3)) - 12))();
}

uint64_t sub_20AACE8E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  unsigned int v7;
  uint64_t v8;

  return (*(uint64_t (**)(void))(v8 + 8 * (((((a7 - 763) ^ 0x1C2) - 933) * (v7 < 0x10)) ^ a7)))();
}

uint64_t sub_20AACE90C(int a1, int a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55)
{
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  int v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  int8x16_t v63;
  int8x16_t v64;
  uint64_t v65;
  int8x16_t v66;
  int8x16_t v67;
  int8x16_t v68;
  int8x16x4_t v70;
  int8x16x4_t v71;

  *(_DWORD *)(v61 - 128) = a2 - 1;
  v62 = *(_QWORD *)(v61 - 120) - 15;
  v70.val[1].i64[0] = ((_BYTE)a2 + 7) & 0xF;
  v70.val[1].i64[1] = ((_BYTE)a2 + 6) & 0xF;
  v70.val[2].i64[0] = ((_BYTE)a2 + 5) & 0xF;
  v70.val[2].i64[1] = ((_BYTE)a2 + 4) & 0xF;
  v70.val[3].i64[0] = ((_BYTE)a2 + 3) & 0xF;
  v70.val[3].i64[1] = ((_BYTE)a2 + 2) & 0xF;
  v71.val[0].i64[0] = ((_BYTE)a2 + 1) & 0xF;
  v71.val[0].i64[1] = a2 & 0xF;
  v71.val[1].i64[0] = *(_DWORD *)(v61 - 128) & 0xF;
  v71.val[1].i64[1] = ((_BYTE)a2 + 14) & 0xF;
  v71.val[2].i64[0] = ((_BYTE)a2 + 13) & 0xF;
  v71.val[2].i64[1] = ((_BYTE)a2 + 12) & 0xF;
  v71.val[3].i64[0] = ((_BYTE)a2 + 11) & 0xF;
  v71.val[3].i64[1] = (a2 + 10) & 0xF;
  v63.i64[0] = 0x505050505050505;
  v63.i64[1] = 0x505050505050505;
  v64.i64[0] = 0xFBFBFBFBFBFBFBFBLL;
  v64.i64[1] = 0xFBFBFBFBFBFBFBFBLL;
  v65 = a1 + v60 + v59 + 1491 + ((a4 + 534559216) & 0xE02343F7);
  v70.val[0].i64[0] = ((_BYTE)a1 + (_BYTE)v60 + (_BYTE)v59 - 45 + (((_BYTE)a4 - 16) & 0xF7)) & 0xF;
  v70.val[0].i64[1] = ((_BYTE)a2 + 8) & 0xF;
  v66.i64[0] = vqtbl4q_s8(v70, (int8x16_t)xmmword_20AB03690).u64[0];
  v66.i64[1] = vqtbl4q_s8(v71, (int8x16_t)xmmword_20AB03690).u64[0];
  v67 = vrev64q_s8(veorq_s8(veorq_s8(*(int8x16_t *)(v62 + v65), *(int8x16_t *)(v55 + (v65 & 0xF) - 15)), veorq_s8(*(int8x16_t *)(v57 + (v65 & 0xF) - 15), *(int8x16_t *)(v56 + (v65 & 0xF) - 15))));
  v68 = vrev64q_s8(veorq_s8(veorq_s8(vextq_s8(v67, v67, 8uLL), v64), vmulq_s8(v66, v63)));
  *(int8x16_t *)(v62 + v65) = vextq_s8(v68, v68, 8uLL);
  return (*(uint64_t (**)(void))(a55 + 8 * ((1610 * ((v58 & 0xFFFFFFF0) == 16)) ^ a4)))();
}

void sub_20AACEA90()
{
  JUMPOUT(0x20AACEA14);
}

uint64_t sub_20AACEA9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55)
{
  uint64_t v55;
  _BYTE *v56;
  int v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  int v68;
  unint64_t v69;
  int v70;
  uint64_t v71;
  int v72;
  int v73;
  int v74;
  int v75;
  unsigned int v76;
  int v77;
  int v78;
  int v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  uint64_t v83;
  int v84;
  uint64_t v85;
  int v86;
  unsigned int v87;
  int v88;
  int v89;
  int v90;
  unsigned int v91;
  int v92;
  int v93;
  int v94;
  unsigned int v95;
  int v96;
  int v97;
  int v98;
  int v99;
  unsigned int v100;
  int v101;
  unsigned int v102;
  unsigned int v103;
  int v104;
  int v105;
  int v106;
  int v107;
  unsigned int v108;
  unsigned int v109;
  int v110;
  int v111;
  int v112;
  int v113;
  unsigned int v114;
  unsigned int v115;
  unsigned int v116;
  int v117;
  unsigned int v118;
  unsigned int v119;
  int v120;
  int v121;
  int v122;
  unsigned int v123;
  uint64_t v124;
  unsigned int v125;
  char *v126;
  char *v127;
  int v128;
  char *v129;
  int v130;
  unsigned int v131;
  unsigned int v132;
  unsigned int v133;
  unsigned int v134;
  unsigned int v135;
  int v136;
  int v137;
  unsigned int v138;
  unsigned int v139;
  int v140;
  unsigned int v141;
  int v142;
  int v143;
  int v144;
  unsigned int v145;
  unsigned int v146;
  int v147;
  int v148;
  int v149;
  unsigned int v150;
  unsigned int v151;
  int v152;
  unsigned int v153;
  unsigned int v154;
  int v155;
  int v156;
  int v157;
  unsigned int v158;
  int v159;
  unsigned int v160;
  int v161;
  unsigned int v162;
  unsigned int v163;
  int v164;
  unsigned int v165;
  int v166;
  unsigned int v167;
  int v168;
  int v169;
  int v170;
  int v171;
  int v172;
  int v173;
  int v174;
  int v175;
  unsigned int v176;
  unsigned int v177;
  int v178;
  unsigned int v179;
  int v180;
  int v181;
  int v182;
  int v183;
  int v184;
  int v185;
  unsigned int v186;
  unsigned int v187;
  unsigned int v188;
  int v189;
  int v190;
  int v191;
  int v192;
  int v193;
  char *v194;
  char *v195;
  char *v196;
  char *v197;
  unsigned int v198;
  unsigned int v199;
  unsigned int v200;
  int v201;
  int v202;
  int v203;
  int v204;
  unsigned __int8 *v205;
  uint64_t v206;
  int v207;
  uint64_t v208;
  uint64_t v209;
  int v210;
  int v211;
  uint64_t v212;
  int v213;
  uint64_t v214;
  unsigned int v215;
  int v216;
  int v217;
  unsigned int v218;
  int v219;
  int v220;
  unsigned int v221;
  int v222;
  char *v223;
  unsigned int v224;
  char *v225;
  unsigned int v226;
  unsigned int v227;
  char *v228;
  int v229;
  int v230;
  unint64_t v231;
  int v232;
  int v233;
  char *v234;
  int v235;
  int v236;
  int v237;
  int v238;
  int v239;
  unsigned int v240;
  int v241;
  unsigned int v242;
  unsigned int v243;
  int v244;
  int v245;
  int v246;
  int v247;
  unsigned int v248;
  unsigned int v249;
  unsigned int v250;
  int v251;
  int v252;
  unsigned int v253;
  unsigned int v254;
  int v255;
  int v256;
  unsigned int v257;
  int v258;
  int v259;
  int v260;
  int v261;
  unsigned int v262;
  int v263;
  int v264;
  int v265;
  int v266;
  int v267;
  int v268;
  unsigned int v269;
  unsigned int v270;
  unsigned int v271;
  int v272;
  int v273;
  int v274;
  int v275;
  int v276;
  int v277;
  int v278;
  int v279;
  unsigned int v280;
  unsigned int v281;
  int v282;
  int v283;
  int v284;
  unsigned int v285;
  int v286;
  int v287;
  int v288;
  unsigned int v289;
  unsigned int v290;
  unsigned int v291;
  int v292;
  unsigned int v293;
  unsigned int v294;
  int v295;
  int v296;
  int v297;
  int v298;
  int v299;
  int v300;
  unsigned int v301;
  unsigned int v302;
  int v303;
  int v304;
  unsigned int v305;
  int v306;
  unsigned int v307;
  unsigned int v308;
  int v309;
  int v310;
  int v311;
  int v312;
  int v313;
  int v314;
  int v315;
  unsigned int v316;
  int v317;
  int v318;
  unsigned int v319;
  int v320;
  int v321;
  int v322;
  int v323;
  unsigned int v324;
  int v325;
  int v326;
  unsigned int v327;
  int v328;
  int v329;
  int v330;
  unsigned int v331;
  int v332;
  int v333;
  int v334;
  int v335;
  int v336;
  int v337;
  int v338;
  unsigned int v339;
  int v340;
  int v341;
  unsigned int v342;
  uint64_t v343;
  char *v344;
  uint64_t v345;
  int v346;
  int v347;
  char *v348;
  int v349;
  int v350;
  char *v351;
  int v352;
  int v353;
  int v354;
  int v355;
  unsigned int v356;
  uint64_t v357;
  char *v358;
  char *v359;
  int v360;
  unsigned int v361;
  int v362;
  unsigned int v363;
  int v364;
  uint64_t v365;
  uint64_t v366;
  unsigned int v368;
  int v369;
  int v370;
  int v371;
  int v372;
  unsigned int v373;
  int v374;
  int v375;
  int v376;
  unsigned int v377;
  int v378;
  unsigned int v379;
  int v380;
  int v381;
  int v382;
  int v383;
  unsigned int v384;
  unsigned int v385;
  int v386;
  unsigned __int8 v387;
  unsigned int v388;
  int v389;
  int v390;
  unsigned int v391;
  unsigned int v392;
  int v393;
  int v394;
  int v395;
  int v396;
  int v397;
  unsigned int v398;
  int v399;
  __int16 v400;
  int v401;
  unsigned int v402;
  int v403;
  unsigned __int8 v404;
  unsigned int v405;
  int v406;
  unsigned int v407;
  unsigned int v408;
  int v409;
  unsigned int v410;
  int v411;
  unsigned int v412;
  unsigned int v413;
  int v414;
  unsigned int v415;
  int v416;
  unsigned int v417;
  unsigned int v418;
  int v419;
  int v420;
  int v421;
  unsigned int v422;
  unsigned int v423;
  int v424;
  unsigned int v425;
  int v426;
  unsigned int v427;
  int v428;
  unsigned int v429;
  int v430;
  unsigned int v431;
  int v432;
  unsigned int v433;
  unsigned int v434;
  int v435;
  int v436;
  int v437;
  int v438;
  unsigned int v439;
  unsigned __int8 v440;
  unsigned int v441;
  unsigned int v442;
  int v443;
  __int16 v444;
  int v445;
  int v446;
  int v447;
  int v448;
  unsigned int v449;
  int v450;
  unsigned int v451;
  int v452;
  int v453;
  int v454;
  unsigned int v455;
  int v456;
  unsigned int v457;
  unsigned int v458;
  int v459;
  unsigned int v460;
  unsigned int v461;
  int v462;
  int v463;
  int v464;
  int v465;
  int v466;
  int v467;
  int v468;
  int v469;
  int v470;
  int v471;
  int v472;
  int v473;
  int v474;
  int v475;
  int v476;
  int v477;
  unsigned int v478;
  int v479;
  unsigned int v480;
  int v481;
  int v482;
  unsigned int v483;
  int v484;
  unsigned int v485;
  int v486;
  int v487;
  int v488;
  int v489;
  int v490;
  unsigned int v491;
  int v492;
  int v493;
  int v494;
  int v495;
  int v496;
  unsigned int v497;
  int v498;
  int v499;
  unsigned int v500;
  unsigned int v501;
  int v502;
  int v503;
  int v504;
  unsigned int v505;
  int v506;
  int v507;
  unsigned int v508;
  int v509;
  int v510;
  unsigned int v511;
  int v512;
  unsigned int v513;
  int v514;
  int v515;
  int v516;
  int v517;
  int v518;
  int v519;
  int v520;
  int v521;
  unsigned int v522;
  int v523;
  int v524;
  int v525;
  int v526;
  int v527;
  int v528;
  int v529;
  int v530;
  unsigned int v531;
  unsigned int v532;
  int v533;
  int v534;
  int v535;
  int v536;
  unsigned int v537;
  int v538;
  int v539;
  int v540;
  unsigned int v541;
  int v542;
  char *v543;
  unsigned int v544;
  char *v545;
  int v546;
  char *v547;
  int v548;
  unsigned int v549;
  int v550;
  int v551;
  unsigned int v552;
  unsigned int v553;
  unsigned int v554;
  int v555;
  unsigned int v556;
  unsigned int v557;
  unsigned int v558;
  int v559;
  int v560;
  int v561;
  unsigned int v562;
  unsigned int v563;
  int v564;
  unsigned int v565;
  int v566;
  int v567;
  int v568;
  int v569;
  int v570;
  int v571;
  int v572;
  int v573;
  int v574;
  unsigned int v575;
  int v576;
  unsigned int v577;
  int v578;

  *(_DWORD *)(v60 - 124) = v58 ^ 0x365;
  v61 = *(_QWORD *)(v59 + 8 * (v58 - 23)) - 8;
  v62 = (*(unsigned __int8 *)(v61 + (*(unsigned __int8 *)(v55 - 0x502D1C54229AA675) ^ 0xD7)) ^ 0x78) << 8;
  v63 = *(_QWORD *)(v59 + 8 * (v58 ^ 0xFu)) - 8;
  v64 = *(unsigned __int8 *)(v63 + (*v56 ^ ((v58 ^ 0x65) - 33)));
  v65 = *(unsigned __int8 *)(v55 - 0x502D1C54229AA66ALL) ^ 0x49;
  *(_DWORD *)(v60 - 200) = v57;
  v66 = v58;
  v67 = *(_QWORD *)(v59 + 8 * (v58 ^ 0x30u)) - 8;
  LODWORD(v65) = *(unsigned __int8 *)(v67 + v65);
  v68 = v64 ^ 0xB4;
  HIDWORD(v69) = ~(_DWORD)v65;
  LODWORD(v69) = (v65 ^ 0xFFFFFFBF) << 24;
  LOBYTE(v64) = v69 >> 26;
  v70 = v62 | (v68 << 24);
  v71 = *(_QWORD *)(v59 + 8 * (v66 ^ 0xF8u)) - 4;
  v72 = *(unsigned __int8 *)(v63 + (*(unsigned __int8 *)(v55 - 0x502D1C54229AA66BLL) ^ 0xB8));
  v73 = *(unsigned __int8 *)(v67 + (*(unsigned __int8 *)(v55 - 0x502D1C54229AA66ELL) ^ 0x6BLL));
  HIDWORD(v69) = ~v73;
  LODWORD(v69) = (v73 ^ 0xFFFFFFBF) << 24;
  v74 = ((v69 >> 26) ^ 0x53) << 16;
  LOBYTE(v65) = *(_BYTE *)(v61 + (*(unsigned __int8 *)(v55 - 0x502D1C54229AA669) ^ 0x2ELL));
  v75 = *(unsigned __int8 *)(v67 + (*(unsigned __int8 *)(v55 - 0x502D1C54229AA676) ^ 0x47));
  HIDWORD(v69) = ~v75;
  LODWORD(v69) = (v75 ^ 0xFFFFFFBF) << 24;
  v76 = v70 & 0xFF00FF00 | (*(_BYTE *)(v71 + (*(unsigned __int8 *)(v55 - 0x502D1C54229AA674) ^ 0xECLL))
                                           - 93) ^ 9 | (((v69 >> 26) ^ 0x1E) << 16);
  v77 = v74 | ((*(unsigned __int8 *)(v61 + (*(unsigned __int8 *)(v55 - 0x502D1C54229AA66DLL) ^ 0x77)) ^ 0xB7) << 8);
  LODWORD(v67) = *(unsigned __int8 *)(v67 + (*(unsigned __int8 *)(v55 - 0x502D1C54229AA672) ^ 0xCBLL));
  v78 = ((v64 ^ 0xFB) << 16) | ((v72 ^ 0xC) << 24) | ((v65 ^ 0xBD) << 8);
  HIDWORD(v69) = ~(_DWORD)v67;
  LODWORD(v69) = (v67 ^ 0xFFFFFFBF) << 24;
  LOBYTE(v75) = *(_BYTE *)(v71 + (*(unsigned __int8 *)(v55 - 0x502D1C54229AA668) ^ 0x36));
  LOBYTE(v67) = *(_BYTE *)(v71 + (*(unsigned __int8 *)(v55 - 0x502D1C54229AA66CLL) ^ 0xB5));
  LODWORD(v61) = ((*(_BYTE *)(v71 + (*(unsigned __int8 *)(v55 - 0x502D1C54229AA670) ^ 0xA9)) - 93) | ((*(unsigned __int8 *)(v61 + (*(unsigned __int8 *)(v55 - 0x502D1C54229AA671) ^ 0x30)) ^ 0x4D) << 8)) & 0xFF00FFFF | (((v69 >> 26) ^ 0xBA) << 16) | ((*(unsigned __int8 *)(v63 + (*(unsigned __int8 *)(v55 - 0x502D1C54229AA673) ^ 0x35)) ^ 0x7B) << 24);
  v79 = v77 | ((*(unsigned __int8 *)(v63 + (*(unsigned __int8 *)(v55 - 0x502D1C54229AA66FLL) ^ 0xBFLL)) ^ 0x62) << 24);
  v80 = *(_QWORD *)(v59 + 8 * (v66 - 34)) - 8;
  v81 = *(_QWORD *)(v59 + 8 * (v66 ^ 0xE2u)) - 4;
  v82 = *(_DWORD *)(v80 + 4 * ((v75 - 93) ^ 0xFDu)) ^ 0x3DDD0BF3 ^ *(_DWORD *)(v81
                                                                                                + 4
                                                                                                * (v64 ^ 0x61u));
  *(_DWORD *)(v60 - 140) = v66;
  v83 = *(_QWORD *)(v59 + 8 * (v66 ^ 0x88u)) - 12;
  v84 = (v82 - ((2 * v82) & 0x3EBC628C) - 1621216954) ^ *(_DWORD *)(v83 + 4 * (v72 ^ 0x99u));
  v85 = *(_QWORD *)(v59 + 8 * (v66 + 30));
  v557 = v76;
  v86 = *(_DWORD *)(v85 + 4 * (v65 ^ 0x85u)) ^ v76 ^ (v84 - ((2 * v84) & 0x67B7DBC0) - 1277432352);
  v556 = v78 & 0xFFFFFF00 | (v75 - 93) ^ 0x2A;
  LOBYTE(v67) = (v67 - 93) ^ 0xA8;
  v87 = v79 & 0xFFFFFF00 | v67;
  v555 = v61;
  v88 = v86 ^ v61;
  LODWORD(v71) = v86;
  v419 = v86;
  v89 = v86 ^ v61 ^ 0x4D;
  *(_DWORD *)(v60 - 184) = v88;
  *(_DWORD *)(v60 - 168) = v89 ^ v87;
  LODWORD(v63) = v89 ^ v87 ^ (v556 - 2 * (v556 & 0xF33CE0F ^ ((v75 - 93) ^ 0x2A) & 8) - 1892430329);
  v426 = BYTE1(v63);
  v448 = BYTE2(v63);
  v90 = *(_DWORD *)(v85 + 4 * (BYTE1(v63) ^ 0x34u)) ^ *(_DWORD *)(v81 + 4 * (BYTE2(v63) ^ 0x8Du));
  v91 = v63 ^ 0x35C4E3AE;
  v463 = v63;
  LODWORD(v63) = ((v90 ^ 0x440FE594) - ((2 * (v90 ^ 0x440FE594)) & 0x9412070E) - 905378937) ^ *(_DWORD *)(v80 + 4 * (v63 ^ 0x2Eu));
  v457 = HIBYTE(v91);
  v92 = v71 ^ *(_DWORD *)(v83 + 4 * (HIBYTE(v91) ^ 0x65)) ^ (v63 - ((2 * v63) & 0x3EBC628C) - 1621216954);
  v554 = v87;
  v561 = v92 ^ 0x4D326FD2;
  *(_DWORD *)(v60 - 160) = v92;
  v93 = v92 ^ 0x4D326FD2 ^ (v87 - 2 * (v87 & 0x4D326FD3 ^ v67 & 1) + 1295151058);
  LODWORD(v67) = v93 ^ v91;
  *(_DWORD *)(v60 - 152) = v93;
  v472 = ((unsigned __int16)(v93 ^ v91) >> 8);
  v476 = ((v93 ^ v91) >> 16);
  v94 = *(_DWORD *)(v81 + 4 * (v476 ^ 0x2Eu)) ^ *(_DWORD *)(v85 + 4 * (v472 ^ 0x9Bu)) ^ 0x440FE594;
  *(_DWORD *)(v60 - 224) = v67;
  v95 = (v94 - ((2 * v94) & 0x9412070E) - 905378937) ^ *(_DWORD *)(v80 + 4 * (v67 ^ 0xD2u));
  v96 = v67 ^ 0xB5FE0275;
  *(_DWORD *)(v60 - 208) = BYTE3(v67);
  v97 = (v95 - ((2 * v95) & 0x3EBC628C) - 1621216954) ^ *(_DWORD *)(v83 + 4 * (BYTE3(v67) ^ 0x69));
  LOBYTE(v72) = v89;
  v404 = v89;
  LODWORD(v67) = v97 ^ v89 ^ 0xA3F3ECBE;
  v507 = v97 ^ v89;
  v510 = v67 ^ v93;
  v98 = ((v510 ^ 0x3975E154) - 1051090116 + (~(2 * (v510 ^ 0x3975E154)) | 0x7D4CB987) + 1) ^ v96;
  v524 = ((v98 ^ 0x9547167F) >> 16);
  v540 = ((unsigned __int16)(v98 ^ 0x167F) >> 8);
  v99 = *(_DWORD *)(v85 + 4 * (v540 ^ 0x3Au)) ^ *(_DWORD *)(v81 + 4 * (v524 ^ 0x89u));
  v534 = (((v67 ^ v93 ^ 0x54) + 60 + (~(2 * (v67 ^ v93 ^ 0x54)) | 0x87) + 1) ^ v96);
  LODWORD(v61) = ((v99 ^ 0x440FE594) - 2 * ((v99 ^ 0x440FE594) & 0x4A0903A7 ^ v99 & 0x20) - 905378937) ^ *(_DWORD *)(v80 + 4 * (v534 ^ 0xE4u));
  v558 = (v98 ^ 0x9547167F) >> 24;
  LODWORD(v61) = (v61 - ((2 * v61) & 0x3EBC628C) - 1621216954) ^ *(_DWORD *)(v83 + 4 * (v558 ^ 0x1D));
  v483 = v97 ^ v92;
  v569 = (v61 + 1250992187 + (~(2 * v61) | 0x6ADEBF89) + 1) ^ v97 ^ v92;
  *(_DWORD *)(v60 - 248) = v569 ^ 0x4A90A03B;
  v575 = v569 ^ 0x4A90A03B ^ v97 ^ v89;
  v100 = ((v575 ^ 0xFE25CD6D) - ((2 * (v575 ^ 0xFE25CD6D)) & 0x82B34678) - 1051090116) ^ v96;
  *(_DWORD *)(v60 - 216) = BYTE1(v100);
  LODWORD(v61) = *(_DWORD *)(v85 + 4 * (BYTE1(v100) ^ 0x6Fu));
  *(_DWORD *)(v60 - 232) = BYTE2(v100);
  LODWORD(v61) = *(_DWORD *)(v81 + 4 * (BYTE2(v100) ^ 0xA8u)) ^ v61;
  v565 = HIBYTE(v100);
  LODWORD(v61) = ((v61 ^ 0x440FE594) - 2 * ((v61 ^ 0x440FE594) & 0x1F5E314F ^ v61 & 9) - 1621216954) ^ *(_DWORD *)(v83 + 4 * (HIBYTE(v100) ^ 0x85));
  v548 = v100;
  LODWORD(v61) = (v61 - ((2 * v61) & 0x9412070E) - 905378937) ^ *(_DWORD *)(v80 + 4 * (v100 ^ 0x25u));
  v563 = v575 ^ v67 ^ v93;
  v101 = (v61 - ((2 * v61) & 0x3209822E) + 419741975) ^ v67 ^ v563;
  v102 = (v61 - ((2 * v61) & 0x3209822E) + 419741975) ^ v67;
  v410 = v102;
  *(_DWORD *)(v60 - 128) = v101;
  LODWORD(v71) = v101 ^ 0xB4B7C685;
  LODWORD(v67) = v100 ^ v101 ^ 0xB4B7C685;
  v400 = v101 ^ 0xC685;
  v103 = v100;
  v577 = v100;
  v441 = (v67 ^ 0x9AB690D2) >> 24;
  v430 = ((v67 ^ 0x9AB690D2) >> 16);
  v104 = *(_DWORD *)(v83 + 4 * (v441 ^ 0x1D)) ^ *(_DWORD *)(v81 + 4 * (v430 ^ 0x89u)) ^ 0x688A3932;
  v105 = ((unsigned __int16)(v67 ^ 0x90D2) >> 8);
  *(_DWORD *)(v60 - 256) = v105;
  v106 = (v104 - ((2 * v104) & 0x67B7DBC0) - 1277432352) ^ *(_DWORD *)(v85 + 4 * (v105 ^ 0x3Au));
  v573 = v67;
  LODWORD(v67) = *(_DWORD *)(v80 + 4 * (v67 ^ 0x49u));
  *(_DWORD *)(v60 - 176) = v569 ^ 0x4A90A03B ^ v61;
  LODWORD(v67) = (v106 - ((2 * v106) & 0x9412070E) - 905378937) ^ v67 ^ v569 ^ 0x4A90A03B ^ v61;
  v440 = BYTE2(v102) ^ 0x16;
  v107 = v102 ^ 0x7C166C11 ^ v67;
  v519 = v67;
  LODWORD(v61) = v103 ^ v107;
  v108 = (v103 ^ v107) >> 24;
  *(_DWORD *)(v60 - 240) = v108;
  v529 = v61;
  v109 = (v88 ^ 0xBAF72DE4) - 2 * (v72 & 4 ^ (v88 ^ 0xBAF72DE4) & 0x4D326FD6) + 1295151058;
  LODWORD(v63) = *(_DWORD *)(v83 + 4 * (v108 ^ 0x9B)) ^ *(_DWORD *)(v80 + 4 * (v61 ^ 0x31u)) ^ 0x555732C1;
  v500 = (v61 >> 8) ^ 0x86839A;
  v504 = BYTE1(v61) ^ 0x9A;
  v110 = (v63 - ((2 * v63) & 0x67B7DBC0) - 1277432352) ^ *(_DWORD *)(v85 + 4 * (BYTE1(v61) ^ 0xA0u));
  v111 = v110 - ((2 * v110) & 0xEFA810E8);
  v112 = v61 ^ 0x5D394B74;
  v490 = BYTE2(v61);
  LODWORD(v61) = (v111 - 137099148) ^ *(_DWORD *)(v81 + 4 * (BYTE2(v61) ^ 0xAu));
  v113 = (v61 - ((2 * v61) & 0x53AED4F0) - 1445500296) ^ v67;
  *(_DWORD *)(v60 - 132) = v113;
  v113 ^= 0x5454F0D2u;
  v114 = v113 ^ v107;
  LODWORD(v63) = v113;
  v444 = v113;
  v513 = v107 ^ v71;
  v479 = v107;
  v496 = v107 ^ v71 ^ 0xD521F308;
  v115 = ((v113 ^ v107 ^ 0x5A137D54) - ((2 * (v113 ^ v107 ^ 0x5A137D54)) & 0xE1E83A62) - 252437199) ^ v496;
  *(_DWORD *)(v60 - 136) = v115;
  v116 = ((v115 ^ 0xFCADA5F1) - 2 * ((v115 ^ 0x7B327DF1) & 1 ^ (v115 ^ 0xFCADA5F1) & 0x5BBAD1DF) - 608513570) ^ v112 ^ 0x479AB031;
  v546 = (((v115 ^ 0xF1) - 2 * ((v115 ^ 0xF1) & 1 ^ (v115 ^ 0xF1) & 0xDF) - 34) ^ v112);
  v571 = BYTE1(v116);
  LODWORD(v61) = *(_DWORD *)(v85 + 4 * (BYTE1(v116) ^ 0x3Au)) ^ *(_DWORD *)(v80 + 4 * (v546 ^ 0xAAu)) ^ 0x79D2EE67;
  v117 = BYTE2(v116);
  LODWORD(v61) = (v61 - ((2 * v61) & 0xEFA810E8) - 137099148) ^ *(_DWORD *)(v81 + 4 * (BYTE2(v116) ^ 0x89u));
  v460 = HIBYTE(v116);
  LODWORD(v61) = (v61 - ((2 * v61) & 0x3EBC628C) - 1621216954) ^ *(_DWORD *)(v83 + 4 * (HIBYTE(v116) ^ 0x1D));
  v118 = v61 ^ v107;
  v119 = ((v61 ^ v107 ^ 0xA6C48CD5) - ((2 * (v61 ^ v107 ^ 0xA6C48CD5)) & 0xB775A3BC) - 608513570) ^ v112;
  LODWORD(v67) = *(_DWORD *)(v83 + 4 * (HIBYTE(v119) ^ 5)) ^ *(_DWORD *)(v85 + 4 * (BYTE1(v119) ^ 0x6Fu)) ^ 0x2C85DCA6;
  v526 = (((v61 ^ v107 ^ 0xD5) - ((2 * (v61 ^ v107 ^ 0xD5)) & 0xBC) - 34) ^ v112);
  LODWORD(v67) = (v67 - ((2 * v67) & 0x9412070E) - 905378937) ^ *(_DWORD *)(v80 + 4 * (v526 ^ 0x25u));
  v120 = v63 ^ v61;
  LODWORD(v67) = v63 ^ v61 ^ *(_DWORD *)(v81 + 4 * (BYTE2(v119) ^ 0xA8u)) ^ (v67 - ((2 * v67) & 0xEFA810E8) - 137099148);
  LODWORD(v61) = v115 ^ 0x7B327DF1 ^ v67 ^ v119;
  v544 = v115 ^ 0x7B327DF1 ^ v67;
  v566 = BYTE1(v61);
  LODWORD(v85) = *(_DWORD *)(v85 + 4 * (BYTE1(v61) ^ 0x44u));
  v407 = BYTE3(v61);
  LODWORD(v83) = *(_DWORD *)(v83 + 4 * (BYTE3(v61) ^ 0x47));
  v121 = v561 ^ v109;
  v416 = v115 ^ 0xF1 ^ v67 ^ v119;
  v122 = ((v83 ^ v85 ^ 0x2C85DCA6) - 2 * ((v83 ^ v85 ^ 0x2C85DCA6) & 0x4A09038F ^ (v83 ^ v85) & 8) - 905378937) ^ *(_DWORD *)(v80 + 4 * (v416 ^ 0xD5u));
  v390 = BYTE2(v61);
  v123 = (v122 - ((2 * v122) & 0xEFA810E8) - 137099148) ^ *(_DWORD *)(v81 + 4 * (BYTE2(v61) ^ 0xCBu));
  *(_DWORD *)(v60 - 192) = v67;
  v553 = v67 ^ 0x79436D9C ^ (v123 - ((2 * v123) & 0xF368806A) - 105627595);
  v397 = v67 ^ v118;
  v552 = v67 ^ v118 ^ 0xC495A75C ^ (v553 - ((2 * v553) & 0xC06ED090) - 533239736);
  v551 = v552 ^ v544 ^ 0x42632BF0 ^ 0x4662A266;
  v550 = (v551 - 2 * (v551 & 0x3E06E737 ^ (v552 ^ v544 ^ 0x42632BF0) & 0x10) + 1040639783) ^ v61;
  LODWORD(v83) = ((v120 ^ 0x1B9155BDu) >> 16);
  LODWORD(v61) = v83 + 348136160 + ((2 * ((v120 ^ 0x1B9155BDu) >> 16) + 88) & 0x166 ^ 0xF67F6FFF);
  LODWORD(v85) = v83 ^ 0x2D;
  LODWORD(v80) = *(_DWORD *)(v60 - 140);
  v124 = (uint64_t)*(&off_24C363D30 + (v80 ^ 0xE0));
  LODWORD(v61) = v61 ^ *(_DWORD *)(v124 + 4 * v85);
  v125 = ((BYTE2(v119) ^ 0x89) + 348136160 + ((2 * (BYTE2(v119) ^ 0x89) + 88) & 0x166 ^ 0xF67F6FFF)) ^ *(_DWORD *)(v124 + 4 * (BYTE2(v119) ^ 0xA4u));
  v126 = (char *)*(&off_24C363D30 + (v80 + 2)) - 12;
  LODWORD(v71) = (v61 - ((2 * v61) & 0xDD9BF1D4) + 1858992362) ^ *(_DWORD *)&v126[4 * (BYTE1(v120) ^ 0x47)];
  v127 = (char *)*(&off_24C363D30 + (v80 ^ 0x13)) - 8;
  v128 = (v125 - ((2 * v125) & 0x56CA4A2C) + 728048918) ^ *(_DWORD *)&v127[4 * (HIBYTE(v119) ^ 0xCC)];
  v129 = (char *)*(&off_24C363D30 + (v80 + 35)) - 4;
  v130 = *(_DWORD *)&v129[4 * (v115 ^ 0xF1 ^ v118 ^ 0x53)];
  v537 = v115 ^ 0x7B327DF1 ^ v118;
  LODWORD(v61) = *(_DWORD *)(v124 + 4 * (BYTE2(v537) ^ 0xAAu)) ^ *(_DWORD *)&v127[4 * (HIBYTE(v537) ^ 0x3E)] ^ ((BYTE2(v537) ^ 0x87) + 348136160 + ((2 * (BYTE2(v537) ^ 0x87) + 88) & 0x166 ^ 0xF67F6FFF)) ^ (181304767 * v130 - ((362609534 * v130 + 40786362) & 0x56CA4A2C) + 748442099);
  LODWORD(v80) = *(_DWORD *)&v129[4 * (v118 ^ 0x74)];
  LODWORD(v80) = (181304767 * v80 - ((362609534 * v80 + 40786362) & 0xDD9BF1D4) + 1879385543) ^ *(_DWORD *)&v126[4 * (BYTE1(v118) ^ 0x5A)];
  v542 = v80 - ((2 * v80) & 0x56CA4A2C);
  v531 = HIBYTE(v118) ^ 0xB2;
  v487 = BYTE2(v118);
  v562 = (BYTE2(v118) ^ 0x4C) + 348136160 + ((2 * (BYTE2(v118) ^ 0x4C) + 88) & 0x166 ^ 0xF67F6FFF);
  v522 = v128 - ((2 * v128) & 0xDD9BF1D4);
  v516 = v61 - ((2 * v61) & 0xDD9BF1D4);
  v560 = (v71 - ((2 * v71) & 0x56CA4A2C) + 728048918) ^ *(_DWORD *)&v127[4 * ((v120 ^ 0x1B9155BDu) >> 24)] ^ (181304767 * *(_DWORD *)&v129[4 * (v120 ^ 0x7D)] + 20393181);
  v387 = BYTE1(v121);
  LOBYTE(v125) = v121;
  v131 = v121 ^ 0xE9B45E6C;
  v132 = *(_DWORD *)(v124 + 4 * (((v121 ^ 0xE9B45E6C) >> 16) ^ 0xF5u)) ^ ((((v121 ^ 0xE9B45E6C) >> 16) ^ 0xD8)
                                                                                           + 348136160
                                                                                           + ((2
                                                                                             * (((v121 ^ 0xE9B45E6C) >> 16) ^ 0xD8)
                                                                                             + 88) & 0x166 ^ 0xF67F6FFF));
  LODWORD(v71) = *(_DWORD *)(v60 - 152) ^ 0x31676F78;
  LODWORD(v80) = *(_DWORD *)(v124 + 4 * (BYTE2(v71) ^ 0x7Bu)) ^ ((BYTE2(v71) ^ 0x56)
                                                                 + 348136160
                                                                 + ((2 * (BYTE2(v71) ^ 0x56) + 88) & 0x166 ^ 0xF67F6FFF));
  LODWORD(v71) = (v80 - ((2 * v80) & 0x56CA4A2C) + 728048918) ^ *(_DWORD *)&v127[4 * BYTE3(v71)];
  v133 = *(_DWORD *)(v124 + 4 * (v476 ^ 0x34u)) ^ ((v476 ^ 0x19)
                                                   + 348136160
                                                   + ((2 * (v476 ^ 0x19) + 88) & 0x166 ^ 0xF67F6FFF));
  LODWORD(v61) = (v133 - ((2 * v133) & 0xDD9BF1D4) + 1858992362) ^ *(_DWORD *)&v126[4 * (v472 ^ 5)];
  v473 = v71 - ((2 * v71) & 0xDD9BF1D4);
  v477 = v61 - ((2 * v61) & 0x56CA4A2C);
  LODWORD(v61) = *(_DWORD *)&v129[4 * (*(_DWORD *)(v60 - 160) ^ 0xDF)];
  LODWORD(v71) = *(_DWORD *)(v60 - 160) ^ 0x5A18571F;
  LODWORD(v61) = *(_DWORD *)&v127[4 * BYTE3(v71)] ^ ((BYTE2(v71) ^ 0xC1)
                                                   + 348136160
                                                   + ((2 * (BYTE2(v71) ^ 0xC1) + 88) & 0x166 ^ 0xF67F6FFF)) ^ *(_DWORD *)(v124 + 4 * (BYTE2(v71) ^ 0xECu)) ^ (181304767 * v61 - ((362609534 * v61 + 40786362) & 0x56CA4A2C) + 748442099);
  v470 = v61 - ((2 * v61) & 0xDD9BF1D4);
  LODWORD(v61) = *(_DWORD *)&v127[4 * HIBYTE(v131)] ^ (v132 - ((2 * v132) & 0x56CA4A2C) + 728048918);
  v451 = v125 ^ 0xAC;
  v467 = v61 - ((2 * v61) & 0xDD9BF1D4);
  LOWORD(v71) = v114 ^ 0x8EA4;
  v114 ^= 0x35C48CD5u;
  LODWORD(v61) = *(_DWORD *)(v124 + 4 * (v117 ^ 0xDEu)) ^ ((v117 ^ 0xF3)
                                                           + 348136160
                                                           + ((2 * (v117 ^ 0xF3) + 88) & 0x166 ^ 0xF67F6FFF));
  v134 = *(_DWORD *)(v124 + 4 * (BYTE2(v114) ^ 0xFEu)) ^ ((BYTE2(v114) ^ 0xD3)
                                                          + 348136160
                                                          + ((2 * (BYTE2(v114) ^ 0xD3) + 88) & 0x166 ^ 0xF67F6FFF));
  v135 = v134 - ((2 * v134) & 0x56CA4A2C);
  v136 = *(_DWORD *)&v129[4 * (v115 ^ 0x34)];
  LODWORD(v65) = 181304767 * v136 - ((362609534 * v136 + 40786362) & 0xDD9BF1D4);
  LODWORD(v61) = (v61 - ((2 * v61) & 0x56CA4A2C) + 728048918) ^ *(_DWORD *)&v127[4 * (v460 ^ 0x36)];
  v137 = BYTE2(*(_DWORD *)(v60 - 132));
  v138 = *(_DWORD *)(v124 + 4 * (v137 ^ 0x78u)) ^ ((v137 ^ 0x55)
                                                   + 348136160
                                                   + ((2 * (v137 ^ 0x55) + 88) & 0x166 ^ 0xF67F6FFF));
  v139 = (v138 - ((2 * v138) & 0xDD9BF1D4) + 1858992362) ^ *(_DWORD *)&v126[4 * (HIBYTE(v444) ^ 0x8B)];
  v454 = v61 - ((2 * v61) & 0xDD9BF1D4);
  v461 = v139 - ((2 * v139) & 0x56CA4A2C);
  LODWORD(v61) = *(_DWORD *)(v60 - 136) ^ 0x19ADA5F1;
  LODWORD(v61) = *(_DWORD *)&v126[4 * (BYTE1(v61) ^ 0x20)] ^ ((BYTE2(v61) ^ 0xD7)
                                                            + 348136160
                                                            + ((2 * (BYTE2(v61) ^ 0xD7) + 88) & 0x166 ^ 0xF67F6FFF)) ^ *(_DWORD *)(v124 + 4 * (BYTE2(v61) ^ 0xFAu)) ^ (v65 + 1879385543);
  v140 = (v135 + 728048918) ^ *(_DWORD *)&v127[4 * HIBYTE(v114)] ^ (181304767
                                                                  * *(_DWORD *)&v129[4 * (v71 ^ 0x99)]
                                                                  + 20393181);
  v423 = BYTE1(v71) ^ 0x14;
  v402 = v444 ^ 0xA3;
  v434 = v140 - ((2 * v140) & 0xDD9BF1D4);
  v445 = v61 - ((2 * v61) & 0x56CA4A2C);
  v141 = v426 ^ 0x5E;
  v142 = *(_DWORD *)(v60 - 168);
  v413 = BYTE1(v142) ^ 0xF5;
  v427 = v419 ^ 0x2BEAE26B;
  LODWORD(v61) = *(_DWORD *)(v124 + 4 * (((v419 ^ 0x2BEAE26Bu) >> 16) ^ 0xECu)) ^ ((((v419 ^ 0x2BEAE26Bu) >> 16) ^ 0xC1) + 348136160 + ((2 * (((v419 ^ 0x2BEAE26Bu) >> 16) ^ 0xC1) + 88) & 0x166 ^ 0xF67F6FFF)) ^ (181304767 * *(_DWORD *)&v129[4 * (v419 ^ 0x1E)] + 20393181);
  LODWORD(v61) = (v61 - ((2 * v61) & 0xDD9BF1D4) + 1858992362) ^ *(_DWORD *)&v126[4 * (BYTE1(v419) ^ 8)];
  LODWORD(v65) = *(_DWORD *)(v124 + 4 * (v448 ^ 0x13u)) ^ ((v448 ^ 0x3E)
                                                           + 348136160
                                                           + ((2 * (v448 ^ 0x3E) + 88) & 0x166 ^ 0xF67F6FFF));
  v143 = *(_DWORD *)&v129[4 * (v404 ^ 0x55)];
  v420 = v61 - ((2 * v61) & 0x56CA4A2C);
  v393 = BYTE2(v142);
  v449 = (BYTE2(v142) ^ 0xA7) + 348136160 + ((2 * (BYTE2(v142) ^ 0xA7) + 88) & 0x166 ^ 0xF67F6FFF);
  v405 = v457 ^ 0x4B;
  LODWORD(v61) = (v65 - ((2 * v65) & 0xDD9BF1D4) + 1858992362) ^ *(_DWORD *)&v126[4 * v141] ^ (181304767
                                                                                             * *(_DWORD *)&v129[4 * (v463 ^ 0x5D)]
                                                                                             + 20393181);
  v464 = v61 - ((2 * v61) & 0x56CA4A2C);
  LODWORD(v63) = *(_DWORD *)(v60 - 184);
  LODWORD(v61) = (181304767 * v143 - ((362609534 * v143 + 40786362) & 0x56CA4A2C) + 748442099) ^ ((BYTE2(v63) ^ 0xBA)
                                                                                                + 348136160
                                                                                                + ((2 * (BYTE2(v63) ^ 0xBA)
                                                                                                  + 88) & 0x166 ^ 0xF67F6FFF)) ^ *(_DWORD *)&v127[4 * (BYTE3(v63) ^ 0x2F)] ^ *(_DWORD *)(v124 + 4 * (BYTE2(v63) ^ 0x97u));
  v395 = v61 - ((2 * v61) & 0xDD9BF1D4);
  LODWORD(v61) = BYTE2(*(_DWORD *)(v60 - 128));
  LODWORD(v61) = *(_DWORD *)(v124 + 4 * (v61 ^ 0xF6)) ^ ((v61 ^ 0xDB)
                                                                       + 348136160
                                                                       + ((2 * (v61 ^ 0xDB) + 88) & 0x166 ^ 0xF67F6FFF));
  LODWORD(v65) = *(_DWORD *)(v124 + 4 * (BYTE2(*(_DWORD *)(v60 - 176)) ^ 0x56u)) ^ ((BYTE2(*(_DWORD *)(v60 - 176)) ^ 0x7B)
                                                                                    + 348136160
                                                                                    + ((2
                                                                                      * (BYTE2(*(_DWORD *)(v60 - 176)) ^ 0x7B)
                                                                                      + 88) & 0x166 ^ 0xF67F6FFF));
  LODWORD(v61) = (v61 - ((2 * v61) & 0xDD9BF1D4) + 1858992362) ^ *(_DWORD *)&v126[4 * (HIBYTE(v400) ^ 0xD0)] ^ (181304767 * *(_DWORD *)&v129[4 * (v400 ^ 0xA1)] + 20393181);
  v144 = *(_DWORD *)&v129[4 * (v410 ^ 0xFB)];
  v145 = (181304767 * v144 - ((362609534 * v144 + 40786362) & 0xDD9BF1D4) + 1879385543) ^ *(_DWORD *)&v126[4 * (BYTE1(v410) ^ 0xEF)];
  v401 = v61 - ((2 * v61) & 0x56CA4A2C);
  v384 = v145 - ((2 * v145) & 0x56CA4A2C);
  LODWORD(v65) = (v65 - ((2 * v65) & 0x56CA4A2C) + 728048918) ^ *(_DWORD *)&v127[4
                                                                               * (HIBYTE(*(_DWORD *)(v60 - 176)) ^ 0xD9)] ^ (181304767 * *(_DWORD *)&v129[4 * (*(_DWORD *)(v60 - 176) ^ 0x79)] + 20393181);
  v146 = *(_DWORD *)(v124 + 4 * (v430 ^ 0x86u)) ^ ((v430 ^ 0xAB)
                                                   + 348136160
                                                   + ((2 * (v430 ^ 0xAB) + 88) & 0x166 ^ 0xF67F6FFF));
  v147 = (v146 - ((2 * v146) & 0x56CA4A2C) + 728048918) ^ *(_DWORD *)&v127[4 * v441];
  v431 = v147 - ((2 * v147) & 0xDD9BF1D4);
  v382 = v65 - ((2 * v65) & 0xDD9BF1D4);
  v437 = v440;
  v458 = (v437 ^ 0x65) + 348136160 + ((2 * (v437 ^ 0x65) + 88) & 0x166 ^ 0xF67F6FFF);
  v148 = *(_DWORD *)(v124 + 4 * (v390 ^ 0x8Bu)) ^ ((v390 ^ 0xA6)
                                                   + 348136159
                                                   - ((2 * (v390 ^ 0xA6) + 160207960) & 0x9809166));
  v149 = ((v544 ^ 0x42632BF0) >> 16);
  v442 = (v149 ^ 0xEC) + 348136160 + ((2 * (v149 ^ 0xEC) + 88) & 0x166 ^ 0xF67F6FFF);
  LODWORD(v71) = v407 ^ 0x22;
  v150 = *(_DWORD *)(v60 - 192);
  v151 = *(_DWORD *)(v124 + 4 * (BYTE2(v150) ^ 0xE8u)) ^ ((BYTE2(v150) ^ 0xC5)
                                                          + 348136160
                                                          + ((2 * (BYTE2(v150) ^ 0xC5) + 88) & 0x166 ^ 0xF67F6FFF));
  v152 = (181304767 * *(_DWORD *)&v129[4 * (v150 ^ 0xCA)] + 20393181) ^ *(_DWORD *)&v127[4 * (HIBYTE(v150) ^ 0x8E)] ^ (v151 - ((2 * v151) & 0x56CA4A2C) + 728048918);
  v408 = v67 ^ v118 ^ 0x44039AAA;
  v153 = (181304767 * *(_DWORD *)&v129[4 * (v397 ^ 0xDB)] + 20393181) ^ (((v397 ^ 0x44039AAAu) >> 16)
                                                                                        + 348136160
                                                                                        + ((2
                                                                                          * ((v397 ^ 0x44039AAAu) >> 16)
                                                                                          + 88) & 0x166 ^ 0xF67F6FFF)) ^ *(_DWORD *)(v124 + 4 * (((v397 ^ 0x44039AAAu) >> 16) ^ 0x2Du));
  v391 = v152 - ((2 * v152) & 0xDD9BF1D4);
  v154 = (v153 - ((2 * v153) & 0xDD9BF1D4) + 1858992362) ^ *(_DWORD *)&v126[4
                                                                          * (((unsigned __int16)(v67 ^ v118) >> 8) ^ 0xC0)];
  v155 = *(_DWORD *)&v127[4 * v71] ^ (181304767 * *(_DWORD *)&v129[4 * (v416 ^ 0xFE)] + 20393181) ^ (v148 - ((2 * v148) & 0x56CA4A2C) + 728048918);
  v417 = v154 - ((2 * v154) & 0x56CA4A2C);
  v398 = v155 - ((2 * v155) & 0xDD9BF1D4);
  v156 = *(_DWORD *)&v129[4 * (v483 ^ 0xEC)];
  v157 = *(_DWORD *)(v124 + 4 * (v524 ^ 0x32u)) ^ ((v524 ^ 0x1F)
                                                   + 348136159
                                                   - ((2 * (v524 ^ 0x1F) + 160207960) & 0x9809166));
  LODWORD(v71) = *(_DWORD *)&v129[4 * (v507 ^ 0xE6)];
  v158 = *(_DWORD *)&v127[4 * (HIBYTE(v483) ^ 0xCA)] ^ ((BYTE2(v483) ^ 0x2F)
                                                      + 348136160
                                                      + ((2 * (BYTE2(v483) ^ 0x2F) + 88) & 0x166 ^ 0xF67F6FFF)) ^ *(_DWORD *)(v124 + 4 * (BYTE2(v483) ^ 2u)) ^ (181304767 * v156 - ((362609534 * v156 + 40786362) & 0x56CA4A2C) + 748442099);
  LODWORD(v61) = (v157 - ((2 * v157) & 0xDD9BF1D4) + 1858992362) ^ *(_DWORD *)&v126[4 * (v540 ^ 0x8C)] ^ (181304767 * *(_DWORD *)&v129[4 * (v534 ^ 0xD9)] + 20393181);
  v159 = *(_DWORD *)&v127[4 * ((v507 ^ 0x49A657C7u) >> 24)] ^ ((((v507 ^ 0x49A657C7u) >> 16) ^ 0x35)
                                                             + 348136160
                                                             + ((2
                                                               * (((v507 ^ 0x49A657C7u) >> 16) ^ 0x35)
                                                               + 88) & 0x166 ^ 0xF67F6FFF)) ^ *(_DWORD *)(v124 + 4 * (((v507 ^ 0x49A657C7u) >> 16) ^ 0x18u)) ^ (181304767 * v71 - ((362609534 * v71 + 40786362) & 0x56CA4A2C) + 748442099);
  LODWORD(v65) = *(_DWORD *)(v124 + 4 * (((v510 ^ 0x788F72Bu) >> 16) ^ 0x2Du)) ^ (((v510 ^ 0x788F72Bu) >> 16) + 348136159 - ((2 * ((v510 ^ 0x788F72Bu) >> 16) + 160207960) & 0x9809166));
  v541 = v558 ^ 0xAA;
  v559 = (v158 + 1858992362 + (~(2 * v158) | 0x22640E2B) + 1) ^ *(_DWORD *)&v126[4 * (BYTE1(v483) ^ 0x2E)];
  v535 = v61 - ((2 * v61) & 0x56CA4A2C);
  v388 = BYTE1(v507) ^ 0xB9;
  LODWORD(v61) = (v65 - ((2 * v65) & 0x56CA4A2C) + 728048918) ^ *(_DWORD *)&v127[4 * ((v510 ^ 0x788F72Bu) >> 24)] ^ (181304767 * *(_DWORD *)&v129[4 * (v510 ^ 0xBB)] + 20393181);
  v525 = v159 - ((2 * v159) & 0xDD9BF1D4);
  v484 = v61 - ((2 * v61) & 0xDD9BF1D4);
  v160 = *(_DWORD *)(v124 + 4 * (v490 ^ 0xC1u)) ^ ((v490 ^ 0xEC)
                                                   + 348136160
                                                   + ((2 * (v490 ^ 0xEC) + 88) & 0x166 ^ 0xF67F6FFF));
  LODWORD(v61) = (v160 - ((2 * v160) & 0xDD9BF1D4) + 1858992362) ^ *(_DWORD *)&v126[4
                                                                                  * ((v504 - ((2 * v500) & 0x166) + 179) ^ 0x54)] ^ (181304767 * *(_DWORD *)&v129[4 * (v529 ^ 0xE2)] + 20393181);
  v501 = BYTE1(v510) ^ 0x77;
  v491 = BYTE1(v519) ^ 0x77;
  v161 = *(_DWORD *)&v129[4 * (v496 ^ 0x94)];
  v162 = ((~(362609534 * v161 + 40786362) | 0xA935B5D3) + 181304767 * v161 + 748442100) ^ *(_DWORD *)&v127[4 * (HIBYTE(v513) ^ 0xC9)];
  v379 = v387 ^ 0xB4;
  v385 = BYTE1(v496) ^ 0xB4;
  v530 = v61 - ((2 * v61) & 0x56CA4A2C);
  v497 = v162 - ((2 * v162) & 0xDD9BF1D4);
  v505 = v479 ^ 0xEEA2BFA8;
  v163 = *(_DWORD *)(v124 + 4 * (((v479 ^ 0xEEA2BFA8) >> 16) ^ 0x86u)) ^ ((((v479 ^ 0xEEA2BFA8) >> 16) ^ 0xAB)
                                                                                           + 348136160
                                                                                           + ((2
                                                                                             * (((v479 ^ 0xEEA2BFA8) >> 16) ^ 0xAB)
                                                                                             + 88) & 0x166 ^ 0xF67F6FFF));
  LODWORD(v61) = (181304767 * *(_DWORD *)&v129[4 * (v479 ^ 0x68)] + 20393181) ^ *(_DWORD *)&v126[4 * (BYTE1(v479) ^ 0x55)] ^ (v163 - ((2 * v163) & 0xDD9BF1D4) + 1858992362);
  v377 = v149 ^ 0xC1;
  v480 = v519 ^ 0x231B9DB5;
  v164 = ((v519 ^ 0x231B9DB5u) >> 16);
  v511 = (v164 ^ 0xC1) + 348136160 + ((2 * (v164 ^ 0xC1) + 88) & 0x166 ^ 0xF67F6FFF);
  v381 = v61 - ((2 * v61) & 0x56CA4A2C);
  v373 = BYTE2(v513) ^ 0xDF;
  v508 = (BYTE2(v513) ^ 0xF2) + 348136160 + ((2 * (BYTE2(v513) ^ 0xF2) + 88) & 0x166 ^ 0xF67F6FFF);
  v165 = v569 ^ 0xDB326F2F;
  v166 = *(_DWORD *)&v129[4 * (v548 ^ 0x74)];
  v549 = BYTE1(v150) ^ 0x16;
  v167 = v563;
  LODWORD(v81) = *(_DWORD *)(v60 - 152);
  v168 = *(_DWORD *)&v129[4 * (v81 ^ 0xB8)];
  LODWORD(v63) = *(_DWORD *)&v129[4 * v451];
  LODWORD(v65) = *(_DWORD *)&v129[4 * v402];
  v169 = *(_DWORD *)&v129[4 * (v546 ^ 0xF0)];
  LODWORD(v85) = *(_DWORD *)(v60 - 168);
  v170 = *(_DWORD *)&v129[4 * (v85 ^ 0x57)];
  v171 = *(_DWORD *)&v129[4 * (v573 ^ 0xEF)];
  v172 = *(_DWORD *)&v129[4 * (v544 ^ 0x78)];
  LODWORD(v61) = *(_DWORD *)&v129[4 * (v519 ^ 0x75)];
  LODWORD(v80) = *(_DWORD *)&v129[4 * (v563 ^ 0x16)];
  v173 = *(_DWORD *)&v129[4 * (v575 ^ 0x2A)];
  v174 = *(_DWORD *)&v129[4 * (v569 ^ 0x16)];
  v527 = 181304767 * *(_DWORD *)&v129[4 * (v526 ^ 0x60)] + 20393181;
  *(_DWORD *)(v60 - 224) = 181304767 * *(_DWORD *)&v129[4 * (*(_DWORD *)(v60 - 224) ^ 0xFB)] + 20393181;
  v570 = 181304767 * v168 + 20393181;
  v574 = 181304767 * v63 + 20393181;
  v520 = 181304767 * v65 + 20393181;
  v403 = 181304767 * v169 + 20393181;
  *(_DWORD *)(v60 - 192) = 181304767 * v170 + 20393181;
  v378 = 181304767 * v172 + 20393181;
  v514 = 181304767 * v61 + 20393181;
  v452 = 181304767 * v174 + 20393181;
  v175 = (181304767 * v166 - ((362609534 * v166 + 40786362) & 0x56CA4A2C) + 748442099) ^ *(_DWORD *)&v127[4 * (v565 ^ 0x7B)];
  LODWORD(v61) = *(_DWORD *)(v124 + 4 * (BYTE2(v167) ^ 0xA8u)) ^ ((BYTE2(v167) ^ 0x85)
                                                                  + 348136160
                                                                  + ((2 * (BYTE2(v167) ^ 0x85) + 88) & 0x166 ^ 0xF67F6FFF)) ^ (181304767 * v80 + 20393181);
  LODWORD(v61) = (v61 - ((2 * v61) & 0xDD9BF1D4) + 1858992362) ^ *(_DWORD *)&v126[4 * (BYTE1(v563) ^ 0x45)];
  v176 = *(_DWORD *)(v124 + 4 * (BYTE2(v165) ^ 0x3Cu)) ^ ((BYTE2(v165) ^ 0x11)
                                                          + 348136160
                                                          + ((2 * (BYTE2(v165) ^ 0x11) + 88) & 0x166 ^ 0xF67F6FFF));
  v177 = (181304767 * v173 + 20393181) ^ ((BYTE2(v575) ^ 0x37)
                                        + 348136160
                                        + ((2 * (BYTE2(v575) ^ 0x37) + 88) & 0x166 ^ 0xF67F6FFF)) ^ *(_DWORD *)(v124 + 4 * (BYTE2(v575) ^ 0x1Au));
  LODWORD(v65) = v175 - ((2 * v175) & 0xDD9BF1D4);
  v178 = (v177 - ((2 * v177) & 0x56CA4A2C) + 728048918) ^ *(_DWORD *)&v127[4 * (HIBYTE(v575) ^ 0xF9)];
  v376 = *(_DWORD *)(v124 + 4 * (v487 ^ 0x61u));
  v179 = v571 ^ 0x1A;
  LODWORD(v67) = *(_DWORD *)(v60 - 232);
  *(_DWORD *)(v60 - 232) = *(_DWORD *)(v124 + 4 * (v393 ^ 0x8Au));
  v488 = *(_DWORD *)(v124 + 4 * (v437 ^ 0x48u));
  v375 = *(_DWORD *)(v124 + 4 * v377);
  v394 = *(_DWORD *)(v124 + 4 * (v164 ^ 0xECu));
  v438 = *(_DWORD *)(v124 + 4 * v373);
  v572 = *(_DWORD *)(v124 + 4 * (v67 ^ 0x1A));
  v180 = ((v577 >> 15) & 0x58 ^ 0x48) + (v67 ^ 0x4C64A1B);
  v494 = *(_DWORD *)&v126[4 * (BYTE1(v119) ^ 0xB0)];
  v374 = *(_DWORD *)&v126[4 * (BYTE1(v537) ^ 0x8E)];
  *(_DWORD *)(v60 - 152) = *(_DWORD *)&v126[4 * (BYTE1(v81) ^ 0x85)];
  *(_DWORD *)(v60 - 160) = *(_DWORD *)&v126[4 * (BYTE1(*(_DWORD *)(v60 - 160)) ^ 0xBD)];
  v578 = *(_DWORD *)&v126[4 * v379];
  v380 = *(_DWORD *)&v126[4 * v179];
  v181 = v61 - ((2 * v61) & 0x56CA4A2C);
  v372 = *(_DWORD *)&v126[4 * v423];
  v564 = *(_DWORD *)&v126[4 * v413];
  *(_DWORD *)(v60 - 184) = *(_DWORD *)&v126[4 * (BYTE1(*(_DWORD *)(v60 - 184)) ^ 0xD6)];
  *(_DWORD *)(v60 - 256) = *(_DWORD *)&v126[4 * (*(_DWORD *)(v60 - 256) ^ 0xEE)];
  v424 = *(_DWORD *)&v126[4 * (BYTE1(*(_DWORD *)(v60 - 176)) ^ 0xD7)];
  v538 = *(_DWORD *)&v126[4 * (BYTE1(v544) ^ 0x76)];
  v182 = *(_DWORD *)&v126[4 * v549];
  v371 = *(_DWORD *)&v126[4 * (v566 ^ 0xBE)];
  *(_DWORD *)(v60 - 176) = *(_DWORD *)&v126[4 * v388];
  v567 = *(_DWORD *)&v126[4 * v501];
  v492 = *(_DWORD *)&v126[4 * v491];
  v502 = *(_DWORD *)&v126[4 * v385];
  *(_DWORD *)(v60 - 216) = *(_DWORD *)&v126[4 * (*(_DWORD *)(v60 - 216) ^ 0x84)];
  v576 = *(_DWORD *)&v126[4 * (BYTE1(v575) ^ 0x2E)];
  v183 = *(_DWORD *)&v126[4 * (BYTE1(*(_DWORD *)(v60 - 248)) ^ 0xC8)];
  v386 = *(_DWORD *)&v127[4 * v531];
  v532 = v522 + 1858992362;
  v523 = v516 + 1858992362;
  *(_DWORD *)(v60 - 208) = *(_DWORD *)&v127[4 * (*(_DWORD *)(v60 - 208) ^ 7)];
  *(_DWORD *)(v60 - 248) = v473 + 1858992362;
  v389 = v470 + 1858992362;
  v414 = v467 + 1858992362;
  v517 = *(_DWORD *)&v127[4 * (HIBYTE(*(_DWORD *)(v60 - 132)) ^ 0xB8)];
  v369 = v454 + 1858992362;
  v368 = v434 + 1858992362;
  v370 = *(_DWORD *)&v127[4 * (HIBYTE(*(_DWORD *)(v60 - 136)) ^ 0x6E)];
  LODWORD(v67) = HIBYTE(v427);
  v428 = *(_DWORD *)&v127[4 * (BYTE3(v85) ^ 0xB8)];
  *(_DWORD *)(v60 - 168) = *(_DWORD *)&v127[4 * v67];
  v435 = *(_DWORD *)&v127[4 * v405];
  v406 = v395 + 1858992362;
  v474 = *(_DWORD *)&v127[4 * (HIBYTE(*(_DWORD *)(v60 - 128)) ^ 0x61)];
  v411 = *(_DWORD *)&v127[4 * (HIBYTE(v410) ^ 0xE8)];
  v455 = v431 + 1858992362;
  v396 = v382 + 1858992362;
  v184 = *(_DWORD *)&v127[4 * (HIBYTE(v544) ^ 0xA6)];
  LODWORD(v61) = v391 + 1858992362;
  v185 = *(_DWORD *)&v127[4 * HIBYTE(v408)];
  v186 = v398 + 1858992362;
  v468 = v484 + 1858992362;
  v392 = v497 + 1858992362;
  v432 = v65 + 1858992362;
  v485 = v178 - ((2 * v178) & 0xDD9BF1D4) + 1858992362;
  v409 = *(_DWORD *)&v127[4 * v541];
  v498 = *(_DWORD *)&v127[4 * HIBYTE(v480)];
  v187 = HIBYTE(v505);
  v506 = *(_DWORD *)&v127[4 * (*(_DWORD *)(v60 - 240) ^ 0x38)];
  *(_DWORD *)(v60 - 240) = *(_DWORD *)&v127[4 * v187];
  v188 = v183 ^ (v176 - ((2 * v176) & 0xDD9BF1D4) + 1858992362);
  v481 = *(_DWORD *)&v127[4 * (HIBYTE(v167) ^ 0x93)];
  v383 = *(_DWORD *)&v127[4 * HIBYTE(v165)];
  v189 = v542 + 728048918;
  v399 = v477 + 728048918;
  v190 = v445 + 728048918;
  v421 = v420 + 728048918;
  v446 = v464 + 728048918;
  v465 = v535 + 728048918;
  v191 = v181 + 728048918;
  v192 = v188 - ((2 * v188) & 0x56CA4A2C) + 728048918;
  v193 = v560 ^ v559 ^ 0x6285F181;
  LODWORD(v85) = v61 ^ v182 ^ v193;
  LODWORD(v127) = *(_DWORD *)(v60 - 140);
  v194 = (char *)*(&off_24C363D30 + (int)v127 - 168) - 4;
  v195 = (char *)*(&off_24C363D30 + (v127 ^ 0xEE)) - 8;
  v196 = (char *)*(&off_24C363D30 + (v127 & 0x4B12A3F)) - 4;
  v197 = (char *)*(&off_24C363D30 + (v127 ^ 0xC)) - 4;
  v198 = (v197[*(unsigned __int8 *)(v60 - 109) ^ 0x41] ^ 0xA1) & 0xFF00FFFF | (((v195[*(unsigned __int8 *)(v60 - 111) ^ 0x40] + 50) ^ 0x5A) << 16) | ((v196[*(unsigned __int8 *)(v60 - 110) ^ 0xBBLL] ^ 0xA2) << 8) | ((v194[*(unsigned __int8 *)(v60 - 112) ^ 0x1ELL] ^ (*(unsigned __int8 *)(v60 - 112) - ((2 * *(_BYTE *)(v60 - 112)) & 0x66) - 77) ^ 0x84) << 24);
  v543 = v197;
  v545 = v196;
  v199 = (v197[*(unsigned __int8 *)(v60 - 105) ^ 0xE4] ^ 0x97) & 0xFF00FFFF | ((v194[*(unsigned __int8 *)(v60 - 108) ^ 0x3ELL] ^ (*(unsigned __int8 *)(v60 - 108) - ((2 * *(_BYTE *)(v60 - 108)) & 0x66) - 77) ^ 0xFFFFFFE1) << 24) | (((v195[*(unsigned __int8 *)(v60 - 107) ^ 0x27] + 50) ^ 0x96) << 16) | ((v196[*(unsigned __int8 *)(v60 - 106) ^ 9] ^ 0xA7) << 8);
  v547 = v195;
  v200 = (v197[*(unsigned __int8 *)(v60 - 101) ^ 0xF2] ^ 0x2E) & 0xFF00FFFF | ((v194[*(unsigned __int8 *)(v60 - 104) ^ 0xD3] ^ (*(unsigned __int8 *)(v60 - 104) - ((2 * *(_BYTE *)(v60 - 104)) & 0x66) - 77) ^ 0xE0) << 24) | (unsigned __int16)(v196[*(unsigned __int8 *)(v60 - 102) ^ 0xBELL] << 8) | (((v195[*(unsigned __int8 *)(v60 - 103) ^ 0xE9] + 50) ^ 0x8A) << 16);
  v201 = v85 ^ 0x2497E332;
  if ((v85 & 0x80) != 0)
    v202 = -128;
  else
    v202 = 128;
  *(_DWORD *)(v60 - 128) = (v197[*(unsigned __int8 *)(v60 - 97) ^ 0x74] ^ 6 | (((v195[*(unsigned __int8 *)(v60 - 99) ^ 0xF3] + 50) ^ 2) << 16) | ((v196[*(unsigned __int8 *)(v60 - 98) ^ 0x20] ^ 0x48) << 8) | ((v194[*(unsigned __int8 *)(v60 - 100) ^ 0xF3] ^ (*(unsigned __int8 *)(v60 - 100) - ((2 * *(_BYTE *)(v60 - 100)) & 0x66) - 77) ^ 0x85) << 24)) ^ 0xF6FE98D2;
  *(_DWORD *)(v60 - 136) = v199 ^ 0x9FD154C2;
  *(_DWORD *)(v60 - 132) = v198 ^ 0xB7D62750;
  *(_DWORD *)(v60 - 140) = v200 ^ 0xE20CABAA;
  v539 = v184 ^ v538 ^ v442 ^ v375 ^ v378;
  v536 = (v417 + 728048918) ^ v185;
  v533 = v527 ^ v494 ^ v532;
  v528 = v386 ^ v562 ^ v376 ^ v189;
  v521 = (v461 + 728048918) ^ v517 ^ v520;
  v518 = v190 ^ v370;
  v515 = v492 ^ v498 ^ v511 ^ v394 ^ v514;
  v512 = v502 ^ v508 ^ v438 ^ v392;
  v509 = (v381 + 728048918) ^ *(_DWORD *)(v60 - 240);
  v503 = v396 ^ v424;
  v499 = v411 ^ v458 ^ v488 ^ (v384 + 728048918);
  v495 = (v401 + 728048918) ^ v474;
  v493 = (181304767 * v171 + 20393181) ^ *(_DWORD *)(v60 - 256) ^ v455;
  v489 = v452 ^ v383 ^ v192;
  v486 = v485 ^ v576;
  v482 = v191 ^ v481;
  v478 = *(_DWORD *)(v60 - 216) ^ (v180 + 268032180 + ((2 * v180) & 0x166 ^ 0xF67F6FFF)) ^ v572 ^ v432;
  v475 = v465 ^ v409;
  v471 = *(_DWORD *)(v60 - 176) ^ (v525 + 1858992362);
  v469 = v468 ^ v567;
  v466 = v389 ^ *(_DWORD *)(v60 - 160);
  v462 = *(_DWORD *)(v60 - 248) ^ *(_DWORD *)(v60 - 152) ^ v570;
  v459 = v574 ^ v578 ^ v414;
  v456 = *(_DWORD *)(v60 - 224) ^ *(_DWORD *)(v60 - 208) ^ v399;
  v453 = v406 ^ *(_DWORD *)(v60 - 184);
  v450 = v564 ^ v449 ^ v428 ^ *(_DWORD *)(v60 - 232) ^ *(_DWORD *)(v60 - 192);
  v447 = v446 ^ v435;
  v443 = v421 ^ *(_DWORD *)(v60 - 168);
  v439 = *(_DWORD *)(v60 - 200) + 34669315;
  v436 = (v202 + v201) ^ v193;
  v203 = *(_DWORD *)(v60 - 124);
  v433 = v203 ^ 0x340;
  v429 = v203 ^ 0x3F4;
  v425 = v203 ^ 0x3FA;
  v422 = v203 ^ 0x358;
  v418 = v203 ^ 0x3B3;
  v415 = v203 ^ 0x31C;
  v412 = v203 ^ 0x386;
  v204 = v203;
  *(_QWORD *)(v60 - 168) = 13;
  v205 = *(unsigned __int8 **)(v60 - 120);
  LOBYTE(v203) = v195[v205[13] ^ 0xF3] + 50;
  v206 = (((v204 + 430) | 1) ^ 0xFFFFFA7F) & 0xF89B3A21 ^ 0xF89B3A21;
  *(_QWORD *)(v60 - 152) = v206;
  v207 = (v203 ^ 2) << 16;
  v208 = v205[v206] ^ 0x57;
  *(_QWORD *)(v60 - 160) = 10;
  v209 = v205[10] ^ 0xB6;
  v210 = ((v195[v208] + 50) ^ 0xF6) << 16;
  *(_QWORD *)(v60 - 184) = 4;
  v211 = (v545[v209] ^ 0x2D) << 8;
  v212 = v205[4];
  v213 = v194[v212 ^ 0x9A];
  *(_QWORD *)(v60 - 232) = 7;
  LODWORD(v212) = v213 ^ (v212 - ((2 * v212) & 0x66666666) - 77) ^ 0xFFFFFFCF;
  v214 = v205[7] ^ 0xD6;
  *(_QWORD *)(v60 - 216) = 2;
  LODWORD(v212) = v543[v214] ^ 0xC4 | ((_DWORD)v212 << 24);
  LODWORD(v214) = v545[v205[2]];
  *(_QWORD *)(v60 - 192) = 3;
  v215 = v210 | ((v214 ^ 0x3F) << 8);
  LODWORD(v214) = v543[v205[3] ^ 0x74];
  *(_QWORD *)(v60 - 176) = 12;
  v216 = v194[v205[12] ^ 0x6ELL] ^ (v205[12] - ((2 * v205[12]) & 0x66) - 77) ^ 0x51;
  *(_QWORD *)(v60 - 208) = 0;
  v217 = v215 | v214 ^ 6 | ((v194[*v205 ^ 0x15] ^ (*v205 - ((2 * *v205) & 0x66) - 77) ^ 0xAE) << 24);
  v218 = v211 | ((v194[v205[8] ^ 0x46] ^ (v205[8] - ((2 * v205[8]) & 0x66) - 77) ^ 0xFFFFFFE7) << 24);
  *(_QWORD *)(v60 - 200) = 14;
  v219 = v207 | (v216 << 24) | ((v545[v205[14] ^ 0xD5] ^ 0xB7) << 8);
  *(_QWORD *)(v60 - 248) = 11;
  *(_QWORD *)(v60 - 240) = 5;
  LODWORD(v212) = v212 & 0xFF00FFFF | (((v547[v205[5] ^ 0x9DLL] + 50) ^ 0xF7) << 16);
  v220 = v543[v205[11] ^ 0xC2] ^ 0x23 | v218;
  *(_QWORD *)(v60 - 256) = 9;
  v221 = v220 & 0xFF00FFFF | (((v547[v205[9] ^ 0x3ELL] + 50) ^ 0xDF) << 16);
  LODWORD(v209) = v545[v205[6] ^ 0xA4];
  *(_QWORD *)(v60 - 224) = 15;
  v222 = v543[v205[15] ^ 0x47] ^ 6 | v219;
  v568 = v212 | ((v209 ^ 0xE7) << 8);
  v223 = (char *)*(&off_24C363D30 + v429) - 4;
  v224 = *(_DWORD *)&v223[4 * (((unsigned __int16)(v568 ^ v552) >> 8) ^ 0x21)] ^ ((((unsigned __int16)(v568 ^ v552) >> 8) ^ 0x4C)
                                                                                                 + 1219450422
                                                                                                 - ((2 * (((v568 ^ v552) >> 8) ^ 0xB71C4C)) & 0x6C));
  v225 = (char *)*(&off_24C363D30 + v433) - 4;
  LODWORD(v209) = v217 ^ v553 ^ 0x730032AA;
  v226 = (v224 + 1629252098 - ((2 * v224) & 0xC238D404)) ^ *(_DWORD *)&v225[4 * ((v217 ^ v553) ^ 0xAA)];
  v227 = *(_DWORD *)&v223[4 * (((unsigned __int16)(v550 ^ v222) >> 8) ^ 0xEB)] ^ ((((unsigned __int16)(v550 ^ v222) >> 8) ^ 0x86)
                                                                                                 + 1219450422
                                                                                                 - ((2 * (((v550 ^ v222) >> 8) ^ 0x68F686)) & 0x6C));
  v228 = (char *)*(&off_24C363D30 + v425) - 8;
  v229 = *(_DWORD *)&v228[4 * (((v221 ^ v551) >> 16) ^ 0x68)];
  HIDWORD(v231) = v229 ^ 0x132;
  LODWORD(v231) = v229 ^ 0x57156000;
  v230 = v231 >> 12;
  v232 = *(_DWORD *)&v228[4 * ((v217 ^ v553) >> 16)];
  HIDWORD(v231) = v232 ^ 0x132;
  LODWORD(v231) = v232 ^ 0x57156000;
  v233 = v226 + 354496560 - ((2 * v226) & 0x2A426060);
  v234 = (char *)*(&off_24C363D30 + v204 - 955) - 4;
  v235 = *(_DWORD *)&v234[4 * (((v568 ^ v552) >> 24) ^ 0xB7)] ^ (v231 >> 12);
  v236 = *(_DWORD *)&v228[4 * (((v550 ^ v222) >> 16) ^ 0xF6)];
  HIDWORD(v231) = v236 ^ 0x132;
  LODWORD(v231) = v236 ^ 0x57156000;
  v237 = (v227 + 354496560 - ((2 * v227) & 0x2A426060)) ^ v235;
  v238 = (BYTE1(v221) ^ BYTE1(v551)) ^ *(_DWORD *)&v225[4 * ((v568 ^ v552) ^ 0xFB)] ^ *(_DWORD *)&v223[4 * ((BYTE1(v221) ^ BYTE1(v551)) ^ 0x23)] ^ (v231 >> 12);
  v239 = *(_DWORD *)&v228[4 * (((v568 ^ v552) >> 16) ^ 0x1C)];
  HIDWORD(v231) = v239 ^ 0x132;
  LODWORD(v231) = v239 ^ 0x57156000;
  LODWORD(v212) = *(_DWORD *)&v234[4 * (((v221 ^ v551) >> 24) ^ 0xF6)] ^ (BYTE1(v209)
                                                                        + 1219450422
                                                                        - ((v209 >> 7) & 0x6C)) ^ *(_DWORD *)&v223[4 * (BYTE1(v209) ^ 0x6D)] ^ ((v231 >> 12) + 354496560 - ((2 * (v231 >> 12)) & 0x2A426060));
  v240 = v237 + 1629252098 - ((2 * v237) & 0xC238D404);
  v241 = v186 ^ v371 ^ *(_DWORD *)&v234[4 * (((v550 ^ v222) >> 24) ^ 0x68)] ^ v230 ^ v233;
  v242 = v539 ^ *(_DWORD *)&v225[4 * ((v550 ^ v222) ^ 0x68)] ^ (v212
                                                                               + 1629252098
                                                                               - ((2 * v212) & 0xC238D404));
  v243 = v536 ^ *(_DWORD *)&v225[4 * ((v221 ^ v551) ^ 0x5F)] ^ v240;
  LODWORD(v209) = v436 ^ *(_DWORD *)&v234[4 * BYTE3(v209)] ^ ((v238 ^ 0x29B33C7A)
                                                            + 354496561
                                                            + ((2 * ((v238 ^ 0x29B33C7A) & 0x1521303B ^ v238 & 0xB)) ^ 0xFFFFFFEB));
  LODWORD(v214) = v241 ^ 0xF9388C2F;
  LODWORD(v212) = *(_DWORD *)&v228[4 * ((v241 ^ 0xF9388C2F) >> 16)];
  HIDWORD(v231) = v212 ^ 0x132;
  LODWORD(v231) = v212 ^ 0x57156000;
  LODWORD(v212) = v231 >> 12;
  v244 = *(_DWORD *)&v228[4 * (BYTE2(v242) ^ 0xD0)];
  HIDWORD(v231) = v244 ^ 0x132;
  LODWORD(v231) = v244 ^ 0x57156000;
  v245 = v231 >> 12;
  v246 = *(_DWORD *)&v228[4 * (BYTE2(v243) ^ 0x66)];
  HIDWORD(v231) = v246 ^ 0x132;
  LODWORD(v231) = v246 ^ 0x57156000;
  v247 = (v231 >> 12) ^ *(_DWORD *)&v223[4 * (BYTE1(v209) ^ 5)] ^ ((BYTE1(v209) ^ 0x68)
                                                                 + 1219450422
                                                                 - ((2 * ((v209 >> 8) ^ 0x42BD68)) & 0x6C));
  LODWORD(v212) = (v212 + 1629252098 - ((2 * v212) & 0xC238D404)) ^ *(_DWORD *)&v225[4
                                                                                   * ((v536 ^ v225[4 * ((v221 ^ v551) ^ 0x5F)] ^ v240) ^ 0xB6)];
  v248 = (v247 + 1629252098 - ((2 * v247) & 0xC238D404)) ^ *(_DWORD *)&v225[4 * (v241 ^ 0x61)];
  v249 = (((unsigned __int16)(v241 ^ 0x8C2F) >> 8)
        + 1219450422
        + (~((v241 ^ 0xF9388C2F) >> 7) | 0xFFFFFF93)
        + 1) ^ 0xD678EAEF ^ *(_DWORD *)&v223[4 * (((unsigned __int16)(v241 ^ 0x8C2F) >> 8) ^ 0x6D)];
  v250 = *(_DWORD *)&v234[4 * (HIBYTE(v243) ^ 0x43)] ^ 0xB73B6B8E;
  v251 = v249 + v250 - 2 * (v249 & v250);
  v252 = *(_DWORD *)&v228[4 * (BYTE2(v209) ^ 0xBD)];
  HIDWORD(v231) = v252 ^ 0x132;
  LODWORD(v231) = v252 ^ 0x57156000;
  LODWORD(v214) = *(_DWORD *)&v234[4 * BYTE3(v214)] ^ (v245 + 354496560 - ((2 * v245) & 0x2A426060));
  LODWORD(v214) = (v214 + 1629252098 - ((2 * v214) & 0xC238D404)) ^ *(_DWORD *)&v225[4 * (v209 ^ 0xAB)];
  v253 = *(_DWORD *)&v234[4 * (BYTE3(v209) ^ 0x42)] ^ v560 ^ *(_DWORD *)&v223[4 * (BYTE1(v242) ^ 0x2B)] ^ ((BYTE1(v242) ^ 0x46) + 1219450422 - 2 * ((BYTE1(v242) ^ 0x46) & 0x3F ^ (v242 >> 8) & 9)) ^ (v212 + 354496560 - ((2 * v212) & 0x2A426060));
  LODWORD(v214) = v533 ^ *(_DWORD *)&v223[4 * (BYTE1(v243) ^ 0x39)] ^ (v214 + 1219450422 - ((2 * v214) & 0x915EAC6C));
  v254 = v528 ^ *(_DWORD *)&v225[4 * (v242 ^ 0x94)] ^ ((v251 ^ (v231 >> 12))
                                                                      + 1629252098
                                                                      - ((2 * (v251 ^ (v231 >> 12))) & 0xC238D404));
  LODWORD(v212) = *(_DWORD *)&v228[4 * (BYTE2(v254) ^ 0x79)];
  HIDWORD(v231) = v212 ^ 0x132;
  LODWORD(v231) = v212 ^ 0x57156000;
  v255 = v523 ^ v374 ^ *(_DWORD *)&v234[4 * (HIBYTE(v242) ^ 0x90)] ^ (v248 + 354496560 - ((2 * v248) & 0x2A426060));
  v256 = ((v231 >> 12) + 354496560 - ((2 * (v231 >> 12)) & 0x2A426060)) ^ *(_DWORD *)&v234[4
                                                                                         * ((v255 ^ 0x2261685Eu) >> 24)];
  LODWORD(v212) = ((BYTE1(v254) ^ 0xD0) + 1219450422 - 2 * ((BYTE1(v254) ^ 0xD0) & 0x3F ^ (v254 >> 8) & 9)) ^ *(_DWORD *)&v223[4 * (BYTE1(v254) ^ 0xBD)];
  LODWORD(v212) = (v212 + 1629252098 - ((2 * v212) & 0xC238D404)) ^ *(_DWORD *)&v225[4 * (v253 ^ 0x76)];
  v257 = ((BYTE1(v214) ^ 0xEC) + 1219450422 - ((2 * ((v214 >> 8) ^ 0xE5FEC)) & 0x6C)) ^ *(_DWORD *)&v223[4 * (BYTE1(v214) ^ 0x81)];
  v258 = *(_DWORD *)&v228[4 * (BYTE2(v214) ^ 0x5F)];
  HIDWORD(v231) = v258 ^ 0x132;
  LODWORD(v231) = v258 ^ 0x57156000;
  v259 = v231 >> 12;
  HIDWORD(v231) = *(_DWORD *)&v225[4 * (v255 ^ 0x5E)] ^ 0x880B4D8A;
  LODWORD(v231) = HIDWORD(v231);
  v260 = (v231 >> 28) ^ __ROR4__(*(_DWORD *)&v234[4 * (HIBYTE(v254) ^ 6)] ^ 0x7462B151 ^ (v257+ 354496560- ((2 * v257) & 0x2A426060)), 28);
  v261 = (v259 + 354496560 - ((2 * v259) & 0x2A426060)) ^ *(_DWORD *)&v234[4 * (HIBYTE(v253) ^ 0xD2)];
  v262 = (v261 + 1629252098 - ((2 * v261) & 0xC238D404)) ^ *(_DWORD *)&v225[4 * (v254 ^ 0x4C)];
  v263 = *(_DWORD *)&v228[4 * (BYTE2(v255) ^ 0x1B)];
  HIDWORD(v231) = v263 ^ 0x132;
  LODWORD(v231) = v263 ^ 0x57156000;
  v264 = v231 >> 12;
  v265 = BYTE1(v253);
  v266 = (BYTE1(v253) ^ 0xC0) + 1219450422 - ((v253 >> 7) & 0x6C);
  v267 = *(_DWORD *)&v228[4 * (BYTE2(v253) ^ 0xCC)];
  HIDWORD(v231) = v267 ^ 0x132;
  LODWORD(v231) = v267 ^ 0x57156000;
  v268 = v368 ^ v372 ^ (v231 >> 12) ^ __ROR4__(v260 ^ 0x78071371, 4);
  v269 = v369 ^ v380 ^ v403 ^ *(_DWORD *)&v234[4 * (BYTE3(v214) ^ 0xE)] ^ v264 ^ (v212
                                                                                + 354496560
                                                                                - ((2 * v212) & 0x2A426060));
  LODWORD(v212) = BYTE1(v255) ^ 0x68;
  v270 = v521 ^ *(_DWORD *)&v223[4 * (BYTE1(v255) ^ 5)] ^ (v262 + 1219450422 - ((2 * v262) & 0x915EAC6C));
  LODWORD(v209) = v518 ^ v266 ^ *(_DWORD *)&v225[4 * ((v214 ^ BYTE1(v243) ^ 0x54) ^ 0xCA)] ^ *(_DWORD *)&v223[4 * (v265 ^ 0xAD)] ^ (v256 + 1629252098 - ((2 * v256) & 0xC238D404));
  v271 = v212 ^ 0x4552953C ^ v270;
  LODWORD(v212) = *(_DWORD *)&v228[4 * BYTE2(v271)];
  HIDWORD(v231) = v212 ^ 0x132;
  LODWORD(v231) = v212 ^ 0x57156000;
  v272 = v231 >> 12;
  BYTE1(v214) = BYTE1(v268) ^ 0xE7;
  LODWORD(v212) = *(_DWORD *)&v228[4 * ((v268 ^ 0x99FEE750) >> 16)];
  HIDWORD(v231) = v212 ^ 0x132;
  LODWORD(v231) = v212 ^ 0x57156000;
  LODWORD(v212) = (v231 >> 12) + 1629252098 - ((2 * (v231 >> 12)) & 0xC238D404);
  v273 = BYTE1(v269) ^ 0x29;
  v274 = v273 + 1219450422 - ((2 * ((v269 >> 8) ^ 0xA73B29)) & 0x6C);
  v275 = *(_DWORD *)&v228[4 * (BYTE2(v209) ^ 2)];
  HIDWORD(v231) = v275 ^ 0x132;
  LODWORD(v231) = v275 ^ 0x57156000;
  LODWORD(v212) = (BYTE1(v271) + 1219450422 - ((v271 >> 7) & 0x6C)) ^ *(_DWORD *)&v225[4
                                                                                     * (v269 ^ 0x72)] ^ *(_DWORD *)&v223[4 * (BYTE1(v271) ^ 0x6D)] ^ v212;
  v276 = *(_DWORD *)&v234[4 * (HIBYTE(v269) ^ 0xA7)] ^ (v231 >> 12);
  v277 = *(_DWORD *)&v228[4 * (BYTE2(v269) ^ 0x3B)];
  v278 = v276 ^ *(_DWORD *)&v225[4 * v271];
  HIDWORD(v231) = v277 ^ 0x132;
  LODWORD(v231) = v277 ^ 0x57156000;
  v279 = v515 ^ ((BYTE1(v209) ^ 0xD9) + 1219450422 - ((2 * ((v209 >> 8) ^ 0x9802D9)) & 0x6C)) ^ *(_DWORD *)&v225[4 * (v268 ^ 0x1E)] ^ *(_DWORD *)&v223[4 * (BYTE1(v209) ^ 0xB4)] ^ (v231 >> 12) ^ *(_DWORD *)&v234[4 * (HIBYTE(v270) ^ 0x61)];
  v280 = v512 ^ *(_DWORD *)&v234[4 * (BYTE3(v209) ^ 0x98)] ^ (v212 + 354496560 - ((2 * v212) & 0x2A426060));
  v281 = v509 ^ *(_DWORD *)&v225[4 * (v209 ^ 0x3D)] ^ v274 ^ *(_DWORD *)&v234[4
                                                                                             * ((v268 ^ 0x99FEE750) >> 24)] ^ *(_DWORD *)&v223[4 * (v273 ^ 0x6D)] ^ v272;
  LODWORD(v209) = (v530 + 728048918) ^ v506 ^ *(_DWORD *)&v223[4 * (BYTE1(v214) ^ 0x6D)] ^ ((v278 ^ 0x743D5A32)
                                                                                          + 1219450422
                                                                                          - 2
                                                                                          * ((v278 ^ 0x743D5A32) & 0x48AF563E ^ v278 & 8));
  LODWORD(v212) = *(_DWORD *)&v228[4 * (BYTE2(v279) ^ 0x73)];
  HIDWORD(v231) = v212 ^ 0x132;
  LODWORD(v231) = v212 ^ 0x57156000;
  LODWORD(v212) = v231 >> 12;
  v282 = *(_DWORD *)&v228[4 * (BYTE2(v281) ^ 0xD5)];
  HIDWORD(v231) = v282 ^ 0x132;
  LODWORD(v231) = v282 ^ 0x57156000;
  v283 = BYTE1(v281) ^ 0xA5;
  v284 = v283 + 1219450422 - ((2 * ((v281 >> 8) ^ 0xA1D5A5)) & 0x6C);
  v285 = v279 ^ 0xA7091F6E;
  v286 = *(_DWORD *)&v225[4 * ((v209 ^ BYTE1(v214)) ^ 0x41)] ^ (((unsigned __int16)(v279 ^ 0x1F6E) >> 8)
                                                                               + 1219450422
                                                                               - (((v279 ^ 0xA7091F6E) >> 7) & 0x6C)) ^ *(_DWORD *)&v223[4 * (((unsigned __int16)(v279 ^ 0x1F6E) >> 8) ^ 0x6D)] ^ ((v231 >> 12) + 1629252098 - ((2 * (v231 >> 12)) & 0xC238D404));
  v287 = *(_DWORD *)&v228[4 * (BYTE2(v209) ^ 0x81)];
  HIDWORD(v231) = v287 ^ 0x132;
  LODWORD(v231) = v287 ^ 0x57156000;
  v288 = ((v231 >> 12) + 354496560 - ((2 * (v231 >> 12)) & 0x2A426060)) ^ *(_DWORD *)&v234[4 * HIBYTE(v285)];
  v289 = (v288 + 1629252098 - ((2 * v288) & 0xC238D404)) ^ *(_DWORD *)&v225[4 * (v281 ^ 0x37)];
  LODWORD(v212) = *(_DWORD *)&v225[4 * (v280 ^ 0xFC)] ^ (v212 + 1629252098 - ((2 * v212) & 0xC238D404)) ^ *(_DWORD *)&v223[4 * (BYTE1(v209) ^ 0xCD)] ^ ((BYTE1(v209) ^ 0xA0) + 1219450422 - 2 * ((BYTE1(v209) ^ 0xA0) & 0x3E ^ (v209 >> 8) & 8));
  v290 = *(_DWORD *)&v228[4 * (BYTE2(v280) ^ 0xC6)];
  LODWORD(v231) = __ROR4__((v290 >> 12) ^ 0x268AC74, 17) ^ 0xEE910136;
  HIDWORD(v231) = v231;
  LODWORD(v214) = v503 ^ *(_DWORD *)&v223[4 * (BYTE1(v280) ^ 0x75)] ^ (v289 + 1219450422 - ((2 * v289) & 0x915EAC6C));
  v291 = v499 ^ *(_DWORD *)&v234[4 * (HIBYTE(v281) ^ 0xA1)] ^ (v212 + 354496560 - ((2 * v212) & 0x2A426060));
  v292 = v495 ^ *(_DWORD *)&v234[4 * (HIBYTE(v280) ^ 0x5A)] ^ (v286 + 354496560 - ((2 * v286) & 0x2A426060));
  LODWORD(v209) = v493 ^ v284 ^ *(_DWORD *)&v225[4 * v285] ^ *(_DWORD *)&v223[4 * (v283 ^ 0x6D)] ^ *(_DWORD *)&v234[4 * (BYTE3(v209) ^ 0x68)] ^ ((v231 >> 15) + (v290 << 20));
  LODWORD(v212) = ((BYTE1(v214) ^ 0x9D) + 1219450422 - ((2 * ((v214 >> 8) ^ 0xC2489D)) & 0x6C)) ^ *(_DWORD *)&v223[4 * (BYTE1(v214) ^ 0xF0)];
  v293 = *(_DWORD *)&v228[4 * (BYTE2(v291) ^ 0x8F)];
  LODWORD(v212) = *(_DWORD *)&v225[4 * (v209 ^ 0xB8)] ^ (v293 << 20) ^ (v293 >> 12) ^ (v212 + 1629252098 - ((2 * v212) & 0xC238D404));
  v294 = v292 ^ 0xCFB8D782;
  v295 = *(_DWORD *)&v228[4 * ((v292 ^ 0xCFB8D782) >> 16)];
  HIDWORD(v231) = v295 ^ 0x132;
  LODWORD(v231) = v295 ^ 0x57156000;
  v296 = ((v231 >> 12) + 1629252098 - ((2 * (v231 >> 12)) & 0xC238D404)) ^ *(_DWORD *)&v225[4
                                                                                          * ((v214 ^ BYTE1(v280)) ^ 0x3F)];
  v297 = (v212 ^ 0x13257156) + 354496560 - 2 * ((v212 ^ 0x13257156) & 0x15213039 ^ v212 & 9);
  LODWORD(v212) = v296 + 354496560 - ((2 * v296) & 0x2A426060);
  v298 = *(_DWORD *)&v228[4 * (BYTE2(v214) ^ 0x48)];
  HIDWORD(v231) = v298 ^ 0x132;
  LODWORD(v231) = v298 ^ 0x57156000;
  v299 = ((BYTE1(v209) ^ 0x3A) + 1219450422 - ((2 * ((v209 >> 8) ^ 0x41963A)) & 0x6C)) ^ *(_DWORD *)&v225[4 * (v292 ^ 0xCC)] ^ *(_DWORD *)&v223[4 * (BYTE1(v209) ^ 0x57)] ^ ((v231 >> 12) + 1629252098 - ((2 * (v231 >> 12)) & 0xC238D404));
  v300 = *(_DWORD *)&v228[4 * (BYTE2(v209) ^ 0x96)];
  HIDWORD(v231) = v300 ^ 0x132;
  LODWORD(v231) = v300 ^ 0x57156000;
  v301 = v489 ^ (BYTE1(v294) + 1219450422 - ((v294 >> 7) & 0x6C)) ^ *(_DWORD *)&v225[4 * (v291 ^ 0x50)] ^ *(_DWORD *)&v223[4 * (BYTE1(v294) ^ 0x6D)] ^ (v231 >> 12) ^ *(_DWORD *)&v234[4 * (BYTE3(v214) ^ 0xC2)];
  LODWORD(v214) = v486 ^ *(_DWORD *)&v234[4 * (HIBYTE(v291) ^ 0xC7)] ^ (v299 + 354496560 - ((2 * v299) & 0x2A426060));
  v302 = v482 ^ *(_DWORD *)&v234[4 * HIBYTE(v294)] ^ v297;
  LODWORD(v209) = v478 ^ ((BYTE1(v291) ^ 0xD9) + 1219450422 - ((2 * ((v291 >> 8) ^ 0xC78FD9)) & 0x6C)) ^ *(_DWORD *)&v234[4 * (BYTE3(v209) ^ 0x41)] ^ *(_DWORD *)&v223[4 * (BYTE1(v291) ^ 0xB4)] ^ v212;
  v303 = *(_DWORD *)&v228[4 * (BYTE2(v214) ^ 0xE6)];
  HIDWORD(v231) = v303 ^ 0x132;
  LODWORD(v231) = v303 ^ 0x57156000;
  v304 = v231 >> 12;
  v305 = (((unsigned __int16)(v209 ^ 0xCCA2) >> 8)
        + 1219450422
        - (((v209 ^ 0x33C8CCA2) >> 7) & 0x6C)) ^ *(_DWORD *)&v223[4
                                                                              * (((unsigned __int16)(v209 ^ 0xCCA2) >> 8) ^ 0x6D)];
  v306 = *(_DWORD *)&v228[4 * (BYTE2(v302) ^ 0x1C)];
  HIDWORD(v231) = v306 ^ 0x132;
  LODWORD(v231) = v306 ^ 0x57156000;
  LODWORD(v212) = (v231 >> 12) ^ *(_DWORD *)&v223[4 * (BYTE1(v214) ^ 0xD9)] ^ ((BYTE1(v214) ^ 0xB4)
                                                                             + 1219450422
                                                                             - ((2
                                                                               * ((v214 >> 8) ^ 0x4FE6B4)) & 0x6C));
  LODWORD(v212) = (v212 + 1629252098 - ((2 * v212) & 0xC238D404)) ^ *(_DWORD *)&v225[4 * (v301 ^ 0xD8)];
  v307 = (v305 + 1629252098 - ((2 * v305) & 0xC238D404)) ^ *(_DWORD *)&v225[4
                                                                          * ((v482 ^ v234[4 * HIBYTE(v294)] ^ v297) ^ 0x3A)];
  v308 = *(_DWORD *)&v225[4 * (v209 ^ 0xA2)] ^ (((unsigned __int16)(v301 ^ 0x4ED8) >> 8)
                                                               + 1219450422
                                                               - (((v301 ^ 0x6D0E4ED8) >> 7) & 0x6C)) ^ *(_DWORD *)&v223[4 * (((unsigned __int16)(v301 ^ 0x4ED8) >> 8) ^ 0x6D)] ^ (v304 + 1629252098 - ((2 * v304) & 0xC238D404));
  v309 = *(_DWORD *)&v225[4
                        * ((v486 ^ v234[4 * (HIBYTE(v291) ^ 0xC7)] ^ (v299 + 48 - ((2 * v299) & 0x60))) ^ 0x96)];
  HIDWORD(v231) = v309 ^ 0x11C6A02;
  LODWORD(v231) = v309 ^ 0x60000000;
  HIDWORD(v231) = (v231 >> 29) ^ 0x6615DA09;
  LODWORD(v231) = HIDWORD(v231);
  v310 = (v231 >> 3) + 1219450422 - ((2 * (v231 >> 3)) & 0x915EAC6C);
  v311 = v307 + 354496560 - ((2 * v307) & 0x2A426060);
  v312 = *(_DWORD *)&v228[4 * ((v301 ^ 0x6D0E4ED8) >> 16)];
  HIDWORD(v231) = v312 ^ 0x132;
  LODWORD(v231) = v312 ^ 0x57156000;
  v313 = v231 >> 12;
  v314 = v308 + 354496560 - ((2 * v308) & 0x2A426060);
  v315 = *(_DWORD *)&v228[4 * ((v209 ^ 0x33C8CCA2) >> 16)];
  HIDWORD(v231) = v315 ^ 0x132;
  LODWORD(v231) = v315 ^ 0x57156000;
  v316 = v475 ^ *(_DWORD *)&v234[4 * (BYTE3(v209) ^ 0x17)] ^ (v212 + 354496560 - ((2 * v212) & 0x2A426060));
  LODWORD(v212) = v310 ^ *(_DWORD *)&v223[4 * (BYTE1(v302) ^ 0xD1)] ^ (v231 >> 12);
  LODWORD(v209) = *(_DWORD *)&v234[4 * (HIBYTE(v301) ^ 0x49)] ^ v559 ^ (v212 + 354496560 - ((2 * v212) & 0x2A426060));
  LODWORD(v212) = v471 ^ *(_DWORD *)&v234[4 * (BYTE3(v214) ^ 0x4F)] ^ v313;
  LODWORD(v214) = v469 ^ *(_DWORD *)&v234[4 * (HIBYTE(v302) ^ 0x1B)] ^ v314;
  v317 = *(_DWORD *)&v228[4 * (BYTE2(v214) ^ 0x7E)];
  HIDWORD(v231) = v317 ^ 0x132;
  LODWORD(v231) = v317 ^ 0x57156000;
  v318 = v231 >> 12;
  v319 = v212 ^ v311;
  LODWORD(v212) = *(_DWORD *)&v228[4 * (BYTE2(v319) ^ 1)];
  HIDWORD(v231) = v212 ^ 0x132;
  LODWORD(v231) = v212 ^ 0x57156000;
  LODWORD(v212) = ((v231 >> 12) + 1629252098 - ((2 * (v231 >> 12)) & 0xC238D404)) ^ *(_DWORD *)&v225[4 * (v316 ^ 0xC6)];
  v320 = ((BYTE1(v316) ^ 0x71) + 1219450422 - 2 * ((BYTE1(v316) ^ 0x71) & 0x3E ^ (v316 >> 8) & 8)) ^ *(_DWORD *)&v223[4 * (BYTE1(v316) ^ 0x1C)];
  v321 = (v320 + 354496561 + ~((2 * v320) & 0x2A426060)) ^ *(_DWORD *)&v234[4 * (HIBYTE(v319) ^ 0x1F)];
  v322 = *(_DWORD *)&v228[4 * (BYTE2(v316) ^ 0x5B)];
  HIDWORD(v231) = v322 ^ 0x132;
  LODWORD(v231) = v322 ^ 0x57156000;
  v323 = v231 >> 12;
  v324 = BYTE1(v302) ^ 0x73F4E0AF ^ v209;
  v325 = *(_DWORD *)&v228[4 * BYTE2(v324)];
  HIDWORD(v231) = v325 ^ 0x132;
  LODWORD(v231) = v325 ^ 0x57156000;
  v326 = v231 >> 12;
  HIDWORD(v231) = v318 ^ ((BYTE1(v319) ^ 0x81) + 1219450422 - ((v319 >> 7) & 0x6C)) ^ 0xD678EAEF ^ *(_DWORD *)&v223[4 * (BYTE1(v319) ^ 0xEC)];
  LODWORD(v231) = HIDWORD(v231);
  LODWORD(v231) = (v231 >> 11) ^ __ROR4__(*(_DWORD *)&v234[4 * (HIBYTE(v316) ^ 0xF2)] ^ 0xB73B6B8E, 11) ^ 0xD490839A;
  HIDWORD(v231) = v231;
  LODWORD(v209) = v466 ^ *(_DWORD *)&v225[4 * (v319 ^ 0xB8)] ^ ((BYTE1(v214) ^ 0xAA)
                                                                               + 1219450422
                                                                               - ((2
                                                                                 * ((v214 >> 8) ^ 0x967EAA)) & 0x6C)) ^ *(_DWORD *)&v234[4 * (BYTE3(v209) ^ 0x57)] ^ *(_DWORD *)&v223[4 * (BYTE1(v214) ^ 0xC7)] ^ v323;
  v327 = v462 ^ *(_DWORD *)&v234[4 * (BYTE3(v214) ^ 0x96)] ^ (BYTE1(v324) + 1219450422 - ((v324 >> 7) & 0x6C)) ^ *(_DWORD *)&v223[4 * (BYTE1(v324) ^ 0x6D)] ^ (v212 + 354496560 - ((2 * v212) & 0x2A426060));
  LODWORD(v212) = v459 ^ *(_DWORD *)&v225[4 * (v214 ^ 0x88)] ^ v326 ^ (v321
                                                                                      + 1629252098
                                                                                      - ((2 * v321) & 0xC238D404));
  LODWORD(v214) = v456 ^ *(_DWORD *)&v225[4 * v324] ^ ((v231 >> 21)
                                                                      + 1629252098
                                                                      - ((2 * (v231 >> 21)) & 0xC238D404));
  BYTE2(v326) = BYTE2(v212) ^ 0x4A;
  v328 = *(_DWORD *)&v228[4 * (BYTE2(v209) ^ 0xD6)];
  HIDWORD(v231) = v328 ^ 0x132;
  LODWORD(v231) = v328 ^ 0x57156000;
  v329 = v231 >> 12;
  v330 = *(_DWORD *)&v223[4 * (BYTE1(v327) ^ 0x96)] ^ ((BYTE1(v327) ^ 0xFB)
                                                     + 1219450422
                                                     - ((2 * ((v327 >> 8) ^ 0x3EA2FB)) & 0x6C));
  v331 = (v330 + 1629252098 - ((2 * v330) & 0xC238D404)) ^ *(_DWORD *)&v225[4 * (v212 ^ 0x75)];
  v332 = *(_DWORD *)&v228[4 * (BYTE2(v327) ^ 0xA2)];
  HIDWORD(v231) = v332 ^ 0x132;
  LODWORD(v231) = v332 ^ 0x57156000;
  v333 = (((unsigned __int16)(v212 ^ 0xF075) >> 8)
        + 1219450422
        - (((v212 ^ 0xB54AF075) >> 7) & 0x6C)) ^ (v231 >> 12) ^ *(_DWORD *)&v223[4
                                                                                             * (((unsigned __int16)(v212 ^ 0xF075) >> 8) ^ 0x6D)];
  LODWORD(v212) = *(_DWORD *)&v234[4 * (BYTE3(v212) ^ 0x91)];
  v334 = *(_DWORD *)&v234[4 * (HIBYTE(v327) ^ 0x3E)];
  v335 = (v333 + 354496560 - ((2 * v333) & 0x2A426060)) ^ *(_DWORD *)&v234[4 * (BYTE3(v214) ^ 0xED)];
  LODWORD(v234) = *(_DWORD *)&v234[4 * (BYTE3(v209) ^ 0xB3)];
  LODWORD(v214) = v214 ^ 0xC9AF1D8F;
  v336 = *(_DWORD *)&v225[4 * v214];
  v337 = *(_DWORD *)&v225[4 * (v327 ^ 0x9A)];
  v338 = BYTE1(v214);
  v339 = BYTE1(v214) + 1219450422 - ((v214 >> 7) & 0x6C);
  LODWORD(v225) = *(_DWORD *)&v225[4 * (v209 ^ 0x5D)];
  LODWORD(v214) = *(_DWORD *)&v228[4 * BYTE2(v214)];
  v340 = *(_DWORD *)&v228[4 * BYTE2(v326)];
  HIDWORD(v231) = v340 ^ 0x132;
  LODWORD(v231) = v340 ^ 0x57156000;
  v341 = *(_DWORD *)&v223[4 * (v338 ^ 0x6D)];
  LODWORD(v223) = *(_DWORD *)&v223[4 * (BYTE1(v209) ^ 0xF7)];
  LODWORD(v228) = (BYTE1(v209) ^ 0x9A)
                + 1219450422
                - 2 * (((v209 >> 8) ^ 0xB3D69A) & 0x37 ^ (v209 >> 8) & 1);
  LODWORD(v209) = v453 ^ v337 ^ v329 ^ v339 ^ v212 ^ v341;
  LODWORD(v223) = v450 ^ v228 ^ v334 ^ v223 ^ v336 ^ (v231 >> 12);
  LODWORD(v228) = v447 ^ v225 ^ (v335 + 1629252098 - ((2 * v335) & 0xC238D404));
  v342 = v443 ^ v234 ^ (v214 >> 12) ^ ((_DWORD)v214 << 20) ^ (v331
                                                                                        + 354496560
                                                                                        - ((2 * v331) & 0x2A426060));
  v343 = *(unsigned int *)(v60 - 124);
  v344 = (char *)*(&off_24C363D30 + (int)v343 - 817) - 4;
  v345 = (uint64_t)*(&off_24C363D30 + v422);
  LODWORD(v234) = *(_DWORD *)(v345 + 4 * (v228 ^ 7u)) ^ *(_DWORD *)&v344[4
                                                                                          * (((unsigned __int16)(v443 ^ (unsigned __int16)v234 ^ (v214 >> 12) ^ (v331 + 12336 - ((2 * v331) & 0x6060))) >> 8) ^ 0x52)] ^ 0x3D912CBF;
  v346 = (_DWORD)v234 + 667668299 - ((2 * (_DWORD)v234) & 0x4F979E96);
  LODWORD(v234) = *(_DWORD *)&v344[4 * (BYTE1(v209) ^ 0x2B)];
  v347 = *(_DWORD *)&v344[4 * ((unsigned __int16)((unsigned __int16)v228 ^ 0x6F07) >> 8)];
  LODWORD(v214) = *(_DWORD *)&v344[4 * (BYTE1(v223) ^ 0xC2)];
  v348 = (char *)*(&off_24C363D30 + v418) - 4;
  LODWORD(v225) = *(_DWORD *)&v348[4 * ((v228 >> 24) ^ 0xEF)];
  v349 = *(_DWORD *)&v348[4 * (HIBYTE(v342) ^ 0x8E)];
  v350 = *(_DWORD *)&v348[4 * ((v223 >> 24) ^ 0xCF)] ^ v346;
  LODWORD(v348) = *(_DWORD *)&v348[4 * (BYTE3(v209) ^ 0x45)];
  v351 = (char *)*(&off_24C363D30 + (int)v343 - 778) - 4;
  v352 = *(_DWORD *)&v351[4 * (BYTE2(v342) ^ 0x99)];
  v353 = *(_DWORD *)&v351[4 * (BYTE2(v228) ^ 0x2A)];
  LODWORD(v228) = *(_DWORD *)&v351[4 * (BYTE2(v223) ^ 0x1F)];
  v354 = *(_DWORD *)&v351[4 * (BYTE2(v209) ^ 0xB6)] ^ (v350 + 703201665 - ((2 * v350) & 0x53D40302));
  v355 = *(_DWORD *)(v345 + 4 * (v209 ^ 0xEEu));
  LODWORD(v223) = *(_DWORD *)(v345 + 4 * (v223 ^ 0xE9u));
  LODWORD(v345) = *(_DWORD *)(v345 + 4 * (v342 ^ 0x8Du));
  v356 = *(_DWORD *)(v60 - 140) ^ v554 ^ (v354 + 1619929385 + (~(2 * v354) | 0x3EE3ADAF));
  v357 = (uint64_t)*(&off_24C363D30 + v415);
  v205[8] = *(_BYTE *)(v357 + (HIBYTE(v356) ^ 0xD7)) ^ 0x81;
  LODWORD(v348) = ((v352 ^ 0xB14ADE35 ^ v347) + 667668299 - ((2 * (v352 ^ 0xB14ADE35 ^ v347)) & 0x4F979E96)) ^ v348;
  LODWORD(v348) = ((_DWORD)v348 - 1523453173 - ((2 * (_DWORD)v348) & 0x4A63E616)) ^ v223;
  LODWORD(v348) = *(_DWORD *)(v60 - 136) ^ v555 ^ ((_DWORD)v348 - ((2 * (_DWORD)v348) & 0x3AA7AC80) + 492033600);
  v358 = (char *)*(&off_24C363D30 + v412) - 8;
  v205[*(_QWORD *)(v60 - 232)] = (v358[v348 ^ 0xC7] - 114) ^ 0x5F;
  v359 = (char *)*(&off_24C363D30 + (int)v343 - 964) - 8;
  v360 = v359[BYTE1(v348) ^ 0x13];
  HIDWORD(v231) = v360 ^ 0x1C;
  LODWORD(v231) = v360 << 24;
  v205[6] = (v231 >> 30) ^ 0x40;
  v361 = ((v353 ^ v355 ^ 0x8CDBF28A) + 667668299 - 2 * ((v353 ^ v355 ^ 0x8CDBF28A) & 0x27CBCF5B ^ (v353 ^ v355) & 0x10)) ^ v349;
  v362 = (v361 - ((2 * v361) & 0x3141BF68) - 1734287436) ^ v214;
  v363 = *(_DWORD *)(v60 - 132) ^ v557 ^ (v362 - ((2 * v362) & 0x6AA94BA4) + 894739922);
  v364 = v359[(unsigned __int16)(*(_WORD *)(v60 - 132) ^ v557 ^ (v362 - ((2 * v362) & 0x4BA4) - 23086)) >> 8];
  HIDWORD(v231) = v364 ^ 0x1C;
  LODWORD(v231) = v364 << 24;
  v205[*(_QWORD *)(v60 - 216)] = (v231 >> 30) ^ 0x7E;
  v365 = (uint64_t)*(&off_24C363D30 + (int)v343 - 808);
  v205[*(_QWORD *)(v60 - 256)] = *(_BYTE *)(v365 + (BYTE2(v356) ^ 0xFBLL)) ^ 0x34;
  LODWORD(v234) = ((v234 ^ 0xBF6B10FF ^ v225)
                 + 703201665
                 - ((2 * (v234 ^ 0xBF6B10FF ^ v225)) & 0x53D40302)) ^ v228;
  LODWORD(v234) = v345 ^ ((_DWORD)v234 - 1523453173 - ((2 * (_DWORD)v234) & 0x4A63E616));
  LODWORD(v234) = *(_DWORD *)(v60 - 128) ^ v556 ^ ((_DWORD)v234 - ((2 * (_DWORD)v234) & 0xE8F835E6) + 1954290419);
  v205[*(_QWORD *)(v60 - 168)] = *(_BYTE *)(v365 + (BYTE2(v234) ^ 0xB8)) ^ 0xE7;
  v205[*(_QWORD *)(v60 - 248)] = (v358[v356 ^ 0x1BLL] - 114) ^ 0x7D;
  v205[*(_QWORD *)(v60 - 240)] = *(_BYTE *)(v365 + (BYTE2(v348) ^ 3)) ^ 0x99;
  v205[*(_QWORD *)(v60 - 184)] = *(_BYTE *)(v357 + ((v348 >> 24) ^ 0x6DLL)) ^ 0x79;
  LODWORD(v348) = v359[BYTE1(v356) ^ 0x92];
  HIDWORD(v231) = v348 ^ 0x1C;
  LODWORD(v231) = (_DWORD)v348 << 24;
  v205[*(_QWORD *)(v60 - 160)] = (v231 >> 30) ^ 0xD2;
  v366 = *(_QWORD *)(v60 - 208);
  v205[v366] = *(_BYTE *)(v357 + (HIBYTE(v363) ^ 0x53)) ^ 0x95;
  v205[*(_QWORD *)(v60 - 192)] = (v358[v363 ^ 0x95] - 114) ^ 0xAF;
  v205[*(_QWORD *)(v60 - 224)] = (v358[v234 ^ 0x64] - 114) ^ 0x27;
  v205[*(_QWORD *)(v60 - 176)] = *(_BYTE *)(v357 + ((v234 >> 24) ^ 0x6ELL)) ^ 3;
  LODWORD(v234) = v359[BYTE1(v234) ^ 0x1FLL];
  HIDWORD(v231) = v234 ^ 0x1C;
  LODWORD(v231) = (_DWORD)v234 << 24;
  v205[*(_QWORD *)(v60 - 200)] = (v231 >> 30) ^ 0x58;
  v205[*(_QWORD *)(v60 - 152)] = *(_BYTE *)(v365 + (BYTE2(v363) ^ 0xC8)) ^ 0xB6;
  return (*(uint64_t (**)(uint64_t))(a55
                                            + 8
                                            * ((1570
                                              * ((((_DWORD)v366 - 124044767 - ((2 * (_DWORD)v366 + 32) & 0xF1367442) + 16) ^ 0xF89B3A21) < v439)) ^ ((int)v343 - 497))))(v343);
}

void sub_20AAD320C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,int a56,int a57,int a58,int a59,int a60)
{
  uint64_t v60;

  *(_DWORD *)(v60 - 128) = a57 ^ 0xAF4E41DF;
  *(_DWORD *)(v60 - 140) = a59 ^ 0xDBD74887;
  *(_DWORD *)(v60 - 132) = a60 ^ 0x41426C2A;
  *(_DWORD *)(v60 - 136) = a58 ^ 0xE40F495C;
  JUMPOUT(0x20AAD1570);
}

uint64_t sub_20AAD3260(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  int v8;
  uint64_t v9;

  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * (a7 ^ (1199 * (v7 != v8)))) - (((a7 + 91) | 0x1C0u) ^ 0x3DALL)))();
}

uint64_t sub_20AAD3290(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  char v7;
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8
                                        + 8
                                        * ((325 * ((v7 & 8) != ((75 * ((a7 + 122) ^ 0x236)) ^ 0x20D))) ^ (a7 + 122)))
                            - ((326 * ((a7 + 122) ^ 0x232u)) ^ 0x3DALL)))();
}

uint64_t sub_20AAD32EC(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55)
{
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  char v59;
  int v60;
  int v61;
  int v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  int8x16x4_t v69;

  *(_DWORD *)(v64 - 128) = v58;
  *(_DWORD *)(v64 - 124) = v63;
  v65 = *(_QWORD *)(v64 - 120) - 7;
  *(_DWORD *)(v64 - 132) = v58 & 0xFFFFFFF8;
  v66 = v61 + v60 + v59;
  v67 = (a1 + v61 + v60 + 1930 - v62);
  v69.val[0].i64[0] = ((_BYTE)a1 + (_BYTE)v61 + (_BYTE)v60 - 118 - (_BYTE)v62) & 0xF;
  v69.val[0].i64[1] = (v66 - (_BYTE)v62 + (((_BYTE)a6 - 78) & 0xF7)) & 0xF;
  v69.val[1].i64[0] = (v66 - 74 - (_BYTE)v62) & 0xF;
  v69.val[1].i64[1] = (v66 - 75 - (_BYTE)v62) & 0xF;
  v69.val[2].i64[0] = (v66 - 76 - (_BYTE)v62) & 0xF;
  v69.val[2].i64[1] = (v66 - 77 - (_BYTE)v62) & 0xF;
  v69.val[3].i64[0] = (v66 - 78 - (_BYTE)v62) & 0xF;
  v69.val[3].i64[1] = (v66 - 79 - (_BYTE)v62) & 0xF;
  *(int8x8_t *)(v65 + v67) = vrev64_s8(veor_s8(veor_s8(vrev64_s8(veor_s8(veor_s8(*(int8x8_t *)(v65 + v67), *(int8x8_t *)(v55 + (v67 & 0xF) - 7)), veor_s8(*(int8x8_t *)(v57 + (v67 & 0xF) - 7), *(int8x8_t *)(v56 + (v67 & 0xF) - 7)))), (int8x8_t)0xFBFBFBFBFBFBFBFBLL), vmul_s8((int8x8_t)*(_OWORD *)&vqtbl4q_s8(v69, (int8x16_t)xmmword_20AB036A0), (int8x8_t)0x505050505050505)));
  return (*(uint64_t (**)(__n128))(a55 + 8 * ((62 * (8 - (v58 & 0xFFFFFFF8) == -v62)) ^ a6)))((__n128)xmmword_20AB036A0);
}

void sub_20AAD3434()
{
  JUMPOUT(0x20AAD3360);
}

uint64_t sub_20AAD343C(unsigned int a1)
{
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((902
                                          * (((*(_DWORD *)(v2 - 128) == *(_DWORD *)(v2 - 132)) ^ ((a1 ^ 0x65) + 1)) & 1)) ^ a1))
                            - 3 * (a1 ^ 0xF1)
                            + 970))();
}

uint64_t sub_20AAD3488(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = (a4 - 1945093063);
  *(_BYTE *)(*(_QWORD *)(v10 - 120) + v11) ^= *(_BYTE *)(v6 + (v11 & 0xF)) ^ *(_BYTE *)(v8 + (v11 & 0xF)) ^ *(_BYTE *)(v7 + (v11 & 0xF)) ^ (5 * (v11 & 0xF)) ^ 0xFB;
  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * ((916 * (a4 - 1 != v5)) ^ (a5 - 539))) - 8))();
}

void sub_20AAD34F0()
{
  int v0;
  int v1;
  uint64_t v2;

  if (v0 == 949109339)
    v1 = 306494155;
  else
    v1 = -306454253;
  *(_DWORD *)(v2 + 40) = v1;
}

void sub_20AAD3554()
{
  uint64_t v0;
  int v1;
  BOOL v2;
  int v3;

  v0 = MEMORY[0x24BDAC7A8]();
  if (*(_QWORD *)(v0 + 24))
    v2 = *(_QWORD *)(v0 + 8) == 0x61B876722A6C047;
  else
    v2 = 1;
  v3 = v2;
  v1 = *(_DWORD *)(v0 + 16) ^ (1755732067 * ((2 * (v0 & 0x47DE7202) - v0 - 1205760515) ^ 0x66E73026));
  __asm { BR              X8 }
}

void sub_20AAD3688()
{
  int v0;
  uint64_t v1;

  *(_DWORD *)(v1 + 36) = v0 | 4;
}

uint64_t sub_20AAD3690()
{
  unint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  int v8;

  STACK[0x420] = v0;
  v5 = v4 - 216;
  *(_BYTE *)v5 = (-85 * ((v4 + 40 - 2 * ((v4 + 40) & 0xA6) - 90) ^ 0x50)) ^ 0x5B;
  STACK[0x260] = (unint64_t)&STACK[0x64B4A486D173E2A0];
  *(_QWORD *)(v5 + 24) = &STACK[0x64B4A486D173E2A0];
  STACK[0x268] = (unint64_t)&STACK[0x79008787D20F5C97];
  *(_QWORD *)(v5 + 8) = &STACK[0x79008787D20F5C97];
  *(_DWORD *)(v4 - 200) = 3804331 * ((v4 - 216 - 2 * ((v4 - 216) & 0xDA6E1EA6) - 630317402) ^ 0xA4BB3B50) + v2 - 715;
  v6 = (uint64_t (*)(uint64_t))(*(_QWORD *)(v1 + 8 * (v2 - 1147)) - 8);
  STACK[0x258] = (unint64_t)v6;
  v7 = v6(v4 - 216);
  v8 = *(_DWORD *)(v4 - 196);
  LODWORD(STACK[0x478]) = v8;
  return (*(uint64_t (**)(uint64_t))(v3 + 8 * (((v8 == v2 + 306492963) * (((2 * v2) ^ 0xBE6) + 321)) ^ v2)))(v7);
}

#error "20AAD3EA0: call analysis failed (funcsize=316)"

uint64_t sub_20AAD3EA4()
{
  uint64_t v0;
  int v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  int v5;
  uint64_t v6;
  int v7;
  unint64_t v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;

  LODWORD(STACK[0x410]) = v1;
  STACK[0x400] = v2;
  STACK[0x5F0] = 0;
  v7 = 235795823 * ((2 * ((v6 - 216) & 0x67AAA090) - (v6 - 216) + 408248170) ^ 0x8CF81633);
  *(_DWORD *)(v6 - 216) = v7 ^ 0x883559F3;
  *(_DWORD *)(v6 - 180) = v5 - v7 - 952;
  v8 = STACK[0x278];
  v4[1] = 0x19426598691BF935;
  v4[2] = STACK[0x270];
  v4[3] = v8;
  v9 = (uint64_t (*)(uint64_t))(*(_QWORD *)(v0 + 8 * (v5 ^ 0x41F)) - 12);
  STACK[0x280] = (unint64_t)v9;
  v10 = v9(v6 - 216);
  return (*(uint64_t (**)(uint64_t))(v3
                                            + 8
                                            * (((*(_DWORD *)(v6 - 184) == 306494155)
                                              * ((v5 + 606) ^ 0x5BE ^ ((v5 - 551) | 0x139))) ^ v5)))(v10);
}

uint64_t sub_20AAD3F90()
{
  uint64_t v0;
  unint64_t v1;
  int v2;

  STACK[0x210] = v1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * ((22
                                          * (LODWORD(STACK[0x510]) - 274119351 + ((v2 - 844) ^ 0x343u) - 2169 > 0xFFFFF7FE)) ^ v2))
                            - 12))();
}

uint64_t sub_20AAD3FD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  int v5;
  int v6;

  v6 = v5 - ((2 * v5 + 122849938) & 0x7176B88) + 1932851981;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4
                                                                                 + 8
                                                                                 * ((235
                                                                                   * (((((v3 + 478541868) & 0xE37A05FF)
                                                                                      - 536879465) & (2 * v6) ^ 0x7174B88)
                                                                                    + (v6 ^ 0x6C745A3B)
                                                                                    + 2125960711 != 1857521158)) ^ (v3 - 707)))
                                                                     - 8))(a1, a2, a3, 1857521158);
}

uint64_t sub_20AAD4158(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int a66;
  int v66;
  int v67;
  int v68;
  uint64_t v69;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v69
                                                                                          + 8
                                                                                          * (((v68
                                                                                             + v67
                                                                                             + ((v66 + 1214166671) & 0xB7A14E8D ^ a66) > 7)
                                                                                            * (((v66 - 1375311340) & 0x51F997BF)
                                                                                             - 26)) ^ v66))
                                                                              - 8))(a1, a2, a3, a4, 2437445885);
}

uint64_t sub_20AAD41D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3 + 8 * (((v1 - a1 < ((v2 + 300832055) & 0xEE11A77F ^ 0x31BuLL)) * (v2 - 1634)) ^ v2)))();
}

uint64_t sub_20AAD4214()
{
  unsigned int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (((((v1 - 1664) | 0x219) ^ 0x21B) * (v0 < 0x20)) ^ (v1 - 689)))
                            - (((v1 - 1145) | 0x130u) ^ 0x33FLL)))();
}

uint64_t sub_20AAD4260@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v7 = v4 + 268439552 + v3;
  v8 = v1 + v7;
  v9 = *(_OWORD *)(v8 - 31);
  v10 = a1 + v7;
  *(_OWORD *)(v10 - 15) = *(_OWORD *)(v8 - 15);
  *(_OWORD *)(v10 - 31) = v9;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((1480 * ((v2 & 0xFFFFFFE0) == 32)) ^ (v5 - 393)))
                            - (v5 - 567)
                            + 248))();
}

void sub_20AAD42BC()
{
  JUMPOUT(0x20AAD4278);
}

uint64_t sub_20AAD42C8()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * (((v0 == v1) ^ (v2 + 123)) & 1 | (32
                                                                                           * (((v0 == v1) ^ (v2 + 123)) & 1)) | v2))
                            - (v2 + 414)
                            + 666))();
}

uint64_t sub_20AAD430C()
{
  char v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (v1 ^ (110 * ((v0 & 0x18) != 0))))
                            - ((((v1 + 1200205115) & 0xB876523F) + 286) ^ 0x337)))();
}

uint64_t sub_20AAD4354@<X0>(int a1@<W4>, uint64_t a2@<X8>)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  v8 = -v5;
  v9 = v3 + v8 + ((v6 + 1566248368) & 0xA2A4F136 ^ a1);
  *(_QWORD *)(a2 - 7 + v9) = *(_QWORD *)(v2 - 7 + v9);
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((897 * (((v6 - 549) & v4) + v8 != 8)) ^ (v6 - 129))) - 4))();
}

void sub_20AAD43C0()
{
  JUMPOUT(0x20AAD4384);
}

uint64_t sub_20AAD43C8(int a1)
{
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((((a1 + 567) ^ 0x358) * (v1 != v2)) ^ a1)) - 8))();
}

uint64_t sub_20AAD43F0@<X0>(int a1@<W3>, int a2@<W4>, uint64_t a3@<X8>)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;

  *(_BYTE *)(a3 + (a2 + v4 + 252)) = *(_BYTE *)(v3 + (a2 + v4 + 252));
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * (((v4 - 1 == a1) * v6) ^ (v5 + 335))) - 12))();
}

uint64_t sub_20AAD4424()
{
  int v0;
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((242 * (STACK[0x5F0] != 0)) ^ (v0 + 311))) - 8))();
}

uint64_t sub_20AAD4478()
{
  int v0;
  uint64_t (*v1)(void);
  uint64_t v2;
  int v3;
  unsigned __int8 v4;
  uint64_t v5;

  v5 = v1();
  LODWORD(STACK[0x4AC]) = v3;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v2
                                                      + 8
                                                      * ((13 * ((v4 ^ (v0 - 38)) & 1)) ^ (v0 + 811)))
                                          - 12))(v5);
}

uint64_t sub_20AAD44E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int v7;
  uint64_t v8;
  int v9;
  unsigned __int8 v10;

  LODWORD(STACK[0x4AC]) = v9;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 + 8 * ((13 * ((v10 ^ (v7 - 38)) & 1)) ^ (v7 + 811))) - 12))(a1, a2, a3, a4, a5, a6, a7, 306494155);
}

uint64_t sub_20AAD4528()
{
  int v0;
  unint64_t v1;
  unsigned int v2;
  uint64_t v3;

  STACK[0x2B0] = v1;
  LODWORD(STACK[0x544]) = 2;
  STACK[0x5A8] = 0;
  LODWORD(STACK[0x444]) = 0;
  LODWORD(STACK[0x42C]) = 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (int)(((((v0 ^ 0x657) + 219) ^ 0xED) * ((v2 >> 1) & 1)) ^ v0)) - 8))();
}

uint64_t sub_20AAD4574(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50)
{
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  int v62;
  int v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t (*v66)(__n128);
  int v68;
  unint64_t v69;
  int v70;
  uint64_t v71;

  *(_DWORD *)(STACK[0x390] + 360) = 704864279;
  v58 = ((uint64_t (*)(_QWORD, uint64_t, unint64_t *, _QWORD, _QWORD, uint64_t, unint64_t *, unint64_t *))*(&off_24C363D30 + v50 - 754))(LODWORD(STACK[0x410]), 2, &STACK[0x544], v56[1], (v55 - 274119351), v51, &STACK[0x5A8], &STACK[0x444]);
  v61 = ((2 * v58) & 0xB4F13FEE) + (v58 ^ 0xDA789FF7);
  if (v61 == -361193478)
  {
    LODWORD(STACK[0x4AC]) = -306454029;
    return ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v53
                                                                                  + 8
                                                                                  * (int)((1459
                                                                                         * (((v56[31] == 0) ^ (STACK[0x420] + 20)) & 1)) ^ (STACK[0x420] - 28)))
                                                                      - 8))(v58, v56[31], v59, v60);
  }
  else if (v61 == -629628937)
  {
    v62 = STACK[0x420] - 219;
    STACK[0x380] = v56[31];
    LODWORD(STACK[0x378]) = STACK[0x444];
    STACK[0x298] = v52 + 1151;
    v63 = 29 * (v62 ^ 0x245);
    LODWORD(STACK[0x4D4]) = 1367412423;
    v64 = STACK[0x418];
    v65 = (unint64_t)&STACK[0x680] + STACK[0x418] - 0x4ADA549945670B8FLL;
    STACK[0x388] = STACK[0x418] + 4144;
    v56[37] = v64 + 4144;
    *(_QWORD *)v65 = 0x6370646600;
    *(_BYTE *)(v65 + 8) = 1;
    STACK[0x218] = v65;
    STACK[0x410] = v56[38];
    STACK[0x3B8] = v65 + 1712 + ((((v65 + 1712) << (v63 ^ 0x35u)) + 16) & 0x20) + 16;
    STACK[0x3C0] = v65 + 9;
    v66 = (uint64_t (*)(__n128))(*(_QWORD *)(v53 + 8 * ((675 * (((v63 - 490) | 0x10) == 599)) ^ v63))
                                         - (v63 - 246)
                                         + 819);
    STACK[0x3C8] = (unint64_t)*(&off_24C363D30 + (v63 ^ 0x4D3));
    STACK[0x3F8] = (unint64_t)*(&off_24C363D30 + v63 - 883);
    STACK[0x400] = (unint64_t)*(&off_24C363D30 + v63 - 862);
    return v66((__n128)0);
  }
  else
  {
    v68 = 1178560073 * ((((v57 - 216) | 0xFF72B7EF) + (~(v57 - 216) | 0x8D4810)) ^ 0x45E6CF8C);
    v69 = STACK[0x420];
    v70 = STACK[0x420] - v68 + 724;
    *(_QWORD *)(v54 + 8) = a50;
    *(_DWORD *)(v57 - 216) = v68 + v61 - ((2 * v61 + 185516050) & 0x24897596) + 936123092;
    *(_DWORD *)(v57 - 212) = v70;
    v71 = sub_20AAE2F30((_DWORD *)(v57 - 216));
    return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v53
                                                        + 8
                                                        * ((1459 * (((v56[31] == 0) ^ (v69 + 20)) & 1)) ^ ((int)v69 - 28)))
                                            - 8))(v71);
  }
}

uint64_t sub_20AAD7550()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 112) = STACK[0x410];
  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((501 * (*(_QWORD *)(v2 + 64) != 0)) ^ (((v0 - 1531256028) & 0x5B451F7F)
                                                                                  + 323)))
                            - 8))();
}

uint64_t sub_20AAD7EF4()
{
  uint64_t v0;
  int v1;
  uint64_t v2;

  ((void (*)(void))STACK[0x2B0])();
  return (*(uint64_t (**)(void))(v0 + 8 * ((13 * (*(_QWORD *)(v2 + 160) == 0)) ^ (v1 - 486))))();
}

uint64_t sub_20AAD7F20()
{
  uint64_t v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((186 * (*(_QWORD *)(v2 + 168) != 0)) ^ (v1 + 297))) - 8))();
}

uint64_t sub_20AAD7F50()
{
  uint64_t v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((196 * (*(_QWORD *)(v2 + 40) == 0)) ^ (v1 - 214))) - 4))();
}

uint64_t sub_20AAD7F78()
{
  uint64_t (*v0)(void);
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  v4 = v0();
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v2
                                                      + 8
                                                      * (((((v3 - 822) | 0x442) - 332) * (v1 == 306494155)) ^ (v3 + 268)))
                                          - 12))(v4);
}

uint64_t sub_20AAD7FC0()
{
  uint64_t v0;
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v0 + 8 * ((13 * (*(_QWORD *)(v2 + 160) == 0)) ^ (v1 - 486))))();
}

uint64_t sub_20AAD7FE8()
{
  void (*v0)(void);
  uint64_t v1;
  int v2;
  uint64_t v3;

  v0();
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((186 * (*(_QWORD *)(v3 + 168) != 0)) ^ (v2 + 297))) - 8))();
}

uint64_t sub_20AAD801C()
{
  void (*v0)(void);
  uint64_t v1;
  int v2;
  uint64_t v3;

  v0();
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((196 * (*(_QWORD *)(v3 + 40) == 0)) ^ (v2 - 214))) - 4))();
}

uint64_t sub_20AAD8048()
{
  int v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * (((((v2 - 822) | 0x442) - 332) * (v0 == 306494155)) ^ (v2 + 268)))
                            - 12))();
}

uint64_t sub_20AAD808C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54)
{
  uint64_t v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  int v59;
  uint64_t v60;
  int v61;

  LODWORD(STACK[0x4D4]) = 1367412143;
  LODWORD(STACK[0x59C]) = 128;
  v58 = (_QWORD *)(v57 - 216);
  v58[4] = 0;
  v58[8] = v54;
  v58[9] = v54 + 0x4FF3ADA337C703A5;
  v59 = 1178560073
      * ((2 * (((v57 - 216) ^ 0xC613B706) & 0x4A6DD616) - ((v57 - 216) ^ 0xC613B706) + 898771432) ^ 0x4915E68C);
  *(_DWORD *)(v57 - 192) = 1843745193 - v59;
  *(_DWORD *)(v57 - 176) = (v55 - 214) ^ v59;
  v58[6] = 0;
  v58[7] = a45;
  v58[1] = a54;
  v58[2] = v54 + 0x4FF3ADA337C70295;
  v60 = ((uint64_t (*)(uint64_t))STACK[0x418])(v57 - 216);
  v61 = *(_DWORD *)(v57 - 216) == (((v55 - 783) | 0x203) ^ 0x1244B75F) + (v55 ^ 0x220);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v56 + 8 * (((32 * v61) | (v61 << 9)) ^ v55)) - 12))(v60);
}

uint64_t sub_20AAD81B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  int8x16_t v4;
  int8x16_t v5;
  int8x16_t v6;
  int8x16_t v7;
  unint64_t v8;
  int8x16_t v9;
  int8x16_t v10;
  int8x16_t v11;
  int8x16_t v12;

  v4 = vrev64q_s8(*(int8x16_t *)(v1 + 127 - a1 - 15));
  v5 = vextq_s8(v4, v4, 8uLL);
  v6 = vrev64q_s8(*(int8x16_t *)(v1 + 127 - a1 - 31));
  v7 = vextq_s8(v6, v6, 8uLL);
  v8 = STACK[0x298] + 127 - a1;
  v9.i64[0] = 0xF6F6F6F6F6F6F6F6;
  v9.i64[1] = 0xF6F6F6F6F6F6F6F6;
  v10.i64[0] = 0xFBFBFBFBFBFBFBFBLL;
  v10.i64[1] = 0xFBFBFBFBFBFBFBFBLL;
  v11 = vrev64q_s8(vaddq_s8(vsubq_s8(v5, vandq_s8(vaddq_s8(v5, v5), v9)), v10));
  *(int8x16_t *)(v8 - 15) = vextq_s8(v11, v11, 8uLL);
  v12 = vrev64q_s8(vaddq_s8(vsubq_s8(v7, vandq_s8(vaddq_s8(v7, v7), v9)), v10));
  *(int8x16_t *)(v8 - 31) = vextq_s8(v12, v12, 8uLL);
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((a1 == 96) * ((v2 ^ 0x4F1) - 380)) ^ v2)) - 12))();
}

uint64_t sub_20AAD8248(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8;
  uint64_t v9;
  int v10;

  LODWORD(STACK[0x4AC]) = a8;
  v10 = *(_DWORD *)(STACK[0x390] + 360) + ((v8 + 165) ^ 0xD5FC9CD2) < 0xFFFFFFFE;
  return (*(uint64_t (**)(void))(v9 + 8 * (((4 * v10) | (v10 << 6)) ^ v8)))();
}

uint64_t sub_20AAD8288@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43)
{
  int v43;
  int v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  unint64_t v56;
  unint64_t v58;
  char *v59;
  int v60;
  unint64_t v61;
  int v62;
  uint64_t v63;

  v48 = ((uint64_t (*)(_QWORD, _QWORD, uint64_t))*(&off_24C363D30 + (v44 & 0x2FD09461)))(LODWORD(STACK[0x42C]), (a1 + v43), a38);
  v55 = ((2 * v48) & 0xFE9B7D9A) + (v48 ^ 0x7F4DBECD);
  v56 = STACK[0x420];
  if (v55 == 2135801549)
  {
    v58 = STACK[0x380];
    v59 = (char *)&STACK[0x680] + STACK[0x380] - 0x4ADA54994567150FLL;
    v46[11] = v59 - 1824;
    STACK[0x418] = (unint64_t)(v59 - 1596);
    LODWORD(STACK[0x468]) = 1364770160;
    v46[37] = v58 - 192;
    *v46 = 0;
    LODWORD(STACK[0x5F8]) = 274119351;
    STACK[0x3F8] = (unint64_t)(v59 - 1824);
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v45 + 8 * (int)(((((v56 + 1875208704) & 0x903A93F7) - 297) * (v59 != (char *)1576)) ^ (v56 - 9))) - (v56 ^ 0x337)))(v48, v49, v50, v51, v52, v53, v54, 306494155);
  }
  else if (v55 == -1890730288)
  {
    LODWORD(STACK[0x4AC]) = -306454029;
    return ((uint64_t (*)(void))(*(_QWORD *)(v45
                                          + 8
                                          * (int)((1459 * (((v46[31] == 0) ^ (STACK[0x420] + 20)) & 1)) ^ (STACK[0x420] - 28)))
                              - 8))();
  }
  else
  {
    v60 = 1178560073 * ((34518042 - ((v47 - 216) | 0x20EB41A) + ((v47 - 216) | 0xFDF14BE5)) ^ 0x47653387);
    *(_QWORD *)(v47 - 208) = a43;
    v61 = STACK[0x420];
    v62 = STACK[0x420] - v60 + 724;
    *(_DWORD *)(v47 - 216) = v60 + v55 - ((2 * v55 + 23364198) & 0x24897596) - 1829307394;
    *(_DWORD *)(v47 - 212) = v62;
    v63 = sub_20AAE2F30((_DWORD *)(v47 - 216));
    return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v45
                                                        + 8
                                                        * ((1459 * (((v46[31] == 0) ^ (v61 + 20)) & 1)) ^ ((int)v61 - 28)))
                                            - 8))(v63);
  }
}

uint64_t sub_20AAD8414()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  _BOOL4 v3;

  *(_DWORD *)(v2 - 216) = v0
                        + 628203409 * ((((v2 - 216) | 0xE913EFE) - (v2 - 216) + ((v2 - 216) & 0xF16EC100)) ^ 0x8C1932CD)
                        - 231789097;
  nullsub_1(v2 - 216);
  v3 = ((uint64_t (*)(uint64_t, uint64_t))STACK[0x3C8])(336, 318119320) != 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((v3 * ((v0 ^ 0x208) - 704)) ^ v0))
                            - ((2 * v0) ^ 0x26ELL)))();
}

uint64_t sub_20AAD84C8(uint64_t a1)
{
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2
                                                                                          + 8
                                                                                          * (int)((((unint64_t)*(&off_24C363D30 + v1 - 588) - a1 - 8 > 0x1F)
                                                                                                 * ((v1 + 1833689881) & 0x92B41FFF ^ 0x16D)) ^ v1))
                                                                              - 12))(3597661051, 335, 963, 172, 175);
}

uint64_t sub_20AAD8574@<X0>(int a1@<W0>, int a2@<W1>, int a3@<W2>, int a4@<W6>, uint64_t a5@<X8>)
{
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int8x16_t v10;
  int8x16_t v11;
  int8x16_t v12;
  int8x16_t v13;
  uint64_t v14;
  int8x16_t v15;
  int8x16_t v16;
  int8x16_t v17;
  int8x16_t v18;
  int8x16_t v19;

  v9 = (a2 - v5);
  v10 = vrev64q_s8(*(int8x16_t *)(a5 + v9 - 15));
  v11 = vextq_s8(v10, v10, 8uLL);
  v12 = vrev64q_s8(*(int8x16_t *)(a5 + v9 - 31));
  v13 = vextq_s8(v12, v12, 8uLL);
  v14 = v8 + v9;
  v15.i64[0] = 0xF6F6F6F6F6F6F6F6;
  v15.i64[1] = 0xF6F6F6F6F6F6F6F6;
  v16 = vmvnq_s8(vandq_s8(vaddq_s8(v11, v11), v15));
  v17 = vmvnq_s8(vandq_s8(vaddq_s8(v13, v13), v15));
  v15.i64[0] = 0xFCFCFCFCFCFCFCFCLL;
  v15.i64[1] = 0xFCFCFCFCFCFCFCFCLL;
  v18 = vrev64q_s8(vaddq_s8(vaddq_s8(v11, v15), v16));
  *(int8x16_t *)(v14 - 15) = vextq_s8(v18, v18, 8uLL);
  v19 = vrev64q_s8(vaddq_s8(vaddq_s8(v13, v15), v17));
  *(int8x16_t *)(v14 - 31) = vextq_s8(v19, v19, 8uLL);
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * (((v5 + 32 != ((v6 + a4) & a1) - 507) * a3) ^ v6)) - 12))();
}

uint64_t sub_20AAD860C@<X0>(int a1@<W1>, int a2@<W4>, uint64_t a3@<X8>)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  int8x8_t v6;
  int8x8_t v7;
  uint64_t v8;
  int8x8_t v9;

  v8 = (a1 - 320);
  v9 = vrev64_s8(*(int8x8_t *)(a3 + v8 - 7));
  *(int8x8_t *)(v5 - 7 + v8) = vrev64_s8(vadd_s8(vadd_s8(v9, v7), vmvn_s8(vand_s8(vadd_s8(v9, v9), v6))));
  return (*(uint64_t (**)(void))(v4 + 8 * ((((v3 ^ 0x26B) != 328) * a2) ^ (v3 + 1074))))();
}

uint64_t sub_20AAD8670@<X0>(int a1@<W5>, uint64_t a2@<X8>)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  *(_BYTE *)(v9 + (v2 + v6)) = *(_BYTE *)(a2 + (v2 + v6))
                                           + (~(2 * *(_BYTE *)(a2 + (v2 + v6))) | 9)
                                           - 4;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * (((v2 - 1 == a1) * ((v7 + v4) & v5 ^ v3)) ^ v7)) - 12))();
}

uint64_t sub_20AAD86B8()
{
  int v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  STACK[0x458] = v4;
  *(_QWORD *)(v1 - 208) = 0x404040404040404;
  *(_QWORD *)(v1 - 200) = 0xFBFBFBFBFDFBFBE9;
  v6 = ((((v5 - 216) | 0x8BAFCC0E) - (v5 - 216) + ((v5 - 216) & 0x745033F0)) ^ 0x1F028557) * v0;
  *(_DWORD *)(v5 - 212) = v6 + 11846904;
  *(_DWORD *)(v5 - 208) = v2 - v6 + 1064655772;
  nullsub_1(v5 - 216);
  LODWORD(STACK[0x474]) = 274119687;
  v7 = ((uint64_t (*)(uint64_t, uint64_t))STACK[0x3C8])(336, 1690680581);
  STACK[0x488] = v7;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((50 * (v7 == 0)) ^ v2)) - ((((v2 - 830) | 0x82u) + 608) ^ 0x337)))();
}

uint64_t sub_20AAD8790()
{
  int v0;
  uint64_t v1;

  LODWORD(STACK[0x648]) = -306454241;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((562 * (STACK[0x458] != 0)) ^ (v0 - 520))) - 8))();
}

uint64_t sub_20AAD87D0@<X0>(int a1@<W7>, uint64_t a2@<X8>)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;

  *(_QWORD *)(v4 + 296) = a2 - 16;
  return (*(uint64_t (**)(void))(v3 + 8 * (v2 ^ (16 * (v5 == a1 + v2 + 461 - 827)))))();
}

uint64_t sub_20AAD8800()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = ((uint64_t (*)(uint64_t))STACK[0x2B0])(v1);
  LODWORD(STACK[0x4AC]) = -306454241;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v0
                                                      + 8
                                                      * ((1459
                                                        * (((*(_QWORD *)(v3 + 248) == 0) ^ (v2 + 20)) & 1)) ^ (v2 - 28)))
                                          - 8))(v4);
}

void sub_20AAD886C(uint64_t a1, uint64_t a2)
{
  ((void (*)(_QWORD, uint64_t, _QWORD))STACK[0x2C8])(*(unsigned int *)STACK[0x2C0], a2, LODWORD(STACK[0x444]));
  JUMPOUT(0x20AAD889CLL);
}

uint64_t sub_20AAD88F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  *(_DWORD *)(v9 + 52) += v8 - 770 + ((v8 + 414468990) & 0xE74BB06E ^ 0xFFFFFEEC);
  STACK[0x418] = v10 - 2432;
  *(_QWORD *)(v12 + 296) = v10 - 2432;
  LODWORD(STACK[0x478]) = a8;
  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * ((44 * (*(_QWORD *)(v12 + 184) != 0)) ^ v8)) - 8))();
}

uint64_t sub_20AAD895C@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2 + 8 * (((((a1 - 339) | 0x42) + 139) * ((v1 & 0xFFFFFFFE) != 704864278)) ^ a1)))();
}

uint64_t sub_20AAD899C()
{
  int v0;
  int v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  int v8;

  v5 = 535753261 * ((v4 + 1665162316 - 2 * ((v4 - 216) & 0x63405D24)) ^ 0x69B4530B);
  *v3 = STACK[0x238];
  v3[5] = STACK[0x2A8];
  *(_DWORD *)(v4 - 184) = v1 - v5 - 375237951;
  v6 = STACK[0x234];
  *(_DWORD *)(v4 - 208) = v0 - v5 + 408;
  *(_DWORD *)(v4 - 192) = v6 ^ v5;
  v3[2] = STACK[0x240];
  v7 = ((uint64_t (*)(uint64_t))*(&off_24C363D30 + (v0 ^ 0xF2)))(v4 - 216);
  v8 = *(_DWORD *)(v4 - 188);
  LODWORD(STACK[0x478]) = v8;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v2
                                                      + 8 * (((v8 == v0 + 306494045) * ((v0 + 1087) ^ 0x3EC)) ^ v0))
                                          - 12))(v7);
}

uint64_t sub_20AAD8A80()
{
  int v0;
  int v1;
  uint64_t v2;

  LODWORD(STACK[0x2E4]) = STACK[0x5C8];
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((((((v1 ^ 0x5D2) - 339) | 0x42) + 139) * ((v0 & 0xFFFFFFFE) != 704864278)) ^ v1 ^ 0x5D2)))();
}

uint64_t sub_20AAD8AD0()
{
  unint64_t v0;
  uint64_t v1;
  int v2;
  int v3;
  uint64_t v4;
  _QWORD *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  int v12;

  v9 = *(_QWORD *)(v7 + 184);
  v10 = 628203409 * ((2 * ((v6 ^ 0xACA8CCAA) & 0x4A25CCB0) - (v6 ^ 0xACA8CCAA) - 1243991221) ^ 0x9BFAF3D2);
  *(_DWORD *)(v8 - 196) = LODWORD(STACK[0x5C8]) - v10 - 702327989;
  v5[3] = v9;
  v5[4] = v1 + 0x502D1C54229AA67BLL;
  STACK[0x368] = v0;
  v5[6] = v0;
  v5[1] = v1 + 0x2152BE6AABE9567DLL;
  *(_DWORD *)(v8 - 216) = v2 - v10 + 368400067;
  *(_DWORD *)(v8 - 200) = -628203409
                        * ((2 * ((v6 ^ 0xACA8CCAA) & 0x4A25CCB0) - (v6 ^ 0xACA8CCAA) - 1243991221) ^ 0x9BFAF3D2)
                        + (((v2 + 709) | 8) + 1513664140) * v3
                        - 1018578054;
  v11 = sub_20AAE5E7C(v8 - 216);
  v12 = *(_DWORD *)(v8 - 176);
  LODWORD(STACK[0x478]) = v12;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v4 + 8 * ((598 * (v12 == 306494155)) ^ v2)) - 12))(v11);
}

uint64_t sub_20AAD8BE0()
{
  int v0;
  uint64_t v1;
  _QWORD *v2;
  int v3;
  uint64_t v4;
  unint64_t v5;
  int v6;
  unsigned int v7;
  int v8;
  unsigned int v9;
  uint64_t v10;
  int v11;

  v5 = STACK[0x390];
  v6 = *(_DWORD *)(STACK[0x390] + 52);
  v7 = 3804331 * ((((v3 | 0xBE91E98E) ^ 0xFFFFFFFE) - (~v3 | 0x416E1671)) ^ 0x3FBB3387);
  v2[2] = &STACK[0x1900];
  v8 = LODWORD(STACK[0x28C]) ^ v7;
  *(_DWORD *)(v4 - 192) = v7 - 1547997447 + v6;
  v2[4] = STACK[0x368];
  v2[5] = v5 + 0x502D1C54229AA69BLL;
  v9 = LODWORD(STACK[0x2E4]) - v7 + 4 * (v0 ^ 0x44) + (((v0 ^ 0x44) + 785) ^ 0xEA686BA0);
  *(_DWORD *)(v4 - 216) = (v0 - 58) ^ v7;
  *(_DWORD *)(v4 - 212) = v9;
  *(_DWORD *)(v4 - 208) = v8;
  v10 = ((uint64_t (*)(uint64_t))((char *)*(&off_24C363D30 + v0 - 39) - 8))(v4 - 216);
  v11 = *(_DWORD *)(v4 - 204);
  LODWORD(STACK[0x478]) = v11;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v1 + 8 * ((1112 * (v11 == 306494155)) ^ v0)) - 12))(v10);
}

uint64_t sub_20AAD8CF4()
{
  int v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((((v2 + 659) ^ 0x369) * ((v0 - 704864279) < 0xFFFFFFFE)) | v2))
                            - 12))();
}

uint64_t sub_20AAD8D2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,int a46,int a47,int a48)
{
  int v48;
  int v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  int v53;
  unint64_t *v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  int v60;
  int v61;
  unsigned int v62;
  int v63;
  uint64_t v64;
  unint64_t v66;
  int v67;
  int v68;
  unint64_t v69;
  int v70;
  unsigned int v71;
  uint64_t v72;
  int v73;

  v56 = STACK[0x390];
  v57 = ((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, unint64_t *, unint64_t, _QWORD, unint64_t *))*(&off_24C363D30 + (v53 ^ 0xA8)))(*(unsigned int *)STACK[0x390], (v49 + v48), LODWORD(STACK[0x230]), ((v53 - 133436781) & 0x7F417FF ^ 0x86B05F8A) + *(_DWORD *)(STACK[0x390] + 52), &STACK[0x1900], STACK[0x368], (LODWORD(STACK[0x2E4]) - 931881356), &STACK[0x18F0]);
  v59 = (v57 ^ 0xABBCF57F) + 1610608286 + ((2 * v57) & 0x5779EAFE);
  if (v59 == 465364000)
    return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v50
                                                                 + 8
                                                                 * (int)((((((LODWORD(STACK[0x2B8])
                                                                                          - 2125956025) < 3) ^ STACK[0x420]) & 1)
                                                                        * (((STACK[0x420] - 719) | 2) ^ 0xA)) ^ (STACK[0x420] + 1152)))
                                                     - 8))(v57, v58);
  if (v59 == 196928541)
  {
    v66 = STACK[0x420];
    v67 = 3 * (STACK[0x420] ^ 0x1BA);
    LODWORD(STACK[0x418]) = STACK[0x420] - 278;
    ((void (*)(_QWORD, unint64_t, _QWORD))STACK[0x2C8])(*(unsigned int *)STACK[0x2C0], STACK[0x368], (LODWORD(STACK[0x2E4]) - 931881356));
    v68 = *(_DWORD *)(v56 + 52);
    v69 = STACK[0x5B0];
    v70 = 1755732067 * (((~(v55 - 216) & 0xCC8EE2BC) - (~(v55 - 216) | 0xCC8EE2BD)) ^ 0x12485F66);
    v71 = (LODWORD(STACK[0x598]) ^ 0x7DF36FF7) - v70 + ((2 * LODWORD(STACK[0x598])) & 0xFBE6DFEE) - 564275218;
    *(_DWORD *)(v55 - 200) = (a48 & 0x7FFFFFFF ^ 0x882A97EC)
                           - v70
                           + ((v67 ^ 0xB26FC87D) & a47 ^ 0xA22AC026)
                           - 1211467253;
    *v54 = v69;
    v54[1] = (unint64_t)&STACK[0x18F0];
    v54[3] = v51;
    *(_DWORD *)(v55 - 180) = v71;
    *(_DWORD *)(v55 - 176) = v68 - v70 - 1749893445;
    *(_DWORD *)(v55 - 172) = v70 + v66 - 748;
    v72 = ((uint64_t (*)(uint64_t))((char *)*(&off_24C363D30 + (int)(v66 ^ 0x31C)) - 4))(v55 - 216);
    v73 = *(_DWORD *)(v55 - 184);
    LODWORD(STACK[0x478]) = v73;
    return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v50
                                                        + 8 * ((1674 * (v73 == 306494155)) ^ LODWORD(STACK[0x418])))
                                            - 8))(v72);
  }
  else
  {
    v60 = STACK[0x224] & 0x405A6C7F;
    v61 = ((v59 << ((STACK[0x224] & 0x7F) - 109)) + 679884742) & 0x24897596;
    v62 = 1178560073 * (v54 ^ 0xBA947862);
    *(_QWORD *)(v52 + 8) = STACK[0x228];
    v63 = STACK[0x420] - v62 + 724;
    LODWORD(STACK[0x2BC]) = v59;
    *(_DWORD *)(v55 - 216) = v62 + v59 - v61 + 109565614;
    *(_DWORD *)(v55 - 212) = v63;
    v64 = sub_20AAE2F30((_DWORD *)(v55 - 216));
    return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v50
                                                        + 8
                                                        * ((728
                                                          * (LODWORD(STACK[0x478]) == (((v60 - 34) | 0x403) ^ 0x1244BE84))) ^ v60))
                                            - ((v60 + 699) | 0x12u)
                                            + 815))(v64);
  }
}

uint64_t sub_20AAD8F10()
{
  int v0;
  int v1;
  uint64_t v2;
  _BOOL4 v3;

  v3 = (v1 & 0xFFFFFFFE) != ((47 * (v0 ^ 0x33F)) ^ 0x2A0360AA);
  return (*(uint64_t (**)(void))(v2 + 8 * (((2 * v3) | (4 * v3)) ^ v0 ^ 0x68)))();
}

uint64_t sub_20AAD8F58()
{
  int v0;
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * (((LODWORD(STACK[0x478]) == 306494155)
                                          * (((v0 ^ 0x3EF) + 635) ^ ((v0 ^ 0x3EF) + 639) ^ 0x7D0)) ^ ((v0 ^ 0x3EF) - 78)))
                            - 12))();
}

void sub_20AAD9050()
{
  int v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  unsigned int v4;

  *(_DWORD *)(v3 - 216) = (v0 + 2138962537) ^ (535753261 * ((~(v2 | 0x42F3E1C1) + (v2 & 0x42F3E1C1)) ^ 0xB7F81011));
  sub_20AAE5B8C((_DWORD *)(v3 - 216));
  LODWORD(STACK[0x2B8]) = LODWORD(STACK[0x2B8]) + v0 - 713 - 109;
  v4 = 3804331 * ((((2 * v2) | 0xB4999BF4) - v2 + 632500742) ^ 0xA499E80C);
  *(_QWORD *)(v1 + 8) = STACK[0x268];
  *(_BYTE *)v1 = v4 ^ 0x5C;
  *(_DWORD *)(v3 - 200) = v4 + v0 - 346;
  *(_QWORD *)(v1 + 24) = STACK[0x260];
  ((void (*)(uint64_t))STACK[0x258])(v3 - 216);
  LODWORD(STACK[0x478]) = *(_DWORD *)(v3 - 196);
  LODWORD(STACK[0x2BC]) = 465364000;
  JUMPOUT(0x20AAD9148);
}

uint64_t sub_20AAD926C(unint64_t a1)
{
  int v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 + 296) = STACK[0x380] - 176;
  *(_QWORD *)(v4 + 352) = a1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (v1 ^ (475 * (v3 <= a1)))) - (v1 + 37) + 244))();
}

uint64_t sub_20AAD9328@<X0>(uint64_t a1@<X0>, char a2@<W4>, int a3@<W5>, int a4@<W6>, int a5@<W7>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;

  v14 = v9 + ((v8 + a4) & a5);
  v15 = (v9 + v10);
  *(_BYTE *)(a1 + v15) = *(_BYTE *)(v13 + v15) ^ *(_BYTE *)(v6 + (v15 & 0xF)) ^ *(_BYTE *)(v7 + (v15 & 0xF)) ^ *(_BYTE *)((v15 & 0xF) + a6 + 2) ^ ((v15 & 0xF) * a2) ^ 0xFB;
  return ((uint64_t (*)(void))(*(_QWORD *)(v12 + 8 * (((v14 - 744 == v11) * a3) ^ v8)) - 12))();
}

uint64_t sub_20AAD9390@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W2>, int a4@<W3>, char a5@<W4>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = ((v9 + a2) & a3 ^ (v10 + 484)) + v8;
  *(_BYTE *)(a1 + v13) = *(_BYTE *)(v12 + v13) ^ *(_BYTE *)(v6 + (v13 & 0xF)) ^ *(_BYTE *)(v7 + (v13 & 0xF)) ^ *(_BYTE *)((v13 & 0xF) + a6 + 2) ^ ((v13 & 0xF) * a5) ^ 0xFB;
  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * ((((v8 + v10) > 0x14F) * a4) ^ v9)) - 12))();
}

uint64_t sub_20AAD93FC(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,int8x16_t a37)
{
  int v37;
  uint64_t v38;
  int8x16_t *v39;
  _QWORD *v40;
  int8x16_t *v41;

  v41 = (int8x16_t *)((char *)&STACK[0x680] + STACK[0x380] - 0x4ADA54994567150FLL);
  v41[-12] = veorq_s8(*v39, a37);
  v40[47] += 32;
  v40[48] = a1;
  v40[49] = a1;
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v38
                                                                                                 + 8
                                                                                                 * (((v37 + 863) * (&v41[-12] == (int8x16_t *)a1)) ^ v37)))(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_20AAD9468(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61)
{
  int v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unsigned __int8 *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  uint64_t v74;
  unsigned int v75;
  int v76;
  int v77;
  int v78;
  unsigned int v79;
  unsigned int v80;
  int v81;
  unsigned int v82;
  int v83;
  unsigned int v84;
  uint64_t v85;
  int v86;
  unsigned int v87;
  int v88;
  unsigned __int8 v89;
  int v90;
  uint64_t v91;
  int v92;
  int v93;
  unint64_t v94;
  unint64_t v95;
  int v96;
  int v97;
  uint64_t v98;
  int v99;
  uint64_t v100;
  int v101;
  char v102;
  char v103;
  int v104;
  unsigned int v105;
  char v106;
  int v107;
  int v108;
  int v109;
  int v110;
  unsigned int v111;
  BOOL v112;
  char v113;
  char v114;
  int v115;
  int v116;
  unsigned int v117;
  int v118;
  int v119;
  uint64_t v120;
  int v121;
  int v122;
  uint64_t v123;
  int v124;
  unint64_t v125;
  uint64_t v126;
  int v127;
  int v128;
  int v129;
  unsigned int v130;
  uint64_t v131;
  int v132;
  unsigned int v133;
  int v134;
  unsigned int v135;
  unsigned int v136;
  int v137;
  int v138;
  int v139;
  int v140;
  int v141;
  int v142;
  unsigned int v143;
  int v144;
  unsigned int v145;
  int v146;
  unsigned int v147;
  unsigned int v148;
  int v149;
  unsigned __int8 v150;
  unsigned int v151;
  int v152;
  int v153;
  int v154;
  unsigned int v155;
  unsigned int v156;
  unsigned int v157;
  int v158;
  int v159;
  int v160;
  int v161;
  int v162;
  unsigned int v163;
  unsigned int v164;
  int v165;
  unsigned int v166;
  int v167;
  unsigned int v168;
  unsigned int v169;
  unsigned int v170;
  int v171;
  int v172;
  int v173;
  int v174;
  int v175;
  unsigned int v176;
  int v177;
  unsigned int v178;
  unint64_t v179;
  int v180;
  int v181;
  unsigned int v182;
  int v183;
  unsigned int v184;
  unsigned int v185;
  unsigned int v186;
  unsigned int v187;
  int v188;
  unsigned int v189;
  unsigned int v190;
  int v191;
  int v192;
  unsigned int v193;
  unsigned int v194;
  int v195;
  int v196;
  int v197;
  int v198;
  unsigned int v199;
  unsigned int v200;
  unsigned int v201;
  int v202;
  unsigned int v203;
  unsigned int v204;
  int v205;
  unint64_t v206;
  int v207;
  int v208;
  unsigned int v209;
  int v210;
  int v211;
  unsigned int v212;
  unsigned int v213;
  int v214;
  int v215;
  int v216;
  int v217;
  unsigned int v218;
  int v219;
  unsigned int v220;
  unsigned int v221;
  unsigned int v222;
  unsigned int v223;
  int v224;
  int v225;
  int v226;
  int v227;
  int v228;
  unsigned int v229;
  unsigned int v230;
  int v231;
  int v232;
  int v233;
  int v234;
  int v235;
  int v236;
  int v237;
  int v238;
  int v239;
  unsigned int v240;
  int v241;
  unsigned int v242;
  int v243;
  unsigned int v244;
  unsigned int v245;
  unsigned int v246;
  int v247;
  int v248;
  int v249;
  unsigned int v250;
  int v251;
  int v252;
  unsigned int v253;
  unsigned int v254;
  int v255;
  int v256;
  int v257;
  unsigned int v258;
  int v259;
  int v260;
  unsigned int v261;
  int v262;
  int v263;
  int v264;
  unsigned int v265;
  int v266;
  int v267;
  unsigned int v268;
  unsigned int v269;
  int v270;
  int v271;
  int v272;
  int v273;
  int v274;
  int v275;
  unsigned int v276;
  int v277;
  int v278;
  int v279;
  int v280;
  int v281;
  unsigned int v282;
  unsigned int v283;
  unsigned int v284;
  int v285;
  unint64_t v286;
  unsigned int v287;
  unsigned int v288;
  int v289;
  int v290;
  int v291;
  char *v292;
  char *v293;
  char *v294;
  unsigned int v295;
  uint64_t v296;
  unsigned int v297;
  int v298;
  unsigned int v299;
  unsigned int v300;
  unsigned __int8 v301;
  int v302;
  int v303;
  int v304;
  int v305;
  int v306;
  int v307;
  unsigned int v308;
  uint64_t v309;
  int v310;
  unsigned int v311;
  unsigned int v312;
  uint64_t v313;
  char *v314;
  int v315;
  char *v316;
  int v317;
  int v318;
  int v319;
  int v320;
  uint64_t v321;
  char *v322;
  int v323;
  unint64_t v324;
  unint64_t v325;
  int v326;
  unsigned int v327;
  unsigned int v328;
  unsigned int v329;
  unsigned int v330;
  unsigned int v331;
  unsigned int v332;
  unsigned int v333;
  int v334;
  unint64_t v335;
  unsigned int v336;
  uint64_t v337;
  int v338;
  _BYTE *v340;
  unsigned __int8 *v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  unint64_t v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  int v355;
  int v356;
  uint64_t v357;

  v68 = (unsigned __int8 *)&STACK[0x1910] + v62;
  *v68 = *a1;
  *(_QWORD *)(v68 + 1) = *(_QWORD *)(a1 + 1);
  *(_DWORD *)(v68 + 9) = *(_DWORD *)(a1 + 9);
  *(_WORD *)(v68 + 13) = *(_WORD *)(a1 + 13);
  v68[15] = a1[15];
  v69 = *((_QWORD *)a1 + 1);
  *((_QWORD *)v68 + 2) = *(_QWORD *)a1;
  *((_QWORD *)v68 + 3) = v69;
  v70 = *(_QWORD *)(v65 + 8 * (v61 ^ 0x34F)) - 8;
  v71 = *(_QWORD *)(v65 + 8 * (v61 - 760));
  v72 = *(_QWORD *)(v65 + 8 * (v61 ^ 0x3FA)) - 4;
  LODWORD(v69) = *(unsigned __int8 *)(v72 + (v68[14] ^ 0x86));
  LODWORD(v69) = (v69 ^ v63 ^ ((_DWORD)v69 << (v61 + 103))) << 8;
  v73 = *(_BYTE *)(v72 + (v68[10] ^ 0xCBLL));
  v74 = *(_QWORD *)(v65 + 8 * (int)(v61 & 0x896A60B4)) - 12;
  v75 = *(unsigned __int8 *)(v74 + (v68[1] ^ 0x1ALL));
  v76 = (v75 >> 1) ^ (((((v75 ^ 0xEA) + (v75 & 0xD5 ^ 0x3F) + 1) ^ v75 & 0xDF) & 0xF0) >> 4) ^ 0x1E;
  v77 = ((v68[3] ^ 0xB8) + *(_BYTE *)(v70 + (v68[3] ^ 0x54)) - 44) | (((v75 ^ (v76 - ((2 * v76) & 0xAA) - 43)) ^ 0xFC) << 16);
  LOBYTE(v75) = *(_BYTE *)(v72 + (v68[6] ^ 0x2ELL));
  v78 = (((*(unsigned __int8 *)(v71 + (v68[8] ^ 0x65)) + (v68[8] ^ 0x34) - 64) ^ 0xF5) << 24) | (((v73 ^ (16 * v73)) ^ 0xA2) << 8) | ((v68[11] ^ 0x3E) + *(_BYTE *)(v70 + (v68[11] ^ 0xD2)) - 44);
  v79 = *(_BYTE *)(v74 + (v68[13] ^ 0x5BLL)) ^ 0x3F;
  v80 = ((v68[7] ^ 0x90) + *(_BYTE *)(v70 + (v68[7] ^ 0x7CLL)) - 44) | ((((v68[4] ^ 0x13)
                                                                                         + *(unsigned __int8 *)(v71 + (v68[4] ^ 0x42))
                                                                                         - 64) ^ v67) << 24) | (((v75 ^ (16 * v75)) ^ 0xBE) << 8);
  v81 = *(unsigned __int8 *)(v74 + (v68[13] ^ 0x5BLL)) ^ 0x3F ^ (v79 >> 4) ^ (v79 >> 1);
  LODWORD(v69) = v69 & 0xFF00FFFF | ((v81 - ((2 * v81) & 0x2E) + 23) << 16);
  v343 = v72;
  v82 = v77 & 0xFFFF00FF | ((((*v68 ^ 0xD0) + *(unsigned __int8 *)(v71 + (*v68 ^ 0x81))) ^ 0x3C) << 24) | (((*(_BYTE *)(v72 + (v68[2] ^ 0x22)) ^ (16 * *(_BYTE *)(v72 + (v68[2] ^ 0x22)))) ^ 0x90) << 8);
  LOBYTE(v77) = *(_BYTE *)(v74 + (v68[5] ^ 0xEDLL));
  v83 = ((v77 ^ 0x3F) >> 4) ^ ((v77 ^ 0x3F) >> 1);
  v342 = v74;
  v344 = v71;
  v345 = v70;
  v84 = v78 & 0xFF00FFFF | (((*(_BYTE *)(v74 + (v68[9] ^ 0x38)) ^ ((*(_BYTE *)(v74 + (v68[9] ^ 0x38)) ^ 0x3F) >> 4) ^ ((*(_BYTE *)(v74 + (v68[9] ^ 0x38)) ^ 0x3F) >> 1)) ^ 0x94) << 16);
  LODWORD(STACK[0x400]) = (v69 & 0xFFFFFF00 | ((((v68[12] ^ 0x13) + *(unsigned __int8 *)(v71 + (v68[12] ^ 0x42)) - 64) ^ v67) << 24) | (*(_BYTE *)(v70 + (v68[15] ^ 0x38)) + (v68[15] ^ 0xD4) - 44)) ^ 0xAA0A6482;
  LODWORD(STACK[0x3C0]) = (v82 - 0x40000000) ^ 0x36BFEA95;
  LODWORD(STACK[0x2D0]) = (v80 & 0xFF00FFFF | ((v77 ^ 0x6C ^ (v83
                                                                                              + (~(2 * v83) | 7)
                                                                                              + 125)) << 16)) ^ 0xAFFB93CA;
  LODWORD(STACK[0x3D8]) = v84 ^ 0x796CD9DA;
  v340 = *(_BYTE **)(v66 + 392);
  v341 = *(unsigned __int8 **)(v66 + 384);
  STACK[0x3E0] = 14;
  HIDWORD(a17) = v61 - 456;
  LODWORD(v352) = (v61 - 456) ^ 0x248;
  LODWORD(v68) = *(unsigned __int8 *)(v72 + ((v61 + 56) ^ 0x48 ^ v341[14] ^ 0x44u));
  STACK[0x378] = 4;
  v85 = v341[4];
  v86 = v61 + 462;
  v87 = (((16 * (_DWORD)v68) ^ 0xFFFFFFD0) + (((16 * (_DWORD)v68) ^ 0xFFFFFFD0) >> 6 << 7) - 51) ^ v68;
  LOBYTE(v69) = *(_BYTE *)(v71 + (v85 ^ v67));
  STACK[0x410] = 15;
  v88 = v341[15];
  v89 = (v69 + (v85 ^ 0xB7) - 64) ^ 0xE5;
  if ((v88 & 0x20) != 0)
    v90 = -32;
  else
    v90 = 32;
  v91 = (v90 + v88);
  v92 = *(unsigned __int8 *)(v70 + (v91 ^ 0xDD));
  STACK[0x3D0] = 6;
  v93 = *(unsigned __int8 *)(v72 + (v341[6] ^ 0x51));
  v356 = v92 + (v91 ^ 0x31);
  STACK[0x2D8] = 12;
  STACK[0x290] = 0;
  HIDWORD(v94) = v93 ^ (((16 * v93) ^ 0xFFFFFFD0) + (((16 * v93) ^ 0xFFFFFFD0) >> 6 << 7) - 51) ^ 0x3F;
  LODWORD(v94) = BYTE4(v94) & 0xF8;
  v95 = ((v94 >> 3) | ((unint64_t)v89 << 13)) ^ 0x58F620A6;
  v96 = (v95 >> 21) | ((_DWORD)v95 << 11);
  v97 = *(unsigned __int8 *)(v71 + (v341[12] ^ 0xF7) - 2 * ((v341[12] ^ 0xF7) & 0xAEu) + 174) - (v341[12] ^ 0xF7);
  v98 = *v341;
  v99 = v98 ^ 0x76;
  LODWORD(v98) = *(unsigned __int8 *)(v71 + (v98 ^ 0xD8));
  STACK[0x388] = 3;
  v100 = v341[3];
  STACK[0x3B8] = 8;
  v101 = v98 + v99 - 2 * v99;
  v355 = (v100 ^ 0xFFFFFFBB) + *(unsigned __int8 *)(v70 + (v100 ^ 0x57));
  LOBYTE(v98) = (v341[8] ^ 0xA7) + *(_BYTE *)(v344 + (v341[8] ^ 0xF6));
  v102 = v98 - ((2 * v98) & 0x4E);
  STACK[0x380] = 7;
  v103 = (v341[7] ^ 0xE9) + *(_BYTE *)(v70 + (v341[7] ^ 5));
  STACK[0x250] = 13;
  v104 = *(unsigned __int8 *)(v74 + (v341[13] ^ 0x12));
  v105 = v104 ^ ((((v104 ^ 0x3Fu) >> 3) & 4 ^ v104 & 0xA4 | ((v104 ^ 0x3Fu) >> 3) & 0xFFFFFFFB ^ (v104 ^ 0x3F) & 0x5A) >> 1);
  v106 = *(_BYTE *)(v74 + (v341[5] ^ 0x9CLL));
  v107 = ((v106 ^ 0x3F) >> 4) ^ ((v106 ^ 0x3F) >> 1);
  STACK[0x248] = 9;
  v108 = (v103 - 44) | ((v106 ^ v67 ^ (v107 + (~(2 * v107) | 7) + 125)) << 16);
  v109 = *(unsigned __int8 *)(v74 + (v341[9] ^ 0x76));
  v110 = (2 * (v109 & 8)) ^ 0x10 | v109 & 8;
  v111 = (v109 ^ 0x3Fu) >> 3;
  v112 = ((v110 - 40) & v111) == 0;
  v113 = v110 | 0x41;
  v114 = 81 - v110;
  if (v112)
    v114 = v113;
  LODWORD(STACK[0x280]) = -1882277119;
  STACK[0x218] = 10;
  v115 = v109 ^ ((((v111 + v114 - 73) ^ (v109 ^ 0x3F) & 0xF7) & 0xFE) >> 1);
  v116 = *(unsigned __int8 *)(v74 + (v341[1] ^ 0xCFLL));
  v117 = v116 & 0xFFFFFFBF ^ ((v116 | 0xFFFFFFBF) + 68) ^ 0x3C;
  v118 = v117 ^ (v117 >> 4) ^ (v117 >> 1);
  LOBYTE(v117) = *(_BYTE *)(v343 + (v341[10] ^ 0xFBLL));
  v119 = (v117 ^ (16 * v117)) ^ 0xA4;
  v120 = *(_QWORD *)(v65 + 8 * (v86 - 1224));
  HIDWORD(v351) = v105;
  v121 = *(_DWORD *)(v120 + 4 * (v105 ^ 0x58));
  v122 = v86;
  v123 = *(_QWORD *)(v65 + 8 * (v86 ^ 0x5F4)) - 12;
  v350 = __PAIR64__(v118, v119);
  v124 = *(_DWORD *)(v123 + 4 * (v119 ^ 0x8Fu));
  HIDWORD(v125) = v124 ^ 0xC321;
  LODWORD(v125) = v124 ^ 0x75A00000;
  HIDWORD(v349) = v101 - 65;
  HIDWORD(v357) = v122;
  v126 = *(_QWORD *)(v65 + 8 * (v122 - 1188)) - 8;
  v127 = (v125 >> 16) ^ *(_DWORD *)(v126 + 4 * ((v101 - 65) ^ 0xF9u)) ^ (16 * (v121 ^ 0xDC3BAE14)
                                                                                          + 2066553869
                                                                                          - ((32 * (v121 ^ 0xDC3BAE14)) & 0xF65A3800));
  v128 = v121 ^ (v127 + 49800859 - ((2 * v127) & 0x5EFCD36));
  HIDWORD(v352) = v87;
  v129 = *(_DWORD *)(v123 + 4 * (v87 ^ 0x71u));
  HIDWORD(v125) = v129 ^ 0xC321;
  LODWORD(v125) = v129 ^ 0x75A00000;
  LODWORD(v349) = v108 ^ v96;
  v130 = v108 ^ v96 ^ 0xDD03A24B;
  v131 = *(_QWORD *)(v65 + 8 * (v122 ^ 0x54F)) - 8;
  v132 = *(_DWORD *)(v120 + 4 * (v118 ^ 0xBFu));
  v133 = *(_DWORD *)(v131 + 4 * (v130 ^ 0x33u)) ^ v128;
  v134 = (v125 >> 16) ^ (16 * (v132 ^ 0xDC3BAE14) + 2066553869 - ((32 * (v132 ^ 0xDC3BAE14)) & 0xF65A3800)) ^ *(_DWORD *)(v126 + 4 * HIBYTE(v130));
  HIDWORD(v348) = (*(_BYTE *)(v345 + (v341[11] ^ 0x12)) + (v341[11] ^ 0xFE) - 44);
  v135 = *(_DWORD *)(v131 + 4 * (HIDWORD(v348) ^ 0xB9u)) ^ v132 ^ 0xDC3BAE14 ^ (v134
                                                                                + 49800859
                                                                                - ((2 * v134) & 0x5EFCD36));
  v136 = *(_DWORD *)(v120 + 4 * BYTE2(v130)) ^ 0xDC3BAE14;
  v137 = *(unsigned __int8 *)(v343 + (v341[2] ^ 0x26)) ^ 0x75;
  v138 = v137 ^ (16 * v137);
  v139 = *(_DWORD *)(v123 + 4 * (v138 ^ 0xFBu));
  HIDWORD(v125) = v139 ^ 0xC321;
  LODWORD(v125) = v139 ^ 0x75A00000;
  LODWORD(v347) = (v102 - 25);
  HIDWORD(v347) = v138;
  v140 = (v125 >> 16) ^ *(_DWORD *)(v126 + 4 * (v347 ^ 0x40)) ^ (16 * v136
                                                                               + 2066553869
                                                                               - ((32 * v136) & 0xF65A3800));
  LODWORD(v348) = v356 - 44;
  v141 = *(_DWORD *)(v131 + 4 * ((v356 - 44) ^ 0xEBu)) ^ v136;
  v142 = *(_DWORD *)(v123 + 4 * (BYTE1(v96) ^ 0x31u));
  HIDWORD(v125) = v142 ^ 0xC321;
  LODWORD(v125) = v142 ^ 0x75A00000;
  v143 = v141 ^ (v140 + 49800859 - ((2 * v140) & 0x5EFCD36));
  HIDWORD(v346) = v97 - 65;
  v144 = *(_DWORD *)(v126 + 4 * ((v97 - 65) ^ 0xF7u));
  LODWORD(v351) = v115;
  v145 = *(_DWORD *)(v120 + 4 * (v115 ^ 0x43u)) ^ 0xDC3BAE14;
  v146 = (v125 >> 16) ^ v144 ^ (16 * v145 + 2066553869 - ((32 * v145) & 0xF65A3800));
  LODWORD(v346) = v355 - 44;
  v147 = *(_DWORD *)(v131 + 4 * ((v355 - 44) ^ 0x33u)) ^ v145 ^ (v146
                                                                                  + 49800859
                                                                                  - ((2 * v146) & 0x5EFCD36));
  v148 = *(_DWORD *)(v120 + 4 * (BYTE2(v147) ^ 0xBBu)) ^ 0xDC3BAE14;
  v149 = *(_DWORD *)(v123 + 4 * (BYTE1(v143) ^ 0xF4u));
  HIDWORD(v125) = v149 ^ 0xC321;
  LODWORD(v125) = v149 ^ 0x75A00000;
  v150 = BYTE1(v135) ^ 0xAD;
  v151 = v148 ^ *(_DWORD *)(v126 + 4 * (HIBYTE(v133) ^ 0x8B)) ^ *(_DWORD *)(v131
                                                                            + 4 * (v135 ^ 0xDBu)) ^ (16 * v148 + 2066553869 - ((32 * v148) & 0xF65A3800)) ^ (v125 >> 16);
  v152 = *(_DWORD *)(v120 + 4 * (BYTE2(v133) ^ 0xD7u));
  v153 = *(_DWORD *)(v123 + 4 * ((unsigned __int16)(v147 ^ 0x22E) >> 8));
  HIDWORD(v125) = v153 ^ 0xC321;
  LODWORD(v125) = v153 ^ 0x75A00000;
  v154 = (16 * (v152 ^ 0xDC3BAE14) + 2066553869 - ((32 * (v152 ^ 0xDC3BAE14)) & 0xF65A3800)) ^ *(_DWORD *)(v126 + 4 * ((v135 ^ 0xF15ADDB) >> 24)) ^ (v125 >> 16);
  v155 = *(_DWORD *)(v131 + 4 * (v143 ^ 0x80u)) ^ v152 ^ (v154 + 49800859 - ((2 * v154) & 0x5EFCD36));
  v156 = *(_DWORD *)(v120 + 4 * (BYTE2(v135) ^ 0xD6u)) ^ 0xDC3BAE14;
  v157 = (16 * v156 + 2066553869 - ((32 * v156) & 0xF65A3800)) ^ *(_DWORD *)(v126 + 4 * (HIBYTE(v143) ^ 0x19));
  v158 = *(_DWORD *)(v123 + 4 * (BYTE1(v133) ^ 0x48u));
  HIDWORD(v125) = v158 ^ 0xC321;
  LODWORD(v125) = v158 ^ 0x75A00000;
  v159 = *(_DWORD *)(v131 + 4 * (v147 ^ 0x2Eu)) ^ v156 ^ (v125 >> 16);
  v160 = *(_DWORD *)(v120 + 4 * (BYTE2(v143) ^ 0x32u));
  v161 = *(_DWORD *)(v123 + 4 * v150);
  HIDWORD(v125) = v161 ^ 0xC321;
  LODWORD(v125) = v161 ^ 0x75A00000;
  v162 = (v125 >> 16) ^ *(_DWORD *)(v126 + 4 * (HIBYTE(v147) ^ 0xBD)) ^ (16 * (v160 ^ 0xDC3BAE14)
                                                                         + 2066553869
                                                                         - ((32 * (v160 ^ 0xDC3BAE14)) & 0xF65A3800));
  v163 = v160 ^ *(_DWORD *)(v131 + 4 * (v133 ^ 0xB4u)) ^ 0xADF278D0 ^ (v162
                                                                                        + 49800859
                                                                                        - ((2 * v162) & 0x5EFCD36));
  v164 = v163
       - ((2 * v163) & 0x5F186BF6)
       + 797718011
       - ((2 * (v163 - ((2 * v163) & 0x5F186BF6) + 797718011)) & 0xC8012BD6)
       + 1677759979;
  v165 = *(_DWORD *)(v120 + 4 * (BYTE2(v164) ^ 0xC3u));
  v166 = v159 ^ (v157 + 49800859 - ((2 * v157) & 0x5EFCD36));
  BYTE2(v162) = BYTE2(v166) ^ 0xEB;
  v167 = *(_DWORD *)(v123 + 4 * ((unsigned __int16)(v166 ^ 0xDFF9) >> 8));
  v168 = (16 * (v165 ^ 0xDC3BAE14) + 2066553869 - ((32 * (v165 ^ 0xDC3BAE14)) & 0xF65A3800)) ^ *(_DWORD *)(v126 + 4 * (HIBYTE(v151) ^ 0x94)) ^ (((v167 ^ 0x75A0C321u) >> (v151 & 0x10 ^ 0x10) >> (v151 & 0x10)) + ((v167 << 16) ^ 0xC3210000));
  v169 = *(_DWORD *)(v131 + 4 * (v155 ^ 0xCDu)) ^ v165 ^ (v168 + 49800859 - ((2 * v168) & 0x5EFCD36));
  v151 ^= 0x7DAD32BBu;
  v170 = *(_DWORD *)(v120 + 4 * BYTE2(v151)) ^ 0xDC3BAE14;
  v171 = *(_DWORD *)(v123 + 4 * (BYTE1(v164) ^ 6u));
  HIDWORD(v125) = v171 ^ 0xC321;
  LODWORD(v125) = v171 ^ 0x75A00000;
  v172 = (16 * v170 + 2066553869 - ((32 * v170) & 0xF65A3800)) ^ *(_DWORD *)(v126 + 4 * (HIBYTE(v155) ^ 0x97)) ^ (v125 >> 16);
  v173 = *(_DWORD *)(v131 + 4 * (v166 ^ 0xF9u));
  v174 = *(_DWORD *)(v126 + 4 * (HIBYTE(v166) ^ 5));
  HIDWORD(v125) = v174 ^ 0xD;
  LODWORD(v125) = v174 ^ 0x7B2D1C00;
  v175 = v125 >> 10;
  v176 = v173 ^ v170 ^ (v172 + 49800859 - ((2 * v172) & 0x5EFCD36));
  v177 = *(_DWORD *)(v123 + 4 * BYTE1(v151));
  HIDWORD(v125) = v177 ^ 0xC321;
  LODWORD(v125) = v177 ^ 0x75A00000;
  v178 = *(_DWORD *)(v120 + 4 * (BYTE2(v155) ^ 0xEu)) ^ 0xDC3BAE14;
  v179 = (unint64_t)(v175 ^ 0x25EB099Cu) << 10;
  v180 = *(_DWORD *)(v131 + 4 * (v164 ^ 0xD8u)) ^ v178 ^ (v125 >> 16) ^ ((v179 ^ (16 * v178) ^ HIDWORD(v179))
                                                                                          + 49800859
                                                                                          - 2
                                                                                          * ((v179 ^ (16 * v178) ^ HIDWORD(v179)) & 0x2F7E69F ^ BYTE4(v179) & 4));
  v181 = *(_DWORD *)(v123 + 4 * (BYTE1(v155) ^ 0x63u));
  HIDWORD(v125) = v181 ^ 0xC321;
  LODWORD(v125) = v181 ^ 0x75A00000;
  v182 = *(_DWORD *)(v120 + 4 * BYTE2(v162)) ^ 0xDC3BAE14;
  v183 = (v125 >> 16) ^ (16 * v182 + 2066553869 - ((32 * v182) & 0xF65A3800)) ^ *(_DWORD *)(v126
                                                                                          + 4 * (HIBYTE(v164) ^ 0x8D));
  v184 = *(_DWORD *)(v131 + 4 * (v151 ^ 0x33u)) ^ v182 ^ (v183 + 49800859 - ((2 * v183) & 0x5EFCD36));
  v185 = *(_DWORD *)(v120 + 4 * (BYTE2(v184) ^ 0x62u)) ^ 0xDC3BAE14;
  v186 = (16 * v185 + 2066553869 - ((32 * v185) & 0xF65A3800)) ^ *(_DWORD *)(v126 + 4 * (HIBYTE(v169) ^ 1));
  v187 = v180 ^ 0xF1F7E4A6;
  v188 = *(_DWORD *)(v123 + 4 * ((unsigned __int16)(v180 ^ 0xE4A6) >> 8));
  HIDWORD(v125) = v188 ^ 0xC321;
  LODWORD(v125) = v188 ^ 0x75A00000;
  v189 = *(_DWORD *)(v131 + 4 * (v176 ^ 0x68u)) ^ v185 ^ (v125 >> 16) ^ (v186
                                                                                          + 49800859
                                                                                          - ((2 * v186) & 0x5EFCD36));
  v190 = *(_DWORD *)(v120 + 4 * (BYTE2(v169) ^ 0x60u)) ^ 0xDC3BAE14;
  v191 = *(_DWORD *)(v123 + 4 * ((unsigned __int16)(v184 ^ 0x2957) >> 8));
  HIDWORD(v125) = v191 ^ 0xC321;
  LODWORD(v125) = v191 ^ 0x75A00000;
  v192 = (16 * v190 + 2066553869 - ((32 * v190) & 0xF65A3800)) ^ *(_DWORD *)(v126 + 4 * (HIBYTE(v176) ^ 0xCE)) ^ (v125 >> 16);
  v193 = *(_DWORD *)(v131 + 4 * (v180 ^ 0x15u)) ^ v190 ^ (v192 + 49800859 - ((2 * v192) & 0x5EFCD36));
  v194 = *(_DWORD *)(v120 + 4 * (BYTE2(v176) ^ 0x60u)) ^ 0xDC3BAE14;
  v195 = *(_DWORD *)(v123 + 4 * (BYTE1(v169) ^ 0x35u));
  HIDWORD(v125) = v195 ^ 0xC321;
  LODWORD(v125) = v195 ^ 0x75A00000;
  v196 = (16 * v194 + 2066553869 - ((32 * v194) & 0xF65A3800)) ^ *(_DWORD *)(v126 + 4 * HIBYTE(v187)) ^ (v125 >> 16);
  v197 = *(_DWORD *)(v131 + 4 * (v184 ^ 0x57u)) ^ v194 ^ (v196 + 49800859 - ((2 * v196) & 0x5EFCD36));
  if ((v176 & 0x1000) != 0)
    v198 = -16;
  else
    v198 = 16;
  v199 = *(_DWORD *)(v120 + 4 * BYTE2(v187)) ^ 0xDC3BAE14;
  v200 = *(_DWORD *)(v123 + 4 * (((BYTE1(v176) ^ 0xC) + v198) ^ 0x83u));
  v201 = *(_DWORD *)(v126 + 4 * (HIBYTE(v184) ^ 0xA1)) ^ HIWORD(v200) ^ (v200 << 16) ^ (16 * v199
                                                                                        + 2066553869
                                                                                        - ((32 * v199) & 0xF65A3800)) ^ 0xC32175A0;
  v202 = *(_DWORD *)(v131 + 4 * (v169 ^ 0x77u)) ^ v199 ^ (v201 + 49800859 - ((2 * v201) & 0x5EFCD36));
  v203 = v202 ^ 0xEFBC3B44;
  v204 = *(_DWORD *)(v120 + 4 * ((v202 ^ 0xEFBC3B44) >> 16)) ^ 0xDC3BAE14;
  v205 = *(_DWORD *)(v123 + 4 * ((unsigned __int16)(v197 ^ 0x8D48) >> 8));
  HIDWORD(v206) = v205 ^ 0xC321;
  LODWORD(v206) = v205 ^ 0x75A00000;
  v207 = (v206 >> 16) ^ *(_DWORD *)(v126 + 4 * (HIBYTE(v189) ^ 0xCC)) ^ (16 * v204
                                                                         + 2066553869
                                                                         - ((32 * v204) & 0xF65A3800));
  v208 = *(_DWORD *)(v131 + 4 * (v193 ^ 0xA9u)) ^ v204 ^ (v207 + 49800859 - ((2 * v207) & 0x5EFCD36));
  LOWORD(v204) = v189 ^ 0xD583;
  v209 = *(_DWORD *)(v120 + 4 * (((v189 ^ 0x255FD583) >> 16) ^ 0xC3u)) ^ 0xDC3BAE14;
  v210 = *(_DWORD *)(v123 + 4 * ((unsigned __int16)(v202 ^ 0x3B44) >> 8));
  HIDWORD(v206) = v210 ^ 0xC321;
  LODWORD(v206) = v210 ^ 0x75A00000;
  v211 = (v206 >> 16) ^ *(_DWORD *)(v126 + 4 * HIBYTE(v193)) ^ (16 * v209 + 2066553869 - ((32 * v209) & 0xF65A3800));
  v212 = *(_DWORD *)(v131 + 4 * (v197 ^ 0x48u)) ^ v209 ^ (v211 + 49800859 - ((2 * v211) & 0x5EFCD36));
  v213 = *(_DWORD *)(v120 + 4 * ((v193 ^ 0xE93411A9) >> 16)) ^ 0xDC3BAE14;
  v214 = *(_DWORD *)(v123 + 4 * BYTE1(v204));
  HIDWORD(v206) = v214 ^ 0xC321;
  LODWORD(v206) = v214 ^ 0x75A00000;
  v215 = (16 * v213 + 2066553869 - ((32 * v213) & 0xF65A3800)) ^ *(_DWORD *)(v126 + 4 * ((v197 ^ 0x807D8D48) >> 24)) ^ (v206 >> 16);
  v216 = *(_DWORD *)(v123 + 4 * (BYTE1(v193) ^ 0x82u));
  v217 = *(_DWORD *)(v131 + 4 * (v202 ^ 0x77u)) ^ v213;
  HIDWORD(v206) = v216 ^ 0xC321;
  LODWORD(v206) = v216 ^ 0x75A00000;
  v218 = *(_DWORD *)(v120 + 4 * (BYTE2(v197) ^ 0xBEu)) ^ 0xDC3BAE14;
  v219 = (v206 >> 16) ^ *(_DWORD *)(v126 + 4 * HIBYTE(v203)) ^ (16 * v218 + 2066553869 - ((32 * v218) & 0xF65A3800));
  v220 = *(_DWORD *)(v131 + 4 * v204) ^ v218 ^ (v219 + 49800859 - ((2 * v219) & 0x5EFCD36));
  v221 = v217 ^ (v215 + 49800859 - ((2 * v215) & 0x5EFCD36));
  v222 = *(_DWORD *)(v120 + 4 * ((v220 ^ 0x950DA39D) >> 16)) ^ 0xDC3BAE14;
  v223 = (16 * v222 + 2066553869 - ((32 * v222) & 0xF65A3800)) ^ *(_DWORD *)(v126 + 4 * ((v208 ^ 0x11521BCAu) >> 24));
  v224 = *(_DWORD *)(v123 + 4 * (BYTE1(v221) ^ 0x89u));
  HIDWORD(v206) = v224 ^ 0xC321;
  LODWORD(v206) = v224 ^ 0x75A00000;
  BYTE1(v224) = BYTE1(v212) ^ 0xD1;
  v225 = *(_DWORD *)(v131 + 4 * (v212 ^ 0x88u)) ^ v222 ^ (v206 >> 16) ^ 0x71C9D6C4 ^ (v223 + 49800859 - ((2 * v223) & 0x5EFCD36));
  v226 = *(_DWORD *)(v120 + 4 * ((v208 ^ 0x11521BCAu) >> 16));
  v227 = *(_DWORD *)(v123 + 4 * (BYTE1(v220) ^ 0x30u));
  HIDWORD(v206) = v227 ^ 0xC321;
  LODWORD(v206) = v227 ^ 0x75A00000;
  v228 = (16 * (v226 ^ 0xDC3BAE14) + 2066553869 - ((32 * (v226 ^ 0xDC3BAE14)) & 0xF65A3800)) ^ *(_DWORD *)(v126 + 4 * (HIBYTE(v212) ^ 0xDF)) ^ (v206 >> 16);
  v221 ^= 0x7A851A70u;
  v229 = *(_DWORD *)(v131 + 4 * (v221 ^ 0x33u)) ^ v226 ^ (v228 + 49800859 - ((2 * v228) & 0x5EFCD36));
  v230 = *(_DWORD *)(v120 + 4 * (BYTE2(v212) ^ 0xA7u)) ^ 0xDC3BAE14;
  v231 = *(_DWORD *)(v123 + 4 * (BYTE1(v208) ^ 0x88u));
  HIDWORD(v206) = v231 ^ 0xC321;
  LODWORD(v206) = v231 ^ 0x75A00000;
  v232 = (16 * v230 + 2066553869 - ((32 * v230) & 0xF65A3800)) ^ *(_DWORD *)(v126
                                                                           + 4
                                                                           * ((HIBYTE(v221) ^ -HIBYTE(v221) ^ ((HIBYTE(v221) ^ 0xFFFFFF16) + 234))
                                                                            + 233)) ^ (v206 >> 16);
  v233 = *(_DWORD *)(v131 + 4 * (v220 ^ 0x9Du)) ^ v230 ^ (v232 + 49800859 - ((2 * v232) & 0x5EFCD36));
  v234 = *(_DWORD *)(v120 + 4 * BYTE2(v221));
  v235 = *(_DWORD *)(v123 + 4 * BYTE1(v224));
  HIDWORD(v206) = v235 ^ 0xC321;
  LODWORD(v206) = v235 ^ 0x75A00000;
  v236 = (v206 >> 16) ^ *(_DWORD *)(v126 + 4 * (HIBYTE(v220) ^ 0x7C)) ^ (16 * (v234 ^ 0xDC3BAE14)
                                                                         + 2066553869
                                                                         - ((32 * (v234 ^ 0xDC3BAE14)) & 0xF65A3800));
  v237 = *(_DWORD *)(v131 + 4 * (v208 ^ 0xF9u)) ^ v234 ^ (v236 + 49800859 - ((2 * v236) & 0x5EFCD36));
  v238 = *(_DWORD *)(v123 + 4 * ((unsigned __int16)(v233 ^ 0xDE69) >> 8));
  HIDWORD(v206) = v238 ^ 0xC321;
  LODWORD(v206) = v238 ^ 0x75A00000;
  v239 = *(_DWORD *)(v120 + 4 * (BYTE2(v237) ^ 0xBCu));
  v240 = v225 - ((2 * v225) & 0x74EE5E36) - 1166594277;
  v241 = (v206 >> 16) ^ *(_DWORD *)(v126 + 4 * (HIBYTE(v240) ^ 0xD3)) ^ (16 * (v239 ^ 0xDC3BAE14)
                                                                         + 2066553869
                                                                         - ((32 * (v239 ^ 0xDC3BAE14)) & 0xF65A3800));
  v242 = *(_DWORD *)(v131 + 4 * (v229 ^ 0xC7u)) ^ v239 ^ (v241 + 49800859 - ((2 * v241) & 0x5EFCD36));
  v243 = *(_DWORD *)(v123 + 4 * (BYTE1(v237) ^ 0x91u));
  HIDWORD(v206) = v243 ^ 0xC321;
  LODWORD(v206) = v243 ^ 0x75A00000;
  v244 = *(_DWORD *)(v120 + 4 * (BYTE2(v240) ^ 0x1Du)) ^ 0xDC3BAE14;
  v245 = v244 ^ *(_DWORD *)(v126 + 4 * (HIBYTE(v229) ^ 1)) ^ *(_DWORD *)(v131 + 4 * (v233 ^ 0x69u)) ^ ((v206 >> 16) + 49800859 - ((2 * (v206 >> 16)) & 0x5EFCD36)) ^ (16 * v244 + 2066553869 - ((32 * v244) & 0xF65A3800));
  v246 = *(_DWORD *)(v120 + 4 * (BYTE2(v229) ^ 0xC1u)) ^ 0xDC3BAE14;
  v247 = *(_DWORD *)(v123 + 4 * (BYTE1(v240) ^ 0x44u));
  HIDWORD(v206) = v247 ^ 0xC321;
  LODWORD(v206) = v247 ^ 0x75A00000;
  v248 = (16 * v246 + 2066553869 - ((32 * v246) & 0xF65A3800)) ^ *(_DWORD *)(v126 + 4 * ((v233 ^ 0x5FEEDE69u) >> 24)) ^ (v206 >> 16);
  v249 = *(_DWORD *)(v131
                   + 4
                   * ((((v237 ^ 0x5B) + (v237 ^ 0xFFFFFF97) + 1) ^ 0xFFFFFFFE)
                    + (v237 ^ 0x5B))) ^ v246 ^ (v248 + 49800859 - ((2 * v248) & 0x5EFCD36));
  v250 = *(_DWORD *)(v120 + 4 * (BYTE2(v233) ^ 0x2Du)) ^ 0xDC3BAE14;
  v251 = *(_DWORD *)(v123 + 4 * (BYTE1(v229) ^ 0x71u));
  HIDWORD(v206) = v251 ^ 0xC321;
  LODWORD(v206) = v251 ^ 0x75A00000;
  v252 = (v206 >> 16) ^ (16 * v250 + 2066553869 - ((32 * v250) & 0xF65A3800)) ^ *(_DWORD *)(v126
                                                                                          + 4
                                                                                          * ((HIBYTE(v237) ^ 0xC9) & 0x90 ^ 0x86u ^ (~(2 * (HIBYTE(v237) ^ 0xC9 | 0x90)) + (HIBYTE(v237) ^ 0xC9 | 0x90))));
  v253 = *(_DWORD *)(v131 + 4 * (v240 ^ 0x40u)) ^ v250 ^ (v252 + 49800859 - ((2 * v252) & 0x5EFCD36));
  v254 = *(_DWORD *)(v120 + 4 * ((v253 ^ 0x59A5F4B7) >> 16)) ^ 0xDC3BAE14;
  v255 = *(_DWORD *)(v123 + 4 * ((unsigned __int16)(v249 ^ 0x872B) >> 8));
  HIDWORD(v206) = v255 ^ 0xC321;
  LODWORD(v206) = v255 ^ 0x75A00000;
  v256 = (16 * v254 + 2066553869 - ((32 * v254) & 0xF65A3800)) ^ *(_DWORD *)(v126 + 4 * (HIBYTE(v242) ^ 0xE)) ^ (v206 >> 16);
  v257 = *(_DWORD *)(v131 + 4 * (v245 ^ 0xEEu)) ^ v254 ^ (v256 + 49800859 - ((2 * v256) & 0x5EFCD36));
  v258 = *(_DWORD *)(v120 + 4 * (BYTE2(v242) ^ 0x1Eu)) ^ 0xDC3BAE14;
  v259 = *(_DWORD *)(v123 + 4 * (BYTE1(v253) ^ 0x67u));
  HIDWORD(v206) = v259 ^ 0xC321;
  LODWORD(v206) = v259 ^ 0x75A00000;
  v260 = v258 ^ *(_DWORD *)(v126 + 4 * (HIBYTE(v245) ^ 0xD6)) ^ *(_DWORD *)(v131
                                                                            + 4 * (v249 ^ 0x18u)) ^ (16 * v258 + 2066553869 - ((32 * v258) & 0xF65A3800)) ^ ((v206 >> 16) + 49800859 - ((2 * (v206 >> 16)) & 0x5EFCD36));
  v261 = *(_DWORD *)(v120 + 4 * (BYTE2(v245) ^ 0x56u)) ^ 0xDC3BAE14;
  v262 = *(_DWORD *)(v123 + 4 * (BYTE1(v242) ^ 0x15u));
  HIDWORD(v206) = v262 ^ 0xC321;
  LODWORD(v206) = v262 ^ 0x75A00000;
  v263 = *(_DWORD *)(v126 + 4 * ((v249 ^ 0x911B872B) >> 24)) ^ v261 ^ 0x6D41727E ^ (16 * v261
                                                                                    + 2066553869
                                                                                    - ((32 * v261) & 0xF65A3800)) ^ (v206 >> 16);
  HIDWORD(v206) = *(_DWORD *)(v131 + 4 * (v253 ^ 0xB7u)) ^ 0x1E7F4221;
  LODWORD(v206) = HIDWORD(v206);
  v264 = (v206 >> 21) ^ __ROR4__(v263, 21);
  v265 = *(_DWORD *)(v120 + 4 * (BYTE2(v249) ^ 0xD8u)) ^ 0xDC3BAE14;
  v266 = *(_DWORD *)(v123 + 4 * (BYTE1(v245) ^ 0xE4u));
  HIDWORD(v206) = v266 ^ 0xC321;
  LODWORD(v206) = v266 ^ 0x75A00000;
  v267 = (v206 >> 16) ^ *(_DWORD *)(v126 + 4 * (HIBYTE(v253) ^ 0xB0)) ^ (16 * v265
                                                                         + 2066553869
                                                                         - ((32 * v265) & 0xF65A3800));
  v268 = *(_DWORD *)(v131 + 4 * (v242 ^ 0xB2u)) ^ v265 ^ (v267 + 49800859 - ((2 * v267) & 0x5EFCD36));
  v269 = *(_DWORD *)(v120 + 4 * (BYTE2(v257) ^ 0x74u)) ^ 0xDC3BAE14;
  v270 = *(_DWORD *)(v123 + 4 * (BYTE1(v268) ^ 0x66u));
  HIDWORD(v206) = v270 ^ 0xC321;
  LODWORD(v206) = v270 ^ 0x75A00000;
  v271 = v260 ^ 0x177CD9D9;
  v272 = *(_DWORD *)(v126 + 4 * ((v260 ^ 0x177CD9D9u) >> 24)) ^ 0x6D41727E ^ v269 ^ (v206 >> 16) ^ (16 * v269 + 2066553869 - ((32 * v269) & 0xF65A3800));
  HIDWORD(v206) = v264 ^ 0x549BF9D9;
  LODWORD(v206) = v264 ^ 0x549BF9D9;
  v273 = v206 >> 11;
  v274 = (v272 & 0x200 ^ 0x7FDFFEE7) + 2 * (v272 & 0x200);
  v275 = *(_DWORD *)(v131 + 4 * ((v206 >> 11) ^ 0xEFu));
  v112 = ((v274 - 2145386215) & (v275 ^ 0x2F7E69B)) == 0;
  v276 = *(_DWORD *)(v120 + 4 * (BYTE2(v268) ^ 0x72u)) ^ 0xDC3BAE14;
  v277 = *(_DWORD *)(v123 + 4 * (BYTE1(v273) ^ 0xA0u));
  HIDWORD(v206) = v277 ^ 0xC321;
  LODWORD(v206) = v277 ^ 0x75A00000;
  v278 = (v206 >> 16) ^ *(_DWORD *)(v126 + 4 * ((v257 ^ 0xD4B73D47) >> 24)) ^ (16 * v276
                                                                               + 2066553869
                                                                               - ((32 * v276) & 0xF65A3800));
  v279 = *(_DWORD *)(v131 + 4 * (v260 ^ 0xEAu)) ^ v276 ^ (v278 + 49800859 - ((2 * v278) & 0x5EFCD36));
  v280 = v274 - 239141540;
  v281 = -243336406 - v274;
  if (v112)
    v281 = v280;
  v282 = ((v275 ^ 0x1E7F4221) - 1906244675 + v281) ^ v272 & 0xFFFFFDFF;
  v283 = *(_DWORD *)(v120 + 4 * BYTE2(v271)) ^ 0xDC3BAE14;
  v284 = (16 * v283 + 2066553869 - ((32 * v283) & 0xF65A3800)) ^ *(_DWORD *)(v126 + 4 * ((v273 ^ 0x1EA133EFu) >> 24));
  v285 = *(_DWORD *)(v123 + 4 * (BYTE1(v257) ^ 0xAEu));
  HIDWORD(v286) = v285 ^ 0xC321;
  LODWORD(v286) = v285 ^ 0x75A00000;
  v287 = *(_DWORD *)(v131 + 4 * (v268 ^ 0xDu)) ^ v283 ^ (v286 >> 16) ^ (v284
                                                                                         + 49800859
                                                                                         - ((2 * v284) & 0x5EFCD36));
  v288 = *(_DWORD *)(v120 + 4 * (BYTE2(v273) ^ 0x62u)) ^ 0xDC3BAE14;
  v289 = *(_DWORD *)(v123 + 4 * BYTE1(v271));
  HIDWORD(v286) = v289 ^ 0xC321;
  LODWORD(v286) = v289 ^ 0x75A00000;
  v290 = (16 * v288 + 2066553869 - ((32 * v288) & 0xF65A3800)) ^ *(_DWORD *)(v126 + 4 * (HIBYTE(v268) ^ 0x32)) ^ (v286 >> 16);
  v291 = *(_DWORD *)(v131 + 4 * (v257 ^ 0x74u)) ^ v288 ^ (v290 + 49800859 - ((2 * v290) & 0x5EFCD36));
  v292 = (char *)*(&off_24C363D30 + HIDWORD(v357) - 1178) - 12;
  v293 = (char *)*(&off_24C363D30 + (HIDWORD(v357) ^ 0x535)) - 12;
  v294 = (char *)*(&off_24C363D30 + HIDWORD(v357) - 1278) - 12;
  v295 = *(_DWORD *)&v293[4 * (BYTE2(v279) ^ 0x99)] ^ 0x83F7793D;
  v296 = (uint64_t)*(&off_24C363D30 + HIDWORD(v357) - 1225);
  v297 = v291 ^ 0x250E7C9C;
  v298 = *(_DWORD *)(v296
                   + 4
                   * ((unsigned __int16)(*(_WORD *)(v131 + 4 * (v257 ^ 0x74u)) ^ v288 ^ (v290 - 6501 - ((2 * v290) & 0xCD36)) ^ 0x7C9C) >> 8)) ^ 0x5805B471;
  v299 = (*(_DWORD *)&v292[4 * (((v282 ^ 0xF137909F) >> 24) ^ 0xB4)]
        + (((v282 ^ 0xF137909F) >> 24) ^ 0x9FD52929)
        - 1197324801) ^ ((v287 ^ 0x7B)
                       + 1898816755
                       + ((2 * (((v287 ^ 0xBC37B) + 112) & 0x8A ^ (v287 ^ 0xBC37B | 0x7FFFFFF7))) ^ 0xE8602011)) ^ v295 ^ (v295 >> 2) ^ *(_DWORD *)&v294[4 * (v287 ^ 0x79)] ^ (v295 >> 4) ^ v298 ^ (1515496080 * v298);
  v300 = HIBYTE(v287);
  v301 = v279 ^ 0xA6;
  v302 = *(_DWORD *)&v292[4 * (((v279 ^ 0x6792B6A6u) >> 24) ^ 0xB4)];
  LODWORD(v354) = *(_DWORD *)&v292[4 * (HIBYTE(v287) ^ 0xB4)];
  LODWORD(v357) = *(_DWORD *)&v292[4 * (((v291 ^ 0x250E7C9Cu) >> 24) ^ 0xB4)];
  v303 = *(_DWORD *)&v293[4 * (BYTE2(v291) ^ 5)];
  v304 = *(_DWORD *)&v293[4 * ((v282 ^ 0xF137909F) >> 16)];
  HIDWORD(v354) = *(_DWORD *)&v293[4 * ((v287 ^ 0xBC37B) >> 16)];
  v305 = *(_DWORD *)(v296 + 4 * ((unsigned __int16)(v287 ^ 0xC37B) >> 8));
  LODWORD(v353) = *(_DWORD *)(v296 + 4 * ((unsigned __int16)(v279 ^ 0xB6A6) >> 8));
  v306 = *(_DWORD *)(v296 + 4 * (BYTE1(v282) ^ 0x5Eu));
  LODWORD(v296) = *(_DWORD *)&v294[4 * (v282 ^ 0x9D)];
  v307 = *(_DWORD *)&v294[4 * (v291 ^ 0x9E)];
  HIDWORD(v353) = *(_DWORD *)&v294[4 * (v279 ^ 0xA4)];
  v308 = (v299 - 1342467126 - ((2 * v299) & 0x5FF727C4) + 24) ^ LODWORD(STACK[0x2D0]);
  v309 = (uint64_t)*(&off_24C363D30 + HIDWORD(v357) - 1269);
  v340[5] = *(_BYTE *)(v309 + (((v308 ^ 0x5244C6B3) >> 16) ^ 0x5ELL)) ^ ((v308 ^ 0x5244C6B3) >> 16) ^ 0x8A ^ ((((v308 ^ 0x5244C6B3) >> 16) ^ 0x8A) - ((2 * (((v308 ^ 0x5244C6B3) >> 16) ^ 0x8A) - 18) & 0xD2) - 32) ^ 0xB9;
  v310 = v303 ^ 0x83F7793D ^ ((((v279 ^ 0x6792B6A6u) >> 24) ^ 0x9FD52929) - 1197324801 + v302) ^ ((v303 ^ 0x83F7793D) >> 2) ^ ((v303 ^ 0x83F7793D) >> 4) ^ v305 ^ 0x5805B471 ^ v296 ^ (1515496080 * (v305 ^ 0x5805B471)) ^ ((v282 ^ 0x9F) + 1898816755 + ((2 * (((v282 ^ 0xF137909F) + 112) & 0x8F ^ (v282 ^ 0xF137909F | 0x7FFFFFF2))) ^ 0xE860201B));
  v311 = (v310 + 918546990 - ((2 * v310) & 0x6D7FD45C)) ^ LODWORD(STACK[0x3C0]);
  v312 = v311 ^ 0x22A932A6;
  v313 = (BYTE1(v312) | 0x88) ^ (v312 >> 8) & 0x88;
  v314 = (char *)*(&off_24C363D30 + HIDWORD(v357) - 1276) - 4;
  v340[2] = (((unsigned __int16)(v311 ^ 0x32A6) >> 8) | 0x88) ^ ((unsigned __int16)(v311 ^ 0x32A6) >> 8) & 0x88 ^ 0x35 ^ ((v314[v313 ^ 0x14] ^ 0xC6) - ((2 * v314[v313 ^ 0x14]) & 0x20) - 112);
  v315 = v304 ^ 0x83F7793D ^ ((v300 ^ 0x9FD52929) - 1197324801 + v354) ^ ((v304 ^ 0x83F7793D) >> 2) ^ ((v304 ^ 0x83F7793D) >> 4);
  LODWORD(v296) = (v315 & 0x1000000 ^ 0xB7C8FDDE) + 2 * (v315 & 0x1000000);
  v112 = (((_DWORD)v296 + 1211564578) & (v307 ^ 0xF4000000)) == 0;
  v316 = (char *)*(&off_24C363D30 + HIDWORD(v357) - 1253) - 12;
  v317 = v316[HIBYTE(v308) ^ 0xEFLL];
  HIDWORD(v286) = v317 ^ 5;
  LODWORD(v286) = (v317 ^ 0x20) << 24;
  v340[STACK[0x378]] = (v286 >> 29) ^ 0x83;
  v318 = v296 + 1769451258;
  v319 = -653677898 - v296;
  if (v112)
    v319 = v318;
  v320 = v315 & 0xFEFFFFFF ^ (1515496080 * (v353 ^ 0x5805B471)) ^ ((v307 ^ (v297
                                                                          + 1898816755
                                                                          + ((2 * v297 + 224) & 0x104 ^ 0x179FDFFF)))
                                                                 - 557886680
                                                                 + v319);
  v321 = v353 ^ 0x5805B471 ^ LODWORD(STACK[0x3D8]) ^ (v320 + 2037176732 - ((2 * v320) & 0xF2D9B338));
  v322 = (char *)*(&off_24C363D30 + (HIDWORD(v357) ^ 0x511)) - 8;
  v340[11] = v322[v353 ^ 0x71u ^ LOBYTE(STACK[0x3D8]) ^ (v320
                                                                                         - 100
                                                                                         - ((2 * v320) & 0x38)) ^ 0x28] ^ 0xD6;
  v323 = v316[HIBYTE(v311) ^ 0xF9];
  HIDWORD(v324) = v323 ^ 5;
  LODWORD(v324) = (v323 ^ 0x20) << 24;
  v325 = STACK[0x290];
  v340[STACK[0x290]] = (v324 >> 29) ^ 0xFB;
  v340[1] = BYTE2(v312) ^ 0x61 ^ ((BYTE2(v312) ^ 0x61) - ((2 * (BYTE2(v312) ^ 0x61) - 18) & 0xD2) - 32) ^ 0xB8 ^ *(_BYTE *)(v309 + (BYTE2(v312) ^ 0xB5));
  v326 = (HIBYTE(v297) ^ 0x9FD52929) - 1197324801 + v357;
  v327 = HIDWORD(v354) ^ 0x83F7793D ^ ((HIDWORD(v354) ^ 0x83F7793D) >> 4) ^ ((HIDWORD(v354) ^ 0x83F7793D) >> 2);
  v328 = (v327 & 0x80000 ^ 0xBFBA1BFF) + 2 * (v327 & 0x80000);
  v112 = ((v328 + 1078322177) & v326) == 0;
  v329 = v328 + 1860039861;
  v330 = -296604493 - v328;
  if (v112)
    v330 = v329;
  v331 = v327 & 0xFFF7FFFF ^ (1515496080 * (v306 ^ 0x5805B471)) ^ (v326 - 781717684 + v330);
  v332 = HIDWORD(v353) ^ (v301 + 2096205936) ^ (v331 - ((2 * v331) & 0xE8782904) - 197389182);
  v333 = v306 ^ LODWORD(STACK[0x400]) ^ (v332 - 1442159486 - ((2 * v332) & 0x5414C964) + 48);
  v340[STACK[0x250]] = *(_BYTE *)(v309 + (BYTE2(v333) ^ 0x9E) + ((v333 >> 15) & 0x1A8 ^ 0xFFFFFED7) + 213) ^ BYTE2(v333) ^ ((BYTE2(v333) ^ 0x9E) - ((2 * (BYTE2(v333) ^ 0x9E) - 18) & 0xD2) - 32) ^ 0x18;
  v334 = v316[HIBYTE(v333) ^ 0xA2];
  HIDWORD(v335) = v334 ^ 5;
  LODWORD(v335) = (v334 ^ 0x20) << 24;
  v340[STACK[0x2D8]] = (v335 >> 29) ^ 0x50;
  v340[STACK[0x248]] = ((v321 ^ 0xCFDDD967) >> 16) ^ 0x94 ^ ((((v321 ^ 0xCFDDD967) >> 16) ^ 0x94)
                                                                         - ((2
                                                                           * (((v321 ^ 0xCFDDD967) >> 16) ^ 0x94)
                                                                           - 18) & 0xD2)
                                                                         - 32) ^ *(_BYTE *)(v309
                                                                                          + (((v321 ^ 0xCFDDD967) >> 16) ^ 0x40)) ^ 0xC;
  v336 = (((v333 ^ 0x730265E) >> 4) & 0xF0 | ((unsigned __int16)(v333 ^ 0x265E) >> 12)) ^ 0xE6;
  v337 = (v336 >> 4) & 0xFFFFFF0F | (16 * (v336 & 0xF));
  v340[STACK[0x3E0]] = v314[v337 ^ 0xAE] ^ (v337 - ((2 * v337) & 0x8C) - 58) ^ 0x2B;
  v340[STACK[0x218]] = (((unsigned __int16)(v321 ^ 0xD967) >> 8) - (((v321 ^ 0xCFDDD967) >> 7) & 0x8C) - 58) ^ 0xDB ^ v314[((unsigned __int16)(v321 ^ 0xD967) >> 8) ^ 0xA0];
  v340[STACK[0x3D0]] = (((unsigned __int16)(v308 ^ 0xC6B3) >> 8) - (((v308 ^ 0x5244C6B3) >> 7) & 0x8C) - 58) ^ v314[((unsigned __int16)(v308 ^ 0xC6B3) >> 8) ^ 0x75] ^ 0x80;
  v340[STACK[0x388]] = v322[v311 ^ 0x95] ^ 0x7B;
  v340[STACK[0x380]] = v322[v308 ^ 0x7FLL] ^ 0xEA;
  v340[STACK[0x410]] = v322[v333 ^ 0xF1] ^ 0x45;
  v338 = v316[BYTE3(v321) ^ 0x49];
  HIDWORD(v335) = v338 ^ 5;
  LODWORD(v335) = (v338 ^ 0x20) << 24;
  v340[STACK[0x3B8]] = (v335 >> 29) ^ 0x2E;
  return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _BYTE *, unsigned __int8 *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v64 + 8 * (HIDWORD(v357) | (4 * ((((_DWORD)v325 - 1882277103 - 2 * (((_DWORD)v325 + 16) & 0xFCEBB05 ^ STACK[0x280] & 4)) ^ 0x8FCEBB00) > 0x14F)))))(v309, v325, 1515496080, v322, 5, v321, 1476768881, HIDWORD(v357), a9, a10, a11, a12, a13, a14, a15, a16, a17, v340, v341,
           v342,
           v343,
           v344,
           v345,
           a24,
           v346,
           v347,
           v348,
           v349,
           v350,
           v351,
           v352,
           v353,
           v354,
           v357,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           2,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           5);
}

void sub_20AADB6D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,unsigned __int8 a25,int a26,int a27,unsigned __int8 a28,__int16 a29,unsigned __int8 a30,int a31,int a32,int a33,int a34,unsigned __int8 a35,int a36,int a37,char a38,__int16 a39,char a40)
{
  char v40;

  LODWORD(STACK[0x3C0]) = (a25 | ((a33 ^ 0xC) << 24) | ((a28 ^ 0xEF) << 8) | ((a35 ^ 0x92) << 16)) ^ 0xAE3F394E;
  LODWORD(STACK[0x2D0]) = a32 ^ 0xA87AE761;
  LODWORD(STACK[0x3D8]) = (a31 | (a27 << 24) | ((a36 ^ 0x3A) << 16) | (a34 << ((a38 - 50) ^ 0x63))) ^ 0x50B2F323;
  LODWORD(STACK[0x400]) = ((((a37 ^ 0xF3) << 16) + ((a26 ^ 0x1A) << 24)) | a30 | ((a40 ^ v40) << 8)) ^ 0xB99BCD23;
  JUMPOUT(0x20AAD97F0);
}

uint64_t sub_20AADB7C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18)
{
  uint64_t v18;
  int v19;
  unint64_t v20;
  uint64_t v21;

  v19 = 57 * (a18 ^ 0x1DD);
  v20 = STACK[0x610];
  STACK[0x628] -= 32;
  v21 = (((v19 - 456) | 0xDC) ^ 0xD3u) & 0x14FLL;
  *(_BYTE *)(v20 + 335) = *(_BYTE *)(a15 + 335) ^ *((_BYTE *)*(&off_24C363D30 + v19 - 368) + v21) ^ *((_BYTE *)*(&off_24C363D30 + (v19 ^ 0x1A6)) + v21 - 10) ^ (99 * v21) ^ *((_BYTE *)*(&off_24C363D30 + (v19 ^ 0x1DA)) + v21 - 9) ^ 0xFB;
  return ((uint64_t (*)(void))(*(_QWORD *)(v18 + 8 * (v19 ^ 0x1D)) - 12))();
}

void sub_20AADB8C0()
{
  JUMPOUT(0x20AADB838);
}

uint64_t sub_20AADB8C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)(v11 + 296) -= 16;
  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * (((((v9 - 606005665) & 0x241EEBFF) + 598) * (a8 == v8)) ^ v9))
                            - ((v9 - 1313499485) & 0x4E4A6BBB)
                            + 815))();
}

uint64_t sub_20AADB92C@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v7;
  _BYTE *v8;
  int v9;

  v8 = (_BYTE *)STACK[0x488];
  v9 = -358297731 - ((1 << (-79 * (a1 ^ 0x38) - 18)) & 0x15499EF8);
  a7[12] = (HIBYTE(v9) ^ 0xEA) - ((2 * (HIBYTE(v9) ^ 0xEA)) & 0x77) - 5;
  a7[13] = (BYTE2(v9) ^ 0xA4) + (~(2 * (BYTE2(v9) ^ 0xA4)) | 9) - 4;
  a7[14] = (BYTE1(v9) ^ 0xCF) - ((2 * (BYTE1(v9) ^ 0xCF)) & 0xF7) - 5;
  a7[15] = v9 ^ 0x87;
  v8[16] ^= *a7 ^ 0xFB;
  v8[17] ^= a7[1] ^ 0xFB;
  v8[18] ^= a7[2] ^ 0xFB;
  v8[19] ^= a7[3] ^ 0xFB;
  v8[20] ^= a7[4] ^ 0xFB;
  v8[21] ^= a7[5] ^ 0xFB;
  v8[22] ^= a7[6] ^ 0xFB;
  v8[23] ^= a7[7] ^ 0xFB;
  v8[24] ^= a7[8] ^ 0xFB;
  v8[25] ^= a7[9] ^ 0xFB;
  v8[26] ^= a7[10] ^ 0xFB;
  v8[27] ^= a7[11] ^ 0xFB;
  v8[28] ^= a7[12] ^ 0xFB;
  v8[29] ^= a7[13] ^ 0xFB;
  v8[30] ^= a7[14] ^ 0xFB;
  v8[31] ^= a7[15] ^ 0xFB;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 + 8 * (a1 + 978)) - 12))(1891, 707, 403661541, 3891306335, 453, 3936669564, 4294967274, 4294967204);
}

void sub_20AADBB5C()
{
  JUMPOUT(0x20AADB980);
}

uint64_t sub_20AADBB64(unsigned int a1)
{
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * (((v2 + LODWORD(STACK[0x474]) == 0) * (((v1 - 224107670) & 0xD5B9EDA) - 1065)) ^ (v1 - 224107670) & 0xD5B9EDA))
                            - ((v1 - 224107670) & 0xD5B9EDA ^ a1)
                            + 815))();
}

uint64_t sub_20AADBBC8(uint64_t a1, char a2, int a3, int a4, int a5)
{
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  return ((uint64_t (*)(void))(*(_QWORD *)(v9
                                        + 8
                                        * (((*(unsigned __int8 *)(v7 + v8 + ((v5 + a3) & a4 ^ (v6 - 1081))) != ((v5 ^ a2) ^ 0x2B))
                                          * a5) ^ v5))
                            - 4))();
}

uint64_t sub_20AADBC18@<X0>(unsigned int a1@<W0>, int a2@<W8>)
{
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((a2 == -428) * (v2 - 1065)) ^ v2)) - (v2 ^ a1) + 815))();
}

uint64_t sub_20AADBC44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  int v39;
  uint64_t v40;
  unint64_t v41;
  int v42;

  LODWORD(STACK[0x474]) = 274119351;
  v41 = STACK[0x488];
  STACK[0x4A0] = 335;
  *(_BYTE *)(v41 + 335) = (a39 ^ 0xBA) * (a39 + 17);
  v42 = STACK[0x4A0] == 47 * ((v39 + 119) ^ 0x3ADu) - 1457;
  return ((uint64_t (*)(void))(*(_QWORD *)(v40 + 8 * (((2 * v42) | (v42 << 6)) ^ (v39 + 119))) - 4))();
}

void sub_20AADC180()
{
  JUMPOUT(0x20AADC130);
}

uint64_t sub_20AADC188()
{
  int v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  v3 = ((uint64_t (*)(void))STACK[0x2B0])();
  LODWORD(STACK[0x648]) = v2;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v1
                                                      + 8
                                                      * ((959
                                                        * (v2 == ((((v0 - 678) | 0x30) + 306493109) ^ ((v0 - 913) | 0x11B)))) ^ v0))
                                          - 8))(v3);
}

uint64_t sub_20AADC1DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t, unint64_t);
  unint64_t v8;

  v5 = STACK[0x390];
  v6 = STACK[0x3F8];
  v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, unint64_t))(*(_QWORD *)(v4 + 8 * (v3 - 784)) - 8);
  v8 = STACK[0x210];
  STACK[0x3E0] = STACK[0x210] + 2353;
  STACK[0x3D8] = v6 + 49;
  STACK[0x3D0] = v8 + 2333;
  STACK[0x3C8] = v6 + 29;
  STACK[0x3C0] = v8 + 2313;
  STACK[0x3B8] = v6 + 9;
  return v7(a1, a2, a3, v5);
}

void sub_20AADCA08()
{
  int v0;

  LODWORD(STACK[0x640]) = v0;
  JUMPOUT(0x20AADC994);
}

uint64_t sub_20AADCA44()
{
  unint64_t v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;

  STACK[0x400] = v0;
  v5 = STACK[0x420] + 720;
  v6 = STACK[0x504];
  *(_DWORD *)(*(_QWORD *)(v4 + 448) + ((v6 + v1) & 0xFFFFFFFC)) = v2;
  v7 = (v5 ^ 0x60F) + v6;
  LODWORD(STACK[0x504]) = v7;
  return (*(uint64_t (**)(void))(v3 + 8 * ((237 * (v7 + v1 < (v5 ^ 0x609) + 4 + 773 * (v5 ^ 0x609u) - 1488)) ^ v5)))();
}

uint64_t sub_20AADDBF4@<X0>(int a1@<W7>, uint64_t a2@<X8>)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  int v9;
  unint64_t v10;

  v8 = *(_DWORD *)(a2 + 4 * (v5 + v4 - 8)) ^ *(_DWORD *)(a2
                                                                       + 4
                                                                       * (v4 + ((v2 - 930) ^ (v5 + 405))));
  v9 = *(_DWORD *)(a2 + 4 * (v5 + v4 - 16)) ^ *(_DWORD *)(a2 + 4 * (v5 + v4 - 14)) ^ (v8 + a1 - (v6 & (2 * v8)));
  HIDWORD(v10) = v9 ^ a1;
  LODWORD(v10) = v9;
  *(_DWORD *)(a2 + 4 * (v3 + v5)) = a1 + (v10 >> 31) - (v6 & (2 * (v10 >> 31)));
  return (*(uint64_t (**)(void))(v7 + 8 * (((v3 + 1 + v5) < 0x50) ^ v2)))();
}

uint64_t sub_20AADDC78()
{
  int v0;
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * v0) - 8))();
}

void sub_20AADDD80()
{
  JUMPOUT(0x20AADDCB8);
}

uint64_t sub_20AADDD98()
{
  int v0;
  uint64_t v1;
  int v2;

  return (*(uint64_t (**)(void))(v1 + 8 * ((54 * ((v2 - 1957446253) < 0x28)) ^ ((v0 - 1202) | 0x480))))();
}

void sub_20AADDE50()
{
  JUMPOUT(0x20AADDDA8);
}

uint64_t sub_20AADDE68()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;

  return (*(uint64_t (**)(void))(v2 + 8 * ((1535 * ((v0 + 1 + v3) < 0x3C)) ^ v1)))();
}

uint64_t sub_20AADDF24(uint64_t a1, int a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  int v5;

  return (*(uint64_t (**)(uint64_t))(v4 + 8 * ((118 * ((a2 + 1 + v5) > 0x4F)) ^ v3)))(a3);
}

uint64_t sub_20AADDFDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  int v22;
  int v23;
  int v24;

  LODWORD(STACK[0x534]) = v5;
  LODWORD(STACK[0x594]) = v8;
  LODWORD(STACK[0x4EC]) = v6;
  LODWORD(STACK[0x47C]) = v9;
  LODWORD(STACK[0x504]) = v12 + 80;
  v15 = *(_QWORD *)(v14 + 432);
  v16 = *(_DWORD *)(v15 - 0xB7BFC0B778595E2);
  LODWORD(STACK[0x434]) = v7;
  v17 = (v16 ^ (v13 + v10 - 494)) + (v7 ^ v13);
  *(_DWORD *)(v15 - 0xB7BFC0B778595E2) = v17 + v13 - (v11 & (2 * v17));
  v18 = *(_QWORD *)(v14 + 296);
  v19 = STACK[0x390];
  v20 = STACK[0x418];
  v21 = (*(_DWORD *)(v15 - 0xB7BFC0B778595F2) ^ v13) + (v5 ^ v13);
  *(_DWORD *)(v15 - 0xB7BFC0B778595F2) = v21 + v13 - ((2 * v21) & 0x22142492);
  v22 = (*(_DWORD *)(v15 - 0xB7BFC0B778595EELL) ^ v13) + (v8 ^ v13);
  *(_DWORD *)(v15 - 0xB7BFC0B778595EELL) = v22 + v13 - ((2 * v22) & 0x22142492);
  v23 = (*(_DWORD *)(v15 - 0xB7BFC0B778595EALL) ^ v13) + (v6 ^ v13);
  *(_DWORD *)(v15 - 0xB7BFC0B778595EALL) = v23 + v13 - ((2 * v23) & 0x22142492);
  v24 = (*(_DWORD *)(v15 - 0xB7BFC0B778595E6) ^ v13) + (v9 ^ v13);
  *(_DWORD *)(v15 - 0xB7BFC0B778595E6) = v24 + v13 - ((2 * v24) & 0x22142492);
  *(_QWORD *)(v14 + 296) = v18 - 320;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, unint64_t))(v14 + 104))(a1, a2, a3, v19, a5, v20);
}

uint64_t sub_20AADE070@<X0>(int32x4_t *a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,int32x4_t a48,int8x16_t a49)
{
  const char *v49;
  int v50;
  int v51;
  uint64_t v52;
  int8x16_t v53;
  uint8x16_t v54;
  uint16x8_t v55;
  int8x16_t v56;
  int8x16_t v57;
  uint16x8_t v58;
  int8x16_t v59;
  int8x16_t v60;
  uint8x16_t v61;
  uint16x8_t v62;
  uint16x8_t v63;
  uint8x16_t v64;
  int8x16_t v67;
  int8x16_t v72;
  int32x4_t v73;
  int32x4_t v74;
  int32x4_t v75;
  int32x4_t v76;
  int8x16x4_t v78;

  v78 = vld4q_s8(v49);
  v53.i64[0] = 0xFBFBFBFBFBFBFBFBLL;
  v53.i64[1] = 0xFBFBFBFBFBFBFBFBLL;
  v54 = (uint8x16_t)veorq_s8(v78.val[0], v53);
  v55 = vmovl_u8(*(uint8x8_t *)v54.i8);
  v56 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v55.i8);
  v57 = (int8x16_t)vmovl_high_u16(v55);
  v58 = vmovl_high_u8(v54);
  v59 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v58.i8);
  v60 = (int8x16_t)vmovl_high_u16(v58);
  v61 = (uint8x16_t)veorq_s8(v78.val[1], v53);
  v62 = vmovl_high_u8(v61);
  v63 = vmovl_u8(*(uint8x8_t *)v61.i8);
  v64 = (uint8x16_t)veorq_s8(v78.val[2], v53);
  _Q21 = (int8x16_t)vmovl_high_u8(v64);
  _Q20 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v64.i8);
  v67 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q20.i8, 0x10uLL);
  __asm { SHLL2           V20.4S, V20.8H, #0x10 }
  v72 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q21.i8, 0x10uLL);
  __asm { SHLL2           V21.4S, V21.8H, #0x10 }
  v78.val[0] = veorq_s8(v78.val[3], v53);
  v78.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v78.val[0]);
  v78.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v78.val[1]);
  v78.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v78.val[0].i8);
  v78.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v78.val[0]);
  v78.val[0] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v78.val[0].i8), 0x18uLL), v67), vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v63.i8, 8uLL), v56));
  v78.val[3] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v78.val[3], 0x18uLL), _Q20), vorrq_s8((int8x16_t)vshll_high_n_u16(v63, 8uLL), v57));
  v78.val[1] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v78.val[1].i8), 0x18uLL), v72), vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v62.i8, 8uLL), v59));
  v78.val[2] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v78.val[2], 0x18uLL), _Q21), vorrq_s8((int8x16_t)vshll_high_n_u16(v62, 8uLL), v60));
  v73 = (int32x4_t)veorq_s8(vandq_s8(v78.val[0], a49), (int8x16_t)(*(_OWORD *)&v56 & __PAIR128__(0xFFFFFF14FFFFFF14, 0xFFFFFF14FFFFFF14)));
  v74 = (int32x4_t)veorq_s8(vandq_s8(v78.val[3], a49), (int8x16_t)(*(_OWORD *)&v57 & __PAIR128__(0xFFFFFF14FFFFFF14, 0xFFFFFF14FFFFFF14)));
  v75 = (int32x4_t)veorq_s8(vandq_s8(v78.val[1], a49), (int8x16_t)(*(_OWORD *)&v59 & __PAIR128__(0xFFFFFF14FFFFFF14, 0xFFFFFF14FFFFFF14)));
  v76 = (int32x4_t)veorq_s8(vandq_s8(v78.val[2], a49), (int8x16_t)(*(_OWORD *)&v60 & __PAIR128__(0xFFFFFF14FFFFFF14, 0xFFFFFF14FFFFFF14)));
  a1[2] = vaddq_s32(vsubq_s32((int32x4_t)v78.val[1], vaddq_s32(v75, v75)), a48);
  a1[3] = vaddq_s32(vsubq_s32((int32x4_t)v78.val[2], vaddq_s32(v76, v76)), a48);
  *a1 = vaddq_s32(vsubq_s32((int32x4_t)v78.val[0], vaddq_s32(v73, v73)), a48);
  a1[1] = vaddq_s32(vsubq_s32((int32x4_t)v78.val[3], vaddq_s32(v74, v74)), a48);
  return (*(uint64_t (**)(void))(v52
                              + 8
                              * (int)((1043 * ((v51 + 1957446275) < 0x10)) ^ (((v50 + 657272495) & 0xD8D2CF3B)
                                                                                          - 101))))();
}

uint64_t sub_20AADE2D8(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int v6;
  uint64_t v7;

  return (*(uint64_t (**)(uint64_t))(v7 + 8 * ((619 * ((a6 + 1 + v6) < 0x20)) ^ a2)))(a4);
}

uint64_t sub_20AADE3AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7)
{
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9
                                                              + 8
                                                              * (((4 * ((a5 + 1 + v8) < 0x30)) | (32 * ((a5 + 1 + v8) < 0x30))) ^ v7)))(a7, a7, v10 + 48);
}

uint64_t sub_20AADE470(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  int v4;
  uint64_t v5;

  return (*(uint64_t (**)(void))(v5 + 8 * ((1216 * ((a3 + 1 + v4) > 0x3F)) ^ v3)))();
}

void sub_20AADE544()
{
  int v0;
  int v1;
  int v2;
  int v3;
  int v4;

  LODWORD(STACK[0x534]) = v0;
  LODWORD(STACK[0x4EC]) = v1;
  LODWORD(STACK[0x594]) = v2;
  LODWORD(STACK[0x47C]) = v3;
  LODWORD(STACK[0x504]) = v4 + 64;
  JUMPOUT(0x20AADE580);
}

uint64_t sub_20AADE664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,int a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60)
{
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  int v63;
  unint64_t v64;

  v62 = STACK[0x448];
  v63 = *(unsigned __int8 *)(STACK[0x448] - 0xB7BFC0B778595DALL) ^ 0xE;
  if (v63 == 2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v60
                                                                                  + 8
                                                                                  * (int)((2035
                                                                                         * (((*(_DWORD *)(v62 - 0xB7BFC0B778595DELL) == 1741097738) ^ (a54 + 1)) & 1)) ^ (STACK[0x420] + 179))))(a1, 9, a3, a4, 1120);
  v64 = STACK[0x420];
  if (v63 == 1)
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v60
                                                                                            + 8
                                                                                            * (int)((1221 * (*(_DWORD *)(v62 - 0xB7BFC0B778595DELL) != 1741097738)) ^ (STACK[0x420] - 635)))
                                                                                - a52
                                                                                + 223))(a1, a2, a3, a4, 1120);
  *(_QWORD *)(v61 + 24) = 91;
  *(_BYTE *)(v62 - 0xB7BFC0B778595DFLL) = (a60 ^ 0xBA) * (a60 + 17);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v60
                                                                                          + 8
                                                                                          * (int)(((*(_QWORD *)(v61 + 24) == 0)
                                                                                                 * (((v64 ^ 0x22C) - 757407132) & 0x2D251FBF ^ 0x478)) ^ v64 ^ 0x22C))
                                                                              - 12))(a1, a2, a3, a4, 1120);
}

void sub_20AADEFB4()
{
  JUMPOUT(0x20AADEF5CLL);
}

uint64_t sub_20AADEFBC()
{
  return ((uint64_t (*)(void))STACK[0x480])();
}

uint64_t sub_20AADEFFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v8;
  uint64_t v9;
  int v10;
  unsigned int v11;
  int v12;

  v10 = STACK[0x420] - 324;
  v11 = (v8 ^ (a8 + 113) ^ v10) + (LODWORD(STACK[0x644]) ^ a8);
  *(_DWORD *)(a4 + 52) = ((v11 % 0x2710) ^ 0x797FB74F) - 3150848 + ((2 * (v11 % 0x2710)) & 0x6E9E);
  v12 = STACK[0x64C];
  LODWORD(STACK[0x4AC]) = STACK[0x64C];
  return (*(uint64_t (**)(void))(v9 + 8 * ((1118 * (v12 == a8)) ^ v10)))();
}

uint64_t sub_20AADF088@<X0>(_DWORD *a1@<X3>, int a2@<W8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = STACK[0x42C];
  a1[85] = STACK[0x4D4];
  a1[86] = STACK[0x60C];
  a1[87] = STACK[0x4D0];
  a1[88] = STACK[0x430];
  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((1459
                                          * (((*(_QWORD *)(v3 + 248) == 0) ^ ((a2 ^ 0xCC) + 20)) & 1)) ^ ((a2 ^ 0x2CC) - 28)))
                            - 8))();
}

uint64_t sub_20AADF0F8()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  unint64_t v3;
  unint64_t v4;

  v3 = STACK[0x420];
  v4 = STACK[0x420];
  *(_QWORD *)(v1 + 296) -= 1616;
  LODWORD(STACK[0x4AC]) = v2 + 234;
  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * ((1459 * (((*(_QWORD *)(v1 + 248) == 0) ^ (v3 + 20)) & 1)) ^ ((int)v4 - 28)))
                            - 8))();
}

uint64_t sub_20AADF154()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((1459 * (((*(_QWORD *)(v2 + 248) == 0) ^ (v0 + 20)) & 1)) ^ (v0 - 28)))
                            - 8))();
}

uint64_t sub_20AADF194()
{
  unint64_t v0;
  int v1;
  uint64_t v2;
  int v3;

  STACK[0x368] = v0;
  LODWORD(STACK[0x478]) = v3 + 18;
  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((((((v1 - 659) ^ 0x3C9) + 345) ^ ((v1 - 659) | 0x400)) * (STACK[0x368] != 0)) | (v1 + 365))))();
}

uint64_t sub_20AADF324()
{
  int v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * (v2 ^ (70 * ((v0 & 0xFFFFFFFE) == 704864278))))
                            - (v2 - 793)
                            - (v2 ^ 0x4B8u)
                            + 1945))();
}

uint64_t sub_20AADF364(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42)
{
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  unint64_t v48;
  int v49;
  unsigned int v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  int v54;

  v48 = STACK[0x5B0];
  v49 = LODWORD(STACK[0x598]) ^ 0x762EF7E2;
  v50 = (2 * LODWORD(STACK[0x598])) & 0xEC5DEFC4;
  v51 = 235795823 * ((v47 - 216 - 2 * ((v47 - 216) & 0xAAA9E0B1) - 1431707471) ^ 0x3E04A9E8);
  v52 = v47 - 216;
  *(_BYTE *)(v52 + 24) = 111 * ((v47 + 40 - 2 * ((v47 + 40) & 0xB1) - 79) ^ 0xE8) + 120;
  *(_QWORD *)(v52 + 8) = v43;
  *(_QWORD *)(v52 + 16) = a41;
  *(_DWORD *)(v47 - 216) = (v42 + 221338550) ^ v51;
  *(_DWORD *)(v47 - 176) = (v46 - 1013) ^ v51;
  *(_DWORD *)(v47 - 152) = v51 + v49 + v50 - 1140860416;
  *(_QWORD *)(v52 + 48) = a42;
  *(_QWORD *)(v52 + 56) = v48;
  *(_QWORD *)(v52 + 32) = v44;
  v53 = ((uint64_t (*)(uint64_t))((char *)*(&off_24C363D30 + (v46 ^ 0x4F4)) - 4))(v47 - 216);
  v54 = *(_DWORD *)(v47 - 148);
  LODWORD(STACK[0x478]) = v54;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v45
                                                      + 8
                                                      * ((139 * (v54 == ((v46 - 303) ^ 0x1244BBD5 ^ (9 * (v46 ^ 0x457))))) ^ v46))
                                          - 4))(v53);
}

uint64_t sub_20AADF484(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,int a36,int a37)
{
  int v37;
  uint64_t v38;
  int v39;

  return ((uint64_t (*)(void))(*(_QWORD *)(v38
                                        + 8
                                        * ((1255
                                          * ((v39 ^ (((v37 + ((v39 + 1616053654) & 0x9FACFB7F) - 827) ^ LODWORD(STACK[0x49C])) == a37 - 2080042334)) & 1)) ^ v39))
                            - 8))();
}

uint64_t sub_20AADF4E4()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);

  LODWORD(STACK[0x478]) = v3 - 125;
  v5 = LODWORD(STACK[0x478]);
  v6 = 1374699841
     * (((v0 ^ 0x18FE8F3A1BF3175FLL | 0x72F351FF41AF8471)
       - (v0 ^ 0x18FE8F3A1BF3175FLL | 0x8D0CAE00BE507B8ELL)
       - 0x72F351FF41AF8472) ^ 0x640140C937A88B27);
  *(_DWORD *)(v4 - 176) = (((v2 ^ 0x11E) - 269612523) | 0x2D) ^ v6;
  v7 = v4 - 216;
  *(_QWORD *)(v7 + 8) = v6 + 3988513041u;
  *(_QWORD *)(v7 + 16) = v5 ^ v6;
  *(_DWORD *)(v4 - 188) = ((v2 ^ 0x11E) - 269612523) ^ v6;
  *(_DWORD *)(v4 - 184) = ((v2 ^ 0x11E) - 269612584) ^ v6;
  *(_DWORD *)(v4 - 216) = v6 + (v2 ^ 0x11E) - 1501686671;
  *(_DWORD *)(v4 - 192) = -1374699841
                        * (((v0 ^ 0x1BF3175F | 0x41AF8471) - (v0 ^ 0x1BF3175F | 0xBE507B8E) - 1102021746) ^ 0x37A88B27);
  v8 = ((uint64_t (*)(uint64_t))STACK[0x370])(v4 - 216);
  STACK[0x368] = 0;
  v9 = (uint64_t (*)(uint64_t))(*(_QWORD *)(v1 + 8 * *(int *)(v4 - 180)) - 12);
  LODWORD(STACK[0x2E4]) = 931881356;
  return v9(v8);
}

void sub_20AADF4F8()
{
  JUMPOUT(0x20AADF508);
}

void sub_20AADF548(uint64_t a1@<X1>, int a2@<W8>)
{
  uint64_t v2;
  int v3;

  v3 = a2 - 327;
  ((void (*)(_QWORD, uint64_t, _QWORD))STACK[0x2C8])(*(unsigned int *)STACK[0x2C0], a1, ((a2 - 327) ^ 0xC8749D15) + LODWORD(STACK[0x2E4]));
  *(_DWORD *)(v2 - 216) = (v3 + 2138962495) ^ (535753261
                                             * ((((v2 - 216) | 0xB7D05FCD) - ((v2 - 216) & 0xB7D05FCD)) ^ 0xBD2451E2));
  sub_20AAE5B8C((_DWORD *)(v2 - 216));
  JUMPOUT(0x20AADF5CCLL);
}

uint64_t sub_20AADF614(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;
  unint64_t v4;
  BOOL v5;

  LODWORD(STACK[0x478]) = v3 + 18;
  v4 = STACK[0x5B0];
  v5 = LODWORD(STACK[0x598]) == 0;
  STACK[0x490] = LODWORD(STACK[0x598]);
  return (*(uint64_t (**)(uint64_t, unint64_t))(v1
                                                              + 8
                                                              * ((((v5 ^ (3 * (v2 ^ 0x8C))) & 1)
                                                                * (((v2 - 563) | 0xF0) - 42)) ^ (v2 - 598))))(a1, v4);
}

uint64_t sub_20AADF66C@<X0>(uint64_t a1@<X1>, int a2@<W8>)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v4 = ((unint64_t)&STACK[0x490] ^ 0x6FF6BF73BFF4DFBFLL)
     - 0x4920241080A000A0
     + ((2 * (_QWORD)&STACK[0x490]) & 0xDFED7EE77FE9BF70);
  v5 = v2 - 1;
  STACK[0x490] = v5;
  *(_BYTE *)(a1 + v5) = ((v4 - 31) ^ 0xBA) * (v4 + ((a2 - 19) ^ 0x17));
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((904 * (STACK[0x490] == 0)) ^ a2)) - 8))();
}

void sub_20AADF700()
{
  JUMPOUT(0x20AADF6C4);
}

void sub_20AADF708(uint64_t a1, uint64_t a2)
{
  ((void (*)(_QWORD, uint64_t, _QWORD))STACK[0x2C8])(*(unsigned int *)STACK[0x2C0], a2, 0);
  JUMPOUT(0x20AADF740);
}

uint64_t sub_20AADF840()
{
  uint64_t v0;
  unint64_t v1;
  int v2;
  uint64_t (*v3)(void);

  STACK[0x368] = 0;
  v1 = STACK[0x420];
  v2 = *(_DWORD *)(STACK[0x390] + 56);
  *(_DWORD *)(STACK[0x390] + 56) = v2 + ((2 * STACK[0x420]) ^ 0x618) - 109;
  v3 = (uint64_t (*)(void))(*(_QWORD *)(v0
                                     + 8 * ((1807 * ((v2 - 143612847) < 0xFFFFFFFA)) ^ ((int)v1 - 717)))
                         - 12);
  LODWORD(STACK[0x2E4]) = 931881356;
  return v3();
}

void sub_20AADF8A0()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  *(_DWORD *)(v2 - 216) = (v0 + 2138963250) ^ (535753261
                                             * ((-702376401 - ((v2 - 216) | 0xD622962F) + ((v2 - 216) | 0x29DD69D0)) ^ 0x232967FF));
  sub_20AAE5B8C((_DWORD *)(v2 - 216));
  *(_DWORD *)(v2 - 200) = 3804331 * ((v2 - 216 - 2 * ((v2 - 216) & 0xB41C79BB) - 1273202245) ^ 0xCAC95C4D) + v0 + 367;
  *(_QWORD *)(v1 + 24) = STACK[0x260];
  *(_BYTE *)v1 = (-85 * ((v2 + 40 - 2 * ((v2 + 40) & 0xBB) - 69) ^ 0x4D)) ^ 0x5C;
  *(_QWORD *)(v1 + 8) = STACK[0x268];
  ((void (*)(uint64_t))STACK[0x258])(v2 - 216);
  STACK[0x368] = 0;
  LODWORD(STACK[0x2E4]) = 931881356;
  JUMPOUT(0x20AADF50CLL);
}

void sub_20AADF988(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 16) - 1224239923 * ((a1 & 0x9A8552A9 | ~(a1 | 0x9A8552A9)) ^ 0x97C95081);
  __asm { BR              X9 }
}

uint64_t sub_20AADFA4C@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * (a1 ^ (62 * (v2 == 0))))
                            - ((a1 - 569) ^ (a1 - 752256217) & 0x2CD683F3u ^ 0x360)))();
}

uint64_t sub_20AADFAA4@<X0>(uint64_t (*a1)(_DWORD *)@<X8>)
{
  int v1;
  _DWORD *v2;
  uint64_t v3;
  unsigned int v4;
  uint64_t result;
  _DWORD v6[2];
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;

  v4 = 3804331 * (v6 ^ 0x7ED525F6);
  v9 = v4 - 985199192;
  v6[0] = v4 + 585125461;
  v6[1] = v4 + v1 - 141;
  v7 = 0x25E912EA7879E49CLL;
  v8 = v3;
  result = a1(v6);
  *v2 = *(_DWORD *)(v3 - 0x140B289DC8FEE23CLL);
  return result;
}

void sub_20AAE005C(uint64_t a1)
{
  int v1;
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  _DWORD v5[2];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = *(_DWORD *)(a1 + 8) + 535753261 * ((2 * (a1 & 0x5E99CC2A) - a1 - 1587137579) ^ 0xAB923DFA);
  if (*(_DWORD *)(*(_QWORD *)a1 - 0x4FF3ADA337C70001) - 311742309 >= 0)
    v2 = *(_DWORD *)(*(_QWORD *)a1 - 0x4FF3ADA337C70001) - 311742309;
  else
    v2 = 311742309 - *(_DWORD *)(*(_QWORD *)a1 - 0x4FF3ADA337C70001);
  if (*(_DWORD *)(*(_QWORD *)(a1 + 16) - 0x4FF3ADA337C70001) - 311742309 >= 0)
    v3 = *(_DWORD *)(*(_QWORD *)(a1 + 16) - 0x4FF3ADA337C70001) - 311742309;
  else
    v3 = 311742309 - *(_DWORD *)(*(_QWORD *)(a1 + 16) - 0x4FF3ADA337C70001);
  v6 = *(_QWORD *)a1;
  v5[1] = (460628867 * (v5 ^ 0x4C96827D)) ^ (v1 - 944);
  sub_20AABC954((uint64_t)v5);
  if (v2 >= v3)
    v4 = v3;
  else
    v4 = v2;
  __asm { BR              X13 }
}

uint64_t sub_20AAE01DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v13;
  unsigned int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  int v24;
  _BOOL4 v25;

  v22 = v15 & 0x7724CF7D;
  v23 = 4 * (v20 + v16);
  v24 = v18
      + 1002636204
      + (*(_DWORD *)(*(_QWORD *)(v21 - 0x4FF3ADA337C6FFFDLL) + v23) ^ v19)
      + (*(_DWORD *)(*(_QWORD *)(a11 - 0x4FF3ADA337C6FFFDLL) + v23) ^ (v19 + (v22 ^ 0x5BE) - 223));
  *(_DWORD *)(*(_QWORD *)(a13 - 0x4FF3ADA337C6FFFDLL) + v23) = v24 + v19 - (v17 & (2 * v24));
  v25 = v20 - 252714081 < (int)(v14 + 1782849549);
  if (v14 > 0x15BBDFF2 != v20 - 252714081 < -364634099)
    v25 = v14 > 0x15BBDFF2;
  return ((uint64_t (*)(void))(*(_QWORD *)(v13 + 8 * ((910 * !v25) ^ v22)) - 8))();
}

uint64_t sub_20AAE0314()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;
  int v4;
  _BOOL4 v6;

  v4 = v1 + 1552 + v3 + 318720565;
  v6 = v4 > 206802322 || v4 < (int)(((2 * v1) ^ 0x8C538C2D) + v2);
  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * ((1955 * v6) ^ v1)) - 8))();
}

uint64_t sub_20AAE0374(int a1)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  _BOOL4 v18;

  v13 = a1 - 1606;
  v14 = 4 * (v11 + v6);
  v15 = v2 + v9 + (*(_DWORD *)(*(_QWORD *)(v12 - 0x4FF3ADA337C6FFFDLL) + v14) ^ v10);
  *(_DWORD *)(*(_QWORD *)(v8 - 0x4FF3ADA337C6FFFDLL) + v14) = v15 + v10 - (v7 & (2 * v15));
  v16 = v3 + v11 + 1776;
  v18 = v16 <= v4 && v16 >= v5;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((118 * v18) ^ v13)) - 8))();
}

uint64_t sub_20AAE0434(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11)
{
  uint64_t v11;
  int v12;
  int v13;
  _BOOL4 v15;

  v15 = v13 + 385769187 > 273849169 || v13 + 385769187 < a11 - 1873634478;
  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * ((106 * v15) ^ v12)) - ((v12 - 192) ^ 0x372)))();
}

uint64_t sub_20AAE0494(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  int v24;
  int v25;
  _BOOL4 v27;

  v23 = 4 * (v22 + v17);
  v24 = v12 + v20 + (*(_DWORD *)(*(_QWORD *)(a11 - 0x4FF3ADA337C6FFFDLL) + v23) ^ v21);
  *(_DWORD *)(*(_QWORD *)(v19 - 0x4FF3ADA337C6FFFDLL) + v23) = v24 + v21 - (v18 & (2 * v24));
  v25 = v22 + 1 + v13;
  v27 = v25 <= v14 && v25 >= v16;
  return ((uint64_t (*)(void))(*(_QWORD *)(v11 + 8 * ((1856 * v27) ^ v15)) - 8))();
}

uint64_t sub_20AAE0564()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v0
                                        + 8
                                        * ((1073 * ((v2 ^ (v1 == 0x56530F603BC303ACLL)) & 1)) ^ v2))
                            - 12))();
}

void sub_20AAE059C()
{
  int v0;
  int v1;
  int v2;
  int v3;
  uint64_t v4;
  int v5;
  int v6;

  *(_DWORD *)(*(_QWORD *)(v4 - 0x4FF3ADA337C6FFFDLL) + 4 * (v5 + v2)) = v0
                                                                        - ((2 * v0 + 142211240) & v3)
                                                                        + v1
                                                                        + 1213908813;
  *(_DWORD *)(v4 - 0x4FF3ADA337C70001) = (((v5 + 1 + v2) * (v6 - 916476699)) ^ 0x3FDCFF65)
                                         - 759705600
                                         + ((2 * (v5 + 1 + v2) * (v6 - 916476699)) & 0x7FB9FECA);
}

void sub_20AAE0670(unint64_t a1)
{
  signed int v2;
  unsigned int v3;
  int v4;
  int v5;
  unsigned int v6;
  int v7;
  uint64_t v8;
  unsigned int v9;
  _QWORD v10[2];
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  unint64_t v16;
  int v17;
  int v18;
  unint64_t v19;
  uint64_t v20;
  int32x4_t v21;
  unint64_t *v22;
  int32x4_t v23;
  int32x4_t v24;
  uint64_t *v25;
  int v26;
  int v27;
  signed int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int v32;
  int v33;
  char v34;
  char v35;
  char v36;
  char v37;
  uint64_t v39;
  unsigned int v40;
  unint64_t *v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v2 = *(_DWORD *)(a1 + 44) - 1755732067 * (((a1 | 0xCC66703E) - (a1 | 0x33998FC1) + 865701825) ^ 0x12A0CDE5);
  v32 = *(_DWORD *)(a1 + 16) + 1755732067 * (((a1 | 0xCC66703E) - (a1 | 0x33998FC1) + 865701825) ^ 0x12A0CDE5);
  v3 = 1178560073 * ((((2 * &v40) | 0xC4B5652C) - &v40 + 497372522) ^ 0x58CECAF4);
  v4 = *(_DWORD *)(a1 + 36);
  v16 = 1755732067
      * (((a1 | 0xDEEEE61CC66703ELL) - (a1 | 0xF211119E33998FC1) - 0xDEEEE61CC66703FLL) ^ 0xD045495E12A0CDE5);
  v5 = v4 + 1755732067 * (((a1 | 0xCC66703E) - (a1 | 0x33998FC1) + 865701825) ^ 0x12A0CDE5);
  v40 = 1063949783 - v3;
  v42 = v2 - v3 - 1882357543;
  v22 = &STACK[0xB7BFC0B77859756];
  v41 = &STACK[0xB7BFC0B77859756];
  sub_20AABEAE0((uint64_t)&v40);
  v6 = v32;
  v7 = (v2 - 1244749904) & 0x4A3161D7;
  v8 = (uint64_t)*(&off_24C363D30 + (v2 ^ 0xFC));
  v20 = *(_QWORD *)(v8 + 8 * v2) - 12;
  v29 = v5 + 2091876811;
  v15 = v5 + 1186465757;
  v18 = v5 - 292814610;
  v17 = v5 - 716322235;
  v25 = &v39;
  v10[1] = (char *)&v10[-79300361] + 4;
  v33 = v2 ^ 0x11B;
  v23 = vdupq_n_s32(0x1244BADFu);
  v24 = vdupq_n_s32(0x1244BACFu);
  v14 = v2 + 1125366672;
  v27 = v7 + 1256015612;
  v28 = v2;
  v13 = v2 + 903521182;
  v11 = 948 * (v2 ^ 0x4D);
  v12 = v11 ^ 0x757;
  v31 = v11 ^ 0x757u;
  v30 = v31;
  v21 = vdupq_n_s32(0x1244BACBu);
  v26 = v2 ^ 0x4F6;
  v19 = a1;
  v9 = v6 - 2 * ((v6 + 1862114806) & 0x6AA4CF7D ^ v6 & 1) - 643666574;
  v34 = ((v9 >> ((v7 + 46) ^ 0x1D)) ^ (((v7 + 46) | 0xAA) + 59))
      - ((2 * ((v9 >> ((v7 + 46) ^ 0x1D)) ^ (((v7 + 46) | 0xAA) + 59))) & 0xF7)
      - 5;
  v35 = (BYTE2(v9) ^ 0xA4) + (~(2 * (BYTE2(v9) ^ 0xA4)) | 9) - 4;
  v36 = (BYTE1(v9) ^ 0xCF) - ((2 * (BYTE1(v9) ^ 0xCF)) & 0xF7) - 5;
  v37 = (v6 - 2 * ((v6 - 10) & 0x7D ^ v6 & 1) + 114) ^ 0x87;
  __asm { BR              X15 }
}

uint64_t sub_20AAE0ABC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,int a30,unsigned int a31)
{
  int v31;
  int v32;
  int v33;
  int v34;
  uint64_t v35;
  int v36;
  unsigned int v37;

  v36 = v31 ^ 0x11D;
  v37 = v34 + 1535263363;
  if (v37 <= 0x40)
    v37 = 64;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v35
                                                                                + 8
                                                                                * ((121
                                                                                  * (-v32 - 1535263363 - v33 + v37 >= ((v36 + 1933814759) & 0x8CBC56DD) - 1230)) ^ v36))
                                                                    - 12))(3556836367, a2, a3, a31);
}

uint64_t sub_20AAE0B54(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  int v7;
  unsigned int v8;
  int v9;
  int v10;

  v7 = v2 ^ 0x51F;
  v8 = v4 + v3 + 1535263363;
  if (v8 <= 0x40)
    v9 = 64;
  else
    v9 = v8;
  v10 = !__CFADD__(v8 + ((v7 - 1994515338) & 0x76E1DFA7) - 806, v5 + v9);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 + 8 * (((2 * v10) | (v10 << 7)) ^ v7))
                                                            - 4))(a1, a2, 572);
}

uint64_t sub_20AAE0BD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, _OWORD *a7@<X7>, int a8@<W8>, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  uint64_t v28;

  *(_OWORD *)(a2 + (a8 + v27)) = *a7;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 + 8 * ((46 * (((((v26 - 803) | 0x309) ^ 0x113 ^ (((((v26 - 803) | 0x309u) + 0x1FFFFFCE5) & ((v25 ^ 0x706) + v24)) == 16)) & 1) == 0)) ^ ((v26 - 803) | 0x309))) - 12))(a1, a2, 46, a3, a4, a5, a6, a7, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24);
}

void sub_20AAE0C50()
{
  JUMPOUT(0x20AAE0C10);
}

uint64_t sub_20AAE0C58(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 + 8 * (v4 ^ (35 * (v2 == v3))))
                                                            - ((v4 - 459) ^ (v4 + 203586503) & 0xF3DD86FD ^ 0x49CLL)))(a1, a2, 572);
}

uint64_t sub_20AAE0CA8(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,unint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,int a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,int a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,int a53,int a54,int a55,int a56,int a57,int a58,int a59,unsigned int a60,int a61,unsigned __int8 a62)
{
  int v62;
  unint64_t v63;
  uint64_t v64;
  int v65;
  int v66;
  int v67;
  uint64_t v68;
  unsigned __int8 v69;
  int v70;
  BOOL v72;
  int v74;
  _BOOL4 v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, _QWORD, char *, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t (*v79)(uint64_t, uint64_t, char *);

  v67 = a62 ^ 0xE;
  v79 = *(uint64_t (**)(uint64_t, uint64_t, char *))(v64 + 8 * v62);
  if (v67 == 2)
  {
    v74 = a4 + 234;
    HIDWORD(a27) = a60;
    v76 = (unint64_t)&a45 < a28 && v63 < (unint64_t)&a54;
    v77 = (a36 + 1142) ^ 0x5A7u;
    v78 = (uint64_t (*)(uint64_t, _QWORD, char *, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v64 + 8 * (int)((v77 * v76) ^ v74)) - 8);
    return v78(a1, a60, &a45, v78, 2122182781, v77, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             a25,
             a26,
             a27);
  }
  else if (v67 == 1)
  {
    v68 = (a4 - 78) | 0x2BCu;
    v69 = a4 + 110;
    v70 = a4 + 683;
    v72 = (unint64_t)&a45 < a28 && v63 < (unint64_t)&a54;
    return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v64 + 8 * ((1494 * ((v72 ^ v69) & 1)) ^ v70)) - (v68 ^ 0x2B1)))(2122182781);
  }
  else
  {
    a56 = 2 * (a56 ^ v66) + v66 - (v65 & (4 * (a56 ^ v66)));
    a57 = 2 * (a57 ^ v66) + v66 - (v65 & (4 * (a57 ^ v66)));
    a58 = 2 * (a58 ^ v66) + v66 - (v65 & (4 * (a58 ^ v66)));
    a59 = 2 * (a59 ^ v66) + v66 - (v65 & (4 * (a59 ^ v66)));
    return v79(a1, a2, &a45);
  }
}

uint64_t sub_20AAE1D24(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,unsigned int a31,uint64_t a32,int a33)
{
  uint64_t v33;
  _BOOL4 v34;

  if (a31 < 0xD900C9B0 != a33 - 1392390657 < (a7 ^ 0xD900CFA4 ^ a4 ^ 0x2E2))
    v34 = a33 - 1392390657 < (a7 ^ 0xD900CFA4 ^ a4 ^ 0x2E2);
  else
    v34 = a33 - 1392390657 > a31;
  return (*(uint64_t (**)(void))(v33 + 8 * ((47 * !v34) ^ (a4 + 1352))))();
}

uint64_t sub_20AAE1DA8(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * (a7 ^ (115 * (v7 + a1 + 63 >= (v7 + a1)))))
                            - (a7 - 1130)
                            + 75))();
}

uint64_t sub_20AAE1DE0(int a1, int8x16_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int8x16_t v11;
  int8x16_t v12;

  *a2 = vaddq_s8(vsubq_s8(*(int8x16_t *)(v9 + (v6 + a1)), vandq_s8(vaddq_s8(*(int8x16_t *)(v9 + (v6 + a1)), *(int8x16_t *)(v9 + (v6 + a1))), v12)), v11);
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * (((((v7 - 54) ^ a6) == 64) * v10) ^ (v7 + 783))) - 4))();
}

uint64_t sub_20AAE1E38(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;

  *(_BYTE *)(a2 + v8) = *(_BYTE *)(v11 + (v7 + a1))
                      + ((a7 + 96) ^ v9)
                      - ((2 * *(_BYTE *)(v11 + (v7 + a1))) & 0xF7);
  return ((uint64_t (*)(void))(*(_QWORD *)(v10 + 8 * (((2 * (v8 == 63)) | ((v8 == 63) << 6)) ^ a7)) - 4))();
}

uint64_t sub_20AAE1E88(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,int a32)
{
  uint64_t v32;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32
                                                                        + 8
                                                                        * ((1005
                                                                          * (((a32 - 1047963909 < (a4 - 84)) ^ (a4 - 122)) & 1)) ^ (a4 + 1404)))
                                                            - 4))(a1, a2, a3);
}

void sub_20AAE1EEC()
{
  JUMPOUT(0x20AAE1058);
}

uint64_t sub_20AAE1F20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, unsigned int a16)
{
  int v16;
  int v17;
  uint64_t v18;
  _BOOL4 v19;
  unsigned int v20;
  int v21;
  _BOOL4 v22;

  v19 = a16 < a5;
  v20 = v16 + ((v17 - 594) ^ 0x1EDE4CB9);
  v21 = v19 ^ (v20 < 0x4ADD48D3);
  v22 = v20 < a16;
  if (!v21)
    v19 = v22;
  return ((uint64_t (*)(void))(*(_QWORD *)(v18 + 8 * ((125 * v19) ^ v17)) - 12))();
}

uint64_t sub_20AAE1F84@<X0>(int a1@<W0>, uint64_t a2@<X1>, int a3@<W2>, unsigned int a4@<W3>, unsigned int a5@<W4>, int a6@<W5>, char a7@<W6>, int a8@<W8>)
{
  int v8;
  int v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL4 v14;
  unsigned int v15;
  int v16;
  _BOOL4 v17;

  v14 = a4 < a5;
  *(_BYTE *)(a2 + (a8 + v10)) = a7
                                            + *(_BYTE *)(v13 + (v8 + a1))
                                            - ((2 * *(_BYTE *)(v13 + (v8 + a1))) & 0xF7)
                                            - 96;
  v15 = a3 + v8 + 42;
  v16 = v14 ^ (v15 < v11);
  v17 = v15 < a4;
  if (!v16)
    v14 = v17;
  return ((uint64_t (*)(void))(*(_QWORD *)(v12 + 8 * ((v14 * a6) ^ v9)) - 12))();
}

uint64_t sub_20AAE1FF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,int a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54)
{
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  unsigned int v59;
  int v62;

  v62 = 7 * (a7 ^ 0xB2);
  v57 = (a7 - 82) | 0x46u;
  v58 = 628203409 * ((((v56 - 168) | 0x9A7BC63F) + (~(v56 - 168) | 0x658439C0)) ^ 0x18F3CA0D);
  *(_QWORD *)(v54 + 360) = a22;
  *(_DWORD *)(v56 - 160) = v58 + a7 + 1588;
  *(_DWORD *)(v56 - 156) = a15 - v58;
  sub_20AABE384(v56 - 168);
  v59 = v62 ^ 0x673 ^ a54 & 0x3F;
  *(&a45 + v59) = 123;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v55 + 8 * ((1182 * (v59 > 0x37)) ^ a7)) - v57 + 75))(3556836367);
}

uint64_t sub_20AAE20FC()
{
  int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((200 * (v0 == ((v1 - 1412454916) & 0x543053FF) - 28)) ^ v1)) - 12))();
}

uint64_t sub_20AAE214C@<X0>(unsigned int a1@<W8>)
{
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((929 * (((((v1 - 78) | 0x42) - 60) ^ a1) > 7)) ^ (v1 + 70)))
                            - 4))();
}

uint64_t sub_20AAE2188(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(a2 + v3 + v5) = v7;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6
                                        + 8
                                        * ((v4 + 678) ^ 4 | (4
                                                           * (((((v4 + 678) ^ 4) - 707) | 0x21u) - 153 != (((v4 + 678) ^ 0x37F) & v2)))))
                            - 4))();
}

uint64_t sub_20AAE21D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(a2 + v2 + v4) = v8;
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * (v3 | (4 * (v4 + v6 - 153 != v5)))) - 4))();
}

uint64_t sub_20AAE2200()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((7 * (v2 ^ 0xAC) - 71) * (v1 == v0)) | v2))
                            - (v2 - 82)
                            + 75))();
}

uint64_t sub_20AAE2244@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  int v2;
  unsigned int v3;
  uint64_t v4;
  char v5;
  int v6;
  uint64_t v7;

  *(_BYTE *)(a1 + a2 + v4) = v5;
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((((unint64_t)(a2 + 1 + v4) < 0x40) * v6) ^ (v2 + 102)))
                            - (v2 ^ v3)
                            + 87))();
}

void sub_20AAE227C()
{
  JUMPOUT(0x20AAE1044);
}

uint64_t sub_20AAE22A4()
{
  int v0;
  uint64_t v1;
  int v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((725 * (v0 - 634403168 < ((v2 + 1640) ^ 0x68Fu))) ^ (v2 + 420)))
                            - 12))();
}

uint64_t sub_20AAE22EC()
{
  unsigned int v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v4 = v2 + v0 + ((v1 - 1881837512) & 0x702A895F) - 78;
  if (v4 <= 0x38)
    v4 = 56;
  return (*(uint64_t (**)(void))(v3 + 8 * ((87 * (v4 - v0 + 634403168 < 8)) ^ v1)))();
}

uint64_t sub_20AAE2350(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  *(_QWORD *)(a10 + v12) = v14;
  return ((uint64_t (*)(void))(*(_QWORD *)(v13
                                        + 8
                                        * ((((v10 & 0xFFFFFFFFFFFFFFF8) == 8) * ((v11 - 1267) ^ 0x483)) ^ (v11 - 1029)))
                            - 4))();
}

uint64_t sub_20AAE2394()
{
  int v0;
  _QWORD *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *v1 = v5;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * (((v3 == 0) * v2) ^ v0)) - 4))();
}

uint64_t sub_20AAE23B8()
{
  uint64_t v0;
  uint64_t v1;
  unsigned int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (int)(((((v2 + 257326235) & 0xF0A981EF) - 24) * (v0 == v1)) ^ v2))
                            - (v2 ^ 0x1C8)))();
}

uint64_t sub_20AAE2408@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  int v2;
  uint64_t v3;
  char v4;
  uint64_t v5;

  *(_BYTE *)(a1 + a2 + v3) = v4;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((v2 + 420) | (((unint64_t)(a2 + 1 + v3) < 0x38) << 9)))
                            - 12))();
}

void sub_20AAE2434()
{
  JUMPOUT(0x20AAE1044);
}

uint64_t sub_20AAE26A4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, int a3@<W8>)
{
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4
                                                                                 + 8
                                                                                 * ((((v3 & 0xFFFFFFFC) != (a3 | 0x102) + 1047963497)
                                                                                   * (((a3 | 0x102) - 2042771992) & 0x79C23BEF ^ 0x53)) ^ (a3 | 0x102)))
                                                                     - 4))(3247003328, a1, a2, 78);
}

uint64_t sub_20AAE2718@<X0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X7>, int a4@<W8>)
{
  int v4;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;

  *(_BYTE *)(a2 + (a4 + v7)) = *(_BYTE *)(a3 + (v5 + a1));
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((388 * (((v5 + 1) & 0xFFFFFFFC) == v6)) | (v4 - 388))) - 4))();
}

uint64_t sub_20AAE2768(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t (*a18)(uint64_t), uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  int v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;

  v25 = 628203409 * ((~((v24 - 168) | 0xCDC17F34) + ((v24 - 168) & 0xCDC17F34)) ^ 0xB0B68CF8);
  *(_DWORD *)(v24 - 160) = v25 + v22 + 1600;
  *(_DWORD *)(v24 - 156) = 832508462 - v25;
  *(_QWORD *)(v23 + 360) = a22;
  v26 = sub_20AABE384(v24 - 168);
  return a18(v26);
}

uint64_t sub_20AAE27D4(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,int a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,int a56,__int16 a57,char a58,char a59,int a60)
{
  uint64_t v60;
  uint64_t v62;
  unint64_t v63;

  if (a32 == 2)
    return ((uint64_t (*)(void))(*(_QWORD *)(v60 + 8 * (((a60 != 1741097738) * (a4 ^ 0x54B)) ^ (a4 + 829))) - 8))();
  if (a32 == 1)
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v60
                                                                          + 8
                                                                          * ((355 * (a60 == a4 + 1741097659)) ^ (a4 + 672)))
                                                              - 8))(a1, a2, a17);
  v62 = (a4 + 177) | 0x40u;
  v63 = ((unint64_t)&a38 ^ 0xE2D7DDF5FF06CBF5)
      + ((2 * (_QWORD)&a38) & 0xC5AFBBEBFE0D97E0)
      + (v62 ^ 0x7FBBF6BFE9FFF6B0)
      + 27;
  a59 = (v63 ^ 0xBA) * (v63 + 17);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v60 + 8 * (int)v62))(a1, a2, a17);
}

void sub_20AAE2B3C()
{
  JUMPOUT(0x20AAE2B10);
}

uint64_t sub_20AAE2B48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,int a42,char a43)
{
  _QWORD *v43;
  uint64_t v44;
  int v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint64_t v51;

  v49 = *(_QWORD *)(v47 + 24);
  v50 = 235795823
      * ((2 * (((v48 - 168) ^ 0x647D69BE) & 0x2D8F09D4) - ((v48 - 168) ^ 0x647D69BE) + 1383134762) ^ 0xA2A0D6CD);
  v43[47] = &a40;
  v43[48] = v49;
  v43[50] = &STACK[0x2152BE6AABE95751];
  v43[45] = &a43;
  *(_DWORD *)(v48 - 132) = (v46 + 1800) ^ v50;
  *(_DWORD *)(v48 - 160) = v50 + 246750542;
  v51 = ((uint64_t (*)(uint64_t))((char *)*(&off_24C363D30 + v46 + 91) - 8))(v48 - 168);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v44
                                                      + 8
                                                      * (((*(_DWORD *)(v48 - 136) == v45) * ((v46 + 13) ^ 0x374)) ^ v46))
                                          - 211 * (v46 ^ 0x46u)
                                          + 836))(v51);
}

uint64_t sub_20AAE2C64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  _BOOL4 v9;

  v6 = *(unsigned __int8 *)(*(_QWORD *)(v5 + 8) + v0 - 0x6A1E207A1D0C0C3CLL)
     - *(unsigned __int8 *)(v4 + v0 - 0x6A1E207A1D0C0C3CLL);
  v7 = v0 + 1;
  v9 = (v3 ^ 0xF9DFEE2B ^ v6) + 783548320 + ((2 * v6) & 0xF3BFDACE) == 680783111 && v7 != v2 + 16;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((53 * v9) ^ v3)) - 8))();
}

uint64_t sub_20AAE2CF0@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;

  v6 = ((((2 * (v5 - 168)) | 0x804FFAEF717A252) - (v5 - 168) - 0x4027FD77B8BD129) ^ 0xCB2C529EF269870) * v2;
  v7 = (a1 + 375001762) ^ v6;
  *(_DWORD *)(v5 - 152) = v7 ^ 0x16;
  *(_DWORD *)(v5 - 148) = a1 - v6 + 2104632311;
  *(_QWORD *)(v3 + 360) = v1 ^ v6;
  *(_QWORD *)(v3 + 384) = v6 + 680783111;
  *(_DWORD *)(v5 - 136) = ((a1 + 375001762) ^ 0x42) + v6;
  *(_DWORD *)(v5 - 160) = -(int)v6;
  *(_DWORD *)(v5 - 156) = v7;
  v8 = ((uint64_t (*)(uint64_t))((char *)*(&off_24C363D30 + a1 - 51) - 12))(v5 - 168);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v4 + 8 * *(int *)(v5 - 132)) - 8))(v8);
}

void sub_20AAE2DC8()
{
  uint64_t v0;

  *(_DWORD *)(v0 + 32) = 306494155;
}

void sub_20AAE2E14(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = *(_DWORD *)(a1 + 12) + 460628867 * ((a1 & 0x73B15F3F | ~(a1 | 0x73B15F3F)) ^ 0xC0D822BD);
  v2 = *((_QWORD *)*(&off_24C363D30 + v1 + 1)
       + ((920
         * (((uint64_t (*)(uint64_t, uint64_t))*(&off_24C363D30 + (v1 ^ 0x50)))(32, 0x101004023FF3BD5) != 0)) ^ v1));
  __asm { BR              X8 }
}

uint64_t sub_20AAE2EB0(uint64_t result)
{
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)result = 0;
  *(_QWORD *)(result + 8) = 0x7AB9CBDD7AB9CBDDLL;
  *(_QWORD *)(result + 16) = 0x2656B75837DFBE9BLL;
  *(_DWORD *)(result + 24) = 306494155;
  *(_QWORD *)(v2 - 0x7EF87141C217A9C1) = result + 0x140B289DC8FEE254;
  *((_DWORD *)v1 + 2) = 306494155;
  return result;
}

uint64_t sub_20AAE2F30(_DWORD *a1)
{
  unsigned int v1;
  unsigned int v2;

  v1 = 1178560073 * ((2 * (a1 & 0x7B1A53C3) - (_DWORD)a1 - 2065322948) ^ 0x3E71D45E);
  v2 = a1[1] + v1;
  return ((uint64_t (*)(void))(*((_QWORD *)*(&off_24C363D30 + (int)(v2 ^ 0x6BC))
                              + (int)(((((*a1 - v1) ^ 0x1244BACB) - 1 > 0x62) * ((v2 ^ 0x31D) - 1243)) ^ v2))
                            - 11 * (v2 ^ 0x679)
                            + 1290))();
}

uint64_t sub_20AAE2FD4()
{
  int v0;
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2 + 8 * ((668 * (((141 * (v1 ^ 0x519)) ^ 0xFFFFF993) + v0 > 0x9B)) ^ v1)))();
}

uint64_t sub_20AAE3014@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  int v2;
  int v3;
  int v4;

  if ((v2 + 48447 + 3 * (v4 ^ 0x717u)) >> 1 < 0xF9F)
    v3 = a2;
  *(_DWORD *)(*(_QWORD *)(result + 8) - 0x1722DFECD3A673BFLL) = v3;
  return result;
}

void sub_20AAE3098(uint64_t a1, uint64_t a2)
{
  __asm { BR              X9 }
}

uint64_t sub_20AAE3108@<X0>(int a1@<W8>)
{
  uint64_t v1;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * ((54
                                          * (((a1 - 274119351) ^ 0xEFEEEED520F9BDE9)
                                           + ((2 * (a1 - 274119351)) & 0x41F37BD2)
                                           + 0x1011112B727D7537 != 2474062624)) ^ 0x31Du))
                            - 4))();
}

uint64_t sub_20AAE31B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;

  v12 = *(unsigned __int8 *)(v9 + v10 - 0x5543F90E44265259 + ((v8 + 832164407) & 0xCE662FBD))
      - *(unsigned __int8 *)(v7 + v10 - 0x5543F90E44265259 + ((v8 + 832164407) & 0xCE662FBD));
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v11
                                                      + 8
                                                      * (((((2 * v12) & 0xFF7BEFC6) + (v12 ^ v6) == v6)
                                                        * (a6 + ((v8 - 2013365650) & 0x7BBFEF7F) + 434)) ^ v8))
                                          - 12))(4294925278);
}

uint64_t sub_20AAE3240(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  unint64_t v9;
  int v10;
  _BOOL4 v11;

  v8 = v4 < v5;
  v9 = (((a3 - 788) | 0x112u) ^ 0xAABC06F24F50E2FELL) + v6;
  v10 = v8 ^ (v9 < (unint64_t)(a3 - 501) + v3);
  v11 = v9 < v4;
  if (!v10)
    v8 = v11;
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((54 * v8) ^ a3)) - 4))();
}

uint64_t sub_20AAE32AC@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v2
                                                      + 8
                                                      * ((51 * (a1 != ((v1 + 805240324) & 0xD3BF6BF6 ^ 0x13E8D1D6))) ^ v1))
                                          - ((v1 - 137) ^ 0x9ELL)))(4294925278);
}

uint64_t sub_20AAE3300()
{
  unsigned __int8 *v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v2
                                                      + 8
                                                      * (((((2 * (*v0 - 42)) & 0x7F4B4F5E) + ((*v0 - 42) ^ 0x3FA5A7AF) == 1067820975)
                                                        * ((11 * (v1 ^ 0x9D)) ^ 0xDF)) ^ v1))
                                          - 12))(62810902);
}

uint64_t sub_20AAE336C()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((2020
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 1) - 134)))
                                           + ((*(unsigned __int8 *)(v2 + 1) - 134) ^ v0) == v0)) ^ v3))
                            - ((v3 + 19) ^ 0xA9)))();
}

uint64_t sub_20AAE33B0()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1953
                                          * (((v1 + ((v3 + 1439080277) & 0xAA3960BD) - 165) & (2
                                                                                             * (*(unsigned __int8 *)(v2 + 2)
                                                                                              - 72)))
                                           + ((*(unsigned __int8 *)(v2 + 2) - 72) ^ v0) == v0)) ^ v3))
                            - 12))();
}

uint64_t sub_20AAE3408()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1720
                                          * ((((*(unsigned __int8 *)(v2 + 3) - 134) << ((v3 + 19) ^ 0xA4)) & v1)
                                           + ((*(unsigned __int8 *)(v2 + 3) - 134) ^ v0) == v0)) ^ v3))
                            - 12))();
}

uint64_t sub_20AAE3450()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1803
                                          * ((((*(unsigned __int8 *)(v2 + 4) - 247) << ((v3 ^ 0x37) + 92)) & v1)
                                           + ((*(unsigned __int8 *)(v2 + 4) - 247) ^ v0) == v0)) ^ v3))
                            - 12))();
}

uint64_t sub_20AAE3498()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1626
                                          * ((((*(unsigned __int8 *)(v2 + 5) - 13) << (((v3 + 107) & 0xA7) + 92)) & v1)
                                           + ((*(unsigned __int8 *)(v2 + 5) - 13) ^ v0) == v0)) ^ v3))
                            - 12))();
}

uint64_t sub_20AAE34F0()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((7
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 6) - 1)))
                                           + ((*(unsigned __int8 *)(v2 + 6) - 1) ^ (v0 + (v3 ^ 0x37) - 165)) == v0)) ^ v3))
                            - 12))();
}

uint64_t sub_20AAE3538()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * (int)((((v1 & (2 * (*(unsigned __int8 *)(v2 + 7) - 1)))
                                                + ((*(unsigned __int8 *)(v2 + 7) - 1) ^ v0) == v0)
                                               * (((v3 + 625799971) & 0xDAB30CEF) + 1857)) ^ v3))
                            - 12))();
}

uint64_t sub_20AAE3588()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;

  v5 = v3 + 19 + *(unsigned __int8 *)(v2 + 8);
  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((((v1 & (2 * (v5 - 169))) + ((v5 - 169) ^ v0) == v0) * (v3 - 106)) ^ v3))
                            - 12))();
}

uint64_t sub_20AAE35C8(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  *(_DWORD *)(*(_QWORD *)(v4 + 96) + 1428) = 136689430;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * (((*(_DWORD *)(a2 + 4) == 274119360) * ((v2 - 16018771) & 0xF46EF9 ^ 0x2CC)) ^ (v2 - 43)))
                            - ((v2 + 2064335957) & 0x84F4BBBD ^ 0xA9)))();
}

uint64_t sub_20AAE3650(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((1808
                                          * ((((**(unsigned __int8 **)(a2 + 8) - 42) << ((v4 - 44) ^ 0x78)) & v3)
                                           + ((**(unsigned __int8 **)(a2 + 8) - 42) ^ v2) == v2)) | v4))
                            - 12))();
}

uint64_t sub_20AAE3698()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1403
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v3 + 1) - 134)))
                                           + ((*(unsigned __int8 *)(v3 + 1) - 134) ^ v0) == v0)) ^ v2))
                            - ((v2 + 1176517462) & 0xB9DFC67D)
                            + 621))();
}

uint64_t sub_20AAE36E8()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1774
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v3 + 2) - 72)))
                                           + (v2 ^ 0x2DC ^ (v0 - 473) ^ (*(unsigned __int8 *)(v3 + 2) - 72)) == v0)) ^ v2))
                            - 12))();
}

uint64_t sub_20AAE372C()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((457
                                          * ((((v2 + 468) ^ (v1 - 567)) & (2 * (*(unsigned __int8 *)(v3 + 3) - 134)))
                                           + ((*(unsigned __int8 *)(v3 + 3) - 134) ^ v0) == v0)) ^ v2))
                            - 12))();
}

uint64_t sub_20AAE376C()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((419
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v3 + 4) - 247)))
                                           + ((*(unsigned __int8 *)(v3 + 4) - 247) ^ v0) == v0)) ^ v2))
                            - ((v2 - 1007078822) & 0x3C06CF79)
                            + 621))();
}

uint64_t sub_20AAE37BC()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((((v1 & (2 * (*(unsigned __int8 *)(v3 + 5) - 13)))
                                           + ((*(unsigned __int8 *)(v3 + 5) - 13) ^ v0) == v0)
                                          * (211 * (v2 ^ 0xA6) + 291)) ^ v2))
                            - 12))();
}

uint64_t sub_20AAE3800()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((((v1 & (2 * (*(unsigned __int8 *)(v3 + 6) - 1)))
                                           + ((*(unsigned __int8 *)(v3 + 6) - 1) ^ v0) == v0)
                                          * (((v2 - 92) | 0x230) ^ 0x6B7)) ^ v2))
                            - 12))();
}

uint64_t sub_20AAE3844()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((863
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v3 + 7) - 1)))
                                           + ((*(unsigned __int8 *)(v3 + 7) - 1) ^ v0) == v0)) ^ v2))
                            - (v2 + 468)
                            + 621))();
}

uint64_t sub_20AAE3880()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;

  v5 = (((v2 ^ 0x2DC) - 530) ^ 0xFFFFFF9C) + *(unsigned __int8 *)(v3 + 8);
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((1248 * ((v1 & (2 * v5)) + (v5 ^ v0) == v0)) ^ v2)) - 12))();
}

uint64_t sub_20AAE38C8(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  *(_DWORD *)(*(_QWORD *)(v4 + 96) + 1428) = 136689434;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8 * ((194 * (*(_DWORD *)(a2 + 4) == ((3 * (v2 ^ 0xB4)) ^ 0x1056B8B9))) ^ v2))
                            - (v2 + 466)
                            + 557))();
}

uint64_t sub_20AAE392C(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  uint64_t v5;
  int v6;

  v6 = **(unsigned __int8 **)(a2 + 8) - 42;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((209
                                          * ((v3 & (2 * v6)) + ((v4 + 1254702710) & 0xB536BF77 ^ (v2 + 25) ^ v6) == v2)) ^ v4))
                            - 12))();
}

uint64_t sub_20AAE3984()
{
  int v0;
  int v1;
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * (int)((1722
                                               * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 1) - 134)))
                                                + ((*(unsigned __int8 *)(v2 + 1) - 134) ^ v0) == v0)) ^ v3))
                            - (v3 ^ 0x275)))();
}

uint64_t sub_20AAE39C8()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((((v1 & (2 * (*(unsigned __int8 *)(v2 + 2) - 72)))
                                           + ((*(unsigned __int8 *)(v2 + 2) - 72) ^ v0) == v0)
                                          * (v4 + 297)) ^ v3))
                            - 12))();
}

uint64_t sub_20AAE39FC()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((7
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 3) - 134)))
                                           + ((*(unsigned __int8 *)(v2 + 3) - 134) ^ v0) == ((v3 + 1185299454) & 0xB959C1EF ^ (v0 + 25)))) ^ v3))
                            - 12))();
}

uint64_t sub_20AAE3A50()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1894
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 4) - 247)))
                                           + ((*(unsigned __int8 *)(v2 + 4) - 247) ^ v0) == v0)) ^ v3))
                            - (v3 - 530)
                            + 91))();
}

uint64_t sub_20AAE3A90()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((471
                                          * ((((*(unsigned __int8 *)(v2 + 5) - 13) << (v3 - 120)) & v1)
                                           + ((*(unsigned __int8 *)(v2 + 5) - 13) ^ v0) == v0)) ^ v3))
                            - 12))();
}

uint64_t sub_20AAE3AD0()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((2686
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 6) - 1)))
                                           + ((*(unsigned __int8 *)(v2 + 6) - 1) ^ v0) == (v4 ^ (v0 + 25)))) ^ v3))
                            - 12))();
}

uint64_t sub_20AAE3B10()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1313
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 7) - 1)))
                                           + ((*(unsigned __int8 *)(v2 + 7) - 1) ^ v0) == v0)) ^ v3))
                            - ((v3 - 794012154) & 0x2F53A7E7)
                            + 91))();
}

uint64_t sub_20AAE3B60()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * ((1610
                                          * ((v1 & (2 * (*(unsigned __int8 *)(v2 + 8) - 11)))
                                           + ((*(unsigned __int8 *)(v2 + 8) - 11) ^ v0) == v0)) ^ v3))
                            - 12))();
}

void sub_20AAE3B98()
{
  int v0;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  int v6;

  v4 = (v0 + 442) | 0x18;
  *(_DWORD *)(*(_QWORD *)(v2 + 96) + 1428) = 136689446;
  v5 = 1178560073 * ((2 * ((v3 - 120) & 0x32C3D870) - (v3 - 120) + 1295787918) ^ 0xF7A85FEC);
  *(_QWORD *)(v3 - 112) = v3 + 0xB7BFC0B7785955ELL;
  *(_DWORD *)(v3 - 120) = -2072355622 * (295 * (v4 ^ 0x23C) - 1489490682) - (v5 + 2) - 813360466;
  *(_DWORD *)(v3 - 104) = v4 - v5 - 1882358033;
  v6 = v4;
  sub_20AABEAE0(v3 - 120);
  __asm { BR              X9 }
}

uint64_t sub_20AAE3DDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  unsigned int v14;

  v12 = v9 ^ 0x8D;
  v13 = (v9 ^ 0x8D) - 567;
  v14 = v8 + 1396932;
  if (v14 <= 0x40)
    v14 = 64;
  return (*(uint64_t (**)(void))(v10 + 8
                                    * (((a6 + (v12 ^ (v11 - 372)) + v13 - 199) * (a5 - v6 - v7 + v14 < 0xF)) ^ v12)))();
}

uint64_t sub_20AAE3E58(int a1, int a2, uint64_t a3, uint64_t a4, int a5, int a6)
{
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;

  v12 = v7 + v6;
  v13 = v12 + v9;
  if ((v12 + v9) <= 0x40)
    v13 = a1;
  return ((uint64_t (*)(void))(*(_QWORD *)(v10
                                        + 8
                                        * ((((((v8 - 1574453375) & 0x5DD84665) - a6 - 1439) ^ (v11 + 181))
                                          * (a5 - v12 >= (a2 + v13))) ^ v8))
                            - 4))();
}

uint64_t sub_20AAE3EB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;

  return ((uint64_t (*)(void))(*(_QWORD *)(v16
                                        + 8
                                        * ((247
                                          * (a14
                                           + v17
                                           - 220
                                           + (unint64_t)(v14 + ((v15 + 264169843) & 0xF3FF7B3E ^ 0x3AB3BD5)) > 0xF)) ^ v15))
                            - ((v15 - 872516389) & 0x37BFEFD6 ^ 0x3BE6B1ELL)))();
}

uint64_t sub_20AAE3F34@<X0>(int a1@<W5>, int a2@<W8>)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  int8x16_t *v6;
  uint64_t v7;
  int v8;
  int8x16_t v9;
  int8x16_t v10;

  v9.i64[0] = 0xF6F6F6F6F6F6F6F6;
  v9.i64[1] = 0xF6F6F6F6F6F6F6F6;
  v10.i64[0] = 0xFBFBFBFBFBFBFBFBLL;
  v10.i64[1] = 0xFBFBFBFBFBFBFBFBLL;
  *(int8x16_t *)(v4 + (a2 + v2)) = vaddq_s8(vsubq_s8(*v6, vandq_s8(vaddq_s8(*v6, *v6), v9)), v10);
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((60 * (((v5 + 1) & 0x1FFFFFFF0) == 16)) ^ (a1 + v3 + 76)))
                            - ((25 * (v3 ^ (v8 - 3))) ^ 0x75)))();
}

void sub_20AAE3FB0()
{
  JUMPOUT(0x20AAE3F70);
}

uint64_t sub_20AAE3FBC@<X0>(int a1@<W5>, int a2@<W8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * (((a1 + ((a2 + 28846471) | 0x2064112) + 1397) * (v2 == v3)) ^ a2))
                            - 4))();
}

uint64_t sub_20AAE4004@<X0>(int a1@<W5>, int a2@<W6>, int a3@<W8>)
{
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)(v8 - 220 + (a3 + v3)) = *(_BYTE *)(v4 + v6 - 2052478487)
                                                 - (((v5 - 119) & 0x7E ^ 0xE8) & (2 * *(_BYTE *)(v4 + v6 - 2052478487)))
                                                 - 5;
  return (*(uint64_t (**)(void))(v7 + 8 * ((87 * ((a2 + a3 + 1102) > 0x3F)) ^ (a1 + v5 + 1360))))();
}

uint64_t sub_20AAE4084(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, unint64_t a19, uint64_t (*a20)(__n128, __n128, __n128, __n128, __n128),uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,int32x4_t a25,int32x4_t a26,int32x4_t a27,int32x4_t a28)
{
  int v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  unsigned int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t (*v38)(__n128, __n128, __n128, __n128, __n128);
  const char *v39;
  __n128 v40;
  __n128 v41;
  __n128 v42;
  __n128 v43;
  int v44;
  __n128 v45;
  int v46;
  int v47;
  unsigned int v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  uint8x16_t v53;
  uint16x8_t v54;
  int8x16_t v55;
  int8x16_t v56;
  uint16x8_t v57;
  int8x16_t v58;
  int8x16_t v59;
  uint8x16_t v60;
  uint16x8_t v61;
  uint16x8_t v62;
  uint8x16_t v63;
  int8x16_t v66;
  int8x16_t v71;
  int32x4_t v72;
  int32x4_t v73;
  int32x4_t v74;
  int32x4_t v75;
  char *v76;
  char *v77;
  uint64_t v79;
  uint64_t v80;
  uint8x16_t v81;
  uint16x8_t v82;
  uint16x8_t v83;
  uint8x16_t v84;
  uint8x16_t v89;
  uint16x8_t v90;
  uint16x8_t v91;
  int32x4_t v92;
  int32x4_t v93;
  int32x4_t v94;
  int32x4_t v95;
  uint64_t v96;
  _DWORD *v97;
  int v98;
  int v99;
  int v100;
  unint64_t v101;
  uint64_t v102;
  uint64_t (*v103)(uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t (*)(__n128, __n128, __n128, __n128, __n128), uint64_t, uint64_t, uint64_t, uint64_t);
  int8x16x4_t v104;
  int8x16x4_t v105;

  v38 = *(uint64_t (**)(__n128, __n128, __n128, __n128, __n128))(v30 + 8 * v28);
  LODWORD(a18) = HIDWORD(a13) - 1050827688;
  HIDWORD(a17) = (((v28 ^ 0x91) + 2143283976) & 0x83FE7F7E) - 745486953;
  v39 = (const char *)(v36 - 220);
  v40.n128_u64[0] = 0xFBFBFBFBFBFBFBFBLL;
  v40.n128_u64[1] = 0xFBFBFBFBFBFBFBFBLL;
  v41 = (__n128)vdupq_n_s32(0x1244BACFu);
  v42 = (__n128)vdupq_n_s32(0x1244BACBu);
  a23 = v35 - 16;
  v43.n128_u64[0] = 0xF6F6F6F6F6F6F6F6;
  v43.n128_u64[1] = 0xF6F6F6F6F6F6F6F6;
  v44 = (v37 + 358941920) & 0x6DC91FB;
  v45 = (__n128)vdupq_n_s32(0x1244BADFu);
  HIDWORD(a22) = v44 ^ 0x1FA;
  LODWORD(a22) = v44 ^ 0x1BC;
  v47 = *(_DWORD *)(v36 - 148);
  v46 = *(_DWORD *)(v36 - 144);
  HIDWORD(a21) = v47;
  v49 = *(_DWORD *)(v36 - 140);
  v48 = *(_DWORD *)(v36 - 136);
  v50 = v49;
  v51 = v48;
  v52 = *(_BYTE *)(v36 - 124) ^ 0xE;
  LODWORD(a17) = *(unsigned __int8 *)(v36 - 124) ^ 0xE;
  if (v52 == 2)
  {
    HIDWORD(a18) = v46;
    a19 = __PAIR64__(v48, v49);
    a20 = v38;
    v105 = vld4q_s8(v39);
    v79 = (a6 + v37 + 108);
    v80 = *(unsigned int *)(v36 - 132);
    HIDWORD(a16) = *(_DWORD *)(v36 - 132);
    v81 = (uint8x16_t)veorq_s8(v105.val[0], (int8x16_t)v40);
    v82 = vmovl_u8(*(uint8x8_t *)v81.i8);
    v83 = vmovl_high_u8(v81);
    v84 = (uint8x16_t)veorq_s8(v105.val[1], (int8x16_t)v40);
    _Q22 = vmovl_u8(*(uint8x8_t *)v84.i8);
    _Q21 = vmovl_high_u8(v84);
    __asm
    {
      SHLL2           V23.4S, V21.8H, #0x10
      SHLL2           V24.4S, V22.8H, #0x10
    }
    v89 = (uint8x16_t)veorq_s8(v105.val[2], (int8x16_t)v40);
    v90 = vmovl_high_u8(v89);
    v91 = vmovl_u8(*(uint8x8_t *)v89.i8);
    v105.val[0] = veorq_s8(v105.val[3], (int8x16_t)v40);
    v105.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v105.val[0]);
    v105.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v105.val[1]);
    v105.val[1] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v105.val[1].i8);
    v105.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v105.val[0].i8);
    v105.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v105.val[0]);
    v105.val[0] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v105.val[0].i8);
    v92 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q22.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v91.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v82.i8), 0x18uLL)), v105.val[0]);
    v93 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(_Q24, (int8x16_t)vshll_high_n_u16(v91, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v82), 0x18uLL)), v105.val[3]);
    v94 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q21.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v90.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v83.i8), 0x18uLL)), v105.val[1]);
    v95 = (int32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(_Q23, (int8x16_t)vshll_high_n_u16(v90, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v83), 0x18uLL)), v105.val[2]);
    v105.val[0] = veorq_s8(vandq_s8((int8x16_t)v92, (int8x16_t)v41), (int8x16_t)(*(_OWORD *)v105.val & __PAIR128__(0xFFFFFF04FFFFFF04, 0xFFFFFF04FFFFFF04)));
    v105.val[3] = veorq_s8(vandq_s8((int8x16_t)v93, (int8x16_t)v41), (int8x16_t)(*(_OWORD *)&v105.val[3] & __PAIR128__(0xFFFFFF04FFFFFF04, 0xFFFFFF04FFFFFF04)));
    v105.val[1] = veorq_s8(vandq_s8((int8x16_t)v94, (int8x16_t)v41), (int8x16_t)(*(_OWORD *)&v105.val[1] & __PAIR128__(0xFFFFFF04FFFFFF04, 0xFFFFFF04FFFFFF04)));
    v105.val[2] = veorq_s8(vandq_s8((int8x16_t)v95, (int8x16_t)v41), (int8x16_t)(*(_OWORD *)&v105.val[2] & __PAIR128__(0xFFFFFF04FFFFFF04, 0xFFFFFF04FFFFFF04)));
    a27 = vaddq_s32(vsubq_s32(v94, vaddq_s32((int32x4_t)v105.val[1], (int32x4_t)v105.val[1])), (int32x4_t)v42);
    a28 = vaddq_s32(vsubq_s32(v95, vaddq_s32((int32x4_t)v105.val[2], (int32x4_t)v105.val[2])), (int32x4_t)v42);
    a25 = vaddq_s32(vsubq_s32(v92, vaddq_s32((int32x4_t)v105.val[0], (int32x4_t)v105.val[0])), (int32x4_t)v42);
    a26 = vaddq_s32(vsubq_s32(v93, vaddq_s32((int32x4_t)v105.val[3], (int32x4_t)v105.val[3])), (int32x4_t)v42);
    v96 = v79 ^ 0x700;
    v97 = (_DWORD *)&a25 + v34 + 1582360344;
    v98 = *(v97 - 8) ^ *(v97 - 3);
    v99 = *(v97 - 16) ^ *(v97 - 14) ^ (v98 + v32 - ((2 * v98) & 0x24897596));
    HIDWORD(v101) = v96 ^ (v32 + 559) ^ v99;
    LODWORD(v101) = v99;
    v100 = v101 >> 31;
    v102 = (2 * v100) & 0x24897596;
    *v97 = v100 + v32 - v102;
    v103 = (uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t (*)(__n128, __n128, __n128, __n128, __n128), uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 + 8 * (int)((1792 * (v35 == 1582360281)) ^ v79)) - 12);
    return v103(v79, v103, v80, a23, v51, v102, v96, v50, a9, a10, a11, a12, a13, a14, v29, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             a24);
  }
  else if (v52 == 1)
  {
    HIDWORD(a18) = v46;
    a19 = __PAIR64__(v48, v49);
    a20 = v38;
    v104 = vld4q_s8(v39);
    v53 = (uint8x16_t)veorq_s8(v104.val[0], (int8x16_t)v40);
    v54 = vmovl_u8(*(uint8x8_t *)v53.i8);
    v55 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v54.i8);
    v56 = (int8x16_t)vmovl_high_u16(v54);
    v57 = vmovl_high_u8(v53);
    v58 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v57.i8);
    v59 = (int8x16_t)vmovl_high_u16(v57);
    v60 = (uint8x16_t)veorq_s8(v104.val[1], (int8x16_t)v40);
    v61 = vmovl_high_u8(v60);
    v62 = vmovl_u8(*(uint8x8_t *)v60.i8);
    v63 = (uint8x16_t)veorq_s8(v104.val[2], (int8x16_t)v40);
    _Q26 = (int8x16_t)vmovl_high_u8(v63);
    _Q25 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v63.i8);
    v66 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q25.i8, 0x10uLL);
    __asm { SHLL2           V25.4S, V25.8H, #0x10 }
    v71 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q26.i8, 0x10uLL);
    __asm { SHLL2           V26.4S, V26.8H, #0x10 }
    v104.val[0] = veorq_s8(v104.val[3], (int8x16_t)v40);
    v104.val[1] = (int8x16_t)vmovl_high_u8((uint8x16_t)v104.val[0]);
    v104.val[2] = (int8x16_t)vmovl_high_u16((uint16x8_t)v104.val[1]);
    v104.val[0] = (int8x16_t)vmovl_u8(*(uint8x8_t *)v104.val[0].i8);
    v104.val[3] = (int8x16_t)vmovl_high_u16((uint16x8_t)v104.val[0]);
    v104.val[0] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v104.val[0].i8), 0x18uLL), v66), vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v62.i8, 8uLL), v55));
    v104.val[3] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v104.val[3], 0x18uLL), _Q25), vorrq_s8((int8x16_t)vshll_high_n_u16(v62, 8uLL), v56));
    v104.val[1] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v104.val[1].i8), 0x18uLL), v71), vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v61.i8, 8uLL), v58));
    v104.val[2] = vorrq_s8(vorrq_s8((int8x16_t)vshlq_n_s32((int32x4_t)v104.val[2], 0x18uLL), _Q26), vorrq_s8((int8x16_t)vshll_high_n_u16(v61, 8uLL), v59));
    v72 = (int32x4_t)veorq_s8(vandq_s8(v104.val[0], (int8x16_t)v45), (int8x16_t)(*(_OWORD *)&v55 & __PAIR128__(0xFFFFFF14FFFFFF14, 0xFFFFFF14FFFFFF14)));
    v73 = (int32x4_t)veorq_s8(vandq_s8(v104.val[3], (int8x16_t)v45), (int8x16_t)(*(_OWORD *)&v56 & __PAIR128__(0xFFFFFF14FFFFFF14, 0xFFFFFF14FFFFFF14)));
    v74 = (int32x4_t)veorq_s8(vandq_s8(v104.val[1], (int8x16_t)v45), (int8x16_t)(*(_OWORD *)&v58 & __PAIR128__(0xFFFFFF14FFFFFF14, 0xFFFFFF14FFFFFF14)));
    v75 = (int32x4_t)veorq_s8(vandq_s8(v104.val[2], (int8x16_t)v45), (int8x16_t)(*(_OWORD *)&v59 & __PAIR128__(0xFFFFFF14FFFFFF14, 0xFFFFFF14FFFFFF14)));
    a27 = vaddq_s32(vsubq_s32((int32x4_t)v104.val[1], vaddq_s32(v74, v74)), (int32x4_t)v42);
    a28 = vaddq_s32(vsubq_s32((int32x4_t)v104.val[2], vaddq_s32(v75, v75)), (int32x4_t)v42);
    a25 = vaddq_s32(vsubq_s32((int32x4_t)v104.val[0], vaddq_s32(v72, v72)), (int32x4_t)v42);
    a26 = vaddq_s32(vsubq_s32((int32x4_t)v104.val[3], vaddq_s32(v73, v73)), (int32x4_t)v42);
    v76 = (char *)*(&off_24C363D30 + HIDWORD(a22)) - 4;
    v77 = (char *)*(&off_24C363D30 + a22) - 12;
    return ((uint64_t (*)(char *, char *, char *, uint64_t, _QWORD, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t (*)(__n128, __n128, __n128, __n128, __n128), uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 + 8 * ((946 * (a23 + 1 != v35)) ^ v44)) - 4))(v76, (char *)*(&off_24C363D30 + v44 - 348) - 12, v77, a23 + 1, v48, -(v77[a23 + v34] - 117), v50, a25.i32[(v76[a23 + v34] - 30)] ^ v32, a9, a10, a11, a12, a13, a14, v29, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             a24);
  }
  else
  {
    *(_DWORD *)(v36 - 148) = (v47 ^ v31)
                           + (HIDWORD(a21) ^ v31)
                           + v31
                           - (v33 & (2 * ((v47 ^ v31) + (HIDWORD(a21) ^ v31))));
    *(_DWORD *)(v36 - 144) = 2 * (v46 ^ v31) + v31 - (v33 & (4 * (v46 ^ v31)));
    *(_DWORD *)(v36 - 140) = 2 * (v49 ^ v31) + v31 - (v33 & (4 * (v49 ^ v31)));
    *(_DWORD *)(v36 - 136) = 2 * (v48 ^ v31) + v31 - (v33 & (4 * (v48 ^ v31)));
    return v38(v40, v41, v42, v43, v45);
  }
}

void sub_20AAE4164()
{
  JUMPOUT(0x20AAE4190);
}

void sub_20AAE43E8()
{
  JUMPOUT(0x20AAE42F4);
}

uint64_t sub_20AAE43FC()
{
  unsigned int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((2027 * (v1 + 1 == v3 + 16)) ^ v0)) - 4))();
}

uint64_t sub_20AAE44D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4;
  uint64_t v5;
  uint64_t v6;

  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((299 * (a4 + 1 == v6 + 32)) ^ v4)) - 4))();
}

uint64_t sub_20AAE45A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v6;
  uint64_t v7;
  uint64_t v8;

  return (*(uint64_t (**)(void))(v7 + 8 * ((230 * (a6 + 1 == v8 + 48)) ^ v6)))();
}

void sub_20AAE4688()
{
  JUMPOUT(0x20AAE4BE8);
}

uint64_t sub_20AAE4874(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v7;
  uint64_t v8;

  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((111 * (a4 + 1 == v8 + 4)) ^ a7)) - 12))();
}

uint64_t sub_20AAE494C(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((1373 * (v2 + 1 != v4 + 24)) ^ a2)) - 12))();
}

uint64_t sub_20AAE49FC(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;

  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * ((35 * (a6 + 1 == v7 + 44)) ^ a2)) - 12))();
}

uint64_t sub_20AAE4AD4(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((1656 * (v3 + 1 == v5 + 64)) ^ a3)) - 12))();
}

void sub_20AAE4B90(uint64_t a1, int a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17)
{
  int v17;
  uint64_t v18;

  *(_DWORD *)(v18 - 132) = (a2 ^ v17)
                         + (a17 ^ v17)
                         + v17
                         - (((a4 ^ 0x3BE694B) + 508934524) & (2 * ((a2 ^ v17) + (a17 ^ v17))));
  JUMPOUT(0x20AAE4BE0);
}

uint64_t sub_20AAE4C68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, uint64_t a16, int a17, unsigned int a18, unsigned int a19)
{
  uint64_t v19;
  int v20;
  _BOOL4 v21;

  if (a19 < a18 != (a15 + 1559812822) < 0xD74F30AD)
    v21 = (a15 + 1559812822) < 0xD74F30AD;
  else
    v21 = a15 + 1559812822 > a19;
  return ((uint64_t (*)(void))(*(_QWORD *)(v19 + 8 * ((!v21 * (((a6 + v20 + 195) | 0x44) ^ 0x794)) ^ (a6 + v20 + 372)))
                            - 8))();
}

uint64_t sub_20AAE4CF4(int a1)
{
  int v1;
  int v2;
  uint64_t v3;
  int v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * (((((a1 + 35408196) | 0x1A22006) ^ (v4 - 439))
                                          * (v1 + v2 + 63 >= (v1 + v2))) ^ a1))
                            - 8))();
}

uint64_t sub_20AAE4D40(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;

  return ((uint64_t (*)(void))(*(_QWORD *)(v16
                                        + 8
                                        * (((a14 + v15 - (unint64_t)(((v17 + a1 - 460) ^ 0x8617C2FF) + v14) > 0xF)
                                          * ((a1 - a6 - 263) ^ (v17 - 1))) | a1))
                            - 8))();
}

uint64_t sub_20AAE4D94(int8x16_t a1, double a2, double a3, int8x16_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, int a9, int a10)
{
  int v10;
  int8x16_t *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  *v11 = vaddq_s8(vsubq_s8(*(int8x16_t *)(v13 + (v10 + v12)), vandq_s8(vaddq_s8(*(int8x16_t *)(v13 + (v10 + v12)), *(int8x16_t *)(v13 + (v10 + v12))), a4)), a1);
  return (*(uint64_t (**)(void))(v14 + 8 * (((((a10 + a6 - 153) | 0x10) != 108) * a9) ^ (a10 + a6 + 797))))();
}

uint64_t sub_20AAE4DF0@<X0>(int a1@<W5>, uint64_t a2@<X8>)
{
  int v2;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  *(_BYTE *)(v3 + a2) = *(_BYTE *)(v7 + (v2 + v5))
                      + ((v4 - v9 + 60) ^ 0xC7)
                      - ((2 * *(_BYTE *)(v7 + (v2 + v5))) & 0xF7);
  return (*(uint64_t (**)(void))(v8 + 8 * (((a2 != 63) * v6) ^ (a1 + v4 + 797))))();
}

uint64_t sub_20AAE4E44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14)
{
  int v14;
  uint64_t v15;
  int v16;
  _BOOL4 v17;

  v17 = v14 + 295199057 < (a14 + 1979525907);
  if (a14 + 1979525907 < ((v16 + 768444042) & 0xD23277FF ^ 0x8BEEB325) != (v14 + 295199057) < 0x8BEEB768)
    v17 = a14 + 1979525907 < ((v16 + 768444042) & 0xD23277FF ^ 0x8BEEB325);
  return ((uint64_t (*)(void))(*(_QWORD *)(v15 + 8 * ((v17 | (4 * v17)) ^ v16)) - 8))();
}

uint64_t sub_20AAE4EC8(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14)
{
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v17 = 628203409 * ((2 * ((v15 - 120) & 0x16DC8320) - (v15 - 120) + 1763933404) ^ 0xEBAB70EF);
  *(_QWORD *)(v15 - 120) = a11;
  *(_DWORD *)(v15 - 112) = v17 + a2 + 578;
  *(_DWORD *)(v15 - 108) = a14 - v17 + v16 + (a2 ^ 0x7D4) + 401544998;
  v18 = sub_20AABE384(v15 - 120);
  v19 = *(_DWORD *)(v15 - 152) & 0x3F;
  *(_BYTE *)(v15 - 220 + (v19 ^ 0x2C)) = 123;
  return (*(uint64_t (**)(uint64_t))(v14 + 8 * ((154 * ((v19 ^ 0x2C) > 0x37)) ^ a2)))(v18);
}

uint64_t sub_20AAE4FC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,int a23)
{
  int v23;
  uint64_t v24;

  return ((uint64_t (*)(uint64_t, uint64_t))(*(_QWORD *)(v24 + 8 * ((1917 * (v23 != 63)) ^ a23)) - 12))(a1, -1356258370);
}

uint64_t sub_20AAE5014(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int v6;
  int v7;
  uint64_t v8;
  int v9;

  return ((uint64_t (*)(void))(*(_QWORD *)(v8
                                        + 8
                                        * ((239
                                          * ((v6 ^ (v9 - 17) ^ v7 ^ (v9 + 606)) < a6
                                                                                              + ((v7 + 146078) | 0x3BC2A16u)
                                                                                              - 189)) ^ v7))
                            - 8))();
}

uint64_t sub_20AAE5064@<X0>(uint64_t a1@<X1>, int a2@<W5>, uint64_t a3@<X8>)
{
  int v3;
  char v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v6 - 220 + a3 + a1) = 0xFBFBFBFBFBFBFBFBLL;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((25 * (((v3 + 1962271719) & 0x874BB78F) - 1669 != (v4 & 0x38))) ^ (a2 + v3 + 484)))
                            - 4))();
}

uint64_t sub_20AAE50D0@<X0>(int a1@<W0>, int a2@<W8>)
{
  unsigned int v2;
  int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  _BOOL4 v11;
  unsigned int v12;
  int v13;
  _BOOL4 v14;

  v11 = v2 < v4;
  *(_BYTE *)(v10 - 220 + a2 - 1990338186 + ((v9 + 1302970890) & 0xB2563C7F)) = *(_BYTE *)(v7 + (v3 + v6))
                                                                             + (~(2
                                                                                * *(_BYTE *)(v7 + (v3 + v6))) | 9)
                                                                             - 4;
  v12 = v3 + 1 + a1;
  v13 = v11 ^ (v12 < v5);
  v14 = v12 < v2;
  if (!v13)
    v11 = v14;
  return ((uint64_t (*)(void))(*(_QWORD *)(v8 + 8 * ((v11 | (4 * v11)) ^ v9)) - 8))();
}

uint64_t sub_20AAE515C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W5>, int a4@<W8>)
{
  uint64_t v4;
  int v5;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4
                                                                        + 8
                                                                        * ((1397 * (a4 + ((v5 + a3) ^ 0xAF29237B) < 0x38)) ^ (v5 + a3 + 54)))
                                                            - 12))(a1, a2, -1356258370);
}

uint64_t sub_20AAE519C@<X0>(uint64_t a1@<X2>, unsigned int a2@<W8>)
{
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  if (a1 + (unint64_t)a2 + 1 > 0x38)
    v5 = a1 + a2 + 1;
  else
    v5 = 56;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((537
                                          * (((v4 + v2 + 60) ^ (v5
                                                                               - a2
                                                                               + ((v4 + v2 - 197) ^ 0x5368B754uLL) < 8)) & 1)) ^ v2))
                            - 12))();
}

uint64_t sub_20AAE51FC@<X0>(uint64_t a1@<X2>, int a2@<W5>, uint64_t a3@<X8>)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v6 - 220 + a3 + a1) = 0xFBFBFBFBFBFBFBFBLL;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * ((22
                                          * (((v3 - 1246529577) & 0x468E1DD7 ^ 0xCDLL) != (v4 & 0xFFFFFFFFFFFFFFF8))) ^ (a2 + v3 + 168)))
                            - 12))();
}

uint64_t sub_20AAE526C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * (((a6 + ((v8 + 45107777) | 0x10E2010) - 135) * (v6 == v7)) ^ v8))
                            - ((v8 - a6) ^ 0x3BE6B1ALL)))();
}

void sub_20AAE52C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;
  char v7;
  int v8;
  unint64_t v9;
  char v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unint64_t v15;

  v8 = *(unsigned __int8 *)(v6 - 124) ^ 0xE;
  if (v8 == 1)
  {
    v14 = *(_DWORD *)(v6 - 156);
    v13 = *(_DWORD *)(v6 - 152);
    *(_BYTE *)(v6 - 164) = ((a6 + v7 - 101) ^ (8 * v13)) + ~(2 * ((a6 + v7 - 101) ^ (8 * v13))) - 4;
    *(_BYTE *)(v6 - 163) = ((v13 >> 5) ^ 0x79) - ((2 * ((v13 >> 5) ^ 0x79)) & 0xF7) - 5;
    *(_BYTE *)(v6 - 162) = ((v13 >> 13) ^ 0x7D) + ((2 * (((v13 >> 13) ^ 0x7D | 0xFB) ^ (v13 >> 13))) ^ 0xF3) - 4;
    *(_BYTE *)(v6 - 161) = ((v13 >> 21) ^ 0xC2) + ((v13 >> 20) & 0xF6 ^ 0x7B) - 4;
    HIDWORD(v15) = v14 ^ 0x1B;
    LODWORD(v15) = v13 ^ 0x80000000;
    *(_BYTE *)(v6 - 160) = (v15 >> 29) - ((2 * (v15 >> 29)) & 0xF7) - 5;
    *(_BYTE *)(v6 - 159) = ((v14 >> 5) ^ 0xBE) + ((2 * (((v14 >> 5) ^ 0xBE | 0xFB) ^ (v14 >> 5))) ^ 0x75) - 4;
    *(_BYTE *)(v6 - 158) = ((v14 >> 13) ^ 0x52) + ((v14 >> 12) & 0xF6 ^ 0x5B) - 4;
    v10 = a6 + v7 - 105;
    v12 = (v14 >> 20) & 0xFF6 ^ 0xFFFFFF89;
    v11 = (v14 >> 21) ^ 0x3B;
  }
  else
  {
    if (v8 != 2)
      goto LABEL_6;
    v11 = *(_DWORD *)(v6 - 156);
    v12 = *(_DWORD *)(v6 - 152);
    *(_BYTE *)(v6 - 164) = ((v11 >> 21) ^ 0x3B) + ((v11 >> 20) & 0xF6 ^ 0x89) - 4;
    *(_BYTE *)(v6 - 163) = ((v11 >> 13) ^ 0x52) - ((2 * ((v11 >> 13) ^ 0x52)) & 0xF7) - 5;
    *(_BYTE *)(v6 - 162) = ((v11 >> 5) ^ 0xBE) - ((2 * ((v11 >> 5) ^ 0xBE)) & 0xF7) - 5;
    HIDWORD(v9) = v11 ^ 0x1B;
    LODWORD(v9) = v12 ^ 0x80000000;
    *(_BYTE *)(v6 - 161) = (v9 >> 29) + (~(2 * (v9 >> 29)) | 9) - 4;
    *(_BYTE *)(v6 - 160) = ((v12 >> 21) ^ 0xC2) + ((v12 >> 20) & 0xF6 ^ 0x7B) - 4;
    *(_BYTE *)(v6 - 159) = ((v12 >> 13) ^ 0x7D) + ((2 * (((v12 >> 13) ^ 0x7D | 0xFB) ^ (v12 >> 13))) ^ 0xF3) - 4;
    v10 = 92;
    *(_BYTE *)(v6 - 158) = ((v12 >> 5) ^ 0x79) + (~(2 * ((v12 >> 5) ^ 0x79)) | 9) - 4;
    LOBYTE(v11) = (8 * v12) ^ 0x60;
    LOBYTE(v12) = (16 * v12) ^ 0x3F;
  }
  *(_BYTE *)(v6 - 157) = v12 + v11 + (v10 ^ (v7 + 52) ^ 0xEA);
LABEL_6:
  JUMPOUT(0x20AAE4190);
}

uint64_t sub_20AAE570C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;

  return ((uint64_t (*)(void))(*(_QWORD *)(v9 + 8 * (((a6 + ((v8 - 1612) ^ (v10 + 65)) + 296) * (v7 == v6)) ^ v8)) - 8))();
}

void sub_20AAE5748()
{
  JUMPOUT(0x20AAE4190);
}

uint64_t sub_20AAE5760@<X0>(uint64_t a1@<X1>, int a2@<W5>, uint64_t a3@<X8>)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v6 = a3 + a1;
  *(_BYTE *)(v5 - 220 + v6) = -5;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((49 * ((unint64_t)(v6 + 1) < 0x40)) ^ (a2 + v3 + 724)))
                            - 12))();
}

uint64_t sub_20AAE5828(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  unsigned int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  unsigned int v14;
  int v15;
  _BOOL4 v16;
  _BOOL4 v17;

  v13 = (v9 + v5);
  v14 = *(_DWORD *)(v11 - 220 + v13 + 72);
  v15 = (v14 >> (v7 ^ (v12 + 2) ^ (v12 - 16))) ^ 0xA;
  *(_BYTE *)(a5 + (v13 + 1)) = v15 + (~(2 * v15) | 9) - 4;
  *(_BYTE *)(a5 + (v13 + 2)) = (BYTE1(v14) ^ 0x12) - ((2 * (BYTE1(v14) ^ 0x12)) & 0xF7) - 5;
  *(_BYTE *)(a5 + v13) = (HIBYTE(v14) ^ 0x11) - ((2 * (HIBYTE(v14) ^ 0x11)) & 0xF7) - 5;
  *(_BYTE *)(a5 + (v13 + 3)) = v14 ^ 0xB2;
  LODWORD(v13) = *(_DWORD *)(v11 - 128) + 1564104498;
  v16 = v13 < v6;
  v17 = v9 - 1345512480 < v13;
  if (v9 - 1345512480 < v6 != v16)
    v17 = v16;
  return (*(uint64_t (**)(void))(v10 + 8 * ((v17 * v8) ^ v7)))();
}

void sub_20AAE59A8()
{
  JUMPOUT(0x20AAE5978);
}

uint64_t sub_20AAE59B0(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 4);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 8);
  return 0;
}

uint64_t sub_20AAE59C8(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  int v8;
  uint64_t result;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = 1374699841 * (a1 ^ 0x6DF41809);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 16);
  v6 = *(_DWORD *)(a1 + 56);
  v7 = 1224239923
     * (((&v10 | 0xFA076D68) - &v10 + (&v10 & 0x5F89290)) ^ 0x8B490BF);
  v8 = (*(_DWORD *)(a1 + 8) ^ v2) - 1695027417;
  v10 = *(_QWORD *)a1;
  v16 = v8 + v7 + 943;
  v13 = v3;
  v14 = v5;
  v12 = v4;
  v11 = v2 + v6 - v7 - 311004561;
  result = ((uint64_t (*)(uint64_t *))((char *)*(&off_24C363D30 + v8) - 4))(&v10);
  *(_DWORD *)(a1 + 24) = v15;
  return result;
}

uint64_t sub_20AAE5AE4(uint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  BOOL v4;
  _BOOL4 v5;
  int v6;
  BOOL v7;
  uint64_t v8;

  v1 = 1755732067 * ((2 * (result & 0x155053FA18C8728CLL) - result + 0x6AAFAC05E7378D73) ^ 0xB7040B3A39F130A8);
  v2 = *(_QWORD *)(result + 8) - v1;
  v3 = *(_QWORD *)(result + 24) - v1;
  v4 = v3 >= v2;
  v5 = (uint64_t)v3 < (uint64_t)v2;
  v6 = !v4;
  if (((*(_DWORD *)(result + 32) - 1755732067 * ((2 * (result & 0x18C8728C) - (_DWORD)result - 415789709) ^ 0x39F130A8)) & 1) == 0)
    v5 = v6;
  v7 = !v5;
  v8 = 16;
  if (!v7)
    v8 = 4;
  *(_DWORD *)result = *(_DWORD *)(result + v8) ^ (1755732067
                                                * ((2 * (result & 0x18C8728C) - result - 415789709) ^ 0x39F130A8)) ^ (*(_DWORD *)(result + 20) + 1755732067 * ((2 * (result & 0x18C8728C) - result - 415789709) ^ 0x39F130A8));
  return result;
}

void sub_20AAE5B8C(_DWORD *a1)
{
  unsigned int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = (*a1 ^ (535753261
             * ((1711628207 - (a1 | 0x66055FAF) + (a1 | 0x99FAA050)) ^ 0x930EAE7F)))
     - 2138962157;
  v2 = *(_QWORD *)*(&off_24C363D30
                  + (int)((*a1 ^ (535753261
                                * ((1711628207 - (a1 | 0x66055FAF) + (a1 | 0x99FAA050)) ^ 0x930EAE7F)))
                        - 2138963260));
  v3 = (3804331 * ((&v2 + 728022483 - 2 * ((unint64_t)&v2 & 0x2B64BDD3)) ^ 0x55B19825)) ^ v1;
  sub_20AAB0294((uint64_t)&v2);
}

uint64_t sub_20AAE5C84(int *a1)
{
  int v2;
  signed int v3;
  uint64_t result;
  int v5;

  v2 = a1[1];
  v3 = v2 - 108757529 * (a1 ^ 0xE09C622B) + 504207067;
  result = ((uint64_t (*)(char *, char *))*(&off_24C363D30
                                                    + (int)(v2 - 108757529 * (a1 ^ 0xE09C622B) + 504207254)))((char *)*(&off_24C363D30 + (int)(v2 - 108757529 * (a1 ^ 0xE09C622B) + 504207223)) - 4, (char *)*(&off_24C363D30 + v3) - 4);
  v5 = *(_DWORD *)*(&off_24C363D30 + v3 + 140);
  if ((_DWORD)result)
    v5 = -306454411;
  *a1 = v5;
  return result;
}

uint64_t sub_20AAE5D1C(uint64_t a1)
{
  int v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t result;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  unsigned int v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = 460628867 * (((a1 | 0x167EA26) - a1 + (a1 & 0xFE9815D9)) ^ 0x4DF1685B);
  v3 = *(_DWORD *)(a1 + 20) - v2;
  v4 = *(_DWORD *)(a1 + 24);
  v6 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v7 = 1755732067 * ((&v9 & 0xA133159 | ~(&v9 | 0xA133159)) ^ 0x2B2A737D);
  v13 = (*(_DWORD *)(a1 + 16) - v2) ^ v7 ^ 0xF5794FA7;
  v11 = v7 ^ (v3 + 2024873910);
  v10 = v6;
  v12 = v5;
  v9 = v2 + v4 + v7 + 743964252;
  result = ((uint64_t (*)(int *))((char *)*(&off_24C363D30 + (int)(v3 ^ 0x874EE3FE)) - 12))(&v9);
  *(_DWORD *)(a1 + 28) = v14;
  return result;
}

uint64_t sub_20AAE5E64(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 4);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 8);
  return 0;
}

uint64_t sub_20AAE5E7C(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  unsigned int v8;
  uint64_t result;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = 628203409 * (((a1 | 0xBB8CAEEC) - (a1 & 0xBB8CAEEC)) ^ 0x3904A2DF);
  v3 = *(_DWORD *)a1 + v2;
  v4 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 24);
  v5 = *(_QWORD *)(a1 + 32);
  v7 = *(_DWORD *)(a1 + 20);
  v8 = 235795823 * ((((2 * &v10) | 0x230C1690) - &v10 - 293997384) ^ 0x852B4211);
  v10 = *(_QWORD *)(a1 + 48);
  v15 = v8 ^ (v3 - 368398311);
  v11 = v2 + v7 + 17197159 + v8;
  v16 = v4;
  v12 = v6;
  v13 = v5;
  result = ((uint64_t (*)(uint64_t *))((char *)*(&off_24C363D30 + (v3 ^ 0x15F557AC)) - 8))(&v10);
  *(_DWORD *)(a1 + 40) = v14;
  return result;
}

uint64_t sub_20AAE5FB4(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 4);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 8);
  return 0;
}

uint64_t sub_20AAE5FCC(uint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  BOOL v4;
  _BOOL4 v5;
  int v6;
  uint64_t v7;

  v1 = 1374699841 * ((result - 2 * (result & 0xA8F7ECC532399345) - 0x5708133ACDC66CBBLL) ^ 0xA6FB72C95FCD8B4CLL);
  v2 = *(_QWORD *)(result + 16) ^ v1;
  v3 = *(_QWORD *)(result + 8) - v1;
  v4 = v2 == v3;
  v5 = v2 > v3;
  v6 = v4;
  if (((*(_DWORD *)(result + 24) + 1374699841 * (((_DWORD)result - 2 * (result & 0x32399345) + 842634053) ^ 0x5FCD8B4C)) & 1) == 0)
    v5 = v6;
  v4 = !v5;
  v7 = 32;
  if (!v4)
    v7 = 28;
  *(_DWORD *)(result + 36) = *(_DWORD *)(result + 40) ^ (1374699841
                                                       * ((result - 2 * (result & 0x32399345) + 842634053) ^ 0x5FCD8B4C)) ^ *(_DWORD *)(result + v7) ^ (1374699841 * ((result - 2 * (result & 0x32399345) + 842634053) ^ 0x5FCD8B4C));
  return result;
}

uint64_t sub_20AAE605C(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 24);
  return 0;
}

void sub_20AAE6074()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v0 = qword_254614B30 - (_QWORD)&v1 + qword_254614AD8;
  qword_254614B30 = 1801249171 * v0 + 0x4AADAB03756D799ELL;
  qword_254614AD8 = 1801249171 * (v0 ^ 0x8915C65683065AAALL);
  LOBYTE(v0) = -109 * ((-109 * v0 - 98) ^ 0xAA ^ qword_254614AD8);
  v2 = (uint64_t)*(&off_24C363D30
                + (v0 ^ byte_20AB0EAC0[byte_20AB0AE60[v0] ^ 0x7E])
                + 82);
  v3 = 584 - 1759421093 * (((&v2 | 0x628343A3) + (~&v2 | 0x9D7CBC5C)) ^ 0xD1FEF3F6);
  sub_20AAB4D74((uint64_t)&v2);
}

void sub_20AAE6194()
{
  unint64_t v0;
  _BYTE v1[8];
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v0 = (unint64_t)&v1[qword_254614AD8 ^ qword_254613F10];
  qword_254613F10 = 1801249171 * v0 - 0x76EA39A97CF9A556;
  qword_254614AD8 = 1801249171 * (v0 ^ 0x8915C65683065AAALL);
  v2 = (uint64_t)*(&off_24C363D30
                + ((-109 * (qword_254613F10 ^ 0xAA ^ qword_254614AD8)) ^ byte_20AB12B20[byte_20AB0E9C0[(-109 * (qword_254613F10 ^ 0xAA ^ qword_254614AD8))] ^ 0xF0])
                - 139);
  v3 = 584 - 1759421093 * (&v2 ^ 0xB37DB054);
  sub_20AAB4D74((uint64_t)&v2);
  v3 = 584
     - 1759421093 * ((-332373302 - (&v2 | 0xEC3062CA) + (&v2 | 0x13CF9D35)) ^ 0xA0B22D61);
  v2 = (uint64_t)*(&off_24C363D30
                + ((-109 * ((qword_254614AD8 + qword_254613F10) ^ 0xAA)) ^ byte_20AB0AF60[byte_20AB078E0[(-109 * ((qword_254614AD8 + qword_254613F10) ^ 0xAA))] ^ 0xDA])
                + 3);
  sub_20AAB4D74((uint64_t)&v2);
  LODWORD(v2) = 1225351577 * ((&v2 - 2 * (&v2 & 0x6C3D3DA4) + 1815952804) ^ 0x4FA7E5B2)
              + 570;
  BYTE4(v2) = (-103 * ((&v2 - 2 * (&v2 & 0xA4) - 92) ^ 0xB2)) | 1;
  sub_20AAA9E48((uint64_t)&v2);
}

uint64_t sub_20AAE6390(uint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  BOOL v4;
  _BOOL4 v5;
  int v6;
  int v7;
  uint64_t v8;

  v1 = 1178560073 * ((2 * (result & 0x64AC438940A5398ALL) - result + 0x1B53BC76BF5AC675) ^ 0xAFEC9E05CEBE17);
  v2 = *(_QWORD *)(result + 16) - v1;
  v3 = *(_QWORD *)(result + 40) + v1;
  v4 = v2 == v3;
  v5 = v2 > v3;
  v6 = v4;
  if (((*(_DWORD *)(result + 24) - 1178560073 * ((2 * (result & 0x40A5398A) - (_DWORD)result - 1084569995) ^ 0x5CEBE17)) & 1) != 0)
    v7 = v5;
  else
    v7 = v6;
  v4 = v7 == 0;
  v8 = 4;
  if (!v4)
    v8 = 8;
  *(_DWORD *)result = *(_DWORD *)(result + 28) ^ (1178560073
                                                * ((2 * (result & 0x40A5398A) - result - 1084569995) ^ 0x5CEBE17)) ^ (*(_DWORD *)(result + v8) - 1178560073 * ((2 * (result & 0x40A5398A) - result - 1084569995) ^ 0x5CEBE17));
  return result;
}

uint64_t sub_20AAE6434(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 8);
  v1 = *(_QWORD *)(a1 + 16);
  v3 = (*(_DWORD *)a1 ^ (235795823 * ((2 * (a1 & 0x5AD4AFC8) - a1 + 623595575) ^ 0xB186196E))) - 426522901;
  v5 = v3
     + 1225351577 * ((((&v5 | 0xA0EBB684) ^ 0xFFFFFFFE) - (~&v5 | 0x5F14497B)) ^ 0x7C8E916D)
     + 1822;
  v6 = v1;
  v7 = v2;
  return ((uint64_t (*)(unsigned int *))*(&off_24C363D30 + v3))(&v5);
}

uint64_t sub_20AAE6524(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a1 + 88) = 19;
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 4);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 8);
  return 0;
}

uint64_t sub_20AAE6544(uint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  BOOL v4;
  _BOOL4 v5;
  int v6;
  int v7;
  BOOL v8;
  uint64_t v9;

  v1 = 235795823 * ((~result & 0x2A1D36B9A93A3D3 | result & 0xFD5E2C94656C5C2CLL) ^ 0xA1169950E3EEA8ALL);
  v2 = *(_QWORD *)(result + 24) - v1;
  v3 = *(_QWORD *)result ^ v1;
  v4 = v3 >= v2;
  v5 = v3 != v2;
  v6 = v4;
  if (((*(_DWORD *)(result + 8) + (_DWORD)v1) & 1) != 0)
    v7 = v6;
  else
    v7 = v5;
  v8 = v7 == 0;
  v9 = 16;
  if (!v8)
    v9 = 12;
  *(_DWORD *)(result + 36) = *(_DWORD *)(result + v9) ^ v1 ^ (*(_DWORD *)(result + 32) - v1);
  return result;
}

_BYTE *sub_20AAE65DC(_BYTE *result, char a2, unint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -(int)result & 7;
  if (v3 > a3)
    LODWORD(v3) = a3;
  switch((int)v3)
  {
    case 1:
      goto LABEL_10;
    case 2:
      goto LABEL_9;
    case 3:
      goto LABEL_8;
    case 4:
      goto LABEL_7;
    case 5:
      goto LABEL_6;
    case 6:
      goto LABEL_5;
    case 7:
      *result++ = a2;
LABEL_5:
      *result++ = a2;
LABEL_6:
      *result++ = a2;
LABEL_7:
      *result++ = a2;
LABEL_8:
      *result++ = a2;
LABEL_9:
      *result++ = a2;
LABEL_10:
      *result++ = a2;
      break;
    default:
      break;
  }
  v4 = a3 - v3;
  v6 = v4;
  v5 = v4 & 7;
  switch(v6)
  {
    case 0uLL:
      return result;
    case 1uLL:
      goto LABEL_20;
    case 2uLL:
      goto LABEL_19;
    case 3uLL:
      goto LABEL_18;
    case 4uLL:
      goto LABEL_17;
    case 5uLL:
      goto LABEL_16;
    case 6uLL:
      goto LABEL_15;
    case 7uLL:
      *result++ = a2;
LABEL_15:
      *result++ = a2;
LABEL_16:
      *result++ = a2;
LABEL_17:
      *result++ = a2;
LABEL_18:
      *result++ = a2;
LABEL_19:
      *result++ = a2;
LABEL_20:
      *result = a2;
      break;
    default:
      result = (_BYTE *)((uint64_t (*)(void))((char *)&loc_20AAE666C + 4 * byte_20AB0EBC7[(v5 >> 3) & 7]))();
      break;
  }
  return result;
}

os_log_t _HSLogCategoryLibrary()
{
  return os_log_create("com.apple.amp.HomeSharing", "Library");
}

void HSSetKeychainValueForAccountWithService(void *a1)
{
  __CFString *v1;
  __CFString *v2;
  __CFDictionary *v3;
  const __CFDictionary *v4;
  void *v5;
  void *v6;
  __CFDictionary *Mutable;
  id v8;

  v8 = a1;
  v1 = CFSTR("default");
  v2 = CFSTR("com.apple.mobileipod.homeSharingPassword");
  v3 = _HSCreateKeychainQueryForAccountWithService();
  if (v3)
  {
    v4 = v3;
    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(v8, "dataUsingEncoding:", 4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      HSGetKeychainValueForAccountWithService();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDE9550], v5);
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDE8F60], (const void *)*MEMORY[0x24BDE8F98]);
        SecItemUpdate(v4, Mutable);
        CFRelease(Mutable);
      }
      else
      {
        CFDictionarySetValue(v4, (const void *)*MEMORY[0x24BDE9550], v5);
        CFDictionarySetValue(v4, (const void *)*MEMORY[0x24BDE8F60], (const void *)*MEMORY[0x24BDE8F98]);
        SecItemAdd(v4, 0);
      }

    }
    else
    {
      SecItemDelete(v4);
    }
    CFRelease(v4);
  }

}

void ParseItemPropertyCode(int a1, unsigned __int8 *a2, unsigned int a3, _QWORD *a4, const __CFString **a5)
{
  const __CFString *v9;
  const __CFString *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  unsigned int v14;
  __int16 v15;
  unsigned int v16;
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  unsigned int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (a1 <= 1634952288)
  {
    if (a1 > 1634031683)
    {
      if (a1 <= 1634358894)
      {
        if (a1 > 1634354516)
        {
          if (a1 <= 1634356847)
          {
            if (a1 > 1634356832)
            {
              if (a1 != 1634356833)
              {
                if (a1 == 1634356837)
                {
                  _NSNumberForNetworkUIntOfLength(a2, a3);
                  *a4 = (id)objc_claimAutoreleasedReturnValue();
                  if (!a5)
                    return;
                  v9 = CFSTR("com.apple.jingle.newsstandBindingEdge");
                  goto LABEL_481;
                }
                goto LABEL_472;
              }
              v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
              *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
              if (a5)
              {
                v10 = CFSTR("com.apple.itunes.store.newsstand-artwork-url");
                goto LABEL_485;
              }
              goto LABEL_486;
            }
            if (a1 == 1634354517)
            {
              v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
              *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
              if (!a5)
                goto LABEL_486;
              v10 = CFSTR("com.apple.itunes.store.extras-url");
            }
            else
            {
              if (a1 != 1634354547)
                goto LABEL_472;
              v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
              *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
              if (!a5)
                goto LABEL_486;
              v10 = CFSTR("com.apple.itunes.store.episode-screenshot");
            }
          }
          else
          {
            if (a1 <= 1634357332)
            {
              if (a1 == 1634356848)
              {
                _NSNumberForNetworkUIntOfLength(a2, a3);
                *a4 = (id)objc_claimAutoreleasedReturnValue();
                if (!a5)
                  return;
                v9 = CFSTR("com.apple.jingle.AppIconNeedsShine");
                goto LABEL_481;
              }
              if (a1 == 1634356852)
              {
                _NSNumberForNetworkUIntOfLength(a2, a3);
                *a4 = (id)objc_claimAutoreleasedReturnValue();
                if (!a5)
                  return;
                v9 = CFSTR("com.apple.jingle.newsstandBindingType");
                goto LABEL_481;
              }
              goto LABEL_472;
            }
            switch(a1)
            {
              case 1634357333:
                v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
                *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
                if (!a5)
                  goto LABEL_486;
                v10 = CFSTR("com.apple.itunes.store.product-url");
                break;
              case 1634358884:
                v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
                *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
                if (!a5)
                  goto LABEL_486;
                v10 = CFSTR("com.apple.itunes.store.vpp-org-display-name");
                break;
              case 1634358892:
                _NSNumberForNetworkUIntOfLength(a2, a3);
                *a4 = (id)objc_claimAutoreleasedReturnValue();
                if (!a5)
                  return;
                v9 = CFSTR("com.apple.itunes.store.vpp-is-licensed");
                goto LABEL_481;
              default:
                goto LABEL_472;
            }
          }
        }
        else if (a1 <= 1634036069)
        {
          if (a1 > 1634035299)
          {
            if (a1 == 1634035300)
            {
              _NSNumberForNetworkUIntOfLength(a2, a3);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              if (!a5)
                return;
              v9 = CFSTR("com.apple.itunes.item-flavor-id");
              goto LABEL_481;
            }
            if (a1 == 1634035308)
            {
              *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
              if (!a5)
                return;
              v9 = CFSTR("com.apple.itunes.item-flavor-listing");
              goto LABEL_481;
            }
            goto LABEL_472;
          }
          if (a1 == 1634031684)
          {
            v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
            *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
            if (!a5)
              goto LABEL_486;
            v10 = CFSTR("com.apple.itunes.xid");
          }
          else
          {
            if (a1 != 1634034544)
              goto LABEL_472;
            v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
            *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
            if (!a5)
              goto LABEL_486;
            v10 = CFSTR("com.apple.itunes.collection-description");
          }
        }
        else
        {
          if (a1 <= 1634037877)
          {
            if (a1 == 1634036070)
            {
              *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
              if (!a5)
                return;
              v9 = CFSTR("com.apple.itunes.item-flavor");
              goto LABEL_481;
            }
            if (a1 == 1634037872)
            {
              _NSNumberForNetworkUIntOfLength(a2, a3);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              if (!a5)
                return;
              v9 = CFSTR("com.apple.itunes.page-progression");
              goto LABEL_481;
            }
            goto LABEL_472;
          }
          switch(a1)
          {
            case 1634037878:
              v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
              *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
              if (!a5)
                goto LABEL_486;
              v10 = CFSTR("com.apple.itunes.publication-version");
              break;
            case 1634038895:
              _NSNumberForNetworkUIntOfLength(a2, a3);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              if (!a5)
                return;
              v9 = CFSTR("com.apple.itunes.cloud-purchased-token");
              goto LABEL_481;
            case 1634169456:
              v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
              *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
              if (!a5)
                goto LABEL_486;
              v10 = CFSTR("daap.songgrouping");
              break;
            default:
              goto LABEL_472;
          }
        }
        goto LABEL_485;
      }
      if (a1 <= 1634952035)
      {
        if (a1 > 1634951531)
        {
          switch(a1)
          {
            case 1634951787:
              _NSNumberForNetworkUIntOfLength(a2, a3);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              if (!a5)
                return;
              v9 = CFSTR("daap.bookmarkable");
              goto LABEL_481;
            case 1634951788:
            case 1634951789:
            case 1634951790:
            case 1634951792:
            case 1634951793:
            case 1634951795:
              goto LABEL_472;
            case 1634951791:
              _NSNumberForNetworkUIntOfLength(a2, a3);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              if (!a5)
                return;
              v9 = CFSTR("daap.songbookmark");
              goto LABEL_481;
            case 1634951794:
              _NSNumberForNetworkUIntOfLength(a2, a3);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              if (!a5)
                return;
              v9 = CFSTR("daap.songbitrate");
              goto LABEL_481;
            case 1634951796:
              _NSNumberForNetworkUIntOfLength(a2, a3);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              if (!a5)
                return;
              v9 = CFSTR("daap.songbeatsperminute");
              goto LABEL_481;
            default:
              if (a1 != 1634951532)
              {
                if (a1 != 1634951538)
                  goto LABEL_472;
                v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
                *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
                if (a5)
                {
                  v10 = CFSTR("daap.songartist");
                  goto LABEL_485;
                }
                goto LABEL_486;
              }
              v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
              *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
              if (!a5)
                goto LABEL_486;
              v10 = CFSTR("daap.songalbum");
              break;
          }
          goto LABEL_485;
        }
        if (a1 <= 1634951520)
        {
          if (a1 == 1634358895)
          {
            _NSNumberForNetworkUIntOfLength(a2, a3);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            if (!a5)
              return;
            v9 = CFSTR("com.apple.itunes.store.vpp-org-id");
            goto LABEL_481;
          }
          if (a1 == 1634759535)
          {
            +[HSResponseDataParser _parseItemsResponseWithBytes:length:usingHandler:](HSResponseDataParser, "_parseItemsResponseWithBytes:length:usingHandler:", a2, a3, 0);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            if (!a5)
              return;
            v9 = CFSTR("daap.playlistsongs");
            goto LABEL_481;
          }
          goto LABEL_472;
        }
        if (a1 != 1634951521)
        {
          if (a1 == 1634951529)
          {
            _NSNumberForNetworkUIntOfLength(a2, a3);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            if (!a5)
              return;
            v9 = CFSTR("daap.songalbumid");
            goto LABEL_481;
          }
          goto LABEL_472;
        }
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
        *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
        if (!a5)
          goto LABEL_486;
        v10 = CFSTR("daap.songalbumartist");
        goto LABEL_485;
      }
      switch(a1)
      {
        case 1634952036:
          _NSNumberForNetworkUIntOfLength(a2, a3);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          if (!a5)
            return;
          v9 = CFSTR("daap.songcodectype");
          break;
        case 1634952045:
          v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
          *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
          if (!a5)
            goto LABEL_486;
          v10 = CFSTR("daap.songcomment");
          goto LABEL_485;
        case 1634952046:
          v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
          *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
          if (!a5)
            goto LABEL_486;
          v10 = CFSTR("daap.songcontentdescription");
          goto LABEL_485;
        case 1634952047:
          _NSNumberForNetworkUIntOfLength(a2, a3);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          if (!a5)
            return;
          v9 = CFSTR("daap.songcompilation");
          break;
        case 1634952048:
          v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
          *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
          if (!a5)
            goto LABEL_486;
          v10 = CFSTR("daap.songcomposer");
          goto LABEL_485;
        case 1634952050:
          _NSNumberForNetworkUIntOfLength(a2, a3);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          if (!a5)
            return;
          v9 = CFSTR("daap.songcontentrating");
          break;
        case 1634952051:
          _NSNumberForNetworkUIntOfLength(a2, a3);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          if (!a5)
            return;
          v9 = CFSTR("daap.songcodecsubtype");
          break;
        case 1634952052:
          v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
          *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
          if (!a5)
            goto LABEL_486;
          v10 = CFSTR("daap.songcategory");
          goto LABEL_485;
        default:
          goto LABEL_472;
      }
LABEL_481:
      *a5 = v9;
      return;
    }
    if (a1 > 1634027348)
    {
      if (a1 <= 1634029141)
      {
        if (a1 <= 1634027852)
        {
          if (a1 > 1634027587)
          {
            if (a1 == 1634027588)
            {
              _NSNumberForNetworkUIntOfLength(a2, a3);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              if (!a5)
                return;
              v9 = CFSTR("com.apple.itunes.is-hd-video");
              goto LABEL_481;
            }
            if (a1 == 1634027606)
            {
              _NSNumberForNetworkUIntOfLength(a2, a3);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              if (!a5)
                return;
              v9 = CFSTR("com.apple.itunes.has-video");
              goto LABEL_481;
            }
          }
          else
          {
            if (a1 == 1634027349)
            {
              _NSNumberForNetworkUIntOfLength(a2, a3);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              if (!a5)
                return;
              v9 = CFSTR("com.apple.itunes.gapless-dur");
              goto LABEL_481;
            }
            if (a1 == 1634027587)
            {
              _NSNumberForNetworkUIntOfLength(a2, a3);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              if (!a5)
                return;
              v9 = CFSTR("com.apple.itunes.has-chapter-data");
              goto LABEL_481;
            }
          }
        }
        else if (a1 <= 1634028337)
        {
          if (a1 == 1634027853)
          {
            _NSNumberForNetworkUIntOfLength(a2, a3);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            if (!a5)
              return;
            v9 = CFSTR("com.apple.itunes.itunes-machine-id");
            goto LABEL_481;
          }
          if (a1 == 1634028337)
          {
            _NSNumberForNetworkUIntOfLength(a2, a3);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            if (!a5)
              return;
            v9 = CFSTR("com.apple.itunes.drm-key1-id");
            goto LABEL_481;
          }
        }
        else
        {
          switch(a1)
          {
            case 1634028338:
              _NSNumberForNetworkUIntOfLength(a2, a3);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              if (!a5)
                return;
              v9 = CFSTR("com.apple.itunes.drm-key2-id");
              goto LABEL_481;
            case 1634028907:
              _NSNumberForNetworkUIntOfLength(a2, a3);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              if (!a5)
                return;
              v9 = CFSTR("com.apple.itunes.extended-media-kind");
              goto LABEL_481;
            case 1634029124:
              _NSNumberForNetworkUIntOfLength(a2, a3);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              if (!a5)
                return;
              v9 = CFSTR("com.apple.itunes.non-drm-user-id");
              goto LABEL_481;
          }
        }
        goto LABEL_472;
      }
      if (a1 <= 1634029667)
      {
        if (a1 > 1634029642)
        {
          if (a1 == 1634029643)
          {
            _NSNumberForNetworkUIntOfLength(a2, a3);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            if (!a5)
              return;
            v9 = CFSTR("com.apple.itunes.playlist-kind");
            goto LABEL_481;
          }
          if (a1 == 1634029651)
          {
            _NSNumberForNetworkUIntOfLength(a2, a3);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            if (!a5)
              return;
            v9 = CFSTR("com.apple.itunes.special-playlist");
            goto LABEL_481;
          }
        }
        else
        {
          if (a1 == 1634029142)
          {
            _NSNumberForNetworkUIntOfLength(a2, a3);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            if (!a5)
              return;
            v9 = CFSTR("com.apple.itunes.norm-volume");
            goto LABEL_481;
          }
          if (a1 == 1634029636)
          {
            *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
            if (!a5)
              return;
            v9 = CFSTR("com.apple.itunes.playlist-data");
            goto LABEL_481;
          }
        }
        goto LABEL_472;
      }
      if (a1 <= 1634029682)
      {
        if (a1 != 1634029668)
        {
          if (a1 == 1634029682)
          {
            _NSNumberForNetworkUIntOfLength(a2, a3);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            if (!a5)
              return;
            v9 = CFSTR("com.apple.itunes.playlist-sort-is-reversed");
            goto LABEL_481;
          }
          goto LABEL_472;
        }
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
        *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
        if (a5)
        {
          v10 = CFSTR("com.apple.itunes.display-publication-version");
          goto LABEL_485;
        }
        goto LABEL_486;
      }
      switch(a1)
      {
        case 1634029683:
          _NSNumberForNetworkUIntOfLength(a2, a3);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          if (!a5)
            return;
          v9 = CFSTR("com.apple.itunes.playlist-sort");
          goto LABEL_481;
        case 1634030160:
          v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
          *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
          if (!a5)
            goto LABEL_486;
          v10 = CFSTR("com.apple.itunes.item-redownload-param");
          break;
        case 1634030192:
          v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
          *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
          if (!a5)
            goto LABEL_486;
          v10 = CFSTR("com.apple.itunes.item-redownload-param-2");
          break;
        default:
          goto LABEL_472;
      }
    }
    else
    {
      if (a1 > 1634026575)
      {
        if (a1 <= 1634027331)
        {
          if (a1 > 1634026581)
          {
            if (a1 == 1634026582)
            {
              _NSNumberForNetworkUIntOfLength(a2, a3);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              if (!a5)
                return;
              v9 = CFSTR("com.apple.itunes.drm-versions");
              goto LABEL_481;
            }
            if (a1 == 1634027090)
            {
              _NSNumberForNetworkUIntOfLength(a2, a3);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              if (!a5)
                return;
              v9 = CFSTR("com.apple.itunes.supports-fprap");
              goto LABEL_481;
            }
          }
          else
          {
            if (a1 == 1634026576)
            {
              _NSNumberForNetworkUIntOfLength(a2, a3);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              if (!a5)
                return;
              v9 = CFSTR("com.apple.itunes.drm-platform-id");
              goto LABEL_481;
            }
            if (a1 == 1634026578)
            {
              _NSNumberForNetworkUIntOfLength(a2, a3);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              if (!a5)
                return;
              v9 = CFSTR("com.apple.itunes.drm-user-id");
              goto LABEL_481;
            }
          }
        }
        else if (a1 <= 1634027335)
        {
          if (a1 == 1634027332)
          {
            _NSNumberForNetworkUIntOfLength(a2, a3);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            if (!a5)
              return;
            v9 = CFSTR("com.apple.itunes.gapless-enc-dr");
            goto LABEL_481;
          }
          if (a1 == 1634027333)
          {
            _NSNumberForNetworkUIntOfLength(a2, a3);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            if (!a5)
              return;
            v9 = CFSTR("com.apple.itunes.gapless-enc-del");
            goto LABEL_481;
          }
        }
        else
        {
          switch(a1)
          {
            case 1634027336:
              _NSNumberForNetworkUIntOfLength(a2, a3);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              if (!a5)
                return;
              v9 = CFSTR("com.apple.itunes.gapless-heur");
              goto LABEL_481;
            case 1634027346:
              _NSNumberForNetworkUIntOfLength(a2, a3);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              if (!a5)
                return;
              v9 = CFSTR("com.apple.itunes.gapless-resy");
              goto LABEL_481;
            case 1634027347:
              +[HSResponseDataParser _parseItemIDArrayWithBytes:length:](HSResponseDataParser, "_parseItemIDArrayWithBytes:length:", a2, a3);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              if (!a5)
                return;
              v9 = CFSTR("com.apple.itunes.genius-seed-track-id-listing");
              goto LABEL_481;
          }
        }
        goto LABEL_472;
      }
      if (a1 <= 1634026336)
      {
        if (a1 <= 1634026316)
        {
          if (a1 == 1633841260)
          {
            _NSNumberForNetworkUIntOfLength(a2, a3);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            if (!a5)
              return;
            v9 = CFSTR("daap.baseplaylist");
            goto LABEL_481;
          }
          if (a1 == 1634026308)
          {
            *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
            if (!a5)
              return;
            v9 = CFSTR("com.apple.itunes.flat-chapter-data");
            goto LABEL_481;
          }
          goto LABEL_472;
        }
        if (a1 == 1634026317)
        {
          _NSNumberForNetworkUIntOfLength(a2, a3);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          if (!a5)
            return;
          v9 = CFSTR("com.apple.itunes.cloud-match-type");
          goto LABEL_481;
        }
        if (a1 != 1634026324)
          goto LABEL_472;
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
        *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
        if (!a5)
          goto LABEL_486;
        v10 = CFSTR("com.apple.itunes.cloud-artwork-token");
      }
      else if (a1 <= 1634026354)
      {
        if (a1 == 1634026337)
        {
          v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
          *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
          if (a5)
          {
            v10 = CFSTR("com.apple.itunes.cloud-artwork-url");
            goto LABEL_485;
          }
          goto LABEL_486;
        }
        if (a1 != 1634026354)
          goto LABEL_472;
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
        *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
        if (!a5)
          goto LABEL_486;
        v10 = CFSTR("com.apple.itunes.copyright");
      }
      else
      {
        if (a1 == 1634026355)
        {
          _NSNumberForNetworkUIntOfLength(a2, a3);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          if (!a5)
            return;
          v9 = CFSTR("com.apple.itunes.cloud-connect-status");
          goto LABEL_481;
        }
        if (a1 != 1634026356)
        {
          if (a1 == 1634026571)
          {
            *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
            if (!a5)
              return;
            v9 = CFSTR("com.apple.itunes.drm-key-list-id");
            goto LABEL_481;
          }
          goto LABEL_472;
        }
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
        *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
        if (!a5)
          goto LABEL_486;
        v10 = CFSTR("com.apple.itunes.cloud-lyrics-token");
      }
    }
LABEL_485:
    *a5 = v10;
    goto LABEL_486;
  }
  if (a1 <= 1634956651)
  {
    if (a1 > 1634954338)
    {
      if (a1 <= 1634956128)
      {
        if (a1 <= 1634955371)
        {
          if (a1 != 1634954339)
          {
            if (a1 == 1634954355)
            {
              _NSNumberForNetworkUIntOfLength(a2, a3);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              if (!a5)
                return;
              v9 = CFSTR("daap.songlongsize");
              goto LABEL_481;
            }
            if (a1 == 1634955363)
            {
              _NSNumberForNetworkUIntOfLength(a2, a3);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              if (!a5)
                return;
              v9 = CFSTR("daap.songuserplaycount");
              goto LABEL_481;
            }
            goto LABEL_472;
          }
          v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
          *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
          if (!a5)
            goto LABEL_486;
          v10 = CFSTR("daap.songlongcontentdescription");
        }
        else
        {
          if (a1 > 1634955880)
          {
            if (a1 == 1634955881)
            {
              _NSNumberForNetworkUIntOfLength(a2, a3);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              if (!a5)
                return;
              v9 = CFSTR("daap.songartistid");
              goto LABEL_481;
            }
            if (a1 == 1634955894)
            {
              _NSNumberForNetworkUIntOfLength(a2, a3);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              if (!a5)
                return;
              v9 = CFSTR("daap.songrelativevolume");
              goto LABEL_481;
            }
            goto LABEL_472;
          }
          if (a1 == 1634955372)
          {
            _NSNumberForNetworkUIntOfLength(a2, a3);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            if (!a5)
              return;
            v9 = CFSTR("daap.songdateplayed");
            goto LABEL_481;
          }
          if (a1 != 1634955381)
            goto LABEL_472;
          v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
          *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
          if (!a5)
            goto LABEL_486;
          v10 = CFSTR("daap.songpodcasturl");
        }
        goto LABEL_485;
      }
      if (a1 > 1634956153)
      {
        if (a1 > 1634956396)
        {
          if (a1 == 1634956397)
          {
            _NSNumberForNetworkUIntOfLength(a2, a3);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            if (!a5)
              return;
            v9 = CFSTR("daap.songtime");
            goto LABEL_481;
          }
          if (a1 == 1634956398)
          {
            _NSNumberForNetworkUIntOfLength(a2, a3);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            if (!a5)
              return;
            v9 = CFSTR("daap.songtracknumber");
            goto LABEL_481;
          }
        }
        else
        {
          if (a1 == 1634956154)
          {
            _NSNumberForNetworkUIntOfLength(a2, a3);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            if (!a5)
              return;
            v9 = CFSTR("daap.songsize");
            goto LABEL_481;
          }
          if (a1 == 1634956387)
          {
            _NSNumberForNetworkUIntOfLength(a2, a3);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            if (!a5)
              return;
            v9 = CFSTR("daap.songtrackcount");
            goto LABEL_481;
          }
        }
        goto LABEL_472;
      }
      switch(a1)
      {
        case 1634956129:
          v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
          *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
          if (!a5)
            goto LABEL_486;
          v10 = CFSTR("daap.sortartist");
          goto LABEL_485;
        case 1634956131:
          v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
          *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
          if (!a5)
            goto LABEL_486;
          v10 = CFSTR("daap.sortcomposer");
          goto LABEL_485;
        case 1634956140:
          v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
          *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
          if (!a5)
            goto LABEL_486;
          v10 = CFSTR("daap.sortalbumartist");
          goto LABEL_485;
        case 1634956142:
          v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
          *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
          if (!a5)
            goto LABEL_486;
          v10 = CFSTR("daap.sortname");
          goto LABEL_485;
        case 1634956144:
          _NSNumberForNetworkUIntOfLength(a2, a3);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          if (!a5)
            return;
          v9 = CFSTR("daap.songstoptime");
          break;
        case 1634956146:
          _NSNumberForNetworkUIntOfLength(a2, a3);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          if (!a5)
            return;
          v9 = CFSTR("daap.songsamplerate");
          break;
        case 1634956147:
          v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
          *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
          if (!a5)
            goto LABEL_486;
          v10 = CFSTR("daap.sortseriesname");
          goto LABEL_485;
        case 1634956148:
          _NSNumberForNetworkUIntOfLength(a2, a3);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          if (!a5)
            return;
          v9 = CFSTR("daap.songstarttime");
          break;
        case 1634956149:
          v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
          *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
          if (!a5)
            goto LABEL_486;
          v10 = CFSTR("daap.sortalbum");
          goto LABEL_485;
        default:
          goto LABEL_472;
      }
      goto LABEL_481;
    }
    if (a1 <= 1634952547)
    {
      switch(a1)
      {
        case 1634952289:
          _NSNumberForNetworkUIntOfLength(a2, a3);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          if (!a5)
            return;
          v9 = CFSTR("daap.songdateadded");
          break;
        case 1634952290:
          _NSNumberForNetworkUIntOfLength(a2, a3);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          if (!a5)
            return;
          v9 = CFSTR("daap.songdisabled");
          break;
        case 1634952291:
          _NSNumberForNetworkUIntOfLength(a2, a3);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          if (!a5)
            return;
          v9 = CFSTR("daap.songdisccount");
          break;
        case 1634952299:
          _NSNumberForNetworkUIntOfLength(a2, a3);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          if (!a5)
            return;
          v9 = CFSTR("daap.songdatakind");
          break;
        case 1634952301:
          _NSNumberForNetworkUIntOfLength(a2, a3);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          if (!a5)
            return;
          v9 = CFSTR("daap.songdatemodified");
          break;
        case 1634952302:
          _NSNumberForNetworkUIntOfLength(a2, a3);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          if (!a5)
            return;
          v9 = CFSTR("daap.songdiscnumber");
          break;
        case 1634952304:
          _NSNumberForNetworkUIntOfLength(a2, a3);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          if (!a5)
            return;
          v9 = CFSTR("daap.songdatepurchased");
          break;
        case 1634952306:
          _NSNumberForNetworkUIntOfLength(a2, a3);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          if (!a5)
            return;
          v9 = CFSTR("daap.songdatereleased");
          break;
        case 1634952308:
          v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
          *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
          if (!a5)
            goto LABEL_486;
          v10 = CFSTR("daap.songdescription");
          goto LABEL_485;
        default:
          goto LABEL_472;
      }
      goto LABEL_481;
    }
    if (a1 > 1634953071)
    {
      if (a1 <= 1634954083)
      {
        if (a1 == 1634953072)
        {
          _NSNumberForNetworkUIntOfLength(a2, a3);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          if (!a5)
            return;
          v9 = CFSTR("daap.songgapless");
          goto LABEL_481;
        }
        if (a1 == 1634953328)
        {
          _NSNumberForNetworkUIntOfLength(a2, a3);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          if (!a5)
            return;
          v9 = CFSTR("daap.songhasbeenplayed");
          goto LABEL_481;
        }
        goto LABEL_472;
      }
      if (a1 == 1634954084)
      {
        _NSNumberForNetworkUIntOfLength(a2, a3);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        if (!a5)
          return;
        v9 = CFSTR("daap.songlastskipdate");
        goto LABEL_481;
      }
      if (a1 == 1634954096)
      {
        _NSNumberForNetworkUIntOfLength(a2, a3);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        if (!a5)
          return;
        v9 = CFSTR("daap.songuserskipcount");
        goto LABEL_481;
      }
      if (a1 != 1634954105)
        goto LABEL_472;
      v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
      *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
      if (!a5)
        goto LABEL_486;
      v10 = CFSTR("daap.songkeywords");
    }
    else if (a1 <= 1634952562)
    {
      if (a1 == 1634952548)
      {
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
        *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
        if (a5)
        {
          v10 = CFSTR("daap.songextradata");
          goto LABEL_485;
        }
        goto LABEL_486;
      }
      if (a1 != 1634952561)
        goto LABEL_472;
      v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
      *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
      if (!a5)
        goto LABEL_486;
      v10 = CFSTR("daap.songeqpreset");
    }
    else
    {
      switch(a1)
      {
        case 1634952563:
          _NSNumberForNetworkUIntOfLength(a2, a3);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          if (!a5)
            return;
          v9 = CFSTR("daap.songexcludefromshuffle");
          goto LABEL_481;
        case 1634952813:
          v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
          *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
          if (!a5)
            goto LABEL_486;
          v10 = CFSTR("daap.songformat");
          break;
        case 1634953070:
          v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
          *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
          if (!a5)
            goto LABEL_486;
          v10 = CFSTR("daap.songgenre");
          break;
        default:
          goto LABEL_472;
      }
    }
    goto LABEL_485;
  }
  if (a1 > 1835361394)
  {
    if (a1 > 1835626092)
    {
      if (a1 > 1936016200)
      {
        if (a1 <= 1936020040)
        {
          if (a1 == 1936016201)
          {
            _NSNumberForNetworkUIntOfLength(a2, a3);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            if (!a5)
              return;
            v9 = CFSTR("daap.composersyncid");
            goto LABEL_481;
          }
          if (a1 == 1936017225)
          {
            _NSNumberForNetworkUIntOfLength(a2, a3);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            if (!a5)
              return;
            v9 = CFSTR("daap.genresyncid");
            goto LABEL_481;
          }
        }
        else
        {
          switch(a1)
          {
            case 1936020041:
              _NSNumberForNetworkUIntOfLength(a2, a3);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              if (!a5)
                return;
              v9 = CFSTR("daap.artistsyncid");
              goto LABEL_481;
            case 1936020297:
              _NSNumberForNetworkUIntOfLength(a2, a3);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              if (!a5)
                return;
              v9 = CFSTR("daap.syncid");
              goto LABEL_481;
            case 1936020553:
              _NSNumberForNetworkUIntOfLength(a2, a3);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
              if (!a5)
                return;
              v9 = CFSTR("daap.albumartistsyncid");
              goto LABEL_481;
          }
        }
        goto LABEL_472;
      }
      if (a1 > 1836082545)
      {
        switch(a1)
        {
          case 1836082546:
            _NSNumberForNetworkUIntOfLength(a2, a3);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            if (!a5)
              return;
            v9 = CFSTR("dmap.persistentid");
            goto LABEL_481;
          case 1836282996:
            _NSNumberForNetworkUIntOfLength(a2, a3);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            if (!a5)
              return;
            v9 = CFSTR("dmap.status");
            goto LABEL_481;
          case 1936015689:
            _NSNumberForNetworkUIntOfLength(a2, a3);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            if (!a5)
              return;
            v9 = CFSTR("daap.albumsyncid");
            goto LABEL_481;
        }
        goto LABEL_472;
      }
      if (a1 != 1835626093)
      {
        if (a1 == 1836082031)
        {
          _NSNumberForNetworkUIntOfLength(a2, a3);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          if (!a5)
            return;
          v9 = CFSTR("dmap.parentcontainerid");
          goto LABEL_481;
        }
        goto LABEL_472;
      }
      v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
      *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
      if (a5)
      {
        v10 = CFSTR("dmap.itemname");
        goto LABEL_485;
      }
      goto LABEL_486;
    }
    if (a1 > 1835624552)
    {
      if (a1 <= 1835625315)
      {
        if (a1 == 1835624553)
        {
          _NSNumberForNetworkUIntOfLength(a2, a3);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          if (!a5)
            return;
          v9 = CFSTR("dmap.itemhidden");
          goto LABEL_481;
        }
        if (a1 == 1835624804)
        {
          _NSNumberForNetworkUIntOfLength(a2, a3);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          if (!a5)
            return;
          v9 = CFSTR("dmap.itemid");
          goto LABEL_481;
        }
      }
      else
      {
        switch(a1)
        {
          case 1835625316:
            _NSNumberForNetworkUIntOfLength(a2, a3);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            if (!a5)
              return;
            v9 = CFSTR("dmap.itemkind");
            goto LABEL_481;
          case 1835625572:
            _NSNumberForNetworkUIntOfLength(a2, a3);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            if (!a5)
              return;
            v9 = CFSTR("dmap.longitemid");
            goto LABEL_481;
          case 1835625827:
            _NSNumberForNetworkUIntOfLength(a2, a3);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            if (!a5)
              return;
            v9 = CFSTR("dmap.itemcount");
            goto LABEL_481;
        }
      }
      goto LABEL_472;
    }
    if (a1 <= 1835362671)
    {
      if (a1 == 1835361395)
        return;
      if (a1 == 1835362657)
      {
        _NSNumberForNetworkUIntOfLength(a2, a3);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        if (!a5)
          return;
        v9 = CFSTR("dmap.itemdateadded");
        goto LABEL_481;
      }
      goto LABEL_472;
    }
    if (a1 == 1835362672)
    {
      _NSNumberForNetworkUIntOfLength(a2, a3);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      if (!a5)
        return;
      v9 = CFSTR("dmap.itemdateplayed");
      goto LABEL_481;
    }
    if (a1 != 1835366516)
    {
      if (a1 == 1835623521)
      {
        +[HSResponseDataParser _parseItemIDArrayWithBytes:length:](HSResponseDataParser, "_parseItemIDArrayWithBytes:length:", a2, a3);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        if (!a5)
          return;
        v9 = CFSTR("dmap.itemidlisting");
        goto LABEL_481;
      }
      goto LABEL_472;
    }
    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
    *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
    if (!a5)
      goto LABEL_486;
    v10 = CFSTR("dmap.objectextradata");
    goto LABEL_485;
  }
  if (a1 > 1668117099)
  {
    if (a1 > 1835103851)
    {
      if (a1 <= 1835234408)
      {
        if (a1 == 1835103852)
        {
          _NSNumberForNetworkUIntOfLength(a2, a3);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          if (!a5)
            return;
          v9 = CFSTR("dmap.itemavailable");
          goto LABEL_481;
        }
        if (a1 == 1835234403)
        {
          _NSNumberForNetworkUIntOfLength(a2, a3);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          if (!a5)
            return;
          v9 = CFSTR("dmap.containercount");
          goto LABEL_481;
        }
      }
      else
      {
        switch(a1)
        {
          case 1835234409:
            _NSNumberForNetworkUIntOfLength(a2, a3);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            if (!a5)
              return;
            v9 = CFSTR("dmap.containeritemid");
            goto LABEL_481;
          case 1835295339:
            _NSNumberForNetworkUIntOfLength(a2, a3);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            if (!a5)
              return;
            v9 = CFSTR("dmap.databasekind");
            goto LABEL_481;
          case 1835295596:
            +[HSResponseDataParser _parseDictionaryCollectionWithBytes:length:](HSResponseDataParser, "_parseDictionaryCollectionWithBytes:length:", a2, a3);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            if (!a5)
              return;
            v9 = CFSTR("dmap.dictionary");
            goto LABEL_481;
        }
      }
    }
    else if (a1 <= 1668117346)
    {
      if (a1 == 1668117100)
      {
        _NSNumberForNetworkUIntOfLength(a2, a3);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        if (!a5)
          return;
        v9 = CFSTR("dmcp.supportsremotelibraryselection");
        goto LABEL_481;
      }
      if (a1 == 1668117346)
      {
        _NSNumberForNetworkUIntOfLength(a2, a3);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        if (!a5)
          return;
        v9 = CFSTR("dmcp.supportsbonjoursourcesupdates");
        goto LABEL_481;
      }
    }
    else
    {
      switch(a1)
      {
        case 1668117347:
          _NSNumberForNetworkUIntOfLength(a2, a3);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          if (!a5)
            return;
          v9 = CFSTR("dmcp.supportscontrolpromptrequests");
          goto LABEL_481;
        case 1668117360:
          _NSNumberForNetworkUIntOfLength(a2, a3);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          if (!a5)
            return;
          v9 = CFSTR("dmcp.supportsplaystatusupdates");
          goto LABEL_481;
        case 1668117366:
          _NSNumberForNetworkUIntOfLength(a2, a3);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          if (!a5)
            return;
          v9 = CFSTR("dmcp.supportsvolumecontrol");
          goto LABEL_481;
      }
    }
    goto LABEL_472;
  }
  if (a1 > 1667330932)
  {
    if (a1 <= 1667584855)
    {
      if (a1 == 1667330933)
      {
        _NSNumberForNetworkUIntOfLength(a2, a3);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        if (!a5)
          return;
        v9 = CFSTR("dacp.supports-setuserrating");
        goto LABEL_481;
      }
      if (a1 == 1667584839)
      {
        _NSNumberForNetworkUIntOfLength(a2, a3);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        if (!a5)
          return;
        v9 = CFSTR("com.apple.itunes.supports-genius-control");
        goto LABEL_481;
      }
    }
    else
    {
      switch(a1)
      {
        case 1667584856:
          _NSNumberForNetworkUIntOfLength(a2, a3);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          if (!a5)
            return;
          v9 = CFSTR("com.apple.itunes.supported-itunes-extensions");
          goto LABEL_481;
        case 1668114795:
          _NSNumberForNetworkUIntOfLength(a2, a3);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          if (!a5)
            return;
          v9 = CFSTR("dmcp.interfacekind");
          goto LABEL_481;
        case 1668116594:
          _NSNumberForNetworkUIntOfLength(a2, a3);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          if (!a5)
            return;
          v9 = CFSTR("dmcp.protocolversion");
          goto LABEL_481;
      }
    }
    goto LABEL_472;
  }
  if (a1 <= 1634957681)
  {
    if (a1 != 1634956652)
    {
      if (a1 == 1634956658)
      {
        _NSNumberForNetworkUIntOfLength(a2, a3);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        if (!a5)
          return;
        v9 = CFSTR("daap.songuserrating");
        goto LABEL_481;
      }
      goto LABEL_472;
    }
    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
    *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
    if (a5)
    {
      v10 = CFSTR("daap.songdataurl");
      goto LABEL_485;
    }
LABEL_486:

    return;
  }
  switch(a1)
  {
    case 1634957682:
      _NSNumberForNetworkUIntOfLength(a2, a3);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      if (!a5)
        return;
      v9 = CFSTR("daap.songyear");
      goto LABEL_481;
    case 1667330162:
      _NSNumberForNetworkUIntOfLength(a2, a3);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      if (!a5)
        return;
      v9 = CFSTR("dacp.protocolversion");
      goto LABEL_481;
    case 1667330931:
      _NSNumberForNetworkUIntOfLength(a2, a3);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      if (!a5)
        return;
      v9 = CFSTR("dacp.supports-speakerselection");
      goto LABEL_481;
  }
LABEL_472:
  _HSLogCategoryLibrary();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67110144;
    v14 = HIBYTE(a1);
    v15 = 1024;
    v16 = HIWORD(a1);
    v17 = 1024;
    v18 = a1 >> 8;
    v19 = 1024;
    v20 = a1;
    v21 = 1024;
    v22 = a3;
    _os_log_impl(&dword_20AA9E000, v11, OS_LOG_TYPE_DEBUG, "Unhandled code in item response: %c%c%c%c (%u bytes long)", buf, 0x20u);
  }

}

id _NSNumberForNetworkUIntOfLength(unsigned __int8 *a1, uint64_t a2)
{
  void *v3;

  v3 = 0;
  switch(a2)
  {
    case 1:
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedChar:", *a1);
      break;
    case 2:
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedShort:", bswap32(*(unsigned __int16 *)a1) >> 16);
      break;
    case 4:
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedLong:", bswap32(*(_DWORD *)a1));
      break;
    case 8:
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedLongLong:", (((unint64_t)*a1 << 56) | ((unint64_t)a1[1] << 48) | ((unint64_t)a1[2] << 40) | ((unint64_t)a1[3] << 32) | ((unint64_t)a1[4] << 24) | ((unint64_t)a1[5] << 16) | ((unint64_t)a1[6] << 8))+ a1[7]);
      break;
    default:
      return v3;
  }
  return v3;
}

id HSResponseDataParserValueGetStringValue(uint64_t a1)
{
  void *v1;

  if (*(_DWORD *)(a1 + 24) == 2)
    v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), 4, 0);
  else
    v1 = 0;
  return v1;
}

id HSResponseDataParserValueCopyValue(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;
  uint64_t v5;
  unsigned __int8 *v6;
  id v8;
  uint64_t v9;
  unsigned __int8 *v10;
  id v11;
  uint64_t v12;
  unsigned int *v13;
  id v14;
  unint64_t v15;
  unsigned __int8 *v16;
  unsigned int v17;
  unsigned int v18;

  v2 = *(_DWORD *)(a1 + 24);
  switch(v2)
  {
    case 1:
      v3 = 0;
      switch(*(_QWORD *)(a1 + 16))
      {
        case 1:
          v4 = objc_alloc(MEMORY[0x24BDD16E0]);
          v5 = 255;
          v6 = *(unsigned __int8 **)(a1 + 8);
          switch(*(_QWORD *)(a1 + 16))
          {
            case 1:
              goto LABEL_19;
            case 2:
              ++v6;
              goto LABEL_19;
            case 4:
              v6 += 3;
              goto LABEL_19;
            case 8:
              v6 += 7;
LABEL_19:
              v5 = *v6;
              break;
            default:
              break;
          }
          v3 = (void *)objc_msgSend(v4, "initWithUnsignedChar:", v5);
          break;
        case 2:
          v8 = objc_alloc(MEMORY[0x24BDD16E0]);
          v9 = 0xFFFFLL;
          v10 = *(unsigned __int8 **)(a1 + 8);
          switch(*(_QWORD *)(a1 + 16))
          {
            case 1:
              v9 = *v10;
              break;
            case 2:
              v17 = *(unsigned __int16 *)v10;
              goto LABEL_24;
            case 4:
              v17 = *((unsigned __int16 *)v10 + 1);
              goto LABEL_24;
            case 8:
              v17 = *((unsigned __int16 *)v10 + 3);
LABEL_24:
              v9 = bswap32(v17) >> 16;
              break;
            default:
              break;
          }
          v3 = (void *)objc_msgSend(v8, "initWithUnsignedShort:", v9);
          break;
        case 4:
          v11 = objc_alloc(MEMORY[0x24BDD16E0]);
          v12 = 0xFFFFFFFFLL;
          v13 = *(unsigned int **)(a1 + 8);
          switch(*(_QWORD *)(a1 + 16))
          {
            case 1:
              v12 = *(unsigned __int8 *)v13;
              break;
            case 2:
              v12 = __rev16(*(unsigned __int16 *)v13);
              break;
            case 4:
              v18 = *v13;
              goto LABEL_29;
            case 8:
              v18 = v13[1];
LABEL_29:
              v12 = bswap32(v18);
              break;
            default:
              break;
          }
          v3 = (void *)objc_msgSend(v11, "initWithUnsignedLong:", v12);
          break;
        case 8:
          v14 = objc_alloc(MEMORY[0x24BDD16E0]);
          v15 = -1;
          v16 = *(unsigned __int8 **)(a1 + 8);
          switch(*(_QWORD *)(a1 + 16))
          {
            case 1:
              v15 = *v16;
              break;
            case 2:
              v15 = __rev16(*(unsigned __int16 *)v16);
              break;
            case 4:
              v15 = bswap32(*(_DWORD *)v16);
              break;
            case 8:
              v15 = (((unint64_t)*v16 << 56) | ((unint64_t)v16[1] << 48) | ((unint64_t)v16[2] << 40) | ((unint64_t)v16[3] << 32) | ((unint64_t)v16[4] << 24) | ((unint64_t)v16[5] << 16) | ((unint64_t)v16[6] << 8))
                  + v16[7];
              break;
            default:
              break;
          }
          v3 = (void *)objc_msgSend(v14, "initWithUnsignedLongLong:", v15);
          break;
        default:
          return v3;
      }
      break;
    case 3:
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), 0);
      break;
    case 2:
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), 4, 0);
      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
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

void sub_20AAF0B2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__664(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__665(uint64_t a1)
{

}

id HSLibraryCacheDirectoryForIdentifier(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = (void *)MEMORY[0x24BDD17C8];
  MSVHomeSharingCacheDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v8[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathWithComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    v6 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("unable to create cache directory"));
    v6 = 0;
  }

  return v6;
}

id HSLibraryCacheDirectoryForApplication(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];

  v10[5] = *MEMORY[0x24BDAC8D0];
  v1 = (objc_class *)MEMORY[0x24BDC1540];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v2, 0, 0);

  if (v3)
  {
    objc_msgSend(v3, "dataContainerURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x24BDD17C8];
      v10[0] = v5;
      v10[1] = CFSTR("Library");
      v10[2] = CFSTR("Caches");
      v10[3] = CFSTR("com.apple.mobileipod");
      v10[4] = CFSTR("HomeSharingLibraries");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pathWithComponents:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id HSLibraryCacheAllKnownCacheDirectories()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  HSLibraryCacheDirectoryForApplication(CFSTR("com.apple.Music"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
    objc_msgSend(v0, "addObject:", v1);
  HSLibraryCacheDirectoryForApplication(CFSTR("com.apple.videos"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(v0, "addObject:", v2);
  MSVHomeSharingCacheDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v0, "addObject:", v3);

  return v0;
}

id HSCloudCacheRootDirectory()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "lastObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = (void *)MEMORY[0x24BDD17C8];
  v7[0] = v1;
  v7[1] = CFSTR("com.apple.itunescloudd");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathWithComponents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("unable to create cache directory"));
    v5 = 0;
  }

  return v5;
}

void sub_20AAF4B68(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  _Unwind_Resume(exception_object);
}

void sub_20AAF4DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_20AAF5134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t _WiFiCallBack(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "_wifiCallBack:", a2);
}

uint64_t _ServerJaliscoUpdateInProgressDidChangeNotification(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_serverJaliscoUpdateInProgressDidChange");
}

uint64_t _ServerSagaUpdateInProgressDidChangeNotification(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_serverSagaUpdateInProgressDidChange");
}

uint64_t HSCloudClientIsSagaEnabledInURLBag(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;
  uint64_t IsSagaEnabledInURLBag;

  v1 = (objc_class *)MEMORY[0x24BEC8A30];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "_initWithDictionary:", v2);

  IsSagaEnabledInURLBag = ICCloudClientIsSagaEnabledInURLBag();
  return IsSagaEnabledInURLBag;
}

uint64_t HSCloudClientGetSagaAccountID()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x24BE6B1D0], "autoupdatingSharedLibrary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "valueForDatabaseProperty:", CFSTR("MLCloudAccountID"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "longLongValue");

  return v2;
}

uint64_t HSCloudClientGetJaliscoAccountID()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x24BE6B1D0], "autoupdatingSharedLibrary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "valueForDatabaseProperty:", CFSTR("MLJaliscoAccountID"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "longLongValue");

  return v2;
}

uint64_t HSCloudClientGetSagaOnDiskDatabaseRevision()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x24BE6B1D0], "autoupdatingSharedLibrary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "valueForDatabaseProperty:", CFSTR("MLCloudDatabaseRevision"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "intValue");

  return v2;
}

uint64_t HSCloudClientGetJaliscoOnDiskDatabaseRevision()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x24BE6B1D0], "autoupdatingSharedLibrary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "valueForDatabaseProperty:", CFSTR("MLJaliscoDatabaseRevision"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "intValue");

  return v2;
}

uint64_t __Block_byref_object_copy__1639(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1640(uint64_t a1)
{

}

void sub_20AAFD270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20AAFD604(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 240), 8);
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1728(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1729(uint64_t a1)
{

}

void UpdateItems(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;

  v13 = a1;
  v14 = a2;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  +[HSItemsRequest requestWithDatabaseID:containerID:](HSItemsRequest, "requestWithDatabaseID:containerID:", objc_msgSend(v13, "databaseID"), objc_msgSend(v13, "basePlaylistContainerID"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("dmap.itemid"), CFSTR("daap.songdatemodified"), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "componentsJoinedByString:", CFSTR(","));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setValue:forArgument:", v22, CFSTR("meta"));

  objc_msgSend(v20, "setShouldParseResponse:", 0);
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "systemUptime");
  v25 = v24;

  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __UpdateItems_block_invoke;
  v33[3] = &unk_24C365210;
  v41 = v25;
  v34 = v14;
  v35 = v15;
  v36 = v13;
  v37 = v16;
  v38 = v17;
  v39 = v19;
  v40 = v18;
  v26 = v18;
  v27 = v19;
  v28 = v17;
  v29 = v13;
  v30 = v15;
  v31 = v14;
  v32 = v16;
  objc_msgSend(v29, "sendRequest:withResponseHandler:", v20, v33);

}

void BuildItems(void *a1, void *a2, const __CFArray *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD *v20;
  void *v21;
  unint64_t v22;
  NSObject *v24;
  BOOL v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  BOOL v36;
  _QWORD v37[4];
  id v38;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v41;
  char v42;
  uint64_t v43;
  CFRange v44;

  v43 = *MEMORY[0x24BDAC8D0];
  v11 = a1;
  v12 = a2;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  +[HSItemsRequest requestWithDatabaseID:containerID:](HSItemsRequest, "requestWithDatabaseID:containerID:", objc_msgSend(v11, "databaseID"), objc_msgSend(v11, "basePlaylistContainerID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("dmap.itemid"), CFSTR("dmap.longitemid"), CFSTR("dmap.itemname"), CFSTR("daap.songalbumartist"), CFSTR("daap.songalbum"), CFSTR("daap.songalbumid"), CFSTR("daap.songartist"), CFSTR("daap.songartistid"), CFSTR("daap.bookmarkable"), CFSTR("daap.songbookmark"), CFSTR("daap.songcomment"), CFSTR("daap.songcompilation"), CFSTR("daap.songcomposer"), CFSTR("daap.songcontentdescription"), CFSTR("daap.songcontentrating"), CFSTR("daap.songdatemodified"), CFSTR("daap.songdisccount"),
    CFSTR("daap.songdiscnumber"),
    CFSTR("daap.songformat"),
    CFSTR("daap.songgenre"),
    CFSTR("daap.songhasbeenplayed"),
    CFSTR("daap.songuserplaycount"),
    CFSTR("daap.songlongcontentdescription"),
    CFSTR("daap.songlongsize"),
    CFSTR("daap.songpodcasturl"),
    CFSTR("daap.sortalbumartist"),
    CFSTR("daap.sortalbum"),
    CFSTR("daap.sortartist"),
    CFSTR("daap.sortcomposer"),
    CFSTR("daap.sortname"),
    CFSTR("daap.sortseriesname"),
    CFSTR("daap.songtime"),
    CFSTR("daap.songtrackcount"),
    CFSTR("daap.songtracknumber"),
    CFSTR("daap.songyear"),
    CFSTR("com.apple.itunes.drm-key1-id"),
    CFSTR("com.apple.itunes.drm-user-id"),
    CFSTR("com.apple.itunes.episode-sort"),
    CFSTR("com.apple.itunes.episode-num-str"),
    CFSTR("com.apple.itunes.content-rating"),
    CFSTR("com.apple.itunes.flat-chapter-data"),
    CFSTR("com.apple.itunes.is-hd-video"),
    CFSTR("com.apple.itunes.itms-artistid"),
    CFSTR("com.apple.itunes.itms-composerid"),
    CFSTR("com.apple.itunes.itms-genreid"),
    CFSTR("com.apple.itunes.itms-playlistid"),
    CFSTR("com.apple.itunes.itms-songid"),
    CFSTR("com.apple.itunes.itms-storefrontid"),
    CFSTR("com.apple.itunes.extended-media-kind"),
    CFSTR("com.apple.itunes.rental-duration"),
    CFSTR("com.apple.itunes.rental-pb-duration"),
    CFSTR("com.apple.itunes.rental-pb-start"),
    CFSTR("com.apple.itunes.rental-start"),
    CFSTR("com.apple.itunes.season-num"),
    CFSTR("com.apple.itunes.series-name"),
    CFSTR("com.apple.itunes.collection-description"),
    CFSTR("com.apple.itunes.drm-downloader-user-id"),
    CFSTR("com.apple.itunes.drm-family-id"),
    CFSTR("daap.songwork"),
    CFSTR("daap.songmovementname"),
    CFSTR("daap.songmovementcount"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 && CFArrayGetCount(a3))
  {
    v18 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    objc_msgSend(v18, "appendString:", CFSTR("("));
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v41 = 0x2020000000;
    v42 = 0;
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __BuildItems_block_invoke;
    v37[3] = &unk_24C365238;
    p_buf = &buf;
    v19 = v18;
    v38 = v19;
    v20 = v37;
    v44.length = CFArrayGetCount(a3);
    v44.location = 0;
    CFArrayApplyFunction(a3, v44, (CFArrayApplierFunction)CFArrayBlockApplier, v20);

    objc_msgSend(v19, "appendString:", CFSTR(")"));
    objc_msgSend(v16, "setValue:forArgument:", v19, CFSTR("query"));

    _Block_object_dispose(&buf, 8);
  }
  objc_msgSend(v17, "componentsJoinedByString:", CFSTR(","));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setValue:forArgument:", v21, CFSTR("meta"));

  objc_msgSend(v16, "setShouldParseResponse:", 0);
  v22 = -[__CFArray count](a3, "count");
  if (v22 > 0x64 && a3 != 0)
  {
    v24 = os_log_create("com.apple.amp.HomeSharing", "Library");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v22;
      _os_log_impl(&dword_20AA9E000, v24, OS_LOG_TYPE_DEFAULT, "Partial fetch too large (%lu items), doing full fetch", (uint8_t *)&buf, 0xCu);
    }

    BuildItems(v11, v12, 0, v13, v14, v15);
  }
  else
  {
    v25 = a3 != 0;
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "systemUptime");
    v28 = v27;

    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __BuildItems_block_invoke_204;
    v29[3] = &unk_24C3652D8;
    v35 = v28;
    v36 = v25;
    v30 = v11;
    v31 = v12;
    v32 = v13;
    v33 = v14;
    v34 = v15;
    objc_msgSend(v30, "sendRequest:withResponseHandler:", v16, v29);

  }
}

void sub_20AAFE8BC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void CFArrayBlockApplier(uint64_t a1, uint64_t a2)
{
  void (**v3)(id, _QWORD);

  v3 = (void (**)(id, _QWORD))MEMORY[0x20BD2BA98](a2);
  v3[2](v3, a1);

}

void sub_20AAFF1D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

id WriteDAAPDataToTemporaryFile(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v1 = a1;
  NSTemporaryDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("daapdata.XXXXXX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  MSVCreateTemporaryFileHandle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  objc_msgSend(v4, "writeData:", v1);

  objc_msgSend(v4, "closeFile");
  return v5;
}

void BuildContainers(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  +[HSContainersRequest requestWithDatabaseID:](HSContainersRequest, "requestWithDatabaseID:", objc_msgSend(v7, "databaseID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("dmap.itemid"), CFSTR("dmap.itemname"), CFSTR("com.apple.itunes.special-playlist"), CFSTR("dmap.parentcontainerid"), CFSTR("dmap.haschildcontainers"), CFSTR("com.apple.itunes.smart-playlist"), CFSTR("com.apple.itunes.saved-genius"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsJoinedByString:", CFSTR(","));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forArgument:", v13, CFSTR("meta"));

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "systemUptime");
  v16 = v15;

  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __BuildContainers_block_invoke;
  v21[3] = &unk_24C365148;
  v26 = v16;
  v22 = v8;
  v23 = v7;
  v24 = v9;
  v25 = v10;
  v17 = v10;
  v18 = v7;
  v19 = v8;
  v20 = v9;
  objc_msgSend(v18, "sendRequest:withResponseHandler:", v11, v21);

}

void sub_20AAFFC5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20AB00A38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  uint64_t v37;

  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 184), 8);
  _Block_object_dispose((const void *)(v37 - 152), 8);
  _Unwind_Resume(a1);
}

id HSGetCloudDAAPClientPrefix()
{
  if (HSGetCloudDAAPClientPrefix_onceToken != -1)
    dispatch_once(&HSGetCloudDAAPClientPrefix_onceToken, &__block_literal_global_1923);
  return (id)HSGetCloudDAAPClientPrefix_cloudDAAPClientPrefix;
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC300](data, *(_QWORD *)&len, md);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
  MEMORY[0x24BDBB7D8](theArray, range.location, range.length, applier, context);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
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

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC300]();
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

uint64_t ICCloudClientIsSagaEnabledInURLBag()
{
  return MEMORY[0x24BEC84E8]();
}

uint64_t ICEnvironmentNetworkTypeIsCellular()
{
  return MEMORY[0x24BEC8558]();
}

uint64_t ICFairPlayGetHardwareInfoFromDeviceUDID()
{
  return MEMORY[0x24BEC8588]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t ML3DatabaseImportDataForDAAPFilePaths()
{
  return MEMORY[0x24BE6B0F0]();
}

uint64_t MSVCreateTemporaryFileHandle()
{
  return MEMORY[0x24BE65AD0]();
}

uint64_t MSVDeviceIsAppleTV()
{
  return MEMORY[0x24BE65AD8]();
}

uint64_t MSVGetMaximumScreenSize()
{
  return MEMORY[0x24BE65B58]();
}

uint64_t MSVHomeSharingCacheDirectory()
{
  return MEMORY[0x24BE65B88]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return (SCPreferencesRef)MEMORY[0x24BDF5868](allocator, name, prefsID);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x24BDF5880](prefs, key);
}

Boolean SCPreferencesScheduleWithRunLoop(SCPreferencesRef prefs, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x24BDF5898](prefs, runLoop, runLoopMode);
}

Boolean SCPreferencesSetCallback(SCPreferencesRef prefs, SCPreferencesCallBack callout, SCPreferencesContext *context)
{
  return MEMORY[0x24BDF58A0](prefs, callout, context);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
  MEMORY[0x24BDF58C8](prefs);
}

Boolean SCPreferencesUnscheduleFromRunLoop(SCPreferencesRef prefs, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x24BDF58D8](prefs, runLoop, runLoopMode);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A70](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A78](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x24BDE8A80](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x24BDE8A88](query, attributesToUpdate);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CTServerConnectionCopyCellularUsagePolicy()
{
  return MEMORY[0x24BDC2828]();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return MEMORY[0x24BDC2888]();
}

uint64_t _CTServerConnectionRegisterForNotification()
{
  return MEMORY[0x24BDC2928]();
}

uint64_t _CTServerConnectionUnregisterForNotification()
{
  return MEMORY[0x24BDC2990]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
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

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x24BDAE6E8]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x24BDAEB80](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x24BDAEB90](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
  MEMORY[0x24BDAEEE0](*(_QWORD *)&reply_port);
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x24BDAEEF8]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
  MEMORY[0x24BDAEF08](*(_QWORD *)&reply_port);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x24BDAF198](*(_QWORD *)&token, state64);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
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

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x24BDB0418](msg);
}

