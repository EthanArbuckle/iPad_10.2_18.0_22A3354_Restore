@implementation PHAssetAestheticProperties

- (PHAssetAestheticProperties)initWithDefaultValues
{
  self->_wellFramedSubjectScore = 0.0;
  self->_wellChosenSubjectScore = 0.0;
  self->_tastefullyBlurredScore = 0.0;
  self->_sharplyFocusedSubjectScore = 0.0;
  self->_wellTimedShotScore = 0.0;
  self->_pleasantLightingScore = 0.0;
  self->_pleasantReflectionsScore = 0.0;
  self->_harmoniousColorScore = 0.0;
  self->_livelyColorScore = 0.0;
  self->_pleasantSymmetryScore = 0.0;
  self->_pleasantPatternScore = 0.0;
  self->_immersivenessScore = 0.0;
  self->_pleasantPerspectiveScore = 0.0;
  self->_pleasantPostProcessingScore = 0.0;
  self->_noiseScore = 0.0;
  self->_failureScore = 0.0;
  self->_pleasantCompositionScore = 0.0;
  self->_interestingSubjectScore = 0.0;
  self->_intrusiveObjectPresenceScore = 0.0;
  self->_pleasantCameraTiltScore = 0.0;
  self->_lowLight = 0.0;
  return self;
}

- (PHAssetAestheticProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  PHAssetAestheticProperties *v10;
  PHAssetAestheticProperties *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  float v15;
  BOOL v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  void *v37;
  float v38;
  void *v39;
  float v40;
  void *v41;
  float v42;
  void *v43;
  float v44;
  void *v45;
  float v46;
  void *v47;
  float v48;
  void *v49;
  float v50;
  void *v51;
  float v52;
  void *v53;
  float v54;
  void *v55;
  float v56;
  void *v57;
  float v58;
  void *v59;
  float v60;
  void *v61;
  float v62;
  void *v63;
  float v64;
  void *v65;
  float v66;
  void *v67;
  float v68;
  void *v69;
  float v70;
  void *v71;
  float v72;
  void *v73;
  float v74;
  void *v75;
  float v76;
  const __CFString *v78;
  const __CFString *v79;
  const __CFString *v80;
  const __CFString *v81;
  const __CFString *v82;
  const __CFString *v83;
  const __CFString *v84;
  const __CFString *v85;
  const __CFString *v86;
  const __CFString *v87;
  const __CFString *v88;
  const __CFString *v89;
  const __CFString *v90;
  objc_super v91;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v91.receiver = self;
  v91.super_class = (Class)PHAssetAestheticProperties;
  v10 = -[PHAssetAestheticProperties init](&v91, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->super._asset, v9);
    if (v5)
      v12 = CFSTR("computedAttributes.wellFramedSubjectScore");
    else
      v12 = CFSTR("wellFramedSubjectScore");
    objc_msgSend(v8, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "floatValue");
      v11->_wellFramedSubjectScore = v15;

      v16 = !v5;
      if (v5)
        v17 = CFSTR("computedAttributes.wellChosenSubjectScore");
      else
        v17 = CFSTR("wellChosenSubjectScore");
      if (v5)
        v18 = CFSTR("computedAttributes.tastefullyBlurredScore");
      else
        v18 = CFSTR("tastefullyBlurredScore");
      if (v5)
        v19 = CFSTR("computedAttributes.sharplyFocusedSubjectScore");
      else
        v19 = CFSTR("sharplyFocusedSubjectScore");
      if (v5)
        v20 = CFSTR("computedAttributes.wellTimedShotScore");
      else
        v20 = CFSTR("wellTimedShotScore");
      if (v5)
        v21 = CFSTR("computedAttributes.pleasantLightingScore");
      else
        v21 = CFSTR("pleasantLightingScore");
      if (v5)
        v22 = CFSTR("computedAttributes.pleasantReflectionsScore");
      else
        v22 = CFSTR("pleasantReflectionsScore");
      if (v16)
        v23 = CFSTR("harmoniousColorScore");
      else
        v23 = CFSTR("computedAttributes.harmoniousColorScore");
      v24 = CFSTR("computedAttributes.livelyColorScore");
      if (v16)
        v24 = CFSTR("livelyColorScore");
      v78 = v24;
      v25 = CFSTR("pleasantSymmetryScore");
      if (!v16)
        v25 = CFSTR("computedAttributes.pleasantSymmetryScore");
      v79 = v25;
      if (v16)
        v26 = CFSTR("pleasantPatternScore");
      else
        v26 = CFSTR("computedAttributes.pleasantPatternScore");
      v80 = v26;
      if (v16)
        v27 = CFSTR("immersivenessScore");
      else
        v27 = CFSTR("computedAttributes.immersivenessScore");
      v28 = CFSTR("pleasantPerspectiveScore");
      if (!v16)
        v28 = CFSTR("computedAttributes.pleasantPerspectiveScore");
      v81 = v27;
      v82 = v28;
      if (v16)
        v29 = CFSTR("pleasantPostProcessingScore");
      else
        v29 = CFSTR("computedAttributes.pleasantPostProcessingScore");
      v30 = CFSTR("computedAttributes.noiseScore");
      if (v16)
        v30 = CFSTR("noiseScore");
      v83 = v29;
      v84 = v30;
      v31 = CFSTR("failureScore");
      if (!v16)
        v31 = CFSTR("computedAttributes.failureScore");
      v85 = v31;
      if (v16)
        v32 = CFSTR("pleasantCompositionScore");
      else
        v32 = CFSTR("computedAttributes.pleasantCompositionScore");
      v86 = v32;
      if (v16)
        v33 = CFSTR("interestingSubjectScore");
      else
        v33 = CFSTR("computedAttributes.interestingSubjectScore");
      v34 = CFSTR("intrusiveObjectPresenceScore");
      if (!v16)
        v34 = CFSTR("computedAttributes.intrusiveObjectPresenceScore");
      v87 = v33;
      v88 = v34;
      if (v16)
        v35 = CFSTR("pleasantCameraTiltScore");
      else
        v35 = CFSTR("computedAttributes.pleasantCameraTiltScore");
      v36 = CFSTR("computedAttributes.lowLight");
      if (v16)
        v36 = CFSTR("lowLight");
      v89 = v35;
      v90 = v36;
      objc_msgSend(v8, "objectForKeyedSubscript:", v17);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "floatValue");
      v11->_wellChosenSubjectScore = v38;

      objc_msgSend(v8, "objectForKeyedSubscript:", v18);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "floatValue");
      v11->_tastefullyBlurredScore = v40;

      objc_msgSend(v8, "objectForKeyedSubscript:", v19);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "floatValue");
      v11->_sharplyFocusedSubjectScore = v42;

      objc_msgSend(v8, "objectForKeyedSubscript:", v20);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "floatValue");
      v11->_wellTimedShotScore = v44;

      objc_msgSend(v8, "objectForKeyedSubscript:", v21);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "floatValue");
      v11->_pleasantLightingScore = v46;

      objc_msgSend(v8, "objectForKeyedSubscript:", v22);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "floatValue");
      v11->_pleasantReflectionsScore = v48;

      objc_msgSend(v8, "objectForKeyedSubscript:", v23);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "floatValue");
      v11->_harmoniousColorScore = v50;

      objc_msgSend(v8, "objectForKeyedSubscript:", v78);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "floatValue");
      v11->_livelyColorScore = v52;

      objc_msgSend(v8, "objectForKeyedSubscript:", v79);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "floatValue");
      v11->_pleasantSymmetryScore = v54;

      objc_msgSend(v8, "objectForKeyedSubscript:", v80);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "floatValue");
      v11->_pleasantPatternScore = v56;

      objc_msgSend(v8, "objectForKeyedSubscript:", v81);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "floatValue");
      v11->_immersivenessScore = v58;

      objc_msgSend(v8, "objectForKeyedSubscript:", v82);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "floatValue");
      v11->_pleasantPerspectiveScore = v60;

      objc_msgSend(v8, "objectForKeyedSubscript:", v83);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "floatValue");
      v11->_pleasantPostProcessingScore = v62;

      objc_msgSend(v8, "objectForKeyedSubscript:", v84);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "floatValue");
      v11->_noiseScore = v64;

      objc_msgSend(v8, "objectForKeyedSubscript:", v85);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "floatValue");
      v11->_failureScore = v66;

      objc_msgSend(v8, "objectForKeyedSubscript:", v86);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "floatValue");
      v11->_pleasantCompositionScore = v68;

      objc_msgSend(v8, "objectForKeyedSubscript:", v87);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "floatValue");
      v11->_interestingSubjectScore = v70;

      objc_msgSend(v8, "objectForKeyedSubscript:", v88);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "floatValue");
      v11->_intrusiveObjectPresenceScore = v72;

      objc_msgSend(v8, "objectForKeyedSubscript:", v89);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "floatValue");
      v11->_pleasantCameraTiltScore = v74;

      objc_msgSend(v8, "objectForKeyedSubscript:", v90);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "floatValue");
      v11->_lowLight = v76;

    }
    else
    {
      -[PHAssetAestheticProperties initWithDefaultValues](v11, "initWithDefaultValues");
    }
  }

  return v11;
}

- (float)wellFramedSubjectScore
{
  return self->_wellFramedSubjectScore;
}

- (float)wellChosenSubjectScore
{
  return self->_wellChosenSubjectScore;
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

- (float)lowLight
{
  return self->_lowLight;
}

+ (id)propertySetName
{
  return CFSTR("PHAssetPropertySetAesthetic");
}

+ (id)keyPathFromPrimaryObject
{
  return CFSTR("computedAttributes");
}

+ (id)entityName
{
  return CFSTR("ComputedAssetAttributes");
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  return (id)propertiesToFetch_pl_once_object_57;
}

void __47__PHAssetAestheticProperties_propertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[22];

  v3[21] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("wellFramedSubjectScore");
  v3[1] = CFSTR("wellChosenSubjectScore");
  v3[2] = CFSTR("tastefullyBlurredScore");
  v3[3] = CFSTR("sharplyFocusedSubjectScore");
  v3[4] = CFSTR("wellTimedShotScore");
  v3[5] = CFSTR("pleasantLightingScore");
  v3[6] = CFSTR("pleasantReflectionsScore");
  v3[7] = CFSTR("harmoniousColorScore");
  v3[8] = CFSTR("livelyColorScore");
  v3[9] = CFSTR("pleasantSymmetryScore");
  v3[10] = CFSTR("pleasantPatternScore");
  v3[11] = CFSTR("immersivenessScore");
  v3[12] = CFSTR("pleasantPerspectiveScore");
  v3[13] = CFSTR("pleasantPostProcessingScore");
  v3[14] = CFSTR("noiseScore");
  v3[15] = CFSTR("failureScore");
  v3[16] = CFSTR("pleasantCompositionScore");
  v3[17] = CFSTR("interestingSubjectScore");
  v3[18] = CFSTR("intrusiveObjectPresenceScore");
  v3[19] = CFSTR("pleasantCameraTiltScore");
  v3[20] = CFSTR("lowLight");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 21);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertiesToFetch_pl_once_object_57;
  propertiesToFetch_pl_once_object_57 = v1;

}

@end
