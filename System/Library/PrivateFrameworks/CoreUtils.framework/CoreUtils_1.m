uint64_t _VerifyClientExchange(uint64_t a1, unsigned __int8 *a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _BYTE *v8;
  CFIndex *v9;
  uint64_t v14;
  unsigned __int8 *v15;
  unint64_t v16;
  unsigned __int8 *v17;
  unsigned __int8 *v18;
  uint64_t v19;
  int v20;
  uint64_t appended;
  unint64_t v22;
  int *v23;
  int v24;
  uint64_t v25;
  int *v26;
  int v27;
  _BOOL4 v28;
  int *v29;
  int v30;
  _BOOL4 v31;
  int *v32;
  _OWORD *v33;
  uint64_t Bytes;
  int8x16_t v35;
  int8x16_t *v36;
  unsigned __int8 *v37;
  uint64_t v38;
  size_t v39;
  unsigned __int8 *v40;
  char *v41;
  char v42;
  int v43;
  const void *v44;
  void *v45;
  unsigned __int8 *v46;
  unsigned __int8 *v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  int *v51;
  int *v52;
  int v53;
  uint64_t v54;
  _QWORD *v56;
  int v57;
  char *v58;
  int8x16_t *v59;
  int8x16_t *v60;
  unsigned __int8 *v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unsigned int v70;
  uint64_t GroupInfoTLV;
  int8x16_t *v73;
  int *v74;
  void *v75;
  size_t *v76;
  char *v77;
  uint64_t v78;
  uint64_t Peer;
  uint64_t v80;
  char *v81;
  __int128 v82;
  char *v83;
  __int128 v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  int *v89;
  const void *v90;
  UInt8 *v91;
  UInt8 *v92;
  __CFString *v93;
  CFTypeID v94;
  int v95;
  const void *v96;
  void *v97;
  __int128 v98;
  __int128 v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  size_t v107;
  size_t v108;
  _OWORD *v109;
  void *v110;
  __int128 v111;
  _OWORD *v112;
  _OWORD *v113;
  __int128 v114;
  void (*v115)(_QWORD, void *, size_t, char *, _QWORD);
  int v116;
  int *v117;
  const __CFDictionary *v118;
  CFTypeID TypeID;
  const __CFString *TypedValue;
  const __CFData *v121;
  const __CFData *v122;
  char *BytePtr;
  size_t Length;
  int8x16_t *v125;
  char *v126;
  int v127;
  int *v128;
  int v129;
  uint64_t v130;
  int v131;
  int *v132;
  int v133;
  uint64_t v134;
  int *v135;
  int *v136;
  int *v137;
  uint64_t v138;
  int *v139;
  uint64_t v140;
  int *v141;
  unsigned int v142;
  int v143;
  uint64_t v144;
  _BYTE *v145;
  size_t *v146;
  _DWORD *v147;
  _QWORD *v148;
  CFTypeRef cf;
  uint64_t v150;
  size_t v151;
  unsigned int v152;
  int v153;
  char __dst[64];
  _OWORD *v155;
  __int128 v156;
  void *v157;
  _OWORD v158[19];
  _OWORD v159[4];
  char v160[64];
  char __s[8];
  __int128 v162;
  void *v163;
  _OWORD v164[19];
  _BYTE v165[32];
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  uint64_t v185;

  v8 = (_BYTE *)a6;
  v9 = (CFIndex *)a5;
  v185 = *MEMORY[0x1E0C80C00];
  v15 = (unsigned __int8 *)(a1 + 120);
  v14 = *(unsigned __int8 *)(a1 + 120);
  if (!*(_BYTE *)(a1 + 120))
  {
    v14 = 1;
    *v15 = 1;
  }
  v16 = (unint64_t)&a2[a3];
  if (a3)
  {
    v17 = a2;
    do
    {
      if (v17 == (unsigned __int8 *)v16)
        goto LABEL_49;
      if ((unint64_t)v17 >= v16)
        goto LABEL_119;
      if (v16 - (unint64_t)v17 < 2)
      {
LABEL_49:
        appended = 4294960569;
        goto LABEL_98;
      }
      v18 = v17 + 2;
      v19 = v17[1];
      if ((unint64_t)&v17[v19 + 2] > v16)
      {
        appended = 4294960546;
        goto LABEL_98;
      }
      v20 = *v17;
      v17 += v19 + 2;
    }
    while (v20 != 6);
    if ((_DWORD)v19 != 1)
    {
      appended = 4294960553;
      goto LABEL_98;
    }
    if (*v18 != (_DWORD)v14)
      goto LABEL_46;
  }
  if ((_DWORD)v14 == 4)
  {
    v184 = 0u;
    v183 = 0u;
    v182 = 0u;
    v181 = 0u;
    v180 = 0u;
    v179 = 0u;
    v178 = 0u;
    v177 = 0u;
    v176 = 0u;
    v175 = 0u;
    v174 = 0u;
    v173 = 0u;
    v172 = 0u;
    v171 = 0u;
    v170 = 0u;
    v169 = 0u;
    v168 = 0u;
    v167 = 0u;
    v166 = 0u;
    *(_OWORD *)&v165[8] = xmmword_18D51D4A0;
    *(_QWORD *)v165 = &v166;
    *(_QWORD *)&v165[24] = 0;
    v29 = *(int **)(a1 + 16);
    v30 = *v29;
    if (*v29 <= 30)
    {
      if (v30 != -1)
      {
LABEL_35:
        if (v30 > 10)
          v31 = 0;
        else
          v31 = v30 != -1 || _LogCategory_Initialize((uint64_t)v29, 0xAu);
        LogPrintF((uint64_t)v29, (uint64_t)"OSStatus _VerifyClientM4(PairingSessionRef, const uint8_t *const, const uint8_t *const)", 0x1Eu, (uint64_t)"Pair-verify client M4 -- finish response\n%?{end}%1{tlv8}\n", a5, a6, a7, a8, !v31);
        goto LABEL_81;
      }
      if (_LogCategory_Initialize(*(_QWORD *)(a1 + 16), 0x1Eu))
      {
        v29 = *(int **)(a1 + 16);
        v30 = *v29;
        goto LABEL_35;
      }
    }
LABEL_81:
    v46 = a2;
    while (v16 > (unint64_t)v46)
    {
      if (v16 - (unint64_t)v46 < 2)
        break;
      v47 = v46 + 2;
      v48 = v46[1];
      if ((unint64_t)&v46[v48 + 2] > v16)
        break;
      v49 = *v46;
      v46 += v48 + 2;
      if (v49 == 7)
      {
        if ((_DWORD)v48 == 1)
        {
          v50 = *v47;
          if (v50 >= 9)
          {
            if ((_DWORD)v50 == 9)
              appended = 4294960520;
            else
              appended = 4294960596;
          }
          else
          {
            appended = dword_18D51F670[v50];
          }
          v51 = *(int **)(a1 + 16);
          if (*v51 <= 50)
          {
            if (*v51 != -1)
            {
LABEL_94:
              LogPrintF((uint64_t)v51, (uint64_t)"OSStatus _VerifyClientM4(PairingSessionRef, const uint8_t *const, const uint8_t *const)", 0x32u, (uint64_t)"### Pair-verify client M4 bad status: 0x%X, %#m\n", a5, a6, a7, a8, v50);
              goto LABEL_96;
            }
            if (_LogCategory_Initialize((uint64_t)v51, 0x32u))
            {
              v51 = *(int **)(a1 + 16);
              v50 = *v47;
              goto LABEL_94;
            }
          }
        }
        else
        {
          appended = 4294960553;
        }
        goto LABEL_96;
      }
    }
    v56 = a4;
    v57 = *(_DWORD *)(a1 + 100);
    if ((v57 & 0x20000000) != 0)
      v58 = "PV-Msg4s";
    else
      v58 = "PV-Msg04";
    if ((v57 & 1) != 0)
    {
      v70 = _MFiClientVerify(a1, a2, a3, v58, a1 + 638, 32, "MFi-Pair-Verify-Salt", 0x14uLL, (uint64_t)"MFi-Pair-Verify-Info", 20, 1);
      if (v70 == -71164 || v70 == 0)
        appended = v70;
      else
        appended = 4294896151;
      if ((_DWORD)appended)
        goto LABEL_96;
      v60 = 0;
      a4 = v56;
LABEL_133:
      if ((*(_BYTE *)(a1 + 100) & 2) != 0)
      {
        CryptoHKDF((uint64_t)kCryptoHashDescriptor_SHA512, a1 + 638, 32, "Pair-Verify-ResumeSessionID-Salt", 0x20uLL, (uint64_t)"Pair-Verify-ResumeSessionID-Info", 32, 8uLL, (uint64_t)__s);
        v73 = *(int8x16_t **)__s;
        *(_QWORD *)(a1 + 376) = *(_QWORD *)__s;
        _PairingSaveResumeState(a1, *(const void **)(a1 + 296), *(_QWORD *)(a1 + 304), *(const void **)(a1 + 248), *(_QWORD *)(a1 + 256), (uint64_t)v73, (_OWORD *)(a1 + 638));
      }
      *(_BYTE *)(a1 + 120) = 5;
      v74 = *(int **)(a1 + 16);
      if (*v74 <= 30)
      {
        if (*v74 != -1)
        {
LABEL_137:
          LogPrintF((uint64_t)v74, (uint64_t)"OSStatus _VerifyClientM4(PairingSessionRef, const uint8_t *const, const uint8_t *const)", 0x1Eu, (uint64_t)"Pair-verify client done\n", a5, a6, a7, a8, v144);
          goto LABEL_204;
        }
        if (_LogCategory_Initialize((uint64_t)v74, 0x1Eu))
        {
          v74 = *(int **)(a1 + 16);
          goto LABEL_137;
        }
      }
LABEL_204:
      appended = 0;
      if (!v60)
      {
LABEL_206:
        if (*(_QWORD *)&v165[24])
          free(*(void **)&v165[24]);
        if ((_DWORD)appended)
          goto LABEL_98;
        *a4 = 0;
        *v9 = 0;
        v42 = 1;
        if (a4)
          goto LABEL_69;
        goto LABEL_71;
      }
LABEL_205:
      free(v60);
      goto LABEL_206;
    }
    v145 = v8;
    *(_QWORD *)__s = 0;
    v59 = (int8x16_t *)TLV8CopyCoalesced(a2, &a2[a3], 5, (size_t *)__s, 0);
    v60 = v59;
    v61 = 0;
    if (v59 && *(_QWORD *)__s)
    {
      a7 = *(_QWORD *)__s - 16;
      if (*(_QWORD *)__s < 0x10uLL)
      {
        appended = 4294960553;
        goto LABEL_275;
      }
      v61 = &v59->u8[a7];
      v62 = _chacha20_poly1305_decrypt_all((_DWORD *)(a1 + 414), v58, 8, 0, 0, v59, a7, v59, (uint64_t)v59->i64 + a7, 16);
      if ((_DWORD)v62)
      {
        appended = v62;
        v8 = v145;
        a4 = v56;
        goto LABEL_205;
      }
    }
    if ((*(_BYTE *)(a1 + 103) & 0x20) == 0
      || (GroupInfoTLV = _PairingSessionAppleIDVerifyPeer(a1, (unsigned __int8 *)v60, v61), !(_DWORD)GroupInfoTLV))
    {
      GroupInfoTLV = _ExtractGroupInfoTLV(a1, (unsigned __int8 *)v60, v61);
      if (!(_DWORD)GroupInfoTLV)
      {
        a4 = v56;
        v8 = v145;
        goto LABEL_133;
      }
    }
    appended = GroupInfoTLV;
LABEL_275:
    v8 = v145;
    a4 = v56;
    if (!v60)
      goto LABEL_206;
    goto LABEL_205;
  }
  if ((_DWORD)v14 == 2)
  {
    v152 = 0;
    memset(v158, 0, sizeof(v158));
    v150 = 0;
    v151 = 0;
    cf = 0;
    v155 = v158;
    v156 = xmmword_18D51D4A0;
    v157 = 0;
    v26 = *(int **)(a1 + 16);
    v27 = *v26;
    if (*v26 > 30)
      goto LABEL_52;
    if (v27 == -1)
    {
      if (!_LogCategory_Initialize(*(_QWORD *)(a1 + 16), 0x1Eu))
        goto LABEL_52;
      v26 = *(int **)(a1 + 16);
      v27 = *v26;
    }
    if (v27 > 10)
      v28 = 0;
    else
      v28 = v27 != -1 || _LogCategory_Initialize((uint64_t)v26, 0xAu);
    LogPrintF((uint64_t)v26, (uint64_t)"OSStatus _VerifyClientM2(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *)", 0x1Eu, (uint64_t)"Pair-verify client M2 -- start response\n%?{end}%1{tlv8}\n", a5, a6, a7, a8, !v28);
LABEL_52:
    v146 = (size_t *)v9;
    v33 = (_OWORD *)(a1 + 574);
    Bytes = TLV8GetBytes(a2, &a2[a3], 3, 0x20uLL, 0x20uLL, (char *)(a1 + 574), 0, 0);
    v152 = Bytes;
    v148 = a4;
    if (!(_DWORD)Bytes)
    {
      cccurve25519();
      v35 = vorrq_s8(*(int8x16_t *)(v15 + 534), *(int8x16_t *)(v15 + 518));
      if (vorr_s8(*(int8x8_t *)v35.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v35, v35, 8uLL)))
      {
        v147 = (_DWORD *)(a1 + 414);
        CryptoHKDF((uint64_t)kCryptoHashDescriptor_SHA512, (uint64_t)(v15 + 518), 32, "Pair-Verify-Encrypt-Salt", 0x18uLL, (uint64_t)"Pair-Verify-Encrypt-Info", 24, 0x20uLL, a1 + 414);
        v36 = (int8x16_t *)TLV8CopyCoalesced(a2, &a2[a3], 5, &v151, (int *)&v152);
        v37 = (unsigned __int8 *)v36;
        v38 = v152;
        if (v152)
        {
          v136 = *(int **)(a1 + 16);
          if (*v136 <= 90)
          {
            if (*v136 == -1)
            {
              if (!_LogCategory_Initialize((uint64_t)v136, 0x5Au))
                goto LABEL_57;
              v136 = *(int **)(a1 + 16);
              v38 = v152;
            }
            LogPrintF((uint64_t)v136, (uint64_t)"OSStatus _VerifyClientM2(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *)", 0x5Au, (uint64_t)"### Pair-verify client M2 failed: get encrypted data, %#m\n", a5, a6, a7, a8, v38);
          }
          goto LABEL_57;
        }
        v39 = v151;
        if (v151 > 0xF)
        {
          v151 -= 16;
          v40 = &v36[-1].u8[v39];
          v152 = _chacha20_poly1305_decrypt_all(v147, "PV-Msg02", 8, 0, 0, v36, v151, v36, (uint64_t)v40, 16);
          if (v152)
            goto LABEL_57;
          *(_QWORD *)(a1 + 200) = TLV8GetUInt64(v37, v40, 25, 0, 0);
          v43 = *(_DWORD *)(a1 + 100);
          if ((v43 & 0x1000) != 0)
          {
            if ((v43 & 0x20200000) == 0)
            {
              v152 = _PairingSessionAppleIDVerifyPeer(a1, v37, v40);
              if (v152)
                goto LABEL_57;
            }
LABEL_149:
            v152 = _PairingSessionVerifyACL(a1, (uint64_t)cf);
            if (v152)
            {
              v89 = *(int **)(a1 + 16);
              v9 = (CFIndex *)v146;
              if (*v89 <= 50)
              {
                if (*v89 == -1)
                {
                  if (!_LogCategory_Initialize((uint64_t)v89, 0x32u))
                    goto LABEL_174;
                  v89 = *(int **)(a1 + 16);
                }
                LogPrintF((uint64_t)v89, (uint64_t)"OSStatus _VerifyClientM2(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *)", 0x32u, (uint64_t)"### Pair-verify client -- server lacks ACL: %@\n", v85, v86, v87, v88, *(_QWORD *)(a1 + 176));
              }
LABEL_174:
              v165[0] = 7;
              v152 = TLV8BufferAppend((uint64_t)&v155, 7, v165, 1uLL);
              if (!v152)
              {
                v165[0] = 3;
                v152 = TLV8BufferAppend((uint64_t)&v155, 6, v165, 1uLL);
                if (!v152)
                {
                  v152 = TLV8BufferDetach((uint64_t)&v155, v148, v146);
                  if (!v152)
                    _PairingSessionReset(a1);
                }
              }
              goto LABEL_216;
            }
            v90 = *(const void **)(a1 + 272);
            if (v90)
              CFRelease(v90);
            *(_QWORD *)(a1 + 272) = cf;
            cf = 0;
            v91 = (UInt8 *)TLV8CopyCoalesced(v37, v40, 29, (size_t *)&v150, 0);
            if (v91)
            {
              v92 = v91;
              v93 = (__CFString *)_OPACKDecodeBytes(0, v91, v150, 0, &v152);
              free(v92);
              if (!v93)
                goto LABEL_57;
              v94 = CFGetTypeID(v93);
              if (v94 != CFDictionaryGetTypeID())
              {
                v152 = -6756;
                CFRelease(v93);
                goto LABEL_57;
              }
              PairingSessionSetProperty(a1, CFSTR("appInfoPeer"), v93);
              CFRelease(v93);
            }
            *(_BYTE *)(a1 + 120) = 3;
            v153 = 0;
            v184 = 0u;
            v183 = 0u;
            v182 = 0u;
            v181 = 0u;
            v180 = 0u;
            v179 = 0u;
            v178 = 0u;
            v177 = 0u;
            v176 = 0u;
            v175 = 0u;
            v174 = 0u;
            v173 = 0u;
            v172 = 0u;
            v171 = 0u;
            v170 = 0u;
            v169 = 0u;
            v168 = 0u;
            v167 = 0u;
            v166 = 0u;
            memset(v164, 0, sizeof(v164));
            *(_OWORD *)&v165[8] = xmmword_18D51D4A0;
            *(_QWORD *)v165 = &v166;
            *(_QWORD *)&v165[24] = 0;
            *(_QWORD *)__s = v164;
            v162 = xmmword_18D51D4A0;
            v163 = 0;
            v95 = *(_DWORD *)(a1 + 100);
            if ((v95 & 0x1000) != 0)
            {
              if ((v95 & 0x100000) != 0)
                goto LABEL_185;
              v116 = _PairingSessionAppleIDProveSelf(a1, (uint64_t)__s);
              goto LABEL_184;
            }
            v96 = *(const void **)(a1 + 944);
            if (!v96)
            {
LABEL_164:
              v106 = *(void **)(a1 + 184);
              if (v106)
              {
                free(v106);
                *(_QWORD *)(a1 + 184) = 0;
              }
              *(_QWORD *)(a1 + 192) = 0;
              v153 = PairingSessionCopyIdentity(a1, 0, (char **)(a1 + 184), (_OWORD *)(a1 + 510), a1 + 542);
              if (v153)
                goto LABEL_219;
              v107 = strlen(*(const char **)(a1 + 184));
              *(_QWORD *)(a1 + 192) = v107;
              if (!v107)
              {
                v143 = -6708;
                goto LABEL_266;
              }
              v108 = v107 + 64;
              v109 = malloc_type_malloc(v107 + 64, 0xB4895B21uLL);
              if (!v109)
              {
LABEL_263:
                v143 = -6728;
LABEL_266:
                v153 = v143;
                goto LABEL_219;
              }
              v110 = v109;
              v111 = *(_OWORD *)(a1 + 462);
              *v109 = *(_OWORD *)(a1 + 446);
              v109[1] = v111;
              v112 = v109 + 2;
              memcpy(v109 + 2, *(const void **)(a1 + 184), *(_QWORD *)(a1 + 192));
              v113 = (_OWORD *)((char *)v112 + *(_QWORD *)(a1 + 192));
              v114 = *(_OWORD *)(a1 + 590);
              *v113 = *v33;
              v113[1] = v114;
              v115 = *(void (**)(_QWORD, void *, size_t, char *, _QWORD))(a1 + 928);
              if (v115)
              {
                v115(*(unsigned int *)(a1 + 100), v110, v108, v160, *(_QWORD *)(a1 + 936));
              }
              else
              {
                ccsha512_di();
                cced25519_sign();
              }
              free(v110);
              v153 = TLV8BufferAppend((uint64_t)__s, 1, *(char **)(a1 + 184), *(_QWORD *)(a1 + 192));
              a4 = v148;
              if (v153)
                goto LABEL_219;
              v116 = TLV8BufferAppend((uint64_t)__s, 10, v160, 0x40uLL);
LABEL_184:
              v153 = v116;
              if (v116)
                goto LABEL_219;
LABEL_185:
              v118 = *(const __CFDictionary **)(a1 + 344);
              TypeID = CFDictionaryGetTypeID();
              TypedValue = (const __CFString *)CFDictionaryGetTypedValue(v118, CFSTR("appInfoSelf"), TypeID, 0);
              if (TypedValue)
              {
                v121 = OPACKEncoderCreateDataMutable(TypedValue, 0, &v153);
                if (!v121)
                  goto LABEL_219;
                v122 = v121;
                BytePtr = (char *)CFDataGetBytePtr(v121);
                Length = CFDataGetLength(v122);
                v153 = TLV8BufferAppend((uint64_t)__s, 29, BytePtr, Length);
                CFRelease(v122);
                if (v153)
                  goto LABEL_219;
              }
              v153 = _AddGroupInfoTLV(a1, (uint64_t)__s);
              if (v153)
                goto LABEL_219;
              v125 = (int8x16_t *)malloc_type_malloc(v162 + 16, 0xA9F5A67AuLL);
              if (v125)
              {
                v126 = (char *)v125;
                _chacha20_poly1305_encrypt_all(v147, "PV-Msg03", 8, 0, 0, *(int8x16_t **)__s, v162, v125, (uint64_t)v125->i64 + v162);
                v127 = TLV8BufferAppend((uint64_t)v165, 5, v126, v162 + 16);
                v153 = v127;
                free(v126);
                if (!v127)
                {
                  v153 = TLV8BufferAppend((uint64_t)v165, 6, (char *)v15, 1uLL);
                  if (!v153)
                  {
                    v153 = TLV8BufferDetach((uint64_t)v165, a4, v146);
                    if (!v153)
                    {
                      *(_BYTE *)(a1 + 120) = 4;
                      v128 = *(int **)(a1 + 16);
                      v129 = *v128;
                      if (*v128 <= 30)
                      {
                        if (v129 != -1)
                        {
LABEL_195:
                          if (v129 > 10)
                            v130 = 1;
                          else
                            v130 = v129 == -1 && !_LogCategory_Initialize((uint64_t)v128, 0xAu);
                          LogPrintF((uint64_t)v128, (uint64_t)"OSStatus _VerifyClientM3(PairingSessionRef, uint8_t **, size_t *)", 0x1Eu, (uint64_t)"Pair-verify client M3 -- finish request\n%?{end}%1{tlv8}\n", a5, a6, a7, a8, v130);
                          goto LABEL_219;
                        }
                        if (_LogCategory_Initialize(*(_QWORD *)(a1 + 16), 0x1Eu))
                        {
                          v128 = *(int **)(a1 + 16);
                          v129 = *v128;
                          goto LABEL_195;
                        }
                      }
                    }
                  }
                }
LABEL_219:
                if (v163)
                {
                  free(v163);
                  v163 = 0;
                }
                if (*(_QWORD *)&v165[24])
                  free(*(void **)&v165[24]);
                v41 = 0;
                v133 = v153;
                goto LABEL_224;
              }
              goto LABEL_263;
            }
            v97 = _Block_copy(v96);
            v98 = *(_OWORD *)(a1 + 462);
            v159[0] = *(_OWORD *)(a1 + 446);
            v159[1] = v98;
            v99 = *(_OWORD *)(a1 + 590);
            v159[2] = *v33;
            v159[3] = v99;
            v100 = (*((uint64_t (**)(void *, _QWORD, _OWORD *, uint64_t, char *))v97 + 2))(v97, *(unsigned int *)(a1 + 100), v159, 64, v160);
            v153 = v100;
            if (!(_DWORD)v100)
            {
              v131 = TLV8BufferAppend((uint64_t)__s, 10, v160, 0x40uLL);
              v153 = v131;

              if (v131)
                goto LABEL_219;
              goto LABEL_185;
            }
            v105 = v100;
            if ((_DWORD)v100 == -6714)
            {

              goto LABEL_164;
            }
            v132 = *(int **)(a1 + 16);
            if (*v132 <= 90)
            {
              if (*v132 == -1)
              {
                if (!_LogCategory_Initialize((uint64_t)v132, 0x5Au))
                  goto LABEL_218;
                v132 = *(int **)(a1 + 16);
              }
              LogPrintF((uint64_t)v132, (uint64_t)"OSStatus _VerifyClientM3(PairingSessionRef, uint8_t **, size_t *)", 0x5Au, (uint64_t)"### Pair-verify client M3 sign failed: %#m\n", v101, v102, v103, v104, v105);
            }
LABEL_218:

            goto LABEL_219;
          }
          v44 = *(const void **)(a1 + 952);
          if (v44)
          {
            v45 = _Block_copy(v44);
            v152 = TLV8GetBytes(v37, v40, 10, 0x40uLL, 0x40uLL, __dst, 0, 0);
            if (v152)
            {

              goto LABEL_57;
            }
            v63 = *(_OWORD *)(a1 + 590);
            *(_OWORD *)v165 = *v33;
            *(_OWORD *)&v165[16] = v63;
            v64 = *(_OWORD *)(a1 + 462);
            v166 = *(_OWORD *)(a1 + 446);
            v167 = v64;
            v65 = (*((uint64_t (**)(void *, _QWORD, _BYTE *, uint64_t, char *))v45 + 2))(v45, *(unsigned int *)(a1 + 100), v165, 64, __dst);
            v152 = v65;
            if ((_DWORD)v65 != -6714)
            {
              if (!(_DWORD)v65)
              {

LABEL_148:
                a4 = v148;
                goto LABEL_149;
              }
              v117 = *(int **)(a1 + 16);
              v9 = (CFIndex *)v146;
              if (*v117 <= 90)
              {
                if (*v117 == -1)
                {
                  if (!_LogCategory_Initialize(*(_QWORD *)(a1 + 16), 0x5Au))
                    goto LABEL_215;
                  v117 = *(int **)(a1 + 16);
                  v65 = v152;
                }
                LogPrintF((uint64_t)v117, (uint64_t)"OSStatus _VerifyClientM2(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *)", 0x5Au, (uint64_t)"### Pair-verify client M2 verify signature failed: %#m\n", v66, v67, v68, v69, v65);
              }
LABEL_215:

LABEL_216:
              v41 = 0;
LABEL_59:
              if (cf)
                CFRelease(cf);
              if (v41)
                free(v41);
              if (v37)
                free(v37);
              a4 = v148;
              if (v157)
                free(v157);
              appended = v152;
              if (!v152)
              {
LABEL_68:
                v42 = 0;
                if (a4)
                {
LABEL_69:
                  if (v9)
                    _PairingSessionUpdateTranscript(a1, a2, a3, (UInt8 *)*a4, *v9);
                }
LABEL_71:
                appended = 0;
                *v8 = v42;
                return appended;
              }
              goto LABEL_98;
            }

          }
          v75 = *(void **)(a1 + 296);
          if (v75)
          {
            free(v75);
            *(_QWORD *)(a1 + 296) = 0;
          }
          v76 = (size_t *)(a1 + 304);
          *(_QWORD *)(a1 + 304) = 0;
          v77 = (char *)TLV8CopyCoalesced(v37, v40, 1, (size_t *)(a1 + 304), (int *)&v152);
          *(_QWORD *)(a1 + 296) = v77;
          v78 = v152;
          if (v152)
          {
            v137 = *(int **)(a1 + 16);
            if (*v137 <= 90)
            {
              if (*v137 == -1)
              {
                if (!_LogCategory_Initialize((uint64_t)v137, 0x5Au))
                  goto LABEL_57;
                v137 = *(int **)(a1 + 16);
                v78 = v152;
              }
              LogPrintF((uint64_t)v137, (uint64_t)"OSStatus _VerifyClientM2(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *)", 0x5Au, (uint64_t)"### Pair-verify client M2 failed: get identifier failed, %#m\n", a5, a6, a7, a8, v78);
            }
            goto LABEL_57;
          }
          if (*v76)
          {
            Peer = PairingSessionFindPeerEx(a1, v77, *v76, (_OWORD *)(a1 + 606), &cf, a6, a7, a8);
            v152 = Peer;
            if ((_DWORD)Peer)
            {
              v138 = Peer;
              v139 = *(int **)(a1 + 16);
              if (*v139 <= 90)
              {
                if (*v139 == -1)
                {
                  if (!_LogCategory_Initialize((uint64_t)v139, 0x5Au))
                    goto LABEL_57;
                  v139 = *(int **)(a1 + 16);
                  v138 = v152;
                }
                LogPrintF((uint64_t)v139, (uint64_t)"OSStatus _VerifyClientM2(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *)", 0x5Au, (uint64_t)"### Pair-verify client M2 failed: find peer failed, %#m\n", a5, a6, a7, a8, v138);
              }
            }
            else
            {
              v80 = TLV8GetBytes(v37, v40, 10, 0x40uLL, 0x40uLL, __dst, 0, 0);
              v152 = v80;
              if (!(_DWORD)v80)
              {
                v150 = *v76 + 64;
                v81 = (char *)malloc_type_malloc(v150, 0xC289936FuLL);
                v41 = v81;
                if (v81)
                {
                  v82 = *(_OWORD *)(a1 + 590);
                  *(_OWORD *)v81 = *v33;
                  *((_OWORD *)v81 + 1) = v82;
                  memcpy(v81 + 32, *(const void **)(a1 + 296), *(_QWORD *)(a1 + 304));
                  v83 = &v41[*(_QWORD *)(a1 + 304) + 32];
                  v84 = *(_OWORD *)(a1 + 462);
                  *(_OWORD *)v83 = *(_OWORD *)(a1 + 446);
                  *((_OWORD *)v83 + 1) = v84;
                  ccsha512_di();
                  v152 = cced25519_verify();
                  if (!v152)
                  {
                    free(v41);
                    goto LABEL_148;
                  }
                  v142 = -6754;
                }
                else
                {
                  v142 = -6728;
                }
                v152 = v142;
                goto LABEL_58;
              }
              v140 = v80;
              v141 = *(int **)(a1 + 16);
              if (*v141 <= 90)
              {
                if (*v141 == -1)
                {
                  if (!_LogCategory_Initialize((uint64_t)v141, 0x5Au))
                    goto LABEL_57;
                  v141 = *(int **)(a1 + 16);
                  v140 = v152;
                }
                LogPrintF((uint64_t)v141, (uint64_t)"OSStatus _VerifyClientM2(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *)", 0x5Au, (uint64_t)"### Pair-verify client M2 failed: get signature failed, %#m\n", a5, a6, a7, a8, v140);
              }
            }
LABEL_57:
            v41 = 0;
LABEL_58:
            v9 = (CFIndex *)v146;
            goto LABEL_59;
          }
        }
        v41 = 0;
        v133 = -6743;
      }
      else
      {
        v41 = 0;
        v37 = 0;
        v133 = -6742;
      }
LABEL_224:
      v152 = v133;
      goto LABEL_58;
    }
    v134 = Bytes;
    v135 = *(int **)(a1 + 16);
    if (*v135 <= 90)
    {
      if (*v135 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v135, 0x5Au))
          goto LABEL_244;
        v135 = *(int **)(a1 + 16);
        v134 = v152;
      }
      LogPrintF((uint64_t)v135, (uint64_t)"OSStatus _VerifyClientM2(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *)", 0x5Au, (uint64_t)"### Pair-verify client M2 failed: get PK, %#m\n", a5, a6, a7, a8, v134);
    }
LABEL_244:
    v41 = 0;
    v37 = 0;
    goto LABEL_58;
  }
  if ((_DWORD)v14 != 1)
  {
    v32 = *(int **)(a1 + 16);
    if (*v32 <= 60)
    {
      if (*v32 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v32, 0x3Cu))
          goto LABEL_46;
        v32 = *(int **)(a1 + 16);
        v14 = *(unsigned __int8 *)(a1 + 120);
      }
      LogPrintF((uint64_t)v32, (uint64_t)"OSStatus _VerifyClientExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x3Cu, (uint64_t)"### Pair-verify client bad state: %d\n", a5, a6, a7, a8, v14);
    }
LABEL_46:
    appended = 4294960587;
    goto LABEL_98;
  }
  v184 = 0u;
  v183 = 0u;
  v182 = 0u;
  v181 = 0u;
  v180 = 0u;
  v179 = 0u;
  v178 = 0u;
  v177 = 0u;
  v176 = 0u;
  v175 = 0u;
  v174 = 0u;
  v173 = 0u;
  v172 = 0u;
  v171 = 0u;
  v170 = 0u;
  v169 = 0u;
  v168 = 0u;
  v167 = 0u;
  v166 = 0u;
  *(_OWORD *)&v165[8] = xmmword_18D51D4A0;
  *(_QWORD *)v165 = &v166;
  *(_QWORD *)&v165[24] = 0;
  if (a3)
  {
LABEL_119:
    appended = 4294960591;
  }
  else
  {
    RandomBytes((void *)(a1 + 478), 0x20uLL);
    CryptoHKDF((uint64_t)kCryptoHashDescriptor_SHA512, a1 + 478, 32, "Pair-Verify-ECDH-Salt", 0x15uLL, (uint64_t)"Pair-Verify-ECDH-Info", 21, 0x20uLL, a1 + 478);
    cccurve25519_make_pub();
    if ((*(_BYTE *)(a1 + 100) & 1) == 0
      || (__s[0] = 7, appended = TLV8BufferAppend((uint64_t)v165, 0, __s, 1uLL), !(_DWORD)appended))
    {
      appended = TLV8BufferAppend((uint64_t)v165, 6, (char *)v15, 1uLL);
      if (!(_DWORD)appended)
      {
        appended = TLV8BufferAppend((uint64_t)v165, 3, (char *)(a1 + 446), 0x20uLL);
        if (!(_DWORD)appended)
        {
          v22 = *(_QWORD *)(a1 + 208);
          if (!v22 || (appended = TLV8BufferAppendUInt64((uint64_t)v165, 25, v22), !(_DWORD)appended))
          {
            appended = TLV8BufferDetach((uint64_t)v165, a4, (size_t *)v9);
            if (!(_DWORD)appended)
            {
              *(_BYTE *)(a1 + 120) = 2;
              v23 = *(int **)(a1 + 16);
              v24 = *v23;
              if (*v23 > 30)
                goto LABEL_227;
              if (v24 == -1)
              {
                if (!_LogCategory_Initialize(*(_QWORD *)(a1 + 16), 0x1Eu))
                  goto LABEL_227;
                v23 = *(int **)(a1 + 16);
                v24 = *v23;
              }
              if (v24 > 10)
                v25 = 1;
              else
                v25 = v24 == -1 && !_LogCategory_Initialize((uint64_t)v23, 0xAu);
              LogPrintF((uint64_t)v23, (uint64_t)"OSStatus _VerifyClientM1(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *)", 0x1Eu, (uint64_t)"Pair-verify client M1 -- start request\n%?{end}%1{tlv8}\n", a5, a6, a7, a8, v25);
LABEL_227:
              if (*(_QWORD *)&v165[24])
                free(*(void **)&v165[24]);
              goto LABEL_68;
            }
          }
        }
      }
    }
LABEL_96:
    if (*(_QWORD *)&v165[24])
      free(*(void **)&v165[24]);
  }
LABEL_98:
  *v8 = 0;
  v52 = *(int **)(a1 + 16);
  v53 = *v52;
  if (*v52 <= 50)
  {
    if (v53 == -1)
    {
      if (!_LogCategory_Initialize(*(_QWORD *)(a1 + 16), 0x32u))
        return appended;
      v52 = *(int **)(a1 + 16);
      v53 = *v52;
    }
    v54 = *v15;
    if (v53 == -1)
      _LogCategory_Initialize((uint64_t)v52, 0x28u);
    LogPrintF((uint64_t)v52, (uint64_t)"OSStatus _VerifyClientExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x32u, (uint64_t)"### Pair-verify client state %d failed: %#m\n%?{end}%1{tlv8}\n", a5, a6, a7, a8, v54);
  }
  return appended;
}

uint64_t _VerifyServerExchange(uint64_t a1, unsigned __int8 *a2, CFIndex a3, UInt8 **a4, size_t *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _BYTE *v8;
  int8x16_t *v11;
  unsigned __int8 *v12;
  unsigned __int8 *v13;
  _BYTE *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  _BYTE *v18;
  int *v19;
  int v20;
  uint64_t v21;
  int *v22;
  int v23;
  _BOOL4 v24;
  int *v25;
  BOOL v26;
  int v27;
  uint64_t Bytes;
  unsigned int v29;
  _OWORD *v30;
  int8x16_t v31;
  int v32;
  _OWORD *v33;
  const void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  size_t v46;
  size_t v47;
  _OWORD *v48;
  void *v49;
  __int128 v50;
  _OWORD *v51;
  _OWORD *v52;
  __int128 v53;
  void (*v54)(_QWORD, void *, size_t, __int128 *, _QWORD);
  int *v55;
  int v56;
  unsigned __int8 *v57;
  unsigned __int8 *v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  unsigned int v62;
  int *v63;
  unsigned __int8 *v64;
  int8x16_t *v65;
  size_t v66;
  unsigned __int8 *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int *v72;
  int v73;
  const void *v74;
  uint64_t (**v75)(void *, _QWORD, __int128 *, uint64_t, int8x16_t **);
  uint64_t v76;
  int *v77;
  int v78;
  uint64_t v79;
  unint64_t v80;
  size_t v81;
  UInt8 *v82;
  size_t v83;
  UInt8 *v84;
  unint64_t v85;
  const __CFDictionary *v86;
  CFTypeID TypeID;
  const __CFString *TypedValue;
  const __CFData *DataMutable;
  const __CFData *v90;
  char *BytePtr;
  size_t v92;
  int8x16_t *v93;
  int8x16_t *v94;
  int v95;
  int *v96;
  int v97;
  uint64_t v98;
  int v99;
  int *v100;
  unsigned int v101;
  char *p_dst;
  __int128 v103;
  __int128 v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  _BYTE *v111;
  void *v112;
  size_t *v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  int *v119;
  int *v120;
  _OWORD *v121;
  void *v122;
  __int128 v123;
  _OWORD *v124;
  _OWORD *v125;
  __int128 v126;
  int *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  int *v132;
  const void *v133;
  UInt8 *v134;
  UInt8 *v135;
  __CFString *v136;
  CFTypeID v137;
  char v138;
  uint64_t v139;
  int *v140;
  int v141;
  unsigned int v142;
  uint64_t v143;
  _BYTE *v144;
  CFTypeRef cf;
  size_t v149;
  unsigned int Peer;
  _OWORD v151[4];
  int8x16_t *__dst;
  __int128 v153;
  void *v154;
  _OWORD v155[19];
  __int128 __s;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  void *__src;
  __int128 v161;
  void *v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  uint64_t v182;

  v8 = (_BYTE *)a6;
  v182 = *MEMORY[0x1E0C80C00];
  v11 = (int8x16_t *)(a1 + 638);
  v12 = &a2[a3];
  v13 = a2;
  do
  {
    if (v13 == v12)
    {
LABEL_36:
      v144 = (_BYTE *)a6;
      v26 = 0;
      v27 = 0;
      Bytes = 4294960569;
      goto LABEL_108;
    }
    if (v13 >= v12)
    {
      v144 = (_BYTE *)a6;
      v26 = 0;
      v27 = 0;
      Bytes = 4294960591;
      goto LABEL_108;
    }
    if ((unint64_t)(v12 - v13) < 2)
      goto LABEL_36;
    v14 = v13 + 2;
    v15 = v13[1];
    if (&v13[v15 + 2] > v12)
    {
      v144 = (_BYTE *)a6;
      v26 = 0;
      v27 = 0;
      Bytes = 4294960546;
      goto LABEL_108;
    }
    v16 = *v13;
    v13 += v15 + 2;
  }
  while (v16 != 6);
  if ((_DWORD)v15 != 1)
  {
    v144 = (_BYTE *)a6;
    v26 = 0;
    v27 = 0;
    Bytes = 4294960553;
    goto LABEL_108;
  }
  if (*v14 == 1)
    _PairingSessionReset(a1);
  v18 = (_BYTE *)(a1 + 120);
  v17 = *(unsigned __int8 *)(a1 + 120);
  if (!*(_BYTE *)(a1 + 120))
  {
    v17 = 1;
    *v18 = 1;
  }
  if (*v14 != (_DWORD)v17)
  {
    v144 = v8;
    goto LABEL_33;
  }
  if ((_DWORD)v17 != 3)
  {
    v144 = v8;
    if ((_DWORD)v17 == 1)
    {
      v19 = *(int **)(a1 + 16);
      v20 = *v19;
      if (*v19 <= 30)
      {
        if (v20 != -1)
          goto LABEL_17;
        if (_LogCategory_Initialize(*(_QWORD *)(a1 + 16), 0x1Eu))
        {
          v19 = *(int **)(a1 + 16);
          v20 = *v19;
LABEL_17:
          if (v20 > 10)
            v21 = 1;
          else
            v21 = v20 == -1 && !_LogCategory_Initialize((uint64_t)v19, 0xAu);
          LogPrintF((uint64_t)v19, (uint64_t)"OSStatus _VerifyServerM1(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *)", 0x1Eu, (uint64_t)"Pair-verify server M1 -- start request\n%?{end}%1{tlv8}\n", (uint64_t)a5, a6, a7, a8, v21);
        }
      }
      LOBYTE(cf) = 0;
      if (TLV8GetBytes(a2, v12, 0, 1uLL, 1uLL, (char *)&cf, 0, 0))
      {
        LOBYTE(cf) = 2;
        goto LABEL_42;
      }
      v29 = cf;
      if (cf == 2)
      {
LABEL_42:
        *(_BYTE *)(a1 + 688) = 2;
        RandomBytes((void *)(a1 + 478), 0x20uLL);
        CryptoHKDF((uint64_t)kCryptoHashDescriptor_SHA512, a1 + 478, 32, "Pair-Verify-ECDH-Salt", 0x15uLL, (uint64_t)"Pair-Verify-ECDH-Info", 21, 0x20uLL, a1 + 478);
        cccurve25519_make_pub();
        v30 = (_OWORD *)(a1 + 574);
        Bytes = TLV8GetBytes(a2, v12, 3, 0x20uLL, 0x20uLL, (char *)(a1 + 574), 0, 0);
        if (!(_DWORD)Bytes)
        {
          cccurve25519();
          v31 = vorrq_s8(v11[1], *v11);
          if (vorr_s8(*(int8x8_t *)v31.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v31, v31, 8uLL)))
          {
            *(_QWORD *)(a1 + 200) = TLV8GetUInt64(a2, v12, 25, 0, 0);
            *(_BYTE *)(a1 + 120) = 2;
            LODWORD(v149) = 0;
            v181 = 0u;
            v180 = 0u;
            v179 = 0u;
            v178 = 0u;
            v177 = 0u;
            v176 = 0u;
            v175 = 0u;
            v174 = 0u;
            v173 = 0u;
            v172 = 0u;
            v171 = 0u;
            v170 = 0u;
            v169 = 0u;
            v168 = 0u;
            v167 = 0u;
            v166 = 0u;
            v165 = 0u;
            v164 = 0u;
            v163 = 0u;
            memset(v155, 0, sizeof(v155));
            v161 = xmmword_18D51D4A0;
            __src = &v163;
            v162 = 0;
            __dst = (int8x16_t *)v155;
            v153 = xmmword_18D51D4A0;
            v154 = 0;
            v32 = *(_DWORD *)(a1 + 100);
            v33 = (_OWORD *)(a1 + 446);
            if ((v32 & 0x1000) == 0)
            {
              v34 = *(const void **)(a1 + 944);
              if (!v34)
                goto LABEL_49;
              v35 = _Block_copy(v34);
              v36 = *(_OWORD *)(a1 + 462);
              v151[0] = *v33;
              v151[1] = v36;
              v37 = *(_OWORD *)(a1 + 590);
              v151[2] = *v30;
              v151[3] = v37;
              v38 = (*((uint64_t (**)(void *, _QWORD, _OWORD *, uint64_t, __int128 *))v35 + 2))(v35, *(unsigned int *)(a1 + 100), v151, 64, &__s);
              LODWORD(v149) = v38;
              if (!(_DWORD)v38)
              {
                v99 = TLV8BufferAppend((uint64_t)&__dst, 10, (char *)&__s, 0x40uLL);
                LODWORD(v149) = v99;

                v8 = v144;
                if (!v99)
                  goto LABEL_154;
                goto LABEL_186;
              }
              v43 = v38;
              if ((_DWORD)v38 == -6714)
              {

LABEL_49:
                v44 = *(void **)(a1 + 184);
                if (v44)
                {
                  free(v44);
                  *(_QWORD *)(a1 + 184) = 0;
                }
                *(_QWORD *)(a1 + 192) = 0;
                v45 = PairingSessionCopyIdentity(a1, 0, (char **)(a1 + 184), (_OWORD *)(a1 + 510), a1 + 542);
                LODWORD(v149) = v45;
                if ((_DWORD)v45)
                {
                  v139 = v45;
                  v140 = *(int **)(a1 + 16);
                  v8 = v144;
                  if (*v140 > 90)
                    goto LABEL_186;
                  if (*v140 == -1)
                  {
                    v8 = v144;
                    if (!_LogCategory_Initialize((uint64_t)v140, 0x5Au))
                      goto LABEL_186;
                    v140 = *(int **)(a1 + 16);
                  }
                  LogPrintF((uint64_t)v140, (uint64_t)"OSStatus _VerifyServerM2(PairingSessionRef, uint8_t **, size_t *)", 0x5Au, (uint64_t)"### Pair-verify server M2 failed: copy identity, %#m\n", (uint64_t)a5, a6, a7, a8, v139);
                  v8 = v144;
                  goto LABEL_186;
                }
                v46 = strlen(*(const char **)(a1 + 184));
                *(_QWORD *)(a1 + 192) = v46;
                if (v46)
                {
                  v47 = v46 + 64;
                  v48 = malloc_type_malloc(v46 + 64, 0xD1C2F03EuLL);
                  if (v48)
                  {
                    v49 = v48;
                    v50 = *(_OWORD *)(a1 + 462);
                    *v48 = *v33;
                    v48[1] = v50;
                    v51 = v48 + 2;
                    memcpy(v48 + 2, *(const void **)(a1 + 184), *(_QWORD *)(a1 + 192));
                    v52 = (_OWORD *)((char *)v51 + *(_QWORD *)(a1 + 192));
                    v53 = *(_OWORD *)(a1 + 590);
                    *v52 = *v30;
                    v52[1] = v53;
                    v54 = *(void (**)(_QWORD, void *, size_t, __int128 *, _QWORD))(a1 + 928);
                    if (v54)
                    {
                      v54(*(unsigned int *)(a1 + 100), v49, v47, &__s, *(_QWORD *)(a1 + 936));
                    }
                    else
                    {
                      ccsha512_di();
                      cced25519_sign();
                    }
                    v8 = v144;
                    free(v49);
                    LODWORD(v149) = TLV8BufferAppend((uint64_t)&__dst, 1, *(char **)(a1 + 184), *(_QWORD *)(a1 + 192));
                    if (!(_DWORD)v149)
                    {
                      v56 = TLV8BufferAppend((uint64_t)&__dst, 10, (char *)&__s, 0x40uLL);
LABEL_153:
                      LODWORD(v149) = v56;
                      if (!v56)
                        goto LABEL_154;
                    }
                    goto LABEL_186;
                  }
                  v141 = -6728;
                }
                else
                {
                  v141 = -6708;
                }
                LODWORD(v149) = v141;
                v8 = v144;
                goto LABEL_186;
              }
              v100 = *(int **)(a1 + 16);
              v8 = v144;
              if (*v100 <= 90)
              {
                if (*v100 != -1)
                  goto LABEL_173;
                if (_LogCategory_Initialize((uint64_t)v100, 0x5Au))
                {
                  v100 = *(int **)(a1 + 16);
LABEL_173:
                  LogPrintF((uint64_t)v100, (uint64_t)"OSStatus _VerifyServerM2(PairingSessionRef, uint8_t **, size_t *)", 0x5Au, (uint64_t)"### Pair-verify server M2 sign failed: %#m\n", v39, v40, v41, v42, v43);
                }
              }

              goto LABEL_186;
            }
            v8 = v144;
            if ((v32 & 0x20100000) == 0)
            {
              v56 = _PairingSessionAppleIDProveSelf(a1, (uint64_t)&__dst);
              goto LABEL_153;
            }
LABEL_154:
            v85 = *(_QWORD *)(a1 + 208);
            if (!v85 || (LODWORD(v149) = TLV8BufferAppendUInt64((uint64_t)&__dst, 25, v85), !(_DWORD)v149))
            {
              v86 = *(const __CFDictionary **)(a1 + 344);
              TypeID = CFDictionaryGetTypeID();
              TypedValue = (const __CFString *)CFDictionaryGetTypedValue(v86, CFSTR("appInfoSelf"), TypeID, 0);
              if (!TypedValue
                || (DataMutable = OPACKEncoderCreateDataMutable(TypedValue, 0, (int *)&v149)) != 0
                && (v90 = DataMutable,
                    BytePtr = (char *)CFDataGetBytePtr(DataMutable),
                    v92 = CFDataGetLength(v90),
                    LODWORD(v149) = TLV8BufferAppend((uint64_t)&__dst, 29, BytePtr, v92),
                    CFRelease(v90),
                    !(_DWORD)v149))
              {
                v93 = (int8x16_t *)malloc_type_malloc(v153 + 16, 0x45F01DABuLL);
                if (!v93)
                {
                  LODWORD(v149) = -6728;
                  goto LABEL_186;
                }
                v94 = v93;
                CryptoHKDF((uint64_t)kCryptoHashDescriptor_SHA512, (uint64_t)v11, 32, "Pair-Verify-Encrypt-Salt", 0x18uLL, (uint64_t)"Pair-Verify-Encrypt-Info", 24, 0x20uLL, a1 + 414);
                _chacha20_poly1305_encrypt_all((_DWORD *)(a1 + 414), "PV-Msg02", 8, 0, 0, __dst, v153, v94, (uint64_t)v94->i64 + v153);
                v95 = TLV8BufferAppend((uint64_t)&__src, 5, v94->i8, v153 + 16);
                LODWORD(v149) = v95;
                free(v94);
                if (!v95)
                {
                  *v18 = 2;
                  LODWORD(v149) = TLV8BufferAppend((uint64_t)&__src, 6, (char *)(a1 + 120), 1uLL);
                  if (!(_DWORD)v149)
                  {
                    LODWORD(v149) = TLV8BufferAppend((uint64_t)&__src, 3, (char *)(a1 + 446), 0x20uLL);
                    if (!(_DWORD)v149)
                    {
                      LODWORD(v149) = TLV8BufferDetach((uint64_t)&__src, a4, a5);
                      if (!(_DWORD)v149)
                      {
                        v96 = *(int **)(a1 + 16);
                        v97 = *v96;
                        if (*v96 <= 30)
                        {
                          if (v97 != -1)
                            goto LABEL_166;
                          if (_LogCategory_Initialize(*(_QWORD *)(a1 + 16), 0x1Eu))
                          {
                            v96 = *(int **)(a1 + 16);
                            v97 = *v96;
LABEL_166:
                            if (v97 > 10)
                              v98 = 1;
                            else
                              v98 = v97 == -1 && !_LogCategory_Initialize((uint64_t)v96, 0xAu);
                            LogPrintF((uint64_t)v96, (uint64_t)"OSStatus _VerifyServerM2(PairingSessionRef, uint8_t **, size_t *)", 0x1Eu, (uint64_t)"Pair-verify server M2 -- start response\n%?{end}%1{tlv8}\n", (uint64_t)a5, a6, a7, a8, v98);
                          }
                        }
                        *v18 = 3;
                      }
                    }
                  }
                }
              }
            }
LABEL_186:
            if (v154)
            {
              free(v154);
              v154 = 0;
            }
            if (v162)
              free(v162);
            Bytes = v149;
            if (!(_DWORD)v149)
            {
              v26 = 0;
              goto LABEL_192;
            }
            v26 = 0;
            v27 = 0;
LABEL_108:
            v77 = *(int **)(a1 + 16);
            v78 = *v77;
            if (*v77 <= 50)
            {
              if (v78 != -1)
                goto LABEL_110;
              if (_LogCategory_Initialize(*(_QWORD *)(a1 + 16), 0x32u))
              {
                v77 = *(int **)(a1 + 16);
                v78 = *v77;
LABEL_110:
                v79 = *(unsigned __int8 *)(a1 + 120);
                if (v78 == -1)
                  _LogCategory_Initialize((uint64_t)v77, 0x28u);
                LogPrintF((uint64_t)v77, (uint64_t)"OSStatus _VerifyServerExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x32u, (uint64_t)"### Pair-verify server state %d failed: %#m\n%?{end}%1{tlv8}\n", (uint64_t)a5, a6, a7, a8, v79);
                if (v27)
                  goto LABEL_149;
                goto LABEL_117;
              }
            }
            if (v27)
              goto LABEL_149;
LABEL_117:
            v181 = 0u;
            v180 = 0u;
            v179 = 0u;
            v178 = 0u;
            v177 = 0u;
            v176 = 0u;
            v175 = 0u;
            v174 = 0u;
            v173 = 0u;
            v172 = 0u;
            v171 = 0u;
            v170 = 0u;
            v169 = 0u;
            v168 = 0u;
            v167 = 0u;
            v166 = 0u;
            v165 = 0u;
            v164 = 0u;
            v163 = 0u;
            v161 = xmmword_18D51D4A0;
            __src = &v163;
            v162 = 0;
            if ((int)Bytes > -6761)
            {
              if ((int)Bytes > -6728)
              {
                if ((_DWORD)Bytes == -6727)
                {
                  v80 = 4;
                }
                else
                {
                  if ((_DWORD)Bytes != -6700)
                    goto LABEL_136;
                  v80 = 1;
                }
              }
              else if ((_DWORD)Bytes == -6760)
              {
                v80 = 3;
              }
              else
              {
                if ((_DWORD)Bytes != -6754)
                  goto LABEL_136;
                v80 = 2;
              }
            }
            else if ((int)Bytes > -6765)
            {
              if ((_DWORD)Bytes == -6764)
              {
                v80 = 6;
              }
              else
              {
                if ((_DWORD)Bytes != -6763)
                  goto LABEL_136;
                v80 = 5;
              }
            }
            else
            {
              if ((_DWORD)Bytes != -71144)
              {
                if ((_DWORD)Bytes == -6773)
                {
                  v80 = 7;
                  goto LABEL_139;
                }
LABEL_136:
                if ((_DWORD)Bytes == -6776)
                  v80 = 9;
                else
                  v80 = 1;
                goto LABEL_139;
              }
              v80 = 8;
            }
LABEL_139:
            Bytes = TLV8BufferAppendUInt64((uint64_t)&__src, 7, v80);
            if ((_DWORD)Bytes)
              goto LABEL_149;
            Bytes = TLV8BufferAppendUInt64((uint64_t)&__src, 6, *(unsigned __int8 *)(a1 + 120));
            if ((_DWORD)Bytes)
              goto LABEL_149;
            v81 = v161;
            v82 = (UInt8 *)v162;
            if (!v162)
            {
              if ((unint64_t)v161 <= 1)
                v83 = 1;
              else
                v83 = v161;
              v84 = (UInt8 *)malloc_type_malloc(v83, 0xF62D7A9CuLL);
              if (!v84)
              {
                Bytes = 4294960568;
                goto LABEL_149;
              }
              v82 = v84;
              if (v81)
                memcpy(v84, __src, v81);
            }
            __src = &v163;
            *(_QWORD *)&v161 = 0;
            v162 = 0;
            *a4 = v82;
            *a5 = v81;
            _PairingSessionReset(a1);
            Bytes = 0;
LABEL_149:
            v8 = v144;
            goto LABEL_195;
          }
          Bytes = 4294960554;
        }
LABEL_107:
        v26 = 0;
        v27 = 0;
        goto LABEL_108;
      }
      v55 = *(int **)(a1 + 16);
      if (*v55 <= 50)
      {
        if (*v55 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v55, 0x32u))
            goto LABEL_106;
          v55 = *(int **)(a1 + 16);
          v29 = cf;
        }
        LogPrintF((uint64_t)v55, (uint64_t)"OSStatus _VerifyServerM1(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *)", 0x32u, (uint64_t)"### Pair-verify server unsupported method: %u\n", (uint64_t)a5, a6, a7, a8, v29);
      }
LABEL_106:
      Bytes = 4294960561;
      goto LABEL_107;
    }
    v25 = *(int **)(a1 + 16);
    if (*v25 <= 60)
    {
      if (*v25 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v25, 0x3Cu))
          goto LABEL_33;
        v25 = *(int **)(a1 + 16);
        v17 = *(unsigned __int8 *)(a1 + 120);
      }
      LogPrintF((uint64_t)v25, (uint64_t)"OSStatus _VerifyServerExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x3Cu, (uint64_t)"### Pair-verify server bad state: %d\n", (uint64_t)a5, a6, a7, a8, v17);
    }
LABEL_33:
    v26 = 0;
    v27 = 0;
    Bytes = 4294960587;
    goto LABEL_108;
  }
  Peer = 0;
  v181 = 0u;
  v180 = 0u;
  v179 = 0u;
  v178 = 0u;
  v177 = 0u;
  v176 = 0u;
  v175 = 0u;
  v174 = 0u;
  v173 = 0u;
  v172 = 0u;
  v171 = 0u;
  v170 = 0u;
  v169 = 0u;
  v168 = 0u;
  v167 = 0u;
  v166 = 0u;
  v165 = 0u;
  v164 = 0u;
  v163 = 0u;
  *(_QWORD *)&v151[0] = 0;
  cf = 0;
  v149 = 0;
  v161 = xmmword_18D51D4A0;
  __src = &v163;
  v162 = 0;
  v22 = *(int **)(a1 + 16);
  v23 = *v22;
  if (*v22 <= 30)
  {
    if (v23 != -1)
    {
LABEL_22:
      if (v23 > 10)
        v24 = 0;
      else
        v24 = v23 != -1 || _LogCategory_Initialize((uint64_t)v22, 0xAu);
      LogPrintF((uint64_t)v22, (uint64_t)"OSStatus _VerifyServerM3(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *, Boolean *, Boolean *)", 0x1Eu, (uint64_t)"Pair-verify server M3 -- finish request\n%?{end}%1{tlv8}\n", (uint64_t)a5, a6, a7, a8, !v24);
      goto LABEL_63;
    }
    if (_LogCategory_Initialize(*(_QWORD *)(a1 + 16), 0x1Eu))
    {
      v22 = *(int **)(a1 + 16);
      v23 = *v22;
      goto LABEL_22;
    }
  }
LABEL_63:
  v57 = a2;
  do
  {
    if (v57 == v12)
    {
LABEL_174:
      v101 = -6727;
      goto LABEL_180;
    }
    if (v57 >= v12)
    {
      v101 = -6705;
      goto LABEL_180;
    }
    if ((unint64_t)(v12 - v57) < 2)
      goto LABEL_174;
    v58 = v57 + 2;
    v59 = v57[1];
    if (&v57[v59 + 2] > v12)
    {
      v101 = -6750;
LABEL_180:
      v27 = 0;
      Peer = v101;
      goto LABEL_82;
    }
    v60 = *v57;
    v57 += v59 + 2;
  }
  while (v60 != 7);
  *(_QWORD *)&v151[0] = v59;
  if ((_DWORD)v59 != 1)
  {
    v64 = 0;
    v26 = 0;
    Peer = -6743;
    goto LABEL_79;
  }
  v61 = *v58;
  if (v61 >= 9)
  {
    if ((_DWORD)v61 == 9)
      v62 = -6776;
    else
      v62 = -6700;
  }
  else
  {
    v62 = dword_18D51F670[v61];
  }
  Peer = v62;
  v63 = *(int **)(a1 + 16);
  if (*v63 > 50)
  {
    v64 = 0;
    v26 = 0;
LABEL_79:
    v27 = 1;
    goto LABEL_84;
  }
  if (*v63 != -1)
    goto LABEL_77;
  if (_LogCategory_Initialize((uint64_t)v63, 0x32u))
  {
    v63 = *(int **)(a1 + 16);
    v61 = *v58;
LABEL_77:
    LogPrintF((uint64_t)v63, (uint64_t)"OSStatus _VerifyServerM3(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *, Boolean *, Boolean *)", 0x32u, (uint64_t)"### Pair-verify server M3 bad status: 0x%X, %#m\n", (uint64_t)a5, a6, a7, a8, v61);
  }
  v27 = 1;
  if (Peer)
  {
    v64 = 0;
    goto LABEL_83;
  }
LABEL_82:
  v65 = (int8x16_t *)TLV8CopyCoalesced(a2, v12, 5, &v149, (int *)&Peer);
  v64 = (unsigned __int8 *)v65;
  if (!Peer)
  {
    v66 = v149;
    if (v149 <= 0xF)
    {
      v26 = 0;
      Peer = -6743;
      goto LABEL_84;
    }
    v149 -= 16;
    v67 = &v65[-1].u8[v66];
    Peer = _chacha20_poly1305_decrypt_all((_DWORD *)(a1 + 414), "PV-Msg03", 8, 0, 0, v65, v149, v65, (uint64_t)v67, 16);
    if (Peer)
    {
      v72 = *(int **)(a1 + 16);
      if (*v72 <= 50)
      {
        if (*v72 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v72, 0x32u))
            goto LABEL_176;
          v72 = *(int **)(a1 + 16);
        }
        LogPrintF((uint64_t)v72, (uint64_t)"OSStatus _VerifyServerM3(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *, Boolean *, Boolean *)", 0x32u, (uint64_t)"### Pair-verify server bad auth tag\n", v68, v69, v70, v71, v143);
      }
LABEL_176:
      LOBYTE(__dst) = 2;
      Peer = TLV8BufferAppend((uint64_t)&__src, 7, (char *)&__dst, 1uLL);
      if (Peer)
        goto LABEL_83;
      LOBYTE(__dst) = 4;
      p_dst = (char *)&__dst;
LABEL_236:
      Peer = TLV8BufferAppend((uint64_t)&__src, 6, p_dst, 1uLL);
      if (!Peer)
      {
        Peer = TLV8BufferDetach((uint64_t)&__src, a4, a5);
        if (!Peer)
          _PairingSessionReset(a1);
      }
      goto LABEL_83;
    }
    v73 = *(_DWORD *)(a1 + 100);
    if ((v73 & 0x1000) == 0)
    {
      v74 = *(const void **)(a1 + 952);
      if (v74)
      {
        v75 = (uint64_t (**)(void *, _QWORD, __int128 *, uint64_t, int8x16_t **))_Block_copy(v74);
        Peer = TLV8GetBytes(v64, v67, 10, 0x40uLL, 0x40uLL, (char *)&__dst, 0, 0);
        if (Peer)
          goto LABEL_100;
        v103 = *(_OWORD *)(a1 + 590);
        __s = *(_OWORD *)(a1 + 574);
        v157 = v103;
        v104 = *(_OWORD *)(a1 + 462);
        v158 = *(_OWORD *)(a1 + 446);
        v159 = v104;
        v105 = v75[2](v75, *(unsigned int *)(a1 + 100), &__s, 64, &__dst);
        Peer = v105;
        if ((_DWORD)v105 != -6714)
        {
          if ((_DWORD)v105)
          {
            v120 = *(int **)(a1 + 16);
            if (*v120 <= 90)
            {
              if (*v120 == -1)
              {
                if (!_LogCategory_Initialize(*(_QWORD *)(a1 + 16), 0x5Au))
                  goto LABEL_100;
                v120 = *(int **)(a1 + 16);
                v105 = Peer;
              }
              LogPrintF((uint64_t)v120, (uint64_t)"OSStatus _VerifyServerM3(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *, Boolean *, Boolean *)", 0x5Au, (uint64_t)"### Pair-verify server M3 verify signature failed: %#m\n", v106, v107, v108, v109, v105);
            }
LABEL_100:

            goto LABEL_83;
          }

          goto LABEL_213;
        }

      }
      v111 = v8;
      v112 = *(void **)(a1 + 296);
      if (v112)
      {
        free(v112);
        *(_QWORD *)(a1 + 296) = 0;
      }
      v113 = (size_t *)(a1 + 304);
      *(_QWORD *)(a1 + 304) = 0;
      v114 = (char *)TLV8CopyCoalesced(v64, v67, 1, (size_t *)(a1 + 304), (int *)&Peer);
      *(_QWORD *)(a1 + 296) = v114;
      if (Peer)
        goto LABEL_200;
      if (*v113)
      {
        Peer = PairingSessionFindPeerEx(a1, v114, *v113, (_OWORD *)(a1 + 606), &cf, a6, a7, a8);
        if (Peer)
        {
          v119 = *(int **)(a1 + 16);
          v8 = v111;
          if (*v119 <= 50)
          {
            if (*v119 == -1)
            {
              if (!_LogCategory_Initialize((uint64_t)v119, 0x32u))
                goto LABEL_231;
              v119 = *(int **)(a1 + 16);
            }
            LogPrintF((uint64_t)v119, (uint64_t)"OSStatus _VerifyServerM3(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *, Boolean *, Boolean *)", 0x32u, (uint64_t)"### Pair-verify server unknown peer: %.*s\n", v115, v116, v117, v118, *(_QWORD *)(a1 + 304));
          }
          goto LABEL_231;
        }
        Peer = TLV8GetBytes(v64, v67, 10, 0x40uLL, 0x40uLL, (char *)&__dst, 0, 0);
        if (Peer)
        {
LABEL_200:
          v26 = 0;
LABEL_201:
          v8 = v111;
          goto LABEL_84;
        }
        *(_QWORD *)&v151[0] = *v113 + 64;
        v121 = malloc_type_malloc(*(size_t *)&v151[0], 0xA0DDA688uLL);
        if (v121)
        {
          v122 = v121;
          v123 = *(_OWORD *)(a1 + 590);
          *v121 = *(_OWORD *)(a1 + 574);
          v121[1] = v123;
          v124 = v121 + 2;
          memcpy(v121 + 2, *(const void **)(a1 + 296), *(_QWORD *)(a1 + 304));
          v125 = (_OWORD *)((char *)v124 + *(_QWORD *)(a1 + 304));
          v126 = *(_OWORD *)(a1 + 462);
          *v125 = *(_OWORD *)(a1 + 446);
          v125[1] = v126;
          ccsha512_di();
          Peer = cced25519_verify();
          free(v122);
          v8 = v111;
          goto LABEL_213;
        }
        v26 = 0;
        v142 = -6728;
      }
      else
      {
        v26 = 0;
        v142 = -6743;
      }
      Peer = v142;
      goto LABEL_201;
    }
    if ((v73 & 0x200000) == 0)
    {
      v76 = _PairingSessionAppleIDVerifyPeer(a1, v64, v67);
      Peer = v76;
      goto LABEL_214;
    }
LABEL_213:
    v76 = Peer;
LABEL_214:
    if ((_DWORD)v76)
    {
      v127 = *(int **)(a1 + 16);
      if (*v127 <= 50)
      {
        if (*v127 == -1)
        {
          if (!_LogCategory_Initialize(*(_QWORD *)(a1 + 16), 0x32u))
            goto LABEL_231;
          v127 = *(int **)(a1 + 16);
          v76 = Peer;
        }
        LogPrintF((uint64_t)v127, (uint64_t)"OSStatus _VerifyServerM3(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *, Boolean *, Boolean *)", 0x32u, (uint64_t)"### Pair-verify server bad signature: %#m\n", v68, v69, v70, v71, v76);
      }
LABEL_231:
      v138 = 2;
LABEL_234:
      LOBYTE(__s) = v138;
      Peer = TLV8BufferAppend((uint64_t)&__src, 7, (char *)&__s, 1uLL);
      if (Peer)
        goto LABEL_83;
      LOBYTE(__s) = 4;
      p_dst = (char *)&__s;
      goto LABEL_236;
    }
    Peer = _PairingSessionVerifyACL(a1, (uint64_t)cf);
    if (!Peer)
    {
      v133 = *(const void **)(a1 + 272);
      if (v133)
        CFRelease(v133);
      *(_QWORD *)(a1 + 272) = cf;
      cf = 0;
      v134 = (UInt8 *)TLV8CopyCoalesced(v64, v67, 29, (size_t *)v151, 0);
      if (v134)
      {
        v135 = v134;
        v136 = (__CFString *)_OPACKDecodeBytes(0, v134, *(uint64_t *)&v151[0], 0, &Peer);
        free(v135);
        if (!v136)
          goto LABEL_83;
        v137 = CFGetTypeID(v136);
        if (v137 != CFDictionaryGetTypeID())
        {
          Peer = -6756;
          CFRelease(v136);
          goto LABEL_83;
        }
        PairingSessionSetProperty(a1, CFSTR("appInfoPeer"), v136);
        CFRelease(v136);
      }
      Peer = _ExtractGroupInfoTLV(a1, v64, v67);
      if (!Peer)
      {
        *(_BYTE *)(a1 + 120) = 4;
        Peer = _VerifyServerM4(a1, a4, a5);
        v26 = Peer == 0;
        goto LABEL_84;
      }
      goto LABEL_83;
    }
    v132 = *(int **)(a1 + 16);
    if (*v132 <= 50)
    {
      if (*v132 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v132, 0x32u))
          goto LABEL_233;
        v132 = *(int **)(a1 + 16);
      }
      LogPrintF((uint64_t)v132, (uint64_t)"OSStatus _VerifyServerM3(PairingSessionRef, const uint8_t *const, const uint8_t *const, uint8_t **, size_t *, Boolean *, Boolean *)", 0x32u, (uint64_t)"### Pair-verify server -- client lacks ACL: %@\n", v128, v129, v130, v131, *(_QWORD *)(a1 + 176));
    }
LABEL_233:
    v138 = 7;
    goto LABEL_234;
  }
LABEL_83:
  v26 = 0;
LABEL_84:
  if (cf)
    CFRelease(cf);
  if (v64)
    free(v64);
  if (v162)
    free(v162);
  Bytes = Peer;
  if (Peer)
  {
    v144 = v8;
    goto LABEL_108;
  }
LABEL_192:
  Bytes = 0;
  if (a4 && a5)
  {
    _PairingSessionUpdateTranscript(a1, a2, a3, *a4, *a5);
    Bytes = 0;
  }
LABEL_195:
  *v8 = v26;
  return Bytes;
}

uint64_t _ResumePairingClientExchange(uint64_t a1, unsigned __int8 *a2, uint64_t a3, _QWORD *a4, size_t *a5, char *a6, uint64_t a7, uint64_t a8)
{
  int v14;
  char *v15;
  unint64_t v16;
  unsigned __int8 *v17;
  unsigned __int8 *v18;
  uint64_t v19;
  int v20;
  _QWORD *v21;
  void *v22;
  int8x16_t *v23;
  int8x16_t *v24;
  __int128 v25;
  int *v26;
  int v27;
  uint64_t v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t UInt64;
  __int128 v36;
  int8x16_t *v37;
  size_t v38;
  unint64_t v39;
  int *v40;
  uint64_t v41;
  int *v42;
  int v43;
  uint64_t v44;
  _BOOL4 v45;
  uint64_t (*v47)(int8x16_t *, unint64_t, _QWORD);
  int *v48;
  int *v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  size_t v53;
  unsigned int Bytes;
  __int128 __dst;
  __int128 v56;
  uint64_t v57;
  _DWORD __s[8];
  char *v59;
  __int128 v60;
  void *v61;
  char v62[304];
  char v63[8];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v53 = 0;
  v59 = v62;
  v60 = xmmword_18D51D4A0;
  v61 = 0;
  v15 = (char *)(a1 + 120);
  v14 = *(unsigned __int8 *)(a1 + 120);
  if (!*(_BYTE *)(a1 + 120))
  {
    v14 = 1;
    *v15 = 1;
  }
  v16 = (unint64_t)&a2[a3];
  memset(v62, 0, sizeof(v62));
  if (a3)
  {
    v17 = a2;
    do
    {
      if (v17 == (unsigned __int8 *)v16)
        goto LABEL_42;
      if ((unint64_t)v17 >= v16)
        goto LABEL_69;
      if (v16 - (unint64_t)v17 < 2)
      {
LABEL_42:
        v30 = -6727;
        goto LABEL_71;
      }
      v18 = v17 + 2;
      v19 = v17[1];
      if ((unint64_t)&v17[v19 + 2] > v16)
      {
        v30 = -6750;
        goto LABEL_71;
      }
      v20 = *v17;
      v17 += v19 + 2;
    }
    while (v20 != 6);
    if ((_DWORD)v19 == 1)
    {
      if (*v18 == v14)
        goto LABEL_12;
      v30 = -6709;
    }
    else
    {
      v30 = -6743;
    }
    goto LABEL_71;
  }
LABEL_12:
  if (v14 == 2)
  {
    v26 = *(int **)(a1 + 16);
    v27 = *v26;
    if (*v26 <= 30)
    {
      if (v27 == -1)
      {
        if (!_LogCategory_Initialize(*(_QWORD *)(a1 + 16), 0x1Eu))
          goto LABEL_45;
        v26 = *(int **)(a1 + 16);
        v27 = *v26;
      }
      if (v27 > 10)
        v28 = 1;
      else
        v28 = v27 == -1 && !_LogCategory_Initialize((uint64_t)v26, 0xAu);
      LogPrintF((uint64_t)v26, (uint64_t)"OSStatus _ResumePairingClientExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x1Eu, (uint64_t)"Pair-resume client M2 -- resume response\n%?{end}%1{tlv8}\n", (uint64_t)a5, (uint64_t)a6, a7, a8, v28);
    }
LABEL_45:
    Bytes = TLV8GetBytes(a2, &a2[a3], 0, 1uLL, 1uLL, (char *)&__dst, 0, 0);
    if (!Bytes && __dst == 6)
    {
      UInt64 = TLV8GetUInt64(a2, &a2[a3], 14, (int *)&Bytes, 0);
      *(_QWORD *)(a1 + 376) = UInt64;
      if (Bytes)
        goto LABEL_57;
      v36 = *(_OWORD *)(a1 + 462);
      __dst = *(_OWORD *)(a1 + 446);
      v56 = v36;
      v57 = UInt64;
      CryptoHKDF((uint64_t)kCryptoHashDescriptor_SHA512, a1 + 638, 32, (char *)&__dst, 0x28uLL, (uint64_t)"Pair-Resume-Response-Info", 25, 0x20uLL, (uint64_t)__s);
      v37 = (int8x16_t *)TLV8CopyCoalesced(a2, &a2[a3], 5, &v53, (int *)&Bytes);
      v24 = v37;
      if (!Bytes)
      {
        v38 = v53;
        if (v53 <= 0xF)
        {
          v29 = 0;
          Bytes = -6743;
LABEL_35:
          *a6 = v29;
          if (v61)
          {
            free(v61);
            v61 = 0;
          }
          if (!v24)
            goto LABEL_59;
LABEL_38:
          free(v24);
          goto LABEL_59;
        }
        v39 = v53 - 16;
        v53 = v39;
        Bytes = _chacha20_poly1305_decrypt_all(__s, "PR-Msg02", 8, 0, 0, v37, v39, v37, (uint64_t)v37[-1].i64 + v38, 16);
        memset_s(__s, 0x20uLL, 0, 0x20uLL);
        if (!Bytes)
        {
          v47 = *(uint64_t (**)(int8x16_t *, unint64_t, _QWORD))(a1 + 88);
          if (!v47 || (Bytes = v47(v24, v39, *(_QWORD *)(a1 + 24))) == 0)
          {
            CryptoHKDF((uint64_t)kCryptoHashDescriptor_SHA512, a1 + 638, 32, (char *)&__dst, 0x28uLL, (uint64_t)"Pair-Resume-Shared-Secret-Info", 30, 0x20uLL, a1 + 638);
            _PairingSaveResumeState(a1, *(const void **)(a1 + 296), *(_QWORD *)(a1 + 304), *(const void **)(a1 + 248), *(_QWORD *)(a1 + 256), *(_QWORD *)(a1 + 376), (_OWORD *)(a1 + 638));
            *a4 = 0;
            *a5 = 0;
            *(_BYTE *)(a1 + 120) = 3;
            v48 = *(int **)(a1 + 16);
            if (*v48 <= 30)
            {
              if (*v48 == -1)
              {
                if (!_LogCategory_Initialize((uint64_t)v48, 0x1Eu))
                  goto LABEL_78;
                v48 = *(int **)(a1 + 16);
              }
              LogPrintF((uint64_t)v48, (uint64_t)"OSStatus _ResumePairingClientExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x1Eu, (uint64_t)"Pair-resume client done\n", (uint64_t)a5, (uint64_t)a6, a7, a8, v52);
            }
LABEL_78:
            v29 = 1;
            goto LABEL_34;
          }
        }
      }
      v29 = 0;
      goto LABEL_35;
    }
    v40 = *(int **)(a1 + 16);
    if (*v40 <= 50)
    {
      if (*v40 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v40, 0x32u))
          goto LABEL_56;
        v40 = *(int **)(a1 + 16);
      }
      LogPrintF((uint64_t)v40, (uint64_t)"OSStatus _ResumePairingClientExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x32u, (uint64_t)"Pair-resume client M2 for ID %llu failed %#m...doing pair-verify\n", v31, v32, v33, v34, *(_QWORD *)(a1 + 376));
    }
LABEL_56:
    *(_BYTE *)(a1 + 120) = 2;
    *(_DWORD *)(a1 + 96) = 3;
    Bytes = _VerifyClientExchange(a1, a2, a3, a4, (uint64_t)a5, (uint64_t)a6, v33, v34);
    goto LABEL_57;
  }
  if (v14 != 1)
  {
    v24 = 0;
    v29 = 0;
LABEL_34:
    Bytes = 0;
    goto LABEL_35;
  }
  if (a3)
  {
LABEL_69:
    v30 = -6705;
  }
  else if (*(_QWORD *)(a1 + 352))
  {
    v21 = (_QWORD *)(a1 + 296);
    v22 = *(void **)(a1 + 296);
    if (v22)
    {
      free(v22);
      *v21 = 0;
    }
    *(_QWORD *)(a1 + 304) = 0;
    if (_PairingFindResumeState(*(_QWORD *)(a1 + 376), (_QWORD *)(a1 + 296), (_QWORD *)(a1 + 304), (_OWORD *)(a1 + 638)))
    {
      v30 = -6767;
    }
    else
    {
      RandomBytes((void *)(a1 + 478), 0x20uLL);
      CryptoHKDF((uint64_t)kCryptoHashDescriptor_SHA512, a1 + 478, 32, "Pair-Verify-ECDH-Salt", 0x15uLL, (uint64_t)"Pair-Verify-ECDH-Info", 21, 0x20uLL, a1 + 478);
      cccurve25519_make_pub();
      v23 = (int8x16_t *)malloc_type_malloc(*(_QWORD *)(a1 + 360) + 16, 0xF319336AuLL);
      if (v23)
      {
        v24 = v23;
        v25 = *(_OWORD *)(a1 + 462);
        __dst = *(_OWORD *)(a1 + 446);
        v56 = v25;
        v57 = *(_QWORD *)(a1 + 376);
        CryptoHKDF((uint64_t)kCryptoHashDescriptor_SHA512, a1 + 638, 32, (char *)&__dst, 0x28uLL, (uint64_t)"Pair-Resume-Request-Info", 24, 0x20uLL, (uint64_t)__s);
        _chacha20_poly1305_encrypt_all(__s, "PR-Msg01", 8, 0, 0, *(int8x16_t **)(a1 + 352), *(_QWORD *)(a1 + 360), v24, (uint64_t)v24->i64 + *(_QWORD *)(a1 + 360));
        memset_s(__s, 0x20uLL, 0, 0x20uLL);
        Bytes = TLV8BufferAppend((uint64_t)&v59, 6, v15, 1uLL);
        if (Bytes
          || (v63[0] = 6, (Bytes = TLV8BufferAppend((uint64_t)&v59, 0, v63, 1uLL)) != 0)
          || (Bytes = TLV8BufferAppendUInt64((uint64_t)&v59, 14, *(_QWORD *)(a1 + 376))) != 0
          || (Bytes = TLV8BufferAppend((uint64_t)&v59, 5, v24->i8, *(_QWORD *)(a1 + 360) + 16)) != 0
          || (Bytes = TLV8BufferAppend((uint64_t)&v59, 3, (char *)(a1 + 446), 0x20uLL)) != 0
          || (Bytes = TLV8BufferDetach((uint64_t)&v59, a4, a5)) != 0)
        {
          *a6 = 0;
          if (v61)
          {
            free(v61);
            v61 = 0;
          }
          goto LABEL_38;
        }
        v49 = *(int **)(a1 + 16);
        v50 = *v49;
        if (*v49 > 30)
          goto LABEL_94;
        if (v50 == -1)
        {
          if (!_LogCategory_Initialize(*(_QWORD *)(a1 + 16), 0x1Eu))
          {
LABEL_94:
            v29 = 0;
            *v15 = 2;
            goto LABEL_34;
          }
          v49 = *(int **)(a1 + 16);
          v50 = *v49;
        }
        if (v50 > 10)
          v51 = 1;
        else
          v51 = v50 == -1 && !_LogCategory_Initialize((uint64_t)v49, 0xAu);
        LogPrintF((uint64_t)v49, (uint64_t)"OSStatus _ResumePairingClientExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x1Eu, (uint64_t)"Pair-resume client M1 -- resume request\n%?{end}%1{tlv8}\n", (uint64_t)a5, (uint64_t)a6, a7, a8, v51);
        goto LABEL_94;
      }
      v30 = -6728;
    }
  }
  else
  {
    v30 = -6745;
  }
LABEL_71:
  Bytes = v30;
LABEL_57:
  *a6 = 0;
  if (v61)
  {
    free(v61);
    v61 = 0;
  }
LABEL_59:
  v41 = Bytes;
  if (Bytes)
  {
    v42 = *(int **)(a1 + 16);
    v43 = *v42;
    if (*v42 <= 50)
    {
      if (v43 == -1)
      {
        v45 = _LogCategory_Initialize(*(_QWORD *)(a1 + 16), 0x32u);
        v41 = Bytes;
        if (!v45)
          return v41;
        v42 = *(int **)(a1 + 16);
        v43 = *v42;
      }
      v44 = *v15;
      if (v43 == -1)
        _LogCategory_Initialize((uint64_t)v42, 0x28u);
      LogPrintF((uint64_t)v42, (uint64_t)"OSStatus _ResumePairingClientExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x32u, (uint64_t)"### Pair-resume client state %d failed: %#m\n%?{end}%1{tlv8}\n", (uint64_t)a5, (uint64_t)a6, a7, a8, v44);
      return Bytes;
    }
  }
  return v41;
}

uint64_t _ResumePairingServerExchange(uint64_t a1, unsigned __int8 *a2, uint64_t a3, _QWORD *a4, size_t *a5, char *a6, uint64_t a7, uint64_t a8)
{
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  _BYTE *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  _BYTE *v20;
  int *v21;
  int *v22;
  int v23;
  _BOOL4 v24;
  int8x16_t *v25;
  char v26;
  unsigned int v27;
  uint64_t UInt64;
  uint64_t v29;
  int *v30;
  int v31;
  uint64_t v32;
  _BOOL4 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int *v38;
  __int128 v40;
  int8x16_t *v41;
  size_t v42;
  uint64_t (*v43)(_QWORD, _QWORD, int8x16_t *, size_t, void **, size_t *, _QWORD);
  size_t v44;
  int8x16_t *v45;
  int *v46;
  int v47;
  uint64_t v48;
  unsigned int v49;
  _BOOL4 v50;
  int v51;
  uint64_t v52;
  size_t __n;
  void *__src;
  size_t v55;
  unsigned int Bytes;
  _OWORD __dst[2];
  uint64_t v58;
  _DWORD __s[4];
  _OWORD *v60;
  __int128 v61;
  void *v62;
  _OWORD v63[19];
  char v64[8];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v14 = &a2[a3];
  memset(v63, 0, sizeof(v63));
  __n = 0;
  __src = 0;
  v60 = v63;
  v61 = xmmword_18D51D4A0;
  v15 = a2;
  v62 = 0;
  do
  {
    if (v15 == v14)
    {
LABEL_78:
      v27 = -6727;
      goto LABEL_81;
    }
    if (v15 >= v14)
    {
      v27 = -6705;
      goto LABEL_81;
    }
    if ((unint64_t)(v14 - v15) < 2)
      goto LABEL_78;
    v16 = v15 + 2;
    v17 = v15[1];
    if (&v15[v17 + 2] > v14)
    {
      v27 = -6750;
LABEL_81:
      v25 = 0;
      v26 = 0;
      goto LABEL_27;
    }
    v18 = *v15;
    v15 += v17 + 2;
  }
  while (v18 != 6);
  Bytes = 0;
  if ((_DWORD)v17 != 1)
  {
    v25 = 0;
    goto LABEL_85;
  }
  if (*v16 == 1)
    _PairingSessionReset(a1);
  v20 = (_BYTE *)(a1 + 120);
  v19 = *(unsigned __int8 *)(a1 + 120);
  if (*(_BYTE *)(a1 + 120))
  {
    if (*v16 != (_DWORD)v19)
      goto LABEL_26;
    if ((_DWORD)v19 != 1)
    {
      v21 = *(int **)(a1 + 16);
      if (*v21 <= 60)
      {
        if (*v21 != -1)
          goto LABEL_15;
        if (_LogCategory_Initialize((uint64_t)v21, 0x3Cu))
        {
          v21 = *(int **)(a1 + 16);
          v19 = *(unsigned __int8 *)(a1 + 120);
LABEL_15:
          LogPrintF((uint64_t)v21, (uint64_t)"OSStatus _ResumePairingServerExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x3Cu, (uint64_t)"### Pair-resume server bad state: %d\n", (uint64_t)a5, (uint64_t)a6, a7, a8, v19);
        }
      }
LABEL_26:
      v25 = 0;
      v26 = 0;
      v27 = -6709;
LABEL_27:
      Bytes = v27;
      goto LABEL_35;
    }
  }
  else
  {
    *v20 = 1;
    if (*v16 != 1)
      goto LABEL_26;
  }
  v22 = *(int **)(a1 + 16);
  v23 = *v22;
  if (*v22 <= 30)
  {
    if (v23 != -1)
    {
LABEL_19:
      if (v23 > 10)
        v24 = 0;
      else
        v24 = v23 != -1 || _LogCategory_Initialize((uint64_t)v22, 0xAu);
      LogPrintF((uint64_t)v22, (uint64_t)"OSStatus _ResumePairingServerExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x1Eu, (uint64_t)"Pair-resume server M1 -- resume request\n%?{end}%1{tlv8}\n", (uint64_t)a5, (uint64_t)a6, a7, a8, !v24);
      goto LABEL_30;
    }
    if (_LogCategory_Initialize(*(_QWORD *)(a1 + 16), 0x1Eu))
    {
      v22 = *(int **)(a1 + 16);
      v23 = *v22;
      goto LABEL_19;
    }
  }
LABEL_30:
  Bytes = TLV8GetBytes(a2, v14, 0, 1uLL, 1uLL, (char *)__dst, 0, 0);
  if (Bytes)
    goto LABEL_33;
  if (LOBYTE(__dst[0]) != 6)
  {
    v25 = 0;
    v26 = 0;
    v27 = -6707;
    goto LABEL_27;
  }
  UInt64 = TLV8GetUInt64(a2, v14, 14, (int *)&Bytes, 0);
  *(_QWORD *)(a1 + 376) = UInt64;
  if (Bytes)
    goto LABEL_33;
  if (*(_QWORD *)(a1 + 296))
  {
    free(*(void **)(a1 + 296));
    *(_QWORD *)(a1 + 296) = 0;
    UInt64 = *(_QWORD *)(a1 + 376);
  }
  *(_QWORD *)(a1 + 304) = 0;
  Bytes = _PairingFindResumeState(UInt64, (_QWORD *)(a1 + 296), (_QWORD *)(a1 + 304), (_OWORD *)(a1 + 638));
  if (Bytes)
  {
    v38 = *(int **)(a1 + 16);
    if (*v38 <= 50)
    {
      if (*v38 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v38, 0x32u))
          goto LABEL_83;
        v38 = *(int **)(a1 + 16);
      }
      LogPrintF((uint64_t)v38, (uint64_t)"OSStatus _ResumePairingServerExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x32u, (uint64_t)"Pair-resume server M1 for ID %llu failed %#m...doing pair-verify\n", v34, v35, v36, v37, *(_QWORD *)(a1 + 376));
    }
LABEL_83:
    *(_BYTE *)(a1 + 120) = 0;
    *(_DWORD *)(a1 + 96) = 3;
    v49 = _VerifyClientExchange(a1, a2, a3, a4, (uint64_t)a5, (uint64_t)a6, v36, v37);
    v25 = 0;
    v26 = 0;
    Bytes = v49;
    goto LABEL_35;
  }
  Bytes = TLV8GetBytes(a2, v14, 3, 0x20uLL, 0x20uLL, (char *)(a1 + 574), 0, 0);
  if (Bytes)
  {
LABEL_33:
    v25 = 0;
LABEL_34:
    v26 = 0;
    goto LABEL_35;
  }
  v55 = 0;
  v40 = *(_OWORD *)(a1 + 590);
  __dst[0] = *(_OWORD *)(a1 + 574);
  __dst[1] = v40;
  v58 = *(_QWORD *)(a1 + 376);
  CryptoHKDF((uint64_t)kCryptoHashDescriptor_SHA512, a1 + 638, 32, (char *)__dst, 0x28uLL, (uint64_t)"Pair-Resume-Request-Info", 24, 0x20uLL, (uint64_t)__s);
  v41 = (int8x16_t *)TLV8CopyCoalesced(a2, v14, 5, &v55, (int *)&Bytes);
  v25 = v41;
  if (Bytes)
    goto LABEL_34;
  if (v55 <= 0xF)
  {
LABEL_85:
    v26 = 0;
    v27 = -6743;
    goto LABEL_27;
  }
  v42 = v55 - 16;
  Bytes = _chacha20_poly1305_decrypt_all(__s, "PR-Msg01", 8, 0, 0, v41, v55 - 16, v41, (uint64_t)v41[-1].i64 + v55, 16);
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  if (Bytes)
    goto LABEL_34;
  _PairingRemoveResumeSessionID(*(_QWORD *)(a1 + 376));
  RandomBytes(&v58, 8uLL);
  Bytes = 0;
  CryptoHKDF((uint64_t)kCryptoHashDescriptor_SHA512, (uint64_t)&v58, 8, "Pair-Resume-SessionID-Salt", 0x1AuLL, (uint64_t)"Pair-Resume-SessionID-Info", 26, 8uLL, (uint64_t)&v58);
  *(_QWORD *)(a1 + 376) = v58;
  v43 = *(uint64_t (**)(_QWORD, _QWORD, int8x16_t *, size_t, void **, size_t *, _QWORD))(a1 + 80);
  if (v43)
  {
    Bytes = v43(*(_QWORD *)(a1 + 296), *(_QWORD *)(a1 + 304), v25, v42, &__src, &__n, *(_QWORD *)(a1 + 24));
    if (Bytes)
      goto LABEL_34;
  }
  if (v25)
    free(v25);
  *v20 = 2;
  v44 = __n + 16;
  v55 = __n + 16;
  v45 = (int8x16_t *)malloc_type_malloc(__n + 16, 0x65DB843EuLL);
  v25 = v45;
  if (!v45)
  {
    v26 = 0;
    v27 = -6728;
    goto LABEL_27;
  }
  if (__n)
    memcpy(v45, __src, __n);
  CryptoHKDF((uint64_t)kCryptoHashDescriptor_SHA512, a1 + 638, 32, (char *)__dst, 0x28uLL, (uint64_t)"Pair-Resume-Response-Info", 25, 0x20uLL, (uint64_t)__s);
  _chacha20_poly1305_encrypt_all(__s, "PR-Msg02", 8, 0, 0, (int8x16_t *)__src, __n, v25, (uint64_t)v25->i64 + __n);
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  CryptoHKDF((uint64_t)kCryptoHashDescriptor_SHA512, a1 + 638, 32, (char *)__dst, 0x28uLL, (uint64_t)"Pair-Resume-Shared-Secret-Info", 30, 0x20uLL, a1 + 638);
  _PairingSaveResumeState(a1, *(const void **)(a1 + 296), *(_QWORD *)(a1 + 304), *(const void **)(a1 + 248), *(_QWORD *)(a1 + 256), *(_QWORD *)(a1 + 376), (_OWORD *)(a1 + 638));
  Bytes = TLV8BufferAppend((uint64_t)&v60, 6, (char *)(a1 + 120), 1uLL);
  if (Bytes)
    goto LABEL_34;
  v64[0] = 6;
  Bytes = TLV8BufferAppend((uint64_t)&v60, 0, v64, 1uLL);
  if (Bytes)
    goto LABEL_34;
  Bytes = TLV8BufferAppendUInt64((uint64_t)&v60, 14, *(_QWORD *)(a1 + 376));
  if (Bytes)
    goto LABEL_34;
  Bytes = TLV8BufferAppend((uint64_t)&v60, 5, v25->i8, v44);
  if (Bytes)
    goto LABEL_34;
  Bytes = TLV8BufferDetach((uint64_t)&v60, a4, a5);
  if (Bytes)
    goto LABEL_34;
  v46 = *(int **)(a1 + 16);
  v47 = *v46;
  if (*v46 >= 31)
  {
    *v20 = 3;
    goto LABEL_100;
  }
  if (v47 == -1)
  {
    v50 = _LogCategory_Initialize(*(_QWORD *)(a1 + 16), 0x1Eu);
    v46 = *(int **)(a1 + 16);
    if (!v50)
      goto LABEL_96;
    v47 = *v46;
  }
  if (v47 > 10)
    v48 = 1;
  else
    v48 = v47 == -1 && !_LogCategory_Initialize((uint64_t)v46, 0xAu);
  LogPrintF((uint64_t)v46, (uint64_t)"OSStatus _ResumePairingServerExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x1Eu, (uint64_t)"Pair-resume server M2 -- resume response\n%?{end}%1{tlv8}\n", (uint64_t)a5, (uint64_t)a6, a7, a8, v48);
  v46 = *(int **)(a1 + 16);
LABEL_96:
  v51 = *v46;
  *v20 = 3;
  if (v51 <= 30)
  {
    if (v51 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v46, 0x1Eu))
        goto LABEL_100;
      v46 = *(int **)(a1 + 16);
    }
    LogPrintF((uint64_t)v46, (uint64_t)"OSStatus _ResumePairingServerExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x1Eu, (uint64_t)"Pair-resume server done\n", (uint64_t)a5, (uint64_t)a6, a7, a8, v52);
  }
LABEL_100:
  Bytes = 0;
  v26 = 1;
LABEL_35:
  *a6 = v26;
  if (v62)
  {
    free(v62);
    v62 = 0;
  }
  if (__src)
  {
    free(__src);
    __src = 0;
  }
  if (v25)
    free(v25);
  v29 = Bytes;
  if (Bytes)
  {
    v30 = *(int **)(a1 + 16);
    v31 = *v30;
    if (*v30 <= 50)
    {
      if (v31 == -1)
      {
        v33 = _LogCategory_Initialize(*(_QWORD *)(a1 + 16), 0x32u);
        v29 = Bytes;
        if (!v33)
          return v29;
        v30 = *(int **)(a1 + 16);
        v31 = *v30;
      }
      v32 = *(unsigned __int8 *)(a1 + 120);
      if (v31 == -1)
        _LogCategory_Initialize((uint64_t)v30, 0x28u);
      LogPrintF((uint64_t)v30, (uint64_t)"OSStatus _ResumePairingServerExchange(PairingSessionRef, const void *, size_t, uint8_t **, size_t *, Boolean *)", 0x32u, (uint64_t)"### Pair-resume server state %d failed: %#m\n%?{end}%1{tlv8}\n", (uint64_t)a5, (uint64_t)a6, a7, a8, v32);
      return Bytes;
    }
  }
  return v29;
}

uint64_t _PairingSessionSavePeerKeychain(uint64_t a1, char *a2, uint64_t a3, unsigned __int8 *a4, unsigned int a5)
{
  __CFDictionary *Mutable;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __CFDictionary *v15;
  const void **v16;
  __CFDictionary *v17;
  CFDataRef Data;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t i;
  char *v29;
  unsigned int v30;
  uint64_t v31;
  int *v33;
  void *v34[9];
  char v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v34[0] = 0;
  pthread_mutex_lock(&gPairingGlobalLock);
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!Mutable)
  {
    Data = 0;
    goto LABEL_22;
  }
  v15 = Mutable;
  v16 = (const void **)MEMORY[0x1E0C9AE50];
  if ((*(_BYTE *)(a1 + 808) & 4) != 0)
    CFDictionarySetValue(Mutable, CFSTR("homeKitRegistered"), (const void *)*MEMORY[0x1E0C9AE50]);
  if (a5)
  {
    CFDictionarySetInt64(v15, CFSTR("permissions"), a5);
    if ((a5 & 1) != 0)
    {
      v17 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      Data = v17;
      if (v17)
      {
        CFDictionarySetValue(v17, CFSTR("com.apple.admin"), *v16);
        CFDictionarySetValue(v15, CFSTR("acl"), Data);
        CFRelease(Data);
        goto LABEL_8;
      }
LABEL_22:
      v20 = 4294960568;
      goto LABEL_23;
    }
  }
LABEL_8:
  if (CFDictionaryGetCount(v15) < 1)
  {
    CFRelease(v15);
    Data = 0;
  }
  else
  {
    Data = CFPropertyListCreateData(0, v15, kCFPropertyListBinaryFormat_v1_0, 0, 0);
    CFRelease(v15);
    if (!Data)
    {
      v20 = 4294960596;
      goto LABEL_23;
    }
  }
  _PairingSessionDeletePeer(a1, a2, a3, v19, v11, v12, v13, v14);
  v34[0] = 0;
  ASPrintF(v34, (uint64_t)"%@: %.*s", v21, v22, v23, v24, v25, v26, *(_QWORD *)(a1 + 784));
  v27 = v34[0];
  if (!v34[0])
    goto LABEL_22;
  for (i = 0; i != 64; i += 2)
  {
    v29 = (char *)&v34[1] + i + 7;
    v30 = *a4++;
    *v29 = a0123456789abcd[(unint64_t)v30 >> 4];
    v29[1] = a0123456789abcd[v30 & 0xF];
  }
  v35 = 0;
  v31 = KeychainAddFormatted(0, (uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%i%kO=%s%kO=%O%kO=%.*s%kO=%O%kO=%O%kO=%D%kO=%O}", *MEMORY[0x1E0CD68F8], *MEMORY[0x1E0CD6B58], *MEMORY[0x1E0CD69B0], *(_QWORD *)(a1 + 784), *MEMORY[0x1E0CD70D8], *MEMORY[0x1E0CD6B80], *MEMORY[0x1E0CD6C98]);
  free(v27);
  if (!(_DWORD)v31)
  {
    v20 = 0;
    goto LABEL_17;
  }
  v20 = v31;
LABEL_23:
  v33 = *(int **)(a1 + 16);
  if (*v33 > 60)
    goto LABEL_17;
  if (*v33 != -1)
    goto LABEL_25;
  if (_LogCategory_Initialize((uint64_t)v33, 0x3Cu))
  {
    v33 = *(int **)(a1 + 16);
LABEL_25:
    LogPrintF((uint64_t)v33, (uint64_t)"OSStatus _PairingSessionSavePeerKeychain(PairingSessionRef, const void *, size_t, const uint8_t *, PairingPermissions)", 0x3Cu, (uint64_t)"### Save %@ %.*s failed: %#m\n", v11, v12, v13, v14, *(_QWORD *)(a1 + 784));
  }
LABEL_17:
  if (Data)
    CFRelease(Data);
  pthread_mutex_unlock(&gPairingGlobalLock);
  return v20;
}

void _PairingSessionDeletePeer(uint64_t a1, char *__s, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const void *v10;
  const __CFArray *v11;
  const __CFArray *v12;
  CFIndex Count;
  CFIndex v14;
  CFIndex v15;
  const void *v16;
  CFTypeID TypeID;
  const __CFDictionary *TypedValueAtIndex;
  const __CFDictionary *v19;
  char *v20;
  char *v21;
  int v22;
  CFTypeID v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  size_t v31;
  const void *v32;
  int v33;

  v31 = a3;
  if (a3 == -1)
    v31 = strlen(__s);
  v10 = (const void *)*MEMORY[0x1E0CD6BC8];
  v11 = (const __CFArray *)KeychainCopyMatchingFormatted(0, (uint64_t)"{%kO=%O%kO=%O%kO=%i%kO=%O%kO=%O%kO=%O%kO=%O}", a3, a4, a5, a6, a7, a8, *MEMORY[0x1E0CD6C98]);
  if (v11)
  {
    v12 = v11;
    v33 = 0;
    Count = CFArrayGetCount(v11);
    if (Count >= 1)
    {
      v14 = Count;
      v15 = 0;
      v32 = (const void *)*MEMORY[0x1E0CD68F8];
      v16 = (const void *)*MEMORY[0x1E0CD70E0];
      do
      {
        TypeID = CFDictionaryGetTypeID();
        TypedValueAtIndex = CFArrayGetTypedValueAtIndex(v12, v15, TypeID, 0);
        if (TypedValueAtIndex)
        {
          v19 = TypedValueAtIndex;
          if (*(_DWORD *)(a1 + 792) == CFDictionaryGetInt64(TypedValueAtIndex, v10, &v33))
          {
            if (!__s
              || (v20 = CFDictionaryCopyCString(v19, v32, &v33), !v33)
              && (v21 = v20, v22 = strnicmpx((unsigned __int8 *)__s, v31, v20), free(v21), !v22))
            {
              v23 = CFDataGetTypeID();
              CFDictionaryGetTypedValue(v19, v16, v23, &v33);
              if (!v33)
                v33 = KeychainDeleteFormatted((uint64_t)"{%kO=%O}", v24, v25, v26, v27, v28, v29, v30, (uint64_t)v16);
            }
          }
        }
        ++v15;
      }
      while (v14 != v15);
    }
    CFRelease(v12);
  }
}

__CFArray *_PairingSessionCopyPeers(int a1, char *__s, uint64_t a3, _DWORD *a4)
{
  const void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFArray *v11;
  CFIndex Count;
  CFIndex v13;
  CFIndex v14;
  const CFDictionaryKeyCallBacks *v15;
  const CFDictionaryValueCallBacks *v16;
  CFTypeID TypeID;
  const __CFArray *TypedValueAtIndex;
  const __CFDictionary *v19;
  CFMutableDictionaryRef v20;
  __CFDictionary *v21;
  CFTypeID v22;
  const __CFDictionary *TypedValue;
  const __CFData *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const __CFData *v31;
  const CFDictionaryKeyCallBacks *v32;
  const UInt8 *BytePtr;
  CFIndex Length;
  char *v35;
  CFTypeID v36;
  const __CFData *v37;
  CFPropertyListRef v38;
  const void *v39;
  CFTypeID v40;
  const void *Value;
  const void *v43;
  _DWORD *v44;
  uint64_t v45;
  __CFArray *Mutable;
  unint64_t v47;
  int v48;
  UInt8 bytes[32];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (a3 == -1)
    strlen(__s);
  v48 = 0;
  v47 = 0;
  pthread_mutex_lock(&gPairingGlobalLock);
  v5 = (const void *)*MEMORY[0x1E0CD68F8];
  v45 = *MEMORY[0x1E0CD6C98];
  v11 = (const __CFArray *)KeychainCopyMatchingFormatted(&v48, (uint64_t)"{%kO=%O%kO=%O%kO=%i%kO=%?.*s%kO=%O%kO=%O%kO=%O}", *MEMORY[0x1E0C9AE50], v6, v7, v8, v9, v10, *MEMORY[0x1E0CD6C98]);
  if (v48 == -25300)
  {
    v48 = 0;
  }
  else if (v48)
  {
    Mutable = 0;
    goto LABEL_29;
  }
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  if (!Mutable)
  {
    Mutable = 0;
    v48 = -6728;
    goto LABEL_29;
  }
  v44 = a4;
  if (!v11 || (Count = CFArrayGetCount(v11), Count < 1))
  {
LABEL_27:
    v48 = 0;
    goto LABEL_28;
  }
  v13 = Count;
  v14 = 0;
  v15 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
  v16 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  v43 = (const void *)*MEMORY[0x1E0CD69B0];
  while (1)
  {
    TypeID = CFDictionaryGetTypeID();
    TypedValueAtIndex = CFArrayGetTypedValueAtIndex(v11, v14, TypeID, &v48);
    if (v48)
      goto LABEL_26;
    v19 = TypedValueAtIndex;
    v20 = CFDictionaryCreateMutable(0, 0, v15, v16);
    if (!v20)
      break;
    v21 = v20;
    v22 = CFStringGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(v19, v5, v22, &v48);
    if (v48)
    {
      v24 = v21;
    }
    else
    {
      CFDictionarySetValue(v21, CFSTR("identifier"), TypedValue);
      v31 = (const __CFData *)KeychainCopyMatchingFormatted(&v48, (uint64_t)"{%kO=%O%kO=%O%kO=%i%kO=%O%kO=%O%kO=%O}", v25, v26, v27, v28, v29, v30, v45);
      v24 = v31;
      if (!v48)
      {
        v47 = 0;
        v32 = v15;
        BytePtr = CFDataGetBytePtr(v31);
        Length = CFDataGetLength(v24);
        v35 = (char *)BytePtr;
        v15 = v32;
        v48 = HexToData(v35, Length, 22, (uint64_t)bytes, 0x20uLL, &v47, 0, 0);
        if (!v48 && v47 == 32)
        {
          CFDictionarySetData(v21, CFSTR("pk"), bytes, 32);
          v36 = CFDataGetTypeID();
          v37 = CFDictionaryGetTypedValue(v19, v43, v36, 0);
          if (v37)
          {
            v38 = CFPropertyListCreateWithData(0, v37, 0, 0, 0);
            if (v38)
            {
              v39 = v38;
              v40 = CFGetTypeID(v38);
              if (v40 == CFDictionaryGetTypeID())
              {
                CFDictionarySetValue(v21, CFSTR("info"), v39);
                Value = CFDictionaryGetValue((CFDictionaryRef)v39, CFSTR("permissions"));
                if (Value)
                  CFDictionarySetValue(v21, CFSTR("permissions"), Value);
              }
              CFRelease(v39);
              v15 = v32;
            }
          }
          CFArrayAppendValue(Mutable, v21);
        }
      }
      CFRelease(v21);
      if (!v24)
        goto LABEL_26;
    }
    CFRelease(v24);
LABEL_26:
    if (v13 == ++v14)
      goto LABEL_27;
  }
  v48 = -6728;
  CFRelease(Mutable);
  Mutable = 0;
LABEL_28:
  a4 = v44;
LABEL_29:
  if (v11)
    CFRelease(v11);
  if (a4)
    *a4 = v48;
  pthread_mutex_unlock(&gPairingGlobalLock);
  return Mutable;
}

uint64_t _PairingFindResumeState(uint64_t a1, _QWORD *a2, _QWORD *a3, _OWORD *a4)
{
  uint64_t v8;
  uint64_t *v9;
  size_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;

  v8 = mach_absolute_time();
  pthread_mutex_lock(&gPairingGlobalLock);
  v9 = &gPairingResumeStateList;
  do
  {
    v9 = (uint64_t *)*v9;
    if (!v9)
    {
      v13 = 4294960569;
      goto LABEL_12;
    }
  }
  while (v9[10] != a1);
  if (v8 >= v9[5])
  {
    v13 = 4294960574;
  }
  else
  {
    if (!a2 || !a3)
      goto LABEL_10;
    v10 = v9[2];
    if (v10)
    {
      v11 = malloc_type_malloc(v10, 0xD34AE928uLL);
      if (v11)
      {
        v12 = v11;
        memcpy(v11, (const void *)v9[1], v9[2]);
        *a2 = v12;
        *a3 = v9[2];
LABEL_10:
        v13 = 0;
        v14 = *((_OWORD *)v9 + 4);
        *a4 = *((_OWORD *)v9 + 3);
        a4[1] = v14;
        goto LABEL_12;
      }
      v13 = 4294960568;
    }
    else
    {
      v13 = 4294960553;
    }
  }
LABEL_12:
  pthread_mutex_unlock(&gPairingGlobalLock);
  return v13;
}

uint64_t _PairingRemoveResumeSessionID(uint64_t a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;

  pthread_mutex_lock(&gPairingGlobalLock);
  v2 = gPairingResumeStateList;
  if (gPairingResumeStateList)
  {
    v3 = &gPairingResumeStateList;
    do
    {
      v4 = v3;
      v3 = (uint64_t *)v2;
      while (1)
      {
        v2 = *v3;
        if (v3[10] != a1)
          break;
        *v4 = v2;
        _PairingFreeResumeState(v3);
        v3 = (uint64_t *)*v4;
        if (!*v4)
          return pthread_mutex_unlock(&gPairingGlobalLock);
      }
    }
    while (v2);
  }
  return pthread_mutex_unlock(&gPairingGlobalLock);
}

void _PairingSaveResumeState(uint64_t a1, const void *a2, size_t a3, const void *a4, size_t a5, uint64_t a6, _OWORD *a7)
{
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t *v19;
  uint64_t *v20;
  _QWORD *v21;
  void *v22;
  size_t v23;
  void *v24;
  __int128 v25;
  uint64_t *v26;
  uint64_t *v27;

  pthread_mutex_lock(&gPairingGlobalLock);
  v14 = gPairingResumeStateList;
  if (gPairingResumeStateList)
  {
    v15 = &gPairingResumeStateList;
    do
    {
      v16 = v15;
      v15 = (uint64_t *)v14;
      while (v15[2] == a3
           && !memcmp(a2, (const void *)v15[1], a3)
           && ((*(_BYTE *)(a1 + 102) & 0x80) == 0 || v15[4] == a5 && !memcmp(a4, (const void *)v15[3], a5)))
      {
        *v16 = *v15;
        _PairingFreeResumeState(v15);
        v15 = (uint64_t *)*v16;
        if (!*v16)
          goto LABEL_12;
      }
      v14 = *v15;
    }
    while (*v15);
LABEL_12:
    v17 = gPairingResumeStateList;
    if (gPairingResumeStateList)
    {
      v18 = 0;
      v19 = &gPairingResumeStateList;
      do
      {
        v20 = v19;
        ++v18;
        v19 = (uint64_t *)v17;
        while (1)
        {
          v17 = *v19;
          if (v18 <= gPairingMaxResumeSessions)
            break;
          *v20 = v17;
          _PairingFreeResumeState(v19);
          v19 = (uint64_t *)*v20;
          ++v18;
          if (!*v20)
            goto LABEL_19;
        }
      }
      while (v17);
    }
  }
LABEL_19:
  v21 = malloc_type_calloc(1uLL, 0x58uLL, 0x10300402A0090E4uLL);
  if (v21)
  {
    if (a3)
    {
      v22 = malloc_type_malloc(a3, 0x473C116AuLL);
      v21[1] = v22;
      if (v22)
      {
        memcpy(v22, a2, a3);
        v21[2] = a3;
        v23 = a5 <= 1 ? 1 : a5;
        v24 = malloc_type_malloc(v23, 0x4A04FBE7uLL);
        v21[3] = v24;
        if (v24)
        {
          if (a5)
            memcpy(v24, a4, a5);
          v21[4] = a5;
          v25 = a7[1];
          *((_OWORD *)v21 + 3) = *a7;
          *((_OWORD *)v21 + 4) = v25;
          v21[10] = a6;
          v21[5] = *(_QWORD *)(a1 + 368) + mach_absolute_time();
          v26 = &gPairingResumeStateList;
          do
          {
            v27 = v26;
            v26 = (uint64_t *)*v26;
          }
          while (v26);
          *v21 = 0;
          *v27 = (uint64_t)v21;
          v21 = 0;
        }
      }
    }
  }
  pthread_mutex_unlock(&gPairingGlobalLock);
  _PairingFreeResumeState(v21);
}

void _PairingFreeResumeState(_QWORD *a1)
{
  void *v2;
  void *v3;

  if (a1)
  {
    v2 = (void *)a1[1];
    if (v2)
    {
      free(v2);
      a1[1] = 0;
    }
    a1[2] = 0;
    v3 = (void *)a1[3];
    if (v3)
      free(v3);
    free(a1);
  }
}

uint64_t _PairingSessionAppleIDProveSelf(uint64_t a1, uint64_t a2)
{
  CUAppleIDClient *v4;
  CUAppleIDClient *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int *v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int *v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int *v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int *v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;

  v4 = (CUAppleIDClient *)*(id *)(a1 + 840);
  if (!v4)
  {
    v5 = objc_alloc_init(CUAppleIDClient);
    v4 = v5;
    *(_QWORD *)(a1 + 840) = v5;
    if (*(_QWORD *)(a1 + 816))
      -[CUAppleIDClient setMyAppleID:](v5, "setMyAppleID:");
  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  objc_msgSend(v6, "appendBytes:length:", a1 + 446, 32);
  objc_msgSend(v6, "appendBytes:length:", a1 + 574, 32);
  v54 = 0;
  -[CUAppleIDClient signData:error:](v4, "signData:error:", v6, &v54);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v54;
  v9 = v8;
  if (!v7)
  {
    v20 = NSErrorToOSStatusEx(v8, 0);
    if (v20)
      v12 = v20;
    else
      v12 = 4294960580;
    v25 = *(int **)(a1 + 16);
    if (*v25 > 60)
      goto LABEL_7;
    if (*v25 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v25, 0x3Cu))
        goto LABEL_7;
      v25 = *(int **)(a1 + 16);
    }
    LogPrintF((uint64_t)v25, (uint64_t)"OSStatus _PairingSessionAppleIDProveSelf(PairingSessionRef, TLV8Buffer *)", 0x3Cu, (uint64_t)"### AppleID sign data failed: %{error}\n", v21, v22, v23, v24, (uint64_t)v9);
    goto LABEL_7;
  }
  v10 = objc_retainAutorelease(v7);
  v11 = TLV8BufferAppend(a2, 10, (char *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"));
  if ((_DWORD)v11)
  {
    v12 = v11;
    goto LABEL_7;
  }
  v53 = v9;
  v14 = -[CUAppleIDClient copyMyCertificateDataAndReturnError:](v4, "copyMyCertificateDataAndReturnError:", &v53);
  v15 = v53;

  if (!v14)
  {
    v26 = NSErrorToOSStatusEx(v15, 0);
    if (v26)
      v12 = v26;
    else
      v12 = 4294960596;
    v31 = *(int **)(a1 + 16);
    if (*v31 > 60)
      goto LABEL_50;
    if (*v31 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v31, 0x3Cu))
        goto LABEL_50;
      v31 = *(int **)(a1 + 16);
    }
    LogPrintF((uint64_t)v31, (uint64_t)"OSStatus _PairingSessionAppleIDProveSelf(PairingSessionRef, TLV8Buffer *)", 0x3Cu, (uint64_t)"### AppleID get my certificate failed: %{error}\n", v27, v28, v29, v30, (uint64_t)v15);
LABEL_50:
    v13 = 0;
    v9 = v15;
    goto LABEL_15;
  }
  v52 = v15;
  NSDataCompress(v14, 3, &v52);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v52;

  if (!v13)
  {
    v32 = NSErrorToOSStatusEx(v9, 0);
    if (v32)
      v12 = v32;
    else
      v12 = 4294960596;
    v37 = *(int **)(a1 + 16);
    if (*v37 > 60)
      goto LABEL_15;
    if (*v37 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v37, 0x3Cu))
        goto LABEL_7;
      v37 = *(int **)(a1 + 16);
    }
    LogPrintF((uint64_t)v37, (uint64_t)"OSStatus _PairingSessionAppleIDProveSelf(PairingSessionRef, TLV8Buffer *)", 0x3Cu, (uint64_t)"### Compress AppleID my certificate failed: %{error}\n", v33, v34, v35, v36, (uint64_t)v9);
LABEL_7:
    v13 = 0;
    goto LABEL_15;
  }
  v13 = objc_retainAutorelease(v13);
  v16 = TLV8BufferAppend(a2, 9, (char *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));
  if ((_DWORD)v16)
  {
LABEL_14:
    v12 = v16;
    goto LABEL_15;
  }
  v51 = v9;
  v17 = -[CUAppleIDClient copyMyValidationDataAndReturnError:](v4, "copyMyValidationDataAndReturnError:", &v51);
  v18 = v51;

  if (!v17)
  {
    v9 = v18;
    v38 = NSErrorToOSStatusEx(v18, 0);
    if (v38)
      v12 = v38;
    else
      v12 = 4294960596;
    v43 = *(int **)(a1 + 16);
    if (*v43 > 60)
      goto LABEL_7;
    if (*v43 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v43, 0x3Cu))
        goto LABEL_7;
      v43 = *(int **)(a1 + 16);
    }
    LogPrintF((uint64_t)v43, (uint64_t)"OSStatus _PairingSessionAppleIDProveSelf(PairingSessionRef, TLV8Buffer *)", 0x3Cu, (uint64_t)"### AppleID get my validatidation data failed: %{error}\n", v39, v40, v41, v42, (uint64_t)v18);
    goto LABEL_7;
  }
  v50 = v18;
  NSDataCompress(v17, 3, &v50);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v50;

  if (v13)
  {
    v13 = objc_retainAutorelease(v13);
    v16 = TLV8BufferAppend(a2, 20, (char *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));
    goto LABEL_14;
  }
  v44 = NSErrorToOSStatusEx(v9, 0);
  if (v44)
    v12 = v44;
  else
    v12 = 4294960596;
  v49 = *(int **)(a1 + 16);
  if (*v49 <= 60)
  {
    if (*v49 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v49, 0x3Cu))
        goto LABEL_7;
      v49 = *(int **)(a1 + 16);
    }
    LogPrintF((uint64_t)v49, (uint64_t)"OSStatus _PairingSessionAppleIDProveSelf(PairingSessionRef, TLV8Buffer *)", 0x3Cu, (uint64_t)"### Compress AppleID my validatidation data failed: %{error}\n", v45, v46, v47, v48, (uint64_t)v9);
    goto LABEL_7;
  }
LABEL_15:

  return v12;
}

uint64_t PairingSessionCopyIdentity(uint64_t a1, uint64_t a2, char **a3, _OWORD *a4, uint64_t a5)
{
  uint64_t v6;
  char **v7;
  int v8;
  uint64_t (*v10)(uint64_t, char **, _OWORD *, uint64_t, _QWORD);
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const __CFDictionary *v26;
  char *v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  size_t v34;
  int v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  __int128 v60;
  __int128 v61;
  int *v62;
  int *v63;
  uint64_t v64;
  int v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int *v71;
  _BOOL4 v72;
  int v73;
  _OWORD *v74;
  char **v75;
  const void *v76;
  const void *v77;
  uint64_t v78;
  void *v79;
  char __s[132];
  _OWORD v81[2];
  _OWORD v82[2];
  char __str[8];
  _BYTE bytes[6];
  char v85;
  unsigned __int8 v86;
  char v87;
  unsigned __int8 v88;
  unsigned __int8 v89;
  unsigned __int8 v90;
  unsigned __int8 v91;
  unsigned __int8 v92;
  unsigned __int8 v93;
  unsigned __int8 v94;
  uint64_t v95;

  v6 = (uint64_t)a4;
  v7 = a3;
  v8 = a2;
  v95 = *MEMORY[0x1E0C80C00];
  v10 = *(uint64_t (**)(uint64_t, char **, _OWORD *, uint64_t, _QWORD))(a1 + 56);
  if (v10)
    return v10(a2, a3, a4, a5, *(_QWORD *)(a1 + 24));
  v12 = *(unsigned int *)(a1 + 100);
  if ((v12 & 4) != 0)
  {
    v66 = (_DWORD)a2 != 0;
    if (a5)
      v66 |= 2uLL;
    v67 = v66 | (v12 >> 19) & 8;
    v68 = v12 >> 21;
    v69 = v67 | (v12 >> 21) & 0x10;
    if ((v12 & 0x80000000) == 0)
      v70 = v69;
    else
      v70 = v69 | 0x100;
    return _PairingSessionCopyIdentityPairingManager(a1, v70 | v68 & 0x20, a3, 0, a4, (_OWORD *)a5);
  }
  pthread_mutex_lock(&gPairingGlobalLock);
  v78 = *MEMORY[0x1E0CD6C98];
  v72 = (v6 | a5) != 0;
  v77 = (const void *)*MEMORY[0x1E0CD68F8];
  v19 = 1;
  v76 = (const void *)*MEMORY[0x1E0CD70D8];
  v74 = (_OWORD *)v6;
  v75 = v7;
  v73 = v8;
  do
  {
    if (v19 != 1)
      usleep(0x4E20u);
    LODWORD(v81[0]) = 0;
    *(_QWORD *)__str = 0;
    *(_QWORD *)&v82[0] = 0;
    v26 = (const __CFDictionary *)KeychainCopyMatchingFormatted(v81, (uint64_t)"{%kO=%O%kO=%O%kO=%i%kO=%O%kO=%O%kO=%O}", v13, v14, v15, v16, v17, v18, v78);
    if (!v26)
    {
      if (*(_DWORD *)(a1 + 768) == 1751216195)
        v26 = (const __CFDictionary *)KeychainCopyMatchingFormatted(v81, (uint64_t)"{%kO=%O%kO=%O%kO=%i%kO=%O%kO=%O%kO=%O}", v20, v21, v22, v23, v24, v25, v78);
      else
        v26 = 0;
    }
    if (!LODWORD(v81[0]))
    {
      if (v7)
      {
        v27 = CFDictionaryCopyCString(v26, v77, v81);
        if (LODWORD(v81[0]))
          goto LABEL_17;
        *v7 = v27;
      }
      if (v72)
      {
        *(_QWORD *)__str = 0;
        CFDictionaryGetData(v26, v76, __s, 0x84uLL, __str, (int *)v81);
        *(_QWORD *)&v82[0] = __s;
        v28 = *(_QWORD *)__str;
        LODWORD(v81[0]) = HexToData(__s, *(int64_t *)__str, 22, v6, 0x20uLL, (unint64_t *)__str, 0, (char **)v82);
        if (!LODWORD(v81[0]))
        {
          if (*(_QWORD *)__str != 32)
            goto LABEL_52;
          if (!a5)
            goto LABEL_17;
          v64 = *(_QWORD *)&v82[0];
          if (*(_QWORD *)&v82[0] >= (unint64_t)&__s[v28] || **(_BYTE **)&v82[0] != 43)
          {
            v65 = -6742;
            goto LABEL_59;
          }
          ++*(_QWORD *)&v82[0];
          LODWORD(v81[0]) = HexToData(*(char **)&v82[0], (int64_t)&__s[v28 - 1 - v64], 22, a5, 0x20uLL, (unint64_t *)__str, 0, 0);
          if (!LODWORD(v81[0]) && *(_QWORD *)__str != 32)
          {
LABEL_52:
            v65 = -6743;
LABEL_59:
            LODWORD(v81[0]) = v65;
          }
        }
      }
    }
LABEL_17:
    if (v26)
      CFRelease(v26);
    memset_s(__s, 0x84uLL, 0, 0x84uLL);
    v32 = LODWORD(v81[0]);
    if (LODWORD(v81[0]) == -25293)
      break;
    if (!LODWORD(v81[0]) || !v8)
      goto LABEL_70;
    _PairingSessionDeleteIdentity(a1, v29, v30, v31, v15, v16, v17, v18);
    v33 = *(char **)(a1 + 248);
    if (!v33 || (v34 = *(_QWORD *)(a1 + 256)) == 0)
    {
      RandomBytes(bytes, 0x10uLL);
      v35 = v85 & 0xF | 0x40;
      v85 = v85 & 0xF | 0x40;
      v36 = v87 & 0x3F | 0x80;
      v87 = v87 & 0x3F | 0x80;
      v33 = __str;
      snprintf(__str, 0x25uLL, "%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x", bytes[0], bytes[1], bytes[2], bytes[3], bytes[4], bytes[5], v35, v86, v36, v88, v89, v90, v91, v92, v93, v94);
      v34 = strlen(__str);
    }
    cced25519_make_key_pair_compat();
    SNPrintF((uint64_t)__s, 132, (uint64_t)"%.3H+%.3H", v37, v38, v39, v40, v41, (uint64_t)v82);
    v79 = 0;
    ASPrintF(&v79, (uint64_t)"%@: %.*s", v42, v43, v44, v45, v46, v47, *(_QWORD *)(a1 + 760));
    v48 = v79;
    if (v79)
    {
      strlen(__s);
      v32 = KeychainAddFormatted(0, (uint64_t)"{%kO=%O%kO=%O%kO=%O%kO=%i%kO=%s%kO=%O%kO=%.*s%kO=%O%kO=%D%kO=%O}", v49, v50, v51, v52, v53, v54, v78);
      free(v48);
      if ((_DWORD)v32)
      {
        v6 = (uint64_t)v74;
        v7 = v75;
        v8 = v73;
      }
      else
      {
        v6 = (uint64_t)v74;
        v7 = v75;
        v8 = v73;
        if (!v75)
          goto LABEL_30;
        v59 = strndup(v33, v34);
        if (v59)
        {
          *v75 = v59;
LABEL_30:
          if (v74)
          {
            v60 = v82[1];
            *v74 = v82[0];
            v74[1] = v60;
          }
          if (a5)
          {
            v61 = v81[1];
            *(_OWORD *)a5 = v81[0];
            *(_OWORD *)(a5 + 16) = v61;
          }
          v62 = *(int **)(a1 + 16);
          if (*v62 <= 50)
          {
            if (*v62 != -1)
              goto LABEL_36;
            if (_LogCategory_Initialize((uint64_t)v62, 0x32u))
            {
              v62 = *(int **)(a1 + 16);
LABEL_36:
              LogPrintF((uint64_t)v62, (uint64_t)"OSStatus _PairingSessionCreateIdentityKeychain(PairingSessionRef, char **, uint8_t *, uint8_t *)", 0x32u, (uint64_t)"Created %@: %.*s\n", v55, v56, v57, v58, *(_QWORD *)(a1 + 760));
            }
          }
          v32 = 0;
          goto LABEL_39;
        }
        v32 = 4294960568;
      }
    }
    else
    {
      v32 = 4294960568;
    }
LABEL_39:
    memset_s(v81, 0x20uLL, 0, 0x20uLL);
    memset_s(__s, 0x84uLL, 0, 0x84uLL);
    if (!(_DWORD)v32)
      goto LABEL_70;
    v63 = *(int **)(a1 + 16);
    if (*v63 > 40)
      goto LABEL_44;
    if (*v63 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v63, 0x28u))
        goto LABEL_44;
      v63 = *(int **)(a1 + 16);
    }
    LogPrintF((uint64_t)v63, (uint64_t)"OSStatus _PairingSessionGetOrCreateIdentityKeychain(PairingSessionRef, Boolean, char **, uint8_t *, uint8_t *)", 0x28u, (uint64_t)"### Create %@ failed (try %d of %d): %#m\n", v15, v16, v17, v18, *(_QWORD *)(a1 + 760));
LABEL_44:
    ++v19;
  }
  while (v19 != 11);
  v71 = *(int **)(a1 + 16);
  if (*v71 <= 60)
  {
    if (*v71 != -1)
      goto LABEL_68;
    if (_LogCategory_Initialize((uint64_t)v71, 0x3Cu))
    {
      v71 = *(int **)(a1 + 16);
LABEL_68:
      LogPrintF((uint64_t)v71, (uint64_t)"OSStatus _PairingSessionGetOrCreateIdentityKeychain(PairingSessionRef, Boolean, char **, uint8_t *, uint8_t *)", 0x3Cu, (uint64_t)"### Failed to create %@ after %d tries: %#m\n", v15, v16, v17, v18, *(_QWORD *)(a1 + 760));
    }
  }
LABEL_70:
  pthread_mutex_unlock(&gPairingGlobalLock);
  return v32;
}

uint64_t _PairingSessionAppleIDVerifyPeer(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  CUAppleIDClient *v12;
  uint64_t v13;
  CUAppleIDClient *v14;
  id v15;
  CUAppleIDClient *v16;
  CUAppleIDClient *v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL8 v25;
  BOOL v26;
  id v27;
  uint64_t v28;
  unsigned int v30;
  unsigned int v31;
  int *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v37;
  int *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  size_t v44;
  unsigned int v45;

  v45 = 0;
  v44 = 0;
  v6 = TLV8CopyCoalesced(a2, a3, 9, &v44, (int *)&v45);
  if (!v6 || !v44)
  {
    v11 = 0;
    v14 = 0;
    v17 = 0;
    v39 = 0;
LABEL_33:
    v9 = 0;
    v45 = -6711;
    goto LABEL_39;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:", v6, v44);
  v9 = v7;
  if (!v7)
  {
    v39 = 0;
    v17 = 0;
    v14 = 0;
    v11 = 0;
LABEL_35:
    v45 = -6728;
LABEL_52:
    free(v6);
    v6 = 0;
LABEL_53:
    v19 = 0;
    goto LABEL_27;
  }
  v43 = 0;
  NSDataDecompress(v7, v8, &v43);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v43;

  v39 = (void *)v10;
  if (!v10)
  {
    if (v11)
      v30 = NSErrorToOSStatusEx(v11, 0);
    else
      v30 = -6700;
    v9 = 0;
    v39 = 0;
    v17 = 0;
    v14 = 0;
    v45 = v30;
    goto LABEL_52;
  }
  v6 = TLV8CopyCoalesced(a2, a3, 20, &v44, (int *)&v45);
  if (!v6 || !v44)
  {
    v14 = 0;
    v17 = 0;
    goto LABEL_33;
  }
  v12 = (CUAppleIDClient *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:", v6, v44);
  v14 = v12;
  if (!v12)
  {
    v9 = 0;
    v17 = 0;
    goto LABEL_35;
  }
  v42 = v11;
  NSDataDecompress(v12, v13, &v42);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v42;

  if (!v9)
  {
    if (v15)
      v31 = NSErrorToOSStatusEx(v15, 0);
    else
      v31 = -6700;
    v9 = 0;
    v17 = 0;
    v14 = 0;
    v45 = v31;
    goto LABEL_51;
  }
  v14 = (CUAppleIDClient *)*(id *)(a1 + 840);
  if (!v14)
  {
    v16 = objc_alloc_init(CUAppleIDClient);
    v14 = v16;
    *(_QWORD *)(a1 + 840) = v16;
    if (*(_QWORD *)(a1 + 816))
      -[CUAppleIDClient setMyAppleID:](v16, "setMyAppleID:");
  }
  v17 = (CUAppleIDClient *)*(id *)(a1 + 848);
  if (!v17)
  {
    v17 = objc_alloc_init(CUAppleIDClient);
    *(_QWORD *)(a1 + 848) = v17;
  }
  -[CUAppleIDClient setMyInfoClient:](v17, "setMyInfoClient:", v14);
  if (*(_QWORD *)(a1 + 824))
    -[CUAppleIDClient setPeerAppleID:](v17, "setPeerAppleID:");
  if (*(_QWORD *)(a1 + 832))
    -[CUAppleIDClient setPeerAppleIDs:](v17, "setPeerAppleIDs:");
  -[CUAppleIDClient setPeerCertificateData:](v17, "setPeerCertificateData:", v10);
  -[CUAppleIDClient setPeerValidationData:](v17, "setPeerValidationData:", v9);
  v6 = TLV8CopyCoalesced(a2, a3, 10, &v44, (int *)&v45);
  if (!v6 || !v44)
  {
    v45 = -6711;
    v11 = v15;
LABEL_39:
    if (!v6)
      goto LABEL_53;
    goto LABEL_52;
  }
  v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:", v6, v44);
  if (!v18)
  {
    v45 = -6743;
LABEL_51:
    v11 = v15;
    goto LABEL_52;
  }
  v19 = (void *)v18;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  objc_msgSend(v6, "appendBytes:length:", a1 + 574, 32);
  objc_msgSend(v6, "appendBytes:length:", a1 + 446, 32);
  v41 = v15;
  v20 = -[CUAppleIDClient verifyData:signature:error:](v17, "verifyData:signature:error:", v6, v19, &v41);
  v11 = v41;

  if (v20)
  {
    if (*(_QWORD *)(a1 + 824))
      v25 = 0;
    else
      v25 = *(_QWORD *)(a1 + 832) == 0;
    v40 = v11;
    v26 = -[CUAppleIDClient validatePeerWithFlags:error:](v17, "validatePeerWithFlags:error:", v25, &v40);
    v27 = v40;

    if (v26)
      goto LABEL_26;
    v37 = objc_msgSend(v27, "code") ? objc_msgSend(v27, "code") : -6754;
    v45 = v37;
    v38 = *(int **)(a1 + 16);
    if (*v38 > 60)
      goto LABEL_26;
    if (*v38 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v38, 0x3Cu))
        goto LABEL_26;
      v38 = *(int **)(a1 + 16);
    }
    LogPrintF((uint64_t)v38, (uint64_t)"OSStatus _PairingSessionAppleIDVerifyPeer(PairingSessionRef, const uint8_t *, const uint8_t *)", 0x3Cu, (uint64_t)"### AppleID validate peer failed: %{error}\n", v33, v34, v35, v36, (uint64_t)v27);
LABEL_26:
    v11 = v27;
    goto LABEL_27;
  }
  v45 = -6754;
  v32 = *(int **)(a1 + 16);
  if (*v32 <= 60)
  {
    if (*v32 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v32, 0x3Cu))
        goto LABEL_27;
      v32 = *(int **)(a1 + 16);
    }
    LogPrintF((uint64_t)v32, (uint64_t)"OSStatus _PairingSessionAppleIDVerifyPeer(PairingSessionRef, const uint8_t *, const uint8_t *)", 0x3Cu, (uint64_t)"### AppleID verify peer signature failed: %{error}\n", v21, v22, v23, v24, (uint64_t)v11);
  }
LABEL_27:
  v28 = v45;

  return v28;
}

uint64_t PairingSessionFindPeerEx(uint64_t a1, char *__s, size_t a3, _OWORD *a4, _QWORD *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v9;
  unsigned int (*v12)(char *, size_t, _OWORD *, _QWORD);
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const __CFDictionary *v21;
  CFTypeID TypeID;
  const __CFData *TypedValue;
  const __CFData *v24;
  char *BytePtr;
  CFIndex Length;
  CFTypeID v27;
  const __CFData *v28;
  const __CFString *v29;
  const __CFDictionary *v30;
  CFTypeID v31;
  CFTypeID v32;
  const __CFDictionary *v33;
  int v34;
  int v35;
  id v36;
  void *v37;
  void *v38;
  CUPairedPeer *v39;
  unsigned int v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t *v64;
  CUPairingManager *v65;
  NSObject *v66;
  int v67;
  dispatch_queue_t v68;
  dispatch_semaphore_t v69;
  dispatch_time_t v70;
  intptr_t v71;
  void *v72;
  void *v73;
  id v74;
  _OWORD *v75;
  __int128 v76;
  const void *v77;
  int v79;
  int v80;
  int v81;
  void *v82;
  id v83[4];
  NSObject *v84;
  uint64_t *v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t (*v90)(uint64_t, uint64_t);
  void (*v91)(uint64_t);
  id v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  int v96;
  __int128 v97;
  uint64_t v98;

  v9 = a3;
  v98 = *MEMORY[0x1E0C80C00];
  v12 = *(unsigned int (**)(char *, size_t, _OWORD *, _QWORD))(a1 + 64);
  if (v12)
  {
    if (v12(__s, a3, a4, *(_QWORD *)(a1 + 24)))
      return 4294960569;
    else
      return 0;
  }
  if ((*(_BYTE *)(a1 + 100) & 4) != 0)
  {
    v93 = 0;
    v94 = &v93;
    v95 = 0x2020000000;
    v96 = 1;
    v87 = 0;
    v88 = &v87;
    v89 = 0x3032000000;
    v90 = __Block_byref_object_copy__12035;
    v91 = __Block_byref_object_dispose__12036;
    v92 = 0;
    v34 = StringToUUIDEx(__s, a3, 0, 0, &v97, a6, a7, a8);
    *((_DWORD *)v94 + 6) = v34;
    if (v34)
    {
      v97 = 0uLL;
      v35 = TextToHardwareAddress(__s, v9, 6, (_BYTE *)&v97 + 10);
      *((_DWORD *)v94 + 6) = v35;
      if (v35)
      {
        v38 = 0;
        v37 = 0;
        v39 = 0;
        v61 = 0;
        goto LABEL_79;
      }
      v36 = objc_alloc(MEMORY[0x1E0CB3940]);
      if (v9 == -1)
        v9 = strlen(__s);
      v37 = (void *)objc_msgSend(v36, "initWithBytes:length:encoding:", __s, v9, 4);
    }
    else
    {
      v37 = 0;
    }
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", &v97);
    if (v38)
    {
      v39 = objc_alloc_init(CUPairedPeer);
      -[CUPairedPeer setIdentifier:](v39, "setIdentifier:", v38);
      if (v37)
        -[CUPairedPeer setIdentifierStr:](v39, "setIdentifierStr:", v37);
      v40 = *(_DWORD *)(a1 + 100);
      if ((v40 & 0x80000000) == 0)
        v41 = (v40 >> 21) & 0x10 | (v40 >> 19) & 8;
      else
        v41 = (v40 >> 21) & 0x10 | (v40 >> 19) & 8 | 0x100;
      v42 = _Block_copy(*(const void **)(a1 + 968));
      v43 = v42;
      v44 = v41 | (v40 >> 1) & 4 | (v40 >> 21) & 0x20;
      if (v42)
      {
        v83[0] = 0;
        (*((void (**)(void *, CUPairedPeer *, uint64_t, id *))v42 + 2))(v42, v39, v44, v83);
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = v83[0];
        v47 = (void *)v88[5];
        v88[5] = v45;

        if (!v46)
        {
          if (v88[5])
            v67 = 0;
          else
            v67 = -6700;
          goto LABEL_62;
        }
        v55 = *(int **)(a1 + 16);
        if (*v55 <= 90)
        {
          if (*v55 != -1)
          {
LABEL_32:
            NSPrintF((uint64_t)"%{error}", v48, v49, v50, v51, v52, v53, v54, (uint64_t)v46);
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            LogPrintF((uint64_t)v55, (uint64_t)"OSStatus _PairingSessionFindPeerPairingManager(PairingSessionRef, const void *, size_t, uint8_t *, CFDictionaryRef *)", 0x5Au, (uint64_t)"### FindPeerHandler failed: %@, %@", v56, v57, v58, v59, (uint64_t)v39);

            goto LABEL_59;
          }
          if (_LogCategory_Initialize(*(_QWORD *)(a1 + 16), 0x5Au))
          {
            v55 = *(int **)(a1 + 16);
            goto LABEL_32;
          }
        }
LABEL_59:
        if (v88[5])
          v67 = 0;
        else
          v67 = NSErrorToOSStatusEx(v46, 0);
LABEL_62:
        *((_DWORD *)v94 + 6) = v67;

        v61 = 0;
        goto LABEL_63;
      }
      +[CUPairingDaemon sharedPairingDaemon](CUPairingDaemon, "sharedPairingDaemon");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v60;
      if (v60)
      {
        objc_msgSend(v60, "findPairedPeer:options:error:", v39, v44, v94 + 3);
        v62 = objc_claimAutoreleasedReturnValue();
        v63 = (void *)v88[5];
        v88[5] = v62;

        v64 = v94;
        if (!*((_DWORD *)v94 + 6))
        {
          if (v88[5])
          {
LABEL_63:
            v65 = 0;
            v66 = 0;
            goto LABEL_64;
          }
          v65 = 0;
          v66 = 0;
          goto LABEL_89;
        }
LABEL_79:
        v65 = 0;
        v66 = 0;
        goto LABEL_73;
      }
      v65 = objc_alloc_init(CUPairingManager);
      v68 = dispatch_queue_create("OSStatus _PairingSessionFindPeerPairingManager(PairingSessionRef, const void *, size_t, uint8_t *, CFDictionaryRef *)", 0);
      -[CUPairingManager setDispatchQueue:](v65, "setDispatchQueue:", v68);

      if ((*(_BYTE *)(a1 + 100) & 0x40) != 0)
        -[CUPairingManager setTargetUserSession:](v65, "setTargetUserSession:", 1);
      v69 = dispatch_semaphore_create(0);
      v83[0] = (id)MEMORY[0x1E0C809B0];
      v83[1] = (id)3221225472;
      v83[2] = ___PairingSessionFindPeerPairingManager_block_invoke;
      v83[3] = &unk_1E25DEE90;
      v85 = &v87;
      v86 = &v93;
      v66 = v69;
      v84 = v66;
      -[CUPairingManager findPairedPeer:options:completion:](v65, "findPairedPeer:options:completion:", v39, v44, v83);

      v70 = dispatch_time(0, 120000000000);
      v71 = dispatch_semaphore_wait(v66, v70);
      -[CUPairingManager invalidate](v65, "invalidate");
      v64 = v94;
      if (!v71)
      {
        if (*((_DWORD *)v94 + 6))
        {
          v61 = 0;
          goto LABEL_73;
        }
        if (v88[5])
        {
          v61 = 0;
LABEL_64:
          if (!a4)
          {
LABEL_68:
            if (a5)
            {
              objc_msgSend((id)v88[5], "acl");
              *a5 = objc_claimAutoreleasedReturnValue();
            }
            v77 = *(const void **)(a1 + 264);
            if (v77)
              CFRelease(v77);
            *(_QWORD *)(a1 + 264) = (id)v88[5];
            goto LABEL_73;
          }
          objc_msgSend((id)v88[5], "publicKey");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = v72;
          if (v72)
          {
            if (objc_msgSend(v72, "length") == 32)
            {
              v74 = objc_retainAutorelease(v73);
              v75 = (_OWORD *)objc_msgSend(v74, "bytes");
              v76 = v75[1];
              *a4 = *v75;
              a4[1] = v76;

              goto LABEL_68;
            }
            v81 = -6743;
          }
          else
          {
            v81 = -6727;
          }
          *((_DWORD *)v94 + 6) = v81;

LABEL_73:
          v13 = *((unsigned int *)v94 + 6);
          _Block_object_dispose(&v87, 8);

          _Block_object_dispose(&v93, 8);
          return v13;
        }
        v61 = 0;
LABEL_89:
        v80 = -6762;
        goto LABEL_90;
      }
      v61 = 0;
      v80 = -6722;
    }
    else
    {
      v39 = 0;
      v61 = 0;
      v65 = 0;
      v66 = 0;
      v64 = v94;
      v80 = -6708;
    }
LABEL_90:
    *((_DWORD *)v64 + 6) = v80;
    goto LABEL_73;
  }
  pthread_mutex_lock(&gPairingGlobalLock);
  if (v9 == -1)
    strlen(__s);
  LODWORD(v87) = 0;
  v83[0] = 0;
  v21 = (const __CFDictionary *)KeychainCopyMatchingFormatted(&v87, (uint64_t)"{%kO=%O%kO=%O%kO=%i%kO=%O%kO=%.*s%kO=%O%kO=%O}", v15, v16, v17, v18, v19, v20, *MEMORY[0x1E0CD6C98]);
  if ((_DWORD)v87)
  {
LABEL_54:
    if (!v21)
      goto LABEL_56;
    goto LABEL_55;
  }
  TypeID = CFDataGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v21, (const void *)*MEMORY[0x1E0CD70D8], TypeID, 0);
  v24 = TypedValue;
  if (TypedValue)
  {
    v83[0] = 0;
    BytePtr = (char *)CFDataGetBytePtr(TypedValue);
    Length = CFDataGetLength(v24);
    LODWORD(v87) = HexToData(BytePtr, Length, 22, (uint64_t)a4, 0x20uLL, (unint64_t *)v83, 0, 0);
    if ((_DWORD)v87)
      goto LABEL_54;
    if (v83[0] == (id)32)
    {
      v27 = CFDataGetTypeID();
      v28 = CFDictionaryGetTypedValue(v21, (const void *)*MEMORY[0x1E0CD69B0], v27, 0);
      if (v28)
      {
        v29 = OPACKDecodeData(v28, 0, 0);
        v30 = (const __CFDictionary *)v29;
        if (v29)
        {
          v31 = CFGetTypeID(v29);
          if (v31 == CFDictionaryGetTypeID())
          {
            v32 = CFDictionaryGetTypeID();
            v33 = CFDictionaryGetTypedValue(v30, CFSTR("acl"), v32, 0);
LABEL_48:
            if (a5)
            {
              if (v33)
                CFRetain(v33);
              *a5 = v33;
            }
            if (v30)
              CFRelease(v30);
            goto LABEL_54;
          }
        }
      }
      else
      {
        v30 = 0;
      }
      v33 = 0;
      goto LABEL_48;
    }
    v79 = -6743;
  }
  else
  {
    v79 = -6737;
  }
  LODWORD(v87) = v79;
  if (v21)
LABEL_55:
    CFRelease(v21);
LABEL_56:
  pthread_mutex_unlock(&gPairingGlobalLock);
  if ((_DWORD)v87)
    return 4294960569;
  else
    return 0;
}

void sub_18D4F591C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

const __CFDictionary *_PairingSessionVerifyACL(uint64_t a1, uint64_t a2)
{
  const __CFDictionary *result;
  uint64_t v5;
  uint64_t v6;

  v5 = a2;
  result = *(const __CFDictionary **)(a1 + 176);
  if (result)
  {
    if (CFDictionaryGetCount(result) < 1)
    {
      return 0;
    }
    else if (a2)
    {
      v6 = 0;
      CFDictionaryApplyFunction(*(CFDictionaryRef *)(a1 + 176), (CFDictionaryApplierFunction)_PairingSessionVerifyACLApplier, &v5);
      return (const __CFDictionary *)v6;
    }
    else
    {
      return (const __CFDictionary *)4294960523;
    }
  }
  return result;
}

uint64_t _ExtractGroupInfoTLV(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  UInt8 *v4;
  UInt8 *v5;
  __CFString *v6;
  CFTypeID v7;
  size_t v9;
  unsigned int v10;

  v10 = 0;
  v9 = 0;
  v4 = (UInt8 *)TLV8CopyCoalesced(a2, a3, 30, &v9, 0);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = (__CFString *)_OPACKDecodeBytes(0, v4, v9, 0, &v10);
  free(v5);
  if (v6)
  {
    v7 = CFGetTypeID(v6);
    if (v7 != CFDictionaryGetTypeID())
    {
      v10 = -6756;
      CFRelease(v6);
      return v10;
    }
    PairingSessionSetProperty(a1, CFSTR("groupInfoPeer"), v6);
    CFRelease(v6);
    return 0;
  }
  return v10;
}

uint64_t _VerifyServerM4(uint64_t a1, _QWORD *a2, size_t *a3)
{
  _BYTE *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int8x16_t *v14;
  int8x16_t *v15;
  size_t v16;
  void *v17;
  size_t v18;
  void *v19;
  uint64_t v20;
  int *v21;
  int v22;
  uint64_t v23;
  _BOOL4 v24;
  int v25;
  uint64_t v27;
  uint64_t v28;
  int8x16_t *v29;
  __int128 v30;
  void *v31;
  _OWORD v32[19];
  void *__src;
  __int128 v34;
  void *v35;
  _BYTE v36[304];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  memset(v36, 0, sizeof(v36));
  memset(v32, 0, sizeof(v32));
  __src = v36;
  v34 = xmmword_18D51D4A0;
  v35 = 0;
  v29 = (int8x16_t *)v32;
  v30 = xmmword_18D51D4A0;
  v6 = (_BYTE *)(a1 + 120);
  v31 = 0;
  v7 = TLV8BufferAppend((uint64_t)&__src, 6, (char *)(a1 + 120), 1uLL);
  if (!(_DWORD)v7)
  {
    if ((*(_DWORD *)(a1 + 100) & 0x20000000) != 0)
      v8 = "PV-Msg4s";
    else
      v8 = "PV-Msg04";
    v9 = _AddGroupInfoTLV(a1, (uint64_t)&v29);
    if ((_DWORD)v9
      || (*(_BYTE *)(a1 + 103) & 0x20) != 0 && (v9 = _PairingSessionAppleIDProveSelf(a1, (uint64_t)&v29), (_DWORD)v9))
    {
      v7 = v9;
      goto LABEL_36;
    }
    if ((_QWORD)v30)
    {
      v14 = (int8x16_t *)malloc_type_malloc(v30 + 16, 0x5758E5B5uLL);
      if (!v14)
      {
LABEL_42:
        v7 = 4294960568;
        goto LABEL_36;
      }
      v15 = v14;
      CryptoHKDF((uint64_t)kCryptoHashDescriptor_SHA512, a1 + 638, 32, "Pair-Verify-Encrypt-Salt", 0x18uLL, (uint64_t)"Pair-Verify-Encrypt-Info", 24, 0x20uLL, a1 + 414);
      _chacha20_poly1305_encrypt_all((_DWORD *)(a1 + 414), v8, 8, 0, 0, v29, v30, v15, (uint64_t)v15->i64 + v30);
      v7 = TLV8BufferAppend((uint64_t)&__src, 5, v15->i8, v30 + 16);
      free(v15);
      if ((_DWORD)v7)
        goto LABEL_36;
    }
    v16 = v34;
    v17 = v35;
    if (v35)
      goto LABEL_18;
    if ((unint64_t)v34 <= 1)
      v18 = 1;
    else
      v18 = v34;
    v19 = malloc_type_malloc(v18, 0xF62D7A9CuLL);
    if (v19)
    {
      v17 = v19;
      if (v16)
        memcpy(v19, __src, v16);
LABEL_18:
      __src = v36;
      *(_QWORD *)&v34 = 0;
      v35 = 0;
      *a2 = v17;
      *a3 = v16;
      if ((*(_BYTE *)(a1 + 100) & 2) != 0)
      {
        CryptoHKDF((uint64_t)kCryptoHashDescriptor_SHA512, a1 + 638, 32, "Pair-Verify-ResumeSessionID-Salt", 0x20uLL, (uint64_t)"Pair-Verify-ResumeSessionID-Info", 32, 8uLL, (uint64_t)&v28);
        v20 = v28;
        *(_QWORD *)(a1 + 376) = v28;
        _PairingSaveResumeState(a1, *(const void **)(a1 + 296), *(_QWORD *)(a1 + 304), *(const void **)(a1 + 248), *(_QWORD *)(a1 + 256), v20, (_OWORD *)(a1 + 638));
      }
      v21 = *(int **)(a1 + 16);
      v22 = *v21;
      if (*v21 >= 31)
      {
        v7 = 0;
        *v6 = 5;
        goto LABEL_36;
      }
      if (v22 == -1)
      {
        v24 = _LogCategory_Initialize(*(_QWORD *)(a1 + 16), 0x1Eu);
        v21 = *(int **)(a1 + 16);
        if (!v24)
          goto LABEL_31;
        v22 = *v21;
      }
      if (v22 > 10)
        v23 = 1;
      else
        v23 = v22 == -1 && !_LogCategory_Initialize((uint64_t)v21, 0xAu);
      LogPrintF((uint64_t)v21, (uint64_t)"OSStatus _VerifyServerM4(PairingSessionRef, uint8_t **, size_t *)", 0x1Eu, (uint64_t)"Pair-verify server M4 -- finish response\n%?{end}%1{tlv8}\n", v10, v11, v12, v13, v23);
      v21 = *(int **)(a1 + 16);
LABEL_31:
      v25 = *v21;
      *v6 = 5;
      if (v25 <= 30)
      {
        if (v25 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v21, 0x1Eu))
            goto LABEL_35;
          v21 = *(int **)(a1 + 16);
        }
        LogPrintF((uint64_t)v21, (uint64_t)"OSStatus _VerifyServerM4(PairingSessionRef, uint8_t **, size_t *)", 0x1Eu, (uint64_t)"Pair-verify server done\n", v10, v11, v12, v13, v27);
      }
LABEL_35:
      v7 = 0;
      goto LABEL_36;
    }
    goto LABEL_42;
  }
LABEL_36:
  if (v31)
  {
    free(v31);
    v31 = 0;
  }
  if (v35)
    free(v35);
  return v7;
}

void _PairingSessionUpdateTranscript(uint64_t a1, UInt8 *bytes, CFIndex length, UInt8 *a4, CFIndex a5)
{
  __CFData *Mutable;

  if (*(_DWORD *)(a1 + 680))
  {
    Mutable = *(__CFData **)(a1 + 672);
    if (Mutable || (Mutable = CFDataCreateMutable(0, 0), (*(_QWORD *)(a1 + 672) = Mutable) != 0))
    {
      if (bytes && length)
        CFDataAppendBytes(Mutable, bytes, length);
      if (a4)
      {
        if (a5)
          CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 672), a4, a5);
      }
    }
  }
}

uint64_t _AddGroupInfoTLV(uint64_t a1, uint64_t a2)
{
  const __CFDictionary *v4;
  CFTypeID TypeID;
  const __CFString *TypedValue;
  void *v7;
  id v8;
  const __CFDictionary *v9;
  CFTypeID v10;
  const __CFData *DataMutable;
  const __CFData *v12;
  char *BytePtr;
  size_t Length;
  uint64_t result;
  unsigned int v16;

  v4 = *(const __CFDictionary **)(a1 + 344);
  TypeID = CFDictionaryGetTypeID();
  TypedValue = (const __CFString *)CFDictionaryGetTypedValue(v4, CFSTR("groupInfoSelf"), TypeID, 0);
  if (!TypedValue)
  {
    v7 = *(void **)(a1 + 264);
    if (v7)
      v8 = v7;
    objc_msgSend(v7, "info");
    v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v10 = CFDictionaryGetTypeID();
    TypedValue = (const __CFString *)CFDictionaryGetTypedValue(v9, CFSTR("groupInfo"), v10, 0);

    if (!TypedValue)
      return 0;
  }
  v16 = 0;
  DataMutable = OPACKEncoderCreateDataMutable(TypedValue, 0, (int *)&v16);
  if (!DataMutable)
    return v16;
  v12 = DataMutable;
  BytePtr = (char *)CFDataGetBytePtr(DataMutable);
  Length = CFDataGetLength(v12);
  v16 = TLV8BufferAppend(a2, 30, BytePtr, Length);
  CFRelease(v12);
  result = v16;
  if (!v16)
    return 0;
  return result;
}

unint64_t _PairingSessionVerifyACLApplier(unint64_t result, uint64_t a2, uint64_t a3)
{
  const void *v4;
  const __CFDictionary *v5;

  if (!*(_DWORD *)(a3 + 8))
  {
    v4 = (const void *)result;
    v5 = *(const __CFDictionary **)a3;
    result = CFDictionaryGetInt64(*(const __CFDictionary **)a3, (const void *)result, 0);
    if (!result)
    {
      result = CFDictionaryGetInt64(v5, CFSTR("com.apple.admin"), 0);
      if (!result)
      {
        result = CFEqual(v4, CFSTR("com.apple.ScreenCapture"));
        if (!(_DWORD)result || (result = CFDictionaryGetInt64(v5, CFSTR("com.apple.developer"), 0)) == 0)
          *(_DWORD *)(a3 + 8) = -6773;
      }
    }
  }
  return result;
}

uint64_t __Block_byref_object_copy__12035(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12036(uint64_t a1)
{

}

uint64_t _PairingSessionCopyIdentityPairingManager(uint64_t a1, uint64_t a2, char **a3, _QWORD *a4, _OWORD *a5, _OWORD *a6)
{
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t *v34;
  CUPairingManager *v35;
  NSObject *v36;
  int v37;
  dispatch_queue_t v38;
  dispatch_semaphore_t v39;
  dispatch_time_t v40;
  intptr_t v41;
  void *v42;
  __CFString *v43;
  char *v44;
  void *v45;
  id v46;
  id v47;
  _OWORD *v48;
  __int128 v49;
  _OWORD *v50;
  __int128 v51;
  uint64_t v52;
  int v54;
  int v55;
  int v56;
  _QWORD v57[4];
  NSObject *v58;
  uint64_t *v59;
  uint64_t *v60;
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  int v71;

  v68 = 0;
  v69 = &v68;
  v70 = 0x2020000000;
  v71 = 1;
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__12035;
  v66 = __Block_byref_object_dispose__12036;
  v67 = 0;
  v11 = ((unint64_t)*(unsigned int *)(a1 + 100) >> 1) & 4 | a2;
  v12 = _Block_copy(*(const void **)(a1 + 960));
  if (v12)
  {
    v13 = v12;
    v61 = 0;
    ((void (*)(NSObject *, unint64_t, id *))v12[2].isa)(v12, v11, &v61);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v61;
    v16 = (void *)v63[5];
    v63[5] = v14;

    if (!v15)
    {
      if (v63[5])
        v37 = 0;
      else
        v37 = -6700;
      goto LABEL_24;
    }
    v24 = *(int **)(a1 + 16);
    if (*v24 <= 90)
    {
      if (*v24 != -1)
      {
LABEL_5:
        NSPrintF((uint64_t)"%{error}", v17, v18, v19, v20, v21, v22, v23, (uint64_t)v15);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF((uint64_t)v24, (uint64_t)"OSStatus _PairingSessionCopyIdentityPairingManager(PairingSessionRef, CUPairingOptions, char **, CFDataRef *, uint8_t *, uint8_t *)", 0x5Au, (uint64_t)"### CopyIdentityHandler failed: %@", v26, v27, v28, v29, (uint64_t)v25);

        goto LABEL_21;
      }
      if (_LogCategory_Initialize(*(_QWORD *)(a1 + 16), 0x5Au))
      {
        v24 = *(int **)(a1 + 16);
        goto LABEL_5;
      }
    }
LABEL_21:
    if (v63[5])
      v37 = 0;
    else
      v37 = NSErrorToOSStatusEx(v15, 0);
LABEL_24:
    *((_DWORD *)v69 + 6) = v37;

    v35 = 0;
    v36 = 0;
LABEL_25:

    v31 = 0;
    if (!a3)
      goto LABEL_29;
    goto LABEL_26;
  }
  +[CUPairingDaemon sharedPairingDaemon](CUPairingDaemon, "sharedPairingDaemon");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (!v30)
  {
    v35 = objc_alloc_init(CUPairingManager);
    v38 = dispatch_queue_create("OSStatus _PairingSessionCopyIdentityPairingManager(PairingSessionRef, CUPairingOptions, char **, CFDataRef *, uint8_t *, uint8_t *)", 0);
    -[CUPairingManager setDispatchQueue:](v35, "setDispatchQueue:", v38);

    if ((*(_BYTE *)(a1 + 100) & 0x40) != 0)
      -[CUPairingManager setTargetUserSession:](v35, "setTargetUserSession:", 1);
    v39 = dispatch_semaphore_create(0);
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = ___PairingSessionCopyIdentityPairingManager_block_invoke;
    v57[3] = &unk_1E25DEEB8;
    v59 = &v62;
    v60 = &v68;
    v36 = v39;
    v58 = v36;
    -[CUPairingManager getPairingIdentityWithOptions:completion:](v35, "getPairingIdentityWithOptions:completion:", v11, v57);
    v40 = dispatch_time(0, 120000000000);
    v41 = dispatch_semaphore_wait(v36, v40);
    -[CUPairingManager invalidate](v35, "invalidate");
    if (v41)
    {
      v56 = -6722;
    }
    else
    {
      if (*((_DWORD *)v69 + 6))
      {
LABEL_55:

        v31 = 0;
        goto LABEL_56;
      }
      if (v63[5])
      {
        v13 = v58;
        goto LABEL_25;
      }
      v56 = -6762;
    }
    *((_DWORD *)v69 + 6) = v56;
    goto LABEL_55;
  }
  v32 = objc_msgSend(v30, "copyIdentityWithOptions:error:", v11, v69 + 3);
  v33 = (void *)v63[5];
  v63[5] = v32;

  v34 = v69;
  if (*((_DWORD *)v69 + 6))
  {
    v35 = 0;
    v36 = 0;
    goto LABEL_56;
  }
  if (!v63[5])
  {
    v35 = 0;
    v36 = 0;
    v47 = 0;
    v54 = -6762;
    goto LABEL_46;
  }
  v35 = 0;
  v36 = 0;
  if (a3)
  {
LABEL_26:
    objc_msgSend((id)v63[5], "identifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "UUIDString");
    v43 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      v44 = CFCopyCString(v43, 0);
      if (v44)
      {
        *a3 = v44;

        goto LABEL_29;
      }
      v55 = -6728;
    }
    else
    {
      v55 = -6727;
    }
    *((_DWORD *)v69 + 6) = v55;

LABEL_56:
    v47 = 0;
    goto LABEL_43;
  }
LABEL_29:
  if (a4)
  {
    objc_msgSend((id)v63[5], "altIRK");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45)
      v46 = v45;
    else
      v46 = 0;
    *a4 = v46;
    if (a5)
      goto LABEL_39;
LABEL_33:
    if (!a6)
    {
LABEL_42:
      v47 = v46;
      goto LABEL_43;
    }
    goto LABEL_34;
  }
  v46 = 0;
  if (!a5)
    goto LABEL_33;
LABEL_39:
  objc_msgSend((id)v63[5], "publicKey");
  v47 = (id)objc_claimAutoreleasedReturnValue();

  if (!v47)
    goto LABEL_44;
  if (objc_msgSend(v47, "length") != 32)
    goto LABEL_45;
  v46 = objc_retainAutorelease(v47);
  v50 = (_OWORD *)objc_msgSend(v46, "bytes");
  v51 = v50[1];
  *a5 = *v50;
  a5[1] = v51;
  if (!a6)
    goto LABEL_42;
LABEL_34:
  objc_msgSend((id)v63[5], "secretKey");
  v47 = (id)objc_claimAutoreleasedReturnValue();

  if (!v47)
  {
LABEL_44:
    v34 = v69;
    v54 = -6727;
LABEL_46:
    *((_DWORD *)v34 + 6) = v54;
    goto LABEL_43;
  }
  if (objc_msgSend(v47, "length") != 32)
  {
LABEL_45:
    v34 = v69;
    v54 = -6743;
    goto LABEL_46;
  }
  v47 = objc_retainAutorelease(v47);
  v48 = (_OWORD *)objc_msgSend(v47, "bytes");
  v49 = v48[1];
  *a6 = *v48;
  a6[1] = v49;
LABEL_43:
  v52 = *((unsigned int *)v69 + 6);

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v68, 8);
  return v52;
}

void sub_18D4F6624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void _PairingSessionDeleteIdentity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const void *v9;
  const __CFArray *v10;
  const __CFArray *v11;
  CFIndex Count;
  CFIndex v13;
  CFIndex v14;
  const void *v15;
  CFTypeID TypeID;
  const __CFDictionary *TypedValueAtIndex;
  const __CFDictionary *v18;
  CFTypeID v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;

  v9 = (const void *)*MEMORY[0x1E0CD6BC8];
  v10 = (const __CFArray *)KeychainCopyMatchingFormatted(0, (uint64_t)"{%kO=%O%kO=%O%kO=%i%kO=%O%kO=%O%kO=%O%kO=%O}", a3, a4, a5, a6, a7, a8, *MEMORY[0x1E0CD6C98]);
  if (v10)
  {
    v11 = v10;
    v27 = 0;
    Count = CFArrayGetCount(v10);
    if (Count >= 1)
    {
      v13 = Count;
      v14 = 0;
      v15 = (const void *)*MEMORY[0x1E0CD70E0];
      do
      {
        TypeID = CFDictionaryGetTypeID();
        TypedValueAtIndex = CFArrayGetTypedValueAtIndex(v11, v14, TypeID, 0);
        if (TypedValueAtIndex)
        {
          v18 = TypedValueAtIndex;
          if (*(_DWORD *)(a1 + 768) == CFDictionaryGetInt64(TypedValueAtIndex, v9, &v27))
          {
            v19 = CFDataGetTypeID();
            CFDictionaryGetTypedValue(v18, v15, v19, &v27);
            if (!v27)
              v27 = KeychainDeleteFormatted((uint64_t)"{%kO=%O}", v20, v21, v22, v23, v24, v25, v26, (uint64_t)v15);
          }
        }
        ++v14;
      }
      while (v13 != v14);
    }
    CFRelease(v11);
  }
}

uint64_t _MFiClientVerify(uint64_t a1, unsigned __int8 *a2, uint64_t a3, _DWORD *a4, uint64_t a5, uint64_t a6, char *a7, unint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  int8x16_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 *v22;
  unsigned __int8 *v23;
  const UInt8 *v24;
  CFIndex v25;
  uint64_t v26;
  CFDataRef v27;
  CFDataRef v28;
  CFDataRef v29;
  uint64_t result;
  int *v31;
  _BOOL4 v32;
  unsigned int v33;
  void *v34;
  CFIndex length;
  UInt8 *bytes;
  void *v37;
  uint64_t v38;
  const UInt8 *v39;
  void *v40;
  CFIndex v41;
  const UInt8 *v42;
  size_t v43;
  unsigned int GroupInfoTLV;
  UInt8 v45[32];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  GroupInfoTLV = 0;
  v43 = 0;
  v40 = 0;
  v37 = 0;
  v17 = (int8x16_t *)TLV8CopyCoalesced(a2, &a2[a3], 5, &v43, (int *)&GroupInfoTLV);
  v22 = (unsigned __int8 *)v17;
  if (GroupInfoTLV)
    goto LABEL_18;
  if (v43 <= 0xF)
  {
    v33 = -6743;
LABEL_29:
    GroupInfoTLV = v33;
    goto LABEL_16;
  }
  v23 = &v17[-1].u8[v43];
  GroupInfoTLV = _chacha20_poly1305_decrypt_all((_DWORD *)(a1 + 414), a4, 8, 0, 0, v17, v43 - 16, v17, (uint64_t)v23, 16);
  if (!GroupInfoTLV)
  {
    v41 = 0;
    v42 = 0;
    GroupInfoTLV = TLV8GetOrCopyCoalesced(v22, v23, 10, &v42, (size_t *)&v41, &v40, 0);
    if (!GroupInfoTLV)
    {
      v38 = 0;
      v39 = 0;
      GroupInfoTLV = TLV8GetOrCopyCoalesced(v22, v23, 9, &v39, (size_t *)&v38, &v37, 0);
      if (!GroupInfoTLV)
      {
        CryptoHKDF((uint64_t)kCryptoHashDescriptor_SHA512, a5, a6, a7, a8, a9, a10, 0x20uLL, (uint64_t)v45);
        v25 = v38;
        v24 = v39;
        GroupInfoTLV = MFiPlatform_VerifySignatureEx(v45, 32, v42, v41, v39, v38, 0, v26);
        if (!GroupInfoTLV)
        {
          length = 0;
          bytes = 0;
          v34 = 0;
          TLV8GetOrCopyCoalesced(v22, v23, 28, &bytes, (size_t *)&length, &v34, 0);
          if (bytes)
          {
            v27 = CFDataCreate(0, bytes, length);
            if (v34)
              free(v34);
            if (!v27)
            {
LABEL_31:
              v33 = -6728;
              goto LABEL_29;
            }
            GroupInfoTLV = PairingSessionSetProperty(a1, CFSTR("productData"), v27);
            CFRelease(v27);
            if (GroupInfoTLV)
              goto LABEL_16;
          }
          if (!a11 || (GroupInfoTLV = _ExtractGroupInfoTLV(a1, v22, v23)) == 0)
          {
            v28 = CFDataCreate(0, v24, v25);
            if (v28)
            {
              v29 = v28;
              GroupInfoTLV = PairingSessionSetProperty(a1, CFSTR("certificate"), v28);
              CFRelease(v29);
              goto LABEL_16;
            }
            goto LABEL_31;
          }
        }
      }
    }
  }
LABEL_16:
  if (v37)
    free(v37);
LABEL_18:
  if (v40)
    free(v40);
  if (v22)
    free(v22);
  result = GroupInfoTLV;
  if (GroupInfoTLV)
  {
    v31 = *(int **)(a1 + 16);
    if (*v31 <= 90)
    {
      if (*v31 != -1)
      {
LABEL_25:
        LogPrintF((uint64_t)v31, (uint64_t)"OSStatus _MFiClientVerify(PairingSessionRef, const void *, size_t, const uint8_t *, const void *, size_t, const void *, size_t, const void *, size_t, Boolean)", 0x5Au, (uint64_t)"### MFi verify failed: %#m\n", v18, v19, v20, v21, result);
        return GroupInfoTLV;
      }
      v32 = _LogCategory_Initialize(*(_QWORD *)(a1 + 16), 0x5Au);
      result = GroupInfoTLV;
      if (v32)
      {
        v31 = *(int **)(a1 + 16);
        goto LABEL_25;
      }
    }
  }
  return result;
}

uint64_t _PairingThrottle()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;

  pthread_mutex_lock(&gPairingGlobalLock);
  if (gPairingMaxTries)
  {
    if (gPairingTries >= gPairingMaxTries)
    {
      v4 = 4294960532;
      goto LABEL_18;
    }
    ++gPairingTries;
    goto LABEL_17;
  }
  if (UpTicksPerSecond_sOnce != -1)
    dispatch_once_f(&UpTicksPerSecond_sOnce, &UpTicksPerSecond_sTicksPerSecond, (dispatch_function_t)_UpTicksPerSecondInit);
  v0 = UpTicksPerSecond_sTicksPerSecond;
  v1 = mach_absolute_time();
  if (!gPairingThrottleNextTicks || (v2 = gPairingThrottleNextTicks - v1, gPairingThrottleNextTicks <= v1))
  {
    v5 = 2 * gPairingThrottleCounter;
    if ((2 * gPairingThrottleCounter) >= 0x2A30)
      v5 = 10800;
    if (gPairingThrottleCounter)
      v6 = v5;
    else
      v6 = 1;
    gPairingThrottleCounter = v6;
    gPairingThrottleNextTicks = v1 + v0 * v6;
LABEL_17:
    v4 = 4294960539;
    goto LABEL_18;
  }
  v3 = v2 / v0;
  if (v2 == v2 / v0 * v0)
    v4 = v3;
  else
    v4 = (v3 + 1);
LABEL_18:
  pthread_mutex_unlock(&gPairingGlobalLock);
  return v4;
}

uint64_t PairingResetThrottle()
{
  pthread_mutex_lock(&gPairingGlobalLock);
  gPairingThrottleNextTicks = 0;
  gPairingThrottleCounter = 0;
  gPairingTries = 0;
  return pthread_mutex_unlock(&gPairingGlobalLock);
}

void _ServerEncryptExtra(uint64_t a1, uint64_t a2)
{
  const __CFDictionary *v4;
  CFTypeID TypeID;
  const __CFData *TypedValue;
  const __CFData *v7;
  char *BytePtr;
  size_t Length;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int8x16_t *v15;
  int8x16_t *v16;
  int *v17;
  int8x16_t *v18;
  __int128 v19;
  void *v20;
  _OWORD v21[19];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  memset(v21, 0, sizeof(v21));
  v18 = (int8x16_t *)v21;
  v19 = xmmword_18D51D4A0;
  v20 = 0;
  v4 = *(const __CFDictionary **)(a1 + 344);
  TypeID = CFDataGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v4, CFSTR("productData"), TypeID, 0);
  if (!TypedValue
    || (v7 = TypedValue,
        BytePtr = (char *)CFDataGetBytePtr(TypedValue),
        Length = CFDataGetLength(v7),
        v14 = TLV8BufferAppend((uint64_t)&v18, 28, BytePtr, Length),
        !(_DWORD)v14))
  {
    if (!(_QWORD)v19)
    {
      if (v20)
        free(v20);
      return;
    }
    v15 = (int8x16_t *)malloc_type_malloc(v19 + 16, 0x3B5AA666uLL);
    if (v15)
    {
      v16 = v15;
      _chacha20_poly1305_encrypt_all((_DWORD *)(a1 + 414), "PS-Msg04", 8, 0, 0, v18, v19, v16, (uint64_t)v16->i64 + v19);
      v14 = TLV8BufferAppend(a2, 5, v16->i8, v19 + 16);
      free(v16);
      if (v20)
      {
        free(v20);
        v20 = 0;
      }
      if (!(_DWORD)v14)
        return;
      goto LABEL_10;
    }
    v14 = 4294960568;
  }
  if (v20)
  {
    free(v20);
    v20 = 0;
  }
LABEL_10:
  v17 = *(int **)(a1 + 16);
  if (*v17 <= 90)
  {
    if (*v17 != -1)
    {
LABEL_12:
      LogPrintF((uint64_t)v17, (uint64_t)"OSStatus _ServerEncryptExtra(PairingSessionRef, const uint8_t *, TLV8Buffer *)", 0x5Au, (uint64_t)"### ServerEncryptExtra failed: %#m\n", v10, v11, v12, v13, v14);
      return;
    }
    if (_LogCategory_Initialize((uint64_t)v17, 0x5Au))
    {
      v17 = *(int **)(a1 + 16);
      goto LABEL_12;
    }
  }
}

CFTypeRef _PairingSessionIntersectACL(uint64_t a1, CFDictionaryRef theDict, _DWORD *a3)
{
  const void *v6;
  const __CFDictionary *v7;
  CFTypeRef result;
  CFTypeRef context[2];
  uint64_t v10;

  v6 = *(const void **)(a1 + 176);
  context[0] = 0;
  context[1] = v6;
  v10 = 0;
  if (CFDictionaryGetCount(theDict) >= 1)
  {
    v7 = *(const __CFDictionary **)(a1 + 176);
    if (!v7 || CFDictionaryGetCount(v7) <= 0)
    {
      result = 0;
      LODWORD(v10) = -6773;
      goto LABEL_5;
    }
    CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_PairingSessionIntersectACLApplier, context);
    result = context[0];
    if (!(_DWORD)v10 || !context[0])
      goto LABEL_5;
    CFRelease(context[0]);
  }
  result = 0;
LABEL_5:
  if (a3)
    *a3 = v10;
  return result;
}

uint64_t _PairingSessionVerifyAllowed(uint64_t a1)
{
  const __CFDictionary *v2;
  CFTypeID TypeID;
  uint64_t result;
  const __CFArray *v5;
  const __CFDictionary *v6;
  CFTypeID v7;
  const __CFDictionary *TypedValue;
  const __CFDictionary *v9;
  CFTypeID v10;
  const __CFDictionary *v11;
  const void *v12;
  CFIndex Count;
  CFIndex v14;
  CFIndex v15;
  CFTypeID v16;
  const __CFArray *TypedValueAtIndex;
  const __CFArray *v18;

  v2 = *(const __CFDictionary **)(a1 + 344);
  TypeID = CFArrayGetTypeID();
  result = (uint64_t)CFDictionaryGetTypedValue(v2, CFSTR("allowedMACAddresses"), TypeID, 0);
  if (result)
  {
    v5 = (const __CFArray *)result;
    v6 = *(const __CFDictionary **)(a1 + 312);
    v7 = CFDataGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(v6, CFSTR("mac"), v7, 0);
    v9 = *(const __CFDictionary **)(a1 + 312);
    v10 = CFDataGetTypeID();
    v11 = CFDictionaryGetTypedValue(v9, CFSTR("wifiMAC"), v10, 0);
    if ((unint64_t)TypedValue | (unint64_t)v11)
    {
      v12 = v11;
      Count = CFArrayGetCount(v5);
      if (Count < 1)
      {
        return 4294960520;
      }
      else
      {
        v14 = Count;
        v15 = 0;
        while (1)
        {
          v16 = CFDataGetTypeID();
          TypedValueAtIndex = CFArrayGetTypedValueAtIndex(v5, v15, v16, 0);
          if (TypedValueAtIndex)
          {
            v18 = TypedValueAtIndex;
            if (TypedValue)
            {
              if (CFEqual(TypedValueAtIndex, TypedValue))
                break;
            }
            if (v12 && CFEqual(v18, v12))
              break;
          }
          if (v14 == ++v15)
            return 4294960520;
        }
        return 0;
      }
    }
    else
    {
      return 4294960535;
    }
  }
  return result;
}

uint64_t PairingSessionSavePeer(uint64_t a1, char *__s, size_t a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v9;
  uint64_t (*v12)(char *, size_t, unsigned __int8 *, _QWORD);
  int v14;
  uint64_t v15;
  void *v16;
  CUPairedPeer *v17;
  unsigned int v18;
  _QWORD *v19;
  const __CFDictionary *v20;
  CFTypeID TypeID;
  CFMutableDictionaryRef v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  int *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  CUPairingManager *v45;
  NSObject *v46;
  dispatch_queue_t v47;
  dispatch_semaphore_t v48;
  dispatch_time_t v49;
  uint64_t *v50;
  const void *v51;
  void *v52;
  id v53[4];
  NSObject *v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  int v59;
  __int128 v60;
  uint64_t v61;

  v9 = a3;
  v61 = *MEMORY[0x1E0C80C00];
  if (a3 == -1)
    v9 = strlen(__s);
  v12 = *(uint64_t (**)(char *, size_t, unsigned __int8 *, _QWORD))(a1 + 72);
  if (v12)
    return v12(__s, v9, a4, *(_QWORD *)(a1 + 24));
  if ((*(_BYTE *)(a1 + 100) & 4) == 0)
    return _PairingSessionSavePeerKeychain(a1, __s, v9, a4, 0);
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v59 = 1;
  v14 = StringToUUIDEx(__s, v9, 0, 0, &v60, a6, a7, a8);
  *((_DWORD *)v57 + 6) = v14;
  if (v14)
  {
    v60 = 0uLL;
    v15 = TextToHardwareAddress(__s, v9, 6, (_BYTE *)&v60 + 10);
    *((_DWORD *)v57 + 6) = v15;
    if ((_DWORD)v15)
    {
      v44 = v15;
      v16 = 0;
      v17 = 0;
      v43 = 0;
      v45 = 0;
      v46 = 0;
      goto LABEL_33;
    }
  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", &v60);
  if (!v16)
  {
    v17 = 0;
    v43 = 0;
    v45 = 0;
    v46 = 0;
    v50 = v57;
    v44 = 4294960588;
    goto LABEL_35;
  }
  v17 = objc_alloc_init(CUPairedPeer);
  -[CUPairedPeer setIdentifier:](v17, "setIdentifier:", v16);
  v18 = *(_DWORD *)(a1 + 96);
  if (v18 <= 0xD && ((1 << v18) & 0x2A2A) != 0)
    v19 = (_QWORD *)(a1 + 176);
  else
    v19 = (_QWORD *)(a1 + 280);
  -[CUPairedPeer setAcl:](v17, "setAcl:", *v19);
  v20 = *(const __CFDictionary **)(a1 + 312);
  TypeID = CFDataGetTypeID();
  -[CUPairedPeer setAltIRK:](v17, "setAltIRK:", CFDictionaryGetTypedValue(v20, CFSTR("altIRK"), TypeID, 0));
  v22 = PairingSessionCopyPeerInfo((_QWORD *)a1, 0);
  -[CUPairedPeer setInfo:](v17, "setInfo:", v22);

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a4, 32);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUPairedPeer setPublicKey:](v17, "setPublicKey:", v23);

  v24 = *(unsigned int *)(a1 + 100);
  v25 = _Block_copy(*(const void **)(a1 + 976));
  v26 = v25;
  v27 = (v24 >> 1) & 4;
  if (v25)
  {
    v53[0] = 0;
    (*((void (**)(void *, CUPairedPeer *, unint64_t, id *))v25 + 2))(v25, v17, (v24 >> 1) & 4, v53);
    v28 = v53[0];
    v36 = v28;
    if (!v28)
    {
LABEL_29:
      *((_DWORD *)v57 + 6) = (_DWORD)v28;

      v43 = 0;
      v45 = 0;
      v46 = 0;
      goto LABEL_30;
    }
    v37 = *(int **)(a1 + 16);
    if (*v37 <= 90)
    {
      if (*v37 == -1)
      {
        if (!_LogCategory_Initialize(*(_QWORD *)(a1 + 16), 0x5Au))
          goto LABEL_28;
        v37 = *(int **)(a1 + 16);
      }
      NSPrintF((uint64_t)"%{error}", v29, v30, v31, v32, v33, v34, v35, (uint64_t)v36);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)v37, (uint64_t)"OSStatus _PairingSessionSavePeerPairingManager(PairingSessionRef, const void *, size_t, const uint8_t *)", 0x5Au, (uint64_t)"### SavePeerHandler failed: %@, %@", v38, v39, v40, v41, (uint64_t)v17);

    }
LABEL_28:
    LODWORD(v28) = NSErrorToOSStatusEx(v36, 0);
    goto LABEL_29;
  }
  +[CUPairingDaemon sharedPairingDaemon](CUPairingDaemon, "sharedPairingDaemon");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v42;
  if (!v42)
  {
    v45 = objc_alloc_init(CUPairingManager);
    v47 = dispatch_queue_create("OSStatus _PairingSessionSavePeerPairingManager(PairingSessionRef, const void *, size_t, const uint8_t *)", 0);
    -[CUPairingManager setDispatchQueue:](v45, "setDispatchQueue:", v47);

    if ((*(_BYTE *)(a1 + 100) & 0x40) != 0)
      -[CUPairingManager setTargetUserSession:](v45, "setTargetUserSession:", 1);
    v48 = dispatch_semaphore_create(0);
    v53[0] = (id)MEMORY[0x1E0C809B0];
    v53[1] = (id)3221225472;
    v53[2] = ___PairingSessionSavePeerPairingManager_block_invoke;
    v53[3] = &unk_1E25DEEE0;
    v55 = &v56;
    v46 = v48;
    v54 = v46;
    -[CUPairingManager savePairedPeer:options:completion:](v45, "savePairedPeer:options:completion:", v17, v27, v53);

    v49 = dispatch_time(0, 120000000000);
    v43 = (void *)dispatch_semaphore_wait(v46, v49);
    -[CUPairingManager invalidate](v45, "invalidate");
    v50 = v57;
    if (!v43)
    {
      v44 = *((unsigned int *)v57 + 6);
      if ((_DWORD)v44)
        goto LABEL_33;
LABEL_30:
      v51 = *(const void **)(a1 + 264);
      if (v51)
        CFRelease(v51);
      v17 = v17;
      *(_QWORD *)(a1 + 264) = v17;
      v44 = *((unsigned int *)v57 + 6);
      goto LABEL_33;
    }
    v43 = 0;
    v44 = 4294960574;
LABEL_35:
    *((_DWORD *)v50 + 6) = v44;
    goto LABEL_33;
  }
  v44 = objc_msgSend(v42, "savePairedPeer:options:", v17, v27);
  v45 = 0;
  *((_DWORD *)v57 + 6) = v44;
  v46 = 0;
  if (!(_DWORD)v44)
    goto LABEL_30;
  v46 = 0;
LABEL_33:

  _Block_object_dispose(&v56, 8);
  return v44;
}

void sub_18D4F75D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFDictionary *_PairingSessionGetSelfInfo(uint64_t a1)
{
  __CFDictionary *Mutable;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  const void *v9;
  const void *v10;
  const __CFDictionary *v11;
  const __CFDictionary *v12;
  CFTypeID TypeID;
  const __CFDictionary *TypedValue;
  void *value;
  void *v17;
  UInt8 bytes[6];
  int v19;

  Mutable = *(__CFDictionary **)(a1 + 328);
  if (!Mutable)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (Mutable)
    {
      v19 = 0;
      if ((*(_BYTE *)(a1 + 100) & 4) != 0)
      {
        value = 0;
        v17 = 0;
        _PairingSessionCopyIdentityPairingManager(a1, 3, (char **)&v17, &value, 0, 0);
        if (v17)
        {
          CFDictionarySetCString(Mutable, CFSTR("accountID"), (const char *)v17, -1);
          free(v17);
        }
        if (value)
        {
          CFDictionarySetValue(Mutable, CFSTR("altIRK"), value);
          CFRelease(value);
        }
      }
      v3 = (const void *)GestaltCopyAnswer(CFSTR("UserAssignedDeviceName"), 0, 0);
      if (v3)
      {
        v4 = v3;
        CFDictionarySetValue(Mutable, CFSTR("name"), v3);
        CFRelease(v4);
      }
      v5 = (const void *)GestaltCopyAnswer(CFSTR("BluetoothAddress"), 0, 0);
      if (v5)
      {
        v6 = v5;
        CFDictionarySetValue(Mutable, CFSTR("btAddr"), v5);
        CFRelease(v6);
      }
      GetPrimaryMACAddress((char *)bytes, &v19);
      if (!v19)
        CFDictionarySetData(Mutable, CFSTR("mac"), bytes, 6);
      v7 = (const void *)GestaltCopyAnswer(CFSTR("ProductType"), 0, 0);
      if (v7)
      {
        v8 = v7;
        CFDictionarySetValue(Mutable, CFSTR("model"), v7);
        CFRelease(v8);
      }
      v9 = (const void *)GestaltCopyAnswer(CFSTR("WifiAddressData"), 0, 0);
      if (v9)
      {
        v10 = v9;
        CFDictionarySetValue(Mutable, CFSTR("wifiMAC"), v9);
        CFRelease(v10);
      }
      v11 = *(const __CFDictionary **)(a1 + 336);
      if (v11)
        CFDictionaryApplyFunction(v11, (CFDictionaryApplierFunction)_CFDictionaryMergeDictionaryApplier, Mutable);
      v12 = *(const __CFDictionary **)(a1 + 344);
      TypeID = CFDictionaryGetTypeID();
      TypedValue = CFDictionaryGetTypedValue(v12, CFSTR("groupInfoSelf"), TypeID, 0);
      if (TypedValue)
        CFDictionarySetValue(Mutable, CFSTR("groupInfo"), TypedValue);
      *(_QWORD *)(a1 + 328) = Mutable;
    }
  }
  return Mutable;
}

void _PairingSessionIntersectACLApplier(void *key, const void *a2, uint64_t a3)
{
  const void *Value;
  const void *v7;
  __CFDictionary *Mutable;
  int v9;

  if (!*(_DWORD *)(a3 + 16))
  {
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a3 + 8), key);
    if (Value && (v7 = Value, CFEqual(Value, a2)))
    {
      Mutable = *(__CFDictionary **)a3;
      if (*(_QWORD *)a3
        || (Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]),
            (*(_QWORD *)a3 = Mutable) != 0))
      {
        CFDictionarySetValue(Mutable, key, v7);
        return;
      }
      v9 = -6728;
    }
    else
    {
      v9 = -6773;
    }
    *(_DWORD *)(a3 + 16) = v9;
  }
}

void _ClientDecryptExtra(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  int8x16_t *v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  CFDataRef v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int *v13;
  unsigned int v14;
  void *v15;
  CFIndex length;
  UInt8 *bytes;
  unsigned int v18;
  size_t v19;

  v19 = 0;
  v18 = 0;
  v4 = (int8x16_t *)TLV8CopyCoalesced(a2, &a2[a3], 5, &v19, (int *)&v18);
  if (!v4)
    return;
  v5 = (unsigned __int8 *)v4;
  if (v19 <= 0xF)
  {
    v14 = -6743;
    goto LABEL_17;
  }
  v6 = &v4[-1].u8[v19];
  v18 = _chacha20_poly1305_decrypt_all((_DWORD *)(a1 + 414), "PS-Msg04", 8, 0, 0, v4, v19 - 16, v4, (uint64_t)v6, 16);
  if (!v18)
  {
    length = 0;
    bytes = 0;
    v15 = 0;
    TLV8GetOrCopyCoalesced(v5, v6, 28, &bytes, (size_t *)&length, &v15, 0);
    if (bytes)
    {
      v7 = CFDataCreate(0, bytes, length);
      if (v15)
        free(v15);
      if (v7)
      {
        v18 = PairingSessionSetProperty(a1, CFSTR("productData"), v7);
        CFRelease(v7);
        goto LABEL_9;
      }
      v14 = -6728;
LABEL_17:
      v18 = v14;
    }
  }
LABEL_9:
  free(v5);
  v12 = v18;
  if (v18)
  {
    v13 = *(int **)(a1 + 16);
    if (*v13 <= 90)
    {
      if (*v13 != -1)
      {
LABEL_12:
        LogPrintF((uint64_t)v13, (uint64_t)"OSStatus _ClientDecryptExtra(PairingSessionRef, const void *, size_t, const uint8_t *)", 0x5Au, (uint64_t)"### ClientDecryptExtra failed: %#m\n", v8, v9, v10, v11, v12);
        return;
      }
      if (_LogCategory_Initialize((uint64_t)v13, 0x5Au))
      {
        v12 = v18;
        v13 = *(int **)(a1 + 16);
        goto LABEL_12;
      }
    }
  }
}

uint64_t PairingSessionDeleteIdentity(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  pthread_mutex_lock(&gPairingGlobalLock);
  _PairingSessionDeleteIdentity(a1, v2, v3, v4, v5, v6, v7, v8);
  pthread_mutex_unlock(&gPairingGlobalLock);
  return 0;
}

const __CFArray *PairingSessionCopyPeer(int a1, char *a2, uint64_t a3, _DWORD *a4)
{
  __CFArray *v5;
  const __CFArray *v6;
  CFTypeID TypeID;
  const __CFArray *TypedValueAtIndex;
  const __CFArray *v9;
  const __CFArray *v10;
  int v12;

  v12 = 0;
  v5 = _PairingSessionCopyPeers(a1, a2, a3, &v12);
  v6 = v5;
  if (v12)
  {
    v9 = 0;
  }
  else if (CFArrayGetCount(v5) <= 0)
  {
    v9 = 0;
    v12 = -6727;
  }
  else
  {
    TypeID = CFDictionaryGetTypeID();
    TypedValueAtIndex = CFArrayGetTypedValueAtIndex(v6, 0, TypeID, &v12);
    v9 = 0;
    if (!v12)
    {
      v10 = TypedValueAtIndex;
      CFRetain(TypedValueAtIndex);
      v9 = v10;
    }
  }
  if (v6)
    CFRelease(v6);
  if (a4)
    *a4 = v12;
  return v9;
}

__CFArray *PairingSessionCopyPeers(int a1, _DWORD *a2)
{
  return _PairingSessionCopyPeers(a1, 0, 0, a2);
}

uint64_t PairingSessionDeletePeer(uint64_t a1, char *__s, size_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  void *v19;
  CUPairedPeer *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  CUPairingManager *v25;
  dispatch_queue_t v26;
  dispatch_semaphore_t v27;
  NSObject *v28;
  dispatch_time_t v29;
  intptr_t v30;
  _QWORD v32[4];
  NSObject *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  int v38;
  __int128 v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)(a1 + 100) & 4) != 0)
  {
    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = 1;
    v17 = StringToUUIDEx(__s, a3, 0, 0, &v39, a6, a7, a8);
    *((_DWORD *)v36 + 6) = v17;
    if (v17
      && (v39 = 0uLL, v18 = TextToHardwareAddress(__s, a3, 6, (_BYTE *)&v39 + 10), (*((_DWORD *)v36 + 6) = v18) != 0))
    {
      v16 = v18;
    }
    else
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", &v39);
      if (v19)
      {
        v20 = objc_alloc_init(CUPairedPeer);
        -[CUPairedPeer setIdentifier:](v20, "setIdentifier:", v19);
        v21 = *(unsigned int *)(a1 + 100);
        +[CUPairingDaemon sharedPairingDaemon](CUPairingDaemon, "sharedPairingDaemon");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        v24 = (v21 >> 1) & 4;
        if (v22)
        {
          v16 = objc_msgSend(v22, "removePairedPeer:options:", v20, v24);
          *((_DWORD *)v36 + 6) = v16;

        }
        else
        {
          v25 = objc_alloc_init(CUPairingManager);
          v26 = dispatch_queue_create("OSStatus _PairingSessionDeletePeerPairingManager(PairingSessionRef, const void *, size_t)", 0);
          -[CUPairingManager setDispatchQueue:](v25, "setDispatchQueue:", v26);

          if ((*(_BYTE *)(a1 + 100) & 0x40) != 0)
            -[CUPairingManager setTargetUserSession:](v25, "setTargetUserSession:", 1);
          v27 = dispatch_semaphore_create(0);
          v32[0] = MEMORY[0x1E0C809B0];
          v32[1] = 3221225472;
          v32[2] = ___PairingSessionDeletePeerPairingManager_block_invoke;
          v32[3] = &unk_1E25DEEE0;
          v34 = &v35;
          v28 = v27;
          v33 = v28;
          -[CUPairingManager removePairedPeer:options:completion:](v25, "removePairedPeer:options:completion:", v20, v24, v32);

          v29 = dispatch_time(0, 120000000000);
          v30 = dispatch_semaphore_wait(v28, v29);
          -[CUPairingManager invalidate](v25, "invalidate");
          if (v30)
          {
            *((_DWORD *)v36 + 6) = -6722;

            v16 = 4294960574;
          }
          else
          {
            v16 = *((unsigned int *)v36 + 6);

          }
        }
      }
      else
      {
        v16 = 4294960588;
        *((_DWORD *)v36 + 6) = -6708;
      }
    }
    _Block_object_dispose(&v35, 8);
  }
  else
  {
    pthread_mutex_lock(&gPairingGlobalLock);
    _PairingSessionDeletePeer(a1, __s, a3, v11, v12, v13, v14, v15);
    pthread_mutex_unlock(&gPairingGlobalLock);
    return 0;
  }
  return v16;
}

void sub_18D4F7E58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  _Unwind_Resume(exception_object);
}

uint64_t PairingSessionFindPeer(uint64_t a1, char *a2, size_t a3, _OWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return PairingSessionFindPeerEx(a1, a2, a3, a4, 0, a6, a7, a8);
}

uint64_t PairingSessionUpdatePeerInfo(uint64_t a1, char *__s, uint64_t a3, const void *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t Formatted;
  CFDataRef Data;
  uint64_t v17;
  uint64_t v18;
  CFDataRef v19;
  int *v20;
  const __CFDictionary *v22;

  v22 = 0;
  if (a3 == -1)
    strlen(__s);
  pthread_mutex_lock(&gPairingGlobalLock);
  Formatted = CFPropertyListCreateFormatted(0, (CFTypeRef *)&v22, (uint64_t)"{%kO=%O%kO=%O%kO=%i%kO=%.*s%kO=%O}", v6, v7, v8, v9, v10, *MEMORY[0x1E0CD6C98]);
  if (!(_DWORD)Formatted)
  {
    Data = CFPropertyListCreateData(0, a4, kCFPropertyListBinaryFormat_v1_0, 0, 0);
    if (Data)
    {
      v19 = Data;
      Formatted = KeychainUpdateFormatted(v22, (uint64_t)"{%kO=%O}", v17, v18, v11, v12, v13, v14, *MEMORY[0x1E0CD69B0]);
      CFRelease(v19);
      if (!(_DWORD)Formatted)
        goto LABEL_10;
    }
    else
    {
      Formatted = 4294960596;
    }
  }
  v20 = *(int **)(a1 + 16);
  if (*v20 <= 60)
  {
    if (*v20 != -1)
    {
LABEL_8:
      LogPrintF((uint64_t)v20, (uint64_t)"OSStatus PairingSessionUpdatePeerInfo(PairingSessionRef, const void *, size_t, CFDictionaryRef)", 0x3Cu, (uint64_t)"### Update %@ %.*s info failed: %#m\n", v11, v12, v13, v14, *(_QWORD *)(a1 + 784));
      goto LABEL_10;
    }
    if (_LogCategory_Initialize((uint64_t)v20, 0x3Cu))
    {
      v20 = *(int **)(a1 + 16);
      goto LABEL_8;
    }
  }
LABEL_10:
  if (v22)
    CFRelease(v22);
  pthread_mutex_unlock(&gPairingGlobalLock);
  return Formatted;
}

void PairingSessionSetCopyIdentityHandler_b(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  const void *v6;
  const void *v7;
  id v8;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v8 = v3;
    v5 = objc_msgSend(v3, "copy");
    v6 = *(const void **)(a1 + 960);
    if (v6)
      CFRelease(v6);
    *(_QWORD *)(a1 + 960) = v5;
    v4 = v8;
  }
  else
  {
    v7 = *(const void **)(a1 + 960);
    if (v7)
    {
      CFRelease(v7);
      v4 = 0;
      *(_QWORD *)(a1 + 960) = 0;
    }
  }

}

void PairingSessionSetFindPeerHandler_b(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  const void *v6;
  const void *v7;
  id v8;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v8 = v3;
    v5 = objc_msgSend(v3, "copy");
    v6 = *(const void **)(a1 + 968);
    if (v6)
      CFRelease(v6);
    *(_QWORD *)(a1 + 968) = v5;
    v4 = v8;
  }
  else
  {
    v7 = *(const void **)(a1 + 968);
    if (v7)
    {
      CFRelease(v7);
      v4 = 0;
      *(_QWORD *)(a1 + 968) = 0;
    }
  }

}

void PairingSessionSetSavePeerHandler_b(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  const void *v6;
  const void *v7;
  id v8;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v8 = v3;
    v5 = objc_msgSend(v3, "copy");
    v6 = *(const void **)(a1 + 976);
    if (v6)
      CFRelease(v6);
    *(_QWORD *)(a1 + 976) = v5;
    v4 = v8;
  }
  else
  {
    v7 = *(const void **)(a1 + 976);
    if (v7)
    {
      CFRelease(v7);
      v4 = 0;
      *(_QWORD *)(a1 + 976) = 0;
    }
  }

}

uint64_t PairingSessionSetMyAppleID(uint64_t a1, CFTypeRef cf)
{
  const void *v4;

  v4 = *(const void **)(a1 + 816);
  if (cf)
    CFRetain(cf);
  *(_QWORD *)(a1 + 816) = cf;
  if (v4)
    CFRelease(v4);
  return 0;
}

uint64_t PairingSessionSetMyAppleIDInfoClient(uint64_t a1, void *a2)
{
  id v3;
  const void *v4;

  v3 = a2;
  v4 = *(const void **)(a1 + 840);
  if (v4)
    CFRelease(v4);
  *(_QWORD *)(a1 + 840) = v3;

  return 0;
}

uint64_t PairingSessionSetPeerAppleID(uint64_t a1, CFTypeRef cf)
{
  const void *v4;
  const void *v5;

  v4 = *(const void **)(a1 + 824);
  if (cf)
    CFRetain(cf);
  *(_QWORD *)(a1 + 824) = cf;
  if (v4)
    CFRelease(v4);
  v5 = *(const void **)(a1 + 832);
  if (v5)
  {
    CFRelease(v5);
    *(_QWORD *)(a1 + 832) = 0;
  }
  return 0;
}

uint64_t PairingSessionSetPeerAppleIDs(uint64_t a1, CFTypeRef cf)
{
  const void *v4;
  const void *v5;

  v4 = *(const void **)(a1 + 832);
  if (cf)
    CFRetain(cf);
  *(_QWORD *)(a1 + 832) = cf;
  if (v4)
    CFRelease(v4);
  v5 = *(const void **)(a1 + 824);
  if (v5)
  {
    CFRelease(v5);
    *(_QWORD *)(a1 + 824) = 0;
  }
  return 0;
}

uint64_t PrintFRegisterExtension(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v6;
  uint64_t v7;
  size_t v8;
  _QWORD *v9;
  _QWORD *v10;

  pthread_mutex_lock(&gPrintFUtilsLock);
  v6 = &gExtensionList;
  while (1)
  {
    v6 = (uint64_t *)*v6;
    if (!v6)
      break;
    if (!strcasecmp((const char *)v6 + 24, a1))
    {
      v7 = 4294960566;
      goto LABEL_7;
    }
  }
  v8 = strlen(a1);
  v9 = malloc_type_malloc(v8 + 25, 0xB6036271uLL);
  if (v9)
  {
    v10 = v9;
    v9[1] = a2;
    v9[2] = a3;
    memcpy(v9 + 3, a1, v8 + 1);
    v7 = 0;
    *v10 = gExtensionList;
    gExtensionList = (uint64_t)v10;
  }
  else
  {
    v7 = 4294960568;
  }
LABEL_7:
  pthread_mutex_unlock(&gPrintFUtilsLock);
  return v7;
}

uint64_t PrintFDeregisterExtension(const char *a1)
{
  char *v2;
  char *v3;
  uint64_t v4;

  pthread_mutex_lock(&gPrintFUtilsLock);
  v2 = (char *)&gExtensionList;
  while (1)
  {
    v3 = v2;
    v2 = *(char **)v2;
    if (!v2)
      break;
    if (!strcasecmp(v2 + 24, a1))
    {
      *(_QWORD *)v3 = *(_QWORD *)v2;
      free(v2);
      v4 = 0;
      goto LABEL_6;
    }
  }
  v4 = 4294960569;
LABEL_6:
  pthread_mutex_unlock(&gPrintFUtilsLock);
  return v4;
}

uint64_t CFAppendPrintF(CFMutableStringRef *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return CFAppendPrintV(a1, a2, (uint64_t)&a9);
}

uint64_t CFAppendPrintV(CFMutableStringRef *a1, uint64_t a2, uint64_t a3)
{
  CFMutableStringRef Mutable;
  char *v7;
  char *cStr;

  if (!*a1)
  {
    Mutable = CFStringCreateMutable(0, 0);
    *a1 = Mutable;
    if (!Mutable)
      return 4294960568;
  }
  cStr = 0;
  VASPrintF((void **)&cStr, a2, a3);
  v7 = cStr;
  if (!cStr)
    return 4294960568;
  CFStringAppendCString(*a1, cStr, 0x8000100u);
  free(v7);
  return 0;
}

uint64_t SNPrintF_Add(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v14;

  v9 = *a1;
  v10 = a2 - *a1;
  if (a2 == *a1)
    return 4294960533;
  result = VSNPrintF(v9, v10, a3, (uint64_t)&a9);
  if ((result & 0x80000000) == 0)
  {
    v14 = v9 + result;
    if ((int)result < (int)v10)
    {
      result = 0;
    }
    else
    {
      v14 = a2;
      result = 4294960545;
    }
    *a1 = v14;
  }
  return result;
}

uint64_t PrintFWriteMultiLineText(uint64_t (**a1)(unsigned __int8 *, int64_t, _QWORD), uint64_t a2, unsigned __int8 *a3, uint64_t a4)
{
  unsigned __int8 *v4;
  uint64_t v6;
  unint64_t v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  int v10;
  int v11;
  int v12;
  int v14;
  uint64_t v15;
  int64_t v16;

  if (a4 < 1)
    return 0;
  v4 = a3;
  v6 = 0;
  v7 = (unint64_t)&a3[a4];
  while (1)
  {
    v8 = v4;
    v9 = v4;
    while (1)
    {
      v10 = *v9;
      if (v10 == 10)
        break;
      if (v10 == 13)
      {
        if ((unint64_t)(v9 + 1) < v7 && v9[1] == 10)
        {
          v4 = v9 + 2;
          goto LABEL_12;
        }
        break;
      }
      if ((unint64_t)++v9 >= v7)
      {
        v11 = 0;
        v4 = v9;
        goto LABEL_13;
      }
    }
    v4 = v9 + 1;
LABEL_12:
    v11 = 1;
LABEL_13:
    if (v8 >= v9)
      goto LABEL_24;
    v12 = *v8;
    if (v12 != 10 && v12 != 13)
    {
      v14 = *(_DWORD *)(a2 + 8);
      if (v14)
        break;
    }
LABEL_22:
    v16 = v9 - v8;
    v15 = (*a1)(v8, v16, a1);
    if ((v15 & 0x80000000) != 0)
      return v15;
    v6 = (v6 + v16);
LABEL_24:
    if (v11)
    {
      v15 = (*a1)("\n", 1, a1);
      if ((v15 & 0x80000000) != 0)
        return v15;
      v6 = (v6 + 1);
    }
    if ((unint64_t)v4 >= v7)
      return v6;
  }
  LODWORD(v6) = v6 + 4 * v14;
  while (1)
  {
    v15 = (*a1)("    ", 4, a1);
    if ((v15 & 0x80000000) != 0)
      return v15;
    if (!--v14)
      goto LABEL_22;
  }
}

uint64_t PrintFWriteHex(uint64_t (**a1)(const char *, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  char v15;
  unint64_t v16;
  int v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  BOOL v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t (**v57)(const char *, uint64_t, _QWORD);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  int v84;
  uint64_t v87;
  int v89;
  char *v90;
  uint64_t v91;
  char *v94;
  _BYTE v95[64];
  char v96;
  char v97;
  uint64_t v98;

  v84 = a7;
  v8 = a4;
  v87 = 0;
  v9 = 0;
  v89 = 0;
  v98 = *MEMORY[0x1E0C80C00];
  if (a5 >= a6)
    v10 = a6;
  else
    v10 = a5;
  v91 = (4 * a3);
  v11 = &v96;
  v12 = &v97;
  while (1)
  {
    v13 = 0;
    v14 = v10 >= 0x10 ? 16 : v10;
    v94 = v12;
    do
    {
      if (v13 && (v13 & 3) == 0)
        *v12++ = 32;
      if (v13 >= v14)
      {
        v15 = 32;
        *v12 = 32;
      }
      else
      {
        *v12 = a0123456789abcd[(unint64_t)*(unsigned __int8 *)(v8 + v13) >> 4];
        v15 = a0123456789abcd[*(_BYTE *)(v8 + v13) & 0xF];
      }
      v12[1] = v15;
      v12 += 2;
      ++v13;
    }
    while (v13 != 16);
    v16 = 0;
    *v12 = 0;
    do
    {
      if (v16 >= v14)
      {
        LOBYTE(v17) = 32;
      }
      else
      {
        v17 = *(unsigned __int8 *)(v8 + v16);
        if ((v17 - 32) >= 0x5F)
          LOBYTE(v17) = 94;
      }
      v95[v16++] = v17;
    }
    while (v16 != 16);
    v95[16] = 0;
    if (a5 > 0x10)
    {
      if (v8 == a4)
      {
        v90 = v11;
        v26 = PrintFCore((uint64_t)a1, (uint64_t)"%*s", a3, a4, a5, a6, a7, a8, v91);
        if ((v26 & 0x80000000) != 0)
          return v26;
        v27 = PrintFCore((uint64_t)a1, (uint64_t)"+%04X: %s |%s| (%zu bytes)", v51, v52, v53, v54, v55, v56, 0);
        if ((v27 & 0x80000000) != 0)
          return v27;
        v50 = v26 + v9;
LABEL_49:
        v9 = (v50 + v27);
        v11 = v90;
        goto LABEL_50;
      }
      if (*(char *)(a2 + 24) < 1
        || (*(_QWORD *)v94 == *(_QWORD *)v11 ? (v28 = *((_QWORD *)v94 + 1) == *((_QWORD *)v11 + 1)) : (v28 = 0),
            v28 ? (v29 = *((_QWORD *)v94 + 2) == *((_QWORD *)v11 + 2)) : (v29 = 0),
            v29 ? (v30 = *((_QWORD *)v94 + 3) == *((_QWORD *)v11 + 3)) : (v30 = 0),
            !v30))
      {
        v27 = (*a1)("\n", 1);
        if ((v27 & 0x80000000) != 0)
          return v27;
        v90 = v11;
        v37 = v9 + 1;
        if (v89 >= 1)
        {
          v9 = PrintFCore((uint64_t)a1, (uint64_t)"%*s", v31, v32, v33, v34, v35, v36, v91);
          if ((v9 & 0x80000000) != 0)
            return v9;
          v27 = PrintFCore((uint64_t)a1, (uint64_t)"* (%zu more identical bytes, %zu total)\n", v38, v39, v40, v41, v42, v43, v87);
          if ((v27 & 0x80000000) != 0)
            return v27;
          v89 = 0;
          v87 = 0;
          v37 += v9 + v27;
        }
        v9 = PrintFCore((uint64_t)a1, (uint64_t)"%*s", v31, v32, v33, v34, v35, v36, v91);
        if ((v9 & 0x80000000) != 0)
          return v9;
        v27 = PrintFCore((uint64_t)a1, (uint64_t)"+%04X: %s |%s|", v44, v45, v46, v47, v48, v49, v8 - a4);
        if ((v27 & 0x80000000) != 0)
          return v27;
        v50 = v9 + v37;
        goto LABEL_49;
      }
      ++v89;
      v87 += v14;
    }
    else
    {
      v18 = v10;
      v19 = v11;
      v26 = PrintFCore((uint64_t)a1, (uint64_t)"%*s", a3, a4, a5, a6, a7, a8, v91);
      if ((v26 & 0x80000000) != 0)
        return v26;
      v27 = PrintFCore((uint64_t)a1, (uint64_t)"%s |%s| (%zu bytes)", v20, v21, v22, v23, v24, v25, (uint64_t)v94);
      if ((v27 & 0x80000000) != 0)
        return v27;
      v9 = (v26 + v9 + v27);
      v11 = v19;
      v10 = v18;
    }
LABEL_50:
    v10 -= v14;
    if (!v10)
      break;
    v8 += v14;
    v12 = v11;
    v11 = v94;
  }
  if (v89 < 1)
  {
    v57 = (uint64_t (**)(const char *, uint64_t, _QWORD))a1;
LABEL_59:
    if (a5 > a6)
    {
      v27 = (*v57)("\n", 1, v57);
      if ((v27 & 0x80000000) != 0)
        return v27;
      v26 = PrintFCore((uint64_t)v57, (uint64_t)"%*s", v70, v71, v72, v73, v74, v75, v91);
      if ((v26 & 0x80000000) != 0)
        return v26;
      v27 = PrintFCore((uint64_t)v57, (uint64_t)"... %zu more bytes ...", v76, v77, v78, v79, v80, v81, a5 - a6);
      if ((v27 & 0x80000000) != 0)
        return v27;
      v9 = (v9 + v26 + v27 + 1);
    }
    if (v84)
    {
      v82 = (*v57)("\n", 1, v57);
      if (v82 >= 0)
        return (v9 + 1);
      else
        return v82;
    }
  }
  else
  {
    v57 = (uint64_t (**)(const char *, uint64_t, _QWORD))a1;
    v27 = ((uint64_t (*)(const char *, uint64_t, uint64_t (**)(const char *, uint64_t)))*a1)("\n", 1, a1);
    if ((v27 & 0x80000000) != 0)
      return v27;
    v26 = PrintFCore((uint64_t)a1, (uint64_t)"%*s", v58, v59, v60, v61, v62, v63, v91);
    if ((v26 & 0x80000000) == 0)
    {
      v27 = PrintFCore((uint64_t)a1, (uint64_t)"* (%zu more identical bytes, %zu total)", v64, v65, v66, v67, v68, v69, v87);
      if ((v27 & 0x80000000) == 0)
      {
        v9 = (v9 + v26 + v27 + 1);
        goto LABEL_59;
      }
      return v27;
    }
    return v26;
  }
  return v9;
}

uint64_t _PrintFObfuscateIPv4(unsigned __int8 *a1, _BYTE *a2)
{
  uint64_t result;

  if (gObfuscateOnce != -1)
    dispatch_once_f(&gObfuscateOnce, 0, (dispatch_function_t)_PrintFObfuscateInit);
  result = SipHash(gObfuscateKey, a1, 4);
  *a2 = -69;
  a2[1] = BYTE2(result);
  a2[2] = BYTE1(result);
  a2[3] = result;
  return result;
}

void _PrintFObfuscateHardwareAddress(unsigned __int8 *a1, unint64_t a2, _WORD *a3)
{
  unint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;

  if (gObfuscateOnce != -1)
    dispatch_once_f(&gObfuscateOnce, 0, (dispatch_function_t)_PrintFObfuscateInit);
  v6 = SipHash(gObfuscateKey, a1, a2);
  *a3 = 187;
  v7 = a3 + 1;
  v8 = 8;
  if (a2 < 8)
    v8 = a2;
  v9 = v8 - 2;
  do
  {
    *v7++ = v6;
    v6 >>= 8;
    --v9;
  }
  while (v9);
  if (a2 >= 9)
    bzero((char *)a3 + v8, a2 - v8);
}

uint64_t _PrintFObfuscateIPv6(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t result;

  if (gObfuscateOnce != -1)
    dispatch_once_f(&gObfuscateOnce, 0, (dispatch_function_t)_PrintFObfuscateInit);
  result = SipHash(gObfuscateKey, a1, 16);
  *(_BYTE *)a2 = -69;
  *(_QWORD *)(a2 + 1) = 0;
  *(_DWORD *)(a2 + 8) = 0;
  *(_DWORD *)(a2 + 12) = bswap32(result);
  return result;
}

uint64_t _PrintFObfuscateInit()
{
  return RandomBytes(&gObfuscateKey, 0x10uLL);
}

uint64_t PrintFWriteMaskObject(uint64_t (**a1)(unsigned __int8 *, uint64_t, _QWORD), const __CFURL *cf)
{
  const __CFURL *v2;
  CFTypeID TypeID;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;
  size_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t Length;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned __int8 *BytePtr;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  int v40;
  unsigned __int8 *v41;
  uint64_t v42;
  int v43;
  char *v44;
  int v45;
  char *v46;
  char *v47;
  int v48;
  unint64_t v49;
  size_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  int v56;
  int v57;
  size_t v58;
  char *v59;
  void *v60;

  v2 = cf;
  v60 = 0;
  TypeID = CFGetTypeID(cf);
  if (TypeID == CFURLGetTypeID())
  {
    v2 = (const __CFURL *)CFURLGetString(v2);
    TypeID = CFStringGetTypeID();
  }
  if (TypeID == CFStringGetTypeID())
  {
    v58 = 0;
    v59 = 0;
    v5 = CFStringGetOrCopyCStringUTF8((const __CFString *)v2, (const char **)&v59, (UInt8 **)&v60, &v58);
    if (!(_DWORD)v5)
    {
      v10 = v58;
      v9 = (unsigned __int8 *)v59;
      if (v58 < 0x24 || StringToUUIDEx(v59, v58, 1, 0, 0, v6, v7, v8))
      {
        if (stricmp_prefix(v9, "http://"))
        {
          if (!stricmp_prefix(v9, "https://"))
            goto LABEL_24;
          if (stricmp_prefix(v9, "mailto:"))
          {
            if (stricmp_prefix(v9, "file:///"))
            {
              if (stricmp_prefix(v9, "tel:"))
              {
                v17 = *v9;
                v18 = 1;
                if ((v17 > 0x2F || ((1 << v17) & 0x881000000000) == 0) && v17 != 126)
                {
                  v19 = 0;
                  v20 = (char *)v9;
                  goto LABEL_27;
                }
              }
              else
              {
                v18 = 4;
              }
LABEL_25:
              v38 = (*a1)(v9, v18, a1);
              if ((v38 & 0x80000000) != 0)
              {
                v19 = 0;
                goto LABEL_112;
              }
              v19 = v38;
              v20 = (char *)&v9[v18];
              v59 = v20;
LABEL_27:
              if (stricmp_prefix((unsigned __int8 *)v20, "www."))
              {
                if (stricmp_prefix((unsigned __int8 *)v20, "+1-"))
                {
                  if (stricmp_prefix((unsigned __int8 *)v20, "1-")
                    && stricmp_prefix((unsigned __int8 *)v20, "+1"))
                  {
                    if (*v20 != 49)
                      goto LABEL_38;
                    v39 = 1;
                  }
                  else
                  {
                    v39 = 2;
                  }
                }
                else
                {
                  v39 = 3;
                }
              }
              else
              {
                v39 = 4;
              }
              v40 = (*a1)((unsigned __int8 *)v20, v39, a1);
              if (v40 < 0)
                goto LABEL_112;
              v19 = (v40 + v19);
              v20 += v39;
              v59 = v20;
LABEL_38:
              v41 = &v9[v10];
              if ((unint64_t)(v41 - (unsigned __int8 *)v20) >= 2)
                v42 = 2;
              else
                v42 = v41 - (unsigned __int8 *)v20;
              v43 = (*a1)((unsigned __int8 *)v20, v42, a1);
              if (v43 < 0)
                goto LABEL_112;
              v19 = (v43 + v19);
              v44 = &v59[v42];
              v59 += v42;
              v45 = (*a1)("*", 1, a1);
              if (v45 < 0)
                goto LABEL_112;
              v19 = (v45 + v19);
              v46 = strchr(v44, 64);
              v47 = v46;
              if (v46)
              {
                v48 = (*a1)((unsigned __int8 *)v46, 1, a1);
                if (v48 < 0)
                  goto LABEL_112;
                v19 = (v48 + v19);
                v44 = v47 + 1;
                v59 = v47 + 1;
              }
              v49 = v41 - (unsigned __int8 *)v44;
              v58 = v41 - (unsigned __int8 *)v44;
              v50 = v41 - (unsigned __int8 *)v44;
              if ((unint64_t)(v41 - (unsigned __int8 *)v44) >= 9)
              {
                v51 = 9;
                if (!memicmp(v41 - 9, "gmail.com", 9))
                  goto LABEL_99;
                v50 = v58;
                if (v58 >= 0xA)
                {
                  v51 = 10;
                  if (!memicmp((unsigned __int8 *)&v44[v58 - 10], "icloud.com", 10))
                    goto LABEL_99;
                  v50 = v58;
                }
                if (v50 >= 9)
                {
                  v51 = 9;
                  if (!memicmp((unsigned __int8 *)&v44[v50 - 9], "yahoo.com", 9))
                    goto LABEL_99;
                  v50 = v58;
                }
              }
              if (v50 >= 7)
              {
                v51 = 7;
                if (!memicmp((unsigned __int8 *)&v44[v50 - 7], "mac.com", 7))
                  goto LABEL_99;
                v50 = v58;
              }
              if (v50 >= 6)
              {
                v51 = 6;
                if (!memicmp((unsigned __int8 *)&v44[v50 - 6], "me.com", 6))
                  goto LABEL_99;
                v50 = v58;
                if (v58 >= 9)
                {
                  v51 = 9;
                  if (!memicmp((unsigned __int8 *)&v44[v58 - 9], "apple.com", 9))
                    goto LABEL_99;
                  v50 = v58;
                  if (v58 >= 0xF)
                  {
                    v51 = 15;
                    if (!memicmp((unsigned __int8 *)&v44[v58 - 15], ".com/index.html", 15))
                      goto LABEL_99;
                    v50 = v58;
                  }
                  if (v50 >= 0xB)
                  {
                    v51 = 11;
                    if (!memicmp((unsigned __int8 *)&v44[v50 - 11], "/index.html", 11))
                      goto LABEL_99;
                    v50 = v58;
                  }
                  if (v50 >= 0xA)
                  {
                    v51 = 10;
                    if (!memicmp((unsigned __int8 *)&v44[v50 - 10], "index.html", 10))
                      goto LABEL_99;
                    v50 = v58;
                  }
                }
              }
              if (v50 >= 5)
              {
                v51 = 5;
                if (!memicmp((unsigned __int8 *)&v44[v50 - 5], ".html", 5))
                  goto LABEL_99;
                v50 = v58;
                if (v58 >= 5)
                {
                  v51 = 5;
                  if (!memicmp((unsigned __int8 *)&v44[v58 - 5], ".jpeg", 5))
                    goto LABEL_99;
                  v50 = v58;
                }
              }
              if (v50 < 4)
                goto LABEL_83;
              v51 = 4;
              if (!memicmp((unsigned __int8 *)&v44[v50 - 4], ".com", 4))
                goto LABEL_99;
              if (v58 < 4)
                goto LABEL_83;
              v51 = 4;
              if (!memicmp((unsigned __int8 *)&v44[v58 - 4], ".net", 4))
                goto LABEL_99;
              if (v58 < 4)
                goto LABEL_83;
              v51 = 4;
              if (!memicmp((unsigned __int8 *)&v44[v58 - 4], ".jpg", 4))
                goto LABEL_99;
              if (v58 < 4)
                goto LABEL_83;
              v51 = 4;
              if (!memicmp((unsigned __int8 *)&v44[v58 - 4], ".pdf", 4))
                goto LABEL_99;
              if (v58 < 4)
                goto LABEL_83;
              v51 = 4;
              if (!memicmp((unsigned __int8 *)&v44[v58 - 4], ".png", 4))
                goto LABEL_99;
              if (v58 < 4)
                goto LABEL_83;
              v51 = 4;
              if (!memicmp((unsigned __int8 *)&v44[v58 - 4], ".txt", 4))
                goto LABEL_99;
              if (v58 < 4)
                goto LABEL_83;
              v51 = 4;
              if (!memicmp((unsigned __int8 *)&v44[v58 - 4], ".bin", 4))
                goto LABEL_99;
              if (v58 < 5)
              {
LABEL_83:
                v51 = 0;
                v52 = 0;
LABEL_101:
                if (v49 >= 2)
                  v54 = 2;
                else
                  v54 = v49;
                if (!v54)
                {
LABEL_110:
                  if (v52)
                  {
                    v57 = (*a1)(v41, v51, a1);
                    v19 = (v57 & ~(v57 >> 31)) + v19;
                  }
                  goto LABEL_112;
                }
                if (v47)
                {
                  v55 = (*a1)("*", 1, a1);
                  if (v55 < 0)
                    goto LABEL_112;
                  v19 = (v55 + v19);
                }
                v56 = (*a1)(&v41[-v54], v54, a1);
                if ((v56 & 0x80000000) == 0)
                {
                  v19 = (v56 + v19);
                  goto LABEL_110;
                }
LABEL_112:
                if (v60)
                  free(v60);
                return v19;
              }
              v51 = 5;
              if (memicmp((unsigned __int8 *)&v44[v58 - 5], " iPad", 5))
              {
                if (v58 < 7)
                  goto LABEL_83;
                v51 = 7;
                if (memicmp((unsigned __int8 *)&v44[v58 - 7], " iPhone", 7))
                  goto LABEL_83;
                v53 = -7;
LABEL_100:
                v41 += v53;
                v49 = v41 - (unsigned __int8 *)v44;
                v52 = 1;
                goto LABEL_101;
              }
LABEL_99:
              v53 = -v51;
              goto LABEL_100;
            }
LABEL_24:
            v18 = 8;
            goto LABEL_25;
          }
        }
        v18 = 7;
        goto LABEL_25;
      }
      v5 = PrintFCore((uint64_t)a1, (uint64_t)"U<%.4s*%.4s>", v11, v12, v13, v14, v15, v16, (uint64_t)v9);
    }
    v19 = v5;
    goto LABEL_112;
  }
  if (TypeID != CFDataGetTypeID())
    return PrintFCore((uint64_t)a1, (uint64_t)"<<UNSUPPORTED OBJ: %d>>", v21, v22, v23, v24, v25, v26, TypeID);
  Length = CFDataGetLength(v2);
  if (Length >= 0x80)
    v34 = 128;
  else
    v34 = Length;
  if (v34)
  {
    BytePtr = (unsigned __int8 *)CFDataGetBytePtr(v2);
    v36 = SipHash(qword_18D51F696, BytePtr, v34) & 0xFFFFFF;
  }
  else
  {
    v36 = 0;
  }
  return PrintFCore((uint64_t)a1, (uint64_t)"H<%06x>", v28, v29, v30, v31, v32, v33, v36);
}

uint64_t PrintFWriteSingleLineText(uint64_t (**a1)(unsigned __int8 *, int64_t, _QWORD), unsigned __int8 *a2, uint64_t a3, int a4)
{
  unsigned __int8 *v5;
  uint64_t v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  int v10;
  uint64_t v12;
  uint64_t v13;
  int v14;
  const char *v16;
  uint64_t v17;

  if (a3 >= 1)
  {
    v5 = a2;
    v7 = 0;
    v8 = &a2[a3];
    while (1)
    {
      v9 = v5;
      do
      {
        v10 = *v9;
        if (v10 == 10 || v10 == 13)
          break;
        ++v9;
      }
      while (v9 < v8);
      if (v5 < v9)
      {
        v12 = (*a1)(v5, v9 - v5, a1);
        if ((v12 & 0x80000000) != 0)
          return v12;
        v7 = (v12 + v7);
      }
      if (v9 >= v8)
      {
        v5 = v9;
      }
      else
      {
        v13 = v8 - v9;
        v5 = v9;
        while (1)
        {
          v14 = *v5;
          if (v14 != 13 && v14 != 10)
            break;
          ++v5;
          if (!--v13)
          {
            v5 = v8;
            goto LABEL_22;
          }
        }
        if (v9 < v5)
        {
          if (a4)
          {
            v16 = " ";
            v17 = 1;
          }
          else
          {
            v16 = " ⏎ ";
            v17 = 5;
          }
          v12 = (*a1)((unsigned __int8 *)v16, v17, a1);
          if ((v12 & 0x80000000) != 0)
            return v12;
          v7 = (v12 + v7);
        }
      }
LABEL_22:
      if (v5 >= v8)
        return v7;
    }
  }
  return 0;
}

uint64_t PrintFWriteTLV8(uint64_t a1, uint64_t a2, const char *a3, unsigned __int8 *a4, uint64_t a5)
{
  unsigned __int8 *v5;
  unint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned __int8 *v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  const char *i;
  unsigned int v14;
  uint64_t v16;
  uint64_t v17;
  unsigned __int8 *v18;
  unsigned __int8 *v19;
  int v20;
  const char *j;
  const char *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned __int8 *v31;
  int v32;
  _BOOL4 v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;

  v5 = a4;
  v6 = (unint64_t)&a4[a5];
  if (a5 < 2)
  {
    v8 = 0;
  }
  else
  {
    v47 = a5;
    v7 = 0;
    v8 = 0;
    v9 = a4;
    do
    {
      v10 = v9[1];
      v11 = (unint64_t)&v9[v10 + 2];
      if (v11 > v6)
        break;
      v12 = *v9;
      v9 += v10 + 2;
      for (i = a3; ; i += v14 + 2)
      {
        v14 = strlen(i + 1);
        if (!v14)
          break;
        if (v8 < v14 && *(unsigned __int8 *)i == v12)
          v8 = v14;
      }
      if (v7 <= v10)
        v7 = v10;
    }
    while ((uint64_t)(v6 - v11) >= 2);
    a5 = v47;
  }
  if (a5 >= 2)
  {
    v16 = 0;
    while (1)
    {
      v17 = v5[1];
      v18 = v5 + 2;
      v19 = &v5[v17 + 2];
      if ((unint64_t)v19 > v6)
        return v16;
      v20 = *v5;
      v5 += v17 + 2;
      for (j = a3; ; j = &v22[v23 + 1])
      {
        v22 = j + 1;
        v23 = strlen(j + 1);
        if (!v23)
          break;
        if (*(unsigned __int8 *)j == v20)
          goto LABEL_25;
      }
      v22 = 0;
LABEL_25:
      if ((_DWORD)v17)
      {
        v30 = v17 - 1;
        v31 = v18;
        do
        {
          v32 = *v31++;
          v33 = (v32 - 32) < 0x5F;
        }
        while ((v32 - 32) <= 0x5E && v30-- != 0);
      }
      else
      {
        v33 = 1;
      }
      v35 = PrintFCore(a1, (uint64_t)"%*s0x%02X", v24, v25, v26, v27, v28, v29, (4 * *(_DWORD *)(a2 + 8)));
      if ((v35 & 0x80000000) != 0)
        return v35;
      v42 = v35 + v16;
      if (v22)
      {
        v43 = PrintFCore(a1, (uint64_t)" (%s)", v36, v37, v38, v39, v40, v41, (uint64_t)v22);
        v16 = v43;
        if ((v43 & 0x80000000) != 0)
          return v16;
        v42 += v43;
        v44 = v8 - strlen(v22);
        if ((_DWORD)v17)
        {
LABEL_38:
          if (v33)
          {
            v45 = PrintFCore(a1, (uint64_t)", %*s%*u bytes, \"%.*s\"\n", v36, v37, v38, v39, v40, v41, v44);
          }
          else if (v17 > 0x10)
          {
            v45 = PrintFCore(a1, (uint64_t)"\n%*.1H", v36, v37, v38, v39, v40, v41, (*(_DWORD *)(a2 + 8) + 1));
          }
          else
          {
            v45 = PrintFCore(a1, (uint64_t)", %*s%*u bytes, %#H\n", v36, v37, v38, v39, v40, v41, v44);
          }
          goto LABEL_45;
        }
      }
      else
      {
        v44 = v8 + 3;
        if ((_DWORD)v17)
          goto LABEL_38;
      }
      v45 = PrintFCore(a1, (uint64_t)", %*s%*u bytes\n", v36, v37, v38, v39, v40, v41, v44);
LABEL_45:
      v16 = v45;
      if ((v45 & 0x80000000) == 0)
      {
        v16 = (v45 + v42);
        if ((uint64_t)(v6 - (_QWORD)v19) > 1)
          continue;
      }
      return v16;
    }
  }
  return 0;
}

uint64_t PrintFWriteTXTRecord(uint64_t a1, char a2, uint64_t a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned __int8 *v9;
  unsigned __int8 *v11;
  uint64_t v12;
  const char *v13;
  _BYTE *v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  unsigned __int8 *v20;
  unint64_t v21;
  int v22;
  unsigned __int8 *v23;
  char *v24;
  unsigned __int8 *v25;
  int v26;
  int v27;
  int v28;
  uint64_t v30;
  char v31;
  uint64_t v32;

  v9 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v11 = &a4[a5];
  if (a2)
  {
    if (a5 < 1)
      return 0;
    v12 = 0;
    v13 = "";
    do
    {
      v16 = *v9;
      v14 = v9 + 1;
      v15 = v16;
      if (v11 - v14 < (unint64_t)v16)
        break;
      v17 = PrintFCore(a1, (uint64_t)"%s%.*s", a3, (uint64_t)a4, a5, a6, a7, a8, (uint64_t)v13);
      if ((v17 & 0x80000000) != 0)
        return v17;
      v12 = (v17 + v12);
      v9 = &v14[v15];
      v13 = " | ";
    }
    while (v9 < v11);
    return v12;
  }
  v18 = (4 * a3);
  if ((unint64_t)a5 < 6 || (*(_DWORD *)(a4 + 1) == 1095590263 ? (v19 = a4[5] == 61) : (v19 = 0), !v19))
  {
    if (a5 >= 1)
    {
      LODWORD(v12) = 0;
      v20 = a4;
      while (1)
      {
        v21 = (unint64_t)&v20[*v20 + 1];
        if (v21 > (unint64_t)v11)
          break;
        v17 = PrintFCore(a1, (uint64_t)"%*s%.*s\n", a3, (uint64_t)a4, a5, a6, a7, a8, v18);
        if ((v17 & 0x80000000) != 0)
          return v17;
        v12 = (v17 + v12);
        v20 = (unsigned __int8 *)v21;
        if (v21 >= (unint64_t)v11)
          goto LABEL_37;
      }
      v22 = PrintFCore(a1, (uint64_t)"%*s### TXT record length byte too big (%zu, %zu max)\n", a3, (uint64_t)a4, a5, a6, a7, a8, v18);
LABEL_40:
      if (v22 >= 0)
        v28 = v12;
      else
        v28 = 0;
      return (v28 + v22);
    }
    goto LABEL_36;
  }
  if (&a4[*a4 + 1] == v11)
  {
    if (a5 >= 2)
    {
      LODWORD(v12) = 0;
      v23 = a4 + 1;
      do
      {
        v24 = &v31;
        v25 = v23;
        do
        {
          v27 = *v23++;
          v26 = v27;
          if (v27 == 92)
          {
            if (v23 >= v11)
            {
              v22 = PrintFCore(a1, (uint64_t)"%*s### bad TXT escape: %.*s\n", a3, (uint64_t)a4, a5, a6, a7, a8, v18);
              goto LABEL_40;
            }
            v23 = v25 + 2;
            LOBYTE(v26) = v25[1];
          }
          else if (v26 == 44)
          {
            break;
          }
          *v24++ = v26;
          v25 = v23;
        }
        while (v23 < v11);
        v17 = PrintFCore(a1, (uint64_t)"%*s%.*s\n", a3, (uint64_t)a4, a5, a6, a7, a8, v18);
        if ((v17 & 0x80000000) != 0)
          return v17;
        v12 = (v17 + v12);
      }
      while (v23 < v11);
      goto LABEL_37;
    }
LABEL_36:
    v12 = 0;
LABEL_37:
    if (a5 && *v9)
      return v12;
    v22 = PrintFCore(a1, (uint64_t)"\n", a3, (uint64_t)a4, a5, a6, a7, a8, v30);
    goto LABEL_40;
  }
  return PrintFCore(a1, (uint64_t)"%*s### bad TXT record length byte (%zu, %zu expected)\n", a3, (uint64_t)a4, a5, a6, a7, a8, (4 * a3));
}

uint64_t PrintFWriteXMLEscaped(uint64_t (**a1)(char *, int64_t, _QWORD), char *__s, int64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *v8;
  uint64_t v10;
  char *v11;
  char *v12;
  int v13;
  const char *v14;
  uint64_t v15;
  int v16;
  int v17;

  v8 = __s;
  if (a3 == -1)
    a3 = strlen(__s);
  if (a3 < 1)
    return 0;
  v10 = 0;
  v11 = &v8[a3];
  v12 = v8;
  do
  {
    v13 = *v12;
    if (v13 <= 38)
    {
      if (v13 == 34)
      {
        v14 = "&quot;";
      }
      else
      {
        v14 = "&amp;";
        if (v13 != 38)
        {
LABEL_12:
          ++v12;
          continue;
        }
      }
    }
    else
    {
      switch(v13)
      {
        case '\'':
          v14 = "&#39;";
          break;
        case '<':
          v14 = "&lt;";
          break;
        case '>':
          v14 = "&gt;";
          break;
        default:
          goto LABEL_12;
      }
    }
    if (v12 != v8)
    {
      v15 = (*a1)(v8, v12 - v8, a1);
      if ((v15 & 0x80000000) != 0)
        return v15;
      LODWORD(v10) = v15 + v10;
    }
    v15 = PrintFCore((uint64_t)a1, (uint64_t)"%s", a3, a4, a5, a6, a7, a8, (uint64_t)v14);
    if ((v15 & 0x80000000) != 0)
      return v15;
    ++v12;
    v10 = (v15 + v10);
    v8 = v12;
  }
  while (v12 < v11);
  if (v12 != v8)
  {
    v16 = (*a1)(v8, v12 - v8, a1);
    if (v16 >= 0)
      v17 = v10;
    else
      v17 = 0;
    return (v17 + v16);
  }
  return v10;
}

id NSPrintF_safe(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  NSPrintV(a1, (uint64_t)&a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

id NSPrintTypedObject(const char *a1, void *a2, int *a3)
{
  __CFString *v5;
  id v6;
  int v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  __int128 v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  id v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  id v153;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;

  v5 = a2;
  v6 = 0;
  v7 = -6735;
  v8 = 0;
  v9 = 0;
  switch(*a1)
  {
    case 'a':
      if (!strcasecmp(a1, "addr"))
      {
        v9 = v5;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_80;
        v9 = objc_retainAutorelease(v9);
        -[__CFString bytes](v9, "bytes");
        v105 = -[__CFString length](v9, "length");
        *((_QWORD *)&v114 + 1) = v105;
        *(_QWORD *)&v114 = v105 - 2;
        v113 = v114 >> 1;
        if (v113 < 4 || v113 == 7)
        {
          NSPrintF((uint64_t)"%.*a", v106, v107, v108, v109, v110, v111, v112, v105);
          goto LABEL_61;
        }
        goto LABEL_77;
      }
      if (strcasecmp(a1, "asbd"))
        goto LABEL_50;
      v9 = v5;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_80;
      if (-[__CFString length](v9, "length") != 40)
        goto LABEL_77;
      v9 = objc_retainAutorelease(v9);
      v155 = -[__CFString bytes](v9, "bytes");
      NSPrintF((uint64_t)"%{asbd}", v10, v11, v12, v13, v14, v15, v16, v155);
      goto LABEL_61;
    case 'b':
      if (strcasecmp(a1, "base2"))
        goto LABEL_50;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_78;
      v158 = -[__CFString unsignedLongLongValue](v5, "unsignedLongLongValue");
      NSPrintF((uint64_t)"%llb", v48, v49, v50, v51, v52, v53, v54, v158);
      goto LABEL_67;
    case 'c':
      if (strcasecmp(a1, "cec"))
        goto LABEL_50;
      v9 = v5;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_80;
      v9 = objc_retainAutorelease(v9);
      v62 = -[__CFString bytes](v9, "bytes");
      -[__CFString length](v9, "length");
      NSPrintF((uint64_t)"%{cec}", v63, v64, v65, v66, v67, v68, v69, v62);
      goto LABEL_61;
    case 'd':
      if (strcasecmp(a1, "dur"))
        goto LABEL_50;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_78;
      v160 = -[__CFString unsignedLongLongValue](v5, "unsignedLongLongValue");
      NSPrintF((uint64_t)"%ll{dur}", v77, v78, v79, v80, v81, v82, v83, v160);
      goto LABEL_67;
    case 'e':
      if (!strcasecmp(a1, "err"))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_78;
        v161 = -[__CFString longValue](v5, "longValue");
        NSPrintF((uint64_t)"%#m", v115, v116, v117, v118, v119, v120, v121, v161);
      }
      else
      {
        if (strcasecmp(a1, "error"))
          goto LABEL_50;
        NSPrintF((uint64_t)"%{error}", v55, v56, v57, v58, v59, v60, v61, (uint64_t)v5);
      }
      goto LABEL_67;
    case 'f':
    case 'g':
    case 'i':
    case 'j':
    case 'k':
    case 'l':
    case 'm':
    case 'n':
    case 'q':
    case 'r':
    case 'v':
    case 'w':
      goto LABEL_73;
    case 'h':
      if (strcasecmp(a1, "hex"))
        goto LABEL_50;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_78;
LABEL_48:
      NSPrintF((uint64_t)"%@", v84, v85, v86, v87, v88, v89, v90, (uint64_t)v5);
      goto LABEL_67;
    case 'o':
      if (!strcasecmp(a1, "obj"))
        goto LABEL_48;
      if (!strcasecmp(a1, "obj1"))
      {
        NSPrintF((uint64_t)"%##@", v91, v92, v93, v94, v95, v96, v97, (uint64_t)v5);
        goto LABEL_67;
      }
      if (strcasecmp(a1, "oneline"))
      {
        if (strcasecmp(a1, "onoff"))
          goto LABEL_50;
        v24 = CFGetInt64(v5, 0);
        v32 = "on";
        v33 = "off";
LABEL_35:
        if (!v24)
          v32 = v33;
        NSPrintF((uint64_t)"%s", v25, v26, v27, v28, v29, v30, v31, (uint64_t)v32);
        goto LABEL_67;
      }
      NSPrintF((uint64_t)"%@", v98, v99, v100, v101, v102, v103, v104, (uint64_t)v5);
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      if (v136)
      {
        v137 = objc_retainAutorelease(v136);
        v138 = objc_msgSend(v137, "UTF8String");
        NSPrintF((uint64_t)"%{sline}", v139, v140, v141, v142, v143, v144, v145, v138);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_68;
      }
      v6 = 0;
      v8 = 0;
      v9 = 0;
      v7 = -6700;
      goto LABEL_73;
    case 'p':
      if (!strcasecmp(a1, "pid"))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_78;
        v162 = -[__CFString unsignedLongLongValue](v5, "unsignedLongLongValue");
        NSPrintF((uint64_t)"%#{pid}", v122, v123, v124, v125, v126, v127, v128, v162);
      }
      else
      {
        if (strcasecmp(a1, "ptr"))
        {
LABEL_50:
          v6 = 0;
          v8 = 0;
          v9 = 0;
          goto LABEL_51;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_78;
        v159 = -[__CFString unsignedLongLongValue](v5, "unsignedLongLongValue");
        NSPrintF((uint64_t)"%{ptr}", v70, v71, v72, v73, v74, v75, v76, v159);
      }
      goto LABEL_67;
    case 's':
      if (strcasecmp(a1, "sa"))
        goto LABEL_50;
      v9 = v5;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_80;
      v9 = objc_retainAutorelease(v9);
      v163 = -[__CFString bytes](v9, "bytes");
      NSPrintF((uint64_t)"%##a", v129, v130, v131, v132, v133, v134, v135, v163);
      goto LABEL_61;
    case 't':
      if (strcasecmp(a1, "truefalse"))
        goto LABEL_50;
      v24 = CFGetInt64(v5, 0);
      v32 = "true";
      v33 = "false";
      goto LABEL_35;
    case 'u':
      if (strcasecmp(a1, "uuid"))
        goto LABEL_50;
      v9 = v5;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_80:
        v6 = 0;
        v8 = 0;
        goto LABEL_79;
      }
      if (-[__CFString length](v9, "length") != 16)
        goto LABEL_77;
      v9 = objc_retainAutorelease(v9);
      v157 = -[__CFString bytes](v9, "bytes");
      NSPrintF((uint64_t)"%#U", v41, v42, v43, v44, v45, v46, v47, v157);
      goto LABEL_61;
    case 'x':
      if (strcasecmp(a1, "xpc"))
        goto LABEL_50;
      NSPrintF((uint64_t)"%{xpc}", v34, v35, v36, v37, v38, v39, v40, (uint64_t)v5);
      goto LABEL_67;
    case 'y':
      if (strcasecmp(a1, "yesno"))
        goto LABEL_50;
      v24 = CFGetInt64(v5, 0);
      v32 = "yes";
      v33 = "no";
      goto LABEL_35;
    default:
      v8 = 0;
      v9 = 0;
      if (*a1 != 52)
        goto LABEL_73;
      if (strcasecmp(a1, "4cc"))
        goto LABEL_50;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v5;
        if (-[__CFString length](v9, "length") != 4)
        {
LABEL_77:
          v6 = 0;
          v8 = 0;
          v7 = -6743;
          goto LABEL_73;
        }
        v9 = objc_retainAutorelease(v9);
        v156 = *(unsigned int *)-[__CFString bytes](v9, "bytes");
        NSPrintF((uint64_t)"%C", v17, v18, v19, v20, v21, v22, v23, v156);
LABEL_61:
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_69;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v164 = -[__CFString unsignedIntValue](v5, "unsignedIntValue");
        NSPrintF((uint64_t)"%C", v146, v147, v148, v149, v150, v151, v152, v164);
LABEL_67:
        v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_68:
        v9 = 0;
LABEL_69:
        if (v8)
        {
          v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v8);

          if (v6)
            v7 = 0;
          else
            v7 = -6700;
        }
        else
        {
          v6 = 0;
LABEL_51:
          v7 = -6717;
        }
        goto LABEL_73;
      }
LABEL_78:
      v6 = 0;
      v8 = 0;
      v9 = 0;
LABEL_79:
      v7 = -6756;
LABEL_73:
      if (a3)
        *a3 = v7;
      v153 = v6;

      return v153;
  }
}

uint64_t AppendPrintF(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  const char *v10;
  uint64_t v11;
  void *v13[2];

  v13[0] = 0;
  v13[1] = &a9;
  v10 = (const char *)*a1;
  if (!*a1)
    v10 = "";
  v11 = ASPrintF(v13, (uint64_t)"%s%V", a3, a4, a5, a6, a7, a8, (uint64_t)v10);
  if ((v11 & 0x80000000) == 0)
  {
    if (*a1)
      free(*a1);
    *a1 = v13[0];
  }
  return v11;
}

uint64_t CPrintF(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return VCPrintF(a1, a2, a3, &a9);
}

uint64_t FPrintF(uint64_t (*a1)(unsigned __int8 *, int64_t, _QWORD), unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return VCPrintF((uint64_t (*)(unsigned __int8 *, int64_t, _QWORD))FPrintFCallBack, a1, a2, (uint64_t)&a9, a5, a6, a7, a8);
}

size_t FPrintFCallBack(const void *a1, size_t __nitems, FILE *__stream)
{
  if (__stream)
    fwrite(a1, 1uLL, __nitems, __stream);
  return __nitems;
}

uint64_t VFPrintF(uint64_t (*a1)(unsigned __int8 *, int64_t, _QWORD), unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return VCPrintF((uint64_t (*)(unsigned __int8 *, int64_t, _QWORD))FPrintFCallBack, a1, a2, a3, a5, a6, a7, a8);
}

uint64_t FPrintF_safe(uint64_t (*a1)(unsigned __int8 *, int64_t, _QWORD), unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return VCPrintF((uint64_t (*)(unsigned __int8 *, int64_t, _QWORD))FPrintFCallBack, a1, a2, (uint64_t)&a9, a5, a6, a7, a8);
}

uint64_t VFPrintF_safe(uint64_t (*a1)(unsigned __int8 *, int64_t, _QWORD), unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return VCPrintF((uint64_t (*)(unsigned __int8 *, int64_t, _QWORD))FPrintFCallBack, a1, a2, a3, a5, a6, a7, a8);
}

uint64_t MemPrintF(uint64_t (*a1)(unsigned __int8 *, int64_t, _QWORD), uint64_t (*a2)(unsigned __int8 *, int64_t, _QWORD), unsigned __int8 *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t (*v10[6])(unsigned __int8 *, int64_t, _QWORD);

  v10[4] = 0;
  v10[5] = 0;
  v10[0] = (uint64_t (*)(unsigned __int8 *, int64_t, _QWORD))PrintFCallBackFixedString;
  v10[1] = a1;
  v10[2] = 0;
  v10[3] = a2;
  return PrintFCoreVAList(v10, a3, (uint64_t)&a9, a4, a5, a6, a7, a8);
}

uint64_t CUObfuscatedPtr(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  v3 = a1;
  if (gObfuscateOnce != -1)
  {
    dispatch_once_f(&gObfuscateOnce, 0, (dispatch_function_t)_PrintFObfuscateInit);
    if (a1)
      goto LABEL_3;
LABEL_5:
    LOWORD(result) = 0;
    return (unsigned __int16)result;
  }
  if (!a1)
    goto LABEL_5;
LABEL_3:
  LOWORD(result) = SipHash(gObfuscateKey, (unsigned __int8 *)&v3, 8);
  return (unsigned __int16)result;
}

__CFString *CUPrintAddress(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __CFString *v9;

  v9 = CFSTR("NULL");
  switch(__ROR8__(a2, 1))
  {
    case 0:
      return v9;
    case 1:
      NSPrintF((uint64_t)"%.2a", a2, a3, a4, a5, a6, a7, a8, a1);
      goto LABEL_13;
    case 2:
      if ((a3 & 1) != 0)
        NSPrintF((uint64_t)"%#.4a", a2, a3, a4, a5, a6, a7, a8, a1);
      else
        NSPrintF((uint64_t)"%.4a", a2, a3, a4, a5, a6, a7, a8, a1);
      goto LABEL_13;
    case 3:
      if ((a3 & 1) != 0)
        NSPrintF((uint64_t)"%#.6a", a2, a3, a4, a5, a6, a7, a8, a1);
      else
        NSPrintF((uint64_t)"%.6a", a2, a3, a4, a5, a6, a7, a8, a1);
      goto LABEL_13;
    case 4:
      NSPrintF((uint64_t)"%.8a", a2, a3, a4, a5, a6, a7, a8, a1);
      goto LABEL_13;
    case 8:
      NSPrintF((uint64_t)"%.16a", a2, a3, a4, a5, a6, a7, a8, a1);
      goto LABEL_13;
    default:
      if (!a1)
        return CFSTR("NULL");
      NSPrintF((uint64_t)"<< ERROR: Bad Address Size: %zu >>", a2, a3, a4, a5, a6, a7, a8, a2);
LABEL_13:
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v9;
  }
}

id CUPrintASBD(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return NSPrintF((uint64_t)"%{asbd}", a2, a3, a4, a5, a6, a7, a8, a1);
}

id CUPrintDateCF(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return NSPrintF((uint64_t)"%{DateCF}", a3, a4, a5, a6, a7, a8, a9, *(uint64_t *)&a1);
}

id CUPrintDuration32(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return NSPrintF((uint64_t)"%{dur}", a2, a3, a4, a5, a6, a7, a8, a1);
}

id CUPrintDuration64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return NSPrintF((uint64_t)"%ll{dur}", a2, a3, a4, a5, a6, a7, a8, a1);
}

id CUPrintDurationDouble(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return NSPrintF((uint64_t)"%ll{dur}", a3, a4, a5, a6, a7, a8, a9, (unint64_t)a1);
}

id CUPrintErrorCode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return NSPrintF((uint64_t)"%#m", a2, a3, a4, a5, a6, a7, a8, a1);
}

__CFString *CUPrintFlags(unint64_t a1, _BYTE *a2, char a3)
{
  __CFString *v6;
  __CFString *v7;
  int v8;
  char v9;
  const char *v10;
  const char *v11;
  const char *v12;
  int v13;
  __CFString *v14;
  __CFString *v15;

  v6 = (__CFString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v7 = v6;
  if ((a3 & 1) != 0)
    -[__CFString appendString:](v6, "appendString:", CFSTR("["));
  v8 = 0;
  v9 = *a2;
  do
  {
    v10 = a2 + 1;
    if (((a1 >> v9) & 1) != 0)
    {
      if (v8 <= 0)
        v11 = "";
      else
        v11 = ", ";
      -[__CFString appendFormat:](v7, "appendFormat:", CFSTR("%s%s"), v11, v10);
      ++v8;
    }
    v12 = &v10[strlen(v10)];
    v13 = *((unsigned __int8 *)v12 + 1);
    a2 = v12 + 1;
    v9 = v13;
  }
  while (v13);
  if ((a3 & 1) != 0)
    -[__CFString appendString:](v7, "appendString:", CFSTR("]"));
  if (v7)
    v14 = v7;
  else
    v14 = &stru_1E25DF9F8;
  v15 = v14;

  return v15;
}

id CUPrintHex(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const char *v8;

  v8 = "%.3H";
  if ((_DWORD)a4)
    v8 = "%H";
  NSPrintF((uint64_t)v8, a2, a3, a4, a5, a6, a7, a8, a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

id CUPrintNSError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return NSPrintF((uint64_t)"%{error}", a2, a3, a4, a5, a6, a7, a8, a1);
}

id CUPrintNSObject(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return NSPrintF((uint64_t)"%.*@", a2, a3, a4, a5, a6, a7, a8, a2);
}

id CUPrintNSObjectMasked(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return NSPrintF((uint64_t)"%{mask}", a2, a3, a4, a5, a6, a7, a8, a1);
}

id CUPrintNSObjectOneLine(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return NSPrintF((uint64_t)"%##@", a2, a3, a4, a5, a6, a7, a8, a1);
}

id CUPrintNSObjectOneLineEx(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return NSPrintF((uint64_t)"%##.*@", a2, a3, a4, a5, a6, a7, a8, a2);
}

id CUPrintSockAddr(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return NSPrintF((uint64_t)"%##a", a2, a3, a4, a5, a6, a7, a8, a1);
}

id CUPrintText(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return NSPrintF((uint64_t)"%*{text}", a2, a3, a4, a5, a6, a7, a8, a3);
}

id CUPrintTimeNow(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  if (a1 <= 2)
  {
    NSPrintF((uint64_t)off_1E25DF098[a1], a2, a3, a4, a5, a6, a7, a8, v8);
    a1 = objc_claimAutoreleasedReturnValue();
  }
  return (id)a1;
}

id CUPrintXPC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return NSPrintF((uint64_t)"%{xpc}", a2, a3, a4, a5, a6, a7, a8, a1);
}

uint64_t CryptoRandomKey(void *a1, size_t a2, char *a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  RandomBytes(a1, a2);
  return CryptoHKDF((uint64_t)kCryptoHashDescriptor_SHA512, (uint64_t)a1, a2, a3, a4, a5, a6, a2, (uint64_t)a1);
}

uint64_t RandomBytes(void *bytes, size_t count)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  while (1)
  {
    result = CCRandomGenerateBytes(bytes, count);
    if (!(_DWORD)result)
      break;
    if (gLogCategory_RandomNumberUtils <= 60)
    {
      v9 = result;
      if (gLogCategory_RandomNumberUtils != -1
        || _LogCategory_Initialize((uint64_t)&gLogCategory_RandomNumberUtils, 0x3Cu))
      {
        LogPrintF((uint64_t)&gLogCategory_RandomNumberUtils, (uint64_t)"OSStatus RandomBytes(void *, size_t)", 0x3Cu, (uint64_t)"### CCRandomGenerateBytes failed: %#m\n", v5, v6, v7, v8, v9);
      }
    }
    sleep(1u);
  }
  return result;
}

_BYTE *RandomString(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v10;
  _BYTE *v11;
  unint64_t v12;
  unsigned int bytes;

  bytes = 0;
  RandomBytes(&bytes, 4uLL);
  v10 = bytes % (unint64_t)(a4 - a3 + 1) + a3;
  v11 = a5;
  if (v10 >= 1)
  {
    v12 = (unint64_t)&a5[v10];
    v11 = a5;
    do
    {
      RandomBytes(&bytes, 4uLL);
      *v11++ = *(_BYTE *)(a1 + bytes % a2);
    }
    while ((unint64_t)v11 < v12);
  }
  *v11 = 0;
  return a5;
}

uint64_t ScreenGetTypeID()
{
  if (gScreenInitOnce != -1)
    dispatch_once_f(&gScreenInitOnce, 0, (dispatch_function_t)_ScreenGetTypeID);
  return gScreenTypeID;
}

uint64_t _ScreenGetTypeID()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  gScreenTypeID = result;
  return result;
}

void _ScreenFinalize(_QWORD *a1)
{
  const void *v2;
  const void *v3;
  const void *v4;

  v2 = (const void *)a1[2];
  if (v2)
  {
    CFRelease(v2);
    a1[2] = 0;
  }
  v3 = (const void *)a1[4];
  if (v3)
  {
    CFRelease(v3);
    a1[4] = 0;
  }
  v4 = (const void *)a1[8];
  if (v4)
  {
    CFRelease(v4);
    a1[8] = 0;
  }
}

uint64_t ScreenCreate(uint64_t *a1, const __CFDictionary *a2)
{
  uint64_t Instance;
  uint64_t v5;
  const __CFDictionary **v6;
  int v7;
  uint64_t v8;
  CFTypeID TypeID;
  const __CFDictionary *TypedValue;
  int Int64;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  __CFString *Value;
  CFStringRef v19;
  uint64_t result;
  unsigned int v21;
  _BYTE v22[16];
  char __str[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (gScreenInitOnce != -1)
    dispatch_once_f(&gScreenInitOnce, 0, (dispatch_function_t)_ScreenGetTypeID);
  Instance = _CFRuntimeCreateInstance();
  if (!Instance)
    return 4294960568;
  v5 = Instance;
  *(_OWORD *)(Instance + 16) = 0u;
  v6 = (const __CFDictionary **)(Instance + 16);
  *(_QWORD *)(Instance + 64) = 0;
  *(_OWORD *)(Instance + 32) = 0u;
  *(_OWORD *)(Instance + 48) = 0u;
  CFObjectSetPropertyInt64((const void *)Instance, 0, (uint64_t (*)(const void *, uint64_t, const void *, const void *, const void *))_ScreenSetProperty, 1, CFSTR("features"), 0, 14);
  CFObjectSetPropertyInt64((const void *)v5, 0, (uint64_t (*)(const void *, uint64_t, const void *, const void *, const void *))_ScreenSetProperty, 1, CFSTR("maxFPS"), 0, 60);
  CFObjectSetPropertyInt64((const void *)v5, 0, (uint64_t (*)(const void *, uint64_t, const void *, const void *, const void *))_ScreenSetProperty, 1, CFSTR("widthPixels"), 0, 960);
  CFObjectSetPropertyInt64((const void *)v5, 0, (uint64_t (*)(const void *, uint64_t, const void *, const void *, const void *))_ScreenSetProperty, 1, CFSTR("heightPixels"), 0, 540);
  _ScreenSetProperty(v5, v7, CFSTR("uuid"), v8, CFSTR("e5f7a68d-7b0f-4305-984b-974f677a150b"));
  if (!a2)
    goto LABEL_24;
  TypeID = CFDataGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(a2, CFSTR("edid"), TypeID, 0);
  *v6 = TypedValue;
  if (TypedValue)
    CFRetain(TypedValue);
  v21 = 0;
  Int64 = CFDictionaryGetInt64(a2, CFSTR("features"), (int *)&v21);
  if (!v21)
    *(_DWORD *)(v5 + 24) = Int64;
  v12 = CFDictionaryGetInt64(a2, CFSTR("maxFPS"), (int *)&v21);
  if (!v21)
    *(_DWORD *)(v5 + 28) = v12;
  v13 = CFDictionaryGetInt64(a2, CFSTR("primaryInputDevice"), (int *)&v21);
  if (!v21)
    *(_DWORD *)(v5 + 56) = v13;
  v14 = CFDictionaryGetInt64(a2, CFSTR("widthPixels"), (int *)&v21);
  if (!v21)
    *(_DWORD *)(v5 + 40) = v14;
  v15 = CFDictionaryGetInt64(a2, CFSTR("heightPixels"), (int *)&v21);
  if (!v21)
    *(_DWORD *)(v5 + 44) = v15;
  v16 = CFDictionaryGetInt64(a2, CFSTR("widthPhysical"), (int *)&v21);
  if (!v21)
    *(_DWORD *)(v5 + 48) = v16;
  v17 = CFDictionaryGetInt64(a2, CFSTR("heightPhysical"), (int *)&v21);
  if (!v21)
    *(_DWORD *)(v5 + 52) = v17;
  Value = (__CFString *)CFDictionaryGetValue(a2, CFSTR("uuid"));
  if (Value
    && (v21 = CFGetUUIDEx(Value, 0, (uint64_t)v22)) == 0
    && (snprintf(__str, 0x25uLL, "%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x", v22[0], v22[1], v22[2], v22[3], v22[4], v22[5], v22[6], v22[7], v22[8], v22[9], v22[10], v22[11], v22[12], v22[13], v22[14], v22[15]),
        v19 = CFStringCreateWithCString(0, __str, 0x8000100u),
        (*(_QWORD *)(v5 + 64) = v19) == 0))
  {
    v21 = -6700;
    CFRelease((CFTypeRef)v5);
    return v21;
  }
  else
  {
LABEL_24:
    result = 0;
    *a1 = v5;
  }
  return result;
}

uint64_t _ScreenSetProperty(uint64_t a1, int a2, CFTypeRef cf1, uint64_t a4, const __CFString *a5)
{
  CFTypeID v8;
  const __CFString **v9;
  const void *v10;
  const void *v11;
  int v12;
  uint64_t result;
  const void *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  CFTypeID v21;
  const void *v22;
  const void *v23;

  if (CFEqual(cf1, CFSTR("edid")))
  {
    if (a5)
    {
      v8 = CFGetTypeID(a5);
      if (v8 == CFDataGetTypeID())
      {
        v11 = *(const void **)(a1 + 16);
        v9 = (const __CFString **)(a1 + 16);
        v10 = v11;
LABEL_5:
        CFRetain(a5);
        goto LABEL_9;
      }
      return 4294960540;
    }
    v14 = *(const void **)(a1 + 16);
    v9 = (const __CFString **)(a1 + 16);
    v10 = v14;
    goto LABEL_9;
  }
  if (CFEqual(cf1, CFSTR("features")))
  {
    v12 = CFGetInt64(a5, 0);
    result = 0;
    *(_DWORD *)(a1 + 24) = v12;
    return result;
  }
  if (CFEqual(cf1, CFSTR("maxFPS")))
  {
    v15 = CFGetInt64(a5, 0);
    result = 0;
    *(_DWORD *)(a1 + 28) = v15;
    return result;
  }
  if (CFEqual(cf1, CFSTR("platformLayer")))
  {
    v10 = *(const void **)(a1 + 32);
    if (a5)
      CFRetain(a5);
    *(_QWORD *)(a1 + 32) = a5;
    if (!v10)
      return 0;
    goto LABEL_10;
  }
  if (CFEqual(cf1, CFSTR("widthPhysical")))
  {
    v16 = CFGetInt64(a5, 0);
    result = 0;
    *(_DWORD *)(a1 + 48) = v16;
    return result;
  }
  if (CFEqual(cf1, CFSTR("heightPhysical")))
  {
    v17 = CFGetInt64(a5, 0);
    result = 0;
    *(_DWORD *)(a1 + 52) = v17;
    return result;
  }
  if (CFEqual(cf1, CFSTR("widthPixels")))
  {
    v18 = CFGetInt64(a5, 0);
    result = 0;
    *(_DWORD *)(a1 + 40) = v18;
    return result;
  }
  if (CFEqual(cf1, CFSTR("heightPixels")))
  {
    v19 = CFGetInt64(a5, 0);
    result = 0;
    *(_DWORD *)(a1 + 44) = v19;
    return result;
  }
  if (CFEqual(cf1, CFSTR("primaryInputDevice")))
  {
    v20 = CFGetInt64(a5, 0);
    result = 0;
    *(_DWORD *)(a1 + 56) = v20;
    return result;
  }
  if (CFEqual(cf1, CFSTR("uuid")))
  {
    if (a5)
    {
      v21 = CFGetTypeID(a5);
      if (v21 == CFStringGetTypeID())
      {
        v22 = *(const void **)(a1 + 64);
        v9 = (const __CFString **)(a1 + 64);
        v10 = v22;
        goto LABEL_5;
      }
      return 4294960540;
    }
    v23 = *(const void **)(a1 + 64);
    v9 = (const __CFString **)(a1 + 64);
    v10 = v23;
LABEL_9:
    *v9 = a5;
    if (!v10)
      return 0;
LABEL_10:
    CFRelease(v10);
    return 0;
  }
  return 4294960582;
}

CFNumberRef _ScreenCopyProperty(_QWORD *a1, int a2, CFTypeRef cf1, uint64_t a4, int *a5)
{
  CFNumberRef v8;
  const void *v9;
  int v10;

  if (CFEqual(cf1, CFSTR("edid")))
  {
    v8 = (CFNumberRef)a1[2];
    if (v8)
    {
LABEL_3:
      CFRetain(v8);
LABEL_9:
      v10 = 0;
      goto LABEL_10;
    }
    goto LABEL_31;
  }
  if (CFEqual(cf1, CFSTR("features")))
  {
    v9 = a1 + 3;
LABEL_8:
    v8 = CFNumberCreate(0, kCFNumberSInt32Type, v9);
    if (v8)
      goto LABEL_9;
    v10 = -6728;
    goto LABEL_10;
  }
  if (CFEqual(cf1, CFSTR("maxFPS")))
  {
    v9 = (char *)a1 + 28;
    goto LABEL_8;
  }
  if (a1[4] && CFEqual(cf1, CFSTR("platformLayer")))
  {
    v8 = (CFNumberRef)a1[4];
    goto LABEL_3;
  }
  if (CFEqual(cf1, CFSTR("widthPhysical")))
  {
    v9 = a1 + 6;
    goto LABEL_8;
  }
  if (CFEqual(cf1, CFSTR("heightPhysical")))
  {
    v9 = (char *)a1 + 52;
    goto LABEL_8;
  }
  if (CFEqual(cf1, CFSTR("widthPixels")))
  {
    v9 = a1 + 5;
    goto LABEL_8;
  }
  if (CFEqual(cf1, CFSTR("heightPixels")))
  {
    v9 = (char *)a1 + 44;
    goto LABEL_8;
  }
  if (CFEqual(cf1, CFSTR("primaryInputDevice")))
  {
    v9 = a1 + 7;
    goto LABEL_8;
  }
  if (!CFEqual(cf1, CFSTR("uuid")))
  {
    v8 = 0;
LABEL_31:
    v10 = -6714;
    goto LABEL_10;
  }
  v8 = (CFNumberRef)a1[8];
  if (v8)
    goto LABEL_3;
  v10 = -6745;
LABEL_10:
  if (a5)
    *a5 = v10;
  return v8;
}

__CFArray *ScreenCopyAllScreens(int *a1)
{
  __CFArray *Mutable;
  CFIndex Count;
  CFIndex v4;
  CFIndex i;
  const void *ValueAtIndex;
  int v7;

  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  if (!Mutable)
  {
    v7 = -6728;
    if (!a1)
      return Mutable;
    goto LABEL_7;
  }
  pthread_mutex_lock(&gScreenLock);
  if (gScreenArray)
  {
    Count = CFArrayGetCount((CFArrayRef)gScreenArray);
    if (Count >= 1)
    {
      v4 = Count;
      for (i = 0; i != v4; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)gScreenArray, i);
        CFArrayAppendValue(Mutable, ValueAtIndex);
      }
    }
  }
  pthread_mutex_unlock(&gScreenLock);
  v7 = 0;
  if (a1)
LABEL_7:
    *a1 = v7;
  return Mutable;
}

void *ScreenCopyMain(int *a1)
{
  int v2;
  void *value;

  value = 0;
  pthread_mutex_lock(&gScreenLock);
  if (gScreenArray)
  {
    if (CFArrayGetCount((CFArrayRef)gScreenArray) >= 1)
    {
      value = (void *)CFArrayGetValueAtIndex((CFArrayRef)gScreenArray, 0);
      CFRetain(value);
      if (value)
      {
        v2 = 0;
        goto LABEL_9;
      }
    }
    if (gScreenArray)
      goto LABEL_7;
  }
  gScreenArray = (uint64_t)CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  if (gScreenArray)
  {
LABEL_7:
    v2 = ScreenCreate((uint64_t *)&value, 0);
    if (!v2)
      CFArrayAppendValue((CFMutableArrayRef)gScreenArray, value);
  }
  else
  {
    v2 = -6728;
  }
LABEL_9:
  pthread_mutex_unlock(&gScreenLock);
  if (a1)
    *a1 = v2;
  return value;
}

uint64_t ScreenRegister(uint64_t *a1)
{
  __CFArray *Mutable;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  pthread_mutex_lock(&gScreenLock);
  Mutable = (__CFArray *)gScreenArray;
  if (gScreenArray
    || (Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]), (gScreenArray = (uint64_t)Mutable) != 0))
  {
    CFArrayAppendValue(Mutable, a1);
    if (gLogCategory_Screen <= 50
      && (gLogCategory_Screen != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_Screen, 0x32u)))
    {
      LogPrintF((uint64_t)&gLogCategory_Screen, (uint64_t)"OSStatus ScreenRegister(ScreenRef)", 0x32u, (uint64_t)"Registered screen %@ %u x %u, %u FPS\n", v3, v4, v5, v6, a1[8]);
    }
    v7 = 0;
  }
  else
  {
    v7 = 4294960568;
  }
  pthread_mutex_unlock(&gScreenLock);
  return v7;
}

uint64_t ScreenDeregister(uint64_t *a1)
{
  CFIndex Count;
  CFIndex v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  pthread_mutex_lock(&gScreenLock);
  if (!gScreenArray)
    goto LABEL_12;
  Count = CFArrayGetCount((CFArrayRef)gScreenArray);
  v3 = Count;
  if (Count >= 1)
  {
    v4 = Count + 1;
    do
    {
      if (CFArrayGetValueAtIndex((CFArrayRef)gScreenArray, v4 - 2) == a1)
      {
        if (gLogCategory_Screen <= 50
          && (gLogCategory_Screen != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_Screen, 0x32u)))
        {
          LogPrintF((uint64_t)&gLogCategory_Screen, (uint64_t)"OSStatus ScreenDeregister(ScreenRef)", 0x32u, (uint64_t)"Deregistered screen %@ %u x %u\n", v5, v6, v7, v8, a1[8]);
        }
        CFArrayRemoveValueAtIndex((CFMutableArrayRef)gScreenArray, v4 - 2);
        --v3;
      }
      --v4;
    }
    while (v4 > 1);
  }
  if (!v3)
  {
LABEL_12:
    if (gScreenArray)
    {
      CFRelease((CFTypeRef)gScreenArray);
      gScreenArray = 0;
    }
  }
  pthread_mutex_unlock(&gScreenLock);
  return 0;
}

uint64_t _ScreenStreamGetTypeID()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  gScreenStreamTypeID = result;
  return result;
}

void _ScreenStreamFinalize(_QWORD *a1)
{
  uint64_t v2;
  const void *v3;
  const void *v4;
  uint64_t v5;
  const void *v6;

  v2 = a1[7];
  if (v2)
  {
    ((void (*)(uint64_t))softLinkVTDecompressionSessionInvalidate[0])(v2);
    CFRelease((CFTypeRef)a1[7]);
    a1[7] = 0;
  }
  v3 = (const void *)a1[6];
  if (v3)
  {
    CFRelease(v3);
    a1[6] = 0;
  }
  v4 = (const void *)a1[2];
  if (v4)
  {
    CFRelease(v4);
    a1[2] = 0;
  }
  v5 = a1[9];
  if (v5)
  {
    ((void (*)(uint64_t))softLinkCAImageQueueInvalidate[0])(v5);
    CFRelease((CFTypeRef)a1[9]);
    a1[9] = 0;
  }
  v6 = (const void *)a1[8];
  if (v6)
  {
    CFRelease(v6);
    a1[8] = 0;
  }
}

uint64_t initCAImageQueueInvalidate(uint64_t a1)
{
  if (QuartzCoreLibrary_sOnce_12581 != -1)
    dispatch_once(&QuartzCoreLibrary_sOnce_12581, &__block_literal_global_12582);
  softLinkCAImageQueueInvalidate[0] = (uint64_t (*)())dlsym((void *)QuartzCoreLibrary_sLib_12583, "CAImageQueueInvalidate");
  return ((uint64_t (*)(uint64_t))softLinkCAImageQueueInvalidate[0])(a1);
}

uint64_t initVTDecompressionSessionInvalidate(uint64_t a1)
{
  if (VideoToolboxLibrary_sOnce_12587 != -1)
    dispatch_once(&VideoToolboxLibrary_sOnce_12587, &__block_literal_global_27_12588);
  softLinkVTDecompressionSessionInvalidate[0] = (uint64_t (*)())dlsym((void *)VideoToolboxLibrary_sLib_12589, "VTDecompressionSessionInvalidate");
  return ((uint64_t (*)(uint64_t))softLinkVTDecompressionSessionInvalidate[0])(a1);
}

uint64_t ScreenStreamCreate(_QWORD *a1)
{
  uint64_t Instance;
  _OWORD *v3;
  uint64_t result;

  if (gScreenStreamInitOnce != -1)
    dispatch_once_f(&gScreenStreamInitOnce, 0, (dispatch_function_t)_ScreenStreamGetTypeID);
  Instance = _CFRuntimeCreateInstance();
  if (!Instance)
    return 4294960568;
  v3 = (_OWORD *)Instance;
  result = 0;
  v3[5] = 0u;
  v3[6] = 0u;
  v3[3] = 0u;
  v3[4] = 0u;
  v3[1] = 0u;
  v3[2] = 0u;
  *a1 = v3;
  return result;
}

uint64_t ScreenStreamSetFrameHook(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(result + 80) = a2;
  *(_QWORD *)(result + 88) = a3;
  return result;
}

uint64_t _ScreenStreamSetProperty(uint64_t a1, int a2, CFTypeRef cf1, uint64_t a4, __CFString *a5)
{
  CFTypeID v8;
  __CFString *v9;
  const void *v10;
  __CFString *v11;
  const void *v12;
  int v13;
  int v14;
  uint64_t result;
  unsigned int v16;

  if (CFEqual(cf1, CFSTR("avcc")))
  {
    if (a5)
    {
      v8 = CFGetTypeID(a5);
      if (v8 == CFDataGetTypeID())
      {
        v9 = *(__CFString **)(a1 + 16);
        if (v9 == a5)
          return 0;
        if (v9)
        {
          if (!CFEqual(a5, v9))
          {
            v10 = *(const void **)(a1 + 16);
            CFRetain(a5);
            *(_QWORD *)(a1 + 16) = a5;
            if (v10)
              CFRelease(v10);
            goto LABEL_21;
          }
          return 0;
        }
        CFRetain(a5);
        *(_QWORD *)(a1 + 16) = a5;
LABEL_21:
        *(_BYTE *)(a1 + 41) = 1;
        return 0;
      }
    }
    return 4294960540;
  }
  if (CFEqual(cf1, CFSTR("platformLayer")))
  {
    v11 = a5;
    getCALayerClass_12595[0]();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      CFRetain(v11);
      v12 = *(const void **)(a1 + 64);
      if (v12)
        CFRelease(v12);
      *(_QWORD *)(a1 + 64) = v11;

      return 0;
    }

    return 4294960540;
  }
  if (CFEqual(cf1, CFSTR("widthPhysical")))
  {
    v13 = CFGetInt64(a5, 0);
    if (*(_DWORD *)(a1 + 32) == v13)
      return 0;
    *(_DWORD *)(a1 + 32) = v13;
    goto LABEL_21;
  }
  if (CFEqual(cf1, CFSTR("heightPhysical")))
  {
    v14 = CFGetInt64(a5, 0);
    if (*(_DWORD *)(a1 + 36) == v14)
      return 0;
    *(_DWORD *)(a1 + 36) = v14;
    goto LABEL_21;
  }
  v16 = 0;
  if (CFEqual(cf1, CFSTR("widthPixels")))
  {
    *(_DWORD *)(a1 + 24) = CFGetInt64(a5, (int *)&v16);
  }
  else
  {
    if (!CFEqual(cf1, CFSTR("heightPixels")))
    {
      if (!CFEqual(cf1, CFSTR("requireHardwareDecoder")))
        return 4294960582;
      *(_BYTE *)(a1 + 40) = CFGetInt64(a5, 0) != 0;
      return 0;
    }
    *(_DWORD *)(a1 + 28) = CFGetInt64(a5, (int *)&v16);
  }
  result = v16;
  if (!v16)
    return 0;
  return result;
}

id CALayerFunction_12596()
{
  return (id)classCALayer_12609;
}

Class initCALayer_12597()
{
  Class result;

  if (QuartzCoreLibrary_sOnce_12581 != -1)
    dispatch_once(&QuartzCoreLibrary_sOnce_12581, &__block_literal_global_12582);
  result = objc_getClass("CALayer");
  classCALayer_12609 = (uint64_t)result;
  getCALayerClass_12595[0] = (uint64_t (*)())CALayerFunction_12596;
  return result;
}

uint64_t ScreenStreamStart(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  void *v11;
  Class (__cdecl *v12)();
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  if (*(_QWORD *)(a1 + 64))
  {
    v9 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkCAImageQueueCreate[0])(1, 1, 17);
    *(_QWORD *)(a1 + 72) = v9;
    if (v9)
    {
      v10 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkCAImageQueueSetFlags[0])(v9, 1, 1);
      v11 = (void *)MEMORY[0x18D78EB2C](v10);
      v12 = getCATransactionClass_12612;
      v13 = *(id *)(a1 + 64);
      -[objc_class begin](v12(), "begin");
      -[objc_class setDisableActions:](getCATransactionClass_12612(), "setDisableActions:", 1);
      objc_msgSend(v13, "setContents:", *(_QWORD *)(a1 + 72));
      objc_msgSend(v13, "setEdgeAntialiasingMask:", 0);

      -[objc_class commit](getCATransactionClass_12612(), "commit");
      objc_autoreleasePoolPop(v11);
      v18 = 0;
      if (gLogCategory_ScreenStream <= 50)
      {
        if (gLogCategory_ScreenStream != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_ScreenStream, 0x32u))
          LogPrintF((uint64_t)&gLogCategory_ScreenStream, (uint64_t)"OSStatus ScreenStreamStart(ScreenStreamRef)", 0x32u, (uint64_t)"Screen stream started\n", v14, v15, v16, v17, v20);
        return 0;
      }
      return v18;
    }
    v18 = 4294960596;
  }
  else
  {
    v18 = 4294960551;
  }
  if (gLogCategory_ScreenStream <= 90
    && (gLogCategory_ScreenStream != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_ScreenStream, 0x5Au)))
  {
    LogPrintF((uint64_t)&gLogCategory_ScreenStream, (uint64_t)"OSStatus ScreenStreamStart(ScreenStreamRef)", 0x5Au, (uint64_t)"### Start screen stream failed: %#m\n", a5, a6, a7, a8, v18);
  }
  ScreenStreamStop(a1, a2, a3, a4, a5, a6, a7, a8, v20);
  return v18;
}

id CATransactionFunction_12613()
{
  return (id)classCATransaction_12622;
}

Class initCATransaction_12614()
{
  Class result;

  if (QuartzCoreLibrary_sOnce_12581 != -1)
    dispatch_once(&QuartzCoreLibrary_sOnce_12581, &__block_literal_global_12582);
  result = objc_getClass("CATransaction");
  classCATransaction_12622 = (uint64_t)result;
  getCATransactionClass_12612 = (uint64_t (*)())CATransactionFunction_12613;
  return result;
}

void ScreenStreamStop(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10;
  void *v11;
  uint64_t v12;

  if (gLogCategory_ScreenStream <= 50
    && (gLogCategory_ScreenStream != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_ScreenStream, 0x32u)))
  {
    LogPrintF((uint64_t)&gLogCategory_ScreenStream, (uint64_t)"void ScreenStreamStop(ScreenStreamRef)", 0x32u, (uint64_t)"Screen stream stopping...\n", a5, a6, a7, a8, v12);
  }
  v10 = *(_QWORD *)(a1 + 56);
  if (v10)
  {
    ((void (*)(uint64_t))softLinkVTDecompressionSessionWaitForAsynchronousFrames[0])(v10);
    ((void (*)(uint64_t))softLinkVTDecompressionSessionInvalidate[0])(*(_QWORD *)(a1 + 56));
    CFRelease(*(CFTypeRef *)(a1 + 56));
    *(_QWORD *)(a1 + 56) = 0;
  }
  if (*(_QWORD *)(a1 + 72))
  {
    -[objc_class begin](getCATransactionClass_12612(), "begin");
    -[objc_class setDisableActions:](getCATransactionClass_12612(), "setDisableActions:", 1);
    v11 = *(void **)(a1 + 64);
    if (v11)
      objc_msgSend(v11, "setContents:", 0);
    -[objc_class commit](getCATransactionClass_12612(), "commit");
    ((void (*)(uint64_t))softLinkCAImageQueueInvalidate[0])(*(_QWORD *)(a1 + 72));
    CFRelease(*(CFTypeRef *)(a1 + 72));
    *(_QWORD *)(a1 + 72) = 0;
  }
  if (gLogCategory_ScreenStream <= 50
    && (gLogCategory_ScreenStream != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_ScreenStream, 0x32u)))
  {
    LogPrintF((uint64_t)&gLogCategory_ScreenStream, (uint64_t)"void ScreenStreamStop(ScreenStreamRef)", 0x32u, (uint64_t)"Screen stream stopped\n", a5, a6, a7, a8, a9);
  }
}

uint64_t initVTDecompressionSessionWaitForAsynchronousFrames(uint64_t a1)
{
  if (VideoToolboxLibrary_sOnce_12587 != -1)
    dispatch_once(&VideoToolboxLibrary_sOnce_12587, &__block_literal_global_27_12588);
  softLinkVTDecompressionSessionWaitForAsynchronousFrames[0] = (uint64_t (*)())dlsym((void *)VideoToolboxLibrary_sLib_12589, "VTDecompressionSessionWaitForAsynchronousFrames");
  return ((uint64_t (*)(uint64_t))softLinkVTDecompressionSessionWaitForAsynchronousFrames[0])(a1);
}

uint64_t initCAImageQueueSetFlags(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (QuartzCoreLibrary_sOnce_12581 != -1)
    dispatch_once(&QuartzCoreLibrary_sOnce_12581, &__block_literal_global_12582);
  softLinkCAImageQueueSetFlags[0] = (uint64_t (*)())dlsym((void *)QuartzCoreLibrary_sLib_12583, "CAImageQueueSetFlags");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkCAImageQueueSetFlags[0])(a1, a2, a3);
}

uint64_t initCAImageQueueCreate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (QuartzCoreLibrary_sOnce_12581 != -1)
    dispatch_once(&QuartzCoreLibrary_sOnce_12581, &__block_literal_global_12582);
  softLinkCAImageQueueCreate[0] = (uint64_t (*)())dlsym((void *)QuartzCoreLibrary_sLib_12583, "CAImageQueueCreate");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkCAImageQueueCreate[0])(a1, a2, a3);
}

uint64_t ScreenStreamProcessData(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t), uint64_t a7, uint64_t a8)
{
  int v11;
  const __CFData *v14;
  int BytePtr;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int Length;
  uint64_t v21;
  uint64_t v22;
  const void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v30;
  const void *v31;
  const void *v32;
  const void *v33;
  const void *v34;
  const void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  CFTypeRef cf;
  _OWORD v46[3];
  __int128 v47;
  uint64_t v48;
  int v49;
  CFTypeRef v50;
  uint64_t v51;

  v11 = a3;
  v50 = 0;
  v51 = a3;
  v49 = 0;
  v48 = 0;
  v47 = 0u;
  memset(v46, 0, sizeof(v46));
  cf = 0;
  if (!*(_QWORD *)(a1 + 48) || *(_BYTE *)(a1 + 41))
  {
    *(_QWORD *)&v43 = 0;
    v14 = *(const __CFData **)(a1 + 16);
    if (!v14 || !*(_DWORD *)(a1 + 24) || !*(_DWORD *)(a1 + 28))
    {
      v22 = 4294960551;
      goto LABEL_39;
    }
    BytePtr = CFDataGetBytePtr(v14);
    Length = CFDataGetLength(*(CFDataRef *)(a1 + 16));
    if (gLogCategory_ScreenStream <= 40
      && (gLogCategory_ScreenStream != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_ScreenStream, 0x28u)))
    {
      LogPrintF((uint64_t)&gLogCategory_ScreenStream, (uint64_t)"OSStatus _ScreenStreamEnsureDecoderSetUp(ScreenStreamRef)", 0x28u, (uint64_t)"Screen stream format change to %u x %x, avcc 0x%.3H\n", v16, v17, v18, v19, *(unsigned int *)(a1 + 24));
    }
    v21 = softLinkFigVideoFormatDescriptionCreateWithSampleDescriptionExtensionAtom(0, 1635148593, *(_DWORD *)(a1 + 24), *(_DWORD *)(a1 + 28), 1635148611, BytePtr, Length, 0, (uint64_t)&v43);
    if ((_DWORD)v21)
      goto LABEL_11;
    v23 = *(const void **)(a1 + 48);
    if (v23)
      CFRelease(v23);
    *(_QWORD *)(a1 + 48) = v43;
    ((void (*)(uint64_t, uint64_t, uint64_t))softLinkCAImageQueueSetSize[0])(*(_QWORD *)(a1 + 72), *(unsigned int *)(a1 + 24), *(unsigned int *)(a1 + 28));
    v24 = *(_QWORD *)(a1 + 56);
    if (v24
      && !((unsigned int (*)(uint64_t, uint64_t))softLinkVTDecompressionSessionCanAcceptFormatDescription[0])(v24, *(_QWORD *)(a1 + 48)))
    {
      if (gLogCategory_ScreenStream <= 40
        && (gLogCategory_ScreenStream != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_ScreenStream, 0x28u)))
      {
        LogPrintF((uint64_t)&gLogCategory_ScreenStream, (uint64_t)"OSStatus _ScreenStreamEnsureDecoderSetUp(ScreenStreamRef)", 0x28u, (uint64_t)"Screen stream rebuilding for format change\n", v25, v26, v27, v28, v42);
      }
      ((void (*)(uint64_t))softLinkVTDecompressionSessionWaitForAsynchronousFrames[0])(*(_QWORD *)(a1 + 56));
      ((void (*)(uint64_t))softLinkVTDecompressionSessionInvalidate[0])(*(_QWORD *)(a1 + 56));
      CFRelease(*(CFTypeRef *)(a1 + 56));
      *(_QWORD *)(a1 + 56) = 0;
    }
    *(_BYTE *)(a1 + 41) = 0;
  }
  if (!*(_QWORD *)(a1 + 56))
  {
    *(_QWORD *)&v43 = _ScreenStreamDecodeCompleted;
    *((_QWORD *)&v43 + 1) = a1;
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (!Mutable)
    {
      v22 = 4294960568;
      goto LABEL_39;
    }
    v30 = Mutable;
    v31 = (const void *)getkVTDecompressionPropertyKey_Usage[0]();
    CFDictionarySetInt64(v30, v31, 20);
    v32 = (const void *)getkVTVideoDecoderSpecification_EnableHardwareAcceleratedVideoDecoder[0]();
    v33 = (const void *)*MEMORY[0x1E0C9AE50];
    CFDictionarySetValue(v30, v32, (const void *)*MEMORY[0x1E0C9AE50]);
    if (*(_BYTE *)(a1 + 40))
    {
      v34 = (const void *)getkVTVideoDecoderSpecification_RequireHardwareAcceleratedVideoDecoder[0]();
      CFDictionarySetValue(v30, v34, v33);
    }
    v35 = (const void *)getkVTVideoDecoderSpecification_EnableSandboxedVideoDecoder[0]();
    CFDictionarySetValue(v30, v35, (const void *)*MEMORY[0x1E0C9AE40]);
    v36 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))softLinkVTDecompressionSessionCreate[0])(0, *(_QWORD *)(a1 + 48), (uint64_t)v30, 0, (uint64_t)&v43, a1 + 56);
    CFRelease(v30);
    if ((_DWORD)v36)
    {
      if (gLogCategory_ScreenStream <= 50
        && (gLogCategory_ScreenStream != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_ScreenStream, 0x32u)))
      {
        LogPrintF((uint64_t)&gLogCategory_ScreenStream, (uint64_t)"OSStatus _ScreenStreamEnsureDecoderSetUp(ScreenStreamRef)", 0x32u, (uint64_t)"### Screen stream setup decoder failed...retrying with defaults: %#m\n", v37, v38, v39, v40, v36);
      }
      v21 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))softLinkVTDecompressionSessionCreate[0])(0, *(_QWORD *)(a1 + 48), 0, 0, (uint64_t)&v43, a1 + 56);
      if ((_DWORD)v21)
      {
LABEL_11:
        v22 = v21;
        goto LABEL_39;
      }
    }
  }
  v22 = softLinkCMBlockBufferCreateWithMemoryBlock(0, a2, v11, *MEMORY[0x1E0C9AE20], 0, 0, v11, 0, (uint64_t)&v50);
  if (!(_DWORD)v22)
  {
    ((void (*)(uint64_t@<X8>))getkCMTimeInvalid[0])((uint64_t)v46);
    ((void (*)(uint64_t@<X8>))getkCMTimeInvalid[0])((uint64_t)&v43);
    v47 = v43;
    v48 = v44;
    softLinkCMClockMakeHostTimeFromSystemUnits(a4);
    *(_OWORD *)((char *)&v46[1] + 8) = v43;
    *((_QWORD *)&v46[2] + 1) = v44;
    v22 = softLinkCMSampleBufferCreate(0, (int)v50, 1, 0, 0, *(_QWORD *)(a1 + 48), 1, 1, (uint64_t)v46, 1, (uint64_t)&v51, (uint64_t)&cf);
    CFRelease(v50);
    if (!(_DWORD)v22)
    {
      v22 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))softLinkVTDecompressionSessionDecodeFrame[0])(*(_QWORD *)(a1 + 56), (uint64_t)cf, 0, 0, (uint64_t)&v49);
      CFRelease(cf);
      if (!(_DWORD)v22)
      {
        v22 = 0;
        if ((v49 & 2) != 0)
          ++*(_DWORD *)(a1 + 96);
      }
    }
  }
LABEL_39:
  if (a6)
    a6(a7);
  if ((_DWORD)v22
    && gLogCategory_ScreenStream <= 90
    && (gLogCategory_ScreenStream != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_ScreenStream, 0x5Au)))
  {
    LogPrintF((uint64_t)&gLogCategory_ScreenStream, (uint64_t)"OSStatus ScreenStreamProcessData(ScreenStreamRef, const uint8_t *, size_t, uint64_t, CFDictionaryRef, ScreenStreamCompletion_f, void *)", 0x5Au, (uint64_t)"### Screen stream process data failed: %#m\n", a5, (uint64_t)a6, a7, a8, v22);
  }
  return v22;
}

uint64_t _ScreenStreamDecodeCompleted(uint64_t result, uint64_t a2, int a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  uint64_t v10;
  void (*v13)(uint64_t, uint64_t, _QWORD);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;

  v9 = a3;
  v10 = result;
  if (a3)
  {
    if ((a4 & 2) == 0)
      goto LABEL_3;
LABEL_13:
    ++*(_DWORD *)(v10 + 96);
    if (!v9)
      return result;
    goto LABEL_14;
  }
  v13 = *(void (**)(uint64_t, uint64_t, _QWORD))(result + 80);
  if (v13)
  {
    v19 = *(_OWORD *)a6;
    v20 = *(_QWORD *)(a6 + 16);
    v14 = ((uint64_t (*)(__int128 *))softLinkCMClockConvertHostTimeToSystemUnits[0])(&v19);
    v13(a5, v14, *(_QWORD *)(v10 + 88));
  }
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkCAImageQueueRegisterCVImageBuffer[0])(*(_QWORD *)(v10 + 72), a5, 0);
  if (!result)
    goto LABEL_12;
  v15 = result;
  ((void (*)(uint64_t))softLinkCAImageQueueCollect[0])(*(_QWORD *)(v10 + 72));
  v16 = *(_QWORD *)(v10 + 72);
  v19 = *(_OWORD *)a6;
  v20 = *(_QWORD *)(a6 + 16);
  ((void (*)(__int128 *))softLinkCMTimeGetSeconds[0])(&v19);
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double))softLinkCAImageQueueInsertImage[0])(v16, 3, v15, 1, (uint64_t)_ScreenStreamImageReleased, v10, v17);
  if ((result & 1) == 0)
  {
    result = ((uint64_t (*)(uint64_t, uint64_t))softLinkCAImageQueueDeleteBuffer[0])(*(_QWORD *)(v10 + 72), v15);
LABEL_12:
    v9 = -6700;
    if ((a4 & 2) != 0)
      goto LABEL_13;
    goto LABEL_3;
  }
  v9 = 0;
  if ((a4 & 2) != 0)
    goto LABEL_13;
LABEL_3:
  if (!v9)
    return result;
LABEL_14:
  v18 = (*(_DWORD *)(v10 + 100) + 1);
  *(_DWORD *)(v10 + 100) = v18;
  if (gLogCategory_ScreenStream <= 50)
  {
    if (gLogCategory_ScreenStream != -1)
      return LogPrintF((uint64_t)&gLogCategory_ScreenStream, (uint64_t)"void _ScreenStreamDecodeCompleted(void *, void *, OSStatus, VTDecodeInfoFlags, CVImageBufferRef, CMTime, CMTime)", 0x32u, (uint64_t)"### Screen stream decode error (%u total): %#m\n", a5, a6, a7, a8, v18);
    result = _LogCategory_Initialize((uint64_t)&gLogCategory_ScreenStream, 0x32u);
    if ((_DWORD)result)
    {
      v18 = *(unsigned int *)(v10 + 100);
      return LogPrintF((uint64_t)&gLogCategory_ScreenStream, (uint64_t)"void _ScreenStreamDecodeCompleted(void *, void *, OSStatus, VTDecodeInfoFlags, CVImageBufferRef, CMTime, CMTime)", 0x32u, (uint64_t)"### Screen stream decode error (%u total): %#m\n", a5, a6, a7, a8, v18);
    }
  }
  return result;
}

uint64_t initValkVTDecompressionPropertyKey_Usage()
{
  uint64_t *v0;
  uint64_t result;

  if (VideoToolboxLibrary_sOnce_12587 != -1)
    dispatch_once(&VideoToolboxLibrary_sOnce_12587, &__block_literal_global_27_12588);
  v0 = (uint64_t *)dlsym((void *)VideoToolboxLibrary_sLib_12589, "kVTDecompressionPropertyKey_Usage");
  if (v0)
  {
    result = *v0;
    constantValkVTDecompressionPropertyKey_Usage = result;
  }
  else
  {
    result = constantValkVTDecompressionPropertyKey_Usage;
  }
  getkVTDecompressionPropertyKey_Usage[0] = kVTDecompressionPropertyKey_UsageFunction;
  return result;
}

uint64_t kVTDecompressionPropertyKey_UsageFunction()
{
  return constantValkVTDecompressionPropertyKey_Usage;
}

uint64_t initValkVTVideoDecoderSpecification_EnableHardwareAcceleratedVideoDecoder()
{
  uint64_t *v0;
  uint64_t result;

  if (VideoToolboxLibrary_sOnce_12587 != -1)
    dispatch_once(&VideoToolboxLibrary_sOnce_12587, &__block_literal_global_27_12588);
  v0 = (uint64_t *)dlsym((void *)VideoToolboxLibrary_sLib_12589, "kVTVideoDecoderSpecification_EnableHardwareAcceleratedVideoDecoder");
  if (v0)
  {
    result = *v0;
    constantValkVTVideoDecoderSpecification_EnableHardwareAcceleratedVideoDecoder = result;
  }
  else
  {
    result = constantValkVTVideoDecoderSpecification_EnableHardwareAcceleratedVideoDecoder;
  }
  getkVTVideoDecoderSpecification_EnableHardwareAcceleratedVideoDecoder[0] = kVTVideoDecoderSpecification_EnableHardwareAcceleratedVideoDecoderFunction;
  return result;
}

uint64_t kVTVideoDecoderSpecification_EnableHardwareAcceleratedVideoDecoderFunction()
{
  return constantValkVTVideoDecoderSpecification_EnableHardwareAcceleratedVideoDecoder;
}

uint64_t initValkVTVideoDecoderSpecification_RequireHardwareAcceleratedVideoDecoder()
{
  uint64_t *v0;
  uint64_t result;

  if (VideoToolboxLibrary_sOnce_12587 != -1)
    dispatch_once(&VideoToolboxLibrary_sOnce_12587, &__block_literal_global_27_12588);
  v0 = (uint64_t *)dlsym((void *)VideoToolboxLibrary_sLib_12589, "kVTVideoDecoderSpecification_RequireHardwareAcceleratedVideoDecoder");
  if (v0)
  {
    result = *v0;
    constantValkVTVideoDecoderSpecification_RequireHardwareAcceleratedVideoDecoder = result;
  }
  else
  {
    result = constantValkVTVideoDecoderSpecification_RequireHardwareAcceleratedVideoDecoder;
  }
  getkVTVideoDecoderSpecification_RequireHardwareAcceleratedVideoDecoder[0] = kVTVideoDecoderSpecification_RequireHardwareAcceleratedVideoDecoderFunction;
  return result;
}

uint64_t kVTVideoDecoderSpecification_RequireHardwareAcceleratedVideoDecoderFunction()
{
  return constantValkVTVideoDecoderSpecification_RequireHardwareAcceleratedVideoDecoder;
}

uint64_t initValkVTVideoDecoderSpecification_EnableSandboxedVideoDecoder()
{
  uint64_t *v0;
  uint64_t result;

  if (VideoToolboxLibrary_sOnce_12587 != -1)
    dispatch_once(&VideoToolboxLibrary_sOnce_12587, &__block_literal_global_27_12588);
  v0 = (uint64_t *)dlsym((void *)VideoToolboxLibrary_sLib_12589, "kVTVideoDecoderSpecification_EnableSandboxedVideoDecoder");
  if (v0)
  {
    result = *v0;
    constantValkVTVideoDecoderSpecification_EnableSandboxedVideoDecoder = result;
  }
  else
  {
    result = constantValkVTVideoDecoderSpecification_EnableSandboxedVideoDecoder;
  }
  getkVTVideoDecoderSpecification_EnableSandboxedVideoDecoder[0] = kVTVideoDecoderSpecification_EnableSandboxedVideoDecoderFunction;
  return result;
}

uint64_t kVTVideoDecoderSpecification_EnableSandboxedVideoDecoderFunction()
{
  return constantValkVTVideoDecoderSpecification_EnableSandboxedVideoDecoder;
}

double initValkCMTimeInvalid@<D0>(uint64_t a1@<X8>)
{
  __int128 *v2;
  __int128 v3;
  double result;

  if (CoreMediaLibrary_sOnce != -1)
    dispatch_once(&CoreMediaLibrary_sOnce, &__block_literal_global_32);
  v2 = (__int128 *)dlsym((void *)CoreMediaLibrary_sLib, "kCMTimeInvalid");
  if (v2)
  {
    v3 = *v2;
    qword_1EE069E60 = *((_QWORD *)v2 + 2);
    constantValkCMTimeInvalid = v3;
  }
  getkCMTimeInvalid[0] = (uint64_t (*)())kCMTimeInvalidFunction;
  result = *(double *)&constantValkCMTimeInvalid;
  *(_OWORD *)a1 = constantValkCMTimeInvalid;
  *(_QWORD *)(a1 + 16) = qword_1EE069E60;
  return result;
}

double kCMTimeInvalidFunction@<D0>(uint64_t a1@<X8>)
{
  double result;

  result = *(double *)&constantValkCMTimeInvalid;
  *(_OWORD *)a1 = constantValkCMTimeInvalid;
  *(_QWORD *)(a1 + 16) = qword_1EE069E60;
  return result;
}

uint64_t initVTDecompressionSessionDecodeFrame(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (VideoToolboxLibrary_sOnce_12587 != -1)
    dispatch_once(&VideoToolboxLibrary_sOnce_12587, &__block_literal_global_27_12588);
  softLinkVTDecompressionSessionDecodeFrame[0] = (uint64_t (*)())dlsym((void *)VideoToolboxLibrary_sLib_12589, "VTDecompressionSessionDecodeFrame");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))softLinkVTDecompressionSessionDecodeFrame[0])(a1, a2, a3, a4, a5);
}

uint64_t initCMSampleBufferCreate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (CoreMediaLibrary_sOnce != -1)
    dispatch_once(&CoreMediaLibrary_sOnce, &__block_literal_global_32);
  softLinkCMSampleBufferCreate = (uint64_t (*)(int, int, int, int, int, int, int, int, uint64_t, uint64_t, uint64_t, uint64_t))dlsym((void *)CoreMediaLibrary_sLib, "CMSampleBufferCreate");
  return softLinkCMSampleBufferCreate(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

uint64_t initCMClockMakeHostTimeFromSystemUnits(uint64_t a1)
{
  if (CoreMediaLibrary_sOnce != -1)
    dispatch_once(&CoreMediaLibrary_sOnce, &__block_literal_global_32);
  softLinkCMClockMakeHostTimeFromSystemUnits = (uint64_t (*)())dlsym((void *)CoreMediaLibrary_sLib, "CMClockMakeHostTimeFromSystemUnits");
  return ((uint64_t (*)(uint64_t))softLinkCMClockMakeHostTimeFromSystemUnits)(a1);
}

uint64_t initCMBlockBufferCreateWithMemoryBlock(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (CoreMediaLibrary_sOnce != -1)
    dispatch_once(&CoreMediaLibrary_sOnce, &__block_literal_global_32);
  softLinkCMBlockBufferCreateWithMemoryBlock = (uint64_t (*)(int, int, int, int, int, int, int, int, uint64_t))dlsym((void *)CoreMediaLibrary_sLib, "CMBlockBufferCreateWithMemoryBlock");
  return softLinkCMBlockBufferCreateWithMemoryBlock(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t initVTDecompressionSessionCreate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (VideoToolboxLibrary_sOnce_12587 != -1)
    dispatch_once(&VideoToolboxLibrary_sOnce_12587, &__block_literal_global_27_12588);
  softLinkVTDecompressionSessionCreate[0] = (uint64_t (*)())dlsym((void *)VideoToolboxLibrary_sLib_12589, "VTDecompressionSessionCreate");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))softLinkVTDecompressionSessionCreate[0])(a1, a2, a3, a4, a5, a6);
}

uint64_t _ScreenStreamImageReleased(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _DWORD *v5;

  v5 = (_DWORD *)softLinkCAImageQueueGetReleasedImageInfo[0]();
  if (v5 && !*v5)
    ++*(_DWORD *)(a3 + 104);
  return ((uint64_t (*)(uint64_t, uint64_t))softLinkCAImageQueueDeleteBuffer[0])(*(_QWORD *)(a3 + 72), a2);
}

uint64_t initCAImageQueueDeleteBuffer(uint64_t a1, uint64_t a2)
{
  if (QuartzCoreLibrary_sOnce_12581 != -1)
    dispatch_once(&QuartzCoreLibrary_sOnce_12581, &__block_literal_global_12582);
  softLinkCAImageQueueDeleteBuffer[0] = (uint64_t (*)())dlsym((void *)QuartzCoreLibrary_sLib_12583, "CAImageQueueDeleteBuffer");
  return ((uint64_t (*)(uint64_t, uint64_t))softLinkCAImageQueueDeleteBuffer[0])(a1, a2);
}

uint64_t initCAImageQueueInsertImage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7)
{
  if (QuartzCoreLibrary_sOnce_12581 != -1)
    dispatch_once(&QuartzCoreLibrary_sOnce_12581, &__block_literal_global_12582);
  softLinkCAImageQueueInsertImage[0] = (uint64_t (*)())dlsym((void *)QuartzCoreLibrary_sLib_12583, "CAImageQueueInsertImage");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double))softLinkCAImageQueueInsertImage[0])(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t initCAImageQueueGetReleasedImageInfo()
{
  if (QuartzCoreLibrary_sOnce_12581 != -1)
    dispatch_once(&QuartzCoreLibrary_sOnce_12581, &__block_literal_global_12582);
  softLinkCAImageQueueGetReleasedImageInfo[0] = (uint64_t (*)())dlsym((void *)QuartzCoreLibrary_sLib_12583, "CAImageQueueGetReleasedImageInfo");
  return softLinkCAImageQueueGetReleasedImageInfo[0]();
}

uint64_t initCMTimeGetSeconds(__int128 *a1)
{
  __int128 v3;
  uint64_t v4;

  if (CoreMediaLibrary_sOnce != -1)
    dispatch_once(&CoreMediaLibrary_sOnce, &__block_literal_global_32);
  softLinkCMTimeGetSeconds[0] = (uint64_t (*)())dlsym((void *)CoreMediaLibrary_sLib, "CMTimeGetSeconds");
  v3 = *a1;
  v4 = *((_QWORD *)a1 + 2);
  return ((uint64_t (*)(__int128 *))softLinkCMTimeGetSeconds[0])(&v3);
}

uint64_t initCAImageQueueCollect(uint64_t a1)
{
  if (QuartzCoreLibrary_sOnce_12581 != -1)
    dispatch_once(&QuartzCoreLibrary_sOnce_12581, &__block_literal_global_12582);
  softLinkCAImageQueueCollect[0] = (uint64_t (*)())dlsym((void *)QuartzCoreLibrary_sLib_12583, "CAImageQueueCollect");
  return ((uint64_t (*)(uint64_t))softLinkCAImageQueueCollect[0])(a1);
}

uint64_t initCAImageQueueRegisterCVImageBuffer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (QuartzCoreLibrary_sOnce_12581 != -1)
    dispatch_once(&QuartzCoreLibrary_sOnce_12581, &__block_literal_global_12582);
  softLinkCAImageQueueRegisterCVImageBuffer[0] = (uint64_t (*)())dlsym((void *)QuartzCoreLibrary_sLib_12583, "CAImageQueueRegisterCVImageBuffer");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkCAImageQueueRegisterCVImageBuffer[0])(a1, a2, a3);
}

uint64_t initCMClockConvertHostTimeToSystemUnits(__int128 *a1)
{
  __int128 v3;
  uint64_t v4;

  if (CoreMediaLibrary_sOnce != -1)
    dispatch_once(&CoreMediaLibrary_sOnce, &__block_literal_global_32);
  softLinkCMClockConvertHostTimeToSystemUnits[0] = (uint64_t (*)())dlsym((void *)CoreMediaLibrary_sLib, "CMClockConvertHostTimeToSystemUnits");
  v3 = *a1;
  v4 = *((_QWORD *)a1 + 2);
  return ((uint64_t (*)(__int128 *))softLinkCMClockConvertHostTimeToSystemUnits[0])(&v3);
}

uint64_t initVTDecompressionSessionCanAcceptFormatDescription(uint64_t a1, uint64_t a2)
{
  if (VideoToolboxLibrary_sOnce_12587 != -1)
    dispatch_once(&VideoToolboxLibrary_sOnce_12587, &__block_literal_global_27_12588);
  softLinkVTDecompressionSessionCanAcceptFormatDescription[0] = (uint64_t (*)())dlsym((void *)VideoToolboxLibrary_sLib_12589, "VTDecompressionSessionCanAcceptFormatDescription");
  return ((uint64_t (*)(uint64_t, uint64_t))softLinkVTDecompressionSessionCanAcceptFormatDescription[0])(a1, a2);
}

uint64_t initCAImageQueueSetSize(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (QuartzCoreLibrary_sOnce_12581 != -1)
    dispatch_once(&QuartzCoreLibrary_sOnce_12581, &__block_literal_global_12582);
  softLinkCAImageQueueSetSize[0] = (uint64_t (*)())dlsym((void *)QuartzCoreLibrary_sLib_12583, "CAImageQueueSetSize");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkCAImageQueueSetSize[0])(a1, a2, a3);
}

uint64_t initFigVideoFormatDescriptionCreateWithSampleDescriptionExtensionAtom(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (CoreMediaLibrary_sOnce != -1)
    dispatch_once(&CoreMediaLibrary_sOnce, &__block_literal_global_32);
  softLinkFigVideoFormatDescriptionCreateWithSampleDescriptionExtensionAtom = (uint64_t (*)(int, int, int, int, int, int, int, int, uint64_t))dlsym((void *)CoreMediaLibrary_sLib, "FigVideoFormatDescriptionCreateWithSampleDescriptionExtensionAtom");
  return softLinkFigVideoFormatDescriptionCreateWithSampleDescriptionExtensionAtom(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t SDPFindAttribute(char *a1, unint64_t a2, unsigned __int8 *a3, _QWORD *a4, _QWORD *a5, char **a6)
{
  uint64_t result;
  uint64_t v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  int v17;
  uint64_t v18;
  unsigned __int8 *v19;
  char v20;
  char *v21;

  v21 = a1;
  v20 = 0;
  v18 = 0;
  v19 = 0;
  while (1)
  {
    result = SDPGetNext(a1, a2, &v20, &v19, (unsigned __int8 **)&v18, &v21);
    if ((_DWORD)result)
      break;
    if (v20 == 97 && v18 >= 1)
    {
      v12 = 0;
      v13 = v19;
      v14 = &v19[v18];
      v15 = v19;
      while (*v15 != 58)
      {
        ++v15;
        --v12;
        if (v15 >= v14)
          goto LABEL_15;
      }
      v16 = a3;
      while (v12)
      {
        v17 = *v16;
        if (*v13 != v17)
          goto LABEL_15;
        ++v16;
        ++v13;
        ++v12;
        if (!v17)
          goto LABEL_16;
      }
      if (a3[v15 - v19])
        goto LABEL_15;
LABEL_16:
      result = 0;
      *a4 = v15 + 1;
      *a5 = v14 - (v15 + 1);
      break;
    }
LABEL_15:
    a1 = v21;
  }
  if (a6)
    *a6 = v21;
  return result;
}

uint64_t SDPGetNext(char *a1, unint64_t a2, _BYTE *a3, _QWORD *a4, unsigned __int8 **a5, _QWORD *a6)
{
  uint64_t v6;
  _BYTE *v7;
  unsigned __int8 *v8;
  int v9;
  char v11;
  unsigned __int8 *v12;
  unint64_t v13;
  int v14;
  uint64_t result;

  if ((unint64_t)a1 >= a2)
    return 4294960569;
  v6 = a2 - (_QWORD)a1 - 2;
  if ((uint64_t)(a2 - (_QWORD)a1) < 2)
    return 4294960553;
  if (a1[1] != 61)
    return 4294960554;
  v7 = a1 + 2;
  v8 = (unsigned __int8 *)(a1 + 2);
  if ((unint64_t)(a1 + 2) < a2)
  {
    v8 = (unsigned __int8 *)(a1 + 2);
    while (1)
    {
      v9 = *v8;
      if (v9 == 10 || v9 == 13)
        break;
      ++v8;
      if (!--v6)
      {
        v8 = (unsigned __int8 *)a2;
        break;
      }
    }
  }
  v11 = *a1;
  v12 = (unsigned __int8 *)(v8 - v7);
  if ((unint64_t)v8 < a2)
  {
    v13 = a2 - (_QWORD)v8;
    while (1)
    {
      v14 = *v8;
      if (v14 != 13 && v14 != 10)
        break;
      ++v8;
      if (!--v13)
      {
        v8 = (unsigned __int8 *)a2;
        break;
      }
    }
  }
  result = 0;
  *a3 = v11;
  *a4 = v7;
  *a5 = v12;
  *a6 = v8;
  return result;
}

uint64_t SDPFindMediaSection(char *a1, unint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, unsigned __int8 **a6, _QWORD *a7)
{
  unsigned __int8 *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  unsigned __int8 *v17;
  uint64_t v18;
  char v19;
  char *v20;

  v20 = a1;
  v19 = 0;
  v17 = 0;
  v18 = 0;
  do
  {
    if (SDPGetNext(v20, a2, &v19, &v18, &v17, &v20))
      return 4294960569;
  }
  while (v19 != 109);
  v13 = v17;
  v14 = v18;
  v15 = v18 - 2;
  while (!SDPGetNext(v20, a2, &v19, &v18, &v17, &v20))
  {
    if (v19 == 109)
    {
      v20 = (char *)(v18 - 2);
      break;
    }
  }
  if (a3)
    *a3 = v15;
  if (a4)
    *a4 = v20;
  if (a5)
    *a5 = v14;
  if (a6)
    *a6 = v13;
  result = 0;
  if (a7)
    *a7 = v20;
  return result;
}

uint64_t SDPFindParameter(_BYTE *a1, _BYTE *a2, unsigned __int8 *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6)
{
  _BYTE *v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL4 v17;
  _BYTE *v18;
  uint64_t v19;
  int v20;
  _BYTE *v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  unsigned __int8 *v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t result;

  v12 = a2 - 1;
  v13 = MEMORY[0x1E0C80978];
LABEL_2:
  while (2)
  {
    v14 = a1;
    if (a1 < a2)
    {
      v15 = a2 - a1;
      v14 = a1;
      do
      {
        v16 = *v14;
        if ((char)*v14 < 0)
        {
          if (!__maskrune(v16, 0x4000uLL))
            goto LABEL_10;
        }
        else if ((*(_DWORD *)(v13 + 4 * v16 + 60) & 0x4000) == 0)
        {
          goto LABEL_10;
        }
        ++v14;
        --v15;
      }
      while (v15);
      v14 = a2;
    }
LABEL_10:
    if (v14 == a2)
    {
      v29 = 4294960569;
      result = 4294960569;
      if (!a6)
        return result;
      goto LABEL_45;
    }
    if (v14 >= a2)
    {
      v17 = 0;
      goto LABEL_15;
    }
    if (*v14 == 61)
    {
      v17 = 1;
LABEL_15:
      v18 = v14;
      goto LABEL_22;
    }
    v19 = v12 - v14;
    v18 = v14;
    while (v19)
    {
      v20 = *++v18;
      --v19;
      if (v20 == 61)
        goto LABEL_21;
    }
    v18 = a2;
LABEL_21:
    v17 = v18 < a2;
LABEL_22:
    v21 = &v18[v17];
    if (v21 >= a2)
    {
      v23 = 0;
      v22 = v21;
    }
    else
    {
      v22 = v21;
      while (*v22 != 59)
      {
        if (++v22 >= a2)
        {
          v23 = 0;
          v22 = a2;
          goto LABEL_29;
        }
      }
      v23 = 1;
    }
LABEL_29:
    v24 = v18 - v14;
    a1 = &v22[v23];
    v25 = (_BYTE *)(v14 - v18);
    v26 = a3;
    while (v25)
    {
      v27 = *v26;
      if (*v14 != v27)
        goto LABEL_2;
      ++v26;
      ++v14;
      ++v25;
      if (!v27)
        goto LABEL_40;
    }
    if (a3[v24])
      v28 = -1;
    else
      v28 = 0;
    if (v28)
      continue;
    break;
  }
LABEL_40:
  if (a4)
    *a4 = v21;
  if (a5)
    *a5 = v22 - v21;
  v29 = 0;
  result = 0;
  if (a6)
  {
LABEL_45:
    *a6 = a1;
    return v29;
  }
  return result;
}

uint64_t SDPFindSessionSection(char *a1, unint64_t a2, char **a3, _QWORD *a4, _QWORD *a5)
{
  unsigned __int8 *v11;
  uint64_t v12;
  char v13;
  char *v14;

  v14 = a1;
  v13 = 0;
  v12 = 0;
  while (!SDPGetNext(v14, a2, &v13, &v12, &v11, &v14))
  {
    if (v13 == 109)
    {
      v14 = (char *)(v12 - 2);
      break;
    }
  }
  if (a3)
    *a3 = a1;
  if (a4)
    *a4 = v14;
  if (a5)
    *a5 = v14;
  return 0;
}

uint64_t SDPFindType(char *a1, unint64_t a2, unsigned __int8 a3, _QWORD *a4, _QWORD *a5, _QWORD *a6)
{
  int v10;
  uint64_t result;
  unsigned __int8 *v12;
  uint64_t v13;
  unsigned __int8 v14;
  char *v15;

  v15 = a1;
  v14 = 0;
  v10 = a3;
  v12 = 0;
  v13 = 0;
  while (1)
  {
    result = SDPGetNext(v15, a2, &v14, &v13, &v12, &v15);
    if ((_DWORD)result)
      break;
    if (v14 == v10)
    {
      if (a4)
        *a4 = v13;
      result = 0;
      if (a5)
        *a5 = v12;
      break;
    }
  }
  if (a6)
    *a6 = v15;
  return result;
}

uint64_t SDPGetNextAttribute(char *a1, unint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, _QWORD *a7)
{
  uint64_t result;
  _BYTE *v14;
  unsigned __int8 *v15;
  uint64_t v16;
  _BYTE *v17;
  _BYTE *v18;
  uint64_t v19;
  _BYTE *v20;
  char v21;
  char *v22;

  v22 = a1;
  v21 = 0;
  v19 = 0;
  v20 = 0;
  do
    result = SDPGetNext(v22, a2, &v21, &v20, (unsigned __int8 **)&v19, &v22);
  while (!(_DWORD)result && v21 != 97);
  if ((_DWORD)result)
    goto LABEL_18;
  v14 = v20;
  v15 = &v20[v19];
  if (v19 < 1)
  {
    v16 = 0;
    v17 = v20;
    if (!a3)
      goto LABEL_12;
  }
  else
  {
    v16 = 1;
    v17 = v20;
    while (*v17 != 58)
    {
      if (++v17 >= v15)
      {
        v16 = 0;
        break;
      }
    }
    if (!a3)
      goto LABEL_12;
  }
  *a3 = v20;
LABEL_12:
  if (a4)
    *a4 = v17 - v14;
  v18 = &v17[v16];
  if (a5)
    *a5 = v18;
  if (a6)
    *a6 = v15 - v18;
LABEL_18:
  if (a7)
    *a7 = v22;
  return result;
}

uint64_t SerialStreamGetTypeID()
{
  if (gSerialStreamInitOnce != -1)
    dispatch_once_f(&gSerialStreamInitOnce, 0, (dispatch_function_t)_SerialStreamGetTypeID);
  return gSerialStreamTypeID;
}

uint64_t _SerialStreamGetTypeID()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  gSerialStreamTypeID = result;
  return result;
}

void _SerialStreamFinalize(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 16);
  if (v2)
  {
    dispatch_release(v2);
    *(_QWORD *)(a1 + 16) = 0;
  }
}

uint64_t SerialStreamCreate(uint64_t *a1)
{
  uint64_t Instance;
  uint64_t v3;
  NSObject *v4;
  uint64_t result;

  if (gSerialStreamInitOnce != -1)
    dispatch_once_f(&gSerialStreamInitOnce, 0, (dispatch_function_t)_SerialStreamGetTypeID);
  Instance = _CFRuntimeCreateInstance();
  if (!Instance)
    return 4294960568;
  v3 = Instance;
  bzero((void *)(Instance + 24), 0x478uLL);
  v4 = MEMORY[0x1E0C80D38];
  *(_QWORD *)(v3 + 16) = MEMORY[0x1E0C80D38];
  dispatch_retain(v4);
  result = 0;
  *(_DWORD *)(v3 + 24) = -1;
  *(_QWORD *)(v3 + 104) = v3 + 96;
  *(_QWORD *)(v3 + 120) = v3 + 112;
  *a1 = v3;
  return result;
}

uint64_t SerialStreamSetConfig(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  if (!*a2)
    return 4294960592;
  __strlcpy_chk();
  result = 0;
  *(_QWORD *)(a1 + 1156) = a2[1];
  return result;
}

void SerialStreamSetDispatchQueue(uint64_t a1, NSObject *a2)
{
  NSObject *v3;
  NSObject *v4;

  if (a2)
    v3 = a2;
  else
    v3 = MEMORY[0x1E0C80D38];
  dispatch_retain(v3);
  v4 = *(NSObject **)(a1 + 16);
  if (v4)
    dispatch_release(v4);
  *(_QWORD *)(a1 + 16) = v3;
}

void SerialStreamInvalidate(dispatch_queue_t *a1)
{
  CFRetain(a1);
  dispatch_async_f(a1[2], a1, (dispatch_function_t)_SerialStreamInvalidate);
}

void _SerialStreamInvalidate(const void *a1)
{
  _SerialStreamErrorHandler((uint64_t)a1, 4294960573);
  CFRelease(a1);
}

void _SerialStreamErrorHandler(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  _QWORD *v6;
  uint64_t *v7;
  void *v8;

  v4 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    dispatch_source_cancel(v4);
    if (*(_BYTE *)(a1 + 40))
    {
      dispatch_resume(*(dispatch_object_t *)(a1 + 32));
      *(_BYTE *)(a1 + 40) = 0;
    }
    dispatch_release(*(dispatch_object_t *)(a1 + 32));
    *(_QWORD *)(a1 + 32) = 0;
  }
  v5 = *(NSObject **)(a1 + 80);
  if (v5)
  {
    dispatch_source_cancel(v5);
    if (*(_BYTE *)(a1 + 88))
    {
      dispatch_resume(*(dispatch_object_t *)(a1 + 80));
      *(_BYTE *)(a1 + 88) = 0;
    }
    dispatch_release(*(dispatch_object_t *)(a1 + 80));
    *(_QWORD *)(a1 + 80) = 0;
  }
  while (1)
  {
    v6 = *(_QWORD **)(a1 + 96);
    if (!v6)
      break;
    v6[5] = 0;
    _SerialStreamReadCompleted(a1, v6, a2);
  }
  while (1)
  {
    v7 = *(uint64_t **)(a1 + 112);
    if (!v7)
      break;
    _SerialStreamWriteCompleted(a1, v7, a2);
  }
  v8 = *(void **)(a1 + 48);
  if (v8)
  {
    free(v8);
    *(_QWORD *)(a1 + 48) = 0;
  }
}

void _SerialStreamReadCompleted(uint64_t a1, void *a2, uint64_t a3)
{
  void (*v4)(uint64_t, _QWORD, _QWORD, _QWORD);

  v4 = *(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))a2;
  *(_QWORD *)(a1 + 96) = *(_QWORD *)a2;
  if (!v4)
    *(_QWORD *)(a1 + 104) = a1 + 96;
  (*((void (**)(uint64_t, _QWORD, _QWORD, _QWORD))a2 + 7))(a3, *((_QWORD *)a2 + 6), *((_QWORD *)a2 + 5), *((_QWORD *)a2 + 8));
  CFRelease(*((CFTypeRef *)a2 + 1));
  free(a2);
}

void _SerialStreamWriteCompleted(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  v4 = *a2;
  *(_QWORD *)(a1 + 112) = *a2;
  if (!v4)
    *(_QWORD *)(a1 + 120) = a1 + 112;
  v5 = (void (*)(uint64_t, uint64_t))a2[6];
  if (v5)
    v5(a3, a2[7]);
  CFRelease((CFTypeRef)a2[1]);
  free(a2);
}

uint64_t SerialStreamRead(dispatch_queue_t *a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6)
{
  size_t v12;
  _QWORD *v13;
  _QWORD *v14;
  char *v15;

  if (a4)
    v12 = 72;
  else
    v12 = a3 + 72;
  v13 = malloc_type_malloc(v12, 0x375A5518uLL);
  if (!v13)
    return 4294960568;
  v14 = v13;
  CFRetain(a1);
  v14[1] = a1;
  *((_DWORD *)v14 + 4) = 0;
  v14[3] = a2;
  v14[4] = a3;
  v15 = (char *)(v14 + 9);
  if (a4)
    v15 = a4;
  v14[5] = 0;
  v14[6] = v15;
  v14[7] = a5;
  v14[8] = a6;
  dispatch_async_f(a1[2], v14, (dispatch_function_t)_SerialStreamRead);
  return 0;
}

void _SerialStreamRead(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;

  v8 = a1[1];
  *a1 = 0;
  **(_QWORD **)(v8 + 104) = a1;
  *(_QWORD *)(v8 + 104) = a1;
  v9 = _SerialStreamEnsureSetUp(v8, a2, a3, a4, a5, a6, a7, a8);
  if ((_DWORD)v9)
    _SerialStreamErrorHandler(v8, v9);
  else
    _SerialStreamReadHandler(v8);
}

uint64_t _SerialStreamEnsureSetUp(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  int8x16_t v18;
  int v19;
  tcflag_t v20;
  dispatch_source_t v21;
  dispatch_source_t v22;
  int v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  termios v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if ((*(_DWORD *)(a1 + 24) & 0x80000000) == 0)
    return 0;
  if (gLogCategory_SerialUtils <= 20
    && (gLogCategory_SerialUtils != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_SerialUtils, 0x14u)))
  {
    LogPrintF((uint64_t)&gLogCategory_SerialUtils, (uint64_t)"OSStatus _SerialStreamEnsureSetUp(SerialStreamRef)", 0x14u, (uint64_t)"Opening serial port '%s'\n", a5, a6, a7, a8, a1 + 128);
  }
  memset(&v28, 0, sizeof(v28));
  v9 = 1;
  while (1)
  {
    v10 = open((const char *)(a1 + 128), 131078);
    *(_DWORD *)(a1 + 24) = v10;
    if ((v10 & 0x80000000) == 0)
      break;
    if (*__error())
    {
      v15 = *__error();
      if (!(_DWORD)v15)
        break;
    }
    else
    {
      v15 = 4294960596;
    }
    if (gLogCategory_SerialUtils <= 50
      && (gLogCategory_SerialUtils != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_SerialUtils, 0x32u)))
    {
      v25 = v9;
      v26 = v15;
      LogPrintF((uint64_t)&gLogCategory_SerialUtils, (uint64_t)"OSStatus _SerialStreamEnsureSetUp(SerialStreamRef)", 0x32u, (uint64_t)"### Open '%s' error %d of 10: %#m\n", v11, v12, v13, v14, a1 + 128);
    }
    if ((_DWORD)v15 != 16)
      goto LABEL_48;
    usleep(0x186A0u);
    v9 = (v9 + 1);
    if ((_DWORD)v9 == 10)
    {
      v9 = 10;
      goto LABEL_20;
    }
  }
  if (v9 < 2)
    goto LABEL_24;
LABEL_20:
  if (gLogCategory_SerialUtils <= 50
    && (gLogCategory_SerialUtils != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_SerialUtils, 0x32u)))
  {
    v25 = v9;
    LogPrintF((uint64_t)&gLogCategory_SerialUtils, (uint64_t)"OSStatus _SerialStreamEnsureSetUp(SerialStreamRef)", 0x32u, (uint64_t)"Opened '%s' after %d attempts\n", v11, v12, v13, v14, a1 + 128);
  }
LABEL_24:
  if (ioctl(*(_DWORD *)(a1 + 24), 0x2000740DuLL))
  {
    if (!*__error())
      goto LABEL_47;
    v15 = *__error();
    if ((_DWORD)v15)
      goto LABEL_48;
  }
  v16 = *(_DWORD *)(a1 + 24);
  v17 = fcntl(v16, 3, 0, v25, v26);
  if (fcntl(v16, 4, v17 | 4u) == -1)
  {
    if (!*__error())
      goto LABEL_47;
    v15 = *__error();
    if ((_DWORD)v15)
      goto LABEL_48;
  }
  memset(&v28, 0, sizeof(v28));
  if (tcgetattr(*(_DWORD *)(a1 + 24), &v28))
  {
    if (!*__error())
      goto LABEL_47;
    v15 = *__error();
    if ((_DWORD)v15)
      goto LABEL_48;
  }
  v18 = vandq_s8(*(int8x16_t *)&v28.c_iflag, (int8x16_t)xmmword_18D51D4C0);
  *(int8x16_t *)&v28.c_iflag = v18;
  v19 = *(_DWORD *)(a1 + 1160);
  if (v19 == 2)
  {
    v20 = v28.c_cflag | 0x38800;
  }
  else
  {
    v20 = v28.c_cflag & 0xFFFFFFFFFFFC77FFLL | 0x8800;
    if (v19 == 1)
      v28.c_iflag = v18.i64[0] | 0xE00;
  }
  v28.c_cflag = v20 & 0xFFFFFFFFFFFF88FFLL | 0x4300;
  v28.c_lflag &= 0xFFFFFFFFFFFFFE75;
  *(_WORD *)&v28.c_cc[16] = 0;
  if (tcsetattr(*(_DWORD *)(a1 + 24), 0, &v28))
  {
    if (!*__error())
      goto LABEL_47;
    v15 = *__error();
    if ((_DWORD)v15)
      goto LABEL_48;
  }
  v27 = *(int *)(a1 + 1156);
  if (!ioctl(*(_DWORD *)(a1 + 24), 0x80085402uLL, &v27))
  {
LABEL_44:
    v21 = dispatch_source_create(MEMORY[0x1E0C80DB8], *(int *)(a1 + 24), 0, *(dispatch_queue_t *)(a1 + 16));
    *(_QWORD *)(a1 + 32) = v21;
    if (v21)
    {
      ++*(_DWORD *)(a1 + 28);
      CFRetain((CFTypeRef)a1);
      dispatch_set_context(*(dispatch_object_t *)(a1 + 32), (void *)a1);
      dispatch_source_set_event_handler_f(*(dispatch_source_t *)(a1 + 32), (dispatch_function_t)_SerialStreamReadHandler);
      dispatch_source_set_cancel_handler_f(*(dispatch_source_t *)(a1 + 32), (dispatch_function_t)_SerialStreamCancelHandler);
      *(_BYTE *)(a1 + 40) = 1;
      v22 = dispatch_source_create(MEMORY[0x1E0C80DF0], *(int *)(a1 + 24), 0, *(dispatch_queue_t *)(a1 + 16));
      *(_QWORD *)(a1 + 80) = v22;
      if (v22)
      {
        ++*(_DWORD *)(a1 + 28);
        CFRetain((CFTypeRef)a1);
        dispatch_set_context(*(dispatch_object_t *)(a1 + 80), (void *)a1);
        dispatch_source_set_event_handler_f(*(dispatch_source_t *)(a1 + 80), (dispatch_function_t)_SerialStreamWriteHandler);
        dispatch_source_set_cancel_handler_f(*(dispatch_source_t *)(a1 + 80), (dispatch_function_t)_SerialStreamCancelHandler);
        v15 = 0;
        *(_BYTE *)(a1 + 88) = 1;
        return v15;
      }
    }
    goto LABEL_47;
  }
  if (*__error())
  {
    v15 = *__error();
    if ((_DWORD)v15)
      goto LABEL_48;
    goto LABEL_44;
  }
LABEL_47:
  v15 = 4294960596;
LABEL_48:
  if (!*(_DWORD *)(a1 + 28))
  {
    v23 = *(_DWORD *)(a1 + 24);
    if ((v23 & 0x80000000) == 0)
    {
      if (close(v23) && *__error())
        __error();
      *(_DWORD *)(a1 + 24) = -1;
    }
  }
  _SerialStreamErrorHandler(a1, v15);
  return v15;
}

void _SerialStreamReadHandler(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  int64_t v5;
  int v6;
  size_t v7;
  _BYTE *v8;
  unint64_t v9;
  int v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;
  size_t v15;
  void *v16;
  ssize_t v17;
  unsigned int v18;
  _BYTE *v19;
  int v20;
  size_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  _BYTE *v26;
  char *v27;
  ssize_t v28;
  unsigned int v29;

  v2 = *(_QWORD *)(a1 + 96);
  if (!v2)
  {
LABEL_72:
    if (!*(_BYTE *)(a1 + 40))
    {
      *(_BYTE *)(a1 + 40) = 1;
      dispatch_suspend(*(dispatch_object_t *)(a1 + 32));
    }
    return;
  }
  v3 = (_QWORD *)(a1 + 64);
  while (1)
  {
    v4 = *(_QWORD *)(a1 + 64);
    v5 = *(_QWORD *)(a1 + 72);
    v6 = *(_DWORD *)(v2 + 16);
    if ((v6 & 0x10000) != 0)
      break;
    if (v5 == v4)
    {
      v7 = *(_QWORD *)(v2 + 40);
    }
    else
    {
      v13 = *(_QWORD *)(v2 + 40);
      if (*(_QWORD *)(v2 + 32) - v13 >= (unint64_t)(v5 - v4))
        v14 = v5 - v4;
      else
        v14 = *(_QWORD *)(v2 + 32) - v13;
      memcpy((void *)(*(_QWORD *)(v2 + 48) + v13), (const void *)(*(_QWORD *)(a1 + 48) + v4), v14);
      *(_QWORD *)(a1 + 64) += v14;
      v7 = *(_QWORD *)(v2 + 40) + v14;
      *(_QWORD *)(v2 + 40) = v7;
    }
    if (v7 >= *(_QWORD *)(v2 + 24))
      goto LABEL_50;
    v15 = *(_QWORD *)(v2 + 32) - v7;
    v16 = (void *)(*(_QWORD *)(v2 + 48) + v7);
    while (1)
    {
      v17 = read(*(_DWORD *)(a1 + 24), v16, v15);
      if ((v17 & 0x8000000000000000) == 0)
      {
        v18 = 0;
        goto LABEL_44;
      }
      if (!*__error())
        break;
      v18 = *__error();
      if (v18 != 4)
        goto LABEL_44;
    }
    v18 = -6700;
LABEL_44:
    if (v17)
      v24 = v18;
    else
      v24 = 35;
    if ((_DWORD)v24 == 35)
      goto LABEL_70;
    if ((_DWORD)v24)
      goto LABEL_77;
    v25 = *(_QWORD *)(v2 + 40) + v17;
    *(_QWORD *)(v2 + 40) = v25;
    if (v25 >= *(_QWORD *)(v2 + 24))
      goto LABEL_50;
LABEL_51:
    v2 = *(_QWORD *)(a1 + 96);
    if (!v2)
      goto LABEL_72;
  }
  v8 = *(_BYTE **)(a1 + 48);
  v9 = (unint64_t)&v8[v4];
  if ((v6 & 4) != 0)
  {
    if (v5 > v4)
    {
      v19 = &v8[v4];
      while (1)
      {
        v20 = *v19;
        if (v20 == 7 || v20 == 13)
          break;
        if (++v19 >= &v8[v5])
          goto LABEL_32;
      }
      *v3 = v19 - v8 + 1;
      *(_QWORD *)(v2 + 48) = v9;
      if (*v19 == 7)
        v12 = (uint64_t)&v19[-v9 + 1];
      else
        v12 = (uint64_t)&v19[-v9];
      goto LABEL_42;
    }
  }
  else
  {
    if ((v6 & 2) != 0)
      v10 = 13;
    else
      v10 = 10;
    v11 = memchr(&v8[v4], v10, v5 - v4);
    if (v11)
    {
      *v3 = v11 - v8 + 1;
      if ((unint64_t)v11 > v9 && *(v11 - 1) == 13)
        --v11;
      *(_QWORD *)(v2 + 48) = v9;
      v12 = (uint64_t)&v11[-v9];
LABEL_42:
      *(_QWORD *)(v2 + 40) = v12;
LABEL_50:
      _SerialStreamReadCompleted(a1, (void *)v2, 0);
      goto LABEL_51;
    }
  }
LABEL_32:
  if (v5 != v4)
  {
    v23 = *(_QWORD *)(a1 + 56);
    v22 = v23 - v5;
    if (v23 != v5)
      goto LABEL_56;
    if (v4)
    {
      memmove(v8, &v8[v4], v5 - v4);
      v22 = *(_QWORD *)(a1 + 64);
      v5 = *(_QWORD *)(a1 + 72) - v22;
      *(_QWORD *)(a1 + 64) = 0;
      *(_QWORD *)(a1 + 72) = v5;
      v8 = *(_BYTE **)(a1 + 48);
      goto LABEL_56;
    }
LABEL_53:
    if (v8)
    {
      v24 = 4294960533;
    }
    else
    {
      *(_QWORD *)(a1 + 56) = 4096;
      v26 = malloc_type_malloc(0x1000uLL, 0x151C163AuLL);
      *(_QWORD *)(a1 + 48) = v26;
      if (v26)
      {
        v8 = v26;
        v22 = *(_QWORD *)(a1 + 56);
        v5 = *(_QWORD *)(a1 + 72);
        goto LABEL_56;
      }
      v24 = 4294960568;
    }
LABEL_77:
    _SerialStreamErrorHandler(a1, v24);
    return;
  }
  *v3 = 0;
  *(_QWORD *)(a1 + 72) = 0;
  v22 = *(_QWORD *)(a1 + 56);
  if (!v22)
    goto LABEL_53;
  v5 = 0;
LABEL_56:
  v27 = &v8[v5];
  while (1)
  {
    v28 = read(*(_DWORD *)(a1 + 24), v27, v22);
    if ((v28 & 0x8000000000000000) == 0)
    {
      v29 = 0;
      goto LABEL_63;
    }
    if (!*__error())
      break;
    v29 = *__error();
    if (v29 != 4)
      goto LABEL_63;
  }
  v29 = -6700;
LABEL_63:
  if (v28)
    v24 = v29;
  else
    v24 = 35;
  if ((_DWORD)v24 != 35)
  {
    if ((_DWORD)v24)
      goto LABEL_77;
    *(_QWORD *)(a1 + 72) += v28;
    goto LABEL_51;
  }
LABEL_70:
  if (*(_BYTE *)(a1 + 40))
  {
    *(_BYTE *)(a1 + 40) = 0;
    dispatch_resume(*(dispatch_object_t *)(a1 + 32));
  }
}

void _SerialStreamCancelHandler(_DWORD *cf)
{
  int v2;
  int v3;

  v2 = cf[7] - 1;
  cf[7] = v2;
  if (!v2)
  {
    v3 = cf[6];
    if ((v3 & 0x80000000) == 0)
    {
      if (close(v3) && *__error())
        __error();
      cf[6] = -1;
    }
  }
  CFRelease(cf);
}

void _SerialStreamWriteHandler(uint64_t a1)
{
  uint64_t v2;
  ssize_t v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t updated;

  v2 = *(_QWORD *)(a1 + 112);
  if (!v2)
  {
LABEL_22:
    if (!*(_BYTE *)(a1 + 88))
    {
      *(_BYTE *)(a1 + 88) = 1;
      dispatch_suspend(*(dispatch_object_t *)(a1 + 80));
    }
    return;
  }
  while (1)
  {
    do
    {
      v3 = writev(*(_DWORD *)(a1 + 24), *(const iovec **)(v2 + 40), *(_DWORD *)(v2 + 32));
      if ((v3 & 0x8000000000000000) == 0)
      {
        v4 = 0;
        break;
      }
      if (!*__error())
      {
        v4 = -6700;
        break;
      }
      v4 = *__error();
    }
    while (v4 == 4);
    if (v3)
      v5 = v4;
    else
      v5 = 35;
    if ((_DWORD)v5 == 35)
      goto LABEL_20;
    if ((_DWORD)v5)
      break;
    updated = UpdateIOVec((uint64_t **)(v2 + 40), (int *)(v2 + 32), v3);
    if ((_DWORD)updated != 35)
    {
      v5 = updated;
      if ((_DWORD)updated)
        break;
      _SerialStreamWriteCompleted(a1, (uint64_t *)v2, 0);
    }
    v2 = *(_QWORD *)(a1 + 112);
    if (!v2)
      goto LABEL_22;
  }
  if (!(_DWORD)v5)
    goto LABEL_22;
  if ((_DWORD)v5 != 35)
  {
    _SerialStreamErrorHandler(a1, v5);
    return;
  }
LABEL_20:
  if (*(_BYTE *)(a1 + 88))
  {
    *(_BYTE *)(a1 + 88) = 0;
    dispatch_resume(*(dispatch_object_t *)(a1 + 80));
  }
}

uint64_t SerialStreamReadLine(dispatch_queue_t *a1, int a2, uint64_t a3, uint64_t a4)
{
  char *v8;
  char *v9;

  v8 = (char *)malloc_type_malloc(0x48uLL, 0xB2CA33D3uLL);
  if (!v8)
    return 4294960568;
  v9 = v8;
  CFRetain(a1);
  *((_QWORD *)v9 + 1) = a1;
  *((_DWORD *)v9 + 4) = a2 | 0x10000;
  *(_OWORD *)(v9 + 24) = 0u;
  *(_OWORD *)(v9 + 40) = 0u;
  *((_QWORD *)v9 + 7) = a3;
  *((_QWORD *)v9 + 8) = a4;
  dispatch_async_f(a1[2], v9, (dispatch_function_t)_SerialStreamRead);
  return 0;
}

uint64_t SerialStreamReadLineSync(dispatch_queue_t *a1, int a2, _QWORD *a3, _QWORD *a4)
{
  dispatch_semaphore_t dsema;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v10 = 0;
  v11 = 0;
  v12 = 0;
  dsema = dispatch_semaphore_create(0);
  if (dsema)
  {
    v11 = 0;
    v12 = 0;
    LODWORD(v10) = SerialStreamReadLine(a1, a2, (uint64_t)_SerialStreamReadLineSyncCompletion, (uint64_t)&dsema);
    if (!(_DWORD)v10)
    {
      dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
      *a3 = v11;
      if (a4)
        *a4 = v12;
    }
    if (dsema)
      dispatch_release(dsema);
  }
  else
  {
    LODWORD(v10) = -6700;
  }
  return v10;
}

intptr_t _SerialStreamReadLineSyncCompletion(int a1, const void *a2, size_t a3, uint64_t a4)
{
  _BYTE *v6;
  _BYTE *v8;

  if (a1)
  {
    v6 = 0;
  }
  else
  {
    v8 = malloc_type_malloc(a3 + 1, 0x5B67A339uLL);
    v6 = v8;
    if (v8)
    {
      if (a3)
        memcpy(v8, a2, a3);
      a1 = 0;
      v6[a3] = 0;
    }
    else
    {
      a1 = -6728;
    }
  }
  *(_DWORD *)(a4 + 8) = a1;
  *(_QWORD *)(a4 + 16) = v6;
  *(_QWORD *)(a4 + 24) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)a4);
}

uint64_t SerialStreamReadSync(dispatch_queue_t *a1, uint64_t a2, uint64_t a3, char *a4, _QWORD *a5)
{
  uint64_t result;
  dispatch_semaphore_t dsema;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  dsema = dispatch_semaphore_create(0);
  if (!dsema)
    return 4294960596;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  result = SerialStreamRead(a1, a2, a3, a4, (uint64_t)_SerialStreamReadSyncCompletion, (uint64_t)&dsema);
  LODWORD(v12) = result;
  if (!(_DWORD)result)
  {
    dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
    result = v12;
    if (a5)
    {
      if (!(_DWORD)v12)
        *a5 = v14;
    }
  }
  if (dsema)
  {
    dispatch_release(dsema);
    return v12;
  }
  return result;
}

intptr_t _SerialStreamReadSyncCompletion(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_DWORD *)(a4 + 8) = a1;
  *(_QWORD *)(a4 + 24) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)a4);
}

uint64_t SerialStreamWrite(dispatch_queue_t *a1, char a2, char *a3, int a4, uint64_t a5, uint64_t a6)
{
  int v8;
  char *v9;
  _DWORD *v11;
  uint64_t v12;
  uint64_t *v13;
  size_t v14;
  uint64_t v15;
  uint64_t v16;
  _DWORD *v17;
  uint64_t v18;
  size_t *v19;
  size_t v20;
  _DWORD *v21;

  v8 = a4;
  v9 = a3;
  if ((a2 & 1) == 0)
  {
    v11 = malloc_type_malloc(0x40uLL, 0xBB4D53ADuLL);
    if (!v11)
      return 4294960568;
LABEL_14:
    v11[8] = v8;
    *((_QWORD *)v11 + 5) = v9;
    CFRetain(a1);
    *((_QWORD *)v11 + 1) = a1;
    *((_QWORD *)v11 + 6) = a5;
    *((_QWORD *)v11 + 7) = a6;
    dispatch_async_f(a1[2], v11, (dispatch_function_t)_SerialStreamWrite);
    return 0;
  }
  if (a4 >= 1)
  {
    v12 = a4;
    v13 = (uint64_t *)(a3 + 8);
    v14 = 64;
    v15 = a4;
    do
    {
      v16 = *v13;
      v13 += 2;
      v14 += v16;
      --v15;
    }
    while (v15);
    v17 = malloc_type_malloc(v14, 0x313BACC5uLL);
    if (!v17)
      return 4294960568;
    v11 = v17;
    v18 = 0;
    v19 = (size_t *)(v9 + 8);
    do
    {
      v20 = *v19;
      memcpy((char *)v11 + v18 + 64, (const void *)*(v19 - 1), *v19);
      v18 += v20;
      v19 += 2;
      --v12;
    }
    while (v12);
    goto LABEL_13;
  }
  v21 = malloc_type_malloc(0x40uLL, 0x313BACC5uLL);
  if (v21)
  {
    v11 = v21;
    v18 = 0;
LABEL_13:
    *((_QWORD *)v11 + 2) = v11 + 16;
    *((_QWORD *)v11 + 3) = v18;
    v9 = (char *)(v11 + 4);
    v8 = 1;
    goto LABEL_14;
  }
  return 4294960568;
}

void _SerialStreamWrite(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;

  v8 = a1[1];
  *a1 = 0;
  **(_QWORD **)(v8 + 120) = a1;
  *(_QWORD *)(v8 + 120) = a1;
  v9 = _SerialStreamEnsureSetUp(v8, a2, a3, a4, a5, a6, a7, a8);
  if ((_DWORD)v9)
    _SerialStreamErrorHandler(v8, v9);
  else
    _SerialStreamWriteHandler(v8);
}

uint64_t SerialStreamWriteSync(dispatch_queue_t *a1, char *a2, int a3)
{
  dispatch_semaphore_t dsema;
  uint64_t v8;

  v8 = 0;
  dsema = dispatch_semaphore_create(0);
  if (dsema)
  {
    LODWORD(v8) = SerialStreamWrite(a1, 0, a2, a3, (uint64_t)_SerialStreamWriteSyncCompletion, (uint64_t)&dsema);
    if (!(_DWORD)v8)
      dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
    if (dsema)
      dispatch_release(dsema);
  }
  else
  {
    LODWORD(v8) = -6700;
  }
  return v8;
}

intptr_t _SerialStreamWriteSyncCompletion(int a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 8) = a1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)a2);
}

uint64_t _SHA3_Block(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t result;
  uint64_t v66;
  uint64_t v67;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;

  v2 = 0;
  v3 = *a2 ^ *a1;
  v4 = a2[1] ^ a1[1];
  v5 = a2[2] ^ a1[2];
  v79 = a2[3] ^ a1[3];
  v78 = a2[4] ^ a1[4];
  v76 = a2[5] ^ a1[5];
  v74 = a2[6] ^ a1[6];
  v77 = a2[7] ^ a1[7];
  v6 = a1[9];
  v75 = a2[8] ^ a1[8];
  v7 = a1[10];
  v8 = a1[11];
  v10 = a1[12];
  v9 = a1[13];
  v12 = a1[14];
  v11 = a1[15];
  v13 = a1[16];
  v14 = a1[17];
  v16 = a1[18];
  v15 = a1[19];
  v18 = a1[20];
  v17 = a1[21];
  v19 = a1[22];
  v20 = a1[23];
  v21 = a1[24];
  do
  {
    v72 = v8;
    v71 = v20;
    v22 = v74 ^ v4 ^ v8 ^ v13 ^ v17;
    v73 = v14;
    v23 = v6 ^ v78 ^ v12 ^ v15 ^ v21;
    v24 = v23 ^ __ROR8__(v22, 63);
    v25 = v75 ^ v79 ^ v9 ^ v16 ^ v20;
    v26 = v22 ^ __ROR8__(v25, 63);
    v27 = v76 ^ v3 ^ v7 ^ v11 ^ v18;
    v28 = v25 ^ __ROR8__(v27, 63);
    v29 = v77 ^ v5 ^ v10 ^ v14 ^ v19;
    v30 = v27 ^ __ROR8__(v29, 63);
    v31 = v28 ^ v21;
    v32 = v29 ^ __ROR8__(v23, 63);
    v33 = v32 ^ v16;
    v34 = __ROR8__(v31, 50) & ~__ROR8__(v32 ^ v16, 43);
    v35 = v24 ^ v3;
    v36 = v32 ^ v79;
    v79 = v35 & ~__ROR8__(v31, 50) ^ __ROR8__(v33, 43);
    v37 = v26 ^ v10;
    v38 = __ROR8__(v33, 43) & ~__ROR8__(v26 ^ v10, 21);
    v39 = v26 ^ v5;
    v69 = v34 ^ __ROR8__(v37, 21);
    v70 = __ROR8__(v37, 21) & ~__ROR8__(v30 ^ v74, 20);
    v40 = v24 ^ v76;
    v41 = v30 ^ v4;
    v42 = v2;
    v43 = v38 ^ __ROR8__(v30 ^ v74, 20);
    v44 = v24 ^ v7;
    v45 = v24 ^ v11;
    v46 = v24 ^ v18;
    v47 = v28 ^ v78;
    v48 = v28 ^ v6;
    v49 = __ROR8__(v28 ^ v6, 44);
    v78 = __ROR8__(v30 ^ v74, 20) & ~v35 ^ __ROR8__(v31, 50);
    v50 = v30 ^ v72;
    v51 = v30 ^ v13;
    v52 = v26 ^ v19;
    v53 = v30 ^ v17;
    v54 = v26 ^ v77;
    v55 = v26 ^ v73;
    v56 = v32 ^ v75;
    v57 = v32 ^ v9;
    v58 = v32 ^ v71;
    v59 = v28 ^ v12;
    v60 = v28 ^ v15;
    v61 = __ROR8__(v57, 39);
    v74 = __ROR8__(v51, 19) & ~__ROR8__(v44, 61) ^ __ROR8__(v48, 44);
    v77 = __ROR8__(v52, 3) & ~__ROR8__(v51, 19) ^ __ROR8__(v44, 61);
    v75 = __ROR8__(v36, 36) & ~__ROR8__(v52, 3) ^ __ROR8__(v51, 19);
    v76 = __ROR8__(v44, 61) & ~__ROR8__(v48, 44) ^ __ROR8__(v36, 36);
    v6 = v49 & ~__ROR8__(v36, 36) ^ __ROR8__(v52, 3);
    v62 = __ROR8__(v46, 46) & ~__ROR8__(v60, 56) ^ v61;
    v9 = __ROR8__(v41, 63) & ~__ROR8__(v46, 46) ^ __ROR8__(v60, 56);
    v63 = v61 & ~__ROR8__(v54, 58);
    v8 = __ROR8__(v60, 56) & ~v61 ^ __ROR8__(v54, 58);
    v64 = __ROR8__(v54, 58);
    v7 = v63 ^ __ROR8__(v41, 63);
    v12 = v64 & ~__ROR8__(v41, 63) ^ __ROR8__(v46, 46);
    v14 = __ROR8__(v58, 8) & ~__ROR8__(v55, 49) ^ __ROR8__(v50, 54);
    result = __ROR8__(v55, 49) & ~__ROR8__(v50, 54) ^ __ROR8__(v40, 28);
    v4 = v43;
    v16 = __ROR8__(v47, 37) & ~__ROR8__(v58, 8) ^ __ROR8__(v55, 49);
    v11 = __ROR8__(v50, 54) & ~__ROR8__(v40, 28) ^ __ROR8__(v47, 37);
    v15 = __ROR8__(v40, 28) & ~__ROR8__(v47, 37) ^ __ROR8__(v58, 8);
    v20 = __ROR8__(v39, 2) & ~__ROR8__(v53, 62) ^ __ROR8__(v45, 23);
    v19 = __ROR8__(v53, 62) & ~__ROR8__(v45, 23) ^ __ROR8__(v59, 25);
    v5 = v69;
    v66 = __ROR8__(v59, 25) & ~__ROR8__(v56, 9);
    v17 = __ROR8__(v45, 23) & ~__ROR8__(v59, 25) ^ __ROR8__(v56, 9);
    v3 = v70 ^ *(uint64_t *)((char *)&kSHA3RoundConstants + v42) ^ v35;
    v18 = v66 ^ __ROR8__(v39, 2);
    v67 = __ROR8__(v56, 9) & ~__ROR8__(v39, 2);
    v10 = v62;
    v13 = result;
    v21 = v67 ^ __ROR8__(v53, 62);
    v2 = v42 + 8;
  }
  while (v42 != 184);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v69;
  a1[3] = v79;
  a1[4] = v78;
  a1[5] = v76;
  a1[6] = v74;
  a1[7] = v77;
  a1[8] = v75;
  a1[9] = v6;
  a1[10] = v7;
  a1[11] = v8;
  a1[12] = v10;
  a1[13] = v9;
  a1[14] = v12;
  a1[15] = v11;
  a1[16] = result;
  a1[17] = v14;
  a1[18] = v16;
  a1[19] = v15;
  a1[20] = v18;
  a1[21] = v17;
  a1[22] = v19;
  a1[23] = v20;
  a1[24] = v21;
  return result;
}

uint64_t HMAC_SHA1_Init(CC_SHA1_CTX *c, unsigned __int8 *a2, unint64_t a3)
{
  unint64_t v3;
  uint64_t v6;
  unsigned __int8 v7;
  unsigned __int8 md[20];
  _BYTE data[64];
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  if (a3 < 0x41)
  {
    if (!a3)
    {
LABEL_7:
      memset(&data[v3], 54, 64 - v3);
      memset((char *)&c[1] + v3, 92, 64 - v3);
      goto LABEL_8;
    }
  }
  else
  {
    CC_SHA1_Init(c);
    CC_SHA1_Update(c, a2, v3);
    a2 = md;
    CC_SHA1_Final(md, c);
    v3 = 20;
  }
  v6 = 0;
  do
  {
    v7 = a2[v6];
    data[v6] = v7 ^ 0x36;
    *((_BYTE *)&c[1].h0 + v6++) = v7 ^ 0x5C;
  }
  while (v3 != v6);
  if (v3 <= 0x3F)
    goto LABEL_7;
LABEL_8:
  CC_SHA1_Init(c);
  return CC_SHA1_Update(c, data, 0x40u);
}

uint64_t HMAC_SHA1_Final(CC_SHA1_CTX *c, unsigned __int8 *md)
{
  CC_SHA1_Final(md, c);
  CC_SHA1_Init(c);
  CC_SHA1_Update(c, &c[1], 0x40u);
  CC_SHA1_Update(c, md, 0x14u);
  return CC_SHA1_Final(md, c);
}

void *PBKDF2_HMAC_SHA1(char *__s, size_t a2, char *a3, uint64_t a4, uint64_t a5)
{
  size_t v7;
  uint64_t v9;
  unint64_t v10;
  int i;
  unsigned __int8 *v12;
  uint64_t j;
  size_t v14;
  void *result;
  uint64_t v16;
  __int16 v17;
  int data;
  unsigned __int8 md[20];
  unsigned __int8 __src[20];
  CC_SHA1_CTX c;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v7 = a2;
  v27 = *MEMORY[0x1E0C80C00];
  if (a2 == -1)
    v7 = strlen(__s);
  if (a4 == -1)
    LODWORD(a4) = strlen(a3);
  v9 = 0;
  data = 0x1000000;
  memset(&c, 0, sizeof(c));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = 32;
  do
  {
    HMAC_SHA1_Init(&c, (unsigned __int8 *)__s, v7);
    CC_SHA1_Update(&c, a3, a4);
    CC_SHA1_Update(&c, &data, 4u);
    HMAC_SHA1_Final(&c, __src);
    for (i = 1; i != 4096; ++i)
    {
      HMAC_SHA1_Init(&c, (unsigned __int8 *)__s, v7);
      if (i == 1)
        v12 = __src;
      else
        v12 = md;
      CC_SHA1_Update(&c, v12, 0x14u);
      HMAC_SHA1_Final(&c, md);
      for (j = 0; j != 20; ++j)
        __src[j] ^= md[j];
    }
    if (v10 >= 0x14)
      v14 = 20;
    else
      v14 = v10;
    result = memcpy((void *)(a5 + v9), __src, v14);
    v9 += v14;
    v10 -= v14;
    v16 = 3;
    do
    {
      if (v16 == -1)
        break;
      v17 = ++md[v16-- - 4];
    }
    while ((v17 & 0x100) != 0);
  }
  while (v10);
  return result;
}

uint64_t srp6a_client_init(_QWORD *a1)
{
  *a1 = 0x30000000CLL;
  a1[13] = malloc_type_malloc(0x1E0uLL, 0x1000040048C4DA3uLL);
  (*(void (**)(void))(a1[18] + 16))();
  (*(void (**)(uint64_t))(a1[18] + 16))(a1[13] + 208);
  return 0;
}

uint64_t srp6_client_finish(uint64_t a1)
{
  _OWORD *v1;

  v1 = *(_OWORD **)(a1 + 104);
  if (v1)
  {
    v1[28] = 0u;
    v1[29] = 0u;
    v1[26] = 0u;
    v1[27] = 0u;
    v1[24] = 0u;
    v1[25] = 0u;
    v1[22] = 0u;
    v1[23] = 0u;
    v1[20] = 0u;
    v1[21] = 0u;
    v1[18] = 0u;
    v1[19] = 0u;
    v1[16] = 0u;
    v1[17] = 0u;
    v1[14] = 0u;
    v1[15] = 0u;
    v1[12] = 0u;
    v1[13] = 0u;
    v1[10] = 0u;
    v1[11] = 0u;
    v1[8] = 0u;
    v1[9] = 0u;
    v1[6] = 0u;
    v1[7] = 0u;
    v1[4] = 0u;
    v1[5] = 0u;
    v1[2] = 0u;
    v1[3] = 0u;
    *v1 = 0u;
    v1[1] = 0u;
    free(*(void **)(a1 + 104));
  }
  return 0;
}

uint64_t srp6_client_params(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7)
{
  uint64_t v14;
  uint64_t v15;
  _OWORD v17[13];
  _BYTE v18[64];
  _BYTE v19[64];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  memset(v17, 0, sizeof(v17));
  (*(void (**)(_OWORD *))(*(_QWORD *)(a1 + 144) + 16))(v17);
  (*(void (**)(_OWORD *, uint64_t, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(v17, a2, a3);
  (*(void (**)(_BYTE *, _OWORD *))(*(_QWORD *)(a1 + 144) + 32))(v19, v17);
  (*(void (**)(_OWORD *))(*(_QWORD *)(a1 + 144) + 16))(v17);
  (*(void (**)(_OWORD *, uint64_t, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(v17, a4, a5);
  (*(void (**)(_BYTE *, _OWORD *))(*(_QWORD *)(a1 + 144) + 32))(v18, v17);
  v14 = *(_QWORD *)(a1 + 144);
  if ((int)*(_QWORD *)v14 >= 1)
  {
    v15 = 0;
    do
    {
      v19[v15] ^= v18[v15];
      ++v15;
    }
    while (v15 < (int)*(_QWORD *)v14);
  }
  (*(void (**)(_QWORD, _BYTE *))(v14 + 24))(*(_QWORD *)(a1 + 104), v19);
  (*(void (**)(_OWORD *))(*(_QWORD *)(a1 + 144) + 16))(v17);
  (*(void (**)(_OWORD *, _QWORD, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(v17, **(_QWORD **)(a1 + 8), *(int *)(*(_QWORD *)(a1 + 8) + 8));
  (*(void (**)(_BYTE *, _OWORD *))(*(_QWORD *)(a1 + 144) + 32))(v19, v17);
  (*(void (**)(_QWORD, _BYTE *, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(*(_QWORD *)(a1 + 104), v19, **(_QWORD **)(a1 + 144));
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(*(_QWORD *)(a1 + 104), a6, a7);
  return 0;
}

uint64_t srp6_client_auth(uint64_t a1)
{
  *(_QWORD *)(a1 + 48) = CCBigNumFromData();
  *(_QWORD *)(a1 + 40) = BigIntegerFromInt();
  CCBigNumModExp();
  return 0;
}

uint64_t srp6_client_passwd(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
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
  _BYTE v21[64];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
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
  v9 = 0u;
  v10 = 0u;
  v8 = 0u;
  (*(void (**)(__int128 *))(*(_QWORD *)(a1 + 144) + 16))(&v8);
  (*(void (**)(__int128 *, _QWORD, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(&v8, **(_QWORD **)(a1 + 8), *(int *)(*(_QWORD *)(a1 + 8) + 8));
  (*(void (**)(__int128 *, const char *, uint64_t))(*(_QWORD *)(a1 + 144) + 24))(&v8, ":", 1);
  (*(void (**)(__int128 *, uint64_t, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(&v8, a2, a3);
  (*(void (**)(_BYTE *, __int128 *))(*(_QWORD *)(a1 + 144) + 32))(v21, &v8);
  (*(void (**)(__int128 *))(*(_QWORD *)(a1 + 144) + 16))(&v8);
  (*(void (**)(__int128 *, _QWORD, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(&v8, **(_QWORD **)(a1 + 32), *(int *)(*(_QWORD *)(a1 + 32) + 8));
  (*(void (**)(__int128 *, _BYTE *, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(&v8, v21, **(_QWORD **)(a1 + 144));
  (*(void (**)(_BYTE *, __int128 *))(*(_QWORD *)(a1 + 144) + 32))(v21, &v8);
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
  v9 = 0u;
  v10 = 0u;
  v8 = 0u;
  v6 = (*(uint64_t (**)(uint64_t, _BYTE *, _QWORD))(*(_QWORD *)(a1 + 96) + 32))(a1, v21, **(unsigned int **)(a1 + 144));
  __memset_chk();
  return v6;
}

uint64_t srp6_client_genpub(uint64_t *a1, uint64_t *a2)
{
  _QWORD *v4;
  uint64_t (**v5)();
  uint64_t v6;
  uint64_t (**v7)();
  uint64_t v8;
  int v9;
  int v10;

  CCBigNumBitCount();
  if (a2)
  {
    v4 = (_QWORD *)*a2;
    if (!*a2)
    {
      v5 = (uint64_t (**)())default_alloc;
      if (!default_alloc)
      {
        v5 = malloc_allocator;
        default_alloc = (uint64_t)malloc_allocator;
      }
      v6 = ((uint64_t (*)(uint64_t, uint64_t (*)()))*v5)(32, v5[2]);
      v4 = (_QWORD *)v6;
      if (v6)
      {
        *(_QWORD *)v6 = &cstr_empty_string;
        *(_QWORD *)(v6 + 8) = 0;
        *(_DWORD *)(v6 + 16) = 1;
        *(_QWORD *)(v6 + 24) = v5;
      }
      *a2 = v6;
    }
  }
  else
  {
    v7 = (uint64_t (**)())default_alloc;
    if (!default_alloc)
    {
      v7 = malloc_allocator;
      default_alloc = (uint64_t)malloc_allocator;
    }
    v8 = ((uint64_t (*)(uint64_t, uint64_t (*)()))*v7)(32, v7[2]);
    v4 = (_QWORD *)v8;
    if (v8)
    {
      *(_QWORD *)v8 = &cstr_empty_string;
      *(_QWORD *)(v8 + 8) = 0;
      *(_DWORD *)(v8 + 16) = 1;
      *(_QWORD *)(v8 + 24) = v7;
    }
  }
  v9 = CCBigNumBitCount();
  v10 = v9 + 7;
  if (v9 < -7)
    v10 = v9 + 14;
  cstr_set_length((uint64_t)v4, v10 >> 3);
  RandomBytes((void *)*v4, 0x20uLL);
  a1[8] = CCBigNumFromData();
  CCBigNumBitCount();
  CCBigNumAddI();
  a1[7] = BigIntegerFromInt();
  CCBigNumModExp();
  BigIntegerToCstr(a1[7], (uint64_t)v4);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(a1[18] + 24))(a1[13], *v4, *((int *)v4 + 2));
  (*(void (**)(uint64_t, _QWORD, _QWORD))(a1[18] + 24))(a1[13] + 208, *v4, *((int *)v4 + 2));
  if (!a2)
    cstr_clear_free((uint64_t)v4);
  return 0;
}

uint64_t srp6a_client_key(uint64_t a1, uint64_t *a2, const void *a3, int a4)
{
  uint64_t v4;
  uint64_t (**v8)();
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  uint64_t (**v15)();
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  int v19;
  size_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _OWORD v27[13];
  _OWORD v28[13];
  int v29;
  _BYTE v30[64];
  _BYTE v31[64];
  uint64_t v32;

  LODWORD(v4) = a4;
  v32 = *MEMORY[0x1E0C80C00];
  memset(v27, 0, sizeof(v27));
  (*(void (**)(_OWORD *))(*(_QWORD *)(a1 + 144) + 16))(v27);
  v8 = (uint64_t (**)())default_alloc;
  if (!default_alloc)
  {
    v8 = malloc_allocator;
    default_alloc = (uint64_t)malloc_allocator;
  }
  v9 = ((uint64_t (*)(uint64_t, uint64_t (*)()))*v8)(32, v8[2]);
  v10 = (_QWORD *)v9;
  if (v9)
  {
    *(_QWORD *)v9 = &cstr_empty_string;
    *(_QWORD *)(v9 + 8) = 0;
    *(_DWORD *)(v9 + 16) = 1;
    *(_QWORD *)(v9 + 24) = v8;
  }
  BigIntegerToCstr(*(_QWORD *)(a1 + 16), v9);
  (*(void (**)(_OWORD *, _QWORD, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(v27, *v10, *((int *)v10 + 2));
  v11 = *(_QWORD *)(a1 + 24);
  if ((*(_BYTE *)(a1 + 4) & 2) != 0)
    BigIntegerToCstrEx(v11, (const void **)v10, *((_DWORD *)v10 + 2));
  else
    BigIntegerToCstr(v11, (uint64_t)v10);
  (*(void (**)(_OWORD *, _QWORD, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(v27, *v10, *((int *)v10 + 2));
  (*(void (**)(_BYTE *, _OWORD *))(*(_QWORD *)(a1 + 144) + 32))(v30, v27);
  cstr_free((uint64_t)v10);
  LODWORD(v28[0]) = 0;
  CCBigNumFromData();
  if (!MEMORY[0x18D78D2FC]())
    goto LABEL_23;
  v12 = CCBigNumBitCount();
  v13 = v12 + 7;
  if (v12 < -7)
    v13 = v12 + 14;
  v14 = v13 >> 3;
  if (v13 >> 3 < (int)v4)
    goto LABEL_23;
  memset(v28, 0, sizeof(v28));
  (*(void (**)(_OWORD *))(*(_QWORD *)(a1 + 144) + 16))(v28);
  v15 = (uint64_t (**)())default_alloc;
  if (!default_alloc)
  {
    v15 = malloc_allocator;
    default_alloc = (uint64_t)malloc_allocator;
  }
  v16 = ((uint64_t (*)(uint64_t, uint64_t (*)()))*v15)(32, v15[2]);
  v17 = (_QWORD *)v16;
  if (v16)
  {
    *(_QWORD *)v16 = &cstr_empty_string;
    *(_QWORD *)(v16 + 8) = 0;
    *(_DWORD *)(v16 + 16) = 1;
    *(_QWORD *)(v16 + 24) = v15;
  }
  v18 = *(_QWORD *)(a1 + 56);
  if ((*(_BYTE *)(a1 + 4) & 2) == 0)
  {
    BigIntegerToCstr(v18, (uint64_t)v17);
    (*(void (**)(_OWORD *, _QWORD, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(v28, *v17, *((int *)v17 + 2));
LABEL_20:
    v4 = (int)v4;
    (*(void (**)(_OWORD *, const void *, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(v28, a3, (int)v4);
    goto LABEL_21;
  }
  BigIntegerToCstrEx(v18, (const void **)v17, v14);
  (*(void (**)(_OWORD *, _QWORD, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(v28, *v17, *((int *)v17 + 2));
  v19 = v14 - v4;
  if (v14 <= (int)v4)
    goto LABEL_20;
  v20 = v19;
  v4 = (int)v4;
  memcpy((void *)(*v17 + v19), a3, (int)v4);
  bzero((void *)*v17, v20);
  (*(void (**)(_OWORD *, _QWORD, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(v28, *v17, v14);
LABEL_21:
  (*(void (**)(_BYTE *, _OWORD *))(*(_QWORD *)(a1 + 144) + 32))(v31, v28);
  v29 = 0;
  *(_QWORD *)(a1 + 72) = CCBigNumFromData();
  (*(void (**)(_QWORD, const void *, uint64_t))(*(_QWORD *)(a1 + 144) + 24))(*(_QWORD *)(a1 + 104), a3, v4);
  v29 = 0;
  v21 = CCBigNumFromData();
  if ((MEMORY[0x18D78D2F0](v21, *(_QWORD *)(a1 + 16)) & 0x80000000) == 0
    || !MEMORY[0x18D78D2FC](v21, 0))
  {
    CCBigNumFree();
    cstr_clear_free((uint64_t)v17);
LABEL_23:
    v22 = 0xFFFFFFFFLL;
    goto LABEL_24;
  }
  BigIntegerFromInt();
  *(_QWORD *)(a1 + 80) = BigIntegerFromInt();
  CCBigNumSub();
  CCBigNumMul();
  CCBigNumAdd();
  CCBigNumMod();
  CCBigNumMul();
  CCBigNumAdd();
  CCBigNumModExp();
  CCBigNumFree();
  CCBigNumFree();
  BigIntegerToCstr(*(_QWORD *)(a1 + 80), (uint64_t)v17);
  v24 = *(_QWORD *)(a1 + 144);
  if (*(_QWORD *)(v24 + 8) == 40)
  {
    t_mgf1(*(_QWORD *)(a1 + 104) + 416, (const void *)*v17, *((_DWORD *)v17 + 2));
  }
  else
  {
    (*(void (**)(_OWORD *))(v24 + 16))(v28);
    (*(void (**)(_OWORD *, _QWORD, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(v28, *v17, *((int *)v17 + 2));
    (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)(a1 + 144) + 32))(*(_QWORD *)(a1 + 104) + 416, v28);
  }
  cstr_clear_free((uint64_t)v17);
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(*(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 104) + 416, *(_QWORD *)(*(_QWORD *)(a1 + 144) + 8));
  v25 = *(_QWORD *)(a1 + 88);
  if (*(int *)(v25 + 8) >= 1)
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(*(_QWORD *)(a1 + 104), *(_QWORD *)v25);
  if (a2)
  {
    v26 = *a2;
    if (!*a2)
    {
      v26 = cstr_new();
      *a2 = v26;
    }
    cstr_setn(v26, (const void *)(*(_QWORD *)(a1 + 104) + 416), *(_DWORD *)(*(_QWORD *)(a1 + 144) + 8));
  }
  v22 = 0;
LABEL_24:
  CCBigNumFree();
  return v22;
}

uint64_t srp6_client_verify(uint64_t a1, const void *a2, int a3)
{
  uint64_t result;
  _BYTE __s1[64];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)(a1 + 144) + 32))(__s1, *(_QWORD *)(a1 + 104) + 208);
  if (**(_DWORD **)(a1 + 144) != a3)
    return 0xFFFFFFFFLL;
  result = memcmp(__s1, a2, a3);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  return result;
}

uint64_t srp6_client_respond(uint64_t a1, _QWORD **a2)
{
  _QWORD *v4;
  uint64_t (**v5)();

  if (!a2)
    return 0xFFFFFFFFLL;
  v4 = *a2;
  if (!*a2)
  {
    v5 = (uint64_t (**)())default_alloc;
    if (!default_alloc)
    {
      v5 = malloc_allocator;
      default_alloc = (uint64_t)malloc_allocator;
    }
    v4 = (_QWORD *)((uint64_t (*)(uint64_t, uint64_t (*)()))*v5)(32, v5[2]);
    if (v4)
    {
      *v4 = &cstr_empty_string;
      v4[1] = 0;
      *((_DWORD *)v4 + 4) = 1;
      v4[3] = v5;
    }
    *a2 = v4;
  }
  cstr_set_length((uint64_t)v4, **(_DWORD **)(a1 + 144));
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 144) + 32))(**a2, *(_QWORD *)(a1 + 104));
  (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(*(_QWORD *)(a1 + 104) + 208, **a2, *((int *)*a2 + 2));
  (*(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(*(_QWORD *)(a1 + 104) + 208, *(_QWORD *)(a1 + 104) + 416, *(_QWORD *)(*(_QWORD *)(a1 + 144) + 8));
  return 0;
}

uint64_t srp6_server_finish(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 104);
  if (v2)
  {
    bzero(v2, 0x3C0uLL);
    free(*(void **)(a1 + 104));
  }
  return 0;
}

uint64_t srp6_server_params(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7)
{
  uint64_t v14;
  uint64_t v15;
  _OWORD v17[13];
  _BYTE v18[64];
  _BYTE v19[64];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  memset(v17, 0, sizeof(v17));
  (*(void (**)(_OWORD *))(*(_QWORD *)(a1 + 144) + 16))(v17);
  (*(void (**)(_OWORD *, uint64_t, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(v17, a2, a3);
  (*(void (**)(_BYTE *, _OWORD *))(*(_QWORD *)(a1 + 144) + 32))(v19, v17);
  (*(void (**)(_OWORD *))(*(_QWORD *)(a1 + 144) + 16))(v17);
  (*(void (**)(_OWORD *, uint64_t, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(v17, a4, a5);
  (*(void (**)(_BYTE *, _OWORD *))(*(_QWORD *)(a1 + 144) + 32))(v18, v17);
  v14 = *(_QWORD *)(a1 + 144);
  if ((int)*(_QWORD *)v14 >= 1)
  {
    v15 = 0;
    do
    {
      v19[v15] ^= v18[v15];
      ++v15;
    }
    while (v15 < (int)*(_QWORD *)v14);
  }
  (*(void (**)(uint64_t, _BYTE *))(v14 + 24))(*(_QWORD *)(a1 + 104) + 208, v19);
  (*(void (**)(_OWORD *))(*(_QWORD *)(a1 + 144) + 16))(v17);
  (*(void (**)(_OWORD *, _QWORD, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(v17, **(_QWORD **)(a1 + 8), *(int *)(*(_QWORD *)(a1 + 8) + 8));
  (*(void (**)(_BYTE *, _OWORD *))(*(_QWORD *)(a1 + 144) + 32))(v19, v17);
  (*(void (**)(uint64_t, _BYTE *, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(*(_QWORD *)(a1 + 104) + 208, v19, **(_QWORD **)(a1 + 144));
  (*(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(*(_QWORD *)(a1 + 104) + 208, a6, a7);
  return 0;
}

uint64_t srp6_server_auth(uint64_t a1)
{
  *(_QWORD *)(a1 + 40) = CCBigNumFromData();
  return 0;
}

uint64_t srp6_server_passwd(uint64_t a1, uint64_t a2, int a3)
{
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  int v20;
  _BYTE v21[64];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v7 = 0u;
  (*(void (**)(__int128 *))(*(_QWORD *)(a1 + 144) + 16))(&v7);
  (*(void (**)(__int128 *, _QWORD, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(&v7, **(_QWORD **)(a1 + 8), *(int *)(*(_QWORD *)(a1 + 8) + 8));
  (*(void (**)(__int128 *, const char *, uint64_t))(*(_QWORD *)(a1 + 144) + 24))(&v7, ":", 1);
  (*(void (**)(__int128 *, uint64_t, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(&v7, a2, a3);
  (*(void (**)(_BYTE *, __int128 *))(*(_QWORD *)(a1 + 144) + 32))(v21, &v7);
  (*(void (**)(__int128 *))(*(_QWORD *)(a1 + 144) + 16))(&v7);
  (*(void (**)(__int128 *, _QWORD, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(&v7, **(_QWORD **)(a1 + 32), *(int *)(*(_QWORD *)(a1 + 32) + 8));
  (*(void (**)(__int128 *, _BYTE *, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(&v7, v21, **(_QWORD **)(a1 + 144));
  (*(void (**)(_BYTE *, __int128 *))(*(_QWORD *)(a1 + 144) + 32))(v21, &v7);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v7 = 0u;
  v20 = 0;
  *(_QWORD *)(a1 + 48) = CCBigNumFromData();
  __memset_chk();
  *(_QWORD *)(a1 + 40) = BigIntegerFromInt();
  CCBigNumModExp();
  return 0;
}

uint64_t srp6_server_key(uint64_t a1, uint64_t *a2, const void *a3, int a4)
{
  int v8;
  int v9;
  int v10;
  uint64_t (**v11)();
  uint64_t v12;
  _QWORD *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t (**v21)();
  _OWORD v22[13];
  int v23;
  _BYTE v24[64];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = CCBigNumBitCount();
  v9 = v8 + 7;
  if (v8 < -7)
    v9 = v8 + 14;
  v10 = v9 >> 3;
  if (v9 >> 3 < a4)
    return 0xFFFFFFFFLL;
  memset(v22, 0, sizeof(v22));
  (*(void (**)(uint64_t, const void *, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(*(_QWORD *)(a1 + 104) + 208, a3, a4);
  v11 = (uint64_t (**)())default_alloc;
  if (!default_alloc)
  {
    v11 = malloc_allocator;
    default_alloc = (uint64_t)malloc_allocator;
  }
  v12 = ((uint64_t (*)(uint64_t, uint64_t (*)()))*v11)(32, v11[2]);
  v13 = (_QWORD *)v12;
  if (v12)
  {
    *(_QWORD *)v12 = &cstr_empty_string;
    *(_QWORD *)(v12 + 8) = 0;
    *(_DWORD *)(v12 + 16) = 1;
    *(_QWORD *)(v12 + 24) = v11;
  }
  BigIntegerToCstr(*(_QWORD *)(a1 + 56), v12);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(*(_QWORD *)(a1 + 104) + 208, *v13, *((int *)v13 + 2));
  (*(void (**)(_QWORD, const void *, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(*(_QWORD *)(a1 + 104), a3, a4);
  (*(void (**)(uint64_t, const void *, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(*(_QWORD *)(a1 + 104) + 416, a3, a4);
  (*(void (**)(_OWORD *))(*(_QWORD *)(a1 + 144) + 16))(v22);
  if ((*(_BYTE *)(a1 + 4) & 2) != 0)
  {
    v14 = v10 - a4;
    if (v10 <= a4)
    {
      (*(void (**)(_OWORD *, const void *, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(v22, a3, a4);
      if (*((_DWORD *)v13 + 2) >= v10)
        goto LABEL_14;
    }
    else
    {
      cstr_set_length((uint64_t)v13, v10);
      memcpy((void *)(*v13 + v14), a3, a4);
      bzero((void *)*v13, v14);
      (*(void (**)(_OWORD *, _QWORD, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(v22, *v13, v10);
    }
    BigIntegerToCstrEx(*(_QWORD *)(a1 + 56), (const void **)v13, v10);
    goto LABEL_14;
  }
  (*(void (**)(_OWORD *, const void *, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(v22, a3, a4);
LABEL_14:
  (*(void (**)(_OWORD *, _QWORD, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(v22, *v13, *((int *)v13 + 2));
  (*(void (**)(_BYTE *, _OWORD *))(*(_QWORD *)(a1 + 144) + 32))(v24, v22);
  v23 = 0;
  *(_QWORD *)(a1 + 72) = CCBigNumFromData();
  v15 = BigIntegerFromInt();
  CCBigNumModExp();
  v23 = 0;
  CCBigNumFromData();
  v16 = BigIntegerFromInt();
  CCBigNumMulMod();
  CCBigNumFree();
  if ((int)MEMORY[0x18D78D2FC](v16, 1) <= 0
    || (CCBigNumAddI(), !MEMORY[0x18D78D2F0](v15, *(_QWORD *)(a1 + 16))))
  {
    CCBigNumFree();
    CCBigNumFree();
    cstr_free((uint64_t)v13);
    return 0xFFFFFFFFLL;
  }
  *(_QWORD *)(a1 + 80) = BigIntegerFromInt();
  CCBigNumModExp();
  CCBigNumFree();
  CCBigNumFree();
  BigIntegerToCstr(*(_QWORD *)(a1 + 80), (uint64_t)v13);
  v17 = *(_QWORD *)(a1 + 144);
  if (*(_QWORD *)(v17 + 8) == 40)
  {
    t_mgf1(*(_QWORD *)(a1 + 104) + 832, (const void *)*v13, *((_DWORD *)v13 + 2));
  }
  else
  {
    (*(void (**)(_OWORD *))(v17 + 16))(v22);
    (*(void (**)(_OWORD *, _QWORD, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(v22, *v13, *((int *)v13 + 2));
    (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)(a1 + 144) + 32))(*(_QWORD *)(a1 + 104) + 832, v22);
  }
  cstr_clear_free((uint64_t)v13);
  (*(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(*(_QWORD *)(a1 + 104) + 208, *(_QWORD *)(a1 + 104) + 832, *(_QWORD *)(*(_QWORD *)(a1 + 144) + 8));
  v19 = *(_QWORD *)(a1 + 88);
  if (*(int *)(v19 + 8) >= 1)
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(*(_QWORD *)(a1 + 104) + 208, *(_QWORD *)v19);
  (*(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(*(_QWORD *)(a1 + 104) + 416, *(_QWORD *)(a1 + 104) + 832, *(_QWORD *)(*(_QWORD *)(a1 + 144) + 8));
  (*(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(*(_QWORD *)(a1 + 104) + 624, *(_QWORD *)(a1 + 104) + 832, *(_QWORD *)(*(_QWORD *)(a1 + 144) + 8));
  if (a2)
  {
    v20 = *a2;
    if (!*a2)
    {
      v21 = (uint64_t (**)())default_alloc;
      if (!default_alloc)
      {
        v21 = malloc_allocator;
        default_alloc = (uint64_t)malloc_allocator;
      }
      v20 = ((uint64_t (*)(uint64_t, uint64_t (*)()))*v21)(32, v21[2]);
      if (v20)
      {
        *(_QWORD *)v20 = &cstr_empty_string;
        *(_QWORD *)(v20 + 8) = 0;
        *(_DWORD *)(v20 + 16) = 1;
        *(_QWORD *)(v20 + 24) = v21;
      }
      *a2 = v20;
    }
    cstr_setn(v20, (const void *)(*(_QWORD *)(a1 + 104) + 832), *(_DWORD *)(*(_QWORD *)(a1 + 144) + 8));
  }
  return 0;
}

uint64_t srp6_server_verify(uint64_t a1, const void *a2, int a3)
{
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  _BYTE __s1[64];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)(a1 + 144) + 32))(__s1, *(_QWORD *)(a1 + 104) + 624);
  v6 = *(_QWORD *)(a1 + 144);
  if (*(_DWORD *)v6 == a3 && !memcmp(__s1, a2, a3))
  {
    (*(void (**)(uint64_t, uint64_t))(v6 + 32))(*(_QWORD *)(a1 + 104) + 896, *(_QWORD *)(a1 + 104) + 416);
  }
  else
  {
    (*(void (**)(_BYTE *, uint64_t))(v6 + 32))(__s1, *(_QWORD *)(a1 + 104) + 208);
    v7 = *(uint64_t **)(a1 + 144);
    v8 = *v7;
    if (*v7 != a3 || memcmp(__s1, a2, a3))
      return 0xFFFFFFFFLL;
    ((void (*)(_QWORD, _BYTE *, uint64_t))v7[3])(*(_QWORD *)(a1 + 104), __s1, v8);
    (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(*(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 104) + 832, *(_QWORD *)(*(_QWORD *)(a1 + 144) + 8));
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(a1 + 144) + 32))(*(_QWORD *)(a1 + 104) + 896, *(_QWORD *)(a1 + 104));
  }
  return 0;
}

uint64_t srp6_server_respond(uint64_t a1, void ***a2)
{
  void **v4;
  uint64_t (**v5)();

  if (!a2)
    return 0xFFFFFFFFLL;
  v4 = *a2;
  if (!*a2)
  {
    v5 = (uint64_t (**)())default_alloc;
    if (!default_alloc)
    {
      v5 = malloc_allocator;
      default_alloc = (uint64_t)malloc_allocator;
    }
    v4 = (void **)((uint64_t (*)(uint64_t, uint64_t (*)()))*v5)(32, v5[2]);
    if (v4)
    {
      *v4 = &cstr_empty_string;
      v4[1] = 0;
      *((_DWORD *)v4 + 4) = 1;
      v4[3] = v5;
    }
    *a2 = v4;
  }
  cstr_set_length((uint64_t)v4, **(_DWORD **)(a1 + 144));
  memcpy(**a2, (const void *)(*(_QWORD *)(a1 + 104) + 896), **(_QWORD **)(a1 + 144));
  return 0;
}

uint64_t srp6a_server_init(_QWORD *a1)
{
  *a1 = 0x30000001CLL;
  a1[13] = malloc_type_malloc(0x3C0uLL, 0x100004020E4CBADuLL);
  (*(void (**)(void))(a1[18] + 16))();
  (*(void (**)(uint64_t))(a1[18] + 16))(a1[13] + 208);
  (*(void (**)(uint64_t))(a1[18] + 16))(a1[13] + 416);
  (*(void (**)(uint64_t))(a1[18] + 16))(a1[13] + 624);
  return 0;
}

uint64_t srp6a_server_genpub(uint64_t a1, uint64_t *a2)
{
  uint64_t (**v4)();
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t (**v9)();
  uint64_t v10;
  uint64_t v11;
  uint64_t (**v12)();
  uint64_t v13;
  int v14;
  int v15;
  _OWORD v17[13];
  int v18;
  _BYTE v19[64];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  memset(v17, 0, sizeof(v17));
  (*(void (**)(_OWORD *))(*(_QWORD *)(a1 + 144) + 16))(v17);
  v4 = (uint64_t (**)())default_alloc;
  if (!default_alloc)
  {
    v4 = malloc_allocator;
    default_alloc = (uint64_t)malloc_allocator;
  }
  v5 = ((uint64_t (*)(uint64_t, uint64_t (*)()))*v4)(32, v4[2]);
  v6 = (_QWORD *)v5;
  if (v5)
  {
    *(_QWORD *)v5 = &cstr_empty_string;
    *(_QWORD *)(v5 + 8) = 0;
    *(_DWORD *)(v5 + 16) = 1;
    *(_QWORD *)(v5 + 24) = v4;
  }
  BigIntegerToCstr(*(_QWORD *)(a1 + 16), v5);
  (*(void (**)(_OWORD *, _QWORD, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(v17, *v6, *((int *)v6 + 2));
  v7 = *(_QWORD *)(a1 + 24);
  if ((*(_BYTE *)(a1 + 4) & 2) != 0)
    BigIntegerToCstrEx(v7, (const void **)v6, *((_DWORD *)v6 + 2));
  else
    BigIntegerToCstr(v7, (uint64_t)v6);
  (*(void (**)(_OWORD *, _QWORD, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(v17, *v6, *((int *)v6 + 2));
  (*(void (**)(_BYTE *, _OWORD *))(*(_QWORD *)(a1 + 144) + 32))(v19, v17);
  cstr_free((uint64_t)v6);
  v18 = 0;
  CCBigNumFromData();
  if (MEMORY[0x18D78D2FC]())
  {
    CCBigNumBitCount();
    if (a2)
    {
      v8 = (_QWORD *)*a2;
      if (!*a2)
      {
        v9 = (uint64_t (**)())default_alloc;
        if (!default_alloc)
        {
          v9 = malloc_allocator;
          default_alloc = (uint64_t)malloc_allocator;
        }
        v10 = ((uint64_t (*)(uint64_t, uint64_t (*)()))*v9)(32, v9[2]);
        v8 = (_QWORD *)v10;
        if (v10)
        {
          *(_QWORD *)v10 = &cstr_empty_string;
          *(_QWORD *)(v10 + 8) = 0;
          *(_DWORD *)(v10 + 16) = 1;
          *(_QWORD *)(v10 + 24) = v9;
        }
        *a2 = v10;
      }
    }
    else
    {
      v12 = (uint64_t (**)())default_alloc;
      if (!default_alloc)
      {
        v12 = malloc_allocator;
        default_alloc = (uint64_t)malloc_allocator;
      }
      v13 = ((uint64_t (*)(uint64_t, uint64_t (*)()))*v12)(32, v12[2]);
      v8 = (_QWORD *)v13;
      if (v13)
      {
        *(_QWORD *)v13 = &cstr_empty_string;
        *(_QWORD *)(v13 + 8) = 0;
        *(_DWORD *)(v13 + 16) = 1;
        *(_QWORD *)(v13 + 24) = v12;
      }
    }
    v14 = CCBigNumBitCount();
    v15 = v14 + 7;
    if (v14 < -7)
      v15 = v14 + 14;
    cstr_set_length((uint64_t)v8, v15 >> 3);
    RandomBytes((void *)*v8, 0x20uLL);
    v18 = 0;
    *(_QWORD *)(a1 + 64) = CCBigNumFromData();
    *(_QWORD *)(a1 + 56) = BigIntegerFromInt();
    CCBigNumMul();
    CCBigNumModExp();
    CCBigNumAdd();
    CCBigNumMod();
    BigIntegerToCstr(*(_QWORD *)(a1 + 56), (uint64_t)v8);
    (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 144) + 24))(*(_QWORD *)(a1 + 104) + 624, *v8, *((int *)v8 + 2));
    v11 = 0;
    if (!a2)
    {
      cstr_clear_free((uint64_t)v8);
      v11 = 0;
    }
  }
  else
  {
    v11 = 0xFFFFFFFFLL;
  }
  CCBigNumFree();
  return v11;
}

_QWORD *SRP_new(uint64_t a1)
{
  _DWORD *v2;
  _QWORD *v3;
  uint64_t (**v4)();
  uint64_t v5;
  uint64_t (**v6)();
  uint64_t v7;
  unsigned int (*v8)(_QWORD *);

  v2 = malloc_type_malloc(0x98uLL, 0x10E004039FB2966uLL);
  v3 = v2;
  if (v2)
  {
    v2[1] = 0;
    v4 = (uint64_t (**)())default_alloc;
    if (!default_alloc)
    {
      v4 = malloc_allocator;
      default_alloc = (uint64_t)malloc_allocator;
    }
    v5 = ((uint64_t (*)(uint64_t, uint64_t (*)()))*v4)(32, v4[2]);
    if (v5)
    {
      *(_QWORD *)v5 = &cstr_empty_string;
      *(_QWORD *)(v5 + 8) = 0;
      *(_DWORD *)(v5 + 16) = 1;
      *(_QWORD *)(v5 + 24) = v4;
    }
    v3[1] = v5;
    *((_OWORD *)v3 + 1) = 0u;
    *((_OWORD *)v3 + 2) = 0u;
    *((_OWORD *)v3 + 3) = 0u;
    *((_OWORD *)v3 + 4) = 0u;
    v3[10] = 0;
    v3[14] = 0;
    v3[15] = 0;
    v6 = (uint64_t (**)())default_alloc;
    if (!default_alloc)
    {
      v6 = malloc_allocator;
      default_alloc = (uint64_t)malloc_allocator;
    }
    v7 = ((uint64_t (*)(uint64_t, uint64_t (*)()))*v6)(32, v6[2]);
    if (v7)
    {
      *(_QWORD *)v7 = &cstr_empty_string;
      *(_QWORD *)(v7 + 8) = 0;
      *(_DWORD *)(v7 + 16) = 1;
      *(_QWORD *)(v7 + 24) = v6;
    }
    v3[11] = v7;
    v3[12] = a1;
    v3[13] = 0;
    v3[16] = 0;
    v3[17] = 0;
    v3[18] = &kSRPHashDescriptor_SHA512;
    v8 = *(unsigned int (**)(_QWORD *))(a1 + 8);
    if (v8 && v8(v3))
    {
      free(v3);
      return 0;
    }
  }
  return v3;
}

void SRP_free(_QWORD *a1)
{
  void (*v2)(_QWORD *);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(void (**)(_QWORD *))(a1[12] + 16);
  if (v2)
    v2(a1);
  v3 = a1[1];
  if (v3)
    cstr_clear_free(v3);
  if (a1[2])
    CCBigNumFree();
  if (a1[3])
    CCBigNumFree();
  v4 = a1[4];
  if (v4)
    cstr_clear_free(v4);
  if (a1[5])
    CCBigNumFree();
  if (a1[6])
    CCBigNumFree();
  if (a1[7])
    CCBigNumFree();
  if (a1[8])
    CCBigNumFree();
  if (a1[9])
    CCBigNumFree();
  if (a1[10])
    CCBigNumFree();
  v5 = a1[11];
  if (v5)
    cstr_clear_free(v5);
  free(a1);
}

uint64_t SRP_set_user_raw(uint64_t a1, const void *a2, int a3)
{
  uint64_t result;

  cstr_setn(*(_QWORD *)(a1 + 8), a2, a3);
  result = *(_QWORD *)(a1 + 136);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)result + 24))(result, a1, *(_QWORD *)(a1 + 8));
  return result;
}

uint64_t SRP_set_params(uint64_t a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t (**v7)();
  uint64_t result;
  uint64_t (*v9)(uint64_t, void *, uint64_t, void *, uint64_t);

  if (!a2)
    return 0xFFFFFFFFLL;
  *(_QWORD *)(a1 + 16) = CCBigNumFromData();
  if ((*(_BYTE *)(a1 + 4) & 1) != 0)
    *(_QWORD *)(a1 + 120) = 0;
  *(_QWORD *)(a1 + 24) = CCBigNumFromData();
  v6 = *(_QWORD *)(a1 + 32);
  if (!v6)
  {
    v7 = (uint64_t (**)())default_alloc;
    if (!default_alloc)
    {
      v7 = malloc_allocator;
      default_alloc = (uint64_t)malloc_allocator;
    }
    v6 = ((uint64_t (*)(uint64_t, uint64_t (*)()))*v7)(32, v7[2]);
    if (v6)
    {
      *(_QWORD *)v6 = &cstr_empty_string;
      *(_QWORD *)(v6 + 8) = 0;
      *(_DWORD *)(v6 + 16) = 1;
      *(_QWORD *)(v6 + 24) = v7;
    }
    *(_QWORD *)(a1 + 32) = v6;
  }
  cstr_setn(v6, a2, a3);
  if ((int)CCBigNumBitCount() < 512)
    return 0xFFFFFFFFLL;
  v9 = *(uint64_t (**)(uint64_t, void *, uint64_t, void *, uint64_t))(a1 + 128);
  if (!v9)
    return (*(uint64_t (**)(uint64_t, void *, uint64_t, void *, uint64_t, const void *, uint64_t))(*(_QWORD *)(a1 + 96) + 24))(a1, &kSRPModulus3072, 384, &kSRPGenerator5, 1, a2, a3);
  result = v9(a1, &kSRPModulus3072, 384, &kSRPGenerator5, 1);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, void *, uint64_t, void *, uint64_t, const void *, uint64_t))(*(_QWORD *)(a1 + 96) + 24))(a1, &kSRPModulus3072, 384, &kSRPGenerator5, 1, a2, a3);
  return result;
}

uint64_t t_mgf1(uint64_t a1, const void *a2, CC_LONG a3)
{
  uint64_t v6;
  unsigned int v7;
  uint64_t result;
  unsigned int data;
  CC_SHA1_CTX c;

  v6 = 0;
  v7 = 0;
  memset(&c, 0, sizeof(c));
  do
  {
    data = bswap32(v7);
    CC_SHA1_Init(&c);
    CC_SHA1_Update(&c, a2, a3);
    CC_SHA1_Update(&c, &data, 4u);
    result = CC_SHA1_Final((unsigned __int8 *)(a1 + v6), &c);
    ++v7;
    v6 += 20;
  }
  while (v6 != 40);
  return result;
}

uint64_t SRPCreate_corecrypto(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  v2 = malloc_type_calloc(1uLL, 0x38uLL, 0x103004063A0F53DuLL);
  if (!v2)
    return 4294960568;
  v3 = v2;
  result = 0;
  *a1 = v3;
  return result;
}

void SRPDelete_corecrypto(void *a1)
{
  if (a1)
  {
    _SRPCleanup_corecrypto((uint64_t)a1);
    free(a1);
  }
}

void _SRPCleanup_corecrypto(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(void **)a1;
  if (v2)
  {
    memset_s(v2, *(_QWORD *)(a1 + 8), 0, *(_QWORD *)(a1 + 8));
    if (*(_QWORD *)a1)
    {
      free(*(void **)a1);
      *(_QWORD *)a1 = 0;
    }
  }
  *(_QWORD *)(a1 + 8) = 0;
  v3 = *(void **)(a1 + 16);
  if (v3)
  {
    free(v3);
    *(_QWORD *)(a1 + 16) = 0;
  }
  v4 = *(void **)(a1 + 24);
  if (v4)
  {
    memset_s(v4, *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 32));
    v5 = *(void **)(a1 + 24);
    if (v5)
    {
      free(v5);
      *(_QWORD *)(a1 + 24) = 0;
    }
  }
  *(_QWORD *)(a1 + 32) = 0;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    memset_s(v6, *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 48));
    v7 = *(void **)(a1 + 40);
    if (v7)
    {
      free(v7);
      *(_QWORD *)(a1 + 40) = 0;
    }
  }
  *(_QWORD *)(a1 + 48) = 0;
}

uint64_t SRPClientStart_corecrypto(_QWORD *a1, void *a2, const char *a3, size_t a4, char *a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, size_t a10, _QWORD *a11, size_t *a12, _QWORD *a13, size_t *a14, _QWORD *a15, size_t *a16)
{
  uint64_t v17;
  _QWORD *v22;
  size_t v23;
  void *v24;
  uint64_t v25;
  size_t v26;
  size_t v27;
  char *v28;
  char *v29;
  void *v30;
  void *v31;
  char *v32;
  void *v33;
  size_t session_key_length;
  size_t v35;
  uint64_t v36;
  uint64_t v37;
  char *__s;

  if (a2 != &_kSRPParameters_3072_SHA512)
  {
    v17 = 4294960561;
LABEL_33:
    _SRPCleanup_corecrypto((uint64_t)a1);
    return v17;
  }
  v22 = (_QWORD *)ccsha512_di();
  ccsrp_gp_rfc5054_3072();
  v23 = 4 * (*v22 + ccdh_ccn_size()) + 48;
  a1[1] = v23;
  v24 = malloc_type_calloc(1uLL, v23, 0x710ECAE9uLL);
  *a1 = v24;
  if (!v24)
    goto LABEL_32;
  __s = a5;
  ccrng();
  ccsrp_ctx_init_option();
  v25 = MEMORY[0x18D78E3D0](*(_QWORD *)(*a1 + 8));
  v26 = 8 * v25;
  v27 = 8 * v25 - a10;
  if (8 * v25 > a10)
  {
    v28 = (char *)malloc_type_malloc(8 * v25, 0x36488BDDuLL);
    if (v28)
    {
      v29 = v28;
      memset(v28, 48, v27);
      memcpy(&v29[v27], a9, a10);
      goto LABEL_9;
    }
LABEL_32:
    v17 = 4294960568;
    goto LABEL_33;
  }
  if (v26 != a10)
  {
    v17 = 4294960553;
    goto LABEL_33;
  }
  v29 = 0;
LABEL_9:
  v30 = malloc_type_malloc(v26, 0x54BD6131uLL);
  if (!v30)
  {
    LOBYTE(v31) = 0;
    v32 = 0;
LABEL_37:
    v33 = 0;
LABEL_40:
    v17 = 4294960568;
    goto LABEL_22;
  }
  if (ccsrp_client_start_authentication())
  {
    LOBYTE(v31) = 0;
    v32 = 0;
    v33 = 0;
    v17 = 4294960596;
    goto LABEL_22;
  }
  if (a4 == -1)
    a4 = strlen(a3);
  v32 = strndup(a3, a4);
  if (!v32)
  {
    LOBYTE(v31) = 0;
    goto LABEL_37;
  }
  session_key_length = ccsrp_get_session_key_length();
  if (!session_key_length)
  {
    LOBYTE(v31) = 0;
    v33 = 0;
    v17 = 4294960553;
    goto LABEL_22;
  }
  v35 = session_key_length;
  v33 = malloc_type_malloc(session_key_length, 0xA9E72F20uLL);
  if (!v33)
  {
    LOBYTE(v31) = 0;
    goto LABEL_40;
  }
  if (a6 == -1)
    strlen(__s);
  if (!ccsrp_client_process_challenge())
  {
    v31 = malloc_type_malloc(v35, 0x2414696EuLL);
    if (v31)
    {
      v36 = *a1;
      v37 = MEMORY[0x18D78E3D0](*(_QWORD *)(*a1 + 8));
      memcpy(v31, (const void *)(v36 + 32 * v37 + 32), v35);
      v17 = 0;
      *a11 = v30;
      *a12 = v26;
      *a13 = v31;
      *a14 = v35;
      LOBYTE(v31) = 1;
      *a15 = v33;
      *a16 = v35;
      v30 = 0;
      v33 = 0;
      goto LABEL_22;
    }
    goto LABEL_40;
  }
  LOBYTE(v31) = 0;
  v17 = 4294960542;
LABEL_22:
  if (v29)
    free(v29);
  if (v30)
    free(v30);
  if (v32)
    free(v32);
  if (v33)
    free(v33);
  if ((v31 & 1) == 0)
    goto LABEL_33;
  return 0;
}

uint64_t SRPClientVerify_corecrypto(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  if (*a1)
  {
    if (ccsrp_get_session_key_length() == a3)
    {
      if (ccsrp_client_verify_session())
        v4 = 0;
      else
        v4 = 4294960542;
    }
    else
    {
      v4 = 4294960553;
    }
  }
  else
  {
    v4 = 4294960551;
  }
  _SRPCleanup_corecrypto((uint64_t)a1);
  return v4;
}

uint64_t SRPServerStart_corecrypto(uint64_t a1, void *a2, const char *a3, size_t a4, const char *a5, uint64_t a6, size_t a7, void *a8, _QWORD *a9, size_t *a10)
{
  uint64_t v11;
  _QWORD *v18;
  size_t v19;
  void *v20;
  size_t v21;
  void *v22;
  char *v23;
  void *v24;
  void *v25;
  void *v26;

  if (a2 == &_kSRPParameters_3072_SHA512)
  {
    v18 = (_QWORD *)ccsha512_di();
    ccsrp_gp_rfc5054_3072();
    v19 = 4 * (*v18 + ccdh_ccn_size()) + 48;
    *(_QWORD *)(a1 + 8) = v19;
    v20 = malloc_type_calloc(1uLL, v19, 0x643B0AA6uLL);
    *(_QWORD *)a1 = v20;
    if (v20)
    {
      ccrng();
      ccsrp_ctx_init_option();
      v21 = 8 * MEMORY[0x18D78E3D0](*(_QWORD *)(*(_QWORD *)a1 + 8));
      v22 = malloc_type_malloc(v21, 0x14CF2659uLL);
      *(_QWORD *)(a1 + 40) = v22;
      if (v22)
      {
        if (a4 == -1)
          a4 = strlen(a3);
        v23 = strndup(a3, a4);
        *(_QWORD *)(a1 + 16) = v23;
        if (v23)
        {
          v24 = malloc_type_malloc(a7, 0xC38E206DuLL);
          *(_QWORD *)(a1 + 24) = v24;
          if (v24)
          {
            *(_QWORD *)(a1 + 32) = a7;
            if (a6 == -1)
              strlen(a5);
            if (ccsrp_generate_salt_and_verification())
            {
LABEL_15:
              v11 = 4294960596;
              goto LABEL_16;
            }
            memcpy(a8, *(const void **)(a1 + 24), a7);
            v25 = malloc_type_malloc(v21, 0x84993042uLL);
            if (v25)
            {
              v26 = v25;
              if (!ccsrp_server_generate_public_key())
              {
                v11 = 0;
                *a9 = v26;
                *a10 = v21;
                return v11;
              }
              free(v26);
              goto LABEL_15;
            }
          }
        }
      }
    }
    v11 = 4294960568;
    goto LABEL_16;
  }
  v11 = 4294960561;
LABEL_16:
  _SRPCleanup_corecrypto(a1);
  return v11;
}

uint64_t SRPServerVerify_corecrypto(_QWORD *a1, const void *a2, size_t a3, uint64_t a4, size_t a5, _QWORD *a6, size_t *a7, _QWORD *a8, size_t *a9)
{
  uint64_t session_key_length;
  uint64_t v17;
  size_t v18;
  size_t v19;
  char *v20;
  char *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;

  if (!*a1 || !a1[2] || !a1[3] || !a1[4])
  {
    v17 = 4294960551;
    goto LABEL_21;
  }
  session_key_length = ccsrp_get_session_key_length();
  v17 = 4294960553;
  if (session_key_length && session_key_length == a5)
  {
    v18 = 8 * MEMORY[0x18D78E3D0](*(_QWORD *)(*a1 + 8));
    v19 = v18 - a3;
    if (v18 < a3)
    {
      v17 = 4294960553;
      goto LABEL_21;
    }
    if (v18 > a3)
    {
      v20 = (char *)malloc_type_malloc(v18, 0xBBD66175uLL);
      if (!v20)
      {
        v17 = 4294960568;
        goto LABEL_21;
      }
      v21 = v20;
      bzero(v20, v19);
      memcpy(&v21[v19], a2, a3);
    }
    else
    {
      v21 = 0;
    }
    if (ccsrp_server_compute_session())
    {
      v22 = 0;
    }
    else
    {
      v22 = malloc_type_malloc(a5, 0x6CD85071uLL);
      if (!v22)
        goto LABEL_23;
      if (ccsrp_server_verify_session())
      {
        v23 = malloc_type_malloc(a5, 0xD7E278AuLL);
        if (v23)
        {
          v24 = v23;
          v25 = *a1;
          v26 = MEMORY[0x18D78E3D0](*(_QWORD *)(*a1 + 8));
          memcpy(v24, (const void *)(v25 + 32 * v26 + 32), a5);
          v17 = 0;
          *a6 = v24;
          *a7 = a5;
          *a8 = v22;
          *a9 = a5;
          v22 = 0;
LABEL_17:
          if (v21)
            free(v21);
          if (v22)
            free(v22);
          goto LABEL_21;
        }
LABEL_23:
        v17 = 4294960568;
        goto LABEL_17;
      }
    }
    v17 = 4294960542;
    goto LABEL_17;
  }
LABEL_21:
  _SRPCleanup_corecrypto((uint64_t)a1);
  return v17;
}

uint64_t SRPCreate_libsrp(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  v2 = malloc_type_calloc(1uLL, 0x38uLL, 0x103004063A0F53DuLL);
  if (!v2)
    return 4294960568;
  v3 = v2;
  result = 0;
  *a1 = v3;
  return result;
}

void SRPDelete_libsrp(_QWORD *a1)
{
  _QWORD *v2;

  v2 = (_QWORD *)*a1;
  if (v2)
    SRP_free(v2);
  free(a1);
}

uint64_t SRPClientStart_libsrp(uint64_t *a1, void *a2, const char *a3, uint64_t a4, const char *a5, uint64_t a6, const void *a7, uint64_t a8, uint64_t a9, uint64_t a10, _QWORD *a11, _QWORD *a12, _QWORD *a13, _QWORD *a14, _QWORD *a15, _QWORD *a16)
{
  uint64_t v16;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;

  if (a2 == &_kSRPParameters_3072_SHA512)
  {
    v24 = (_QWORD *)*a1;
    if (v24)
    {
      SRP_free(v24);
      *a1 = 0;
    }
    v25 = SRP_new((uint64_t)&srp6a_client_meth);
    *a1 = (uint64_t)v25;
    if (!v25)
      return 4294960568;
    v26 = (uint64_t)v25;
    if (a4 == -1)
      LODWORD(a4) = strlen(a3);
    if (SRP_set_user_raw(v26, a3, a4) || SRP_set_params(*a1, a7, a8))
      return 4294960596;
    if (a6 == -1)
      strlen(a5);
    if ((*(unsigned int (**)(void))(*(_QWORD *)(*a1 + 96) + 40))()
      || (*(unsigned int (**)(void))(*(_QWORD *)(*a1 + 96) + 48))())
    {
      return 4294960596;
    }
    if (MEMORY[8] < 1)
    {
      v16 = 4294960553;
      cstr_free(0);
      return v16;
    }
    if ((*(unsigned int (**)(void))(*(_QWORD *)(*a1 + 96) + 56))())
      return 4294960596;
    if (MEMORY[8] >= 1)
    {
      if ((*(unsigned int (**)(void))(*(_QWORD *)(*a1 + 96) + 72))())
        return 4294960596;
      if (MEMORY[8] >= 1)
      {
        v16 = 0;
        *a11 = MEMORY[0];
        *a12 = MEMORY[8];
        MEMORY[8] = 0;
        *a13 = MEMORY[0];
        *a14 = MEMORY[8];
        MEMORY[8] = 0;
        *a15 = MEMORY[0];
        *a16 = MEMORY[8];
        MEMORY[8] = 0;
        return v16;
      }
    }
    return 4294960553;
  }
  return 4294960561;
}

uint64_t SRPClientVerify_libsrp(_QWORD **a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = (uint64_t)*a1;
  if (!v2)
    return 4294960551;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(v2 + 96) + 64))())
    v3 = 4294960542;
  else
    v3 = 0;
  if (*a1)
  {
    SRP_free(*a1);
    *a1 = 0;
  }
  return v3;
}

uint64_t SRPServerStart_libsrp(uint64_t *a1, void *a2, const char *a3, uint64_t a4, const char *a5, uint64_t a6, size_t a7, void *a8, _QWORD *a9, _QWORD *a10)
{
  uint64_t v10;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;

  if (a2 != &_kSRPParameters_3072_SHA512)
    return 4294960561;
  v18 = (_QWORD *)*a1;
  if (v18)
  {
    SRP_free(v18);
    *a1 = 0;
  }
  v19 = SRP_new((uint64_t)&srp6a_server_meth);
  *a1 = (uint64_t)v19;
  if (!v19)
    return 4294960568;
  v20 = (uint64_t)v19;
  if (a4 == -1)
    LODWORD(a4) = strlen(a3);
  if (SRP_set_user_raw(v20, a3, a4))
    return 4294960596;
  if (a7 < 0x10)
    return 4294960591;
  RandomBytes(a8, a7);
  CryptoHKDF((uint64_t)kCryptoHashDescriptor_SHA512, (uint64_t)a8, a7, "SRP-Salt-Salt", 0xDuLL, (uint64_t)"SRP-Salt-Info", 13, a7, (uint64_t)a8);
  if (SRP_set_params(*a1, a8, a7))
    return 4294960596;
  if (a6 == -1)
    strlen(a5);
  if ((*(unsigned int (**)(void))(*(_QWORD *)(*a1 + 96) + 40))())
    return 4294960596;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(*a1 + 96) + 48))())
    return 4294960596;
  v10 = 0;
  *a9 = MEMORY[0];
  *a10 = MEMORY[8];
  MEMORY[8] = 0;
  cstr_free(0);
  return v10;
}

uint64_t SRPServerVerify_libsrp(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, _QWORD *a7, _QWORD *a8, _QWORD *a9)
{
  uint64_t v10;
  uint64_t v14;

  v10 = (uint64_t)*a1;
  if (!v10)
    return 4294960551;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(v10 + 96) + 56))())
    goto LABEL_6;
  if (MEMORY[8] < 1)
  {
    v14 = 4294960553;
    cstr_clear_free(0);
  }
  else if ((*(unsigned int (**)(void))((*a1)[12] + 64))())
  {
    v14 = 4294960542;
  }
  else
  {
    if ((*(unsigned int (**)(void))((*a1)[12] + 72))())
    {
LABEL_6:
      v14 = 4294960596;
      goto LABEL_7;
    }
    if (MEMORY[8] < 1)
    {
      v14 = 4294960553;
    }
    else
    {
      v14 = 0;
      *a6 = MEMORY[0];
      *a7 = MEMORY[8];
      MEMORY[8] = 0;
      *a8 = MEMORY[0];
      *a9 = MEMORY[8];
      MEMORY[8] = 0;
    }
  }
LABEL_7:
  if (*a1)
  {
    SRP_free(*a1);
    *a1 = 0;
  }
  return v14;
}

uint64_t ParseIPv4Address(unsigned __int8 *a1, _BYTE *a2, unsigned __int8 **a3)
{
  unsigned __int8 v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;

  *a2 = 0;
  v3 = *a1;
  if (!*a1)
    return 4294960546;
  LOBYTE(v4) = 0;
  v5 = 0;
  v6 = 0;
  do
  {
    if (v3 - 48 <= 9)
    {
      v4 = 10 * v4 + (char)v3 - 48;
      if (v4 > 255)
        return 4294960586;
      *a2 = v4;
      if (!v5)
      {
        if (v6 > 3)
          return 4294960545;
        ++v6;
      }
      v5 = 1;
      goto LABEL_13;
    }
    if (!v5 || v3 != 46)
      break;
    if (v6 > 3)
      return 4294960554;
    LOBYTE(v4) = 0;
    v5 = 0;
    *++a2 = 0;
LABEL_13:
    v7 = *++a1;
    v3 = v7;
  }
  while (v7);
  if (v6 != 4)
    return 4294960546;
  v8 = 0;
  *a3 = a1;
  return v8;
}

uint64_t StringToIPv4Address(unsigned __int8 *a1, _DWORD *a2, int *a3)
{
  uint64_t result;
  unsigned __int8 *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  unsigned int v12;
  unsigned __int8 *v13;
  int v14;
  unsigned int v15;
  char *v16;

  v16 = (char *)a1;
  if (!a1)
    return 4294960591;
  result = ParseIPv4Address(a1, &v15, (unsigned __int8 **)&v16);
  if (!(_DWORD)result)
  {
    v6 = (unsigned __int8 *)v16;
    v7 = *v16;
    if (v7 == 58)
    {
      v6 = (unsigned __int8 *)(v16 + 1);
      v8 = v16[1];
      if ((v8 - 48) > 9)
      {
        v9 = 0;
        ++v16;
      }
      else
      {
        v9 = 0;
        do
        {
          v9 = v8 + 10 * v9 - 48;
          v10 = (char)*++v6;
          v8 = v10;
        }
        while ((v10 - 48) < 0xA);
        v16 = (char *)v6;
        if (v9 >= 0x10000)
          return 4294960586;
      }
    }
    else
    {
      v9 = 0;
      v8 = *v16;
    }
    if (v8 == 47)
    {
      v11 = v6[1];
      if ((v11 - 48) <= 9)
      {
        v12 = 0;
        v13 = v6 + 2;
        do
        {
          v12 = v11 + 10 * v12 - 48;
          v14 = *v13++;
          v11 = v14;
        }
        while ((v14 - 48) < 0xA);
        if (v12 > 0x20)
          return 4294960586;
      }
    }
    if (a2)
      *a2 = bswap32(v15);
    result = 0;
    if (a3)
    {
      if (v7 == 58)
      {
        result = 0;
        *a3 = v9;
      }
    }
  }
  return result;
}

_BYTE *IPv4AddressToCString(unsigned int a1, unsigned int a2, _BYTE *a3)
{
  unsigned int v3;
  _BYTE *v4;
  unsigned int v5;
  _BYTE *v6;
  BOOL v7;
  char v8;
  _BYTE *v9;
  char v10;
  _BYTE v12[32];
  uint64_t v13;

  v3 = 1;
  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  do
  {
    v5 = (a1 >> (-8 * v3));
    v6 = v12;
    do
    {
      *v6++ = (v5 % 0xA) | 0x30;
      v7 = v5 > 9;
      v5 /= 0xAu;
    }
    while (v7);
    while (v6 > v12)
    {
      v8 = *--v6;
      *v4++ = v8;
    }
    if (v3 <= 3)
      *v4++ = 46;
    ++v3;
  }
  while (v3 != 5);
  if ((int)a2 >= 1)
  {
    *v4 = 58;
    v9 = v12;
    do
    {
      *v9++ = (a2 % 0xA) | 0x30;
      v7 = a2 > 9;
      a2 /= 0xAu;
    }
    while (v7);
    ++v4;
    while (v9 > v12)
    {
      v10 = *--v9;
      *v4++ = v10;
    }
  }
  *v4 = 0;
  return a3;
}

_BYTE *BitListString_Make(unsigned int a1, _BYTE *a2, _QWORD *a3)
{
  _BYTE *v3;
  unsigned int v4;
  _BYTE *v5;
  _BYTE *v6;
  unsigned int v7;
  BOOL v8;
  char v9;
  _BYTE v11[32];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = 0;
    v3 = a2;
    do
    {
      if ((a1 & 1) != 0)
      {
        v5 = a2;
        if (v3 != a2)
        {
          *v3 = 44;
          v5 = v3 + 1;
        }
        v6 = v11;
        v7 = v4;
        do
        {
          *v6++ = (v7 % 0xA) | 0x30;
          v8 = v7 > 9;
          v7 /= 0xAu;
        }
        while (v8);
        while (v6 > v11)
        {
          v9 = *--v6;
          *v5++ = v9;
        }
        v3 = v5;
      }
      ++v4;
      v8 = a1 > 1;
      a1 >>= 1;
    }
    while (v8);
  }
  *v3 = 0;
  if (a3)
    *a3 = v3 - a2;
  return a2;
}

uint64_t BitListString_Parse(char *__s, int64_t a2, _DWORD *a3)
{
  char *v4;
  int v5;
  unint64_t v6;
  unsigned int v7;
  char *v8;
  int v9;
  uint64_t result;

  v4 = __s;
  if (a2 == -1)
    a2 = strlen(__s);
  if (a2 < 1)
  {
    v5 = 0;
LABEL_15:
    result = 0;
    *a3 = v5;
  }
  else
  {
    v5 = 0;
    v6 = (unint64_t)&v4[a2];
    while (1)
    {
      v7 = 0;
      v8 = v4;
      do
      {
        v9 = *v8;
        if ((v9 - 48) > 9)
          break;
        v7 = v9 + 10 * v7 - 48;
        ++v8;
      }
      while ((unint64_t)v8 < v6);
      if (v8 == v4 || v8 != (char *)v6 && v9 != 44)
        return 4294960554;
      if (v7 > 0x1F)
        return 4294960586;
      v5 |= 1 << v7;
      v4 = v8 + 1;
      if ((unint64_t)(v8 + 1) >= v6)
        goto LABEL_15;
    }
  }
  return result;
}

_BYTE *FourCharCodeToCString(unsigned int a1, _BYTE *a2)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  char v5;

  v2 = HIBYTE(a1);
  if (!HIBYTE(a1))
    LOBYTE(v2) = 32;
  *a2 = v2;
  v3 = HIWORD(a1);
  if (!BYTE2(a1))
    LOBYTE(v3) = 32;
  a2[1] = v3;
  v4 = a1 >> 8;
  if (!BYTE1(a1))
    LOBYTE(v4) = 32;
  a2[2] = v4;
  if ((_BYTE)a1)
    v5 = a1;
  else
    v5 = 32;
  a2[3] = v5;
  a2[4] = 0;
  return a2;
}

uint64_t TextToFourCharCode(char *__s, size_t a2)
{
  int v3;
  int v4;
  int v5;
  int v6;

  if (a2 == -1)
    a2 = strlen(__s);
  v3 = 0x2000;
  if (a2)
  {
    if (*__s)
      v4 = *__s << 8;
    else
      v4 = 0x2000;
    v5 = 32;
    if (a2 == 1)
    {
      v6 = 32;
    }
    else
    {
      if (__s[1])
        v6 = __s[1];
      else
        v6 = 32;
      v3 = 0x2000;
      if (a2 >= 3)
      {
        if (__s[2])
          v3 = __s[2] << 8;
        else
          v3 = 0x2000;
        v5 = 32;
        if (a2 != 3)
        {
          if (__s[3])
            v5 = __s[3];
          else
            v5 = 32;
        }
      }
    }
  }
  else
  {
    v6 = 32;
    v4 = 0x2000;
    v5 = 32;
  }
  return v5 | v3 | ((v4 | v6) << 16);
}

unint64_t TextToHardwareAddressScalar(char *a1, size_t a2, unint64_t a3)
{
  unint64_t v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (a3 > 8 || TextToHardwareAddress(a1, a2, a3, v5))
    return 0;
  if (a3 != 8)
  {
    if (a3 == 6)
      return ((unint64_t)LOBYTE(v5[0]) << 40) | ((unint64_t)BYTE1(v5[0]) << 32) | ((unint64_t)BYTE2(v5[0]) << 24) | ((unint64_t)BYTE3(v5[0]) << 16) | ((unint64_t)BYTE4(v5[0]) << 8) | BYTE5(v5[0]);
    return 0;
  }
  return bswap64(v5[0]);
}

_BYTE *HardwareAddressToCString(unsigned __int8 *a1, uint64_t a2, _BYTE *a3)
{
  _BYTE *v3;
  unsigned __int8 *v4;
  _BYTE *v5;
  unsigned int v6;

  v3 = a3;
  if (a2 >= 1)
  {
    v4 = &a1[a2];
    v3 = a3;
    do
    {
      v5 = a3;
      if (v3 != a3)
      {
        *v3 = 58;
        v5 = v3 + 1;
      }
      v6 = *a1++;
      *v5 = a0123456789abcd_0[(unint64_t)v6 >> 4];
      v3 = v5 + 2;
      v5[1] = a0123456789abcd_0[v6 & 0xF];
    }
    while (a1 < v4);
  }
  *v3 = 0;
  return a3;
}

uint64_t TextToInt32(char *__s, int64_t a2, int a3)
{
  int64_t v4;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  int v14;
  char *v15;
  int v16;
  int v17;
  unsigned int v18;
  int v19;
  int v20;
  unsigned int v21;
  char *v22;
  uint64_t v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;

  v4 = a2;
  if (a2 == -1)
    v4 = strlen(__s);
  v6 = &__s[v4];
  if (v4 < 1)
  {
    v8 = __s;
  }
  else
  {
    v7 = MEMORY[0x1E0C80978];
    v8 = __s;
    do
    {
      v9 = *v8;
      if (*v8 < 0)
      {
        if (!__maskrune(v9, 0x4000uLL))
          break;
      }
      else if ((*(_DWORD *)(v7 + 4 * v9 + 60) & 0x4000) == 0)
      {
        break;
      }
      ++v8;
    }
    while (v8 < v6);
  }
  if (v6 - v8 <= 1)
  {
    if (a3)
      goto LABEL_22;
  }
  else
  {
    if (*v8 == 48)
    {
      if (__tolower(v8[1]) == 120)
      {
        v8 += 2;
        a3 = 16;
LABEL_22:
        v10 = a3 - 2;
        goto LABEL_27;
      }
      if (*v8 == 48 && __tolower(v8[1]) == 98)
      {
        v8 += 2;
        a3 = 2;
        goto LABEL_22;
      }
    }
    if (a3)
      goto LABEL_22;
    if (*v8 == 48 && (v8[1] & 0xF8) == 0x30)
    {
      a3 = 8;
      ++v8;
      goto LABEL_22;
    }
  }
  v10 = 8;
LABEL_27:
  v11 = 0;
  HIDWORD(v12) = v10;
  LODWORD(v12) = v10;
  switch((v12 >> 1))
  {
    case 0u:
      if (v8 >= v6)
        goto LABEL_54;
      v11 = 0;
      v13 = (char *)(&__s[v4] - v8);
      do
      {
        v14 = *v8;
        if ((v14 - 50) < 0xFFFFFFFE)
          break;
        ++v8;
        v11 = (v14 + 2 * v11 - 48);
        --v13;
      }
      while (v13);
      break;
    case 3u:
      if (v8 >= v6)
        goto LABEL_54;
      v11 = 0;
      v15 = (char *)(&__s[v4] - v8);
      do
      {
        v16 = *v8;
        if ((v16 - 56) < 0xFFFFFFF8)
          break;
        ++v8;
        v11 = (v16 + 8 * v11 - 48);
        --v15;
      }
      while (v15);
      break;
    case 4u:
      v17 = *v8;
      if (v17 == 45 || v17 == 43)
        ++v8;
      v18 = 0;
      while (v8 < v6)
      {
        v20 = *v8++;
        v19 = v20;
        if (v20 != 44)
        {
          v21 = v19 - 48;
          if (v21 > 9)
            break;
          v18 = v21 + 10 * v18;
        }
      }
      if (v17 == 45)
        v11 = -v18;
      else
        v11 = v18;
      break;
    case 7u:
      if (v8 >= v6)
      {
LABEL_54:
        v11 = 0;
      }
      else
      {
        v11 = 0;
        v22 = (char *)(&__s[v4] - v8);
        v23 = MEMORY[0x1E0C80978];
        do
        {
          v25 = *v8++;
          v24 = v25;
          v26 = v25 - 48;
          if (v25 - 48 > 9)
          {
            if ((*(_DWORD *)(v23 + 4 * v24 + 60) & 0x10000) == 0)
              return v11;
            v11 = (__tolower(v24) + 16 * v11 - 87);
          }
          else
          {
            v11 = v26 + 16 * (_DWORD)v11;
          }
          --v22;
        }
        while (v22);
      }
      break;
    default:
      return v11;
  }
  return v11;
}

uint64_t TextToSourceVersion(char *__s, int64_t a2)
{
  int64_t v2;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unsigned int v8;
  char *v9;
  int v10;
  char *v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;

  v2 = a2;
  if (a2 == -1)
    v2 = strlen(__s);
  v4 = &__s[v2];
  if (v2 < 1)
  {
    v6 = __s;
  }
  else
  {
    v5 = MEMORY[0x1E0C80978];
    v6 = __s;
    do
    {
      v7 = *v6;
      if (*v6 < 0)
      {
        if (!__maskrune(v7, 0x4000uLL))
          break;
      }
      else if ((*(_DWORD *)(v5 + 4 * v7 + 60) & 0x4000) == 0)
      {
        break;
      }
      ++v6;
    }
    while (v6 < v4);
  }
  if (v6 >= v4)
  {
    v10 = 0;
    v8 = 0;
  }
  else
  {
    v8 = 0;
    v9 = (char *)(&__s[v2] - v6);
    while (1)
    {
      v10 = *v6;
      if ((v10 - 48) > 9 || v8 >= 0x346DC)
        break;
      v8 = v10 - 48 + 10 * v8;
      ++v6;
      if (!--v9)
      {
        v6 = &__s[v2];
        break;
      }
    }
    if (v8 > 0x346DB)
      return 0;
  }
  if (v10 == 46)
    v12 = v6 + 1;
  else
    v12 = v6;
  if (v12 >= v4)
  {
    v13 = 0;
  }
  else
  {
    v13 = 0;
    while (1)
    {
      v10 = *v12;
      if ((v10 - 48) > 9 || v13 > 0x63)
        break;
      v13 = v10 - 48 + 10 * v13;
      if (++v12 >= v4)
      {
        v12 = &__s[v2];
        break;
      }
    }
    if (v13 > 0x63)
      return 0;
  }
  if (v10 == 46)
    ++v12;
  if (v12 >= v4)
  {
    v14 = 0;
  }
  else
  {
    v14 = 0;
    do
    {
      v15 = *v12 - 48;
      if (v15 > 9)
        break;
      if (v14 > 0x63)
        break;
      v14 = v15 + 10 * v14;
      ++v12;
    }
    while (v12 < v4);
    if (v14 > 0x63)
      return 0;
  }
  return 10000 * v8 + 100 * v13 + v14;
}

char *SourceVersionToCString(unsigned int a1, char *__str)
{
  if (a1 % 0x64)
  {
    snprintf(__str, 0x10uLL, "%u.%u.%u");
  }
  else if (a1 / 0x64 == 100 * ((42949673 * (unint64_t)(a1 / 0x64)) >> 32))
  {
    snprintf(__str, 0x10uLL, "%u");
  }
  else
  {
    snprintf(__str, 0x10uLL, "%u.%u");
  }
  return __str;
}

uint64_t HexToData(char *__s, int64_t a2, char a3, uint64_t a4, unint64_t a5, unint64_t *a6, _QWORD *a7, char **a8)
{
  char *v12;
  unsigned __int8 *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char v17;
  int v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  char v22;
  char *v23;
  int64_t v24;
  uint64_t v25;
  char *v27;
  char **v28;
  _QWORD *v29;
  int64_t v30;

  v12 = __s;
  if (a2 == -1)
    a2 = strlen(__s);
  v13 = (unsigned __int8 *)&v12[a2];
  v14 = MEMORY[0x1E0C80978];
  v30 = a2;
  v15 = v12;
  if (a2 >= 1)
  {
    do
    {
      v16 = *v15;
      if (*v15 < 0)
      {
        if (!__maskrune(v16, 0x4000uLL))
          break;
      }
      else if ((*(_DWORD *)(v14 + 4 * v16 + 60) & 0x4000) == 0)
      {
        break;
      }
      ++v15;
    }
    while (v15 < (char *)v13);
  }
  if (v13 - (unsigned __int8 *)v15 > 1 && *v15 == 48 && (v15[1] | 0x20) == 0x78)
    v15 += 2;
  if (v15 >= (char *)v13)
  {
    v20 = 0;
    v19 = 0;
    if (a4)
      goto LABEL_56;
    goto LABEL_59;
  }
  v28 = a8;
  v29 = a7;
  v27 = v12;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  while (1)
  {
    v21 = *v15;
    if (v13 - (unsigned __int8 *)v15 >= 2 && (a3 & 0x10) != 0 && !v18 && (_DWORD)v21 == 48)
    {
      if ((v15[1] | 0x20) == 0x78)
      {
        v18 = 0;
        ++v15;
        goto LABEL_31;
      }
      v22 = 0;
LABEL_30:
      v17 = 16 * v22;
      v18 = 1;
      goto LABEL_31;
    }
    v22 = v21 - 48;
    if ((v21 - 48) < 0xAu)
      goto LABEL_24;
    if ((v21 - 65) <= 5u)
    {
      v22 = v21 - 55;
LABEL_24:
      if (v18)
        goto LABEL_25;
      goto LABEL_30;
    }
    if ((v21 - 97) <= 5u)
    {
      v22 = v21 - 87;
      if (v18)
      {
LABEL_25:
        v17 |= v22;
        if (a4 && v20 < a5)
          *(_BYTE *)(a4 + v20++) = v17;
        v18 = 0;
        ++v19;
        goto LABEL_31;
      }
      goto LABEL_30;
    }
    if ((a3 & 2) == 0)
      goto LABEL_41;
    if ((v21 & 0x80) != 0)
      break;
    if ((*(_DWORD *)(v14 + 4 * v21 + 60) & 0x4000) == 0)
      goto LABEL_41;
LABEL_31:
    if (++v15 >= (char *)v13)
      goto LABEL_44;
  }
  if (__maskrune(*v15, 0x4000uLL))
    goto LABEL_31;
LABEL_41:
  if ((a3 & 4) != 0
    && (v21 - 44) <= 0x33
    && ((1 << (v21 - 44)) & 0x8000000004003) != 0)
  {
    goto LABEL_31;
  }
LABEL_44:
  if ((a3 & 8) != 0 || !v18)
  {
    v12 = v27;
    a8 = v28;
    a7 = v29;
    if (a4)
      goto LABEL_56;
  }
  else
  {
    if (a4)
    {
      a7 = v29;
      if (v20 < a5)
        *(_BYTE *)(a4 + v20++) = v17;
      v12 = v27;
      a8 = v28;
    }
    else
    {
      v12 = v27;
      a8 = v28;
      a7 = v29;
    }
    ++v19;
    if (a4)
    {
LABEL_56:
      if ((a3 & 1) != 0 && a5 > v20)
        bzero((void *)(a4 + v20), a5 - v20);
    }
  }
LABEL_59:
  if (a6)
    *a6 = v20;
  if (a7)
    *a7 = v19;
  if (a8)
    *a8 = v15;
  if (v15 < (char *)v13)
  {
    v23 = &v12[v30];
    v24 = &v12[v30] - v15;
    do
    {
      v25 = *v15;
      if (*v15 < 0)
      {
        if (!__maskrune(v25, 0x4000uLL))
          goto LABEL_73;
      }
      else if ((*(_DWORD *)(v14 + 4 * v25 + 60) & 0x4000) == 0)
      {
        goto LABEL_73;
      }
      ++v15;
      --v24;
    }
    while (v24);
    v15 = v23;
  }
LABEL_73:
  if (v15 == (char *)v13)
    return 0;
  if ((*(_DWORD *)(v14 + 4 * *v15 + 60) & 0x10000) != 0)
  {
    if (a5 <= v20)
      return 4294960545;
    else
      return 4294960579;
  }
  else if (v19)
  {
    return 0;
  }
  else
  {
    return 4294960554;
  }
}

uint64_t HexToDataCopy(char *a1, int64_t a2, char a3, _QWORD *a4, unint64_t *a5, char **a6)
{
  _BYTE *v12;
  _BYTE *v13;
  uint64_t result;
  unint64_t v15;

  v15 = 0;
  HexToData(a1, a2, a3, 0, 0, 0, &v15, 0);
  v12 = malloc_type_malloc(v15 + 1, 0x51D7576AuLL);
  if (!v12)
    return 4294960568;
  v13 = v12;
  HexToData(a1, a2, a3, (uint64_t)v12, v15, a5, 0, a6);
  result = 0;
  v13[v15] = 0;
  *a4 = v13;
  return result;
}

_BYTE *DataToHexCStringEx(unsigned __int8 *a1, uint64_t a2, _BYTE *a3, uint64_t a4)
{
  _BYTE *v4;
  unsigned __int8 *v5;
  _BYTE *v6;
  unsigned int v7;

  v4 = a3;
  if (a2 >= 1)
  {
    v5 = &a1[a2];
    v6 = a3;
    do
    {
      v7 = *a1++;
      *v6 = *(_BYTE *)(a4 + ((unint64_t)v7 >> 4));
      v4 = v6 + 2;
      v6[1] = *(_BYTE *)(a4 + (v7 & 0xF));
      v6 += 2;
    }
    while (a1 < v5);
  }
  *v4 = 0;
  return a3;
}

char *UUIDtoCString(_BYTE *a1, int a2, char *__str)
{
  return UUIDtoCStringFlags(a1, 16, 0, a2 != 0, __str, 0);
}

char *UUIDtoCStringEx(_BYTE *a1, uint64_t a2, int a3, __int128 *a4, char *a5)
{
  return UUIDtoCStringFlags(a1, a2, a4, a3 != 0, a5, 0);
}

uint64_t StringToUUID(char *a1, size_t a2, int a3, _OWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return StringToUUIDEx(a1, a2, a3, 0, a4, a6, a7, a8);
}

uint64_t memicmp(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  unsigned __int8 *v4;
  unint64_t v5;
  __darwin_ct_rune_t v6;
  __darwin_ct_rune_t v7;
  __darwin_ct_rune_t v8;

  v4 = a1;
  v5 = (unint64_t)&a1[a3];
  while (1)
  {
    if ((unint64_t)v4 >= v5)
      return 0;
    v6 = *a2;
    v7 = __tolower(*v4);
    v8 = __tolower(v6);
    if (v7 < v8)
      break;
    ++a2;
    ++v4;
    if (v7 > v8)
      return 1;
  }
  return 0xFFFFFFFFLL;
}

uint64_t snprintf_add(char **a1, char *a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char *v9;
  size_t v10;
  uint64_t result;
  char *v14;

  v9 = *a1;
  v10 = a2 - *a1;
  if (a2 == *a1)
    return 4294960533;
  result = vsnprintf(*a1, v10, a3, &a9);
  if ((result & 0x80000000) == 0)
  {
    v14 = &v9[result];
    if ((int)result < (int)v10)
    {
      result = 0;
    }
    else
    {
      v14 = a2;
      result = 4294960545;
    }
    *a1 = v14;
  }
  return result;
}

uint64_t strcmp_prefix(unsigned __int8 *a1, _BYTE *a2)
{
  unsigned int v2;
  unsigned __int8 *v3;
  unsigned int v4;
  unsigned int v5;

  v2 = *a2;
  if (!*a2)
    return 0;
  v3 = a2 + 1;
  while (1)
  {
    v4 = *a1;
    if (v4 < v2)
      return 0xFFFFFFFFLL;
    if (v4 > v2)
      break;
    ++a1;
    v5 = *v3++;
    v2 = v5;
    if (!v5)
      return 0;
  }
  return 1;
}

uint64_t stricmp_prefix(unsigned __int8 *a1, unsigned __int8 *a2)
{
  __darwin_ct_rune_t v4;
  uint64_t result;

  while (1)
  {
    v4 = __tolower(*a1);
    result = __tolower(*a2);
    if (!(_DWORD)result)
      break;
    if (v4 < (int)result)
      return 0xFFFFFFFFLL;
    if (v4 > (int)result)
      return 1;
    ++a1;
    ++a2;
  }
  return result;
}

uint64_t strncmp_prefix(unsigned __int8 *a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v3;
  unsigned __int8 *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;

  v3 = a2;
  v4 = a3;
  while (v3)
  {
    v6 = *v4++;
    v5 = v6;
    if (!v6)
      return 0;
    v8 = *a1++;
    v7 = v8;
    if (v8 < v5)
      return 0xFFFFFFFFLL;
    --v3;
    if (v7 > v5)
      return 1;
  }
  if (a3[a2])
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t strnicmp_prefix(unsigned __int8 *a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v4;
  __darwin_ct_rune_t v6;
  uint64_t result;

  if (a2)
  {
    v4 = a2;
    while (1)
    {
      v6 = __tolower(*a1);
      result = __tolower(*a3);
      if (!(_DWORD)result)
        break;
      --v4;
      if (v6 < (int)result)
        return 0xFFFFFFFFLL;
      if (v6 > (int)result)
        return 1;
      ++a1;
      ++a3;
      if (!v4)
        goto LABEL_8;
    }
  }
  else
  {
LABEL_8:
    if (*a3)
      return 0xFFFFFFFFLL;
    else
      return 0;
  }
  return result;
}

uint64_t strncmpx(unsigned __int8 *a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v3;
  unsigned __int8 *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  BOOL v9;

  v3 = a2;
  v4 = a3;
  while (v3)
  {
    v6 = *a1++;
    v5 = v6;
    v8 = *v4++;
    v7 = v8;
    v9 = v5 > v8;
    if (v5 < v8)
      return 0xFFFFFFFFLL;
    if (v9)
      return 1;
    --v3;
    if (!v7)
      return 0;
  }
  if (a3[a2])
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t strnicmp_suffix(uint64_t a1, unint64_t a2, char *__s)
{
  unint64_t v5;
  size_t v6;

  v5 = 0;
  if (a2)
  {
    while (*(_BYTE *)(a1 + v5))
    {
      if (a2 == ++v5)
      {
        v5 = a2;
        break;
      }
    }
  }
  v6 = strlen(__s);
  if (v5 >= v6)
    return strnicmpx((unsigned __int8 *)(a1 + v5 - v6), v6, __s);
  else
    return 0xFFFFFFFFLL;
}

_BYTE *stristr(_BYTE *a1, _BYTE *a2)
{
  __darwin_ct_rune_t v4;
  uint64_t v5;
  __darwin_ct_rune_t v6;
  __darwin_ct_rune_t v7;
  BOOL v8;

  if (a2 && *a2)
  {
    v4 = __tolower(*a2);
    while (*a1)
    {
      if (__tolower(*a1) == v4)
      {
        v5 = 1;
        do
        {
          v6 = __tolower(a1[v5]);
          v7 = __tolower(a2[v5++]);
          if (v6)
            v8 = v6 == v7;
          else
            v8 = 0;
        }
        while (v8);
        if (!v7)
          return a1;
      }
      ++a1;
    }
    return 0;
  }
  return a1;
}

const char *strncasestr(const char *a1, unsigned __int8 *a2, uint64_t a3)
{
  const char *v5;
  __darwin_ct_rune_t v6;
  size_t v7;
  size_t i;
  __darwin_ct_rune_t v9;

  v5 = (const char *)(a2 + 1);
  v6 = __tolower(*a2) << 24;
  if (v6)
  {
    v7 = strlen(v5);
    for (i = a3 - 1; i != -1; --i)
    {
      v9 = __tolower(*(unsigned __int8 *)a1) << 24;
      if (!v9)
        break;
      if (v9 == v6)
      {
        if (v7 > i)
          return 0;
        if (!strncasecmp(a1 + 1, v5, v7))
          return a1;
      }
      ++a1;
    }
    return 0;
  }
  return a1;
}

unint64_t memrchr(unint64_t a1, int a2, uint64_t a3)
{
  unint64_t result;
  int v5;

  result = a1 + a3;
  while (result > a1)
  {
    v5 = *(unsigned __int8 *)--result;
    if (v5 == a2)
      return result;
  }
  return 0;
}

uint64_t memrlen(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  while (a2)
  {
    v2 = a2 - 1;
    if (*(unsigned __int8 *)(a1 - 1 + a2--))
      return v2 + 1;
  }
  return 0;
}

char *CUTrimText(char *a1, char *a2, char **a3)
{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;

  v4 = a2;
  v5 = a1;
  v6 = MEMORY[0x1E0C80978];
  if (a1 < a2)
  {
    v7 = a2 - a1;
    while (1)
    {
      v8 = *v5;
      if (*v5 < 0)
      {
        if (!__maskrune(v8, 0x4000uLL))
          break;
      }
      else if ((*(_DWORD *)(v6 + 4 * v8 + 60) & 0x4000) == 0)
      {
        break;
      }
      ++v5;
      if (!--v7)
      {
        v5 = v4;
        break;
      }
    }
  }
  while (1)
  {
    v9 = v4;
    if (v5 >= v4)
      break;
    --v4;
    v10 = *(v9 - 1);
    if (*(v9 - 1) < 0)
    {
      if (!__maskrune(v10, 0x4000uLL))
        break;
    }
    else if ((*(_DWORD *)(v6 + 4 * v10 + 60) & 0x4000) == 0)
    {
      break;
    }
  }
  *a3 = v9;
  return v5;
}

uint64_t TruncatedUTF8Length(char *__s, size_t a2, unint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  char v7;
  unsigned int v8;
  unsigned int v9;
  char v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v14;

  if (a2 == -1)
    a2 = strlen(__s);
  if (a2 >= a3)
    result = a3;
  else
    result = a2;
  if (result)
  {
    do
    {
      v6 = result - 1;
      if ((__s[result - 1] & 0x80000000) == 0)
        return result;
      v7 = 0;
      v8 = __s[result - 1];
      v9 = 1;
      if (result == 1 || v8 > 0xBF)
      {
        LOBYTE(v14) = 0;
      }
      else
      {
        v10 = 0;
        v11 = result - 2;
        while (1)
        {
          v7 = v8;
          v12 = v9;
          if ((__s[v11] & 0x80000000) == 0)
            break;
          v8 = __s[v11];
          ++v9;
          if (v11-- != 0)
          {
            v10 = v7;
            if (v8 < 0xC0)
              continue;
          }
          v6 = v11 + 1;
          v14 = v12;
          goto LABEL_18;
        }
        v14 = v9 - 1;
        v6 = v11 + 1;
        v7 = v10;
LABEL_18:
        if (v14 >= 6)
          goto LABEL_22;
      }
      if ((((255 << (v14 ^ 7)) | (1 << (6 - v14))) & v8) == (255 << (v14 ^ 7))
        && (v8 != 237 || (v7 & 0xF0) != 0xA0))
      {
        return v6 + v9;
      }
LABEL_22:
      result = v6;
    }
    while (v6);
  }
  return result;
}

const char *GetLastFilePathSegment(const char *__s, uint64_t a2, size_t *a3)
{
  const char *v4;
  unint64_t v5;
  int v6;
  const char *i;
  size_t v8;

  v4 = __s;
  if (a2 == -1)
  {
    for (i = __s + 1; ; ++i)
    {
      if (*(i - 1) == 47)
      {
        v4 = i;
      }
      else if (!*(i - 1))
      {
        if (a3)
        {
          v8 = strlen(v4);
          __s = v4;
          goto LABEL_18;
        }
        return v4;
      }
    }
  }
  v5 = (unint64_t)&__s[a2];
  if (a2 < 1)
  {
    if (!a3)
      return __s;
  }
  else
  {
    do
    {
      v6 = *(unsigned __int8 *)v4++;
      if (v6 == 47)
        __s = v4;
    }
    while ((unint64_t)v4 < v5);
    if (!a3)
      return __s;
  }
  v8 = v5 - (_QWORD)__s;
LABEL_18:
  *a3 = v8;
  return __s;
}

uint64_t LevenshteinDistance(char *__s, uint64_t a2, char *a3, size_t a4, int a5, int a6, uint64_t a7, int a8, int *a9)
{
  int v12;
  int *v14;
  size_t v15;
  _DWORD *v16;
  _DWORD *v17;
  _DWORD *v18;
  _DWORD *v19;
  _DWORD *v20;
  int v21;
  uint64_t v22;
  _DWORD *v23;
  uint64_t v24;
  uint64_t v25;
  _DWORD *v26;
  int *v27;
  uint64_t v28;
  int v29;
  __darwin_ct_rune_t v30;
  __darwin_ct_rune_t v31;
  int v32;
  int v33;
  __darwin_ct_rune_t v34;
  __darwin_ct_rune_t v35;
  uint64_t v36;
  int v37;
  int v38;
  int v39;
  int v40;
  _DWORD *v41;
  uint64_t v42;
  int v43;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  _DWORD *v50;
  _DWORD *v51;
  _DWORD *v52;
  uint64_t v53;

  v12 = a2;
  if (a2 == -1)
    v12 = strlen(__s);
  v14 = a9;
  if (a4 == -1)
    a4 = strlen(a3);
  v15 = (uint64_t)((a4 << 32) + 0x100000000) >> 30;
  v16 = malloc_type_malloc(v15, 0x100004052888210uLL);
  if (!v16)
  {
    v42 = 0x7FFFFFFFLL;
    v43 = -6728;
    if (!a9)
      return v42;
    goto LABEL_34;
  }
  v17 = v16;
  v18 = malloc_type_malloc(v15, 0x100004052888210uLL);
  if (v18)
  {
    v19 = v18;
    v20 = malloc_type_malloc(v15, 0x100004052888210uLL);
    if (v20)
    {
      if ((a4 & 0x80000000) == 0)
      {
        v21 = 0;
        v22 = (a4 + 1);
        v23 = v19;
        do
        {
          *v23++ = v21;
          v21 += a7;
          --v22;
        }
        while (v22);
      }
      v45 = a4 << 32;
      if (v12 < 1)
      {
        v41 = v20;
      }
      else
      {
        v24 = 0;
        v46 = v12;
        v47 = a4;
        v53 = a4;
        do
        {
          v51 = v19;
          v52 = v17;
          v48 = v24 + 1;
          v50 = v20;
          *v20 = (v24 + 1) * a8;
          if ((int)a4 >= 1)
          {
            v25 = 0;
            v26 = v19 + 1;
            v27 = v20 + 1;
            do
            {
              v28 = a7;
              v29 = *(v26 - 1);
              v30 = __tolower(__s[v24]);
              v31 = __tolower(a3[v25]);
              v32 = a6;
              if (v30 == v31)
                v32 = 0;
              v33 = v32 + v29;
              *v27 = v33;
              if (v24)
              {
                if (v25)
                {
                  v34 = __tolower(__s[(v24 - 1)]);
                  if (v34 == __tolower(a3[v25]))
                  {
                    v35 = __tolower(__s[v24]);
                    v36 = (v25 - 1);
                    if (v35 == __tolower(a3[v36]))
                    {
                      v37 = v52[v36] + a5;
                      if (v33 > v37)
                        *v27 = v37;
                    }
                  }
                }
              }
              v38 = *v27;
              v39 = *v26 + a8;
              if (*v27 > v39)
              {
                *v27 = v39;
                v38 = v39;
              }
              a7 = v28;
              v40 = *(v27 - 1) + v28;
              if (v38 > v40)
                *v27 = v40;
              ++v25;
              ++v26;
              ++v27;
            }
            while (v53 != v25);
          }
          LODWORD(a4) = v47;
          ++v24;
          v17 = v51;
          v41 = v52;
          v20 = v52;
          v19 = v50;
        }
        while (v48 != v46);
      }
      v42 = *(unsigned int *)((char *)v19 + (v45 >> 30));
      free(v17);
      v43 = 0;
      v17 = v19;
      v19 = v41;
      v14 = a9;
    }
    else
    {
      v42 = 0x7FFFFFFFLL;
      v43 = -6728;
    }
    free(v17);
    v17 = v19;
  }
  else
  {
    v42 = 0x7FFFFFFFLL;
    v43 = -6728;
  }
  free(v17);
  if (v14)
LABEL_34:
    *v14 = v43;
  return v42;
}

uint64_t MapStringToValue(char *__s1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  const char **v11;
  const char *v12;
  unsigned int *v13;
  uint64_t v14;
  const char **v16;
  unsigned int *v17;

  v16 = (const char **)&a9;
  while (1)
  {
    v11 = v16;
    v17 = (unsigned int *)(v16 + 1);
    v12 = *v11;
    if (!*v11)
      break;
    v13 = v17;
    v16 = (const char **)(v17 + 2);
    v14 = *v13;
    if (!strcmp(__s1, v12))
      return v14;
  }
  return a2;
}

const char *MIMETypeToExtension(uint64_t a1)
{
  _QWORD *v1;
  _QWORD v3[2];

  v3[0] = a1;
  v3[1] = 0;
  v1 = bsearch(v3, kMIMEMap, 0x10uLL, 0x10uLL, (int (__cdecl *)(const void *, const void *))_MIMETypeMatch);
  if (v1)
    return (const char *)v1[1];
  else
    return "";
}

uint64_t _MIMETypeMatch(const char **a1, const char **a2)
{
  return strcasecmp(*a1, *a2);
}

uint64_t NMEAParse(uint64_t a1, char a2, char *__s, int64_t a4, char **a5)
{
  int64_t v6;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  int v16;
  char *v18;
  char *v19;
  int v20;
  unsigned __int8 v22;
  char *v23;
  char *v24;
  int v25;
  uint64_t result;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  unsigned int v30;
  char v31;
  char v32;
  char v33;
  unsigned int v34;
  unsigned int v35;
  char v36;
  char v37;
  const char *v38;
  char *v39;
  char *v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  int v102;
  char *v103;
  int64_t v104;
  char *v105;
  size_t v106;
  unint64_t v107;
  char v108;
  unint64_t v109;
  char v110;
  char v111;
  int v112;
  char v113;
  char v114;
  int v115;
  char *v116;
  int64_t v117;
  char *v118;
  size_t v119;
  unint64_t v120;
  char v121;
  unint64_t v122;
  char v123;
  char v124;
  char v125;
  int i;
  char *v127;
  int64_t v128;
  char *v129;
  size_t v130;
  char v131;
  char v132;
  int v133;
  int v134;
  char *v135;
  int64_t v136;
  char *v137;
  size_t v138;
  int v139;
  char *v140;
  int v141;
  int j;
  int64_t v143;
  char *v144;
  char *v145;
  char v146;
  int v147;
  uint64_t v148;
  int v149;
  int v150;

  v6 = a4;
  if (a4 == -1)
    v6 = strlen(__s);
  v10 = &__s[v6];
  *(_DWORD *)(a1 + 308) = 0;
  *(_OWORD *)(a1 + 244) = 0u;
  *(_OWORD *)(a1 + 228) = 0u;
  *(_OWORD *)(a1 + 212) = 0u;
  *(_OWORD *)(a1 + 196) = 0u;
  *(_OWORD *)(a1 + 180) = 0u;
  *(_OWORD *)(a1 + 164) = 0u;
  *(_OWORD *)(a1 + 148) = 0u;
  *(_OWORD *)(a1 + 132) = 0u;
  *(_OWORD *)(a1 + 116) = 0u;
  *(_OWORD *)(a1 + 100) = 0u;
  *(_OWORD *)(a1 + 84) = 0u;
  *(_OWORD *)(a1 + 68) = 0u;
  *(_OWORD *)(a1 + 52) = 0u;
  *(_OWORD *)(a1 + 36) = 0u;
  *(_OWORD *)(a1 + 4) = 0u;
  *(_OWORD *)(a1 + 20) = 0u;
  *(_OWORD *)(a1 + 276) = 0u;
  *(_OWORD *)(a1 + 292) = 0u;
  *(_OWORD *)(a1 + 260) = 0u;
  *(_DWORD *)a1 = a2 & 0x10;
  if ((a2 & 8) != 0)
  {
    v11 = __s;
    if (v6 >= 1)
    {
      v11 = __s;
      do
      {
        if (*v11 == 36)
          break;
        ++v11;
      }
      while (v11 < v10);
    }
  }
  else
  {
    v11 = __s;
    if (v6 >= 1)
    {
      v12 = MEMORY[0x1E0C80978];
      v11 = __s;
      do
      {
        v13 = *v11;
        if (*v11 < 0)
        {
          if (!__maskrune(v13, 0x4000uLL))
            break;
        }
        else if ((*(_DWORD *)(v12 + 4 * v13 + 60) & 0x4000) == 0)
        {
          break;
        }
        ++v11;
      }
      while (v11 < v10);
    }
  }
  if (v11 >= v10)
  {
    if (a5)
      *a5 = v11;
    return 4294960569;
  }
  if (*v11 == 36)
  {
    ++v11;
    *(_DWORD *)a1 |= 1u;
  }
  v14 = v11;
  if (v11 < v10)
  {
    v15 = (char *)(&__s[v6] - v11);
    v14 = v11;
    while (1)
    {
      v16 = *v14;
      if (v16 == 10 || v16 == 13)
        break;
      ++v14;
      if (!--v15)
      {
        v14 = &__s[v6];
        break;
      }
    }
  }
  if (a5)
  {
    v18 = v14;
    if (v14 < v10)
    {
      v19 = (char *)(&__s[v6] - v14);
      v18 = v14;
      while (1)
      {
        v20 = *v18;
        if (v20 != 13 && v20 != 10)
          break;
        ++v18;
        if (!--v19)
        {
          v18 = &__s[v6];
          break;
        }
      }
    }
    *a5 = v18;
  }
  if (v11 >= v14)
  {
LABEL_42:
    v24 = v14;
  }
  else
  {
    v22 = 0;
    v23 = v11;
    v24 = v11;
    while (1)
    {
      v25 = *v24;
      if (v25 == 42)
        break;
      v22 ^= v25;
      ++v24;
      if (v14 == ++v23)
        goto LABEL_42;
    }
    if (v14 - v24 >= 3)
    {
      v27 = v24[1];
      if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v27 + 60) & 0x10000) != 0)
      {
        v28 = v24[2];
        if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v28 + 60) & 0x10000) != 0)
        {
          v29 = v27 - 48;
          v30 = v27 - 65;
          if ((v27 - 97) >= 6)
            v31 = 0;
          else
            v31 = v27 - 87;
          v32 = v27 - 55;
          if (v30 > 5)
            v32 = v31;
          if (v29 < 0xA)
            v32 = v29;
          v33 = 16 * v32;
          v34 = v28 - 48;
          v35 = v28 - 65;
          if ((v28 - 97) >= 6)
            v36 = 0;
          else
            v36 = v28 - 87;
          v37 = v28 - 55;
          if (v35 > 5)
            v37 = v36;
          if (v34 < 0xA)
            v37 = v34;
          if ((v37 | v33) == v22)
            *(_DWORD *)a1 |= 2u;
        }
      }
    }
    v14 = v24;
  }
  if (v11 >= v24)
  {
    *(_BYTE *)(a1 + 4) = 0;
    v38 = (const char *)(a1 + 4);
    v39 = v11;
    goto LABEL_79;
  }
  if (*v11 == 44)
  {
    *(_BYTE *)(a1 + 4) = 0;
    v38 = (const char *)(a1 + 4);
    v39 = v11;
LABEL_77:
    if (*v39 == 44)
      ++v39;
    goto LABEL_79;
  }
  v40 = 0;
  while (&v14[~(unint64_t)v11] != v40)
  {
    v41 = (v40++)[(_QWORD)v11 + 1];
    if (v41 == 44)
    {
      v39 = &v40[(_QWORD)v11];
      goto LABEL_75;
    }
  }
  v39 = v14;
LABEL_75:
  if ((unint64_t)(v39 - v11) > 7)
    return 4294960540;
  v38 = (const char *)(a1 + 4);
  memcpy((void *)(a1 + 4), v11, v39 - v11);
  *(_BYTE *)(a1 + 4 + v39 - v11) = 0;
  if (v39 < v24)
    goto LABEL_77;
LABEL_79:
  if (!strcasecmp(v38, "GPGGA"))
  {
    v150 = 0;
    HIDWORD(v148) = 0;
    v149 = 0;
    v102 = 1;
    while (1)
    {
      v103 = v39;
      if (v39 >= v24)
      {
LABEL_97:
        v105 = v14;
        v39 = v24;
        if (v103 == v24)
        {
LABEL_233:
          result = 0;
          *(_DWORD *)a1 |= 4u;
          return result;
        }
      }
      else
      {
        v104 = v14 - v39;
        v105 = v39;
        while (*v105 != 44)
        {
          ++v105;
          if (!--v104)
            goto LABEL_97;
        }
        v39 = v105 + 1;
      }
      v106 = v105 - v103;
      switch(v102)
      {
        case 1:
          if ((int)SNScanF(v103, v106, "%2u%2u%lf", v42, v43, v44, v45, v46, (int)&v150) < 3)
            return 4294960554;
          *(double *)(a1 + 16) = (double)(3600 * v150 + 60 * v149) + 0.0;
          goto LABEL_123;
        case 2:
          if (SNScanF(v103, v106, "%2u%lf", v42, v43, v44, v45, v46, (int)&v148 + 4) != 2)
            return 4294960554;
          LODWORD(v107) = HIDWORD(v148);
          *(double *)(a1 + 24) = 0.0 / 60.0 + (double)v107;
          goto LABEL_123;
        case 3:
          if (v105 == v103)
            v108 = 63;
          else
            v108 = *v103;
          *(_BYTE *)(a1 + 32) = v108;
          goto LABEL_123;
        case 4:
          if (SNScanF(v103, v106, "%3u%lf", v42, v43, v44, v45, v46, (int)&v148 + 4) != 2)
            return 4294960554;
          LODWORD(v109) = HIDWORD(v148);
          *(double *)(a1 + 40) = 0.0 / 60.0 + (double)v109;
LABEL_123:
          ++v102;
          break;
        case 5:
          if (v105 == v103)
            v110 = 63;
          else
            v110 = *v103;
          *(_BYTE *)(a1 + 48) = v110;
          goto LABEL_123;
        case 6:
          if (v105 == v103)
            v111 = 63;
          else
            v111 = *v103;
          *(_BYTE *)(a1 + 49) = v111;
          goto LABEL_123;
        case 7:
          SNScanF(v103, v106, "%u", v42, v43, v44, v45, v46, a1 + 52);
          goto LABEL_123;
        case 8:
          SNScanF(v103, v106, "%lf", v42, v43, v44, v45, v46, a1 + 56);
          goto LABEL_123;
        case 9:
          v112 = a1 + 64;
          goto LABEL_122;
        case 10:
          if (v105 == v103)
            v113 = 63;
          else
            v113 = *v103;
          *(_BYTE *)(a1 + 72) = v113;
          goto LABEL_123;
        case 11:
          v112 = a1 + 80;
          goto LABEL_122;
        case 12:
          if (v105 == v103)
            v114 = 63;
          else
            v114 = *v103;
          *(_BYTE *)(a1 + 88) = v114;
          goto LABEL_123;
        case 13:
          v112 = a1 + 96;
LABEL_122:
          SNScanF(v103, v106, "%lf", v42, v43, v44, v45, v46, v112);
          goto LABEL_123;
        case 14:
          SNScanF(v103, v106, "%.s", v42, v43, v44, v45, v46, 8);
          goto LABEL_123;
        default:
          goto LABEL_123;
      }
    }
  }
  if (!strcasecmp(v38, "GPGLL"))
  {
    v115 = 1;
    v150 = 0;
    v149 = 0;
    v148 = 0;
    while (1)
    {
      v116 = v39;
      if (v39 >= v24)
      {
LABEL_140:
        v118 = v14;
        v39 = v24;
        if (v116 == v24)
          goto LABEL_233;
      }
      else
      {
        v117 = v14 - v39;
        v118 = v39;
        while (*v118 != 44)
        {
          ++v118;
          if (!--v117)
            goto LABEL_140;
        }
        v39 = v118 + 1;
      }
      v119 = v118 - v116;
      switch(v115)
      {
        case 1:
          if (SNScanF(v116, v119, "%2u%lf", v47, v48, v49, v50, v51, (int)&v148) != 2)
            return 4294960554;
          LODWORD(v120) = v148;
          *(double *)(a1 + 16) = 0.0 / 60.0 + (double)v120;
          break;
        case 2:
          if (v118 == v116)
            v121 = 63;
          else
            v121 = *v116;
          *(_BYTE *)(a1 + 24) = v121;
          break;
        case 3:
          if (SNScanF(v116, v119, "%3u%lf", v47, v48, v49, v50, v51, (int)&v148) != 2)
            return 4294960554;
          LODWORD(v122) = v148;
          *(double *)(a1 + 32) = 0.0 / 60.0 + (double)v122;
          break;
        case 4:
          if (v118 == v116)
            v123 = 63;
          else
            v123 = *v116;
          *(_BYTE *)(a1 + 40) = v123;
          break;
        case 5:
          if ((int)SNScanF(v116, v119, "%2u%2u%2u%lf", v47, v48, v49, v50, v51, (int)&v150) < 3)
            return 4294960554;
          *(double *)(a1 + 48) = (double)(3600 * v150 + 60 * v149 + HIDWORD(v148)) + 0.0;
          break;
        case 6:
          if (v118 == v116)
            v124 = 63;
          else
            v124 = *v116;
          *(_BYTE *)(a1 + 56) = v124;
          break;
        case 7:
          if (v118 == v116)
            v125 = 63;
          else
            v125 = *v116;
          *(_BYTE *)(a1 + 57) = v125;
          break;
        default:
          break;
      }
      ++v115;
    }
  }
  if (!strcasecmp(v38, "GPGSA"))
  {
    for (i = 1; ; ++i)
    {
      v127 = v39;
      if (v39 >= v24)
      {
LABEL_172:
        v129 = v14;
        v39 = v24;
        if (v127 == v24)
          goto LABEL_233;
      }
      else
      {
        v128 = v14 - v39;
        v129 = v39;
        while (*v129 != 44)
        {
          ++v129;
          if (!--v128)
            goto LABEL_172;
        }
        v39 = v129 + 1;
      }
      v130 = v129 - v127;
      if ((i - 3) >= 0xC)
      {
        if (i <= 14)
        {
          if (i == 1)
          {
            if (v129 == v127)
              v132 = 63;
            else
              v132 = *v127;
            *(_BYTE *)(a1 + 16) = v132;
          }
          else if (i == 2)
          {
            if (v129 == v127)
              v131 = 63;
            else
              v131 = *v127;
            *(_BYTE *)(a1 + 17) = v131;
          }
        }
        else
        {
          switch(i)
          {
            case 15:
              SNScanF(v127, v130, "%lf", v52, v53, v54, v55, v56, a1 + 72);
              break;
            case 16:
              SNScanF(v127, v130, "%lf", v52, v53, v54, v55, v56, a1 + 80);
              break;
            case 17:
              SNScanF(v127, v130, "%lf", v52, v53, v54, v55, v56, a1 + 88);
              break;
          }
        }
      }
      else
      {
        SNScanF(v127, v130, "%u", v52, v53, v54, v55, v56, a1 + 20 + 4 * (i - 3));
      }
    }
  }
  if (!strcasecmp(v38, "GPGSV"))
  {
    v133 = a1 + 32;
    v134 = 1;
    while (1)
    {
      v135 = v39;
      if (v39 >= v24)
      {
LABEL_200:
        v137 = v14;
        v39 = v24;
        if (v135 == v24)
          goto LABEL_233;
      }
      else
      {
        v136 = v14 - v39;
        v137 = v39;
        while (*v137 != 44)
        {
          ++v137;
          if (!--v136)
            goto LABEL_200;
        }
        v39 = v137 + 1;
      }
      v138 = v137 - v135;
      switch(v134)
      {
        case 1:
          v141 = a1 + 16;
          goto LABEL_215;
        case 2:
          v147 = a1 + 20;
          goto LABEL_216;
        case 3:
          v141 = a1 + 24;
LABEL_215:
          v147 = v141;
LABEL_216:
          v140 = "%d";
          goto LABEL_210;
        case 4:
        case 8:
        case 12:
        case 16:
          if (SNScanF(v135, v138, "%d", v57, v58, v59, v60, v61, v133 + 32 * ((v134 - 4) >> 2)) != 1)return 4294960554;
          ++*(_DWORD *)(a1 + 28);
          goto LABEL_211;
        case 5:
        case 9:
        case 13:
        case 17:
          v139 = v133 + 32 * ((v134 - 4) >> 2) + 8;
          goto LABEL_209;
        case 6:
        case 10:
        case 14:
        case 18:
          v139 = v133 + 32 * ((v134 - 4) >> 2) + 16;
          goto LABEL_209;
        case 7:
        case 11:
        case 15:
        case 19:
          v139 = v133 + 32 * ((v134 - 4) >> 2) + 24;
LABEL_209:
          v147 = v139;
          v140 = "%lf";
LABEL_210:
          if (SNScanF(v135, v138, (unsigned __int8 *)v140, v57, v58, v59, v60, v61, v147) == 1)
            goto LABEL_211;
          return 4294960554;
        default:
LABEL_211:
          ++v134;
          break;
      }
    }
  }
  if (!strcasecmp(v38, "GPHDT"))
  {
    for (j = 1; ; ++j)
    {
      if (v39 >= v24)
      {
LABEL_222:
        v144 = v14;
        v145 = v24;
        if (v39 == v24)
          goto LABEL_233;
      }
      else
      {
        v143 = v14 - v39;
        v144 = v39;
        while (*v144 != 44)
        {
          ++v144;
          if (!--v143)
            goto LABEL_222;
        }
        v145 = v144 + 1;
      }
      if (j == 2)
      {
        if (v144 == v39)
          v146 = 63;
        else
          v146 = *v39;
        *(_BYTE *)(a1 + 24) = v146;
      }
      else if (j == 1)
      {
        SNScanF(v39, v144 - v39, "%lf", v62, v63, v64, v65, v66, a1 + 16);
      }
      v39 = v145;
    }
  }
  if (!strcasecmp(v38, "GPRMC"))
    return _NMEAParseGPRMC(a1, v39, v24, v67, v68, v69, v70, v71);
  if (!strcasecmp(v38, "GPVTG"))
  {
    _NMEAParseGPVTG(a1, v39, v24, v72, v73, v74, v75, v76);
    return 0;
  }
  if (!strcasecmp(v38, "GPZDA"))
    return _NMEAParseGPZDA(a1, v39, v24, v77, v78, v79, v80, v81);
  if (!strcasecmp(v38, "OHPR"))
  {
    _NMEAParseOHPR(a1, v39, v24, v82, v83, v84, v85, v86);
    return 0;
  }
  if (!strcasecmp(v38, "PAACD"))
    return _NMEAParsePAACD(a1, v39, v24, v87, v88, v89, v90, v91);
  if (strcasecmp(v38, "PAGCD"))
  {
    if (!strcasecmp(v38, "PASCD"))
      return _NMEAParsePASCD(a1, v39, v24, v97, v98, v99, v100, v101);
    return 0;
  }
  return _NMEAParsePAGCD(a1, v39, v24, v92, v93, v94, v95, v96);
}

uint64_t _NMEAParseGPRMC(uint64_t a1, char *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v11;
  int v12;
  int v13;
  char *v14;
  uint64_t v15;
  char *v16;
  size_t v17;
  double v18;
  char v19;
  unint64_t v20;
  char v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  char v25;
  char v26;
  uint64_t result;
  int v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;

  v30 = 0;
  v31 = 0;
  v28 = a1 + 88;
  v11 = a1 + 72;
  v12 = a1 + 64;
  v13 = 1;
  v29 = 0;
  while (2)
  {
    v14 = a2;
    if (a2 >= a3)
    {
LABEL_6:
      if (a2 == a3)
      {
        result = 0;
        *(_DWORD *)a1 |= 4u;
        return result;
      }
      v31 = a2;
      v16 = a3;
      a2 = a3;
    }
    else
    {
      v15 = 0;
      while (1)
      {
        v16 = &a2[v15];
        if (a2[v15] == 44)
          break;
        if (a3 - a2 == ++v15)
          goto LABEL_6;
      }
      v31 = a2;
      a2 = v16 + 1;
    }
    v17 = v16 - v14;
    switch(v13)
    {
      case 1:
        if ((int)SNScanF(v14, v17, "%2u%2u%2u%lf", a4, a5, a6, a7, a8, (int)&v30 + 4) < 3)
          return 4294960554;
        v18 = (double)(3600 * HIDWORD(v30) + 60 * v30 + HIDWORD(v29)) + 0.0;
        *(double *)(a1 + 16) = v18;
        goto LABEL_26;
      case 2:
        if (v16 == v14)
          v19 = 63;
        else
          v19 = *v14;
        *(_BYTE *)(a1 + 24) = v19;
        goto LABEL_43;
      case 3:
        if (SNScanF(v14, v17, "%2u%lf", a4, a5, a6, a7, a8, (int)&v29) != 2)
          return 4294960554;
        LODWORD(v20) = v29;
        *(double *)(a1 + 32) = 0.0 / 60.0 + (double)v20;
        goto LABEL_43;
      case 4:
        if (v16 == v14)
          v21 = 63;
        else
          v21 = *v14;
        *(_BYTE *)(a1 + 40) = v21;
        goto LABEL_43;
      case 5:
        if (SNScanF(v14, v17, "%3u%lf", a4, a5, a6, a7, a8, (int)&v29) != 2)
          return 4294960554;
        LODWORD(v22) = v29;
        *(double *)(a1 + 48) = 0.0 / 60.0 + (double)v22;
        goto LABEL_43;
      case 6:
        if (v16 == v14)
          v23 = 63;
        else
          v23 = *v14;
        *(_BYTE *)(a1 + 56) = v23;
        goto LABEL_43;
      case 7:
        SNScanF(v14, v17, "%lf", a4, a5, a6, a7, a8, v12);
        goto LABEL_43;
      case 8:
        SNScanF(v14, v17, "%lf", a4, a5, a6, a7, a8, v11);
        goto LABEL_43;
      case 9:
        if (SNScanF(v14, v17, "%2u%2u%2u", a4, a5, a6, a7, a8, (int)&v29) == 3)
        {
          v24 = YMD_HMStoSeconds(2000, v30, v29, 0, 0, 0, 0);
          *(_DWORD *)(a1 + 80) = (int)v24 / 86400;
          v18 = (double)(v24 - 0xEB1E31100);
LABEL_26:
          *(double *)(a1 + 104) = *(double *)(a1 + 104) + v18;
LABEL_43:
          ++v13;
          continue;
        }
        return 4294960554;
      case 10:
        SNScanF(v14, v17, "%lf", a4, a5, a6, a7, a8, v28);
        goto LABEL_43;
      case 11:
        if (v16 == v14)
          v25 = 63;
        else
          v25 = *v14;
        *(_BYTE *)(a1 + 96) = v25;
        goto LABEL_43;
      case 12:
        if (v16 == v14)
          v26 = 63;
        else
          v26 = *v14;
        *(_BYTE *)(a1 + 97) = v26;
        goto LABEL_43;
      default:
        goto LABEL_43;
    }
  }
}

char *_NMEAParseGPVTG(uint64_t a1, char *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v11;
  int v12;
  int v13;
  int v14;
  int i;
  char *result;
  int64_t v17;
  char *v18;
  size_t v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;

  v11 = a1 + 64;
  v12 = a1 + 48;
  v13 = a1 + 16;
  v14 = a1 + 32;
  for (i = 1; ; ++i)
  {
    result = a2;
    if (a2 >= a3)
      break;
    v17 = a3 - a2;
    v18 = a2;
    while (*v18 != 44)
    {
      ++v18;
      if (!--v17)
        goto LABEL_6;
    }
    a2 = v18 + 1;
LABEL_9:
    v19 = v18 - result;
    switch(i)
    {
      case 1:
        SNScanF(result, v19, "%lf", a4, a5, a6, a7, a8, v13);
        break;
      case 2:
        if (v18 == result)
          v20 = 63;
        else
          v20 = *result;
        *(_BYTE *)(a1 + 24) = v20;
        break;
      case 3:
        SNScanF(result, v19, "%lf", a4, a5, a6, a7, a8, v14);
        break;
      case 4:
        if (v18 == result)
          v21 = 63;
        else
          v21 = *result;
        *(_BYTE *)(a1 + 40) = v21;
        break;
      case 5:
        SNScanF(result, v19, "%lf", a4, a5, a6, a7, a8, v12);
        break;
      case 6:
        if (v18 == result)
          v22 = 63;
        else
          v22 = *result;
        *(_BYTE *)(a1 + 56) = v22;
        break;
      case 7:
        SNScanF(result, v19, "%lf", a4, a5, a6, a7, a8, v11);
        break;
      case 8:
        if (v18 == result)
          v23 = 63;
        else
          v23 = *result;
        *(_BYTE *)(a1 + 72) = v23;
        break;
      case 9:
        if (v18 == result)
          v24 = 63;
        else
          v24 = *result;
        *(_BYTE *)(a1 + 73) = v24;
        break;
      default:
        continue;
    }
  }
LABEL_6:
  v18 = a3;
  a2 = a3;
  if (result != a3)
    goto LABEL_9;
  *(_DWORD *)a1 |= 4u;
  return result;
}

uint64_t _NMEAParseGPZDA(uint64_t a1, char *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _DWORD *v11;
  _DWORD *v12;
  int v13;
  char *v14;
  int64_t v15;
  char *v16;
  size_t v17;
  int v18;
  uint64_t v19;
  uint64_t result;
  int v21;
  int v22;
  int v23;
  int v24;

  v23 = a1 + 16;
  v24 = a1 + 48;
  v21 = a1 + 40;
  v22 = a1 + 44;
  v11 = (_DWORD *)(a1 + 36);
  v12 = (_DWORD *)(a1 + 32);
  v13 = 1;
  while (1)
  {
    v14 = a2;
    if (a2 >= a3)
      break;
    v15 = a3 - a2;
    v16 = a2;
    while (*v16 != 44)
    {
      ++v16;
      if (!--v15)
        goto LABEL_6;
    }
    a2 = v16 + 1;
LABEL_9:
    v17 = v16 - v14;
    switch(v13)
    {
      case 1:
        if (SNScanF(v14, v17, "%2u%2u%lf", a4, a5, a6, a7, a8, v23) == 3)
          goto LABEL_20;
        return 4294960554;
      case 2:
        SNScanF(v14, v17, "%u", a4, a5, a6, a7, a8, (int)v12);
        if (*v12 >= 0x20u)
          return 4294960554;
        goto LABEL_20;
      case 3:
        SNScanF(v14, v17, "%u", a4, a5, a6, a7, a8, (int)v11);
        if (*v11 < 0xDu)
          goto LABEL_20;
        return 4294960554;
      case 4:
        SNScanF(v14, v17, "%u", a4, a5, a6, a7, a8, v21);
        goto LABEL_20;
      case 5:
        v18 = v22;
        goto LABEL_19;
      case 6:
        v18 = v24;
LABEL_19:
        SNScanF(v14, v17, "%d", a4, a5, a6, a7, a8, v18);
        goto LABEL_20;
      default:
LABEL_20:
        ++v13;
        break;
    }
  }
LABEL_6:
  v16 = a3;
  a2 = a3;
  if (v14 != a3)
    goto LABEL_9;
  v19 = YMD_HMStoSeconds(*(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 36), *(_DWORD *)(a1 + 32), *(_DWORD *)(a1 + 16), *(_DWORD *)(a1 + 20), 0, 730486);
  result = 0;
  *(double *)(a1 + 56) = *(double *)(a1 + 24)
                       + (double)v19
                       + (double)(3600 * *(_DWORD *)(a1 + 44))
                       + (double)(60 * *(_DWORD *)(a1 + 48));
  *(_DWORD *)a1 |= 4u;
  return result;
}

uint64_t _NMEAParseOHPR(uint64_t result, char *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int64_t v16;
  char *v17;
  char *v18;
  int v19;
  _DWORD *v20;

  v10 = result + 48;
  v11 = result + 16;
  v12 = result + 40;
  v13 = result + 32;
  v20 = (_DWORD *)result;
  v14 = result + 24;
  v15 = 1;
  while (a2 < a3)
  {
    v16 = a3 - a2;
    v17 = a2;
    while (*v17 != 44)
    {
      ++v17;
      if (!--v16)
        goto LABEL_6;
    }
    v18 = v17 + 1;
LABEL_9:
    v19 = v11;
    switch(v15)
    {
      case 1:
        goto LABEL_14;
      case 2:
        v19 = v14;
        goto LABEL_14;
      case 3:
        v19 = v13;
        goto LABEL_14;
      case 4:
        v19 = v12;
        goto LABEL_14;
      case 5:
        v19 = v10;
LABEL_14:
        result = SNScanF(a2, v17 - a2, "%lf", a4, a5, a6, a7, a8, v19);
        break;
      default:
        break;
    }
    ++v15;
    a2 = v18;
  }
LABEL_6:
  v17 = a3;
  v18 = a3;
  if (a2 != a3)
    goto LABEL_9;
  *v20 |= 4u;
  return result;
}

uint64_t _NMEAParsePAACD(uint64_t a1, char *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v11;
  int i;
  char *v13;
  int64_t v14;
  char *v15;
  size_t v16;
  int v17;
  int v18;
  uint64_t v19;
  char *v20;
  int v21;
  char *v22;
  char *v23;
  uint64_t result;
  int v25;
  void *__src;
  int v27;
  int v28;

  v11 = a1 + 32;
  v27 = a1 + 24;
  v28 = a1 + 16;
  v25 = a1 + 32;
  __src = (void *)(a1 + 48);
  for (i = 1; ; ++i)
  {
    v13 = a2;
    if (a2 >= a3)
    {
LABEL_6:
      v15 = a3;
      a2 = a3;
      if (v13 == a3)
      {
        result = 0;
        *(_DWORD *)a1 |= 4u;
        return result;
      }
    }
    else
    {
      v14 = a3 - a2;
      v15 = a2;
      while (*v15 != 44)
      {
        ++v15;
        if (!--v14)
          goto LABEL_6;
      }
      a2 = v15 + 1;
    }
    v16 = v15 - v13;
    if (i == 3)
    {
      SNScanF(v13, v15 - v13, "%u", a4, a5, a6, a7, a8, v11);
      continue;
    }
    if (i == 2)
    {
      v18 = v27;
      goto LABEL_15;
    }
    v17 = i - 1;
    if (i == 1)
    {
      v18 = v28;
LABEL_15:
      SNScanF(v13, v16, "%lf", a4, a5, a6, a7, a8, v18);
      continue;
    }
    if (i >= 4)
      v17 = i - 4;
    v19 = (uint64_t)v17 >> 2;
    if ((v17 >> 2) >= 8)
      break;
    LODWORD(v20) = (_DWORD)__src;
    *(_QWORD *)(a1 + 40) = __src;
LABEL_24:
    v21 = i - 4 - 4 * v19;
    if (v21 == 2)
    {
      SNScanF(v13, v16, "%lf", a4, a5, a6, a7, a8, (_DWORD)v20 + 32 * v19 + 16);
    }
    else
    {
      if (v21 == 1)
      {
        SNScanF(v13, v16, "%lf", a4, a5, a6, a7, a8, (_DWORD)v20 + 32 * v19 + 8);
      }
      else if (!v21)
      {
        SNScanF(v13, v16, "%lf", a4, a5, a6, a7, a8, (_DWORD)v20 + 32 * v19);
        ++*(_DWORD *)(a1 + 36);
      }
      SNScanF(v13, v16, "%lf", a4, a5, a6, a7, a8, (_DWORD)v20 + 32 * v19 + 24);
    }
LABEL_16:
    ;
  }
  if ((*(_BYTE *)a1 & 0x10) == 0)
    goto LABEL_16;
  if (v19 < *(_DWORD *)(a1 + 36))
  {
    v20 = *(char **)(a1 + 40);
    goto LABEL_24;
  }
  v16 = 32 * v19 + 32;
  v22 = (char *)malloc_type_realloc(*(void **)(a1 + 304), v16, 0xD3EF6359uLL);
  if (v22)
  {
    v20 = v22;
    if (!*(_QWORD *)(a1 + 304))
      memcpy(v22, __src, 32 * v19);
    v23 = &v20[32 * v19];
    *(_OWORD *)v23 = 0u;
    *((_OWORD *)v23 + 1) = 0u;
    *(_QWORD *)(a1 + 304) = v20;
    *(_QWORD *)(a1 + 40) = v20;
    v11 = v25;
    goto LABEL_24;
  }
  return 4294960568;
}

uint64_t _NMEAParsePAGCD(uint64_t a1, char *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v11;
  int v12;
  char *v13;
  int64_t v14;
  char *v15;
  size_t v16;
  char *v17;
  size_t v18;
  char *v19;
  int v20;
  uint64_t v21;
  char *v22;
  int v23;
  char *v24;
  char *v25;
  uint64_t result;
  int v27;
  int v28;
  void *__src;
  int v30;

  v11 = a1 + 24;
  __src = (void *)(a1 + 40);
  v30 = a1 + 16;
  v12 = 1;
  v28 = a1 + 24;
  while (1)
  {
    v13 = a2;
    if (a2 >= a3)
    {
LABEL_6:
      v15 = a3;
      a2 = a3;
      if (v13 == a3)
      {
        result = 0;
        *(_DWORD *)a1 |= 4u;
        return result;
      }
    }
    else
    {
      v14 = a3 - a2;
      v15 = a2;
      while (*v15 != 44)
      {
        ++v15;
        if (!--v14)
          goto LABEL_6;
      }
      a2 = v15 + 1;
    }
    v16 = v15 - v13;
    if (v12 == 2)
    {
      v27 = v11;
      v17 = v13;
      v18 = v15 - v13;
      v19 = "%u";
      goto LABEL_14;
    }
    if (v12 == 1)
    {
      v27 = v30;
      v17 = v13;
      v18 = v15 - v13;
LABEL_12:
      v19 = "%lf";
LABEL_14:
      SNScanF(v17, v18, (unsigned __int8 *)v19, a4, a5, a6, a7, a8, v27);
      goto LABEL_30;
    }
    if (v12 >= 3)
      v20 = v12 - 3;
    else
      v20 = v12;
    v21 = (uint64_t)v20 >> 2;
    if ((v20 >> 2) < 8)
    {
      LODWORD(v22) = (_DWORD)__src;
      *(_QWORD *)(a1 + 32) = __src;
      goto LABEL_23;
    }
    if ((*(_BYTE *)a1 & 0x10) == 0)
      goto LABEL_30;
    if (v21 >= *(_DWORD *)(a1 + 28))
      break;
    v22 = *(char **)(a1 + 32);
LABEL_23:
    v23 = v12 - 3 - 4 * v21;
    switch(v23)
    {
      case 2:
        v27 = (_DWORD)v22 + 32 * v21 + 16;
        v17 = v13;
        v18 = v16;
        goto LABEL_12;
      case 1:
        SNScanF(v13, v16, "%lf", a4, a5, a6, a7, a8, (_DWORD)v22 + 32 * v21 + 8);
        break;
      case 0:
        SNScanF(v13, v16, "%lf", a4, a5, a6, a7, a8, (_DWORD)v22 + 32 * v21);
        ++*(_DWORD *)(a1 + 28);
        break;
    }
    SNScanF(v13, v16, "%lf", a4, a5, a6, a7, a8, (_DWORD)v22 + 32 * v21 + 24);
LABEL_30:
    ++v12;
  }
  v16 = 32 * v21 + 32;
  v24 = (char *)malloc_type_realloc(*(void **)(a1 + 296), v16, 0x284F6767uLL);
  if (v24)
  {
    v22 = v24;
    if (!*(_QWORD *)(a1 + 296))
      memcpy(v24, __src, 32 * v21);
    v25 = &v22[32 * v21];
    *(_OWORD *)v25 = 0u;
    *((_OWORD *)v25 + 1) = 0u;
    *(_QWORD *)(a1 + 296) = v22;
    *(_QWORD *)(a1 + 32) = v22;
    v11 = v28;
    goto LABEL_23;
  }
  return 4294960568;
}

uint64_t _NMEAParsePASCD(uint64_t a1, char *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v11;
  int v12;
  char *v13;
  int64_t v14;
  char *v15;
  size_t v16;
  char *v17;
  size_t v18;
  int v19;
  uint64_t v20;
  char *v21;
  char v22;
  char v23;
  char *v24;
  char *v25;
  char *v26;
  uint64_t result;
  int v28;
  void *__src;
  int v30;
  int v31;

  v11 = a1 + 32;
  v30 = a1 + 28;
  v31 = a1 + 16;
  __src = (void *)(a1 + 48);
  v12 = 1;
  while (2)
  {
    v13 = a2;
    if (a2 >= a3)
    {
LABEL_6:
      v15 = a3;
      a2 = a3;
      if (v13 == a3)
      {
        result = 0;
        *(_DWORD *)a1 |= 4u;
        return result;
      }
    }
    else
    {
      v14 = a3 - a2;
      v15 = a2;
      while (*v15 != 44)
      {
        ++v15;
        if (!--v14)
          goto LABEL_6;
      }
      a2 = v15 + 1;
    }
    v16 = v15 - v13;
    switch(v12)
    {
      case 1:
        v28 = v31;
        v17 = v13;
        v18 = v15 - v13;
        goto LABEL_32;
      case 2:
        if (v16)
          v22 = *v13;
        else
          v22 = 63;
        *(_BYTE *)(a1 + 24) = v22;
        goto LABEL_34;
      case 3:
        if (v16)
          v23 = *v13;
        else
          v23 = 63;
        *(_BYTE *)(a1 + 25) = v23;
        goto LABEL_34;
      case 4:
        v28 = v30;
        goto LABEL_23;
      case 5:
        v28 = v11;
LABEL_23:
        v17 = v13;
        v18 = v15 - v13;
        v24 = "%u";
        goto LABEL_33;
      default:
        v19 = v12 - 6;
        if (v12 < 6)
          v19 = v12 - 5;
        v20 = (uint64_t)v19 >> 1;
        if ((v19 >> 1) < 8)
        {
          LODWORD(v21) = (_DWORD)__src;
          *(_QWORD *)(a1 + 40) = __src;
          goto LABEL_25;
        }
        if ((*(_BYTE *)a1 & 0x10) == 0)
          goto LABEL_34;
        if (v20 < *(_DWORD *)(a1 + 36))
        {
          v21 = *(char **)(a1 + 40);
          goto LABEL_25;
        }
        v16 = 16 * v20 + 16;
        v25 = (char *)malloc_type_realloc(*(void **)(a1 + 176), v16, 0xE8A9F4FDuLL);
        if (v25)
        {
          v21 = v25;
          if (!*(_QWORD *)(a1 + 176))
            memcpy(v25, __src, 16 * v20);
          v26 = &v21[16 * v20];
          *(_QWORD *)v26 = 0;
          *((_QWORD *)v26 + 1) = 0;
          *(_QWORD *)(a1 + 176) = v21;
          *(_QWORD *)(a1 + 40) = v21;
LABEL_25:
          if ((v12 & 1) != 0)
          {
            v28 = (_DWORD)v21 + 16 * v20 + 8;
            v17 = v13;
            v18 = v16;
LABEL_32:
            v24 = "%lf";
LABEL_33:
            SNScanF(v17, v18, (unsigned __int8 *)v24, a4, a5, a6, a7, a8, v28);
          }
          else
          {
            SNScanF(v13, v16, "%lf", a4, a5, a6, a7, a8, (_DWORD)v21 + 16 * v20);
            ++*(_DWORD *)(a1 + 36);
          }
LABEL_34:
          ++v12;
          continue;
        }
        return 4294960568;
    }
  }
}

void NMEAFree(uint64_t a1)
{
  const char *v2;
  void *v3;
  _QWORD *v4;
  void *v5;

  v2 = (const char *)(a1 + 4);
  if (!strcmp((const char *)(a1 + 4), "PAACD"))
  {
    *(_DWORD *)(a1 + 36) = 0;
    *(_QWORD *)(a1 + 40) = 0;
    v3 = *(void **)(a1 + 304);
    if (!v3)
      return;
    v4 = (_QWORD *)(a1 + 304);
    goto LABEL_10;
  }
  if (!strcmp(v2, "PAGCD"))
  {
    *(_DWORD *)(a1 + 28) = 0;
    *(_QWORD *)(a1 + 32) = 0;
    v3 = *(void **)(a1 + 296);
    if (!v3)
      return;
    v4 = (_QWORD *)(a1 + 296);
    goto LABEL_10;
  }
  if (!strcmp(v2, "PASCD"))
  {
    v5 = *(void **)(a1 + 176);
    v4 = (_QWORD *)(a1 + 176);
    v3 = v5;
    *((_DWORD *)v4 - 35) = 0;
    *(v4 - 17) = 0;
    if (v5)
    {
LABEL_10:
      free(v3);
      *v4 = 0;
    }
  }
}

uint64_t ParseCommandLineIntoArgV(const char *a1, unsigned int *a2, _QWORD *a3)
{
  const char *v5;
  int64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  unsigned __int8 *v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  _BYTE *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  _BYTE *v23;
  _QWORD *v24;
  uint64_t i;
  unsigned int v26;
  void *v27;
  uint64_t v28;
  _QWORD *v30;
  unsigned int *v31;
  int v32;

  v5 = a1;
  v6 = strlen(a1);
  v7 = malloc_type_malloc(v6 + 1, 0x61548E3AuLL);
  if (!v7)
    return 4294960568;
  v8 = v7;
  v9 = malloc_type_malloc(0x88uLL, 0x10040436913F5uLL);
  if (!v9)
  {
LABEL_57:
    v28 = 4294960568;
    goto LABEL_53;
  }
  v10 = v9;
  if (v6 < 1)
  {
    v28 = 0;
    *v9 = 0;
    *a2 = 0;
    *a3 = v9;
    goto LABEL_53;
  }
  v11 = 0;
  v12 = (unsigned __int8 *)&v5[v6];
  v32 = 16;
  v13 = MEMORY[0x1E0C80978];
  v14 = v8;
  do
  {
    while (1)
    {
      v15 = *(unsigned __int8 *)v5;
      if (*v5 < 0)
      {
        if (__maskrune(v15, 0x4000uLL))
          goto LABEL_7;
        break;
      }
      if ((*(_DWORD *)(v13 + 4 * v15 + 60) & 0x4000) == 0)
        break;
LABEL_7:
      if (++v5 >= (const char *)v12)
      {
        v26 = v11;
        v27 = v10;
        goto LABEL_50;
      }
    }
    v30 = a3;
    v31 = a2;
    v16 = 0;
    v17 = 0;
    v18 = v14;
    v19 = v5;
    while (1)
    {
      do
      {
        while (1)
        {
          v5 = v19;
          v20 = v16;
          while (1)
          {
            if (v5 >= (const char *)v12)
              goto LABEL_42;
            v16 = v20;
            v19 = v5 + 1;
            v21 = *(unsigned __int8 *)v5;
            if (!(_DWORD)v20)
              break;
            v20 = 0;
            ++v5;
            if ((_DWORD)v21 != 39)
              goto LABEL_15;
          }
          if (!v17)
            break;
          v16 = 0;
          v17 = 0;
          if ((_DWORD)v21 != 34)
          {
            if ((_DWORD)v21 != 92)
              goto LABEL_34;
            if (v19 >= (const char *)v12)
              goto LABEL_33;
            LODWORD(v21) = *(unsigned __int8 *)v19;
            if ((_DWORD)v21 != 10)
            {
              if ((_DWORD)v21 == 92 || (_DWORD)v21 == 34)
              {
                v16 = 0;
                v19 = v5 + 2;
              }
              else
              {
LABEL_33:
                v16 = 0;
                LOBYTE(v21) = 92;
              }
LABEL_34:
              v17 = 1;
LABEL_15:
              *v18++ = v21;
              continue;
            }
            v16 = 0;
            v19 = v5 + 2;
LABEL_29:
            v17 = 1;
          }
        }
        if ((_DWORD)v21 == 34)
        {
          v16 = 0;
          goto LABEL_29;
        }
        v17 = 0;
        v16 = 1;
      }
      while ((_DWORD)v21 == 39);
      if ((_DWORD)v21 != 92)
        break;
      if (v19 >= (const char *)v12)
      {
        v16 = 0;
        v17 = 0;
        LOBYTE(v21) = 92;
        goto LABEL_15;
      }
      v16 = 0;
      v19 = v5 + 2;
      LODWORD(v21) = *((unsigned __int8 *)v5 + 1);
      v17 = 0;
      if ((_DWORD)v21 != 10)
      {
        v17 = 0;
        goto LABEL_15;
      }
    }
    if ((v21 & 0x80) != 0)
      v22 = __maskrune(*(unsigned __int8 *)v5, 0x4000uLL);
    else
      v22 = *(_DWORD *)(v13 + 4 * v21 + 60) & 0x4000;
    if (!v22)
    {
      v16 = 0;
      v17 = 0;
      goto LABEL_15;
    }
    ++v5;
LABEL_42:
    *v18 = 0;
    v23 = v18 + 1;
    a2 = v31;
    if (v11 < v32)
    {
      v27 = v10;
      goto LABEL_49;
    }
    v24 = malloc_type_malloc(8 * ((2 * v32) | 1), 0x10040436913F5uLL);
    if (!v24)
    {
      free(v10);
      goto LABEL_57;
    }
    v27 = v24;
    if (v11)
    {
      for (i = 0; i != v11; ++i)
        v24[i] = *((_QWORD *)v10 + i);
    }
    v32 *= 2;
    free(v10);
    v10 = v27;
LABEL_49:
    v26 = v11 + 1;
    *((_QWORD *)v27 + v11++) = v14;
    v14 = v23;
    a3 = v30;
  }
  while (v5 < (const char *)v12);
LABEL_50:
  v28 = 0;
  *((_QWORD *)v27 + v26) = 0;
  *a2 = v26;
  *a3 = v27;
  if (!v26)
LABEL_53:
    free(v8);
  return v28;
}

void FreeCommandLineArgV(int a1, void **a2)
{
  if (a2)
  {
    if (*a2)
      free(*a2);
    free(a2);
  }
}

uint64_t ParseCommaSeparatedNameValuePair(unsigned __int8 *a1, unint64_t a2, _BYTE *a3, uint64_t a4, _QWORD *a5, _BYTE *a6, _QWORD *a7, _QWORD *a8)
{
  uint64_t result;
  unsigned __int8 *v13;

  v13 = a1;
  if ((unint64_t)a1 >= a2)
  {
    result = 4294960569;
    if (!a8)
      return result;
    goto LABEL_5;
  }
  result = ParseEscapedString(a1, a2, 0x3Du, a3, a4, a5, &v13);
  if (!(_DWORD)result)
    result = ParseEscapedString(v13, a2, 0x2Cu, a6, 256, a7, &v13);
  if (a8)
LABEL_5:
    *a8 = v13;
  return result;
}

uint64_t ParseEscapedString(unsigned __int8 *a1, unint64_t a2, unsigned __int8 a3, _BYTE *a4, uint64_t a5, _QWORD *a6, unsigned __int8 **a7)
{
  uint64_t v7;
  unint64_t v8;
  _BYTE *v9;
  unsigned __int8 *v10;
  int v11;
  uint64_t v12;

  if (a5)
    v7 = a5 - 1;
  else
    v7 = 0;
  if ((unint64_t)a1 < a2)
  {
    v8 = (unint64_t)&a4[v7];
    v9 = a4;
    while (1)
    {
      v10 = a1 + 1;
      v11 = *a1;
      if (v11 == a3)
      {
        ++a1;
        goto LABEL_19;
      }
      if (v11 == 92)
      {
        if ((unint64_t)v10 >= a2)
        {
          v12 = 4294960546;
          if (!a6)
            goto LABEL_23;
LABEL_22:
          *a6 = v9 - a4;
          goto LABEL_23;
        }
        LOBYTE(v11) = a1[1];
        a1 += 2;
      }
      else
      {
        ++a1;
      }
      if ((unint64_t)v9 < v8)
      {
        if (a4)
          *v9 = v11;
        ++v9;
      }
      if ((unint64_t)a1 >= a2)
        goto LABEL_19;
    }
  }
  v9 = a4;
LABEL_19:
  v12 = 0;
  if (a4)
    *v9 = 0;
  v10 = a1;
  if (a6)
    goto LABEL_22;
LABEL_23:
  if (a7)
    *a7 = v10;
  return v12;
}

uint64_t ParseLine(unint64_t a1, unint64_t a2, unint64_t *a3, _QWORD *a4, unint64_t *a5)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v13;
  unint64_t v14;

  if (a1 == a2)
    return 0;
  v5 = a1;
  v6 = a1;
  if (a1 >= a2)
  {
LABEL_10:
    *a3 = a1;
    *a4 = v5 - a1;
  }
  else
  {
    v7 = 0;
    while (1)
    {
      v8 = a1 + v7;
      v9 = *(unsigned __int8 *)(a1 + v7);
      if (v9 == 10 || v9 == 13)
        break;
      if (a2 - a1 == ++v7)
      {
        v5 = a2;
        v6 = a2;
        goto LABEL_10;
      }
    }
    *a3 = a1;
    *a4 = v7;
    v6 = v8 + 1;
    if (v9 == 13 && v6 < a2)
    {
      v13 = *(unsigned __int8 *)(v8 + 1);
      v14 = v8 + 2;
      if (v13 == 10)
        v6 = v14;
    }
  }
  *a5 = v6;
  return 1;
}

uint64_t ReplaceDifferentString(void **a1, char *a2)
{
  char *v2;
  char *v4;
  const char *v5;
  const char *v6;
  uint64_t result;

  v2 = a2;
  v4 = (char *)*a1;
  if (a2)
    v5 = a2;
  else
    v5 = "";
  if (v4)
    v6 = v4;
  else
    v6 = "";
  result = strcmp(v5, v6);
  if ((_DWORD)result)
  {
    if (v2)
    {
      if (!*v2)
      {
        v2 = 0;
        if (!v4)
          goto LABEL_13;
        goto LABEL_12;
      }
      v2 = strdup(v2);
      if (!v2)
        return 4294960568;
    }
    if (!v4)
    {
LABEL_13:
      result = 0;
      *a1 = v2;
      return result;
    }
LABEL_12:
    free(v4);
    goto LABEL_13;
  }
  return result;
}

uint64_t ReplaceString(void **a1, size_t *a2, char *__s, size_t a4)
{
  size_t v4;
  _BYTE *v8;
  _BYTE *v9;
  uint64_t result;

  v4 = a4;
  if (__s)
  {
    if (a4 == -1)
      v4 = strlen(__s);
    v8 = malloc_type_malloc(v4 + 1, 0xD8755F05uLL);
    if (!v8)
      return 4294960568;
    v9 = v8;
    memcpy(v8, __s, v4);
    v9[v4] = 0;
  }
  else
  {
    v9 = 0;
  }
  if (*a1)
    free(*a1);
  *a1 = v9;
  result = 0;
  if (a2)
    *a2 = v4;
  return result;
}

const char *GetFileExtensionFromString(char *a1)
{
  char *v1;
  const char *result;
  int v3;
  int v4;

  v1 = strrchr(a1, 46);
  if (!v1)
    return "";
  v4 = v1[1];
  result = v1 + 1;
  v3 = v4;
  if ((v4 - 48) < 0xA || v3 == 37 || v3 == 32)
    return "";
  return result;
}

uint64_t StringArray_Append(const void **a1, uint64_t *a2, char *__s1)
{
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  uint64_t result;

  v5 = strdup(__s1);
  if (!v5)
    return 4294960568;
  v6 = v5;
  v7 = *a2;
  v8 = *a2 + 1;
  v9 = malloc_type_malloc(8 * v8, 0x10040436913F5uLL);
  if (!v9)
  {
    free(v6);
    return 4294960568;
  }
  v10 = v9;
  if (v7)
  {
    v11 = (void *)*a1;
    memcpy(v9, *a1, 8 * v7);
    free(v11);
  }
  result = 0;
  v10[v7] = v6;
  *a1 = v10;
  *a2 = v8;
  return result;
}

void StringArray_Free(void **a1, uint64_t a2)
{
  uint64_t i;

  if (a2)
  {
    for (i = 0; i != a2; ++i)
      free(a1[i]);
    free(a1);
  }
}

uint64_t TextFindColumn(char *__s, size_t a2, _BYTE *a3, int a4, _QWORD *a5, _QWORD *a6)
{
  char *v10;
  char *v11;
  int v12;
  char *v13;
  char *v14;
  unsigned __int8 *v15;
  int v16;
  int v17;
  uint64_t result;

  v10 = __s;
  if (a2 == -1)
    a2 = strlen(__s);
  v11 = &v10[a2];
  v12 = 1;
  do
  {
    v13 = v10;
    if (v10 >= v11)
    {
LABEL_11:
      v14 = v11;
      v10 = v11;
      if (v13 == v11)
        return 4294960569;
    }
    else
    {
      v14 = v10;
      while (!*a3)
      {
LABEL_10:
        if (++v14 == v11)
          goto LABEL_11;
      }
      v15 = a3 + 1;
      v16 = *a3;
      while (*v14 != v16)
      {
        v17 = *v15++;
        v16 = v17;
        if (!v17)
          goto LABEL_10;
      }
      v10 = v14 + 1;
    }
  }
  while (v12++ != a4);
  if (a5)
    *a5 = v13;
  result = 0;
  if (a6)
    *a6 = v14 - v13;
  return result;
}

uint64_t TextSep(unsigned __int8 *a1, unsigned __int8 *a2, unsigned __int8 *a3, unsigned __int8 **a4, _QWORD *a5, unsigned __int8 **a6)
{
  unsigned __int8 *v6;
  int v7;
  int v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  int v11;
  int v12;
  uint64_t v13;

  if (a1 < a2)
  {
    v8 = *a3;
    v6 = a3 + 1;
    v7 = v8;
    v9 = a1;
    while (!v7)
    {
LABEL_7:
      if (++v9 == a2)
        goto LABEL_8;
    }
    v10 = v6;
    v11 = v7;
    while (*v9 != v11)
    {
      v12 = *v10++;
      v11 = v12;
      if (!v12)
        goto LABEL_7;
    }
    *a4 = a1;
    *a5 = v9 - a1;
    if (!a6)
      return 1;
    a2 = v9 + 1;
    v13 = 1;
    goto LABEL_14;
  }
LABEL_8:
  if (a1 != a2)
  {
    *a4 = a1;
    *a5 = a2 - a1;
    v13 = 1;
    if (!a6)
      return v13;
    goto LABEL_14;
  }
  v13 = 0;
  a2 = a1;
  if (a6)
LABEL_14:
    *a6 = a2;
  return v13;
}

size_t TruncateUTF8(char *a1, size_t a2, void *a3, uint64_t a4, int a5)
{
  size_t v8;

  if (!a4)
    return 0;
  v8 = TruncatedUTF8Length(a1, a2, a4 - (a5 != 0));
  memmove(a3, a1, v8);
  if (a5)
    *((_BYTE *)a3 + v8) = 0;
  return v8;
}

int64_t XMLEscape(const char *a1, char *a2, _QWORD *a3)
{
  const char *v5;
  int64_t result;
  char *v7;
  char *v8;
  int v9;
  const char *v10;
  char v11;
  unsigned __int8 *v12;
  int v13;

  v5 = a1;
  result = strlen(a1);
  v7 = a2;
  if (result >= 1)
  {
    v8 = (char *)&v5[result];
    v7 = a2;
    do
    {
      v9 = *v5;
      if (v9 <= 38)
      {
        if (v9 == 34)
        {
          v10 = "&quot;";
        }
        else
        {
          v10 = "&amp;";
          if (v9 != 38)
          {
LABEL_10:
            if (a2)
              *v7 = v9;
            ++v7;
            goto LABEL_21;
          }
        }
      }
      else
      {
        switch(v9)
        {
          case '\'':
            v10 = "&#39;";
            break;
          case '<':
            v10 = "&lt;";
            break;
          case '>':
            v10 = "&gt;";
            break;
          default:
            goto LABEL_10;
        }
      }
      v11 = *v10;
      if (*v10)
      {
        v12 = (unsigned __int8 *)(v10 + 1);
        do
        {
          if (a2)
            *v7 = v11;
          ++v7;
          v13 = *v12++;
          v11 = v13;
        }
        while (v13);
      }
LABEL_21:
      ++v5;
    }
    while (v5 < v8);
  }
  *a3 = v7 - a2;
  return result;
}

uint64_t XMLEscapeCopy(const char *a1, char **a2)
{
  char *v4;
  char *v5;
  uint64_t result;
  uint64_t v7;

  v7 = 0;
  XMLEscape(a1, 0, &v7);
  v4 = (char *)malloc_type_malloc(v7 + 1, 0x67ADC13DuLL);
  if (!v4)
    return 4294960568;
  v5 = v4;
  XMLEscape(a1, v4, &v7);
  result = 0;
  v5[v7] = 0;
  *a2 = v5;
  return result;
}

uint64_t DNSServiceConstructFullNameEx(_BYTE *a1, uint64_t a2, char *__s, unsigned __int8 *a4)
{
  size_t v8;
  _BOOL4 v9;
  uint64_t result;
  unint64_t v11;
  const char *v12;
  unsigned __int8 v13;
  uint64_t v14;
  unsigned __int8 *v15;
  _BYTE *v16;
  _BYTE *v17;
  uint64_t v18;
  unsigned __int8 v19;
  char v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  int v24;
  _BYTE *v25;
  unsigned __int8 v26;
  uint64_t v27;
  unsigned __int8 *v28;
  uint64_t v29;
  int v30;

  if (!__s)
    return 4294960591;
  v8 = strlen(__s);
  v9 = DomainEndsInDot((unsigned __int8 *)__s);
  result = 4294960591;
  if (a4)
  {
    v11 = v8 - v9;
    if (v11 >= 6)
    {
      if (*a4)
      {
        v12 = &__s[v11 - 4];
        if (strncasecmp(v12, "_tcp", 4uLL) && strncasecmp(v12, "_udp", 4uLL))
          return 4294960591;
        if (a2)
        {
          v13 = *(_BYTE *)a2;
          if (*(_BYTE *)a2)
          {
            v14 = 0;
            v15 = (unsigned __int8 *)(a2 + 1);
            v16 = a1;
            while (1)
            {
              if (v13 < 0x21u)
              {
LABEL_13:
                if (v14 > 1000)
                  goto LABEL_47;
                *v16 = 92;
                v17 = &a1[v14];
                v17[1] = 48;
                v18 = v14 + 3;
                v17[2] = (v13 / 0xAu) | 0x30;
                v13 = (v13 % 0xAu) | 0x30;
                goto LABEL_25;
              }
              if (v13 > 0x39u)
              {
                if (v13 != 92)
                {
                  if (v13 == 58)
                    goto LABEL_13;
LABEL_21:
                  if (v14 >= 1004)
                    goto LABEL_47;
                  v18 = v14;
                  goto LABEL_25;
                }
              }
              else
              {
                if (v13 == 37)
                  goto LABEL_13;
                if (v13 != 46)
                  goto LABEL_21;
              }
              if (v14 > 1002)
              {
LABEL_47:
                v25 = &a1[v14];
                goto LABEL_53;
              }
              v18 = v14 + 1;
              *v16 = 92;
LABEL_25:
              v14 = v18 + 1;
              a1[v18] = v13;
              v19 = *v15++;
              v13 = v19;
              v16 = &a1[v18 + 1];
              if (!v19)
              {
                a2 = v18 + 2;
                *v16 = 46;
                goto LABEL_28;
              }
            }
          }
          a2 = 0;
        }
LABEL_28:
        v20 = *__s;
        if (*__s)
        {
          v21 = 1004;
          if (a2 > 1004)
            v21 = a2;
          v22 = __s + 1;
          while (v21 != a2)
          {
            v23 = a2 + 1;
            a1[a2] = v20;
            v24 = *v22++;
            v20 = v24;
            ++a2;
            if (!v24)
            {
              v25 = &a1[v23];
              a2 = v23;
              goto LABEL_36;
            }
          }
          goto LABEL_46;
        }
        v25 = &a1[a2];
LABEL_36:
        if (!DomainEndsInDot((unsigned __int8 *)__s))
        {
          if (a2 > 1003)
            goto LABEL_53;
          ++a2;
          *v25 = 46;
        }
        v26 = *a4;
        if (*a4)
        {
          v27 = 1004;
          if (a2 > 1004)
            v27 = a2;
          v28 = a4 + 1;
          while (v27 != a2)
          {
            v29 = a2 + 1;
            a1[a2] = v26;
            v30 = *v28++;
            v26 = v30;
            ++a2;
            if (!v30)
            {
              v25 = &a1[v29];
              a2 = v29;
              goto LABEL_49;
            }
          }
LABEL_46:
          v25 = &a1[a2];
          goto LABEL_53;
        }
        v25 = &a1[a2];
LABEL_49:
        if (DomainEndsInDot(a4))
        {
          result = 0;
        }
        else if (a2 > 1003)
        {
LABEL_53:
          result = 4294960591;
        }
        else
        {
          result = 0;
          *v25++ = 46;
        }
        *v25 = 0;
      }
    }
  }
  return result;
}

BOOL DomainEndsInDot(unsigned __int8 *a1)
{
  int v1;
  int v2;
  uint64_t v3;

  v1 = *a1;
  if (*a1)
  {
    while (1)
    {
      v2 = a1[1];
      if (!a1[1])
        break;
      if (v1 == 92)
      {
        if ((v2 - 48) > 9 || a1[2] - 48 > 9 || a1[3] - 48 >= 0xA)
          v3 = 2;
        else
          v3 = 4;
        a1 += v3;
        v1 = *a1;
        if (!*a1)
          return v1 == 46;
      }
      else
      {
        v1 = *++a1;
        if (!v2)
          return v1 == 46;
      }
    }
  }
  return v1 == 46;
}

_BYTE *MakeDomainNameFromDNSNameString(_BYTE *a1, char *a2)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  unint64_t v7;
  char v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t i;
  char *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  char *v17;
  uint64_t v18;

  v2 = 0;
  *a1 = 0;
  while (1)
  {
    v3 = a1[v2];
    if (v3 > 0x3F)
    {
LABEL_5:
      v4 = a1 + 255;
      goto LABEL_6;
    }
    if (!a1[v2])
      break;
    v2 += v3 + 1;
    if ((unint64_t)v2 >= 0xFF)
      goto LABEL_5;
  }
  v7 = (unint64_t)&a1[v2];
  if ((unint64_t)v2 > 0xFD || (v8 = *a2) == 0)
  {
    v4 = &a1[v2];
    goto LABEL_6;
  }
  v9 = a1 + 1;
  do
  {
    if (v8 == 46)
      return 0;
    if (v2 <= 253)
      v10 = 253;
    else
      v10 = v2;
    for (i = v2; ; ++i)
    {
      if (!v8 || v8 == 46)
      {
        v10 = i;
LABEL_29:
        v2 = i + 1;
        v4 = &v9[i];
        i = v10;
        goto LABEL_30;
      }
      if (v10 == i)
        goto LABEL_29;
      v12 = a2 + 1;
      if (v8 == 92)
        break;
LABEL_27:
      v9[i] = v8;
      v8 = *v12;
      a2 = v12;
    }
    v13 = *v12;
    if (*v12)
    {
      v8 = *v12;
      v12 = a2 + 2;
      if (v13 - 48 <= 9)
      {
        v14 = *v12;
        if ((v14 - 48) <= 9)
        {
          v15 = a2[3];
          if ((v15 - 48) <= 9)
          {
            v16 = 100 * v13 + 10 * (char)v14 + (char)v15;
            v17 = a2 + 4;
            if (v16 < 5584)
            {
              v8 = v16 + 48;
              v12 = v17;
            }
          }
        }
      }
      goto LABEL_27;
    }
    v8 = 0;
    v2 = i + 1;
    v4 = &v9[i];
    ++a2;
LABEL_30:
    v18 = (uint64_t)&v4[~v7];
    if (v18 > 63)
      return 0;
    if (v8)
      ++a2;
    *(_BYTE *)v7 = v18;
    v8 = *a2;
    if (!*a2)
      break;
    v7 = (unint64_t)v4;
  }
  while (i < 253);
LABEL_6:
  *v4 = 0;
  v5 = v4 + 1;
  if (*a2)
    return 0;
  else
    return v5;
}

uint64_t IncrementNumericSuffix(char *__s, unint64_t a2, uint64_t a3, int a4, uint64_t *a5)
{
  size_t v8;
  unint64_t v10;
  int v11;
  uint64_t v12;
  unint64_t v13;
  int v14;
  _BOOL4 v15;
  uint64_t v16;
  uint32_t v17;
  unsigned int v18;
  int v19;
  size_t v20;
  int v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t result;
  uint64_t v27;
  char v28;
  BOOL v29;
  uint64_t v30;

  v8 = a2;
  if (a4)
  {
    if (a2 < 4 || __s[a2 - 1] != 41 || __s[a2 - 2] - 48 > 9)
      goto LABEL_43;
    v10 = a2;
    while (v10 - 2 > 2)
    {
      v11 = __s[v10-- - 3];
      if ((v11 - 48) >= 0xA)
      {
        v12 = v10 - 1;
        goto LABEL_19;
      }
    }
    v11 = __s[1];
    v12 = 2;
LABEL_19:
    if (v11 != 40 || __s[v12 - 2] != 32)
      goto LABEL_43;
    if (a2 != 0 && a4 != 0)
      v8 = a2 - 1;
  }
  else
  {
    v13 = a2 - 2;
    if (a2 < 2 || __s[a2 - 1] - 48 > 9)
    {
      v15 = 0;
      v16 = 2;
      v17 = 2;
      goto LABEL_51;
    }
    while (v13 + 1 > 1)
    {
      v14 = __s[v13--];
      if ((v14 - 48) >= 0xA)
        goto LABEL_16;
    }
    v14 = *__s;
LABEL_16:
    if (v14 != 45)
      goto LABEL_43;
  }
  if (v8)
  {
    v18 = 0;
    v19 = 1;
    while (1)
    {
      v20 = v8 - 1;
      v21 = __s[v8 - 1];
      if ((v21 - 48) > 9)
        break;
      v18 += (v21 - 48) * v19;
      v19 *= 10;
      --v8;
      if (!v20)
        goto LABEL_40;
    }
    if (a4)
    {
      if (v8 < 2)
      {
        v8 = 1;
      }
      else if (v21 == 40 && __s[v8 - 2] == 32)
      {
        v8 -= 2;
      }
    }
    else if (v21 == 45)
    {
      --v8;
    }
LABEL_40:
    if (v18)
    {
      if (v18 > 9)
        v17 = v18 + (arc4random() & 0x7F) + 1;
      else
        v17 = v18 + 1;
      goto LABEL_44;
    }
LABEL_43:
    v17 = 2;
LABEL_44:
    v15 = a4 != 0;
    v16 = 2;
    if (a4)
      v16 = 4;
    if (v8 && a4)
    {
      do
      {
        if (__s[v8 - 1] != 32)
          break;
        --v8;
      }
      while (v8);
      v15 = 1;
    }
    goto LABEL_51;
  }
  v15 = a4 != 0;
  v17 = 2;
  v16 = 4;
  if (!a4)
    v16 = 2;
LABEL_51:
  v22 = v17;
  v23 = v16 - 1;
  v24 = 1;
  do
  {
    v25 = v24;
    v24 *= 10;
    ++v23;
  }
  while (v24 <= v22);
  result = TruncatedUTF8Length(__s, v8, a3 - v23);
  if (v15)
  {
    v27 = result + 1;
    __s[result + 1] = 40;
    v28 = 32;
  }
  else
  {
    v28 = 45;
    v27 = result;
  }
  __s[result] = v28;
  if (v25)
  {
    do
    {
      __s[v27 + 1] = v22 / v25 + 48;
      v22 %= v25;
      ++v27;
      v29 = v25 > 9;
      v25 /= 0xAuLL;
    }
    while (v29);
  }
  v30 = v27 + 1;
  if (v15)
  {
    __s[v30] = 41;
    v30 = v27 + 2;
  }
  *a5 = v30;
  return result;
}

char *GetDeviceInternalModelString(char *a1, size_t a2)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  const char *v9;
  size_t v11;
  _BYTE v12[64];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12[0] = 0;
  v11 = 63;
  if (sysctlbyname("hw.target", v12, &v11, 0, 0))
  {
    v11 = 63;
    if (sysctlbyname("hw.model", v12, &v11, 0, 0))
      v11 = 0;
  }
  v12[v11] = 0;
  v4 = (char *)&v11 + 6;
  v5 = MEMORY[0x1E0C80978];
  do
  {
    v6 = v4[2];
    if (v4[2] < 0)
      v7 = __maskrune(v6, 0x100uLL);
    else
      v7 = *(_DWORD *)(v5 + 4 * v6 + 60) & 0x100;
    ++v4;
  }
  while (v7);
  do
    v8 = *++v4;
  while ((v8 - 48) < 0xA);
  *v4 = 0;
  if (v12[0])
    v9 = v12;
  else
    v9 = "N88";
  strlcpy(a1, v9, a2);
  return a1;
}

uint64_t GestaltSetDomain(const void *a1)
{
  const void *v2;

  pthread_mutex_lock(&gGestaltLock);
  v2 = (const void *)gGestaltDomain;
  if (a1)
    CFRetain(a1);
  gGestaltDomain = (uint64_t)a1;
  if (v2)
    CFRelease(v2);
  return pthread_mutex_unlock(&gGestaltLock);
}

void *GestaltSetHook(void *result, uint64_t a2)
{
  gGestaltHook_f = result;
  gGestaltHook_ctx = a2;
  return result;
}

uint64_t GestaltCopyAnswer(CFTypeRef cf1, uint64_t a2, int *a3)
{
  uint64_t result;
  int v6;
  mach_port_t v7;
  const __CFDictionary *v8;
  io_service_t MatchingService;
  io_registry_entry_t v10;
  const __CFString *CFProperty;
  unint64_t v12;
  const __CFString *v13;
  unint64_t v14;
  uint64_t *v15;
  int v16;
  const __CFString *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 bytes;
  char __s[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (!gGestaltHook_f || (result = gGestaltHook_f(cf1, a2, a3, gGestaltHook_ctx)) == 0)
  {
    if (CFEqual(cf1, CFSTR("NANCapability")))
    {
      v6 = gGestaltCacheNANCapability;
      if (!gGestaltCacheNANCapability)
      {
        if (if_nametoindex("nan0"))
          v6 = 6;
        else
          v6 = 5;
        gGestaltCacheNANCapability = v6;
      }
      goto LABEL_21;
    }
    if (!CFEqual(cf1, CFSTR("R1Capability")))
    {
      if (CFEqual(cf1, CFSTR("systemUUID")))
      {
        v36 = 0;
        pthread_mutex_lock(&gGestaltLock);
        if (gGestaltDomain)
          v17 = (const __CFString *)gGestaltDomain;
        else
          v17 = (const __CFString *)*MEMORY[0x1E0C9B248];
        __s[0] = 0;
        CFPrefs_GetCString(v17, CFSTR("systemUUID"), __s, 0x80uLL, 0);
        v18 = strchr(__s, 58);
        if (v18
          && (v22 = v18, !StringToUUIDEx(__s, v18 - __s, 0, 0, &bytes, v19, v20, v21))
          && sscanf(v22 + 1, "%lf", &v36) == 1)
        {
          if (gLogCategory_Gestalt <= 20
            && (gLogCategory_Gestalt != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_Gestalt, 0x14u)))
          {
            LogPrintF((uint64_t)&gLogCategory_Gestalt, (uint64_t)"void GetSystemUUID(int, uint8_t *)", 0x14u, (uint64_t)"Reused system UUID %s\n", v23, v24, v25, v26, (uint64_t)__s);
          }
        }
        else
        {
          RandomBytes(&bytes, 0x10uLL);
          BYTE6(bytes) = BYTE6(bytes) & 0xF | 0x40;
          BYTE8(bytes) = BYTE8(bytes) & 0x3F | 0x80;
          CFAbsoluteTimeGetCurrent();
          SNPrintF((uint64_t)__s, 128, (uint64_t)"%#U:%f", v27, v28, v29, v30, v31, (uint64_t)&bytes);
          CFPrefs_SetCString(v17, CFSTR("systemUUID"), __s, -1);
          CFPreferencesAppSynchronize(v17);
          if (gLogCategory_Gestalt <= 40
            && (gLogCategory_Gestalt != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_Gestalt, 0x28u)))
          {
            LogPrintF((uint64_t)&gLogCategory_Gestalt, (uint64_t)"void GetSystemUUID(int, uint8_t *)", 0x28u, (uint64_t)"Generated system UUID %s\n", v32, v33, v34, v35, (uint64_t)__s);
          }
        }
        pthread_mutex_unlock(&gGestaltLock);
        result = (uint64_t)CFDataCreate(0, (const UInt8 *)&bytes, 16);
        if (result)
          goto LABEL_25;
        v16 = -6728;
      }
      else
      {
        result = MGCopyAnswer();
        if (result)
        {
LABEL_25:
          v16 = 0;
          goto LABEL_26;
        }
        v16 = -6727;
      }
LABEL_26:
      if (a3)
        *a3 = v16;
      return result;
    }
    v6 = gGestaltCacheR1Capability;
    if (gGestaltCacheR1Capability)
    {
LABEL_21:
      if (v6 == 6)
        v15 = (uint64_t *)MEMORY[0x1E0C9AE50];
      else
        v15 = (uint64_t *)MEMORY[0x1E0C9AE40];
      result = *v15;
      goto LABEL_25;
    }
    v7 = *MEMORY[0x1E0CBBAA8];
    v8 = IOServiceNameMatching("rose");
    MatchingService = IOServiceGetMatchingService(v7, v8);
    if (MatchingService)
    {
      v10 = MatchingService;
      CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("ChipID"), 0, 0);
      v12 = CFGetInt64(CFProperty, 0);
      if (CFProperty)
        CFRelease(CFProperty);
      if (v12)
      {
        v13 = (const __CFString *)IORegistryEntryCreateCFProperty(v10, CFSTR("ECID"), 0, 0);
        v14 = CFGetInt64(v13, 0);
        if (v13)
          CFRelease(v13);
        IOObjectRelease(v10);
        if (v14)
          v6 = 6;
        else
          v6 = 5;
        goto LABEL_20;
      }
      IOObjectRelease(v10);
    }
    v6 = 5;
LABEL_20:
    gGestaltCacheR1Capability = v6;
    goto LABEL_21;
  }
  return result;
}

BOOL GestaltGetBoolean(const void *a1, uint64_t a2, int *a3)
{
  const __CFString *v4;
  const __CFString *v5;
  _BOOL8 v6;

  v4 = (const __CFString *)GestaltCopyAnswer(a1, a2, a3);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = CFGetInt64(v4, a3) != 0;
  CFRelease(v5);
  return v6;
}

char *GestaltGetCString(const void *a1, uint64_t a2, char *a3, size_t a4, int *a5)
{
  const __CFString *v8;
  const __CFString *v9;

  v8 = (const __CFString *)GestaltCopyAnswer(a1, a2, a5);
  if (v8)
  {
    v9 = v8;
    a3 = (char *)CFGetCString(v8, a3, a4);
    CFRelease(v9);
    if (a5)
      *a5 = 0;
  }
  return a3;
}

const char *GestaltGetData(const void *a1, uint64_t a2, const char *a3, unint64_t a4, _QWORD *a5, int *a6)
{
  __CFString *v10;
  __CFString *v11;
  const char *v12;

  v10 = (__CFString *)GestaltCopyAnswer(a1, a2, a6);
  if (v10)
  {
    v11 = v10;
    v12 = CFGetData(v10, a3, a4, a5, a6);
    CFRelease(v11);
    return v12;
  }
  else
  {
    if (a5)
      *a5 = 0;
    return 0;
  }
}

uint64_t GestaltProductTypeStringToDeviceClass(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "hasPrefix:", CFSTR("iPhone")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "hasPrefix:", CFSTR("iPad")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "containsString:", CFSTR("Mac")) & 1) != 0)
  {
    v2 = 100;
  }
  else if ((objc_msgSend(v1, "hasPrefix:", CFSTR("AppleTV")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "hasPrefix:", CFSTR("AudioAccessory1,")) & 1) != 0
         || (objc_msgSend(v1, "hasPrefix:", CFSTR("AudioAccessory5,")) & 1) != 0
         || (objc_msgSend(v1, "hasPrefix:", CFSTR("AudioAccessory6,")) & 1) != 0
         || (objc_msgSend(v1, "hasPrefix:", CFSTR("HomePod")) & 1) != 0)
  {
    v2 = 7;
  }
  else if ((objc_msgSend(v1, "hasPrefix:", CFSTR("Watch")) & 1) != 0)
  {
    v2 = 6;
  }
  else if ((objc_msgSend(v1, "hasPrefix:", CFSTR("iPod")) & 1) != 0)
  {
    v2 = 2;
  }
  else if (objc_msgSend(v1, "hasPrefix:", CFSTR("RealityDevice")))
  {
    v2 = 11;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

const __CFString *CUGestaltDeviceClassToString(int a1)
{
  int v1;
  const __CFString *result;

  v1 = a1 - 1;
  result = CFSTR("AppleTV");
  switch(v1)
  {
    case 0:
      result = CFSTR("iPhone");
      break;
    case 1:
      result = CFSTR("iPod");
      break;
    case 2:
      result = CFSTR("iPad");
      break;
    case 3:
      return result;
    case 4:
    case 7:
    case 8:
    case 9:
      goto LABEL_5;
    case 5:
      result = CFSTR("Watch");
      break;
    case 6:
      result = CFSTR("HomePod");
      break;
    case 10:
      result = CFSTR("RealityDevice");
      break;
    default:
      if (CFSTR("AppleTV") == 100)
        result = CFSTR("Mac");
      else
LABEL_5:
        result = CFSTR("?");
      break;
  }
  return result;
}

BOOL DeviceOSVersionAtOrLater(int a1, int a2, int a3, int a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8)
{
  return DeviceOSVersionAtOrLaterEx(a1, a2, a3, a4, a5, a6, a7, a8, 0x2710u);
}

BOOL DeviceOSVersionAtOrLaterEx(int a1, int a2, int a3, int a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8, unsigned int a9)
{
  _BOOL8 result;
  unsigned int v11;

  result = 0;
  v11 = 10000 * a2 + 100 * a3 + a4;
  switch(a1)
  {
    case 1:
    case 2:
    case 3:
      return v11 >= a5;
    case 4:
    case 7:
      return v11 >= a7;
    case 5:
    case 8:
    case 9:
    case 10:
      return result;
    case 6:
      return v11 >= a8;
    case 11:
      return v11 >= a9;
    default:
      if (a1 != 100)
        return result;
      return v11 >= a6;
  }
}

BOOL wInTP56r94EFs9NAAi(int a1, int a2, int a3, int a4)
{
  return DeviceOSVersionAtOrLaterEx(a1, a2, a3, a4, 0x1D4C0u, 0x18C18u, 0x1D4C0u, 0xC350u, 0x2710u);
}

BOOL se1P4X0Kh(int a1, int a2, int a3, int a4)
{
  return DeviceOSVersionAtOrLaterEx(a1, a2, a3, a4, 0x1D524u, 0x18C19u, 0x1D524u, 0xC3B4u, 0x2710u);
}

BOOL TN6sBSnEP2(int a1, int a2, int a3, int a4)
{
  return DeviceOSVersionAtOrLaterEx(a1, a2, a3, a4, 0x1D588u, 0x18C1Cu, 0x1D588u, 0xC418u, 0x2710u);
}

BOOL NADyFF4UGjtVGBmEW6h(int a1, int a2, int a3, int a4)
{
  return DeviceOSVersionAtOrLaterEx(a1, a2, a3, a4, 0x1FBD0u, 0x18C7Cu, 0x1FBD0u, 0xEA60u, 0x2710u);
}

char *GetDeviceModelString(char *a1, size_t a2)
{
  size_t v4;
  size_t v6;
  size_t __n;
  char __source[64];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  __source[0] = 0;
  __n = 63;
  if (sysctlbyname("hw.machine", __source, &__n, 0, 0)
    || (v6 = __n, !memchr(__source, 44, __n))
    || strnstr(__source, "iProd", v6))
  {
    v4 = 0;
    __n = 0;
  }
  else
  {
    v4 = __n;
  }
  __source[v4] = 0;
  strlcpy(a1, __source, a2);
  return a1;
}

const char *GetDeviceName(char *a1, CFIndex a2)
{
  const __CFString *v4;
  const __CFString *v5;
  CFTypeID v6;
  CFTypeID v7;
  const char *v8;

  v4 = (const __CFString *)MGCopyAnswer();
  if (!v4)
  {
LABEL_4:
    v5 = (const __CFString *)MGCopyAnswer();
    if (!v5)
      goto LABEL_7;
    goto LABEL_5;
  }
  v5 = v4;
  v6 = CFGetTypeID(v4);
  if (v6 != CFStringGetTypeID())
  {
    CFRelease(v5);
    goto LABEL_4;
  }
LABEL_5:
  v7 = CFGetTypeID(v5);
  if (v7 == CFStringGetTypeID())
    goto LABEL_8;
  CFRelease(v5);
LABEL_7:
  v5 = &stru_1E25DF9F8;
  CFRetain(&stru_1E25DF9F8);
LABEL_8:
  if (a2)
  {
    *a1 = 0;
    v8 = a1;
  }
  else
  {
    v8 = "";
  }
  CFStringGetCString(v5, a1, a2, 0x8000100u);
  CFRelease(v5);
  return v8;
}

char *GetDeviceUniqueID(char *a1, CFIndex a2)
{
  const __CFString *v4;
  const __CFString *v5;
  CFTypeID v6;

  v4 = (const __CFString *)MGCopyAnswer();
  if (v4)
  {
    v5 = v4;
    v6 = CFGetTypeID(v4);
    if (v6 == CFStringGetTypeID())
      CFStringGetCString(v5, a1, a2, 0x8000100u);
    CFRelease(v5);
  }
  return a1;
}

char *GetSystemBuildVersionString(char *a1, CFIndex a2)
{
  const __CFString *v4;
  const __CFString *v5;
  CFTypeID v6;

  v4 = (const __CFString *)MGCopyAnswer();
  if (v4)
  {
    v5 = v4;
    v6 = CFGetTypeID(v4);
    if (v6 == CFStringGetTypeID())
      CFStringGetCString(v5, a1, a2, 0x8000100u);
    CFRelease(v5);
  }
  return a1;
}

uint64_t CUIsGreenTeaDevice()
{
  if (CUIsGreenTeaDevice_sOnce != -1)
    dispatch_once(&CUIsGreenTeaDevice_sOnce, &__block_literal_global_57);
  return CUIsGreenTeaDevice_sResult;
}

uint64_t CUSetSystemName(const __CFString *a1, const __CFString *a2, char a3)
{
  const __SCPreferences *v6;
  const __SCPreferences *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  __CFString *MutableCopy;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t InterfaceMACAddress;
  uint8x8_t v28;
  unint64_t Int64;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _DWORD bytes[2];

  v6 = SCPreferencesCreateWithAuthorization(0, CFSTR("com.apple.CoreUtils"), 0, 0);
  if (v6)
  {
    v7 = v6;
    if (SCPreferencesSetComputerName(v6, a1, 0x8000100u))
    {
      v12 = 0;
      if (a2)
      {
LABEL_4:
        v13 = 0;
        goto LABEL_5;
      }
    }
    else
    {
      if (gLogCategory_CUMisc <= 60
        && (gLogCategory_CUMisc != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMisc, 0x3Cu)))
      {
        SCError();
        LogPrintF((uint64_t)&gLogCategory_CUMisc, (uint64_t)"OSStatus CUSetSystemName(CFStringRef, CFStringRef, CUSystemNameFlags)", 0x3Cu, (uint64_t)"### Set computer name %@' failed: %#m\n", v19, v20, v21, v22, (uint64_t)a1);
      }
      v12 = SCError();
      if (a2)
        goto LABEL_4;
    }
    if ((a3 & 1) != 0)
    {
      a2 = (const __CFString *)((uint64_t (*)(uint64_t, uint64_t))softLink_CSCopyLocalHostnameForComputerName[0])(0, (uint64_t)a1);
      v13 = a2;
      if (a2)
      {
LABEL_5:
        if ((a3 & 2) != 0)
        {
          MutableCopy = CFStringCreateMutableCopy(0, 0, a2);
          if (MutableCopy)
          {
            memset(bytes, 0, 6);
            InterfaceMACAddress = GetInterfaceMACAddress("en0", (uint64_t)bytes);
            if ((_DWORD)InterfaceMACAddress
              && gLogCategory_CUMisc <= 60
              && (gLogCategory_CUMisc != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMisc, 0x3Cu)))
            {
              LogPrintF((uint64_t)&gLogCategory_CUMisc, (uint64_t)"OSStatus CUSetSystemName(CFStringRef, CFStringRef, CUSystemNameFlags)", 0x3Cu, (uint64_t)"### Set computer name, get en0 failed: %#m", v23, v24, v25, v26, InterfaceMACAddress);
            }
            v28.i32[0] = *(_DWORD *)((char *)bytes + 1);
            if (InterfaceMACAddress | vmovn_s16((int16x8_t)vmovl_u8(v28)).u32[0]
              || LOBYTE(bytes[0]) != 2
              || BYTE1(bytes[1]))
            {
              if ((_DWORD)InterfaceMACAddress)
                goto LABEL_48;
            }
            else
            {
              Int64 = CFPrefs_GetInt64(0, CFSTR("CUSystemNameAddress"), 0);
              if (Int64)
              {
                v34 = Int64;
                if (gLogCategory_CUMisc <= 50
                  && (gLogCategory_CUMisc != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMisc, 0x32u)))
                {
                  LogPrintF((uint64_t)&gLogCategory_CUMisc, (uint64_t)"OSStatus CUSetSystemName(CFStringRef, CFStringRef, CUSystemNameFlags)", 0x32u, (uint64_t)"Computer name address: existing=0x%012lX", v30, v31, v32, v33, v34);
                }
                LOBYTE(bytes[0]) = BYTE5(v34);
                BYTE1(bytes[0]) = BYTE4(v34);
                BYTE2(bytes[0]) = BYTE3(v34);
                HIBYTE(bytes[0]) = BYTE2(v34);
                LOBYTE(bytes[1]) = BYTE1(v34);
                BYTE1(bytes[1]) = v34;
              }
              else
              {
                RandomBytes(bytes, 6uLL);
                v35 = ((unint64_t)LOBYTE(bytes[0]) << 40) | ((unint64_t)BYTE1(bytes[0]) << 32) | ((unint64_t)BYTE2(bytes[0]) << 24) | ((unint64_t)HIBYTE(bytes[0]) << 16) | ((unint64_t)LOBYTE(bytes[1]) << 8) | BYTE1(bytes[1]);
                CFPrefs_SetInt64(0, CFSTR("CUSystemNameAddress"), v35);
                if (gLogCategory_CUMisc <= 50
                  && (gLogCategory_CUMisc != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMisc, 0x32u)))
                {
                  LogPrintF((uint64_t)&gLogCategory_CUMisc, (uint64_t)"OSStatus CUSetSystemName(CFStringRef, CFStringRef, CUSystemNameFlags)", 0x32u, (uint64_t)"Computer name address: generated=0x%012lX", v36, v37, v38, v39, v35);
                }
              }
            }
            CFStringAppendFormat(MutableCopy, 0, CFSTR("-%02X%02X%02X%02X%02X%02X"), LOBYTE(bytes[0]), BYTE1(bytes[0]), BYTE2(bytes[0]), HIBYTE(bytes[0]), LOBYTE(bytes[1]), BYTE1(bytes[1]));
            a2 = MutableCopy;
          }
        }
        else
        {
          MutableCopy = 0;
        }
LABEL_48:
        if (!SCPreferencesSetHostName())
        {
          if (gLogCategory_CUMisc <= 60
            && (gLogCategory_CUMisc != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMisc, 0x3Cu)))
          {
            SCError();
            LogPrintF((uint64_t)&gLogCategory_CUMisc, (uint64_t)"OSStatus CUSetSystemName(CFStringRef, CFStringRef, CUSystemNameFlags)", 0x3Cu, (uint64_t)"### Set hostname %@' failed: %#m\n", v40, v41, v42, v43, (uint64_t)a2);
          }
          if (!(_DWORD)v12)
            v12 = SCError();
        }
        if (!SCPreferencesSetLocalHostName(v7, a2))
        {
          if (gLogCategory_CUMisc <= 60
            && (gLogCategory_CUMisc != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMisc, 0x3Cu)))
          {
            SCError();
            LogPrintF((uint64_t)&gLogCategory_CUMisc, (uint64_t)"OSStatus CUSetSystemName(CFStringRef, CFStringRef, CUSystemNameFlags)", 0x3Cu, (uint64_t)"### Set locale hostname %@' failed: %#m\n", v44, v45, v46, v47, (uint64_t)a2);
          }
          if (!(_DWORD)v12)
            v12 = SCError();
        }
        goto LABEL_62;
      }
      if (gLogCategory_CUMisc > 60)
      {
        MutableCopy = 0;
        v13 = 0;
LABEL_66:
        if (!SCPreferencesCommitChanges(v7))
        {
          if (gLogCategory_CUMisc <= 60
            && (gLogCategory_CUMisc != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMisc, 0x3Cu)))
          {
            v48 = SCError();
            LogPrintF((uint64_t)&gLogCategory_CUMisc, (uint64_t)"OSStatus CUSetSystemName(CFStringRef, CFStringRef, CUSystemNameFlags)", 0x3Cu, (uint64_t)"### Commit name changes failed: %#m\n", v49, v50, v51, v52, v48);
          }
          if (!(_DWORD)v12)
            v12 = SCError();
        }
        if (!SCPreferencesApplyChanges(v7))
        {
          if (gLogCategory_CUMisc <= 60
            && (gLogCategory_CUMisc != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMisc, 0x3Cu)))
          {
            v53 = SCError();
            LogPrintF((uint64_t)&gLogCategory_CUMisc, (uint64_t)"OSStatus CUSetSystemName(CFStringRef, CFStringRef, CUSystemNameFlags)", 0x3Cu, (uint64_t)"### Apply name changes failed: %#m\n", v54, v55, v56, v57, v53);
          }
          if (!(_DWORD)v12)
            v12 = SCError();
        }
        if (MutableCopy)
          CFRelease(MutableCopy);
        if (v13)
          CFRelease(v13);
        CFRelease(v7);
        return v12;
      }
      if (gLogCategory_CUMisc != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMisc, 0x3Cu))
        LogPrintF((uint64_t)&gLogCategory_CUMisc, (uint64_t)"OSStatus CUSetSystemName(CFStringRef, CFStringRef, CUSystemNameFlags)", 0x3Cu, (uint64_t)"### Convert name to local hostname failed %@'\n", v8, v9, v10, v11, (uint64_t)a1);
    }
    v13 = 0;
    MutableCopy = 0;
LABEL_62:
    if (gLogCategory_CUMisc <= 30
      && (gLogCategory_CUMisc != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMisc, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUMisc, (uint64_t)"OSStatus CUSetSystemName(CFStringRef, CFStringRef, CUSystemNameFlags)", 0x1Eu, (uint64_t)"Setting system name '%@', hostname '%@', flags %#{flags}", v8, v9, v10, v11, (uint64_t)a1);
    }
    goto LABEL_66;
  }
  if (SCError())
    v12 = SCError();
  else
    v12 = 4294960596;
  if (gLogCategory_CUMisc <= 30
    && (gLogCategory_CUMisc != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMisc, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUMisc, (uint64_t)"OSStatus CUSetSystemName(CFStringRef, CFStringRef, CUSystemNameFlags)", 0x1Eu, (uint64_t)"### Create prefs to set name failed: %#m\n", v15, v16, v17, v18, v12);
  }
  return v12;
}

uint64_t init_CSCopyLocalHostnameForComputerName(uint64_t a1, uint64_t a2)
{
  if (MobileCoreServicesLibrary_sOnce_13126 != -1)
    dispatch_once(&MobileCoreServicesLibrary_sOnce_13126, &__block_literal_global_96);
  softLink_CSCopyLocalHostnameForComputerName[0] = (uint64_t (*)())dlsym((void *)MobileCoreServicesLibrary_sLib_13127, "_CSCopyLocalHostnameForComputerName");
  return ((uint64_t (*)(uint64_t, uint64_t))softLink_CSCopyLocalHostnameForComputerName[0])(a1, a2);
}

uint64_t BigIntegerFromInt()
{
  uint64_t v0;

  v0 = CCCreateBigNum();
  if (v0)
    CCBigNumSetI();
  return v0;
}

uint64_t BigIntegerToCstr(uint64_t a1, uint64_t a2)
{
  int v3;
  int v4;
  uint64_t result;
  int v6;

  v3 = CCBigNumBitCount();
  v4 = v3 + 7;
  if (v3 < -7)
    v4 = v3 + 14;
  result = cstr_set_length(a2, v4 >> 3);
  if ((result & 0x80000000) == 0)
  {
    v6 = CCBigNumToData();
    return cstr_set_length(a2, v6);
  }
  return result;
}

void BigIntegerToCstrEx(uint64_t a1, const void **a2, int a3)
{
  int v5;
  int v6;
  size_t v7;

  if ((cstr_set_length((uint64_t)a2, a3) & 0x80000000) == 0)
  {
    v5 = CCBigNumToData();
    v6 = a3 - v5;
    if (a3 > v5)
    {
      v7 = v6;
      memmove((char *)*a2 + v6, *a2, v5);
      bzero((void *)*a2, v7);
    }
  }
}

void sub_18D508720(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18D5087D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t TUInitialize(int a1, char **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  FILE **v8;
  char *v11;
  char *v12;
  uint64_t v13;
  BOOL v14;
  FILE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned __int8 *v33;
  unsigned __int8 *v34;
  unsigned __int8 *v35;
  unsigned __int8 *v36;
  int v37;
  char *v38;
  const char *v39;
  FILE *v40;
  unsigned __int8 *v41;
  unsigned __int8 *v42;
  _BOOL4 v43;
  uint64_t v44;

  v8 = (FILE **)MEMORY[0x1E0C80C20];
  if (a1 >= 1)
  {
    v11 = *a2;
    v12 = strrchr(*a2, 47);
    v13 = (uint64_t)(v12 ? v12 + 1 : v11);
    gTUProgramName = v13;
    if (a1 != 1)
    {
      v24 = 1;
      do
      {
        v25 = v24 + 1;
        v26 = a2[v24];
        if (!strcasecmp(v26, "--BATS"))
        {
          if ((int)v25 >= a1)
            goto LABEL_133;
          v24 += 2;
          v33 = (unsigned __int8 *)a2[v25];
          if (strnicmpx(v33, -1, "true")
            && strnicmpx(v33, -1, "yes")
            && strnicmpx(v33, -1, "y")
            && strnicmpx(v33, -1, "on")
            && strnicmpx(v33, -1, "1"))
          {
            if (strnicmpx(v33, -1, "false")
              && strnicmpx(v33, -1, "no")
              && strnicmpx(v33, -1, "n")
              && strnicmpx(v33, -1, "off")
              && strnicmpx(v33, -1, "0"))
            {
              goto LABEL_132;
            }
            gTUBATSMode = 0;
          }
          else
          {
            gTUBATSMode = 1;
          }
        }
        else if (!strcasecmp(v26, "--BreakOnFail"))
        {
          if ((int)v25 >= a1)
            goto LABEL_133;
          v24 += 2;
          v34 = (unsigned __int8 *)a2[(int)v25];
          if (strnicmpx(v34, -1, "true")
            && strnicmpx(v34, -1, "yes")
            && strnicmpx(v34, -1, "y")
            && strnicmpx(v34, -1, "on")
            && strnicmpx(v34, -1, "1"))
          {
            if (strnicmpx(v34, -1, "false")
              && strnicmpx(v34, -1, "no")
              && strnicmpx(v34, -1, "n")
              && strnicmpx(v34, -1, "off")
              && strnicmpx(v34, -1, "0"))
            {
              goto LABEL_132;
            }
            gTUBreakOnFail = 1;
          }
          else
          {
            gTUBreakOnFail = 0;
          }
        }
        else
        {
          if (!strcasecmp(v26, "--ConvertTURtoJUnit"))
          {
            if ((int)v25 >= a1)
            {
              FPrintF(*v8, "#=error: '%s' option requires an input path argument\n", v27, v28, v29, v30, v31, v32, (uint64_t)v26);
            }
            else
            {
              if (v24 + 2 < a1)
              {
                v43 = TUConvertToJUnit(a2[(int)v25], (CFMutableArrayRef)a2[v24 + 2]) != 0;
                exit(v43);
              }
              FPrintF(*v8, "#=error: '%s' option requires an output path argument\n", v27, v28, v29, v30, v31, v32, (uint64_t)v26);
            }
            exit(1);
          }
          if (!strcasecmp(v26, "--DontRunLeaks"))
          {
            if ((int)v25 >= a1)
              goto LABEL_133;
            v24 += 2;
            v35 = (unsigned __int8 *)a2[(int)v25];
            if (strnicmpx(v35, -1, "true")
              && strnicmpx(v35, -1, "yes")
              && strnicmpx(v35, -1, "y")
              && strnicmpx(v35, -1, "on")
              && strnicmpx(v35, -1, "1"))
            {
              if (strnicmpx(v35, -1, "false")
                && strnicmpx(v35, -1, "no")
                && strnicmpx(v35, -1, "n")
                && strnicmpx(v35, -1, "off")
                && strnicmpx(v35, -1, "0"))
              {
                goto LABEL_132;
              }
              gTUDontRunLeaks = 0;
            }
            else
            {
              gTUDontRunLeaks = 1;
            }
          }
          else if (!strcasecmp(v26, "--ExcludeNonTestUtilsTests"))
          {
            if ((int)v25 >= a1)
              goto LABEL_133;
            v24 += 2;
            v36 = (unsigned __int8 *)a2[(int)v25];
            if (!strnicmpx(v36, -1, "true")
              || !strnicmpx(v36, -1, "yes")
              || !strnicmpx(v36, -1, "y")
              || !strnicmpx(v36, -1, "on")
              || !strnicmpx(v36, -1, "1"))
            {
              goto LABEL_91;
            }
            if (strnicmpx(v36, -1, "false")
              && strnicmpx(v36, -1, "no")
              && strnicmpx(v36, -1, "n")
              && strnicmpx(v36, -1, "off")
              && strnicmpx(v36, -1, "0"))
            {
              goto LABEL_132;
            }
            gTUExcludeNonTestUtilsTests = 0;
          }
          else
          {
            if (!strcasecmp(v26, "--ExcludedTests"))
            {
              if ((int)v25 >= a1)
                goto LABEL_133;
              v24 += 2;
              gTUExcludedTests = (uint64_t)a2[(int)v25];
LABEL_91:
              gTUExcludeNonTestUtilsTests = 1;
              continue;
            }
            if (!strcasecmp(v26, "--Filter"))
            {
              if ((int)v25 >= a1)
                goto LABEL_133;
              v24 += 2;
              gTUFilter = (uint64_t)a2[(int)v25];
              goto LABEL_91;
            }
            if (!strcasecmp(v26, "--JUnitXMLOutputPath"))
            {
              if ((int)v25 >= a1)
                goto LABEL_133;
              v24 += 2;
              gTUJUnitXMLOutputPath = (uint64_t)a2[(int)v25];
            }
            else if (!strcasecmp(v26, "--Level"))
            {
              if ((int)v25 >= a1)
                goto LABEL_133;
              v24 += 2;
              v37 = LUStringToLevel(a2[(int)v25]);
              if (v37 == -1)
                goto LABEL_132;
              gTULogLevel = v37;
            }
            else
            {
              if (!strcasecmp(v26, "--LogControl"))
              {
                if ((int)v25 < a1)
                {
                  v24 += 2;
                  v38 = a2[(int)v25];
                  if (LogControl(v38))
                    FPrintF(*v8, "#=error: LogControl( \"%s\") failed: %#m\n", a3, a4, a5, a6, a7, a8, (uint64_t)v38);
                  continue;
                }
LABEL_133:
                FPrintF(*v8, "#=error: '%s' option requires an argument\n", a3, a4, a5, a6, a7, a8, (uint64_t)v26);
                goto LABEL_134;
              }
              if (!strcasecmp(v26, "--OutputPath"))
              {
                if ((int)v25 < a1)
                {
                  v24 += 2;
                  v39 = a2[(int)v25];
                  v40 = fopen(v39, "w");
                  if (v40 || *__error() && !*__error())
                  {
                    if (gTUOutputFile && fclose((FILE *)gTUOutputFile) && *__error())
                      __error();
                    gTUOutputFile = (uint64_t)v40;
                    gTUOutputFilePtr = (uint64_t)v40;
                    gTUOutputPath = (uint64_t)v39;
                  }
                  else
                  {
                    FPrintF(*v8, "#=error: Open output path '%s' failed: %#m\n", a3, a4, a5, a6, a7, a8, (uint64_t)v39);
                  }
                  continue;
                }
                goto LABEL_133;
              }
              if (!strcasecmp(v26, "--Qualifier"))
              {
                if ((int)v25 >= a1)
                  goto LABEL_133;
                v24 += 2;
                gTUQualifier = (uint64_t)a2[(int)v25];
              }
              else
              {
                if (strcasecmp(v26, "--StopOnFirstFail"))
                {
                  if (strcasecmp(v26, "--UserMode"))
                  {
                    FPrintF(*v8, "#=error: unknown option '%s'\n", a3, a4, a5, a6, a7, a8, (uint64_t)v26);
LABEL_134:
                    ++v24;
                    continue;
                  }
                  if ((int)v25 >= a1)
                    goto LABEL_133;
                  v24 += 2;
                  v42 = (unsigned __int8 *)a2[(int)v25];
                  if (!strnicmpx(v42, -1, "true")
                    || !strnicmpx(v42, -1, "yes")
                    || !strnicmpx(v42, -1, "y")
                    || !strnicmpx(v42, -1, "on")
                    || !strnicmpx(v42, -1, "1"))
                  {
                    gTUUserMode = 1;
                    continue;
                  }
                  if (!strnicmpx(v42, -1, "false")
                    || !strnicmpx(v42, -1, "no")
                    || !strnicmpx(v42, -1, "n")
                    || !strnicmpx(v42, -1, "off")
                    || !strnicmpx(v42, -1, "0"))
                  {
                    gTUUserMode = 0;
                    continue;
                  }
LABEL_132:
                  FPrintF(*v8, "#=error: '%s' option bad argument '%s'\n", a3, a4, a5, a6, a7, a8, (uint64_t)v26);
                  continue;
                }
                if ((int)v25 >= a1)
                  goto LABEL_133;
                v24 += 2;
                v41 = (unsigned __int8 *)a2[(int)v25];
                if (!strnicmpx(v41, -1, "true")
                  || !strnicmpx(v41, -1, "yes")
                  || !strnicmpx(v41, -1, "y")
                  || !strnicmpx(v41, -1, "on")
                  || !strnicmpx(v41, -1, "1"))
                {
                  gTUStopOnFirstFail = 0;
                  continue;
                }
                if (strnicmpx(v41, -1, "false")
                  && strnicmpx(v41, -1, "no")
                  && strnicmpx(v41, -1, "n")
                  && strnicmpx(v41, -1, "off")
                  && strnicmpx(v41, -1, "0"))
                {
                  goto LABEL_132;
                }
                gTUStopOnFirstFail = 1;
              }
            }
          }
        }
      }
      while (v24 < a1);
    }
  }
  if (gTUUserMode)
    LogControl("?.*:level=error");
  if (gTUOutputPath)
    v14 = 1;
  else
    v14 = gTUJUnitXMLOutputPath == 0;
  if (!v14)
    FPrintF(*v8, "#=error: --JUnitXMLOutputPath specified when not using a TU file\n", a3, a4, a5, a6, a7, a8, v44);
  v15 = (FILE *)gTUOutputFilePtr;
  if (!gTUOutputFilePtr)
  {
    v15 = *v8;
    gTUOutputFilePtr = (uint64_t)*v8;
  }
  setvbuf(v15, 0, 1, 0x400uLL);
  setvbuf((FILE *)*MEMORY[0x1E0C80C10], 0, 1, 0x400uLL);
  setvbuf(*v8, 0, 1, 0x400uLL);
  if (gTUBATSMode == 1)
  {
    _TUPrintF("[TOOL] %s\n\n", v16, v17, v18, v19, v20, v21, v22, gTUProgramName);
  }
  else if (!gTUUserMode)
  {
    _TUPrintF("T=\n", v16, v17, v18, v19, v20, v21, v22, v44);
  }
  gTUTotalPasses = 0;
  gTUTotalFailures = 0;
  gTUTotalExpectedTests = 0;
  gTUStartTicks = mach_absolute_time();
  return 0;
}

uint64_t TUConvertToJUnit(const char *a1, CFMutableArrayRef Mutable)
{
  FILE *v4;
  FILE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t appended;
  int v13;
  int v14;
  const CFArrayCallBacks *v15;
  int v16;
  int v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __CFDictionary *v23;
  const char *v24;
  __CFDictionary *v25;
  CFMutableArrayRef v26;
  uint64_t v27;
  uint64_t v28;
  FILE *v29;
  const __CFArray *v30;
  FILE *v31;
  FILE *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  CFIndex v40;
  uint64_t v41;
  int v42;
  CFTypeID TypeID;
  const __CFDictionary *TypedValueAtIndex;
  const __CFDictionary *v45;
  int Int64Ranged;
  int v47;
  int v48;
  int v49;
  double Double;
  int v51;
  CFIndex v52;
  CFTypeID v53;
  const __CFArray *v54;
  const __CFDictionary *v55;
  CFTypeID v56;
  const __CFDictionary *TypedValue;
  uint64_t v58;
  int v59;
  int v60;
  int v61;
  int v62;
  CFTypeID v63;
  const __CFDictionary *v64;
  const __CFArray *v65;
  CFIndex v66;
  CFIndex v67;
  CFIndex v68;
  CFTypeID v69;
  const __CFArray *v70;
  const __CFDictionary *v71;
  CFTypeID v72;
  const __CFDictionary *v73;
  uint64_t v74;
  char *v75;
  char *v76;
  char *v77;
  char *v78;
  unsigned __int8 *v79;
  char *v80;
  CFIndex v81;
  CFIndex v82;
  CFIndex v83;
  CFTypeID v84;
  const __CFArray *v85;
  const __CFDictionary *v86;
  CFTypeID v87;
  const __CFDictionary *v88;
  uint64_t v89;
  char *v90;
  char *v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  FILE *v118;
  FILE *v119;
  __CFArray *cf;
  char *__s1;
  __CFDictionary *theDict;
  CFIndex Count;
  const __CFArray *v124;
  __CFArray *theArray;
  void *v126;
  int64_t v127;
  const char *v128;
  size_t v129;
  const char *v130;
  int64_t v131;
  uint64_t v132;
  unsigned __int8 *v133;
  char *v134[2];

  v126 = 0;
  if (!strcmp(a1, "-"))
  {
    v4 = 0;
    v5 = (FILE *)*MEMORY[0x1E0C80C18];
    goto LABEL_7;
  }
  v4 = fopen(a1, "r");
  v5 = v4;
  if (!v4)
  {
    if (*__error())
    {
      appended = *__error();
      if (!(_DWORD)appended)
      {
        v4 = 0;
        v5 = 0;
        goto LABEL_7;
      }
    }
    else
    {
      appended = 4294960596;
    }
LABEL_176:
    FPrintF((uint64_t (*)(unsigned __int8 *, int64_t, _QWORD))*MEMORY[0x1E0C80C20], "#=error: Convert TestUtils '%s' to JUnit '%s' failed: %#m\n", v6, v7, v8, v9, v10, v11, (uint64_t)a1);
    return appended;
  }
LABEL_7:
  v119 = v4;
  cf = 0;
  __s1 = (char *)Mutable;
  theDict = 0;
  v124 = 0;
  theArray = 0;
  LODWORD(Mutable) = 0;
  v13 = 0;
  v14 = 0;
  v15 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
  while (1)
  {
    v16 = fcopyline(v5, (unint64_t *)&v126, 0);
    if (v16)
      break;
    if ((_DWORD)Mutable)
    {
      appended = 4294960560;
      LODWORD(Mutable) = 1;
    }
    else
    {
      v17 = *(char *)v126;
      if (*(_BYTE *)v126 && *((_BYTE *)v126 + 1) == 61)
      {
        LODWORD(Mutable) = 0;
        v132 = 0;
        v133 = 0;
        v134[0] = 0;
        v130 = 0;
        v131 = 0;
        v129 = 0;
        v127 = 0;
        v128 = 0;
        HIDWORD(v18) = v17;
        LODWORD(v18) = v17 - 84;
        v19 = (char *)v126 + 2;
        switch((v18 >> 1))
        {
          case 0u:
            if (theArray)
              goto LABEL_69;
            LODWORD(Mutable) = 0;
            theArray = CFArrayCreateMutable(0, 0, v15);
            if (theArray)
              goto LABEL_60;
            theArray = 0;
            goto LABEL_89;
          case 3u:
            if (!theArray)
              goto LABEL_68;
            if (!theDict)
            {
              theDict = 0;
              LODWORD(Mutable) = 1;
              goto LABEL_60;
            }
            LODWORD(Mutable) = 0;
            appended = 4294960560;
            break;
          case 8u:
            if (v14)
            {
              LODWORD(Mutable) = 0;
              appended = 4294960566;
              v14 = 1;
              break;
            }
            if (!theDict)
            {
              LODWORD(Mutable) = 0;
              theDict = 0;
              v14 = 0;
              goto LABEL_84;
            }
            if (sscanf(v19, "%lfs", v134) != 1)
            {
              LODWORD(Mutable) = 0;
              v14 = 0;
              goto LABEL_66;
            }
            if (*(double *)v134 < 0.0)
            {
              LODWORD(Mutable) = 0;
              v14 = 0;
              goto LABEL_80;
            }
            v20 = CFDictionarySetDouble(theDict, CFSTR("duration"), *(double *)v134);
            LODWORD(Mutable) = 0;
            if ((_DWORD)v20)
            {
              appended = v20;
              v14 = 0;
              break;
            }
            v14 = 1;
            goto LABEL_60;
          case 9u:
            if (theDict)
            {
              if (v13)
              {
LABEL_70:
                LODWORD(Mutable) = 0;
                appended = 4294960560;
                goto LABEL_77;
              }
              Mutable = cf;
              if (!cf)
              {
                Mutable = CFArrayCreateMutable(0, 0, v15);
                if (!Mutable)
                {
                  cf = 0;
                  v13 = 0;
                  goto LABEL_89;
                }
                CFDictionarySetValue(theDict, CFSTR("failures"), Mutable);
                cf = Mutable;
              }
            }
            else
            {
              Mutable = v124;
              if (!v124)
              {
                v26 = CFArrayCreateMutable(0, 0, v15);
                if (!v26)
                {
                  v124 = 0;
                  goto LABEL_88;
                }
                v124 = v26;
                Mutable = v26;
              }
            }
            v27 = _TUConvertToJUnitParseAssertion((unsigned __int8 *)v19, &v133, &v131, &v130, &v129, &v128, &v127);
            if ((_DWORD)v27)
            {
              appended = v27;
              LODWORD(Mutable) = 0;
              break;
            }
            appended = CFPropertyListAppendFormatted(0, Mutable, (uint64_t)"{%kO=%.*s%kO=%.*s%kO=%.*s}", v7, v8, v9, v10, v11, (uint64_t)CFSTR("type"));
            LODWORD(Mutable) = 0;
            if ((_DWORD)appended)
              break;
            goto LABEL_60;
          case 0xEu:
            if (theDict && v13)
              goto LABEL_70;
            v21 = _TUConvertToJUnitParseAssertion((unsigned __int8 *)v19, &v133, &v131, &v130, &v129, &v128, &v127);
            LODWORD(Mutable) = 0;
            if (!(_DWORD)v21)
              goto LABEL_60;
            appended = v21;
            break;
          case 0xFu:
            if (v13)
            {
              LODWORD(Mutable) = 0;
              appended = 4294960566;
LABEL_77:
              v13 = 1;
              break;
            }
            if (sscanf((const char *)v126 + 2, "%u/%u", (char *)&v132 + 4, &v132) != 2)
            {
              LODWORD(Mutable) = 0;
              v13 = 0;
              goto LABEL_66;
            }
            v6 = HIDWORD(v132);
            if (HIDWORD(v132) > v132)
            {
              LODWORD(Mutable) = 0;
              v13 = 0;
LABEL_80:
              appended = 4294960586;
              break;
            }
            if (!theDict)
            {
              LODWORD(Mutable) = 0;
              theDict = 0;
              v13 = 0;
              goto LABEL_84;
            }
            v22 = CFDictionarySetInt64(theDict, CFSTR("passes"), HIDWORD(v132));
            if ((_DWORD)v22)
            {
              appended = v22;
              LODWORD(Mutable) = 0;
              v13 = 0;
              break;
            }
            v28 = CFDictionarySetInt64(theDict, CFSTR("total"), v132);
            LODWORD(Mutable) = 0;
            if ((_DWORD)v28)
            {
              appended = v28;
              v13 = 0;
              break;
            }
            v13 = 1;
            goto LABEL_60;
          case 0x10u:
            if (!theArray)
              goto LABEL_68;
            if (theDict)
            {
LABEL_69:
              LODWORD(Mutable) = 0;
              appended = 4294960575;
            }
            else
            {
              v23 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
              if (v23)
              {
                theDict = v23;
                if (*v19)
                {
                  v24 = v19;
                  v25 = v23;
                  CFDictionarySetCString(v23, CFSTR("name"), v24, -1);
                  CFArrayAppendValue(theArray, v25);
                  LODWORD(Mutable) = 0;
                  goto LABEL_60;
                }
                LODWORD(Mutable) = 0;
                appended = 4294960552;
              }
              else
              {
LABEL_88:
                LODWORD(Mutable) = 0;
                theDict = 0;
LABEL_89:
                appended = 4294960568;
              }
            }
            break;
          case 0x13u:
            if (!theArray)
            {
LABEL_68:
              theArray = 0;
              LODWORD(Mutable) = 0;
LABEL_84:
              appended = 4294960551;
              break;
            }
            if (!theDict)
            {
              LODWORD(Mutable) = 0;
              theDict = 0;
              goto LABEL_84;
            }
            CFRelease(theDict);
            if (cf)
              CFRelease(cf);
            LODWORD(Mutable) = 0;
            theDict = 0;
            cf = 0;
            v13 = 0;
            v14 = 0;
LABEL_60:
            appended = 0;
            break;
          default:
            goto LABEL_60;
        }
      }
      else
      {
        LODWORD(Mutable) = 0;
LABEL_66:
        appended = 4294960554;
      }
    }
    if (v126)
    {
      free(v126);
      v126 = 0;
    }
    if ((_DWORD)appended)
      goto LABEL_163;
  }
  if (v16 != -6752)
  {
    appended = 4294960550;
    goto LABEL_163;
  }
  if (!(_DWORD)Mutable)
  {
    appended = 4294960560;
    goto LABEL_163;
  }
  LODWORD(v131) = 0;
  v133 = 0;
  v134[0] = 0;
  if (!strcmp(__s1, "-"))
  {
    v32 = 0;
    v31 = (FILE *)*MEMORY[0x1E0C80C20];
    v30 = theArray;
    goto LABEL_98;
  }
  v29 = fopen(__s1, "w");
  v30 = theArray;
  if (v29)
  {
    v31 = v29;
    LODWORD(v131) = 0;
    v32 = v29;
    goto LABEL_98;
  }
  if (!*__error())
  {
    v32 = 0;
    LODWORD(v131) = -6700;
    goto LABEL_154;
  }
  v31 = 0;
  v32 = 0;
  LODWORD(v131) = *__error();
  if (!(_DWORD)v131)
  {
LABEL_98:
    FPrintF(v31, "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n", v6, v7, v8, v9, v10, v11, v112);
    FPrintF(v31, "<testsuites>\n", v33, v34, v35, v36, v37, v38, v113);
    v39 = 0.0;
    v118 = v32;
    if (v30)
    {
      Count = CFArrayGetCount(v30);
      if (Count >= 1)
      {
        v40 = 0;
        LODWORD(v41) = 0;
        v42 = 0;
        while (1)
        {
          TypeID = CFDictionaryGetTypeID();
          TypedValueAtIndex = CFArrayGetTypedValueAtIndex(v30, v40, TypeID, (int *)&v131);
          if ((_DWORD)v131)
            break;
          v45 = TypedValueAtIndex;
          Int64Ranged = CFDictionaryGetInt64Ranged(TypedValueAtIndex, CFSTR("total"), 0, 0xFFFFFFFFLL, (int *)&v131);
          if ((_DWORD)v131)
            break;
          v47 = Int64Ranged;
          v41 = Int64Ranged ? (v41 + 1) : v41;
          v48 = CFDictionaryGetInt64Ranged(v45, CFSTR("passes"), 0, 0xFFFFFFFFLL, (int *)&v131);
          if ((_DWORD)v131)
            break;
          v49 = v48;
          Double = CFDictionaryGetDouble(v45, CFSTR("duration"), &v131);
          if ((_DWORD)v131)
            break;
          if (v47 != v49)
            ++v42;
          v39 = v39 + Double;
          ++v40;
          v30 = theArray;
          if (Count == v40)
          {
            v51 = 1;
            goto LABEL_115;
          }
        }
LABEL_153:
        v32 = v118;
        goto LABEL_154;
      }
      v51 = 0;
    }
    else
    {
      v51 = 0;
      Count = 0;
    }
    v41 = 0;
LABEL_115:
    if (v124)
      CFArrayGetCount(v124);
    FPrintF(v31, "\t<testsuite name=\"AllTests\" tests=\"%u\" failures=\"%u\" time=\"%f\">\n", v6, v7, v8, v9, v10, v11, v41);
    if (v51)
    {
      v52 = 0;
      while (1)
      {
        v53 = CFDictionaryGetTypeID();
        v54 = CFArrayGetTypedValueAtIndex(v30, v52, v53, (int *)&v131);
        if ((_DWORD)v131)
          break;
        v55 = v54;
        v56 = CFStringGetTypeID();
        TypedValue = CFDictionaryGetTypedValue(v55, CFSTR("name"), v56, (int *)&v131);
        if ((_DWORD)v131)
          break;
        v58 = (uint64_t)TypedValue;
        v59 = CFDictionaryGetInt64Ranged(v55, CFSTR("total"), 0, 0xFFFFFFFFLL, (int *)&v131);
        if ((_DWORD)v131)
          break;
        v60 = v59;
        v61 = CFDictionaryGetInt64Ranged(v55, CFSTR("passes"), 0, 0xFFFFFFFFLL, (int *)&v131);
        if ((_DWORD)v131)
          break;
        v62 = v61;
        CFDictionaryGetDouble(v55, CFSTR("duration"), &v131);
        if ((_DWORD)v131)
          break;
        FPrintF(v31, "\t\t<testcase name=\"%@\" classname=\"%@\" time=\"%f\"%s>\n", v6, v7, v8, v9, v10, v11, v58);
        v63 = CFArrayGetTypeID();
        v64 = CFDictionaryGetTypedValue(v55, CFSTR("failures"), v63, 0);
        if ((v60 != v62) != (v64 != 0))
        {
          LODWORD(v131) = -6762;
          goto LABEL_153;
        }
        v65 = v64;
        if (v64)
        {
          v66 = CFArrayGetCount(v64);
          if (v66 >= 1)
          {
            v67 = v66;
            v68 = 0;
            do
            {
              v69 = CFDictionaryGetTypeID();
              v70 = CFArrayGetTypedValueAtIndex(v65, v68, v69, (int *)&v131);
              if ((_DWORD)v131)
                goto LABEL_153;
              v71 = v70;
              v72 = CFStringGetTypeID();
              v73 = CFDictionaryGetTypedValue(v71, CFSTR("type"), v72, (int *)&v131);
              if ((_DWORD)v131)
                goto LABEL_153;
              v74 = (uint64_t)v73;
              v75 = CFDictionaryCopyCString(v71, CFSTR("message"), &v131);
              if ((_DWORD)v131)
                goto LABEL_153;
              v76 = v75;
              LODWORD(v131) = XMLEscapeCopy(v75, v134);
              free(v76);
              if ((_DWORD)v131)
                goto LABEL_153;
              v77 = CFDictionaryCopyCString(v71, CFSTR("detail"), &v131);
              if ((_DWORD)v131)
                goto LABEL_153;
              v78 = v77;
              LODWORD(v131) = XMLEscapeCopy(v77, (char **)&v133);
              free(v78);
              if ((_DWORD)v131)
                goto LABEL_153;
              v79 = v133;
              v80 = v134[0];
              FPrintF(v31, "\t\t\t<failure type=\"%@\" message=\"%s\">%s</failure>\n", v6, v7, v8, v9, v10, v11, v74);
              if (v80)
              {
                free(v80);
                v134[0] = 0;
              }
              if (v79)
              {
                free(v79);
                v133 = 0;
              }
            }
            while (v67 != ++v68);
          }
        }
        v30 = theArray;
        if (v60 != v62)
          FPrintF(v31, "\t\t</testcase>\n", v6, v7, v8, v9, v10, v11, v114);
        if (++v52 == Count)
          goto LABEL_142;
      }
    }
    else
    {
LABEL_142:
      if (v124 && (v81 = CFArrayGetCount(v124), v81 >= 1))
      {
        v82 = v81;
        v83 = 0;
        while (1)
        {
          v84 = CFDictionaryGetTypeID();
          v85 = CFArrayGetTypedValueAtIndex(v124, v83, v84, (int *)&v131);
          if ((_DWORD)v131)
            break;
          v86 = v85;
          v87 = CFStringGetTypeID();
          v88 = CFDictionaryGetTypedValue(v86, CFSTR("type"), v87, (int *)&v131);
          if ((_DWORD)v131)
            break;
          v89 = (uint64_t)v88;
          v90 = CFDictionaryCopyCString(v86, CFSTR("message"), &v131);
          if ((_DWORD)v131)
            break;
          v91 = v90;
          LODWORD(v131) = XMLEscapeCopy(v90, v134);
          free(v91);
          if ((_DWORD)v131)
            break;
          FPrintF(v31, "\t\t<testcase name=\"global.%@\" classname=\"global.%@\">\n", v6, v7, v8, v9, v10, v11, v89);
          v92 = v134[0];
          FPrintF(v31, "\t\t\t<failure type=\"%@\" message=\"%s\"/>\n", v93, v94, v95, v96, v97, v98, v89);
          FPrintF(v31, "\t\t</testcase>\n", v99, v100, v101, v102, v103, v104, v115);
          if (v92)
          {
            free(v92);
            v134[0] = 0;
          }
          if (v82 == ++v83)
            goto LABEL_152;
        }
      }
      else
      {
LABEL_152:
        FPrintF(v31, "\t</testsuite>\n", v6, v7, v8, v9, v10, v11, v114);
        FPrintF(v31, "</testsuites>\n", v105, v106, v107, v108, v109, v110, v116);
        LODWORD(v131) = 0;
      }
    }
    goto LABEL_153;
  }
LABEL_154:
  if (v134[0])
    free(v134[0]);
  if (v133)
    free(v133);
  if (v32 && fclose(v32) && *__error())
    __error();
  appended = v131;
LABEL_163:
  if (v119 && fclose(v119) && *__error())
    __error();
  if (theArray)
    CFRelease(theArray);
  if (v124)
    CFRelease(v124);
  if (theDict)
    CFRelease(theDict);
  if (cf)
    CFRelease(cf);
  if ((_DWORD)appended)
    goto LABEL_176;
  return appended;
}

uint64_t _TUPrintF(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return VCPrintF((uint64_t (*)(unsigned __int8 *, int64_t, _QWORD))_TUPrintFCallback, 0, a1, (uint64_t)&a9, a5, a6, a7, a8);
}

uint64_t _TUPrintFCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    if (gTUOutputFilePtr)
      FPrintF((uint64_t (*)(unsigned __int8 *, int64_t, _QWORD))gTUOutputFilePtr, "%.*s", a3, a4, a5, a6, a7, a8, a2);
    if (!gTUUserMode && (gTUBATSMode & 1) == 0)
      FPrintF((uint64_t (*)(unsigned __int8 *, int64_t, _QWORD))*MEMORY[0x1E0C80C10], "%.*s", a3, a4, a5, a6, a7, a8, a2);
  }
  return a2;
}

uint64_t _TUConvertToJUnitParseAssertion(unsigned __int8 *a1, unsigned __int8 **a2, int64_t *a3, const char **a4, size_t *a5, const char **a6, int64_t *a7)
{
  unsigned __int8 *i;
  int v15;
  int64_t v16;
  const char *v17;
  const char *j;
  const char **v19;
  int64_t v20;
  const char *v21;
  const char *v22;
  int v23;
  int v24;
  uint64_t v26;
  uint64_t v27;
  int v28;
  size_t v29;
  uint64_t result;
  int64_t *v31;
  size_t *v32;

  for (i = a1; ; ++i)
  {
    v15 = *i;
    if (!*i || v15 == 58)
      break;
  }
  if (v15 != 58)
    return 4294960554;
  v16 = i - a1;
  v17 = (const char *)(i + 1);
  if (strnicmpx(a1, i - a1, "leaks") && strnicmpx(a1, i - a1, "total"))
  {
    for (j = (const char *)(i + 2); *(j - 1); ++j)
    {
      if (*(j - 1) == 44)
      {
        v32 = a5;
        do
        {
          v22 = j;
          v24 = *(unsigned __int8 *)j++;
          v23 = v24;
        }
        while (v24 != 44 && v23 != 0);
        v31 = a7;
        if (v23 == 44)
        {
          v19 = a6;
          v20 = v22 - v17;
          v26 = MEMORY[0x1E0C80978];
          do
          {
            v21 = j;
            v27 = *(unsigned __int8 *)j;
            if (!*j)
              break;
            v28 = (v27 & 0x80) != 0 ? __maskrune(v27, 0x4000uLL) : *(_DWORD *)(v26 + 4 * v27 + 60) & 0x4000;
            j = v21 + 1;
          }
          while (v28);
          a7 = v31;
          goto LABEL_27;
        }
        return 4294960554;
      }
    }
    return 4294960554;
  }
  v32 = a5;
  v19 = a6;
  v20 = 0;
  v21 = v17;
  v17 = 0;
LABEL_27:
  v29 = strlen(v21);
  result = 0;
  *a2 = a1;
  *a3 = v16;
  *a4 = v21;
  *v32 = v29;
  *v19 = v17;
  *a7 = v20;
  return result;
}

void TUFinalize(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  uint64_t v9;
  pid_t v10;
  FILE *v11;
  uint64_t v12;
  pid_t v13;
  FILE *v14;
  std::error_code *v15;
  size_t v16;
  int v17;
  uint64_t v18;
  FILE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  unint64_t v26;
  int v27;
  unsigned int v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  char *i;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  char v47;
  int v48;
  BOOL v49;
  int v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  unsigned int v62;
  void *v63;
  _BOOL4 v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  _BYTE __ptr[128];
  std::__fs::filesystem::path __filename[2];
  char __str[64];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  if ((gTUDontRunLeaks & 1) != 0)
    goto LABEL_65;
  v8 = gTUBreakOnFail;
  v68 = 0;
  if (gTUBATSMode == 1)
    _TUPrintF("[BEGIN] Leaks\n", a2, a3, a4, a5, a6, a7, a8, v66);
  v9 = mach_absolute_time();
  v10 = getpid();
  snprintf(__str, 0x40uLL, "/usr/bin/leaks %d", v10);
  v11 = popen(__str, "r");
  if (!v11)
  {
    if (*__error())
    {
      v12 = *__error();
      if (!(_DWORD)v12)
        goto LABEL_7;
    }
    else
    {
      v12 = 4294960596;
    }
LABEL_31:
    v26 = mach_absolute_time() - v9;
    do
LABEL_37:
      v28 = __ldaxr((unsigned int *)&gTUTotalFailures);
    while (__stlxr(v28 + 1, (unsigned int *)&gTUTotalFailures));
    if ((gTUUserMode != 0) | gTUBATSMode & 1)
      v29 = "### Leaks: FAILED: ";
    else
      v29 = "f=leaks:";
    _TUPrintF((unsigned __int8 *)v29, a2, a3, a4, a5, a6, a7, a8, v66);
    v27 = 0;
    goto LABEL_42;
  }
LABEL_7:
  v13 = getpid();
  snprintf((char *)__filename, 0x40uLL, "/tmp/leaks-%d-output", v13);
  v14 = fopen((const char *)__filename, "w");
  if (v14)
    goto LABEL_10;
  if (!*__error())
  {
    v14 = 0;
    v17 = 1;
    v12 = 4294960596;
    if (!v11)
      goto LABEL_29;
    goto LABEL_28;
  }
  v12 = *__error();
  if ((_DWORD)v12)
  {
    v14 = 0;
    v17 = 1;
    if (v11)
      goto LABEL_28;
LABEL_29:
    if (v14)
    {
      fclose(v14);
      if ((v17 & 1) != 0)
        goto LABEL_31;
    }
    else if (v17)
    {
      goto LABEL_31;
    }
LABEL_122:
    v25 = 0;
    goto LABEL_34;
  }
LABEL_10:
  while (1)
  {
    v16 = fread(__ptr, 1uLL, 0x80uLL, v11);
    if (!v16)
      break;
    if (fwrite(__ptr, 1uLL, v16, v14) != v16)
    {
      v17 = 0;
      v12 = 4294960549;
      if (!v11)
        goto LABEL_29;
LABEL_28:
      pclose(v11);
      goto LABEL_29;
    }
  }
  fclose(v14);
  v18 = pclose(v11);
  v12 = v18;
  if (!(_DWORD)v18)
    goto LABEL_33;
  if ((_DWORD)v18 == -1)
  {
    __error();
    goto LABEL_18;
  }
  if ((v18 & 0xFF00) == 0)
  {
    v12 = 0;
LABEL_33:
    v25 = 1;
    goto LABEL_34;
  }
LABEL_18:
  if (gTULogLevel > 50)
  {
LABEL_25:
    v25 = 0;
    v12 = 0;
    goto LABEL_34;
  }
  v19 = fopen((const char *)__filename, "r");
  if (v19)
  {
LABEL_22:
    while (1)
    {
      v20 = fcopyline(v19, (unint64_t *)&v68, 0);
      if ((_DWORD)v20)
        break;
      TULogF(v20, 50, "Leaks: ", "%s", v21, v22, v23, v24, (uint64_t)v68);
      free(v68);
    }
    fclose(v19);
    goto LABEL_25;
  }
  if (*__error())
  {
    v12 = *__error();
    if (!(_DWORD)v12)
      goto LABEL_22;
    goto LABEL_122;
  }
  v25 = 0;
  v12 = 4294960596;
LABEL_34:
  remove(__filename, v15);
  v26 = mach_absolute_time() - v9;
  if ((v25 & 1) == 0)
    goto LABEL_37;
  if (gTULogLevel <= 50)
  {
    if ((gTUUserMode != 0) | gTUBATSMode & 1)
      v51 = "Leaks: passed";
    else
      v51 = "p=leaks:";
    _TUPrintF((unsigned __int8 *)v51, a2, a3, a4, a5, a6, a7, a8, v66);
    v27 = 1;
    if (gTUUserMode)
    {
LABEL_48:
      if ((_DWORD)v12)
        _TUPrintF(", %#m", v30, v31, v32, v33, v34, v35, v36, v12);
      _TUPrintF("\n", v30, v31, v32, v33, v34, v35, v36, v67);
      goto LABEL_51;
    }
LABEL_42:
    v37 = "/Library/Caches/com.apple.xbs/Sources/CoreUtils/CoreUtils/TestUtils.c";
    for (i = "Library/Caches/com.apple.xbs/Sources/CoreUtils/CoreUtils/TestUtils.c"; ; ++i)
    {
      if (*(i - 1) == 47)
      {
        v37 = i;
      }
      else if (!*(i - 1))
      {
        _TUPrintF("%s:%ld, %###s()", v30, v31, v32, v33, v34, v35, v36, (uint64_t)v37);
        goto LABEL_48;
      }
    }
  }
  v27 = 1;
LABEL_51:
  if (gTUBATSMode == 1)
  {
    if (sUpTicksToSecondsOnce != -1)
      dispatch_once_f(&sUpTicksToSecondsOnce, &sUpTicksToSecondsMultiplier, (dispatch_function_t)_UpTicksToSecondsInit);
    _TUPrintF("# %.6f seconds\n", a2, a3, a4, a5, a6, a7, a8, COERCE__INT64(*(double *)&sUpTicksToSecondsMultiplier * (double)v26));
    v46 = "[FAIL]";
    if (v27)
      v46 = "[PASS]";
    _TUPrintF("%s Leaks\n\n", v39, v40, v41, v42, v43, v44, v45, (uint64_t)v46);
  }
  if (gTUXCTestFailer)
    v47 = v27;
  else
    v47 = 1;
  if ((v47 & 1) == 0)
    (*(void (**)(void))(gTUXCTestFailer + 16))();
  if (((v27 | v8) & 1) == 0 && DebugIsDebuggerPresent())
    __debugbreak();
LABEL_65:
  if (gTUBATSMode == 1)
  {
    _TUPrintF("[SUMMARY]\n", a2, a3, a4, a5, a6, a7, a8, v66);
    v48 = gTUBATSMode;
  }
  else
  {
    v48 = 0;
  }
  if (gTUUserMode)
    v49 = 0;
  else
    v49 = v48 == 0;
  if (!v49)
  {
    if (gTUTotalFailures)
    {
      v50 = gTUTotalExpectedTests;
      goto LABEL_75;
    }
    v50 = gTUTotalExpectedTests;
    if (gTUTotalPasses < gTUTotalExpectedTests)
    {
LABEL_75:
      if (v50 < 1)
        _TUPrintF("### %d tests failed, %d tests passed\n", a2, a3, a4, a5, a6, a7, a8, gTUTotalFailures);
      else
        _TUPrintF("### %d tests failed, %d of %d tests passed\n", a2, a3, a4, a5, a6, a7, a8, gTUTotalFailures);
      goto LABEL_88;
    }
    if (gTUUserMode)
      _TUPrintF("\n", a2, a3, a4, a5, a6, a7, a8, v66);
    v52 = gTUSuitePasses;
    mach_absolute_time();
    if (sUpTicksToSecondsOnce != -1)
      dispatch_once_f(&sUpTicksToSecondsOnce, &sUpTicksToSecondsMultiplier, (dispatch_function_t)_UpTicksToSecondsInit);
    _TUPrintF("All %d suites, %d tests passed (%.6f seconds)\n", v53, v54, v55, v56, v57, v58, v59, v52);
  }
LABEL_88:
  v60 = (gTUTotalFailures + gTUTotalPasses);
  if (gTUTotalFailures + gTUTotalPasses && (!gTUTotalExpectedTests || (_DWORD)v60 == gTUTotalExpectedTests))
  {
    if (gTULogLevel <= 30)
    {
      if (gTUUserMode || gTUBATSMode)
        _TUPrintF("Total tests matched expected: %d total tests\n", a2, a3, a4, a5, a6, a7, a8, v60);
      _TUPrintF("p=total:%d/%d\n", a2, a3, a4, a5, a6, a7, a8, v60);
    }
  }
  else
  {
    if ((gTUUserMode != 0) | gTUBATSMode & 1)
      v61 = "### Total tests mismatch: %d actual vs %d expected\n";
    else
      v61 = "f=total:%d/%d\n";
    _TUPrintF((unsigned __int8 *)v61, a2, a3, a4, a5, a6, a7, a8, v60);
    do
      v62 = __ldaxr((unsigned int *)&gTUTotalFailures);
    while (__stlxr(v62 + 1, (unsigned int *)&gTUTotalFailures));
  }
  if (!gTUUserMode && (gTUBATSMode & 1) == 0)
    _TUPrintF("Z=\n", a2, a3, a4, a5, a6, a7, a8, v66);
  if (gTUOutputFilePtr)
    fflush((FILE *)gTUOutputFilePtr);
  fflush((FILE *)*MEMORY[0x1E0C80C10]);
  fflush((FILE *)*MEMORY[0x1E0C80C20]);
  if (gTUOutputFile)
  {
    if (fclose((FILE *)gTUOutputFile) && *__error())
      __error();
    gTUOutputFile = 0;
  }
  gTUOutputFilePtr = 0;
  if (gTUOutputPath && gTUJUnitXMLOutputPath)
    TUConvertToJUnit((const char *)gTUOutputPath, (CFMutableArrayRef)gTUJUnitXMLOutputPath);
  v63 = (void *)gTUXCTestFailer;
  gTUXCTestFailer = 0;

  v65 = gTUTotalPasses < 1 || gTUTotalFailures != 0;
  gTUExitCode = v65;
}

uint64_t TULogF(uint64_t a1, int a2, const char *a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  const char *v9;
  uint64_t result;
  _QWORD v11[2];

  if (gTULogLevel <= a2)
  {
    v9 = "";
    if (a3)
      v9 = a3;
    v11[0] = v9;
    v11[1] = 0;
    return VCPrintF((uint64_t (*)(unsigned __int8 *, int64_t, _QWORD))_TULogPrintFCallback, (uint64_t (*)(unsigned __int8 *, int64_t, _QWORD))v11, a4, (uint64_t)&a9, a5, a6, a7, a8);
  }
  return result;
}

uint64_t _TULogPrintFCallback(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v9;
  unint64_t v10;
  const char *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;

  if (a2 >= 1)
  {
    v9 = a1;
    v10 = a1 + a2;
    do
    {
      if (!*(_BYTE *)(a3 + 8))
      {
        v11 = "";
        if (!gTUUserMode)
          v11 = "#=";
        FPrintF((uint64_t (*)(unsigned __int8 *, int64_t, _QWORD))gTUOutputFilePtr, "%s%s", a3, a4, a5, a6, a7, a8, (uint64_t)v11);
        *(_BYTE *)(a3 + 8) = 1;
      }
      v12 = v9;
      v13 = v9;
      if (v9 >= v10)
      {
LABEL_12:
        FPrintF((uint64_t (*)(unsigned __int8 *, int64_t, _QWORD))gTUOutputFilePtr, "%.*s", a3, a4, a5, a6, a7, a8, v12 - v9);
        v9 = v13;
      }
      else
      {
        v14 = 0;
        while (1)
        {
          v15 = v9 + v14;
          if (*(_BYTE *)(v9 + v14) == 10)
            break;
          if (v10 - v9 == ++v14)
          {
            v12 = v10;
            v13 = v10;
            goto LABEL_12;
          }
        }
        FPrintF((uint64_t (*)(unsigned __int8 *, int64_t, _QWORD))gTUOutputFilePtr, "%.*s", a3, a4, a5, a6, a7, a8, v14);
        v9 = v15 + 1;
        FPrintF((uint64_t (*)(unsigned __int8 *, int64_t, _QWORD))gTUOutputFilePtr, "\n", v16, v17, v18, v19, v20, v21, v24);
        *(_BYTE *)(a3 + 8) = 0;
      }
    }
    while (v9 < v10);
  }
  if (!a2 && *(_BYTE *)(a3 + 8))
  {
    FPrintF((uint64_t (*)(unsigned __int8 *, int64_t, _QWORD))gTUOutputFilePtr, "\n", a3, a4, a5, a6, a7, a8, v23);
    *(_BYTE *)(a3 + 8) = 0;
  }
  return a2;
}

BOOL TULogLevelEnabled(uint64_t a1, int a2)
{
  return gTULogLevel <= a2;
}

void _TUXCTestSetup(void *a1)
{
  void *v1;
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(a1, "copy");
  v1 = _Block_copy(v3);
  v2 = (void *)gTUXCTestFailer;
  gTUXCTestFailer = (uint64_t)v1;

}

uint64_t TUSetExpectedTestCount(uint64_t result)
{
  gTUTotalExpectedTests = result;
  return result;
}

size_t _TUPerformTest(_BYTE *a1, void (*a2)(__int128 *), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned __int8 *v10;
  size_t v11;
  size_t v12;
  _BYTE *v13;
  unsigned __int8 *v14;
  size_t result;
  unsigned __int8 *v16;
  unsigned __int8 *v17;
  int64_t v18;
  unsigned __int8 *v19;
  unsigned __int8 *v20;
  FILE **v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  int v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  int *v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;

  v55 = xmmword_1E25DF278;
  v56 = unk_1E25DF288;
  v10 = (unsigned __int8 *)gTUExcludedTests;
  if (!gTUExcludedTests)
  {
LABEL_12:
    v16 = (unsigned __int8 *)gTUFilter;
    if (gTUFilter)
    {
      result = strlen((const char *)gTUFilter);
      v17 = (unsigned __int8 *)(gTUFilter + result);
      do
      {
        if (v16 >= v17)
        {
LABEL_18:
          v19 = v17;
          v20 = v17;
          if (v16 == v17)
            return result;
        }
        else
        {
          v18 = v17 - v16;
          v19 = v16;
          while (*v19 != 44)
          {
            ++v19;
            if (!--v18)
              goto LABEL_18;
          }
          v20 = v19 + 1;
        }
        result = strnicmpx(v16, v19 - v16, a1);
        v16 = v20;
      }
      while ((_DWORD)result);
    }
    v21 = (FILE **)MEMORY[0x1E0C80C20];
    if (!gTUOutputFilePtr)
      gTUOutputFilePtr = *MEMORY[0x1E0C80C20];
    *(_QWORD *)&v55 = a1;
    v22 = gTUQualifier;
    if (gTUQualifier)
    {
      if ((gTUBATSMode & 1) != 0)
      {
        if (*(_BYTE *)gTUQualifier)
        {
          _TUPrintF("[BEGIN] %s.%s\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, (uint64_t)a1);
          goto LABEL_41;
        }
        goto LABEL_29;
      }
      if (*(_BYTE *)gTUQualifier)
        v23 = gTUQualifier;
      else
        v23 = 0;
      if (gTUUserMode)
      {
        v22 = v23;
        goto LABEL_41;
      }
      if (*(_BYTE *)gTUQualifier)
      {
        _TUPrintF("t=%s.%s\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, (uint64_t)a1);
        goto LABEL_41;
      }
    }
    else
    {
      if ((gTUBATSMode & 1) != 0)
      {
LABEL_29:
        _TUPrintF("[BEGIN] %s\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, (uint64_t)a1);
LABEL_40:
        v22 = 0;
LABEL_41:
        v24 = (void *)MEMORY[0x18D78EB2C]();
        v25 = mach_absolute_time();
        a2(&v55);
        v26 = mach_absolute_time() - v25;
        objc_autoreleasePoolPop(v24);
        if ((_DWORD)v56)
          v34 = DWORD1(v56) == 0;
        else
          v34 = 0;
        v35 = v34;
        if (gTUUserMode)
        {
          if (v35)
            v36 = "";
          else
            v36 = "### ";
          if (sUpTicksToSecondsOnce != -1)
            dispatch_once_f(&sUpTicksToSecondsOnce, &sUpTicksToSecondsMultiplier, (dispatch_function_t)_UpTicksToSecondsInit);
          _TUPrintF("%s%s: %s (%.6f seconds)\n", v27, v28, v29, v30, v31, v32, v33, (uint64_t)v36);
          goto LABEL_66;
        }
        if (gTUBATSMode == 1)
        {
          if (sUpTicksToSecondsOnce != -1)
            dispatch_once_f(&sUpTicksToSecondsOnce, &sUpTicksToSecondsMultiplier, (dispatch_function_t)_UpTicksToSecondsInit);
          _TUPrintF("# %.6f seconds\n", v27, v28, v29, v30, v31, v32, v33, COERCE__INT64(*(double *)&sUpTicksToSecondsMultiplier * (double)v26));
          v44 = "[FAIL]";
          if (v35)
            v44 = "[PASS]";
          if (v22)
          {
            _TUPrintF("%s %s.%s\n\n", v37, v38, v39, v40, v41, v42, v43, (uint64_t)v44);
LABEL_66:
            v53 = (int *)&gTUSuiteFailures;
            if (v35)
              v53 = &gTUSuitePasses;
            ++*v53;
            if (gTUOutputFilePtr)
              fflush((FILE *)gTUOutputFilePtr);
            fflush((FILE *)*MEMORY[0x1E0C80C10]);
            return fflush(*v21);
          }
          v54 = (uint64_t)v44;
          v52 = "%s %s\n\n";
        }
        else
        {
          _TUPrintF("r=%u/%u\n", v27, v28, v29, v30, v31, v32, v33, v56);
          if (sUpTicksToSecondsOnce != -1)
            dispatch_once_f(&sUpTicksToSecondsOnce, &sUpTicksToSecondsMultiplier, (dispatch_function_t)_UpTicksToSecondsInit);
          _TUPrintF("d=%fs\n", v45, v46, v47, v48, v49, v50, v51, COERCE__INT64(*(double *)&sUpTicksToSecondsMultiplier * (double)v26));
          v52 = "z=\n";
        }
        _TUPrintF((unsigned __int8 *)v52, v37, v38, v39, v40, v41, v42, v43, v54);
        goto LABEL_66;
      }
      if (gTUUserMode)
        goto LABEL_40;
    }
    _TUPrintF("t=%s\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, (uint64_t)a1);
    goto LABEL_40;
  }
  v11 = gTUExcludedTests + strlen((const char *)gTUExcludedTests);
  do
  {
    if ((unint64_t)v10 >= v11)
    {
LABEL_7:
      v13 = (_BYTE *)v11;
      v14 = (unsigned __int8 *)v11;
      if (v10 == (unsigned __int8 *)v11)
        goto LABEL_12;
    }
    else
    {
      v12 = v11 - (_QWORD)v10;
      v13 = v10;
      while (*v13 != 44)
      {
        ++v13;
        if (!--v12)
          goto LABEL_7;
      }
      v14 = v13 + 1;
    }
    result = strnicmpx(v10, v13 - v10, a1);
    v10 = v14;
  }
  while ((_DWORD)result);
  return result;
}

uint64_t TUTestRequire(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  int v9;
  int *v11;
  unsigned int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t i;
  uint64_t v26;

  v8 = a4;
  v9 = a3;
  if ((*(_BYTE *)(a1 + 28) & 8) == 0)
  {
    v11 = &gTUTotalFailures;
    if ((_DWORD)a3)
      v11 = &gTUTotalPasses;
    do
      v12 = __ldaxr((unsigned int *)v11);
    while (__stlxr(v12 + 1, (unsigned int *)v11));
    if ((_DWORD)a3)
      v13 = *(_DWORD *)(a1 + 20);
    else
      v13 = *(_DWORD *)(a1 + 20) + 1;
    *(_DWORD *)(a1 + 16) += a3 != 0;
    *(_DWORD *)(a1 + 20) = v13;
  }
  if ((_DWORD)a3)
  {
    v14 = 0;
    if (gTULogLevel > 30)
      return v14;
  }
  else if ((a2 & 1) == 0 && ((gTUStopOnFirstFail & 1) != 0 || (*(_BYTE *)(a1 + 28) & 4) != 0))
  {
    v14 = 0;
  }
  else
  {
    v14 = 4294960544;
  }
  if ((*(_BYTE *)(a1 + 28) & 8) != 0)
    goto LABEL_38;
  if (gTUUserMode || gTUBATSMode)
  {
    if ((_DWORD)a3)
      v23 = "";
    else
      v23 = "### ";
    _TUPrintF((unsigned __int8 *)v23, a2, a3, a4, a5, a6, a7, a8, v26);
  }
  else
  {
    v15 = 102;
    if ((_DWORD)a3)
      v15 = 112;
    _TUPrintF("%c=BOOL:", a2, a3, a4, a5, a6, a7, a8, v15);
  }
  for (i = v8 + 1; *(_BYTE *)(i - 1) == 47; ++i)
  {
    v8 = i;
LABEL_32:
    ;
  }
  if (*(_BYTE *)(i - 1))
    goto LABEL_32;
  _TUPrintF("%s:%ld, %###s(), %''s\n", v16, v17, v18, v19, v20, v21, v22, v8);
  if (v9 || (gTUBreakOnFail & 1) != 0)
  {
LABEL_38:
    if (!v9)
      goto LABEL_39;
    return v14;
  }
  if ((*(_BYTE *)(a1 + 28) & 2) == 0 && DebugIsDebuggerPresent())
  {
    __debugbreak();
    JUMPOUT(0x18D50B2D0);
  }
LABEL_39:
  if (!*(_DWORD *)(a1 + 24))
    *(_DWORD *)(a1 + 24) = -6737;
  if ((*(_BYTE *)(a1 + 28) & 8) == 0 && gTUXCTestFailer)
    (*(void (**)(void))(gTUXCTestFailer + 16))();
  return v14;
}

uint64_t TUTestRequireNoErr(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  int v9;
  int *v11;
  unsigned int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t i;
  uint64_t v26;

  v8 = a4;
  v9 = a3;
  if ((*(_BYTE *)(a1 + 28) & 8) == 0)
  {
    v11 = &gTUTotalFailures;
    if (!(_DWORD)a3)
      v11 = &gTUTotalPasses;
    do
      v12 = __ldaxr((unsigned int *)v11);
    while (__stlxr(v12 + 1, (unsigned int *)v11));
    if ((_DWORD)a3)
      v13 = *(_DWORD *)(a1 + 20) + 1;
    else
      v13 = *(_DWORD *)(a1 + 20);
    *(_DWORD *)(a1 + 16) += a3 == 0;
    *(_DWORD *)(a1 + 20) = v13;
  }
  if ((_DWORD)a3)
  {
    v14 = a3;
    if ((a2 & 1) == 0)
    {
      if ((gTUStopOnFirstFail & 1) != 0)
      {
        v14 = 0;
      }
      else if ((*(_BYTE *)(a1 + 28) & 4) != 0)
      {
        v14 = 0;
      }
      else
      {
        v14 = a3;
      }
    }
  }
  else
  {
    v14 = 0;
    if (gTULogLevel > 30)
      return v14;
  }
  if ((*(_BYTE *)(a1 + 28) & 8) != 0)
    goto LABEL_39;
  if (gTUUserMode || gTUBATSMode)
  {
    if ((_DWORD)a3)
      v23 = "### ";
    else
      v23 = "";
    _TUPrintF((unsigned __int8 *)v23, a2, a3, a4, a5, a6, a7, a8, v26);
  }
  else
  {
    v15 = 102;
    if (!(_DWORD)a3)
      v15 = 112;
    _TUPrintF("%c=err:", a2, a3, a4, a5, a6, a7, a8, v15);
  }
  for (i = v8 + 1; *(_BYTE *)(i - 1) == 47; ++i)
  {
    v8 = i;
LABEL_33:
    ;
  }
  if (*(_BYTE *)(i - 1))
    goto LABEL_33;
  _TUPrintF("%s:%ld, %###s(), %#m\n", v16, v17, v18, v19, v20, v21, v22, v8);
  if (!v9 || (gTUBreakOnFail & 1) != 0)
  {
LABEL_39:
    if (v9)
      goto LABEL_40;
    return v14;
  }
  if ((*(_BYTE *)(a1 + 28) & 2) == 0 && DebugIsDebuggerPresent())
  {
    __debugbreak();
    JUMPOUT(0x18D50B494);
  }
LABEL_40:
  if (!*(_DWORD *)(a1 + 24))
    *(_DWORD *)(a1 + 24) = v9;
  if ((*(_BYTE *)(a1 + 28) & 8) == 0 && gTUXCTestFailer)
    (*(void (**)(void))(gTUXCTestFailer + 16))();
  return v14;
}

BOOL TUTestRequireNoNSError(uint64_t a1, char a2, int a3, void *a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  int *v17;
  unsigned int v18;
  int v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t i;
  uint64_t v32;

  v16 = a4;
  if ((*(_BYTE *)(a1 + 28) & 8) == 0)
  {
    v17 = &gTUTotalFailures;
    if (a3)
      v17 = &gTUTotalPasses;
    do
      v18 = __ldaxr((unsigned int *)v17);
    while (__stlxr(v18 + 1, (unsigned int *)v17));
    v19 = *(_DWORD *)(a1 + 20) + (a3 ^ 1);
    *(_DWORD *)(a1 + 16) += a3;
    *(_DWORD *)(a1 + 20) = v19;
  }
  if ((a3 & 1) != 0)
  {
    v20 = 0;
    if (gTULogLevel > 30)
      goto LABEL_35;
  }
  else
  {
    v20 = (a2 & 1) != 0 || (gTUStopOnFirstFail & 1) == 0 && (*(_BYTE *)(a1 + 28) & 4) == 0;
  }
  if ((*(_BYTE *)(a1 + 28) & 8) == 0)
  {
    if (gTUUserMode || gTUBATSMode)
    {
      if (a3)
        v29 = "";
      else
        v29 = "### ";
      _TUPrintF((unsigned __int8 *)v29, v9, v10, v11, v12, v13, v14, v15, v32);
    }
    else
    {
      v21 = 102;
      if (a3)
        v21 = 112;
      _TUPrintF("%c=err:", v9, v10, v11, v12, v13, v14, v15, v21);
    }
    for (i = a5 + 1; ; ++i)
    {
      if (*(_BYTE *)(i - 1) == 47)
      {
        a5 = i;
      }
      else if (!*(_BYTE *)(i - 1))
      {
        _TUPrintF("%s:%ld, %###s(), %{error}\n", v22, v23, v24, v25, v26, v27, v28, a5);
        if ((a3 & 1) == 0
          && (gTUBreakOnFail & 1) == 0
          && (*(_BYTE *)(a1 + 28) & 2) == 0
          && DebugIsDebuggerPresent())
        {
          __debugbreak();
        }
        break;
      }
    }
  }
LABEL_35:
  if (v16 && !*(_DWORD *)(a1 + 24))
  {
    *(_DWORD *)(a1 + 24) = NSErrorToOSStatusEx(v16, 0);
    if ((a3 & 1) != 0)
      goto LABEL_42;
  }
  else if ((a3 & 1) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)(a1 + 28) & 8) == 0 && gTUXCTestFailer)
    (*(void (**)(void))(gTUXCTestFailer + 16))();
LABEL_42:

  return v20;
}

uint64_t TULogV(uint64_t a1, int a2, const char *a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const char *v8;
  uint64_t result;
  _QWORD v10[2];

  v8 = "";
  if (a3)
    v8 = a3;
  v10[0] = v8;
  if (gTULogLevel <= a2)
  {
    v10[1] = 0;
    return VCPrintF((uint64_t (*)(unsigned __int8 *, int64_t, _QWORD))_TULogPrintFCallback, (uint64_t (*)(unsigned __int8 *, int64_t, _QWORD))v10, a4, a5, a5, a6, a7, a8);
  }
  return result;
}

uint64_t TUFaultEnable(char *a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  char *v6;
  uint64_t v7;
  const char **v8;
  const char **v10;

  v10 = 0;
  pthread_mutex_lock(&gTUFaultLock);
  if (!_TUFaultLookup(a1, &v10))
  {
    v7 = 0;
    *((_QWORD *)*v10 + 2) = a2;
    goto LABEL_6;
  }
  v4 = malloc_type_calloc(1uLL, 0x18uLL, 0x103004013764637uLL);
  if (!v4)
  {
LABEL_8:
    v7 = 4294960568;
    goto LABEL_6;
  }
  v5 = v4;
  v6 = strdup(a1);
  v5[1] = v6;
  if (!v6)
  {
    free(v5);
    goto LABEL_8;
  }
  v7 = 0;
  v5[2] = a2;
  v8 = v10;
  *v5 = *v10;
  *v8 = (const char *)v5;
LABEL_6:
  pthread_mutex_unlock(&gTUFaultLock);
  return v7;
}

uint64_t _TUFaultLookup(char *a1, const char ***a2)
{
  int v4;
  char *v5;
  unsigned int v6;
  int v7;
  uint64_t v8;
  const char **v9;
  const char **v10;

  v4 = *a1;
  if (*a1)
  {
    v5 = a1 + 1;
    v6 = -2128831035;
    do
    {
      v6 = 16777619 * (v6 ^ v4);
      v7 = *v5++;
      v4 = v7;
    }
    while (v7);
    v8 = v6 % 0x1F;
  }
  else
  {
    v8 = 8;
  }
  v9 = (const char **)((char *)&gTUFaultHashTable + 8 * v8);
  do
  {
    v10 = v9;
    v9 = (const char **)*v9;
  }
  while (v9 && strcasecmp(v9[1], a1));
  if (a2)
    *a2 = v10;
  if (v9)
    return 0;
  else
    return 4294960569;
}

uint64_t TUFaultDisable(char *a1)
{
  uint64_t v2;
  void **v3;
  const char ***v5;

  v5 = 0;
  pthread_mutex_lock(&gTUFaultLock);
  v2 = _TUFaultLookup(a1, (const char ***)&v5);
  if (!(_DWORD)v2)
  {
    v3 = (void **)*v5;
    *v5 = (const char **)**v5;
    free(v3[1]);
    free(v3);
  }
  pthread_mutex_unlock(&gTUFaultLock);
  return v2;
}

uint64_t TUFaultInject(char *a1, int a2, _BYTE *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  const char **v11;

  v11 = 0;
  pthread_mutex_lock(&gTUFaultLock);
  v6 = _TUFaultLookup(a1, &v11);
  if ((_DWORD)v6)
  {
    v7 = v6;
  }
  else
  {
    v7 = 4294960564;
    v8 = (uint64_t)*v11;
    switch(a2)
    {
      case 1:
      case 2:
      case 3:
        v7 = 0;
        *a3 = *(_QWORD *)(v8 + 16);
        break;
      case 4:
      case 5:
        v7 = 0;
        *(_WORD *)a3 = *(_QWORD *)(v8 + 16);
        break;
      case 6:
      case 7:
      case 10:
        v7 = 0;
        *(_DWORD *)a3 = *(_QWORD *)(v8 + 16);
        break;
      case 8:
      case 9:
      case 11:
        v7 = 0;
        *(_QWORD *)a3 = *(_QWORD *)(v8 + 16);
        break;
      case 20:
      case 22:
        v7 = 0;
        v9 = *(double *)(v8 + 16);
        *(float *)a3 = v9;
        break;
      case 21:
      case 23:
        v7 = 0;
        *(_QWORD *)a3 = *(_QWORD *)(v8 + 16);
        break;
      default:
        break;
    }
  }
  pthread_mutex_unlock(&gTUFaultLock);
  return v7;
}

_OWORD *TUTestStateCreate(int *a1)
{
  _OWORD *Instance;
  _OWORD *v3;
  CFMutableDictionaryRef Mutable;
  int v5;

  if (TUTestStateGetTypeID_sOnce != -1)
    dispatch_once_f(&TUTestStateGetTypeID_sOnce, &TUTestStateGetTypeID_sTypeID, (dispatch_function_t)_TUTestStateGetTypeID);
  Instance = (_OWORD *)_CFRuntimeCreateInstance();
  v3 = Instance;
  if (Instance)
  {
    Instance[8] = 0u;
    Instance[9] = 0u;
    Instance[6] = 0u;
    Instance[7] = 0u;
    Instance[4] = 0u;
    Instance[5] = 0u;
    Instance[2] = 0u;
    Instance[3] = 0u;
    Instance[1] = 0u;
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    *((_QWORD *)v3 + 2) = Mutable;
    if (!Mutable)
    {
      v5 = -6728;
LABEL_7:
      CFRelease(v3);
      v3 = 0;
      goto LABEL_8;
    }
    v5 = pthread_mutex_init((pthread_mutex_t *)((char *)v3 + 24), 0);
    if (v5)
      goto LABEL_7;
    *((_QWORD *)v3 + 11) = (char *)v3 + 24;
    v5 = pthread_cond_init((pthread_cond_t *)v3 + 2, 0);
    if (v5)
      goto LABEL_7;
    *((_QWORD *)v3 + 18) = v3 + 6;
  }
  else
  {
    v5 = -6728;
  }
LABEL_8:
  if (a1)
    *a1 = v5;
  return v3;
}

uint64_t _TUTestStateGetTypeID(uint64_t *a1)
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  *a1 = result;
  return result;
}

pthread_mutex_t *_TUTestStateFinalize(_QWORD *a1)
{
  const void *v2;
  pthread_cond_t *v3;
  pthread_mutex_t *result;

  v2 = (const void *)a1[2];
  if (v2)
  {
    CFRelease(v2);
    a1[2] = 0;
  }
  v3 = (pthread_cond_t *)a1[18];
  if (v3)
  {
    pthread_cond_destroy(v3);
    a1[18] = 0;
  }
  result = (pthread_mutex_t *)a1[11];
  if (result)
  {
    result = (pthread_mutex_t *)pthread_mutex_destroy(result);
    a1[11] = 0;
  }
  return result;
}

CFMutableStringRef _TUTestStateCopyDescription(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFMutableStringRef v9;

  v9 = 0;
  CFAppendPrintF(&v9, (uint64_t)"TUTestState: Signals %d, Objects:\n%@", a3, a4, a5, a6, a7, a8, *(unsigned int *)(a1 + 152));
  return v9;
}

const void *TUTestStateGetObject(uint64_t a1, const void *a2)
{
  pthread_mutex_t *v4;
  const void *Value;

  if (!a1)
    return 0;
  if (!a2)
    return 0;
  if (!*(_QWORD *)(a1 + 16))
    return 0;
  v4 = *(pthread_mutex_t **)(a1 + 88);
  if (!v4)
    return 0;
  pthread_mutex_lock(v4);
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), a2);
  pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 88));
  return Value;
}

uint64_t TUTestStateSetObject(uint64_t result, const void *a2, const void *a3)
{
  uint64_t v4;
  __CFDictionary *v6;

  if (result)
  {
    if (a2)
    {
      v4 = result;
      if (*(_QWORD *)(result + 16))
      {
        result = *(_QWORD *)(result + 88);
        if (result)
        {
          pthread_mutex_lock((pthread_mutex_t *)result);
          v6 = *(__CFDictionary **)(v4 + 16);
          if (a3)
            CFDictionarySetValue(v6, a2, a3);
          else
            CFDictionaryRemoveValue(v6, a2);
          return pthread_mutex_unlock(*(pthread_mutex_t **)(v4 + 88));
        }
      }
    }
  }
  return result;
}

int64_t TUTestStateGetSInt32(uint64_t a1, const void *a2, _DWORD *a3)
{
  pthread_mutex_t *v6;
  int64_t Int64Ranged;
  int v9;

  v9 = 0;
  if (!a1 || !a2 || !*(_QWORD *)(a1 + 16) || (v6 = *(pthread_mutex_t **)(a1 + 88)) == 0)
  {
    Int64Ranged = 0;
    v9 = -6745;
    if (!a3)
      return Int64Ranged;
    goto LABEL_6;
  }
  pthread_mutex_lock(v6);
  Int64Ranged = CFDictionaryGetInt64Ranged(*(const __CFDictionary **)(a1 + 16), a2, 0xFFFFFFFF80000000, 0x7FFFFFFFLL, &v9);
  pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 88));
  if (a3)
LABEL_6:
    *a3 = v9;
  return Int64Ranged;
}

uint64_t TUTestStateSetSInt32(uint64_t result, const void *a2, int a3)
{
  uint64_t v4;

  if (result)
  {
    if (a2)
    {
      v4 = result;
      if (*(_QWORD *)(result + 16))
      {
        result = *(_QWORD *)(result + 88);
        if (result)
        {
          pthread_mutex_lock((pthread_mutex_t *)result);
          CFDictionarySetInt64(*(__CFDictionary **)(v4 + 16), a2, a3);
          return pthread_mutex_unlock(*(pthread_mutex_t **)(v4 + 88));
        }
      }
    }
  }
  return result;
}

uint64_t TUTestStateUpdateSInt32(uint64_t a1, const void *a2, int a3)
{
  uint64_t v3;
  pthread_mutex_t *v6;

  v3 = 0;
  if (a1 && a2)
  {
    if (*(_QWORD *)(a1 + 16) && (v6 = *(pthread_mutex_t **)(a1 + 88)) != 0)
    {
      pthread_mutex_lock(v6);
      v3 = CFDictionaryGetInt64Ranged(*(const __CFDictionary **)(a1 + 16), a2, 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0)+ a3;
      CFDictionarySetInt64(*(__CFDictionary **)(a1 + 16), a2, (int)v3);
      pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 88));
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

uint64_t TUTestStateSignal(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    result = *(_QWORD *)(result + 88);
    if (result)
    {
      if (*(_QWORD *)(v1 + 144))
      {
        pthread_mutex_lock((pthread_mutex_t *)result);
        ++*(_DWORD *)(v1 + 152);
        pthread_cond_signal(*(pthread_cond_t **)(v1 + 144));
        return pthread_mutex_unlock(*(pthread_mutex_t **)(v1 + 88));
      }
    }
  }
  return result;
}

uint64_t TUTestStateSignalCount(uint64_t a1)
{
  uint64_t v2;

  pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 88));
  v2 = *(unsigned int *)(a1 + 152);
  pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 88));
  return v2;
}

uint64_t TUTestStateWait(uint64_t a1, double a2)
{
  __darwin_time_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  timespec v13;

  if (!a1 || !*(_QWORD *)(a1 + 88) || !*(_QWORD *)(a1 + 144))
    return 4294960551;
  v13.tv_sec = 0;
  v13.tv_nsec = 0;
  clock_gettime(_CLOCK_REALTIME, &v13);
  v4 = v13.tv_sec + (uint64_t)a2;
  v13.tv_sec = v4;
  v5 = (a2 - (double)(uint64_t)a2) * 1000000000.0;
  v6 = v13.tv_nsec + (uint64_t)v5;
  if (v6 > 999999999)
  {
    v7 = 1999999999;
    if (v6 < 1999999999)
      v7 = v13.tv_nsec + (uint64_t)v5;
    v8 = (v6 + 999999999 - v7) / 0x3B9ACA00uLL;
    v6 = v6 - 1000000000 * v8 - 1000000000;
    v13.tv_sec = v4 + v8 + 1;
  }
  v13.tv_nsec = v6;
  pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 88));
  while (1)
  {
    v9 = *(_DWORD *)(a1 + 152);
    if (v9)
      break;
    v10 = pthread_cond_timedwait(*(pthread_cond_t **)(a1 + 144), *(pthread_mutex_t **)(a1 + 88), &v13);
    if ((_DWORD)v10)
    {
      v11 = v10;
      goto LABEL_14;
    }
  }
  v11 = 0;
  *(_DWORD *)(a1 + 152) = v9 - 1;
LABEL_14:
  pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 88));
  return v11;
}

uint64_t GetMachThreadPriority(_DWORD *a1, kern_return_t *a2)
{
  _opaque_pthread_t *v4;
  thread_inspect_t v5;
  kern_return_t v6;
  uint64_t v7;
  int v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  integer_t thread_info_out[4];
  __int128 v15;
  uint64_t v16;
  mach_msg_type_number_t thread_info_outCnt;

  v16 = 0;
  *(_OWORD *)thread_info_out = 0u;
  v15 = 0u;
  v13 = 0;
  v11 = 0u;
  v12 = 0u;
  v10 = 0u;
  v4 = pthread_self();
  v5 = pthread_mach_thread_np(v4);
  thread_info_outCnt = 10;
  v6 = thread_info(v5, 3u, thread_info_out, &thread_info_outCnt);
  if (v6)
    goto LABEL_2;
  v9 = DWORD1(v15);
  if (a1)
    *a1 = DWORD1(v15);
  switch(v9)
  {
    case 4:
      thread_info_outCnt = 4;
      v6 = thread_info(v5, 0xCu, (thread_info_t)&v12 + 2, &thread_info_outCnt);
      if (v6)
        goto LABEL_2;
      v7 = HIDWORD(v12);
      break;
    case 2:
      thread_info_outCnt = 5;
      v6 = thread_info(v5, 0xBu, (thread_info_t)&v11 + 1, &thread_info_outCnt);
      if (v6)
        goto LABEL_2;
      v7 = DWORD2(v11);
      break;
    case 1:
      thread_info_outCnt = 5;
      v6 = thread_info(v5, 0xAu, (thread_info_t)&v10, &thread_info_outCnt);
      if (!v6)
      {
        v7 = DWORD1(v10);
        break;
      }
LABEL_2:
      v7 = 0;
      break;
    default:
      v7 = 0;
      v6 = -6735;
      break;
  }
  if (a2)
    *a2 = v6;
  return v7;
}

uint64_t SetCurrentThreadPriority(integer_t a1)
{
  thread_inspect_t v1;
  uint64_t result;
  thread_act_t v3;
  _opaque_pthread_t *v5;
  _opaque_pthread_t *v6;
  BOOLean_t get_default;
  mach_msg_type_number_t policy_infoCnt;
  integer_t policy_info[2];
  uint64_t v10;

  if (a1 == 0x7FFFFFFF)
  {
    *(_QWORD *)policy_info = 0;
    v10 = 0;
    get_default = 1;
    policy_infoCnt = 4;
    v1 = MEMORY[0x18D78E958]();
    result = thread_policy_get(v1, 2u, policy_info, &policy_infoCnt, &get_default);
    if (!(_DWORD)result)
    {
      v3 = MEMORY[0x18D78E958]();
      return thread_policy_set(v3, 2u, policy_info, 4u);
    }
  }
  else
  {
    policy_infoCnt = 0;
    *(_QWORD *)policy_info = 0;
    v5 = pthread_self();
    result = pthread_getschedparam(v5, (int *)&policy_infoCnt, (sched_param *)policy_info);
    if (!(_DWORD)result)
    {
      policy_info[0] = a1;
      v6 = pthread_self();
      return pthread_setschedparam(v6, 2, (const sched_param *)policy_info);
    }
  }
  return result;
}

uint64_t UpTicksPerSecond()
{
  if (UpTicksPerSecond_sOnce != -1)
    dispatch_once_f(&UpTicksPerSecond_sOnce, &UpTicksPerSecond_sTicksPerSecond, (dispatch_function_t)_UpTicksPerSecondInit);
  return UpTicksPerSecond_sTicksPerSecond;
}

uint64_t _UpTicksPerSecondInit(unint64_t *a1)
{
  unint64_t v2;
  uint64_t result;
  BOOL v4;
  mach_timebase_info info;

  v2 = 1000000000;
  info = 0;
  result = mach_timebase_info(&info);
  if (!(_DWORD)result)
  {
    if (info.numer)
      v4 = info.denom == 0;
    else
      v4 = 1;
    if (!v4)
      v2 = 1000000000 * (unint64_t)info.denom / info.numer;
  }
  *a1 = v2;
  return result;
}

uint64_t SleepForUpTicks(uint64_t a1)
{
  unint64_t v2;
  uint64_t result;
  uint64_t i;
  timespec v5;

  if (UpTicksPerSecond_sOnce != -1)
    dispatch_once_f(&UpTicksPerSecond_sOnce, &UpTicksPerSecond_sTicksPerSecond, (dispatch_function_t)_UpTicksPerSecondInit);
  v2 = UpTicksPerSecond_sTicksPerSecond;
  result = mach_absolute_time();
  for (i = result + a1; result < i; result = mach_absolute_time())
  {
    v5.tv_sec = (int)((i - result) / v2);
    v5.tv_nsec = (int)(1000000000 * ((i - result) % v2) / v2);
    if (nanosleep(&v5, 0))
    {
      if (*__error())
        __error();
    }
  }
  return result;
}

uint64_t SleepUntilUpTicks(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;

  if (result)
  {
    v1 = result;
    v2 = mach_absolute_time();
    v3 = v1 >= v2;
    result = v1 - v2;
    if (result != 0 && v3)
      return SleepForUpTicks(result);
  }
  return result;
}

unint64_t UpTicksToSeconds(unint64_t a1)
{
  if (sUpTicksToSecondsOnce != -1)
    dispatch_once_f(&sUpTicksToSecondsOnce, &sUpTicksToSecondsMultiplier, (dispatch_function_t)_UpTicksToSecondsInit);
  return (unint64_t)(*(double *)&sUpTicksToSecondsMultiplier * (double)a1);
}

double _UpTicksToSecondsInit(double *a1)
{
  double result;

  if (UpTicksPerSecond_sOnce != -1)
    dispatch_once_f(&UpTicksPerSecond_sOnce, &UpTicksPerSecond_sTicksPerSecond, (dispatch_function_t)_UpTicksPerSecondInit);
  result = 1.0 / (double)(unint64_t)UpTicksPerSecond_sTicksPerSecond;
  *a1 = result;
  return result;
}

double UpTicksToSecondsF(unint64_t a1)
{
  if (sUpTicksToSecondsOnce != -1)
    dispatch_once_f(&sUpTicksToSecondsOnce, &sUpTicksToSecondsMultiplier, (dispatch_function_t)_UpTicksToSecondsInit);
  return *(double *)&sUpTicksToSecondsMultiplier * (double)a1;
}

unint64_t UpTicksToMilliseconds(unint64_t a1)
{
  if (UpTicksToMilliseconds_sOnce != -1)
    dispatch_once_f(&UpTicksToMilliseconds_sOnce, &UpTicksToMilliseconds_sMultiplier, (dispatch_function_t)_UpTicksToMillisecondsInit);
  return (unint64_t)(*(double *)&UpTicksToMilliseconds_sMultiplier * (double)a1);
}

double _UpTicksToMillisecondsInit(double *a1)
{
  double result;

  if (UpTicksPerSecond_sOnce != -1)
    dispatch_once_f(&UpTicksPerSecond_sOnce, &UpTicksPerSecond_sTicksPerSecond, (dispatch_function_t)_UpTicksPerSecondInit);
  result = 1000.0 / (double)(unint64_t)UpTicksPerSecond_sTicksPerSecond;
  *a1 = result;
  return result;
}

unint64_t UpTicksToMicroseconds(unint64_t a1)
{
  if (UpTicksToMicroseconds_sOnce != -1)
    dispatch_once_f(&UpTicksToMicroseconds_sOnce, &UpTicksToMicroseconds_sMultiplier, (dispatch_function_t)_UpTicksToMicrosecondsInit);
  return (unint64_t)(*(double *)&UpTicksToMicroseconds_sMultiplier * (double)a1);
}

double _UpTicksToMicrosecondsInit(double *a1)
{
  double result;

  if (UpTicksPerSecond_sOnce != -1)
    dispatch_once_f(&UpTicksPerSecond_sOnce, &UpTicksPerSecond_sTicksPerSecond, (dispatch_function_t)_UpTicksPerSecondInit);
  result = 1000000.0 / (double)(unint64_t)UpTicksPerSecond_sTicksPerSecond;
  *a1 = result;
  return result;
}

unint64_t UpTicksToNanoseconds(unint64_t a1)
{
  if (UpTicksToNanoseconds_sOnce != -1)
    dispatch_once_f(&UpTicksToNanoseconds_sOnce, &UpTicksToNanoseconds_sMultiplier, (dispatch_function_t)_UpTicksToNanosecondsInit);
  return (unint64_t)(*(double *)&UpTicksToNanoseconds_sMultiplier * (double)a1);
}

double _UpTicksToNanosecondsInit(double *a1)
{
  double result;

  if (UpTicksPerSecond_sOnce != -1)
    dispatch_once_f(&UpTicksPerSecond_sOnce, &UpTicksPerSecond_sTicksPerSecond, (dispatch_function_t)_UpTicksPerSecondInit);
  result = 1000000000.0 / (double)(unint64_t)UpTicksPerSecond_sTicksPerSecond;
  *a1 = result;
  return result;
}

unint64_t UpTicksToNTP(unint64_t a1)
{
  if (UpTicksPerSecond_sOnce != -1)
    dispatch_once_f(&UpTicksPerSecond_sOnce, &UpTicksPerSecond_sTicksPerSecond, (dispatch_function_t)_UpTicksPerSecondInit);
  return (((unint64_t)(a1 % UpTicksPerSecond_sTicksPerSecond) << 32)
        / UpTicksPerSecond_sTicksPerSecond) | ((a1 / UpTicksPerSecond_sTicksPerSecond) << 32);
}

void _SecondsToUpTicksInit(_QWORD *a1)
{
  if (UpTicksPerSecond_sOnce != -1)
    dispatch_once_f(&UpTicksPerSecond_sOnce, &UpTicksPerSecond_sTicksPerSecond, (dispatch_function_t)_UpTicksPerSecondInit);
  *a1 = UpTicksPerSecond_sTicksPerSecond;
}

unint64_t SecondsToUpTicksF(double a1)
{
  if (SecondsToUpTicksF_sOnce != -1)
    dispatch_once_f(&SecondsToUpTicksF_sOnce, &SecondsToUpTicksF_sMultiplier, (dispatch_function_t)_SecondsToUpTicksFInit);
  return (unint64_t)(*(double *)&SecondsToUpTicksF_sMultiplier * a1);
}

double _SecondsToUpTicksFInit(double *a1)
{
  double result;

  if (UpTicksPerSecond_sOnce != -1)
    dispatch_once_f(&UpTicksPerSecond_sOnce, &UpTicksPerSecond_sTicksPerSecond, (dispatch_function_t)_UpTicksPerSecondInit);
  result = (double)(unint64_t)UpTicksPerSecond_sTicksPerSecond;
  *a1 = (double)(unint64_t)UpTicksPerSecond_sTicksPerSecond;
  return result;
}

unint64_t MillisecondsToUpTicks(unint64_t a1)
{
  if (MillisecondsToUpTicks_sOnce != -1)
    dispatch_once_f(&MillisecondsToUpTicks_sOnce, &MillisecondsToUpTicks_sMultiplier, (dispatch_function_t)_MillisecondsToUpTicksInit);
  return (unint64_t)(*(double *)&MillisecondsToUpTicks_sMultiplier * (double)a1);
}

double _MillisecondsToUpTicksInit(double *a1)
{
  double result;

  if (UpTicksPerSecond_sOnce != -1)
    dispatch_once_f(&UpTicksPerSecond_sOnce, &UpTicksPerSecond_sTicksPerSecond, (dispatch_function_t)_UpTicksPerSecondInit);
  result = (double)(unint64_t)UpTicksPerSecond_sTicksPerSecond / 1000.0;
  *a1 = result;
  return result;
}

unint64_t MicrosecondsToUpTicks(unint64_t a1)
{
  if (MicrosecondsToUpTicks_sOnce != -1)
    dispatch_once_f(&MicrosecondsToUpTicks_sOnce, &MicrosecondsToUpTicks_sMultiplier, (dispatch_function_t)_MicrosecondsToUpTicksInit);
  return (unint64_t)(*(double *)&MicrosecondsToUpTicks_sMultiplier * (double)a1);
}

double _MicrosecondsToUpTicksInit(double *a1)
{
  double result;

  if (UpTicksPerSecond_sOnce != -1)
    dispatch_once_f(&UpTicksPerSecond_sOnce, &UpTicksPerSecond_sTicksPerSecond, (dispatch_function_t)_UpTicksPerSecondInit);
  result = (double)(unint64_t)UpTicksPerSecond_sTicksPerSecond / 1000000.0;
  *a1 = result;
  return result;
}

unint64_t NanosecondsToUpTicks(unint64_t a1)
{
  if (NanosecondsToUpTicks_sOnce != -1)
    dispatch_once_f(&NanosecondsToUpTicks_sOnce, &NanosecondsToUpTicks_sMultiplier, (dispatch_function_t)_NanosecondsToUpTicksInit);
  return (unint64_t)(*(double *)&NanosecondsToUpTicks_sMultiplier * (double)a1);
}

double _NanosecondsToUpTicksInit(double *a1)
{
  double result;

  if (UpTicksPerSecond_sOnce != -1)
    dispatch_once_f(&UpTicksPerSecond_sOnce, &UpTicksPerSecond_sTicksPerSecond, (dispatch_function_t)_UpTicksPerSecondInit);
  result = (double)(unint64_t)UpTicksPerSecond_sTicksPerSecond / 1000000000.0;
  *a1 = result;
  return result;
}

unint64_t NTPtoUpTicks(unint64_t a1)
{
  if (UpTicksPerSecond_sOnce != -1)
    dispatch_once_f(&UpTicksPerSecond_sOnce, &UpTicksPerSecond_sTicksPerSecond, (dispatch_function_t)_UpTicksPerSecondInit);
  return UpTicksPerSecond_sTicksPerSecond * HIDWORD(a1)
       + ((UpTicksPerSecond_sTicksPerSecond * (unint64_t)a1) >> 32);
}

__darwin_time_t NanoTimeGetCurrent()
{
  timeval v1;

  v1.tv_sec = 0;
  *(_QWORD *)&v1.tv_usec = 0;
  gettimeofday(&v1, 0);
  return (1000 * v1.tv_usec) + 1000000000 * v1.tv_sec;
}

uint64_t YMD_HMStoSeconds(int a1, int a2, int a3, int a4, int a5, unsigned int a6, int a7)
{
  int v7;
  int v8;
  unsigned int v9;
  unint64_t v10;
  int v11;
  int v12;
  int v13;

  v7 = a1 + 2;
  if (a1 >= 1)
    v7 = a1 - 1;
  v8 = 365 * (a1 - 1) + (v7 >> 2) + (a1 - 1) / -100 + (a1 - 1) / 400 + (3057 * a2 - 3007) / 100;
  HIDWORD(v10) = -1030792151 * a1 + 85899344;
  LODWORD(v10) = HIDWORD(v10);
  v9 = v10 >> 2;
  LODWORD(v10) = HIDWORD(v10);
  if ((v10 >> 4) >= 0xA3D70B)
    v11 = -2;
  else
    v11 = -1;
  if (v9 <= 0x28F5C28)
    v12 = v11;
  else
    v12 = -1;
  if ((a1 & 3) != 0)
    v12 = -2;
  v13 = v12 + v8;
  if (a2 >= 3)
    v8 = v13;
  return 60 * a5 + (uint64_t)(3600 * a4) + a6 + 86400 * (a3 - a7 + v8);
}

unint64_t SecondsToYMD_HMS(uint64_t a1, int *a2, _DWORD *a3, _DWORD *a4, int *a5, unsigned int *a6, _DWORD *a7)
{
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  unint64_t result;
  int v19;
  int v20;
  unint64_t v21;
  int v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  int v26;
  int v27;
  int v28;
  unsigned int v29;

  v7 = a1 / 86400;
  v8 = 963315389 * (int)(400 * (a1 / 86400));
  v9 = (v8 >> 47) + ((unint64_t)v8 >> 63);
  v10 = 365 * v9 - 365;
  do
  {
    v11 = v9;
    if (v9 >= 0)
      v12 = v9;
    else
      v12 = v9 + 3;
    v13 = v9 / -100;
    v14 = v9 / 400;
    ++v9;
    v10 += 365;
  }
  while (v10 + v14 + v13 + (v12 >> 2) < (int)v7);
  v15 = a1 % 86400;
  v16 = v11 - 1;
  if (v11 >= 1)
    v17 = v11 - 1;
  else
    v17 = v11 + 2;
  result = (unint64_t)(-1374389535 * v16) >> 63;
  v19 = v7 - (v17 >> 2) - 365 * v16 + v16 / 100 + v16 / -400;
  v20 = v19;
  if (v19 >= 60)
  {
    v20 = v19 + 2;
    if ((v11 & 3) == 0)
    {
      HIDWORD(v21) = -1030792151 * v11 + 85899344;
      LODWORD(v21) = HIDWORD(v21);
      if ((v21 >> 2) > 0x28F5C28 || -400 * v14 == -v11)
      {
        if (v19 <= 0x3E)
          v22 = -2;
        else
          v22 = -1;
        v20 += v22;
      }
    }
  }
  v23 = 1438680573 * (100 * v20 + 3007);
  v24 = HIDWORD(v23);
  v25 = v23 >> 63;
  v26 = v15 / 3600;
  v27 = v15 + 61936 * (v15 / 3600);
  if (a2)
    *a2 = v11;
  v28 = v25 + ((int)v24 >> 10);
  if (a3)
    *a3 = v28;
  if (a4)
    *a4 = (3057 * v28 - 3007) / -100 + v20;
  if (a5)
    *a5 = v26;
  v29 = ((__int16)((34953 * (__int16)v27) >> 16) >> 5)
      + (((v27 + ((-30583 * (__int16)v27) >> 16)) & 0x8000) >> 15);
  if (a6)
    *a6 = v29;
  if (a7)
    *a7 = (__int16)(v27 - 60 * v29);
  return result;
}

const char *MakeFractionalDateString(timeval *a1, char *a2, size_t a3)
{
  timeval *v5;
  tm *v6;
  size_t v7;
  time_t tv_sec;
  timeval v10;

  v5 = a1;
  v10.tv_sec = 0;
  *(_QWORD *)&v10.tv_usec = 0;
  if (!a1)
  {
    v5 = &v10;
    gettimeofday(&v10, 0);
  }
  tv_sec = v5->tv_sec;
  v6 = gmtime(&tv_sec);
  if (!v6)
    return "";
  v7 = strftime(a2, a3, "%Y-%m-%dT%H:%M:%S", v6);
  snprintf(&a2[v7], a3 - v7, ".%06uZ", v5->tv_usec);
  return a2;
}

uint64_t ParseFractionalDateString(char *__s, int64_t a2, uint64_t a3, char **a4, double a5, int32x2_t a6)
{
  int64_t v8;
  char *v10;
  int v11;
  char *v12;
  int v13;
  char *v14;
  int v15;
  char *v16;
  char *v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  char *v22;
  unsigned int v23;
  uint64_t result;
  char *v25;
  char *v26;
  char *v27;
  int v28;
  unsigned __int8 v29;
  char *v30;
  char *v31;
  int v32;
  unsigned __int8 v33;
  char *v34;
  char *v35;
  int v36;
  unsigned __int8 v37;
  char *v38;
  char *v39;
  int v40;
  char *v41;
  uint64_t v42;
  char *v43;
  char *v44;
  int v45;
  int v46;
  unsigned int v47;
  unsigned int v48;
  int32x4_t v49;
  int32x4_t v50;
  int8x16_t v51;
  int8x16_t v52;
  uint64_t v53;

  v8 = a2;
  if (a2 == -1)
    v8 = strlen(__s);
  v10 = &__s[v8];
  if (v8 < 1)
  {
    v11 = 0;
    v13 = 0;
    v12 = __s;
  }
  else
  {
    v11 = 0;
    v12 = __s;
    do
    {
      v13 = *v12;
      if ((v13 - 48) > 9)
        break;
      v11 = *v12++ + 10 * v11 - 48;
    }
    while (v12 < v10);
  }
  if (v12 - __s != 4)
    return 4294960554;
  if (v12 == v10)
  {
    v18 = 0;
    v19 = 0;
    v20 = 0;
    LODWORD(v21) = 0;
    v15 = 1;
LABEL_29:
    v23 = 1;
    goto LABEL_30;
  }
  if (v13 != 90 && v13 != 45)
    return 4294960554;
  v14 = v12 + 1;
  if (v12 + 1 >= v10)
  {
    v15 = 0;
    v17 = v12 + 1;
  }
  else
  {
    v15 = 0;
    v16 = (char *)(&__s[v8] - v12 - 1);
    v17 = v12 + 1;
    while (1)
    {
      v13 = *v17;
      if ((v13 - 48) > 9)
        break;
      v15 = *v17++ + 10 * v15 - 48;
      if (!--v16)
      {
        v17 = &__s[v8];
        break;
      }
    }
  }
  if (v17 - v14 != 2)
    return 4294960554;
  if ((v15 - 13) < 0xFFFFFFF4)
    return 4294960586;
  if (v17 == v10)
  {
    v18 = 0;
    v19 = 0;
    v20 = 0;
    LODWORD(v21) = 0;
    goto LABEL_29;
  }
  if (v13 != 90 && v13 != 45)
    return 4294960554;
  v22 = v17 + 1;
  if (v13 == 90)
  {
    v18 = 0;
    v19 = 0;
    v20 = 0;
    LODWORD(v21) = 0;
    v23 = 1;
LABEL_27:
    v10 = v22;
    goto LABEL_30;
  }
  if (v22 >= v10)
    return 4294960554;
  v23 = 0;
  v25 = &__s[v8];
  v26 = &__s[v8 + ~(unint64_t)v17];
  v27 = v17 + 1;
  while (1)
  {
    v28 = *v27;
    v29 = *v27;
    if ((v28 - 48) > 9)
      break;
    v23 = (char)v28 + 10 * v23 - 48;
    ++v27;
    if (!--v26)
    {
      v27 = &__s[v8];
      break;
    }
  }
  if (v27 - v22 != 2)
    return 4294960554;
  if (v23 > 0x1F)
    return 4294960586;
  if (v27 == v10)
  {
    v18 = 0;
    goto LABEL_49;
  }
  if ((char)v28 != 90 && v29 != 84)
    return 4294960554;
  v22 = v27 + 1;
  if ((char)v28 == 90)
  {
    v18 = 0;
LABEL_46:
    v19 = 0;
LABEL_47:
    v20 = 0;
    LODWORD(v21) = 0;
    goto LABEL_27;
  }
  if (v22 >= v10)
    return 4294960554;
  v18 = 0;
  v30 = &__s[v8 + ~(unint64_t)v27];
  v31 = v27 + 1;
  while (1)
  {
    v32 = *v31;
    v33 = *v31;
    if ((v32 - 48) > 9)
      break;
    v18 = (char)v32 + 10 * v18 - 48;
    ++v31;
    if (!--v30)
    {
      v31 = &__s[v8];
      break;
    }
  }
  if (v31 - v22 != 2)
    return 4294960554;
  if (v18 > 0x17)
    return 4294960586;
  if (v31 == v10)
  {
LABEL_49:
    v19 = 0;
LABEL_50:
    v20 = 0;
    goto LABEL_51;
  }
  if ((char)v32 != 90 && v33 != 58)
    return 4294960554;
  v22 = v31 + 1;
  if ((char)v32 == 90)
    goto LABEL_46;
  if (v22 >= v10)
    return 4294960554;
  v19 = 0;
  v34 = &__s[v8 + ~(unint64_t)v31];
  v35 = v31 + 1;
  while (1)
  {
    v36 = *v35;
    v37 = *v35;
    if ((v36 - 48) > 9)
      break;
    v19 = (char)v36 + 10 * v19 - 48;
    ++v35;
    if (!--v34)
    {
      v35 = &__s[v8];
      break;
    }
  }
  if (v35 - v22 != 2)
    return 4294960554;
  if (v19 > 0x3B)
    return 4294960586;
  if (v35 == v10)
    goto LABEL_50;
  if ((char)v36 != 90 && v37 != 58)
    return 4294960554;
  v22 = v35 + 1;
  if ((char)v36 == 90)
    goto LABEL_47;
  if (v22 >= v10)
    return 4294960554;
  v20 = 0;
  v38 = &__s[v8 + ~(unint64_t)v35];
  v39 = v35 + 1;
  while (1)
  {
    v40 = *v39;
    if ((v40 - 48) > 9)
      break;
    v20 = *v39++ + 10 * v20 - 48;
    if (!--v38)
    {
      v39 = &__s[v8];
      break;
    }
  }
  if (v39 - v22 != 2)
    return 4294960554;
  if (v20 > 0x3D)
    return 4294960586;
  if (v39 == v10)
  {
LABEL_51:
    LODWORD(v21) = 0;
    goto LABEL_30;
  }
  if (v40 != 90 && v40 != 46)
    return 4294960554;
  v41 = v39 + 1;
  if (v40 == 90)
  {
    LODWORD(v21) = 0;
    v10 = v39 + 1;
    goto LABEL_30;
  }
  if (v41 >= v10)
  {
    v42 = 0;
    v44 = v39 + 1;
  }
  else
  {
    v42 = 0;
    v43 = &__s[v8 + ~(unint64_t)v39];
    v44 = v41;
    while (1)
    {
      v40 = *v44;
      if ((v40 - 48) > 9)
        break;
      v42 = *v44++ + 10 * v42 - 48;
      if (!--v43)
      {
        v44 = v25;
        break;
      }
    }
  }
  v45 = (_DWORD)v44 - (_DWORD)v41;
  if ((int)v44 - (int)v41 > 9)
    return 4294960586;
  v46 = v45 - 1;
  if (v45 < 1)
  {
    v53 = 1;
  }
  else
  {
    v47 = (v45 + 3) & 0xFFFFFFFC;
    a6.i32[0] = v46;
    v48 = v46 & 0xFFFFFFFC;
    v49.i64[0] = 0x100000001;
    v49.i64[1] = 0x100000001;
    v50.i64[0] = 0xA0000000ALL;
    v50.i64[1] = 0xA0000000ALL;
    do
    {
      v51 = (int8x16_t)v49;
      v49 = vmulq_s32(v49, v50);
      v47 -= 4;
    }
    while (v47);
    v52 = vbslq_s8((int8x16_t)vcgtq_u32((uint32x4_t)vorrq_s8((int8x16_t)vdupq_n_s32(v48), (int8x16_t)xmmword_18D51D4D0), (uint32x4_t)vdupq_lane_s32(a6, 0)), v51, (int8x16_t)v49);
    *(int32x2_t *)v52.i8 = vmul_s32(*(int32x2_t *)v52.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v52, v52, 8uLL));
    v53 = (v52.i32[0] * v52.i32[1]);
  }
  v21 = 1000000 * v42 / v53;
  if (v44 != v10)
  {
    if (v40 == 90)
    {
      v10 = v44 + 1;
      goto LABEL_30;
    }
    return 4294960554;
  }
LABEL_30:
  if (a3)
  {
    *(_QWORD *)a3 = (int)YMD_HMStoSeconds(v11, v15, v23, v18, v19, v20, 719163);
    *(_DWORD *)(a3 + 8) = v21;
  }
  result = 0;
  if (a4)
    *a4 = v10;
  return result;
}

uint64_t TLV8Get(unsigned __int8 *a1, unsigned __int8 *a2, int a3, unsigned __int8 **a4, _QWORD *a5, unsigned __int8 **a6)
{
  unsigned __int8 *v6;
  uint64_t v7;
  unsigned __int8 *v8;
  int v9;
  uint64_t result;

  do
  {
    if (a1 == a2)
      return 4294960569;
    if (a1 >= a2)
      return 4294960591;
    if ((unint64_t)(a2 - a1) < 2)
      return 4294960569;
    v6 = a1 + 2;
    v7 = a1[1];
    v8 = &a1[v7 + 2];
    if (v8 > a2)
      return 4294960546;
    v9 = *a1;
    a1 += v7 + 2;
  }
  while (v9 != a3);
  if (a4)
    *a4 = v6;
  if (a5)
    *a5 = v7;
  result = 0;
  if (a6)
    *a6 = v8;
  return result;
}

uint64_t TLV8GetBytes(unsigned __int8 *a1, unsigned __int8 *a2, int a3, unint64_t a4, size_t a5, char *__dst, _QWORD *a7, unsigned __int8 **a8)
{
  const void *v14;
  size_t v15;
  unsigned __int8 *v16;
  int v17;
  char *v18;
  char *v19;
  unsigned __int8 *v20;
  const void *v21;
  size_t v22;
  uint64_t result;

  do
  {
    if (a1 == a2)
      return 4294960569;
    if (a1 >= a2)
      return 4294960591;
    if ((unint64_t)(a2 - a1) < 2)
      return 4294960569;
    v14 = a1 + 2;
    v15 = a1[1];
    v16 = &a1[v15 + 2];
    if (v16 > a2)
      return 4294960546;
    v17 = *a1;
    a1 += v15 + 2;
  }
  while (v17 != a3);
  if (v15 > a5)
    return 4294960545;
  v18 = &__dst[a5];
  memcpy(__dst, v14, v15);
  v19 = &__dst[v15];
LABEL_8:
  v20 = v16;
  while (a2 > v20)
  {
    if ((unint64_t)(a2 - v20) < 2)
      break;
    v21 = v20 + 2;
    v22 = v20[1];
    v16 = &v20[v22 + 2];
    if (v16 > a2 || *v20 != a3)
      break;
    v20 += v22 + 2;
    if ((_DWORD)v22)
    {
      if (v18 - v19 < v22)
        return 4294960545;
      memcpy(v19, v21, v22);
      v19 += v22;
      goto LABEL_8;
    }
  }
  if (v19 - __dst < a4)
    return 4294960546;
  if (a7)
    *a7 = v19 - __dst;
  result = 0;
  if (a8)
    *a8 = v20;
  return result;
}

unint64_t TLVParseSInt64(unsigned __int8 *a1, uint64_t a2, char a3, int *a4)
{
  unint64_t result;
  int v6;

  result = 0;
  v6 = -6743;
  if ((a3 & 1) != 0)
  {
    switch(a2)
    {
      case 1:
LABEL_6:
        v6 = 0;
        result = (char)*a1;
        if (a4)
          goto LABEL_16;
        return result;
      case 2:
        v6 = 0;
        result = (__int16)(*a1 << 8) | (unint64_t)a1[1];
        if (a4)
          goto LABEL_16;
        return result;
      case 4:
        v6 = 0;
        result = (*a1 << 24) | ((unint64_t)a1[1] << 16) | ((unint64_t)a1[2] << 8) | a1[3];
        goto LABEL_15;
      case 8:
        v6 = 0;
        result = bswap64(*(_QWORD *)a1);
        if (!a4)
          return result;
        goto LABEL_16;
      default:
LABEL_15:
        if (a4)
LABEL_16:
          *a4 = v6;
        break;
    }
  }
  else
  {
    switch(a2)
    {
      case 1:
        goto LABEL_6;
      case 2:
        v6 = 0;
        result = (__int16)(a1[1] << 8) | (unint64_t)*a1;
        if (a4)
          goto LABEL_16;
        break;
      case 4:
        v6 = 0;
        result = *(int *)a1;
        if (a4)
          goto LABEL_16;
        break;
      case 8:
        v6 = 0;
        result = *(_QWORD *)a1;
        if (a4)
          goto LABEL_16;
        break;
      default:
        goto LABEL_15;
    }
  }
  return result;
}

uint64_t TLV8GetUInt64(unsigned __int8 *a1, unsigned __int8 *a2, int a3, int *a4, unsigned __int8 **a5)
{
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  uint64_t v7;
  uint64_t result;
  int v9;

  do
  {
    if (a1 == a2)
    {
LABEL_16:
      result = 0;
      v9 = -6727;
      goto LABEL_13;
    }
    v5 = a1;
    if (a1 >= a2)
    {
      result = 0;
      v9 = -6705;
      goto LABEL_13;
    }
    if ((unint64_t)(a2 - a1) < 2)
      goto LABEL_16;
    v6 = a1 + 2;
    v7 = a1[1];
    a1 += v7 + 2;
    if (a1 > a2)
    {
      result = 0;
      v9 = -6750;
      goto LABEL_13;
    }
  }
  while (*v5 != a3);
  if (a5)
    *a5 = a1;
  result = 0;
  v9 = -6743;
  switch((int)v7)
  {
    case 1:
      v9 = 0;
      result = *v6;
      break;
    case 2:
      v9 = 0;
      result = *((unsigned __int16 *)v5 + 1);
      break;
    case 4:
      v9 = 0;
      result = *(unsigned int *)v6;
      break;
    case 8:
      v9 = 0;
      result = *(_QWORD *)v6;
      break;
    default:
      break;
  }
LABEL_13:
  if (a4)
    *a4 = v9;
  return result;
}

unint64_t TLVParseUInt64(unsigned int *a1, uint64_t a2, char a3, int *a4)
{
  unint64_t result;
  int v6;

  result = 0;
  v6 = -6743;
  if ((a3 & 1) != 0)
  {
    switch(a2)
    {
      case 1:
LABEL_6:
        v6 = 0;
        result = *(unsigned __int8 *)a1;
        if (a4)
          goto LABEL_16;
        return result;
      case 2:
        v6 = 0;
        result = __rev16(*(unsigned __int16 *)a1);
        if (a4)
          goto LABEL_16;
        return result;
      case 4:
        v6 = 0;
        result = bswap32(*a1);
        goto LABEL_15;
      case 8:
        v6 = 0;
        result = bswap64(*(_QWORD *)a1);
        if (!a4)
          return result;
        goto LABEL_16;
      default:
LABEL_15:
        if (a4)
LABEL_16:
          *a4 = v6;
        break;
    }
  }
  else
  {
    switch(a2)
    {
      case 1:
        goto LABEL_6;
      case 2:
        v6 = 0;
        result = *(unsigned __int16 *)a1;
        if (a4)
          goto LABEL_16;
        break;
      case 4:
        v6 = 0;
        result = *a1;
        if (a4)
          goto LABEL_16;
        break;
      case 8:
        v6 = 0;
        result = *(_QWORD *)a1;
        if (a4)
          goto LABEL_16;
        break;
      default:
        goto LABEL_15;
    }
  }
  return result;
}

void *TLV8CopyCoalesced(unsigned __int8 *a1, unsigned __int8 *a2, int a3, size_t *a4, int *a5)
{
  int v7;
  void *v8;
  size_t v9;
  size_t v10;
  void *v11;
  unsigned __int8 *v13;
  void *v14;
  size_t v15;
  void *__src;

  v15 = 0;
  __src = 0;
  v13 = 0;
  v14 = 0;
  v7 = TLV8GetOrCopyCoalesced(a1, a2, a3, &__src, &v15, &v14, &v13);
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    v8 = v14;
    v9 = v15;
    if (v14)
    {
LABEL_8:
      v7 = 0;
      *a4 = v9;
      goto LABEL_9;
    }
    if (v15 <= 1)
      v10 = 1;
    else
      v10 = v15;
    v11 = malloc_type_malloc(v10, 0x62CA982BuLL);
    v8 = v11;
    if (v11)
    {
      memcpy(v11, __src, v9);
      goto LABEL_8;
    }
    v7 = -6728;
  }
LABEL_9:
  if (a5)
    *a5 = v7;
  return v8;
}

uint64_t TLV8GetOrCopyCoalesced(unsigned __int8 *a1, unsigned __int8 *a2, int a3, _QWORD *a4, size_t *a5, _QWORD *a6, unsigned __int8 **a7)
{
  const void *v9;
  size_t v10;
  unsigned __int8 *v11;
  int v12;
  char *v13;
  void *v14;
  size_t v15;
  size_t v16;
  const void *v17;
  unsigned __int8 *v18;
  char *v19;
  uint64_t result;
  _QWORD *v21;
  size_t *v22;
  _QWORD *v23;
  unsigned __int8 **v24;

  do
  {
    if (a1 == a2)
      return 4294960569;
    if (a1 >= a2)
      return 4294960591;
    if ((unint64_t)(a2 - a1) < 2)
      return 4294960569;
    v9 = a1 + 2;
    v10 = a1[1];
    v11 = &a1[v10 + 2];
    if (v11 > a2)
      return 4294960546;
    v12 = *a1;
    a1 += v10 + 2;
  }
  while (v12 != a3);
  v13 = 0;
  while (2)
  {
    v14 = v13;
    v15 = v10;
    while (2)
    {
      v16 = v15;
      v17 = v9;
      v18 = v11;
      do
      {
        if (a2 <= v18
          || (unint64_t)(a2 - v18) < 2
          || (v9 = v18 + 2, v15 = v18[1], v11 = &v18[v15 + 2], v11 > a2)
          || *v18 != a3)
        {
          *a4 = v17;
          *a5 = v16;
          *a6 = v13;
          result = 0;
          if (a7)
            *a7 = v18;
          return result;
        }
        v18 += v15 + 2;
      }
      while (!(_DWORD)v15);
      if (!v16)
        continue;
      break;
    }
    v21 = a4;
    v22 = a5;
    v23 = a6;
    v24 = a7;
    v10 = v16 + v15;
    v19 = (char *)malloc_type_malloc(v16 + v15, 0xCDDDB754uLL);
    if (v19)
    {
      v13 = v19;
      memcpy(v19, v17, v16);
      memcpy(&v13[v16], v9, v15);
      v9 = v13;
      a6 = v23;
      a7 = v24;
      a4 = v21;
      a5 = v22;
      if (v14)
      {
        free(v14);
        a4 = v21;
        a5 = v22;
        a6 = v23;
        a7 = v24;
        v9 = v13;
      }
      continue;
    }
    break;
  }
  if (v13)
    free(v13);
  return 4294960568;
}

_QWORD *TLV8BufferInit(_QWORD *result, uint64_t a2)
{
  *result = result + 4;
  result[1] = 0;
  result[2] = a2;
  result[3] = 0;
  return result;
}

void TLV8BufferFree(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    free(v2);
    *(_QWORD *)(a1 + 24) = 0;
  }
}

uint64_t TLV8BufferAppend(uint64_t a1, char a2, char *__s, size_t a4)
{
  size_t v4;
  char *v5;
  uint64_t v8;
  unint64_t v9;
  size_t v10;
  size_t v11;
  size_t v12;
  char *v13;
  char *v14;
  char *v15;
  const void *v16;
  size_t v17;
  char *v18;
  size_t v19;
  uint64_t result;

  v4 = a4;
  v5 = __s;
  if (a4 == -1)
    v4 = strlen(__s);
  if (v4 >= 0x100)
  {
    v9 = v4 / 0xFF;
    if (v4 % 0xFF)
      ++v9;
    v8 = 2 * v9;
  }
  else
  {
    v8 = 2;
  }
  v10 = v8 + v4;
  v11 = *(_QWORD *)(a1 + 8);
  v12 = v10 + v11;
  if (v10 + v11 > *(_QWORD *)(a1 + 16))
    return 4294960553;
  if (v12 < v11)
    return 4294960545;
  if (v12 > 0x12C)
  {
    v14 = (char *)malloc_type_malloc(v12, 0x21EF39BEuLL);
    if (!v14)
      return 4294960568;
    v15 = v14;
    v16 = *(const void **)(a1 + 24);
    v17 = *(_QWORD *)(a1 + 8);
    if (v16)
    {
      memcpy(v14, v16, v17);
      free(*(void **)(a1 + 24));
    }
    else if (v17)
    {
      memcpy(v14, (const void *)(a1 + 32), v17);
    }
    *(_QWORD *)a1 = v15;
    *(_QWORD *)(a1 + 24) = v15;
    v13 = &v15[*(_QWORD *)(a1 + 8)];
  }
  else
  {
    v13 = (char *)(a1 + v11 + 32);
  }
  v18 = &v5[v4];
  do
  {
    if ((unint64_t)(v18 - v5) >= 0xFF)
      v19 = 255;
    else
      v19 = v18 - v5;
    *v13 = a2;
    v13[1] = v19;
    if (v19)
      memcpy(v13 + 2, v5, v19);
    v5 += v19;
    v13 += v19 + 2;
  }
  while (v5 != v18);
  result = 0;
  *(_QWORD *)(a1 + 8) = &v13[-*(_QWORD *)a1];
  return result;
}

uint64_t TLV8BufferAppendSInt64(uint64_t a1, char a2, uint64_t a3)
{
  size_t v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (a3 == (char)a3)
  {
    LOBYTE(v5[0]) = a3;
    v3 = 1;
  }
  else
  {
    v5[0] = a3;
    v3 = 8;
  }
  return TLV8BufferAppend(a1, a2, (char *)v5, v3);
}

uint64_t TLV8BufferAppendUInt64(uint64_t a1, char a2, unint64_t a3)
{
  size_t v3;
  int v5;
  char v6;
  char v7;
  char v8;
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3 > 0xFF)
  {
    if (a3 >> 16)
    {
      v5 = a3;
      if (HIDWORD(a3))
      {
        v6 = BYTE4(a3);
        v7 = BYTE5(a3);
        v8 = BYTE6(a3);
        v9 = HIBYTE(a3);
        v3 = 8;
      }
      else
      {
        v3 = 4;
      }
    }
    else
    {
      LOWORD(v5) = a3;
      v3 = 2;
    }
  }
  else
  {
    LOBYTE(v5) = a3;
    v3 = 1;
  }
  return TLV8BufferAppend(a1, a2, (char *)&v5, v3);
}

uint64_t TLV8BufferDetach(uint64_t a1, _QWORD *a2, size_t *a3)
{
  size_t v6;
  void *v7;
  size_t v8;
  void *v9;
  uint64_t result;

  v6 = *(_QWORD *)(a1 + 8);
  v7 = *(void **)(a1 + 24);
  if (v7)
    goto LABEL_8;
  if (v6 <= 1)
    v8 = 1;
  else
    v8 = *(_QWORD *)(a1 + 8);
  v9 = malloc_type_malloc(v8, 0xF62D7A9CuLL);
  if (v9)
  {
    v7 = v9;
    if (v6)
      memcpy(v9, *(const void **)a1, v6);
LABEL_8:
    result = 0;
    *(_QWORD *)a1 = a1 + 32;
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 24) = 0;
    *a2 = v7;
    *a3 = v6;
    return result;
  }
  return 4294960568;
}

uint64_t URLDecodeEx(char *__s, int64_t a2, _BYTE *a3, uint64_t a4, _QWORD *a5, _DWORD *a6)
{
  char *v10;
  int v11;
  char *v12;
  _BYTE *v13;
  int v14;
  int v15;
  char v16;
  int v17;
  char v18;
  uint64_t result;

  v10 = __s;
  if (a2 == -1)
    a2 = strlen(__s);
  if (a2 < 1)
  {
    result = 0;
    v11 = 0;
    v13 = a3;
    goto LABEL_27;
  }
  v11 = 0;
  v12 = &v10[a2];
  v13 = a3;
  while (1)
  {
    v14 = *v10;
    if (v14 != 43)
      break;
    ++v11;
    LOBYTE(v14) = 32;
LABEL_12:
    ++v10;
    if (!a3)
      goto LABEL_24;
LABEL_22:
    if (v13 >= &a3[a4])
    {
      result = 4294960545;
      goto LABEL_27;
    }
    *v13 = v14;
LABEL_24:
    ++v13;
    if (v10 >= v12)
    {
      result = 0;
      goto LABEL_27;
    }
  }
  if (v14 != 37)
    goto LABEL_12;
  if (v12 - (v10 + 1) >= 2)
  {
    v15 = v10[1];
    v16 = v15 - 48;
    if ((v15 - 48) >= 0xA)
    {
      if ((v15 - 97) > 5)
      {
        if ((v15 - 65) > 5)
          goto LABEL_32;
        v16 = v15 - 55;
      }
      else
      {
        v16 = v15 - 87;
      }
    }
    v17 = v10[2];
    v18 = v17 - 48;
    if ((v17 - 48) >= 0xA)
    {
      if ((v17 - 97) > 5)
      {
        if ((v17 - 65) > 5)
        {
LABEL_32:
          result = 4294960554;
          goto LABEL_27;
        }
        v18 = v17 - 55;
      }
      else
      {
        v18 = v17 - 87;
      }
    }
    v10 += 3;
    LOBYTE(v14) = v18 | (16 * v16);
    ++v11;
    if (!a3)
      goto LABEL_24;
    goto LABEL_22;
  }
  result = 4294960546;
LABEL_27:
  if (a5)
    *a5 = v13 - a3;
  if (a6)
    *a6 = v11;
  return result;
}

uint64_t URLDecodeCopy(char *__s, size_t a2, _QWORD *a3, _QWORD *a4)
{
  size_t v6;
  uint64_t v8;
  _BYTE *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v6 = a2;
  if (a2 == -1)
    v6 = strlen(__s);
  v14 = 0;
  v8 = URLDecodeEx(__s, v6, 0, 0, &v14, 0);
  if ((_DWORD)v8)
    return v8;
  v9 = malloc_type_malloc(v14 + 1, 0x8B02BB2EuLL);
  if (!v9)
    return 4294960568;
  v10 = v9;
  v11 = URLDecodeEx(__s, v6, v9, v14, &v14, 0);
  if ((_DWORD)v11)
  {
    v12 = v11;
    free(v10);
  }
  else
  {
    *((_BYTE *)v10 + v14) = 0;
    *a3 = v10;
    v12 = 0;
    if (a4)
      *a4 = v14;
  }
  return v12;
}

uint64_t URLParseComponents(char *__s, char *a2, char **a3, char **a4)
{
  char *v6;
  char *v7;
  unsigned int v8;
  char *v10;
  char *v11;
  BOOL v12;
  char *v13;
  char *v14;
  uint64_t v15;
  unsigned int v16;
  BOOL v17;
  unint64_t v18;
  char *v20;
  unint64_t v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  int v28;
  char *v29;
  _BOOL4 v30;
  unsigned __int8 *v31;
  char *v32;
  char *v33;
  char *v34;
  char *v35;
  char *v36;
  char *v37;
  char *v38;
  char *v39;
  char *v40;
  _BOOL8 v41;
  BOOL v42;
  char *v43;
  int v44;
  char *v45;
  char *v47;
  int v48;

  v6 = __s;
  if (!a2)
    a2 = &__s[strlen(__s)];
  v7 = 0;
  if (a2 <= v6)
  {
    v10 = 0;
    v11 = v6;
  }
  else
  {
    do
    {
      v8 = v7[(_QWORD)v6];
      if (v8 <= 0x3F && ((1 << v8) & 0x8400800800000000) != 0)
      {
        v7 = &v7[(_QWORD)v6];
        goto LABEL_12;
      }
      ++v7;
    }
    while ((char *)(a2 - v6) != v7);
    v7 = a2;
LABEL_12:
    v12 = v8 == 58;
    if (v8 == 58)
      v11 = v7 + 1;
    else
      v11 = v6;
    if (v12)
      v10 = v6;
    else
      v10 = 0;
    if (v12)
      v6 = v7 + 1;
    if (!v12)
      v7 = 0;
  }
  v13 = (char *)(a2 - v11);
  if (a2 - v11 >= 2 && *v6 == 47 && v6[1] == 47)
  {
    v14 = v6 + 2;
    if (v6 + 2 >= a2)
    {
      v22 = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v20 = v6 + 2;
      v26 = v6 + 2;
    }
    else
    {
      v15 = 2;
      while (1)
      {
        v16 = v6[v15];
        v17 = v16 > 0x3F;
        v18 = (1 << v16) & 0x8000800800000000;
        if (!v17 && v18 != 0)
          break;
        if (v13 == (char *)++v15)
        {
          v15 = (uint64_t)v13;
          break;
        }
      }
      v20 = &v6[v15];
      if (v15 < 3)
      {
LABEL_39:
        v22 = 0;
        v23 = 0;
        v24 = 0;
        v25 = 0;
      }
      else
      {
        v21 = 2;
        while (v6[v21] != 64)
        {
          if (v15 == ++v21)
            goto LABEL_39;
        }
        v47 = &v6[v21];
        if (v21 < 3)
        {
          v25 = 0;
          v24 = 0;
          v23 = v6 + 2;
        }
        else
        {
          v23 = v6 + 2;
          v24 = v6 + 2;
          while (1)
          {
            v48 = *v24++;
            if (v48 == 58)
              break;
            v23 = v24;
            if (v24 >= v47)
            {
              v25 = 0;
              v23 = v24;
              v24 = 0;
              goto LABEL_95;
            }
          }
          v25 = v47;
        }
LABEL_95:
        v22 = v6 + 2;
        v14 = v47 + 1;
      }
      v26 = v20;
    }
  }
  else
  {
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v14 = 0;
    v26 = 0;
    v20 = v6;
  }
  if (v20 >= a2)
  {
    v30 = 0;
    if (v14)
    {
      v31 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v38 = v20;
      v29 = v20;
      goto LABEL_79;
    }
    v33 = 0;
    v32 = 0;
    v31 = 0;
    v41 = 0;
    v29 = v20;
    v38 = v20;
  }
  else
  {
    v27 = 0;
    while (1)
    {
      v28 = v20[v27];
      if (v28 == 35 || v28 == 63)
        break;
      if (a2 - v20 == ++v27)
      {
        v29 = a2;
        goto LABEL_50;
      }
    }
    v29 = &v20[v27];
LABEL_50:
    if (v28 == 63)
    {
      v33 = v29 + 1;
      if (v29 + 1 >= a2)
      {
        v28 = 63;
        v40 = v29 + 1;
        v32 = v29 + 1;
      }
      else
      {
        v39 = &a2[~(unint64_t)v29];
        v40 = v29 + 1;
        while (1)
        {
          v28 = *v40;
          if (v28 == 35)
            break;
          ++v40;
          if (!--v39)
          {
            v40 = a2;
            v32 = a2;
            goto LABEL_60;
          }
        }
        v32 = v40;
      }
    }
    else
    {
      v33 = 0;
      v32 = 0;
      v40 = v29;
    }
LABEL_60:
    v42 = v28 == 35;
    v30 = v28 == 35;
    if (v28 == 35)
      v38 = a2;
    else
      v38 = v40;
    if (v42)
      v31 = (unsigned __int8 *)(v40 + 1);
    else
      v31 = 0;
    if (v14)
    {
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      goto LABEL_79;
    }
    if (*v20 != 58)
    {
      v43 = &a2[~(unint64_t)v20];
      v35 = v20;
      while (v43)
      {
        v44 = *++v35;
        --v43;
        if (v44 == 58)
          goto LABEL_77;
      }
      v35 = a2;
LABEL_77:
      v41 = v35 < a2;
      goto LABEL_78;
    }
    v41 = 1;
  }
  v35 = v20;
LABEL_78:
  v36 = &v35[v41];
  v34 = v20;
  v37 = a2;
LABEL_79:
  *a3 = v10;
  a3[1] = (char *)(v7 - v10);
  a3[2] = v22;
  a3[3] = (char *)(v23 - v22);
  a3[4] = v24;
  a3[5] = (char *)(v25 - v24);
  a3[6] = v14;
  a3[7] = (char *)(v26 - v14);
  a3[8] = v20;
  a3[9] = (char *)(v29 - v20);
  a3[10] = v33;
  a3[11] = (char *)(v32 - v33);
  if (v30)
    v45 = a2;
  else
    v45 = 0;
  a3[12] = (char *)v31;
  a3[13] = (char *)(v45 - (char *)v31);
  if (v20 < v29 && *v20 == 47)
    ++v20;
  a3[14] = v20;
  a3[15] = v29;
  a3[16] = v34;
  a3[17] = (char *)(v35 - v34);
  a3[18] = v36;
  a3[19] = (char *)(v37 - v36);
  if (a4)
    *a4 = v38;
  return 0;
}

uint64_t URLGetNextPathSegment(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  int v7;
  uint64_t v8;
  _BYTE *v9;

  v3 = *(_QWORD *)(a1 + 112);
  v4 = *(_QWORD *)(a1 + 120);
  if (v3 >= v4 || *(_BYTE *)v3 == 47)
    return 4294960569;
  v5 = 0;
  v6 = *(_BYTE **)(a1 + 120);
  while (~v3 + v4 != v5)
  {
    v7 = *(unsigned __int8 *)(v3 + v5++ + 1);
    if (v7 == 47)
    {
      v6 = (_BYTE *)(v3 + v5);
      break;
    }
  }
  if (v6 == (_BYTE *)v3)
    return 4294960569;
  v8 = 0;
  *a2 = v3;
  *a3 = &v6[-v3];
  if ((unint64_t)v6 >= v4)
    v9 = v6;
  else
    v9 = v6 + 1;
  *(_QWORD *)(a1 + 112) = v9;
  return v8;
}

uint64_t URLGetOrCopyNextVariable(unint64_t a1, _BYTE *a2, char **a3, size_t *a4, _QWORD *a5, _QWORD *a6, size_t *a7, _QWORD *a8, _QWORD *a9)
{
  uint64_t v15;
  char *v16;
  size_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  size_t v22;
  char *v23;
  size_t *v25;
  int v26;
  void *v27;
  size_t v28;
  char *v29;
  void *v30;
  size_t v31;
  char *v32;

  v31 = 0;
  v32 = 0;
  v28 = 0;
  v29 = 0;
  v26 = 0;
  v30 = 0;
  v27 = 0;
  v15 = URLGetNextVariable(a1, a2, (unint64_t *)&v32, &v31, &v29, &v28, a9);
  if ((_DWORD)v15)
    return v15;
  v17 = v31;
  v16 = v32;
  v18 = URLDecodeEx(v32, v31, 0, 0, 0, &v26);
  if ((_DWORD)v18)
    goto LABEL_17;
  if (v26 < 1)
  {
    v20 = 0;
    if (!a8)
      goto LABEL_6;
  }
  else
  {
    v19 = URLDecodeCopy(v16, v17, &v30, &v31);
    v20 = v30;
    if ((_DWORD)v19)
      goto LABEL_15;
    v32 = (char *)v30;
    v16 = (char *)v30;
    if (!a8)
    {
LABEL_6:
      v21 = 0;
      goto LABEL_7;
    }
  }
  v25 = a7;
  v22 = v28;
  v23 = v29;
  v19 = URLDecodeEx(v29, v28, 0, 0, 0, &v26);
  if ((_DWORD)v19)
  {
LABEL_15:
    v18 = v19;
    if (v20)
      free(v20);
    goto LABEL_17;
  }
  if (v26 < 1)
  {
    v21 = 0;
    a7 = v25;
  }
  else
  {
    v19 = URLDecodeCopy(v23, v22, &v27, &v28);
    a7 = v25;
    if ((_DWORD)v19)
      goto LABEL_15;
    v21 = v27;
    v29 = (char *)v27;
  }
LABEL_7:
  *a3 = v16;
  *a4 = v31;
  *a5 = v20;
  if (a6)
    *a6 = v29;
  if (a7)
    *a7 = v28;
  v18 = 0;
  if (a8)
  {
    *a8 = v21;
    return v18;
  }
LABEL_17:
  if (v27)
    free(v27);
  return v18;
}

uint64_t URLGetNextVariable(unint64_t a1, _BYTE *a2, unint64_t *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, _QWORD *a7)
{
  _BYTE *v7;
  BOOL v8;
  int v9;
  _BYTE *v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  _BYTE *v14;
  uint64_t v15;

  if (a1 >= (unint64_t)a2)
    return 4294960569;
  v7 = 0;
  v8 = 1;
  while (1)
  {
    v9 = v7[a1];
    if (v9 == 38 || v9 == 61)
      break;
    v8 = &(++v7)[a1] < a2;
    if (&a2[-a1] == v7)
    {
      v10 = a2;
      goto LABEL_8;
    }
  }
  v10 = &v7[a1];
LABEL_8:
  v11 = &v10[v8];
  if (v9 == 61)
  {
    if (v11 >= a2)
    {
      v12 = 0;
      v13 = v11;
    }
    else
    {
      v12 = 1;
      v13 = v11;
      while (*v13 != 38)
      {
        if (++v13 >= a2)
        {
          v12 = 0;
          v13 = a2;
          break;
        }
      }
    }
    v14 = &v13[v12];
  }
  else
  {
    v13 = 0;
    v14 = &v10[v8];
    v11 = 0;
  }
  v15 = 0;
  *a3 = a1;
  *a4 = &v10[-a1];
  *a5 = v11;
  *a6 = v13 - v11;
  *a7 = v14;
  return v15;
}

uint64_t URLGetOrCopyVariable(unint64_t a1, _BYTE *a2, unsigned __int8 *a3, _QWORD *a4, _QWORD *a5, char **a6, _QWORD *a7)
{
  uint64_t result;
  char *v14;
  size_t v15;
  unsigned __int8 *v16;
  int v17;
  int v18;
  char *v19;
  int v20;
  char *v21;
  size_t v22;
  char *v23;
  void *v24;
  size_t v25;
  char *v26;
  unint64_t v27;

  v26 = 0;
  v27 = a1;
  v24 = 0;
  v25 = 0;
  v22 = 0;
  v23 = 0;
  v20 = 0;
  while (1)
  {
    result = URLGetOrCopyNextVariable(v27, a2, &v26, &v25, &v24, &v23, &v22, 0, &v27);
    if ((_DWORD)result)
      return result;
    v14 = v26;
    v15 = v25;
    v16 = a3;
    while (v15)
    {
      v17 = *v16;
      if (*v14 != v17)
      {
        v18 = 1;
        goto LABEL_12;
      }
      ++v16;
      ++v14;
      --v15;
      if (!v17)
      {
        v18 = 0;
        goto LABEL_12;
      }
    }
    if (a3[v25])
      v18 = -1;
    else
      v18 = 0;
LABEL_12:
    if (v24)
      free(v24);
    if (!v18)
    {
      v21 = 0;
      if (!a6)
        goto LABEL_20;
      result = URLDecodeEx(v23, v22, 0, 0, 0, &v20);
      if ((_DWORD)result)
        return result;
      if (v20 >= 1)
      {
        result = URLDecodeCopy(v23, v22, &v21, &v22);
        if ((_DWORD)result)
          return result;
        v19 = v21;
        v23 = v21;
      }
      else
      {
LABEL_20:
        v19 = 0;
      }
      if (a4)
        *a4 = v23;
      if (a5)
        *a5 = v22;
      if (a6)
        *a6 = v19;
      result = 0;
      if (a7)
        *a7 = v27;
      return result;
    }
  }
}

uint64_t URLGetVariable(unint64_t a1, _BYTE *a2, unsigned __int8 *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6)
{
  uint64_t result;
  unsigned __int8 *v12;
  uint64_t v13;
  unsigned __int8 *v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int8 *v20;
  unint64_t v21;

  v20 = 0;
  v21 = a1;
  v18 = 0;
  v19 = 0;
  v17 = 0;
LABEL_2:
  while (2)
  {
    result = URLGetNextVariable(v21, a2, (unint64_t *)&v20, &v19, &v18, &v17, &v21);
    if (!(_DWORD)result)
    {
      v12 = v20;
      v13 = v19;
      v14 = a3;
      while (v13)
      {
        v15 = *v14;
        if (*v12 != v15)
          goto LABEL_2;
        ++v14;
        ++v12;
        --v13;
        if (!v15)
          goto LABEL_14;
      }
      if (a3[v19])
        v16 = -1;
      else
        v16 = 0;
      if (v16)
        continue;
LABEL_14:
      if (a4)
        *a4 = v18;
      if (a5)
        *a5 = v17;
      result = 0;
      if (a6)
        *a6 = v21;
    }
    return result;
  }
}

uint64_t UUIDGet(_BYTE *a1)
{
  uint64_t result;

  result = RandomBytes(a1, 0x10uLL);
  a1[6] = a1[6] & 0xF | 0x40;
  a1[8] = a1[8] & 0x3F | 0x80;
  return result;
}

uint64_t UUIDGetPerSystemHost(const char *a1, size_t a2, uuid_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  timespec v13;

  v13.tv_sec = 0;
  v13.tv_nsec = 0;
  v6 = gethostuuid(a3, &v13);
  if ((_DWORD)v6)
  {
    if (gLogCategory_CUMisc <= 90)
    {
      v11 = v6;
      if (gLogCategory_CUMisc != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMisc, 0x5Au))
        LogPrintF((uint64_t)&gLogCategory_CUMisc, (uint64_t)"void UUIDGetPerSystemHost(const void *, size_t, void *)", 0x5Au, (uint64_t)"### gethostuuid failed for per-system host UUID: %#m\n", v7, v8, v9, v10, v11);
    }
    RandomBytes(a3, 0x10uLL);
    a3[6] = a3[6] & 0xF | 0x40;
    a3[8] = a3[8] & 0x3F | 0x80;
  }
  if (a2 == -1)
    a2 = strlen(a1);
  result = CryptoHKDF((uint64_t)kCryptoHashDescriptor_SHA512, (uint64_t)a3, 16, "PerSystem", 9uLL, (uint64_t)a1, a2, 0x10uLL, (uint64_t)a3);
  a3[6] = a3[6] & 0xF | 0x40;
  a3[8] = a3[8] & 0x3F | 0x80;
  return result;
}

uint64_t UUIDGetPerUserHost(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uid_t v12;
  uint64_t result;
  timespec v14;
  uuid_t bytes;
  int v16;
  char v17;
  char v18;
  char v19;
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  memset(bytes, 0, sizeof(bytes));
  v14.tv_sec = 0;
  v14.tv_nsec = 0;
  v6 = gethostuuid(bytes, &v14);
  if ((_DWORD)v6)
  {
    if (gLogCategory_CUMisc <= 90)
    {
      v11 = v6;
      if (gLogCategory_CUMisc != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMisc, 0x5Au))
        LogPrintF((uint64_t)&gLogCategory_CUMisc, (uint64_t)"void UUIDGetPerUserHost(const void *, size_t, void *)", 0x5Au, (uint64_t)"### gethostuuid failed for per-user host UUID: %#m\n", v7, v8, v9, v10, v11);
    }
    RandomBytes(bytes, 0x10uLL);
    bytes[6] = bytes[6] & 0xF | 0x40;
    bytes[8] = bytes[8] & 0x3F | 0x80;
  }
  v12 = getuid();
  v16 = 0;
  v17 = HIBYTE(v12);
  v18 = BYTE2(v12);
  v19 = BYTE1(v12);
  v20 = v12;
  result = CryptoHKDF((uint64_t)kCryptoHashDescriptor_SHA512, (uint64_t)bytes, 24, "PerUser", 7uLL, a1, a2, 0x10uLL, a3);
  *(_BYTE *)(a3 + 6) = *(_BYTE *)(a3 + 6) & 0xF | 0x40;
  *(_BYTE *)(a3 + 8) = *(_BYTE *)(a3 + 8) & 0x3F | 0x80;
  return result;
}

uint64_t _WiFiManagerGetTypeID()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  gWiFiManagerTypeID = result;
  return result;
}

pthread_mutex_t *_WiFiManagerFinalize(uint64_t a1)
{
  const void *v2;
  int v3;
  const void *v4;
  const void *v5;
  const void *v6;
  pthread_mutex_t *result;

  v2 = *(const void **)(a1 + 88);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(a1 + 88) = 0;
  }
  v3 = *(_DWORD *)(a1 + 104);
  if ((v3 & 0x80000000) == 0)
  {
    if (close(v3) && *__error())
      __error();
    *(_DWORD *)(a1 + 104) = -1;
  }
  v4 = *(const void **)(a1 + 176);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(a1 + 176) = 0;
  }
  v5 = *(const void **)(a1 + 184);
  if (v5)
  {
    CFRelease(v5);
    *(_QWORD *)(a1 + 184) = 0;
  }
  if (*(_QWORD *)(a1 + 152))
  {
    Apple80211Close();
    *(_QWORD *)(a1 + 152) = 0;
  }
  v6 = *(const void **)(a1 + 168);
  if (v6)
  {
    CFRelease(v6);
    *(_QWORD *)(a1 + 168) = 0;
  }
  result = *(pthread_mutex_t **)(a1 + 80);
  if (result)
  {
    result = (pthread_mutex_t *)pthread_mutex_destroy(result);
    *(_QWORD *)(a1 + 80) = 0;
  }
  return result;
}

uint64_t WiFiManagerCreate(_QWORD *a1)
{
  uint64_t Instance;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  if (gWiFiManagerInitOnce != -1)
    dispatch_once_f(&gWiFiManagerInitOnce, 0, (dispatch_function_t)_WiFiManagerGetTypeID);
  Instance = _CFRuntimeCreateInstance();
  if (!Instance)
    return 4294960568;
  v3 = (_QWORD *)Instance;
  *(_OWORD *)(Instance + 16) = 0u;
  v4 = Instance + 16;
  *(_OWORD *)(Instance + 160) = 0u;
  *(_OWORD *)(Instance + 176) = 0u;
  *(_OWORD *)(Instance + 128) = 0u;
  *(_OWORD *)(Instance + 144) = 0u;
  *(_OWORD *)(Instance + 96) = 0u;
  *(_OWORD *)(Instance + 112) = 0u;
  *(_OWORD *)(Instance + 64) = 0u;
  *(_OWORD *)(Instance + 80) = 0u;
  *(_OWORD *)(Instance + 32) = 0u;
  *(_OWORD *)(Instance + 48) = 0u;
  *(_DWORD *)(Instance + 104) = -1;
  v5 = pthread_mutex_init((pthread_mutex_t *)(Instance + 16), 0);
  if ((_DWORD)v5)
  {
    CFRelease(v3);
  }
  else
  {
    v3[10] = v4;
    *a1 = v3;
  }
  return v5;
}

uint64_t WiFiManagerDoApple80211(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  const char *v13;
  const void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  const void *v25;

  v8 = a5;
  v25 = 0;
  if (gLogCategory_WiFiManagerCore <= 30
    && (gLogCategory_WiFiManagerCore != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_WiFiManagerCore, 0x1Eu)))
  {
    v13 = "get";
    if (!a2)
      v13 = "set";
    LogPrintF((uint64_t)&gLogCategory_WiFiManagerCore, (uint64_t)"OSStatus WiFiManagerDoApple80211(CUWiFiManagerRef, int, int, void *, size_t)", 0x1Eu, (uint64_t)"WiFiManagerDoApple80211: %s, ioc 0x%X, len %zu", a5, a6, a7, a8, (uint64_t)v13);
  }
  if (a1)
  {
    v14 = 0;
  }
  else
  {
    v22 = WiFiManagerCreate(&v25);
    v14 = v25;
    a1 = (uint64_t)v25;
    if ((_DWORD)v22)
      goto LABEL_38;
  }
  v15 = _WiFiManagerEnsureInitialized(a1);
  if ((_DWORD)v15)
  {
    v22 = v15;
    goto LABEL_38;
  }
  if (!*(_QWORD *)(a1 + 152) && (v20 = Apple80211Open(), (_DWORD)v20))
  {
    v22 = v20;
    if (gLogCategory_WiFiManagerCore <= 60
      && (gLogCategory_WiFiManagerCore != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_WiFiManagerCore, 0x3Cu)))
    {
      LogPrintF((uint64_t)&gLogCategory_WiFiManagerCore, (uint64_t)"OSStatus WiFiManagerDoApple80211(CUWiFiManagerRef, int, int, void *, size_t)", 0x3Cu, (uint64_t)"### Open failed: %#m", v16, v17, v18, v19, v22);
    }
  }
  else
  {
    if (*(_BYTE *)(a1 + 160))
      goto LABEL_16;
    if (!*(_QWORD *)(a1 + 168))
    {
      if (gLogCategory_WiFiManagerCore <= 60
        && (gLogCategory_WiFiManagerCore != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_WiFiManagerCore, 0x3Cu)))
      {
        v22 = 4294960596;
        LogPrintF((uint64_t)&gLogCategory_WiFiManagerCore, (uint64_t)"OSStatus WiFiManagerDoApple80211(CUWiFiManagerRef, int, int, void *, size_t)", 0x3Cu, (uint64_t)"### No ifname: %#m", v16, v17, v18, v19, 4294960596);
        goto LABEL_38;
      }
      goto LABEL_37;
    }
    v21 = Apple80211BindToInterface();
    if (!(_DWORD)v21)
    {
      *(_BYTE *)(a1 + 160) = 1;
LABEL_16:
      *(_DWORD *)(a1 + 128) = a3;
      *(_DWORD *)(a1 + 136) = v8;
      *(_QWORD *)(a1 + 144) = a4;
      if (a2)
      {
        if (Apple80211RawGet())
          goto LABEL_18;
      }
      else if (Apple80211RawSet())
      {
LABEL_18:
        if (*__error())
        {
          v22 = *__error();
          goto LABEL_38;
        }
LABEL_37:
        v22 = 4294960596;
        goto LABEL_38;
      }
      v22 = 0;
      goto LABEL_38;
    }
    v22 = v21;
    if (gLogCategory_WiFiManagerCore <= 60
      && (gLogCategory_WiFiManagerCore != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_WiFiManagerCore, 0x3Cu)))
    {
      LogPrintF((uint64_t)&gLogCategory_WiFiManagerCore, (uint64_t)"OSStatus WiFiManagerDoApple80211(CUWiFiManagerRef, int, int, void *, size_t)", 0x3Cu, (uint64_t)"### Bind failed: '%@', %#m", v16, v17, v18, v19, *(_QWORD *)(a1 + 168));
    }
  }
LABEL_38:
  if (v14)
    CFRelease(v14);
  if ((_DWORD)v22
    && gLogCategory_WiFiManagerCore <= 90
    && (gLogCategory_WiFiManagerCore != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_WiFiManagerCore, 0x5Au)))
  {
    v23 = "get";
    if (!a2)
      v23 = "set";
    LogPrintF((uint64_t)&gLogCategory_WiFiManagerCore, (uint64_t)"OSStatus WiFiManagerDoApple80211(CUWiFiManagerRef, int, int, void *, size_t)", 0x5Au, (uint64_t)"### WiFiManagerDoApple80211 failed: %s, ioc 0x%X, len %zu, error %#m", v16, v17, v18, v19, (uint64_t)v23);
  }
  return v22;
}

uint64_t _WiFiManagerEnsureInitialized(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const void *v4;
  const __CFArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFArray *v10;
  CFIndex Count;
  CFIndex v12;
  CFIndex i;
  const void *ValueAtIndex;
  const void *InterfaceName;
  int v16;
  const __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v23;

  pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 80));
  if (*(_QWORD *)(a1 + 184))
  {
    v2 = 0;
    goto LABEL_32;
  }
  v3 = WiFiManagerClientCreate();
  if (!v3)
  {
    v2 = 4294960596;
    goto LABEL_32;
  }
  v4 = (const void *)v3;
  v5 = (const __CFArray *)WiFiManagerClientCopyInterfaces();
  v10 = v5;
  if (v5)
  {
    Count = CFArrayGetCount(v5);
    if (Count >= 1)
    {
      v12 = Count;
      for (i = 0; v12 != i; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v10, i);
        if (*(_QWORD *)(a1 + 88))
        {
          InterfaceName = (const void *)WiFiDeviceClientGetInterfaceName();
          if (InterfaceName && CFEqual(InterfaceName, *(CFTypeRef *)(a1 + 88)))
          {
LABEL_14:
            CFRetain(ValueAtIndex);
            *(_QWORD *)(a1 + 184) = ValueAtIndex;
            *(_BYTE *)(a1 + 96) = WiFiDeviceClientIsInterfaceAWDL();
            break;
          }
        }
        else if (!WiFiDeviceClientGetInterfaceRoleIndex())
        {
          goto LABEL_14;
        }
      }
    }
  }
  if (!*(_QWORD *)(a1 + 184))
  {
    if (gLogCategory_WiFiManagerCore <= 30
      && (gLogCategory_WiFiManagerCore != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_WiFiManagerCore, 0x1Eu)))
    {
      v23 = *(const __CFString **)(a1 + 88);
      if (!v23)
        v23 = CFSTR("*");
      LogPrintF((uint64_t)&gLogCategory_WiFiManagerCore, (uint64_t)"OSStatus _WiFiManagerEnsureInitialized(CUWiFiManagerRef)", 0x1Eu, (uint64_t)"### Init interface not found (%@)\n", v6, v7, v8, v9, (uint64_t)v23);
    }
    v2 = 4294960569;
    goto LABEL_28;
  }
  *(_QWORD *)(a1 + 176) = v4;
  v16 = socket(2, 2, 0);
  *(_DWORD *)(a1 + 104) = v16;
  if ((v16 & 0x80000000) == 0)
    goto LABEL_17;
  if (*__error())
  {
    v2 = *__error();
    if ((_DWORD)v2)
    {
LABEL_27:
      v4 = 0;
      goto LABEL_28;
    }
LABEL_17:
    v17 = (const __CFString *)WiFiDeviceClientGetInterfaceName();
    v4 = v17;
    if (!v17)
    {
      v2 = 4294960552;
      goto LABEL_28;
    }
    CFStringGetCString(v17, (char *)(a1 + 112), 16, 0x8000100u);
    *(_QWORD *)(a1 + 168) = CFRetain(v4);
    if (gLogCategory_WiFiManagerCore <= 30
      && (gLogCategory_WiFiManagerCore != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_WiFiManagerCore, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_WiFiManagerCore, (uint64_t)"OSStatus _WiFiManagerEnsureInitialized(CUWiFiManagerRef)", 0x1Eu, (uint64_t)"Initialized for %@ (%.6a)\n", v18, v19, v20, v21, (uint64_t)v4);
    }
    v2 = 0;
    goto LABEL_27;
  }
  v4 = 0;
  v2 = 4294960596;
LABEL_28:
  if (v10)
    CFRelease(v10);
  if (v4)
    CFRelease(v4);
LABEL_32:
  pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 80));
  return v2;
}

unint64_t WiFiManagerGetInt64(uint64_t a1, const void *a2, uint64_t a3, int *a4)
{
  uint64_t v6;
  const void *v7;
  uint64_t v8;
  CFNumberRef Int64;
  CFNumberRef v10;
  const __CFDictionary *v11;
  const __CFString *Value;
  CFNumberRef v13;
  CFNumberRef v14;
  CFIndex Count;
  CFIndex v16;
  uint64_t v17;
  CFIndex i;
  const __CFString *ValueAtIndex;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  unint64_t v26;
  const __CFDictionary *v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int Power;
  CFTypeRef *v35;
  _DWORD valuePtr[2];
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  const void *v41;
  int v42;

  v6 = a1;
  v7 = 0;
  v41 = 0;
  if (!a1)
  {
    v42 = WiFiManagerCreate(&v41);
    v7 = v41;
    if (v42)
      goto LABEL_14;
    v6 = (uint64_t)v41;
  }
  v42 = _WiFiManagerEnsureInitialized(v6);
  if (!v42)
  {
    if (CFEqual(a2, CFSTR("channel")))
    {
      if (*(_BYTE *)(v6 + 96))
        v8 = 132;
      else
        v8 = 4;
      Int64 = CFNumberCreateInt64(v8);
      if (Int64)
      {
        v10 = Int64;
        v11 = (const __CFDictionary *)WiFiDeviceClientCopyProperty();
        CFRelease(v10);
        if (v11)
        {
          Value = (const __CFString *)CFDictionaryGetValue(v11, CFSTR("CHANNEL"));
          if (Value)
          {
LABEL_10:
            CFRetain(Value);
            v42 = 0;
            goto LABEL_11;
          }
          v29 = -6727;
LABEL_63:
          v42 = v29;
LABEL_11:
          CFRelease(v11);
          if (!v7)
            goto LABEL_40;
LABEL_39:
          CFRelease(v7);
          goto LABEL_40;
        }
        goto LABEL_56;
      }
      goto LABEL_60;
    }
    if (CFEqual(a2, CFSTR("features")))
    {
      LOBYTE(valuePtr[0]) = 12;
      v13 = CFNumberCreate(0, kCFNumberSInt8Type, valuePtr);
      if (!v13)
      {
LABEL_60:
        Value = 0;
        goto LABEL_61;
      }
      v14 = v13;
      Value = (const __CFString *)WiFiDeviceClientCopyProperty();
      CFRelease(v14);
      if (!Value)
      {
LABEL_57:
        v25 = -6735;
        goto LABEL_58;
      }
      Count = CFArrayGetCount((CFArrayRef)Value);
      if (Count < 1)
      {
        v17 = 0;
      }
      else
      {
        v16 = Count;
        v17 = 0;
        for (i = 0; i != v16; ++i)
        {
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)Value, i);
          if (CFGetInt64(ValueAtIndex, &v42) == 51 && v42 == 0)
            v17 = 1;
        }
      }
      CFRelease(Value);
      Value = (const __CFString *)CFNumberCreateInt64(v17);
      if (!Value)
      {
LABEL_61:
        v25 = -6728;
LABEL_58:
        v42 = v25;
        if (v7)
          goto LABEL_39;
        goto LABEL_40;
      }
LABEL_38:
      v42 = 0;
      if (!v7)
        goto LABEL_40;
      goto LABEL_39;
    }
    if (!CFEqual(a2, CFSTR("rssiAggregate")))
    {
      if (!CFEqual(a2, CFSTR("powered")))
      {
        if (gLogCategory_WiFiManagerCore <= 60
          && (gLogCategory_WiFiManagerCore != -1
           || _LogCategory_Initialize((uint64_t)&gLogCategory_WiFiManagerCore, 0x3Cu)))
        {
          LogPrintF((uint64_t)&gLogCategory_WiFiManagerCore, (uint64_t)"CFTypeRef WiFiManagerCopyProperty(CUWiFiManagerRef, CFStringRef, CFTypeRef, OSStatus *)", 0x3Cu, (uint64_t)"### Get of unknown property '%@'\n", v30, v31, v32, v33, (uint64_t)a2);
        }
LABEL_56:
        Value = 0;
        goto LABEL_57;
      }
      Power = WiFiDeviceClientGetPower();
      v35 = (CFTypeRef *)MEMORY[0x1E0C9AE50];
      if (!Power)
        v35 = (CFTypeRef *)MEMORY[0x1E0C9AE40];
      Value = (const __CFString *)*v35;
      CFRetain(*v35);
      goto LABEL_38;
    }
    if (!*(_BYTE *)(v6 + 96) || !*(_BYTE *)(v6 + 103))
    {
      v28 = (const __CFDictionary *)WiFiDeviceClientCopyProperty();
      if (v28)
      {
        v11 = v28;
        Value = (const __CFString *)CFDictionaryGetValue(v28, CFSTR("RSSI_CTL_AGR"));
        if (Value)
          goto LABEL_10;
        v29 = -6735;
        goto LABEL_63;
      }
      goto LABEL_56;
    }
    v37 = 0;
    v38 = 0;
    v40 = 0;
    v39 = 0;
    LOWORD(v37) = *(_WORD *)(v6 + 101);
    v24 = *(_DWORD *)(v6 + 97);
    valuePtr[0] = 1;
    valuePtr[1] = v24;
    v42 = WiFiManagerDoApple80211(v6, 1, 153, (uint64_t)valuePtr, 36, v21, v22, v23);
    if (!v42)
    {
      Value = (const __CFString *)CFNumberCreateInt64((int)v38);
      if (!Value)
      {
        v25 = -6727;
        goto LABEL_58;
      }
      goto LABEL_38;
    }
  }
LABEL_14:
  Value = 0;
  if (v7)
    goto LABEL_39;
LABEL_40:
  if (a4)
    *a4 = v42;
  if (!Value)
    return 0;
  v26 = CFGetInt64(Value, a4);
  CFRelease(Value);
  return v26;
}

uint64_t WiFiManagerSetProperty(uint64_t a1, CFTypeRef cf1, const __CFString *a3, const __CFString *a4)
{
  CFTypeID v8;
  char *v9;
  uint64_t result;
  char v11;
  const void *v12;
  unsigned int v13;

  if (CFEqual(cf1, CFSTR("interfaceName")))
  {
    if (a4 && (v8 = CFGetTypeID(a4), v8 == CFStringGetTypeID()))
    {
      v13 = 0;
      v9 = (char *)(a1 + 97);
      if (!a3)
      {
        v11 = 0;
        *(_WORD *)(a1 + 101) = 0;
        *(_DWORD *)v9 = 0;
LABEL_11:
        *(_BYTE *)(a1 + 103) = v11;
        v12 = *(const void **)(a1 + 88);
        CFRetain(a4);
        *(_QWORD *)(a1 + 88) = a4;
        if (v12)
          CFRelease(v12);
        return 0;
      }
      CFGetHardwareAddress(a3, v9, 6uLL, (int *)&v13);
      result = v13;
      if (!v13)
      {
        v11 = 1;
        goto LABEL_11;
      }
    }
    else
    {
      return 4294960540;
    }
  }
  else if (CFEqual(cf1, CFSTR("powered")))
  {
    CFGetInt64(a4, 0);
    result = WiFiDeviceClientSetPower();
    if (!(_DWORD)result)
      return 0;
  }
  else
  {
    return 4294960561;
  }
  return result;
}

uint64_t AWDLTrafficRegister(uint64_t a1, int a2, int a3)
{
  uint64_t v6;
  CFTypeRef v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CFTypeRef cf;
  _BYTE v13[184];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  cf = 0;
  memset(v13, 0, sizeof(v13));
  v6 = WiFiManagerCreate(&cf);
  v7 = cf;
  if (!(_DWORD)v6)
  {
    WiFiManagerSetProperty((uint64_t)cf, CFSTR("interfaceName"), 0, CFSTR("awdl0"));
    memset(&v13[4], 0, 180);
    *(_DWORD *)v13 = 1;
    if (a1)
    {
      *(_DWORD *)&v13[4] = *(_DWORD *)a1;
      *(_WORD *)&v13[8] = *(_WORD *)(a1 + 4);
    }
    *(_DWORD *)&v13[12] = 26;
    qmemcpy(&v13[16], "airplay-connectivity-check", 26);
    *(_DWORD *)&v13[168] = a2;
    if (a2)
      *(_DWORD *)&v13[172] = 1;
    if (a3)
      *(_DWORD *)&v13[172] = 2;
    v6 = WiFiManagerDoApple80211((uint64_t)v7, 0, 164, (uint64_t)v13, 184, v8, v9, v10);
  }
  if (v7)
    CFRelease(v7);
  return v6;
}

uint64_t WiFiJoinNetworkEx(const __CFDictionary *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  __CFDictionary *MutableCopy;
  void *v8;
  id v9;
  uint64_t v10;

  v5 = a3;
  v6 = a2;
  MutableCopy = CFDictionaryCreateMutableCopy(0, 0, a1);
  v8 = _Block_copy(v5);

  v9 = v8;
  CFDictionarySetValue(MutableCopy, CFSTR("joinExCompletion"), v9);
  CFRelease(v9);
  CFDictionarySetValue(MutableCopy, CFSTR("queue"), v6);
  v10 = WiFiJoinNetwork(MutableCopy, v6, 0, 0);

  CFRelease(MutableCopy);
  return v10;
}

uint64_t WiFiJoinNetwork(const void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  NSObject *v8;
  __CFDictionary *Mutable;
  __CFDictionary *v10;
  CFTypeID TypeID;
  const void *Value;
  uint64_t v13;
  const void *v14;
  const __CFArray *v15;
  const __CFArray *v16;
  const void *ValueAtIndex;
  uint64_t v18;
  uint8_t v20[16];
  UInt8 v21[8];
  UInt8 bytes[8];

  v7 = a2;
  *(_QWORD *)v21 = a4;
  *(_QWORD *)bytes = a3;
  logger_13879();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_18D40C000, v8, OS_LOG_TYPE_DEFAULT, "WiFiJoinNetwork start", v20, 2u);
  }

  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!Mutable)
  {
    v18 = 4294960568;
    goto LABEL_28;
  }
  v10 = Mutable;
  CFDictionarySetValue(Mutable, CFSTR("options"), a1);
  if (!CFDictionaryGetValue((CFDictionaryRef)a1, CFSTR("platformNetwork")))
  {
    v18 = 4294960591;
    goto LABEL_33;
  }
  if (CFDictionaryGetInt64((const __CFDictionary *)a1, CFSTR("directed"), 0))
    WiFiNetworkSetDirectedState();
  if (getkWiFiNetworkShareableEAPConfig() && CFDictionaryGetValue((CFDictionaryRef)a1, CFSTR("eapConfig")))
  {
    getkWiFiNetworkShareableEAPConfig();
    WiFiNetworkSetProperty();
  }
  if (CFDictionaryGetValue((CFDictionaryRef)a1, CFSTR("eapTrustExceptions")))
  {
    getkWiFiNetworkShareableEAPTrustExceptions();
    WiFiNetworkSetProperty();
  }
  TypeID = CFStringGetTypeID();
  if (CFDictionaryGetTypedValue((const __CFDictionary *)a1, CFSTR("password"), TypeID, 0)
    && !WiFiNetworkSetPassword())
  {
    goto LABEL_30;
  }
  Value = CFDictionaryGetValue((CFDictionaryRef)a1, CFSTR("persistent"));
  if (Value)
    CFDictionarySetValue(v10, CFSTR("persistent"), Value);
  v13 = WiFiManagerClientCreate();
  if (!v13)
  {
LABEL_30:
    v18 = 4294960596;
LABEL_33:
    v16 = v10;
    goto LABEL_27;
  }
  v14 = (const void *)v13;
  CFRunLoopGetMain();
  WiFiManagerClientScheduleWithRunLoop();
  CFDictionarySetValue(v10, CFSTR("platformManager"), v14);
  v15 = (const __CFArray *)WiFiManagerClientCopyDevices();
  v16 = v15;
  if (!v15 || CFArrayGetCount(v15) < 1)
  {
    v18 = 4294960569;
    goto LABEL_24;
  }
  ValueAtIndex = CFArrayGetValueAtIndex(v16, 0);
  CFDictionarySetValue(v10, CFSTR("platformDevice"), ValueAtIndex);
  if (v7)
    CFDictionarySetValue(v10, CFSTR("queue"), v7);
  if (a3)
  {
    CFDictionarySetData(v10, CFSTR("callback"), bytes, 8);
    CFDictionarySetData(v10, CFSTR("context"), v21, 8);
  }
  v18 = WiFiDeviceClientAssociateAsync();
  if ((_DWORD)v18)
  {
LABEL_24:
    CFRelease(v10);
    CFRunLoopGetMain();
    WiFiManagerClientUnscheduleFromRunLoop();
    CFRelease(v14);
    if (!v16)
      goto LABEL_28;
    goto LABEL_27;
  }
  CFRelease(v14);
LABEL_27:
  CFRelease(v16);
LABEL_28:

  return v18;
}

id logger_13879()
{
  if (sCUOSLogCreateOnce_logger_13936 != -1)
    dispatch_once(&sCUOSLogCreateOnce_logger_13936, &__block_literal_global_13937);
  return (id)sCUOSLogHandle_logger_13938;
}

uint64_t initValkWiFiNetworkShareableEAPConfig()
{
  uint64_t *v0;
  uint64_t result;

  if (MobileWiFiLibrary_sOnce != -1)
    dispatch_once(&MobileWiFiLibrary_sOnce, &__block_literal_global_120);
  v0 = (uint64_t *)dlsym((void *)MobileWiFiLibrary_sLib, "kWiFiNetworkShareableEAPConfig");
  if (v0)
  {
    result = *v0;
    constantValkWiFiNetworkShareableEAPConfig = result;
  }
  else
  {
    result = constantValkWiFiNetworkShareableEAPConfig;
  }
  getkWiFiNetworkShareableEAPConfig = kWiFiNetworkShareableEAPConfigFunction;
  return result;
}

uint64_t kWiFiNetworkShareableEAPConfigFunction()
{
  return constantValkWiFiNetworkShareableEAPConfig;
}

uint64_t initValkWiFiNetworkShareableEAPTrustExceptions()
{
  uint64_t *v0;
  uint64_t result;

  if (MobileWiFiLibrary_sOnce != -1)
    dispatch_once(&MobileWiFiLibrary_sOnce, &__block_literal_global_120);
  v0 = (uint64_t *)dlsym((void *)MobileWiFiLibrary_sLib, "kWiFiNetworkShareableEAPTrustExceptions");
  if (v0)
  {
    result = *v0;
    constantValkWiFiNetworkShareableEAPTrustExceptions = result;
  }
  else
  {
    result = constantValkWiFiNetworkShareableEAPTrustExceptions;
  }
  getkWiFiNetworkShareableEAPTrustExceptions = kWiFiNetworkShareableEAPTrustExceptionsFunction;
  return result;
}

uint64_t kWiFiNetworkShareableEAPTrustExceptionsFunction()
{
  return constantValkWiFiNetworkShareableEAPTrustExceptions;
}

void _WiFiJoinNetworkCB(int a1, uint64_t a2, int a3, uint64_t a4, CFDictionaryRef theDict)
{
  CFTypeID TypeID;
  const __CFDictionary *TypedValue;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  __CFDictionary *Property;
  __CFDictionary *Mutable;
  CFTypeID v15;
  __CFDictionary *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _BOOL4 v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  _QWORD block[6];
  int v45;
  _QWORD v46[4];
  const __CFDictionary *v47;
  __CFDictionary *v48;
  __CFDictionary *v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  CFDictionaryGetValue(theDict, CFSTR("platformManager"));
  TypeID = CFDictionaryGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(theDict, CFSTR("options"), TypeID, 0);
  if (a2 && !(_DWORD)a4 && CFDictionaryGetInt64(theDict, CFSTR("persistent"), 0))
  {
    if (CFDictionaryGetInt64(TypedValue, CFSTR("directed"), 0))
      WiFiNetworkSetDirectedState();
    if (CFDictionaryGetInt64(TypedValue, CFSTR("homeNetwork"), 0))
    {
      WiFiNetworkSetIntProperty();
      WiFiNetworkSetProperty();
    }
    if (CFDictionaryGetInt64(TypedValue, CFSTR("forceFix"), 0))
      WiFiNetworkSetProperty();
    WiFiManagerClientAddNetwork();
  }
  v51 = 0;
  v52 = 0;
  CFDictionaryGetValue(theDict, CFSTR("queue"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (TypedValue)
  {
    CFDictionaryGetValue(TypedValue, CFSTR("joinExCompletion"));
    TypedValue = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v12 = v11 != 0;
    if (TypedValue && v11)
    {
      if (a2)
      {
        Property = (__CFDictionary *)WiFiNetworkGetProperty();
        if (!Property || (Mutable = Property, v15 = CFGetTypeID(Property), v15 != CFDictionaryGetTypeID()))
        {
          Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
          _WiFiDictionaryAddNetworkAdditionalInfo(Mutable);
          v16 = Mutable;
LABEL_28:
          logger_13879();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            NSPrintF((uint64_t)"%##@", v28, v29, v30, v31, v32, v33, v34, (uint64_t)Mutable);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            NSPrintF((uint64_t)"%#m", v36, v37, v38, v39, v40, v41, v42, a4);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v54 = v35;
            v55 = 2112;
            v56 = v43;
            _os_log_impl(&dword_18D40C000, v27, OS_LOG_TYPE_DEFAULT, "WiFiJoinNetwork completed: info=%@, error=%@", buf, 0x16u);

          }
          if (Mutable)
            CFRetain(Mutable);
          v46[0] = MEMORY[0x1E0C809B0];
          v46[1] = 3221225472;
          v46[2] = ___WiFiJoinNetworkCB_block_invoke;
          v46[3] = &unk_1E25DF368;
          TypedValue = TypedValue;
          v47 = TypedValue;
          v48 = Mutable;
          v50 = a4;
          v49 = v16;
          dispatch_async(v11, v46);

          goto LABEL_33;
        }
      }
      else
      {
        Mutable = 0;
      }
      v16 = 0;
      goto LABEL_28;
    }
  }
  else
  {
    v12 = v10 != 0;
  }
  logger_13879();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    NSPrintF((uint64_t)"%#m", v18, v19, v20, v21, v22, v23, v24, a4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v54 = v25;
    _os_log_impl(&dword_18D40C000, v17, OS_LOG_TYPE_DEFAULT, "WiFiJoinNetwork completed: error=%@", buf, 0xCu);

  }
  v52 = 0;
  CFDictionaryGetData(theDict, CFSTR("callback"), (const char *)&v52, 8uLL, 0, 0);
  v51 = 0;
  CFDictionaryGetData(theDict, CFSTR("context"), (const char *)&v51, 8uLL, 0, 0);
  if (v52)
    v26 = v12;
  else
    v26 = 0;
  if (v26)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___WiFiJoinNetworkCB_block_invoke_129;
    block[3] = &__block_descriptor_52_e5_v8__0l;
    v45 = a4;
    block[4] = v52;
    block[5] = v51;
    dispatch_async(v11, block);
  }
LABEL_33:
  CFRunLoopGetMain();
  WiFiManagerClientUnscheduleFromRunLoop();
  CFRelease(theDict);

}

void _WiFiDictionaryAddNetworkAdditionalInfo(__CFDictionary *a1)
{
  const void *Property;
  const __CFString *v3;
  const void *v4;
  const char *v5;
  const void *v6;
  int v7;
  __int16 v8;
  char __str[8];
  __int16 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  Property = (const void *)WiFiNetworkGetProperty();
  if (Property)
    CFDictionarySetValue(a1, CFSTR("cca"), Property);
  v3 = (const __CFString *)WiFiNetworkGetProperty();
  if (v3)
  {
    v8 = 0;
    v7 = 0;
    CFGetHardwareAddress(v3, (char *)&v7, 6uLL, 0);
    v10 = 0;
    *(_QWORD *)__str = 0;
    snprintf(__str, 0xAuLL, "%02X:%02X:%02X", v7, BYTE1(v7), BYTE2(v7));
    CFDictionarySetCString(a1, CFSTR("oui"), __str, -1);
  }
  v4 = (const void *)WiFiNetworkGetProperty();
  if (v4)
    CFDictionarySetValue(a1, CFSTR("channel"), v4);
  if (WiFiNetworkIsEAP() && WiFiNetworkIsSAE())
  {
    v5 = "SAE-EAP";
  }
  else if (WiFiNetworkIsSAE())
  {
    v5 = "SAE";
  }
  else if (WiFiNetworkIsEAP() && WiFiNetworkIsWPA())
  {
    v5 = "WPA-EAP";
  }
  else if (WiFiNetworkIsWPA())
  {
    v5 = "WPA";
  }
  else if (WiFiNetworkIsEAP())
  {
    v5 = "EAP";
  }
  else if (WiFiNetworkIsWEP())
  {
    v5 = "WEP";
  }
  else if (WiFiNetworkIsOpen())
  {
    v5 = "Open";
  }
  else
  {
    v5 = "Unknown";
  }
  CFDictionarySetCString(a1, CFSTR("securityStr"), v5, -1);
  v6 = (const void *)WiFiNetworkGetProperty();
  if (v6)
    CFDictionarySetValue(a1, CFSTR("rssi"), v6);
}

void __logger_block_invoke_13939()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.CoreUtils", "WiFiUtils");
  v1 = (void *)sCUOSLogHandle_logger_13938;
  sCUOSLogHandle_logger_13938 = (uint64_t)v0;

}

uint64_t WiFiJoinNetwork_b(const void *a1, void *a2, const void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = a2;
  v6 = _Block_copy(a3);

  v7 = WiFiJoinNetwork(a1, v5, (uint64_t)_WiFiJoinNetwork_bCallBack, (uint64_t)v6);
  if ((_DWORD)v7)

  return v7;
}

void _WiFiJoinNetwork_bCallBack(uint64_t a1, void (**a2)(_QWORD, _QWORD))
{
  a2[2](a2, a1);

}

__CFDictionary *WiFiCopyCurrentNetworkInfo(int *a1)
{
  return WiFiCopyCurrentNetworkInfoEx(0, a1);
}

__CFDictionary *WiFiCopyCurrentNetworkInfoEx(char a1, int *a2)
{
  uint64_t v4;
  const void *v5;
  const __CFArray *v6;
  const __CFArray *v7;
  __CFDictionary *Mutable;
  const void *v9;
  const void *v10;
  int v11;

  v4 = WiFiManagerClientCreate();
  if (!v4)
  {
    Mutable = 0;
    v11 = -6700;
    if (!a2)
      return Mutable;
    goto LABEL_10;
  }
  v5 = (const void *)v4;
  v6 = (const __CFArray *)WiFiManagerClientCopyDevices();
  if (v6)
  {
    v7 = v6;
    if (CFArrayGetCount(v6) < 1)
    {
      Mutable = 0;
      v11 = -6727;
    }
    else
    {
      CFArrayGetValueAtIndex(v7, 0);
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      if (Mutable)
      {
        v9 = (const void *)WiFiDeviceClientCopyCurrentNetwork();
        if (v9)
        {
          v10 = v9;
          _WiFiDictionaryAddNetworkInfo(Mutable, a1, v9);
          CFRelease(v10);
        }
        v11 = 0;
      }
      else
      {
        v11 = -6728;
      }
    }
    CFRelease(v5);
  }
  else
  {
    Mutable = 0;
    v11 = -6727;
    v7 = (const __CFArray *)v5;
  }
  CFRelease(v7);
  if (a2)
LABEL_10:
    *a2 = v11;
  return Mutable;
}

void _WiFiDictionaryAddNetworkInfo(__CFDictionary *a1, char a2, const void *a3)
{
  const void *Channel;
  int DirectedState;
  const void **v8;
  int IsCaptive;
  int v10;
  const __CFString *Property;
  int IsEAP;
  int IsOpen;
  const void *SSID;
  const __CFString *SSIDData;
  unsigned int ShareMode;
  const void *v17;
  int ShareableStatus;
  const __CFString *v19;
  const __CFString *v20;
  const void *v21;
  const void *v22;
  const void *v23;
  const void *v24;
  char v25[65];
  UInt8 bytes[32];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  Channel = (const void *)WiFiNetworkGetChannel();
  if (Channel)
    CFDictionarySetValue(a1, CFSTR("channel"), Channel);
  DirectedState = WiFiNetworkGetDirectedState();
  v8 = (const void **)MEMORY[0x1E0C9AE50];
  if (DirectedState)
    CFDictionarySetValue(a1, CFSTR("directed"), (const void *)*MEMORY[0x1E0C9AE50]);
  IsCaptive = WiFiNetworkIsCaptive();
  if (IsCaptive)
    CFDictionarySetValue(a1, CFSTR("captive"), *v8);
  v10 = WiFiNetworkWasCaptive();
  if (v10)
    CFDictionarySetValue(a1, CFSTR("wasCaptive"), *v8);
  Property = (const __CFString *)WiFiNetworkGetProperty();
  if (Property && CFGetInt64(Property, 0) == 1)
    CFDictionarySetValue(a1, CFSTR("homeNetwork"), *v8);
  IsEAP = WiFiNetworkIsEAP();
  if (IsEAP)
    CFDictionarySetValue(a1, CFSTR("enterprise"), *v8);
  if (WiFiNetworkIsHidden())
    CFDictionarySetValue(a1, CFSTR("hidden"), *v8);
  if (WiFiNetworkIsProfileBased())
    CFDictionarySetValue(a1, CFSTR("profileBased"), *v8);
  IsOpen = WiFiNetworkIsOpen();
  if (IsOpen)
    CFDictionarySetValue(a1, CFSTR("open"), *v8);
  if (IsCaptive || v10 && IsOpen)
    CFDictionarySetValue(a1, CFSTR("likelyCaptive"), *v8);
  SSID = (const void *)WiFiNetworkGetSSID();
  if (SSID)
    CFDictionarySetValue(a1, CFSTR("ssid"), SSID);
  SSIDData = (const __CFString *)WiFiNetworkGetSSIDData();
  if (SSIDData)
    CFDictionarySetValue(a1, CFSTR("ssidData"), SSIDData);
  ShareMode = WiFiNetworkGetShareMode();
  CFDictionarySetInt64(a1, CFSTR("shareMode"), ShareMode);
  if ((const void *)WiFiNetworkGetProperty() == *v8)
    v17 = *v8;
  else
    v17 = (const void *)*MEMORY[0x1E0C9AE40];
  CFDictionarySetValue(a1, CFSTR("standalone6G"), v17);
  if (MobileWiFiLibrary_sOnce != -1)
    dispatch_once(&MobileWiFiLibrary_sOnce, &__block_literal_global_120);
  if (MobileWiFiLibrary_sLib && dlsym((void *)MobileWiFiLibrary_sLib, "WiFiNetworkGetShareableStatus"))
  {
    ShareableStatus = softLinkWiFiNetworkGetShareableStatus((uint64_t)a3);
    CFDictionarySetInt64(a1, CFSTR("shareableStatus"), ShareableStatus);
  }
  if ((a2 & 3) != 0)
  {
    v19 = (const __CFString *)WiFiNetworkCopyPassword();
    if (v19)
    {
      v20 = v19;
      CFDictionarySetValue(a1, CFSTR("password"), v19);
      if ((a2 & 2) != 0 && !WPAHashPSK(SSIDData, v20, bytes, v25))
      {
        CFDictionarySetData(a1, CFSTR("psk"), bytes, 32);
        CFDictionarySetCString(a1, CFSTR("pskStr"), v25, -1);
      }
      CFRelease(v20);
    }
  }
  if ((a2 & 4) != 0)
  {
    v21 = (const void *)WiFiNetworkCopyRecord();
    if (v21)
    {
      v22 = v21;
      CFDictionarySetValue(a1, CFSTR("rawRecord"), v21);
      CFRelease(v22);
    }
  }
  CFDictionarySetValue(a1, CFSTR("platformNetwork"), a3);
  if (IsEAP)
  {
    if (getkWiFiNetworkShareableEAPConfig())
    {
      getkWiFiNetworkShareableEAPConfig();
      v23 = (const void *)WiFiNetworkGetProperty();
      if (v23)
        CFDictionarySetValue(a1, CFSTR("eapConfig"), v23);
    }
    if (getkWiFiNetworkShareableEAPTrustExceptions())
    {
      getkWiFiNetworkShareableEAPTrustExceptions();
      v24 = (const void *)WiFiNetworkGetProperty();
      if (v24)
        CFDictionarySetValue(a1, CFSTR("eapTrustExceptions"), v24);
    }
  }
  _WiFiDictionaryAddNetworkAdditionalInfo(a1);
}

uint64_t WPAHashPSK(const __CFString *a1, CFStringRef theString, _OWORD *a3, _BYTE *a4)
{
  size_t v7;
  CFTypeID v8;
  const UInt8 *BytePtr;
  CFIndex Length;
  size_t v11;
  char *v12;
  uint64_t result;
  __int128 v14;
  uint64_t i;
  unint64_t v16;
  CFIndex usedBufLen;
  size_t v18;
  UInt8 v19[64];
  _OWORD v20[2];
  char buffer[128];
  uint64_t v22;
  CFRange v23;

  v22 = *MEMORY[0x1E0C80C00];
  buffer[0] = 0;
  if (!CFStringGetCString(theString, buffer, 128, 0x8000100u))
    return 4294960579;
  v7 = strlen(buffer);
  v18 = v7;
  if (v7 - 8 > 0x37)
  {
    result = HexToData(buffer, v7, 30, (uint64_t)v20, 0x20uLL, 0, &v18, 0);
    if ((_DWORD)result)
      return result;
    if (v18 != 32)
      return 4294960553;
    if (!a3)
      goto LABEL_9;
    goto LABEL_8;
  }
  v8 = CFGetTypeID(a1);
  if (v8 == CFDataGetTypeID())
  {
    BytePtr = CFDataGetBytePtr((CFDataRef)a1);
    Length = CFDataGetLength((CFDataRef)a1);
    v11 = v7;
    v12 = (char *)BytePtr;
  }
  else
  {
    if (v8 != CFStringGetTypeID())
      return 4294960540;
    v23.length = CFStringGetLength(a1);
    usedBufLen = 0;
    v23.location = 0;
    CFStringGetBytes(a1, v23, 0x8000100u, 0, 0, v19, 64, &usedBufLen);
    Length = usedBufLen;
    v12 = (char *)v19;
    v11 = v7;
  }
  PBKDF2_HMAC_SHA1(buffer, v11, v12, Length, (uint64_t)v20);
  if (a3)
  {
LABEL_8:
    v14 = v20[1];
    *a3 = v20[0];
    a3[1] = v14;
  }
LABEL_9:
  if (!a4)
    return 0;
  for (i = 0; i != 32; ++i)
  {
    v16 = *((unsigned __int8 *)v20 + i);
    *a4 = a0123456789abcd_0[v16 >> 4];
    a4[1] = a0123456789abcd_0[v16 & 0xF];
    a4 += 2;
  }
  result = 0;
  *a4 = 0;
  return result;
}

uint64_t initWiFiNetworkGetShareableStatus(uint64_t a1)
{
  if (MobileWiFiLibrary_sOnce != -1)
    dispatch_once(&MobileWiFiLibrary_sOnce, &__block_literal_global_120);
  softLinkWiFiNetworkGetShareableStatus = (uint64_t (*)())dlsym((void *)MobileWiFiLibrary_sLib, "WiFiNetworkGetShareableStatus");
  return ((uint64_t (*)(uint64_t))softLinkWiFiNetworkGetShareableStatus)(a1);
}

__CFDictionary *WiFiCopyNetworkInfo(const __CFDictionary *a1, char a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  const __CFArray *v12;
  const __CFArray *v13;
  CFIndex Count;
  CFIndex v15;
  CFIndex v16;
  const void *ValueAtIndex;
  CFTypeID TypeID;
  const __CFDictionary *TypedValue;
  const __CFDictionary *v20;
  const void *SSID;
  __CFDictionary *v22;
  int v23;
  __CFDictionary *Mutable;
  uint64_t v26;

  v6 = WiFiManagerClientCreate();
  if (v6)
  {
    v11 = (const void *)v6;
    v12 = (const __CFArray *)WiFiManagerClientCopyNetworks();
    if (v12)
    {
      v13 = v12;
      Count = CFArrayGetCount(v12);
      if (Count < 1)
        goto LABEL_9;
      v15 = Count;
      v16 = 0;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v13, v16);
        TypeID = CFStringGetTypeID();
        TypedValue = CFDictionaryGetTypedValue(a1, CFSTR("ssid"), TypeID, 0);
        if (!TypedValue)
          break;
        v20 = TypedValue;
        SSID = (const void *)WiFiNetworkGetSSID();
        if (SSID)
        {
          if (CFEqual(SSID, v20))
            break;
        }
        if (v15 == ++v16)
          goto LABEL_9;
      }
      if (ValueAtIndex)
      {
        Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        v22 = Mutable;
        if (Mutable)
        {
          _WiFiDictionaryAddNetworkInfo(Mutable, a2, ValueAtIndex);
          v23 = 0;
        }
        else
        {
          v23 = -6728;
        }
      }
      else
      {
LABEL_9:
        v22 = 0;
        v23 = -6727;
      }
      CFRelease(v13);
    }
    else
    {
      v22 = 0;
      v23 = -6727;
    }
    CFRelease(v11);
    if (a3)
      goto LABEL_16;
  }
  else
  {
    if (gLogCategory_WiFiManagerCore <= 60
      && (gLogCategory_WiFiManagerCore != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_WiFiManagerCore, 0x3Cu)))
    {
      LogPrintF((uint64_t)&gLogCategory_WiFiManagerCore, (uint64_t)"CFDictionaryRef WiFiCopyNetworkInfo(CFDictionaryRef, WiFiNetworkInfoFlags, OSStatus *)", 0x3Cu, (uint64_t)"### WiFiManagerClientCreate failed\n", v7, v8, v9, v10, v26);
    }
    v22 = 0;
    v23 = -6700;
    if (a3)
LABEL_16:
      *a3 = v23;
  }
  return v22;
}

uint64_t WiFiRestoreNetwork(const __CFDictionary *a1, void *a2, void *a3)
{
  NSObject *v5;
  id v6;
  uint64_t Value;
  uint64_t v8;
  const void *v9;
  const __CFArray *v10;
  const __CFArray *v11;
  const void *ValueAtIndex;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD block[4];
  id v19;

  v5 = a2;
  v6 = a3;
  Value = (uint64_t)CFDictionaryGetValue(a1, CFSTR("platformNetwork"));
  if (Value)
  {
    v8 = WiFiManagerClientCreate();
    if (!v8)
    {
      v16 = 0;
      v13 = 0;
      Value = 4294960596;
      goto LABEL_13;
    }
    v9 = (const void *)v8;
    CFRunLoopGetMain();
    WiFiManagerClientScheduleWithRunLoop();
    v10 = (const __CFArray *)WiFiManagerClientCopyDevices();
    v11 = v10;
    if (v10 && CFArrayGetCount(v10) >= 1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v11, 0);
      v13 = (void *)objc_msgSend(v6, "copy");
      if (v6)
      {
        v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v15 = _Block_copy(v13);
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("block"));

        objc_msgSend(v14, "setObject:forKeyedSubscript:", ValueAtIndex, CFSTR("platformDevice"));
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v9, CFSTR("platformManager"));
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v5, CFSTR("queue"));
        v16 = v14;
        Value = WiFiDeviceClientAssociateAsync();
        if (!(_DWORD)Value)
        {
          CFRelease(v9);

          v16 = 0;
LABEL_12:
          CFRelease(v11);
          goto LABEL_13;
        }
        CFRelease(v16);
      }
      else
      {
        v16 = 0;
        Value = 4294960568;
      }
    }
    else
    {
      v16 = 0;
      v13 = 0;
      Value = 4294960569;
    }
    CFRunLoopGetMain();
    WiFiManagerClientUnscheduleFromRunLoop();
    CFRelease(v9);
    if (!v11)
      goto LABEL_13;
    goto LABEL_12;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __WiFiRestoreNetwork_block_invoke;
  block[3] = &unk_1E25DF300;
  v19 = v6;
  dispatch_async(v5, block);

  v16 = 0;
  v13 = 0;
LABEL_13:

  return Value;
}

void _WiFiRestoreNetworkCB(uint64_t a1, uint64_t a2, uint64_t a3, int a4, void *a5)
{
  const void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  int v13;

  objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("platformManager"));
  v7 = (const void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("block"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("queue"));
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = ___WiFiRestoreNetworkCB_block_invoke;
  v11[3] = &unk_1E25DF3B0;
  v12 = v8;
  v13 = a4;
  v10 = v8;
  dispatch_async(v9, v11);
  CFRunLoopGetMain();
  WiFiManagerClientUnscheduleFromRunLoop();
  CFRelease(v7);

}

uint64_t WiFiScan(const __CFDictionary *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  CFMutableDictionaryRef Mutable;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __objc2_class **p_superclass;
  __CFDictionary *v14;
  uint64_t v15;
  uint64_t v16;
  const void *v17;
  const __CFArray *v18;
  const __CFArray *v19;
  __CFDictionary *v20;
  const void *v21;
  const void *Value;
  CFTypeID TypeID;
  const __CFDictionary *TypedValue;
  const __CFDictionary *v25;
  int Int64Ranged;
  unint64_t Int64;
  BOOL v28;
  const __CFDictionary *v29;
  int v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  int v34;
  CFMutableArrayRef v35;
  CFNumberRef v36;
  CFNumberRef v37;
  CFIndex Count;
  CFIndex v39;
  CFIndex v40;
  const __CFString *v41;
  const __CFString *v42;
  CFTypeID v43;
  const __CFDictionary *TypedValueAtIndex;
  const __CFDictionary *v45;
  int v46;
  int v47;
  unsigned int v48;
  unsigned int v49;
  int v50;
  int v51;
  const __CFString *v52;
  uint64_t v53;
  const __CFString *v54;
  __CFDictionary *v55;
  __CFDictionary *v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  int v63;
  uint64_t v64;
  int v65;
  _BOOL4 v66;
  __CFArray *v68;
  unsigned int v69;
  uint64_t v70;
  int v71;
  const void *v72;
  __CFDictionary *v73;
  id v74;
  __CFDictionary *theDict;
  __CFArray *theArray;
  const __CFDictionary *v77;
  const void *ValueAtIndex;
  unsigned int v79;
  UInt8 v80[8];
  UInt8 bytes[15];
  char valuePtr;

  v7 = a2;
  *(_QWORD *)v80 = a4;
  *(_QWORD *)bytes = a3;
  v79 = 0;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  p_superclass = (__objc2_class **)(CUNetInterfaceMonitor + 8);
  if (Mutable)
  {
    v14 = Mutable;
    v15 = mach_absolute_time();
    CFDictionarySetInt64(v14, CFSTR("startTime"), v15);
    v16 = WiFiManagerClientCreate();
    if (!v16)
    {
      v79 = -6700;
      goto LABEL_59;
    }
    v17 = (const void *)v16;
    CFRunLoopGetMain();
    WiFiManagerClientScheduleWithRunLoop();
    CFDictionarySetValue(v14, CFSTR("platformManager"), v17);
    v18 = (const __CFArray *)WiFiManagerClientCopyDevices();
    v19 = v18;
    if (v18 && CFArrayGetCount(v18) > 0)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v19, 0);
      CFDictionarySetValue(v14, CFSTR("platformDevice"), ValueAtIndex);
      CFRelease(v19);
      CFDictionarySetData(v14, CFSTR("callback"), bytes, 8);
      CFDictionarySetData(v14, CFSTR("context"), v80, 8);
      CFDictionarySetValue(v14, CFSTR("queue"), v7);
      v20 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v19 = v20;
      if (!v20)
      {
        v68 = 0;
        theDict = 0;
LABEL_82:
        v69 = -6728;
        goto LABEL_83;
      }
      v21 = (const void *)*MEMORY[0x1E0C9AE50];
      CFDictionarySetValue(v20, CFSTR("SCAN_MERGE"), (const void *)*MEMORY[0x1E0C9AE50]);
      Value = CFDictionaryGetValue(a1, CFSTR("scanDwellTime"));
      if (Value)
        CFDictionarySetValue(v19, CFSTR("SCAN_DWELL_TIME"), Value);
      TypeID = CFStringGetTypeID();
      TypedValue = CFDictionaryGetTypedValue(a1, CFSTR("ssid"), TypeID, 0);
      if (TypedValue)
      {
        v25 = TypedValue;
        CFDictionarySetValue(v19, CFSTR("HIDDEN_NETWORK"), v21);
        CFDictionarySetValue(v19, CFSTR("SCAN_DIRECTED"), v21);
        CFDictionarySetValue(v19, CFSTR("SSID_STR"), v25);
      }
      Int64Ranged = CFDictionaryGetInt64Ranged(a1, CFSTR("channel"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
      Int64 = CFDictionaryGetInt64(a1, CFSTR("channel_2pt4GHz"), (int *)&v79);
      if (v79)
        v28 = 0;
      else
        v28 = Int64 == 0;
      v29 = a1;
      v30 = !v28;
      v77 = v29;
      v31 = CFDictionaryGetInt64(v29, CFSTR("channel_5GHz"), (int *)&v79);
      if (v79)
        v32 = 0;
      else
        v32 = v31 == 0;
      v33 = !v32;
      if ((v30 & 1) != 0 || (v33 & 1) != 0)
      {
        if (Int64Ranged < 1)
          v34 = v30;
        else
          v34 = 0;
        if ((v34 & v33 & 1) != 0)
          goto LABEL_48;
        v35 = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
        theDict = v19;
        if (v35)
        {
          theArray = v35;
          valuePtr = 27;
          v36 = CFNumberCreate(0, kCFNumberSInt8Type, &valuePtr);
          if (v36)
          {
            v37 = v36;
            v19 = (const __CFArray *)WiFiDeviceClientCopyProperty();
            CFRelease(v37);
            if (v19)
            {
              v72 = v17;
              v73 = v14;
              v74 = v7;
              Count = CFArrayGetCount(v19);
              if (Count >= 1)
              {
                v39 = Count;
                v40 = 0;
                v41 = CFSTR("SUP_CHANNEL");
                v42 = CFSTR("SUP_CHANNEL_FLAGS");
                v71 = v30;
                while (1)
                {
                  v43 = CFDictionaryGetTypeID();
                  TypedValueAtIndex = CFArrayGetTypedValueAtIndex(v19, v40, v43, (int *)&v79);
                  if (v79)
                    break;
                  v45 = TypedValueAtIndex;
                  v46 = CFDictionaryGetInt64Ranged(TypedValueAtIndex, v41, 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
                  v47 = v46;
                  if (Int64Ranged < 1 || v46 == Int64Ranged)
                  {
                    v48 = CFDictionaryGetInt64(v45, v42, 0);
                    v49 = v48;
                    v50 = (v48 & 8) != 0 ? v30 : 1;
                    if (v50 == 1)
                    {
                      v51 = (v48 & 0x10) != 0 ? v33 : 1;
                      if (v51 == 1)
                      {
                        v52 = v41;
                        v53 = v33;
                        v54 = v42;
                        v55 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
                        if (!v55)
                        {
                          v79 = -6728;
                          break;
                        }
                        v56 = v55;
                        CFDictionarySetInt64(v55, CFSTR("CHANNEL"), v47);
                        CFDictionarySetInt64(v56, CFSTR("CHANNEL_FLAGS"), v49);
                        CFArrayAppendValue(theArray, v56);
                        CFRelease(v56);
                        v42 = v54;
                        v33 = v53;
                        v41 = v52;
                        v30 = v71;
                      }
                    }
                  }
                  if (v39 == ++v40)
                    goto LABEL_47;
                }
                v14 = v73;
                v7 = v74;
                p_superclass = (__objc2_class **)(CUNetInterfaceMonitor + 8);
                v17 = v72;
                goto LABEL_73;
              }
LABEL_47:
              CFRelease(v19);
              v19 = theDict;
              CFDictionarySetValue(theDict, CFSTR("SCAN_CHANNELS"), theArray);
              CFRelease(theArray);
              v14 = v73;
              v7 = v74;
              p_superclass = CUNetInterfaceMonitor.superclass;
              v17 = v72;
LABEL_48:
              v57 = CFDictionaryGetInt64Ranged(v77, CFSTR("scanRSSIThreshold"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, (int *)&v79);
              if (v79)
                v62 = -80;
              else
                v62 = v57;
              if (v62 < 0)
                CFDictionarySetInt64(v19, CFSTR("SCAN_RSSI_THRESHOLD"), v62);
              v63 = *((_DWORD *)p_superclass + 78);
              if (v63 <= 30 && (v63 != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_WiFiManagerCore, 0x1Eu)))
                LogPrintF((uint64_t)&gLogCategory_WiFiManagerCore, (uint64_t)"OSStatus WiFiScan(CFDictionaryRef, __strong dispatch_queue_t, WiFiScanCompletion_f, void *)", 0x1Eu, (uint64_t)"WiFi scan starting\n", v58, v59, v60, v61, v70);
              v79 = WiFiDeviceClientScanAsync();
              if (!v79)
              {
                CFRelease(v17);
                v14 = v19;
                goto LABEL_59;
              }
              theDict = v19;
              v68 = 0;
              v19 = 0;
              goto LABEL_74;
            }
          }
          else
          {
            v19 = 0;
          }
          v79 = -6700;
LABEL_73:
          v68 = theArray;
LABEL_74:
          CFRunLoopGetMain();
          WiFiManagerClientUnscheduleFromRunLoop();
          if (v68)
            CFRelease(v68);
          if (v19)
            CFRelease(v19);
          if (theDict)
            CFRelease(theDict);
          CFRelease(v17);
LABEL_59:
          CFRelease(v14);
          v64 = v79;
          if (!v79)
            goto LABEL_64;
          goto LABEL_60;
        }
        v68 = 0;
        v19 = 0;
        goto LABEL_82;
      }
      theDict = v19;
      v68 = 0;
      v19 = 0;
      v69 = -6705;
    }
    else
    {
      v68 = 0;
      theDict = 0;
      v69 = -6727;
    }
LABEL_83:
    v79 = v69;
    goto LABEL_74;
  }
  v64 = 4294960568;
  v79 = -6728;
LABEL_60:
  v65 = *((_DWORD *)p_superclass + 78);
  if (v65 <= 60)
  {
    if (v65 != -1 || (v66 = _LogCategory_Initialize((uint64_t)&gLogCategory_WiFiManagerCore, 0x3Cu), v64 = v79, v66))
    {
      LogPrintF((uint64_t)&gLogCategory_WiFiManagerCore, (uint64_t)"OSStatus WiFiScan(CFDictionaryRef, __strong dispatch_queue_t, WiFiScanCompletion_f, void *)", 0x3Cu, (uint64_t)"### WiFi scan failed: %#m\n", v9, v10, v11, v12, v64);
      v64 = v79;
    }
  }
LABEL_64:

  return v64;
}

void _WiFiScanCallback(int a1, const __CFArray *a2, int a3, CFDictionaryRef theDict)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CFIndex Count;
  NSObject *v12;
  _QWORD block[7];
  int v14;
  uint64_t v15;
  uint64_t v16;

  CFDictionaryGetValue(theDict, CFSTR("platformManager"));
  mach_absolute_time();
  CFDictionaryGetInt64(theDict, CFSTR("startTime"), 0);
  if (sUpTicksToSecondsOnce != -1)
    dispatch_once_f(&sUpTicksToSecondsOnce, &sUpTicksToSecondsMultiplier, (dispatch_function_t)_UpTicksToSecondsInit);
  if (gLogCategory_WiFiManagerCore <= 30
    && (gLogCategory_WiFiManagerCore != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_WiFiManagerCore, 0x1Eu)))
  {
    if (a2)
      Count = CFArrayGetCount(a2);
    else
      Count = 0;
    LogPrintF((uint64_t)&gLogCategory_WiFiManagerCore, (uint64_t)"void _WiFiScanCallback(WiFiDeviceClientRef, CFArrayRef, WiFiError, void *)", 0x1Eu, (uint64_t)"WiFi scan completed: %ld results, %.3f seconds, %#m\n", v7, v8, v9, v10, Count);
  }
  v15 = 0;
  v16 = 0;
  CFDictionaryGetData(theDict, CFSTR("callback"), (const char *)&v16, 8uLL, 0, 0);
  CFDictionaryGetData(theDict, CFSTR("context"), (const char *)&v15, 8uLL, 0, 0);
  CFDictionaryGetValue(theDict, CFSTR("queue"));
  v12 = objc_claimAutoreleasedReturnValue();
  if (a2)
    CFRetain(a2);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___WiFiScanCallback_block_invoke;
  block[3] = &__block_descriptor_60_e5_v8__0l;
  v14 = a3;
  block[4] = a2;
  block[5] = v16;
  block[6] = v15;
  dispatch_async(v12, block);
  CFRunLoopGetMain();
  WiFiManagerClientUnscheduleFromRunLoop();
  CFRelease(theDict);

}

uint64_t WiFiScan_b(const __CFDictionary *a1, void *a2, const void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = a2;
  v6 = _Block_copy(a3);

  v7 = WiFiScan(a1, v5, (uint64_t)_WiFiScan_bCallBack, (uint64_t)v6);
  if ((_DWORD)v7)

  return v7;
}

void _WiFiScan_bCallBack(uint64_t a1, uint64_t a2, void (**a3)(_QWORD, _QWORD, _QWORD))
{
  a3[2](a3, a1, a2);

}

uint64_t WiFiSWAPStart(__CFDictionary **a1, const __CFDictionary *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v9;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v11;
  const void *v12;
  const void *v13;
  const __CFArray *v14;
  const __CFArray *v15;
  const void *ValueAtIndex;
  __CFDictionary *v17;
  __CFDictionary *v18;
  int64_t Int64;
  uint64_t v20;
  CFTypeID TypeID;
  const __CFString *TypedValue;
  uint64_t started;
  CFTypeID v25;
  const __CFDictionary *v26;
  uint64_t v27;
  UInt8 bytes[8];
  CFIndex length;
  void *v30;
  UInt8 *v31;
  unsigned int v32;

  v9 = a3;
  v27 = a5;
  *(_QWORD *)bytes = a4;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!Mutable)
  {
    started = 4294960568;
    goto LABEL_21;
  }
  v11 = Mutable;
  v12 = (const void *)WiFiManagerClientCreate();
  if (!v12)
  {
    started = 4294960596;
    goto LABEL_20;
  }
  v13 = v12;
  CFDictionarySetValue(v11, CFSTR("platformManager"), v12);
  CFRunLoopGetMain();
  WiFiManagerClientScheduleWithRunLoop();
  v14 = (const __CFArray *)WiFiManagerClientCopyDevices();
  if (!v14)
  {
    CFRelease(v13);
    started = 4294960569;
    goto LABEL_20;
  }
  v15 = v14;
  if (CFArrayGetCount(v14) < 1)
  {
    started = 4294960569;
  }
  else
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v15, 0);
    CFDictionarySetValue(v11, CFSTR("platformDevice"), ValueAtIndex);
    if (a4)
      CFDictionarySetData(v11, CFSTR("startedCallback"), bytes, 8);
    if (a5)
      CFDictionarySetData(v11, CFSTR("startedContext"), (UInt8 *)&v27, 8);
    if (v9)
      CFDictionarySetValue(v11, CFSTR("startedQueue"), v9);
    v32 = 0;
    v17 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (v17)
    {
      v18 = v17;
      v30 = 0;
      v31 = 0;
      length = 0;
      CFDictionarySetInt64(v17, CFSTR("AP_MODE_AUTH_LOWER"), 1);
      CFDictionarySetInt64(v18, CFSTR("AP_MODE_AUTH_UPPER"), 0);
      CFDictionarySetInt64(v18, CFSTR("AP_MODE_CYPHER_TYPE"), 0);
      Int64 = CFDictionaryGetInt64(a2, CFSTR("channel_2pt4GHz"), (int *)&v32);
      if (v32 && (Int64 = CFDictionaryGetInt64(a2, CFSTR("channel_5GHz"), (int *)&v32), v32))
      {
        v20 = 6;
      }
      else
      {
        v20 = Int64;
        if (Int64 <= 0)
        {
          v32 = -6705;
LABEL_18:
          CFRelease(v18);
          started = v32;
          goto LABEL_19;
        }
      }
      CFDictionarySetInt64(v18, CFSTR("CHANNEL"), v20);
      TypeID = CFStringGetTypeID();
      TypedValue = (const __CFString *)CFDictionaryGetTypedValue(a2, CFSTR("ssid"), TypeID, (int *)&v32);
      if (v32)
        goto LABEL_18;
      v32 = CFStringGetOrCopyCStringUTF8(TypedValue, (const char **)&v31, (UInt8 **)&v30, (size_t *)&length);
      if (v32)
        goto LABEL_18;
      CFDictionarySetData(v18, CFSTR("AP_MODE_SSID_BYTES"), v31, length);
      if (v30)
        free(v30);
      v25 = CFDataGetTypeID();
      v26 = CFDictionaryGetTypedValue(a2, CFSTR("ie"), v25, 0);
      if (v26)
        CFDictionarySetValue(v18, CFSTR("AP_MODE_IE_LIST"), v26);
      CFRetain(v11);
      started = WiFiDeviceClientStartNetwork();
      CFRelease(v18);
      if ((_DWORD)started)
      {
        CFRelease(v11);
      }
      else
      {
        *a1 = v11;
        v11 = 0;
      }
    }
    else
    {
      started = 4294960568;
    }
  }
LABEL_19:
  CFRelease(v13);
  CFRelease(v15);
  if (v11)
LABEL_20:
    CFRelease(v11);
LABEL_21:

  return started;
}

void _WiFiSWAPStartCallBack(int a1, int a2, void *value, int a4, CFMutableDictionaryRef theDict)
{
  NSObject *v8;
  int v9;
  int v10;
  _QWORD v11[7];
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = 0;
  v13 = 0;
  if (value)
    CFDictionarySetValue(theDict, CFSTR("platformNetwork"), value);
  CFDictionarySetInt64(theDict, CFSTR("startedStatus"), a2);
  CFDictionaryGetValue(theDict, CFSTR("startedQueue"));
  v8 = objc_claimAutoreleasedReturnValue();
  CFDictionaryGetData(theDict, CFSTR("startedCallback"), (const char *)&v14, 8uLL, 0, 0);
  CFDictionaryGetData(theDict, CFSTR("startedContext"), (const char *)&v13, 8uLL, 0, 0);
  if (v8 && v14)
  {
    CFRetain(theDict);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = ___WiFiSWAPStartCallBack_block_invoke;
    v11[3] = &__block_descriptor_60_e5_v8__0l;
    v11[4] = v14;
    v11[5] = theDict;
    v12 = a2;
    v11[6] = v13;
    dispatch_async(v8, v11);
  }
  if (CFDictionaryGetInt64(theDict, CFSTR("stopPending"), 0))
  {
    v9 = CFRetain(theDict);
    if (value)
    {
      if (WiFiDeviceClientStopNetwork())
        CFRelease(theDict);
    }
    else
    {
      _WiFiSWAPStopCallBack(v9, 0, v10, theDict);
    }
  }
  CFRelease(theDict);

}

void _WiFiSWAPStopCallBack(int a1, int a2, int a3, CFDictionaryRef theDict)
{
  NSObject *v6;
  _QWORD v7[7];
  int v8;
  uint64_t v9;
  uint64_t v10;

  v9 = 0;
  v10 = 0;
  CFDictionaryGetValue(theDict, CFSTR("stoppedQueue"));
  v6 = objc_claimAutoreleasedReturnValue();
  CFDictionaryGetData(theDict, CFSTR("stoppedCallback"), (const char *)&v10, 8uLL, 0, 0);
  CFDictionaryGetData(theDict, CFSTR("stoppedContext"), (const char *)&v9, 8uLL, 0, 0);
  if (v6 && v10)
  {
    CFRetain(theDict);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = ___WiFiSWAPStopCallBack_block_invoke;
    v7[3] = &__block_descriptor_60_e5_v8__0l;
    v7[4] = v10;
    v7[5] = theDict;
    v8 = a2;
    v7[6] = v9;
    dispatch_async(v6, v7);
  }
  if (CFDictionaryGetValue(theDict, CFSTR("platformManager")))
  {
    CFRunLoopGetMain();
    WiFiManagerClientUnscheduleFromRunLoop();
  }
  CFRelease(theDict);

}

uint64_t WiFiSWAPStop(__CFDictionary *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v12;
  UInt8 bytes[8];

  v7 = a2;
  v12 = a4;
  *(_QWORD *)bytes = a3;
  if (CFDictionaryGetValue(a1, CFSTR("platformDevice")))
  {
    if (a3)
      CFDictionarySetData(a1, CFSTR("stoppedCallback"), bytes, 8);
    if (a4)
      CFDictionarySetData(a1, CFSTR("stoppedContext"), (UInt8 *)&v12, 8);
    if (v7)
      CFDictionarySetValue(a1, CFSTR("stoppedQueue"), v7);
    if (CFDictionaryGetValue(a1, CFSTR("platformNetwork")))
    {
      CFRetain(a1);
      v8 = WiFiDeviceClientStopNetwork();
      if ((_DWORD)v8)
        CFRelease(a1);
    }
    else
    {
      if (CFDictionaryGetInt64(a1, CFSTR("startedStatus"), 0))
      {
        v9 = CFRetain(a1);
        _WiFiSWAPStopCallBack(v9, 0, v10, a1);
      }
      else
      {
        CFDictionarySetValue(a1, CFSTR("stopPending"), (const void *)*MEMORY[0x1E0C9AE50]);
      }
      v8 = 0;
    }
  }
  else
  {
    v8 = 4294960576;
  }
  CFRelease(a1);

  return v8;
}

BOOL xpc_connection_has_entitlement()
{
  uint64_t v0;
  void *v1;
  _BOOL8 v2;

  v0 = xpc_connection_copy_entitlement_value();
  if (!v0)
    return 0;
  v1 = (void *)v0;
  v2 = MEMORY[0x18D78F504]() == MEMORY[0x1E0C812D0] && xpc_BOOL_get_value(v1);
  xpc_release(v1);
  return v2;
}

void xpc_connection_set_event_handler_f(_xpc_connection_s *a1, uint64_t a2, uint64_t a3)
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 0x40000000;
  v3[2] = __xpc_connection_set_event_handler_f_block_invoke;
  v3[3] = &__block_descriptor_tmp_14046;
  v3[4] = a2;
  v3[5] = a3;
  xpc_connection_set_event_handler(a1, v3);
}

uint64_t __xpc_connection_set_event_handler_f_block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 32))(a2, *(_QWORD *)(a1 + 40));
}

void xpc_connection_send_message_with_reply_f(_xpc_connection_s *a1, void *a2, NSObject *a3, uint64_t a4, uint64_t a5)
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = __xpc_connection_send_message_with_reply_f_block_invoke;
  v5[3] = &__block_descriptor_tmp_1;
  v5[4] = a4;
  v5[5] = a5;
  xpc_connection_send_message_with_reply(a1, a2, a3, v5);
}

uint64_t __xpc_connection_send_message_with_reply_f_block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 32))(a2, *(_QWORD *)(a1 + 40));
}

uint64_t xpc_dictionary_copy_cf_object(void *a1, const char *a2, int *a3)
{
  uint64_t result;
  int v5;

  result = (uint64_t)xpc_dictionary_get_value(a1, a2);
  if (!result)
  {
    v5 = -6727;
    if (!a3)
      return result;
    goto LABEL_6;
  }
  result = _CFXPCCreateCFObjectFromXPCObject();
  if (result)
    v5 = 0;
  else
    v5 = -6756;
  if (a3)
LABEL_6:
    *a3 = v5;
  return result;
}

uint64_t xpc_dictionary_set_cf_object(void *a1, const char *a2)
{
  void *v4;
  void *v5;

  v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (!v4)
    return 4294960540;
  v5 = v4;
  xpc_dictionary_set_value(a1, a2, v4);
  xpc_release(v5);
  return 0;
}

uint64_t xpc_send_message_sync(const char *a1, uint64_t a2, int a3, void *a4, _QWORD *a5)
{
  NSObject *v10;
  _xpc_connection_s *mach_service;
  _xpc_connection_s *v12;
  dispatch_semaphore_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  void *v21;
  _QWORD barrier[5];
  _QWORD handler[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;

  v28 = 0;
  v29 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2000000000;
  asprintf(&v29, "xpc_send_message_sync:%s", a1);
  if (v29 && (v10 = dispatch_queue_create(v29, 0), free(v29), v10))
  {
    mach_service = xpc_connection_create_mach_service(a1, v10, a2);
    if (!mach_service)
    {
      v19 = 4294960596;
      v14 = v10;
LABEL_12:
      dispatch_release(v14);
      goto LABEL_13;
    }
    v12 = mach_service;
    xpc_connection_set_event_handler(mach_service, &__block_literal_global_14049);
    if (a3)
      xpc_connection_set_target_uid();
    xpc_connection_resume(v12);
    v13 = dispatch_semaphore_create(0);
    v14 = v13;
    if (v13)
    {
      if (a5)
      {
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 0x40000000;
        handler[2] = __xpc_send_message_sync_block_invoke_2;
        handler[3] = &unk_1E25DF478;
        handler[4] = &v25;
        handler[5] = v13;
        xpc_connection_send_message_with_reply(v12, a4, v10, handler);
        dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
        if (MEMORY[0x18D78F504](v26[3]) == MEMORY[0x1E0C81310])
        {
          if (gLogCategory_XPCUtils <= 50
            && (gLogCategory_XPCUtils != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_XPCUtils, 0x32u)))
          {
            LogPrintF((uint64_t)&gLogCategory_XPCUtils, (uint64_t)"OSStatus xpc_send_message_sync(const char *, uint64_t, uid_t, xpc_object_t, xpc_object_t *)", 0x32u, (uint64_t)"### XPC service '%s' error: %{xpc}\n", v15, v16, v17, v18, (uint64_t)a1);
          }
          v19 = 4294960543;
        }
        else
        {
          v19 = 0;
          v20 = v26;
          *a5 = v26[3];
          v20[3] = 0;
        }
      }
      else
      {
        xpc_connection_send_message(v12, a4);
        barrier[0] = MEMORY[0x1E0C809B0];
        barrier[1] = 0x40000000;
        barrier[2] = __xpc_send_message_sync_block_invoke_3;
        barrier[3] = &__block_descriptor_tmp_7_14051;
        barrier[4] = v14;
        xpc_connection_send_barrier(v12, barrier);
        dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
        v19 = 0;
      }
    }
    else
    {
      v19 = 4294960568;
    }
    xpc_connection_cancel(v12);
    xpc_release(v12);
    dispatch_release(v10);
    if (v14)
      goto LABEL_12;
  }
  else
  {
    v19 = 4294960568;
  }
LABEL_13:
  v21 = (void *)v26[3];
  if (v21)
    xpc_release(v21);
  _Block_object_dispose(&v25, 8);
  return v19;
}

intptr_t __xpc_send_message_sync_block_invoke_2(uint64_t a1, xpc_object_t object)
{
  xpc_retain(object);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = object;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t __xpc_send_message_sync_block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t Apple80211BindToInterface()
{
  return MEMORY[0x1E0D39CE0]();
}

uint64_t Apple80211Close()
{
  return MEMORY[0x1E0D39CF8]();
}

uint64_t Apple80211Open()
{
  return MEMORY[0x1E0D39D58]();
}

uint64_t Apple80211RawGet()
{
  return MEMORY[0x1E0D39D78]();
}

uint64_t Apple80211RawSet()
{
  return MEMORY[0x1E0D39D80]();
}

uint64_t CCBigNumAdd()
{
  return MEMORY[0x1E0C80010]();
}

uint64_t CCBigNumAddI()
{
  return MEMORY[0x1E0C80018]();
}

uint64_t CCBigNumBitCount()
{
  return MEMORY[0x1E0C80020]();
}

uint64_t CCBigNumCompare()
{
  return MEMORY[0x1E0C80028]();
}

uint64_t CCBigNumCompareI()
{
  return MEMORY[0x1E0C80030]();
}

uint64_t CCBigNumFree()
{
  return MEMORY[0x1E0C80038]();
}

uint64_t CCBigNumFromData()
{
  return MEMORY[0x1E0C80040]();
}

uint64_t CCBigNumMod()
{
  return MEMORY[0x1E0C80048]();
}

uint64_t CCBigNumModExp()
{
  return MEMORY[0x1E0C80050]();
}

uint64_t CCBigNumMul()
{
  return MEMORY[0x1E0C80058]();
}

uint64_t CCBigNumMulMod()
{
  return MEMORY[0x1E0C80060]();
}

uint64_t CCBigNumSetI()
{
  return MEMORY[0x1E0C80068]();
}

uint64_t CCBigNumSub()
{
  return MEMORY[0x1E0C80070]();
}

uint64_t CCBigNumToData()
{
  return MEMORY[0x1E0C80078]();
}

uint64_t CCCreateBigNum()
{
  return MEMORY[0x1E0C80080]();
}

CCCryptorStatus CCCryptorCreate(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x1E0C80098](*(_QWORD *)&op, *(_QWORD *)&alg, *(_QWORD *)&options, key, keyLength, iv, cryptorRef);
}

CCCryptorStatus CCCryptorCreateWithMode(CCOperation op, CCMode mode, CCAlgorithm alg, CCPadding padding, const void *iv, const void *key, size_t keyLength, const void *tweak, size_t tweakLength, int numRounds, CCModeOptions options, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x1E0C800A0](*(_QWORD *)&op, *(_QWORD *)&mode, *(_QWORD *)&alg, *(_QWORD *)&padding, iv, key, keyLength, tweak);
}

uint64_t CCCryptorGCMAddAAD()
{
  return MEMORY[0x1E0C800B8]();
}

uint64_t CCCryptorGCMDecrypt()
{
  return MEMORY[0x1E0C800C0]();
}

uint64_t CCCryptorGCMEncrypt()
{
  return MEMORY[0x1E0C800C8]();
}

uint64_t CCCryptorGCMFinalize()
{
  return MEMORY[0x1E0C800D0]();
}

uint64_t CCCryptorGCMReset()
{
  return MEMORY[0x1E0C800E8]();
}

uint64_t CCCryptorGCMSetIV()
{
  return MEMORY[0x1E0C800F0]();
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x1E0C80108](cryptorRef);
}

CCCryptorStatus CCCryptorReset(CCCryptorRef cryptorRef, const void *iv)
{
  return MEMORY[0x1E0C80110](cryptorRef, iv);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1E0C80118](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

uint64_t CCRSACryptorImport()
{
  return MEMORY[0x1E0C80278]();
}

uint64_t CCRSACryptorRelease()
{
  return MEMORY[0x1E0C80280]();
}

uint64_t CCRSACryptorSign()
{
  return MEMORY[0x1E0C80288]();
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return MEMORY[0x1E0C802C0](bytes, count);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80310](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80318](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80320](c, data, *(_QWORD *)&len);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80328](data, *(_QWORD *)&len, md);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80330](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80338](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80340](c, data, *(_QWORD *)&len);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80370](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80378](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80380](c, data, *(_QWORD *)&len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1E0C803B0](md, c);
}

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x1E0C803B8](c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C803C0](c, data, *(_QWORD *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
  MEMORY[0x1E0C97D00](theArray, range.location, range.length, applier, context);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1E0C97D30](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D50](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D78](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x1E0C97DC0](theArray, idx);
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
  MEMORY[0x1E0C97DE0](theArray, range.location, range.length, comparator, context);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

Boolean CFCalendarComposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime *at, const char *componentDesc, ...)
{
  return MEMORY[0x1E0C98228](calendar, at, componentDesc);
}

CFCalendarRef CFCalendarCopyCurrent(void)
{
  return (CFCalendarRef)MEMORY[0x1E0C98230]();
}

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...)
{
  uint64_t v3;
  va_list va;

  va_start(va, componentDesc);
  v3 = va_arg(va, _QWORD);
  return MEMORY[0x1E0C98248](calendar, v3, at);
}

void CFCalendarSetTimeZone(CFCalendarRef calendar, CFTimeZoneRef tz)
{
  MEMORY[0x1E0C98298](calendar, tz);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1E0C98350](cf);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x1E0C98390](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x1E0C983F0](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return MEMORY[0x1E0C98440](theDate, otherDate, context);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1E0C98448](allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C984D8](theDate);
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x1E0C984E8]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98508](theDict, applier, context);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x1E0C985A0](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1E0C98660](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x1E0C98670](err);
}

CFTypeID CFErrorGetTypeID(void)
{
  return MEMORY[0x1E0C98678]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFTypeID CFNullGetTypeID(void)
{
  return MEMORY[0x1E0C98908]();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFIndex CFNumberGetByteSize(CFNumberRef number)
{
  return MEMORY[0x1E0C98990](number);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1E0C989A8](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1E0C989D0](number);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFArrayRef)MEMORY[0x1E0C98A50](applicationID, userName, hostName);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0C98AA0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AB0](allocator, propertyList, mutabilityOption);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AD0](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C40]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x1E0C98C80](rl, mode, block);
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C90](rl, source, mode);
}

void CFRunLoopRun(void)
{
  MEMORY[0x1E0C98CA8]();
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1E0C98CB0](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98CC8](allocator, order, context);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D00](rl);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D68](rl);
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98D78](theSet, applier, context);
}

CFTypeID CFSetGetTypeID(void)
{
  return MEMORY[0x1E0C98DB8]();
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
  MEMORY[0x1E0C98EE0](theString, cStr, *(_QWORD *)&encoding);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x1E0C98EF0](theString, formatOptions, format);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F98](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

void CFStringDelete(CFMutableStringRef theString, CFRange range)
{
  MEMORY[0x1E0C99038](theString, range.location, range.length);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1E0C99080](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99118](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

CFTimeZoneRef CFTimeZoneCreateWithName(CFAllocatorRef allocator, CFStringRef name, Boolean tryAbbrev)
{
  return (CFTimeZoneRef)MEMORY[0x1E0C99288](allocator, name, tryAbbrev);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C993C8](allocator, buffer, bufLen, isDirectory);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C994A0](anURL);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x1E0C994B8]();
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1E0C99518](alloc);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x1E0C99530](alloc, *(_QWORD *)&bytes.byte0, *(_QWORD *)&bytes.byte8);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
}

CFTypeID CFUUIDGetTypeID(void)
{
  return MEMORY[0x1E0C99560]();
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1;
  uint64_t v2;
  CFUUIDBytes result;

  v1 = MEMORY[0x1E0C99568](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x1E0C995A0](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1E0C995A8](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C995B8](allocator, userNotification, callout, order);
}

uint64_t CUErrorCodesTableGet()
{
  return MEMORY[0x1E0D1B9C8]();
}

uint64_t CUErrorDomainTableGet()
{
  return MEMORY[0x1E0D1B9D0]();
}

DNSServiceErrorType DNSServiceBrowse(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *regtype, const char *domain, DNSServiceBrowseReply callBack, void *context)
{
  return MEMORY[0x1E0C80420](sdRef, *(_QWORD *)&flags, *(_QWORD *)&interfaceIndex, regtype, domain, callBack, context);
}

DNSServiceErrorType DNSServiceConstructFullName(char *const fullName, const char *const service, const char *const regtype, const char *const domain)
{
  return MEMORY[0x1E0C80430](fullName, service, regtype, domain);
}

DNSServiceErrorType DNSServiceCreateConnection(DNSServiceRef *sdRef)
{
  return MEMORY[0x1E0C80438](sdRef);
}

DNSServiceErrorType DNSServiceGetAddrInfo(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, DNSServiceProtocol protocol, const char *hostname, DNSServiceGetAddrInfoReply callBack, void *context)
{
  return MEMORY[0x1E0C80458](sdRef, *(_QWORD *)&flags, *(_QWORD *)&interfaceIndex, *(_QWORD *)&protocol, hostname, callBack, context);
}

DNSServiceErrorType DNSServiceProcessResult(DNSServiceRef sdRef)
{
  return MEMORY[0x1E0C80470](sdRef);
}

DNSServiceErrorType DNSServiceQueryRecord(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *fullname, uint16_t rrtype, uint16_t rrclass, DNSServiceQueryRecordReply callBack, void *context)
{
  return MEMORY[0x1E0C80478](sdRef, *(_QWORD *)&flags, *(_QWORD *)&interfaceIndex, fullname, rrtype, rrclass, callBack, context);
}

DNSServiceErrorType DNSServiceReconfirmRecord(DNSServiceFlags flags, uint32_t interfaceIndex, const char *fullname, uint16_t rrtype, uint16_t rrclass, uint16_t rdlen, const void *rdata)
{
  return MEMORY[0x1E0C80488](*(_QWORD *)&flags, *(_QWORD *)&interfaceIndex, fullname, rrtype, rrclass, rdlen, rdata);
}

void DNSServiceRefDeallocate(DNSServiceRef sdRef)
{
  MEMORY[0x1E0C80490](sdRef);
}

DNSServiceErrorType DNSServiceRegister(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *name, const char *regtype, const char *domain, const char *host, uint16_t port, uint16_t txtLen, const void *txtRecord, DNSServiceRegisterReply callBack, void *context)
{
  return MEMORY[0x1E0C804A0](sdRef, *(_QWORD *)&flags, *(_QWORD *)&interfaceIndex, name, regtype, domain, host, port);
}

DNSServiceErrorType DNSServiceResolve(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *name, const char *regtype, const char *domain, DNSServiceResolveReply callBack, void *context)
{
  return MEMORY[0x1E0C804B8](sdRef, *(_QWORD *)&flags, *(_QWORD *)&interfaceIndex, name, regtype, domain, callBack, context);
}

DNSServiceErrorType DNSServiceSetDispatchQueue(DNSServiceRef service, dispatch_queue_t queue)
{
  return MEMORY[0x1E0C804C8](service, queue);
}

DNSServiceErrorType DNSServiceUpdateRecord(DNSServiceRef sdRef, DNSRecordRef recordRef, DNSServiceFlags flags, uint16_t rdlen, const void *rdata, uint32_t ttl)
{
  return MEMORY[0x1E0C804E0](sdRef, recordRef, *(_QWORD *)&flags, rdlen, rdata, *(_QWORD *)&ttl);
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x1E0CBAD20](*(_QWORD *)&kernelPort, notificationID);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x1E0CBAE38](notifier);
}

IOReturn IOHIDDeviceClose(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x1E0CBAE60](device, *(_QWORD *)&options);
}

IOHIDDeviceRef IOHIDDeviceCreate(CFAllocatorRef allocator, io_service_t service)
{
  return (IOHIDDeviceRef)MEMORY[0x1E0CBAE78](allocator, *(_QWORD *)&service);
}

CFTypeRef IOHIDDeviceGetProperty(IOHIDDeviceRef device, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0CBAE88](device, key);
}

IOReturn IOHIDDeviceOpen(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x1E0CBAEB8](device, *(_QWORD *)&options);
}

void IOHIDDeviceRegisterInputReportCallback(IOHIDDeviceRef device, uint8_t *report, CFIndex reportLength, IOHIDReportCallback callback, void *context)
{
  MEMORY[0x1E0CBAEC0](device, report, reportLength, callback, context);
}

void IOHIDDeviceRegisterRemovalCallback(IOHIDDeviceRef device, IOHIDCallback callback, void *context)
{
  MEMORY[0x1E0CBAED8](device, callback, context);
}

void IOHIDDeviceScheduleWithRunLoop(IOHIDDeviceRef device, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  MEMORY[0x1E0CBAEE0](device, runLoop, runLoopMode);
}

void IOHIDDeviceUnscheduleFromRunLoop(IOHIDDeviceRef device, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  MEMORY[0x1E0CBAF28](device, runLoop, runLoopMode);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1E0CBB668](*(_QWORD *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x1E0CBB698](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x1E0CBB6A0](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x1E0CBB6B8](notify, queue);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x1E0CBB6C8](*(_QWORD *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

CFDictionaryRef IOPSCopyExternalPowerAdapterDetails(void)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBB860]();
}

uint64_t IOPSCopyPowerSourcesByType()
{
  return MEMORY[0x1E0CBB868]();
}

CFArrayRef IOPSCopyPowerSourcesList(CFTypeRef blob)
{
  return (CFArrayRef)MEMORY[0x1E0CBB880](blob);
}

uint64_t IOPSCreatePowerSource()
{
  return MEMORY[0x1E0CBB888]();
}

uint64_t IOPSDrawingUnlimitedPower()
{
  return MEMORY[0x1E0CBB890]();
}

CFDictionaryRef IOPSGetPowerSourceDescription(CFTypeRef blob, CFTypeRef ps)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBB8A8](blob, ps);
}

uint64_t IOPSReleasePowerSource()
{
  return MEMORY[0x1E0CBB8C8]();
}

uint64_t IOPSSetPowerSourceDetails()
{
  return MEMORY[0x1E0CBB8D0]();
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x1E0CBB8D8](refcon, thePortRef, callback, notifier);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x1E0CBB958](*(_QWORD *)&entry, plane, parent);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x1E0CBB9C8](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1E0CBB9D0](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x1E0CBB9F0](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA08](name);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1E0D4E4A0]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1E0D4E4D0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

CFStringRef SCDynamicStoreCopyComputerName(SCDynamicStoreRef store, CFStringEncoding *nameEncoding)
{
  return (CFStringRef)MEMORY[0x1E0CE8738](store, nameEncoding);
}

CFStringRef SCDynamicStoreCopyLocalHostName(SCDynamicStoreRef store)
{
  return (CFStringRef)MEMORY[0x1E0CE8750](store);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x1E0CE8768](store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x1E0CE8770](allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateComputerName(CFAllocatorRef allocator)
{
  return (CFStringRef)MEMORY[0x1E0CE8788](allocator);
}

CFStringRef SCDynamicStoreKeyCreateNetworkGlobalEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1E0CE8798](allocator, domain, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1E0CE87A8](allocator, domain, ifname, entity);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return MEMORY[0x1E0CE87C8](store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x1E0CE87D8](store, keys, patterns);
}

int SCError(void)
{
  return MEMORY[0x1E0CE87E0]();
}

uint64_t SCNetworkReachabilityCreateWithOptions()
{
  return MEMORY[0x1E0CE88D0]();
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x1E0CE88D8](target, flags);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x1E0CE88F0](target, callout, context);
}

Boolean SCNetworkReachabilitySetDispatchQueue(SCNetworkReachabilityRef target, dispatch_queue_t queue)
{
  return MEMORY[0x1E0CE88F8](target, queue);
}

uint64_t SCNetworkSignatureCopyActiveIdentifiers()
{
  return MEMORY[0x1E0CE89A8]();
}

Boolean SCPreferencesApplyChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x1E0CE89B8](prefs);
}

Boolean SCPreferencesCommitChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x1E0CE89C0](prefs);
}

SCPreferencesRef SCPreferencesCreateWithAuthorization(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID, AuthorizationRef authorization)
{
  return (SCPreferencesRef)MEMORY[0x1E0CE89D0](allocator, name, prefsID, authorization);
}

Boolean SCPreferencesSetComputerName(SCPreferencesRef prefs, CFStringRef name, CFStringEncoding nameEncoding)
{
  return MEMORY[0x1E0CE8A08](prefs, name, *(_QWORD *)&nameEncoding);
}

uint64_t SCPreferencesSetHostName()
{
  return MEMORY[0x1E0CE8A18]();
}

Boolean SCPreferencesSetLocalHostName(SCPreferencesRef prefs, CFStringRef name)
{
  return MEMORY[0x1E0CE8A20](prefs, name);
}

OSStatus SSLCopyPeerTrust(SSLContextRef context, SecTrustRef *trust)
{
  return MEMORY[0x1E0CD5D50](context, trust);
}

SSLContextRef SSLCreateContext(CFAllocatorRef alloc, SSLProtocolSide protocolSide, SSLConnectionType connectionType)
{
  return (SSLContextRef)MEMORY[0x1E0CD5D58](alloc, *(_QWORD *)&protocolSide, *(_QWORD *)&connectionType);
}

OSStatus SSLHandshake(SSLContextRef context)
{
  return MEMORY[0x1E0CD5DC0](context);
}

OSStatus SSLRead(SSLContextRef context, void *data, size_t dataLength, size_t *processed)
{
  return MEMORY[0x1E0CD5DD0](context, data, dataLength, processed);
}

OSStatus SSLSetCertificate(SSLContextRef context, CFArrayRef certRefs)
{
  return MEMORY[0x1E0CD5DF0](context, certRefs);
}

OSStatus SSLSetConnection(SSLContextRef context, SSLConnectionRef connection)
{
  return MEMORY[0x1E0CD5E00](context, connection);
}

OSStatus SSLSetEnabledCiphers(SSLContextRef context, const SSLCipherSuite *ciphers, size_t numCiphers)
{
  return MEMORY[0x1E0CD5E10](context, ciphers, numCiphers);
}

OSStatus SSLSetIOFuncs(SSLContextRef context, SSLReadFunc readFunc, SSLWriteFunc writeFunc)
{
  return MEMORY[0x1E0CD5E18](context, readFunc, writeFunc);
}

uint64_t SSLSetPSKIdentity()
{
  return MEMORY[0x1E0CD5E38]();
}

uint64_t SSLSetPSKSharedSecret()
{
  return MEMORY[0x1E0CD5E40]();
}

OSStatus SSLSetPeerDomainName(SSLContextRef context, const char *peerName, size_t peerNameLen)
{
  return MEMORY[0x1E0CD5E48](context, peerName, peerNameLen);
}

OSStatus SSLSetProtocolVersionMin(SSLContextRef context, SSLProtocol minVersion)
{
  return MEMORY[0x1E0CD5E60](context, *(_QWORD *)&minVersion);
}

OSStatus SSLSetSessionOption(SSLContextRef context, SSLSessionOption option, Boolean value)
{
  return MEMORY[0x1E0CD5E70](context, *(_QWORD *)&option, value);
}

OSStatus SSLWrite(SSLContextRef context, const void *data, size_t dataLength, size_t *processed)
{
  return MEMORY[0x1E0CD5E78](context, data, dataLength, processed);
}

uint64_t SecCMSCertificatesOnlyMessageCopyCertificates()
{
  return MEMORY[0x1E0CD5F08]();
}

OSStatus SecCertificateCopyCommonName(SecCertificateRef certificate, CFStringRef *commonName)
{
  return MEMORY[0x1E0CD5F48](certificate, commonName);
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x1E0CD5F60](certificate);
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x1E0CD5F98](certificate);
}

CFDataRef SecCertificateCopySerialNumberData(SecCertificateRef certificate, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0CD5FD8](certificate, error);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x1E0CD6010](allocator, data);
}

CFTypeID SecCertificateGetTypeID(void)
{
  return MEMORY[0x1E0CD6050]();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x1E0CD6270](identityRef, certificateRef);
}

OSStatus SecIdentityCopyPrivateKey(SecIdentityRef identityRef, SecKeyRef *privateKeyRef)
{
  return MEMORY[0x1E0CD6278](identityRef, privateKeyRef);
}

uint64_t SecIdentityCreate()
{
  return MEMORY[0x1E0CD6280]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6290](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6298](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1E0CD62A0](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x1E0CD62D8](query, attributesToUpdate);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1E0CD63A0](keyData, attributes, error);
}

size_t SecKeyGetBlockSize(SecKeyRef key)
{
  return MEMORY[0x1E0CD63D8](key);
}

OSStatus SecKeyRawSign(SecKeyRef key, SecPadding padding, const uint8_t *dataToSign, size_t dataToSignLen, uint8_t *sig, size_t *sigLen)
{
  return MEMORY[0x1E0CD63F8](key, *(_QWORD *)&padding, dataToSign, dataToSignLen, sig, sigLen);
}

OSStatus SecKeyRawVerify(SecKeyRef key, SecPadding padding, const uint8_t *signedData, size_t signedDataLen, const uint8_t *sig, size_t sigLen)
{
  return MEMORY[0x1E0CD6400](key, *(_QWORD *)&padding, signedData, signedDataLen, sig, sigLen);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x1E0CD6418](key, algorithm, signedData, signature, error);
}

uint64_t SecPolicyCreateAppleBasicAttestationUser()
{
  return MEMORY[0x1E0CD6470]();
}

uint64_t SecPolicyCreateiAP()
{
  return MEMORY[0x1E0CD6548]();
}

uint64_t SecPolicyCreateiAPSWAuth()
{
  return MEMORY[0x1E0CD6550]();
}

SecKeyRef SecTrustCopyPublicKey(SecTrustRef trust)
{
  return (SecKeyRef)MEMORY[0x1E0CD6688](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x1E0CD6698](certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x1E0CD66C8](trust, error);
}

OSStatus SecTrustSetAnchorCertificates(SecTrustRef trust, CFArrayRef anchorCertificates)
{
  return MEMORY[0x1E0CD6710](trust, anchorCertificates);
}

OSStatus SecTrustSetAnchorCertificatesOnly(SecTrustRef trust, Boolean anchorCertificatesOnly)
{
  return MEMORY[0x1E0CD6718](trust, anchorCertificatesOnly);
}

void TXTRecordCreate(TXTRecordRef *txtRecord, uint16_t bufferLen, void *buffer)
{
  MEMORY[0x1E0C806F0](txtRecord, bufferLen, buffer);
}

void TXTRecordDeallocate(TXTRecordRef *txtRecord)
{
  MEMORY[0x1E0C806F8](txtRecord);
}

const void *__cdecl TXTRecordGetBytesPtr(const TXTRecordRef *txtRecord)
{
  return (const void *)MEMORY[0x1E0C80700](txtRecord);
}

uint16_t TXTRecordGetLength(const TXTRecordRef *txtRecord)
{
  return MEMORY[0x1E0C80718](txtRecord);
}

const void *__cdecl TXTRecordGetValuePtr(uint16_t txtLen, const void *txtRecord, const char *key, uint8_t *valueLen)
{
  return (const void *)MEMORY[0x1E0C80720](txtLen, txtRecord, key, valueLen);
}

DNSServiceErrorType TXTRecordSetValue(TXTRecordRef *txtRecord, const char *key, uint8_t valueSize, const void *value)
{
  return MEMORY[0x1E0C80730](txtRecord, key, valueSize, value);
}

uint64_t WiFiDeviceClientAssociateAsync()
{
  return MEMORY[0x1E0D4FAF0]();
}

uint64_t WiFiDeviceClientCopyCurrentNetwork()
{
  return MEMORY[0x1E0D4FAF8]();
}

uint64_t WiFiDeviceClientCopyHostedNetworks()
{
  return MEMORY[0x1E0D4FB08]();
}

uint64_t WiFiDeviceClientCopyProperty()
{
  return MEMORY[0x1E0D4FB18]();
}

uint64_t WiFiDeviceClientGetInterfaceName()
{
  return MEMORY[0x1E0D4FB20]();
}

uint64_t WiFiDeviceClientGetInterfaceRoleIndex()
{
  return MEMORY[0x1E0D4FB28]();
}

uint64_t WiFiDeviceClientGetPower()
{
  return MEMORY[0x1E0D4FB30]();
}

uint64_t WiFiDeviceClientIsInterfaceAWDL()
{
  return MEMORY[0x1E0D4FB40]();
}

uint64_t WiFiDeviceClientRegister24GHzNetworkInCriticalStateCallback()
{
  return MEMORY[0x1E0D4FB50]();
}

uint64_t WiFiDeviceClientRegisterAutoJoinNotificationCallback()
{
  return MEMORY[0x1E0D4FB58]();
}

uint64_t WiFiDeviceClientRegisterHostApStateChangedCallback()
{
  return MEMORY[0x1E0D4FB70]();
}

uint64_t WiFiDeviceClientRegisterPowerCallback()
{
  return MEMORY[0x1E0D4FB80]();
}

uint64_t WiFiDeviceClientRegisterRemovalCallback()
{
  return MEMORY[0x1E0D4FB88]();
}

uint64_t WiFiDeviceClientScanAsync()
{
  return MEMORY[0x1E0D4FBA0]();
}

uint64_t WiFiDeviceClientSetPower()
{
  return MEMORY[0x1E0D4FBB0]();
}

uint64_t WiFiDeviceClientStartNetwork()
{
  return MEMORY[0x1E0D4FBB8]();
}

uint64_t WiFiDeviceClientStopNetwork()
{
  return MEMORY[0x1E0D4FBC0]();
}

uint64_t WiFiDeviceClientTrafficRegistration()
{
  return MEMORY[0x1E0D4FBC8]();
}

uint64_t WiFiManagerClientAddNetwork()
{
  return MEMORY[0x1E0D4FBD8]();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return MEMORY[0x1E0D4FBE0]();
}

uint64_t WiFiManagerClientCopyInterfaces()
{
  return MEMORY[0x1E0D4FBF0]();
}

uint64_t WiFiManagerClientCopyNetworks()
{
  return MEMORY[0x1E0D4FBF8]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x1E0D4FC08]();
}

uint64_t WiFiManagerClientDisable()
{
  return MEMORY[0x1E0D4FC10]();
}

uint64_t WiFiManagerClientEnable()
{
  return MEMORY[0x1E0D4FC18]();
}

uint64_t WiFiManagerClientEnableNetwork()
{
  return MEMORY[0x1E0D4FC20]();
}

uint64_t WiFiManagerClientGetPower()
{
  return MEMORY[0x1E0D4FC38]();
}

uint64_t WiFiManagerClientRegisterDeviceAttachmentCallback()
{
  return MEMORY[0x1E0D4FC58]();
}

uint64_t WiFiManagerClientRegisterServerRestartCallback()
{
  return MEMORY[0x1E0D4FC68]();
}

uint64_t WiFiManagerClientScheduleWithRunLoop()
{
  return MEMORY[0x1E0D4FC88]();
}

uint64_t WiFiManagerClientSetWoWState()
{
  return MEMORY[0x1E0D4FCB0]();
}

uint64_t WiFiManagerClientTemporarilyDisableNetwork()
{
  return MEMORY[0x1E0D4FCB8]();
}

uint64_t WiFiManagerClientUnscheduleFromRunLoop()
{
  return MEMORY[0x1E0D4FCC0]();
}

uint64_t WiFiNetworkCopyPassword()
{
  return MEMORY[0x1E0D4FCD0]();
}

uint64_t WiFiNetworkCopyRecord()
{
  return MEMORY[0x1E0D4FCD8]();
}

uint64_t WiFiNetworkGetAuthFlags()
{
  return MEMORY[0x1E0D4FCF8]();
}

uint64_t WiFiNetworkGetChannel()
{
  return MEMORY[0x1E0D4FD00]();
}

uint64_t WiFiNetworkGetDirectedState()
{
  return MEMORY[0x1E0D4FD08]();
}

uint64_t WiFiNetworkGetIntProperty()
{
  return MEMORY[0x1E0D4FD10]();
}

uint64_t WiFiNetworkGetOperatingBand()
{
  return MEMORY[0x1E0D4FD18]();
}

uint64_t WiFiNetworkGetProperty()
{
  return MEMORY[0x1E0D4FD20]();
}

uint64_t WiFiNetworkGetSSID()
{
  return MEMORY[0x1E0D4FD30]();
}

uint64_t WiFiNetworkGetSSIDData()
{
  return MEMORY[0x1E0D4FD38]();
}

uint64_t WiFiNetworkGetShareMode()
{
  return MEMORY[0x1E0D4FD40]();
}

uint64_t WiFiNetworkIsAdHoc()
{
  return MEMORY[0x1E0D4FD50]();
}

uint64_t WiFiNetworkIsCaptive()
{
  return MEMORY[0x1E0D4FD60]();
}

uint64_t WiFiNetworkIsEAP()
{
  return MEMORY[0x1E0D4FD70]();
}

uint64_t WiFiNetworkIsHidden()
{
  return MEMORY[0x1E0D4FD80]();
}

uint64_t WiFiNetworkIsHotspot()
{
  return MEMORY[0x1E0D4FD88]();
}

uint64_t WiFiNetworkIsHotspot20()
{
  return MEMORY[0x1E0D4FD90]();
}

uint64_t WiFiNetworkIsOpen()
{
  return MEMORY[0x1E0D4FD98]();
}

uint64_t WiFiNetworkIsProfileBased()
{
  return MEMORY[0x1E0D4FDA0]();
}

uint64_t WiFiNetworkIsSAE()
{
  return MEMORY[0x1E0D4FDA8]();
}

uint64_t WiFiNetworkIsWEP()
{
  return MEMORY[0x1E0D4FDB0]();
}

uint64_t WiFiNetworkIsWPA()
{
  return MEMORY[0x1E0D4FDB8]();
}

uint64_t WiFiNetworkSetDirectedState()
{
  return MEMORY[0x1E0D4FDC0]();
}

uint64_t WiFiNetworkSetIntProperty()
{
  return MEMORY[0x1E0D4FDC8]();
}

uint64_t WiFiNetworkSetPassword()
{
  return MEMORY[0x1E0D4FDD0]();
}

uint64_t WiFiNetworkSetProperty()
{
  return MEMORY[0x1E0D4FDD8]();
}

uint64_t WiFiNetworkWasCaptive()
{
  return MEMORY[0x1E0D4FDE0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1E0C9A498]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1E0C9A4B0]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1E0C9A800]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1E0C9A818]();
}

char ***_NSGetEnviron(void)
{
  return (char ***)MEMORY[0x1E0C809D0]();
}

uint64_t _SCNetworkInterfaceCreateWithBSDName()
{
  return MEMORY[0x1E0CE8A98]();
}

uint64_t _SCNetworkInterfaceIsThunderbolt()
{
  return MEMORY[0x1E0CE8AD0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return MEMORY[0x1E0C80AA0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

uint64_t __memset_chk()
{
  return MEMORY[0x1E0C80B78]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C70](*(_QWORD *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C78](*(_QWORD *)&a1);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C81000]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1E0C813C8](*(_QWORD *)&a1, a2, a3);
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1E0C81608](a1, a2);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1E0C816F0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x1E0C81738](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

uint64_t ccaes_gcm_decrypt_mode()
{
  return MEMORY[0x1E0C818B0]();
}

uint64_t ccaes_gcm_encrypt_mode()
{
  return MEMORY[0x1E0C818B8]();
}

uint64_t cccurve25519()
{
  return MEMORY[0x1E0C81998]();
}

uint64_t cccurve25519_make_pub()
{
  return MEMORY[0x1E0C819B0]();
}

uint64_t ccdh_ccn_size()
{
  return MEMORY[0x1E0C81B68]();
}

uint64_t ccdh_gp_n()
{
  return MEMORY[0x1E0C81BA0]();
}

uint64_t cced25519_make_key_pair()
{
  return MEMORY[0x1E0C81E70]();
}

uint64_t cced25519_sign()
{
  return MEMORY[0x1E0C81E88]();
}

uint64_t cced25519_verify()
{
  return MEMORY[0x1E0C81E98]();
}

uint64_t ccgcm_aad()
{
  return MEMORY[0x1E0C81EC0]();
}

uint64_t ccgcm_finalize()
{
  return MEMORY[0x1E0C81ED0]();
}

uint64_t ccgcm_init()
{
  return MEMORY[0x1E0C81EE8]();
}

uint64_t ccgcm_one_shot()
{
  return MEMORY[0x1E0C81EF8]();
}

uint64_t ccgcm_reset()
{
  return MEMORY[0x1E0C81F00]();
}

uint64_t ccgcm_set_iv()
{
  return MEMORY[0x1E0C81F08]();
}

uint64_t ccgcm_update()
{
  return MEMORY[0x1E0C81F10]();
}

uint64_t ccrng()
{
  return MEMORY[0x1E0C822A8]();
}

uint64_t ccsha512_di()
{
  return MEMORY[0x1E0C823F8]();
}

uint64_t ccsrp_client_process_challenge()
{
  return MEMORY[0x1E0C824C0]();
}

uint64_t ccsrp_client_start_authentication()
{
  return MEMORY[0x1E0C824C8]();
}

uint64_t ccsrp_client_verify_session()
{
  return MEMORY[0x1E0C824D0]();
}

uint64_t ccsrp_ctx_init_option()
{
  return MEMORY[0x1E0C824D8]();
}

uint64_t ccsrp_generate_salt_and_verification()
{
  return MEMORY[0x1E0C824E0]();
}

uint64_t ccsrp_get_session_key_length()
{
  return MEMORY[0x1E0C824E8]();
}

uint64_t ccsrp_gp_rfc5054_3072()
{
  return MEMORY[0x1E0C824F0]();
}

uint64_t ccsrp_server_compute_session()
{
  return MEMORY[0x1E0C824F8]();
}

uint64_t ccsrp_server_generate_public_key()
{
  return MEMORY[0x1E0C82500]();
}

uint64_t ccsrp_server_verify_session()
{
  return MEMORY[0x1E0C82508]();
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C82638](a1, a2);
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return MEMORY[0x1E0C82668](*(_QWORD *)&__clock_id, __tp);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1E0C82698](a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1E0C826D8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE92C0](strm, *(_QWORD *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE92D0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE92D8](strm, *(_QWORD *)&level, *(_QWORD *)&method, *(_QWORD *)&windowBits, *(_QWORD *)&memLevel, *(_QWORD *)&strategy, version, *(_QWORD *)&stream_size);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x1E0C82C18](queue, context, work);
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82CF8]();
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x1E0C82E10](predicate, context, function);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1E0C82E58](queue);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA8](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
  MEMORY[0x1E0C82EE0](object, context);
}

void dispatch_set_finalizer_f(dispatch_object_t object, dispatch_function_t finalizer)
{
  MEMORY[0x1E0C82EE8](object, finalizer);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1E0C82F28](source);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
}

void dispatch_source_set_cancel_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
  MEMORY[0x1E0C82F50](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
  MEMORY[0x1E0C82F60](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x1E0C82FA0](queue, context, work);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int feof(FILE *a1)
{
  return MEMORY[0x1E0C83340](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C83370](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x1E0C833A0](a1, *(_QWORD *)&a2, a3);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1E0C833B0](a1);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1E0C83488](*(_QWORD *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1E0C83490](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void freeaddrinfo(addrinfo *a1)
{
  MEMORY[0x1E0C834C0](a1);
}

void freeifaddrs(ifaddrs *a1)
{
  MEMORY[0x1E0C834D0](a1);
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x1E0C83538](__stream, a2, *(_QWORD *)&__whence);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

off_t ftello(FILE *__stream)
{
  return MEMORY[0x1E0C83588](__stream);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return MEMORY[0x1E0C835F8](a1, a2, a3, a4);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

int gethostuuid(uuid_t a1, const timespec *a2)
{
  return MEMORY[0x1E0C836C0](a1, a2);
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x1E0C836C8](a1);
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1E0C83748](*(_QWORD *)&a1, a2, a3);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C83778]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1E0C83790](a1);
}

int getpwnam_r(const char *a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1E0C83798](a1, a2, a3, a4, a5);
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1E0C837A8](*(_QWORD *)&a1, a2, a3, a4, a5);
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1E0C83810](*(_QWORD *)&a1, a2, a3);
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x1E0C83818](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, a5);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1E0C83820](a1, a2);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

tm *__cdecl gmtime(const time_t *a1)
{
  return (tm *)MEMORY[0x1E0C83858](a1);
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C83860](a1, a2);
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x1E0C83900](*(_QWORD *)&a1, a2);
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x1E0C83910](a1);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE93A0](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE93B8](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE93C8](strm, *(_QWORD *)&windowBits, version, *(_QWORD *)&stream_size);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1E0C83980](*(_QWORD *)&a1, a2);
}

int isatty(int a1)
{
  return MEMORY[0x1E0C839A8](*(_QWORD *)&a1);
}

int listen(int a1, int a2)
{
  return MEMORY[0x1E0C83B80](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x1E0C83BA8](a1);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
}

mach_port_t mach_thread_self(void)
{
  return MEMORY[0x1E0C83DB0]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return MEMORY[0x1E0C83DC0](*(_QWORD *)&target, address, size, *(_QWORD *)&flags);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1E0C83DD0](*(_QWORD *)&target, address, size);
}

kern_return_t mach_vm_remap(vm_map_t target_task, mach_vm_address_t *target_address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, vm_map_t src_task, mach_vm_address_t src_address, BOOLean_t copy, vm_prot_t *cur_protection, vm_prot_t *max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x1E0C83E10](*(_QWORD *)&target_task, target_address, size, mask, *(_QWORD *)&flags, *(_QWORD *)&src_task, src_address, *(_QWORD *)&copy);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1E0C840D0](__s, __smax, *(_QWORD *)&__c, __n);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84160](a1, a2);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1E0C841A0](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

long double modf(long double __x, long double *__y)
{
  long double result;

  MEMORY[0x1E0C841E0](__y, __x);
  return result;
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

int nanosleep(const timespec *__rqtp, timespec *__rmtp)
{
  return MEMORY[0x1E0C84238](__rqtp, __rmtp);
}

int nftw(const char *a1, int (__cdecl *a2)(const char *, const stat *, int, FTW *), int a3, int a4)
{
  return MEMORY[0x1E0C843C8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

const char *__cdecl nw_interface_get_name(nw_interface_t interface)
{
  return (const char *)MEMORY[0x1E0CCF708](interface);
}

nw_parameters_t nw_parameters_create(void)
{
  return (nw_parameters_t)MEMORY[0x1E0CCF938]();
}

void nw_parameters_prohibit_interface_type(nw_parameters_t parameters, nw_interface_type_t interface_type)
{
  MEMORY[0x1E0CCFA40](parameters, *(_QWORD *)&interface_type);
}

uint64_t nw_parameters_set_avoided_netagent_classes()
{
  return MEMORY[0x1E0CCFA78]();
}

uint64_t nw_path_copy_interface()
{
  return MEMORY[0x1E0CCFCD8]();
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return MEMORY[0x1E0CCFD08]();
}

uint64_t nw_path_evaluator_cancel()
{
  return MEMORY[0x1E0CCFD28]();
}

uint64_t nw_path_evaluator_copy_path()
{
  return MEMORY[0x1E0CCFD30]();
}

uint64_t nw_path_evaluator_set_update_handler()
{
  return MEMORY[0x1E0CCFD60]();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x1E0CCFDE8](path);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1E0C844C0](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
}

uint64_t os_channel_advance_slot()
{
  return MEMORY[0x1E0C84548]();
}

uint64_t os_channel_attr_create()
{
  return MEMORY[0x1E0C84550]();
}

uint64_t os_channel_attr_destroy()
{
  return MEMORY[0x1E0C84558]();
}

uint64_t os_channel_attr_get()
{
  return MEMORY[0x1E0C84560]();
}

uint64_t os_channel_get_fd()
{
  return MEMORY[0x1E0C845C8]();
}

uint64_t os_channel_get_next_slot()
{
  return MEMORY[0x1E0C845E0]();
}

uint64_t os_channel_read_attr()
{
  return MEMORY[0x1E0C84618]();
}

uint64_t os_channel_ring_id()
{
  return MEMORY[0x1E0C84620]();
}

uint64_t os_channel_rx_ring()
{
  return MEMORY[0x1E0C84638]();
}

uint64_t os_channel_set_slot_properties()
{
  return MEMORY[0x1E0C84640]();
}

uint64_t os_channel_sync()
{
  return MEMORY[0x1E0C84660]();
}

uint64_t os_channel_tx_ring()
{
  return MEMORY[0x1E0C84668]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1E0C84940]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1E0C84948]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1E0C849D8]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

uint64_t os_variant_is_recovery()
{
  return MEMORY[0x1E0C84A10]();
}

int pclose(FILE *a1)
{
  return MEMORY[0x1E0C84AE8](a1);
}

int pipe(int a1[2])
{
  return MEMORY[0x1E0C84B10](a1);
}

FILE *__cdecl popen(const char *a1, const char *a2)
{
  return (FILE *)MEMORY[0x1E0C84B28](a1, a2);
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x1E0C84B38](a1, a2, a3, a4, __argv, __envp);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1E0C84C40](*(_QWORD *)&pid, *(_QWORD *)&flavor, arg, buffer, *(_QWORD *)&buffersize);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D20](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1E0C84D28](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D30](a1);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x1E0C84D38](a1, a2, a3);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1E0C84D50](a1, a2, a3, a4);
}

int pthread_getname_np(pthread_t a1, char *a2, size_t a3)
{
  return MEMORY[0x1E0C84DB0](a1, a2, a3);
}

int pthread_getschedparam(pthread_t a1, int *a2, sched_param *a3)
{
  return MEMORY[0x1E0C84DB8](a1, a2, a3);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x1E0C84DD8](a1, a2);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x1E0C84E00](a1);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E18](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x1E0C84F08](a1);
}

int pthread_setschedparam(pthread_t a1, int a2, const sched_param *a3)
{
  return MEMORY[0x1E0C84F10](a1, *(_QWORD *)&a2, a3);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1E0C85008](a1);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C85040](a1, a2);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x1E0C85060](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

ssize_t recvfrom(int a1, void *a2, size_t a3, int a4, sockaddr *a5, socklen_t *a6)
{
  return MEMORY[0x1E0C85068](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4, a5, a6);
}

ssize_t recvmsg(int a1, msghdr *a2, int a3)
{
  return MEMORY[0x1E0C85070](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x1E0C850B8](__p, __ec);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return MEMORY[0x1E0C85280](*(_QWORD *)&a1, a2, a3, a4, a5);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x1E0C852F8](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

ssize_t sendmsg(int a1, const msghdr *a2, int a3)
{
  return MEMORY[0x1E0C85300](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

ssize_t sendto(int a1, const void *a2, size_t a3, int a4, const sockaddr *a5, socklen_t a6)
{
  return MEMORY[0x1E0C85310](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x1E0C85388](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

int setuid(uid_t a1)
{
  return MEMORY[0x1E0C85390](*(_QWORD *)&a1);
}

int setvbuf(FILE *a1, char *a2, int a3, size_t a4)
{
  return MEMORY[0x1E0C85398](a1, a2, *(_QWORD *)&a3, a4);
}

int shutdown(int a1, int a2)
{
  return MEMORY[0x1E0C853C0](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1E0C853F0](*(_QWORD *)&a1, a2);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x1E0C85418](__x);
  return result;
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1E0C85450](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C85500](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1E0C85538](__s, __charset);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1E0C85558](a1, a2, a3, a4);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85568](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1E0C85590](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1E0C855C8](__big, __little, __len);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C855E8](__s, *(_QWORD *)&__c);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x1E0C855F0](__stringp, __delim);
}

size_t strspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1E0C85608](__s, __charset);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85610](__s1, __s2);
}

double strtod(const char *a1, char **a2)
{
  double result;

  MEMORY[0x1E0C85618](a1, a2);
  return result;
}

char *__cdecl strtok_r(char *__str, const char *__sep, char **__lasts)
{
  return (char *)MEMORY[0x1E0C85650](__str, __sep, __lasts);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85698](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1E0C85790](*(_QWORD *)&a1);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x1E0C857D0](*(_QWORD *)&a1, a2);
}

int tcgetattr(int a1, termios *a2)
{
  return MEMORY[0x1E0C858B0](*(_QWORD *)&a1, a2);
}

int tcsetattr(int a1, int a2, const termios *a3)
{
  return MEMORY[0x1E0C858C0](*(_QWORD *)&a1, *(_QWORD *)&a2, a3);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x1E0C858F8](*(_QWORD *)&target_act, *(_QWORD *)&flavor, thread_info_out, thread_info_outCnt);
}

kern_return_t thread_policy_get(thread_inspect_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t *policy_infoCnt, BOOLean_t *get_default)
{
  return MEMORY[0x1E0C85900](*(_QWORD *)&thread, *(_QWORD *)&flavor, policy_info, policy_infoCnt, get_default);
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x1E0C85908](*(_QWORD *)&thread, *(_QWORD *)&flavor, policy_info, *(_QWORD *)&policy_infoCnt);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1E0C85B98](__str, __size, __format, a4);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x1E0C85BD0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

ssize_t writev(int a1, const iovec *a2, int a3)
{
  return MEMORY[0x1E0C85D48](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x1E0C85DE0](xarray, value);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C85DF8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

void xpc_array_set_double(xpc_object_t xarray, size_t index, double value)
{
  MEMORY[0x1E0C85EB0](xarray, index, value);
}

void xpc_array_set_int64(xpc_object_t xarray, size_t index, int64_t value)
{
  MEMORY[0x1E0C85EC0](xarray, index, value);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
  MEMORY[0x1E0C85ED0](xarray, index, string);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1E0C85F00](xBOOL);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return MEMORY[0x1E0C85F78]();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
  MEMORY[0x1E0C86020](connection, barrier);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

uint64_t xpc_connection_set_target_uid()
{
  return MEMORY[0x1E0C860D0]();
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1E0C86108](object);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x1E0C86120]();
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1E0C86178](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1E0C86198](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1E0C861A8](xdata);
}

int64_t xpc_date_get_value(xpc_object_t xdate)
{
  return MEMORY[0x1E0C861D0](xdate);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C861F0](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

uint64_t xpc_dictionary_expects_reply()
{
  return MEMORY[0x1E0C86238]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1E0C86270](xdict);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C86278](xdict, key, length);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  double result;

  MEMORY[0x1E0C86298](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x1E0C862D8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
  MEMORY[0x1E0C863B0](xdict, key, uuid);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  double result;

  MEMORY[0x1E0C863E0](xdouble);
  return result;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1E0C86570](xint);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C86660](object);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1E0C867B8](xuint);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x1E0C867F8](xuuid);
}

