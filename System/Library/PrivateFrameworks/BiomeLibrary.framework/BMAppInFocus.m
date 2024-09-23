@implementation BMAppInFocus

- (NSDate)absoluteTimestamp
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_absoluteTimestamp);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (int)type
{
  return self->_type;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  objc_class *v4;
  id v5;
  void *v6;
  _DWORD *v7;

  if (a4 == 10)
  {
    v4 = (objc_class *)MEMORY[0x1E0D82B90];
    v5 = a3;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithData:", v5);

    v7 = -[BMAppInFocus initByReadFrom:]([BMAppInFocus alloc], "initByReadFrom:", v6);
    v7[10] = 10;

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMAppInFocus *v5;
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
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  uint64_t v36;
  unint64_t v37;
  double v38;
  void *v39;
  char v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  char v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  BOOL v54;
  uint64_t v55;
  BMAppInFocus *v56;
  objc_super v58;

  v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)BMAppInFocus;
  v5 = -[BMEventBase init](&v58, sel_init);
  if (!v5)
    goto LABEL_84;
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
          v21 = 56;
          goto LABEL_45;
        case 2u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          while (2)
          {
            v25 = *v6;
            v26 = *(_QWORD *)&v4[v25];
            v27 = v26 + 1;
            if (v26 == -1 || v27 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v28 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v26);
              *(_QWORD *)&v4[v25] = v27;
              v24 |= (unint64_t)(v28 & 0x7F) << v22;
              if (v28 < 0)
              {
                v22 += 7;
                v17 = v23++ >= 9;
                if (v17)
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
          if (v24 >= 4)
            LODWORD(v24) = 0;
          v5->_type = v24;
          continue;
        case 3u:
          v29 = 0;
          v30 = 0;
          v31 = 0;
          v5->_hasStarting = 1;
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
              v31 |= (unint64_t)(v35 & 0x7F) << v29;
              if (v35 < 0)
              {
                v29 += 7;
                v17 = v30++ >= 9;
                if (v17)
                {
                  v31 = 0;
                  goto LABEL_69;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v31 = 0;
LABEL_69:
          v54 = v31 != 0;
          v55 = 32;
          goto LABEL_78;
        case 4u:
          v5->_hasRaw_absoluteTimestamp = 1;
          v36 = *v6;
          v37 = *(_QWORD *)&v4[v36];
          if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v38 = *(double *)(*(_QWORD *)&v4[*v9] + v37);
            *(_QWORD *)&v4[v36] = v37 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v38 = 0.0;
          }
          v5->_raw_absoluteTimestamp = v38;
          continue;
        case 6u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 64;
          goto LABEL_45;
        case 7u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 72;
          goto LABEL_45;
        case 8u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 80;
          goto LABEL_45;
        case 9u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 88;
          goto LABEL_45;
        case 0xAu:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 96;
LABEL_45:
          v39 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 0xBu:
          v40 = 0;
          v41 = 0;
          v42 = 0;
          v5->_hasDyldPlatform = 1;
          while (2)
          {
            v43 = *v6;
            v44 = *(_QWORD *)&v4[v43];
            v45 = v44 + 1;
            if (v44 == -1 || v45 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v46 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v44);
              *(_QWORD *)&v4[v43] = v45;
              v42 |= (unint64_t)(v46 & 0x7F) << v40;
              if (v46 < 0)
              {
                v40 += 7;
                v17 = v41++ >= 9;
                if (v17)
                {
                  LODWORD(v42) = 0;
                  goto LABEL_73;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v42) = 0;
LABEL_73:
          v5->_dyldPlatform = v42;
          continue;
        case 0xCu:
          v47 = 0;
          v48 = 0;
          v49 = 0;
          v5->_hasIsNativeArchitecture = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_83;
          continue;
      }
      while (1)
      {
        v50 = *v6;
        v51 = *(_QWORD *)&v4[v50];
        v52 = v51 + 1;
        if (v51 == -1 || v52 > *(_QWORD *)&v4[*v7])
          break;
        v53 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v51);
        *(_QWORD *)&v4[v50] = v52;
        v49 |= (unint64_t)(v53 & 0x7F) << v47;
        if ((v53 & 0x80) == 0)
          goto LABEL_75;
        v47 += 7;
        v17 = v48++ >= 9;
        if (v17)
        {
          v49 = 0;
          goto LABEL_77;
        }
      }
      v4[*v8] = 1;
LABEL_75:
      if (v4[*v8])
        v49 = 0;
LABEL_77:
      v54 = v49 != 0;
      v55 = 35;
LABEL_78:
      *((_BYTE *)&v5->super.super.isa + v55) = v54;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_83:
    v56 = 0;
  else
LABEL_84:
    v56 = v5;

  return v56;
}

- (BMAppInFocus)initWithLaunchReason:(id)a3 launchType:(int)a4 starting:(id)a5 absoluteTimestamp:(id)a6 duration:(id)a7 bundleID:(id)a8 parentBundleID:(id)a9 extensionHostID:(id)a10 shortVersionString:(id)a11 exactVersionString:(id)a12
{
  return -[BMAppInFocus initWithLaunchReason:type:starting:absoluteTimestamp:bundleID:parentBundleID:extensionHostID:shortVersionString:exactVersionString:dyldPlatform:isNativeArchitecture:](self, "initWithLaunchReason:type:starting:absoluteTimestamp:bundleID:parentBundleID:extensionHostID:shortVersionString:exactVersionString:dyldPlatform:isNativeArchitecture:", a3, *(_QWORD *)&a4, a5, a6, a8, a9, a10, a11, a12, 0, 0);
}

- (BMAppInFocus)initWithLaunchReason:(id)a3 type:(int)a4 starting:(id)a5 absoluteTimestamp:(id)a6 bundleID:(id)a7 parentBundleID:(id)a8 extensionHostID:(id)a9 shortVersionString:(id)a10 exactVersionString:(id)a11 dyldPlatform:(id)a12 isNativeArchitecture:(id)a13
{
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  BMAppInFocus *v22;
  double v23;
  unsigned int v24;
  id v28;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  objc_super v36;

  v35 = a3;
  v17 = a5;
  v18 = a6;
  v28 = a7;
  v34 = a7;
  v33 = a8;
  v32 = a9;
  v31 = a10;
  v30 = a11;
  v19 = v18;
  v20 = a12;
  v21 = a13;
  v36.receiver = self;
  v36.super_class = (Class)BMAppInFocus;
  v22 = -[BMEventBase init](&v36, sel_init);
  if (v22)
  {
    v22->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v22->_launchReason, a3);
    v22->_type = a4;
    if (v17)
    {
      v22->_hasStarting = 1;
      v22->_starting = objc_msgSend(v17, "BOOLValue");
    }
    else
    {
      v22->_hasStarting = 0;
      v22->_starting = 0;
    }
    if (v19)
    {
      v22->_hasRaw_absoluteTimestamp = 1;
      objc_msgSend(v19, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v22->_hasRaw_absoluteTimestamp = 0;
      v23 = -1.0;
    }
    v22->_raw_absoluteTimestamp = v23;
    objc_storeStrong((id *)&v22->_bundleID, v28);
    objc_storeStrong((id *)&v22->_parentBundleID, a8);
    objc_storeStrong((id *)&v22->_extensionHostID, a9);
    objc_storeStrong((id *)&v22->_shortVersionString, a10);
    objc_storeStrong((id *)&v22->_exactVersionString, a11);
    if (v20)
    {
      v22->_hasDyldPlatform = 1;
      v24 = objc_msgSend(v20, "unsignedIntValue");
    }
    else
    {
      v24 = 0;
      v22->_hasDyldPlatform = 0;
    }
    v22->_dyldPlatform = v24;
    if (v21)
    {
      v22->_hasIsNativeArchitecture = 1;
      v22->_isNativeArchitecture = objc_msgSend(v21, "BOOLValue");
    }
    else
    {
      v22->_hasIsNativeArchitecture = 0;
      v22->_isNativeArchitecture = 0;
    }
  }

  return v22;
}

+ (unsigned)latestDataVersion
{
  return 10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exactVersionString, 0);
  objc_storeStrong((id *)&self->_shortVersionString, 0);
  objc_storeStrong((id *)&self->_extensionHostID, 0);
  objc_storeStrong((id *)&self->_parentBundleID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_launchReason, 0);
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
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[15];

  v17[13] = *MEMORY[0x1E0C80C00];
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("launchReason"), 2, 0, 1, 13, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("type"), 0, 0, 2, 4, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("launchType"), 0, 0, 2, 4, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("starting"), 0, 0, 3, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 4, 0, 1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("duration"), 1, 0, 5, 0, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleID"), 2, 0, 6, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("parentBundleID"), 2, 0, 7, 13, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("extensionHostID"), 2, 0, 8, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("shortVersionString"), 2, 0, 9, 13, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("exactVersionString"), 2, 0, 10, 13, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("dyldPlatform"), 0, 0, 11, 4, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isNativeArchitecture"), 0, 0, 12, 12, 0);
  v17[0] = v16;
  v17[1] = v15;
  v17[2] = v14;
  v17[3] = v2;
  v17[4] = v3;
  v17[5] = v4;
  v17[6] = v5;
  v17[7] = v6;
  v17[8] = v13;
  v17[9] = v7;
  v17[10] = v12;
  v17[11] = v8;
  v17[12] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 13);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMAppInFocus writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (self->_launchReason)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_hasStarting)
    PBDataWriterWriteBOOLField();
  if (self->_hasRaw_absoluteTimestamp)
    PBDataWriterWriteDoubleField();
  v4 = v5;
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_parentBundleID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_extensionHostID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_shortVersionString)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_exactVersionString)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasDyldPlatform)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_hasIsNativeArchitecture)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }

}

- (BOOL)starting
{
  return self->_starting;
}

- (NSString)shortVersionString
{
  return self->_shortVersionString;
}

- (NSString)parentBundleID
{
  return self->_parentBundleID;
}

- (BOOL)hasIsNativeArchitecture
{
  return self->_hasIsNativeArchitecture;
}

- (BOOL)hasDyldPlatform
{
  return self->_hasDyldPlatform;
}

- (NSString)extensionHostID
{
  return self->_extensionHostID;
}

- (NSString)exactVersionString
{
  return self->_exactVersionString;
}

- (BMAppInFocus)initWithLaunchReason:(id)a3 launchType:(int)a4 starting:(id)a5 absoluteTimestamp:(id)a6 duration:(id)a7 bundleID:(id)a8 parentBundleID:(id)a9 extensionHostID:(id)a10 shortVersionString:(id)a11 exactVersionString:(id)a12 dyldPlatform:(id)a13 isNativeArchitecture:(id)a14
{
  return -[BMAppInFocus initWithLaunchReason:type:starting:absoluteTimestamp:bundleID:parentBundleID:extensionHostID:shortVersionString:exactVersionString:dyldPlatform:isNativeArchitecture:](self, "initWithLaunchReason:type:starting:absoluteTimestamp:bundleID:parentBundleID:extensionHostID:shortVersionString:exactVersionString:dyldPlatform:isNativeArchitecture:", a3, *(_QWORD *)&a4, a5, a6, a8, a9);
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
  -[BMAppInFocus launchReason](self, "launchReason");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  BMAppInFocusTypeAsString(-[BMAppInFocus type](self, "type"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppInFocus starting](self, "starting"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppInFocus absoluteTimestamp](self, "absoluteTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppInFocus bundleID](self, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppInFocus parentBundleID](self, "parentBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppInFocus extensionHostID](self, "extensionHostID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppInFocus shortVersionString](self, "shortVersionString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppInFocus exactVersionString](self, "exactVersionString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMAppInFocus dyldPlatform](self, "dyldPlatform"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppInFocus isNativeArchitecture](self, "isNativeArchitecture"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("BMAppInFocus with launchReason: %@, type: %@, starting: %@, absoluteTimestamp: %@, bundleID: %@, parentBundleID: %@, extensionHostID: %@, shortVersionString: %@, exactVersionString: %@, dyldPlatform: %@, isNativeArchitecture: %@"), v14, v13, v12, v3, v4, v5, v6, v7, v8, v9, v10);

  return (NSString *)v16;
}

- (BMAppInFocus)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  objc_class *v17;
  id v18;
  id v19;
  double v20;
  double v21;
  id v22;
  id *v23;
  uint64_t v24;
  id *v25;
  uint64_t v26;
  id v27;
  BMAppInFocus *v28;
  void *v29;
  void *v30;
  void *v31;
  BMAppInFocus *v32;
  id v33;
  void *v34;
  id v35;
  id *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  id *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id *v48;
  uint64_t v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  id v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  void *v67;
  id v68;
  id v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  void *v75;
  void *v76;
  id *v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  id v82;
  uint64_t v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  id v88;
  id v89;
  void *v90;
  void *v91;
  id *v92;
  void *v93;
  void *v94;
  id *v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  id v108;
  uint64_t v109;
  id v110;
  uint64_t v111;
  id v112;
  uint64_t v113;
  id v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  id v118;
  uint64_t v119;
  id v120;
  uint64_t v121;
  id v122;
  uint64_t v123;
  id v124;
  uint64_t v125;
  _QWORD v126[3];

  v126[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("launchReason"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
LABEL_4:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v8
       || (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("launchType")),
           (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v9 = v7;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v95 = a4;
        v10 = v8;
        v8 = v10;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v28 = 0;
            goto LABEL_100;
          }
          v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v48 = a4;
          v49 = *MEMORY[0x1E0D025B8];
          v123 = *MEMORY[0x1E0CB2D50];
          v101 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("type"));
          v124 = v101;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v124, &v123, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = (id)objc_msgSend(v47, "initWithDomain:code:userInfo:", v49, 2, v11);
          a4 = 0;
          v28 = 0;
          *v48 = v50;
          v7 = v9;
          goto LABEL_99;
        }
        v95 = a4;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMAppInFocusTypeFromString(v8));
        v10 = (id *)objc_claimAutoreleasedReturnValue();
      }
      a4 = v10;
    }
    else
    {
      v95 = a4;
      a4 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("starting"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v95)
        {
          v101 = 0;
          v28 = 0;
LABEL_99:

          goto LABEL_100;
        }
        v102 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v36 = a4;
        v37 = *MEMORY[0x1E0D025B8];
        v121 = *MEMORY[0x1E0CB2D50];
        v99 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("starting"));
        v122 = v99;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v122, &v121, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v37;
        a4 = v36;
        v40 = (id)objc_msgSend(v102, "initWithDomain:code:userInfo:", v39, 2, v38);
        v101 = 0;
        v28 = 0;
        *v95 = v40;
LABEL_98:

        goto LABEL_99;
      }
      v98 = v7;
      v101 = v11;
    }
    else
    {
      v98 = v7;
      v101 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = (objc_class *)MEMORY[0x1E0C99D68];
        v18 = v12;
        v19 = [v17 alloc];
        objc_msgSend(v18, "doubleValue");
        v21 = v20;

        v99 = (id)objc_msgSend(v19, "initWithTimeIntervalSinceReferenceDate:", v21);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v41 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v41, "dateFromString:", v12);
          v99 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v95)
            {
              v99 = 0;
              v28 = 0;
              v38 = v12;
              v7 = v98;
              goto LABEL_98;
            }
            v100 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v78 = a4;
            v79 = *MEMORY[0x1E0D025B8];
            v119 = *MEMORY[0x1E0CB2D50];
            v97 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("absoluteTimestamp"));
            v120 = v97;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v80 = v79;
            a4 = v78;
            v81 = (id)objc_msgSend(v100, "initWithDomain:code:userInfo:", v80, 2, v13);
            v99 = 0;
            v28 = 0;
            *v95 = v81;
            v38 = v12;
            goto LABEL_108;
          }
          v99 = v12;
        }
      }
    }
    else
    {
      v99 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bundleID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = v12;
    if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v97 = 0;
LABEL_24:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("parentBundleID"));
      v14 = objc_claimAutoreleasedReturnValue();
      v91 = v13;
      v92 = a4;
      v93 = (void *)v14;
      if (v14 && (v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v51 = v8;
          if (!v95)
          {
            v96 = 0;
            v28 = 0;
            v7 = v98;
            v38 = v12;
            goto LABEL_96;
          }
          v52 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v53 = v11;
          v54 = *MEMORY[0x1E0D025B8];
          v115 = *MEMORY[0x1E0CB2D50];
          v55 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("parentBundleID"));
          v116 = v55;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
          v56 = objc_claimAutoreleasedReturnValue();
          v57 = v52;
          a4 = v92;
          v58 = v54;
          v11 = v53;
          v16 = (id)v55;
          v90 = (void *)v56;
          v28 = 0;
          v96 = 0;
          *v95 = (id)objc_msgSend(v57, "initWithDomain:code:userInfo:", v58, 2);
          goto LABEL_105;
        }
        v96 = v15;
      }
      else
      {
        v96 = 0;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("extensionHostID"));
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v87 = v6;
      v90 = v16;
      if (!v16)
      {
LABEL_42:
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shortVersionString"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v63 = v8;
            if (!v95)
            {
              v89 = 0;
              v28 = 0;
              v38 = v94;
              v7 = v98;
              goto LABEL_94;
            }
            v64 = v11;
            v65 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v66 = *MEMORY[0x1E0D025B8];
            v111 = *MEMORY[0x1E0CB2D50];
            v88 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("shortVersionString"));
            v112 = v88;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = v65;
            v11 = v64;
            v28 = 0;
            v89 = 0;
            *v95 = (id)objc_msgSend(v67, "initWithDomain:code:userInfo:", v66, 2, v30);
            goto LABEL_111;
          }
          v89 = v29;
        }
        else
        {
          v89 = 0;
        }
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("exactVersionString"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = v11;
        if (!v30 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v88 = 0;
LABEL_48:
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dyldPlatform"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = v16;
          if (v31 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v85 = v8;
              if (!v95)
              {
                v33 = 0;
                v28 = 0;
                goto LABEL_91;
              }
              v32 = self;
              v82 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v73 = *MEMORY[0x1E0D025B8];
              v107 = *MEMORY[0x1E0CB2D50];
              v35 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("dyldPlatform"));
              v108 = v35;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v74 = (id)objc_msgSend(v82, "initWithDomain:code:userInfo:", v73, 2, v34);
              v28 = 0;
              v33 = 0;
              *v95 = v74;
              goto LABEL_89;
            }
            v32 = self;
            v33 = v31;
          }
          else
          {
            v32 = self;
            v33 = 0;
          }
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isNativeArchitecture"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v34 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v35 = 0;
LABEL_54:
            v28 = -[BMAppInFocus initWithLaunchReason:type:starting:absoluteTimestamp:bundleID:parentBundleID:extensionHostID:shortVersionString:exactVersionString:dyldPlatform:isNativeArchitecture:](v32, "initWithLaunchReason:type:starting:absoluteTimestamp:bundleID:parentBundleID:extensionHostID:shortVersionString:exactVersionString:dyldPlatform:isNativeArchitecture:", v98, objc_msgSend(v92, "intValue"), v101, v99, v97, v96, v86, v89, v88, v33, v35);
            v32 = v28;
LABEL_90:
            self = v32;

            v11 = v84;
            v16 = v86;
            goto LABEL_91;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v35 = v34;
            goto LABEL_54;
          }
          v85 = v8;
          if (v95)
          {
            v104 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v83 = *MEMORY[0x1E0D025B8];
            v105 = *MEMORY[0x1E0CB2D50];
            v75 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isNativeArchitecture"));
            v106 = v75;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            *v95 = (id)objc_msgSend(v104, "initWithDomain:code:userInfo:", v83, 2, v76);

          }
          v35 = 0;
          v28 = 0;
LABEL_89:
          v8 = v85;
          goto LABEL_90;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v88 = v30;
          goto LABEL_48;
        }
        v63 = v8;
        if (v95)
        {
          v68 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v69 = v16;
          v70 = *MEMORY[0x1E0D025B8];
          v109 = *MEMORY[0x1E0CB2D50];
          v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("exactVersionString"));
          v110 = v33;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = v68;
          v11 = v84;
          v72 = v70;
          v16 = v69;
          v28 = 0;
          v88 = 0;
          *v95 = (id)objc_msgSend(v71, "initWithDomain:code:userInfo:", v72, 2, v31);
LABEL_91:

LABEL_92:
          v7 = v98;
          goto LABEL_93;
        }
        v88 = 0;
        v28 = 0;
LABEL_111:
        v8 = v63;
        goto LABEL_92;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = 0;
        goto LABEL_42;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = v16;
        goto LABEL_42;
      }
      v51 = v8;
      if (v95)
      {
        v59 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v60 = v11;
        v61 = *MEMORY[0x1E0D025B8];
        v113 = *MEMORY[0x1E0CB2D50];
        v89 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("extensionHostID"));
        v114 = v89;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = v61;
        v11 = v60;
        v28 = 0;
        v16 = 0;
        *v95 = (id)objc_msgSend(v59, "initWithDomain:code:userInfo:", v62, 2, v29);
        v7 = v98;
LABEL_93:
        v38 = v94;
        v13 = v91;
LABEL_94:

        v6 = v87;
        a4 = v92;
LABEL_95:

        goto LABEL_96;
      }
      v16 = 0;
      v28 = 0;
LABEL_105:
      v7 = v98;
      v8 = v51;
      v38 = v94;
      goto LABEL_95;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v97 = v13;
      goto LABEL_24;
    }
    if (v95)
    {
      v42 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v43 = a4;
      v44 = *MEMORY[0x1E0D025B8];
      v117 = *MEMORY[0x1E0CB2D50];
      v96 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bundleID"));
      v118 = v96;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
      v45 = objc_claimAutoreleasedReturnValue();
      v46 = v44;
      a4 = v43;
      v93 = (void *)v45;
      v28 = 0;
      v97 = 0;
      *v95 = (id)objc_msgSend(v42, "initWithDomain:code:userInfo:", v46, 2);
      v38 = v12;
      v7 = v98;
LABEL_96:

LABEL_97:
      goto LABEL_98;
    }
    v97 = 0;
    v28 = 0;
    v38 = v12;
LABEL_108:
    v7 = v98;
    goto LABEL_97;
  }
  if (a4)
  {
    v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v23 = a4;
    v24 = *MEMORY[0x1E0D025B8];
    v125 = *MEMORY[0x1E0CB2D50];
    v25 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("launchReason"));
    v126[0] = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v126, &v125, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v24;
    a4 = v25;
    v27 = (id)objc_msgSend(v22, "initWithDomain:code:userInfo:", v26, 2, v8);
    v7 = 0;
    v28 = 0;
    *v23 = v27;
LABEL_100:

    goto LABEL_101;
  }
  v7 = 0;
  v28 = 0;
LABEL_101:

  return v28;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
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
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[2];
  const __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  const __CFString *v44;
  const __CFString *v45;
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  -[BMAppInFocus launchReason](self, "launchReason");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMAppInFocus type](self, "type"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (-[BMAppInFocus hasStarting](self, "hasStarting"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppInFocus starting](self, "starting"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[BMAppInFocus absoluteTimestamp](self, "absoluteTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAppInFocus absoluteTimestamp](self, "absoluteTimestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    objc_msgSend(v7, "numberWithDouble:");
    v9 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  -[BMAppInFocus bundleID](self, "bundleID");
  v10 = objc_claimAutoreleasedReturnValue();
  -[BMAppInFocus parentBundleID](self, "parentBundleID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppInFocus extensionHostID](self, "extensionHostID");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppInFocus shortVersionString](self, "shortVersionString");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppInFocus exactVersionString](self, "exactVersionString");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMAppInFocus hasDyldPlatform](self, "hasDyldPlatform"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMAppInFocus dyldPlatform](self, "dyldPlatform"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = 0;
  }
  if (-[BMAppInFocus hasIsNativeArchitecture](self, "hasIsNativeArchitecture"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppInFocus isNativeArchitecture](self, "isNativeArchitecture"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v40[0] = CFSTR("launchReason");
  v12 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)v12;
  v51 = v12;
  v40[1] = CFSTR("type");
  if (v4)
  {
    v52 = v4;
    v41 = CFSTR("launchType");
    v13 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (uint64_t)v26;
    v41 = CFSTR("launchType");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v13;
  v53 = v13;
  v42 = CFSTR("starting");
  v14 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v14;
  v54 = v14;
  v43 = CFSTR("absoluteTimestamp");
  v15 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v34 = (void *)v3;
  v27 = (void *)v15;
  v55 = v15;
  v44 = CFSTR("bundleID");
  v16 = (void *)v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v4;
  v56 = v16;
  v45 = CFSTR("parentBundleID");
  v17 = v39;
  if (!v39)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)v5;
  v57 = v17;
  v46 = CFSTR("extensionHostID");
  v18 = v38;
  if (!v38)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v9;
  v58 = v18;
  v47 = CFSTR("shortVersionString");
  v20 = v37;
  if (!v37)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v10;
  v59 = v20;
  v48 = CFSTR("exactVersionString");
  v22 = v36;
  if (!v36)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v60 = v22;
  v49 = CFSTR("dyldPlatform");
  v23 = v35;
  if (!v35)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v61 = v23;
  v50 = CFSTR("isNativeArchitecture");
  v24 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v62 = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, v40, 12);
  v31 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)

  if (!v35)
  if (!v36)

  if (!v37)
  if (!v38)

  if (!v39)
  if (!v21)

  if (v19)
  {
    if (v32)
      goto LABEL_52;
  }
  else
  {

    if (v32)
    {
LABEL_52:
      if (v33)
        goto LABEL_53;
LABEL_57:

      if (v34)
        goto LABEL_54;
LABEL_58:

      goto LABEL_54;
    }
  }

  if (!v33)
    goto LABEL_57;
LABEL_53:
  if (!v34)
    goto LABEL_58;
LABEL_54:

  return v31;
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
  int v12;
  int v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  unsigned int v51;
  _BOOL4 v52;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMAppInFocus launchReason](self, "launchReason");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "launchReason");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMAppInFocus launchReason](self, "launchReason");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "launchReason");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_47;
    }
    v13 = -[BMAppInFocus type](self, "type");
    if (v13 != objc_msgSend(v5, "type"))
      goto LABEL_47;
    if (-[BMAppInFocus hasStarting](self, "hasStarting") || objc_msgSend(v5, "hasStarting"))
    {
      if (!-[BMAppInFocus hasStarting](self, "hasStarting"))
        goto LABEL_47;
      if (!objc_msgSend(v5, "hasStarting"))
        goto LABEL_47;
      v14 = -[BMAppInFocus starting](self, "starting");
      if (v14 != objc_msgSend(v5, "starting"))
        goto LABEL_47;
    }
    -[BMAppInFocus absoluteTimestamp](self, "absoluteTimestamp");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimestamp");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v15 == (void *)v16)
    {

    }
    else
    {
      v17 = (void *)v16;
      -[BMAppInFocus absoluteTimestamp](self, "absoluteTimestamp");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqual:", v19);

      if (!v20)
        goto LABEL_47;
    }
    -[BMAppInFocus bundleID](self, "bundleID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleID");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v21 == (void *)v22)
    {

    }
    else
    {
      v23 = (void *)v22;
      -[BMAppInFocus bundleID](self, "bundleID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqual:", v25);

      if (!v26)
        goto LABEL_47;
    }
    -[BMAppInFocus parentBundleID](self, "parentBundleID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "parentBundleID");
    v28 = objc_claimAutoreleasedReturnValue();
    if (v27 == (void *)v28)
    {

    }
    else
    {
      v29 = (void *)v28;
      -[BMAppInFocus parentBundleID](self, "parentBundleID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "parentBundleID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "isEqual:", v31);

      if (!v32)
        goto LABEL_47;
    }
    -[BMAppInFocus extensionHostID](self, "extensionHostID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "extensionHostID");
    v34 = objc_claimAutoreleasedReturnValue();
    if (v33 == (void *)v34)
    {

    }
    else
    {
      v35 = (void *)v34;
      -[BMAppInFocus extensionHostID](self, "extensionHostID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "extensionHostID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v36, "isEqual:", v37);

      if (!v38)
        goto LABEL_47;
    }
    -[BMAppInFocus shortVersionString](self, "shortVersionString");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "shortVersionString");
    v40 = objc_claimAutoreleasedReturnValue();
    if (v39 == (void *)v40)
    {

    }
    else
    {
      v41 = (void *)v40;
      -[BMAppInFocus shortVersionString](self, "shortVersionString");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "shortVersionString");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v42, "isEqual:", v43);

      if (!v44)
        goto LABEL_47;
    }
    -[BMAppInFocus exactVersionString](self, "exactVersionString");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "exactVersionString");
    v46 = objc_claimAutoreleasedReturnValue();
    if (v45 == (void *)v46)
    {

    }
    else
    {
      v47 = (void *)v46;
      -[BMAppInFocus exactVersionString](self, "exactVersionString");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "exactVersionString");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v48, "isEqual:", v49);

      if (!v50)
        goto LABEL_47;
    }
    if (!-[BMAppInFocus hasDyldPlatform](self, "hasDyldPlatform") && !objc_msgSend(v5, "hasDyldPlatform")
      || -[BMAppInFocus hasDyldPlatform](self, "hasDyldPlatform")
      && objc_msgSend(v5, "hasDyldPlatform")
      && (v51 = -[BMAppInFocus dyldPlatform](self, "dyldPlatform"), v51 == objc_msgSend(v5, "dyldPlatform")))
    {
      if (!-[BMAppInFocus hasIsNativeArchitecture](self, "hasIsNativeArchitecture")
        && !objc_msgSend(v5, "hasIsNativeArchitecture"))
      {
        LOBYTE(v12) = 1;
        goto LABEL_48;
      }
      if (-[BMAppInFocus hasIsNativeArchitecture](self, "hasIsNativeArchitecture")
        && objc_msgSend(v5, "hasIsNativeArchitecture"))
      {
        v52 = -[BMAppInFocus isNativeArchitecture](self, "isNativeArchitecture");
        v12 = v52 ^ objc_msgSend(v5, "isNativeArchitecture") ^ 1;
LABEL_48:

        goto LABEL_49;
      }
    }
LABEL_47:
    LOBYTE(v12) = 0;
    goto LABEL_48;
  }
  LOBYTE(v12) = 0;
LABEL_49:

  return v12;
}

- (NSString)launchReason
{
  return self->_launchReason;
}

- (BOOL)hasStarting
{
  return self->_hasStarting;
}

- (void)setHasStarting:(BOOL)a3
{
  self->_hasStarting = a3;
}

- (unsigned)dyldPlatform
{
  return self->_dyldPlatform;
}

- (void)setHasDyldPlatform:(BOOL)a3
{
  self->_hasDyldPlatform = a3;
}

- (BOOL)isNativeArchitecture
{
  return self->_isNativeArchitecture;
}

- (void)setHasIsNativeArchitecture:(BOOL)a3
{
  self->_hasIsNativeArchitecture = a3;
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)hasDuration
{
  return self->_hasDuration;
}

- (void)setHasDuration:(BOOL)a3
{
  self->_hasDuration = a3;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1C750;
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
  void *v15;
  _QWORD v16[13];

  v16[12] = *MEMORY[0x1E0C80C00];
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("launchReason"), 1, 13, 0);
  v16[0] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("type"), 2, 4, 0);
  v16[1] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("starting"), 3, 12, 0);
  v16[2] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 4, 0, 0);
  v16[3] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("duration"), 5, 0, 0);
  v16[4] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleID"), 6, 13, 0);
  v16[5] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("parentBundleID"), 7, 13, 0);
  v16[6] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("extensionHostID"), 8, 13, 0);
  v16[7] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("shortVersionString"), 9, 13, 0);
  v16[8] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("exactVersionString"), 10, 13, 0);
  v16[9] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("dyldPlatform"), 11, 4, 0);
  v16[10] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isNativeArchitecture"), 12, 12, 0);
  v16[11] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
