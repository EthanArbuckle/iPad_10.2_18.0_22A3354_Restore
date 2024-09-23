@implementation GEOCaptionedPhotoAlbum

- (GEOCaptionedPhotoAlbum)initWithCaptionedPhotoCategory:(id)a3 attributionMap:(id)a4
{
  id *v7;
  id v8;
  GEOCaptionedPhotoAlbum *v9;
  id *p_isa;
  GEOCaptionedPhotoAlbum *v11;
  objc_super v13;

  v7 = (id *)a3;
  v8 = a4;
  if (v7 && (-[GEOPDCategorizedPhotos _readPhotos]((uint64_t)v7), objc_msgSend(v7[5], "count")))
  {
    v13.receiver = self;
    v13.super_class = (Class)GEOCaptionedPhotoAlbum;
    v9 = -[GEOCaptionedPhotoAlbum init](&v13, sel_init);
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_categorizedPhotos, a3);
      objc_storeStrong(p_isa + 2, a4);
      objc_msgSend(p_isa, "_buildPhotoList");
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

- (void)_buildPhotoList
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id *v9;
  NSMapTable *attributionMap;
  id *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _GEOPlaceDataPhoto *v16;
  NSArray *v17;
  NSArray *photoList;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[GEOPDCategorizedPhotos photos]((id *)&self->_categorizedPhotos->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(id **)(*((_QWORD *)&v19 + 1) + 8 * i);
        attributionMap = self->_attributionMap;
        -[GEOPDCaptionedPhoto attribution](v9);
        v11 = (id *)objc_claimAutoreleasedReturnValue();
        -[GEOPDAttribution vendorId](v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable objectForKey:](attributionMap, "objectForKey:", v12, (_QWORD)v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13 && objc_msgSend(v13, "hasAttributionRequirement:", 3))
        {
          -[GEOPDCaptionedPhoto attribution](v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[GEOMapItemAttribution attributionWithDataAttribution:searchInfo:class:](GEOMapItemAttribution, "attributionWithDataAttribution:searchInfo:class:", v14, v13, objc_opt_class());
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = -[_GEOPlaceDataPhoto initWithCaptionedPhoto:attribution:]([_GEOPlaceDataPhoto alloc], "initWithCaptionedPhoto:attribution:", v9, v15);
          objc_msgSend(v3, "addObject:", v16);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  v17 = (NSArray *)objc_msgSend(v3, "copy");
  photoList = self->_photoList;
  self->_photoList = v17;

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), self->_categorizedPhotos);
}

- (NSString)categoryName
{
  return (NSString *)-[GEOPDCategorizedPhotos displayTitle](self->_categorizedPhotos, "displayTitle");
}

- (NSString)categoryId
{
  return -[GEOPDCategorizedPhotos categoryId]((id *)&self->_categorizedPhotos->super.super.isa);
}

- (unint64_t)totalNumberOfPhotosAvailable
{
  unint64_t categorizedPhotos;

  categorizedPhotos = (unint64_t)self->_categorizedPhotos;
  if (categorizedPhotos
    && (categorizedPhotos = *(unsigned int *)(categorizedPhotos + 60), (categorizedPhotos & 0x80000000) != 0))
  {
    return -[NSArray count](self->_photoList, "count");
  }
  else
  {
    return categorizedPhotos;
  }
}

- (NSArray)photoList
{
  return self->_photoList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoList, 0);
  objc_storeStrong((id *)&self->_attributionMap, 0);
  objc_storeStrong((id *)&self->_categorizedPhotos, 0);
}

@end
