@implementation GEODirectionsRequester

+ (void)useRemoteProxy
{
  objc_msgSend(a1, "useProxy:", objc_opt_class());
}

+ (id)sharedRequester
{
  if (qword_1ECDBBB18 != -1)
    dispatch_once(&qword_1ECDBBB18, &__block_literal_global_34);
  return (id)_MergedGlobals_198;
}

void __41__GEODirectionsRequester_sharedRequester__block_invoke()
{
  GEODirectionsRequester *v0;
  void *v1;

  v0 = objc_alloc_init(GEODirectionsRequester);
  v1 = (void *)_MergedGlobals_198;
  _MergedGlobals_198 = (uint64_t)v0;

}

- (GEODirectionsRequester)init
{
  GEODirectionsRequester *v3;
  _GEODirectionsRequesterServerProxy *v4;
  _GEODirectionsRequesterServerProxy *serverProxy;
  objc_super v7;

  if (!_proxyClass_0)
    objc_msgSend((id)objc_opt_class(), "useRemoteProxy");
  v7.receiver = self;
  v7.super_class = (Class)GEODirectionsRequester;
  v3 = -[GEODirectionsRequester init](&v7, sel_init);
  if (v3)
  {
    v4 = (_GEODirectionsRequesterServerProxy *)objc_alloc_init((Class)_proxyClass_0);
    serverProxy = v3->_serverProxy;
    v3->_serverProxy = v4;

  }
  return v3;
}

- (void)finalizeRequest:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "hasClientCapabilities") & 1) == 0)
  {
    +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clientCapabilities");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setClientCapabilities:", v4);

    objc_msgSend(v7, "clientCapabilities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateWithDirectionsRequest:", v7);

  }
  +[GEOAdditionalEnabledMarkets additionalEnabledMarkets](GEOAdditionalEnabledMarkets, "additionalEnabledMarkets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAdditionalEnabledMarkets:", v6);

}

- (void)startRequest:(id)a3 finished:(id)a4 networkActivity:(id)a5 error:(id)a6
{
  -[GEODirectionsRequester startRequest:callbackQueue:finished:networkActivity:error:](self, "startRequest:callbackQueue:finished:networkActivity:error:", a3, MEMORY[0x1E0C80D38], a4, a5, a6);
}

- (void)startRequest:(id)a3 callbackQueue:(id)a4 finished:(id)a5 networkActivity:(id)a6 error:(id)a7
{
  -[GEODirectionsRequester startRequest:traits:auditToken:skipFinalize:useBackgroundURL:requestPriority:callbackQueue:finished:networkActivity:error:](self, "startRequest:traits:auditToken:skipFinalize:useBackgroundURL:requestPriority:callbackQueue:finished:networkActivity:error:", a3, 0, 0, 0, 0, 0, a4, a5, a6, a7);
}

- (void)startRequest:(id)a3 traits:(id)a4 auditToken:(id)a5 callbackQueue:(id)a6 finished:(id)a7 networkActivity:(id)a8 error:(id)a9
{
  -[GEODirectionsRequester startRequest:traits:auditToken:skipFinalize:useBackgroundURL:requestPriority:callbackQueue:finished:networkActivity:error:](self, "startRequest:traits:auditToken:skipFinalize:useBackgroundURL:requestPriority:callbackQueue:finished:networkActivity:error:", a3, a4, a5, 0, 0, 0, a6, a7, a8, a9);
}

- (void)startRequest:(id)a3 traits:(id)a4 auditToken:(id)a5 useBackgroundURL:(BOOL)a6 callbackQueue:(id)a7 finished:(id)a8 networkActivity:(id)a9 error:(id)a10
{
  -[GEODirectionsRequester startRequest:traits:auditToken:skipFinalize:useBackgroundURL:requestPriority:callbackQueue:finished:networkActivity:error:](self, "startRequest:traits:auditToken:skipFinalize:useBackgroundURL:requestPriority:callbackQueue:finished:networkActivity:error:", a3, a4, a5, 0, a6, 0, a7, a8, a9, a10);
}

- (void)startRequest:(id)a3 traits:(id)a4 auditToken:(id)a5 skipFinalize:(BOOL)a6 useBackgroundURL:(BOOL)a7 requestPriority:(id)a8 finished:(id)a9 networkActivity:(id)a10 error:(id)a11
{
  -[GEODirectionsRequester startRequest:traits:auditToken:skipFinalize:useBackgroundURL:requestPriority:callbackQueue:finished:networkActivity:error:](self, "startRequest:traits:auditToken:skipFinalize:useBackgroundURL:requestPriority:callbackQueue:finished:networkActivity:error:", a3, a4, a5, a6, a7, a8, MEMORY[0x1E0C80D38], a9, a10, a11);
}

- (void)cancelRequest:(id)a3
{
  -[_GEODirectionsRequesterServerProxy cancelRequest:](self->_serverProxy, "cancelRequest:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverProxy, 0);
}

+ (void)useProxy:(Class)a3
{
  _proxyClass_0 = (uint64_t)a3;
}

- (void)startRequest:(id)a3 traits:(id)a4 auditToken:(id)a5 skipFinalize:(BOOL)a6 useBackgroundURL:(BOOL)a7 requestPriority:(id)a8 callbackQueue:(id)a9 finished:(id)a10 networkActivity:(id)a11 error:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  id v27;
  _QWORD v28[4];
  id v29;

  v26 = a7;
  v27 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v23 = a12;
  if (a6)
  {
    if (v17)
      goto LABEL_3;
LABEL_6:
    +[GEOMapService sharedService](GEOMapService, "sharedService");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "defaultTraits");
    v17 = (id)objc_claimAutoreleasedReturnValue();

    if (v19)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", GEOConfigGetInteger(GeoServicesConfig_DirectionsRequestDefaultPriority, (uint64_t)off_1EDF4D0F8));
    v19 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  -[GEODirectionsRequester finalizeRequest:](self, "finalizeRequest:", v27);
  +[GEOUserSession sharedInstance](GEOUserSession, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __158__GEODirectionsRequester_Internal__startRequest_traits_auditToken_skipFinalize_useBackgroundURL_requestPriority_callbackQueue_finished_networkActivity_error___block_invoke;
  v28[3] = &unk_1E1C04548;
  v29 = v27;
  objc_msgSend(v24, "shortSessionValues:", v28);

  if (!v17)
    goto LABEL_6;
LABEL_3:
  if (!v19)
    goto LABEL_7;
LABEL_4:
  -[_GEODirectionsRequesterServerProxy startRequest:traits:auditToken:useBackgroundURL:requestPriority:callbackQueue:finished:networkActivity:error:](self->_serverProxy, "startRequest:traits:auditToken:useBackgroundURL:requestPriority:callbackQueue:finished:networkActivity:error:", v27, v17, v18, v26, v19, v20, v21, v22, v23);

}

void __158__GEODirectionsRequester_Internal__startRequest_traits_auditToken_skipFinalize_useBackgroundURL_requestPriority_callbackQueue_finished_networkActivity_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  GEOPrivacyMetadata *v12;
  void *v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "setSessionID:", a2, a3);
  objc_msgSend(*(id *)(a1 + 32), "setSequenceNumber:", a4);
  if (a7)
  {
    v12 = objc_alloc_init(GEOPrivacyMetadata);
    objc_msgSend(*(id *)(a1 + 32), "setPrivacyMetadata:", v12);

    objc_msgSend(*(id *)(a1 + 32), "privacyMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setIsUnderageAccount:", a5);

    objc_msgSend(*(id *)(a1 + 32), "privacyMetadata");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setIsManagedAccount:", a6);

  }
}

@end
