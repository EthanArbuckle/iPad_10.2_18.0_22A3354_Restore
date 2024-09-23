@implementation BWUBCaptureParameters

- (int)maxNumberOfFramesForAdaptiveBracketing
{
  return self->_maxNumberOfFramesForAdaptiveBracketing;
}

- (BWUBCaptureParameters)initWithPortType:(id)a3 sensorIDDictionary:(id)a4
{
  uint64_t v4;
  uint64_t v7;
  void *v8;
  BWUBCaptureParameters *v9;
  double v10;
  double v11;
  float v12;
  float v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  NSArray *v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  double v28;
  double v29;
  float v30;
  float v31;
  void *v32;
  int v33;
  const __CFString *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
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
  uint64_t v53;
  uint64_t v54;
  objc_super v55;

  if (a3 && (v7 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("UBCaptureParameters"))) != 0)
  {
    v8 = (void *)v7;
    v55.receiver = self;
    v55.super_class = (Class)BWUBCaptureParameters;
    v9 = -[BWUBCaptureParameters init](&v55, sel_init);
    if (v9)
    {
      v9->_portType = (NSString *)a3;
      v9->_nonHDRBrightLightCapturesEnabled = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("NonHDRBrightLightCapturesEnabled")), "BOOLValue");
      objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("LowLightEffectiveIntegrationTimeThreshold")), "doubleValue");
      v9->_lowLightEffectiveIntegrationTimeThreshold = v10;
      objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SIFRMainEffectiveIntegrationTimeThreshold")), "doubleValue");
      v9->_sifrMainEffectiveIntegrationTimeThreshold = v11;
      objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SIFRGainThreshold")), "floatValue");
      v9->_sifrGainThreshold = v12;
      objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("LowLightHDRWithoutSIFRISPDGainThreshold")), "floatValue");
      v9->_lowLightHDRWithoutSIFRISPDGainThreshold = v13;
      objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("LongWithoutSphereEffectiveIntegrationTimeThreshold")), "doubleValue");
      v9->_longWithoutSphereEffectiveIntegrationTimeThreshold = v14;
      v15 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DeepFusionEffectiveIntegrationTimeThreshold"));
      if (!v15)
        v15 = &unk_1E4A02ED0;
      objc_msgSend(v15, "doubleValue");
      v9->_deepFusionEffectiveIntegrationTimeThreshold = v16;
      v17 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DeepFusionBracketedCaptureReferenceFrameIndex"));
      if (!v17)
        v17 = &unk_1E49FA638;
      v9->_deepFusionBracketedCaptureReferenceFrameIndex = objc_msgSend(v17, "intValue");
      v18 = (NSArray *)(id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DeepFusionHDREVZeroCountByEffectiveIntegrationTime"));
      v9->_deepFusionHDREVZeroCountByEffectiveIntegrationTime = v18;
      if ((-[NSArray count](v18, "count") & 1) != 0)
      {
        fig_log_get_emitter();
        v54 = v4;
        LODWORD(v53) = 0;
        FigDebugAssert3();

        v9->_deepFusionHDREVZeroCountByEffectiveIntegrationTime = 0;
      }
      v19 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("LearnedNRUltraHighResolutionDowngradeEffectiveIntegrationTimeThreshold"), v53, v54);
      if (!v19)
        v19 = &unk_1E4A02EE0;
      objc_msgSend(v19, "doubleValue");
      v9->_learnedNRUltraHighResolutionDowngradeEffectiveIntegrationTimeThreshold = v20;
      v21 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("LearnedNRUltraHighResolutionExposureBias"));
      if (!v21)
        v21 = &unk_1E49FA650;
      objc_msgSend(v21, "doubleValue");
      *(float *)&v22 = v22;
      v9->_learnedNRUltraHighResolutionExposureBias = *(float *)&v22;
      v23 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AutoFlashColorConstancyNormalizedSNRThreshold"));
      if (!v23)
        v23 = &unk_1E4A02EE0;
      objc_msgSend(v23, "doubleValue");
      *(float *)&v24 = v24;
      v9->_autoFlashColorConstancyNormalizedSNRThreshold = *(float *)&v24;
      v25 = objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AutoFlashMacroNormalizedSNRThreshold"));
      if (v25)
        v26 = (void *)v25;
      else
        v26 = &unk_1E4A02EE0;
      v27 = *MEMORY[0x1E0D05A28];
      -[NSString isEqualToString:](v9->_portType, "isEqualToString:", *MEMORY[0x1E0D05A28]);
      objc_msgSend(v26, "doubleValue");
      *(float *)&v28 = v28;
      v9->_autoFlashMacroNormalizedSNRThreshold = *(float *)&v28;
      -[NSString isEqualToString:](v9->_portType, "isEqualToString:", v27);
      v9->_macroFlashQSubSwitchingEnabled = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MacroFlashQSubSwitchingEnabled")), "BOOLValue");
      objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("RedSaturationMainEffectiveIntegrationTimeThreshold")), "doubleValue");
      v9->_redSaturationMainEffectiveIntegrationTimeThreshold = v29;
      objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("RedSaturationSIFRGainThreshold")), "floatValue");
      v9->_redSaturationSIFRGainThreshold = v30;
      v9->_toneCurveBehavior = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ToneCurveBehavior")), "intValue");
      v9->_preserveBlackLevel = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PreserveBlackLevel")), "BOOLValue");
      objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("NightModeMinGainThreshold")), "floatValue");
      v9->_nightModeMinGainThreshold = v31;
      v9->_alwaysUseAFTimeout = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AlwaysUseAFTimeout")), "BOOLValue");
      v9->_afWindowParams = (NSArray *)objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AFWindowParams")), "copy");
      v32 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AdaptiveBracketingParameters"));
      v33 = objc_msgSend((id)objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("FirstGroupMaxNumberOfFramesCount")), "intValue");
      if (v33 <= (int)objc_msgSend((id)objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("NextGroupMaxNumberOfFramesCount")), "intValue"))v34 = CFSTR("NextGroupMaxNumberOfFramesCount");
      else
        v34 = CFSTR("FirstGroupMaxNumberOfFramesCount");
      v9->_maxNumberOfFramesForAdaptiveBracketing = objc_msgSend((id)objc_msgSend(v32, "objectForKeyedSubscript:", v34), "intValue");
      v35 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DigitalFlashAvailableEffectiveIntegrationTimeThreshold"));
      if (!v35)
        v35 = &unk_1E4A02EE0;
      objc_msgSend(v35, "doubleValue");
      v9->_digitalFlashAvailableEffectiveIntegrationTimeThreshold = v36;
      objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DigitalFlashRecommendedEffectiveIntegrationTimeThreshold")), "doubleValue");
      v9->_digitalFlashRecommendedEffectiveIntegrationTimeThreshold = v37;
      objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("StationaryDigitalFlashRecommendedEffectiveIntegrationTimeThreshold")), "doubleValue");
      v9->_stationaryDigitalFlashRecommendedEffectiveIntegrationTimeThreshold = v38;
      v39 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DigitalFlashRecommendRegularFlashSNRThreshold"));
      if (!v39)
        v39 = &unk_1E4A02EE0;
      objc_msgSend(v39, "floatValue");
      v9->_digitalFlashRecommendRegularFlashSNRThreshold = v40;
      v41 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DigitalFlashBacklitRecommendRegularFlashSNRThreshold"));
      if (!v41)
        v41 = &unk_1E4A02EE0;
      objc_msgSend(v41, "floatValue");
      v9->_digitalFlashBacklitRecommendRegularFlashSNRThreshold = v42;
      v43 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DigitalFlashBacklitRecommendRegularFlashAERelativeDifferenceThreshold"));
      if (!v43)
        v43 = &unk_1E4A02EE0;
      objc_msgSend(v43, "floatValue");
      v9->_digitalFlashBacklitRecommendRegularFlashAERelativeDifferenceThreshold = v44;
      v9->_digitalFlashHighlightRecoveryEnabled = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DigitalFlashHighlightRecoveryEnabled")), "BOOLValue");
      v45 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SambaThresholdA"));
      if (!v45)
        v45 = &unk_1E4A02EE0;
      objc_msgSend(v45, "floatValue");
      v9->_stereoPhotoSNRThreshold = v46;
      v47 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SambaThresholdB"));
      if (!v47)
        v47 = &unk_1E4A02EE0;
      objc_msgSend(v47, "floatValue");
      v9->_stereoPhotoSNRDifferenceSecondarySNRThreshold = v48;
      v49 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SambaThresholdC"));
      if (!v49)
        v49 = &unk_1E4A02EE0;
      objc_msgSend(v49, "floatValue");
      v9->_stereoPhotoSNRDifferenceThreshold = v50;
      v51 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ReferenceFrameSelectionParameters"));
      v9->_referenceFrameSelectionMethod = objc_msgSend((id)objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("Method")), "intValue");
      v9->_usePreviousSIFR = objc_msgSend((id)objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("UsePreviousSIFR")), "BOOLValue");
      v9->_motionAndFocusScoreWeights = (NSArray *)(id)objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("MotionAndFocusScoreWeights"));
    }
  }
  else
  {

    return 0;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWUBCaptureParameters;
  -[BWUBCaptureParameters dealloc](&v3, sel_dealloc);
}

- (double)digitalFlashAvailableEffectiveIntegrationTimeThreshold
{
  return self->_digitalFlashAvailableEffectiveIntegrationTimeThreshold;
}

- (double)sifrMainEffectiveIntegrationTimeThreshold
{
  return self->_sifrMainEffectiveIntegrationTimeThreshold;
}

- (float)redSaturationSIFRGainThreshold
{
  return self->_redSaturationSIFRGainThreshold;
}

- (double)redSaturationMainEffectiveIntegrationTimeThreshold
{
  return self->_redSaturationMainEffectiveIntegrationTimeThreshold;
}

- (float)lowLightHDRWithoutSIFRISPDGainThreshold
{
  return self->_lowLightHDRWithoutSIFRISPDGainThreshold;
}

- (double)lowLightEffectiveIntegrationTimeThreshold
{
  return self->_lowLightEffectiveIntegrationTimeThreshold;
}

- (double)learnedNRUltraHighResolutionDowngradeEffectiveIntegrationTimeThreshold
{
  return self->_learnedNRUltraHighResolutionDowngradeEffectiveIntegrationTimeThreshold;
}

- (double)digitalFlashRecommendedEffectiveIntegrationTimeThreshold
{
  return self->_digitalFlashRecommendedEffectiveIntegrationTimeThreshold;
}

- (float)digitalFlashRecommendRegularFlashSNRThreshold
{
  return self->_digitalFlashRecommendRegularFlashSNRThreshold;
}

- (float)digitalFlashBacklitRecommendRegularFlashSNRThreshold
{
  return self->_digitalFlashBacklitRecommendRegularFlashSNRThreshold;
}

- (double)deepFusionEffectiveIntegrationTimeThreshold
{
  return self->_deepFusionEffectiveIntegrationTimeThreshold;
}

- (int)referenceFrameSelectionMethod
{
  return self->_referenceFrameSelectionMethod;
}

- (BOOL)preserveBlackLevel
{
  return self->_preserveBlackLevel;
}

- (BOOL)nonHDRBrightLightCapturesEnabled
{
  return self->_nonHDRBrightLightCapturesEnabled;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> lowLightEIT=%f, sifrMainEIT=%f, sifrGain=%f, lowLightHDRWithoutSIFR=%f, longWithoutSphere=%f, deepFusion=%f, rsmMainEIT=%f, rsmSIFRGain=%f, toneCurveBehavior=%d, preserveBlackLevel=%d, afWindows=%p, refMethod=%d, usePreviousSIFR=%d, motionAndFocusScoreWeights=%@, maxNumberOfFramesForAdaptiveBracketing=%d, dFlashAvailableEIT=%f, dFlashRecommendedEIT=%f, dFlashStationaryRecommendedEIT=%f, dFlashRecommendRegularFlashSNR=%f, dFlashBacklitRecommendRegularFlashSNR=%f, dFlashBacklitRecommendRegularFlashAERelativeDiff=%f"), objc_opt_class(), self, *(_QWORD *)&self->_lowLightEffectiveIntegrationTimeThreshold, *(_QWORD *)&self->_sifrMainEffectiveIntegrationTimeThreshold, self->_sifrGainThreshold, self->_lowLightHDRWithoutSIFRISPDGainThreshold, *(_QWORD *)&self->_longWithoutSphereEffectiveIntegrationTimeThreshold, *(_QWORD *)&self->_deepFusionEffectiveIntegrationTimeThreshold, *(_QWORD *)&self->_redSaturationMainEffectiveIntegrationTimeThreshold, self->_redSaturationSIFRGainThreshold, self->_toneCurveBehavior, self->_preserveBlackLevel, self->_afWindowParams, self->_referenceFrameSelectionMethod, self->_usePreviousSIFR, self->_motionAndFocusScoreWeights,
               self->_maxNumberOfFramesForAdaptiveBracketing,
               *(_QWORD *)&self->_digitalFlashAvailableEffectiveIntegrationTimeThreshold,
               *(_QWORD *)&self->_digitalFlashRecommendedEffectiveIntegrationTimeThreshold,
               *(_QWORD *)&self->_stationaryDigitalFlashRecommendedEffectiveIntegrationTimeThreshold,
               self->_digitalFlashRecommendRegularFlashSNRThreshold,
               self->_digitalFlashBacklitRecommendRegularFlashSNRThreshold,
               self->_digitalFlashBacklitRecommendRegularFlashAERelativeDifferenceThreshold);
}

- (int)deepFusionHDREVZeroCountForEffectiveIntegrationTime:(double)a3
{
  unint64_t v5;
  NSArray *deepFusionHDREVZeroCountByEffectiveIntegrationTime;
  double v7;

  if (!-[NSArray count](self->_deepFusionHDREVZeroCountByEffectiveIntegrationTime, "count")
    || !-[NSArray count](self->_deepFusionHDREVZeroCountByEffectiveIntegrationTime, "count"))
  {
    return 3;
  }
  v5 = 0;
  while (1)
  {
    objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_deepFusionHDREVZeroCountByEffectiveIntegrationTime, "objectAtIndexedSubscript:", v5), "doubleValue");
    deepFusionHDREVZeroCountByEffectiveIntegrationTime = self->_deepFusionHDREVZeroCountByEffectiveIntegrationTime;
    if (v7 < a3)
      break;
    v5 += 2;
    if (-[NSArray count](deepFusionHDREVZeroCountByEffectiveIntegrationTime, "count") <= v5)
      return 3;
  }
  return objc_msgSend(-[NSArray objectAtIndexedSubscript:](deepFusionHDREVZeroCountByEffectiveIntegrationTime, "objectAtIndexedSubscript:", v5 & 0xFFFFFFFE | 1), "intValue");
}

- (double)stationaryDigitalFlashRecommendedEffectiveIntegrationTimeThreshold
{
  return self->_stationaryDigitalFlashRecommendedEffectiveIntegrationTimeThreshold;
}

- (float)digitalFlashBacklitRecommendRegularFlashAERelativeDifferenceThreshold
{
  return self->_digitalFlashBacklitRecommendRegularFlashAERelativeDifferenceThreshold;
}

- (BOOL)digitalFlashHighlightRecoveryEnabled
{
  return self->_digitalFlashHighlightRecoveryEnabled;
}

- (float)stereoPhotoSNRThreshold
{
  return self->_stereoPhotoSNRThreshold;
}

- (float)stereoPhotoSNRDifferenceSecondarySNRThreshold
{
  return self->_stereoPhotoSNRDifferenceSecondarySNRThreshold;
}

- (float)stereoPhotoSNRDifferenceThreshold
{
  return self->_stereoPhotoSNRDifferenceThreshold;
}

- (BOOL)usePreviousSIFR
{
  return self->_usePreviousSIFR;
}

- (id)motionAndFocusScoreWeights
{
  return self->_motionAndFocusScoreWeights;
}

- (float)sifrGainThreshold
{
  return self->_sifrGainThreshold;
}

- (double)longWithoutSphereEffectiveIntegrationTimeThreshold
{
  return self->_longWithoutSphereEffectiveIntegrationTimeThreshold;
}

- (int)deepFusionBracketedCaptureReferenceFrameIndex
{
  return self->_deepFusionBracketedCaptureReferenceFrameIndex;
}

- (float)learnedNRUltraHighResolutionExposureBias
{
  return self->_learnedNRUltraHighResolutionExposureBias;
}

- (BOOL)macroFlashQSubSwitchingEnabled
{
  return self->_macroFlashQSubSwitchingEnabled;
}

- (float)autoFlashColorConstancyNormalizedSNRThreshold
{
  return self->_autoFlashColorConstancyNormalizedSNRThreshold;
}

- (int)toneCurveBehavior
{
  return self->_toneCurveBehavior;
}

- (float)nightModeMinGainThreshold
{
  return self->_nightModeMinGainThreshold;
}

- (NSArray)afWindowParams
{
  return self->_afWindowParams;
}

- (BOOL)alwaysUseAFTimeout
{
  return self->_alwaysUseAFTimeout;
}

- (float)autoFlashMacroNormalizedSNRThreshold
{
  return self->_autoFlashMacroNormalizedSNRThreshold;
}

@end
