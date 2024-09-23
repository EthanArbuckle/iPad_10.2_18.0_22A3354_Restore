@implementation ADEspressoDensifiedLiDARFocusAssistInferenceDescriptor

- (ADEspressoDensifiedLiDARFocusAssistInferenceDescriptor)initWithNetworkProvider:(id)a3 espressoEngine:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  ADEspressoDensifiedLiDARFocusAssistInferenceDescriptor *v12;
  uint64_t v13;
  ADEspressoImageDescriptor *colorInput;
  uint64_t v15;
  ADEspressoImageDescriptor *lidarInput;
  uint64_t v17;
  ADEspressoImageDescriptor *depthOutput;
  uint64_t v19;
  ADEspressoImageDescriptor *uncertaintyOutput;
  objc_super v22;

  v6 = a3;
  v7 = v6;
  if (a4 - 3 >= 2)
    v8 = 1717855600;
  else
    v8 = 1751410032;
  if (a4 - 3 >= 2)
    v9 = 1278226534;
  else
    v9 = 1278226536;
  objc_msgSend(v6, "url");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutNamesDict");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22.receiver = self;
  v22.super_class = (Class)ADEspressoDensifiedLiDARFocusAssistInferenceDescriptor;
  v12 = -[ADEspressoInferenceDescriptor initWithUrl:layoutNames:](&v22, sel_initWithUrl_layoutNames_, v10, v11);

  if (v12)
  {
    objc_msgSend(v7, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDColor, 1, 1111970369);
    v13 = objc_claimAutoreleasedReturnValue();
    colorInput = v12->_colorInput;
    v12->_colorInput = (ADEspressoImageDescriptor *)v13;

    objc_msgSend(v7, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDJasper, 1, v8);
    v15 = objc_claimAutoreleasedReturnValue();
    lidarInput = v12->_lidarInput;
    v12->_lidarInput = (ADEspressoImageDescriptor *)v15;

    objc_msgSend(v7, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDDepth, 0, v8);
    v17 = objc_claimAutoreleasedReturnValue();
    depthOutput = v12->_depthOutput;
    v12->_depthOutput = (ADEspressoImageDescriptor *)v17;

    objc_msgSend(v7, "descriptorForBufferOfType:isInput:pixelFormat:", kADEspressoBufferIDConfidence[0], 0, v9);
    v19 = objc_claimAutoreleasedReturnValue();
    uncertaintyOutput = v12->_uncertaintyOutput;
    v12->_uncertaintyOutput = (ADEspressoImageDescriptor *)v19;

  }
  return v12;
}

- (ADEspressoImageDescriptor)colorInput
{
  return self->_colorInput;
}

- (ADEspressoImageDescriptor)lidarInput
{
  return self->_lidarInput;
}

- (ADEspressoImageDescriptor)depthOutput
{
  return self->_depthOutput;
}

- (ADEspressoImageDescriptor)uncertaintyOutput
{
  return self->_uncertaintyOutput;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uncertaintyOutput, 0);
  objc_storeStrong((id *)&self->_depthOutput, 0);
  objc_storeStrong((id *)&self->_lidarInput, 0);
  objc_storeStrong((id *)&self->_colorInput, 0);
}

@end
