@implementation GEOPlaceExternalActionLink

- (GEOPlaceExternalActionLink)initWithLinkData:(id)a3 attributionMap:(id)a4
{
  id v7;
  id v8;
  GEOPlaceExternalActionLink *v9;
  id *p_isa;
  GEOPlaceExternalActionLink *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  if (v7 && -[GEOPDLink linkType]((uint64_t)v7))
  {
    v13.receiver = self;
    v13.super_class = (Class)GEOPlaceExternalActionLink;
    v9 = -[GEOPlaceExternalActionLink init](&v13, sel_init);
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_actionLink, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (int)type
{
  unsigned int v2;

  v2 = -[GEOPDLink linkType]((uint64_t)self->_actionLink) - 1;
  if (v2 > 3)
    return 0;
  else
    return dword_189CE3A90[v2];
}

- (GEOPlaceExternalActionLinkQuickLinkParams)quickLinkParams
{
  GEOPlaceExternalActionLinkQuickLinkParams *v3;
  void *v4;
  GEOPlaceExternalActionLinkQuickLinkParams *v5;

  v3 = [GEOPlaceExternalActionLinkQuickLinkParams alloc];
  -[GEOPDLink quickLinkParams]((id *)&self->_actionLink->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GEOPlaceExternalActionLinkQuickLinkParams initWithQuickLinkParams:](v3, "initWithQuickLinkParams:", v4);

  return v5;
}

- (GEOPlaceExternalActionLinkAppClipParams)appClipParams
{
  GEOPlaceExternalActionLinkAppClipParams *v3;
  void *v4;
  GEOPlaceExternalActionLinkAppClipParams *v5;

  v3 = [GEOPlaceExternalActionLinkAppClipParams alloc];
  -[GEOPDLink appClipParams]((id *)&self->_actionLink->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GEOPlaceExternalActionLinkAppClipParams initWithAppClipParams:](v3, "initWithAppClipParams:", v4);

  return v5;
}

- (GEOPlaceExternalActionLinkExtensionParams)siriExtensionParams
{
  GEOPlaceExternalActionLinkExtensionParams *v3;
  void *v4;
  GEOPlaceExternalActionLinkExtensionParams *v5;

  v3 = [GEOPlaceExternalActionLinkExtensionParams alloc];
  -[GEOPDLink extensionParams]((id *)&self->_actionLink->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GEOPlaceExternalActionLinkExtensionParams initWithExtensionParams:attributionMap:](v3, "initWithExtensionParams:attributionMap:", v4, self->_attributionMap);

  return v5;
}

- (GEOPlaceExternalActionWebLinkParams)webLinkParams
{
  GEOPlaceExternalActionWebLinkParams *v3;
  void *v4;
  GEOPlaceExternalActionWebLinkParams *v5;

  v3 = [GEOPlaceExternalActionWebLinkParams alloc];
  -[GEOPDLink webLinkParams]((id *)&self->_actionLink->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GEOPlaceExternalActionWebLinkParams initWithWebLinkParams:](v3, "initWithWebLinkParams:", v4);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionMap, 0);
  objc_storeStrong((id *)&self->_actionLink, 0);
}

- (GEOQuickLink)quickLink
{
  void *v3;
  GEOPDQuickLinkItem *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  GEOQuickLink *v10;

  -[GEOPlaceExternalActionLink quickLinkParams](self, "quickLinkParams");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc_init(GEOPDQuickLinkItem);
    -[GEOPlaceExternalActionLink quickLinkParams](self, "quickLinkParams");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDQuickLinkItem setUrl:]((uint64_t)v4, v7);

    -[GEOPlaceExternalActionLink quickLinkParams](self, "quickLinkParams");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appAdamId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDQuickLinkItem setAppAdamId:]((uint64_t)v4, v9);

    if (v4)
    {
      *(_WORD *)&v4->_flags |= 0x100u;
      *(_WORD *)&v4->_flags |= 1u;
      v4->_linkType = 1;
    }
    v10 = -[GEOQuickLink initWithQuickLink:]([GEOQuickLink alloc], "initWithQuickLink:", v4);

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (GEOQuickLink)appClipRepresentedAsQuickLink
{
  void *v3;
  GEOPDQuickLinkItem *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  GEOQuickLink *v10;

  -[GEOPlaceExternalActionLink appClipParams](self, "appClipParams");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc_init(GEOPDQuickLinkItem);
    -[GEOPlaceExternalActionLink appClipParams](self, "appClipParams");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDQuickLinkItem setUrl:]((uint64_t)v4, v7);

    -[GEOPlaceExternalActionLink appClipParams](self, "appClipParams");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDQuickLinkItem setBundleId:]((uint64_t)v4, v9);

    if (v4)
    {
      *(_WORD *)&v4->_flags |= 0x100u;
      *(_WORD *)&v4->_flags |= 1u;
      v4->_linkType = 2;
    }
    v10 = -[GEOQuickLink initWithQuickLink:]([GEOQuickLink alloc], "initWithQuickLink:", v4);

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)appClipUsingArtworkURL:(id)a3 title:(id)a4
{
  id v6;
  id v7;
  void *v8;
  GEOAppStoreAppClip *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  GEOAppStoreAppClip *v14;

  v6 = a3;
  v7 = a4;
  -[GEOPlaceExternalActionLink appClipParams](self, "appClipParams");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = [GEOAppStoreAppClip alloc];
    -[GEOPlaceExternalActionLink appClipParams](self, "appClipParams");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPlaceExternalActionLink appClipParams](self, "appClipParams");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "url");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[GEOAppStoreAppClip initWithBundleID:title:subtitle:appShortName:appClipURL:artworkURL:providerName:](v9, "initWithBundleID:title:subtitle:appShortName:appClipURL:artworkURL:providerName:", v11, v7, &stru_1E1C241D0, &stru_1E1C241D0, v13, v6, &stru_1E1C241D0);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (GEOAttributionApp)attributionAppForMapsExtension
{
  void *v3;
  void *v4;
  void *v5;

  -[GEOPlaceExternalActionLink siriExtensionParams](self, "siriExtensionParams");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[GEOPlaceExternalActionLink siriExtensionParams](self, "siriExtensionParams");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attributionApp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (GEOAttributionApp *)v5;
}

@end
