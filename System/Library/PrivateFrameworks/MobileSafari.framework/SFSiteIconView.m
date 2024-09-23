@implementation SFSiteIconView

void __60___SFSiteIconView__updateSiteIconViewWithTouchIconResponse___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 520));
  objc_msgSend(WeakRetained, "siteIconViewDidUpdate:", *(_QWORD *)(a1 + 32));

}

void __37___SFSiteIconView_updateBookmarkData__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "url");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "host");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (WeakRetained[62] == *(_QWORD *)(a1 + 40))
    {
      if (!v5
        || (objc_msgSend(v9, "url"),
            v6 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v6, "host"),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            v8 = objc_msgSend(v5, "isEqualToString:", v7),
            v7,
            v6,
            v8))
      {
        objc_msgSend(WeakRetained, "_updateSiteIconViewWithTouchIconResponse:", v9);
      }
    }

  }
}

void __85___SFSiteIconView_updateSiteIconViewWithLinkMetadata_requiredImageSize_fallbackIcon___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 520));
  objc_msgSend(WeakRetained, "siteIconViewDidUpdate:", *(_QWORD *)(a1 + 32));

}

@end
