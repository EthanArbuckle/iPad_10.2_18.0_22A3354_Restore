@implementation HMDConfigurationMessageFilter

+ (int64_t)filterMessage:(id)a3 withPolicies:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  int64_t v15;

  v7 = a3;
  v8 = a4;
  if (!v7)
    goto LABEL_6;
  +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "supportsCloudDataSync");

  if (!v10)
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0D28690], "productInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "productPlatform") != 4
    || (objc_msgSend(v7, "proxyConnection"), (v12 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v15 = 0;
LABEL_13:

    goto LABEL_14;
  }
  v13 = (void *)v12;
  v14 = objc_msgSend(v7, "isEntitledForSPIAccess");

  if ((v14 & 1) == 0)
  {
LABEL_7:
    objc_msgSend(v8, "hmf_objectPassingTest:", &__block_literal_global_70255);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "operationTypes"))
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 48, CFSTR("Operation not supported"), CFSTR("Configuration changes not supported"), 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      v15 = -1;
    }
    else
    {
      v15 = 1;
    }
    goto LABEL_13;
  }
LABEL_6:
  v15 = 0;
LABEL_14:

  return v15;
}

uint64_t __66__HMDConfigurationMessageFilter_filterMessage_withPolicies_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
