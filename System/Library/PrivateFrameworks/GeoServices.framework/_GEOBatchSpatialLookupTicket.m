@implementation _GEOBatchSpatialLookupTicket

- (_GEOBatchSpatialLookupTicket)initWithRequest:(id)a3 forParameters:(id)a4 traits:(id)a5
{
  id v9;
  id v10;
  _GEOBatchSpatialLookupTicket *v11;
  _GEOBatchSpatialLookupTicket *v12;
  uint64_t v13;
  NSArray *parameters;
  uint64_t v15;
  NSMapTable *parametersToMapItems;
  _GEOBatchSpatialLookupTicket *v17;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_GEOBatchSpatialLookupTicket;
  v11 = -[GEOAbstractTicket initWithTraits:](&v19, sel_initWithTraits_, a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_request, a3);
    v13 = objc_msgSend(v10, "copy");
    parameters = v12->_parameters;
    v12->_parameters = (NSArray *)v13;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v15 = objc_claimAutoreleasedReturnValue();
    parametersToMapItems = v12->_parametersToMapItems;
    v12->_parametersToMapItems = (NSMapTable *)v15;

    v17 = v12;
  }

  return v12;
}

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4
{
  -[_GEOBatchSpatialLookupTicket submitWithHandler:auditToken:networkActivity:](self, "submitWithHandler:auditToken:networkActivity:", a3, 0, a4);
}

- (void)submitWithHandler:(id)a3 auditToken:(id)a4 networkActivity:(id)a5
{
  id v7;
  id v8;
  void *v9;
  GEOSpatialLookupBatchRequest *request;
  GEOMapServiceTraits *traits;
  _QWORD v12[5];
  id v13;

  v7 = a3;
  if (v7)
  {
    v8 = a4;
    +[GEOSpatialLookupRequester sharedInstance](GEOSpatialLookupRequester, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    request = self->_request;
    traits = self->super._traits;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __77___GEOBatchSpatialLookupTicket_submitWithHandler_auditToken_networkActivity___block_invoke;
    v12[3] = &unk_1E1C066E8;
    v12[4] = self;
    v13 = v7;
    objc_msgSend(v9, "startWithRequest:traits:timeout:auditToken:completionHandler:", request, traits, v8, v12, 0.0);

  }
}

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4 queue:(id)a5
{
  -[_GEOBatchSpatialLookupTicket submitWithHandler:auditToken:networkActivity:queue:](self, "submitWithHandler:auditToken:networkActivity:queue:", a3, 0, a4, a5);
}

- (void)submitWithHandler:(id)a3 auditToken:(id)a4 networkActivity:(id)a5 queue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  _GEOBatchSpatialLookupTicket *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _GEOBatchSpatialLookupTicket *v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!-[GEOAbstractTicket isCancelled](self, "isCancelled"))
  {
    v14 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __83___GEOBatchSpatialLookupTicket_submitWithHandler_auditToken_networkActivity_queue___block_invoke;
    v19[3] = &unk_1E1C06710;
    v22 = v10;
    v20 = v13;
    v21 = self;
    v15[0] = v14;
    v15[1] = 3221225472;
    v15[2] = __83___GEOBatchSpatialLookupTicket_submitWithHandler_auditToken_networkActivity_queue___block_invoke_3;
    v15[3] = &unk_1E1C06530;
    v18 = v12;
    v16 = v20;
    v17 = self;
    -[_GEOBatchSpatialLookupTicket submitWithHandler:auditToken:networkActivity:](self, "submitWithHandler:auditToken:networkActivity:", v19, v11, v15);

  }
}

- (id)mapItemsForParameters:(id)a3
{
  return -[NSMapTable objectForKey:](self->_parametersToMapItems, "objectForKey:", a3);
}

- ($C4D369C9F02205611300857CFD58F739)dataRequestKind
{
  return ($C4D369C9F02205611300857CFD58F739)2852;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parametersToMapItems, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
