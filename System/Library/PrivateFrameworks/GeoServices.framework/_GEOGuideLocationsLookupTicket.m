@implementation _GEOGuideLocationsLookupTicket

- (_GEOGuideLocationsLookupTicket)initWithRequest:(id)a3 traits:(id)a4 guideLocationsEntries:(id)a5
{
  id v9;
  _GEOGuideLocationsLookupTicket *v10;
  _GEOGuideLocationsLookupTicket *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_GEOGuideLocationsLookupTicket;
  v10 = -[GEOAbstractRequestResponseTicket initWithRequest:traits:](&v13, sel_initWithRequest_traits_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_guideLocationEntries, a5);

  return v11;
}

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4
{
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __68___GEOGuideLocationsLookupTicket_submitWithHandler_networkActivity___block_invoke;
    v8[3] = &unk_1E1C069B8;
    v8[4] = self;
    v9 = v6;
    -[GEOAbstractRequestResponseTicket performSubmitWithHandler:auditToken:timeout:networkActivity:](self, "performSubmitWithHandler:auditToken:timeout:networkActivity:", v8, 0, a4, 0.0);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guideLocationEntries, 0);
}

@end
