@implementation MSVLyricsWord

- (MSVLyricsWord)init
{
  MSVLyricsWord *v2;
  MSVLyricsWord *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSVLyricsWord;
  v2 = -[MSVLyricsTextElement init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[MSVLyricsElement setType:](v2, "setType:", 2);
  return v3;
}

- (id)agent
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MSVLyricsWord;
  -[MSVLyricsElement agent](&v8, sel_agent);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[MSVLyricsWord parentLine](self, "parentLine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "agent");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (MSVLyricsLine)parentLine
{
  return (MSVLyricsLine *)objc_loadWeakRetained((id *)&self->_parentLine);
}

- (void)setParentLine:(id)a3
{
  objc_storeWeak((id *)&self->_parentLine, a3);
}

- (MSVLyricsWord)nextWord
{
  return self->_nextWord;
}

- (void)setNextWord:(id)a3
{
  objc_storeStrong((id *)&self->_nextWord, a3);
}

- (MSVLyricsWord)parentWord
{
  return (MSVLyricsWord *)objc_loadWeakRetained((id *)&self->_parentWord);
}

- (void)setParentWord:(id)a3
{
  objc_storeWeak((id *)&self->_parentWord, a3);
}

- (NSArray)subwords
{
  return self->_subwords;
}

- (void)setSubwords:(id)a3
{
  objc_storeStrong((id *)&self->_subwords, a3);
}

- (_NSRange)characterRange
{
  _NSRange *p_characterRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_characterRange = &self->_characterRange;
  location = self->_characterRange.location;
  length = p_characterRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setCharacterRange:(_NSRange)a3
{
  self->_characterRange = a3;
}

- (int64_t)wordIndex
{
  return self->_wordIndex;
}

- (void)setWordIndex:(int64_t)a3
{
  self->_wordIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subwords, 0);
  objc_destroyWeak((id *)&self->_parentWord);
  objc_storeStrong((id *)&self->_nextWord, 0);
  objc_destroyWeak((id *)&self->_parentLine);
}

@end
