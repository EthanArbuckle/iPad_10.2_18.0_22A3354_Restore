@implementation DMTFetchAutomatedDeviceEnrollmentPrerequisitesOperation

- (DMTFetchAutomatedDeviceEnrollmentPrerequisitesOperation)initWithRequest:(id)a3 deviceInformationPrimitives:(id)a4
{
  id v7;
  DMTFetchAutomatedDeviceEnrollmentPrerequisitesOperation *v8;
  DMTFetchAutomatedDeviceEnrollmentPrerequisitesOperation *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DMTFetchAutomatedDeviceEnrollmentPrerequisitesOperation;
  v8 = -[CATTaskOperation initWithRequest:](&v11, sel_initWithRequest_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_deviceInformationPrimitives, a4);

  return v9;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  objc_super v9;

  v6 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___DMTFetchAutomatedDeviceEnrollmentPrerequisitesOperation;
  if (!objc_msgSendSuper2(&v9, sel_validateRequest_error_, v6, a4))
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      DMTErrorWithCodeAndUserInfo(2, &unk_24E5A9AE8);
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  v7 = 1;
LABEL_7:

  return v7;
}

- (void)runWithRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (-[DMTFetchAutomatedDeviceEnrollmentPrerequisitesOperation isExecuting](self, "isExecuting", a3))
  {
    if (-[DMTFetchAutomatedDeviceEnrollmentPrerequisitesOperation isCancelled](self, "isCancelled"))
    {
      CATErrorWithCodeAndUserInfo();
      v12 = (id)objc_claimAutoreleasedReturnValue();
      -[DMTFetchAutomatedDeviceEnrollmentPrerequisitesOperation endOperationWithError:](self, "endOperationWithError:");
    }
    else
    {
      v12 = (id)objc_opt_new();
      -[DMTFetchAutomatedDeviceEnrollmentPrerequisitesOperation deviceInformationPrimitives](self, "deviceInformationPrimitives");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "serialNumber");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSerialNumber:", v5);

      -[DMTFetchAutomatedDeviceEnrollmentPrerequisitesOperation deviceInformationPrimitives](self, "deviceInformationPrimitives");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "deviceUDID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setDeviceUDID:", v7);

      -[DMTFetchAutomatedDeviceEnrollmentPrerequisitesOperation deviceInformationPrimitives](self, "deviceInformationPrimitives");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "modelIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setModelIdentifier:", v9);

      -[DMTFetchAutomatedDeviceEnrollmentPrerequisitesOperation deviceInformationPrimitives](self, "deviceInformationPrimitives");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "marketingModelName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setModelName:", v11);

      -[DMTFetchAutomatedDeviceEnrollmentPrerequisitesOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v12);
    }

  }
}

- (DMTDeviceInformationPrimitives)deviceInformationPrimitives
{
  return self->_deviceInformationPrimitives;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceInformationPrimitives, 0);
}

@end
