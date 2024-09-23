@implementation MNNavigationServiceDirectionsRequestTicket

- (MNNavigationServiceDirectionsRequestTicket)initWithProxy:(id)a3 request:(id)a4
{
  id v7;
  id v8;
  MNNavigationServiceDirectionsRequestTicket *v9;
  uint64_t v10;
  NSUUID *requestIdentifier;
  MNNavigationServiceDirectionsRequestTicket *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MNNavigationServiceDirectionsRequestTicket;
  v9 = -[MNNavigationServiceDirectionsRequestTicket init](&v14, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = objc_claimAutoreleasedReturnValue();
    requestIdentifier = v9->_requestIdentifier;
    v9->_requestIdentifier = (NSUUID *)v10;

    objc_storeStrong((id *)&v9->_proxy, a3);
    objc_storeStrong((id *)&v9->_request, a4);
    v12 = v9;
  }

  return v9;
}

- (void)submitWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSUUID *requestIdentifier;
  MNDirectionsRequestDetails *request;
  MNNavigationClientProxy *proxy;
  NSUUID *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  NSUUID *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MNGetMNNavigationServiceLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    requestIdentifier = self->_requestIdentifier;
    *(_DWORD *)buf = 138412290;
    v15 = requestIdentifier;
    _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "requestDirections: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  proxy = self->_proxy;
  request = self->_request;
  v9 = self->_requestIdentifier;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__MNNavigationServiceDirectionsRequestTicket_submitWithHandler___block_invoke;
  v11[3] = &unk_1E61D2BA0;
  objc_copyWeak(&v13, (id *)buf);
  v10 = v4;
  v12 = v10;
  -[MNNavigationClientProxy requestDirections:withIdentifier:handler:](proxy, "requestDirections:withIdentifier:handler:", request, v9, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);

}

void __64__MNNavigationServiceDirectionsRequestTicket_submitWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(v3, "request");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)WeakRetained[4];
    WeakRetained[4] = v5;

    objc_msgSend(v3, "response");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)WeakRetained[5];
    WeakRetained[5] = v7;

    objc_msgSend(v3, "traceRecordingData");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)WeakRetained[6];
    WeakRetained[6] = v9;

  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3, "routeInfos");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v17), "route", (_QWORD)v22);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v15);
    }

    v19 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "error");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "directionsError");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, void *))(v19 + 16))(v19, v12, v20, v21);

  }
}

- (void)cancel
{
  NSObject *v3;
  NSUUID *requestIdentifier;
  int v5;
  NSUUID *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MNGetMNNavigationServiceLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    requestIdentifier = self->_requestIdentifier;
    v5 = 138412290;
    v6 = requestIdentifier;
    _os_log_impl(&dword_1B0AD7000, v3, OS_LOG_TYPE_DEFAULT, "cancelDirectionsRequestWithIdentifier: %@", (uint8_t *)&v5, 0xCu);
  }

  -[MNNavigationClientProxy cancelDirectionsRequestWithIdentifier:](self->_proxy, "cancelDirectionsRequestWithIdentifier:", self->_requestIdentifier);
}

- (GEODirectionsRequest)directionsRequest
{
  return self->_directionsRequest;
}

- (GEODirectionsResponse)directionsResponse
{
  return self->_directionsResponse;
}

- (MNTraceRecordingData)traceRecordingData
{
  return self->_traceRecordingData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traceRecordingData, 0);
  objc_storeStrong((id *)&self->_directionsResponse, 0);
  objc_storeStrong((id *)&self->_directionsRequest, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

@end
