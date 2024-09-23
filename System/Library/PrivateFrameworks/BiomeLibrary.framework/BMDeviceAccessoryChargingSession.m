@implementation BMDeviceAccessoryChargingSession

- (BMDeviceAccessoryChargingSession)initWithProductID:(id)a3 firmwareVersion:(id)a4 startTimestamp:(id)a5 endTimestamp:(id)a6 side:(int)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  BMDeviceAccessoryChargingSession *v16;
  unsigned int v17;
  unsigned int v18;
  double v19;
  double v20;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v22.receiver = self;
  v22.super_class = (Class)BMDeviceAccessoryChargingSession;
  v16 = -[BMEventBase init](&v22, sel_init);
  if (v16)
  {
    v16->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v12)
    {
      v16->_hasProductID = 1;
      v17 = objc_msgSend(v12, "unsignedIntValue");
    }
    else
    {
      v17 = 0;
      v16->_hasProductID = 0;
    }
    v16->_productID = v17;
    if (v13)
    {
      v16->_hasFirmwareVersion = 1;
      v18 = objc_msgSend(v13, "unsignedIntValue");
    }
    else
    {
      v18 = 0;
      v16->_hasFirmwareVersion = 0;
    }
    v16->_firmwareVersion = v18;
    if (v14)
    {
      v16->_hasStartTimestamp = 1;
      objc_msgSend(v14, "doubleValue");
    }
    else
    {
      v16->_hasStartTimestamp = 0;
      v19 = -1.0;
    }
    v16->_startTimestamp = v19;
    if (v15)
    {
      v16->_hasEndTimestamp = 1;
      objc_msgSend(v15, "doubleValue");
    }
    else
    {
      v16->_hasEndTimestamp = 0;
      v20 = -1.0;
    }
    v16->_endTimestamp = v20;
    v16->_side = a7;
  }

  return v16;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAccessoryChargingSession productID](self, "productID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAccessoryChargingSession firmwareVersion](self, "firmwareVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[BMDeviceAccessoryChargingSession startTimestamp](self, "startTimestamp");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[BMDeviceAccessoryChargingSession endTimestamp](self, "endTimestamp");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  BMDeviceAccessoryChargingSessionSideAsString(-[BMDeviceAccessoryChargingSession side](self, "side"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMDeviceAccessoryChargingSession with productID: %@, firmwareVersion: %@, startTimestamp: %@, endTimestamp: %@, side: %@"), v4, v5, v7, v9, v10);

  return (NSString *)v11;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMDeviceAccessoryChargingSession *v5;
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
  uint64_t v33;
  unint64_t v34;
  objc_class *v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  BMDeviceAccessoryChargingSession *v47;
  objc_super v49;

  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)BMDeviceAccessoryChargingSession;
  v5 = -[BMEventBase init](&v49, sel_init);
  if (!v5)
    goto LABEL_72;
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
          v5->_hasProductID = 1;
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
              goto LABEL_50;
            v20 += 7;
            v17 = v21++ >= 9;
            if (v17)
            {
              LODWORD(v22) = 0;
              goto LABEL_52;
            }
          }
          v4[*v8] = 1;
LABEL_50:
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_52:
          v45 = 24;
          goto LABEL_57;
        case 2u:
          v27 = 0;
          v28 = 0;
          v22 = 0;
          v5->_hasFirmwareVersion = 1;
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
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_56:
          v45 = 28;
LABEL_57:
          *(_DWORD *)((char *)&v5->super.super.isa + v45) = v22;
          continue;
        case 3u:
          v5->_hasStartTimestamp = 1;
          v33 = *v6;
          v34 = *(_QWORD *)&v4[v33];
          if (v34 <= 0xFFFFFFFFFFFFFFF7 && v34 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v35 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v34);
            *(_QWORD *)&v4[v33] = v34 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v35 = 0;
          }
          v46 = 40;
          goto LABEL_68;
        case 4u:
          v5->_hasEndTimestamp = 1;
          v36 = *v6;
          v37 = *(_QWORD *)&v4[v36];
          if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v35 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v37);
            *(_QWORD *)&v4[v36] = v37 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v35 = 0;
          }
          v46 = 48;
LABEL_68:
          *(Class *)((char *)&v5->super.super.isa + v46) = v35;
          continue;
        case 5u:
          v38 = 0;
          v39 = 0;
          v40 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_71;
          continue;
      }
      while (1)
      {
        v41 = *v6;
        v42 = *(_QWORD *)&v4[v41];
        v43 = v42 + 1;
        if (v42 == -1 || v43 > *(_QWORD *)&v4[*v7])
          break;
        v44 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v42);
        *(_QWORD *)&v4[v41] = v43;
        v40 |= (unint64_t)(v44 & 0x7F) << v38;
        if ((v44 & 0x80) == 0)
          goto LABEL_59;
        v38 += 7;
        v17 = v39++ >= 9;
        if (v17)
        {
          LODWORD(v40) = 0;
          goto LABEL_61;
        }
      }
      v4[*v8] = 1;
LABEL_59:
      if (v4[*v8])
        LODWORD(v40) = 0;
LABEL_61:
      if (v40 >= 3)
        LODWORD(v40) = 0;
      v5->_side = v40;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_71:
    v47 = 0;
  else
LABEL_72:
    v47 = v5;

  return v47;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_hasProductID)
    PBDataWriterWriteUint32Field();
  if (self->_hasFirmwareVersion)
    PBDataWriterWriteUint32Field();
  if (self->_hasStartTimestamp)
    PBDataWriterWriteDoubleField();
  if (self->_hasEndTimestamp)
    PBDataWriterWriteDoubleField();
  PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMDeviceAccessoryChargingSession writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMDeviceAccessoryChargingSession)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id *v17;
  id v18;
  uint64_t v19;
  BMDeviceAccessoryChargingSession *v20;
  id v21;
  uint64_t v22;
  id *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id *v27;
  id v28;
  void *v30;
  void *v31;
  uint64_t v32;
  id *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  BMDeviceAccessoryChargingSession *v38;
  id v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  _QWORD v49[3];

  v49[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("productID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("firmwareVersion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v39 = 0;
          v20 = 0;
          goto LABEL_41;
        }
        v33 = a4;
        v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v22 = *MEMORY[0x1E0D025B8];
        v46 = *MEMORY[0x1E0CB2D50];
        v37 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("firmwareVersion"));
        v47 = v37;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 0;
        v20 = 0;
        *v33 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 2, v10);
        goto LABEL_40;
      }
      v39 = v9;
    }
    else
    {
      v39 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("startTimestamp"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v8;
    v38 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v37 = 0;
          v20 = 0;
          goto LABEL_40;
        }
        v23 = a4;
        v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v25 = *MEMORY[0x1E0D025B8];
        v44 = *MEMORY[0x1E0CB2D50];
        v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("startTimestamp"));
        v45 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 0;
        v20 = 0;
        *v23 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v25, 2, v11);
LABEL_39:

        self = v38;
        v8 = v36;
LABEL_40:

        goto LABEL_41;
      }
      v37 = v10;
    }
    else
    {
      v37 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("endTimestamp"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v13 = 0;
          v20 = 0;
          goto LABEL_39;
        }
        v34 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v26 = *MEMORY[0x1E0D025B8];
        v42 = *MEMORY[0x1E0CB2D50];
        v27 = a4;
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("endTimestamp"));
        v43 = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (id)objc_msgSend(v34, "initWithDomain:code:userInfo:", v26, 2, v14);
        v13 = 0;
        v20 = 0;
        *v27 = v28;
        goto LABEL_38;
      }
      v12 = a4;
      v13 = v11;
    }
    else
    {
      v12 = a4;
      v13 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("side"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = v14;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v12)
          {
            v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v32 = *MEMORY[0x1E0D025B8];
            v40 = *MEMORY[0x1E0CB2D50];
            v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("side"));
            v41 = v30;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *v12 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v32, 2, v31);

          }
          v15 = 0;
          v20 = 0;
          goto LABEL_38;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMDeviceAccessoryChargingSessionSideFromString(v14));
        v16 = (id)objc_claimAutoreleasedReturnValue();
      }
      v15 = v16;
    }
    else
    {
      v15 = 0;
    }
    v20 = -[BMDeviceAccessoryChargingSession initWithProductID:firmwareVersion:startTimestamp:endTimestamp:side:](v38, "initWithProductID:firmwareVersion:startTimestamp:endTimestamp:side:", v36, v39, v37, v13, objc_msgSend(v15, "intValue"));
    v38 = v20;
LABEL_38:

    goto LABEL_39;
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
    v20 = 0;
    goto LABEL_42;
  }
  v17 = a4;
  v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v19 = *MEMORY[0x1E0D025B8];
  v48 = *MEMORY[0x1E0CB2D50];
  v39 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("productID"));
  v49[0] = v39;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v20 = 0;
  *v17 = (id)objc_msgSend(v18, "initWithDomain:code:userInfo:", v19, 2, v9);
LABEL_41:

LABEL_42:
  return v20;
}

- (id)jsonDictionary
{
  uint64_t v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  if (-[BMDeviceAccessoryChargingSession hasProductID](self, "hasProductID"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAccessoryChargingSession productID](self, "productID"));
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (-[BMDeviceAccessoryChargingSession hasFirmwareVersion](self, "hasFirmwareVersion"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceAccessoryChargingSession firmwareVersion](self, "firmwareVersion"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (!-[BMDeviceAccessoryChargingSession hasStartTimestamp](self, "hasStartTimestamp")
    || (-[BMDeviceAccessoryChargingSession startTimestamp](self, "startTimestamp"), fabs(v5) == INFINITY))
  {
    v7 = 0;
  }
  else
  {
    -[BMDeviceAccessoryChargingSession startTimestamp](self, "startTimestamp");
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMDeviceAccessoryChargingSession startTimestamp](self, "startTimestamp");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!-[BMDeviceAccessoryChargingSession hasEndTimestamp](self, "hasEndTimestamp")
    || (-[BMDeviceAccessoryChargingSession endTimestamp](self, "endTimestamp"), fabs(v8) == INFINITY))
  {
    v10 = 0;
  }
  else
  {
    -[BMDeviceAccessoryChargingSession endTimestamp](self, "endTimestamp");
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[BMDeviceAccessoryChargingSession endTimestamp](self, "endTimestamp");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceAccessoryChargingSession side](self, "side"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v3;
  v21[0] = CFSTR("productID");
  v12 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[0] = v12;
  v21[1] = CFSTR("firmwareVersion");
  v13 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[1] = v13;
  v21[2] = CFSTR("startTimestamp");
  v14 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[2] = v14;
  v21[3] = CFSTR("endTimestamp");
  v15 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v15;
  v21[4] = CFSTR("side");
  v16 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[4] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 5, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v10)
      goto LABEL_27;
  }
  else
  {

    if (v10)
    {
LABEL_27:
      if (v7)
        goto LABEL_28;
LABEL_34:

      if (v4)
        goto LABEL_29;
      goto LABEL_35;
    }
  }

  if (!v7)
    goto LABEL_34;
LABEL_28:
  if (v4)
    goto LABEL_29;
LABEL_35:

LABEL_29:
  if (!v20)

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  unsigned int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  BOOL v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMDeviceAccessoryChargingSession hasProductID](self, "hasProductID")
      || objc_msgSend(v5, "hasProductID"))
    {
      if (!-[BMDeviceAccessoryChargingSession hasProductID](self, "hasProductID"))
        goto LABEL_24;
      if (!objc_msgSend(v5, "hasProductID"))
        goto LABEL_24;
      v6 = -[BMDeviceAccessoryChargingSession productID](self, "productID");
      if (v6 != objc_msgSend(v5, "productID"))
        goto LABEL_24;
    }
    if ((!-[BMDeviceAccessoryChargingSession hasFirmwareVersion](self, "hasFirmwareVersion")
       && !objc_msgSend(v5, "hasFirmwareVersion")
       || -[BMDeviceAccessoryChargingSession hasFirmwareVersion](self, "hasFirmwareVersion")
       && objc_msgSend(v5, "hasFirmwareVersion")
       && (v7 = -[BMDeviceAccessoryChargingSession firmwareVersion](self, "firmwareVersion"),
           v7 == objc_msgSend(v5, "firmwareVersion")))
      && (!-[BMDeviceAccessoryChargingSession hasStartTimestamp](self, "hasStartTimestamp")
       && !objc_msgSend(v5, "hasStartTimestamp")
       || -[BMDeviceAccessoryChargingSession hasStartTimestamp](self, "hasStartTimestamp")
       && objc_msgSend(v5, "hasStartTimestamp")
       && (-[BMDeviceAccessoryChargingSession startTimestamp](self, "startTimestamp"),
           v9 = v8,
           objc_msgSend(v5, "startTimestamp"),
           v9 == v10))
      && (!-[BMDeviceAccessoryChargingSession hasEndTimestamp](self, "hasEndTimestamp")
       && !objc_msgSend(v5, "hasEndTimestamp")
       || -[BMDeviceAccessoryChargingSession hasEndTimestamp](self, "hasEndTimestamp")
       && objc_msgSend(v5, "hasEndTimestamp")
       && (-[BMDeviceAccessoryChargingSession endTimestamp](self, "endTimestamp"),
           v12 = v11,
           objc_msgSend(v5, "endTimestamp"),
           v12 == v13)))
    {
      v14 = -[BMDeviceAccessoryChargingSession side](self, "side");
      v15 = v14 == objc_msgSend(v5, "side");
    }
    else
    {
LABEL_24:
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (unsigned)productID
{
  return self->_productID;
}

- (BOOL)hasProductID
{
  return self->_hasProductID;
}

- (void)setHasProductID:(BOOL)a3
{
  self->_hasProductID = a3;
}

- (unsigned)firmwareVersion
{
  return self->_firmwareVersion;
}

- (BOOL)hasFirmwareVersion
{
  return self->_hasFirmwareVersion;
}

- (void)setHasFirmwareVersion:(BOOL)a3
{
  self->_hasFirmwareVersion = a3;
}

- (double)startTimestamp
{
  return self->_startTimestamp;
}

- (BOOL)hasStartTimestamp
{
  return self->_hasStartTimestamp;
}

- (void)setHasStartTimestamp:(BOOL)a3
{
  self->_hasStartTimestamp = a3;
}

- (double)endTimestamp
{
  return self->_endTimestamp;
}

- (BOOL)hasEndTimestamp
{
  return self->_hasEndTimestamp;
}

- (void)setHasEndTimestamp:(BOOL)a3
{
  self->_hasEndTimestamp = a3;
}

- (int)side
{
  return self->_side;
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

    v4 = -[BMDeviceAccessoryChargingSession initByReadFrom:]([BMDeviceAccessoryChargingSession alloc], "initByReadFrom:", v7);
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
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("productID"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("firmwareVersion"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("startTimestamp"), 1, 0, 3, 0, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("endTimestamp"), 1, 0, 4, 0, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("side"), 0, 0, 5, 4, 0);
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1A9E0;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("productID"), 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("firmwareVersion"), 2, 4, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("startTimestamp"), 3, 0, 0);
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("endTimestamp"), 4, 0, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("side"), 5, 4, 0);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
