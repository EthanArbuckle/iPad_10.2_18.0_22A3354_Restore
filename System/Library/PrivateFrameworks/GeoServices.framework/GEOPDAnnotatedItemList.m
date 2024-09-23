@implementation GEOPDAnnotatedItemList

+ (id)annotatedItemListForPlaceData:(id)a3
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
  v6[2] = __73__GEOPDAnnotatedItemList_PlaceDataExtras__annotatedItemListForPlaceData___block_invoke;
  v6[3] = &unk_1E1C09718;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateValidComponentValuesOfType:usingBlock:", 57, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __73__GEOPDAnnotatedItemList_PlaceDataExtras__annotatedItemListForPlaceData___block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[GEOPDComponentValue annotatedItemList](a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

- (GEOPDAnnotatedItemList)init
{
  GEOPDAnnotatedItemList *v2;
  GEOPDAnnotatedItemList *v3;
  GEOPDAnnotatedItemList *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDAnnotatedItemList;
  v2 = -[GEOPDAnnotatedItemList init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAnnotatedItemList)initWithData:(id)a3
{
  GEOPDAnnotatedItemList *v3;
  GEOPDAnnotatedItemList *v4;
  GEOPDAnnotatedItemList *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDAnnotatedItemList;
  v3 = -[GEOPDAnnotatedItemList initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readTitle
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAnnotatedItemListReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTitle_tags_5);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)title
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDAnnotatedItemList _readTitle]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)_readPicItemContainer
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAnnotatedItemListReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPicItemContainer_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)picItemContainer
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDAnnotatedItemList _readPicItemContainer]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)_readTextItemContainer
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAnnotatedItemListReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTextItemContainer_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)textItemContainer
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDAnnotatedItemList _readTextItemContainer]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (uint64_t)annotatedItemStyle
{
  uint64_t v1;
  char v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_BYTE *)(v1 + 64);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 56));
    if ((v2 & 1) != 0)
      return *(unsigned int *)(v1 + 60);
    else
      return 0;
  }
  return result;
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
  v8.super_class = (Class)GEOPDAnnotatedItemList;
  -[GEOPDAnnotatedItemList description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAnnotatedItemList dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAnnotatedItemList _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  int v14;
  __CFString *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;

  if (!a1)
    return 0;
  -[GEOPDAnnotatedItemList readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAnnotatedItemList title]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("title"));

  -[GEOPDAnnotatedItemList picItemContainer]((id *)a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v6, "jsonRepresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("picItemContainer");
    }
    else
    {
      objc_msgSend(v6, "dictionaryRepresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("pic_item_container");
    }
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
  -[GEOPDAnnotatedItemList textItemContainer]((id *)a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v10, "jsonRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("textItemContainer");
    }
    else
    {
      objc_msgSend(v10, "dictionaryRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = CFSTR("text_item_container");
    }
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
  if ((*(_BYTE *)(a1 + 64) & 1) != 0)
  {
    v14 = *(_DWORD *)(a1 + 60);
    if (v14)
    {
      if (v14 == 1)
      {
        v15 = CFSTR("ANNOTATED_ITEM_STYLE_RESTAURANT_MENU");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 60));
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v15 = CFSTR("ANNOTATED_ITEM_STYLE_UNKNOWN");
    }
    if (a2)
      v16 = CFSTR("annotatedItemStyle");
    else
      v16 = CFSTR("annotated_item_style");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  v17 = *(void **)(a1 + 16);
  if (v17)
  {
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __52__GEOPDAnnotatedItemList__dictionaryRepresentation___block_invoke;
      v24[3] = &unk_1E1C00600;
      v21 = v20;
      v25 = v21;
      objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v24);
      v22 = v21;

      v19 = v22;
    }
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDAnnotatedItemList _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_384_0;
      else
        v6 = (int *)&readAll__nonRecursiveTag_385_0;
      GEOPDAnnotatedItemListReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      -[GEOPDTextItemContainer readAll:](*(_QWORD *)(a1 + 32), 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __52__GEOPDAnnotatedItemList__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAnnotatedItemListReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  GEOPDTextItemContainer *textItemContainer;
  int v7;
  PBDataReader *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader
    || (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x34) != 0)
    || (*(_BYTE *)&self->_flags & 8) != 0
    && (textItemContainer = self->_textItemContainer) != 0
    && (os_unfair_lock_lock_with_options(),
        os_unfair_lock_assert_owner(&textItemContainer->_readerLock),
        v7 = *(_BYTE *)&textItemContainer->_flags & 0xE,
        os_unfair_lock_unlock(&textItemContainer->_readerLock),
        v7))
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDAnnotatedItemList readAll:]((uint64_t)self, 0);
    if (self->_title)
      PBDataWriterWriteStringField();
    v5 = v10;
    if (self->_picItemContainer)
    {
      PBDataWriterWriteSubmessage();
      v5 = v10;
    }
    if (self->_textItemContainer)
    {
      PBDataWriterWriteSubmessage();
      v5 = v10;
    }
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      v5 = v10;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }
  else
  {
    v8 = self->_reader;
    objc_sync_enter(v8);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "writeData:", v9);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  PBUnknownFields *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDAnnotatedItemListReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDAnnotatedItemList readAll:]((uint64_t)self, 0);
  v9 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  v11 = -[GEOPDPictureItemContainer copyWithZone:](self->_picItemContainer, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;

  v13 = -[GEOPDTextItemContainer copyWithZone:](self->_textItemContainer, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v13;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_annotatedItemStyle;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v15 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v15;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *title;
  GEOPDPictureItemContainer *picItemContainer;
  GEOPDTextItemContainer *textItemContainer;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[GEOPDAnnotatedItemList readAll:]((uint64_t)self, 1);
  -[GEOPDAnnotatedItemList readAll:]((uint64_t)v4, 1);
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](title, "isEqual:"))
      goto LABEL_12;
  }
  picItemContainer = self->_picItemContainer;
  if ((unint64_t)picItemContainer | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOPDPictureItemContainer isEqual:](picItemContainer, "isEqual:"))
      goto LABEL_12;
  }
  textItemContainer = self->_textItemContainer;
  if ((unint64_t)textItemContainer | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOPDTextItemContainer isEqual:](textItemContainer, "isEqual:"))
      goto LABEL_12;
  }
  v8 = (*((_BYTE *)v4 + 64) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) != 0 && self->_annotatedItemStyle == *((_DWORD *)v4 + 15))
    {
      v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  -[GEOPDAnnotatedItemList readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_title, "hash");
  v4 = -[GEOPDPictureItemContainer hash](self->_picItemContainer, "hash");
  v5 = -[GEOPDTextItemContainer hash](self->_textItemContainer, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v6 = 2654435761 * self->_annotatedItemStyle;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_textItemContainer, 0);
  objc_storeStrong((id *)&self->_picItemContainer, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
