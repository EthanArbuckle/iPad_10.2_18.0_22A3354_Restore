@implementation BMSiriOnDeviceDigestExperimentMetrics

- (BMSiriOnDeviceDigestExperimentMetrics)initWithEventMetadata:(id)a3 digestType:(id)a4 experimentId:(id)a5 treatmentIdUUID:(id)a6 deploymentId:(id)a7 deviceType:(id)a8 programCode:(id)a9 digests:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  BMSiriOnDeviceDigestExperimentMetrics *v21;
  unsigned int v22;
  uint64_t v23;
  unsigned int v24;
  id v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v29 = a3;
  v17 = a4;
  v28 = a5;
  v27 = a6;
  v18 = a7;
  v26 = a8;
  v19 = a9;
  v20 = a10;
  v30.receiver = self;
  v30.super_class = (Class)BMSiriOnDeviceDigestExperimentMetrics;
  v21 = -[BMEventBase init](&v30, sel_init);
  if (v21)
  {
    v21->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v26, v27, v28, v29);
    objc_storeStrong((id *)&v21->_eventMetadata, a3);
    if (v17)
    {
      v21->_hasDigestType = 1;
      v22 = objc_msgSend(v17, "unsignedIntValue");
    }
    else
    {
      v22 = 0;
      v21->_hasDigestType = 0;
    }
    v21->_digestType = v22;
    objc_storeStrong((id *)&v21->_experimentId, a5);
    objc_storeStrong((id *)&v21->_treatmentIdUUID, a6);
    if (v18)
    {
      v21->_hasDeploymentId = 1;
      v23 = objc_msgSend(v18, "longLongValue");
    }
    else
    {
      v21->_hasDeploymentId = 0;
      v23 = -1;
    }
    v21->_deploymentId = v23;
    objc_storeStrong((id *)&v21->_deviceType, a8);
    if (v19)
    {
      v21->_hasProgramCode = 1;
      v24 = objc_msgSend(v19, "unsignedIntValue");
    }
    else
    {
      v24 = 0;
      v21->_hasProgramCode = 0;
    }
    v21->_programCode = v24;
    objc_storeStrong((id *)&v21->_digests, a10);
  }

  return v21;
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

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMSiriOnDeviceDigestExperimentMetrics eventMetadata](self, "eventMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetrics digestType](self, "digestType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriOnDeviceDigestExperimentMetrics experimentId](self, "experimentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriOnDeviceDigestExperimentMetrics treatmentIdUUID](self, "treatmentIdUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMSiriOnDeviceDigestExperimentMetrics deploymentId](self, "deploymentId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriOnDeviceDigestExperimentMetrics deviceType](self, "deviceType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetrics programCode](self, "programCode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriOnDeviceDigestExperimentMetrics digests](self, "digests");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriOnDeviceDigestExperimentMetrics with eventMetadata: %@, digestType: %@, experimentId: %@, treatmentIdUUID: %@, deploymentId: %@, deviceType: %@, programCode: %@, digests: %@"), v4, v5, v6, v7, v8, v9, v10, v11);

  return (NSString *)v12;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriOnDeviceDigestExperimentMetrics *v5;
  void *v6;
  int *v7;
  int *v8;
  int *v9;
  __objc2_class **v10;
  int *v11;
  int *v12;
  char v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  BOOL v20;
  int v21;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  unsigned int v36;
  int64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  void *v42;
  char v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  int *v49;
  __objc2_class **v50;
  id v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  NSArray *digests;
  int v56;
  BMSiriOnDeviceDigestExperimentMetrics *v57;
  objc_super v59;
  uint64_t v60;
  uint64_t v61;

  v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)BMSiriOnDeviceDigestExperimentMetrics;
  v5 = -[BMEventBase init](&v59, sel_init);
  if (!v5)
    goto LABEL_69;
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v10 = off_1E5E4B000;
    v11 = &OBJC_IVAR___BMIntelligencePlatformEntityTaggingPersonInference__dataVersion;
    v12 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v9])
        break;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      while (1)
      {
        v16 = *v7;
        v17 = *(_QWORD *)&v4[v16];
        v18 = v17 + 1;
        if (v17 == -1 || v18 > *(_QWORD *)&v4[*v8])
          break;
        v19 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v17);
        *(_QWORD *)&v4[v16] = v18;
        v15 |= (unint64_t)(v19 & 0x7F) << v13;
        if ((v19 & 0x80) == 0)
          goto LABEL_13;
        v13 += 7;
        v20 = v14++ >= 9;
        if (v20)
        {
          v15 = 0;
          v21 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      v21 = v4[*v9];
      if (v4[*v9])
        v15 = 0;
LABEL_15:
      if (v21 || (v15 & 7) == 4)
        break;
      switch((v15 >> 3))
      {
        case 1u:
          v60 = 0;
          v61 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_71;
          v23 = objc_msgSend(objc_alloc(v10[141]), "initByReadFrom:", v4);
          if (!v23)
            goto LABEL_71;
          v24 = v11[813];
          v25 = *(Class *)((char *)&v5->super.super.isa + v24);
          *(Class *)((char *)&v5->super.super.isa + v24) = (Class)v23;

          PBReaderRecallMark();
          continue;
        case 2u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          v5->_hasDigestType = 1;
          while (2)
          {
            v29 = *v7;
            v30 = *(_QWORD *)&v4[v29];
            v31 = v30 + 1;
            if (v30 == -1 || v31 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v32 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v30);
              *(_QWORD *)&v4[v29] = v31;
              v28 |= (unint64_t)(v32 & 0x7F) << v26;
              if (v32 < 0)
              {
                v26 += 7;
                v20 = v27++ >= 9;
                if (v20)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            LODWORD(v28) = 0;
LABEL_56:
          v53 = 24;
          goto LABEL_65;
        case 3u:
          PBReaderReadString();
          v33 = objc_claimAutoreleasedReturnValue();
          v34 = 40;
          goto LABEL_42;
        case 4u:
          PBReaderReadString();
          v33 = objc_claimAutoreleasedReturnValue();
          v34 = 48;
          goto LABEL_42;
        case 5u:
          v35 = 0;
          v36 = 0;
          v37 = 0;
          v5->_hasDeploymentId = 1;
          while (2)
          {
            v38 = *v7;
            v39 = *(_QWORD *)&v4[v38];
            v40 = v39 + 1;
            if (v39 == -1 || v40 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v41 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v39);
              *(_QWORD *)&v4[v38] = v40;
              v37 |= (unint64_t)(v41 & 0x7F) << v35;
              if (v41 < 0)
              {
                v35 += 7;
                v20 = v36++ >= 9;
                if (v20)
                {
                  v37 = 0;
                  goto LABEL_60;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            v37 = 0;
LABEL_60:
          v5->_deploymentId = v37;
          continue;
        case 6u:
          PBReaderReadString();
          v33 = objc_claimAutoreleasedReturnValue();
          v34 = 64;
LABEL_42:
          v42 = *(Class *)((char *)&v5->super.super.isa + v34);
          *(Class *)((char *)&v5->super.super.isa + v34) = (Class)v33;

          continue;
        case 7u:
          v43 = 0;
          v44 = 0;
          v28 = 0;
          v5->_hasProgramCode = 1;
          break;
        case 8u:
          v60 = 0;
          v61 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_71;
          v49 = v11;
          v50 = v10;
          v51 = -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest initByReadFrom:]([BMSiriOnDeviceDigestExperimentMetricsExperimentDigest alloc], "initByReadFrom:", v4);
          if (!v51)
            goto LABEL_71;
          v52 = v51;
          objc_msgSend(v6, "addObject:", v51);
          PBReaderRecallMark();

          v10 = v50;
          v11 = v49;
          continue;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_71:

          goto LABEL_68;
      }
      while (1)
      {
        v45 = *v7;
        v46 = *(_QWORD *)&v4[v45];
        v47 = v46 + 1;
        if (v46 == -1 || v47 > *(_QWORD *)&v4[*v8])
          break;
        v48 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v46);
        *(_QWORD *)&v4[v45] = v47;
        v28 |= (unint64_t)(v48 & 0x7F) << v43;
        if ((v48 & 0x80) == 0)
          goto LABEL_62;
        v43 += 7;
        v20 = v44++ >= 9;
        if (v20)
        {
          LODWORD(v28) = 0;
          goto LABEL_64;
        }
      }
      v4[*v9] = 1;
LABEL_62:
      if (v4[*v9])
        LODWORD(v28) = 0;
LABEL_64:
      v53 = 28;
LABEL_65:
      *(_DWORD *)((char *)&v5->super.super.isa + v53) = v28;
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v54 = objc_msgSend(v6, "copy");
  digests = v5->_digests;
  v5->_digests = (NSArray *)v54;

  v56 = v4[*v9];
  if (v56)
LABEL_68:
    v57 = 0;
  else
LABEL_69:
    v57 = v5;

  return v57;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_eventMetadata)
  {
    v15 = 0;
    PBDataWriterPlaceMark();
    -[BMSiriOnDeviceDigestExperimentMetricsEventMetadata writeTo:](self->_eventMetadata, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_hasDigestType)
    PBDataWriterWriteUint32Field();
  if (self->_experimentId)
    PBDataWriterWriteStringField();
  if (self->_treatmentIdUUID)
    PBDataWriterWriteStringField();
  if (self->_hasDeploymentId)
    PBDataWriterWriteInt64Field();
  if (self->_deviceType)
    PBDataWriterWriteStringField();
  if (self->_hasProgramCode)
    PBDataWriterWriteUint32Field();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_digests;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        v15 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4, (_QWORD)v11);
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v7);
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriOnDeviceDigestExperimentMetrics writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriOnDeviceDigestExperimentMetrics)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  BMSiriOnDeviceDigestExperimentMetricsEventMetadata *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BMSiriOnDeviceDigestExperimentMetrics *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  BMSiriOnDeviceDigestExperimentMetrics *v22;
  id v23;
  BMSiriOnDeviceDigestExperimentMetrics *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  void *v36;
  int v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *v45;
  BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *v46;
  id v47;
  id *v48;
  id v49;
  void *v50;
  uint64_t v51;
  BMSiriOnDeviceDigestExperimentMetricsEventMetadata *v52;
  id v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  id v59;
  void *v60;
  uint64_t v61;
  BMSiriOnDeviceDigestExperimentMetricsEventMetadata *v62;
  id v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  id v68;
  void *v69;
  uint64_t v70;
  BMSiriOnDeviceDigestExperimentMetricsEventMetadata *v71;
  id v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  id v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  id *v87;
  void *v88;
  id v89;
  uint64_t v90;
  void *v91;
  id *v92;
  uint64_t *v93;
  void *v94;
  void *v95;
  id v97;
  uint64_t v98;
  void *v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  id v104;
  void *v105;
  BMSiriOnDeviceDigestExperimentMetricsEventMetadata *v106;
  void *v107;
  id v108;
  BMSiriOnDeviceDigestExperimentMetrics *v109;
  void *v110;
  id *v111;
  id v112;
  void *v113;
  id v114;
  id v115;
  void *v116;
  id v117;
  void *v118;
  void *v120;
  id v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  id v126;
  uint64_t v127;
  id v128;
  uint64_t v129;
  id v130;
  _BYTE v131[128];
  uint64_t v132;
  void *v133;
  uint64_t v134;
  id v135;
  uint64_t v136;
  id v137;
  uint64_t v138;
  id v139;
  uint64_t v140;
  id v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  uint64_t v146;
  _QWORD v147[3];

  v147[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("eventMetadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = v6;
    v126 = 0;
    v7 = -[BMSiriOnDeviceDigestExperimentMetricsEventMetadata initWithJSONDictionary:error:]([BMSiriOnDeviceDigestExperimentMetricsEventMetadata alloc], "initWithJSONDictionary:error:", v19, &v126);
    v20 = v126;
    if (v20)
    {
      v21 = v20;
      if (a4)
        *a4 = objc_retainAutorelease(v20);

      v22 = 0;
      goto LABEL_91;
    }

LABEL_4:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("digestType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v22 = 0;
          v19 = 0;
          goto LABEL_90;
        }
        v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v29 = v8;
        v30 = *MEMORY[0x1E0D025B8];
        v144 = *MEMORY[0x1E0CB2D50];
        v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("digestType"));
        v145 = v31;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v145, &v144, 1);
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = v30;
        v8 = v29;
        v118 = (void *)v32;
        v34 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v33, 2);
        v22 = 0;
        v19 = 0;
        *a4 = v34;
LABEL_89:

LABEL_90:
        goto LABEL_91;
      }
      v117 = v8;
    }
    else
    {
      v117 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("experimentId"));
    v9 = objc_claimAutoreleasedReturnValue();
    v118 = (void *)v9;
    if (v9 && (v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v31 = 0;
          v22 = 0;
          v19 = v117;
          goto LABEL_89;
        }
        v49 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v50 = v8;
        v51 = *MEMORY[0x1E0D025B8];
        v142 = *MEMORY[0x1E0CB2D50];
        v52 = v7;
        v53 = objc_alloc(MEMORY[0x1E0CB3940]);
        v101 = objc_opt_class();
        v54 = v53;
        v7 = v52;
        v55 = objc_msgSend(v54, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v101, CFSTR("experimentId"));
        v143 = v55;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v143, &v142, 1);
        v56 = objc_claimAutoreleasedReturnValue();
        v57 = v51;
        v8 = v50;
        v48 = (id *)v55;
        v116 = (void *)v56;
        v58 = (id)objc_msgSend(v49, "initWithDomain:code:userInfo:", v57, 2);
        v22 = 0;
        v31 = 0;
        *a4 = v58;
        v19 = v117;
        goto LABEL_88;
      }
      v114 = v10;
    }
    else
    {
      v114 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("treatmentIdUUID"));
    v11 = objc_claimAutoreleasedReturnValue();
    v116 = (void *)v11;
    if (v11 && (v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v48 = a4;
        if (!a4)
        {
          v22 = 0;
          v19 = v117;
          v31 = v114;
          goto LABEL_88;
        }
        v59 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v60 = v8;
        v61 = *MEMORY[0x1E0D025B8];
        v140 = *MEMORY[0x1E0CB2D50];
        v62 = v7;
        v63 = objc_alloc(MEMORY[0x1E0CB3940]);
        v102 = objc_opt_class();
        v64 = v63;
        v7 = v62;
        v115 = (id)objc_msgSend(v64, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v102, CFSTR("treatmentIdUUID"));
        v141 = v115;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v141, &v140, 1);
        v65 = objc_claimAutoreleasedReturnValue();
        v66 = v61;
        v8 = v60;
        v67 = (id)objc_msgSend(v59, "initWithDomain:code:userInfo:", v66, 2, v65);
        v22 = 0;
        v48 = 0;
        *a4 = v67;
        v13 = (void *)v65;
        v19 = v117;
        v31 = v114;
LABEL_87:

LABEL_88:
        goto LABEL_89;
      }
      v111 = v12;
    }
    else
    {
      v111 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("deploymentId"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = v13;
    v113 = v6;
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v115 = 0;
          v22 = 0;
          v19 = v117;
          v31 = v114;
          v48 = v111;
          goto LABEL_87;
        }
        v68 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v69 = v8;
        v70 = *MEMORY[0x1E0D025B8];
        v138 = *MEMORY[0x1E0CB2D50];
        v71 = v7;
        v72 = objc_alloc(MEMORY[0x1E0CB3940]);
        v103 = objc_opt_class();
        v73 = v72;
        v7 = v71;
        v112 = (id)objc_msgSend(v73, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v103, CFSTR("deploymentId"));
        v139 = v112;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v139, &v138, 1);
        v74 = objc_claimAutoreleasedReturnValue();
        v75 = v70;
        v8 = v69;
        v110 = (void *)v74;
        v76 = (id)objc_msgSend(v68, "initWithDomain:code:userInfo:", v75, 2);
        v22 = 0;
        v115 = 0;
        *a4 = v76;
        v19 = v117;
        v31 = v114;
        v48 = v111;
        goto LABEL_86;
      }
      v14 = self;
      v115 = v13;
    }
    else
    {
      v14 = self;
      v115 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("deviceType"));
    v15 = objc_claimAutoreleasedReturnValue();
    v110 = (void *)v15;
    if (v15 && (v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v112 = 0;
          v22 = 0;
          v19 = v117;
          v48 = v111;
          self = v14;
          v6 = v113;
          v31 = v114;
          goto LABEL_86;
        }
        v77 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v78 = v8;
        v79 = *MEMORY[0x1E0D025B8];
        v136 = *MEMORY[0x1E0CB2D50];
        v108 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("deviceType"));
        v137 = v108;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v137, &v136, 1);
        v80 = objc_claimAutoreleasedReturnValue();
        v81 = v79;
        v8 = v78;
        v107 = (void *)v80;
        v82 = (id)objc_msgSend(v77, "initWithDomain:code:userInfo:", v81, 2);
        v22 = 0;
        v112 = 0;
        *a4 = v82;
        v19 = v117;
        v48 = v111;
        self = v14;
        v6 = v113;
        v31 = v114;
        goto LABEL_85;
      }
      v112 = v16;
    }
    else
    {
      v112 = 0;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("programCode"));
    v17 = objc_claimAutoreleasedReturnValue();
    v109 = v14;
    v105 = v8;
    v106 = v7;
    v107 = (void *)v17;
    if (!v17)
    {
      v108 = 0;
      v6 = v113;
      goto LABEL_44;
    }
    v18 = (void *)v17;
    objc_opt_class();
    v6 = v113;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v108 = 0;
LABEL_44:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("digests"));
      v35 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v35, "isEqual:", v36);

      self = v109;
      if (v37)
      {
        v104 = v5;

        v35 = 0;
LABEL_49:
        v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v35, "count"));
        v122 = 0u;
        v123 = 0u;
        v124 = 0u;
        v125 = 0u;
        v35 = v35;
        v39 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v122, v131, 16);
        if (!v39)
          goto LABEL_59;
        v40 = v39;
        v41 = *(_QWORD *)v123;
LABEL_51:
        v42 = 0;
        while (1)
        {
          if (*(_QWORD *)v123 != v41)
            objc_enumerationMutation(v35);
          v43 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * v42);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            break;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v5 = v104;
            self = v109;
            v6 = v113;
            v87 = a4;
            if (!a4)
              goto LABEL_81;
            v88 = v113;
            v89 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v90 = *MEMORY[0x1E0D025B8];
            v127 = *MEMORY[0x1E0CB2D50];
            v44 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("digests"));
            v128 = v44;
            v91 = (void *)MEMORY[0x1E0C99D80];
            v92 = &v128;
            v93 = &v127;
            goto LABEL_76;
          }
          v44 = v43;
          v45 = [BMSiriOnDeviceDigestExperimentMetricsExperimentDigest alloc];
          v121 = 0;
          v46 = -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest initWithJSONDictionary:error:](v45, "initWithJSONDictionary:error:", v44, &v121);
          v47 = v121;
          if (v47)
          {
            v94 = v47;
            if (a4)
              *a4 = objc_retainAutorelease(v47);

            v5 = v104;
            self = v109;
            v6 = v113;
LABEL_80:

            v13 = v120;
LABEL_81:

            goto LABEL_82;
          }
          objc_msgSend(v38, "addObject:", v46);

          ++v42;
          v13 = v120;
          if (v40 == v42)
          {
            v40 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v122, v131, 16);
            self = v109;
            if (v40)
              goto LABEL_51;
LABEL_59:

            v19 = v117;
            v31 = v114;
            v48 = v111;
            self = -[BMSiriOnDeviceDigestExperimentMetrics initWithEventMetadata:digestType:experimentId:treatmentIdUUID:deploymentId:deviceType:programCode:digests:](self, "initWithEventMetadata:digestType:experimentId:treatmentIdUUID:deploymentId:deviceType:programCode:digests:", v106, v117, v114, v111, v115, v112, v108, v38);
            v22 = self;
            v5 = v104;
            v6 = v113;
LABEL_83:

            v7 = v106;
            goto LABEL_84;
          }
        }
        v5 = v104;
        self = v109;
        v6 = v113;
        v87 = a4;
        if (!a4)
          goto LABEL_81;
        v88 = v113;
        v89 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v90 = *MEMORY[0x1E0D025B8];
        v129 = *MEMORY[0x1E0CB2D50];
        v44 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("digests"));
        v130 = v44;
        v91 = (void *)MEMORY[0x1E0C99D80];
        v92 = &v130;
        v93 = &v129;
LABEL_76:
        objc_msgSend(v91, "dictionaryWithObjects:forKeys:count:", v92, v93, 1);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = v89;
        v6 = v88;
        *v87 = (id)objc_msgSend(v95, "initWithDomain:code:userInfo:", v90, 2, v94);
        goto LABEL_80;
      }
      if (!v35 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v104 = v5;
        goto LABEL_49;
      }
      if (a4)
      {
        v97 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v98 = *MEMORY[0x1E0D025B8];
        v132 = *MEMORY[0x1E0CB2D50];
        v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("digests"));
        v133 = v38;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v133, &v132, 1);
        v99 = v6;
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v97, "initWithDomain:code:userInfo:", v98, 2, v100);

        v6 = v99;
LABEL_82:
        v22 = 0;
        v19 = v117;
        v31 = v114;
        v48 = v111;
        goto LABEL_83;
      }
      v22 = 0;
      v19 = v117;
      v31 = v114;
      v48 = v111;
LABEL_84:

      v8 = v105;
      goto LABEL_85;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v108 = v18;
      goto LABEL_44;
    }
    if (a4)
    {
      v83 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v84 = *MEMORY[0x1E0D025B8];
      v134 = *MEMORY[0x1E0CB2D50];
      v35 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("programCode"));
      v135 = v35;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v135, &v134, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = v84;
      v6 = v113;
      v86 = (id)objc_msgSend(v83, "initWithDomain:code:userInfo:", v85, 2, v38);
      v22 = 0;
      v108 = 0;
      *a4 = v86;
      v19 = v117;
      v31 = v114;
      v48 = v111;
      self = v109;
      goto LABEL_83;
    }
    v108 = 0;
    v22 = 0;
    v19 = v117;
    v31 = v114;
    v48 = v111;
    self = v109;
LABEL_85:

LABEL_86:
    goto LABEL_87;
  }
  if (a4)
  {
    v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v24 = self;
    v25 = *MEMORY[0x1E0D025B8];
    v146 = *MEMORY[0x1E0CB2D50];
    v7 = (BMSiriOnDeviceDigestExperimentMetricsEventMetadata *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("eventMetadata"));
    v147[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v147, &v146, 1);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    self = v24;
    v27 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", v26, 2, v19);
    v22 = 0;
    *a4 = v27;
LABEL_91:

    goto LABEL_92;
  }
  v22 = 0;
LABEL_92:

  return v22;
}

- (id)_digestsJSONArray
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
  -[BMSiriOnDeviceDigestExperimentMetrics digests](self, "digests", 0);
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
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[8];
  _QWORD v30[10];

  v30[8] = *MEMORY[0x1E0C80C00];
  -[BMSiriOnDeviceDigestExperimentMetrics eventMetadata](self, "eventMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = objc_claimAutoreleasedReturnValue();

  if (-[BMSiriOnDeviceDigestExperimentMetrics hasDigestType](self, "hasDigestType"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetrics digestType](self, "digestType"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[BMSiriOnDeviceDigestExperimentMetrics experimentId](self, "experimentId");
  v6 = objc_claimAutoreleasedReturnValue();
  -[BMSiriOnDeviceDigestExperimentMetrics treatmentIdUUID](self, "treatmentIdUUID");
  v7 = objc_claimAutoreleasedReturnValue();
  if (-[BMSiriOnDeviceDigestExperimentMetrics hasDeploymentId](self, "hasDeploymentId"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[BMSiriOnDeviceDigestExperimentMetrics deploymentId](self, "deploymentId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  -[BMSiriOnDeviceDigestExperimentMetrics deviceType](self, "deviceType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMSiriOnDeviceDigestExperimentMetrics hasProgramCode](self, "hasProgramCode"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetrics programCode](self, "programCode"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  -[BMSiriOnDeviceDigestExperimentMetrics _digestsJSONArray](self, "_digestsJSONArray");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = CFSTR("eventMetadata");
  v12 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v12;
  v30[0] = v12;
  v29[1] = CFSTR("digestType");
  v13 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v4;
  v23 = (void *)v13;
  v30[1] = v13;
  v29[2] = CFSTR("experimentId");
  v14 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v27 = (void *)v5;
  v22 = (void *)v14;
  v30[2] = v14;
  v29[3] = CFSTR("treatmentIdUUID");
  v15 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v6;
  v30[3] = v15;
  v29[4] = CFSTR("deploymentId");
  v16 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v7;
  v30[4] = v16;
  v29[5] = CFSTR("deviceType");
  v17 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[5] = v17;
  v29[6] = CFSTR("programCode");
  v18 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[6] = v18;
  v29[7] = CFSTR("digests");
  v19 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[7] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v10)
      goto LABEL_28;
  }
  else
  {

    if (v10)
      goto LABEL_28;
  }

LABEL_28:
  if (!v9)

  if (!v8)
  if (!v25)

  if (!v26)
  if (!v27)
  {

    if (v28)
      goto LABEL_38;
LABEL_42:

    goto LABEL_38;
  }
  if (!v28)
    goto LABEL_42;
LABEL_38:

  return v20;
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
  unsigned int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  int64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  unsigned int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSiriOnDeviceDigestExperimentMetrics eventMetadata](self, "eventMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eventMetadata");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSiriOnDeviceDigestExperimentMetrics eventMetadata](self, "eventMetadata");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "eventMetadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_36;
    }
    if (-[BMSiriOnDeviceDigestExperimentMetrics hasDigestType](self, "hasDigestType")
      || objc_msgSend(v5, "hasDigestType"))
    {
      if (!-[BMSiriOnDeviceDigestExperimentMetrics hasDigestType](self, "hasDigestType"))
        goto LABEL_36;
      if (!objc_msgSend(v5, "hasDigestType"))
        goto LABEL_36;
      v13 = -[BMSiriOnDeviceDigestExperimentMetrics digestType](self, "digestType");
      if (v13 != objc_msgSend(v5, "digestType"))
        goto LABEL_36;
    }
    -[BMSiriOnDeviceDigestExperimentMetrics experimentId](self, "experimentId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "experimentId");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v14 == (void *)v15)
    {

    }
    else
    {
      v16 = (void *)v15;
      -[BMSiriOnDeviceDigestExperimentMetrics experimentId](self, "experimentId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "experimentId");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if (!v19)
        goto LABEL_36;
    }
    -[BMSiriOnDeviceDigestExperimentMetrics treatmentIdUUID](self, "treatmentIdUUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "treatmentIdUUID");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v20 == (void *)v21)
    {

    }
    else
    {
      v22 = (void *)v21;
      -[BMSiriOnDeviceDigestExperimentMetrics treatmentIdUUID](self, "treatmentIdUUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "treatmentIdUUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqual:", v24);

      if (!v25)
        goto LABEL_36;
    }
    if (-[BMSiriOnDeviceDigestExperimentMetrics hasDeploymentId](self, "hasDeploymentId")
      || objc_msgSend(v5, "hasDeploymentId"))
    {
      if (!-[BMSiriOnDeviceDigestExperimentMetrics hasDeploymentId](self, "hasDeploymentId"))
        goto LABEL_36;
      if (!objc_msgSend(v5, "hasDeploymentId"))
        goto LABEL_36;
      v26 = -[BMSiriOnDeviceDigestExperimentMetrics deploymentId](self, "deploymentId");
      if (v26 != objc_msgSend(v5, "deploymentId"))
        goto LABEL_36;
    }
    -[BMSiriOnDeviceDigestExperimentMetrics deviceType](self, "deviceType");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceType");
    v28 = objc_claimAutoreleasedReturnValue();
    if (v27 == (void *)v28)
    {

    }
    else
    {
      v29 = (void *)v28;
      -[BMSiriOnDeviceDigestExperimentMetrics deviceType](self, "deviceType");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deviceType");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "isEqual:", v31);

      if (!v32)
        goto LABEL_36;
    }
    if (!-[BMSiriOnDeviceDigestExperimentMetrics hasProgramCode](self, "hasProgramCode")
      && !objc_msgSend(v5, "hasProgramCode")
      || -[BMSiriOnDeviceDigestExperimentMetrics hasProgramCode](self, "hasProgramCode")
      && objc_msgSend(v5, "hasProgramCode")
      && (v33 = -[BMSiriOnDeviceDigestExperimentMetrics programCode](self, "programCode"),
          v33 == objc_msgSend(v5, "programCode")))
    {
      -[BMSiriOnDeviceDigestExperimentMetrics digests](self, "digests");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "digests");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34 == v35)
      {
        v12 = 1;
      }
      else
      {
        -[BMSiriOnDeviceDigestExperimentMetrics digests](self, "digests");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "digests");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v36, "isEqual:", v37);

      }
      goto LABEL_37;
    }
LABEL_36:
    v12 = 0;
LABEL_37:

    goto LABEL_38;
  }
  v12 = 0;
LABEL_38:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BMSiriOnDeviceDigestExperimentMetricsEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unsigned)digestType
{
  return self->_digestType;
}

- (BOOL)hasDigestType
{
  return self->_hasDigestType;
}

- (void)setHasDigestType:(BOOL)a3
{
  self->_hasDigestType = a3;
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (NSString)treatmentIdUUID
{
  return self->_treatmentIdUUID;
}

- (int64_t)deploymentId
{
  return self->_deploymentId;
}

- (BOOL)hasDeploymentId
{
  return self->_hasDeploymentId;
}

- (void)setHasDeploymentId:(BOOL)a3
{
  self->_hasDeploymentId = a3;
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (unsigned)programCode
{
  return self->_programCode;
}

- (BOOL)hasProgramCode
{
  return self->_hasProgramCode;
}

- (void)setHasProgramCode:(BOOL)a3
{
  self->_hasProgramCode = a3;
}

- (NSArray)digests
{
  return self->_digests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digests, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_treatmentIdUUID, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
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

    v4 = -[BMSiriOnDeviceDigestExperimentMetrics initByReadFrom:]([BMSiriOnDeviceDigestExperimentMetrics alloc], "initByReadFrom:", v7);
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
  void *v9;
  void *v10;
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("eventMetadata_json"), 5, 1, &__block_literal_global_613);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("digestType"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("experimentId"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("treatmentIdUUID"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("deploymentId"), 0, 0, 5, 3, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("deviceType"), 2, 0, 6, 13, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("programCode"), 0, 0, 7, 4, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("digests_json"), 5, 1, &__block_literal_global_614_48192);
  v12[0] = v2;
  v12[1] = v3;
  v12[2] = v4;
  v12[3] = v5;
  v12[4] = v6;
  v12[5] = v7;
  v12[6] = v8;
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1D8D8;
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
  void *v9;
  void *v10;
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("eventMetadata"), 1, 14, objc_opt_class());
  v12[0] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("digestType"), 2, 4, 0);
  v12[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("experimentId"), 3, 13, 0);
  v12[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("treatmentIdUUID"), 4, 13, 0);
  v12[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("deploymentId"), 5, 3, 0);
  v12[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("deviceType"), 6, 13, 0);
  v12[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("programCode"), 7, 4, 0);
  v12[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("digests"), 8, 14, objc_opt_class());
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __48__BMSiriOnDeviceDigestExperimentMetrics_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_digestsJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __48__BMSiriOnDeviceDigestExperimentMetrics_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eventMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
