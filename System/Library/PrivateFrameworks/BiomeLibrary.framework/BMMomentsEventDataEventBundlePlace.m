@implementation BMMomentsEventDataEventBundlePlace

- (BMMomentsEventDataEventBundlePlace)initWithPlaceInferencePlaceType:(int)a3 placeInferenceUserSpecificPlaceType:(int)a4 geoPOICategoryType:(int)a5 placeNameConfidence:(id)a6 familiarityIndexLOI:(id)a7 distanceToHomeInMiles:(id)a8
{
  id v14;
  id v15;
  id v16;
  BMMomentsEventDataEventBundlePlace *v17;
  double v18;
  double v19;
  double v20;
  objc_super v22;

  v14 = a6;
  v15 = a7;
  v16 = a8;
  v22.receiver = self;
  v22.super_class = (Class)BMMomentsEventDataEventBundlePlace;
  v17 = -[BMEventBase init](&v22, sel_init);
  if (v17)
  {
    v17->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v17->_placeInferencePlaceType = a3;
    v17->_placeInferenceUserSpecificPlaceType = a4;
    v17->_geoPOICategoryType = a5;
    if (v14)
    {
      v17->_hasPlaceNameConfidence = 1;
      objc_msgSend(v14, "doubleValue");
    }
    else
    {
      v17->_hasPlaceNameConfidence = 0;
      v18 = -1.0;
    }
    v17->_placeNameConfidence = v18;
    if (v15)
    {
      v17->_hasFamiliarityIndexLOI = 1;
      objc_msgSend(v15, "doubleValue");
    }
    else
    {
      v17->_hasFamiliarityIndexLOI = 0;
      v19 = -1.0;
    }
    v17->_familiarityIndexLOI = v19;
    if (v16)
    {
      v17->_hasDistanceToHomeInMiles = 1;
      objc_msgSend(v16, "doubleValue");
    }
    else
    {
      v17->_hasDistanceToHomeInMiles = 0;
      v20 = -1.0;
    }
    v17->_distanceToHomeInMiles = v20;
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  BMMomentsEventDataPlaceInferencePlaceTypeAsString(-[BMMomentsEventDataEventBundlePlace placeInferencePlaceType](self, "placeInferencePlaceType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataPlaceInferenceUserSpecificPlaceTypeAsString(-[BMMomentsEventDataEventBundlePlace placeInferenceUserSpecificPlaceType](self, "placeInferenceUserSpecificPlaceType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMMomentsEventDataGeoPOICategoryTypeAsString(-[BMMomentsEventDataEventBundlePlace geoPOICategoryType](self, "geoPOICategoryType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEventBundlePlace placeNameConfidence](self, "placeNameConfidence");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEventBundlePlace familiarityIndexLOI](self, "familiarityIndexLOI");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[BMMomentsEventDataEventBundlePlace distanceToHomeInMiles](self, "distanceToHomeInMiles");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMomentsEventDataEventBundlePlace with placeInferencePlaceType: %@, placeInferenceUserSpecificPlaceType: %@, geoPOICategoryType: %@, placeNameConfidence: %@, familiarityIndexLOI: %@, distanceToHomeInMiles: %@"), v4, v5, v6, v8, v10, v12);

  return (NSString *)v13;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMomentsEventDataEventBundlePlace *v5;
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
  uint64_t v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  uint64_t v43;
  unint64_t v44;
  objc_class *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  BMMomentsEventDataEventBundlePlace *v53;
  objc_super v55;

  v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)BMMomentsEventDataEventBundlePlace;
  v5 = -[BMEventBase init](&v55, sel_init);
  if (!v5)
    goto LABEL_79;
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
              goto LABEL_53;
            v20 += 7;
            v17 = v21++ >= 9;
            if (v17)
            {
              v27 = 0;
              goto LABEL_56;
            }
          }
          v4[*v8] = 1;
LABEL_53:
          if (v4[*v8])
            v27 = 0;
          else
            v27 = v22;
LABEL_56:
          v50 = BMMomentsEventDataPlaceInferencePlaceTypeDecode(v27);
          v51 = 24;
          goto LABEL_62;
        case 2u:
          v28 = 0;
          v29 = 0;
          v30 = 0;
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
              v30 |= (unint64_t)(v34 & 0x7F) << v28;
              if (v34 < 0)
              {
                v28 += 7;
                v17 = v29++ >= 9;
                if (v17)
                {
                  v35 = 0;
                  goto LABEL_61;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v35 = 0;
          else
            v35 = v30;
LABEL_61:
          v50 = BMMomentsEventDataPlaceInferenceUserSpecificPlaceTypeDecode(v35);
          v51 = 28;
LABEL_62:
          *(_DWORD *)((char *)&v5->super.super.isa + v51) = v50;
          continue;
        case 3u:
          v36 = 0;
          v37 = 0;
          v38 = 0;
          break;
        case 4u:
          v5->_hasPlaceNameConfidence = 1;
          v43 = *v6;
          v44 = *(_QWORD *)&v4[v43];
          if (v44 <= 0xFFFFFFFFFFFFFFF7 && v44 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v45 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v44);
            *(_QWORD *)&v4[v43] = v44 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v45 = 0;
          }
          v52 = 40;
          goto LABEL_75;
        case 5u:
          v5->_hasFamiliarityIndexLOI = 1;
          v46 = *v6;
          v47 = *(_QWORD *)&v4[v46];
          if (v47 <= 0xFFFFFFFFFFFFFFF7 && v47 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v45 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v47);
            *(_QWORD *)&v4[v46] = v47 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v45 = 0;
          }
          v52 = 48;
          goto LABEL_75;
        case 6u:
          v5->_hasDistanceToHomeInMiles = 1;
          v48 = *v6;
          v49 = *(_QWORD *)&v4[v48];
          if (v49 <= 0xFFFFFFFFFFFFFFF7 && v49 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v45 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v49);
            *(_QWORD *)&v4[v48] = v49 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v45 = 0;
          }
          v52 = 56;
LABEL_75:
          *(Class *)((char *)&v5->super.super.isa + v52) = v45;
          continue;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_78;
          continue;
      }
      while (1)
      {
        v39 = *v6;
        v40 = *(_QWORD *)&v4[v39];
        v41 = v40 + 1;
        if (v40 == -1 || v41 > *(_QWORD *)&v4[*v7])
          break;
        v42 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v40);
        *(_QWORD *)&v4[v39] = v41;
        v38 |= (unint64_t)(v42 & 0x7F) << v36;
        if ((v42 & 0x80) == 0)
          goto LABEL_64;
        v36 += 7;
        v17 = v37++ >= 9;
        if (v17)
        {
          LODWORD(v38) = 0;
          goto LABEL_66;
        }
      }
      v4[*v8] = 1;
LABEL_64:
      if (v4[*v8])
        LODWORD(v38) = 0;
LABEL_66:
      if (v38 >= 0x4E)
        LODWORD(v38) = 0;
      v5->_geoPOICategoryType = v38;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_78:
    v53 = 0;
  else
LABEL_79:
    v53 = v5;

  return v53;
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasPlaceNameConfidence)
    PBDataWriterWriteDoubleField();
  if (self->_hasFamiliarityIndexLOI)
    PBDataWriterWriteDoubleField();
  v4 = v5;
  if (self->_hasDistanceToHomeInMiles)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMomentsEventDataEventBundlePlace writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMomentsEventDataEventBundlePlace)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  BMMomentsEventDataEventBundlePlace *v19;
  BMMomentsEventDataEventBundlePlace *v20;
  id v21;
  void *v22;
  uint64_t v23;
  id *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  id v32;
  id *v33;
  uint64_t v34;
  id v35;
  id *v36;
  uint64_t v37;
  id v38;
  id *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v47;
  id v48;
  id v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  _QWORD v61[3];

  v61[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("placeInferencePlaceType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v6;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v47 = 0;
          v20 = 0;
          v19 = self;
          goto LABEL_53;
        }
        v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v33 = a4;
        v34 = *MEMORY[0x1E0D025B8];
        v60 = *MEMORY[0x1E0CB2D50];
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("placeInferencePlaceType"));
        v61[0] = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, &v60, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 0;
        v20 = 0;
        *v33 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v34, 2, v9);
        goto LABEL_64;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataPlaceInferencePlaceTypeFromString(v6));
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v8;
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("placeInferenceUserSpecificPlaceType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v7;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v9;
LABEL_16:
        v10 = v11;
        goto LABEL_17;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataPlaceInferenceUserSpecificPlaceTypeFromString(v9));
        v11 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      if (a4)
      {
        v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v36 = a4;
        v37 = *MEMORY[0x1E0D025B8];
        v58 = *MEMORY[0x1E0CB2D50];
        v49 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("placeInferenceUserSpecificPlaceType"));
        v59 = v49;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 0;
        v20 = 0;
        *v36 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v37, 2, v12);
        v19 = self;
        goto LABEL_51;
      }
      v10 = 0;
      v20 = 0;
LABEL_64:
      v19 = self;
      goto LABEL_52;
    }
  }
  v10 = 0;
LABEL_17:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("geoPOICategoryType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v10;
  v45 = v9;
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v49 = v12;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v49 = 0;
          v20 = 0;
          v19 = self;
          goto LABEL_51;
        }
        v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v39 = a4;
        v40 = *MEMORY[0x1E0D025B8];
        v56 = *MEMORY[0x1E0CB2D50];
        v48 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("geoPOICategoryType"));
        v57 = v48;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = 0;
        v20 = 0;
        *v39 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v40, 2, v13);
        v19 = self;
        goto LABEL_50;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMomentsEventDataGeoPOICategoryTypeFromString(v12));
      v49 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v49 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("placeNameConfidence"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v6;
  if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v14 = a4;
    v48 = 0;
LABEL_23:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("familiarityIndexLOI"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v14)
        {
          v16 = 0;
          v20 = 0;
          v19 = self;
          v10 = v44;
          goto LABEL_49;
        }
        v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v27 = *MEMORY[0x1E0D025B8];
        v52 = *MEMORY[0x1E0CB2D50];
        v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("familiarityIndexLOI"));
        v53 = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v27, 2, v17);
        v20 = 0;
        v16 = 0;
        *v14 = v28;
        v19 = self;
        goto LABEL_47;
      }
      v16 = v15;
    }
    else
    {
      v16 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("distanceToHomeInMiles"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v18 = 0;
LABEL_29:
      v10 = v44;
      v19 = -[BMMomentsEventDataEventBundlePlace initWithPlaceInferencePlaceType:placeInferenceUserSpecificPlaceType:geoPOICategoryType:placeNameConfidence:familiarityIndexLOI:distanceToHomeInMiles:](self, "initWithPlaceInferencePlaceType:placeInferenceUserSpecificPlaceType:geoPOICategoryType:placeNameConfidence:familiarityIndexLOI:distanceToHomeInMiles:", objc_msgSend(v7, "intValue"), objc_msgSend(v44, "intValue"), objc_msgSend(v49, "intValue"), v48, v16, v18);
      v20 = v19;
LABEL_48:

      goto LABEL_49;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = v17;
      goto LABEL_29;
    }
    v19 = self;
    if (v14)
    {
      v42 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v41 = *MEMORY[0x1E0D025B8];
      v50 = *MEMORY[0x1E0CB2D50];
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("distanceToHomeInMiles"));
      v51 = v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *v14 = (id)objc_msgSend(v42, "initWithDomain:code:userInfo:", v41, 2, v30);

    }
    v18 = 0;
    v20 = 0;
LABEL_47:
    v10 = v44;
    goto LABEL_48;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = a4;
    v48 = v13;
    goto LABEL_23;
  }
  if (!a4)
  {
    v48 = 0;
    v20 = 0;
    v19 = self;
    goto LABEL_50;
  }
  v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v22 = v10;
  v23 = *MEMORY[0x1E0D025B8];
  v54 = *MEMORY[0x1E0CB2D50];
  v24 = a4;
  v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("placeNameConfidence"));
  v55 = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v23;
  v10 = v22;
  v20 = 0;
  v48 = 0;
  *v24 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v25, 2, v15);
  v19 = self;
LABEL_49:

  v6 = v43;
LABEL_50:

  v9 = v45;
LABEL_51:

LABEL_52:
LABEL_53:

  return v20;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[6];
  _QWORD v29[7];

  v29[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundlePlace placeInferencePlaceType](self, "placeInferencePlaceType"));
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundlePlace placeInferenceUserSpecificPlaceType](self, "placeInferenceUserSpecificPlaceType"));
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMomentsEventDataEventBundlePlace geoPOICategoryType](self, "geoPOICategoryType"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (!-[BMMomentsEventDataEventBundlePlace hasPlaceNameConfidence](self, "hasPlaceNameConfidence")
    || (-[BMMomentsEventDataEventBundlePlace placeNameConfidence](self, "placeNameConfidence"), fabs(v6) == INFINITY))
  {
    v8 = 0;
  }
  else
  {
    -[BMMomentsEventDataEventBundlePlace placeNameConfidence](self, "placeNameConfidence");
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundlePlace placeNameConfidence](self, "placeNameConfidence");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!-[BMMomentsEventDataEventBundlePlace hasFamiliarityIndexLOI](self, "hasFamiliarityIndexLOI")
    || (-[BMMomentsEventDataEventBundlePlace familiarityIndexLOI](self, "familiarityIndexLOI"), fabs(v9) == INFINITY))
  {
    v11 = 0;
  }
  else
  {
    -[BMMomentsEventDataEventBundlePlace familiarityIndexLOI](self, "familiarityIndexLOI");
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundlePlace familiarityIndexLOI](self, "familiarityIndexLOI");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!-[BMMomentsEventDataEventBundlePlace hasDistanceToHomeInMiles](self, "hasDistanceToHomeInMiles")
    || (-[BMMomentsEventDataEventBundlePlace distanceToHomeInMiles](self, "distanceToHomeInMiles"), fabs(v12) == INFINITY))
  {
    v14 = 0;
  }
  else
  {
    -[BMMomentsEventDataEventBundlePlace distanceToHomeInMiles](self, "distanceToHomeInMiles");
    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMomentsEventDataEventBundlePlace distanceToHomeInMiles](self, "distanceToHomeInMiles");
    objc_msgSend(v13, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28[0] = CFSTR("placeInferencePlaceType");
  v15 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v24 = v15;
  v29[0] = v15;
  v28[1] = CFSTR("placeInferenceUserSpecificPlaceType");
  v16 = (void *)v4;
  v27 = (void *)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[1] = v16;
  v28[2] = CFSTR("geoPOICategoryType");
  v17 = (void *)v5;
  v26 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v3;
  v29[2] = v17;
  v28[3] = CFSTR("placeNameConfidence");
  v19 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[3] = v19;
  v28[4] = CFSTR("familiarityIndexLOI");
  v20 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[4] = v20;
  v28[5] = CFSTR("distanceToHomeInMiles");
  v21 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[5] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 6, v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (v11)
      goto LABEL_27;
LABEL_34:

    if (v8)
      goto LABEL_28;
    goto LABEL_35;
  }

  if (!v11)
    goto LABEL_34;
LABEL_27:
  if (v8)
    goto LABEL_28;
LABEL_35:

LABEL_28:
  if (!v26)

  if (!v27)
  {

    if (v18)
      goto LABEL_32;
LABEL_37:

    goto LABEL_32;
  }
  if (!v18)
    goto LABEL_37;
LABEL_32:

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMMomentsEventDataEventBundlePlace placeInferencePlaceType](self, "placeInferencePlaceType");
    if (v6 != objc_msgSend(v5, "placeInferencePlaceType"))
      goto LABEL_21;
    v7 = -[BMMomentsEventDataEventBundlePlace placeInferenceUserSpecificPlaceType](self, "placeInferenceUserSpecificPlaceType");
    if (v7 != objc_msgSend(v5, "placeInferenceUserSpecificPlaceType"))
      goto LABEL_21;
    v8 = -[BMMomentsEventDataEventBundlePlace geoPOICategoryType](self, "geoPOICategoryType");
    if (v8 != objc_msgSend(v5, "geoPOICategoryType"))
      goto LABEL_21;
    if (-[BMMomentsEventDataEventBundlePlace hasPlaceNameConfidence](self, "hasPlaceNameConfidence")
      || objc_msgSend(v5, "hasPlaceNameConfidence"))
    {
      if (!-[BMMomentsEventDataEventBundlePlace hasPlaceNameConfidence](self, "hasPlaceNameConfidence"))
        goto LABEL_21;
      if (!objc_msgSend(v5, "hasPlaceNameConfidence"))
        goto LABEL_21;
      -[BMMomentsEventDataEventBundlePlace placeNameConfidence](self, "placeNameConfidence");
      v10 = v9;
      objc_msgSend(v5, "placeNameConfidence");
      if (v10 != v11)
        goto LABEL_21;
    }
    if (-[BMMomentsEventDataEventBundlePlace hasFamiliarityIndexLOI](self, "hasFamiliarityIndexLOI")
      || objc_msgSend(v5, "hasFamiliarityIndexLOI"))
    {
      if (!-[BMMomentsEventDataEventBundlePlace hasFamiliarityIndexLOI](self, "hasFamiliarityIndexLOI"))
        goto LABEL_21;
      if (!objc_msgSend(v5, "hasFamiliarityIndexLOI"))
        goto LABEL_21;
      -[BMMomentsEventDataEventBundlePlace familiarityIndexLOI](self, "familiarityIndexLOI");
      v13 = v12;
      objc_msgSend(v5, "familiarityIndexLOI");
      if (v13 != v14)
        goto LABEL_21;
    }
    if (!-[BMMomentsEventDataEventBundlePlace hasDistanceToHomeInMiles](self, "hasDistanceToHomeInMiles")
      && !objc_msgSend(v5, "hasDistanceToHomeInMiles"))
    {
      v18 = 1;
      goto LABEL_22;
    }
    if (-[BMMomentsEventDataEventBundlePlace hasDistanceToHomeInMiles](self, "hasDistanceToHomeInMiles")
      && objc_msgSend(v5, "hasDistanceToHomeInMiles"))
    {
      -[BMMomentsEventDataEventBundlePlace distanceToHomeInMiles](self, "distanceToHomeInMiles");
      v16 = v15;
      objc_msgSend(v5, "distanceToHomeInMiles");
      v18 = v16 == v17;
    }
    else
    {
LABEL_21:
      v18 = 0;
    }
LABEL_22:

    goto LABEL_23;
  }
  v18 = 0;
LABEL_23:

  return v18;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)placeInferencePlaceType
{
  return self->_placeInferencePlaceType;
}

- (int)placeInferenceUserSpecificPlaceType
{
  return self->_placeInferenceUserSpecificPlaceType;
}

- (int)geoPOICategoryType
{
  return self->_geoPOICategoryType;
}

- (double)placeNameConfidence
{
  return self->_placeNameConfidence;
}

- (BOOL)hasPlaceNameConfidence
{
  return self->_hasPlaceNameConfidence;
}

- (void)setHasPlaceNameConfidence:(BOOL)a3
{
  self->_hasPlaceNameConfidence = a3;
}

- (double)familiarityIndexLOI
{
  return self->_familiarityIndexLOI;
}

- (BOOL)hasFamiliarityIndexLOI
{
  return self->_hasFamiliarityIndexLOI;
}

- (void)setHasFamiliarityIndexLOI:(BOOL)a3
{
  self->_hasFamiliarityIndexLOI = a3;
}

- (double)distanceToHomeInMiles
{
  return self->_distanceToHomeInMiles;
}

- (BOOL)hasDistanceToHomeInMiles
{
  return self->_hasDistanceToHomeInMiles;
}

- (void)setHasDistanceToHomeInMiles:(BOOL)a3
{
  self->_hasDistanceToHomeInMiles = a3;
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

    v4 = -[BMMomentsEventDataEventBundlePlace initByReadFrom:]([BMMomentsEventDataEventBundlePlace alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("placeInferencePlaceType"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("placeInferenceUserSpecificPlaceType"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("geoPOICategoryType"), 0, 0, 3, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("placeNameConfidence"), 1, 0, 4, 0, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("familiarityIndexLOI"), 1, 0, 5, 0, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("distanceToHomeInMiles"), 1, 0, 6, 0, 0);
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
  return &unk_1E5F1A728;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("placeInferencePlaceType"), 1, 4, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("placeInferenceUserSpecificPlaceType"), 2, 4, 0);
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("geoPOICategoryType"), 3, 4, 0);
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("placeNameConfidence"), 4, 0, 0);
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("familiarityIndexLOI"), 5, 0, 0);
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("distanceToHomeInMiles"), 6, 0, 0);
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
