@implementation _GEOFailedTicket

- (_GEOFailedTicket)initWithError:(id)a3 traits:(id)a4
{
  id v7;
  _GEOFailedTicket *v8;
  _GEOFailedTicket *v9;
  _GEOFailedTicket *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_GEOFailedTicket;
  v8 = -[GEOAbstractTicket initWithTraits:](&v12, sel_initWithTraits_, a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_error, a3);
    v10 = v9;
  }

  return v9;
}

- (void)submitWithHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  id v18;

  v7 = a3;
  if (v7)
  {
    +[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEnabledForSubTestWithName:", CFSTR("GEOPPTTest_PlaceRequest"));

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "postNotificationName:object:", CFSTR("GEOPPTTest_PlaceRequestBEGIN"), 0);

    }
    +[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEnabledForSubTestWithName:", CFSTR("GEOPPTTest_PlaceRequest_RequestPreparing"));

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "postNotificationName:object:", CFSTR("GEOPPTTest_PlaceRequest_RequestPreparingBEGIN"), 0);

    }
    qos_class_self();
    v17 = MEMORY[0x1E0C809B0];
    v18 = v7;
    geo_dispatch_async_qos();
    +[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager", v17, 3221225472, __73___GEOFailedTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke, &unk_1E1BFF970, self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEnabledForSubTestWithName:", CFSTR("GEOPPTTest_PlaceRequest_RequestPreparing"));

    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "postNotificationName:object:", CFSTR("GEOPPTTest_PlaceRequest_RequestPreparingEND"), 0);

    }
  }

}

- (void)submitWithRefinedHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  id v18;

  v7 = a3;
  if (v7)
  {
    +[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEnabledForSubTestWithName:", CFSTR("GEOPPTTest_PlaceRequest"));

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "postNotificationName:object:", CFSTR("GEOPPTTest_PlaceRequestBEGIN"), 0);

    }
    +[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEnabledForSubTestWithName:", CFSTR("GEOPPTTest_PlaceRequest_RequestPreparing"));

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "postNotificationName:object:", CFSTR("GEOPPTTest_PlaceRequest_RequestPreparingBEGIN"), 0);

    }
    qos_class_self();
    v17 = MEMORY[0x1E0C809B0];
    v18 = v7;
    geo_dispatch_async_qos();
    +[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager", v17, 3221225472, __80___GEOFailedTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity___block_invoke, &unk_1E1BFF970, self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEnabledForSubTestWithName:", CFSTR("GEOPPTTest_PlaceRequest_RequestPreparing"));

    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "postNotificationName:object:", CFSTR("GEOPPTTest_PlaceRequest_RequestPreparingEND"), 0);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
