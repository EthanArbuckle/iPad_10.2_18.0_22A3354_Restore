@implementation ADEspressoJasperColorInferenceDescriptor

- (ADEspressoJasperColorInferenceDescriptor)initWithNetworkProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ADEspressoJasperColorInferenceDescriptor *v7;
  uint64_t v8;
  ADEspressoImageDescriptor *colorInput;
  uint64_t v10;
  ADEspressoImageDescriptor *jasperInput;
  uint64_t v12;
  ADEspressoImageDescriptor *depthOutput;
  uint64_t v14;
  ADEspressoImageDescriptor *confidenceOutput;
  uint64_t v16;
  ADEspressoImageDescriptor *alphaMapOutput;
  uint64_t v18;
  ADEspressoImageDescriptor *normalsOutput;
  objc_super v21;

  v4 = a3;
  objc_msgSend(v4, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutNamesDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)ADEspressoJasperColorInferenceDescriptor;
  v7 = -[ADEspressoInferenceDescriptor initWithUrl:layoutNames:](&v21, sel_initWithUrl_layoutNames_, v5, v6);

  if (v7)
  {
    objc_msgSend(v4, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDColor, 1, 1111970369);
    v8 = objc_claimAutoreleasedReturnValue();
    colorInput = v7->_colorInput;
    v7->_colorInput = (ADEspressoImageDescriptor *)v8;

    objc_msgSend(v4, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDJasper, 1, 1717855600);
    v10 = objc_claimAutoreleasedReturnValue();
    jasperInput = v7->_jasperInput;
    v7->_jasperInput = (ADEspressoImageDescriptor *)v10;

    objc_msgSend(v4, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDDepth, 0, 1717855600);
    v12 = objc_claimAutoreleasedReturnValue();
    depthOutput = v7->_depthOutput;
    v7->_depthOutput = (ADEspressoImageDescriptor *)v12;

    objc_msgSend(v4, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDConfidence[0], 0, 1278226534);
    v14 = objc_claimAutoreleasedReturnValue();
    confidenceOutput = v7->_confidenceOutput;
    v7->_confidenceOutput = (ADEspressoImageDescriptor *)v14;

    objc_msgSend(v4, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDAlphaMap, 0, 1278226534);
    v16 = objc_claimAutoreleasedReturnValue();
    alphaMapOutput = v7->_alphaMapOutput;
    v7->_alphaMapOutput = (ADEspressoImageDescriptor *)v16;

    objc_msgSend(v4, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDNormals, 0, 1380410945);
    v18 = objc_claimAutoreleasedReturnValue();
    normalsOutput = v7->_normalsOutput;
    v7->_normalsOutput = (ADEspressoImageDescriptor *)v18;

  }
  return v7;
}

- (ADEspressoImageDescriptor)colorInput
{
  return self->_colorInput;
}

- (ADEspressoImageDescriptor)jasperInput
{
  return self->_jasperInput;
}

- (ADEspressoImageDescriptor)depthOutput
{
  return self->_depthOutput;
}

- (ADEspressoImageDescriptor)confidenceOutput
{
  return self->_confidenceOutput;
}

- (ADEspressoImageDescriptor)alphaMapOutput
{
  return self->_alphaMapOutput;
}

- (ADEspressoImageDescriptor)normalsOutput
{
  return self->_normalsOutput;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalsOutput, 0);
  objc_storeStrong((id *)&self->_alphaMapOutput, 0);
  objc_storeStrong((id *)&self->_confidenceOutput, 0);
  objc_storeStrong((id *)&self->_depthOutput, 0);
  objc_storeStrong((id *)&self->_jasperInput, 0);
  objc_storeStrong((id *)&self->_colorInput, 0);
}

@end
