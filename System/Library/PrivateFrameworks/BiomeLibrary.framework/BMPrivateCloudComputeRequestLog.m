@implementation BMPrivateCloudComputeRequestLog

- (BMPrivateCloudComputeRequestLog)initWithTimestamp:(id)a3 requestId:(id)a4 pipelineKind:(id)a5 pipelineParameters:(id)a6 attestations:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  BMPrivateCloudComputeRequestLog *v17;
  double v18;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMPrivateCloudComputeRequestLog;
  v17 = -[BMEventBase init](&v20, sel_init);
  if (v17)
  {
    v17->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    if (v12)
    {
      v17->_hasRaw_timestamp = 1;
      objc_msgSend(v12, "timeIntervalSince1970");
    }
    else
    {
      v17->_hasRaw_timestamp = 0;
      v18 = -1.0;
    }
    v17->_raw_timestamp = v18;
    objc_storeStrong((id *)&v17->_requestId, a4);
    objc_storeStrong((id *)&v17->_pipelineKind, a5);
    objc_storeStrong((id *)&v17->_pipelineParameters, a6);
    objc_storeStrong((id *)&v17->_attestations, a7);
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
  -[BMPrivateCloudComputeRequestLog timestamp](self, "timestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPrivateCloudComputeRequestLog requestId](self, "requestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPrivateCloudComputeRequestLog pipelineKind](self, "pipelineKind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPrivateCloudComputeRequestLog pipelineParameters](self, "pipelineParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPrivateCloudComputeRequestLog attestations](self, "attestations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMPrivateCloudComputeRequestLog with timestamp: %@, requestId: %@, pipelineKind: %@, pipelineParameters: %@, attestations: %@"), v4, v5, v6, v7, v8);

  return (NSString *)v9;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMPrivateCloudComputeRequestLog *v5;
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
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  double v27;
  void *v28;
  uint64_t v29;
  NSArray *attestations;
  int v31;
  BMPrivateCloudComputeRequestLog *v32;
  objc_super v34;
  uint64_t v35;
  uint64_t v36;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)BMPrivateCloudComputeRequestLog;
  v5 = -[BMEventBase init](&v34, sel_init);
  if (!v5)
  {
LABEL_37:
    v32 = v5;
    goto LABEL_38;
  }
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] >= *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
LABEL_35:
    v29 = objc_msgSend(v6, "copy");
    attestations = v5->_attestations;
    v5->_attestations = (NSArray *)v29;

    v31 = v4[*v9];
    if (v31)
      goto LABEL_36;
    goto LABEL_37;
  }
  v10 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (v4[*v9])
      goto LABEL_35;
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
      goto LABEL_35;
    switch((v13 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 48;
        goto LABEL_31;
      case 2u:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 56;
        goto LABEL_31;
      case 3u:
        v35 = 0;
        v36 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
          goto LABEL_39;
        v23 = -[BMPrivateCloudComputeRequestLogAttestation initByReadFrom:]([BMPrivateCloudComputeRequestLogAttestation alloc], "initByReadFrom:", v4);
        if (!v23)
          goto LABEL_39;
        v24 = v23;
        objc_msgSend(v6, "addObject:", v23);
        PBReaderRecallMark();

        goto LABEL_34;
      case 4u:
        v5->_hasRaw_timestamp = 1;
        v25 = *v7;
        v26 = *(_QWORD *)&v4[v25];
        if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(_QWORD *)&v4[*v8])
        {
          v27 = *(double *)(*(_QWORD *)&v4[*v10] + v26);
          *(_QWORD *)&v4[v25] = v26 + 8;
        }
        else
        {
          v4[*v9] = 1;
          v27 = 0.0;
        }
        v5->_raw_timestamp = v27;
        goto LABEL_34;
      case 5u:
        PBReaderReadString();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = 40;
LABEL_31:
        v28 = *(Class *)((char *)&v5->super.super.isa + v22);
        *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;

        goto LABEL_34;
      default:
        if (PBReaderSkipValueWithTag())
        {
LABEL_34:
          if (*(_QWORD *)&v4[*v7] >= *(_QWORD *)&v4[*v8])
            goto LABEL_35;
          continue;
        }
LABEL_39:

LABEL_36:
        v32 = 0;
LABEL_38:

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
  if (self->_hasRaw_timestamp)
    PBDataWriterWriteDoubleField();
  if (self->_requestId)
    PBDataWriterWriteStringField();
  if (self->_pipelineKind)
    PBDataWriterWriteStringField();
  if (self->_pipelineParameters)
    PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_attestations;
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

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMPrivateCloudComputeRequestLog writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMPrivateCloudComputeRequestLog)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;
  id v10;
  id v11;
  double v12;
  double v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  BMPrivateCloudComputeRequestLogAttestation *v31;
  BMPrivateCloudComputeRequestLogAttestation *v32;
  id v33;
  void *v34;
  void *v35;
  BMPrivateCloudComputeRequestLog *v36;
  id v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  id *v52;
  id v53;
  id *v54;
  id v55;
  uint64_t v56;
  void *v57;
  id *v58;
  uint64_t *v59;
  void *v60;
  uint64_t v61;
  id v63;
  uint64_t v64;
  void *v65;
  id v66;
  uint64_t v67;
  id v68;
  id v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  BMPrivateCloudComputeRequestLog *v75;
  void *v76;
  void *v77;
  void *v78;
  id *v79;
  id *v80;
  id *v81;
  id *v82;
  id v83;
  void *v84;
  id v85;
  id v86;
  void *v87;
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint64_t v93;
  id v94;
  uint64_t v95;
  id v96;
  _BYTE v97[128];
  uint64_t v98;
  void *v99;
  uint64_t v100;
  id v101;
  uint64_t v102;
  id v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  _QWORD v107[3];

  v107[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (objc_class *)MEMORY[0x1E0C99D68];
    v10 = v7;
    v11 = [v9 alloc];
    objc_msgSend(v10, "doubleValue");
    v13 = v12;

    v14 = (id)objc_msgSend(v11, "initWithTimeIntervalSince1970:", v13);
LABEL_6:
    v8 = v14;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v8 = 0;
        v36 = 0;
        goto LABEL_63;
      }
      v66 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v82 = a4;
      v67 = *MEMORY[0x1E0D025B8];
      v106 = *MEMORY[0x1E0CB2D50];
      v68 = v6;
      v69 = objc_alloc(MEMORY[0x1E0CB3940]);
      v73 = objc_opt_class();
      v70 = v69;
      v6 = v68;
      v34 = (void *)objc_msgSend(v70, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate"), v73, CFSTR("timestamp"));
      v107[0] = v34;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v107, &v106, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 0;
      v36 = 0;
      *v82 = (id)objc_msgSend(v66, "initWithDomain:code:userInfo:", v67, 2, v16);
      goto LABEL_62;
    }
    v14 = v7;
    goto LABEL_6;
  }
  v15 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  objc_msgSend(v15, "dateFromString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("requestId"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v85 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v85 = v16;
LABEL_12:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pipelineKind"));
    v17 = objc_claimAutoreleasedReturnValue();
    v87 = (void *)v17;
    if (!v17 || (v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v83 = 0;
LABEL_15:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pipelineParameters"));
      v19 = objc_claimAutoreleasedReturnValue();
      v78 = v16;
      v84 = (void *)v19;
      if (v19 && (v20 = (void *)v19, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v86 = 0;
            v36 = 0;
            v34 = v85;
            v35 = v83;
            goto LABEL_59;
          }
          v50 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v51 = *MEMORY[0x1E0D025B8];
          v100 = *MEMORY[0x1E0CB2D50];
          v52 = a4;
          v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("pipelineParameters"));
          v101 = v21;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v101, &v100, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = (id)objc_msgSend(v50, "initWithDomain:code:userInfo:", v51, 2, v24);
          v36 = 0;
          v86 = 0;
          *v52 = v53;
          goto LABEL_56;
        }
        v79 = a4;
        v86 = v20;
      }
      else
      {
        v79 = a4;
        v86 = 0;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("attestations"));
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "isEqual:", v22);

      v77 = v8;
      if (v23)
      {
        v75 = self;
        v76 = v7;

        v21 = 0;
LABEL_25:
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v21, "count"));
        v89 = 0u;
        v90 = 0u;
        v91 = 0u;
        v92 = 0u;
        v21 = v21;
        v25 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
        if (!v25)
          goto LABEL_35;
        v26 = v25;
        v27 = *(_QWORD *)v90;
        v74 = v6;
LABEL_27:
        v28 = 0;
        while (1)
        {
          if (*(_QWORD *)v90 != v27)
            objc_enumerationMutation(v21);
          v29 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * v28);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            break;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v6 = v74;
            self = v75;
            v8 = v77;
            v54 = v79;
            if (!v79)
              goto LABEL_55;
            v55 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v56 = *MEMORY[0x1E0D025B8];
            v93 = *MEMORY[0x1E0CB2D50];
            v30 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("attestations"));
            v94 = v30;
            v57 = (void *)MEMORY[0x1E0C99D80];
            v58 = &v94;
            v59 = &v93;
            goto LABEL_50;
          }
          v30 = v29;
          v31 = [BMPrivateCloudComputeRequestLogAttestation alloc];
          v88 = 0;
          v32 = -[BMPrivateCloudComputeRequestLogAttestation initWithJSONDictionary:error:](v31, "initWithJSONDictionary:error:", v30, &v88);
          v33 = v88;
          if (v33)
          {
            v60 = v33;
            if (v79)
              *v79 = objc_retainAutorelease(v33);

            v6 = v74;
            self = v75;
            v8 = v77;
LABEL_54:

LABEL_55:
            v36 = 0;
            v7 = v76;
            goto LABEL_56;
          }
          objc_msgSend(v24, "addObject:", v32);

          if (v26 == ++v28)
          {
            v26 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
            v6 = v74;
            if (v26)
              goto LABEL_27;
LABEL_35:

            v8 = v77;
            v34 = v85;
            v35 = v83;
            self = -[BMPrivateCloudComputeRequestLog initWithTimestamp:requestId:pipelineKind:pipelineParameters:attestations:](v75, "initWithTimestamp:requestId:pipelineKind:pipelineParameters:attestations:", v77, v85, v83, v86, v24);
            v36 = self;
            v7 = v76;
LABEL_57:

            v16 = v78;
LABEL_58:

LABEL_59:
            v49 = v84;
LABEL_60:

            goto LABEL_61;
          }
        }
        v6 = v74;
        self = v75;
        v8 = v77;
        v54 = v79;
        if (!v79)
          goto LABEL_55;
        v55 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v56 = *MEMORY[0x1E0D025B8];
        v95 = *MEMORY[0x1E0CB2D50];
        v30 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("attestations"));
        v96 = v30;
        v57 = (void *)MEMORY[0x1E0C99D80];
        v58 = &v96;
        v59 = &v95;
LABEL_50:
        objc_msgSend(v57, "dictionaryWithObjects:forKeys:count:", v58, v59, 1);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v56;
        v8 = v77;
        *v54 = (id)objc_msgSend(v55, "initWithDomain:code:userInfo:", v61, 2, v60);
        goto LABEL_54;
      }
      if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v75 = self;
        v76 = v7;
        goto LABEL_25;
      }
      if (!v79)
      {
        v36 = 0;
        v34 = v85;
        v35 = v83;
        goto LABEL_58;
      }
      v63 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v64 = *MEMORY[0x1E0D025B8];
      v98 = *MEMORY[0x1E0CB2D50];
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("attestations"));
      v99 = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v99, &v98, 1);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      *v79 = (id)objc_msgSend(v63, "initWithDomain:code:userInfo:", v64, 2, v65);

      v36 = 0;
LABEL_56:
      v34 = v85;
      v35 = v83;
      goto LABEL_57;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v83 = v18;
      goto LABEL_15;
    }
    if (a4)
    {
      v42 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v81 = a4;
      v43 = *MEMORY[0x1E0D025B8];
      v102 = *MEMORY[0x1E0CB2D50];
      v44 = v16;
      v45 = objc_alloc(MEMORY[0x1E0CB3940]);
      v72 = objc_opt_class();
      v46 = v45;
      v16 = v44;
      v86 = (id)objc_msgSend(v46, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v72, CFSTR("pipelineKind"));
      v103 = v86;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1);
      v47 = objc_claimAutoreleasedReturnValue();
      v48 = v42;
      v49 = (void *)v47;
      v36 = 0;
      v35 = 0;
      *v81 = (id)objc_msgSend(v48, "initWithDomain:code:userInfo:", v43, 2, v47);
      v34 = v85;
      goto LABEL_60;
    }
    v35 = 0;
    v36 = 0;
    v34 = v85;
LABEL_61:

    goto LABEL_62;
  }
  if (a4)
  {
    v37 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v80 = a4;
    v38 = *MEMORY[0x1E0D025B8];
    v104 = *MEMORY[0x1E0CB2D50];
    v39 = v16;
    v40 = objc_alloc(MEMORY[0x1E0CB3940]);
    v71 = objc_opt_class();
    v41 = v40;
    v16 = v39;
    v35 = (void *)objc_msgSend(v41, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v71, CFSTR("requestId"));
    v105 = v35;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v105, &v104, 1);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v34 = 0;
    *v80 = (id)objc_msgSend(v37, "initWithDomain:code:userInfo:", v38, 2);
    goto LABEL_61;
  }
  v34 = 0;
  v36 = 0;
LABEL_62:

LABEL_63:
  return v36;
}

- (id)_attestationsJSONArray
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
  -[BMPrivateCloudComputeRequestLog attestations](self, "attestations", 0);
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
  -[BMPrivateCloudComputeRequestLog timestamp](self, "timestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[BMPrivateCloudComputeRequestLog timestamp](self, "timestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSince1970");
    objc_msgSend(v4, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  -[BMPrivateCloudComputeRequestLog requestId](self, "requestId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPrivateCloudComputeRequestLog pipelineKind](self, "pipelineKind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPrivateCloudComputeRequestLog pipelineParameters](self, "pipelineParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPrivateCloudComputeRequestLog _attestationsJSONArray](self, "_attestationsJSONArray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = CFSTR("timestamp");
  v11 = (uint64_t)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v18 = v11;
  v25[0] = v11;
  v21 = CFSTR("requestId");
  v12 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v11, v20, v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[1] = v12;
  v22 = CFSTR("pipelineKind");
  v13 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[2] = v13;
  v23 = CFSTR("pipelineParameters");
  v14 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[3] = v14;
  v24 = CFSTR("attestations");
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

    if (v6)
      goto LABEL_19;
LABEL_24:

    goto LABEL_19;
  }
LABEL_22:

  if (!v7)
    goto LABEL_23;
LABEL_18:
  if (!v6)
    goto LABEL_24;
LABEL_19:

  return v16;
}

- (NSDate)timestamp
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_timestamp)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_timestamp);
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
    -[BMPrivateCloudComputeRequestLog timestamp](self, "timestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timestamp");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMPrivateCloudComputeRequestLog timestamp](self, "timestamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timestamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_17;
    }
    -[BMPrivateCloudComputeRequestLog requestId](self, "requestId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestId");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMPrivateCloudComputeRequestLog requestId](self, "requestId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "requestId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_17;
    }
    -[BMPrivateCloudComputeRequestLog pipelineKind](self, "pipelineKind");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pipelineKind");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMPrivateCloudComputeRequestLog pipelineKind](self, "pipelineKind");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pipelineKind");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_17;
    }
    -[BMPrivateCloudComputeRequestLog pipelineParameters](self, "pipelineParameters");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pipelineParameters");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMPrivateCloudComputeRequestLog pipelineParameters](self, "pipelineParameters");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pipelineParameters");
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
    -[BMPrivateCloudComputeRequestLog attestations](self, "attestations");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attestations");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31 == v32)
    {
      v12 = 1;
    }
    else
    {
      -[BMPrivateCloudComputeRequestLog attestations](self, "attestations");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "attestations");
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

- (NSString)requestId
{
  return self->_requestId;
}

- (NSString)pipelineKind
{
  return self->_pipelineKind;
}

- (NSString)pipelineParameters
{
  return self->_pipelineParameters;
}

- (NSArray)attestations
{
  return self->_attestations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attestations, 0);
  objc_storeStrong((id *)&self->_pipelineParameters, 0);
  objc_storeStrong((id *)&self->_pipelineKind, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
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

    v4 = -[BMPrivateCloudComputeRequestLog initByReadFrom:]([BMPrivateCloudComputeRequestLog alloc], "initByReadFrom:", v7);
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
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("timestamp"), 3, 0, 4, 0, 2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("requestId"), 2, 0, 5, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("pipelineKind"), 2, 0, 1, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("pipelineParameters"), 2, 0, 2, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("attestations_json"), 5, 1, &__block_literal_global_77044);
  v9[0] = v4;
  v9[1] = v5;
  v9[2] = v6;
  v9[3] = v2;
  v9[4] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1E5F20068;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("timestamp"), 4, 0, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("requestId"), 5, 13, 0, v2);
  v9[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("pipelineKind"), 1, 13, 0);
  v9[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("pipelineParameters"), 2, 13, 0);
  v9[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("attestations"), 3, 14, objc_opt_class());
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __42__BMPrivateCloudComputeRequestLog_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_attestationsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
