@implementation MLCRNNCPUDeviceOps

+ (id)deviceOpsWithType:(int)a3 params:(id)a4 inDeltaData:(id)a5 outDeltaData:(id)a6 weightsDeltaData:(id)a7 biasDeltaData:(id)a8 weightsMomentumData:(id)a9 biasMomentumData:(id)a10
{
  uint64_t v15;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;

  v15 = *(_QWORD *)&a3;
  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:betaDeltaData:gammaDeltaData:betaMomentumData:gammaMomentumData:", v15, v23, v22, v21, v20, v19, v18, v17, 0, 0, 0, 0);

  return v24;
}

- (MLCRNNCPUDeviceOps)initWithType:(int)a3 params:(id)a4 inDeltaData:(id)a5 outDeltaData:(id)a6 weightsDeltaData:(id)a7 biasDeltaData:(id)a8 weightsMomentumData:(id)a9 biasMomentumData:(id)a10 betaDeltaData:(id)a11 gammaDeltaData:(id)a12 betaMomentumData:(id)a13 gammaMomentumData:(id)a14
{
  MLCRNNCPUDeviceOps *v14;
  MLCRNNCPUDeviceOps *v15;
  NSData *lstmDeltaParams;
  NSData *trainingCache;
  NSMutableArray *combinedGateWeightsAndBias;
  NSMutableArray *combinedInputsBuffer;
  NSMutableArray *combinedOutputsBuffer;
  void *v21;
  uint64_t v22;
  NSMutableArray *weightAndBiasGateDeltaBuffers;
  uint64_t v24;
  NSMutableArray *auxBiasTermsAccumulators;
  uint64_t v26;
  NSMutableArray *auxBiasTerms;
  uint64_t v28;
  NSMutableArray *inputWeightsDeltaPointers;
  uint64_t v30;
  NSMutableArray *hiddenWeightsDeltaPointers;
  uint64_t v32;
  NSMutableArray *bnnsInputWeightsDeltaPointers;
  uint64_t v34;
  NSMutableArray *bnnsHiddenWeightsDeltaPointers;
  uint64_t v36;
  NSMutableArray *inputWeightsMomentumDescData;
  uint64_t v38;
  NSMutableArray *hiddenWeightsMomentumDescData;
  uint64_t v40;
  NSMutableArray *bnnsInputWeightsMomentumPointers;
  uint64_t v42;
  NSMutableArray *bnnsHiddenWeightsMomentumPointers;
  uint64_t v44;
  NSMutableArray *inputWeightsMomentumDataBytesArray;
  uint64_t v46;
  NSMutableArray *hiddenWeightsMomentumDataBytesArray;
  uint64_t v48;
  NSMutableArray *bnnsDesc2DInputWeightParams;
  uint64_t v50;
  NSMutableArray *bnnsDesc2DHiddenWeightParams;
  uint64_t v52;
  NSMutableArray *bnnsDesc2DInputWeightGrads;
  uint64_t v54;
  NSMutableArray *bnnsDesc2DHiddenWeightGrads;
  uint64_t v56;
  NSMutableArray *bnnsDesc2DInputWeightAccumulators;
  uint64_t v58;
  NSMutableArray *bnnsDesc2DHiddenWeightAccumulators;
  objc_super v61;

  v61.receiver = self;
  v61.super_class = (Class)MLCRNNCPUDeviceOps;
  v14 = -[MLCCPUDeviceOps initWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:betaDeltaData:gammaDeltaData:betaMomentumData:gammaMomentumData:](&v61, sel_initWithType_params_inDeltaData_outDeltaData_weightsDeltaData_biasDeltaData_weightsMomentumData_biasMomentumData_betaDeltaData_gammaDeltaData_betaMomentumData_gammaMomentumData_, *(_QWORD *)&a3, a4, a5, a6, a7, a8, a9, a10, 0, 0, 0, 0);
  v15 = v14;
  if (v14)
  {
    v14->_batchFirst = 0;
    v14->_hasPeephole = 0;
    v14->_returnsSequences = 1;
    v14->_biDirectional = 0;
    lstmDeltaParams = v14->_lstmDeltaParams;
    v14->_lstmDeltaParams = 0;

    trainingCache = v15->_trainingCache;
    v15->_trainingCache = 0;

    combinedGateWeightsAndBias = v15->_combinedGateWeightsAndBias;
    v15->_combinedGateWeightsAndBias = 0;

    combinedInputsBuffer = v15->_combinedInputsBuffer;
    v15->_combinedInputsBuffer = 0;

    combinedOutputsBuffer = v15->_combinedOutputsBuffer;
    v15->_combinedOutputsBuffer = 0;

    v15->_numLayers = 0;
    v15->_inputSize = 0;
    v15->_hiddenSize = 0;
    v15->_numAccumulatorsPerParameter = 0;
    v15->_numParametersForSingleLSTM = 0;
    v21 = (void *)MEMORY[0x1E0C9AA60];
    v22 = objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    weightAndBiasGateDeltaBuffers = v15->_weightAndBiasGateDeltaBuffers;
    v15->_weightAndBiasGateDeltaBuffers = (NSMutableArray *)v22;

    v24 = objc_msgSend(v21, "mutableCopy");
    auxBiasTermsAccumulators = v15->_auxBiasTermsAccumulators;
    v15->_auxBiasTermsAccumulators = (NSMutableArray *)v24;

    v26 = objc_msgSend(v21, "mutableCopy");
    auxBiasTerms = v15->_auxBiasTerms;
    v15->_auxBiasTerms = (NSMutableArray *)v26;

    v28 = objc_msgSend(v21, "mutableCopy");
    inputWeightsDeltaPointers = v15->_inputWeightsDeltaPointers;
    v15->_inputWeightsDeltaPointers = (NSMutableArray *)v28;

    v30 = objc_msgSend(v21, "mutableCopy");
    hiddenWeightsDeltaPointers = v15->_hiddenWeightsDeltaPointers;
    v15->_hiddenWeightsDeltaPointers = (NSMutableArray *)v30;

    v32 = objc_msgSend(v21, "mutableCopy");
    bnnsInputWeightsDeltaPointers = v15->_bnnsInputWeightsDeltaPointers;
    v15->_bnnsInputWeightsDeltaPointers = (NSMutableArray *)v32;

    v34 = objc_msgSend(v21, "mutableCopy");
    bnnsHiddenWeightsDeltaPointers = v15->_bnnsHiddenWeightsDeltaPointers;
    v15->_bnnsHiddenWeightsDeltaPointers = (NSMutableArray *)v34;

    v36 = objc_msgSend(v21, "mutableCopy");
    inputWeightsMomentumDescData = v15->_inputWeightsMomentumDescData;
    v15->_inputWeightsMomentumDescData = (NSMutableArray *)v36;

    v38 = objc_msgSend(v21, "mutableCopy");
    hiddenWeightsMomentumDescData = v15->_hiddenWeightsMomentumDescData;
    v15->_hiddenWeightsMomentumDescData = (NSMutableArray *)v38;

    v40 = objc_msgSend(v21, "mutableCopy");
    bnnsInputWeightsMomentumPointers = v15->_bnnsInputWeightsMomentumPointers;
    v15->_bnnsInputWeightsMomentumPointers = (NSMutableArray *)v40;

    v42 = objc_msgSend(v21, "mutableCopy");
    bnnsHiddenWeightsMomentumPointers = v15->_bnnsHiddenWeightsMomentumPointers;
    v15->_bnnsHiddenWeightsMomentumPointers = (NSMutableArray *)v42;

    v44 = objc_msgSend(v21, "mutableCopy");
    inputWeightsMomentumDataBytesArray = v15->_inputWeightsMomentumDataBytesArray;
    v15->_inputWeightsMomentumDataBytesArray = (NSMutableArray *)v44;

    v46 = objc_msgSend(v21, "mutableCopy");
    hiddenWeightsMomentumDataBytesArray = v15->_hiddenWeightsMomentumDataBytesArray;
    v15->_hiddenWeightsMomentumDataBytesArray = (NSMutableArray *)v46;

    v48 = objc_msgSend(v21, "mutableCopy");
    bnnsDesc2DInputWeightParams = v15->_bnnsDesc2DInputWeightParams;
    v15->_bnnsDesc2DInputWeightParams = (NSMutableArray *)v48;

    v50 = objc_msgSend(v21, "mutableCopy");
    bnnsDesc2DHiddenWeightParams = v15->_bnnsDesc2DHiddenWeightParams;
    v15->_bnnsDesc2DHiddenWeightParams = (NSMutableArray *)v50;

    v52 = objc_msgSend(v21, "mutableCopy");
    bnnsDesc2DInputWeightGrads = v15->_bnnsDesc2DInputWeightGrads;
    v15->_bnnsDesc2DInputWeightGrads = (NSMutableArray *)v52;

    v54 = objc_msgSend(v21, "mutableCopy");
    bnnsDesc2DHiddenWeightGrads = v15->_bnnsDesc2DHiddenWeightGrads;
    v15->_bnnsDesc2DHiddenWeightGrads = (NSMutableArray *)v54;

    v56 = objc_msgSend(v21, "mutableCopy");
    bnnsDesc2DInputWeightAccumulators = v15->_bnnsDesc2DInputWeightAccumulators;
    v15->_bnnsDesc2DInputWeightAccumulators = (NSMutableArray *)v56;

    v58 = objc_msgSend(v21, "mutableCopy");
    bnnsDesc2DHiddenWeightAccumulators = v15->_bnnsDesc2DHiddenWeightAccumulators;
    v15->_bnnsDesc2DHiddenWeightAccumulators = (NSMutableArray *)v58;

  }
  return v15;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  objc_super v12;

  -[MLCCPUDeviceOps weightsMomentumData](self, "weightsMomentumData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = 0;
    do
    {
      -[MLCCPUDeviceOps weightsMomentumData](self, "weightsMomentumData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v5);
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v8 = objc_msgSend(v7, "bytes");

      v9 = *(void **)(v8 + 136);
      if (v9)
        free(v9);
      ++v5;
      -[MLCCPUDeviceOps weightsMomentumData](self, "weightsMomentumData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

    }
    while (v5 < v11);
  }
  v12.receiver = self;
  v12.super_class = (Class)MLCRNNCPUDeviceOps;
  -[MLCCPUDeviceOps dealloc](&v12, sel_dealloc);
}

- (BOOL)batchFirst
{
  return self->_batchFirst;
}

- (void)setBatchFirst:(BOOL)a3
{
  self->_batchFirst = a3;
}

- (BOOL)hasPeephole
{
  return self->_hasPeephole;
}

- (void)setHasPeephole:(BOOL)a3
{
  self->_hasPeephole = a3;
}

- (BOOL)returnsSequences
{
  return self->_returnsSequences;
}

- (void)setReturnsSequences:(BOOL)a3
{
  self->_returnsSequences = a3;
}

- (BOOL)biDirectional
{
  return self->_biDirectional;
}

- (void)setBiDirectional:(BOOL)a3
{
  self->_biDirectional = a3;
}

- (NSData)lstmDeltaParams
{
  return self->_lstmDeltaParams;
}

- (void)setLstmDeltaParams:(id)a3
{
  objc_storeStrong((id *)&self->_lstmDeltaParams, a3);
}

- (NSMutableArray)weightAndBiasGateDeltaBuffers
{
  return self->_weightAndBiasGateDeltaBuffers;
}

- (void)setWeightAndBiasGateDeltaBuffers:(id)a3
{
  objc_storeStrong((id *)&self->_weightAndBiasGateDeltaBuffers, a3);
}

- (NSMutableArray)inputWeightsDeltaPointers
{
  return self->_inputWeightsDeltaPointers;
}

- (void)setInputWeightsDeltaPointers:(id)a3
{
  objc_storeStrong((id *)&self->_inputWeightsDeltaPointers, a3);
}

- (NSMutableArray)hiddenWeightsDeltaPointers
{
  return self->_hiddenWeightsDeltaPointers;
}

- (void)setHiddenWeightsDeltaPointers:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenWeightsDeltaPointers, a3);
}

- (NSMutableArray)bnnsInputWeightsDeltaPointers
{
  return self->_bnnsInputWeightsDeltaPointers;
}

- (void)setBnnsInputWeightsDeltaPointers:(id)a3
{
  objc_storeStrong((id *)&self->_bnnsInputWeightsDeltaPointers, a3);
}

- (NSMutableArray)bnnsHiddenWeightsDeltaPointers
{
  return self->_bnnsHiddenWeightsDeltaPointers;
}

- (void)setBnnsHiddenWeightsDeltaPointers:(id)a3
{
  objc_storeStrong((id *)&self->_bnnsHiddenWeightsDeltaPointers, a3);
}

- (NSMutableArray)inputWeightsMomentumDescData
{
  return self->_inputWeightsMomentumDescData;
}

- (void)setInputWeightsMomentumDescData:(id)a3
{
  objc_storeStrong((id *)&self->_inputWeightsMomentumDescData, a3);
}

- (NSMutableArray)hiddenWeightsMomentumDescData
{
  return self->_hiddenWeightsMomentumDescData;
}

- (void)setHiddenWeightsMomentumDescData:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenWeightsMomentumDescData, a3);
}

- (NSMutableArray)inputWeightsMomentumDescDataPointer
{
  return self->_inputWeightsMomentumDescDataPointer;
}

- (void)setInputWeightsMomentumDescDataPointer:(id)a3
{
  objc_storeStrong((id *)&self->_inputWeightsMomentumDescDataPointer, a3);
}

- (NSMutableArray)hiddenWeightsMomentumDescDataPointer
{
  return self->_hiddenWeightsMomentumDescDataPointer;
}

- (void)setHiddenWeightsMomentumDescDataPointer:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenWeightsMomentumDescDataPointer, a3);
}

- (NSMutableArray)bnnsInputWeightsMomentumPointers
{
  return self->_bnnsInputWeightsMomentumPointers;
}

- (void)setBnnsInputWeightsMomentumPointers:(id)a3
{
  objc_storeStrong((id *)&self->_bnnsInputWeightsMomentumPointers, a3);
}

- (NSMutableArray)bnnsHiddenWeightsMomentumPointers
{
  return self->_bnnsHiddenWeightsMomentumPointers;
}

- (void)setBnnsHiddenWeightsMomentumPointers:(id)a3
{
  objc_storeStrong((id *)&self->_bnnsHiddenWeightsMomentumPointers, a3);
}

- (NSMutableArray)bnnsDesc2DInputWeightParams
{
  return self->_bnnsDesc2DInputWeightParams;
}

- (void)setBnnsDesc2DInputWeightParams:(id)a3
{
  objc_storeStrong((id *)&self->_bnnsDesc2DInputWeightParams, a3);
}

- (NSMutableArray)bnnsDesc2DHiddenWeightParams
{
  return self->_bnnsDesc2DHiddenWeightParams;
}

- (void)setBnnsDesc2DHiddenWeightParams:(id)a3
{
  objc_storeStrong((id *)&self->_bnnsDesc2DHiddenWeightParams, a3);
}

- (NSMutableArray)bnnsDesc2DInputWeightGrads
{
  return self->_bnnsDesc2DInputWeightGrads;
}

- (void)setBnnsDesc2DInputWeightGrads:(id)a3
{
  objc_storeStrong((id *)&self->_bnnsDesc2DInputWeightGrads, a3);
}

- (NSMutableArray)bnnsDesc2DHiddenWeightGrads
{
  return self->_bnnsDesc2DHiddenWeightGrads;
}

- (void)setBnnsDesc2DHiddenWeightGrads:(id)a3
{
  objc_storeStrong((id *)&self->_bnnsDesc2DHiddenWeightGrads, a3);
}

- (NSMutableArray)bnnsDesc2DInputWeightAccumulators
{
  return self->_bnnsDesc2DInputWeightAccumulators;
}

- (void)setBnnsDesc2DInputWeightAccumulators:(id)a3
{
  objc_storeStrong((id *)&self->_bnnsDesc2DInputWeightAccumulators, a3);
}

- (NSMutableArray)bnnsDesc2DHiddenWeightAccumulators
{
  return self->_bnnsDesc2DHiddenWeightAccumulators;
}

- (void)setBnnsDesc2DHiddenWeightAccumulators:(id)a3
{
  objc_storeStrong((id *)&self->_bnnsDesc2DHiddenWeightAccumulators, a3);
}

- (NSMutableArray)inputWeightsMomentumDataBytesArray
{
  return self->_inputWeightsMomentumDataBytesArray;
}

- (void)setInputWeightsMomentumDataBytesArray:(id)a3
{
  objc_storeStrong((id *)&self->_inputWeightsMomentumDataBytesArray, a3);
}

- (NSMutableArray)hiddenWeightsMomentumDataBytesArray
{
  return self->_hiddenWeightsMomentumDataBytesArray;
}

- (void)setHiddenWeightsMomentumDataBytesArray:(id)a3
{
  objc_storeStrong((id *)&self->_hiddenWeightsMomentumDataBytesArray, a3);
}

- (NSData)trainingCache
{
  return self->_trainingCache;
}

- (void)setTrainingCache:(id)a3
{
  objc_storeStrong((id *)&self->_trainingCache, a3);
}

- (NSMutableArray)combinedGateWeightsAndBias
{
  return self->_combinedGateWeightsAndBias;
}

- (void)setCombinedGateWeightsAndBias:(id)a3
{
  objc_storeStrong((id *)&self->_combinedGateWeightsAndBias, a3);
}

- (NSMutableArray)auxBiasTerms
{
  return self->_auxBiasTerms;
}

- (void)setAuxBiasTerms:(id)a3
{
  objc_storeStrong((id *)&self->_auxBiasTerms, a3);
}

- (NSMutableArray)auxBiasTermsAccumulators
{
  return self->_auxBiasTermsAccumulators;
}

- (void)setAuxBiasTermsAccumulators:(id)a3
{
  objc_storeStrong((id *)&self->_auxBiasTermsAccumulators, a3);
}

- (NSMutableArray)parameterPointers
{
  return self->_parameterPointers;
}

- (void)setParameterPointers:(id)a3
{
  objc_storeStrong((id *)&self->_parameterPointers, a3);
}

- (NSMutableArray)combinedInputsBuffer
{
  return self->_combinedInputsBuffer;
}

- (void)setCombinedInputsBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_combinedInputsBuffer, a3);
}

- (NSMutableArray)combinedOutputsBuffer
{
  return self->_combinedOutputsBuffer;
}

- (void)setCombinedOutputsBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_combinedOutputsBuffer, a3);
}

- (unint64_t)numLayers
{
  return self->_numLayers;
}

- (void)setNumLayers:(unint64_t)a3
{
  self->_numLayers = a3;
}

- (unint64_t)inputSize
{
  return self->_inputSize;
}

- (void)setInputSize:(unint64_t)a3
{
  self->_inputSize = a3;
}

- (unint64_t)hiddenSize
{
  return self->_hiddenSize;
}

- (void)setHiddenSize:(unint64_t)a3
{
  self->_hiddenSize = a3;
}

- (unint64_t)numAccumulatorsPerParameter
{
  return self->_numAccumulatorsPerParameter;
}

- (void)setNumAccumulatorsPerParameter:(unint64_t)a3
{
  self->_numAccumulatorsPerParameter = a3;
}

- (unint64_t)numParametersForSingleLSTM
{
  return self->_numParametersForSingleLSTM;
}

- (void)setNumParametersForSingleLSTM:(unint64_t)a3
{
  self->_numParametersForSingleLSTM = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedOutputsBuffer, 0);
  objc_storeStrong((id *)&self->_combinedInputsBuffer, 0);
  objc_storeStrong((id *)&self->_parameterPointers, 0);
  objc_storeStrong((id *)&self->_auxBiasTermsAccumulators, 0);
  objc_storeStrong((id *)&self->_auxBiasTerms, 0);
  objc_storeStrong((id *)&self->_combinedGateWeightsAndBias, 0);
  objc_storeStrong((id *)&self->_trainingCache, 0);
  objc_storeStrong((id *)&self->_hiddenWeightsMomentumDataBytesArray, 0);
  objc_storeStrong((id *)&self->_inputWeightsMomentumDataBytesArray, 0);
  objc_storeStrong((id *)&self->_bnnsDesc2DHiddenWeightAccumulators, 0);
  objc_storeStrong((id *)&self->_bnnsDesc2DInputWeightAccumulators, 0);
  objc_storeStrong((id *)&self->_bnnsDesc2DHiddenWeightGrads, 0);
  objc_storeStrong((id *)&self->_bnnsDesc2DInputWeightGrads, 0);
  objc_storeStrong((id *)&self->_bnnsDesc2DHiddenWeightParams, 0);
  objc_storeStrong((id *)&self->_bnnsDesc2DInputWeightParams, 0);
  objc_storeStrong((id *)&self->_bnnsHiddenWeightsMomentumPointers, 0);
  objc_storeStrong((id *)&self->_bnnsInputWeightsMomentumPointers, 0);
  objc_storeStrong((id *)&self->_hiddenWeightsMomentumDescDataPointer, 0);
  objc_storeStrong((id *)&self->_inputWeightsMomentumDescDataPointer, 0);
  objc_storeStrong((id *)&self->_hiddenWeightsMomentumDescData, 0);
  objc_storeStrong((id *)&self->_inputWeightsMomentumDescData, 0);
  objc_storeStrong((id *)&self->_bnnsHiddenWeightsDeltaPointers, 0);
  objc_storeStrong((id *)&self->_bnnsInputWeightsDeltaPointers, 0);
  objc_storeStrong((id *)&self->_hiddenWeightsDeltaPointers, 0);
  objc_storeStrong((id *)&self->_inputWeightsDeltaPointers, 0);
  objc_storeStrong((id *)&self->_weightAndBiasGateDeltaBuffers, 0);
  objc_storeStrong((id *)&self->_lstmDeltaParams, 0);
}

@end
