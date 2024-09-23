@implementation GEOPictureItem

- (GEOPictureItem)init
{
  GEOPictureItem *result;

  result = (GEOPictureItem *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOPictureItem)initWithPhoto:(id)a3 pictureItemPhotoType:(int)a4 primaryText:(id)a5 secondaryText:(id)a6
{
  id v11;
  id v12;
  id v13;
  GEOPictureItem *v14;
  BOOL v15;
  char v16;
  GEOPictureItem *v17;
  GEOPictureItem *v18;
  uint64_t v19;
  NSString *primaryText;
  uint64_t v21;
  NSString *secondaryText;
  objc_super v24;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = 0;
  if (v11)
    v15 = 1;
  else
    v15 = (a4 - 1) >= 2;
  v16 = !v15;
  if (a4 && (v16 & 1) == 0)
  {
    v24.receiver = self;
    v24.super_class = (Class)GEOPictureItem;
    v17 = -[GEOPictureItem init](&v24, sel_init);
    v18 = v17;
    if (v17)
    {
      objc_storeStrong((id *)&v17->_photo, a3);
      v18->_pictureItemPhotoType = a4;
      v19 = objc_msgSend(v12, "copy");
      primaryText = v18->_primaryText;
      v18->_primaryText = (NSString *)v19;

      v21 = objc_msgSend(v13, "copy");
      secondaryText = v18->_secondaryText;
      v18->_secondaryText = (NSString *)v21;

    }
    self = v18;
    v14 = self;
  }

  return v14;
}

- (GEOPictureItem)initWithPictureItem:(id)a3
{
  id *v4;
  _GEOPlaceDataPhoto *v5;
  _GEOPlaceDataPhoto *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  GEOPictureItem *v12;

  v4 = (id *)a3;
  -[GEOPDPictureItem photo](v4);
  v5 = (_GEOPlaceDataPhoto *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = [_GEOPlaceDataPhoto alloc];
    -[GEOPDPictureItem photo](v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[_GEOPlaceDataPhoto initWithPhoto:](v6, "initWithPhoto:", v7);

  }
  v8 = -[GEOPDPictureItem photoItemType]((uint64_t)v4);
  if (v8 - 1 >= 3)
    v9 = 0;
  else
    v9 = v8;
  -[GEOPDPictureItem primaryText](v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPictureItem secondaryText](v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[GEOPictureItem initWithPhoto:pictureItemPhotoType:primaryText:secondaryText:](self, "initWithPhoto:pictureItemPhotoType:primaryText:secondaryText:", v5, v9, v10, v11);

  return v12;
}

- (GEOMapItemPhoto)photo
{
  return self->_photo;
}

- (int)pictureItemPhotoType
{
  return self->_pictureItemPhotoType;
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_photo, 0);
}

@end
