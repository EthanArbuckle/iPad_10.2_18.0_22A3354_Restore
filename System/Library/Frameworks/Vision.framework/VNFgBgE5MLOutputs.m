@implementation VNFgBgE5MLOutputs

- (VNFgBgE5MLOutputs)initWithOutputs:(id)a3 descriptor:(id)a4
{
  id v6;
  id v7;
  VNFgBgE5MLOutputs *v8;
  uint64_t v9;
  id v10;
  MLMultiArray *segments;
  uint64_t v12;
  id v13;
  MLMultiArray *decodeMatch;
  uint64_t v15;
  id v16;
  MLMultiArray *predictionCocoConfidence;
  uint64_t v18;
  id v19;
  MLMultiArray *predictionMiyoshiConfidence;
  uint64_t v21;
  id v22;
  MLMultiArray *predictionIoU;
  uint64_t v24;
  id v25;
  MLMultiArray *stabilityScore;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  objc_super v34;

  v6 = a3;
  v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)VNFgBgE5MLOutputs;
  v8 = -[VNFgBgE5MLOutputs init](&v34, sel_init);
  if (v8)
  {
    v33 = 0;
    +[VNFgBgE5MLProcess multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:](VNFgBgE5MLProcess, "multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:", CFSTR("pred_masks"), v6, v7, &v33);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v33;
    segments = v8->_segments;
    v8->_segments = (MLMultiArray *)v9;

    v32 = v10;
    +[VNFgBgE5MLProcess multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:](VNFgBgE5MLProcess, "multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:", CFSTR("decode_match"), v6, v7, &v32);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v32;

    decodeMatch = v8->_decodeMatch;
    v8->_decodeMatch = (MLMultiArray *)v12;

    v31 = v13;
    +[VNFgBgE5MLProcess multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:](VNFgBgE5MLProcess, "multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:", CFSTR("pred_coco_confidences"), v6, v7, &v31);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v31;

    predictionCocoConfidence = v8->_predictionCocoConfidence;
    v8->_predictionCocoConfidence = (MLMultiArray *)v15;

    v30 = v16;
    +[VNFgBgE5MLProcess multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:](VNFgBgE5MLProcess, "multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:", CFSTR("pred_miyoshi_confidences"), v6, v7, &v30);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v30;

    predictionMiyoshiConfidence = v8->_predictionMiyoshiConfidence;
    v8->_predictionMiyoshiConfidence = (MLMultiArray *)v18;

    v29 = v19;
    +[VNFgBgE5MLProcess multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:](VNFgBgE5MLProcess, "multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:", CFSTR("pred_iou"), v6, v7, &v29);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v29;

    predictionIoU = v8->_predictionIoU;
    v8->_predictionIoU = (MLMultiArray *)v21;

    v28 = v22;
    +[VNFgBgE5MLProcess multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:](VNFgBgE5MLProcess, "multiArrayForOutput:inNamedObjects:fromFunctionDescriptor:error:", CFSTR("stability_score"), v6, v7, &v28);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v28;

    stabilityScore = v8->_stabilityScore;
    v8->_stabilityScore = (MLMultiArray *)v24;

  }
  return v8;
}

- (MLMultiArray)segments
{
  return (MLMultiArray *)objc_getProperty(self, a2, 8, 1);
}

- (MLMultiArray)decodeMatch
{
  return (MLMultiArray *)objc_getProperty(self, a2, 16, 1);
}

- (MLMultiArray)predictionCocoConfidence
{
  return (MLMultiArray *)objc_getProperty(self, a2, 24, 1);
}

- (MLMultiArray)predictionMiyoshiConfidence
{
  return (MLMultiArray *)objc_getProperty(self, a2, 32, 1);
}

- (MLMultiArray)predictionIoU
{
  return (MLMultiArray *)objc_getProperty(self, a2, 40, 1);
}

- (MLMultiArray)stabilityScore
{
  return (MLMultiArray *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stabilityScore, 0);
  objc_storeStrong((id *)&self->_predictionIoU, 0);
  objc_storeStrong((id *)&self->_predictionMiyoshiConfidence, 0);
  objc_storeStrong((id *)&self->_predictionCocoConfidence, 0);
  objc_storeStrong((id *)&self->_decodeMatch, 0);
  objc_storeStrong((id *)&self->_segments, 0);
}

@end
