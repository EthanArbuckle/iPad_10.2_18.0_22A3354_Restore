@implementation SecVerifySignatureAndMac

__n128 __SecVerifySignatureAndMac_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v3;
  __int128 v4;
  __n128 result;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  char v11;
  _QWORD v12[5];
  _OWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = *(_OWORD *)(a1 + 48);
  v7 = *(_OWORD *)(a1 + 32);
  v6[2] = __SecVerifySignatureAndMac_block_invoke_2;
  v6[3] = &unk_1E1FD8C58;
  v11 = *(_BYTE *)(a1 + 64);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 0x40000000;
  v8 = a2;
  v9 = a3;
  v10 = v3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 0x40000000;
  v12[2] = __PerformWithBufferAndClear_block_invoke;
  v12[3] = &unk_1E1FDC2B8;
  v12[4] = v6;
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v13[0] = v4;
  v13[1] = v4;
  __PerformWithBufferAndClear_block_invoke((uint64_t)v12, 0x20uLL, v13);
  return result;
}

void __SecVerifySignatureAndMac_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD v4[4];
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  char v11;
  _QWORD v12[5];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4[2] = __SecVerifySignatureAndMac_block_invoke_3;
  v4[3] = &unk_1E1FD8C30;
  v11 = *(_BYTE *)(a1 + 80);
  v3 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = v3;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 0x40000000;
  v8 = a2;
  v9 = a3;
  v5 = *(_OWORD *)(a1 + 32);
  v10 = *(_OWORD *)(a1 + 64);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 0x40000000;
  v12[2] = __PerformWithBufferAndClear_block_invoke;
  v12[3] = &unk_1E1FDC2B8;
  v12[4] = v4;
  v13[0] = 0xAAAAAAAAAAAAAAAALL;
  v13[1] = 0xAAAAAAAAAAAAAAAALL;
  __PerformWithBufferAndClear_block_invoke((uint64_t)v12, 0x10uLL, v13);
}

void __SecVerifySignatureAndMac_block_invoke_3(uint64_t a1, unint64_t a2, void *a3)
{
  __int128 v6;
  UInt8 v7;
  UInt8 v8;
  int v9;
  void *v10;
  __int128 v11;
  size_t v12;
  size_t v13;
  unsigned int **v14;
  uint64_t *v15;
  unsigned int *v16;
  uint64_t v17;
  int v18;
  unsigned int v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[11];
  unsigned int v26;
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
  __int128 v37;
  __int128 v38;
  __int128 __src;
  __int128 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v37 = v6;
  v38 = v6;
  v35 = v6;
  v36 = v6;
  v33 = v6;
  v34 = v6;
  v31 = v6;
  v32 = v6;
  v29 = v6;
  v30 = v6;
  v27 = v6;
  v28 = v6;
  ccn_zero();
  *(_QWORD *)&__src = 192;
  ccec_compute_key();
  if (*(_BYTE *)(a1 + 96))
    v7 = 4;
  else
    v7 = 2;
  HashMPIWithPrefix(v7, 24, (uint64_t)&v27, *(unsigned __int8 **)(a1 + 56));
  if (*(_BYTE *)(a1 + 96))
    v8 = 5;
  else
    v8 = 3;
  HashMPIWithPrefix(v8, 24, (uint64_t)&v27, *(unsigned __int8 **)(a1 + 72));
  v9 = *(unsigned __int8 *)(a1 + 96);
  if (*(_BYTE *)(a1 + 96))
    v10 = a3;
  else
    v10 = 0;
  *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __src = v11;
  v40 = v11;
  HashMPIWithPrefix(1u, 24, (uint64_t)&v27, (unsigned __int8 *)&__src);
  if (!v9 && a3)
  {
    if (a2 >= 0x10)
      v12 = 16;
    else
      v12 = a2;
    memcpy(a3, &__src, v12);
  }
  if (v10)
  {
    if (a2 >= 0x10)
      v13 = 16;
    else
      v13 = a2;
    memcpy(v10, &__src, v13);
  }
  v14 = *(unsigned int ***)(a1 + 80);
  v15 = *(uint64_t **)(a1 + 88);
  v16 = *v14;
  if (v15 && (v17 = *v15 - 4, (unint64_t)*v15 >= 4))
  {
    v18 = 0;
    v19 = bswap32(*v16);
    *v14 = v16 + 1;
    *v15 = v17;
  }
  else
  {
    v19 = 0;
    v18 = -50;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v18;
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (!*(_DWORD *)(v20 + 24))
  {
    if (v19 > 4 && **(_QWORD **)(a1 + 88) >= (unint64_t)v19)
    {
      *(_QWORD *)&v21 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
      __src = v21;
      v40 = v21;
      ccsha256_di();
      cchmac();
      if (**(_QWORD **)(a1 + 88) >= (unint64_t)(v19 + 20) && !cc_cmp_safe())
      {
        v25[2] = __SecVerifySignatureAndMac_block_invoke_4;
        v25[3] = &unk_1E1FD8C08;
        v22 = *(_QWORD *)(a1 + 48);
        v24 = *(_QWORD *)(a1 + 32);
        v23 = *(_QWORD *)(a1 + 40);
        v25[6] = *(_QWORD *)(a1 + 56);
        v25[7] = v23;
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 0x40000000;
        v25[8] = a2;
        v25[9] = a3;
        v26 = v19;
        v25[10] = *(_QWORD *)(a1 + 80);
        v25[4] = v24;
        v25[5] = v22;
        *(_QWORD *)&v27 = MEMORY[0x1E0C809B0];
        *((_QWORD *)&v27 + 1) = 0x40000000;
        *(_QWORD *)&v28 = __PerformWithBufferAndClear_block_invoke;
        *((_QWORD *)&v28 + 1) = &unk_1E1FDC2B8;
        *(_QWORD *)&v29 = v25;
        PerformWithBuffer(v19, (uint64_t)&v27);
        return;
      }
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    }
    *(_DWORD *)(v20 + 24) = -26275;
  }
}

void __SecVerifySignatureAndMac_block_invoke_4(uint64_t a1, uint64_t a2, const UInt8 *a3)
{
  uint64_t v5;
  size_t v6;
  uint64_t v7;
  unint64_t v8;
  const __CFAllocator *v9;
  __CFData *Mutable;
  unint64_t v11;
  int v12;
  const UInt8 *v13;
  unsigned int v14;
  uint64_t v15;
  int v16;
  unsigned int v17;
  unsigned int v18;
  CFIndex v19;
  __int128 v20;
  uint64_t v21;
  CFDataRef v22;
  const __CFData *v23;
  char v24;
  __CFString *v25;
  CFIndex Length;
  const UInt8 *BytePtr;
  CFIndex v28;
  CFIndex v29;
  unsigned int v30;
  unsigned int *v31;
  unint64_t v32;
  uint64_t v33;
  int v34;
  unsigned int v35;
  uint64_t v36;
  int v37;
  unsigned int v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  CFIndex v42;
  int v43;
  int v44;
  const UInt8 *v45;
  UInt8 *v46;
  CFIndex v47;
  uint64_t v48;
  void (*v49)(uint64_t, uint64_t);
  void *v50;
  const __CFData *v51;
  const UInt8 *v52;
  _OWORD v53[2];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  ccsha256_di();
  ccsha256_di();
  v5 = ccsha256_di();
  MEMORY[0x1E0C80A78](v5);
  if (v8 >= 8)
    memset((char *)&v47 - v7, 170, v6);
  ccsha256_di();
  cchmac_init();
  v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  AppendECPublicKeyAsDATA(Mutable);
  SecFDHKAppendPublicSerialization(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 80), Mutable);
  ccsha256_di();
  CFDataGetLength(Mutable);
  CFDataGetBytePtr(Mutable);
  cchmac_update();
  if (Mutable)
    CFRelease(Mutable);
  AES_CTR_Transform(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), (uint64_t)&kIVZero, *(unsigned int *)(a1 + 88), **(_QWORD **)(a1 + 80), (uint64_t)a3);
  v11 = *(unsigned int *)(a1 + 88);
  if (v11 < 2)
  {
    v12 = -50;
    v14 = 43690;
    v13 = a3;
  }
  else
  {
    v12 = 0;
    v13 = a3 + 2;
    v14 = __rev16(*(unsigned __int16 *)a3);
    v11 -= 2;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v12;
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_DWORD *)(v15 + 24))
    return;
  if (v14 != 61440)
  {
    v44 = -4;
LABEL_49:
    *(_DWORD *)(v15 + 24) = v44;
    return;
  }
  if (v11 < 4)
  {
    v16 = -50;
    v18 = -1431655766;
  }
  else
  {
    v16 = 0;
    v17 = *(_DWORD *)v13;
    v13 += 4;
    v18 = bswap32(v17);
    v11 -= 4;
  }
  *(_DWORD *)(v15 + 24) = v16;
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_DWORD *)(v15 + 24))
    return;
  if (v11 < v18)
  {
    v44 = -26275;
    goto LABEL_49;
  }
  v19 = v18;
  ccsha256_di();
  cchmac_update();
  *(_QWORD *)&v20 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v53[0] = v20;
  v53[1] = v20;
  ccsha256_di();
  cchmac_final();
  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 32);
  v22 = CFDataCreateWithBytesNoCopy(v9, v13, v19, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  v23 = CFDataCreateMutable(v9, 0);
  SecOTRPIAppendSerialization(v21, v23, 0);
  if (v22 && v23)
  {
    if (CFEqual(v22, v23))
    {
      v24 = 1;
LABEL_25:
      CFRelease(v22);
      goto LABEL_26;
    }
    v47 = MEMORY[0x1E0C809B0];
    v48 = 0x40000000;
    v49 = __SecOTRPIEqualToBytes_block_invoke;
    v50 = &__block_descriptor_tmp_6_10025;
    v51 = v23;
    goto LABEL_21;
  }
  if (v22 != v23)
  {
    v47 = MEMORY[0x1E0C809B0];
    v48 = 0x40000000;
    v49 = __SecOTRPIEqualToBytes_block_invoke;
    v50 = &__block_descriptor_tmp_6_10025;
    v51 = v23;
    if (!v22)
    {
      v25 = CFSTR("(null)");
      goto LABEL_24;
    }
LABEL_21:
    Length = CFDataGetLength(v22);
    v25 = CFStringCreateMutable(v9, 2 * Length);
    BytePtr = CFDataGetBytePtr(v22);
    v28 = CFDataGetLength(v22);
    if (v28 >= 1)
    {
      v29 = v28;
      do
      {
        v30 = *BytePtr++;
        CFStringAppendFormat(v25, 0, CFSTR("%02X"), v30);
        --v29;
      }
      while (v29);
    }
LABEL_24:
    __SecOTRPIEqualToBytes_block_invoke((uint64_t)&v47, (uint64_t)v25);
    CFRelease(v25);
    v24 = 0;
    if (!v22)
      goto LABEL_26;
    goto LABEL_25;
  }
  v24 = 1;
  if (v22)
    goto LABEL_25;
LABEL_26:
  if (v23)
    CFRelease(v23);
  if ((v24 & 1) == 0)
  {
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v44 = -25293;
    goto LABEL_49;
  }
  v31 = (unsigned int *)&v13[v19];
  v32 = v11 - v19;
  v33 = *(_QWORD *)(a1 + 56);
  if (v11 - v19 < 4)
  {
    v34 = -50;
  }
  else
  {
    v34 = 0;
    v35 = *v31++;
    *(_DWORD *)(v33 + 96) = bswap32(v35);
    v32 = v11 - v19 - 4;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v34;
  v36 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (!*(_DWORD *)(v36 + 24))
  {
    if (v32 < 4)
    {
      v37 = -50;
      v39 = 2863311530;
    }
    else
    {
      v37 = 0;
      v38 = *v31++;
      v39 = bswap32(v38);
      v32 -= 4;
    }
    *(_DWORD *)(v36 + 24) = v37;
    v40 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (!*(_DWORD *)(v40 + 24))
    {
      if (v32 < v39)
      {
        *(_DWORD *)(v40 + 24) = -26275;
        return;
      }
      v41 = *(_QWORD *)(v33 + 32);
      if (v39)
      {
        v42 = *(unsigned __int8 *)v31;
        if (v39 - 1 == v42)
        {
          v31 = (unsigned int *)((char *)v31 + 1);
          if (!SecKeyDigestAndVerify(*(_QWORD *)(v41 + 16), (const SecAsn1Oid *)kOTRSignatureAlgIDPtr, (const UInt8 *)v53, 32, (const UInt8 *)v31, v42))goto LABEL_39;
        }
        else
        {
          v42 = v39;
        }
      }
      else
      {
        v42 = 0;
      }
      v45 = (const UInt8 *)malloc_type_malloc(v42 + 3, 0x74E7695uLL);
      v46 = (UInt8 *)v45;
      if (!v45
        || (v47 = 8, v52 = v45, SecOTRPIRecreateSignature((uint64_t)v31, v42, (uint64_t *)&v52, &v47), !v52)
        || SecKeyDigestAndVerify(*(_QWORD *)(v41 + 16), (const SecAsn1Oid *)kOTRSignatureAlgIDPtr, (const UInt8 *)v53, 32, v52, v47))
      {
        free(v46);
        v43 = -26275;
        goto LABEL_40;
      }
      free(v46);
LABEL_39:
      v43 = 0;
LABEL_40:
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v43;
    }
  }
}

@end
