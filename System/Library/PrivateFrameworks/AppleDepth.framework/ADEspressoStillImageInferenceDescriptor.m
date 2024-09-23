@implementation ADEspressoStillImageInferenceDescriptor

- (ADEspressoStillImageInferenceDescriptor)initWithNetworkProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ADEspressoStillImageInferenceDescriptor *v7;
  uint64_t v8;
  ADEspressoImageDescriptor *colorInput;
  uint64_t v10;
  ADEspressoImageDescriptor *jasperInput;
  uint64_t v12;
  ADEspressoImageDescriptor *v13;
  uint64_t v14;
  ADEspressoImageDescriptor *depthOutput;
  uint64_t v16;
  ADEspressoImageDescriptor *v17;
  objc_super v19;

  v4 = a3;
  objc_msgSend(v4, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutNamesDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)ADEspressoStillImageInferenceDescriptor;
  v7 = -[ADEspressoInferenceDescriptor initWithUrl:layoutNames:](&v19, sel_initWithUrl_layoutNames_, v5, v6);

  if (v7)
  {
    objc_msgSend(v4, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDColor, 1, 1111970369);
    v8 = objc_claimAutoreleasedReturnValue();
    colorInput = v7->_colorInput;
    v7->_colorInput = (ADEspressoImageDescriptor *)v8;

    objc_msgSend(v4, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDDisparity, 1, 1717856627);
    v10 = objc_claimAutoreleasedReturnValue();
    jasperInput = v7->_jasperInput;
    v7->_jasperInput = (ADEspressoImageDescriptor *)v10;

    if (!v7->_jasperInput)
    {
      objc_msgSend(v4, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDJasper, 1, 1717855600);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v7->_jasperInput;
      v7->_jasperInput = (ADEspressoImageDescriptor *)v12;

    }
    objc_msgSend(v4, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDDisparity, 0, 1717856627);
    v14 = objc_claimAutoreleasedReturnValue();
    depthOutput = v7->_depthOutput;
    v7->_depthOutput = (ADEspressoImageDescriptor *)v14;

    if (!v7->_depthOutput)
    {
      objc_msgSend(v4, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDDepth, 0, 1717855600);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v7->_depthOutput;
      v7->_depthOutput = (ADEspressoImageDescriptor *)v16;

    }
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_depthOutput, 0);
  objc_storeStrong((id *)&self->_jasperInput, 0);
  objc_storeStrong((id *)&self->_colorInput, 0);
}

@end
