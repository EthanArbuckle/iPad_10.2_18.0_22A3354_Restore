@implementation ADEspressoStereoV2InferenceDescriptor

- (ADEspressoStereoV2InferenceDescriptor)initWithNetworkProvider:(id)a3 inputColorFormat:(unsigned int)a4 outputDisparityFormat:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  ADEspressoStereoV2InferenceDescriptor *v13;
  uint64_t v14;
  ADEspressoImageDescriptor *referenceInput;
  uint64_t v16;
  ADEspressoImageDescriptor *auxiliaryInput;
  uint64_t v18;
  ADEspressoImageDescriptor *prevDepthFeaturesInput;
  uint64_t v20;
  ADEspressoImageDescriptor *prevColorFeaturesInput;
  uint64_t v22;
  ADEspressoImageDescriptor *temporalSmoothingCurrentFeaturesRatioMinInput;
  uint64_t v24;
  ADEspressoImageDescriptor *temporalSmoothingPreviousFeaturesRatioMinInput;
  uint64_t v26;
  ADEspressoImageDescriptor *disparityOutput;
  uint64_t v28;
  ADEspressoImageDescriptor *depthFeaturesOutput;
  uint64_t v30;
  ADEspressoImageDescriptor *colorFeaturesOutput;
  objc_super v33;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = v8;
  if ((_DWORD)v5 == 1751411059)
    v10 = 1278226536;
  else
    v10 = 1278226534;
  objc_msgSend(v8, "url");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutNamesDict");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33.receiver = self;
  v33.super_class = (Class)ADEspressoStereoV2InferenceDescriptor;
  v13 = -[ADEspressoInferenceDescriptor initWithUrl:layoutNames:](&v33, sel_initWithUrl_layoutNames_, v11, v12);

  if (v13)
  {
    objc_msgSend(v9, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDRefColor, 1, v6);
    v14 = objc_claimAutoreleasedReturnValue();
    referenceInput = v13->_referenceInput;
    v13->_referenceInput = (ADEspressoImageDescriptor *)v14;

    objc_msgSend(v9, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDAuxColor, 1, v6);
    v16 = objc_claimAutoreleasedReturnValue();
    auxiliaryInput = v13->_auxiliaryInput;
    v13->_auxiliaryInput = (ADEspressoImageDescriptor *)v16;

    objc_msgSend(v9, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDOpaqueDepthFeatures, 1, v10);
    v18 = objc_claimAutoreleasedReturnValue();
    prevDepthFeaturesInput = v13->_prevDepthFeaturesInput;
    v13->_prevDepthFeaturesInput = (ADEspressoImageDescriptor *)v18;

    objc_msgSend(v9, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDOpaqueFeatures, 1, v10);
    v20 = objc_claimAutoreleasedReturnValue();
    prevColorFeaturesInput = v13->_prevColorFeaturesInput;
    v13->_prevColorFeaturesInput = (ADEspressoImageDescriptor *)v20;

    objc_msgSend(v9, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDTemporalSmoothingCurrentFeaturesRatioMin, 1, v10);
    v22 = objc_claimAutoreleasedReturnValue();
    temporalSmoothingCurrentFeaturesRatioMinInput = v13->_temporalSmoothingCurrentFeaturesRatioMinInput;
    v13->_temporalSmoothingCurrentFeaturesRatioMinInput = (ADEspressoImageDescriptor *)v22;

    objc_msgSend(v9, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDTemporalSmoothingPreviousFeaturesRatioMin, 1, v10);
    v24 = objc_claimAutoreleasedReturnValue();
    temporalSmoothingPreviousFeaturesRatioMinInput = v13->_temporalSmoothingPreviousFeaturesRatioMinInput;
    v13->_temporalSmoothingPreviousFeaturesRatioMinInput = (ADEspressoImageDescriptor *)v24;

    objc_msgSend(v9, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDDisparity, 0, v5);
    v26 = objc_claimAutoreleasedReturnValue();
    disparityOutput = v13->_disparityOutput;
    v13->_disparityOutput = (ADEspressoImageDescriptor *)v26;

    objc_msgSend(v9, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDOpaqueDepthFeatures, 0, v10);
    v28 = objc_claimAutoreleasedReturnValue();
    depthFeaturesOutput = v13->_depthFeaturesOutput;
    v13->_depthFeaturesOutput = (ADEspressoImageDescriptor *)v28;

    objc_msgSend(v9, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDOpaqueFeatures, 0, v10);
    v30 = objc_claimAutoreleasedReturnValue();
    colorFeaturesOutput = v13->_colorFeaturesOutput;
    v13->_colorFeaturesOutput = (ADEspressoImageDescriptor *)v30;

  }
  return v13;
}

- (ADEspressoImageDescriptor)referenceInput
{
  return self->_referenceInput;
}

- (ADEspressoImageDescriptor)auxiliaryInput
{
  return self->_auxiliaryInput;
}

- (ADEspressoImageDescriptor)prevDepthFeaturesInput
{
  return self->_prevDepthFeaturesInput;
}

- (ADEspressoImageDescriptor)prevColorFeaturesInput
{
  return self->_prevColorFeaturesInput;
}

- (ADEspressoImageDescriptor)temporalSmoothingCurrentFeaturesRatioMinInput
{
  return self->_temporalSmoothingCurrentFeaturesRatioMinInput;
}

- (ADEspressoImageDescriptor)temporalSmoothingPreviousFeaturesRatioMinInput
{
  return self->_temporalSmoothingPreviousFeaturesRatioMinInput;
}

- (ADEspressoImageDescriptor)disparityOutput
{
  return self->_disparityOutput;
}

- (ADEspressoImageDescriptor)depthFeaturesOutput
{
  return self->_depthFeaturesOutput;
}

- (ADEspressoImageDescriptor)colorFeaturesOutput
{
  return self->_colorFeaturesOutput;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorFeaturesOutput, 0);
  objc_storeStrong((id *)&self->_depthFeaturesOutput, 0);
  objc_storeStrong((id *)&self->_disparityOutput, 0);
  objc_storeStrong((id *)&self->_temporalSmoothingPreviousFeaturesRatioMinInput, 0);
  objc_storeStrong((id *)&self->_temporalSmoothingCurrentFeaturesRatioMinInput, 0);
  objc_storeStrong((id *)&self->_prevColorFeaturesInput, 0);
  objc_storeStrong((id *)&self->_prevDepthFeaturesInput, 0);
  objc_storeStrong((id *)&self->_auxiliaryInput, 0);
  objc_storeStrong((id *)&self->_referenceInput, 0);
}

@end
