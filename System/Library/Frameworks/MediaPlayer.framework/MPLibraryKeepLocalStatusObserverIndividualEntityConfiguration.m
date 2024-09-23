@implementation MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration

- (void)setStoreRedownloadable:(BOOL)a3
{
  self->_storeRedownloadable = a3;
}

- (void)setManagedStatus:(int64_t)a3
{
  self->_managedStatus = a3;
}

- (void)setHasNonPurgeableAsset:(BOOL)a3
{
  self->_hasNonPurgeableAsset = a3;
}

- (int64_t)managedStatus
{
  return self->_managedStatus;
}

- (BOOL)isStoreRedownloadable
{
  return self->_storeRedownloadable;
}

- (BOOL)isCollectionType
{
  return self->_collectionType;
}

- (BOOL)hasNonPurgeableAsset
{
  return self->_hasNonPurgeableAsset;
}

- (BOOL)isEqual:(id)a3
{
  MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration *v4;
  MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  BOOL v8;
  objc_super v10;

  v4 = (MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (-[MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v10.receiver = self;
    v10.super_class = (Class)MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration;
    v8 = -[MPLibraryKeepLocalStatusObserverConfiguration isEqual:](&v10, sel_isEqual_, v5)
      && (v6 = -[MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration isCollectionType](self, "isCollectionType"), v6 == -[MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration isCollectionType](v5, "isCollectionType"))&& !self->_hasNonPurgeableAsset != v5->_hasNonPurgeableAsset&& (v7 = -[MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration isStoreRedownloadable](self, "isStoreRedownloadable"), v7 == -[MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration isStoreRedownloadable](v5, "isStoreRedownloadable"))&& self->_managedStatus == v5->_managedStatus;

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
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  CC_LONG64 v20;
  CC_LONG64 v21;
  uint64_t v22;
  CC_LONG64 v23;
  CC_LONG64 v24;
  CC_LONG64 v25;
  void *v26;
  void *v27;
  char *v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unsigned __int8 v32;
  unint64_t v33;
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
  unsigned int v47;
  CC_LONG64 v48;
  unint64_t v49;
  void *v50;
  void *v51;
  char *v52;
  unint64_t v53;
  int v54;
  unsigned int v55;
  unsigned __int8 v56;
  uint64_t v57;
  uint64_t v58;
  CC_LONG64 v59;
  CC_LONG64 v60;
  uint64_t v61;
  CC_LONG64 v62;
  CC_LONG64 v63;
  CC_LONG64 v64;
  int v65;
  unint64_t v66;
  int v67;
  char *v68;
  int v69;
  unint64_t v70;
  unsigned int v71;
  CC_LONG64 v72;
  unint64_t v73;
  void *v74;
  void *v75;
  char *v76;
  unint64_t v77;
  int v78;
  unsigned int v79;
  unsigned __int8 v80;
  uint64_t v81;
  uint64_t v82;
  CC_LONG64 v83;
  CC_LONG64 v84;
  uint64_t v85;
  CC_LONG64 v86;
  CC_LONG64 v87;
  CC_LONG64 v88;
  int v89;
  unint64_t v90;
  int v91;
  char *v92;
  int v93;
  unint64_t v94;
  uint64_t hasNonPurgeableAsset;
  CC_LONG64 v96;
  unint64_t v97;
  void *v98;
  void *v99;
  char *v100;
  unint64_t v101;
  int v102;
  int v103;
  unsigned __int8 v104;
  uint64_t v105;
  CC_LONG64 v106;
  CC_LONG64 v107;
  uint64_t v108;
  CC_LONG64 v109;
  CC_LONG64 v110;
  CC_LONG64 v111;
  unint64_t v112;
  int v113;
  char *v114;
  int v115;
  unint64_t v116;
  unint64_t managedStatus;
  uint64_t v118;
  unint64_t v119;
  CC_LONG64 v120;
  CC_LONG64 v121;
  uint64_t v122;
  CC_LONG64 v123;
  CC_LONG64 v124;
  CC_LONG64 v125;
  void *v126;
  void *v127;
  char *v128;
  unint64_t v129;
  unint64_t v130;
  unint64_t v131;
  unsigned __int8 v132;
  uint64_t v133;
  CC_LONG64 v134;
  CC_LONG64 v135;
  uint64_t v136;
  CC_LONG64 v137;
  CC_LONG64 v138;
  CC_LONG64 v139;
  int v140;
  unint64_t v141;
  int v142;
  char *v143;
  int v144;
  unint64_t v145;
  CC_LONG64 v146;
  CC_LONG64 v147;
  uint64_t v148;
  CC_LONG64 v149;
  CC_LONG64 v150;
  CC_LONG64 v151;
  CC_LONG64 v152;
  CC_LONG64 v153;
  CC_LONG64 v154;
  CC_LONG64 v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  CC_LONG64 v159;
  CC_LONG64 v160;
  CC_LONG64 v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  CC_LONG64 v173;
  CC_LONG64 v174;
  uint64_t v175;
  CC_LONG64 *v176;
  int v177;
  void *v178;
  void *v179;
  int v180;
  unsigned int v181;
  unint64_t v182;
  int v183;
  unint64_t v184;
  int v185;
  unint64_t v186;
  unsigned int v187;
  unsigned int v188;
  unsigned int v189;
  unsigned int v190;
  unsigned __int8 *v191;
  char *v192;
  char *v193;
  uint64_t m;
  unsigned int v195;
  char *v196;
  id v197;
  char *v198;
  uint64_t v199;
  unint64_t v200;
  unsigned __int8 *v201;
  char *v202;
  char *v203;
  uint64_t j;
  unsigned int v205;
  char *v206;
  unsigned __int8 *v207;
  char *v208;
  char *v209;
  uint64_t k;
  unsigned int v211;
  char *v212;
  unsigned __int8 *v213;
  char *v214;
  char *v215;
  uint64_t i;
  unsigned int v217;
  char *v218;
  void *v219;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  unint64_t v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  unint64_t v242;
  void *v243;
  void *v244;
  unint64_t v245;
  unsigned int v246;
  unsigned int v247;
  uint64_t v248;
  unint64_t v249;
  unsigned int v250;
  unsigned int v251;
  uint64_t v252;
  objc_super v253;
  uint64_t v254;
  CC_SHA512_CTX v255;
  _BYTE v256[72];
  _OWORD data[4];
  uint64_t v258;
  uint64_t v259;

  v259 = *MEMORY[0x1E0C80C00];
  v3 = MSVHasherSharedSeed();
  v5 = v4;
  memset(&v255.hash[3], 0, 168);
  v6 = v3 ^ 0x736F6D6570736575;
  v7 = v4 ^ 0x646F72616E646F6DLL;
  v8 = v3 ^ 0x6C7967656E657261;
  v254 = 1000;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  v12 = v5 ^ 0x7465646279746573 ^ v11;
  v13 = (v6 + v7) ^ __ROR8__(v7, 51);
  v14 = v8 + v12;
  v15 = (v8 + v12) ^ __ROR8__(v12, 48);
  v16 = v15 + __ROR8__(v6 + v7, 32);
  v17 = v14 + v13;
  v255.hash[0] = __ROR8__(v17, 32);
  v255.hash[1] = v16 ^ __ROR8__(v15, 43);
  v255.count[0] = v16 ^ v11;
  v255.count[1] = v17 ^ __ROR8__(v13, 47);
  v255.hash[2] = 0x800000000000000;

  v253.receiver = self;
  v253.super_class = (Class)MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration;
  v18 = -[MPLibraryKeepLocalStatusObserverConfiguration hash](&v253, sel_hash);
  *(_QWORD *)&data[0] = v18;
  if (v254 <= 3000)
  {
    if (v254 > 1999)
    {
      if (v254 == 2000)
      {
        v28 = (char *)BYTE3(v255.count[1]);
        v29 = (BYTE3(v255.count[1]) + 8) & 0x1FC;
        switch(BYTE3(v255.count[1]))
        {
          case 0:
            v30 = v18 >> 8;
            v31 = v18 >> 16;
            v32 = v18;
            v33 = v18 >> 24;
            goto LABEL_33;
          case 1:
            v31 = v18 >> 8;
            v32 = v255.count[1];
            LOBYTE(v30) = v18;
            v33 = v18 >> 16;
            goto LABEL_33;
          case 2:
            LOBYTE(v31) = v18;
            v33 = v18 >> 8;
            v32 = v255.count[1];
            LODWORD(v30) = HIBYTE(LOWORD(v255.count[1]));
LABEL_33:
            LODWORD(v18) = v33;
            break;
          case 3:
            v32 = v255.count[1];
            LODWORD(v30) = HIBYTE(LOWORD(v255.count[1]));
            LOBYTE(v31) = BYTE2(v255.count[1]);
            break;
          default:
LABEL_30:
            LOBYTE(v30) = 0;
            v32 = 0;
            LOBYTE(v31) = 0;
            LODWORD(v18) = 0;
            break;
        }
        v41 = (v31 << 16) | ((_DWORD)v18 << 24) | v32 | (v30 << 8);
        HIDWORD(v42) = (461845907 * ((380141568 * v41) | ((-862048943 * v41) >> 17))) ^ LODWORD(v255.count[0]);
        LODWORD(v42) = HIDWORD(v42);
        v43 = 5 * (v42 >> 19) - 430675100;
        LODWORD(v255.count[0]) = v43;
        v44 = (char *)((char *)data - v28 + 4);
        v28 = (char *)(v29 + (char *)data - v28);
        if (v29 >= 5)
        {
          do
          {
            v45 = *(_DWORD *)v44;
            v44 += 4;
            HIDWORD(v46) = (461845907 * ((380141568 * v45) | ((-862048943 * v45) >> 17))) ^ v43;
            LODWORD(v46) = HIDWORD(v46);
            v29 = 5 * (v46 >> 19);
            v43 = v29 - 430675100;
          }
          while (v44 < v28);
          LODWORD(v255.count[0]) = v29 - 430675100;
        }
        switch((int)v28)
        {
          case 0:
            break;
          case 1:
            LOBYTE(v255.count[1]) = *v28;
            break;
          case 2:
            LOWORD(v255.count[1]) = *(_WORD *)v28;
            break;
          case 3:
            LOWORD(v255.count[1]) = *(_WORD *)v28;
            BYTE2(v255.count[1]) = v28[2];
            break;
          default:
            goto LABEL_30;
        }
        BYTE3(v255.count[1]) &= 3u;
        HIDWORD(v255.count[0]) += 8;
      }
      else if (v254 == 3000)
      {
        _MSV_XXH_XXH32_update_15155(&v255, (char *)data, 8uLL);
      }
    }
    else if (v254)
    {
      if (v254 == 1000)
      {
        v19 = v255.hash[2];
        if ((v255.hash[2] & 0x400000000000000) != 0)
        {
          if ((v255.hash[2] & 0x300000000000000) != 0)
          {
            v249 = v18;
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v234 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            v235 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v234, "handleFailureInFunction:file:lineNumber:description:", v235, CFSTR("MSVHasher+SipHash.h"), 105, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld"), v255.hash[2]);

            v18 = v249;
            v19 = v255.hash[2];
          }
          v34 = v19 & 0xFFFFFFFFFFFFFFLL | (v18 << 32);
          v35 = (v255.count[0] + v255.count[1]) ^ __ROR8__(v255.count[1], 51);
          v36 = v255.hash[0] + (v34 ^ v255.hash[1]);
          v37 = __ROR8__(v34 ^ v255.hash[1], 48);
          v38 = (v36 ^ v37) + __ROR8__(v255.count[0] + v255.count[1], 32);
          v39 = v38 ^ __ROR8__(v36 ^ v37, 43);
          v40 = v36 + v35;
          v255.hash[0] = __ROR8__(v40, 32);
          v255.hash[1] = v39;
          v255.count[0] = v38 ^ v34;
          v255.count[1] = v40 ^ __ROR8__(v35, 47);
          v19 = v19 & 0xFF00000000000000 | HIDWORD(v18);
        }
        else
        {
          if ((v255.hash[2] & 0x7FFFFFFFFFFFFFFLL) != 0)
          {
            v245 = v18;
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v223 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
            v224 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v223, "handleFailureInFunction:file:lineNumber:description:", v224, CFSTR("MSVHasher+SipHash.h"), 101, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld"), v255.hash[2]);

            v18 = v245;
            v19 = v255.hash[2];
          }
          v20 = (v255.count[0] + v255.count[1]) ^ __ROR8__(v255.count[1], 51);
          v21 = v255.hash[0] + (v255.hash[1] ^ v18);
          v22 = __ROR8__(v255.hash[1] ^ v18, 48);
          v23 = (v21 ^ v22) + __ROR8__(v255.count[0] + v255.count[1], 32);
          v24 = v23 ^ __ROR8__(v21 ^ v22, 43);
          v25 = v21 + v20;
          v255.hash[0] = __ROR8__(v25, 32);
          v255.hash[1] = v24;
          v255.count[0] = v23 ^ v18;
          v255.count[1] = v25 ^ __ROR8__(v20, 47);
        }
        v255.hash[2] = v19 + 0x800000000000000;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasherAppend64(MSVHasher * _Nonnull, uint64_t)");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("MSVHasher+Algorithms.h"), 227, CFSTR("Cannot append to unknown hasher algorithm"));

    }
  }
  else if (v254 <= 4000)
  {
    if (v254 == 3001)
    {
      _MSV_XXH_XXH64_update_10930((char *)&v255, (char *)data, 8uLL);
    }
    else if (v254 == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&v255, data, 4u);
    }
  }
  else
  {
    switch(v254)
    {
      case 4001:
        CC_SHA1_Update((CC_SHA1_CTX *)&v255, data, 4u);
        break;
      case 4256:
        CC_SHA256_Update((CC_SHA256_CTX *)&v255, data, 4u);
        break;
      case 4512:
        CC_SHA512_Update(&v255, data, 4u);
        break;
    }
  }
  v47 = -[MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration isCollectionType](self, "isCollectionType");
  LODWORD(data[0]) = v47;
  if (v254 <= 3000)
  {
    if (v254 > 1999)
    {
      if (v254 == 2000)
      {
        v52 = (char *)BYTE3(v255.count[1]);
        v53 = (BYTE3(v255.count[1]) + 4) & 0x1FC;
        switch(BYTE3(v255.count[1]))
        {
          case 0:
            v54 = 0;
            v55 = 0;
            v56 = v47;
            goto LABEL_77;
          case 1:
            v55 = 0;
            v56 = v255.count[1];
            v54 = v47;
            goto LABEL_77;
          case 2:
            v56 = v255.count[1];
            v54 = HIBYTE(LOWORD(v255.count[1]));
            v55 = v47;
            goto LABEL_77;
          case 3:
            v56 = v255.count[1];
            v54 = HIBYTE(LOWORD(v255.count[1]));
            v55 = BYTE2(v255.count[1]);
            goto LABEL_79;
          default:
            while (2)
            {
              v54 = 0;
              v56 = 0;
              v55 = 0;
LABEL_77:
              v47 = 0;
LABEL_79:
              v65 = (v55 << 16) | (v47 << 24) | v56 | (v54 << 8);
              HIDWORD(v66) = (461845907 * ((380141568 * v65) | ((-862048943 * v65) >> 17))) ^ LODWORD(v255.count[0]);
              LODWORD(v66) = HIDWORD(v66);
              v67 = 5 * (v66 >> 19) - 430675100;
              LODWORD(v255.count[0]) = v67;
              v68 = (char *)((char *)data - v52 + 4);
              v52 = (char *)(v53 + (char *)data - v52);
              if (v53 >= 5)
              {
                do
                {
                  v69 = *(_DWORD *)v68;
                  v68 += 4;
                  HIDWORD(v70) = (461845907 * ((380141568 * v69) | ((-862048943 * v69) >> 17))) ^ v67;
                  LODWORD(v70) = HIDWORD(v70);
                  v53 = 5 * (v70 >> 19);
                  v67 = v53 - 430675100;
                }
                while (v68 < v52);
                LODWORD(v255.count[0]) = v53 - 430675100;
              }
              switch((int)v52)
              {
                case 0:
                  break;
                case 1:
                  LOBYTE(v255.count[1]) = *v52;
                  break;
                case 2:
                  LOWORD(v255.count[1]) = *(_WORD *)v52;
                  break;
                case 3:
                  LOWORD(v255.count[1]) = *(_WORD *)v52;
                  BYTE2(v255.count[1]) = v52[2];
                  break;
                default:
                  continue;
              }
              break;
            }
            BYTE3(v255.count[1]) &= 3u;
            HIDWORD(v255.count[0]) += 4;
            break;
        }
      }
      else if (v254 == 3000)
      {
        _MSV_XXH_XXH32_update_15155(&v255, (char *)data, 4uLL);
      }
    }
    else if (v254)
    {
      if (v254 == 1000)
      {
        v48 = v255.hash[2];
        if ((v255.hash[2] & 0x400000000000000) != 0)
        {
          if ((v255.hash[2] & 0x300000000000000) != 0)
          {
            v250 = v47;
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v236 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
            v237 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v236, "handleFailureInFunction:file:lineNumber:description:", v237, CFSTR("MSVHasher+SipHash.h"), 91, CFSTR("_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 3]: %lld"), v255.hash[2]);

            v47 = v250;
            v48 = v255.hash[2];
          }
          v57 = 0x100000000;
          if (!v47)
            v57 = 0;
          v58 = v48 & 0xFFFFFFFFFFFFFFLL | v57;
          v59 = (v255.count[0] + v255.count[1]) ^ __ROR8__(v255.count[1], 51);
          v60 = v255.hash[0] + (v58 ^ v255.hash[1]);
          v61 = __ROR8__(v58 ^ v255.hash[1], 48);
          v62 = (v60 ^ v61) + __ROR8__(v255.count[0] + v255.count[1], 32);
          v63 = v62 ^ __ROR8__(v60 ^ v61, 43);
          v64 = v60 + v59;
          v255.hash[0] = __ROR8__(v64, 32);
          v255.hash[1] = v63;
          v255.count[0] = v62 ^ v58;
          v255.count[1] = v64 ^ __ROR8__(v59, 47);
          v49 = v48 & 0xFF00000000000000;
        }
        else
        {
          if ((v255.hash[2] & 0x7FFFFFFFFFFFFFFLL) != 0)
          {
            v246 = v47;
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v225 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
            v226 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v225, "handleFailureInFunction:file:lineNumber:description:", v226, CFSTR("MSVHasher+SipHash.h"), 88, CFSTR("_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 7, tail == 0]: %lld"), v255.hash[2]);

            v47 = v246;
            v48 = v255.hash[2];
          }
          v49 = v48 | v47;
        }
        v255.hash[2] = v49 + 0x400000000000000;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasherAppend32(MSVHasher * _Nonnull, uint32_t)");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "handleFailureInFunction:file:lineNumber:description:", v51, CFSTR("MSVHasher+Algorithms.h"), 192, CFSTR("Cannot append to unknown hasher algorithm"));

    }
  }
  else if (v254 <= 4000)
  {
    if (v254 == 3001)
    {
      _MSV_XXH_XXH64_update_10930((char *)&v255, (char *)data, 4uLL);
    }
    else if (v254 == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&v255, data, 4u);
    }
  }
  else
  {
    switch(v254)
    {
      case 4001:
        CC_SHA1_Update((CC_SHA1_CTX *)&v255, data, 4u);
        break;
      case 4256:
        CC_SHA256_Update((CC_SHA256_CTX *)&v255, data, 4u);
        break;
      case 4512:
        CC_SHA512_Update(&v255, data, 4u);
        break;
    }
  }
  v71 = -[MPLibraryKeepLocalStatusObserverIndividualEntityConfiguration isStoreRedownloadable](self, "isStoreRedownloadable");
  LODWORD(data[0]) = v71;
  if (v254 <= 3000)
  {
    if (v254 > 1999)
    {
      if (v254 == 2000)
      {
        v76 = (char *)BYTE3(v255.count[1]);
        v77 = (BYTE3(v255.count[1]) + 4) & 0x1FC;
        switch(BYTE3(v255.count[1]))
        {
          case 0:
            v78 = 0;
            v79 = 0;
            v80 = v71;
            goto LABEL_121;
          case 1:
            v79 = 0;
            v80 = v255.count[1];
            v78 = v71;
            goto LABEL_121;
          case 2:
            v80 = v255.count[1];
            v78 = HIBYTE(LOWORD(v255.count[1]));
            v79 = v71;
            goto LABEL_121;
          case 3:
            v80 = v255.count[1];
            v78 = HIBYTE(LOWORD(v255.count[1]));
            v79 = BYTE2(v255.count[1]);
            goto LABEL_123;
          default:
            while (2)
            {
              v78 = 0;
              v80 = 0;
              v79 = 0;
LABEL_121:
              v71 = 0;
LABEL_123:
              v89 = (v79 << 16) | (v71 << 24) | v80 | (v78 << 8);
              HIDWORD(v90) = (461845907 * ((380141568 * v89) | ((-862048943 * v89) >> 17))) ^ LODWORD(v255.count[0]);
              LODWORD(v90) = HIDWORD(v90);
              v91 = 5 * (v90 >> 19) - 430675100;
              LODWORD(v255.count[0]) = v91;
              v92 = (char *)((char *)data - v76 + 4);
              v76 = (char *)(v77 + (char *)data - v76);
              if (v77 >= 5)
              {
                do
                {
                  v93 = *(_DWORD *)v92;
                  v92 += 4;
                  HIDWORD(v94) = (461845907 * ((380141568 * v93) | ((-862048943 * v93) >> 17))) ^ v91;
                  LODWORD(v94) = HIDWORD(v94);
                  v77 = 5 * (v94 >> 19);
                  v91 = v77 - 430675100;
                }
                while (v92 < v76);
                LODWORD(v255.count[0]) = v77 - 430675100;
              }
              switch((int)v76)
              {
                case 0:
                  break;
                case 1:
                  LOBYTE(v255.count[1]) = *v76;
                  break;
                case 2:
                  LOWORD(v255.count[1]) = *(_WORD *)v76;
                  break;
                case 3:
                  LOWORD(v255.count[1]) = *(_WORD *)v76;
                  BYTE2(v255.count[1]) = v76[2];
                  break;
                default:
                  continue;
              }
              break;
            }
            BYTE3(v255.count[1]) &= 3u;
            HIDWORD(v255.count[0]) += 4;
            break;
        }
      }
      else if (v254 == 3000)
      {
        _MSV_XXH_XXH32_update_15155(&v255, (char *)data, 4uLL);
      }
    }
    else if (v254)
    {
      if (v254 == 1000)
      {
        v72 = v255.hash[2];
        if ((v255.hash[2] & 0x400000000000000) != 0)
        {
          if ((v255.hash[2] & 0x300000000000000) != 0)
          {
            v251 = v71;
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v238 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
            v239 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v238, "handleFailureInFunction:file:lineNumber:description:", v239, CFSTR("MSVHasher+SipHash.h"), 91, CFSTR("_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 3]: %lld"), v255.hash[2]);

            v71 = v251;
            v72 = v255.hash[2];
          }
          v81 = 0x100000000;
          if (!v71)
            v81 = 0;
          v82 = v72 & 0xFFFFFFFFFFFFFFLL | v81;
          v83 = (v255.count[0] + v255.count[1]) ^ __ROR8__(v255.count[1], 51);
          v84 = v255.hash[0] + (v82 ^ v255.hash[1]);
          v85 = __ROR8__(v82 ^ v255.hash[1], 48);
          v86 = (v84 ^ v85) + __ROR8__(v255.count[0] + v255.count[1], 32);
          v87 = v86 ^ __ROR8__(v84 ^ v85, 43);
          v88 = v84 + v83;
          v255.hash[0] = __ROR8__(v88, 32);
          v255.hash[1] = v87;
          v255.count[0] = v86 ^ v82;
          v255.count[1] = v88 ^ __ROR8__(v83, 47);
          v73 = v72 & 0xFF00000000000000;
        }
        else
        {
          if ((v255.hash[2] & 0x7FFFFFFFFFFFFFFLL) != 0)
          {
            v247 = v71;
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v227 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
            v228 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v227, "handleFailureInFunction:file:lineNumber:description:", v228, CFSTR("MSVHasher+SipHash.h"), 88, CFSTR("_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 7, tail == 0]: %lld"), v255.hash[2]);

            v71 = v247;
            v72 = v255.hash[2];
          }
          v73 = v72 | v71;
        }
        v255.hash[2] = v73 + 0x400000000000000;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasherAppend32(MSVHasher * _Nonnull, uint32_t)");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "handleFailureInFunction:file:lineNumber:description:", v75, CFSTR("MSVHasher+Algorithms.h"), 192, CFSTR("Cannot append to unknown hasher algorithm"));

    }
  }
  else if (v254 <= 4000)
  {
    if (v254 == 3001)
    {
      _MSV_XXH_XXH64_update_10930((char *)&v255, (char *)data, 4uLL);
    }
    else if (v254 == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&v255, data, 4u);
    }
  }
  else
  {
    switch(v254)
    {
      case 4001:
        CC_SHA1_Update((CC_SHA1_CTX *)&v255, data, 4u);
        break;
      case 4256:
        CC_SHA256_Update((CC_SHA256_CTX *)&v255, data, 4u);
        break;
      case 4512:
        CC_SHA512_Update(&v255, data, 4u);
        break;
    }
  }
  hasNonPurgeableAsset = self->_hasNonPurgeableAsset;
  LODWORD(data[0]) = self->_hasNonPurgeableAsset;
  if (v254 <= 3000)
  {
    if (v254 > 1999)
    {
      if (v254 == 2000)
      {
        v100 = (char *)BYTE3(v255.count[1]);
        v101 = (BYTE3(v255.count[1]) + 4) & 0x1FC;
        switch(BYTE3(v255.count[1]))
        {
          case 0:
            v102 = 0;
            v103 = 0;
            v104 = hasNonPurgeableAsset;
            goto LABEL_163;
          case 1:
            v103 = 0;
            v104 = v255.count[1];
            v102 = hasNonPurgeableAsset;
            goto LABEL_163;
          case 2:
            v104 = v255.count[1];
            v102 = HIBYTE(LOWORD(v255.count[1]));
            v103 = hasNonPurgeableAsset;
            goto LABEL_163;
          case 3:
            v104 = v255.count[1];
            v102 = HIBYTE(LOWORD(v255.count[1]));
            v103 = BYTE2(v255.count[1]);
            goto LABEL_165;
          default:
            while (2)
            {
              v102 = 0;
              v104 = 0;
              v103 = 0;
LABEL_163:
              LODWORD(hasNonPurgeableAsset) = 0;
LABEL_165:
              HIDWORD(v112) = (461845907
                             * ((380141568 * ((v103 << 16) | ((_DWORD)hasNonPurgeableAsset << 24) | v104 | (v102 << 8))) | ((-862048943 * ((v103 << 16) | ((_DWORD)hasNonPurgeableAsset << 24) | v104 | (v102 << 8))) >> 17))) ^ LODWORD(v255.count[0]);
              LODWORD(v112) = HIDWORD(v112);
              v113 = 5 * (v112 >> 19) - 430675100;
              LODWORD(v255.count[0]) = v113;
              v100 = (char *)((char *)data - v100 + 4);
              v114 = &v100[v101 - 4];
              if (v101 >= 5)
              {
                do
                {
                  v115 = *(_DWORD *)v100;
                  v100 += 4;
                  HIDWORD(v116) = (461845907 * ((380141568 * v115) | ((-862048943 * v115) >> 17))) ^ v113;
                  LODWORD(v116) = HIDWORD(v116);
                  v101 = 5 * (v116 >> 19);
                  v113 = v101 - 430675100;
                }
                while (v100 < v114);
                LODWORD(v255.count[0]) = v101 - 430675100;
              }
              switch((int)v100)
              {
                case 0:
                  break;
                case 1:
                  LOBYTE(v255.count[1]) = *v114;
                  break;
                case 2:
                  LOWORD(v255.count[1]) = *(_WORD *)v114;
                  break;
                case 3:
                  LOWORD(v255.count[1]) = *(_WORD *)v114;
                  BYTE2(v255.count[1]) = v114[2];
                  break;
                default:
                  continue;
              }
              break;
            }
            BYTE3(v255.count[1]) &= 3u;
            HIDWORD(v255.count[0]) += 4;
            break;
        }
      }
      else if (v254 == 3000)
      {
        _MSV_XXH_XXH32_update_15155(&v255, (char *)data, 4uLL);
      }
    }
    else if (v254)
    {
      if (v254 == 1000)
      {
        v96 = v255.hash[2];
        if ((v255.hash[2] & 0x400000000000000) != 0)
        {
          if ((v255.hash[2] & 0x300000000000000) != 0)
          {
            v252 = hasNonPurgeableAsset;
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v240 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
            v241 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v240, "handleFailureInFunction:file:lineNumber:description:", v241, CFSTR("MSVHasher+SipHash.h"), 91, CFSTR("_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 3]: %lld"), v255.hash[2]);

            hasNonPurgeableAsset = v252;
            v96 = v255.hash[2];
          }
          v105 = v96 & 0xFFFFFFFFFFFFFFLL | (hasNonPurgeableAsset << 32);
          v106 = (v255.count[0] + v255.count[1]) ^ __ROR8__(v255.count[1], 51);
          v107 = v255.hash[0] + (v105 ^ v255.hash[1]);
          v108 = __ROR8__(v105 ^ v255.hash[1], 48);
          v109 = (v107 ^ v108) + __ROR8__(v255.count[0] + v255.count[1], 32);
          v110 = v109 ^ __ROR8__(v107 ^ v108, 43);
          v111 = v107 + v106;
          v255.hash[0] = __ROR8__(v111, 32);
          v255.hash[1] = v110;
          v255.count[0] = v109 ^ v105;
          v255.count[1] = v111 ^ __ROR8__(v106, 47);
          v97 = v96 & 0xFF00000000000000;
        }
        else
        {
          if ((v255.hash[2] & 0x7FFFFFFFFFFFFFFLL) != 0)
          {
            v248 = hasNonPurgeableAsset;
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v229 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append32(MSVHasherSipHash_1_3 *, uint32_t)");
            v230 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v229, "handleFailureInFunction:file:lineNumber:description:", v230, CFSTR("MSVHasher+SipHash.h"), 88, CFSTR("_MSVHasher_SipHash_1_3_Append32: invalid byte count detected [byteCount & 7, tail == 0]: %lld"), v255.hash[2]);

            hasNonPurgeableAsset = v248;
            v96 = v255.hash[2];
          }
          v97 = v96 | hasNonPurgeableAsset;
        }
        v255.hash[2] = v97 + 0x400000000000000;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasherAppend32(MSVHasher * _Nonnull, uint32_t)");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "handleFailureInFunction:file:lineNumber:description:", v99, CFSTR("MSVHasher+Algorithms.h"), 192, CFSTR("Cannot append to unknown hasher algorithm"));

    }
  }
  else if (v254 <= 4000)
  {
    if (v254 == 3001)
    {
      _MSV_XXH_XXH64_update_10930((char *)&v255, (char *)data, 4uLL);
    }
    else if (v254 == 4000)
    {
      CC_MD5_Update((CC_MD5_CTX *)&v255, data, 4u);
    }
  }
  else
  {
    switch(v254)
    {
      case 4001:
        CC_SHA1_Update((CC_SHA1_CTX *)&v255, data, 4u);
        break;
      case 4256:
        CC_SHA256_Update((CC_SHA256_CTX *)&v255, data, 4u);
        break;
      case 4512:
        CC_SHA512_Update(&v255, data, 4u);
        break;
    }
  }
  managedStatus = self->_managedStatus;
  *(_QWORD *)&data[0] = managedStatus;
  v118 = v254;
  if (v254 <= 3000)
  {
    if (v254 > 1999)
    {
      if (v254 == 2000)
      {
        v128 = (char *)BYTE3(v255.count[1]);
        v129 = (BYTE3(v255.count[1]) + 8) & 0x1FC;
        switch(BYTE3(v255.count[1]))
        {
          case 0:
            v130 = managedStatus >> 8;
            v131 = managedStatus >> 16;
            v132 = managedStatus;
            managedStatus >>= 24;
            break;
          case 1:
            v131 = managedStatus >> 8;
            v132 = v255.count[1];
            LOBYTE(v130) = managedStatus;
            managedStatus >>= 16;
            break;
          case 2:
            LOBYTE(v131) = managedStatus;
            managedStatus >>= 8;
            v132 = v255.count[1];
            LODWORD(v130) = HIBYTE(LOWORD(v255.count[1]));
            break;
          case 3:
            v132 = v255.count[1];
            LODWORD(v130) = HIBYTE(LOWORD(v255.count[1]));
            LOBYTE(v131) = BYTE2(v255.count[1]);
            break;
          default:
LABEL_202:
            LOBYTE(v130) = 0;
            v132 = 0;
            LOBYTE(v131) = 0;
            LODWORD(managedStatus) = 0;
            break;
        }
        v140 = (v131 << 16) | ((_DWORD)managedStatus << 24) | v132 | (v130 << 8);
        HIDWORD(v141) = (461845907 * ((380141568 * v140) | ((-862048943 * v140) >> 17))) ^ LODWORD(v255.count[0]);
        LODWORD(v141) = HIDWORD(v141);
        v142 = 5 * (v141 >> 19) - 430675100;
        LODWORD(v255.count[0]) = v142;
        v128 = (char *)((char *)data - v128 + 4);
        v143 = &v128[v129 - 4];
        if (v129 >= 5)
        {
          do
          {
            v144 = *(_DWORD *)v128;
            v128 += 4;
            HIDWORD(v145) = (461845907 * ((380141568 * v144) | ((-862048943 * v144) >> 17))) ^ v142;
            LODWORD(v145) = HIDWORD(v145);
            v129 = 5 * (v145 >> 19);
            v142 = v129 - 430675100;
          }
          while (v128 < v143);
          LODWORD(v255.count[0]) = v129 - 430675100;
        }
        switch((int)v128)
        {
          case 0:
            break;
          case 1:
            LOBYTE(v255.count[1]) = *v143;
            break;
          case 2:
            LOWORD(v255.count[1]) = *(_WORD *)v143;
            break;
          case 3:
            LOWORD(v255.count[1]) = *(_WORD *)v143;
            BYTE2(v255.count[1]) = v143[2];
            break;
          default:
            goto LABEL_202;
        }
        BYTE3(v255.count[1]) &= 3u;
        HIDWORD(v255.count[0]) += 8;
      }
      else
      {
        if (v254 != 3000)
          goto LABEL_216;
        _MSV_XXH_XXH32_update_15155(&v255, (char *)data, 8uLL);
      }
    }
    else if (v254)
    {
      if (v254 != 1000)
        goto LABEL_216;
      v119 = v255.hash[2];
      if ((v255.hash[2] & 0x400000000000000) != 0)
      {
        if ((v255.hash[2] & 0x300000000000000) != 0)
        {
          v242 = managedStatus;
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v243 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
          v244 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v243, "handleFailureInFunction:file:lineNumber:description:", v244, CFSTR("MSVHasher+SipHash.h"), 105, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld"), v255.hash[2]);

          managedStatus = v242;
          v119 = v255.hash[2];
        }
        v133 = v119 & 0xFFFFFFFFFFFFFFLL | (managedStatus << 32);
        v134 = (v255.count[0] + v255.count[1]) ^ __ROR8__(v255.count[1], 51);
        v135 = v255.hash[0] + (v133 ^ v255.hash[1]);
        v136 = __ROR8__(v133 ^ v255.hash[1], 48);
        v137 = (v135 ^ v136) + __ROR8__(v255.count[0] + v255.count[1], 32);
        v138 = v137 ^ __ROR8__(v135 ^ v136, 43);
        v139 = v135 + v134;
        v255.hash[0] = __ROR8__(v139, 32);
        v255.hash[1] = v138;
        v255.count[0] = v137 ^ v133;
        v255.count[1] = v139 ^ __ROR8__(v134, 47);
        v119 = v119 & 0xFF00000000000000 | HIDWORD(managedStatus);
      }
      else
      {
        if ((v255.hash[2] & 0x7FFFFFFFFFFFFFFLL) != 0)
        {
          v231 = managedStatus;
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v232 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
          v233 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v232, "handleFailureInFunction:file:lineNumber:description:", v233, CFSTR("MSVHasher+SipHash.h"), 101, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld"), v255.hash[2]);

          managedStatus = v231;
          v119 = v255.hash[2];
        }
        v120 = (v255.count[0] + v255.count[1]) ^ __ROR8__(v255.count[1], 51);
        v121 = v255.hash[0] + (v255.hash[1] ^ managedStatus);
        v122 = __ROR8__(v255.hash[1] ^ managedStatus, 48);
        v123 = (v121 ^ v122) + __ROR8__(v255.count[0] + v255.count[1], 32);
        v124 = v123 ^ __ROR8__(v121 ^ v122, 43);
        v125 = v121 + v120;
        v255.hash[0] = __ROR8__(v125, 32);
        v255.hash[1] = v124;
        v255.count[0] = v123 ^ managedStatus;
        v255.count[1] = v125 ^ __ROR8__(v120, 47);
      }
      v255.hash[2] = v119 + 0x800000000000000;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasherAppend64(MSVHasher * _Nonnull, uint64_t)");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "handleFailureInFunction:file:lineNumber:description:", v127, CFSTR("MSVHasher+Algorithms.h"), 227, CFSTR("Cannot append to unknown hasher algorithm"));

    }
  }
  else if (v254 <= 4000)
  {
    if (v254 == 3001)
    {
      _MSV_XXH_XXH64_update_10930((char *)&v255, (char *)data, 8uLL);
    }
    else
    {
      if (v254 != 4000)
        goto LABEL_216;
      CC_MD5_Update((CC_MD5_CTX *)&v255, data, 4u);
    }
  }
  else
  {
    switch(v254)
    {
      case 4001:
        CC_SHA1_Update((CC_SHA1_CTX *)&v255, data, 4u);
        break;
      case 4256:
        CC_SHA256_Update((CC_SHA256_CTX *)&v255, data, 4u);
        break;
      case 4512:
        CC_SHA512_Update(&v255, data, 4u);
        break;
      default:
        goto LABEL_216;
    }
  }
  v118 = v254;
LABEL_216:
  memset(&v256[8], 0, 64);
  *(_QWORD *)v256 = v118;
  if (v118 > 3000)
  {
    if (v118 <= 4000)
    {
      if (v118 == 3001)
      {
        *(_QWORD *)&v256[8] = _MSV_XXH_XXH64_digest(&v255);
      }
      else if (v118 == 4000)
      {
        CC_MD5_Final(&v256[8], (CC_MD5_CTX *)&v255);
      }
    }
    else
    {
      switch(v118)
      {
        case 4001:
          CC_SHA1_Final(&v256[8], (CC_SHA1_CTX *)&v255);
          break;
        case 4256:
          CC_SHA256_Final(&v256[8], (CC_SHA256_CTX *)&v255);
          break;
        case 4512:
          CC_SHA512_Final(&v256[8], &v255);
          break;
      }
    }
    goto LABEL_253;
  }
  if (v118 > 1999)
  {
    if (v118 != 2000)
    {
      if (v118 != 3000)
        goto LABEL_253;
      v176 = &v255.hash[1];
      if (HIDWORD(v255.count[0]))
        v177 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)&v255.count[1], (uint32x4_t)xmmword_193F0CA90), (int8x16_t)vshlq_u32(*(uint32x4_t *)&v255.count[1], (uint32x4_t)xmmword_193F0CA80)));
      else
        v177 = LODWORD(v255.hash[0]) + 374761393;
      v181 = LODWORD(v255.count[0]) + v177;
      v182 = v255.hash[3] & 0xF;
      if (v182 >= 4)
      {
        do
        {
          v183 = *(_DWORD *)v176;
          v176 = (CC_LONG64 *)((char *)v176 + 4);
          HIDWORD(v184) = v181 - 1028477379 * v183;
          LODWORD(v184) = HIDWORD(v184);
          v181 = 668265263 * (v184 >> 15);
          v182 -= 4;
        }
        while (v182 > 3);
      }
      for (; v182; --v182)
      {
        v185 = *(unsigned __int8 *)v176;
        v176 = (CC_LONG64 *)((char *)v176 + 1);
        HIDWORD(v186) = v181 + 374761393 * v185;
        LODWORD(v186) = HIDWORD(v186);
        v181 = -1640531535 * (v186 >> 21);
      }
      v187 = -1028477379 * ((-2048144777 * (v181 ^ (v181 >> 15))) ^ ((-2048144777 * (v181 ^ (v181 >> 15))) >> 13));
      v188 = v187 ^ HIWORD(v187);
      goto LABEL_252;
    }
    switch(BYTE3(v255.count[1]))
    {
      case 1u:
        v180 = LOBYTE(v255.count[1]);
        break;
      case 2u:
        v180 = LOWORD(v255.count[1]);
        break;
      case 3u:
        v180 = LOWORD(v255.count[1]) | (BYTE2(v255.count[1]) << 16);
        break;
      default:
        v189 = v255.count[0];
        goto LABEL_251;
    }
    v189 = (461845907 * ((380141568 * v180) | ((-862048943 * v180) >> 17))) ^ LODWORD(v255.count[0]);
LABEL_251:
    v190 = -2048144789 * (v189 ^ HIDWORD(v255.count[0]) ^ ((v189 ^ HIDWORD(v255.count[0])) >> 16));
    v188 = (-1028477387 * (v190 ^ (v190 >> 13))) ^ ((-1028477387 * (v190 ^ (v190 >> 13))) >> 16);
    LODWORD(v255.count[0]) = v188;
LABEL_252:
    *(_DWORD *)&v256[8] = v188;
    goto LABEL_253;
  }
  if (v118)
  {
    if (v118 == 1000)
    {
      v146 = (v255.count[0] + v255.count[1]) ^ __ROR8__(v255.count[1], 51);
      v147 = v255.hash[0] + (v255.hash[1] ^ v255.hash[2]);
      v148 = __ROR8__(v255.hash[1] ^ v255.hash[2], 48);
      v149 = (v147 ^ v148) + __ROR8__(v255.count[0] + v255.count[1], 32);
      v150 = v149 ^ __ROR8__(v147 ^ v148, 43);
      v151 = v147 + v146;
      v152 = v151 ^ __ROR8__(v146, 47);
      v153 = (v149 ^ v255.hash[2]) + v152;
      v154 = v153 ^ __ROR8__(v152, 51);
      v155 = (__ROR8__(v151, 32) ^ 0xFFLL) + v150;
      v156 = __ROR8__(v150, 48);
      v157 = __ROR8__(v153, 32) + (v155 ^ v156);
      v158 = v157 ^ __ROR8__(v155 ^ v156, 43);
      v159 = v154 + v155;
      v160 = v159 ^ __ROR8__(v154, 47);
      v161 = v160 + v157;
      v162 = v161 ^ __ROR8__(v160, 51);
      v163 = __ROR8__(v159, 32) + v158;
      v164 = __ROR8__(v158, 48);
      v165 = __ROR8__(v161, 32) + (v163 ^ v164);
      v166 = v165 ^ __ROR8__(v163 ^ v164, 43);
      v167 = v162 + v163;
      v168 = v167 ^ __ROR8__(v162, 47);
      v169 = v168 + v165;
      v170 = v169 ^ __ROR8__(v168, 51);
      v171 = __ROR8__(v167, 32) + v166;
      v172 = __ROR8__(v166, 48);
      v173 = __ROR8__(v169, 32) + (v171 ^ v172);
      v174 = v173 ^ __ROR8__(v171 ^ v172, 43);
      v175 = v170 + v171;
      v255.count[0] = v173;
      v255.count[1] = v175 ^ __ROR8__(v170, 47);
      v255.hash[0] = __ROR8__(v175, 32);
      v255.hash[1] = v174;
      *(_QWORD *)&v256[8] = v255.count[1] ^ v173 ^ v255.hash[0] ^ v174;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "handleFailureInFunction:file:lineNumber:description:", v179, CFSTR("MSVHasher+Algorithms.h"), 156, CFSTR("Cannot finalize unknown hasher algorithm"));

  }
LABEL_253:
  data[0] = *(_OWORD *)v256;
  data[1] = *(_OWORD *)&v256[16];
  data[2] = *(_OWORD *)&v256[32];
  data[3] = *(_OWORD *)&v256[48];
  v258 = *(_QWORD *)&v256[64];
  if (*(uint64_t *)v256 > 3999)
  {
    if (*(uint64_t *)&data[0] > 4255)
    {
      if (*(_QWORD *)&data[0] == 4256)
      {
        v213 = (unsigned __int8 *)data + 8;
        v214 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v215 = v214;
        for (i = 0; i != 64; i += 2)
        {
          v217 = *v213++;
          v218 = &v214[i];
          *v218 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v217 >> 4];
          v218[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v217 & 0xF];
        }
        v197 = objc_alloc(MEMORY[0x1E0CB3940]);
        v198 = v215;
        v199 = 64;
      }
      else
      {
        if (*(_QWORD *)&data[0] != 4512)
          goto LABEL_281;
        v201 = (unsigned __int8 *)data + 8;
        v202 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v203 = v202;
        for (j = 0; j != 128; j += 2)
        {
          v205 = *v201++;
          v206 = &v202[j];
          *v206 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v205 >> 4];
          v206[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v205 & 0xF];
        }
        v197 = objc_alloc(MEMORY[0x1E0CB3940]);
        v198 = v203;
        v199 = 128;
      }
    }
    else if (*(_QWORD *)&data[0] == 4000)
    {
      v207 = (unsigned __int8 *)data + 8;
      v208 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v209 = v208;
      for (k = 0; k != 32; k += 2)
      {
        v211 = *v207++;
        v212 = &v208[k];
        *v212 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v211 >> 4];
        v212[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v211 & 0xF];
      }
      v197 = objc_alloc(MEMORY[0x1E0CB3940]);
      v198 = v209;
      v199 = 32;
    }
    else
    {
      if (*(_QWORD *)&data[0] != 4001)
        goto LABEL_281;
      v191 = (unsigned __int8 *)data + 8;
      v192 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      v193 = v192;
      for (m = 0; m != 40; m += 2)
      {
        v195 = *v191++;
        v196 = &v192[m];
        *v196 = MSVFastHexStringFromBytes_hexCharacters_47995[(unint64_t)v195 >> 4];
        v196[1] = MSVFastHexStringFromBytes_hexCharacters_47995[v195 & 0xF];
      }
      v197 = objc_alloc(MEMORY[0x1E0CB3940]);
      v198 = v193;
      v199 = 40;
    }
    v219 = (void *)objc_msgSend(v197, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v198, v199, 4, 1);
    v200 = objc_msgSend(v219, "hash");

    return v200;
  }
  if (*(uint64_t *)&data[0] <= 2999)
  {
    if (*(_QWORD *)&data[0] != 1000)
    {
      if (*(_QWORD *)&data[0] != 2000)
        goto LABEL_281;
      return DWORD2(data[0]);
    }
    return *((_QWORD *)&data[0] + 1);
  }
  if (*(_QWORD *)&data[0] == 3000)
    return DWORD2(data[0]);
  if (*(_QWORD *)&data[0] != 3001)
  {
LABEL_281:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v221 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSUInteger _MSVHashGetHash(MSVHash)");
    v222 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v221, "handleFailureInFunction:file:lineNumber:description:", v222, CFSTR("MSVHasher+Algorithms.h"), 301, CFSTR("Cannot obtain hash from unknown hasher algorithm"));

    return 0;
  }
  return *((_QWORD *)&data[0] + 1);
}

- (void)setCollectionType:(BOOL)a3
{
  self->_collectionType = a3;
}

@end
