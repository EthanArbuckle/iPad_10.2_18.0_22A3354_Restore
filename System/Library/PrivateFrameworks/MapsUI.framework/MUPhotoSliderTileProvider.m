@implementation MUPhotoSliderTileProvider

- (MUPhotoSliderTileProvider)initWithMapItem:(id)a3
{
  id v5;
  MUPhotoSliderTileProvider *v6;
  MUPhotoSliderTileProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUPhotoSliderTileProvider;
  v6 = -[MUPhotoSliderTileProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapItem, a3);
    -[MUPhotoSliderTileProvider _setup](v7, "_setup");
  }

  return v7;
}

- (void)_setup
{
  int64_t v3;

  v3 = -[MUPhotoSliderTileProvider displayType](self, "displayType");
  if (v3 == 1)
  {
    -[MUPhotoSliderTileProvider _setupForPhotoAlbums](self, "_setupForPhotoAlbums");
  }
  else if (!v3)
  {
    -[MUPhotoSliderTileProvider _setupForFlatPhotoList](self, "_setupForFlatPhotoList");
  }
}

- (void)_setupForPhotoAlbums
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSArray *v18;
  NSArray *photos;
  NSObject *v20;
  uint8_t v21[16];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_photos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v5, "count"));

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_captionedPhotoAlbums");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v12), "photoList");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = objc_alloc(MEMORY[0x1E0CC1838]);
        -[MKMapItem name](self->_mapItem, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v15, "initWithGeoMapItemPhoto:fallbackTitle:", v14, v16);

        objc_msgSend(v6, "addObject:", v17);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

  v18 = (NSArray *)objc_msgSend(v6, "copy");
  photos = self->_photos;
  self->_photos = v18;

  self->_showFullScreen = 1;
  MUGetMUPhotoSliderTileProviderLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_191DB8000, v20, OS_LOG_TYPE_INFO, "Showing full screen since we have an album layout", v21, 2u);
  }

}

- (void)_setupForFlatPhotoList
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  NSArray *v17;
  NSArray *photos;
  uint8_t v19[16];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[MKMapItem _mapkit_resolvedFlatPhotoList](self->_mapItem, "_mapkit_resolvedFlatPhotoList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  -[MKMapItem _mapkit_resolvedFlatPhotoList](self->_mapItem, "_mapkit_resolvedFlatPhotoList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v10);
        v12 = objc_alloc(MEMORY[0x1E0CC1838]);
        -[MKMapItem name](self->_mapItem, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v12, "initWithGeoMapItemPhoto:fallbackTitle:", v11, v13);
        objc_msgSend(v5, "addObject:", v14);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }
  MUGetMUPhotoSliderTileProviderLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_191DB8000, v15, OS_LOG_TYPE_INFO, "Flat list layout, checking if we should show full screen", v19, 2u);
  }

  v16 = objc_msgSend(v5, "indexOfObjectPassingTest:", &__block_literal_global_52);
  v17 = (NSArray *)objc_msgSend(v5, "copy");
  photos = self->_photos;
  self->_photos = v17;

  self->_showFullScreen = v16 == 0x7FFFFFFFFFFFFFFFLL;
}

BOOL __51__MUPhotoSliderTileProvider__setupForFlatPhotoList__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v5;
  _BOOL8 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(v5, "displayFullScreenPhotoGallery"))
  {
    v6 = *a4 != 0;
  }
  else
  {
    MUGetMUPhotoSliderTileProviderLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v6 = 1;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "attribution");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "providerName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_191DB8000, v7, OS_LOG_TYPE_INFO, "Vendor %@ does not allow use of gallery", (uint8_t *)&v11, 0xCu);

    }
    *a4 = 1;
  }

  return v6;
}

- (unint64_t)numberOfPhotos
{
  unint64_t result;
  void *v4;
  void *v5;
  unint64_t v6;

  result = -[MUPhotoSliderTileProvider displayType](self, "displayType");
  if (result == 1)
  {
    -[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_captionedPhotoAlbums");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    return v6;
  }
  else if (!result)
  {
    return -[NSArray count](self->_photos, "count");
  }
  return result;
}

- (int64_t)displayType
{
  return -[MKMapItem _mapkit_hasFlatListOfPhotos](self->_mapItem, "_mapkit_hasFlatListOfPhotos") ^ 1;
}

- (id)photoItemAtIndex:(unint64_t)a3
{
  uint8_t v6[16];

  if (-[MUPhotoSliderTileProvider numberOfPhotos](self, "numberOfPhotos") <= a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_fault_impl(&dword_191DB8000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: index < self.numberOfPhotos", v6, 2u);
    }
    return 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_photos, "objectAtIndexedSubscript:", a3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)albumIdForPhoto:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[MUPhotoSliderTileProvider displayType](self, "displayType") == 1)
  {
    -[MUPhotoSliderTileProvider _photoAlbumForPhoto:](self, "_photoAlbumForPhoto:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "categoryId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)overlayForPhoto:(id)a3
{
  void *v3;
  id v5;
  int64_t v6;
  uint64_t v7;

  v5 = a3;
  v6 = -[MUPhotoSliderTileProvider displayType](self, "displayType");
  if (v6 == 1)
  {
    -[MUPhotoSliderTileProvider _albumOverlayForPhoto:](self, "_albumOverlayForPhoto:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!v6)
  {
    -[MUPhotoSliderTileProvider _flatListOverlayForPhoto:](self, "_flatListOverlayForPhoto:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v3 = (void *)v7;
  }

  return v3;
}

- (id)yourPhotosTileOverlay
{
  MUPhotoTileOverlay *v2;
  void *v3;

  v2 = objc_alloc_init(MUPhotoTileOverlay);
  _MULocalizedStringFromThisBundle(CFSTR("Your Photos [Placecard's Your Photos Album]"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPhotoTileOverlay setTileTitle:](v2, "setTileTitle:", v3);

  return v2;
}

- (id)_flatListOverlayForPhoto:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  BOOL v9;
  MUPhotoTileOverlay *v10;
  MUPhotoTileOverlay *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "attribution");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "shouldHandlePhotosLocally"))
  {
    objc_msgSend(v3, "geoMapItemPhoto");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "author");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "attribution");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isUserSubmitted");

    if (GEOConfigGetBOOL())
      v9 = v8 == 0;
    else
      v9 = 1;
    if (v9 || !objc_msgSend(v6, "length"))
    {
      v11 = 0;
      goto LABEL_12;
    }
    v10 = objc_alloc_init(MUPhotoTileOverlay);
    v11 = v10;
LABEL_10:
    -[MUPhotoTileOverlay setAttributionTitle:](v10, "setAttributionTitle:", v6);
LABEL_12:

    goto LABEL_13;
  }
  objc_msgSend(v4, "captionDisplayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (MUPhotoTileOverlay *)objc_msgSend(v12, "length");

  if (v11)
  {
    v11 = objc_alloc_init(MUPhotoTileOverlay);
    objc_msgSend(v4, "captionDisplayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11;
    goto LABEL_10;
  }
LABEL_13:

  return v11;
}

- (id)_albumOverlayForPhoto:(id)a3
{
  id v4;
  void *v5;
  MUPhotoTileOverlay *v6;
  void *v7;

  v4 = a3;
  -[MUPhotoSliderTileProvider _photoAlbumForPhoto:](self, "_photoAlbumForPhoto:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[MUPhotoSliderTileProvider _flatListOverlayForPhoto:](self, "_flatListOverlayForPhoto:", v4);
    v6 = (MUPhotoTileOverlay *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      v6 = objc_alloc_init(MUPhotoTileOverlay);
    objc_msgSend(v5, "categoryName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPhotoTileOverlay setTileTitle:](v6, "setTileTitle:", v7);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_photoAlbumForPhoto:(id)a3
{
  NSUInteger v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = -[NSArray indexOfObject:](self->_photos, "indexOfObject:", a3);
  -[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_captionedPhotoAlbums");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v4 >= v7)
  {
    v10 = 0;
  }
  else
  {
    -[MKMapItem _geoMapItem](self->_mapItem, "_geoMapItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_captionedPhotoAlbums");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (BOOL)_canShowARPCallToAction
{
  return objc_msgSend(MEMORY[0x1E0CC18A8], "shouldShowAddPhotoButtonOnEndOfPhotoSliderForMapItem:", self->_mapItem);
}

- (BOOL)showMorePhotoPunchoutAtEndOfSlider
{
  unint64_t v3;
  BOOL result;
  unint64_t UInteger;
  unint64_t v6;

  if (-[MUPhotoSliderTileProvider displayType](self, "displayType") == 1)
  {
    v3 = -[MUPhotoSliderTileProvider numberOfPhotos](self, "numberOfPhotos");
    return v3 >= GEOConfigGetUInteger();
  }
  else
  {
    UInteger = GEOConfigGetUInteger();
    v6 = -[MKMapItem _mapkit_numberOfPhotosAvailableForFlatList](self->_mapItem, "_mapkit_numberOfPhotosAvailableForFlatList");
    if (-[MKMapItem _mapkit_hasSinglePhotoVendor](self->_mapItem, "_mapkit_hasSinglePhotoVendor"))
    {
      result = -[MKMapItem _mapkit_canAtLeastOneAttributionShowPhotosLocally](self->_mapItem, "_mapkit_canAtLeastOneAttributionShowPhotosLocally");
      if (v6 <= UInteger)
        return 0;
    }
    else
    {
      return v6 > UInteger;
    }
  }
  return result;
}

- (BOOL)showPhotoAttributionAtEndOfSlider
{
  int v3;

  v3 = -[MKMapItem _mapkit_hasSinglePhotoVendor](self->_mapItem, "_mapkit_hasSinglePhotoVendor");
  if (v3)
    LOBYTE(v3) = (-[MKMapItem _mapkit_canAtLeastOneAttributionShowPhotosLocally](self->_mapItem, "_mapkit_canAtLeastOneAttributionShowPhotosLocally") & 1) == 0&& -[MUPhotoSliderTileProvider displayType](self, "displayType") == 0;
  return v3;
}

- (BOOL)shouldRouteToPhotoThumbnailGallery
{
  int v3;
  unint64_t v4;

  v3 = -[MKMapItem _mapkit_supportsFullScreenExperience](self->_mapItem, "_mapkit_supportsFullScreenExperience");
  if (v3)
  {
    v4 = -[MUPhotoSliderTileProvider numberOfPhotos](self, "numberOfPhotos");
    LOBYTE(v3) = v4 > GEOConfigGetUInteger();
  }
  return v3;
}

- (BOOL)showFullScreen
{
  return self->_showFullScreen;
}

- (NSArray)photos
{
  return self->_photos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photos, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
