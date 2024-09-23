@implementation BMDeviceBluetooth

- (BMDeviceBluetooth)initWithAddress:(id)a3 name:(id)a4 productID:(id)a5 starting:(id)a6 deviceType:(int)a7 batteryLevelHeadphoneCase:(id)a8 batteryLevelHeadphoneRight:(id)a9 batteryLevelHeadphoneLeft:(id)a10 appleAudioDevice:(id)a11 userWearing:(id)a12 vendorID:(id)a13
{
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  BMDeviceBluetooth *v27;
  int v28;
  int v29;
  int v30;
  int v31;
  unsigned int v32;
  id v35;
  id v37;
  id v38;
  objc_super v39;

  v38 = a3;
  v35 = a4;
  v37 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a8;
  v21 = v19;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v25 = a12;
  v26 = a13;
  v39.receiver = self;
  v39.super_class = (Class)BMDeviceBluetooth;
  v27 = -[BMEventBase init](&v39, sel_init);
  if (v27)
  {
    v27->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v27->_address, a3);
    objc_storeStrong((id *)&v27->_name, v35);
    if (v18)
    {
      v27->_hasProductID = 1;
      v28 = objc_msgSend(v18, "intValue");
    }
    else
    {
      v27->_hasProductID = 0;
      v28 = -1;
    }
    v27->_productID = v28;
    if (v21)
    {
      v27->_hasStarting = 1;
      v27->_starting = objc_msgSend(v21, "BOOLValue");
    }
    else
    {
      v27->_hasStarting = 0;
      v27->_starting = 0;
    }
    v27->_deviceType = a7;
    if (v20)
    {
      v27->_hasBatteryLevelHeadphoneCase = 1;
      v29 = objc_msgSend(v20, "intValue");
    }
    else
    {
      v27->_hasBatteryLevelHeadphoneCase = 0;
      v29 = -1;
    }
    v27->_batteryLevelHeadphoneCase = v29;
    if (v22)
    {
      v27->_hasBatteryLevelHeadphoneRight = 1;
      v30 = objc_msgSend(v22, "intValue");
    }
    else
    {
      v27->_hasBatteryLevelHeadphoneRight = 0;
      v30 = -1;
    }
    v27->_batteryLevelHeadphoneRight = v30;
    if (v23)
    {
      v27->_hasBatteryLevelHeadphoneLeft = 1;
      v31 = objc_msgSend(v23, "intValue");
    }
    else
    {
      v27->_hasBatteryLevelHeadphoneLeft = 0;
      v31 = -1;
    }
    v27->_batteryLevelHeadphoneLeft = v31;
    if (v24)
    {
      v27->_hasAppleAudioDevice = 1;
      v27->_appleAudioDevice = objc_msgSend(v24, "BOOLValue");
    }
    else
    {
      v27->_hasAppleAudioDevice = 0;
      v27->_appleAudioDevice = 0;
    }
    if (v25)
    {
      v27->_hasUserWearing = 1;
      v27->_userWearing = objc_msgSend(v25, "BOOLValue");
    }
    else
    {
      v27->_hasUserWearing = 0;
      v27->_userWearing = 0;
    }
    if (v26)
    {
      v27->_hasVendorID = 1;
      v32 = objc_msgSend(v26, "unsignedIntValue");
    }
    else
    {
      v32 = 0;
      v27->_hasVendorID = 0;
    }
    v27->_vendorID = v32;
  }

  return v27;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  v15 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMDeviceBluetooth address](self, "address");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDeviceBluetooth name](self, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceBluetooth productID](self, "productID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMDeviceBluetooth starting](self, "starting"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMDeviceBluetoothDeviceTypeAsString(-[BMDeviceBluetooth deviceType](self, "deviceType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceBluetooth batteryLevelHeadphoneCase](self, "batteryLevelHeadphoneCase"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceBluetooth batteryLevelHeadphoneRight](self, "batteryLevelHeadphoneRight"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceBluetooth batteryLevelHeadphoneLeft](self, "batteryLevelHeadphoneLeft"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMDeviceBluetooth appleAudioDevice](self, "appleAudioDevice"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMDeviceBluetooth userWearing](self, "userWearing"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceBluetooth vendorID](self, "vendorID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("BMDeviceBluetooth with address: %@, name: %@, productID: %@, starting: %@, deviceType: %@, batteryLevelHeadphoneCase: %@, batteryLevelHeadphoneRight: %@, batteryLevelHeadphoneLeft: %@, appleAudioDevice: %@, userWearing: %@, vendorID: %@"), v14, v13, v12, v3, v4, v5, v6, v7, v8, v9, v10);

  return (NSString *)v16;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMDeviceBluetooth *v5;
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
  uint64_t v31;
  unint64_t v32;
  char v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
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
  char v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  char v61;
  unsigned int v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char v66;
  char v67;
  unsigned int v68;
  uint64_t v69;
  unint64_t v70;
  char v71;
  uint64_t v72;
  BOOL v73;
  uint64_t v74;
  BMDeviceBluetooth *v75;
  objc_super v77;

  v4 = a3;
  v77.receiver = self;
  v77.super_class = (Class)BMDeviceBluetooth;
  v5 = -[BMEventBase init](&v77, sel_init);
  if (!v5)
    goto LABEL_131;
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
          v20 = 56;
          goto LABEL_24;
        case 2u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 64;
LABEL_24:
          v21 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        case 3u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          v5->_hasProductID = 1;
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
                  goto LABEL_91;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_91:
          v72 = 32;
          goto LABEL_127;
        case 4u:
          v28 = 0;
          v29 = 0;
          v30 = 0;
          v5->_hasStarting = 1;
          while (2)
          {
            v31 = *v6;
            v32 = *(_QWORD *)&v4[v31];
            if (v32 == -1 || v32 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v33 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v32);
              *(_QWORD *)&v4[v31] = v32 + 1;
              v30 |= (unint64_t)(v33 & 0x7F) << v28;
              if (v33 < 0)
              {
                v28 += 7;
                v16 = v29++ >= 9;
                if (v16)
                {
                  v30 = 0;
                  goto LABEL_95;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v30 = 0;
LABEL_95:
          v73 = v30 != 0;
          v74 = 17;
          goto LABEL_122;
        case 5u:
          v34 = 0;
          v35 = 0;
          v36 = 0;
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
              v36 |= (unint64_t)(v39 & 0x7F) << v34;
              if (v39 < 0)
              {
                v34 += 7;
                v16 = v35++ >= 9;
                if (v16)
                {
                  LODWORD(v36) = 0;
                  goto LABEL_99;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v36) = 0;
LABEL_99:
          if (v36 >= 0x33)
            LODWORD(v36) = 0;
          v5->_deviceType = v36;
          continue;
        case 6u:
          v40 = 0;
          v41 = 0;
          v24 = 0;
          v5->_hasBatteryLevelHeadphoneCase = 1;
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
              v24 |= (unint64_t)(v44 & 0x7F) << v40;
              if (v44 < 0)
              {
                v40 += 7;
                v16 = v41++ >= 9;
                if (v16)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_105;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_105:
          v72 = 40;
          goto LABEL_127;
        case 7u:
          v45 = 0;
          v46 = 0;
          v24 = 0;
          v5->_hasBatteryLevelHeadphoneRight = 1;
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
              v24 |= (unint64_t)(v49 & 0x7F) << v45;
              if (v49 < 0)
              {
                v45 += 7;
                v16 = v46++ >= 9;
                if (v16)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_109;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_109:
          v72 = 44;
          goto LABEL_127;
        case 8u:
          v50 = 0;
          v51 = 0;
          v24 = 0;
          v5->_hasBatteryLevelHeadphoneLeft = 1;
          while (2)
          {
            v52 = *v6;
            v53 = *(_QWORD *)&v4[v52];
            if (v53 == -1 || v53 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v54 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v53);
              *(_QWORD *)&v4[v52] = v53 + 1;
              v24 |= (unint64_t)(v54 & 0x7F) << v50;
              if (v54 < 0)
              {
                v50 += 7;
                v16 = v51++ >= 9;
                if (v16)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_113;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v24) = 0;
LABEL_113:
          v72 = 48;
          goto LABEL_127;
        case 9u:
          v55 = 0;
          v56 = 0;
          v57 = 0;
          v5->_hasAppleAudioDevice = 1;
          while (2)
          {
            v58 = *v6;
            v59 = *(_QWORD *)&v4[v58];
            if (v59 == -1 || v59 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v60 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v59);
              *(_QWORD *)&v4[v58] = v59 + 1;
              v57 |= (unint64_t)(v60 & 0x7F) << v55;
              if (v60 < 0)
              {
                v55 += 7;
                v16 = v56++ >= 9;
                if (v16)
                {
                  v57 = 0;
                  goto LABEL_117;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v57 = 0;
LABEL_117:
          v73 = v57 != 0;
          v74 = 22;
          goto LABEL_122;
        case 0xAu:
          v61 = 0;
          v62 = 0;
          v63 = 0;
          v5->_hasUserWearing = 1;
          while (2)
          {
            v64 = *v6;
            v65 = *(_QWORD *)&v4[v64];
            if (v65 == -1 || v65 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v66 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v65);
              *(_QWORD *)&v4[v64] = v65 + 1;
              v63 |= (unint64_t)(v66 & 0x7F) << v61;
              if (v66 < 0)
              {
                v61 += 7;
                v16 = v62++ >= 9;
                if (v16)
                {
                  v63 = 0;
                  goto LABEL_121;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v63 = 0;
LABEL_121:
          v73 = v63 != 0;
          v74 = 24;
LABEL_122:
          *((_BYTE *)&v5->super.super.isa + v74) = v73;
          continue;
        case 0xBu:
          v67 = 0;
          v68 = 0;
          v24 = 0;
          v5->_hasVendorID = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_130;
          continue;
      }
      while (1)
      {
        v69 = *v6;
        v70 = *(_QWORD *)&v4[v69];
        if (v70 == -1 || v70 >= *(_QWORD *)&v4[*v7])
          break;
        v71 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v70);
        *(_QWORD *)&v4[v69] = v70 + 1;
        v24 |= (unint64_t)(v71 & 0x7F) << v67;
        if ((v71 & 0x80) == 0)
          goto LABEL_124;
        v67 += 7;
        v16 = v68++ >= 9;
        if (v16)
        {
          LODWORD(v24) = 0;
          goto LABEL_126;
        }
      }
      v4[*v8] = 1;
LABEL_124:
      if (v4[*v8])
        LODWORD(v24) = 0;
LABEL_126:
      v72 = 52;
LABEL_127:
      *(_DWORD *)((char *)&v5->super.super.isa + v72) = v24;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_130:
    v75 = 0;
  else
LABEL_131:
    v75 = v5;

  return v75;
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (self->_address)
    PBDataWriterWriteStringField();
  if (self->_name)
    PBDataWriterWriteStringField();
  if (self->_hasProductID)
    PBDataWriterWriteInt32Field();
  if (self->_hasStarting)
    PBDataWriterWriteBOOLField();
  PBDataWriterWriteUint32Field();
  if (self->_hasBatteryLevelHeadphoneCase)
    PBDataWriterWriteInt32Field();
  if (self->_hasBatteryLevelHeadphoneRight)
    PBDataWriterWriteInt32Field();
  v4 = v5;
  if (self->_hasBatteryLevelHeadphoneLeft)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hasAppleAudioDevice)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasUserWearing)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasVendorID)
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
  -[BMDeviceBluetooth writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMDeviceBluetooth)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  BMDeviceBluetooth *v17;
  id *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id *v28;
  BMDeviceBluetooth *v29;
  uint64_t v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  BMDeviceBluetooth *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  id v61;
  void *v62;
  uint64_t v63;
  id v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  id *v68;
  id v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  id v75;
  uint64_t v76;
  id v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  uint64_t v82;
  id v83;
  void *v84;
  id *v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  id v90;
  uint64_t v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  id v102;
  id *v103;
  id *v104;
  id *v105;
  BMDeviceBluetooth *v106;
  id v107;
  BMDeviceBluetooth *v108;
  BMDeviceBluetooth *v109;
  BMDeviceBluetooth *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  id v122;
  id v123;
  void *v124;
  void *v125;
  void *v126;
  id v127;
  id v128;
  id v129;
  void *v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  id v134;
  uint64_t v135;
  id v136;
  uint64_t v137;
  id v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  void *v142;
  uint64_t v143;
  id v144;
  uint64_t v145;
  id v146;
  uint64_t v147;
  id v148;
  uint64_t v149;
  id v150;
  uint64_t v151;
  _QWORD v152[3];

  v152[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("address"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v10 = 0;
          v17 = 0;
          goto LABEL_70;
        }
        v125 = v7;
        v22 = a4;
        v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v24 = *MEMORY[0x1E0D025B8];
        v149 = *MEMORY[0x1E0CB2D50];
        v129 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("name"));
        v150 = v129;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v150, &v149, 1);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = v24;
        v11 = (void *)v25;
        v10 = 0;
        v17 = 0;
        *v22 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v26, 2, v25);
        v7 = v125;
        goto LABEL_69;
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("productID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v129 = 0;
          v17 = 0;
          goto LABEL_69;
        }
        v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v121 = v9;
        v126 = v7;
        v28 = a4;
        v29 = self;
        v30 = *MEMORY[0x1E0D025B8];
        v147 = *MEMORY[0x1E0CB2D50];
        v31 = v10;
        v32 = objc_alloc(MEMORY[0x1E0CB3940]);
        v96 = objc_opt_class();
        v33 = v32;
        v10 = v31;
        v127 = (id)objc_msgSend(v33, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v96, CFSTR("productID"));
        v148 = v127;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v148, &v147, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v30;
        self = v29;
        v36 = (id)objc_msgSend(v27, "initWithDomain:code:userInfo:", v35, 2, v34);
        v129 = 0;
        v17 = 0;
        *v28 = v36;
        v7 = v126;
        v9 = v121;
LABEL_68:

LABEL_69:
        goto LABEL_70;
      }
      v128 = v8;
      v129 = v11;
    }
    else
    {
      v128 = v8;
      v129 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("starting"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v127 = 0;
          v17 = 0;
          v34 = v12;
          v8 = v128;
          goto LABEL_68;
        }
        v103 = a4;
        v37 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v112 = v11;
        v38 = *MEMORY[0x1E0D025B8];
        v145 = *MEMORY[0x1E0CB2D50];
        v39 = v7;
        v40 = v10;
        v41 = objc_alloc(MEMORY[0x1E0CB3940]);
        v97 = objc_opt_class();
        v42 = v41;
        v10 = v40;
        v7 = v39;
        v123 = (id)objc_msgSend(v42, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v97, CFSTR("starting"));
        v146 = v123;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v146, &v145, 1);
        v43 = objc_claimAutoreleasedReturnValue();
        v44 = v37;
        v45 = (void *)v43;
        v34 = v12;
        v46 = v38;
        v11 = v112;
        v127 = 0;
        v17 = 0;
        *v103 = (id)objc_msgSend(v44, "initWithDomain:code:userInfo:", v46, 2, v43);
        goto LABEL_105;
      }
      v118 = v12;
      v127 = v12;
    }
    else
    {
      v118 = v12;
      v127 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("deviceType"));
    v13 = objc_claimAutoreleasedReturnValue();
    v124 = v7;
    v120 = v9;
    v117 = (void *)v13;
    if (!v13 || (v14 = (void *)v13, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v15 = v10;
      v123 = 0;
LABEL_37:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("batteryLevelHeadphoneCase"));
      v47 = objc_claimAutoreleasedReturnValue();
      v8 = v128;
      v119 = (void *)v47;
      if (v47 && (v48 = (void *)v47, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v122 = 0;
            v17 = 0;
            v45 = v117;
            v34 = v118;
            v10 = v15;
            v7 = v124;
            goto LABEL_66;
          }
          v105 = a4;
          v61 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v108 = self;
          v62 = v11;
          v63 = *MEMORY[0x1E0D025B8];
          v141 = *MEMORY[0x1E0CB2D50];
          v64 = objc_alloc(MEMORY[0x1E0CB3940]);
          v98 = objc_opt_class();
          v65 = v64;
          v10 = v15;
          v114 = (void *)objc_msgSend(v65, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v98, CFSTR("batteryLevelHeadphoneCase"));
          v142 = v114;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v142, &v141, 1);
          v66 = objc_claimAutoreleasedReturnValue();
          v67 = v63;
          v11 = v62;
          self = v108;
          v115 = (void *)v66;
          v17 = 0;
          v122 = 0;
          *v105 = (id)objc_msgSend(v61, "initWithDomain:code:userInfo:", v67, 2);
          v45 = v117;
          v34 = v118;
          v7 = v124;
          goto LABEL_65;
        }
        v130 = v6;
        v122 = v48;
      }
      else
      {
        v130 = v6;
        v122 = 0;
      }
      objc_msgSend(v130, "objectForKeyedSubscript:", CFSTR("batteryLevelHeadphoneRight"));
      v49 = (id)objc_claimAutoreleasedReturnValue();
      v115 = v49;
      v116 = v15;
      if (v49)
      {
        v10 = v15;
        objc_opt_class();
        v7 = v124;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v104 = a4;
          v49 = 0;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              v114 = 0;
              v17 = 0;
              v45 = v117;
              v34 = v118;
              v6 = v130;
              goto LABEL_65;
            }
            v68 = a4;
            v69 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v109 = self;
            v70 = v11;
            v71 = *MEMORY[0x1E0D025B8];
            v139 = *MEMORY[0x1E0CB2D50];
            v7 = v124;
            v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("batteryLevelHeadphoneRight"));
            v140 = v59;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v140, &v139, 1);
            v72 = objc_claimAutoreleasedReturnValue();
            v73 = v71;
            v11 = v70;
            self = v109;
            v111 = (void *)v72;
            v17 = 0;
            v114 = 0;
            *v68 = (id)objc_msgSend(v69, "initWithDomain:code:userInfo:", v73, 2);
            goto LABEL_101;
          }
          v104 = a4;
          v49 = v49;
        }
      }
      else
      {
        v104 = a4;
        v7 = v124;
      }
      objc_msgSend(v130, "objectForKeyedSubscript:", CFSTR("batteryLevelHeadphoneLeft"));
      v50 = objc_claimAutoreleasedReturnValue();
      v114 = v49;
      v111 = (void *)v50;
      if (!v50 || (v51 = (void *)v50, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v107 = 0;
        goto LABEL_51;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v107 = v51;
LABEL_51:
        objc_msgSend(v130, "objectForKeyedSubscript:", CFSTR("appleAudioDevice"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v113 = v11;
        if (!v52 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v53 = 0;
          goto LABEL_54;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v53 = v52;
LABEL_54:
          objc_msgSend(v130, "objectForKeyedSubscript:", CFSTR("userWearing"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v54 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v55 = self;
            v56 = 0;
            goto LABEL_57;
          }
          objc_opt_class();
          v55 = self;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v56 = v54;
LABEL_57:
            objc_msgSend(v130, "objectForKeyedSubscript:", CFSTR("vendorID"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            if (v57 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              v6 = v130;
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v17 = (BMDeviceBluetooth *)v104;
                if (v104)
                {
                  v102 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v101 = *MEMORY[0x1E0D025B8];
                  v131 = *MEMORY[0x1E0CB2D50];
                  v94 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("vendorID"));
                  v132 = v94;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v132, &v131, 1);
                  v95 = (void *)objc_claimAutoreleasedReturnValue();
                  *v104 = (id)objc_msgSend(v102, "initWithDomain:code:userInfo:", v101, 2, v95);

                  v7 = v124;
                  v58 = 0;
                  v17 = 0;
                }
                else
                {
                  v58 = 0;
                }
                goto LABEL_61;
              }
              v58 = v57;
            }
            else
            {
              v58 = 0;
              v6 = v130;
            }
            v17 = -[BMDeviceBluetooth initWithAddress:name:productID:starting:deviceType:batteryLevelHeadphoneCase:batteryLevelHeadphoneRight:batteryLevelHeadphoneLeft:appleAudioDevice:userWearing:vendorID:](v55, "initWithAddress:name:productID:starting:deviceType:batteryLevelHeadphoneCase:batteryLevelHeadphoneRight:batteryLevelHeadphoneLeft:appleAudioDevice:userWearing:vendorID:", v128, v116, v129, v127, objc_msgSend(v123, "intValue"), v122, v49, v107, v53, v56, v58);
            v55 = v17;
LABEL_61:

LABEL_62:
            v59 = v107;

            self = v55;
            v11 = v113;
LABEL_63:

            v8 = v128;
            v9 = v120;
            v45 = v117;
            v34 = v118;
LABEL_64:

            v10 = v116;
LABEL_65:

LABEL_66:
LABEL_67:

            goto LABEL_68;
          }
          if (v104)
          {
            v90 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v91 = *MEMORY[0x1E0D025B8];
            v133 = *MEMORY[0x1E0CB2D50];
            v58 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("userWearing"));
            v134 = v58;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v134, &v133, 1);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v92 = v90;
            v7 = v124;
            v93 = (id)objc_msgSend(v92, "initWithDomain:code:userInfo:", v91, 2, v57);
            v17 = 0;
            v56 = 0;
            *v104 = v93;
            v6 = v130;
            goto LABEL_61;
          }
          v56 = 0;
          v17 = 0;
LABEL_107:
          v6 = v130;
          goto LABEL_62;
        }
        if (v104)
        {
          v55 = self;
          v81 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v82 = *MEMORY[0x1E0D025B8];
          v135 = *MEMORY[0x1E0CB2D50];
          v83 = objc_alloc(MEMORY[0x1E0CB3940]);
          v100 = objc_opt_class();
          v84 = v83;
          v7 = v124;
          v56 = (id)objc_msgSend(v84, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v100, CFSTR("appleAudioDevice"));
          v136 = v56;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v136, &v135, 1);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 0;
          v53 = 0;
          *v104 = (id)objc_msgSend(v81, "initWithDomain:code:userInfo:", v82, 2, v54);
          goto LABEL_107;
        }
        v59 = v107;
        v53 = 0;
        v17 = 0;
LABEL_103:
        v6 = v130;
        goto LABEL_63;
      }
      if (v104)
      {
        v110 = self;
        v74 = v11;
        v75 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v76 = *MEMORY[0x1E0D025B8];
        v137 = *MEMORY[0x1E0CB2D50];
        v77 = objc_alloc(MEMORY[0x1E0CB3940]);
        v99 = objc_opt_class();
        v78 = v77;
        v7 = v124;
        v53 = (id)objc_msgSend(v78, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v99, CFSTR("batteryLevelHeadphoneLeft"));
        v138 = v53;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v138, &v137, 1);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v75;
        v11 = v74;
        self = v110;
        v80 = (id)objc_msgSend(v79, "initWithDomain:code:userInfo:", v76, 2, v52);
        v17 = 0;
        v59 = 0;
        *v104 = v80;
        goto LABEL_103;
      }
      v59 = 0;
      v17 = 0;
LABEL_101:
      v45 = v117;
      v34 = v118;
      v6 = v130;
      goto LABEL_64;
    }
    v16 = v7;
    v17 = (BMDeviceBluetooth *)a4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = v10;
      v123 = v14;
LABEL_36:
      v9 = v120;
      goto LABEL_37;
    }
    v106 = self;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMDeviceBluetoothDeviceTypeFromString(v14));
      v123 = (id)objc_claimAutoreleasedReturnValue();
      v15 = v10;
      goto LABEL_36;
    }
    if (a4)
    {
      v85 = a4;
      v86 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v87 = *MEMORY[0x1E0D025B8];
      v143 = *MEMORY[0x1E0CB2D50];
      v122 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("deviceType"));
      v144 = v122;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v144, &v143, 1);
      v88 = objc_claimAutoreleasedReturnValue();
      v89 = v86;
      v45 = v14;
      v119 = (void *)v88;
      v123 = 0;
      v17 = 0;
      *v85 = (id)objc_msgSend(v89, "initWithDomain:code:userInfo:", v87, 2);
      self = v106;
      v7 = v16;
      v9 = v120;
      v34 = v118;
      v8 = v128;
      goto LABEL_66;
    }
    v123 = 0;
    v9 = v120;
    v34 = v118;
    v45 = v14;
LABEL_105:
    v8 = v128;
    goto LABEL_67;
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
    goto LABEL_71;
  }
  v18 = a4;
  v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v20 = *MEMORY[0x1E0D025B8];
  v151 = *MEMORY[0x1E0CB2D50];
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("address"));
  v152[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v152, &v151, 1);
  v21 = objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v17 = 0;
  *v18 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 2, v21);
  v9 = (void *)v21;
LABEL_70:

LABEL_71:
  return v17;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
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
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[11];
  _QWORD v39[13];

  v39[11] = *MEMORY[0x1E0C80C00];
  -[BMDeviceBluetooth address](self, "address");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMDeviceBluetooth name](self, "name");
  v4 = objc_claimAutoreleasedReturnValue();
  if (-[BMDeviceBluetooth hasProductID](self, "hasProductID"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceBluetooth productID](self, "productID"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (-[BMDeviceBluetooth hasStarting](self, "hasStarting"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMDeviceBluetooth starting](self, "starting"));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceBluetooth deviceType](self, "deviceType"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (-[BMDeviceBluetooth hasBatteryLevelHeadphoneCase](self, "hasBatteryLevelHeadphoneCase"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceBluetooth batteryLevelHeadphoneCase](self, "batteryLevelHeadphoneCase"));
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  if (-[BMDeviceBluetooth hasBatteryLevelHeadphoneRight](self, "hasBatteryLevelHeadphoneRight"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceBluetooth batteryLevelHeadphoneRight](self, "batteryLevelHeadphoneRight"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v37 = 0;
  }
  if (-[BMDeviceBluetooth hasBatteryLevelHeadphoneLeft](self, "hasBatteryLevelHeadphoneLeft"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceBluetooth batteryLevelHeadphoneLeft](self, "batteryLevelHeadphoneLeft"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = 0;
  }
  if (-[BMDeviceBluetooth hasAppleAudioDevice](self, "hasAppleAudioDevice"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMDeviceBluetooth appleAudioDevice](self, "appleAudioDevice"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = 0;
  }
  if (-[BMDeviceBluetooth hasUserWearing](self, "hasUserWearing"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMDeviceBluetooth userWearing](self, "userWearing"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  if (-[BMDeviceBluetooth hasVendorID](self, "hasVendorID"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMDeviceBluetooth vendorID](self, "vendorID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v38[0] = CFSTR("address");
  v11 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v11;
  v39[0] = v11;
  v38[1] = CFSTR("name");
  v12 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v12;
  v39[1] = v12;
  v38[2] = CFSTR("productID");
  v13 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v34 = (void *)v3;
  v27 = (void *)v13;
  v39[2] = v13;
  v38[3] = CFSTR("starting");
  v14 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v4;
  v26 = (void *)v14;
  v39[3] = v14;
  v38[4] = CFSTR("deviceType");
  v15 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)v5;
  v25 = (void *)v15;
  v39[4] = v15;
  v38[5] = CFSTR("batteryLevelHeadphoneCase");
  v16 = (void *)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v6;
  v39[5] = v16;
  v38[6] = CFSTR("batteryLevelHeadphoneRight");
  v17 = v37;
  if (!v37)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v7;
  v39[6] = v17;
  v38[7] = CFSTR("batteryLevelHeadphoneLeft");
  v19 = v36;
  if (!v36)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v8;
  v39[7] = v19;
  v38[8] = CFSTR("appleAudioDevice");
  v21 = v35;
  if (!v35)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v39[8] = v21;
  v38[9] = CFSTR("userWearing");
  v22 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v39[9] = v22;
  v38[10] = CFSTR("vendorID");
  v23 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v39[10] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 11);
  v30 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v9)
      goto LABEL_49;
  }
  else
  {

    if (v9)
      goto LABEL_49;
  }

LABEL_49:
  if (!v35)

  if (!v36)
  if (!v37)

  if (!v20)
  if (!v18)

  if (!v31)
  if (v32)
  {
    if (v33)
      goto LABEL_63;
LABEL_68:

    if (v34)
      goto LABEL_64;
LABEL_69:

    goto LABEL_64;
  }

  if (!v33)
    goto LABEL_68;
LABEL_63:
  if (!v34)
    goto LABEL_69;
LABEL_64:

  return v30;
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
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  unsigned int v27;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMDeviceBluetooth address](self, "address");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "address");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMDeviceBluetooth address](self, "address");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "address");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_52;
    }
    -[BMDeviceBluetooth name](self, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMDeviceBluetooth name](self, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_52;
    }
    if (!-[BMDeviceBluetooth hasProductID](self, "hasProductID") && !objc_msgSend(v5, "hasProductID")
      || -[BMDeviceBluetooth hasProductID](self, "hasProductID")
      && objc_msgSend(v5, "hasProductID")
      && (v19 = -[BMDeviceBluetooth productID](self, "productID"), v19 == objc_msgSend(v5, "productID")))
    {
      if (!-[BMDeviceBluetooth hasStarting](self, "hasStarting") && !objc_msgSend(v5, "hasStarting")
        || -[BMDeviceBluetooth hasStarting](self, "hasStarting")
        && objc_msgSend(v5, "hasStarting")
        && (v20 = -[BMDeviceBluetooth starting](self, "starting"), v20 == objc_msgSend(v5, "starting")))
      {
        v21 = -[BMDeviceBluetooth deviceType](self, "deviceType");
        if (v21 == objc_msgSend(v5, "deviceType"))
        {
          if (!-[BMDeviceBluetooth hasBatteryLevelHeadphoneCase](self, "hasBatteryLevelHeadphoneCase")
            && !objc_msgSend(v5, "hasBatteryLevelHeadphoneCase")
            || -[BMDeviceBluetooth hasBatteryLevelHeadphoneCase](self, "hasBatteryLevelHeadphoneCase")
            && objc_msgSend(v5, "hasBatteryLevelHeadphoneCase")
            && (v22 = -[BMDeviceBluetooth batteryLevelHeadphoneCase](self, "batteryLevelHeadphoneCase"),
                v22 == objc_msgSend(v5, "batteryLevelHeadphoneCase")))
          {
            if (!-[BMDeviceBluetooth hasBatteryLevelHeadphoneRight](self, "hasBatteryLevelHeadphoneRight")
              && !objc_msgSend(v5, "hasBatteryLevelHeadphoneRight")
              || -[BMDeviceBluetooth hasBatteryLevelHeadphoneRight](self, "hasBatteryLevelHeadphoneRight")
              && objc_msgSend(v5, "hasBatteryLevelHeadphoneRight")
              && (v23 = -[BMDeviceBluetooth batteryLevelHeadphoneRight](self, "batteryLevelHeadphoneRight"),
                  v23 == objc_msgSend(v5, "batteryLevelHeadphoneRight")))
            {
              if (!-[BMDeviceBluetooth hasBatteryLevelHeadphoneLeft](self, "hasBatteryLevelHeadphoneLeft")
                && !objc_msgSend(v5, "hasBatteryLevelHeadphoneLeft")
                || -[BMDeviceBluetooth hasBatteryLevelHeadphoneLeft](self, "hasBatteryLevelHeadphoneLeft")
                && objc_msgSend(v5, "hasBatteryLevelHeadphoneLeft")
                && (v24 = -[BMDeviceBluetooth batteryLevelHeadphoneLeft](self, "batteryLevelHeadphoneLeft"),
                    v24 == objc_msgSend(v5, "batteryLevelHeadphoneLeft")))
              {
                if (!-[BMDeviceBluetooth hasAppleAudioDevice](self, "hasAppleAudioDevice")
                  && !objc_msgSend(v5, "hasAppleAudioDevice")
                  || -[BMDeviceBluetooth hasAppleAudioDevice](self, "hasAppleAudioDevice")
                  && objc_msgSend(v5, "hasAppleAudioDevice")
                  && (v25 = -[BMDeviceBluetooth appleAudioDevice](self, "appleAudioDevice"),
                      v25 == objc_msgSend(v5, "appleAudioDevice")))
                {
                  if (!-[BMDeviceBluetooth hasUserWearing](self, "hasUserWearing")
                    && !objc_msgSend(v5, "hasUserWearing")
                    || -[BMDeviceBluetooth hasUserWearing](self, "hasUserWearing")
                    && objc_msgSend(v5, "hasUserWearing")
                    && (v26 = -[BMDeviceBluetooth userWearing](self, "userWearing"),
                        v26 == objc_msgSend(v5, "userWearing")))
                  {
                    if (!-[BMDeviceBluetooth hasVendorID](self, "hasVendorID")
                      && !objc_msgSend(v5, "hasVendorID"))
                    {
                      v12 = 1;
                      goto LABEL_53;
                    }
                    if (-[BMDeviceBluetooth hasVendorID](self, "hasVendorID")
                      && objc_msgSend(v5, "hasVendorID"))
                    {
                      v27 = -[BMDeviceBluetooth vendorID](self, "vendorID");
                      v12 = v27 == objc_msgSend(v5, "vendorID");
LABEL_53:

                      goto LABEL_54;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_52:
    v12 = 0;
    goto LABEL_53;
  }
  v12 = 0;
LABEL_54:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)address
{
  return self->_address;
}

- (NSString)name
{
  return self->_name;
}

- (int)productID
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

- (BOOL)starting
{
  return self->_starting;
}

- (BOOL)hasStarting
{
  return self->_hasStarting;
}

- (void)setHasStarting:(BOOL)a3
{
  self->_hasStarting = a3;
}

- (int)deviceType
{
  return self->_deviceType;
}

- (int)batteryLevelHeadphoneCase
{
  return self->_batteryLevelHeadphoneCase;
}

- (BOOL)hasBatteryLevelHeadphoneCase
{
  return self->_hasBatteryLevelHeadphoneCase;
}

- (void)setHasBatteryLevelHeadphoneCase:(BOOL)a3
{
  self->_hasBatteryLevelHeadphoneCase = a3;
}

- (int)batteryLevelHeadphoneRight
{
  return self->_batteryLevelHeadphoneRight;
}

- (BOOL)hasBatteryLevelHeadphoneRight
{
  return self->_hasBatteryLevelHeadphoneRight;
}

- (void)setHasBatteryLevelHeadphoneRight:(BOOL)a3
{
  self->_hasBatteryLevelHeadphoneRight = a3;
}

- (int)batteryLevelHeadphoneLeft
{
  return self->_batteryLevelHeadphoneLeft;
}

- (BOOL)hasBatteryLevelHeadphoneLeft
{
  return self->_hasBatteryLevelHeadphoneLeft;
}

- (void)setHasBatteryLevelHeadphoneLeft:(BOOL)a3
{
  self->_hasBatteryLevelHeadphoneLeft = a3;
}

- (BOOL)appleAudioDevice
{
  return self->_appleAudioDevice;
}

- (BOOL)hasAppleAudioDevice
{
  return self->_hasAppleAudioDevice;
}

- (void)setHasAppleAudioDevice:(BOOL)a3
{
  self->_hasAppleAudioDevice = a3;
}

- (BOOL)userWearing
{
  return self->_userWearing;
}

- (BOOL)hasUserWearing
{
  return self->_hasUserWearing;
}

- (void)setHasUserWearing:(BOOL)a3
{
  self->_hasUserWearing = a3;
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (BOOL)hasVendorID
{
  return self->_hasVendorID;
}

- (void)setHasVendorID:(BOOL)a3
{
  self->_hasVendorID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_address, 0);
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

    v4 = -[BMDeviceBluetooth initByReadFrom:]([BMDeviceBluetooth alloc], "initByReadFrom:", v7);
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
  void *v9;
  void *v10;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[12];

  v15[11] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("address"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("name"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("productID"), 0, 0, 3, 2, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("starting"), 0, 0, 4, 12, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("deviceType"), 0, 0, 5, 4, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("batteryLevelHeadphoneCase"), 0, 0, 6, 2, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("batteryLevelHeadphoneRight"), 0, 0, 7, 2, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("batteryLevelHeadphoneLeft"), 0, 0, 8, 2, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("appleAudioDevice"), 0, 0, 9, 12, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userWearing"), 0, 0, 10, 12, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("vendorID"), 0, 0, 11, 4, 0);
  v15[0] = v2;
  v15[1] = v3;
  v15[2] = v4;
  v15[3] = v5;
  v15[4] = v6;
  v15[5] = v13;
  v15[6] = v7;
  v15[7] = v8;
  v15[8] = v14;
  v15[9] = v9;
  v15[10] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 11);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1D440;
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
  void *v11;
  void *v13;
  void *v14;
  _QWORD v15[12];

  v15[11] = *MEMORY[0x1E0C80C00];
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("address"), 1, 13, 0);
  v15[0] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("name"), 2, 13, 0);
  v15[1] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("productID"), 3, 2, 0);
  v15[2] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("starting"), 4, 12, 0);
  v15[3] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("deviceType"), 5, 4, 0);
  v15[4] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("batteryLevelHeadphoneCase"), 6, 2, 0);
  v15[5] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("batteryLevelHeadphoneRight"), 7, 2, 0);
  v15[6] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("batteryLevelHeadphoneLeft"), 8, 2, 0);
  v15[7] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("appleAudioDevice"), 9, 12, 0);
  v15[8] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userWearing"), 10, 12, 0);
  v15[9] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("vendorID"), 11, 4, 0);
  v15[10] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 11);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BMDeviceBluetooth)initWithAddress:(id)a3 name:(id)a4 productID:(id)a5 starting:(id)a6 deviceType:(int)a7 batteryLevelHeadphoneCase:(id)a8 batteryLevelHeadphoneRight:(id)a9 batteryLevelHeadphoneLeft:(id)a10 appleAudioDevice:(id)a11 userWearing:(id)a12
{
  return -[BMDeviceBluetooth initWithAddress:name:productID:starting:deviceType:batteryLevelHeadphoneCase:batteryLevelHeadphoneRight:batteryLevelHeadphoneLeft:appleAudioDevice:userWearing:vendorID:](self, "initWithAddress:name:productID:starting:deviceType:batteryLevelHeadphoneCase:batteryLevelHeadphoneRight:batteryLevelHeadphoneLeft:appleAudioDevice:userWearing:vendorID:", a3, a4, a5, a6, *(_QWORD *)&a7, a8, a9, a10, a11, a12, 0);
}

@end
