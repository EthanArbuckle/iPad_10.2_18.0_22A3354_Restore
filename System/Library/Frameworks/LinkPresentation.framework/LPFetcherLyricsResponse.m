@implementation LPFetcherLyricsResponse

- (LPFetcherLyricsResponse)initWithLyrics:(id)a3 fetcher:(id)a4
{
  id v7;
  LPFetcherLyricsResponse *v8;
  LPFetcherLyricsResponse *v9;
  LPFetcherLyricsResponse *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPFetcherLyricsResponse;
  v8 = -[LPFetcherResponse initWithState:fetcher:](&v12, sel_initWithState_fetcher_, 2, a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_lyrics, a3);
    v10 = v9;
  }

  return v9;
}

- (LPLyricExcerptMetadata)lyrics
{
  return self->_lyrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lyrics, 0);
}

@end
