@implementation SecOTRSProcessPacket

__n128 __SecOTRSProcessPacket_block_invoke(uint64_t a1)
{
  __int128 v1;
  __n128 result;
  _QWORD v3[4];
  __int128 v4;
  __int128 v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 0x40000000;
  v3[2] = __SecOTRSProcessPacket_block_invoke_2;
  v3[3] = &unk_1E1FD8AD8;
  v1 = *(_OWORD *)(a1 + 48);
  v4 = *(_OWORD *)(a1 + 32);
  v5 = v1;
  _os_activity_initiate(&dword_18A900000, "OTR Process Packet", OS_ACTIVITY_FLAG_DEFAULT, v3);
  return result;
}

void __SecOTRSProcessPacket_block_invoke_2(uint64_t a1)
{
  const __CFData *v2;
  const UInt8 *BytePtr;
  unint64_t Length;
  unsigned int v5;
  BOOL v6;
  int v7;
  CFAllocatorRef *v8;
  __CFData *Mutable;
  int v10;
  uint64_t v11;
  const UInt8 *v12;
  unint64_t v13;
  int v14;
  int v15;
  const __CFString *v16;
  const void *v17;
  uint64_t v18;
  const UInt8 *v19;
  unint64_t v20;
  int v21;
  int v22;
  const void *v23;
  uint64_t v24;
  const __CFString *v25;
  const void *v26;
  const __CFAllocator *v27;
  CFIndex v28;
  __CFString *v29;
  const UInt8 *v30;
  CFIndex v31;
  CFIndex v32;
  unsigned int v33;
  uint64_t v34;
  const UInt8 *v35;
  unint64_t v36;
  const __CFData *v37;
  unsigned int v38;
  int v39;
  unsigned int v40;
  __int128 v41;
  const UInt8 *v42;
  unint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  const __CFAllocator *v47;
  CFIndex v48;
  __CFString *v49;
  const UInt8 *v50;
  CFIndex v51;
  CFIndex v52;
  unsigned int v53;
  __CFData *v54;
  unint64_t *GXHash;
  unint64_t *v56;
  _BOOL4 v57;
  unint64_t v58;
  unint64_t v59;
  int v60;
  NSObject *v61;
  const __CFData *v62;
  const void *v63;
  const __CFAllocator *v64;
  CFIndex v65;
  const UInt8 *v66;
  CFIndex v67;
  CFIndex v68;
  unsigned int v69;
  const __CFAllocator *v70;
  CFIndex v71;
  const UInt8 *v72;
  CFIndex v73;
  CFIndex v74;
  unsigned int v75;
  uint64_t v76;
  uint64_t v77;
  const __CFAllocator *v78;
  CFIndex v79;
  __CFString *v80;
  const UInt8 *v81;
  CFIndex v82;
  CFIndex v83;
  unsigned int v84;
  uint64_t v85;
  uint64_t v86;
  void (*v87)(uint64_t, uint64_t);
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  const UInt8 *v93;
  uint64_t v94;
  unsigned int *v95;
  _BYTE buf[32];
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  int v107;
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v2 = (const __CFData *)SecOTRCopyIncomingBytes(*(const __CFData **)(a1 + 40));
  BytePtr = CFDataGetBytePtr(v2);
  Length = CFDataGetLength(v2);
  if (Length >= 2 && ((v5 = __rev16(*(unsigned __int16 *)BytePtr), Length != 2) ? (v6 = v5 == 2) : (v6 = 0), v6))
    v7 = BytePtr[2];
  else
    v7 = 255;
  v8 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
  if (*(_BYTE *)(*(_QWORD *)(a1 + 48) + 648))
  {
    Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  }
  else
  {
    Mutable = *(__CFData **)(a1 + 56);
    if (Mutable)
      CFRetain(*(CFTypeRef *)(a1 + 56));
  }
  v10 = -26275;
  if (v7 > 16)
  {
    if (v7 != 17)
    {
      if (v7 != 18)
        goto LABEL_124;
      v18 = *(_QWORD *)(a1 + 48);
      if (*(_DWORD *)(v18 + 16) != 3)
        goto LABEL_107;
      v19 = CFDataGetBytePtr(v2);
      v20 = CFDataGetLength(v2);
      if (v20 >= 2)
      {
        if (__rev16(*(unsigned __int16 *)v19) != 2)
          goto LABEL_111;
        if (v20 != 2)
        {
          v21 = v19[2];
          v95 = (unsigned int *)(v20 - 3);
          *(_QWORD *)buf = v19 + 3;
          if (v21 == 18)
          {
            v22 = SecVerifySignatureAndMac(v18, 1, (uint64_t)buf, (uint64_t)&v95);
            if (v22)
            {
              v10 = v22;
            }
            else
            {
              v23 = *(const void **)(v18 + 64);
              if (v23)
              {
                *(_QWORD *)(v18 + 64) = 0;
                CFRelease(v23);
              }
              v10 = 0;
              *(_DWORD *)(v18 + 16) = 4;
            }
            goto LABEL_124;
          }
LABEL_111:
          v10 = -26275;
          goto LABEL_124;
        }
      }
      v10 = -50;
      goto LABEL_124;
    }
    v34 = *(_QWORD *)(a1 + 48);
    if (*(_DWORD *)(v34 + 16) != 2)
    {
LABEL_107:
      v10 = 0;
      goto LABEL_124;
    }
    v35 = CFDataGetBytePtr(v2);
    v93 = v35;
    v36 = CFDataGetLength(v2);
    v92 = v36;
    v37 = *(const __CFData **)(v34 + 56);
    if (!v37)
      goto LABEL_116;
    if (v36 < 2)
      goto LABEL_116;
    v38 = *(unsigned __int16 *)v35;
    v93 = v35 + 2;
    v92 = v36 - 2;
    if (v36 == 2)
      goto LABEL_116;
    if (__rev16(v38) != 2)
      goto LABEL_116;
    v39 = v35[2];
    v92 = v36 - 3;
    v93 = v35 + 3;
    if (v36 - 3 < 4)
      goto LABEL_116;
    if (v39 != 17)
      goto LABEL_116;
    v40 = bswap32(*(_DWORD *)(v35 + 3));
    v92 = v36 - 7;
    v93 = v35 + 7;
    if (v40 != 16)
      goto LABEL_116;
    *(_OWORD *)(v34 + 40) = *(_OWORD *)(v35 + 7);
    v92 = v36 - 23;
    v93 = v35 + 23;
    *(_QWORD *)&v41 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v41 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v41;
    *(_OWORD *)&buf[16] = v41;
    v97 = v41;
    v98 = v41;
    v99 = v41;
    v100 = v41;
    v101 = v41;
    v102 = v41;
    v103 = v41;
    v104 = v41;
    v105 = v41;
    v106 = v41;
    v107 = -1431655766;
    v95 = (unsigned int *)buf;
    v42 = CFDataGetBytePtr(v37);
    v43 = CFDataGetLength(*(CFDataRef *)(v34 + 56));
    if (v43 >= 2)
    {
      if (__rev16(*(unsigned __int16 *)v42) != 2)
        goto LABEL_113;
      if (v43 != 2)
      {
        if (v42[2] != 2)
          goto LABEL_113;
        if (v43 - 3 >= 4)
        {
          v44 = bswap32(*(_DWORD *)(v42 + 3));
          v94 = v44;
          if (v44 < 0xC5)
          {
            AES_CTR_Transform(16, v34 + 40, (uint64_t)&kIVZero, v44, (uint64_t)(v42 + 7), (uint64_t)buf);
            v45 = SecOTRSetupTheirKeyFrom(v34, &v95, (unint64_t *)&v94);
            if (!v45)
            {
              v45 = SecVerifySignatureAndMac(v34, 0, (uint64_t)&v93, (uint64_t)&v92);
              if (!v45)
              {
                SecOTRAppendSignatureMessage(v34, Mutable);
                v46 = MEMORY[0x1E0C809B0];
                *(_DWORD *)(v34 + 16) = 4;
                *(_QWORD *)buf = v46;
                *(_QWORD *)&buf[8] = 0x40000000;
                *(_QWORD *)&buf[16] = __SecOTRSProcessRevealSignatureMessage_block_invoke;
                *(_QWORD *)&buf[24] = &__block_descriptor_tmp_36_10320;
                *(_QWORD *)&v97 = v34;
                if (Mutable)
                {
                  v47 = *v8;
                  v48 = CFDataGetLength(Mutable);
                  v49 = CFStringCreateMutable(v47, 2 * v48);
                  v50 = CFDataGetBytePtr(Mutable);
                  v51 = CFDataGetLength(Mutable);
                  if (v51 >= 1)
                  {
                    v52 = v51;
                    do
                    {
                      v53 = *v50++;
                      CFStringAppendFormat(v49, 0, CFSTR("%02X"), v53);
                      --v52;
                    }
                    while (v52);
                  }
                }
                else
                {
                  v49 = CFSTR("(null)");
                }
                __SecOTRSProcessRevealSignatureMessage_block_invoke((uint64_t)buf, (uint64_t)v49);
                v10 = 0;
LABEL_123:
                CFRelease(v49);
                goto LABEL_124;
              }
            }
            v10 = v45;
LABEL_116:
            *(_QWORD *)buf = MEMORY[0x1E0C809B0];
            *(_QWORD *)&buf[8] = 0x40000000;
            *(_QWORD *)&buf[16] = __SecOTRSProcessRevealSignatureMessage_block_invoke_37;
            *(_QWORD *)&buf[24] = &__block_descriptor_tmp_38_10321;
            *(_QWORD *)&v97 = v34;
            DWORD2(v97) = v10;
            if (v2)
            {
              v70 = *v8;
              v71 = CFDataGetLength(v2);
              v49 = CFStringCreateMutable(v70, 2 * v71);
              v72 = CFDataGetBytePtr(v2);
              v73 = CFDataGetLength(v2);
              if (v73 >= 1)
              {
                v74 = v73;
                do
                {
                  v75 = *v72++;
                  CFStringAppendFormat(v49, 0, CFSTR("%02X"), v75);
                  --v74;
                }
                while (v74);
              }
            }
            else
            {
              v49 = CFSTR("(null)");
            }
            __SecOTRSProcessRevealSignatureMessage_block_invoke_37((uint64_t)buf, (uint64_t)v49);
            goto LABEL_123;
          }
LABEL_113:
          v10 = -26275;
          goto LABEL_116;
        }
      }
    }
    v10 = -50;
    goto LABEL_116;
  }
  if (v7 == 2)
  {
    v24 = *(_QWORD *)(a1 + 48);
    v25 = &stru_1E1FDD448;
    switch(*(_DWORD *)(v24 + 16))
    {
      case 0:
      case 3:
      case 4:
        goto LABEL_35;
      case 1:
        v27 = *v8;
        v54 = CFDataCreateMutable(*v8, 0);
        SecOTRAppendDHMessage(v24, v54);
        GXHash = (unint64_t *)FindGXHash(v54);
        v56 = (unint64_t *)FindGXHash(v2);
        v57 = 0;
        if (GXHash && v56)
        {
          v58 = bswap64(*GXHash);
          v59 = bswap64(*v56);
          if (v58 == v59
            && (v58 = bswap64(GXHash[1]), v59 = bswap64(v56[1]), v58 == v59)
            && (v58 = bswap64(GXHash[2]), v59 = bswap64(v56[2]), v58 == v59)
            && (v58 = bswap64(GXHash[3]), v59 = bswap64(v56[3]), v58 == v59))
          {
            v60 = 0;
          }
          else if (v58 < v59)
          {
            v60 = -1;
          }
          else
          {
            v60 = 1;
          }
          v57 = v60 > 0;
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 0x40000000;
          *(_QWORD *)&buf[16] = __SecOTRMyGXHashIsBigger_block_invoke;
          *(_QWORD *)&buf[24] = &__block_descriptor_tmp_26_10308;
          *(_QWORD *)&v97 = v56;
          BufferPerformWithHexString_10309((UInt8 *)GXHash, (uint64_t)buf);
        }
        if (v54)
          CFRelease(v54);
        if (v57)
        {
          v63 = *(const void **)(v24 + 56);
          if (v63)
          {
            *(_QWORD *)(v24 + 56) = 0;
            CFRelease(v63);
          }
          SecOTRAppendDHMessage(v24, Mutable);
          v25 = CFSTR("Our GX is bigger, resending DH");
        }
        else
        {
          v25 = CFSTR("Our GX is smaller, sending DHKey");
LABEL_35:
          SecOTRInitMyDHKeys(v24);
LABEL_36:
          SecOTRAppendDHKeyMessage(v24, Mutable);
          v26 = *(const void **)(v24 + 56);
          if (v26)
          {
            *(_QWORD *)(v24 + 56) = 0;
            CFRelease(v26);
          }
          v27 = *v8;
          *(_QWORD *)(v24 + 56) = CFDataCreateCopy(*v8, v2);
          *(_DWORD *)(v24 + 16) = 2;
        }
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 0x40000000;
        *(_QWORD *)&buf[16] = __SecOTRSProcessDHMessage_block_invoke;
        *(_QWORD *)&buf[24] = &__block_descriptor_tmp_24_10312;
        *(_QWORD *)&v97 = v24;
        *((_QWORD *)&v97 + 1) = v25;
        if (Mutable)
        {
          v28 = CFDataGetLength(Mutable);
          v29 = CFStringCreateMutable(v27, 2 * v28);
          v30 = CFDataGetBytePtr(Mutable);
          v31 = CFDataGetLength(Mutable);
          if (v31 >= 1)
          {
            v32 = v31;
            do
            {
              v33 = *v30++;
              CFStringAppendFormat(v29, 0, CFSTR("%02X"), v33);
              --v32;
            }
            while (v32);
          }
        }
        else
        {
          v29 = CFSTR("(null)");
        }
        __SecOTRSProcessDHMessage_block_invoke((uint64_t)buf, (uint64_t)v29);
        goto LABEL_106;
      case 2:
        goto LABEL_36;
      default:
        v61 = secLogObjForScope("otr");
        v10 = -25308;
        if (!os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          goto LABEL_124;
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v24;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = -25308;
        goto LABEL_85;
    }
  }
  if (v7 == 10)
  {
    v11 = *(_QWORD *)(a1 + 48);
    v12 = CFDataGetBytePtr(v2);
    v13 = CFDataGetLength(v2);
    if (v13 > 2
      && __rev16(*(unsigned __int16 *)v12) == 2
      && (v14 = v12[2], v95 = (unsigned int *)(v13 - 3), *(_QWORD *)buf = v12 + 3, v14 == 10))
    {
      v15 = SecOTRSetupTheirKeyFrom(v11, (unsigned int **)buf, (unint64_t *)&v95);
      if (!v15)
      {
        v16 = CFSTR("Ignoring DHKey message");
        switch(*(_DWORD *)(v11 + 16))
        {
          case 0:
          case 2:
          case 4:
            goto LABEL_99;
          case 1:
            v17 = *(const void **)(v11 + 64);
            if (v17)
            {
              *(_QWORD *)(v11 + 64) = 0;
              CFRelease(v17);
            }
            SecOTRAppendRevealSignatureMessage(v11, Mutable);
            *(_DWORD *)(v11 + 16) = 3;
            *(_QWORD *)(v11 + 64) = CFDataCreateCopy(*v8, v2);
            v16 = CFSTR("Sending reveal signature");
            goto LABEL_99;
          case 3:
            v62 = *(const __CFData **)(v11 + 64);
            if (v2 && v62)
            {
              if (CFEqual(v2, v62))
              {
LABEL_81:
                SecOTRAppendRevealSignatureMessage(v11, Mutable);
                v16 = CFSTR("Resending reveal signature");
                goto LABEL_99;
              }
            }
            else if (v62 == v2)
            {
              goto LABEL_81;
            }
            v16 = CFSTR("Ignoring new DHKey message");
LABEL_99:
            *(_QWORD *)buf = MEMORY[0x1E0C809B0];
            *(_QWORD *)&buf[8] = 0x40000000;
            *(_QWORD *)&buf[16] = __SecOTRSProcessDHKeyMessage_block_invoke;
            *(_QWORD *)&buf[24] = &__block_descriptor_tmp_35_10318;
            *(_QWORD *)&v97 = v11;
            *((_QWORD *)&v97 + 1) = v16;
            if (Mutable)
            {
              v64 = *v8;
              v65 = CFDataGetLength(Mutable);
              v29 = CFStringCreateMutable(v64, 2 * v65);
              v66 = CFDataGetBytePtr(Mutable);
              v67 = CFDataGetLength(Mutable);
              if (v67 >= 1)
              {
                v68 = v67;
                do
                {
                  v69 = *v66++;
                  CFStringAppendFormat(v29, 0, CFSTR("%02X"), v69);
                  --v68;
                }
                while (v68);
              }
            }
            else
            {
              v29 = CFSTR("(null)");
            }
            __SecOTRSProcessDHKeyMessage_block_invoke((uint64_t)buf, (uint64_t)v29);
LABEL_106:
            CFRelease(v29);
            break;
          default:
            v10 = -25308;
            goto LABEL_83;
        }
        goto LABEL_107;
      }
      v10 = v15;
    }
    else
    {
      v10 = -50;
    }
LABEL_83:
    v61 = secLogObjForScope("otr");
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v10;
LABEL_85:
      _os_log_impl(&dword_18A900000, v61, OS_LOG_TYPE_DEFAULT, "%@ Process DH failed %d", buf, 0x12u);
    }
  }
LABEL_124:
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v10;
  v76 = *(_QWORD *)(a1 + 32);
  v77 = *(_QWORD *)(a1 + 48);
  if (*(_DWORD *)(*(_QWORD *)(v76 + 8) + 24))
  {
    v85 = MEMORY[0x1E0C809B0];
    v86 = 0x40000000;
    v87 = __SecOTRSProcessPacket_block_invoke_3;
    v88 = &unk_1E1FD8AB0;
    v89 = v76;
    v90 = v77;
    LODWORD(v91) = v7;
    if (v2)
    {
      v78 = *v8;
      v79 = CFDataGetLength(v2);
      v80 = CFStringCreateMutable(v78, 2 * v79);
      v81 = CFDataGetBytePtr(v2);
      v82 = CFDataGetLength(v2);
      if (v82 >= 1)
      {
        v83 = v82;
        do
        {
          v84 = *v81++;
          CFStringAppendFormat(v80, 0, CFSTR("%02X"), v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, *(_QWORD *)buf, *(_QWORD *)&buf[8], *(_OWORD *)&buf[16], v97);
          --v83;
        }
        while (v83);
      }
    }
    else
    {
      v80 = CFSTR("(null)");
    }
    __SecOTRSProcessPacket_block_invoke_3((uint64_t)&v85, (uint64_t)v80);
    CFRelease(v80);
    v77 = *(_QWORD *)(a1 + 48);
  }
  if (*(_BYTE *)(v77 + 648))
    SecOTRPrepareOutgoingBytes(Mutable, *(__CFData **)(a1 + 56));
  if (Mutable)
    CFRelease(Mutable);
  if (v2)
    CFRelease(v2);
}

void __SecOTRSProcessPacket_block_invoke_3(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = secLogObjForScope("session");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v7 = *(_DWORD *)(a1 + 48);
    v8 = *(_DWORD *)(v5 + 16);
    v9 = *(_DWORD *)(v5 + 72);
    v10 = *(_QWORD *)(v5 + 80);
    v11 = *(_QWORD *)(v5 + 88);
    v12 = *(_DWORD *)(v5 + 96);
    v14 = *(_QWORD *)(v5 + 104);
    v13 = *(_QWORD *)(v5 + 112);
    v15 = 138414850;
    v16 = v5;
    v17 = 1024;
    v18 = v6;
    v19 = 1024;
    v20 = v7;
    v21 = 1024;
    v22 = v8;
    v23 = 1024;
    v24 = v9;
    v25 = 2048;
    v26 = v10;
    v27 = 2048;
    v28 = v11;
    v29 = 1024;
    v30 = v12;
    v31 = 2048;
    v32 = v13;
    v33 = 2048;
    v34 = v14;
    v35 = 2112;
    v36 = a2;
    _os_log_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEFAULT, "%@ Error %d processing packet type %d, session state %d, keyid %d, myKey %p, myNextKey %p, theirKeyId %d, theirKey %p, theirPreviousKey %p, bytes %@", (uint8_t *)&v15, 0x5Cu);
  }
}

@end
