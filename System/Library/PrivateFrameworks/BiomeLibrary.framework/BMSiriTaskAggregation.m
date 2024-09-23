@implementation BMSiriTaskAggregation

- (BMSiriTaskAggregation)initWithAbsoluteTimestamp:(id)a3 metadata:(id)a4 statistics:(id)a5 dimensions:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BMSiriTaskAggregation *v14;
  double v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BMSiriTaskAggregation;
  v14 = -[BMEventBase init](&v17, sel_init);
  if (v14)
  {
    v14->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v10)
    {
      v14->_hasAbsoluteTimestamp = 1;
      objc_msgSend(v10, "doubleValue");
    }
    else
    {
      v14->_hasAbsoluteTimestamp = 0;
      v15 = -1.0;
    }
    v14->_absoluteTimestamp = v15;
    objc_storeStrong((id *)&v14->_metadata, a4);
    objc_storeStrong((id *)&v14->_statistics, a5);
    objc_storeStrong((id *)&v14->_dimensions, a6);
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
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriTaskAggregation absoluteTimestamp](self, "absoluteTimestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriTaskAggregation metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriTaskAggregation statistics](self, "statistics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriTaskAggregation dimensions](self, "dimensions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriTaskAggregation with absoluteTimestamp: %@, metadata: %@, statistics: %@, dimensions: %@"), v5, v6, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriTaskAggregation *v5;
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
  BMSiriTaskAggregation *v26;
  objc_super v28;
  uint64_t v29;
  uint64_t v30;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)BMSiriTaskAggregation;
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
          v5->_hasAbsoluteTimestamp = 1;
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
          v5->_absoluteTimestamp = v22;
          break;
        case 2u:
          v29 = 0;
          v30 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_39;
          v23 = -[BMSiriTaskAggregationMetadata initByReadFrom:]([BMSiriTaskAggregationMetadata alloc], "initByReadFrom:", v4);
          if (!v23)
            goto LABEL_39;
          v24 = 32;
          goto LABEL_34;
        case 3u:
          v29 = 0;
          v30 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_39;
          v23 = -[BMSiriTaskAggregationStatistics initByReadFrom:]([BMSiriTaskAggregationStatistics alloc], "initByReadFrom:", v4);
          if (!v23)
            goto LABEL_39;
          v24 = 40;
          goto LABEL_34;
        case 4u:
          v29 = 0;
          v30 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_39;
          v23 = -[BMSiriTaskAggregationDimensions initByReadFrom:]([BMSiriTaskAggregationDimensions alloc], "initByReadFrom:", v4);
          if (!v23)
            goto LABEL_39;
          v24 = 48;
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
  if (self->_hasAbsoluteTimestamp)
    PBDataWriterWriteDoubleField();
  if (self->_metadata)
  {
    PBDataWriterPlaceMark();
    -[BMSiriTaskAggregationMetadata writeTo:](self->_metadata, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_statistics)
  {
    PBDataWriterPlaceMark();
    -[BMSiriTaskAggregationStatistics writeTo:](self->_statistics, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_dimensions)
  {
    PBDataWriterPlaceMark();
    -[BMSiriTaskAggregationDimensions writeTo:](self->_dimensions, "writeTo:", v4);
    PBDataWriterRecallMark();
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriTaskAggregation writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriTaskAggregation)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  BMSiriTaskAggregationMetadata *v9;
  void *v10;
  BMSiriTaskAggregationStatistics *v11;
  id v12;
  BMSiriTaskAggregationDimensions *v13;
  BMSiriTaskAggregation *v14;
  BMSiriTaskAggregation *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v32;
  uint64_t v33;
  BMSiriTaskAggregationMetadata *v34;
  id v35;
  id v36;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  BMSiriTaskAggregationDimensions *v42;
  uint64_t v43;
  BMSiriTaskAggregationStatistics *v44;
  uint64_t v45;
  BMSiriTaskAggregationMetadata *v46;
  uint64_t v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v15 = 0;
        v7 = 0;
        v14 = self;
        goto LABEL_47;
      }
      v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v22 = *MEMORY[0x1E0D025B8];
      v47 = *MEMORY[0x1E0CB2D50];
      v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("absoluteTimestamp"));
      v48[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
      v9 = (BMSiriTaskAggregationMetadata *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      v7 = 0;
      *a4 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 2, v9);
      goto LABEL_36;
    }
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("metadata"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = 0;
LABEL_7:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("statistics"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v7;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v15 = 0;
          v14 = self;
          goto LABEL_44;
        }
        v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v29 = *MEMORY[0x1E0D025B8];
        v43 = *MEMORY[0x1E0CB2D50];
        v11 = (BMSiriTaskAggregationStatistics *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("statistics"));
        v44 = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v15 = 0;
        *a4 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v29, 2, v12);
        goto LABEL_42;
      }
      v12 = v10;
      v39 = 0;
      v11 = -[BMSiriTaskAggregationStatistics initWithJSONDictionary:error:]([BMSiriTaskAggregationStatistics alloc], "initWithJSONDictionary:error:", v12, &v39);
      v19 = v39;
      if (v19)
      {
        v20 = v19;
        if (a4)
          *a4 = objc_retainAutorelease(v19);

LABEL_41:
        v15 = 0;
LABEL_42:
        v14 = self;
        goto LABEL_43;
      }

    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dimensions"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v13 = 0;
LABEL_13:
      v14 = -[BMSiriTaskAggregation initWithAbsoluteTimestamp:metadata:statistics:dimensions:](self, "initWithAbsoluteTimestamp:metadata:statistics:dimensions:", v36, v9, v11, v13);
      v15 = v14;
LABEL_14:

LABEL_43:
LABEL_44:

      v16 = v8;
      v7 = v36;
      goto LABEL_45;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = v9;
      v23 = v12;
      v38 = 0;
      v13 = -[BMSiriTaskAggregationDimensions initWithJSONDictionary:error:]([BMSiriTaskAggregationDimensions alloc], "initWithJSONDictionary:error:", v23, &v38);
      v24 = v38;
      if (v24)
      {
        v25 = v24;
        if (a4)
          *a4 = objc_retainAutorelease(v24);

        v15 = 0;
        v14 = self;
        v9 = v34;
        goto LABEL_14;
      }

      v9 = v34;
      goto LABEL_13;
    }
    if (a4)
    {
      v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v33 = *MEMORY[0x1E0D025B8];
      v41 = *MEMORY[0x1E0CB2D50];
      v13 = (BMSiriTaskAggregationDimensions *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("dimensions"));
      v42 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v33, 2, v30);

      v15 = 0;
      v14 = self;
      goto LABEL_14;
    }
    goto LABEL_41;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v8;
    v40 = 0;
    v9 = -[BMSiriTaskAggregationMetadata initWithJSONDictionary:error:]([BMSiriTaskAggregationMetadata alloc], "initWithJSONDictionary:error:", v16, &v40);
    v17 = v40;
    if (!v17)
    {

      goto LABEL_7;
    }
    v18 = v17;
    if (a4)
      *a4 = objc_retainAutorelease(v17);

    v15 = 0;
  }
  else
  {
    if (!a4)
    {
      v15 = 0;
      v14 = self;
      goto LABEL_46;
    }
    v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v27 = *MEMORY[0x1E0D025B8];
    v45 = *MEMORY[0x1E0CB2D50];
    v9 = (BMSiriTaskAggregationMetadata *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("metadata"));
    v46 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v27, 2, v28);

    v15 = 0;
    v16 = v8;
  }
LABEL_36:
  v14 = self;
LABEL_45:

  v8 = v16;
LABEL_46:

LABEL_47:
  return v15;
}

- (id)jsonDictionary
{
  double v3;
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
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  if (!-[BMSiriTaskAggregation hasAbsoluteTimestamp](self, "hasAbsoluteTimestamp")
    || (-[BMSiriTaskAggregation absoluteTimestamp](self, "absoluteTimestamp"), fabs(v3) == INFINITY))
  {
    v5 = 0;
  }
  else
  {
    -[BMSiriTaskAggregation absoluteTimestamp](self, "absoluteTimestamp");
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriTaskAggregation absoluteTimestamp](self, "absoluteTimestamp");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BMSiriTaskAggregation metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "jsonDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMSiriTaskAggregation statistics](self, "statistics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "jsonDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMSiriTaskAggregation dimensions](self, "dimensions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "jsonDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = CFSTR("absoluteTimestamp");
  v12 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19[0] = v12;
  v18[1] = CFSTR("metadata");
  v13 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19[1] = v13;
  v18[2] = CFSTR("statistics");
  v14 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19[2] = v14;
  v18[3] = CFSTR("dimensions");
  v15 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v9)
      goto LABEL_15;
  }
  else
  {

    if (v9)
    {
LABEL_15:
      if (v7)
        goto LABEL_16;
LABEL_20:

      if (v5)
        goto LABEL_17;
LABEL_21:

      goto LABEL_17;
    }
  }

  if (!v7)
    goto LABEL_20;
LABEL_16:
  if (!v5)
    goto LABEL_21;
LABEL_17:

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMSiriTaskAggregation hasAbsoluteTimestamp](self, "hasAbsoluteTimestamp")
      || objc_msgSend(v5, "hasAbsoluteTimestamp"))
    {
      if (!-[BMSiriTaskAggregation hasAbsoluteTimestamp](self, "hasAbsoluteTimestamp"))
        goto LABEL_14;
      if (!objc_msgSend(v5, "hasAbsoluteTimestamp"))
        goto LABEL_14;
      -[BMSiriTaskAggregation absoluteTimestamp](self, "absoluteTimestamp");
      v7 = v6;
      objc_msgSend(v5, "absoluteTimestamp");
      if (v7 != v8)
        goto LABEL_14;
    }
    -[BMSiriTaskAggregation metadata](self, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "metadata");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v9 == (void *)v10)
    {

    }
    else
    {
      v11 = (void *)v10;
      -[BMSiriTaskAggregation metadata](self, "metadata");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "metadata");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if (!v14)
        goto LABEL_14;
    }
    -[BMSiriTaskAggregation statistics](self, "statistics");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "statistics");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v16 == (void *)v17)
    {

    }
    else
    {
      v18 = (void *)v17;
      -[BMSiriTaskAggregation statistics](self, "statistics");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "statistics");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isEqual:", v20);

      if (!v21)
      {
LABEL_14:
        v15 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    -[BMSiriTaskAggregation dimensions](self, "dimensions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dimensions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23 == v24)
    {
      v15 = 1;
    }
    else
    {
      -[BMSiriTaskAggregation dimensions](self, "dimensions");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dimensions");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v25, "isEqual:", v26);

    }
    goto LABEL_15;
  }
  v15 = 0;
LABEL_16:

  return v15;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (BOOL)hasAbsoluteTimestamp
{
  return self->_hasAbsoluteTimestamp;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  self->_hasAbsoluteTimestamp = a3;
}

- (BMSiriTaskAggregationMetadata)metadata
{
  return self->_metadata;
}

- (BMSiriTaskAggregationStatistics)statistics
{
  return self->_statistics;
}

- (BMSiriTaskAggregationDimensions)dimensions
{
  return self->_dimensions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimensions, 0);
  objc_storeStrong((id *)&self->_statistics, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
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

    v4 = -[BMSiriTaskAggregation initByReadFrom:]([BMSiriTaskAggregation alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 1, 0, 1, 0, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("metadata_json"), 5, 1, &__block_literal_global_272);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("statistics_json"), 5, 1, &__block_literal_global_273);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("dimensions_json"), 5, 1, &__block_literal_global_274);
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
  return &unk_1E5F1F0A8;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 1, 0, 0);
  v8[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("metadata"), 2, 14, objc_opt_class());
  v8[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("statistics"), 3, 14, objc_opt_class());
  v8[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("dimensions"), 4, 14, objc_opt_class());
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __32__BMSiriTaskAggregation_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dimensions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __32__BMSiriTaskAggregation_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "statistics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __32__BMSiriTaskAggregation_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
