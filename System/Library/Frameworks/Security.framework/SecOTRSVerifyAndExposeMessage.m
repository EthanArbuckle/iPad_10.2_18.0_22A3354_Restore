@implementation SecOTRSVerifyAndExposeMessage

void __SecOTRSVerifyAndExposeMessage_block_invoke(uint64_t a1)
{
  _QWORD *v1;
  const __CFData *v2;
  unsigned __int8 v3;
  int v4;
  const __CFData *v5;
  uint64_t v6;
  const UInt8 *v7;
  uint64_t *v8;
  unsigned int v9;
  BOOL v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  __CFString *v15;
  const void *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  unint64_t v20;
  uint64_t *v21;
  char *v22;
  char *v23;
  char v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  const __CFData *v30;
  const UInt8 *BytePtr;
  unint64_t Length;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  unint64_t v44;
  char *v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  char *v51;
  CFIndex v52;
  UInt8 *MutableBytePtr;
  const void *v54;
  const __CFAllocator *v55;
  CFIndex v56;
  __CFString *v57;
  const UInt8 *v58;
  CFIndex v59;
  CFIndex v60;
  unsigned int v61;
  CFIndex v62;
  UInt8 *v63;
  __CFString *v64;
  BOOL v65;
  const __CFAllocator *v66;
  CFIndex v67;
  __CFString *Mutable;
  const UInt8 *v69;
  CFIndex v70;
  CFIndex v71;
  unsigned int v72;
  CFIndex extraLength;
  int v74;
  char v75;
  const __CFData *theData;
  const __CFData *theDataa;
  _QWORD *v78;
  _QWORD *v79;
  CFDataRef v80;
  CFDataRef v81;
  uint64_t *v82[3];
  unint64_t *v83;
  unint64_t v84;
  _BYTE __b1[24];
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  __CFString *v90;
  char v91;
  uint64_t v92[5];

  v1 = (_QWORD *)a1;
  v92[3] = *MEMORY[0x1E0C80C00];
  v2 = (const __CFData *)SecOTRCopyIncomingBytes(*(const __CFData **)(a1 + 40));
  v3 = SecOTRSGetMessageType(v2);
  v4 = -25256;
  if (v3 > 0x31u)
    goto LABEL_85;
  if (((1 << v3) & 0x3000300000000) == 0)
  {
    if (v3 != 3)
      goto LABEL_85;
    v29 = v1[6];
    v30 = (const __CFData *)v1[7];
    v79 = v1;
    BytePtr = CFDataGetBytePtr(v2);
    Length = CFDataGetLength(v2);
    if (Length >= 2)
    {
      if (__rev16(*(unsigned __int16 *)BytePtr) != 2)
      {
        v34 = 0;
        v35 = 0;
        v4 = -26275;
        goto LABEL_93;
      }
      v33 = Length;
      if (Length != 2)
      {
        v34 = 0;
        v4 = -26275;
        if (Length == 3)
        {
          v35 = 0;
          goto LABEL_93;
        }
        v35 = 0;
        if (BytePtr[2] != 3)
        {
LABEL_93:
          *(_QWORD *)__b1 = MEMORY[0x1E0C809B0];
          *(_QWORD *)&__b1[8] = 0x40000000;
          *(_QWORD *)&__b1[16] = __SecOTRVerifyAndExposeRaw_locked_block_invoke;
          v86 = &__block_descriptor_tmp_68_10267;
          v87 = v29;
          v88 = v35;
          v89 = v34;
          if (v2)
          {
            v66 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
            v67 = CFDataGetLength(v2);
            Mutable = CFStringCreateMutable(v66, 2 * v67);
            v69 = CFDataGetBytePtr(v2);
            v70 = CFDataGetLength(v2);
            v1 = v79;
            if (v70 >= 1)
            {
              v71 = v70;
              do
              {
                v72 = *v69++;
                CFStringAppendFormat(Mutable, 0, CFSTR("%02X"), v72);
                --v71;
              }
              while (v71);
            }
          }
          else
          {
            Mutable = CFSTR("(null)");
            v1 = v79;
          }
          __SecOTRVerifyAndExposeRaw_locked_block_invoke((uint64_t)__b1, (uint64_t)Mutable);
          v64 = Mutable;
          goto LABEL_84;
        }
        if (BytePtr[3])
        {
          v34 = 0;
          v35 = 0;
          goto LABEL_93;
        }
        v36 = Length & 0xFFFFFFFFFFFFFFFCLL;
        if ((Length & 0xFFFFFFFFFFFFFFFCLL) != 4)
        {
          v37 = bswap32(*((_DWORD *)BytePtr + 1));
          v38 = *(_DWORD *)(v29 + 96);
          if (v37 != v38 && (v37 != v38 - 1 || !*(_QWORD *)(v29 + 104)))
          {
            v34 = 0;
            v35 = 0;
            v65 = v37 + 1 >= v38;
            goto LABEL_90;
          }
          theDataa = v30;
          if (v36 != 8)
          {
            v39 = bswap32(*((_DWORD *)BytePtr + 2));
            v40 = *(_DWORD *)(v29 + 72);
            if (v39 == v40 || v39 == v40 + 1 && *(_QWORD *)(v29 + 88))
            {
              v92[0] = 0xAAAAAAAAAAAAAAAALL;
              v83 = (unint64_t *)0xAAAAAAAAAAAAAAAALL;
              v84 = 0xAAAAAAAAAAAAAAAALL;
              v10 = v39 == v40;
              v41 = 88;
              if (v10)
                v41 = 80;
              v34 = *(_QWORD *)(v29 + v41);
              v10 = v37 == v38;
              v42 = 104;
              if (v10)
                v42 = 112;
              v35 = *(_QWORD *)(v29 + v42);
              SecOTRSFindKeysForMessage(v29, v34, v35, 0, v92, &v84, (uint64_t **)&v83);
              if (v36 != 12)
              {
                v43 = (uint64_t *)bswap32(*((_DWORD *)BytePtr + 3));
                v44 = v33 - 16 - (_QWORD)v43;
                if (v33 - 16 < (unint64_t)v43)
                  goto LABEL_93;
                v82[1] = (uint64_t *)(BytePtr + 16);
                v82[2] = v43;
                if (v44 >= 8)
                {
                  v45 = (char *)v43 + (_QWORD)(BytePtr + 16);
                  v46 = bswap64(*(_QWORD *)v45);
                  if (v46 <= *v83)
                  {
                    v4 = -25328;
                    goto LABEL_93;
                  }
                  if ((v44 & 0xFFFFFFFFFFFFFFFCLL) != 8)
                  {
                    v47 = bswap32(*((_DWORD *)v45 + 2));
                    v48 = v44 - 12;
                    v65 = v48 >= v47;
                    v49 = v48 - v47;
                    if (v65)
                    {
                      v81 = v2;
                      memset(__b1, 170, 20);
                      if (v49 >= 0x14)
                      {
                        v50 = (uint64_t)(v45 + 12);
                        v51 = &v45[v47 + 12];
                        ccsha1_di();
                        cchmac();
                        if (!timingsafe_bcmp(__b1, v51, 0x14uLL))
                        {
                          v52 = CFDataGetLength(theDataa);
                          CFDataIncreaseLength(theDataa, v47);
                          MutableBytePtr = CFDataGetMutableBytePtr(theDataa);
                          AES_CTR_HighHalf_Transform(16, v92[0], v46, v47, v50, (uint64_t)&MutableBytePtr[v52]);
                          *v83 = v46;
                          v54 = SecOTRPublicDHKCreateFromBytes(*MEMORY[0x1E0C9AE00], &v82[1], &v82[2]);
                          v1 = v79;
                          v2 = v81;
                          if (v54 && v37 == *(_DWORD *)(v29 + 96))
                            SecOTRAcceptNewRemoteKey(v29, v54);
                          if (v39 == *(_DWORD *)(v29 + 72) + 1)
                            SecOTRSHandleProposalAcknowledge(v29);
                          SecOTRSRollIfTime(v29);
                          SecOTRSPrecalculateForPair(v29, *(_QWORD *)(v29 + 80), *(_QWORD *)(v29 + 112));
                          if (v54)
                            CFRelease(v54);
                          v4 = 0;
                          goto LABEL_85;
                        }
                        v4 = -25293;
                      }
                      v2 = v81;
                    }
                    goto LABEL_93;
                  }
                }
              }
LABEL_102:
              v4 = -50;
              goto LABEL_93;
            }
            v34 = 0;
            v35 = 0;
            v65 = v39 >= v40;
LABEL_90:
            if (v65)
              v4 = -25329;
            else
              v4 = -25328;
            goto LABEL_93;
          }
        }
      }
    }
    v34 = 0;
    v35 = 0;
    goto LABEL_102;
  }
  v6 = v1[6];
  v5 = (const __CFData *)v1[7];
  v7 = CFDataGetBytePtr(v2);
  v84 = (unint64_t)v7;
  v8 = (uint64_t *)CFDataGetLength(v2);
  v83 = (unint64_t *)v8;
  if (!v8)
  {
    LOBYTE(v9) = 0;
    v15 = 0;
    v13 = 0;
    v18 = 0;
    v4 = -50;
LABEL_69:
    *(_QWORD *)__b1 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&__b1[8] = 0x40000000;
    *(_QWORD *)&__b1[16] = __SecOTRVerifyAndExposeRawCompact_locked_block_invoke;
    v86 = &__block_descriptor_tmp_71_10268;
    v87 = v6;
    v88 = v18;
    v89 = v13;
    v90 = v15;
    v91 = v9;
    if (v2)
    {
      v55 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v56 = CFDataGetLength(v2);
      v57 = CFStringCreateMutable(v55, 2 * v56);
      v58 = CFDataGetBytePtr(v2);
      v59 = CFDataGetLength(v2);
      if (v59 >= 1)
      {
        v60 = v59;
        do
        {
          v61 = *v58++;
          CFStringAppendFormat(v57, 0, CFSTR("%02X"), v61);
          --v60;
        }
        while (v60);
      }
    }
    else
    {
      v57 = CFSTR("(null)");
    }
    __SecOTRVerifyAndExposeRawCompact_locked_block_invoke((uint64_t)__b1, (uint64_t)v57);
    CFRelease(v57);
    if (v15)
      goto LABEL_83;
    goto LABEL_85;
  }
  v9 = *v7;
  v84 = (unint64_t)(v7 + 1);
  v83 = (unint64_t *)((char *)v8 - 1);
  v10 = v9 > 0x31 || ((1 << v9) & 0x3000300000000) == 0;
  if (v10)
  {
    v15 = 0;
    v13 = 0;
LABEL_68:
    v18 = 0;
    v4 = -26275;
    goto LABEL_69;
  }
  v11 = ((v9 & 0xFFFFFFEF) != 32) ^ *(_BYTE *)(v6 + 72);
  v12 = 80;
  if ((v11 & 1) != 0)
    v12 = 88;
  v13 = *(_QWORD *)(v6 + v12);
  if (!v13)
  {
    v15 = 0;
    goto LABEL_68;
  }
  v14 = (__CFString *)SecOTRPublicDHKCreateFromCompactSerialization(*MEMORY[0x1E0C9AE00], &v84, (unint64_t *)&v83);
  v15 = v14;
  if (!v14)
    goto LABEL_68;
  v16 = *(const void **)(v6 + 112);
  if (!v16)
    goto LABEL_68;
  v75 = v11;
  theData = v5;
  v80 = v2;
  v74 = CFEqual(v14, v16);
  v17 = 104;
  if (!v74)
    v17 = 112;
  v18 = *(_QWORD *)(v6 + v17);
  if (!v18)
  {
LABEL_65:
    v4 = -26275;
LABEL_66:
    v2 = v80;
    goto LABEL_69;
  }
  v19 = v9 & 0xFE;
  memset(v82, 170, sizeof(v82));
  SecOTRSFindKeysForMessage(v6, v13, v18, 0, &v82[2], &v82[1], v82);
  v20 = 0;
  v21 = (uint64_t *)v83;
  v22 = (char *)v84;
  v23 = (char *)v83 + v84;
  do
  {
    if (!v21)
    {
      v83 = 0;
      v84 = (unint64_t)v23;
      goto LABEL_65;
    }
    v24 = *v22++;
    v25 = v24 & 0x7F | (v20 << 7);
    v21 = (uint64_t *)((char *)v21 - 1);
    v20 = v25;
  }
  while (v24 < 0);
  v83 = (unint64_t *)v21;
  v84 = (unint64_t)v22;
  if (v25 <= *v82[0])
  {
    v4 = -25328;
    goto LABEL_66;
  }
  v78 = v1;
  v26 = 16;
  if (v19 == 48)
    v26 = 56;
  v27 = 0x1FFFFFFFFFFFFFFELL;
  if (v19 == 48)
    v27 = 0x1FFFFFFFFFFFFFF9;
  extraLength = (CFIndex)&v21[v27];
  v28 = (char *)&v21[v27] + (_QWORD)v22;
  v83 = (unint64_t *)v26;
  v84 = (unint64_t)v28;
  if (v19 == 48)
  {
    v28 += 40;
    v83 = (unint64_t *)(v26 - 40);
    v84 = (unint64_t)v28;
    memset(v92, 170, 20);
    if (v26 != 56)
    {
      v4 = -26275;
LABEL_109:
      v1 = v78;
      goto LABEL_66;
    }
  }
  else
  {
    memset(v92, 170, 20);
  }
  ccsha1_di();
  cchmac();
  if (timingsafe_bcmp(v92, v28, 0x10uLL))
  {
    v4 = -25293;
    goto LABEL_109;
  }
  v62 = CFDataGetLength(theData);
  CFDataIncreaseLength(theData, extraLength);
  v63 = CFDataGetMutableBytePtr(theData);
  AES_CTR_HighHalf_Transform(16, (uint64_t)v82[2], v25, extraLength, (uint64_t)v22, (uint64_t)&v63[v62]);
  *v82[0] = v25;
  v1 = v78;
  if (!v74)
    SecOTRAcceptNewRemoteKey(v6, v15);
  v2 = v80;
  if ((v75 & 1) != 0)
    SecOTRSHandleProposalAcknowledge(v6);
  SecOTRSRollIfTime(v6);
  SecOTRSPrecalculateForPair(v6, *(_QWORD *)(v6 + 80), *(_QWORD *)(v6 + 112));
  v4 = 0;
  if (v15)
  {
LABEL_83:
    v64 = v15;
LABEL_84:
    CFRelease(v64);
  }
LABEL_85:
  *(_DWORD *)(*(_QWORD *)(v1[4] + 8) + 24) = v4;
  if (v2)
    CFRelease(v2);
}

@end
