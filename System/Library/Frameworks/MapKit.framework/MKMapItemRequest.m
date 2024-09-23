@implementation MKMapItemRequest

- (MKMapItemRequest)initWithMapFeatureAnnotation:(MKMapFeatureAnnotation *)mapFeatureAnnotation
{
  MKMapFeatureAnnotation *v5;
  MKMapItemRequest *v6;
  MKMapItemRequest *v7;
  objc_super v9;

  v5 = mapFeatureAnnotation;
  v9.receiver = self;
  v9.super_class = (Class)MKMapItemRequest;
  v6 = -[MKMapItemRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_featureAnnotation, mapFeatureAnnotation);
    v7->_stateLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (MKMapItemRequest)initWithMapItemIdentifier:(id)a3
{
  id v5;
  MKMapItemRequest *v6;
  MKMapItemRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKMapItemRequest;
  v6 = -[MKMapItemRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapItemIdentifier, a3);
    v7->_stateLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)getMapItemWithCompletionHandler:(void *)completionHandler
{
  -[MKMapItemRequest getMapItemWithQueue:completionHandler:](self, "getMapItemWithQueue:completionHandler:", MEMORY[0x1E0C80D38], completionHandler);
}

- (void)getMapItemWithQueue:(id)a3 completionHandler:(id)a4
{
  NSObject *v6;
  id v7;
  NSObject *v8;
  const char *v9;
  id v10;
  void *v11;
  id v12;
  MKMapFeatureAnnotation *featureAnnotation;
  void *v14;
  void *v15;
  MKMapItemIdentifier *mapItemIdentifier;
  MKMapItemIdentifier *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock_with_options();
  if (self->_loading)
  {
    os_unfair_lock_unlock(&self->_stateLock);
    MKGetMapItemRequestLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
LABEL_5:

      v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v11 = (void *)objc_msgSend(v10, "initWithDomain:code:userInfo:", MKErrorDomain, 1, 0);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __58__MKMapItemRequest_getMapItemWithQueue_completionHandler___block_invoke;
      v19[3] = &unk_1E20D7F70;
      v20 = v11;
      v21 = v7;
      v12 = v11;
      dispatch_async(v6, v19);

      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    v9 = "Cannot call -[MKMapItemRequest getMapItemWithCompletionHandler:] on a request which is already loading";
LABEL_4:
    _os_log_impl(&dword_18B0B0000, v8, OS_LOG_TYPE_ERROR, v9, buf, 2u);
    goto LABEL_5;
  }
  self->_loading = 1;
  os_unfair_lock_unlock(&self->_stateLock);
  featureAnnotation = self->_featureAnnotation;
  if (featureAnnotation)
  {
    -[MKMapFeatureAnnotation marker](featureAnnotation, "marker");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      MKGetMapItemRequestLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        goto LABEL_5;
      *(_WORD *)buf = 0;
      v9 = "Invalid MKMapFeatureAnnotation provided to MKMapItemRequest initializer";
      goto LABEL_4;
    }
  }
  mapItemIdentifier = self->_mapItemIdentifier;
  if (mapItemIdentifier)
  {
    v17 = mapItemIdentifier;
  }
  else
  {
    -[MKMapFeatureAnnotation marker](self->_featureAnnotation, "marker");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "identifier");
    v17 = (MKMapItemIdentifier *)objc_claimAutoreleasedReturnValue();

  }
  -[MKMapItemRequest _performLookupRequestWithMapItemIdentifier:queue:completionHandler:](self, "_performLookupRequestWithMapItemIdentifier:queue:completionHandler:", v17, v6, v7);

LABEL_12:
}

uint64_t __58__MKMapItemRequest_getMapItemWithQueue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)_performLookupRequestWithMapItemIdentifier:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  MKMapItemRequest *v17;
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16 = MEMORY[0x1E0C809B0];
  v17 = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v11 = (void *)MEMORY[0x1E0CB3978];
  v12 = v9;
  v13 = v10;
  v14 = v8;
  if ((objc_msgSend(v11, "isMainThread", v16, 3221225472, __87__MKMapItemRequest__performLookupRequestWithMapItemIdentifier_queue_completionHandler___block_invoke, &unk_1E20D9F88, v17) & 1) != 0)
  {
    __87__MKMapItemRequest__performLookupRequestWithMapItemIdentifier_queue_completionHandler___block_invoke((uint64_t)&v16);
    v15 = v12;
  }
  else
  {
    dispatch_async(MEMORY[0x1E0C80D38], &v16);
    v15 = v19;
  }

}

void __87__MKMapItemRequest__performLookupRequestWithMapItemIdentifier_queue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  os_unfair_lock_s *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 21))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 16));
  }
  else
  {
    +[MKMapService sharedService](MKMapService, "sharedService");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "defaultTraits");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    +[MKMapService sharedService](MKMapService, "sharedService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ticketForIdentifiers:traits:", v6, v4);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 8);
    *(_QWORD *)(v8 + 8) = v7;

    v10 = *(_QWORD *)(a1 + 32);
    v11 = (os_unfair_lock_s *)(v10 + 16);
    v12 = *(id *)(v10 + 8);
    os_unfair_lock_unlock(v11);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __87__MKMapItemRequest__performLookupRequestWithMapItemIdentifier_queue_completionHandler___block_invoke_2;
    v13[3] = &unk_1E20D9F60;
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = *(id *)(a1 + 56);
    objc_msgSend(v12, "submitWithHandler:queue:networkActivity:", v13, *(_QWORD *)(a1 + 48), 0);

  }
}

void __87__MKMapItemRequest__performLookupRequestWithMapItemIdentifier_queue_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a3;
  v8 = a2;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 20) = 0;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(*(id *)(a1 + 32), "_handleMapItems:error:completionHandler:", v8, v5, *(_QWORD *)(a1 + 40));

}

- (void)_handleMapItems:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  os_unfair_lock_s *p_stateLock;
  _BOOL4 cancelled;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *, _QWORD))a5;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  cancelled = self->_cancelled;
  os_unfair_lock_unlock(p_stateLock);
  if (v9 && !cancelled)
  {
    if (v8)
    {
      objc_msgSend(v8, "_mapkit_error");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v15, "count"))
      {
        objc_msgSend(v15, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v9[2](v9, v13, 0);
        goto LABEL_8;
      }
      v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v12 = objc_msgSend(v14, "initWithDomain:code:userInfo:", MKErrorDomain, 1, 0);
    }
    v13 = (void *)v12;
    v9[2](v9, 0, v12);
LABEL_8:

  }
}

- (MKMapFeatureAnnotation)featureAnnotation
{
  MKMapFeatureAnnotation *featureAnnotation;

  featureAnnotation = self->_featureAnnotation;
  if (!featureAnnotation)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("This request was not created using an MKMapFeatureAnnotation. Use the mapFeatureAnnotation property to avoid this exception."));
    featureAnnotation = self->_featureAnnotation;
  }
  return featureAnnotation;
}

- (MKMapFeatureAnnotation)mapFeatureAnnotation
{
  return self->_featureAnnotation;
}

- (BOOL)isCancelled
{
  MKMapItemRequest *v2;
  os_unfair_lock_s *p_stateLock;

  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_cancelled;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (BOOL)isLoading
{
  MKMapItemRequest *v2;
  os_unfair_lock_s *p_stateLock;

  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_loading;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (void)cancel
{
  os_unfair_lock_s *p_stateLock;
  MKMapServiceTicket *ticket;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_loading && !self->_cancelled)
  {
    self->_cancelled = 1;
    -[MKMapServiceTicket cancel](self->_ticket, "cancel");
    ticket = self->_ticket;
    self->_ticket = 0;

  }
  os_unfair_lock_unlock(p_stateLock);
}

- (MKMapItemIdentifier)mapItemIdentifier
{
  return self->_mapItemIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItemIdentifier, 0);
  objc_storeStrong((id *)&self->_featureAnnotation, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
}

@end
