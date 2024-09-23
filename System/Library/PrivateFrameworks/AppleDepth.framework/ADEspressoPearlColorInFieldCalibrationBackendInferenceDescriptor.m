@implementation ADEspressoPearlColorInFieldCalibrationBackendInferenceDescriptor

- (ADEspressoPearlColorInFieldCalibrationBackendInferenceDescriptor)initWithNetworkProvider:(id)a3 espressoEngine:(unint64_t)a4 networkFlowType:(int)a5
{
  id v8;
  void *v9;
  void *v10;
  ADEspressoPearlColorInFieldCalibrationBackendInferenceDescriptor *v11;
  ADEspressoImageDescriptor *pearlMaskInput;
  uint64_t v13;
  ADEspressoImageDescriptor *v14;
  const __CFString *v15;
  const __CFString *v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  ADEspressoImageDescriptor *colorInput;
  uint64_t v21;
  ADEspressoImageDescriptor *pearlInput;
  uint64_t v23;
  ADEspressoImageDescriptor *featuresOutput;
  objc_super v26;

  v8 = a3;
  objc_msgSend(v8, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutNamesDict");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26.receiver = self;
  v26.super_class = (Class)ADEspressoPearlColorInFieldCalibrationBackendInferenceDescriptor;
  v11 = -[ADEspressoInferenceDescriptor initWithUrl:layoutNames:](&v26, sel_initWithUrl_layoutNames_, v9, v10);

  if (v11)
  {
    if (a4 - 3 > 1)
    {
      v15 = CFSTR("backend_output:0");
      v16 = CFSTR("Backend/inputs/jasper_image:0");
      v17 = 1717855600;
    }
    else
    {
      pearlMaskInput = v11->_pearlMaskInput;
      v11->_pearlMaskInput = 0;

      if (a5 == 2)
      {
        objc_msgSend(v8, "descriptorForBuffer:isInput:pixelFormat:", CFSTR("mask"), 1, 1278226536);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v11->_pearlMaskInput;
        v11->_pearlMaskInput = (ADEspressoImageDescriptor *)v13;

        v15 = CFSTR("feat_vec");
        v16 = CFSTR("depth_input");
        v17 = 1278226536;
        v18 = CFSTR("image");
LABEL_8:
        objc_msgSend(v8, "descriptorForBuffer:isInput:pixelFormat:", v18, 1, 1111970369);
        v19 = objc_claimAutoreleasedReturnValue();
        colorInput = v11->_colorInput;
        v11->_colorInput = (ADEspressoImageDescriptor *)v19;

        objc_msgSend(v8, "descriptorForBuffer:isInput:pixelFormat:", v16, 1, v17);
        v21 = objc_claimAutoreleasedReturnValue();
        pearlInput = v11->_pearlInput;
        v11->_pearlInput = (ADEspressoImageDescriptor *)v21;

        objc_msgSend(v8, "descriptorForBuffer:isInput:pixelFormat:", v15, 0, v17);
        v23 = objc_claimAutoreleasedReturnValue();
        featuresOutput = v11->_featuresOutput;
        v11->_featuresOutput = (ADEspressoImageDescriptor *)v23;

        goto LABEL_9;
      }
      v15 = CFSTR("backend_output:0");
      v16 = CFSTR("Backend/inputs/jasper_image:0");
      v17 = 1751410032;
    }
    v18 = CFSTR("Backend/inputs/image:0");
    goto LABEL_8;
  }
LABEL_9:

  return v11;
}

- (ADEspressoImageDescriptor)colorInput
{
  return self->_colorInput;
}

- (ADEspressoImageDescriptor)pearlInput
{
  return self->_pearlInput;
}

- (ADEspressoImageDescriptor)pearlMaskInput
{
  return self->_pearlMaskInput;
}

- (ADEspressoImageDescriptor)featuresOutput
{
  return self->_featuresOutput;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuresOutput, 0);
  objc_storeStrong((id *)&self->_pearlMaskInput, 0);
  objc_storeStrong((id *)&self->_pearlInput, 0);
  objc_storeStrong((id *)&self->_colorInput, 0);
}

@end
