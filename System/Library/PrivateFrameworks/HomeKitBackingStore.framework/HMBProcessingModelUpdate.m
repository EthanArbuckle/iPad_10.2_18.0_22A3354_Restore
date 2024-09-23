@implementation HMBProcessingModelUpdate

- (HMBProcessingModelUpdate)initWithModel:(id)a3 previousModel:(id)a4 options:(id)a5 mirrorOutputFuture:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMBProcessingModelUpdate *v15;
  HMBProcessingModelUpdate *v16;
  HMBProcessingModelUpdate *v18;
  SEL v19;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v11)
  {
    v14 = v13;
    v20.receiver = self;
    v20.super_class = (Class)HMBProcessingModelUpdate;
    v15 = -[HMBProcessingModelResult initWithModel:options:mirrorOutputFuture:](&v20, sel_initWithModel_options_mirrorOutputFuture_, v10, v12, v13);
    v16 = v15;
    if (v15)
      objc_storeStrong((id *)&v15->_previousModel, a4);

    return v16;
  }
  else
  {
    v18 = (HMBProcessingModelUpdate *)_HMFPreconditionFailure();
    return (HMBProcessingModelUpdate *)-[HMBProcessingModelUpdate attributeDescriptions](v18, v19);
  }
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)HMBProcessingModelUpdate;
  -[HMBProcessingModelResult attributeDescriptions](&v10, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBProcessingModelUpdate previousModel](self, "previousModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Previous Model"), v5);
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HMBModel)previousModel
{
  return (HMBModel *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousModel, 0);
}

@end
