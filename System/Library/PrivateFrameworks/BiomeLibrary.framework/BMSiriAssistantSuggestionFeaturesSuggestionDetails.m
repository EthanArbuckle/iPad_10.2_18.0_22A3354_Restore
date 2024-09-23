@implementation BMSiriAssistantSuggestionFeaturesSuggestionDetails

- (BMSiriAssistantSuggestionFeaturesSuggestionDetails)initWithSuggestionId:(id)a3 targetOwner:(id)a4 sourceOwner:(id)a5 classificationCentroid:(id)a6 channel:(id)a7 confidence:(id)a8 deliveryVehicle:(id)a9
{
  id v16;
  id v17;
  BMSiriAssistantSuggestionFeaturesSuggestionDetails *v18;
  double v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)BMSiriAssistantSuggestionFeaturesSuggestionDetails;
  v18 = -[BMEventBase init](&v26, sel_init);
  if (v18)
  {
    v18->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v18->_suggestionId, a3);
    objc_storeStrong((id *)&v18->_targetOwner, a4);
    objc_storeStrong((id *)&v18->_sourceOwner, a5);
    objc_storeStrong((id *)&v18->_classificationCentroid, a6);
    objc_storeStrong((id *)&v18->_channel, a7);
    if (v16)
    {
      v18->_hasConfidence = 1;
      objc_msgSend(v16, "doubleValue");
    }
    else
    {
      v18->_hasConfidence = 0;
      v19 = -1.0;
    }
    v18->_confidence = v19;
    objc_storeStrong((id *)&v18->_deliveryVehicle, a9);
  }

  return v18;
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
  -[BMSiriAssistantSuggestionFeaturesSuggestionDetails suggestionId](self, "suggestionId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriAssistantSuggestionFeaturesSuggestionDetails targetOwner](self, "targetOwner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriAssistantSuggestionFeaturesSuggestionDetails sourceOwner](self, "sourceOwner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriAssistantSuggestionFeaturesSuggestionDetails classificationCentroid](self, "classificationCentroid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriAssistantSuggestionFeaturesSuggestionDetails channel](self, "channel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[BMSiriAssistantSuggestionFeaturesSuggestionDetails confidence](self, "confidence");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriAssistantSuggestionFeaturesSuggestionDetails deliveryVehicle](self, "deliveryVehicle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("BMSiriAssistantSuggestionFeaturesSuggestionDetails with suggestionId: %@, targetOwner: %@, sourceOwner: %@, classificationCentroid: %@, channel: %@, confidence: %@, deliveryVehicle: %@"), v4, v5, v6, v7, v8, v10, v11);

  return (NSString *)v12;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMSiriAssistantSuggestionFeaturesSuggestionDetails *v5;
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
  uint64_t v22;
  unint64_t v23;
  double v24;
  void *v25;
  BMSiriAssistantSuggestionFeaturesSuggestionDetails *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)BMSiriAssistantSuggestionFeaturesSuggestionDetails;
  v5 = -[BMEventBase init](&v28, sel_init);
  if (!v5)
    goto LABEL_38;
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
          goto LABEL_31;
        case 2u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 32;
          goto LABEL_31;
        case 3u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 40;
          goto LABEL_31;
        case 4u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 48;
          goto LABEL_31;
        case 5u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 56;
          goto LABEL_31;
        case 6u:
          v5->_hasConfidence = 1;
          v22 = *v6;
          v23 = *(_QWORD *)&v4[v22];
          if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(_QWORD *)&v4[*v7])
          {
            v24 = *(double *)(*(_QWORD *)&v4[*v9] + v23);
            *(_QWORD *)&v4[v22] = v23 + 8;
          }
          else
          {
            v4[*v8] = 1;
            v24 = 0.0;
          }
          v5->_confidence = v24;
          break;
        case 7u:
          PBReaderReadString();
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = 72;
LABEL_31:
          v25 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_37;
          break;
      }
    }
    while (*(_QWORD *)&v4[*v6] < *(_QWORD *)&v4[*v7]);
  }
  if (v4[*v8])
LABEL_37:
    v26 = 0;
  else
LABEL_38:
    v26 = v5;

  return v26;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_suggestionId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_targetOwner)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_sourceOwner)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_classificationCentroid)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_channel)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_hasConfidence)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_deliveryVehicle)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMSiriAssistantSuggestionFeaturesSuggestionDetails writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMSiriAssistantSuggestionFeaturesSuggestionDetails)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  BMSiriAssistantSuggestionFeaturesSuggestionDetails *v16;
  id v17;
  void *v18;
  id v19;
  BMSiriAssistantSuggestionFeaturesSuggestionDetails *v20;
  void *v21;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  id *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  id *v55;
  id v56;
  id v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  _QWORD v71[3];

  v71[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suggestionId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_4:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("targetOwner"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = a4;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v10 = 0;
          v20 = 0;
          goto LABEL_29;
        }
        v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v29 = *MEMORY[0x1E0D025B8];
        v68 = *MEMORY[0x1E0CB2D50];
        v57 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("targetOwner"));
        v69 = v57;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
        v30 = a4;
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v29, 2, v11);
        v20 = 0;
        v10 = 0;
        *v30 = v31;
        goto LABEL_28;
      }
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sourceOwner"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v9;
    v56 = v10;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v55)
        {
          v57 = 0;
          v20 = 0;
          goto LABEL_28;
        }
        v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v33 = *MEMORY[0x1E0D025B8];
        v66 = *MEMORY[0x1E0CB2D50];
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("sourceOwner"));
        v67 = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v32;
        v10 = v56;
        v35 = (id)objc_msgSend(v34, "initWithDomain:code:userInfo:", v33, 2, v12);
        v20 = 0;
        v57 = 0;
        *v55 = v35;
LABEL_27:

        v9 = v54;
LABEL_28:

        goto LABEL_29;
      }
      v57 = v11;
    }
    else
    {
      v57 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("classificationCentroid"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v7;
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v55)
        {
          v21 = 0;
          v20 = 0;
          goto LABEL_27;
        }
        v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v37 = *MEMORY[0x1E0D025B8];
        v64 = *MEMORY[0x1E0CB2D50];
        v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("classificationCentroid"));
        v65 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v36;
        v10 = v56;
        v39 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v37, 2, v13);
        v20 = 0;
        v21 = 0;
        *v55 = v39;
        goto LABEL_26;
      }
      v53 = v12;
    }
    else
    {
      v53 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("channel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v8;
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v55)
        {
          v14 = 0;
          v20 = 0;
          goto LABEL_25;
        }
        v16 = self;
        v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v41 = *MEMORY[0x1E0D025B8];
        v62 = *MEMORY[0x1E0CB2D50];
        v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("channel"));
        v63 = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = (id)objc_msgSend(v40, "initWithDomain:code:userInfo:", v41, 2, v15);
        v20 = 0;
        v14 = 0;
        *v55 = v42;
LABEL_24:

        self = v16;
        v8 = v52;
        v10 = v56;
LABEL_25:
        v21 = v53;
LABEL_26:

        v7 = v51;
        goto LABEL_27;
      }
      v14 = v13;
    }
    else
    {
      v14 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("confidence"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v14;
    if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      v16 = self;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v55)
        {
          v17 = 0;
          v20 = 0;
          goto LABEL_24;
        }
        v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v44 = *MEMORY[0x1E0D025B8];
        v60 = *MEMORY[0x1E0CB2D50];
        v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("confidence"));
        v61 = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (id)objc_msgSend(v43, "initWithDomain:code:userInfo:", v44, 2, v18);
        v20 = 0;
        v17 = 0;
        *v55 = v45;
        goto LABEL_23;
      }
      v17 = v15;
    }
    else
    {
      v16 = self;
      v17 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("deliveryVehicle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v55)
        {
          v49 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v48 = *MEMORY[0x1E0D025B8];
          v58 = *MEMORY[0x1E0CB2D50];
          v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("deliveryVehicle"));
          v59 = v46;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *v55 = (id)objc_msgSend(v49, "initWithDomain:code:userInfo:", v48, 2, v47);

        }
        v19 = 0;
        v20 = 0;
        goto LABEL_23;
      }
      v19 = v18;
    }
    else
    {
      v19 = 0;
    }
    v20 = -[BMSiriAssistantSuggestionFeaturesSuggestionDetails initWithSuggestionId:targetOwner:sourceOwner:classificationCentroid:channel:confidence:deliveryVehicle:](v16, "initWithSuggestionId:targetOwner:sourceOwner:classificationCentroid:channel:confidence:deliveryVehicle:", v52, v56, v57, v53, v50, v17, v19);
    v16 = v20;
LABEL_23:

    v14 = v50;
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v20 = 0;
    v8 = 0;
    goto LABEL_30;
  }
  v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v24 = *MEMORY[0x1E0D025B8];
  v70 = *MEMORY[0x1E0CB2D50];
  v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("suggestionId"));
  v71[0] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, &v70, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v23;
  v10 = (id)v25;
  v27 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", v24, 2, v9);
  v20 = 0;
  v8 = 0;
  *a4 = v27;
LABEL_29:

LABEL_30:
  return v20;
}

- (id)jsonDictionary
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[7];
  _QWORD v26[9];

  v26[7] = *MEMORY[0x1E0C80C00];
  -[BMSiriAssistantSuggestionFeaturesSuggestionDetails suggestionId](self, "suggestionId");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMSiriAssistantSuggestionFeaturesSuggestionDetails targetOwner](self, "targetOwner");
  v4 = objc_claimAutoreleasedReturnValue();
  -[BMSiriAssistantSuggestionFeaturesSuggestionDetails sourceOwner](self, "sourceOwner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriAssistantSuggestionFeaturesSuggestionDetails classificationCentroid](self, "classificationCentroid");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSiriAssistantSuggestionFeaturesSuggestionDetails channel](self, "channel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[BMSiriAssistantSuggestionFeaturesSuggestionDetails hasConfidence](self, "hasConfidence")
    || (-[BMSiriAssistantSuggestionFeaturesSuggestionDetails confidence](self, "confidence"), fabs(v7) == INFINITY))
  {
    v9 = 0;
  }
  else
  {
    -[BMSiriAssistantSuggestionFeaturesSuggestionDetails confidence](self, "confidence");
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[BMSiriAssistantSuggestionFeaturesSuggestionDetails confidence](self, "confidence");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[BMSiriAssistantSuggestionFeaturesSuggestionDetails deliveryVehicle](self, "deliveryVehicle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = CFSTR("suggestionId");
  v11 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v11;
  v26[0] = v11;
  v25[1] = CFSTR("targetOwner");
  v12 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v12;
  v26[1] = v12;
  v25[2] = CFSTR("sourceOwner");
  v13 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v3;
  v26[2] = v13;
  v25[3] = CFSTR("classificationCentroid");
  v14 = v24;
  if (!v24)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v4;
  v26[3] = v14;
  v25[4] = CFSTR("channel");
  v15 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[4] = v15;
  v25[5] = CFSTR("confidence");
  v16 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[5] = v16;
  v25[6] = CFSTR("deliveryVehicle");
  v17 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[6] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v9)
      goto LABEL_21;
  }
  else
  {

    if (v9)
      goto LABEL_21;
  }

LABEL_21:
  if (!v6)

  if (!v24)
  if (v5)
  {
    if (v22)
      goto LABEL_27;
LABEL_32:

    if (v23)
      goto LABEL_28;
LABEL_33:

    goto LABEL_28;
  }

  if (!v22)
    goto LABEL_32;
LABEL_27:
  if (!v23)
    goto LABEL_33;
LABEL_28:

  return v18;
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
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMSiriAssistantSuggestionFeaturesSuggestionDetails suggestionId](self, "suggestionId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "suggestionId");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMSiriAssistantSuggestionFeaturesSuggestionDetails suggestionId](self, "suggestionId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "suggestionId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_30;
    }
    -[BMSiriAssistantSuggestionFeaturesSuggestionDetails targetOwner](self, "targetOwner");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "targetOwner");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMSiriAssistantSuggestionFeaturesSuggestionDetails targetOwner](self, "targetOwner");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "targetOwner");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_30;
    }
    -[BMSiriAssistantSuggestionFeaturesSuggestionDetails sourceOwner](self, "sourceOwner");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sourceOwner");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[BMSiriAssistantSuggestionFeaturesSuggestionDetails sourceOwner](self, "sourceOwner");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sourceOwner");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
        goto LABEL_30;
    }
    -[BMSiriAssistantSuggestionFeaturesSuggestionDetails classificationCentroid](self, "classificationCentroid");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "classificationCentroid");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[BMSiriAssistantSuggestionFeaturesSuggestionDetails classificationCentroid](self, "classificationCentroid");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "classificationCentroid");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_30;
    }
    -[BMSiriAssistantSuggestionFeaturesSuggestionDetails channel](self, "channel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "channel");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[BMSiriAssistantSuggestionFeaturesSuggestionDetails channel](self, "channel");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "channel");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if (!v36)
        goto LABEL_30;
    }
    if (!-[BMSiriAssistantSuggestionFeaturesSuggestionDetails hasConfidence](self, "hasConfidence")
      && !objc_msgSend(v5, "hasConfidence")
      || -[BMSiriAssistantSuggestionFeaturesSuggestionDetails hasConfidence](self, "hasConfidence")
      && objc_msgSend(v5, "hasConfidence")
      && (-[BMSiriAssistantSuggestionFeaturesSuggestionDetails confidence](self, "confidence"),
          v38 = v37,
          objc_msgSend(v5, "confidence"),
          v38 == v39))
    {
      -[BMSiriAssistantSuggestionFeaturesSuggestionDetails deliveryVehicle](self, "deliveryVehicle");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deliveryVehicle");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (v40 == v41)
      {
        v12 = 1;
      }
      else
      {
        -[BMSiriAssistantSuggestionFeaturesSuggestionDetails deliveryVehicle](self, "deliveryVehicle");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "deliveryVehicle");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v42, "isEqual:", v43);

      }
      goto LABEL_31;
    }
LABEL_30:
    v12 = 0;
LABEL_31:

    goto LABEL_32;
  }
  v12 = 0;
LABEL_32:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)suggestionId
{
  return self->_suggestionId;
}

- (NSString)targetOwner
{
  return self->_targetOwner;
}

- (NSString)sourceOwner
{
  return self->_sourceOwner;
}

- (NSString)classificationCentroid
{
  return self->_classificationCentroid;
}

- (NSString)channel
{
  return self->_channel;
}

- (double)confidence
{
  return self->_confidence;
}

- (BOOL)hasConfidence
{
  return self->_hasConfidence;
}

- (void)setHasConfidence:(BOOL)a3
{
  self->_hasConfidence = a3;
}

- (NSString)deliveryVehicle
{
  return self->_deliveryVehicle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveryVehicle, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_classificationCentroid, 0);
  objc_storeStrong((id *)&self->_sourceOwner, 0);
  objc_storeStrong((id *)&self->_targetOwner, 0);
  objc_storeStrong((id *)&self->_suggestionId, 0);
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

    v4 = -[BMSiriAssistantSuggestionFeaturesSuggestionDetails initByReadFrom:]([BMSiriAssistantSuggestionFeaturesSuggestionDetails alloc], "initByReadFrom:", v7);
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
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("suggestionId"), 2, 0, 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("targetOwner"), 2, 0, 2, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("sourceOwner"), 2, 0, 3, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("classificationCentroid"), 2, 0, 4, 13, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("channel"), 2, 0, 5, 13, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("confidence"), 1, 0, 6, 0, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("deliveryVehicle"), 2, 0, 7, 13, 0);
  v11[0] = v2;
  v11[1] = v3;
  v11[2] = v4;
  v11[3] = v5;
  v11[4] = v6;
  v11[5] = v7;
  v11[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1B220;
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
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("suggestionId"), 1, 13, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("targetOwner"), 2, 13, 0, v2);
  v11[1] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("sourceOwner"), 3, 13, 0);
  v11[2] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("classificationCentroid"), 4, 13, 0);
  v11[3] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("channel"), 5, 13, 0);
  v11[4] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("confidence"), 6, 0, 0);
  v11[5] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("deliveryVehicle"), 7, 13, 0);
  v11[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BMSiriAssistantSuggestionFeaturesSuggestionDetails)initWithSuggestionId:(id)a3 targetOwner:(id)a4 sourceOwner:(id)a5 classificationCentroid:(id)a6 channel:(id)a7 confidence:(id)a8
{
  return -[BMSiriAssistantSuggestionFeaturesSuggestionDetails initWithSuggestionId:targetOwner:sourceOwner:classificationCentroid:channel:confidence:deliveryVehicle:](self, "initWithSuggestionId:targetOwner:sourceOwner:classificationCentroid:channel:confidence:deliveryVehicle:", a3, a4, a5, a6, a7, a8, 0);
}

@end
