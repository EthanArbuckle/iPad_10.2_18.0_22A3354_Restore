@implementation _MPCProtoRadioContentReference

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)_MPCProtoRadioContentReference;
  -[_MPCProtoRadioContentReference description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCProtoRadioContentReference dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  _MPCProtoRadioContentReferenceLibraryAlbumContentReference *libraryAlbumContentReference;
  void *v5;
  _MPCProtoRadioContentReferenceLibraryArtistContentReference *libraryArtistContentReference;
  void *v7;
  _MPCProtoRadioContentReferenceLibraryItemContentReference *libraryItemContentReference;
  void *v9;
  _MPCProtoRadioContentReferenceStoreContentReference *storeContentReference;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  libraryAlbumContentReference = self->_libraryAlbumContentReference;
  if (libraryAlbumContentReference)
  {
    -[_MPCProtoRadioContentReferenceLibraryAlbumContentReference dictionaryRepresentation](libraryAlbumContentReference, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("libraryAlbumContentReference"));

  }
  libraryArtistContentReference = self->_libraryArtistContentReference;
  if (libraryArtistContentReference)
  {
    -[_MPCProtoRadioContentReferenceLibraryArtistContentReference dictionaryRepresentation](libraryArtistContentReference, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("libraryArtistContentReference"));

  }
  libraryItemContentReference = self->_libraryItemContentReference;
  if (libraryItemContentReference)
  {
    -[_MPCProtoRadioContentReferenceLibraryItemContentReference dictionaryRepresentation](libraryItemContentReference, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("libraryItemContentReference"));

  }
  storeContentReference = self->_storeContentReference;
  if (storeContentReference)
  {
    -[_MPCProtoRadioContentReferenceStoreContentReference dictionaryRepresentation](storeContentReference, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("storeContentReference"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MPCProtoRadioContentReferenceReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_libraryAlbumContentReference)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_libraryArtistContentReference)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_libraryItemContentReference)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_storeContentReference)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[_MPCProtoRadioContentReferenceLibraryAlbumContentReference copyWithZone:](self->_libraryAlbumContentReference, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[_MPCProtoRadioContentReferenceLibraryArtistContentReference copyWithZone:](self->_libraryArtistContentReference, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[_MPCProtoRadioContentReferenceLibraryItemContentReference copyWithZone:](self->_libraryItemContentReference, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[_MPCProtoRadioContentReferenceStoreContentReference copyWithZone:](self->_storeContentReference, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  _MPCProtoRadioContentReferenceLibraryAlbumContentReference *libraryAlbumContentReference;
  _MPCProtoRadioContentReferenceLibraryArtistContentReference *libraryArtistContentReference;
  _MPCProtoRadioContentReferenceLibraryItemContentReference *libraryItemContentReference;
  _MPCProtoRadioContentReferenceStoreContentReference *storeContentReference;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((libraryAlbumContentReference = self->_libraryAlbumContentReference,
         !((unint64_t)libraryAlbumContentReference | v4[1]))
     || -[_MPCProtoRadioContentReferenceLibraryAlbumContentReference isEqual:](libraryAlbumContentReference, "isEqual:"))
    && ((libraryArtistContentReference = self->_libraryArtistContentReference,
         !((unint64_t)libraryArtistContentReference | v4[2]))
     || -[_MPCProtoRadioContentReferenceLibraryArtistContentReference isEqual:](libraryArtistContentReference, "isEqual:"))&& ((libraryItemContentReference = self->_libraryItemContentReference, !((unint64_t)libraryItemContentReference | v4[3]))|| -[_MPCProtoRadioContentReferenceLibraryItemContentReference isEqual:](libraryItemContentReference, "isEqual:")))
  {
    storeContentReference = self->_storeContentReference;
    if ((unint64_t)storeContentReference | v4[4])
      v9 = -[_MPCProtoRadioContentReferenceStoreContentReference isEqual:](storeContentReference, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[_MPCProtoRadioContentReferenceLibraryAlbumContentReference hash](self->_libraryAlbumContentReference, "hash");
  v4 = -[_MPCProtoRadioContentReferenceLibraryArtistContentReference hash](self->_libraryArtistContentReference, "hash") ^ v3;
  v5 = -[_MPCProtoRadioContentReferenceLibraryItemContentReference hash](self->_libraryItemContentReference, "hash");
  return v4 ^ v5 ^ -[_MPCProtoRadioContentReferenceStoreContentReference hash](self->_storeContentReference, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeContentReference, 0);
  objc_storeStrong((id *)&self->_libraryItemContentReference, 0);
  objc_storeStrong((id *)&self->_libraryArtistContentReference, 0);
  objc_storeStrong((id *)&self->_libraryAlbumContentReference, 0);
}

@end
