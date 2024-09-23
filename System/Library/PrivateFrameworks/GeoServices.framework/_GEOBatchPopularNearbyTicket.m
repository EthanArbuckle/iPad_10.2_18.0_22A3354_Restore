@implementation _GEOBatchPopularNearbyTicket

- (_GEOBatchPopularNearbyTicket)initWithRequest:(id)a3 traits:(id)a4 categories:(id)a5
{
  id v8;
  _GEOBatchPopularNearbyTicket *v9;
  uint64_t v10;
  NSArray *categories;
  _GEOBatchPopularNearbyTicket *v12;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_GEOBatchPopularNearbyTicket;
  v9 = -[GEOAbstractRequestResponseTicket initWithRequest:traits:](&v14, sel_initWithRequest_traits_, a3, a4);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    categories = v9->_categories;
    v9->_categories = (NSArray *)v10;

    v12 = v9;
  }

  return v9;
}

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4
{
  -[_GEOBatchPopularNearbyTicket submitWithHandler:auditToken:networkActivity:](self, "submitWithHandler:auditToken:networkActivity:", a3, 0, a4);
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
    v10[2] = __77___GEOBatchPopularNearbyTicket_submitWithHandler_auditToken_networkActivity___block_invoke;
    v10[3] = &unk_1E1C069B8;
    v10[4] = self;
    v11 = v8;
    -[GEOAbstractRequestResponseTicket performSubmitWithHandler:auditToken:timeout:networkActivity:](self, "performSubmitWithHandler:auditToken:timeout:networkActivity:", v10, a4, a5, 0.0);

  }
}

- (id)resultSectionHeaderForCategory:(id)a3
{
  id v4;
  GEOPDPlaceResponse *response;
  id *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  void *v12;
  uint64_t v14;
  id *v15;
  id *v16;
  id *v17;

  v4 = a3;
  response = self->super._response;
  if (!response)
    goto LABEL_6;
  -[GEOPDPlaceResponse globalResult](response, "globalResult");
  v6 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceGlobalResult batchPopularNearbySearchResult](v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = v7 ? objc_msgSend(*(id *)(v7 + 16), "count") : 0;
  v10 = -[NSArray count](self->_categories, "count");

  if (v9 == v10
    && (v11 = -[NSArray indexOfObject:](self->_categories, "indexOfObject:", v4), v11 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v14 = v11;
    -[GEOPDPlaceResponse globalResult](self->super._response, "globalResult");
    v15 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceGlobalResult batchPopularNearbySearchResult](v15);
    v16 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDBatchPopularNearbySearchResult popularNearbyResultAtIndex:](v16, v14);
    v17 = (id *)objc_claimAutoreleasedReturnValue();

    -[GEOPDPopularNearbyResult sectionHeader](v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_6:
    v12 = 0;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);
}

@end
