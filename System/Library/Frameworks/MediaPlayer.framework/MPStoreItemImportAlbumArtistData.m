@implementation MPStoreItemImportAlbumArtistData

- (MPStoreItemImportAlbumArtistData)initWithAlbumArtistImportElements:(id)a3
{
  id v5;
  MPStoreItemImportAlbumArtistData *v6;
  void *v7;
  MPStoreItemImportAlbumArtistData *v8;
  uint64_t v9;
  NSArray *importElements;
  objc_super v12;
  _QWORD v13[4];
  MPStoreItemImportAlbumArtistData *v14;
  SEL v15;

  v5 = a3;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__MPStoreItemImportAlbumArtistData_initWithAlbumArtistImportElements___block_invoke;
  v13[3] = &unk_1E31572B0;
  v15 = a2;
  v6 = self;
  v14 = v6;
  objc_msgSend(v5, "msv_compactMap:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = v6;
  v12.super_class = (Class)MPStoreItemImportAlbumArtistData;
  v8 = -[ML3StoreItemAlbumArtistData initWithLookupItems:](&v12, sel_initWithLookupItems_, v7);
  if (v8)
  {
    v9 = objc_msgSend(v5, "copy");
    importElements = v8->_importElements;
    v8->_importElements = (NSArray *)v9;

  }
  return v8;
}

- (NSArray)importElements
{
  return self->_importElements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importElements, 0);
}

id __70__MPStoreItemImportAlbumArtistData_initWithAlbumArtistImportElements___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v5;

  objc_msgSend(a2, "storeItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("MPStoreItemImportAlbumArtistData.m"), 22, CFSTR("we should have a complete set of metadata here."));

  }
  return v3;
}

@end
