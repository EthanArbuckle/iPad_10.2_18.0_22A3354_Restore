@implementation ADEspressoJasperToColorTransformCorrectionBackendInfrerenceDescriptor

- (ADEspressoJasperToColorTransformCorrectionBackendInfrerenceDescriptor)initWithNetworkProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ADEspressoJasperToColorTransformCorrectionBackendInfrerenceDescriptor *v7;
  uint64_t v8;
  ADEspressoImageDescriptor *colorInput;
  uint64_t v10;
  ADEspressoImageDescriptor *jasperInput;
  uint64_t v12;
  ADEspressoImageDescriptor *featuresOutput;
  objc_super v15;

  v4 = a3;
  objc_msgSend(v4, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutNamesDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)ADEspressoJasperToColorTransformCorrectionBackendInfrerenceDescriptor;
  v7 = -[ADEspressoInferenceDescriptor initWithUrl:layoutNames:](&v15, sel_initWithUrl_layoutNames_, v5, v6);

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

    objc_msgSend(v4, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDOutputOpaqueFeatures, 0, 1278226534);
    v12 = objc_claimAutoreleasedReturnValue();
    featuresOutput = v7->_featuresOutput;
    v7->_featuresOutput = (ADEspressoImageDescriptor *)v12;

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
