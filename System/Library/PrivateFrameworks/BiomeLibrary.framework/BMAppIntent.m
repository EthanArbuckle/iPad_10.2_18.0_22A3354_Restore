@implementation BMAppIntent

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
  void *v15;
  _QWORD v16[13];

  v16[12] = *MEMORY[0x1E0C80C00];
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 1, 0, 1);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleID"), 2, 0, 2, 13, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sourceID"), 2, 0, 3, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("intentClass"), 2, 0, 4, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("intentVerb"), 2, 0, 5, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("intentType"), 0, 0, 6, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("handlingStatus"), 0, 0, 7, 4, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("interaction"), 4, 0, 8, 14, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("itemID"), 2, 0, 9, 13, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("donatedBySiri"), 0, 0, 10, 12, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("interactionDirection"), 0, 0, 11, 4, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("groupIdentifier"), 2, 0, 12, 13, 0);
  v16[0] = v15;
  v16[1] = v14;
  v16[2] = v2;
  v16[3] = v3;
  v16[4] = v4;
  v16[5] = v5;
  v16[6] = v6;
  v16[7] = v7;
  v16[8] = v8;
  v16[9] = v13;
  v16[10] = v9;
  v16[11] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 12);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BMAppIntent)initWithAbsoluteTimestamp:(id)a3 bundleID:(id)a4 sourceID:(id)a5 intentClass:(id)a6 intentVerb:(id)a7 intentType:(int)a8 handlingStatus:(int)a9 interaction:(id)a10 itemID:(id)a11 donatedBySiri:(id)a12 interactionDirection:(int)a13 groupIdentifier:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  BMAppIntent *v23;
  double v24;
  id obj;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  objc_super v33;

  v19 = a3;
  obj = a4;
  v20 = a4;
  v32 = a5;
  v31 = a6;
  v30 = a7;
  v29 = a10;
  v28 = a11;
  v21 = a12;
  v22 = a14;
  v33.receiver = self;
  v33.super_class = (Class)BMAppIntent;
  v23 = -[BMEventBase init](&v33, sel_init);
  if (v23)
  {
    v23->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v19)
    {
      v23->_hasRaw_absoluteTimestamp = 1;
      objc_msgSend(v19, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v23->_hasRaw_absoluteTimestamp = 0;
      v24 = -1.0;
    }
    v23->_raw_absoluteTimestamp = v24;
    objc_storeStrong((id *)&v23->_bundleID, obj);
    objc_storeStrong((id *)&v23->_sourceID, a5);
    objc_storeStrong((id *)&v23->_intentClass, a6);
    objc_storeStrong((id *)&v23->_intentVerb, a7);
    v23->_intentType = a8;
    v23->_handlingStatus = a9;
    objc_storeStrong((id *)&v23->_interaction, a10);
    objc_storeStrong((id *)&v23->_itemID, a11);
    if (v21)
    {
      v23->_hasDonatedBySiri = 1;
      v23->_donatedBySiri = objc_msgSend(v21, "BOOLValue");
    }
    else
    {
      v23->_hasDonatedBySiri = 0;
      v23->_donatedBySiri = 0;
    }
    v23->_interactionDirection = a13;
    objc_storeStrong((id *)&v23->_groupIdentifier, a14);
  }

  return v23;
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
  void *v16;
  void *v17;

  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMAppIntent absoluteTimestamp](self, "absoluteTimestamp");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntent bundleID](self, "bundleID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntent sourceID](self, "sourceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntent intentClass](self, "intentClass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntent intentVerb](self, "intentVerb");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  BMAppIntentTypeAsString(-[BMAppIntent intentType](self, "intentType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMAppIntentHandlingStatusAsString(-[BMAppIntent handlingStatus](self, "handlingStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntent interaction](self, "interaction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntent itemID](self, "itemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppIntent donatedBySiri](self, "donatedBySiri"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  BMAppIntentInteractionDirectionAsString(-[BMAppIntent interactionDirection](self, "interactionDirection"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntent groupIdentifier](self, "groupIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "initWithFormat:", CFSTR("BMAppIntent with absoluteTimestamp: %@, bundleID: %@, sourceID: %@, intentClass: %@, intentVerb: %@, intentType: %@, handlingStatus: %@, interaction: %@, itemID: %@, donatedBySiri: %@, interactionDirection: %@, groupIdentifier: %@"), v17, v16, v3, v4, v13, v5, v6, v7, v8, v9, v10, v11);

  return (NSString *)v15;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMAppIntent *v5;
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
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  char v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  void *v51;
  uint64_t v52;
  BMAppIntent *v53;
  objc_super v55;

  v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)BMAppIntent;
  v5 = -[BMEventBase init](&v55, sel_init);
  if (!v5)
    goto LABEL_89;
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
          goto LABEL_60;
        case 3u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 64;
          goto LABEL_60;
        case 4u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 72;
          goto LABEL_60;
        case 5u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 80;
          goto LABEL_60;
        case 6u:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          while (2)
          {
            v28 = *v6;
            v29 = *(_QWORD *)&v4[v28];
            v30 = v29 + 1;
            if (v29 == -1 || v30 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v29);
              *(_QWORD *)&v4[v28] = v30;
              v27 |= (unint64_t)(v31 & 0x7F) << v25;
              if (v31 < 0)
              {
                v25 += 7;
                v17 = v26++ >= 9;
                if (v17)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_64;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v27) = 0;
LABEL_64:
          if (v27 >= 4)
            LODWORD(v27) = 0;
          v52 = 40;
          goto LABEL_83;
        case 7u:
          v32 = 0;
          v33 = 0;
          v27 = 0;
          while (2)
          {
            v34 = *v6;
            v35 = *(_QWORD *)&v4[v34];
            v36 = v35 + 1;
            if (v35 == -1 || v36 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v35);
              *(_QWORD *)&v4[v34] = v36;
              v27 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                v17 = v33++ >= 9;
                if (v17)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_70;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v27) = 0;
LABEL_70:
          if (v27 >= 8)
            LODWORD(v27) = 0;
          v52 = 44;
          goto LABEL_83;
        case 8u:
          PBReaderReadData();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 88;
          goto LABEL_60;
        case 9u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 96;
          goto LABEL_60;
        case 0xAu:
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v5->_hasDonatedBySiri = 1;
          while (2)
          {
            v41 = *v6;
            v42 = *(_QWORD *)&v4[v41];
            v43 = v42 + 1;
            if (v42 == -1 || v43 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v44 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v42);
              *(_QWORD *)&v4[v41] = v43;
              v40 |= (unint64_t)(v44 & 0x7F) << v38;
              if (v44 < 0)
              {
                v38 += 7;
                v17 = v39++ >= 9;
                if (v17)
                {
                  v40 = 0;
                  goto LABEL_76;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v40 = 0;
LABEL_76:
          v5->_donatedBySiri = v40 != 0;
          continue;
        case 0xBu:
          v45 = 0;
          v46 = 0;
          v27 = 0;
          break;
        case 0xCu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 104;
LABEL_60:
          v51 = *(Class *)((char *)&v5->super.super.isa + v24);
          *(Class *)((char *)&v5->super.super.isa + v24) = (Class)v23;

          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_88;
          continue;
      }
      while (1)
      {
        v47 = *v6;
        v48 = *(_QWORD *)&v4[v47];
        v49 = v48 + 1;
        if (v48 == -1 || v49 > *(_QWORD *)&v4[*v7])
          break;
        v50 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v48);
        *(_QWORD *)&v4[v47] = v49;
        v27 |= (unint64_t)(v50 & 0x7F) << v45;
        if ((v50 & 0x80) == 0)
          goto LABEL_78;
        v45 += 7;
        v17 = v46++ >= 9;
        if (v17)
        {
          LODWORD(v27) = 0;
          goto LABEL_80;
        }
      }
      v4[*v8] = 1;
LABEL_78:
      if (v4[*v8])
        LODWORD(v27) = 0;
LABEL_80:
      if (v27 >= 4)
        LODWORD(v27) = 0;
      v52 = 48;
LABEL_83:
      *(_DWORD *)((char *)&v5->super.super.isa + v52) = v27;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_88:
    v53 = 0;
  else
LABEL_89:
    v53 = v5;

  return v53;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_hasRaw_absoluteTimestamp)
    PBDataWriterWriteDoubleField();
  if (self->_bundleID)
    PBDataWriterWriteStringField();
  if (self->_sourceID)
    PBDataWriterWriteStringField();
  if (self->_intentClass)
    PBDataWriterWriteStringField();
  if (self->_intentVerb)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_interaction)
    PBDataWriterWriteDataField();
  if (self->_itemID)
    PBDataWriterWriteStringField();
  if (self->_hasDonatedBySiri)
    PBDataWriterWriteBOOLField();
  PBDataWriterWriteUint32Field();
  if (self->_groupIdentifier)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMAppIntent writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMAppIntent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  objc_class *v8;
  id *v9;
  id v10;
  id v11;
  double v12;
  double v13;
  id *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  BMAppIntent *v22;
  id *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  BMAppIntent *v29;
  BMAppIntent *v30;
  id *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id *v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  id *v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  BMAppIntent *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  id *v57;
  void *v58;
  BMAppIntent *v59;
  void *v60;
  id v61;
  id *v62;
  id v63;
  uint64_t v64;
  id v65;
  void *v66;
  id *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  id *v73;
  id *v74;
  id v75;
  uint64_t v76;
  id v77;
  void *v78;
  uint64_t v79;
  int v80;
  id *v82;
  id v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  id *v88;
  void *v89;
  void *v90;
  id *v91;
  id v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  id *v97;
  uint64_t v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  id v104;
  id v105;
  void *v106;
  void *v107;
  id v108;
  void *v109;
  void *v110;
  id v111;
  void *v112;
  BMAppIntent *v113;
  BMAppIntent *v114;
  id v115;
  void *v116;
  void *v117;
  id v118;
  void *v119;
  id v120;
  void *v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id *v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  id *v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  id v134;
  uint64_t v135;
  id v136;
  uint64_t v137;
  id v138;
  uint64_t v139;
  id v140;
  uint64_t v141;
  id v142;
  uint64_t v143;
  id v144;
  uint64_t v145;
  id v146;
  uint64_t v147;
  id v148;
  uint64_t v149;
  _QWORD v150[3];

  v150[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v126 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (objc_class *)MEMORY[0x1E0C99D68];
    v9 = a4;
    v10 = v7;
    v11 = [v8 alloc];
    objc_msgSend(v10, "doubleValue");
    v13 = v12;

    a4 = v9;
    v14 = (id *)objc_msgSend(v11, "initWithTimeIntervalSinceReferenceDate:", v13);
LABEL_6:
    v126 = v14;
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
        v29 = 0;
        goto LABEL_106;
      }
      v74 = a4;
      v75 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v76 = *MEMORY[0x1E0D025B8];
      v149 = *MEMORY[0x1E0CB2D50];
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("absoluteTimestamp"));
      v150[0] = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v150, &v149, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = (id)objc_msgSend(v75, "initWithDomain:code:userInfo:", v76, 2, v16);
      a4 = 0;
      v29 = 0;
      *v74 = v77;
      goto LABEL_105;
    }
    v14 = v7;
    goto LABEL_6;
  }
  v15 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  objc_msgSend(v15, "dateFromString:", v7);
  v126 = (id *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v123 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v123 = v16;
LABEL_12:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sourceID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v125 = 0;
      goto LABEL_15;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v125 = v17;
LABEL_15:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("intentClass"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v124 = 0;
LABEL_18:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("intentVerb"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v119 = v19;
        v121 = v7;
        v112 = v18;
        v117 = v16;
        if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              v122 = 0;
              v29 = 0;
              v28 = v123;
              a4 = v126;
              goto LABEL_102;
            }
            v114 = self;
            v42 = a4;
            v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v44 = v17;
            v45 = *MEMORY[0x1E0D025B8];
            v141 = *MEMORY[0x1E0CB2D50];
            v118 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("intentVerb"));
            v142 = v118;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v142, &v141, 1);
            v46 = objc_claimAutoreleasedReturnValue();
            v47 = v45;
            v17 = v44;
            v116 = (void *)v46;
            v122 = 0;
            v29 = 0;
            *v42 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v47, 2);
            self = v114;
            v28 = v123;
            a4 = v126;
            goto LABEL_101;
          }
          v122 = v19;
        }
        else
        {
          v122 = 0;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("intentType"));
        v20 = objc_claimAutoreleasedReturnValue();
        v116 = (void *)v20;
        if (v20 && (v21 = (void *)v20, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v118 = v21;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!a4)
              {
                v118 = 0;
                v29 = 0;
                v28 = v123;
                a4 = v126;
                v16 = v117;
                goto LABEL_101;
              }
              v82 = a4;
              v83 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v84 = v17;
              v85 = *MEMORY[0x1E0D025B8];
              v139 = *MEMORY[0x1E0CB2D50];
              v120 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("intentType"));
              v140 = v120;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v140, &v139, 1);
              v86 = objc_claimAutoreleasedReturnValue();
              v87 = v85;
              v17 = v84;
              v110 = (void *)v86;
              v118 = 0;
              v29 = 0;
              *v82 = (id)objc_msgSend(v83, "initWithDomain:code:userInfo:", v87, 2);
              v28 = v123;
              a4 = v126;
              v19 = v119;
              v16 = v117;
LABEL_100:

LABEL_101:
              goto LABEL_102;
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMAppIntentTypeFromString(v21));
            v118 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v118 = 0;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("handlingStatus"));
        v48 = objc_claimAutoreleasedReturnValue();
        v16 = v117;
        v110 = (void *)v48;
        if (v48 && (v49 = (void *)v48, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          v50 = self;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v120 = v49;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!a4)
              {
                v120 = 0;
                v29 = 0;
                v28 = v123;
                a4 = v126;
                v19 = v119;
                goto LABEL_100;
              }
              v91 = a4;
              v92 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v93 = v17;
              v94 = *MEMORY[0x1E0D025B8];
              v137 = *MEMORY[0x1E0CB2D50];
              v115 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("handlingStatus"));
              v138 = v115;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v138, &v137, 1);
              v95 = objc_claimAutoreleasedReturnValue();
              v96 = v94;
              v17 = v93;
              v109 = (void *)v95;
              v120 = 0;
              v29 = 0;
              *v91 = (id)objc_msgSend(v92, "initWithDomain:code:userInfo:", v96, 2);
              v28 = v123;
              self = v50;
              a4 = v126;
              v19 = v119;
              goto LABEL_118;
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMAppIntentHandlingStatusFromString(v49));
            v120 = (id)objc_claimAutoreleasedReturnValue();
          }
          v19 = v119;
        }
        else
        {
          v120 = 0;
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("interaction"));
        v51 = objc_claimAutoreleasedReturnValue();
        v106 = v17;
        v109 = (void *)v51;
        if (!v51 || (v52 = (void *)v51, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v115 = 0;
          goto LABEL_57;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v115 = v52;
LABEL_57:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("itemID"));
          v53 = objc_claimAutoreleasedReturnValue();
          v107 = (void *)v53;
          if (v53)
          {
            v54 = (void *)v53;
            objc_opt_class();
            v55 = v54;
            v7 = v121;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v111 = 0;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!a4)
                {
                  v111 = 0;
                  v29 = 0;
                  v28 = v123;
                  a4 = v126;
                  goto LABEL_98;
                }
                v67 = a4;
                v68 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v69 = *MEMORY[0x1E0D025B8];
                v133 = *MEMORY[0x1E0CB2D50];
                v108 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("itemID"));
                v134 = v108;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v134, &v133, 1);
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                v70 = v69;
                v19 = v119;
                v111 = 0;
                v29 = 0;
                *v67 = (id)objc_msgSend(v68, "initWithDomain:code:userInfo:", v70, 2, v56);
                goto LABEL_124;
              }
              v111 = v55;
            }
          }
          else
          {
            v111 = 0;
          }
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("donatedBySiri"));
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v56 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v57 = a4;
            v108 = 0;
            goto LABEL_68;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v57 = a4;
            v108 = v56;
LABEL_68:
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("interactionDirection"));
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v58 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v59 = self;
              v60 = 0;
              goto LABEL_91;
            }
            v59 = self;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v61 = v58;
LABEL_90:
              v60 = v61;
LABEL_91:
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("groupIdentifier"));
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v78 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v57 = 0;
LABEL_94:
                v79 = objc_msgSend(v118, "intValue");
                v80 = objc_msgSend(v120, "intValue");
                LODWORD(v102) = objc_msgSend(v60, "intValue");
                LODWORD(v100) = v80;
                v28 = v123;
                v29 = -[BMAppIntent initWithAbsoluteTimestamp:bundleID:sourceID:intentClass:intentVerb:intentType:handlingStatus:interaction:itemID:donatedBySiri:interactionDirection:groupIdentifier:](v59, "initWithAbsoluteTimestamp:bundleID:sourceID:intentClass:intentVerb:intentType:handlingStatus:interaction:itemID:donatedBySiri:interactionDirection:groupIdentifier:", v126, v123, v125, v124, v122, v79, v100, v115, v111, v108, v102, v57);
                v59 = v29;
LABEL_95:

LABEL_96:
                self = v59;
                v7 = v121;
                a4 = v126;
                v18 = v112;
                v19 = v119;
LABEL_97:

                goto LABEL_98;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v57 = v78;
                goto LABEL_94;
              }
              if (v57)
              {
                v104 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v103 = *MEMORY[0x1E0D025B8];
                v127 = *MEMORY[0x1E0CB2D50];
                v88 = v57;
                v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("groupIdentifier"));
                v128 = v89;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1);
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                *v88 = (id)objc_msgSend(v104, "initWithDomain:code:userInfo:", v103, 2, v90);

                v57 = 0;
              }
              v29 = 0;
LABEL_122:
              v28 = v123;
              goto LABEL_95;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMAppIntentInteractionDirectionFromString(v58));
              v61 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_90;
            }
            if (v57)
            {
              v97 = v57;
              v105 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v98 = *MEMORY[0x1E0D025B8];
              v129 = *MEMORY[0x1E0CB2D50];
              v57 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("interactionDirection"));
              v130 = v57;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v130, &v129, 1);
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              v99 = (id)objc_msgSend(v105, "initWithDomain:code:userInfo:", v98, 2, v78);
              v60 = 0;
              v29 = 0;
              *v97 = v99;
              goto LABEL_122;
            }
            v60 = 0;
            v29 = 0;
LABEL_129:
            v28 = v123;
            goto LABEL_96;
          }
          if (a4)
          {
            v59 = self;
            v71 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v72 = *MEMORY[0x1E0D025B8];
            v131 = *MEMORY[0x1E0CB2D50];
            v73 = a4;
            v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("donatedBySiri"));
            v132 = v60;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v132, &v131, 1);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v108 = 0;
            v29 = 0;
            *v73 = (id)objc_msgSend(v71, "initWithDomain:code:userInfo:", v72, 2, v58);
            goto LABEL_129;
          }
          v108 = 0;
          v29 = 0;
LABEL_124:
          v28 = v123;
          a4 = v126;
          goto LABEL_97;
        }
        if (a4)
        {
          v62 = a4;
          v63 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v64 = *MEMORY[0x1E0D025B8];
          v135 = *MEMORY[0x1E0CB2D50];
          v65 = objc_alloc(MEMORY[0x1E0CB3940]);
          v101 = objc_opt_class();
          v66 = v65;
          v19 = v119;
          v111 = (id)objc_msgSend(v66, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSData"), v101, CFSTR("interaction"));
          v136 = v111;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v136, &v135, 1);
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          v115 = 0;
          v29 = 0;
          *v62 = (id)objc_msgSend(v63, "initWithDomain:code:userInfo:", v64, 2);
          v28 = v123;
          a4 = v126;
LABEL_98:

          v17 = v106;
LABEL_99:

          goto LABEL_100;
        }
        v115 = 0;
        v29 = 0;
        v28 = v123;
        a4 = v126;
LABEL_118:
        v7 = v121;
        goto LABEL_99;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v124 = v18;
        goto LABEL_18;
      }
      if (a4)
      {
        v113 = self;
        v37 = a4;
        v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v39 = v17;
        v40 = *MEMORY[0x1E0D025B8];
        v143 = *MEMORY[0x1E0CB2D50];
        v122 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("intentClass"));
        v144 = v122;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v144, &v143, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v40;
        v17 = v39;
        v124 = 0;
        v29 = 0;
        *v37 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v41, 2, v19);
        self = v113;
        v28 = v123;
        a4 = v126;
LABEL_102:

        goto LABEL_103;
      }
      v124 = 0;
      v29 = 0;
LABEL_85:
      v28 = v123;
      a4 = v126;
LABEL_103:

      goto LABEL_104;
    }
    if (a4)
    {
      v30 = self;
      v31 = a4;
      v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v33 = v17;
      v34 = *MEMORY[0x1E0D025B8];
      v145 = *MEMORY[0x1E0CB2D50];
      v124 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("sourceID"));
      v146 = v124;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v146, &v145, 1);
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = v34;
      v17 = v33;
      v125 = 0;
      v29 = 0;
      *v31 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v36, 2, v35);
      self = v30;
      v18 = (void *)v35;
      goto LABEL_85;
    }
    v125 = 0;
    v29 = 0;
    v28 = v123;
LABEL_81:
    a4 = v126;
LABEL_104:

    goto LABEL_105;
  }
  if (a4)
  {
    v22 = self;
    v23 = a4;
    v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v25 = *MEMORY[0x1E0D025B8];
    v147 = *MEMORY[0x1E0CB2D50];
    v125 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bundleID"));
    v148 = v125;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v148, &v147, 1);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v25;
    v17 = (void *)v26;
    v28 = 0;
    v29 = 0;
    *v23 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v27, 2, v26);
    self = v22;
    goto LABEL_81;
  }
  v28 = 0;
  v29 = 0;
  a4 = v126;
LABEL_105:

LABEL_106:
  return v29;
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
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
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[12];
  _QWORD v45[14];

  v45[12] = *MEMORY[0x1E0C80C00];
  -[BMAppIntent absoluteTimestamp](self, "absoluteTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMAppIntent absoluteTimestamp](self, "absoluteTimestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  -[BMAppIntent bundleID](self, "bundleID");
  v7 = objc_claimAutoreleasedReturnValue();
  -[BMAppIntent sourceID](self, "sourceID");
  v8 = objc_claimAutoreleasedReturnValue();
  -[BMAppIntent intentClass](self, "intentClass");
  v9 = objc_claimAutoreleasedReturnValue();
  -[BMAppIntent intentVerb](self, "intentVerb");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMAppIntent intentType](self, "intentType"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMAppIntent handlingStatus](self, "handlingStatus"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntent interaction](self, "interaction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "base64EncodedStringWithOptions:", 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMAppIntent itemID](self, "itemID");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  if (-[BMAppIntent hasDonatedBySiri](self, "hasDonatedBySiri"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMAppIntent donatedBySiri](self, "donatedBySiri"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMAppIntent interactionDirection](self, "interactionDirection"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntent groupIdentifier](self, "groupIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = CFSTR("absoluteTimestamp");
  v15 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v34 = (void *)v15;
  v45[0] = v15;
  v44[1] = CFSTR("bundleID");
  v16 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v16;
  v45[1] = v16;
  v44[2] = CFSTR("sourceID");
  v17 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)v17;
  v45[2] = v17;
  v44[3] = CFSTR("intentClass");
  v18 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v39 = (void *)v6;
  v31 = (void *)v18;
  v45[3] = v18;
  v44[4] = CFSTR("intentVerb");
  v19 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v38 = (void *)v7;
  v30 = (void *)v19;
  v45[4] = v19;
  v44[5] = CFSTR("intentType");
  v20 = (uint64_t)v43;
  if (!v43)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v37 = (void *)v8;
  v45[5] = v20;
  v44[6] = CFSTR("handlingStatus");
  v21 = v42;
  if (!v42)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v20;
  v36 = (void *)v9;
  v45[6] = v21;
  v44[7] = CFSTR("interaction");
  v22 = v41;
  if (!v41)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v10;
  v45[7] = v22;
  v44[8] = CFSTR("itemID");
  v24 = v40;
  if (!v40)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v45[8] = v24;
  v44[9] = CFSTR("donatedBySiri");
  v25 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v45[9] = v25;
  v44[10] = CFSTR("interactionDirection");
  v26 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v45[10] = v26;
  v44[11] = CFSTR("groupIdentifier");
  v27 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v45[11] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 12);
  v35 = (id)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (v13)
      goto LABEL_32;
LABEL_49:

    if (v12)
      goto LABEL_33;
    goto LABEL_50;
  }

  if (!v13)
    goto LABEL_49;
LABEL_32:
  if (v12)
    goto LABEL_33;
LABEL_50:

LABEL_33:
  if (!v40)

  if (!v41)
  if (!v42)

  if (!v43)
  if (!v23)

  if (v36)
  {
    if (v37)
      goto LABEL_45;
  }
  else
  {

    if (v37)
    {
LABEL_45:
      if (v38)
        goto LABEL_46;
LABEL_53:

      if (v39)
        goto LABEL_47;
LABEL_54:

      goto LABEL_47;
    }
  }

  if (!v38)
    goto LABEL_53;
LABEL_46:
  if (!v39)
    goto LABEL_54;
LABEL_47:

  return v35;
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
    objc_msgSend(v2, "convertValue:toType:", v3, 1);
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
  char v12;
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
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  int v37;
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
  int v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMAppIntent absoluteTimestamp](self, "absoluteTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimestamp");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMAppIntent absoluteTimestamp](self, "absoluteTimestamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_41;
    }
    -[BMAppIntent bundleID](self, "bundleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleID");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMAppIntent bundleID](self, "bundleID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_41;
    }
    -[BMAppIntent sourceID](self, "sourceID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sourceID");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMAppIntent sourceID](self, "sourceID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sourceID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_41;
    }
    -[BMAppIntent intentClass](self, "intentClass");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "intentClass");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMAppIntent intentClass](self, "intentClass");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "intentClass");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_41;
    }
    -[BMAppIntent intentVerb](self, "intentVerb");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "intentVerb");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMAppIntent intentVerb](self, "intentVerb");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "intentVerb");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
        goto LABEL_41;
    }
    v37 = -[BMAppIntent intentType](self, "intentType");
    if (v37 != objc_msgSend(v5, "intentType"))
      goto LABEL_41;
    v38 = -[BMAppIntent handlingStatus](self, "handlingStatus");
    if (v38 != objc_msgSend(v5, "handlingStatus"))
      goto LABEL_41;
    -[BMAppIntent interaction](self, "interaction");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "interaction");
    v40 = objc_claimAutoreleasedReturnValue();
    if (v39 == (void *)v40)
    {

    }
    else
    {
      v41 = (void *)v40;
      -[BMAppIntent interaction](self, "interaction");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "interaction");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v42, "isEqual:", v43);

      if (!v44)
        goto LABEL_41;
    }
    -[BMAppIntent itemID](self, "itemID");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemID");
    v46 = objc_claimAutoreleasedReturnValue();
    if (v45 == (void *)v46)
    {

    }
    else
    {
      v47 = (void *)v46;
      -[BMAppIntent itemID](self, "itemID");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "itemID");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v48, "isEqual:", v49);

      if (!v50)
        goto LABEL_41;
    }
    if (!-[BMAppIntent hasDonatedBySiri](self, "hasDonatedBySiri")
      && !objc_msgSend(v5, "hasDonatedBySiri")
      || -[BMAppIntent hasDonatedBySiri](self, "hasDonatedBySiri")
      && objc_msgSend(v5, "hasDonatedBySiri")
      && (v51 = -[BMAppIntent donatedBySiri](self, "donatedBySiri"),
          v51 == objc_msgSend(v5, "donatedBySiri")))
    {
      v52 = -[BMAppIntent interactionDirection](self, "interactionDirection");
      if (v52 == objc_msgSend(v5, "interactionDirection"))
      {
        -[BMAppIntent groupIdentifier](self, "groupIdentifier");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "groupIdentifier");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (v53 == v54)
        {
          v12 = 1;
        }
        else
        {
          -[BMAppIntent groupIdentifier](self, "groupIdentifier");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "groupIdentifier");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v55, "isEqual:", v56);

        }
        goto LABEL_42;
      }
    }
LABEL_41:
    v12 = 0;
LABEL_42:

    goto LABEL_43;
  }
  v12 = 0;
LABEL_43:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)sourceID
{
  return self->_sourceID;
}

- (NSString)intentClass
{
  return self->_intentClass;
}

- (NSString)intentVerb
{
  return self->_intentVerb;
}

- (int)intentType
{
  return self->_intentType;
}

- (int)handlingStatus
{
  return self->_handlingStatus;
}

- (NSData)interaction
{
  return self->_interaction;
}

- (NSString)itemID
{
  return self->_itemID;
}

- (BOOL)donatedBySiri
{
  return self->_donatedBySiri;
}

- (BOOL)hasDonatedBySiri
{
  return self->_hasDonatedBySiri;
}

- (void)setHasDonatedBySiri:(BOOL)a3
{
  self->_hasDonatedBySiri = a3;
}

- (int)interactionDirection
{
  return self->_interactionDirection;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
  objc_storeStrong((id *)&self->_intentVerb, 0);
  objc_storeStrong((id *)&self->_intentClass, 0);
  objc_storeStrong((id *)&self->_sourceID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

+ (unsigned)latestDataVersion
{
  return 12;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  __objc2_class **v6;
  void *v7;
  _DWORD *v8;

  v5 = a3;
  if (a4 == 12)
  {
    v6 = off_1E5E4A728;
  }
  else
  {
    if (a4 != 11)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v6 = off_1E5E4A7A8;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D82B90]), "initWithData:", v5);
  v8 = (_DWORD *)objc_msgSend(objc_alloc(*v6), "initByReadFrom:", v7);
  v8[9] = a4;

LABEL_7:
  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1B028;
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
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 1, 0, 0);
  v16[0] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleID"), 2, 13, 0);
  v16[1] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sourceID"), 3, 13, 0);
  v16[2] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("intentClass"), 4, 13, 0);
  v16[3] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("intentVerb"), 5, 13, 0);
  v16[4] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("intentType"), 6, 4, 0);
  v16[5] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("handlingStatus"), 7, 4, 0);
  v16[6] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("interaction"), 8, 14, 0);
  v16[7] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("itemID"), 9, 13, 0);
  v16[8] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("donatedBySiri"), 10, 12, 0);
  v16[9] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("interactionDirection"), 11, 4, 0);
  v16[10] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("groupIdentifier"), 12, 13, 0);
  v16[11] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BMAppIntent)initWithAbsoluteTimestamp:(id)a3 bundleID:(id)a4 sourceID:(id)a5 intentClass:(id)a6 intentVerb:(id)a7 intentType:(int)a8 handlingStatus:(int)a9 interaction:(id)a10 itemID:(id)a11 donatedBySiri:(id)a12 interactionDirection:(int)a13
{
  uint64_t v14;
  uint64_t v15;

  LODWORD(v15) = a13;
  LODWORD(v14) = a9;
  return -[BMAppIntent initWithAbsoluteTimestamp:bundleID:sourceID:intentClass:intentVerb:intentType:handlingStatus:interaction:itemID:donatedBySiri:interactionDirection:groupIdentifier:](self, "initWithAbsoluteTimestamp:bundleID:sourceID:intentClass:intentVerb:intentType:handlingStatus:interaction:itemID:donatedBySiri:interactionDirection:groupIdentifier:", a3, a4, a5, a6, a7, *(_QWORD *)&a8, v14, a10, a11, a12, v15, 0);
}

- (NSString)identifier
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMAppIntent bundleID](self, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMAppIntent itemID](self, "itemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@:%@"), v4, v5);

  return (NSString *)v6;
}

@end
