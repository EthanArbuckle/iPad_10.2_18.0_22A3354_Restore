@implementation ADEspressoJasperToColorTransformCorrectionFrontendInfrerenceDescriptor

- (ADEspressoJasperToColorTransformCorrectionFrontendInfrerenceDescriptor)initWithNetworkProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ADEspressoJasperToColorTransformCorrectionFrontendInfrerenceDescriptor *v7;
  uint64_t v8;
  ADEspressoImageDescriptor *featuresInput;
  uint64_t v10;
  ADEspressoImageDescriptor *anglesOutput;
  uint64_t v12;
  ADEspressoImageDescriptor *errorsOutput;
  objc_super v15;

  v4 = a3;
  objc_msgSend(v4, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutNamesDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)ADEspressoJasperToColorTransformCorrectionFrontendInfrerenceDescriptor;
  v7 = -[ADEspressoInferenceDescriptor initWithUrl:layoutNames:](&v15, sel_initWithUrl_layoutNames_, v5, v6);

  if (v7)
  {
    objc_msgSend(v4, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDInputOpaqueFeatures, 1, 1278226534);
    v8 = objc_claimAutoreleasedReturnValue();
    featuresInput = v7->_featuresInput;
    v7->_featuresInput = (ADEspressoImageDescriptor *)v8;

    objc_msgSend(v4, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDAnglesVector, 0, 1278226534);
    v10 = objc_claimAutoreleasedReturnValue();
    anglesOutput = v7->_anglesOutput;
    v7->_anglesOutput = (ADEspressoImageDescriptor *)v10;

    objc_msgSend(v4, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDErrorsVector, 0, 1278226534);
    v12 = objc_claimAutoreleasedReturnValue();
    errorsOutput = v7->_errorsOutput;
    v7->_errorsOutput = (ADEspressoImageDescriptor *)v12;

  }
  return v7;
}

- (ADEspressoImageDescriptor)featuresInput
{
  return self->_featuresInput;
}

- (ADEspressoImageDescriptor)anglesOutput
{
  return self->_anglesOutput;
}

- (ADEspressoImageDescriptor)errorsOutput
{
  return self->_errorsOutput;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorsOutput, 0);
  objc_storeStrong((id *)&self->_anglesOutput, 0);
  objc_storeStrong((id *)&self->_featuresInput, 0);
}

@end
