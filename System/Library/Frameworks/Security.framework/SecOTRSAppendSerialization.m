@implementation SecOTRSAppendSerialization

void __SecOTRSAppendSerialization_block_invoke(uint64_t a1)
{
  __CFData *v2;
  int v3;
  int v4;
  __CFData *v5;
  __CFData *v6;
  const __CFData *v7;
  CFIndex Length;
  const UInt8 *BytePtr;
  UInt8 *v10;
  CFIndex v11;
  __CFData *v12;
  __CFData *v13;
  const __CFData *v14;
  CFIndex v15;
  const UInt8 *v16;
  UInt8 *v17;
  CFIndex v18;
  __CFData *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  BOOL v24;
  char v25;
  UInt8 v26;
  __CFData *v27;
  __CFData *v28;
  uint64_t *v29;
  uint64_t v30;
  __CFData *v31;
  __CFData *v32;
  __CFData *v33;
  __CFData *v34;
  __CFData *v35;
  __CFData *v36;
  __CFData *v37;
  __CFData *v38;
  __CFData *v39;
  const __CFData *v40;
  CFIndex v41;
  const UInt8 *v42;
  __CFData *v43;
  __CFData *v44;
  __CFData *v45;
  __CFData *v46;
  unint64_t v47;
  __CFData *v48;
  __CFData *v49;
  __CFData *v50;
  __CFData *v51;
  unint64_t *v52;
  UInt8 bytes;
  UInt8 v54[8];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  bytes = 6;
  CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 40), &bytes, 1);
  v2 = *(__CFData **)(a1 + 40);
  *(_DWORD *)v54 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 48) + 16));
  CFDataAppendBytes(v2, v54, 4);
  if (SecOTRFIAppendSerialization(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 24), *(CFDataRef *)(a1 + 40), 0))
    v3 = 0;
  else
    v3 = -50;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v4 = SecOTRPIAppendSerialization(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 32), *(CFDataRef *)(a1 + 40), 0)? 0: -50;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
    if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 40), (const UInt8 *)(*(_QWORD *)(a1 + 48) + 40), 16);
      v5 = *(__CFData **)(a1 + 40);
      if (*(_QWORD *)(*(_QWORD *)(a1 + 48) + 56))
      {
        v54[0] = 1;
        CFDataAppendBytes(v5, v54, 1);
        v6 = *(__CFData **)(a1 + 40);
        v7 = *(const __CFData **)(*(_QWORD *)(a1 + 48) + 56);
        Length = CFDataGetLength(v7);
        BytePtr = CFDataGetBytePtr(v7);
        *(_DWORD *)v54 = bswap32(Length);
        CFDataAppendBytes(v6, v54, 4);
        v5 = v6;
        v10 = (UInt8 *)BytePtr;
        v11 = Length;
      }
      else
      {
        v54[0] = 0;
        v10 = v54;
        v11 = 1;
      }
      CFDataAppendBytes(v5, v10, v11);
      v12 = *(__CFData **)(a1 + 40);
      if (*(_QWORD *)(*(_QWORD *)(a1 + 48) + 64))
      {
        v54[0] = 1;
        CFDataAppendBytes(v12, v54, 1);
        v13 = *(__CFData **)(a1 + 40);
        v14 = *(const __CFData **)(*(_QWORD *)(a1 + 48) + 64);
        v15 = CFDataGetLength(v14);
        v16 = CFDataGetBytePtr(v14);
        *(_DWORD *)v54 = bswap32(v15);
        CFDataAppendBytes(v13, v54, 4);
        v12 = v13;
        v17 = (UInt8 *)v16;
        v18 = v15;
      }
      else
      {
        v54[0] = 0;
        v17 = v54;
        v18 = 1;
      }
      CFDataAppendBytes(v12, v17, v18);
      v19 = *(__CFData **)(a1 + 40);
      *(_DWORD *)v54 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 48) + 72));
      CFDataAppendBytes(v19, v54, 4);
      v20 = *(_QWORD *)(a1 + 48);
      if (*(_DWORD *)(v20 + 72))
      {
        SecFDHKAppendSerialization(*(_QWORD *)(v20 + 80), *(__CFData **)(a1 + 40));
        SecFDHKAppendSerialization(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 88), *(__CFData **)(a1 + 40));
        v20 = *(_QWORD *)(a1 + 48);
      }
      v22 = *(_QWORD *)(v20 + 104);
      v21 = *(_QWORD *)(v20 + 112);
      v23 = v22 == 0;
      v24 = v22 != 0;
      if (v23)
        v25 = 1;
      else
        v25 = 2;
      if (v21)
        v26 = v25;
      else
        v26 = v24;
      v27 = *(__CFData **)(a1 + 40);
      v54[0] = v26;
      CFDataAppendBytes(v27, v54, 1);
      v28 = *(__CFData **)(a1 + 40);
      *(_DWORD *)v54 = bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 48) + 96));
      CFDataAppendBytes(v28, v54, 4);
      v29 = *(uint64_t **)(a1 + 48);
      if (v29[13])
      {
        AppendECPublicKeyAsDATA(*(__CFData **)(a1 + 40));
        v29 = *(uint64_t **)(a1 + 48);
      }
      if (v29[14])
      {
        AppendECPublicKeyAsDATA(*(__CFData **)(a1 + 40));
        v29 = *(uint64_t **)(a1 + 48);
        v30 = v29[14];
      }
      else
      {
        v30 = 0;
      }
      v52 = (unint64_t *)0xAAAAAAAAAAAAAAAALL;
      SecOTRSFindKeysForMessage((uint64_t)v29, v29[10], v30, 0, 0, 0, (uint64_t **)&v52);
      v31 = *(__CFData **)(a1 + 40);
      *(_QWORD *)v54 = bswap64(*v52);
      CFDataAppendBytes(v31, v54, 8);
      SecOTRSFindKeysForMessage(*(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 80), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 112), 1, 0, 0, (uint64_t **)&v52);
      v32 = *(__CFData **)(a1 + 40);
      *(_QWORD *)v54 = bswap64(*v52);
      CFDataAppendBytes(v32, v54, 8);
      SecOTRSFindKeysForMessage(*(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 80), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 104), 0, 0, 0, (uint64_t **)&v52);
      v33 = *(__CFData **)(a1 + 40);
      *(_QWORD *)v54 = bswap64(*v52);
      CFDataAppendBytes(v33, v54, 8);
      SecOTRSFindKeysForMessage(*(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 80), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 104), 1, 0, 0, (uint64_t **)&v52);
      v34 = *(__CFData **)(a1 + 40);
      *(_QWORD *)v54 = bswap64(*v52);
      CFDataAppendBytes(v34, v54, 8);
      SecOTRSFindKeysForMessage(*(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 88), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 112), 0, 0, 0, (uint64_t **)&v52);
      v35 = *(__CFData **)(a1 + 40);
      *(_QWORD *)v54 = bswap64(*v52);
      CFDataAppendBytes(v35, v54, 8);
      SecOTRSFindKeysForMessage(*(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 88), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 112), 1, 0, 0, (uint64_t **)&v52);
      v36 = *(__CFData **)(a1 + 40);
      *(_QWORD *)v54 = bswap64(*v52);
      CFDataAppendBytes(v36, v54, 8);
      SecOTRSFindKeysForMessage(*(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 88), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 104), 0, 0, 0, (uint64_t **)&v52);
      v37 = *(__CFData **)(a1 + 40);
      *(_QWORD *)v54 = bswap64(*v52);
      CFDataAppendBytes(v37, v54, 8);
      SecOTRSFindKeysForMessage(*(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 88), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 104), 1, 0, 0, (uint64_t **)&v52);
      v38 = *(__CFData **)(a1 + 40);
      *(_QWORD *)v54 = bswap64(*v52);
      CFDataAppendBytes(v38, v54, 8);
      v39 = *(__CFData **)(a1 + 40);
      v40 = *(const __CFData **)(*(_QWORD *)(a1 + 48) + 120);
      v41 = CFDataGetLength(v40);
      v42 = CFDataGetBytePtr(v40);
      *(_DWORD *)v54 = bswap32(v41);
      CFDataAppendBytes(v39, v54, 4);
      CFDataAppendBytes(v39, v42, v41);
      v43 = *(__CFData **)(a1 + 40);
      v54[0] = *(_BYTE *)(*(_QWORD *)(a1 + 48) + 648);
      CFDataAppendBytes(v43, v54, 1);
      v44 = *(__CFData **)(a1 + 40);
      v54[0] = *(_BYTE *)(*(_QWORD *)(a1 + 48) + 649);
      CFDataAppendBytes(v44, v54, 1);
      v45 = *(__CFData **)(a1 + 40);
      v54[0] = *(_BYTE *)(*(_QWORD *)(a1 + 48) + 650);
      CFDataAppendBytes(v45, v54, 1);
      v46 = *(__CFData **)(a1 + 40);
      v47 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 656);
      if (!v47)
        v47 = constant_zero;
      *(_QWORD *)v54 = bswap64(v47);
      CFDataAppendBytes(v46, v54, 8);
      v48 = *(__CFData **)(a1 + 40);
      v54[0] = *(_BYTE *)(*(_QWORD *)(a1 + 48) + 664);
      CFDataAppendBytes(v48, v54, 1);
      v49 = *(__CFData **)(a1 + 40);
      *(_QWORD *)v54 = bswap64((unint64_t)*(double *)(*(_QWORD *)(a1 + 48) + 672));
      CFDataAppendBytes(v49, v54, 8);
      v50 = *(__CFData **)(a1 + 40);
      v54[0] = *(_BYTE *)(*(_QWORD *)(a1 + 48) + 680);
      CFDataAppendBytes(v50, v54, 1);
      v51 = *(__CFData **)(a1 + 40);
      v54[0] = *(_BYTE *)(*(_QWORD *)(a1 + 48) + 681);
      CFDataAppendBytes(v51, v54, 1);
    }
  }
}

@end
