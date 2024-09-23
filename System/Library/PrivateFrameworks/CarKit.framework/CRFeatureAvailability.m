@implementation CRFeatureAvailability

- (CRFeatureAvailability)init
{
  CRFeatureAvailability *v2;
  CRCarKitServiceClient *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRFeatureAvailability;
  v2 = -[CRFeatureAvailability init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CRCarKitServiceClient);
    -[CRFeatureAvailability setServiceClient:](v2, "setServiceClient:", v3);

  }
  return v2;
}

- (BOOL)isCarPlayAllowed
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  CarGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[CRFeatureAvailability isCarPlayAllowed].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  -[CRFeatureAvailability serviceClient](self, "serviceClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __41__CRFeatureAvailability_isCarPlayAllowed__block_invoke;
  v13[3] = &unk_1E5427EF0;
  v13[4] = &v14;
  objc_msgSend(v11, "performSynchronousServiceBlock:errorHandler:", v13, &__block_literal_global_1);

  LOBYTE(v11) = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return (char)v11;
}

uint64_t __41__CRFeatureAvailability_isCarPlayAllowed__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__CRFeatureAvailability_isCarPlayAllowed__block_invoke_2;
  v3[3] = &unk_1E5427EC8;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "isCarPlayAllowedWithReply:", v3);
}

void __41__CRFeatureAvailability_isCarPlayAllowed__block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  CarGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_1A83A2000, v3, OS_LOG_TYPE_INFO, "isCarPlayAllowed: %{public}@", (uint8_t *)&v5, 0xCu);
  }

}

void __41__CRFeatureAvailability_isCarPlayAllowed__block_invoke_19(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CarGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __41__CRFeatureAvailability_isCarPlayAllowed__block_invoke_19_cold_1();

}

- (unint64_t)deviceSupportedCarPlayFeatures
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  CarGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[CRFeatureAvailability deviceSupportedCarPlayFeatures].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  -[CRFeatureAvailability serviceClient](self, "serviceClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__CRFeatureAvailability_deviceSupportedCarPlayFeatures__block_invoke;
  v14[3] = &unk_1E5427EF0;
  v14[4] = &v15;
  objc_msgSend(v11, "performSynchronousServiceBlock:errorHandler:", v14, &__block_literal_global_23);

  v12 = v16[3];
  _Block_object_dispose(&v15, 8);
  return v12;
}

uint64_t __55__CRFeatureAvailability_deviceSupportedCarPlayFeatures__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__CRFeatureAvailability_deviceSupportedCarPlayFeatures__block_invoke_2;
  v3[3] = &unk_1E5427F18;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "deviceSupportedCarPlayFeaturesWithReply:", v3);
}

void __55__CRFeatureAvailability_deviceSupportedCarPlayFeatures__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "unsignedIntegerValue");
    CarGeneralLogging();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      v8 = 134349056;
      v9 = v7;
      _os_log_impl(&dword_1A83A2000, v6, OS_LOG_TYPE_INFO, "deviceSupportedFeatures %{public}lu", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    CarGeneralLogging();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __55__CRFeatureAvailability_deviceSupportedCarPlayFeatures__block_invoke_2_cold_1();
  }

}

void __55__CRFeatureAvailability_deviceSupportedCarPlayFeatures__block_invoke_22(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CarGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __55__CRFeatureAvailability_deviceSupportedCarPlayFeatures__block_invoke_2_cold_1();

}

- (BOOL)disablesCarPlayFeatures:(unint64_t)a3 forVehicleIdentifier:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  char v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1;
  CarGeneralLogging();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[CRFeatureAvailability disablesCarPlayFeatures:forVehicleIdentifier:].cold.1((uint64_t)v6, a3, v7);

  -[CRFeatureAvailability serviceClient](self, "serviceClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__CRFeatureAvailability_disablesCarPlayFeatures_forVehicleIdentifier___block_invoke;
  v12[3] = &unk_1E5427F68;
  v15 = a3;
  v9 = v6;
  v13 = v9;
  v14 = &v16;
  objc_msgSend(v8, "performSynchronousServiceBlock:errorHandler:", v12, &__block_literal_global_25);

  v10 = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return v10;
}

uint64_t __70__CRFeatureAvailability_disablesCarPlayFeatures_forVehicleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, void *, void *);
  void *v6;

  v3 = MEMORY[0x1E0C809B0];
  v4 = 3221225472;
  v5 = __70__CRFeatureAvailability_disablesCarPlayFeatures_forVehicleIdentifier___block_invoke_2;
  v6 = &unk_1E5427F40;
  return objc_msgSend(a2, "disablesCarPlayFeatures:forVehicleIdentifier:reply:", MEMORY[0x1E0C809B0], 3221225472, __70__CRFeatureAvailability_disablesCarPlayFeatures_forVehicleIdentifier___block_invoke_2, &unk_1E5427F40, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __70__CRFeatureAvailability_disablesCarPlayFeatures_forVehicleIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  const __CFString *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "BOOLValue");
    CarGeneralLogging();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 40);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
        v8 = CFSTR("YES");
      else
        v8 = CFSTR("NO");
      v9 = 134349314;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_1A83A2000, v6, OS_LOG_TYPE_INFO, "disablesCarPlayFeatures %{public}lu: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    CarGeneralLogging();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __70__CRFeatureAvailability_disablesCarPlayFeatures_forVehicleIdentifier___block_invoke_2_cold_1();
  }

}

void __70__CRFeatureAvailability_disablesCarPlayFeatures_forVehicleIdentifier___block_invoke_24(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CarGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __70__CRFeatureAvailability_disablesCarPlayFeatures_forVehicleIdentifier___block_invoke_2_cold_1();

}

- (BOOL)setCarPlayFeatures:(unint64_t)a3 disabled:(BOOL)a4 forVehicleIdentifier:(id)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  BOOL v13;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  _BYTE *v18;
  unint64_t v19;
  BOOL v20;
  _BYTE buf[24];
  char v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  CarGeneralLogging();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349314;
    *(_QWORD *)&buf[4] = a3;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    _os_log_impl(&dword_1A83A2000, v9, OS_LOG_TYPE_DEFAULT, "CRFeatureAvailability setCarPlayFeaturesDisabled: %{public}lu vehicleID: %@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v22 = 0;
  -[CRFeatureAvailability serviceClient](self, "serviceClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__CRFeatureAvailability_setCarPlayFeatures_disabled_forVehicleIdentifier___block_invoke;
  v16[3] = &unk_1E5427F90;
  v19 = a3;
  v20 = a4;
  v12 = v8;
  v17 = v12;
  v18 = buf;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __74__CRFeatureAvailability_setCarPlayFeatures_disabled_forVehicleIdentifier___block_invoke_26;
  v15[3] = &unk_1E5427FB8;
  v15[4] = buf;
  objc_msgSend(v10, "performSynchronousServiceBlock:errorHandler:", v16, v15);

  v13 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
  _Block_object_dispose(buf, 8);

  return v13;
}

uint64_t __74__CRFeatureAvailability_setCarPlayFeatures_disabled_forVehicleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[5];

  v2 = *(unsigned __int8 *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__CRFeatureAvailability_setCarPlayFeatures_disabled_forVehicleIdentifier___block_invoke_2;
  v6[3] = &unk_1E5427EC8;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "setCarPlayFeatures:disabled:forVehicleIdentifier:reply:", v4, v2, v3, v6);
}

void __74__CRFeatureAvailability_setCarPlayFeatures_disabled_forVehicleIdentifier___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;

  v5 = a3;
  CarGeneralLogging();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __74__CRFeatureAvailability_setCarPlayFeatures_disabled_forVehicleIdentifier___block_invoke_2_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    v15 = 1;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __74__CRFeatureAvailability_setCarPlayFeatures_disabled_forVehicleIdentifier___block_invoke_2_cold_2();
    v15 = 0;
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v15;
}

void __74__CRFeatureAvailability_setCarPlayFeatures_disabled_forVehicleIdentifier___block_invoke_26(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  CarGeneralLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __74__CRFeatureAvailability_setCarPlayFeatures_disabled_forVehicleIdentifier___block_invoke_2_cold_2();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
}

- (unint64_t)supportedCarPlayFeaturesForSession:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  CarGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CRFeatureAvailability supportedCarPlayFeaturesForSession:].cold.1();

  objc_msgSend(v4, "MFiCertificateSerialNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRFeatureAvailability serviceClient](self, "serviceClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__CRFeatureAvailability_supportedCarPlayFeaturesForSession___block_invoke;
  v11[3] = &unk_1E5427FE0;
  v8 = v6;
  v12 = v8;
  v13 = &v14;
  objc_msgSend(v7, "performSynchronousServiceBlock:errorHandler:", v11, &__block_literal_global_28);

  v9 = v15[3];
  _Block_object_dispose(&v14, 8);

  return v9;
}

uint64_t __60__CRFeatureAvailability_supportedCarPlayFeaturesForSession___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__CRFeatureAvailability_supportedCarPlayFeaturesForSession___block_invoke_2;
  v4[3] = &unk_1E5427F18;
  v2 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "supportedCarPlayFeaturesForCertificateSerial:reply:", v2, v4);
}

void __60__CRFeatureAvailability_supportedCarPlayFeaturesForSession___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "unsignedIntegerValue");
    CarGeneralLogging();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      v8 = 134349056;
      v9 = v7;
      _os_log_impl(&dword_1A83A2000, v6, OS_LOG_TYPE_INFO, "supportedFeaturesForSession: %{public}lu", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    CarGeneralLogging();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __60__CRFeatureAvailability_supportedCarPlayFeaturesForSession___block_invoke_2_cold_1();
  }

}

void __60__CRFeatureAvailability_supportedCarPlayFeaturesForSession___block_invoke_27(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CarGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __60__CRFeatureAvailability_supportedCarPlayFeaturesForSession___block_invoke_27_cold_1();

}

- (id)supportedAirPlayFeaturesForVehicleIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  CarGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CRFeatureAvailability supportedAirPlayFeaturesForVehicleIdentifier:].cold.1();

  -[CRFeatureAvailability serviceClient](self, "serviceClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__CRFeatureAvailability_supportedAirPlayFeaturesForVehicleIdentifier___block_invoke;
  v12[3] = &unk_1E5427FE0;
  v7 = v4;
  v13 = v7;
  v14 = &v15;
  objc_msgSend(v6, "performSynchronousServiceBlock:errorHandler:", v12, &__block_literal_global_31);

  CarGeneralLogging();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = v16[5];
    *(_DWORD *)buf = 138543362;
    v22 = v9;
    _os_log_impl(&dword_1A83A2000, v8, OS_LOG_TYPE_INFO, "supportedAirPlayFeaturesForVehicleIdentifier: %{public}@", buf, 0xCu);
  }

  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

uint64_t __70__CRFeatureAvailability_supportedAirPlayFeaturesForVehicleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__CRFeatureAvailability_supportedAirPlayFeaturesForVehicleIdentifier___block_invoke_2;
  v4[3] = &unk_1E5428008;
  v2 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "supportedAirPlayFeaturesForVehicleIdentifier:reply:", v2, v4);
}

void __70__CRFeatureAvailability_supportedAirPlayFeaturesForVehicleIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }
  else
  {
    CarGeneralLogging();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __70__CRFeatureAvailability_supportedAirPlayFeaturesForVehicleIdentifier___block_invoke_2_cold_1();

  }
}

void __70__CRFeatureAvailability_supportedAirPlayFeaturesForVehicleIdentifier___block_invoke_30(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CarGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __70__CRFeatureAvailability_supportedAirPlayFeaturesForVehicleIdentifier___block_invoke_30_cold_1();

}

- (void)fetchSupportedAirPlayFeaturesForVehicleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  CarGeneralLogging();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CRFeatureAvailability fetchSupportedAirPlayFeaturesForVehicleIdentifier:completion:].cold.1();

  -[CRFeatureAvailability serviceClient](self, "serviceClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __86__CRFeatureAvailability_fetchSupportedAirPlayFeaturesForVehicleIdentifier_completion___block_invoke;
  v15[3] = &unk_1E5428058;
  v16 = v6;
  v17 = v7;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __86__CRFeatureAvailability_fetchSupportedAirPlayFeaturesForVehicleIdentifier_completion___block_invoke_32;
  v13[3] = &unk_1E5427E30;
  v14 = v17;
  v11 = v17;
  v12 = v6;
  objc_msgSend(v9, "performServiceBlock:errorHandler:", v15, v13);

}

void __86__CRFeatureAvailability_fetchSupportedAirPlayFeaturesForVehicleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __86__CRFeatureAvailability_fetchSupportedAirPlayFeaturesForVehicleIdentifier_completion___block_invoke_2;
  v4[3] = &unk_1E5428030;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "supportedAirPlayFeaturesForVehicleIdentifier:reply:", v3, v4);

}

void __86__CRFeatureAvailability_fetchSupportedAirPlayFeaturesForVehicleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  CarGeneralLogging();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __86__CRFeatureAvailability_fetchSupportedAirPlayFeaturesForVehicleIdentifier_completion___block_invoke_2_cold_2();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __70__CRFeatureAvailability_supportedAirPlayFeaturesForVehicleIdentifier___block_invoke_2_cold_1();
  }

  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);

}

void __86__CRFeatureAvailability_fetchSupportedAirPlayFeaturesForVehicleIdentifier_completion___block_invoke_32(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  CarGeneralLogging();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __70__CRFeatureAvailability_supportedAirPlayFeaturesForVehicleIdentifier___block_invoke_30_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

- (CRCarKitServiceClient)serviceClient
{
  return self->_serviceClient;
}

- (void)setServiceClient:(id)a3
{
  objc_storeStrong((id *)&self->_serviceClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceClient, 0);
}

- (void)isCarPlayAllowed
{
  OUTLINED_FUNCTION_4(&dword_1A83A2000, a1, a3, "CRFeatureAvailability isCarPlayAllowed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __41__CRFeatureAvailability_isCarPlayAllowed__block_invoke_19_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A83A2000, v0, v1, "isCarPlayAllowed call failed: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)deviceSupportedCarPlayFeatures
{
  OUTLINED_FUNCTION_4(&dword_1A83A2000, a1, a3, "CRFeatureAvailability deviceSupportedFeatures", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __55__CRFeatureAvailability_deviceSupportedCarPlayFeatures__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A83A2000, v0, v1, "deviceSupportedFeatures call failed: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)disablesCarPlayFeatures:(os_log_t)log forVehicleIdentifier:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134349314;
  v4 = a2;
  v5 = 2112;
  v6 = a1;
  _os_log_debug_impl(&dword_1A83A2000, log, OS_LOG_TYPE_DEBUG, "CRFeatureAvailability disablesCarPlayFeatures: %{public}lu vehicleID: %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __70__CRFeatureAvailability_disablesCarPlayFeatures_forVehicleIdentifier___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A83A2000, v0, v1, "disablesCarPlayFeatures call failed: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __74__CRFeatureAvailability_setCarPlayFeatures_disabled_forVehicleIdentifier___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1A83A2000, a1, a3, "setCarPlayFeaturesDisabled succeeded", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __74__CRFeatureAvailability_setCarPlayFeatures_disabled_forVehicleIdentifier___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A83A2000, v0, v1, "setCarPlayFeaturesDisabled call failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)supportedCarPlayFeaturesForSession:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1A83A2000, v0, v1, "CRFeatureAvailability supportedFeaturesForSession: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __60__CRFeatureAvailability_supportedCarPlayFeaturesForSession___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A83A2000, v0, v1, "supportedFeaturesForSession: call failed: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __60__CRFeatureAvailability_supportedCarPlayFeaturesForSession___block_invoke_27_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A83A2000, v0, v1, "supportedFeaturesForSession call failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)supportedAirPlayFeaturesForVehicleIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1A83A2000, v0, v1, "CRFeatureAvailability supportedAirPlayFeaturesForVehicleIdentifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __70__CRFeatureAvailability_supportedAirPlayFeaturesForVehicleIdentifier___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A83A2000, v0, v1, "supportedAirPlayFeaturesForVehicleIdentifier: call failed: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __70__CRFeatureAvailability_supportedAirPlayFeaturesForVehicleIdentifier___block_invoke_30_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A83A2000, v0, v1, "supportedAirPlayFeaturesForVehicleIdentifier call failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)fetchSupportedAirPlayFeaturesForVehicleIdentifier:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1A83A2000, v0, v1, "CRFeatureAvailability fetchSupportedAirPlayFeaturesForVehicleIdentifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __86__CRFeatureAvailability_fetchSupportedAirPlayFeaturesForVehicleIdentifier_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1A83A2000, v0, v1, "supportedAirPlayFeaturesForVehicleIdentifier: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
