@implementation _GEOIdentifiersTicket

- (void)submitWithHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6
{
  id v9;
  id v10;
  id v11;
  unint64_t options;
  unint64_t v13;
  void *v14;
  NSArray *identifiers;
  uint64_t resultProviderID;
  GEOMapServiceTraits *traits;
  GEODataRequestThrottlerToken *throttlerToken;
  void *v19;
  id requestToken;
  void *v21;
  _QWORD v22[5];
  id v23;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (v9)
  {
    if (self->_identifiers)
    {
      options = self->_options;
      v13 = -[GEOAbstractTicket cachePolicy](self, "cachePolicy");
      if (v13 - 1 <= 3)
        options = qword_189CCD500[v13 - 1];
      +[GEOPlaceCardRequester sharedRequester](GEOPlaceCardRequester, "sharedRequester");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      identifiers = self->_identifiers;
      resultProviderID = self->_resultProviderID;
      traits = self->super.super._traits;
      throttlerToken = self->super.super._throttlerToken;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __78___GEOIdentifiersTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke;
      v22[3] = &unk_1E1C069B8;
      v22[4] = self;
      v23 = v9;
      objc_msgSend(v14, "requestIdentifiers:resultProviderID:traits:options:auditToken:throttleToken:networkActivity:requesterHandler:", identifiers, resultProviderID, traits, options, v10, throttlerToken, v11, v22);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      requestToken = self->_requestToken;
      self->_requestToken = v19;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -13, CFSTR("ticket was created with no identifiers"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v21);

    }
  }

}

- (_GEOIdentifiersTicket)initWithIdentifiers:(id)a3 resultProviderID:(int)a4 contentProvider:(id)a5 traits:(id)a6 options:(unint64_t)a7
{
  id v12;
  id v13;
  _GEOIdentifiersTicket *v14;
  uint64_t v15;
  NSArray *identifiers;
  uint64_t v17;
  NSString *contentProvider;
  _GEOIdentifiersTicket *v19;
  objc_super v21;

  v12 = a3;
  v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_GEOIdentifiersTicket;
  v14 = -[GEOAbstractTicket initWithTraits:](&v21, sel_initWithTraits_, a6);
  if (v14)
  {
    v15 = objc_msgSend(v12, "copy");
    identifiers = v14->_identifiers;
    v14->_identifiers = (NSArray *)v15;

    v14->_resultProviderID = a4;
    v17 = objc_msgSend(v13, "copy");
    contentProvider = v14->_contentProvider;
    v14->_contentProvider = (NSString *)v17;

    v14->_options = a7;
    v14->super._searchResultType = 0;
    v14->super._mapDisplayType = 0;
    v19 = v14;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProvider, 0);
  objc_storeStrong(&self->_requestToken, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
}

- (_GEOIdentifiersTicket)initWithTraits:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_GEOIdentifiersTicket;
  return -[GEOAbstractTicket initWithTraits:](&v4, sel_initWithTraits_, a3);
}

- (_GEOIdentifiersTicket)initWithMUIDs:(id)a3 resultProviderID:(int)a4 contentProvider:(id)a5 traits:(id)a6 options:(unint64_t)a7
{
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  GEOMapItemIdentifier *v18;
  _GEOIdentifiersTicket *v19;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v9 = *(_QWORD *)&a4;
  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v22 = a5;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v25;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v13);
        v18 = -[GEOMapItemIdentifier initWithMUID:resultProviderID:coordinate:]([GEOMapItemIdentifier alloc], "initWithMUID:resultProviderID:coordinate:", objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v17), "unsignedLongLongValue"), v9, -180.0, -180.0);
        objc_msgSend(v12, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v15);
  }

  v19 = -[_GEOIdentifiersTicket initWithIdentifiers:resultProviderID:contentProvider:traits:options:](self, "initWithIdentifiers:resultProviderID:contentProvider:traits:options:", v12, v9, v22, v11, a7);
  return v19;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)_GEOIdentifiersTicket;
  -[GEOAbstractTicket description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ identifiers: %@"), v4, self->_identifiers);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- ($C4D369C9F02205611300857CFD58F739)dataRequestKind
{
  int v2;
  $C4D369C9F02205611300857CFD58F739 v3;

  v2 = -[GEOMapServiceTraits requestPriority](self->super.super._traits, "requestPriority");
  v3 = ($C4D369C9F02205611300857CFD58F739)0x1700000500;
  if (v2 != 1)
    v3 = ($C4D369C9F02205611300857CFD58F739)0x1700000300;
  if (v2 == 2)
    return ($C4D369C9F02205611300857CFD58F739)0x1700000700;
  else
    return v3;
}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_GEOIdentifiersTicket;
  -[GEOAbstractTicket cancel](&v4, sel_cancel);
  +[GEOPlaceCardRequester sharedRequester](GEOPlaceCardRequester, "sharedRequester");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelRequest:", self->_requestToken);

}

@end
