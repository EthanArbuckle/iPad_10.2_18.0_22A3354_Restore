@implementation BMWalletPaymentsCommerceRecurringSendSuggestions

- (BMWalletPaymentsCommerceRecurringSendSuggestions)initWithUserSelection:(int)a3 passType:(int)a4 tagClickDate:(id)a5 frequency:(int)a6 suggestionsRange:(int)a7 dayRange:(int)a8
{
  id v14;
  BMWalletPaymentsCommerceRecurringSendSuggestions *v15;
  double v16;
  objc_super v18;

  v14 = a5;
  v18.receiver = self;
  v18.super_class = (Class)BMWalletPaymentsCommerceRecurringSendSuggestions;
  v15 = -[BMEventBase init](&v18, sel_init);
  if (v15)
  {
    v15->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v15->_userSelection = a3;
    v15->_passType = a4;
    if (v14)
    {
      v15->_hasTagClickDate = 1;
      objc_msgSend(v14, "doubleValue");
    }
    else
    {
      v15->_hasTagClickDate = 0;
      v16 = -1.0;
    }
    v15->_tagClickDate = v16;
    v15->_frequency = a6;
    v15->_suggestionsRange = a7;
    v15->_dayRange = a8;
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
  void *v11;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  BMWalletPaymentsCommerceRecurringSendSuggestionsUserSelectionAsString(-[BMWalletPaymentsCommerceRecurringSendSuggestions userSelection](self, "userSelection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMWalletPaymentsCommerceRecurringSendSuggestionsPassTypeAsString(-[BMWalletPaymentsCommerceRecurringSendSuggestions passType](self, "passType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[BMWalletPaymentsCommerceRecurringSendSuggestions tagClickDate](self, "tagClickDate");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BMWalletPaymentsCommerceRecurringSendSuggestionsFrequencyAsString(-[BMWalletPaymentsCommerceRecurringSendSuggestions frequency](self, "frequency"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BMWalletPaymentsCommerceRecurringSendSuggestionsSuggestionsRangeAsString(-[BMWalletPaymentsCommerceRecurringSendSuggestions suggestionsRange](self, "suggestionsRange"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  BMWalletPaymentsCommerceRecurringSendSuggestionsDayRangeAsString(-[BMWalletPaymentsCommerceRecurringSendSuggestions dayRange](self, "dayRange"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMWalletPaymentsCommerceRecurringSendSuggestions with userSelection: %@, passType: %@, tagClickDate: %@, frequency: %@, suggestionsRange: %@, dayRange: %@"), v4, v5, v7, v8, v9, v10);

  return (NSString *)v11;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMWalletPaymentsCommerceRecurringSendSuggestions *v5;
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
  unint64_t v40;
  char v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  char v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  uint64_t v54;
  BMWalletPaymentsCommerceRecurringSendSuggestions *v55;
  objc_super v57;

  v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)BMWalletPaymentsCommerceRecurringSendSuggestions;
  v5 = -[BMEventBase init](&v57, sel_init);
  if (!v5)
    goto LABEL_97;
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
          if (v22 >= 4)
            LODWORD(v22) = 0;
          v54 = 24;
          goto LABEL_90;
        case 2u:
          v27 = 0;
          v28 = 0;
          v22 = 0;
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
          if (v22 >= 3)
            LODWORD(v22) = 0;
          v54 = 28;
          goto LABEL_90;
        case 3u:
          v5->_hasTagClickDate = 1;
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
          v5->_tagClickDate = v35;
          continue;
        case 4u:
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
          if (v22 >= 6)
            LODWORD(v22) = 0;
          v54 = 32;
          goto LABEL_90;
        case 5u:
          v42 = 0;
          v43 = 0;
          v22 = 0;
          while (2)
          {
            v44 = *v6;
            v45 = *(_QWORD *)&v4[v44];
            v46 = v45 + 1;
            if (v45 == -1 || v46 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v47 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v45);
              *(_QWORD *)&v4[v44] = v46;
              v22 |= (unint64_t)(v47 & 0x7F) << v42;
              if (v47 < 0)
              {
                v42 += 7;
                v17 = v43++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_81;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_81:
          if (v22 >= 3)
            LODWORD(v22) = 0;
          v54 = 36;
          goto LABEL_90;
        case 6u:
          v48 = 0;
          v49 = 0;
          v22 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_96;
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
        v22 |= (unint64_t)(v53 & 0x7F) << v48;
        if ((v53 & 0x80) == 0)
          goto LABEL_85;
        v48 += 7;
        v17 = v49++ >= 9;
        if (v17)
        {
          LODWORD(v22) = 0;
          goto LABEL_87;
        }
      }
      v4[*v8] = 1;
LABEL_85:
      if (v4[*v8])
        LODWORD(v22) = 0;
LABEL_87:
      if (v22 >= 4)
        LODWORD(v22) = 0;
      v54 = 40;
LABEL_90:
      *(_DWORD *)((char *)&v5->super.super.isa + v54) = v22;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_96:
    v55 = 0;
  else
LABEL_97:
    v55 = v5;

  return v55;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasTagClickDate)
    PBDataWriterWriteDoubleField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMWalletPaymentsCommerceRecurringSendSuggestions writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMWalletPaymentsCommerceRecurringSendSuggestions)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BMWalletPaymentsCommerceRecurringSendSuggestions *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  BMWalletPaymentsCommerceRecurringSendSuggestions *v30;
  void *v31;
  id v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  uint64_t v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  id v53;
  id v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD v79[3];

  v79[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("userSelection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 0;
LABEL_9:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("passType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v10 = 0;
            v30 = 0;
            goto LABEL_36;
          }
          v42 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v43 = *MEMORY[0x1E0D025B8];
          v76 = *MEMORY[0x1E0CB2D50];
          v44 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("passType"));
          v77 = v44;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
          v45 = objc_claimAutoreleasedReturnValue();
          v46 = v42;
          v13 = (void *)v45;
          v10 = 0;
          v30 = 0;
          *a4 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v43, 2, v45);
          v29 = (void *)v44;
          goto LABEL_35;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMWalletPaymentsCommerceRecurringSendSuggestionsPassTypeFromString(v9));
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v10 = v11;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tagClickDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    v63 = (void *)v12;
    if (v12 && (v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v29 = 0;
          v30 = 0;
          goto LABEL_35;
        }
        v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v34 = *MEMORY[0x1E0D025B8];
        v74 = *MEMORY[0x1E0CB2D50];
        v35 = v10;
        v36 = objc_alloc(MEMORY[0x1E0CB3940]);
        v58 = objc_opt_class();
        v37 = v36;
        v10 = v35;
        v66 = (id)objc_msgSend(v37, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v58, CFSTR("tagClickDate"));
        v75 = v66;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = v33;
        v13 = v63;
        v62 = (void *)v38;
        v30 = 0;
        *a4 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v34, 2);
        v29 = 0;
LABEL_34:

LABEL_35:
        goto LABEL_36;
      }
      v60 = v13;
    }
    else
    {
      v60 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("frequency"));
    v14 = objc_claimAutoreleasedReturnValue();
    v61 = v10;
    v62 = (void *)v14;
    if (v14 && (v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v66 = v15;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v66 = 0;
            v30 = 0;
            v29 = v60;
            goto LABEL_33;
          }
          v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v48 = *MEMORY[0x1E0D025B8];
          v72 = *MEMORY[0x1E0CB2D50];
          v64 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("frequency"));
          v73 = v64;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = 0;
          v30 = 0;
          *a4 = (id)objc_msgSend(v47, "initWithDomain:code:userInfo:", v48, 2, v31);
          v29 = v60;
          v10 = v61;
LABEL_32:

LABEL_33:
          v13 = v63;
          goto LABEL_34;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMWalletPaymentsCommerceRecurringSendSuggestionsFrequencyFromString(v15));
        v66 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v66 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("suggestionsRange"));
    v16 = objc_claimAutoreleasedReturnValue();
    v59 = (void *)v16;
    if (v16 && (v17 = (void *)v16, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v64 = v17;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v64 = 0;
            v30 = 0;
            v29 = v60;
            goto LABEL_31;
          }
          v49 = v9;
          v50 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v51 = *MEMORY[0x1E0D025B8];
          v70 = *MEMORY[0x1E0CB2D50];
          v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("suggestionsRange"));
          v71 = v22;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = v50;
          v9 = v49;
          v53 = (id)objc_msgSend(v52, "initWithDomain:code:userInfo:", v51, 2, v18);
          v64 = 0;
          v30 = 0;
          *a4 = v53;
          goto LABEL_66;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMWalletPaymentsCommerceRecurringSendSuggestionsSuggestionsRangeFromString(v17));
        v64 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v64 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dayRange"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v19 = v9;
      v20 = v6;
      v21 = self;
      v22 = 0;
LABEL_29:
      v23 = objc_msgSend(v7, "intValue");
      v24 = objc_msgSend(v10, "intValue");
      v25 = objc_msgSend(v66, "intValue");
      v26 = objc_msgSend(v64, "intValue");
      v27 = objc_msgSend(v22, "intValue");
      v28 = v24;
      v29 = v60;
      v30 = -[BMWalletPaymentsCommerceRecurringSendSuggestions initWithUserSelection:passType:tagClickDate:frequency:suggestionsRange:dayRange:](v21, "initWithUserSelection:passType:tagClickDate:frequency:suggestionsRange:dayRange:", v23, v28, v60, v25, v26, v27);
      self = v30;
      v6 = v20;
      v9 = v19;
LABEL_30:

      v10 = v61;
LABEL_31:
      v31 = v59;
      goto LABEL_32;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = v9;
      v20 = v6;
      v21 = self;
      v22 = v18;
      goto LABEL_29;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = v9;
      v20 = v6;
      v21 = self;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMWalletPaymentsCommerceRecurringSendSuggestionsDayRangeFromString(v18));
      v22 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }
    if (a4)
    {
      v54 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v55 = *MEMORY[0x1E0D025B8];
      v68 = *MEMORY[0x1E0CB2D50];
      v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("dayRange"));
      v69 = v56;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = (id)objc_msgSend(v54, "initWithDomain:code:userInfo:", v55, 2, v57);

    }
    v22 = 0;
    v30 = 0;
LABEL_66:
    v29 = v60;
    goto LABEL_30;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
LABEL_8:
    v7 = v8;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMWalletPaymentsCommerceRecurringSendSuggestionsUserSelectionFromString(v6));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!a4)
  {
    v65 = 0;
    v30 = 0;
    goto LABEL_37;
  }
  v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v41 = *MEMORY[0x1E0D025B8];
  v78 = *MEMORY[0x1E0CB2D50];
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("userSelection"));
  v79[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, &v78, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0;
  v30 = 0;
  *a4 = (id)objc_msgSend(v40, "initWithDomain:code:userInfo:", v41, 2, v9);
LABEL_36:

LABEL_37:
  return v30;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[6];
  _QWORD v24[7];

  v24[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMWalletPaymentsCommerceRecurringSendSuggestions userSelection](self, "userSelection"));
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMWalletPaymentsCommerceRecurringSendSuggestions passType](self, "passType"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (!-[BMWalletPaymentsCommerceRecurringSendSuggestions hasTagClickDate](self, "hasTagClickDate")
    || (-[BMWalletPaymentsCommerceRecurringSendSuggestions tagClickDate](self, "tagClickDate"), fabs(v5) == INFINITY))
  {
    v7 = 0;
  }
  else
  {
    -[BMWalletPaymentsCommerceRecurringSendSuggestions tagClickDate](self, "tagClickDate");
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMWalletPaymentsCommerceRecurringSendSuggestions tagClickDate](self, "tagClickDate");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMWalletPaymentsCommerceRecurringSendSuggestions frequency](self, "frequency"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMWalletPaymentsCommerceRecurringSendSuggestions suggestionsRange](self, "suggestionsRange"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMWalletPaymentsCommerceRecurringSendSuggestions dayRange](self, "dayRange"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = CFSTR("userSelection");
  v11 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v19 = v11;
  v21 = (void *)v4;
  v24[0] = v11;
  v23[1] = CFSTR("passType");
  v12 = (void *)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[1] = v12;
  v23[2] = CFSTR("tagClickDate");
  v13 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v3;
  v24[2] = v13;
  v23[3] = CFSTR("frequency");
  v14 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[3] = v14;
  v23[4] = CFSTR("suggestionsRange");
  v15 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[4] = v15;
  v23[5] = CFSTR("dayRange");
  v16 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[5] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 6, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v9)
      goto LABEL_19;
LABEL_26:

    if (v8)
      goto LABEL_20;
    goto LABEL_27;
  }

  if (!v9)
    goto LABEL_26;
LABEL_19:
  if (v8)
    goto LABEL_20;
LABEL_27:

LABEL_20:
  if (!v7)

  if (!v21)
  {

    if (v22)
      goto LABEL_24;
LABEL_29:

    goto LABEL_24;
  }
  if (!v22)
    goto LABEL_29;
LABEL_24:

  return v17;
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
  int v13;
  BOOL v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMWalletPaymentsCommerceRecurringSendSuggestions userSelection](self, "userSelection");
    if (v6 == objc_msgSend(v5, "userSelection")
      && (v7 = -[BMWalletPaymentsCommerceRecurringSendSuggestions passType](self, "passType"),
          v7 == objc_msgSend(v5, "passType"))
      && (!-[BMWalletPaymentsCommerceRecurringSendSuggestions hasTagClickDate](self, "hasTagClickDate")
       && !objc_msgSend(v5, "hasTagClickDate")
       || -[BMWalletPaymentsCommerceRecurringSendSuggestions hasTagClickDate](self, "hasTagClickDate")
       && objc_msgSend(v5, "hasTagClickDate")
       && (-[BMWalletPaymentsCommerceRecurringSendSuggestions tagClickDate](self, "tagClickDate"),
           v9 = v8,
           objc_msgSend(v5, "tagClickDate"),
           v9 == v10))
      && (v11 = -[BMWalletPaymentsCommerceRecurringSendSuggestions frequency](self, "frequency"),
          v11 == objc_msgSend(v5, "frequency"))
      && (v12 = -[BMWalletPaymentsCommerceRecurringSendSuggestions suggestionsRange](self, "suggestionsRange"),
          v12 == objc_msgSend(v5, "suggestionsRange")))
    {
      v13 = -[BMWalletPaymentsCommerceRecurringSendSuggestions dayRange](self, "dayRange");
      v14 = v13 == objc_msgSend(v5, "dayRange");
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)userSelection
{
  return self->_userSelection;
}

- (int)passType
{
  return self->_passType;
}

- (double)tagClickDate
{
  return self->_tagClickDate;
}

- (BOOL)hasTagClickDate
{
  return self->_hasTagClickDate;
}

- (void)setHasTagClickDate:(BOOL)a3
{
  self->_hasTagClickDate = a3;
}

- (int)frequency
{
  return self->_frequency;
}

- (int)suggestionsRange
{
  return self->_suggestionsRange;
}

- (int)dayRange
{
  return self->_dayRange;
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

    v4 = -[BMWalletPaymentsCommerceRecurringSendSuggestions initByReadFrom:]([BMWalletPaymentsCommerceRecurringSendSuggestions alloc], "initByReadFrom:", v7);
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
  void *v8;
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("userSelection"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("passType"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("tagClickDate"), 1, 0, 3, 0, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("frequency"), 0, 0, 4, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("suggestionsRange"), 0, 0, 5, 4, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("dayRange"), 0, 0, 6, 4, 0);
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
  return &unk_1E5F1DF80;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userSelection"), 1, 4, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("passType"), 2, 4, 0);
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("tagClickDate"), 3, 0, 0);
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("frequency"), 4, 4, 0);
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("suggestionsRange"), 5, 4, 0);
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("dayRange"), 6, 4, 0);
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
