@implementation MPAssistantSubscriptionStatusSyncHandler

- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 forKey:(id)a5 beginInfo:(id)a6
{
  NSObject *v10;
  dispatch_semaphore_t v11;
  NSObject *v12;
  dispatch_time_t v13;
  NSString *v14;
  NSString *postAnchor;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  _BYTE *v38;
  unint64_t v39;
  int v40;
  int v41;
  _BYTE *v42;
  int v43;
  void *v44;
  void *v45;
  _BOOL4 v47;
  int v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  _BYTE *v54;
  unint64_t v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  unint64_t v61;
  __int16 v62;
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
  unint64_t v93;
  int v94;
  void *v95;
  void *v96;
  uint64_t v97;
  int v98;
  unint64_t v99;
  uint64_t *v100;
  unint64_t v101;
  uint64_t v102;
  unsigned int v103;
  unsigned int v104;
  unint64_t v105;
  unsigned int v106;
  unsigned __int8 *v107;
  unint64_t v108;
  int v109;
  unint64_t v110;
  int v111;
  unint64_t v112;
  unsigned int v113;
  unsigned int v114;
  unsigned int v115;
  unsigned int v116;
  uint64_t v117;
  const UInt8 *v118;
  ldiv_t v119;
  uint64_t v120;
  CFStringRef v121;
  char *v122;
  char *v123;
  uint64_t v124;
  unsigned __int8 *v125;
  unsigned int v126;
  char *v127;
  id v128;
  uint64_t v129;
  char *v130;
  uint64_t v131;
  _BYTE *v132;
  unint64_t v133;
  char *v134;
  uint64_t v135;
  unsigned __int8 *v136;
  unsigned int v137;
  char *v138;
  uint64_t v139;
  char *v140;
  uint64_t quot;
  lldiv_t v142;
  uint64_t v143;
  const UInt8 *v144;
  char *v145;
  uint64_t v146;
  unsigned __int8 *v147;
  unsigned int v148;
  char *v149;
  char *v150;
  uint64_t v151;
  _BYTE *v152;
  unint64_t v153;
  char *v154;
  uint64_t v155;
  unsigned __int8 *v156;
  unsigned int v157;
  char *v158;
  __CFString *v159;
  NSString *v160;
  NSObject *v161;
  NSObject *v162;
  NSString *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  NSObject *v169;
  id v170;
  id v171;
  id v172;
  id v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  _QWORD v178[5];
  NSObject *v179;
  uint64_t *v180;
  uint64_t v181;
  uint64_t *v182;
  uint64_t v183;
  uint64_t (*v184)(uint64_t, uint64_t);
  void (*v185)(uint64_t);
  id v186;
  _BYTE v187[128];
  void *v188;
  _BYTE buf[40];
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  _BYTE v201[72];
  _OWORD v202[4];
  uint64_t v203;
  _QWORD v204[3];
  _QWORD v205[3];

  v205[0] = *MEMORY[0x1E0C80C00];
  v173 = a3;
  v172 = a4;
  v170 = a5;
  v171 = a6;
  _MPLogCategoryAssistant();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    *(_QWORD *)&buf[4] = v173;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v172;
    _os_log_impl(&dword_1CC97B000, v10, OS_LOG_TYPE_DEFAULT, "Subscription Status Sync Handler (begin): anchor: %{private}@, validity: %{public}@", buf, 0x16u);
  }

  v11 = dispatch_semaphore_create(0);
  v181 = 0;
  v182 = &v181;
  v183 = 0x3032000000;
  v184 = sub_1CC98870C;
  v185 = sub_1CC98871C;
  v186 = 0;
  v178[0] = MEMORY[0x1E0C809B0];
  v178[1] = 3221225472;
  v178[2] = sub_1CC988724;
  v178[3] = &unk_1E88E2AA8;
  v178[4] = self;
  v180 = &v181;
  v12 = v11;
  v179 = v12;
  sub_1CC988724((uint64_t)v178, 0);
  v13 = dispatch_time(0, 10000000000);
  v169 = v12;
  if (dispatch_semaphore_wait(v12, v13))
  {
    v14 = (NSString *)v173;
    postAnchor = self->_postAnchor;
    self->_postAnchor = v14;
    goto LABEL_164;
  }
  objc_msgSend((id)v182[5], "allKeys");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v188 = v166;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v188, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v168, "sortedArrayUsingDescriptors:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "string");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v176 = 0u;
  v177 = 0u;
  v174 = 0u;
  v175 = 0u;
  v19 = v17;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v174, v187, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v175;
    do
    {
      v22 = 0;
      v23 = v18;
      do
      {
        if (*(_QWORD *)v175 != v21)
          objc_enumerationMutation(v19);
        objc_msgSend((id)v182[5], "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v174 + 1) + 8 * v22));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringByAppendingFormat:", CFSTR("%@:"), v24);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        ++v22;
        v23 = v18;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v174, v187, 16);
    }
    while (v20);
  }

  objc_msgSend(v18, "stringByAppendingString:", CFSTR("END"));
  v167 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x1E0CB3940];
  -[SADynamiteClientState defaultUserState](self->_clientState, "defaultUserState");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "status");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isEqualToString:", *MEMORY[0x1E0D886E8]);
  -[SADynamiteClientState expirationDate](self->_clientState, "expirationDate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "date");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "timeIntervalSinceReferenceDate");
  v32 = v31;
  -[SADynamiteClientState defaultUserState](self->_clientState, "defaultUserState");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "userHistoryUnmodifiable");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("FuseEligibility_%d_%f:PL_%@_UserAnchors_%@"), v28, v32, v34, v167);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = v35;
  v200 = 0u;
  v199 = 0u;
  v198 = 0u;
  v197 = 0u;
  v196 = 0u;
  v195 = 0u;
  v194 = 0u;
  v193 = 0u;
  v192 = 0u;
  v191 = 0u;
  v190 = 0u;
  memset(&buf[8], 0, 32);
  *(_QWORD *)buf = 4256;
  CC_SHA256_Init((CC_SHA256_CTX *)&buf[8]);
  v37 = objc_retainAutorelease(v36);
  v38 = (_BYTE *)objc_msgSend(v37, "UTF8String");
  v39 = objc_msgSend(v37, "length");
  v40 = v39;
  if (*(uint64_t *)buf > 3999)
  {
    if (*(uint64_t *)buf > 4255)
    {
      if (*(_QWORD *)buf == 4256)
      {
        CC_SHA256_Update((CC_SHA256_CTX *)&buf[8], v38, v39);
      }
      else if (*(_QWORD *)buf == 4512)
      {
        CC_SHA512_Update((CC_SHA512_CTX *)&buf[8], v38, v39);
      }
    }
    else if (*(_QWORD *)buf == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&buf[8], v38, v39);
    }
    else if (*(_QWORD *)buf == 4001)
    {
      CC_SHA1_Update((CC_SHA1_CTX *)&buf[8], v38, v39);
    }
  }
  else
  {
    if (*(uint64_t *)buf <= 2999)
    {
      if (*(_QWORD *)buf)
      {
        if (*(_QWORD *)buf == 2000)
        {
          v41 = (((v39 + buf[19]) & 3) - buf[19]);
          v42 = &buf[buf[19] + 16];
          switch(v41)
          {
            case 0:
              break;
            case 1:
              *v42 = *v38;
              break;
            case 2:
              v62 = *(_WORD *)v38;
              goto LABEL_63;
            case 3:
              v62 = *(_WORD *)v38;
              buf[buf[19] + 18] = v38[2];
LABEL_63:
              *(_WORD *)v42 = v62;
              break;
            default:
              memcpy(v42, v38, (((v40 + buf[19]) & 3) - buf[19]));
              break;
          }
          *(_DWORD *)&buf[12] += v40;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasherAppendBytes(MSVHasher * _Nonnull, const void * _Nonnull, size_t)");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, CFSTR("MSVHasher+Algorithms.h"), 262, CFSTR("Cannot append to unknown hasher algorithm"));

      }
      goto LABEL_65;
    }
    if (*(_QWORD *)buf == 3000)
    {
      if (!v38)
        goto LABEL_65;
      v47 = v39 > 0xF || (*(_DWORD *)&buf[8] + v39) > 0xF;
      *(_DWORD *)&buf[8] += v39;
      *(_DWORD *)&buf[12] |= v47;
      if (v39 + DWORD2(v190) > 0xF)
      {
        v54 = &v38[v39];
        if (DWORD2(v190))
        {
          memcpy(&buf[DWORD2(v190) + 32], v38, (16 - DWORD2(v190)));
          HIDWORD(v55) = *(_DWORD *)&buf[16] - 2048144777 * *(_DWORD *)&buf[32];
          LODWORD(v55) = HIDWORD(v55);
          v56 = -1640531535 * (v55 >> 19);
          HIDWORD(v55) = *(_DWORD *)&buf[20] - 2048144777 * *(_DWORD *)&buf[36];
          LODWORD(v55) = HIDWORD(v55);
          *(_DWORD *)&buf[16] = v56;
          *(_DWORD *)&buf[20] = -1640531535 * (v55 >> 19);
          HIDWORD(v55) = *(_DWORD *)&buf[24] - 2048144777 * v190;
          LODWORD(v55) = HIDWORD(v55);
          *(_DWORD *)&buf[24] = -1640531535 * (v55 >> 19);
          HIDWORD(v55) = *(_DWORD *)&buf[28] - 2048144777 * DWORD1(v190);
          LODWORD(v55) = HIDWORD(v55);
          v38 += (16 - DWORD2(v190));
          *(_DWORD *)&buf[28] = -1640531535 * (v55 >> 19);
          DWORD2(v190) = 0;
        }
        if (v38 <= v54 - 16)
        {
          v57 = *(_DWORD *)&buf[16];
          v58 = *(_DWORD *)&buf[20];
          v59 = *(_DWORD *)&buf[24];
          v60 = *(_DWORD *)&buf[28];
          do
          {
            HIDWORD(v61) = v57 - 2048144777 * *(_DWORD *)v38;
            LODWORD(v61) = HIDWORD(v61);
            v57 = -1640531535 * (v61 >> 19);
            HIDWORD(v61) = v58 - 2048144777 * *((_DWORD *)v38 + 1);
            LODWORD(v61) = HIDWORD(v61);
            v58 = -1640531535 * (v61 >> 19);
            HIDWORD(v61) = v59 - 2048144777 * *((_DWORD *)v38 + 2);
            LODWORD(v61) = HIDWORD(v61);
            v59 = -1640531535 * (v61 >> 19);
            HIDWORD(v61) = v60 - 2048144777 * *((_DWORD *)v38 + 3);
            LODWORD(v61) = HIDWORD(v61);
            v60 = -1640531535 * (v61 >> 19);
            v38 += 16;
          }
          while (v38 <= v54 - 16);
          *(_DWORD *)&buf[16] = v57;
          *(_DWORD *)&buf[20] = v58;
          *(_DWORD *)&buf[24] = v59;
          *(_DWORD *)&buf[28] = v60;
        }
        if (v38 >= v54)
          goto LABEL_65;
        v48 = (_DWORD)v54 - (_DWORD)v38;
        __memcpy_chk();
      }
      else
      {
        memcpy(&buf[DWORD2(v190) + 32], v38, v39);
        v48 = DWORD2(v190) + v40;
      }
      DWORD2(v190) = v48;
      goto LABEL_65;
    }
    if (*(_QWORD *)buf != 3001 || !v38)
      goto LABEL_65;
    *(_QWORD *)&buf[8] += v39;
    if (v39 + DWORD2(v192) <= 0x1F)
    {
      memcpy((char *)&v190 + DWORD2(v192) + 8, v38, v39);
      v43 = DWORD2(v192) + v40;
LABEL_50:
      DWORD2(v192) = v43;
      goto LABEL_65;
    }
    v49 = (unint64_t)&v38[v39];
    if (DWORD2(v192))
    {
      memcpy((char *)&v190 + DWORD2(v192) + 8, v38, (32 - DWORD2(v192)));
      *(_QWORD *)&buf[16] = 0x9E3779B185EBCA87
                          * __ROR8__(*(_QWORD *)&buf[16] - 0x3D4D51C2D82B14B1 * *((_QWORD *)&v190 + 1), 33);
      *(_QWORD *)&buf[24] = 0x9E3779B185EBCA87 * __ROR8__(*(_QWORD *)&buf[24] - 0x3D4D51C2D82B14B1 * v191, 33);
      *(_QWORD *)&buf[32] = 0x9E3779B185EBCA87
                          * __ROR8__(*(_QWORD *)&buf[32] - 0x3D4D51C2D82B14B1 * *((_QWORD *)&v191 + 1), 33);
      *(_QWORD *)&v190 = 0x9E3779B185EBCA87 * __ROR8__(v190 - 0x3D4D51C2D82B14B1 * v192, 33);
      v38 += (32 - DWORD2(v192));
      DWORD2(v192) = 0;
    }
    if ((unint64_t)(v38 + 32) <= v49)
    {
      v51 = *(_QWORD *)&buf[24];
      v50 = *(_QWORD *)&buf[16];
      v53 = *(_QWORD *)&buf[32];
      v52 = v190;
      do
      {
        v50 = 0x9E3779B185EBCA87 * __ROR8__(v50 - 0x3D4D51C2D82B14B1 * *(_QWORD *)v38, 33);
        v51 = 0x9E3779B185EBCA87 * __ROR8__(v51 - 0x3D4D51C2D82B14B1 * *((_QWORD *)v38 + 1), 33);
        v53 = 0x9E3779B185EBCA87 * __ROR8__(v53 - 0x3D4D51C2D82B14B1 * *((_QWORD *)v38 + 2), 33);
        v52 = 0x9E3779B185EBCA87 * __ROR8__(v52 - 0x3D4D51C2D82B14B1 * *((_QWORD *)v38 + 3), 33);
        v38 += 32;
      }
      while ((unint64_t)v38 <= v49 - 32);
      *(_QWORD *)&buf[16] = v50;
      *(_QWORD *)&buf[24] = v51;
      *(_QWORD *)&buf[32] = v53;
      *(_QWORD *)&v190 = v52;
    }
    if ((unint64_t)v38 < v49)
    {
      v43 = v49 - (_DWORD)v38;
      __memcpy_chk();
      goto LABEL_50;
    }
  }
LABEL_65:

  memset(&v201[8], 0, 64);
  *(_QWORD *)v201 = *(_QWORD *)buf;
  if (*(uint64_t *)buf <= 3000)
  {
    if (*(uint64_t *)buf <= 1999)
    {
      if (!*(_QWORD *)buf)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "handleFailureInFunction:file:lineNumber:description:", v96, CFSTR("MSVHasher+Algorithms.h"), 156, CFSTR("Cannot finalize unknown hasher algorithm"));

        goto LABEL_112;
      }
      if (*(_QWORD *)buf != 1000)
        goto LABEL_112;
      v63 = (*(_QWORD *)&buf[8] + *(_QWORD *)&buf[16]) ^ __ROR8__(*(_QWORD *)&buf[16], 51);
      v64 = *(_QWORD *)&buf[24] + (*(_QWORD *)&buf[32] ^ v190);
      v65 = __ROR8__(*(_QWORD *)&buf[32] ^ v190, 48);
      v66 = (v64 ^ v65) + __ROR8__(*(_QWORD *)&buf[8] + *(_QWORD *)&buf[16], 32);
      v67 = v66 ^ __ROR8__(v64 ^ v65, 43);
      v68 = v64 + v63;
      v69 = v68 ^ __ROR8__(v63, 47);
      v70 = (v66 ^ v190) + v69;
      v71 = v70 ^ __ROR8__(v69, 51);
      v72 = (__ROR8__(v68, 32) ^ 0xFFLL) + v67;
      v73 = __ROR8__(v67, 48);
      v74 = __ROR8__(v70, 32) + (v72 ^ v73);
      v75 = v74 ^ __ROR8__(v72 ^ v73, 43);
      v76 = v71 + v72;
      v77 = v76 ^ __ROR8__(v71, 47);
      v78 = v77 + v74;
      v79 = v78 ^ __ROR8__(v77, 51);
      v80 = __ROR8__(v76, 32) + v75;
      v81 = __ROR8__(v75, 48);
      v82 = __ROR8__(v78, 32) + (v80 ^ v81);
      v83 = v82 ^ __ROR8__(v80 ^ v81, 43);
      v84 = v79 + v80;
      v85 = v84 ^ __ROR8__(v79, 47);
      v86 = v85 + v82;
      v87 = v86 ^ __ROR8__(v85, 51);
      v88 = __ROR8__(v84, 32) + v83;
      v89 = __ROR8__(v83, 48);
      v90 = __ROR8__(v86, 32) + (v88 ^ v89);
      v91 = v90 ^ __ROR8__(v88 ^ v89, 43);
      v92 = v87 + v88;
      *(_QWORD *)&buf[8] = v90;
      *(_QWORD *)&buf[16] = v92 ^ __ROR8__(v87, 47);
      *(_QWORD *)&buf[24] = __ROR8__(v92, 32);
      *(_QWORD *)&buf[32] = v91;
      v93 = *(_QWORD *)&buf[16] ^ v90 ^ *(_QWORD *)&buf[24] ^ v91;
      goto LABEL_99;
    }
    if (*(_QWORD *)buf != 2000)
    {
      if (*(_QWORD *)buf != 3000)
        goto LABEL_112;
      if (*(_DWORD *)&buf[12])
        v94 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)&buf[16], (uint32x4_t)xmmword_1CC9AEAA0), (int8x16_t)vshlq_u32(*(uint32x4_t *)&buf[16], (uint32x4_t)xmmword_1CC9AEA90)));
      else
        v94 = *(_DWORD *)&buf[24] + 374761393;
      v106 = *(_DWORD *)&buf[8] + v94;
      v107 = &buf[32];
      v108 = BYTE8(v190) & 0xF;
      if (v108 >= 4)
      {
        do
        {
          v109 = *(_DWORD *)v107;
          v107 += 4;
          HIDWORD(v110) = v106 - 1028477379 * v109;
          LODWORD(v110) = HIDWORD(v110);
          v106 = 668265263 * (v110 >> 15);
          v108 -= 4;
        }
        while (v108 > 3);
      }
      for (; v108; --v108)
      {
        v111 = *v107++;
        HIDWORD(v112) = v106 + 374761393 * v111;
        LODWORD(v112) = HIDWORD(v112);
        v106 = -1640531535 * (v112 >> 21);
      }
      v113 = (-2048144777 * (v106 ^ (v106 >> 15))) ^ ((-2048144777 * (v106 ^ (v106 >> 15))) >> 13);
      v114 = (-1028477379 * v113) ^ ((-1028477379 * v113) >> 16);
      goto LABEL_111;
    }
    switch(buf[19])
    {
      case 1:
        v98 = buf[16];
        break;
      case 2:
        v98 = *(unsigned __int16 *)&buf[16];
        break;
      case 3:
        v98 = *(unsigned __int16 *)&buf[16] | (buf[18] << 16);
        break;
      default:
        v115 = *(_DWORD *)&buf[8];
        goto LABEL_110;
    }
    v115 = (461845907 * ((380141568 * v98) | ((-862048943 * v98) >> 17))) ^ *(_DWORD *)&buf[8];
LABEL_110:
    v116 = -2048144789 * (v115 ^ *(_DWORD *)&buf[12] ^ ((v115 ^ *(_DWORD *)&buf[12]) >> 16));
    v114 = (-1028477387 * (v116 ^ (v116 >> 13))) ^ ((-1028477387 * (v116 ^ (v116 >> 13))) >> 16);
    *(_DWORD *)&buf[8] = v114;
LABEL_111:
    *(_DWORD *)&v201[8] = v114;
    goto LABEL_112;
  }
  if (*(uint64_t *)buf > 4000)
  {
    switch(*(_QWORD *)buf)
    {
      case 0xFA1:
        CC_SHA1_Final(&v201[8], (CC_SHA1_CTX *)&buf[8]);
        break;
      case 0x10A0:
        CC_SHA256_Final(&v201[8], (CC_SHA256_CTX *)&buf[8]);
        break;
      case 0x11A0:
        CC_SHA512_Final(&v201[8], (CC_SHA512_CTX *)&buf[8]);
        break;
    }
    goto LABEL_112;
  }
  if (*(_QWORD *)buf == 3001)
  {
    if (*(_QWORD *)&buf[8] < 0x20uLL)
      v97 = *(_QWORD *)&buf[32] + 0x27D4EB2F165667C5;
    else
      v97 = 0x85EBCA77C2B2AE63
          - 0x61C8864E7A143579
          * ((0x85EBCA77C2B2AE63
            - 0x61C8864E7A143579
            * ((0x85EBCA77C2B2AE63
              - 0x61C8864E7A143579
              * ((0x85EBCA77C2B2AE63
                - 0x61C8864E7A143579
                * ((__ROR8__(*(_QWORD *)&buf[24], 57)
                  + __ROR8__(*(_QWORD *)&buf[16], 63)
                  + __ROR8__(*(_QWORD *)&buf[32], 52)
                  + __ROR8__(v190, 46)) ^ (0x9E3779B185EBCA87
                                         * __ROR8__(0xC2B2AE3D27D4EB4FLL * *(_QWORD *)&buf[16], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * *(_QWORD *)&buf[24], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * *(_QWORD *)&buf[32], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v190, 33)));
    v99 = v97 + *(_QWORD *)&buf[8];
    v100 = (uint64_t *)&v190 + 1;
    v101 = buf[8] & 0x1F;
    if (v101 >= 8)
    {
      do
      {
        v102 = *v100++;
        v99 = 0x85EBCA77C2B2AE63
            - 0x61C8864E7A143579
            * __ROR8__((0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v102, 33)) ^ v99, 37);
        v101 -= 8;
      }
      while (v101 > 7);
    }
    if (v101 >= 4)
    {
      v103 = *(_DWORD *)v100;
      v100 = (uint64_t *)((char *)v100 + 4);
      v99 = 0x165667B19E3779F9 - 0x3D4D51C2D82B14B1 * __ROR8__((0x9E3779B185EBCA87 * v103) ^ v99, 41);
      v101 -= 4;
    }
    for (; v101; --v101)
    {
      v104 = *(unsigned __int8 *)v100;
      v100 = (uint64_t *)((char *)v100 + 1);
      v99 = 0x9E3779B185EBCA87 * __ROR8__((0x27D4EB2F165667C5 * v104) ^ v99, 53);
    }
    v105 = 0x165667B19E3779F9
         * ((0xC2B2AE3D27D4EB4FLL * (v99 ^ (v99 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v99 ^ (v99 >> 33))) >> 29));
    v93 = v105 ^ HIDWORD(v105);
LABEL_99:
    *(_QWORD *)&v201[8] = v93;
    goto LABEL_112;
  }
  if (*(_QWORD *)buf == 4000)
    CC_MD5_Final(&v201[8], (CC_MD5_CTX *)&buf[8]);
LABEL_112:
  v202[0] = *(_OWORD *)v201;
  v202[1] = *(_OWORD *)&v201[16];
  v202[2] = *(_OWORD *)&v201[32];
  v202[3] = *(_OWORD *)&v201[48];
  v203 = *(_QWORD *)&v201[64];
  if (*(uint64_t *)v201 > 3999)
  {
    if (*(uint64_t *)v201 > 4255)
    {
      if (*(_QWORD *)v201 == 4256)
      {
        v154 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v123 = v154;
        v155 = 0;
        v156 = (unsigned __int8 *)v202 + 8;
        do
        {
          v157 = *v156++;
          v158 = &v154[v155];
          *v158 = a0123456789abcd[(unint64_t)v157 >> 4];
          v158[1] = a0123456789abcd[v157 & 0xF];
          v155 += 2;
        }
        while (v155 != 64);
        v128 = objc_alloc(MEMORY[0x1E0CB3940]);
        v129 = 64;
      }
      else
      {
        if (*(_QWORD *)v201 != 4512)
          goto LABEL_165;
        v134 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v123 = v134;
        v135 = 0;
        v136 = (unsigned __int8 *)v202 + 8;
        do
        {
          v137 = *v136++;
          v138 = &v134[v135];
          *v138 = a0123456789abcd[(unint64_t)v137 >> 4];
          v138[1] = a0123456789abcd[v137 & 0xF];
          v135 += 2;
        }
        while (v135 != 128);
        v128 = objc_alloc(MEMORY[0x1E0CB3940]);
        v129 = 128;
      }
    }
    else if (*(_QWORD *)v201 == 4000)
    {
      v145 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v123 = v145;
      v146 = 0;
      v147 = (unsigned __int8 *)v202 + 8;
      do
      {
        v148 = *v147++;
        v149 = &v145[v146];
        *v149 = a0123456789abcd[(unint64_t)v148 >> 4];
        v149[1] = a0123456789abcd[v148 & 0xF];
        v146 += 2;
      }
      while (v146 != 32);
      v128 = objc_alloc(MEMORY[0x1E0CB3940]);
      v129 = 32;
    }
    else
    {
      if (*(_QWORD *)v201 != 4001)
        goto LABEL_165;
      v122 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      v123 = v122;
      v124 = 0;
      v125 = (unsigned __int8 *)v202 + 8;
      do
      {
        v126 = *v125++;
        v127 = &v122[v124];
        *v127 = a0123456789abcd[(unint64_t)v126 >> 4];
        v127[1] = a0123456789abcd[v126 & 0xF];
        v124 += 2;
      }
      while (v124 != 40);
      v128 = objc_alloc(MEMORY[0x1E0CB3940]);
      v129 = 40;
    }
    v121 = (CFStringRef)objc_msgSend(v128, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v123, v129, 4, 1);
  }
  else
  {
    if (*(uint64_t *)v201 <= 2999)
    {
      if (*(_QWORD *)v201 == 1000)
      {
        v139 = *((_QWORD *)&v202[0] + 1);
        v140 = (char *)v205 + 1;
        quot = *((_QWORD *)&v202[0] + 1);
        do
        {
          v142 = lldiv(quot, 10);
          quot = v142.quot;
          if (v142.rem >= 0)
            LOBYTE(v143) = v142.rem;
          else
            v143 = -v142.rem;
          *(v140 - 2) = v143 + 48;
          v144 = (const UInt8 *)(v140 - 2);
          --v140;
        }
        while (v142.quot);
        if (v139 < 0)
        {
          *(v140 - 2) = 45;
          v144 = (const UInt8 *)(v140 - 2);
        }
        v121 = CFStringCreateWithBytes(0, v144, (char *)v205 - (char *)v144, 0x8000100u, 0);
        goto LABEL_156;
      }
      if (*(_QWORD *)v201 == 2000)
      {
        v117 = DWORD2(v202[0]);
        v118 = (const UInt8 *)v205;
        do
        {
          v119 = ldiv(v117, 10);
          v117 = v119.quot;
          if (v119.rem >= 0)
            LOBYTE(v120) = v119.rem;
          else
            v120 = -v119.rem;
          *--v118 = v120 + 48;
        }
        while (v119.quot);
        v121 = CFStringCreateWithBytes(0, v118, (char *)v205 - (char *)v118, 0x8000100u, 0);
        goto LABEL_156;
      }
LABEL_165:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull _MSVHashGetDigest(MSVHash)");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v164, "handleFailureInFunction:file:lineNumber:description:", v165, CFSTR("MSVHasher+Algorithms.h"), 356, CFSTR("Cannot obtain digest from unknown hasher algorithm"));

      v159 = &stru_1E88E41D0;
      goto LABEL_157;
    }
    if (*(_QWORD *)v201 == 3000)
    {
      LODWORD(v204[0]) = bswap32(DWORD2(v202[0]));
      v150 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
      v151 = 0;
      v152 = v150 + 1;
      do
      {
        v153 = *((unsigned __int8 *)v204 + v151);
        *(v152 - 1) = a0123456789abcd[v153 >> 4];
        *v152 = a0123456789abcd[v153 & 0xF];
        v152 += 2;
        ++v151;
      }
      while (v151 != 4);
      v121 = (CFStringRef)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v150, 8, 4, 1);
    }
    else
    {
      if (*(_QWORD *)v201 != 3001)
        goto LABEL_165;
      v204[0] = bswap64(*((unint64_t *)&v202[0] + 1));
      v130 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
      v131 = 0;
      v132 = v130 + 1;
      do
      {
        v133 = *((unsigned __int8 *)v204 + v131);
        *(v132 - 1) = a0123456789abcd[v133 >> 4];
        *v132 = a0123456789abcd[v133 & 0xF];
        v132 += 2;
        ++v131;
      }
      while (v131 != 8);
      v121 = (CFStringRef)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v130, 16, 4, 1);
    }
  }
LABEL_156:
  v159 = (__CFString *)v121;
LABEL_157:

  v160 = self->_postAnchor;
  self->_postAnchor = &v159->isa;

  if (!-[NSString isEqualToString:](self->_postAnchor, "isEqualToString:", v173))
  {
    _MPLogCategoryAssistant();
    v161 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v161, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CC97B000, v161, OS_LOG_TYPE_DEFAULT, "Subscription Status Sync Handler (anchor): anchor changed, sync expected", buf, 2u);
    }

  }
  _MPLogCategoryAssistant();
  v162 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v162, OS_LOG_TYPE_DEFAULT))
  {
    v163 = self->_postAnchor;
    *(_DWORD *)buf = 138477827;
    *(_QWORD *)&buf[4] = v163;
    _os_log_impl(&dword_1CC97B000, v162, OS_LOG_TYPE_DEFAULT, "Subscription Status Sync Handler (anchor): %{private}@", buf, 0xCu);
  }

  v12 = v179;
  postAnchor = (NSString *)v168;
LABEL_164:

  _Block_object_dispose(&v181, 8);
}

- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if ((objc_msgSend(a3, "isEqualToString:", self->_postAnchor) & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0D88068], "uniqueObjectIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SADynamiteClientState setIdentifier:](self->_clientState, "setIdentifier:", v9);

    objc_msgSend(v6, "setObject:", self->_clientState);
    _MPLogCategoryAssistant_Oversize();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[SADynamiteClientState dictionary](self->_clientState, "dictionary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138477827;
      v13 = v11;
      _os_log_impl(&dword_1CC97B000, v10, OS_LOG_TYPE_DEFAULT, "Subscription Status Sync Handler (get): %{private}@", (uint8_t *)&v12, 0xCu);

    }
  }
  objc_msgSend(v6, "setPostAnchor:", self->_postAnchor);

}

- (void)syncDidEnd
{
  NSObject *v3;
  NSString *postAnchor;
  SADynamiteClientState *clientState;
  uint8_t v6[16];

  _MPLogCategoryAssistant();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1CC97B000, v3, OS_LOG_TYPE_DEFAULT, "Subscription Status Sync Handler (end): sync ended", v6, 2u);
  }

  postAnchor = self->_postAnchor;
  self->_postAnchor = 0;

  clientState = self->_clientState;
  self->_clientState = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientState, 0);
  objc_storeStrong((id *)&self->_postAnchor, 0);
}

@end
