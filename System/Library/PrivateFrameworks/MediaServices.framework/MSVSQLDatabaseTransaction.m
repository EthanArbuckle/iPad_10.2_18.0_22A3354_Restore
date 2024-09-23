@implementation MSVSQLDatabaseTransaction

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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 717, CFSTR("Attempt to use invalidated transaction."));

  }
  v6 = -[MSVSQLRowEnumerator initWithStatement:]((id *)[MSVSQLRowEnumerator alloc], v5);

  return v6;
}

- (BOOL)commit
{
  void *v3;
  id v4;
  _MSVSQLConnection *connection;
  unint64_t v6;
  _MSVSQLConnection *v7;
  _MSVSQLConnection *v8;
  _MSVSQLConnection *v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  void *v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
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
  unint64_t v44;
  uint64_t v45;
  unint64_t *v46;
  int v47;
  void *v48;
  void *v49;
  int v50;
  unsigned int v51;
  unint64_t v52;
  int v53;
  unint64_t v54;
  int v55;
  unint64_t v56;
  unsigned int v57;
  unsigned int v58;
  unsigned int v59;
  unsigned int v60;
  uint64_t v61;
  uint64_t *v62;
  ldiv_t v63;
  uint64_t v64;
  char *v65;
  const UInt8 *v66;
  unsigned __int8 *v67;
  char *v68;
  char *v69;
  uint64_t m;
  unsigned int v71;
  char *v72;
  id v73;
  char *v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  _BYTE *v78;
  unint64_t v79;
  unsigned __int8 *v80;
  char *v81;
  char *v82;
  uint64_t j;
  unsigned int v84;
  char *v85;
  uint64_t v86;
  char *v87;
  uint64_t quot;
  lldiv_t v89;
  uint64_t v90;
  CFStringRef v91;
  unsigned __int8 *v92;
  char *v93;
  char *v94;
  uint64_t k;
  unsigned int v96;
  char *v97;
  char *v98;
  uint64_t v99;
  _BYTE *v100;
  unint64_t v101;
  unsigned __int8 *v102;
  char *v103;
  char *v104;
  uint64_t i;
  unsigned int v106;
  char *v107;
  __CFString *v108;
  NSObject *v109;
  _MSVSQLConnection *v110;
  _MSVSQLAssertion *assertion;
  _MSVSQLAssertion *v112;
  void *v114;
  void *v115;
  void *v117;
  id v118;
  _BYTE buf[32];
  unint64_t v120;
  unint64_t v121;
  __int128 v122;
  __int128 v123;
  uint64_t v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _BYTE v133[72];
  _OWORD v134[4];
  uint64_t v135;
  _QWORD v136[3];
  uint64_t v137;

  v137 = *MEMORY[0x1E0C80C00];
  if (self->_invalid)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 637, CFSTR("Attempt to use invalidated transaction."));

  }
  -[MSVSQLDatabaseTransaction statementWithString:error:](self, "statementWithString:error:", CFSTR("COMMIT TRANSACTION"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = 0;
  -[MSVSQLDatabaseTransaction executeStatement:error:](self, "executeStatement:error:", v3, &v118);
  v4 = v118;
  objc_msgSend(v3, "invalidate");
  if (!v4)
  {
    self->_invalid = 1;
    connection = self->_connection;
    if (connection && !connection->_invalid)
    {
      connection->_invalid = 1;
      sqlite3_close(connection->_connectionHandle);
      connection->_connectionHandle = 0;
    }
    if (self->_assertion)
    {
      v6 = MSVHasherSharedSeed();
      v7 = self->_connection;
      if (v7)
        v7 = (_MSVSQLConnection *)v7->_databaseURI;
      v8 = v7;
      v132 = 0u;
      v131 = 0u;
      v130 = 0u;
      v129 = 0u;
      v128 = 0u;
      v127 = 0u;
      v126 = 0u;
      v125 = 0u;
      *(_OWORD *)buf = xmmword_1A07D4D30;
      *(int64x2_t *)&buf[16] = vaddq_s64(vdupq_n_s64(v6), (int64x2_t)xmmword_1A07D4D40);
      v120 = v6;
      v121 = v6 + 0x61C8864E7A143579;
      v122 = 0u;
      v123 = 0u;
      v124 = 0;
      v9 = objc_retainAutorelease(v8);
      v10 = (_BYTE *)-[_MSVSQLConnection UTF8String](v9, "UTF8String");
      v11 = -[_MSVSQLConnection length](v9, "length");
      if (*(uint64_t *)buf > 3999)
      {
        if (*(uint64_t *)buf > 4255)
        {
          if (*(_QWORD *)buf == 4256)
          {
            CC_SHA256_Update((CC_SHA256_CTX *)&buf[8], v10, v11);
          }
          else if (*(_QWORD *)buf == 4512)
          {
            CC_SHA512_Update((CC_SHA512_CTX *)&buf[8], v10, v11);
          }
        }
        else if (*(_QWORD *)buf == 4000)
        {
          CC_MD5_Update((CC_MD5_CTX *)&buf[8], v10, v11);
        }
        else if (*(_QWORD *)buf == 4001)
        {
          CC_SHA1_Update((CC_SHA1_CTX *)&buf[8], v10, v11);
        }
      }
      else if (*(uint64_t *)buf > 2999)
      {
        if (*(_QWORD *)buf == 3000)
        {
          _MSV_XXH_XXH32_update(&buf[8], v10, v11);
        }
        else if (*(_QWORD *)buf == 3001)
        {
          _MSV_XXH_XXH64_update(&buf[8], v10, v11);
        }
      }
      else if (*(_QWORD *)buf)
      {
        if (*(_QWORD *)buf == 2000)
        {
          v12 = &buf[buf[19] + 16];
          switch((((_BYTE)v11 + buf[19]) & 3) - buf[19])
          {
            case 0:
              break;
            case 1:
              *v12 = *v10;
              break;
            case 2:
              v15 = *(_WORD *)v10;
              goto LABEL_33;
            case 3:
              v15 = *(_WORD *)v10;
              v12[2] = v10[2];
LABEL_33:
              *(_WORD *)v12 = v15;
              break;
            default:
              memcpy(v12, v10, (((v11 + buf[19]) & 3) - buf[19]));
              break;
          }
          *(_DWORD *)&buf[12] += v11;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasherAppendBytes(MSVHasher * _Nonnull, const void * _Nonnull, size_t)");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("MSVHasher+Algorithms.h"), 262, CFSTR("Cannot append to unknown hasher algorithm"));

      }
      memset(&v133[8], 0, 64);
      *(_QWORD *)v133 = *(_QWORD *)buf;
      if (*(uint64_t *)buf > 3000)
      {
        if (*(uint64_t *)buf <= 4000)
        {
          if (*(_QWORD *)buf == 3001)
          {
            *(_QWORD *)&v133[8] = _MSV_XXH_XXH64_digest(&buf[8]);
          }
          else if (*(_QWORD *)buf == 4000)
          {
            CC_MD5_Final(&v133[8], (CC_MD5_CTX *)&buf[8]);
          }
        }
        else
        {
          switch(*(_QWORD *)buf)
          {
            case 0xFA1:
              CC_SHA1_Final(&v133[8], (CC_SHA1_CTX *)&buf[8]);
              break;
            case 0x10A0:
              CC_SHA256_Final(&v133[8], (CC_SHA256_CTX *)&buf[8]);
              break;
            case 0x11A0:
              CC_SHA512_Final(&v133[8], (CC_SHA512_CTX *)&buf[8]);
              break;
          }
        }
        goto LABEL_72;
      }
      if (*(uint64_t *)buf <= 1999)
      {
        if (*(_QWORD *)buf)
        {
          if (*(_QWORD *)buf == 1000)
          {
            v16 = (*(_QWORD *)&buf[8] + *(_QWORD *)&buf[16]) ^ __ROR8__(*(_QWORD *)&buf[16], 51);
            v17 = *(_QWORD *)&buf[24] + (v120 ^ v121);
            v18 = __ROR8__(v120 ^ v121, 48);
            v19 = (v17 ^ v18) + __ROR8__(*(_QWORD *)&buf[8] + *(_QWORD *)&buf[16], 32);
            v20 = v19 ^ __ROR8__(v17 ^ v18, 43);
            v21 = v17 + v16;
            v22 = v21 ^ __ROR8__(v16, 47);
            v23 = (v19 ^ v121) + v22;
            v24 = v23 ^ __ROR8__(v22, 51);
            v25 = (__ROR8__(v21, 32) ^ 0xFFLL) + v20;
            v26 = __ROR8__(v20, 48);
            v27 = __ROR8__(v23, 32) + (v25 ^ v26);
            v28 = v27 ^ __ROR8__(v25 ^ v26, 43);
            v29 = v24 + v25;
            v30 = v29 ^ __ROR8__(v24, 47);
            v31 = v30 + v27;
            v32 = v31 ^ __ROR8__(v30, 51);
            v33 = __ROR8__(v29, 32) + v28;
            v34 = __ROR8__(v28, 48);
            v35 = __ROR8__(v31, 32) + (v33 ^ v34);
            v36 = v35 ^ __ROR8__(v33 ^ v34, 43);
            v37 = v32 + v33;
            v38 = v37 ^ __ROR8__(v32, 47);
            v39 = v38 + v35;
            v40 = v39 ^ __ROR8__(v38, 51);
            v41 = __ROR8__(v37, 32) + v36;
            v42 = __ROR8__(v36, 48);
            v43 = __ROR8__(v39, 32) + (v41 ^ v42);
            v44 = v43 ^ __ROR8__(v41 ^ v42, 43);
            v45 = v40 + v41;
            *(_QWORD *)&buf[8] = v43;
            *(_QWORD *)&buf[16] = v45 ^ __ROR8__(v40, 47);
            *(_QWORD *)&buf[24] = __ROR8__(v45, 32);
            v120 = v44;
            *(_QWORD *)&v133[8] = *(_QWORD *)&buf[16] ^ v43 ^ *(_QWORD *)&buf[24] ^ v44;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "handleFailureInFunction:file:lineNumber:description:", v49, CFSTR("MSVHasher+Algorithms.h"), 156, CFSTR("Cannot finalize unknown hasher algorithm"));

        }
LABEL_72:
        v134[0] = *(_OWORD *)v133;
        v134[1] = *(_OWORD *)&v133[16];
        v134[2] = *(_OWORD *)&v133[32];
        v134[3] = *(_OWORD *)&v133[48];
        v135 = *(_QWORD *)&v133[64];
        if (*(uint64_t *)v133 > 3999)
        {
          if (*(uint64_t *)v133 > 4255)
          {
            if (*(_QWORD *)v133 == 4256)
            {
              v102 = (unsigned __int8 *)v134 + 8;
              v103 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
              v104 = v103;
              for (i = 0; i != 64; i += 2)
              {
                v106 = *v102++;
                v107 = &v103[i];
                *v107 = MSVFastHexStringFromBytes_hexCharacters_3379[(unint64_t)v106 >> 4];
                v107[1] = MSVFastHexStringFromBytes_hexCharacters_3379[v106 & 0xF];
              }
              v73 = objc_alloc(MEMORY[0x1E0CB3940]);
              v74 = v104;
              v75 = 64;
            }
            else
            {
              if (*(_QWORD *)v133 != 4512)
                goto LABEL_122;
              v80 = (unsigned __int8 *)v134 + 8;
              v81 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
              v82 = v81;
              for (j = 0; j != 128; j += 2)
              {
                v84 = *v80++;
                v85 = &v81[j];
                *v85 = MSVFastHexStringFromBytes_hexCharacters_3379[(unint64_t)v84 >> 4];
                v85[1] = MSVFastHexStringFromBytes_hexCharacters_3379[v84 & 0xF];
              }
              v73 = objc_alloc(MEMORY[0x1E0CB3940]);
              v74 = v82;
              v75 = 128;
            }
          }
          else if (*(_QWORD *)v133 == 4000)
          {
            v92 = (unsigned __int8 *)v134 + 8;
            v93 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
            v94 = v93;
            for (k = 0; k != 32; k += 2)
            {
              v96 = *v92++;
              v97 = &v93[k];
              *v97 = MSVFastHexStringFromBytes_hexCharacters_3379[(unint64_t)v96 >> 4];
              v97[1] = MSVFastHexStringFromBytes_hexCharacters_3379[v96 & 0xF];
            }
            v73 = objc_alloc(MEMORY[0x1E0CB3940]);
            v74 = v94;
            v75 = 32;
          }
          else
          {
            if (*(_QWORD *)v133 != 4001)
              goto LABEL_122;
            v67 = (unsigned __int8 *)v134 + 8;
            v68 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
            v69 = v68;
            for (m = 0; m != 40; m += 2)
            {
              v71 = *v67++;
              v72 = &v68[m];
              *v72 = MSVFastHexStringFromBytes_hexCharacters_3379[(unint64_t)v71 >> 4];
              v72[1] = MSVFastHexStringFromBytes_hexCharacters_3379[v71 & 0xF];
            }
            v73 = objc_alloc(MEMORY[0x1E0CB3940]);
            v74 = v69;
            v75 = 40;
          }
        }
        else
        {
          if (*(uint64_t *)v133 <= 2999)
          {
            if (*(_QWORD *)v133 == 1000)
            {
              v86 = *((_QWORD *)&v134[0] + 1);
              v87 = (char *)&v137 + 1;
              quot = *((_QWORD *)&v134[0] + 1);
              do
              {
                v89 = lldiv(quot, 10);
                quot = v89.quot;
                if (v89.rem >= 0)
                  LOBYTE(v90) = v89.rem;
                else
                  v90 = -v89.rem;
                *(v87 - 2) = v90 + 48;
                v66 = (const UInt8 *)(v87 - 2);
                --v87;
              }
              while (v89.quot);
              if (v86 < 0)
              {
                *(v87 - 2) = 45;
                v66 = (const UInt8 *)(v87 - 2);
              }
              v65 = (char *)((char *)&v137 - (char *)v66);
              goto LABEL_106;
            }
            if (*(_QWORD *)v133 == 2000)
            {
              v61 = DWORD2(v134[0]);
              v62 = &v137;
              do
              {
                v63 = ldiv(v61, 10);
                v61 = v63.quot;
                if (v63.rem >= 0)
                  LOBYTE(v64) = v63.rem;
                else
                  v64 = -v63.rem;
                *((_BYTE *)v62 - 1) = v64 + 48;
                v62 = (uint64_t *)((char *)v62 - 1);
              }
              while (v63.quot);
              v65 = (char *)((char *)&v137 - (char *)v62);
              v66 = (const UInt8 *)v62;
LABEL_106:
              v91 = CFStringCreateWithBytes(0, v66, (CFIndex)v65, 0x8000100u, 0);
LABEL_117:
              v108 = (__CFString *)v91;
LABEL_118:

              v109 = os_log_create("com.apple.amp.MediaServices", "SQL");
              if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
              {
                v110 = self->_connection;
                assertion = self->_assertion;
                *(_DWORD *)buf = 138543874;
                *(_QWORD *)&buf[4] = v108;
                *(_WORD *)&buf[12] = 2048;
                *(_QWORD *)&buf[14] = v110;
                *(_WORD *)&buf[22] = 2114;
                *(_QWORD *)&buf[24] = assertion;
                _os_log_impl(&dword_1A077D000, v109, OS_LOG_TYPE_DEFAULT, "[SQL:%{public}@:%p] commit | invalidating process assertion [database transaction] assertion=%{public}@", buf, 0x20u);
              }

              -[_MSVSQLAssertion invalidate](self->_assertion, "invalidate");
              v112 = self->_assertion;
              self->_assertion = 0;

              goto LABEL_121;
            }
LABEL_122:
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull _MSVHashGetDigest(MSVHash)");
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v114, "handleFailureInFunction:file:lineNumber:description:", v115, CFSTR("MSVHasher+Algorithms.h"), 356, CFSTR("Cannot obtain digest from unknown hasher algorithm"));

            v108 = &stru_1E43EA7B0;
            goto LABEL_118;
          }
          if (*(_QWORD *)v133 == 3000)
          {
            LODWORD(v136[0]) = bswap32(DWORD2(v134[0]));
            v98 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
            v99 = 0;
            v100 = v98 + 1;
            do
            {
              v101 = *((unsigned __int8 *)v136 + v99);
              *(v100 - 1) = MSVFastHexStringFromBytes_hexCharacters_3379[v101 >> 4];
              *v100 = MSVFastHexStringFromBytes_hexCharacters_3379[v101 & 0xF];
              v100 += 2;
              ++v99;
            }
            while (v99 != 4);
            v73 = objc_alloc(MEMORY[0x1E0CB3940]);
            v74 = v98;
            v75 = 8;
          }
          else
          {
            if (*(_QWORD *)v133 != 3001)
              goto LABEL_122;
            v136[0] = bswap64(*((unint64_t *)&v134[0] + 1));
            v76 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
            v77 = 0;
            v78 = v76 + 1;
            do
            {
              v79 = *((unsigned __int8 *)v136 + v77);
              *(v78 - 1) = MSVFastHexStringFromBytes_hexCharacters_3379[v79 >> 4];
              *v78 = MSVFastHexStringFromBytes_hexCharacters_3379[v79 & 0xF];
              v78 += 2;
              ++v77;
            }
            while (v77 != 8);
            v73 = objc_alloc(MEMORY[0x1E0CB3940]);
            v74 = v76;
            v75 = 16;
          }
        }
        v91 = (CFStringRef)objc_msgSend(v73, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v74, v75, 4, 1);
        goto LABEL_117;
      }
      if (*(_QWORD *)buf != 2000)
      {
        if (*(_QWORD *)buf != 3000)
          goto LABEL_72;
        v46 = &v120;
        if (*(_DWORD *)&buf[12])
          v47 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)&buf[16], (uint32x4_t)xmmword_1A07D4D20), (int8x16_t)vshlq_u32(*(uint32x4_t *)&buf[16], (uint32x4_t)xmmword_1A07D4D10)));
        else
          v47 = *(_DWORD *)&buf[24] + 374761393;
        v51 = *(_DWORD *)&buf[8] + v47;
        v52 = v122 & 0xF;
        if (v52 >= 4)
        {
          do
          {
            v53 = *(_DWORD *)v46;
            v46 = (unint64_t *)((char *)v46 + 4);
            HIDWORD(v54) = v51 - 1028477379 * v53;
            LODWORD(v54) = HIDWORD(v54);
            v51 = 668265263 * (v54 >> 15);
            v52 -= 4;
          }
          while (v52 > 3);
        }
        for (; v52; --v52)
        {
          v55 = *(unsigned __int8 *)v46;
          v46 = (unint64_t *)((char *)v46 + 1);
          HIDWORD(v56) = v51 + 374761393 * v55;
          LODWORD(v56) = HIDWORD(v56);
          v51 = -1640531535 * (v56 >> 21);
        }
        v57 = -1028477379 * ((-2048144777 * (v51 ^ (v51 >> 15))) ^ ((-2048144777 * (v51 ^ (v51 >> 15))) >> 13));
        v58 = v57 ^ HIWORD(v57);
        goto LABEL_71;
      }
      switch(buf[19])
      {
        case 1:
          v50 = buf[16];
          break;
        case 2:
          v50 = *(unsigned __int16 *)&buf[16];
          break;
        case 3:
          v50 = *(unsigned __int16 *)&buf[16] | (buf[18] << 16);
          break;
        default:
          v59 = *(_DWORD *)&buf[8];
          goto LABEL_70;
      }
      v59 = (461845907 * ((380141568 * v50) | ((-862048943 * v50) >> 17))) ^ *(_DWORD *)&buf[8];
LABEL_70:
      v60 = -2048144789 * (v59 ^ *(_DWORD *)&buf[12] ^ ((v59 ^ *(_DWORD *)&buf[12]) >> 16));
      v58 = (-1028477387 * (v60 ^ (v60 >> 13))) ^ ((-1028477387 * (v60 ^ (v60 >> 13))) >> 16);
      *(_DWORD *)&buf[8] = v58;
LABEL_71:
      *(_DWORD *)&v133[8] = v58;
      goto LABEL_72;
    }
  }
LABEL_121:

  return v4 == 0;
}

- (BOOL)executeStatementString:(id)a3 error:(id *)a4
{
  id v7;
  BOOL v8;
  void *v10;

  v7 = a3;
  if (self->_invalid)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 722, CFSTR("Attempt to use invalidated transaction."));

  }
  v8 = -[_MSVSQLConnection executeStatementString:error:](self->_connection, "executeStatementString:error:", v7, a4);

  return v8;
}

- (BOOL)executeStatement:(id)a3 error:(id *)a4
{
  id v7;
  BOOL v8;
  void *v10;

  v7 = a3;
  if (self->_invalid)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 712, CFSTR("Attempt to use invalidated transaction."));

  }
  v8 = -[_MSVSQLConnection executeStatement:error:](self->_connection, "executeStatement:error:", v7, a4);

  return v8;
}

- (id)statementWithString:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v10;

  v7 = a3;
  if (self->_invalid)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 707, CFSTR("Attempt to use invalidated transaction."));

  }
  -[_MSVSQLConnection statementWithString:error:](self->_connection, "statementWithString:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (__CFString)initWithConnection:(void *)a3 name:(_QWORD *)a4 error:
{
  id *v8;
  id v9;
  __CFString *v10;
  unint64_t v11;
  id v12;
  id v13;
  _BYTE *v14;
  uint64_t v15;
  _BYTE *v16;
  void *v17;
  void *v18;
  __int16 v19;
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
  int *v50;
  int v51;
  void *v52;
  void *v53;
  int v54;
  unsigned int v55;
  unint64_t v56;
  int v57;
  unint64_t v58;
  int v59;
  unint64_t v60;
  unsigned int v61;
  unsigned int v62;
  unsigned int v63;
  unsigned int v64;
  uint64_t v65;
  _QWORD *v66;
  ldiv_t v67;
  uint64_t v68;
  char *v69;
  const UInt8 *v70;
  uint8_t *v71;
  char *v72;
  char *v73;
  uint64_t m;
  unsigned int v75;
  char *v76;
  id v77;
  char *v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  _BYTE *v82;
  unint64_t v83;
  uint8_t *v84;
  char *v85;
  char *v86;
  uint64_t j;
  unsigned int v88;
  char *v89;
  uint64_t v90;
  char *v91;
  uint64_t quot;
  lldiv_t v93;
  uint64_t v94;
  CFStringRef v95;
  uint8_t *v96;
  char *v97;
  char *v98;
  uint64_t k;
  unsigned int v100;
  char *v101;
  char *v102;
  uint64_t v103;
  _BYTE *v104;
  unint64_t v105;
  uint8_t *v106;
  char *v107;
  char *v108;
  uint64_t i;
  unsigned int v110;
  char *v111;
  __CFString *v112;
  NSObject *v113;
  id v114;
  MSVSonicAssertion *v115;
  _MSVSQLProcessAssertion *v116;
  id v117;
  uint64_t v118;
  NSString *name;
  MSVSonicAssertion *v120;
  MSVSonicAssertion *v121;
  double v122;
  NSObject *v123;
  uint64_t v124;
  void *v125;
  char v126;
  NSObject *v127;
  void *v128;
  void *v129;
  void *v130;
  void *length;
  uint64_t v132;
  NSObject *v133;
  NSObject *v134;
  uint64_t v135;
  const char *v136;
  NSObject *v137;
  os_log_type_t v138;
  uint32_t v139;
  uint64_t v140;
  void *isa;
  void *v142;
  id v143;
  id v144;
  _QWORD *v146;
  id v147;
  id v148;
  id v149;
  objc_super v150;
  _BYTE buf[32];
  __int128 v152;
  __int128 v153;
  __int128 v154;
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
  uint8_t v165[16];
  __int128 v166;
  __int128 v167;
  __int128 v168;
  uint64_t v169;
  _QWORD v170[3];
  _QWORD v171[3];

  v171[0] = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  if (!a1)
    goto LABEL_144;
  v150.receiver = a1;
  v150.super_class = (Class)MSVSQLDatabaseTransaction;
  v10 = (__CFString *)-[__CFString init](&v150, sel_init);
  a1 = v10;
  if (!v10)
    goto LABEL_144;
  v146 = a4;
  v147 = v9;
  objc_storeStrong((id *)&v10->data, a2);
  v11 = MSVHasherSharedSeed();
  v12 = v8[7];
  v163 = 0u;
  v162 = 0u;
  v161 = 0u;
  v160 = 0u;
  v159 = 0u;
  v158 = 0u;
  v157 = 0u;
  v156 = 0u;
  *(_OWORD *)buf = xmmword_1A07D4D30;
  *(int64x2_t *)&buf[16] = vaddq_s64(vdupq_n_s64(v11), (int64x2_t)xmmword_1A07D4D40);
  *(_QWORD *)&v152 = v11;
  *((_QWORD *)&v152 + 1) = v11 + 0x61C8864E7A143579;
  v153 = 0u;
  v154 = 0u;
  v155 = 0;
  v13 = objc_retainAutorelease(v12);
  v14 = (_BYTE *)objc_msgSend(v13, "UTF8String");
  v15 = objc_msgSend(v13, "length");
  if (*(uint64_t *)buf > 3999)
  {
    if (*(uint64_t *)buf > 4255)
    {
      if (*(_QWORD *)buf == 4256)
      {
        CC_SHA256_Update((CC_SHA256_CTX *)&buf[8], v14, v15);
      }
      else if (*(_QWORD *)buf == 4512)
      {
        CC_SHA512_Update((CC_SHA512_CTX *)&buf[8], v14, v15);
      }
    }
    else if (*(_QWORD *)buf == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&buf[8], v14, v15);
    }
    else if (*(_QWORD *)buf == 4001)
    {
      CC_SHA1_Update((CC_SHA1_CTX *)&buf[8], v14, v15);
    }
  }
  else if (*(uint64_t *)buf > 2999)
  {
    if (*(_QWORD *)buf == 3000)
    {
      _MSV_XXH_XXH32_update(&buf[8], v14, v15);
    }
    else if (*(_QWORD *)buf == 3001)
    {
      _MSV_XXH_XXH64_update(&buf[8], v14, v15);
    }
  }
  else if (*(_QWORD *)buf)
  {
    if (*(_QWORD *)buf == 2000)
    {
      v16 = &buf[buf[19] + 16];
      switch((((_BYTE)v15 + buf[19]) & 3) - buf[19])
      {
        case 0:
          break;
        case 1:
          *v16 = *v14;
          break;
        case 2:
          v19 = *(_WORD *)v14;
          goto LABEL_26;
        case 3:
          v19 = *(_WORD *)v14;
          v16[2] = v14[2];
LABEL_26:
          *(_WORD *)v16 = v19;
          break;
        default:
          memcpy(v16, v14, (((v15 + buf[19]) & 3) - buf[19]));
          break;
      }
      *(_DWORD *)&buf[12] += v15;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasherAppendBytes(MSVHasher * _Nonnull, const void * _Nonnull, size_t)");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("MSVHasher+Algorithms.h"), 262, CFSTR("Cannot append to unknown hasher algorithm"));

  }
  memset(&v164[8], 0, 64);
  *(_QWORD *)v164 = *(_QWORD *)buf;
  if (*(uint64_t *)buf > 3000)
  {
    if (*(uint64_t *)buf <= 4000)
    {
      if (*(_QWORD *)buf == 3001)
      {
        *(_QWORD *)&v164[8] = _MSV_XXH_XXH64_digest(&buf[8]);
      }
      else if (*(_QWORD *)buf == 4000)
      {
        CC_MD5_Final(&v164[8], (CC_MD5_CTX *)&buf[8]);
      }
    }
    else
    {
      switch(*(_QWORD *)buf)
      {
        case 0xFA1:
          CC_SHA1_Final(&v164[8], (CC_SHA1_CTX *)&buf[8]);
          break;
        case 0x10A0:
          CC_SHA256_Final(&v164[8], (CC_SHA256_CTX *)&buf[8]);
          break;
        case 0x11A0:
          CC_SHA512_Final(&v164[8], (CC_SHA512_CTX *)&buf[8]);
          break;
      }
    }
    goto LABEL_65;
  }
  if (*(uint64_t *)buf > 1999)
  {
    if (*(_QWORD *)buf != 2000)
    {
      if (*(_QWORD *)buf != 3000)
        goto LABEL_65;
      v50 = (int *)&v152;
      if (*(_DWORD *)&buf[12])
        v51 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)&buf[16], (uint32x4_t)xmmword_1A07D4D20), (int8x16_t)vshlq_u32(*(uint32x4_t *)&buf[16], (uint32x4_t)xmmword_1A07D4D10)));
      else
        v51 = *(_DWORD *)&buf[24] + 374761393;
      v55 = *(_DWORD *)&buf[8] + v51;
      v56 = v153 & 0xF;
      if (v56 >= 4)
      {
        do
        {
          v57 = *v50++;
          HIDWORD(v58) = v55 - 1028477379 * v57;
          LODWORD(v58) = HIDWORD(v58);
          v55 = 668265263 * (v58 >> 15);
          v56 -= 4;
        }
        while (v56 > 3);
      }
      for (; v56; --v56)
      {
        v59 = *(unsigned __int8 *)v50;
        v50 = (int *)((char *)v50 + 1);
        HIDWORD(v60) = v55 + 374761393 * v59;
        LODWORD(v60) = HIDWORD(v60);
        v55 = -1640531535 * (v60 >> 21);
      }
      v61 = -1028477379 * ((-2048144777 * (v55 ^ (v55 >> 15))) ^ ((-2048144777 * (v55 ^ (v55 >> 15))) >> 13));
      v62 = v61 ^ HIWORD(v61);
      goto LABEL_64;
    }
    switch(buf[19])
    {
      case 1:
        v54 = buf[16];
        break;
      case 2:
        v54 = *(unsigned __int16 *)&buf[16];
        break;
      case 3:
        v54 = *(unsigned __int16 *)&buf[16] | (buf[18] << 16);
        break;
      default:
        v63 = *(_DWORD *)&buf[8];
        goto LABEL_63;
    }
    v63 = (461845907 * ((380141568 * v54) | ((-862048943 * v54) >> 17))) ^ *(_DWORD *)&buf[8];
LABEL_63:
    v64 = -2048144789 * (v63 ^ *(_DWORD *)&buf[12] ^ ((v63 ^ *(_DWORD *)&buf[12]) >> 16));
    v62 = (-1028477387 * (v64 ^ (v64 >> 13))) ^ ((-1028477387 * (v64 ^ (v64 >> 13))) >> 16);
    *(_DWORD *)&buf[8] = v62;
LABEL_64:
    *(_DWORD *)&v164[8] = v62;
    goto LABEL_65;
  }
  if (*(_QWORD *)buf)
  {
    if (*(_QWORD *)buf == 1000)
    {
      v20 = (*(_QWORD *)&buf[8] + *(_QWORD *)&buf[16]) ^ __ROR8__(*(_QWORD *)&buf[16], 51);
      v21 = *(_QWORD *)&buf[24] + (v152 ^ *((_QWORD *)&v152 + 1));
      v22 = __ROR8__(v152 ^ *((_QWORD *)&v152 + 1), 48);
      v23 = (v21 ^ v22) + __ROR8__(*(_QWORD *)&buf[8] + *(_QWORD *)&buf[16], 32);
      v24 = v23 ^ __ROR8__(v21 ^ v22, 43);
      v25 = v21 + v20;
      v26 = v25 ^ __ROR8__(v20, 47);
      v27 = (v23 ^ *((_QWORD *)&v152 + 1)) + v26;
      v28 = v27 ^ __ROR8__(v26, 51);
      v29 = (__ROR8__(v25, 32) ^ 0xFFLL) + v24;
      v30 = __ROR8__(v24, 48);
      v31 = __ROR8__(v27, 32) + (v29 ^ v30);
      v32 = v31 ^ __ROR8__(v29 ^ v30, 43);
      v33 = v28 + v29;
      v34 = v33 ^ __ROR8__(v28, 47);
      v35 = v34 + v31;
      v36 = v35 ^ __ROR8__(v34, 51);
      v37 = __ROR8__(v33, 32) + v32;
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
      *(_QWORD *)&buf[8] = v47;
      *(_QWORD *)&buf[16] = v49 ^ __ROR8__(v44, 47);
      *(_QWORD *)&buf[24] = __ROR8__(v49, 32);
      *(_QWORD *)&v152 = v48;
      *(_QWORD *)&v164[8] = *(_QWORD *)&buf[16] ^ v47 ^ *(_QWORD *)&buf[24] ^ v48;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, CFSTR("MSVHasher+Algorithms.h"), 156, CFSTR("Cannot finalize unknown hasher algorithm"));

  }
LABEL_65:
  *(_OWORD *)v165 = *(_OWORD *)v164;
  v166 = *(_OWORD *)&v164[16];
  v167 = *(_OWORD *)&v164[32];
  v168 = *(_OWORD *)&v164[48];
  v169 = *(_QWORD *)&v164[64];
  if (*(uint64_t *)v164 > 3999)
  {
    if (*(uint64_t *)v164 > 4255)
    {
      if (*(_QWORD *)v164 == 4256)
      {
        v106 = &v165[8];
        v107 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v108 = v107;
        for (i = 0; i != 64; i += 2)
        {
          v110 = *v106++;
          v111 = &v107[i];
          *v111 = MSVFastHexStringFromBytes_hexCharacters_3379[(unint64_t)v110 >> 4];
          v111[1] = MSVFastHexStringFromBytes_hexCharacters_3379[v110 & 0xF];
        }
        v77 = objc_alloc(MEMORY[0x1E0CB3940]);
        v78 = v108;
        v79 = 64;
      }
      else
      {
        if (*(_QWORD *)v164 != 4512)
          goto LABEL_128;
        v84 = &v165[8];
        v85 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v86 = v85;
        for (j = 0; j != 128; j += 2)
        {
          v88 = *v84++;
          v89 = &v85[j];
          *v89 = MSVFastHexStringFromBytes_hexCharacters_3379[(unint64_t)v88 >> 4];
          v89[1] = MSVFastHexStringFromBytes_hexCharacters_3379[v88 & 0xF];
        }
        v77 = objc_alloc(MEMORY[0x1E0CB3940]);
        v78 = v86;
        v79 = 128;
      }
    }
    else if (*(_QWORD *)v164 == 4000)
    {
      v96 = &v165[8];
      v97 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v98 = v97;
      for (k = 0; k != 32; k += 2)
      {
        v100 = *v96++;
        v101 = &v97[k];
        *v101 = MSVFastHexStringFromBytes_hexCharacters_3379[(unint64_t)v100 >> 4];
        v101[1] = MSVFastHexStringFromBytes_hexCharacters_3379[v100 & 0xF];
      }
      v77 = objc_alloc(MEMORY[0x1E0CB3940]);
      v78 = v98;
      v79 = 32;
    }
    else
    {
      if (*(_QWORD *)v164 != 4001)
        goto LABEL_128;
      v71 = &v165[8];
      v72 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      v73 = v72;
      for (m = 0; m != 40; m += 2)
      {
        v75 = *v71++;
        v76 = &v72[m];
        *v76 = MSVFastHexStringFromBytes_hexCharacters_3379[(unint64_t)v75 >> 4];
        v76[1] = MSVFastHexStringFromBytes_hexCharacters_3379[v75 & 0xF];
      }
      v77 = objc_alloc(MEMORY[0x1E0CB3940]);
      v78 = v73;
      v79 = 40;
    }
LABEL_109:
    v95 = (CFStringRef)objc_msgSend(v77, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v78, v79, 4, 1, v146);
    goto LABEL_110;
  }
  if (*(uint64_t *)v164 > 2999)
  {
    if (*(_QWORD *)v164 == 3000)
    {
      LODWORD(v170[0]) = bswap32(*(unsigned int *)&v165[8]);
      v102 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
      v103 = 0;
      v104 = v102 + 1;
      do
      {
        v105 = *((unsigned __int8 *)v170 + v103);
        *(v104 - 1) = MSVFastHexStringFromBytes_hexCharacters_3379[v105 >> 4];
        *v104 = MSVFastHexStringFromBytes_hexCharacters_3379[v105 & 0xF];
        v104 += 2;
        ++v103;
      }
      while (v103 != 4);
      v77 = objc_alloc(MEMORY[0x1E0CB3940]);
      v78 = v102;
      v79 = 8;
    }
    else
    {
      if (*(_QWORD *)v164 != 3001)
        goto LABEL_128;
      v170[0] = bswap64(*(unint64_t *)&v165[8]);
      v80 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
      v81 = 0;
      v82 = v80 + 1;
      do
      {
        v83 = *((unsigned __int8 *)v170 + v81);
        *(v82 - 1) = MSVFastHexStringFromBytes_hexCharacters_3379[v83 >> 4];
        *v82 = MSVFastHexStringFromBytes_hexCharacters_3379[v83 & 0xF];
        v82 += 2;
        ++v81;
      }
      while (v81 != 8);
      v77 = objc_alloc(MEMORY[0x1E0CB3940]);
      v78 = v80;
      v79 = 16;
    }
    goto LABEL_109;
  }
  if (*(_QWORD *)v164 == 1000)
  {
    v90 = *(_QWORD *)&v165[8];
    v91 = (char *)v171 + 1;
    quot = *(_QWORD *)&v165[8];
    do
    {
      v93 = lldiv(quot, 10);
      quot = v93.quot;
      if (v93.rem >= 0)
        LOBYTE(v94) = v93.rem;
      else
        v94 = -v93.rem;
      *(v91 - 2) = v94 + 48;
      v70 = (const UInt8 *)(v91 - 2);
      --v91;
    }
    while (v93.quot);
    if (v90 < 0)
    {
      *(v91 - 2) = 45;
      v70 = (const UInt8 *)(v91 - 2);
    }
    v69 = (char *)((char *)v171 - (char *)v70);
    goto LABEL_99;
  }
  if (*(_QWORD *)v164 == 2000)
  {
    v65 = *(unsigned int *)&v165[8];
    v66 = v171;
    do
    {
      v67 = ldiv(v65, 10);
      v65 = v67.quot;
      if (v67.rem >= 0)
        LOBYTE(v68) = v67.rem;
      else
        v68 = -v67.rem;
      *((_BYTE *)v66 - 1) = v68 + 48;
      v66 = (_QWORD *)((char *)v66 - 1);
    }
    while (v67.quot);
    v69 = (char *)((char *)v171 - (char *)v66);
    v70 = (const UInt8 *)v66;
LABEL_99:
    v95 = CFStringCreateWithBytes(0, v70, (CFIndex)v69, 0x8000100u, 0);
LABEL_110:
    v112 = (__CFString *)v95;
    goto LABEL_111;
  }
LABEL_128:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v146);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull _MSVHashGetDigest(MSVHash)");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "handleFailureInFunction:file:lineNumber:description:", v130, CFSTR("MSVHasher+Algorithms.h"), 356, CFSTR("Cannot obtain digest from unknown hasher algorithm"));

  v112 = &stru_1E43EA7B0;
LABEL_111:

  v113 = os_log_create("com.apple.amp.MediaServices", "SQL");
  if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v112;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2114;
    *(_QWORD *)&buf[24] = v9;
    _os_log_impl(&dword_1A077D000, v113, OS_LOG_TYPE_DEFAULT, "[SQL:%{public}@:%p] initWithConnection:… name:%{public}@… | taking process assertion [database transaction]", buf, 0x20u);
  }

  v114 = v9;
  if (+[MSVSonicAssertion hasEntitlement](MSVSonicAssertion, "hasEntitlement"))
  {
    v115 = -[MSVSonicAssertion initWithName:]([MSVSonicAssertion alloc], "initWithName:", v114);
    goto LABEL_133;
  }
  v116 = [_MSVSQLProcessAssertion alloc];
  v117 = v114;
  if (!v116)
  {
    v115 = 0;
    goto LABEL_132;
  }
  *(_QWORD *)buf = v116;
  *(_QWORD *)&buf[8] = _MSVSQLProcessAssertion;
  v115 = (MSVSonicAssertion *)objc_msgSendSuper2((objc_super *)buf, sel_init);
  if (v115)
  {
    v118 = objc_msgSend(v117, "copy");
    name = v115->_name;
    v115->_name = (NSString *)v118;

    os_unfair_lock_lock((os_unfair_lock_t)&__assertionLock);
    v120 = (MSVSonicAssertion *)(id)__assertion;
    v121 = v120;
    if (v120
      && -[MSVSonicAssertion valid](v120, "valid")
      && (BKSProcessAssertionBackgroundTimeRemaining(), v122 >= 5.0))
    {
      ++__assertionCount;
    }
    else
    {
      v123 = os_log_create("com.apple.amp.MediaServices", "SQL");
      if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v165 = 0;
        _os_log_impl(&dword_1A077D000, v123, OS_LOG_TYPE_DEFAULT, "[SQL] Taking Process Assertion", v165, 2u);
      }

      v124 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFE308]), "initWithPID:flags:reason:name:", getpid(), 1, 4, CFSTR("MSVSQLDatabase"));
      v125 = (void *)__assertion;
      __assertion = v124;

      v126 = objc_msgSend((id)__assertion, "acquire");
      if (v121)
      {
        v127 = os_log_create("com.apple.amp.MediaServices", "SQL");
        if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v165 = 0;
          _os_log_impl(&dword_1A077D000, v127, OS_LOG_TYPE_DEFAULT, "[SQL] Invalidating Existing Process Assertion", v165, 2u);
        }

        -[MSVSonicAssertion invalidate](v121, "invalidate");
      }
      ++__assertionCount;
      if ((v126 & 1) == 0)
      {
        __assertionCount = 0;
        v128 = (void *)__assertion;
        __assertion = 0;

        os_unfair_lock_unlock((os_unfair_lock_t)&__assertionLock);
        v121 = v115;
        v115 = 0;
LABEL_131:

        v9 = v147;
        goto LABEL_132;
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&__assertionLock);
    goto LABEL_131;
  }
LABEL_132:

LABEL_133:
  length = (void *)a1->length;
  a1->length = (uint64_t)v115;

  v132 = a1->length;
  v133 = os_log_create("com.apple.amp.MediaServices", "SQL");
  v134 = v133;
  if (v132)
  {
    if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
    {
      v135 = a1->length;
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v112;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2114;
      *(_QWORD *)&buf[24] = v114;
      LOWORD(v152) = 2114;
      *(_QWORD *)((char *)&v152 + 2) = v135;
      v136 = "[SQL:%{public}@:%p] initWithConnection:… name:%{public}@… | acquired process assertion [database transactio"
             "n] assertion=%{public}@";
      v137 = v134;
      v138 = OS_LOG_TYPE_DEFAULT;
      v139 = 42;
LABEL_138:
      _os_log_impl(&dword_1A077D000, v137, v138, v136, buf, v139);
    }
  }
  else if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v112;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2114;
    *(_QWORD *)&buf[24] = v114;
    v136 = "[SQL:%{public}@:%p] initWithConnection:… name:%{public}@… | failed to acquire process assertion [database transaction]";
    v137 = v134;
    v138 = OS_LOG_TYPE_ERROR;
    v139 = 32;
    goto LABEL_138;
  }

  v140 = objc_msgSend(v114, "copy");
  isa = a1[1].isa;
  a1[1].isa = (void *)v140;

  v149 = 0;
  -[__CFString statementWithString:error:](a1, "statementWithString:error:", CFSTR("BEGIN TRANSACTION"), &v149);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = v149;
  v148 = v143;
  -[__CFString executeStatement:error:](a1, "executeStatement:error:", v142, &v148);
  v144 = v148;

  if (v144)
  {
    if (v146)
      *v146 = objc_retainAutorelease(v144);

    v142 = v112;
    v112 = a1;
    a1 = 0;
  }

LABEL_144:
  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_invalid)
    -[MSVSQLDatabaseTransaction rollback](self, "rollback");
  v3.receiver = self;
  v3.super_class = (Class)MSVSQLDatabaseTransaction;
  -[MSVSQLDatabaseTransaction dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p name=%@>"), objc_opt_class(), self, self->_name);
}

- (BOOL)rollback
{
  void *v3;
  id v4;
  _MSVSQLConnection *connection;
  unint64_t v6;
  _MSVSQLConnection *v7;
  _MSVSQLConnection *v8;
  _MSVSQLConnection *v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  void *v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
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
  unint64_t v44;
  uint64_t v45;
  unint64_t *v46;
  int v47;
  void *v48;
  void *v49;
  int v50;
  unsigned int v51;
  unint64_t v52;
  int v53;
  unint64_t v54;
  int v55;
  unint64_t v56;
  unsigned int v57;
  unsigned int v58;
  unsigned int v59;
  unsigned int v60;
  uint64_t v61;
  uint64_t *v62;
  ldiv_t v63;
  uint64_t v64;
  char *v65;
  const UInt8 *v66;
  unsigned __int8 *v67;
  char *v68;
  char *v69;
  uint64_t m;
  unsigned int v71;
  char *v72;
  id v73;
  char *v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  _BYTE *v78;
  unint64_t v79;
  unsigned __int8 *v80;
  char *v81;
  char *v82;
  uint64_t j;
  unsigned int v84;
  char *v85;
  uint64_t v86;
  char *v87;
  uint64_t quot;
  lldiv_t v89;
  uint64_t v90;
  CFStringRef v91;
  unsigned __int8 *v92;
  char *v93;
  char *v94;
  uint64_t k;
  unsigned int v96;
  char *v97;
  char *v98;
  uint64_t v99;
  _BYTE *v100;
  unint64_t v101;
  unsigned __int8 *v102;
  char *v103;
  char *v104;
  uint64_t i;
  unsigned int v106;
  char *v107;
  __CFString *v108;
  NSObject *v109;
  _MSVSQLConnection *v110;
  _MSVSQLAssertion *assertion;
  _MSVSQLAssertion *v112;
  void *v114;
  void *v115;
  void *v117;
  id v118;
  _BYTE buf[32];
  unint64_t v120;
  unint64_t v121;
  __int128 v122;
  __int128 v123;
  uint64_t v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _BYTE v133[72];
  _OWORD v134[4];
  uint64_t v135;
  _QWORD v136[3];
  uint64_t v137;

  v137 = *MEMORY[0x1E0C80C00];
  if (self->_invalid)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 660, CFSTR("Attempt to use invalidated transaction."));

  }
  -[MSVSQLDatabaseTransaction statementWithString:error:](self, "statementWithString:error:", CFSTR("ROLLBACK TRANSACTION"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = 0;
  -[MSVSQLDatabaseTransaction executeStatement:error:](self, "executeStatement:error:", v3, &v118);
  v4 = v118;
  objc_msgSend(v3, "invalidate");
  if (!v4)
  {
    self->_invalid = 1;
    connection = self->_connection;
    if (connection && !connection->_invalid)
    {
      connection->_invalid = 1;
      sqlite3_close(connection->_connectionHandle);
      connection->_connectionHandle = 0;
    }
    if (self->_assertion)
    {
      v6 = MSVHasherSharedSeed();
      v7 = self->_connection;
      if (v7)
        v7 = (_MSVSQLConnection *)v7->_databaseURI;
      v8 = v7;
      v132 = 0u;
      v131 = 0u;
      v130 = 0u;
      v129 = 0u;
      v128 = 0u;
      v127 = 0u;
      v126 = 0u;
      v125 = 0u;
      *(_OWORD *)buf = xmmword_1A07D4D30;
      *(int64x2_t *)&buf[16] = vaddq_s64(vdupq_n_s64(v6), (int64x2_t)xmmword_1A07D4D40);
      v120 = v6;
      v121 = v6 + 0x61C8864E7A143579;
      v122 = 0u;
      v123 = 0u;
      v124 = 0;
      v9 = objc_retainAutorelease(v8);
      v10 = (_BYTE *)-[_MSVSQLConnection UTF8String](v9, "UTF8String");
      v11 = -[_MSVSQLConnection length](v9, "length");
      if (*(uint64_t *)buf > 3999)
      {
        if (*(uint64_t *)buf > 4255)
        {
          if (*(_QWORD *)buf == 4256)
          {
            CC_SHA256_Update((CC_SHA256_CTX *)&buf[8], v10, v11);
          }
          else if (*(_QWORD *)buf == 4512)
          {
            CC_SHA512_Update((CC_SHA512_CTX *)&buf[8], v10, v11);
          }
        }
        else if (*(_QWORD *)buf == 4000)
        {
          CC_MD5_Update((CC_MD5_CTX *)&buf[8], v10, v11);
        }
        else if (*(_QWORD *)buf == 4001)
        {
          CC_SHA1_Update((CC_SHA1_CTX *)&buf[8], v10, v11);
        }
      }
      else if (*(uint64_t *)buf > 2999)
      {
        if (*(_QWORD *)buf == 3000)
        {
          _MSV_XXH_XXH32_update(&buf[8], v10, v11);
        }
        else if (*(_QWORD *)buf == 3001)
        {
          _MSV_XXH_XXH64_update(&buf[8], v10, v11);
        }
      }
      else if (*(_QWORD *)buf)
      {
        if (*(_QWORD *)buf == 2000)
        {
          v12 = &buf[buf[19] + 16];
          switch((((_BYTE)v11 + buf[19]) & 3) - buf[19])
          {
            case 0:
              break;
            case 1:
              *v12 = *v10;
              break;
            case 2:
              v15 = *(_WORD *)v10;
              goto LABEL_33;
            case 3:
              v15 = *(_WORD *)v10;
              v12[2] = v10[2];
LABEL_33:
              *(_WORD *)v12 = v15;
              break;
            default:
              memcpy(v12, v10, (((v11 + buf[19]) & 3) - buf[19]));
              break;
          }
          *(_DWORD *)&buf[12] += v11;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasherAppendBytes(MSVHasher * _Nonnull, const void * _Nonnull, size_t)");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("MSVHasher+Algorithms.h"), 262, CFSTR("Cannot append to unknown hasher algorithm"));

      }
      memset(&v133[8], 0, 64);
      *(_QWORD *)v133 = *(_QWORD *)buf;
      if (*(uint64_t *)buf > 3000)
      {
        if (*(uint64_t *)buf <= 4000)
        {
          if (*(_QWORD *)buf == 3001)
          {
            *(_QWORD *)&v133[8] = _MSV_XXH_XXH64_digest(&buf[8]);
          }
          else if (*(_QWORD *)buf == 4000)
          {
            CC_MD5_Final(&v133[8], (CC_MD5_CTX *)&buf[8]);
          }
        }
        else
        {
          switch(*(_QWORD *)buf)
          {
            case 0xFA1:
              CC_SHA1_Final(&v133[8], (CC_SHA1_CTX *)&buf[8]);
              break;
            case 0x10A0:
              CC_SHA256_Final(&v133[8], (CC_SHA256_CTX *)&buf[8]);
              break;
            case 0x11A0:
              CC_SHA512_Final(&v133[8], (CC_SHA512_CTX *)&buf[8]);
              break;
          }
        }
        goto LABEL_72;
      }
      if (*(uint64_t *)buf <= 1999)
      {
        if (*(_QWORD *)buf)
        {
          if (*(_QWORD *)buf == 1000)
          {
            v16 = (*(_QWORD *)&buf[8] + *(_QWORD *)&buf[16]) ^ __ROR8__(*(_QWORD *)&buf[16], 51);
            v17 = *(_QWORD *)&buf[24] + (v120 ^ v121);
            v18 = __ROR8__(v120 ^ v121, 48);
            v19 = (v17 ^ v18) + __ROR8__(*(_QWORD *)&buf[8] + *(_QWORD *)&buf[16], 32);
            v20 = v19 ^ __ROR8__(v17 ^ v18, 43);
            v21 = v17 + v16;
            v22 = v21 ^ __ROR8__(v16, 47);
            v23 = (v19 ^ v121) + v22;
            v24 = v23 ^ __ROR8__(v22, 51);
            v25 = (__ROR8__(v21, 32) ^ 0xFFLL) + v20;
            v26 = __ROR8__(v20, 48);
            v27 = __ROR8__(v23, 32) + (v25 ^ v26);
            v28 = v27 ^ __ROR8__(v25 ^ v26, 43);
            v29 = v24 + v25;
            v30 = v29 ^ __ROR8__(v24, 47);
            v31 = v30 + v27;
            v32 = v31 ^ __ROR8__(v30, 51);
            v33 = __ROR8__(v29, 32) + v28;
            v34 = __ROR8__(v28, 48);
            v35 = __ROR8__(v31, 32) + (v33 ^ v34);
            v36 = v35 ^ __ROR8__(v33 ^ v34, 43);
            v37 = v32 + v33;
            v38 = v37 ^ __ROR8__(v32, 47);
            v39 = v38 + v35;
            v40 = v39 ^ __ROR8__(v38, 51);
            v41 = __ROR8__(v37, 32) + v36;
            v42 = __ROR8__(v36, 48);
            v43 = __ROR8__(v39, 32) + (v41 ^ v42);
            v44 = v43 ^ __ROR8__(v41 ^ v42, 43);
            v45 = v40 + v41;
            *(_QWORD *)&buf[8] = v43;
            *(_QWORD *)&buf[16] = v45 ^ __ROR8__(v40, 47);
            *(_QWORD *)&buf[24] = __ROR8__(v45, 32);
            v120 = v44;
            *(_QWORD *)&v133[8] = *(_QWORD *)&buf[16] ^ v43 ^ *(_QWORD *)&buf[24] ^ v44;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "handleFailureInFunction:file:lineNumber:description:", v49, CFSTR("MSVHasher+Algorithms.h"), 156, CFSTR("Cannot finalize unknown hasher algorithm"));

        }
LABEL_72:
        v134[0] = *(_OWORD *)v133;
        v134[1] = *(_OWORD *)&v133[16];
        v134[2] = *(_OWORD *)&v133[32];
        v134[3] = *(_OWORD *)&v133[48];
        v135 = *(_QWORD *)&v133[64];
        if (*(uint64_t *)v133 > 3999)
        {
          if (*(uint64_t *)v133 > 4255)
          {
            if (*(_QWORD *)v133 == 4256)
            {
              v102 = (unsigned __int8 *)v134 + 8;
              v103 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
              v104 = v103;
              for (i = 0; i != 64; i += 2)
              {
                v106 = *v102++;
                v107 = &v103[i];
                *v107 = MSVFastHexStringFromBytes_hexCharacters_3379[(unint64_t)v106 >> 4];
                v107[1] = MSVFastHexStringFromBytes_hexCharacters_3379[v106 & 0xF];
              }
              v73 = objc_alloc(MEMORY[0x1E0CB3940]);
              v74 = v104;
              v75 = 64;
            }
            else
            {
              if (*(_QWORD *)v133 != 4512)
                goto LABEL_122;
              v80 = (unsigned __int8 *)v134 + 8;
              v81 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
              v82 = v81;
              for (j = 0; j != 128; j += 2)
              {
                v84 = *v80++;
                v85 = &v81[j];
                *v85 = MSVFastHexStringFromBytes_hexCharacters_3379[(unint64_t)v84 >> 4];
                v85[1] = MSVFastHexStringFromBytes_hexCharacters_3379[v84 & 0xF];
              }
              v73 = objc_alloc(MEMORY[0x1E0CB3940]);
              v74 = v82;
              v75 = 128;
            }
          }
          else if (*(_QWORD *)v133 == 4000)
          {
            v92 = (unsigned __int8 *)v134 + 8;
            v93 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
            v94 = v93;
            for (k = 0; k != 32; k += 2)
            {
              v96 = *v92++;
              v97 = &v93[k];
              *v97 = MSVFastHexStringFromBytes_hexCharacters_3379[(unint64_t)v96 >> 4];
              v97[1] = MSVFastHexStringFromBytes_hexCharacters_3379[v96 & 0xF];
            }
            v73 = objc_alloc(MEMORY[0x1E0CB3940]);
            v74 = v94;
            v75 = 32;
          }
          else
          {
            if (*(_QWORD *)v133 != 4001)
              goto LABEL_122;
            v67 = (unsigned __int8 *)v134 + 8;
            v68 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
            v69 = v68;
            for (m = 0; m != 40; m += 2)
            {
              v71 = *v67++;
              v72 = &v68[m];
              *v72 = MSVFastHexStringFromBytes_hexCharacters_3379[(unint64_t)v71 >> 4];
              v72[1] = MSVFastHexStringFromBytes_hexCharacters_3379[v71 & 0xF];
            }
            v73 = objc_alloc(MEMORY[0x1E0CB3940]);
            v74 = v69;
            v75 = 40;
          }
        }
        else
        {
          if (*(uint64_t *)v133 <= 2999)
          {
            if (*(_QWORD *)v133 == 1000)
            {
              v86 = *((_QWORD *)&v134[0] + 1);
              v87 = (char *)&v137 + 1;
              quot = *((_QWORD *)&v134[0] + 1);
              do
              {
                v89 = lldiv(quot, 10);
                quot = v89.quot;
                if (v89.rem >= 0)
                  LOBYTE(v90) = v89.rem;
                else
                  v90 = -v89.rem;
                *(v87 - 2) = v90 + 48;
                v66 = (const UInt8 *)(v87 - 2);
                --v87;
              }
              while (v89.quot);
              if (v86 < 0)
              {
                *(v87 - 2) = 45;
                v66 = (const UInt8 *)(v87 - 2);
              }
              v65 = (char *)((char *)&v137 - (char *)v66);
              goto LABEL_106;
            }
            if (*(_QWORD *)v133 == 2000)
            {
              v61 = DWORD2(v134[0]);
              v62 = &v137;
              do
              {
                v63 = ldiv(v61, 10);
                v61 = v63.quot;
                if (v63.rem >= 0)
                  LOBYTE(v64) = v63.rem;
                else
                  v64 = -v63.rem;
                *((_BYTE *)v62 - 1) = v64 + 48;
                v62 = (uint64_t *)((char *)v62 - 1);
              }
              while (v63.quot);
              v65 = (char *)((char *)&v137 - (char *)v62);
              v66 = (const UInt8 *)v62;
LABEL_106:
              v91 = CFStringCreateWithBytes(0, v66, (CFIndex)v65, 0x8000100u, 0);
LABEL_117:
              v108 = (__CFString *)v91;
LABEL_118:

              v109 = os_log_create("com.apple.amp.MediaServices", "SQL");
              if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
              {
                v110 = self->_connection;
                assertion = self->_assertion;
                *(_DWORD *)buf = 138543874;
                *(_QWORD *)&buf[4] = v108;
                *(_WORD *)&buf[12] = 2048;
                *(_QWORD *)&buf[14] = v110;
                *(_WORD *)&buf[22] = 2114;
                *(_QWORD *)&buf[24] = assertion;
                _os_log_impl(&dword_1A077D000, v109, OS_LOG_TYPE_DEFAULT, "[SQL:%{public}@:%p] commit | invalidating process assertion [database transaction] assertion=%{public}@", buf, 0x20u);
              }

              -[_MSVSQLAssertion invalidate](self->_assertion, "invalidate");
              v112 = self->_assertion;
              self->_assertion = 0;

              goto LABEL_121;
            }
LABEL_122:
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull _MSVHashGetDigest(MSVHash)");
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v114, "handleFailureInFunction:file:lineNumber:description:", v115, CFSTR("MSVHasher+Algorithms.h"), 356, CFSTR("Cannot obtain digest from unknown hasher algorithm"));

            v108 = &stru_1E43EA7B0;
            goto LABEL_118;
          }
          if (*(_QWORD *)v133 == 3000)
          {
            LODWORD(v136[0]) = bswap32(DWORD2(v134[0]));
            v98 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
            v99 = 0;
            v100 = v98 + 1;
            do
            {
              v101 = *((unsigned __int8 *)v136 + v99);
              *(v100 - 1) = MSVFastHexStringFromBytes_hexCharacters_3379[v101 >> 4];
              *v100 = MSVFastHexStringFromBytes_hexCharacters_3379[v101 & 0xF];
              v100 += 2;
              ++v99;
            }
            while (v99 != 4);
            v73 = objc_alloc(MEMORY[0x1E0CB3940]);
            v74 = v98;
            v75 = 8;
          }
          else
          {
            if (*(_QWORD *)v133 != 3001)
              goto LABEL_122;
            v136[0] = bswap64(*((unint64_t *)&v134[0] + 1));
            v76 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
            v77 = 0;
            v78 = v76 + 1;
            do
            {
              v79 = *((unsigned __int8 *)v136 + v77);
              *(v78 - 1) = MSVFastHexStringFromBytes_hexCharacters_3379[v79 >> 4];
              *v78 = MSVFastHexStringFromBytes_hexCharacters_3379[v79 & 0xF];
              v78 += 2;
              ++v77;
            }
            while (v77 != 8);
            v73 = objc_alloc(MEMORY[0x1E0CB3940]);
            v74 = v76;
            v75 = 16;
          }
        }
        v91 = (CFStringRef)objc_msgSend(v73, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v74, v75, 4, 1);
        goto LABEL_117;
      }
      if (*(_QWORD *)buf != 2000)
      {
        if (*(_QWORD *)buf != 3000)
          goto LABEL_72;
        v46 = &v120;
        if (*(_DWORD *)&buf[12])
          v47 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)&buf[16], (uint32x4_t)xmmword_1A07D4D20), (int8x16_t)vshlq_u32(*(uint32x4_t *)&buf[16], (uint32x4_t)xmmword_1A07D4D10)));
        else
          v47 = *(_DWORD *)&buf[24] + 374761393;
        v51 = *(_DWORD *)&buf[8] + v47;
        v52 = v122 & 0xF;
        if (v52 >= 4)
        {
          do
          {
            v53 = *(_DWORD *)v46;
            v46 = (unint64_t *)((char *)v46 + 4);
            HIDWORD(v54) = v51 - 1028477379 * v53;
            LODWORD(v54) = HIDWORD(v54);
            v51 = 668265263 * (v54 >> 15);
            v52 -= 4;
          }
          while (v52 > 3);
        }
        for (; v52; --v52)
        {
          v55 = *(unsigned __int8 *)v46;
          v46 = (unint64_t *)((char *)v46 + 1);
          HIDWORD(v56) = v51 + 374761393 * v55;
          LODWORD(v56) = HIDWORD(v56);
          v51 = -1640531535 * (v56 >> 21);
        }
        v57 = -1028477379 * ((-2048144777 * (v51 ^ (v51 >> 15))) ^ ((-2048144777 * (v51 ^ (v51 >> 15))) >> 13));
        v58 = v57 ^ HIWORD(v57);
        goto LABEL_71;
      }
      switch(buf[19])
      {
        case 1:
          v50 = buf[16];
          break;
        case 2:
          v50 = *(unsigned __int16 *)&buf[16];
          break;
        case 3:
          v50 = *(unsigned __int16 *)&buf[16] | (buf[18] << 16);
          break;
        default:
          v59 = *(_DWORD *)&buf[8];
          goto LABEL_70;
      }
      v59 = (461845907 * ((380141568 * v50) | ((-862048943 * v50) >> 17))) ^ *(_DWORD *)&buf[8];
LABEL_70:
      v60 = -2048144789 * (v59 ^ *(_DWORD *)&buf[12] ^ ((v59 ^ *(_DWORD *)&buf[12]) >> 16));
      v58 = (-1028477387 * (v60 ^ (v60 >> 13))) ^ ((-1028477387 * (v60 ^ (v60 >> 13))) >> 16);
      *(_DWORD *)&buf[8] = v58;
LABEL_71:
      *(_DWORD *)&v133[8] = v58;
      goto LABEL_72;
    }
  }
LABEL_121:

  return v4 == 0;
}

- (id)createSavepoint
{
  void *v3;
  void *v4;
  void *v5;
  _MSVSQLDatabaseTransactionSavepoint *v6;
  MSVSQLDatabaseTransaction *v7;
  id v8;
  MSVSQLDatabaseTransaction *v9;
  uint64_t v10;
  NSString *name;
  void *v14;
  objc_super v15;

  if (self->_invalid)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 683, CFSTR("Attempt to use invalidated transaction."));

  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MSVSQLDatabaseTransaction statementWithString:error:](self, "statementWithString:error:", CFSTR("SAVEPOINT @name"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindStringValue:toParameterNamed:", v4, CFSTR("@name"));
  -[MSVSQLDatabaseTransaction executeStatement:error:](self, "executeStatement:error:", v5, 0);
  v6 = [_MSVSQLDatabaseTransactionSavepoint alloc];
  v7 = self;
  v8 = v4;
  if (v6)
  {
    v15.receiver = v6;
    v15.super_class = (Class)_MSVSQLDatabaseTransactionSavepoint;
    v9 = -[MSVSQLDatabaseTransaction init](&v15, sel_init);
    v6 = (_MSVSQLDatabaseTransactionSavepoint *)v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_connection, self);
      v10 = objc_msgSend(v8, "copy");
      name = v6->_name;
      v6->_name = (NSString *)v10;

    }
  }

  return v6;
}

- (BOOL)rollbackToSavepoint:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v10;
  uint64_t v11;

  v5 = a3;
  if (self->_invalid)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSQLDatabase.m"), 695, CFSTR("Attempt to use invalidated transaction."));

  }
  -[MSVSQLDatabaseTransaction statementWithString:error:](self, "statementWithString:error:", CFSTR("ROLLBACK TRANSACTION TO SAVEPOINT @name"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bindStringValue:toParameterNamed:", v7, CFSTR("@name"));

  v11 = 0;
  -[MSVSQLDatabaseTransaction executeStatement:error:](self, "executeStatement:error:", v6, &v11);
  v8 = v11 == 0;

  return v8;
}

- (BOOL)_releaseSavepoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;

  v4 = a3;
  -[MSVSQLDatabaseTransaction statementWithString:error:](self, "statementWithString:error:", CFSTR("RELEASE SAVEPOINT @name"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bindStringValue:toParameterNamed:", v6, CFSTR("@name"));
  v8 = 0;
  -[MSVSQLDatabaseTransaction executeStatement:error:](self, "executeStatement:error:", v5, &v8);
  LOBYTE(self) = v8 == 0;

  return (char)self;
}

- (NSString)name
{
  return self->_name;
}

@end
