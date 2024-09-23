@implementation DMTFetchAutomatedDeviceEnrollmentStateOperation

- (DMTFetchAutomatedDeviceEnrollmentStateOperation)initWithRequest:(id)a3 enrollmentStateProvider:(id)a4
{
  id v7;
  DMTFetchAutomatedDeviceEnrollmentStateOperation *v8;
  DMTFetchAutomatedDeviceEnrollmentStateOperation *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DMTFetchAutomatedDeviceEnrollmentStateOperation;
  v8 = -[CATTaskOperation initWithRequest:](&v11, sel_initWithRequest_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_enrollmentStateProvider, a4);

  return v9;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  objc_super v9;

  v6 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___DMTFetchAutomatedDeviceEnrollmentStateOperation;
  if (!objc_msgSendSuper2(&v9, sel_validateRequest_error_, v6, a4))
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      DMTErrorWithCodeAndUserInfo(2, &unk_24E5A9AC0);
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
  id v5;

  if (-[DMTFetchAutomatedDeviceEnrollmentStateOperation isExecuting](self, "isExecuting", a3))
  {
    if (-[DMTFetchAutomatedDeviceEnrollmentStateOperation isCancelled](self, "isCancelled"))
    {
      CATErrorWithCodeAndUserInfo();
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[DMTFetchAutomatedDeviceEnrollmentStateOperation endOperationWithError:](self, "endOperationWithError:");
    }
    else
    {
      v5 = (id)objc_opt_new();
      -[DMTFetchAutomatedDeviceEnrollmentStateOperation enrollmentStateProvider](self, "enrollmentStateProvider");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setEnrollmentState:", objc_msgSend(v4, "enrollmentState"));

      -[DMTFetchAutomatedDeviceEnrollmentStateOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v5);
    }

  }
}

- (DMTEnrollmentStateProviding)enrollmentStateProvider
{
  return self->_enrollmentStateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrollmentStateProvider, 0);
}

@end
