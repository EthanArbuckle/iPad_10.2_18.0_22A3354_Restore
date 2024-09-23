@implementation BMInferredLocation

- (BMInferredLocation)initWithLatitude:(id)a3 longitude:(id)a4 altitude:(id)a5 horizontalUncertainity:(id)a6 verticalUncertainity:(id)a7 locationSourceAccuracy:(int)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  BMInferredLocation *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  objc_super v26;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v26.receiver = self;
  v26.super_class = (Class)BMInferredLocation;
  v19 = -[BMEventBase init](&v26, sel_init);
  if (v19)
  {
    v19->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v14)
    {
      v19->_hasLatitude = 1;
      objc_msgSend(v14, "doubleValue");
    }
    else
    {
      v19->_hasLatitude = 0;
      v20 = -1.0;
    }
    v19->_latitude = v20;
    if (v15)
    {
      v19->_hasLongitude = 1;
      objc_msgSend(v15, "doubleValue");
    }
    else
    {
      v19->_hasLongitude = 0;
      v21 = -1.0;
    }
    v19->_longitude = v21;
    if (v16)
    {
      v19->_hasAltitude = 1;
      objc_msgSend(v16, "doubleValue");
    }
    else
    {
      v19->_hasAltitude = 0;
      v22 = -1.0;
    }
    v19->_altitude = v22;
    if (v17)
    {
      v19->_hasHorizontalUncertainity = 1;
      objc_msgSend(v17, "doubleValue");
    }
    else
    {
      v19->_hasHorizontalUncertainity = 0;
      v23 = -1.0;
    }
    v19->_horizontalUncertainity = v23;
    if (v18)
    {
      v19->_hasVerticalUncertainity = 1;
      objc_msgSend(v18, "doubleValue");
    }
    else
    {
      v19->_hasVerticalUncertainity = 0;
      v24 = -1.0;
    }
    v19->_verticalUncertainity = v24;
    v19->_locationSourceAccuracy = a8;
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[BMInferredLocation latitude](self, "latitude");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[BMInferredLocation longitude](self, "longitude");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[BMInferredLocation altitude](self, "altitude");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[BMInferredLocation horizontalUncertainity](self, "horizontalUncertainity");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[BMInferredLocation verticalUncertainity](self, "verticalUncertainity");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  BMInferredLocationSourceAccuracyAsString(-[BMInferredLocation locationSourceAccuracy](self, "locationSourceAccuracy"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMInferredLocation with latitude: %@, longitude: %@, altitude: %@, horizontalUncertainity: %@, verticalUncertainity: %@, locationSourceAccuracy: %@"), v5, v7, v9, v11, v13, v14);

  return (NSString *)v15;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMInferredLocation *v5;
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
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t v38;
  BMInferredLocation *v39;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)BMInferredLocation;
  v5 = -[BMEventBase init](&v41, sel_init);
  if (!v5)
    goto LABEL_64;
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
          v38 = 32;
          goto LABEL_60;
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
          v38 = 40;
          goto LABEL_60;
        case 3u:
          v5->_hasAltitude = 1;
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
          v38 = 48;
          goto LABEL_60;
        case 4u:
          v5->_hasHorizontalUncertainity = 1;
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
          v38 = 56;
          goto LABEL_60;
        case 5u:
          v5->_hasVerticalUncertainity = 1;
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
          v38 = 64;
LABEL_60:
          *(Class *)((char *)&v5->super.super.isa + v38) = v22;
          continue;
        case 6u:
          v31 = 0;
          v32 = 0;
          v33 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_63;
          continue;
      }
      while (1)
      {
        v34 = *v6;
        v35 = *(_QWORD *)&v4[v34];
        v36 = v35 + 1;
        if (v35 == -1 || v36 > *(_QWORD *)&v4[*v7])
          break;
        v37 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v35);
        *(_QWORD *)&v4[v34] = v36;
        v33 |= (unint64_t)(v37 & 0x7F) << v31;
        if ((v37 & 0x80) == 0)
          goto LABEL_45;
        v31 += 7;
        v17 = v32++ >= 9;
        if (v17)
        {
          LODWORD(v33) = 0;
          goto LABEL_47;
        }
      }
      v4[*v8] = 1;
LABEL_45:
      if (v4[*v8])
        LODWORD(v33) = 0;
LABEL_47:
      if (v33 >= 3)
        LODWORD(v33) = 0;
      v5->_locationSourceAccuracy = v33;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_63:
    v39 = 0;
  else
LABEL_64:
    v39 = v5;

  return v39;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_hasLatitude)
    PBDataWriterWriteDoubleField();
  if (self->_hasLongitude)
    PBDataWriterWriteDoubleField();
  if (self->_hasAltitude)
    PBDataWriterWriteDoubleField();
  if (self->_hasHorizontalUncertainity)
    PBDataWriterWriteDoubleField();
  if (self->_hasVerticalUncertainity)
    PBDataWriterWriteDoubleField();
  PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMInferredLocation writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMInferredLocation)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id *v14;
  void *v15;
  void *v16;
  id v17;
  id *v18;
  uint64_t v19;
  void *v20;
  BMInferredLocation *v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id *v29;
  uint64_t v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  id *v36;
  void *v37;
  id v38;
  id *v39;
  id v40;
  uint64_t v41;
  id v42;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  id *v55;
  BMInferredLocation *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  id *v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  _QWORD v68[3];

  v68[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("latitude"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("longitude"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v20 = 0;
          v21 = 0;
          goto LABEL_49;
        }
        v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v55 = a4;
        v24 = *MEMORY[0x1E0D025B8];
        v65 = *MEMORY[0x1E0CB2D50];
        v25 = v8;
        v26 = objc_alloc(MEMORY[0x1E0CB3940]);
        v46 = objc_opt_class();
        v27 = v26;
        v8 = v25;
        v11 = (id)objc_msgSend(v27, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v46, CFSTR("longitude"));
        v66 = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0;
        v21 = 0;
        *v55 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v24, 2, v10);
        goto LABEL_48;
      }
      v54 = v9;
    }
    else
    {
      v54 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("altitude"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v11 = 0;
          v21 = 0;
          v20 = v54;
          goto LABEL_48;
        }
        v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v29 = a4;
        v30 = *MEMORY[0x1E0D025B8];
        v63 = *MEMORY[0x1E0CB2D50];
        v31 = v8;
        v32 = objc_alloc(MEMORY[0x1E0CB3940]);
        v47 = objc_opt_class();
        v33 = v32;
        v8 = v31;
        v53 = (id)objc_msgSend(v33, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v47, CFSTR("altitude"));
        v64 = v53;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0;
        *v29 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v30, 2, v12);
        v11 = 0;
LABEL_47:
        v20 = v54;

        self = v56;
LABEL_48:

        v7 = v52;
        goto LABEL_49;
      }
      v11 = v10;
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("horizontalUncertainity"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v8;
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v53 = 0;
          v21 = 0;
          goto LABEL_47;
        }
        v34 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v35 = *MEMORY[0x1E0D025B8];
        v61 = *MEMORY[0x1E0CB2D50];
        v36 = a4;
        a4 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("horizontalUncertainity"));
        v62 = a4;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v34;
        v8 = v51;
        v38 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", v35, 2, v13);
        v53 = 0;
        v21 = 0;
        *v36 = v38;
        goto LABEL_46;
      }
      v53 = v12;
    }
    else
    {
      v53 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("verticalUncertainity"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v11;
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v21 = 0;
          goto LABEL_46;
        }
        v39 = a4;
        v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v41 = *MEMORY[0x1E0D025B8];
        v59 = *MEMORY[0x1E0CB2D50];
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("verticalUncertainity"));
        v60 = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = (id)objc_msgSend(v40, "initWithDomain:code:userInfo:", v41, 2, v15);
        a4 = 0;
        v21 = 0;
        *v39 = v42;
        goto LABEL_58;
      }
      v14 = a4;
      a4 = v13;
    }
    else
    {
      v14 = a4;
      a4 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("locationSourceAccuracy"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v16 = 0;
LABEL_44:
      v11 = v50;
      v21 = -[BMInferredLocation initWithLatitude:longitude:altitude:horizontalUncertainity:verticalUncertainity:locationSourceAccuracy:](v56, "initWithLatitude:longitude:altitude:horizontalUncertainity:verticalUncertainity:locationSourceAccuracy:", v51, v54, v50, v53, a4, objc_msgSend(v16, "intValue"));
      v56 = v21;
LABEL_45:

      v8 = v51;
LABEL_46:

      goto LABEL_47;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = v15;
LABEL_43:
      v16 = v22;
      goto LABEL_44;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMInferredLocationSourceAccuracyFromString(v15));
      v22 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_43;
    }
    if (v14)
    {
      v49 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v48 = *MEMORY[0x1E0D025B8];
      v57 = *MEMORY[0x1E0CB2D50];
      v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("locationSourceAccuracy"));
      v58 = v44;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *v14 = (id)objc_msgSend(v49, "initWithDomain:code:userInfo:", v48, 2, v45);

    }
    v16 = 0;
    v21 = 0;
LABEL_58:
    v11 = v50;
    goto LABEL_45;
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
    v21 = 0;
    goto LABEL_50;
  }
  v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v18 = a4;
  v19 = *MEMORY[0x1E0D025B8];
  v67 = *MEMORY[0x1E0CB2D50];
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("latitude"));
  v68[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, &v67, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v21 = 0;
  *v18 = (id)objc_msgSend(v17, "initWithDomain:code:userInfo:", v19, 2, v9);
LABEL_49:

LABEL_50:
  return v21;
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
  void *v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[6];
  _QWORD v32[7];

  v32[6] = *MEMORY[0x1E0C80C00];
  if (!-[BMInferredLocation hasLatitude](self, "hasLatitude")
    || (-[BMInferredLocation latitude](self, "latitude"), fabs(v3) == INFINITY))
  {
    v5 = 0;
  }
  else
  {
    -[BMInferredLocation latitude](self, "latitude");
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMInferredLocation latitude](self, "latitude");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  if (!-[BMInferredLocation hasLongitude](self, "hasLongitude")
    || (-[BMInferredLocation longitude](self, "longitude"), fabs(v6) == INFINITY))
  {
    v8 = 0;
  }
  else
  {
    -[BMInferredLocation longitude](self, "longitude");
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[BMInferredLocation longitude](self, "longitude");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  if (!-[BMInferredLocation hasAltitude](self, "hasAltitude")
    || (-[BMInferredLocation altitude](self, "altitude"), fabs(v9) == INFINITY))
  {
    v11 = 0;
  }
  else
  {
    -[BMInferredLocation altitude](self, "altitude");
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[BMInferredLocation altitude](self, "altitude");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!-[BMInferredLocation hasHorizontalUncertainity](self, "hasHorizontalUncertainity")
    || (-[BMInferredLocation horizontalUncertainity](self, "horizontalUncertainity"), fabs(v12) == INFINITY))
  {
    v14 = 0;
  }
  else
  {
    -[BMInferredLocation horizontalUncertainity](self, "horizontalUncertainity");
    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[BMInferredLocation horizontalUncertainity](self, "horizontalUncertainity");
    objc_msgSend(v13, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!-[BMInferredLocation hasVerticalUncertainity](self, "hasVerticalUncertainity")
    || (-[BMInferredLocation verticalUncertainity](self, "verticalUncertainity"), fabs(v15) == INFINITY))
  {
    v17 = 0;
  }
  else
  {
    -[BMInferredLocation verticalUncertainity](self, "verticalUncertainity");
    v16 = (void *)MEMORY[0x1E0CB37E8];
    -[BMInferredLocation verticalUncertainity](self, "verticalUncertainity");
    objc_msgSend(v16, "numberWithDouble:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMInferredLocation locationSourceAccuracy](self, "locationSourceAccuracy"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)v5;
  v31[0] = CFSTR("latitude");
  v19 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v27 = v19;
  v29 = (void *)v8;
  v32[0] = v19;
  v31[1] = CFSTR("longitude");
  v20 = (void *)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32[1] = v20;
  v31[2] = CFSTR("altitude");
  v21 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32[2] = v21;
  v31[3] = CFSTR("horizontalUncertainity");
  v22 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32[3] = v22;
  v31[4] = CFSTR("verticalUncertainity");
  v23 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32[4] = v23;
  v31[5] = CFSTR("locationSourceAccuracy");
  v24 = v18;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32[5] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 6, v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if (v17)
      goto LABEL_35;
  }
  else
  {

    if (v17)
    {
LABEL_35:
      if (v14)
        goto LABEL_36;
LABEL_44:

      if (v11)
        goto LABEL_37;
      goto LABEL_45;
    }
  }

  if (!v14)
    goto LABEL_44;
LABEL_36:
  if (v11)
    goto LABEL_37;
LABEL_45:

LABEL_37:
  if (!v29)

  if (!v30)
  return v25;
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
  int v21;
  BOOL v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMInferredLocation hasLatitude](self, "hasLatitude") || objc_msgSend(v5, "hasLatitude"))
    {
      if (!-[BMInferredLocation hasLatitude](self, "hasLatitude"))
        goto LABEL_29;
      if (!objc_msgSend(v5, "hasLatitude"))
        goto LABEL_29;
      -[BMInferredLocation latitude](self, "latitude");
      v7 = v6;
      objc_msgSend(v5, "latitude");
      if (v7 != v8)
        goto LABEL_29;
    }
    if (-[BMInferredLocation hasLongitude](self, "hasLongitude") || objc_msgSend(v5, "hasLongitude"))
    {
      if (!-[BMInferredLocation hasLongitude](self, "hasLongitude"))
        goto LABEL_29;
      if (!objc_msgSend(v5, "hasLongitude"))
        goto LABEL_29;
      -[BMInferredLocation longitude](self, "longitude");
      v10 = v9;
      objc_msgSend(v5, "longitude");
      if (v10 != v11)
        goto LABEL_29;
    }
    if (-[BMInferredLocation hasAltitude](self, "hasAltitude") || objc_msgSend(v5, "hasAltitude"))
    {
      if (!-[BMInferredLocation hasAltitude](self, "hasAltitude"))
        goto LABEL_29;
      if (!objc_msgSend(v5, "hasAltitude"))
        goto LABEL_29;
      -[BMInferredLocation altitude](self, "altitude");
      v13 = v12;
      objc_msgSend(v5, "altitude");
      if (v13 != v14)
        goto LABEL_29;
    }
    if ((!-[BMInferredLocation hasHorizontalUncertainity](self, "hasHorizontalUncertainity")
       && !objc_msgSend(v5, "hasHorizontalUncertainity")
       || -[BMInferredLocation hasHorizontalUncertainity](self, "hasHorizontalUncertainity")
       && objc_msgSend(v5, "hasHorizontalUncertainity")
       && (-[BMInferredLocation horizontalUncertainity](self, "horizontalUncertainity"),
           v16 = v15,
           objc_msgSend(v5, "horizontalUncertainity"),
           v16 == v17))
      && (!-[BMInferredLocation hasVerticalUncertainity](self, "hasVerticalUncertainity")
       && !objc_msgSend(v5, "hasVerticalUncertainity")
       || -[BMInferredLocation hasVerticalUncertainity](self, "hasVerticalUncertainity")
       && objc_msgSend(v5, "hasVerticalUncertainity")
       && (-[BMInferredLocation verticalUncertainity](self, "verticalUncertainity"),
           v19 = v18,
           objc_msgSend(v5, "verticalUncertainity"),
           v19 == v20)))
    {
      v21 = -[BMInferredLocation locationSourceAccuracy](self, "locationSourceAccuracy");
      v22 = v21 == objc_msgSend(v5, "locationSourceAccuracy");
    }
    else
    {
LABEL_29:
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
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

- (double)horizontalUncertainity
{
  return self->_horizontalUncertainity;
}

- (BOOL)hasHorizontalUncertainity
{
  return self->_hasHorizontalUncertainity;
}

- (void)setHasHorizontalUncertainity:(BOOL)a3
{
  self->_hasHorizontalUncertainity = a3;
}

- (double)verticalUncertainity
{
  return self->_verticalUncertainity;
}

- (BOOL)hasVerticalUncertainity
{
  return self->_hasVerticalUncertainity;
}

- (void)setHasVerticalUncertainity:(BOOL)a3
{
  self->_hasVerticalUncertainity = a3;
}

- (int)locationSourceAccuracy
{
  return self->_locationSourceAccuracy;
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

    v4 = -[BMInferredLocation initByReadFrom:]([BMInferredLocation alloc], "initByReadFrom:", v7);
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
  void *v7;
  void *v8;
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("latitude"), 1, 0, 1, 0, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("longitude"), 1, 0, 2, 0, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("altitude"), 1, 0, 3, 0, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("horizontalUncertainity"), 1, 0, 4, 0, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("verticalUncertainity"), 1, 0, 5, 0, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("locationSourceAccuracy"), 0, 0, 6, 4, 0);
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
  return &unk_1E5F1B4F0;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("latitude"), 1, 0, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("longitude"), 2, 0, 0);
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("altitude"), 3, 0, 0);
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("horizontalUncertainity"), 4, 0, 0);
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("verticalUncertainity"), 5, 0, 0);
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("locationSourceAccuracy"), 6, 4, 0);
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
