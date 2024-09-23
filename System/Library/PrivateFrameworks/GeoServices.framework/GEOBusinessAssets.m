@implementation GEOBusinessAssets

- (GEOBusinessAssets)initWithBusinessAssets:(id)a3
{
  id v5;
  GEOBusinessAssets *v6;
  GEOBusinessAssets *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOBusinessAssets;
  v6 = -[GEOBusinessAssets init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_businessAssets, a3);

  return v7;
}

- (GEOMapItemPhoto)coverPhoto
{
  void *v2;
  void *v3;

  -[GEOBusinessAssets coverPhotos](self, "coverPhotos");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOMapItemPhoto *)v3;
}

- (GEOMapItemPhoto)croppedPhoto
{
  void *v2;
  void *v3;

  -[GEOBusinessAssets croppedPhotos](self, "croppedPhotos");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOMapItemPhoto *)v3;
}

- (NSArray)coverPhotos
{
  NSArray *coverPhotos;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _GEOPlaceDataPhoto *v13;
  _GEOPlaceDataPhoto *v14;
  NSArray *v15;
  NSArray *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  coverPhotos = self->_coverPhotos;
  if (!coverPhotos)
  {
    v4 = (void *)MEMORY[0x1E0C99DE8];
    -[GEOPDBusinessAssets coverPhotos]((id *)&self->_businessAssets->super.super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[GEOPDBusinessAssets coverPhotos]((id *)&self->_businessAssets->super.super.isa);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
          v13 = [_GEOPlaceDataPhoto alloc];
          v14 = -[_GEOPlaceDataPhoto initWithCaptionedPhoto:](v13, "initWithCaptionedPhoto:", v12, (_QWORD)v18);
          objc_msgSend(v6, "addObject:", v14);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    v15 = (NSArray *)objc_msgSend(v6, "copy");
    v16 = self->_coverPhotos;
    self->_coverPhotos = v15;

    coverPhotos = self->_coverPhotos;
  }
  return coverPhotos;
}

- (NSArray)croppedPhotos
{
  NSArray *croppedPhotos;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _GEOPlaceDataPhoto *v13;
  _GEOPlaceDataPhoto *v14;
  NSArray *v15;
  NSArray *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  croppedPhotos = self->_croppedPhotos;
  if (!croppedPhotos)
  {
    v4 = (void *)MEMORY[0x1E0C99DE8];
    -[GEOPDBusinessAssets croppedCoverPhotos]((id *)&self->_businessAssets->super.super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[GEOPDBusinessAssets croppedCoverPhotos]((id *)&self->_businessAssets->super.super.isa);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
          v13 = [_GEOPlaceDataPhoto alloc];
          v14 = -[_GEOPlaceDataPhoto initWithCaptionedPhoto:](v13, "initWithCaptionedPhoto:", v12, (_QWORD)v18);
          objc_msgSend(v6, "addObject:", v14);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    v15 = (NSArray *)objc_msgSend(v6, "copy");
    v16 = self->_croppedPhotos;
    self->_croppedPhotos = v15;

    croppedPhotos = self->_croppedPhotos;
  }
  return croppedPhotos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_croppedPhotos, 0);
  objc_storeStrong((id *)&self->_coverPhotos, 0);
  objc_storeStrong((id *)&self->_businessAssets, 0);
}

+ (GEOBusinessAssets)businessAssetsWithPlaceData:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__36;
  v11 = __Block_byref_object_dispose__36;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__GEOBusinessAssets_PlaceDataExtras__businessAssetsWithPlaceData___block_invoke;
  v6[3] = &unk_1E1C09718;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateValidComponentValuesOfType:usingBlock:", 92, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (GEOBusinessAssets *)v4;
}

void __66__GEOBusinessAssets_PlaceDataExtras__businessAssetsWithPlaceData___block_invoke(uint64_t a1, id *a2, _BYTE *a3)
{
  GEOBusinessAssets *v5;
  uint64_t v6;
  void *v7;
  id v8;

  -[GEOPDComponentValue businessAssets](a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v5 = -[GEOBusinessAssets initWithBusinessAssets:]([GEOBusinessAssets alloc], "initWithBusinessAssets:", v8);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    *a3 = 1;
  }

}

@end
