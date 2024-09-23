@implementation _MKGuideHomeViewTicket

- (_MKGuideHomeViewTicket)initWithTicket:(id)a3
{
  id v5;
  _MKGuideHomeViewTicket *v6;
  _MKGuideHomeViewTicket *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MKGuideHomeViewTicket;
  v6 = -[_MKGuideHomeViewTicket init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_ticket, a3);

  return v7;
}

- (GEOMapServiceTraits)traits
{
  return (GEOMapServiceTraits *)-[GEOMapServiceGuideHomeViewTicket traits](self->_ticket, "traits");
}

- (void)submitWithCallbackQueue:(id)a3 handler:(id)a4 networkActivity:(id)a5
{
  id v8;
  id v9;
  GEOMapServiceGuideHomeViewTicket *ticket;
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
  v13[2] = __74___MKGuideHomeViewTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke;
  v13[3] = &unk_1E20DAC38;
  v14 = v8;
  v15 = v9;
  v11 = v8;
  v12 = v9;
  -[GEOMapServiceGuideHomeViewTicket submitWithHandler:networkActivity:](ticket, "submitWithHandler:networkActivity:", v13, a5);

}

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4
{
  -[_MKGuideHomeViewTicket submitWithCallbackQueue:handler:networkActivity:](self, "submitWithCallbackQueue:handler:networkActivity:", MEMORY[0x1E0C80D38], a3, a4);
}

- (void)cancel
{
  -[GEOMapServiceGuideHomeViewTicket cancel](self->_ticket, "cancel");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ticket, 0);
}

@end
