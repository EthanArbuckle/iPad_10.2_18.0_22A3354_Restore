@implementation HDQuantitySeriesEditorTaskServer

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E0CB5A40];
}

+ (id)requiredEntitlements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CB59B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (HDQuantitySeriesEditorTaskServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  HDQuantitySeriesEditorTaskServer *v11;
  uint64_t v12;
  HKQuantitySample *quantitySample;
  HDQuantitySeriesEditorTaskServer *v14;
  objc_super v16;

  v10 = a4;
  if (v10)
  {
    v16.receiver = self;
    v16.super_class = (Class)HDQuantitySeriesEditorTaskServer;
    v11 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v16, sel_initWithUUID_configuration_client_delegate_, a3, v10, a5, a6);
    if (v11)
    {
      objc_msgSend(v10, "quantitySample");
      v12 = objc_claimAutoreleasedReturnValue();
      quantitySample = v11->_quantitySample;
      v11->_quantitySample = (HKQuantitySample *)v12;

    }
    self = v11;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  return 1;
}

- (void)remote_commitRemovedDatums:(id)a3 completion:(id)a4
{
  HKQuantitySample *quantitySample;
  void (**v7)(id, void *, id);
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  quantitySample = self->_quantitySample;
  v7 = (void (**)(id, void *, id))a4;
  v8 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  +[HDQuantitySampleSeriesEntity removeValues:fromQuantitySeriesSample:profile:error:](HDQuantitySampleSeriesEntity, "removeValues:fromQuantitySeriesSample:profile:error:", v8, quantitySample, v9, &v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v12;
  v7[2](v7, v10, v11);

}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6A58], "serverInterface");
}

- (id)remoteInterface
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantitySample, 0);
}

@end
