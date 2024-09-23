@implementation DMTPerformAutomatedDeviceEnrollmentOperation

- (DMTPerformAutomatedDeviceEnrollmentOperation)initWithRequest:(id)a3 prerequisiteReceiver:(id)a4 enrollmentInitiator:(id)a5
{
  id v9;
  id v10;
  DMTPerformAutomatedDeviceEnrollmentOperation *v11;
  DMTPerformAutomatedDeviceEnrollmentOperation *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)DMTPerformAutomatedDeviceEnrollmentOperation;
  v11 = -[CATTaskOperation initWithRequest:](&v14, sel_initWithRequest_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_prerequisiteReceiver, a4);
    objc_storeStrong((id *)&v12->_enrollmentInitiator, a5);
  }

  return v12;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___DMTPerformAutomatedDeviceEnrollmentOperation;
  if (!objc_msgSendSuper2(&v16, sel_validateRequest_error_, v6, a4))
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    objc_msgSend(v7, "nonce");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8
      && (v9 = (void *)v8,
          objc_msgSend(v7, "nonce"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "length"),
          v10,
          v9,
          v11))
    {
      if (objc_msgSend(v7, "effectiveNetworkConfiguration"))
      {
        v12 = 1;
LABEL_20:

        goto LABEL_21;
      }
      if (_DMTLogGeneral_onceToken_3 != -1)
        dispatch_once(&_DMTLogGeneral_onceToken_3, &__block_literal_global_4);
      v14 = (void *)_DMTLogGeneral_logObj_3;
      if (os_log_type_enabled((os_log_t)_DMTLogGeneral_logObj_3, OS_LOG_TYPE_ERROR))
      {
        +[DMTPerformAutomatedDeviceEnrollmentOperation validateRequest:error:].cold.1(v14, (objc_class *)a1);
        if (a4)
          goto LABEL_17;
      }
      else if (a4)
      {
LABEL_17:
        v13 = &unk_24E5A9B60;
        goto LABEL_12;
      }
    }
    else if (a4)
    {
      v13 = &unk_24E5A9B38;
LABEL_12:
      DMTErrorWithCodeAndUserInfo(2, v13);
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    v12 = 0;
    goto LABEL_20;
  }
  if (a4)
  {
    DMTErrorWithCodeAndUserInfo(2, &unk_24E5A9B10);
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_9:
    v12 = 0;
  }
LABEL_21:

  return v12;
}

- (void)runWithRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  if (-[DMTPerformAutomatedDeviceEnrollmentOperation isExecuting](self, "isExecuting"))
  {
    if (-[DMTPerformAutomatedDeviceEnrollmentOperation isCancelled](self, "isCancelled"))
    {
      CATErrorWithCodeAndUserInfo();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMTPerformAutomatedDeviceEnrollmentOperation endOperationWithError:](self, "endOperationWithError:", v4);

    }
    else
    {
      -[DMTPerformAutomatedDeviceEnrollmentOperation prerequisiteReceiver](self, "prerequisiteReceiver");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "networkCredential");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "networkPayload");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "nonce");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v14, "automationBehavior");
      objc_msgSend(v14, "organizationName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v14, "organizationType");
      objc_msgSend(v14, "mdmServerName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setNetworkCredential:networkPayload:enrollmentNonce:postEnrollmentBehavior:organizationName:organizationType:mdmServerName:networkConfiguration:", v6, v7, v8, v9, v10, v11, v12, objc_msgSend(v14, "effectiveNetworkConfiguration"));

      -[DMTPerformAutomatedDeviceEnrollmentOperation enrollmentInitiator](self, "enrollmentInitiator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "beginAutomatedDeviceEnrollment");

      -[DMTPerformAutomatedDeviceEnrollmentOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
    }
  }

}

- (DMTEnrollmentPrerequisiteReceiving)prerequisiteReceiver
{
  return self->_prerequisiteReceiver;
}

- (DMTEnrollmentInitiating)enrollmentInitiator
{
  return self->_enrollmentInitiator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrollmentInitiator, 0);
  objc_storeStrong((id *)&self->_prerequisiteReceiver, 0);
}

+ (void)validateRequest:(void *)a1 error:(objc_class *)a2 .cold.1(void *a1, objc_class *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  NSStringFromClass(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_21FD69000, v3, OS_LOG_TYPE_ERROR, "Both network payloads are missing, failing validation for %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
