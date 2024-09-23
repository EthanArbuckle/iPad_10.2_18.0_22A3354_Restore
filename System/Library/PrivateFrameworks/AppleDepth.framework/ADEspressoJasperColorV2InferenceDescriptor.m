@implementation ADEspressoJasperColorV2InferenceDescriptor

- (ADEspressoJasperColorV2InferenceDescriptor)initWithNetworkProvider:(id)a3 espressoEngine:(unint64_t)a4 lidarType:(unint64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  ADEspressoJasperColorV2InferenceDescriptor *v14;
  uint64_t v15;
  ADEspressoImageDescriptor *colorInput;
  uint64_t v17;
  ADEspressoImageDescriptor *prevColorInput;
  uint64_t v19;
  uint64_t v20;
  ADEspressoImageDescriptor *v21;
  ADEspressoImageDescriptor *prevDepthInput;
  uint64_t v23;
  ADEspressoImageDescriptor *jasperInput;
  uint64_t v25;
  ADEspressoImageDescriptor *prevUncertaintyInput;
  uint64_t v27;
  ADEspressoImageDescriptor *depthOutput;
  uint64_t v29;
  ADEspressoImageDescriptor *uncertaintyOutput;
  uint64_t v31;
  ADEspressoImageDescriptor *depthFeaturesOutput;
  uint64_t v33;
  ADEspressoImageDescriptor *colorFeaturesOutput;
  objc_super v36;

  v8 = a3;
  v9 = v8;
  if (a4 - 3 >= 2)
    v10 = 1717855600;
  else
    v10 = 1751410032;
  if (a4 - 3 >= 2)
    v11 = 1278226534;
  else
    v11 = 1278226536;
  objc_msgSend(v8, "url");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutNamesDict");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v36.receiver = self;
  v36.super_class = (Class)ADEspressoJasperColorV2InferenceDescriptor;
  v14 = -[ADEspressoInferenceDescriptor initWithUrl:layoutNames:](&v36, sel_initWithUrl_layoutNames_, v12, v13);

  if (v14)
  {
    objc_msgSend(v9, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDColor, 1, 1111970369);
    v15 = objc_claimAutoreleasedReturnValue();
    colorInput = v14->_colorInput;
    v14->_colorInput = (ADEspressoImageDescriptor *)v15;

    if (a5 == 1)
    {
      objc_msgSend(v9, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDPrevColor, 1, 1111970369);
      v17 = objc_claimAutoreleasedReturnValue();
      prevColorInput = v14->_prevColorInput;
      v14->_prevColorInput = (ADEspressoImageDescriptor *)v17;

      objc_msgSend(v9, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDPrevDepth, 1, v10);
    }
    else
    {
      objc_msgSend(v9, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDOpaqueFeatures, 1, v11);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v14->_prevColorInput;
      v14->_prevColorInput = (ADEspressoImageDescriptor *)v20;

      objc_msgSend(v9, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDOpaqueDepthFeatures, 1, v11);
    }
    v19 = objc_claimAutoreleasedReturnValue();
    prevDepthInput = v14->_prevDepthInput;
    v14->_prevDepthInput = (ADEspressoImageDescriptor *)v19;

    objc_msgSend(v9, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDJasper, 1, v10);
    v23 = objc_claimAutoreleasedReturnValue();
    jasperInput = v14->_jasperInput;
    v14->_jasperInput = (ADEspressoImageDescriptor *)v23;

    objc_msgSend(v9, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDPrevConfidence, 1, v11);
    v25 = objc_claimAutoreleasedReturnValue();
    prevUncertaintyInput = v14->_prevUncertaintyInput;
    v14->_prevUncertaintyInput = (ADEspressoImageDescriptor *)v25;

    objc_msgSend(v9, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDDepth, 0, v10);
    v27 = objc_claimAutoreleasedReturnValue();
    depthOutput = v14->_depthOutput;
    v14->_depthOutput = (ADEspressoImageDescriptor *)v27;

    objc_msgSend(v9, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDConfidence[0], 0, v11);
    v29 = objc_claimAutoreleasedReturnValue();
    uncertaintyOutput = v14->_uncertaintyOutput;
    v14->_uncertaintyOutput = (ADEspressoImageDescriptor *)v29;

    objc_msgSend(v9, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDOpaqueDepthFeatures, 0, v11);
    v31 = objc_claimAutoreleasedReturnValue();
    depthFeaturesOutput = v14->_depthFeaturesOutput;
    v14->_depthFeaturesOutput = (ADEspressoImageDescriptor *)v31;

    objc_msgSend(v9, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDOpaqueFeatures, 0, v11);
    v33 = objc_claimAutoreleasedReturnValue();
    colorFeaturesOutput = v14->_colorFeaturesOutput;
    v14->_colorFeaturesOutput = (ADEspressoImageDescriptor *)v33;

  }
  return v14;
}

- (ADEspressoImageDescriptor)colorInput
{
  return self->_colorInput;
}

- (ADEspressoImageDescriptor)jasperInput
{
  return self->_jasperInput;
}

- (ADEspressoImageDescriptor)prevDepthInput
{
  return self->_prevDepthInput;
}

- (ADEspressoImageDescriptor)prevColorInput
{
  return self->_prevColorInput;
}

- (ADEspressoImageDescriptor)prevUncertaintyInput
{
  return self->_prevUncertaintyInput;
}

- (ADEspressoImageDescriptor)depthOutput
{
  return self->_depthOutput;
}

- (ADEspressoImageDescriptor)uncertaintyOutput
{
  return self->_uncertaintyOutput;
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
  objc_storeStrong((id *)&self->_uncertaintyOutput, 0);
  objc_storeStrong((id *)&self->_depthOutput, 0);
  objc_storeStrong((id *)&self->_prevUncertaintyInput, 0);
  objc_storeStrong((id *)&self->_prevColorInput, 0);
  objc_storeStrong((id *)&self->_prevDepthInput, 0);
  objc_storeStrong((id *)&self->_jasperInput, 0);
  objc_storeStrong((id *)&self->_colorInput, 0);
}

@end
