@implementation HMDSiriEndpointProfileFields

- (HMDSiriEndpointProfileFields)initWithNeedsOnboardingField:(id)a3 supportsOnboardingField:(id)a4 siriEnableField:(id)a5 siriListeningField:(id)a6 siriTouchToUseField:(id)a7 siriLightOnUseField:(id)a8 siriSoundOnUseField:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  HMDSiriEndpointProfileFields *v24;
  HMDSiriEndpointProfileFields *v25;
  HMDSiriEndpointProfileFields *v27;
  SEL v28;
  id obj;
  id v30;
  id v31;
  id v32;
  objc_super v33;

  v16 = a3;
  v17 = a4;
  obj = a5;
  v18 = a5;
  v30 = a6;
  v19 = a6;
  v31 = a7;
  v20 = a7;
  v32 = a8;
  v21 = a8;
  v22 = a9;
  if (!v16)
  {
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v17)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v18)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v19)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v20)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (!v21)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  v23 = v22;
  if (!v22)
  {
LABEL_17:
    v27 = (HMDSiriEndpointProfileFields *)_HMFPreconditionFailure();
    return (HMDSiriEndpointProfileFields *)-[HMDSiriEndpointProfileFields serializeFields](v27, v28);
  }
  v33.receiver = self;
  v33.super_class = (Class)HMDSiriEndpointProfileFields;
  v24 = -[HMDSiriEndpointProfileFields init](&v33, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_needsOnboardingField, a3);
    objc_storeStrong((id *)&v25->_supportsOnboardingField, a4);
    objc_storeStrong((id *)&v25->_isSiriEnableField, obj);
    objc_storeStrong((id *)&v25->_isSiriListeningField, v30);
    objc_storeStrong((id *)&v25->_siriTouchToUseField, v31);
    objc_storeStrong((id *)&v25->_siriLightOnUseField, v32);
    objc_storeStrong((id *)&v25->_siriSoundOnUseField, a9);
  }

  return v25;
}

- (id)serializeFields
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[7];
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("needsOnboarding");
  -[HMDSiriEndpointProfileFields needsOnboardingField](self, "needsOnboardingField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v12[1] = CFSTR("supportsOnboarding");
  -[HMDSiriEndpointProfileFields supportsOnboardingField](self, "supportsOnboardingField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  v12[2] = CFSTR("isSiriEnable");
  -[HMDSiriEndpointProfileFields isSiriEnableField](self, "isSiriEnableField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  v12[3] = CFSTR("isSiriListening");
  -[HMDSiriEndpointProfileFields isSiriListeningField](self, "isSiriListeningField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v6;
  v12[4] = CFSTR("siriTouchToUse");
  -[HMDSiriEndpointProfileFields siriTouchToUseField](self, "siriTouchToUseField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v7;
  v12[5] = CFSTR("siriLightOnUse");
  -[HMDSiriEndpointProfileFields siriLightOnUseField](self, "siriLightOnUseField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v8;
  v12[6] = CFSTR("siriSoundOnUse");
  -[HMDSiriEndpointProfileFields siriSoundOnUseField](self, "siriSoundOnUseField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[6] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)attributeDescriptions
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[8];

  v26[7] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDSiriEndpointProfileFields needsOnboardingField](self, "needsOnboardingField");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("needsOnboarding"), v25);
  v26[0] = v24;
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDSiriEndpointProfileFields supportsOnboardingField](self, "supportsOnboardingField");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("supportsOnboarding"), v23);
  v26[1] = v22;
  v5 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDSiriEndpointProfileFields isSiriEnableField](self, "isSiriEnableField");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("isSiriEnable"), v21);
  v26[2] = v6;
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDSiriEndpointProfileFields isSiriListeningField](self, "isSiriListeningField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("isSiriListening"), v8);
  v26[3] = v9;
  v10 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDSiriEndpointProfileFields siriTouchToUseField](self, "siriTouchToUseField");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("siriTouchToUse"), v11);
  v26[4] = v12;
  v13 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDSiriEndpointProfileFields siriLightOnUseField](self, "siriLightOnUseField");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("siriLightOnUse"), v14);
  v26[5] = v15;
  v16 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDSiriEndpointProfileFields siriSoundOnUseField](self, "siriSoundOnUseField");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithName:value:", CFSTR("siriSoundOnUse"), v17);
  v26[6] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (NSString)needsOnboardingField
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)supportsOnboardingField
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)isSiriEnableField
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)isSiriListeningField
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)siriTouchToUseField
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)siriLightOnUseField
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)siriSoundOnUseField
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriSoundOnUseField, 0);
  objc_storeStrong((id *)&self->_siriLightOnUseField, 0);
  objc_storeStrong((id *)&self->_siriTouchToUseField, 0);
  objc_storeStrong((id *)&self->_isSiriListeningField, 0);
  objc_storeStrong((id *)&self->_isSiriEnableField, 0);
  objc_storeStrong((id *)&self->_supportsOnboardingField, 0);
  objc_storeStrong((id *)&self->_needsOnboardingField, 0);
}

@end
