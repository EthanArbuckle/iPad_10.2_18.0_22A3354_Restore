@implementation BMDeviceMetadata

- (BMDeviceMetadata)initWithName:(id)a3 build:(id)a4 platform:(int)a5 supplementalBuild:(id)a6 rapidSecurityResponsePreReboot:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  BMDeviceMetadata *v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v19.receiver = self;
  v19.super_class = (Class)BMDeviceMetadata;
  v17 = -[BMEventBase init](&v19, sel_init);
  if (v17)
  {
    v17->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v17->_name, a3);
    objc_storeStrong((id *)&v17->_build, a4);
    v17->_platform = a5;
    objc_storeStrong((id *)&v17->_supplementalBuild, a6);
    if (v16)
    {
      v17->_hasRapidSecurityResponsePreReboot = 1;
      v17->_rapidSecurityResponsePreReboot = objc_msgSend(v16, "BOOLValue");
    }
    else
    {
      v17->_hasRapidSecurityResponsePreReboot = 0;
      v17->_rapidSecurityResponsePreReboot = 0;
    }
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

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMDeviceMetadata name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDeviceMetadata build](self, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMDeviceMetadataDevicePlatformAsString(-[BMDeviceMetadata platform](self, "platform"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDeviceMetadata supplementalBuild](self, "supplementalBuild");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMDeviceMetadata rapidSecurityResponsePreReboot](self, "rapidSecurityResponsePreReboot"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMDeviceMetadata with name: %@, build: %@, platform: %@, supplementalBuild: %@, rapidSecurityResponsePreReboot: %@"), v4, v5, v6, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMDeviceMetadata *v5;
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
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  void *v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  BMDeviceMetadata *v34;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMDeviceMetadata;
  v5 = -[BMEventBase init](&v36, sel_init);
  if (!v5)
    goto LABEL_53;
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
          v20 = 32;
          goto LABEL_32;
        case 2u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 40;
          goto LABEL_32;
        case 3u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          while (2)
          {
            v24 = *v6;
            v25 = *(_QWORD *)&v4[v24];
            if (v25 == -1 || v25 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v26 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v25);
              *(_QWORD *)&v4[v24] = v25 + 1;
              v23 |= (unint64_t)(v26 & 0x7F) << v21;
              if (v26 < 0)
              {
                v21 += 7;
                v16 = v22++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_43;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v23) = 0;
LABEL_43:
          if (v23 >= 9)
            LODWORD(v23) = 0;
          v5->_platform = v23;
          continue;
        case 4u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 48;
LABEL_32:
          v27 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        case 5u:
          v28 = 0;
          v29 = 0;
          v30 = 0;
          v5->_hasRapidSecurityResponsePreReboot = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_52;
          continue;
      }
      while (1)
      {
        v31 = *v6;
        v32 = *(_QWORD *)&v4[v31];
        if (v32 == -1 || v32 >= *(_QWORD *)&v4[*v7])
          break;
        v33 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v32);
        *(_QWORD *)&v4[v31] = v32 + 1;
        v30 |= (unint64_t)(v33 & 0x7F) << v28;
        if ((v33 & 0x80) == 0)
          goto LABEL_47;
        v28 += 7;
        v16 = v29++ >= 9;
        if (v16)
        {
          v30 = 0;
          goto LABEL_49;
        }
      }
      v4[*v8] = 1;
LABEL_47:
      if (v4[*v8])
        v30 = 0;
LABEL_49:
      v5->_rapidSecurityResponsePreReboot = v30 != 0;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_52:
    v34 = 0;
  else
LABEL_53:
    v34 = v5;

  return v34;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_name)
    PBDataWriterWriteStringField();
  if (self->_build)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_supplementalBuild)
    PBDataWriterWriteStringField();
  if (self->_hasRapidSecurityResponsePreReboot)
    PBDataWriterWriteBOOLField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMDeviceMetadata writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMDeviceMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  BMDeviceMetadata *v15;
  id v17;
  id *v18;
  uint64_t v19;
  id *v20;
  uint64_t v21;
  id v22;
  id *v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  id *v34;
  id v35;
  id *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  _QWORD v50[3];

  v50[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("build"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v15 = 0;
          goto LABEL_20;
        }
        v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v23 = a4;
        v24 = *MEMORY[0x1E0D025B8];
        v47 = *MEMORY[0x1E0CB2D50];
        v39 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("build"));
        v48 = v39;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (id)objc_msgSend(v22, "initWithDomain:code:userInfo:", v24, 2, v10);
        a4 = 0;
        v15 = 0;
        *v23 = v25;
LABEL_19:

LABEL_20:
        v7 = v37;
        goto LABEL_21;
      }
      v36 = v9;
    }
    else
    {
      v36 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("platform"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v8;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v39 = v10;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v39 = 0;
            v15 = 0;
            a4 = v36;
            goto LABEL_19;
          }
          v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v31 = *MEMORY[0x1E0D025B8];
          v45 = *MEMORY[0x1E0CB2D50];
          v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("platform"));
          v46 = v12;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (id)objc_msgSend(v40, "initWithDomain:code:userInfo:", v31, 2, v11);
          v39 = 0;
          v15 = 0;
          *a4 = v32;
          goto LABEL_49;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMDeviceMetadataDevicePlatformFromString(v10));
        v39 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v39 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("supplementalBuild"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v12 = 0;
      goto LABEL_13;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v11;
LABEL_13:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rapidSecurityResponsePreReboot"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v33 = *MEMORY[0x1E0D025B8];
            v41 = *MEMORY[0x1E0CB2D50];
            v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("rapidSecurityResponsePreReboot"));
            v42 = v29;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *a4 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v33, 2, v30);

          }
          v14 = 0;
          v15 = 0;
          a4 = v36;
          goto LABEL_17;
        }
        v14 = v13;
      }
      else
      {
        v14 = 0;
      }
      a4 = v36;
      v15 = -[BMDeviceMetadata initWithName:build:platform:supplementalBuild:rapidSecurityResponsePreReboot:](self, "initWithName:build:platform:supplementalBuild:rapidSecurityResponsePreReboot:", v38, v36, objc_msgSend(v39, "intValue"), v12, v14);
      self = v15;
LABEL_17:

LABEL_18:
      v8 = v38;
      goto LABEL_19;
    }
    if (a4)
    {
      v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v34 = a4;
      v27 = *MEMORY[0x1E0D025B8];
      v43 = *MEMORY[0x1E0CB2D50];
      v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("supplementalBuild"));
      v44 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v27, 2, v13);
      v15 = 0;
      v12 = 0;
      a4 = v36;
      *v34 = v28;
      goto LABEL_17;
    }
    v12 = 0;
    v15 = 0;
LABEL_49:
    a4 = v36;
    goto LABEL_18;
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
    v15 = 0;
    goto LABEL_22;
  }
  v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v18 = a4;
  v19 = *MEMORY[0x1E0D025B8];
  v49 = *MEMORY[0x1E0CB2D50];
  v20 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("name"));
  v50[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v19;
  a4 = v20;
  v8 = 0;
  v15 = 0;
  *v18 = (id)objc_msgSend(v17, "initWithDomain:code:userInfo:", v21, 2, v9);
LABEL_21:

LABEL_22:
  return v15;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  -[BMDeviceMetadata name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDeviceMetadata build](self, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMDeviceMetadata platform](self, "platform"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDeviceMetadata supplementalBuild](self, "supplementalBuild");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMDeviceMetadata hasRapidSecurityResponsePreReboot](self, "hasRapidSecurityResponsePreReboot"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMDeviceMetadata rapidSecurityResponsePreReboot](self, "rapidSecurityResponsePreReboot"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v17 = CFSTR("name");
  v8 = (uint64_t)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v15 = v8;
  v22[0] = v8;
  v18 = CFSTR("build");
  v9 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v8, v17, v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[1] = v9;
  v19 = CFSTR("platform");
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[2] = v10;
  v20 = CFSTR("supplementalBuild");
  v11 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v11;
  v21 = CFSTR("rapidSecurityResponsePreReboot");
  v12 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[4] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v17, 5, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v6)
      goto LABEL_16;
  }
  else
  {

    if (v6)
    {
LABEL_16:
      if (v5)
        goto LABEL_17;
      goto LABEL_22;
    }
  }

  if (v5)
  {
LABEL_17:
    if (v4)
      goto LABEL_18;
LABEL_23:

    if (v3)
      goto LABEL_19;
LABEL_24:

    goto LABEL_19;
  }
LABEL_22:

  if (!v4)
    goto LABEL_23;
LABEL_18:
  if (!v3)
    goto LABEL_24;
LABEL_19:

  return v13;
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
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  _BOOL4 v26;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMDeviceMetadata name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMDeviceMetadata name](self, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_21;
    }
    -[BMDeviceMetadata build](self, "build");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "build");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMDeviceMetadata build](self, "build");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "build");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_21;
    }
    v19 = -[BMDeviceMetadata platform](self, "platform");
    if (v19 == objc_msgSend(v5, "platform"))
    {
      -[BMDeviceMetadata supplementalBuild](self, "supplementalBuild");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "supplementalBuild");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

      }
      else
      {
        v22 = (void *)v21;
        -[BMDeviceMetadata supplementalBuild](self, "supplementalBuild");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "supplementalBuild");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqual:", v24);

        if (!v25)
          goto LABEL_21;
      }
      if (!-[BMDeviceMetadata hasRapidSecurityResponsePreReboot](self, "hasRapidSecurityResponsePreReboot")
        && !objc_msgSend(v5, "hasRapidSecurityResponsePreReboot"))
      {
        LOBYTE(v12) = 1;
        goto LABEL_22;
      }
      if (-[BMDeviceMetadata hasRapidSecurityResponsePreReboot](self, "hasRapidSecurityResponsePreReboot")
        && objc_msgSend(v5, "hasRapidSecurityResponsePreReboot"))
      {
        v26 = -[BMDeviceMetadata rapidSecurityResponsePreReboot](self, "rapidSecurityResponsePreReboot");
        v12 = v26 ^ objc_msgSend(v5, "rapidSecurityResponsePreReboot") ^ 1;
LABEL_22:

        goto LABEL_23;
      }
    }
LABEL_21:
    LOBYTE(v12) = 0;
    goto LABEL_22;
  }
  LOBYTE(v12) = 0;
LABEL_23:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)build
{
  return self->_build;
}

- (int)platform
{
  return self->_platform;
}

- (NSString)supplementalBuild
{
  return self->_supplementalBuild;
}

- (BOOL)rapidSecurityResponsePreReboot
{
  return self->_rapidSecurityResponsePreReboot;
}

- (BOOL)hasRapidSecurityResponsePreReboot
{
  return self->_hasRapidSecurityResponsePreReboot;
}

- (void)setHasRapidSecurityResponsePreReboot:(BOOL)a3
{
  self->_hasRapidSecurityResponsePreReboot = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementalBuild, 0);
  objc_storeStrong((id *)&self->_build, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (unsigned)latestDataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  __objc2_class **v6;
  void *v7;
  _DWORD *v8;

  v5 = a3;
  if (a4 == 1)
  {
    v6 = off_1E5E4A980;
  }
  else
  {
    if (a4)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v6 = off_1E5E4A988;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D82B90]), "initWithData:", v5);
  v8 = (_DWORD *)objc_msgSend(objc_alloc(*v6), "initByReadFrom:", v7);
  v8[5] = a4;

LABEL_7:
  return v8;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("name"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("build"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("platform"), 0, 0, 3, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("supplementalBuild"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("rapidSecurityResponsePreReboot"), 0, 0, 5, 12, 0);
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
  return &unk_1E5F1B988;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("name"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("build"), 2, 13, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("platform"), 3, 4, 0);
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("supplementalBuild"), 4, 13, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("rapidSecurityResponsePreReboot"), 5, 12, 0);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
