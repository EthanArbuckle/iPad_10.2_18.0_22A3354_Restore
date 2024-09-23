@implementation BMTextUnderstandingPoemAnalytics

- (BMTextUnderstandingPoemAnalytics)initWithVisualIdentifier:(id)a3 prediction:(id)a4 named:(id)a5 shadowMatch:(id)a6 threshold:(id)a7 predictionConfidence:(id)a8 onboarding:(id)a9 nameMegadomeIdentifier:(id)a10 nameSource:(int)a11 features:(id)a12 accepted:(id)a13 rejected:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  BMTextUnderstandingPoemAnalytics *v27;
  double v28;
  double v29;
  id v33;
  id v34;
  id v35;
  id v36;
  objc_super v37;

  v35 = a3;
  v19 = a4;
  v36 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = v19;
  v24 = a9;
  v34 = a10;
  v33 = a12;
  v25 = a13;
  v26 = a14;
  v37.receiver = self;
  v37.super_class = (Class)BMTextUnderstandingPoemAnalytics;
  v27 = -[BMEventBase init](&v37, sel_init);
  if (v27)
  {
    v27->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v27->_visualIdentifier, a3);
    if (v23)
    {
      v27->_hasPrediction = 1;
      v27->_prediction = objc_msgSend(v23, "BOOLValue");
    }
    else
    {
      v27->_hasPrediction = 0;
      v27->_prediction = 0;
    }
    if (v36)
    {
      v27->_hasNamed = 1;
      v27->_named = objc_msgSend(v36, "BOOLValue");
    }
    else
    {
      v27->_hasNamed = 0;
      v27->_named = 0;
    }
    if (v20)
    {
      v27->_hasShadowMatch = 1;
      v27->_shadowMatch = objc_msgSend(v20, "BOOLValue");
    }
    else
    {
      v27->_hasShadowMatch = 0;
      v27->_shadowMatch = 0;
    }
    if (v21)
    {
      v27->_hasThreshold = 1;
      objc_msgSend(v21, "doubleValue");
    }
    else
    {
      v27->_hasThreshold = 0;
      v28 = -1.0;
    }
    v27->_threshold = v28;
    if (v22)
    {
      v27->_hasPredictionConfidence = 1;
      objc_msgSend(v22, "doubleValue");
    }
    else
    {
      v27->_hasPredictionConfidence = 0;
      v29 = -1.0;
    }
    v27->_predictionConfidence = v29;
    if (v24)
    {
      v27->_hasOnboarding = 1;
      v27->_onboarding = objc_msgSend(v24, "BOOLValue");
    }
    else
    {
      v27->_hasOnboarding = 0;
      v27->_onboarding = 0;
    }
    objc_storeStrong((id *)&v27->_nameMegadomeIdentifier, a10);
    v27->_nameSource = a11;
    objc_storeStrong((id *)&v27->_features, a12);
    if (v25)
    {
      v27->_hasAccepted = 1;
      v27->_accepted = objc_msgSend(v25, "BOOLValue");
    }
    else
    {
      v27->_hasAccepted = 0;
      v27->_accepted = 0;
    }
    if (v26)
    {
      v27->_hasRejected = 1;
      v27->_rejected = objc_msgSend(v26, "BOOLValue");
    }
    else
    {
      v27->_hasRejected = 0;
      v27->_rejected = 0;
    }
  }

  return v27;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  v16 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMTextUnderstandingPoemAnalytics visualIdentifier](self, "visualIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMTextUnderstandingPoemAnalytics prediction](self, "prediction"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMTextUnderstandingPoemAnalytics named](self, "named"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMTextUnderstandingPoemAnalytics shadowMatch](self, "shadowMatch"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[BMTextUnderstandingPoemAnalytics threshold](self, "threshold");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[BMTextUnderstandingPoemAnalytics predictionConfidence](self, "predictionConfidence");
  objc_msgSend(v6, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMTextUnderstandingPoemAnalytics onboarding](self, "onboarding"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMTextUnderstandingPoemAnalytics nameMegadomeIdentifier](self, "nameMegadomeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BMTextUnderstandingPoemAnalyticsSourcesAsString(-[BMTextUnderstandingPoemAnalytics nameSource](self, "nameSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMTextUnderstandingPoemAnalytics features](self, "features");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMTextUnderstandingPoemAnalytics accepted](self, "accepted"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMTextUnderstandingPoemAnalytics rejected](self, "rejected"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("BMTextUnderstandingPoemAnalytics with visualIdentifier: %@, prediction: %@, named: %@, shadowMatch: %@, threshold: %@, predictionConfidence: %@, onboarding: %@, nameMegadomeIdentifier: %@, nameSource: %@, features: %@, accepted: %@, rejected: %@"), v15, v19, v18, v3, v5, v14, v7, v8, v9, v10, v11, v12);

  return (NSString *)v17;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMTextUnderstandingPoemAnalytics *v5;
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
  uint64_t v20;
  uint64_t v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
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
  uint64_t v40;
  unint64_t v41;
  char v42;
  uint64_t v43;
  unint64_t v44;
  objc_class *v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  void *v55;
  char v56;
  unsigned int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char v62;
  BMTextUnderstandingPoemAnalyticsFeatures *v63;
  BMTextUnderstandingPoemAnalyticsFeatures *features;
  char v65;
  unsigned int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  char v71;
  char v72;
  unsigned int v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  char v78;
  BOOL v79;
  uint64_t v80;
  uint64_t v81;
  BMTextUnderstandingPoemAnalytics *v82;
  objc_super v84;
  uint64_t v85;
  uint64_t v86;

  v4 = a3;
  v84.receiver = self;
  v84.super_class = (Class)BMTextUnderstandingPoemAnalytics;
  v5 = -[BMEventBase init](&v84, sel_init);
  if (!v5)
    goto LABEL_122;
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
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 40;
          goto LABEL_58;
        case 2u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          v5->_hasPrediction = 1;
          while (2)
          {
            v25 = *v6;
            v26 = *(_QWORD *)&v4[v25];
            v27 = v26 + 1;
            if (v26 == -1 || v27 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v28 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v26);
              *(_QWORD *)&v4[v25] = v27;
              v24 |= (unint64_t)(v28 & 0x7F) << v22;
              if (v28 < 0)
              {
                v22 += 7;
                v17 = v23++ >= 9;
                if (v17)
                {
                  v24 = 0;
                  goto LABEL_86;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v24 = 0;
LABEL_86:
          v79 = v24 != 0;
          v80 = 16;
          goto LABEL_113;
        case 3u:
          v29 = 0;
          v30 = 0;
          v31 = 0;
          v5->_hasNamed = 1;
          while (2)
          {
            v32 = *v6;
            v33 = *(_QWORD *)&v4[v32];
            v34 = v33 + 1;
            if (v33 == -1 || v34 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v35 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v33);
              *(_QWORD *)&v4[v32] = v34;
              v31 |= (unint64_t)(v35 & 0x7F) << v29;
              if (v35 < 0)
              {
                v29 += 7;
                v17 = v30++ >= 9;
                if (v17)
                {
                  v31 = 0;
                  goto LABEL_90;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v31 = 0;
LABEL_90:
          v79 = v31 != 0;
          v80 = 18;
          goto LABEL_113;
        case 4u:
          v36 = 0;
          v37 = 0;
          v38 = 0;
          v5->_hasShadowMatch = 1;
          while (2)
          {
            v39 = *v6;
            v40 = *(_QWORD *)&v4[v39];
            v41 = v40 + 1;
            if (v40 == -1 || v41 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v42 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v40);
              *(_QWORD *)&v4[v39] = v41;
              v38 |= (unint64_t)(v42 & 0x7F) << v36;
              if (v42 < 0)
              {
                v36 += 7;
                v17 = v37++ >= 9;
                if (v17)
                {
                  v38 = 0;
                  goto LABEL_94;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v38 = 0;
LABEL_94:
          v79 = v38 != 0;
          v80 = 20;
          goto LABEL_113;
        case 5u:
          v5->_hasThreshold = 1;
          v43 = *v6;
          v44 = *(_QWORD *)&v4[v43];
          if (v44 <= 0xFFFFFFFFFFFFFFF7 && v44 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v45 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v44);
            *(_QWORD *)&v4[v43] = v44 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v45 = 0;
          }
          v81 = 48;
          goto LABEL_118;
        case 6u:
          v5->_hasPredictionConfidence = 1;
          v46 = *v6;
          v47 = *(_QWORD *)&v4[v46];
          if (v47 <= 0xFFFFFFFFFFFFFFF7 && v47 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v45 = *(objc_class **)(*(_QWORD *)&v4[*v9] + v47);
            *(_QWORD *)&v4[v46] = v47 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v45 = 0;
          }
          v81 = 56;
LABEL_118:
          *(Class *)((char *)&v5->super.super.isa + v81) = v45;
          continue;
        case 7u:
          v48 = 0;
          v49 = 0;
          v50 = 0;
          v5->_hasOnboarding = 1;
          while (2)
          {
            v51 = *v6;
            v52 = *(_QWORD *)&v4[v51];
            v53 = v52 + 1;
            if (v52 == -1 || v53 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v54 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v52);
              *(_QWORD *)&v4[v51] = v53;
              v50 |= (unint64_t)(v54 & 0x7F) << v48;
              if (v54 < 0)
              {
                v48 += 7;
                v17 = v49++ >= 9;
                if (v17)
                {
                  v50 = 0;
                  goto LABEL_98;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v50 = 0;
LABEL_98:
          v79 = v50 != 0;
          v80 = 24;
          goto LABEL_113;
        case 8u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 64;
LABEL_58:
          v55 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 9u:
          v56 = 0;
          v57 = 0;
          v58 = 0;
          while (2)
          {
            v59 = *v6;
            v60 = *(_QWORD *)&v4[v59];
            v61 = v60 + 1;
            if (v60 == -1 || v61 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v62 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v60);
              *(_QWORD *)&v4[v59] = v61;
              v58 |= (unint64_t)(v62 & 0x7F) << v56;
              if (v62 < 0)
              {
                v56 += 7;
                v17 = v57++ >= 9;
                if (v17)
                {
                  LODWORD(v58) = 0;
                  goto LABEL_102;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            LODWORD(v58) = 0;
LABEL_102:
          if (v58 >= 6)
            LODWORD(v58) = 0;
          v5->_nameSource = v58;
          continue;
        case 0xAu:
          v85 = 0;
          v86 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_121;
          v63 = -[BMTextUnderstandingPoemAnalyticsFeatures initByReadFrom:]([BMTextUnderstandingPoemAnalyticsFeatures alloc], "initByReadFrom:", v4);
          if (!v63)
            goto LABEL_121;
          features = v5->_features;
          v5->_features = v63;

          PBReaderRecallMark();
          continue;
        case 0xBu:
          v65 = 0;
          v66 = 0;
          v67 = 0;
          v5->_hasAccepted = 1;
          while (2)
          {
            v68 = *v6;
            v69 = *(_QWORD *)&v4[v68];
            v70 = v69 + 1;
            if (v69 == -1 || v70 > *(_QWORD *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              v71 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v69);
              *(_QWORD *)&v4[v68] = v70;
              v67 |= (unint64_t)(v71 & 0x7F) << v65;
              if (v71 < 0)
              {
                v65 += 7;
                v17 = v66++ >= 9;
                if (v17)
                {
                  v67 = 0;
                  goto LABEL_108;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8])
            v67 = 0;
LABEL_108:
          v79 = v67 != 0;
          v80 = 26;
          goto LABEL_113;
        case 0xCu:
          v72 = 0;
          v73 = 0;
          v74 = 0;
          v5->_hasRejected = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_121;
          continue;
      }
      while (1)
      {
        v75 = *v6;
        v76 = *(_QWORD *)&v4[v75];
        v77 = v76 + 1;
        if (v76 == -1 || v77 > *(_QWORD *)&v4[*v7])
          break;
        v78 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v76);
        *(_QWORD *)&v4[v75] = v77;
        v74 |= (unint64_t)(v78 & 0x7F) << v72;
        if ((v78 & 0x80) == 0)
          goto LABEL_110;
        v72 += 7;
        v17 = v73++ >= 9;
        if (v17)
        {
          v74 = 0;
          goto LABEL_112;
        }
      }
      v4[*v8] = 1;
LABEL_110:
      if (v4[*v8])
        v74 = 0;
LABEL_112:
      v79 = v74 != 0;
      v80 = 28;
LABEL_113:
      *((_BYTE *)&v5->super.super.isa + v80) = v79;
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_121:
    v82 = 0;
  else
LABEL_122:
    v82 = v5;

  return v82;
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_visualIdentifier)
    PBDataWriterWriteStringField();
  if (self->_hasPrediction)
    PBDataWriterWriteBOOLField();
  if (self->_hasNamed)
    PBDataWriterWriteBOOLField();
  if (self->_hasShadowMatch)
    PBDataWriterWriteBOOLField();
  if (self->_hasThreshold)
    PBDataWriterWriteDoubleField();
  if (self->_hasPredictionConfidence)
    PBDataWriterWriteDoubleField();
  if (self->_hasOnboarding)
    PBDataWriterWriteBOOLField();
  if (self->_nameMegadomeIdentifier)
    PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_features)
  {
    PBDataWriterPlaceMark();
    -[BMTextUnderstandingPoemAnalyticsFeatures writeTo:](self->_features, "writeTo:", v4);
    PBDataWriterRecallMark();
  }
  if (self->_hasAccepted)
    PBDataWriterWriteBOOLField();
  if (self->_hasRejected)
    PBDataWriterWriteBOOLField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMTextUnderstandingPoemAnalytics writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMTextUnderstandingPoemAnalytics)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  BMTextUnderstandingPoemAnalytics *v27;
  id v28;
  uint64_t v29;
  id *v30;
  uint64_t v31;
  void *v32;
  id v33;
  id *v34;
  id v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  uint64_t v50;
  void *v51;
  id v52;
  BMTextUnderstandingPoemAnalytics *v53;
  id v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  uint64_t v63;
  id v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  uint64_t v71;
  id v72;
  id v73;
  void *v74;
  uint64_t v75;
  void *v76;
  id v77;
  id v78;
  uint64_t v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  BMTextUnderstandingPoemAnalytics *v84;
  id v85;
  void *v86;
  id v87;
  id v88;
  id v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  id v94;
  void *v95;
  void *v96;
  id v98;
  uint64_t v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  id v106;
  id v107;
  uint64_t v108;
  id v109;
  void *v110;
  void *v111;
  BMTextUnderstandingPoemAnalyticsFeatures *v112;
  void *v113;
  void *v114;
  void *v115;
  id v116;
  void *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  id v122;
  void *v123;
  id *v124;
  id v125;
  id v126;
  void *v127;
  id *v128;
  id v129;
  id v130;
  void *v131;
  id v133;
  id v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  id v138;
  uint64_t v139;
  BMTextUnderstandingPoemAnalyticsFeatures *v140;
  uint64_t v141;
  id v142;
  uint64_t v143;
  void *v144;
  uint64_t v145;
  id v146;
  uint64_t v147;
  id v148;
  uint64_t v149;
  id v150;
  uint64_t v151;
  id v152;
  uint64_t v153;
  void *v154;
  uint64_t v155;
  id *v156;
  uint64_t v157;
  _QWORD v158[3];

  v158[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("visualIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
LABEL_4:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("prediction"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v9 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
LABEL_7:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("named"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v124 = a4;
        a4 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v124 = a4;
        a4 = v10;
LABEL_10:
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shadowMatch"));
        v11 = objc_claimAutoreleasedReturnValue();
        v128 = a4;
        v129 = v9;
        v131 = (void *)v11;
        if (!v11 || (v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v13 = v6;
          v126 = 0;
LABEL_13:
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("threshold"));
          v14 = objc_claimAutoreleasedReturnValue();
          v127 = (void *)v14;
          if (v14 && (v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v120 = v8;
              if (!v124)
              {
                v130 = 0;
                v27 = 0;
                v53 = self;
                v41 = v126;
                v6 = v13;
LABEL_112:
                v9 = v129;
                goto LABEL_113;
              }
              v55 = v10;
              v56 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v57 = *MEMORY[0x1E0D025B8];
              v149 = *MEMORY[0x1E0CB2D50];
              v125 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("threshold"));
              v150 = v125;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v150, &v149, 1);
              v58 = objc_claimAutoreleasedReturnValue();
              v59 = v56;
              v10 = v55;
              a4 = v128;
              v123 = (void *)v58;
              v60 = (id)objc_msgSend(v59, "initWithDomain:code:userInfo:", v57, 2);
              v130 = 0;
              v27 = 0;
              *v124 = v60;
              goto LABEL_97;
            }
            v130 = v15;
          }
          else
          {
            v130 = 0;
          }
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("predictionConfidence"));
          v16 = objc_claimAutoreleasedReturnValue();
          v123 = (void *)v16;
          if (!v16 || (v17 = (void *)v16, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v125 = 0;
LABEL_19:
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("onboarding"));
            v18 = objc_claimAutoreleasedReturnValue();
            v6 = v13;
            v117 = (void *)v18;
            if (v18 && (v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!v124)
                {
                  v122 = 0;
                  v27 = 0;
                  v53 = self;
                  v41 = v126;
                  goto LABEL_110;
                }
                v69 = v10;
                v70 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v71 = *MEMORY[0x1E0D025B8];
                v145 = *MEMORY[0x1E0CB2D50];
                v72 = v7;
                v73 = objc_alloc(MEMORY[0x1E0CB3940]);
                v104 = objc_opt_class();
                v74 = v73;
                v7 = v72;
                v19 = v117;
                v116 = (id)objc_msgSend(v74, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v104, CFSTR("onboarding"));
                v146 = v116;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v146, &v145, 1);
                v75 = objc_claimAutoreleasedReturnValue();
                v76 = v70;
                v10 = v69;
                a4 = v128;
                v115 = (void *)v75;
                v77 = (id)objc_msgSend(v76, "initWithDomain:code:userInfo:", v71, 2);
                v122 = 0;
                v27 = 0;
                *v124 = v77;
                v53 = self;
                goto LABEL_108;
              }
              v113 = v6;
              v122 = v19;
            }
            else
            {
              v113 = v6;
              v122 = 0;
            }
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("nameMegadomeIdentifier"));
            v20 = objc_claimAutoreleasedReturnValue();
            v115 = (void *)v20;
            if (v20 && (v21 = (void *)v20, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!v124)
                {
                  v116 = 0;
                  v27 = 0;
                  v53 = self;
                  v41 = v126;
                  v19 = v117;
                  v6 = v113;
                  goto LABEL_109;
                }
                v78 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v79 = *MEMORY[0x1E0D025B8];
                v143 = *MEMORY[0x1E0CB2D50];
                v114 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("nameMegadomeIdentifier"));
                v144 = v114;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v144, &v143, 1);
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                v81 = (id)objc_msgSend(v78, "initWithDomain:code:userInfo:", v79, 2, v80);
                v116 = 0;
                v27 = 0;
                *v124 = v81;
                v53 = self;
                v19 = v117;
                v6 = v113;
                goto LABEL_107;
              }
              v116 = v21;
            }
            else
            {
              v116 = 0;
            }
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("nameSource"));
            v22 = objc_claimAutoreleasedReturnValue();
            v6 = v113;
            v110 = v10;
            v111 = (void *)v22;
            if (v22 && (v23 = (void *)v22, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v54 = v23;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (!v124)
                  {
                    v114 = 0;
                    v27 = 0;
                    v53 = self;
                    v19 = v117;
                    goto LABEL_106;
                  }
                  v98 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v99 = *MEMORY[0x1E0D025B8];
                  v141 = *MEMORY[0x1E0CB2D50];
                  v88 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("nameSource"));
                  v142 = v88;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v142, &v141, 1);
                  v112 = (BMTextUnderstandingPoemAnalyticsFeatures *)objc_claimAutoreleasedReturnValue();
                  v100 = (id)objc_msgSend(v98, "initWithDomain:code:userInfo:", v99, 2);
                  v114 = 0;
                  v27 = 0;
                  *v124 = v100;
                  v53 = self;
                  goto LABEL_104;
                }
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMTextUnderstandingPoemAnalyticsSourcesFromString(v23));
                v54 = (id)objc_claimAutoreleasedReturnValue();
              }
              v114 = v54;
            }
            else
            {
              v114 = 0;
            }
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("features"));
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            if (v82 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!v124)
                {
                  v27 = 0;
                  v53 = self;
                  v19 = v117;
                  goto LABEL_105;
                }
                v106 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v91 = *MEMORY[0x1E0D025B8];
                v139 = *MEMORY[0x1E0CB2D50];
                v112 = (BMTextUnderstandingPoemAnalyticsFeatures *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("features"));
                v140 = v112;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v140, &v139, 1);
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                *v124 = (id)objc_msgSend(v106, "initWithDomain:code:userInfo:", v91, 2, v92);

                v27 = 0;
                v88 = v82;
                v53 = self;
LABEL_104:
                v19 = v117;

                v82 = v88;
LABEL_105:

                v10 = v110;
LABEL_106:
                v80 = v111;
LABEL_107:

LABEL_108:
                v41 = v126;
LABEL_109:

                goto LABEL_110;
              }
              v88 = v82;
              v134 = 0;
              v112 = -[BMTextUnderstandingPoemAnalyticsFeatures initWithJSONDictionary:error:]([BMTextUnderstandingPoemAnalyticsFeatures alloc], "initWithJSONDictionary:error:", v88, &v134);
              v89 = v134;
              if (v89)
              {
                v90 = v89;
                v53 = self;
                if (v124)
                  *v124 = objc_retainAutorelease(v89);

                v27 = 0;
                goto LABEL_104;
              }

            }
            else
            {
              v112 = 0;
            }
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("accepted"));
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v109 = v7;
            if (v83 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v121 = v8;
                v84 = self;
                if (!v124)
                {
                  v27 = 0;
                  v85 = 0;
                  goto LABEL_103;
                }
                v107 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v93 = *MEMORY[0x1E0D025B8];
                v137 = *MEMORY[0x1E0CB2D50];
                v87 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("accepted"));
                v138 = v87;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v138, &v137, 1);
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                v94 = (id)objc_msgSend(v107, "initWithDomain:code:userInfo:", v93, 2, v86);
                v27 = 0;
                v85 = 0;
                *v124 = v94;
                goto LABEL_101;
              }
              v84 = self;
              v85 = v83;
            }
            else
            {
              v84 = self;
              v85 = 0;
            }
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rejected"));
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v86 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v87 = 0;
LABEL_79:
              LODWORD(v105) = objc_msgSend(v114, "intValue");
              v27 = -[BMTextUnderstandingPoemAnalytics initWithVisualIdentifier:prediction:named:shadowMatch:threshold:predictionConfidence:onboarding:nameMegadomeIdentifier:nameSource:features:accepted:rejected:](v84, "initWithVisualIdentifier:prediction:named:shadowMatch:threshold:predictionConfidence:onboarding:nameMegadomeIdentifier:nameSource:features:accepted:rejected:", v109, v129, v128, v126, v130, v125, v122, v116, v105, v112, v85, v87);
              v84 = v27;
LABEL_102:

LABEL_103:
              v88 = v82;
              v53 = v84;
              v7 = v109;
              a4 = v128;
              goto LABEL_104;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v87 = v86;
              goto LABEL_79;
            }
            v121 = v8;
            if (v124)
            {
              v133 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v108 = *MEMORY[0x1E0D025B8];
              v135 = *MEMORY[0x1E0CB2D50];
              v95 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("rejected"));
              v136 = v95;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v136, &v135, 1);
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              *v124 = (id)objc_msgSend(v133, "initWithDomain:code:userInfo:", v108, 2, v96);

            }
            v87 = 0;
            v27 = 0;
LABEL_101:
            v8 = v121;
            goto LABEL_102;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v125 = v17;
            goto LABEL_19;
          }
          v120 = v8;
          if (v124)
          {
            v61 = v10;
            v62 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v63 = *MEMORY[0x1E0D025B8];
            v147 = *MEMORY[0x1E0CB2D50];
            v64 = v7;
            v65 = objc_alloc(MEMORY[0x1E0CB3940]);
            v103 = objc_opt_class();
            v66 = v65;
            v7 = v64;
            v122 = (id)objc_msgSend(v66, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v103, CFSTR("predictionConfidence"));
            v148 = v122;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v148, &v147, 1);
            v118 = objc_claimAutoreleasedReturnValue();
            v67 = v62;
            v10 = v61;
            a4 = v128;
            v68 = (id)objc_msgSend(v67, "initWithDomain:code:userInfo:", v63, 2, v118);
            v125 = 0;
            v27 = 0;
            *v124 = v68;
            v53 = self;
            v41 = v126;
            v6 = v13;
            v19 = (void *)v118;
LABEL_110:

            goto LABEL_111;
          }
          v125 = 0;
          v27 = 0;
LABEL_97:
          v8 = v120;
          v53 = self;
          v41 = v126;
          v6 = v13;
LABEL_111:

          goto LABEL_112;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = v6;
          v126 = v12;
          goto LABEL_13;
        }
        v119 = v8;
        if (v124)
        {
          v43 = v10;
          v44 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v45 = *MEMORY[0x1E0D025B8];
          v151 = *MEMORY[0x1E0CB2D50];
          v46 = v9;
          v47 = v7;
          v48 = objc_alloc(MEMORY[0x1E0CB3940]);
          v102 = objc_opt_class();
          v49 = v48;
          v7 = v47;
          v9 = v46;
          v130 = (id)objc_msgSend(v49, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v102, CFSTR("shadowMatch"));
          v152 = v130;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v152, &v151, 1);
          v50 = objc_claimAutoreleasedReturnValue();
          v51 = v44;
          v10 = v43;
          a4 = v128;
          v127 = (void *)v50;
          v52 = (id)objc_msgSend(v51, "initWithDomain:code:userInfo:", v45, 2);
          v41 = 0;
          v27 = 0;
          *v124 = v52;
          v53 = self;
LABEL_113:

          goto LABEL_114;
        }
        v41 = 0;
        v27 = 0;
LABEL_92:
        v8 = v119;
        v53 = self;
LABEL_114:

        goto LABEL_115;
      }
      if (a4)
      {
        v119 = v8;
        v34 = a4;
        v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v36 = *MEMORY[0x1E0D025B8];
        v153 = *MEMORY[0x1E0CB2D50];
        v37 = v9;
        v38 = v7;
        v39 = objc_alloc(MEMORY[0x1E0CB3940]);
        v101 = objc_opt_class();
        v40 = v39;
        v7 = v38;
        v9 = v37;
        v41 = (void *)objc_msgSend(v40, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v101, CFSTR("named"));
        v154 = v41;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v154, &v153, 1);
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v36, 2);
        a4 = 0;
        v27 = 0;
        *v34 = v42;
        goto LABEL_92;
      }
      v27 = 0;
LABEL_66:
      v53 = self;
LABEL_115:

      goto LABEL_116;
    }
    if (a4)
    {
      v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v29 = *MEMORY[0x1E0D025B8];
      v155 = *MEMORY[0x1E0CB2D50];
      v30 = a4;
      a4 = (id *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("prediction"));
      v156 = a4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v156, &v155, 1);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = v28;
      v10 = (void *)v31;
      v33 = (id)objc_msgSend(v32, "initWithDomain:code:userInfo:", v29, 2, v31);
      v9 = 0;
      v27 = 0;
      *v30 = v33;
      goto LABEL_66;
    }
    v9 = 0;
    v27 = 0;
LABEL_62:
    v53 = self;
LABEL_116:

    goto LABEL_117;
  }
  if (a4)
  {
    v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v25 = *MEMORY[0x1E0D025B8];
    v157 = *MEMORY[0x1E0CB2D50];
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("visualIdentifier"));
    v158[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v158, &v157, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (id)objc_msgSend(v24, "initWithDomain:code:userInfo:", v25, 2, v8);
    v7 = 0;
    v27 = 0;
    *a4 = v26;
    goto LABEL_62;
  }
  v7 = 0;
  v27 = 0;
  v53 = self;
LABEL_117:

  return v27;
}

- (id)jsonDictionary
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  double v7;
  void *v8;
  id v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  _QWORD v44[12];
  _QWORD v45[14];

  v45[12] = *MEMORY[0x1E0C80C00];
  -[BMTextUnderstandingPoemAnalytics visualIdentifier](self, "visualIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  if (-[BMTextUnderstandingPoemAnalytics hasPrediction](self, "hasPrediction"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMTextUnderstandingPoemAnalytics prediction](self, "prediction"));
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  if (-[BMTextUnderstandingPoemAnalytics hasNamed](self, "hasNamed"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMTextUnderstandingPoemAnalytics named](self, "named"));
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  if (-[BMTextUnderstandingPoemAnalytics hasShadowMatch](self, "hasShadowMatch"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMTextUnderstandingPoemAnalytics shadowMatch](self, "shadowMatch"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  if (!-[BMTextUnderstandingPoemAnalytics hasThreshold](self, "hasThreshold")
    || (-[BMTextUnderstandingPoemAnalytics threshold](self, "threshold"), fabs(v7) == INFINITY))
  {
    v9 = 0;
  }
  else
  {
    -[BMTextUnderstandingPoemAnalytics threshold](self, "threshold");
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[BMTextUnderstandingPoemAnalytics threshold](self, "threshold");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!-[BMTextUnderstandingPoemAnalytics hasPredictionConfidence](self, "hasPredictionConfidence")
    || (-[BMTextUnderstandingPoemAnalytics predictionConfidence](self, "predictionConfidence"), fabs(v10) == INFINITY))
  {
    v43 = 0;
  }
  else
  {
    -[BMTextUnderstandingPoemAnalytics predictionConfidence](self, "predictionConfidence");
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[BMTextUnderstandingPoemAnalytics predictionConfidence](self, "predictionConfidence");
    objc_msgSend(v11, "numberWithDouble:");
    v43 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (-[BMTextUnderstandingPoemAnalytics hasOnboarding](self, "hasOnboarding"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMTextUnderstandingPoemAnalytics onboarding](self, "onboarding"));
    v42 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v42 = 0;
  }
  -[BMTextUnderstandingPoemAnalytics nameMegadomeIdentifier](self, "nameMegadomeIdentifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMTextUnderstandingPoemAnalytics nameSource](self, "nameSource"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMTextUnderstandingPoemAnalytics features](self, "features");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "jsonDictionary");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[BMTextUnderstandingPoemAnalytics hasAccepted](self, "hasAccepted"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMTextUnderstandingPoemAnalytics accepted](self, "accepted"));
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  if (-[BMTextUnderstandingPoemAnalytics hasRejected](self, "hasRejected"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMTextUnderstandingPoemAnalytics rejected](self, "rejected"));
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  v44[0] = CFSTR("visualIdentifier");
  v15 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v15;
  v45[0] = v15;
  v44[1] = CFSTR("prediction");
  v16 = (uint64_t)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)v16;
  v45[1] = v16;
  v44[2] = CFSTR("named");
  v17 = (uint64_t)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v31 = (void *)v17;
  v45[2] = v17;
  v44[3] = CFSTR("shadowMatch");
  v18 = (uint64_t)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v38 = (void *)v3;
  v30 = (void *)v18;
  v45[3] = v18;
  v44[4] = CFSTR("threshold");
  v19 = (uint64_t)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v37 = v4;
  v29 = (void *)v19;
  v45[4] = v19;
  v44[5] = CFSTR("predictionConfidence");
  v20 = v43;
  if (!v43)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v36 = v5;
  v45[5] = v20;
  v44[6] = CFSTR("onboarding");
  v21 = v42;
  if (!v42)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v35 = v6;
  v45[6] = v21;
  v44[7] = CFSTR("nameMegadomeIdentifier");
  v22 = v41;
  if (!v41)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23 = v9;
  v45[7] = v22;
  v44[8] = CFSTR("nameSource");
  v24 = v40;
  if (!v40)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v45[8] = v24;
  v44[9] = CFSTR("features");
  v25 = v39;
  if (!v39)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v45[9] = v25;
  v44[10] = CFSTR("accepted");
  v26 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v45[10] = v26;
  v44[11] = CFSTR("rejected");
  v27 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v45[11] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 12);
  v34 = (id)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (v13)
      goto LABEL_53;
  }
  else
  {

    if (v13)
      goto LABEL_53;
  }

LABEL_53:
  if (!v39)

  if (!v40)
  if (!v41)

  if (!v42)
  if (!v43)

  if (!v23)
  if (v35)
  {
    if (v36)
      goto LABEL_67;
  }
  else
  {

    if (v36)
    {
LABEL_67:
      if (v37)
        goto LABEL_68;
LABEL_74:

      if (v38)
        goto LABEL_69;
LABEL_75:

      goto LABEL_69;
    }
  }

  if (!v37)
    goto LABEL_74;
LABEL_68:
  if (!v38)
    goto LABEL_75;
LABEL_69:

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
  int v12;
  int v13;
  int v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  int v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  int v36;
  _BOOL4 v37;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMTextUnderstandingPoemAnalytics visualIdentifier](self, "visualIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "visualIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMTextUnderstandingPoemAnalytics visualIdentifier](self, "visualIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "visualIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_56;
    }
    if (-[BMTextUnderstandingPoemAnalytics hasPrediction](self, "hasPrediction")
      || objc_msgSend(v5, "hasPrediction"))
    {
      if (!-[BMTextUnderstandingPoemAnalytics hasPrediction](self, "hasPrediction"))
        goto LABEL_56;
      if (!objc_msgSend(v5, "hasPrediction"))
        goto LABEL_56;
      v13 = -[BMTextUnderstandingPoemAnalytics prediction](self, "prediction");
      if (v13 != objc_msgSend(v5, "prediction"))
        goto LABEL_56;
    }
    if (-[BMTextUnderstandingPoemAnalytics hasNamed](self, "hasNamed") || objc_msgSend(v5, "hasNamed"))
    {
      if (!-[BMTextUnderstandingPoemAnalytics hasNamed](self, "hasNamed"))
        goto LABEL_56;
      if (!objc_msgSend(v5, "hasNamed"))
        goto LABEL_56;
      v14 = -[BMTextUnderstandingPoemAnalytics named](self, "named");
      if (v14 != objc_msgSend(v5, "named"))
        goto LABEL_56;
    }
    if (-[BMTextUnderstandingPoemAnalytics hasShadowMatch](self, "hasShadowMatch")
      || objc_msgSend(v5, "hasShadowMatch"))
    {
      if (!-[BMTextUnderstandingPoemAnalytics hasShadowMatch](self, "hasShadowMatch"))
        goto LABEL_56;
      if (!objc_msgSend(v5, "hasShadowMatch"))
        goto LABEL_56;
      v15 = -[BMTextUnderstandingPoemAnalytics shadowMatch](self, "shadowMatch");
      if (v15 != objc_msgSend(v5, "shadowMatch"))
        goto LABEL_56;
    }
    if (-[BMTextUnderstandingPoemAnalytics hasThreshold](self, "hasThreshold")
      || objc_msgSend(v5, "hasThreshold"))
    {
      if (!-[BMTextUnderstandingPoemAnalytics hasThreshold](self, "hasThreshold"))
        goto LABEL_56;
      if (!objc_msgSend(v5, "hasThreshold"))
        goto LABEL_56;
      -[BMTextUnderstandingPoemAnalytics threshold](self, "threshold");
      v17 = v16;
      objc_msgSend(v5, "threshold");
      if (v17 != v18)
        goto LABEL_56;
    }
    if (-[BMTextUnderstandingPoemAnalytics hasPredictionConfidence](self, "hasPredictionConfidence")
      || objc_msgSend(v5, "hasPredictionConfidence"))
    {
      if (!-[BMTextUnderstandingPoemAnalytics hasPredictionConfidence](self, "hasPredictionConfidence"))
        goto LABEL_56;
      if (!objc_msgSend(v5, "hasPredictionConfidence"))
        goto LABEL_56;
      -[BMTextUnderstandingPoemAnalytics predictionConfidence](self, "predictionConfidence");
      v20 = v19;
      objc_msgSend(v5, "predictionConfidence");
      if (v20 != v21)
        goto LABEL_56;
    }
    if (-[BMTextUnderstandingPoemAnalytics hasOnboarding](self, "hasOnboarding")
      || objc_msgSend(v5, "hasOnboarding"))
    {
      if (!-[BMTextUnderstandingPoemAnalytics hasOnboarding](self, "hasOnboarding"))
        goto LABEL_56;
      if (!objc_msgSend(v5, "hasOnboarding"))
        goto LABEL_56;
      v22 = -[BMTextUnderstandingPoemAnalytics onboarding](self, "onboarding");
      if (v22 != objc_msgSend(v5, "onboarding"))
        goto LABEL_56;
    }
    -[BMTextUnderstandingPoemAnalytics nameMegadomeIdentifier](self, "nameMegadomeIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nameMegadomeIdentifier");
    v24 = objc_claimAutoreleasedReturnValue();
    if (v23 == (void *)v24)
    {

    }
    else
    {
      v25 = (void *)v24;
      -[BMTextUnderstandingPoemAnalytics nameMegadomeIdentifier](self, "nameMegadomeIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "nameMegadomeIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v26, "isEqual:", v27);

      if (!v28)
        goto LABEL_56;
    }
    v29 = -[BMTextUnderstandingPoemAnalytics nameSource](self, "nameSource");
    if (v29 == objc_msgSend(v5, "nameSource"))
    {
      -[BMTextUnderstandingPoemAnalytics features](self, "features");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "features");
      v31 = objc_claimAutoreleasedReturnValue();
      if (v30 == (void *)v31)
      {

      }
      else
      {
        v32 = (void *)v31;
        -[BMTextUnderstandingPoemAnalytics features](self, "features");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "features");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v33, "isEqual:", v34);

        if (!v35)
          goto LABEL_56;
      }
      if (!-[BMTextUnderstandingPoemAnalytics hasAccepted](self, "hasAccepted")
        && !objc_msgSend(v5, "hasAccepted")
        || -[BMTextUnderstandingPoemAnalytics hasAccepted](self, "hasAccepted")
        && objc_msgSend(v5, "hasAccepted")
        && (v36 = -[BMTextUnderstandingPoemAnalytics accepted](self, "accepted"),
            v36 == objc_msgSend(v5, "accepted")))
      {
        if (!-[BMTextUnderstandingPoemAnalytics hasRejected](self, "hasRejected")
          && !objc_msgSend(v5, "hasRejected"))
        {
          LOBYTE(v12) = 1;
          goto LABEL_57;
        }
        if (-[BMTextUnderstandingPoemAnalytics hasRejected](self, "hasRejected")
          && objc_msgSend(v5, "hasRejected"))
        {
          v37 = -[BMTextUnderstandingPoemAnalytics rejected](self, "rejected");
          v12 = v37 ^ objc_msgSend(v5, "rejected") ^ 1;
LABEL_57:

          goto LABEL_58;
        }
      }
    }
LABEL_56:
    LOBYTE(v12) = 0;
    goto LABEL_57;
  }
  LOBYTE(v12) = 0;
LABEL_58:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)visualIdentifier
{
  return self->_visualIdentifier;
}

- (BOOL)prediction
{
  return self->_prediction;
}

- (BOOL)hasPrediction
{
  return self->_hasPrediction;
}

- (void)setHasPrediction:(BOOL)a3
{
  self->_hasPrediction = a3;
}

- (BOOL)named
{
  return self->_named;
}

- (BOOL)hasNamed
{
  return self->_hasNamed;
}

- (void)setHasNamed:(BOOL)a3
{
  self->_hasNamed = a3;
}

- (BOOL)shadowMatch
{
  return self->_shadowMatch;
}

- (BOOL)hasShadowMatch
{
  return self->_hasShadowMatch;
}

- (void)setHasShadowMatch:(BOOL)a3
{
  self->_hasShadowMatch = a3;
}

- (double)threshold
{
  return self->_threshold;
}

- (BOOL)hasThreshold
{
  return self->_hasThreshold;
}

- (void)setHasThreshold:(BOOL)a3
{
  self->_hasThreshold = a3;
}

- (double)predictionConfidence
{
  return self->_predictionConfidence;
}

- (BOOL)hasPredictionConfidence
{
  return self->_hasPredictionConfidence;
}

- (void)setHasPredictionConfidence:(BOOL)a3
{
  self->_hasPredictionConfidence = a3;
}

- (BOOL)onboarding
{
  return self->_onboarding;
}

- (BOOL)hasOnboarding
{
  return self->_hasOnboarding;
}

- (void)setHasOnboarding:(BOOL)a3
{
  self->_hasOnboarding = a3;
}

- (NSString)nameMegadomeIdentifier
{
  return self->_nameMegadomeIdentifier;
}

- (int)nameSource
{
  return self->_nameSource;
}

- (BMTextUnderstandingPoemAnalyticsFeatures)features
{
  return self->_features;
}

- (BOOL)accepted
{
  return self->_accepted;
}

- (BOOL)hasAccepted
{
  return self->_hasAccepted;
}

- (void)setHasAccepted:(BOOL)a3
{
  self->_hasAccepted = a3;
}

- (BOOL)rejected
{
  return self->_rejected;
}

- (BOOL)hasRejected
{
  return self->_hasRejected;
}

- (void)setHasRejected:(BOOL)a3
{
  self->_hasRejected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_nameMegadomeIdentifier, 0);
  objc_storeStrong((id *)&self->_visualIdentifier, 0);
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

    v4 = -[BMTextUnderstandingPoemAnalytics initByReadFrom:]([BMTextUnderstandingPoemAnalytics alloc], "initByReadFrom:", v7);
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
  void *v8;
  void *v9;
  void *v10;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[13];

  v16[12] = *MEMORY[0x1E0C80C00];
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("visualIdentifier"), 2, 0, 1, 13, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("prediction"), 0, 0, 2, 12, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("named"), 0, 0, 3, 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("shadowMatch"), 0, 0, 4, 12, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("threshold"), 1, 0, 5, 0, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("predictionConfidence"), 1, 0, 6, 0, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("onboarding"), 0, 0, 7, 12, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("nameMegadomeIdentifier"), 2, 0, 8, 13, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("nameSource"), 0, 0, 9, 4, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("features_json"), 5, 1, &__block_literal_global_252);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("accepted"), 0, 0, 11, 12, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("rejected"), 0, 0, 12, 12, 0);
  v16[0] = v15;
  v16[1] = v14;
  v16[2] = v2;
  v16[3] = v3;
  v16[4] = v4;
  v16[5] = v5;
  v16[6] = v6;
  v16[7] = v7;
  v16[8] = v8;
  v16[9] = v13;
  v16[10] = v9;
  v16[11] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 12);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1B400;
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
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[13];

  v16[12] = *MEMORY[0x1E0C80C00];
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("visualIdentifier"), 1, 13, 0);
  v16[0] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("prediction"), 2, 12, 0);
  v16[1] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("named"), 3, 12, 0);
  v16[2] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("shadowMatch"), 4, 12, 0);
  v16[3] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("threshold"), 5, 0, 0);
  v16[4] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("predictionConfidence"), 6, 0, 0);
  v16[5] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("onboarding"), 7, 12, 0);
  v16[6] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("nameMegadomeIdentifier"), 8, 13, 0);
  v16[7] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("nameSource"), 9, 4, 0);
  v16[8] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("features"), 10, 14, objc_opt_class());
  v16[9] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("accepted"), 11, 12, 0);
  v16[10] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("rejected"), 12, 12, 0);
  v16[11] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __43__BMTextUnderstandingPoemAnalytics_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "features");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
