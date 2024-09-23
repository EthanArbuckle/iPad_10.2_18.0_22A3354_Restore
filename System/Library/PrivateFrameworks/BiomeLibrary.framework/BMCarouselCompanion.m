@implementation BMCarouselCompanion

- (BMCarouselCompanion)initWithStarting:(id)a3 connected:(id)a4 nearby:(id)a5 cloud:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BMCarouselCompanion *v14;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v16.receiver = self;
  v16.super_class = (Class)BMCarouselCompanion;
  v14 = -[BMEventBase init](&v16, sel_init);
  if (v14)
  {
    v14->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v10)
    {
      v14->_hasStarting = 1;
      v14->_starting = objc_msgSend(v10, "BOOLValue");
    }
    else
    {
      v14->_hasStarting = 0;
      v14->_starting = 0;
    }
    if (v11)
    {
      v14->_hasConnected = 1;
      v14->_connected = objc_msgSend(v11, "BOOLValue");
    }
    else
    {
      v14->_hasConnected = 0;
      v14->_connected = 0;
    }
    if (v12)
    {
      v14->_hasNearby = 1;
      v14->_nearby = objc_msgSend(v12, "BOOLValue");
    }
    else
    {
      v14->_hasNearby = 0;
      v14->_nearby = 0;
    }
    if (v13)
    {
      v14->_hasCloud = 1;
      v14->_cloud = objc_msgSend(v13, "BOOLValue");
    }
    else
    {
      v14->_hasCloud = 0;
      v14->_cloud = 0;
    }
  }

  return v14;
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMCarouselCompanion starting](self, "starting"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMCarouselCompanion connected](self, "connected"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMCarouselCompanion nearby](self, "nearby"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMCarouselCompanion cloud](self, "cloud"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMCarouselCompanion with starting: %@, connected: %@, nearby: %@, cloud: %@"), v4, v5, v6, v7);

  return (NSString *)v8;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMCarouselCompanion *v5;
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
  int v17;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  BOOL v25;
  int *v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  BMCarouselCompanion *v42;
  objc_super v44;

  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)BMCarouselCompanion;
  v5 = -[BMEventBase init](&v44, sel_init);
  if (!v5)
    goto LABEL_66;
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
        if (v11++ >= 9)
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
          v5->_hasStarting = 1;
          while (1)
          {
            v22 = *v6;
            v23 = *(_QWORD *)&v4[v22];
            if (v23 == -1 || v23 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMCarouselCompanion__starting;
              goto LABEL_54;
            }
            v24 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v23);
            *(_QWORD *)&v4[v22] = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if ((v24 & 0x80) == 0)
              break;
            v19 += 7;
            v25 = v20++ > 8;
            if (v25)
            {
              v21 = 0;
              v26 = &OBJC_IVAR___BMCarouselCompanion__starting;
              goto LABEL_57;
            }
          }
          v26 = &OBJC_IVAR___BMCarouselCompanion__starting;
          goto LABEL_55;
        case 2u:
          v27 = 0;
          v28 = 0;
          v21 = 0;
          v5->_hasConnected = 1;
          while (2)
          {
            v29 = *v6;
            v30 = *(_QWORD *)&v4[v29];
            if (v30 == -1 || v30 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMCarouselCompanion__connected;
              goto LABEL_54;
            }
            v31 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v30);
            *(_QWORD *)&v4[v29] = v30 + 1;
            v21 |= (unint64_t)(v31 & 0x7F) << v27;
            if (v31 < 0)
            {
              v27 += 7;
              v25 = v28++ > 8;
              if (v25)
              {
                v21 = 0;
                v26 = &OBJC_IVAR___BMCarouselCompanion__connected;
                goto LABEL_57;
              }
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMCarouselCompanion__connected;
          goto LABEL_55;
        case 3u:
          v32 = 0;
          v33 = 0;
          v21 = 0;
          v5->_hasNearby = 1;
          while (2)
          {
            v34 = *v6;
            v35 = *(_QWORD *)&v4[v34];
            if (v35 == -1 || v35 >= *(_QWORD *)&v4[*v7])
            {
              v26 = &OBJC_IVAR___BMCarouselCompanion__nearby;
              goto LABEL_54;
            }
            v36 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v35);
            *(_QWORD *)&v4[v34] = v35 + 1;
            v21 |= (unint64_t)(v36 & 0x7F) << v32;
            if (v36 < 0)
            {
              v32 += 7;
              v25 = v33++ > 8;
              if (v25)
              {
                v21 = 0;
                v26 = &OBJC_IVAR___BMCarouselCompanion__nearby;
                goto LABEL_57;
              }
              continue;
            }
            break;
          }
          v26 = &OBJC_IVAR___BMCarouselCompanion__nearby;
          goto LABEL_55;
        case 4u:
          v37 = 0;
          v38 = 0;
          v21 = 0;
          v5->_hasCloud = 1;
          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            goto LABEL_65;
          continue;
      }
      while (1)
      {
        v39 = *v6;
        v40 = *(_QWORD *)&v4[v39];
        if (v40 == -1 || v40 >= *(_QWORD *)&v4[*v7])
          break;
        v41 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v40);
        *(_QWORD *)&v4[v39] = v40 + 1;
        v21 |= (unint64_t)(v41 & 0x7F) << v37;
        if ((v41 & 0x80) == 0)
        {
          v26 = &OBJC_IVAR___BMCarouselCompanion__cloud;
          goto LABEL_55;
        }
        v37 += 7;
        v25 = v38++ > 8;
        if (v25)
        {
          v21 = 0;
          v26 = &OBJC_IVAR___BMCarouselCompanion__cloud;
          goto LABEL_57;
        }
      }
      v26 = &OBJC_IVAR___BMCarouselCompanion__cloud;
LABEL_54:
      v4[*v8] = 1;
LABEL_55:
      if (v4[*v8])
        v21 = 0;
LABEL_57:
      *((_BYTE *)&v5->super.super.isa + *v26) = v21 != 0;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_65:
    v42 = 0;
  else
LABEL_66:
    v42 = v5;

  return v42;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasStarting)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasConnected)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasNearby)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_hasCloud)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMCarouselCompanion writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMCarouselCompanion)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  BMCarouselCompanion *v11;
  id v12;
  void *v13;
  id v14;
  BMCarouselCompanion *v15;
  id v16;
  uint64_t v17;
  id *v18;
  id v19;
  id *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v28;
  id v29;
  id v30;
  id *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("starting"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("connected"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v15 = 0;
          goto LABEL_35;
        }
        v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v20 = a4;
        v21 = *MEMORY[0x1E0D025B8];
        v37 = *MEMORY[0x1E0CB2D50];
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("connected"));
        v38 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v21, 2, v10);
        v15 = 0;
        a4 = 0;
        *v20 = v22;
        goto LABEL_33;
      }
      v31 = v9;
    }
    else
    {
      v31 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("nearby"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v12 = 0;
          v15 = 0;
          a4 = v31;
          goto LABEL_34;
        }
        v11 = self;
        v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v23 = *MEMORY[0x1E0D025B8];
        v35 = *MEMORY[0x1E0CB2D50];
        v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("nearby"));
        v36 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v23, 2, v13);
        v15 = 0;
        v12 = 0;
        *a4 = v24;
        goto LABEL_31;
      }
      v11 = self;
      v12 = v10;
    }
    else
    {
      v11 = self;
      v12 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cloud"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v14 = 0;
LABEL_13:
      a4 = v31;
      v15 = -[BMCarouselCompanion initWithStarting:connected:nearby:cloud:](v11, "initWithStarting:connected:nearby:cloud:", v8, v31, v12, v14);
      v11 = v15;
LABEL_32:

      self = v11;
LABEL_33:
      v7 = v32;
LABEL_34:

      goto LABEL_35;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v13;
      goto LABEL_13;
    }
    if (a4)
    {
      v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v28 = *MEMORY[0x1E0D025B8];
      v33 = *MEMORY[0x1E0CB2D50];
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("cloud"));
      v34 = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v28, 2, v26);

    }
    v14 = 0;
    v15 = 0;
LABEL_31:
    a4 = v31;
    goto LABEL_32;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v15 = 0;
    v8 = 0;
    goto LABEL_36;
  }
  v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v17 = *MEMORY[0x1E0D025B8];
  v39 = *MEMORY[0x1E0CB2D50];
  v18 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("starting"));
  v40[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v8 = 0;
  *a4 = (id)objc_msgSend(v16, "initWithDomain:code:userInfo:", v17, 2, v9);
  a4 = v18;
LABEL_35:

LABEL_36:
  return v15;
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
  if (-[BMCarouselCompanion hasStarting](self, "hasStarting"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMCarouselCompanion starting](self, "starting"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (-[BMCarouselCompanion hasConnected](self, "hasConnected"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMCarouselCompanion connected](self, "connected"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (-[BMCarouselCompanion hasNearby](self, "hasNearby"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMCarouselCompanion nearby](self, "nearby"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (-[BMCarouselCompanion hasCloud](self, "hasCloud"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMCarouselCompanion cloud](self, "cloud"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v13[0] = CFSTR("starting");
  v7 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v7;
  v13[1] = CFSTR("connected");
  v8 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v8;
  v13[2] = CFSTR("nearby");
  v9 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[2] = v9;
  v13[3] = CFSTR("cloud");
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
      goto LABEL_23;
  }
  else
  {

    if (v5)
    {
LABEL_23:
      if (v4)
        goto LABEL_24;
LABEL_28:

      if (v3)
        goto LABEL_25;
LABEL_29:

      goto LABEL_25;
    }
  }

  if (!v4)
    goto LABEL_28;
LABEL_24:
  if (!v3)
    goto LABEL_29;
LABEL_25:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  int v8;
  _BOOL4 v9;
  int v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMCarouselCompanion hasStarting](self, "hasStarting") || objc_msgSend(v5, "hasStarting"))
    {
      if (!-[BMCarouselCompanion hasStarting](self, "hasStarting"))
        goto LABEL_23;
      if (!objc_msgSend(v5, "hasStarting"))
        goto LABEL_23;
      v6 = -[BMCarouselCompanion starting](self, "starting");
      if (v6 != objc_msgSend(v5, "starting"))
        goto LABEL_23;
    }
    if (-[BMCarouselCompanion hasConnected](self, "hasConnected") || objc_msgSend(v5, "hasConnected"))
    {
      if (!-[BMCarouselCompanion hasConnected](self, "hasConnected"))
        goto LABEL_23;
      if (!objc_msgSend(v5, "hasConnected"))
        goto LABEL_23;
      v7 = -[BMCarouselCompanion connected](self, "connected");
      if (v7 != objc_msgSend(v5, "connected"))
        goto LABEL_23;
    }
    if (-[BMCarouselCompanion hasNearby](self, "hasNearby") || objc_msgSend(v5, "hasNearby"))
    {
      if (!-[BMCarouselCompanion hasNearby](self, "hasNearby"))
        goto LABEL_23;
      if (!objc_msgSend(v5, "hasNearby"))
        goto LABEL_23;
      v8 = -[BMCarouselCompanion nearby](self, "nearby");
      if (v8 != objc_msgSend(v5, "nearby"))
        goto LABEL_23;
    }
    if (!-[BMCarouselCompanion hasCloud](self, "hasCloud") && !objc_msgSend(v5, "hasCloud"))
    {
      LOBYTE(v10) = 1;
      goto LABEL_24;
    }
    if (-[BMCarouselCompanion hasCloud](self, "hasCloud") && objc_msgSend(v5, "hasCloud"))
    {
      v9 = -[BMCarouselCompanion cloud](self, "cloud");
      v10 = v9 ^ objc_msgSend(v5, "cloud") ^ 1;
    }
    else
    {
LABEL_23:
      LOBYTE(v10) = 0;
    }
LABEL_24:

    goto LABEL_25;
  }
  LOBYTE(v10) = 0;
LABEL_25:

  return v10;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
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

- (BOOL)connected
{
  return self->_connected;
}

- (BOOL)hasConnected
{
  return self->_hasConnected;
}

- (void)setHasConnected:(BOOL)a3
{
  self->_hasConnected = a3;
}

- (BOOL)nearby
{
  return self->_nearby;
}

- (BOOL)hasNearby
{
  return self->_hasNearby;
}

- (void)setHasNearby:(BOOL)a3
{
  self->_hasNearby = a3;
}

- (BOOL)cloud
{
  return self->_cloud;
}

- (BOOL)hasCloud
{
  return self->_hasCloud;
}

- (void)setHasCloud:(BOOL)a3
{
  self->_hasCloud = a3;
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

    v4 = -[BMCarouselCompanion initByReadFrom:]([BMCarouselCompanion alloc], "initByReadFrom:", v7);
    v4[6] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("starting"), 0, 0, 1, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("connected"), 0, 0, 2, 12, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("nearby"), 0, 0, 3, 12, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("cloud"), 0, 0, 4, 12, 0);
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
  return &unk_1E5F1B538;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("starting"), 1, 12, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("connected"), 2, 12, 0);
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("nearby"), 3, 12, 0);
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("cloud"), 4, 12, 0);
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
