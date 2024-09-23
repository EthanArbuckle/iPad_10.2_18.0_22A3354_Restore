@implementation _GEOSearchHomeTicket

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4
{
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58___GEOSearchHomeTicket_submitWithHandler_networkActivity___block_invoke;
    v8[3] = &unk_1E1C06B90;
    v9 = v6;
    -[GEOAbstractRequestResponseTicket performSubmitWithHandler:auditToken:timeout:networkActivity:](self, "performSubmitWithHandler:auditToken:timeout:networkActivity:", v8, 0, a4, 0.0);

  }
}

@end
