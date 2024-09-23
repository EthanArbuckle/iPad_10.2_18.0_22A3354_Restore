@implementation CLSBusinessGeoServiceQuery

- (CLSBusinessGeoServiceQuery)initWithMUIDs:(id)a3
{
  id v4;
  CLSBusinessGeoServiceQuery *v5;
  CLSBusinessGeoServiceQuery *v6;
  uint64_t v7;
  NSArray *muids;
  void *v9;
  uint64_t v10;
  GEOMapServiceTicket *ticket;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CLSBusinessGeoServiceQuery;
  v5 = -[CLSBusinessGeoServiceQuery init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_isCancelled = 0;
    v7 = objc_msgSend(v4, "copy");
    muids = v6->_muids;
    v6->_muids = (NSArray *)v7;

    objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ticketForMUIDs:traits:", v6->_muids, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    ticket = v6->_ticket;
    v6->_ticket = (GEOMapServiceTicket *)v10;

  }
  return v6;
}

- (void)submitWithHandler:(id)a3
{
  id v4;
  GEOMapServiceTicket *ticket;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  ticket = self->_ticket;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__CLSBusinessGeoServiceQuery_submitWithHandler___block_invoke;
  v7[3] = &unk_1E84F7380;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[GEOMapServiceTicket submitWithHandler:networkActivity:](ticket, "submitWithHandler:networkActivity:", v7, 0);

}

- (void)cancel
{
  self->_isCancelled = 1;
  -[GEOMapServiceTicket cancel](self->_ticket, "cancel");
}

- (void)prepareForRetry
{
  GEOMapServiceTicket *v3;
  GEOMapServiceTicket *ticket;
  id v5;

  self->_isCancelled = 0;
  objc_msgSend(MEMORY[0x1E0D27218], "sharedService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ticketForMUIDs:traits:", self->_muids, 0);
  v3 = (GEOMapServiceTicket *)objc_claimAutoreleasedReturnValue();
  ticket = self->_ticket;
  self->_ticket = v3;

}

- (NSArray)muids
{
  return self->_muids;
}

- (GEOMapServiceTicket)ticket
{
  return self->_ticket;
}

- (NSArray)resultingMapItems
{
  return self->_resultingMapItems;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultingMapItems, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong((id *)&self->_muids, 0);
}

void __48__CLSBusinessGeoServiceQuery_submitWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), a2);
  v6 = a2;
  v7 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
