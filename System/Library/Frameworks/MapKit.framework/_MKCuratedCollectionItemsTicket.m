@implementation _MKCuratedCollectionItemsTicket

- (_MKCuratedCollectionItemsTicket)initWithTicket:(id)a3
{
  id v5;
  _MKCuratedCollectionItemsTicket *v6;
  _MKCuratedCollectionItemsTicket *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MKCuratedCollectionItemsTicket;
  v6 = -[_MKCuratedCollectionItemsTicket init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_ticket, a3);

  return v7;
}

- (GEOMapServiceTraits)traits
{
  return (GEOMapServiceTraits *)-[GEOMapServiceCuratedCollectionItemsTicket traits](self->_ticket, "traits");
}

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4
{
  -[_MKCuratedCollectionItemsTicket submitWithCallbackQueue:handler:networkActivity:](self, "submitWithCallbackQueue:handler:networkActivity:", MEMORY[0x1E0C80D38], a3, a4);
}

- (void)submitWithCallbackQueue:(id)a3 handler:(id)a4 networkActivity:(id)a5
{
  id v8;
  id v9;
  GEOMapServiceCuratedCollectionItemsTicket *ticket;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v8 = a3;
  v9 = a4;
  ticket = self->_ticket;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __83___MKCuratedCollectionItemsTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke;
  v13[3] = &unk_1E20DAC60;
  v14 = v8;
  v15 = v9;
  v11 = v8;
  v12 = v9;
  -[GEOMapServiceCuratedCollectionItemsTicket submitWithHandler:networkActivity:](ticket, "submitWithHandler:networkActivity:", v13, a5);

}

- (void)cancel
{
  -[GEOMapServiceCuratedCollectionItemsTicket cancel](self->_ticket, "cancel");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ticket, 0);
}

@end
