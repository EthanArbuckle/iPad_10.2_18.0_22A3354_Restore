@implementation BWAdaptiveCorrectionPreviewRegistrationTuningParameters

- (BWAdaptiveCorrectionPreviewRegistrationTuningParameters)init
{
  BWAdaptiveCorrectionPreviewRegistrationTuningParameters *v2;
  BWAdaptiveCorrectionPreviewRegistrationTuningParameters *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWAdaptiveCorrectionPreviewRegistrationTuningParameters;
  v2 = -[BWAdaptiveCorrectionPreviewRegistrationTuningParameters init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)&v2->_regToolBoxConfig.keypointGridHeight = 0x700000018;
    *(_QWORD *)&v2->_regToolBoxConfig.keypointsSearchRadius = 1;
    *(_QWORD *)&v2->_keypointsMinSelectionScore = 0x3003FD9999ALL;
    *(_OWORD *)&v2->_epipolarWeightFalloffDistance = xmmword_1A32A1FD0;
    *(_OWORD *)&v2->_regToolBoxConfig.numPyrLevels = xmmword_1A32A1FC0;
    -[BWAdaptiveCorrectionPreviewRegistrationTuningParameters _setDefaultAdaptiveCorrectionParameters]((uint64_t)v2);
    v3->_adaptiveCorrectionConfigsPtr = v3->_adaptiveCorrectionConfigs;
  }
  return v3;
}

- (uint64_t)_setDefaultAdaptiveCorrectionParameters
{
  uint64_t i;
  uint64_t v2;
  int v3;

  if (result)
  {
    for (i = 0; i != 1536; i += 512)
    {
      v2 = result + i;
      *(_OWORD *)(v2 + 64) = xmmword_1A32A1FE0;
      *(_OWORD *)(v2 + 80) = xmmword_1A32A1FF0;
      *(_OWORD *)(v2 + 96) = xmmword_1A32A2000;
      *(_OWORD *)(v2 + 120) = xmmword_1A32A2010;
      *(_QWORD *)(v2 + 136) = 0x4072C00000000000;
      *(_OWORD *)(v2 + 152) = xmmword_1A32A2020;
      *(_QWORD *)(v2 + 168) = 0x3FB999999999999ALL;
      *(_BYTE *)(v2 + 176) = 1;
      *(_QWORD *)(v2 + 184) = 0x3F50624DD2F1A9FCLL;
      if (i)
        v3 = 5;
      else
        v3 = 10;
      *(_DWORD *)(v2 + 144) = v3;
    }
  }
  return result;
}

+ (void)initialize
{
  objc_opt_class();
}

- (BWAdaptiveCorrectionPreviewRegistrationTuningParameters)initWithTuningDictionary:(id)a3
{
  BWAdaptiveCorrectionPreviewRegistrationTuningParameters *v4;
  BWAdaptiveCorrectionPreviewRegistrationTuningParameters *v5;
  double v6;
  float v7;
  double v8;
  uint64_t v9;
  double v10;
  double *p_rangeOCxT;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)BWAdaptiveCorrectionPreviewRegistrationTuningParameters;
  v4 = -[BWAdaptiveCorrectionPreviewRegistrationTuningParameters init](&v27, sel_init);
  v5 = v4;
  if (v4)
  {
    *(_QWORD *)&v4->_regToolBoxConfig.keypointGridHeight = 0x700000018;
    *(_QWORD *)&v4->_regToolBoxConfig.keypointsSearchRadius = 1;
    *(_QWORD *)&v4->_keypointsMinSelectionScore = 0x3003FD9999ALL;
    *(_OWORD *)&v4->_epipolarWeightFalloffDistance = xmmword_1A32A1FD0;
    *(_OWORD *)&v4->_regToolBoxConfig.numPyrLevels = xmmword_1A32A1FC0;
    -[BWAdaptiveCorrectionPreviewRegistrationTuningParameters _setDefaultAdaptiveCorrectionParameters]((uint64_t)v4);
    v5->_regToolBoxConfig.numPyrLevels = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RegTollboxParams")), "objectForKeyedSubscript:", CFSTR("numPyrLevels")), "unsignedIntValue");
    v5->_regToolBoxConfig.keypointGridWidth = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RegTollboxParams")), "objectForKeyedSubscript:", CFSTR("keypointGridWidth")), "unsignedIntValue");
    v5->_regToolBoxConfig.keypointGridHeight = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RegTollboxParams")), "objectForKeyedSubscript:", CFSTR("keypointGridHeight")), "unsignedIntValue");
    v5->_regToolBoxConfig.keypointsTemplateRadius = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RegTollboxParams")), "objectForKeyedSubscript:", CFSTR("keypointsTemplateRadius")), "unsignedIntValue");
    v5->_regToolBoxConfig.keypointsSearchRadius = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RegTollboxParams")), "objectForKeyedSubscript:", CFSTR("keypointsSearchRadius")), "unsignedIntValue");
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RegTollboxParams")), "objectForKeyedSubscript:", CFSTR("keypointsMinNccScore")), "doubleValue");
    *(float *)&v6 = v6;
    v5->_regToolBoxConfig.keypointsMinNccScore = *(float *)&v6;
    v5->_regToolBoxConfig.imageWidth = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RegTollboxParams")), "objectForKeyedSubscript:", CFSTR("imageWidth")), "unsignedIntValue");
    v5->_regToolBoxConfig.imageHeight = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RegTollboxParams")), "objectForKeyedSubscript:", CFSTR("imageHeight")), "unsignedIntValue");
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("keypointsMinSelectionScore")), "floatValue");
    v5->_keypointsMinSelectionScore = v7;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("epipolarWeightFalloffDistance")), "doubleValue");
    v5->_epipolarWeightFalloffDistance = v8;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("macroDepthWeightFalloffDistance")), "doubleValue");
    v9 = 0;
    v5->_macroDepthWeightFalloffDistance = v10;
    p_rangeOCxT = &v5->_adaptiveCorrectionConfigs[0].rangeOCxT;
    do
    {
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AdaptiveCorrectionConfig")), "objectForKeyedSubscript:", objc_msgSend(&unk_1E4A00200, "objectAtIndexedSubscript:", v9)), "objectForKeyedSubscript:", CFSTR("epErrorLimitWidePix_FirstPass")), "doubleValue");
      *((_QWORD *)p_rangeOCxT - 4) = v12;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AdaptiveCorrectionConfig")), "objectForKeyedSubscript:", objc_msgSend(&unk_1E4A00200, "objectAtIndexedSubscript:", v9)), "objectForKeyedSubscript:", CFSTR("epErrorLimitWidePix_SecondPass")), "doubleValue");
      *((_QWORD *)p_rangeOCxT - 3) = v13;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AdaptiveCorrectionConfig")), "objectForKeyedSubscript:", objc_msgSend(&unk_1E4A00200, "objectAtIndexedSubscript:", v9)), "objectForKeyedSubscript:", CFSTR("rangePFL_T")), "doubleValue");
      *((_QWORD *)p_rangeOCxT - 2) = v14;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AdaptiveCorrectionConfig")), "objectForKeyedSubscript:", objc_msgSend(&unk_1E4A00200, "objectAtIndexedSubscript:", v9)), "objectForKeyedSubscript:", CFSTR("rangePFL_W")), "doubleValue");
      *((_QWORD *)p_rangeOCxT - 1) = v15;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AdaptiveCorrectionConfig")), "objectForKeyedSubscript:", objc_msgSend(&unk_1E4A00200, "objectAtIndexedSubscript:", v9)), "objectForKeyedSubscript:", CFSTR("rangeOCxT")), "doubleValue");
      *(_QWORD *)p_rangeOCxT = v16;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AdaptiveCorrectionConfig")), "objectForKeyedSubscript:", objc_msgSend(&unk_1E4A00200, "objectAtIndexedSubscript:", v9)), "objectForKeyedSubscript:", CFSTR("rangeOCxW")), "doubleValue");
      *((_QWORD *)p_rangeOCxT + 1) = v17;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AdaptiveCorrectionConfig")), "objectForKeyedSubscript:", objc_msgSend(&unk_1E4A00200, "objectAtIndexedSubscript:", v9)), "objectForKeyedSubscript:", CFSTR("rangeOCyW")), "doubleValue");
      *((_QWORD *)p_rangeOCxT + 3) = v18;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AdaptiveCorrectionConfig")), "objectForKeyedSubscript:", objc_msgSend(&unk_1E4A00200, "objectAtIndexedSubscript:", v9)), "objectForKeyedSubscript:", CFSTR("intermediateMacroDistMM")), "doubleValue");
      *((_QWORD *)p_rangeOCxT + 4) = v19;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AdaptiveCorrectionConfig")), "objectForKeyedSubscript:", objc_msgSend(&unk_1E4A00200, "objectAtIndexedSubscript:", v9)), "objectForKeyedSubscript:", CFSTR("extremeMacroDistMM")), "doubleValue");
      *((_QWORD *)p_rangeOCxT + 5) = v20;
      *((_DWORD *)p_rangeOCxT + 12) = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AdaptiveCorrectionConfig")), "objectForKeyedSubscript:", objc_msgSend(&unk_1E4A00200, "objectAtIndexedSubscript:", v9)), "objectForKeyedSubscript:", CFSTR("minPointsForAdjustment")), "intValue");
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AdaptiveCorrectionConfig")), "objectForKeyedSubscript:", objc_msgSend(&unk_1E4A00200, "objectAtIndexedSubscript:", v9)), "objectForKeyedSubscript:", CFSTR("errorVal_GreaterThanInf")), "doubleValue");
      *((_QWORD *)p_rangeOCxT + 7) = v21;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AdaptiveCorrectionConfig")), "objectForKeyedSubscript:", objc_msgSend(&unk_1E4A00200, "objectAtIndexedSubscript:", v9)), "objectForKeyedSubscript:", CFSTR("errorVal_LessThanExtremeMacro")), "doubleValue");
      *((_QWORD *)p_rangeOCxT + 8) = v22;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AdaptiveCorrectionConfig")), "objectForKeyedSubscript:", objc_msgSend(&unk_1E4A00200, "objectAtIndexedSubscript:", v9)), "objectForKeyedSubscript:", CFSTR("errorVal_BetweenIntermediate_ExtremeMacro")), "doubleValue");
      *((_QWORD *)p_rangeOCxT + 9) = v23;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AdaptiveCorrectionConfig")), "objectForKeyedSubscript:", objc_msgSend(&unk_1E4A00200, "objectAtIndexedSubscript:", v9)), "objectForKeyedSubscript:", CFSTR("runAnalyticalPreconditioning")), "doubleValue");
      *((_BYTE *)p_rangeOCxT + 80) = v24 != 0.0;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AdaptiveCorrectionConfig")), "objectForKeyedSubscript:", objc_msgSend(&unk_1E4A00200, "objectAtIndexedSubscript:", v9)), "objectForKeyedSubscript:", CFSTR("spgEpsilon")), "doubleValue");
      *((_QWORD *)p_rangeOCxT + 11) = v25;
      ++v9;
      p_rangeOCxT += 64;
    }
    while (v9 != 3);
    v5->_adaptiveCorrectionConfigsPtr = v5->_adaptiveCorrectionConfigs;
  }
  return v5;
}

- (float)keypointsMinSelectionScore
{
  return self->_keypointsMinSelectionScore;
}

- (unsigned)configuredNumKeypoints
{
  return self->_configuredNumKeypoints;
}

- (double)epipolarWeightFalloffDistance
{
  return self->_epipolarWeightFalloffDistance;
}

- (double)macroDepthWeightFalloffDistance
{
  return self->_macroDepthWeightFalloffDistance;
}

- (BWAdaptiveCorrectionPreviewRegistrationRegToolBoxConfig)regToolBoxConfig
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].keypointGridHeight;
  *(_OWORD *)&retstr->numPyrLevels = *(_OWORD *)&self[1].numPyrLevels;
  *(_OWORD *)&retstr->keypointGridHeight = v3;
  return self;
}

- (const)adaptiveCorrectionConfigsPtr
{
  return self->_adaptiveCorrectionConfigsPtr;
}

@end
