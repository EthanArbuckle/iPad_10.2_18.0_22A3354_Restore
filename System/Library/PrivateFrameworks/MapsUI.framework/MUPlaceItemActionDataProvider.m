@implementation MUPlaceItemActionDataProvider

- (void)_placeItemDidUpdate
{
  MUPlaceDataAvailability *v3;
  void *v4;
  void *v5;
  MUPlaceDataAvailability *v6;
  MUPlaceDataAvailability *availability;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  v3 = [MUPlaceDataAvailability alloc];
  -[MKPlaceItemActionDataProvider placeItem](self, "placeItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MUPlaceDataAvailability initWithMapItem:options:](v3, "initWithMapItem:options:", v5, -[MKPlaceItemActionDataProvider options](self, "options"));
  availability = self->_availability;
  self->_availability = v6;

  if (-[MUPlaceDataAvailability isRouteCreationAvailable](self->_availability, "isRouteCreationAvailable"))
  {
    v8 = objc_alloc(MEMORY[0x1E0D27168]);
    -[MKPlaceItemActionDataProvider mapItem](self, "mapItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_coordinate");
    v11 = v10;
    -[MKPlaceItemActionDataProvider mapItem](self, "mapItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_coordinate");
    v13 = (void *)objc_msgSend(v8, "initWithLatitude:longitude:", v11);

    objc_initWeak(&location, self);
    v14 = (void *)MEMORY[0x1E0D27048];
    v15 = MEMORY[0x1E0C80D38];
    v16 = MEMORY[0x1E0C80D38];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __52__MUPlaceItemActionDataProvider__placeItemDidUpdate__block_invoke;
    v17[3] = &unk_1E2E040C8;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v14, "customRouteCreationSupportedForLocation:queue:handler:", v13, v15, v17);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

  }
  else
  {
    self->_isDroppedPinOrAddressInSupportedCustomRouteRegion = 0;
  }
}

void __52__MUPlaceItemActionDataProvider__placeItemDidUpdate__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  _BYTE *v4;
  char v5;
  _BYTE *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      v6 = WeakRetained;
      v5 = objc_msgSend(*((id *)WeakRetained + 3), "isRouteCreationAvailable");
      v4 = v6;
    }
    else
    {
      v5 = 0;
    }
    v4[32] = v5;
  }

}

- (BOOL)supportsAddingPhotos
{
  return -[MUPlaceDataAvailability supportsAddingPhotos](self->_availability, "supportsAddingPhotos");
}

- (BOOL)supportsMessagesForBusiness
{
  return -[MUPlaceDataAvailability supportsMessagesForBusiness](self->_availability, "supportsMessagesForBusiness");
}

- (BOOL)isInSupportedCustomRouteRegion
{
  return self->_isDroppedPinOrAddressInSupportedCustomRouteRegion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availability, 0);
}

@end
