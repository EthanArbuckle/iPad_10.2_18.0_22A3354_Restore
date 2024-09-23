@implementation BMSystemSettingsMultitasking

- (BMSystemSettingsMultitasking)initWithChildAccount:(id)a3 firstUpdate:(id)a4 buddySetup:(id)a5 buddySetupMultitaskingOff:(id)a6 multitaskingOption:(id)a7 source:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  BMSystemSettingsMultitasking *v20;
  objc_super v22;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v22.receiver = self;
  v22.super_class = (Class)BMSystemSettingsMultitasking;
  v20 = -[BMEventBase init](&v22, sel_init);
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
      v20->_hasBuddySetup = 1;
      v20->_buddySetup = objc_msgSend(v16, "BOOLValue");
    }
    else
    {
      v20->_hasBuddySetup = 0;
      v20->_buddySetup = 0;
    }
    if (v17)
    {
      v20->_hasBuddySetupMultitaskingOff = 1;
      v20->_buddySetupMultitaskingOff = objc_msgSend(v17, "BOOLValue");
    }
    else
    {
      v20->_hasBuddySetupMultitaskingOff = 0;
      v20->_buddySetupMultitaskingOff = 0;
    }
    objc_storeStrong((id *)&v20->_multitaskingOption, a7);
    objc_storeStrong((id *)&v20->_source, a8);
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSystemSettingsMultitasking childAccount](self, "childAccount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSystemSettingsMultitasking firstUpdate](self, "firstUpdate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSystemSettingsMultitasking buddySetup](self, "buddySetup"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSystemSettingsMultitasking buddySetupMultitaskingOff](self, "buddySetupMultitaskingOff"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSystemSettingsMultitasking multitaskingOption](self, "multitaskingOption");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSystemSettingsMultitasking source](self, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSystemSettingsMultitasking with childAccount: %@, firstUpdate: %@, buddySetup: %@, buddySetupMultitaskingOff: %@, multitaskingOption: %@, source: %@"), v4, v5, v6, v7, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSystemSettingsMultitasking *v5;
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
  char v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  BOOL v46;
  uint64_t v47;
  BMSystemSettingsMultitasking *v48;
  objc_super v50;

  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)BMSystemSettingsMultitasking;
  v5 = -[BMEventBase init](&v50, sel_init);
  if (!v5)
    goto LABEL_73;
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
          goto LABEL_69;
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
          goto LABEL_69;
        case 3u:
          v31 = 0;
          v32 = 0;
          v33 = 0;
          v5->_hasBuddySetup = 1;
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
                  goto LABEL_64;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v33 = 0;
LABEL_64:
          v46 = v33 != 0;
          v47 = 20;
          goto LABEL_69;
        case 4u:
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v5->_hasBuddySetupMultitaskingOff = 1;
          break;
        case 5u:
          PBReaderReadString();
          v43 = objc_claimAutoreleasedReturnValue();
          v44 = 32;
          goto LABEL_52;
        case 6u:
          PBReaderReadString();
          v43 = objc_claimAutoreleasedReturnValue();
          v44 = 40;
LABEL_52:
          v45 = *(Class *)((char *)&v5->super.super.isa + v44);
          *(Class *)((char *)&v5->super.super.isa + v44) = (Class)v43;

          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_72;
          continue;
      }
      while (1)
      {
        v40 = *v6;
        v41 = *(_QWORD *)&v4[v40];
        if (v41 == -1 || v41 >= *(_QWORD *)&v4[*v7])
          break;
        v42 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v41);
        *(_QWORD *)&v4[v40] = v41 + 1;
        v39 |= (unint64_t)(v42 & 0x7F) << v37;
        if ((v42 & 0x80) == 0)
          goto LABEL_66;
        v37 += 7;
        v16 = v38++ >= 9;
        if (v16)
        {
          v39 = 0;
          goto LABEL_68;
        }
      }
      v4[*v8] = 1;
LABEL_66:
      if (v4[*v8])
        v39 = 0;
LABEL_68:
      v46 = v39 != 0;
      v47 = 22;
LABEL_69:
      *((_BYTE *)&v5->super.super.isa + v47) = v46;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_72:
    v48 = 0;
  else
LABEL_73:
    v48 = v5;

  return v48;
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
  if (self->_hasBuddySetup)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasBuddySetupMultitaskingOff)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_multitaskingOption)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_source)
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
  -[BMSystemSettingsMultitasking writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSystemSettingsMultitasking)initWithJSONDictionary:(id)a3 error:(id *)a4
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
  id v16;
  void *v17;
  id v18;
  BMSystemSettingsMultitasking *v19;
  id *v20;
  id v21;
  uint64_t v22;
  id v23;
  id *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id *v30;
  id v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  id *v40;
  id v41;
  id v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v48;
  uint64_t v49;
  id v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  BMSystemSettingsMultitasking *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD v68[3];

  v68[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("childAccount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("firstUpdate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v10 = 0;
          v19 = 0;
          goto LABEL_50;
        }
        v24 = a4;
        v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v26 = v8;
        v27 = *MEMORY[0x1E0D025B8];
        v65 = *MEMORY[0x1E0CB2D50];
        v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("firstUpdate"));
        v66 = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v27;
        v8 = v26;
        v19 = 0;
        v10 = 0;
        *v24 = (id)objc_msgSend(v25, "initWithDomain:code:userInfo:", v29, 2, v11);
        v12 = (id)v28;
        goto LABEL_49;
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("buddySetup"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = self;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v12 = 0;
          v19 = 0;
          goto LABEL_49;
        }
        v30 = a4;
        v31 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v32 = v8;
        v33 = *MEMORY[0x1E0D025B8];
        v63 = *MEMORY[0x1E0CB2D50];
        v34 = v10;
        v35 = objc_alloc(MEMORY[0x1E0CB3940]);
        v48 = objc_opt_class();
        v36 = v35;
        v10 = v34;
        v55 = (id)objc_msgSend(v36, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v48, CFSTR("buddySetup"));
        v64 = v55;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v33;
        v8 = v32;
        v19 = 0;
        *v30 = (id)objc_msgSend(v31, "initWithDomain:code:userInfo:", v37, 2, v13);
        v12 = 0;
LABEL_48:

        self = v56;
LABEL_49:

        v7 = v54;
        goto LABEL_50;
      }
      v12 = v11;
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("buddySetupMultitaskingOff"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v10;
    v53 = v8;
    v51 = v12;
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v55 = 0;
          v19 = 0;
          goto LABEL_48;
        }
        v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v39 = *MEMORY[0x1E0D025B8];
        v61 = *MEMORY[0x1E0CB2D50];
        v40 = a4;
        v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("buddySetupMultitaskingOff"));
        v62 = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v39, 2, v15);
        v19 = 0;
        v55 = 0;
        *v40 = v41;
        goto LABEL_57;
      }
      v14 = a4;
      v55 = v13;
    }
    else
    {
      v14 = a4;
      v55 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("multitaskingOption"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v16 = 0;
      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = v15;
LABEL_16:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("source"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v18 = 0;
LABEL_19:
        v12 = v51;
        v19 = -[BMSystemSettingsMultitasking initWithChildAccount:firstUpdate:buddySetup:buddySetupMultitaskingOff:multitaskingOption:source:](v56, "initWithChildAccount:firstUpdate:buddySetup:buddySetupMultitaskingOff:multitaskingOption:source:", v53, v52, v51, v55, v16, v18);
        v56 = v19;
LABEL_46:

LABEL_47:
        v10 = v52;
        v8 = v53;
        goto LABEL_48;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = v17;
        goto LABEL_19;
      }
      if (v14)
      {
        v50 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v49 = *MEMORY[0x1E0D025B8];
        v57 = *MEMORY[0x1E0CB2D50];
        v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("source"));
        v58 = v45;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *v14 = (id)objc_msgSend(v50, "initWithDomain:code:userInfo:", v49, 2, v46);

      }
      v18 = 0;
      v19 = 0;
LABEL_45:
      v12 = v51;
      goto LABEL_46;
    }
    if (v14)
    {
      v42 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v43 = *MEMORY[0x1E0D025B8];
      v59 = *MEMORY[0x1E0CB2D50];
      v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("multitaskingOption"));
      v60 = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = (id)objc_msgSend(v42, "initWithDomain:code:userInfo:", v43, 2, v17);
      v19 = 0;
      v16 = 0;
      *v14 = v44;
      goto LABEL_45;
    }
    v16 = 0;
    v19 = 0;
LABEL_57:
    v12 = v51;
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
    v19 = 0;
    v8 = 0;
    goto LABEL_51;
  }
  v20 = a4;
  v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v22 = *MEMORY[0x1E0D025B8];
  v67 = *MEMORY[0x1E0CB2D50];
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("childAccount"));
  v68[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, &v67, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 2, v9);
  v19 = 0;
  v8 = 0;
  *v20 = v23;
LABEL_50:

LABEL_51:
  return v19;
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
  if (-[BMSystemSettingsMultitasking hasChildAccount](self, "hasChildAccount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSystemSettingsMultitasking childAccount](self, "childAccount"));
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (-[BMSystemSettingsMultitasking hasFirstUpdate](self, "hasFirstUpdate"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSystemSettingsMultitasking firstUpdate](self, "firstUpdate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (-[BMSystemSettingsMultitasking hasBuddySetup](self, "hasBuddySetup"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSystemSettingsMultitasking buddySetup](self, "buddySetup"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (-[BMSystemSettingsMultitasking hasBuddySetupMultitaskingOff](self, "hasBuddySetupMultitaskingOff"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSystemSettingsMultitasking buddySetupMultitaskingOff](self, "buddySetupMultitaskingOff"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  -[BMSystemSettingsMultitasking multitaskingOption](self, "multitaskingOption");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSystemSettingsMultitasking source](self, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = CFSTR("childAccount");
  v9 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v9;
  v22[0] = v9;
  v21[1] = CFSTR("firstUpdate");
  v10 = (uint64_t)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v17 = v10;
  v22[1] = v10;
  v21[2] = CFSTR("buddySetup");
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v10, v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v3;
  v22[2] = v11;
  v21[3] = CFSTR("buddySetupMultitaskingOff");
  v12 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v12;
  v21[4] = CFSTR("multitaskingOption");
  v13 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[4] = v13;
  v21[5] = CFSTR("source");
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
      goto LABEL_27;
LABEL_33:

    if (v6)
      goto LABEL_28;
    goto LABEL_34;
  }

  if (!v7)
    goto LABEL_33;
LABEL_27:
  if (v6)
    goto LABEL_28;
LABEL_34:

LABEL_28:
  if (v5)
  {
    if (v4)
      goto LABEL_30;
LABEL_36:

    if (v20)
      goto LABEL_31;
LABEL_37:

    goto LABEL_31;
  }

  if (!v4)
    goto LABEL_36;
LABEL_30:
  if (!v20)
    goto LABEL_37;
LABEL_31:

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
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  char v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = 0;
    goto LABEL_27;
  }
  v5 = v4;
  if (-[BMSystemSettingsMultitasking hasChildAccount](self, "hasChildAccount")
    || objc_msgSend(v5, "hasChildAccount"))
  {
    if (!-[BMSystemSettingsMultitasking hasChildAccount](self, "hasChildAccount"))
      goto LABEL_24;
    if (!objc_msgSend(v5, "hasChildAccount"))
      goto LABEL_24;
    v6 = -[BMSystemSettingsMultitasking childAccount](self, "childAccount");
    if (v6 != objc_msgSend(v5, "childAccount"))
      goto LABEL_24;
  }
  if (-[BMSystemSettingsMultitasking hasFirstUpdate](self, "hasFirstUpdate")
    || objc_msgSend(v5, "hasFirstUpdate"))
  {
    if (!-[BMSystemSettingsMultitasking hasFirstUpdate](self, "hasFirstUpdate"))
      goto LABEL_24;
    if (!objc_msgSend(v5, "hasFirstUpdate"))
      goto LABEL_24;
    v7 = -[BMSystemSettingsMultitasking firstUpdate](self, "firstUpdate");
    if (v7 != objc_msgSend(v5, "firstUpdate"))
      goto LABEL_24;
  }
  if (-[BMSystemSettingsMultitasking hasBuddySetup](self, "hasBuddySetup")
    || objc_msgSend(v5, "hasBuddySetup"))
  {
    if (!-[BMSystemSettingsMultitasking hasBuddySetup](self, "hasBuddySetup"))
      goto LABEL_24;
    if (!objc_msgSend(v5, "hasBuddySetup"))
      goto LABEL_24;
    v8 = -[BMSystemSettingsMultitasking buddySetup](self, "buddySetup");
    if (v8 != objc_msgSend(v5, "buddySetup"))
      goto LABEL_24;
  }
  if (-[BMSystemSettingsMultitasking hasBuddySetupMultitaskingOff](self, "hasBuddySetupMultitaskingOff")
    || objc_msgSend(v5, "hasBuddySetupMultitaskingOff"))
  {
    if (!-[BMSystemSettingsMultitasking hasBuddySetupMultitaskingOff](self, "hasBuddySetupMultitaskingOff"))
      goto LABEL_24;
    if (!objc_msgSend(v5, "hasBuddySetupMultitaskingOff"))
      goto LABEL_24;
    v9 = -[BMSystemSettingsMultitasking buddySetupMultitaskingOff](self, "buddySetupMultitaskingOff");
    if (v9 != objc_msgSend(v5, "buddySetupMultitaskingOff"))
      goto LABEL_24;
  }
  -[BMSystemSettingsMultitasking multitaskingOption](self, "multitaskingOption");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "multitaskingOption");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v10 == (void *)v11)
  {

    goto LABEL_29;
  }
  v12 = (void *)v11;
  -[BMSystemSettingsMultitasking multitaskingOption](self, "multitaskingOption");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "multitaskingOption");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqual:", v14);

  if (v15)
  {
LABEL_29:
    -[BMSystemSettingsMultitasking source](self, "source");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "source");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18 == v19)
    {
      v16 = 1;
    }
    else
    {
      -[BMSystemSettingsMultitasking source](self, "source");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "source");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v20, "isEqual:", v21);

    }
    goto LABEL_25;
  }
LABEL_24:
  v16 = 0;
LABEL_25:

LABEL_27:
  return v16;
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

- (BOOL)buddySetup
{
  return self->_buddySetup;
}

- (BOOL)hasBuddySetup
{
  return self->_hasBuddySetup;
}

- (void)setHasBuddySetup:(BOOL)a3
{
  self->_hasBuddySetup = a3;
}

- (BOOL)buddySetupMultitaskingOff
{
  return self->_buddySetupMultitaskingOff;
}

- (BOOL)hasBuddySetupMultitaskingOff
{
  return self->_hasBuddySetupMultitaskingOff;
}

- (void)setHasBuddySetupMultitaskingOff:(BOOL)a3
{
  self->_hasBuddySetupMultitaskingOff = a3;
}

- (NSString)multitaskingOption
{
  return self->_multitaskingOption;
}

- (NSString)source
{
  return self->_source;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_multitaskingOption, 0);
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

    v4 = -[BMSystemSettingsMultitasking initByReadFrom:]([BMSystemSettingsMultitasking alloc], "initByReadFrom:", v7);
    v4[6] = 0;

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
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("buddySetup"), 0, 0, 3, 12, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("buddySetupMultitaskingOff"), 0, 0, 4, 12, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("multitaskingOption"), 2, 0, 5, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("source"), 2, 0, 6, 13, 0);
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
  return &unk_1E5F1DF20;
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
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("buddySetup"), 3, 12, 0);
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("buddySetupMultitaskingOff"), 4, 12, 0);
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("multitaskingOption"), 5, 13, 0);
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("source"), 6, 13, 0);
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
