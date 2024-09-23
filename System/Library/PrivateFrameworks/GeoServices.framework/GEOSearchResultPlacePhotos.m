@implementation GEOSearchResultPlacePhotos

- (GEOSearchResultPlacePhotos)initWithSearchResultPlacePhotos:(id)a3
{
  id v5;
  GEOSearchResultPlacePhotos *v6;
  GEOSearchResultPlacePhotos *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOSearchResultPlacePhotos;
  v6 = -[GEOSearchResultPlacePhotos init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_searchResultPlacePhotos, a3);

  return v7;
}

- (NSArray)photos
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _GEOPlaceDataPhoto *v10;
  _GEOPlaceDataPhoto *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_searchResultPlacePhotos;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        v10 = [_GEOPlaceDataPhoto alloc];
        v11 = -[_GEOPlaceDataPhoto initWithCaptionedPhoto:](v10, "initWithCaptionedPhoto:", v9, (_QWORD)v14);
        if (v11)
          objc_msgSend(v3, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResultPlacePhotos, 0);
}

@end
