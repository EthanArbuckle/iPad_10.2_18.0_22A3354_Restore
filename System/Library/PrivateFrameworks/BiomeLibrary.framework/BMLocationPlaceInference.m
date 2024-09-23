@implementation BMLocationPlaceInference

- (BMLocationPlaceInference)initWithDetectionDate:(id)a3 location:(id)a4 learnedPlace:(id)a5 stats:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BMLocationPlaceInference *v14;
  double v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BMLocationPlaceInference;
  v14 = -[BMEventBase init](&v17, sel_init);
  if (v14)
  {
    v14->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v10)
    {
      v14->_hasRaw_detectionDate = 1;
      objc_msgSend(v10, "timeIntervalSince1970");
    }
    else
    {
      v14->_hasRaw_detectionDate = 0;
      v15 = -1.0;
    }
    v14->_raw_detectionDate = v15;
    objc_storeStrong((id *)&v14->_location, a4);
    objc_storeStrong((id *)&v14->_learnedPlace, a5);
    objc_storeStrong((id *)&v14->_stats, a6);
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
  -[BMLocationPlaceInference detectionDate](self, "detectionDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLocationPlaceInference location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLocationPlaceInference learnedPlace](self, "learnedPlace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMLocationPlaceInference stats](self, "stats");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMLocationPlaceInference with detectionDate: %@, location: %@, learnedPlace: %@, stats: %@"), v4, v5, v6, v7);

  return (NSString *)v8;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMLocationPlaceInference *v5;
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
  int v18;
  uint64_t v20;
  unint64_t v21;
  double v22;
  objc_class *v23;
  uint64_t v24;
  void *v25;
  BMLocationPlaceInference *v26;
  objc_super v28;
  uint64_t v29;
  uint64_t v30;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)BMLocationPlaceInference;
  v5 = -[BMEventBase init](&v28, sel_init);
  if (!v5)
    goto LABEL_40;
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
        if (v11++ >= 9)
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
            v22 = *(double *)(*(_QWORD *)&v4[*v9] + v21);
            *(_QWORD *)&v4[v20] = v21 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v22 = 0.0;
          }
          v5->_raw_detectionDate = v22;
          break;
        case 2u:
          v29 = 0;
          v30 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_39;
          v23 = -[BMInferredLocation initByReadFrom:]([BMInferredLocation alloc], "initByReadFrom:", v4);
          if (!v23)
            goto LABEL_39;
          v24 = 40;
          goto LABEL_34;
        case 3u:
          v29 = 0;
          v30 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_39;
          v23 = -[BMLearnedPlace initByReadFrom:]([BMLearnedPlace alloc], "initByReadFrom:", v4);
          if (!v23)
            goto LABEL_39;
          v24 = 48;
          goto LABEL_34;
        case 4u:
          v29 = 0;
          v30 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_39;
          v23 = -[BMLocationPlaceInferenceStats initByReadFrom:]([BMLocationPlaceInferenceStats alloc], "initByReadFrom:", v4);
          if (!v23)
            goto LABEL_39;
          v24 = 56;
LABEL_34:
          v25 = *(Class *)((char *)&v5->super.super.isa + v24);
          *(Class *)((char *)&v5->super.super.isa + v24) = v23;

          PBReaderRecallMark();
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_39;
          break;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_39:
    v26 = 0;
  else
LABEL_40:
    v26 = v5;

  return v26;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_hasRaw_detectionDate)
    PBDataWriterWriteDoubleField();
  if (self->_location)
  {
    PBDataWriterPlaceMark();
    -[BMInferredLocation writeTo:](self->_location, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_learnedPlace)
  {
    PBDataWriterPlaceMark();
    -[BMLearnedPlace writeTo:](self->_learnedPlace, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_stats)
  {
    PBDataWriterPlaceMark();
    -[BMLocationPlaceInferenceStats writeTo:](self->_stats, "writeTo:", v4);
    PBDataWriterRecallMark();
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMLocationPlaceInference writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMLocationPlaceInference)initWithJSONDictionary:(id)a3 error:(id *)a4
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
  void *v16;
  BMLearnedPlace *v17;
  id v18;
  void *v19;
  BMLocationPlaceInferenceStats *v20;
  BMLocationPlaceInference *v21;
  BMLocationPlaceInference *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  id v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  id v47;
  id *v48;
  id *v49;
  id *v50;
  BMInferredLocation *v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  BMLocationPlaceInferenceStats *v57;
  uint64_t v58;
  BMLearnedPlace *v59;
  uint64_t v60;
  BMInferredLocation *v61;
  uint64_t v62;
  _QWORD v63[3];

  v63[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("detectionDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (objc_class *)MEMORY[0x1E0C99D68];
      v9 = v6;
      v10 = [v8 alloc];
      objc_msgSend(v9, "doubleValue");
      v12 = v11;

      v13 = (id)objc_msgSend(v10, "initWithTimeIntervalSince1970:", v12);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
        objc_msgSend(v14, "dateFromString:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v7 = 0;
          v22 = 0;
          v21 = self;
          goto LABEL_46;
        }
        v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v44 = *MEMORY[0x1E0D025B8];
        v62 = *MEMORY[0x1E0CB2D50];
        v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("detectionDate"));
        v63[0] = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, &v62, 1);
        v52 = (BMInferredLocation *)objc_claimAutoreleasedReturnValue();
        v45 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v44, 2);
        v7 = 0;
        v22 = 0;
        *a4 = v45;
LABEL_56:
        v21 = self;
        goto LABEL_44;
      }
      v13 = v6;
    }
    v7 = v13;
  }
  else
  {
    v7 = 0;
  }
LABEL_9:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("location"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v52 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a4)
    {
      v22 = 0;
      v21 = self;
      goto LABEL_45;
    }
    v31 = v7;
    v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v33 = *MEMORY[0x1E0D025B8];
    v60 = *MEMORY[0x1E0CB2D50];
    v52 = (BMInferredLocation *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("location"));
    v61 = v52;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v32;
    v7 = v31;
    *a4 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v33, 2, v34);

    v22 = 0;
    v23 = v15;
    goto LABEL_56;
  }
  v23 = v15;
  v55 = 0;
  v52 = -[BMInferredLocation initWithJSONDictionary:error:]([BMInferredLocation alloc], "initWithJSONDictionary:error:", v23, &v55);
  v24 = v55;
  if (v24)
  {
    v25 = v24;
    v21 = self;
    if (a4)
      *a4 = objc_retainAutorelease(v24);

    v22 = 0;
    goto LABEL_44;
  }

LABEL_12:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("learnedPlace"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v17 = 0;
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = v16;
    v54 = 0;
    v17 = -[BMLearnedPlace initWithJSONDictionary:error:]([BMLearnedPlace alloc], "initWithJSONDictionary:error:", v18, &v54);
    v26 = v54;
    if (v26)
    {
      v27 = v26;
      if (a4)
        *a4 = objc_retainAutorelease(v26);

      goto LABEL_47;
    }

LABEL_15:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("stats"));
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v19 = v7;
      v20 = 0;
LABEL_18:
      v21 = -[BMLocationPlaceInference initWithDetectionDate:location:learnedPlace:stats:](self, "initWithDetectionDate:location:learnedPlace:stats:", v19, v52, v17, v20);
      v22 = v21;
LABEL_41:

      v7 = v19;
      goto LABEL_42;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v48 = a4;
      v19 = v7;
      v28 = v18;
      v53 = 0;
      v20 = -[BMLocationPlaceInferenceStats initWithJSONDictionary:error:]([BMLocationPlaceInferenceStats alloc], "initWithJSONDictionary:error:", v28, &v53);
      v29 = v53;
      if (!v29)
      {

        goto LABEL_18;
      }
      v30 = v29;
      if (v48)
        *v48 = objc_retainAutorelease(v29);

LABEL_40:
      v22 = 0;
      v21 = self;
      goto LABEL_41;
    }
    if (a4)
    {
      v50 = a4;
      v19 = v7;
      v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v46 = *MEMORY[0x1E0D025B8];
      v56 = *MEMORY[0x1E0CB2D50];
      v20 = (BMLocationPlaceInferenceStats *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("stats"));
      v57 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *v50 = (id)objc_msgSend(v47, "initWithDomain:code:userInfo:", v46, 2, v41);

      goto LABEL_40;
    }
LABEL_47:
    v22 = 0;
    v21 = self;
    goto LABEL_42;
  }
  if (!a4)
  {
    v22 = 0;
    v21 = self;
    goto LABEL_43;
  }
  v49 = a4;
  v36 = v7;
  v37 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v38 = *MEMORY[0x1E0D025B8];
  v58 = *MEMORY[0x1E0CB2D50];
  v17 = (BMLearnedPlace *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("learnedPlace"));
  v59 = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v39 = v37;
  v7 = v36;
  v40 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v38, 2, v18);
  v22 = 0;
  v21 = self;
  *v49 = v40;
LABEL_42:

LABEL_43:
  v23 = v15;
LABEL_44:

  v15 = v23;
LABEL_45:

LABEL_46:
  return v22;
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  -[BMLocationPlaceInference detectionDate](self, "detectionDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMLocationPlaceInference detectionDate](self, "detectionDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSince1970");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  -[BMLocationPlaceInference location](self, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "jsonDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMLocationPlaceInference learnedPlace](self, "learnedPlace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "jsonDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMLocationPlaceInference stats](self, "stats");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "jsonDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = CFSTR("detectionDate");
  v13 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[0] = v13;
  v19[1] = CFSTR("location");
  v14 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[1] = v14;
  v19[2] = CFSTR("learnedPlace");
  v15 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[2] = v15;
  v19[3] = CFSTR("stats");
  v16 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (v10)
      goto LABEL_14;
  }
  else
  {

    if (v10)
    {
LABEL_14:
      if (v8)
        goto LABEL_15;
LABEL_19:

      if (v6)
        goto LABEL_16;
LABEL_20:

      goto LABEL_16;
    }
  }

  if (!v8)
    goto LABEL_19;
LABEL_15:
  if (!v6)
    goto LABEL_20;
LABEL_16:

  return v17;
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
  void *v26;
  void *v27;
  void *v28;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMLocationPlaceInference detectionDate](self, "detectionDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "detectionDate");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMLocationPlaceInference detectionDate](self, "detectionDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "detectionDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_13;
    }
    -[BMLocationPlaceInference location](self, "location");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "location");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMLocationPlaceInference location](self, "location");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "location");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_13;
    }
    -[BMLocationPlaceInference learnedPlace](self, "learnedPlace");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "learnedPlace");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMLocationPlaceInference learnedPlace](self, "learnedPlace");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "learnedPlace");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
      {
LABEL_13:
        v12 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    -[BMLocationPlaceInference stats](self, "stats");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stats");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25 == v26)
    {
      v12 = 1;
    }
    else
    {
      -[BMLocationPlaceInference stats](self, "stats");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stats");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v27, "isEqual:", v28);

    }
    goto LABEL_19;
  }
  v12 = 0;
LABEL_20:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BMInferredLocation)location
{
  return self->_location;
}

- (BMLearnedPlace)learnedPlace
{
  return self->_learnedPlace;
}

- (BMLocationPlaceInferenceStats)stats
{
  return self->_stats;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_learnedPlace, 0);
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

    v4 = -[BMLocationPlaceInference initByReadFrom:]([BMLocationPlaceInference alloc], "initByReadFrom:", v7);
    v4[8] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("detectionDate"), 3, 0, 1, 0, 2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("location_json"), 5, 1, &__block_literal_global_313);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("learnedPlace_json"), 5, 1, &__block_literal_global_314);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("stats_json"), 5, 1, &__block_literal_global_315);
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
  return &unk_1E5F1B520;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("detectionDate"), 1, 0, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("location"), 2, 14, objc_opt_class());
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("learnedPlace"), 3, 14, objc_opt_class());
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("stats"), 4, 14, objc_opt_class());
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __35__BMLocationPlaceInference_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __35__BMLocationPlaceInference_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "learnedPlace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __35__BMLocationPlaceInference_columns__block_invoke(uint64_t a1, void *a2)
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
