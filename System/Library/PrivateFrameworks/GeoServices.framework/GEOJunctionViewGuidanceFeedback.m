@implementation GEOJunctionViewGuidanceFeedback

- (BOOL)imageDisplayed
{
  return (*(_BYTE *)&self->_flags & 1) != 0 && self->_imageDisplayed;
}

- (void)setImageDisplayed:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_imageDisplayed = a3;
}

- (void)setHasImageDisplayed:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasImageDisplayed
{
  return *(_BYTE *)&self->_flags & 1;
}

- (NSMutableArray)imageIDs
{
  return self->_imageIDs;
}

- (void)setImageIDs:(id)a3
{
  objc_storeStrong((id *)&self->_imageIDs, a3);
}

- (void)clearImageIDs
{
  -[NSMutableArray removeAllObjects](self->_imageIDs, "removeAllObjects");
}

- (void)addImageID:(id)a3
{
  id v4;
  NSMutableArray *imageIDs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  imageIDs = self->_imageIDs;
  v8 = v4;
  if (!imageIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_imageIDs;
    self->_imageIDs = v6;

    v4 = v8;
    imageIDs = self->_imageIDs;
  }
  -[NSMutableArray addObject:](imageIDs, "addObject:", v4);

}

- (unint64_t)imageIDsCount
{
  return -[NSMutableArray count](self->_imageIDs, "count");
}

- (id)imageIDAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_imageIDs, "objectAtIndex:", a3);
}

+ (Class)imageIDType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)GEOJunctionViewGuidanceFeedback;
  -[GEOJunctionViewGuidanceFeedback description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOJunctionViewGuidanceFeedback dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOJunctionViewGuidanceFeedback _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 20) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 16));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("imageDisplayed");
    else
      v6 = CFSTR("image_displayed");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  if (*(_QWORD *)(a1 + 8))
  {
    if (a2)
    {
      v7 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend((id)a1, "imageIDs");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      objc_msgSend((id)a1, "imageIDs", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v18;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v18 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "base64EncodedStringWithOptions:", 0);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v15);

            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v12);
      }

    }
    else
    {
      objc_msgSend((id)a1, "imageIDs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("imageID"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOJunctionViewGuidanceFeedback _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOJunctionViewGuidanceFeedback)initWithDictionary:(id)a3
{
  return (GEOJunctionViewGuidanceFeedback *)-[GEOJunctionViewGuidanceFeedback _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("imageDisplayed");
      else
        v6 = CFSTR("image_displayed");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setImageDisplayed:", objc_msgSend(v7, "BOOLValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("imageID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v19;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v19 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v15 = objc_alloc(MEMORY[0x1E0C99D50]);
                v16 = (void *)objc_msgSend(v15, "initWithBase64EncodedString:options:", v14, 0, (_QWORD)v18);
                objc_msgSend(a1, "addImageID:", v16);

              }
              ++v13;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          }
          while (v11);
        }

      }
    }
  }

  return a1;
}

- (GEOJunctionViewGuidanceFeedback)initWithJSON:(id)a3
{
  return (GEOJunctionViewGuidanceFeedback *)-[GEOJunctionViewGuidanceFeedback _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOJunctionViewGuidanceFeedbackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOJunctionViewGuidanceFeedbackReadAllFrom(self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteBOOLField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_imageIDs;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteDataField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  _BYTE *v8;

  v8 = a3;
  -[GEOJunctionViewGuidanceFeedback readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v8[16] = self->_imageDisplayed;
    v8[20] |= 1u;
  }
  if (-[GEOJunctionViewGuidanceFeedback imageIDsCount](self, "imageIDsCount"))
  {
    objc_msgSend(v8, "clearImageIDs");
    v4 = -[GEOJunctionViewGuidanceFeedback imageIDsCount](self, "imageIDsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOJunctionViewGuidanceFeedback imageIDAtIndex:](self, "imageIDAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addImageID:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)(v5 + 16) = self->_imageDisplayed;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_imageIDs;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "copyWithZone:", a3, (_QWORD)v14);
        objc_msgSend(v6, "addImageID:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  NSMutableArray *imageIDs;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_6;
  -[GEOJunctionViewGuidanceFeedback readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) != 0)
    {
      if (self->_imageDisplayed)
      {
        if (*((_BYTE *)v4 + 16))
          goto LABEL_12;
      }
      else if (!*((_BYTE *)v4 + 16))
      {
        goto LABEL_12;
      }
    }
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  if ((*((_BYTE *)v4 + 20) & 1) != 0)
    goto LABEL_6;
LABEL_12:
  imageIDs = self->_imageIDs;
  if ((unint64_t)imageIDs | *((_QWORD *)v4 + 1))
    v5 = -[NSMutableArray isEqual:](imageIDs, "isEqual:");
  else
    v5 = 1;
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;

  -[GEOJunctionViewGuidanceFeedback readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_imageDisplayed;
  else
    v3 = 0;
  return -[NSMutableArray hash](self->_imageIDs, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    self->_imageDisplayed = *((_BYTE *)v4 + 16);
    *(_BYTE *)&self->_flags |= 1u;
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 1);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[GEOJunctionViewGuidanceFeedback addImageID:](self, "addImageID:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageIDs, 0);
}

@end
