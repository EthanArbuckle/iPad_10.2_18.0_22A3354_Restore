@implementation BMPortraitTopic

- (BMPortraitTopic)initWithIdentifier:(id)a3 algorithm:(int)a4 decayRate:(id)a5 score:(id)a6 osBuild:(id)a7 assetVersion:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  BMPortraitTopic *v20;
  double v21;
  double v22;
  int v23;
  objc_super v25;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v25.receiver = self;
  v25.super_class = (Class)BMPortraitTopic;
  v20 = -[BMEventBase init](&v25, sel_init);
  if (v20)
  {
    v20->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v20->_identifier, a3);
    v20->_algorithm = a4;
    if (v16)
    {
      v20->_hasDecayRate = 1;
      objc_msgSend(v16, "doubleValue");
    }
    else
    {
      v20->_hasDecayRate = 0;
      v21 = -1.0;
    }
    v20->_decayRate = v21;
    if (v17)
    {
      v20->_hasScore = 1;
      objc_msgSend(v17, "doubleValue");
    }
    else
    {
      v20->_hasScore = 0;
      v22 = -1.0;
    }
    v20->_score = v22;
    objc_storeStrong((id *)&v20->_osBuild, a7);
    if (v19)
    {
      v20->_hasAssetVersion = 1;
      v23 = objc_msgSend(v19, "intValue");
    }
    else
    {
      v20->_hasAssetVersion = 0;
      v23 = -1;
    }
    v20->_assetVersion = v23;
  }

  return v20;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMPortraitTopic identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMPortraitTopicAlgorithmAsString(-[BMPortraitTopic algorithm](self, "algorithm"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[BMPortraitTopic decayRate](self, "decayRate");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[BMPortraitTopic score](self, "score");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPortraitTopic osBuild](self, "osBuild");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPortraitTopic assetVersion](self, "assetVersion"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMPortraitTopic with identifier: %@, algorithm: %@, decayRate: %@, score: %@, osBuild: %@, assetVersion: %@"), v4, v5, v7, v9, v10, v11);

  return (NSString *)v12;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMPortraitTopic *v5;
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
  uint64_t v20;
  uint64_t v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  unint64_t v30;
  objc_class *v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  uint64_t v42;
  BMPortraitTopic *v43;
  objc_super v45;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)BMPortraitTopic;
  v5 = -[BMEventBase init](&v45, sel_init);
  if (!v5)
    goto LABEL_63;
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
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 32;
          goto LABEL_37;
        case 2u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          while (2)
          {
            v25 = *v6;
            v26 = *(_QWORD *)&v4[v25];
            v27 = v26 + 1;
            if (v26 == -1 || v27 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v28 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v26);
              *(_QWORD *)&v4[v25] = v27;
              v24 |= (unint64_t)(v28 & 0x7F) << v22;
              if (v28 < 0)
              {
                v22 += 7;
                v17 = v23++ >= 9;
                if (v17)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_48;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_48:
          if (v24 >= 0xC)
            LODWORD(v24) = 0;
          v5->_algorithm = v24;
          continue;
        case 3u:
          v5->_hasDecayRate = 1;
          v29 = *v6;
          v30 = *(_QWORD *)&v4[v29];
          if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v30);
            *(_QWORD *)&v4[v29] = v30 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v42 = 40;
          goto LABEL_59;
        case 4u:
          v5->_hasScore = 1;
          v32 = *v6;
          v33 = *(_QWORD *)&v4[v32];
          if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v31 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v33);
            *(_QWORD *)&v4[v32] = v33 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v31 = 0;
          }
          v42 = 48;
LABEL_59:
          *(Class *)((char *)&v5->super.super.isa + v42) = v31;
          continue;
        case 5u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 56;
LABEL_37:
          v34 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 6u:
          v35 = 0;
          v36 = 0;
          v37 = 0;
          v5->_hasAssetVersion = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_62;
          continue;
      }
      while (1)
      {
        v38 = *v6;
        v39 = *(_QWORD *)&v4[v38];
        v40 = v39 + 1;
        if (v39 == -1 || v40 > *(_QWORD *)&v4[*v7])
          break;
        v41 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v39);
        *(_QWORD *)&v4[v38] = v40;
        v37 |= (unint64_t)(v41 & 0x7F) << v35;
        if ((v41 & 0x80) == 0)
          goto LABEL_52;
        v35 += 7;
        v17 = v36++ >= 9;
        if (v17)
        {
          LODWORD(v37) = 0;
          goto LABEL_54;
        }
      }
      v4[*v8] = 1;
LABEL_52:
      if (v4[*v8])
        LODWORD(v37) = 0;
LABEL_54:
      v5->_assetVersion = v37;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_62:
    v43 = 0;
  else
LABEL_63:
    v43 = v5;

  return v43;
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (self->_identifier)
    PBDataWriterWriteStringField();
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

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMPortraitTopic writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMPortraitTopic)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BMPortraitTopic *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  BMPortraitTopic *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  _QWORD v61[3];

  v61[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("algorithm"));
    v9 = objc_claimAutoreleasedReturnValue();
    v46 = (void *)v9;
    if (v9 && (v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v45 = v10;
      }
      else
      {
        v24 = a4;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v18 = 0;
            v19 = 0;
            goto LABEL_50;
          }
          v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v39 = v8;
          v40 = *MEMORY[0x1E0D025B8];
          v58 = *MEMORY[0x1E0CB2D50];
          v49 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("algorithm"));
          v59 = v49;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v40;
          v8 = v39;
          v18 = 0;
          v19 = 0;
          *v24 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v41, 2, v11);
          goto LABEL_49;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMPortraitTopicAlgorithmFromString(v10));
        v45 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v45 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("decayRate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v7;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v49 = 0;
          v19 = 0;
          v18 = v45;
          goto LABEL_49;
        }
        v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v26 = v8;
        v27 = *MEMORY[0x1E0D025B8];
        v56 = *MEMORY[0x1E0CB2D50];
        v48 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("decayRate"));
        v57 = v48;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        v8 = v26;
        v19 = 0;
        v49 = 0;
        *a4 = (id)objc_msgSend(v25, "initWithDomain:code:userInfo:", v28, 2, v12);
        goto LABEL_57;
      }
      v49 = v11;
    }
    else
    {
      v49 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("score"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v8;
    if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v48 = 0;
      goto LABEL_13;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v48 = v12;
LABEL_13:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("osBuild"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v14 = self;
        v15 = 0;
        goto LABEL_16;
      }
      objc_opt_class();
      v14 = self;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = v13;
LABEL_16:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("assetVersion"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v17 = 0;
LABEL_19:
          v18 = v45;
          v19 = -[BMPortraitTopic initWithIdentifier:algorithm:decayRate:score:osBuild:assetVersion:](v14, "initWithIdentifier:algorithm:decayRate:score:osBuild:assetVersion:", v47, objc_msgSend(v45, "intValue"), v49, v48, v15, v17);
          v14 = v19;
LABEL_46:

LABEL_47:
          self = v14;
          v8 = v47;
LABEL_48:

          v7 = v44;
LABEL_49:

          v10 = v46;
          goto LABEL_50;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v17 = v16;
          goto LABEL_19;
        }
        if (a4)
        {
          v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v42 = *MEMORY[0x1E0D025B8];
          v50 = *MEMORY[0x1E0CB2D50];
          v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("assetVersion"));
          v51 = v35;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *a4 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v42, 2, v36);

        }
        v17 = 0;
        v19 = 0;
LABEL_45:
        v18 = v45;
        goto LABEL_46;
      }
      if (a4)
      {
        v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v33 = *MEMORY[0x1E0D025B8];
        v52 = *MEMORY[0x1E0CB2D50];
        v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("osBuild"));
        v53 = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v33, 2, v16);
        v19 = 0;
        v15 = 0;
        *a4 = v34;
        goto LABEL_45;
      }
      v15 = 0;
      v19 = 0;
LABEL_59:
      v18 = v45;
      goto LABEL_47;
    }
    if (a4)
    {
      v14 = self;
      v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v30 = *MEMORY[0x1E0D025B8];
      v54 = *MEMORY[0x1E0CB2D50];
      v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("score"));
      v55 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v30, 2, v13);
      v19 = 0;
      v48 = 0;
      *a4 = v31;
      goto LABEL_59;
    }
    v48 = 0;
    v19 = 0;
LABEL_57:
    v18 = v45;
    goto LABEL_48;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v8 = 0;
    v19 = 0;
    goto LABEL_51;
  }
  v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v21 = *MEMORY[0x1E0D025B8];
  v60 = *MEMORY[0x1E0CB2D50];
  v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("identifier"));
  v61[0] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, &v60, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", v21, 2, v10);
  v8 = 0;
  v19 = 0;
  *a4 = v23;
  v18 = (void *)v22;
LABEL_50:

LABEL_51:
  return v19;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[6];
  _QWORD v26[7];

  v26[6] = *MEMORY[0x1E0C80C00];
  -[BMPortraitTopic identifier](self, "identifier");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPortraitTopic algorithm](self, "algorithm"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (!-[BMPortraitTopic hasDecayRate](self, "hasDecayRate")
    || (-[BMPortraitTopic decayRate](self, "decayRate"), fabs(v5) == INFINITY))
  {
    v7 = 0;
  }
  else
  {
    -[BMPortraitTopic decayRate](self, "decayRate");
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMPortraitTopic decayRate](self, "decayRate");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!-[BMPortraitTopic hasScore](self, "hasScore") || (-[BMPortraitTopic score](self, "score"), fabs(v8) == INFINITY))
  {
    v10 = 0;
  }
  else
  {
    -[BMPortraitTopic score](self, "score");
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[BMPortraitTopic score](self, "score");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BMPortraitTopic osBuild](self, "osBuild");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMPortraitTopic hasAssetVersion](self, "hasAssetVersion"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMPortraitTopic assetVersion](self, "assetVersion"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  v24 = (void *)v3;
  v25[0] = CFSTR("identifier");
  v13 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v21 = v13;
  v23 = (void *)v4;
  v26[0] = v13;
  v25[1] = CFSTR("algorithm");
  v14 = (void *)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[1] = v14;
  v25[2] = CFSTR("decayRate");
  v15 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[2] = v15;
  v25[3] = CFSTR("score");
  v16 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[3] = v16;
  v25[4] = CFSTR("osBuild");
  v17 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[4] = v17;
  v25[5] = CFSTR("assetVersion");
  v18 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[5] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 6, v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (v11)
      goto LABEL_26;
  }
  else
  {

    if (v11)
    {
LABEL_26:
      if (v10)
        goto LABEL_27;
LABEL_35:

      if (v7)
        goto LABEL_28;
      goto LABEL_36;
    }
  }

  if (!v10)
    goto LABEL_35;
LABEL_27:
  if (v7)
    goto LABEL_28;
LABEL_36:

LABEL_28:
  if (!v23)

  if (!v24)
  return v19;
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
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  int v26;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMPortraitTopic identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMPortraitTopic identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_27;
    }
    v13 = -[BMPortraitTopic algorithm](self, "algorithm");
    if (v13 != objc_msgSend(v5, "algorithm"))
      goto LABEL_27;
    if (-[BMPortraitTopic hasDecayRate](self, "hasDecayRate") || objc_msgSend(v5, "hasDecayRate"))
    {
      if (!-[BMPortraitTopic hasDecayRate](self, "hasDecayRate"))
        goto LABEL_27;
      if (!objc_msgSend(v5, "hasDecayRate"))
        goto LABEL_27;
      -[BMPortraitTopic decayRate](self, "decayRate");
      v15 = v14;
      objc_msgSend(v5, "decayRate");
      if (v15 != v16)
        goto LABEL_27;
    }
    if (-[BMPortraitTopic hasScore](self, "hasScore") || objc_msgSend(v5, "hasScore"))
    {
      if (!-[BMPortraitTopic hasScore](self, "hasScore"))
        goto LABEL_27;
      if (!objc_msgSend(v5, "hasScore"))
        goto LABEL_27;
      -[BMPortraitTopic score](self, "score");
      v18 = v17;
      objc_msgSend(v5, "score");
      if (v18 != v19)
        goto LABEL_27;
    }
    -[BMPortraitTopic osBuild](self, "osBuild");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "osBuild");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v20 == (void *)v21)
    {

    }
    else
    {
      v22 = (void *)v21;
      -[BMPortraitTopic osBuild](self, "osBuild");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "osBuild");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqual:", v24);

      if (!v25)
        goto LABEL_27;
    }
    if (!-[BMPortraitTopic hasAssetVersion](self, "hasAssetVersion")
      && !objc_msgSend(v5, "hasAssetVersion"))
    {
      v12 = 1;
      goto LABEL_28;
    }
    if (-[BMPortraitTopic hasAssetVersion](self, "hasAssetVersion")
      && objc_msgSend(v5, "hasAssetVersion"))
    {
      v26 = -[BMPortraitTopic assetVersion](self, "assetVersion");
      v12 = v26 == objc_msgSend(v5, "assetVersion");
LABEL_28:

      goto LABEL_29;
    }
LABEL_27:
    v12 = 0;
    goto LABEL_28;
  }
  v12 = 0;
LABEL_29:

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osBuild, 0);
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

    v4 = -[BMPortraitTopic initByReadFrom:]([BMPortraitTopic alloc], "initByReadFrom:", v7);
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
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("identifier"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("algorithm"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("decayRate"), 1, 0, 3, 0, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("score"), 1, 0, 4, 0, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("osBuild"), 2, 0, 5, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("assetVersion"), 0, 0, 6, 2, 0);
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1A560;
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
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("identifier"), 1, 13, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("algorithm"), 2, 4, 0);
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("decayRate"), 3, 0, 0);
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("score"), 4, 0, 0);
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("osBuild"), 5, 13, 0);
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("assetVersion"), 6, 2, 0);
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
