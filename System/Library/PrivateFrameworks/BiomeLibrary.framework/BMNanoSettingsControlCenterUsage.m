@implementation BMNanoSettingsControlCenterUsage

- (BMNanoSettingsControlCenterUsage)initWithTransition:(int)a3 statusDetailTransition:(int)a4 buttonID:(id)a5 buttonPress:(int)a6
{
  id v10;
  BMNanoSettingsControlCenterUsage *v11;
  int v12;
  objc_super v14;

  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMNanoSettingsControlCenterUsage;
  v11 = -[BMEventBase init](&v14, sel_init);
  if (v11)
  {
    v11->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v11->_transition = a3;
    v11->_statusDetailTransition = a4;
    if (v10)
    {
      v11->_hasButtonID = 1;
      v12 = objc_msgSend(v10, "intValue");
    }
    else
    {
      v11->_hasButtonID = 0;
      v12 = -1;
    }
    v11->_buttonID = v12;
    v11->_buttonPress = a6;
  }

  return v11;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  BMNanoSettingsControlCenterUsageTransitionTypeAsString(-[BMNanoSettingsControlCenterUsage transition](self, "transition"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMNanoSettingsControlCenterUsageStatusDetailTransitionTypeAsString(-[BMNanoSettingsControlCenterUsage statusDetailTransition](self, "statusDetailTransition"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMNanoSettingsControlCenterUsage buttonID](self, "buttonID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BMNanoSettingsControlCenterUsageButtonPressTypeAsString(-[BMNanoSettingsControlCenterUsage buttonPress](self, "buttonPress"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMNanoSettingsControlCenterUsage with transition: %@, statusDetailTransition: %@, buttonID: %@, buttonPress: %@"), v4, v5, v6, v7);

  return (NSString *)v8;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMNanoSettingsControlCenterUsage *v5;
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
  int *v40;
  BMNanoSettingsControlCenterUsage *v41;
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)BMNanoSettingsControlCenterUsage;
  v5 = -[BMEventBase init](&v43, sel_init);
  if (!v5)
    goto LABEL_76;
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
              goto LABEL_51;
            v19 += 7;
            v16 = v20++ >= 9;
            if (v16)
            {
              LODWORD(v21) = 0;
              goto LABEL_53;
            }
          }
          v4[*v8] = 1;
LABEL_51:
          if (v4[*v8])
            LODWORD(v21) = 0;
LABEL_53:
          if (v21 >= 4)
            LODWORD(v21) = 0;
          v40 = &OBJC_IVAR___BMNanoSettingsControlCenterUsage__transition;
          goto LABEL_72;
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
                  goto LABEL_59;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v21) = 0;
LABEL_59:
          if (v21 >= 3)
            LODWORD(v21) = 0;
          v40 = &OBJC_IVAR___BMNanoSettingsControlCenterUsage__statusDetailTransition;
          goto LABEL_72;
        case 3u:
          v30 = 0;
          v31 = 0;
          v21 = 0;
          v5->_hasButtonID = 1;
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
                  goto LABEL_65;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v21) = 0;
LABEL_65:
          v40 = &OBJC_IVAR___BMNanoSettingsControlCenterUsage__buttonID;
          goto LABEL_72;
        case 4u:
          v35 = 0;
          v36 = 0;
          v21 = 0;
          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            goto LABEL_75;
          continue;
      }
      while (1)
      {
        v37 = *v6;
        v38 = *(_QWORD *)&v4[v37];
        if (v38 == -1 || v38 >= *(_QWORD *)&v4[*v7])
          break;
        v39 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v38);
        *(_QWORD *)&v4[v37] = v38 + 1;
        v21 |= (unint64_t)(v39 & 0x7F) << v35;
        if ((v39 & 0x80) == 0)
          goto LABEL_67;
        v35 += 7;
        v16 = v36++ >= 9;
        if (v16)
        {
          LODWORD(v21) = 0;
          goto LABEL_69;
        }
      }
      v4[*v8] = 1;
LABEL_67:
      if (v4[*v8])
        LODWORD(v21) = 0;
LABEL_69:
      if (v21 >= 3)
        LODWORD(v21) = 0;
      v40 = &OBJC_IVAR___BMNanoSettingsControlCenterUsage__buttonPress;
LABEL_72:
      *(_DWORD *)((char *)&v5->super.super.isa + *v40) = v21;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_75:
    v41 = 0;
  else
LABEL_76:
    v41 = v5;

  return v41;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasButtonID)
    PBDataWriterWriteInt32Field();
  PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMNanoSettingsControlCenterUsage writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMNanoSettingsControlCenterUsage)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  BMNanoSettingsControlCenterUsage *v19;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id *v29;
  id v30;
  BMNanoSettingsControlCenterUsage *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("transition"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = self;
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v33 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("statusDetailTransition"));
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
            v9 = 0;
            v19 = 0;
            goto LABEL_34;
          }
          v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v24 = *MEMORY[0x1E0D025B8];
          v38 = *MEMORY[0x1E0CB2D50];
          v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("statusDetailTransition"));
          v39 = v13;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v24, 2, v11);
          v9 = 0;
          v19 = 0;
          *a4 = v25;
          goto LABEL_33;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMNanoSettingsControlCenterUsageStatusDetailTransitionTypeFromString(v8));
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      v9 = v10;
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("buttonID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v13 = 0;
          v19 = 0;
          goto LABEL_33;
        }
        v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v17 = *MEMORY[0x1E0D025B8];
        v36 = *MEMORY[0x1E0CB2D50];
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("buttonID"));
        v37 = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
        v29 = a4;
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v17, 2, v14);
        v13 = 0;
        v19 = 0;
        *v29 = v18;
        goto LABEL_32;
      }
      v12 = a4;
      v13 = v11;
    }
    else
    {
      v12 = a4;
      v13 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("buttonPress"));
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
            v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v28 = *MEMORY[0x1E0D025B8];
            v34 = *MEMORY[0x1E0CB2D50];
            v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("buttonPress"));
            v35 = v26;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *v12 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v28, 2, v27);

          }
          v15 = 0;
          v19 = 0;
          self = v31;
          goto LABEL_32;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMNanoSettingsControlCenterUsageButtonPressTypeFromString(v14));
        v16 = (id)objc_claimAutoreleasedReturnValue();
      }
      v15 = v16;
    }
    else
    {
      v15 = 0;
    }
    self = -[BMNanoSettingsControlCenterUsage initWithTransition:statusDetailTransition:buttonID:buttonPress:](v31, "initWithTransition:statusDetailTransition:buttonID:buttonPress:", objc_msgSend(v33, "intValue"), objc_msgSend(v9, "intValue"), v13, objc_msgSend(v15, "intValue"));
    v19 = self;
LABEL_32:

LABEL_33:
    goto LABEL_34;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v33 = v7;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMNanoSettingsControlCenterUsageTransitionTypeFromString(v7));
    v33 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  if (!a4)
  {
    v33 = 0;
    v19 = 0;
    goto LABEL_35;
  }
  v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v22 = *MEMORY[0x1E0D025B8];
  v40 = *MEMORY[0x1E0CB2D50];
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("transition"));
  v41[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v19 = 0;
  *a4 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 2, v8);
LABEL_34:

LABEL_35:
  return v19;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMNanoSettingsControlCenterUsage transition](self, "transition"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMNanoSettingsControlCenterUsage statusDetailTransition](self, "statusDetailTransition"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMNanoSettingsControlCenterUsage hasButtonID](self, "hasButtonID"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMNanoSettingsControlCenterUsage buttonID](self, "buttonID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMNanoSettingsControlCenterUsage buttonPress](self, "buttonPress"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("transition");
  v7 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v7;
  v13[1] = CFSTR("statusDetailTransition");
  v8 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v8;
  v13[2] = CFSTR("buttonID");
  v9 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[2] = v9;
  v13[3] = CFSTR("buttonPress");
  v10 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (v5)
      goto LABEL_14;
  }
  else
  {

    if (v5)
    {
LABEL_14:
      if (v4)
        goto LABEL_15;
LABEL_19:

      if (v3)
        goto LABEL_16;
LABEL_20:

      goto LABEL_16;
    }
  }

  if (!v4)
    goto LABEL_19;
LABEL_15:
  if (!v3)
    goto LABEL_20;
LABEL_16:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  int v8;
  int v9;
  BOOL v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMNanoSettingsControlCenterUsage transition](self, "transition");
    if (v6 == objc_msgSend(v5, "transition")
      && (v7 = -[BMNanoSettingsControlCenterUsage statusDetailTransition](self, "statusDetailTransition"),
          v7 == objc_msgSend(v5, "statusDetailTransition"))
      && (!-[BMNanoSettingsControlCenterUsage hasButtonID](self, "hasButtonID")
       && !objc_msgSend(v5, "hasButtonID")
       || -[BMNanoSettingsControlCenterUsage hasButtonID](self, "hasButtonID")
       && objc_msgSend(v5, "hasButtonID")
       && (v8 = -[BMNanoSettingsControlCenterUsage buttonID](self, "buttonID"),
           v8 == objc_msgSend(v5, "buttonID"))))
    {
      v9 = -[BMNanoSettingsControlCenterUsage buttonPress](self, "buttonPress");
      v10 = v9 == objc_msgSend(v5, "buttonPress");
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)transition
{
  return self->_transition;
}

- (int)statusDetailTransition
{
  return self->_statusDetailTransition;
}

- (int)buttonID
{
  return self->_buttonID;
}

- (BOOL)hasButtonID
{
  return self->_hasButtonID;
}

- (void)setHasButtonID:(BOOL)a3
{
  self->_hasButtonID = a3;
}

- (int)buttonPress
{
  return self->_buttonPress;
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

    v4 = -[BMNanoSettingsControlCenterUsage initByReadFrom:]([BMNanoSettingsControlCenterUsage alloc], "initByReadFrom:", v7);
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
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("transition"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("statusDetailTransition"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("buttonID"), 0, 0, 3, 2, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("buttonPress"), 0, 0, 4, 4, 0);
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1E5F20110;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("transition"), 1, 4, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("statusDetailTransition"), 2, 4, 0);
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("buttonID"), 3, 2, 0);
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("buttonPress"), 4, 4, 0);
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
