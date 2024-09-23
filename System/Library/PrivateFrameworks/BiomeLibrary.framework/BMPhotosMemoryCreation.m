@implementation BMPhotosMemoryCreation

- (BMPhotosMemoryCreation)initWithIdentifier:(id)a3 queryContainsPersonEntity:(id)a4 queryContainsActivityEntity:(id)a5 queryContainsTimeEntity:(id)a6 queryContainsLocationEntity:(id)a7 queryContainsTripEntity:(id)a8 queryContainsMusicArtist:(id)a9 queryContainsMusicSong:(id)a10 queryContainsMusicGenre:(id)a11 queryContainsMusicMood:(id)a12 globalTraits:(id)a13 memoryGenerated:(id)a14 memoryAssetCount:(int)a15
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  BMPhotosMemoryCreation *v29;
  id v32;
  id v33;
  id v34;
  id v35;
  objc_super v36;

  v32 = a3;
  v21 = a4;
  v35 = a5;
  v34 = a6;
  v33 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v25 = a11;
  v26 = a12;
  v27 = a13;
  v28 = a14;
  v36.receiver = self;
  v36.super_class = (Class)BMPhotosMemoryCreation;
  v29 = -[BMEventBase init](&v36, sel_init);
  if (v29)
  {
    v29->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v29->_identifier, a3);
    if (v21)
    {
      v29->_hasQueryContainsPersonEntity = 1;
      v29->_queryContainsPersonEntity = objc_msgSend(v21, "BOOLValue");
    }
    else
    {
      v29->_hasQueryContainsPersonEntity = 0;
      v29->_queryContainsPersonEntity = 0;
    }
    if (v35)
    {
      v29->_hasQueryContainsActivityEntity = 1;
      v29->_queryContainsActivityEntity = objc_msgSend(v35, "BOOLValue");
    }
    else
    {
      v29->_hasQueryContainsActivityEntity = 0;
      v29->_queryContainsActivityEntity = 0;
    }
    if (v34)
    {
      v29->_hasQueryContainsTimeEntity = 1;
      v29->_queryContainsTimeEntity = objc_msgSend(v34, "BOOLValue");
    }
    else
    {
      v29->_hasQueryContainsTimeEntity = 0;
      v29->_queryContainsTimeEntity = 0;
    }
    if (v33)
    {
      v29->_hasQueryContainsLocationEntity = 1;
      v29->_queryContainsLocationEntity = objc_msgSend(v33, "BOOLValue");
    }
    else
    {
      v29->_hasQueryContainsLocationEntity = 0;
      v29->_queryContainsLocationEntity = 0;
    }
    if (v22)
    {
      v29->_hasQueryContainsTripEntity = 1;
      v29->_queryContainsTripEntity = objc_msgSend(v22, "BOOLValue");
    }
    else
    {
      v29->_hasQueryContainsTripEntity = 0;
      v29->_queryContainsTripEntity = 0;
    }
    if (v23)
    {
      v29->_hasQueryContainsMusicArtist = 1;
      v29->_queryContainsMusicArtist = objc_msgSend(v23, "BOOLValue");
    }
    else
    {
      v29->_hasQueryContainsMusicArtist = 0;
      v29->_queryContainsMusicArtist = 0;
    }
    if (v24)
    {
      v29->_hasQueryContainsMusicSong = 1;
      v29->_queryContainsMusicSong = objc_msgSend(v24, "BOOLValue");
    }
    else
    {
      v29->_hasQueryContainsMusicSong = 0;
      v29->_queryContainsMusicSong = 0;
    }
    if (v25)
    {
      v29->_hasQueryContainsMusicGenre = 1;
      v29->_queryContainsMusicGenre = objc_msgSend(v25, "BOOLValue");
    }
    else
    {
      v29->_hasQueryContainsMusicGenre = 0;
      v29->_queryContainsMusicGenre = 0;
    }
    if (v26)
    {
      v29->_hasQueryContainsMusicMood = 1;
      v29->_queryContainsMusicMood = objc_msgSend(v26, "BOOLValue");
    }
    else
    {
      v29->_hasQueryContainsMusicMood = 0;
      v29->_queryContainsMusicMood = 0;
    }
    objc_storeStrong((id *)&v29->_globalTraits, a13);
    if (v28)
    {
      v29->_hasMemoryGenerated = 1;
      v29->_memoryGenerated = objc_msgSend(v28, "BOOLValue");
    }
    else
    {
      v29->_hasMemoryGenerated = 0;
      v29->_memoryGenerated = 0;
    }
    v29->_memoryAssetCount = a15;
  }

  return v29;
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
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v15 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMPhotosMemoryCreation identifier](self, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosMemoryCreation queryContainsPersonEntity](self, "queryContainsPersonEntity"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosMemoryCreation queryContainsActivityEntity](self, "queryContainsActivityEntity"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosMemoryCreation queryContainsTimeEntity](self, "queryContainsTimeEntity"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosMemoryCreation queryContainsLocationEntity](self, "queryContainsLocationEntity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosMemoryCreation queryContainsTripEntity](self, "queryContainsTripEntity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosMemoryCreation queryContainsMusicArtist](self, "queryContainsMusicArtist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosMemoryCreation queryContainsMusicSong](self, "queryContainsMusicSong"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosMemoryCreation queryContainsMusicGenre](self, "queryContainsMusicGenre"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosMemoryCreation queryContainsMusicMood](self, "queryContainsMusicMood"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPhotosMemoryCreation globalTraits](self, "globalTraits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosMemoryCreation memoryGenerated](self, "memoryGenerated"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  BMPhotosMemoryCreationMemoryAssetCountAsString(-[BMPhotosMemoryCreation memoryAssetCount](self, "memoryAssetCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("BMPhotosMemoryCreation with identifier: %@, queryContainsPersonEntity: %@, queryContainsActivityEntity: %@, queryContainsTimeEntity: %@, queryContainsLocationEntity: %@, queryContainsTripEntity: %@, queryContainsMusicArtist: %@, queryContainsMusicSong: %@, queryContainsMusicGenre: %@, queryContainsMusicMood: %@, globalTraits: %@, memoryGenerated: %@, memoryAssetCount: %@"), v14, v13, v18, v17, v12, v3, v4, v5, v6, v7, v8, v9, v10);

  return (NSString *)v16;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMPhotosMemoryCreation *v5;
  void *v6;
  int *v7;
  int *v8;
  int *v9;
  int *v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  BOOL v17;
  int v18;
  uint64_t v20;
  NSString *identifier;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  char v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  char v46;
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char v51;
  char v52;
  unsigned int v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  char v58;
  unsigned int v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char v63;
  char v64;
  unsigned int v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  char v69;
  char v70;
  unsigned int v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  char v75;
  uint64_t v76;
  void *v77;
  char v78;
  unsigned int v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  char v83;
  char v84;
  unsigned int v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  char v89;
  BOOL v90;
  uint64_t v91;
  uint64_t v92;
  NSArray *globalTraits;
  int v94;
  BMPhotosMemoryCreation *v95;
  objc_super v97;

  v4 = a3;
  v97.receiver = self;
  v97.super_class = (Class)BMPhotosMemoryCreation;
  v5 = -[BMEventBase init](&v97, sel_init);
  if (!v5)
    goto LABEL_153;
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v10 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v9])
        break;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      while (1)
      {
        v14 = *v7;
        v15 = *(_QWORD *)&v4[v14];
        if (v15 == -1 || v15 >= *(_QWORD *)&v4[*v8])
          break;
        v16 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v15);
        *(_QWORD *)&v4[v14] = v15 + 1;
        v13 |= (unint64_t)(v16 & 0x7F) << v11;
        if ((v16 & 0x80) == 0)
          goto LABEL_13;
        v11 += 7;
        v17 = v12++ >= 9;
        if (v17)
        {
          v13 = 0;
          v18 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      v18 = v4[*v9];
      if (v4[*v9])
        v13 = 0;
LABEL_15:
      if (v18 || (v13 & 7) == 4)
        break;
      switch((v13 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          identifier = v5->_identifier;
          v5->_identifier = (NSString *)v20;

          continue;
        case 2u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          v5->_hasQueryContainsPersonEntity = 1;
          while (2)
          {
            v25 = *v7;
            v26 = *(_QWORD *)&v4[v25];
            if (v26 == -1 || v26 >= *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v27 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v26);
              *(_QWORD *)&v4[v25] = v26 + 1;
              v24 |= (unint64_t)(v27 & 0x7F) << v22;
              if (v27 < 0)
              {
                v22 += 7;
                v17 = v23++ >= 9;
                if (v17)
                {
                  v24 = 0;
                  goto LABEL_105;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            v24 = 0;
LABEL_105:
          v90 = v24 != 0;
          v91 = 16;
          goto LABEL_142;
        case 3u:
          v28 = 0;
          v29 = 0;
          v30 = 0;
          v5->_hasQueryContainsActivityEntity = 1;
          while (2)
          {
            v31 = *v7;
            v32 = *(_QWORD *)&v4[v31];
            if (v32 == -1 || v32 >= *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v33 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v32);
              *(_QWORD *)&v4[v31] = v32 + 1;
              v30 |= (unint64_t)(v33 & 0x7F) << v28;
              if (v33 < 0)
              {
                v28 += 7;
                v17 = v29++ >= 9;
                if (v17)
                {
                  v30 = 0;
                  goto LABEL_109;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            v30 = 0;
LABEL_109:
          v90 = v30 != 0;
          v91 = 18;
          goto LABEL_142;
        case 4u:
          v34 = 0;
          v35 = 0;
          v36 = 0;
          v5->_hasQueryContainsTimeEntity = 1;
          while (2)
          {
            v37 = *v7;
            v38 = *(_QWORD *)&v4[v37];
            if (v38 == -1 || v38 >= *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v39 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v38);
              *(_QWORD *)&v4[v37] = v38 + 1;
              v36 |= (unint64_t)(v39 & 0x7F) << v34;
              if (v39 < 0)
              {
                v34 += 7;
                v17 = v35++ >= 9;
                if (v17)
                {
                  v36 = 0;
                  goto LABEL_113;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            v36 = 0;
LABEL_113:
          v90 = v36 != 0;
          v91 = 20;
          goto LABEL_142;
        case 5u:
          v40 = 0;
          v41 = 0;
          v42 = 0;
          v5->_hasQueryContainsLocationEntity = 1;
          while (2)
          {
            v43 = *v7;
            v44 = *(_QWORD *)&v4[v43];
            if (v44 == -1 || v44 >= *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v45 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v44);
              *(_QWORD *)&v4[v43] = v44 + 1;
              v42 |= (unint64_t)(v45 & 0x7F) << v40;
              if (v45 < 0)
              {
                v40 += 7;
                v17 = v41++ >= 9;
                if (v17)
                {
                  v42 = 0;
                  goto LABEL_117;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            v42 = 0;
LABEL_117:
          v90 = v42 != 0;
          v91 = 22;
          goto LABEL_142;
        case 6u:
          v46 = 0;
          v47 = 0;
          v48 = 0;
          v5->_hasQueryContainsTripEntity = 1;
          while (2)
          {
            v49 = *v7;
            v50 = *(_QWORD *)&v4[v49];
            if (v50 == -1 || v50 >= *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v51 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v50);
              *(_QWORD *)&v4[v49] = v50 + 1;
              v48 |= (unint64_t)(v51 & 0x7F) << v46;
              if (v51 < 0)
              {
                v46 += 7;
                v17 = v47++ >= 9;
                if (v17)
                {
                  v48 = 0;
                  goto LABEL_121;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            v48 = 0;
LABEL_121:
          v90 = v48 != 0;
          v91 = 24;
          goto LABEL_142;
        case 7u:
          v52 = 0;
          v53 = 0;
          v54 = 0;
          v5->_hasQueryContainsMusicArtist = 1;
          while (2)
          {
            v55 = *v7;
            v56 = *(_QWORD *)&v4[v55];
            if (v56 == -1 || v56 >= *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v57 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v56);
              *(_QWORD *)&v4[v55] = v56 + 1;
              v54 |= (unint64_t)(v57 & 0x7F) << v52;
              if (v57 < 0)
              {
                v52 += 7;
                v17 = v53++ >= 9;
                if (v17)
                {
                  v54 = 0;
                  goto LABEL_125;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            v54 = 0;
LABEL_125:
          v90 = v54 != 0;
          v91 = 26;
          goto LABEL_142;
        case 8u:
          v58 = 0;
          v59 = 0;
          v60 = 0;
          v5->_hasQueryContainsMusicSong = 1;
          while (2)
          {
            v61 = *v7;
            v62 = *(_QWORD *)&v4[v61];
            if (v62 == -1 || v62 >= *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v63 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v62);
              *(_QWORD *)&v4[v61] = v62 + 1;
              v60 |= (unint64_t)(v63 & 0x7F) << v58;
              if (v63 < 0)
              {
                v58 += 7;
                v17 = v59++ >= 9;
                if (v17)
                {
                  v60 = 0;
                  goto LABEL_129;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            v60 = 0;
LABEL_129:
          v90 = v60 != 0;
          v91 = 28;
          goto LABEL_142;
        case 9u:
          v64 = 0;
          v65 = 0;
          v66 = 0;
          v5->_hasQueryContainsMusicGenre = 1;
          while (2)
          {
            v67 = *v7;
            v68 = *(_QWORD *)&v4[v67];
            if (v68 == -1 || v68 >= *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v69 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v68);
              *(_QWORD *)&v4[v67] = v68 + 1;
              v66 |= (unint64_t)(v69 & 0x7F) << v64;
              if (v69 < 0)
              {
                v64 += 7;
                v17 = v65++ >= 9;
                if (v17)
                {
                  v66 = 0;
                  goto LABEL_133;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            v66 = 0;
LABEL_133:
          v90 = v66 != 0;
          v91 = 30;
          goto LABEL_142;
        case 0xAu:
          v70 = 0;
          v71 = 0;
          v72 = 0;
          v5->_hasQueryContainsMusicMood = 1;
          while (2)
          {
            v73 = *v7;
            v74 = *(_QWORD *)&v4[v73];
            if (v74 == -1 || v74 >= *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v75 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v74);
              *(_QWORD *)&v4[v73] = v74 + 1;
              v72 |= (unint64_t)(v75 & 0x7F) << v70;
              if (v75 < 0)
              {
                v70 += 7;
                v17 = v71++ >= 9;
                if (v17)
                {
                  v72 = 0;
                  goto LABEL_137;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            v72 = 0;
LABEL_137:
          v90 = v72 != 0;
          v91 = 32;
          goto LABEL_142;
        case 0xBu:
          PBReaderReadString();
          v76 = objc_claimAutoreleasedReturnValue();
          if (!v76)
            goto LABEL_155;
          v77 = (void *)v76;
          objc_msgSend(v6, "addObject:", v76);

          continue;
        case 0xCu:
          v78 = 0;
          v79 = 0;
          v80 = 0;
          v5->_hasMemoryGenerated = 1;
          while (2)
          {
            v81 = *v7;
            v82 = *(_QWORD *)&v4[v81];
            if (v82 == -1 || v82 >= *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v83 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v82);
              *(_QWORD *)&v4[v81] = v82 + 1;
              v80 |= (unint64_t)(v83 & 0x7F) << v78;
              if (v83 < 0)
              {
                v78 += 7;
                v17 = v79++ >= 9;
                if (v17)
                {
                  v80 = 0;
                  goto LABEL_141;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            v80 = 0;
LABEL_141:
          v90 = v80 != 0;
          v91 = 34;
LABEL_142:
          *((_BYTE *)&v5->super.super.isa + v91) = v90;
          continue;
        case 0xDu:
          v84 = 0;
          v85 = 0;
          v86 = 0;
          break;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_155:

          goto LABEL_152;
      }
      while (1)
      {
        v87 = *v7;
        v88 = *(_QWORD *)&v4[v87];
        if (v88 == -1 || v88 >= *(_QWORD *)&v4[*v8])
          break;
        v89 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v88);
        *(_QWORD *)&v4[v87] = v88 + 1;
        v86 |= (unint64_t)(v89 & 0x7F) << v84;
        if ((v89 & 0x80) == 0)
          goto LABEL_146;
        v84 += 7;
        v17 = v85++ >= 9;
        if (v17)
        {
          LODWORD(v86) = 0;
          goto LABEL_148;
        }
      }
      v4[*v9] = 1;
LABEL_146:
      if (v4[*v9])
        LODWORD(v86) = 0;
LABEL_148:
      if (v86 >= 5)
        LODWORD(v86) = 0;
      v5->_memoryAssetCount = v86;
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v92 = objc_msgSend(v6, "copy");
  globalTraits = v5->_globalTraits;
  v5->_globalTraits = (NSArray *)v92;

  v94 = v4[*v9];
  if (v94)
LABEL_152:
    v95 = 0;
  else
LABEL_153:
    v95 = v5;

  return v95;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_identifier)
    PBDataWriterWriteStringField();
  if (self->_hasQueryContainsPersonEntity)
    PBDataWriterWriteBOOLField();
  if (self->_hasQueryContainsActivityEntity)
    PBDataWriterWriteBOOLField();
  if (self->_hasQueryContainsTimeEntity)
    PBDataWriterWriteBOOLField();
  if (self->_hasQueryContainsLocationEntity)
    PBDataWriterWriteBOOLField();
  if (self->_hasQueryContainsTripEntity)
    PBDataWriterWriteBOOLField();
  if (self->_hasQueryContainsMusicArtist)
    PBDataWriterWriteBOOLField();
  if (self->_hasQueryContainsMusicSong)
    PBDataWriterWriteBOOLField();
  if (self->_hasQueryContainsMusicGenre)
    PBDataWriterWriteBOOLField();
  if (self->_hasQueryContainsMusicMood)
    PBDataWriterWriteBOOLField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_globalTraits;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (self->_hasMemoryGenerated)
    PBDataWriterWriteBOOLField();
  PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMPhotosMemoryCreation writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMPhotosMemoryCreation)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id *v23;
  id v24;
  uint64_t v25;
  void *v26;
  BMPhotosMemoryCreation *v27;
  id *v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  void *v54;
  uint64_t v55;
  id v56;
  id v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  id v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t i;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  id v76;
  id v77;
  void *v78;
  uint64_t v79;
  id v80;
  void *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  id v85;
  void *v86;
  uint64_t v87;
  id v88;
  void *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  id v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  id v97;
  void *v98;
  uint64_t v99;
  id v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  id v107;
  uint64_t v108;
  void *v109;
  id v110;
  void *v111;
  uint64_t v112;
  id v113;
  id v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  void *v120;
  id v121;
  id v122;
  uint64_t v123;
  uint64_t v124;
  id v125;
  id v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  id v130;
  id v131;
  id v132;
  void *v134;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  id v146;
  void *v147;
  void *v148;
  void *v149;
  id v150;
  id v151;
  uint64_t v152;
  void *v153;
  id v154;
  void *v155;
  id v156;
  void *v157;
  void *v158;
  id v159;
  void *v160;
  id v161;
  void *v162;
  void *v163;
  id v164;
  void *v165;
  void *v166;
  id v167;
  id v168;
  id v169;
  id v170;
  id *v171;
  id v172;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  uint64_t v178;
  void *v179;
  uint64_t v180;
  id v181;
  uint64_t v182;
  void *v183;
  uint64_t v184;
  void *v185;
  _BYTE v186[128];
  uint64_t v187;
  void *v188;
  uint64_t v189;
  id v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  id v196;
  uint64_t v197;
  id v198;
  uint64_t v199;
  id v200;
  uint64_t v201;
  id v202;
  uint64_t v203;
  id v204;
  uint64_t v205;
  id v206;
  uint64_t v207;
  _QWORD v208[3];

  v208[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v23 = a4;
        v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v25 = *MEMORY[0x1E0D025B8];
        v207 = *MEMORY[0x1E0CB2D50];
        v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("identifier"));
        v208[0] = v8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v208, &v207, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 0;
        v27 = 0;
        *v23 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v25, 2, v7);
        goto LABEL_140;
      }
      v26 = 0;
      v27 = 0;
      goto LABEL_141;
    }
    v172 = v6;
  }
  else
  {
    v172 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("queryContainsPersonEntity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v8 = 0;
        v27 = 0;
        v26 = v172;
        goto LABEL_140;
      }
      v28 = a4;
      v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v30 = *MEMORY[0x1E0D025B8];
      v205 = *MEMORY[0x1E0CB2D50];
      v31 = v7;
      v32 = objc_alloc(MEMORY[0x1E0CB3940]);
      v136 = objc_opt_class();
      v33 = v32;
      v7 = v31;
      v10 = (id)objc_msgSend(v33, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v136, CFSTR("queryContainsPersonEntity"));
      v206 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v206, &v205, 1);
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = v30;
      v9 = (void *)v34;
      v8 = 0;
      v27 = 0;
      *v28 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v35, 2, v34);
      goto LABEL_97;
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("queryContainsActivityEntity"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v171 = a4;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v9;
        goto LABEL_10;
      }
      if (a4)
      {
        v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v37 = *MEMORY[0x1E0D025B8];
        v203 = *MEMORY[0x1E0CB2D50];
        v38 = v8;
        v39 = objc_alloc(MEMORY[0x1E0CB3940]);
        v137 = objc_opt_class();
        v40 = v39;
        v8 = v38;
        v169 = (id)objc_msgSend(v40, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v137, CFSTR("queryContainsActivityEntity"));
        v204 = v169;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v204, &v203, 1);
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = v36;
        v11 = (void *)v41;
        v10 = 0;
        v27 = 0;
        *v171 = (id)objc_msgSend(v42, "initWithDomain:code:userInfo:", v37, 2, v41);
        goto LABEL_102;
      }
      v10 = 0;
      v27 = 0;
LABEL_97:
      v26 = v172;
      goto LABEL_139;
    }
  }
  v10 = 0;
LABEL_10:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("queryContainsTimeEntity"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v167 = v10;
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v169 = v11;
        goto LABEL_13;
      }
      if (v171)
      {
        v170 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v44 = v9;
        v45 = *MEMORY[0x1E0D025B8];
        v201 = *MEMORY[0x1E0CB2D50];
        v46 = v8;
        v47 = objc_alloc(MEMORY[0x1E0CB3940]);
        v138 = objc_opt_class();
        v48 = v47;
        v8 = v46;
        v168 = (id)objc_msgSend(v48, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v138, CFSTR("queryContainsTimeEntity"));
        v202 = v168;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v202, &v201, 1);
        v49 = v6;
        v50 = objc_claimAutoreleasedReturnValue();
        v51 = v45;
        v9 = v44;
        v10 = v167;
        v52 = (id)objc_msgSend(v170, "initWithDomain:code:userInfo:", v51, 2, v50);
        v169 = 0;
        v27 = 0;
        *v171 = v52;
        v12 = (void *)v50;
        v6 = v49;
        v26 = v172;
        goto LABEL_137;
      }
      v169 = 0;
      v27 = 0;
LABEL_102:
      v26 = v172;
      goto LABEL_138;
    }
  }
  v169 = 0;
LABEL_13:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("queryContainsLocationEntity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v165 = v6;
  v166 = v7;
  v162 = v11;
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v171)
      {
        v53 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v54 = v9;
        v55 = *MEMORY[0x1E0D025B8];
        v199 = *MEMORY[0x1E0CB2D50];
        v56 = v8;
        v57 = objc_alloc(MEMORY[0x1E0CB3940]);
        v139 = objc_opt_class();
        v58 = v57;
        v8 = v56;
        v164 = (id)objc_msgSend(v58, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v139, CFSTR("queryContainsLocationEntity"));
        v200 = v164;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v200, &v199, 1);
        v59 = objc_claimAutoreleasedReturnValue();
        v60 = v53;
        v11 = v162;
        v61 = v55;
        v9 = v54;
        v10 = v167;
        v163 = (void *)v59;
        v168 = 0;
        v27 = 0;
        *v171 = (id)objc_msgSend(v60, "initWithDomain:code:userInfo:", v61, 2);
        v26 = v172;
        goto LABEL_136;
      }
      v168 = 0;
      v27 = 0;
      v26 = v172;
      goto LABEL_137;
    }
    v13 = v8;
    v14 = v10;
    v168 = v12;
  }
  else
  {
    v13 = v8;
    v14 = v10;
    v168 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("queryContainsTripEntity"));
  v15 = objc_claimAutoreleasedReturnValue();
  v163 = (void *)v15;
  if (v15 && (v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!v171)
      {
        v164 = 0;
        v27 = 0;
        v26 = v172;
        v10 = v14;
        v8 = v13;
        v7 = v166;
        goto LABEL_136;
      }
      v77 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v78 = v9;
      v79 = *MEMORY[0x1E0D025B8];
      v197 = *MEMORY[0x1E0CB2D50];
      v80 = objc_alloc(MEMORY[0x1E0CB3940]);
      v140 = objc_opt_class();
      v81 = v80;
      v8 = v13;
      v161 = (id)objc_msgSend(v81, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v140, CFSTR("queryContainsTripEntity"));
      v198 = v161;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v198, &v197, 1);
      v82 = objc_claimAutoreleasedReturnValue();
      v83 = v77;
      v11 = v162;
      v84 = v79;
      v9 = v78;
      v10 = v167;
      v160 = (void *)v82;
      v164 = 0;
      v27 = 0;
      *v171 = (id)objc_msgSend(v83, "initWithDomain:code:userInfo:", v84, 2);
      v26 = v172;
      goto LABEL_110;
    }
    v164 = v16;
  }
  else
  {
    v164 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("queryContainsMusicArtist"));
  v17 = objc_claimAutoreleasedReturnValue();
  v160 = (void *)v17;
  if (v17)
  {
    v18 = (void *)v17;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v161 = v18;
        goto LABEL_22;
      }
      if (v171)
      {
        v85 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v86 = v9;
        v87 = *MEMORY[0x1E0D025B8];
        v195 = *MEMORY[0x1E0CB2D50];
        v88 = objc_alloc(MEMORY[0x1E0CB3940]);
        v141 = objc_opt_class();
        v89 = v88;
        v8 = v13;
        v159 = (id)objc_msgSend(v89, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v141, CFSTR("queryContainsMusicArtist"));
        v196 = v159;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v196, &v195, 1);
        v90 = objc_claimAutoreleasedReturnValue();
        v91 = v85;
        v11 = v162;
        v92 = v87;
        v9 = v86;
        v10 = v167;
        v158 = (void *)v90;
        v161 = 0;
        v27 = 0;
        *v171 = (id)objc_msgSend(v91, "initWithDomain:code:userInfo:", v92, 2);
        v26 = v172;
LABEL_114:
        v7 = v166;
        goto LABEL_134;
      }
      v161 = 0;
      v27 = 0;
      v26 = v172;
      v10 = v14;
      v8 = v13;
LABEL_110:
      v7 = v166;
      goto LABEL_135;
    }
  }
  v161 = 0;
LABEL_22:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("queryContainsMusicSong"));
  v19 = objc_claimAutoreleasedReturnValue();
  v158 = (void *)v19;
  if (!v19 || (v20 = (void *)v19, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v159 = 0;
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v171)
    {
      v97 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v98 = v9;
      v99 = *MEMORY[0x1E0D025B8];
      v193 = *MEMORY[0x1E0CB2D50];
      v100 = objc_alloc(MEMORY[0x1E0CB3940]);
      v142 = objc_opt_class();
      v101 = v100;
      v8 = v13;
      v102 = objc_msgSend(v101, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v142, CFSTR("queryContainsMusicSong"));
      v194 = v102;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v194, &v193, 1);
      v103 = objc_claimAutoreleasedReturnValue();
      v104 = v97;
      v11 = v162;
      v105 = v99;
      v9 = v98;
      v106 = (void *)v102;
      v157 = (void *)v103;
      v159 = 0;
      v27 = 0;
      *v171 = (id)objc_msgSend(v104, "initWithDomain:code:userInfo:", v105, 2);
      v26 = v172;
      v7 = v166;
      goto LABEL_133;
    }
    v159 = 0;
    v27 = 0;
    v26 = v172;
    v10 = v14;
    v8 = v13;
    goto LABEL_114;
  }
  v159 = v20;
LABEL_25:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("queryContainsMusicGenre"));
  v21 = objc_claimAutoreleasedReturnValue();
  v157 = (void *)v21;
  if (!v21)
  {
    v156 = 0;
    v8 = v13;
    goto LABEL_49;
  }
  v22 = (void *)v21;
  objc_opt_class();
  v8 = v13;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v156 = 0;
LABEL_49:
    v7 = v166;
    goto LABEL_50;
  }
  objc_opt_class();
  v7 = v166;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v109 = v12;
    if (!v171)
    {
      v106 = 0;
      v27 = 0;
      v26 = v172;
      v6 = v165;
      goto LABEL_133;
    }
    v110 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v111 = v9;
    v112 = *MEMORY[0x1E0D025B8];
    v191 = *MEMORY[0x1E0CB2D50];
    v113 = v8;
    v114 = objc_alloc(MEMORY[0x1E0CB3940]);
    v143 = objc_opt_class();
    v115 = v114;
    v8 = v113;
    v116 = objc_msgSend(v115, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v143, CFSTR("queryContainsMusicGenre"));
    v192 = v116;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v192, &v191, 1);
    v117 = objc_claimAutoreleasedReturnValue();
    v118 = v110;
    v11 = v162;
    v119 = v112;
    v9 = v111;
    v43 = (id)v116;
    v155 = (void *)v117;
    v156 = 0;
    v27 = 0;
    *v171 = (id)objc_msgSend(v118, "initWithDomain:code:userInfo:", v119, 2);
    goto LABEL_119;
  }
  v156 = v22;
LABEL_50:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("queryContainsMusicMood"));
  v43 = (id)objc_claimAutoreleasedReturnValue();
  v153 = v9;
  v155 = v43;
  if (v43)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v43 = 0;
      goto LABEL_63;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v43 = v43;
      goto LABEL_63;
    }
    v109 = v12;
    if (v171)
    {
      v121 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v122 = v8;
      v123 = *MEMORY[0x1E0D025B8];
      v189 = *MEMORY[0x1E0CB2D50];
      v62 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("queryContainsMusicMood"));
      v190 = v62;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v190, &v189, 1);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v124 = v123;
      v8 = v122;
      v125 = (id)objc_msgSend(v121, "initWithDomain:code:userInfo:", v124, 2, v66);
      v43 = 0;
      v27 = 0;
      *v171 = v125;
      v26 = v172;
      v6 = v165;
      goto LABEL_130;
    }
    v43 = 0;
    v27 = 0;
LABEL_119:
    v26 = v172;
    v12 = v109;
    v6 = v165;
    goto LABEL_132;
  }
LABEL_63:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("globalTraits"));
  v62 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v62, "isEqual:", v63);

  v154 = v8;
  if (v64)
  {
    v65 = v12;

    v62 = 0;
  }
  else
  {
    if (v62)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v171)
        {
          v126 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v127 = *MEMORY[0x1E0D025B8];
          v187 = *MEMORY[0x1E0CB2D50];
          v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("globalTraits"));
          v188 = v66;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v188, &v187, 1);
          v128 = objc_claimAutoreleasedReturnValue();
          v129 = v127;
          v8 = v154;
          v130 = (id)objc_msgSend(v126, "initWithDomain:code:userInfo:", v129, 2, v128);
          v27 = 0;
          *v171 = v130;
          v120 = (void *)v128;
          v26 = v172;
          goto LABEL_129;
        }
        v27 = 0;
        v26 = v172;
        goto LABEL_131;
      }
    }
    v65 = v12;
  }
  v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v62, "count"));
  v174 = 0u;
  v175 = 0u;
  v176 = 0u;
  v177 = 0u;
  v62 = v62;
  v67 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v174, v186, 16);
  if (!v67)
    goto LABEL_77;
  v68 = v67;
  v69 = *(_QWORD *)v175;
  v150 = v43;
  while (2)
  {
    for (i = 0; i != v68; ++i)
    {
      if (*(_QWORD *)v175 != v69)
        objc_enumerationMutation(v62);
      v71 = *(_QWORD *)(*((_QWORD *)&v174 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v171)
        {
          v93 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v94 = *MEMORY[0x1E0D025B8];
          v184 = *MEMORY[0x1E0CB2D50];
          v149 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("globalTraits"));
          v185 = v149;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v185, &v184, 1);
          v76 = (id)objc_claimAutoreleasedReturnValue();
          v95 = v93;
          v96 = v94;
LABEL_95:
          v26 = v172;
          v7 = v166;
          v43 = v150;
          v27 = 0;
          *v171 = (id)objc_msgSend(v95, "initWithDomain:code:userInfo:", v96, 2, v76);
          v151 = v62;
          v12 = v65;
          v6 = v165;
          goto LABEL_127;
        }
LABEL_100:
        v27 = 0;
        v120 = v62;
        v26 = v172;
        v8 = v154;
        v12 = v65;
        v6 = v165;
        v7 = v166;
        v43 = v150;
        goto LABEL_129;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v171)
        {
          v107 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v108 = *MEMORY[0x1E0D025B8];
          v182 = *MEMORY[0x1E0CB2D50];
          v149 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("globalTraits"));
          v183 = v149;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v183, &v182, 1);
          v76 = (id)objc_claimAutoreleasedReturnValue();
          v95 = v107;
          v96 = v108;
          goto LABEL_95;
        }
        goto LABEL_100;
      }
      objc_msgSend(v66, "addObject:", v71);
    }
    v68 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v174, v186, 16);
    v43 = v150;
    if (v68)
      continue;
    break;
  }
LABEL_77:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("memoryGenerated"));
  v72 = objc_claimAutoreleasedReturnValue();
  v149 = (void *)v72;
  if (v72 && (v73 = (void *)v72, objc_opt_class(), v8 = v154, (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v151 = v73;
      goto LABEL_80;
    }
    v7 = v166;
    if (v171)
    {
      v131 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v152 = *MEMORY[0x1E0D025B8];
      v180 = *MEMORY[0x1E0CB2D50];
      v76 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("memoryGenerated"));
      v181 = v76;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v181, &v180, 1);
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      v132 = (id)objc_msgSend(v131, "initWithDomain:code:userInfo:", v152, 2);
      v151 = 0;
      v27 = 0;
      *v171 = v132;
      v26 = v172;
      v12 = v65;
      v6 = v165;

      goto LABEL_127;
    }
    v151 = 0;
    v27 = 0;
    v26 = v172;
    v12 = v65;
    v6 = v165;
  }
  else
  {
    v151 = 0;
LABEL_80:
    v7 = v166;
    v12 = v65;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("memoryAssetCount"));
    v74 = objc_claimAutoreleasedReturnValue();
    v6 = v165;
    v147 = (void *)v74;
    if (!v74 || (v75 = (void *)v74, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v76 = 0;
      v26 = v172;
      goto LABEL_125;
    }
    v26 = v172;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v76 = v75;
      goto LABEL_125;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMPhotosMemoryCreationMemoryAssetCountFromString(v75));
      v76 = (id)objc_claimAutoreleasedReturnValue();
      v7 = v166;
LABEL_125:
      LODWORD(v144) = objc_msgSend(v76, "intValue");
      v27 = -[BMPhotosMemoryCreation initWithIdentifier:queryContainsPersonEntity:queryContainsActivityEntity:queryContainsTimeEntity:queryContainsLocationEntity:queryContainsTripEntity:queryContainsMusicArtist:queryContainsMusicSong:queryContainsMusicGenre:queryContainsMusicMood:globalTraits:memoryGenerated:memoryAssetCount:](self, "initWithIdentifier:queryContainsPersonEntity:queryContainsActivityEntity:queryContainsTimeEntity:queryContainsLocationEntity:queryContainsTripEntity:queryContainsMusicArtist:queryContainsMusicSong:queryContainsMusicGenre:queryContainsMusicMood:globalTraits:memoryGenerated:memoryAssetCount:", v26, v154, v167, v169, v168, v164, v161, v159, v156, v43, v66, v151, v144);
      self = v27;
    }
    else
    {
      if (v171)
      {
        v146 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v145 = *MEMORY[0x1E0D025B8];
        v178 = *MEMORY[0x1E0CB2D50];
        v134 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("memoryAssetCount"));
        v179 = v134;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v179, &v178, 1);
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        *v171 = (id)objc_msgSend(v146, "initWithDomain:code:userInfo:", v145, 2, v135);

      }
      v76 = 0;
      v27 = 0;
      v7 = v166;
    }

LABEL_127:
    v8 = v154;
  }

  v120 = v151;
LABEL_129:

LABEL_130:
LABEL_131:

  v9 = v153;
  v11 = v162;
LABEL_132:

  v106 = v156;
LABEL_133:

  v10 = v167;
LABEL_134:

LABEL_135:
LABEL_136:

LABEL_137:
LABEL_138:

LABEL_139:
LABEL_140:

LABEL_141:
  return v27;
}

- (id)_globalTraitsJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[BMPhotosMemoryCreation globalTraits](self, "globalTraits", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)jsonDictionary
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[13];
  _QWORD v42[15];

  v42[13] = *MEMORY[0x1E0C80C00];
  -[BMPhotosMemoryCreation identifier](self, "identifier");
  v3 = objc_claimAutoreleasedReturnValue();
  if (-[BMPhotosMemoryCreation hasQueryContainsPersonEntity](self, "hasQueryContainsPersonEntity"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosMemoryCreation queryContainsPersonEntity](self, "queryContainsPersonEntity"));
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  if (-[BMPhotosMemoryCreation hasQueryContainsActivityEntity](self, "hasQueryContainsActivityEntity"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosMemoryCreation queryContainsActivityEntity](self, "queryContainsActivityEntity"));
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  if (-[BMPhotosMemoryCreation hasQueryContainsTimeEntity](self, "hasQueryContainsTimeEntity"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosMemoryCreation queryContainsTimeEntity](self, "queryContainsTimeEntity"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  if (-[BMPhotosMemoryCreation hasQueryContainsLocationEntity](self, "hasQueryContainsLocationEntity"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosMemoryCreation queryContainsLocationEntity](self, "queryContainsLocationEntity"));
    v40 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v40 = 0;
  }
  if (-[BMPhotosMemoryCreation hasQueryContainsTripEntity](self, "hasQueryContainsTripEntity"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosMemoryCreation queryContainsTripEntity](self, "queryContainsTripEntity"));
    v39 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v39 = 0;
  }
  if (-[BMPhotosMemoryCreation hasQueryContainsMusicArtist](self, "hasQueryContainsMusicArtist"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosMemoryCreation queryContainsMusicArtist](self, "queryContainsMusicArtist"));
    v38 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v38 = 0;
  }
  if (-[BMPhotosMemoryCreation hasQueryContainsMusicSong](self, "hasQueryContainsMusicSong"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosMemoryCreation queryContainsMusicSong](self, "queryContainsMusicSong"));
    v37 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v37 = 0;
  }
  if (-[BMPhotosMemoryCreation hasQueryContainsMusicGenre](self, "hasQueryContainsMusicGenre"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosMemoryCreation queryContainsMusicGenre](self, "queryContainsMusicGenre"));
    v36 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v36 = 0;
  }
  if (-[BMPhotosMemoryCreation hasQueryContainsMusicMood](self, "hasQueryContainsMusicMood"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosMemoryCreation queryContainsMusicMood](self, "queryContainsMusicMood"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  -[BMPhotosMemoryCreation _globalTraitsJSONArray](self, "_globalTraitsJSONArray");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMPhotosMemoryCreation hasMemoryGenerated](self, "hasMemoryGenerated"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMPhotosMemoryCreation memoryGenerated](self, "memoryGenerated"));
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPhotosMemoryCreation memoryAssetCount](self, "memoryAssetCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = CFSTR("identifier");
  v10 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v10;
  v42[0] = v10;
  v41[1] = CFSTR("queryContainsPersonEntity");
  v11 = (uint64_t)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v11;
  v42[1] = v11;
  v41[2] = CFSTR("queryContainsActivityEntity");
  v12 = (uint64_t)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v12;
  v42[2] = v12;
  v41[3] = CFSTR("queryContainsTimeEntity");
  v13 = (uint64_t)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v13;
  v42[3] = v13;
  v41[4] = CFSTR("queryContainsLocationEntity");
  v14 = (uint64_t)v40;
  if (!v40)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v34 = (void *)v3;
  v42[4] = v14;
  v41[5] = CFSTR("queryContainsTripEntity");
  v15 = (uint64_t)v39;
  if (!v39)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v33 = v4;
  v42[5] = v15;
  v41[6] = CFSTR("queryContainsMusicArtist");
  v16 = v38;
  if (!v38)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32 = v5;
  v42[6] = v16;
  v41[7] = CFSTR("queryContainsMusicSong");
  v17 = v37;
  if (!v37)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31 = v6;
  v42[7] = v17;
  v41[8] = CFSTR("queryContainsMusicGenre");
  v18 = v36;
  if (!v36)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v14;
  v42[8] = v18;
  v41[9] = CFSTR("queryContainsMusicMood");
  v19 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v15;
  v42[9] = v19;
  v41[10] = CFSTR("globalTraits");
  v20 = v35;
  if (!v35)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v42[10] = v20;
  v41[11] = CFSTR("memoryGenerated");
  v21 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v42[11] = v21;
  v41[12] = CFSTR("memoryAssetCount");
  v22 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v42[12] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 13);
  v30 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (v8)
      goto LABEL_59;
  }
  else
  {

    if (v8)
      goto LABEL_59;
  }

LABEL_59:
  if (v35)
  {
    if (v7)
      goto LABEL_61;
  }
  else
  {

    if (v7)
      goto LABEL_61;
  }

LABEL_61:
  if (!v36)

  if (!v37)
  if (!v38)

  if (!v39)
  if (v40)
  {
    if (v31)
      goto LABEL_71;
  }
  else
  {

    if (v31)
    {
LABEL_71:
      if (v32)
        goto LABEL_72;
      goto LABEL_81;
    }
  }

  if (v32)
  {
LABEL_72:
    if (v33)
      goto LABEL_73;
LABEL_82:

    if (v34)
      goto LABEL_74;
LABEL_83:

    goto LABEL_74;
  }
LABEL_81:

  if (!v33)
    goto LABEL_82;
LABEL_73:
  if (!v34)
    goto LABEL_83;
LABEL_74:

  return v30;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  int v30;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMPhotosMemoryCreation identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMPhotosMemoryCreation identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_61;
    }
    if (-[BMPhotosMemoryCreation hasQueryContainsPersonEntity](self, "hasQueryContainsPersonEntity")
      || objc_msgSend(v5, "hasQueryContainsPersonEntity"))
    {
      if (!-[BMPhotosMemoryCreation hasQueryContainsPersonEntity](self, "hasQueryContainsPersonEntity"))
        goto LABEL_61;
      if (!objc_msgSend(v5, "hasQueryContainsPersonEntity"))
        goto LABEL_61;
      v13 = -[BMPhotosMemoryCreation queryContainsPersonEntity](self, "queryContainsPersonEntity");
      if (v13 != objc_msgSend(v5, "queryContainsPersonEntity"))
        goto LABEL_61;
    }
    if (-[BMPhotosMemoryCreation hasQueryContainsActivityEntity](self, "hasQueryContainsActivityEntity")
      || objc_msgSend(v5, "hasQueryContainsActivityEntity"))
    {
      if (!-[BMPhotosMemoryCreation hasQueryContainsActivityEntity](self, "hasQueryContainsActivityEntity"))
        goto LABEL_61;
      if (!objc_msgSend(v5, "hasQueryContainsActivityEntity"))
        goto LABEL_61;
      v14 = -[BMPhotosMemoryCreation queryContainsActivityEntity](self, "queryContainsActivityEntity");
      if (v14 != objc_msgSend(v5, "queryContainsActivityEntity"))
        goto LABEL_61;
    }
    if (-[BMPhotosMemoryCreation hasQueryContainsTimeEntity](self, "hasQueryContainsTimeEntity")
      || objc_msgSend(v5, "hasQueryContainsTimeEntity"))
    {
      if (!-[BMPhotosMemoryCreation hasQueryContainsTimeEntity](self, "hasQueryContainsTimeEntity"))
        goto LABEL_61;
      if (!objc_msgSend(v5, "hasQueryContainsTimeEntity"))
        goto LABEL_61;
      v15 = -[BMPhotosMemoryCreation queryContainsTimeEntity](self, "queryContainsTimeEntity");
      if (v15 != objc_msgSend(v5, "queryContainsTimeEntity"))
        goto LABEL_61;
    }
    if (-[BMPhotosMemoryCreation hasQueryContainsLocationEntity](self, "hasQueryContainsLocationEntity")
      || objc_msgSend(v5, "hasQueryContainsLocationEntity"))
    {
      if (!-[BMPhotosMemoryCreation hasQueryContainsLocationEntity](self, "hasQueryContainsLocationEntity"))
        goto LABEL_61;
      if (!objc_msgSend(v5, "hasQueryContainsLocationEntity"))
        goto LABEL_61;
      v16 = -[BMPhotosMemoryCreation queryContainsLocationEntity](self, "queryContainsLocationEntity");
      if (v16 != objc_msgSend(v5, "queryContainsLocationEntity"))
        goto LABEL_61;
    }
    if (-[BMPhotosMemoryCreation hasQueryContainsTripEntity](self, "hasQueryContainsTripEntity")
      || objc_msgSend(v5, "hasQueryContainsTripEntity"))
    {
      if (!-[BMPhotosMemoryCreation hasQueryContainsTripEntity](self, "hasQueryContainsTripEntity"))
        goto LABEL_61;
      if (!objc_msgSend(v5, "hasQueryContainsTripEntity"))
        goto LABEL_61;
      v17 = -[BMPhotosMemoryCreation queryContainsTripEntity](self, "queryContainsTripEntity");
      if (v17 != objc_msgSend(v5, "queryContainsTripEntity"))
        goto LABEL_61;
    }
    if (-[BMPhotosMemoryCreation hasQueryContainsMusicArtist](self, "hasQueryContainsMusicArtist")
      || objc_msgSend(v5, "hasQueryContainsMusicArtist"))
    {
      if (!-[BMPhotosMemoryCreation hasQueryContainsMusicArtist](self, "hasQueryContainsMusicArtist"))
        goto LABEL_61;
      if (!objc_msgSend(v5, "hasQueryContainsMusicArtist"))
        goto LABEL_61;
      v18 = -[BMPhotosMemoryCreation queryContainsMusicArtist](self, "queryContainsMusicArtist");
      if (v18 != objc_msgSend(v5, "queryContainsMusicArtist"))
        goto LABEL_61;
    }
    if (-[BMPhotosMemoryCreation hasQueryContainsMusicSong](self, "hasQueryContainsMusicSong")
      || objc_msgSend(v5, "hasQueryContainsMusicSong"))
    {
      if (!-[BMPhotosMemoryCreation hasQueryContainsMusicSong](self, "hasQueryContainsMusicSong"))
        goto LABEL_61;
      if (!objc_msgSend(v5, "hasQueryContainsMusicSong"))
        goto LABEL_61;
      v19 = -[BMPhotosMemoryCreation queryContainsMusicSong](self, "queryContainsMusicSong");
      if (v19 != objc_msgSend(v5, "queryContainsMusicSong"))
        goto LABEL_61;
    }
    if (-[BMPhotosMemoryCreation hasQueryContainsMusicGenre](self, "hasQueryContainsMusicGenre")
      || objc_msgSend(v5, "hasQueryContainsMusicGenre"))
    {
      if (!-[BMPhotosMemoryCreation hasQueryContainsMusicGenre](self, "hasQueryContainsMusicGenre"))
        goto LABEL_61;
      if (!objc_msgSend(v5, "hasQueryContainsMusicGenre"))
        goto LABEL_61;
      v20 = -[BMPhotosMemoryCreation queryContainsMusicGenre](self, "queryContainsMusicGenre");
      if (v20 != objc_msgSend(v5, "queryContainsMusicGenre"))
        goto LABEL_61;
    }
    if (-[BMPhotosMemoryCreation hasQueryContainsMusicMood](self, "hasQueryContainsMusicMood")
      || objc_msgSend(v5, "hasQueryContainsMusicMood"))
    {
      if (!-[BMPhotosMemoryCreation hasQueryContainsMusicMood](self, "hasQueryContainsMusicMood"))
        goto LABEL_61;
      if (!objc_msgSend(v5, "hasQueryContainsMusicMood"))
        goto LABEL_61;
      v21 = -[BMPhotosMemoryCreation queryContainsMusicMood](self, "queryContainsMusicMood");
      if (v21 != objc_msgSend(v5, "queryContainsMusicMood"))
        goto LABEL_61;
    }
    -[BMPhotosMemoryCreation globalTraits](self, "globalTraits");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "globalTraits");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v22 == (void *)v23)
    {

    }
    else
    {
      v24 = (void *)v23;
      -[BMPhotosMemoryCreation globalTraits](self, "globalTraits");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "globalTraits");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v25, "isEqual:", v26);

      if (!v27)
        goto LABEL_61;
    }
    if (!-[BMPhotosMemoryCreation hasMemoryGenerated](self, "hasMemoryGenerated")
      && !objc_msgSend(v5, "hasMemoryGenerated")
      || -[BMPhotosMemoryCreation hasMemoryGenerated](self, "hasMemoryGenerated")
      && objc_msgSend(v5, "hasMemoryGenerated")
      && (v28 = -[BMPhotosMemoryCreation memoryGenerated](self, "memoryGenerated"),
          v28 == objc_msgSend(v5, "memoryGenerated")))
    {
      v30 = -[BMPhotosMemoryCreation memoryAssetCount](self, "memoryAssetCount");
      v12 = v30 == objc_msgSend(v5, "memoryAssetCount");
      goto LABEL_62;
    }
LABEL_61:
    v12 = 0;
LABEL_62:

    goto LABEL_63;
  }
  v12 = 0;
LABEL_63:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)queryContainsPersonEntity
{
  return self->_queryContainsPersonEntity;
}

- (BOOL)hasQueryContainsPersonEntity
{
  return self->_hasQueryContainsPersonEntity;
}

- (void)setHasQueryContainsPersonEntity:(BOOL)a3
{
  self->_hasQueryContainsPersonEntity = a3;
}

- (BOOL)queryContainsActivityEntity
{
  return self->_queryContainsActivityEntity;
}

- (BOOL)hasQueryContainsActivityEntity
{
  return self->_hasQueryContainsActivityEntity;
}

- (void)setHasQueryContainsActivityEntity:(BOOL)a3
{
  self->_hasQueryContainsActivityEntity = a3;
}

- (BOOL)queryContainsTimeEntity
{
  return self->_queryContainsTimeEntity;
}

- (BOOL)hasQueryContainsTimeEntity
{
  return self->_hasQueryContainsTimeEntity;
}

- (void)setHasQueryContainsTimeEntity:(BOOL)a3
{
  self->_hasQueryContainsTimeEntity = a3;
}

- (BOOL)queryContainsLocationEntity
{
  return self->_queryContainsLocationEntity;
}

- (BOOL)hasQueryContainsLocationEntity
{
  return self->_hasQueryContainsLocationEntity;
}

- (void)setHasQueryContainsLocationEntity:(BOOL)a3
{
  self->_hasQueryContainsLocationEntity = a3;
}

- (BOOL)queryContainsTripEntity
{
  return self->_queryContainsTripEntity;
}

- (BOOL)hasQueryContainsTripEntity
{
  return self->_hasQueryContainsTripEntity;
}

- (void)setHasQueryContainsTripEntity:(BOOL)a3
{
  self->_hasQueryContainsTripEntity = a3;
}

- (BOOL)queryContainsMusicArtist
{
  return self->_queryContainsMusicArtist;
}

- (BOOL)hasQueryContainsMusicArtist
{
  return self->_hasQueryContainsMusicArtist;
}

- (void)setHasQueryContainsMusicArtist:(BOOL)a3
{
  self->_hasQueryContainsMusicArtist = a3;
}

- (BOOL)queryContainsMusicSong
{
  return self->_queryContainsMusicSong;
}

- (BOOL)hasQueryContainsMusicSong
{
  return self->_hasQueryContainsMusicSong;
}

- (void)setHasQueryContainsMusicSong:(BOOL)a3
{
  self->_hasQueryContainsMusicSong = a3;
}

- (BOOL)queryContainsMusicGenre
{
  return self->_queryContainsMusicGenre;
}

- (BOOL)hasQueryContainsMusicGenre
{
  return self->_hasQueryContainsMusicGenre;
}

- (void)setHasQueryContainsMusicGenre:(BOOL)a3
{
  self->_hasQueryContainsMusicGenre = a3;
}

- (BOOL)queryContainsMusicMood
{
  return self->_queryContainsMusicMood;
}

- (BOOL)hasQueryContainsMusicMood
{
  return self->_hasQueryContainsMusicMood;
}

- (void)setHasQueryContainsMusicMood:(BOOL)a3
{
  self->_hasQueryContainsMusicMood = a3;
}

- (NSArray)globalTraits
{
  return self->_globalTraits;
}

- (BOOL)memoryGenerated
{
  return self->_memoryGenerated;
}

- (BOOL)hasMemoryGenerated
{
  return self->_hasMemoryGenerated;
}

- (void)setHasMemoryGenerated:(BOOL)a3
{
  self->_hasMemoryGenerated = a3;
}

- (int)memoryAssetCount
{
  return self->_memoryAssetCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalTraits, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (unsigned)latestDataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  _DWORD *v4;
  objc_class *v5;
  id v6;
  void *v7;

  if (a4)
  {
    v4 = 0;
  }
  else
  {
    v5 = (objc_class *)MEMORY[0x1E0D82B90];
    v6 = a3;
    v7 = (void *)objc_msgSend([v5 alloc], "initWithData:", v6);

    v4 = -[BMPhotosMemoryCreation initByReadFrom:]([BMPhotosMemoryCreation alloc], "initByReadFrom:", v7);
    v4[9] = 0;

  }
  return v4;
}

+ (id)columns
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[15];

  v17[13] = *MEMORY[0x1E0C80C00];
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("identifier"), 2, 0, 1, 13, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("queryContainsPersonEntity"), 0, 0, 2, 12, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("queryContainsActivityEntity"), 0, 0, 3, 12, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("queryContainsTimeEntity"), 0, 0, 4, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("queryContainsLocationEntity"), 0, 0, 5, 12, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("queryContainsTripEntity"), 0, 0, 6, 12, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("queryContainsMusicArtist"), 0, 0, 7, 12, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("queryContainsMusicSong"), 0, 0, 8, 12, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("queryContainsMusicGenre"), 0, 0, 9, 12, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("queryContainsMusicMood"), 0, 0, 10, 12, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("globalTraits_json"), 5, 1, &__block_literal_global_64_48464);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("memoryGenerated"), 0, 0, 12, 12, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("memoryAssetCount"), 0, 0, 13, 4, 0);
  v17[0] = v16;
  v17[1] = v15;
  v17[2] = v14;
  v17[3] = v2;
  v17[4] = v3;
  v17[5] = v4;
  v17[6] = v5;
  v17[7] = v6;
  v17[8] = v13;
  v17[9] = v7;
  v17[10] = v12;
  v17[11] = v8;
  v17[12] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 13);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1D8F0;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[14];

  v17[13] = *MEMORY[0x1E0C80C00];
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("identifier"), 1, 13, 0);
  v17[0] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("queryContainsPersonEntity"), 2, 12, 0);
  v17[1] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("queryContainsActivityEntity"), 3, 12, 0);
  v17[2] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("queryContainsTimeEntity"), 4, 12, 0);
  v17[3] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("queryContainsLocationEntity"), 5, 12, 0);
  v17[4] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("queryContainsTripEntity"), 6, 12, 0);
  v17[5] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("queryContainsMusicArtist"), 7, 12, 0);
  v17[6] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("queryContainsMusicSong"), 8, 12, 0);
  v17[7] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("queryContainsMusicGenre"), 9, 12, 0);
  v17[8] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("queryContainsMusicMood"), 10, 12, 0);
  v17[9] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("globalTraits"), 11, 13, 0);
  v17[10] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("memoryGenerated"), 12, 12, 0);
  v17[11] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("memoryAssetCount"), 13, 4, 0);
  v17[12] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __33__BMPhotosMemoryCreation_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_globalTraitsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
