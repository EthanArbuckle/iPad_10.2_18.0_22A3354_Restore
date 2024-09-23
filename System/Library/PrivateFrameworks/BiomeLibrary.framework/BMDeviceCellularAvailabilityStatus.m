@implementation BMDeviceCellularAvailabilityStatus

- (BMDeviceCellularAvailabilityStatus)initWithTimeStamp:(id)a3 deviceType:(int)a4 deviceRegistrationStatus:(int)a5
{
  return -[BMDeviceCellularAvailabilityStatus initWithTimeStamp:deviceType:deviceRegistrationStatus:previousDeviceRegistrationStatus:aboveThreshold:latestStrongTimeStamp:](self, "initWithTimeStamp:deviceType:deviceRegistrationStatus:previousDeviceRegistrationStatus:aboveThreshold:latestStrongTimeStamp:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, 0, 0, 0);
}

- (BMDeviceCellularAvailabilityStatus)initWithTimeStamp:(id)a3 deviceType:(int)a4 deviceRegistrationStatus:(int)a5 previousDeviceRegistrationStatus:(int)a6
{
  return -[BMDeviceCellularAvailabilityStatus initWithTimeStamp:deviceType:deviceRegistrationStatus:previousDeviceRegistrationStatus:aboveThreshold:latestStrongTimeStamp:](self, "initWithTimeStamp:deviceType:deviceRegistrationStatus:previousDeviceRegistrationStatus:aboveThreshold:latestStrongTimeStamp:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, 0, 0);
}

- (BMDeviceCellularAvailabilityStatus)initWithTimeStamp:(id)a3 deviceType:(int)a4 deviceRegistrationStatus:(int)a5 previousDeviceRegistrationStatus:(int)a6 aboveThreshold:(id)a7 latestStrongTimeStamp:(id)a8
{
  id v14;
  id v15;
  id v16;
  BMDeviceCellularAvailabilityStatus *v17;
  double v18;
  double v19;
  objc_super v21;

  v14 = a3;
  v15 = a7;
  v16 = a8;
  v21.receiver = self;
  v21.super_class = (Class)BMDeviceCellularAvailabilityStatus;
  v17 = -[BMEventBase init](&v21, sel_init);
  if (v17)
  {
    v17->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v14)
    {
      v17->_hasRaw_timeStamp = 1;
      objc_msgSend(v14, "timeIntervalSince1970");
    }
    else
    {
      v17->_hasRaw_timeStamp = 0;
      v18 = -1.0;
    }
    v17->_raw_timeStamp = v18;
    v17->_deviceType = a4;
    v17->_deviceRegistrationStatus = a5;
    v17->_previousDeviceRegistrationStatus = a6;
    if (v15)
    {
      v17->_hasAboveThreshold = 1;
      v17->_aboveThreshold = objc_msgSend(v15, "BOOLValue");
    }
    else
    {
      v17->_hasAboveThreshold = 0;
      v17->_aboveThreshold = 0;
    }
    if (v16)
    {
      v17->_hasRaw_latestStrongTimeStamp = 1;
      objc_msgSend(v16, "timeIntervalSince1970");
    }
    else
    {
      v17->_hasRaw_latestStrongTimeStamp = 0;
      v19 = -1.0;
    }
    v17->_raw_latestStrongTimeStamp = v19;
  }

  return v17;
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
  -[BMDeviceCellularAvailabilityStatus timeStamp](self, "timeStamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMDeviceCellularAvailabilityStatusDeviceTypeAsString(-[BMDeviceCellularAvailabilityStatus deviceType](self, "deviceType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMDeviceCellularAvailabilityStatusStateAsString(-[BMDeviceCellularAvailabilityStatus deviceRegistrationStatus](self, "deviceRegistrationStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BMDeviceCellularAvailabilityStatusStateAsString(-[BMDeviceCellularAvailabilityStatus previousDeviceRegistrationStatus](self, "previousDeviceRegistrationStatus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMDeviceCellularAvailabilityStatus aboveThreshold](self, "aboveThreshold"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDeviceCellularAvailabilityStatus latestStrongTimeStamp](self, "latestStrongTimeStamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMDeviceCellularAvailabilityStatus with timeStamp: %@, deviceType: %@, deviceRegistrationStatus: %@, previousDeviceRegistrationStatus: %@, aboveThreshold: %@, latestStrongTimeStamp: %@"), v4, v5, v6, v7, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMDeviceCellularAvailabilityStatus *v5;
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
  unint64_t v21;
  objc_class *v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  BMDeviceCellularAvailabilityStatus *v53;
  objc_super v55;

  v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)BMDeviceCellularAvailabilityStatus;
  v5 = -[BMEventBase init](&v55, sel_init);
  if (!v5)
    goto LABEL_87;
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
          v5->_hasRaw_timeStamp = 1;
          v20 = *v6;
          v21 = *(_QWORD *)&v4[v20];
          if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v22 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v21);
            *(_QWORD *)&v4[v20] = v21 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v22 = 0;
          }
          v52 = 24;
          goto LABEL_83;
        case 2u:
          v23 = 0;
          v24 = 0;
          v25 = 0;
          while (2)
          {
            v26 = *v6;
            v27 = *(_QWORD *)&v4[v26];
            v28 = v27 + 1;
            if (v27 == -1 || v28 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v29 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v27);
              *(_QWORD *)&v4[v26] = v28;
              v25 |= (unint64_t)(v29 & 0x7F) << v23;
              if (v29 < 0)
              {
                v23 += 7;
                v17 = v24++ >= 9;
                if (v17)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_59;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v25) = 0;
LABEL_59:
          if (v25 >= 3)
            LODWORD(v25) = 0;
          v51 = 56;
          goto LABEL_74;
        case 3u:
          v30 = 0;
          v31 = 0;
          v25 = 0;
          while (2)
          {
            v32 = *v6;
            v33 = *(_QWORD *)&v4[v32];
            v34 = v33 + 1;
            if (v33 == -1 || v34 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v35 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v33);
              *(_QWORD *)&v4[v32] = v34;
              v25 |= (unint64_t)(v35 & 0x7F) << v30;
              if (v35 < 0)
              {
                v30 += 7;
                v17 = v31++ >= 9;
                if (v17)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_65;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v25) = 0;
LABEL_65:
          if (v25 >= 5)
            LODWORD(v25) = 0;
          v51 = 60;
          goto LABEL_74;
        case 4u:
          v36 = 0;
          v37 = 0;
          v25 = 0;
          while (2)
          {
            v38 = *v6;
            v39 = *(_QWORD *)&v4[v38];
            v40 = v39 + 1;
            if (v39 == -1 || v40 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v41 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v39);
              *(_QWORD *)&v4[v38] = v40;
              v25 |= (unint64_t)(v41 & 0x7F) << v36;
              if (v41 < 0)
              {
                v36 += 7;
                v17 = v37++ >= 9;
                if (v17)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_71;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v25) = 0;
LABEL_71:
          if (v25 >= 5)
            LODWORD(v25) = 0;
          v51 = 64;
LABEL_74:
          *(_DWORD *)((char *)&v5->super.super.isa + v51) = v25;
          continue;
        case 5u:
          v42 = 0;
          v43 = 0;
          v44 = 0;
          v5->_hasAboveThreshold = 1;
          break;
        case 6u:
          v5->_hasRaw_latestStrongTimeStamp = 1;
          v49 = *v6;
          v50 = *(_QWORD *)&v4[v49];
          if (v50 <= 0xFFFFFFFFFFFFFFF7 && v50 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v22 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v50);
            *(_QWORD *)&v4[v49] = v50 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v22 = 0;
          }
          v52 = 40;
LABEL_83:
          *(Class *)((char *)&v5->super.super.isa + v52) = v22;
          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_86;
          continue;
      }
      while (1)
      {
        v45 = *v6;
        v46 = *(_QWORD *)&v4[v45];
        v47 = v46 + 1;
        if (v46 == -1 || v47 > *(_QWORD *)&v4[*v7])
          break;
        v48 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v46);
        *(_QWORD *)&v4[v45] = v47;
        v44 |= (unint64_t)(v48 & 0x7F) << v42;
        if ((v48 & 0x80) == 0)
          goto LABEL_76;
        v42 += 7;
        v17 = v43++ >= 9;
        if (v17)
        {
          v44 = 0;
          goto LABEL_78;
        }
      }
      v4[*v8] = 1;
LABEL_76:
      if (v4[*v8])
        v44 = 0;
LABEL_78:
      v5->_aboveThreshold = v44 != 0;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_86:
    v53 = 0;
  else
LABEL_87:
    v53 = v5;

  return v53;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
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
  -[BMDeviceCellularAvailabilityStatus writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMDeviceCellularAvailabilityStatus)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  id v5;
  void *v6;
  objc_class *v7;
  id v8;
  id v9;
  double v10;
  double v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  objc_class *v25;
  id v26;
  id v27;
  double v28;
  double v29;
  id v30;
  id v31;
  id *v32;
  uint64_t v33;
  id v34;
  BMDeviceCellularAvailabilityStatus *v35;
  id v36;
  id v37;
  uint64_t v38;
  id v39;
  id *v40;
  id v41;
  uint64_t v42;
  id v43;
  id *v44;
  id v45;
  uint64_t v46;
  id v47;
  id *v48;
  id v50;
  uint64_t v51;
  id v52;
  id *v53;
  id *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id v58;
  void *v59;
  void *v60;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  _QWORD v76[3];

  v76[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timeStamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (objc_class *)MEMORY[0x1E0C99D68];
      v8 = v6;
      v9 = [v7 alloc];
      objc_msgSend(v8, "doubleValue");
      v11 = v10;

      v12 = (id)objc_msgSend(v9, "initWithTimeIntervalSince1970:", v11);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
        objc_msgSend(v13, "dateFromString:", v6);
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!p_isa)
        {
          v64 = 0;
          v35 = self;
          goto LABEL_65;
        }
        v50 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v51 = *MEMORY[0x1E0D025B8];
        v75 = *MEMORY[0x1E0CB2D50];
        v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("timeStamp"));
        v76[0] = v63;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, &v75, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = (id)objc_msgSend(v50, "initWithDomain:code:userInfo:", v51, 2, v14);
        v64 = 0;
        v53 = p_isa;
        p_isa = 0;
        *v53 = v52;
        goto LABEL_71;
      }
      v12 = v6;
    }
    v64 = v12;
  }
  else
  {
    v64 = 0;
  }
LABEL_9:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("deviceType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = v14;
LABEL_16:
        v63 = v15;
        goto LABEL_17;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMDeviceCellularAvailabilityStatusDeviceTypeFromString(v14));
        v15 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      if (p_isa)
      {
        v37 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v38 = *MEMORY[0x1E0D025B8];
        v73 = *MEMORY[0x1E0CB2D50];
        v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("deviceType"));
        v74 = v62;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", v38, 2, v16);
        v63 = 0;
        v40 = p_isa;
        p_isa = 0;
        *v40 = v39;
        goto LABEL_73;
      }
      v63 = 0;
LABEL_71:
      v35 = self;
      goto LABEL_64;
    }
  }
  v63 = 0;
LABEL_17:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("deviceRegistrationStatus"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v14;
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = v16;
LABEL_24:
        v62 = v17;
        goto LABEL_25;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMDeviceCellularAvailabilityStatusStateFromString(v16));
        v17 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
      if (p_isa)
      {
        v41 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v42 = *MEMORY[0x1E0D025B8];
        v71 = *MEMORY[0x1E0CB2D50];
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("deviceRegistrationStatus"));
        v72 = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (id)objc_msgSend(v41, "initWithDomain:code:userInfo:", v42, 2, v18);
        v62 = 0;
        v44 = p_isa;
        p_isa = 0;
        *v44 = v43;
        goto LABEL_77;
      }
      v62 = 0;
LABEL_73:
      v35 = self;
      goto LABEL_63;
    }
  }
  v62 = 0;
LABEL_25:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("previousDeviceRegistrationStatus"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v6;
  if (v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = v18;
LABEL_32:
        v19 = v20;
        goto LABEL_33;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMDeviceCellularAvailabilityStatusStateFromString(v18));
        v20 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_32;
      }
      if (p_isa)
      {
        v45 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v46 = *MEMORY[0x1E0D025B8];
        v69 = *MEMORY[0x1E0CB2D50];
        v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("previousDeviceRegistrationStatus"));
        v70 = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = (id)objc_msgSend(v45, "initWithDomain:code:userInfo:", v46, 2, v21);
        v19 = 0;
        v48 = p_isa;
        p_isa = 0;
        *v48 = v47;
        goto LABEL_67;
      }
      v19 = 0;
LABEL_77:
      v35 = self;
      goto LABEL_62;
    }
  }
  v19 = 0;
LABEL_33:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("aboveThreshold"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v22 = 0;
    goto LABEL_36;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (p_isa)
    {
      v31 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v32 = p_isa;
      v33 = *MEMORY[0x1E0D025B8];
      v67 = *MEMORY[0x1E0CB2D50];
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("aboveThreshold"));
      v68 = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (id)objc_msgSend(v31, "initWithDomain:code:userInfo:", v33, 2, v23);
      v22 = 0;
      p_isa = 0;
      *v32 = v34;
      goto LABEL_45;
    }
    v22 = 0;
LABEL_67:
    v35 = self;
    goto LABEL_61;
  }
  v22 = v21;
LABEL_36:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("latestStrongTimeStamp"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v23 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v24 = 0;
LABEL_59:
    v35 = -[BMDeviceCellularAvailabilityStatus initWithTimeStamp:deviceType:deviceRegistrationStatus:previousDeviceRegistrationStatus:aboveThreshold:latestStrongTimeStamp:](self, "initWithTimeStamp:deviceType:deviceRegistrationStatus:previousDeviceRegistrationStatus:aboveThreshold:latestStrongTimeStamp:", v64, objc_msgSend(v63, "intValue"), objc_msgSend(v62, "intValue"), objc_msgSend(v19, "intValue"), v22, v24);
    p_isa = (id *)&v35->super.super.isa;
    goto LABEL_60;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = (objc_class *)MEMORY[0x1E0C99D68];
    v26 = v23;
    v27 = [v25 alloc];
    objc_msgSend(v26, "doubleValue");
    v29 = v28;

    v30 = (id)objc_msgSend(v27, "initWithTimeIntervalSince1970:", v29);
LABEL_58:
    v24 = v30;
    goto LABEL_59;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
    objc_msgSend(v36, "dateFromString:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_59;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = v23;
    goto LABEL_58;
  }
  if (p_isa)
  {
    v58 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v57 = *MEMORY[0x1E0D025B8];
    v65 = *MEMORY[0x1E0CB2D50];
    v54 = p_isa;
    v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("latestStrongTimeStamp"));
    v66 = v55;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    *v54 = (id)objc_msgSend(v58, "initWithDomain:code:userInfo:", v57, 2, v56);

    v24 = 0;
    p_isa = 0;
  }
  else
  {
    v24 = 0;
  }
LABEL_45:
  v35 = self;
LABEL_60:

LABEL_61:
  v6 = v59;
LABEL_62:

  v14 = v60;
LABEL_63:

LABEL_64:
LABEL_65:

  return (BMDeviceCellularAvailabilityStatus *)p_isa;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[6];
  _QWORD v28[7];

  v28[6] = *MEMORY[0x1E0C80C00];
  -[BMDeviceCellularAvailabilityStatus timeStamp](self, "timeStamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMDeviceCellularAvailabilityStatus timeStamp](self, "timeStamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSince1970");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceCellularAvailabilityStatus deviceType](self, "deviceType"));
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceCellularAvailabilityStatus deviceRegistrationStatus](self, "deviceRegistrationStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceCellularAvailabilityStatus previousDeviceRegistrationStatus](self, "previousDeviceRegistrationStatus"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMDeviceCellularAvailabilityStatus hasAboveThreshold](self, "hasAboveThreshold"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMDeviceCellularAvailabilityStatus aboveThreshold](self, "aboveThreshold"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  -[BMDeviceCellularAvailabilityStatus latestStrongTimeStamp](self, "latestStrongTimeStamp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[BMDeviceCellularAvailabilityStatus latestStrongTimeStamp](self, "latestStrongTimeStamp");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSince1970");
    objc_msgSend(v12, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  v26 = (void *)v6;
  v27[0] = CFSTR("timeStamp");
  v15 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v23 = v15;
  v25 = (void *)v7;
  v28[0] = v15;
  v27[1] = CFSTR("deviceType");
  v16 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[1] = v16;
  v27[2] = CFSTR("deviceRegistrationStatus");
  v17 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[2] = v17;
  v27[3] = CFSTR("previousDeviceRegistrationStatus");
  v18 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[3] = v18;
  v27[4] = CFSTR("aboveThreshold");
  v19 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[4] = v19;
  v27[5] = CFSTR("latestStrongTimeStamp");
  v20 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[5] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 6, v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (v10)
      goto LABEL_24;
  }
  else
  {

    if (v10)
    {
LABEL_24:
      if (v9)
        goto LABEL_25;
LABEL_33:

      if (v8)
        goto LABEL_26;
      goto LABEL_34;
    }
  }

  if (!v9)
    goto LABEL_33;
LABEL_25:
  if (v8)
    goto LABEL_26;
LABEL_34:

LABEL_26:
  if (!v25)

  if (!v26)
  return v21;
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
  int v13;
  int v14;
  int v15;
  int v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMDeviceCellularAvailabilityStatus timeStamp](self, "timeStamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeStamp");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMDeviceCellularAvailabilityStatus timeStamp](self, "timeStamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeStamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_15;
    }
    v13 = -[BMDeviceCellularAvailabilityStatus deviceType](self, "deviceType");
    if (v13 == objc_msgSend(v5, "deviceType"))
    {
      v14 = -[BMDeviceCellularAvailabilityStatus deviceRegistrationStatus](self, "deviceRegistrationStatus");
      if (v14 == objc_msgSend(v5, "deviceRegistrationStatus"))
      {
        v15 = -[BMDeviceCellularAvailabilityStatus previousDeviceRegistrationStatus](self, "previousDeviceRegistrationStatus");
        if (v15 == objc_msgSend(v5, "previousDeviceRegistrationStatus"))
        {
          if (!-[BMDeviceCellularAvailabilityStatus hasAboveThreshold](self, "hasAboveThreshold")
            && !objc_msgSend(v5, "hasAboveThreshold")
            || -[BMDeviceCellularAvailabilityStatus hasAboveThreshold](self, "hasAboveThreshold")
            && objc_msgSend(v5, "hasAboveThreshold")
            && (v16 = -[BMDeviceCellularAvailabilityStatus aboveThreshold](self, "aboveThreshold"),
                v16 == objc_msgSend(v5, "aboveThreshold")))
          {
            -[BMDeviceCellularAvailabilityStatus latestStrongTimeStamp](self, "latestStrongTimeStamp");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "latestStrongTimeStamp");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18 == v19)
            {
              v12 = 1;
            }
            else
            {
              -[BMDeviceCellularAvailabilityStatus latestStrongTimeStamp](self, "latestStrongTimeStamp");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "latestStrongTimeStamp");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = objc_msgSend(v20, "isEqual:", v21);

            }
            goto LABEL_16;
          }
        }
      }
    }
LABEL_15:
    v12 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v12 = 0;
LABEL_17:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
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

    v4 = -[BMDeviceCellularAvailabilityStatus initByReadFrom:]([BMDeviceCellularAvailabilityStatus alloc], "initByReadFrom:", v7);
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
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("timeStamp"), 3, 0, 1, 0, 2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("deviceType"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("deviceRegistrationStatus"), 0, 0, 3, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("previousDeviceRegistrationStatus"), 0, 0, 4, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("aboveThreshold"), 0, 0, 5, 12, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("latestStrongTimeStamp"), 3, 0, 6, 0, 2);
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
  return &unk_1E5F1F588;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("timeStamp"), 1, 0, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("deviceType"), 2, 4, 0);
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("deviceRegistrationStatus"), 3, 4, 0);
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("previousDeviceRegistrationStatus"), 4, 4, 0);
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("aboveThreshold"), 5, 12, 0);
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("latestStrongTimeStamp"), 6, 0, 0);
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
