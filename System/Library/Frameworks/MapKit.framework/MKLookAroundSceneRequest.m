@implementation MKLookAroundSceneRequest

- (MKLookAroundSceneRequest)initWithCoordinate:(CLLocationCoordinate2D)coordinate
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  MKLookAroundSceneRequest *result;
  objc_super v6;

  longitude = coordinate.longitude;
  latitude = coordinate.latitude;
  v6.receiver = self;
  v6.super_class = (Class)MKLookAroundSceneRequest;
  result = -[MKLookAroundSceneRequest init](&v6, sel_init);
  if (result)
  {
    result->_coordinate.latitude = latitude;
    result->_coordinate.longitude = longitude;
    result->_stateLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (MKLookAroundSceneRequest)initWithMapItem:(MKMapItem *)mapItem
{
  MKMapItem *v5;
  char *v6;
  MKLookAroundSceneRequest *v7;
  objc_super v9;

  v5 = mapItem;
  v9.receiver = self;
  v9.super_class = (Class)MKLookAroundSceneRequest;
  v6 = -[MKLookAroundSceneRequest init](&v9, sel_init);
  v7 = (MKLookAroundSceneRequest *)v6;
  if (v6)
  {
    *(_OWORD *)(v6 + 40) = MKCoordinateInvalid;
    objc_storeStrong((id *)v6 + 4, mapItem);
    v7->_stateLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[MKLookAroundSceneRequest cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)MKLookAroundSceneRequest;
  -[MKLookAroundSceneRequest dealloc](&v3, sel_dealloc);
}

- (BOOL)isCancelled
{
  MKLookAroundSceneRequest *v2;
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
  MKLookAroundSceneRequest *v2;
  os_unfair_lock_s *p_stateLock;

  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_loading;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (void)getSceneWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  const char *v8;
  id v9;
  void *v10;
  id v11;
  MKMapItem *mapItem;
  void *v13;
  MKMapItem *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  MKLocationManagerOperation *v19;
  MKLocationManagerOperation *singleLocationUpdate;
  MKMapItem *v21;
  BOOL v22;
  MKMapItem *v23;
  MKMapItem *v24;
  double latitude;
  double longitude;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  _QWORD block[4];
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;
  CLLocationCoordinate2D v38;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = completionHandler;
  v5 = (void *)MEMORY[0x1E0C80D38];
  v6 = MEMORY[0x1E0C80D38];
  os_unfair_lock_lock_with_options();
  if (!self->_loading)
  {
    self->_loading = 1;
    os_unfair_lock_unlock(&self->_stateLock);
    mapItem = self->_mapItem;
    if (!mapItem)
      goto LABEL_11;
    -[MKMapItem _identifier](mapItem, "_identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {

    }
    else
    {
      -[MKMapItem _coordinate](self->_mapItem, "_coordinate");
      if (!CLLocationCoordinate2DIsValid(v38))
      {
        MKGetMKLookAroundLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          goto LABEL_5;
        *(_WORD *)buf = 0;
        v8 = "MKMapItem with missing identifier or invalid coordinate provided to MKLookAroundSceneRequest's initWithMapI"
             "tem: initializer";
        goto LABEL_4;
      }
    }
    v14 = self->_mapItem;
    if (!v14)
    {
LABEL_11:
      if (!CLLocationCoordinate2DIsValid(self->_coordinate))
      {
        MKGetMKLookAroundLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%+.8f, %+.8f"), *(_QWORD *)&self->_coordinate.latitude, *(_QWORD *)&self->_coordinate.longitude);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v36 = v27;
          _os_log_impl(&dword_18B0B0000, v7, OS_LOG_TYPE_ERROR, "Invalid CLLocationCoordinate2D provided to MKLookAroundSceneRequest's initWithCoordinate: initializer: %@", buf, 0xCu);

        }
        goto LABEL_5;
      }
      v14 = self->_mapItem;
    }
    if (-[MKMapItem isCurrentLocation](v14, "isCurrentLocation"))
    {
      if (!self->_singleLocationUpdate)
      {
        +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isLocationServicesAvailable");

        if (v16)
        {
          +[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = __58__MKLookAroundSceneRequest_getSceneWithCompletionHandler___block_invoke_2;
          v29[3] = &unk_1E20DFA58;
          v29[4] = self;
          v31 = v4;
          v18 = v5;
          v30 = v5;
          objc_msgSend(v17, "singleLocationUpdateWithHandler:", v29);
          v19 = (MKLocationManagerOperation *)objc_claimAutoreleasedReturnValue();
          singleLocationUpdate = self->_singleLocationUpdate;
          self->_singleLocationUpdate = v19;

          -[MKLocationManagerOperation start](self->_singleLocationUpdate, "start");
          goto LABEL_31;
        }
      }
    }
    v21 = self->_mapItem;
    if (v21)
    {
      v22 = -[MKMapItem _hasLookAroundStorefront](v21, "_hasLookAroundStorefront");
      v23 = self->_mapItem;
      if (v22)
      {
        v24 = v23;
        if (v24)
        {
LABEL_20:
          -[MKMapItem _coordinate](v24, "_coordinate");
LABEL_30:
          -[MKLookAroundSceneRequest _performLookupRequestWithMapItem:orCoordinate:completionHandler:](self, "_performLookupRequestWithMapItem:orCoordinate:completionHandler:", v24, v4, latitude, longitude);

          goto LABEL_31;
        }
      }
      else
      {
        -[MKMapItem _identifier](v23, "_identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
          v24 = self->_mapItem;
        else
          v24 = 0;

        if (v24)
          goto LABEL_20;
      }
    }
    v24 = 0;
    latitude = self->_coordinate.latitude;
    longitude = self->_coordinate.longitude;
    goto LABEL_30;
  }
  os_unfair_lock_unlock(&self->_stateLock);
  MKGetMKLookAroundLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v8 = "Cannot call -[MKLookAroundSceneRequest getSceneWithCompletionHandler:] on a scene request which is already loading";
LABEL_4:
    _os_log_impl(&dword_18B0B0000, v7, OS_LOG_TYPE_ERROR, v8, buf, 2u);
  }
LABEL_5:

  v9 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v10 = (void *)objc_msgSend(v9, "initWithDomain:code:userInfo:", MKErrorDomain, 1, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__MKLookAroundSceneRequest_getSceneWithCompletionHandler___block_invoke;
  block[3] = &unk_1E20D7F70;
  v33 = v10;
  v34 = v4;
  v11 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], block);

LABEL_31:
}

uint64_t __58__MKLookAroundSceneRequest_getSceneWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __58__MKLookAroundSceneRequest_getSceneWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(a2, "coordinate");
    objc_msgSend(v3, "_performLookupRequestWithMapItem:orCoordinate:completionHandler:", 0, *(_QWORD *)(a1 + 48));
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __58__MKLookAroundSceneRequest_getSceneWithCompletionHandler___block_invoke_3;
    v7[3] = &unk_1E20D8238;
    v4 = *(NSObject **)(a1 + 40);
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = *(id *)(a1 + 48);
    dispatch_async(v4, v7);

  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = 0;

}

void __58__MKLookAroundSceneRequest_getSceneWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v4 = (id)objc_msgSend(v3, "initWithDomain:code:userInfo:", MKErrorDomain, 1, 0);
  objc_msgSend(v2, "_handleMapItems:requestType:error:completionHandler:", MEMORY[0x1E0C9AA60], 0, v4, *(_QWORD *)(a1 + 40));

}

- (void)_performLookupRequestWithMapItem:(id)a3 orCoordinate:(CLLocationCoordinate2D)a4 completionHandler:(id)a5
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD block[5];
  id v16;
  id v17;
  CLLocationDegrees v18;
  CLLocationDegrees v19;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v9 = a3;
  v10 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__MKLookAroundSceneRequest__performLookupRequestWithMapItem_orCoordinate_completionHandler___block_invoke;
  block[3] = &unk_1E20DFAA8;
  block[4] = self;
  v16 = v9;
  v18 = latitude;
  v19 = longitude;
  v17 = v10;
  v11 = (void *)MEMORY[0x1E0CB3978];
  v12 = v10;
  v13 = v9;
  if ((objc_msgSend(v11, "isMainThread") & 1) != 0)
  {
    __92__MKLookAroundSceneRequest__performLookupRequestWithMapItem_orCoordinate_completionHandler___block_invoke((uint64_t)block);
    v14 = v12;
  }
  else
  {
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v14 = v17;
  }

}

void __92__MKLookAroundSceneRequest__performLookupRequestWithMapItem_orCoordinate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  os_unfair_lock_s *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  uint64_t v19;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 29))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 24));
  }
  else
  {
    +[MKMapService sharedService](MKMapService, "sharedService");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "defaultTraits");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = *(void **)(a1 + 40);
    if (v5
      && ((objc_msgSend(v5, "_hasLookAroundStorefront") & 1) != 0
       || (objc_msgSend(*(id *)(a1 + 40), "_identifier"),
           v6 = (void *)objc_claimAutoreleasedReturnValue(),
           v6,
           v6)))
    {
      +[MKMapService sharedService](MKMapService, "sharedService");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ticketForMapItemToRefine:traits:", *(_QWORD *)(a1 + 40), v4);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 16);
      *(_QWORD *)(v9 + 16) = v8;
      v11 = 1;
    }
    else
    {
      +[MKMapService sharedService](MKMapService, "sharedService");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ticketForReverseGeocodeCoordinate:traits:", v4, *(double *)(a1 + 56), *(double *)(a1 + 64));
      v12 = objc_claimAutoreleasedReturnValue();
      v11 = 0;
      v13 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v13 + 16);
      *(_QWORD *)(v13 + 16) = v12;
    }

    v14 = *(_QWORD *)(a1 + 32);
    v15 = (os_unfair_lock_s *)(v14 + 24);
    v16 = *(id *)(v14 + 16);
    os_unfair_lock_unlock(v15);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __92__MKLookAroundSceneRequest__performLookupRequestWithMapItem_orCoordinate_completionHandler___block_invoke_2;
    v17[3] = &unk_1E20DFA80;
    v17[4] = *(_QWORD *)(a1 + 32);
    v19 = v11;
    v18 = *(id *)(a1 + 48);
    objc_msgSend(v16, "submitWithHandler:queue:networkActivity:", v17, MEMORY[0x1E0C80D38], 0);

  }
}

void __92__MKLookAroundSceneRequest__performLookupRequestWithMapItem_orCoordinate_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a3;
  v8 = a2;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 28) = 0;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(*(id *)(a1 + 32), "_handleMapItems:requestType:error:completionHandler:", v8, *(_QWORD *)(a1 + 48), v5, *(_QWORD *)(a1 + 40));

}

- (void)cancel
{
  os_unfair_lock_s *p_stateLock;
  MKLocationManagerOperation *singleLocationUpdate;
  MKMapServiceTicket *ticket;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_loading && !self->_cancelled)
  {
    self->_cancelled = 1;
    -[MKLocationManagerOperation cancel](self->_singleLocationUpdate, "cancel");
    singleLocationUpdate = self->_singleLocationUpdate;
    self->_singleLocationUpdate = 0;

    -[MKMapServiceTicket cancel](self->_ticket, "cancel");
    ticket = self->_ticket;
    self->_ticket = 0;

  }
  os_unfair_lock_unlock(p_stateLock);
}

- (void)_handleMapItems:(id)a3 requestType:(unint64_t)a4 error:(id)a5 completionHandler:(id)a6
{
  id v10;
  void (**v11)(id, MKLookAroundScene *, _QWORD);
  _BOOL4 cancelled;
  uint64_t v13;
  void *v14;
  MKLookAroundScene *v15;
  id v16;
  id v17;

  v17 = a3;
  v10 = a5;
  v11 = (void (**)(id, MKLookAroundScene *, _QWORD))a6;
  os_unfair_lock_lock(&self->_stateLock);
  cancelled = self->_cancelled;
  os_unfair_lock_unlock(&self->_stateLock);
  if (v11 && !cancelled)
  {
    if (v10)
    {
      objc_msgSend(v10, "_mapkit_error");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v17, "count"))
      {
        objc_msgSend(v17, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "_hasLookAroundStorefront"))
        {
          v15 = -[MKLookAroundScene initWithMapItem:]([MKLookAroundScene alloc], "initWithMapItem:", v14);
          v11[2](v11, v15, 0);

        }
        else if (a4 == 1)
        {
          objc_msgSend(v14, "_coordinate");
          -[MKLookAroundSceneRequest _performLookupRequestWithMapItem:orCoordinate:completionHandler:](self, "_performLookupRequestWithMapItem:orCoordinate:completionHandler:", 0, v11);
        }
        else
        {
          v11[2](v11, 0, 0);
        }
        goto LABEL_6;
      }
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v13 = objc_msgSend(v16, "initWithDomain:code:userInfo:", MKErrorDomain, 1, 0);
    }
    v14 = (void *)v13;
    v11[2](v11, 0, v13);
LABEL_6:

  }
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong((id *)&self->_singleLocationUpdate, 0);
}

@end
