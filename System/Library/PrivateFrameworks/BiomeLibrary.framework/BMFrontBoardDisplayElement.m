@implementation BMFrontBoardDisplayElement

- (BMFrontBoardDisplayElementDisplay)display
{
  return self->_display;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)changeType
{
  return self->_changeType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_display, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BMFrontBoardDisplayElement)initWithAbsoluteTimestamp:(id)a3 identifier:(id)a4 bundleIdentifier:(id)a5 elementType:(int)a6 layoutRole:(id)a7 level:(id)a8 hasKeyboardFocus:(id)a9 isUIApplicationElement:(id)a10 display:(id)a11 changeType:(int)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  BMFrontBoardDisplayElement *v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  id v28;
  id v29;
  id v30;
  objc_super v31;

  v18 = a3;
  v30 = a4;
  v29 = a5;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v28 = a11;
  v31.receiver = self;
  v31.super_class = (Class)BMFrontBoardDisplayElement;
  v23 = -[BMEventBase init](&v31, sel_init);
  if (v23)
  {
    v23->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v18)
    {
      v23->_hasRaw_absoluteTimestamp = 1;
      objc_msgSend(v18, "timeIntervalSince1970");
    }
    else
    {
      v23->_hasRaw_absoluteTimestamp = 0;
      v24 = -1.0;
    }
    v23->_raw_absoluteTimestamp = v24;
    objc_storeStrong((id *)&v23->_identifier, a4);
    objc_storeStrong((id *)&v23->_bundleIdentifier, a5);
    v23->_elementType = a6;
    if (v19)
    {
      v23->_hasLayoutRole = 1;
      v25 = objc_msgSend(v19, "longLongValue");
    }
    else
    {
      v23->_hasLayoutRole = 0;
      v25 = -1;
    }
    v23->_layoutRole = v25;
    if (v20)
    {
      v23->_hasLevel = 1;
      v26 = objc_msgSend(v20, "longLongValue");
    }
    else
    {
      v23->_hasLevel = 0;
      v26 = -1;
    }
    v23->_level = v26;
    if (v21)
    {
      v23->_hasHasKeyboardFocus = 1;
      v23->_hasKeyboardFocus = objc_msgSend(v21, "BOOLValue");
    }
    else
    {
      v23->_hasHasKeyboardFocus = 0;
      v23->_hasKeyboardFocus = 0;
    }
    if (v22)
    {
      v23->_hasIsUIApplicationElement = 1;
      v23->_isUIApplicationElement = objc_msgSend(v22, "BOOLValue");
    }
    else
    {
      v23->_hasIsUIApplicationElement = 0;
      v23->_isUIApplicationElement = 0;
    }
    objc_storeStrong((id *)&v23->_display, a11);
    v23->_changeType = a12;
  }

  return v23;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (int64_t)level
{
  return self->_level;
}

- (int64_t)layoutRole
{
  return self->_layoutRole;
}

- (BOOL)isUIApplicationElement
{
  return self->_isUIApplicationElement;
}

- (BOOL)hasKeyboardFocus
{
  return self->_hasKeyboardFocus;
}

- (int)elementType
{
  return self->_elementType;
}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMFrontBoardDisplayElement writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_hasRaw_absoluteTimestamp)
    PBDataWriterWriteDoubleField();
  if (self->_identifier)
    PBDataWriterWriteStringField();
  if (self->_bundleIdentifier)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_hasLayoutRole)
    PBDataWriterWriteInt64Field();
  if (self->_hasLevel)
    PBDataWriterWriteInt64Field();
  if (self->_hasHasKeyboardFocus)
    PBDataWriterWriteBOOLField();
  if (self->_hasIsUIApplicationElement)
    PBDataWriterWriteBOOLField();
  if (self->_display)
  {
    PBDataWriterPlaceMark();
    -[BMFrontBoardDisplayElementDisplay writeTo:](self->_display, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  PBDataWriterWriteUint32Field();

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
  void *v11;
  void *v13;
  id v14;
  id v15;

  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMFrontBoardDisplayElement absoluteTimestamp](self, "absoluteTimestamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFrontBoardDisplayElement identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFrontBoardDisplayElement bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMFrontBoardDisplayElementTypeAsString(-[BMFrontBoardDisplayElement elementType](self, "elementType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMFrontBoardDisplayElement layoutRole](self, "layoutRole"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMFrontBoardDisplayElement level](self, "level"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMFrontBoardDisplayElement hasKeyboardFocus](self, "hasKeyboardFocus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMFrontBoardDisplayElement isUIApplicationElement](self, "isUIApplicationElement"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMFrontBoardDisplayElement display](self, "display");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  BMFrontBoardDisplayElementChangeTypeAsString(-[BMFrontBoardDisplayElement changeType](self, "changeType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "initWithFormat:", CFSTR("BMFrontBoardDisplayElement with absoluteTimestamp: %@, identifier: %@, bundleIdentifier: %@, elementType: %@, layoutRole: %@, level: %@, hasKeyboardFocus: %@, isUIApplicationElement: %@, display: %@, changeType: %@"), v13, v3, v4, v5, v6, v7, v8, v9, v10, v11);

  return (NSString *)v15;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMFrontBoardDisplayElement *v5;
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
  unint64_t v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  objc_class *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  char v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  char v46;
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  char v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  BMFrontBoardDisplayElementDisplay *v60;
  BMFrontBoardDisplayElementDisplay *display;
  char v62;
  unsigned int v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  BOOL v70;
  uint64_t v71;
  BMFrontBoardDisplayElement *v72;
  objc_super v74;
  uint64_t v75;
  uint64_t v76;

  v4 = a3;
  v74.receiver = self;
  v74.super_class = (Class)BMFrontBoardDisplayElement;
  v5 = -[BMEventBase init](&v74, sel_init);
  if (!v5)
    goto LABEL_109;
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
          v5->_hasRaw_absoluteTimestamp = 1;
          v20 = *v6;
          v21 = *(_QWORD *)&v4[v20];
          if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v22 = *(double *)(*(_QWORD *)&v4[*v9] + v21);
            *(_QWORD *)&v4[v20] = v21 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v22 = 0.0;
          }
          v5->_raw_absoluteTimestamp = v22;
          continue;
        case 2u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 56;
          goto LABEL_27;
        case 3u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 64;
LABEL_27:
          v25 = *(Class *)((char *)&v5->super.super.isa + v24);
          *(Class *)((char *)&v5->super.super.isa + v24) = (Class)v23;

          continue;
        case 4u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
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
              v28 |= (unint64_t)(v32 & 0x7F) << v26;
              if (v32 < 0)
              {
                v26 += 7;
                v17 = v27++ >= 9;
                if (v17)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_76;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v28) = 0;
LABEL_76:
          if (v28 >= 5)
            LODWORD(v28) = 0;
          v68 = 44;
          goto LABEL_103;
        case 5u:
          v33 = 0;
          v34 = 0;
          v35 = 0;
          v5->_hasLayoutRole = 1;
          while (2)
          {
            v36 = *v6;
            v37 = *(_QWORD *)&v4[v36];
            v38 = v37 + 1;
            if (v37 == -1 || v38 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v39 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v37);
              *(_QWORD *)&v4[v36] = v38;
              v35 = (objc_class *)(((unint64_t)(v39 & 0x7F) << v33) | (unint64_t)v35);
              if (v39 < 0)
              {
                v33 += 7;
                v17 = v34++ >= 9;
                if (v17)
                {
                  v35 = 0;
                  goto LABEL_82;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v35 = 0;
LABEL_82:
          v69 = 72;
          goto LABEL_87;
        case 6u:
          v40 = 0;
          v41 = 0;
          v35 = 0;
          v5->_hasLevel = 1;
          while (2)
          {
            v42 = *v6;
            v43 = *(_QWORD *)&v4[v42];
            v44 = v43 + 1;
            if (v43 == -1 || v44 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v45 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v43);
              *(_QWORD *)&v4[v42] = v44;
              v35 = (objc_class *)(((unint64_t)(v45 & 0x7F) << v40) | (unint64_t)v35);
              if (v45 < 0)
              {
                v40 += 7;
                v17 = v41++ >= 9;
                if (v17)
                {
                  v35 = 0;
                  goto LABEL_86;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v35 = 0;
LABEL_86:
          v69 = 80;
LABEL_87:
          *(Class *)((char *)&v5->super.super.isa + v69) = v35;
          continue;
        case 7u:
          v46 = 0;
          v47 = 0;
          v48 = 0;
          v5->_hasHasKeyboardFocus = 1;
          while (2)
          {
            v49 = *v6;
            v50 = *(_QWORD *)&v4[v49];
            v51 = v50 + 1;
            if (v50 == -1 || v51 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v52 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v50);
              *(_QWORD *)&v4[v49] = v51;
              v48 |= (unint64_t)(v52 & 0x7F) << v46;
              if (v52 < 0)
              {
                v46 += 7;
                v17 = v47++ >= 9;
                if (v17)
                {
                  v48 = 0;
                  goto LABEL_91;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v48 = 0;
LABEL_91:
          v70 = v48 != 0;
          v71 = 34;
          goto LABEL_96;
        case 8u:
          v53 = 0;
          v54 = 0;
          v55 = 0;
          v5->_hasIsUIApplicationElement = 1;
          while (2)
          {
            v56 = *v6;
            v57 = *(_QWORD *)&v4[v56];
            v58 = v57 + 1;
            if (v57 == -1 || v58 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v59 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v57);
              *(_QWORD *)&v4[v56] = v58;
              v55 |= (unint64_t)(v59 & 0x7F) << v53;
              if (v59 < 0)
              {
                v53 += 7;
                v17 = v54++ >= 9;
                if (v17)
                {
                  v55 = 0;
                  goto LABEL_95;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v55 = 0;
LABEL_95:
          v70 = v55 != 0;
          v71 = 36;
LABEL_96:
          *((_BYTE *)&v5->super.super.isa + v71) = v70;
          continue;
        case 9u:
          v75 = 0;
          v76 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_108;
          v60 = -[BMFrontBoardDisplayElementDisplay initByReadFrom:]([BMFrontBoardDisplayElementDisplay alloc], "initByReadFrom:", v4);
          if (!v60)
            goto LABEL_108;
          display = v5->_display;
          v5->_display = v60;

          PBReaderRecallMark();
          continue;
        case 0xAu:
          v62 = 0;
          v63 = 0;
          v28 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_108;
          continue;
      }
      while (1)
      {
        v64 = *v6;
        v65 = *(_QWORD *)&v4[v64];
        v66 = v65 + 1;
        if (v65 == -1 || v66 > *(_QWORD *)&v4[*v7])
          break;
        v67 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v65);
        *(_QWORD *)&v4[v64] = v66;
        v28 |= (unint64_t)(v67 & 0x7F) << v62;
        if ((v67 & 0x80) == 0)
          goto LABEL_98;
        v62 += 7;
        v17 = v63++ >= 9;
        if (v17)
        {
          LODWORD(v28) = 0;
          goto LABEL_100;
        }
      }
      v4[*v8] = 1;
LABEL_98:
      if (v4[*v8])
        LODWORD(v28) = 0;
LABEL_100:
      if (v28 >= 4)
        LODWORD(v28) = 0;
      v68 = 48;
LABEL_103:
      *(_DWORD *)((char *)&v5->super.super.isa + v68) = v28;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_108:
    v72 = 0;
  else
LABEL_109:
    v72 = v5;

  return v72;
}

- (BMFrontBoardDisplayElement)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  id v9;
  id v10;
  double v11;
  double v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  BMFrontBoardDisplayElement *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  BMFrontBoardDisplayElement *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  BMFrontBoardDisplayElementDisplay *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  id *v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  id v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  id v60;
  void *v61;
  id v62;
  uint64_t v63;
  void *v64;
  id v65;
  uint64_t v66;
  id v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  void *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  id v86;
  void *v87;
  id *v88;
  id *v89;
  id *v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  id v97;
  id v98;
  id v99;
  void *v100;
  void *v101;
  id v102;
  id v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  BMFrontBoardDisplayElementDisplay *v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  id v112;
  uint64_t v113;
  id v114;
  uint64_t v115;
  id v116;
  uint64_t v117;
  id v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  _QWORD v124[3];

  v124[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (objc_class *)MEMORY[0x1E0C99D68];
    v9 = v6;
    v10 = [v8 alloc];
    objc_msgSend(v9, "doubleValue");
    v12 = v11;

    v13 = (id)objc_msgSend(v10, "initWithTimeIntervalSince1970:", v12);
LABEL_6:
    v7 = v13;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v7 = 0;
        v28 = 0;
        v33 = self;
        goto LABEL_99;
      }
      v74 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v75 = *MEMORY[0x1E0D025B8];
      v123 = *MEMORY[0x1E0CB2D50];
      v76 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("absoluteTimestamp"));
      v124[0] = v76;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v124, &v123, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v75;
      v16 = (id)v76;
      v7 = 0;
      v28 = 0;
      *a4 = (id)objc_msgSend(v74, "initWithDomain:code:userInfo:", v77, 2, v15);
      goto LABEL_84;
    }
    v13 = v6;
    goto LABEL_6;
  }
  v14 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  objc_msgSend(v14, "dateFromString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v16 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v15;
LABEL_12:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v99 = 0;
LABEL_15:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("elementType"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = v15;
      v100 = v6;
      if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = v7;
          v21 = v18;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              v101 = 0;
              v28 = 0;
              v24 = v99;
              v33 = self;
              goto LABEL_96;
            }
            v102 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v68 = v16;
            v69 = *MEMORY[0x1E0D025B8];
            v117 = *MEMORY[0x1E0CB2D50];
            v98 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("elementType"));
            v118 = v98;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
            v70 = objc_claimAutoreleasedReturnValue();
            v71 = v69;
            v16 = v68;
            v94 = (void *)v70;
            v72 = (id)objc_msgSend(v102, "initWithDomain:code:userInfo:", v71, 2);
            v101 = 0;
            v28 = 0;
            *a4 = v72;
            v24 = v99;
            v33 = self;
            goto LABEL_95;
          }
          v19 = v7;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMFrontBoardDisplayElementTypeFromString(v18));
          v21 = (id)objc_claimAutoreleasedReturnValue();
        }
        v101 = v21;
        v20 = a4;
      }
      else
      {
        v19 = v7;
        v20 = a4;
        v101 = 0;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("layoutRole"));
      v34 = objc_claimAutoreleasedReturnValue();
      v97 = v16;
      v94 = (void *)v34;
      if (v34 && (v35 = (void *)v34, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v20)
          {
            v98 = 0;
            v28 = 0;
            v33 = self;
            v7 = v19;
            v24 = v99;
            v6 = v100;
            goto LABEL_95;
          }
          v47 = v20;
          v48 = v17;
          v49 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v50 = v18;
          v51 = *MEMORY[0x1E0D025B8];
          v115 = *MEMORY[0x1E0CB2D50];
          v95 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("layoutRole"));
          v116 = v95;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = v49;
          v17 = v48;
          v53 = v51;
          v18 = v50;
          v15 = v96;
          v98 = 0;
          v28 = 0;
          *v47 = (id)objc_msgSend(v52, "initWithDomain:code:userInfo:", v53, 2, v36);
          v33 = self;
          v7 = v19;
          v24 = v99;
          v6 = v100;
LABEL_94:

          v16 = v97;
LABEL_95:

          goto LABEL_96;
        }
        v98 = v35;
      }
      else
      {
        v98 = 0;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("level"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = v19;
      if (v36)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v95 = 0;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v7 = v19;
            v6 = v100;
            if (!v20)
            {
              v95 = 0;
              v28 = 0;
              v24 = v99;
              v33 = self;
              goto LABEL_94;
            }
            v54 = v17;
            v55 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v56 = v18;
            v57 = *MEMORY[0x1E0D025B8];
            v113 = *MEMORY[0x1E0CB2D50];
            v92 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("level"));
            v114 = v92;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = v55;
            v17 = v54;
            v59 = v57;
            v18 = v56;
            v15 = v96;
            v95 = 0;
            v28 = 0;
            *v20 = (id)objc_msgSend(v58, "initWithDomain:code:userInfo:", v59, 2, v37);
            goto LABEL_103;
          }
          v95 = v36;
        }
      }
      else
      {
        v95 = 0;
      }
      v6 = v100;
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hasKeyboardFocus"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = v18;
      if (!v37 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v92 = 0;
        goto LABEL_45;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v92 = v37;
LABEL_45:
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isUIApplicationElement"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = v17;
        if (!v38 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v89 = v20;
          v39 = 0;
          goto LABEL_48;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v89 = v20;
          v39 = v38;
LABEL_48:
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("display"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v40 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v41 = 0;
            goto LABEL_51;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v44 = v40;
            v104 = 0;
            v41 = -[BMFrontBoardDisplayElementDisplay initWithJSONDictionary:error:]([BMFrontBoardDisplayElementDisplay alloc], "initWithJSONDictionary:error:", v44, &v104);
            v45 = v104;
            if (v45)
            {
              v46 = v45;
              if (v89)
                *v89 = objc_retainAutorelease(v45);

              v28 = 0;
              v40 = v44;
              goto LABEL_90;
            }

LABEL_51:
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("changeType"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            if (v42 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v60 = v42;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (v89)
                  {
                    v86 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v84 = *MEMORY[0x1E0D025B8];
                    v105 = *MEMORY[0x1E0CB2D50];
                    v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("changeType"));
                    v106 = v80;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                    *v89 = (id)objc_msgSend(v86, "initWithDomain:code:userInfo:", v84, 2, v81);

                  }
                  v43 = 0;
                  v28 = 0;
                  goto LABEL_89;
                }
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMFrontBoardDisplayElementChangeTypeFromString(v42));
                v60 = (id)objc_claimAutoreleasedReturnValue();
              }
              v43 = v60;
            }
            else
            {
              v43 = 0;
            }
            v78 = objc_msgSend(v101, "intValue");
            LODWORD(v82) = objc_msgSend(v43, "intValue");
            v28 = -[BMFrontBoardDisplayElement initWithAbsoluteTimestamp:identifier:bundleIdentifier:elementType:layoutRole:level:hasKeyboardFocus:isUIApplicationElement:display:changeType:](self, "initWithAbsoluteTimestamp:identifier:bundleIdentifier:elementType:layoutRole:level:hasKeyboardFocus:isUIApplicationElement:display:changeType:", v93, v97, v99, v78, v98, v95, v92, v39, v41, v82);
            self = v28;
LABEL_89:

            goto LABEL_90;
          }
          if (!v89)
          {
            v28 = 0;
            v6 = v100;
            goto LABEL_91;
          }
          v85 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v83 = *MEMORY[0x1E0D025B8];
          v107 = *MEMORY[0x1E0CB2D50];
          v41 = (BMFrontBoardDisplayElementDisplay *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("display"));
          v108 = v41;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          *v89 = (id)objc_msgSend(v85, "initWithDomain:code:userInfo:", v83, 2, v73);

          v28 = 0;
LABEL_90:

          v6 = v100;
          v17 = v87;
LABEL_91:
          v24 = v99;

LABEL_92:
          v33 = self;

          v18 = v91;
          v15 = v96;
LABEL_93:

          v7 = v93;
          goto LABEL_94;
        }
        if (v20)
        {
          v65 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v66 = *MEMORY[0x1E0D025B8];
          v109 = *MEMORY[0x1E0CB2D50];
          v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("isUIApplicationElement"));
          v110 = v40;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1);
          v41 = (BMFrontBoardDisplayElementDisplay *)objc_claimAutoreleasedReturnValue();
          v67 = (id)objc_msgSend(v65, "initWithDomain:code:userInfo:", v66, 2, v41);
          v39 = 0;
          v28 = 0;
          *v20 = v67;
          goto LABEL_90;
        }
        v39 = 0;
        v28 = 0;
LABEL_105:
        v24 = v99;
        goto LABEL_92;
      }
      if (v20)
      {
        v90 = v20;
        v61 = v17;
        v62 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v63 = *MEMORY[0x1E0D025B8];
        v111 = *MEMORY[0x1E0CB2D50];
        v39 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("hasKeyboardFocus"));
        v112 = v39;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v62;
        v17 = v61;
        v92 = 0;
        v28 = 0;
        *v90 = (id)objc_msgSend(v64, "initWithDomain:code:userInfo:", v63, 2, v38);
        goto LABEL_105;
      }
      v92 = 0;
      v28 = 0;
LABEL_103:
      v24 = v99;
      v33 = self;
      goto LABEL_93;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v99 = v17;
      goto LABEL_15;
    }
    if (a4)
    {
      v88 = a4;
      v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v30 = v16;
      v31 = *MEMORY[0x1E0D025B8];
      v119 = *MEMORY[0x1E0CB2D50];
      v101 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bundleIdentifier"));
      v120 = v101;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      v16 = v30;
      v24 = 0;
      v28 = 0;
      *v88 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v32, 2, v18);
      v33 = self;
LABEL_96:

      goto LABEL_97;
    }
    v24 = 0;
    v28 = 0;
LABEL_81:
    v33 = self;
LABEL_97:

    goto LABEL_98;
  }
  if (a4)
  {
    v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v23 = *MEMORY[0x1E0D025B8];
    v121 = *MEMORY[0x1E0CB2D50];
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("identifier"));
    v122 = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v122, &v121, 1);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v22;
    v17 = (void *)v25;
    v27 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v23, 2, v25);
    v16 = 0;
    v28 = 0;
    *a4 = v27;
    goto LABEL_81;
  }
  v16 = 0;
  v28 = 0;
LABEL_84:
  v33 = self;
LABEL_98:

LABEL_99:
  return v28;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[10];
  _QWORD v41[12];

  v41[10] = *MEMORY[0x1E0C80C00];
  -[BMFrontBoardDisplayElement absoluteTimestamp](self, "absoluteTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMFrontBoardDisplayElement absoluteTimestamp](self, "absoluteTimestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSince1970");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  -[BMFrontBoardDisplayElement identifier](self, "identifier");
  v7 = objc_claimAutoreleasedReturnValue();
  -[BMFrontBoardDisplayElement bundleIdentifier](self, "bundleIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMFrontBoardDisplayElement elementType](self, "elementType"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (-[BMFrontBoardDisplayElement hasLayoutRole](self, "hasLayoutRole"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMFrontBoardDisplayElement layoutRole](self, "layoutRole"));
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  if (-[BMFrontBoardDisplayElement hasLevel](self, "hasLevel"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMFrontBoardDisplayElement level](self, "level"));
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  if (-[BMFrontBoardDisplayElement hasHasKeyboardFocus](self, "hasHasKeyboardFocus"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMFrontBoardDisplayElement hasKeyboardFocus](self, "hasKeyboardFocus"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v39 = 0;
  }
  if (-[BMFrontBoardDisplayElement hasIsUIApplicationElement](self, "hasIsUIApplicationElement"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMFrontBoardDisplayElement isUIApplicationElement](self, "isUIApplicationElement"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v38 = 0;
  }
  -[BMFrontBoardDisplayElement display](self, "display");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "jsonDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMFrontBoardDisplayElement changeType](self, "changeType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = CFSTR("absoluteTimestamp");
  v15 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v15;
  v41[0] = v15;
  v40[1] = CFSTR("identifier");
  v16 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)v16;
  v41[1] = v16;
  v40[2] = CFSTR("bundleIdentifier");
  v17 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v17;
  v41[2] = v17;
  v40[3] = CFSTR("elementType");
  v18 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v37 = (void *)v6;
  v30 = (void *)v18;
  v41[3] = v18;
  v40[4] = CFSTR("layoutRole");
  v19 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v36 = (void *)v7;
  v29 = (void *)v19;
  v41[4] = v19;
  v40[5] = CFSTR("level");
  v20 = (void *)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v35 = (void *)v8;
  v41[5] = v20;
  v40[6] = CFSTR("hasKeyboardFocus");
  v21 = v39;
  if (!v39)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v11;
  v23 = (void *)v9;
  v41[6] = v21;
  v40[7] = CFSTR("isUIApplicationElement");
  v24 = v38;
  if (!v38)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v10;
  v41[7] = v24;
  v40[8] = CFSTR("display");
  v26 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v41[8] = v26;
  v40[9] = CFSTR("changeType");
  v27 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v41[9] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 10);
  v34 = (id)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (v13)
      goto LABEL_38;
  }
  else
  {

    if (v13)
      goto LABEL_38;
  }

LABEL_38:
  if (!v38)

  if (!v39)
  if (!v22)

  if (!v25)
  if (v23)
  {
    if (v35)
      goto LABEL_48;
  }
  else
  {

    if (v35)
    {
LABEL_48:
      if (v36)
        goto LABEL_49;
LABEL_55:

      if (v37)
        goto LABEL_50;
LABEL_56:

      goto LABEL_50;
    }
  }

  if (!v36)
    goto LABEL_55;
LABEL_49:
  if (!v37)
    goto LABEL_56;
LABEL_50:

  return v34;
}

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
    objc_msgSend(v2, "convertValue:toType:", v3, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
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
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  int64_t v26;
  int64_t v27;
  int v28;
  int v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  int v37;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMFrontBoardDisplayElement absoluteTimestamp](self, "absoluteTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimestamp");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMFrontBoardDisplayElement absoluteTimestamp](self, "absoluteTimestamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_38;
    }
    -[BMFrontBoardDisplayElement identifier](self, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMFrontBoardDisplayElement identifier](self, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_38;
    }
    -[BMFrontBoardDisplayElement bundleIdentifier](self, "bundleIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMFrontBoardDisplayElement bundleIdentifier](self, "bundleIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_38;
    }
    v25 = -[BMFrontBoardDisplayElement elementType](self, "elementType");
    if (v25 != objc_msgSend(v5, "elementType"))
      goto LABEL_38;
    if (-[BMFrontBoardDisplayElement hasLayoutRole](self, "hasLayoutRole")
      || objc_msgSend(v5, "hasLayoutRole"))
    {
      if (!-[BMFrontBoardDisplayElement hasLayoutRole](self, "hasLayoutRole"))
        goto LABEL_38;
      if (!objc_msgSend(v5, "hasLayoutRole"))
        goto LABEL_38;
      v26 = -[BMFrontBoardDisplayElement layoutRole](self, "layoutRole");
      if (v26 != objc_msgSend(v5, "layoutRole"))
        goto LABEL_38;
    }
    if (-[BMFrontBoardDisplayElement hasLevel](self, "hasLevel") || objc_msgSend(v5, "hasLevel"))
    {
      if (!-[BMFrontBoardDisplayElement hasLevel](self, "hasLevel"))
        goto LABEL_38;
      if (!objc_msgSend(v5, "hasLevel"))
        goto LABEL_38;
      v27 = -[BMFrontBoardDisplayElement level](self, "level");
      if (v27 != objc_msgSend(v5, "level"))
        goto LABEL_38;
    }
    if (-[BMFrontBoardDisplayElement hasHasKeyboardFocus](self, "hasHasKeyboardFocus")
      || objc_msgSend(v5, "hasHasKeyboardFocus"))
    {
      if (!-[BMFrontBoardDisplayElement hasHasKeyboardFocus](self, "hasHasKeyboardFocus"))
        goto LABEL_38;
      if (!objc_msgSend(v5, "hasHasKeyboardFocus"))
        goto LABEL_38;
      v28 = -[BMFrontBoardDisplayElement hasKeyboardFocus](self, "hasKeyboardFocus");
      if (v28 != objc_msgSend(v5, "hasKeyboardFocus"))
        goto LABEL_38;
    }
    if (-[BMFrontBoardDisplayElement hasIsUIApplicationElement](self, "hasIsUIApplicationElement")
      || objc_msgSend(v5, "hasIsUIApplicationElement"))
    {
      if (!-[BMFrontBoardDisplayElement hasIsUIApplicationElement](self, "hasIsUIApplicationElement"))
        goto LABEL_38;
      if (!objc_msgSend(v5, "hasIsUIApplicationElement"))
        goto LABEL_38;
      v29 = -[BMFrontBoardDisplayElement isUIApplicationElement](self, "isUIApplicationElement");
      if (v29 != objc_msgSend(v5, "isUIApplicationElement"))
        goto LABEL_38;
    }
    -[BMFrontBoardDisplayElement display](self, "display");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "display");
    v31 = objc_claimAutoreleasedReturnValue();
    if (v30 == (void *)v31)
    {

    }
    else
    {
      v32 = (void *)v31;
      -[BMFrontBoardDisplayElement display](self, "display");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "display");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v33, "isEqual:", v34);

      if (!v35)
      {
LABEL_38:
        v12 = 0;
LABEL_39:

        goto LABEL_40;
      }
    }
    v37 = -[BMFrontBoardDisplayElement changeType](self, "changeType");
    v12 = v37 == objc_msgSend(v5, "changeType");
    goto LABEL_39;
  }
  v12 = 0;
LABEL_40:

  return v12;
}

- (BOOL)hasLayoutRole
{
  return self->_hasLayoutRole;
}

- (void)setHasLayoutRole:(BOOL)a3
{
  self->_hasLayoutRole = a3;
}

- (BOOL)hasLevel
{
  return self->_hasLevel;
}

- (void)setHasLevel:(BOOL)a3
{
  self->_hasLevel = a3;
}

- (BOOL)hasHasKeyboardFocus
{
  return self->_hasHasKeyboardFocus;
}

- (void)setHasHasKeyboardFocus:(BOOL)a3
{
  self->_hasHasKeyboardFocus = a3;
}

- (BOOL)hasIsUIApplicationElement
{
  return self->_hasIsUIApplicationElement;
}

- (void)setHasIsUIApplicationElement:(BOOL)a3
{
  self->_hasIsUIApplicationElement = a3;
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

    v4 = -[BMFrontBoardDisplayElement initByReadFrom:]([BMFrontBoardDisplayElement alloc], "initByReadFrom:", v7);
    v4[10] = 0;

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
  void *v11;
  id v13;
  _QWORD v14[11];

  v14[10] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 1, 0, 2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("identifier"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleIdentifier"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("elementType"), 0, 0, 4, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("layoutRole"), 0, 0, 5, 3, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("level"), 0, 0, 6, 3, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("hasKeyboardFocus"), 0, 0, 7, 12, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isUIApplicationElement"), 0, 0, 8, 12, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("display_json"), 5, 1, &__block_literal_global_219);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("changeType"), 0, 0, 10, 4, 0);
  v14[0] = v2;
  v14[1] = v3;
  v14[2] = v4;
  v14[3] = v5;
  v14[4] = v6;
  v14[5] = v7;
  v14[6] = v8;
  v14[7] = v9;
  v14[8] = v10;
  v14[9] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 10);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1DF50;
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
  _QWORD v14[11];

  v14[10] = *MEMORY[0x1E0C80C00];
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 1, 0, 0);
  v14[0] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("identifier"), 2, 13, 0);
  v14[1] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleIdentifier"), 3, 13, 0);
  v14[2] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("elementType"), 4, 4, 0);
  v14[3] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("layoutRole"), 5, 3, 0);
  v14[4] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("level"), 6, 3, 0);
  v14[5] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("hasKeyboardFocus"), 7, 12, 0);
  v14[6] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isUIApplicationElement"), 8, 12, 0);
  v14[7] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("display"), 9, 14, objc_opt_class());
  v14[8] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("changeType"), 10, 4, 0);
  v14[9] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __37__BMFrontBoardDisplayElement_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "display");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
