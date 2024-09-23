@implementation MPToMRNowPlayingInfoDictionary

void ___MPToMRNowPlayingInfoDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  __CFString *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  unint64_t v16;
  id v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t *v21;
  id v22;
  char *v23;
  int64_t v24;
  int v25;
  int v26;
  __int16 v27;
  id *v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  BOOL v32;
  unsigned int v33;
  char *v34;
  __CFString *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
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
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t *v67;
  __int32 v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  int v75;
  __CFArray *v76;
  uint64_t ExternalRepresentation;
  unint64_t v78;
  id v79;
  void *v80;
  unint64_t v81;
  unint64_t v82;
  uint64_t v83;
  unsigned int v84;
  unsigned int v85;
  unint64_t v86;
  unsigned __int32 v87;
  unint64_t v88;
  int v89;
  unint64_t v90;
  int v91;
  unint64_t v92;
  unsigned int v93;
  unsigned int v94;
  unsigned int v95;
  unsigned int v96;
  uint64_t v97;
  const UInt8 *v98;
  ldiv_t v99;
  uint64_t v100;
  CFStringRef v101;
  unsigned __int8 *v102;
  char *v103;
  char *v104;
  uint64_t m;
  unsigned int v106;
  char *v107;
  id v108;
  char *v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  _BYTE *v113;
  unint64_t v114;
  unsigned __int8 *v115;
  char *v116;
  char *v117;
  uint64_t j;
  unsigned int v119;
  char *v120;
  uint64_t v121;
  char *v122;
  uint64_t quot;
  lldiv_t v124;
  uint64_t v125;
  const UInt8 *v126;
  unsigned __int8 *v127;
  char *v128;
  char *v129;
  uint64_t k;
  unsigned int v131;
  char *v132;
  char *v133;
  uint64_t v134;
  _BYTE *v135;
  unint64_t v136;
  unsigned __int8 *v137;
  char *v138;
  char *v139;
  uint64_t i;
  unsigned int v141;
  char *v142;
  void *v143;
  void *v144;
  id v145;
  uint64_t v146;
  __CFString *v147;
  id v148;
  void *v149;
  __int128 v150;
  uint32x4_t v151;
  unint64_t v152;
  unint64_t v153;
  _OWORD v154[2];
  uint64_t v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  _BYTE v164[72];
  _OWORD v165[4];
  uint64_t v166;
  _QWORD v167[3];
  _QWORD v168[3];

  v168[0] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _MPNowPlayingInfoPropertyToMRMediaRemoteNowPlayingInfoPropertyMapping();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isEqualToString:", CFSTR("artwork")))
  {
    v9 = v6;
    objc_msgSend(*(id *)(a1 + 32), "artworkIdentifier");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "artworkData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "artwork");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12 == v9)
    {
LABEL_147:
      if (objc_msgSend(v11, "length"))
      {
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v11, *MEMORY[0x1E0D4C990]);
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", CFSTR("image/jpeg"), *MEMORY[0x1E0D4C9B0]);
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v10, *MEMORY[0x1E0D4C9A8]);
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", &unk_1E31E6630, *MEMORY[0x1E0D4C9A0]);
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", &unk_1E31E6630, *MEMORY[0x1E0D4C998]);
      }

      goto LABEL_150;
    }
    v146 = a1;
    v147 = v10;
    v145 = v5;
    v13 = v8;
    v148 = v6;
    v14 = v9;
    objc_msgSend(v9, "jpegDataWithSize:", 768.0, 768.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = *MEMORY[0x1E0D4CEF8];
    v17 = v15;
    v163 = 0u;
    v162 = 0u;
    v161 = 0u;
    v160 = 0u;
    v159 = 0u;
    v158 = 0u;
    v157 = 0u;
    v156 = 0u;
    v18 = v16 + 0x60EA27EEADC0B5D6;
    v19 = v16 - 0x3D4D51C2D82B14B1;
    v20 = v16 + 0x61C8864E7A143579;
    v150 = xmmword_193F0CAE0;
    v151.i64[0] = v16 + 0x60EA27EEADC0B5D6;
    v151.i64[1] = v16 - 0x3D4D51C2D82B14B1;
    v152 = v16;
    v153 = v16 + 0x61C8864E7A143579;
    v21 = (uint64_t *)v154;
    memset(v154, 0, sizeof(v154));
    v155 = 0;
    v22 = objc_retainAutorelease(v17);
    v23 = (char *)objc_msgSend(v22, "bytes");
    v149 = v22;
    v24 = objc_msgSend(v22, "length");
    if (v23)
    {
      v25 = v24;
      *((_QWORD *)&v150 + 1) = v24;
      if ((unint64_t)v24 <= 0x1F)
      {
        memcpy(v154, v23, v24);
        v26 = v155 + v25;
LABEL_25:
        LODWORD(v155) = v26;
        goto LABEL_26;
      }
      v34 = &v23[v24];
      if (v24 >= 32)
      {
        do
        {
          v18 = 0x9E3779B185EBCA87 * __ROR8__(v18 - 0x3D4D51C2D82B14B1 * *(_QWORD *)v23, 33);
          v19 = 0x9E3779B185EBCA87 * __ROR8__(v19 - 0x3D4D51C2D82B14B1 * *((_QWORD *)v23 + 1), 33);
          v16 = 0x9E3779B185EBCA87 * __ROR8__(v16 - 0x3D4D51C2D82B14B1 * *((_QWORD *)v23 + 2), 33);
          v20 = 0x9E3779B185EBCA87 * __ROR8__(v20 - 0x3D4D51C2D82B14B1 * *((_QWORD *)v23 + 3), 33);
          v23 += 32;
        }
        while (v23 <= v34 - 32);
        v151.i64[0] = v18;
        v151.i64[1] = v19;
        v152 = v16;
        v153 = v20;
      }
      if (v23 < v34)
      {
        v26 = (_DWORD)v34 - (_DWORD)v23;
        __memcpy_chk();
        goto LABEL_25;
      }
    }
LABEL_26:
    v11 = v149;

    memset(&v164[8], 0, 64);
    *(_QWORD *)v164 = v150;
    if ((uint64_t)v150 > 3000)
    {
      v8 = v13;
      v9 = v14;
      v35 = v147;
      if ((uint64_t)v150 > 4000)
      {
        a1 = v146;
        if ((_QWORD)v150 != 4001)
        {
          v5 = v145;
          if ((_QWORD)v150 == 4256)
          {
            CC_SHA256_Final(&v164[8], (CC_SHA256_CTX *)((char *)&v150 + 8));
          }
          else if ((_QWORD)v150 == 4512)
          {
            CC_SHA512_Final(&v164[8], (CC_SHA512_CTX *)((char *)&v150 + 8));
          }
          goto LABEL_100;
        }
        CC_SHA1_Final(&v164[8], (CC_SHA1_CTX *)((char *)&v150 + 8));
LABEL_58:
        v5 = v145;
        goto LABEL_100;
      }
      a1 = v146;
      if ((_QWORD)v150 != 3001)
      {
        v5 = v145;
        if ((_QWORD)v150 == 4000)
          CC_MD5_Final(&v164[8], (CC_MD5_CTX *)((char *)&v150 + 8));
LABEL_100:
        v165[0] = *(_OWORD *)v164;
        v165[1] = *(_OWORD *)&v164[16];
        v165[2] = *(_OWORD *)&v164[32];
        v165[3] = *(_OWORD *)&v164[48];
        v166 = *(_QWORD *)&v164[64];
        if (*(uint64_t *)v164 > 3999)
        {
          if (*(uint64_t *)v164 > 4255)
          {
            if (*(_QWORD *)v164 == 4256)
            {
              v137 = (unsigned __int8 *)v165 + 8;
              v138 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
              v139 = v138;
              for (i = 0; i != 64; i += 2)
              {
                v141 = *v137++;
                v142 = &v138[i];
                *v142 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v141 >> 4];
                v142[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v141 & 0xF];
              }
              v108 = objc_alloc(MEMORY[0x1E0CB3940]);
              v109 = v139;
              v110 = 64;
            }
            else
            {
              if (*(_QWORD *)v164 != 4512)
                goto LABEL_152;
              v115 = (unsigned __int8 *)v165 + 8;
              v116 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
              v117 = v116;
              for (j = 0; j != 128; j += 2)
              {
                v119 = *v115++;
                v120 = &v116[j];
                *v120 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v119 >> 4];
                v120[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v119 & 0xF];
              }
              v108 = objc_alloc(MEMORY[0x1E0CB3940]);
              v109 = v117;
              v110 = 128;
            }
          }
          else if (*(_QWORD *)v164 == 4000)
          {
            v127 = (unsigned __int8 *)v165 + 8;
            v128 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
            v129 = v128;
            for (k = 0; k != 32; k += 2)
            {
              v131 = *v127++;
              v132 = &v128[k];
              *v132 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v131 >> 4];
              v132[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v131 & 0xF];
            }
            v108 = objc_alloc(MEMORY[0x1E0CB3940]);
            v109 = v129;
            v110 = 32;
          }
          else
          {
            if (*(_QWORD *)v164 != 4001)
              goto LABEL_152;
            v102 = (unsigned __int8 *)v165 + 8;
            v103 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
            v104 = v103;
            for (m = 0; m != 40; m += 2)
            {
              v106 = *v102++;
              v107 = &v103[m];
              *v107 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v106 >> 4];
              v107[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v106 & 0xF];
            }
            v108 = objc_alloc(MEMORY[0x1E0CB3940]);
            v109 = v104;
            v110 = 40;
          }
        }
        else
        {
          if (*(uint64_t *)v164 <= 2999)
          {
            if (*(_QWORD *)v164 == 1000)
            {
              v121 = *((_QWORD *)&v165[0] + 1);
              v122 = (char *)v168 + 1;
              quot = *((_QWORD *)&v165[0] + 1);
              do
              {
                v124 = lldiv(quot, 10);
                quot = v124.quot;
                if (v124.rem >= 0)
                  LOBYTE(v125) = v124.rem;
                else
                  v125 = -v124.rem;
                *(v122 - 2) = v125 + 48;
                v126 = (const UInt8 *)(v122 - 2);
                --v122;
              }
              while (v124.quot);
              v6 = v148;
              if (v121 < 0)
              {
                *(v122 - 2) = 45;
                v126 = (const UInt8 *)(v122 - 2);
              }
              v10 = (__CFString *)CFStringCreateWithBytes(0, v126, (char *)v168 - (char *)v126, 0x8000100u, 0);
              v11 = v149;
              goto LABEL_146;
            }
            if (*(_QWORD *)v164 == 2000)
            {
              v97 = DWORD2(v165[0]);
              v98 = (const UInt8 *)v168;
              do
              {
                v99 = ldiv(v97, 10);
                v97 = v99.quot;
                if (v99.rem >= 0)
                  LOBYTE(v100) = v99.rem;
                else
                  v100 = -v99.rem;
                *--v98 = v100 + 48;
              }
              while (v99.quot);
              v101 = CFStringCreateWithBytes(0, v98, (char *)v168 - (char *)v98, 0x8000100u, 0);
              goto LABEL_144;
            }
LABEL_152:
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull _MSVHashGetDigest(MSVHash)");
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v143, "handleFailureInFunction:file:lineNumber:description:", v144, CFSTR("MSVHasher+Algorithms.h"), 356, CFSTR("Cannot obtain digest from unknown hasher algorithm"));

            v10 = &stru_1E3163D10;
            goto LABEL_145;
          }
          if (*(_QWORD *)v164 == 3000)
          {
            LODWORD(v167[0]) = bswap32(DWORD2(v165[0]));
            v133 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
            v134 = 0;
            v135 = v133 + 1;
            do
            {
              v136 = *((unsigned __int8 *)v167 + v134);
              *(v135 - 1) = MSVFastHexStringFromBytes_hexCharacters_47995[v136 >> 4];
              *v135 = MSVFastHexStringFromBytes_hexCharacters_47995[v136 & 0xF];
              v135 += 2;
              ++v134;
            }
            while (v134 != 4);
            v108 = objc_alloc(MEMORY[0x1E0CB3940]);
            v109 = v133;
            v110 = 8;
          }
          else
          {
            if (*(_QWORD *)v164 != 3001)
              goto LABEL_152;
            v167[0] = bswap64(*((unint64_t *)&v165[0] + 1));
            v111 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
            v112 = 0;
            v113 = v111 + 1;
            do
            {
              v114 = *((unsigned __int8 *)v167 + v112);
              *(v113 - 1) = MSVFastHexStringFromBytes_hexCharacters_47995[v114 >> 4];
              *v113 = MSVFastHexStringFromBytes_hexCharacters_47995[v114 & 0xF];
              v113 += 2;
              ++v112;
            }
            while (v112 != 8);
            v108 = objc_alloc(MEMORY[0x1E0CB3940]);
            v109 = v111;
            v110 = 16;
          }
        }
        v101 = (CFStringRef)objc_msgSend(v108, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v109, v110, 4, 1);
LABEL_144:
        v10 = (__CFString *)v101;
LABEL_145:
        v6 = v148;
LABEL_146:

        goto LABEL_147;
      }
      v5 = v145;
      if (*((_QWORD *)&v150 + 1) < 0x20uLL)
        v78 = v152 + 0x27D4EB2F165667C5;
      else
        v78 = 0x85EBCA77C2B2AE63
            - 0x61C8864E7A143579
            * ((0x85EBCA77C2B2AE63
              - 0x61C8864E7A143579
              * ((0x85EBCA77C2B2AE63
                - 0x61C8864E7A143579
                * ((0x85EBCA77C2B2AE63
                  - 0x61C8864E7A143579
                  * ((__ROR8__(v151.i64[1], 57) + __ROR8__(v151.i64[0], 63) + __ROR8__(v152, 52) + __ROR8__(v153, 46)) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v151.i64[0], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v151.i64[1], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v152, 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v153, 33)));
      v81 = v78 + *((_QWORD *)&v150 + 1);
      v82 = BYTE8(v150) & 0x1F;
      if (v82 >= 8)
      {
        do
        {
          v83 = *v21++;
          v81 = 0x85EBCA77C2B2AE63
              - 0x61C8864E7A143579
              * __ROR8__((0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v83, 33)) ^ v81, 37);
          v82 -= 8;
        }
        while (v82 > 7);
      }
      if (v82 >= 4)
      {
        v84 = *(_DWORD *)v21;
        v21 = (uint64_t *)((char *)v21 + 4);
        v81 = 0xC2B2AE3D27D4EB4FLL * __ROR8__((0x9E3779B185EBCA87 * v84) ^ v81, 41) + 0x165667B19E3779F9;
        v82 -= 4;
      }
      for (; v82; --v82)
      {
        v85 = *(unsigned __int8 *)v21;
        v21 = (uint64_t *)((char *)v21 + 1);
        v81 = 0x9E3779B185EBCA87 * __ROR8__((0x27D4EB2F165667C5 * v85) ^ v81, 53);
      }
      v86 = 0x165667B19E3779F9
          * ((0xC2B2AE3D27D4EB4FLL * (v81 ^ (v81 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v81 ^ (v81 >> 33))) >> 29));
      v66 = v86 ^ HIDWORD(v86);
      goto LABEL_85;
    }
    v8 = v13;
    v9 = v14;
    v35 = v147;
    if ((uint64_t)v150 <= 1999)
    {
      a1 = v146;
      if (!(_QWORD)v150)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "handleFailureInFunction:file:lineNumber:description:", v74, CFSTR("MSVHasher+Algorithms.h"), 156, CFSTR("Cannot finalize unknown hasher algorithm"));

        goto LABEL_58;
      }
      v5 = v145;
      if ((_QWORD)v150 != 1000)
        goto LABEL_100;
      v36 = (*((_QWORD *)&v150 + 1) + v151.i64[0]) ^ __ROR8__(v151.i64[0], 51);
      v37 = v151.i64[1] + (v152 ^ v153);
      v38 = __ROR8__(v152 ^ v153, 48);
      v39 = (v37 ^ v38) + __ROR8__(*((_QWORD *)&v150 + 1) + v151.i64[0], 32);
      v40 = v39 ^ __ROR8__(v37 ^ v38, 43);
      v41 = v37 + v36;
      v42 = v41 ^ __ROR8__(v36, 47);
      v43 = (v39 ^ v153) + v42;
      v44 = v43 ^ __ROR8__(v42, 51);
      v45 = (__ROR8__(v41, 32) ^ 0xFFLL) + v40;
      v46 = __ROR8__(v40, 48);
      v47 = __ROR8__(v43, 32) + (v45 ^ v46);
      v48 = v47 ^ __ROR8__(v45 ^ v46, 43);
      v49 = v44 + v45;
      v50 = v49 ^ __ROR8__(v44, 47);
      v51 = v50 + v47;
      v52 = v51 ^ __ROR8__(v50, 51);
      v53 = __ROR8__(v49, 32) + v48;
      v54 = __ROR8__(v48, 48);
      v55 = __ROR8__(v51, 32) + (v53 ^ v54);
      v56 = v55 ^ __ROR8__(v53 ^ v54, 43);
      v57 = v52 + v53;
      v58 = v57 ^ __ROR8__(v52, 47);
      v59 = v58 + v55;
      v60 = v59 ^ __ROR8__(v58, 51);
      v61 = __ROR8__(v57, 32) + v56;
      v62 = __ROR8__(v56, 48);
      v63 = __ROR8__(v59, 32) + (v61 ^ v62);
      v64 = v63 ^ __ROR8__(v61 ^ v62, 43);
      v65 = v60 + v61;
      *((_QWORD *)&v150 + 1) = v63;
      v151.i64[0] = v65 ^ __ROR8__(v60, 47);
      v151.i64[1] = __ROR8__(v65, 32);
      v152 = v64;
      v66 = v151.i64[0] ^ v63 ^ v151.i64[1] ^ v64;
LABEL_85:
      *(_QWORD *)&v164[8] = v66;
      goto LABEL_100;
    }
    a1 = v146;
    if ((_QWORD)v150 != 2000)
    {
      v5 = v145;
      if ((_QWORD)v150 != 3000)
        goto LABEL_100;
      v67 = &v152;
      if (HIDWORD(v150))
        v68 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(v151, (uint32x4_t)xmmword_193F0CA90), (int8x16_t)vshlq_u32(v151, (uint32x4_t)xmmword_193F0CA80)));
      else
        v68 = v151.i32[2] + 374761393;
      v87 = DWORD2(v150) + v68;
      v88 = v154[0] & 0xF;
      if (v88 >= 4)
      {
        do
        {
          v89 = *(_DWORD *)v67;
          v67 = (unint64_t *)((char *)v67 + 4);
          HIDWORD(v90) = v87 - 1028477379 * v89;
          LODWORD(v90) = HIDWORD(v90);
          v87 = 668265263 * (v90 >> 15);
          v88 -= 4;
        }
        while (v88 > 3);
      }
      for (; v88; --v88)
      {
        v91 = *(unsigned __int8 *)v67;
        v67 = (unint64_t *)((char *)v67 + 1);
        HIDWORD(v92) = v87 + 374761393 * v91;
        LODWORD(v92) = HIDWORD(v92);
        v87 = -1640531535 * (v92 >> 21);
      }
      v93 = -1028477379 * ((-2048144777 * (v87 ^ (v87 >> 15))) ^ ((-2048144777 * (v87 ^ (v87 >> 15))) >> 13));
      v94 = v93 ^ HIWORD(v93);
      goto LABEL_99;
    }
    v5 = v145;
    switch(v151.u8[3])
    {
      case 1u:
        v75 = v151.u8[0];
        break;
      case 2u:
        v75 = v151.u16[0];
        break;
      case 3u:
        v75 = v151.u16[0] | (v151.u8[2] << 16);
        break;
      default:
        v95 = DWORD2(v150);
        goto LABEL_98;
    }
    v95 = (461845907 * ((380141568 * v75) | ((-862048943 * v75) >> 17))) ^ DWORD2(v150);
LABEL_98:
    v96 = -2048144789 * (v95 ^ HIDWORD(v150) ^ ((v95 ^ HIDWORD(v150)) >> 16));
    v94 = (-1028477387 * (v96 ^ (v96 >> 13))) ^ ((-1028477387 * (v96 ^ (v96 >> 13))) >> 16);
    DWORD2(v150) = v94;
LABEL_99:
    *(_DWORD *)&v164[8] = v94;
    goto LABEL_100;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("mediaType")))
  {
    v27 = objc_msgSend(v6, "integerValue");
    if ((v27 & 1) != 0)
    {
      v28 = (id *)MEMORY[0x1E0D4C908];
    }
    else if ((v27 & 0x402) != 0)
    {
      v28 = (id *)MEMORY[0x1E0D4C910];
    }
    else if ((v27 & 4) != 0)
    {
      v28 = (id *)MEMORY[0x1E0D4C8F0];
    }
    else if ((v27 & 0x1008) != 0)
    {
      v28 = (id *)MEMORY[0x1E0D4C900];
    }
    else
    {
      if ((v27 & 0x20) == 0)
        goto LABEL_151;
      v28 = (id *)MEMORY[0x1E0D4C8F8];
    }
LABEL_69:
    v79 = *v28;
    if (v79)
    {
LABEL_70:
      v9 = v79;
      v72 = *(void **)(a1 + 40);
LABEL_71:
      objc_msgSend(v72, "setObject:forKey:", v9, v8);
LABEL_150:

      goto LABEL_151;
    }
    goto LABEL_151;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("MPNowPlayingInfoPropertyMediaType")))
  {
    v29 = objc_msgSend(v6, "integerValue");
    if (v29 == 1)
    {
      v28 = (id *)MEMORY[0x1E0D4CB70];
    }
    else
    {
      if (v29 != 2)
        goto LABEL_151;
      v28 = (id *)MEMORY[0x1E0D4CB78];
    }
    goto LABEL_69;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("_MPNowPlayingInfoPropertyRepeatMode")))
  {
    v30 = objc_msgSend(v6, "unsignedIntegerValue");
    if (v30 == 1)
      v31 = 2;
    else
      v31 = 1;
    v32 = v30 == 2;
    v33 = 3;
LABEL_48:
    if (v32)
      v70 = v33;
    else
      v70 = v31;
    v71 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v70);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v72 = v71;
    goto LABEL_71;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("_MPNowPlayingInfoPropertyShuffleMode")))
  {
    v69 = objc_msgSend(v6, "unsignedIntegerValue");
    if (v69 == 1)
      v31 = 3;
    else
      v31 = 1;
    v32 = v69 == 2;
    v33 = 2;
    goto LABEL_48;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("MPNowPlayingInfoPropertyAvailableLanguageOptions")))
  {
    v76 = MRLanguageOptionGroupsFromMPNowPlayingLanguageOptionGroups(v6);
    ExternalRepresentation = MRLanguageOptionGroupsCreateExternalRepresentation();
LABEL_74:
    v80 = (void *)ExternalRepresentation;
    if (ExternalRepresentation)
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", ExternalRepresentation, v8);
    CFRelease(v76);

    goto LABEL_151;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("MPNowPlayingInfoPropertyCurrentLanguageOption")))
  {
    v76 = MRLanguageOptionsFromMPNowPlayingLanguageOptions(v6);
    ExternalRepresentation = MRLanguageOptionsCreateExternalRepresentation();
    goto LABEL_74;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("_MPNowPlayingInfoPropertyCollectionInfo")))
  {
    MPNowPlayingCollectionInfoToMediaRemote(v6);
    v79 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_70;
  }
  if (v8)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v6, v8);
LABEL_151:

}

@end
