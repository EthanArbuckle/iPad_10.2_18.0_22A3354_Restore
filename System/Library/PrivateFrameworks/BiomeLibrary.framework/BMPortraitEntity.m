@implementation BMPortraitEntity

- (BMPortraitEntity)initWithCategory:(int)a3 algorithm:(int)a4 decayRate:(id)a5 score:(id)a6 osBuild:(id)a7 assetVersion:(id)a8 name:(id)a9 bestLanguage:(id)a10 sentimentScore:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  BMPortraitEntity *v21;
  double v22;
  double v23;
  int v24;
  double v25;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v17 = a5;
  v18 = a6;
  v29 = a7;
  v19 = a8;
  v28 = a9;
  v27 = a10;
  v20 = a11;
  v30.receiver = self;
  v30.super_class = (Class)BMPortraitEntity;
  v21 = -[BMEventBase init](&v30, sel_init);
  if (v21)
  {
    v21->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v21->_category = a3;
    v21->_algorithm = a4;
    if (v17)
    {
      v21->_hasDecayRate = 1;
      objc_msgSend(v17, "doubleValue");
    }
    else
    {
      v21->_hasDecayRate = 0;
      v22 = -1.0;
    }
    v21->_decayRate = v22;
    if (v18)
    {
      v21->_hasScore = 1;
      objc_msgSend(v18, "doubleValue");
    }
    else
    {
      v21->_hasScore = 0;
      v23 = -1.0;
    }
    v21->_score = v23;
    objc_storeStrong((id *)&v21->_osBuild, a7);
    if (v19)
    {
      v21->_hasAssetVersion = 1;
      v24 = objc_msgSend(v19, "intValue");
    }
    else
    {
      v21->_hasAssetVersion = 0;
      v24 = -1;
    }
    v21->_assetVersion = v24;
    objc_storeStrong((id *)&v21->_name, a9);
    objc_storeStrong((id *)&v21->_bestLanguage, a10);
    if (v20)
    {
      v21->_hasSentimentScore = 1;
      objc_msgSend(v20, "doubleValue");
    }
    else
    {
      v21->_hasSentimentScore = 0;
      v25 = -1.0;
    }
    v21->_sentimentScore = v25;
  }

  return v21;
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;

  v17 = objc_alloc(MEMORY[0x1E0CB3940]);
  BMPortraitEntityCategoryAsString(-[BMPortraitEntity category](self, "category"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMPortraitEntityAlgorithmAsString(-[BMPortraitEntity algorithm](self, "algorithm"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[BMPortraitEntity decayRate](self, "decayRate");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[BMPortraitEntity score](self, "score");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPortraitEntity osBuild](self, "osBuild");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPortraitEntity assetVersion](self, "assetVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPortraitEntity name](self, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPortraitEntity bestLanguage](self, "bestLanguage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[BMPortraitEntity sentimentScore](self, "sentimentScore");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("BMPortraitEntity with category: %@, algorithm: %@, decayRate: %@, score: %@, osBuild: %@, assetVersion: %@, name: %@, bestLanguage: %@, sentimentScore: %@"), v3, v4, v6, v8, v9, v10, v11, v12, v14);

  return (NSString *)v15;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMPortraitEntity *v5;
  int *v6;
  int *v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  BOOL v17;
  int v18;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  unint64_t v34;
  objc_class *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  void *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  BMPortraitEntity *v52;
  objc_super v54;

  v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)BMPortraitEntity;
  v5 = -[BMEventBase init](&v54, sel_init);
  if (!v5)
    goto LABEL_83;
  v6 = (int *)MEMORY[0x1E0D82BF0];
  v7 = (int *)MEMORY[0x1E0D82BD8];
  v8 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v9 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v8])
        break;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = *v6;
        v14 = *(_QWORD *)&v4[v13];
        v15 = v14 + 1;
        if (v14 == -1 || v15 > *(_QWORD *)&v4[*v7])
          break;
        v16 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v14);
        *(_QWORD *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0)
          goto LABEL_13;
        v10 += 7;
        v17 = v11++ >= 9;
        if (v17)
        {
          v12 = 0;
          v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      v18 = v4[*v8];
      if (v4[*v8])
        v12 = 0;
LABEL_15:
      if (v18 || (v12 & 7) == 4)
        break;
      switch((v12 >> 3))
      {
        case 1u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          while (1)
          {
            v23 = *v6;
            v24 = *(_QWORD *)&v4[v23];
            v25 = v24 + 1;
            if (v24 == -1 || v25 > *(_QWORD *)&v4[*v7])
              break;
            v26 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v24);
            *(_QWORD *)&v4[v23] = v25;
            v22 |= (unint64_t)(v26 & 0x7F) << v20;
            if ((v26 & 0x80) == 0)
              goto LABEL_57;
            v20 += 7;
            v17 = v21++ >= 9;
            if (v17)
            {
              LODWORD(v22) = 0;
              goto LABEL_59;
            }
          }
          v4[*v8] = 1;
LABEL_57:
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_59:
          if (v22 >= 0x16)
            LODWORD(v22) = 0;
          v50 = 24;
          goto LABEL_68;
        case 2u:
          v27 = 0;
          v28 = 0;
          v22 = 0;
          while (2)
          {
            v29 = *v6;
            v30 = *(_QWORD *)&v4[v29];
            v31 = v30 + 1;
            if (v30 == -1 || v31 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v32 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v30);
              *(_QWORD *)&v4[v29] = v31;
              v22 |= (unint64_t)(v32 & 0x7F) << v27;
              if (v32 < 0)
              {
                v27 += 7;
                v17 = v28++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_65;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_65:
          if (v22 >= 0x12)
            LODWORD(v22) = 0;
          v50 = 28;
LABEL_68:
          *(_DWORD *)((char *)&v5->super.super.isa + v50) = v22;
          continue;
        case 3u:
          v5->_hasDecayRate = 1;
          v33 = *v6;
          v34 = *(_QWORD *)&v4[v33];
          if (v34 <= 0xFFFFFFFFFFFFFFF7 && v34 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v35 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v34);
            *(_QWORD *)&v4[v33] = v34 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v35 = 0;
          }
          v51 = 40;
          goto LABEL_79;
        case 4u:
          v5->_hasScore = 1;
          v36 = *v6;
          v37 = *(_QWORD *)&v4[v36];
          if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v35 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v37);
            *(_QWORD *)&v4[v36] = v37 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v35 = 0;
          }
          v51 = 48;
          goto LABEL_79;
        case 5u:
          PBReaderReadString();
          v38 = objc_claimAutoreleasedReturnValue();
          v39 = 56;
          goto LABEL_52;
        case 6u:
          v40 = 0;
          v41 = 0;
          v42 = 0;
          v5->_hasAssetVersion = 1;
          break;
        case 7u:
          PBReaderReadString();
          v38 = objc_claimAutoreleasedReturnValue();
          v39 = 64;
          goto LABEL_52;
        case 8u:
          PBReaderReadString();
          v38 = objc_claimAutoreleasedReturnValue();
          v39 = 72;
LABEL_52:
          v47 = *(Class *)((char *)&v5->super.super.isa + v39);
          *(Class *)((char *)&v5->super.super.isa + v39) = (Class)v38;

          continue;
        case 9u:
          v5->_hasSentimentScore = 1;
          v48 = *v6;
          v49 = *(_QWORD *)&v4[v48];
          if (v49 <= 0xFFFFFFFFFFFFFFF7 && v49 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v35 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v49);
            *(_QWORD *)&v4[v48] = v49 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v35 = 0;
          }
          v51 = 80;
LABEL_79:
          *(Class *)((char *)&v5->super.super.isa + v51) = v35;
          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_82;
          continue;
      }
      while (1)
      {
        v43 = *v6;
        v44 = *(_QWORD *)&v4[v43];
        v45 = v44 + 1;
        if (v44 == -1 || v45 > *(_QWORD *)&v4[*v7])
          break;
        v46 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v44);
        *(_QWORD *)&v4[v43] = v45;
        v42 |= (unint64_t)(v46 & 0x7F) << v40;
        if ((v46 & 0x80) == 0)
          goto LABEL_70;
        v40 += 7;
        v17 = v41++ >= 9;
        if (v17)
        {
          LODWORD(v42) = 0;
          goto LABEL_72;
        }
      }
      v4[*v8] = 1;
LABEL_70:
      if (v4[*v8])
        LODWORD(v42) = 0;
LABEL_72:
      v5->_assetVersion = v42;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_82:
    v52 = 0;
  else
LABEL_83:
    v52 = v5;

  return v52;
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasDecayRate)
    PBDataWriterWriteDoubleField();
  if (self->_hasScore)
    PBDataWriterWriteDoubleField();
  v4 = v5;
  if (self->_osBuild)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasAssetVersion)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_bestLanguage)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasSentimentScore)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMPortraitEntity writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMPortraitEntity)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id *v20;
  BMPortraitEntity *v21;
  void *v22;
  BMPortraitEntity *v24;
  void *v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  id v51;
  uint64_t v52;
  id v53;
  id v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  id v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  BMPortraitEntity *v76;
  id v77;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  id *v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  id v86;
  uint64_t v87;
  id v88;
  uint64_t v89;
  id v90;
  uint64_t v91;
  id v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  _QWORD v96[3];

  v96[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("category"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 0;
LABEL_9:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("algorithm"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v10 = 0;
            v21 = 0;
            goto LABEL_47;
          }
          v51 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v52 = *MEMORY[0x1E0D025B8];
          v93 = *MEMORY[0x1E0CB2D50];
          v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("algorithm"));
          v94 = v22;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = (id)objc_msgSend(v51, "initWithDomain:code:userInfo:", v52, 2, v12);
          v10 = 0;
          v21 = 0;
          *a4 = v53;
          goto LABEL_46;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMPortraitEntityAlgorithmFromString(v9));
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v10 = v11;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("decayRate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v9;
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v24 = self;
        v25 = v12;
        if (!a4)
        {
          v22 = 0;
          v21 = 0;
          self = v24;
          goto LABEL_46;
        }
        v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v70 = v10;
        v27 = *MEMORY[0x1E0D025B8];
        v91 = *MEMORY[0x1E0CB2D50];
        v28 = objc_alloc(MEMORY[0x1E0CB3940]);
        v61 = objc_opt_class();
        v29 = v28;
        v12 = v25;
        v77 = (id)objc_msgSend(v29, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v61, CFSTR("decayRate"));
        v92 = v77;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v27;
        v10 = v70;
        v31 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v30, 2, v13);
        v21 = 0;
        v22 = 0;
        *a4 = v31;
        goto LABEL_84;
      }
      v75 = v12;
    }
    else
    {
      v75 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("score"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v7;
    if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v77 = 0;
LABEL_23:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("osBuild"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = self;
      v66 = v6;
      if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v72 = 0;
            v21 = 0;
            v22 = v75;
            goto LABEL_44;
          }
          v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v37 = v10;
          v38 = *MEMORY[0x1E0D025B8];
          v87 = *MEMORY[0x1E0CB2D50];
          v68 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("osBuild"));
          v88 = v68;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v38;
          v10 = v37;
          v40 = (id)objc_msgSend(v36, "initWithDomain:code:userInfo:", v39, 2, v15);
          v21 = 0;
          v72 = 0;
          *a4 = v40;
          v22 = v75;
          goto LABEL_43;
        }
        v72 = v14;
      }
      else
      {
        v72 = 0;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("assetVersion"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v10;
      if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v68 = 0;
            v21 = 0;
            goto LABEL_42;
          }
          v41 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v42 = v12;
          v43 = *MEMORY[0x1E0D025B8];
          v85 = *MEMORY[0x1E0CB2D50];
          v67 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("assetVersion"));
          v86 = v67;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v43;
          v12 = v42;
          self = v76;
          v45 = (id)objc_msgSend(v41, "initWithDomain:code:userInfo:", v44, 2, v16);
          v21 = 0;
          v68 = 0;
          *a4 = v45;
LABEL_41:

          v10 = v69;
LABEL_42:
          v22 = v75;
LABEL_43:

          v6 = v66;
LABEL_44:

          v7 = v74;
LABEL_45:

          v9 = v73;
LABEL_46:

          goto LABEL_47;
        }
        v68 = v15;
      }
      else
      {
        v68 = 0;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v12;
      if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v67 = 0;
            v21 = 0;
            goto LABEL_41;
          }
          v54 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v55 = *MEMORY[0x1E0D025B8];
          v83 = *MEMORY[0x1E0CB2D50];
          v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("name"));
          v84 = v18;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = (id)objc_msgSend(v54, "initWithDomain:code:userInfo:", v55, 2, v17);
          v21 = 0;
          v67 = 0;
          *a4 = v56;
          goto LABEL_40;
        }
        v67 = v16;
      }
      else
      {
        v67 = 0;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bestLanguage"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v18 = 0;
            v21 = 0;
            goto LABEL_40;
          }
          v63 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v57 = *MEMORY[0x1E0D025B8];
          v81 = *MEMORY[0x1E0CB2D50];
          v20 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bestLanguage"));
          v82 = v20;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = (id)objc_msgSend(v63, "initWithDomain:code:userInfo:", v57, 2, v19);
          v21 = 0;
          v18 = 0;
          *a4 = v58;
          goto LABEL_39;
        }
        v18 = v17;
      }
      else
      {
        v18 = 0;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sentimentScore"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v20 = a4;
          if (a4)
          {
            v64 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v62 = *MEMORY[0x1E0D025B8];
            v79 = *MEMORY[0x1E0CB2D50];
            v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("sentimentScore"));
            v80 = v59;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            *a4 = (id)objc_msgSend(v64, "initWithDomain:code:userInfo:", v62, 2, v60);

            v20 = 0;
          }
          v21 = 0;
          goto LABEL_39;
        }
        v20 = v19;
      }
      else
      {
        v20 = 0;
      }
      v21 = -[BMPortraitEntity initWithCategory:algorithm:decayRate:score:osBuild:assetVersion:name:bestLanguage:sentimentScore:](v76, "initWithCategory:algorithm:decayRate:score:osBuild:assetVersion:name:bestLanguage:sentimentScore:", objc_msgSend(v74, "intValue"), objc_msgSend(v69, "intValue"), v75, v77, v72, v68, v67, v18, v20);
      v76 = v21;
LABEL_39:

LABEL_40:
      self = v76;
      v12 = v65;
      goto LABEL_41;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v77 = v13;
      goto LABEL_23;
    }
    v24 = self;
    if (a4)
    {
      v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v71 = v10;
      v33 = *MEMORY[0x1E0D025B8];
      v89 = *MEMORY[0x1E0CB2D50];
      v72 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("score"));
      v90 = v72;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33;
      v10 = v71;
      v35 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v34, 2, v14);
      v21 = 0;
      v77 = 0;
      *a4 = v35;
      v22 = v75;
      goto LABEL_44;
    }
    v77 = 0;
    v21 = 0;
    v22 = v75;
LABEL_84:
    self = v24;
    goto LABEL_45;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
LABEL_8:
    v7 = v8;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMPortraitEntityCategoryFromString(v6));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!a4)
  {
    v7 = 0;
    v21 = 0;
    goto LABEL_48;
  }
  v46 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v47 = *MEMORY[0x1E0D025B8];
  v95 = *MEMORY[0x1E0CB2D50];
  v48 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("category"));
  v96[0] = v48;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v96, &v95, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v47;
  v10 = (void *)v48;
  v50 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v49, 2, v9);
  v7 = 0;
  v21 = 0;
  *a4 = v50;
LABEL_47:

LABEL_48:
  return v21;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  void *v6;
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[9];
  _QWORD v37[11];

  v37[9] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPortraitEntity category](self, "category"));
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPortraitEntity algorithm](self, "algorithm"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (!-[BMPortraitEntity hasDecayRate](self, "hasDecayRate")
    || (-[BMPortraitEntity decayRate](self, "decayRate"), fabs(v5) == INFINITY))
  {
    v7 = 0;
  }
  else
  {
    -[BMPortraitEntity decayRate](self, "decayRate");
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMPortraitEntity decayRate](self, "decayRate");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  if (!-[BMPortraitEntity hasScore](self, "hasScore")
    || (-[BMPortraitEntity score](self, "score"), fabs(v8) == INFINITY))
  {
    v10 = 0;
  }
  else
  {
    -[BMPortraitEntity score](self, "score");
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[BMPortraitEntity score](self, "score");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BMPortraitEntity osBuild](self, "osBuild");
  v11 = objc_claimAutoreleasedReturnValue();
  if (-[BMPortraitEntity hasAssetVersion](self, "hasAssetVersion"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPortraitEntity assetVersion](self, "assetVersion"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = 0;
  }
  -[BMPortraitEntity name](self, "name");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPortraitEntity bestLanguage](self, "bestLanguage");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BMPortraitEntity hasSentimentScore](self, "hasSentimentScore")
    || (-[BMPortraitEntity sentimentScore](self, "sentimentScore"), fabs(v12) == INFINITY))
  {
    v14 = 0;
  }
  else
  {
    -[BMPortraitEntity sentimentScore](self, "sentimentScore");
    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[BMPortraitEntity sentimentScore](self, "sentimentScore");
    objc_msgSend(v13, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v36[0] = CFSTR("category");
  v15 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v15;
  v37[0] = v15;
  v36[1] = CFSTR("algorithm");
  v16 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v16;
  v37[1] = v16;
  v36[2] = CFSTR("decayRate");
  v17 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)v3;
  v27 = (void *)v17;
  v37[2] = v17;
  v36[3] = CFSTR("score");
  v18 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v4;
  v37[3] = v18;
  v36[4] = CFSTR("osBuild");
  v19 = (void *)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)v7;
  v37[4] = v19;
  v36[5] = CFSTR("assetVersion");
  v20 = v35;
  if (!v35)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v37[5] = v20;
  v36[6] = CFSTR("name");
  v21 = v34;
  if (!v34)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v11;
  v37[6] = v21;
  v36[7] = CFSTR("bestLanguage");
  v23 = v33;
  if (!v33)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v37[7] = v23;
  v36[8] = CFSTR("sentimentScore");
  v24 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v37[8] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 9);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)

  if (!v33)
  if (!v34)

  if (!v35)
  if (!v22)

  if (!v10)
  if (v30)
  {
    if (v31)
      goto LABEL_48;
LABEL_51:

    if (v32)
      goto LABEL_49;
LABEL_52:

    goto LABEL_49;
  }

  if (!v31)
    goto LABEL_51;
LABEL_48:
  if (!v32)
    goto LABEL_52;
LABEL_49:

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  BOOL v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  double v34;
  double v35;
  double v36;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMPortraitEntity category](self, "category");
    if (v6 != objc_msgSend(v5, "category"))
      goto LABEL_37;
    v7 = -[BMPortraitEntity algorithm](self, "algorithm");
    if (v7 != objc_msgSend(v5, "algorithm"))
      goto LABEL_37;
    if (-[BMPortraitEntity hasDecayRate](self, "hasDecayRate") || objc_msgSend(v5, "hasDecayRate"))
    {
      if (!-[BMPortraitEntity hasDecayRate](self, "hasDecayRate"))
        goto LABEL_37;
      if (!objc_msgSend(v5, "hasDecayRate"))
        goto LABEL_37;
      -[BMPortraitEntity decayRate](self, "decayRate");
      v9 = v8;
      objc_msgSend(v5, "decayRate");
      if (v9 != v10)
        goto LABEL_37;
    }
    if (-[BMPortraitEntity hasScore](self, "hasScore") || objc_msgSend(v5, "hasScore"))
    {
      if (!-[BMPortraitEntity hasScore](self, "hasScore"))
        goto LABEL_37;
      if (!objc_msgSend(v5, "hasScore"))
        goto LABEL_37;
      -[BMPortraitEntity score](self, "score");
      v12 = v11;
      objc_msgSend(v5, "score");
      if (v12 != v13)
        goto LABEL_37;
    }
    -[BMPortraitEntity osBuild](self, "osBuild");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "osBuild");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v14 == (void *)v15)
    {

    }
    else
    {
      v16 = (void *)v15;
      -[BMPortraitEntity osBuild](self, "osBuild");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "osBuild");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if (!v19)
        goto LABEL_37;
    }
    if (-[BMPortraitEntity hasAssetVersion](self, "hasAssetVersion")
      || objc_msgSend(v5, "hasAssetVersion"))
    {
      if (!-[BMPortraitEntity hasAssetVersion](self, "hasAssetVersion"))
        goto LABEL_37;
      if (!objc_msgSend(v5, "hasAssetVersion"))
        goto LABEL_37;
      v21 = -[BMPortraitEntity assetVersion](self, "assetVersion");
      if (v21 != objc_msgSend(v5, "assetVersion"))
        goto LABEL_37;
    }
    -[BMPortraitEntity name](self, "name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v22 == (void *)v23)
    {

    }
    else
    {
      v24 = (void *)v23;
      -[BMPortraitEntity name](self, "name");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v25, "isEqual:", v26);

      if (!v27)
        goto LABEL_37;
    }
    -[BMPortraitEntity bestLanguage](self, "bestLanguage");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bestLanguage");
    v29 = objc_claimAutoreleasedReturnValue();
    if (v28 == (void *)v29)
    {

    }
    else
    {
      v30 = (void *)v29;
      -[BMPortraitEntity bestLanguage](self, "bestLanguage");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bestLanguage");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v31, "isEqual:", v32);

      if (!v33)
        goto LABEL_37;
    }
    if (!-[BMPortraitEntity hasSentimentScore](self, "hasSentimentScore")
      && !objc_msgSend(v5, "hasSentimentScore"))
    {
      v20 = 1;
      goto LABEL_38;
    }
    if (-[BMPortraitEntity hasSentimentScore](self, "hasSentimentScore")
      && objc_msgSend(v5, "hasSentimentScore"))
    {
      -[BMPortraitEntity sentimentScore](self, "sentimentScore");
      v35 = v34;
      objc_msgSend(v5, "sentimentScore");
      v20 = v35 == v36;
LABEL_38:

      goto LABEL_39;
    }
LABEL_37:
    v20 = 0;
    goto LABEL_38;
  }
  v20 = 0;
LABEL_39:

  return v20;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)category
{
  return self->_category;
}

- (int)algorithm
{
  return self->_algorithm;
}

- (double)decayRate
{
  return self->_decayRate;
}

- (BOOL)hasDecayRate
{
  return self->_hasDecayRate;
}

- (void)setHasDecayRate:(BOOL)a3
{
  self->_hasDecayRate = a3;
}

- (double)score
{
  return self->_score;
}

- (BOOL)hasScore
{
  return self->_hasScore;
}

- (void)setHasScore:(BOOL)a3
{
  self->_hasScore = a3;
}

- (NSString)osBuild
{
  return self->_osBuild;
}

- (int)assetVersion
{
  return self->_assetVersion;
}

- (BOOL)hasAssetVersion
{
  return self->_hasAssetVersion;
}

- (void)setHasAssetVersion:(BOOL)a3
{
  self->_hasAssetVersion = a3;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)bestLanguage
{
  return self->_bestLanguage;
}

- (double)sentimentScore
{
  return self->_sentimentScore;
}

- (BOOL)hasSentimentScore
{
  return self->_hasSentimentScore;
}

- (void)setHasSentimentScore:(BOOL)a3
{
  self->_hasSentimentScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bestLanguage, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_osBuild, 0);
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

    v4 = -[BMPortraitEntity initByReadFrom:]([BMPortraitEntity alloc], "initByReadFrom:", v7);
    v4[5] = 0;

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
  void *v10;
  void *v11;
  _QWORD v13[10];

  v13[9] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("category"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("algorithm"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("decayRate"), 1, 0, 3, 0, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("score"), 1, 0, 4, 0, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("osBuild"), 2, 0, 5, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("assetVersion"), 0, 0, 6, 2, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("name"), 2, 0, 7, 13, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bestLanguage"), 2, 0, 8, 13, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sentimentScore"), 1, 0, 9, 0, 0);
  v13[0] = v2;
  v13[1] = v3;
  v13[2] = v4;
  v13[3] = v5;
  v13[4] = v6;
  v13[5] = v7;
  v13[6] = v8;
  v13[7] = v9;
  v13[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1C330;
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
  _QWORD v13[10];

  v13[9] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("category"), 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("algorithm"), 2, 4, 0, v2);
  v13[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("decayRate"), 3, 0, 0);
  v13[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("score"), 4, 0, 0);
  v13[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("osBuild"), 5, 13, 0);
  v13[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("assetVersion"), 6, 2, 0);
  v13[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("name"), 7, 13, 0);
  v13[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bestLanguage"), 8, 13, 0);
  v13[7] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sentimentScore"), 9, 0, 0);
  v13[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
