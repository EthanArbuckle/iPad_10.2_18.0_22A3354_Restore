@implementation BMSafariBrowsingAssistantTrialExperiment

- (BMSafariBrowsingAssistantTrialExperiment)initWithExperiment_namespace:(id)a3 experiment_id:(id)a4 treatment_id:(id)a5 deployment_id:(id)a6 allocation_status:(int)a7 compatibility_version:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  BMSafariBrowsingAssistantTrialExperiment *v19;
  uint64_t v20;
  unsigned int v21;
  id v23;
  objc_super v24;

  v23 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)BMSafariBrowsingAssistantTrialExperiment;
  v19 = -[BMEventBase init](&v24, sel_init);
  if (v19)
  {
    v19->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v19->_experiment_namespace, a3);
    objc_storeStrong((id *)&v19->_experiment_id, a4);
    objc_storeStrong((id *)&v19->_treatment_id, a5);
    if (v17)
    {
      v19->_hasDeployment_id = 1;
      v20 = objc_msgSend(v17, "longLongValue");
    }
    else
    {
      v19->_hasDeployment_id = 0;
      v20 = -1;
    }
    v19->_deployment_id = v20;
    v19->_allocation_status = a7;
    if (v18)
    {
      v19->_hasCompatibility_version = 1;
      v21 = objc_msgSend(v18, "unsignedIntValue");
    }
    else
    {
      v21 = 0;
      v19->_hasCompatibility_version = 0;
    }
    v19->_compatibility_version = v21;
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

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMSafariBrowsingAssistantTrialExperiment experiment_namespace](self, "experiment_namespace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistantTrialExperiment experiment_id](self, "experiment_id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistantTrialExperiment treatment_id](self, "treatment_id");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMSafariBrowsingAssistantTrialExperiment deployment_id](self, "deployment_id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BMSafariBrowsingAssistantTreatmentAllocationStatusAsString(-[BMSafariBrowsingAssistantTrialExperiment allocation_status](self, "allocation_status"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSafariBrowsingAssistantTrialExperiment compatibility_version](self, "compatibility_version"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSafariBrowsingAssistantTrialExperiment with experiment_namespace: %@, experiment_id: %@, treatment_id: %@, deployment_id: %@, allocation_status: %@, compatibility_version: %@"), v4, v5, v6, v7, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSafariBrowsingAssistantTrialExperiment *v5;
  int *v6;
  int *v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  BOOL v16;
  int v17;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char v22;
  unsigned int v23;
  int64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  BMSafariBrowsingAssistantTrialExperiment *v40;
  objc_super v42;

  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)BMSafariBrowsingAssistantTrialExperiment;
  v5 = -[BMEventBase init](&v42, sel_init);
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
        if (v14 == -1 || v14 >= *(_QWORD *)&v4[*v7])
          break;
        v15 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v14);
        *(_QWORD *)&v4[v13] = v14 + 1;
        v12 |= (unint64_t)(v15 & 0x7F) << v10;
        if ((v15 & 0x80) == 0)
          goto LABEL_13;
        v10 += 7;
        v16 = v11++ >= 9;
        if (v16)
        {
          v12 = 0;
          v17 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      v17 = v4[*v8];
      if (v4[*v8])
        v12 = 0;
LABEL_15:
      if (v17 || (v12 & 7) == 4)
        break;
      switch((v12 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 32;
          goto LABEL_25;
        case 2u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 40;
          goto LABEL_25;
        case 3u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 48;
LABEL_25:
          v21 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        case 4u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          v5->_hasDeployment_id = 1;
          while (2)
          {
            v25 = *v6;
            v26 = *(_QWORD *)&v4[v25];
            if (v26 == -1 || v26 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v27 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v26);
              *(_QWORD *)&v4[v25] = v26 + 1;
              v24 |= (unint64_t)(v27 & 0x7F) << v22;
              if (v27 < 0)
              {
                v22 += 7;
                v16 = v23++ >= 9;
                if (v16)
                {
                  v24 = 0;
                  goto LABEL_50;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v24 = 0;
LABEL_50:
          v5->_deployment_id = v24;
          continue;
        case 5u:
          v28 = 0;
          v29 = 0;
          v30 = 0;
          while (2)
          {
            v31 = *v6;
            v32 = *(_QWORD *)&v4[v31];
            if (v32 == -1 || v32 >= *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v33 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v32);
              *(_QWORD *)&v4[v31] = v32 + 1;
              v30 |= (unint64_t)(v33 & 0x7F) << v28;
              if (v33 < 0)
              {
                v28 += 7;
                v16 = v29++ >= 9;
                if (v16)
                {
                  LODWORD(v30) = 0;
                  goto LABEL_54;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v30) = 0;
LABEL_54:
          if (v30 >= 4)
            LODWORD(v30) = 0;
          v5->_allocation_status = v30;
          continue;
        case 6u:
          v34 = 0;
          v35 = 0;
          v36 = 0;
          v5->_hasCompatibility_version = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_63;
          continue;
      }
      while (1)
      {
        v37 = *v6;
        v38 = *(_QWORD *)&v4[v37];
        if (v38 == -1 || v38 >= *(_QWORD *)&v4[*v7])
          break;
        v39 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v38);
        *(_QWORD *)&v4[v37] = v38 + 1;
        v36 |= (unint64_t)(v39 & 0x7F) << v34;
        if ((v39 & 0x80) == 0)
          goto LABEL_58;
        v34 += 7;
        v16 = v35++ >= 9;
        if (v16)
        {
          LODWORD(v36) = 0;
          goto LABEL_60;
        }
      }
      v4[*v8] = 1;
LABEL_58:
      if (v4[*v8])
        LODWORD(v36) = 0;
LABEL_60:
      v5->_compatibility_version = v36;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_63:
    v40 = 0;
  else
LABEL_64:
    v40 = v5;

  return v40;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_experiment_namespace)
    PBDataWriterWriteStringField();
  if (self->_experiment_id)
    PBDataWriterWriteStringField();
  if (self->_treatment_id)
    PBDataWriterWriteStringField();
  if (self->_hasDeployment_id)
    PBDataWriterWriteInt64Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasCompatibility_version)
    PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSafariBrowsingAssistantTrialExperiment writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSafariBrowsingAssistantTrialExperiment)initWithJSONDictionary:(id)a3 error:(id *)a4
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
  id v16;
  id v17;
  id *v18;
  uint64_t v19;
  void *v20;
  id v21;
  BMSafariBrowsingAssistantTrialExperiment *v22;
  id v23;
  id v24;
  id *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  id *v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  id *v36;
  id v37;
  void *v38;
  id v39;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  BMSafariBrowsingAssistantTrialExperiment *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD v65[3];

  v65[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("experiment_namespace"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("experiment_id"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v20 = 0;
          v22 = 0;
          goto LABEL_45;
        }
        v23 = v8;
        v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v25 = a4;
        v26 = *MEMORY[0x1E0D025B8];
        v62 = *MEMORY[0x1E0CB2D50];
        v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("experiment_id"));
        v63 = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v24;
        v8 = v23;
        v20 = 0;
        v22 = 0;
        *v25 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v26, 2, v10);
        v11 = (id)v27;
        goto LABEL_44;
      }
      v52 = v9;
    }
    else
    {
      v52 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("treatment_id"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v11 = 0;
          v22 = 0;
          v20 = v52;
          goto LABEL_44;
        }
        v29 = v8;
        v30 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v31 = a4;
        v32 = *MEMORY[0x1E0D025B8];
        v60 = *MEMORY[0x1E0CB2D50];
        v51 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("treatment_id"));
        v61 = v51;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v30;
        v8 = v29;
        v22 = 0;
        *v31 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v32, 2, v12);
        v11 = 0;
LABEL_43:
        v20 = v52;

        self = v53;
LABEL_44:

        v7 = v50;
        goto LABEL_45;
      }
      v11 = v10;
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("deployment_id"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v8;
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v51 = 0;
          v22 = 0;
          goto LABEL_43;
        }
        v34 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v35 = *MEMORY[0x1E0D025B8];
        v58 = *MEMORY[0x1E0CB2D50];
        v36 = a4;
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("deployment_id"));
        v59 = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (id)objc_msgSend(v34, "initWithDomain:code:userInfo:", v35, 2, v13);
        v51 = 0;
        v22 = 0;
        *v36 = v37;
        goto LABEL_42;
      }
      v51 = v12;
    }
    else
    {
      v51 = 0;
    }
    v48 = v11;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("allocation_status"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = a4;
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = v13;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v15 = 0;
            v22 = 0;
            v11 = v48;
            goto LABEL_42;
          }
          v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v44 = *MEMORY[0x1E0D025B8];
          v56 = *MEMORY[0x1E0CB2D50];
          v39 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("allocation_status"));
          v57 = v39;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v44, 2, v38);
          v15 = 0;
          v22 = 0;
          *v14 = v45;
          goto LABEL_57;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSafariBrowsingAssistantTreatmentAllocationStatusFromString(v13));
        v16 = (id)objc_claimAutoreleasedReturnValue();
      }
      v15 = v16;
    }
    else
    {
      v15 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("compatibility_version"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v38 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v39 = 0;
LABEL_40:
      v11 = v48;
      v22 = -[BMSafariBrowsingAssistantTrialExperiment initWithExperiment_namespace:experiment_id:treatment_id:deployment_id:allocation_status:compatibility_version:](v53, "initWithExperiment_namespace:experiment_id:treatment_id:deployment_id:allocation_status:compatibility_version:", v49, v52, v48, v51, objc_msgSend(v15, "intValue"), v39);
      v53 = v22;
LABEL_41:

LABEL_42:
      v8 = v49;
      goto LABEL_43;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = v38;
      goto LABEL_40;
    }
    if (v14)
    {
      v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v46 = *MEMORY[0x1E0D025B8];
      v54 = *MEMORY[0x1E0CB2D50];
      v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("compatibility_version"));
      v55 = v41;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *v14 = (id)objc_msgSend(v47, "initWithDomain:code:userInfo:", v46, 2, v42);

    }
    v39 = 0;
    v22 = 0;
LABEL_57:
    v11 = v48;
    goto LABEL_41;
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
    v22 = 0;
    goto LABEL_46;
  }
  v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v18 = a4;
  v19 = *MEMORY[0x1E0D025B8];
  v64 = *MEMORY[0x1E0CB2D50];
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("experiment_namespace"));
  v65[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, &v64, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v17, "initWithDomain:code:userInfo:", v19, 2, v9);
  v8 = 0;
  v22 = 0;
  *v18 = v21;
LABEL_45:

LABEL_46:
  return v22;
}

- (id)jsonDictionary
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[6];
  _QWORD v22[7];

  v22[6] = *MEMORY[0x1E0C80C00];
  -[BMSafariBrowsingAssistantTrialExperiment experiment_namespace](self, "experiment_namespace");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistantTrialExperiment experiment_id](self, "experiment_id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSafariBrowsingAssistantTrialExperiment treatment_id](self, "treatment_id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMSafariBrowsingAssistantTrialExperiment hasDeployment_id](self, "hasDeployment_id"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMSafariBrowsingAssistantTrialExperiment deployment_id](self, "deployment_id"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSafariBrowsingAssistantTrialExperiment allocation_status](self, "allocation_status"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMSafariBrowsingAssistantTrialExperiment hasCompatibility_version](self, "hasCompatibility_version"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSafariBrowsingAssistantTrialExperiment compatibility_version](self, "compatibility_version"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v21[0] = CFSTR("experiment_namespace");
  v9 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v9;
  v20 = (void *)v3;
  v22[0] = v9;
  v21[1] = CFSTR("experiment_id");
  v10 = (uint64_t)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v17 = v10;
  v22[1] = v10;
  v21[2] = CFSTR("treatment_id");
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v10, v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[2] = v11;
  v21[3] = CFSTR("deployment_id");
  v12 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[3] = v12;
  v21[4] = CFSTR("allocation_status");
  v13 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[4] = v13;
  v21[5] = CFSTR("compatibility_version");
  v14 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[5] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 6, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v7)
      goto LABEL_21;
  }
  else
  {

    if (v7)
    {
LABEL_21:
      if (v6)
        goto LABEL_22;
      goto LABEL_29;
    }
  }

  if (v6)
  {
LABEL_22:
    if (v5)
      goto LABEL_23;
LABEL_30:

    if (v4)
      goto LABEL_24;
    goto LABEL_31;
  }
LABEL_29:

  if (!v5)
    goto LABEL_30;
LABEL_23:
  if (v4)
    goto LABEL_24;
LABEL_31:

LABEL_24:
  if (!v20)

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
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  int64_t v25;
  int v26;
  unsigned int v27;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSafariBrowsingAssistantTrialExperiment experiment_namespace](self, "experiment_namespace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "experiment_namespace");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSafariBrowsingAssistantTrialExperiment experiment_namespace](self, "experiment_namespace");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "experiment_namespace");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_26;
    }
    -[BMSafariBrowsingAssistantTrialExperiment experiment_id](self, "experiment_id");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "experiment_id");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMSafariBrowsingAssistantTrialExperiment experiment_id](self, "experiment_id");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "experiment_id");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_26;
    }
    -[BMSafariBrowsingAssistantTrialExperiment treatment_id](self, "treatment_id");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "treatment_id");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMSafariBrowsingAssistantTrialExperiment treatment_id](self, "treatment_id");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "treatment_id");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_26;
    }
    if (!-[BMSafariBrowsingAssistantTrialExperiment hasDeployment_id](self, "hasDeployment_id")
      && !objc_msgSend(v5, "hasDeployment_id")
      || -[BMSafariBrowsingAssistantTrialExperiment hasDeployment_id](self, "hasDeployment_id")
      && objc_msgSend(v5, "hasDeployment_id")
      && (v25 = -[BMSafariBrowsingAssistantTrialExperiment deployment_id](self, "deployment_id"),
          v25 == objc_msgSend(v5, "deployment_id")))
    {
      v26 = -[BMSafariBrowsingAssistantTrialExperiment allocation_status](self, "allocation_status");
      if (v26 == objc_msgSend(v5, "allocation_status"))
      {
        if (!-[BMSafariBrowsingAssistantTrialExperiment hasCompatibility_version](self, "hasCompatibility_version")
          && !objc_msgSend(v5, "hasCompatibility_version"))
        {
          v12 = 1;
          goto LABEL_27;
        }
        if (-[BMSafariBrowsingAssistantTrialExperiment hasCompatibility_version](self, "hasCompatibility_version")
          && objc_msgSend(v5, "hasCompatibility_version"))
        {
          v27 = -[BMSafariBrowsingAssistantTrialExperiment compatibility_version](self, "compatibility_version");
          v12 = v27 == objc_msgSend(v5, "compatibility_version");
LABEL_27:

          goto LABEL_28;
        }
      }
    }
LABEL_26:
    v12 = 0;
    goto LABEL_27;
  }
  v12 = 0;
LABEL_28:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)experiment_namespace
{
  return self->_experiment_namespace;
}

- (NSString)experiment_id
{
  return self->_experiment_id;
}

- (NSString)treatment_id
{
  return self->_treatment_id;
}

- (int64_t)deployment_id
{
  return self->_deployment_id;
}

- (BOOL)hasDeployment_id
{
  return self->_hasDeployment_id;
}

- (void)setHasDeployment_id:(BOOL)a3
{
  self->_hasDeployment_id = a3;
}

- (int)allocation_status
{
  return self->_allocation_status;
}

- (unsigned)compatibility_version
{
  return self->_compatibility_version;
}

- (BOOL)hasCompatibility_version
{
  return self->_hasCompatibility_version;
}

- (void)setHasCompatibility_version:(BOOL)a3
{
  self->_hasCompatibility_version = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatment_id, 0);
  objc_storeStrong((id *)&self->_experiment_id, 0);
  objc_storeStrong((id *)&self->_experiment_namespace, 0);
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

    v4 = -[BMSafariBrowsingAssistantTrialExperiment initByReadFrom:]([BMSafariBrowsingAssistantTrialExperiment alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("experiment_namespace"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("experiment_id"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("treatment_id"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("deployment_id"), 0, 0, 4, 3, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("allocation_status"), 0, 0, 5, 4, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("compatibility_version"), 0, 0, 6, 4, 0);
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
  return &unk_1E5F1D3C8;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("experiment_namespace"), 1, 13, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("experiment_id"), 2, 13, 0);
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("treatment_id"), 3, 13, 0);
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("deployment_id"), 4, 3, 0);
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("allocation_status"), 5, 4, 0);
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("compatibility_version"), 6, 4, 0);
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
