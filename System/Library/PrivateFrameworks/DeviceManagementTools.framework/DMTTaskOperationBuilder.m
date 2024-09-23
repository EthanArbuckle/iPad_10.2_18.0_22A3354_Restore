@implementation DMTTaskOperationBuilder

- (DMTTaskOperationBuilder)initWithDeviceInfoPrimitives:(id)a3 enrollmentPrerequisiteReceiver:(id)a4 enrollmentInitiator:(id)a5 enrollmentStateProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  DMTTaskOperationBuilder *v15;
  DMTTaskOperationBuilder *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)DMTTaskOperationBuilder;
  v15 = -[DMTTaskOperationBuilder init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_deviceInfoPrimitives, a3);
    objc_storeStrong((id *)&v16->_enrollmentPrerequisiteReceiver, a4);
    objc_storeStrong((id *)&v16->_enrollmentInitiator, a5);
    objc_storeStrong((id *)&v16->_enrollmentStateProvider, a6);
  }

  return v16;
}

- (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v5;
  objc_class *v6;
  char v7;

  v5 = a3;
  v6 = +[DMTTaskOperationBuilder validationClassForRequest:](DMTTaskOperationBuilder, "validationClassForRequest:", v5);
  if (v6)
    v7 = -[objc_class validateRequest:error:](v6, "validateRequest:error:", v5, a4);
  else
    v7 = 0;

  return v7;
}

- (id)taskOperationForRequest:(id)a3
{
  id v4;
  DMTFetchAutomatedDeviceEnrollmentPrerequisitesOperation *v5;
  void *v6;
  uint64_t v7;
  DMTPerformAutomatedDeviceEnrollmentOperation *v8;
  void *v9;
  DMTPerformAutomatedDeviceEnrollmentOperation *v10;
  DMTFetchAutomatedDeviceEnrollmentStateOperation *v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = [DMTFetchAutomatedDeviceEnrollmentPrerequisitesOperation alloc];
    -[DMTTaskOperationBuilder deviceInfoPrimitives](self, "deviceInfoPrimitives");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[DMTFetchAutomatedDeviceEnrollmentPrerequisitesOperation initWithRequest:deviceInformationPrimitives:](v5, "initWithRequest:deviceInformationPrimitives:", v4, v6);
LABEL_7:
    v10 = (DMTPerformAutomatedDeviceEnrollmentOperation *)v7;
    goto LABEL_8;
  }
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    {
      v10 = 0;
      goto LABEL_9;
    }
    v11 = [DMTFetchAutomatedDeviceEnrollmentStateOperation alloc];
    -[DMTTaskOperationBuilder enrollmentStateProvider](self, "enrollmentStateProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[DMTFetchAutomatedDeviceEnrollmentStateOperation initWithRequest:enrollmentStateProvider:](v11, "initWithRequest:enrollmentStateProvider:", v4, v6);
    goto LABEL_7;
  }
  v8 = [DMTPerformAutomatedDeviceEnrollmentOperation alloc];
  -[DMTTaskOperationBuilder enrollmentPrerequisiteReceiver](self, "enrollmentPrerequisiteReceiver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMTTaskOperationBuilder enrollmentInitiator](self, "enrollmentInitiator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[DMTPerformAutomatedDeviceEnrollmentOperation initWithRequest:prerequisiteReceiver:enrollmentInitiator:](v8, "initWithRequest:prerequisiteReceiver:enrollmentInitiator:", v4, v6, v9);

LABEL_8:
LABEL_9:

  return v10;
}

+ (Class)validationClassForRequest:(id)a3
{
  objc_class *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  v15[0] = objc_opt_class();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v8;
  v15[1] = objc_opt_class();
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v10;
  v15[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v12;
}

- (DMTDeviceInformationPrimitives)deviceInfoPrimitives
{
  return self->_deviceInfoPrimitives;
}

- (DMTEnrollmentPrerequisiteReceiving)enrollmentPrerequisiteReceiver
{
  return self->_enrollmentPrerequisiteReceiver;
}

- (DMTEnrollmentInitiating)enrollmentInitiator
{
  return self->_enrollmentInitiator;
}

- (DMTEnrollmentStateProviding)enrollmentStateProvider
{
  return self->_enrollmentStateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrollmentStateProvider, 0);
  objc_storeStrong((id *)&self->_enrollmentInitiator, 0);
  objc_storeStrong((id *)&self->_enrollmentPrerequisiteReceiver, 0);
  objc_storeStrong((id *)&self->_deviceInfoPrimitives, 0);
}

@end
