@implementation MSVLyricsTranslationText

- (MSVLyricsTranslationText)init
{
  MSVLyricsTranslationText *v2;
  MSVLyricsTranslationText *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSVLyricsTranslationText;
  v2 = -[MSVLyricsLine init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[MSVLyricsElement setType:](v2, "setType:", 3);
  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MSVLyricsTranslationText lyricsLineKey](self, "lyricsLineKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)MSVLyricsTranslationText;
  -[MSVLyricsLine description](&v9, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> key: %@, lyrics line: %@"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)lyricsLineKey
{
  return self->_lyricsLineKey;
}

- (void)setLyricsLineKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lyricsLineKey, 0);
}

@end
