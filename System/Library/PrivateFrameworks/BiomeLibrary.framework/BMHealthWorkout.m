@implementation BMHealthWorkout

- (BMHealthWorkout)initWithIsFirstPartyDonation:(id)a3 isIndoor:(id)a4 activityType:(id)a5 eventType:(int)a6 activityUUID:(id)a7 isUpdate:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  BMHealthWorkout *v19;
  objc_super v21;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v21.receiver = self;
  v21.super_class = (Class)BMHealthWorkout;
  v19 = -[BMEventBase init](&v21, sel_init);
  if (v19)
  {
    v19->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v14)
    {
      v19->_hasIsFirstPartyDonation = 1;
      v19->_isFirstPartyDonation = objc_msgSend(v14, "BOOLValue");
    }
    else
    {
      v19->_hasIsFirstPartyDonation = 0;
      v19->_isFirstPartyDonation = 0;
    }
    if (v15)
    {
      v19->_hasIsIndoor = 1;
      v19->_isIndoor = objc_msgSend(v15, "BOOLValue");
    }
    else
    {
      v19->_hasIsIndoor = 0;
      v19->_isIndoor = 0;
    }
    objc_storeStrong((id *)&v19->_activityType, a5);
    v19->_eventType = a6;
    objc_storeStrong((id *)&v19->_activityUUID, a7);
    if (v18)
    {
      v19->_hasIsUpdate = 1;
      v19->_isUpdate = objc_msgSend(v18, "BOOLValue");
    }
    else
    {
      v19->_hasIsUpdate = 0;
      v19->_isUpdate = 0;
    }
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMHealthWorkout isFirstPartyDonation](self, "isFirstPartyDonation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMHealthWorkout isIndoor](self, "isIndoor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHealthWorkout activityType](self, "activityType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BMHealthWorkoutEventTypeAsString(-[BMHealthWorkout eventType](self, "eventType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHealthWorkout activityUUID](self, "activityUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMHealthWorkout isUpdate](self, "isUpdate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMHealthWorkout with isFirstPartyDonation: %@, isIndoor: %@, activityType: %@, eventType: %@, activityUUID: %@, isUpdate: %@"), v4, v5, v6, v7, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMHealthWorkout *v5;
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
  uint64_t v31;
  uint64_t v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  void *v39;
  char v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  BOOL v46;
  uint64_t v47;
  BMHealthWorkout *v48;
  objc_super v50;

  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)BMHealthWorkout;
  v5 = -[BMEventBase init](&v50, sel_init);
  if (!v5)
    goto LABEL_75;
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
          v5->_hasIsFirstPartyDonation = 1;
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
            v16 = v20++ >= 9;
            if (v16)
            {
              v21 = 0;
              goto LABEL_56;
            }
          }
          v4[*v8] = 1;
LABEL_54:
          if (v4[*v8])
            v21 = 0;
LABEL_56:
          v46 = v21 != 0;
          v47 = 16;
          goto LABEL_71;
        case 2u:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          v5->_hasIsIndoor = 1;
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
                  goto LABEL_60;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v27 = 0;
LABEL_60:
          v46 = v27 != 0;
          v47 = 18;
          goto LABEL_71;
        case 3u:
          PBReaderReadString();
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = 32;
          goto LABEL_45;
        case 4u:
          v33 = 0;
          v34 = 0;
          v35 = 0;
          while (2)
          {
            v36 = *v6;
            v37 = *(_QWORD *)&v4[v36];
            if (v37 == -1 || v37 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v38 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v37);
              *(_QWORD *)&v4[v36] = v37 + 1;
              v35 |= (unint64_t)(v38 & 0x7F) << v33;
              if (v38 < 0)
              {
                v33 += 7;
                v16 = v34++ >= 9;
                if (v16)
                {
                  LODWORD(v35) = 0;
                  goto LABEL_64;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v35) = 0;
LABEL_64:
          if (v35 >= 5)
            LODWORD(v35) = 0;
          v5->_eventType = v35;
          continue;
        case 5u:
          PBReaderReadString();
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = 40;
LABEL_45:
          v39 = *(Class *)((char *)&v5->super.super.isa + v32);
          *(Class *)((char *)&v5->super.super.isa + v32) = (Class)v31;

          continue;
        case 6u:
          v40 = 0;
          v41 = 0;
          v42 = 0;
          v5->_hasIsUpdate = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_74;
          continue;
      }
      while (1)
      {
        v43 = *v6;
        v44 = *(_QWORD *)&v4[v43];
        if (v44 == -1 || v44 >= *(_QWORD *)&v4[*v7])
          break;
        v45 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v44);
        *(_QWORD *)&v4[v43] = v44 + 1;
        v42 |= (unint64_t)(v45 & 0x7F) << v40;
        if ((v45 & 0x80) == 0)
          goto LABEL_68;
        v40 += 7;
        v16 = v41++ >= 9;
        if (v16)
        {
          v42 = 0;
          goto LABEL_70;
        }
      }
      v4[*v8] = 1;
LABEL_68:
      if (v4[*v8])
        v42 = 0;
LABEL_70:
      v46 = v42 != 0;
      v47 = 20;
LABEL_71:
      *((_BYTE *)&v5->super.super.isa + v47) = v46;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_74:
    v48 = 0;
  else
LABEL_75:
    v48 = v5;

  return v48;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_hasIsFirstPartyDonation)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsIndoor)
    PBDataWriterWriteBOOLField();
  if (self->_activityType)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_activityUUID)
    PBDataWriterWriteStringField();
  if (self->_hasIsUpdate)
    PBDataWriterWriteBOOLField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMHealthWorkout writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMHealthWorkout)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  BMHealthWorkout *v16;
  void *v17;
  id v19;
  id *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id *v25;
  uint64_t v26;
  id *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id *v31;
  uint64_t v32;
  id v33;
  id v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  id *v42;
  id v43;
  id *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  BMHealthWorkout *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  id *v60;
  uint64_t v61;
  _QWORD v62[3];

  v62[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isFirstPartyDonation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isIndoor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v17 = 0;
          v16 = 0;
          goto LABEL_25;
        }
        v23 = v8;
        v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v25 = a4;
        v26 = *MEMORY[0x1E0D025B8];
        v59 = *MEMORY[0x1E0CB2D50];
        v27 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isIndoor"));
        v60 = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v24;
        v8 = v23;
        v29 = v26;
        a4 = v27;
        v17 = 0;
        v16 = 0;
        *v25 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v29, 2, v10);
        goto LABEL_24;
      }
      v49 = v9;
    }
    else
    {
      v49 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("activityType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = self;
    v48 = v8;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v16 = 0;
          v17 = v49;
          goto LABEL_24;
        }
        v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v31 = a4;
        v32 = *MEMORY[0x1E0D025B8];
        v57 = *MEMORY[0x1E0CB2D50];
        v46 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("activityType"));
        v58 = v46;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v32, 2, v11);
        a4 = 0;
        v16 = 0;
        *v31 = v33;
        goto LABEL_22;
      }
      v44 = v10;
    }
    else
    {
      v44 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("eventType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v46 = v11;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v46 = 0;
            v16 = 0;
            v17 = v49;
            a4 = v44;
            goto LABEL_23;
          }
          v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v39 = *MEMORY[0x1E0D025B8];
          v55 = *MEMORY[0x1E0CB2D50];
          v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("eventType"));
          v56 = v13;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = (id)objc_msgSend(v47, "initWithDomain:code:userInfo:", v39, 2, v12);
          v46 = 0;
          v16 = 0;
          *a4 = v40;
          goto LABEL_58;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMHealthWorkoutEventTypeFromString(v11));
        v46 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v46 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("activityUUID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v13 = 0;
      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v12;
LABEL_16:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isUpdate"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v41 = *MEMORY[0x1E0D025B8];
            v51 = *MEMORY[0x1E0CB2D50];
            v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isUpdate"));
            v52 = v37;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *a4 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v41, 2, v38);

          }
          v15 = 0;
          v16 = 0;
          a4 = v44;
          goto LABEL_20;
        }
        v15 = v14;
      }
      else
      {
        v15 = 0;
      }
      a4 = v44;
      v16 = -[BMHealthWorkout initWithIsFirstPartyDonation:isIndoor:activityType:eventType:activityUUID:isUpdate:](v50, "initWithIsFirstPartyDonation:isIndoor:activityType:eventType:activityUUID:isUpdate:", v48, v49, v44, objc_msgSend(v46, "intValue"), v13, v15);
      v50 = v16;
LABEL_20:

LABEL_21:
LABEL_22:
      v17 = v49;
LABEL_23:

      self = v50;
      v8 = v48;
LABEL_24:

      v7 = v45;
      goto LABEL_25;
    }
    if (a4)
    {
      v42 = a4;
      v34 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v35 = *MEMORY[0x1E0D025B8];
      v53 = *MEMORY[0x1E0CB2D50];
      v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("activityUUID"));
      v54 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (id)objc_msgSend(v34, "initWithDomain:code:userInfo:", v35, 2, v14);
      v16 = 0;
      v13 = 0;
      a4 = v44;
      *v42 = v36;
      goto LABEL_20;
    }
    v13 = 0;
    v16 = 0;
LABEL_58:
    a4 = v44;
    goto LABEL_21;
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
    v16 = 0;
    goto LABEL_26;
  }
  v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v20 = a4;
  v21 = *MEMORY[0x1E0D025B8];
  v61 = *MEMORY[0x1E0CB2D50];
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isFirstPartyDonation"));
  v62[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, &v61, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v21, 2, v9);
  v8 = 0;
  v16 = 0;
  *v20 = v22;
LABEL_25:

LABEL_26:
  return v16;
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
  if (-[BMHealthWorkout hasIsFirstPartyDonation](self, "hasIsFirstPartyDonation"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMHealthWorkout isFirstPartyDonation](self, "isFirstPartyDonation"));
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (-[BMHealthWorkout hasIsIndoor](self, "hasIsIndoor"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMHealthWorkout isIndoor](self, "isIndoor"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  -[BMHealthWorkout activityType](self, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMHealthWorkout eventType](self, "eventType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMHealthWorkout activityUUID](self, "activityUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMHealthWorkout hasIsUpdate](self, "hasIsUpdate"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMHealthWorkout isUpdate](self, "isUpdate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v21[0] = CFSTR("isFirstPartyDonation");
  v9 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v9;
  v20 = (void *)v3;
  v22[0] = v9;
  v21[1] = CFSTR("isIndoor");
  v10 = (uint64_t)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v17 = v10;
  v22[1] = v10;
  v21[2] = CFSTR("activityType");
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v10, v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[2] = v11;
  v21[3] = CFSTR("eventType");
  v12 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v12;
  v21[4] = CFSTR("activityUUID");
  v13 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[4] = v13;
  v21[5] = CFSTR("isUpdate");
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
      goto LABEL_24;
  }
  else
  {

    if (v7)
    {
LABEL_24:
      if (v6)
        goto LABEL_25;
      goto LABEL_32;
    }
  }

  if (v6)
  {
LABEL_25:
    if (v5)
      goto LABEL_26;
LABEL_33:

    if (v4)
      goto LABEL_27;
    goto LABEL_34;
  }
LABEL_32:

  if (!v5)
    goto LABEL_33;
LABEL_26:
  if (v4)
    goto LABEL_27;
LABEL_34:

LABEL_27:
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
  int v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  _BOOL4 v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMHealthWorkout hasIsFirstPartyDonation](self, "hasIsFirstPartyDonation")
      || objc_msgSend(v5, "hasIsFirstPartyDonation"))
    {
      if (!-[BMHealthWorkout hasIsFirstPartyDonation](self, "hasIsFirstPartyDonation"))
        goto LABEL_27;
      if (!objc_msgSend(v5, "hasIsFirstPartyDonation"))
        goto LABEL_27;
      v6 = -[BMHealthWorkout isFirstPartyDonation](self, "isFirstPartyDonation");
      if (v6 != objc_msgSend(v5, "isFirstPartyDonation"))
        goto LABEL_27;
    }
    if (-[BMHealthWorkout hasIsIndoor](self, "hasIsIndoor") || objc_msgSend(v5, "hasIsIndoor"))
    {
      if (!-[BMHealthWorkout hasIsIndoor](self, "hasIsIndoor"))
        goto LABEL_27;
      if (!objc_msgSend(v5, "hasIsIndoor"))
        goto LABEL_27;
      v7 = -[BMHealthWorkout isIndoor](self, "isIndoor");
      if (v7 != objc_msgSend(v5, "isIndoor"))
        goto LABEL_27;
    }
    -[BMHealthWorkout activityType](self, "activityType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activityType");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v8 == (void *)v9)
    {

    }
    else
    {
      v10 = (void *)v9;
      -[BMHealthWorkout activityType](self, "activityType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "activityType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if (!v13)
        goto LABEL_27;
    }
    v15 = -[BMHealthWorkout eventType](self, "eventType");
    if (v15 == objc_msgSend(v5, "eventType"))
    {
      -[BMHealthWorkout activityUUID](self, "activityUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "activityUUID");
      v17 = objc_claimAutoreleasedReturnValue();
      if (v16 == (void *)v17)
      {

      }
      else
      {
        v18 = (void *)v17;
        -[BMHealthWorkout activityUUID](self, "activityUUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "activityUUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "isEqual:", v20);

        if (!v21)
          goto LABEL_27;
      }
      if (!-[BMHealthWorkout hasIsUpdate](self, "hasIsUpdate") && !objc_msgSend(v5, "hasIsUpdate"))
      {
        LOBYTE(v14) = 1;
        goto LABEL_28;
      }
      if (-[BMHealthWorkout hasIsUpdate](self, "hasIsUpdate") && objc_msgSend(v5, "hasIsUpdate"))
      {
        v22 = -[BMHealthWorkout isUpdate](self, "isUpdate");
        v14 = v22 ^ objc_msgSend(v5, "isUpdate") ^ 1;
LABEL_28:

        goto LABEL_29;
      }
    }
LABEL_27:
    LOBYTE(v14) = 0;
    goto LABEL_28;
  }
  LOBYTE(v14) = 0;
LABEL_29:

  return v14;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isFirstPartyDonation
{
  return self->_isFirstPartyDonation;
}

- (BOOL)hasIsFirstPartyDonation
{
  return self->_hasIsFirstPartyDonation;
}

- (void)setHasIsFirstPartyDonation:(BOOL)a3
{
  self->_hasIsFirstPartyDonation = a3;
}

- (BOOL)isIndoor
{
  return self->_isIndoor;
}

- (BOOL)hasIsIndoor
{
  return self->_hasIsIndoor;
}

- (void)setHasIsIndoor:(BOOL)a3
{
  self->_hasIsIndoor = a3;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (int)eventType
{
  return self->_eventType;
}

- (NSString)activityUUID
{
  return self->_activityUUID;
}

- (BOOL)isUpdate
{
  return self->_isUpdate;
}

- (BOOL)hasIsUpdate
{
  return self->_hasIsUpdate;
}

- (void)setHasIsUpdate:(BOOL)a3
{
  self->_hasIsUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityUUID, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
}

+ (unsigned)latestDataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  __objc2_class **v6;
  void *v7;
  _DWORD *v8;

  v5 = a3;
  if (a4 == 1)
  {
    v6 = off_1E5E4AB08;
  }
  else
  {
    if (a4)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v6 = off_1E5E4AB10;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D82B90]), "initWithData:", v5);
  v8 = (_DWORD *)objc_msgSend(objc_alloc(*v6), "initByReadFrom:", v7);
  v8[6] = a4;

LABEL_7:
  return v8;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isFirstPartyDonation"), 0, 0, 1, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isIndoor"), 0, 0, 2, 12, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("activityType"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("eventType"), 0, 0, 4, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("activityUUID"), 2, 0, 5, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isUpdate"), 0, 0, 6, 12, 0);
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
  return &unk_1E5F1AAE8;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isFirstPartyDonation"), 1, 12, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isIndoor"), 2, 12, 0);
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("activityType"), 3, 13, 0);
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("eventType"), 4, 4, 0);
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("activityUUID"), 5, 13, 0);
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isUpdate"), 6, 12, 0);
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
