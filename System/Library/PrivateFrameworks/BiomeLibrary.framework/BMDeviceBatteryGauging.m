@implementation BMDeviceBatteryGauging

- (BMDeviceBatteryGauging)initWithUpdateType:(int)a3 qmaxState:(int)a4 daysSinceQMax:(id)a5 ocvState:(int)a6 daysSinceOCV:(id)a7 fullChargeState:(int)a8 daysSinceFullChargeAttempt:(id)a9
{
  id v15;
  id v16;
  id v17;
  BMDeviceBatteryGauging *v18;
  int v19;
  int v20;
  int v21;
  objc_super v23;

  v15 = a5;
  v16 = a7;
  v17 = a9;
  v23.receiver = self;
  v23.super_class = (Class)BMDeviceBatteryGauging;
  v18 = -[BMEventBase init](&v23, sel_init);
  if (v18)
  {
    v18->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v18->_updateType = a3;
    v18->_qmaxState = a4;
    if (v15)
    {
      v18->_hasDaysSinceQMax = 1;
      v19 = objc_msgSend(v15, "intValue");
    }
    else
    {
      v18->_hasDaysSinceQMax = 0;
      v19 = -1;
    }
    v18->_daysSinceQMax = v19;
    v18->_ocvState = a6;
    if (v16)
    {
      v18->_hasDaysSinceOCV = 1;
      v20 = objc_msgSend(v16, "intValue");
    }
    else
    {
      v18->_hasDaysSinceOCV = 0;
      v20 = -1;
    }
    v18->_daysSinceOCV = v20;
    v18->_fullChargeState = a8;
    if (v17)
    {
      v18->_hasDaysSinceFullChargeAttempt = 1;
      v21 = objc_msgSend(v17, "intValue");
    }
    else
    {
      v18->_hasDaysSinceFullChargeAttempt = 0;
      v21 = -1;
    }
    v18->_daysSinceFullChargeAttempt = v21;
  }

  return v18;
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
  BMDeviceBatteryGaugingGaugingUpdateTypeAsString(-[BMDeviceBatteryGauging updateType](self, "updateType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMDeviceBatteryGaugingQMaxStateAsString(-[BMDeviceBatteryGauging qmaxState](self, "qmaxState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceBatteryGauging daysSinceQMax](self, "daysSinceQMax"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BMDeviceBatteryGaugingOCVStateAsString(-[BMDeviceBatteryGauging ocvState](self, "ocvState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceBatteryGauging daysSinceOCV](self, "daysSinceOCV"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BMDeviceBatteryGaugingPeriodicFullChargeStateAsString(-[BMDeviceBatteryGauging fullChargeState](self, "fullChargeState"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceBatteryGauging daysSinceFullChargeAttempt](self, "daysSinceFullChargeAttempt"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMDeviceBatteryGauging with updateType: %@, qmaxState: %@, daysSinceQMax: %@, ocvState: %@, daysSinceOCV: %@, fullChargeState: %@, daysSinceFullChargeAttempt: %@"), v4, v5, v6, v7, v8, v9, v10);

  return (NSString *)v11;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMDeviceBatteryGauging *v5;
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
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  char v40;
  unsigned int v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  char v45;
  unsigned int v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  char v50;
  unsigned int v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  int *v55;
  BMDeviceBatteryGauging *v56;
  objc_super v58;

  v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)BMDeviceBatteryGauging;
  v5 = -[BMEventBase init](&v58, sel_init);
  if (!v5)
    goto LABEL_111;
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
              goto LABEL_72;
            v19 += 7;
            v16 = v20++ >= 9;
            if (v16)
            {
              LODWORD(v21) = 0;
              goto LABEL_74;
            }
          }
          v4[*v8] = 1;
LABEL_72:
          if (v4[*v8])
            LODWORD(v21) = 0;
LABEL_74:
          if (v21 >= 4)
            LODWORD(v21) = 0;
          v55 = &OBJC_IVAR___BMDeviceBatteryGauging__updateType;
          goto LABEL_107;
        case 2u:
          v25 = 0;
          v26 = 0;
          v21 = 0;
          while (2)
          {
            v27 = *v6;
            v28 = *(_QWORD *)&v4[v27];
            if (v28 == -1 || v28 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v29 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v28);
              *(_QWORD *)&v4[v27] = v28 + 1;
              v21 |= (unint64_t)(v29 & 0x7F) << v25;
              if (v29 < 0)
              {
                v25 += 7;
                v16 = v26++ >= 9;
                if (v16)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_80;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v21) = 0;
LABEL_80:
          if (v21 >= 5)
            LODWORD(v21) = 0;
          v55 = &OBJC_IVAR___BMDeviceBatteryGauging__qmaxState;
          goto LABEL_107;
        case 3u:
          v30 = 0;
          v31 = 0;
          v21 = 0;
          v5->_hasDaysSinceQMax = 1;
          while (2)
          {
            v32 = *v6;
            v33 = *(_QWORD *)&v4[v32];
            if (v33 == -1 || v33 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v34 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v33);
              *(_QWORD *)&v4[v32] = v33 + 1;
              v21 |= (unint64_t)(v34 & 0x7F) << v30;
              if (v34 < 0)
              {
                v30 += 7;
                v16 = v31++ >= 9;
                if (v16)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_86;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v21) = 0;
LABEL_86:
          v55 = &OBJC_IVAR___BMDeviceBatteryGauging__daysSinceQMax;
          goto LABEL_107;
        case 4u:
          v35 = 0;
          v36 = 0;
          v21 = 0;
          while (2)
          {
            v37 = *v6;
            v38 = *(_QWORD *)&v4[v37];
            if (v38 == -1 || v38 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v39 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v38);
              *(_QWORD *)&v4[v37] = v38 + 1;
              v21 |= (unint64_t)(v39 & 0x7F) << v35;
              if (v39 < 0)
              {
                v35 += 7;
                v16 = v36++ >= 9;
                if (v16)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_90;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v21) = 0;
LABEL_90:
          if (v21 >= 3)
            LODWORD(v21) = 0;
          v55 = &OBJC_IVAR___BMDeviceBatteryGauging__ocvState;
          goto LABEL_107;
        case 5u:
          v40 = 0;
          v41 = 0;
          v21 = 0;
          v5->_hasDaysSinceOCV = 1;
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
              v21 |= (unint64_t)(v44 & 0x7F) << v40;
              if (v44 < 0)
              {
                v40 += 7;
                v16 = v41++ >= 9;
                if (v16)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_96;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v21) = 0;
LABEL_96:
          v55 = &OBJC_IVAR___BMDeviceBatteryGauging__daysSinceOCV;
          goto LABEL_107;
        case 6u:
          v45 = 0;
          v46 = 0;
          v21 = 0;
          while (2)
          {
            v47 = *v6;
            v48 = *(_QWORD *)&v4[v47];
            if (v48 == -1 || v48 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v49 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v48);
              *(_QWORD *)&v4[v47] = v48 + 1;
              v21 |= (unint64_t)(v49 & 0x7F) << v45;
              if (v49 < 0)
              {
                v45 += 7;
                v16 = v46++ >= 9;
                if (v16)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_100;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v21) = 0;
LABEL_100:
          if (v21 >= 4)
            LODWORD(v21) = 0;
          v55 = &OBJC_IVAR___BMDeviceBatteryGauging__fullChargeState;
          goto LABEL_107;
        case 7u:
          v50 = 0;
          v51 = 0;
          v21 = 0;
          v5->_hasDaysSinceFullChargeAttempt = 1;
          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            goto LABEL_110;
          continue;
      }
      while (1)
      {
        v52 = *v6;
        v53 = *(_QWORD *)&v4[v52];
        if (v53 == -1 || v53 >= *(_QWORD *)&v4[*v7])
          break;
        v54 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v53);
        *(_QWORD *)&v4[v52] = v53 + 1;
        v21 |= (unint64_t)(v54 & 0x7F) << v50;
        if ((v54 & 0x80) == 0)
          goto LABEL_104;
        v50 += 7;
        v16 = v51++ >= 9;
        if (v16)
        {
          LODWORD(v21) = 0;
          goto LABEL_106;
        }
      }
      v4[*v8] = 1;
LABEL_104:
      if (v4[*v8])
        LODWORD(v21) = 0;
LABEL_106:
      v55 = &OBJC_IVAR___BMDeviceBatteryGauging__daysSinceFullChargeAttempt;
LABEL_107:
      *(_DWORD *)((char *)&v5->super.super.isa + *v55) = v21;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_110:
    v56 = 0;
  else
LABEL_111:
    v56 = v5;

  return v56;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasDaysSinceQMax)
    PBDataWriterWriteInt32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasDaysSinceOCV)
    PBDataWriterWriteInt32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasDaysSinceFullChargeAttempt)
    PBDataWriterWriteInt32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMDeviceBatteryGauging writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMDeviceBatteryGauging)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id *v22;
  uint64_t v23;
  id v24;
  BMDeviceBatteryGauging *v25;
  id *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  BMDeviceBatteryGauging *v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v46;
  void *v47;
  id v48;
  id *v49;
  uint64_t v50;
  id v51;
  id v52;
  id *v53;
  uint64_t v54;
  id v55;
  id *v56;
  id v57;
  uint64_t v58;
  id v59;
  id *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  id v79;
  void *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  id v89;
  uint64_t v90;
  id v91;
  uint64_t v92;
  id v93;
  uint64_t v94;
  _QWORD v95[3];

  v95[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("updateType"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v81 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = 0;
LABEL_9:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("qmaxState"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v8;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v25 = 0;
            v9 = 0;
            goto LABEL_56;
          }
          v52 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v53 = a4;
          v54 = *MEMORY[0x1E0D025B8];
          v92 = *MEMORY[0x1E0CB2D50];
          v79 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("qmaxState"));
          v93 = v79;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = (id)objc_msgSend(v52, "initWithDomain:code:userInfo:", v54, 2);
          v25 = 0;
          *v53 = v55;
          v9 = 0;
          goto LABEL_55;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMDeviceBatteryGaugingQMaxStateFromString(v8));
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      v9 = v10;
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("daysSinceQMax"));
    v11 = objc_claimAutoreleasedReturnValue();
    v78 = (void *)v11;
    if (v11 && (v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v79 = 0;
          v25 = 0;
          goto LABEL_55;
        }
        v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v22 = a4;
        v23 = *MEMORY[0x1E0D025B8];
        v90 = *MEMORY[0x1E0CB2D50];
        v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("daysSinceQMax"));
        v91 = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v23, 2);
        v79 = 0;
        v25 = 0;
        *v22 = v24;
LABEL_54:

LABEL_55:
        goto LABEL_56;
      }
      v79 = v12;
    }
    else
    {
      v79 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ocvState"));
    v13 = objc_claimAutoreleasedReturnValue();
    v75 = (void *)v13;
    if (v13 && (v14 = (void *)v13, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = a4;
        v16 = v14;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v16 = 0;
            v25 = 0;
            goto LABEL_54;
          }
          v56 = a4;
          v57 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v58 = *MEMORY[0x1E0D025B8];
          v88 = *MEMORY[0x1E0CB2D50];
          v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("ocvState"));
          v89 = v17;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = (id)objc_msgSend(v57, "initWithDomain:code:userInfo:", v58, 2, v31);
          v16 = 0;
          v25 = 0;
          *v56 = v59;
          goto LABEL_53;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMDeviceBatteryGaugingOCVStateFromString(v14));
        v16 = (id)objc_claimAutoreleasedReturnValue();
        v15 = a4;
      }
    }
    else
    {
      v15 = a4;
      v16 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("daysSinceOCV"));
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v72 = v17;
        v17 = 0;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v15)
          {
            v25 = 0;
            v31 = v17;
            v17 = 0;
            goto LABEL_53;
          }
          v73 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v69 = *MEMORY[0x1E0D025B8];
          v86 = *MEMORY[0x1E0CB2D50];
          v26 = v15;
          v27 = v5;
          v28 = v6;
          v29 = objc_alloc(MEMORY[0x1E0CB3940]);
          v65 = objc_opt_class();
          v30 = v29;
          v6 = v28;
          v5 = v27;
          v31 = v17;
          v76 = (void *)objc_msgSend(v30, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v65, CFSTR("daysSinceOCV"));
          v87 = v76;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 0;
          v25 = 0;
          *v26 = (id)objc_msgSend(v73, "initWithDomain:code:userInfo:", v69, 2, v18);
LABEL_52:

LABEL_53:
          goto LABEL_54;
        }
        v72 = v17;
        v17 = v17;
      }
    }
    else
    {
      v72 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("fullChargeState"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v9;
    if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v68 = v17;
      v19 = v6;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = v18;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v15)
          {
            v76 = 0;
            v25 = 0;
            v31 = v72;
            v17 = v68;
            goto LABEL_52;
          }
          v60 = v15;
          v77 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v61 = v8;
          v62 = *MEMORY[0x1E0D025B8];
          v84 = *MEMORY[0x1E0CB2D50];
          v36 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("fullChargeState"));
          v85 = v36;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = v62;
          v8 = v61;
          v64 = (id)objc_msgSend(v77, "initWithDomain:code:userInfo:", v63, 2, v32);
          v76 = 0;
          v25 = 0;
          *v60 = v64;
          v6 = v19;
          v17 = v68;
          goto LABEL_51;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMDeviceBatteryGaugingPeriodicFullChargeStateFromString(v18));
        v20 = (id)objc_claimAutoreleasedReturnValue();
      }
      v76 = v20;
      v17 = v68;
    }
    else
    {
      v76 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("daysSinceFullChargeAttempt"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v15)
        {
          v71 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v67 = *MEMORY[0x1E0D025B8];
          v82 = *MEMORY[0x1E0CB2D50];
          v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("daysSinceFullChargeAttempt"));
          v83 = v46;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *v15 = (id)objc_msgSend(v71, "initWithDomain:code:userInfo:", v67, 2, v47);

        }
        v36 = 0;
        v25 = 0;
        goto LABEL_51;
      }
      v33 = v18;
      v66 = v32;
      v70 = v8;
      v34 = v5;
      v35 = self;
      v36 = v32;
    }
    else
    {
      v66 = v32;
      v70 = v8;
      v33 = v18;
      v34 = v5;
      v35 = self;
      v36 = 0;
    }
    v37 = objc_msgSend(v6, "intValue");
    v38 = v6;
    v39 = objc_msgSend(v74, "intValue");
    v40 = v16;
    v41 = objc_msgSend(v16, "intValue");
    v42 = objc_msgSend(v76, "intValue");
    v43 = v39;
    v6 = v38;
    v44 = v41;
    v16 = v40;
    v25 = -[BMDeviceBatteryGauging initWithUpdateType:qmaxState:daysSinceQMax:ocvState:daysSinceOCV:fullChargeState:daysSinceFullChargeAttempt:](v35, "initWithUpdateType:qmaxState:daysSinceQMax:ocvState:daysSinceOCV:fullChargeState:daysSinceFullChargeAttempt:", v37, v43, v79, v44, v17, v42, v36);
    self = v25;
    v5 = v34;
    v32 = v66;
    v8 = v70;
    v18 = v33;
LABEL_51:

    v31 = v72;
    v9 = v74;
    goto LABEL_52;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v81;
LABEL_8:
    v6 = v7;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMDeviceBatteryGaugingGaugingUpdateTypeFromString(v81));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!a4)
  {
    v6 = 0;
    v25 = 0;
    goto LABEL_57;
  }
  v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v49 = a4;
  v50 = *MEMORY[0x1E0D025B8];
  v94 = *MEMORY[0x1E0CB2D50];
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("updateType"));
  v95[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v95, &v94, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (id)objc_msgSend(v48, "initWithDomain:code:userInfo:", v50, 2, v8);
  v6 = 0;
  v25 = 0;
  *v49 = v51;
LABEL_56:

LABEL_57:
  return v25;
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
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[7];
  _QWORD v24[9];

  v24[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceBatteryGauging updateType](self, "updateType"));
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceBatteryGauging qmaxState](self, "qmaxState"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (-[BMDeviceBatteryGauging hasDaysSinceQMax](self, "hasDaysSinceQMax"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceBatteryGauging daysSinceQMax](self, "daysSinceQMax"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceBatteryGauging ocvState](self, "ocvState"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMDeviceBatteryGauging hasDaysSinceOCV](self, "hasDaysSinceOCV"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceBatteryGauging daysSinceOCV](self, "daysSinceOCV"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceBatteryGauging fullChargeState](self, "fullChargeState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMDeviceBatteryGauging hasDaysSinceFullChargeAttempt](self, "hasDaysSinceFullChargeAttempt"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceBatteryGauging daysSinceFullChargeAttempt](self, "daysSinceFullChargeAttempt"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v23[0] = CFSTR("updateType");
  v9 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v9;
  v24[0] = v9;
  v23[1] = CFSTR("qmaxState");
  v10 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v3;
  v18 = (void *)v10;
  v24[1] = v10;
  v23[2] = CFSTR("daysSinceQMax");
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v4;
  v24[2] = v11;
  v23[3] = CFSTR("ocvState");
  v12 = v22;
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[3] = v12;
  v23[4] = CFSTR("daysSinceOCV");
  v13 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[4] = v13;
  v23[5] = CFSTR("fullChargeState");
  v14 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[5] = v14;
  v23[6] = CFSTR("daysSinceFullChargeAttempt");
  v15 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[6] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v7)
      goto LABEL_26;
LABEL_35:

    if (v6)
      goto LABEL_27;
    goto LABEL_36;
  }

  if (!v7)
    goto LABEL_35;
LABEL_26:
  if (v6)
    goto LABEL_27;
LABEL_36:

LABEL_27:
  if (!v22)

  if (!v5)
  if (!v20)
  {

    if (v21)
      goto LABEL_33;
LABEL_38:

    goto LABEL_33;
  }
  if (!v21)
    goto LABEL_38;
LABEL_33:

  return v16;
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
  int v11;
  int v12;
  BOOL v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMDeviceBatteryGauging updateType](self, "updateType");
    if (v6 != objc_msgSend(v5, "updateType"))
      goto LABEL_22;
    v7 = -[BMDeviceBatteryGauging qmaxState](self, "qmaxState");
    if (v7 != objc_msgSend(v5, "qmaxState"))
      goto LABEL_22;
    if (-[BMDeviceBatteryGauging hasDaysSinceQMax](self, "hasDaysSinceQMax")
      || objc_msgSend(v5, "hasDaysSinceQMax"))
    {
      if (!-[BMDeviceBatteryGauging hasDaysSinceQMax](self, "hasDaysSinceQMax"))
        goto LABEL_22;
      if (!objc_msgSend(v5, "hasDaysSinceQMax"))
        goto LABEL_22;
      v8 = -[BMDeviceBatteryGauging daysSinceQMax](self, "daysSinceQMax");
      if (v8 != objc_msgSend(v5, "daysSinceQMax"))
        goto LABEL_22;
    }
    v9 = -[BMDeviceBatteryGauging ocvState](self, "ocvState");
    if (v9 != objc_msgSend(v5, "ocvState"))
      goto LABEL_22;
    if (-[BMDeviceBatteryGauging hasDaysSinceOCV](self, "hasDaysSinceOCV")
      || objc_msgSend(v5, "hasDaysSinceOCV"))
    {
      if (!-[BMDeviceBatteryGauging hasDaysSinceOCV](self, "hasDaysSinceOCV"))
        goto LABEL_22;
      if (!objc_msgSend(v5, "hasDaysSinceOCV"))
        goto LABEL_22;
      v10 = -[BMDeviceBatteryGauging daysSinceOCV](self, "daysSinceOCV");
      if (v10 != objc_msgSend(v5, "daysSinceOCV"))
        goto LABEL_22;
    }
    v11 = -[BMDeviceBatteryGauging fullChargeState](self, "fullChargeState");
    if (v11 != objc_msgSend(v5, "fullChargeState"))
      goto LABEL_22;
    if (!-[BMDeviceBatteryGauging hasDaysSinceFullChargeAttempt](self, "hasDaysSinceFullChargeAttempt")
      && !objc_msgSend(v5, "hasDaysSinceFullChargeAttempt"))
    {
      v13 = 1;
      goto LABEL_23;
    }
    if (-[BMDeviceBatteryGauging hasDaysSinceFullChargeAttempt](self, "hasDaysSinceFullChargeAttempt")
      && objc_msgSend(v5, "hasDaysSinceFullChargeAttempt"))
    {
      v12 = -[BMDeviceBatteryGauging daysSinceFullChargeAttempt](self, "daysSinceFullChargeAttempt");
      v13 = v12 == objc_msgSend(v5, "daysSinceFullChargeAttempt");
    }
    else
    {
LABEL_22:
      v13 = 0;
    }
LABEL_23:

    goto LABEL_24;
  }
  v13 = 0;
LABEL_24:

  return v13;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)updateType
{
  return self->_updateType;
}

- (int)qmaxState
{
  return self->_qmaxState;
}

- (int)daysSinceQMax
{
  return self->_daysSinceQMax;
}

- (BOOL)hasDaysSinceQMax
{
  return self->_hasDaysSinceQMax;
}

- (void)setHasDaysSinceQMax:(BOOL)a3
{
  self->_hasDaysSinceQMax = a3;
}

- (int)ocvState
{
  return self->_ocvState;
}

- (int)daysSinceOCV
{
  return self->_daysSinceOCV;
}

- (BOOL)hasDaysSinceOCV
{
  return self->_hasDaysSinceOCV;
}

- (void)setHasDaysSinceOCV:(BOOL)a3
{
  self->_hasDaysSinceOCV = a3;
}

- (int)fullChargeState
{
  return self->_fullChargeState;
}

- (int)daysSinceFullChargeAttempt
{
  return self->_daysSinceFullChargeAttempt;
}

- (BOOL)hasDaysSinceFullChargeAttempt
{
  return self->_hasDaysSinceFullChargeAttempt;
}

- (void)setHasDaysSinceFullChargeAttempt:(BOOL)a3
{
  self->_hasDaysSinceFullChargeAttempt = a3;
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

    v4 = -[BMDeviceBatteryGauging initByReadFrom:]([BMDeviceBatteryGauging alloc], "initByReadFrom:", v7);
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
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("updateType"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("qmaxState"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("daysSinceQMax"), 0, 0, 3, 2, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("ocvState"), 0, 0, 4, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("daysSinceOCV"), 0, 0, 5, 2, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("fullChargeState"), 0, 0, 6, 4, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("daysSinceFullChargeAttempt"), 0, 0, 7, 2, 0);
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
  return &unk_1E5F1F990;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("updateType"), 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("qmaxState"), 2, 4, 0, v2);
  v11[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("daysSinceQMax"), 3, 2, 0);
  v11[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("ocvState"), 4, 4, 0);
  v11[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("daysSinceOCV"), 5, 2, 0);
  v11[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("fullChargeState"), 6, 4, 0);
  v11[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("daysSinceFullChargeAttempt"), 7, 2, 0);
  v11[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
