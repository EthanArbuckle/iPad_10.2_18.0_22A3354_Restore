@implementation BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation

- (BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation)initWithStreet:(id)a3 city:(id)a4 state:(id)a5 country:(id)a6 encodedLocation:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation *v17;
  id v19;
  objc_super v20;

  v19 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation;
  v17 = -[BMEventBase init](&v20, sel_init);
  if (v17)
  {
    v17->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v17->_street, a3);
    objc_storeStrong((id *)&v17->_city, a4);
    objc_storeStrong((id *)&v17->_state, a5);
    objc_storeStrong((id *)&v17->_country, a6);
    objc_storeStrong((id *)&v17->_encodedLocation, a7);
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

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation street](self, "street");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation city](self, "city");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation state](self, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation country](self, "country");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation encodedLocation](self, "encodedLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation with street: %@, city: %@, state: %@, country: %@, encodedLocation: %@"), v4, v5, v6, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation *v5;
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
  uint64_t v21;
  void *v22;
  BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation *v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation;
  v5 = -[BMEventBase init](&v25, sel_init);
  if (!v5)
    goto LABEL_31;
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
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 24;
          goto LABEL_27;
        case 2u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 32;
          goto LABEL_27;
        case 3u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 40;
          goto LABEL_27;
        case 4u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 48;
          goto LABEL_27;
        case 5u:
          PBReaderReadData();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 56;
LABEL_27:
          v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            goto LABEL_30;
          break;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_30:
    v23 = 0;
  else
LABEL_31:
    v23 = v5;

  return v23;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_street)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_city)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_state)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_country)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_encodedLocation)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id *v12;
  id v13;
  void *v14;
  id v15;
  BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation *v16;
  id *v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation *v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  _QWORD v47[3];

  v47[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("street"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("city"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v37 = 0;
          v16 = 0;
          goto LABEL_20;
        }
        v31 = a4;
        v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v22 = *MEMORY[0x1E0D025B8];
        v44 = *MEMORY[0x1E0CB2D50];
        v35 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("city"));
        v45 = v35;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 0;
        v37 = 0;
        *v31 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 2, v10);
        goto LABEL_19;
      }
      v37 = v9;
    }
    else
    {
      v37 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("state"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v8;
    v36 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v35 = 0;
          v16 = 0;
          goto LABEL_19;
        }
        v23 = a4;
        v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v25 = *MEMORY[0x1E0D025B8];
        v42 = *MEMORY[0x1E0CB2D50];
        v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("state"));
        v43 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 0;
        v35 = 0;
        *v23 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v25, 2, v11);
LABEL_18:

        self = v36;
        v8 = v34;
LABEL_19:

        goto LABEL_20;
      }
      v35 = v10;
    }
    else
    {
      v35 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("country"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = a4;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v13 = 0;
          v16 = 0;
          goto LABEL_18;
        }
        v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v26 = *MEMORY[0x1E0D025B8];
        v40 = *MEMORY[0x1E0CB2D50];
        v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("country"));
        v41 = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v26, 2, v14);
        v16 = 0;
        v13 = 0;
        *v12 = v27;
        goto LABEL_17;
      }
      v13 = v11;
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("encodedLocation"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v12)
        {
          v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v30 = *MEMORY[0x1E0D025B8];
          v38 = *MEMORY[0x1E0CB2D50];
          v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSData"), objc_opt_class(), CFSTR("encodedLocation"));
          v39 = v28;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *v12 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v30, 2, v29);

        }
        v15 = 0;
        v16 = 0;
        goto LABEL_17;
      }
      v15 = v14;
    }
    else
    {
      v15 = 0;
    }
    v16 = -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation initWithStreet:city:state:country:encodedLocation:](v36, "initWithStreet:city:state:country:encodedLocation:", v34, v37, v35, v13, v15);
    v36 = v16;
LABEL_17:

    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v16 = 0;
    v8 = 0;
    goto LABEL_21;
  }
  v18 = a4;
  v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v20 = *MEMORY[0x1E0D025B8];
  v46 = *MEMORY[0x1E0CB2D50];
  v37 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("street"));
  v47[0] = v37;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v8 = 0;
  *v18 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, 2, v9);
LABEL_20:

LABEL_21:
  return v16;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  _QWORD v23[6];

  v23[5] = *MEMORY[0x1E0C80C00];
  -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation street](self, "street");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation city](self, "city");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation country](self, "country");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation encodedLocation](self, "encodedLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = CFSTR("street");
  v9 = (uint64_t)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v16 = v9;
  v23[0] = v9;
  v19 = CFSTR("city");
  v10 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v9, v18, v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[1] = v10;
  v20 = CFSTR("state");
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[2] = v11;
  v21 = CFSTR("country");
  v12 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[3] = v12;
  v22 = CFSTR("encodedLocation");
  v13 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[4] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v18, 5, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v6)
      goto LABEL_13;
  }
  else
  {

    if (v6)
    {
LABEL_13:
      if (v5)
        goto LABEL_14;
      goto LABEL_19;
    }
  }

  if (v5)
  {
LABEL_14:
    if (v4)
      goto LABEL_15;
LABEL_20:

    if (v3)
      goto LABEL_16;
LABEL_21:

    goto LABEL_16;
  }
LABEL_19:

  if (!v4)
    goto LABEL_20;
LABEL_15:
  if (!v3)
    goto LABEL_21;
LABEL_16:

  return v14;
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
    -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation street](self, "street");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "street");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation street](self, "street");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "street");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_17;
    }
    -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation city](self, "city");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "city");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation city](self, "city");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "city");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_17;
    }
    -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation state](self, "state");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "state");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation state](self, "state");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "state");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_17;
    }
    -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation country](self, "country");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "country");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation country](self, "country");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "country");
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
    -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation encodedLocation](self, "encodedLocation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "encodedLocation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31 == v32)
    {
      v12 = 1;
    }
    else
    {
      -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation encodedLocation](self, "encodedLocation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "encodedLocation");
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

- (NSString)street
{
  return self->_street;
}

- (NSString)city
{
  return self->_city;
}

- (NSString)state
{
  return self->_state;
}

- (NSString)country
{
  return self->_country;
}

- (NSData)encodedLocation
{
  return self->_encodedLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedLocation, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_street, 0);
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

    v7 = -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation initByReadFrom:]([BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation alloc], "initByReadFrom:", v6);
    v7[4] = 2;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("street"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("city"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("state"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("country"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("encodedLocation"), 4, 0, 5, 14, 0);
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
  return &unk_1E5F1E5F8;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("street"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("city"), 2, 13, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("state"), 3, 13, 0);
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("country"), 4, 13, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("encodedLocation"), 5, 14, 0);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
