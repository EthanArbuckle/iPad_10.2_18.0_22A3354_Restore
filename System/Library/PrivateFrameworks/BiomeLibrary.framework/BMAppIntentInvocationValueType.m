@implementation BMAppIntentInvocationValueType

- (BMAppIntentInvocationValueType)initWithContainerType:(int)a3 array:(id)a4 entity:(id)a5 legacyIntent:(int)a6 linkEnumeration:(id)a7 measurement:(int)a8 primitive:(int)a9
{
  id v16;
  id v17;
  id v18;
  BMAppIntentInvocationValueType *v19;
  objc_super v21;

  v16 = a4;
  v17 = a5;
  v18 = a7;
  v21.receiver = self;
  v21.super_class = (Class)BMAppIntentInvocationValueType;
  v19 = -[BMEventBase init](&v21, sel_init);
  if (v19)
  {
    v19->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v19->_containerType = a3;
    objc_storeStrong((id *)&v19->_array, a4);
    objc_storeStrong((id *)&v19->_entity, a5);
    v19->_legacyIntent = a6;
    objc_storeStrong((id *)&v19->_linkEnumeration, a7);
    v19->_measurement = a8;
    v19->_primitive = a9;
  }

  return v19;
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
  BMAppIntentInvocationValueTypeContainerTypeAsString(-[BMAppIntentInvocationValueType containerType](self, "containerType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntentInvocationValueType array](self, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntentInvocationValueType entity](self, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BMAppIntentInvocationValueTypeLegacyIntentAsString(-[BMAppIntentInvocationValueType legacyIntent](self, "legacyIntent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntentInvocationValueType linkEnumeration](self, "linkEnumeration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BMAppIntentInvocationValueTypeMeasurementUnitAsString(-[BMAppIntentInvocationValueType measurement](self, "measurement"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  BMAppIntentInvocationValueTypePrimitiveAsString(-[BMAppIntentInvocationValueType primitive](self, "primitive"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMAppIntentInvocationValueType with containerType: %@, array: %@, entity: %@, legacyIntent: %@, linkEnumeration: %@, measurement: %@, primitive: %@"), v4, v5, v6, v7, v8, v9, v10);

  return (NSString *)v11;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMAppIntentInvocationValueType *v5;
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
  objc_class *v27;
  uint64_t v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  void *v35;
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
  unint64_t v46;
  char v47;
  uint64_t v48;
  BMAppIntentInvocationValueType *v49;
  objc_super v51;
  uint64_t v52;
  uint64_t v53;

  v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)BMAppIntentInvocationValueType;
  v5 = -[BMEventBase init](&v51, sel_init);
  if (!v5)
    goto LABEL_88;
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
              goto LABEL_61;
            v20 += 7;
            v17 = v21++ >= 9;
            if (v17)
            {
              LODWORD(v22) = 0;
              goto LABEL_63;
            }
          }
          v4[*v8] = 1;
LABEL_61:
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_63:
          if (v22 >= 9)
            LODWORD(v22) = 0;
          v48 = 20;
          goto LABEL_84;
        case 2u:
          v52 = 0;
          v53 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_87;
          v27 = -[BMAppIntentInvocationValueTypeArray initByReadFrom:]([BMAppIntentInvocationValueTypeArray alloc], "initByReadFrom:", v4);
          if (!v27)
            goto LABEL_87;
          v28 = 40;
          goto LABEL_45;
        case 3u:
          v52 = 0;
          v53 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_87;
          v27 = -[BMAppIntentInvocationValueTypeEntity initByReadFrom:]([BMAppIntentInvocationValueTypeEntity alloc], "initByReadFrom:", v4);
          if (!v27)
            goto LABEL_87;
          v28 = 48;
          goto LABEL_45;
        case 4u:
          v29 = 0;
          v30 = 0;
          v22 = 0;
          while (2)
          {
            v31 = *v6;
            v32 = *(_QWORD *)&v4[v31];
            v33 = v32 + 1;
            if (v32 == -1 || v33 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v34 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v32);
              *(_QWORD *)&v4[v31] = v33;
              v22 |= (unint64_t)(v34 & 0x7F) << v29;
              if (v34 < 0)
              {
                v29 += 7;
                v17 = v30++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_69;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_69:
          if (v22 >= 0x10)
            LODWORD(v22) = 0;
          v48 = 24;
          goto LABEL_84;
        case 5u:
          v52 = 0;
          v53 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_87;
          v27 = -[BMAppIntentInvocationValueTypeLinkEnumeration initByReadFrom:]([BMAppIntentInvocationValueTypeLinkEnumeration alloc], "initByReadFrom:", v4);
          if (!v27)
            goto LABEL_87;
          v28 = 56;
LABEL_45:
          v35 = *(Class *)((char *)&v5->super.super.isa + v28);
          *(Class *)((char *)&v5->super.super.isa + v28) = v27;

          PBReaderRecallMark();
          continue;
        case 6u:
          v36 = 0;
          v37 = 0;
          v22 = 0;
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
              v22 |= (unint64_t)(v41 & 0x7F) << v36;
              if (v41 < 0)
              {
                v36 += 7;
                v17 = v37++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_75;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_75:
          if (v22 >= 0x18)
            LODWORD(v22) = 0;
          v48 = 28;
          goto LABEL_84;
        case 7u:
          v42 = 0;
          v43 = 0;
          v22 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_87;
          continue;
      }
      while (1)
      {
        v44 = *v6;
        v45 = *(_QWORD *)&v4[v44];
        v46 = v45 + 1;
        if (v45 == -1 || v46 > *(_QWORD *)&v4[*v7])
          break;
        v47 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v45);
        *(_QWORD *)&v4[v44] = v46;
        v22 |= (unint64_t)(v47 & 0x7F) << v42;
        if ((v47 & 0x80) == 0)
          goto LABEL_79;
        v42 += 7;
        v17 = v43++ >= 9;
        if (v17)
        {
          LODWORD(v22) = 0;
          goto LABEL_81;
        }
      }
      v4[*v8] = 1;
LABEL_79:
      if (v4[*v8])
        LODWORD(v22) = 0;
LABEL_81:
      if (v22 >= 0xE)
        LODWORD(v22) = 0;
      v48 = 32;
LABEL_84:
      *(_DWORD *)((char *)&v5->super.super.isa + v48) = v22;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_87:
    v49 = 0;
  else
LABEL_88:
    v49 = v5;

  return v49;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_array)
  {
    PBDataWriterPlaceMark();
    -[BMAppIntentInvocationValueTypeArray writeTo:](self->_array, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_entity)
  {
    PBDataWriterPlaceMark();
    -[BMAppIntentInvocationValueTypeEntity writeTo:](self->_entity, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  PBDataWriterWriteUint32Field();
  if (self->_linkEnumeration)
  {
    PBDataWriterPlaceMark();
    -[BMAppIntentInvocationValueTypeLinkEnumeration writeTo:](self->_linkEnumeration, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMAppIntentInvocationValueType writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMAppIntentInvocationValueType)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  BMAppIntentInvocationValueTypeArray *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  BMAppIntentInvocationValueType *v21;
  id *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  BMAppIntentInvocationValueTypeArray *v37;
  id v38;
  void *v39;
  uint64_t v40;
  id v41;
  id v42;
  uint64_t v43;
  id v44;
  id v45;
  uint64_t v46;
  BMAppIntentInvocationValueTypeArray *v47;
  id v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  id *v53;
  id *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  BMAppIntentInvocationValueType *v58;
  id v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  id v66;
  uint64_t v67;
  id v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  BMAppIntentInvocationValueTypeArray *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  BMAppIntentInvocationValueTypeLinkEnumeration *v82;
  id v83;
  void *v84;
  void *v85;
  BMAppIntentInvocationValueType *v86;
  BMAppIntentInvocationValueTypeEntity *v87;
  id v88;
  id v89;
  id v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  id *v94;
  uint64_t v95;
  BMAppIntentInvocationValueTypeLinkEnumeration *v96;
  uint64_t v97;
  id v98;
  uint64_t v99;
  BMAppIntentInvocationValueTypeEntity *v100;
  uint64_t v101;
  BMAppIntentInvocationValueTypeArray *v102;
  uint64_t v103;
  _QWORD v104[3];

  v104[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("containerType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v7;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v8 = 0;
          v21 = 0;
          goto LABEL_78;
        }
        v42 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v43 = *MEMORY[0x1E0D025B8];
        v103 = *MEMORY[0x1E0CB2D50];
        v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("containerType"));
        v104[0] = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v104, &v103, 1);
        v11 = (BMAppIntentInvocationValueTypeArray *)objc_claimAutoreleasedReturnValue();
        v44 = (id)objc_msgSend(v42, "initWithDomain:code:userInfo:", v43, 2, v11);
        v8 = 0;
        v21 = 0;
        *a4 = v44;
        goto LABEL_76;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMAppIntentInvocationValueTypeContainerTypeFromString(v7));
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v9;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("array"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v11 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = v10;
    v90 = 0;
    v11 = -[BMAppIntentInvocationValueTypeArray initWithJSONDictionary:error:]([BMAppIntentInvocationValueTypeArray alloc], "initWithJSONDictionary:error:", v18, &v90);
    v19 = v90;
    if (v19)
    {
      v20 = v19;
      if (a4)
        *a4 = objc_retainAutorelease(v19);

      v21 = 0;
      goto LABEL_76;
    }

LABEL_12:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("entity"));
    v12 = objc_claimAutoreleasedReturnValue();
    v84 = (void *)v12;
    if (!v12 || (v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v87 = 0;
LABEL_15:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("legacyIntent"));
      v14 = objc_claimAutoreleasedReturnValue();
      v77 = v7;
      v78 = (void *)v14;
      if (v14 && (v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v83 = v15;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              v21 = 0;
              v23 = 0;
              goto LABEL_73;
            }
            v60 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v61 = v8;
            v62 = *MEMORY[0x1E0D025B8];
            v97 = *MEMORY[0x1E0CB2D50];
            v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("legacyIntent"));
            v98 = v26;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
            v63 = objc_claimAutoreleasedReturnValue();
            v64 = v62;
            v8 = v61;
            v82 = (BMAppIntentInvocationValueTypeLinkEnumeration *)v63;
            v65 = (id)objc_msgSend(v60, "initWithDomain:code:userInfo:", v64, 2);
            v21 = 0;
            *a4 = v65;
            v23 = 0;
            goto LABEL_71;
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMAppIntentInvocationValueTypeLegacyIntentFromString(v15));
          v83 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v83 = 0;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("linkEnumeration"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v76 = v11;
        v82 = 0;
LABEL_21:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("measurement"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v8;
        if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v34 = v17;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!a4)
              {
                v85 = 0;
                v21 = 0;
                goto LABEL_70;
              }
              v58 = self;
              v66 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v67 = *MEMORY[0x1E0D025B8];
              v93 = *MEMORY[0x1E0CB2D50];
              v53 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("measurement"));
              v94 = v53;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v68 = (id)objc_msgSend(v66, "initWithDomain:code:userInfo:", v67, 2, v52);
              v85 = 0;
              v21 = 0;
              *a4 = v68;
              goto LABEL_69;
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMAppIntentInvocationValueTypeMeasurementUnitFromString(v17));
            v34 = (id)objc_claimAutoreleasedReturnValue();
          }
          v85 = v34;
        }
        else
        {
          v85 = 0;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("primitive"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (v52 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v54 = v52;
          }
          else
          {
            v53 = a4;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v58 = self;
              if (a4)
              {
                v75 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v74 = *MEMORY[0x1E0D025B8];
                v91 = *MEMORY[0x1E0CB2D50];
                v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("primitive"));
                v92 = v69;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                *a4 = (id)objc_msgSend(v75, "initWithDomain:code:userInfo:", v74, 2, v70);

                v53 = 0;
              }
              v21 = 0;
              goto LABEL_69;
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMAppIntentInvocationValueTypePrimitiveFromString(v52));
            v54 = (id *)objc_claimAutoreleasedReturnValue();
          }
          v53 = v54;
        }
        else
        {
          v53 = 0;
        }
        v55 = objc_msgSend(v79, "intValue");
        v56 = objc_msgSend(v83, "intValue");
        v57 = objc_msgSend(v85, "intValue");
        LODWORD(v71) = objc_msgSend(v53, "intValue");
        v21 = -[BMAppIntentInvocationValueType initWithContainerType:array:entity:legacyIntent:linkEnumeration:measurement:primitive:](self, "initWithContainerType:array:entity:legacyIntent:linkEnumeration:measurement:primitive:", v55, v76, v87, v56, v82, v57, v71);
        v58 = v21;
LABEL_69:

        self = v58;
LABEL_70:
        v23 = v83;

        v26 = v16;
        v8 = v79;
        v11 = v76;
        goto LABEL_71;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v26 = v16;
        v88 = 0;
        v82 = -[BMAppIntentInvocationValueTypeLinkEnumeration initWithJSONDictionary:error:]([BMAppIntentInvocationValueTypeLinkEnumeration alloc], "initWithJSONDictionary:error:", v26, &v88);
        v27 = v88;
        if (!v27)
        {
          v76 = v11;

          goto LABEL_21;
        }
        v28 = v27;
        if (a4)
          *a4 = objc_retainAutorelease(v27);

        v21 = 0;
      }
      else
      {
        if (!a4)
        {
          v21 = 0;
          v23 = v83;
          goto LABEL_72;
        }
        v45 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v81 = v8;
        v46 = *MEMORY[0x1E0D025B8];
        v95 = *MEMORY[0x1E0CB2D50];
        v47 = v11;
        v48 = objc_alloc(MEMORY[0x1E0CB3940]);
        v73 = objc_opt_class();
        v49 = v48;
        v11 = v47;
        v82 = (BMAppIntentInvocationValueTypeLinkEnumeration *)objc_msgSend(v49, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), v73, CFSTR("linkEnumeration"));
        v96 = v82;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v46;
        v8 = v81;
        *a4 = (id)objc_msgSend(v45, "initWithDomain:code:userInfo:", v51, 2, v50);

        v21 = 0;
        v26 = v16;
      }
      v23 = v83;
LABEL_71:

      v16 = v26;
LABEL_72:

      v7 = v77;
LABEL_73:

      goto LABEL_74;
    }
    v86 = self;
    v22 = a4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = v13;
      v89 = 0;
      v87 = -[BMAppIntentInvocationValueTypeEntity initWithJSONDictionary:error:]([BMAppIntentInvocationValueTypeEntity alloc], "initWithJSONDictionary:error:", v23, &v89);
      v24 = v89;
      if (!v24)
      {

        a4 = v22;
        self = v86;
        goto LABEL_15;
      }
      v25 = v24;
      if (v22)
        *v22 = objc_retainAutorelease(v24);

      v21 = 0;
    }
    else
    {
      if (!a4)
      {
        v21 = 0;
        self = v86;
        goto LABEL_75;
      }
      v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v80 = v8;
      v36 = *MEMORY[0x1E0D025B8];
      v99 = *MEMORY[0x1E0CB2D50];
      v37 = v11;
      v38 = objc_alloc(MEMORY[0x1E0CB3940]);
      v72 = objc_opt_class();
      v39 = v38;
      v11 = v37;
      v87 = (BMAppIntentInvocationValueTypeEntity *)objc_msgSend(v39, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), v72, CFSTR("entity"));
      v100 = v87;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v40 = v36;
      v8 = v80;
      v41 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v40, 2, v23);
      v21 = 0;
      *v22 = v41;
    }
    self = v86;
LABEL_74:

LABEL_75:
    v18 = v10;
    goto LABEL_76;
  }
  if (a4)
  {
    v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v30 = v8;
    v31 = *MEMORY[0x1E0D025B8];
    v101 = *MEMORY[0x1E0CB2D50];
    v11 = (BMAppIntentInvocationValueTypeArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("array"));
    v102 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v31;
    v8 = v30;
    *a4 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v33, 2, v32);

    v21 = 0;
    v18 = v10;
LABEL_76:

    v10 = v18;
    goto LABEL_77;
  }
  v21 = 0;
LABEL_77:

LABEL_78:
  return v21;
}

- (id)jsonDictionary
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[7];
  _QWORD v28[9];

  v28[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMAppIntentInvocationValueType containerType](self, "containerType"));
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMAppIntentInvocationValueType array](self, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "jsonDictionary");
  v5 = objc_claimAutoreleasedReturnValue();

  -[BMAppIntentInvocationValueType entity](self, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "jsonDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMAppIntentInvocationValueType legacyIntent](self, "legacyIntent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntentInvocationValueType linkEnumeration](self, "linkEnumeration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "jsonDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMAppIntentInvocationValueType measurement](self, "measurement"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMAppIntentInvocationValueType primitive](self, "primitive"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = CFSTR("containerType");
  v13 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v13;
  v28[0] = v13;
  v27[1] = CFSTR("array");
  v14 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v14;
  v28[1] = v14;
  v27[2] = CFSTR("entity");
  v15 = (uint64_t)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v3;
  v22 = (void *)v15;
  v28[2] = v15;
  v27[3] = CFSTR("legacyIntent");
  v16 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v5;
  v28[3] = v16;
  v27[4] = CFSTR("linkEnumeration");
  v17 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[4] = v17;
  v27[5] = CFSTR("measurement");
  v18 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[5] = v18;
  v27[6] = CFSTR("primitive");
  v19 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[6] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (v11)
      goto LABEL_17;
LABEL_25:

    if (v10)
      goto LABEL_18;
    goto LABEL_26;
  }

  if (!v11)
    goto LABEL_25;
LABEL_17:
  if (v10)
    goto LABEL_18;
LABEL_26:

LABEL_18:
  if (!v8)

  if (v7)
  {
    if (v25)
      goto LABEL_22;
LABEL_28:

    if (v26)
      goto LABEL_23;
LABEL_29:

    goto LABEL_23;
  }

  if (!v25)
    goto LABEL_28;
LABEL_22:
  if (!v26)
    goto LABEL_29;
LABEL_23:

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  int v28;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMAppIntentInvocationValueType containerType](self, "containerType");
    if (v6 == objc_msgSend(v5, "containerType"))
    {
      -[BMAppIntentInvocationValueType array](self, "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "array");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[BMAppIntentInvocationValueType array](self, "array");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "array");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_19;
      }
      -[BMAppIntentInvocationValueType entity](self, "entity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "entity");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

      }
      else
      {
        v16 = (void *)v15;
        -[BMAppIntentInvocationValueType entity](self, "entity");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "entity");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqual:", v18);

        if (!v19)
          goto LABEL_19;
      }
      v20 = -[BMAppIntentInvocationValueType legacyIntent](self, "legacyIntent");
      if (v20 == objc_msgSend(v5, "legacyIntent"))
      {
        -[BMAppIntentInvocationValueType linkEnumeration](self, "linkEnumeration");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "linkEnumeration");
        v22 = objc_claimAutoreleasedReturnValue();
        if (v21 == (void *)v22)
        {

        }
        else
        {
          v23 = (void *)v22;
          -[BMAppIntentInvocationValueType linkEnumeration](self, "linkEnumeration");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "linkEnumeration");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v24, "isEqual:", v25);

          if (!v26)
            goto LABEL_19;
        }
        v27 = -[BMAppIntentInvocationValueType measurement](self, "measurement");
        if (v27 == objc_msgSend(v5, "measurement"))
        {
          v28 = -[BMAppIntentInvocationValueType primitive](self, "primitive");
          v13 = v28 == objc_msgSend(v5, "primitive");
LABEL_20:

          goto LABEL_21;
        }
      }
    }
LABEL_19:
    v13 = 0;
    goto LABEL_20;
  }
  v13 = 0;
LABEL_21:

  return v13;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)containerType
{
  return self->_containerType;
}

- (BMAppIntentInvocationValueTypeArray)array
{
  return self->_array;
}

- (BMAppIntentInvocationValueTypeEntity)entity
{
  return self->_entity;
}

- (int)legacyIntent
{
  return self->_legacyIntent;
}

- (BMAppIntentInvocationValueTypeLinkEnumeration)linkEnumeration
{
  return self->_linkEnumeration;
}

- (int)measurement
{
  return self->_measurement;
}

- (int)primitive
{
  return self->_primitive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkEnumeration, 0);
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_array, 0);
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

    v4 = -[BMAppIntentInvocationValueType initByReadFrom:]([BMAppIntentInvocationValueType alloc], "initByReadFrom:", v7);
    v4[4] = 0;

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
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("containerType"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("array_json"), 5, 1, &__block_literal_global_482);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("entity_json"), 5, 1, &__block_literal_global_483);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("legacyIntent"), 0, 0, 4, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("linkEnumeration_json"), 5, 1, &__block_literal_global_484);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("measurement"), 0, 0, 6, 4, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("primitive"), 0, 0, 7, 4, 0);
  v11[0] = v2;
  v11[1] = v3;
  v11[2] = v4;
  v11[3] = v5;
  v11[4] = v6;
  v11[5] = v7;
  v11[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1CBB8;
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
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("containerType"), 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("array"), 2, 14, objc_opt_class(), v2);
  v11[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("entity"), 3, 14, objc_opt_class());
  v11[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("legacyIntent"), 4, 4, 0);
  v11[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("linkEnumeration"), 5, 14, objc_opt_class());
  v11[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("measurement"), 6, 4, 0);
  v11[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("primitive"), 7, 4, 0);
  v11[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __41__BMAppIntentInvocationValueType_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "linkEnumeration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __41__BMAppIntentInvocationValueType_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __41__BMAppIntentInvocationValueType_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
