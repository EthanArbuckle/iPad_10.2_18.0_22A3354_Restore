@implementation BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval

- (BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval)initWithStartTimestampInSecondsSince1970:(id)a3 numberOfSeconds:(id)a4
{
  id v6;
  id v7;
  BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval *v8;
  uint64_t v9;
  unsigned int v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval;
  v8 = -[BMEventBase init](&v12, sel_init);
  if (v8)
  {
    v8->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v6)
    {
      v8->_hasStartTimestampInSecondsSince1970 = 1;
      v9 = objc_msgSend(v6, "unsignedLongLongValue");
    }
    else
    {
      v9 = 0;
      v8->_hasStartTimestampInSecondsSince1970 = 0;
    }
    v8->_startTimestampInSecondsSince1970 = v9;
    if (v7)
    {
      v8->_hasNumberOfSeconds = 1;
      v10 = objc_msgSend(v7, "unsignedIntValue");
    }
    else
    {
      v10 = 0;
      v8->_hasNumberOfSeconds = 0;
    }
    v8->_numberOfSeconds = v10;
  }

  return v8;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval startTimestampInSecondsSince1970](self, "startTimestampInSecondsSince1970"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval numberOfSeconds](self, "numberOfSeconds"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval with startTimestampInSecondsSince1970: %@, numberOfSeconds: %@"), v4, v5);

  return (NSString *)v6;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval *v5;
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
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval *v34;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval;
  v5 = -[BMEventBase init](&v36, sel_init);
  if (!v5)
    goto LABEL_48;
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
      if ((v12 >> 3) == 2)
      {
        v27 = 0;
        v28 = 0;
        v29 = 0;
        v5->_hasNumberOfSeconds = 1;
        while (1)
        {
          v30 = *v6;
          v31 = *(_QWORD *)&v4[v30];
          v32 = v31 + 1;
          if (v31 == -1 || v32 > *(_QWORD *)&v4[*v7])
            break;
          v33 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v31);
          *(_QWORD *)&v4[v30] = v32;
          v29 |= (unint64_t)(v33 & 0x7F) << v27;
          if ((v33 & 0x80) == 0)
            goto LABEL_42;
          v27 += 7;
          v17 = v28++ >= 9;
          if (v17)
          {
            LODWORD(v29) = 0;
            goto LABEL_44;
          }
        }
        v4[*v8] = 1;
LABEL_42:
        if (v4[*v8])
          LODWORD(v29) = 0;
LABEL_44:
        v5->_numberOfSeconds = v29;
      }
      else if ((v12 >> 3) == 1)
      {
        v20 = 0;
        v21 = 0;
        v22 = 0;
        v5->_hasStartTimestampInSecondsSince1970 = 1;
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
            goto LABEL_38;
          v20 += 7;
          v17 = v21++ >= 9;
          if (v17)
          {
            v22 = 0;
            goto LABEL_40;
          }
        }
        v4[*v8] = 1;
LABEL_38:
        if (v4[*v8])
          v22 = 0;
LABEL_40:
        v5->_startTimestampInSecondsSince1970 = v22;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_47;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_47:
    v34 = 0;
  else
LABEL_48:
    v34 = v5;

  return v34;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_hasStartTimestampInSecondsSince1970)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }
  if (self->_hasNumberOfSeconds)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval *v11;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("startTimestampInSecondsSince1970"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v11 = 0;
        v8 = 0;
        goto LABEL_9;
      }
      v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v14 = *MEMORY[0x1E0D025B8];
      v22 = *MEMORY[0x1E0CB2D50];
      v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("startTimestampInSecondsSince1970"));
      v23[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (id)objc_msgSend(v13, "initWithDomain:code:userInfo:", v14, 2, v9);
      v11 = 0;
      v8 = 0;
      *a4 = v15;
      goto LABEL_8;
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("numberOfSeconds"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v17 = *MEMORY[0x1E0D025B8];
        v20 = *MEMORY[0x1E0CB2D50];
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("numberOfSeconds"));
        v21 = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v16, "initWithDomain:code:userInfo:", v17, 2, v19);

      }
      v10 = 0;
      v11 = 0;
      goto LABEL_8;
    }
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }
  self = -[BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval initWithStartTimestampInSecondsSince1970:numberOfSeconds:](self, "initWithStartTimestampInSecondsSince1970:numberOfSeconds:", v8, v10);
  v11 = self;
LABEL_8:

LABEL_9:
  return v11;
}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  if (-[BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval hasStartTimestampInSecondsSince1970](self, "hasStartTimestampInSecondsSince1970"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval startTimestampInSecondsSince1970](self, "startTimestampInSecondsSince1970"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (-[BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval hasNumberOfSeconds](self, "hasNumberOfSeconds"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval numberOfSeconds](self, "numberOfSeconds"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v9[0] = CFSTR("startTimestampInSecondsSince1970");
  v5 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("numberOfSeconds");
  v10[0] = v5;
  v6 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {

    if (v3)
      goto LABEL_13;
LABEL_15:

    goto LABEL_13;
  }
  if (!v3)
    goto LABEL_15;
LABEL_13:

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  unsigned int v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval hasStartTimestampInSecondsSince1970](self, "hasStartTimestampInSecondsSince1970")|| objc_msgSend(v5, "hasStartTimestampInSecondsSince1970"))
    {
      if (!-[BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval hasStartTimestampInSecondsSince1970](self, "hasStartTimestampInSecondsSince1970"))goto LABEL_13;
      if (!objc_msgSend(v5, "hasStartTimestampInSecondsSince1970"))
        goto LABEL_13;
      v6 = -[BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval startTimestampInSecondsSince1970](self, "startTimestampInSecondsSince1970");
      if (v6 != objc_msgSend(v5, "startTimestampInSecondsSince1970"))
        goto LABEL_13;
    }
    if (!-[BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval hasNumberOfSeconds](self, "hasNumberOfSeconds")&& !objc_msgSend(v5, "hasNumberOfSeconds"))
    {
      v8 = 1;
      goto LABEL_14;
    }
    if (-[BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval hasNumberOfSeconds](self, "hasNumberOfSeconds")&& objc_msgSend(v5, "hasNumberOfSeconds"))
    {
      v7 = -[BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval numberOfSeconds](self, "numberOfSeconds");
      v8 = v7 == objc_msgSend(v5, "numberOfSeconds");
    }
    else
    {
LABEL_13:
      v8 = 0;
    }
LABEL_14:

    goto LABEL_15;
  }
  v8 = 0;
LABEL_15:

  return v8;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (unint64_t)startTimestampInSecondsSince1970
{
  return self->_startTimestampInSecondsSince1970;
}

- (BOOL)hasStartTimestampInSecondsSince1970
{
  return self->_hasStartTimestampInSecondsSince1970;
}

- (void)setHasStartTimestampInSecondsSince1970:(BOOL)a3
{
  self->_hasStartTimestampInSecondsSince1970 = a3;
}

- (unsigned)numberOfSeconds
{
  return self->_numberOfSeconds;
}

- (BOOL)hasNumberOfSeconds
{
  return self->_hasNumberOfSeconds;
}

- (void)setHasNumberOfSeconds:(BOOL)a3
{
  self->_hasNumberOfSeconds = a3;
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

    v4 = -[BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval initByReadFrom:]([BMSiriOnDeviceDigestExperimentMetricsEventMetadataTimeInterval alloc], "initByReadFrom:", v7);
    v4[5] = 0;

  }
  return v4;
}

+ (id)columns
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("startTimestampInSecondsSince1970"), 0, 0, 1, 5, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("numberOfSeconds"), 0, 0, 2, 4, 0);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1D860;
}

+ (id)protoFields
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("startTimestampInSecondsSince1970"), 1, 5, 0);
  v6[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("numberOfSeconds"), 2, 4, 0);
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
