@implementation _MSVSQLConnection

- (BOOL)executeStatementString:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  BOOL v9;
  void *v11;

  v7 = a3;
  if (self->_invalid)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 1254, CFSTR("Attempt to use invalidated connection."));

  }
  -[_MSVSQLConnection statementWithString:error:](self, "statementWithString:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[_MSVSQLConnection executeStatement:error:](self, "executeStatement:error:", v8, a4);
    objc_msgSend(v8, "invalidate");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)executeStatement:(id)a3 error:(id *)a4
{
  _QWORD *v7;
  _QWORD *v8;
  sqlite3_stmt *v9;
  int v10;
  int v11;
  void *v12;
  sqlite3 **v13;
  id v14;
  void *v16;

  v7 = a3;
  v8 = v7;
  if (self->_invalid)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 1238, CFSTR("Attempt to use invalidated connection."));

    if (v8)
      goto LABEL_3;
LABEL_11:
    v9 = 0;
    goto LABEL_4;
  }
  if (!v7)
    goto LABEL_11;
LABEL_3:
  v9 = (sqlite3_stmt *)v8[1];
LABEL_4:
  v10 = sqlite3_step(v9);
  v11 = v10;
  if (a4 && v10 != 101)
  {
    if (v8)
      v12 = (void *)v8[2];
    else
      v12 = 0;
    v13 = v12;
    -[_MSVSQLConnection lastError](v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    *a4 = v14;
  }

  return v11 == 101;
}

- (id)statementWithString:(id)a3 error:(id *)a4
{
  id v7;
  sqlite3 *connectionHandle;
  id v9;
  void *v10;
  unint64_t v11;
  NSString *v12;
  NSString *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  MSVSQLStatement *v17;
  sqlite3_stmt *v18;
  _MSVSQLConnection *v19;
  id *v20;
  void *v21;
  unint64_t v22;
  NSString *v23;
  NSString *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
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
  unint64_t v61;
  uint64_t v62;
  unint64_t *v63;
  int v64;
  void *v65;
  void *v66;
  int v67;
  unsigned int v68;
  unint64_t v69;
  int v70;
  unint64_t v71;
  int v72;
  unint64_t v73;
  unsigned int v74;
  unsigned int v75;
  unsigned int v76;
  unsigned int v77;
  uint64_t v78;
  _QWORD *v79;
  ldiv_t v80;
  uint64_t v81;
  char *v82;
  const UInt8 *v83;
  unsigned __int8 *v84;
  char *v85;
  char *v86;
  uint64_t m;
  unsigned int v88;
  char *v89;
  id v90;
  char *v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  _BYTE *v95;
  unint64_t v96;
  unsigned __int8 *v97;
  char *v98;
  char *v99;
  uint64_t j;
  unsigned int v101;
  char *v102;
  uint64_t v103;
  char *v104;
  uint64_t quot;
  lldiv_t v106;
  uint64_t v107;
  CFStringRef v108;
  unsigned __int8 *v109;
  char *v110;
  char *v111;
  uint64_t k;
  unsigned int v113;
  char *v114;
  char *v115;
  uint64_t v116;
  _BYTE *v117;
  unint64_t v118;
  unsigned __int8 *v119;
  char *v120;
  char *v121;
  uint64_t i;
  unsigned int v123;
  char *v124;
  __CFString *v125;
  NSObject *v126;
  void *v128;
  void *v129;
  __int16 v130;
  uint64_t v131;
  unint64_t v132;
  uint64_t v133;
  unint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  unint64_t v138;
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
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  unint64_t v159;
  uint64_t v160;
  void *v161;
  void *v162;
  int v163;
  unsigned int v164;
  unsigned int v165;
  uint64_t v166;
  _QWORD *v167;
  ldiv_t v168;
  uint64_t v169;
  char *v170;
  const UInt8 *v171;
  unsigned __int8 *v172;
  char *v173;
  char *v174;
  uint64_t kk;
  unsigned int v176;
  char *v177;
  id v178;
  char *v179;
  uint64_t v180;
  char *v181;
  uint64_t v182;
  _BYTE *v183;
  unint64_t v184;
  unsigned __int8 *v185;
  char *v186;
  char *v187;
  uint64_t ii;
  unsigned int v189;
  char *v190;
  uint64_t v191;
  char *v192;
  uint64_t v193;
  lldiv_t v194;
  uint64_t v195;
  CFStringRef v196;
  unsigned __int8 *v197;
  char *v198;
  char *v199;
  uint64_t jj;
  unsigned int v201;
  char *v202;
  char *v203;
  uint64_t v204;
  _BYTE *v205;
  unint64_t v206;
  unsigned __int8 *v207;
  char *v208;
  char *v209;
  uint64_t n;
  unsigned int v211;
  char *v212;
  __CFString *v213;
  NSObject *v214;
  void *v215;
  id v216;
  NSObject *v217;
  NSObject *v218;
  MSVSQLDatabaseTransaction *v219;
  void *v220;
  __CFString *v221;
  id v222;
  uint64_t v223;
  NSObject *v224;
  void *v225;
  void *v226;
  void *v227;
  id v228;
  id v229;
  sqlite3_stmt *ppStmt;
  _BYTE v231[32];
  unint64_t v232;
  unint64_t v233;
  __int128 v234;
  __int128 v235;
  uint64_t v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  _BYTE v245[72];
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  uint64_t v250;
  _QWORD v251[3];
  _QWORD v252[3];

  v252[0] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (self->_invalid)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v227, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 1189, CFSTR("Attempt to use invalidated connection."));

  }
  ppStmt = 0;
  connectionHandle = self->_connectionHandle;
  v9 = objc_retainAutorelease(v7);
  if (sqlite3_prepare_v2(connectionHandle, (const char *)objc_msgSend(v9, "UTF8String"), -1, &ppStmt, 0))
  {
    -[_MSVSQLConnection lastError](&self->super.isa);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
LABEL_142:
      if (a4)
        *a4 = objc_retainAutorelease(v10);

      v21 = 0;
      goto LABEL_145;
    }
    v11 = MSVHasherSharedSeed();
    v12 = self->_databaseURI;
    v244 = 0u;
    v243 = 0u;
    v242 = 0u;
    v241 = 0u;
    v240 = 0u;
    v239 = 0u;
    v238 = 0u;
    v237 = 0u;
    *(_OWORD *)v231 = xmmword_1A07D4D30;
    *(int64x2_t *)&v231[16] = vaddq_s64(vdupq_n_s64(v11), (int64x2_t)xmmword_1A07D4D40);
    v232 = v11;
    v233 = v11 + 0x61C8864E7A143579;
    v234 = 0u;
    v235 = 0u;
    v236 = 0;
    v13 = objc_retainAutorelease(v12);
    v14 = -[NSString UTF8String](v13, "UTF8String");
    v15 = -[NSString length](v13, "length");
    if (*(uint64_t *)v231 > 3999)
    {
      if (*(uint64_t *)v231 > 4255)
      {
        if (*(_QWORD *)v231 == 4256)
        {
          CC_SHA256_Update((CC_SHA256_CTX *)&v231[8], v14, v15);
        }
        else if (*(_QWORD *)v231 == 4512)
        {
          CC_SHA512_Update((CC_SHA512_CTX *)&v231[8], v14, v15);
        }
      }
      else if (*(_QWORD *)v231 == 4000)
      {
        CC_MD5_Update((CC_MD5_CTX *)&v231[8], v14, v15);
      }
      else if (*(_QWORD *)v231 == 4001)
      {
        CC_SHA1_Update((CC_SHA1_CTX *)&v231[8], v14, v15);
      }
    }
    else if (*(uint64_t *)v231 > 2999)
    {
      if (*(_QWORD *)v231 == 3000)
      {
        _MSV_XXH_XXH32_update(&v231[8], v14, v15);
      }
      else if (*(_QWORD *)v231 == 3001)
      {
        _MSV_XXH_XXH64_update(&v231[8], v14, v15);
      }
    }
    else if (*(_QWORD *)v231)
    {
      if (*(_QWORD *)v231 == 2000)
      {
        v16 = &v231[v231[19] + 16];
        switch((((_BYTE)v15 + v231[19]) & 3) - v231[19])
        {
          case 0:
            break;
          case 1:
            *v16 = *v14;
            break;
          case 2:
            v32 = *(_WORD *)v14;
            goto LABEL_54;
          case 3:
            v32 = *(_WORD *)v14;
            v16[2] = v14[2];
LABEL_54:
            *(_WORD *)v16 = v32;
            break;
          default:
            memcpy(v16, v14, (((v15 + v231[19]) & 3) - v231[19]));
            break;
        }
        *(_DWORD *)&v231[12] += v15;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasherAppendBytes(MSVHasher * _Nonnull, const void * _Nonnull, size_t)");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, CFSTR("MSVHasher+Algorithms.h"), 262, CFSTR("Cannot append to unknown hasher algorithm"));

    }
    memset(&v245[8], 0, 64);
    *(_QWORD *)v245 = *(_QWORD *)v231;
    if (*(uint64_t *)v231 > 3000)
    {
      if (*(uint64_t *)v231 <= 4000)
      {
        if (*(_QWORD *)v231 == 3001)
        {
          *(_QWORD *)&v245[8] = _MSV_XXH_XXH64_digest(&v231[8]);
        }
        else if (*(_QWORD *)v231 == 4000)
        {
          CC_MD5_Final(&v245[8], (CC_MD5_CTX *)&v231[8]);
        }
      }
      else
      {
        switch(*(_QWORD *)v231)
        {
          case 0xFA1:
            CC_SHA1_Final(&v245[8], (CC_SHA1_CTX *)&v231[8]);
            break;
          case 0x10A0:
            CC_SHA256_Final(&v245[8], (CC_SHA256_CTX *)&v231[8]);
            break;
          case 0x11A0:
            CC_SHA512_Final(&v245[8], (CC_SHA512_CTX *)&v231[8]);
            break;
        }
      }
      goto LABEL_93;
    }
    if (*(uint64_t *)v231 <= 1999)
    {
      if (*(_QWORD *)v231)
      {
        if (*(_QWORD *)v231 == 1000)
        {
          v33 = (*(_QWORD *)&v231[8] + *(_QWORD *)&v231[16]) ^ __ROR8__(*(_QWORD *)&v231[16], 51);
          v34 = *(_QWORD *)&v231[24] + (v232 ^ v233);
          v35 = __ROR8__(v232 ^ v233, 48);
          v36 = (v34 ^ v35) + __ROR8__(*(_QWORD *)&v231[8] + *(_QWORD *)&v231[16], 32);
          v37 = v36 ^ __ROR8__(v34 ^ v35, 43);
          v38 = v34 + v33;
          v39 = v38 ^ __ROR8__(v33, 47);
          v40 = (v36 ^ v233) + v39;
          v41 = v40 ^ __ROR8__(v39, 51);
          v42 = (__ROR8__(v38, 32) ^ 0xFFLL) + v37;
          v43 = __ROR8__(v37, 48);
          v44 = __ROR8__(v40, 32) + (v42 ^ v43);
          v45 = v44 ^ __ROR8__(v42 ^ v43, 43);
          v46 = v41 + v42;
          v47 = v46 ^ __ROR8__(v41, 47);
          v48 = v47 + v44;
          v49 = v48 ^ __ROR8__(v47, 51);
          v50 = __ROR8__(v46, 32) + v45;
          v51 = __ROR8__(v45, 48);
          v52 = __ROR8__(v48, 32) + (v50 ^ v51);
          v53 = v52 ^ __ROR8__(v50 ^ v51, 43);
          v54 = v49 + v50;
          v55 = v54 ^ __ROR8__(v49, 47);
          v56 = v55 + v52;
          v57 = v56 ^ __ROR8__(v55, 51);
          v58 = __ROR8__(v54, 32) + v53;
          v59 = __ROR8__(v53, 48);
          v60 = __ROR8__(v56, 32) + (v58 ^ v59);
          v61 = v60 ^ __ROR8__(v58 ^ v59, 43);
          v62 = v57 + v58;
          *(_QWORD *)&v231[8] = v60;
          *(_QWORD *)&v231[16] = v62 ^ __ROR8__(v57, 47);
          *(_QWORD *)&v231[24] = __ROR8__(v62, 32);
          v232 = v61;
          *(_QWORD *)&v245[8] = *(_QWORD *)&v231[16] ^ v60 ^ *(_QWORD *)&v231[24] ^ v61;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "handleFailureInFunction:file:lineNumber:description:", v66, CFSTR("MSVHasher+Algorithms.h"), 156, CFSTR("Cannot finalize unknown hasher algorithm"));

      }
LABEL_93:
      v246 = *(_OWORD *)v245;
      v247 = *(_OWORD *)&v245[16];
      v248 = *(_OWORD *)&v245[32];
      v249 = *(_OWORD *)&v245[48];
      v250 = *(_QWORD *)&v245[64];
      if (*(uint64_t *)v245 > 3999)
      {
        if (*(uint64_t *)v245 > 4255)
        {
          if (*(_QWORD *)v245 == 4256)
          {
            v119 = (unsigned __int8 *)&v246 + 8;
            v120 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
            v121 = v120;
            for (i = 0; i != 64; i += 2)
            {
              v123 = *v119++;
              v124 = &v120[i];
              *v124 = MSVFastHexStringFromBytes_hexCharacters_3379[(unint64_t)v123 >> 4];
              v124[1] = MSVFastHexStringFromBytes_hexCharacters_3379[v123 & 0xF];
            }
            v90 = objc_alloc(MEMORY[0x1E0CB3940]);
            v91 = v121;
            v92 = 64;
          }
          else
          {
            if (*(_QWORD *)v245 != 4512)
              goto LABEL_146;
            v97 = (unsigned __int8 *)&v246 + 8;
            v98 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
            v99 = v98;
            for (j = 0; j != 128; j += 2)
            {
              v101 = *v97++;
              v102 = &v98[j];
              *v102 = MSVFastHexStringFromBytes_hexCharacters_3379[(unint64_t)v101 >> 4];
              v102[1] = MSVFastHexStringFromBytes_hexCharacters_3379[v101 & 0xF];
            }
            v90 = objc_alloc(MEMORY[0x1E0CB3940]);
            v91 = v99;
            v92 = 128;
          }
        }
        else if (*(_QWORD *)v245 == 4000)
        {
          v109 = (unsigned __int8 *)&v246 + 8;
          v110 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
          v111 = v110;
          for (k = 0; k != 32; k += 2)
          {
            v113 = *v109++;
            v114 = &v110[k];
            *v114 = MSVFastHexStringFromBytes_hexCharacters_3379[(unint64_t)v113 >> 4];
            v114[1] = MSVFastHexStringFromBytes_hexCharacters_3379[v113 & 0xF];
          }
          v90 = objc_alloc(MEMORY[0x1E0CB3940]);
          v91 = v111;
          v92 = 32;
        }
        else
        {
          if (*(_QWORD *)v245 != 4001)
            goto LABEL_146;
          v84 = (unsigned __int8 *)&v246 + 8;
          v85 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
          v86 = v85;
          for (m = 0; m != 40; m += 2)
          {
            v88 = *v84++;
            v89 = &v85[m];
            *v89 = MSVFastHexStringFromBytes_hexCharacters_3379[(unint64_t)v88 >> 4];
            v89[1] = MSVFastHexStringFromBytes_hexCharacters_3379[v88 & 0xF];
          }
          v90 = objc_alloc(MEMORY[0x1E0CB3940]);
          v91 = v86;
          v92 = 40;
        }
      }
      else
      {
        if (*(uint64_t *)v245 <= 2999)
        {
          if (*(_QWORD *)v245 == 1000)
          {
            v103 = *((_QWORD *)&v246 + 1);
            v104 = (char *)v252 + 1;
            quot = *((_QWORD *)&v246 + 1);
            do
            {
              v106 = lldiv(quot, 10);
              quot = v106.quot;
              if (v106.rem >= 0)
                LOBYTE(v107) = v106.rem;
              else
                v107 = -v106.rem;
              *(v104 - 2) = v107 + 48;
              v83 = (const UInt8 *)(v104 - 2);
              --v104;
            }
            while (v106.quot);
            if (v103 < 0)
            {
              *(v104 - 2) = 45;
              v83 = (const UInt8 *)(v104 - 2);
            }
            v82 = (char *)((char *)v252 - (char *)v83);
            goto LABEL_127;
          }
          if (*(_QWORD *)v245 == 2000)
          {
            v78 = DWORD2(v246);
            v79 = v252;
            do
            {
              v80 = ldiv(v78, 10);
              v78 = v80.quot;
              if (v80.rem >= 0)
                LOBYTE(v81) = v80.rem;
              else
                v81 = -v80.rem;
              *((_BYTE *)v79 - 1) = v81 + 48;
              v79 = (_QWORD *)((char *)v79 - 1);
            }
            while (v80.quot);
            v82 = (char *)((char *)v252 - (char *)v79);
            v83 = (const UInt8 *)v79;
LABEL_127:
            v108 = CFStringCreateWithBytes(0, v83, (CFIndex)v82, 0x8000100u, 0);
LABEL_138:
            v125 = (__CFString *)v108;
LABEL_139:

            v126 = os_log_create("com.apple.amp.MediaServices", "SQL");
            if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v231 = 138543874;
              *(_QWORD *)&v231[4] = v125;
              *(_WORD *)&v231[12] = 2048;
              *(_QWORD *)&v231[14] = self;
              *(_WORD *)&v231[22] = 2114;
              *(_QWORD *)&v231[24] = v10;
              _os_log_impl(&dword_1A077D000, v126, OS_LOG_TYPE_ERROR, "[SQL:%{public}@:%p] statementWithString:… | failed to create statement [] error=%{public}@", v231, 0x20u);
            }

            goto LABEL_142;
          }
LABEL_146:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull _MSVHashGetDigest(MSVHash)");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v128, "handleFailureInFunction:file:lineNumber:description:", v129, CFSTR("MSVHasher+Algorithms.h"), 356, CFSTR("Cannot obtain digest from unknown hasher algorithm"));

          v125 = &stru_1E43EA7B0;
          goto LABEL_139;
        }
        if (*(_QWORD *)v245 == 3000)
        {
          LODWORD(v251[0]) = bswap32(DWORD2(v246));
          v115 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
          v116 = 0;
          v117 = v115 + 1;
          do
          {
            v118 = *((unsigned __int8 *)v251 + v116);
            *(v117 - 1) = MSVFastHexStringFromBytes_hexCharacters_3379[v118 >> 4];
            *v117 = MSVFastHexStringFromBytes_hexCharacters_3379[v118 & 0xF];
            v117 += 2;
            ++v116;
          }
          while (v116 != 4);
          v90 = objc_alloc(MEMORY[0x1E0CB3940]);
          v91 = v115;
          v92 = 8;
        }
        else
        {
          if (*(_QWORD *)v245 != 3001)
            goto LABEL_146;
          v251[0] = bswap64(*((unint64_t *)&v246 + 1));
          v93 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
          v94 = 0;
          v95 = v93 + 1;
          do
          {
            v96 = *((unsigned __int8 *)v251 + v94);
            *(v95 - 1) = MSVFastHexStringFromBytes_hexCharacters_3379[v96 >> 4];
            *v95 = MSVFastHexStringFromBytes_hexCharacters_3379[v96 & 0xF];
            v95 += 2;
            ++v94;
          }
          while (v94 != 8);
          v90 = objc_alloc(MEMORY[0x1E0CB3940]);
          v91 = v93;
          v92 = 16;
        }
      }
      v108 = (CFStringRef)objc_msgSend(v90, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v91, v92, 4, 1);
      goto LABEL_138;
    }
    if (*(_QWORD *)v231 != 2000)
    {
      if (*(_QWORD *)v231 != 3000)
        goto LABEL_93;
      v63 = &v232;
      if (*(_DWORD *)&v231[12])
        v64 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)&v231[16], (uint32x4_t)xmmword_1A07D4D20), (int8x16_t)vshlq_u32(*(uint32x4_t *)&v231[16], (uint32x4_t)xmmword_1A07D4D10)));
      else
        v64 = *(_DWORD *)&v231[24] + 374761393;
      v68 = *(_DWORD *)&v231[8] + v64;
      v69 = v234 & 0xF;
      if (v69 >= 4)
      {
        do
        {
          v70 = *(_DWORD *)v63;
          v63 = (unint64_t *)((char *)v63 + 4);
          HIDWORD(v71) = v68 - 1028477379 * v70;
          LODWORD(v71) = HIDWORD(v71);
          v68 = 668265263 * (v71 >> 15);
          v69 -= 4;
        }
        while (v69 > 3);
      }
      for (; v69; --v69)
      {
        v72 = *(unsigned __int8 *)v63;
        v63 = (unint64_t *)((char *)v63 + 1);
        HIDWORD(v73) = v68 + 374761393 * v72;
        LODWORD(v73) = HIDWORD(v73);
        v68 = -1640531535 * (v73 >> 21);
      }
      v74 = -1028477379 * ((-2048144777 * (v68 ^ (v68 >> 15))) ^ ((-2048144777 * (v68 ^ (v68 >> 15))) >> 13));
      v75 = v74 ^ HIWORD(v74);
      goto LABEL_92;
    }
    switch(v231[19])
    {
      case 1:
        v67 = v231[16];
        break;
      case 2:
        v67 = *(unsigned __int16 *)&v231[16];
        break;
      case 3:
        v67 = *(unsigned __int16 *)&v231[16] | (v231[18] << 16);
        break;
      default:
        v76 = *(_DWORD *)&v231[8];
        goto LABEL_91;
    }
    v76 = (461845907 * ((380141568 * v67) | ((-862048943 * v67) >> 17))) ^ *(_DWORD *)&v231[8];
LABEL_91:
    v77 = -2048144789 * (v76 ^ *(_DWORD *)&v231[12] ^ ((v76 ^ *(_DWORD *)&v231[12]) >> 16));
    v75 = (-1028477387 * (v77 ^ (v77 >> 13))) ^ ((-1028477387 * (v77 ^ (v77 >> 13))) >> 16);
    *(_DWORD *)&v231[8] = v75;
LABEL_92:
    *(_DWORD *)&v245[8] = v75;
    goto LABEL_93;
  }
  if ((self->_options & 1) != 0 || sqlite3_stmt_readonly(ppStmt))
  {
    v17 = [MSVSQLStatement alloc];
    v18 = ppStmt;
    v19 = self;
    if (v17)
    {
      *(_QWORD *)v231 = v17;
      *(_QWORD *)&v231[8] = MSVSQLStatement;
      v20 = (id *)objc_msgSendSuper2((objc_super *)v231, sel_init);
      v21 = v20;
      if (v20)
      {
        v20[1] = v18;
        objc_storeStrong(v20 + 2, self);
      }
    }
    else
    {
      v21 = 0;
    }

    goto LABEL_145;
  }
  v22 = MSVHasherSharedSeed();
  v23 = self->_databaseURI;
  v244 = 0u;
  v243 = 0u;
  v242 = 0u;
  v241 = 0u;
  v240 = 0u;
  v239 = 0u;
  v238 = 0u;
  v237 = 0u;
  *(_OWORD *)v231 = xmmword_1A07D4D30;
  *(int64x2_t *)&v231[16] = vaddq_s64(vdupq_n_s64(v22), (int64x2_t)xmmword_1A07D4D40);
  v232 = v22;
  v233 = v22 + 0x61C8864E7A143579;
  v234 = 0u;
  v235 = 0u;
  v236 = 0;
  v24 = objc_retainAutorelease(v23);
  v25 = -[NSString UTF8String](v24, "UTF8String");
  v26 = -[NSString length](v24, "length");
  if (*(uint64_t *)v231 > 3999)
  {
    if (*(uint64_t *)v231 > 4255)
    {
      if (*(_QWORD *)v231 == 4256)
      {
        CC_SHA256_Update((CC_SHA256_CTX *)&v231[8], v25, v26);
      }
      else if (*(_QWORD *)v231 == 4512)
      {
        CC_SHA512_Update((CC_SHA512_CTX *)&v231[8], v25, v26);
      }
    }
    else if (*(_QWORD *)v231 == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&v231[8], v25, v26);
    }
    else if (*(_QWORD *)v231 == 4001)
    {
      CC_SHA1_Update((CC_SHA1_CTX *)&v231[8], v25, v26);
    }
  }
  else if (*(uint64_t *)v231 > 2999)
  {
    if (*(_QWORD *)v231 == 3000)
    {
      _MSV_XXH_XXH32_update(&v231[8], v25, v26);
    }
    else if (*(_QWORD *)v231 == 3001)
    {
      _MSV_XXH_XXH64_update(&v231[8], v25, v26);
    }
  }
  else if (*(_QWORD *)v231)
  {
    if (*(_QWORD *)v231 == 2000)
    {
      v27 = &v231[v231[19] + 16];
      switch((((_BYTE)v26 + v231[19]) & 3) - v231[19])
      {
        case 0:
          break;
        case 1:
          *v27 = *v25;
          break;
        case 2:
          v130 = *(_WORD *)v25;
          goto LABEL_150;
        case 3:
          v130 = *(_WORD *)v25;
          v27[2] = v25[2];
LABEL_150:
          *(_WORD *)v27 = v130;
          break;
        default:
          memcpy(v27, v25, (((v26 + v231[19]) & 3) - v231[19]));
          break;
      }
      *(_DWORD *)&v231[12] += v26;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasherAppendBytes(MSVHasher * _Nonnull, const void * _Nonnull, size_t)");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, CFSTR("MSVHasher+Algorithms.h"), 262, CFSTR("Cannot append to unknown hasher algorithm"));

  }
  memset(&v245[8], 0, 64);
  *(_QWORD *)v245 = *(_QWORD *)v231;
  if (*(uint64_t *)v231 > 3000)
  {
    if (*(uint64_t *)v231 <= 4000)
    {
      if (*(_QWORD *)v231 == 3001)
      {
        *(_QWORD *)&v245[8] = _MSV_XXH_XXH64_digest(&v231[8]);
      }
      else if (*(_QWORD *)v231 == 4000)
      {
        CC_MD5_Final(&v245[8], (CC_MD5_CTX *)&v231[8]);
      }
    }
    else
    {
      switch(*(_QWORD *)v231)
      {
        case 0xFA1:
          CC_SHA1_Final(&v245[8], (CC_SHA1_CTX *)&v231[8]);
          break;
        case 0x10A0:
          CC_SHA256_Final(&v245[8], (CC_SHA256_CTX *)&v231[8]);
          break;
        case 0x11A0:
          CC_SHA512_Final(&v245[8], (CC_SHA512_CTX *)&v231[8]);
          break;
      }
    }
    goto LABEL_181;
  }
  if (*(uint64_t *)v231 <= 1999)
  {
    if (*(_QWORD *)v231)
    {
      if (*(_QWORD *)v231 == 1000)
      {
        v131 = (*(_QWORD *)&v231[8] + *(_QWORD *)&v231[16]) ^ __ROR8__(*(_QWORD *)&v231[16], 51);
        v132 = *(_QWORD *)&v231[24] + (v232 ^ v233);
        v133 = __ROR8__(v232 ^ v233, 48);
        v134 = (v132 ^ v133) + __ROR8__(*(_QWORD *)&v231[8] + *(_QWORD *)&v231[16], 32);
        v135 = v134 ^ __ROR8__(v132 ^ v133, 43);
        v136 = v132 + v131;
        v137 = v136 ^ __ROR8__(v131, 47);
        v138 = (v134 ^ v233) + v137;
        v139 = v138 ^ __ROR8__(v137, 51);
        v140 = (__ROR8__(v136, 32) ^ 0xFFLL) + v135;
        v141 = __ROR8__(v135, 48);
        v142 = __ROR8__(v138, 32) + (v140 ^ v141);
        v143 = v142 ^ __ROR8__(v140 ^ v141, 43);
        v144 = v139 + v140;
        v145 = v144 ^ __ROR8__(v139, 47);
        v146 = v145 + v142;
        v147 = v146 ^ __ROR8__(v145, 51);
        v148 = __ROR8__(v144, 32) + v143;
        v149 = __ROR8__(v143, 48);
        v150 = __ROR8__(v146, 32) + (v148 ^ v149);
        v151 = v150 ^ __ROR8__(v148 ^ v149, 43);
        v152 = v147 + v148;
        v153 = v152 ^ __ROR8__(v147, 47);
        v154 = v153 + v150;
        v155 = v154 ^ __ROR8__(v153, 51);
        v156 = __ROR8__(v152, 32) + v151;
        v157 = __ROR8__(v151, 48);
        v158 = __ROR8__(v154, 32) + (v156 ^ v157);
        v159 = v158 ^ __ROR8__(v156 ^ v157, 43);
        v160 = v155 + v156;
        *(_QWORD *)&v231[8] = v158;
        *(_QWORD *)&v231[16] = v160 ^ __ROR8__(v155, 47);
        *(_QWORD *)&v231[24] = __ROR8__(v160, 32);
        v232 = v159;
        *(_QWORD *)&v245[8] = *(_QWORD *)&v231[16] ^ v158 ^ *(_QWORD *)&v231[24] ^ v159;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)");
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v161, "handleFailureInFunction:file:lineNumber:description:", v162, CFSTR("MSVHasher+Algorithms.h"), 156, CFSTR("Cannot finalize unknown hasher algorithm"));

    }
    goto LABEL_181;
  }
  if (*(_QWORD *)v231 == 2000)
  {
    switch(v231[19])
    {
      case 1:
        v163 = v231[16];
        break;
      case 2:
        v163 = *(unsigned __int16 *)&v231[16];
        break;
      case 3:
        v163 = *(unsigned __int16 *)&v231[16] | (v231[18] << 16);
        break;
      default:
        v164 = *(_DWORD *)&v231[8];
        goto LABEL_180;
    }
    v164 = (461845907 * ((380141568 * v163) | ((-862048943 * v163) >> 17))) ^ *(_DWORD *)&v231[8];
LABEL_180:
    v165 = -2048144789 * (v164 ^ *(_DWORD *)&v231[12] ^ ((v164 ^ *(_DWORD *)&v231[12]) >> 16));
    *(_DWORD *)&v231[8] = (-1028477387 * (v165 ^ (v165 >> 13))) ^ ((-1028477387 * (v165 ^ (v165 >> 13))) >> 16);
    *(_DWORD *)&v245[8] = *(_DWORD *)&v231[8];
    goto LABEL_181;
  }
  if (*(_QWORD *)v231 == 3000)
    *(_DWORD *)&v245[8] = _MSV_XXH_XXH32_digest((uint64_t)&v231[8]);
LABEL_181:
  v246 = *(_OWORD *)v245;
  v247 = *(_OWORD *)&v245[16];
  v248 = *(_OWORD *)&v245[32];
  v249 = *(_OWORD *)&v245[48];
  v250 = *(_QWORD *)&v245[64];
  if (*(uint64_t *)v245 > 3999)
  {
    if (*(uint64_t *)v245 > 4255)
    {
      if (*(_QWORD *)v245 == 4256)
      {
        v207 = (unsigned __int8 *)&v246 + 8;
        v208 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v209 = v208;
        for (n = 0; n != 64; n += 2)
        {
          v211 = *v207++;
          v212 = &v208[n];
          *v212 = MSVFastHexStringFromBytes_hexCharacters_3379[(unint64_t)v211 >> 4];
          v212[1] = MSVFastHexStringFromBytes_hexCharacters_3379[v211 & 0xF];
        }
        v178 = objc_alloc(MEMORY[0x1E0CB3940]);
        v179 = v209;
        v180 = 64;
      }
      else
      {
        if (*(_QWORD *)v245 != 4512)
          goto LABEL_244;
        v185 = (unsigned __int8 *)&v246 + 8;
        v186 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v187 = v186;
        for (ii = 0; ii != 128; ii += 2)
        {
          v189 = *v185++;
          v190 = &v186[ii];
          *v190 = MSVFastHexStringFromBytes_hexCharacters_3379[(unint64_t)v189 >> 4];
          v190[1] = MSVFastHexStringFromBytes_hexCharacters_3379[v189 & 0xF];
        }
        v178 = objc_alloc(MEMORY[0x1E0CB3940]);
        v179 = v187;
        v180 = 128;
      }
    }
    else if (*(_QWORD *)v245 == 4000)
    {
      v197 = (unsigned __int8 *)&v246 + 8;
      v198 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v199 = v198;
      for (jj = 0; jj != 32; jj += 2)
      {
        v201 = *v197++;
        v202 = &v198[jj];
        *v202 = MSVFastHexStringFromBytes_hexCharacters_3379[(unint64_t)v201 >> 4];
        v202[1] = MSVFastHexStringFromBytes_hexCharacters_3379[v201 & 0xF];
      }
      v178 = objc_alloc(MEMORY[0x1E0CB3940]);
      v179 = v199;
      v180 = 32;
    }
    else
    {
      if (*(_QWORD *)v245 != 4001)
        goto LABEL_244;
      v172 = (unsigned __int8 *)&v246 + 8;
      v173 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      v174 = v173;
      for (kk = 0; kk != 40; kk += 2)
      {
        v176 = *v172++;
        v177 = &v173[kk];
        *v177 = MSVFastHexStringFromBytes_hexCharacters_3379[(unint64_t)v176 >> 4];
        v177[1] = MSVFastHexStringFromBytes_hexCharacters_3379[v176 & 0xF];
      }
      v178 = objc_alloc(MEMORY[0x1E0CB3940]);
      v179 = v174;
      v180 = 40;
    }
LABEL_225:
    v196 = (CFStringRef)objc_msgSend(v178, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v179, v180, 4, 1);
    goto LABEL_226;
  }
  if (*(uint64_t *)v245 > 2999)
  {
    if (*(_QWORD *)v245 == 3000)
    {
      LODWORD(v251[0]) = bswap32(DWORD2(v246));
      v203 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
      v204 = 0;
      v205 = v203 + 1;
      do
      {
        v206 = *((unsigned __int8 *)v251 + v204);
        *(v205 - 1) = MSVFastHexStringFromBytes_hexCharacters_3379[v206 >> 4];
        *v205 = MSVFastHexStringFromBytes_hexCharacters_3379[v206 & 0xF];
        v205 += 2;
        ++v204;
      }
      while (v204 != 4);
      v178 = objc_alloc(MEMORY[0x1E0CB3940]);
      v179 = v203;
      v180 = 8;
    }
    else
    {
      if (*(_QWORD *)v245 != 3001)
        goto LABEL_244;
      v251[0] = bswap64(*((unint64_t *)&v246 + 1));
      v181 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
      v182 = 0;
      v183 = v181 + 1;
      do
      {
        v184 = *((unsigned __int8 *)v251 + v182);
        *(v183 - 1) = MSVFastHexStringFromBytes_hexCharacters_3379[v184 >> 4];
        *v183 = MSVFastHexStringFromBytes_hexCharacters_3379[v184 & 0xF];
        v183 += 2;
        ++v182;
      }
      while (v182 != 8);
      v178 = objc_alloc(MEMORY[0x1E0CB3940]);
      v179 = v181;
      v180 = 16;
    }
    goto LABEL_225;
  }
  if (*(_QWORD *)v245 == 1000)
  {
    v191 = *((_QWORD *)&v246 + 1);
    v192 = (char *)v252 + 1;
    v193 = *((_QWORD *)&v246 + 1);
    do
    {
      v194 = lldiv(v193, 10);
      v193 = v194.quot;
      if (v194.rem >= 0)
        LOBYTE(v195) = v194.rem;
      else
        v195 = -v194.rem;
      *(v192 - 2) = v195 + 48;
      v171 = (const UInt8 *)(v192 - 2);
      --v192;
    }
    while (v194.quot);
    if (v191 < 0)
    {
      *(v192 - 2) = 45;
      v171 = (const UInt8 *)(v192 - 2);
    }
    v170 = (char *)((char *)v252 - (char *)v171);
    goto LABEL_215;
  }
  if (*(_QWORD *)v245 != 2000)
  {
LABEL_244:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v225 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull _MSVHashGetDigest(MSVHash)");
    v226 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v225, "handleFailureInFunction:file:lineNumber:description:", v226, CFSTR("MSVHasher+Algorithms.h"), 356, CFSTR("Cannot obtain digest from unknown hasher algorithm"));

    v213 = &stru_1E43EA7B0;
    goto LABEL_227;
  }
  v166 = DWORD2(v246);
  v167 = v252;
  do
  {
    v168 = ldiv(v166, 10);
    v166 = v168.quot;
    if (v168.rem >= 0)
      LOBYTE(v169) = v168.rem;
    else
      v169 = -v168.rem;
    *((_BYTE *)v167 - 1) = v169 + 48;
    v167 = (_QWORD *)((char *)v167 - 1);
  }
  while (v168.quot);
  v170 = (char *)((char *)v252 - (char *)v167);
  v171 = (const UInt8 *)v167;
LABEL_215:
  v196 = CFStringCreateWithBytes(0, v171, (CFIndex)v170, 0x8000100u, 0);
LABEL_226:
  v213 = (__CFString *)v196;
LABEL_227:

  v214 = os_log_create("com.apple.amp.MediaServices", "SQL");
  if (os_log_type_enabled(v214, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v231 = 138543874;
    *(_QWORD *)&v231[4] = v213;
    *(_WORD *)&v231[12] = 2048;
    *(_QWORD *)&v231[14] = self;
    *(_WORD *)&v231[22] = 2114;
    *(_QWORD *)&v231[24] = v9;
    _os_log_impl(&dword_1A077D000, v214, OS_LOG_TYPE_INFO, "[SQL:%{public}@:%p] statementWithString:… | creating mutable connection [mutating sql statement] statement=%{public}@", v231, 0x20u);
  }

  v229 = 0;
  -[_MSVSQLConnection mutableCloneWithError:](self, (uint64_t)&v229);
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  v216 = v229;
  v217 = os_log_create("com.apple.amp.MediaServices", "SQL");
  v218 = v217;
  if (v215)
  {
    if (os_log_type_enabled(v217, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v231 = 138543618;
      *(_QWORD *)&v231[4] = v213;
      *(_WORD *)&v231[12] = 2048;
      *(_QWORD *)&v231[14] = self;
      _os_log_impl(&dword_1A077D000, v218, OS_LOG_TYPE_INFO, "[SQL:%{public}@:%p] statementWithString:… | creating implicit transaction [mutating sql statement]", v231, 0x16u);
    }

    v219 = [MSVSQLDatabaseTransaction alloc];
    objc_msgSend(CFSTR("Implicit-"), "stringByAppendingString:", v213);
    v220 = (void *)objc_claimAutoreleasedReturnValue();
    v228 = 0;
    v221 = -[MSVSQLDatabaseTransaction initWithConnection:name:error:]((__CFString *)v219, v215, v220, &v228);
    v222 = v228;

    if (v221)
    {
      -[__CFString statementWithString:error:](v221, "statementWithString:error:", v9, a4);
      v223 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v223;
      if (v223)
        objc_storeStrong((id *)(v223 + 24), v221);
    }
    else
    {
      _MSVLogCategorySQL();
      v224 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v224, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v231 = 138543874;
        *(_QWORD *)&v231[4] = v213;
        *(_WORD *)&v231[12] = 2048;
        *(_QWORD *)&v231[14] = self;
        *(_WORD *)&v231[22] = 2114;
        *(_QWORD *)&v231[24] = v222;
        _os_log_impl(&dword_1A077D000, v224, OS_LOG_TYPE_ERROR, "[SQL:%{public}@:%p] statementWithString:… | failed to create implicit transaction [] error=%{public}@", v231, 0x20u);
      }

      v21 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v222);
    }

  }
  else
  {
    if (os_log_type_enabled(v217, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v231 = 138543874;
      *(_QWORD *)&v231[4] = v213;
      *(_WORD *)&v231[12] = 2048;
      *(_QWORD *)&v231[14] = self;
      *(_WORD *)&v231[22] = 2114;
      *(_QWORD *)&v231[24] = v216;
      _os_log_impl(&dword_1A077D000, v218, OS_LOG_TYPE_ERROR, "[SQL:%{public}@:%p] statementWithString:… | failed to create mutable connection [] error=%{public}@", v231, 0x20u);
    }

    v21 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v216);
  }

LABEL_145:
  return v21;
}

- (_QWORD)mutableCloneWithError:(_QWORD *)a1
{
  if (a1)
  {
    objc_msgSend(a1, "_cloneWithOptions:error:", a1[2] | 1, a2);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)_cloneWithOptions:(unint64_t)a3 error:(id *)a4
{
  _MSVSQLConnection *v7;
  NSString *databaseURI;
  char *v9;
  id v10;
  void *v11;
  char *v12;
  NSMutableDictionary *attachedDatabases;
  char *v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  char *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  id v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = [_MSVSQLConnection alloc];
  databaseURI = self->_databaseURI;
  v42 = 0;
  v9 = -[_MSVSQLConnection initWithDatabaseURI:options:error:]((char *)v7, databaseURI, a3, &v42);
  v10 = v42;
  v11 = v10;
  if (v10)
  {
    v12 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v10);
  }
  else
  {
    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__3372;
    v40 = __Block_byref_object_dispose__3373;
    v41 = 0;
    attachedDatabases = self->_attachedDatabases;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __45___MSVSQLConnection__cloneWithOptions_error___block_invoke;
    v33[3] = &unk_1E43E95C8;
    v14 = v9;
    v34 = v14;
    v35 = &v36;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](attachedDatabases, "enumerateKeysAndObjectsUsingBlock:", v33);
    v15 = (void *)v37[5];
    if (v15)
    {
      v12 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v15);
    }
    else
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v16 = self->_scalarFunctions;
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v29, v44, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v30 != v18)
              objc_enumerationMutation(v16);
            objc_msgSend(v14, "_registerScalarFunctionDescriptor:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
          }
          v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v29, v44, 16);
        }
        while (v17);
      }

      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v20 = self->_aggregateFunctions;
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v43, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v26;
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v26 != v22)
              objc_enumerationMutation(v20);
            objc_msgSend(v14, "_registerAggregateFunctionDescriptor:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j), (_QWORD)v25);
          }
          v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v43, 16);
        }
        while (v21);
      }

      v12 = v14;
    }

    _Block_object_dispose(&v36, 8);
  }

  return v12;
}

- (char)initWithDatabaseURI:(uint64_t)a3 options:(_QWORD *)a4 error:
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  unint64_t v17;
  id v18;
  id v19;
  _BYTE *v20;
  uint64_t v21;
  int v22;
  int v23;
  _BYTE *v24;
  void *v25;
  void *v26;
  __int16 v27;
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
  int *v58;
  int v59;
  void *v60;
  void *v61;
  int v62;
  unsigned int v63;
  unint64_t v64;
  int v65;
  unint64_t v66;
  int v67;
  unint64_t v68;
  unsigned int v69;
  unsigned int v70;
  unsigned int v71;
  unsigned int v72;
  uint64_t v73;
  _QWORD *v74;
  ldiv_t v75;
  uint64_t v76;
  char *v77;
  const UInt8 *v78;
  unsigned __int8 *v79;
  char *v80;
  char *v81;
  uint64_t m;
  unsigned int v83;
  char *v84;
  id v85;
  char *v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  _BYTE *v90;
  unint64_t v91;
  unsigned __int8 *v92;
  char *v93;
  char *v94;
  uint64_t j;
  unsigned int v96;
  char *v97;
  uint64_t v98;
  char *v99;
  uint64_t quot;
  lldiv_t v101;
  uint64_t v102;
  CFStringRef v103;
  unsigned __int8 *v104;
  char *v105;
  char *v106;
  uint64_t k;
  unsigned int v108;
  char *v109;
  char *v110;
  uint64_t v111;
  _BYTE *v112;
  unint64_t v113;
  unsigned __int8 *v114;
  char *v115;
  char *v116;
  uint64_t i;
  unsigned int v118;
  char *v119;
  __CFString *v120;
  NSObject *v121;
  sqlite3 **v122;
  int v123;
  NSObject *v124;
  int v125;
  NSObject *v126;
  void *v127;
  void *v128;
  NSObject *v129;
  NSObject *v130;
  char *v131;
  NSObject *v132;
  void *v134;
  void *v135;
  _QWORD *v136;
  objc_super v137;
  _BYTE buf[32];
  __int128 v139;
  __int128 v140;
  __int128 v141;
  uint64_t v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  _BYTE v151[72];
  _OWORD v152[4];
  uint64_t v153;
  _QWORD v154[3];
  _QWORD v155[3];

  v155[0] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (a1)
  {
    v137.receiver = a1;
    v137.super_class = (Class)_MSVSQLConnection;
    a1 = (char *)objc_msgSendSuper2(&v137, sel_init);
    if (a1)
    {
      v136 = a4;
      v8 = objc_msgSend(v7, "copy");
      v9 = (void *)*((_QWORD *)a1 + 7);
      *((_QWORD *)a1 + 7) = v8;

      *((_QWORD *)a1 + 2) = a3;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)*((_QWORD *)a1 + 3);
      *((_QWORD *)a1 + 3) = v10;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)*((_QWORD *)a1 + 4);
      *((_QWORD *)a1 + 4) = v12;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)*((_QWORD *)a1 + 5);
      *((_QWORD *)a1 + 5) = v14;

      if ((a3 & 1) != 0)
        v16 = 33554434;
      else
        v16 = 33554433;
      v17 = MSVHasherSharedSeed();
      v18 = v7;
      v150 = 0u;
      v149 = 0u;
      v148 = 0u;
      v147 = 0u;
      v146 = 0u;
      v145 = 0u;
      v144 = 0u;
      v143 = 0u;
      *(_OWORD *)buf = xmmword_1A07D4D30;
      *(int64x2_t *)&buf[16] = vaddq_s64(vdupq_n_s64(v17), (int64x2_t)xmmword_1A07D4D40);
      *(_QWORD *)&v139 = v17;
      *((_QWORD *)&v139 + 1) = v17 + 0x61C8864E7A143579;
      v140 = 0u;
      v141 = 0u;
      v142 = 0;
      v19 = objc_retainAutorelease(v18);
      v20 = (_BYTE *)objc_msgSend(v19, "UTF8String");
      v21 = objc_msgSend(v19, "length");
      v22 = v21;
      if (*(uint64_t *)buf > 3999)
      {
        if (*(uint64_t *)buf > 4255)
        {
          if (*(_QWORD *)buf == 4256)
          {
            CC_SHA256_Update((CC_SHA256_CTX *)&buf[8], v20, v21);
          }
          else if (*(_QWORD *)buf == 4512)
          {
            CC_SHA512_Update((CC_SHA512_CTX *)&buf[8], v20, v21);
          }
        }
        else if (*(_QWORD *)buf == 4000)
        {
          CC_MD5_Update((CC_MD5_CTX *)&buf[8], v20, v21);
        }
        else if (*(_QWORD *)buf == 4001)
        {
          CC_SHA1_Update((CC_SHA1_CTX *)&buf[8], v20, v21);
        }
      }
      else if (*(uint64_t *)buf > 2999)
      {
        if (*(_QWORD *)buf == 3000)
        {
          _MSV_XXH_XXH32_update(&buf[8], v20, v21);
        }
        else if (*(_QWORD *)buf == 3001)
        {
          _MSV_XXH_XXH64_update(&buf[8], v20, v21);
        }
      }
      else if (*(_QWORD *)buf)
      {
        if (*(_QWORD *)buf == 2000)
        {
          v23 = (((v21 + buf[19]) & 3) - buf[19]);
          v24 = &buf[buf[19] + 16];
          switch(v23)
          {
            case 0:
              break;
            case 1:
              *v24 = *v20;
              break;
            case 2:
              v27 = *(_WORD *)v20;
              goto LABEL_29;
            case 3:
              v27 = *(_WORD *)v20;
              v24[2] = v20[2];
LABEL_29:
              *(_WORD *)v24 = v27;
              break;
            default:
              memcpy(v24, v20, (((v22 + buf[19]) & 3) - buf[19]));
              break;
          }
          *(_DWORD *)&buf[12] += v22;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasherAppendBytes(MSVHasher * _Nonnull, const void * _Nonnull, size_t)");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("MSVHasher+Algorithms.h"), 262, CFSTR("Cannot append to unknown hasher algorithm"));

      }
      memset(&v151[8], 0, 64);
      *(_QWORD *)v151 = *(_QWORD *)buf;
      if (*(uint64_t *)buf > 3000)
      {
        if (*(uint64_t *)buf <= 4000)
        {
          if (*(_QWORD *)buf == 3001)
          {
            *(_QWORD *)&v151[8] = _MSV_XXH_XXH64_digest(&buf[8]);
          }
          else if (*(_QWORD *)buf == 4000)
          {
            CC_MD5_Final(&v151[8], (CC_MD5_CTX *)&buf[8]);
          }
        }
        else
        {
          switch(*(_QWORD *)buf)
          {
            case 0xFA1:
              CC_SHA1_Final(&v151[8], (CC_SHA1_CTX *)&buf[8]);
              break;
            case 0x10A0:
              CC_SHA256_Final(&v151[8], (CC_SHA256_CTX *)&buf[8]);
              break;
            case 0x11A0:
              CC_SHA512_Final(&v151[8], (CC_SHA512_CTX *)&buf[8]);
              break;
          }
        }
        goto LABEL_68;
      }
      if (*(uint64_t *)buf <= 1999)
      {
        if (*(_QWORD *)buf)
        {
          if (*(_QWORD *)buf == 1000)
          {
            v28 = (*(_QWORD *)&buf[8] + *(_QWORD *)&buf[16]) ^ __ROR8__(*(_QWORD *)&buf[16], 51);
            v29 = *(_QWORD *)&buf[24] + (v139 ^ *((_QWORD *)&v139 + 1));
            v30 = __ROR8__(v139 ^ *((_QWORD *)&v139 + 1), 48);
            v31 = (v29 ^ v30) + __ROR8__(*(_QWORD *)&buf[8] + *(_QWORD *)&buf[16], 32);
            v32 = v31 ^ __ROR8__(v29 ^ v30, 43);
            v33 = v29 + v28;
            v34 = v33 ^ __ROR8__(v28, 47);
            v35 = (v31 ^ *((_QWORD *)&v139 + 1)) + v34;
            v36 = v35 ^ __ROR8__(v34, 51);
            v37 = (__ROR8__(v33, 32) ^ 0xFFLL) + v32;
            v38 = __ROR8__(v32, 48);
            v39 = __ROR8__(v35, 32) + (v37 ^ v38);
            v40 = v39 ^ __ROR8__(v37 ^ v38, 43);
            v41 = v36 + v37;
            v42 = v41 ^ __ROR8__(v36, 47);
            v43 = v42 + v39;
            v44 = v43 ^ __ROR8__(v42, 51);
            v45 = __ROR8__(v41, 32) + v40;
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
            *(_QWORD *)&buf[8] = v55;
            *(_QWORD *)&buf[16] = v57 ^ __ROR8__(v52, 47);
            *(_QWORD *)&buf[24] = __ROR8__(v57, 32);
            *(_QWORD *)&v139 = v56;
            *(_QWORD *)&v151[8] = *(_QWORD *)&buf[16] ^ v55 ^ *(_QWORD *)&buf[24] ^ v56;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "handleFailureInFunction:file:lineNumber:description:", v61, CFSTR("MSVHasher+Algorithms.h"), 156, CFSTR("Cannot finalize unknown hasher algorithm"));

        }
LABEL_68:
        v152[0] = *(_OWORD *)v151;
        v152[1] = *(_OWORD *)&v151[16];
        v152[2] = *(_OWORD *)&v151[32];
        v152[3] = *(_OWORD *)&v151[48];
        v153 = *(_QWORD *)&v151[64];
        if (*(uint64_t *)v151 > 3999)
        {
          if (*(uint64_t *)v151 > 4255)
          {
            if (*(_QWORD *)v151 == 4256)
            {
              v114 = (unsigned __int8 *)v152 + 8;
              v115 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
              v116 = v115;
              for (i = 0; i != 64; i += 2)
              {
                v118 = *v114++;
                v119 = &v115[i];
                *v119 = MSVFastHexStringFromBytes_hexCharacters_3379[(unint64_t)v118 >> 4];
                v119[1] = MSVFastHexStringFromBytes_hexCharacters_3379[v118 & 0xF];
              }
              v85 = objc_alloc(MEMORY[0x1E0CB3940]);
              v86 = v116;
              v87 = 64;
            }
            else
            {
              if (*(_QWORD *)v151 != 4512)
                goto LABEL_139;
              v92 = (unsigned __int8 *)v152 + 8;
              v93 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
              v94 = v93;
              for (j = 0; j != 128; j += 2)
              {
                v96 = *v92++;
                v97 = &v93[j];
                *v97 = MSVFastHexStringFromBytes_hexCharacters_3379[(unint64_t)v96 >> 4];
                v97[1] = MSVFastHexStringFromBytes_hexCharacters_3379[v96 & 0xF];
              }
              v85 = objc_alloc(MEMORY[0x1E0CB3940]);
              v86 = v94;
              v87 = 128;
            }
          }
          else if (*(_QWORD *)v151 == 4000)
          {
            v104 = (unsigned __int8 *)v152 + 8;
            v105 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
            v106 = v105;
            for (k = 0; k != 32; k += 2)
            {
              v108 = *v104++;
              v109 = &v105[k];
              *v109 = MSVFastHexStringFromBytes_hexCharacters_3379[(unint64_t)v108 >> 4];
              v109[1] = MSVFastHexStringFromBytes_hexCharacters_3379[v108 & 0xF];
            }
            v85 = objc_alloc(MEMORY[0x1E0CB3940]);
            v86 = v106;
            v87 = 32;
          }
          else
          {
            if (*(_QWORD *)v151 != 4001)
              goto LABEL_139;
            v79 = (unsigned __int8 *)v152 + 8;
            v80 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
            v81 = v80;
            for (m = 0; m != 40; m += 2)
            {
              v83 = *v79++;
              v84 = &v80[m];
              *v84 = MSVFastHexStringFromBytes_hexCharacters_3379[(unint64_t)v83 >> 4];
              v84[1] = MSVFastHexStringFromBytes_hexCharacters_3379[v83 & 0xF];
            }
            v85 = objc_alloc(MEMORY[0x1E0CB3940]);
            v86 = v81;
            v87 = 40;
          }
        }
        else
        {
          if (*(uint64_t *)v151 <= 2999)
          {
            if (*(_QWORD *)v151 == 1000)
            {
              v98 = *((_QWORD *)&v152[0] + 1);
              v99 = (char *)v155 + 1;
              quot = *((_QWORD *)&v152[0] + 1);
              do
              {
                v101 = lldiv(quot, 10);
                quot = v101.quot;
                if (v101.rem >= 0)
                  LOBYTE(v102) = v101.rem;
                else
                  v102 = -v101.rem;
                *(v99 - 2) = v102 + 48;
                v78 = (const UInt8 *)(v99 - 2);
                --v99;
              }
              while (v101.quot);
              if (v98 < 0)
              {
                *(v99 - 2) = 45;
                v78 = (const UInt8 *)(v99 - 2);
              }
              v77 = (char *)((char *)v155 - (char *)v78);
              goto LABEL_102;
            }
            if (*(_QWORD *)v151 == 2000)
            {
              v73 = DWORD2(v152[0]);
              v74 = v155;
              do
              {
                v75 = ldiv(v73, 10);
                v73 = v75.quot;
                if (v75.rem >= 0)
                  LOBYTE(v76) = v75.rem;
                else
                  v76 = -v75.rem;
                *((_BYTE *)v74 - 1) = v76 + 48;
                v74 = (_QWORD *)((char *)v74 - 1);
              }
              while (v75.quot);
              v77 = (char *)((char *)v155 - (char *)v74);
              v78 = (const UInt8 *)v74;
LABEL_102:
              v103 = CFStringCreateWithBytes(0, v78, (CFIndex)v77, 0x8000100u, 0);
LABEL_113:
              v120 = (__CFString *)v103;
              goto LABEL_114;
            }
LABEL_139:
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v134 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull _MSVHashGetDigest(MSVHash)");
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v134, "handleFailureInFunction:file:lineNumber:description:", v135, CFSTR("MSVHasher+Algorithms.h"), 356, CFSTR("Cannot obtain digest from unknown hasher algorithm"));

            v120 = &stru_1E43EA7B0;
LABEL_114:

            v121 = os_log_create("com.apple.amp.MediaServices", "SQL");
            if (os_log_type_enabled(v121, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138544130;
              *(_QWORD *)&buf[4] = v120;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = a1;
              *(_WORD *)&buf[22] = 2114;
              *(_QWORD *)&buf[24] = v19;
              LOWORD(v139) = 2048;
              *(_QWORD *)((char *)&v139 + 2) = a3;
              _os_log_impl(&dword_1A077D000, v121, OS_LOG_TYPE_INFO, "[SQL:%{public}@:%p] initWithDatabaseURI:%{public}@ options:%lu… | opening database", buf, 0x2Au);
            }

            v122 = (sqlite3 **)(a1 + 8);
            v123 = OpenSQLiteConnection(v19, (sqlite3 **)a1 + 1, v16);
            v124 = os_log_create("com.apple.amp.MediaServices", "SQL");
            if (os_log_type_enabled(v124, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138544386;
              *(_QWORD *)&buf[4] = v120;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = a1;
              *(_WORD *)&buf[22] = 2114;
              *(_QWORD *)&buf[24] = v19;
              LOWORD(v139) = 2048;
              *(_QWORD *)((char *)&v139 + 2) = a3;
              WORD5(v139) = 1024;
              HIDWORD(v139) = v123;
              _os_log_impl(&dword_1A077D000, v124, OS_LOG_TYPE_INFO, "[SQL:%{public}@:%p] initWithDatabaseURI:%{public}@ options:%lu… | opening database [] result=%d", buf, 0x30u);
            }

            if (!v123)
            {
              sqlite3_busy_timeout(*v122, 1000);
              sqlite3_exec(*v122, "PRAGMA journal_mode=WAL", 0, 0, 0);
LABEL_137:

              goto LABEL_138;
            }
            v125 = OpenSQLiteConnection(v19, (sqlite3 **)a1 + 1, 33554438);
            v126 = os_log_create("com.apple.amp.MediaServices", "SQL");
            if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138544386;
              *(_QWORD *)&buf[4] = v120;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = a1;
              *(_WORD *)&buf[22] = 2114;
              *(_QWORD *)&buf[24] = v19;
              LOWORD(v139) = 2048;
              *(_QWORD *)((char *)&v139 + 2) = a3;
              WORD5(v139) = 1024;
              HIDWORD(v139) = v125;
              _os_log_impl(&dword_1A077D000, v126, OS_LOG_TYPE_INFO, "[SQL:%{public}@:%p] initWithDatabaseURI:%{public}@ options:%lu… | opening database for creation [failed readonly open] result=%d", buf, 0x30u);
            }

            if (v125)
            {
              -[_MSVSQLConnection lastError]((sqlite3 **)a1);
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              v128 = v127;
              if (v136)
                *v136 = objc_retainAutorelease(v127);
              v129 = os_log_create("com.apple.amp.MediaServices", "SQL");
              if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138544642;
                *(_QWORD *)&buf[4] = v120;
                *(_WORD *)&buf[12] = 2048;
                *(_QWORD *)&buf[14] = a1;
                *(_WORD *)&buf[22] = 2114;
                *(_QWORD *)&buf[24] = v19;
                LOWORD(v139) = 2048;
                *(_QWORD *)((char *)&v139 + 2) = a3;
                WORD5(v139) = 1024;
                HIDWORD(v139) = v125;
                LOWORD(v140) = 2114;
                *(_QWORD *)((char *)&v140 + 2) = v128;
                _os_log_impl(&dword_1A077D000, v129, OS_LOG_TYPE_ERROR, "[SQL:%{public}@:%p] initWithDatabaseURI:%{public}@ options:%lu… | failed opening database [failed create open] result=%d error=%{public}@", buf, 0x3Au);
              }

            }
            else
            {
              if ((a3 & 1) == 0)
              {
                sqlite3_exec(*v122, "PRAGMA journal_mode=WAL", 0, 0, 0);
                sqlite3_close(*v122);
                *v122 = 0;
                v130 = os_log_create("com.apple.amp.MediaServices", "SQL");
                if (os_log_type_enabled(v130, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138544130;
                  *(_QWORD *)&buf[4] = v120;
                  *(_WORD *)&buf[12] = 2048;
                  *(_QWORD *)&buf[14] = a1;
                  *(_WORD *)&buf[22] = 2114;
                  *(_QWORD *)&buf[24] = v19;
                  LOWORD(v139) = 2048;
                  *(_QWORD *)((char *)&v139 + 2) = a3;
                  _os_log_impl(&dword_1A077D000, v130, OS_LOG_TYPE_INFO, "[SQL:%{public}@:%p] initWithDatabaseURI:%{public}@ options:%lu… | re-opening database disallowing creation [need read-only connection]", buf, 0x2Au);
                }

                a1 = (char *)(id)-[_MSVSQLConnection initWithDatabaseURI:options:error:](a1, v19, a3, v136);
                v131 = a1;
                goto LABEL_136;
              }
              v132 = os_log_create("com.apple.amp.MediaServices", "SQL");
              if (os_log_type_enabled(v132, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138544130;
                *(_QWORD *)&buf[4] = v120;
                *(_WORD *)&buf[12] = 2048;
                *(_QWORD *)&buf[14] = a1;
                *(_WORD *)&buf[22] = 2114;
                *(_QWORD *)&buf[24] = v19;
                LOWORD(v139) = 2048;
                *(_QWORD *)((char *)&v139 + 2) = a3;
                _os_log_impl(&dword_1A077D000, v132, OS_LOG_TYPE_INFO, "[SQL:%{public}@:%p] initWithDatabaseURI:%{public}@ options:%lu… | using created database [mutation allowed]", buf, 0x2Au);
              }

            }
            v131 = 0;
LABEL_136:

            v120 = (__CFString *)a1;
            a1 = v131;
            goto LABEL_137;
          }
          if (*(_QWORD *)v151 == 3000)
          {
            LODWORD(v154[0]) = bswap32(DWORD2(v152[0]));
            v110 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
            v111 = 0;
            v112 = v110 + 1;
            do
            {
              v113 = *((unsigned __int8 *)v154 + v111);
              *(v112 - 1) = MSVFastHexStringFromBytes_hexCharacters_3379[v113 >> 4];
              *v112 = MSVFastHexStringFromBytes_hexCharacters_3379[v113 & 0xF];
              v112 += 2;
              ++v111;
            }
            while (v111 != 4);
            v85 = objc_alloc(MEMORY[0x1E0CB3940]);
            v86 = v110;
            v87 = 8;
          }
          else
          {
            if (*(_QWORD *)v151 != 3001)
              goto LABEL_139;
            v154[0] = bswap64(*((unint64_t *)&v152[0] + 1));
            v88 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
            v89 = 0;
            v90 = v88 + 1;
            do
            {
              v91 = *((unsigned __int8 *)v154 + v89);
              *(v90 - 1) = MSVFastHexStringFromBytes_hexCharacters_3379[v91 >> 4];
              *v90 = MSVFastHexStringFromBytes_hexCharacters_3379[v91 & 0xF];
              v90 += 2;
              ++v89;
            }
            while (v89 != 8);
            v85 = objc_alloc(MEMORY[0x1E0CB3940]);
            v86 = v88;
            v87 = 16;
          }
        }
        v103 = (CFStringRef)objc_msgSend(v85, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v86, v87, 4, 1);
        goto LABEL_113;
      }
      if (*(_QWORD *)buf != 2000)
      {
        if (*(_QWORD *)buf != 3000)
          goto LABEL_68;
        v58 = (int *)&v139;
        if (*(_DWORD *)&buf[12])
          v59 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)&buf[16], (uint32x4_t)xmmword_1A07D4D20), (int8x16_t)vshlq_u32(*(uint32x4_t *)&buf[16], (uint32x4_t)xmmword_1A07D4D10)));
        else
          v59 = *(_DWORD *)&buf[24] + 374761393;
        v63 = *(_DWORD *)&buf[8] + v59;
        v64 = v140 & 0xF;
        if (v64 >= 4)
        {
          do
          {
            v65 = *v58++;
            HIDWORD(v66) = v63 - 1028477379 * v65;
            LODWORD(v66) = HIDWORD(v66);
            v63 = 668265263 * (v66 >> 15);
            v64 -= 4;
          }
          while (v64 > 3);
        }
        for (; v64; --v64)
        {
          v67 = *(unsigned __int8 *)v58;
          v58 = (int *)((char *)v58 + 1);
          HIDWORD(v68) = v63 + 374761393 * v67;
          LODWORD(v68) = HIDWORD(v68);
          v63 = -1640531535 * (v68 >> 21);
        }
        v69 = -1028477379 * ((-2048144777 * (v63 ^ (v63 >> 15))) ^ ((-2048144777 * (v63 ^ (v63 >> 15))) >> 13));
        v70 = v69 ^ HIWORD(v69);
        goto LABEL_67;
      }
      switch(buf[19])
      {
        case 1:
          v62 = buf[16];
          break;
        case 2:
          v62 = *(unsigned __int16 *)&buf[16];
          break;
        case 3:
          v62 = *(unsigned __int16 *)&buf[16] | (buf[18] << 16);
          break;
        default:
          v71 = *(_DWORD *)&buf[8];
          goto LABEL_66;
      }
      v71 = (461845907 * ((380141568 * v62) | ((-862048943 * v62) >> 17))) ^ *(_DWORD *)&buf[8];
LABEL_66:
      v72 = -2048144789 * (v71 ^ *(_DWORD *)&buf[12] ^ ((v71 ^ *(_DWORD *)&buf[12]) >> 16));
      v70 = (-1028477387 * (v72 ^ (v72 >> 13))) ^ ((-1028477387 * (v72 ^ (v72 >> 13))) >> 16);
      *(_DWORD *)&buf[8] = v70;
LABEL_67:
      *(_DWORD *)&v151[8] = v70;
      goto LABEL_68;
    }
  }
LABEL_138:

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseURI, 0);
  objc_storeStrong((id *)&self->_aggregateFunctions, 0);
  objc_storeStrong((id *)&self->_scalarFunctions, 0);
  objc_storeStrong((id *)&self->_attachedDatabases, 0);
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_invalid)
  {
    self->_invalid = 1;
    sqlite3_close(self->_connectionHandle);
    self->_connectionHandle = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)_MSVSQLConnection;
  -[_MSVSQLConnection dealloc](&v3, sel_dealloc);
}

- (id)resultsForStatement:(id)a3
{
  id v5;
  id *v6;
  void *v8;

  v5 = a3;
  if (self->_invalid)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 1249, CFSTR("Attempt to use invalidated connection."));

  }
  v6 = -[MSVSQLRowEnumerator initWithStatement:]((id *)[MSVSQLRowEnumerator alloc], v5);

  return v6;
}

- (void)registerFunctionNamed:(id)a3 arguments:(int64_t)a4 options:(unint64_t)a5 block:(id)a6
{
  id v9;
  _MSVSQLDatabaseScalarFunctionDescriptor *v10;
  const char *v11;
  _MSVSQLDatabaseScalarFunctionDescriptor *v12;
  SEL v13;
  id newValue;

  newValue = a3;
  v9 = a6;
  v10 = objc_alloc_init(_MSVSQLDatabaseScalarFunctionDescriptor);
  v12 = v10;
  if (v10)
  {
    objc_setProperty_nonatomic_copy(v10, v11, newValue, 8);
    v12->super._options = a5;
    objc_setProperty_nonatomic_copy(v12, v13, v9, 32);
  }
  -[_MSVSQLConnection _registerScalarFunctionDescriptor:](self, "_registerScalarFunctionDescriptor:", v12);

}

- (void)_registerScalarFunctionDescriptor:(id)a3
{
  _QWORD *v4;
  sqlite3 *connectionHandle;
  _QWORD *v6;
  const char *v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  unsigned int v12;
  void *v13;
  _DWORD *v14;

  v4 = a3;
  connectionHandle = self->_connectionHandle;
  v14 = v4;
  if (v4)
    v4 = (_QWORD *)v4[1];
  v6 = objc_retainAutorelease(v4);
  v7 = (const char *)objc_msgSend(v6, "UTF8String");
  if (v14)
  {
    v8 = v14[4];
    v9 = *((_QWORD *)v14 + 3);
    if ((v9 & 1) != 0)
      v10 = 2049;
    else
      v10 = 1;
    if ((v9 & 2) != 0)
      v11 = v10;
    else
      v11 = v10 | 0x80000;
    v12 = v11 & 0xFFDFFFFF | (((v9 >> 2) & 1) << 21);
    v13 = (void *)*((_QWORD *)v14 + 4);
  }
  else
  {
    v12 = 0;
    v8 = 0;
    v13 = 0;
  }
  sqlite3_create_function_v2(connectionHandle, v7, v8, v12, v13, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))_scalarFunctionImplementation, 0, 0, _MSVSQLBridgeDestroy);

  -[NSMutableArray addObject:](self->_scalarFunctions, "addObject:", v14);
}

- (void)unregisterFunctionNamed:(id)a3 arguments:(int64_t)a4
{
  id v6;
  sqlite3 *connectionHandle;
  id v8;
  NSMutableArray *scalarFunctions;
  uint64_t v10;
  id v11;
  void *v12;
  NSMutableArray *aggregateFunctions;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  int64_t v18;
  _QWORD v19[4];
  id v20;
  int64_t v21;

  v6 = a3;
  connectionHandle = self->_connectionHandle;
  v8 = objc_retainAutorelease(v6);
  sqlite3_create_function_v2(connectionHandle, (const char *)objc_msgSend(v8, "UTF8String"), a4, 1, 0, 0, 0, 0, 0);
  scalarFunctions = self->_scalarFunctions;
  v10 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __55___MSVSQLConnection_unregisterFunctionNamed_arguments___block_invoke;
  v19[3] = &unk_1E43E9578;
  v11 = v8;
  v20 = v11;
  v21 = a4;
  -[NSMutableArray indexesOfObjectsPassingTest:](scalarFunctions, "indexesOfObjectsPassingTest:", v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectsAtIndexes:](self->_scalarFunctions, "removeObjectsAtIndexes:", v12);
  aggregateFunctions = self->_aggregateFunctions;
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __55___MSVSQLConnection_unregisterFunctionNamed_arguments___block_invoke_2;
  v16[3] = &unk_1E43E95A0;
  v17 = v11;
  v18 = a4;
  v15 = v11;
  -[NSMutableArray indexesOfObjectsPassingTest:](aggregateFunctions, "indexesOfObjectsPassingTest:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectsAtIndexes:](self->_aggregateFunctions, "removeObjectsAtIndexes:", v14);

}

- (void)registerAggregateFunctionNamed:(id)a3 arguments:(int64_t)a4 options:(unint64_t)a5 start:(id)a6 add:(id)a7 remove:(id)a8 value:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  _MSVSQLDatabaseAggregateFunctionDescriptor *v18;
  void *v19;
  const char *v20;
  SEL v21;
  SEL v22;
  SEL v23;
  SEL v24;
  id newValue;

  newValue = a6;
  v14 = a7;
  v15 = a8;
  v16 = a9;
  v17 = a3;
  v18 = objc_alloc_init(_MSVSQLDatabaseAggregateFunctionDescriptor);
  v19 = (void *)objc_msgSend(v17, "copy");

  if (v18)
  {
    objc_setProperty_nonatomic_copy(v18, v20, v19, 8);

    v18->super._numberOfArguments = a4;
    objc_setProperty_nonatomic_copy(v18, v21, newValue, 32);
    objc_setProperty_nonatomic_copy(v18, v22, v14, 40);
    objc_setProperty_nonatomic_copy(v18, v23, v15, 48);
    objc_setProperty_nonatomic_copy(v18, v24, v16, 56);
  }
  else
  {

  }
  -[_MSVSQLConnection _registerAggregateFunctionDescriptor:](self, "_registerAggregateFunctionDescriptor:", v18);

}

- (void)_registerAggregateFunctionDescriptor:(id)a3
{
  _DWORD *v4;
  sqlite3 *connectionHandle;
  void *v6;
  id v7;
  const char *v8;
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  unsigned int v13;
  id *v14;
  id v15;
  void (__cdecl *v16)(sqlite3_context *);
  id v17;
  void (__cdecl *xInverse)(sqlite3_context *, int, sqlite3_value **);
  _DWORD *pApp;

  v4 = a3;
  connectionHandle = self->_connectionHandle;
  pApp = v4;
  if (v4)
    v6 = (void *)*((_QWORD *)v4 + 1);
  else
    v6 = 0;
  v7 = objc_retainAutorelease(v6);
  v8 = (const char *)objc_msgSend(v7, "UTF8String");
  if (pApp)
  {
    v9 = pApp[4];
    v10 = *((_QWORD *)pApp + 3);
    if ((v10 & 1) != 0)
      v11 = 2049;
    else
      v11 = 1;
    if ((v10 & 2) != 0)
      v12 = v11;
    else
      v12 = v11 | 0x80000;
    v13 = v12 & 0xFFDFFFFF | (((v10 >> 2) & 1) << 21);
    v14 = pApp;
    v15 = v14[6];
    if (v15)
      v16 = (void (__cdecl *)(sqlite3_context *))_aggregateFunctionValue;
    else
      v16 = 0;
    v17 = v14[6];
  }
  else
  {
    v16 = 0;
    v15 = 0;
    v9 = 0;
    v13 = 0;
    v17 = 0;
  }
  if (v17)
    xInverse = (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))_aggregateFunctionInverse;
  else
    xInverse = 0;
  sqlite3_create_window_function(connectionHandle, v8, v9, v13, pApp, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))_aggregateFunctionStep, (void (__cdecl *)(sqlite3_context *))_aggregateFunctionFinal, v16, xInverse, _MSVSQLBridgeDestroy);

  -[NSMutableArray addObject:](self->_aggregateFunctions, "addObject:", pApp);
}

- (sqlite3)lastError
{
  sqlite3 **v1;
  const char *v2;

  if (a1)
  {
    v1 = a1;
    v2 = sqlite3_errmsg(a1[1]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MSVSQLDatabaseError"), 1, CFSTR("[%lld] %s"), sqlite3_errcode(v1[1]), v2);
    a1 = (sqlite3 **)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

@end
