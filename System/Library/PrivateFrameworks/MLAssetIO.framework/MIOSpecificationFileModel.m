@implementation MIOSpecificationFileModel

- (MIOSpecificationFileModel)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v6;
  NSURL *v7;
  NSURL *modelURL;
  id v9;
  void *v10;
  void *v11;
  MIOParserContext *v12;
  MIOSpecificationModel *v13;
  MIOSpecificationFileModel *v14;

  v6 = a3;
  v7 = (NSURL *)objc_msgSend(v6, "copy");
  modelURL = self->_modelURL;
  self->_modelURL = v7;

  v9 = objc_alloc(MEMORY[0x1E0C99D50]);
  objc_msgSend(v6, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithContentsOfFile:options:error:", v10, 1, a4);

  if (v11)
  {
    v12 = -[MIOParserContext initWithModelSpecificationFileURL:]([MIOParserContext alloc], "initWithModelSpecificationFileURL:", v6);
    v13 = -[MIOSpecificationModel initWithSpecificationData:parserContext:error:]([MIOSpecificationModel alloc], "initWithSpecificationData:parserContext:error:", v11, v12, a4);
    if (v13)
    {
      self = -[MIOSpecificationFileModel initWithModel:](self, "initWithModel:", v13);
      v14 = self;
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (MIOSpecificationFileModel)initWithModel:(id)a3
{
  id v5;
  MIOSpecificationFileModel *v6;
  MIOSpecificationFileModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MIOSpecificationFileModel;
  v6 = -[MIOSpecificationFileModel init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_specificationModel, a3);

  return v7;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[MIOSpecificationFileModel specificationModel](self, "specificationModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "writeToURL:error:", v6, a4);

  return (char)a4;
}

- (MIOVersionInfo)specificationVersion
{
  void *v2;
  void *v3;

  -[MIOSpecificationFileModel specificationModel](self, "specificationModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "specificationVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MIOVersionInfo *)v3;
}

- (NSString)modelTypeName
{
  void *v2;
  void *v3;

  -[MIOSpecificationFileModel specificationModel](self, "specificationModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelTypeName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (MIOModelDescription)modelDescription
{
  void *v2;
  void *v3;

  -[MIOSpecificationFileModel specificationModel](self, "specificationModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MIOModelDescription *)v3;
}

- (void)setModelDescription:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MIOSpecificationFileModel specificationModel](self, "specificationModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setModelDescription:", v5);

}

- (NSArray)layers
{
  void *v2;
  void *v3;

  -[MIOSpecificationFileModel specificationModel](self, "specificationModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)subModels
{
  void *v2;
  void *v3;

  -[MIOSpecificationFileModel specificationModel](self, "specificationModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subModels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)neuralNetworkLayerHistogramForFunctionNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MIOSpecificationFileModel specificationModel](self, "specificationModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "neuralNetworkLayerHistogramForFunctionNamed:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)programOperationHistogramForFunctionNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MIOSpecificationFileModel specificationModel](self, "specificationModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "programOperationHistogramForFunctionNamed:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)computePrecisionForFunctionNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MIOSpecificationFileModel specificationModel](self, "specificationModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "computePrecisionForFunctionNamed:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)storagePrecisionForFunctionNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MIOSpecificationFileModel specificationModel](self, "specificationModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storagePrecisionForFunctionNamed:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)irProgram
{
  void *v2;
  void *v3;

  -[MIOSpecificationFileModel specificationModel](self, "specificationModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "irProgram");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  MIOSpecificationFileModel *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (MIOSpecificationFileModel *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MIOSpecificationFileModel specificationModel](self, "specificationModel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIOSpecificationFileModel specificationModel](v4, "specificationModel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MIOSpecificationFileModel specificationModel](self, "specificationModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MIOSpecificationFileModel *v4;
  void *v5;
  void *v6;
  MIOSpecificationFileModel *v7;
  void *v8;

  v4 = [MIOSpecificationFileModel alloc];
  -[MIOSpecificationFileModel specificationModel](self, "specificationModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  v7 = -[MIOSpecificationFileModel initWithModel:](v4, "initWithModel:", v6);

  -[MIOSpecificationFileModel modelURL](self, "modelURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIOSpecificationFileModel setModelURL:](v7, "setModelURL:", v8);

  return v7;
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (void)setModelURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (MIOModeling)specificationModel
{
  return self->_specificationModel;
}

- (void)setSpecificationModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specificationModel, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
}

@end
