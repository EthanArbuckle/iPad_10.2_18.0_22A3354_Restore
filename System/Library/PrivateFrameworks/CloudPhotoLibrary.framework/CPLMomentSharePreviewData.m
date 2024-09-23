@implementation CPLMomentSharePreviewData

- (void)clearPreviewImageDatas
{
  -[NSMutableArray removeAllObjects](self->_previewImageDatas, "removeAllObjects");
}

- (void)addPreviewImageData:(id)a3
{
  id v4;
  NSMutableArray *previewImageDatas;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  previewImageDatas = self->_previewImageDatas;
  v8 = v4;
  if (!previewImageDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_previewImageDatas;
    self->_previewImageDatas = v6;

    v4 = v8;
    previewImageDatas = self->_previewImageDatas;
  }
  -[NSMutableArray addObject:](previewImageDatas, "addObject:", v4);

}

- (unint64_t)previewImageDatasCount
{
  return -[NSMutableArray count](self->_previewImageDatas, "count");
}

- (id)previewImageDataAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_previewImageDatas, "objectAtIndex:", a3);
}

- (BOOL)hasKeyAssetIdentifier
{
  return self->_keyAssetIdentifier != 0;
}

- (BOOL)hasCropRectString
{
  return self->_cropRectString != 0;
}

- (void)clearCuratedAssetIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_curatedAssetIdentifiers, "removeAllObjects");
}

- (void)addCuratedAssetIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *curatedAssetIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  curatedAssetIdentifiers = self->_curatedAssetIdentifiers;
  v8 = v4;
  if (!curatedAssetIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_curatedAssetIdentifiers;
    self->_curatedAssetIdentifiers = v6;

    v4 = v8;
    curatedAssetIdentifiers = self->_curatedAssetIdentifiers;
  }
  -[NSMutableArray addObject:](curatedAssetIdentifiers, "addObject:", v4);

}

- (unint64_t)curatedAssetIdentifiersCount
{
  return -[NSMutableArray count](self->_curatedAssetIdentifiers, "count");
}

- (id)curatedAssetIdentifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_curatedAssetIdentifiers, "objectAtIndex:", a3);
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
  v8.super_class = (Class)CPLMomentSharePreviewData;
  -[CPLMomentSharePreviewData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLMomentSharePreviewData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *previewImageDatas;
  NSString *keyAssetIdentifier;
  NSString *cropRectString;
  NSMutableArray *curatedAssetIdentifiers;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  previewImageDatas = self->_previewImageDatas;
  if (previewImageDatas)
    objc_msgSend(v3, "setObject:forKey:", previewImageDatas, CFSTR("previewImageData"));
  keyAssetIdentifier = self->_keyAssetIdentifier;
  if (keyAssetIdentifier)
    objc_msgSend(v4, "setObject:forKey:", keyAssetIdentifier, CFSTR("keyAssetIdentifier"));
  cropRectString = self->_cropRectString;
  if (cropRectString)
    objc_msgSend(v4, "setObject:forKey:", cropRectString, CFSTR("cropRectString"));
  curatedAssetIdentifiers = self->_curatedAssetIdentifiers;
  if (curatedAssetIdentifiers)
    objc_msgSend(v4, "setObject:forKey:", curatedAssetIdentifiers, CFSTR("curatedAssetIdentifiers"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return CPLMomentSharePreviewDataReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_previewImageDatas;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteDataField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  if (self->_keyAssetIdentifier)
    PBDataWriterWriteStringField();
  if (self->_cropRectString)
    PBDataWriterWriteStringField();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_curatedAssetIdentifiers;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  id v12;

  v12 = a3;
  if (-[CPLMomentSharePreviewData previewImageDatasCount](self, "previewImageDatasCount"))
  {
    objc_msgSend(v12, "clearPreviewImageDatas");
    v4 = -[CPLMomentSharePreviewData previewImageDatasCount](self, "previewImageDatasCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[CPLMomentSharePreviewData previewImageDataAtIndex:](self, "previewImageDataAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addPreviewImageData:", v7);

      }
    }
  }
  if (self->_keyAssetIdentifier)
    objc_msgSend(v12, "setKeyAssetIdentifier:");
  if (self->_cropRectString)
    objc_msgSend(v12, "setCropRectString:");
  if (-[CPLMomentSharePreviewData curatedAssetIdentifiersCount](self, "curatedAssetIdentifiersCount"))
  {
    objc_msgSend(v12, "clearCuratedAssetIdentifiers");
    v8 = -[CPLMomentSharePreviewData curatedAssetIdentifiersCount](self, "curatedAssetIdentifiersCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[CPLMomentSharePreviewData curatedAssetIdentifiersAtIndex:](self, "curatedAssetIdentifiersAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addCuratedAssetIdentifiers:", v11);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = self->_previewImageDatas;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v10), "copyWithZone:", a3);
        objc_msgSend(v5, "addPreviewImageData:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v8);
  }

  v12 = -[NSString copyWithZone:](self->_keyAssetIdentifier, "copyWithZone:", a3);
  v13 = (void *)v5[3];
  v5[3] = v12;

  v14 = -[NSString copyWithZone:](self->_cropRectString, "copyWithZone:", a3);
  v15 = (void *)v5[1];
  v5[1] = v14;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = self->_curatedAssetIdentifiers;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v20), "copyWithZone:", a3, (_QWORD)v23);
        objc_msgSend(v5, "addCuratedAssetIdentifiers:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v18);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *previewImageDatas;
  NSString *keyAssetIdentifier;
  NSString *cropRectString;
  NSMutableArray *curatedAssetIdentifiers;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((previewImageDatas = self->_previewImageDatas, !((unint64_t)previewImageDatas | v4[4]))
     || -[NSMutableArray isEqual:](previewImageDatas, "isEqual:"))
    && ((keyAssetIdentifier = self->_keyAssetIdentifier, !((unint64_t)keyAssetIdentifier | v4[3]))
     || -[NSString isEqual:](keyAssetIdentifier, "isEqual:"))
    && ((cropRectString = self->_cropRectString, !((unint64_t)cropRectString | v4[1]))
     || -[NSString isEqual:](cropRectString, "isEqual:")))
  {
    curatedAssetIdentifiers = self->_curatedAssetIdentifiers;
    if ((unint64_t)curatedAssetIdentifiers | v4[2])
      v9 = -[NSMutableArray isEqual:](curatedAssetIdentifiers, "isEqual:");
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
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSMutableArray hash](self->_previewImageDatas, "hash");
  v4 = -[NSString hash](self->_keyAssetIdentifier, "hash") ^ v3;
  v5 = -[NSString hash](self->_cropRectString, "hash");
  return v4 ^ v5 ^ -[NSMutableArray hash](self->_curatedAssetIdentifiers, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v4[4];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        -[CPLMomentSharePreviewData addPreviewImageData:](self, "addPreviewImageData:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  if (v4[3])
    -[CPLMomentSharePreviewData setKeyAssetIdentifier:](self, "setKeyAssetIdentifier:");
  if (v4[1])
    -[CPLMomentSharePreviewData setCropRectString:](self, "setCropRectString:");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = v4[2];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[CPLMomentSharePreviewData addCuratedAssetIdentifiers:](self, "addCuratedAssetIdentifiers:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j), (_QWORD)v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (NSMutableArray)previewImageDatas
{
  return self->_previewImageDatas;
}

- (void)setPreviewImageDatas:(id)a3
{
  objc_storeStrong((id *)&self->_previewImageDatas, a3);
}

- (NSString)keyAssetIdentifier
{
  return self->_keyAssetIdentifier;
}

- (void)setKeyAssetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_keyAssetIdentifier, a3);
}

- (NSString)cropRectString
{
  return self->_cropRectString;
}

- (void)setCropRectString:(id)a3
{
  objc_storeStrong((id *)&self->_cropRectString, a3);
}

- (NSMutableArray)curatedAssetIdentifiers
{
  return self->_curatedAssetIdentifiers;
}

- (void)setCuratedAssetIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_curatedAssetIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewImageDatas, 0);
  objc_storeStrong((id *)&self->_keyAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_curatedAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_cropRectString, 0);
}

+ (Class)previewImageDataType
{
  return (Class)objc_opt_class();
}

+ (Class)curatedAssetIdentifiersType
{
  return (Class)objc_opt_class();
}

@end
