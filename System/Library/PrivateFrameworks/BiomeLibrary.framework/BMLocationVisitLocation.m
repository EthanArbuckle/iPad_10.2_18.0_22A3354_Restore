@implementation BMLocationVisitLocation

- (BMLocationVisitLocation)initWithLatitude:(id)a3 longitude:(id)a4 horizontalUncertainty:(id)a5 altitude:(id)a6 verticalUncertainty:(id)a7 date:(id)a8 referenceFrame:(int)a9 sourceAccuracy:(int)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  BMLocationVisitLocation *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  objc_super v30;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v30.receiver = self;
  v30.super_class = (Class)BMLocationVisitLocation;
  v22 = -[BMEventBase init](&v30, sel_init);
  if (v22)
  {
    v22->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v16)
    {
      v22->_hasLatitude = 1;
      objc_msgSend(v16, "doubleValue");
    }
    else
    {
      v22->_hasLatitude = 0;
      v23 = -1.0;
    }
    v22->_latitude = v23;
    if (v17)
    {
      v22->_hasLongitude = 1;
      objc_msgSend(v17, "doubleValue");
    }
    else
    {
      v22->_hasLongitude = 0;
      v24 = -1.0;
    }
    v22->_longitude = v24;
    if (v18)
    {
      v22->_hasHorizontalUncertainty = 1;
      objc_msgSend(v18, "doubleValue");
    }
    else
    {
      v22->_hasHorizontalUncertainty = 0;
      v25 = -1.0;
    }
    v22->_horizontalUncertainty = v25;
    if (v19)
    {
      v22->_hasAltitude = 1;
      objc_msgSend(v19, "doubleValue");
    }
    else
    {
      v22->_hasAltitude = 0;
      v26 = -1.0;
    }
    v22->_altitude = v26;
    if (v20)
    {
      v22->_hasVerticalUncertainty = 1;
      objc_msgSend(v20, "doubleValue");
    }
    else
    {
      v22->_hasVerticalUncertainty = 0;
      v27 = -1.0;
    }
    v22->_verticalUncertainty = v27;
    if (v21)
    {
      v22->_hasRaw_date = 1;
      objc_msgSend(v21, "timeIntervalSince1970");
    }
    else
    {
      v22->_hasRaw_date = 0;
      v28 = -1.0;
    }
    v22->_raw_date = v28;
    v22->_referenceFrame = a9;
    v22->_sourceAccuracy = a10;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[BMLocationVisitLocation latitude](self, "latitude");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[BMLocationVisitLocation longitude](self, "longitude");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[BMLocationVisitLocation horizontalUncertainty](self, "horizontalUncertainty");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[BMLocationVisitLocation altitude](self, "altitude");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[BMLocationVisitLocation verticalUncertainty](self, "verticalUncertainty");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLocationVisitLocation date](self, "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  BMLocationVisitLocationReferenceFrameAsString(-[BMLocationVisitLocation referenceFrame](self, "referenceFrame"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  BMLocationVisitLocationSourceAccuracyAsString(-[BMLocationVisitLocation sourceAccuracy](self, "sourceAccuracy"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMLocationVisitLocation with latitude: %@, longitude: %@, horizontalUncertainty: %@, altitude: %@, verticalUncertainty: %@, date: %@, referenceFrame: %@, sourceAccuracy: %@"), v5, v7, v9, v11, v13, v14, v15, v16);

  return (NSString *)v17;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMLocationVisitLocation *v5;
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
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
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
  uint64_t v46;
  uint64_t v47;
  BMLocationVisitLocation *v48;
  objc_super v50;

  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)BMLocationVisitLocation;
  v5 = -[BMEventBase init](&v50, sel_init);
  if (!v5)
    goto LABEL_83;
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
          v5->_hasLatitude = 1;
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
          v47 = 56;
          goto LABEL_79;
        case 2u:
          v5->_hasLongitude = 1;
          v23 = *v6;
          v24 = *(_QWORD *)&v4[v23];
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v22 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v24);
            *(_QWORD *)&v4[v23] = v24 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v22 = 0;
          }
          v47 = 64;
          goto LABEL_79;
        case 3u:
          v5->_hasHorizontalUncertainty = 1;
          v25 = *v6;
          v26 = *(_QWORD *)&v4[v25];
          if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v22 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v26);
            *(_QWORD *)&v4[v25] = v26 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v22 = 0;
          }
          v47 = 72;
          goto LABEL_79;
        case 4u:
          v5->_hasAltitude = 1;
          v27 = *v6;
          v28 = *(_QWORD *)&v4[v27];
          if (v28 <= 0xFFFFFFFFFFFFFFF7 && v28 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v22 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v28);
            *(_QWORD *)&v4[v27] = v28 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v22 = 0;
          }
          v47 = 80;
          goto LABEL_79;
        case 5u:
          v5->_hasVerticalUncertainty = 1;
          v29 = *v6;
          v30 = *(_QWORD *)&v4[v29];
          if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v22 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v30);
            *(_QWORD *)&v4[v29] = v30 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v22 = 0;
          }
          v47 = 88;
          goto LABEL_79;
        case 6u:
          v5->_hasRaw_date = 1;
          v31 = *v6;
          v32 = *(_QWORD *)&v4[v31];
          if (v32 <= 0xFFFFFFFFFFFFFFF7 && v32 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v22 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v32);
            *(_QWORD *)&v4[v31] = v32 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v22 = 0;
          }
          v47 = 24;
LABEL_79:
          *(Class *)((char *)&v5->super.super.isa + v47) = v22;
          continue;
        case 7u:
          v33 = 0;
          v34 = 0;
          v35 = 0;
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
              v35 |= (unint64_t)(v39 & 0x7F) << v33;
              if (v39 < 0)
              {
                v33 += 7;
                v17 = v34++ >= 9;
                if (v17)
                {
                  LODWORD(v35) = 0;
                  goto LABEL_57;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v35) = 0;
LABEL_57:
          if (v35 >= 3)
            LODWORD(v35) = 0;
          v46 = 44;
          goto LABEL_66;
        case 8u:
          v40 = 0;
          v41 = 0;
          v35 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_82;
          continue;
      }
      while (1)
      {
        v42 = *v6;
        v43 = *(_QWORD *)&v4[v42];
        v44 = v43 + 1;
        if (v43 == -1 || v44 > *(_QWORD *)&v4[*v7])
          break;
        v45 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v43);
        *(_QWORD *)&v4[v42] = v44;
        v35 |= (unint64_t)(v45 & 0x7F) << v40;
        if ((v45 & 0x80) == 0)
          goto LABEL_61;
        v40 += 7;
        v17 = v41++ >= 9;
        if (v17)
        {
          LODWORD(v35) = 0;
          goto LABEL_63;
        }
      }
      v4[*v8] = 1;
LABEL_61:
      if (v4[*v8])
        LODWORD(v35) = 0;
LABEL_63:
      if (v35 >= 3)
        LODWORD(v35) = 0;
      v46 = 48;
LABEL_66:
      *(_DWORD *)((char *)&v5->super.super.isa + v46) = v35;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_82:
    v48 = 0;
  else
LABEL_83:
    v48 = v5;

  return v48;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_hasLatitude)
    PBDataWriterWriteDoubleField();
  if (self->_hasLongitude)
    PBDataWriterWriteDoubleField();
  if (self->_hasHorizontalUncertainty)
    PBDataWriterWriteDoubleField();
  if (self->_hasAltitude)
    PBDataWriterWriteDoubleField();
  if (self->_hasVerticalUncertainty)
    PBDataWriterWriteDoubleField();
  if (self->_hasRaw_date)
    PBDataWriterWriteDoubleField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMLocationVisitLocation writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMLocationVisitLocation)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  BMLocationVisitLocation *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BMLocationVisitLocation *v24;
  objc_class *v25;
  id *v26;
  id v27;
  id v28;
  double v29;
  double v30;
  id v31;
  id *v32;
  id v33;
  uint64_t v34;
  void *v35;
  id v36;
  id *v37;
  id v38;
  uint64_t v39;
  id v40;
  id v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  id *v54;
  id v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  void *v60;
  id *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  id v68;
  uint64_t v69;
  id v70;
  void *v71;
  void *v72;
  id *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id *v84;
  id v85;
  id v86;
  id v87;
  BMLocationVisitLocation *v88;
  id v89;
  id v90;
  void *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  id v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  _QWORD v107[3];

  v107[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("latitude"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = v6;
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("longitude"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v10 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;
LABEL_7:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("horizontalUncertainty"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = v10;
      if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v12 = self;
        v13 = v9;
        v14 = v7;
        v87 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = self;
        v13 = v9;
        v14 = v7;
        v87 = v11;
LABEL_10:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("altitude"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = v11;
        if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v80 = v15;
          v90 = 0;
          goto LABEL_13;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v80 = v15;
          v90 = v15;
LABEL_13:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("verticalUncertainty"));
          v16 = objc_claimAutoreleasedReturnValue();
          v7 = v14;
          v82 = (void *)v16;
          if (v16)
          {
            v17 = (void *)v16;
            objc_opt_class();
            v9 = v13;
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              self = v12;
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!a4)
                {
                  v53 = 0;
                  v24 = 0;
                  v35 = v87;
                  v45 = v80;
                  goto LABEL_75;
                }
                v54 = a4;
                v55 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v56 = v8;
                v57 = *MEMORY[0x1E0D025B8];
                v98 = *MEMORY[0x1E0CB2D50];
                v83 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("verticalUncertainty"));
                v99 = v83;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v99, &v98, 1);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v58 = v57;
                v8 = v56;
                v53 = 0;
                v24 = 0;
                *v54 = (id)objc_msgSend(v55, "initWithDomain:code:userInfo:", v58, 2, v18);
                v11 = v81;
                goto LABEL_73;
              }
              v79 = v17;
LABEL_24:
              objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("date"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v88 = self;
              v85 = v8;
              if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v83 = 0;
                goto LABEL_52;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v25 = (objc_class *)MEMORY[0x1E0C99D68];
                v26 = a4;
                v27 = v18;
                v28 = [v25 alloc];
                objc_msgSend(v27, "doubleValue");
                v30 = v29;

                a4 = v26;
                v31 = (id)objc_msgSend(v28, "initWithTimeIntervalSince1970:", v30);
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v59 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
                  objc_msgSend(v59, "dateFromString:", v18);
                  v83 = (void *)objc_claimAutoreleasedReturnValue();

                  goto LABEL_52;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (!a4)
                  {
                    v83 = 0;
                    v24 = 0;
                    v53 = v79;
                    v45 = v80;
                    goto LABEL_74;
                  }
                  v73 = a4;
                  v74 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v75 = *MEMORY[0x1E0D025B8];
                  v96 = *MEMORY[0x1E0CB2D50];
                  v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("date"));
                  v97 = v62;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1);
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  v83 = 0;
                  v24 = 0;
                  *v73 = (id)objc_msgSend(v74, "initWithDomain:code:userInfo:", v75, 2, v60);
                  goto LABEL_89;
                }
                v31 = v18;
              }
              v83 = v31;
LABEL_52:
              objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("referenceFrame"));
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              v61 = a4;
              if (!v60 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v62 = 0;
                goto LABEL_60;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v63 = v60;
LABEL_59:
                v62 = v63;
LABEL_60:
                objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("sourceAccuracy"));
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                if (v64)
                {
                  objc_opt_class();
                  v53 = v79;
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v65 = 0;
                  }
                  else
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v66 = v64;
                    }
                    else
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        if (v61)
                        {
                          v78 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v77 = *MEMORY[0x1E0D025B8];
                          v92 = *MEMORY[0x1E0CB2D50];
                          v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("sourceAccuracy"));
                          v93 = v71;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
                          v72 = (void *)objc_claimAutoreleasedReturnValue();
                          *v61 = (id)objc_msgSend(v78, "initWithDomain:code:userInfo:", v77, 2, v72);

                        }
                        v65 = 0;
                        v24 = 0;
                        goto LABEL_70;
                      }
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMLocationVisitLocationSourceAccuracyFromString(v64));
                      v66 = (id)objc_claimAutoreleasedReturnValue();
                    }
                    v65 = v66;
                  }
                }
                else
                {
                  v65 = 0;
                  v53 = v79;
                }
                v24 = -[BMLocationVisitLocation initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:sourceAccuracy:](v88, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:sourceAccuracy:", v85, v89, v87, v90, v53, v83, __PAIR64__(objc_msgSend(v65, "intValue"), objc_msgSend(v62, "intValue")));
                v88 = v24;
LABEL_70:
                v11 = v81;
LABEL_71:

LABEL_72:
                self = v88;
                v8 = v85;
LABEL_73:
                v45 = v80;
LABEL_74:

                v10 = v89;
                v35 = v87;
                goto LABEL_75;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMLocationVisitLocationReferenceFrameFromString(v60));
                v63 = (id)objc_claimAutoreleasedReturnValue();
                goto LABEL_59;
              }
              if (a4)
              {
                v68 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v69 = *MEMORY[0x1E0D025B8];
                v94 = *MEMORY[0x1E0CB2D50];
                v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("referenceFrame"));
                v95 = v65;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1);
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                v70 = (id)objc_msgSend(v68, "initWithDomain:code:userInfo:", v69, 2, v64);
                v62 = 0;
                v24 = 0;
                *v61 = v70;
                v11 = v81;
                v53 = v79;
                goto LABEL_71;
              }
              v62 = 0;
              v24 = 0;
LABEL_89:
              v11 = v81;
              v53 = v79;
              goto LABEL_72;
            }
            v79 = 0;
          }
          else
          {
            v79 = 0;
            v9 = v13;
          }
          self = v12;
          goto LABEL_24;
        }
        if (a4)
        {
          v84 = a4;
          v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v48 = *MEMORY[0x1E0D025B8];
          v100 = *MEMORY[0x1E0CB2D50];
          v86 = v8;
          v49 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("altitude"));
          v101 = v49;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v101, &v100, 1);
          v50 = objc_claimAutoreleasedReturnValue();
          v51 = v47;
          v45 = v15;
          v52 = v48;
          v10 = v89;
          v82 = (void *)v50;
          v90 = 0;
          v24 = 0;
          *v84 = (id)objc_msgSend(v51, "initWithDomain:code:userInfo:", v52, 2);
          v7 = v14;
          v9 = v13;
          self = v12;
          v53 = (void *)v49;
          v8 = v86;
          v35 = v87;
LABEL_75:

          goto LABEL_76;
        }
        v90 = 0;
        v24 = 0;
        v35 = v87;
        v45 = v15;
        v7 = v14;
        v9 = v13;
        self = v12;
LABEL_76:

        goto LABEL_77;
      }
      if (a4)
      {
        v37 = a4;
        v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v39 = *MEMORY[0x1E0D025B8];
        v102 = *MEMORY[0x1E0CB2D50];
        v40 = v8;
        v41 = objc_alloc(MEMORY[0x1E0CB3940]);
        v76 = objc_opt_class();
        v42 = v41;
        v8 = v40;
        v90 = (id)objc_msgSend(v42, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v76, CFSTR("horizontalUncertainty"));
        v103 = v90;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1);
        v43 = objc_claimAutoreleasedReturnValue();
        v44 = v38;
        v45 = (void *)v43;
        v46 = v39;
        v10 = v89;
        v35 = 0;
        v24 = 0;
        *v37 = (id)objc_msgSend(v44, "initWithDomain:code:userInfo:", v46, 2, v43);
        goto LABEL_76;
      }
      v35 = 0;
      v24 = 0;
LABEL_77:

      goto LABEL_78;
    }
    if (a4)
    {
      v32 = a4;
      v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v34 = *MEMORY[0x1E0D025B8];
      v104 = *MEMORY[0x1E0CB2D50];
      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("longitude"));
      v105 = v35;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v105, &v104, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v34, 2, v11);
      v10 = 0;
      v24 = 0;
      *v32 = v36;
      goto LABEL_77;
    }
    v10 = 0;
    v24 = 0;
LABEL_78:

    goto LABEL_79;
  }
  if (a4)
  {
    v19 = a4;
    v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v21 = *MEMORY[0x1E0D025B8];
    v106 = *MEMORY[0x1E0CB2D50];
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("latitude"));
    v107[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v107, &v106, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v21;
    v10 = (id)v22;
    v8 = 0;
    v24 = 0;
    *v19 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", v23, 2, v9);
    goto LABEL_78;
  }
  v8 = 0;
  v24 = 0;
LABEL_79:

  return v24;
}

- (id)jsonDictionary
{
  double v3;
  void *v4;
  uint64_t v5;
  double v6;
  void *v7;
  uint64_t v8;
  double v9;
  void *v10;
  uint64_t v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[8];
  _QWORD v42[10];

  v42[8] = *MEMORY[0x1E0C80C00];
  if (!-[BMLocationVisitLocation hasLatitude](self, "hasLatitude")
    || (-[BMLocationVisitLocation latitude](self, "latitude"), fabs(v3) == INFINITY))
  {
    v5 = 0;
  }
  else
  {
    -[BMLocationVisitLocation latitude](self, "latitude");
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMLocationVisitLocation latitude](self, "latitude");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  if (!-[BMLocationVisitLocation hasLongitude](self, "hasLongitude")
    || (-[BMLocationVisitLocation longitude](self, "longitude"), fabs(v6) == INFINITY))
  {
    v8 = 0;
  }
  else
  {
    -[BMLocationVisitLocation longitude](self, "longitude");
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[BMLocationVisitLocation longitude](self, "longitude");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  if (!-[BMLocationVisitLocation hasHorizontalUncertainty](self, "hasHorizontalUncertainty")
    || (-[BMLocationVisitLocation horizontalUncertainty](self, "horizontalUncertainty"), fabs(v9) == INFINITY))
  {
    v11 = 0;
  }
  else
  {
    -[BMLocationVisitLocation horizontalUncertainty](self, "horizontalUncertainty");
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[BMLocationVisitLocation horizontalUncertainty](self, "horizontalUncertainty");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  if (!-[BMLocationVisitLocation hasAltitude](self, "hasAltitude")
    || (-[BMLocationVisitLocation altitude](self, "altitude"), fabs(v12) == INFINITY))
  {
    v40 = 0;
  }
  else
  {
    -[BMLocationVisitLocation altitude](self, "altitude");
    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[BMLocationVisitLocation altitude](self, "altitude");
    objc_msgSend(v13, "numberWithDouble:");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!-[BMLocationVisitLocation hasVerticalUncertainty](self, "hasVerticalUncertainty")
    || (-[BMLocationVisitLocation verticalUncertainty](self, "verticalUncertainty"), fabs(v14) == INFINITY))
  {
    v39 = 0;
  }
  else
  {
    -[BMLocationVisitLocation verticalUncertainty](self, "verticalUncertainty");
    v15 = (void *)MEMORY[0x1E0CB37E8];
    -[BMLocationVisitLocation verticalUncertainty](self, "verticalUncertainty");
    objc_msgSend(v15, "numberWithDouble:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BMLocationVisitLocation date](self, "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0CB37E8];
    -[BMLocationVisitLocation date](self, "date");
    v18 = v11;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSince1970");
    objc_msgSend(v17, "numberWithDouble:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v18;
  }
  else
  {
    v20 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLocationVisitLocation referenceFrame](self, "referenceFrame"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMLocationVisitLocation sourceAccuracy](self, "sourceAccuracy"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = CFSTR("latitude");
  v23 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v36 = (void *)v23;
  v42[0] = v23;
  v41[1] = CFSTR("longitude");
  v24 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v35 = (void *)v24;
  v42[1] = v24;
  v41[2] = CFSTR("horizontalUncertainty");
  v25 = v11;
  v37 = (void *)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  v34 = (void *)v25;
  v42[2] = v25;
  v41[3] = CFSTR("altitude");
  v26 = v40;
  if (!v40)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38 = (void *)v5;
  v42[3] = v26;
  v41[4] = CFSTR("verticalUncertainty");
  v27 = v39;
  if (!v39)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v8;
  v42[4] = v27;
  v41[5] = CFSTR("date");
  v29 = v20;
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v42[5] = v29;
  v41[6] = CFSTR("referenceFrame");
  v30 = v21;
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v42[6] = v30;
  v41[7] = CFSTR("sourceAccuracy");
  v31 = v22;
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v42[7] = v31;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 8);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    if (v21)
      goto LABEL_42;
LABEL_52:

    if (v20)
      goto LABEL_43;
    goto LABEL_53;
  }

  if (!v21)
    goto LABEL_52;
LABEL_42:
  if (v20)
    goto LABEL_43;
LABEL_53:

LABEL_43:
  if (!v39)

  if (!v40)
  if (v37)
  {
    if (v28)
      goto LABEL_49;
LABEL_55:

    if (v38)
      goto LABEL_50;
LABEL_56:

    goto LABEL_50;
  }

  if (!v28)
    goto LABEL_55;
LABEL_49:
  if (!v38)
    goto LABEL_56;
LABEL_50:

  return v32;
}

- (NSDate)date
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_date)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_date);
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
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  BOOL v27;
  int v28;
  int v29;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMLocationVisitLocation hasLatitude](self, "hasLatitude") || objc_msgSend(v5, "hasLatitude"))
    {
      if (!-[BMLocationVisitLocation hasLatitude](self, "hasLatitude"))
        goto LABEL_34;
      if (!objc_msgSend(v5, "hasLatitude"))
        goto LABEL_34;
      -[BMLocationVisitLocation latitude](self, "latitude");
      v7 = v6;
      objc_msgSend(v5, "latitude");
      if (v7 != v8)
        goto LABEL_34;
    }
    if (-[BMLocationVisitLocation hasLongitude](self, "hasLongitude") || objc_msgSend(v5, "hasLongitude"))
    {
      if (!-[BMLocationVisitLocation hasLongitude](self, "hasLongitude"))
        goto LABEL_34;
      if (!objc_msgSend(v5, "hasLongitude"))
        goto LABEL_34;
      -[BMLocationVisitLocation longitude](self, "longitude");
      v10 = v9;
      objc_msgSend(v5, "longitude");
      if (v10 != v11)
        goto LABEL_34;
    }
    if (-[BMLocationVisitLocation hasHorizontalUncertainty](self, "hasHorizontalUncertainty")
      || objc_msgSend(v5, "hasHorizontalUncertainty"))
    {
      if (!-[BMLocationVisitLocation hasHorizontalUncertainty](self, "hasHorizontalUncertainty"))
        goto LABEL_34;
      if (!objc_msgSend(v5, "hasHorizontalUncertainty"))
        goto LABEL_34;
      -[BMLocationVisitLocation horizontalUncertainty](self, "horizontalUncertainty");
      v13 = v12;
      objc_msgSend(v5, "horizontalUncertainty");
      if (v13 != v14)
        goto LABEL_34;
    }
    if (-[BMLocationVisitLocation hasAltitude](self, "hasAltitude") || objc_msgSend(v5, "hasAltitude"))
    {
      if (!-[BMLocationVisitLocation hasAltitude](self, "hasAltitude"))
        goto LABEL_34;
      if (!objc_msgSend(v5, "hasAltitude"))
        goto LABEL_34;
      -[BMLocationVisitLocation altitude](self, "altitude");
      v16 = v15;
      objc_msgSend(v5, "altitude");
      if (v16 != v17)
        goto LABEL_34;
    }
    if (-[BMLocationVisitLocation hasVerticalUncertainty](self, "hasVerticalUncertainty")
      || objc_msgSend(v5, "hasVerticalUncertainty"))
    {
      if (!-[BMLocationVisitLocation hasVerticalUncertainty](self, "hasVerticalUncertainty"))
        goto LABEL_34;
      if (!objc_msgSend(v5, "hasVerticalUncertainty"))
        goto LABEL_34;
      -[BMLocationVisitLocation verticalUncertainty](self, "verticalUncertainty");
      v19 = v18;
      objc_msgSend(v5, "verticalUncertainty");
      if (v19 != v20)
        goto LABEL_34;
    }
    -[BMLocationVisitLocation date](self, "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "date");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v21 == (void *)v22)
    {

    }
    else
    {
      v23 = (void *)v22;
      -[BMLocationVisitLocation date](self, "date");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "date");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqual:", v25);

      if (!v26)
        goto LABEL_34;
    }
    v28 = -[BMLocationVisitLocation referenceFrame](self, "referenceFrame");
    if (v28 == objc_msgSend(v5, "referenceFrame"))
    {
      v29 = -[BMLocationVisitLocation sourceAccuracy](self, "sourceAccuracy");
      v27 = v29 == objc_msgSend(v5, "sourceAccuracy");
LABEL_35:

      goto LABEL_36;
    }
LABEL_34:
    v27 = 0;
    goto LABEL_35;
  }
  v27 = 0;
LABEL_36:

  return v27;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (double)latitude
{
  return self->_latitude;
}

- (BOOL)hasLatitude
{
  return self->_hasLatitude;
}

- (void)setHasLatitude:(BOOL)a3
{
  self->_hasLatitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (BOOL)hasLongitude
{
  return self->_hasLongitude;
}

- (void)setHasLongitude:(BOOL)a3
{
  self->_hasLongitude = a3;
}

- (double)horizontalUncertainty
{
  return self->_horizontalUncertainty;
}

- (BOOL)hasHorizontalUncertainty
{
  return self->_hasHorizontalUncertainty;
}

- (void)setHasHorizontalUncertainty:(BOOL)a3
{
  self->_hasHorizontalUncertainty = a3;
}

- (double)altitude
{
  return self->_altitude;
}

- (BOOL)hasAltitude
{
  return self->_hasAltitude;
}

- (void)setHasAltitude:(BOOL)a3
{
  self->_hasAltitude = a3;
}

- (double)verticalUncertainty
{
  return self->_verticalUncertainty;
}

- (BOOL)hasVerticalUncertainty
{
  return self->_hasVerticalUncertainty;
}

- (void)setHasVerticalUncertainty:(BOOL)a3
{
  self->_hasVerticalUncertainty = a3;
}

- (int)referenceFrame
{
  return self->_referenceFrame;
}

- (int)sourceAccuracy
{
  return self->_sourceAccuracy;
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

    v4 = -[BMLocationVisitLocation initByReadFrom:]([BMLocationVisitLocation alloc], "initByReadFrom:", v7);
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
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("latitude"), 1, 0, 1, 0, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("longitude"), 1, 0, 2, 0, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("horizontalUncertainty"), 1, 0, 3, 0, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("altitude"), 1, 0, 4, 0, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("verticalUncertainty"), 1, 0, 5, 0, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("date"), 3, 0, 6, 0, 2);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("referenceFrame"), 0, 0, 7, 4, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sourceAccuracy"), 0, 0, 8, 4, 0);
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
  return &unk_1E5F1E6E8;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("latitude"), 1, 0, 0);
  v12[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("longitude"), 2, 0, 0);
  v12[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("horizontalUncertainty"), 3, 0, 0);
  v12[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("altitude"), 4, 0, 0);
  v12[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("verticalUncertainty"), 5, 0, 0);
  v12[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("date"), 6, 0, 0);
  v12[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("referenceFrame"), 7, 4, 0);
  v12[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sourceAccuracy"), 8, 4, 0);
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
