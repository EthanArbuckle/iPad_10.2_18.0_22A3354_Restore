@implementation LTMIBPParams

- (void)setIspDGainThreshold:(float)a3
{
  self->_ispDGainThreshold = a3;
}

- (void)setIsHighlightCompressionEnabled:(BOOL)a3
{
  self->_isHighlightCompressionEnabled = a3;
}

- (void)setEnableAntiAliasing:(BOOL)a3
{
  self->_enableAntiAliasing = a3;
}

- (void)setComputeHDRCurves:(BOOL)a3
{
  self->_computeHDRCurves = a3;
}

- (void)setComputeCurvesWoFaceBoost:(BOOL)a3
{
  self->_computeCurvesWoFaceBoost = a3;
}

- (void)setCalcGlobalHistOnROI:(BOOL)a3
{
  self->_calcGlobalHistOnROI = a3;
}

- (float)ispDGainThreshold
{
  return self->_ispDGainThreshold;
}

- (BOOL)isHighlightCompressionEnabled
{
  return self->_isHighlightCompressionEnabled;
}

- (LTMIBPParams)init
{
  LTMIBPParams *v2;
  LTMIBPParams *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LTMIBPParams;
  v2 = -[LTMIBPParams init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[LTMIBPParams reset](v2, "reset");
  return v3;
}

- (void)reset
{
  NSDictionary *inMetaData;
  NSDictionary *outMetaData;
  NSDictionary *validBufferRect;
  NSArray *hazeEstimation;

  inMetaData = self->_inMetaData;
  self->_inMetaData = 0;

  outMetaData = self->_outMetaData;
  self->_outMetaData = 0;

  -[LTMIBPParams releaseTextures](self, "releaseTextures");
  self->_optimizationLevel = 1;
  validBufferRect = self->_validBufferRect;
  self->_validBufferRect = 0;

  self->_digitalFlash = 0;
  *(_DWORD *)&self->_computeHDRCurves = 16843008;
  *(_WORD *)&self->_isAdaptiveHighlightCompressionEnabled = 0;
  self->_evmExpRatio = 1.0;
  self->_doHazeEstimation = 0;
  hazeEstimation = self->_hazeEstimation;
  self->_hazeEstimation = 0;

  self->_isSIFR = 0;
  self->_doGlobalCCM = 0;
  *(_QWORD *)&self->_ispDGainThreshold = 0x41E0000042000000;
}

- (BOOL)enableAntiAliasing
{
  return self->_enableAntiAliasing;
}

- (BOOL)computeHDRCurves
{
  return self->_computeHDRCurves;
}

- (BOOL)computeCurvesWoFaceBoost
{
  return self->_computeCurvesWoFaceBoost;
}

- (BOOL)calcGlobalHistOnROI
{
  return self->_calcGlobalHistOnROI;
}

- (void)releaseTextures
{
  MTLTexture *inRGBImageUInt16Tex;
  MTLTexture *inLumaTex;
  MTLTexture *inChromaTex;
  MTLTexture *inRGBAFloatTex;

  inRGBImageUInt16Tex = self->_inRGBImageUInt16Tex;
  self->_inRGBImageUInt16Tex = 0;

  inLumaTex = self->_inLumaTex;
  self->_inLumaTex = 0;

  inChromaTex = self->_inChromaTex;
  self->_inChromaTex = 0;

  inRGBAFloatTex = self->_inRGBAFloatTex;
  self->_inRGBAFloatTex = 0;

}

- (NSDictionary)tuningParameters
{
  return self->_tuningParameters;
}

- (void)setTuningParameters:(id)a3
{
  objc_storeStrong((id *)&self->_tuningParameters, a3);
}

- (BOOL)isAdaptiveHighlightCompressionEnabled
{
  return self->_isAdaptiveHighlightCompressionEnabled;
}

- (void)setIsAdaptiveHighlightCompressionEnabled:(BOOL)a3
{
  self->_isAdaptiveHighlightCompressionEnabled = a3;
}

- (NSDictionary)validBufferRect
{
  return self->_validBufferRect;
}

- (void)setValidBufferRect:(id)a3
{
  objc_storeStrong((id *)&self->_validBufferRect, a3);
}

- (int)optimizationLevel
{
  return self->_optimizationLevel;
}

- (void)setOptimizationLevel:(int)a3
{
  self->_optimizationLevel = a3;
}

- (NSDictionary)inMetaData
{
  return self->_inMetaData;
}

- (void)setInMetaData:(id)a3
{
  objc_storeStrong((id *)&self->_inMetaData, a3);
}

- (MTLTexture)inRGBImageUInt16Tex
{
  return self->_inRGBImageUInt16Tex;
}

- (void)setInRGBImageUInt16Tex:(id)a3
{
  objc_storeStrong((id *)&self->_inRGBImageUInt16Tex, a3);
}

- (MTLTexture)inRGBAFloatTex
{
  return self->_inRGBAFloatTex;
}

- (void)setInRGBAFloatTex:(id)a3
{
  objc_storeStrong((id *)&self->_inRGBAFloatTex, a3);
}

- (MTLTexture)inLumaTex
{
  return self->_inLumaTex;
}

- (void)setInLumaTex:(id)a3
{
  objc_storeStrong((id *)&self->_inLumaTex, a3);
}

- (MTLTexture)inChromaTex
{
  return self->_inChromaTex;
}

- (void)setInChromaTex:(id)a3
{
  objc_storeStrong((id *)&self->_inChromaTex, a3);
}

- (NSDictionary)outMetaData
{
  return self->_outMetaData;
}

- (void)setOutMetaData:(id)a3
{
  objc_storeStrong((id *)&self->_outMetaData, a3);
}

- (BOOL)digitalFlash
{
  return self->_digitalFlash;
}

- (void)setDigitalFlash:(BOOL)a3
{
  self->_digitalFlash = a3;
}

- (BOOL)isSIFR
{
  return self->_isSIFR;
}

- (void)setIsSIFR:(BOOL)a3
{
  self->_isSIFR = a3;
}

- (float)adaptiveHCSlope
{
  return self->_adaptiveHCSlope;
}

- (void)setAdaptiveHCSlope:(float)a3
{
  self->_adaptiveHCSlope = a3;
}

- (BOOL)doHazeEstimation
{
  return self->_doHazeEstimation;
}

- (void)setDoHazeEstimation:(BOOL)a3
{
  self->_doHazeEstimation = a3;
}

- (NSArray)hazeEstimation
{
  return self->_hazeEstimation;
}

- (void)setHazeEstimation:(id)a3
{
  objc_storeStrong((id *)&self->_hazeEstimation, a3);
}

- (float)evmExpRatio
{
  return self->_evmExpRatio;
}

- (void)setEvmExpRatio:(float)a3
{
  self->_evmExpRatio = a3;
}

- (BOOL)doGlobalCCM
{
  return self->_doGlobalCCM;
}

- (void)setDoGlobalCCM:(BOOL)a3
{
  self->_doGlobalCCM = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hazeEstimation, 0);
  objc_storeStrong((id *)&self->_outMetaData, 0);
  objc_storeStrong((id *)&self->_inChromaTex, 0);
  objc_storeStrong((id *)&self->_inLumaTex, 0);
  objc_storeStrong((id *)&self->_inRGBAFloatTex, 0);
  objc_storeStrong((id *)&self->_inRGBImageUInt16Tex, 0);
  objc_storeStrong((id *)&self->_inMetaData, 0);
  objc_storeStrong((id *)&self->_validBufferRect, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
}

@end
