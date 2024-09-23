@implementation SHMREMatch

- (SHMREMatch)initWithResult:(id)a3 mediaItems:(id)a4 signatureAlignments:(id)a5 querySignature:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  SHMREMatch *v20;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_msgSend(v13, "trackID");
  objc_msgSend(v13, "offset");
  v16 = v15;
  objc_msgSend(v13, "timeSkew");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "freqSkew");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "score");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[SHMREMatch initWithTrackID:matchOffset:timeSkew:frequencySkew:score:mediaItems:querySignature:signatureAlignments:](self, "initWithTrackID:matchOffset:timeSkew:frequencySkew:score:mediaItems:querySignature:signatureAlignments:", v14, v17, v18, v19, v12, v10, v16, v11);
  return v20;
}

- (SHMREMatch)initWithTrackID:(unint64_t)a3 matchOffset:(double)a4 timeSkew:(id)a5 frequencySkew:(id)a6 score:(id)a7 mediaItems:(id)a8 querySignature:(id)a9 signatureAlignments:(id)a10
{
  id v18;
  id v19;
  SHMREMatch *v20;
  SHMREMatch *v21;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a5;
  v25 = a6;
  v24 = a7;
  v23 = a8;
  v18 = a9;
  v19 = a10;
  v27.receiver = self;
  v27.super_class = (Class)SHMREMatch;
  v20 = -[SHMREMatch init](&v27, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_trackID = a3;
    v20->_offset = a4;
    objc_storeStrong((id *)&v20->_timeSkew, a5);
    objc_storeStrong((id *)&v21->_freqSkew, a6);
    objc_storeStrong((id *)&v21->_score, a7);
    objc_storeStrong((id *)&v21->_mediaItems, a8);
    objc_storeStrong((id *)&v21->_signatureAlignments, a10);
    objc_storeStrong((id *)&v21->_querySignature, a9);
  }

  return v21;
}

- (id)toMatchedMediaItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  SHMatchedMediaItem *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  SHMatchedMediaItem *v28;
  uint64_t v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  SHMatchedMediaItem *v37;
  _QWORD v38[5];
  _QWORD v39[6];

  v39[5] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCED8];
  v38[0] = CFSTR("sh_matchOffset");
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[SHMREMatch offset](self, "offset");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v5;
  v38[1] = CFSTR("sh_speedSkew");
  -[SHMREMatch timeSkew](self, "timeSkew");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v6;
  v38[2] = CFSTR("sh_frequencySkew");
  -[SHMREMatch freqSkew](self, "freqSkew");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v7;
  v38[3] = CFSTR("sh_score");
  -[SHMREMatch score](self, "score");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v8;
  v38[4] = CFSTR("sh_audioStartDate");
  -[SHMREMatch querySignature](self, "querySignature");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "audioStartDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39[4] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SHMREMatch signatureAlignments](self, "signatureAlignments");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    -[SHMREMatch signatureAlignments](self, "signatureAlignments");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValue:forKey:", v15, CFSTR("sh_signatureAlignments"));

  }
  -[SHMREMatch mediaItems](self, "mediaItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    v18 = (void *)MEMORY[0x24BDBCEB8];
    -[SHMREMatch mediaItems](self, "mediaItems");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "arrayWithCapacity:", objc_msgSend(v19, "count"));
    v20 = (SHMatchedMediaItem *)objc_claimAutoreleasedReturnValue();

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[SHMREMatch mediaItems](self, "mediaItems", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v33;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v33 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v25), "properties");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = (void *)objc_msgSend(v26, "mutableCopy");

          objc_msgSend(v27, "addEntriesFromDictionary:", v12);
          v28 = -[SHMatchedMediaItem initWithMatchedMediaItemDictionary:]([SHMatchedMediaItem alloc], "initWithMatchedMediaItemDictionary:", v27);
          -[SHMatchedMediaItem addObject:](v20, "addObject:", v28);

          ++v25;
        }
        while (v23 != v25);
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v23);
    }

    v29 = -[SHMatchedMediaItem copy](v20, "copy");
  }
  else
  {
    v20 = -[SHMatchedMediaItem initWithMatchedMediaItemDictionary:]([SHMatchedMediaItem alloc], "initWithMatchedMediaItemDictionary:", v12);
    v37 = v20;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v37, 1);
    v29 = objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)v29;

  return v30;
}

- (unint64_t)trackID
{
  return self->_trackID;
}

- (double)offset
{
  return self->_offset;
}

- (NSNumber)timeSkew
{
  return self->_timeSkew;
}

- (NSNumber)freqSkew
{
  return self->_freqSkew;
}

- (NSNumber)score
{
  return self->_score;
}

- (NSArray)mediaItems
{
  return self->_mediaItems;
}

- (NSArray)signatureAlignments
{
  return self->_signatureAlignments;
}

- (SHSignature)querySignature
{
  return self->_querySignature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_querySignature, 0);
  objc_storeStrong((id *)&self->_signatureAlignments, 0);
  objc_storeStrong((id *)&self->_mediaItems, 0);
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_freqSkew, 0);
  objc_storeStrong((id *)&self->_timeSkew, 0);
}

@end
