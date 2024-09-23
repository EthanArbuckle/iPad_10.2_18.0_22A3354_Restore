@implementation SHCustomCatalogMemoryStorage

- (SHCustomCatalogMemoryStorage)init
{
  SHCustomCatalogMemoryStorage *v2;
  uint64_t v3;
  NSMutableDictionary *signatures;
  uint64_t v5;
  NSMutableDictionary *mediaItems;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SHCustomCatalogMemoryStorage;
  v2 = -[SHCustomCatalogMemoryStorage init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    signatures = v2->_signatures;
    v2->_signatures = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    mediaItems = v2->_mediaItems;
    v2->_mediaItems = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (NSArray)referenceSignatures
{
  NSArray *referenceSignatures;
  SHCustomCatalogMemoryStorage *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  SHReferenceSignature *v18;
  uint64_t v19;
  NSArray *v20;
  NSArray *v21;
  SHCustomCatalogMemoryStorage *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  referenceSignatures = self->_referenceSignatures;
  if (referenceSignatures)
    return referenceSignatures;
  v4 = self;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[SHCustomCatalogMemoryStorage signatures](v4, "signatures");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v24)
  {
    v8 = 0;
    v22 = v4;
    v23 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(v7);
        v10 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        -[SHCustomCatalogMemoryStorage signatures](v4, "signatures");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v14)
        {
          v15 = v14;
          v25 = i;
          v16 = *(_QWORD *)v27;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v27 != v16)
                objc_enumerationMutation(v13);
              v18 = -[SHReferenceSignature initWithID:trackID:signature:]([SHReferenceSignature alloc], "initWithID:trackID:signature:", v10, v8 + j, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j));
              objc_msgSend(v5, "addObject:", v18);

            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            v8 += j;
          }
          while (v15);
          v4 = v22;
          i = v25;
        }

      }
      v24 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v24);
  }

  v19 = objc_msgSend(v5, "copy");
  v20 = v4->_referenceSignatures;
  v4->_referenceSignatures = (NSArray *)v19;

  v21 = v4->_referenceSignatures;
  return v21;
}

- (id)mediaItemsForReferenceSignature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[SHCustomCatalogMemoryStorage mediaItems](self, "mediaItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    v7 = (void *)MEMORY[0x24BDBD1A8];
  v9 = v7;

  return v9;
}

- (void)addSignature:(id)a3 representingMediaItems:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "_ID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHCustomCatalogMemoryStorage producedSignature:forID:](self, "producedSignature:forID:", v6, v9);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14);
        objc_msgSend(v6, "_ID", (_QWORD)v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "UUIDString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SHCustomCatalogMemoryStorage producedMediaItem:forID:](self, "producedMediaItem:forID:", v15, v17);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

}

- (id)referenceSignatureForTrackID:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SHCustomCatalogMemoryStorage referenceSignatures](self, "referenceSignatures", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "trackID") == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)producedMediaItem:(id)a3 forID:(id)a4
{
  NSArray *referenceSignatures;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  referenceSignatures = self->_referenceSignatures;
  self->_referenceSignatures = 0;
  v7 = a3;

  -[SHCustomCatalogMemoryStorage mediaItems](self, "mediaItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHCustomCatalogMemoryStorage mediaItems](self, "mediaItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v14);

  }
  -[SHCustomCatalogMemoryStorage mediaItems](self, "mediaItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v7);

}

- (void)producedSignature:(id)a3 forID:(id)a4
{
  NSArray *referenceSignatures;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  referenceSignatures = self->_referenceSignatures;
  self->_referenceSignatures = 0;
  v7 = a3;

  -[SHCustomCatalogMemoryStorage signatures](self, "signatures");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHCustomCatalogMemoryStorage signatures](self, "signatures");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v14);

  }
  -[SHCustomCatalogMemoryStorage signatures](self, "signatures");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v7);

}

- (NSMutableDictionary)signatures
{
  return self->_signatures;
}

- (void)setSignatures:(id)a3
{
  objc_storeStrong((id *)&self->_signatures, a3);
}

- (NSMutableDictionary)mediaItems
{
  return self->_mediaItems;
}

- (void)setMediaItems:(id)a3
{
  objc_storeStrong((id *)&self->_mediaItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaItems, 0);
  objc_storeStrong((id *)&self->_signatures, 0);
  objc_storeStrong((id *)&self->_referenceSignatures, 0);
}

@end
