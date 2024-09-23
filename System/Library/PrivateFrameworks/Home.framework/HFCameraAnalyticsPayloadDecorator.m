@implementation HFCameraAnalyticsPayloadDecorator

+ (id)sharedDecorator
{
  if (qword_1ED3790E0 != -1)
    dispatch_once(&qword_1ED3790E0, &__block_literal_global_91);
  return (id)_MergedGlobals_251;
}

void __52__HFCameraAnalyticsPayloadDecorator_sharedDecorator__block_invoke()
{
  HFCameraAnalyticsPayloadDecorator *v0;
  void *v1;

  v0 = objc_alloc_init(HFCameraAnalyticsPayloadDecorator);
  v1 = (void *)_MergedGlobals_251;
  _MergedGlobals_251 = (uint64_t)v0;

}

- (HFCameraAnalyticsPayloadDecorator)init
{
  HFCameraAnalyticsPayloadDecorator *v2;
  uint64_t v3;
  NSMutableDictionary *additionalPayload;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HFCameraAnalyticsPayloadDecorator;
  v2 = -[HFCameraAnalyticsPayloadDecorator init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    additionalPayload = v2->_additionalPayload;
    v2->_additionalPayload = (NSMutableDictionary *)v3;

    -[HFCameraAnalyticsPayloadDecorator _initialiseAdditionalPayload](v2, "_initialiseAdditionalPayload");
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addHomeManagerObserver:", v2);
    objc_msgSend(v5, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "home");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCameraAnalyticsPayloadDecorator _updateHomeInformation:](v2, "_updateHomeInformation:", v7);

    }
  }
  return v2;
}

- (void)_initialiseAdditionalPayloadForNewHome
{
  void *v3;
  id v4;

  -[HFCameraAnalyticsPayloadDecorator additionalPayload](self, "additionalPayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Unknown"), HFCameraAnalyticsISOCountryCode);

  -[HFCameraAnalyticsPayloadDecorator additionalPayload](self, "additionalPayload");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Unknown"), HFCameraAnalyticsAdministrativeArea);

}

- (id)decoratePayload:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEntriesFromDictionary:", v5);

  -[HFCameraAnalyticsPayloadDecorator additionalPayload](self, "additionalPayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEntriesFromDictionary:", v7);

  return v6;
}

- (void)_updateHomeInformation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  HFCameraAnalyticsPayloadDecorator *v10;

  v4 = a3;
  -[HFCameraAnalyticsPayloadDecorator _initialiseAdditionalPayloadForNewHome](self, "_initialiseAdditionalPayloadForNewHome");
  objc_msgSend(v4, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C9E390]);
    objc_msgSend(v4, "location");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__HFCameraAnalyticsPayloadDecorator__updateHomeInformation___block_invoke;
    v8[3] = &unk_1EA7326D8;
    v9 = v4;
    v10 = self;
    objc_msgSend(v6, "reverseGeocodeLocation:completionHandler:", v7, v8);

  }
}

void __60__HFCameraAnalyticsPayloadDecorator__updateHomeInformation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    HFLogForCategory(6uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v30 = 138412546;
      v31 = v8;
      v32 = 2112;
      v33 = v6;
      v9 = "Unable to reverse geocode home location for home:%@ error:%@";
      v10 = v7;
      v11 = 22;
LABEL_15:
      _os_log_error_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v30, v11);
    }
  }
  else if (v5 && objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndex:", 0);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "location");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "coordinate");
    v14 = v13;
    -[NSObject location](v7, "location");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "coordinate");
    v17 = vabdd_f64(v14, v16);

    objc_msgSend(*(id *)(a1 + 32), "location");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "coordinate");
    v20 = v19;
    -[NSObject location](v7, "location");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "coordinate");
    v23 = vabdd_f64(v20, v22);

    if (v17 <= 0.00000011920929 && v23 <= 0.00000011920929)
    {
      -[NSObject ISOcountryCode](v7, "ISOcountryCode");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "additionalPayload");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v25, HFCameraAnalyticsISOCountryCode);

      -[NSObject administrativeArea](v7, "administrativeArea");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "additionalPayload");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v27, HFCameraAnalyticsAdministrativeArea);

    }
  }
  else
  {
    HFLogForCategory(6uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v29 = *(_QWORD *)(a1 + 32);
      v30 = 138412290;
      v31 = v29;
      v9 = "No placemarks from reverse geocode home location for home:%@";
      v10 = v7;
      v11 = 12;
      goto LABEL_15;
    }
  }

}

- (void)homeManagerDidFinishInitialDatabaseLoad:(id)a3
{
  id v4;

  objc_msgSend(a3, "currentHome");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HFCameraAnalyticsPayloadDecorator _updateHomeInformation:](self, "_updateHomeInformation:", v4);

}

- (void)homeKitDispatcher:(id)a3 manager:(id)a4 didChangeHome:(id)a5
{
  -[HFCameraAnalyticsPayloadDecorator _updateHomeInformation:](self, "_updateHomeInformation:", a5, a4);
}

- (NSMutableDictionary)additionalPayload
{
  return self->_additionalPayload;
}

- (void)setAdditionalPayload:(id)a3
{
  objc_storeStrong((id *)&self->_additionalPayload, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalPayload, 0);
}

@end
