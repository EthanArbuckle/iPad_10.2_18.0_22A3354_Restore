@implementation CLSCachedGeocoderOperation

- (CLSCachedGeocoderOperation)initWithLocation:(id)a3 withAccuracy:(double)a4
{
  id v7;
  CLSCachedGeocoderOperation *v8;
  CLSCachedGeocoderOperation *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLSCachedGeocoderOperation;
  v8 = -[CLSCachedGeocoderOperation init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_location, a3);
    v9->_accuracy = a4;
  }

  return v9;
}

- (id)performSynchronouslyWithLocationCache:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  double accuracy;
  uint64_t v10;
  void *v11;
  dispatch_semaphore_t v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  NSObject *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v6 = a3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__925;
  v34 = __Block_byref_object_dispose__926;
  objc_msgSend(v6, "placemarksForLocation:", self->_location);
  v35 = (id)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__925;
  v28 = __Block_byref_object_dispose__926;
  v29 = 0;
  if (!v31[5])
  {
    v7 = 0;
    accuracy = self->_accuracy;
    if (accuracy != 0.0 && accuracy != *MEMORY[0x1E0C9E490] && accuracy != *MEMORY[0x1E0C9E498])
    {
      objc_msgSend(v6, "placemarksForLocation:withQueryAccuracy:", self->_location);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v31[5];
      v31[5] = v10;

      v7 = (void *)v31[5];
    }
    if (!objc_msgSend(v7, "count"))
    {
      v12 = dispatch_semaphore_create(0);
      v13 = self->_location;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __74__CLSCachedGeocoderOperation_performSynchronouslyWithLocationCache_error___block_invoke;
      v18[3] = &unk_1E84F7500;
      v22 = &v24;
      v19 = v6;
      v14 = v13;
      v20 = v14;
      v23 = &v30;
      v15 = v12;
      v21 = v15;
      -[CLSCachedGeocoderOperation _executeQueryWithResultBlock:](self, "_executeQueryWithResultBlock:", v18);
      dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);

    }
  }
  if (a4)
    *a4 = objc_retainAutorelease((id)v25[5]);
  v16 = (id)v31[5];
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v16;
}

- (void)_timedOutForGeocoder:(id)a3 withResultBlock:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  CLSCachedGeocoderOperation *v7;
  NSObject *timer;
  OS_dispatch_source *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  v7 = self;
  objc_sync_enter(v7);
  v7->_cancelled = 1;
  timer = v7->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v9 = v7->_timer;
    v7->_timer = 0;

    objc_msgSend(v13, "cancelGeocode");
    v10 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Hit timeout of %ld getting person address"), 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDescription:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v12);

  }
  objc_sync_exit(v7);

}

- (void)_setupTimeOutForGeocoder:(id)a3 resultBlock:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_source *v8;
  OS_dispatch_source *timer;
  NSObject *v10;
  dispatch_time_t v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, 0);
  timer = self->_timer;
  self->_timer = v8;

  v10 = self->_timer;
  v11 = dispatch_time(0, 2000000000);
  dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__CLSCachedGeocoderOperation__setupTimeOutForGeocoder_resultBlock___block_invoke;
  v15[3] = &unk_1E84F7528;
  objc_copyWeak(&v18, &location);
  v16 = v6;
  v17 = v7;
  v12 = v7;
  v13 = v6;
  v14 = (void *)MEMORY[0x1D1796244](v15);
  dispatch_source_set_event_handler((dispatch_source_t)self->_timer, v14);
  dispatch_activate((dispatch_object_t)self->_timer);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)_stopTimeOut
{
  NSObject *timer;
  OS_dispatch_source *v3;
  CLSCachedGeocoderOperation *obj;

  obj = self;
  objc_sync_enter(obj);
  timer = obj->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v3 = obj->_timer;
    obj->_timer = 0;

  }
  objc_sync_exit(obj);

}

- (void)_returnsResultsForPlacemarks:(id)a3 error:(id)a4 resultBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id, id);
  CLSCachedGeocoderOperation *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  __int16 v16[8];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id, id))a5;
  v11 = self;
  objc_sync_enter(v11);
  if (v11->_cancelled)
    goto LABEL_11;
  -[CLSCachedGeocoderOperation _stopTimeOut](v11, "_stopTimeOut");
  objc_msgSend(v9, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0C9E488]))
  {

    goto LABEL_6;
  }
  if (objc_msgSend(v9, "code") != 8)
  {
    v13 = objc_msgSend(v9, "code");

    if (v13 == 9)
      goto LABEL_8;
LABEL_6:
    v10[2](v10, v8, v9);
    goto LABEL_11;
  }

LABEL_8:
  +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "loggingConnection");
  v15 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16[0] = 0;
    _os_log_impl(&dword_1CAB79000, v15, OS_LOG_TYPE_INFO, "Forward GEO lookup returned no result", (uint8_t *)v16, 2u);
  }

  v10[2](v10, (id)MEMORY[0x1E0C9AA60], 0);
LABEL_11:
  objc_sync_exit(v11);

}

- (void)_executeQueryWithResultBlock:(id)a3
{
  id v4;
  id v5;
  CLSCachedGeocoderOperation *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  id v17;
  id v18;
  id location;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_location;
  v6 = self;
  objc_sync_enter(v6);
  v6->_cancelled = 0;
  objc_sync_exit(v6);

  objc_initWeak(&location, v6);
  v7 = objc_alloc_init(MEMORY[0x1E0C9E390]);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __59__CLSCachedGeocoderOperation__executeQueryWithResultBlock___block_invoke;
  v16 = &unk_1E84F7550;
  objc_copyWeak(&v18, &location);
  v8 = v4;
  v17 = v8;
  v9 = (void *)MEMORY[0x1D1796244](&v13);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[CLSCachedGeocoderOperation _setupTimeOutForGeocoder:resultBlock:](v6, "_setupTimeOutForGeocoder:resultBlock:", v7, v8);
        objc_msgSend(MEMORY[0x1E0C973A8], "postalAddressWithDictionaryRepresentation:", v5);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "geocodePostalAddress:completionHandler:", v12, v9);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[CLSCachedGeocoderOperation _setupTimeOutForGeocoder:resultBlock:](v6, "_setupTimeOutForGeocoder:resultBlock:", v7, v8);
          objc_msgSend(v7, "geocodeAddressString:completionHandler:", v5, v9);
          goto LABEL_9;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[CLSCachedGeocoderOperation _setupTimeOutForGeocoder:resultBlock:](v6, "_setupTimeOutForGeocoder:resultBlock:", v7, v8);
          objc_msgSend(v7, "geocodePostalAddress:completionHandler:", v5, v9);
          goto LABEL_9;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, MEMORY[0x1E0C9AA60], 0);
          goto LABEL_9;
        }
        v20[0] = v5;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *, _QWORD))v8 + 2))(v8, v12, 0);
      }
      goto LABEL_8;
    }
  }
  if (!v6->_forceQuery)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Try to reverse geocode individual location: %@"), v5, v13, v14, v15, v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDescription:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v12);
LABEL_8:

    goto LABEL_9;
  }
  -[CLSCachedGeocoderOperation _setupTimeOutForGeocoder:resultBlock:](v6, "_setupTimeOutForGeocoder:resultBlock:", v7, v8);
  objc_msgSend(v7, "reverseGeocodeLocation:completionHandler:", v5, v9);
LABEL_9:

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_locationCache, 0);
  objc_storeStrong(&self->_location, 0);
}

void __59__CLSCachedGeocoderOperation__executeQueryWithResultBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_returnsResultsForPlacemarks:error:resultBlock:", v7, v6, *(_QWORD *)(a1 + 32));

}

void __67__CLSCachedGeocoderOperation__setupTimeOutForGeocoder_resultBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_timedOutForGeocoder:withResultBlock:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __74__CLSCachedGeocoderOperation_performSynchronouslyWithLocationCache_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CLSLitePlacemark *v14;
  CLSLitePlacemark *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
          v14 = [CLSLitePlacemark alloc];
          v15 = -[CLSLitePlacemark initWithCLPlacemark:](v14, "initWithCLPlacemark:", v13, (_QWORD)v18);
          objc_msgSend(v7, "addObject:", v15);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    objc_msgSend(*(id *)(a1 + 32), "setPlacemarks:forLocation:", v7, *(_QWORD *)(a1 + 40));
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v7;

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

+ (id)operationWithLocation:(id)a3
{
  id v3;
  CLSCachedGeocoderOperation *v4;
  CLSCachedGeocoderOperation *v5;

  v3 = a3;
  v4 = [CLSCachedGeocoderOperation alloc];
  v5 = -[CLSCachedGeocoderOperation initWithLocation:withAccuracy:](v4, "initWithLocation:withAccuracy:", v3, *MEMORY[0x1E0C9E490]);

  return v5;
}

+ (id)operationWithLocation:(id)a3 withAccuracy:(double)a4
{
  id v5;
  CLSCachedGeocoderOperation *v6;

  v5 = a3;
  v6 = -[CLSCachedGeocoderOperation initWithLocation:withAccuracy:]([CLSCachedGeocoderOperation alloc], "initWithLocation:withAccuracy:", v5, a4);

  return v6;
}

+ (id)operationForceGeocoderWithLocation:(id)a3
{
  id result;

  result = (id)objc_msgSend(a1, "operationWithLocation:", a3);
  *((_BYTE *)result + 8) = 1;
  return result;
}

+ (id)operationForceGeocoderWithLocation:(id)a3 withAccuracy:(double)a4
{
  id result;

  result = (id)objc_msgSend(a1, "operationWithLocation:withAccuracy:", a3, a4);
  *((_BYTE *)result + 8) = 1;
  return result;
}

@end
