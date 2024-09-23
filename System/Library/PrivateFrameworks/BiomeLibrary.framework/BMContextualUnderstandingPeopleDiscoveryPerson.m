@implementation BMContextualUnderstandingPeopleDiscoveryPerson

- (BMContextualUnderstandingPeopleDiscoveryPerson)initWithContactID:(id)a3 identifier:(id)a4 name:(id)a5 flags:(id)a6 activityLevel:(id)a7 proximity:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  BMContextualUnderstandingPeopleDiscoveryPerson *v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  id v25;
  objc_super v26;

  v25 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v26.receiver = self;
  v26.super_class = (Class)BMContextualUnderstandingPeopleDiscoveryPerson;
  v20 = -[BMEventBase init](&v26, sel_init);
  if (v20)
  {
    v20->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v20->_contactID, a3);
    objc_storeStrong((id *)&v20->_identifier, a4);
    objc_storeStrong((id *)&v20->_name, a5);
    if (v17)
    {
      v20->_hasFlags = 1;
      v21 = objc_msgSend(v17, "unsignedIntValue");
    }
    else
    {
      v21 = 0;
      v20->_hasFlags = 0;
    }
    v20->_flags = v21;
    if (v18)
    {
      v20->_hasActivityLevel = 1;
      v22 = objc_msgSend(v18, "unsignedIntValue");
    }
    else
    {
      v22 = 0;
      v20->_hasActivityLevel = 0;
    }
    v20->_activityLevel = v22;
    if (v19)
    {
      v20->_hasProximity = 1;
      v23 = objc_msgSend(v19, "unsignedIntValue");
    }
    else
    {
      v23 = 0;
      v20->_hasProximity = 0;
    }
    v20->_proximity = v23;
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
  -[BMContextualUnderstandingPeopleDiscoveryPerson contactID](self, "contactID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMContextualUnderstandingPeopleDiscoveryPerson identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMContextualUnderstandingPeopleDiscoveryPerson name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMContextualUnderstandingPeopleDiscoveryPerson flags](self, "flags"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMContextualUnderstandingPeopleDiscoveryPerson activityLevel](self, "activityLevel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMContextualUnderstandingPeopleDiscoveryPerson proximity](self, "proximity"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMContextualUnderstandingPeopleDiscoveryPerson with contactID: %@, identifier: %@, name: %@, flags: %@, activityLevel: %@, proximity: %@"), v4, v5, v6, v7, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMContextualUnderstandingPeopleDiscoveryPerson *v5;
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
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t v38;
  BMContextualUnderstandingPeopleDiscoveryPerson *v39;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)BMContextualUnderstandingPeopleDiscoveryPerson;
  v5 = -[BMEventBase init](&v41, sel_init);
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
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 40;
          goto LABEL_25;
        case 2u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 48;
          goto LABEL_25;
        case 3u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 56;
LABEL_25:
          v21 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        case 4u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          v5->_hasFlags = 1;
          while (2)
          {
            v25 = *v6;
            v26 = *(_QWORD *)&v4[v25];
            if (v26 == -1 || v26 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v27 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v26);
              *(_QWORD *)&v4[v25] = v26 + 1;
              v24 |= (unint64_t)(v27 & 0x7F) << v22;
              if (v27 < 0)
              {
                v22 += 7;
                v16 = v23++ >= 9;
                if (v16)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_50;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_50:
          v38 = 24;
          goto LABEL_59;
        case 5u:
          v28 = 0;
          v29 = 0;
          v24 = 0;
          v5->_hasActivityLevel = 1;
          while (2)
          {
            v30 = *v6;
            v31 = *(_QWORD *)&v4[v30];
            if (v31 == -1 || v31 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v32 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v31);
              *(_QWORD *)&v4[v30] = v31 + 1;
              v24 |= (unint64_t)(v32 & 0x7F) << v28;
              if (v32 < 0)
              {
                v28 += 7;
                v16 = v29++ >= 9;
                if (v16)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_54;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_54:
          v38 = 28;
          goto LABEL_59;
        case 6u:
          v33 = 0;
          v34 = 0;
          v24 = 0;
          v5->_hasProximity = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_62;
          continue;
      }
      while (1)
      {
        v35 = *v6;
        v36 = *(_QWORD *)&v4[v35];
        if (v36 == -1 || v36 >= *(_QWORD *)&v4[*v7])
          break;
        v37 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v36);
        *(_QWORD *)&v4[v35] = v36 + 1;
        v24 |= (unint64_t)(v37 & 0x7F) << v33;
        if ((v37 & 0x80) == 0)
          goto LABEL_56;
        v33 += 7;
        v16 = v34++ >= 9;
        if (v16)
        {
          LODWORD(v24) = 0;
          goto LABEL_58;
        }
      }
      v4[*v8] = 1;
LABEL_56:
      if (v4[*v8])
        LODWORD(v24) = 0;
LABEL_58:
      v38 = 32;
LABEL_59:
      *(_DWORD *)((char *)&v5->super.super.isa + v38) = v24;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_62:
    v39 = 0;
  else
LABEL_63:
    v39 = v5;

  return v39;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_contactID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasFlags)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasActivityLevel)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasProximity)
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
  -[BMContextualUnderstandingPeopleDiscoveryPerson writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMContextualUnderstandingPeopleDiscoveryPerson)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  BMContextualUnderstandingPeopleDiscoveryPerson *v19;
  id *v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  id *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id *v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id *v38;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v46;
  id v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  BMContextualUnderstandingPeopleDiscoveryPerson *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD v65[3];

  v65[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contactID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v23 = 0;
          v19 = 0;
          goto LABEL_50;
        }
        v25 = a4;
        v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v27 = v8;
        v28 = *MEMORY[0x1E0D025B8];
        v62 = *MEMORY[0x1E0CB2D50];
        v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("identifier"));
        v63 = v29;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v28;
        v8 = v27;
        v19 = 0;
        v23 = 0;
        *v25 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v30, 2, v10);
        v11 = (id)v29;
        goto LABEL_49;
      }
      v52 = v9;
    }
    else
    {
      v52 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v11 = 0;
          v19 = 0;
          v23 = v52;
          goto LABEL_49;
        }
        v31 = a4;
        v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v33 = v8;
        v34 = *MEMORY[0x1E0D025B8];
        v60 = *MEMORY[0x1E0CB2D50];
        v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("name"));
        v61 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v34;
        v8 = v33;
        v19 = 0;
        *v31 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v35, 2, v12);
        v11 = 0;
LABEL_48:
        v23 = v52;

        self = v53;
LABEL_49:

        v7 = v51;
        goto LABEL_50;
      }
      v11 = v10;
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("flags"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v8;
    v48 = v11;
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v14 = 0;
          v19 = 0;
          goto LABEL_48;
        }
        v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v37 = *MEMORY[0x1E0D025B8];
        v58 = *MEMORY[0x1E0CB2D50];
        v38 = a4;
        v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("flags"));
        v59 = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = (id)objc_msgSend(v36, "initWithDomain:code:userInfo:", v37, 2, v15);
        v19 = 0;
        v14 = 0;
        *v38 = v39;
        goto LABEL_57;
      }
      v13 = a4;
      v14 = v12;
    }
    else
    {
      v13 = a4;
      v14 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("activityLevel"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v14;
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
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("proximity"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v18 = 0;
LABEL_19:
        v11 = v48;
        v19 = -[BMContextualUnderstandingPeopleDiscoveryPerson initWithContactID:identifier:name:flags:activityLevel:proximity:](v53, "initWithContactID:identifier:name:flags:activityLevel:proximity:", v50, v52, v48, v49, v16, v18);
        v53 = v19;
LABEL_46:

        v14 = v49;
LABEL_47:

        v8 = v50;
        goto LABEL_48;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = v17;
        goto LABEL_19;
      }
      if (v13)
      {
        v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v46 = *MEMORY[0x1E0D025B8];
        v54 = *MEMORY[0x1E0CB2D50];
        v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("proximity"));
        v55 = v43;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *v13 = (id)objc_msgSend(v47, "initWithDomain:code:userInfo:", v46, 2, v44);

      }
      v18 = 0;
      v19 = 0;
LABEL_45:
      v11 = v48;
      goto LABEL_46;
    }
    if (v13)
    {
      v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v41 = *MEMORY[0x1E0D025B8];
      v56 = *MEMORY[0x1E0CB2D50];
      v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("activityLevel"));
      v57 = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (id)objc_msgSend(v40, "initWithDomain:code:userInfo:", v41, 2, v17);
      v19 = 0;
      v16 = 0;
      *v13 = v42;
      goto LABEL_45;
    }
    v16 = 0;
    v19 = 0;
LABEL_57:
    v11 = v48;
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
  v64 = *MEMORY[0x1E0CB2D50];
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("contactID"));
  v65[0] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, &v64, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 2, v9);
  v19 = 0;
  v8 = 0;
  *v20 = v24;
LABEL_50:

LABEL_51:
  return v19;
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
  -[BMContextualUnderstandingPeopleDiscoveryPerson contactID](self, "contactID");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMContextualUnderstandingPeopleDiscoveryPerson identifier](self, "identifier");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMContextualUnderstandingPeopleDiscoveryPerson name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMContextualUnderstandingPeopleDiscoveryPerson hasFlags](self, "hasFlags"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMContextualUnderstandingPeopleDiscoveryPerson flags](self, "flags"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (-[BMContextualUnderstandingPeopleDiscoveryPerson hasActivityLevel](self, "hasActivityLevel"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMContextualUnderstandingPeopleDiscoveryPerson activityLevel](self, "activityLevel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if (-[BMContextualUnderstandingPeopleDiscoveryPerson hasProximity](self, "hasProximity"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMContextualUnderstandingPeopleDiscoveryPerson proximity](self, "proximity"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v21[0] = CFSTR("contactID");
  v9 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v17 = v9;
  v19 = (void *)v4;
  v22[0] = v9;
  v21[1] = CFSTR("identifier");
  v10 = (void *)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[1] = v10;
  v21[2] = CFSTR("name");
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v3;
  v22[2] = v11;
  v21[3] = CFSTR("flags");
  v12 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v12;
  v21[4] = CFSTR("activityLevel");
  v13 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[4] = v13;
  v21[5] = CFSTR("proximity");
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
LABEL_31:

    if (v6)
      goto LABEL_25;
    goto LABEL_32;
  }

  if (!v7)
    goto LABEL_31;
LABEL_24:
  if (v6)
    goto LABEL_25;
LABEL_32:

LABEL_25:
  if (!v5)

  if (!v19)
  {

    if (v20)
      goto LABEL_29;
LABEL_34:

    goto LABEL_29;
  }
  if (!v20)
    goto LABEL_34;
LABEL_29:

  return v15;
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
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMContextualUnderstandingPeopleDiscoveryPerson contactID](self, "contactID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contactID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMContextualUnderstandingPeopleDiscoveryPerson contactID](self, "contactID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contactID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_30;
    }
    -[BMContextualUnderstandingPeopleDiscoveryPerson identifier](self, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMContextualUnderstandingPeopleDiscoveryPerson identifier](self, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_30;
    }
    -[BMContextualUnderstandingPeopleDiscoveryPerson name](self, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMContextualUnderstandingPeopleDiscoveryPerson name](self, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_30;
    }
    if (!-[BMContextualUnderstandingPeopleDiscoveryPerson hasFlags](self, "hasFlags")
      && !objc_msgSend(v5, "hasFlags")
      || -[BMContextualUnderstandingPeopleDiscoveryPerson hasFlags](self, "hasFlags")
      && objc_msgSend(v5, "hasFlags")
      && (v25 = -[BMContextualUnderstandingPeopleDiscoveryPerson flags](self, "flags"),
          v25 == objc_msgSend(v5, "flags")))
    {
      if (!-[BMContextualUnderstandingPeopleDiscoveryPerson hasActivityLevel](self, "hasActivityLevel")
        && !objc_msgSend(v5, "hasActivityLevel")
        || -[BMContextualUnderstandingPeopleDiscoveryPerson hasActivityLevel](self, "hasActivityLevel")
        && objc_msgSend(v5, "hasActivityLevel")
        && (v26 = -[BMContextualUnderstandingPeopleDiscoveryPerson activityLevel](self, "activityLevel"),
            v26 == objc_msgSend(v5, "activityLevel")))
      {
        if (!-[BMContextualUnderstandingPeopleDiscoveryPerson hasProximity](self, "hasProximity")
          && !objc_msgSend(v5, "hasProximity"))
        {
          v12 = 1;
          goto LABEL_31;
        }
        if (-[BMContextualUnderstandingPeopleDiscoveryPerson hasProximity](self, "hasProximity")
          && objc_msgSend(v5, "hasProximity"))
        {
          v27 = -[BMContextualUnderstandingPeopleDiscoveryPerson proximity](self, "proximity");
          v12 = v27 == objc_msgSend(v5, "proximity");
LABEL_31:

          goto LABEL_32;
        }
      }
    }
LABEL_30:
    v12 = 0;
    goto LABEL_31;
  }
  v12 = 0;
LABEL_32:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)contactID
{
  return self->_contactID;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)flags
{
  return self->_flags;
}

- (BOOL)hasFlags
{
  return self->_hasFlags;
}

- (void)setHasFlags:(BOOL)a3
{
  self->_hasFlags = a3;
}

- (unsigned)activityLevel
{
  return self->_activityLevel;
}

- (BOOL)hasActivityLevel
{
  return self->_hasActivityLevel;
}

- (void)setHasActivityLevel:(BOOL)a3
{
  self->_hasActivityLevel = a3;
}

- (unsigned)proximity
{
  return self->_proximity;
}

- (BOOL)hasProximity
{
  return self->_hasProximity;
}

- (void)setHasProximity:(BOOL)a3
{
  self->_hasProximity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_contactID, 0);
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

    v4 = -[BMContextualUnderstandingPeopleDiscoveryPerson initByReadFrom:]([BMContextualUnderstandingPeopleDiscoveryPerson alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contactID"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("identifier"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("name"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("flags"), 0, 0, 4, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("activityLevel"), 0, 0, 5, 4, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("proximity"), 0, 0, 6, 4, 0);
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
  return &unk_1E5F1C3F0;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contactID"), 1, 13, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("identifier"), 2, 13, 0);
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("name"), 3, 13, 0);
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("flags"), 4, 4, 0);
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("activityLevel"), 5, 4, 0);
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("proximity"), 6, 4, 0);
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
