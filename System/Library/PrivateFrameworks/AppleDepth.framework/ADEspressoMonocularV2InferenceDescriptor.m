@implementation ADEspressoMonocularV2InferenceDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disparityOutput, 0);
  objc_storeStrong((id *)&self->_prevDisparityInput, 0);
  objc_storeStrong((id *)&self->_colorInput, 0);
}

- (ADEspressoImageDescriptor)prevDisparityInput
{
  return self->_prevDisparityInput;
}

- (ADEspressoMonocularV2InferenceDescriptor)initWithNetworkProvider:(id)a3 inputColorFormat:(unsigned int)a4 disparityFormat:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  ADEspressoMonocularV2InferenceDescriptor *v11;
  uint64_t v12;
  ADEspressoImageDescriptor *colorInput;
  uint64_t v14;
  ADEspressoImageDescriptor *prevDisparityInput;
  uint64_t v16;
  ADEspressoImageDescriptor *disparityOutput;
  objc_super v19;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v8 = a3;
  objc_msgSend(v8, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutNamesDict");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)ADEspressoMonocularV2InferenceDescriptor;
  v11 = -[ADEspressoInferenceDescriptor initWithUrl:layoutNames:](&v19, sel_initWithUrl_layoutNames_, v9, v10);

  if (v11)
  {
    objc_msgSend(v8, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDColor, 1, v6);
    v12 = objc_claimAutoreleasedReturnValue();
    colorInput = v11->_colorInput;
    v11->_colorInput = (ADEspressoImageDescriptor *)v12;

    objc_msgSend(v8, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDPrevDisparity, 1, v5);
    v14 = objc_claimAutoreleasedReturnValue();
    prevDisparityInput = v11->_prevDisparityInput;
    v11->_prevDisparityInput = (ADEspressoImageDescriptor *)v14;

    objc_msgSend(v8, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDDisparity, 0, v5);
    v16 = objc_claimAutoreleasedReturnValue();
    disparityOutput = v11->_disparityOutput;
    v11->_disparityOutput = (ADEspressoImageDescriptor *)v16;

  }
  return v11;
}

- (ADEspressoImageDescriptor)disparityOutput
{
  return self->_disparityOutput;
}

- (ADEspressoImageDescriptor)colorInput
{
  return self->_colorInput;
}

@end
