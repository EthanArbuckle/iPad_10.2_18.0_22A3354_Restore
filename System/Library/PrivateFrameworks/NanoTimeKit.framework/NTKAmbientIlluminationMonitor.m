@implementation NTKAmbientIlluminationMonitor

- (NTKAmbientIlluminationMonitor)init
{
  NTKAmbientIlluminationMonitor *v2;
  BrightnessSystemClient *v3;
  BrightnessSystemClient *brightnessSystemClient;
  NSObject *v5;
  objc_super v7;
  uint8_t buf[4];
  NTKAmbientIlluminationMonitor *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)NTKAmbientIlluminationMonitor;
  v2 = -[NTKAmbientIlluminationMonitor init](&v7, sel_init);
  if (v2)
  {
    v3 = (BrightnessSystemClient *)objc_alloc_init(MEMORY[0x1E0D15710]);
    brightnessSystemClient = v2->_brightnessSystemClient;
    v2->_brightnessSystemClient = v3;

    _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v9 = v2;
      _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode Illumination monitor init", buf, 0xCu);
    }

  }
  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  NTKAmbientIlluminationMonitor *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode Illumination monitor dealloc", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)NTKAmbientIlluminationMonitor;
  -[NTKAmbientIlluminationMonitor dealloc](&v4, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    if (obj)
    {
      v6 = objc_loadWeakRetained((id *)&self->_delegate);

      if (!v6)
        -[NTKAmbientIlluminationMonitor _registerForNotifications](self, "_registerForNotifications");
    }
    else
    {
      -[NTKAmbientIlluminationMonitor _unregisterForNotifications](self, "_unregisterForNotifications");
    }
    objc_storeWeak((id *)&self->_delegate, obj);
    v5 = obj;
  }

}

- (void)_registerForNotifications
{
  BrightnessSystemClient *brightnessSystemClient;
  void *v4;
  NSObject *v5;
  double v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *);
  void *v21;
  id v22;
  id location;
  uint8_t buf[4];
  NTKAmbientIlluminationMonitor *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  brightnessSystemClient = self->_brightnessSystemClient;
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __58__NTKAmbientIlluminationMonitor__registerForNotifications__block_invoke;
  v21 = &unk_1E6BCEE00;
  objc_copyWeak(&v22, &location);
  -[BrightnessSystemClient registerNotificationBlock:forProperties:](brightnessSystemClient, "registerNotificationBlock:forProperties:", &v18, &unk_1E6CA8B78);
  v4 = (void *)-[BrightnessSystemClient copyPropertyForKey:](self->_brightnessSystemClient, "copyPropertyForKey:", CFSTR("TrustedLux"), v18, v19, v20, v21);
  _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v25 = self;
    v26 = 2112;
    v27 = v4;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode Illumination monitor initial lux %@", buf, 0x16u);
  }

  if (v4)
    objc_msgSend(v4, "doubleValue");
  else
    v6 = -1.0;
  self->_ambientLux = v6;
  v7 = (void *)-[BrightnessSystemClient copyPropertyForKey:](self->_brightnessSystemClient, "copyPropertyForKey:", CFSTR("DisplayBrightness"));
  v8 = objc_opt_class();
  v9 = v7;
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  objc_msgSend(v11, "objectForKey:", CFSTR("NitsPhysical"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_class();
  v14 = v12;
  if (v13)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
  }
  else
  {
    v15 = 0;
  }
  v16 = v15;

  if (v16)
    objc_msgSend(v16, "doubleValue");
  else
    v17 = -1.0;
  self->_displayNits = v17;

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __58__NTKAmbientIlluminationMonitor__registerForNotifications__block_invoke(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  id v6;
  double *WeakRetained;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  double v19;
  double v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  NSObject *v29;
  double v30;
  double v31;
  double v32;
  BOOL v33;
  double v34;
  double v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  uint8_t buf[4];
  double *v41;
  __int16 v42;
  NSObject *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (-[NSObject isEqualToString:](v5, "isEqualToString:", CFSTR("TrustedLux")))
    {
      v8 = objc_opt_class();
      v9 = v6;
      if (v8)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = v9;
        else
          v10 = 0;
      }
      else
      {
        v10 = 0;
      }
      v14 = v10;

      if (!v14)
        goto LABEL_59;
      -[NSObject doubleValue](v14, "doubleValue");
      v16 = WeakRetained[3];
      v17 = fabs(v15);
      v18 = v17 < 0.00000011920929;
      v19 = fabs(v16);
      if (v19 >= 0.00000011920929)
        v18 = 0;
      if (v17 < 0.00000011920929 || v19 < 0.00000011920929)
        goto LABEL_30;
      v18 = v15 == -1.0;
      if (v16 != -1.0)
        v18 = 0;
      if (v15 == -1.0 || v16 == -1.0)
      {
LABEL_30:
        if (!v18)
        {
LABEL_27:
          _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v22 = (void *)*((_QWORD *)WeakRetained + 2);
            *(_DWORD *)buf = 134218498;
            v41 = WeakRetained;
            v42 = 2112;
            v43 = v14;
            v44 = 2048;
            v45 = v22;
            _os_log_impl(&dword_1B72A3000, v21, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode Illumination monitor received lux %@ (skipped %lu)", buf, 0x20u);
          }

          WeakRetained[2] = 0.0;
          -[NSObject doubleValue](v14, "doubleValue");
          *((_QWORD *)WeakRetained + 3) = v23;
          goto LABEL_32;
        }
      }
      else
      {
        v20 = v15 / v16 + -1.0;
        if (v20 < 0.0)
          v20 = -v20;
        if (v20 >= 0.05)
          goto LABEL_27;
      }
      ++*((_QWORD *)WeakRetained + 2);
LABEL_32:
      v14 = v14;
      BSDispatchMain();

      goto LABEL_59;
    }
    if (!-[NSObject isEqualToString:](v5, "isEqualToString:", CFSTR("DisplayBrightness")))
    {
      _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218498;
        v41 = WeakRetained;
        v42 = 2112;
        v43 = v5;
        v44 = 2112;
        v45 = v6;
        _os_log_impl(&dword_1B72A3000, v14, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode Illumination monitor received key %@ with value %@", buf, 0x20u);
      }
      goto LABEL_59;
    }
    v11 = objc_opt_class();
    v12 = v6;
    if (v11)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
    }
    else
    {
      v13 = 0;
    }
    v14 = v13;

    -[NSObject objectForKey:](v14, "objectForKey:", CFSTR("NitsPhysical"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
LABEL_59:

      goto LABEL_60;
    }
    -[NSObject objectForKey:](v14, "objectForKey:", CFSTR("NitsPhysical"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_opt_class();
    v27 = v25;
    if (v26)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v28 = v27;
      else
        v28 = 0;
    }
    else
    {
      v28 = 0;
    }
    v29 = v28;

    if (!v29)
    {
LABEL_58:

      goto LABEL_59;
    }
    -[NSObject doubleValue](v29, "doubleValue");
    v31 = WeakRetained[5];
    v32 = fabs(v30);
    v33 = v32 < 0.00000011920929;
    v34 = fabs(v31);
    if (v34 >= 0.00000011920929)
      v33 = 0;
    if (v32 < 0.00000011920929 || v34 < 0.00000011920929)
      goto LABEL_55;
    v33 = v30 == -1.0;
    if (v31 != -1.0)
      v33 = 0;
    if (v30 == -1.0 || v31 == -1.0)
    {
LABEL_55:
      if (!v33)
      {
LABEL_52:
        _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          v37 = (void *)*((_QWORD *)WeakRetained + 4);
          *(_DWORD *)buf = 134218498;
          v41 = WeakRetained;
          v42 = 2112;
          v43 = v29;
          v44 = 2048;
          v45 = v37;
          _os_log_impl(&dword_1B72A3000, v36, OS_LOG_TYPE_DEFAULT, "[%p] AutoNightMode Illumination monitor received nits %@ (skipped %lu)", buf, 0x20u);
        }

        WeakRetained[4] = 0.0;
        -[NSObject doubleValue](v29, "doubleValue");
        *((_QWORD *)WeakRetained + 5) = v38;
        goto LABEL_57;
      }
    }
    else
    {
      v35 = v30 / v31 + -1.0;
      if (v35 < 0.0)
        v35 = -v35;
      if (v35 >= 0.1)
        goto LABEL_52;
    }
    ++*((_QWORD *)WeakRetained + 4);
LABEL_57:
    v39 = v29;
    BSDispatchMain();

    goto LABEL_58;
  }
LABEL_60:

}

uint64_t __58__NTKAmbientIlluminationMonitor__registerForNotifications__block_invoke_5(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "doubleValue");
  return objc_msgSend(v1, "_setAmbientLux:");
}

uint64_t __58__NTKAmbientIlluminationMonitor__registerForNotifications__block_invoke_12(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "doubleValue");
  return objc_msgSend(v1, "_setDisplayNits:");
}

- (void)_unregisterForNotifications
{
  -[BrightnessSystemClient unregisterNotificationForKey:](self->_brightnessSystemClient, "unregisterNotificationForKey:", CFSTR("TrustedLux"));
}

- (void)_setAmbientLux:(double)a3
{
  NSObject *v5;
  id WeakRetained;
  id v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  self->_ambientLux = a3;
  if (a3 < 0.0)
  {
    _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "AutoNightMode negative ambient lux", buf, 2u);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "ambientIlluminationMonitor:receivedAmbientLux:", self, a3);

  v7 = objc_loadWeakRetained((id *)&self->_delegate);
  if (!v7)
  {
    _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "AutoNightMode delegate is gone", v9, 2u);
    }

  }
}

- (void)_setDisplayNits:(double)a3
{
  NTKAmbientIlluminationMonitorDelegate **p_delegate;
  id WeakRetained;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  self->_displayNits = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "ambientIlluminationMonitor:receivedDisplayNits:", self, a3);

  v7 = objc_loadWeakRetained((id *)p_delegate);
  if (!v7)
  {
    _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "AutoNightMode delegate is gone", v9, 2u);
    }

  }
}

- (double)ambientLux
{
  return self->_ambientLux;
}

- (double)displayNits
{
  return self->_displayNits;
}

- (NTKAmbientIlluminationMonitorDelegate)delegate
{
  return (NTKAmbientIlluminationMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_brightnessSystemClient, 0);
}

@end
