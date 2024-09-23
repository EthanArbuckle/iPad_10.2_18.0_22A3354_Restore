@implementation BMContextSyncCellularAvailabilityStatus

- (BMContextSyncCellularAvailabilityStatus)initWithID:(id)a3 deviceUUID:(id)a4 timeStamp:(id)a5 deviceType:(int)a6 deviceRegistrationStatus:(int)a7 previousDeviceRegistrationStatus:(int)a8 aboveThreshold:(id)a9 latestStrongTimeStamp:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  BMContextSyncCellularAvailabilityStatus *v21;
  double v22;
  double v23;
  id v25;
  objc_super v26;

  v25 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a9;
  v20 = a10;
  v26.receiver = self;
  v26.super_class = (Class)BMContextSyncCellularAvailabilityStatus;
  v21 = -[BMEventBase init](&v26, sel_init);
  if (v21)
  {
    v21->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v21->_ID, a3);
    objc_storeStrong((id *)&v21->_deviceUUID, a4);
    if (v18)
    {
      v21->_hasRaw_timeStamp = 1;
      objc_msgSend(v18, "timeIntervalSince1970");
    }
    else
    {
      v21->_hasRaw_timeStamp = 0;
      v22 = -1.0;
    }
    v21->_raw_timeStamp = v22;
    v21->_deviceType = a6;
    v21->_deviceRegistrationStatus = a7;
    v21->_previousDeviceRegistrationStatus = a8;
    if (v19)
    {
      v21->_hasAboveThreshold = 1;
      v21->_aboveThreshold = objc_msgSend(v19, "BOOLValue");
    }
    else
    {
      v21->_hasAboveThreshold = 0;
      v21->_aboveThreshold = 0;
    }
    if (v20)
    {
      v21->_hasRaw_latestStrongTimeStamp = 1;
      objc_msgSend(v20, "timeIntervalSince1970");
    }
    else
    {
      v21->_hasRaw_latestStrongTimeStamp = 0;
      v23 = -1.0;
    }
    v21->_raw_latestStrongTimeStamp = v23;
  }

  return v21;
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
  -[BMContextSyncCellularAvailabilityStatus ID](self, "ID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMContextSyncCellularAvailabilityStatus deviceUUID](self, "deviceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMContextSyncCellularAvailabilityStatus timeStamp](self, "timeStamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BMContextSyncCellularAvailabilityStatusDeviceTypeAsString(-[BMContextSyncCellularAvailabilityStatus deviceType](self, "deviceType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BMContextSyncCellularAvailabilityStatusStateAsString(-[BMContextSyncCellularAvailabilityStatus deviceRegistrationStatus](self, "deviceRegistrationStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BMContextSyncCellularAvailabilityStatusStateAsString(-[BMContextSyncCellularAvailabilityStatus previousDeviceRegistrationStatus](self, "previousDeviceRegistrationStatus"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMContextSyncCellularAvailabilityStatus aboveThreshold](self, "aboveThreshold"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMContextSyncCellularAvailabilityStatus latestStrongTimeStamp](self, "latestStrongTimeStamp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMContextSyncCellularAvailabilityStatus with ID: %@, deviceUUID: %@, timeStamp: %@, deviceType: %@, deviceRegistrationStatus: %@, previousDeviceRegistrationStatus: %@, aboveThreshold: %@, latestStrongTimeStamp: %@"), v4, v5, v6, v7, v8, v9, v10, v11);

  return (NSString *)v12;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMContextSyncCellularAvailabilityStatus *v5;
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
  void *v22;
  uint64_t v23;
  unint64_t v24;
  objc_class *v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
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
  unint64_t v43;
  char v44;
  char v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  BMContextSyncCellularAvailabilityStatus *v56;
  objc_super v58;

  v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)BMContextSyncCellularAvailabilityStatus;
  v5 = -[BMEventBase init](&v58, sel_init);
  if (!v5)
    goto LABEL_90;
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
          v21 = 72;
          goto LABEL_24;
        case 2u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 80;
LABEL_24:
          v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 3u:
          v5->_hasRaw_timeStamp = 1;
          v23 = *v6;
          v24 = *(_QWORD *)&v4[v23];
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v25 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v24);
            *(_QWORD *)&v4[v23] = v24 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v25 = 0;
          }
          v55 = 24;
          goto LABEL_86;
        case 4u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
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
              v28 |= (unint64_t)(v32 & 0x7F) << v26;
              if (v32 < 0)
              {
                v26 += 7;
                v17 = v27++ >= 9;
                if (v17)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_62;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v28) = 0;
LABEL_62:
          if (v28 >= 3)
            LODWORD(v28) = 0;
          v54 = 56;
          goto LABEL_77;
        case 5u:
          v33 = 0;
          v34 = 0;
          v28 = 0;
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
              v28 |= (unint64_t)(v38 & 0x7F) << v33;
              if (v38 < 0)
              {
                v33 += 7;
                v17 = v34++ >= 9;
                if (v17)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_68;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v28) = 0;
LABEL_68:
          if (v28 >= 5)
            LODWORD(v28) = 0;
          v54 = 60;
          goto LABEL_77;
        case 6u:
          v39 = 0;
          v40 = 0;
          v28 = 0;
          while (2)
          {
            v41 = *v6;
            v42 = *(_QWORD *)&v4[v41];
            v43 = v42 + 1;
            if (v42 == -1 || v43 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v44 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v42);
              *(_QWORD *)&v4[v41] = v43;
              v28 |= (unint64_t)(v44 & 0x7F) << v39;
              if (v44 < 0)
              {
                v39 += 7;
                v17 = v40++ >= 9;
                if (v17)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_74;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v28) = 0;
LABEL_74:
          if (v28 >= 5)
            LODWORD(v28) = 0;
          v54 = 64;
LABEL_77:
          *(_DWORD *)((char *)&v5->super.super.isa + v54) = v28;
          continue;
        case 7u:
          v45 = 0;
          v46 = 0;
          v47 = 0;
          v5->_hasAboveThreshold = 1;
          break;
        case 8u:
          v5->_hasRaw_latestStrongTimeStamp = 1;
          v52 = *v6;
          v53 = *(_QWORD *)&v4[v52];
          if (v53 <= 0xFFFFFFFFFFFFFFF7 && v53 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v25 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v53);
            *(_QWORD *)&v4[v52] = v53 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v25 = 0;
          }
          v55 = 40;
LABEL_86:
          *(Class *)((char *)&v5->super.super.isa + v55) = v25;
          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_89;
          continue;
      }
      while (1)
      {
        v48 = *v6;
        v49 = *(_QWORD *)&v4[v48];
        v50 = v49 + 1;
        if (v49 == -1 || v50 > *(_QWORD *)&v4[*v7])
          break;
        v51 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v49);
        *(_QWORD *)&v4[v48] = v50;
        v47 |= (unint64_t)(v51 & 0x7F) << v45;
        if ((v51 & 0x80) == 0)
          goto LABEL_79;
        v45 += 7;
        v17 = v46++ >= 9;
        if (v17)
        {
          v47 = 0;
          goto LABEL_81;
        }
      }
      v4[*v8] = 1;
LABEL_79:
      if (v4[*v8])
        v47 = 0;
LABEL_81:
      v5->_aboveThreshold = v47 != 0;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_89:
    v56 = 0;
  else
LABEL_90:
    v56 = v5;

  return v56;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_ID)
    PBDataWriterWriteStringField();
  if (self->_deviceUUID)
    PBDataWriterWriteStringField();
  if (self->_hasRaw_timeStamp)
    PBDataWriterWriteDoubleField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasAboveThreshold)
    PBDataWriterWriteBOOLField();
  if (self->_hasRaw_latestStrongTimeStamp)
    PBDataWriterWriteDoubleField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMContextSyncCellularAvailabilityStatus writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMContextSyncCellularAvailabilityStatus)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  objc_class *v15;
  id v16;
  id v17;
  double v18;
  double v19;
  id v20;
  id v21;
  id *v22;
  uint64_t v23;
  id *v24;
  uint64_t v25;
  id v26;
  BMContextSyncCellularAvailabilityStatus *v27;
  id v28;
  id *v29;
  uint64_t v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  BMContextSyncCellularAvailabilityStatus *v37;
  void *v38;
  objc_class *v39;
  id v40;
  id v41;
  double v42;
  double v43;
  id v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  id v50;
  uint64_t v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  void *v75;
  void *v76;
  id *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  id *v85;
  id v86;
  id v87;
  id v88;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  id v102;
  uint64_t v103;
  id v104;
  uint64_t v105;
  _QWORD v106[3];

  v106[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ID"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v90 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v90;
LABEL_4:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("deviceUUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v77 = a4;
      a4 = 0;
LABEL_7:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timeStamp"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = (objc_class *)MEMORY[0x1E0C99D68];
          v16 = v8;
          v17 = [v15 alloc];
          objc_msgSend(v16, "doubleValue");
          v19 = v18;

          v87 = (id)objc_msgSend(v17, "initWithTimeIntervalSince1970:", v19);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v32 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
            objc_msgSend(v32, "dateFromString:", v8);
            v87 = (id)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v77)
              {
                v87 = 0;
                v27 = 0;
                goto LABEL_78;
              }
              v69 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v85 = a4;
              v70 = *MEMORY[0x1E0D025B8];
              v101 = *MEMORY[0x1E0CB2D50];
              v88 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("timeStamp"));
              v102 = v88;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
              v71 = objc_claimAutoreleasedReturnValue();
              v72 = v70;
              a4 = v85;
              v83 = (void *)v71;
              v87 = 0;
              v27 = 0;
              *v77 = (id)objc_msgSend(v69, "initWithDomain:code:userInfo:", v72, 2);
              goto LABEL_77;
            }
            v87 = v8;
          }
        }
      }
      else
      {
        v87 = 0;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("deviceType"));
      v9 = objc_claimAutoreleasedReturnValue();
      v82 = v8;
      v83 = (void *)v9;
      if (v9 && (v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = a4;
          v88 = v10;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v77)
            {
              v88 = 0;
              v27 = 0;
              goto LABEL_77;
            }
            v50 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v51 = *MEMORY[0x1E0D025B8];
            v99 = *MEMORY[0x1E0CB2D50];
            v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("deviceType"));
            v100 = v14;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = (id)objc_msgSend(v50, "initWithDomain:code:userInfo:", v51, 2, v52);
            v88 = 0;
            v27 = 0;
            *v77 = v53;
LABEL_76:

LABEL_77:
            goto LABEL_78;
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMContextSyncCellularAvailabilityStatusDeviceTypeFromString(v10));
          v88 = (id)objc_claimAutoreleasedReturnValue();
          v11 = a4;
        }
      }
      else
      {
        v11 = a4;
        v88 = 0;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("deviceRegistrationStatus"));
      v12 = objc_claimAutoreleasedReturnValue();
      v86 = v6;
      v80 = v7;
      v81 = (void *)v12;
      if (v12 && (v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20 = v13;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v77)
            {
              v14 = 0;
              v27 = 0;
              v52 = v81;
              a4 = v11;
              goto LABEL_76;
            }
            v54 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v55 = v8;
            v56 = *MEMORY[0x1E0D025B8];
            v97 = *MEMORY[0x1E0CB2D50];
            v57 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("deviceRegistrationStatus"));
            v98 = v57;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = v56;
            v8 = v55;
            v60 = (void *)v57;
            v61 = (id)objc_msgSend(v54, "initWithDomain:code:userInfo:", v59, 2, v58);
            v14 = 0;
            v27 = 0;
            *v77 = v61;
            a4 = v11;
            goto LABEL_75;
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMContextSyncCellularAvailabilityStatusStateFromString(v13));
          v20 = (id)objc_claimAutoreleasedReturnValue();
        }
        v14 = v20;
      }
      else
      {
        v14 = 0;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("previousDeviceRegistrationStatus"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      a4 = v11;
      if (v33 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v34 = v33;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v62 = v33;
            v60 = v77;
            if (!v77)
            {
              v27 = 0;
              v58 = v62;
              goto LABEL_75;
            }
            v63 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v64 = v8;
            v65 = *MEMORY[0x1E0D025B8];
            v95 = *MEMORY[0x1E0CB2D50];
            v84 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("previousDeviceRegistrationStatus"));
            v96 = v84;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = v65;
            v8 = v64;
            v67 = (id)objc_msgSend(v63, "initWithDomain:code:userInfo:", v66, 2, v35);
            v27 = 0;
            *v77 = v67;
            v60 = 0;
            v58 = v62;
LABEL_74:

LABEL_75:
            v6 = v86;
            v7 = v80;
            v52 = v81;
            goto LABEL_76;
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMContextSyncCellularAvailabilityStatusStateFromString(v33));
          v34 = (id)objc_claimAutoreleasedReturnValue();
        }
        v78 = v34;
      }
      else
      {
        v78 = 0;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("aboveThreshold"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = v33;
      if (v35 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v77)
          {
            v84 = 0;
            v27 = 0;
            v60 = v78;
            v58 = v79;
            goto LABEL_74;
          }
          v45 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v46 = v14;
          v47 = *MEMORY[0x1E0D025B8];
          v93 = *MEMORY[0x1E0CB2D50];
          v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("aboveThreshold"));
          v94 = v38;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v47;
          v14 = v46;
          v84 = 0;
          v27 = 0;
          *v77 = (id)objc_msgSend(v45, "initWithDomain:code:userInfo:", v48, 2, v36);
          goto LABEL_89;
        }
        v84 = v35;
      }
      else
      {
        v84 = 0;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("latestStrongTimeStamp"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v36 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v37 = self;
        v38 = 0;
LABEL_72:
        v60 = v78;
        v27 = -[BMContextSyncCellularAvailabilityStatus initWithID:deviceUUID:timeStamp:deviceType:deviceRegistrationStatus:previousDeviceRegistrationStatus:aboveThreshold:latestStrongTimeStamp:](v37, "initWithID:deviceUUID:timeStamp:deviceType:deviceRegistrationStatus:previousDeviceRegistrationStatus:aboveThreshold:latestStrongTimeStamp:", v86, v11, v87, objc_msgSend(v88, "intValue"), objc_msgSend(v14, "intValue"), objc_msgSend(v78, "intValue"), v84, v38);
        self = v27;
LABEL_73:

        v8 = v82;
        v58 = v79;
        goto LABEL_74;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v37 = self;
        v39 = (objc_class *)MEMORY[0x1E0C99D68];
        v40 = v36;
        v41 = [v39 alloc];
        objc_msgSend(v40, "doubleValue");
        v43 = v42;

        v44 = (id)objc_msgSend(v41, "initWithTimeIntervalSince1970:", v43);
LABEL_71:
        v38 = v44;
        goto LABEL_72;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v37 = self;
        v49 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
        objc_msgSend(v49, "dateFromString:", v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_72;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v37 = self;
        v44 = v36;
        goto LABEL_71;
      }
      if (v77)
      {
        v73 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v74 = *MEMORY[0x1E0D025B8];
        v91 = *MEMORY[0x1E0CB2D50];
        v75 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("latestStrongTimeStamp"));
        v92 = v75;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        *v77 = (id)objc_msgSend(v73, "initWithDomain:code:userInfo:", v74, 2, v76);

      }
      v38 = 0;
      v27 = 0;
LABEL_89:
      v60 = v78;
      goto LABEL_73;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v77 = a4;
      a4 = v7;
      goto LABEL_7;
    }
    if (a4)
    {
      v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v29 = a4;
      v30 = *MEMORY[0x1E0D025B8];
      v103 = *MEMORY[0x1E0CB2D50];
      v87 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("deviceUUID"));
      v104 = v87;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v30, 2, v8);
      a4 = 0;
      v27 = 0;
      *v29 = v31;
LABEL_78:

      goto LABEL_79;
    }
    v27 = 0;
LABEL_79:

    goto LABEL_80;
  }
  if (a4)
  {
    v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v22 = a4;
    v23 = *MEMORY[0x1E0D025B8];
    v105 = *MEMORY[0x1E0CB2D50];
    v24 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("ID"));
    v106[0] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, &v105, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v23;
    a4 = v24;
    v26 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v25, 2, v7);
    v6 = 0;
    v27 = 0;
    *v22 = v26;
    goto LABEL_79;
  }
  v6 = 0;
  v27 = 0;
LABEL_80:

  return v27;
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[8];
  _QWORD v33[10];

  v33[8] = *MEMORY[0x1E0C80C00];
  -[BMContextSyncCellularAvailabilityStatus ID](self, "ID");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMContextSyncCellularAvailabilityStatus deviceUUID](self, "deviceUUID");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMContextSyncCellularAvailabilityStatus timeStamp](self, "timeStamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMContextSyncCellularAvailabilityStatus timeStamp](self, "timeStamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSince1970");
    objc_msgSend(v6, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMContextSyncCellularAvailabilityStatus deviceType](self, "deviceType"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMContextSyncCellularAvailabilityStatus deviceRegistrationStatus](self, "deviceRegistrationStatus"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMContextSyncCellularAvailabilityStatus previousDeviceRegistrationStatus](self, "previousDeviceRegistrationStatus"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMContextSyncCellularAvailabilityStatus hasAboveThreshold](self, "hasAboveThreshold"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMContextSyncCellularAvailabilityStatus aboveThreshold](self, "aboveThreshold"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  -[BMContextSyncCellularAvailabilityStatus latestStrongTimeStamp](self, "latestStrongTimeStamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[BMContextSyncCellularAvailabilityStatus latestStrongTimeStamp](self, "latestStrongTimeStamp");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSince1970");
    objc_msgSend(v11, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  v32[0] = CFSTR("ID");
  v14 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v14;
  v33[0] = v14;
  v32[1] = CFSTR("deviceUUID");
  v15 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v15;
  v33[1] = v15;
  v32[2] = CFSTR("timeStamp");
  v16 = (uint64_t)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v16;
  v33[2] = v16;
  v32[3] = CFSTR("deviceType");
  v17 = v31;
  if (!v31)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v3;
  v33[3] = v17;
  v32[4] = CFSTR("deviceRegistrationStatus");
  v18 = v30;
  if (!v30)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v4;
  v33[4] = v18;
  v32[5] = CFSTR("previousDeviceRegistrationStatus");
  v20 = v29;
  if (!v29)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33[5] = v20;
  v32[6] = CFSTR("aboveThreshold");
  v21 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33[6] = v21;
  v32[7] = CFSTR("latestStrongTimeStamp");
  v22 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33[7] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (v9)
      goto LABEL_28;
  }
  else
  {

    if (v9)
      goto LABEL_28;
  }

LABEL_28:
  if (!v29)

  if (!v30)
  if (v31)
  {
    if (v8)
      goto LABEL_34;
  }
  else
  {

    if (v8)
    {
LABEL_34:
      if (v19)
        goto LABEL_35;
LABEL_41:

      if (v28)
        goto LABEL_36;
LABEL_42:

      goto LABEL_36;
    }
  }

  if (!v19)
    goto LABEL_41;
LABEL_35:
  if (!v28)
    goto LABEL_42;
LABEL_36:

  return v23;
}

- (NSDate)timeStamp
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_timeStamp)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_timeStamp);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (NSDate)latestStrongTimeStamp
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_latestStrongTimeStamp)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_latestStrongTimeStamp);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
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
  char v12;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMContextSyncCellularAvailabilityStatus ID](self, "ID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMContextSyncCellularAvailabilityStatus ID](self, "ID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_23;
    }
    -[BMContextSyncCellularAvailabilityStatus deviceUUID](self, "deviceUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceUUID");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMContextSyncCellularAvailabilityStatus deviceUUID](self, "deviceUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deviceUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_23;
    }
    -[BMContextSyncCellularAvailabilityStatus timeStamp](self, "timeStamp");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeStamp");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMContextSyncCellularAvailabilityStatus timeStamp](self, "timeStamp");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeStamp");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_23;
    }
    v25 = -[BMContextSyncCellularAvailabilityStatus deviceType](self, "deviceType");
    if (v25 == objc_msgSend(v5, "deviceType"))
    {
      v26 = -[BMContextSyncCellularAvailabilityStatus deviceRegistrationStatus](self, "deviceRegistrationStatus");
      if (v26 == objc_msgSend(v5, "deviceRegistrationStatus"))
      {
        v27 = -[BMContextSyncCellularAvailabilityStatus previousDeviceRegistrationStatus](self, "previousDeviceRegistrationStatus");
        if (v27 == objc_msgSend(v5, "previousDeviceRegistrationStatus"))
        {
          if (!-[BMContextSyncCellularAvailabilityStatus hasAboveThreshold](self, "hasAboveThreshold")
            && !objc_msgSend(v5, "hasAboveThreshold")
            || -[BMContextSyncCellularAvailabilityStatus hasAboveThreshold](self, "hasAboveThreshold")
            && objc_msgSend(v5, "hasAboveThreshold")
            && (v28 = -[BMContextSyncCellularAvailabilityStatus aboveThreshold](self, "aboveThreshold"),
                v28 == objc_msgSend(v5, "aboveThreshold")))
          {
            -[BMContextSyncCellularAvailabilityStatus latestStrongTimeStamp](self, "latestStrongTimeStamp");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "latestStrongTimeStamp");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (v30 == v31)
            {
              v12 = 1;
            }
            else
            {
              -[BMContextSyncCellularAvailabilityStatus latestStrongTimeStamp](self, "latestStrongTimeStamp");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "latestStrongTimeStamp");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = objc_msgSend(v32, "isEqual:", v33);

            }
            goto LABEL_24;
          }
        }
      }
    }
LABEL_23:
    v12 = 0;
LABEL_24:

    goto LABEL_25;
  }
  v12 = 0;
LABEL_25:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)ID
{
  return self->_ID;
}

- (NSString)deviceUUID
{
  return self->_deviceUUID;
}

- (int)deviceType
{
  return self->_deviceType;
}

- (int)deviceRegistrationStatus
{
  return self->_deviceRegistrationStatus;
}

- (int)previousDeviceRegistrationStatus
{
  return self->_previousDeviceRegistrationStatus;
}

- (BOOL)aboveThreshold
{
  return self->_aboveThreshold;
}

- (BOOL)hasAboveThreshold
{
  return self->_hasAboveThreshold;
}

- (void)setHasAboveThreshold:(BOOL)a3
{
  self->_hasAboveThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUUID, 0);
  objc_storeStrong((id *)&self->_ID, 0);
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

    v4 = -[BMContextSyncCellularAvailabilityStatus initByReadFrom:]([BMContextSyncCellularAvailabilityStatus alloc], "initByReadFrom:", v7);
    v4[13] = 0;

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
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("ID"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("deviceUUID"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("timeStamp"), 3, 0, 3, 0, 2);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("deviceType"), 0, 0, 4, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("deviceRegistrationStatus"), 0, 0, 5, 4, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("previousDeviceRegistrationStatus"), 0, 0, 6, 4, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("aboveThreshold"), 0, 0, 7, 12, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("latestStrongTimeStamp"), 3, 0, 8, 0, 2);
  v12[0] = v2;
  v12[1] = v3;
  v12[2] = v4;
  v12[3] = v5;
  v12[4] = v6;
  v12[5] = v7;
  v12[6] = v8;
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1AA70;
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
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("ID"), 1, 13, 0);
  v12[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("deviceUUID"), 2, 13, 0);
  v12[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("timeStamp"), 3, 0, 0);
  v12[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("deviceType"), 4, 4, 0);
  v12[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("deviceRegistrationStatus"), 5, 4, 0);
  v12[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("previousDeviceRegistrationStatus"), 6, 4, 0);
  v12[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("aboveThreshold"), 7, 12, 0);
  v12[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("latestStrongTimeStamp"), 8, 0, 0);
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BMContextSyncCellularAvailabilityStatus)initWithID:(id)a3 deviceUUID:(id)a4 timeStamp:(id)a5 deviceType:(int)a6 deviceRegistrationStatus:(int)a7 previousDeviceRegistrationStatus:(int)a8
{
  return -[BMContextSyncCellularAvailabilityStatus initWithID:deviceUUID:timeStamp:deviceType:deviceRegistrationStatus:previousDeviceRegistrationStatus:aboveThreshold:latestStrongTimeStamp:](self, "initWithID:deviceUUID:timeStamp:deviceType:deviceRegistrationStatus:previousDeviceRegistrationStatus:aboveThreshold:latestStrongTimeStamp:", a3, a4, a5, *(_QWORD *)&a6, *(_QWORD *)&a7, *(_QWORD *)&a8, 0, 0);
}

@end
