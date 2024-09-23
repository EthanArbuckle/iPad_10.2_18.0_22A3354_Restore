@implementation GEOClientRankingModelFeature

- (GEOClientRankingModelFeature)init
{
  GEOClientRankingModelFeature *result;

  result = (GEOClientRankingModelFeature *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOClientRankingModelFeature)initWithFeatureIdentifier:(id)a3 function:(id)a4
{
  id v7;
  id v8;
  GEOClientRankingModelFeature *v9;
  GEOClientRankingModelFeature *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOClientRankingModelFeature;
  v9 = -[GEOClientRankingModelFeature init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_featureIdentifier, a3);
    objc_storeStrong((id *)&v10->_function, a4);
  }

  return v10;
}

- (GEOClientRankingModelFeature)initWithGEOPDClientRankingFeatureMetadata:(id)a3
{
  id *v4;
  id *v5;
  GEOClientRankingModelFeatureCompositeIdentifier *v6;
  GEOClientRankingModelFeature *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  GEOClientRankingModelFeatureTypeIdentifier *v11;
  int v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id *v20;
  void *v21;
  int v22;
  id *v23;
  _DWORD *v24;
  GEOClientRankingModelFeatureFunctionLinear *v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  GEOClientRankingModelFeatureSourceIdentifier *v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  GEOClientRankingModelFeatureCompositeIdentifier *v36;
  double v37;
  int v38;
  uint64_t v39;
  _DWORD *v40;
  GEOClientRankingModelFeatureFunctionLinear *v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  GEOClientRankingModelFeatureFunctionDiscrete *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  id *v52;
  GEOClientRankingModelFeatureFunctionDiscrete *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  _OWORD v60[4];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v5 = v4;
  if (!v4 || (~*((unsigned __int16 *)v4 + 42) & 3) != 0)
  {
LABEL_55:
    v6 = 0;
    goto LABEL_56;
  }
  v6 = 0;
  v7 = 0;
  switch(-[GEOPDClientRankingFeatureMetadata featureType]((uint64_t)v4))
  {
    case 0u:
      goto LABEL_57;
    case 1u:
      -[GEOPDClientRankingFeatureMetadata featureTypeSource](v5);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (!v8)
        goto LABEL_54;
      if ((*(_BYTE *)(v8 + 24) & 2) != 0)
      {
        if (!*(_DWORD *)(v8 + 20))
          goto LABEL_54;
      }
      else if ((*(_BYTE *)(v8 + 24) & 1) == 0)
      {
        goto LABEL_54;
      }
      v30 = *(_BYTE *)(v8 + 24) & 1;
      v31 = [GEOClientRankingModelFeatureSourceIdentifier alloc];
      if ((*(_BYTE *)(v9 + 24) & 2) != 0)
        v32 = *(unsigned int *)(v9 + 20);
      else
        v32 = 0;
      if ((*(_BYTE *)(v9 + 24) & 1) != 0 && (v33 = *(_DWORD *)(v9 + 16) - 1, v33 < 6))
        v34 = dword_189CE3628[v33];
      else
        v34 = 0;
      v35 = -[GEOClientRankingModelFeatureSourceIdentifier initWithSuggestionType:serverEntryType:sourceType:](v31, "initWithSuggestionType:serverEntryType:sourceType:", v32, v34, v30);
      goto LABEL_34;
    case 2u:
      -[GEOPDClientRankingFeatureMetadata featureTypeResult](v5);
      v10 = objc_claimAutoreleasedReturnValue();
      v9 = v10;
      if (!v10 || (*(_BYTE *)(v10 + 20) & 1) == 0 || !*(_DWORD *)(v10 + 16))
        goto LABEL_54;
      v11 = [GEOClientRankingModelFeatureTypeIdentifier alloc];
      if ((*(_BYTE *)(v9 + 20) & 1) != 0)
        v12 = *(_DWORD *)(v9 + 16);
      else
        v12 = 0;
      v35 = -[GEOClientRankingModelFeatureTypeIdentifier initWithFeatureType:](v11, "initWithFeatureType:", featureTypeForGEOFeatureType(v12));
LABEL_34:
      v6 = (GEOClientRankingModelFeatureCompositeIdentifier *)v35;
      goto LABEL_35;
    case 3u:
      -[GEOPDClientRankingFeatureMetadata featureTypeComposite](v5);
      v13 = objc_claimAutoreleasedReturnValue();
      v9 = v13;
      if (!v13)
        goto LABEL_54;
      v14 = *(id *)(v13 + 16);
      v15 = objc_msgSend(v14, "count");

      if (!v15)
        goto LABEL_54;
      v16 = objc_alloc(MEMORY[0x1E0C99DE8]);
      -[GEOPDClientRankingFeatureTypeComposite variableExponentPairs]((id *)v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v16, "initWithCapacity:", objc_msgSend(v17, "count"));

      memset(v60, 0, sizeof(v60));
      -[GEOPDClientRankingFeatureTypeComposite variableExponentPairs]((id *)v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", v60, v61, 16))
      {
        v20 = (id *)**((_QWORD **)&v60[0] + 1);
        -[GEOPDVariableExponentPair variable](**((id ***)&v60[0] + 1));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[GEOPDClientRankingFeatureUnit functionType]((uint64_t)v21);

        if (v22 == 2)
        {
          -[GEOPDVariableExponentPair variable](v20);
          v52 = (id *)objc_claimAutoreleasedReturnValue();
          -[GEOPDClientRankingFeatureUnit functionTypeDiscrete](v52);
          v24 = (_DWORD *)objc_claimAutoreleasedReturnValue();

          v53 = [GEOClientRankingModelFeatureFunctionDiscrete alloc];
          if (v24)
          {
            LODWORD(v54) = v24[5];
            LODWORD(v55) = v24[7];
            LODWORD(v56) = v24[4];
            LODWORD(v57) = v24[6];
          }
          else
          {
            LODWORD(v56) = 0;
            LODWORD(v54) = 0;
            LODWORD(v55) = 0;
            LODWORD(v57) = 0;
          }
          v29 = -[GEOClientRankingModelFeatureFunctionDiscrete initWithValueThresholdLow:weightLow:valueThresholdHigh:weightHigh:](v53, "initWithValueThresholdLow:weightLow:valueThresholdHigh:weightHigh:", v54, v55, v56, v57, *(_QWORD *)&v60[0]);
        }
        else
        {
          if (v22 != 1)
          {
LABEL_52:

LABEL_53:
LABEL_54:

            goto LABEL_55;
          }
          -[GEOPDVariableExponentPair variable](v20);
          v23 = (id *)objc_claimAutoreleasedReturnValue();
          -[GEOPDClientRankingFeatureUnit functionTypeLinear](v23);
          v24 = (_DWORD *)objc_claimAutoreleasedReturnValue();

          v25 = [GEOClientRankingModelFeatureFunctionLinear alloc];
          if (v24)
          {
            LODWORD(v26) = v24[6];
            LODWORD(v27) = v24[4];
            LODWORD(v28) = v24[5];
          }
          else
          {
            LODWORD(v27) = 0;
            LODWORD(v26) = 0;
            LODWORD(v28) = 0;
          }
          v29 = -[GEOClientRankingModelFeatureFunctionLinear initWithWeight:maxRelativeValue:meanValue:](v25, "initWithWeight:maxRelativeValue:meanValue:", v26, v27, v28, *(_QWORD *)&v60[0]);
        }
        v58 = (void *)v29;

        goto LABEL_52;
      }

      if (!objc_msgSend(v18, "count", *(_QWORD *)&v60[0]))
        goto LABEL_53;
      v36 = [GEOClientRankingModelFeatureCompositeIdentifier alloc];
      LODWORD(v37) = *(_DWORD *)(v9 + 24);
      v6 = -[GEOClientRankingModelFeatureCompositeIdentifier initWithUnitExponentPairs:featureWeight:](v36, "initWithUnitExponentPairs:featureWeight:", v18, v37);

LABEL_35:
LABEL_36:
      v38 = -[GEOPDClientRankingFeatureMetadata functionType]((uint64_t)v5);
      v7 = 0;
      if (v38)
      {
        if (v38 == 2)
        {
          -[GEOPDClientRankingFeatureMetadata functionTypeDiscrete](v5);
          v46 = objc_claimAutoreleasedReturnValue();
          v40 = (_DWORD *)v46;
          if (v46 && (~*(unsigned __int8 *)(v46 + 32) & 0xF) == 0)
          {
            v47 = [GEOClientRankingModelFeatureFunctionDiscrete alloc];
            LODWORD(v48) = v40[5];
            LODWORD(v49) = v40[7];
            LODWORD(v50) = v40[4];
            LODWORD(v51) = v40[6];
            v45 = -[GEOClientRankingModelFeatureFunctionDiscrete initWithValueThresholdLow:weightLow:valueThresholdHigh:weightHigh:](v47, "initWithValueThresholdLow:weightLow:valueThresholdHigh:weightHigh:", v48, v49, v50, v51);
            goto LABEL_45;
          }
        }
        else
        {
          if (v38 != 1)
          {
LABEL_46:
            self = -[GEOClientRankingModelFeature initWithFeatureIdentifier:function:](self, "initWithFeatureIdentifier:function:", v6, v7);

            v7 = self;
            goto LABEL_57;
          }
          -[GEOPDClientRankingFeatureMetadata functionTypeLinear](v5);
          v39 = objc_claimAutoreleasedReturnValue();
          v40 = (_DWORD *)v39;
          if (v39 && (~*(unsigned __int8 *)(v39 + 28) & 7) == 0)
          {
            v41 = [GEOClientRankingModelFeatureFunctionLinear alloc];
            LODWORD(v42) = v40[6];
            LODWORD(v43) = v40[4];
            LODWORD(v44) = v40[5];
            v45 = -[GEOClientRankingModelFeatureFunctionLinear initWithWeight:maxRelativeValue:meanValue:](v41, "initWithWeight:maxRelativeValue:meanValue:", v42, v43, v44);
LABEL_45:
            v7 = (GEOClientRankingModelFeature *)v45;

            goto LABEL_46;
          }
        }

LABEL_56:
        v7 = 0;
      }
LABEL_57:

      return v7;
    default:
      goto LABEL_36;
  }
}

- (GEOClientRankingModelFeatureIdentifier)featureIdentifier
{
  return self->_featureIdentifier;
}

- (GEOClientRankingModelFeatureFunction)function
{
  return self->_function;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_function, 0);
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
}

@end
