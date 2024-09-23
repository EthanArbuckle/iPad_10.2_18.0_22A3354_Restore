@implementation BMProactiveHarvestingPhotosView

- (BMProactiveHarvestingPhotosView)initWithLocations:(id)a3 absoluteTimestamp:(id)a4 uniqueID:(id)a5 contentProtection:(id)a6 personaId:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  BMProactiveHarvestingPhotosView *v18;
  double v19;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v21.receiver = self;
  v21.super_class = (Class)BMProactiveHarvestingPhotosView;
  v18 = -[BMEventBase init](&v21, sel_init);
  if (v18)
  {
    v18->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v18->_locations, a3);
    if (v14)
    {
      v18->_hasRaw_absoluteTimestamp = 1;
      objc_msgSend(v14, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v18->_hasRaw_absoluteTimestamp = 0;
      v19 = -1.0;
    }
    v18->_raw_absoluteTimestamp = v19;
    objc_storeStrong((id *)&v18->_uniqueID, a5);
    objc_storeStrong((id *)&v18->_contentProtection, a6);
    objc_storeStrong((id *)&v18->_personaId, a7);
  }

  return v18;
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
  -[BMProactiveHarvestingPhotosView locations](self, "locations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPhotosView absoluteTimestamp](self, "absoluteTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPhotosView uniqueID](self, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPhotosView contentProtection](self, "contentProtection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPhotosView personaId](self, "personaId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMProactiveHarvestingPhotosView with locations: %@, absoluteTimestamp: %@, uniqueID: %@, contentProtection: %@, personaId: %@"), v4, v5, v6, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMProactiveHarvestingPhotosView *v5;
  void *v6;
  int *v7;
  int *v8;
  int *v9;
  int *v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  int v19;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSArray *locations;
  int v31;
  BMProactiveHarvestingPhotosView *v32;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)BMProactiveHarvestingPhotosView;
  v5 = -[BMEventBase init](&v34, sel_init);
  if (!v5)
  {
LABEL_36:
    v32 = v5;
    goto LABEL_37;
  }
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] >= *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
LABEL_34:
    v29 = objc_msgSend(v6, "copy");
    locations = v5->_locations;
    v5->_locations = (NSArray *)v29;

    v31 = v4[*v9];
    if (v31)
      goto LABEL_35;
    goto LABEL_36;
  }
  v10 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (v4[*v9])
      goto LABEL_34;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    while (1)
    {
      v14 = *v7;
      v15 = *(_QWORD *)&v4[v14];
      v16 = v15 + 1;
      if (v15 == -1 || v16 > *(_QWORD *)&v4[*v8])
        break;
      v17 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v15);
      *(_QWORD *)&v4[v14] = v16;
      v13 |= (unint64_t)(v17 & 0x7F) << v11;
      if ((v17 & 0x80) == 0)
        goto LABEL_13;
      v11 += 7;
      if (v12++ >= 9)
      {
        v13 = 0;
        v19 = v4[*v9];
        goto LABEL_15;
      }
    }
    v4[*v9] = 1;
LABEL_13:
    v19 = v4[*v9];
    if (v4[*v9])
      v13 = 0;
LABEL_15:
    if (v19 || (v13 & 7) == 4)
      goto LABEL_34;
    switch((v13 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        if (!v21)
          goto LABEL_38;
        v22 = (void *)v21;
        objc_msgSend(v6, "addObject:", v21);

        goto LABEL_33;
      case 2u:
        v5->_hasRaw_absoluteTimestamp = 1;
        v23 = *v7;
        v24 = *(_QWORD *)&v4[v23];
        if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(_QWORD *)&v4[*v8])
        {
          v25 = *(double *)(*(_QWORD *)&v4[*v10] + v24);
          *(_QWORD *)&v4[v23] = v24 + 8;
        }
        else
        {
          v4[*v9] = 1;
          v25 = 0.0;
        }
        v5->_raw_absoluteTimestamp = v25;
        goto LABEL_33;
      case 3u:
        PBReaderReadString();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = 48;
        goto LABEL_30;
      case 4u:
        PBReaderReadString();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = 56;
        goto LABEL_30;
      case 5u:
        PBReaderReadString();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = 64;
LABEL_30:
        v28 = *(Class *)((char *)&v5->super.super.isa + v27);
        *(Class *)((char *)&v5->super.super.isa + v27) = (Class)v26;

        goto LABEL_33;
      default:
        if (PBReaderSkipValueWithTag())
        {
LABEL_33:
          if (*(_QWORD *)&v4[*v7] >= *(_QWORD *)&v4[*v8])
            goto LABEL_34;
          continue;
        }
LABEL_38:

LABEL_35:
        v32 = 0;
LABEL_37:

        return v32;
    }
  }
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_locations;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (self->_hasRaw_absoluteTimestamp)
    PBDataWriterWriteDoubleField();
  if (self->_uniqueID)
    PBDataWriterWriteStringField();
  if (self->_contentProtection)
    PBDataWriterWriteStringField();
  if (self->_personaId)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMProactiveHarvestingPhotosView writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMProactiveHarvestingPhotosView)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  id *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void **v22;
  uint64_t *v23;
  id v24;
  BMProactiveHarvestingPhotosView *v25;
  id v26;
  uint64_t v27;
  objc_class *v28;
  id v29;
  id v30;
  double v31;
  double v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id v39;
  uint64_t v40;
  uint64_t v41;
  id *v42;
  id v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;
  uint64_t v53;
  id v54;
  id *v55;
  id v56;
  void *v57;
  void *v58;
  BMProactiveHarvestingPhotosView *v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  _BYTE v77[128];
  uint64_t v78;
  _QWORD v79[3];

  v79[1] = *MEMORY[0x1E0C80C00];
  v60 = a3;
  objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("locations"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    v59 = self;

    v6 = 0;
LABEL_6:
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v6 = v6;
    v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
    v11 = a4;
    if (!v10)
      goto LABEL_15;
    v12 = v10;
    v13 = *(_QWORD *)v62;
LABEL_8:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v62 != v13)
        objc_enumerationMutation(v6);
      v15 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v14);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v11)
        {
          v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v20 = *MEMORY[0x1E0D025B8];
          v73 = *MEMORY[0x1E0CB2D50];
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("locations"));
          v74 = v17;
          v21 = (void *)MEMORY[0x1E0C99D80];
          v22 = &v74;
          v23 = &v73;
          goto LABEL_22;
        }
        goto LABEL_23;
      }
      objc_msgSend(v9, "addObject:", v15);
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
        a4 = v11;
        if (v12)
          goto LABEL_8;
LABEL_15:

        v16 = v60;
        objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v18 = 0;
          goto LABEL_32;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v28 = (objc_class *)MEMORY[0x1E0C99D68];
          v29 = v17;
          v30 = [v28 alloc];
          objc_msgSend(v29, "doubleValue");
          v32 = v31;

          v16 = v60;
          v33 = (id)objc_msgSend(v30, "initWithTimeIntervalSinceReferenceDate:", v32);
          goto LABEL_28;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v34 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
          objc_msgSend(v34, "dateFromString:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_32;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v33 = v17;
LABEL_28:
          v18 = v33;
LABEL_32:
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("uniqueID"));
          v24 = (id)objc_claimAutoreleasedReturnValue();
          v57 = v24;
          if (v24)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v24 = 0;
              goto LABEL_37;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v24 = v24;
              goto LABEL_37;
            }
            if (a4)
            {
              v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v40 = *MEMORY[0x1E0D025B8];
              v69 = *MEMORY[0x1E0CB2D50];
              v41 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("uniqueID"));
              v70 = v41;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
              v42 = a4;
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v40, 2, v35);
              v25 = 0;
              v24 = 0;
              *v42 = v43;
              v11 = (id *)v41;
              goto LABEL_45;
            }
            v24 = 0;
            v25 = 0;
LABEL_46:

LABEL_47:
            goto LABEL_48;
          }
LABEL_37:
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("contentProtection"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (v35 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v55 = v35;
              v16 = v60;
              goto LABEL_40;
            }
            if (!v11)
            {
              v25 = 0;
LABEL_45:

              v16 = v60;
              goto LABEL_46;
            }
            v56 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v44 = *MEMORY[0x1E0D025B8];
            v67 = *MEMORY[0x1E0CB2D50];
            v37 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("contentProtection"));
            v68 = v37;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = (id)objc_msgSend(v56, "initWithDomain:code:userInfo:", v44, 2, v36);
            v25 = 0;
            *v11 = v45;
            v11 = 0;
          }
          else
          {
            v55 = 0;
LABEL_40:
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("personaId"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v36 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v37 = 0;
              goto LABEL_43;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v37 = v36;
LABEL_43:
              v11 = v55;
              v25 = -[BMProactiveHarvestingPhotosView initWithLocations:absoluteTimestamp:uniqueID:contentProtection:personaId:](v59, "initWithLocations:absoluteTimestamp:uniqueID:contentProtection:personaId:", v9, v18, v24, v55, v37);
              v59 = v25;
            }
            else
            {
              if (v11)
              {
                v54 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v53 = *MEMORY[0x1E0D025B8];
                v65 = *MEMORY[0x1E0CB2D50];
                v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("personaId"));
                v66 = v46;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                *v11 = (id)objc_msgSend(v54, "initWithDomain:code:userInfo:", v53, 2, v47);

              }
              v37 = 0;
              v25 = 0;
              v11 = v55;
            }
          }

          goto LABEL_45;
        }
        if (a4)
        {
          v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v49 = *MEMORY[0x1E0D025B8];
          v71 = *MEMORY[0x1E0CB2D50];
          v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), objc_opt_class(), CFSTR("absoluteTimestamp"));
          v72 = v24;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
          v50 = objc_claimAutoreleasedReturnValue();
          v51 = v48;
          v16 = v60;
          v58 = (void *)v50;
          v52 = (id)objc_msgSend(v51, "initWithDomain:code:userInfo:", v49, 2);
          v18 = 0;
          v25 = 0;
          *a4 = v52;

          goto LABEL_47;
        }
        v18 = 0;
        v25 = 0;
LABEL_48:

        self = v59;
LABEL_49:

        goto LABEL_50;
      }
    }
    if (v11)
    {
      v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v20 = *MEMORY[0x1E0D025B8];
      v75 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("locations"));
      v76 = v17;
      v21 = (void *)MEMORY[0x1E0C99D80];
      v22 = &v76;
      v23 = &v75;
LABEL_22:
      objc_msgSend(v21, "dictionaryWithObjects:forKeys:count:", v22, v23, 1);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      *v11 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 2, v24);
      v18 = v6;
      v16 = v60;
      goto LABEL_47;
    }
LABEL_23:
    v25 = 0;
    v18 = v6;
    self = v59;
    v16 = v60;
    goto LABEL_49;
  }
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v59 = self;
    goto LABEL_6;
  }
  if (a4)
  {
    v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v27 = *MEMORY[0x1E0D025B8];
    v78 = *MEMORY[0x1E0CB2D50];
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("locations"));
    v79[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, &v78, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    *a4 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v27, 2, v18);
    v16 = v60;
    goto LABEL_49;
  }
  v25 = 0;
  v16 = v60;
LABEL_50:

  return v25;
}

- (id)_locationsJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[BMProactiveHarvestingPhotosView locations](self, "locations", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
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
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  _QWORD v25[6];

  v25[5] = *MEMORY[0x1E0C80C00];
  -[BMProactiveHarvestingPhotosView _locationsJSONArray](self, "_locationsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPhotosView absoluteTimestamp](self, "absoluteTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[BMProactiveHarvestingPhotosView absoluteTimestamp](self, "absoluteTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    objc_msgSend(v5, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  -[BMProactiveHarvestingPhotosView uniqueID](self, "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPhotosView contentProtection](self, "contentProtection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPhotosView personaId](self, "personaId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = CFSTR("locations");
  v11 = (uint64_t)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v18 = v11;
  v25[0] = v11;
  v21 = CFSTR("absoluteTimestamp");
  v12 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v11, v20, v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[1] = v12;
  v22 = CFSTR("uniqueID");
  v13 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[2] = v13;
  v23 = CFSTR("contentProtection");
  v14 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[3] = v14;
  v24 = CFSTR("personaId");
  v15 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[4] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v20, 5, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v9)
      goto LABEL_16;
  }
  else
  {

    if (v9)
    {
LABEL_16:
      if (v8)
        goto LABEL_17;
      goto LABEL_22;
    }
  }

  if (v8)
  {
LABEL_17:
    if (v7)
      goto LABEL_18;
LABEL_23:

    if (v3)
      goto LABEL_19;
LABEL_24:

    goto LABEL_19;
  }
LABEL_22:

  if (!v7)
    goto LABEL_23;
LABEL_18:
  if (!v3)
    goto LABEL_24;
LABEL_19:

  return v16;
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
  void *v32;
  void *v33;
  void *v34;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMProactiveHarvestingPhotosView locations](self, "locations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locations");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMProactiveHarvestingPhotosView locations](self, "locations");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "locations");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_17;
    }
    -[BMProactiveHarvestingPhotosView absoluteTimestamp](self, "absoluteTimestamp");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimestamp");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMProactiveHarvestingPhotosView absoluteTimestamp](self, "absoluteTimestamp");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_17;
    }
    -[BMProactiveHarvestingPhotosView uniqueID](self, "uniqueID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueID");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMProactiveHarvestingPhotosView uniqueID](self, "uniqueID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uniqueID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_17;
    }
    -[BMProactiveHarvestingPhotosView contentProtection](self, "contentProtection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentProtection");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMProactiveHarvestingPhotosView contentProtection](self, "contentProtection");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contentProtection");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
      {
LABEL_17:
        v12 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    -[BMProactiveHarvestingPhotosView personaId](self, "personaId");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "personaId");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31 == v32)
    {
      v12 = 1;
    }
    else
    {
      -[BMProactiveHarvestingPhotosView personaId](self, "personaId");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "personaId");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v33, "isEqual:", v34);

    }
    goto LABEL_23;
  }
  v12 = 0;
LABEL_24:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSArray)locations
{
  return self->_locations;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (NSString)personaId
{
  return self->_personaId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_locations, 0);
}

+ (unsigned)latestDataVersion
{
  return 2;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  objc_class *v4;
  id v5;
  void *v6;
  _DWORD *v7;

  if (a4 == 2)
  {
    v4 = (objc_class *)MEMORY[0x1E0D82B90];
    v5 = a3;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithData:", v5);

    v7 = -[BMProactiveHarvestingPhotosView initByReadFrom:]([BMProactiveHarvestingPhotosView alloc], "initByReadFrom:", v6);
    v7[8] = 2;

  }
  else
  {
    v7 = 0;
  }
  return v7;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("locations_json"), 5, 1, &__block_literal_global);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 2, 0, 1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("uniqueID"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("contentProtection"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("personaId"), 2, 0, 5, 13, 0);
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
  return &unk_1E5F1A530;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("locations"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 2, 0, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("uniqueID"), 3, 13, 0);
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("contentProtection"), 4, 13, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("personaId"), 5, 13, 0);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __42__BMProactiveHarvestingPhotosView_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_locationsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
