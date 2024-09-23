@implementation BMLocationVisit

- (BMLocationVisit)initWithDetectionDate:(id)a3 type:(int)a4 location:(id)a5 entryDate:(id)a6 exitDate:(id)a7 confidence:(id)a8 source:(int)a9 placeInference:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  BMLocationVisit *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  objc_super v28;

  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a10;
  v28.receiver = self;
  v28.super_class = (Class)BMLocationVisit;
  v22 = -[BMEventBase init](&v28, sel_init);
  if (v22)
  {
    v22->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v16)
    {
      v22->_hasRaw_detectionDate = 1;
      objc_msgSend(v16, "timeIntervalSince1970");
    }
    else
    {
      v22->_hasRaw_detectionDate = 0;
      v23 = -1.0;
    }
    v22->_raw_detectionDate = v23;
    v22->_type = a4;
    objc_storeStrong((id *)&v22->_location, a5);
    if (v18)
    {
      v22->_hasRaw_entryDate = 1;
      objc_msgSend(v18, "timeIntervalSince1970");
    }
    else
    {
      v22->_hasRaw_entryDate = 0;
      v24 = -1.0;
    }
    v22->_raw_entryDate = v24;
    if (v19)
    {
      v22->_hasRaw_exitDate = 1;
      objc_msgSend(v19, "timeIntervalSince1970");
    }
    else
    {
      v22->_hasRaw_exitDate = 0;
      v25 = -1.0;
    }
    v22->_raw_exitDate = v25;
    if (v20)
    {
      v22->_hasConfidence = 1;
      objc_msgSend(v20, "doubleValue");
    }
    else
    {
      v22->_hasConfidence = 0;
      v26 = -1.0;
    }
    v22->_confidence = v26;
    v22->_source = a9;
    objc_storeStrong((id *)&v22->_placeInference, a10);
  }

  return v22;
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
  void *v12;
  void *v13;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMLocationVisit detectionDate](self, "detectionDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMLocationVisitTypeAsString(-[BMLocationVisit type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLocationVisit location](self, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLocationVisit entryDate](self, "entryDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLocationVisit exitDate](self, "exitDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[BMLocationVisit confidence](self, "confidence");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  BMLocationVisitSourceAsString(-[BMLocationVisit source](self, "source"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLocationVisit placeInference](self, "placeInference");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMLocationVisit with detectionDate: %@, type: %@, location: %@, entryDate: %@, exitDate: %@, confidence: %@, source: %@, placeInference: %@"), v4, v5, v6, v7, v8, v10, v11, v12);

  return (NSString *)v13;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMLocationVisit *v5;
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
  objc_class *v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  objc_class *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  BMLocationVisit *v47;
  objc_super v49;
  uint64_t v50;
  uint64_t v51;

  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)BMLocationVisit;
  v5 = -[BMEventBase init](&v49, sel_init);
  if (!v5)
    goto LABEL_80;
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
          v5->_hasRaw_detectionDate = 1;
          v20 = *v6;
          v21 = *(_QWORD *)&v4[v20];
          if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v22 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v21);
            *(_QWORD *)&v4[v20] = v21 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v22 = 0;
          }
          v46 = 24;
          goto LABEL_76;
        case 2u:
          v23 = 0;
          v24 = 0;
          v25 = 0;
          while (2)
          {
            v26 = *v6;
            v27 = *(_QWORD *)&v4[v26];
            v28 = v27 + 1;
            if (v27 == -1 || v28 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v29 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v27);
              *(_QWORD *)&v4[v26] = v28;
              v25 |= (unint64_t)(v29 & 0x7F) << v23;
              if (v29 < 0)
              {
                v23 += 7;
                v17 = v24++ >= 9;
                if (v17)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_58;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v25) = 0;
LABEL_58:
          if (v25 >= 4)
            LODWORD(v25) = 0;
          v45 = 72;
          goto LABEL_67;
        case 3u:
          v50 = 0;
          v51 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_79;
          v30 = -[BMLocationVisitLocation initByReadFrom:]([BMLocationVisitLocation alloc], "initByReadFrom:", v4);
          if (!v30)
            goto LABEL_79;
          v31 = 80;
          goto LABEL_54;
        case 4u:
          v5->_hasRaw_entryDate = 1;
          v32 = *v6;
          v33 = *(_QWORD *)&v4[v32];
          if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v22 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v33);
            *(_QWORD *)&v4[v32] = v33 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v22 = 0;
          }
          v46 = 40;
          goto LABEL_76;
        case 5u:
          v5->_hasRaw_exitDate = 1;
          v34 = *v6;
          v35 = *(_QWORD *)&v4[v34];
          if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v22 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v35);
            *(_QWORD *)&v4[v34] = v35 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v22 = 0;
          }
          v46 = 56;
          goto LABEL_76;
        case 6u:
          v5->_hasConfidence = 1;
          v36 = *v6;
          v37 = *(_QWORD *)&v4[v36];
          if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v22 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v37);
            *(_QWORD *)&v4[v36] = v37 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v22 = 0;
          }
          v46 = 88;
LABEL_76:
          *(Class *)((char *)&v5->super.super.isa + v46) = v22;
          continue;
        case 7u:
          v38 = 0;
          v39 = 0;
          v25 = 0;
          break;
        case 8u:
          v50 = 0;
          v51 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_79;
          v30 = -[BMPlaceInference initByReadFrom:]([BMPlaceInference alloc], "initByReadFrom:", v4);
          if (!v30)
            goto LABEL_79;
          v31 = 96;
LABEL_54:
          v44 = *(Class *)((char *)&v5->super.super.isa + v31);
          *(Class *)((char *)&v5->super.super.isa + v31) = v30;

          PBReaderRecallMark();
          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_79;
          continue;
      }
      while (1)
      {
        v40 = *v6;
        v41 = *(_QWORD *)&v4[v40];
        v42 = v41 + 1;
        if (v41 == -1 || v42 > *(_QWORD *)&v4[*v7])
          break;
        v43 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v41);
        *(_QWORD *)&v4[v40] = v42;
        v25 |= (unint64_t)(v43 & 0x7F) << v38;
        if ((v43 & 0x80) == 0)
          goto LABEL_62;
        v38 += 7;
        v17 = v39++ >= 9;
        if (v17)
        {
          LODWORD(v25) = 0;
          goto LABEL_64;
        }
      }
      v4[*v8] = 1;
LABEL_62:
      if (v4[*v8])
        LODWORD(v25) = 0;
LABEL_64:
      if (v25 >= 4)
        LODWORD(v25) = 0;
      v45 = 76;
LABEL_67:
      *(_DWORD *)((char *)&v5->super.super.isa + v45) = v25;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_79:
    v47 = 0;
  else
LABEL_80:
    v47 = v5;

  return v47;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_hasRaw_detectionDate)
    PBDataWriterWriteDoubleField();
  PBDataWriterWriteUint32Field();
  if (self->_location)
  {
    PBDataWriterPlaceMark();
    -[BMLocationVisitLocation writeTo:](self->_location, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_hasRaw_entryDate)
    PBDataWriterWriteDoubleField();
  if (self->_hasRaw_exitDate)
    PBDataWriterWriteDoubleField();
  if (self->_hasConfidence)
    PBDataWriterWriteDoubleField();
  PBDataWriterWriteUint32Field();
  if (self->_placeInference)
  {
    PBDataWriterPlaceMark();
    -[BMPlaceInference writeTo:](self->_placeInference, "writeTo:", v4);
    PBDataWriterRecallMark();
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMLocationVisit writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMLocationVisit)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  id v9;
  id v10;
  double v11;
  double v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  BMLocationVisit *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  id v30;
  id v31;
  double v32;
  double v33;
  objc_class *v34;
  id v35;
  id v36;
  double v37;
  double v38;
  id v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  BMLocationVisit *v57;
  void *v58;
  id v59;
  void *v60;
  BMPlaceInference *v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  uint64_t v69;
  void *v70;
  void *v71;
  id v72;
  uint64_t v73;
  id v74;
  void *v75;
  id v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  id v82;
  void *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  id v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  BMLocationVisitLocation *v99;
  id v100;
  void *v101;
  id v102;
  void *v103;
  void *v105;
  id v106;
  id v107;
  uint64_t v108;
  BMPlaceInference *v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  id v113;
  uint64_t v114;
  id v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  id v121;
  uint64_t v122;
  _QWORD v123[3];

  v123[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("detectionDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 0;
LABEL_9:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
    v15 = objc_claimAutoreleasedReturnValue();
    v105 = (void *)v7;
    v103 = (void *)v15;
    if (v15 && (v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = v16;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v17 = 0;
            v26 = 0;
            goto LABEL_90;
          }
          v51 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v52 = v6;
          v53 = *MEMORY[0x1E0D025B8];
          v120 = *MEMORY[0x1E0CB2D50];
          v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("type"));
          v121 = v23;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v121, &v120, 1);
          v54 = objc_claimAutoreleasedReturnValue();
          v55 = v53;
          v6 = v52;
          v17 = 0;
          v26 = 0;
          *a4 = (id)objc_msgSend(v51, "initWithDomain:code:userInfo:", v55, 2, v54);
          v27 = (void *)v54;
          goto LABEL_88;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMLocationVisitTypeFromString(v16));
        v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      v17 = v18;
    }
    else
    {
      v17 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("location"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v26 = 0;
LABEL_89:

          v16 = v103;
          goto LABEL_90;
        }
        v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v41 = v6;
        v42 = *MEMORY[0x1E0D025B8];
        v118 = *MEMORY[0x1E0CB2D50];
        v43 = v17;
        v44 = objc_alloc(MEMORY[0x1E0CB3940]);
        v92 = objc_opt_class();
        v45 = v44;
        v17 = v43;
        v46 = objc_msgSend(v45, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), v92, CFSTR("location"));
        v119 = v46;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v119, &v118, 1);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v42;
        v6 = v41;
        v27 = (void *)v46;
        *a4 = (id)objc_msgSend(v40, "initWithDomain:code:userInfo:", v48, 2, v47);

        v26 = 0;
        goto LABEL_87;
      }
      v23 = v19;
      v107 = 0;
      v99 = -[BMLocationVisitLocation initWithJSONDictionary:error:]([BMLocationVisitLocation alloc], "initWithJSONDictionary:error:", v23, &v107);
      v24 = v107;
      if (v24)
      {
        v25 = v24;
        if (a4)
          *a4 = objc_retainAutorelease(v24);

        v26 = 0;
        v27 = v99;
        goto LABEL_88;
      }

    }
    else
    {
      v99 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("entryDate"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = (objc_class *)MEMORY[0x1E0C99D68];
        v29 = v20;
        v30 = v20;
        v31 = [v28 alloc];
        objc_msgSend(v30, "doubleValue");
        v33 = v32;

        v20 = v29;
        v102 = (id)objc_msgSend(v31, "initWithTimeIntervalSince1970:", v33);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v49 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v49, "dateFromString:", v20);
          v102 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              v102 = 0;
              v26 = 0;
              v27 = v99;
              goto LABEL_86;
            }
            v81 = v20;
            v82 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v83 = v17;
            v84 = *MEMORY[0x1E0D025B8];
            v116 = *MEMORY[0x1E0CB2D50];
            v101 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("entryDate"));
            v117 = v101;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v117, &v116, 1);
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v85 = v82;
            v20 = v81;
            v86 = v84;
            v17 = v83;
            v102 = 0;
            v26 = 0;
            *a4 = (id)objc_msgSend(v85, "initWithDomain:code:userInfo:", v86, 2, v75);
            v27 = v99;
LABEL_85:

LABEL_86:
LABEL_87:
            v23 = v19;
LABEL_88:

            v19 = v23;
            goto LABEL_89;
          }
          v102 = v20;
        }
      }
    }
    else
    {
      v102 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("exitDate"));
    v21 = objc_claimAutoreleasedReturnValue();
    v96 = v20;
    v97 = (void *)v21;
    if (!v21 || (v22 = (void *)v21, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v101 = 0;
      goto LABEL_52;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = (objc_class *)MEMORY[0x1E0C99D68];
      v35 = v22;
      v36 = [v34 alloc];
      objc_msgSend(v35, "doubleValue");
      v38 = v37;

      v39 = (id)objc_msgSend(v36, "initWithTimeIntervalSince1970:", v38);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v50 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
        objc_msgSend(v50, "dateFromString:", v22);
        v101 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_52;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v101 = 0;
          v26 = 0;
          v27 = v99;
          goto LABEL_84;
        }
        v87 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v88 = v17;
        v89 = *MEMORY[0x1E0D025B8];
        v114 = *MEMORY[0x1E0CB2D50];
        v100 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("exitDate"));
        v115 = v100;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v115, &v114, 1);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = v89;
        v17 = v88;
        v101 = 0;
        v26 = 0;
        *a4 = (id)objc_msgSend(v87, "initWithDomain:code:userInfo:", v90, 2, v56);
        goto LABEL_102;
      }
      v39 = v22;
    }
    v101 = v39;
LABEL_52:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("confidence"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = v6;
    if (!v56 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v57 = self;
      v100 = 0;
LABEL_55:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("source"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = v17;
      if (v58 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v59 = v58;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              v59 = 0;
              v26 = 0;
              v27 = v99;
              goto LABEL_82;
            }
            v72 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v73 = *MEMORY[0x1E0D025B8];
            v110 = *MEMORY[0x1E0CB2D50];
            v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("source"));
            v111 = v60;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v111, &v110, 1);
            v61 = (BMPlaceInference *)objc_claimAutoreleasedReturnValue();
            v74 = (id)objc_msgSend(v72, "initWithDomain:code:userInfo:", v73, 2, v61);
            v59 = 0;
            v26 = 0;
            *a4 = v74;
            goto LABEL_79;
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMLocationVisitSourceFromString(v58));
          v59 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v59 = 0;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("placeInference"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v60 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v61 = 0;
LABEL_61:
        v62 = objc_msgSend(v98, "intValue");
        LODWORD(v91) = objc_msgSend(v59, "intValue");
        v63 = v62;
        v27 = v99;
        v26 = -[BMLocationVisit initWithDetectionDate:type:location:entryDate:exitDate:confidence:source:placeInference:](v57, "initWithDetectionDate:type:location:entryDate:exitDate:confidence:source:placeInference:", v7, v63, v99, v102, v101, v100, v91, v61);
        v57 = v26;
LABEL_80:

LABEL_81:
        v17 = v98;
        goto LABEL_82;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v64 = v60;
        v106 = 0;
        v61 = -[BMPlaceInference initWithJSONDictionary:error:]([BMPlaceInference alloc], "initWithJSONDictionary:error:", v64, &v106);
        v65 = v106;
        if (!v65)
        {

          goto LABEL_61;
        }
        v66 = v65;
        if (a4)
          *a4 = objc_retainAutorelease(v65);

        v26 = 0;
        v60 = v64;
      }
      else
      {
        if (!a4)
        {
          v26 = 0;
          v27 = v99;
          goto LABEL_81;
        }
        v94 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v93 = *MEMORY[0x1E0D025B8];
        v108 = *MEMORY[0x1E0CB2D50];
        v61 = (BMPlaceInference *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("placeInference"));
        v109 = v61;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v109, &v108, 1);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v94, "initWithDomain:code:userInfo:", v93, 2, v71);

        v26 = 0;
      }
LABEL_79:
      v27 = v99;
      goto LABEL_80;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v57 = self;
      v100 = v56;
      goto LABEL_55;
    }
    if (a4)
    {
      v57 = self;
      v67 = v17;
      v68 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v69 = *MEMORY[0x1E0D025B8];
      v112 = *MEMORY[0x1E0CB2D50];
      v59 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("confidence"));
      v113 = v59;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v113, &v112, 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v68;
      v17 = v67;
      v100 = 0;
      v26 = 0;
      *a4 = (id)objc_msgSend(v70, "initWithDomain:code:userInfo:", v69, 2, v58);
      v27 = v99;
LABEL_82:

      self = v57;
      v6 = v95;
LABEL_83:
      v20 = v96;

LABEL_84:
      v75 = v97;
      goto LABEL_85;
    }
    v100 = 0;
    v26 = 0;
LABEL_102:
    v27 = v99;
    goto LABEL_83;
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
    v7 = (uint64_t)v13;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
    objc_msgSend(v14, "dateFromString:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v6;
    goto LABEL_6;
  }
  if (!a4)
  {
    v105 = 0;
    v26 = 0;
    goto LABEL_91;
  }
  v77 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v78 = v6;
  v79 = *MEMORY[0x1E0D025B8];
  v122 = *MEMORY[0x1E0CB2D50];
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("detectionDate"));
  v123[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v123, &v122, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v79;
  v6 = v78;
  v105 = 0;
  v26 = 0;
  *a4 = (id)objc_msgSend(v77, "initWithDomain:code:userInfo:", v80, 2, v16);
LABEL_90:

LABEL_91:
  return v26;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[8];
  _QWORD v41[10];

  v41[8] = *MEMORY[0x1E0C80C00];
  -[BMLocationVisit detectionDate](self, "detectionDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMLocationVisit detectionDate](self, "detectionDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSince1970");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLocationVisit type](self, "type"));
  v7 = objc_claimAutoreleasedReturnValue();
  -[BMLocationVisit location](self, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "jsonDictionary");
  v9 = objc_claimAutoreleasedReturnValue();

  -[BMLocationVisit entryDate](self, "entryDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[BMLocationVisit entryDate](self, "entryDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSince1970");
    objc_msgSend(v11, "numberWithDouble:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v39 = 0;
  }

  -[BMLocationVisit exitDate](self, "exitDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    -[BMLocationVisit exitDate](self, "exitDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSince1970");
    objc_msgSend(v14, "numberWithDouble:");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v38 = 0;
  }

  if (!-[BMLocationVisit hasConfidence](self, "hasConfidence")
    || (-[BMLocationVisit confidence](self, "confidence"), fabs(v16) == INFINITY))
  {
    v18 = 0;
  }
  else
  {
    -[BMLocationVisit confidence](self, "confidence");
    v17 = (void *)MEMORY[0x1E0CB37E8];
    -[BMLocationVisit confidence](self, "confidence");
    objc_msgSend(v17, "numberWithDouble:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLocationVisit source](self, "source"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLocationVisit placeInference](self, "placeInference");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "jsonDictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v40[0] = CFSTR("detectionDate");
  v22 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v35 = (void *)v22;
  v41[0] = v22;
  v40[1] = CFSTR("type");
  v23 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v34 = (void *)v23;
  v41[1] = v23;
  v40[2] = CFSTR("location");
  v24 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v37 = (void *)v6;
  v33 = (void *)v24;
  v41[2] = v24;
  v40[3] = CFSTR("entryDate");
  v25 = v39;
  if (!v39)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v36 = (void *)v7;
  v41[3] = v25;
  v40[4] = CFSTR("exitDate");
  v26 = v38;
  if (!v38)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v9;
  v41[4] = v26;
  v40[5] = CFSTR("confidence");
  v28 = v18;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v41[5] = v28;
  v40[6] = CFSTR("source");
  v29 = v19;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v41[6] = v29;
  v40[7] = CFSTR("placeInference");
  v30 = v21;
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v41[7] = v30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    if (v19)
      goto LABEL_32;
LABEL_42:

    if (v18)
      goto LABEL_33;
    goto LABEL_43;
  }

  if (!v19)
    goto LABEL_42;
LABEL_32:
  if (v18)
    goto LABEL_33;
LABEL_43:

LABEL_33:
  if (!v38)

  if (!v39)
  if (v27)
  {
    if (v36)
      goto LABEL_39;
LABEL_45:

    if (v37)
      goto LABEL_40;
LABEL_46:

    goto LABEL_40;
  }

  if (!v36)
    goto LABEL_45;
LABEL_39:
  if (!v37)
    goto LABEL_46;
LABEL_40:

  return v31;
}

- (NSDate)detectionDate
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_detectionDate)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_detectionDate);
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

- (NSDate)entryDate
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_entryDate)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_entryDate);
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

- (NSDate)exitDate
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_exitDate)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_exitDate);
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
  char v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  double v32;
  double v33;
  double v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMLocationVisit detectionDate](self, "detectionDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "detectionDate");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMLocationVisit detectionDate](self, "detectionDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "detectionDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_28;
    }
    v13 = -[BMLocationVisit type](self, "type");
    if (v13 == objc_msgSend(v5, "type"))
    {
      -[BMLocationVisit location](self, "location");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "location");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

      }
      else
      {
        v16 = (void *)v15;
        -[BMLocationVisit location](self, "location");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "location");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqual:", v18);

        if (!v19)
          goto LABEL_28;
      }
      -[BMLocationVisit entryDate](self, "entryDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "entryDate");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

      }
      else
      {
        v22 = (void *)v21;
        -[BMLocationVisit entryDate](self, "entryDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "entryDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqual:", v24);

        if (!v25)
          goto LABEL_28;
      }
      -[BMLocationVisit exitDate](self, "exitDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "exitDate");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v26 == (void *)v27)
      {

      }
      else
      {
        v28 = (void *)v27;
        -[BMLocationVisit exitDate](self, "exitDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "exitDate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v29, "isEqual:", v30);

        if (!v31)
          goto LABEL_28;
      }
      if (!-[BMLocationVisit hasConfidence](self, "hasConfidence") && !objc_msgSend(v5, "hasConfidence")
        || -[BMLocationVisit hasConfidence](self, "hasConfidence")
        && objc_msgSend(v5, "hasConfidence")
        && (-[BMLocationVisit confidence](self, "confidence"), v33 = v32, objc_msgSend(v5, "confidence"), v33 == v34))
      {
        v35 = -[BMLocationVisit source](self, "source");
        if (v35 == objc_msgSend(v5, "source"))
        {
          -[BMLocationVisit placeInference](self, "placeInference");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "placeInference");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v36 == v37)
          {
            v12 = 1;
          }
          else
          {
            -[BMLocationVisit placeInference](self, "placeInference");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "placeInference");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v38, "isEqual:", v39);

          }
          goto LABEL_29;
        }
      }
    }
LABEL_28:
    v12 = 0;
LABEL_29:

    goto LABEL_30;
  }
  v12 = 0;
LABEL_30:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)type
{
  return self->_type;
}

- (BMLocationVisitLocation)location
{
  return self->_location;
}

- (double)confidence
{
  return self->_confidence;
}

- (BOOL)hasConfidence
{
  return self->_hasConfidence;
}

- (void)setHasConfidence:(BOOL)a3
{
  self->_hasConfidence = a3;
}

- (int)source
{
  return self->_source;
}

- (BMPlaceInference)placeInference
{
  return self->_placeInference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeInference, 0);
  objc_storeStrong((id *)&self->_location, 0);
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

    v4 = -[BMLocationVisit initByReadFrom:]([BMLocationVisit alloc], "initByReadFrom:", v7);
    v4[17] = 0;

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
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("detectionDate"), 3, 0, 1, 0, 2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("type"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("location_json"), 5, 1, &__block_literal_global_335);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("entryDate"), 3, 0, 4, 0, 2);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("exitDate"), 3, 0, 5, 0, 2);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("confidence"), 1, 0, 6, 0, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("source"), 0, 0, 7, 4, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("placeInference_json"), 5, 1, &__block_literal_global_336);
  v12[0] = v2;
  v12[1] = v3;
  v12[2] = v4;
  v12[3] = v5;
  v12[4] = v6;
  v12[5] = v7;
  v12[6] = v8;
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1E700;
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
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("detectionDate"), 1, 0, 0);
  v12[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("type"), 2, 4, 0);
  v12[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("location"), 3, 14, objc_opt_class());
  v12[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("entryDate"), 4, 0, 0);
  v12[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("exitDate"), 5, 0, 0);
  v12[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("confidence"), 6, 0, 0);
  v12[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("source"), 7, 4, 0);
  v12[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("placeInference"), 8, 14, objc_opt_class());
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __26__BMLocationVisit_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "placeInference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __26__BMLocationVisit_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
