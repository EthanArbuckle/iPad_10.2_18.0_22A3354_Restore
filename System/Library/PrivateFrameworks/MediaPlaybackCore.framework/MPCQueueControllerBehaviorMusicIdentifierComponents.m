@implementation MPCQueueControllerBehaviorMusicIdentifierComponents

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredNextContentItemID, 0);
  objc_storeStrong((id *)&self->_itemSpecificContentItemID, 0);
  objc_storeStrong((id *)&self->_loadingSectionID, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_contentItemID, 0);
}

- (NSString)itemID
{
  return self->_itemID;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (id)copyWithBehaviorFlags:(unsigned __int16)a3
{
  id result;

  if (self->_behaviorFlags == a3)
    return self;
  result = -[MPCQueueControllerBehaviorMusicIdentifierComponents _copy](self, "_copy");
  *((_WORD *)result + 4) = a3;
  return result;
}

- (unsigned)behaviorFlags
{
  return self->_behaviorFlags;
}

- (NSString)contentItemID
{
  return self->_contentItemID;
}

- (int64_t)repeatIteration
{
  return self->_repeatIteration;
}

+ (id)itemComponentsWithSectionID:(id)a3 itemID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v11[0] = v5;
  v11[1] = &stru_24CABB5D0;
  v11[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(":"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[MPCQueueControllerBehaviorMusicIdentifierComponents _initWithContentItemID:sectionID:itemID:repeatIteration:type:loadingSectionID:itemSpecificContentItemID:deferredNextContentItemID:]([MPCQueueControllerBehaviorMusicIdentifierComponents alloc], "_initWithContentItemID:sectionID:itemID:repeatIteration:type:loadingSectionID:itemSpecificContentItemID:deferredNextContentItemID:", v8, v5, v6, 0, 0, 0, 0, 0);
  return v9;
}

- (id)copyWithRepeatIteration:(int64_t)a3
{
  MPCQueueControllerBehaviorMusicIdentifierComponents *v5;
  NSString *itemID;
  NSString *v7;
  NSString *v8;
  char *v9;
  int64_t quot;
  ldiv_t v11;
  uint64_t v12;
  const UInt8 *v13;
  __CFString *v14;
  NSString *v15;
  NSString *v16;
  NSString *v17;
  char *v18;
  int64_t v19;
  ldiv_t v20;
  uint64_t v21;
  const UInt8 *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  SEL v27;
  MPCQueueControllerBehaviorMusicIdentifierComponents *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSString *contentItemID;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  NSString *v38;
  NSString *v39;
  NSString *v40;
  NSString *itemSpecificContentItemID;
  NSString *v43;
  __CFString *v44;
  NSString *v45;
  _QWORD v46[3];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v5 = self;
  switch(self->_type)
  {
    case 0:
      itemID = self->_itemID;
      v7 = self->_sectionID;
      v8 = itemID;
      v43 = v7;
      if (a3)
      {
        v9 = (char *)&v47 + 1;
        quot = a3;
        do
        {
          v11 = ldiv(quot, 10);
          quot = v11.quot;
          if (v11.rem >= 0)
            LOBYTE(v12) = v11.rem;
          else
            v12 = -v11.rem;
          *(v9 - 2) = v12 + 48;
          v13 = (const UInt8 *)(v9 - 2);
          --v9;
        }
        while (v11.quot);
        if (a3 < 0)
        {
          *(v9 - 2) = 45;
          v13 = (const UInt8 *)(v9 - 2);
        }
        v14 = (__CFString *)CFStringCreateWithBytes(0, v13, (char *)&v47 - (char *)v13, 0x8000100u, 0);
      }
      else
      {
        v14 = &stru_24CABB5D0;
      }
      v44 = v14;
      v45 = v8;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v43, 3);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "componentsJoinedByString:", CFSTR(":"));
      v31 = objc_claimAutoreleasedReturnValue();

      if (a3)
      v5 = -[MPCQueueControllerBehaviorMusicIdentifierComponents _copy](v5, "_copy");
      contentItemID = v5->_contentItemID;
      v5->_contentItemID = (NSString *)v31;

      v5->_repeatIteration = a3;
      break;
    case 1:
      v15 = self->_itemID;
      v16 = self->_sectionID;
      v17 = v15;
      v43 = v16;
      if (a3)
      {
        v18 = (char *)&v47 + 1;
        v19 = a3;
        do
        {
          v20 = ldiv(v19, 10);
          v19 = v20.quot;
          if (v20.rem >= 0)
            LOBYTE(v21) = v20.rem;
          else
            v21 = -v20.rem;
          *(v18 - 2) = v21 + 48;
          v22 = (const UInt8 *)(v18 - 2);
          --v18;
        }
        while (v20.quot);
        if (a3 < 0)
        {
          *(v18 - 2) = 45;
          v22 = (const UInt8 *)(v18 - 2);
        }
        v23 = (__CFString *)CFStringCreateWithBytes(0, v22, (char *)&v47 - (char *)v22, 0x8000100u, 0);
      }
      else
      {
        v23 = &stru_24CABB5D0;
      }
      v44 = v23;
      v45 = v17;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v43, 3);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "componentsJoinedByString:", CFSTR(":"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (a3)
      v46[0] = CFSTR("PLACEHOLDER");
      v46[1] = v34;
      v35 = (void *)MEMORY[0x24BDBCE30];
      v36 = v34;
      objc_msgSend(v35, "arrayWithObjects:count:", v46, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v37, "componentsJoinedByString:", CFSTR("="));
      v38 = (NSString *)objc_claimAutoreleasedReturnValue();

      v5 = -[MPCQueueControllerBehaviorMusicIdentifierComponents _copy](v5, "_copy");
      v39 = v5->_contentItemID;
      v5->_contentItemID = v38;
      v40 = v38;

      v5->_repeatIteration = a3;
      itemSpecificContentItemID = v5->_itemSpecificContentItemID;
      v5->_itemSpecificContentItemID = (NSString *)v36;

      break;
    case 2:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      v26 = CFSTR("Cannot change repeatIteration for SectionPlaceholder");
      v27 = a2;
      v28 = v5;
      v29 = 201;
      goto LABEL_22;
    case 3:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      v26 = CFSTR("Cannot change repeatIteration for EndOfQueuePlaceholder");
      v27 = a2;
      v28 = v5;
      v29 = 198;
LABEL_22:
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", v27, v28, CFSTR("MPCQueueControllerBehaviorMusicIdentifierComponents.m"), v29, v26);

      v5 = 0;
      break;
    default:
      return v5;
  }
  return v5;
}

- (id)_copy
{
  MPCQueueControllerBehaviorMusicIdentifierComponents *v3;

  v3 = objc_alloc_init(MPCQueueControllerBehaviorMusicIdentifierComponents);
  objc_storeStrong((id *)&v3->_contentItemID, self->_contentItemID);
  objc_storeStrong((id *)&v3->_sectionID, self->_sectionID);
  objc_storeStrong((id *)&v3->_itemID, self->_itemID);
  v3->_repeatIteration = self->_repeatIteration;
  v3->_type = self->_type;
  objc_storeStrong((id *)&v3->_loadingSectionID, self->_loadingSectionID);
  objc_storeStrong((id *)&v3->_itemSpecificContentItemID, self->_itemSpecificContentItemID);
  objc_storeStrong((id *)&v3->_deferredNextContentItemID, self->_deferredNextContentItemID);
  v3->_behaviorFlags = self->_behaviorFlags;
  return v3;
}

- (id)_initWithContentItemID:(id)a3 sectionID:(id)a4 itemID:(id)a5 repeatIteration:(int64_t)a6 type:(int64_t)a7 loadingSectionID:(id)a8 itemSpecificContentItemID:(id)a9 deferredNextContentItemID:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  MPCQueueControllerBehaviorMusicIdentifierComponents *v22;
  uint64_t v23;
  NSString *contentItemID;
  uint64_t v25;
  NSString *sectionID;
  uint64_t v27;
  NSString *itemID;
  uint64_t v29;
  NSString *loadingSectionID;
  uint64_t v31;
  NSString *itemSpecificContentItemID;
  uint64_t v33;
  NSString *deferredNextContentItemID;
  objc_super v36;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v36.receiver = self;
  v36.super_class = (Class)MPCQueueControllerBehaviorMusicIdentifierComponents;
  v22 = -[MPCQueueControllerBehaviorMusicIdentifierComponents init](&v36, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v16, "copy");
    contentItemID = v22->_contentItemID;
    v22->_contentItemID = (NSString *)v23;

    v25 = objc_msgSend(v17, "copy");
    sectionID = v22->_sectionID;
    v22->_sectionID = (NSString *)v25;

    v27 = objc_msgSend(v18, "copy");
    itemID = v22->_itemID;
    v22->_itemID = (NSString *)v27;

    v22->_repeatIteration = a6;
    v22->_type = a7;
    v29 = objc_msgSend(v19, "copy");
    loadingSectionID = v22->_loadingSectionID;
    v22->_loadingSectionID = (NSString *)v29;

    v31 = objc_msgSend(v20, "copy");
    itemSpecificContentItemID = v22->_itemSpecificContentItemID;
    v22->_itemSpecificContentItemID = (NSString *)v31;

    v33 = objc_msgSend(v21, "copy");
    deferredNextContentItemID = v22->_deferredNextContentItemID;
    v22->_deferredNextContentItemID = (NSString *)v33;

  }
  return v22;
}

- (unint64_t)uid
{
  NSString *itemID;
  void *v4;
  NSString *v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t *v10;
  uint64_t *v11;
  id v12;
  _BYTE *v13;
  unint64_t v14;
  int v15;
  int v16;
  __int8 *v17;
  unint64_t v18;
  int v19;
  void *v20;
  void *v21;
  _BOOL4 v23;
  int v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  _BYTE *v30;
  unint64_t v31;
  __int32 v32;
  __int32 v33;
  __int32 v34;
  __int32 v35;
  __int32 v36;
  unint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
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
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  __int32 v70;
  void *v71;
  void *v72;
  unint64_t v73;
  int v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  unsigned int v78;
  unsigned int v79;
  unint64_t v80;
  unsigned __int32 v81;
  unint64_t v82;
  int v83;
  unint64_t v84;
  int v85;
  unint64_t v86;
  unsigned int v87;
  unsigned int v88;
  unsigned int v89;
  unsigned int v90;
  unsigned __int8 *v91;
  char *v92;
  char *v93;
  uint64_t m;
  unsigned int v95;
  char *v96;
  id v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  unsigned __int8 *v101;
  char *v102;
  char *v103;
  uint64_t j;
  unsigned int v105;
  char *v106;
  unsigned __int8 *v107;
  char *v108;
  char *v109;
  uint64_t k;
  unsigned int v111;
  char *v112;
  unsigned __int8 *v113;
  char *v114;
  char *v115;
  uint64_t i;
  unsigned int v117;
  char *v118;
  void *v119;
  void *v121;
  void *v122;
  __int128 v123;
  uint32x4_t v124;
  unint64_t v125;
  unint64_t v126;
  __int128 v127;
  __int128 v128;
  uint64_t v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  _BYTE v138[72];
  _OWORD v139[4];
  uint64_t v140;
  uint64_t v141;

  v141 = *MEMORY[0x24BDAC8D0];
  if (self->_type <= 1uLL)
  {
    itemID = self->_itemID;
    *(_QWORD *)&v123 = self->_sectionID;
    *((_QWORD *)&v123 + 1) = &stru_24CABB5D0;
    v124.i64[0] = (uint64_t)itemID;
    v4 = (void *)MEMORY[0x24BDBCE30];
    v5 = itemID;
    v6 = (id)v123;
    objc_msgSend(v4, "arrayWithObjects:count:", &v123, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(":"), v123, v124.i64[0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *MEMORY[0x24BE65B78];
    v137 = 0u;
    v136 = 0u;
    v135 = 0u;
    v134 = 0u;
    v133 = 0u;
    v132 = 0u;
    v131 = 0u;
    v130 = 0u;
    v123 = xmmword_210ED9450;
    v124 = (uint32x4_t)vaddq_s64(vdupq_n_s64(v9), (int64x2_t)xmmword_210ED94C0);
    v10 = &v125;
    v125 = v9;
    v126 = v9 + 0x61C8864E7A143579;
    v11 = (uint64_t *)&v127;
    v127 = 0u;
    v128 = 0u;
    v129 = 0;
    v12 = objc_retainAutorelease(v8);
    v13 = (_BYTE *)objc_msgSend(v12, "UTF8String");
    v14 = objc_msgSend(v12, "length");
    v15 = v14;
    if ((uint64_t)v123 > 3999)
    {
      if ((uint64_t)v123 > 4255)
      {
        if ((_QWORD)v123 == 4256)
        {
          CC_SHA256_Update((CC_SHA256_CTX *)((char *)&v123 + 8), v13, v14);
        }
        else if ((_QWORD)v123 == 4512)
        {
          CC_SHA512_Update((CC_SHA512_CTX *)((char *)&v123 + 8), v13, v14);
        }
      }
      else if ((_QWORD)v123 == 4000)
      {
        CC_MD5_Update((CC_MD5_CTX *)((char *)&v123 + 8), v13, v14);
      }
      else if ((_QWORD)v123 == 4001)
      {
        CC_SHA1_Update((CC_SHA1_CTX *)((char *)&v123 + 8), v13, v14);
      }
    }
    else
    {
      if ((uint64_t)v123 <= 2999)
      {
        if ((_QWORD)v123)
        {
          if ((_QWORD)v123 == 2000)
          {
            v16 = (((v14 + v124.i8[3]) & 3) - v124.i8[3]);
            v17 = &v124.i8[v124.u8[3]];
            switch(v16)
            {
              case 0:
                break;
              case 1:
                *v17 = *v13;
                break;
              case 2:
                v38 = *(_WORD *)v13;
                goto LABEL_54;
              case 3:
                v38 = *(_WORD *)v13;
                v17[2] = v13[2];
LABEL_54:
                *(_WORD *)v17 = v38;
                break;
              default:
                memcpy(v17, v13, (((v15 + v124.i8[3]) & 3) - v124.i8[3]));
                break;
            }
            HIDWORD(v123) += v15;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _MSVHasherAppendBytes(MSVHasher * _Nonnull, const void * _Nonnull, size_t)");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("MSVHasher+Algorithms.h"), 262, CFSTR("Cannot append to unknown hasher algorithm"));

        }
        goto LABEL_56;
      }
      if ((_QWORD)v123 == 3000)
      {
        if (!v13)
          goto LABEL_56;
        v23 = v14 > 0xF || (DWORD2(v123) + v14) > 0xF;
        DWORD2(v123) += v14;
        HIDWORD(v123) |= v23;
        if (v14 + v127 > 0xF)
        {
          v30 = &v13[v14];
          if ((_DWORD)v127)
          {
            memcpy((char *)&v125 + v127, v13, (16 - v127));
            HIDWORD(v31) = v124.i32[0] - 2048144777 * v125;
            LODWORD(v31) = HIDWORD(v31);
            v32 = -1640531535 * (v31 >> 19);
            HIDWORD(v31) = v124.i32[1] - 2048144777 * HIDWORD(v125);
            LODWORD(v31) = HIDWORD(v31);
            v124.i32[0] = v32;
            v124.i32[1] = -1640531535 * (v31 >> 19);
            HIDWORD(v31) = v124.i32[2] - 2048144777 * v126;
            LODWORD(v31) = HIDWORD(v31);
            v124.i32[2] = -1640531535 * (v31 >> 19);
            HIDWORD(v31) = v124.i32[3] - 2048144777 * HIDWORD(v126);
            LODWORD(v31) = HIDWORD(v31);
            v13 += (16 - v127);
            v124.i32[3] = -1640531535 * (v31 >> 19);
            LODWORD(v127) = 0;
          }
          if (v13 <= v30 - 16)
          {
            v33 = v124.i32[0];
            v34 = v124.i32[1];
            v35 = v124.i32[2];
            v36 = v124.i32[3];
            do
            {
              HIDWORD(v37) = v33 - 2048144777 * *(_DWORD *)v13;
              LODWORD(v37) = HIDWORD(v37);
              v33 = -1640531535 * (v37 >> 19);
              HIDWORD(v37) = v34 - 2048144777 * *((_DWORD *)v13 + 1);
              LODWORD(v37) = HIDWORD(v37);
              v34 = -1640531535 * (v37 >> 19);
              HIDWORD(v37) = v35 - 2048144777 * *((_DWORD *)v13 + 2);
              LODWORD(v37) = HIDWORD(v37);
              v35 = -1640531535 * (v37 >> 19);
              HIDWORD(v37) = v36 - 2048144777 * *((_DWORD *)v13 + 3);
              LODWORD(v37) = HIDWORD(v37);
              v36 = -1640531535 * (v37 >> 19);
              v13 += 16;
            }
            while (v13 <= v30 - 16);
            v124.i64[0] = __PAIR64__(v34, v33);
            v124.i64[1] = __PAIR64__(v36, v35);
          }
          if (v13 >= v30)
            goto LABEL_56;
          v24 = (_DWORD)v30 - (_DWORD)v13;
          __memcpy_chk();
        }
        else
        {
          memcpy((char *)&v125 + v127, v13, v14);
          v24 = v127 + v15;
        }
        LODWORD(v127) = v24;
        goto LABEL_56;
      }
      if ((_QWORD)v123 != 3001 || !v13)
        goto LABEL_56;
      *((_QWORD *)&v123 + 1) += v14;
      if (v14 + v129 <= 0x1F)
      {
        memcpy((char *)&v127 + v129, v13, v14);
        v19 = v129 + v15;
LABEL_41:
        LODWORD(v129) = v19;
        goto LABEL_56;
      }
      v25 = (unint64_t)&v13[v14];
      if ((_DWORD)v129)
      {
        memcpy((char *)&v127 + v129, v13, (32 - v129));
        v124.i64[0] = 0x9E3779B185EBCA87 * __ROR8__(v124.i64[0] - 0x3D4D51C2D82B14B1 * v127, 33);
        v124.i64[1] = 0x9E3779B185EBCA87 * __ROR8__(v124.i64[1] - 0x3D4D51C2D82B14B1 * *((_QWORD *)&v127 + 1), 33);
        v125 = 0x9E3779B185EBCA87 * __ROR8__(v125 - 0x3D4D51C2D82B14B1 * v128, 33);
        v126 = 0x9E3779B185EBCA87 * __ROR8__(v126 - 0x3D4D51C2D82B14B1 * *((_QWORD *)&v128 + 1), 33);
        v13 += (32 - v129);
        LODWORD(v129) = 0;
      }
      if ((unint64_t)(v13 + 32) <= v25)
      {
        v27 = v124.u64[1];
        v26 = v124.i64[0];
        v29 = v125;
        v28 = v126;
        do
        {
          v26 = 0x9E3779B185EBCA87 * __ROR8__(v26 - 0x3D4D51C2D82B14B1 * *(_QWORD *)v13, 33);
          v27 = 0x9E3779B185EBCA87 * __ROR8__(v27 - 0x3D4D51C2D82B14B1 * *((_QWORD *)v13 + 1), 33);
          v29 = 0x9E3779B185EBCA87 * __ROR8__(v29 - 0x3D4D51C2D82B14B1 * *((_QWORD *)v13 + 2), 33);
          v28 = 0x9E3779B185EBCA87 * __ROR8__(v28 - 0x3D4D51C2D82B14B1 * *((_QWORD *)v13 + 3), 33);
          v13 += 32;
        }
        while ((unint64_t)v13 <= v25 - 32);
        v124.i64[0] = v26;
        v124.i64[1] = v27;
        v125 = v29;
        v126 = v28;
      }
      if ((unint64_t)v13 < v25)
      {
        v19 = v25 - (_DWORD)v13;
        __memcpy_chk();
        goto LABEL_41;
      }
    }
LABEL_56:

    memset(&v138[8], 0, 64);
    *(_QWORD *)v138 = v123;
    if ((uint64_t)v123 > 3000)
    {
      if ((uint64_t)v123 > 4000)
      {
        switch((_QWORD)v123)
        {
          case 0xFA1:
            CC_SHA1_Final(&v138[8], (CC_SHA1_CTX *)((char *)&v123 + 8));
            break;
          case 0x10A0:
            CC_SHA256_Final(&v138[8], (CC_SHA256_CTX *)((char *)&v123 + 8));
            break;
          case 0x11A0:
            CC_SHA512_Final(&v138[8], (CC_SHA512_CTX *)((char *)&v123 + 8));
            break;
        }
        goto LABEL_103;
      }
      if ((_QWORD)v123 != 3001)
      {
        if ((_QWORD)v123 == 4000)
          CC_MD5_Final(&v138[8], (CC_MD5_CTX *)((char *)&v123 + 8));
LABEL_103:
        v139[0] = *(_OWORD *)v138;
        v139[1] = *(_OWORD *)&v138[16];
        v139[2] = *(_OWORD *)&v138[32];
        v139[3] = *(_OWORD *)&v138[48];
        v140 = *(_QWORD *)&v138[64];
        if (*(uint64_t *)v138 <= 3999)
        {
          if (*(uint64_t *)v138 <= 2999)
          {
            if (*(_QWORD *)v138 != 1000)
            {
              if (*(_QWORD *)v138 != 2000)
                goto LABEL_132;
              goto LABEL_122;
            }
            goto LABEL_116;
          }
          if (*(_QWORD *)v138 == 3000)
          {
LABEL_122:
            v100 = DWORD2(v139[0]);
            goto LABEL_130;
          }
          if (*(_QWORD *)v138 == 3001)
          {
LABEL_116:
            v100 = *((_QWORD *)&v139[0] + 1);
LABEL_130:
            v18 = LOBYTE(self->_repeatIteration) | v100 & 0xFFFFFFFFFFFFFF00;

            return v18;
          }
LABEL_132:
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "uint64_t _MSVHashGetUInt64Hash(MSVHash)");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "handleFailureInFunction:file:lineNumber:description:", v122, CFSTR("MSVHasher+Algorithms.h"), 327, CFSTR("Cannot obtain hash from unknown hasher algorithm"));

          v100 = 0;
          goto LABEL_130;
        }
        if (*(uint64_t *)v138 > 4255)
        {
          if (*(_QWORD *)v138 == 4256)
          {
            v113 = (unsigned __int8 *)v139 + 8;
            v114 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
            v115 = v114;
            for (i = 0; i != 64; i += 2)
            {
              v117 = *v113++;
              v118 = &v114[i];
              *v118 = MSVFastHexStringFromBytes_hexCharacters_25458[(unint64_t)v117 >> 4];
              v118[1] = MSVFastHexStringFromBytes_hexCharacters_25458[v117 & 0xF];
            }
            v97 = objc_alloc(MEMORY[0x24BDD17C8]);
            v98 = v115;
            v99 = 64;
          }
          else
          {
            if (*(_QWORD *)v138 != 4512)
              goto LABEL_132;
            v101 = (unsigned __int8 *)v139 + 8;
            v102 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
            v103 = v102;
            for (j = 0; j != 128; j += 2)
            {
              v105 = *v101++;
              v106 = &v102[j];
              *v106 = MSVFastHexStringFromBytes_hexCharacters_25458[(unint64_t)v105 >> 4];
              v106[1] = MSVFastHexStringFromBytes_hexCharacters_25458[v105 & 0xF];
            }
            v97 = objc_alloc(MEMORY[0x24BDD17C8]);
            v98 = v103;
            v99 = 128;
          }
        }
        else if (*(_QWORD *)v138 == 4000)
        {
          v107 = (unsigned __int8 *)v139 + 8;
          v108 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
          v109 = v108;
          for (k = 0; k != 32; k += 2)
          {
            v111 = *v107++;
            v112 = &v108[k];
            *v112 = MSVFastHexStringFromBytes_hexCharacters_25458[(unint64_t)v111 >> 4];
            v112[1] = MSVFastHexStringFromBytes_hexCharacters_25458[v111 & 0xF];
          }
          v97 = objc_alloc(MEMORY[0x24BDD17C8]);
          v98 = v109;
          v99 = 32;
        }
        else
        {
          if (*(_QWORD *)v138 != 4001)
            goto LABEL_132;
          v91 = (unsigned __int8 *)v139 + 8;
          v92 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
          v93 = v92;
          for (m = 0; m != 40; m += 2)
          {
            v95 = *v91++;
            v96 = &v92[m];
            *v96 = MSVFastHexStringFromBytes_hexCharacters_25458[(unint64_t)v95 >> 4];
            v96[1] = MSVFastHexStringFromBytes_hexCharacters_25458[v95 & 0xF];
          }
          v97 = objc_alloc(MEMORY[0x24BDD17C8]);
          v98 = v93;
          v99 = 40;
        }
        v119 = (void *)objc_msgSend(v97, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v98, v99, 4, 1);
        v100 = objc_msgSend(v119, "hash");

        goto LABEL_130;
      }
      if (*((_QWORD *)&v123 + 1) < 0x20uLL)
        v73 = v125 + 0x27D4EB2F165667C5;
      else
        v73 = 0x9E3779B185EBCA87
            * ((0x9E3779B185EBCA87
              * ((0x9E3779B185EBCA87
                * ((0x9E3779B185EBCA87
                  * ((__ROR8__(v124.i64[1], 57) + __ROR8__(v124.i64[0], 63) + __ROR8__(v125, 52) + __ROR8__(v126, 46)) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v124.i64[0], 33)))
                  - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v124.i64[1], 33)))
                - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v125, 33)))
              - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v126, 33)))
            - 0x7A1435883D4D519DLL;
      v75 = v73 + *((_QWORD *)&v123 + 1);
      v76 = BYTE8(v123) & 0x1F;
      if (v76 >= 8)
      {
        do
        {
          v77 = *v11++;
          v75 = 0x85EBCA77C2B2AE63
              - 0x61C8864E7A143579
              * __ROR8__((0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v77, 33)) ^ v75, 37);
          v76 -= 8;
        }
        while (v76 > 7);
      }
      if (v76 >= 4)
      {
        v78 = *(_DWORD *)v11;
        v11 = (uint64_t *)((char *)v11 + 4);
        v75 = 0x165667B19E3779F9 - 0x3D4D51C2D82B14B1 * __ROR8__((0x9E3779B185EBCA87 * v78) ^ v75, 41);
        v76 -= 4;
      }
      for (; v76; --v76)
      {
        v79 = *(unsigned __int8 *)v11;
        v11 = (uint64_t *)((char *)v11 + 1);
        v75 = 0x9E3779B185EBCA87 * __ROR8__((0x27D4EB2F165667C5 * v79) ^ v75, 53);
      }
      v80 = 0x165667B19E3779F9
          * ((0xC2B2AE3D27D4EB4FLL * (v75 ^ (v75 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v75 ^ (v75 >> 33))) >> 29));
      v69 = v80 ^ HIDWORD(v80);
LABEL_90:
      *(_QWORD *)&v138[8] = v69;
      goto LABEL_103;
    }
    if ((uint64_t)v123 <= 1999)
    {
      if (!(_QWORD)v123)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "handleFailureInFunction:file:lineNumber:description:", v72, CFSTR("MSVHasher+Algorithms.h"), 156, CFSTR("Cannot finalize unknown hasher algorithm"));

        goto LABEL_103;
      }
      if ((_QWORD)v123 != 1000)
        goto LABEL_103;
      v39 = (*((_QWORD *)&v123 + 1) + v124.i64[0]) ^ __ROR8__(v124.i64[0], 51);
      v40 = v124.i64[1] + (v125 ^ v126);
      v41 = __ROR8__(v125 ^ v126, 48);
      v42 = (v40 ^ v41) + __ROR8__(*((_QWORD *)&v123 + 1) + v124.i64[0], 32);
      v43 = v42 ^ __ROR8__(v40 ^ v41, 43);
      v44 = v40 + v39;
      v45 = v44 ^ __ROR8__(v39, 47);
      v46 = (v42 ^ v126) + v45;
      v47 = v46 ^ __ROR8__(v45, 51);
      v48 = (__ROR8__(v44, 32) ^ 0xFFLL) + v43;
      v49 = __ROR8__(v43, 48);
      v50 = __ROR8__(v46, 32) + (v48 ^ v49);
      v51 = v50 ^ __ROR8__(v48 ^ v49, 43);
      v52 = v47 + v48;
      v53 = v52 ^ __ROR8__(v47, 47);
      v54 = v53 + v50;
      v55 = v54 ^ __ROR8__(v53, 51);
      v56 = __ROR8__(v52, 32) + v51;
      v57 = __ROR8__(v51, 48);
      v58 = __ROR8__(v54, 32) + (v56 ^ v57);
      v59 = v58 ^ __ROR8__(v56 ^ v57, 43);
      v60 = v55 + v56;
      v61 = v60 ^ __ROR8__(v55, 47);
      v62 = v61 + v58;
      v63 = v62 ^ __ROR8__(v61, 51);
      v64 = __ROR8__(v60, 32) + v59;
      v65 = __ROR8__(v59, 48);
      v66 = __ROR8__(v62, 32) + (v64 ^ v65);
      v67 = v66 ^ __ROR8__(v64 ^ v65, 43);
      v68 = v63 + v64;
      *((_QWORD *)&v123 + 1) = v66;
      v124.i64[0] = v68 ^ __ROR8__(v63, 47);
      v124.i64[1] = __ROR8__(v68, 32);
      v125 = v67;
      v69 = v124.i64[0] ^ v66 ^ v124.i64[1] ^ v67;
      goto LABEL_90;
    }
    if ((_QWORD)v123 != 2000)
    {
      if ((_QWORD)v123 != 3000)
        goto LABEL_103;
      if (HIDWORD(v123))
        v70 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(v124, (uint32x4_t)xmmword_210ED9470), (int8x16_t)vshlq_u32(v124, (uint32x4_t)xmmword_210ED9460)));
      else
        v70 = v124.i32[2] + 374761393;
      v81 = DWORD2(v123) + v70;
      v82 = v127 & 0xF;
      if (v82 >= 4)
      {
        do
        {
          v83 = *(_DWORD *)v10;
          v10 = (unint64_t *)((char *)v10 + 4);
          HIDWORD(v84) = v81 - 1028477379 * v83;
          LODWORD(v84) = HIDWORD(v84);
          v81 = 668265263 * (v84 >> 15);
          v82 -= 4;
        }
        while (v82 > 3);
      }
      for (; v82; --v82)
      {
        v85 = *(unsigned __int8 *)v10;
        v10 = (unint64_t *)((char *)v10 + 1);
        HIDWORD(v86) = v81 + 374761393 * v85;
        LODWORD(v86) = HIDWORD(v86);
        v81 = -1640531535 * (v86 >> 21);
      }
      v87 = (-2048144777 * (v81 ^ (v81 >> 15))) ^ ((-2048144777 * (v81 ^ (v81 >> 15))) >> 13);
      v88 = (-1028477379 * v87) ^ ((-1028477379 * v87) >> 16);
      goto LABEL_102;
    }
    switch(v124.u8[3])
    {
      case 1u:
        v74 = v124.u8[0];
        break;
      case 2u:
        v74 = v124.u16[0];
        break;
      case 3u:
        v74 = v124.u16[0] | (v124.u8[2] << 16);
        break;
      default:
        v89 = DWORD2(v123);
        goto LABEL_101;
    }
    v89 = (461845907 * ((380141568 * v74) | ((-862048943 * v74) >> 17))) ^ DWORD2(v123);
LABEL_101:
    v90 = -2048144789 * (v89 ^ HIDWORD(v123) ^ ((v89 ^ HIDWORD(v123)) >> 16));
    v88 = (-1028477387 * (v90 ^ (v90 >> 13))) ^ ((-1028477387 * (v90 ^ (v90 >> 13))) >> 16);
    DWORD2(v123) = v88;
LABEL_102:
    *(_DWORD *)&v138[8] = v88;
    goto LABEL_103;
  }
  return 0;
}

+ (id)placeholderComponentsWithLoadingSectionID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("PLACEHOLDER"), v3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[MPCQueueControllerBehaviorMusicIdentifierComponents _initWithContentItemID:sectionID:itemID:repeatIteration:type:loadingSectionID:itemSpecificContentItemID:deferredNextContentItemID:]([MPCQueueControllerBehaviorMusicIdentifierComponents alloc], "_initWithContentItemID:sectionID:itemID:repeatIteration:type:loadingSectionID:itemSpecificContentItemID:deferredNextContentItemID:", v5, v3, CFSTR("PLACEHOLDER_HEAD"), 0, 2, v3, 0, 0);
  return v6;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t type;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("section=%@"), self->_sectionID);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("item=%@"), self->_itemID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  if (self->_repeatIteration >= 1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("repeatIteration=%ld"), self->_repeatIteration);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  if (-[NSString length](self->_loadingSectionID, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("loadingSection=%@"), self->_loadingSectionID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  if (-[NSString length](self->_itemSpecificContentItemID, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("itemSpecificContentItemID=%@"), self->_itemSpecificContentItemID);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

  }
  if (-[NSString length](self->_deferredNextContentItemID, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("deferredNextContentItemID=%@"), self->_deferredNextContentItemID);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  type = self->_type;
  if (type <= 3)
    objc_msgSend(v3, "addObject:", off_24CAB83B0[type]);
  v11 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("<MPCQueueControllerBehaviorMusicIdentifierComponents: %p %@>"), self, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (id)copyAsPlaceholder
{
  _QWORD *v2;
  int64_t type;
  NSString *itemID;
  int64_t repeatIteration;
  NSString *v7;
  NSString *v8;
  char *v9;
  uint64_t quot;
  ldiv_t v11;
  uint64_t v12;
  const UInt8 *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v25;
  _QWORD v26[3];
  _QWORD v27[3];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  type = self->_type;
  if ((unint64_t)(type - 1) < 3)
    return self;
  if (!type)
  {
    itemID = self->_itemID;
    repeatIteration = self->_repeatIteration;
    v7 = self->_sectionID;
    v8 = itemID;
    v26[0] = v7;
    if (repeatIteration)
    {
      v9 = (char *)&v28 + 1;
      quot = repeatIteration;
      do
      {
        v11 = ldiv(quot, 10);
        quot = v11.quot;
        if (v11.rem >= 0)
          LOBYTE(v12) = v11.rem;
        else
          v12 = -v11.rem;
        *(v9 - 2) = v12 + 48;
        v13 = (const UInt8 *)(v9 - 2);
        --v9;
      }
      while (v11.quot);
      if (repeatIteration < 0)
      {
        *(v9 - 2) = 45;
        v13 = (const UInt8 *)(v9 - 2);
      }
      v14 = (__CFString *)CFStringCreateWithBytes(0, v13, (char *)&v28 - (char *)v13, 0x8000100u, 0);
    }
    else
    {
      v14 = &stru_24CABB5D0;
    }
    v26[1] = v14;
    v26[2] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 3, self);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "componentsJoinedByString:", CFSTR(":"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (repeatIteration)
    v27[0] = CFSTR("PLACEHOLDER");
    v27[1] = v16;
    v17 = (void *)MEMORY[0x24BDBCE30];
    v18 = v16;
    objc_msgSend(v17, "arrayWithObjects:count:", v27, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "componentsJoinedByString:", CFSTR("="));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = (_QWORD *)objc_msgSend(v25, "_copy");
    v21 = (void *)v2[2];
    v2[2] = v20;
    v22 = v20;

    v2[5] = 1;
    v23 = (void *)v2[7];
    v2[7] = v18;

  }
  return v2;
}

- (id)copyAsDeferredWithLoadingSectionID:(id)a3
{
  id v6;
  int64_t type;
  void *v8;
  NSString *itemID;
  int64_t repeatIteration;
  NSString *v11;
  NSString *v12;
  char *v13;
  uint64_t quot;
  ldiv_t v15;
  uint64_t v16;
  const UInt8 *v17;
  __CFString *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD v28[3];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  type = self->_type;
  if ((unint64_t)(type - 1) >= 3)
  {
    if (!type)
    {
      itemID = self->_itemID;
      repeatIteration = self->_repeatIteration;
      v11 = self->_sectionID;
      v12 = itemID;
      v28[0] = v11;
      if (repeatIteration)
      {
        v13 = (char *)&v29 + 1;
        quot = repeatIteration;
        do
        {
          v15 = ldiv(quot, 10);
          quot = v15.quot;
          if (v15.rem >= 0)
            LOBYTE(v16) = v15.rem;
          else
            v16 = -v15.rem;
          *(v13 - 2) = v16 + 48;
          v17 = (const UInt8 *)(v13 - 2);
          --v13;
        }
        while (v15.quot);
        if (repeatIteration < 0)
        {
          *(v13 - 2) = 45;
          v17 = (const UInt8 *)(v13 - 2);
        }
        v18 = (__CFString *)CFStringCreateWithBytes(0, v17, (char *)&v29 - (char *)v17, 0x8000100u, 0);
      }
      else
      {
        v18 = &stru_24CABB5D0;
      }
      v28[1] = v18;
      v28[2] = v12;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "componentsJoinedByString:", CFSTR(":"));
      v20 = objc_claimAutoreleasedReturnValue();

      if (repeatIteration)
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("PLACEHOLDER"), v6, v20, 0, v28[0]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR("@"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      a2 = -[MPCQueueControllerBehaviorMusicIdentifierComponents _copy](self, "_copy");
      v23 = (void *)*((_QWORD *)a2 + 2);
      *((_QWORD *)a2 + 2) = v22;
      v24 = v22;

      objc_storeStrong((id *)a2 + 3, a3);
      v25 = (void *)*((_QWORD *)a2 + 4);
      *((_QWORD *)a2 + 4) = CFSTR("PLACEHOLDER_DEFERRED_NEXT_ITEM");

      *((_QWORD *)a2 + 5) = 3;
      objc_storeStrong((id *)a2 + 6, a3);
      v26 = (void *)*((_QWORD *)a2 + 8);
      *((_QWORD *)a2 + 8) = v20;

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCQueueControllerBehaviorMusicIdentifierComponents.m"), 174, CFSTR("Cannot copy a placeholder as deferred"));

    a2 = 0;
  }

  return (id)a2;
}

- (BOOL)isPlaceholder
{
  return (self->_type < 4uLL) & (0xEu >> (self->_type & 0xF));
}

- (NSString)loadingSectionID
{
  return self->_loadingSectionID;
}

- (NSString)itemSpecificContentItemID
{
  return self->_itemSpecificContentItemID;
}

- (NSString)deferredNextContentItemID
{
  return self->_deferredNextContentItemID;
}

@end
