@implementation DRSSystemProfile

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_8);
  return (id)sharedInstance_sharedProfile;
}

void __34__DRSSystemProfile_sharedInstance__block_invoke()
{
  DRSSystemProfile *v0;
  void *v1;
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(DRSSystemProfile);
  v1 = (void *)sharedInstance_sharedProfile;
  sharedInstance_sharedProfile = (uint64_t)v0;

  DPLogHandle_SystemProfile();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    objc_msgSend((id)sharedInstance_sharedProfile, "build");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)sharedInstance_sharedProfile, "buildVariant");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)sharedInstance_sharedProfile, "deviceCategory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)sharedInstance_sharedProfile, "deviceModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)sharedInstance_sharedProfile, "platformString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138546434;
    v9 = v3;
    v10 = 2114;
    v11 = v4;
    v12 = 2114;
    v13 = v5;
    v14 = 2114;
    v15 = v6;
    v16 = 2114;
    v17 = v7;
    v18 = 2050;
    v19 = objc_msgSend((id)sharedInstance_sharedProfile, "deviceHash");
    v20 = 1026;
    v21 = objc_msgSend((id)sharedInstance_sharedProfile, "isInternal");
    v22 = 1026;
    v23 = objc_msgSend((id)sharedInstance_sharedProfile, "isSeed");
    v24 = 1026;
    v25 = objc_msgSend((id)sharedInstance_sharedProfile, "isCarrier");
    v26 = 1026;
    v27 = objc_msgSend((id)sharedInstance_sharedProfile, "customerApprovesAnalytics");
    v28 = 1026;
    v29 = objc_msgSend((id)sharedInstance_sharedProfile, "isLogUploadEnabled");
    v30 = 1026;
    v31 = objc_msgSend((id)sharedInstance_sharedProfile, "isTaskingEnabled");
    v32 = 2050;
    v33 = objc_msgSend((id)sharedInstance_sharedProfile, "uploadSessionUploadCapBytes");
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SystemProfileSingleton", "build                       = %{public}@\nbuildVariant                = %{public}@\ndeviceCategory              = %{public}@\ndeviceModel                 = %{public}@\nplatformString              = %{public}@\ndeviceHash                  = %{public}#llx\nisInternal                  = %{public}u\nisSeed                      = %{public}u\nisCarrier                   = %{public}u\ncustomerApprovesAnalytics   = %{public}u\nisLogUploadEnabled          = %{public}u\nisTaskingEnabled            = %{public}u\nuploadSessionUploadCapBytes = %{public}llu\n", buf,
      0x6Cu);

  }
}

- (void)_populateDeviceCategory
{
  NSString *deviceCategory;
  __CFString *v4;

  switch(MGGetSInt32Answer())
  {
    case 1u:
      deviceCategory = self->_deviceCategory;
      v4 = CFSTR("iPhone");
      goto LABEL_12;
    case 2u:
      deviceCategory = self->_deviceCategory;
      v4 = CFSTR("iPod");
      goto LABEL_12;
    case 3u:
      deviceCategory = self->_deviceCategory;
      v4 = CFSTR("iPad");
      goto LABEL_12;
    case 4u:
      deviceCategory = self->_deviceCategory;
      v4 = CFSTR("AppleTV");
      goto LABEL_12;
    case 5u:
      deviceCategory = self->_deviceCategory;
      v4 = CFSTR("iFPGA");
      goto LABEL_12;
    case 6u:
      deviceCategory = self->_deviceCategory;
      v4 = CFSTR("Watch");
      goto LABEL_12;
    case 7u:
      deviceCategory = self->_deviceCategory;
      v4 = CFSTR("AudioAccessory");
      goto LABEL_12;
    case 8u:
      deviceCategory = self->_deviceCategory;
      v4 = CFSTR("Bridge");
      goto LABEL_12;
    case 9u:
      deviceCategory = self->_deviceCategory;
      v4 = CFSTR("Mac");
      goto LABEL_12;
    case 0xAu:
      deviceCategory = self->_deviceCategory;
      v4 = CFSTR("AppleDisplay");
LABEL_12:
      self->_deviceCategory = &v4->isa;

      break;
    default:
      return;
  }
}

- (void)_populateDeviceModel
{
  void *v3;
  void *v4;

  MGGetStringAnswer();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_storeStrong((id *)&self->_deviceModel, v3);
    v3 = v4;
  }

}

- (void)_populateCarrier
{
  const __CFString *v3;
  const __CFString *v4;

  self->_isCarrierVal = 0;
  if (!-[DRSSystemProfile isInternal](self, "isInternal"))
  {
    v3 = (const __CFString *)MGGetStringAnswer();
    if (v3)
    {
      v4 = v3;
      self->_isCarrierVal = CFStringCompare(v3, CFSTR("Carrier"), 0) == kCFCompareEqualTo;
      CFRelease(v4);
    }
  }
}

- (void)_populateBuild
{
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  NSObject *v5;
  id obj;
  uint8_t buf[16];

  v3 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  if (v3)
  {
    v4 = v3;
    CFDictionaryGetValue(v3, (const void *)*MEMORY[0x1E0C9AB90]);
    obj = (id)objc_claimAutoreleasedReturnValue();
    if (obj)
      objc_storeStrong((id *)&self->_build, obj);
    CFRelease(v4);

  }
  else
  {
    DPLogHandle_SystemProfileError();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "OsVersionReadFailure", "Could not fetch OS version using _CFCopySystemVersionDictionary", buf, 2u);
    }

  }
}

+ (id)SHA256DigestForString:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  const void *v6;
  CC_LONG v7;
  id v8;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v3);
  v6 = (const void *)objc_msgSend(v5, "bytes");
  v7 = objc_msgSend(v5, "length");
  v8 = objc_retainAutorelease(v4);
  CC_SHA256(v6, v7, (unsigned __int8 *)objc_msgSend(v8, "mutableBytes"));

  return v8;
}

+ (unint64_t)hashForSHA256Digest:(id)a3
{
  id v3;
  id v4;
  uint64_t *v5;
  unsigned int v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  NSObject *v10;

  v3 = a3;
  if (objc_msgSend(v3, "length") != 32)
  {
    DPLogHandle_SystemProfileError();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      +[DRSSystemProfile hashForSHA256Digest:].cold.1(v3, v10);

    goto LABEL_9;
  }
  v4 = objc_retainAutorelease(v3);
  v5 = (uint64_t *)objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");
  v7 = (v6 >> 3);
  if (!(v6 >> 3))
  {
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  v8 = 0;
  do
  {
    v9 = *v5++;
    v8 ^= v9;
    --v7;
  }
  while (v7);
LABEL_10:

  return v8;
}

- (void)_populateDeviceHash
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1DBB92000, log, OS_LOG_TYPE_FAULT, "Failed to lookup 'kMGQUniqueDeviceID'", v1, 2u);
}

- (NSString)platformString
{
  unsigned int v2;

  v2 = -[DRSSystemProfile platform](self, "platform");
  if (v2 > 6)
    return (NSString *)CFSTR("Unknown");
  else
    return &off_1EA3D1DF0[(char)v2]->isa;
}

- (void)_populatePlatform
{
  self->_platform = 2;
}

- (NSString)buildVariant
{
  return (NSString *)DRSSystemProfileVariantStringForParameters(-[DRSSystemProfile isInternal](self, "isInternal"), -[DRSSystemProfile isSeed](self, "isSeed"), -[DRSSystemProfile isCarrier](self, "isCarrier"));
}

- (void)_populateBuildVariant
{
  self->_isInternalVal = os_variant_has_internal_diagnostics();
  self->_isSeedVal = 0;
  -[DRSSystemProfile _populateCarrier](self, "_populateCarrier");
}

- (BOOL)isSeed
{
  if (-[DRSSystemProfile allowsBuildVariantOverride](self, "allowsBuildVariantOverride"))
    return -[DRSSystemProfile overridingIsSeed](self, "overridingIsSeed");
  else
    return -[DRSSystemProfile isSeedVal](self, "isSeedVal");
}

- (BOOL)isInternal
{
  if (-[DRSSystemProfile allowsBuildVariantOverride](self, "allowsBuildVariantOverride"))
    return -[DRSSystemProfile overridingIsInternal](self, "overridingIsInternal");
  else
    return -[DRSSystemProfile isInternalVal](self, "isInternalVal");
}

- (BOOL)isCarrier
{
  if (-[DRSSystemProfile allowsBuildVariantOverride](self, "allowsBuildVariantOverride"))
    return -[DRSSystemProfile overridingIsCarrier](self, "overridingIsCarrier");
  else
    return -[DRSSystemProfile isCarrierVal](self, "isCarrierVal");
}

- (BOOL)customerApprovesAnalytics
{
  if (-[DRSSystemProfile allowsCustomerAnalyticsOverride](self, "allowsCustomerAnalyticsOverride"))
    return -[DRSSystemProfile overridingCustomerApprovesAnalyticsValue](self, "overridingCustomerApprovesAnalyticsValue");
  else
    return DiagnosticLogSubmissionEnabled();
}

- (DRSSystemProfile)init
{
  DRSSystemProfile *v2;
  DRSSystemProfile *v3;
  NSString *build;
  NSString *deviceModel;
  NSString *deviceCategory;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DRSSystemProfile;
  v2 = -[DRSSystemProfile init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    build = v2->_build;
    v2->_build = (NSString *)CFSTR("Unknown");

    deviceModel = v3->_deviceModel;
    v3->_deviceModel = (NSString *)CFSTR("Unknown");

    deviceCategory = v3->_deviceCategory;
    v3->_deviceCategory = (NSString *)CFSTR("Unknown");

    -[DRSSystemProfile _populateBuildVariant](v3, "_populateBuildVariant");
    -[DRSSystemProfile _populateBuild](v3, "_populateBuild");
    -[DRSSystemProfile _populateDeviceModel](v3, "_populateDeviceModel");
    -[DRSSystemProfile _populateDeviceCategory](v3, "_populateDeviceCategory");
    -[DRSSystemProfile _populatePlatform](v3, "_populatePlatform");
    -[DRSSystemProfile _populateDeviceHash](v3, "_populateDeviceHash");
  }
  return v3;
}

- (BOOL)isLogUploadEnabled
{
  _BOOL4 v3;

  v3 = -[DRSSystemProfile customerApprovesAnalytics](self, "customerApprovesAnalytics");
  if (v3)
    LOBYTE(v3) = !-[DRSSystemProfile hasForbiddenAutomatedDeviceGroup](self, "hasForbiddenAutomatedDeviceGroup");
  return v3;
}

- (BOOL)isTaskingEnabled
{
  _BOOL4 v3;
  _BOOL4 v4;
  NSObject *v5;
  _DWORD v7[2];
  __int16 v8;
  _BOOL4 v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = -[DRSSystemProfile customerApprovesAnalytics](self, "customerApprovesAnalytics");
  if (v3)
    v4 = !-[DRSSystemProfile isCarrier](self, "isCarrier");
  else
    v4 = 0;
  DPLogHandle_SystemProfile();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    v7[0] = 67240704;
    v7[1] = v3;
    v8 = 1026;
    v9 = -[DRSSystemProfile isCarrier](self, "isCarrier");
    v10 = 1026;
    v11 = v4;
    _os_signpost_emit_with_name_impl(&dword_1DBB92000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "IsTaskingEnabledDetails", "customerApprovesAnalytics = %{public}u isCarrier = %{public}u isTaskingEnabled = %{public}u", (uint8_t *)v7, 0x14u);
  }

  return v4;
}

- (unint64_t)uploadSessionUploadCapBytes
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__DRSSystemProfile_uploadSessionUploadCapBytes__block_invoke;
  block[3] = &unk_1EA3D1208;
  block[4] = self;
  if (uploadSessionUploadCapBytes_onceToken_0 != -1)
    dispatch_once(&uploadSessionUploadCapBytes_onceToken_0, block);
  return uploadSessionUploadCapBytes_cap_0;
}

uint64_t __47__DRSSystemProfile_uploadSessionUploadCapBytes__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "isInternal");
  if ((result & 1) != 0)
  {
    v3 = 0x140000000;
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isSeed");
    v3 = 0x8000000;
    if ((_DWORD)result)
      v3 = 0x40000000;
  }
  uploadSessionUploadCapBytes_cap_0 = v3;
  return result;
}

- (NSString)automatedDeviceGroup
{
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  if (automatedDeviceGroup_onceToken != -1)
    dispatch_once(&automatedDeviceGroup_onceToken, &__block_literal_global_56);
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__DRSSystemProfile_automatedDeviceGroup__block_invoke_58;
  v5[3] = &unk_1EA3D1DD0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)automatedDeviceGroup_automatedDeviceGroupSyncQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __40__DRSSystemProfile_automatedDeviceGroup__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("DRSSystemProfile automated device group sync queue", 0);
  v1 = (void *)automatedDeviceGroup_automatedDeviceGroupSyncQueue;
  automatedDeviceGroup_automatedDeviceGroupSyncQueue = (uint64_t)v0;

}

void __40__DRSSystemProfile_automatedDeviceGroup__block_invoke_58(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  double v13;
  NSObject *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  int v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "allowsAutomatedDeviceGroupOverride");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "overridingAutomatedDeviceGroup");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    DPLogHandle_SystemProfile();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v7))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v21 = 138543362;
      v22 = v8;
      v9 = "AutomatedDeviceGroupOverridden";
      v10 = "Got an overridden value: '%{public}@'";
      v11 = v7;
      v12 = 12;
LABEL_10:
      _os_signpost_emit_with_name_impl(&dword_1DBB92000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v9, v10, (uint8_t *)&v21, v12);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if ((objc_msgSend(v3, "isInternal") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    if (v13 - *(double *)&automatedDeviceGroup_lastQueryTimestamp >= 60.0)
    {
      automatedDeviceGroup_lastQueryTimestamp = *(_QWORD *)&v13;
      objc_msgSend(MEMORY[0x1E0D64EE0], "automatedDeviceGroup");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)automatedDeviceGroup_automatedDeviceGroup;
      automatedDeviceGroup_automatedDeviceGroup = v17;

      DPLogHandle_SystemProfile();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v14))
      {
        v21 = 138543362;
        v22 = automatedDeviceGroup_automatedDeviceGroup;
        v15 = "AutomatedDeviceGroupLookup";
        v16 = "Got a new automated device group: '%{public}@'";
        goto LABEL_13;
      }
    }
    else
    {
      DPLogHandle_SystemProfile();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v14))
      {
        v21 = 134217984;
        v22 = 0x404E000000000000;
        v15 = "AutomatedDeviceGroupLookupHysteresis";
        v16 = "Skipping fresh lookup due to hysteresis of %.2fsec";
LABEL_13:
        _os_signpost_emit_with_name_impl(&dword_1DBB92000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v15, v16, (uint8_t *)&v21, 0xCu);
      }
    }

    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v20 = (id)automatedDeviceGroup_automatedDeviceGroup;
    v7 = *(NSObject **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v20;
    goto LABEL_15;
  }
  DPLogHandle_SystemProfile();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    LOWORD(v21) = 0;
    v9 = "AutomatedDeviceGroupSkipped";
    v10 = "Skipping automated device group lookup since we are not 'Internal'";
    v11 = v7;
    v12 = 2;
    goto LABEL_10;
  }
LABEL_15:

}

- (BOOL)hasForbiddenAutomatedDeviceGroup
{
  return 0;
}

- (NSString)build
{
  return self->_build;
}

- (NSString)deviceCategory
{
  return self->_deviceCategory;
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (unint64_t)deviceHash
{
  return self->_deviceHash;
}

- (unsigned)platform
{
  return self->_platform;
}

- (BOOL)allowsCustomerAnalyticsOverride
{
  return self->_allowsCustomerAnalyticsOverride;
}

- (void)setAllowsCustomerAnalyticsOverride:(BOOL)a3
{
  self->_allowsCustomerAnalyticsOverride = a3;
}

- (BOOL)allowsBuildVariantOverride
{
  return self->_allowsBuildVariantOverride;
}

- (void)setAllowsBuildVariantOverride:(BOOL)a3
{
  self->_allowsBuildVariantOverride = a3;
}

- (BOOL)allowsAutomatedDeviceGroupOverride
{
  return self->_allowsAutomatedDeviceGroupOverride;
}

- (void)setAllowsAutomatedDeviceGroupOverride:(BOOL)a3
{
  self->_allowsAutomatedDeviceGroupOverride = a3;
}

- (BOOL)overridingCustomerApprovesAnalyticsValue
{
  return self->_overridingCustomerApprovesAnalyticsValue;
}

- (void)setOverridingCustomerApprovesAnalyticsValue:(BOOL)a3
{
  self->_overridingCustomerApprovesAnalyticsValue = a3;
}

- (BOOL)overridingIsCarrier
{
  return self->_overridingIsCarrier;
}

- (void)setOverridingIsCarrier:(BOOL)a3
{
  self->_overridingIsCarrier = a3;
}

- (BOOL)overridingIsSeed
{
  return self->_overridingIsSeed;
}

- (void)setOverridingIsSeed:(BOOL)a3
{
  self->_overridingIsSeed = a3;
}

- (BOOL)overridingIsInternal
{
  return self->_overridingIsInternal;
}

- (void)setOverridingIsInternal:(BOOL)a3
{
  self->_overridingIsInternal = a3;
}

- (NSString)overridingAutomatedDeviceGroup
{
  return self->_overridingAutomatedDeviceGroup;
}

- (void)setOverridingAutomatedDeviceGroup:(id)a3
{
  objc_storeStrong((id *)&self->_overridingAutomatedDeviceGroup, a3);
}

- (NSData)deviceSHA256Digest
{
  return self->_deviceSHA256Digest;
}

- (BOOL)isInternalVal
{
  return self->_isInternalVal;
}

- (BOOL)isSeedVal
{
  return self->_isSeedVal;
}

- (BOOL)isCarrierVal
{
  return self->_isCarrierVal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceSHA256Digest, 0);
  objc_storeStrong((id *)&self->_overridingAutomatedDeviceGroup, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_deviceCategory, 0);
  objc_storeStrong((id *)&self->_build, 0);
}

+ (void)hashForSHA256Digest:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = objc_msgSend(a1, "length");
  v5 = 1024;
  v6 = 32;
  _os_log_fault_impl(&dword_1DBB92000, a2, OS_LOG_TYPE_FAULT, "Attempted to generate a hash from a digest of unexpected length %lu (expected %d)", (uint8_t *)&v3, 0x12u);
}

@end
