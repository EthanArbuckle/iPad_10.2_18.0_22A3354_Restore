@implementation BMMLSELabeledDataStore

- (BMMLSELabeledDataStore)initWithItemIdentifier:(id)a3 featureVersion:(id)a4 featureVector:(id)a5 deviceIdentifier:(id)a6 isPositiveLabeled:(id)a7 labelingPolicyVersion:(id)a8 labelingEvidence:(int)a9 sharingEventUID:(id)a10 configurationInfo:(id)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  BMMLSELabeledDataStore *v22;
  unsigned int v23;
  unsigned int v24;
  id v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v29 = a3;
  v18 = a4;
  v28 = a5;
  v27 = a6;
  v19 = a7;
  v20 = a8;
  v26 = a10;
  v21 = a11;
  v30.receiver = self;
  v30.super_class = (Class)BMMLSELabeledDataStore;
  v22 = -[BMEventBase init](&v30, sel_init);
  if (v22)
  {
    v22->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v26, v27, v28, v29);
    objc_storeStrong((id *)&v22->_itemIdentifier, a3);
    if (v18)
    {
      v22->_hasFeatureVersion = 1;
      v23 = objc_msgSend(v18, "unsignedIntValue");
    }
    else
    {
      v23 = 0;
      v22->_hasFeatureVersion = 0;
    }
    v22->_featureVersion = v23;
    objc_storeStrong((id *)&v22->_featureVector, a5);
    objc_storeStrong((id *)&v22->_deviceIdentifier, a6);
    if (v19)
    {
      v22->_hasIsPositiveLabeled = 1;
      v22->_isPositiveLabeled = objc_msgSend(v19, "BOOLValue");
    }
    else
    {
      v22->_hasIsPositiveLabeled = 0;
      v22->_isPositiveLabeled = 0;
    }
    if (v20)
    {
      v22->_hasLabelingPolicyVersion = 1;
      v24 = objc_msgSend(v20, "unsignedIntValue");
    }
    else
    {
      v24 = 0;
      v22->_hasLabelingPolicyVersion = 0;
    }
    v22->_labelingPolicyVersion = v24;
    v22->_labelingEvidence = a9;
    objc_storeStrong((id *)&v22->_sharingEventUID, a10);
    objc_storeStrong((id *)&v22->_configurationInfo, a11);
  }

  return v22;
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
  -[BMMLSELabeledDataStore itemIdentifier](self, "itemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMMLSELabeledDataStore featureVersion](self, "featureVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSELabeledDataStore featureVector](self, "featureVector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSELabeledDataStore deviceIdentifier](self, "deviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMLSELabeledDataStore isPositiveLabeled](self, "isPositiveLabeled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMMLSELabeledDataStore labelingPolicyVersion](self, "labelingPolicyVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  BMMLSELabeledDataStoreLabelingEvidenceTypeAsString(-[BMMLSELabeledDataStore labelingEvidence](self, "labelingEvidence"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSELabeledDataStore sharingEventUID](self, "sharingEventUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSELabeledDataStore configurationInfo](self, "configurationInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMMLSELabeledDataStore with itemIdentifier: %@, featureVersion: %@, featureVector: %@, deviceIdentifier: %@, isPositiveLabeled: %@, labelingPolicyVersion: %@, labelingEvidence: %@, sharingEventUID: %@, configurationInfo: %@"), v4, v5, v6, v7, v8, v9, v10, v11, v12);

  return (NSString *)v13;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMLSELabeledDataStore *v5;
  void *v6;
  int *v7;
  int *v8;
  int *v9;
  int *v10;
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
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  int *v32;
  int *v33;
  id v34;
  void *v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  char v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  char v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  NSArray *featureVector;
  int v60;
  BMMLSELabeledDataStore *v61;
  objc_super v63;
  uint64_t v64;
  uint64_t v65;

  v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)BMMLSELabeledDataStore;
  v5 = -[BMEventBase init](&v63, sel_init);
  if (!v5)
    goto LABEL_80;
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v10 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
    v11 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
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
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = v10[22];
          goto LABEL_57;
        case 2u:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          *((_BYTE *)&v5->super.super.isa + v11[23]) = 1;
          while (2)
          {
            v28 = *v7;
            v29 = *(_QWORD *)&v4[v28];
            v30 = v29 + 1;
            if (v29 == -1 || v30 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v29);
              *(_QWORD *)&v4[v28] = v30;
              v27 |= (unint64_t)(v31 & 0x7F) << v25;
              if (v31 < 0)
              {
                v25 += 7;
                v20 = v26++ >= 9;
                if (v20)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_61;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            LODWORD(v27) = 0;
LABEL_61:
          v57 = 24;
          goto LABEL_70;
        case 3u:
          v64 = 0;
          v65 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_82;
          v32 = v11;
          v33 = v10;
          v34 = -[BMMLSELabeledDataStoreFeature initByReadFrom:]([BMMLSELabeledDataStoreFeature alloc], "initByReadFrom:", v4);
          if (!v34)
            goto LABEL_82;
          v35 = v34;
          objc_msgSend(v6, "addObject:", v34);
          PBReaderRecallMark();

          v10 = v33;
          v11 = v32;
          continue;
        case 4u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 56;
          goto LABEL_57;
        case 5u:
          v36 = 0;
          v37 = 0;
          v38 = 0;
          v5->_hasIsPositiveLabeled = 1;
          while (2)
          {
            v39 = *v7;
            v40 = *(_QWORD *)&v4[v39];
            v41 = v40 + 1;
            if (v40 == -1 || v41 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v42 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v40);
              *(_QWORD *)&v4[v39] = v41;
              v38 |= (unint64_t)(v42 & 0x7F) << v36;
              if (v42 < 0)
              {
                v36 += 7;
                v20 = v37++ >= 9;
                if (v20)
                {
                  v38 = 0;
                  goto LABEL_65;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            v38 = 0;
LABEL_65:
          v5->_isPositiveLabeled = v38 != 0;
          continue;
        case 6u:
          v43 = 0;
          v44 = 0;
          v27 = 0;
          v5->_hasLabelingPolicyVersion = 1;
          while (2)
          {
            v45 = *v7;
            v46 = *(_QWORD *)&v4[v45];
            v47 = v46 + 1;
            if (v46 == -1 || v47 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v48 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v46);
              *(_QWORD *)&v4[v45] = v47;
              v27 |= (unint64_t)(v48 & 0x7F) << v43;
              if (v48 < 0)
              {
                v43 += 7;
                v20 = v44++ >= 9;
                if (v20)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_69;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            LODWORD(v27) = 0;
LABEL_69:
          v57 = 28;
LABEL_70:
          *(_DWORD *)((char *)&v5->super.super.isa + v57) = v27;
          continue;
        case 7u:
          v49 = 0;
          v50 = 0;
          v51 = 0;
          break;
        case 8u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 64;
          goto LABEL_57;
        case 9u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 72;
LABEL_57:
          v56 = *(Class *)((char *)&v5->super.super.isa + v24);
          *(Class *)((char *)&v5->super.super.isa + v24) = (Class)v23;

          continue;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_82:

          goto LABEL_79;
      }
      while (1)
      {
        v52 = *v7;
        v53 = *(_QWORD *)&v4[v52];
        v54 = v53 + 1;
        if (v53 == -1 || v54 > *(_QWORD *)&v4[*v8])
          break;
        v55 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v53);
        *(_QWORD *)&v4[v52] = v54;
        v51 |= (unint64_t)(v55 & 0x7F) << v49;
        if ((v55 & 0x80) == 0)
          goto LABEL_72;
        v49 += 7;
        v20 = v50++ >= 9;
        if (v20)
        {
          LODWORD(v51) = 0;
          goto LABEL_74;
        }
      }
      v4[*v9] = 1;
LABEL_72:
      if (v4[*v9])
        LODWORD(v51) = 0;
LABEL_74:
      if (v51 >= 4)
        LODWORD(v51) = 0;
      v5->_labelingEvidence = v51;
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v58 = objc_msgSend(v6, "copy");
  featureVector = v5->_featureVector;
  v5->_featureVector = (NSArray *)v58;

  v60 = v4[*v9];
  if (v60)
LABEL_79:
    v61 = 0;
  else
LABEL_80:
    v61 = v5;

  return v61;
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
  if (self->_itemIdentifier)
    PBDataWriterWriteStringField();
  if (self->_hasFeatureVersion)
    PBDataWriterWriteUint32Field();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_featureVector;
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

  if (self->_deviceIdentifier)
    PBDataWriterWriteStringField();
  if (self->_hasIsPositiveLabeled)
    PBDataWriterWriteBOOLField();
  if (self->_hasLabelingPolicyVersion)
    PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_sharingEventUID)
    PBDataWriterWriteStringField();
  if (self->_configurationInfo)
    PBDataWriterWriteStringField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMLSELabeledDataStore writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMLSELabeledDataStore)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  BMMLSELabeledDataStoreFeature *v18;
  BMMLSELabeledDataStoreFeature *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  BMMLSELabeledDataStore *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  id *v38;
  id v39;
  uint64_t v40;
  void *v41;
  id *v42;
  uint64_t *v43;
  id v44;
  id v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  id v52;
  id v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  id v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  uint64_t v71;
  id v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  id v80;
  id v81;
  void *v82;
  id v83;
  id v84;
  void *v85;
  id v86;
  id v87;
  void *v88;
  BMMLSELabeledDataStore *v89;
  id v90;
  void *v91;
  id v92;
  id v93;
  id v94;
  id v95;
  void *v96;
  void *v98;
  void *v99;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  id v108;
  uint64_t v109;
  id v110;
  uint64_t v111;
  id v112;
  uint64_t v113;
  id v114;
  uint64_t v115;
  id v116;
  uint64_t v117;
  id v118;
  uint64_t v119;
  id v120;
  _BYTE v121[128];
  uint64_t v122;
  void *v123;
  uint64_t v124;
  id v125;
  uint64_t v126;
  _QWORD v127[3];

  v127[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("itemIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v26 = *MEMORY[0x1E0D025B8];
        v126 = *MEMORY[0x1E0CB2D50];
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("itemIdentifier"));
        v127[0] = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v127, &v126, 1);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = v25;
        v8 = (void *)v28;
        v30 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v26, 2, v28);
        v7 = 0;
        v31 = 0;
        *a4 = v30;
        goto LABEL_94;
      }
      v7 = 0;
      v31 = 0;
      goto LABEL_95;
    }
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("featureVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = v6;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v32 = v8;
        v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v34 = *MEMORY[0x1E0D025B8];
        v124 = *MEMORY[0x1E0CB2D50];
        v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("featureVersion"));
        v125 = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v125, &v124, 1);
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = v33;
        v8 = v32;
        v99 = (void *)v35;
        v37 = (id)objc_msgSend(v36, "initWithDomain:code:userInfo:", v34, 2);
        v27 = 0;
        v31 = 0;
        *a4 = v37;

        goto LABEL_93;
      }
      v27 = 0;
      v31 = 0;
      goto LABEL_94;
    }
    v95 = v8;
  }
  else
  {
    v95 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("featureVector"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (v11)
  {
    v88 = v8;
    v89 = self;
    v92 = v7;

    v9 = 0;
  }
  else
  {
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v31 = 0;
          v27 = v95;
          goto LABEL_93;
        }
        v45 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v46 = *MEMORY[0x1E0D025B8];
        v122 = *MEMORY[0x1E0CB2D50];
        v98 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("featureVector"));
        v123 = v98;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v123, &v122, 1);
        v21 = (id)objc_claimAutoreleasedReturnValue();
        v47 = (id)objc_msgSend(v45, "initWithDomain:code:userInfo:", v46, 2, v21);
        v31 = 0;
        *a4 = v47;
LABEL_48:
        v27 = v95;
        goto LABEL_91;
      }
    }
    v88 = v8;
    v89 = self;
    v92 = v7;
  }
  v98 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v9 = v9;
  v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v101, v121, 16);
  if (!v12)
    goto LABEL_22;
  v13 = v12;
  v14 = *(_QWORD *)v102;
  v87 = v5;
  while (2)
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v102 != v14)
        objc_enumerationMutation(v9);
      v16 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v38 = a4;
        if (a4)
        {
          v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v40 = *MEMORY[0x1E0D025B8];
          v119 = *MEMORY[0x1E0CB2D50];
          v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("featureVector"));
          v120 = v17;
          v41 = (void *)MEMORY[0x1E0C99D80];
          v42 = &v120;
          v43 = &v119;
LABEL_40:
          objc_msgSend(v41, "dictionaryWithObjects:forKeys:count:", v42, v43, 1);
          v24 = (id)objc_claimAutoreleasedReturnValue();
          v44 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v40, 2, v24);
          v31 = 0;
          *v38 = v44;
LABEL_44:
          v21 = v9;
          v5 = v87;
          v8 = v88;
          self = v89;
          v7 = v92;
          v27 = v95;
          goto LABEL_89;
        }
        goto LABEL_47;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v38 = a4;
        if (a4)
        {
          v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v40 = *MEMORY[0x1E0D025B8];
          v117 = *MEMORY[0x1E0CB2D50];
          v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("featureVector"));
          v118 = v17;
          v41 = (void *)MEMORY[0x1E0C99D80];
          v42 = &v118;
          v43 = &v117;
          goto LABEL_40;
        }
LABEL_47:
        v31 = 0;
        v21 = v9;
        v5 = v87;
        v8 = v88;
        self = v89;
        v7 = v92;
        goto LABEL_48;
      }
      v17 = v16;
      v18 = [BMMLSELabeledDataStoreFeature alloc];
      v100 = 0;
      v19 = -[BMMLSELabeledDataStoreFeature initWithJSONDictionary:error:](v18, "initWithJSONDictionary:error:", v17, &v100);
      v20 = v100;
      if (v20)
      {
        v24 = v20;
        if (a4)
          *a4 = objc_retainAutorelease(v20);

        v31 = 0;
        goto LABEL_44;
      }
      objc_msgSend(v98, "addObject:", v19);

    }
    v13 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v101, v121, 16);
    v5 = v87;
    if (v13)
      continue;
    break;
  }
LABEL_22:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("deviceIdentifier"));
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v21 = 0;
    self = v89;
    goto LABEL_25;
  }
  objc_opt_class();
  self = v89;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a4)
    {
      v21 = 0;
      v31 = 0;
      v7 = v92;
      v27 = v95;
      v8 = v88;
      goto LABEL_90;
    }
    v53 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v54 = *MEMORY[0x1E0D025B8];
    v115 = *MEMORY[0x1E0CB2D50];
    v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("deviceIdentifier"));
    v116 = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (id)objc_msgSend(v53, "initWithDomain:code:userInfo:", v54, 2);
    v21 = 0;
    v31 = 0;
    *a4 = v55;
    v7 = v92;
    goto LABEL_107;
  }
  v21 = v17;
LABEL_25:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isPositiveLabeled"));
  v22 = objc_claimAutoreleasedReturnValue();
  v85 = (void *)v22;
  if (!v22)
  {
    v24 = 0;
    v7 = v92;
    goto LABEL_54;
  }
  v23 = (void *)v22;
  objc_opt_class();
  v7 = v92;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = v23;
      goto LABEL_54;
    }
    if (a4)
    {
      v90 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v56 = *MEMORY[0x1E0D025B8];
      v113 = *MEMORY[0x1E0CB2D50];
      v57 = v21;
      v58 = objc_alloc(MEMORY[0x1E0CB3940]);
      v77 = objc_opt_class();
      v59 = v58;
      v21 = v57;
      v86 = (id)objc_msgSend(v59, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v77, CFSTR("isPositiveLabeled"));
      v114 = v86;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = (id)objc_msgSend(v90, "initWithDomain:code:userInfo:", v56, 2);
      v24 = 0;
      v31 = 0;
      *a4 = v60;
LABEL_111:
      v8 = v88;
      v27 = v95;
      goto LABEL_87;
    }
    v24 = 0;
    v31 = 0;
LABEL_107:
    v8 = v88;
    v27 = v95;
    goto LABEL_88;
  }
  v24 = 0;
LABEL_54:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("labelingPolicyVersion"));
  v48 = objc_claimAutoreleasedReturnValue();
  v84 = v21;
  v82 = (void *)v48;
  if (v48)
  {
    v49 = (void *)v48;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v86 = v49;
        goto LABEL_57;
      }
      if (a4)
      {
        v61 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v62 = *MEMORY[0x1E0D025B8];
        v111 = *MEMORY[0x1E0CB2D50];
        v83 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("labelingPolicyVersion"));
        v112 = v83;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1);
        v63 = objc_claimAutoreleasedReturnValue();
        v64 = v62;
        v21 = v84;
        v79 = (void *)v63;
        v86 = 0;
        v31 = 0;
        *a4 = (id)objc_msgSend(v61, "initWithDomain:code:userInfo:", v64, 2);
        v8 = v88;
        v27 = v95;
        goto LABEL_86;
      }
      v86 = 0;
      v31 = 0;
      goto LABEL_111;
    }
  }
  v86 = 0;
LABEL_57:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("labelingEvidence"));
  v50 = objc_claimAutoreleasedReturnValue();
  v79 = (void *)v50;
  if (!v50 || (v51 = (void *)v50, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v83 = 0;
LABEL_76:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sharingEventUID"));
    v65 = objc_claimAutoreleasedReturnValue();
    v91 = (void *)v65;
    if (v65 && (v66 = (void *)v65, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v80 = v66;
        goto LABEL_79;
      }
      if (a4)
      {
        v81 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v71 = *MEMORY[0x1E0D025B8];
        v107 = *MEMORY[0x1E0CB2D50];
        v68 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("sharingEventUID"));
        v108 = v68;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = (id)objc_msgSend(v81, "initWithDomain:code:userInfo:", v71, 2, v67);
        v31 = 0;
        v80 = 0;
        *a4 = v72;
        v27 = v95;
        goto LABEL_83;
      }
      v80 = 0;
      v31 = 0;
      v27 = v95;
    }
    else
    {
      v80 = 0;
LABEL_79:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("configurationInfo"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v67 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v68 = 0;
        goto LABEL_82;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v68 = v67;
LABEL_82:
        LODWORD(v76) = objc_msgSend(v83, "intValue");
        v27 = v95;
        self = -[BMMLSELabeledDataStore initWithItemIdentifier:featureVersion:featureVector:deviceIdentifier:isPositiveLabeled:labelingPolicyVersion:labelingEvidence:sharingEventUID:configurationInfo:](self, "initWithItemIdentifier:featureVersion:featureVector:deviceIdentifier:isPositiveLabeled:labelingPolicyVersion:labelingEvidence:sharingEventUID:configurationInfo:", v7, v95, v98, v84, v24, v86, v76, v80, v68);
        v31 = self;
      }
      else
      {
        if (a4)
        {
          v93 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v78 = *MEMORY[0x1E0D025B8];
          v105 = *MEMORY[0x1E0CB2D50];
          v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("configurationInfo"));
          v106 = v73;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          *a4 = (id)objc_msgSend(v93, "initWithDomain:code:userInfo:", v78, 2, v74);

        }
        v68 = 0;
        v31 = 0;
        v27 = v95;
      }
LABEL_83:

      v21 = v84;
    }
    v69 = v91;
LABEL_85:

    v8 = v88;
    goto LABEL_86;
  }
  v52 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v83 = v51;
LABEL_75:
    v21 = v84;
    goto LABEL_76;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMLSELabeledDataStoreLabelingEvidenceTypeFromString(v51));
    v83 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_75;
  }
  if (a4)
  {
    v94 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v75 = *MEMORY[0x1E0D025B8];
    v109 = *MEMORY[0x1E0CB2D50];
    v80 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("labelingEvidence"));
    v110 = v80;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = 0;
    v31 = 0;
    *a4 = (id)objc_msgSend(v94, "initWithDomain:code:userInfo:", v75, 2, v69);
    v7 = v52;
    v27 = v95;
    v21 = v84;
    goto LABEL_85;
  }
  v83 = 0;
  v31 = 0;
  v8 = v88;
  v27 = v95;
  v21 = v84;
LABEL_86:

LABEL_87:
LABEL_88:

LABEL_89:
LABEL_90:

LABEL_91:
LABEL_93:

  v6 = v96;
LABEL_94:

LABEL_95:
  return v31;
}

- (id)_featureVectorJSONArray
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
  -[BMMLSELabeledDataStore featureVector](self, "featureVector", 0);
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
  uint64_t v3;
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
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[9];
  _QWORD v33[11];

  v33[9] = *MEMORY[0x1E0C80C00];
  -[BMMLSELabeledDataStore itemIdentifier](self, "itemIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  if (-[BMMLSELabeledDataStore hasFeatureVersion](self, "hasFeatureVersion"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMMLSELabeledDataStore featureVersion](self, "featureVersion"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  -[BMMLSELabeledDataStore _featureVectorJSONArray](self, "_featureVectorJSONArray");
  v5 = objc_claimAutoreleasedReturnValue();
  -[BMMLSELabeledDataStore deviceIdentifier](self, "deviceIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (-[BMMLSELabeledDataStore hasIsPositiveLabeled](self, "hasIsPositiveLabeled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMLSELabeledDataStore isPositiveLabeled](self, "isPositiveLabeled"));
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if (-[BMMLSELabeledDataStore hasLabelingPolicyVersion](self, "hasLabelingPolicyVersion"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMMLSELabeledDataStore labelingPolicyVersion](self, "labelingPolicyVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMLSELabeledDataStore labelingEvidence](self, "labelingEvidence"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSELabeledDataStore sharingEventUID](self, "sharingEventUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMLSELabeledDataStore configurationInfo](self, "configurationInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = CFSTR("itemIdentifier");
  v12 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v12;
  v33[0] = v12;
  v32[1] = CFSTR("featureVersion");
  v13 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v13;
  v33[1] = v13;
  v32[2] = CFSTR("featureVector");
  v14 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v3;
  v24 = (void *)v14;
  v33[2] = v14;
  v32[3] = CFSTR("deviceIdentifier");
  v15 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)v4;
  v23 = (void *)v15;
  v33[3] = v15;
  v32[4] = CFSTR("isPositiveLabeled");
  v16 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v5;
  v33[4] = v16;
  v32[5] = CFSTR("labelingPolicyVersion");
  v17 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v7;
  v18 = (void *)v6;
  v33[5] = v17;
  v32[6] = CFSTR("labelingEvidence");
  v19 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33[6] = v19;
  v32[7] = CFSTR("sharingEventUID");
  v20 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33[7] = v20;
  v32[8] = CFSTR("configurationInfo");
  v21 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v33[8] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 9);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (v10)
      goto LABEL_30;
  }
  else
  {

    if (v10)
      goto LABEL_30;
  }

LABEL_30:
  if (!v9)

  if (!v8)
  if (!v28)

  if (!v18)
  if (v29)
  {
    if (v30)
      goto LABEL_40;
LABEL_45:

    if (v31)
      goto LABEL_41;
LABEL_46:

    goto LABEL_41;
  }

  if (!v30)
    goto LABEL_45;
LABEL_40:
  if (!v31)
    goto LABEL_46;
LABEL_41:

  return v27;
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
  int v26;
  unsigned int v27;
  int v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMMLSELabeledDataStore itemIdentifier](self, "itemIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMMLSELabeledDataStore itemIdentifier](self, "itemIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "itemIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_33;
    }
    if (-[BMMLSELabeledDataStore hasFeatureVersion](self, "hasFeatureVersion")
      || objc_msgSend(v5, "hasFeatureVersion"))
    {
      if (!-[BMMLSELabeledDataStore hasFeatureVersion](self, "hasFeatureVersion"))
        goto LABEL_33;
      if (!objc_msgSend(v5, "hasFeatureVersion"))
        goto LABEL_33;
      v13 = -[BMMLSELabeledDataStore featureVersion](self, "featureVersion");
      if (v13 != objc_msgSend(v5, "featureVersion"))
        goto LABEL_33;
    }
    -[BMMLSELabeledDataStore featureVector](self, "featureVector");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "featureVector");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v14 == (void *)v15)
    {

    }
    else
    {
      v16 = (void *)v15;
      -[BMMLSELabeledDataStore featureVector](self, "featureVector");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "featureVector");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if (!v19)
        goto LABEL_33;
    }
    -[BMMLSELabeledDataStore deviceIdentifier](self, "deviceIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceIdentifier");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v20 == (void *)v21)
    {

    }
    else
    {
      v22 = (void *)v21;
      -[BMMLSELabeledDataStore deviceIdentifier](self, "deviceIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deviceIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqual:", v24);

      if (!v25)
        goto LABEL_33;
    }
    if (-[BMMLSELabeledDataStore hasIsPositiveLabeled](self, "hasIsPositiveLabeled")
      || objc_msgSend(v5, "hasIsPositiveLabeled"))
    {
      if (!-[BMMLSELabeledDataStore hasIsPositiveLabeled](self, "hasIsPositiveLabeled"))
        goto LABEL_33;
      if (!objc_msgSend(v5, "hasIsPositiveLabeled"))
        goto LABEL_33;
      v26 = -[BMMLSELabeledDataStore isPositiveLabeled](self, "isPositiveLabeled");
      if (v26 != objc_msgSend(v5, "isPositiveLabeled"))
        goto LABEL_33;
    }
    if (-[BMMLSELabeledDataStore hasLabelingPolicyVersion](self, "hasLabelingPolicyVersion")
      || objc_msgSend(v5, "hasLabelingPolicyVersion"))
    {
      if (!-[BMMLSELabeledDataStore hasLabelingPolicyVersion](self, "hasLabelingPolicyVersion"))
        goto LABEL_33;
      if (!objc_msgSend(v5, "hasLabelingPolicyVersion"))
        goto LABEL_33;
      v27 = -[BMMLSELabeledDataStore labelingPolicyVersion](self, "labelingPolicyVersion");
      if (v27 != objc_msgSend(v5, "labelingPolicyVersion"))
        goto LABEL_33;
    }
    v28 = -[BMMLSELabeledDataStore labelingEvidence](self, "labelingEvidence");
    if (v28 != objc_msgSend(v5, "labelingEvidence"))
      goto LABEL_33;
    -[BMMLSELabeledDataStore sharingEventUID](self, "sharingEventUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sharingEventUID");
    v30 = objc_claimAutoreleasedReturnValue();
    if (v29 == (void *)v30)
    {

    }
    else
    {
      v31 = (void *)v30;
      -[BMMLSELabeledDataStore sharingEventUID](self, "sharingEventUID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sharingEventUID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v32, "isEqual:", v33);

      if (!v34)
      {
LABEL_33:
        v12 = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    -[BMMLSELabeledDataStore configurationInfo](self, "configurationInfo");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configurationInfo");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36 == v37)
    {
      v12 = 1;
    }
    else
    {
      -[BMMLSELabeledDataStore configurationInfo](self, "configurationInfo");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "configurationInfo");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v38, "isEqual:", v39);

    }
    goto LABEL_34;
  }
  v12 = 0;
LABEL_35:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (unsigned)featureVersion
{
  return self->_featureVersion;
}

- (BOOL)hasFeatureVersion
{
  return self->_hasFeatureVersion;
}

- (void)setHasFeatureVersion:(BOOL)a3
{
  self->_hasFeatureVersion = a3;
}

- (NSArray)featureVector
{
  return self->_featureVector;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (BOOL)isPositiveLabeled
{
  return self->_isPositiveLabeled;
}

- (BOOL)hasIsPositiveLabeled
{
  return self->_hasIsPositiveLabeled;
}

- (void)setHasIsPositiveLabeled:(BOOL)a3
{
  self->_hasIsPositiveLabeled = a3;
}

- (unsigned)labelingPolicyVersion
{
  return self->_labelingPolicyVersion;
}

- (BOOL)hasLabelingPolicyVersion
{
  return self->_hasLabelingPolicyVersion;
}

- (void)setHasLabelingPolicyVersion:(BOOL)a3
{
  self->_hasLabelingPolicyVersion = a3;
}

- (int)labelingEvidence
{
  return self->_labelingEvidence;
}

- (NSString)sharingEventUID
{
  return self->_sharingEventUID;
}

- (NSString)configurationInfo
{
  return self->_configurationInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationInfo, 0);
  objc_storeStrong((id *)&self->_sharingEventUID, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_featureVector, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
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

    v4 = -[BMMLSELabeledDataStore initByReadFrom:]([BMMLSELabeledDataStore alloc], "initByReadFrom:", v7);
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
  void *v11;
  _QWORD v13[10];

  v13[9] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("itemIdentifier"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("featureVersion"), 0, 0, 2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("featureVector_json"), 5, 1, &__block_literal_global_288);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("deviceIdentifier"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isPositiveLabeled"), 0, 0, 5, 12, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("labelingPolicyVersion"), 0, 0, 6, 4, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("labelingEvidence"), 0, 0, 7, 4, 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sharingEventUID"), 2, 0, 8, 13, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("configurationInfo"), 2, 0, 9, 13, 0);
  v13[0] = v2;
  v13[1] = v3;
  v13[2] = v4;
  v13[3] = v5;
  v13[4] = v6;
  v13[5] = v7;
  v13[6] = v8;
  v13[7] = v9;
  v13[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1AE48;
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
  void *v11;
  _QWORD v13[10];

  v13[9] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("itemIdentifier"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("featureVersion"), 2, 4, 0, v2);
  v13[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("featureVector"), 3, 14, objc_opt_class());
  v13[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("deviceIdentifier"), 4, 13, 0);
  v13[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isPositiveLabeled"), 5, 12, 0);
  v13[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("labelingPolicyVersion"), 6, 4, 0);
  v13[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("labelingEvidence"), 7, 4, 0);
  v13[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sharingEventUID"), 8, 13, 0);
  v13[7] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("configurationInfo"), 9, 13, 0);
  v13[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __33__BMMLSELabeledDataStore_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_featureVectorJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
