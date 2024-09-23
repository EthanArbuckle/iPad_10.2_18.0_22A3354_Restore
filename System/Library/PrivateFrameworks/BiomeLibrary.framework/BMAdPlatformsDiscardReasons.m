@implementation BMAdPlatformsDiscardReasons

- (BMAdPlatformsDiscardReasons)initWithDiscardReason:(int)a3 placement:(int)a4 bundleID:(id)a5 brandIdentifier:(id)a6 displayOrder:(id)a7 searchTerms:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  BMAdPlatformsDiscardReasons *v19;
  uint64_t v20;
  int v21;
  objc_super v23;

  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v23.receiver = self;
  v23.super_class = (Class)BMAdPlatformsDiscardReasons;
  v19 = -[BMEventBase init](&v23, sel_init);
  if (v19)
  {
    v19->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v19->_discardReason = a3;
    v19->_placement = a4;
    objc_storeStrong((id *)&v19->_bundleID, a5);
    if (v16)
    {
      v19->_hasBrandIdentifier = 1;
      v20 = objc_msgSend(v16, "unsignedLongLongValue");
    }
    else
    {
      v20 = 0;
      v19->_hasBrandIdentifier = 0;
    }
    v19->_brandIdentifier = v20;
    if (v17)
    {
      v19->_hasDisplayOrder = 1;
      v21 = objc_msgSend(v17, "intValue");
    }
    else
    {
      v19->_hasDisplayOrder = 0;
      v21 = -1;
    }
    v19->_displayOrder = v21;
    objc_storeStrong((id *)&v19->_searchTerms, a8);
  }

  return v19;
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

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  BMAdPlatformsDiscardReasonsDiscardReasonAsString(-[BMAdPlatformsDiscardReasons discardReason](self, "discardReason"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMAdPlatformsDiscardReasonsPlacementAsString(-[BMAdPlatformsDiscardReasons placement](self, "placement"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAdPlatformsDiscardReasons bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BMAdPlatformsDiscardReasons brandIdentifier](self, "brandIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMAdPlatformsDiscardReasons displayOrder](self, "displayOrder"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAdPlatformsDiscardReasons searchTerms](self, "searchTerms");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMAdPlatformsDiscardReasons with discardReason: %@, placement: %@, bundleID: %@, brandIdentifier: %@, displayOrder: %@, searchTerms: %@"), v4, v5, v6, v7, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMAdPlatformsDiscardReasons *v5;
  int *v6;
  int *v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  BOOL v16;
  int v17;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  unsigned int v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  char v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  void *v47;
  BMAdPlatformsDiscardReasons *v49;
  objc_super v51;

  v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)BMAdPlatformsDiscardReasons;
  v5 = -[BMEventBase init](&v51, sel_init);
  if (!v5)
    goto LABEL_78;
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
        if (v14 == -1 || v14 >= *(_QWORD *)&v4[*v7])
          break;
        v15 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v14);
        *(_QWORD *)&v4[v13] = v14 + 1;
        v12 |= (unint64_t)(v15 & 0x7F) << v10;
        if ((v15 & 0x80) == 0)
          goto LABEL_13;
        v10 += 7;
        v16 = v11++ >= 9;
        if (v16)
        {
          v12 = 0;
          v17 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      v17 = v4[*v8];
      if (v4[*v8])
        v12 = 0;
LABEL_15:
      if (v17 || (v12 & 7) == 4)
        break;
      switch((v12 >> 3))
      {
        case 1u:
          v19 = 0;
          v20 = 0;
          v21 = 0;
          while (1)
          {
            v22 = *v6;
            v23 = *(_QWORD *)&v4[v22];
            if (v23 == -1 || v23 >= *(_QWORD *)&v4[*v7])
              break;
            v24 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v23);
            *(_QWORD *)&v4[v22] = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if ((v24 & 0x80) == 0)
              goto LABEL_54;
            v19 += 7;
            if (v20++ > 8)
              goto LABEL_60;
          }
          v4[*v8] = 1;
LABEL_54:
          if (v4[*v8])
            LODWORD(v21) = 0;
          if ((v21 - 2700) >= 2 && (_DWORD)v21 != 0)
LABEL_60:
            LODWORD(v21) = 0;
          v5->_discardReason = v21;
          continue;
        case 2u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          while (2)
          {
            v29 = *v6;
            v30 = *(_QWORD *)&v4[v29];
            if (v30 == -1 || v30 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v30);
              *(_QWORD *)&v4[v29] = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                v16 = v27++ >= 9;
                if (v16)
                {
                  v32 = 0;
                  goto LABEL_66;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v32 = 0;
          else
            v32 = v28;
LABEL_66:
          v5->_placement = BMAdPlatformsDiscardReasonsPlacementDecode(v32);
          continue;
        case 3u:
          PBReaderReadString();
          v33 = objc_claimAutoreleasedReturnValue();
          v34 = 40;
          goto LABEL_52;
        case 4u:
          v35 = 0;
          v36 = 0;
          v37 = 0;
          v5->_hasBrandIdentifier = 1;
          while (2)
          {
            v38 = *v6;
            v39 = *(_QWORD *)&v4[v38];
            if (v39 == -1 || v39 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v40 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v39);
              *(_QWORD *)&v4[v38] = v39 + 1;
              v37 |= (unint64_t)(v40 & 0x7F) << v35;
              if (v40 < 0)
              {
                v35 += 7;
                v16 = v36++ >= 9;
                if (v16)
                {
                  v37 = 0;
                  goto LABEL_70;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v37 = 0;
LABEL_70:
          v5->_brandIdentifier = v37;
          continue;
        case 5u:
          v41 = 0;
          v42 = 0;
          v43 = 0;
          v5->_hasDisplayOrder = 1;
          break;
        case 6u:
          PBReaderReadString();
          v33 = objc_claimAutoreleasedReturnValue();
          v34 = 56;
LABEL_52:
          v47 = *(Class *)((char *)&v5->super.super.isa + v34);
          *(Class *)((char *)&v5->super.super.isa + v34) = (Class)v33;

          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_77;
          continue;
      }
      while (1)
      {
        v44 = *v6;
        v45 = *(_QWORD *)&v4[v44];
        if (v45 == -1 || v45 >= *(_QWORD *)&v4[*v7])
          break;
        v46 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v45);
        *(_QWORD *)&v4[v44] = v45 + 1;
        v43 |= (unint64_t)(v46 & 0x7F) << v41;
        if ((v46 & 0x80) == 0)
          goto LABEL_72;
        v41 += 7;
        v16 = v42++ >= 9;
        if (v16)
        {
          LODWORD(v43) = 0;
          goto LABEL_74;
        }
      }
      v4[*v8] = 1;
LABEL_72:
      if (v4[*v8])
        LODWORD(v43) = 0;
LABEL_74:
      v5->_displayOrder = v43;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_77:
    v49 = 0;
  else
LABEL_78:
    v49 = v5;

  return v49;
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_bundleID)
    PBDataWriterWriteStringField();
  if (self->_hasBrandIdentifier)
    PBDataWriterWriteUint64Field();
  v4 = v5;
  if (self->_hasDisplayOrder)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_searchTerms)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMAdPlatformsDiscardReasons writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMAdPlatformsDiscardReasons)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id *v14;
  void *v15;
  BMAdPlatformsDiscardReasons *v16;
  id v17;
  void *v18;
  id v19;
  BMAdPlatformsDiscardReasons *v20;
  id v22;
  id *v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  id *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  id *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  _QWORD v60[3];

  v60[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("discardReason"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v48 = 0;
LABEL_9:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("placement"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v47 = 0;
            v20 = 0;
            goto LABEL_34;
          }
          v37 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v46 = a4;
          v38 = *MEMORY[0x1E0D025B8];
          v57 = *MEMORY[0x1E0CB2D50];
          v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("placement"));
          v58 = v12;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = 0;
          v20 = 0;
          *v46 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", v38, 2, v11);
          goto LABEL_33;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMAdPlatformsDiscardReasonsPlacementFromString(v9));
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      v47 = v10;
    }
    else
    {
      v47 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v9;
    v44 = v7;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v12 = 0;
          v20 = 0;
          goto LABEL_33;
        }
        v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v23 = a4;
        v24 = *MEMORY[0x1E0D025B8];
        v55 = *MEMORY[0x1E0CB2D50];
        v45 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bundleID"));
        v56 = v45;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0;
        v12 = 0;
        *v23 = (id)objc_msgSend(v22, "initWithDomain:code:userInfo:", v24, 2, v13);
        v9 = v43;
LABEL_32:

        v7 = v44;
LABEL_33:

        goto LABEL_34;
      }
      v12 = v11;
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("brandIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v45 = 0;
          v20 = 0;
          goto LABEL_32;
        }
        v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v26 = v12;
        v27 = *MEMORY[0x1E0D025B8];
        v53 = *MEMORY[0x1E0CB2D50];
        v28 = a4;
        v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("brandIdentifier"));
        v54 = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v27;
        v12 = v26;
        v20 = 0;
        v45 = 0;
        *v28 = (id)objc_msgSend(v25, "initWithDomain:code:userInfo:", v29, 2, v15);
        goto LABEL_60;
      }
      v14 = a4;
      v45 = v13;
    }
    else
    {
      v14 = a4;
      v45 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("displayOrder"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v12;
    if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v16 = self;
      v17 = 0;
      goto LABEL_26;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = self;
      v17 = v15;
LABEL_26:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("searchTerms"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v14)
          {
            v41 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v39 = *MEMORY[0x1E0D025B8];
            v49 = *MEMORY[0x1E0CB2D50];
            v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("searchTerms"));
            v50 = v32;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *v14 = (id)objc_msgSend(v41, "initWithDomain:code:userInfo:", v39, 2, v33);

          }
          v19 = 0;
          v20 = 0;
          goto LABEL_30;
        }
        v19 = v18;
      }
      else
      {
        v19 = 0;
      }
      v20 = -[BMAdPlatformsDiscardReasons initWithDiscardReason:placement:bundleID:brandIdentifier:displayOrder:searchTerms:](v16, "initWithDiscardReason:placement:bundleID:brandIdentifier:displayOrder:searchTerms:", objc_msgSend(v48, "intValue"), objc_msgSend(v47, "intValue"), v42, v45, v17, v19);
      v16 = v20;
LABEL_30:
      v9 = v43;

      self = v16;
      v12 = v42;
LABEL_31:

      goto LABEL_32;
    }
    if (v14)
    {
      v16 = self;
      v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v30 = *MEMORY[0x1E0D025B8];
      v51 = *MEMORY[0x1E0CB2D50];
      v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("displayOrder"));
      v52 = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (id)objc_msgSend(v40, "initWithDomain:code:userInfo:", v30, 2, v18);
      v20 = 0;
      v17 = 0;
      *v14 = v31;
      goto LABEL_30;
    }
    v17 = 0;
    v20 = 0;
LABEL_60:
    v9 = v43;
    goto LABEL_31;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
LABEL_8:
    v48 = v8;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMAdPlatformsDiscardReasonsDiscardReasonFromString(v7));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!a4)
  {
    v48 = 0;
    v20 = 0;
    goto LABEL_35;
  }
  v34 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v35 = a4;
  v36 = *MEMORY[0x1E0D025B8];
  v59 = *MEMORY[0x1E0CB2D50];
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("discardReason"));
  v60[0] = v47;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, &v59, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  v20 = 0;
  *v35 = (id)objc_msgSend(v34, "initWithDomain:code:userInfo:", v36, 2, v9);
LABEL_34:

LABEL_35:
  return v20;
}

- (id)jsonDictionary
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[6];
  _QWORD v22[7];

  v22[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMAdPlatformsDiscardReasons discardReason](self, "discardReason"));
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMAdPlatformsDiscardReasons placement](self, "placement"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAdPlatformsDiscardReasons bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMAdPlatformsDiscardReasons hasBrandIdentifier](self, "hasBrandIdentifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BMAdPlatformsDiscardReasons brandIdentifier](self, "brandIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (-[BMAdPlatformsDiscardReasons hasDisplayOrder](self, "hasDisplayOrder"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMAdPlatformsDiscardReasons displayOrder](self, "displayOrder"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  -[BMAdPlatformsDiscardReasons searchTerms](self, "searchTerms");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = CFSTR("discardReason");
  v9 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v9;
  v20 = (void *)v3;
  v22[0] = v9;
  v21[1] = CFSTR("placement");
  v10 = (uint64_t)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v17 = v10;
  v22[1] = v10;
  v21[2] = CFSTR("bundleID");
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v10, v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[2] = v11;
  v21[3] = CFSTR("brandIdentifier");
  v12 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v12;
  v21[4] = CFSTR("displayOrder");
  v13 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[4] = v13;
  v21[5] = CFSTR("searchTerms");
  v14 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[5] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 6, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v7)
      goto LABEL_21;
  }
  else
  {

    if (v7)
    {
LABEL_21:
      if (v6)
        goto LABEL_22;
      goto LABEL_29;
    }
  }

  if (v6)
  {
LABEL_22:
    if (v5)
      goto LABEL_23;
LABEL_30:

    if (v4)
      goto LABEL_24;
    goto LABEL_31;
  }
LABEL_29:

  if (!v5)
    goto LABEL_30;
LABEL_23:
  if (v4)
    goto LABEL_24;
LABEL_31:

LABEL_24:
  if (!v20)

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  char v14;
  unint64_t v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMAdPlatformsDiscardReasons discardReason](self, "discardReason");
    if (v6 != objc_msgSend(v5, "discardReason"))
      goto LABEL_21;
    v7 = -[BMAdPlatformsDiscardReasons placement](self, "placement");
    if (v7 != objc_msgSend(v5, "placement"))
      goto LABEL_21;
    -[BMAdPlatformsDiscardReasons bundleID](self, "bundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleID");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v8 == (void *)v9)
    {

    }
    else
    {
      v10 = (void *)v9;
      -[BMAdPlatformsDiscardReasons bundleID](self, "bundleID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if (!v13)
        goto LABEL_21;
    }
    if (!-[BMAdPlatformsDiscardReasons hasBrandIdentifier](self, "hasBrandIdentifier")
      && !objc_msgSend(v5, "hasBrandIdentifier")
      || -[BMAdPlatformsDiscardReasons hasBrandIdentifier](self, "hasBrandIdentifier")
      && objc_msgSend(v5, "hasBrandIdentifier")
      && (v15 = -[BMAdPlatformsDiscardReasons brandIdentifier](self, "brandIdentifier"),
          v15 == objc_msgSend(v5, "brandIdentifier")))
    {
      if (!-[BMAdPlatformsDiscardReasons hasDisplayOrder](self, "hasDisplayOrder")
        && !objc_msgSend(v5, "hasDisplayOrder")
        || -[BMAdPlatformsDiscardReasons hasDisplayOrder](self, "hasDisplayOrder")
        && objc_msgSend(v5, "hasDisplayOrder")
        && (v16 = -[BMAdPlatformsDiscardReasons displayOrder](self, "displayOrder"),
            v16 == objc_msgSend(v5, "displayOrder")))
      {
        -[BMAdPlatformsDiscardReasons searchTerms](self, "searchTerms");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "searchTerms");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17 == v18)
        {
          v14 = 1;
        }
        else
        {
          -[BMAdPlatformsDiscardReasons searchTerms](self, "searchTerms");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "searchTerms");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v19, "isEqual:", v20);

        }
        goto LABEL_22;
      }
    }
LABEL_21:
    v14 = 0;
LABEL_22:

    goto LABEL_23;
  }
  v14 = 0;
LABEL_23:

  return v14;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)discardReason
{
  return self->_discardReason;
}

- (int)placement
{
  return self->_placement;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (unint64_t)brandIdentifier
{
  return self->_brandIdentifier;
}

- (BOOL)hasBrandIdentifier
{
  return self->_hasBrandIdentifier;
}

- (void)setHasBrandIdentifier:(BOOL)a3
{
  self->_hasBrandIdentifier = a3;
}

- (int)displayOrder
{
  return self->_displayOrder;
}

- (BOOL)hasDisplayOrder
{
  return self->_hasDisplayOrder;
}

- (void)setHasDisplayOrder:(BOOL)a3
{
  self->_hasDisplayOrder = a3;
}

- (NSString)searchTerms
{
  return self->_searchTerms;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTerms, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
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

    v4 = -[BMAdPlatformsDiscardReasons initByReadFrom:]([BMAdPlatformsDiscardReasons alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("discardReason"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("placement"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleID"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("brandIdentifier"), 0, 0, 4, 5, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("displayOrder"), 0, 0, 5, 2, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("searchTerms"), 2, 0, 6, 13, 0);
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
  return &unk_1E5F1AF68;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("discardReason"), 1, 4, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("placement"), 2, 4, 0);
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleID"), 3, 13, 0);
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("brandIdentifier"), 4, 5, 0);
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("displayOrder"), 5, 2, 0);
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("searchTerms"), 6, 13, 0);
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
