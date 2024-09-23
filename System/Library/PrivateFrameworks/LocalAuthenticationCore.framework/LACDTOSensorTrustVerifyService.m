@implementation LACDTOSensorTrustVerifyService

- (BOOL)shouldVerifySensorTrustWithFeatureState:(id)a3 trustState:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  BOOL v8;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isEnabled") & 1) != 0)
  {
    if (objc_msgSend(v6, "isDisapproved"))
    {
      LACLogDTOSensor();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138543362;
        v18 = &unk_2510F6B98;
LABEL_7:
        _os_log_impl(&dword_2409DC000, v7, OS_LOG_TYPE_DEFAULT, "Sensor trust verification finished with code: %{public}@", (uint8_t *)&v17, 0xCu);
      }
    }
    else
    {
      objc_msgSend(v6, "installedSensorID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");

      if (!v11)
      {
        LACLogDTOSensor();
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          goto LABEL_8;
        v17 = 138543362;
        v18 = &unk_2510F6BB0;
        goto LABEL_7;
      }
      objc_msgSend(v6, "installedSensorID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "trustedSensorID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if (v14)
      {
        LACLogDTOSensor();
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          goto LABEL_8;
        v17 = 138543362;
        v18 = &unk_2510F6BC8;
        goto LABEL_7;
      }
      objc_msgSend(v5, "requirements");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "hasBiometricEnrollments");

      if (!v16)
      {
        v8 = 1;
        goto LABEL_9;
      }
      LACLogDTOSensor();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138543362;
        v18 = &unk_2510F6BE0;
        goto LABEL_7;
      }
    }
  }
  else
  {
    LACLogDTOSensor();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138543362;
      v18 = &unk_2510F6B80;
      goto LABEL_7;
    }
  }
LABEL_8:

  v8 = 0;
LABEL_9:

  return v8;
}

- (id)verifySensorTrustWithFeatureState:(id)a3 trustState:(id)a4 repairState:(id)a5
{
  LACDTOMutableSensorTrustState *v8;
  id v9;
  id v10;
  LACDTOMutableSensorTrustState *v11;
  LACDTOMutableSensorTrustState *v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  LACDTOMutableSensorTrustState *v16;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = (LACDTOMutableSensorTrustState *)a4;
  v9 = a5;
  v10 = a3;
  v11 = -[LACDTOMutableSensorTrustState initWithTrustState:]([LACDTOMutableSensorTrustState alloc], "initWithTrustState:", v8);
  LODWORD(self) = -[LACDTOSensorTrustVerifyService shouldVerifySensorTrustWithFeatureState:trustState:](self, "shouldVerifySensorTrustWithFeatureState:trustState:", v10, v8);

  v12 = v8;
  if ((_DWORD)self)
  {
    v13 = objc_msgSend(v9, "repairFlag");
    LACLogDTOSensor();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13 == 3)
    {
      if (v15)
      {
        v18 = 138543362;
        v19 = &unk_2510F6BF8;
        _os_log_impl(&dword_2409DC000, v14, OS_LOG_TYPE_DEFAULT, "Sensor trust verification finished with code: %{public}@", (uint8_t *)&v18, 0xCu);
      }

      -[LACDTOMutableSensorTrustState disapprove](v11, "disapprove");
    }
    else
    {
      if (v15)
      {
        v18 = 138543362;
        v19 = &unk_2510F6C10;
        _os_log_impl(&dword_2409DC000, v14, OS_LOG_TYPE_DEFAULT, "Sensor trust verification finished with code: %{public}@", (uint8_t *)&v18, 0xCu);
      }

    }
    v12 = v11;
  }
  v16 = v12;

  return v16;
}

@end
