@implementation _MPCPlaybackSessionArchive

+ (id)packageTypeIdentifier
{
  return CFSTR("com.apple.mediaplaybackcore.sessionArchive");
}

- (NSString)identifier
{
  return self->_identifier;
}

- (_MPCPlaybackSessionArchive)initWithURL:(id)a3
{
  _MPCPlaybackSessionArchive *v3;
  _MPCPlaybackSessionArchive *v4;
  void *v5;
  uint64_t v6;
  NSString *identifier;
  _MPCPlaybackSessionArchive *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_MPCPlaybackSessionArchive;
  v3 = -[MSVSegmentedCodingPackage initWithURL:](&v10, sel_initWithURL_, a3);
  v4 = v3;
  if (!v3)
    goto LABEL_3;
  -[MSVSegmentedCodingPackage infoDictionary](v3, "infoDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v6 = objc_claimAutoreleasedReturnValue();
  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v6;

  if (!v4->_identifier)
    v8 = 0;
  else
LABEL_3:
    v8 = v4;

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_artworkImage, 0);
  objc_storeStrong((id *)&self->_contentItem, 0);
}

- (_MPCPlaybackSessionArchive)initWithURL:(id)a3 identifier:(id)a4
{
  id v6;
  _MPCPlaybackSessionArchive *v7;
  uint64_t v8;
  NSString *identifier;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  objc_super v15;

  v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_MPCPlaybackSessionArchive;
  v7 = -[MSVSegmentedCodingPackage initWithURL:](&v15, sel_initWithURL_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v8;

    -[MSVSegmentedCodingPackage infoDictionary](v7, "infoDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("identifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v11, "isEqualToString:", v6) & 1) == 0)
    {
      -[MSVSegmentedCodingPackage reset](v7, "reset");
      v12 = v7->_identifier;
      -[MSVSegmentedCodingPackage infoDictionary](v7, "infoDictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("identifier"));

      -[MSVSegmentedCodingPackage setNeedsInfoDictionaryUpdate](v7, "setNeedsInfoDictionaryUpdate");
    }

  }
  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p %@>"), objc_opt_class(), self, self->_identifier);
}

- (BOOL)saveWithError:(id *)a3
{
  _MPCPlaybackSessionArchive *v5;
  void *v6;
  _MPCPlaybackSessionArchive *v7;
  void *v8;
  void *v9;
  char v10;
  NSDate *v11;
  NSDate *lastModifiedDate;
  BOOL v13;
  objc_super v15;

  v5 = [_MPCPlaybackSessionArchive alloc];
  -[MSVSegmentedCodingPackage packageURL](self, "packageURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_MPCPlaybackSessionArchive initWithURL:](v5, "initWithURL:", v6);

  if (!v7
    || (-[_MPCPlaybackSessionArchive identifier](v7, "identifier"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        -[_MPCPlaybackSessionArchive identifier](self, "identifier"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v8, "isEqualToString:", v9),
        v9,
        v8,
        (v10 & 1) != 0)
    || -[MSVSegmentedCodingPackage deleteWithError:](v7, "deleteWithError:", a3))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastModifiedDate = self->_lastModifiedDate;
    self->_lastModifiedDate = v11;

    v15.receiver = self;
    v15.super_class = (Class)_MPCPlaybackSessionArchive;
    v13 = -[MSVSegmentedCodingPackage saveWithError:](&v15, sel_saveWithError_, a3);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)writeWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  id v25;
  unint64_t *v26;
  uint64_t *v27;
  id v28;
  _BYTE *v29;
  unint64_t v30;
  int v31;
  int v32;
  __int8 *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  _BOOL4 v42;
  int v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  _BYTE *v49;
  unint64_t v50;
  __int32 v51;
  __int32 v52;
  __int32 v53;
  __int32 v54;
  __int32 v55;
  unint64_t v56;
  __int16 v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
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
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  __int32 v89;
  void *v90;
  void *v91;
  int v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  uint64_t v96;
  unsigned int v97;
  unsigned int v98;
  unint64_t v99;
  unsigned __int32 v100;
  unint64_t v101;
  int v102;
  unint64_t v103;
  int v104;
  unint64_t v105;
  unsigned int v106;
  unsigned int v107;
  unsigned int v108;
  unsigned int v109;
  uint64_t v110;
  _QWORD *v111;
  ldiv_t v112;
  uint64_t v113;
  char *v114;
  const UInt8 *v115;
  unsigned __int8 *v116;
  char *v117;
  char *v118;
  uint64_t m;
  unsigned int v120;
  char *v121;
  id v122;
  char *v123;
  uint64_t v124;
  char *v125;
  uint64_t v126;
  _BYTE *v127;
  unint64_t v128;
  unsigned __int8 *v129;
  char *v130;
  char *v131;
  uint64_t j;
  unsigned int v133;
  char *v134;
  uint64_t v135;
  char *v136;
  uint64_t quot;
  lldiv_t v138;
  uint64_t v139;
  CFStringRef v140;
  unsigned __int8 *v141;
  char *v142;
  char *v143;
  uint64_t k;
  unsigned int v145;
  char *v146;
  char *v147;
  uint64_t v148;
  _BYTE *v149;
  unint64_t v150;
  unsigned __int8 *v151;
  char *v152;
  char *v153;
  uint64_t i;
  unsigned int v155;
  char *v156;
  __CFString *v157;
  void *v158;
  void *v160;
  void *v161;
  _BYTE *v162;
  void *v163;
  void *v164;
  objc_super v165;
  __int128 v166;
  uint32x4_t v167;
  unint64_t v168;
  unint64_t v169;
  __int128 v170;
  __int128 v171;
  uint64_t v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  _BYTE v181[72];
  _OWORD v182[4];
  uint64_t v183;
  _QWORD v184[3];
  _QWORD v185[3];

  v185[0] = *MEMORY[0x24BDAC8D0];
  v165.receiver = self;
  v165.super_class = (Class)_MPCPlaybackSessionArchive;
  if (-[MSVSegmentedCodingPackage writeWithError:](&v165, sel_writeWithError_))
  {
    -[MSVSegmentedCodingPackage packageURL](self, "packageURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("contentItem.protobuf.gz"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_contentItem)
    {
      -[MSVSegmentedCodingPackage infoDictionary](self, "infoDictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("contentItem"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[MPNowPlayingContentItem identifier](self->_contentItem, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

      if ((v11 & 1) == 0)
      {
        if (!v8)
        {
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[MPNowPlayingContentItem createExternalRepresentation](self->_contentItem, "createExternalRepresentation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        MSVGzipCompressData();
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          v13 = 0;
          if (a3)
          {
            v16 = 0;
            *a3 = 0;
LABEL_171:

            return v16;
          }
          goto LABEL_170;
        }
        if (!objc_msgSend(v13, "writeToURL:options:error:", v6, 0, a3))
          goto LABEL_170;
        -[MPNowPlayingContentItem identifier](self->_contentItem, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("identifier"));

        objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_24CB16F20, CFSTR("compressionAlgorithm"));
        -[MSVSegmentedCodingPackage infoDictionary](self, "infoDictionary");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v8, CFSTR("contentItem"));

        -[MSVSegmentedCodingPackage setNeedsInfoDictionaryUpdate](self, "setNeedsInfoDictionaryUpdate");
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeItemAtURL:error:", v6, 0);

      -[MSVSegmentedCodingPackage infoDictionary](self, "infoDictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("contentItem"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        -[MSVSegmentedCodingPackage infoDictionary](self, "infoDictionary");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", 0, CFSTR("contentItem"));

        -[MSVSegmentedCodingPackage setNeedsInfoDictionaryUpdate](self, "setNeedsInfoDictionaryUpdate");
      }
    }
    -[MSVSegmentedCodingPackage packageURL](self, "packageURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "URLByAppendingPathComponent:isDirectory:", CFSTR("artwork"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[MSVSegmentedCodingPackage infoDictionary](self, "infoDictionary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("artworkHash"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!self->_artworkImage)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "removeItemAtURL:error:", v8, 0);

      -[MSVSegmentedCodingPackage infoDictionary](self, "infoDictionary");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("artworkHash"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        -[MSVSegmentedCodingPackage infoDictionary](self, "infoDictionary");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setObject:forKeyedSubscript:", 0, CFSTR("artworkHash"));

        -[MSVSegmentedCodingPackage setNeedsInfoDictionaryUpdate](self, "setNeedsInfoDictionaryUpdate");
      }
      goto LABEL_168;
    }
    v163 = v6;
    v164 = v13;
    MEMORY[0x212BD17C4](*MEMORY[0x24BE65B90]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *MEMORY[0x24BE65B78];
    v25 = v23;
    v180 = 0u;
    v179 = 0u;
    v178 = 0u;
    v177 = 0u;
    v176 = 0u;
    v175 = 0u;
    v174 = 0u;
    v173 = 0u;
    v166 = xmmword_210ED9450;
    v167 = (uint32x4_t)vaddq_s64(vdupq_n_s64(v24), (int64x2_t)xmmword_210ED94C0);
    v26 = &v168;
    v168 = v24;
    v169 = v24 + 0x61C8864E7A143579;
    v27 = (uint64_t *)&v170;
    v170 = 0u;
    v171 = 0u;
    v172 = 0;
    v28 = objc_retainAutorelease(v25);
    v29 = (_BYTE *)objc_msgSend(v28, "bytes");
    v30 = objc_msgSend(v28, "length");
    v31 = v30;
    if ((uint64_t)v166 > 3999)
    {
      if ((uint64_t)v166 > 4255)
      {
        if ((_QWORD)v166 == 4256)
        {
          CC_SHA256_Update((CC_SHA256_CTX *)((char *)&v166 + 8), v29, v30);
        }
        else if ((_QWORD)v166 == 4512)
        {
          CC_SHA512_Update((CC_SHA512_CTX *)((char *)&v166 + 8), v29, v30);
        }
      }
      else if ((_QWORD)v166 == 4000)
      {
        CC_MD5_Update((CC_MD5_CTX *)((char *)&v166 + 8), v29, v30);
      }
      else if ((_QWORD)v166 == 4001)
      {
        CC_SHA1_Update((CC_SHA1_CTX *)((char *)&v166 + 8), v29, v30);
      }
    }
    else
    {
      if ((uint64_t)v166 <= 2999)
      {
        if ((_QWORD)v166)
        {
          if ((_QWORD)v166 == 2000)
          {
            v32 = (((v30 + v167.i8[3]) & 3) - v167.i8[3]);
            v33 = &v167.i8[v167.u8[3]];
            switch(v32)
            {
              case 0:
                break;
              case 1:
                *v33 = *v29;
                break;
              case 2:
                v57 = *(_WORD *)v29;
                goto LABEL_69;
              case 3:
                v57 = *(_WORD *)v29;
                v33[2] = v29[2];
LABEL_69:
                *(_WORD *)v33 = v57;
                break;
              default:
                memcpy(v33, v29, (((v31 + v167.i8[3]) & 3) - v167.i8[3]));
                break;
            }
            HIDWORD(v166) += v31;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _MSVHasherAppendBytes(MSVHasher * _Nonnull, const void * _Nonnull, size_t)");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, CFSTR("MSVHasher+Algorithms.h"), 262, CFSTR("Cannot append to unknown hasher algorithm"));

        }
        goto LABEL_71;
      }
      if ((_QWORD)v166 == 3000)
      {
        if (!v29)
          goto LABEL_71;
        v42 = v30 > 0xF || (DWORD2(v166) + v30) > 0xF;
        DWORD2(v166) += v30;
        HIDWORD(v166) |= v42;
        if (v30 + v170 > 0xF)
        {
          v49 = &v29[v30];
          if ((_DWORD)v170)
          {
            v162 = &v29[v30];
            memcpy((char *)&v168 + v170, v29, (16 - v170));
            v49 = v162;
            HIDWORD(v50) = v167.i32[0] - 2048144777 * v168;
            LODWORD(v50) = HIDWORD(v50);
            v51 = -1640531535 * (v50 >> 19);
            HIDWORD(v50) = v167.i32[1] - 2048144777 * HIDWORD(v168);
            LODWORD(v50) = HIDWORD(v50);
            v167.i32[0] = v51;
            v167.i32[1] = -1640531535 * (v50 >> 19);
            HIDWORD(v50) = v167.i32[2] - 2048144777 * v169;
            LODWORD(v50) = HIDWORD(v50);
            v167.i32[2] = -1640531535 * (v50 >> 19);
            HIDWORD(v50) = v167.i32[3] - 2048144777 * HIDWORD(v169);
            LODWORD(v50) = HIDWORD(v50);
            v29 += (16 - v170);
            v167.i32[3] = -1640531535 * (v50 >> 19);
            LODWORD(v170) = 0;
          }
          if (v29 <= v49 - 16)
          {
            v52 = v167.i32[0];
            v53 = v167.i32[1];
            v54 = v167.i32[2];
            v55 = v167.i32[3];
            do
            {
              HIDWORD(v56) = v52 - 2048144777 * *(_DWORD *)v29;
              LODWORD(v56) = HIDWORD(v56);
              v52 = -1640531535 * (v56 >> 19);
              HIDWORD(v56) = v53 - 2048144777 * *((_DWORD *)v29 + 1);
              LODWORD(v56) = HIDWORD(v56);
              v53 = -1640531535 * (v56 >> 19);
              HIDWORD(v56) = v54 - 2048144777 * *((_DWORD *)v29 + 2);
              LODWORD(v56) = HIDWORD(v56);
              v54 = -1640531535 * (v56 >> 19);
              HIDWORD(v56) = v55 - 2048144777 * *((_DWORD *)v29 + 3);
              LODWORD(v56) = HIDWORD(v56);
              v55 = -1640531535 * (v56 >> 19);
              v29 += 16;
            }
            while (v29 <= v49 - 16);
            v167.i64[0] = __PAIR64__(v53, v52);
            v167.i64[1] = __PAIR64__(v55, v54);
          }
          if (v29 >= v49)
            goto LABEL_71;
          v43 = (_DWORD)v49 - (_DWORD)v29;
          __memcpy_chk();
        }
        else
        {
          memcpy((char *)&v168 + v170, v29, v30);
          v43 = v170 + v31;
        }
        LODWORD(v170) = v43;
        goto LABEL_71;
      }
      if ((_QWORD)v166 != 3001 || !v29)
        goto LABEL_71;
      *((_QWORD *)&v166 + 1) += v30;
      if (v30 + v172 <= 0x1F)
      {
        memcpy((char *)&v170 + v172, v29, v30);
        v38 = v172 + v31;
LABEL_56:
        LODWORD(v172) = v38;
        goto LABEL_71;
      }
      v44 = (unint64_t)&v29[v30];
      if ((_DWORD)v172)
      {
        v162 = &v29[v30];
        memcpy((char *)&v170 + v172, v29, (32 - v172));
        v44 = (unint64_t)v162;
        v167.i64[0] = 0x9E3779B185EBCA87 * __ROR8__(v167.i64[0] - 0x3D4D51C2D82B14B1 * v170, 33);
        v167.i64[1] = 0x9E3779B185EBCA87 * __ROR8__(v167.i64[1] - 0x3D4D51C2D82B14B1 * *((_QWORD *)&v170 + 1), 33);
        v168 = 0x9E3779B185EBCA87 * __ROR8__(v168 - 0x3D4D51C2D82B14B1 * v171, 33);
        v169 = 0x9E3779B185EBCA87 * __ROR8__(v169 - 0x3D4D51C2D82B14B1 * *((_QWORD *)&v171 + 1), 33);
        v29 += (32 - v172);
        LODWORD(v172) = 0;
      }
      if ((unint64_t)(v29 + 32) <= v44)
      {
        v46 = v167.u64[1];
        v45 = v167.i64[0];
        v48 = v168;
        v47 = v169;
        do
        {
          v45 = 0x9E3779B185EBCA87 * __ROR8__(v45 - 0x3D4D51C2D82B14B1 * *(_QWORD *)v29, 33);
          v46 = 0x9E3779B185EBCA87 * __ROR8__(v46 - 0x3D4D51C2D82B14B1 * *((_QWORD *)v29 + 1), 33);
          v48 = 0x9E3779B185EBCA87 * __ROR8__(v48 - 0x3D4D51C2D82B14B1 * *((_QWORD *)v29 + 2), 33);
          v47 = 0x9E3779B185EBCA87 * __ROR8__(v47 - 0x3D4D51C2D82B14B1 * *((_QWORD *)v29 + 3), 33);
          v29 += 32;
        }
        while ((unint64_t)v29 <= v44 - 32);
        v167.i64[0] = v45;
        v167.i64[1] = v46;
        v168 = v48;
        v169 = v47;
      }
      if ((unint64_t)v29 < v44)
      {
        v38 = v44 - (_DWORD)v29;
        __memcpy_chk();
        goto LABEL_56;
      }
    }
LABEL_71:

    memset(&v181[8], 0, 64);
    *(_QWORD *)v181 = v166;
    if ((uint64_t)v166 > 3000)
    {
      v6 = v163;
      if ((uint64_t)v166 > 4000)
      {
        switch((_QWORD)v166)
        {
          case 0xFA1:
            CC_SHA1_Final(&v181[8], (CC_SHA1_CTX *)((char *)&v166 + 8));
            break;
          case 0x10A0:
            CC_SHA256_Final(&v181[8], (CC_SHA256_CTX *)((char *)&v166 + 8));
            break;
          case 0x11A0:
            CC_SHA512_Final(&v181[8], (CC_SHA512_CTX *)((char *)&v166 + 8));
            break;
        }
        goto LABEL_118;
      }
      if ((_QWORD)v166 != 3001)
      {
        if ((_QWORD)v166 == 4000)
          CC_MD5_Final(&v181[8], (CC_MD5_CTX *)((char *)&v166 + 8));
LABEL_118:
        v182[0] = *(_OWORD *)v181;
        v182[1] = *(_OWORD *)&v181[16];
        v182[2] = *(_OWORD *)&v181[32];
        v182[3] = *(_OWORD *)&v181[48];
        v183 = *(_QWORD *)&v181[64];
        if (*(uint64_t *)v181 > 3999)
        {
          v13 = v164;
          if (*(uint64_t *)v181 > 4255)
          {
            if (*(_QWORD *)v181 == 4256)
            {
              v151 = (unsigned __int8 *)v182 + 8;
              v152 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
              v153 = v152;
              for (i = 0; i != 64; i += 2)
              {
                v155 = *v151++;
                v156 = &v152[i];
                *v156 = MSVFastHexStringFromBytes_hexCharacters_25458[(unint64_t)v155 >> 4];
                v156[1] = MSVFastHexStringFromBytes_hexCharacters_25458[v155 & 0xF];
              }
              v122 = objc_alloc(MEMORY[0x24BDD17C8]);
              v123 = v153;
              v124 = 64;
            }
            else
            {
              if (*(_QWORD *)v181 != 4512)
                goto LABEL_173;
              v129 = (unsigned __int8 *)v182 + 8;
              v130 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
              v131 = v130;
              for (j = 0; j != 128; j += 2)
              {
                v133 = *v129++;
                v134 = &v130[j];
                *v134 = MSVFastHexStringFromBytes_hexCharacters_25458[(unint64_t)v133 >> 4];
                v134[1] = MSVFastHexStringFromBytes_hexCharacters_25458[v133 & 0xF];
              }
              v122 = objc_alloc(MEMORY[0x24BDD17C8]);
              v123 = v131;
              v124 = 128;
            }
          }
          else if (*(_QWORD *)v181 == 4000)
          {
            v141 = (unsigned __int8 *)v182 + 8;
            v142 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
            v143 = v142;
            for (k = 0; k != 32; k += 2)
            {
              v145 = *v141++;
              v146 = &v142[k];
              *v146 = MSVFastHexStringFromBytes_hexCharacters_25458[(unint64_t)v145 >> 4];
              v146[1] = MSVFastHexStringFromBytes_hexCharacters_25458[v145 & 0xF];
            }
            v122 = objc_alloc(MEMORY[0x24BDD17C8]);
            v123 = v143;
            v124 = 32;
          }
          else
          {
            if (*(_QWORD *)v181 != 4001)
              goto LABEL_173;
            v116 = (unsigned __int8 *)v182 + 8;
            v117 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
            v118 = v117;
            for (m = 0; m != 40; m += 2)
            {
              v120 = *v116++;
              v121 = &v117[m];
              *v121 = MSVFastHexStringFromBytes_hexCharacters_25458[(unint64_t)v120 >> 4];
              v121[1] = MSVFastHexStringFromBytes_hexCharacters_25458[v120 & 0xF];
            }
            v122 = objc_alloc(MEMORY[0x24BDD17C8]);
            v123 = v118;
            v124 = 40;
          }
        }
        else
        {
          v13 = v164;
          if (*(uint64_t *)v181 <= 2999)
          {
            if (*(_QWORD *)v181 == 1000)
            {
              v135 = *((_QWORD *)&v182[0] + 1);
              v136 = (char *)v185 + 1;
              quot = *((_QWORD *)&v182[0] + 1);
              do
              {
                v138 = lldiv(quot, 10);
                quot = v138.quot;
                if (v138.rem >= 0)
                  LOBYTE(v139) = v138.rem;
                else
                  v139 = -v138.rem;
                *(v136 - 2) = v139 + 48;
                v115 = (const UInt8 *)(v136 - 2);
                --v136;
              }
              while (v138.quot);
              if (v135 < 0)
              {
                *(v136 - 2) = 45;
                v115 = (const UInt8 *)(v136 - 2);
              }
              v114 = (char *)((char *)v185 - (char *)v115);
              goto LABEL_152;
            }
            if (*(_QWORD *)v181 == 2000)
            {
              v110 = DWORD2(v182[0]);
              v111 = v185;
              do
              {
                v112 = ldiv(v110, 10);
                v110 = v112.quot;
                if (v112.rem >= 0)
                  LOBYTE(v113) = v112.rem;
                else
                  v113 = -v112.rem;
                *((_BYTE *)v111 - 1) = v113 + 48;
                v111 = (_QWORD *)((char *)v111 - 1);
              }
              while (v112.quot);
              v114 = (char *)((char *)v185 - (char *)v111);
              v115 = (const UInt8 *)v111;
LABEL_152:
              v140 = CFStringCreateWithBytes(0, v115, (CFIndex)v114, 0x8000100u, 0);
LABEL_163:
              v157 = (__CFString *)v140;
LABEL_164:

              if ((objc_msgSend(v13, "isEqualToString:", v157) & 1) != 0)
              {
LABEL_167:

LABEL_168:
                v16 = 1;
                goto LABEL_171;
              }
              if (objc_msgSend(v28, "writeToURL:options:error:", v8, 0, a3))
              {
                -[MSVSegmentedCodingPackage infoDictionary](self, "infoDictionary");
                v158 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v158, "setObject:forKeyedSubscript:", v157, CFSTR("artworkHash"));

                -[MSVSegmentedCodingPackage setNeedsInfoDictionaryUpdate](self, "setNeedsInfoDictionaryUpdate");
                goto LABEL_167;
              }

LABEL_170:
              v16 = 0;
              goto LABEL_171;
            }
LABEL_173:
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", v162);
            v160 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString * _Nonnull _MSVHashGetDigest(MSVHash)");
            v161 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v160, "handleFailureInFunction:file:lineNumber:description:", v161, CFSTR("MSVHasher+Algorithms.h"), 356, CFSTR("Cannot obtain digest from unknown hasher algorithm"));

            v157 = &stru_24CABB5D0;
            goto LABEL_164;
          }
          if (*(_QWORD *)v181 == 3000)
          {
            LODWORD(v184[0]) = bswap32(DWORD2(v182[0]));
            v147 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
            v148 = 0;
            v149 = v147 + 1;
            do
            {
              v150 = *((unsigned __int8 *)v184 + v148);
              *(v149 - 1) = MSVFastHexStringFromBytes_hexCharacters_25458[v150 >> 4];
              *v149 = MSVFastHexStringFromBytes_hexCharacters_25458[v150 & 0xF];
              v149 += 2;
              ++v148;
            }
            while (v148 != 4);
            v122 = objc_alloc(MEMORY[0x24BDD17C8]);
            v123 = v147;
            v124 = 8;
          }
          else
          {
            if (*(_QWORD *)v181 != 3001)
              goto LABEL_173;
            v184[0] = bswap64(*((unint64_t *)&v182[0] + 1));
            v125 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
            v126 = 0;
            v127 = v125 + 1;
            do
            {
              v128 = *((unsigned __int8 *)v184 + v126);
              *(v127 - 1) = MSVFastHexStringFromBytes_hexCharacters_25458[v128 >> 4];
              *v127 = MSVFastHexStringFromBytes_hexCharacters_25458[v128 & 0xF];
              v127 += 2;
              ++v126;
            }
            while (v126 != 8);
            v122 = objc_alloc(MEMORY[0x24BDD17C8]);
            v123 = v125;
            v124 = 16;
          }
        }
        v140 = (CFStringRef)objc_msgSend(v122, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v123, v124, 4, 1, v162);
        goto LABEL_163;
      }
      if (*((_QWORD *)&v166 + 1) < 0x20uLL)
        v93 = v168 + 0x27D4EB2F165667C5;
      else
        v93 = 0x85EBCA77C2B2AE63
            - 0x61C8864E7A143579
            * ((0x85EBCA77C2B2AE63
              - 0x61C8864E7A143579
              * ((0x85EBCA77C2B2AE63
                - 0x61C8864E7A143579
                * ((0x85EBCA77C2B2AE63
                  - 0x61C8864E7A143579
                  * ((__ROR8__(v167.i64[1], 57) + __ROR8__(v167.i64[0], 63) + __ROR8__(v168, 52) + __ROR8__(v169, 46)) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v167.i64[0], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v167.i64[1], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v168, 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v169, 33)));
      v94 = v93 + *((_QWORD *)&v166 + 1);
      v95 = BYTE8(v166) & 0x1F;
      if (v95 >= 8)
      {
        do
        {
          v96 = *v27++;
          v94 = 0x85EBCA77C2B2AE63
              - 0x61C8864E7A143579
              * __ROR8__((0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v96, 33)) ^ v94, 37);
          v95 -= 8;
        }
        while (v95 > 7);
      }
      if (v95 >= 4)
      {
        v97 = *(_DWORD *)v27;
        v27 = (uint64_t *)((char *)v27 + 4);
        v94 = 0x165667B19E3779F9 - 0x3D4D51C2D82B14B1 * __ROR8__((0x9E3779B185EBCA87 * v97) ^ v94, 41);
        v95 -= 4;
      }
      for (; v95; --v95)
      {
        v98 = *(unsigned __int8 *)v27;
        v27 = (uint64_t *)((char *)v27 + 1);
        v94 = 0x9E3779B185EBCA87 * __ROR8__((0x27D4EB2F165667C5 * v98) ^ v94, 53);
      }
      v99 = 0x165667B19E3779F9
          * ((0xC2B2AE3D27D4EB4FLL * (v94 ^ (v94 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v94 ^ (v94 >> 33))) >> 29));
      v88 = v99 ^ HIDWORD(v99);
LABEL_105:
      *(_QWORD *)&v181[8] = v88;
      goto LABEL_118;
    }
    v6 = v163;
    if ((uint64_t)v166 <= 1999)
    {
      if (!(_QWORD)v166)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "MSVHash _MSVHasherFinalize(MSVHasher * _Nonnull)");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "handleFailureInFunction:file:lineNumber:description:", v91, CFSTR("MSVHasher+Algorithms.h"), 156, CFSTR("Cannot finalize unknown hasher algorithm"));

        goto LABEL_118;
      }
      if ((_QWORD)v166 != 1000)
        goto LABEL_118;
      v58 = (*((_QWORD *)&v166 + 1) + v167.i64[0]) ^ __ROR8__(v167.i64[0], 51);
      v59 = v167.i64[1] + (v168 ^ v169);
      v60 = __ROR8__(v168 ^ v169, 48);
      v61 = (v59 ^ v60) + __ROR8__(*((_QWORD *)&v166 + 1) + v167.i64[0], 32);
      v62 = v61 ^ __ROR8__(v59 ^ v60, 43);
      v63 = v59 + v58;
      v64 = v63 ^ __ROR8__(v58, 47);
      v65 = (v61 ^ v169) + v64;
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
      *((_QWORD *)&v166 + 1) = v85;
      v167.i64[0] = v87 ^ __ROR8__(v82, 47);
      v167.i64[1] = __ROR8__(v87, 32);
      v168 = v86;
      v88 = v167.i64[0] ^ v85 ^ v167.i64[1] ^ v86;
      goto LABEL_105;
    }
    if ((_QWORD)v166 != 2000)
    {
      if ((_QWORD)v166 != 3000)
        goto LABEL_118;
      if (HIDWORD(v166))
        v89 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(v167, (uint32x4_t)xmmword_210ED9470), (int8x16_t)vshlq_u32(v167, (uint32x4_t)xmmword_210ED9460)));
      else
        v89 = v167.i32[2] + 374761393;
      v100 = DWORD2(v166) + v89;
      v101 = v170 & 0xF;
      if (v101 >= 4)
      {
        do
        {
          v102 = *(_DWORD *)v26;
          v26 = (unint64_t *)((char *)v26 + 4);
          HIDWORD(v103) = v100 - 1028477379 * v102;
          LODWORD(v103) = HIDWORD(v103);
          v100 = 668265263 * (v103 >> 15);
          v101 -= 4;
        }
        while (v101 > 3);
      }
      for (; v101; --v101)
      {
        v104 = *(unsigned __int8 *)v26;
        v26 = (unint64_t *)((char *)v26 + 1);
        HIDWORD(v105) = v100 + 374761393 * v104;
        LODWORD(v105) = HIDWORD(v105);
        v100 = -1640531535 * (v105 >> 21);
      }
      v106 = (-2048144777 * (v100 ^ (v100 >> 15))) ^ ((-2048144777 * (v100 ^ (v100 >> 15))) >> 13);
      v107 = (-1028477379 * v106) ^ ((-1028477379 * v106) >> 16);
      goto LABEL_117;
    }
    switch(v167.u8[3])
    {
      case 1u:
        v92 = v167.u8[0];
        break;
      case 2u:
        v92 = v167.u16[0];
        break;
      case 3u:
        v92 = v167.u16[0] | (v167.u8[2] << 16);
        break;
      default:
        v108 = DWORD2(v166);
        goto LABEL_116;
    }
    v108 = (461845907 * ((380141568 * v92) | ((-862048943 * v92) >> 17))) ^ DWORD2(v166);
LABEL_116:
    v109 = -2048144789 * (v108 ^ HIDWORD(v166) ^ ((v108 ^ HIDWORD(v166)) >> 16));
    v107 = (-1028477387 * (v109 ^ (v109 >> 13))) ^ ((-1028477387 * (v109 ^ (v109 >> 13))) >> 16);
    DWORD2(v166) = v107;
LABEL_117:
    *(_DWORD *)&v181[8] = v107;
    goto LABEL_118;
  }
  return 0;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[_MPCPlaybackSessionArchive identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _MPCPlaybackSessionArchive *v4;
  _MPCPlaybackSessionArchive *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (_MPCPlaybackSessionArchive *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[_MPCPlaybackSessionArchive identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MPCPlaybackSessionArchive identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqualToString:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (MPNowPlayingContentItem)contentItem
{
  MPNowPlayingContentItem *contentItem;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  MPNowPlayingContentItem *v8;
  MPNowPlayingContentItem *v9;

  contentItem = self->_contentItem;
  if (!contentItem)
  {
    -[MSVSegmentedCodingPackage packageURL](self, "packageURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("contentItem.protobuf.gz"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    MSVGzipDecompressData();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (MPNowPlayingContentItem *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCAA8]), "initWithExternalRepresentation:", v7);
    v9 = self->_contentItem;
    self->_contentItem = v8;

    contentItem = self->_contentItem;
  }
  return contentItem;
}

- (UIImage)artworkImage
{
  UIImage *artworkImage;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  UIImage *v8;
  UIImage *v9;

  artworkImage = self->_artworkImage;
  if (!artworkImage)
  {
    -[MSVSegmentedCodingPackage packageURL](self, "packageURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("artwork"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc(MEMORY[0x24BEBD640]);
    objc_msgSend(v5, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (UIImage *)objc_msgSend(v6, "initWithContentsOfFile:", v7);
    v9 = self->_artworkImage;
    self->_artworkImage = v8;

    artworkImage = self->_artworkImage;
  }
  return artworkImage;
}

- (void)setContentItem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setArtworkImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

@end
