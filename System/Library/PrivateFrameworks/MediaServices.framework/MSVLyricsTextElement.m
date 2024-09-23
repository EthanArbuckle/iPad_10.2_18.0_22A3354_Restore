@implementation MSVLyricsTextElement

- (MSVLyricsTextElement)init
{
  MSVLyricsTextElement *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSVLyricsTextElement;
  v2 = -[MSVLyricsTextElement init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSVLyricsXMLElement setMutableText:](v2, "setMutableText:", v3);

  }
  return v2;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MSVLyricsTextElement lyricsText](self, "lyricsText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)MSVLyricsTextElement;
  -[MSVLyricsElement description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Text: \"%@\", lyrics element: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSAttributedString)lyricsText
{
  return self->_lyricsText;
}

- (void)setLyricsText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)keepParentheses
{
  return self->_keepParentheses;
}

- (void)setKeepParentheses:(BOOL)a3
{
  self->_keepParentheses = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lyricsText, 0);
}

@end
