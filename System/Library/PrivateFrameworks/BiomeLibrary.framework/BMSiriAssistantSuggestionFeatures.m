@implementation BMSiriAssistantSuggestionFeatures

- (BMSiriAssistantSuggestionFeatures)initWithSuggestionDetails:(id)a3 appUsageFeatures:(id)a4 deviceFeatures:(id)a5 environmentFeatures:(id)a6 icloudFeatures:(id)a7 temporalFeatures:(id)a8 engagementLabels:(id)a9 userSegmentation:(id)a10 loggingType:(int)a11
{
  id v18;
  BMSiriAssistantSuggestionFeatures *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v26 = a4;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v22 = a8;
  v21 = a9;
  v18 = a10;
  v28.receiver = self;
  v28.super_class = (Class)BMSiriAssistantSuggestionFeatures;
  v19 = -[BMEventBase init](&v28, sel_init);
  if (v19)
  {
    v19->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v19->_suggestionDetails, a3);
    objc_storeStrong((id *)&v19->_appUsageFeatures, a4);
    objc_storeStrong((id *)&v19->_deviceFeatures, a5);
    objc_storeStrong((id *)&v19->_environmentFeatures, a6);
    objc_storeStrong((id *)&v19->_icloudFeatures, a7);
    objc_storeStrong((id *)&v19->_temporalFeatures, a8);
    objc_storeStrong((id *)&v19->_engagementLabels, a9);
    objc_storeStrong((id *)&v19->_userSegmentation, a10);
    v19->_loggingType = a11;
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
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMSiriAssistantSuggestionFeatures suggestionDetails](self, "suggestionDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriAssistantSuggestionFeatures appUsageFeatures](self, "appUsageFeatures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriAssistantSuggestionFeatures deviceFeatures](self, "deviceFeatures");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriAssistantSuggestionFeatures environmentFeatures](self, "environmentFeatures");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriAssistantSuggestionFeatures icloudFeatures](self, "icloudFeatures");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriAssistantSuggestionFeatures temporalFeatures](self, "temporalFeatures");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriAssistantSuggestionFeatures engagementLabels](self, "engagementLabels");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriAssistantSuggestionFeatures userSegmentation](self, "userSegmentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  BMSiriAssistantSuggestionFeaturesLoggingTypeAsString(-[BMSiriAssistantSuggestionFeatures loggingType](self, "loggingType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriAssistantSuggestionFeatures with suggestionDetails: %@, appUsageFeatures: %@, deviceFeatures: %@, environmentFeatures: %@, icloudFeatures: %@, temporalFeatures: %@, engagementLabels: %@, userSegmentation: %@, loggingType: %@"), v4, v5, v6, v7, v8, v9, v10, v11, v12);

  return (NSString *)v13;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriAssistantSuggestionFeatures *v5;
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
  objc_class *v20;
  uint64_t v21;
  void *v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  BMSiriAssistantSuggestionFeatures *v30;
  objc_super v32;
  uint64_t v33;
  uint64_t v34;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BMSiriAssistantSuggestionFeatures;
  v5 = -[BMEventBase init](&v32, sel_init);
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
          v33 = 0;
          v34 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_63;
          v20 = -[BMSiriAssistantSuggestionFeaturesSuggestionDetails initByReadFrom:]([BMSiriAssistantSuggestionFeaturesSuggestionDetails alloc], "initByReadFrom:", v4);
          if (!v20)
            goto LABEL_63;
          v21 = 24;
          goto LABEL_46;
        case 2u:
          v33 = 0;
          v34 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_63;
          v20 = -[BMSiriAssistantSuggestionFeaturesAppUsageFeatures initByReadFrom:]([BMSiriAssistantSuggestionFeaturesAppUsageFeatures alloc], "initByReadFrom:", v4);
          if (!v20)
            goto LABEL_63;
          v21 = 32;
          goto LABEL_46;
        case 3u:
          v33 = 0;
          v34 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_63;
          v20 = -[BMSiriAssistantSuggestionFeaturesDeviceFeatures initByReadFrom:]([BMSiriAssistantSuggestionFeaturesDeviceFeatures alloc], "initByReadFrom:", v4);
          if (!v20)
            goto LABEL_63;
          v21 = 40;
          goto LABEL_46;
        case 4u:
          v33 = 0;
          v34 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_63;
          v20 = -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures initByReadFrom:]([BMSiriAssistantSuggestionFeaturesEnvironmentFeatures alloc], "initByReadFrom:", v4);
          if (!v20)
            goto LABEL_63;
          v21 = 48;
          goto LABEL_46;
        case 5u:
          v33 = 0;
          v34 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_63;
          v20 = -[BMSiriAssistantSuggestionFeaturesiCloudFeatures initByReadFrom:]([BMSiriAssistantSuggestionFeaturesiCloudFeatures alloc], "initByReadFrom:", v4);
          if (!v20)
            goto LABEL_63;
          v21 = 56;
          goto LABEL_46;
        case 6u:
          v33 = 0;
          v34 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_63;
          v20 = -[BMSiriAssistantSuggestionFeaturesTemporalFeatures initByReadFrom:]([BMSiriAssistantSuggestionFeaturesTemporalFeatures alloc], "initByReadFrom:", v4);
          if (!v20)
            goto LABEL_63;
          v21 = 64;
          goto LABEL_46;
        case 7u:
          v33 = 0;
          v34 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_63;
          v20 = -[BMSiriAssistantSuggestionFeaturesEngagementLabels initByReadFrom:]([BMSiriAssistantSuggestionFeaturesEngagementLabels alloc], "initByReadFrom:", v4);
          if (!v20)
            goto LABEL_63;
          v21 = 72;
          goto LABEL_46;
        case 8u:
          v33 = 0;
          v34 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_63;
          v20 = -[BMSiriAssistantSuggestionFeaturesUserSegmentation initByReadFrom:]([BMSiriAssistantSuggestionFeaturesUserSegmentation alloc], "initByReadFrom:", v4);
          if (!v20)
            goto LABEL_63;
          v21 = 80;
LABEL_46:
          v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = v20;

          PBReaderRecallMark();
          continue;
        case 9u:
          v23 = 0;
          v24 = 0;
          v25 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_63;
          continue;
      }
      while (1)
      {
        v26 = *v6;
        v27 = *(_QWORD *)&v4[v26];
        v28 = v27 + 1;
        if (v27 == -1 || v28 > *(_QWORD *)&v4[*v7])
          break;
        v29 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v27);
        *(_QWORD *)&v4[v26] = v28;
        v25 |= (unint64_t)(v29 & 0x7F) << v23;
        if ((v29 & 0x80) == 0)
          goto LABEL_57;
        v23 += 7;
        v17 = v24++ >= 9;
        if (v17)
        {
          LODWORD(v25) = 0;
          goto LABEL_59;
        }
      }
      v4[*v8] = 1;
LABEL_57:
      if (v4[*v8])
        LODWORD(v25) = 0;
LABEL_59:
      if (v25 >= 3)
        LODWORD(v25) = 0;
      v5->_loggingType = v25;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_63:
    v30 = 0;
  else
LABEL_64:
    v30 = v5;

  return v30;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_suggestionDetails)
  {
    PBDataWriterPlaceMark();
    -[BMSiriAssistantSuggestionFeaturesSuggestionDetails writeTo:](self->_suggestionDetails, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_appUsageFeatures)
  {
    PBDataWriterPlaceMark();
    -[BMSiriAssistantSuggestionFeaturesAppUsageFeatures writeTo:](self->_appUsageFeatures, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_deviceFeatures)
  {
    PBDataWriterPlaceMark();
    -[BMSiriAssistantSuggestionFeaturesDeviceFeatures writeTo:](self->_deviceFeatures, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_environmentFeatures)
  {
    PBDataWriterPlaceMark();
    -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures writeTo:](self->_environmentFeatures, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_icloudFeatures)
  {
    PBDataWriterPlaceMark();
    -[BMSiriAssistantSuggestionFeaturesiCloudFeatures writeTo:](self->_icloudFeatures, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_temporalFeatures)
  {
    PBDataWriterPlaceMark();
    -[BMSiriAssistantSuggestionFeaturesTemporalFeatures writeTo:](self->_temporalFeatures, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_engagementLabels)
  {
    PBDataWriterPlaceMark();
    -[BMSiriAssistantSuggestionFeaturesEngagementLabels writeTo:](self->_engagementLabels, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_userSegmentation)
  {
    PBDataWriterPlaceMark();
    -[BMSiriAssistantSuggestionFeaturesUserSegmentation writeTo:](self->_userSegmentation, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  PBDataWriterWriteUint32Field();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriAssistantSuggestionFeatures writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriAssistantSuggestionFeatures)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BMSiriAssistantSuggestionFeaturesSuggestionDetails *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  BMSiriAssistantSuggestionFeaturesTemporalFeatures *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  BMSiriAssistantSuggestionFeatures *v24;
  void *v25;
  id v26;
  BMSiriAssistantSuggestionFeaturesAppUsageFeatures *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  BMSiriAssistantSuggestionFeaturesDeviceFeatures *v38;
  id v39;
  id *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  BMSiriAssistantSuggestionFeaturesSuggestionDetails *v61;
  id v62;
  void *v63;
  void *v64;
  id *v65;
  id v66;
  id v67;
  void *v68;
  id *v69;
  id v70;
  uint64_t v71;
  id v72;
  id *v73;
  id v74;
  id v75;
  void *v76;
  id *v77;
  id v78;
  id v79;
  void *v80;
  uint64_t v81;
  void *v82;
  id v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  uint64_t v88;
  id v89;
  void *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  id *v95;
  id *v96;
  id v97;
  uint64_t v98;
  BMSiriAssistantSuggestionFeaturesUserSegmentation *v99;
  void *v100;
  uint64_t v101;
  id v102;
  BMSiriAssistantSuggestionFeaturesTemporalFeatures *v103;
  uint64_t v104;
  id v105;
  BMSiriAssistantSuggestionFeaturesEngagementLabels *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  id v110;
  void *v111;
  BMSiriAssistantSuggestionFeaturesiCloudFeatures *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *v117;
  BMSiriAssistantSuggestionFeaturesDeviceFeatures *v118;
  id v119;
  BMSiriAssistantSuggestionFeatures *v120;
  BMSiriAssistantSuggestionFeaturesSuggestionDetails *v121;
  BMSiriAssistantSuggestionFeaturesSuggestionDetails *v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  BMSiriAssistantSuggestionFeaturesUserSegmentation *v134;
  uint64_t v135;
  BMSiriAssistantSuggestionFeaturesEngagementLabels *v136;
  uint64_t v137;
  BMSiriAssistantSuggestionFeaturesTemporalFeatures *v138;
  uint64_t v139;
  BMSiriAssistantSuggestionFeaturesiCloudFeatures *v140;
  uint64_t v141;
  BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *v142;
  uint64_t v143;
  BMSiriAssistantSuggestionFeaturesDeviceFeatures *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  _QWORD v148[3];

  v148[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suggestionDetails"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("appUsageFeatures"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v10 = 0;
      goto LABEL_7;
    }
    v122 = v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = v7;
      v26 = v9;
      v129 = 0;
      v27 = -[BMSiriAssistantSuggestionFeaturesAppUsageFeatures initWithJSONDictionary:error:]([BMSiriAssistantSuggestionFeaturesAppUsageFeatures alloc], "initWithJSONDictionary:error:", v26, &v129);
      v28 = v129;
      if (v28)
      {
        v29 = v28;
        v30 = v6;
        v31 = v25;
        v32 = v9;
        v33 = v26;
        v8 = v122;
        if (a4)
          *a4 = objc_retainAutorelease(v28);

        v24 = 0;
        v34 = v33;
        v9 = v32;
        v11 = v34;
        v35 = v31;
        v6 = v30;
        v10 = v27;
        v7 = v35;
        goto LABEL_111;
      }

      v8 = v122;
      v10 = v27;
      v7 = v25;
LABEL_7:
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("deviceFeatures"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = self;
      if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v24 = 0;
LABEL_110:
            self = v120;
            goto LABEL_111;
          }
          v119 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v56 = v11;
          v57 = v7;
          v58 = v56;
          v96 = a4;
          v59 = *MEMORY[0x1E0D025B8];
          v143 = *MEMORY[0x1E0CB2D50];
          v60 = v10;
          v61 = v8;
          v62 = objc_alloc(MEMORY[0x1E0CB3940]);
          v93 = objc_opt_class();
          v63 = v62;
          v8 = v61;
          v10 = v60;
          v38 = (BMSiriAssistantSuggestionFeaturesDeviceFeatures *)objc_msgSend(v63, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), v93, CFSTR("deviceFeatures"));
          v144 = v38;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v144, &v143, 1);
          v12 = (id)objc_claimAutoreleasedReturnValue();
          v24 = 0;
          *v96 = (id)objc_msgSend(v119, "initWithDomain:code:userInfo:", v59, 2, v12);
          v64 = v58;
          v7 = v57;
          v11 = v64;
          goto LABEL_109;
        }
        v12 = v11;
        v128 = 0;
        v118 = -[BMSiriAssistantSuggestionFeaturesDeviceFeatures initWithJSONDictionary:error:]([BMSiriAssistantSuggestionFeaturesDeviceFeatures alloc], "initWithJSONDictionary:error:", v12, &v128);
        v36 = v128;
        if (v36)
        {
          v37 = v36;
          if (a4)
            *a4 = objc_retainAutorelease(v36);

          v24 = 0;
          v38 = v118;
          goto LABEL_109;
        }

      }
      else
      {
        v118 = 0;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("environmentFeatures"));
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v121 = v8;
      if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v117 = 0;
        goto LABEL_13;
      }
      v113 = v10;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v12;
        v127 = 0;
        v117 = -[BMSiriAssistantSuggestionFeaturesEnvironmentFeatures initWithJSONDictionary:error:]([BMSiriAssistantSuggestionFeaturesEnvironmentFeatures alloc], "initWithJSONDictionary:error:", v13, &v127);
        v45 = v127;
        if (v45)
        {
          v46 = v45;
          if (a4)
            *a4 = objc_retainAutorelease(v45);

          v24 = 0;
          v38 = v118;
          goto LABEL_108;
        }

LABEL_13:
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("icloudFeatures"));
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v111 = v7;
        if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v112 = 0;
LABEL_16:
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("temporalFeatures"));
          v14 = (id)objc_claimAutoreleasedReturnValue();
          if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            v107 = v11;
            v115 = v10;
            v65 = a4;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!a4)
              {
                v24 = 0;
                v10 = v115;
                v38 = v118;
                goto LABEL_106;
              }
              v110 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v104 = *MEMORY[0x1E0D025B8];
              v137 = *MEMORY[0x1E0CB2D50];
              v19 = (BMSiriAssistantSuggestionFeaturesTemporalFeatures *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("temporalFeatures"));
              v138 = v19;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v138, &v137, 1);
              v81 = objc_claimAutoreleasedReturnValue();
              v82 = v110;
              v108 = (void *)v81;
              v24 = 0;
              *v65 = (id)objc_msgSend(v82, "initWithDomain:code:userInfo:", v104, 2);
              v10 = v115;
              v38 = v118;
              goto LABEL_105;
            }
            v66 = v14;
            v125 = 0;
            v19 = -[BMSiriAssistantSuggestionFeaturesTemporalFeatures initWithJSONDictionary:error:]([BMSiriAssistantSuggestionFeaturesTemporalFeatures alloc], "initWithJSONDictionary:error:", v66, &v125);
            v67 = v125;
            if (v67)
            {
              v68 = v67;
              v108 = v66;
              v11 = v107;
              if (v65)
                *v65 = objc_retainAutorelease(v67);

              v24 = 0;
              v10 = v115;
              v38 = v118;
              goto LABEL_105;
            }
            v102 = v14;
            v103 = v19;

            a4 = v65;
            v10 = v115;
            v11 = v107;
          }
          else
          {
            v102 = v14;
            v103 = 0;
          }
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("engagementLabels"));
          v15 = objc_claimAutoreleasedReturnValue();
          v108 = (void *)v15;
          if (v15 && (v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            v116 = v10;
            v73 = a4;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v19 = v103;
              if (!v73)
              {
                v24 = 0;
                v10 = v116;
                v38 = v118;
                v14 = v102;
                goto LABEL_105;
              }
              v84 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v101 = *MEMORY[0x1E0D025B8];
              v135 = *MEMORY[0x1E0CB2D50];
              v106 = (BMSiriAssistantSuggestionFeaturesEngagementLabels *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("engagementLabels"));
              v136 = v106;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v136, &v135, 1);
              v85 = objc_claimAutoreleasedReturnValue();
              v86 = v101;
              v100 = (void *)v85;
              v24 = 0;
              *v73 = (id)objc_msgSend(v84, "initWithDomain:code:userInfo:", v86, 2);
              v10 = v116;
              goto LABEL_103;
            }
            v97 = v13;
            v74 = v16;
            v124 = 0;
            v106 = -[BMSiriAssistantSuggestionFeaturesEngagementLabels initWithJSONDictionary:error:]([BMSiriAssistantSuggestionFeaturesEngagementLabels alloc], "initWithJSONDictionary:error:", v74, &v124);
            v75 = v124;
            v19 = v103;
            if (v75)
            {
              v76 = v75;
              v100 = v74;
              if (v73)
                *v73 = objc_retainAutorelease(v75);

              v24 = 0;
              v10 = v116;
              v38 = v118;
              v14 = v102;
              goto LABEL_120;
            }

            a4 = v73;
            v10 = v116;
          }
          else
          {
            v97 = v13;
            v106 = 0;
          }
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("userSegmentation"));
          v17 = objc_claimAutoreleasedReturnValue();
          v100 = (void *)v17;
          if (!v17 || (v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v95 = a4;
            v99 = 0;
            goto LABEL_25;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v95 = a4;
            v21 = v18;
            v123 = 0;
            v99 = -[BMSiriAssistantSuggestionFeaturesUserSegmentation initWithJSONDictionary:error:]([BMSiriAssistantSuggestionFeaturesUserSegmentation alloc], "initWithJSONDictionary:error:", v21, &v123);
            v79 = v123;
            if (v79)
            {
              v80 = v79;
              v13 = v97;
              v19 = v103;
              if (v95)
                *v95 = objc_retainAutorelease(v79);

              v24 = 0;
              goto LABEL_102;
            }

LABEL_25:
            v19 = v103;
            v13 = v97;
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("loggingType"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v83 = v20;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (v95)
                  {
                    v105 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v98 = *MEMORY[0x1E0D025B8];
                    v131 = *MEMORY[0x1E0CB2D50];
                    v91 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("loggingType"));
                    v132 = v91;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v132, &v131, 1);
                    v92 = (void *)objc_claimAutoreleasedReturnValue();
                    *v95 = (id)objc_msgSend(v105, "initWithDomain:code:userInfo:", v98, 2, v92);

                  }
                  v21 = 0;
                  v24 = 0;
                  goto LABEL_101;
                }
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMSiriAssistantSuggestionFeaturesLoggingTypeFromString(v20));
                v83 = (id)objc_claimAutoreleasedReturnValue();
              }
              v21 = v83;
            }
            else
            {
              v21 = 0;
            }
            LODWORD(v94) = objc_msgSend(v21, "intValue");
            v24 = -[BMSiriAssistantSuggestionFeatures initWithSuggestionDetails:appUsageFeatures:deviceFeatures:environmentFeatures:icloudFeatures:temporalFeatures:engagementLabels:userSegmentation:loggingType:](v120, "initWithSuggestionDetails:appUsageFeatures:deviceFeatures:environmentFeatures:icloudFeatures:temporalFeatures:engagementLabels:userSegmentation:loggingType:", v121, v10, v118, v117, v112, v103, v106, v99, v94);
            v120 = v24;
LABEL_101:

            goto LABEL_102;
          }
          if (a4)
          {
            v87 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v88 = *MEMORY[0x1E0D025B8];
            v133 = *MEMORY[0x1E0CB2D50];
            v99 = (BMSiriAssistantSuggestionFeaturesUserSegmentation *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("userSegmentation"));
            v134 = v99;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v134, &v133, 1);
            v21 = (id)objc_claimAutoreleasedReturnValue();
            v89 = (id)objc_msgSend(v87, "initWithDomain:code:userInfo:", v88, 2, v21);
            v24 = 0;
            *a4 = v89;
            v19 = v103;
            v13 = v97;
LABEL_102:

LABEL_103:
            v38 = v118;
            v14 = v102;
LABEL_104:

LABEL_105:
            goto LABEL_106;
          }
          v24 = 0;
          v38 = v118;
          v14 = v102;
          v19 = v103;
LABEL_120:
          v13 = v97;
          goto LABEL_104;
        }
        v114 = v10;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = v13;
          v126 = 0;
          v112 = -[BMSiriAssistantSuggestionFeaturesiCloudFeatures initWithJSONDictionary:error:]([BMSiriAssistantSuggestionFeaturesiCloudFeatures alloc], "initWithJSONDictionary:error:", v14, &v126);
          v54 = v126;
          if (!v54)
          {

            goto LABEL_16;
          }
          v55 = v54;
          if (a4)
            *a4 = objc_retainAutorelease(v54);

          v24 = 0;
        }
        else
        {
          if (!a4)
          {
            v24 = 0;
            v38 = v118;
LABEL_107:
            v7 = v111;
            goto LABEL_108;
          }
          v77 = a4;
          v78 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v109 = *MEMORY[0x1E0D025B8];
          v139 = *MEMORY[0x1E0CB2D50];
          v112 = (BMSiriAssistantSuggestionFeaturesiCloudFeatures *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("icloudFeatures"));
          v140 = v112;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v140, &v139, 1);
          v14 = (id)objc_claimAutoreleasedReturnValue();
          v24 = 0;
          *v77 = (id)objc_msgSend(v78, "initWithDomain:code:userInfo:", v109, 2, v14);
        }
        v10 = v114;
        v38 = v118;
LABEL_106:

        goto LABEL_107;
      }
      if (a4)
      {
        v69 = a4;
        v70 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v71 = *MEMORY[0x1E0D025B8];
        v141 = *MEMORY[0x1E0CB2D50];
        v117 = (BMSiriAssistantSuggestionFeaturesEnvironmentFeatures *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("environmentFeatures"));
        v142 = v117;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v142, &v141, 1);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v72 = (id)objc_msgSend(v70, "initWithDomain:code:userInfo:", v71, 2, v13);
        v24 = 0;
        *v69 = v72;
        v10 = v113;
        v38 = v118;
LABEL_108:

        v8 = v121;
        goto LABEL_109;
      }
      v24 = 0;
      v38 = v118;
LABEL_109:

      goto LABEL_110;
    }
    if (a4)
    {
      v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v48 = v7;
      v49 = *MEMORY[0x1E0D025B8];
      v145 = *MEMORY[0x1E0CB2D50];
      v50 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("appUsageFeatures"));
      v146 = v50;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v146, &v145, 1);
      v51 = objc_claimAutoreleasedReturnValue();
      v52 = v49;
      v7 = v48;
      v11 = (void *)v51;
      v53 = (id)objc_msgSend(v47, "initWithDomain:code:userInfo:", v52, 2, v51);
      v24 = 0;
      *a4 = v53;
      v10 = (void *)v50;
LABEL_111:

      goto LABEL_112;
    }
    v24 = 0;
LABEL_112:

    goto LABEL_113;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v7;
    v130 = 0;
    v8 = -[BMSiriAssistantSuggestionFeaturesSuggestionDetails initWithJSONDictionary:error:]([BMSiriAssistantSuggestionFeaturesSuggestionDetails alloc], "initWithJSONDictionary:error:", v9, &v130);
    v22 = v130;
    if (v22)
    {
      v23 = v22;
      if (a4)
        *a4 = objc_retainAutorelease(v22);

      v24 = 0;
      goto LABEL_112;
    }

    goto LABEL_4;
  }
  if (a4)
  {
    v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v40 = a4;
    v41 = v7;
    v42 = *MEMORY[0x1E0D025B8];
    v147 = *MEMORY[0x1E0CB2D50];
    v8 = (BMSiriAssistantSuggestionFeaturesSuggestionDetails *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("suggestionDetails"));
    v148[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v148, &v147, 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v43 = v42;
    v7 = v41;
    v44 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v43, 2, v9);
    v24 = 0;
    *v40 = v44;
    goto LABEL_112;
  }
  v24 = 0;
LABEL_113:

  return v24;
}

- (id)jsonDictionary
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[9];
  _QWORD v40[11];

  v40[9] = *MEMORY[0x1E0C80C00];
  -[BMSiriAssistantSuggestionFeatures suggestionDetails](self, "suggestionDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = objc_claimAutoreleasedReturnValue();

  -[BMSiriAssistantSuggestionFeatures appUsageFeatures](self, "appUsageFeatures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jsonDictionary");
  v6 = objc_claimAutoreleasedReturnValue();

  -[BMSiriAssistantSuggestionFeatures deviceFeatures](self, "deviceFeatures");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "jsonDictionary");
  v8 = objc_claimAutoreleasedReturnValue();

  -[BMSiriAssistantSuggestionFeatures environmentFeatures](self, "environmentFeatures");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "jsonDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMSiriAssistantSuggestionFeatures icloudFeatures](self, "icloudFeatures");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "jsonDictionary");
  v12 = objc_claimAutoreleasedReturnValue();

  -[BMSiriAssistantSuggestionFeatures temporalFeatures](self, "temporalFeatures");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "jsonDictionary");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMSiriAssistantSuggestionFeatures engagementLabels](self, "engagementLabels");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "jsonDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMSiriAssistantSuggestionFeatures userSegmentation](self, "userSegmentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "jsonDictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMSiriAssistantSuggestionFeatures loggingType](self, "loggingType"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = CFSTR("suggestionDetails");
  v19 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v19;
  v40[0] = v19;
  v39[1] = CFSTR("appUsageFeatures");
  v20 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)v20;
  v40[1] = v20;
  v39[2] = CFSTR("deviceFeatures");
  v21 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v37 = (void *)v4;
  v31 = (void *)v21;
  v40[2] = v21;
  v39[3] = CFSTR("environmentFeatures");
  v22 = (uint64_t)v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v36 = (void *)v6;
  v30 = (void *)v22;
  v40[3] = v22;
  v39[4] = CFSTR("icloudFeatures");
  v23 = (void *)v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v35 = (void *)v8;
  v40[4] = v23;
  v39[5] = CFSTR("temporalFeatures");
  v24 = v38;
  if (!v38)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v40[5] = v24;
  v39[6] = CFSTR("engagementLabels");
  v25 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v12;
  v40[6] = v25;
  v39[7] = CFSTR("userSegmentation");
  v27 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v40[7] = v27;
  v39[8] = CFSTR("loggingType");
  v28 = v18;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v40[8] = v28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 9);
  v34 = (id)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    if (v17)
      goto LABEL_21;
LABEL_33:

    if (v15)
      goto LABEL_22;
    goto LABEL_34;
  }

  if (!v17)
    goto LABEL_33;
LABEL_21:
  if (v15)
    goto LABEL_22;
LABEL_34:

LABEL_22:
  if (!v38)

  if (!v26)
  if (!v10)

  if (v35)
  {
    if (v36)
      goto LABEL_30;
LABEL_36:

    if (v37)
      goto LABEL_31;
LABEL_37:

    goto LABEL_31;
  }

  if (!v36)
    goto LABEL_36;
LABEL_30:
  if (!v37)
    goto LABEL_37;
LABEL_31:

  return v34;
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
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  int v56;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSiriAssistantSuggestionFeatures suggestionDetails](self, "suggestionDetails");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "suggestionDetails");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSiriAssistantSuggestionFeatures suggestionDetails](self, "suggestionDetails");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "suggestionDetails");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_33;
    }
    -[BMSiriAssistantSuggestionFeatures appUsageFeatures](self, "appUsageFeatures");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appUsageFeatures");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMSiriAssistantSuggestionFeatures appUsageFeatures](self, "appUsageFeatures");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appUsageFeatures");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_33;
    }
    -[BMSiriAssistantSuggestionFeatures deviceFeatures](self, "deviceFeatures");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceFeatures");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMSiriAssistantSuggestionFeatures deviceFeatures](self, "deviceFeatures");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deviceFeatures");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_33;
    }
    -[BMSiriAssistantSuggestionFeatures environmentFeatures](self, "environmentFeatures");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "environmentFeatures");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMSiriAssistantSuggestionFeatures environmentFeatures](self, "environmentFeatures");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "environmentFeatures");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_33;
    }
    -[BMSiriAssistantSuggestionFeatures icloudFeatures](self, "icloudFeatures");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "icloudFeatures");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMSiriAssistantSuggestionFeatures icloudFeatures](self, "icloudFeatures");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "icloudFeatures");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
        goto LABEL_33;
    }
    -[BMSiriAssistantSuggestionFeatures temporalFeatures](self, "temporalFeatures");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "temporalFeatures");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v37 == (void *)v38)
    {

    }
    else
    {
      v39 = (void *)v38;
      -[BMSiriAssistantSuggestionFeatures temporalFeatures](self, "temporalFeatures");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "temporalFeatures");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v40, "isEqual:", v41);

      if (!v42)
        goto LABEL_33;
    }
    -[BMSiriAssistantSuggestionFeatures engagementLabels](self, "engagementLabels");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "engagementLabels");
    v44 = objc_claimAutoreleasedReturnValue();
    if (v43 == (void *)v44)
    {

    }
    else
    {
      v45 = (void *)v44;
      -[BMSiriAssistantSuggestionFeatures engagementLabels](self, "engagementLabels");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "engagementLabels");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v46, "isEqual:", v47);

      if (!v48)
        goto LABEL_33;
    }
    -[BMSiriAssistantSuggestionFeatures userSegmentation](self, "userSegmentation");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userSegmentation");
    v50 = objc_claimAutoreleasedReturnValue();
    if (v49 == (void *)v50)
    {

    }
    else
    {
      v51 = (void *)v50;
      -[BMSiriAssistantSuggestionFeatures userSegmentation](self, "userSegmentation");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "userSegmentation");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v52, "isEqual:", v53);

      if (!v54)
      {
LABEL_33:
        v12 = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    v56 = -[BMSiriAssistantSuggestionFeatures loggingType](self, "loggingType");
    v12 = v56 == objc_msgSend(v5, "loggingType");
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

- (BMSiriAssistantSuggestionFeaturesSuggestionDetails)suggestionDetails
{
  return self->_suggestionDetails;
}

- (BMSiriAssistantSuggestionFeaturesAppUsageFeatures)appUsageFeatures
{
  return self->_appUsageFeatures;
}

- (BMSiriAssistantSuggestionFeaturesDeviceFeatures)deviceFeatures
{
  return self->_deviceFeatures;
}

- (BMSiriAssistantSuggestionFeaturesEnvironmentFeatures)environmentFeatures
{
  return self->_environmentFeatures;
}

- (BMSiriAssistantSuggestionFeaturesiCloudFeatures)icloudFeatures
{
  return self->_icloudFeatures;
}

- (BMSiriAssistantSuggestionFeaturesTemporalFeatures)temporalFeatures
{
  return self->_temporalFeatures;
}

- (BMSiriAssistantSuggestionFeaturesEngagementLabels)engagementLabels
{
  return self->_engagementLabels;
}

- (BMSiriAssistantSuggestionFeaturesUserSegmentation)userSegmentation
{
  return self->_userSegmentation;
}

- (int)loggingType
{
  return self->_loggingType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userSegmentation, 0);
  objc_storeStrong((id *)&self->_engagementLabels, 0);
  objc_storeStrong((id *)&self->_temporalFeatures, 0);
  objc_storeStrong((id *)&self->_icloudFeatures, 0);
  objc_storeStrong((id *)&self->_environmentFeatures, 0);
  objc_storeStrong((id *)&self->_deviceFeatures, 0);
  objc_storeStrong((id *)&self->_appUsageFeatures, 0);
  objc_storeStrong((id *)&self->_suggestionDetails, 0);
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

    v4 = -[BMSiriAssistantSuggestionFeatures initByReadFrom:]([BMSiriAssistantSuggestionFeatures alloc], "initByReadFrom:", v7);
    v4[4] = 0;

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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("suggestionDetails_json"), 5, 1, &__block_literal_global_993);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("appUsageFeatures_json"), 5, 1, &__block_literal_global_994);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("deviceFeatures_json"), 5, 1, &__block_literal_global_995_10835);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("environmentFeatures_json"), 5, 1, &__block_literal_global_996_10836);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("icloudFeatures_json"), 5, 1, &__block_literal_global_997);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("temporalFeatures_json"), 5, 1, &__block_literal_global_998);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("engagementLabels_json"), 5, 1, &__block_literal_global_999);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("userSegmentation_json"), 5, 1, &__block_literal_global_1000);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("loggingType"), 0, 0, 9, 4, 0);
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
  return &unk_1E5F1B328;
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
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("suggestionDetails"), 1, 14, objc_opt_class());
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("appUsageFeatures"), 2, 14, objc_opt_class(), v2);
  v13[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("deviceFeatures"), 3, 14, objc_opt_class());
  v13[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("environmentFeatures"), 4, 14, objc_opt_class());
  v13[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("icloudFeatures"), 5, 14, objc_opt_class());
  v13[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("temporalFeatures"), 6, 14, objc_opt_class());
  v13[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("engagementLabels"), 7, 14, objc_opt_class());
  v13[6] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("userSegmentation"), 8, 14, objc_opt_class());
  v13[7] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("loggingType"), 9, 4, 0);
  v13[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __44__BMSiriAssistantSuggestionFeatures_columns__block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userSegmentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __44__BMSiriAssistantSuggestionFeatures_columns__block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "engagementLabels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __44__BMSiriAssistantSuggestionFeatures_columns__block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "temporalFeatures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __44__BMSiriAssistantSuggestionFeatures_columns__block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "icloudFeatures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __44__BMSiriAssistantSuggestionFeatures_columns__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "environmentFeatures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __44__BMSiriAssistantSuggestionFeatures_columns__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceFeatures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __44__BMSiriAssistantSuggestionFeatures_columns__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appUsageFeatures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __44__BMSiriAssistantSuggestionFeatures_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suggestionDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BMSiriAssistantSuggestionFeatures)initWithSuggestionDetails:(id)a3 appUsageFeatures:(id)a4 deviceFeatures:(id)a5 environmentFeatures:(id)a6 icloudFeatures:(id)a7 temporalFeatures:(id)a8 engagementLabels:(id)a9 userSegmentation:(id)a10
{
  uint64_t v11;

  LODWORD(v11) = 0;
  return -[BMSiriAssistantSuggestionFeatures initWithSuggestionDetails:appUsageFeatures:deviceFeatures:environmentFeatures:icloudFeatures:temporalFeatures:engagementLabels:userSegmentation:loggingType:](self, "initWithSuggestionDetails:appUsageFeatures:deviceFeatures:environmentFeatures:icloudFeatures:temporalFeatures:engagementLabels:userSegmentation:loggingType:", a3, a4, a5, a6, a7, a8, a9, a10, v11);
}

@end
