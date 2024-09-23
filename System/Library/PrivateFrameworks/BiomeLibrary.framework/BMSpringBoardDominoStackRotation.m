@implementation BMSpringBoardDominoStackRotation

- (BMSpringBoardDominoStackRotation)initWithWidget:(id)a3 stackId:(id)a4 reason:(int)a5 newWidgetSuggestion:(id)a6 source:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  BMSpringBoardDominoStackRotation *v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v19.receiver = self;
  v19.super_class = (Class)BMSpringBoardDominoStackRotation;
  v17 = -[BMEventBase init](&v19, sel_init);
  if (v17)
  {
    v17->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v17->_widget, a3);
    objc_storeStrong((id *)&v17->_stackId, a4);
    v17->_reason = a5;
    if (v15)
    {
      v17->_hasNewWidgetSuggestion = 1;
      v17->_newWidgetSuggestion = objc_msgSend(v15, "BOOLValue");
    }
    else
    {
      v17->_hasNewWidgetSuggestion = 0;
      v17->_newWidgetSuggestion = 0;
    }
    objc_storeStrong((id *)&v17->_source, a7);
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
  -[BMSpringBoardDominoStackRotation widget](self, "widget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSpringBoardDominoStackRotation stackId](self, "stackId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMSpringBoardDominoStackRotationReasonAsString(-[BMSpringBoardDominoStackRotation reason](self, "reason"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSpringBoardDominoStackRotation newWidgetSuggestion](self, "newWidgetSuggestion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSpringBoardDominoStackRotation source](self, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSpringBoardDominoStackRotation with widget: %@, stackId: %@, reason: %@, newWidgetSuggestion: %@, source: %@"), v4, v5, v6, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSpringBoardDominoStackRotation *v5;
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
  BMSpringBoardDominoWidget *v19;
  BMSpringBoardDominoWidget *widget;
  uint64_t v21;
  uint64_t v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  void *v35;
  BMSpringBoardDominoStackRotation *v36;
  objc_super v38;
  uint64_t v39;
  uint64_t v40;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)BMSpringBoardDominoStackRotation;
  v5 = -[BMEventBase init](&v38, sel_init);
  if (!v5)
    goto LABEL_55;
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
          v39 = 0;
          v40 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_54;
          v19 = -[BMSpringBoardDominoWidget initByReadFrom:]([BMSpringBoardDominoWidget alloc], "initByReadFrom:", v4);
          if (!v19)
            goto LABEL_54;
          widget = v5->_widget;
          v5->_widget = v19;

          PBReaderRecallMark();
          continue;
        case 2u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 40;
          goto LABEL_41;
        case 3u:
          v23 = 0;
          v24 = 0;
          v25 = 0;
          while (2)
          {
            v26 = *v6;
            v27 = *(_QWORD *)&v4[v26];
            if (v27 == -1 || v27 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v28 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v27);
              *(_QWORD *)&v4[v26] = v27 + 1;
              v25 |= (unint64_t)(v28 & 0x7F) << v23;
              if (v28 < 0)
              {
                v23 += 7;
                v16 = v24++ >= 9;
                if (v16)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_45;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v25) = 0;
LABEL_45:
          if (v25 >= 0xB)
            LODWORD(v25) = 0;
          v5->_reason = v25;
          continue;
        case 4u:
          v29 = 0;
          v30 = 0;
          v31 = 0;
          v5->_hasNewWidgetSuggestion = 1;
          break;
        case 5u:
          PBReaderReadString();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = 48;
LABEL_41:
          v35 = *(Class *)((char *)&v5->super.super.isa + v22);
          *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;

          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_54;
          continue;
      }
      while (1)
      {
        v32 = *v6;
        v33 = *(_QWORD *)&v4[v32];
        if (v33 == -1 || v33 >= *(_QWORD *)&v4[*v7])
          break;
        v34 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v33);
        *(_QWORD *)&v4[v32] = v33 + 1;
        v31 |= (unint64_t)(v34 & 0x7F) << v29;
        if ((v34 & 0x80) == 0)
          goto LABEL_49;
        v29 += 7;
        v16 = v30++ >= 9;
        if (v16)
        {
          v31 = 0;
          goto LABEL_51;
        }
      }
      v4[*v8] = 1;
LABEL_49:
      if (v4[*v8])
        v31 = 0;
LABEL_51:
      v5->_newWidgetSuggestion = v31 != 0;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_54:
    v36 = 0;
  else
LABEL_55:
    v36 = v5;

  return v36;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_widget)
  {
    PBDataWriterPlaceMark();
    -[BMSpringBoardDominoWidget writeTo:](self->_widget, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_stackId)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_hasNewWidgetSuggestion)
    PBDataWriterWriteBOOLField();
  if (self->_source)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSpringBoardDominoStackRotation writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSpringBoardDominoStackRotation)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BMSpringBoardDominoWidget *v8;
  void *v9;
  void *v10;
  id *v11;
  id v12;
  void *v13;
  BMSpringBoardDominoStackRotation *v14;
  id v15;
  id v16;
  id *v17;
  uint64_t v18;
  id *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  id *v37;
  id *v38;
  id v39;
  id *v40;
  BMSpringBoardDominoWidget *v41;
  void *v42;
  id v43;
  BMSpringBoardDominoStackRotation *v44;
  id v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  _QWORD v55[3];

  v55[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("widget"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v7;
    v45 = 0;
    v8 = -[BMSpringBoardDominoWidget initWithJSONDictionary:error:]([BMSpringBoardDominoWidget alloc], "initWithJSONDictionary:error:", v11, &v45);
    v12 = v45;
    if (v12)
    {
      v13 = v12;
      if (a4)
        *a4 = objc_retainAutorelease(v12);

      v14 = 0;
      a4 = v11;
      goto LABEL_37;
    }

LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("stackId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v14 = 0;
          goto LABEL_36;
        }
        v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v37 = a4;
        v22 = *MEMORY[0x1E0D025B8];
        v52 = *MEMORY[0x1E0CB2D50];
        v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("stackId"));
        v53 = v42;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 2, v10);
        a4 = 0;
        v14 = 0;
        *v37 = v23;
LABEL_35:

LABEL_36:
        goto LABEL_37;
      }
      v40 = v9;
    }
    else
    {
      v40 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("reason"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v8;
    v44 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = v10;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v42 = 0;
            v14 = 0;
            a4 = v40;
            goto LABEL_35;
          }
          v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v34 = *MEMORY[0x1E0D025B8];
          v50 = *MEMORY[0x1E0CB2D50];
          v25 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("reason"));
          v51 = v25;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v34, 2, v24);
          v42 = 0;
          v14 = 0;
          *a4 = v35;
          goto LABEL_54;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSpringBoardDominoStackRotationReasonFromString(v10));
        v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      v42 = v15;
    }
    else
    {
      v42 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("newWidgetSuggestion"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v25 = 0;
      goto LABEL_29;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = v24;
LABEL_29:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("source"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v36 = *MEMORY[0x1E0D025B8];
            v46 = *MEMORY[0x1E0CB2D50];
            v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("source"));
            v47 = v32;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *a4 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v36, 2, v33);

          }
          v27 = 0;
          v14 = 0;
          a4 = v40;
          goto LABEL_33;
        }
        v27 = v26;
      }
      else
      {
        v27 = 0;
      }
      a4 = v40;
      v14 = -[BMSpringBoardDominoStackRotation initWithWidget:stackId:reason:newWidgetSuggestion:source:](v44, "initWithWidget:stackId:reason:newWidgetSuggestion:source:", v41, v40, objc_msgSend(v42, "intValue"), v25, v27);
      v44 = v14;
LABEL_33:

LABEL_34:
      self = v44;
      v8 = v41;
      goto LABEL_35;
    }
    if (a4)
    {
      v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v38 = a4;
      v30 = *MEMORY[0x1E0D025B8];
      v48 = *MEMORY[0x1E0CB2D50];
      v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("newWidgetSuggestion"));
      v49 = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v30, 2, v26);
      v14 = 0;
      v25 = 0;
      a4 = v40;
      *v38 = v31;
      goto LABEL_33;
    }
    v25 = 0;
    v14 = 0;
LABEL_54:
    a4 = v40;
    goto LABEL_34;
  }
  if (!a4)
  {
    v14 = 0;
    goto LABEL_38;
  }
  v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v17 = a4;
  v18 = *MEMORY[0x1E0D025B8];
  v54 = *MEMORY[0x1E0CB2D50];
  v8 = (BMSpringBoardDominoWidget *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("widget"));
  v55[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
  v19 = (id *)objc_claimAutoreleasedReturnValue();
  v20 = v18;
  a4 = v19;
  v14 = 0;
  *v17 = (id)objc_msgSend(v16, "initWithDomain:code:userInfo:", v20, 2, v19);
LABEL_37:

LABEL_38:
  return v14;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  _QWORD v23[6];

  v23[5] = *MEMORY[0x1E0C80C00];
  -[BMSpringBoardDominoStackRotation widget](self, "widget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMSpringBoardDominoStackRotation stackId](self, "stackId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSpringBoardDominoStackRotation reason](self, "reason"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMSpringBoardDominoStackRotation hasNewWidgetSuggestion](self, "hasNewWidgetSuggestion"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMSpringBoardDominoStackRotation newWidgetSuggestion](self, "newWidgetSuggestion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  -[BMSpringBoardDominoStackRotation source](self, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = CFSTR("widget");
  v9 = (uint64_t)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v16 = v9;
  v23[0] = v9;
  v19 = CFSTR("stackId");
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v9, v18, v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[1] = v10;
  v20 = CFSTR("reason");
  v11 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[2] = v11;
  v21 = CFSTR("newWidgetSuggestion");
  v12 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[3] = v12;
  v22 = CFSTR("source");
  v13 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[4] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v18, 5, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v7)
      goto LABEL_16;
  }
  else
  {

    if (v7)
    {
LABEL_16:
      if (v6)
        goto LABEL_17;
      goto LABEL_22;
    }
  }

  if (v6)
  {
LABEL_17:
    if (v5)
      goto LABEL_18;
LABEL_23:

    if (v4)
      goto LABEL_19;
LABEL_24:

    goto LABEL_19;
  }
LABEL_22:

  if (!v5)
    goto LABEL_23;
LABEL_18:
  if (!v4)
    goto LABEL_24;
LABEL_19:

  return v14;
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
  int v19;
  int v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSpringBoardDominoStackRotation widget](self, "widget");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "widget");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSpringBoardDominoStackRotation widget](self, "widget");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "widget");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_17;
    }
    -[BMSpringBoardDominoStackRotation stackId](self, "stackId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stackId");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMSpringBoardDominoStackRotation stackId](self, "stackId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stackId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_17;
    }
    v19 = -[BMSpringBoardDominoStackRotation reason](self, "reason");
    if (v19 == objc_msgSend(v5, "reason"))
    {
      if (!-[BMSpringBoardDominoStackRotation hasNewWidgetSuggestion](self, "hasNewWidgetSuggestion")
        && !objc_msgSend(v5, "hasNewWidgetSuggestion")
        || -[BMSpringBoardDominoStackRotation hasNewWidgetSuggestion](self, "hasNewWidgetSuggestion")
        && objc_msgSend(v5, "hasNewWidgetSuggestion")
        && (v20 = -[BMSpringBoardDominoStackRotation newWidgetSuggestion](self, "newWidgetSuggestion"),
            v20 == objc_msgSend(v5, "newWidgetSuggestion")))
      {
        -[BMSpringBoardDominoStackRotation source](self, "source");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "source");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22 == v23)
        {
          v12 = 1;
        }
        else
        {
          -[BMSpringBoardDominoStackRotation source](self, "source");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "source");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v24, "isEqual:", v25);

        }
        goto LABEL_18;
      }
    }
LABEL_17:
    v12 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v12 = 0;
LABEL_19:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BMSpringBoardDominoWidget)widget
{
  return self->_widget;
}

- (NSString)stackId
{
  return self->_stackId;
}

- (int)reason
{
  return self->_reason;
}

- (BOOL)newWidgetSuggestion
{
  return self->_newWidgetSuggestion;
}

- (BOOL)hasNewWidgetSuggestion
{
  return self->_hasNewWidgetSuggestion;
}

- (void)setHasNewWidgetSuggestion:(BOOL)a3
{
  self->_hasNewWidgetSuggestion = a3;
}

- (NSString)source
{
  return self->_source;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_stackId, 0);
  objc_storeStrong((id *)&self->_widget, 0);
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

    v4 = -[BMSpringBoardDominoStackRotation initByReadFrom:]([BMSpringBoardDominoStackRotation alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("widget_json"), 5, 1, &__block_literal_global_56_31357);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("stackId"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("reason"), 0, 0, 3, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("newWidgetSuggestion"), 0, 0, 4, 12, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("source"), 2, 0, 5, 13, 0);
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
  return &unk_1E5F1C420;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("widget"), 1, 14, objc_opt_class());
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("stackId"), 2, 13, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("reason"), 3, 4, 0);
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("newWidgetSuggestion"), 4, 12, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("source"), 5, 13, 0);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __43__BMSpringBoardDominoStackRotation_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "widget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BMSpringBoardDominoStackRotation)initWithWidget:(id)a3 stackId:(id)a4 reason:(int)a5 newWidgetSuggestion:(id)a6
{
  return -[BMSpringBoardDominoStackRotation initWithWidget:stackId:reason:newWidgetSuggestion:source:](self, "initWithWidget:stackId:reason:newWidgetSuggestion:source:", a3, a4, *(_QWORD *)&a5, a6, 0);
}

@end
