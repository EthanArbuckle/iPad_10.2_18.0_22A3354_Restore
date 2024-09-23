@implementation MKLocalSearch

- (void)_startWithCompletionHandler:(id)a3 queue:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void (*v16)(uint64_t);
  NSObject *v17;
  _QWORD *v18;
  void *v19;
  _QWORD v20[2];
  void (*v21)(uint64_t);
  void *v22;
  MKLocalSearch *v23;
  NSObject *v24;
  id v25;
  _QWORD block[4];
  id v27;
  id v28;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (!v7)
    {
      v9 = (void *)MEMORY[0x1E0C99DA0];
      v10 = *MEMORY[0x1E0C99768];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MKLocalSearch must have valid dispatch_queue"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "raise");

    }
    os_unfair_lock_lock_with_options();
    if (self->_searching)
    {
      os_unfair_lock_unlock(&self->_stateLock);
      NSLog(CFSTR("Cannot call -[MKLocalSearch startWithCompletionHandler:] on a requester which is already searching"));
      v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v14 = (void *)objc_msgSend(v13, "initWithDomain:code:userInfo:", MKErrorDomain, 1, 0);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51__MKLocalSearch__startWithCompletionHandler_queue___block_invoke;
      block[3] = &unk_1E20D7F70;
      v27 = v14;
      v28 = v6;
      v15 = v14;
      dispatch_async(v8, block);

      goto LABEL_12;
    }
    self->_searching = 1;
    os_unfair_lock_unlock(&self->_stateLock);
    v20[0] = MEMORY[0x1E0C809B0];
    v16 = __51__MKLocalSearch__startWithCompletionHandler_queue___block_invoke_2;
    v20[1] = 3221225472;
    v21 = __51__MKLocalSearch__startWithCompletionHandler_queue___block_invoke_2;
    v22 = &unk_1E20D7F48;
    v23 = self;
    v25 = v6;
    v24 = v8;
    v17 = v24;
    v18 = v20;
    if (v17 == MEMORY[0x1E0C80D38])
    {
      if (!objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      {
        v19 = (void *)MEMORY[0x1E0C80D38];
        dispatch_async(MEMORY[0x1E0C80D38], v18);

        goto LABEL_11;
      }
      v16 = v21;
    }
    v16((uint64_t)v18);
LABEL_11:

  }
LABEL_12:

}

void __51__MKLocalSearch__startWithCompletionHandler_queue___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  os_unfair_lock_s *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 45))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 40));
  }
  else
  {
    objc_msgSend((id)v2, "_ticketForSearchRequest:", *(_QWORD *)(v2 + 8));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

    v6 = *(_QWORD *)(a1 + 32);
    v7 = (os_unfair_lock_s *)(v6 + 40);
    v8 = *(id *)(v6 + 16);
    os_unfair_lock_unlock(v7);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51__MKLocalSearch__startWithCompletionHandler_queue___block_invoke_3;
    v9[3] = &unk_1E20D9F60;
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v8, "submitWithHandler:queue:networkActivity:", v9, *(_QWORD *)(a1 + 40), 0);

  }
}

- (id)_ticketForSearchRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  char v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  _BOOL4 v75;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;

  v3 = a3;
  objc_msgSend(v3, "_merchantParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "_merchantParameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transactionLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = objc_alloc(MEMORY[0x1E0D27168]);
      objc_msgSend(v3, "_merchantParameters");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "transactionLocation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v7, "initWithCLLocation:", v9);

    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v3, "_deviceLocation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v88 = (void *)v10;
    if (v18)
    {
      +[MKMapService sharedService](MKMapService, "sharedService");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "defaultTraits");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = objc_alloc(MEMORY[0x1E0D27168]);
      objc_msgSend(v3, "_deviceLocation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v21, "initWithCLLocation:", v22);
      objc_msgSend(v20, "setDeviceLocation:", v23);

    }
    else
    {
      v20 = 0;
    }
    v84 = v20;
    +[MKMapService sharedService](MKMapService, "sharedService");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_merchantParameters");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "merchantCode");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_merchantParameters");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "rawMerchantCode");
    v24 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_merchantParameters");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "industryCategory");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_merchantParameters");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "industryCode");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_merchantParameters");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "paymentNetwork");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_merchantParameters");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "transactionDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v20;
    v17 = v88;
    v31 = (void *)v24;
    objc_msgSend(v89, "ticketForMerchantCode:rawMerchantCode:industryCategory:industryCode:paymentNetwork:transactionDate:transactionLocation:traits:", v82, v24, v25, v26, v28, v30, v88, v81);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = v84;
    goto LABEL_20;
  }
  objc_msgSend(v3, "_externalTransitLookupParameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(v3, "_phoneNumbers");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "count");

    if (v35)
    {
      +[MKMapService sharedService](MKMapService, "sharedService");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_phoneNumbers");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "ticketForPhoneNumbers:allowCellularDataForLookup:traits:", v33, objc_msgSend(v3, "_allowPhoneNumberLookupUsingCellular"), 0);
      v36 = objc_claimAutoreleasedReturnValue();
LABEL_14:
      v32 = (void *)v36;
      goto LABEL_20;
    }
    objc_msgSend(v3, "_muids");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "count");

    if (v53)
    {
      if (objc_msgSend(v3, "_hasRegion"))
      {
        +[MKMapService sharedService](MKMapService, "sharedService");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "defaultTraits");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v55 = (void *)MEMORY[0x1E0D27208];
        objc_msgSend(v3, "region");
        objc_msgSend(v55, "_mapkit_mapRegionForCoordinateRegion:");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setMapRegion:", v56);

      }
      else
      {
        v17 = 0;
      }
      +[MKMapService sharedService](MKMapService, "sharedService");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_muids");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "ticketForMUIDs:resultProviderID:contentProvider:traits:", v61, objc_msgSend(v3, "_resultProviderID"), 0, v17);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v3, "_canonicalSearchString");
      v57 = objc_claimAutoreleasedReturnValue();
      if (v57)
      {
        v58 = (void *)v57;
        objc_msgSend(v3, "_canonicalSearchString");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v59, "length");

        if (v60)
        {
          +[MKMapService sharedService](MKMapService, "sharedService");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "_canonicalSearchString");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "ticketForCanonicalLocationSearchQueryString:traits:", v33, 0);
          v36 = objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
      }
      +[MKMapService sharedService](MKMapService, "sharedService");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "defaultTraits");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v3, "_hasRegion"))
      {
        v63 = (void *)MEMORY[0x1E0D27208];
        objc_msgSend(v3, "region");
        objc_msgSend(v63, "_mapkit_mapRegionForCoordinateRegion:");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setMapRegion:", v64);

      }
      objc_msgSend(v3, "geoCompletionItem");
      v65 = objc_claimAutoreleasedReturnValue();
      if (v65)
      {
        v66 = (void *)v65;
        v67 = objc_msgSend(v3, "hasSentFeedbackForCompletion");

        if ((v67 & 1) == 0)
        {
          objc_msgSend(v3, "setHasSentFeedbackForCompletion:", 1);
          objc_msgSend(v3, "geoCompletionItem");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "sendFeedback");

        }
      }
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
      objc_msgSend(v3, "pointOfInterestFilter");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "_geoPOICategoryFilter");
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      if (v70)
        objc_msgSend(v33, "addObject:", v70);

      objc_msgSend(v3, "addressFilter");
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      if (v71)
      {
        objc_msgSend(v3, "addressFilter");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "_geoAddressFilter");
        v73 = (void *)objc_claimAutoreleasedReturnValue();

        if (v73)
          objc_msgSend(v33, "addObject:", v73);

      }
      if (objc_msgSend(v3, "resultTypes"))
      {
        v74 = objc_msgSend(v3, "resultTypes");
        v75 = _MKLinkedOnOrAfterReleaseSet(3852);
        if ((v74 & 2) != 0 && !v75)
          v74 |= 4uLL;
        v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27440]), "initWithResultTypes:", v74);
        objc_msgSend(v33, "addObject:", v77);

      }
      if (objc_msgSend(v3, "regionPriority") == 1)
      {
        v78 = objc_alloc_init(MEMORY[0x1E0D275A0]);
        objc_msgSend(v33, "addObject:", v78);

      }
      +[MKMapService sharedService](MKMapService, "sharedService");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "naturalLanguageQuery");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "geoCompletionItem");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "_mk_ticketForSearchQuery:completionItem:traits:filters:", v79, v80, v17, v33);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_20;
  }
  objc_msgSend(v3, "_externalTransitLookupParameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transactionLocation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_alloc(MEMORY[0x1E0D27168]);
    objc_msgSend(v3, "_externalTransitLookupParameters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "transactionLocation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v14, "initWithCLLocation:", v16);

  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(v3, "_deviceLocation");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    +[MKMapService sharedService](MKMapService, "sharedService");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "defaultTraits");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = objc_alloc(MEMORY[0x1E0D27168]);
    objc_msgSend(v3, "_deviceLocation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)objc_msgSend(v40, "initWithCLLocation:", v41);
    v43 = v39;
    objc_msgSend(v39, "setDeviceLocation:", v42);

  }
  else
  {
    v43 = 0;
  }
  +[MKMapService sharedService](MKMapService, "sharedService");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_externalTransitLookupParameters");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "stationCodes");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_externalTransitLookupParameters");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "sourceIdentifier");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_externalTransitLookupParameters");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "transactionDate");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v43;
  objc_msgSend(v90, "ticketForExternalTransitStationCodes:sourceID:transactionDate:transactionLocation:traits:", v45, v47, v49, v17, v43);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = v50;
LABEL_20:

  return v32;
}

void __51__MKLocalSearch__startWithCompletionHandler_queue___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = a2;
  os_unfair_lock_lock_with_options();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "boundingRegion");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 44) = 0;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 16);
  *(_QWORD *)(v7 + 16) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(*(id *)(a1 + 32), "_handleMapItems:boundingRegion:error:withCompletionHandler:", v6, v9, v5, *(_QWORD *)(a1 + 40));

}

- (void)_handleMapItems:(id)a3 boundingRegion:(id)a4 error:(id)a5 withCompletionHandler:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, id, _QWORD);
  uint64_t v12;
  id v13;
  id v14;
  id v15;

  v15 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(id, id, _QWORD))a6;
  if (v11)
  {
    if (v10)
    {
      objc_msgSend(v10, "_mapkit_error");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v15, "count"))
      {
        v13 = -[MKLocalSearchResponse _initWithMapItems:boundingRegion:]([MKLocalSearchResponse alloc], "_initWithMapItems:boundingRegion:", v15, v9);
        v11[2](v11, v13, 0);
        goto LABEL_7;
      }
      v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v12 = objc_msgSend(v14, "initWithDomain:code:userInfo:", MKErrorDomain, 1, 0);
    }
    v13 = (id)v12;
    v11[2](v11, 0, v12);
LABEL_7:

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spatialPlaceLookupTicket, 0);
  objc_storeStrong((id *)&self->_pointsOfInterestRequest, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (MKLocalSearch)initWithRequest:(MKLocalSearchRequest *)request
{
  MKLocalSearchRequest *v4;
  MKLocalSearch *v5;
  uint64_t v6;
  MKLocalSearchRequest *v7;
  MKLocalSearch *v8;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  objc_super v14;

  v4 = request;
  v14.receiver = self;
  v14.super_class = (Class)MKLocalSearch;
  v5 = -[MKLocalSearch init](&v14, sel_init);
  if (v5)
  {
    if (!v4)
    {
      v10 = (void *)MEMORY[0x1E0C99DA0];
      v11 = *MEMORY[0x1E0C99778];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot initialize MKLocalSearch with nil request"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v12, 0);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v13);
    }
    v6 = -[MKLocalSearchRequest copy](v4, "copy");
    v7 = v5->_request;
    v5->_request = (MKLocalSearchRequest *)v6;

    v5->_stateLock._os_unfair_lock_opaque = 0;
    v8 = v5;
  }

  return v5;
}

- (MKLocalSearch)init
{
  return -[MKLocalSearch initWithRequest:](self, "initWithRequest:", 0);
}

- (MKLocalSearch)initWithPointsOfInterestRequest:(MKLocalPointsOfInterestRequest *)request
{
  MKLocalPointsOfInterestRequest *v4;
  MKLocalSearch *v5;
  uint64_t v6;
  MKLocalPointsOfInterestRequest *pointsOfInterestRequest;
  MKLocalSearch *v8;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  objc_super v14;

  v4 = request;
  v14.receiver = self;
  v14.super_class = (Class)MKLocalSearch;
  v5 = -[MKLocalSearch init](&v14, sel_init);
  if (v5)
  {
    if (!v4)
    {
      v10 = (void *)MEMORY[0x1E0C99DA0];
      v11 = *MEMORY[0x1E0C99778];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot initialize MKLocalSearch with nil request"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v12, 0);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v13);
    }
    v6 = -[MKLocalPointsOfInterestRequest copy](v4, "copy");
    pointsOfInterestRequest = v5->_pointsOfInterestRequest;
    v5->_pointsOfInterestRequest = (MKLocalPointsOfInterestRequest *)v6;

    v5->_stateLock._os_unfair_lock_opaque = 0;
    v8 = v5;
  }

  return v5;
}

uint64_t __51__MKLocalSearch__startWithCompletionHandler_queue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)startWithCompletionHandler:(MKLocalSearchCompletionHandler)completionHandler
{
  if (self->_request)
    -[MKLocalSearch _startWithCompletionHandler:queue:](self, "_startWithCompletionHandler:queue:", completionHandler, MEMORY[0x1E0C80D38]);
  else
    -[MKLocalSearch _startPointsOfInterestFetchWithCompletionHandler:queue:](self, "_startPointsOfInterestFetchWithCompletionHandler:queue:", completionHandler, MEMORY[0x1E0C80D38]);
}

- (void)_startPointsOfInterestFetchWithCompletionHandler:(id)a3 queue:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  NSString *v16;
  void *v17;
  void *v18;
  MKMapServiceSpatialPlaceLookupTicket *v19;
  void *v20;
  id v21;
  void *v22;
  int64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  MKMapServiceSpatialPlaceLookupTicket *v28;
  MKMapServiceSpatialPlaceLookupTicket *spatialPlaceLookupTicket;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  MKMapServiceSpatialPlaceLookupTicket *v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD block[4];
  id v43;
  id v44;
  uint64_t v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (!v7)
    {
      v9 = (void *)MEMORY[0x1E0C99DA0];
      v10 = *MEMORY[0x1E0C99768];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MKLocalSearch must have valid dispatch_queue"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "raise");

    }
    -[MKLocalPointsOfInterestRequest pointOfInterestFilter](self->_pointsOfInterestRequest, "pointOfInterestFilter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "_excludesAllCategories");

    if (v14)
    {
      NSLog(CFSTR("MKLocalPointsOfInterestRequest configured to exclude all categories - This request cannot fetch any POIs"));
      v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v16 = MKErrorDomain;
      v45 = *MEMORY[0x1E0CB2938];
      v46[0] = CFSTR("MKLocalPointsOfInterestRequest configured to exclude all categories - This request cannot fetch any POIs");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 1, v17);

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __72__MKLocalSearch__startPointsOfInterestFetchWithCompletionHandler_queue___block_invoke;
      block[3] = &unk_1E20D7F70;
      v43 = v18;
      v44 = v6;
      v19 = v18;
      dispatch_async(v8, block);

      v20 = v44;
    }
    else
    {
      os_unfair_lock_lock(&self->_stateLock);
      if (self->_searching)
      {
        os_unfair_lock_unlock(&self->_stateLock);
        NSLog(CFSTR("Cannot call -[MKLocalSearch startWithCompletionHandler:] on a requester which is already searching"));
        v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v22 = (void *)objc_msgSend(v21, "initWithDomain:code:userInfo:", MKErrorDomain, 1, 0);
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __72__MKLocalSearch__startPointsOfInterestFetchWithCompletionHandler_queue___block_invoke_2;
        v39[3] = &unk_1E20D7F70;
        v40 = v22;
        v41 = v6;
        v19 = v22;
        dispatch_async(v8, v39);

        v20 = v41;
      }
      else
      {
        self->_searching = 1;
        v23 = -[MKLocalPointsOfInterestRequest _maxResultCount](self->_pointsOfInterestRequest, "_maxResultCount");
        if (-[MKLocalPointsOfInterestRequest _createdFromRegion](self->_pointsOfInterestRequest, "_createdFromRegion"))
        {
          v24 = (void *)MEMORY[0x1E0D27208];
          -[MKLocalPointsOfInterestRequest region](self->_pointsOfInterestRequest, "region");
          objc_msgSend(v24, "_mapkit_mapRegionForCoordinateRegion:");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          +[MKMapService sharedService](MKMapService, "sharedService");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[MKLocalPointsOfInterestRequest pointOfInterestFilter](self->_pointsOfInterestRequest, "pointOfInterestFilter");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "ticketForSpatialPlaceLookupWithMapRegion:pointOfInterestFilter:maxResultCount:", v25, v27, v23);
          v28 = (MKMapServiceSpatialPlaceLookupTicket *)objc_claimAutoreleasedReturnValue();
          spatialPlaceLookupTicket = self->_spatialPlaceLookupTicket;
          self->_spatialPlaceLookupTicket = v28;

        }
        else
        {
          +[MKMapService sharedService](MKMapService, "sharedService");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[MKLocalPointsOfInterestRequest coordinate](self->_pointsOfInterestRequest, "coordinate");
          v31 = v30;
          v33 = v32;
          -[MKLocalPointsOfInterestRequest radius](self->_pointsOfInterestRequest, "radius");
          v35 = v34;
          -[MKLocalPointsOfInterestRequest pointOfInterestFilter](self->_pointsOfInterestRequest, "pointOfInterestFilter");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "ticketForSpatialPlaceLookupWithCenterCoordinate:radius:pointOfInterestFilter:maxResultCount:", v26, v23, v31, v33, v35);
          v36 = (MKMapServiceSpatialPlaceLookupTicket *)objc_claimAutoreleasedReturnValue();
          v27 = self->_spatialPlaceLookupTicket;
          self->_spatialPlaceLookupTicket = v36;
        }

        v19 = self->_spatialPlaceLookupTicket;
        os_unfair_lock_unlock(&self->_stateLock);
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __72__MKLocalSearch__startPointsOfInterestFetchWithCompletionHandler_queue___block_invoke_3;
        v37[3] = &unk_1E20D9F60;
        v37[4] = self;
        v38 = v6;
        -[MKMapServiceSpatialPlaceLookupTicket submitWithHandler:queue:](v19, "submitWithHandler:queue:", v37, MEMORY[0x1E0C80D38]);
        v20 = v38;
      }
    }

  }
}

uint64_t __72__MKLocalSearch__startPointsOfInterestFetchWithCompletionHandler_queue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __72__MKLocalSearch__startPointsOfInterestFetchWithCompletionHandler_queue___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __72__MKLocalSearch__startPointsOfInterestFetchWithCompletionHandler_queue___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = a2;
  os_unfair_lock_lock_with_options();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "boundingRegion");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 44) = 0;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 32);
  *(_QWORD *)(v7 + 32) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(*(id *)(a1 + 32), "_handleMapItems:boundingRegion:error:withCompletionHandler:", v6, v9, v5, *(_QWORD *)(a1 + 40));

}

- (void)cancel
{
  os_unfair_lock_s *p_stateLock;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_searching && !self->_cancelled)
  {
    self->_cancelled = 1;
    -[MKMapServiceTicket cancel](self->_ticket, "cancel");
    -[MKMapServiceSpatialPlaceLookupTicket cancel](self->_spatialPlaceLookupTicket, "cancel");
  }
  os_unfair_lock_unlock(p_stateLock);
}

- (BOOL)isSearching
{
  MKLocalSearch *v2;
  os_unfair_lock_s *p_stateLock;

  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_searching;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

@end
