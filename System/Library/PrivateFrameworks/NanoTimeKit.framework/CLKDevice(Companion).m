@implementation CLKDevice(Companion)

+ (void)setBridgeActiveNRDevice:()Companion
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int HasCapabilityForString;
  void *v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nrDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D51730];
  objc_msgSend(v6, "valueForProperty:", *MEMORY[0x1E0D51730]);
  v8 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "valueForProperty:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  CLKLoggingObjectForDomain();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138412546;
    v24 = v8;
    v25 = 2112;
    v26 = v9;
    _os_log_impl(&dword_1B72A3000, v10, OS_LOG_TYPE_DEFAULT, "+[CLKDevice setActiveDevice:] - current %@ new %@", (uint8_t *)&v23, 0x16u);
  }

  if (v8 | v9 || (objc_msgSend(v5, "isBridgeActive") & 1) != 0)
  {
    if (objc_msgSend(v5, "isBridgeActive"))
    {
      objc_msgSend(v5, "nrDevice");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      if (!v4 || v11)
      {
        objc_msgSend(v5, "nrDevice");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (!v4 && v13 || v4 && (objc_msgSend((id)v9, "isEqual:", v8) & 1) == 0)
        {

        }
        else
        {
          HasCapabilityForString = BPSDeviceHasCapabilityForString();
          objc_msgSend(v5, "nrDevice");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = BPSDeviceHasCapabilityForString();

          if (HasCapabilityForString == v17)
            goto LABEL_21;
        }
      }
    }
    CLKLoggingObjectForDomain();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138412290;
      v24 = (uint64_t)v4;
      _os_log_impl(&dword_1B72A3000, v19, OS_LOG_TYPE_DEFAULT, "updating to new device %@", (uint8_t *)&v23, 0xCu);
    }

    objc_msgSend(a1, "deviceForNRDevice:forced:", v4, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setIsBridgeActive:", 1);
    objc_msgSend(a1, "setCurrentDevice:", v20);
    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDevice:", v20);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "postNotificationName:object:", *MEMORY[0x1E0C93E48], 0);

  }
  else
  {
    CLKLoggingObjectForDomain();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_1B72A3000, v18, OS_LOG_TYPE_DEFAULT, "no device is currently paired", (uint8_t *)&v23, 2u);
    }

    objc_msgSend(v5, "setIsBridgeActive:", 1);
  }
LABEL_21:

}

- (uint64_t)isRadioPhoneComplicationEnabled
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "nrDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 1;
  objc_getAssociatedObject(a1, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend(v5, "BOOLValue");
  }
  else
  {
    objc_msgSend(a1, "nrDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("FC61CF95-E168-468C-ABD5-9311FF689760"));
    v6 = objc_msgSend(v7, "supportsCapability:", v8);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, a2, v9, (void *)0x303);

  }
  return v6;
}

- (uint64_t)isEcgPhoneComplicationEnabled
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "nrDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  objc_getAssociatedObject(a1, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend(v5, "BOOLValue");
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB67B0];
    objc_msgSend(a1, "nrDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isElectrocardiogramSupportedOnWatch:", v8);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, a2, v9, (void *)0x303);

  }
  return v6;
}

- (uint64_t)canCustomize
{
  void *v1;
  uint64_t HasCapabilityForString;

  objc_msgSend(a1, "nrDevice");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HasCapabilityForString = BPSDeviceHasCapabilityForString();

  return HasCapabilityForString;
}

@end
