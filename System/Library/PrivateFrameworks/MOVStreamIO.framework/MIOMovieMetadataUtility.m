@implementation MIOMovieMetadataUtility

+ (BOOL)isTrack:(id)a3 forStreamId:(id)a4 mediaType:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v23 = a1;
  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v24 = a4;
  v8 = a5;
  objc_msgSend(v7, "mediaType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", v8);

  if ((v10 & 1) != 0)
  {
    objc_msgSend(v7, "metadata");
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v15, "identifier", v23);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(CFSTR("mdta/com.apple.track_kind"), "isEqualToString:", v16);

          if (v17)
          {
            objc_msgSend(v15, "value");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v21, "isEqualToString:", v24);

            v19 = v11;
            goto LABEL_14;
          }
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v12)
          continue;
        break;
      }
    }

    objc_msgSend((id)objc_opt_class(), "findStreamIdFromQTTagsOfTrack:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
      v20 = objc_msgSend(v18, "isEqualToString:", v24);
    else
      v20 = 0;
LABEL_14:

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (id)findAllAssociatedMetadataTracksInAsset:(id)a3 forTrack:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v5, "tracksWithMediaType:", *MEMORY[0x24BDB1D10]);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    v11 = *MEMORY[0x24BDB20E8];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v13, "associatedTracksOfType:", v11, (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "containsObject:", v6))
          objc_msgSend(v7, "addObject:", v13);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  v15 = (void *)objc_msgSend(v7, "copy");
  return v15;
}

+ (id)attachmentsTrackInAsset:(id)a3 forTrack:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "findAllAssociatedMetadataTracksInAsset:forTrack:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("mdta/com.apple.stream_sample_attachments"), "componentsSeparatedByString:", CFSTR("/"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        +[MOVStreamIOUtility getCustomAssociatedMetadataStreamIdFromTrack:](MOVStreamIOUtility, "getCustomAssociatedMetadataStreamIdFromTrack:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "isEqualToString:", v9) & 1) != 0)
        {
          v16 = v14;

          goto LABEL_11;
        }

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_11:

  return v16;
}

+ (id)findStreamIdFromQTTagsOfTrack:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a3, "metadataForFormat:", *MEMORY[0x24BDB1DB8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDB1E50];
  objc_msgSend(MEMORY[0x24BDB2588], "metadataItemsFromArray:withKey:keySpace:", v3, *MEMORY[0x24BDB1EF0], *MEMORY[0x24BDB1E50]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDB2588], "metadataItemsFromArray:withKey:keySpace:", v3, *MEMORY[0x24BDB1EF8], v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    if (v10)
    {
      objc_msgSend(v10, "stringValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (MIOMovieMetadataUtility)initWithURL:(id)a3 error:(id *)a4
{
  id v6;
  MIOMovieMetadataUtility *v7;
  void *v8;
  MIOMovieMetadataUtility *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MIOMovieMetadataUtility;
  v7 = -[MIOMovieMetadataUtility init](&v11, sel_init);
  if (!v7
    || (v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB25C0]), "initWithURL:options:error:", v6, 0, a4),
        -[MIOMovieMetadataUtility setMovie:](v7, "setMovie:", v8),
        v8,
        -[MIOMovieMetadataUtility movie](v7, "movie"),
        v9 = (MIOMovieMetadataUtility *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    v9 = v7;
  }

  return v9;
}

- (id)trackForStreamId:(id)a3 mediaType:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  +[MIOMediaTypeUtility matchingAVMediaTypeFromMIOMediaType:](MIOMediaTypeUtility, "matchingAVMediaTypeFromMIOMediaType:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[MIOMovieMetadataUtility movie](self, "movie");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tracksWithMediaType:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v19;
    while (2)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v14);
        if ((objc_msgSend((id)objc_opt_class(), "isTrack:forStreamId:mediaType:", v15, v8, v9) & 1) != 0)
        {
          v16 = v15;
          goto LABEL_11;
        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v12)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot find track for stream '%@'."), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a5, v11, 7);
  v16 = 0;
LABEL_11:

  return v16;
}

- (id)customTrackMetadataForStream:(id)a3 mediaType:(int64_t)a4 error:(id *)a5
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[MIOMovieMetadataUtility trackForStreamId:mediaType:error:](self, "trackForStreamId:mediaType:error:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "metadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MOVStreamIOUtility nonMIOTrackMetadataItemsInMetadataItems:](MOVStreamIOUtility, "nonMIOTrackMetadataItemsInMetadataItems:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)setCustomTrackMetadataForStream:(id)a3 mediaType:(int64_t)a4 metadata:(id)a5 error:(id *)a6
{
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v20 = a5;
  -[MIOMovieMetadataUtility trackForStreamId:mediaType:error:](self, "trackForStreamId:mediaType:error:", a3, a4, a6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v21, "metadata");
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v15, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          +[MOVStreamIOUtility reservedMIOTrackMetadataKeys](MOVStreamIOUtility, "reservedMIOTrackMetadataKeys");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "containsObject:", v16);

          if (v18)
            objc_msgSend(v10, "addObject:", v15);

        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v12);
    }

    if (objc_msgSend(v20, "count"))
      objc_msgSend(v10, "addObjectsFromArray:", v20);
    objc_msgSend(v21, "setMetadata:", v10);

  }
  return v21 != 0;
}

- (id)metadataForMovie
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v3 = (void *)objc_opt_new();
  -[MIOMovieMetadataUtility movie](self, "movie");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __43__MIOMovieMetadataUtility_metadataForMovie__block_invoke;
  v10[3] = &unk_24CA45038;
  v6 = v3;
  v11 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

  if (objc_msgSend(v6, "count"))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

void __43__MIOMovieMetadataUtility_metadataForMovie__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  BOOL v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[MOVStreamIOUtility isMOVStreamIOMovMetadataIdentifier:](MOVStreamIOUtility, "isMOVStreamIOMovMetadataIdentifier:", v3);

  if (!v4)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

- (BOOL)setMovieMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[MIOMovieMetadataUtility movie](self, "movie");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __44__MIOMovieMetadataUtility_setMovieMetadata___block_invoke;
  v11[3] = &unk_24CA45038;
  v8 = v5;
  v12 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

  if (objc_msgSend(v4, "count"))
    objc_msgSend(v8, "addObjectsFromArray:", v4);
  -[MIOMovieMetadataUtility movie](self, "movie");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMetadata:", v8);

  return 1;
}

void __44__MIOMovieMetadataUtility_setMovieMetadata___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL4 v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[MOVStreamIOUtility isMOVStreamIOMovMetadataIdentifier:](MOVStreamIOUtility, "isMOVStreamIOMovMetadataIdentifier:", v3);

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

- (BOOL)addMovieMetadataItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[MIOMovieMetadataUtility movie](self, "movie");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "addObject:", v4);
  -[MIOMovieMetadataUtility movie](self, "movie");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMetadata:", v7);

  return 1;
}

- (BOOL)applyChangesError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[MIOMovieMetadataUtility movie](self, "movie");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIOMovieMetadataUtility movie](self, "movie");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "writeMovieHeaderToURL:fileType:options:error:", v7, *MEMORY[0x24BDB1C40], 0, a3);

  return (char)a3;
}

- (AVMutableMovie)movie
{
  return (AVMutableMovie *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMovie:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movie, 0);
}

@end
