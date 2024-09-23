@implementation MSVLyricsSongInfo

- (MSVLyricsSongInfo)init
{
  MSVLyricsSongInfo *v2;
  MSVLyricsSongInfo *v3;
  NSArray *songwriters;
  NSArray *v5;
  NSArray *lyricsLines;
  NSArray *lyricsSections;
  NSDictionary *translationsMap;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MSVLyricsSongInfo;
  v2 = -[MSVLyricsSongInfo init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_type = 0;
    songwriters = v2->_songwriters;
    v5 = (NSArray *)MEMORY[0x1E0C9AA60];
    v2->_songwriters = (NSArray *)MEMORY[0x1E0C9AA60];

    lyricsLines = v3->_lyricsLines;
    v3->_lyricsLines = v5;

    lyricsSections = v3->_lyricsSections;
    v3->_lyricsSections = v5;

    translationsMap = v3->_translationsMap;
    v3->_translationsMap = (NSDictionary *)MEMORY[0x1E0C9AA70];

  }
  return v3;
}

- (id)lyricsLinesAtTimeOffset:(double)a3 errorMargin:(double)a4
{
  void *v6;
  void *v7;

  -[MSVLyricsSongInfo lyricsLines](self, "lyricsLines");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSVLyricsSongInfo _elementsInArray:atTimeOffset:errorMargin:](MSVLyricsSongInfo, "_elementsInArray:atTimeOffset:errorMargin:", v6, a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)lyricsWordsAtTimeOffset:(double)a3 errorMargin:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[MSVLyricsSongInfo lyricsLines](self, "lyricsLines");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSVLyricsSongInfo _elementsInArray:atTimeOffset:errorMargin:](MSVLyricsSongInfo, "_elementsInArray:atTimeOffset:errorMargin:", v6, a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "words", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[MSVLyricsSongInfo _elementsInArray:atTimeOffset:errorMargin:](MSVLyricsSongInfo, "_elementsInArray:atTimeOffset:errorMargin:", v14, a3, a4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObjectsFromArray:", v15);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)lyricsLineStartingBeforeTimeOffset:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;

  -[MSVLyricsSongInfo lyricsLines](self, "lyricsLines");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MSVLyricsSongInfo type](self, "type"))
  {
    -[MSVLyricsSongInfo lyricsLines](self, "lyricsLines");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startTime");
    v9 = v8;

    if (v9 <= a3)
    {
      v10 = objc_msgSend(v5, "count") - 1;
      if (v10 >= 0)
      {
        v11 = 0;
        do
        {
          v12 = v10 - v11;
          if (v10 < v11)
            ++v12;
          v13 = v11 + (v12 >> 1);
          objc_msgSend(v5, "objectAtIndexedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "startTime");
          v16 = v15;
          if (v13 >= objc_msgSend(v5, "count") - 1)
          {
            v19 = 1.79769313e308;
          }
          else
          {
            objc_msgSend(v5, "objectAtIndexedSubscript:", v13 + 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "startTime");
            v19 = v18;

          }
          if (v16 <= a3)
          {
            if (v19 >= a3)
              goto LABEL_16;
            v11 = v13 + 1;
          }
          else
          {
            v10 = v13 - 1;
          }

        }
        while (v11 <= v10);
      }
    }
  }
  v14 = 0;
LABEL_16:

  return v14;
}

- (NSArray)availableTranslations
{
  void *v2;
  void *v3;

  -[MSVLyricsSongInfo translationsMap](self, "translationsMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)translatedTextForLyricsLine:(id)a3 language:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  -[MSVLyricsSongInfo translationsMap](self, "translationsMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count") && objc_msgSend(v7, "length"))
  {
    objc_msgSend(v6, "translationKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (!v10)
    {
      v14 = 0;
      goto LABEL_7;
    }
    -[MSVLyricsSongInfo translationsMap](self, "translationsMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "translationKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lyricsText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

LABEL_7:
  return v14;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  +[MSVLyricsSongInfo _descriptionForLyricsInfoType:](MSVLyricsSongInfo, "_descriptionForLyricsInfoType:", -[MSVLyricsSongInfo type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVLyricsSongInfo songDuration](self, "songDuration");
  v6 = v5;
  -[MSVLyricsSongInfo lyricsSections](self, "lyricsSections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  -[MSVLyricsSongInfo lyricsLines](self, "lyricsLines");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  -[MSVLyricsSongInfo songwriters](self, "songwriters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVLyricsSongInfo availableTranslations](self, "availableTranslations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Type: %@, duration: %g, %ld sections, %ld lines, songwriters: %@, translations: %@"), v4, v6, v8, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)setLyricsLinesSortedByStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_lyricsLines, a3);
}

- (void)setLyricsLines:(id)a3
{
  NSArray *v4;
  NSArray *lyricsLines;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;

  -[MSVLyricsSongInfo _sortLyricsLinesByStartTime:](self, "_sortLyricsLinesByStartTime:", a3);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  lyricsLines = self->_lyricsLines;
  self->_lyricsLines = v4;

  if (-[NSArray count](self->_lyricsLines, "count"))
  {
    v6 = 0;
    do
    {
      v7 = v6;
      -[NSArray objectAtIndexedSubscript:](self->_lyricsLines, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setLineIndex:", v6++);
      if (-[NSArray count](self->_lyricsLines, "count") - 1 <= v7)
      {
        objc_msgSend(v8, "setNextLine:", 0);
      }
      else
      {
        -[NSArray objectAtIndexedSubscript:](self->_lyricsLines, "objectAtIndexedSubscript:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setNextLine:", v9);

      }
    }
    while (-[NSArray count](self->_lyricsLines, "count") > v6);
  }
}

- (id)_sortLyricsLinesByStartTime:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_873);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (double)songDuration
{
  return self->_songDuration;
}

- (void)setSongDuration:(double)a3
{
  self->_songDuration = a3;
}

- (double)leadingSilence
{
  return self->_leadingSilence;
}

- (void)setLeadingSilence:(double)a3
{
  self->_leadingSilence = a3;
}

- (NSArray)songwriters
{
  return self->_songwriters;
}

- (void)setSongwriters:(id)a3
{
  objc_storeStrong((id *)&self->_songwriters, a3);
}

- (NSString)lyricGenId
{
  return self->_lyricGenId;
}

- (void)setLyricGenId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)lyricsLines
{
  return self->_lyricsLines;
}

- (NSArray)agents
{
  return self->_agents;
}

- (void)setAgents:(id)a3
{
  objc_storeStrong((id *)&self->_agents, a3);
}

- (MSVLyricsAudioAttributes)audioAttributes
{
  return self->_audioAttributes;
}

- (void)setAudioAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_audioAttributes, a3);
}

- (NSArray)lyricsSections
{
  return self->_lyricsSections;
}

- (void)setLyricsSections:(id)a3
{
  objc_storeStrong((id *)&self->_lyricsSections, a3);
}

- (NSDictionary)translationsMap
{
  return self->_translationsMap;
}

- (void)setTranslationsMap:(id)a3
{
  objc_storeStrong((id *)&self->_translationsMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translationsMap, 0);
  objc_storeStrong((id *)&self->_lyricsSections, 0);
  objc_storeStrong((id *)&self->_audioAttributes, 0);
  objc_storeStrong((id *)&self->_agents, 0);
  objc_storeStrong((id *)&self->_lyricsLines, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_lyricGenId, 0);
  objc_storeStrong((id *)&self->_songwriters, 0);
}

uint64_t __49__MSVLyricsSongInfo__sortLyricsLinesByStartTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "startTime");
  v7 = v6;
  objc_msgSend(v5, "startTime");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "startTime");
    v11 = v10;
    objc_msgSend(v5, "startTime");
    v9 = v11 > v12;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

+ (id)_elementsInArray:(id)a3 atTimeOffset:(double)a4 errorMargin:(double)a5
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  double v17;
  double v18;
  double v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = a4 - a5;
    v13 = a4 + a5;
    v14 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v16, "startTime", (_QWORD)v21);
        if (v13 >= v17 && (objc_msgSend(v16, "endTime"), v12 <= v18))
        {
          objc_msgSend(v8, "addObject:", v16);
        }
        else
        {
          objc_msgSend(v16, "startTime");
          if (v13 < v19)
            goto LABEL_13;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }
LABEL_13:

  return v8;
}

+ (id)_descriptionForLyricsInfoType:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return 0;
  else
    return off_1E43E8818[a3];
}

@end
