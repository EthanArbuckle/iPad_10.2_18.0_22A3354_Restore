@implementation _MKCitySelectorViewTicket

- (_MKCitySelectorViewTicket)initWithTicket:(id)a3
{
  id v5;
  _MKCitySelectorViewTicket *v6;
  _MKCitySelectorViewTicket *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MKCitySelectorViewTicket;
  v6 = -[_MKCitySelectorViewTicket init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_ticket, a3);

  return v7;
}

- (GEOMapServiceTraits)traits
{
  return (GEOMapServiceTraits *)-[GEOMapServiceCitySelectorViewTicket traits](self->_ticket, "traits");
}

- (void)cancel
{
  -[GEOMapServiceCitySelectorViewTicket cancel](self->_ticket, "cancel");
}

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4
{
  id v6;
  GEOMapServiceCitySelectorViewTicket *ticket;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a3;
  ticket = self->_ticket;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63___MKCitySelectorViewTicket_submitWithHandler_networkActivity___block_invoke;
  v9[3] = &unk_1E20DACB0;
  v10 = v6;
  v8 = v6;
  -[GEOMapServiceCitySelectorViewTicket submitWithHandler:networkActivity:](ticket, "submitWithHandler:networkActivity:", v9, a4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ticket, 0);
}

@end
