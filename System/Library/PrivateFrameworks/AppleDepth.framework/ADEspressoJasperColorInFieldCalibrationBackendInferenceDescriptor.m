@implementation ADEspressoJasperColorInFieldCalibrationBackendInferenceDescriptor

- (ADEspressoJasperColorInFieldCalibrationBackendInferenceDescriptor)initWithNetworkProvider:(id)a3 espressoEngine:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  ADEspressoJasperColorInFieldCalibrationBackendInferenceDescriptor *v9;
  uint64_t v10;
  uint64_t v11;
  ADEspressoImageDescriptor *colorInput;
  uint64_t v13;
  ADEspressoImageDescriptor *jasperInput;
  uint64_t v15;
  ADEspressoImageDescriptor *featuresOutput;
  objc_super v18;

  v6 = a3;
  objc_msgSend(v6, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutNamesDict");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)ADEspressoJasperColorInFieldCalibrationBackendInferenceDescriptor;
  v9 = -[ADEspressoInferenceDescriptor initWithUrl:layoutNames:](&v18, sel_initWithUrl_layoutNames_, v7, v8);

  if (v9)
  {
    if (a4 - 3 >= 2)
      v10 = 1717855600;
    else
      v10 = 1751410032;
    objc_msgSend(v6, "descriptorForBuffer:isInput:pixelFormat:", CFSTR("Backend/inputs/image:0"), 1, 1111970369);
    v11 = objc_claimAutoreleasedReturnValue();
    colorInput = v9->_colorInput;
    v9->_colorInput = (ADEspressoImageDescriptor *)v11;

    objc_msgSend(v6, "descriptorForBuffer:isInput:pixelFormat:", CFSTR("Backend/inputs/jasper_image:0"), 1, v10);
    v13 = objc_claimAutoreleasedReturnValue();
    jasperInput = v9->_jasperInput;
    v9->_jasperInput = (ADEspressoImageDescriptor *)v13;

    objc_msgSend(v6, "descriptorForBuffer:isInput:pixelFormat:", CFSTR("backend_output:0"), 0, v10);
    v15 = objc_claimAutoreleasedReturnValue();
    featuresOutput = v9->_featuresOutput;
    v9->_featuresOutput = (ADEspressoImageDescriptor *)v15;

  }
  return v9;
}

- (ADEspressoImageDescriptor)colorInput
{
  return self->_colorInput;
}

- (ADEspressoImageDescriptor)jasperInput
{
  return self->_jasperInput;
}

- (ADEspressoImageDescriptor)featuresOutput
{
  return self->_featuresOutput;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuresOutput, 0);
  objc_storeStrong((id *)&self->_jasperInput, 0);
  objc_storeStrong((id *)&self->_colorInput, 0);
}

@end
