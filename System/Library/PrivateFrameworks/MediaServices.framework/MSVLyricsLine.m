@implementation MSVLyricsLine

- (MSVLyricsLine)init
{
  MSVLyricsLine *v2;
  MSVLyricsLine *v3;
  uint64_t v4;
  NSAttributedString *primaryVocalText;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MSVLyricsLine;
  v2 = -[MSVLyricsTextElement init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MSVLyricsElement setType:](v2, "setType:", 1);
    v4 = objc_opt_new();
    primaryVocalText = v3->_primaryVocalText;
    v3->_primaryVocalText = (NSAttributedString *)v4;

  }
  return v3;
}

- (id)description
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[MSVLyricsLine lineIndex](self, "lineIndex");
  v8.receiver = self;
  v8.super_class = (Class)MSVLyricsLine;
  -[MSVLyricsTextElement description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Line index: %ld, lyrics text element: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)containsTimeOffset:(double)a3 withErrorMargin:(double)a4
{
  double v7;
  double v9;

  -[MSVLyricsElement startTime](self, "startTime");
  if (v7 - a4 > a3)
    return 0;
  -[MSVLyricsElement endTime](self, "endTime");
  return v9 + a4 >= a3;
}

- (id)agent
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MSVLyricsLine;
  -[MSVLyricsElement agent](&v8, sel_agent);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[MSVLyricsLine parentSection](self, "parentSection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "agent");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (NSAttributedString)primaryVocalText
{
  NSAttributedString *v3;

  if (-[MSVLyricsLine hasBackgroundVocal](self, "hasBackgroundVocal"))
  {
    v3 = self->_primaryVocalText;
  }
  else
  {
    -[MSVLyricsTextElement lyricsText](self, "lyricsText");
    v3 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)isInstrumentalBreak
{
  return self->_instrumentalBreak;
}

- (void)setInstrumentalBreak:(BOOL)a3
{
  self->_instrumentalBreak = a3;
}

- (int64_t)lineIndex
{
  return self->_lineIndex;
}

- (void)setLineIndex:(int64_t)a3
{
  self->_lineIndex = a3;
}

- (int64_t)originalLineIndex
{
  return self->_originalLineIndex;
}

- (void)setOriginalLineIndex:(int64_t)a3
{
  self->_originalLineIndex = a3;
}

- (MSVLyricsSection)parentSection
{
  return (MSVLyricsSection *)objc_loadWeakRetained((id *)&self->_parentSection);
}

- (void)setParentSection:(id)a3
{
  objc_storeWeak((id *)&self->_parentSection, a3);
}

- (MSVLyricsLine)nextLine
{
  return self->_nextLine;
}

- (void)setNextLine:(id)a3
{
  objc_storeStrong((id *)&self->_nextLine, a3);
}

- (NSArray)words
{
  return self->_words;
}

- (void)setWords:(id)a3
{
  objc_storeStrong((id *)&self->_words, a3);
}

- (NSString)translationKey
{
  return self->_translationKey;
}

- (void)setTranslationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (BOOL)hasBackgroundVocal
{
  return self->_hasBackgroundVocal;
}

- (void)setHasBackgroundVocal:(BOOL)a3
{
  self->_hasBackgroundVocal = a3;
}

- (MSVLyricsWord)backgroundVocals
{
  return self->_backgroundVocals;
}

- (void)setBackgroundVocals:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundVocals, a3);
}

- (void)setPrimaryVocalText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryVocalText, 0);
  objc_storeStrong((id *)&self->_backgroundVocals, 0);
  objc_storeStrong((id *)&self->_translationKey, 0);
  objc_storeStrong((id *)&self->_words, 0);
  objc_storeStrong((id *)&self->_nextLine, 0);
  objc_destroyWeak((id *)&self->_parentSection);
}

@end
