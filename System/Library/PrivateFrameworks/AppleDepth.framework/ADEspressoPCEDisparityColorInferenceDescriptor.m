@implementation ADEspressoPCEDisparityColorInferenceDescriptor

- (ADEspressoPCEDisparityColorInferenceDescriptor)initWithNetworkProvider:(id)a3 inputColorFormat:(unsigned int)a4 disparityFormat:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  ADEspressoPCEDisparityColorInferenceDescriptor *v11;
  uint64_t v12;
  uint64_t v13;
  ADEspressoImageDescriptor *colorInput;
  uint64_t v15;
  ADEspressoImageDescriptor *disparityInput;
  uint64_t v17;
  ADEspressoImageDescriptor *prevDisparityInput;
  uint64_t v19;
  ADEspressoImageDescriptor *prevFeaturesInput;
  uint64_t v21;
  ADEspressoImageDescriptor *disparityOutput;
  uint64_t v23;
  ADEspressoImageDescriptor *featuresOutput;
  objc_super v26;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v8 = a3;
  objc_msgSend(v8, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutNamesDict");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26.receiver = self;
  v26.super_class = (Class)ADEspressoPCEDisparityColorInferenceDescriptor;
  v11 = -[ADEspressoInferenceDescriptor initWithUrl:layoutNames:](&v26, sel_initWithUrl_layoutNames_, v9, v10);

  if (v11)
  {
    if ((_DWORD)v5 == 1751411059)
      v12 = 1278226536;
    else
      v12 = 1278226534;
    objc_msgSend(v8, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDColor, 1, v6);
    v13 = objc_claimAutoreleasedReturnValue();
    colorInput = v11->_colorInput;
    v11->_colorInput = (ADEspressoImageDescriptor *)v13;

    objc_msgSend(v8, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDDisparity, 1, v5);
    v15 = objc_claimAutoreleasedReturnValue();
    disparityInput = v11->_disparityInput;
    v11->_disparityInput = (ADEspressoImageDescriptor *)v15;

    objc_msgSend(v8, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDPrevDisparity, 1, v5);
    v17 = objc_claimAutoreleasedReturnValue();
    prevDisparityInput = v11->_prevDisparityInput;
    v11->_prevDisparityInput = (ADEspressoImageDescriptor *)v17;

    objc_msgSend(v8, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDInputOpaqueFeatures, 1, v12);
    v19 = objc_claimAutoreleasedReturnValue();
    prevFeaturesInput = v11->_prevFeaturesInput;
    v11->_prevFeaturesInput = (ADEspressoImageDescriptor *)v19;

    objc_msgSend(v8, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDDisparity, 0, v5);
    v21 = objc_claimAutoreleasedReturnValue();
    disparityOutput = v11->_disparityOutput;
    v11->_disparityOutput = (ADEspressoImageDescriptor *)v21;

    objc_msgSend(v8, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDOutputOpaqueFeatures, 0, v12);
    v23 = objc_claimAutoreleasedReturnValue();
    featuresOutput = v11->_featuresOutput;
    v11->_featuresOutput = (ADEspressoImageDescriptor *)v23;

  }
  return v11;
}

- (ADEspressoImageDescriptor)featuresOutput
{
  return self->_featuresOutput;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuresOutput, 0);
  objc_storeStrong((id *)&self->_disparityOutput, 0);
  objc_storeStrong((id *)&self->_prevFeaturesInput, 0);
  objc_storeStrong((id *)&self->_prevDisparityInput, 0);
  objc_storeStrong((id *)&self->_disparityInput, 0);
  objc_storeStrong((id *)&self->_colorInput, 0);
}

- (ADEspressoImageDescriptor)disparityInput
{
  return self->_disparityInput;
}

- (ADEspressoImageDescriptor)colorInput
{
  return self->_colorInput;
}

- (ADEspressoImageDescriptor)prevDisparityInput
{
  return self->_prevDisparityInput;
}

- (ADEspressoImageDescriptor)disparityOutput
{
  return self->_disparityOutput;
}

- (ADEspressoImageDescriptor)prevFeaturesInput
{
  return self->_prevFeaturesInput;
}

@end
