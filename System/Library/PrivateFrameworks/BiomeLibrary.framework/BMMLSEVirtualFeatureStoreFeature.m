@implementation BMMLSEVirtualFeatureStoreFeature

- (BMMLSEVirtualFeatureStoreFeature)initWithFeatureName:(int)a3 featureValue:(id)a4 featureItselfVersion:(id)a5 featureFreshnessInHours:(id)a6 eventVolumeToComputeFeature:(id)a7 timeSpentToComputeFeature:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  BMMLSEVirtualFeatureStoreFeature *v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  objc_super v26;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v26.receiver = self;
  v26.super_class = (Class)BMMLSEVirtualFeatureStoreFeature;
  v20 = -[BMEventBase init](&v26, sel_init);
  if (v20)
  {
    v20->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    v20->_featureName = a3;
    objc_storeStrong((id *)&v20->_featureValue, a4);
    if (v16)
    {
      v20->_hasFeatureItselfVersion = 1;
      v21 = objc_msgSend(v16, "unsignedIntValue");
    }
    else
    {
      v21 = 0;
      v20->_hasFeatureItselfVersion = 0;
    }
    v20->_featureItselfVersion = v21;
    if (v17)
    {
      v20->_hasFeatureFreshnessInHours = 1;
      v22 = objc_msgSend(v17, "unsignedIntValue");
    }
    else
    {
      v22 = 0;
      v20->_hasFeatureFreshnessInHours = 0;
    }
    v20->_featureFreshnessInHours = v22;
    if (v18)
    {
      v20->_hasEventVolumeToComputeFeature = 1;
      v23 = objc_msgSend(v18, "unsignedIntValue");
    }
    else
    {
      v23 = 0;
      v20->_hasEventVolumeToComputeFeature = 0;
    }
    v20->_eventVolumeToComputeFeature = v23;
    if (v19)
    {
      v20->_hasTimeSpentToComputeFeature = 1;
      v24 = objc_msgSend(v19, "unsignedIntValue");
    }
    else
    {
      v24 = 0;
      v20->_hasTimeSpentToComputeFeature = 0;
    }
    v20->_timeSpentToComputeFeature = v24;
  }

  return v20;
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
  BMMLSEVirtualFeatureStoreFeaturefeatureNameAsString(-[BMMLSEVirtualFeatureStoreFeature featureName](self, "featureName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSEVirtualFeatureStoreFeature featureValue](self, "featureValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMMLSEVirtualFeatureStoreFeature featureItselfVersion](self, "featureItselfVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMMLSEVirtualFeatureStoreFeature featureFreshnessInHours](self, "featureFreshnessInHours"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMMLSEVirtualFeatureStoreFeature eventVolumeToComputeFeature](self, "eventVolumeToComputeFeature"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMMLSEVirtualFeatureStoreFeature timeSpentToComputeFeature](self, "timeSpentToComputeFeature"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMLSEVirtualFeatureStoreFeature with featureName: %@, featureValue: %@, featureItselfVersion: %@, featureFreshnessInHours: %@, eventVolumeToComputeFeature: %@, timeSpentToComputeFeature: %@"), v4, v5, v6, v7, v8, v9);

  return (NSString *)v10;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMLSEVirtualFeatureStoreFeature *v5;
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
  BMMLSEVirtualFeatureStoreFeatureFeatureValue *v27;
  BMMLSEVirtualFeatureStoreFeatureFeatureValue *featureValue;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  char v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  uint64_t v54;
  BMMLSEVirtualFeatureStoreFeature *v55;
  objc_super v57;
  uint64_t v58;
  uint64_t v59;

  v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)BMMLSEVirtualFeatureStoreFeature;
  v5 = -[BMEventBase init](&v57, sel_init);
  if (!v5)
    goto LABEL_86;
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
          while (2)
          {
            v23 = *v6;
            v24 = *(_QWORD *)&v4[v23];
            v25 = v24 + 1;
            if (v24 == -1 || v25 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v26 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v24);
              *(_QWORD *)&v4[v23] = v25;
              v22 |= (unint64_t)(v26 & 0x7F) << v20;
              if (v26 < 0)
              {
                v20 += 7;
                v17 = v21++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_63;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v22) = 0;
LABEL_63:
          if (v22 >= 0x2C6)
            LODWORD(v22) = 0;
          v5->_featureName = v22;
          continue;
        case 2u:
          v58 = 0;
          v59 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_85;
          v27 = -[BMMLSEVirtualFeatureStoreFeatureFeatureValue initByReadFrom:]([BMMLSEVirtualFeatureStoreFeatureFeatureValue alloc], "initByReadFrom:", v4);
          if (!v27)
            goto LABEL_85;
          featureValue = v5->_featureValue;
          v5->_featureValue = v27;

          PBReaderRecallMark();
          continue;
        case 3u:
          v29 = 0;
          v30 = 0;
          v31 = 0;
          v5->_hasFeatureItselfVersion = 1;
          while (1)
          {
            v32 = *v6;
            v33 = *(_QWORD *)&v4[v32];
            v34 = v33 + 1;
            if (v33 == -1 || v34 > *(_QWORD *)&v4[*v7])
              break;
            v35 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v33);
            *(_QWORD *)&v4[v32] = v34;
            v31 |= (unint64_t)(v35 & 0x7F) << v29;
            if ((v35 & 0x80) == 0)
              goto LABEL_67;
            v29 += 7;
            v17 = v30++ >= 9;
            if (v17)
            {
              LODWORD(v31) = 0;
              goto LABEL_69;
            }
          }
          v4[*v8] = 1;
LABEL_67:
          if (v4[*v8])
            LODWORD(v31) = 0;
LABEL_69:
          v54 = 28;
          goto LABEL_82;
        case 4u:
          v36 = 0;
          v37 = 0;
          v31 = 0;
          v5->_hasFeatureFreshnessInHours = 1;
          while (2)
          {
            v38 = *v6;
            v39 = *(_QWORD *)&v4[v38];
            v40 = v39 + 1;
            if (v39 == -1 || v40 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v41 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v39);
              *(_QWORD *)&v4[v38] = v40;
              v31 |= (unint64_t)(v41 & 0x7F) << v36;
              if (v41 < 0)
              {
                v36 += 7;
                v17 = v37++ >= 9;
                if (v17)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_73;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v31) = 0;
LABEL_73:
          v54 = 32;
          goto LABEL_82;
        case 5u:
          v42 = 0;
          v43 = 0;
          v31 = 0;
          v5->_hasEventVolumeToComputeFeature = 1;
          while (2)
          {
            v44 = *v6;
            v45 = *(_QWORD *)&v4[v44];
            v46 = v45 + 1;
            if (v45 == -1 || v46 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v47 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v45);
              *(_QWORD *)&v4[v44] = v46;
              v31 |= (unint64_t)(v47 & 0x7F) << v42;
              if (v47 < 0)
              {
                v42 += 7;
                v17 = v43++ >= 9;
                if (v17)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_77;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v31) = 0;
LABEL_77:
          v54 = 36;
          goto LABEL_82;
        case 6u:
          v48 = 0;
          v49 = 0;
          v31 = 0;
          v5->_hasTimeSpentToComputeFeature = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_85;
          continue;
      }
      while (1)
      {
        v50 = *v6;
        v51 = *(_QWORD *)&v4[v50];
        v52 = v51 + 1;
        if (v51 == -1 || v52 > *(_QWORD *)&v4[*v7])
          break;
        v53 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v51);
        *(_QWORD *)&v4[v50] = v52;
        v31 |= (unint64_t)(v53 & 0x7F) << v48;
        if ((v53 & 0x80) == 0)
          goto LABEL_79;
        v48 += 7;
        v17 = v49++ >= 9;
        if (v17)
        {
          LODWORD(v31) = 0;
          goto LABEL_81;
        }
      }
      v4[*v8] = 1;
LABEL_79:
      if (v4[*v8])
        LODWORD(v31) = 0;
LABEL_81:
      v54 = 40;
LABEL_82:
      *(_DWORD *)((char *)&v5->super.super.isa + v54) = v31;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_85:
    v55 = 0;
  else
LABEL_86:
    v55 = v5;

  return v55;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_featureValue)
  {
    PBDataWriterPlaceMark();
    -[BMMLSEVirtualFeatureStoreFeatureFeatureValue writeTo:](self->_featureValue, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_hasFeatureItselfVersion)
    PBDataWriterWriteUint32Field();
  if (self->_hasFeatureFreshnessInHours)
    PBDataWriterWriteUint32Field();
  if (self->_hasEventVolumeToComputeFeature)
    PBDataWriterWriteUint32Field();
  if (self->_hasTimeSpentToComputeFeature)
    PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMLSEVirtualFeatureStoreFeature writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMLSEVirtualFeatureStoreFeature)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  BMMLSEVirtualFeatureStoreFeatureFeatureValue *v10;
  void *v11;
  void *v12;
  id *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  BMMLSEVirtualFeatureStoreFeature *v19;
  id v20;
  id v21;
  void *v22;
  id *v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id *v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  uint64_t v41;
  id *v42;
  void *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  BMMLSEVirtualFeatureStoreFeatureFeatureValue *v60;
  id v61;
  id v62;
  id *v63;
  id v64;
  BMMLSEVirtualFeatureStoreFeature *v65;
  id v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD v78[3];

  v78[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("featureName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
    }
    else
    {
      v23 = a4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v8 = 0;
          v19 = 0;
          goto LABEL_58;
        }
        v45 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v46 = *MEMORY[0x1E0D025B8];
        v77 = *MEMORY[0x1E0CB2D50];
        v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("featureName"));
        v78[0] = v20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, &v77, 1);
        v47 = objc_claimAutoreleasedReturnValue();
        v8 = 0;
        v19 = 0;
        *v23 = (id)objc_msgSend(v45, "initWithDomain:code:userInfo:", v46, 2, v47);
        v10 = (BMMLSEVirtualFeatureStoreFeatureFeatureValue *)v47;
        goto LABEL_56;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMLSEVirtualFeatureStoreFeaturefeatureNameFromString(v7));
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("featureValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v19 = 0;
        goto LABEL_57;
      }
      v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v63 = a4;
      v25 = *MEMORY[0x1E0D025B8];
      v75 = *MEMORY[0x1E0CB2D50];
      v26 = v7;
      v27 = v8;
      v28 = objc_alloc(MEMORY[0x1E0CB3940]);
      v53 = objc_opt_class();
      v29 = v28;
      v8 = v27;
      v7 = v26;
      v76 = objc_msgSend(v29, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), v53, CFSTR("featureValue"));
      v10 = (BMMLSEVirtualFeatureStoreFeatureFeatureValue *)v76;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *v63 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v25, 2, v30);

      v19 = 0;
      goto LABEL_55;
    }
    v20 = v9;
    v66 = 0;
    v10 = -[BMMLSEVirtualFeatureStoreFeatureFeatureValue initWithJSONDictionary:error:]([BMMLSEVirtualFeatureStoreFeatureFeatureValue alloc], "initWithJSONDictionary:error:", v20, &v66);
    v21 = v66;
    if (v21)
    {
      v22 = v21;
      if (a4)
        *a4 = objc_retainAutorelease(v21);

      v19 = 0;
      goto LABEL_56;
    }

  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("featureItselfVersion"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = self;
  v60 = v10;
  if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v62 = 0;
LABEL_10:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("featureFreshnessInHours"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v11;
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v61 = 0;
          v19 = 0;
          goto LABEL_53;
        }
        v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v39 = v7;
        v40 = v8;
        v41 = *MEMORY[0x1E0D025B8];
        v71 = *MEMORY[0x1E0CB2D50];
        v42 = a4;
        v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("featureFreshnessInHours"));
        v72 = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v38;
        v11 = v59;
        v44 = v41;
        v8 = v40;
        v7 = v39;
        v19 = 0;
        v61 = 0;
        *v42 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v44, 2, v14);
        goto LABEL_65;
      }
      v13 = a4;
      v61 = v12;
    }
    else
    {
      v13 = a4;
      v61 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("eventVolumeToComputeFeature"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v7;
    if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v15 = v8;
      v16 = 0;
      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = v8;
      v16 = v14;
LABEL_16:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timeSpentToComputeFeature"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v18 = 0;
LABEL_19:
        v10 = v60;
        v19 = -[BMMLSEVirtualFeatureStoreFeature initWithFeatureName:featureValue:featureItselfVersion:featureFreshnessInHours:eventVolumeToComputeFeature:timeSpentToComputeFeature:](v65, "initWithFeatureName:featureValue:featureItselfVersion:featureFreshnessInHours:eventVolumeToComputeFeature:timeSpentToComputeFeature:", objc_msgSend(v15, "intValue"), v60, v62, v61, v16, v18);
        v65 = v19;
LABEL_51:

        v8 = v15;
        v7 = v58;
        v11 = v59;
LABEL_52:

        goto LABEL_53;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = v17;
        goto LABEL_19;
      }
      if (v13)
      {
        v57 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v55 = *MEMORY[0x1E0D025B8];
        v67 = *MEMORY[0x1E0CB2D50];
        v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("timeSpentToComputeFeature"));
        v68 = v50;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *v13 = (id)objc_msgSend(v57, "initWithDomain:code:userInfo:", v55, 2, v51);

      }
      v18 = 0;
      v19 = 0;
LABEL_50:
      v10 = v60;
      goto LABEL_51;
    }
    if (v13)
    {
      v15 = v8;
      v56 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v48 = *MEMORY[0x1E0D025B8];
      v69 = *MEMORY[0x1E0CB2D50];
      v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("eventVolumeToComputeFeature"));
      v70 = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = (id)objc_msgSend(v56, "initWithDomain:code:userInfo:", v48, 2, v17);
      v19 = 0;
      v16 = 0;
      *v13 = v49;
      goto LABEL_50;
    }
    v16 = 0;
    v19 = 0;
LABEL_65:
    v10 = v60;
    goto LABEL_52;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v62 = v11;
    goto LABEL_10;
  }
  if (!a4)
  {
    v19 = 0;
    v62 = 0;
    goto LABEL_54;
  }
  v64 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v31 = a4;
  v32 = *MEMORY[0x1E0D025B8];
  v73 = *MEMORY[0x1E0CB2D50];
  v33 = v7;
  v34 = v8;
  v35 = objc_alloc(MEMORY[0x1E0CB3940]);
  v54 = objc_opt_class();
  v36 = v35;
  v8 = v34;
  v7 = v33;
  v61 = (id)objc_msgSend(v36, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v54, CFSTR("featureItselfVersion"));
  v74 = v61;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (id)objc_msgSend(v64, "initWithDomain:code:userInfo:", v32, 2, v12);
  v19 = 0;
  v62 = 0;
  *v31 = v37;
  v10 = v60;
LABEL_53:

  self = v65;
LABEL_54:

LABEL_55:
  v20 = v9;
LABEL_56:

  v9 = v20;
LABEL_57:

LABEL_58:
  return v19;
}

- (id)jsonDictionary
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[6];
  _QWORD v23[7];

  v23[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMLSEVirtualFeatureStoreFeature featureName](self, "featureName"));
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMMLSEVirtualFeatureStoreFeature featureValue](self, "featureValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "jsonDictionary");
  v5 = objc_claimAutoreleasedReturnValue();

  if (-[BMMLSEVirtualFeatureStoreFeature hasFeatureItselfVersion](self, "hasFeatureItselfVersion"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMMLSEVirtualFeatureStoreFeature featureItselfVersion](self, "featureItselfVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (-[BMMLSEVirtualFeatureStoreFeature hasFeatureFreshnessInHours](self, "hasFeatureFreshnessInHours"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMMLSEVirtualFeatureStoreFeature featureFreshnessInHours](self, "featureFreshnessInHours"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if (-[BMMLSEVirtualFeatureStoreFeature hasEventVolumeToComputeFeature](self, "hasEventVolumeToComputeFeature"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMMLSEVirtualFeatureStoreFeature eventVolumeToComputeFeature](self, "eventVolumeToComputeFeature"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  if (-[BMMLSEVirtualFeatureStoreFeature hasTimeSpentToComputeFeature](self, "hasTimeSpentToComputeFeature"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMMLSEVirtualFeatureStoreFeature timeSpentToComputeFeature](self, "timeSpentToComputeFeature"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v22[0] = CFSTR("featureName");
  v10 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v18 = v10;
  v20 = (void *)v5;
  v23[0] = v10;
  v22[1] = CFSTR("featureValue");
  v11 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[1] = v11;
  v22[2] = CFSTR("featureItselfVersion");
  v12 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v3;
  v23[2] = v12;
  v22[3] = CFSTR("featureFreshnessInHours");
  v13 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[3] = v13;
  v22[4] = CFSTR("eventVolumeToComputeFeature");
  v14 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[4] = v14;
  v22[5] = CFSTR("timeSpentToComputeFeature");
  v15 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[5] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 6, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (v8)
      goto LABEL_27;
LABEL_34:

    if (v7)
      goto LABEL_28;
    goto LABEL_35;
  }

  if (!v8)
    goto LABEL_34;
LABEL_27:
  if (v7)
    goto LABEL_28;
LABEL_35:

LABEL_28:
  if (!v6)

  if (!v20)
  {

    if (v21)
      goto LABEL_32;
LABEL_37:

    goto LABEL_32;
  }
  if (!v21)
    goto LABEL_37;
LABEL_32:

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMMLSEVirtualFeatureStoreFeature featureName](self, "featureName");
    if (v6 == objc_msgSend(v5, "featureName"))
    {
      -[BMMLSEVirtualFeatureStoreFeature featureValue](self, "featureValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "featureValue");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[BMMLSEVirtualFeatureStoreFeature featureValue](self, "featureValue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "featureValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_28;
      }
      if (!-[BMMLSEVirtualFeatureStoreFeature hasFeatureItselfVersion](self, "hasFeatureItselfVersion")
        && !objc_msgSend(v5, "hasFeatureItselfVersion")
        || -[BMMLSEVirtualFeatureStoreFeature hasFeatureItselfVersion](self, "hasFeatureItselfVersion")
        && objc_msgSend(v5, "hasFeatureItselfVersion")
        && (v14 = -[BMMLSEVirtualFeatureStoreFeature featureItselfVersion](self, "featureItselfVersion"),
            v14 == objc_msgSend(v5, "featureItselfVersion")))
      {
        if (!-[BMMLSEVirtualFeatureStoreFeature hasFeatureFreshnessInHours](self, "hasFeatureFreshnessInHours")
          && !objc_msgSend(v5, "hasFeatureFreshnessInHours")
          || -[BMMLSEVirtualFeatureStoreFeature hasFeatureFreshnessInHours](self, "hasFeatureFreshnessInHours")
          && objc_msgSend(v5, "hasFeatureFreshnessInHours")
          && (v15 = -[BMMLSEVirtualFeatureStoreFeature featureFreshnessInHours](self, "featureFreshnessInHours"),
              v15 == objc_msgSend(v5, "featureFreshnessInHours")))
        {
          if (!-[BMMLSEVirtualFeatureStoreFeature hasEventVolumeToComputeFeature](self, "hasEventVolumeToComputeFeature")&& !objc_msgSend(v5, "hasEventVolumeToComputeFeature")|| -[BMMLSEVirtualFeatureStoreFeature hasEventVolumeToComputeFeature](self, "hasEventVolumeToComputeFeature")&& objc_msgSend(v5, "hasEventVolumeToComputeFeature")&& (v16 = -[BMMLSEVirtualFeatureStoreFeature eventVolumeToComputeFeature](self, "eventVolumeToComputeFeature"), v16 == objc_msgSend(v5, "eventVolumeToComputeFeature")))
          {
            if (!-[BMMLSEVirtualFeatureStoreFeature hasTimeSpentToComputeFeature](self, "hasTimeSpentToComputeFeature")
              && !objc_msgSend(v5, "hasTimeSpentToComputeFeature"))
            {
              v13 = 1;
              goto LABEL_29;
            }
            if (-[BMMLSEVirtualFeatureStoreFeature hasTimeSpentToComputeFeature](self, "hasTimeSpentToComputeFeature")
              && objc_msgSend(v5, "hasTimeSpentToComputeFeature"))
            {
              v17 = -[BMMLSEVirtualFeatureStoreFeature timeSpentToComputeFeature](self, "timeSpentToComputeFeature");
              v13 = v17 == objc_msgSend(v5, "timeSpentToComputeFeature");
LABEL_29:

              goto LABEL_30;
            }
          }
        }
      }
    }
LABEL_28:
    v13 = 0;
    goto LABEL_29;
  }
  v13 = 0;
LABEL_30:

  return v13;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (int)featureName
{
  return self->_featureName;
}

- (BMMLSEVirtualFeatureStoreFeatureFeatureValue)featureValue
{
  return self->_featureValue;
}

- (unsigned)featureItselfVersion
{
  return self->_featureItselfVersion;
}

- (BOOL)hasFeatureItselfVersion
{
  return self->_hasFeatureItselfVersion;
}

- (void)setHasFeatureItselfVersion:(BOOL)a3
{
  self->_hasFeatureItselfVersion = a3;
}

- (unsigned)featureFreshnessInHours
{
  return self->_featureFreshnessInHours;
}

- (BOOL)hasFeatureFreshnessInHours
{
  return self->_hasFeatureFreshnessInHours;
}

- (void)setHasFeatureFreshnessInHours:(BOOL)a3
{
  self->_hasFeatureFreshnessInHours = a3;
}

- (unsigned)eventVolumeToComputeFeature
{
  return self->_eventVolumeToComputeFeature;
}

- (BOOL)hasEventVolumeToComputeFeature
{
  return self->_hasEventVolumeToComputeFeature;
}

- (void)setHasEventVolumeToComputeFeature:(BOOL)a3
{
  self->_hasEventVolumeToComputeFeature = a3;
}

- (unsigned)timeSpentToComputeFeature
{
  return self->_timeSpentToComputeFeature;
}

- (BOOL)hasTimeSpentToComputeFeature
{
  return self->_hasTimeSpentToComputeFeature;
}

- (void)setHasTimeSpentToComputeFeature:(BOOL)a3
{
  self->_hasTimeSpentToComputeFeature = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureValue, 0);
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

    v4 = -[BMMLSEVirtualFeatureStoreFeature initByReadFrom:]([BMMLSEVirtualFeatureStoreFeature alloc], "initByReadFrom:", v7);
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("featureName"), 0, 0, 1, 4, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("featureValue_json"), 5, 1, &__block_literal_global_1643);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("featureItselfVersion"), 0, 0, 3, 4, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("featureFreshnessInHours"), 0, 0, 4, 4, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("eventVolumeToComputeFeature"), 0, 0, 5, 4, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("timeSpentToComputeFeature"), 0, 0, 6, 4, 0);
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
  return &unk_1E5F1B490;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("featureName"), 1, 4, 0);
  v10[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("featureValue"), 2, 14, objc_opt_class());
  v10[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("featureItselfVersion"), 3, 4, 0);
  v10[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("featureFreshnessInHours"), 4, 4, 0);
  v10[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("eventVolumeToComputeFeature"), 5, 4, 0);
  v10[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("timeSpentToComputeFeature"), 6, 4, 0);
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __43__BMMLSEVirtualFeatureStoreFeature_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "featureValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
