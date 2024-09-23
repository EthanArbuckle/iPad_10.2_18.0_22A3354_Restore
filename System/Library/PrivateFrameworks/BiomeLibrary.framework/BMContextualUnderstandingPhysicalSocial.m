@implementation BMContextualUnderstandingPhysicalSocial

- (BMContextualUnderstandingPhysicalSocial)initWithLocalIdentifier:(id)a3 discoveredPeople:(id)a4 startTimeInSecondsSinceReferenceDate:(id)a5 endTimeInSecondsSinceReferenceDate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  BMContextualUnderstandingPhysicalSocial *v15;
  double v16;
  double v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)BMContextualUnderstandingPhysicalSocial;
  v15 = -[BMEventBase init](&v19, sel_init);
  if (v15)
  {
    v15->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v15->_localIdentifier, a3);
    objc_storeStrong((id *)&v15->_discoveredPeople, a4);
    if (v13)
    {
      v15->_hasStartTimeInSecondsSinceReferenceDate = 1;
      objc_msgSend(v13, "doubleValue");
    }
    else
    {
      v15->_hasStartTimeInSecondsSinceReferenceDate = 0;
      v16 = -1.0;
    }
    v15->_startTimeInSecondsSinceReferenceDate = v16;
    if (v14)
    {
      v15->_hasEndTimeInSecondsSinceReferenceDate = 1;
      objc_msgSend(v14, "doubleValue");
    }
    else
    {
      v15->_hasEndTimeInSecondsSinceReferenceDate = 0;
      v17 = -1.0;
    }
    v15->_endTimeInSecondsSinceReferenceDate = v17;
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

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMContextualUnderstandingPhysicalSocial localIdentifier](self, "localIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMContextualUnderstandingPhysicalSocial discoveredPeople](self, "discoveredPeople");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[BMContextualUnderstandingPhysicalSocial startTimeInSecondsSinceReferenceDate](self, "startTimeInSecondsSinceReferenceDate");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[BMContextualUnderstandingPhysicalSocial endTimeInSecondsSinceReferenceDate](self, "endTimeInSecondsSinceReferenceDate");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMContextualUnderstandingPhysicalSocial with localIdentifier: %@, discoveredPeople: %@, startTimeInSecondsSinceReferenceDate: %@, endTimeInSecondsSinceReferenceDate: %@"), v4, v5, v7, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMContextualUnderstandingPhysicalSocial *v5;
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
  NSString *localIdentifier;
  id v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  objc_class *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSArray *discoveredPeople;
  int v33;
  BMContextualUnderstandingPhysicalSocial *v34;
  objc_super v36;
  uint64_t v37;
  uint64_t v38;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMContextualUnderstandingPhysicalSocial;
  v5 = -[BMEventBase init](&v36, sel_init);
  if (!v5)
  {
LABEL_40:
    v34 = v5;
    goto LABEL_41;
  }
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] >= *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
LABEL_38:
    v31 = objc_msgSend(v6, "copy");
    discoveredPeople = v5->_discoveredPeople;
    v5->_discoveredPeople = (NSArray *)v31;

    v33 = v4[*v9];
    if (v33)
      goto LABEL_39;
    goto LABEL_40;
  }
  v10 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (v4[*v9])
      goto LABEL_38;
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
      goto LABEL_38;
    switch((v13 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        localIdentifier = v5->_localIdentifier;
        v5->_localIdentifier = (NSString *)v21;

        goto LABEL_37;
      case 2u:
        v37 = 0;
        v38 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_42;
        v23 = -[BMContextualUnderstandingPhysicalSocialPerson initByReadFrom:]([BMContextualUnderstandingPhysicalSocialPerson alloc], "initByReadFrom:", v4);
        if (!v23)
          goto LABEL_42;
        v24 = v23;
        objc_msgSend(v6, "addObject:", v23);
        PBReaderRecallMark();

        goto LABEL_37;
      case 3u:
        v5->_hasStartTimeInSecondsSinceReferenceDate = 1;
        v25 = *v7;
        v26 = *(_QWORD *)&v4[v25];
        if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(_QWORD *)&v4[*v8])
        {
          v27 = *(objc_class **)(*(_QWORD *)&v4[*v10] + v26);
          *(_QWORD *)&v4[v25] = v26 + 8;
        }
        else
        {
          v4[*v9] = 1;
          v27 = 0;
        }
        v30 = 40;
        goto LABEL_36;
      case 4u:
        v5->_hasEndTimeInSecondsSinceReferenceDate = 1;
        v28 = *v7;
        v29 = *(_QWORD *)&v4[v28];
        if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(_QWORD *)&v4[*v8])
        {
          v27 = *(objc_class **)(*(_QWORD *)&v4[*v10] + v29);
          *(_QWORD *)&v4[v28] = v29 + 8;
        }
        else
        {
          v4[*v9] = 1;
          v27 = 0;
        }
        v30 = 48;
LABEL_36:
        *(Class *)((char *)&v5->super.super.isa + v30) = v27;
        goto LABEL_37;
      default:
        if (PBReaderSkipValueWithTag())
        {
LABEL_37:
          if (*(_QWORD *)&v4[*v7] >= *(_QWORD *)&v4[*v8])
            goto LABEL_38;
          continue;
        }
LABEL_42:

LABEL_39:
        v34 = 0;
LABEL_41:

        return v34;
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
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_localIdentifier)
    PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_discoveredPeople;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4);
        PBDataWriterRecallMark();
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  if (self->_hasStartTimeInSecondsSinceReferenceDate)
    PBDataWriterWriteDoubleField();
  if (self->_hasEndTimeInSecondsSinceReferenceDate)
    PBDataWriterWriteDoubleField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMContextualUnderstandingPhysicalSocial writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMContextualUnderstandingPhysicalSocial)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  BMContextualUnderstandingPhysicalSocialPerson *v17;
  BMContextualUnderstandingPhysicalSocialPerson *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  BMContextualUnderstandingPhysicalSocial *v23;
  id *v24;
  id v25;
  uint64_t v26;
  void *v27;
  id *v28;
  uint64_t *v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  BMContextualUnderstandingPhysicalSocial *v45;
  id v46;
  void *v47;
  void *v49;
  void *v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  id v63;
  _BYTE v64[128];
  uint64_t v65;
  void *v66;
  uint64_t v67;
  _QWORD v68[3];

  v68[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("localIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v22 = *MEMORY[0x1E0D025B8];
        v67 = *MEMORY[0x1E0CB2D50];
        v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("localIdentifier"));
        v68[0] = v8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, &v67, 1);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0;
        v7 = 0;
        *a4 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 2);

        goto LABEL_50;
      }
      v23 = 0;
      v7 = 0;
      goto LABEL_51;
    }
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("discoveredPeople"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  v47 = v6;
  if (v10)
  {
    v43 = v7;
    v45 = self;

    v8 = 0;
LABEL_9:
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v8 = v8;
    v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
    if (!v11)
      goto LABEL_19;
    v12 = v11;
    v13 = *(_QWORD *)v53;
    v42 = v5;
LABEL_11:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v53 != v13)
        objc_enumerationMutation(v8);
      v15 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v14);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v24 = a4;
        if (a4)
        {
          v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v26 = *MEMORY[0x1E0D025B8];
          v60 = *MEMORY[0x1E0CB2D50];
          v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("discoveredPeople"));
          v61 = v16;
          v27 = (void *)MEMORY[0x1E0C99D80];
          v28 = &v61;
          v29 = &v60;
          goto LABEL_30;
        }
        goto LABEL_37;
      }
      v16 = v15;
      v17 = [BMContextualUnderstandingPhysicalSocialPerson alloc];
      v51 = 0;
      v18 = -[BMContextualUnderstandingPhysicalSocialPerson initWithJSONDictionary:error:](v17, "initWithJSONDictionary:error:", v16, &v51);
      v19 = v51;
      if (v19)
      {
        v30 = v19;
        if (a4)
          *a4 = objc_retainAutorelease(v19);

        v23 = 0;
        goto LABEL_34;
      }
      objc_msgSend(v49, "addObject:", v18);

      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
        v5 = v42;
        if (v12)
          goto LABEL_11;
LABEL_19:

        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("startTimeInSecondsSinceReferenceDate"));
        v16 = (id)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          v20 = 0;
          v7 = v43;
          self = v45;
          goto LABEL_41;
        }
        objc_opt_class();
        v7 = v43;
        self = v45;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20 = 0;
LABEL_41:
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("endTimeInSecondsSinceReferenceDate"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v35 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v30 = 0;
            goto LABEL_44;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v30 = v35;
LABEL_44:
            self = -[BMContextualUnderstandingPhysicalSocial initWithLocalIdentifier:discoveredPeople:startTimeInSecondsSinceReferenceDate:endTimeInSecondsSinceReferenceDate:](self, "initWithLocalIdentifier:discoveredPeople:startTimeInSecondsSinceReferenceDate:endTimeInSecondsSinceReferenceDate:", v7, v49, v20, v30);
            v23 = self;
          }
          else
          {
            if (a4)
            {
              v46 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v44 = *MEMORY[0x1E0D025B8];
              v56 = *MEMORY[0x1E0CB2D50];
              v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("endTimeInSecondsSinceReferenceDate"));
              v57 = v39;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              *a4 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v44, 2, v40);

            }
            v30 = 0;
            v23 = 0;
          }
LABEL_45:

LABEL_46:
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v20 = v16;
            goto LABEL_41;
          }
          if (a4)
          {
            v41 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v37 = *MEMORY[0x1E0D025B8];
            v58 = *MEMORY[0x1E0CB2D50];
            v30 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("startTimeInSecondsSinceReferenceDate"));
            v59 = v30;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = (id)objc_msgSend(v41, "initWithDomain:code:userInfo:", v37, 2, v35);
            v23 = 0;
            v20 = 0;
            *a4 = v38;
            goto LABEL_45;
          }
          v20 = 0;
          v23 = 0;
        }

LABEL_48:
        v6 = v47;

        goto LABEL_50;
      }
    }
    v24 = a4;
    if (a4)
    {
      v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v26 = *MEMORY[0x1E0D025B8];
      v62 = *MEMORY[0x1E0CB2D50];
      v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("discoveredPeople"));
      v63 = v16;
      v27 = (void *)MEMORY[0x1E0C99D80];
      v28 = &v63;
      v29 = &v62;
LABEL_30:
      objc_msgSend(v27, "dictionaryWithObjects:forKeys:count:", v28, v29, 1);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      v31 = (id)objc_msgSend(v25, "initWithDomain:code:userInfo:", v26, 2, v30);
      v23 = 0;
      *v24 = v31;
LABEL_34:
      v20 = v8;
      v5 = v42;
      v7 = v43;
      self = v45;
      goto LABEL_46;
    }
LABEL_37:
    v23 = 0;
    v20 = v8;
    v5 = v42;
    v7 = v43;
    self = v45;
    goto LABEL_48;
  }
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v43 = v7;
    v45 = self;
    goto LABEL_9;
  }
  if (a4)
  {
    v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v33 = *MEMORY[0x1E0D025B8];
    v65 = *MEMORY[0x1E0CB2D50];
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("discoveredPeople"));
    v66 = v49;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v34 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v33, 2, v20);
    v23 = 0;
    *a4 = v34;
    goto LABEL_48;
  }
  v23 = 0;
LABEL_50:

LABEL_51:
  return v23;
}

- (id)_discoveredPeopleJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[BMContextualUnderstandingPhysicalSocial discoveredPeople](self, "discoveredPeople", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "jsonDictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  -[BMContextualUnderstandingPhysicalSocial localIdentifier](self, "localIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMContextualUnderstandingPhysicalSocial _discoveredPeopleJSONArray](self, "_discoveredPeopleJSONArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BMContextualUnderstandingPhysicalSocial hasStartTimeInSecondsSinceReferenceDate](self, "hasStartTimeInSecondsSinceReferenceDate")|| (-[BMContextualUnderstandingPhysicalSocial startTimeInSecondsSinceReferenceDate](self, "startTimeInSecondsSinceReferenceDate"), fabs(v5) == INFINITY))
  {
    v7 = 0;
  }
  else
  {
    -[BMContextualUnderstandingPhysicalSocial startTimeInSecondsSinceReferenceDate](self, "startTimeInSecondsSinceReferenceDate");
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[BMContextualUnderstandingPhysicalSocial startTimeInSecondsSinceReferenceDate](self, "startTimeInSecondsSinceReferenceDate");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!-[BMContextualUnderstandingPhysicalSocial hasEndTimeInSecondsSinceReferenceDate](self, "hasEndTimeInSecondsSinceReferenceDate")|| (-[BMContextualUnderstandingPhysicalSocial endTimeInSecondsSinceReferenceDate](self, "endTimeInSecondsSinceReferenceDate"), fabs(v8) == INFINITY))
  {
    v10 = 0;
  }
  else
  {
    -[BMContextualUnderstandingPhysicalSocial endTimeInSecondsSinceReferenceDate](self, "endTimeInSecondsSinceReferenceDate");
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[BMContextualUnderstandingPhysicalSocial endTimeInSecondsSinceReferenceDate](self, "endTimeInSecondsSinceReferenceDate");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[0] = CFSTR("localIdentifier");
  v11 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[0] = v11;
  v17[1] = CFSTR("discoveredPeople");
  v12 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[1] = v12;
  v17[2] = CFSTR("startTimeInSecondsSinceReferenceDate");
  v13 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[2] = v13;
  v17[3] = CFSTR("endTimeInSecondsSinceReferenceDate");
  v14 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v7)
      goto LABEL_19;
  }
  else
  {

    if (v7)
    {
LABEL_19:
      if (v4)
        goto LABEL_20;
LABEL_24:

      if (v3)
        goto LABEL_21;
LABEL_25:

      goto LABEL_21;
    }
  }

  if (!v4)
    goto LABEL_24;
LABEL_20:
  if (!v3)
    goto LABEL_25;
LABEL_21:

  return v15;
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
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMContextualUnderstandingPhysicalSocial localIdentifier](self, "localIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMContextualUnderstandingPhysicalSocial localIdentifier](self, "localIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_21;
    }
    -[BMContextualUnderstandingPhysicalSocial discoveredPeople](self, "discoveredPeople");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "discoveredPeople");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMContextualUnderstandingPhysicalSocial discoveredPeople](self, "discoveredPeople");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "discoveredPeople");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_21;
    }
    if (!-[BMContextualUnderstandingPhysicalSocial hasStartTimeInSecondsSinceReferenceDate](self, "hasStartTimeInSecondsSinceReferenceDate")&& !objc_msgSend(v5, "hasStartTimeInSecondsSinceReferenceDate")|| -[BMContextualUnderstandingPhysicalSocial hasStartTimeInSecondsSinceReferenceDate](self, "hasStartTimeInSecondsSinceReferenceDate")&& objc_msgSend(v5, "hasStartTimeInSecondsSinceReferenceDate")&& (-[BMContextualUnderstandingPhysicalSocial startTimeInSecondsSinceReferenceDate](self, "startTimeInSecondsSinceReferenceDate"), v20 = v19, objc_msgSend(v5, "startTimeInSecondsSinceReferenceDate"), v20 == v21))
    {
      if (!-[BMContextualUnderstandingPhysicalSocial hasEndTimeInSecondsSinceReferenceDate](self, "hasEndTimeInSecondsSinceReferenceDate")&& !objc_msgSend(v5, "hasEndTimeInSecondsSinceReferenceDate"))
      {
        v12 = 1;
        goto LABEL_22;
      }
      if (-[BMContextualUnderstandingPhysicalSocial hasEndTimeInSecondsSinceReferenceDate](self, "hasEndTimeInSecondsSinceReferenceDate")&& objc_msgSend(v5, "hasEndTimeInSecondsSinceReferenceDate"))
      {
        -[BMContextualUnderstandingPhysicalSocial endTimeInSecondsSinceReferenceDate](self, "endTimeInSecondsSinceReferenceDate");
        v23 = v22;
        objc_msgSend(v5, "endTimeInSecondsSinceReferenceDate");
        v12 = v23 == v24;
LABEL_22:

        goto LABEL_23;
      }
    }
LABEL_21:
    v12 = 0;
    goto LABEL_22;
  }
  v12 = 0;
LABEL_23:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (NSArray)discoveredPeople
{
  return self->_discoveredPeople;
}

- (double)startTimeInSecondsSinceReferenceDate
{
  return self->_startTimeInSecondsSinceReferenceDate;
}

- (BOOL)hasStartTimeInSecondsSinceReferenceDate
{
  return self->_hasStartTimeInSecondsSinceReferenceDate;
}

- (void)setHasStartTimeInSecondsSinceReferenceDate:(BOOL)a3
{
  self->_hasStartTimeInSecondsSinceReferenceDate = a3;
}

- (double)endTimeInSecondsSinceReferenceDate
{
  return self->_endTimeInSecondsSinceReferenceDate;
}

- (BOOL)hasEndTimeInSecondsSinceReferenceDate
{
  return self->_hasEndTimeInSecondsSinceReferenceDate;
}

- (void)setHasEndTimeInSecondsSinceReferenceDate:(BOOL)a3
{
  self->_hasEndTimeInSecondsSinceReferenceDate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveredPeople, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
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

    v4 = -[BMContextualUnderstandingPhysicalSocial initByReadFrom:]([BMContextualUnderstandingPhysicalSocial alloc], "initByReadFrom:", v7);
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
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("localIdentifier"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("discoveredPeople_json"), 5, 1, &__block_literal_global_56393);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("startTimeInSecondsSinceReferenceDate"), 1, 0, 3, 0, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("endTimeInSecondsSinceReferenceDate"), 1, 0, 4, 0, 0);
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
  return &unk_1E5F1E3B8;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("localIdentifier"), 1, 13, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("discoveredPeople"), 2, 14, objc_opt_class());
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("startTimeInSecondsSinceReferenceDate"), 3, 0, 0);
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("endTimeInSecondsSinceReferenceDate"), 4, 0, 0);
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __50__BMContextualUnderstandingPhysicalSocial_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_discoveredPeopleJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
