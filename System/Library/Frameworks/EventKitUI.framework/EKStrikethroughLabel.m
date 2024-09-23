@implementation EKStrikethroughLabel

- (void)setText:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double hyphenationFactor;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_drawsStrikethrough)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E606F180, *MEMORY[0x1E0DC11A8]);
  if (self->_firstLineHeadIndent != 0.0 || self->_hyphenationFactor != 0.0)
  {
    objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "setFirstLineHeadIndent:", self->_firstLineHeadIndent);
    hyphenationFactor = self->_hyphenationFactor;
    *(float *)&hyphenationFactor = hyphenationFactor;
    objc_msgSend(v7, "setHyphenationFactor:", hyphenationFactor);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0DC1178]);

  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v5, v10);

  -[EKStrikethroughLabel setAttributedText:](self, "setAttributedText:", v9);
}

- (void)setDrawsStrikethrough:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_drawsStrikethrough != a3)
  {
    self->_drawsStrikethrough = a3;
    -[EKStrikethroughLabel text](self, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[EKStrikethroughLabel text](self, "text");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[EKStrikethroughLabel setText:](self, "setText:", v5);

    }
  }
}

- (void)setFirstLineHeadIndent:(double)a3
{
  void *v4;
  id v5;

  if (self->_firstLineHeadIndent != a3)
  {
    self->_firstLineHeadIndent = a3;
    -[EKStrikethroughLabel text](self, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[EKStrikethroughLabel text](self, "text");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[EKStrikethroughLabel setText:](self, "setText:", v5);

    }
  }
}

- (void)setHyphenationFactor:(double)a3
{
  void *v4;
  id v5;

  if (self->_hyphenationFactor != a3)
  {
    self->_hyphenationFactor = a3;
    -[EKStrikethroughLabel text](self, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[EKStrikethroughLabel text](self, "text");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[EKStrikethroughLabel setText:](self, "setText:", v5);

    }
  }
}

- (BOOL)drawsStrikethrough
{
  return self->_drawsStrikethrough;
}

- (double)firstLineHeadIndent
{
  return self->_firstLineHeadIndent;
}

- (double)hyphenationFactor
{
  return self->_hyphenationFactor;
}

@end
