@implementation ADEspressoMonocularInferenceDescriptor

- (ADEspressoMonocularInferenceDescriptor)initWithNetworkProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ADEspressoMonocularInferenceDescriptor *v7;
  uint64_t v8;
  ADEspressoImageDescriptor *colorInput;
  uint64_t v10;
  ADEspressoImageDescriptor *depthOutput;
  objc_super v13;

  v4 = a3;
  objc_msgSend(v4, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutNamesDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)ADEspressoMonocularInferenceDescriptor;
  v7 = -[ADEspressoInferenceDescriptor initWithUrl:layoutNames:](&v13, sel_initWithUrl_layoutNames_, v5, v6);

  if (v7)
  {
    objc_msgSend(v4, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDColor, 1, 1111970369);
    v8 = objc_claimAutoreleasedReturnValue();
    colorInput = v7->_colorInput;
    v7->_colorInput = (ADEspressoImageDescriptor *)v8;

    objc_msgSend(v4, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDDepth, 0, 1717855600);
    v10 = objc_claimAutoreleasedReturnValue();
    depthOutput = v7->_depthOutput;
    v7->_depthOutput = (ADEspressoImageDescriptor *)v10;

  }
  return v7;
}

- (ADEspressoImageDescriptor)colorInput
{
  return self->_colorInput;
}

- (ADEspressoImageDescriptor)depthOutput
{
  return self->_depthOutput;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_depthOutput, 0);
  objc_storeStrong((id *)&self->_colorInput, 0);
}

@end
