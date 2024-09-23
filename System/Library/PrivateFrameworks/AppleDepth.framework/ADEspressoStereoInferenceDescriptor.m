@implementation ADEspressoStereoInferenceDescriptor

- (ADEspressoStereoInferenceDescriptor)initWithNetworkProvider:(id)a3 inputColorFormat:(unsigned int)a4 outputDisparityFormat:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  ADEspressoStereoInferenceDescriptor *v11;
  uint64_t v12;
  ADEspressoImageDescriptor *referenceInput;
  uint64_t v14;
  ADEspressoImageDescriptor *auxiliaryInput;
  uint64_t v16;
  ADEspressoImageDescriptor *disparityOutput;
  ADEspressoImageDescriptor *referenceNoiseSigmaInput;
  ADEspressoImageDescriptor *auxiliaryNoiseSigmaInput;
  objc_super v21;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v8 = a3;
  objc_msgSend(v8, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutNamesDict");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)ADEspressoStereoInferenceDescriptor;
  v11 = -[ADEspressoInferenceDescriptor initWithUrl:layoutNames:](&v21, sel_initWithUrl_layoutNames_, v9, v10);

  if (v11)
  {
    objc_msgSend(v8, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDRefColor, 1, v6);
    v12 = objc_claimAutoreleasedReturnValue();
    referenceInput = v11->_referenceInput;
    v11->_referenceInput = (ADEspressoImageDescriptor *)v12;

    objc_msgSend(v8, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDAuxColor, 1, v6);
    v14 = objc_claimAutoreleasedReturnValue();
    auxiliaryInput = v11->_auxiliaryInput;
    v11->_auxiliaryInput = (ADEspressoImageDescriptor *)v14;

    objc_msgSend(v8, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDDisparity, 0, v5);
    v16 = objc_claimAutoreleasedReturnValue();
    disparityOutput = v11->_disparityOutput;
    v11->_disparityOutput = (ADEspressoImageDescriptor *)v16;

    referenceNoiseSigmaInput = v11->_referenceNoiseSigmaInput;
    v11->_referenceNoiseSigmaInput = 0;

    auxiliaryNoiseSigmaInput = v11->_auxiliaryNoiseSigmaInput;
    v11->_auxiliaryNoiseSigmaInput = 0;

  }
  return v11;
}

- (ADEspressoImageDescriptor)referenceInput
{
  return self->_referenceInput;
}

- (ADEspressoImageDescriptor)auxiliaryInput
{
  return self->_auxiliaryInput;
}

- (ADEspressoImageDescriptor)referenceNoiseSigmaInput
{
  return self->_referenceNoiseSigmaInput;
}

- (ADEspressoImageDescriptor)auxiliaryNoiseSigmaInput
{
  return self->_auxiliaryNoiseSigmaInput;
}

- (ADEspressoImageDescriptor)disparityOutput
{
  return self->_disparityOutput;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disparityOutput, 0);
  objc_storeStrong((id *)&self->_auxiliaryNoiseSigmaInput, 0);
  objc_storeStrong((id *)&self->_referenceNoiseSigmaInput, 0);
  objc_storeStrong((id *)&self->_auxiliaryInput, 0);
  objc_storeStrong((id *)&self->_referenceInput, 0);
}

@end
