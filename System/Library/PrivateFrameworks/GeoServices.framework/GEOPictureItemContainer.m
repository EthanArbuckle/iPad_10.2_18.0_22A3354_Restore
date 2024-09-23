@implementation GEOPictureItemContainer

- (GEOPictureItemContainer)init
{
  GEOPictureItemContainer *result;

  result = (GEOPictureItemContainer *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOPictureItemContainer)initWithPictureItems:(id)a3 allowFullScreenPhoto:(BOOL)a4
{
  id v6;
  GEOPictureItemContainer *v7;
  uint64_t v8;
  NSArray *pictureItems;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOPictureItemContainer;
  v7 = -[GEOPictureItemContainer init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    pictureItems = v7->_pictureItems;
    v7->_pictureItems = (NSArray *)v8;

    v7->_allowFullScreenPhoto = a4;
  }

  return v7;
}

- (GEOPictureItemContainer)initWithPictureItemContainer:(id)a3
{
  id *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  GEOPictureItem *v16;
  GEOPictureItem *v17;
  _BOOL8 v18;
  GEOPictureItemContainer *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  -[GEOPDPictureItemContainer pictureItems](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[GEOPDPictureItemContainer pictureItems](v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[GEOPDPictureItemContainer pictureItems](v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v14);
          v16 = [GEOPictureItem alloc];
          v17 = -[GEOPictureItem initWithPictureItem:](v16, "initWithPictureItem:", v15, (_QWORD)v21);
          if (v17)
            objc_msgSend(v9, "addObject:", v17);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v12);
    }

    if (v4)
      v18 = (*((_BYTE *)v4 + 28) & 1) == 0 || *((_BYTE *)v4 + 24) != 0;
    else
      v18 = 0;
    self = -[GEOPictureItemContainer initWithPictureItems:allowFullScreenPhoto:](self, "initWithPictureItems:allowFullScreenPhoto:", v9, v18, (_QWORD)v21);

    v19 = self;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (NSArray)pictureItems
{
  return self->_pictureItems;
}

- (BOOL)allowFullScreenPhoto
{
  return self->_allowFullScreenPhoto;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pictureItems, 0);
}

@end
