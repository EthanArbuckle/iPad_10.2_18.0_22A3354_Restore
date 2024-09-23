@implementation VNImageAestheticsObservation

- (id)_initWithOriginatingRequestSpecifier:(id)a3 overallAestheticScore:(float)a4 wellFramedSubjectScore:(float)a5 wellChosenBackgroundScore:(float)a6 tastefullyBlurredScore:(float)a7 sharplyFocusedSubjectScore:(float)a8 wellTimedShotScore:(float)a9 pleasantLightingScore:(float)a10 pleasantReflectionsScore:(float)a11 harmoniousColorScore:(float)a12 livelyColorScore:(float)a13 pleasantSymmetryScore:(float)a14 pleasantPatternScore:(float)a15 immersivenessScore:(float)a16 pleasantPerspectiveScore:(float)a17 pleasantPostProcessingScore:(float)a18 noiseScore:(float)a19 failureScore:(float)a20 pleasantCompositionScore:(float)a21 interestingSubjectScore:(float)a22 intrusiveObjectPresenceScore:(float)a23 pleasantCameraTiltScore:(float)a24 lowKeyLightingScore:(float)a25
{
  id result;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)VNImageAestheticsObservation;
  result = -[VNObservation initWithOriginatingRequestSpecifier:](&v34, sel_initWithOriginatingRequestSpecifier_, a3);
  if (result)
  {
    *((float *)result + 24) = a4;
    *((float *)result + 25) = a5;
    *((float *)result + 26) = a6;
    *((float *)result + 27) = a7;
    *((float *)result + 28) = a8;
    *((float *)result + 29) = a9;
    *((float *)result + 30) = a10;
    *((float *)result + 31) = a11;
    *((float *)result + 32) = a12;
    *((float *)result + 33) = a13;
    *((float *)result + 34) = a14;
    *((float *)result + 35) = a15;
    *((float *)result + 36) = a16;
    *((float *)result + 37) = a17;
    *((float *)result + 38) = a18;
    *((float *)result + 39) = a19;
    *((float *)result + 40) = a20;
    *((float *)result + 41) = a21;
    *((float *)result + 42) = a22;
    *((float *)result + 43) = a23;
    *((float *)result + 44) = a24;
    *((float *)result + 45) = a25;
  }
  return result;
}

- (VNImageAestheticsObservation)initWithCoder:(id)a3
{
  id v4;
  VNImageAestheticsObservation *v5;
  void *v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  VNImageAestheticsObservation *v29;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)VNImageAestheticsObservation;
  v5 = -[VNObservation initWithCoder:](&v31, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("VNImageAestheticsObservation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "intValue") != 1)
    {

      v29 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", CFSTR("OAES"));
    v5->_aestheticScore = v7;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", CFSTR("WFS"));
    v5->_wellFramedSubjectScore = v8;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", CFSTR("WCS"));
    v5->_wellChosenBackgroundScore = v9;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", CFSTR("TBC"));
    v5->_tastefullyBlurredScore = v10;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", CFSTR("SFS"));
    v5->_sharplyFocusedSubjectScore = v11;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", CFSTR("PLHT"));
    v5->_pleasantLightingScore = v12;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", CFSTR("PREF"));
    v5->_pleasantReflectionsScore = v13;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", CFSTR("LCOL"));
    v5->_livelyColorScore = v14;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", CFSTR("PSYM"));
    v5->_pleasantSymmetryScore = v15;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", CFSTR("PPAT"));
    v5->_pleasantPatternScore = v16;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", CFSTR("IMM"));
    v5->_immersivenessScore = v17;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", CFSTR("PPERS"));
    v5->_pleasantPerspectiveScore = v18;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", CFSTR("PPOST"));
    v5->_pleasantPostProcessingScore = v19;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", CFSTR("NOISE"));
    v5->_noiseScore = v20;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", CFSTR("FAIL"));
    v5->_failureScore = v21;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", CFSTR("PCOMP"));
    v5->_pleasantCompositionScore = v22;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", CFSTR("INTREST"));
    v5->_interestingSubjectScore = v23;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", CFSTR("INTRUSIVE"));
    v5->_intrusiveObjectPresenceScore = v24;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", CFSTR("CTILT"));
    v5->_pleasantCameraTiltScore = v25;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", CFSTR("WTS"));
    v5->_wellTimedShotScore = v26;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", CFSTR("HCOL"));
    v5->_harmoniousColorScore = v27;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", CFSTR("LOWKEY"));
    v5->_lowKeyLightingScore = v28;

  }
  v29 = v5;
LABEL_6:

  return v29;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)VNImageAestheticsObservation;
  v4 = a3;
  -[VNObservation encodeWithCoder:](&v27, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", &unk_1E459C9A0, CFSTR("VNImageAestheticsObservation"), v27.receiver, v27.super_class);
  *(float *)&v5 = self->_aestheticScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", CFSTR("OAES"), v5);
  *(float *)&v6 = self->_wellFramedSubjectScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", CFSTR("WFS"), v6);
  *(float *)&v7 = self->_wellChosenBackgroundScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", CFSTR("WCS"), v7);
  *(float *)&v8 = self->_tastefullyBlurredScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", CFSTR("TBC"), v8);
  *(float *)&v9 = self->_sharplyFocusedSubjectScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", CFSTR("SFS"), v9);
  *(float *)&v10 = self->_pleasantLightingScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", CFSTR("PLHT"), v10);
  *(float *)&v11 = self->_pleasantReflectionsScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", CFSTR("PREF"), v11);
  *(float *)&v12 = self->_livelyColorScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", CFSTR("LCOL"), v12);
  *(float *)&v13 = self->_pleasantSymmetryScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", CFSTR("PSYM"), v13);
  *(float *)&v14 = self->_pleasantPatternScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", CFSTR("PPAT"), v14);
  *(float *)&v15 = self->_immersivenessScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", CFSTR("IMM"), v15);
  *(float *)&v16 = self->_pleasantPerspectiveScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", CFSTR("PPERS"), v16);
  *(float *)&v17 = self->_pleasantPostProcessingScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", CFSTR("PPOST"), v17);
  *(float *)&v18 = self->_noiseScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", CFSTR("NOISE"), v18);
  *(float *)&v19 = self->_failureScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", CFSTR("FAIL"), v19);
  *(float *)&v20 = self->_pleasantCompositionScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", CFSTR("PCOMP"), v20);
  *(float *)&v21 = self->_interestingSubjectScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", CFSTR("INTREST"), v21);
  *(float *)&v22 = self->_intrusiveObjectPresenceScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", CFSTR("INTRUSIVE"), v22);
  *(float *)&v23 = self->_pleasantCameraTiltScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", CFSTR("CTILT"), v23);
  *(float *)&v24 = self->_wellTimedShotScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", CFSTR("WTS"), v24);
  *(float *)&v25 = self->_harmoniousColorScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", CFSTR("HCOL"), v25);
  *(float *)&v26 = self->_lowKeyLightingScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", CFSTR("LOWKEY"), v26);

}

- (id)vn_cloneObject
{
  float *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VNImageAestheticsObservation;
  -[VNObservation vn_cloneObject](&v5, sel_vn_cloneObject);
  v3 = (float *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v3[24] = self->_aestheticScore;
    v3[25] = self->_wellFramedSubjectScore;
    v3[26] = self->_wellChosenBackgroundScore;
    v3[27] = self->_tastefullyBlurredScore;
    v3[28] = self->_sharplyFocusedSubjectScore;
    v3[29] = self->_wellTimedShotScore;
    v3[30] = self->_pleasantLightingScore;
    v3[31] = self->_pleasantReflectionsScore;
    v3[32] = self->_harmoniousColorScore;
    v3[33] = self->_livelyColorScore;
    v3[34] = self->_pleasantSymmetryScore;
    v3[35] = self->_pleasantPatternScore;
    v3[36] = self->_immersivenessScore;
    v3[37] = self->_pleasantPerspectiveScore;
    v3[38] = self->_pleasantPostProcessingScore;
    v3[39] = self->_noiseScore;
    v3[40] = self->_failureScore;
    v3[41] = self->_pleasantCompositionScore;
    v3[42] = self->_interestingSubjectScore;
    v3[43] = self->_intrusiveObjectPresenceScore;
    v3[44] = self->_pleasantCameraTiltScore;
    v3[45] = self->_lowKeyLightingScore;
  }
  return v3;
}

- (id)_scoresDictionary
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "allScorePropertyNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v5 = (void *)MEMORY[0x1A1B0B060]();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[VNImageAestheticsObservation valueForKey:](self, "valueForKey:", v11, (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_autoreleasePoolPop(v5);
  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v20.receiver = self;
  v20.super_class = (Class)VNImageAestheticsObservation;
  -[VNObservation description](&v20, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  v5 = (void *)MEMORY[0x1A1B0B060]();
  -[VNImageAestheticsObservation _scoresDictionary](self, "_scoresDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("\n  %@=%@"), v13, v14);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v10);
  }

  objc_autoreleasePoolPop(v5);
  return v3;
}

- (float)aestheticScore
{
  return self->_aestheticScore;
}

- (float)wellFramedSubjectScore
{
  return self->_wellFramedSubjectScore;
}

- (float)wellChosenBackgroundScore
{
  return self->_wellChosenBackgroundScore;
}

- (float)tastefullyBlurredScore
{
  return self->_tastefullyBlurredScore;
}

- (float)sharplyFocusedSubjectScore
{
  return self->_sharplyFocusedSubjectScore;
}

- (float)wellTimedShotScore
{
  return self->_wellTimedShotScore;
}

- (float)pleasantLightingScore
{
  return self->_pleasantLightingScore;
}

- (float)pleasantReflectionsScore
{
  return self->_pleasantReflectionsScore;
}

- (float)harmoniousColorScore
{
  return self->_harmoniousColorScore;
}

- (float)livelyColorScore
{
  return self->_livelyColorScore;
}

- (float)pleasantSymmetryScore
{
  return self->_pleasantSymmetryScore;
}

- (float)pleasantPatternScore
{
  return self->_pleasantPatternScore;
}

- (float)immersivenessScore
{
  return self->_immersivenessScore;
}

- (float)pleasantPerspectiveScore
{
  return self->_pleasantPerspectiveScore;
}

- (float)pleasantPostProcessingScore
{
  return self->_pleasantPostProcessingScore;
}

- (float)noiseScore
{
  return self->_noiseScore;
}

- (float)failureScore
{
  return self->_failureScore;
}

- (float)pleasantCompositionScore
{
  return self->_pleasantCompositionScore;
}

- (float)interestingSubjectScore
{
  return self->_interestingSubjectScore;
}

- (float)intrusiveObjectPresenceScore
{
  return self->_intrusiveObjectPresenceScore;
}

- (float)pleasantCameraTiltScore
{
  return self->_pleasantCameraTiltScore;
}

- (float)lowKeyLightingScore
{
  return self->_lowKeyLightingScore;
}

+ (id)allScorePropertyNames
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__VNImageAestheticsObservation_allScorePropertyNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allScorePropertyNames_onceToken != -1)
    dispatch_once(&allScorePropertyNames_onceToken, block);
  return (id)allScorePropertyNames_allScorePropertyNames;
}

+ (id)observationForOriginatingRequestSpecifier:(id)a3 overallAestheticScore:(float)a4 wellFramedSubjectScore:(float)a5 wellChosenBackgroundScore:(float)a6 tastefullyBlurredScore:(float)a7 sharplyFocusedSubjectScore:(float)a8 wellTimedShotScore:(float)a9 pleasantLightingScore:(float)a10 pleasantReflectionsScore:(float)a11 harmoniousColorScore:(float)a12 livelyColorScore:(float)a13 pleasantSymmetryScore:(float)a14 pleasantPatternScore:(float)a15 immersivenessScore:(float)a16 pleasantPerspectiveScore:(float)a17 pleasantPostProcessingScore:(float)a18 noiseScore:(float)a19 failureScore:(float)a20 pleasantCompositionScore:(float)a21 interestingSubjectScore:(float)a22 intrusiveObjectPresenceScore:(float)a23 pleasantCameraTiltScore:(float)a24 lowKeyLightingScore:(float)a25 error:(id *)a26
{
  id v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  id v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;

  v32 = a3;
  *(float *)&v33 = a4;
  if (!+[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", CFSTR("overall aesthetics"), a26, v33))goto LABEL_24;
  *(float *)&v34 = a5;
  if (!+[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", CFSTR("well-framed subject"), a26, v34))goto LABEL_24;
  *(float *)&v35 = a6;
  if (!+[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", CFSTR("well-chosen background"), a26, v35))goto LABEL_24;
  *(float *)&v36 = a7;
  if (!+[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", CFSTR("tastefully blurred"), a26, v36))goto LABEL_24;
  *(float *)&v37 = a8;
  if (!+[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", CFSTR("sharply focused"), a26, v37))goto LABEL_24;
  *(float *)&v38 = a9;
  if (!+[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", CFSTR("well-timed shot"), a26, v38))goto LABEL_24;
  *(float *)&v39 = a10;
  if (!+[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", CFSTR("pleasant lighting"), a26, v39))goto LABEL_24;
  *(float *)&v40 = a11;
  if (!+[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", CFSTR("pleasant reflections"), a26, v40))goto LABEL_24;
  *(float *)&v41 = a12;
  if (!+[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", CFSTR("harmonious color"), a26, v41))goto LABEL_24;
  *(float *)&v42 = a13;
  if (!+[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", CFSTR("lively color"), a26, v42))goto LABEL_24;
  *(float *)&v43 = a14;
  if (!+[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", CFSTR("pleasant symmetry"), a26, v43))goto LABEL_24;
  *(float *)&v44 = a15;
  if (!+[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", CFSTR("pleasant pattern"), a26, v44))goto LABEL_24;
  *(float *)&v45 = a16;
  if (!+[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", CFSTR("immersiveness"), a26, v45))goto LABEL_24;
  *(float *)&v46 = a17;
  if (!+[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", CFSTR("pleasant perspective"), a26, v46))goto LABEL_24;
  *(float *)&v47 = a18;
  if (!+[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", CFSTR("pleasant post-processing"), a26, v47))goto LABEL_24;
  *(float *)&v48 = a19;
  if (+[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", CFSTR("noise"), a26, v48)&& (*(float *)&v49 = a20, +[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", CFSTR("failure"), a26, v49))&& (*(float *)&v50 = a21, +[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", CFSTR("pleasant composition"), a26, v50))
    && (*(float *)&v51 = a22,
        +[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", CFSTR("interesting subject"), a26, v51))&& (*(float *)&v52 = a23, +[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", CFSTR("intrusive object"), a26, v52))&& (*(float *)&v53 = a24, +[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", CFSTR("pleasant camera tilt"), a26, v53))
    && (*(float *)&v54 = a25,
        +[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", CFSTR("low key lighting"), a26, v54)))
  {
    v55 = objc_alloc((Class)a1);
    *(float *)&v56 = a11;
    *(float *)&v57 = a4;
    *(float *)&v58 = a5;
    *(float *)&v59 = a6;
    *(float *)&v60 = a7;
    *(float *)&v62 = a9;
    *(float *)&v61 = a8;
    *(float *)&v63 = a10;
    v64 = (void *)objc_msgSend(v55, "_initWithOriginatingRequestSpecifier:overallAestheticScore:wellFramedSubjectScore:wellChosenBackgroundScore:tastefullyBlurredScore:sharplyFocusedSubjectScore:wellTimedShotScore:pleasantLightingScore:pleasantReflectionsScore:harmoniousColorScore:livelyColorScore:pleasantSymmetryScore:pleasantPatternScore:immersivenessScore:pleasantPerspectiveScore:pleasantPostProcessingScore:noiseScore:failureScore:pleasantCompositionScore:interestingSubjectScore:intrusiveObjectPresenceScore:pleasantCameraTiltScore:lowKeyLightingScore:", v32, v57, v58, v59, v60, v61, v62, v63, v56, __PAIR64__(LODWORD(a13), LODWORD(a12)), __PAIR64__(LODWORD(a15), LODWORD(a14)), __PAIR64__(LODWORD(a17), LODWORD(a16)),
                    __PAIR64__(LODWORD(a19), LODWORD(a18)),
                    __PAIR64__(LODWORD(a21), LODWORD(a20)),
                    __PAIR64__(LODWORD(a23), LODWORD(a22)),
                    __PAIR64__(LODWORD(a25), LODWORD(a24)));
  }
  else
  {
LABEL_24:
    v64 = 0;
  }

  return v64;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return CFSTR("VNClassifyImageAestheticsRequest");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __53__VNImageAestheticsObservation_allScorePropertyNames__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  objc_class *v7;
  objc_property_t *v8;
  objc_property_t *v9;
  unint64_t i;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unsigned int outCount;

  v2 = (void *)MEMORY[0x1A1B0B060]();
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v4 = objc_msgSend(*(id *)(a1 + 32), "superclass");
  v5 = objc_opt_class();
  if (v5)
    v6 = v5 == v4;
  else
    v6 = 1;
  if (!v6)
  {
    v7 = (objc_class *)v5;
    do
    {
      outCount = 0;
      v8 = class_copyPropertyList(v7, &outCount);
      if (v8)
      {
        v9 = v8;
        if (outCount)
        {
          for (i = 0; i < outCount; ++i)
          {
            v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", property_getName(v9[i]));
            if (objc_msgSend(v11, "hasSuffix:", CFSTR("Score")))
              objc_msgSend(v3, "addObject:", v11);

          }
        }
        free(v9);
      }
      v12 = -[objc_class superclass](v7, "superclass");
      if (!v12)
        break;
      v7 = (objc_class *)v12;
    }
    while (v12 != v4);
  }
  v13 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithArray:", v14);

  v16 = objc_msgSend(v15, "indexOfObject:", CFSTR("aestheticScore"));
  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v15, "sortUsingSelector:", sel_compare_);
  }
  else
  {
    objc_msgSend(v15, "removeObjectAtIndex:", v16);
    objc_msgSend(v15, "sortUsingSelector:", sel_compare_);
    objc_msgSend(v15, "insertObject:atIndex:", CFSTR("aestheticScore"), 0);
  }
  v17 = objc_msgSend(v15, "copy");
  v18 = (void *)allScorePropertyNames_allScorePropertyNames;
  allScorePropertyNames_allScorePropertyNames = v17;

  objc_autoreleasePoolPop(v2);
}

@end
