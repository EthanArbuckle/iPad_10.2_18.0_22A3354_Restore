@implementation _MKSearchFieldPlaceholderTicket

- (_MKSearchFieldPlaceholderTicket)initWithTicket:(id)a3
{
  id v5;
  _MKSearchFieldPlaceholderTicket *v6;
  _MKSearchFieldPlaceholderTicket *v7;
  _MKSearchFieldPlaceholderTicket *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_MKSearchFieldPlaceholderTicket;
  v6 = -[_MKSearchFieldPlaceholderTicket init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_ticket, a3);
    v8 = v7;
  }

  return v7;
}

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4
{
  id v6;
  id v7;
  GEOMapServiceSearchFieldPlaceholderTicket *ticket;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    ticket = self->_ticket;
    v9 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __69___MKSearchFieldPlaceholderTicket_submitWithHandler_networkActivity___block_invoke;
    v12[3] = &unk_1E20DAB48;
    v13 = v6;
    v10[0] = v9;
    v10[1] = 3221225472;
    v10[2] = __69___MKSearchFieldPlaceholderTicket_submitWithHandler_networkActivity___block_invoke_3;
    v10[3] = &unk_1E20D8688;
    v11 = v7;
    -[GEOMapServiceSearchFieldPlaceholderTicket submitWithHandler:networkActivity:](ticket, "submitWithHandler:networkActivity:", v12, v10);

  }
}

- (void)cancel
{
  -[GEOMapServiceSearchFieldPlaceholderTicket cancel](self->_ticket, "cancel");
}

- (GEOMapServiceTraits)traits
{
  return (GEOMapServiceTraits *)-[GEOMapServiceSearchFieldPlaceholderTicket traits](self->_ticket, "traits");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ticket, 0);
}

@end
