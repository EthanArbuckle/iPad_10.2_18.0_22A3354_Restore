@implementation MUPlaceHikingTileViewModel

- (MUPlaceHikingTileViewModel)initWithGEOTrail:(id)a3 hikingItemType:(int)a4
{
  uint64_t v4;
  id v6;
  MUPlaceHikingTileViewModel *v7;
  MUPlaceHikingTileViewModel *v8;
  objc_super v10;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MUPlaceHikingTileViewModel;
  v7 = -[MUPlaceHikingTileViewModel init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[MUPlaceHikingTileViewModel setGeoTrail:](v7, "setGeoTrail:", v6);
    -[MUPlaceHikingTileViewModel setHikingItemType:](v8, "setHikingItemType:", v4);
  }

  return v8;
}

- (NSString)tileName
{
  void *v2;
  void *v3;

  -[MUPlaceHikingTileViewModel geoTrail](self, "geoTrail");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)fetchBadgeIconWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[MUPlaceHikingTileViewModel geoTrail](self, "geoTrail");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "styleAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _MUFetchBadgeIconWithStyleAttributes(v5, 1, v4);

  }
}

- (void)fetchFallbackIconWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[MUPlaceHikingTileViewModel geoTrail](self, "geoTrail");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "styleAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _MUFetchBadgeIconWithStyleAttributes(v5, 1, v4);

  }
}

- (void)fetchImageTilewWithSize:(CGSize)a3 completion:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  double v21;
  double v22;
  double v23;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CC1970], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "screenScale");
  v10 = v9;

  -[MUPlaceHikingTileViewModel geoTrail](self, "geoTrail");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "photo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bestPhotoForSize:allowSmaller:", 1, width * v10, height * v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "url");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "absoluteString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CC1750], "sharedImageManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "url");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __65__MUPlaceHikingTileViewModel_fetchImageTilewWithSize_completion___block_invoke;
    v19[3] = &unk_1E2E02048;
    v20 = v7;
    v21 = width;
    v22 = height;
    v23 = v10;
    objc_msgSend(v17, "loadAppImageAtURL:completionHandler:", v18, v19);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, 0, 0, 0);
  }

}

void __65__MUPlaceHikingTileViewModel_fetchImageTilewWithSize_completion___block_invoke(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  double v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  char v13;

  if (!a2 || a5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v8 = *(double *)(a1 + 56);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __65__MUPlaceHikingTileViewModel_fetchImageTilewWithSize_completion___block_invoke_2;
    v10[3] = &unk_1E2E03148;
    v9 = *(id *)(a1 + 32);
    v11 = 0;
    v12 = v9;
    v13 = a3;
    +[MapsUIUtilities resizeImageIfNeeded:toFrameSize:displayScale:completion:](MapsUIUtilities, "resizeImageIfNeeded:toFrameSize:displayScale:completion:", a2, v10, *(double *)(a1 + 40), *(double *)(a1 + 48), v8);

  }
}

uint64_t __65__MUPlaceHikingTileViewModel_fetchImageTilewWithSize_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

- (id)footerAttributedStringForFont:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[MUPlaceHikingTileViewModel hikingItemType](self, "hikingItemType") - 1 > 1)
  {
    v6 = 0;
  }
  else
  {
    -[MUPlaceHikingTileViewModel geoTrail](self, "geoTrail");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "factoids");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        _MUFactoidStringForFactoid(v13, v4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v14, (_QWORD)v22);

        objc_msgSend(v8, "lastObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if ((void *)v13 != v15)
        {
          v16 = objc_alloc(MEMORY[0x1E0CB3498]);
          _MULocalizedStringFromThisBundle(CFSTR(" · [Interpunct delimeter MapsUI]"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(v16, "initWithString:", v17);

          objc_msgSend(v7, "addObject:", v18);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

  v19 = (void *)objc_msgSend(v7, "copy");
  +[MapsUILayout buildAttributedDisplayStringForComponents:reverseIfRTLLayout:](MapsUILayout, "buildAttributedDisplayStringForComponents:reverseIfRTLLayout:", v19, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)subtitleAttributedStringForFont:(id)a3
{
  return (id)objc_opt_new();
}

- (unint64_t)expectedNumberOfFooterLines
{
  return 1;
}

- (GEOTrail)geoTrail
{
  return self->_geoTrail;
}

- (void)setGeoTrail:(id)a3
{
  objc_storeStrong((id *)&self->_geoTrail, a3);
}

- (int)hikingItemType
{
  return self->_hikingItemType;
}

- (void)setHikingItemType:(int)a3
{
  self->_hikingItemType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoTrail, 0);
}

@end
