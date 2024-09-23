@implementation MKWalletMerchantResponse

- (MKWalletMerchantResponse)initWithGEOMapItem:(id)a3
{
  id v5;
  MKWalletMerchantResponse *v6;
  MKWalletMerchantResponse *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKWalletMerchantResponse;
  v6 = -[MKWalletMerchantResponse init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mapItem, a3);

  return v7;
}

- (MKWalletMerchantResponse)initWithMerchantLookupResult:(id)a3
{
  id v5;
  MKWalletMerchantResponse *v6;
  MKWalletMerchantResponse *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKWalletMerchantResponse;
  v6 = -[MKWalletMerchantResponse init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_merchantLookupResult, a3);

  return v7;
}

- (MKWalletMerchantStylingInfo)placeStyling
{
  GEOMapItem *mapItem;
  MKWalletMerchantStylingInfo *v4;
  void *v5;
  MKWalletMerchantStylingInfo *v6;
  void *v7;

  mapItem = self->_mapItem;
  v4 = [MKWalletMerchantStylingInfo alloc];
  if (mapItem)
  {
    -[GEOMapItem _walletPlaceStyling](self->_mapItem, "_walletPlaceStyling");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[MKWalletMerchantStylingInfo initWithStyleAttributes:](v4, "initWithStyleAttributes:", v5);
  }
  else
  {
    -[GEOPDMerchantLookupResult categoryInfo](self->_merchantLookupResult, "categoryInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mapsCategoryStyleAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[MKWalletMerchantStylingInfo initWithStyleAttributes:](v4, "initWithStyleAttributes:", v7);

  }
  return v6;
}

- (NSString)localizedPlaceName
{
  GEOMapItem *mapItem;
  void *v4;
  void *v5;

  mapItem = self->_mapItem;
  if (mapItem)
  {
    -[GEOMapItem _walletPlaceLocalizedString](mapItem, "_walletPlaceLocalizedString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[GEOPDMerchantLookupResult categoryInfo](self->_merchantLookupResult, "categoryInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mapsCategoryId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v4;
}

- (NSString)localizedPlaceLanguage
{
  void *mapItem;

  mapItem = self->_mapItem;
  if (mapItem)
  {
    objc_msgSend(mapItem, "_walletPlaceLocalizedStringLocale");
    mapItem = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)mapItem;
}

- (MKWalletMerchantStylingInfo)walletCategoryStyling
{
  MKWalletMerchantStylingInfo *v3;
  void *v4;
  MKWalletMerchantStylingInfo *v5;
  void *v6;
  void *v7;

  if (self->_mapItem)
  {
    v3 = [MKWalletMerchantStylingInfo alloc];
    -[GEOMapItem _walletCategoryStyling](self->_mapItem, "_walletCategoryStyling");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[MKWalletMerchantStylingInfo initWithStyleAttributes:](v3, "initWithStyleAttributes:", v4);
  }
  else
  {
    -[GEOPDMerchantLookupResult categoryInfo](self->_merchantLookupResult, "categoryInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "walletCategoryId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    +[MKMapService sharedService](MKMapService, "sharedService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stylingForWalletCategory:", v4);
    v5 = (MKWalletMerchantStylingInfo *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (NSString)localizedWalletCategoryName
{
  void *mapItem;

  mapItem = self->_mapItem;
  if (mapItem)
  {
    objc_msgSend(mapItem, "_walletCategoryLocalizedString");
    mapItem = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)mapItem;
}

- (NSString)localizedWalletCategoryLanguage
{
  void *mapItem;

  mapItem = self->_mapItem;
  if (mapItem)
  {
    objc_msgSend(mapItem, "_walletCategoryLocalizedStringLocale");
    mapItem = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)mapItem;
}

- (NSString)mapsCategoryIdentifier
{
  GEOMapItem *mapItem;
  void *v4;
  void *v5;

  mapItem = self->_mapItem;
  if (mapItem)
  {
    -[GEOMapItem _walletMapsCategoryIdentifier](mapItem, "_walletMapsCategoryIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[GEOPDMerchantLookupResult categoryInfo](self->_merchantLookupResult, "categoryInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mapsCategoryId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v4;
}

- (NSString)walletCategoryIdentifier
{
  GEOMapItem *mapItem;
  void *v4;
  void *v5;

  mapItem = self->_mapItem;
  if (mapItem)
  {
    -[GEOMapItem _walletCategoryIdentifier](mapItem, "_walletCategoryIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[GEOPDMerchantLookupResult categoryInfo](self->_merchantLookupResult, "categoryInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "walletCategoryId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v4;
}

- (MKMapItem)mapItem
{
  void *v2;

  if (self->_mapItem)
  {
    +[MKMapItem _itemWithGeoMapItem:](MKMapItem, "_itemWithGeoMapItem:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (MKMapItem *)v2;
}

- (id)bestHeroImageForSize:(CGSize)a3 allowSmaller:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  _MKBestWalletHeroPhotoForGEOMapItem(self->_mapItem);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    goto LABEL_5;
  objc_msgSend(v8, "bestPhotoForSize:allowSmaller:", v4, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "url");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {

LABEL_5:
    -[GEOMapItem _bestHeroBrandIconURLForSize:allowSmaller:](self->_mapItem, "_bestHeroBrandIconURLForSize:allowSmaller:", v4, width, height);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(v10, "url");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v12;
}

- (NSString)heroImageProviderName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _MKBestWalletHeroPhotoForGEOMapItem(self->_mapItem);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "attribution");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "providerName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantLookupResult, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
