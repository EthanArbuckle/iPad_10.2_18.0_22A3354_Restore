@implementation MPModelSortDescriptor

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MPModelSortDescriptor;
  if (-[MPModelSortDescriptor isEqual:](&v10, sel_isEqual_, v4))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MPModelSortDescriptor keyPath](self, "keyPath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "keyPath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqualToArray:", v7);
    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  CC_LONG64 v21;
  CC_LONG64 v22;
  uint64_t v23;
  CC_LONG64 v24;
  CC_LONG64 v25;
  CC_LONG64 v26;
  void *v27;
  void *v28;
  char *v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unsigned __int8 v33;
  uint64_t v34;
  CC_LONG64 v35;
  CC_LONG64 v36;
  uint64_t v37;
  CC_LONG64 v38;
  CC_LONG64 v39;
  CC_LONG64 v40;
  int v41;
  unint64_t v42;
  int v43;
  char *v44;
  int v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  id v51;
  char *v52;
  uint64_t v53;
  char *v54;
  void *v55;
  void *v56;
  __int16 v57;
  CC_LONG64 v58;
  CC_LONG64 v59;
  uint64_t v60;
  CC_LONG64 v61;
  CC_LONG64 v62;
  CC_LONG64 v63;
  CC_LONG64 v64;
  CC_LONG64 v65;
  CC_LONG64 v66;
  CC_LONG64 v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  CC_LONG64 v71;
  CC_LONG64 v72;
  CC_LONG64 v73;
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
  CC_LONG64 v85;
  CC_LONG64 v86;
  uint64_t v87;
  CC_LONG64 v88;
  CC_LONG64 *v89;
  int v90;
  void *v91;
  void *v92;
  CC_LONG64 *v93;
  CC_LONG64 v94;
  int v95;
  unint64_t v96;
  unint64_t v97;
  uint64_t v98;
  unsigned int v99;
  unsigned int v100;
  unint64_t v101;
  unsigned int v102;
  unint64_t v103;
  int v104;
  unint64_t v105;
  int v106;
  unint64_t v107;
  unsigned int v108;
  unsigned int v109;
  unsigned int v110;
  unsigned int v111;
  unsigned __int8 *v112;
  char *v113;
  char *v114;
  uint64_t n;
  unsigned int v116;
  char *v117;
  id v118;
  char *v119;
  uint64_t v120;
  unint64_t v121;
  unsigned __int8 *v122;
  char *v123;
  char *v124;
  uint64_t k;
  unsigned int v126;
  char *v127;
  unsigned __int8 *v128;
  char *v129;
  char *v130;
  uint64_t m;
  unsigned int v132;
  char *v133;
  unsigned __int8 *v134;
  char *v135;
  char *v136;
  uint64_t j;
  unsigned int v138;
  char *v139;
  void *v140;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  id obj;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  objc_super v153;
  uint64_t v154;
  CC_SHA512_CTX v155;
  _BYTE v156[128];
  _BYTE v157[72];
  _OWORD data[4];
  uint64_t v159;
  uint64_t v160;

  v160 = *MEMORY[0x1E0C80C00];
  v3 = MSVHasherSharedSeed();
  v5 = v4;
  memset(&v155.hash[3], 0, 168);
  v6 = v3 ^ 0x736F6D6570736575;
  v7 = v4 ^ 0x646F72616E646F6DLL;
  v8 = v3 ^ 0x6C7967656E657261;
  v154 = 1000;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  v12 = v5 ^ 0x7465646279746573 ^ v11;
  v13 = (v6 + v7) ^ __ROR8__(v7, 51);
  v14 = v8 + v12;
  v15 = (v8 + v12) ^ __ROR8__(v12, 48);
  v16 = v15 + __ROR8__(v6 + v7, 32);
  v17 = v14 + v13;
  v155.hash[0] = __ROR8__(v17, 32);
  v155.hash[1] = v16 ^ __ROR8__(v15, 43);
  v155.count[0] = v16 ^ v11;
  v155.count[1] = v17 ^ __ROR8__(v13, 47);
  v155.hash[2] = 0x800000000000000;

  v153.receiver = self;
  v153.super_class = (Class)MPModelSortDescriptor;
  v18 = -[MPModelSortDescriptor hash](&v153, sel_hash);
  *(_QWORD *)&data[0] = v18;
  if (v154 <= 3000)
  {
    v19 = v18;
    if (v154 > 1999)
    {
      if (v154 == 2000)
      {
        v29 = (char *)BYTE3(v155.count[1]);
        v30 = (BYTE3(v155.count[1]) + 8) & 0x1FC;
        switch(BYTE3(v155.count[1]))
        {
          case 0:
            v31 = v18 >> 8;
            v32 = v18 >> 16;
            v33 = v18;
            v19 = v18 >> 24;
            break;
          case 1:
            v32 = v18 >> 8;
            v33 = v155.count[1];
            LOBYTE(v31) = v18;
            v19 = v18 >> 16;
            break;
          case 2:
            LOBYTE(v32) = v18;
            v19 = v18 >> 8;
            v33 = v155.count[1];
            LODWORD(v31) = HIBYTE(LOWORD(v155.count[1]));
            break;
          case 3:
            v33 = v155.count[1];
            LODWORD(v31) = HIBYTE(LOWORD(v155.count[1]));
            LOBYTE(v32) = BYTE2(v155.count[1]);
            break;
          default:
LABEL_30:
            LOBYTE(v31) = 0;
            v33 = 0;
            LOBYTE(v32) = 0;
            LODWORD(v19) = 0;
            break;
        }
        v41 = (v32 << 16) | ((_DWORD)v19 << 24) | v33 | (v31 << 8);
        HIDWORD(v42) = (461845907 * ((380141568 * v41) | ((-862048943 * v41) >> 17))) ^ LODWORD(v155.count[0]);
        LODWORD(v42) = HIDWORD(v42);
        v43 = 5 * (v42 >> 19) - 430675100;
        LODWORD(v155.count[0]) = v43;
        v44 = (char *)((char *)data - v29 + 4);
        v29 = (char *)(v30 + (char *)data - v29);
        if (v30 >= 5)
        {
          do
          {
            v45 = *(_DWORD *)v44;
            v44 += 4;
            HIDWORD(v46) = (461845907 * ((380141568 * v45) | ((-862048943 * v45) >> 17))) ^ v43;
            LODWORD(v46) = HIDWORD(v46);
            v30 = 5 * (v46 >> 19);
            v43 = v30 - 430675100;
          }
          while (v44 < v29);
          LODWORD(v155.count[0]) = v30 - 430675100;
        }
        switch((int)v29)
        {
          case 0:
            break;
          case 1:
            LOBYTE(v155.count[1]) = *v29;
            break;
          case 2:
            LOWORD(v155.count[1]) = *(_WORD *)v29;
            break;
          case 3:
            LOWORD(v155.count[1]) = *(_WORD *)v29;
            BYTE2(v155.count[1]) = v29[2];
            break;
          default:
            goto LABEL_30;
        }
        BYTE3(v155.count[1]) &= 3u;
        HIDWORD(v155.count[0]) += 8;
      }
      else if (v154 == 3000)
      {
        _MSV_XXH_XXH32_update_10929(&v155, (char *)data, 8uLL);
      }
    }
    else if (v154)
    {
      if (v154 == 1000)
      {
        v20 = v155.hash[2];
        if ((v155.hash[2] & 0x400000000000000) != 0)
        {
          if ((v155.hash[2] & 0x300000000000000) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            v147 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v146, "handleFailureInFunction:file:lineNumber:description:", v147, CFSTR("MSVHasher+SipHash.h"), 105, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld"), v155.hash[2]);

            v20 = v155.hash[2];
          }
          v34 = v20 & 0xFFFFFFFFFFFFFFLL | (v19 << 32);
          v35 = (v155.count[0] + v155.count[1]) ^ __ROR8__(v155.count[1], 51);
          v36 = v155.hash[0] + (v34 ^ v155.hash[1]);
          v37 = __ROR8__(v34 ^ v155.hash[1], 48);
          v38 = (v36 ^ v37) + __ROR8__(v155.count[0] + v155.count[1], 32);
          v39 = v38 ^ __ROR8__(v36 ^ v37, 43);
          v40 = v36 + v35;
          v155.hash[0] = __ROR8__(v40, 32);
          v155.hash[1] = v39;
          v155.count[0] = v38 ^ v34;
          v155.count[1] = v40 ^ __ROR8__(v35, 47);
          v20 = v20 & 0xFF00000000000000 | HIDWORD(v19);
        }
        else
        {
          if ((v155.hash[2] & 0x7FFFFFFFFFFFFFFLL) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            v145 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v144, "handleFailureInFunction:file:lineNumber:description:", v145, CFSTR("MSVHasher+SipHash.h"), 101, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld"), v155.hash[2]);

            v20 = v155.hash[2];
          }
          v21 = (v155.count[0] + v155.count[1]) ^ __ROR8__(v155.count[1], 51);
          v22 = v155.hash[0] + (v155.hash[1] ^ v19);
          v23 = __ROR8__(v155.hash[1] ^ v19, 48);
          v24 = (v22 ^ v23) + __ROR8__(v155.count[0] + v155.count[1], 32);
          v25 = v24 ^ __ROR8__(v22 ^ v23, 43);
          v26 = v22 + v21;
          v155.hash[0] = __ROR8__(v26, 32);
          v155.hash[1] = v25;
          v155.count[0] = v24 ^ v19;
          v155.count[1] = v26 ^ __ROR8__(v21, 47);
        }
        v155.hash[2] = v20 + 0x800000000000000;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasherAppend64(MSVHasher * _Nonnull, uint64_t)");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("MSVHasher+Algorithms.h"), 227, CFSTR("Cannot append to unknown hasher algorithm"));

    }
  }
  else if (v154 <= 4000)
  {
    if (v154 == 3001)
    {
      _MSV_XXH_XXH64_update_10930((char *)&v155, (char *)data, 8uLL);
    }
    else if (v154 == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&v155, data, 4u);
    }
  }
  else
  {
    switch(v154)
    {
      case 4001:
        CC_SHA1_Update((CC_SHA1_CTX *)&v155, data, 4u);
        break;
      case 4256:
        CC_SHA256_Update((CC_SHA256_CTX *)&v155, data, 4u);
        break;
      case 4512:
        CC_SHA512_Update(&v155, data, 4u);
        break;
    }
  }
  v149 = 0u;
  v150 = 0u;
  v151 = 0u;
  v152 = 0u;
  -[MPModelSortDescriptor keyPath](self, "keyPath");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v149, v156, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v150;
    do
    {
      for (i = 0; i != v48; ++i)
      {
        if (*(_QWORD *)v150 != v49)
          objc_enumerationMutation(obj);
        v51 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v149 + 1) + 8 * i));
        v52 = (char *)objc_msgSend(v51, "UTF8String");
        v53 = objc_msgSend(v51, "length");
        if (v154 > 3999)
        {
          if (v154 > 4255)
          {
            if (v154 == 4256)
            {
              CC_SHA256_Update((CC_SHA256_CTX *)&v155, v52, v53);
            }
            else if (v154 == 4512)
            {
              CC_SHA512_Update(&v155, v52, v53);
            }
          }
          else if (v154 == 4000)
          {
            CC_MD5_Update((CC_MD5_CTX *)&v155, v52, v53);
          }
          else if (v154 == 4001)
          {
            CC_SHA1_Update((CC_SHA1_CTX *)&v155, v52, v53);
          }
        }
        else if (v154 > 2999)
        {
          if (v154 == 3000)
          {
            _MSV_XXH_XXH32_update_10929(&v155, v52, v53);
          }
          else if (v154 == 3001)
          {
            _MSV_XXH_XXH64_update_10930((char *)&v155, v52, v53);
          }
        }
        else if (v154)
        {
          if (v154 == 2000)
          {
            v54 = (char *)&v155.hash[-1] + BYTE3(v155.count[1]);
            switch((((_BYTE)v53 + BYTE3(v155.count[1])) & 3) - BYTE3(v155.count[1]))
            {
              case 0:
                break;
              case 1:
                *v54 = *v52;
                break;
              case 2:
                v57 = *(_WORD *)v52;
                goto LABEL_71;
              case 3:
                v57 = *(_WORD *)v52;
                v54[2] = v52[2];
LABEL_71:
                *(_WORD *)v54 = v57;
                break;
              default:
                memcpy(v54, v52, (((v53 + BYTE3(v155.count[1])) & 3) - BYTE3(v155.count[1])));
                break;
            }
            HIDWORD(v155.count[0]) += v53;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasherAppendBytes(MSVHasher * _Nonnull, const void * _Nonnull, size_t)");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "handleFailureInFunction:file:lineNumber:description:", v56, CFSTR("MSVHasher+Algorithms.h"), 262, CFSTR("Cannot append to unknown hasher algorithm"));

        }
      }
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v149, v156, 16);
    }
    while (v48);
  }

  memset(&v157[8], 0, 64);
  *(_QWORD *)v157 = v154;
  if (v154 <= 3000)
  {
    if (v154 <= 1999)
    {
      if (!v154)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "handleFailureInFunction:file:lineNumber:description:", v92, CFSTR("MSVHasher+Algorithms.h"), 156, CFSTR("Cannot finalize unknown hasher algorithm"));

        goto LABEL_122;
      }
      if (v154 != 1000)
        goto LABEL_122;
      v58 = (v155.count[0] + v155.count[1]) ^ __ROR8__(v155.count[1], 51);
      v59 = v155.hash[0] + (v155.hash[1] ^ v155.hash[2]);
      v60 = __ROR8__(v155.hash[1] ^ v155.hash[2], 48);
      v61 = (v59 ^ v60) + __ROR8__(v155.count[0] + v155.count[1], 32);
      v62 = v61 ^ __ROR8__(v59 ^ v60, 43);
      v63 = v59 + v58;
      v64 = v63 ^ __ROR8__(v58, 47);
      v65 = (v61 ^ v155.hash[2]) + v64;
      v66 = v65 ^ __ROR8__(v64, 51);
      v67 = (__ROR8__(v63, 32) ^ 0xFFLL) + v62;
      v68 = __ROR8__(v62, 48);
      v69 = __ROR8__(v65, 32) + (v67 ^ v68);
      v70 = v69 ^ __ROR8__(v67 ^ v68, 43);
      v71 = v66 + v67;
      v72 = v71 ^ __ROR8__(v66, 47);
      v73 = v72 + v69;
      v74 = v73 ^ __ROR8__(v72, 51);
      v75 = __ROR8__(v71, 32) + v70;
      v76 = __ROR8__(v70, 48);
      v77 = __ROR8__(v73, 32) + (v75 ^ v76);
      v78 = v77 ^ __ROR8__(v75 ^ v76, 43);
      v79 = v74 + v75;
      v80 = v79 ^ __ROR8__(v74, 47);
      v81 = v80 + v77;
      v82 = v81 ^ __ROR8__(v80, 51);
      v83 = __ROR8__(v79, 32) + v78;
      v84 = __ROR8__(v78, 48);
      v85 = __ROR8__(v81, 32) + (v83 ^ v84);
      v86 = v85 ^ __ROR8__(v83 ^ v84, 43);
      v87 = v82 + v83;
      v155.count[0] = v85;
      v155.count[1] = v87 ^ __ROR8__(v82, 47);
      v155.hash[0] = __ROR8__(v87, 32);
      v155.hash[1] = v86;
      v88 = v155.count[1] ^ v85 ^ v155.hash[0] ^ v86;
      goto LABEL_109;
    }
    if (v154 != 2000)
    {
      if (v154 != 3000)
        goto LABEL_122;
      v89 = &v155.hash[1];
      if (HIDWORD(v155.count[0]))
        v90 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)&v155.count[1], (uint32x4_t)xmmword_193F0CA90), (int8x16_t)vshlq_u32(*(uint32x4_t *)&v155.count[1], (uint32x4_t)xmmword_193F0CA80)));
      else
        v90 = LODWORD(v155.hash[0]) + 374761393;
      v102 = LODWORD(v155.count[0]) + v90;
      v103 = v155.hash[3] & 0xF;
      if (v103 >= 4)
      {
        do
        {
          v104 = *(_DWORD *)v89;
          v89 = (CC_LONG64 *)((char *)v89 + 4);
          HIDWORD(v105) = v102 - 1028477379 * v104;
          LODWORD(v105) = HIDWORD(v105);
          v102 = 668265263 * (v105 >> 15);
          v103 -= 4;
        }
        while (v103 > 3);
      }
      for (; v103; --v103)
      {
        v106 = *(unsigned __int8 *)v89;
        v89 = (CC_LONG64 *)((char *)v89 + 1);
        HIDWORD(v107) = v102 + 374761393 * v106;
        LODWORD(v107) = HIDWORD(v107);
        v102 = -1640531535 * (v107 >> 21);
      }
      v108 = -1028477379 * ((-2048144777 * (v102 ^ (v102 >> 15))) ^ ((-2048144777 * (v102 ^ (v102 >> 15))) >> 13));
      v109 = v108 ^ HIWORD(v108);
      goto LABEL_121;
    }
    switch(BYTE3(v155.count[1]))
    {
      case 1u:
        v95 = LOBYTE(v155.count[1]);
        break;
      case 2u:
        v95 = LOWORD(v155.count[1]);
        break;
      case 3u:
        v95 = LOWORD(v155.count[1]) | (BYTE2(v155.count[1]) << 16);
        break;
      default:
        v110 = v155.count[0];
        goto LABEL_120;
    }
    v110 = (461845907 * ((380141568 * v95) | ((-862048943 * v95) >> 17))) ^ LODWORD(v155.count[0]);
LABEL_120:
    v111 = -2048144789 * (v110 ^ HIDWORD(v155.count[0]) ^ ((v110 ^ HIDWORD(v155.count[0])) >> 16));
    v109 = (-1028477387 * (v111 ^ (v111 >> 13))) ^ ((-1028477387 * (v111 ^ (v111 >> 13))) >> 16);
    LODWORD(v155.count[0]) = v109;
LABEL_121:
    *(_DWORD *)&v157[8] = v109;
    goto LABEL_122;
  }
  if (v154 > 4000)
  {
    switch(v154)
    {
      case 4001:
        CC_SHA1_Final(&v157[8], (CC_SHA1_CTX *)&v155);
        break;
      case 4256:
        CC_SHA256_Final(&v157[8], (CC_SHA256_CTX *)&v155);
        break;
      case 4512:
        CC_SHA512_Final(&v157[8], &v155);
        break;
    }
    goto LABEL_122;
  }
  if (v154 == 3001)
  {
    v93 = &v155.hash[3];
    if (v155.count[0] < 0x20)
      v94 = v155.hash[1] + 0x27D4EB2F165667C5;
    else
      v94 = 0x9E3779B185EBCA87
          * ((0x9E3779B185EBCA87
            * ((0x9E3779B185EBCA87
              * ((0x9E3779B185EBCA87
                * ((__ROR8__(v155.hash[0], 57)
                  + __ROR8__(v155.count[1], 63)
                  + __ROR8__(v155.hash[1], 52)
                  + __ROR8__(v155.hash[2], 46)) ^ (0x9E3779B185EBCA87
                                                 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v155.count[1], 33)))
                - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v155.hash[0], 33)))
              - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v155.hash[1], 33)))
            - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v155.hash[2], 33)))
          - 0x7A1435883D4D519DLL;
    v96 = v94 + v155.count[0];
    v97 = v155.count[0] & 0x1F;
    if (v97 >= 8)
    {
      do
      {
        v98 = *v93++;
        v96 = 0x85EBCA77C2B2AE63
            - 0x61C8864E7A143579
            * __ROR8__((0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v98, 33)) ^ v96, 37);
        v97 -= 8;
      }
      while (v97 > 7);
    }
    if (v97 >= 4)
    {
      v99 = *(_DWORD *)v93;
      v93 = (CC_LONG64 *)((char *)v93 + 4);
      v96 = 0x165667B19E3779F9 - 0x3D4D51C2D82B14B1 * __ROR8__((0x9E3779B185EBCA87 * v99) ^ v96, 41);
      v97 -= 4;
    }
    for (; v97; --v97)
    {
      v100 = *(unsigned __int8 *)v93;
      v93 = (CC_LONG64 *)((char *)v93 + 1);
      v96 = 0x9E3779B185EBCA87 * __ROR8__((0x27D4EB2F165667C5 * v100) ^ v96, 53);
    }
    v101 = 0x165667B19E3779F9
         * ((0xC2B2AE3D27D4EB4FLL * (v96 ^ (v96 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v96 ^ (v96 >> 33))) >> 29));
    v88 = v101 ^ HIDWORD(v101);
LABEL_109:
    *(_QWORD *)&v157[8] = v88;
    goto LABEL_122;
  }
  if (v154 == 4000)
    CC_MD5_Final(&v157[8], (CC_MD5_CTX *)&v155);
LABEL_122:
  data[0] = *(_OWORD *)v157;
  data[1] = *(_OWORD *)&v157[16];
  data[2] = *(_OWORD *)&v157[32];
  data[3] = *(_OWORD *)&v157[48];
  v159 = *(_QWORD *)&v157[64];
  if (*(uint64_t *)v157 > 3999)
  {
    if (*(uint64_t *)&data[0] > 4255)
    {
      if (*(_QWORD *)&data[0] == 4256)
      {
        v134 = (unsigned __int8 *)data + 8;
        v135 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v136 = v135;
        for (j = 0; j != 64; j += 2)
        {
          v138 = *v134++;
          v139 = &v135[j];
          *v139 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v138 >> 4];
          v139[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v138 & 0xF];
        }
        v118 = objc_alloc(MEMORY[0x1E0CB3940]);
        v119 = v136;
        v120 = 64;
      }
      else
      {
        if (*(_QWORD *)&data[0] != 4512)
          goto LABEL_150;
        v122 = (unsigned __int8 *)data + 8;
        v123 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v124 = v123;
        for (k = 0; k != 128; k += 2)
        {
          v126 = *v122++;
          v127 = &v123[k];
          *v127 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v126 >> 4];
          v127[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v126 & 0xF];
        }
        v118 = objc_alloc(MEMORY[0x1E0CB3940]);
        v119 = v124;
        v120 = 128;
      }
    }
    else if (*(_QWORD *)&data[0] == 4000)
    {
      v128 = (unsigned __int8 *)data + 8;
      v129 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v130 = v129;
      for (m = 0; m != 32; m += 2)
      {
        v132 = *v128++;
        v133 = &v129[m];
        *v133 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v132 >> 4];
        v133[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v132 & 0xF];
      }
      v118 = objc_alloc(MEMORY[0x1E0CB3940]);
      v119 = v130;
      v120 = 32;
    }
    else
    {
      if (*(_QWORD *)&data[0] != 4001)
        goto LABEL_150;
      v112 = (unsigned __int8 *)data + 8;
      v113 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      v114 = v113;
      for (n = 0; n != 40; n += 2)
      {
        v116 = *v112++;
        v117 = &v113[n];
        *v117 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v116 >> 4];
        v117[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v116 & 0xF];
      }
      v118 = objc_alloc(MEMORY[0x1E0CB3940]);
      v119 = v114;
      v120 = 40;
    }
    v140 = (void *)objc_msgSend(v118, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v119, v120, 4, 1);
    v121 = objc_msgSend(v140, "hash");

    return v121;
  }
  if (*(uint64_t *)&data[0] <= 2999)
  {
    if (*(_QWORD *)&data[0] != 1000)
    {
      if (*(_QWORD *)&data[0] != 2000)
        goto LABEL_150;
      return DWORD2(data[0]);
    }
    return *((_QWORD *)&data[0] + 1);
  }
  if (*(_QWORD *)&data[0] == 3000)
    return DWORD2(data[0]);
  if (*(_QWORD *)&data[0] != 3001)
  {
LABEL_150:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSUInteger _MSVHashGetHash(MSVHash)");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "handleFailureInFunction:file:lineNumber:description:", v143, CFSTR("MSVHasher+Algorithms.h"), 301, CFSTR("Cannot obtain hash from unknown hasher algorithm"));

    return 0;
  }
  return *((_QWORD *)&data[0] + 1);
}

- (MPModelSortDescriptor)initWithCoder:(id)a3
{
  id v4;
  MPModelSortDescriptor *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPModelSortDescriptor;
  v5 = -[MPModelSortDescriptor initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("keyPath"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPModelSortDescriptor setKeyPath:](v5, "setKeyPath:", v9);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPModelSortDescriptor;
  v4 = a3;
  -[MPModelSortDescriptor encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[MPModelSortDescriptor keyPath](self, "keyPath", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("keyPath"));

}

- (NSArray)keyPath
{
  return self->_keyPath;
}

- (void)setKeyPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPath, 0);
}

+ (id)sortDescriptorWithKeyPath:(id)a3 ascending:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  id v6;
  objc_class *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v5 = a3;
  v6 = objc_alloc((Class)objc_opt_class());
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithKey:ascending:", v8, v4);

  objc_msgSend(v9, "setKeyPath:", v5);
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
