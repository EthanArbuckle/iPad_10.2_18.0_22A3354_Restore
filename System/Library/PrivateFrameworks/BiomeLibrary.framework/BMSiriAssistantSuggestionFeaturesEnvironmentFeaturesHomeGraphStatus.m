@implementation BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus

- (BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus)initWithNumberOfDevices:(id)a3 numberOfRooms:(id)a4 numberOfHomes:(id)a5 hasLights:(id)a6 hasSecuritySystem:(id)a7 hasTemperatureControl:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus *v20;
  int v21;
  int v22;
  int v23;
  objc_super v25;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v25.receiver = self;
  v25.super_class = (Class)BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus;
  v20 = -[BMEventBase init](&v25, sel_init);
  if (v20)
  {
    v20->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v14)
    {
      v20->_hasNumberOfDevices = 1;
      v21 = objc_msgSend(v14, "intValue");
    }
    else
    {
      v20->_hasNumberOfDevices = 0;
      v21 = -1;
    }
    v20->_numberOfDevices = v21;
    if (v15)
    {
      v20->_hasNumberOfRooms = 1;
      v22 = objc_msgSend(v15, "intValue");
    }
    else
    {
      v20->_hasNumberOfRooms = 0;
      v22 = -1;
    }
    v20->_numberOfRooms = v22;
    if (v16)
    {
      v20->_hasNumberOfHomes = 1;
      v23 = objc_msgSend(v16, "intValue");
    }
    else
    {
      v20->_hasNumberOfHomes = 0;
      v23 = -1;
    }
    v20->_numberOfHomes = v23;
    if (v17)
    {
      v20->_hasHasLights = 1;
      v20->_hasLights = objc_msgSend(v17, "BOOLValue");
    }
    else
    {
      v20->_hasHasLights = 0;
      v20->_hasLights = 0;
    }
    if (v18)
    {
      v20->_hasHasSecuritySystem = 1;
      v20->_hasSecuritySystem = objc_msgSend(v18, "BOOLValue");
    }
    else
    {
      v20->_hasHasSecuritySystem = 0;
      v20->_hasSecuritySystem = 0;
    }
    if (v19)
    {
      v20->_hasHasTemperatureControl = 1;
      v20->_hasTemperatureControl = objc_msgSend(v19, "BOOLValue");
    }
    else
    {
      v20->_hasHasTemperatureControl = 0;
      v20->_hasTemperatureControl = 0;
    }
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus numberOfDevices](self, "numberOfDevices"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus numberOfRooms](self, "numberOfRooms"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus numberOfHomes](self, "numberOfHomes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasLights](self, "hasLights"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasSecuritySystem](self, "hasSecuritySystem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasTemperatureControl](self, "hasTemperatureControl"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus with numberOfDevices: %@, numberOfRooms: %@, numberOfHomes: %@, hasLights: %@, hasSecuritySystem: %@, hasTemperatureControl: %@"), v4, v5, v6, v7, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus *v5;
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
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  char v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  char v46;
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  char v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  uint64_t v60;
  BOOL v61;
  uint64_t v62;
  BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus *v63;
  objc_super v65;

  v4 = a3;
  v65.receiver = self;
  v65.super_class = (Class)BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus;
  v5 = -[BMEventBase init](&v65, sel_init);
  if (!v5)
    goto LABEL_93;
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
          v5->_hasNumberOfDevices = 1;
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
              goto LABEL_65;
            v20 += 7;
            v17 = v21++ >= 9;
            if (v17)
            {
              LODWORD(v22) = 0;
              goto LABEL_67;
            }
          }
          v4[*v8] = 1;
LABEL_65:
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_67:
          v60 = 32;
          goto LABEL_76;
        case 2u:
          v27 = 0;
          v28 = 0;
          v22 = 0;
          v5->_hasNumberOfRooms = 1;
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
                  goto LABEL_71;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_71:
          v60 = 36;
          goto LABEL_76;
        case 3u:
          v33 = 0;
          v34 = 0;
          v22 = 0;
          v5->_hasNumberOfHomes = 1;
          while (2)
          {
            v35 = *v6;
            v36 = *(_QWORD *)&v4[v35];
            v37 = v36 + 1;
            if (v36 == -1 || v37 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v38 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v36);
              *(_QWORD *)&v4[v35] = v37;
              v22 |= (unint64_t)(v38 & 0x7F) << v33;
              if (v38 < 0)
              {
                v33 += 7;
                v17 = v34++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_75;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_75:
          v60 = 40;
LABEL_76:
          *(_DWORD *)((char *)&v5->super.super.isa + v60) = v22;
          continue;
        case 4u:
          v39 = 0;
          v40 = 0;
          v41 = 0;
          v5->_hasHasLights = 1;
          while (2)
          {
            v42 = *v6;
            v43 = *(_QWORD *)&v4[v42];
            v44 = v43 + 1;
            if (v43 == -1 || v44 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v45 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v43);
              *(_QWORD *)&v4[v42] = v44;
              v41 |= (unint64_t)(v45 & 0x7F) << v39;
              if (v45 < 0)
              {
                v39 += 7;
                v17 = v40++ >= 9;
                if (v17)
                {
                  v41 = 0;
                  goto LABEL_80;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v41 = 0;
LABEL_80:
          v61 = v41 != 0;
          v62 = 19;
          goto LABEL_89;
        case 5u:
          v46 = 0;
          v47 = 0;
          v48 = 0;
          v5->_hasHasSecuritySystem = 1;
          while (2)
          {
            v49 = *v6;
            v50 = *(_QWORD *)&v4[v49];
            v51 = v50 + 1;
            if (v50 == -1 || v51 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v52 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v50);
              *(_QWORD *)&v4[v49] = v51;
              v48 |= (unint64_t)(v52 & 0x7F) << v46;
              if (v52 < 0)
              {
                v46 += 7;
                v17 = v47++ >= 9;
                if (v17)
                {
                  v48 = 0;
                  goto LABEL_84;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v48 = 0;
LABEL_84:
          v61 = v48 != 0;
          v62 = 21;
          goto LABEL_89;
        case 6u:
          v53 = 0;
          v54 = 0;
          v55 = 0;
          v5->_hasHasTemperatureControl = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_92;
          continue;
      }
      while (1)
      {
        v56 = *v6;
        v57 = *(_QWORD *)&v4[v56];
        v58 = v57 + 1;
        if (v57 == -1 || v58 > *(_QWORD *)&v4[*v7])
          break;
        v59 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v57);
        *(_QWORD *)&v4[v56] = v58;
        v55 |= (unint64_t)(v59 & 0x7F) << v53;
        if ((v59 & 0x80) == 0)
          goto LABEL_86;
        v53 += 7;
        v17 = v54++ >= 9;
        if (v17)
        {
          v55 = 0;
          goto LABEL_88;
        }
      }
      v4[*v8] = 1;
LABEL_86:
      if (v4[*v8])
        v55 = 0;
LABEL_88:
      v61 = v55 != 0;
      v62 = 23;
LABEL_89:
      *((_BYTE *)&v5->super.super.isa + v62) = v61;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_92:
    v63 = 0;
  else
LABEL_93:
    v63 = v5;

  return v63;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasNumberOfDevices)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasNumberOfRooms)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasNumberOfHomes)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasHasLights)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasHasSecuritySystem)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasHasTemperatureControl)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus)initWithJSONDictionary:(id)a3 error:(id *)a4
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
  BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus *v17;
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
  BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus *v60;
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
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("numberOfDevices"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("numberOfRooms"));
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
        v28 = (id *)objc_msgSend(v27, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v49, CFSTR("numberOfRooms"));
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
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("numberOfHomes"));
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
        v58 = (id)objc_msgSend(v36, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v50, CFSTR("numberOfHomes"));
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
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hasLights"));
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
        v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("hasLights"));
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
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hasSecuritySystem"));
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
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hasTemperatureControl"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v16 = 0;
LABEL_19:
        a4 = v56;
        v17 = -[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus initWithNumberOfDevices:numberOfRooms:numberOfHomes:hasLights:hasSecuritySystem:hasTemperatureControl:](v60, "initWithNumberOfDevices:numberOfRooms:numberOfHomes:hasLights:hasSecuritySystem:hasTemperatureControl:", v13, v59, v56, v58, v14, v16);
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
        v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("hasTemperatureControl"));
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
      v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("hasSecuritySystem"));
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
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("numberOfDevices"));
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
  if (-[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasNumberOfDevices](self, "hasNumberOfDevices"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus numberOfDevices](self, "numberOfDevices"));
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasNumberOfRooms](self, "hasNumberOfRooms"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus numberOfRooms](self, "numberOfRooms"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasNumberOfHomes](self, "hasNumberOfHomes"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus numberOfHomes](self, "numberOfHomes"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasHasLights](self, "hasHasLights"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasLights](self, "hasLights"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasHasSecuritySystem](self, "hasHasSecuritySystem"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasSecuritySystem](self, "hasSecuritySystem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if (-[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasHasTemperatureControl](self, "hasHasTemperatureControl"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasTemperatureControl](self, "hasTemperatureControl"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v21[0] = CFSTR("numberOfDevices");
  v9 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v17 = v9;
  v19 = (void *)v4;
  v22[0] = v9;
  v21[1] = CFSTR("numberOfRooms");
  v10 = (void *)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[1] = v10;
  v21[2] = CFSTR("numberOfHomes");
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v3;
  v22[2] = v11;
  v21[3] = CFSTR("hasLights");
  v12 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v12;
  v21[4] = CFSTR("hasSecuritySystem");
  v13 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[4] = v13;
  v21[5] = CFSTR("hasTemperatureControl");
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
      goto LABEL_33;
LABEL_40:

    if (v6)
      goto LABEL_34;
    goto LABEL_41;
  }

  if (!v7)
    goto LABEL_40;
LABEL_33:
  if (v6)
    goto LABEL_34;
LABEL_41:

LABEL_34:
  if (!v5)

  if (!v19)
  {

    if (v20)
      goto LABEL_38;
LABEL_43:

    goto LABEL_38;
  }
  if (!v20)
    goto LABEL_43;
LABEL_38:

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  _BOOL4 v11;
  int v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasNumberOfDevices](self, "hasNumberOfDevices")|| objc_msgSend(v5, "hasNumberOfDevices"))
    {
      if (!-[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasNumberOfDevices](self, "hasNumberOfDevices"))goto LABEL_33;
      if (!objc_msgSend(v5, "hasNumberOfDevices"))
        goto LABEL_33;
      v6 = -[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus numberOfDevices](self, "numberOfDevices");
      if (v6 != objc_msgSend(v5, "numberOfDevices"))
        goto LABEL_33;
    }
    if (-[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasNumberOfRooms](self, "hasNumberOfRooms")|| objc_msgSend(v5, "hasNumberOfRooms"))
    {
      if (!-[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasNumberOfRooms](self, "hasNumberOfRooms"))goto LABEL_33;
      if (!objc_msgSend(v5, "hasNumberOfRooms"))
        goto LABEL_33;
      v7 = -[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus numberOfRooms](self, "numberOfRooms");
      if (v7 != objc_msgSend(v5, "numberOfRooms"))
        goto LABEL_33;
    }
    if (-[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasNumberOfHomes](self, "hasNumberOfHomes")|| objc_msgSend(v5, "hasNumberOfHomes"))
    {
      if (!-[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasNumberOfHomes](self, "hasNumberOfHomes"))goto LABEL_33;
      if (!objc_msgSend(v5, "hasNumberOfHomes"))
        goto LABEL_33;
      v8 = -[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus numberOfHomes](self, "numberOfHomes");
      if (v8 != objc_msgSend(v5, "numberOfHomes"))
        goto LABEL_33;
    }
    if (-[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasHasLights](self, "hasHasLights")
      || objc_msgSend(v5, "hasHasLights"))
    {
      if (!-[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasHasLights](self, "hasHasLights"))
        goto LABEL_33;
      if (!objc_msgSend(v5, "hasHasLights"))
        goto LABEL_33;
      v9 = -[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasLights](self, "hasLights");
      if (v9 != objc_msgSend(v5, "hasLights"))
        goto LABEL_33;
    }
    if (-[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasHasSecuritySystem](self, "hasHasSecuritySystem")|| objc_msgSend(v5, "hasHasSecuritySystem"))
    {
      if (!-[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasHasSecuritySystem](self, "hasHasSecuritySystem"))goto LABEL_33;
      if (!objc_msgSend(v5, "hasHasSecuritySystem"))
        goto LABEL_33;
      v10 = -[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasSecuritySystem](self, "hasSecuritySystem");
      if (v10 != objc_msgSend(v5, "hasSecuritySystem"))
        goto LABEL_33;
    }
    if (!-[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasHasTemperatureControl](self, "hasHasTemperatureControl")&& !objc_msgSend(v5, "hasHasTemperatureControl"))
    {
      LOBYTE(v12) = 1;
      goto LABEL_34;
    }
    if (-[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasHasTemperatureControl](self, "hasHasTemperatureControl")&& objc_msgSend(v5, "hasHasTemperatureControl"))
    {
      v11 = -[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus hasTemperatureControl](self, "hasTemperatureControl");
      v12 = v11 ^ objc_msgSend(v5, "hasTemperatureControl") ^ 1;
    }
    else
    {
LABEL_33:
      LOBYTE(v12) = 0;
    }
LABEL_34:

    goto LABEL_35;
  }
  LOBYTE(v12) = 0;
LABEL_35:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)numberOfDevices
{
  return self->_numberOfDevices;
}

- (BOOL)hasNumberOfDevices
{
  return self->_hasNumberOfDevices;
}

- (void)setHasNumberOfDevices:(BOOL)a3
{
  self->_hasNumberOfDevices = a3;
}

- (int)numberOfRooms
{
  return self->_numberOfRooms;
}

- (BOOL)hasNumberOfRooms
{
  return self->_hasNumberOfRooms;
}

- (void)setHasNumberOfRooms:(BOOL)a3
{
  self->_hasNumberOfRooms = a3;
}

- (int)numberOfHomes
{
  return self->_numberOfHomes;
}

- (BOOL)hasNumberOfHomes
{
  return self->_hasNumberOfHomes;
}

- (void)setHasNumberOfHomes:(BOOL)a3
{
  self->_hasNumberOfHomes = a3;
}

- (BOOL)hasLights
{
  return self->_hasLights;
}

- (BOOL)hasHasLights
{
  return self->_hasHasLights;
}

- (void)setHasHasLights:(BOOL)a3
{
  self->_hasHasLights = a3;
}

- (BOOL)hasSecuritySystem
{
  return self->_hasSecuritySystem;
}

- (BOOL)hasHasSecuritySystem
{
  return self->_hasHasSecuritySystem;
}

- (void)setHasHasSecuritySystem:(BOOL)a3
{
  self->_hasHasSecuritySystem = a3;
}

- (BOOL)hasTemperatureControl
{
  return self->_hasTemperatureControl;
}

- (BOOL)hasHasTemperatureControl
{
  return self->_hasHasTemperatureControl;
}

- (void)setHasHasTemperatureControl:(BOOL)a3
{
  self->_hasHasTemperatureControl = a3;
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

    v4 = -[BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus initByReadFrom:]([BMSiriAssistantSuggestionFeaturesEnvironmentFeaturesHomeGraphStatus alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numberOfDevices"), 0, 0, 1, 2, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numberOfRooms"), 0, 0, 2, 2, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numberOfHomes"), 0, 0, 3, 2, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("hasLights"), 0, 0, 4, 12, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("hasSecuritySystem"), 0, 0, 5, 12, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("hasTemperatureControl"), 0, 0, 6, 12, 0);
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
  return &unk_1E5F1B2C8;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numberOfDevices"), 1, 2, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numberOfRooms"), 2, 2, 0);
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numberOfHomes"), 3, 2, 0);
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("hasLights"), 4, 12, 0);
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("hasSecuritySystem"), 5, 12, 0);
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("hasTemperatureControl"), 6, 12, 0);
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
