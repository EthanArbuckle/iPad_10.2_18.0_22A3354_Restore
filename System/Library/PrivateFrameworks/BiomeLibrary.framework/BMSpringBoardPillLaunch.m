@implementation BMSpringBoardPillLaunch

- (BMSpringBoardPillLaunch)initWithChildAccount:(id)a3 firstUpdate:(id)a4 firstUpdateAnyGesture:(id)a5 gesture:(id)a6 pillClicked:(id)a7 totalTimesShown:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  BMSpringBoardPillLaunch *v20;
  unsigned int v21;
  objc_super v23;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v23.receiver = self;
  v23.super_class = (Class)BMSpringBoardPillLaunch;
  v20 = -[BMEventBase init](&v23, sel_init);
  if (v20)
  {
    v20->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v14)
    {
      v20->_hasChildAccount = 1;
      v20->_childAccount = objc_msgSend(v14, "BOOLValue");
    }
    else
    {
      v20->_hasChildAccount = 0;
      v20->_childAccount = 0;
    }
    if (v15)
    {
      v20->_hasFirstUpdate = 1;
      v20->_firstUpdate = objc_msgSend(v15, "BOOLValue");
    }
    else
    {
      v20->_hasFirstUpdate = 0;
      v20->_firstUpdate = 0;
    }
    if (v16)
    {
      v20->_hasFirstUpdateAnyGesture = 1;
      v20->_firstUpdateAnyGesture = objc_msgSend(v16, "BOOLValue");
    }
    else
    {
      v20->_hasFirstUpdateAnyGesture = 0;
      v20->_firstUpdateAnyGesture = 0;
    }
    objc_storeStrong((id *)&v20->_gesture, a6);
    if (v18)
    {
      v20->_hasPillClicked = 1;
      v20->_pillClicked = objc_msgSend(v18, "BOOLValue");
    }
    else
    {
      v20->_hasPillClicked = 0;
      v20->_pillClicked = 0;
    }
    if (v19)
    {
      v20->_hasTotalTimesShown = 1;
      v21 = objc_msgSend(v19, "unsignedIntValue");
    }
    else
    {
      v21 = 0;
      v20->_hasTotalTimesShown = 0;
    }
    v20->_totalTimesShown = v21;
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

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSpringBoardPillLaunch childAccount](self, "childAccount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSpringBoardPillLaunch firstUpdate](self, "firstUpdate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSpringBoardPillLaunch firstUpdateAnyGesture](self, "firstUpdateAnyGesture"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSpringBoardPillLaunch gesture](self, "gesture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSpringBoardPillLaunch pillClicked](self, "pillClicked"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSpringBoardPillLaunch totalTimesShown](self, "totalTimesShown"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSpringBoardPillLaunch with childAccount: %@, firstUpdate: %@, firstUpdateAnyGesture: %@, gesture: %@, pillClicked: %@, totalTimesShown: %@"), v4, v5, v6, v7, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSpringBoardPillLaunch *v5;
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
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  uint64_t v37;
  NSString *gesture;
  char v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  char v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  BOOL v51;
  uint64_t v52;
  BMSpringBoardPillLaunch *v53;
  objc_super v55;

  v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)BMSpringBoardPillLaunch;
  v5 = -[BMEventBase init](&v55, sel_init);
  if (!v5)
    goto LABEL_82;
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
          v5->_hasChildAccount = 1;
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
              goto LABEL_59;
            v19 += 7;
            v16 = v20++ >= 9;
            if (v16)
            {
              v21 = 0;
              goto LABEL_61;
            }
          }
          v4[*v8] = 1;
LABEL_59:
          if (v4[*v8])
            v21 = 0;
LABEL_61:
          v51 = v21 != 0;
          v52 = 16;
          goto LABEL_74;
        case 2u:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          v5->_hasFirstUpdate = 1;
          while (2)
          {
            v28 = *v6;
            v29 = *(_QWORD *)&v4[v28];
            if (v29 == -1 || v29 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v29);
              *(_QWORD *)&v4[v28] = v29 + 1;
              v27 |= (unint64_t)(v30 & 0x7F) << v25;
              if (v30 < 0)
              {
                v25 += 7;
                v16 = v26++ >= 9;
                if (v16)
                {
                  v27 = 0;
                  goto LABEL_65;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v27 = 0;
LABEL_65:
          v51 = v27 != 0;
          v52 = 18;
          goto LABEL_74;
        case 3u:
          v31 = 0;
          v32 = 0;
          v33 = 0;
          v5->_hasFirstUpdateAnyGesture = 1;
          while (2)
          {
            v34 = *v6;
            v35 = *(_QWORD *)&v4[v34];
            if (v35 == -1 || v35 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v36 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v35);
              *(_QWORD *)&v4[v34] = v35 + 1;
              v33 |= (unint64_t)(v36 & 0x7F) << v31;
              if (v36 < 0)
              {
                v31 += 7;
                v16 = v32++ >= 9;
                if (v16)
                {
                  v33 = 0;
                  goto LABEL_69;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v33 = 0;
LABEL_69:
          v51 = v33 != 0;
          v52 = 20;
          goto LABEL_74;
        case 4u:
          PBReaderReadString();
          v37 = objc_claimAutoreleasedReturnValue();
          gesture = v5->_gesture;
          v5->_gesture = (NSString *)v37;

          continue;
        case 5u:
          v39 = 0;
          v40 = 0;
          v41 = 0;
          v5->_hasPillClicked = 1;
          while (2)
          {
            v42 = *v6;
            v43 = *(_QWORD *)&v4[v42];
            if (v43 == -1 || v43 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v44 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v43);
              *(_QWORD *)&v4[v42] = v43 + 1;
              v41 |= (unint64_t)(v44 & 0x7F) << v39;
              if (v44 < 0)
              {
                v39 += 7;
                v16 = v40++ >= 9;
                if (v16)
                {
                  v41 = 0;
                  goto LABEL_73;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v41 = 0;
LABEL_73:
          v51 = v41 != 0;
          v52 = 22;
LABEL_74:
          *((_BYTE *)&v5->super.super.isa + v52) = v51;
          continue;
        case 6u:
          v45 = 0;
          v46 = 0;
          v47 = 0;
          v5->_hasTotalTimesShown = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_81;
          continue;
      }
      while (1)
      {
        v48 = *v6;
        v49 = *(_QWORD *)&v4[v48];
        if (v49 == -1 || v49 >= *(_QWORD *)&v4[*v7])
          break;
        v50 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v49);
        *(_QWORD *)&v4[v48] = v49 + 1;
        v47 |= (unint64_t)(v50 & 0x7F) << v45;
        if ((v50 & 0x80) == 0)
          goto LABEL_76;
        v45 += 7;
        v16 = v46++ >= 9;
        if (v16)
        {
          LODWORD(v47) = 0;
          goto LABEL_78;
        }
      }
      v4[*v8] = 1;
LABEL_76:
      if (v4[*v8])
        LODWORD(v47) = 0;
LABEL_78:
      v5->_totalTimesShown = v47;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_81:
    v53 = 0;
  else
LABEL_82:
    v53 = v5;

  return v53;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasChildAccount)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasFirstUpdate)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasFirstUpdateAnyGesture)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_gesture)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasPillClicked)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasTotalTimesShown)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSpringBoardPillLaunch writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSpringBoardPillLaunch)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  BMSpringBoardPillLaunch *v17;
  id v18;
  id *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id *v28;
  uint64_t v29;
  id v30;
  id *v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id *v52;
  id *v53;
  id v54;
  void *v55;
  id *v56;
  void *v57;
  id v58;
  id v59;
  BMSpringBoardPillLaunch *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  id *v70;
  uint64_t v71;
  _QWORD v72[3];

  v72[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("childAccount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("firstUpdate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v21 = 0;
          v17 = 0;
          goto LABEL_50;
        }
        v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v52 = a4;
        v23 = *MEMORY[0x1E0D025B8];
        v69 = *MEMORY[0x1E0CB2D50];
        v24 = v7;
        v25 = v8;
        v26 = objc_alloc(MEMORY[0x1E0CB3940]);
        v49 = objc_opt_class();
        v27 = v26;
        v8 = v25;
        v7 = v24;
        v28 = (id *)objc_msgSend(v27, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v49, CFSTR("firstUpdate"));
        v70 = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v23;
        a4 = v28;
        v17 = 0;
        v21 = 0;
        *v52 = (id)objc_msgSend(v22, "initWithDomain:code:userInfo:", v29, 2, v10);
        goto LABEL_49;
      }
      v59 = v9;
    }
    else
    {
      v59 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("firstUpdateAnyGesture"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = self;
    v57 = v9;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v17 = 0;
          v21 = v59;
          goto LABEL_49;
        }
        v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v31 = a4;
        v32 = *MEMORY[0x1E0D025B8];
        v67 = *MEMORY[0x1E0CB2D50];
        v33 = v7;
        v34 = v8;
        v35 = objc_alloc(MEMORY[0x1E0CB3940]);
        v50 = objc_opt_class();
        v36 = v35;
        v8 = v34;
        v7 = v33;
        v58 = (id)objc_msgSend(v36, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v50, CFSTR("firstUpdateAnyGesture"));
        v68 = v58;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v32, 2, v11);
        v17 = 0;
        a4 = 0;
        *v31 = v37;
        v9 = v57;
        v21 = v59;
LABEL_48:

        self = v60;
LABEL_49:

        goto LABEL_50;
      }
      v56 = v10;
    }
    else
    {
      v56 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("gesture"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v7;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v58 = 0;
          v17 = 0;
          v21 = v59;
          a4 = v56;
          goto LABEL_48;
        }
        v38 = v8;
        v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v40 = *MEMORY[0x1E0D025B8];
        v65 = *MEMORY[0x1E0CB2D50];
        v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("gesture"));
        v66 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v39;
        v8 = v38;
        v7 = v55;
        v42 = (id)objc_msgSend(v41, "initWithDomain:code:userInfo:", v40, 2, v12);
        v17 = 0;
        v58 = 0;
        *a4 = v42;
        goto LABEL_57;
      }
      v58 = v11;
    }
    else
    {
      v58 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pillClicked"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v13 = v8;
      v14 = 0;
      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v8;
      v14 = v12;
LABEL_16:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("totalTimesShown"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v16 = 0;
LABEL_19:
        a4 = v56;
        v17 = -[BMSpringBoardPillLaunch initWithChildAccount:firstUpdate:firstUpdateAnyGesture:gesture:pillClicked:totalTimesShown:](v60, "initWithChildAccount:firstUpdate:firstUpdateAnyGesture:gesture:pillClicked:totalTimesShown:", v13, v59, v56, v58, v14, v16);
        v60 = v17;
LABEL_46:

        v8 = v13;
        v7 = v55;
LABEL_47:

        v21 = v59;
        v9 = v57;
        goto LABEL_48;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = v15;
        goto LABEL_19;
      }
      if (a4)
      {
        v54 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v51 = *MEMORY[0x1E0D025B8];
        v61 = *MEMORY[0x1E0CB2D50];
        v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("totalTimesShown"));
        v62 = v46;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v54, "initWithDomain:code:userInfo:", v51, 2, v47);

      }
      v16 = 0;
      v17 = 0;
LABEL_45:
      a4 = v56;
      goto LABEL_46;
    }
    if (a4)
    {
      v13 = v8;
      v53 = a4;
      v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v44 = *MEMORY[0x1E0D025B8];
      v63 = *MEMORY[0x1E0CB2D50];
      v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("pillClicked"));
      v64 = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v44, 2, v15);
      v17 = 0;
      v14 = 0;
      *v53 = v45;
      goto LABEL_45;
    }
    v14 = 0;
    v17 = 0;
LABEL_57:
    a4 = v56;
    goto LABEL_47;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v17 = 0;
    v8 = 0;
    goto LABEL_51;
  }
  v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v19 = a4;
  v20 = *MEMORY[0x1E0D025B8];
  v71 = *MEMORY[0x1E0CB2D50];
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("childAccount"));
  v72[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, &v71, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v8 = 0;
  *v19 = (id)objc_msgSend(v18, "initWithDomain:code:userInfo:", v20, 2, v9);
LABEL_50:

LABEL_51:
  return v17;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
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
  if (-[BMSpringBoardPillLaunch hasChildAccount](self, "hasChildAccount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSpringBoardPillLaunch childAccount](self, "childAccount"));
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (-[BMSpringBoardPillLaunch hasFirstUpdate](self, "hasFirstUpdate"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSpringBoardPillLaunch firstUpdate](self, "firstUpdate"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (-[BMSpringBoardPillLaunch hasFirstUpdateAnyGesture](self, "hasFirstUpdateAnyGesture"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSpringBoardPillLaunch firstUpdateAnyGesture](self, "firstUpdateAnyGesture"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[BMSpringBoardPillLaunch gesture](self, "gesture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMSpringBoardPillLaunch hasPillClicked](self, "hasPillClicked"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSpringBoardPillLaunch pillClicked](self, "pillClicked"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if (-[BMSpringBoardPillLaunch hasTotalTimesShown](self, "hasTotalTimesShown"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSpringBoardPillLaunch totalTimesShown](self, "totalTimesShown"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v21[0] = CFSTR("childAccount");
  v9 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v17 = v9;
  v19 = (void *)v4;
  v22[0] = v9;
  v21[1] = CFSTR("firstUpdate");
  v10 = (void *)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[1] = v10;
  v21[2] = CFSTR("firstUpdateAnyGesture");
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v3;
  v22[2] = v11;
  v21[3] = CFSTR("gesture");
  v12 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v12;
  v21[4] = CFSTR("pillClicked");
  v13 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[4] = v13;
  v21[5] = CFSTR("totalTimesShown");
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
      goto LABEL_30;
LABEL_37:

    if (v6)
      goto LABEL_31;
    goto LABEL_38;
  }

  if (!v7)
    goto LABEL_37;
LABEL_30:
  if (v6)
    goto LABEL_31;
LABEL_38:

LABEL_31:
  if (!v5)

  if (!v19)
  {

    if (v20)
      goto LABEL_35;
LABEL_40:

    goto LABEL_35;
  }
  if (!v20)
    goto LABEL_40;
LABEL_35:

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;
  int v16;
  unsigned int v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMSpringBoardPillLaunch hasChildAccount](self, "hasChildAccount")
      || objc_msgSend(v5, "hasChildAccount"))
    {
      if (!-[BMSpringBoardPillLaunch hasChildAccount](self, "hasChildAccount"))
        goto LABEL_32;
      if (!objc_msgSend(v5, "hasChildAccount"))
        goto LABEL_32;
      v6 = -[BMSpringBoardPillLaunch childAccount](self, "childAccount");
      if (v6 != objc_msgSend(v5, "childAccount"))
        goto LABEL_32;
    }
    if (-[BMSpringBoardPillLaunch hasFirstUpdate](self, "hasFirstUpdate")
      || objc_msgSend(v5, "hasFirstUpdate"))
    {
      if (!-[BMSpringBoardPillLaunch hasFirstUpdate](self, "hasFirstUpdate"))
        goto LABEL_32;
      if (!objc_msgSend(v5, "hasFirstUpdate"))
        goto LABEL_32;
      v7 = -[BMSpringBoardPillLaunch firstUpdate](self, "firstUpdate");
      if (v7 != objc_msgSend(v5, "firstUpdate"))
        goto LABEL_32;
    }
    if (-[BMSpringBoardPillLaunch hasFirstUpdateAnyGesture](self, "hasFirstUpdateAnyGesture")
      || objc_msgSend(v5, "hasFirstUpdateAnyGesture"))
    {
      if (!-[BMSpringBoardPillLaunch hasFirstUpdateAnyGesture](self, "hasFirstUpdateAnyGesture"))
        goto LABEL_32;
      if (!objc_msgSend(v5, "hasFirstUpdateAnyGesture"))
        goto LABEL_32;
      v8 = -[BMSpringBoardPillLaunch firstUpdateAnyGesture](self, "firstUpdateAnyGesture");
      if (v8 != objc_msgSend(v5, "firstUpdateAnyGesture"))
        goto LABEL_32;
    }
    -[BMSpringBoardPillLaunch gesture](self, "gesture");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "gesture");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v9 == (void *)v10)
    {

    }
    else
    {
      v11 = (void *)v10;
      -[BMSpringBoardPillLaunch gesture](self, "gesture");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "gesture");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if (!v14)
        goto LABEL_32;
    }
    if (!-[BMSpringBoardPillLaunch hasPillClicked](self, "hasPillClicked")
      && !objc_msgSend(v5, "hasPillClicked")
      || -[BMSpringBoardPillLaunch hasPillClicked](self, "hasPillClicked")
      && objc_msgSend(v5, "hasPillClicked")
      && (v16 = -[BMSpringBoardPillLaunch pillClicked](self, "pillClicked"),
          v16 == objc_msgSend(v5, "pillClicked")))
    {
      if (!-[BMSpringBoardPillLaunch hasTotalTimesShown](self, "hasTotalTimesShown")
        && !objc_msgSend(v5, "hasTotalTimesShown"))
      {
        v15 = 1;
        goto LABEL_33;
      }
      if (-[BMSpringBoardPillLaunch hasTotalTimesShown](self, "hasTotalTimesShown")
        && objc_msgSend(v5, "hasTotalTimesShown"))
      {
        v17 = -[BMSpringBoardPillLaunch totalTimesShown](self, "totalTimesShown");
        v15 = v17 == objc_msgSend(v5, "totalTimesShown");
LABEL_33:

        goto LABEL_34;
      }
    }
LABEL_32:
    v15 = 0;
    goto LABEL_33;
  }
  v15 = 0;
LABEL_34:

  return v15;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)childAccount
{
  return self->_childAccount;
}

- (BOOL)hasChildAccount
{
  return self->_hasChildAccount;
}

- (void)setHasChildAccount:(BOOL)a3
{
  self->_hasChildAccount = a3;
}

- (BOOL)firstUpdate
{
  return self->_firstUpdate;
}

- (BOOL)hasFirstUpdate
{
  return self->_hasFirstUpdate;
}

- (void)setHasFirstUpdate:(BOOL)a3
{
  self->_hasFirstUpdate = a3;
}

- (BOOL)firstUpdateAnyGesture
{
  return self->_firstUpdateAnyGesture;
}

- (BOOL)hasFirstUpdateAnyGesture
{
  return self->_hasFirstUpdateAnyGesture;
}

- (void)setHasFirstUpdateAnyGesture:(BOOL)a3
{
  self->_hasFirstUpdateAnyGesture = a3;
}

- (NSString)gesture
{
  return self->_gesture;
}

- (BOOL)pillClicked
{
  return self->_pillClicked;
}

- (BOOL)hasPillClicked
{
  return self->_hasPillClicked;
}

- (void)setHasPillClicked:(BOOL)a3
{
  self->_hasPillClicked = a3;
}

- (unsigned)totalTimesShown
{
  return self->_totalTimesShown;
}

- (BOOL)hasTotalTimesShown
{
  return self->_hasTotalTimesShown;
}

- (void)setHasTotalTimesShown:(BOOL)a3
{
  self->_hasTotalTimesShown = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gesture, 0);
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

    v4 = -[BMSpringBoardPillLaunch initByReadFrom:]([BMSpringBoardPillLaunch alloc], "initByReadFrom:", v7);
    v4[7] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("childAccount"), 0, 0, 1, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("firstUpdate"), 0, 0, 2, 12, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("firstUpdateAnyGesture"), 0, 0, 3, 12, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("gesture"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("pillClicked"), 0, 0, 5, 12, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("totalTimesShown"), 0, 0, 6, 4, 0);
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
  return &unk_1E5F1BCA0;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("childAccount"), 1, 12, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("firstUpdate"), 2, 12, 0);
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("firstUpdateAnyGesture"), 3, 12, 0);
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("gesture"), 4, 13, 0);
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("pillClicked"), 5, 12, 0);
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("totalTimesShown"), 6, 4, 0);
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
