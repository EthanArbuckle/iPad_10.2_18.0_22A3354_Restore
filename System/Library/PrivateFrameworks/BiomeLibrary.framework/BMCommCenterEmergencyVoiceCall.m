@implementation BMCommCenterEmergencyVoiceCall

- (BMCommCenterEmergencyVoiceCall)initWithEmNum:(id)a3 MCC:(id)a4 MNC:(id)a5 matchedEmNumSource:(int)a6 sip380Procedure:(int)a7 sip380RedirectedURN:(int)a8 callDuration:(id)a9
{
  id v16;
  id v17;
  id v18;
  BMCommCenterEmergencyVoiceCall *v19;
  int v20;
  id v22;
  objc_super v23;

  v22 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a9;
  v23.receiver = self;
  v23.super_class = (Class)BMCommCenterEmergencyVoiceCall;
  v19 = -[BMEventBase init](&v23, sel_init);
  if (v19)
  {
    v19->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v19->_emNum, a3);
    objc_storeStrong((id *)&v19->_MCC, a4);
    objc_storeStrong((id *)&v19->_MNC, a5);
    v19->_matchedEmNumSource = a6;
    v19->_sip380Procedure = a7;
    v19->_sip380RedirectedURN = a8;
    if (v18)
    {
      v19->_hasCallDuration = 1;
      v20 = objc_msgSend(v18, "intValue");
    }
    else
    {
      v19->_hasCallDuration = 0;
      v20 = -1;
    }
    v19->_callDuration = v20;
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
  void *v11;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMCommCenterEmergencyVoiceCall emNum](self, "emNum");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMCommCenterEmergencyVoiceCall MCC](self, "MCC");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMCommCenterEmergencyVoiceCall MNC](self, "MNC");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BMCommCenterEmergencyVoiceCallMatchedEmNumSourceAsString(-[BMCommCenterEmergencyVoiceCall matchedEmNumSource](self, "matchedEmNumSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BMCommCenterEmergencyVoiceCallSIP380ProcedureAsString(-[BMCommCenterEmergencyVoiceCall sip380Procedure](self, "sip380Procedure"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BMCommCenterEmergencyVoiceCallEmergencyURNAsString(-[BMCommCenterEmergencyVoiceCall sip380RedirectedURN](self, "sip380RedirectedURN"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMCommCenterEmergencyVoiceCall callDuration](self, "callDuration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMCommCenterEmergencyVoiceCall with emNum: %@, MCC: %@, MNC: %@, matchedEmNumSource: %@, sip380Procedure: %@, sip380RedirectedURN: %@, callDuration: %@"), v4, v5, v6, v7, v8, v9, v10);

  return (NSString *)v11;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMCommCenterEmergencyVoiceCall *v5;
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
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  uint64_t v44;
  BMCommCenterEmergencyVoiceCall *v45;
  objc_super v47;

  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)BMCommCenterEmergencyVoiceCall;
  v5 = -[BMEventBase init](&v47, sel_init);
  if (!v5)
    goto LABEL_80;
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
                  goto LABEL_57;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_57:
          if (v24 >= 0x12)
            LODWORD(v24) = 0;
          v44 = 24;
          goto LABEL_72;
        case 5u:
          v28 = 0;
          v29 = 0;
          v24 = 0;
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
                  goto LABEL_63;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_63:
          if (v24 >= 5)
            LODWORD(v24) = 0;
          v44 = 28;
          goto LABEL_72;
        case 6u:
          v33 = 0;
          v34 = 0;
          v24 = 0;
          while (2)
          {
            v35 = *v6;
            v36 = *(_QWORD *)&v4[v35];
            if (v36 == -1 || v36 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v36);
              *(_QWORD *)&v4[v35] = v36 + 1;
              v24 |= (unint64_t)(v37 & 0x7F) << v33;
              if (v37 < 0)
              {
                v33 += 7;
                v16 = v34++ >= 9;
                if (v16)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_69;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_69:
          if (v24 >= 7)
            LODWORD(v24) = 0;
          v44 = 32;
LABEL_72:
          *(_DWORD *)((char *)&v5->super.super.isa + v44) = v24;
          continue;
        case 7u:
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v5->_hasCallDuration = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_79;
          continue;
      }
      while (1)
      {
        v41 = *v6;
        v42 = *(_QWORD *)&v4[v41];
        if (v42 == -1 || v42 >= *(_QWORD *)&v4[*v7])
          break;
        v43 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v42);
        *(_QWORD *)&v4[v41] = v42 + 1;
        v40 |= (unint64_t)(v43 & 0x7F) << v38;
        if ((v43 & 0x80) == 0)
          goto LABEL_74;
        v38 += 7;
        v16 = v39++ >= 9;
        if (v16)
        {
          LODWORD(v40) = 0;
          goto LABEL_76;
        }
      }
      v4[*v8] = 1;
LABEL_74:
      if (v4[*v8])
        LODWORD(v40) = 0;
LABEL_76:
      v5->_callDuration = v40;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_79:
    v45 = 0;
  else
LABEL_80:
    v45 = v5;

  return v45;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_emNum)
    PBDataWriterWriteStringField();
  if (self->_MCC)
    PBDataWriterWriteStringField();
  if (self->_MNC)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasCallDuration)
    PBDataWriterWriteInt32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMCommCenterEmergencyVoiceCall writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMCommCenterEmergencyVoiceCall)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id *v16;
  uint64_t v17;
  id *v18;
  uint64_t v19;
  BMCommCenterEmergencyVoiceCall *v20;
  id v21;
  id *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  BMCommCenterEmergencyVoiceCall *v34;
  id v35;
  id v36;
  void *v37;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  uint64_t v48;
  id v49;
  id v50;
  uint64_t v51;
  id v52;
  id *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  _QWORD v78[3];

  v78[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("emNum"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v63 = 0;
LABEL_4:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MCC"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v20 = 0;
          goto LABEL_55;
        }
        v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v22 = a4;
        v23 = *MEMORY[0x1E0D025B8];
        v75 = *MEMORY[0x1E0CB2D50];
        v62 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("MCC"));
        v76 = v62;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v23, 2, v24);
        a4 = 0;
        v20 = 0;
        *v22 = v25;
        goto LABEL_54;
      }
      v53 = a4;
      a4 = v7;
    }
    else
    {
      v53 = a4;
      a4 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MNC"));
    v8 = objc_claimAutoreleasedReturnValue();
    v58 = (void *)v8;
    if (v8 && (v9 = (void *)v8, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v53)
        {
          v62 = 0;
          v20 = 0;
          v24 = v58;
          goto LABEL_54;
        }
        v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v59 = a4;
        v27 = *MEMORY[0x1E0D025B8];
        v73 = *MEMORY[0x1E0CB2D50];
        v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("MNC"));
        v74 = v57;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v27;
        a4 = v59;
        v62 = 0;
        v20 = 0;
        *v53 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v29, 2, v28);
        v24 = v58;
LABEL_53:

LABEL_54:
        goto LABEL_55;
      }
      v62 = v9;
    }
    else
    {
      v62 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("matchedEmNumSource"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v10;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v53)
          {
            v57 = 0;
            v20 = 0;
            v24 = v58;
            v28 = v10;
            goto LABEL_53;
          }
          v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v44 = *MEMORY[0x1E0D025B8];
          v71 = *MEMORY[0x1E0CB2D50];
          v28 = v10;
          v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("matchedEmNumSource"));
          v72 = v61;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
          v45 = objc_claimAutoreleasedReturnValue();
          v46 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v44, 2, v45);
          v57 = 0;
          v20 = 0;
          *v53 = v46;
          v37 = (void *)v45;
          v24 = v58;
          goto LABEL_52;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMCommCenterEmergencyVoiceCallMatchedEmNumSourceFromString(v10));
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sip380Procedure"));
    v12 = objc_claimAutoreleasedReturnValue();
    v54 = v6;
    v55 = v10;
    v56 = (void *)v12;
    v57 = v11;
    if (v12 && (v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v13;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v53)
          {
            v61 = 0;
            v20 = 0;
            goto LABEL_51;
          }
          v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v48 = *MEMORY[0x1E0D025B8];
          v69 = *MEMORY[0x1E0CB2D50];
          v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("sip380Procedure"));
          v70 = v60;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = (id)objc_msgSend(v47, "initWithDomain:code:userInfo:", v48, 2, v30);
          v61 = 0;
          v20 = 0;
          *v53 = v49;
LABEL_50:

          v6 = v54;
LABEL_51:
          v24 = v58;
          v28 = v55;
          v37 = v56;
LABEL_52:

          goto LABEL_53;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMCommCenterEmergencyVoiceCallSIP380ProcedureFromString(v13));
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      v61 = v14;
    }
    else
    {
      v61 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sip380RedirectedURN"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v31 = v30;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v53)
          {
            v60 = 0;
            v20 = 0;
            goto LABEL_50;
          }
          v50 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v51 = *MEMORY[0x1E0D025B8];
          v67 = *MEMORY[0x1E0CB2D50];
          v36 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("sip380RedirectedURN"));
          v68 = v36;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = (id)objc_msgSend(v50, "initWithDomain:code:userInfo:", v51, 2, v32);
          v60 = 0;
          v20 = 0;
          *v53 = v52;
          goto LABEL_49;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMCommCenterEmergencyVoiceCallEmergencyURNFromString(v30));
        v31 = (id)objc_claimAutoreleasedReturnValue();
      }
      v60 = v31;
    }
    else
    {
      v60 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("callDuration"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v53)
        {
          v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v40 = *MEMORY[0x1E0D025B8];
          v65 = *MEMORY[0x1E0CB2D50];
          v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("callDuration"));
          v66 = v41;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *v53 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v40, 2, v42);

        }
        v36 = 0;
        v20 = 0;
        goto LABEL_49;
      }
      v33 = v7;
      v35 = v63;
      v34 = self;
      v36 = v32;
    }
    else
    {
      v33 = v7;
      v35 = v63;
      v34 = self;
      v36 = 0;
    }
    v63 = v35;
    v20 = -[BMCommCenterEmergencyVoiceCall initWithEmNum:MCC:MNC:matchedEmNumSource:sip380Procedure:sip380RedirectedURN:callDuration:](v34, "initWithEmNum:MCC:MNC:matchedEmNumSource:sip380Procedure:sip380RedirectedURN:callDuration:", v35, a4, v62, objc_msgSend(v11, "intValue"), objc_msgSend(v61, "intValue"), objc_msgSend(v60, "intValue"), v36);
    self = v20;
    v7 = v33;
LABEL_49:

    goto LABEL_50;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v63 = v6;
    goto LABEL_4;
  }
  if (!a4)
  {
    v63 = 0;
    v20 = 0;
    goto LABEL_56;
  }
  v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v16 = a4;
  v17 = *MEMORY[0x1E0D025B8];
  v77 = *MEMORY[0x1E0CB2D50];
  v18 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("emNum"));
  v78[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, &v77, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v17;
  a4 = v18;
  v63 = 0;
  v20 = 0;
  *v16 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", v19, 2, v7);
LABEL_55:

LABEL_56:
  return v20;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[7];
  _QWORD v25[9];

  v25[7] = *MEMORY[0x1E0C80C00];
  -[BMCommCenterEmergencyVoiceCall emNum](self, "emNum");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMCommCenterEmergencyVoiceCall MCC](self, "MCC");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMCommCenterEmergencyVoiceCall MNC](self, "MNC");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMCommCenterEmergencyVoiceCall matchedEmNumSource](self, "matchedEmNumSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMCommCenterEmergencyVoiceCall sip380Procedure](self, "sip380Procedure"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMCommCenterEmergencyVoiceCall sip380RedirectedURN](self, "sip380RedirectedURN"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMCommCenterEmergencyVoiceCall hasCallDuration](self, "hasCallDuration"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMCommCenterEmergencyVoiceCall callDuration](self, "callDuration"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v24[0] = CFSTR("emNum");
  v10 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v10;
  v25[0] = v10;
  v24[1] = CFSTR("MCC");
  v11 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v11;
  v25[1] = v11;
  v24[2] = CFSTR("MNC");
  v12 = (uint64_t)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v3;
  v19 = (void *)v12;
  v25[2] = v12;
  v24[3] = CFSTR("matchedEmNumSource");
  v13 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v4;
  v25[3] = v13;
  v24[4] = CFSTR("sip380Procedure");
  v14 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[4] = v14;
  v24[5] = CFSTR("sip380RedirectedURN");
  v15 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[5] = v15;
  v24[6] = CFSTR("callDuration");
  v16 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[6] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (v8)
      goto LABEL_20;
LABEL_28:

    if (v7)
      goto LABEL_21;
    goto LABEL_29;
  }

  if (!v8)
    goto LABEL_28;
LABEL_20:
  if (v7)
    goto LABEL_21;
LABEL_29:

LABEL_21:
  if (!v6)

  if (v5)
  {
    if (v22)
      goto LABEL_25;
LABEL_31:

    if (v23)
      goto LABEL_26;
LABEL_32:

    goto LABEL_26;
  }

  if (!v22)
    goto LABEL_31;
LABEL_25:
  if (!v23)
    goto LABEL_32;
LABEL_26:

  return v17;
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
  int v25;
  int v26;
  int v27;
  int v28;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMCommCenterEmergencyVoiceCall emNum](self, "emNum");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "emNum");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMCommCenterEmergencyVoiceCall emNum](self, "emNum");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "emNum");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_23;
    }
    -[BMCommCenterEmergencyVoiceCall MCC](self, "MCC");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "MCC");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMCommCenterEmergencyVoiceCall MCC](self, "MCC");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "MCC");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_23;
    }
    -[BMCommCenterEmergencyVoiceCall MNC](self, "MNC");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "MNC");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMCommCenterEmergencyVoiceCall MNC](self, "MNC");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "MNC");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_23;
    }
    v25 = -[BMCommCenterEmergencyVoiceCall matchedEmNumSource](self, "matchedEmNumSource");
    if (v25 == objc_msgSend(v5, "matchedEmNumSource"))
    {
      v26 = -[BMCommCenterEmergencyVoiceCall sip380Procedure](self, "sip380Procedure");
      if (v26 == objc_msgSend(v5, "sip380Procedure"))
      {
        v27 = -[BMCommCenterEmergencyVoiceCall sip380RedirectedURN](self, "sip380RedirectedURN");
        if (v27 == objc_msgSend(v5, "sip380RedirectedURN"))
        {
          if (!-[BMCommCenterEmergencyVoiceCall hasCallDuration](self, "hasCallDuration")
            && !objc_msgSend(v5, "hasCallDuration"))
          {
            v12 = 1;
            goto LABEL_24;
          }
          if (-[BMCommCenterEmergencyVoiceCall hasCallDuration](self, "hasCallDuration")
            && objc_msgSend(v5, "hasCallDuration"))
          {
            v28 = -[BMCommCenterEmergencyVoiceCall callDuration](self, "callDuration");
            v12 = v28 == objc_msgSend(v5, "callDuration");
LABEL_24:

            goto LABEL_25;
          }
        }
      }
    }
LABEL_23:
    v12 = 0;
    goto LABEL_24;
  }
  v12 = 0;
LABEL_25:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)emNum
{
  return self->_emNum;
}

- (NSString)MCC
{
  return self->_MCC;
}

- (NSString)MNC
{
  return self->_MNC;
}

- (int)matchedEmNumSource
{
  return self->_matchedEmNumSource;
}

- (int)sip380Procedure
{
  return self->_sip380Procedure;
}

- (int)sip380RedirectedURN
{
  return self->_sip380RedirectedURN;
}

- (int)callDuration
{
  return self->_callDuration;
}

- (BOOL)hasCallDuration
{
  return self->_hasCallDuration;
}

- (void)setHasCallDuration:(BOOL)a3
{
  self->_hasCallDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_MNC, 0);
  objc_storeStrong((id *)&self->_MCC, 0);
  objc_storeStrong((id *)&self->_emNum, 0);
}

+ (unsigned)latestDataVersion
{
  return 2;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  objc_class *v4;
  id v5;
  void *v6;
  _DWORD *v7;

  if (a4 == 2)
  {
    v4 = (objc_class *)MEMORY[0x1E0D82B90];
    v5 = a3;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithData:", v5);

    v7 = -[BMCommCenterEmergencyVoiceCall initByReadFrom:]([BMCommCenterEmergencyVoiceCall alloc], "initByReadFrom:", v6);
    v7[5] = 2;

  }
  else
  {
    v7 = 0;
  }
  return v7;
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
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("emNum"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("MCC"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("MNC"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("matchedEmNumSource"), 0, 0, 4, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sip380Procedure"), 0, 0, 5, 4, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sip380RedirectedURN"), 0, 0, 6, 4, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("callDuration"), 0, 0, 7, 2, 0);
  v11[0] = v2;
  v11[1] = v3;
  v11[2] = v4;
  v11[3] = v5;
  v11[4] = v6;
  v11[5] = v7;
  v11[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1AF50;
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
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("emNum"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("MCC"), 2, 13, 0, v2);
  v11[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("MNC"), 3, 13, 0);
  v11[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("matchedEmNumSource"), 4, 4, 0);
  v11[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sip380Procedure"), 5, 4, 0);
  v11[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sip380RedirectedURN"), 6, 4, 0);
  v11[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("callDuration"), 7, 2, 0);
  v11[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
