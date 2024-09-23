@implementation _GEOMapServiceWiFiQualityLookupTicket

- (_GEOMapServiceWiFiQualityLookupTicket)initWithRequestID:(id)a3
{
  id v5;
  _GEOMapServiceWiFiQualityLookupTicket *v6;
  _GEOMapServiceWiFiQualityLookupTicket *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_GEOMapServiceWiFiQualityLookupTicket;
  v6 = -[GEOAbstractTicket initWithTraits:](&v9, sel_initWithTraits_, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_requestID, a3);

  return v7;
}

- (_GEOMapServiceWiFiQualityLookupTicket)initWithRequest:(id)a3 requestId:(id)a4
{
  id v7;
  _GEOMapServiceWiFiQualityLookupTicket *v8;
  _GEOMapServiceWiFiQualityLookupTicket *v9;

  v7 = a3;
  v8 = -[_GEOMapServiceWiFiQualityLookupTicket initWithRequestID:](self, "initWithRequestID:", a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_request, a3);

  return v9;
}

- (_GEOMapServiceWiFiQualityLookupTicket)initWithTileKey:(id)a3 eTag:(id)a4 requestId:(id)a5
{
  id v9;
  id v10;
  _GEOMapServiceWiFiQualityLookupTicket *v11;
  _GEOMapServiceWiFiQualityLookupTicket *v12;

  v9 = a3;
  v10 = a4;
  v11 = -[_GEOMapServiceWiFiQualityLookupTicket initWithRequestID:](self, "initWithRequestID:", a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_tileKey, a3);
    objc_storeStrong((id *)&v12->_eTag, a4);
  }

  return v12;
}

- (void)submitNetworkSearchWithCompletionQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  GEOWiFiQualityServiceRequest *request;
  NSString *requestID;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  +[GEOWiFiQualityServiceManager sharedManager](GEOWiFiQualityServiceManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  request = self->_request;
  requestID = self->_requestID;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __91___GEOMapServiceWiFiQualityLookupTicket_submitNetworkSearchWithCompletionQueue_completion___block_invoke;
  v13[3] = &unk_1E1C06BE0;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v8, "submitWiFiQualityServiceRequest:requestId:auditToken:completionQueue:completion:", request, requestID, 0, v12, v13);

}

- (void)submitLocationSearchWithCompletionQueue:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  uint8_t v7[8];
  _QWORD block[4];
  id v9;

  v5 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92___GEOMapServiceWiFiQualityLookupTicket_submitLocationSearchWithCompletionQueue_completion___block_invoke;
  block[3] = &unk_1E1C01F48;
  v9 = v5;
  v6 = v5;
  dispatch_async((dispatch_queue_t)a3, block);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: -[_GEOMapServiceWiFiQualityLookupTicket submitLocationSearchWithCompletionQueue:completion:] is unsupported", v7, 2u);
  }

}

- (void)cancelLocationSearch
{
  uint8_t v2[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: -[_GEOMapServiceWiFiQualityLookupTicket cancelLocationSearch] is unsupported", v2, 2u);
  }
}

- (void)submitTileLoadWithCompletionQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSString *tileKey;
  NSString *eTag;
  NSString *requestID;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  +[GEOWiFiQualityServiceManager sharedManager](GEOWiFiQualityServiceManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  tileKey = self->_tileKey;
  eTag = self->_eTag;
  requestID = self->_requestID;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __86___GEOMapServiceWiFiQualityLookupTicket_submitTileLoadWithCompletionQueue_completion___block_invoke;
  v14[3] = &unk_1E1C06C30;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v12 = v7;
  v13 = v6;
  objc_msgSend(v8, "submitWiFiQualityTileLoadForKey:eTag:requestId:auditToken:completionQueue:completion:", tileKey, eTag, requestID, 0, v13, v14);

}

- (void)_cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_GEOMapServiceWiFiQualityLookupTicket;
  -[GEOAbstractTicket cancel](&v4, sel_cancel);
  +[GEOWiFiQualityServiceManager sharedManager](GEOWiFiQualityServiceManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelRequestId:", self->_requestID);

}

- ($C4D369C9F02205611300857CFD58F739)dataRequestKind
{
  return ($C4D369C9F02205611300857CFD58F739)2856;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_eTag, 0);
  objc_storeStrong((id *)&self->_tileKey, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
