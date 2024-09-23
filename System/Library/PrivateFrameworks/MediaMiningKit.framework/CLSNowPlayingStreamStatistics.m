@implementation CLSNowPlayingStreamStatistics

- (CLSNowPlayingStreamStatistics)initWithNowPlayingStreamSessions:(id)a3
{
  id v4;
  CLSNowPlayingStreamStatistics *v5;
  void *v6;
  uint64_t v7;
  NSArray *sortedSessions;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CLSNowPlayingStreamStatistics;
  v5 = -[CLSNowPlayingStreamStatistics init](&v10, sel_init);
  if (v5)
  {
    +[CLSNowPlayingStreamSession playbackStreamSessionDateSortDescriptors](CLSNowPlayingStreamSession, "playbackStreamSessionDateSortDescriptors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedArrayUsingDescriptors:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    sortedSessions = v5->_sortedSessions;
    v5->_sortedSessions = (NSArray *)v7;

  }
  return v5;
}

- (void)computeStatistics
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  NSArray *v25;
  NSArray *sortedAlbums;
  NSArray *v27;
  NSArray *sortedArtists;
  NSArray *v29;
  NSArray *sortedTitles;
  NSArray *v31;
  NSArray *sortedGenres;
  NSArray *v33;
  NSArray *sortedSources;
  id obj;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)&self->_maxDurationInSeconds = xmmword_1CABE9070;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  -[CLSNowPlayingStreamStatistics sortedSessions](self, "sortedSessions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v37)
  {
    v36 = *(_QWORD *)v47;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v47 != v36)
          objc_enumerationMutation(obj);
        v38 = v5;
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v5), "events");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v43;
          do
          {
            v10 = 0;
            do
            {
              if (*(_QWORD *)v43 != v9)
                objc_enumerationMutation(v6);
              objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v10), "metadata");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "album");
              v12 = (void *)objc_claimAutoreleasedReturnValue();

              if (v12)
              {
                objc_msgSend(v11, "album");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "addObject:", v13);

              }
              objc_msgSend(v11, "artist");
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              if (v14)
              {
                objc_msgSend(v11, "artist");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "addObject:", v15);

              }
              objc_msgSend(v11, "title");
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if (v16)
              {
                objc_msgSend(v11, "title");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "addObject:", v17);

              }
              objc_msgSend(v11, "genres");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "allObjects");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "addObjectsFromArray:", v19);

              objc_msgSend(v11, "source");
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              if (v20)
              {
                objc_msgSend(v11, "source");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "addObject:", v21);

              }
              objc_msgSend(v11, "durationInSeconds");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "doubleValue");
              v24 = v23;

              if (v24 > self->_maxDurationInSeconds)
                self->_maxDurationInSeconds = v24;
              if (v24 < self->_minDurationInSeconds)
                self->_minDurationInSeconds = v24;

              ++v10;
            }
            while (v8 != v10);
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
          }
          while (v8);
        }

        v5 = v38 + 1;
      }
      while (v38 + 1 != v37);
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v37);
  }

  __50__CLSNowPlayingStreamStatistics_computeStatistics__block_invoke(v3);
  v25 = (NSArray *)objc_claimAutoreleasedReturnValue();
  sortedAlbums = self->_sortedAlbums;
  self->_sortedAlbums = v25;

  __50__CLSNowPlayingStreamStatistics_computeStatistics__block_invoke(v41);
  v27 = (NSArray *)objc_claimAutoreleasedReturnValue();
  sortedArtists = self->_sortedArtists;
  self->_sortedArtists = v27;

  __50__CLSNowPlayingStreamStatistics_computeStatistics__block_invoke(v40);
  v29 = (NSArray *)objc_claimAutoreleasedReturnValue();
  sortedTitles = self->_sortedTitles;
  self->_sortedTitles = v29;

  __50__CLSNowPlayingStreamStatistics_computeStatistics__block_invoke(v4);
  v31 = (NSArray *)objc_claimAutoreleasedReturnValue();
  sortedGenres = self->_sortedGenres;
  self->_sortedGenres = v31;

  __50__CLSNowPlayingStreamStatistics_computeStatistics__block_invoke(v39);
  v33 = (NSArray *)objc_claimAutoreleasedReturnValue();
  sortedSources = self->_sortedSources;
  self->_sortedSources = v33;

}

- (void)logStatistics
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;

  statsPrint(CFSTR("\n"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v23);
  -[CLSNowPlayingStreamStatistics sortedGenres](self, "sortedGenres");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __46__CLSNowPlayingStreamStatistics_logStatistics__block_invoke(v9, CFSTR("genres"));

  -[CLSNowPlayingStreamStatistics sortedArtists](self, "sortedArtists");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __46__CLSNowPlayingStreamStatistics_logStatistics__block_invoke(v10, CFSTR("artists"));

  -[CLSNowPlayingStreamStatistics sortedAlbums](self, "sortedAlbums");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __46__CLSNowPlayingStreamStatistics_logStatistics__block_invoke(v11, CFSTR("albums"));

  -[CLSNowPlayingStreamStatistics sortedTitles](self, "sortedTitles");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __46__CLSNowPlayingStreamStatistics_logStatistics__block_invoke(v12, CFSTR("songs"));

  -[CLSNowPlayingStreamStatistics sortedSources](self, "sortedSources");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __46__CLSNowPlayingStreamStatistics_logStatistics__block_invoke(v13, CFSTR("sources"));

  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[CLSNowPlayingStreamStatistics maxDurationInSeconds](self, "maxDurationInSeconds");
  objc_msgSend(v14, "numberWithDouble:");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[CLSNowPlayingStreamStatistics minDurationInSeconds](self, "minDurationInSeconds");
  objc_msgSend(v15, "numberWithDouble:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  statsPrint(CFSTR("max duration (seconds): %@ - min duration (seconds): %@\n"), v16, v17, v18, v19, v20, v21, v22, (uint64_t)v25);

}

- (NSArray)sortedAlbums
{
  return self->_sortedAlbums;
}

- (NSArray)sortedArtists
{
  return self->_sortedArtists;
}

- (NSArray)sortedTitles
{
  return self->_sortedTitles;
}

- (NSArray)sortedGenres
{
  return self->_sortedGenres;
}

- (NSArray)sortedSources
{
  return self->_sortedSources;
}

- (NSArray)sortedSessions
{
  return self->_sortedSessions;
}

- (double)maxDurationInSeconds
{
  return self->_maxDurationInSeconds;
}

- (double)minDurationInSeconds
{
  return self->_minDurationInSeconds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedSessions, 0);
  objc_storeStrong((id *)&self->_sortedSources, 0);
  objc_storeStrong((id *)&self->_sortedGenres, 0);
  objc_storeStrong((id *)&self->_sortedTitles, 0);
  objc_storeStrong((id *)&self->_sortedArtists, 0);
  objc_storeStrong((id *)&self->_sortedAlbums, 0);
}

void __46__CLSNowPlayingStreamStatistics_logStatistics__block_invoke(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unint64_t i;
  void *v22;
  void *v23;
  id v24;

  v24 = a1;
  v3 = a2;
  v4 = 20;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  statsPrint(CFSTR("Top %@ %@..."), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  if ((unint64_t)objc_msgSend(v24, "count") <= 0x14)
    v4 = objc_msgSend(v24, "count");
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      objc_msgSend(v24, "objectAtIndexedSubscript:", i);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "description");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "appendString:", v23);

      if (i < v4 - 1)
        objc_msgSend(v20, "appendString:", CFSTR("\n"));
    }
  }
  statsPrint(CFSTR("%@\n"), v13, v14, v15, v16, v17, v18, v19, (uint64_t)v20);

}

id __50__CLSNowPlayingStreamStatistics_computeStatistics__block_invoke(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v1 = a1;
  objc_msgSend(v1, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__CLSNowPlayingStreamStatistics_computeStatistics__block_invoke_2;
  v6[3] = &unk_1E84F8678;
  v7 = v1;
  v3 = v1;
  objc_msgSend(v2, "sortedArrayUsingComparator:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __50__CLSNowPlayingStreamStatistics_computeStatistics__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = objc_msgSend(v5, "countForObject:", a2);
  v8 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", v6);

  v9 = 1;
  if (v7 >= v8)
    v9 = -1;
  if (v7 == v8)
    return 0;
  else
    return v9;
}

@end
