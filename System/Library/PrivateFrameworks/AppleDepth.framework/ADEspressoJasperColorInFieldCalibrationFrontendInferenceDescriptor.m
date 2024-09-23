@implementation ADEspressoJasperColorInFieldCalibrationFrontendInferenceDescriptor

- (ADEspressoJasperColorInFieldCalibrationFrontendInferenceDescriptor)initWithNetworkProvider:(id)a3 espressoEngine:(unint64_t)a4 networkFlowType:(int)a5
{
  id v8;
  void *v9;
  void *v10;
  ADEspressoJasperColorInFieldCalibrationFrontendInferenceDescriptor *v11;
  uint64_t v12;
  uint64_t v13;
  ADEspressoImageDescriptor *featuresInput;
  uint64_t v15;
  ADEspressoImageDescriptor *rotationXOutput;
  uint64_t v17;
  ADEspressoImageDescriptor *rotationYOutput;
  uint64_t v19;
  ADEspressoImageDescriptor *errorXOutput;
  uint64_t v21;
  ADEspressoImageDescriptor *errorYOutput;
  uint64_t v23;
  ADEspressoImageDescriptor *rotationZOutput;
  uint64_t v25;
  ADEspressoImageDescriptor *errorZOutput;
  objc_super v28;

  v8 = a3;
  objc_msgSend(v8, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutNamesDict");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28.receiver = self;
  v28.super_class = (Class)ADEspressoJasperColorInFieldCalibrationFrontendInferenceDescriptor;
  v11 = -[ADEspressoInferenceDescriptor initWithUrl:layoutNames:](&v28, sel_initWithUrl_layoutNames_, v9, v10);

  if (v11)
  {
    if (a4 - 3 >= 2)
      v12 = 1278226534;
    else
      v12 = 1278226536;
    objc_msgSend(v8, "descriptorForBuffer:isInput:pixelFormat:", CFSTR("frontend_input:0"), 1, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    featuresInput = v11->_featuresInput;
    v11->_featuresInput = (ADEspressoImageDescriptor *)v13;

    objc_msgSend(v8, "descriptorForBuffer:isInput:pixelFormat:", CFSTR("pred_rotx:0"), 0, v12);
    v15 = objc_claimAutoreleasedReturnValue();
    rotationXOutput = v11->_rotationXOutput;
    v11->_rotationXOutput = (ADEspressoImageDescriptor *)v15;

    objc_msgSend(v8, "descriptorForBuffer:isInput:pixelFormat:", CFSTR("pred_roty:0"), 0, v12);
    v17 = objc_claimAutoreleasedReturnValue();
    rotationYOutput = v11->_rotationYOutput;
    v11->_rotationYOutput = (ADEspressoImageDescriptor *)v17;

    objc_msgSend(v8, "descriptorForBuffer:isInput:pixelFormat:", CFSTR("pred_error_rotx:0"), 0, v12);
    v19 = objc_claimAutoreleasedReturnValue();
    errorXOutput = v11->_errorXOutput;
    v11->_errorXOutput = (ADEspressoImageDescriptor *)v19;

    objc_msgSend(v8, "descriptorForBuffer:isInput:pixelFormat:", CFSTR("pred_error_roty:0"), 0, v12);
    v21 = objc_claimAutoreleasedReturnValue();
    errorYOutput = v11->_errorYOutput;
    v11->_errorYOutput = (ADEspressoImageDescriptor *)v21;

    if (a5 == 1)
    {
      objc_msgSend(v8, "descriptorForBuffer:isInput:pixelFormat:", CFSTR("pred_rotz:0"), 0, v12);
      v23 = objc_claimAutoreleasedReturnValue();
      rotationZOutput = v11->_rotationZOutput;
      v11->_rotationZOutput = (ADEspressoImageDescriptor *)v23;

      objc_msgSend(v8, "descriptorForBuffer:isInput:pixelFormat:", CFSTR("pred_error_rotz:0"), 0, v12);
      v25 = objc_claimAutoreleasedReturnValue();
      errorZOutput = v11->_errorZOutput;
      v11->_errorZOutput = (ADEspressoImageDescriptor *)v25;

    }
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
