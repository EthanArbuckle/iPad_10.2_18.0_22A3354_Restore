@implementation IDSStunRelayInterfaceInfoController

+ (id)sharedInstance
{
  if (qword_1ECDD47C8 != -1)
    dispatch_once(&qword_1ECDD47C8, &unk_1E3C1B890);
  return (id)qword_1ECDD4818;
}

- (id)createRelayInterfaceInfoFromCandidatePairs:(id)a3 token:(id)a4
{
  id v5;
  const char *v6;
  double v7;
  unint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _WORD *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  double v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  double v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  double v36;
  int v37;
  int v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  double v42;
  int v43;
  const char *v44;
  uint64_t v45;
  double v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  double v50;
  unsigned int v51;
  const char *v52;
  uint64_t v53;
  double v54;
  const char *v55;
  uint64_t v56;
  double v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  double v61;
  unsigned int v62;
  const char *v63;
  uint64_t v64;
  double v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  double v69;
  const char *v70;
  uint64_t v71;
  double v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  double v76;
  unsigned int v77;
  const char *v78;
  uint64_t v79;
  double v80;
  NSObject *v81;
  const char *v82;
  uint64_t v83;
  double v84;
  const char *v85;
  uint64_t v86;
  double v87;
  const char *v88;
  uint64_t v89;
  double v90;
  const char *v91;
  uint64_t v92;
  double v93;
  int v94;
  const char *v95;
  uint64_t v96;
  double v97;
  const char *v98;
  uint64_t v99;
  double v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  double v104;
  int v105;
  const char *v106;
  uint64_t v107;
  double v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  double v112;
  uint64_t v113;
  int v114;
  const char *v115;
  uint64_t v116;
  double v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  double v121;
  int v122;
  NSObject *v123;
  const char *v124;
  double v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  double v129;
  NSObject *v130;
  id v132;
  int v133;
  uint64_t v134;
  void *v135;
  void *v136;
  int v137;
  id obj;
  unint64_t v139;
  uint64_t v140;
  uint64_t v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  uint8_t buf[4];
  _BYTE v147[14];
  __int16 v148;
  int v149;
  __int16 v150;
  int v151;
  __int16 v152;
  int v153;
  __int16 v154;
  int v155;
  __int16 v156;
  int v157;
  _BYTE v158[128];
  _WORD __b[512];
  uint64_t v160;

  v160 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v132 = a4;
  memset(__b, 170, sizeof(__b));
  v142 = 0u;
  v143 = 0u;
  v144 = 0u;
  v145 = 0u;
  obj = v5;
  v8 = 0x1E3C19000uLL;
  v139 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v142, v7, v158, 16);
  if (v139)
  {
    v11 = 0;
    v12 = *(_QWORD *)v143;
    v13 = &__b[7];
    v14 = 1;
    v15 = 1022;
    v16 = 67110656;
    v17 = *(_QWORD *)v143;
    while (1)
    {
      if (v17 != v12)
        objc_enumerationMutation(obj);
      v141 = v11;
      v18 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * v11);
      objc_msgSend_local(v18, v9, v10, *(double *)&v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend_type(v19, v20, v21, v22);

      objc_msgSend_local(v18, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v27;
      v32 = v23 ? objc_msgSend_external(v27, v28, v29, v30) : objc_msgSend_address(v27, v28, v29, v30);
      v33 = v32;

      if (v15 <= 11)
        break;
      v140 = v15;
      v37 = *(unsigned __int8 *)(v33 + 1);
      v38 = ((v37 != 2) << 15) | ((_DWORD)v23 << 11);
      objc_msgSend_local(v18, v34, v35, v36);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v38 & 0xFFFFF87F | ((objc_msgSend_transport(v39, v40, v41, v42) & 0xF) << 7);

      objc_msgSend_local(v18, v44, v45, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v43 & 0xFFFFFF87 | (8 * (objc_msgSend_radioAccessTechnology(v47, v48, v49, v50) & 0xF));

      *(v13 - 6) = bswap32(v51) >> 16;
      *(v13 - 5) = __rev16(objc_msgSend_relayLinkID(v18, v52, v53, v54));
      objc_msgSend_local(v18, v55, v56, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = bswap32(objc_msgSend_mtu(v58, v59, v60, v61)) >> 16;

      *(v13 - 4) = v62;
      objc_msgSend_local(v18, v63, v64, v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      LOWORD(v62) = __rev16(objc_msgSend_linkFlags(v66, v67, v68, v69));

      *(v13 - 3) = v62;
      objc_msgSend_sharedInstance(IDSCellularLinkMonitor, v70, v71, v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend_dataSoMaskBits(v73, v74, v75, v76);

      *((_DWORD *)v13 - 1) = bswap32(v77);
      objc_msgSend_Stun(*(void **)(v8 + 2856), v78, v79, v80);
      v81 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_local(v18, v82, v83, v84);
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        v134 = objc_msgSend_transport(v136, v85, v86, v87);
        objc_msgSend_local(v18, v88, v89, v90);
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = objc_msgSend_radioAccessTechnology(v135, v91, v92, v93);
        v133 = objc_msgSend_relayLinkID(v18, v95, v96, v97);
        objc_msgSend_local(v18, v98, v99, v100);
        v137 = v14;
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v105 = objc_msgSend_mtu(v101, v102, v103, v104);
        objc_msgSend_local(v18, v106, v107, v108);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        v113 = v12;
        v114 = objc_msgSend_linkFlags(v109, v110, v111, v112);
        objc_msgSend_sharedInstance(IDSCellularLinkMonitor, v115, v116, v117);
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        v122 = objc_msgSend_dataSoMaskBits(v118, v119, v120, v121);
        *(_DWORD *)buf = 67110656;
        *(_DWORD *)v147 = v37;
        *(_WORD *)&v147[4] = 2048;
        *(_QWORD *)&v147[6] = v134;
        v148 = 1024;
        v149 = v94;
        v8 = 0x1E3C19000;
        v150 = 1024;
        v151 = v133;
        v152 = 1024;
        v153 = v105;
        v154 = 1024;
        v155 = v114;
        v12 = v113;
        v156 = 1024;
        v157 = v122;
        _os_log_impl(&dword_19B949000, v81, OS_LOG_TYPE_DEFAULT, "createRelayInterfaceInfoFromCandidatePairs: family: %d, transport: %ld, RAT: %u, relay LinkID: %04x, MTU: %u, linkFlags: 0x%x, dataSoMasks: 0x%x", buf, 0x30u);

        v14 = v137;
      }

      v11 = v141 + 1;
      if (v141 + 1 >= v139)
      {
        v139 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v142, *(double *)&v16, v158, 16);
        if (!v139)
          goto LABEL_20;
        v11 = 0;
      }
      v17 = *(_QWORD *)v143;
      v13 += 6;
      ++v14;
      v15 = v140 - 12;
    }
    objc_msgSend_Stun(*(void **)(v8 + 2856), v34, v35, v36);
    v123 = objc_claimAutoreleasedReturnValue();
    v13 -= 6;
    if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v147 = 2;
      _os_log_impl(&dword_19B949000, v123, OS_LOG_TYPE_DEFAULT, "createRelayInterfaceInfoFromCandidatePairs: candidatePtrEnd - candidatePtr = %d < 12, break", buf, 8u);
    }

    v14 = 85;
  }
  else
  {
    v14 = 0;
    v13 = &__b[1];
  }
LABEL_20:

  __b[0] = bswap32(v14 | 0x2000) >> 16;
  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v124, (uint64_t)__b, v125, (int)((_DWORD)v13 - __b));
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_Stun(*(void **)(v8 + 2856), v127, v128, v129);
  v130 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)v147 = v132;
    *(_WORD *)&v147[8] = 1024;
    *(_DWORD *)&v147[10] = 1;
    v148 = 1024;
    v149 = v14;
    v150 = 1024;
    v151 = (char *)v13 - (char *)__b;
    _os_log_impl(&dword_19B949000, v130, OS_LOG_TYPE_DEFAULT, "new interfaceInformation for %@ (V:%1d #CAN:%d LEN:%dB).", buf, 0x1Eu);
  }

  return v126;
}

- (id)candidatePairsFromRelayInterfaceInfo:(char *)a3 bufferLength:(int)a4 token:(id)a5 sessionID:(id)a6 error:(int *)a7
{
  id v11;
  const char *v12;
  uint64_t v13;
  id v14;
  double v15;
  NSObject *v16;
  __CFArray *v17;
  int v18;
  unsigned int v19;
  int v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  unsigned int v26;
  unsigned __int16 *v27;
  unsigned int v28;
  unsigned int v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  const __CFString *v37;
  uint64_t v38;
  const char *v39;
  double v40;
  const char *v41;
  double v42;
  const char *v43;
  double v44;
  const char *v45;
  double v46;
  void *v47;
  const char *v48;
  double v49;
  void *v50;
  const char *v51;
  double v52;
  NSObject *v53;
  const char *v54;
  int v55;
  __CFArray *v56;
  NSObject *v57;
  int v59;
  int v60;
  int *v61;
  id v62;
  id v63;
  __CFArray *theArray;
  unsigned int v65;
  unsigned int v66;
  uint8_t buf[4];
  _BYTE v68[10];
  _BYTE v69[10];
  unsigned int v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  int v74;
  __int16 v75;
  int v76;
  __int16 v77;
  unsigned int v78;
  __int16 v79;
  int v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v14 = a6;
  *a7 = 0;
  if (a4 > 1)
  {
    v18 = (_DWORD)a3 + 2;
    v19 = bswap32(*(unsigned __int16 *)a3);
    v20 = HIWORD(v19) & 0x1F;
    objc_msgSend_Stun(IDSFoundationLog, v12, v13, v15);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v68 = v19 >> 29;
      *(_WORD *)&v68[4] = 1024;
      *(_DWORD *)&v68[6] = HIWORD(v19) & 0x1F;
      *(_WORD *)v69 = 2112;
      *(_QWORD *)&v69[2] = v11;
      _os_log_impl(&dword_19B949000, v21, OS_LOG_TYPE_DEFAULT, "receive interfaceInfo (ver:%u numCandidate:%d) for %@", buf, 0x18u);
    }

    theArray = (__CFArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v20)
    {
      v61 = a7;
      v62 = v11;
      v60 = a4;
      v25 = a3;
      v26 = a4 - 2;
      v59 = (int)v25;
      v27 = (unsigned __int16 *)(v25 + 6);
      v24 = 138414082;
      v63 = v14;
      while (1)
      {
        if (v26 <= 1)
        {
          objc_msgSend_Stun(IDSFoundationLog, v22, v23, *(double *)&v24);
          v53 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            goto LABEL_29;
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v68 = v26;
          v54 = "candidatePairsFromInterfaceInfo: remainingInterfaceInfoLength = %d < 2, break";
          goto LABEL_28;
        }
        if (v26 <= 0xB)
          break;
        v28 = bswap32(*(v27 - 2));
        v29 = HIWORD(v28);
        v30 = (v28 >> 23) & 0xF;
        if (v30 < 5)
        {
          v32 = (v28 >> 27) & 0xF;
          v33 = bswap32(*(v27 - 1)) >> 16;
          v34 = bswap32(*v27) >> 16;
          v65 = (v28 >> 19) & 0xF;
          v66 = bswap32(v27[1]) >> 16;
          v35 = bswap32(*((_DWORD *)v27 + 1));
          objc_msgSend_Stun(IDSFoundationLog, v22, v23, *(double *)&v24);
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138414082;
            v37 = CFSTR("YES");
            if ((v29 & 0x8000u) == 0)
              v37 = CFSTR("NO");
            *(_QWORD *)v68 = v37;
            *(_WORD *)&v68[8] = 2048;
            *(_QWORD *)v69 = v32;
            *(_WORD *)&v69[8] = 1024;
            v70 = v65;
            v71 = 2048;
            v72 = v30;
            v73 = 1024;
            v74 = v33;
            v75 = 1024;
            v76 = v34;
            v77 = 1024;
            v78 = v66;
            v79 = 1024;
            v80 = v35;
            _os_log_impl(&dword_19B949000, v36, OS_LOG_TYPE_DEFAULT, "candidatePairsFromRelayInterfaceInfo: isIPv6: %@, type: %lu, RAT: %u, transport: %ld, relayLinkID: %04x, MTU: %u, linkFlags: 0x%x, dataSoMasks: 0x%x", buf, 0x3Eu);
          }
          v38 = v33;

          objc_msgSend_candidateWithType_transport_radioAccessTechnology_mtu_index_address_external_(IDSStunCandidate, v39, v32, v40, v30, v65, v34, 0xFFFFFFFFLL, 0, 0);
          v31 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_setDataSoMask_(v31, v41, v35, v42);
          objc_msgSend_setLinkFlags_(v31, v43, v66, v44);
          objc_msgSend_candidateWithType_transport_radioAccessTechnology_mtu_index_address_external_(IDSStunCandidate, v45, 3, v46, 0, 10, 1280, 0xFFFFFFFFLL, 0, 0);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v63;
          objc_msgSend_candidatePairWithLocalCandidate_remoteCandidate_sessionID_delegate_(IDSStunCandidatePair, v48, (uint64_t)v47, v49, v31, v63, 0);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setRelayLinkID_(v50, v51, v38, v52);
          if (theArray && v50)
            CFArrayAppendValue(theArray, v50);

        }
        else
        {
          objc_msgSend_Stun(IDSFoundationLog, v22, v23, *(double *)&v24);
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)v68 = v30;
            _os_log_impl(&dword_19B949000, v31, OS_LOG_TYPE_DEFAULT, "candidatePairsFromRelayInterfaceInfo: transport is invalid: %lu.", buf, 0xCu);
          }
        }

        v27 += 6;
        v26 -= 12;
        if (!--v20)
        {
          v18 = (_DWORD)v27 - 4;
          a7 = v61;
          v11 = v62;
          a4 = v60;
          LODWORD(a3) = v59;
          goto LABEL_30;
        }
      }
      objc_msgSend_Stun(IDSFoundationLog, v22, v23, *(double *)&v24);
      v53 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        goto LABEL_29;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v68 = v26;
      v54 = "candidatePairsFromRelayInterfaceInfo: remainingInterfaceInfoLength = %d < 12, return";
LABEL_28:
      _os_log_impl(&dword_19B949000, v53, OS_LOG_TYPE_DEFAULT, v54, buf, 8u);
LABEL_29:
      a7 = v61;
      v11 = v62;
      a4 = v60;
      LODWORD(a3) = v59;

      v18 = (_DWORD)v27 - 4;
    }
LABEL_30:
    v55 = v18 - (_DWORD)a3;
    if (v55 == a4)
    {
      v56 = theArray;
      v17 = theArray;
    }
    else
    {
      objc_msgSend_Stun(IDSFoundationLog, v22, v23, *(double *)&v24);
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v68 = v55;
        *(_WORD *)&v68[4] = 1024;
        *(_DWORD *)&v68[6] = a4;
        _os_log_impl(&dword_19B949000, v57, OS_LOG_TYPE_DEFAULT, "invalid interfaceInfo data length: %d, not equal to InterfaceInfoLength: %d.", buf, 0xEu);
      }

      v17 = 0;
      *a7 = 1;
      v56 = theArray;
    }

  }
  else
  {
    objc_msgSend_Stun(IDSFoundationLog, v12, v13, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v68 = a4;
      _os_log_impl(&dword_19B949000, v16, OS_LOG_TYPE_DEFAULT, "candidatePairsFromInterfaceInfo: remainingInterfaceInfoLength = %d < 2, return nil", buf, 8u);
    }

    v17 = 0;
    *a7 = 1;
  }

  return v17;
}

- (unint64_t)relayInterfaceInfoDeliveryStatus:(id)a3
{
  double v3;
  void *Value;
  NSMutableDictionary *tokenToRelayInterfaceInfoDeliveryStatus;

  Value = 0;
  if (a3)
  {
    tokenToRelayInterfaceInfoDeliveryStatus = self->_tokenToRelayInterfaceInfoDeliveryStatus;
    if (tokenToRelayInterfaceInfoDeliveryStatus)
      Value = (void *)CFDictionaryGetValue((CFDictionaryRef)tokenToRelayInterfaceInfoDeliveryStatus, a3);
  }
  return objc_msgSend_unsignedIntegerValue(Value, a2, (uint64_t)a3, v3);
}

- (void)setRelayInterfaceInfoDeliveryStatus:(id)a3 status:(unint64_t)a4
{
  const char *v6;
  uint64_t v7;
  id v8;
  double v9;
  const __CFDictionary *tokenToRelayInterfaceInfoDeliveryStatus;
  uint64_t v11;
  const char *v12;
  double v13;
  uint64_t v14;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  const char *v22;
  uint64_t v23;
  double v24;
  int v25;
  id v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!v8)
  {
    objc_msgSend_Stun(IDSFoundationLog, v6, v7, v9);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
LABEL_16:

      goto LABEL_17;
    }
    LOWORD(v25) = 0;
    v19 = "setRelayInterfaceInfoDeliveryStatus failed due to invalid token.";
    v20 = v18;
    v21 = 2;
LABEL_15:
    _os_log_impl(&dword_19B949000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v25, v21);
    goto LABEL_16;
  }
  tokenToRelayInterfaceInfoDeliveryStatus = (const __CFDictionary *)self->_tokenToRelayInterfaceInfoDeliveryStatus;
  if (tokenToRelayInterfaceInfoDeliveryStatus)
    tokenToRelayInterfaceInfoDeliveryStatus = (const __CFDictionary *)CFDictionaryGetValue(tokenToRelayInterfaceInfoDeliveryStatus, v8);
  v11 = objc_msgSend_unsignedIntegerValue(tokenToRelayInterfaceInfoDeliveryStatus, v6, v7, v9);
  if (v11 != a4)
  {
    v14 = v11;
    if (!self->_tokenToRelayInterfaceInfoDeliveryStatus)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v16 = self->_tokenToRelayInterfaceInfoDeliveryStatus;
      self->_tokenToRelayInterfaceInfoDeliveryStatus = Mutable;

    }
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v12, a4, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)self->_tokenToRelayInterfaceInfoDeliveryStatus, v8, v17);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      sub_19BAF81B0((uint64_t)v8);
    }

    objc_msgSend_Stun(IDSFoundationLog, v22, v23, v24);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    v25 = 138412802;
    v26 = v8;
    v27 = 2048;
    v28 = v14;
    v29 = 2048;
    v30 = a4;
    v19 = "setRelayInterfaceInfoDeliveryStatus for %@ (%lu->%lu).";
    v20 = v18;
    v21 = 32;
    goto LABEL_15;
  }
LABEL_17:

}

- (void)removeCache:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  double v7;
  NSMutableDictionary *tokenToRelayInterfaceInfoDeliveryStatus;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    tokenToRelayInterfaceInfoDeliveryStatus = self->_tokenToRelayInterfaceInfoDeliveryStatus;
    if (tokenToRelayInterfaceInfoDeliveryStatus)
      CFDictionaryRemoveValue((CFMutableDictionaryRef)tokenToRelayInterfaceInfoDeliveryStatus, v6);
    objc_msgSend_Stun(IDSFoundationLog, v4, v5, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v6;
      v10 = "removed relay interface information for %@.";
      v11 = v9;
      v12 = 12;
LABEL_8:
      _os_log_impl(&dword_19B949000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, v12);
    }
  }
  else
  {
    objc_msgSend_Stun(IDSFoundationLog, v4, v5, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      v10 = "remove relay interface information failed due to invalid token.";
      v11 = v9;
      v12 = 2;
      goto LABEL_8;
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenToRelayInterfaceInfoDeliveryStatus, 0);
}

@end
