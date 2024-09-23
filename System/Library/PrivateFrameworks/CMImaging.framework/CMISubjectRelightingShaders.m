@implementation CMISubjectRelightingShaders

- (CMISubjectRelightingShaders)initWithMetalContext:(id)a3
{
  id v4;
  MTLComputePipelineState *v5;
  MTLComputePipelineState *srlGlobalSparseHistogramLivePhotos;
  MTLComputePipelineState *v7;
  MTLComputePipelineState *srlFaceSparseHistogramLivePhotos;
  MTLComputePipelineState *v9;
  MTLComputePipelineState *srlCalcCoefficientsLivePhotos;
  MTLComputePipelineState *v11;
  MTLComputePipelineState *srlGlobalSparseHistogram;
  MTLComputePipelineState *v13;
  MTLComputePipelineState *srlFaceSparseHistogram;
  MTLComputePipelineState *v15;
  MTLComputePipelineState *srlCalcCoefficients;
  MTLComputePipelineState *v17;
  MTLComputePipelineState *srlApply;
  MTLComputePipelineState *v19;
  MTLComputePipelineState *srlCalcPostSRLStats;
  objc_super v22;

  v4 = a3;
  if (!v4)
    goto LABEL_14;
  v22.receiver = self;
  v22.super_class = (Class)CMISubjectRelightingShaders;
  self = -[CMISubjectRelightingShaders init](&v22, sel_init);
  if (!self)
  {
    FigDebugAssert3();
    goto LABEL_11;
  }
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("srlGlobalSparseHistogramLivePhotos"), 0);
  v5 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  srlGlobalSparseHistogramLivePhotos = self->_srlGlobalSparseHistogramLivePhotos;
  self->_srlGlobalSparseHistogramLivePhotos = v5;

  if (!self->_srlGlobalSparseHistogramLivePhotos)
    goto LABEL_14;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("srlFaceSparseHistogramLivePhotos"), 0);
  v7 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  srlFaceSparseHistogramLivePhotos = self->_srlFaceSparseHistogramLivePhotos;
  self->_srlFaceSparseHistogramLivePhotos = v7;

  if (!self->_srlFaceSparseHistogramLivePhotos)
    goto LABEL_14;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("srlCalcCoefficientsLivePhotos"), 0);
  v9 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  srlCalcCoefficientsLivePhotos = self->_srlCalcCoefficientsLivePhotos;
  self->_srlCalcCoefficientsLivePhotos = v9;

  if (!self->_srlCalcCoefficientsLivePhotos)
    goto LABEL_14;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("srlGlobalSparseHistogram"), 0);
  v11 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  srlGlobalSparseHistogram = self->_srlGlobalSparseHistogram;
  self->_srlGlobalSparseHistogram = v11;

  if (!self->_srlGlobalSparseHistogram)
    goto LABEL_14;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("srlFaceSparseHistogram"), 0);
  v13 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  srlFaceSparseHistogram = self->_srlFaceSparseHistogram;
  self->_srlFaceSparseHistogram = v13;

  if (!self->_srlFaceSparseHistogram)
    goto LABEL_14;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("srlCalcCoefficients"), 0);
  v15 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  srlCalcCoefficients = self->_srlCalcCoefficients;
  self->_srlCalcCoefficients = v15;

  if (!self->_srlCalcCoefficients)
    goto LABEL_14;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("srlApply"), 0);
  v17 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  srlApply = self->_srlApply;
  self->_srlApply = v17;

  if (!self->_srlApply
    || (objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("srlCalcPostSRLStats"), 0),
        v19 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue(),
        srlCalcPostSRLStats = self->_srlCalcPostSRLStats,
        self->_srlCalcPostSRLStats = v19,
        srlCalcPostSRLStats,
        !self->_srlCalcPostSRLStats))
  {
LABEL_14:
    FigDebugAssert3();
    FigSignalErrorAt();

    self = 0;
  }
LABEL_11:

  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_srlCalcPostSRLStats, 0);
  objc_storeStrong((id *)&self->_srlApply, 0);
  objc_storeStrong((id *)&self->_srlCalcCoefficients, 0);
  objc_storeStrong((id *)&self->_srlFaceSparseHistogram, 0);
  objc_storeStrong((id *)&self->_srlGlobalSparseHistogram, 0);
  objc_storeStrong((id *)&self->_srlCalcCoefficientsLivePhotos, 0);
  objc_storeStrong((id *)&self->_srlFaceSparseHistogramLivePhotos, 0);
  objc_storeStrong((id *)&self->_srlGlobalSparseHistogramLivePhotos, 0);
}

@end
