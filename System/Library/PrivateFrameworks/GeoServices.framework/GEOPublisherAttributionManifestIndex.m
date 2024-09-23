@implementation GEOPublisherAttributionManifestIndex

- (GEOPublisherAttributionManifestIndex)init
{
  GEOPublisherAttributionManifestIndex *v2;
  GEOPublisherAttributionManifestIndex *v3;
  GEOPublisherAttributionManifestIndex *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPublisherAttributionManifestIndex;
  v2 = -[GEOPublisherAttributionManifestIndex init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPublisherAttributionManifestIndex)initWithData:(id)a3
{
  GEOPublisherAttributionManifestIndex *v3;
  GEOPublisherAttributionManifestIndex *v4;
  GEOPublisherAttributionManifestIndex *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPublisherAttributionManifestIndex;
  v3 = -[GEOPublisherAttributionManifestIndex initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPublisherAttributionFiles
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 44) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPublisherAttributionManifestIndexReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPublisherAttributionFiles_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)publisherAttributionFiles
{
  -[GEOPublisherAttributionManifestIndex _readPublisherAttributionFiles]((uint64_t)self);
  return self->_publisherAttributionFiles;
}

- (void)setPublisherAttributionFiles:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *publisherAttributionFiles;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
  publisherAttributionFiles = self->_publisherAttributionFiles;
  self->_publisherAttributionFiles = v4;

}

- (void)clearPublisherAttributionFiles
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
  -[NSMutableArray removeAllObjects](self->_publisherAttributionFiles, "removeAllObjects");
}

- (void)addPublisherAttributionFiles:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPublisherAttributionManifestIndex _readPublisherAttributionFiles]((uint64_t)self);
  -[GEOPublisherAttributionManifestIndex _addNoFlagsPublisherAttributionFiles:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
}

- (void)_addNoFlagsPublisherAttributionFiles:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)publisherAttributionFilesCount
{
  -[GEOPublisherAttributionManifestIndex _readPublisherAttributionFiles]((uint64_t)self);
  return -[NSMutableArray count](self->_publisherAttributionFiles, "count");
}

- (id)publisherAttributionFilesAtIndex:(unint64_t)a3
{
  -[GEOPublisherAttributionManifestIndex _readPublisherAttributionFiles]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_publisherAttributionFiles, "objectAtIndex:", a3);
}

+ (Class)publisherAttributionFilesType
{
  return (Class)objc_opt_class();
}

- (void)_readPublisherToFileIndex
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(_BYTE *)(a1 + 44) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPublisherAttributionManifestIndexReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPublisherToFileIndex_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableDictionary)publisherToFileIndex
{
  -[GEOPublisherAttributionManifestIndex _readPublisherToFileIndex]((uint64_t)self);
  return self->_publisherToFileIndex;
}

- (void)setPublisherToFileIndex:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *publisherToFileIndex;

  v4 = (NSMutableDictionary *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
  publisherToFileIndex = self->_publisherToFileIndex;
  self->_publisherToFileIndex = v4;

}

- (void)clearPublisherToFileIndex
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
  -[NSMutableDictionary removeAllObjects](self->_publisherToFileIndex, "removeAllObjects");
}

- (void)setPublisherToFileIndexValue:(unsigned int)a3 forKey:(id)a4
{
  uint64_t v4;
  id v6;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[GEOPublisherAttributionManifestIndex _readPublisherToFileIndex]((uint64_t)self);
  -[GEOPublisherAttributionManifestIndex _setNoFlagsPublisherToFileIndexValue:forKey:]((uint64_t)self, v4, v6);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
}

- (void)_setNoFlagsPublisherToFileIndexValue:(void *)a3 forKey:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  if (a1)
  {
    v10 = v5;
    v6 = *(void **)(a1 + 24);
    if (!v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v8 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v7;

      v6 = *(void **)(a1 + 24);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v9, v10);

    v5 = v10;
  }

}

- (unsigned)publisherToFileIndexForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[GEOPublisherAttributionManifestIndex _readPublisherToFileIndex]((uint64_t)self);
  -[NSMutableDictionary objectForKey:](self->_publisherToFileIndex, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v5, "unsignedIntValue");
  return v4;
}

- (void)enumeratePublisherToFileIndexUsingBlock:(id)a3
{
  id v4;
  NSMutableDictionary *publisherToFileIndex;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[GEOPublisherAttributionManifestIndex _readPublisherToFileIndex]((uint64_t)self);
  publisherToFileIndex = self->_publisherToFileIndex;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__GEOPublisherAttributionManifestIndex_enumeratePublisherToFileIndexUsingBlock___block_invoke;
  v7[3] = &unk_1E1C0D980;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](publisherToFileIndex, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __80__GEOPublisherAttributionManifestIndex_enumeratePublisherToFileIndexUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6;
  id v7;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = a2;
  (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v6 + 16))(v6, v7, objc_msgSend(a3, "unsignedIntValue"), a4);

}

- (unint64_t)publisherToFileIndexCount
{
  -[GEOPublisherAttributionManifestIndex _readPublisherToFileIndex]((uint64_t)self);
  return -[NSMutableDictionary count](self->_publisherToFileIndex, "count");
}

+ (Class)publisherToFileIndexType
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
  v8.super_class = (Class)GEOPublisherAttributionManifestIndex;
  -[GEOPublisherAttributionManifestIndex description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPublisherAttributionManifestIndex dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 16))
  {
    objc_msgSend((id)a1, "publisherAttributionFiles");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("publisherAttributionFiles"));

  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v5 = *(void **)(a1 + 24);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __66__GEOPublisherAttributionManifestIndex__dictionaryRepresentation___block_invoke;
    v8[3] = &unk_1E1C08930;
    v9 = v4;
    v6 = v4;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);
    objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("publisherToFileIndex"));

  }
  return v2;
}

uint64_t __66__GEOPublisherAttributionManifestIndex__dictionaryRepresentation___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", a3, a2);
}

- (GEOPublisherAttributionManifestIndex)initWithDictionary:(id)a3
{
  return (GEOPublisherAttributionManifestIndex *)-[GEOPublisherAttributionManifestIndex _initWithDictionary:isJSON:]((id *)&self->super.super.isa, a3);
}

- (id)_initWithDictionary:(id *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
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
  v3 = a2;
  if (a1)
  {
    a1 = objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("publisherAttributionFiles"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v5 = v4;
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v28;
          do
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v28 != v8)
                objc_enumerationMutation(v5);
              v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v11 = (void *)objc_msgSend(v10, "copy");
                objc_msgSend(a1, "addPublisherAttributionFiles:", v11);

              }
            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
          }
          while (v7);
        }

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("publisherToFileIndex"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = a1[3];
        a1[3] = (id)v13;

        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v15 = v12;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v24;
          do
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v24 != v18)
                objc_enumerationMutation(v15);
              v20 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j);
              objc_msgSend(v15, "objectForKeyedSubscript:", v20, (_QWORD)v23);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1[3], "setObject:forKey:", v21, v20);

            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v17);
        }

      }
    }
  }

  return a1;
}

- (GEOPublisherAttributionManifestIndex)initWithJSON:(id)a3
{
  return (GEOPublisherAttributionManifestIndex *)-[GEOPublisherAttributionManifestIndex _initWithDictionary:isJSON:]((id *)&self->super.super.isa, a3);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_42;
    else
      v8 = (int *)&readAll__nonRecursiveTag_42;
    GEOPublisherAttributionManifestIndexReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPublisherAttributionManifestIndexIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPublisherAttributionManifestIndexReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableDictionary *publisherToFileIndex;
  PBDataReader *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 7) == 0))
  {
    v11 = self->_reader;
    objc_sync_enter(v11);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v12);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPublisherAttributionManifestIndex readAll:](self, "readAll:", 0);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = self->_publisherAttributionFiles;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteStringField();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

    publisherToFileIndex = self->_publisherToFileIndex;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __48__GEOPublisherAttributionManifestIndex_writeTo___block_invoke;
    v13[3] = &unk_1E1C08930;
    v14 = v4;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](publisherToFileIndex, "enumerateKeysAndObjectsUsingBlock:", v13);

  }
}

uint64_t __48__GEOPublisherAttributionManifestIndex_writeTo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a2;
  PBDataWriterPlaceMark();
  PBDataWriterWriteStringField();

  objc_msgSend(v4, "unsignedIntValue");
  PBDataWriterWriteUint32Field();
  return PBDataWriterRecallMark();
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id *v8;
  id v9;
  id v10;
  NSMutableDictionary *publisherToFileIndex;
  id *v12;
  _QWORD v13[4];
  id *v14;

  v12 = (id *)a3;
  -[GEOPublisherAttributionManifestIndex readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 8) = self->_readerMarkPos;
  *((_DWORD *)v12 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOPublisherAttributionManifestIndex publisherAttributionFilesCount](self, "publisherAttributionFilesCount"))
  {
    objc_msgSend(v12, "clearPublisherAttributionFiles");
    v4 = -[GEOPublisherAttributionManifestIndex publisherAttributionFilesCount](self, "publisherAttributionFilesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOPublisherAttributionManifestIndex publisherAttributionFilesAtIndex:](self, "publisherAttributionFilesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addPublisherAttributionFiles:", v7);

      }
    }
  }
  if (-[GEOPublisherAttributionManifestIndex publisherToFileIndexCount](self, "publisherToFileIndexCount"))
  {
    objc_msgSend(v12, "clearPublisherToFileIndex");
    v8 = v12;
    if (!v12[3])
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v10 = v12[3];
      v12[3] = v9;

      v8 = v12;
    }
    publisherToFileIndex = self->_publisherToFileIndex;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __47__GEOPublisherAttributionManifestIndex_copyTo___block_invoke;
    v13[3] = &unk_1E1C08930;
    v14 = v8;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](publisherToFileIndex, "enumerateKeysAndObjectsUsingBlock:", v13);

  }
}

void __47__GEOPublisherAttributionManifestIndex_copyTo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  _QWORD *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  NSMutableDictionary *publisherToFileIndex;
  _QWORD v18[4];
  _QWORD *v19;
  _NSZone *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 4) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPublisherAttributionManifestIndexReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = v5;
      objc_sync_exit(v7);

LABEL_14:
      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPublisherAttributionManifestIndex readAll:](self, "readAll:", 0);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = self->_publisherAttributionFiles;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v5, "addPublisherAttributionFiles:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  if (-[NSMutableDictionary count](self->_publisherToFileIndex, "count"))
  {
    objc_msgSend(v5, "clearPublisherToFileIndex");
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v15 = (void *)v5[3];
    v5[3] = v14;

    publisherToFileIndex = self->_publisherToFileIndex;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __53__GEOPublisherAttributionManifestIndex_copyWithZone___block_invoke;
    v18[3] = &unk_1E1C0D9A8;
    v20 = a3;
    v19 = v5;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](publisherToFileIndex, "enumerateKeysAndObjectsUsingBlock:", v18);
    v8 = v19;
    goto LABEL_14;
  }
  return v5;
}

void __53__GEOPublisherAttributionManifestIndex_copyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  v7 = (id)objc_msgSend(a3, "copyWithZone:", v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", v7, v6);

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *publisherAttributionFiles;
  NSMutableDictionary *publisherToFileIndex;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPublisherAttributionManifestIndex readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         publisherAttributionFiles = self->_publisherAttributionFiles,
         !((unint64_t)publisherAttributionFiles | v4[2]))
     || -[NSMutableArray isEqual:](publisherAttributionFiles, "isEqual:")))
  {
    publisherToFileIndex = self->_publisherToFileIndex;
    if ((unint64_t)publisherToFileIndex | v4[3])
      v7 = -[NSMutableDictionary isEqual:](publisherToFileIndex, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;

  -[GEOPublisherAttributionManifestIndex readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_publisherAttributionFiles, "hash");
  return -[NSMutableDictionary hash](self->_publisherToFileIndex, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableDictionary *publisherToFileIndex;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4[2];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        -[GEOPublisherAttributionManifestIndex addPublisherAttributionFiles:](self, "addPublisherAttributionFiles:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9++), (_QWORD)v13);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  if (v4[3])
  {
    publisherToFileIndex = self->_publisherToFileIndex;
    if (publisherToFileIndex)
    {
      -[NSMutableDictionary addEntriesFromDictionary:](publisherToFileIndex, "addEntriesFromDictionary:");
    }
    else
    {
      v11 = (NSMutableDictionary *)objc_msgSend(v4[3], "copy");
      v12 = self->_publisherToFileIndex;
      self->_publisherToFileIndex = v11;

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherToFileIndex, 0);
  objc_storeStrong((id *)&self->_publisherAttributionFiles, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
