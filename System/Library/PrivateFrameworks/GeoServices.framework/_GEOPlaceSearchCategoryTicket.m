@implementation _GEOPlaceSearchCategoryTicket

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4
{
  -[_GEOPlaceSearchCategoryTicket submitWithHandler:auditToken:networkActivity:](self, "submitWithHandler:auditToken:networkActivity:", a3, 0, a4);
}

- (void)submitWithHandler:(id)a3 auditToken:(id)a4 networkActivity:(id)a5
{
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v8 = a3;
  v9 = v8;
  if (v8)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __78___GEOPlaceSearchCategoryTicket_submitWithHandler_auditToken_networkActivity___block_invoke;
    v10[3] = &unk_1E1C069B8;
    v10[4] = self;
    v11 = v8;
    -[GEOAbstractRequestResponseTicket performSubmitWithHandler:auditToken:timeout:networkActivity:](self, "performSubmitWithHandler:auditToken:timeout:networkActivity:", v10, a4, a5, 0.0);

  }
}

@end
