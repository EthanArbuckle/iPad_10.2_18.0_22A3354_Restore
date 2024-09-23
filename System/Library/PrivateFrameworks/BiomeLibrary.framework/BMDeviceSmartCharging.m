@implementation BMDeviceSmartCharging

- (BMDeviceSmartCharging)initWithBatteryLevel:(id)a3 targetSoC:(id)a4 predictedEndOfCharge:(id)a5 mode:(int)a6 obcEvent:(int)a7
{
  id v12;
  id v13;
  id v14;
  BMDeviceSmartCharging *v15;
  int v16;
  int v17;
  double v18;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v20.receiver = self;
  v20.super_class = (Class)BMDeviceSmartCharging;
  v15 = -[BMEventBase init](&v20, sel_init);
  if (v15)
  {
    v15->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v12)
    {
      v15->_hasBatteryLevel = 1;
      v16 = objc_msgSend(v12, "intValue");
    }
    else
    {
      v15->_hasBatteryLevel = 0;
      v16 = -1;
    }
    v15->_batteryLevel = v16;
    if (v13)
    {
      v15->_hasTargetSoC = 1;
      v17 = objc_msgSend(v13, "intValue");
    }
    else
    {
      v15->_hasTargetSoC = 0;
      v17 = -1;
    }
    v15->_targetSoC = v17;
    if (v14)
    {
      v15->_hasPredictedEndOfCharge = 1;
      objc_msgSend(v14, "doubleValue");
    }
    else
    {
      v15->_hasPredictedEndOfCharge = 0;
      v18 = -1.0;
    }
    v15->_predictedEndOfCharge = v18;
    v15->_mode = a6;
    v15->_obcEvent = a7;
  }

  return v15;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceSmartCharging batteryLevel](self, "batteryLevel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceSmartCharging targetSoC](self, "targetSoC"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[BMDeviceSmartCharging predictedEndOfCharge](self, "predictedEndOfCharge");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BMDeviceSmartChargingModeOfOperationAsString(-[BMDeviceSmartCharging mode](self, "mode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BMDeviceSmartChargingOBCEventAsString(-[BMDeviceSmartCharging obcEvent](self, "obcEvent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMDeviceSmartCharging with batteryLevel: %@, targetSoC: %@, predictedEndOfCharge: %@, mode: %@, obcEvent: %@"), v4, v5, v7, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMDeviceSmartCharging *v5;
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
  double v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  char v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  BMDeviceSmartCharging *v51;
  objc_super v53;

  v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)BMDeviceSmartCharging;
  v5 = -[BMEventBase init](&v53, sel_init);
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
          v5->_hasBatteryLevel = 1;
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
              goto LABEL_54;
            v20 += 7;
            v17 = v21++ >= 9;
            if (v17)
            {
              LODWORD(v22) = 0;
              goto LABEL_56;
            }
          }
          v4[*v8] = 1;
LABEL_54:
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_56:
          v49 = 24;
          goto LABEL_61;
        case 2u:
          v27 = 0;
          v28 = 0;
          v22 = 0;
          v5->_hasTargetSoC = 1;
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
                  goto LABEL_60;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_60:
          v49 = 28;
LABEL_61:
          *(_DWORD *)((char *)&v5->super.super.isa + v49) = v22;
          continue;
        case 3u:
          v5->_hasPredictedEndOfCharge = 1;
          v33 = *v6;
          v34 = *(_QWORD *)&v4[v33];
          if (v34 <= 0xFFFFFFFFFFFFFFF7 && v34 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v35 = *(double *)(*(_QWORD *)&v4[*v9] + v34);
            *(_QWORD *)&v4[v33] = v34 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v35 = 0.0;
          }
          v5->_predictedEndOfCharge = v35;
          continue;
        case 4u:
          v36 = 0;
          v37 = 0;
          v38 = 0;
          while (2)
          {
            v39 = *v6;
            v40 = *(_QWORD *)&v4[v39];
            v41 = v40 + 1;
            if (v40 == -1 || v41 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v42 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v40);
              *(_QWORD *)&v4[v39] = v41;
              v38 |= (unint64_t)(v42 & 0x7F) << v36;
              if (v42 < 0)
              {
                v36 += 7;
                v17 = v37++ >= 9;
                if (v17)
                {
                  LODWORD(v38) = 0;
                  goto LABEL_65;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v38) = 0;
LABEL_65:
          if (v38 >= 9)
            LODWORD(v38) = 0;
          v50 = 32;
          goto LABEL_74;
        case 5u:
          v43 = 0;
          v44 = 0;
          v38 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_79;
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
        v38 |= (unint64_t)(v48 & 0x7F) << v43;
        if ((v48 & 0x80) == 0)
          goto LABEL_69;
        v43 += 7;
        v17 = v44++ >= 9;
        if (v17)
        {
          LODWORD(v38) = 0;
          goto LABEL_71;
        }
      }
      v4[*v8] = 1;
LABEL_69:
      if (v4[*v8])
        LODWORD(v38) = 0;
LABEL_71:
      if (v38 >= 0xF)
        LODWORD(v38) = 0;
      v50 = 36;
LABEL_74:
      *(_DWORD *)((char *)&v5->super.super.isa + v50) = v38;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_79:
    v51 = 0;
  else
LABEL_80:
    v51 = v5;

  return v51;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_hasBatteryLevel)
    PBDataWriterWriteInt32Field();
  if (self->_hasTargetSoC)
    PBDataWriterWriteInt32Field();
  if (self->_hasPredictedEndOfCharge)
    PBDataWriterWriteDoubleField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMDeviceSmartCharging writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMDeviceSmartCharging)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id *v14;
  id v15;
  uint64_t v16;
  BMDeviceSmartCharging *v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  id *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  _QWORD v45[3];

  v45[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("batteryLevel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("targetSoC"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = a4;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v35 = 0;
          v17 = 0;
          goto LABEL_42;
        }
        v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v19 = *MEMORY[0x1E0D025B8];
        v42 = *MEMORY[0x1E0CB2D50];
        v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("targetSoC"));
        v43 = v34;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 0;
        v17 = 0;
        *v32 = (id)objc_msgSend(v18, "initWithDomain:code:userInfo:", v19, 2, v10);
        goto LABEL_41;
      }
      v35 = v9;
    }
    else
    {
      v35 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("predictedEndOfCharge"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v8;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v34 = 0;
          v17 = 0;
          goto LABEL_41;
        }
        v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v21 = *MEMORY[0x1E0D025B8];
        v40 = *MEMORY[0x1E0CB2D50];
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("predictedEndOfCharge"));
        v41 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 0;
        v17 = 0;
        *v32 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", v21, 2, v11);
LABEL_40:

        v8 = v33;
LABEL_41:

        goto LABEL_42;
      }
      v34 = v10;
    }
    else
    {
      v34 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("mode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v11;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v12 = 0;
            v17 = 0;
            goto LABEL_40;
          }
          v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v28 = *MEMORY[0x1E0D025B8];
          v38 = *MEMORY[0x1E0CB2D50];
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("mode"));
          v39 = v23;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 0;
          v17 = 0;
          *v32 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v28, 2, v22);
          goto LABEL_39;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMDeviceSmartChargingModeOfOperationFromString(v11));
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12 = v13;
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("obcEvent"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = v22;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v32)
          {
            v31 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v29 = *MEMORY[0x1E0D025B8];
            v36 = *MEMORY[0x1E0CB2D50];
            v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("obcEvent"));
            v37 = v26;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *v32 = (id)objc_msgSend(v31, "initWithDomain:code:userInfo:", v29, 2, v27);

          }
          v23 = 0;
          v17 = 0;
          goto LABEL_39;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMDeviceSmartChargingOBCEventFromString(v22));
        v24 = (id)objc_claimAutoreleasedReturnValue();
      }
      v23 = v24;
    }
    else
    {
      v23 = 0;
    }
    v17 = -[BMDeviceSmartCharging initWithBatteryLevel:targetSoC:predictedEndOfCharge:mode:obcEvent:](self, "initWithBatteryLevel:targetSoC:predictedEndOfCharge:mode:obcEvent:", v33, v35, v34, objc_msgSend(v12, "intValue"), objc_msgSend(v23, "intValue"));
    self = v17;
LABEL_39:

    goto LABEL_40;
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
    v17 = 0;
    goto LABEL_43;
  }
  v14 = a4;
  v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v16 = *MEMORY[0x1E0D025B8];
  v44 = *MEMORY[0x1E0CB2D50];
  v35 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("batteryLevel"));
  v45[0] = v35;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v17 = 0;
  *v14 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 2, v9);
LABEL_42:

LABEL_43:
  return v17;
}

- (id)jsonDictionary
{
  uint64_t v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[6];

  v20[5] = *MEMORY[0x1E0C80C00];
  if (-[BMDeviceSmartCharging hasBatteryLevel](self, "hasBatteryLevel"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceSmartCharging batteryLevel](self, "batteryLevel"));
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (-[BMDeviceSmartCharging hasTargetSoC](self, "hasTargetSoC"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceSmartCharging targetSoC](self, "targetSoC"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (!-[BMDeviceSmartCharging hasPredictedEndOfCharge](self, "hasPredictedEndOfCharge")
    || (-[BMDeviceSmartCharging predictedEndOfCharge](self, "predictedEndOfCharge"), fabs(v5) == INFINITY))
  {
    v7 = 0;
  }
  else
  {
    -[BMDeviceSmartCharging predictedEndOfCharge](self, "predictedEndOfCharge");
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMDeviceSmartCharging predictedEndOfCharge](self, "predictedEndOfCharge");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceSmartCharging mode](self, "mode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceSmartCharging obcEvent](self, "obcEvent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v3;
  v19[0] = CFSTR("batteryLevel");
  v10 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[0] = v10;
  v19[1] = CFSTR("targetSoC");
  v11 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[1] = v11;
  v19[2] = CFSTR("predictedEndOfCharge");
  v12 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[2] = v12;
  v19[3] = CFSTR("mode");
  v13 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[3] = v13;
  v19[4] = CFSTR("obcEvent");
  v14 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[4] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 5, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (v8)
      goto LABEL_23;
  }
  else
  {

    if (v8)
    {
LABEL_23:
      if (v7)
        goto LABEL_24;
LABEL_30:

      if (v4)
        goto LABEL_25;
      goto LABEL_31;
    }
  }

  if (!v7)
    goto LABEL_30;
LABEL_24:
  if (v4)
    goto LABEL_25;
LABEL_31:

LABEL_25:
  if (!v18)

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  double v8;
  double v9;
  double v10;
  int v11;
  int v12;
  BOOL v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if ((!-[BMDeviceSmartCharging hasBatteryLevel](self, "hasBatteryLevel")
       && !objc_msgSend(v5, "hasBatteryLevel")
       || -[BMDeviceSmartCharging hasBatteryLevel](self, "hasBatteryLevel")
       && objc_msgSend(v5, "hasBatteryLevel")
       && (v6 = -[BMDeviceSmartCharging batteryLevel](self, "batteryLevel"),
           v6 == objc_msgSend(v5, "batteryLevel")))
      && (!-[BMDeviceSmartCharging hasTargetSoC](self, "hasTargetSoC")
       && !objc_msgSend(v5, "hasTargetSoC")
       || -[BMDeviceSmartCharging hasTargetSoC](self, "hasTargetSoC")
       && objc_msgSend(v5, "hasTargetSoC")
       && (v7 = -[BMDeviceSmartCharging targetSoC](self, "targetSoC"), v7 == objc_msgSend(v5, "targetSoC")))
      && (!-[BMDeviceSmartCharging hasPredictedEndOfCharge](self, "hasPredictedEndOfCharge")
       && !objc_msgSend(v5, "hasPredictedEndOfCharge")
       || -[BMDeviceSmartCharging hasPredictedEndOfCharge](self, "hasPredictedEndOfCharge")
       && objc_msgSend(v5, "hasPredictedEndOfCharge")
       && (-[BMDeviceSmartCharging predictedEndOfCharge](self, "predictedEndOfCharge"),
           v9 = v8,
           objc_msgSend(v5, "predictedEndOfCharge"),
           v9 == v10))
      && (v11 = -[BMDeviceSmartCharging mode](self, "mode"), v11 == objc_msgSend(v5, "mode")))
    {
      v12 = -[BMDeviceSmartCharging obcEvent](self, "obcEvent");
      v13 = v12 == objc_msgSend(v5, "obcEvent");
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)batteryLevel
{
  return self->_batteryLevel;
}

- (BOOL)hasBatteryLevel
{
  return self->_hasBatteryLevel;
}

- (void)setHasBatteryLevel:(BOOL)a3
{
  self->_hasBatteryLevel = a3;
}

- (int)targetSoC
{
  return self->_targetSoC;
}

- (BOOL)hasTargetSoC
{
  return self->_hasTargetSoC;
}

- (void)setHasTargetSoC:(BOOL)a3
{
  self->_hasTargetSoC = a3;
}

- (double)predictedEndOfCharge
{
  return self->_predictedEndOfCharge;
}

- (BOOL)hasPredictedEndOfCharge
{
  return self->_hasPredictedEndOfCharge;
}

- (void)setHasPredictedEndOfCharge:(BOOL)a3
{
  self->_hasPredictedEndOfCharge = a3;
}

- (int)mode
{
  return self->_mode;
}

- (int)obcEvent
{
  return self->_obcEvent;
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

    v4 = -[BMDeviceSmartCharging initByReadFrom:]([BMDeviceSmartCharging alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("batteryLevel"), 0, 0, 1, 2, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("targetSoC"), 0, 0, 2, 2, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("predictedEndOfCharge"), 1, 0, 3, 0, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("mode"), 0, 0, 4, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("obcEvent"), 0, 0, 5, 4, 0);
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
  return &unk_1E5F1BB08;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("batteryLevel"), 1, 2, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("targetSoC"), 2, 2, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("predictedEndOfCharge"), 3, 0, 0);
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mode"), 4, 4, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("obcEvent"), 5, 4, 0);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
