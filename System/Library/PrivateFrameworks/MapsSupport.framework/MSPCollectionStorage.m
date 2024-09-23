@implementation MSPCollectionStorage

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasImage
{
  return self->_image != 0;
}

- (BOOL)hasImageURL
{
  return self->_imageURL != 0;
}

- (BOOL)hasCollectionDescription
{
  return self->_collectionDescription != 0;
}

- (BOOL)hasItemData
{
  return self->_itemData != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MSPCollectionStorage;
  -[MSPCollectionStorage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPCollectionStorage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *title;
  NSData *image;
  NSString *imageURL;
  NSString *collectionDescription;
  NSData *itemData;
  PBUnknownFields *unknownFields;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKey:", title, CFSTR("title"));
  image = self->_image;
  if (image)
    objc_msgSend(v4, "setObject:forKey:", image, CFSTR("image"));
  imageURL = self->_imageURL;
  if (imageURL)
    objc_msgSend(v4, "setObject:forKey:", imageURL, CFSTR("imageURL"));
  collectionDescription = self->_collectionDescription;
  if (collectionDescription)
    objc_msgSend(v4, "setObject:forKey:", collectionDescription, CFSTR("collectionDescription"));
  itemData = self->_itemData;
  if (itemData)
    objc_msgSend(v4, "setObject:forKey:", itemData, CFSTR("itemData"));
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    -[PBUnknownFields dictionaryRepresentation](unknownFields, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MSPCollectionStorageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_image)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_imageURL)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_collectionDescription)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_itemData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_title)
  {
    objc_msgSend(v4, "setTitle:");
    v4 = v5;
  }
  if (self->_image)
  {
    objc_msgSend(v5, "setImage:");
    v4 = v5;
  }
  if (self->_imageURL)
  {
    objc_msgSend(v5, "setImageURL:");
    v4 = v5;
  }
  if (self->_collectionDescription)
  {
    objc_msgSend(v5, "setCollectionDescription:");
    v4 = v5;
  }
  if (self->_itemData)
  {
    objc_msgSend(v5, "setItemData:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  v8 = -[NSData copyWithZone:](self->_image, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_imageURL, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  v12 = -[NSString copyWithZone:](self->_collectionDescription, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v12;

  v14 = -[NSData copyWithZone:](self->_itemData, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v14;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *title;
  NSData *image;
  NSString *imageURL;
  NSString *collectionDescription;
  NSData *itemData;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((title = self->_title, !((unint64_t)title | v4[6]))
     || -[NSString isEqual:](title, "isEqual:"))
    && ((image = self->_image, !((unint64_t)image | v4[3])) || -[NSData isEqual:](image, "isEqual:"))&& ((imageURL = self->_imageURL, !((unint64_t)imageURL | v4[4]))|| -[NSString isEqual:](imageURL, "isEqual:"))&& ((collectionDescription = self->_collectionDescription, !((unint64_t)collectionDescription | v4[2]))|| -[NSString isEqual:](collectionDescription, "isEqual:")))
  {
    itemData = self->_itemData;
    if ((unint64_t)itemData | v4[5])
      v10 = -[NSData isEqual:](itemData, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_title, "hash");
  v4 = -[NSData hash](self->_image, "hash") ^ v3;
  v5 = -[NSString hash](self->_imageURL, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_collectionDescription, "hash");
  return v6 ^ -[NSData hash](self->_itemData, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[6])
    -[MSPCollectionStorage setTitle:](self, "setTitle:");
  if (v4[3])
    -[MSPCollectionStorage setImage:](self, "setImage:");
  if (v4[4])
    -[MSPCollectionStorage setImageURL:](self, "setImageURL:");
  if (v4[2])
    -[MSPCollectionStorage setCollectionDescription:](self, "setCollectionDescription:");
  if (v4[5])
    -[MSPCollectionStorage setItemData:](self, "setItemData:");

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSData)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (NSString)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_imageURL, a3);
}

- (NSString)collectionDescription
{
  return self->_collectionDescription;
}

- (void)setCollectionDescription:(id)a3
{
  objc_storeStrong((id *)&self->_collectionDescription, a3);
}

- (NSData)itemData
{
  return self->_itemData;
}

- (void)setItemData:(id)a3
{
  objc_storeStrong((id *)&self->_itemData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_itemData, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_collectionDescription, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
