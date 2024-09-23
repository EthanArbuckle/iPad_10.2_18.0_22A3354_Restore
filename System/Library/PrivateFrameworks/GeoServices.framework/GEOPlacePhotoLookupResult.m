@implementation GEOPlacePhotoLookupResult

- (GEOPlacePhotoLookupResult)initWithPhotos:(id)a3 totalPhotoCount:(unint64_t)a4 mapItemItemIdentifier:(id)a5 originalRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  GEOPlacePhotoLookupResult *v13;
  uint64_t v14;
  NSArray *photos;
  objc_super v17;

  length = a6.length;
  location = a6.location;
  v11 = a3;
  v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)GEOPlacePhotoLookupResult;
  v13 = -[GEOPlacePhotoLookupResult init](&v17, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v11, "copy");
    photos = v13->_photos;
    v13->_photos = (NSArray *)v14;

    objc_storeStrong((id *)&v13->_mapItemIdentifier, a5);
    v13->_originalRange.location = location;
    v13->_originalRange.length = length;
    v13->_totalPhotoCount = a4;
  }

  return v13;
}

+ (void)buildVendorLookupResultForPlaceWithCaptionedPhotos:(id)a3 mapItemIdentifier:(id)a4 originalRange:(_NSRange)a5 completion:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  id v11;
  id v12;
  void *v13;
  id *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  NSUInteger v31;
  NSUInteger v32;
  uint64_t v33;
  _QWORD v34[2];

  length = a5.length;
  location = a5.location;
  v34[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  +[GEOPDCaptionedPhoto captionedPhotosForPlaceData:](GEOPDCaptionedPhoto, "captionedPhotosForPlaceData:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOPDAttribution componentLevelAttributionForPlaceDataPhotos:](GEOPDAttribution, "componentLevelAttributionForPlaceDataPhotos:", v10);
  v14 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAttribution vendorId](v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");

  if (v16)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v13, "count"));
    v18 = (void *)MEMORY[0x1E0C99E60];
    -[GEOPDAttribution vendorId](v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWithObject:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __123__GEOPlacePhotoLookupResult_buildVendorLookupResultForPlaceWithCaptionedPhotos_mapItemIdentifier_originalRange_completion___block_invoke;
    v24[3] = &unk_1E1C208A8;
    v25 = v14;
    v30 = v12;
    v26 = v13;
    v27 = v17;
    v28 = v10;
    v29 = v11;
    v31 = location;
    v32 = length;
    v21 = v17;
    _loadAttributions(v20, v24);

  }
  else
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v33 = *MEMORY[0x1E0C9AFB0];
    v34[0] = CFSTR("There is no attribution in the captioned photos component. ");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "GEOErrorWithCode:userInfo:", -11, v23);
    v21 = (id)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, id))v12 + 2))(v12, 0, v21);
  }

}

void __123__GEOPlacePhotoLookupResult_buildVendorLookupResultForPlaceWithCaptionedPhotos_mapItemIdentifier_originalRange_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _GEOPlaceDataPhoto *v12;
  int *v13;
  uint64_t v14;
  GEOPlacePhotoLookupResult *v15;
  void *v16;
  GEOPlacePhotoLookupResult *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;
  void *v34;
  uint64_t v35;
  _QWORD v36[3];

  v36[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "count") == 1)
  {
    -[GEOPDAttribution vendorId](*(id **)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 && (objc_msgSend(v5, "hasAttributionRequirement:", 3) & 1) != 0)
    {
      +[GEOMapItemAttribution attributionWithDataAttribution:searchInfo:class:](GEOMapItemAttribution, "attributionWithDataAttribution:searchInfo:class:", *(_QWORD *)(a1 + 32), v5, objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v7 = *(id *)(a1 + 40);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v29;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v29 != v10)
              objc_enumerationMutation(v7);
            v12 = -[_GEOPlaceDataPhoto initWithCaptionedPhoto:attribution:]([_GEOPlaceDataPhoto alloc], "initWithCaptionedPhoto:attribution:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v11), v6);
            objc_msgSend(*(id *)(a1 + 48), "addObject:", v12);

            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v9);
      }

      objc_msgSend(*(id *)(a1 + 56), "componentOfType:options:", 26, 3);
      v13 = (int *)objc_claimAutoreleasedReturnValue();
      if (v13)
        v14 = v13[23];
      else
        v14 = 0;

      v15 = [GEOPlacePhotoLookupResult alloc];
      v16 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
      v17 = -[GEOPlacePhotoLookupResult initWithPhotos:totalPhotoCount:mapItemItemIdentifier:originalRange:](v15, "initWithPhotos:totalPhotoCount:mapItemItemIdentifier:originalRange:", v16, v14, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));

      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    }
    else
    {
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v33 = *MEMORY[0x1E0C9AFB0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error in creating photos map item attribution with info %@"), v5);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "GEOErrorWithCode:userInfo:", -11, v27);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    }

  }
  else
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v35 = *MEMORY[0x1E0C9AFB0];
    v19 = (void *)MEMORY[0x1E0CB3940];
    -[GEOPDAttribution vendorId](*(id **)(a1 + 32));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "keyEnumerator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "allObjects");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("Error in fetching vendor identifiers. Requested %@ but received %@"), v20, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "GEOErrorWithCode:userInfo:", -11, v24);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

+ (void)buildLookupResultForPlaceWithPhotoCategories:(id)a3 mapItemIdentifier:(id)a4 originalRange:(_NSRange)a5 completion:(id)a6
{
  id v8;
  id v9;
  id *v10;
  id v11;
  void *v12;
  id *v13;
  id *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id *v20;
  void *v21;
  void *v22;
  id v23;
  id *v24;
  id v25;
  id v26;
  id *v28;
  _QWORD v29[4];
  id v30;
  id *v31;
  id v32;
  id v33;
  _NSRange v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a6;
  objc_msgSend(a3, "successfulComponentWithValuesOfType:", 84);
  v10 = (id *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v28 = v10;
  -[GEOPDComponent values](v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDComponentValue categorizedPhotos](v13);
  v14 = (id *)objc_claimAutoreleasedReturnValue();

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[GEOPDCategorizedPhotos photos](v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v36;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v36 != v18)
          objc_enumerationMutation(v15);
        -[GEOPDCaptionedPhoto attribution](*(id **)(*((_QWORD *)&v35 + 1) + 8 * v19));
        v20 = (id *)objc_claimAutoreleasedReturnValue();
        -[GEOPDAttribution vendorId](v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v21, "length"))
          objc_msgSend(v11, "addObject:", v21);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v17);
  }

  v22 = (void *)objc_msgSend(v11, "copy");
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __117__GEOPlacePhotoLookupResult_buildLookupResultForPlaceWithPhotoCategories_mapItemIdentifier_originalRange_completion___block_invoke;
  v29[3] = &unk_1E1C208D0;
  v30 = v11;
  v31 = v14;
  v32 = v8;
  v33 = v9;
  v34 = a5;
  v23 = v8;
  v24 = v14;
  v25 = v9;
  v26 = v11;
  _loadAttributions(v22, v29);

}

void __117__GEOPlacePhotoLookupResult_buildLookupResultForPlaceWithPhotoCategories_mapItemIdentifier_originalRange_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id *v12;
  id *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _GEOPlaceDataPhoto *v18;
  GEOPlacePhotoLookupResult *v19;
  uint64_t v20;
  uint64_t v21;
  GEOPlacePhotoLookupResult *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;
  _QWORD v34[3];

  v34[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v4 == objc_msgSend(v3, "count"))
  {
    v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[GEOPDCategorizedPhotos photos](*(id **)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = (uint64_t *)a1;
    -[GEOPDCategorizedPhotos photos](*(id **)(a1 + 40));
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(obj);
          v12 = *(id **)(*((_QWORD *)&v28 + 1) + 8 * i);
          -[GEOPDCaptionedPhoto attribution](v12);
          v13 = (id *)objc_claimAutoreleasedReturnValue();
          -[GEOPDAttribution vendorId](v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          -[GEOPDCaptionedPhoto attribution](v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          +[GEOMapItemAttribution attributionWithDataAttribution:searchInfo:class:](GEOMapItemAttribution, "attributionWithDataAttribution:searchInfo:class:", v16, v15, objc_opt_class());
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = -[_GEOPlaceDataPhoto initWithCaptionedPhoto:attribution:]([_GEOPlaceDataPhoto alloc], "initWithCaptionedPhoto:attribution:", v12, v17);
          objc_msgSend(v7, "addObject:", v18);

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v9);
    }

    v19 = [GEOPlacePhotoLookupResult alloc];
    v20 = v26[5];
    if (v20)
    {
      -[GEOPDCategorizedPhotos _readPhotos](v26[5]);
      v21 = objc_msgSend(*(id *)(v20 + 40), "count");
    }
    else
    {
      v21 = 0;
    }
    v22 = -[GEOPlacePhotoLookupResult initWithPhotos:totalPhotoCount:mapItemItemIdentifier:originalRange:](v19, "initWithPhotos:totalPhotoCount:mapItemItemIdentifier:originalRange:", v7, v21, v26[6], v26[8], v26[9]);
    (*(void (**)(void))(v26[7] + 16))();

  }
  else
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v33 = *MEMORY[0x1E0C9AFB0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error in loading attribution map"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "GEOErrorWithCode:userInfo:", -11, v25);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (NSArray)photos
{
  return self->_photos;
}

- (GEOMapItemIdentifier)mapItemIdentifier
{
  return self->_mapItemIdentifier;
}

- (unint64_t)totalPhotoCount
{
  return self->_totalPhotoCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItemIdentifier, 0);
  objc_storeStrong((id *)&self->_photos, 0);
}

@end
