@implementation MPMediaChapter

- (int64_t)_sortByChapterIndex:(id)a3
{
  id v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;

  v4 = a3;
  v5 = -[MPMediaChapter indexInChaptersWithAnyType](self, "indexInChaptersWithAnyType");
  if (v5 >= objc_msgSend(v4, "indexInChaptersWithAnyType"))
  {
    v7 = -[MPMediaChapter indexInChaptersWithAnyType](self, "indexInChaptersWithAnyType");
    v6 = v7 > objc_msgSend(v4, "indexInChaptersWithAnyType");
  }
  else
  {
    v6 = -1;
  }

  return v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t i;
  _OWORD v14[2];
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14[0] = xmmword_1E3158608;
  v14[1] = *(_OWORD *)off_1E3158618;
  v15 = CFSTR("urlDescription");
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[MPMediaChapter indexInChaptersWithAnyType](self, "indexInChaptersWithAnyType");
  -[MPMediaChapter playbackTime](self, "playbackTime");
  v7 = v6;
  -[MPMediaChapter playbackTime](self, "playbackTime");
  v9 = v8;
  -[MPMediaChapter playbackDuration](self, "playbackDuration");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> chapter %lu, time = range = [%.2f, %.2f], %@ = %@"), v4, self, v5, v7, v9 + v10, *((_QWORD *)v14 + -[MPMediaChapter chapterType](self, "chapterType")), self->_value);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 32; i != -8; i -= 8)

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  int v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C78], CFSTR("only keyed archiving is supported"));
    goto LABEL_5;
  }
  objc_msgSend(v6, "encodeInteger:forKey:", self->_indexInChaptersWithAnyType, CFSTR("MPIndexInChaptersOfAnyType"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_indexInChaptersWithSameType, CFSTR("MPIndexInChaptersOfSameType"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_chapterType, CFSTR("MPChapterType"));
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("MPPlaybackDuration"), self->_playbackDuration);
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("MPPlaybackTime"), self->_playbackTime);
  v4 = objc_msgSend(self->_value, "conformsToProtocol:", &unk_1EE2D6128);
  v5 = v6;
  if (v4)
  {
    objc_msgSend(v6, "encodeObject:forKey:", self->_value, CFSTR("MPValue"));
LABEL_5:
    v5 = v6;
  }

}

- (MPMediaChapter)initWithCoder:(id)a3
{
  id v4;
  MPMediaChapter *v5;
  void *v6;
  uint64_t v7;
  MPMediaChapter *v8;
  double v9;
  double v10;
  uint64_t v11;
  id value;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) != 0)
  {
    v5 = -[MPMediaChapter init](self, "init");
    if (v5)
    {
      objc_msgSend(v4, "valueForKey:", CFSTR("MPChapterIndex"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MPChapterIndex"));
        v5->_indexInChaptersWithAnyType = v7;
      }
      else
      {
        v5->_indexInChaptersWithAnyType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MPIndexInChaptersOfAnyType"));
        v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MPIndexInChaptersOfSameType"));
      }
      v5->_indexInChaptersWithSameType = v7;
      v5->_chapterType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MPChapterType"));
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("MPPlaybackDuration"));
      v5->_playbackDuration = v9;
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("MPPlaybackTime"));
      v5->_playbackTime = v10;
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("MPValue"));
      v11 = objc_claimAutoreleasedReturnValue();
      value = v5->_value;
      v5->_value = (id)v11;

    }
    self = v5;
    v8 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("only keyed archiving is supported"));
    v8 = 0;
  }

  return v8;
}

- (id)value
{
  void (**valueLoader)(id, SEL);
  id v4;

  valueLoader = (void (**)(id, SEL))self->_valueLoader;
  if (valueLoader)
  {
    valueLoader[2](valueLoader, a2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_value;
  }
  return v4;
}

- (id)title
{
  id value;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    value = self->_value;
  else
    value = 0;
  return value;
}

- (double)duration
{
  return self->_playbackDuration;
}

- (unint64_t)indexInChaptersWithAnyType
{
  return self->_indexInChaptersWithAnyType;
}

- (void)setIndexInChaptersWithAnyType:(unint64_t)a3
{
  self->_indexInChaptersWithAnyType = a3;
}

- (unint64_t)indexInChaptersWithSameType
{
  return self->_indexInChaptersWithSameType;
}

- (void)setIndexInChaptersWithSameType:(unint64_t)a3
{
  self->_indexInChaptersWithSameType = a3;
}

- (int64_t)chapterType
{
  return self->_chapterType;
}

- (void)setChapterType:(int64_t)a3
{
  self->_chapterType = a3;
}

- (double)playbackDuration
{
  return self->_playbackDuration;
}

- (void)setPlaybackDuration:(double)a3
{
  self->_playbackDuration = a3;
}

- (double)playbackTime
{
  return self->_playbackTime;
}

- (void)setPlaybackTime:(double)a3
{
  self->_playbackTime = a3;
}

- (void)setValue:(id)a3
{
  objc_storeStrong(&self->_value, a3);
}

- (id)valueLoader
{
  return self->_valueLoader;
}

- (void)setValueLoader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (MPMediaLibraryArtworkRequest)artworkRequest
{
  return self->_artworkRequest;
}

- (void)setArtworkRequest:(id)a3
{
  objc_storeStrong((id *)&self->_artworkRequest, a3);
}

- (MPMediaLibraryArtworkDataSource)artworkDataSource
{
  return (MPMediaLibraryArtworkDataSource *)objc_loadWeakRetained((id *)&self->_artworkDataSource);
}

- (void)setArtworkDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_artworkDataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_artworkDataSource);
  objc_storeStrong((id *)&self->_artworkRequest, 0);
  objc_storeStrong(&self->_valueLoader, 0);
  objc_storeStrong(&self->_value, 0);
}

- (id)artworkCatalog
{
  void *v3;
  MPArtworkCatalog *v4;
  void *v5;
  MPArtworkCatalog *v6;
  MPArtworkCatalog *v7;

  -[MPMediaChapter artworkDataSource](self, "artworkDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [MPArtworkCatalog alloc];
  -[MPMediaChapter artworkRequest](self, "artworkRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MPArtworkCatalog initWithToken:dataSource:](v4, "initWithToken:dataSource:", v5, v3);

  if (objc_msgSend(v3, "areRepresentationsAvailableForCatalog:", v6))
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

@end
