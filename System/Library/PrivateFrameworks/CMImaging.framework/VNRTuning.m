@implementation VNRTuning

- (VNRTuning)initWithTuningParamsDict:(id)a3
{
  id v4;
  VNRTuning *v5;
  VNRGainValueArray *v6;
  void *v7;
  uint64_t v8;
  VNRGainValueArray *deghostPatchSigmaLumaGVA;
  VNRGainValueArray *v10;
  void *v11;
  uint64_t v12;
  VNRGainValueArray *deghostPatchSigmaChromaGVA;
  VNRGainValueArray *v14;
  void *v15;
  uint64_t v16;
  VNRGainValueArray *deghostBoostFactorGVA;
  VNRGainValueArray *v18;
  void *v19;
  uint64_t v20;
  VNRGainValueArray *fusionStrengthLumaGVA;
  VNRGainValueArray *v22;
  void *v23;
  uint64_t v24;
  VNRGainValueArray *fusionStrengthChromaGVA;
  VNRGainValueArray *v26;
  void *v27;
  uint64_t v28;
  VNRGainValueArray *ghostAttenuationLumaGVA;
  VNRGainValueArray *v30;
  void *v31;
  uint64_t v32;
  VNRGainValueArray *ghostAttenuationBreakthroughSigmaLumaGVA;
  VNRGainValueArray *v34;
  void *v35;
  uint64_t v36;
  VNRGainValueArray *ghostAttenuationChromaGVA;
  VNRGainValueArray *v38;
  void *v39;
  uint64_t v40;
  VNRGainValueArray *ghostAttenuationBreakthroughSigmaChromaGVA;
  NSArray *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  VNRTuningBand *v48;
  NSArray *v49;
  NSArray *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  VNRTuningBand *v56;
  VNRTuningBand *v57;
  NSArray *chromaBands;
  id v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  objc_super v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v70.receiver = self;
  v70.super_class = (Class)VNRTuning;
  v5 = -[VNRTuning init](&v70, sel_init);
  if (!v5)
    goto LABEL_37;
  v6 = [VNRGainValueArray alloc];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DeghostPatchSigmaLuma"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[VNRGainValueArray initWithArray:](v6, "initWithArray:", v7);
  deghostPatchSigmaLumaGVA = v5->_deghostPatchSigmaLumaGVA;
  v5->_deghostPatchSigmaLumaGVA = (VNRGainValueArray *)v8;

  if (!v5->_deghostPatchSigmaLumaGVA)
    goto LABEL_37;
  v10 = [VNRGainValueArray alloc];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DeghostPatchSigmaChroma"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[VNRGainValueArray initWithArray:](v10, "initWithArray:", v11);
  deghostPatchSigmaChromaGVA = v5->_deghostPatchSigmaChromaGVA;
  v5->_deghostPatchSigmaChromaGVA = (VNRGainValueArray *)v12;

  if (!v5->_deghostPatchSigmaChromaGVA)
    goto LABEL_37;
  v14 = [VNRGainValueArray alloc];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DeghostBoostFactor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[VNRGainValueArray initWithArray:](v14, "initWithArray:", v15);
  deghostBoostFactorGVA = v5->_deghostBoostFactorGVA;
  v5->_deghostBoostFactorGVA = (VNRGainValueArray *)v16;

  if (!v5->_deghostBoostFactorGVA)
    goto LABEL_37;
  v18 = [VNRGainValueArray alloc];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FusionStrengthLuma"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[VNRGainValueArray initWithArray:](v18, "initWithArray:", v19);
  fusionStrengthLumaGVA = v5->_fusionStrengthLumaGVA;
  v5->_fusionStrengthLumaGVA = (VNRGainValueArray *)v20;

  if (!v5->_fusionStrengthLumaGVA)
    goto LABEL_37;
  v22 = [VNRGainValueArray alloc];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FusionStrengthChroma"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[VNRGainValueArray initWithArray:](v22, "initWithArray:", v23);
  fusionStrengthChromaGVA = v5->_fusionStrengthChromaGVA;
  v5->_fusionStrengthChromaGVA = (VNRGainValueArray *)v24;

  if (!v5->_fusionStrengthChromaGVA)
    goto LABEL_37;
  v26 = [VNRGainValueArray alloc];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("GhostAttenuationLuma"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[VNRGainValueArray initWithArray:](v26, "initWithArray:", v27);
  ghostAttenuationLumaGVA = v5->_ghostAttenuationLumaGVA;
  v5->_ghostAttenuationLumaGVA = (VNRGainValueArray *)v28;

  if (!v5->_ghostAttenuationLumaGVA)
    goto LABEL_37;
  v30 = [VNRGainValueArray alloc];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("GhostAttenuationBreakthroughSigmaLuma"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[VNRGainValueArray initWithArray:](v30, "initWithArray:", v31);
  ghostAttenuationBreakthroughSigmaLumaGVA = v5->_ghostAttenuationBreakthroughSigmaLumaGVA;
  v5->_ghostAttenuationBreakthroughSigmaLumaGVA = (VNRGainValueArray *)v32;

  if (!v5->_ghostAttenuationBreakthroughSigmaLumaGVA)
    goto LABEL_37;
  v34 = [VNRGainValueArray alloc];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("GhostAttenuationChroma"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[VNRGainValueArray initWithArray:](v34, "initWithArray:", v35);
  ghostAttenuationChromaGVA = v5->_ghostAttenuationChromaGVA;
  v5->_ghostAttenuationChromaGVA = (VNRGainValueArray *)v36;

  if (!v5->_ghostAttenuationChromaGVA)
    goto LABEL_37;
  v38 = [VNRGainValueArray alloc];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("GhostAttenuationBreakthroughSigmaChroma"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = -[VNRGainValueArray initWithArray:](v38, "initWithArray:", v39);
  ghostAttenuationBreakthroughSigmaChromaGVA = v5->_ghostAttenuationBreakthroughSigmaChromaGVA;
  v5->_ghostAttenuationBreakthroughSigmaChromaGVA = (VNRGainValueArray *)v40;

  if (!v5->_ghostAttenuationBreakthroughSigmaChromaGVA)
  {
LABEL_37:
    v43 = 0;
    v61 = 0;
    v42 = 0;
LABEL_38:
    v48 = 0;
    goto LABEL_36;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LumaBands"));
  v42 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (!v42
    || (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ChromaBands")),
        (v61 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v43 = 0;
    v61 = 0;
    goto LABEL_38;
  }
  v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v43)
    goto LABEL_38;
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v42 = v42;
  v44 = -[NSArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v67;
    while (2)
    {
      for (i = 0; i != v45; ++i)
      {
        if (*(_QWORD *)v67 != v46)
          objc_enumerationMutation(v42);
        v48 = -[VNRTuningBand initWithTuningParamsDict:]([VNRTuningBand alloc], "initWithTuningParamsDict:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i));
        if (!v48)
        {
          v50 = v42;
          goto LABEL_35;
        }
        objc_msgSend(v43, "addObject:", v48);

      }
      v45 = -[NSArray countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
      if (v45)
        continue;
      break;
    }
  }

  v49 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v49)
    goto LABEL_38;
  v50 = v49;
  v60 = v4;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v51 = v61;
  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v63;
    while (2)
    {
      for (j = 0; j != v53; ++j)
      {
        if (*(_QWORD *)v63 != v54)
          objc_enumerationMutation(v51);
        v56 = -[VNRTuningBand initWithTuningParamsDict:]([VNRTuningBand alloc], "initWithTuningParamsDict:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * j));
        if (!v56)
        {

          v48 = 0;
          goto LABEL_34;
        }
        v57 = v56;
        -[NSArray addObject:](v50, "addObject:", v56);

      }
      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
      if (v53)
        continue;
      break;
    }
  }

  objc_storeStrong((id *)&v5->_lumaBands, v43);
  chromaBands = v5->_chromaBands;
  v5->_chromaBands = v50;
  v50 = v50;

  v48 = v5;
LABEL_34:
  v4 = v60;
LABEL_35:

LABEL_36:
  return (VNRTuning *)v48;
}

- (int)updateWithGain:(float)a3
{
  float v5;
  double v6;
  float v7;
  double v8;
  float v9;
  double v10;
  float v11;
  double v12;
  float v13;
  double v14;
  float v15;
  double v16;
  float v17;
  double v18;
  float v19;
  double v20;
  float v21;
  NSArray *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  -[VNRGainValueArray interpolateValueForGain:](self->_deghostPatchSigmaLumaGVA, "interpolateValueForGain:");
  self->_deghostPatchSigmaLuma = v5;
  *(float *)&v6 = a3;
  -[VNRGainValueArray interpolateValueForGain:](self->_deghostPatchSigmaChromaGVA, "interpolateValueForGain:", v6);
  self->_deghostPatchSigmaChroma = v7;
  *(float *)&v8 = a3;
  -[VNRGainValueArray interpolateValueForGain:](self->_deghostBoostFactorGVA, "interpolateValueForGain:", v8);
  self->_deghostBoostFactor = v9;
  *(float *)&v10 = a3;
  -[VNRGainValueArray interpolateValueForGain:](self->_fusionStrengthLumaGVA, "interpolateValueForGain:", v10);
  self->_fusionStrengthLuma = v11;
  *(float *)&v12 = a3;
  -[VNRGainValueArray interpolateValueForGain:](self->_fusionStrengthChromaGVA, "interpolateValueForGain:", v12);
  self->_fusionStrengthChroma = v13;
  *(float *)&v14 = a3;
  -[VNRGainValueArray interpolateValueForGain:](self->_ghostAttenuationLumaGVA, "interpolateValueForGain:", v14);
  self->_ghostAttenuationLuma = v15;
  *(float *)&v16 = a3;
  -[VNRGainValueArray interpolateValueForGain:](self->_ghostAttenuationBreakthroughSigmaLumaGVA, "interpolateValueForGain:", v16);
  self->_ghostAttenuationBreakthroughSigmaLuma = v17;
  *(float *)&v18 = a3;
  -[VNRGainValueArray interpolateValueForGain:](self->_ghostAttenuationChromaGVA, "interpolateValueForGain:", v18);
  self->_ghostAttenuationChroma = v19;
  *(float *)&v20 = a3;
  -[VNRGainValueArray interpolateValueForGain:](self->_ghostAttenuationBreakthroughSigmaChromaGVA, "interpolateValueForGain:", v20);
  self->_ghostAttenuationBreakthroughSigmaChroma = v21;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v22 = self->_lumaBands;
  v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v23)
  {
    v25 = v23;
    v26 = *(_QWORD *)v41;
LABEL_3:
    v27 = 0;
    while (1)
    {
      if (*(_QWORD *)v41 != v26)
        objc_enumerationMutation(v22);
      *(float *)&v24 = a3;
      v28 = objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v27), "updateWithGain:", v24);
      if (v28)
        goto LABEL_18;
      if (v25 == ++v27)
      {
        v25 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        if (v25)
          goto LABEL_3;
        break;
      }
    }
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v22 = self->_chromaBands;
  v29 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v29)
  {
    v31 = v29;
    v32 = *(_QWORD *)v37;
LABEL_11:
    v33 = 0;
    while (1)
    {
      if (*(_QWORD *)v37 != v32)
        objc_enumerationMutation(v22);
      *(float *)&v30 = a3;
      v28 = objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v33), "updateWithGain:", v30, (_QWORD)v36);
      if (v28)
        break;
      if (v31 == ++v33)
      {
        v31 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        if (v31)
          goto LABEL_11;
        goto LABEL_17;
      }
    }
LABEL_18:
    v34 = v28;
    goto LABEL_19;
  }
LABEL_17:
  v34 = 0;
LABEL_19:

  return v34;
}

- (id)lumaBands
{
  if (result)
    return objc_getProperty(result, a2, 120, 1);
  return result;
}

- (id)chromaBands
{
  if (result)
    return objc_getProperty(result, a2, 128, 1);
  return result;
}

- (float)deghostPatchSigmaLuma
{
  if (a1)
    return *(float *)(a1 + 80);
  else
    return 0.0;
}

- (float)deghostPatchSigmaChroma
{
  if (a1)
    return *(float *)(a1 + 84);
  else
    return 0.0;
}

- (float)deghostBoostFactor
{
  if (a1)
    return *(float *)(a1 + 88);
  else
    return 0.0;
}

- (float)fusionStrengthLuma
{
  if (a1)
    return *(float *)(a1 + 92);
  else
    return 0.0;
}

- (float)fusionStrengthChroma
{
  if (a1)
    return *(float *)(a1 + 96);
  else
    return 0.0;
}

- (float)ghostAttenuationLuma
{
  if (a1)
    return *(float *)(a1 + 100);
  else
    return 0.0;
}

- (float)ghostAttenuationBreakthroughSigmaLuma
{
  if (a1)
    return *(float *)(a1 + 104);
  else
    return 0.0;
}

- (float)ghostAttenuationChroma
{
  if (a1)
    return *(float *)(a1 + 108);
  else
    return 0.0;
}

- (float)ghostAttenuationBreakthroughSigmaChroma
{
  if (a1)
    return *(float *)(a1 + 112);
  else
    return 0.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chromaBands, 0);
  objc_storeStrong((id *)&self->_lumaBands, 0);
  objc_storeStrong((id *)&self->_ghostAttenuationBreakthroughSigmaChromaGVA, 0);
  objc_storeStrong((id *)&self->_ghostAttenuationChromaGVA, 0);
  objc_storeStrong((id *)&self->_ghostAttenuationBreakthroughSigmaLumaGVA, 0);
  objc_storeStrong((id *)&self->_ghostAttenuationLumaGVA, 0);
  objc_storeStrong((id *)&self->_fusionStrengthChromaGVA, 0);
  objc_storeStrong((id *)&self->_fusionStrengthLumaGVA, 0);
  objc_storeStrong((id *)&self->_deghostBoostFactorGVA, 0);
  objc_storeStrong((id *)&self->_deghostPatchSigmaChromaGVA, 0);
  objc_storeStrong((id *)&self->_deghostPatchSigmaLumaGVA, 0);
}

@end
