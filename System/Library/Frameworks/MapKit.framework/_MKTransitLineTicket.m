@implementation _MKTransitLineTicket

- (_MKTransitLineTicket)initWithTicket:(id)a3
{
  id v5;
  _MKTransitLineTicket *v6;
  _MKTransitLineTicket *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MKTransitLineTicket;
  v6 = -[_MKTransitLineTicket init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_ticket, a3);

  return v7;
}

- (GEOMapServiceTraits)traits
{
  return (GEOMapServiceTraits *)-[GEOMapServiceTransitLineTicket traits](self->_ticket, "traits");
}

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4
{
  id v6;
  GEOMapServiceTransitLineTicket *ticket;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a3;
  ticket = self->_ticket;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58___MKTransitLineTicket_submitWithHandler_networkActivity___block_invoke;
  v9[3] = &unk_1E20D8000;
  v10 = v6;
  v8 = v6;
  -[GEOMapServiceTransitLineTicket submitWithHandler:networkActivity:](ticket, "submitWithHandler:networkActivity:", v9, a4);

}

- (void)cancel
{
  -[GEOMapServiceTransitLineTicket cancel](self->_ticket, "cancel");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ticket, 0);
}

@end
