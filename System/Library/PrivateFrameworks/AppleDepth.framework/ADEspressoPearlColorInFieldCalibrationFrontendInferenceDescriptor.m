@implementation ADEspressoPearlColorInFieldCalibrationFrontendInferenceDescriptor

- (ADEspressoPearlColorInFieldCalibrationFrontendInferenceDescriptor)initWithNetworkProvider:(id)a3 espressoEngine:(unint64_t)a4 networkFlowType:(int)a5
{
  id v8;
  void *v9;
  void *v10;
  ADEspressoPearlColorInFieldCalibrationFrontendInferenceDescriptor *v11;
  uint64_t v12;
  ADEspressoImageDescriptor *rotationZOutput;
  ADEspressoImageDescriptor *errorZOutput;
  uint64_t v15;
  ADEspressoImageDescriptor *v16;
  uint64_t v17;
  ADEspressoImageDescriptor *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  uint64_t v24;
  ADEspressoImageDescriptor *featuresInput;
  uint64_t v26;
  ADEspressoImageDescriptor *rotationXOutput;
  uint64_t v28;
  ADEspressoImageDescriptor *rotationYOutput;
  uint64_t v30;
  ADEspressoImageDescriptor *errorXOutput;
  uint64_t v32;
  ADEspressoImageDescriptor *errorYOutput;
  objc_super v35;

  v8 = a3;
  objc_msgSend(v8, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutNamesDict");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35.receiver = self;
  v35.super_class = (Class)ADEspressoPearlColorInFieldCalibrationFrontendInferenceDescriptor;
  v11 = -[ADEspressoInferenceDescriptor initWithUrl:layoutNames:](&v35, sel_initWithUrl_layoutNames_, v9, v10);

  if (v11)
  {
    if (a4 - 3 >= 2)
      v12 = 1278226534;
    else
      v12 = 1278226536;
    rotationZOutput = v11->_rotationZOutput;
    v11->_rotationZOutput = 0;

    errorZOutput = v11->_errorZOutput;
    v11->_errorZOutput = 0;

    if (a5 == 2)
    {
      objc_msgSend(v8, "descriptorForBuffer:isInput:pixelFormat:", CFSTR("rotz"), 0, v12);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v11->_rotationZOutput;
      v11->_rotationZOutput = (ADEspressoImageDescriptor *)v15;

      objc_msgSend(v8, "descriptorForBuffer:isInput:pixelFormat:", CFSTR("stdz"), 0, v12);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v11->_errorZOutput;
      v11->_errorZOutput = (ADEspressoImageDescriptor *)v17;

      v19 = CFSTR("stdy");
      v20 = CFSTR("stdx");
      v21 = CFSTR("roty");
      v22 = CFSTR("rotx");
      v23 = CFSTR("feat_vec_tb");
    }
    else
    {
      v19 = CFSTR("pred_error_roty:0");
      v20 = CFSTR("pred_error_rotx:0");
      v21 = CFSTR("pred_roty:0");
      v22 = CFSTR("pred_rotx:0");
      v23 = CFSTR("frontend_input:0");
    }
    objc_msgSend(v8, "descriptorForBuffer:isInput:pixelFormat:", v23, 1, v12);
    v24 = objc_claimAutoreleasedReturnValue();
    featuresInput = v11->_featuresInput;
    v11->_featuresInput = (ADEspressoImageDescriptor *)v24;

    objc_msgSend(v8, "descriptorForBuffer:isInput:pixelFormat:", v22, 0, v12);
    v26 = objc_claimAutoreleasedReturnValue();
    rotationXOutput = v11->_rotationXOutput;
    v11->_rotationXOutput = (ADEspressoImageDescriptor *)v26;

    objc_msgSend(v8, "descriptorForBuffer:isInput:pixelFormat:", v21, 0, v12);
    v28 = objc_claimAutoreleasedReturnValue();
    rotationYOutput = v11->_rotationYOutput;
    v11->_rotationYOutput = (ADEspressoImageDescriptor *)v28;

    objc_msgSend(v8, "descriptorForBuffer:isInput:pixelFormat:", v20, 0, v12);
    v30 = objc_claimAutoreleasedReturnValue();
    errorXOutput = v11->_errorXOutput;
    v11->_errorXOutput = (ADEspressoImageDescriptor *)v30;

    objc_msgSend(v8, "descriptorForBuffer:isInput:pixelFormat:", v19, 0, v12);
    v32 = objc_claimAutoreleasedReturnValue();
    errorYOutput = v11->_errorYOutput;
    v11->_errorYOutput = (ADEspressoImageDescriptor *)v32;

  }
  return v11;
}

- (ADEspressoImageDescriptor)featuresInput
{
  return self->_featuresInput;
}

- (ADEspressoImageDescriptor)rotationXOutput
{
  return self->_rotationXOutput;
}

- (ADEspressoImageDescriptor)rotationYOutput
{
  return self->_rotationYOutput;
}

- (ADEspressoImageDescriptor)rotationZOutput
{
  return self->_rotationZOutput;
}

- (ADEspressoImageDescriptor)errorXOutput
{
  return self->_errorXOutput;
}

- (ADEspressoImageDescriptor)errorYOutput
{
  return self->_errorYOutput;
}

- (ADEspressoImageDescriptor)errorZOutput
{
  return self->_errorZOutput;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorZOutput, 0);
  objc_storeStrong((id *)&self->_errorYOutput, 0);
  objc_storeStrong((id *)&self->_errorXOutput, 0);
  objc_storeStrong((id *)&self->_rotationZOutput, 0);
  objc_storeStrong((id *)&self->_rotationYOutput, 0);
  objc_storeStrong((id *)&self->_rotationXOutput, 0);
  objc_storeStrong((id *)&self->_featuresInput, 0);
}

@end
